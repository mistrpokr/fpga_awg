module tri_gen (en,
                cnt[13:0],
                state_freq,
                state_amp,
                state_phase,
                DAC_in);
    input [13:0] cnt;
    input en;
    input [11:0] state_freq;
    input [2:0] state_amp;
    input [7:0] state_phase;
    output [13:0] DAC_in;
    
    assign DAC_in[13:0] = en?{1'b1, cnt[13] ? ~cnt[12:0] : cnt[12:0]}:14'b0;
    
endmodule
