
module soc_system (
	button_pio_external_connection_export,
	clk_clk,
	clk_125mhz_clk,
	dipsw_pio_external_connection_export,
	div_freq_export,
	hps_0_h2f_reset_reset_n,
	hps_0_hps_io_hps_io_emac1_inst_TX_CLK,
	hps_0_hps_io_hps_io_emac1_inst_TXD0,
	hps_0_hps_io_hps_io_emac1_inst_TXD1,
	hps_0_hps_io_hps_io_emac1_inst_TXD2,
	hps_0_hps_io_hps_io_emac1_inst_TXD3,
	hps_0_hps_io_hps_io_emac1_inst_RXD0,
	hps_0_hps_io_hps_io_emac1_inst_MDIO,
	hps_0_hps_io_hps_io_emac1_inst_MDC,
	hps_0_hps_io_hps_io_emac1_inst_RX_CTL,
	hps_0_hps_io_hps_io_emac1_inst_TX_CTL,
	hps_0_hps_io_hps_io_emac1_inst_RX_CLK,
	hps_0_hps_io_hps_io_emac1_inst_RXD1,
	hps_0_hps_io_hps_io_emac1_inst_RXD2,
	hps_0_hps_io_hps_io_emac1_inst_RXD3,
	hps_0_hps_io_hps_io_sdio_inst_CMD,
	hps_0_hps_io_hps_io_sdio_inst_D0,
	hps_0_hps_io_hps_io_sdio_inst_D1,
	hps_0_hps_io_hps_io_sdio_inst_CLK,
	hps_0_hps_io_hps_io_sdio_inst_D2,
	hps_0_hps_io_hps_io_sdio_inst_D3,
	hps_0_hps_io_hps_io_usb1_inst_D0,
	hps_0_hps_io_hps_io_usb1_inst_D1,
	hps_0_hps_io_hps_io_usb1_inst_D2,
	hps_0_hps_io_hps_io_usb1_inst_D3,
	hps_0_hps_io_hps_io_usb1_inst_D4,
	hps_0_hps_io_hps_io_usb1_inst_D5,
	hps_0_hps_io_hps_io_usb1_inst_D6,
	hps_0_hps_io_hps_io_usb1_inst_D7,
	hps_0_hps_io_hps_io_usb1_inst_CLK,
	hps_0_hps_io_hps_io_usb1_inst_STP,
	hps_0_hps_io_hps_io_usb1_inst_DIR,
	hps_0_hps_io_hps_io_usb1_inst_NXT,
	hps_0_hps_io_hps_io_spim1_inst_CLK,
	hps_0_hps_io_hps_io_spim1_inst_MOSI,
	hps_0_hps_io_hps_io_spim1_inst_MISO,
	hps_0_hps_io_hps_io_spim1_inst_SS0,
	hps_0_hps_io_hps_io_uart0_inst_RX,
	hps_0_hps_io_hps_io_uart0_inst_TX,
	hps_0_hps_io_hps_io_i2c0_inst_SDA,
	hps_0_hps_io_hps_io_i2c0_inst_SCL,
	hps_0_hps_io_hps_io_i2c1_inst_SDA,
	hps_0_hps_io_hps_io_i2c1_inst_SCL,
	hps_0_hps_io_hps_io_gpio_inst_GPIO09,
	hps_0_hps_io_hps_io_gpio_inst_GPIO35,
	hps_0_hps_io_hps_io_gpio_inst_GPIO40,
	hps_0_hps_io_hps_io_gpio_inst_GPIO53,
	hps_0_hps_io_hps_io_gpio_inst_GPIO54,
	hps_0_hps_io_hps_io_gpio_inst_GPIO61,
	led_pio_external_connection_export,
	memory_mem_a,
	memory_mem_ba,
	memory_mem_ck,
	memory_mem_ck_n,
	memory_mem_cke,
	memory_mem_cs_n,
	memory_mem_ras_n,
	memory_mem_cas_n,
	memory_mem_we_n,
	memory_mem_reset_n,
	memory_mem_dq,
	memory_mem_dqs,
	memory_mem_dqs_n,
	memory_mem_odt,
	memory_mem_dm,
	memory_oct_rzqin,
	reset_reset_n,
	reset_0_reset_n,
	video_input_in_writedata,
	video_input_in_write,
	video_input_in_waitrequest,
	video_input_9_in_writedata,
	video_input_9_in_write,
	video_input_9_in_waitrequest,
	video_input_8_in_writedata,
	video_input_8_in_write,
	video_input_8_in_waitrequest,
	video_input_7_in_writedata,
	video_input_7_in_write,
	video_input_7_in_waitrequest,
	video_input_6_in_writedata,
	video_input_6_in_write,
	video_input_6_in_waitrequest,
	video_input_5_in_writedata,
	video_input_5_in_write,
	video_input_5_in_waitrequest,
	video_input_4_in_writedata,
	video_input_4_in_write,
	video_input_4_in_waitrequest,
	video_input_3_in_writedata,
	video_input_3_in_write,
	video_input_3_in_waitrequest,
	video_input_2_in_writedata,
	video_input_2_in_write,
	video_input_2_in_waitrequest,
	video_input_0_in_writedata,
	video_input_0_in_write,
	video_input_0_in_waitrequest,
	video_input_1_in_writedata,
	video_input_1_in_write,
	video_input_1_in_waitrequest);	

	input	[3:0]	button_pio_external_connection_export;
	input		clk_clk;
	input		clk_125mhz_clk;
	input	[3:0]	dipsw_pio_external_connection_export;
	output	[31:0]	div_freq_export;
	output		hps_0_h2f_reset_reset_n;
	output		hps_0_hps_io_hps_io_emac1_inst_TX_CLK;
	output		hps_0_hps_io_hps_io_emac1_inst_TXD0;
	output		hps_0_hps_io_hps_io_emac1_inst_TXD1;
	output		hps_0_hps_io_hps_io_emac1_inst_TXD2;
	output		hps_0_hps_io_hps_io_emac1_inst_TXD3;
	input		hps_0_hps_io_hps_io_emac1_inst_RXD0;
	inout		hps_0_hps_io_hps_io_emac1_inst_MDIO;
	output		hps_0_hps_io_hps_io_emac1_inst_MDC;
	input		hps_0_hps_io_hps_io_emac1_inst_RX_CTL;
	output		hps_0_hps_io_hps_io_emac1_inst_TX_CTL;
	input		hps_0_hps_io_hps_io_emac1_inst_RX_CLK;
	input		hps_0_hps_io_hps_io_emac1_inst_RXD1;
	input		hps_0_hps_io_hps_io_emac1_inst_RXD2;
	input		hps_0_hps_io_hps_io_emac1_inst_RXD3;
	inout		hps_0_hps_io_hps_io_sdio_inst_CMD;
	inout		hps_0_hps_io_hps_io_sdio_inst_D0;
	inout		hps_0_hps_io_hps_io_sdio_inst_D1;
	output		hps_0_hps_io_hps_io_sdio_inst_CLK;
	inout		hps_0_hps_io_hps_io_sdio_inst_D2;
	inout		hps_0_hps_io_hps_io_sdio_inst_D3;
	inout		hps_0_hps_io_hps_io_usb1_inst_D0;
	inout		hps_0_hps_io_hps_io_usb1_inst_D1;
	inout		hps_0_hps_io_hps_io_usb1_inst_D2;
	inout		hps_0_hps_io_hps_io_usb1_inst_D3;
	inout		hps_0_hps_io_hps_io_usb1_inst_D4;
	inout		hps_0_hps_io_hps_io_usb1_inst_D5;
	inout		hps_0_hps_io_hps_io_usb1_inst_D6;
	inout		hps_0_hps_io_hps_io_usb1_inst_D7;
	input		hps_0_hps_io_hps_io_usb1_inst_CLK;
	output		hps_0_hps_io_hps_io_usb1_inst_STP;
	input		hps_0_hps_io_hps_io_usb1_inst_DIR;
	input		hps_0_hps_io_hps_io_usb1_inst_NXT;
	output		hps_0_hps_io_hps_io_spim1_inst_CLK;
	output		hps_0_hps_io_hps_io_spim1_inst_MOSI;
	input		hps_0_hps_io_hps_io_spim1_inst_MISO;
	output		hps_0_hps_io_hps_io_spim1_inst_SS0;
	input		hps_0_hps_io_hps_io_uart0_inst_RX;
	output		hps_0_hps_io_hps_io_uart0_inst_TX;
	inout		hps_0_hps_io_hps_io_i2c0_inst_SDA;
	inout		hps_0_hps_io_hps_io_i2c0_inst_SCL;
	inout		hps_0_hps_io_hps_io_i2c1_inst_SDA;
	inout		hps_0_hps_io_hps_io_i2c1_inst_SCL;
	inout		hps_0_hps_io_hps_io_gpio_inst_GPIO09;
	inout		hps_0_hps_io_hps_io_gpio_inst_GPIO35;
	inout		hps_0_hps_io_hps_io_gpio_inst_GPIO40;
	inout		hps_0_hps_io_hps_io_gpio_inst_GPIO53;
	inout		hps_0_hps_io_hps_io_gpio_inst_GPIO54;
	inout		hps_0_hps_io_hps_io_gpio_inst_GPIO61;
	output	[7:0]	led_pio_external_connection_export;
	output	[14:0]	memory_mem_a;
	output	[2:0]	memory_mem_ba;
	output		memory_mem_ck;
	output		memory_mem_ck_n;
	output		memory_mem_cke;
	output		memory_mem_cs_n;
	output		memory_mem_ras_n;
	output		memory_mem_cas_n;
	output		memory_mem_we_n;
	output		memory_mem_reset_n;
	inout	[31:0]	memory_mem_dq;
	inout	[3:0]	memory_mem_dqs;
	inout	[3:0]	memory_mem_dqs_n;
	output		memory_mem_odt;
	output	[3:0]	memory_mem_dm;
	input		memory_oct_rzqin;
	input		reset_reset_n;
	input		reset_0_reset_n;
	input	[31:0]	video_input_in_writedata;
	input		video_input_in_write;
	output		video_input_in_waitrequest;
	input	[31:0]	video_input_9_in_writedata;
	input		video_input_9_in_write;
	output		video_input_9_in_waitrequest;
	input	[31:0]	video_input_8_in_writedata;
	input		video_input_8_in_write;
	output		video_input_8_in_waitrequest;
	input	[31:0]	video_input_7_in_writedata;
	input		video_input_7_in_write;
	output		video_input_7_in_waitrequest;
	input	[31:0]	video_input_6_in_writedata;
	input		video_input_6_in_write;
	output		video_input_6_in_waitrequest;
	input	[31:0]	video_input_5_in_writedata;
	input		video_input_5_in_write;
	output		video_input_5_in_waitrequest;
	input	[31:0]	video_input_4_in_writedata;
	input		video_input_4_in_write;
	output		video_input_4_in_waitrequest;
	input	[31:0]	video_input_3_in_writedata;
	input		video_input_3_in_write;
	output		video_input_3_in_waitrequest;
	input	[31:0]	video_input_2_in_writedata;
	input		video_input_2_in_write;
	output		video_input_2_in_waitrequest;
	input	[31:0]	video_input_0_in_writedata;
	input		video_input_0_in_write;
	output		video_input_0_in_waitrequest;
	input	[31:0]	video_input_1_in_writedata;
	input		video_input_1_in_write;
	output		video_input_1_in_waitrequest;
endmodule
