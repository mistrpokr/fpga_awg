module dds (input clk,
            output [13:0] DA_A,
            output DA_CLK_A,
            output DA_WR_A,
            output reg [13:0]DA_B,
            output DA_CLK_B,
            output DA_WR_B,
            input rxf,
            input txe,
            output wr,
            output rd,
            inout [7:0] d,
            output SI);
    
    wire [7:0] cmd;
    wire [4:0] state;
    wire [7:0] state_freq;
    wire [7:0] state_amp;
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
    .DA_A(DA_A),
    .DA_CLK_A(DA_CLK_A),
    .DA_WR_A(DA_WR_A),
    .DA_B(DA_B),
    .DA_CLK_A(DA_CLK_B),
    .DA_WR_A(DA_WR_B)
    );
    
    usb usb_inst(
    .clk(clk),
    .rxf(rxf),
    .txe(txe),
    .wr(wr),
    .rd(rd),
    .d(d),
    .SI(SI),
    .cmd_buf(cmd)
    );
    
    state_sel_comp state_sel_inst(
    .clk(clk_100M),
    .cmd(cmd),
    .rd(rd)
    .state(state),
    .state_freq(state_freq),
    .state_amp(state_amp),
    .state_phase(state_phase)
    );
endmodule