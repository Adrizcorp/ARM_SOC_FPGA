`define MSBI 13

module ram_simulacion_ref(
	input clk,
	input [`MSBI:0]addr_rd,
	input [`MSBI:0]addr_wr,
	input [24:0]in,
	input wr_enm,
	output [24:0]out
	);

reg [24:0]ramcita[4799:0];
initial $readmemh("ref.txt",ramcita);

assign out[24:0]=ramcita[addr_rd[`MSBI:0]][24:0];

always@(posedge clk)
begin
	if(wr_enm)
	begin
		ramcita[addr_wr[`MSBI:0]][24:0]<=in[24:0];
	end
end

endmodule



module ram_simulacion_act(
	input clk,
	input [`MSBI:0]addr_rd,
	input [`MSBI:0]addr_wr,
	input [24:0]in,
	input wr_enm,
	output [24:0]out
	);

reg [24:0]ramcita[4799:0];
initial $readmemh("act.txt",ramcita);

assign out[24:0]=ramcita[addr_rd[`MSBI:0]][24:0];

always@(posedge clk)
begin
	if(wr_enm)
	begin
		ramcita[addr_wr[`MSBI:0]][24:0]<=in[24:0];
	end
end

endmodule