module contador(
	input clk,// CLOCK debe 5 MHZ
	input reset,// Reset viene negado
   output [9:0]out// salida contador de 10 bits
);

reg [19:0]conteo=10'd0;
assign out[9:0]=conteo[9:0];


always@(posedge clk, negedge reset)
begin
	if(!reset)
	begin
		conteo[19:0]<=20'd0;
	end
	else
	begin
		conteo[19:0]<=conteo[19:0]+1'b1;
	end
	
end

endmodule
