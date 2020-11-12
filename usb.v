module usb(
	input clk,
	input rxf,
	input txe,
	output reg wr,
	output reg rd,
	inout [7:0]d,
	output reg SI, 
	output reg [7:0] cmd_buf
	);

	reg [4:0]state;
	reg [7:0]buffer;
	reg [7:0]dout;
	reg div_clk;
	reg div_clk2;
	
	initial begin
		state <= 0;
		wr <= 0;
		rd <= 1;
		SI <= 1;
		cmd_buf <= 8'd0; 
	end
	
	always @(posedge clk)
	begin	
		div_clk <= ~div_clk;
	end
	always @(posedge div_clk)
	begin	
		div_clk2 <= ~div_clk2;
	end	
	always @(posedge div_clk2)
	begin
		case(state)
			5'd0:   begin
						if(rxf == 0)begin
							rd <= 0;
							state <= 1;
						end
					end
			5'd1:	begin
						buffer <= d;
						cmd_buf <= d; 
						rd <= 1;
						state <= 2;
					end
			5'd2:	begin
						if(txe == 0)begin
							wr <= 1;
							state <= 5'd3;
						end
					end
			5'd3:	begin
						wr <= 0;
						state <= 5'd4;
					end
			5'd4:	begin
						SI <= 0;
						state <= 5'd5;
					end	
			5'd5:	begin
						SI <= 1;
						state <= 5'd0;
					end						
			default:state <= 0;
		endcase
	end
	
	assign d = (state==5'd3)?dout:8'bzzzz_zzzz;
endmodule 