module test_ADDA(
	input clk,
	//DA PINS
	output reg [13:0]DA_A,
	output reg [13:0]DA_B,
	output DA_CLK_A,
	output DA_CLK_B,
	output DA_WR_A,
	output DA_WR_B,
	//AD PINS
	output AD_ECODE_A,
	output AD_ECODE_B,
	output AD_S1,
	output AD_S2,
	output AD_DFS_GAIN,
	input [9:0]AD_A,//使用AD9288时低2位无效
	input [9:0]AD_B//使用AD9288时低2位无效
	);
	
	wire clk_40M;
	wire clk_100M;
	
	clk2	clk2_inst (
	.inclk0 ( clk ),
	.c0 ( clk_40M ),
	.c1 ( clk_100M )
	);
	
	///////////////////////////////////////////////AD///////////////////////////////////////
	reg [9:0]AD_A_buf/*synthesis noprune*/ ;
	reg [9:0]AD_B_buf/*synthesis noprune*/ ;
	
	always @(posedge clk_40M)
	begin
		AD_A_buf <= AD_A;
		AD_B_buf <= AD_B;
	end
	
	assign AD_ECODE_A = ~clk_40M;
	assign AD_ECODE_B = ~clk_40M;
	
	assign AD_S1 = 1;
	assign AD_S2 = 0;
	assign AD_DFS_GAIN = 1;

	////////////////////////////////////////////////DA/////////////////////////////////////
	reg [15:0]address;
	wire [13:0]sin_w;
	always @(posedge clk_100M)
	begin
		address <= address + 16'd1321;
		DA_A <= sin_w;
		DA_B <= sin_w;
	end
	assign DA_CLK_A = clk_100M;
	assign DA_CLK_B = clk_100M;
	assign DA_WR_A = ~clk_100M;
	assign DA_WR_B = ~clk_100M;
	
	sin_table INS_SIN(
	.address(address[15:7]),
	.data(sin_w)
    );
endmodule 