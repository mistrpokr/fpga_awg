module dds(input clk,
           output reg [13:0]DA_A,
           output DA_CLK_A,
           output DA_WR_A);
    
    wire clk_40M;
    wire clk_100M;
    
    clk2	clk2_inst (
    .inclk0 (clk),
    .c0 (clk_40M),
    .c1 (clk_100M)
    );
    
    ////////////////////////////////////////////////DA/////////////////////////////////////
    reg [13:0] cnt;
    
    initial begin
        cnt <= 16'b0;
    end
    
    wire cnt_tap = cnt[7];     // we take one bit out of the counter (here bit 7 = the 8th bit)
    
    always @(posedge clk_100M)
    begin
        cnt  <= cnt + 14'h1;
        DA_A <= cnt[13:0];
    end
    assign DAC_data = cnt[13:0];
    assign DA_CLK_A = clk_100M;
    assign DA_WR_A  = ~clk_100M;
    
endmodule
