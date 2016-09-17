//Legal Notice: (C)2016 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module soc_system_video_input_dual_clock_fifo (
                                                // inputs:
                                                 aclr,
                                                 data,
                                                 rdclk,
                                                 rdreq,
                                                 wrclk,
                                                 wrreq,

                                                // outputs:
                                                 q,
                                                 rdempty,
                                                 rdfull,
                                                 rdusedw,
                                                 wrfull
                                              )
  /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R101" */ ;

  output  [ 31: 0] q;
  output           rdempty;
  output           rdfull;
  output  [  9: 0] rdusedw;
  output           wrfull;
  input            aclr;
  input   [ 31: 0] data;
  input            rdclk;
  input            rdreq;
  input            wrclk;
  input            wrreq;

  wire             int_rdfull;
  wire             int_wrfull;
  wire    [ 31: 0] q;
  wire             rdempty;
  wire             rdfull;
  wire    [  9: 0] rdusedw;
  wire             wrfull;
  wire    [  9: 0] wrusedw;
  assign wrfull = (wrusedw >= 1024-3) | int_wrfull;
  assign rdfull = (rdusedw >= 1024-3) | int_rdfull;
  dcfifo dual_clock_fifo
    (
      .aclr (aclr),
      .data (data),
      .q (q),
      .rdclk (rdclk),
      .rdempty (rdempty),
      .rdfull (int_rdfull),
      .rdreq (rdreq),
      .rdusedw (rdusedw),
      .wrclk (wrclk),
      .wrfull (int_wrfull),
      .wrreq (wrreq),
      .wrusedw (wrusedw)
    );

  defparam dual_clock_fifo.add_ram_output_register = "OFF",
           dual_clock_fifo.clocks_are_synchronized = "FALSE",
           dual_clock_fifo.intended_device_family = "CYCLONEV",
           dual_clock_fifo.lpm_numwords = 1024,
           dual_clock_fifo.lpm_showahead = "OFF",
           dual_clock_fifo.lpm_type = "dcfifo",
           dual_clock_fifo.lpm_width = 32,
           dual_clock_fifo.lpm_widthu = 10,
           dual_clock_fifo.overflow_checking = "ON",
           dual_clock_fifo.underflow_checking = "ON",
           dual_clock_fifo.use_eab = "ON";


endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module soc_system_video_input_dcfifo_with_controls (
                                                     // inputs:
                                                      data,
                                                      rdclk,
                                                      rdclk_control_slave_address,
                                                      rdclk_control_slave_read,
                                                      rdclk_control_slave_write,
                                                      rdclk_control_slave_writedata,
                                                      rdreq,
                                                      rdreset_n,
                                                      wrclk,
                                                      wrreq,
                                                      wrreset_n,

                                                     // outputs:
                                                      q,
                                                      rdclk_control_slave_readdata,
                                                      rdempty,
                                                      wrfull
                                                   )
;

  output  [ 31: 0] q;
  output  [ 31: 0] rdclk_control_slave_readdata;
  output           rdempty;
  output           wrfull;
  input   [ 31: 0] data;
  input            rdclk;
  input   [  2: 0] rdclk_control_slave_address;
  input            rdclk_control_slave_read;
  input            rdclk_control_slave_write;
  input   [ 31: 0] rdclk_control_slave_writedata;
  input            rdreq;
  input            rdreset_n;
  input            wrclk;
  input            wrreq;
  input            wrreset_n;

  wire    [ 31: 0] q;
  reg              rdclk_control_slave_almostempty_n_reg;
  wire             rdclk_control_slave_almostempty_pulse;
  wire             rdclk_control_slave_almostempty_signal;
  reg     [ 10: 0] rdclk_control_slave_almostempty_threshold_register;
  reg              rdclk_control_slave_almostfull_n_reg;
  wire             rdclk_control_slave_almostfull_pulse;
  wire             rdclk_control_slave_almostfull_signal;
  reg     [ 10: 0] rdclk_control_slave_almostfull_threshold_register;
  reg              rdclk_control_slave_empty_n_reg;
  wire             rdclk_control_slave_empty_pulse;
  wire             rdclk_control_slave_empty_signal;
  reg              rdclk_control_slave_event_almostempty_q;
  wire             rdclk_control_slave_event_almostempty_signal;
  reg              rdclk_control_slave_event_almostfull_q;
  wire             rdclk_control_slave_event_almostfull_signal;
  reg              rdclk_control_slave_event_empty_q;
  wire             rdclk_control_slave_event_empty_signal;
  reg              rdclk_control_slave_event_full_q;
  wire             rdclk_control_slave_event_full_signal;
  reg              rdclk_control_slave_event_overflow_q;
  wire             rdclk_control_slave_event_overflow_signal;
  wire    [  5: 0] rdclk_control_slave_event_register;
  reg              rdclk_control_slave_event_underflow_q;
  wire             rdclk_control_slave_event_underflow_signal;
  reg              rdclk_control_slave_full_n_reg;
  wire             rdclk_control_slave_full_pulse;
  wire             rdclk_control_slave_full_signal;
  reg     [  5: 0] rdclk_control_slave_ienable_register;
  wire    [ 10: 0] rdclk_control_slave_level_register;
  wire    [ 31: 0] rdclk_control_slave_read_mux;
  reg     [ 31: 0] rdclk_control_slave_readdata;
  reg              rdclk_control_slave_status_almostempty_q;
  wire             rdclk_control_slave_status_almostempty_signal;
  reg              rdclk_control_slave_status_almostfull_q;
  wire             rdclk_control_slave_status_almostfull_signal;
  reg              rdclk_control_slave_status_empty_q;
  wire             rdclk_control_slave_status_empty_signal;
  reg              rdclk_control_slave_status_full_q;
  wire             rdclk_control_slave_status_full_signal;
  reg              rdclk_control_slave_status_overflow_q;
  wire             rdclk_control_slave_status_overflow_signal;
  wire    [  5: 0] rdclk_control_slave_status_register;
  reg              rdclk_control_slave_status_underflow_q;
  wire             rdclk_control_slave_status_underflow_signal;
  wire    [ 10: 0] rdclk_control_slave_threshold_writedata;
  wire             rdempty;
  wire             rdfull;
  wire    [ 10: 0] rdlevel;
  wire             rdoverflow;
  wire             rdunderflow;
  wire    [  9: 0] rdusedw;
  wire             wrfull;
  wire             wrreq_sync;
  wire             wrreq_valid;
  //the_dcfifo, which is an e_instance
  soc_system_video_input_dual_clock_fifo the_dcfifo
    (
      .aclr    (~(rdreset_n && wrreset_n)),
      .data    (data),
      .q       (q),
      .rdclk   (rdclk),
      .rdempty (rdempty),
      .rdfull  (rdfull),
      .rdreq   (rdreq),
      .rdusedw (rdusedw),
      .wrclk   (wrclk),
      .wrfull  (wrfull),
      .wrreq   (wrreq_valid)
    );

  altera_std_synchronizer wrdreq_sync_i
    (
      .clk (rdclk),
      .din (wrreq),
      .dout (wrreq_sync),
      .reset_n (rdreset_n)
    );

  defparam wrdreq_sync_i.depth = 4;

  assign wrreq_valid = wrreq & ~wrfull;
  assign rdlevel = {1'b0,
    rdusedw};

  assign rdoverflow = wrreq_sync & rdfull;
  assign rdunderflow = rdreq & rdempty;
  assign rdclk_control_slave_threshold_writedata = (rdclk_control_slave_writedata < 1) ? 1 :
    (rdclk_control_slave_writedata > 1020) ? 1020 :
    rdclk_control_slave_writedata[10 : 0];

  assign rdclk_control_slave_event_almostfull_signal = rdclk_control_slave_almostfull_pulse;
  assign rdclk_control_slave_event_almostempty_signal = rdclk_control_slave_almostempty_pulse;
  assign rdclk_control_slave_status_almostfull_signal = rdclk_control_slave_almostfull_signal;
  assign rdclk_control_slave_status_almostempty_signal = rdclk_control_slave_almostempty_signal;
  assign rdclk_control_slave_event_full_signal = rdclk_control_slave_full_pulse;
  assign rdclk_control_slave_event_empty_signal = rdclk_control_slave_empty_pulse;
  assign rdclk_control_slave_status_full_signal = rdclk_control_slave_full_signal;
  assign rdclk_control_slave_status_empty_signal = rdclk_control_slave_empty_signal;
  assign rdclk_control_slave_event_overflow_signal = rdoverflow;
  assign rdclk_control_slave_event_underflow_signal = rdunderflow;
  assign rdclk_control_slave_status_overflow_signal = rdoverflow;
  assign rdclk_control_slave_status_underflow_signal = rdunderflow;
  assign rdclk_control_slave_empty_signal = rdempty;
  assign rdclk_control_slave_empty_pulse = rdclk_control_slave_empty_signal & rdclk_control_slave_empty_n_reg;
  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          rdclk_control_slave_empty_n_reg <= 0;
      else 
        rdclk_control_slave_empty_n_reg <= !rdclk_control_slave_empty_signal;
    end


  assign rdclk_control_slave_full_signal = rdfull;
  assign rdclk_control_slave_full_pulse = rdclk_control_slave_full_signal & rdclk_control_slave_full_n_reg;
  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          rdclk_control_slave_full_n_reg <= 0;
      else 
        rdclk_control_slave_full_n_reg <= !rdclk_control_slave_full_signal;
    end


  assign rdclk_control_slave_almostempty_signal = rdlevel <= rdclk_control_slave_almostempty_threshold_register;
  assign rdclk_control_slave_almostempty_pulse = rdclk_control_slave_almostempty_signal & rdclk_control_slave_almostempty_n_reg;
  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          rdclk_control_slave_almostempty_n_reg <= 0;
      else 
        rdclk_control_slave_almostempty_n_reg <= !rdclk_control_slave_almostempty_signal;
    end


  assign rdclk_control_slave_almostfull_signal = rdlevel >= rdclk_control_slave_almostfull_threshold_register;
  assign rdclk_control_slave_almostfull_pulse = rdclk_control_slave_almostfull_signal & rdclk_control_slave_almostfull_n_reg;
  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          rdclk_control_slave_almostfull_n_reg <= 0;
      else 
        rdclk_control_slave_almostfull_n_reg <= !rdclk_control_slave_almostfull_signal;
    end


  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          rdclk_control_slave_almostempty_threshold_register <= 1;
      else if ((rdclk_control_slave_address == 5) & rdclk_control_slave_write)
          rdclk_control_slave_almostempty_threshold_register <= rdclk_control_slave_threshold_writedata;
    end


  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          rdclk_control_slave_almostfull_threshold_register <= 1020;
      else if ((rdclk_control_slave_address == 4) & rdclk_control_slave_write)
          rdclk_control_slave_almostfull_threshold_register <= rdclk_control_slave_threshold_writedata;
    end


  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          rdclk_control_slave_ienable_register <= 0;
      else if ((rdclk_control_slave_address == 3) & rdclk_control_slave_write)
          rdclk_control_slave_ienable_register <= rdclk_control_slave_writedata[5 : 0];
    end


  assign rdclk_control_slave_level_register = rdlevel;
  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          rdclk_control_slave_event_underflow_q <= 0;
      else if (rdclk_control_slave_write & 
                               (rdclk_control_slave_address == 2) &
                               rdclk_control_slave_writedata[5])
          rdclk_control_slave_event_underflow_q <= 0;
      else if (rdclk_control_slave_event_underflow_signal)
          rdclk_control_slave_event_underflow_q <= -1;
    end


  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          rdclk_control_slave_event_overflow_q <= 0;
      else if (rdclk_control_slave_write & 
                               (rdclk_control_slave_address == 2) &
                               rdclk_control_slave_writedata[4])
          rdclk_control_slave_event_overflow_q <= 0;
      else if (rdclk_control_slave_event_overflow_signal)
          rdclk_control_slave_event_overflow_q <= -1;
    end


  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          rdclk_control_slave_event_almostempty_q <= 0;
      else if (rdclk_control_slave_write & 
                               (rdclk_control_slave_address == 2) &
                               rdclk_control_slave_writedata[3])
          rdclk_control_slave_event_almostempty_q <= 0;
      else if (rdclk_control_slave_event_almostempty_signal)
          rdclk_control_slave_event_almostempty_q <= -1;
    end


  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          rdclk_control_slave_event_almostfull_q <= 0;
      else if (rdclk_control_slave_write & 
                               (rdclk_control_slave_address == 2) &
                               rdclk_control_slave_writedata[2])
          rdclk_control_slave_event_almostfull_q <= 0;
      else if (rdclk_control_slave_event_almostfull_signal)
          rdclk_control_slave_event_almostfull_q <= -1;
    end


  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          rdclk_control_slave_event_empty_q <= 0;
      else if (rdclk_control_slave_write & 
                               (rdclk_control_slave_address == 2) &
                               rdclk_control_slave_writedata[1])
          rdclk_control_slave_event_empty_q <= 0;
      else if (rdclk_control_slave_event_empty_signal)
          rdclk_control_slave_event_empty_q <= -1;
    end


  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          rdclk_control_slave_event_full_q <= 0;
      else if (rdclk_control_slave_write & 
                               (rdclk_control_slave_address == 2) &
                               rdclk_control_slave_writedata[0])
          rdclk_control_slave_event_full_q <= 0;
      else if (rdclk_control_slave_event_full_signal)
          rdclk_control_slave_event_full_q <= -1;
    end


  assign rdclk_control_slave_event_register = {rdclk_control_slave_event_underflow_q,
    rdclk_control_slave_event_overflow_q,
    rdclk_control_slave_event_almostempty_q,
    rdclk_control_slave_event_almostfull_q,
    rdclk_control_slave_event_empty_q,
    rdclk_control_slave_event_full_q};

  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          rdclk_control_slave_status_underflow_q <= 0;
      else 
        rdclk_control_slave_status_underflow_q <= rdclk_control_slave_status_underflow_signal;
    end


  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          rdclk_control_slave_status_overflow_q <= 0;
      else 
        rdclk_control_slave_status_overflow_q <= rdclk_control_slave_status_overflow_signal;
    end


  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          rdclk_control_slave_status_almostempty_q <= 0;
      else 
        rdclk_control_slave_status_almostempty_q <= rdclk_control_slave_status_almostempty_signal;
    end


  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          rdclk_control_slave_status_almostfull_q <= 0;
      else 
        rdclk_control_slave_status_almostfull_q <= rdclk_control_slave_status_almostfull_signal;
    end


  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          rdclk_control_slave_status_empty_q <= 0;
      else 
        rdclk_control_slave_status_empty_q <= rdclk_control_slave_status_empty_signal;
    end


  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          rdclk_control_slave_status_full_q <= 0;
      else 
        rdclk_control_slave_status_full_q <= rdclk_control_slave_status_full_signal;
    end


  assign rdclk_control_slave_status_register = {rdclk_control_slave_status_underflow_q,
    rdclk_control_slave_status_overflow_q,
    rdclk_control_slave_status_almostempty_q,
    rdclk_control_slave_status_almostfull_q,
    rdclk_control_slave_status_empty_q,
    rdclk_control_slave_status_full_q};

  assign rdclk_control_slave_read_mux = ({32 {(rdclk_control_slave_address == 0)}} & rdclk_control_slave_level_register) |
    ({32 {(rdclk_control_slave_address == 1)}} & rdclk_control_slave_status_register) |
    ({32 {(rdclk_control_slave_address == 2)}} & rdclk_control_slave_event_register) |
    ({32 {(rdclk_control_slave_address == 3)}} & rdclk_control_slave_ienable_register) |
    ({32 {(rdclk_control_slave_address == 4)}} & rdclk_control_slave_almostfull_threshold_register) |
    ({32 {(rdclk_control_slave_address == 5)}} & rdclk_control_slave_almostempty_threshold_register) |
    ({32 {(~((rdclk_control_slave_address == 0))) && (~((rdclk_control_slave_address == 1))) && (~((rdclk_control_slave_address == 2))) && (~((rdclk_control_slave_address == 3))) && (~((rdclk_control_slave_address == 4))) && (~((rdclk_control_slave_address == 5)))}} & rdclk_control_slave_level_register);

  always @(posedge rdclk or negedge rdreset_n)
    begin
      if (rdreset_n == 0)
          rdclk_control_slave_readdata <= 0;
      else if (rdclk_control_slave_read)
          rdclk_control_slave_readdata <= rdclk_control_slave_read_mux;
    end



endmodule


// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module soc_system_video_input (
                                // inputs:
                                 avalonmm_read_slave_read,
                                 avalonmm_write_slave_write,
                                 avalonmm_write_slave_writedata,
                                 rdclk_control_slave_address,
                                 rdclk_control_slave_read,
                                 rdclk_control_slave_write,
                                 rdclk_control_slave_writedata,
                                 rdclock,
                                 rdreset_n,
                                 wrclock,
                                 wrreset_n,

                                // outputs:
                                 avalonmm_read_slave_readdata,
                                 avalonmm_read_slave_waitrequest,
                                 avalonmm_write_slave_waitrequest,
                                 rdclk_control_slave_readdata
                              )
;

  output  [ 31: 0] avalonmm_read_slave_readdata;
  output           avalonmm_read_slave_waitrequest;
  output           avalonmm_write_slave_waitrequest;
  output  [ 31: 0] rdclk_control_slave_readdata;
  input            avalonmm_read_slave_read;
  input            avalonmm_write_slave_write;
  input   [ 31: 0] avalonmm_write_slave_writedata;
  input   [  2: 0] rdclk_control_slave_address;
  input            rdclk_control_slave_read;
  input            rdclk_control_slave_write;
  input   [ 31: 0] rdclk_control_slave_writedata;
  input            rdclock;
  input            rdreset_n;
  input            wrclock;
  input            wrreset_n;

  wire    [ 31: 0] avalonmm_read_slave_readdata;
  wire             avalonmm_read_slave_waitrequest;
  wire             avalonmm_write_slave_waitrequest;
  wire    [ 31: 0] data;
  wire    [ 31: 0] q;
  wire             rdclk;
  wire    [ 31: 0] rdclk_control_slave_readdata;
  wire             rdempty;
  wire             rdreq;
  wire             wrclk;
  wire             wrfull;
  wire             wrreq;
  //the_dcfifo_with_controls, which is an e_instance
  soc_system_video_input_dcfifo_with_controls the_dcfifo_with_controls
    (
      .data                          (data),
      .q                             (q),
      .rdclk                         (rdclk),
      .rdclk_control_slave_address   (rdclk_control_slave_address),
      .rdclk_control_slave_read      (rdclk_control_slave_read),
      .rdclk_control_slave_readdata  (rdclk_control_slave_readdata),
      .rdclk_control_slave_write     (rdclk_control_slave_write),
      .rdclk_control_slave_writedata (rdclk_control_slave_writedata),
      .rdempty                       (rdempty),
      .rdreq                         (rdreq),
      .rdreset_n                     (rdreset_n),
      .wrclk                         (wrclk),
      .wrfull                        (wrfull),
      .wrreq                         (wrreq),
      .wrreset_n                     (wrreset_n)
    );

  //in, which is an e_avalon_slave
  //out, which is an e_avalon_slave
  assign data = avalonmm_write_slave_writedata;
  assign wrreq = avalonmm_write_slave_write;
  assign avalonmm_read_slave_readdata = q;
  assign rdreq = avalonmm_read_slave_read;
  assign rdclk = rdclock;
  assign wrclk = wrclock;
  assign avalonmm_write_slave_waitrequest = wrfull;
  assign avalonmm_read_slave_waitrequest = rdempty;
  //out_csr, which is an e_avalon_slave

endmodule

