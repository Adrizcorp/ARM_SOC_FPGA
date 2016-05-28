module SNES_FSM(
				input clk_50,
				input start,
				input data_in_snes,
				output [11:0]buttons_snes,
				output finish,
				output idle,
				output latch_snes,
				output clk_snes
				);
							  //LATCH______CLOCK_____FINISH____IDLE______STATE
parameter	IDLE  =  10'b0_____________1_________0________1______000001;
parameter   STATE1=  10'b1_____________1_________0________0______000010;
parameter   STATE2=  10'b0_____________1_________0________0______000100;
parameter   STATE3=  10'b0_____________0_________0________0______001000;
parameter   STATE4=  10'b0_____________1_________0________0______010000;
parameter   FINISH=  10'b0_____________1_________1________0______100000;
							//numero de clocks del relog base de 50 Mhz
parameter   TIME6u	= 10'd300;
parameter   TIME12u	= 10'd600;


reg [9:0]state=IDLE
reg [9:0]delay=TIME12u;
reg [3:0]num_clks=4'd0;
assign latch_snes=state[9];
assign clk_snes=state[8];
assign finish=state[7];
assign idle=state[6];



always@(posedge clk_50)
begin
	case(state[5:0])
	IDLE  :begin
				state[9:0]<=IDLE;
				delay[9:0]<=TIME12u;
				num_clks[3:0]<=4'd0;
				if(start==1)
				begin
					state[9:0]<=STATE1;
				end
			 end
   STATE1:begin
				state[9:0]<=STATE1;
				delay[9:0]<=delay[9:0]-1'b1;
				num_clks[3:0]<=4'd0;
				if(delay[9:0]==10'd0)
				begin
					delay[9:0]<=TIME6u;
					state[9:0]<=STATE2;
				end
			 end
	STATE2:begin
				state[9:0]<=STATE2;
				delay[9:0]<=delay[9:0]-1'b1;
				num_clks[3:0]<=4'd0;
				if(delay[9:0]==10'd0)
				begin
					delay[9:0]<=TIME6u;
					state[9:0]<=STATE3;
				end
			 end
   STATE3:begin
				state[9:0]<=STATE3;
				delay[9:0]<=delay[9:0]-1'b1;
				num_clks[3:0]<=num_clks[3:0];
				if(delay[9:0]==10'd0)
				begin
					num_clks[3:0]<=num_clks[3:0]+1'b1;
					if(num_clks[3:0]<4'd15)
					begin	
						delay[9:0]<=TIME6u;
						state[9:0]<=STATE2;
					end
					else
					begin
						delay[9:0]<=TIME12u;
						state[9:0]<=STATE4;
					end
				end
			 end
   STATE4:begin
				state[9:0]<=STATE4;
				delay[9:0]<=delay[9:0]-1'b1;
				num_clks[3:0]<=4'd0;
				if(delay[9:0]==10'd0)
				begin
					state[9:0]<=FINISH;
				end
			 end
   FINISH:begin
				state[9:0]<=IDLE;
				delay[9:0]<=10'd0;
				num_clks[3:0]<=4'd0;
			 end
	default:begin
				state[9:0]<=IDLE;
				delay[9:0]<=10'd0;
				num_clks[3:0]<=4'd0;
			 end
	endcase
end


endmodule
