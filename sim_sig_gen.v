`timescale 100us/1us


module sim_sig_gen ();
    
    reg clk;
    reg [4:0] state;
    wire [11:0] state_freq;
    wire [2:0] state_amp;
    wire [7:0] state_phase;
    wire [13:0] DA_A;
    wire DA_CLK_A;
    wire DA_WR_A;
    
    initial begin
        clk <= 1'b0;
    end
    
    sig_gen sig_gen_inst(
    .clk(clk),
    .state(state),
    .state_freq(state_freq),
    .state_amp(state_amp),
    .state_phase(state_phase),
    .DA_A(DA_A),
    .DA_CLK_A(DA_CLK_A),
    .DA_WR_A(DA_WR_A)
    );
    
    t1s t1s_inst(
    .clk(clk),
    .s(s)
    );
    
    always begin
        #1 clk <= ~clk;
    end
endmodule
