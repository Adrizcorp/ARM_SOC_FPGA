/*
 * main.c/
 *
 *  Created on: Aug 11, 2016
 *      Author: Holguer
 */


#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/mman.h>
#include "hpss.h"
#include "hps.h"

int   physical_memory_fd = -1;//bandera
void *ports_base;// el puerto AXI para acceso
void *lw_ports_base;// el axi lw
volatile unsigned long *h2p_lw_div_addr=NULL;// direccion de divisor freq
#define ALT_AXI_FPGASLVS_OFST ( 0xC0000000 )// offset direccion AXI
#define HW_REGS_SPAN ( 0x40000000 )
#define HW_REGS_MASK ( HW_REGS_SPAN - 1 )

struct  fifo32 {
    volatile u_int32_t  *data_port;
    volatile u_int32_t  *fill_level_port;
    volatile u_int32_t  *status_port;
};


#define FIFO_FILL_LEVEL     0
#define FIFO_STATUS         4
#define FIFO_STATUS_FULL    0x01
#define FIFO_STATUS_EMPTY   0x02
#define FIFO_EVENT          8
#define FIFO_INTERRUPT_ENABLE   12
#define FIFO_ALMOST_FULL    16
#define FIFO_ALMOST_EMPTY   20


void init_hw(){
    if (physical_memory_fd < 0)
        physical_memory_fd = open("/dev/mem", O_RDWR | O_SYNC);
    if (physical_memory_fd < 0) {
        printf("Failed to open /dev/mem for read/write -- permissions perhaps?\n");
        exit(-__LINE__);
    }
    //axi
    ports_base = mmap( NULL, HW_REGS_SPAN, ( PROT_READ | PROT_WRITE ), MAP_SHARED, physical_memory_fd, ALT_AXI_FPGASLVS_OFST);

    if (ports_base == MAP_FAILED) {
        printf("Failed to mmap physical memory page.\n");
        exit(-__LINE__);
    }

    //lw axi
    lw_ports_base= mmap( NULL, 0x04000000, ( PROT_READ | PROT_WRITE ), MAP_SHARED, physical_memory_fd, ALT_STM_OFST);

    if (lw_ports_base == MAP_FAILED) {
        printf("Failed to mmap physical memory page.\n");
        exit(-__LINE__);
    }
    h2p_lw_div_addr= lw_ports_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST+ DIV_FREQ_BASE ) & ( unsigned long)( 0x04000000-1 ) );

}

//acceso al div freq
void set_div_freq(int frecuencia){

	if(frecuencia==0){return;}
	*(unsigned int *)h2p_lw_div_addr = (unsigned int)(50000000/(2*frecuencia))-1;
}

void fifo32_init(
    struct fifo32      *fifo,
    u_int32_t   data_address,
    u_int32_t   status_address)
{

	fifo->data_port = (u_int32_t *) (data_address + (u_int32_t)ports_base);
    fifo->fill_level_port = (u_int32_t *) (status_address + FIFO_FILL_LEVEL + (u_int32_t)ports_base);
    fifo->status_port = (u_int32_t *) (status_address + FIFO_STATUS + (u_int32_t)ports_base);

    printf("ports_base = %p\n", ports_base);
    printf("data_port = %p\n", fifo->data_port);
    printf("fill_level_port = %p\n", fifo->fill_level_port);
    printf("status_port = %p\n", fifo->status_port);
}


int fifo32_empty(struct fifo32 *fifo) {
    return (*fifo->status_port & FIFO_STATUS_EMPTY) ? 1 : 0;
}

int fifo32_full(struct fifo32 *fifo) {
    return (*fifo->status_port & FIFO_STATUS_FULL) ? 1 : 0;
}

u_int32_t fifo32_read(struct fifo32 *fifo) {
    while (fifo32_empty(fifo))
        ;
    return *fifo->data_port;
}

u_int32_t fifo32_entries(struct fifo32 *fifo) {
    return *fifo->fill_level_port;
}

void fifo32_write(struct fifo32 *fifo, u_int32_t  v) {
    while (fifo32_full(fifo));
    *fifo->data_port = v;
}

unsigned int data_temp[640*480];

int main(int argc, char *argv[]){

   struct  fifo32  video;// acceso a los registros del FIFO
   unsigned int counter;

	//se abren e inicializan los puertos
	init_hw();

	//inicializar el FIFO
	fifo32_init(&video, VIDEO_INPUT_OUT_BASE, VIDEO_INPUT_OUT_CSR_BASE);

	 FILE * pFile;
	 pFile = fopen ("video.bin","wb");
	 if (pFile!=NULL)
	   {
	     fputs ("fopen example",pFile);
	     fclose (pFile);
	   }

	 while(counter<307200){
		 data_temp[counter]=fifo32_read(&video);
         counter++;
	 }

	 fwrite ((const void *)&data_temp[0] ,sizeof(unsigned int),counter,pFile);


	 fclose(pFile);


	//cerrarlos
	if (physical_memory_fd >= 0){
	    close(physical_memory_fd);
	}
	return 0 ;
}
