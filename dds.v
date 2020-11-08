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
    wire [11:0] state_freq;
    wire [2:0] state_amp;
    wire [7:0] state_phase;
    
    
    // clk2	clk2_inst (
    // .inclk0 (clk),
    // .c0 (clk_40M),
    // .c1 (clk_100M)
    // );
    
    sig_gen sig_gen_inst(
    .clk(clk),
    .state(state),
    .state_freq(state_freq),
    .state_amp(state_amp),
    .state_phase(state_phase),
    .DA_A(DA),
    .DA_CLK_A(DA_CLK),
    .DA_WR_A(DA_WR)
    );
    
    usb usb_inst(
    .clk(clk),
    .rxf(rxf),
    .txe(txe),
    .wr(wr),
    .rd(rd),
    .d(d),
    .SI(SI),
    .cmd_buf()
    );
    
    state_sel state_sel_inst(
    .clk(clk),
    .cmd(cmd),
    .state(state),
    .state_freq(state_freq),
    .state_amp(state_amp),
    .state_phase(state_phase)
    );
    
    assign cmd = 8'd52;
endmodule
    
    
    //TODO 0000瀵瑰�?-0.5V; 1111瀵瑰�?0.5V
