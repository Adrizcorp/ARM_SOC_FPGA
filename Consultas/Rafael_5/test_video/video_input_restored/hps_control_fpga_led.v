// ============================================================================
// Copyright (c) 2014 by Terasic Technologies Inc.
// ============================================================================
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// ============================================================================
//           
//  Terasic Technologies Inc
//  9F., No.176, Sec.2, Gongdao 5th Rd, East Dist, Hsinchu City, 30070. Taiwan
//  
//  
//                     web: http://www.terasic.com/  
//                     email: support@terasic.com
//
// ============================================================================
//Date:  Tue Dec  2 09:28:38 2014
// ============================================================================

`define ENABLE_HPS
//`define ENABLE_CLK

module HPS_CONTROL_FPGA_LED(

      ///////// ADC /////////
      output             ADC_CONVST,
      output             ADC_SCK,
      output             ADC_SDI,
      input              ADC_SDO,

      ///////// ARDUINO /////////
      inout       [15:0] ARDUINO_IO,
      inout              ARDUINO_RESET_N,

`ifdef ENABLE_CLK
      ///////// CLK /////////
      output             CLK_I2C_SCL,
      inout              CLK_I2C_SDA,
`endif /*ENABLE_CLK*/

      ///////// FPGA /////////
      input              FPGA_CLK1_50,
      input              FPGA_CLK2_50,
      input              FPGA_CLK3_50,

      ///////// GPIO /////////
      inout       [35:0] GPIO_0,
      inout       [35:0] GPIO_1,

`ifdef ENABLE_HPS
      ///////// HPS /////////
      inout              HPS_CONV_USB_N,
      output      [14:0] HPS_DDR3_ADDR,
      output      [2:0]  HPS_DDR3_BA,
      output             HPS_DDR3_CAS_N,
      output             HPS_DDR3_CKE,
      output             HPS_DDR3_CK_N,
      output             HPS_DDR3_CK_P,
      output             HPS_DDR3_CS_N,
      output      [3:0]  HPS_DDR3_DM,
      inout       [31:0] HPS_DDR3_DQ,
      inout       [3:0]  HPS_DDR3_DQS_N,
      inout       [3:0]  HPS_DDR3_DQS_P,
      output             HPS_DDR3_ODT,
      output             HPS_DDR3_RAS_N,
      output             HPS_DDR3_RESET_N,
      input              HPS_DDR3_RZQ,
      output             HPS_DDR3_WE_N,
      output             HPS_ENET_GTX_CLK,
      inout              HPS_ENET_INT_N,
      output             HPS_ENET_MDC,
      inout              HPS_ENET_MDIO,
      input              HPS_ENET_RX_CLK,
      input       [3:0]  HPS_ENET_RX_DATA,
      input              HPS_ENET_RX_DV,
      output      [3:0]  HPS_ENET_TX_DATA,
      output             HPS_ENET_TX_EN,
      inout              HPS_GSENSOR_INT,
      inout              HPS_I2C0_SCLK,
      inout              HPS_I2C0_SDAT,
      inout              HPS_I2C1_SCLK,
      inout              HPS_I2C1_SDAT,
      inout              HPS_KEY,
      inout              HPS_LED,
      inout              HPS_LTC_GPIO,
      output             HPS_SD_CLK,
      inout              HPS_SD_CMD,
      inout       [3:0]  HPS_SD_DATA,
      output             HPS_SPIM_CLK,
      input              HPS_SPIM_MISO,
      output             HPS_SPIM_MOSI,
      inout              HPS_SPIM_SS,
      input              HPS_UART_RX,
      output             HPS_UART_TX,
      input              HPS_USB_CLKOUT,
      inout       [7:0]  HPS_USB_DATA,
      input              HPS_USB_DIR,
      input              HPS_USB_NXT,
      output             HPS_USB_STP,
`endif /*ENABLE_HPS*/

      ///////// KEY /////////
      input       [1:0]  KEY,

      ///////// LED /////////
      output      [7:0]  LED,

      ///////// SW /////////
      input       [3:0]  SW
);


//=======================================================
//  REG/WIRE declarations
//=======================================================
wire  hps_fpga_reset_n=1'b1;


wire [31:0]nota;

wire sampler,sampler_wync;
wire [31:0]read_data_fifo;
wire wait_a_while;
wire read_fifo;
reg [31:0]audio;

////	VGA Controller
wire [10:0]CounterX;
wire [10:0]CounterY;
reg [3:0]vga_R,vga_G,vga_B;
wire video_on;
wire V_SYNC;
wire H_SYNC;
wire VGA_CLK;
wire clk_25mhz;
wire clk_125mhz;
wire [31:0]video_input_register;
wire wait_fifo_video_2_write;
wire write_pixel_video;
//=======================================================
//  Structural coding
//=======================================================


 soc_system u0 (
		//Clock&Reset
	  .clk_clk                               (FPGA_CLK1_50 ),                               //                            clk.clk
	  .reset_reset_n                         (1'b1         ),                         //                          reset.reset_n
	  //HPS ddr3
	  .memory_mem_a                          ( HPS_DDR3_ADDR),                       //                memory.mem_a
	  .memory_mem_ba                         ( HPS_DDR3_BA),                         //                .mem_ba
	  .memory_mem_ck                         ( HPS_DDR3_CK_P),                       //                .mem_ck
	  .memory_mem_ck_n                       ( HPS_DDR3_CK_N),                       //                .mem_ck_n
	  .memory_mem_cke                        ( HPS_DDR3_CKE),                        //                .mem_cke
	  .memory_mem_cs_n                       ( HPS_DDR3_CS_N),                       //                .mem_cs_n
	  .memory_mem_ras_n                      ( HPS_DDR3_RAS_N),                      //                .mem_ras_n
	  .memory_mem_cas_n                      ( HPS_DDR3_CAS_N),                      //                .mem_cas_n
	  .memory_mem_we_n                       ( HPS_DDR3_WE_N),                       //                .mem_we_n
	  .memory_mem_reset_n                    ( HPS_DDR3_RESET_N),                    //                .mem_reset_n
	  .memory_mem_dq                         ( HPS_DDR3_DQ),                         //                .mem_dq
	  .memory_mem_dqs                        ( HPS_DDR3_DQS_P),                      //                .mem_dqs
	  .memory_mem_dqs_n                      ( HPS_DDR3_DQS_N),                      //                .mem_dqs_n
	  .memory_mem_odt                        ( HPS_DDR3_ODT),                        //                .mem_odt
	  .memory_mem_dm                         ( HPS_DDR3_DM),                         //                .mem_dm
	  .memory_oct_rzqin                      ( HPS_DDR3_RZQ),                        //                .oct_rzqin                                  
	  //HPS ethernet		
	  .hps_0_hps_io_hps_io_emac1_inst_TX_CLK ( HPS_ENET_GTX_CLK),       //                             hps_0_hps_io.hps_io_emac1_inst_TX_CLK
	  .hps_0_hps_io_hps_io_emac1_inst_TXD0   ( HPS_ENET_TX_DATA[0] ),   //                             .hps_io_emac1_inst_TXD0
	  .hps_0_hps_io_hps_io_emac1_inst_TXD1   ( HPS_ENET_TX_DATA[1] ),   //                             .hps_io_emac1_inst_TXD1
	  .hps_0_hps_io_hps_io_emac1_inst_TXD2   ( HPS_ENET_TX_DATA[2] ),   //                             .hps_io_emac1_inst_TXD2
	  .hps_0_hps_io_hps_io_emac1_inst_TXD3   ( HPS_ENET_TX_DATA[3] ),   //                             .hps_io_emac1_inst_TXD3
	  .hps_0_hps_io_hps_io_emac1_inst_RXD0   ( HPS_ENET_RX_DATA[0] ),   //                             .hps_io_emac1_inst_RXD0
	  .hps_0_hps_io_hps_io_emac1_inst_MDIO   ( HPS_ENET_MDIO ),         //                             .hps_io_emac1_inst_MDIO
	  .hps_0_hps_io_hps_io_emac1_inst_MDC    ( HPS_ENET_MDC  ),         //                             .hps_io_emac1_inst_MDC
	  .hps_0_hps_io_hps_io_emac1_inst_RX_CTL ( HPS_ENET_RX_DV),         //                             .hps_io_emac1_inst_RX_CTL
	  .hps_0_hps_io_hps_io_emac1_inst_TX_CTL ( HPS_ENET_TX_EN),         //                             .hps_io_emac1_inst_TX_CTL
	  .hps_0_hps_io_hps_io_emac1_inst_RX_CLK ( HPS_ENET_RX_CLK),        //                             .hps_io_emac1_inst_RX_CLK
	  .hps_0_hps_io_hps_io_emac1_inst_RXD1   ( HPS_ENET_RX_DATA[1] ),   //                             .hps_io_emac1_inst_RXD1
	  .hps_0_hps_io_hps_io_emac1_inst_RXD2   ( HPS_ENET_RX_DATA[2] ),   //                             .hps_io_emac1_inst_RXD2
	  .hps_0_hps_io_hps_io_emac1_inst_RXD3   ( HPS_ENET_RX_DATA[3] ),   //                             .hps_io_emac1_inst_RXD3		  
	  //HPS SD card 
	  .hps_0_hps_io_hps_io_sdio_inst_CMD     ( HPS_SD_CMD    ),           //                               .hps_io_sdio_inst_CMD
	  .hps_0_hps_io_hps_io_sdio_inst_D0      ( HPS_SD_DATA[0]     ),      //                               .hps_io_sdio_inst_D0
	  .hps_0_hps_io_hps_io_sdio_inst_D1      ( HPS_SD_DATA[1]     ),      //                               .hps_io_sdio_inst_D1
	  .hps_0_hps_io_hps_io_sdio_inst_CLK     ( HPS_SD_CLK   ),            //                               .hps_io_sdio_inst_CLK
	  .hps_0_hps_io_hps_io_sdio_inst_D2      ( HPS_SD_DATA[2]     ),      //                               .hps_io_sdio_inst_D2
	  .hps_0_hps_io_hps_io_sdio_inst_D3      ( HPS_SD_DATA[3]     ),      //                               .hps_io_sdio_inst_D3
	  //HPS USB 		  
	  .hps_0_hps_io_hps_io_usb1_inst_D0      ( HPS_USB_DATA[0]    ),      //                               .hps_io_usb1_inst_D0
	  .hps_0_hps_io_hps_io_usb1_inst_D1      ( HPS_USB_DATA[1]    ),      //                               .hps_io_usb1_inst_D1
	  .hps_0_hps_io_hps_io_usb1_inst_D2      ( HPS_USB_DATA[2]    ),      //                               .hps_io_usb1_inst_D2
	  .hps_0_hps_io_hps_io_usb1_inst_D3      ( HPS_USB_DATA[3]    ),      //                               .hps_io_usb1_inst_D3
	  .hps_0_hps_io_hps_io_usb1_inst_D4      ( HPS_USB_DATA[4]    ),      //                               .hps_io_usb1_inst_D4
	  .hps_0_hps_io_hps_io_usb1_inst_D5      ( HPS_USB_DATA[5]    ),      //                               .hps_io_usb1_inst_D5
	  .hps_0_hps_io_hps_io_usb1_inst_D6      ( HPS_USB_DATA[6]    ),      //                               .hps_io_usb1_inst_D6
	  .hps_0_hps_io_hps_io_usb1_inst_D7      ( HPS_USB_DATA[7]    ),      //                               .hps_io_usb1_inst_D7
	  .hps_0_hps_io_hps_io_usb1_inst_CLK     ( HPS_USB_CLKOUT    ),       //                               .hps_io_usb1_inst_CLK
	  .hps_0_hps_io_hps_io_usb1_inst_STP     ( HPS_USB_STP    ),          //                               .hps_io_usb1_inst_STP
	  .hps_0_hps_io_hps_io_usb1_inst_DIR     ( HPS_USB_DIR    ),          //                               .hps_io_usb1_inst_DIR
	  .hps_0_hps_io_hps_io_usb1_inst_NXT     ( HPS_USB_NXT    ),          //                               .hps_io_usb1_inst_NXT
		//HPS SPI 		  
	  .hps_0_hps_io_hps_io_spim1_inst_CLK    ( HPS_SPIM_CLK  ),           //                               .hps_io_spim1_inst_CLK
	  .hps_0_hps_io_hps_io_spim1_inst_MOSI   ( HPS_SPIM_MOSI ),           //                               .hps_io_spim1_inst_MOSI
	  .hps_0_hps_io_hps_io_spim1_inst_MISO   ( HPS_SPIM_MISO ),           //                               .hps_io_spim1_inst_MISO
	  .hps_0_hps_io_hps_io_spim1_inst_SS0    ( HPS_SPIM_SS   ),             //                               .hps_io_spim1_inst_SS0
		//HPS UART		
	  .hps_0_hps_io_hps_io_uart0_inst_RX     ( HPS_UART_RX   ),          //                               .hps_io_uart0_inst_RX
	  .hps_0_hps_io_hps_io_uart0_inst_TX     ( HPS_UART_TX   ),          //                               .hps_io_uart0_inst_TX
		//HPS I2C1
	  .hps_0_hps_io_hps_io_i2c0_inst_SDA     ( HPS_I2C0_SDAT  ),        //                               .hps_io_i2c0_inst_SDA
	  .hps_0_hps_io_hps_io_i2c0_inst_SCL     ( HPS_I2C0_SCLK  ),        //                               .hps_io_i2c0_inst_SCL
		//HPS I2C2
	  .hps_0_hps_io_hps_io_i2c1_inst_SDA     ( HPS_I2C1_SDAT  ),        //                               .hps_io_i2c1_inst_SDA
	  .hps_0_hps_io_hps_io_i2c1_inst_SCL     ( HPS_I2C1_SCLK  ),        //                               .hps_io_i2c1_inst_SCL
		//GPIO 
	  .hps_0_hps_io_hps_io_gpio_inst_GPIO09  ( HPS_CONV_USB_N ),  //                               .hps_io_gpio_inst_GPIO09
	  .hps_0_hps_io_hps_io_gpio_inst_GPIO35  ( HPS_ENET_INT_N ),  //                               .hps_io_gpio_inst_GPIO35
	  .hps_0_hps_io_hps_io_gpio_inst_GPIO40  ( HPS_LTC_GPIO   ),  //                               .hps_io_gpio_inst_GPIO40
	  .hps_0_hps_io_hps_io_gpio_inst_GPIO53  ( HPS_LED   ),  //                               .hps_io_gpio_inst_GPIO53
	  .hps_0_hps_io_hps_io_gpio_inst_GPIO54  ( HPS_KEY   ),  //                               .hps_io_gpio_inst_GPIO54
	  .hps_0_hps_io_hps_io_gpio_inst_GPIO61  ( HPS_GSENSOR_INT ),  //                               .hps_io_gpio_inst_GPIO61
		//FPGA Partion
	  .led_pio_external_connection_export    ( LED	),    //    led_pio_external_connection.export
	  .dipsw_pio_external_connection_export  ( SW	),  //  dipsw_pio_external_connection.export
	  .button_pio_external_connection_export ( KEY	), // button_pio_external_connection.export
	  .hps_0_h2f_reset_reset_n               (hps_fpga_reset_n ),                //                hps_0_h2f_reset.reset_n
	  
	  .div_freq_export                       (nota[31:0])  ,

 	   .clk_125mhz_clk                        (clk_125mhz),                        //                     clk_125mhz.clk
      .reset_0_reset_n                       (1'b1),                       //                        reset_0.reset_n
      .video_input_in_writedata              (video_input_register[31:0]),              //                 video_input_in.writedata
      .video_input_in_write                  (write_pixel_video),                  //                               .write
      .video_input_in_waitrequest            (wait_fifo_video_2_write)             //
		
		/*
	  .video_input_in_writedata              (<connected-to-video_input_in_writedata>),              //                 video_input_in.writedata
	  .video_input_in_write                  (<connected-to-video_input_in_write>),                  //                               .write
	  .video_input_in_waitrequest            (<connected-to-video_input_in_waitrequest>),            //                               .waitrequest
	  .video_input_9_in_writedata            (<connected-to-video_input_9_in_writedata>),            //               video_input_9_in.writedata
	  .video_input_9_in_write                (<connected-to-video_input_9_in_write>),                //                               .write
	  .video_input_9_in_waitrequest          (<connected-to-video_input_9_in_waitrequest>),          //                               .waitrequest
	  .video_input_8_in_writedata            (<connected-to-video_input_8_in_writedata>),            //               video_input_8_in.writedata
	  .video_input_8_in_write                (<connected-to-video_input_8_in_write>),                //                               .write
	  .video_input_8_in_waitrequest          (<connected-to-video_input_8_in_waitrequest>),          //                               .waitrequest
	  .video_input_7_in_writedata            (<connected-to-video_input_7_in_writedata>),            //               video_input_7_in.writedata
	  .video_input_7_in_write                (<connected-to-video_input_7_in_write>),                //                               .write
	  .video_input_7_in_waitrequest          (<connected-to-video_input_7_in_waitrequest>),          //                               .waitrequest
	  .video_input_6_in_writedata            (<connected-to-video_input_6_in_writedata>),            //               video_input_6_in.writedata
	  .video_input_6_in_write                (<connected-to-video_input_6_in_write>),                //                               .write
	  .video_input_6_in_waitrequest          (<connected-to-video_input_6_in_waitrequest>),          //                               .waitrequest
	  .video_input_5_in_writedata            (<connected-to-video_input_5_in_writedata>),            //               video_input_5_in.writedata
	  .video_input_5_in_write                (<connected-to-video_input_5_in_write>),                //                               .write
	  .video_input_5_in_waitrequest          (<connected-to-video_input_5_in_waitrequest>),          //                               .waitrequest
	  .video_input_4_in_writedata            (<connected-to-video_input_4_in_writedata>),            //               video_input_4_in.writedata
	  .video_input_4_in_write                (<connected-to-video_input_4_in_write>),                //                               .write
	  .video_input_4_in_waitrequest          (<connected-to-video_input_4_in_waitrequest>),          //                               .waitrequest
	  .video_input_3_in_writedata            (<connected-to-video_input_3_in_writedata>),            //               video_input_3_in.writedata
	  .video_input_3_in_write                (<connected-to-video_input_3_in_write>),                //                               .write
	  .video_input_3_in_waitrequest          (<connected-to-video_input_3_in_waitrequest>),          //                               .waitrequest
	  .video_input_2_in_writedata            (<connected-to-video_input_2_in_writedata>),            //               video_input_2_in.writedata
	  .video_input_2_in_write                (<connected-to-video_input_2_in_write>),                //                               .write
	  .video_input_2_in_waitrequest          (<connected-to-video_input_2_in_waitrequest>),           //             
	  .video_input_0_in_writedata            (<connected-to-video_input_0_in_writedata>),            //               video_input_0_in.writedata
	  .video_input_0_in_write                (<connected-to-video_input_0_in_write>),                //                               .write
	  .video_input_0_in_waitrequest          (<connected-to-video_input_0_in_waitrequest>),          //                               .waitrequest
	  .video_input_1_in_writedata            (<connected-to-video_input_1_in_writedata>),            //               video_input_1_in.writedata
	  .video_input_1_in_write                (<connected-to-video_input_1_in_write>),                //                               .write
	  .video_input_1_in_waitrequest          (<connected-to-video_input_1_in_waitrequest>)           //        
	  */
 );


///video de entrada
pll_25Juego pll_25Juego_inst
(
	.refclk(FPGA_CLK1_50) ,	// input  refclk_sig
	.rst(1'b0) ,	// input  rst_sig
	.outclk_0(clk_25mhz) ,	// output  outclk_0_sig
	.outclk_1(clk_125mhz) 	// output  outclk_1_sig
);


simulacion_test_busqueda simulacion_test_busqueda_inst
(
	.clk(clk_125mhz) ,	// input  clk_sig
	.start(SW[0]) ,	// input  start_sig
	.finish() ,	// output  finish_sig
	.idle() ,	// output  idle_sig
	.vector_wait_fifo_sig(wait_fifo_video_2_write) ,	// input  vector_wait_fifo_sig_sig
	.img_wait_fifo_sig(1'd0) ,	// input  img_wait_fifo_sig_sig
	.vector_me_sig(video_input_register[27:0]) ,	// output [27:0] vector_me_sig_sig
	.img_mb_sig() ,	// output [25:0] img_mb_sig_sig
	.img_wr_req_sig() ,	// output  img_wr_req_sig_sig
	.vector_wr_req_sig(write_pixel_video) ,	// output  vector_wr_req_sig_sig
	.real_state() ,	// output [4:0] real_state_sig
	._realref() ,	// output [13:0] _realref_sig
	._realact() ,	// output [13:0] _realact_sig
	.window_limit(14'd4800)	// output [27:0] vector_me_sig_reg_sig
);

endmodule
