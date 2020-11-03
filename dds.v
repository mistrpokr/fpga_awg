module dds (input clk,
            output [13:0]DA,
            output DA_CLK,
            output DA_WR);
    
    clk2	clk2_inst (
    .inclk0 (clk),
    .c0 (clk_40M),
    .c1 (clk_100M)
    );
    
    sig_gen sig_gen_inst(
    .clk(clk_100M), 
	.DA_A(DA), 
	.DA_CLK_A(DA_CLK), 
	.DA_WR_A(DA_WR)
    ); 
endmodule
