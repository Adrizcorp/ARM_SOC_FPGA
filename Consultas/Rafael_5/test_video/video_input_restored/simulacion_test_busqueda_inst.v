// Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, the Altera Quartus II License Agreement,
// the Altera MegaCore Function License Agreement, or other 
// applicable license agreement, including, without limitation, 
// that your use is for the sole purpose of programming logic 
// devices manufactured by Altera and sold by Altera or its 
// authorized distributors.  Please refer to the applicable 
// agreement for further details.


// Generated by Quartus II 64-Bit Version 15.0 (Build Build 145 04/22/2015)
// Created on Wed Aug 24 08:30:18 2016

simulacion_test_busqueda simulacion_test_busqueda_inst
(
	.clk(clk_sig) ,	// input  clk_sig
	.start(start_sig) ,	// input  start_sig
	.finish(finish_sig) ,	// output  finish_sig
	.idle(idle_sig) ,	// output  idle_sig
	.vector_wait_fifo_sig(vector_wait_fifo_sig_sig) ,	// input  vector_wait_fifo_sig_sig
	.img_wait_fifo_sig(img_wait_fifo_sig_sig) ,	// input  img_wait_fifo_sig_sig
	.vector_me_sig(vector_me_sig_sig) ,	// output [27:0] vector_me_sig_sig
	.img_mb_sig(img_mb_sig_sig) ,	// output [25:0] img_mb_sig_sig
	.img_wr_req_sig(img_wr_req_sig_sig) ,	// output  img_wr_req_sig_sig
	.vector_wr_req_sig(vector_wr_req_sig_sig) ,	// output  vector_wr_req_sig_sig
	.real_state(real_state_sig) ,	// output [4:0] real_state_sig
	._realref(_realref_sig) ,	// output [13:0] _realref_sig
	._realact(_realact_sig) ,	// output [13:0] _realact_sig
	.window_limit(window_limit_sig) ,	// input [13:0] window_limit_sig
	.vector_me_sig_reg(vector_me_sig_reg_sig) 	// output [27:0] vector_me_sig_reg_sig
);

