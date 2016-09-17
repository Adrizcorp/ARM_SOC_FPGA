`define MSBI 13
module simulacion_test_busqueda(
	input clk,
	input start,
	output finish,
	output idle,
	input vector_wait_fifo_sig,
	input img_wait_fifo_sig,
	output [(`MSBI+`MSBI)+1:0]vector_me_sig,
	output [9:0]img_mb_sig,
	output img_wr_req_sig,
	output vector_wr_req_sig,
	output [4:0]real_state,
	output [`MSBI:0]_realref,
	output [`MSBI:0]_realact,
	input [`MSBI:0]window_limit
);

wire [8:0]data_rd_img_ref_sig;
wire [8:0]data_rd_img_Act_sig;
wire [`MSBI:0]add_write_img_ref_sig;
wire [`MSBI:0]add_read_img_ref_sig;
wire wr_enable_ref_sig,wr_enable_act_sig;
wire [`MSBI:0]add_read_img_act_sig;
wire [`MSBI:0]add_write_img_act_sig;
wire [8:0]data_wr_img_ref_sig;
wire [8:0]data_wr_img_Act_sig;

busqueda busqueda_inst
(
	.clk_fsm(clk) ,	// input  clk_fsm_sig
	.start(start) ,	// input  start_sig
	.finish(finish) ,	// output  finish_sig
	.idle(idle) ,	// output  idle_sig
	.cont_img(2'd1) ,	// input [1:0] cont_img_sig
	.vector_wait_fifo(vector_wait_fifo_sig) ,	// input  vector_wait_fifo_sig
	.img_wait_fifo(img_wait_fifo_sig) ,	// input  img_wait_fifo_sig
	.vector_me(vector_me_sig) ,	// output [23:0] vector_me_sig
	.img_mb(img_mb_sig) ,	// output [25:0] img_mb_sig
	.img_wr_req(img_wr_req_sig) ,	// output  img_wr_req_sig
	.vector_wr_req(vector_wr_req_sig) ,	// output  vector_wr_req_sig
	
	.data_rd_img_ref(data_rd_img_ref_sig) ,	// input [24:0] data_rd_img_ref_sig
	.data_rd_img_Act(data_rd_img_Act_sig) ,	// input [24:0] data_rd_img_Act_sig
	.add_read_img_ref(add_read_img_ref_sig) ,	// output [10:0] add_read_img_ref_sig
	.add_write_img_ref(add_write_img_ref_sig) ,	// output [10:0] add_write_img_ref_sig
	.wr_enable_ref(wr_enable_ref_sig) ,	// output  wr_enable_ref_sig
	.add_read_img_act(add_read_img_act_sig) ,	// output [10:0] add_read_img_act_sig
	.add_write_img_act(add_write_img_act_sig) ,	// output [10:0] add_write_img_act_sig
	.wr_enable_act(wr_enable_act_sig) ,	// output  wr_enable_act_sig
	.data_wr_img_ref(data_wr_img_ref_sig) ,	// output [24:0] data_wr_img_ref_sig
	.data_wr_img_Act(data_wr_img_Act_sig) ,	// output [24:0] data_wr_img_Act_sig
	.window_limit(window_limit[`MSBI:0]),	// input [10:0] window_limit_sig
	.real_state(real_state),
	._realact(_realact),
	._realref(_realref)
);

//hacer las 11 rams 
ram_simulacion_ref	ram_simulacion_ref_inst (
	.clock ( clk ),
	.data ( data_wr_img_ref_sig[8:0] ),
	.rdaddress ( add_read_img_ref_sig[12:0] ),
	.wraddress ( add_write_img_ref_sig[12:0] ),
	.wren ( wr_enable_ref_sig ),
	.q ( data_rd_img_ref_sig[8:0] )
	);

	
ram_simulacion_act	ram_simulacion_act_inst (
	.clock ( clk ),
	.data ( data_wr_img_Act_sig[8:0] ),
	.rdaddress ( add_read_img_act_sig[12:0] ),
	.wraddress ( add_write_img_act_sig[12:0] ),
	.wren ( wr_enable_act_sig ),
	.q ( data_rd_img_Act_sig[8:0] )
	);



endmodule


