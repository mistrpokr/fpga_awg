module saw_gen (en,
                cnt[13:0],
                DAC_in);
    input [13:0] cnt;
    input en;
    output [13:0] DAC_in;
    
    assign DAC_in[13:0] = en?cnt[13:0]:14'b0; 
    
endmodule
