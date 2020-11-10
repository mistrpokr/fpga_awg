module sqr_gen (en,
                clk,
                state_freq,
                state_amp,
                state_phase,
                DAC_in);
    // input [15:0] addr;
    input en;
    input clk;
    input [11:0] state_freq;
    input [2:0] state_amp;
    input [7:0] state_phase;
    output [13:0] DAC_in;
    
    reg [18:0] addr;
    reg [13:0] sqr_amp;
    wire [13:0] sqr_w;
    wire [15:0] addr_step;
    
    assign DAC_in[13:0]    = en?sqr_amp:14'b0;
    assign addr_step[11:0] = state_freq[11:0];
    
    always @(posedge clk) begin
        addr       <= addr + addr_step;
        // sqr_amp <= (sqr_w - 14'd8192)/(state_amp)*(sqr_w[13]?-1'd1:-1'd1) + 14'd8192;
        // sqr_amp <= (sqr_w - 14'd8192)/(state_amp) + 14'd8192;
        sqr_amp    <= sqr_w/state_amp-14'd8192/state_amp+14'd8192; 
    end
    
    sqr_table sqr_tab_inst(
    .address(addr[18:10]),
    .data(sqr_w)
    );
endmodule
