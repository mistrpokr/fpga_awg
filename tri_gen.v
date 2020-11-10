module tri_gen (en,
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
    reg [13:0] tri_amp;
    wire [13:0] tri_w;
    wire [15:0] addr_step;
    
    assign DAC_in[13:0]    = en?tri_amp:14'b0;
    assign addr_step[11:0] = state_freq[11:0];
    
    always @(posedge clk) begin
        addr       <= addr + addr_step;
        // tri_amp <= (tri_w - 14'd8192)/(state_amp)*(tri_w[13]?-1'd1:-1'd1) + 14'd8192;
        // tri_amp <= (tri_w - 14'd8192)/(state_amp) + 14'd8192;
        tri_amp    <= tri_w/state_amp-14'd8192/state_amp+14'd8192; 
    end
    
    tri_table tri_tab_inst(
    .address(addr[18:10]),
    .data(tri_w)
    );
endmodule
