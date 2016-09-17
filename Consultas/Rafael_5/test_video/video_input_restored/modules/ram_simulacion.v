`define MSBI 13

module ram_simulacion_ref(
	input clk,
	input [`MSBI:0]addr_rd,
	input [`MSBI:0]addr_wr,
	input [8:0]in,
	input wr_enm,
	output [8:0]out
	);

reg [8:0]ramcita[4799:0];
initial $readmemh("ref.txt",ramcita);

assign out[8:0]=ramcita[addr_rd[`MSBI:0]][8:0];

always@(posedge clk)
begin
	if(wr_enm)
	begin
		ramcita[addr_wr[`MSBI:0]][8:0]<=in[8:0];
	end
end

endmodule



module ram_simulacion_act(
	input clk,
	input [`MSBI:0]addr_rd,
	input [`MSBI:0]addr_wr,
	input [8:0]in,
	input wr_enm,
	output [8:0]out
	);

reg [8:0]ramcita[4799:0];
initial $readmemh("act.txt",ramcita);

assign out[8:0]=ramcita[addr_rd[`MSBI:0]][8:0];

always@(posedge clk)
begin
	if(wr_enm)
	begin
		ramcita[addr_wr[`MSBI:0]][8:0]<=in[8:0];
	end
end

endmodule
