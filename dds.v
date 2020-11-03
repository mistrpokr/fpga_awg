module dds (input clk,
            output [13:0] DA,
            output DA_CLK,
            output DA_WR,
            input rxf,
            input txe,
            output wr,
            output rd,
            inout [7:0] d,
            output SI);
    
    wire [7:0] cmd;
    wire [4:0] state;
    
    clk2	clk2_inst (
    .inclk0 (clk),
    .c0 (clk_40M),
    .c1 (clk_100M)
    );
    
    sig_gen sig_gen_inst(
    .clk(clk_100M),
    .state(state),
    .DA_A(DA),
    .DA_CLK_A(DA_CLK),
    .DA_WR_A(DA_WR),
    );
    
    usb usb_inst(
    .clk(clk_100M),
    .rxf(rxf),
    .txe(txe),
    .wr(wr),
    .rd(rd),
    .d(d),
    .SI(SI),
    .cmd_buf(cmd)
    );
    
    state_sel state_sel_inst(
    .clk(clk_100M),
    .cmd(cmd),
    .state(state)
    );
endmodule
