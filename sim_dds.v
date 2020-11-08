`timescale 10us/10ns

module sim_dds ();
    
    reg clk;
    wire [13:0] DA;
    wire DA_CLK;
    wire DA_WR;
    
    initial clk <= 1'd0;
    
    always begin
        #1 clk <= ~clk;
    end
    
    dds dds_inst(
    .clk(clk),
    .DA(DA),
    .DA_CLK(DA_CLK),
    .DA_WR(DA_WR),
    .rxf(),
    .txe(),
    .wr(),
    .rd(),
    .d(),
    .SI()
    );
endmodule
