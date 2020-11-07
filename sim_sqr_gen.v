`timescale 1us/1us

module sim_sqr_gen ();
    reg clk;
    
    initial clk <= 1'b0;
    
    always #1 clk <= ~clk;
    
    wire en;
    wire [11:0] state_freq;
    wire [2:0] state_amp;
    wire [7:0] state_phase;
    wire [13:0] DAC_in;
    
    assign en          = 1'b1;
    assign state_freq  = 12'd1;
    assign state_amp   = 3'd50;
    assign state_phase = 8'd50;
    
    sqr_gen sqr_gen_inst(
    .en(en),
    .clk(clk),
    .state_freq(state_freq),
    .state_amp(state_amp),
    .state_phase(state_phase),
    .DAC_in(DAC_in)
    );
endmodule
