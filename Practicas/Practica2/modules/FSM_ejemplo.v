module FSM_ejemplo(
					input clk,
					input start,
					input sw0,
					output [7:0]led,
					output finish
						);
							//finish________state(one hot)
localparam IDLE = 		10'b0__________000000001;
localparam STATE1 = 		10'b0__________000000010;
localparam STATE2 = 		10'b0__________000000100;
localparam STATE3 = 		10'b0__________000001000;
localparam STATE4 = 		10'b0__________000010000;
localparam STATE5 = 		10'b0__________000100000;
localparam STATE6 = 		10'b0__________001000000;
localparam STATE7 = 		10'b0__________010000000;
localparam FINISH = 		10'b1__________100000000;


reg [9:0]state=IDLE;
reg [7:0]led_temp=8'd0;
assign led[7:0]=led_temp[7:0];
assign finish=state[9];

always@(posedge clk)
begin
	case(state[8:0])
	IDLE:begin
				if(!start)begin
					state[9:0]<=IDLE;
					led_temp[7:0]<=8'b10101010;
				end
				else
				begin	
					state[9:0]<=STATE1;
					led_temp[7:0]<=8'b10101010;
				end
			end
	STATE1:begin
				state[9:0]<=STATE2;
				led_temp[7:0]<=8'b00000001;
			end
	STATE2:begin
				state[9:0]<=STATE3;
				led_temp[7:0]<=8'b00000010;
				if(sw0)begin
					state[9:0]<=STATE2;
				end
			end
	STATE3:begin
				state[9:0]<=STATE4;
				led_temp[7:0]<=8'b10000001;
			end
   STATE4:begin
				state[9:0]<=STATE5;
				led_temp[7:0]<=8'b11000011;
			end
   STATE5:begin
				state[9:0]<=STATE6;
				led_temp[7:0]<=8'b11100111;
			end
	STATE6:begin
				state[9:0]<=STATE7;
				led_temp[7:0]<=8'b11100111;
			end
   STATE7:begin
				state[9:0]<=FINISH;
				led_temp[7:0]<=8'b11111111;
			end
   FINISH:begin
				state[9:0]<=IDLE;
				led_temp[7:0]<=8'b11110000;
			end
	default:begin
				state[9:0]<=IDLE;
				led_temp[7:0]<=8'b00000000;
			end
	endcase
end

endmodule
