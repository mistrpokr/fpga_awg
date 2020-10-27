module dds(
	input clk,
	//DA PINS
	output reg [13:0]DA_A,
	output DA_CLK_A,
	output DA_WR_A
	);
	
	wire clk_40M;
	wire clk_100M;
	
	clk2	clk2_inst (
	.inclk0 ( clk ),
	.c0 ( clk_40M ),
	.c1 ( clk_100M )
	);
	
	////////////////////////////////////////////////DA/////////////////////////////////////
	reg [15:0]address;
	wire [13:0]sin_w;
	always @(posedge clk_100M)
	begin
		address <= address + 16'd1321;
		DA_A <= sin_w;
	end
	assign DA_CLK_A = clk_100M;
	assign DA_WR_A = ~clk_100M;

	sin_table INS_SIN(
	.address(address[15:7]),
	.data(sin_w)
    );
endmodule 