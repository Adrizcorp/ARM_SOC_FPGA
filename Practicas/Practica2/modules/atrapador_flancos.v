module atrapador_flancos(
								input async_signal,
								input clk,
								output sync_signal
								);

wire reset_async;
								
reg [2:0]q=3'd0;


assign reset_async= q[2] & ~async_signal;
assign sync_signal = q[2];

always@(posedge async_signal, posedge reset_async)
begin
	if(reset_async) q[0]<=1'b0;
	else q[0]<=1'b1;
end

always@(posedge clk)
begin
	q[1]<=q[0];
	q[2]<=q[1];
end
								
								
								
endmodule
