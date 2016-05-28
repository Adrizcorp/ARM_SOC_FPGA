module divisor_frecuencia(
	input clk,// CLOCK debe 5 MHZ
	input reset,// Reset viene negado
   input [31:0]in,// 
	output divf
);

reg [31:0]conteo=32'd0;
reg toggle=1'b0;
assign divf=toggle;

always@(posedge clk, negedge reset)
begin
	if(!reset)
	begin
		toggle<=1'b0;
	end
	else
	begin
		if(conteo[31:0]>=in[31:0])
		begin
			toggle<=~toggle;
		end
		else
		begin
			toggle<=toggle;
		end
	end
end

always@(posedge clk, negedge reset)
begin
	if(!reset)
	begin
		conteo[31:0]<=32'd0;
	end
	else
	begin
		if(conteo[31:0]>=in[31:0])
		begin
			conteo[31:0]<=32'd0;
		end
		else
		begin
			conteo[31:0]<=conteo[31:0]+1'b1;
		end
	end
end

endmodule
