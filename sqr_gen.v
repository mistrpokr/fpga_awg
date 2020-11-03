module sqr_gen (en,
                cnt[13:0],
                state_freq,
                state_amp,
                state_phase,
                DAC_in);
    input [13:0] cnt;
    input en;
    input [13:0] state_freq;
    input [7:0] state_amp;
    input [7:0] state_phase;
    output [13:0] DAC_in;
    
    assign DAC_in[13:0] = en?{cnt[13], 13'b0}:14'b0;
endmodule
