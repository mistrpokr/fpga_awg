module saw_gen (en,
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
    
    reg [23:0] cnt_limit;
    reg [23:0] cnt_sub;
    
    initial begin
        cnt_limit <= 24'd0;
    end
    
    always @(posedge cnt) begin
        cnt_limit <= state_freq;
        
        if (cnt_sub > cnt_limit) begin
            cnt_sub <= 24'd0;
            end else begin
            cnt_sub <= cnt_sub + 24'd1;
        end
    end
    
    assign DAC_in[13:0] = en?cnt_sub[13:0]:14'b0;
    
endmodule
