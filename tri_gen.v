module tri_gen (en,
                clk,
                freq,
                amp,
                phase,
                DA_A,
                DA_B);
    // input [15:0] addr;
    input en;
    input clk;
    input [11:0] freq;
    input [3:0] amp;
    input [7:0] phase;
    output [13:0] DA_A;
    output [13:0] DA_B;
    
    reg [18:0] addr;
    reg [13:0] tri_amp;
    reg [13:0] tri_amp_phase;
    wire [13:0] tri_w;
    wire [13:0] tri_w_phase;    
    wire [15:0] addr_step;
    
    assign DA_A[13:0]      = en?tri_amp:14'b0;
    assign DA_B[13:0]      = en?tri_amp_phase:14'b0;
    assign addr_step[11:0] = freq[11:0];
    
    always @(posedge clk) begin
        addr          <= addr + addr_step;
        // tri_amp    <= (tri_w - 14'd8192)/(amp)*(tri_w[13]?-1'd1:-1'd1) + 14'd8192;
        // tri_amp    <= (tri_w - 14'd8192)/(amp) + 14'd8192;
        tri_amp       <= tri_w/amp-14'd8192/amp+14'd8192;
        tri_amp_phase <= tri_w_phase/amp-14'd8192/amp+14'd8192;
    end
    
    tri_table tri_tab_inst(
    .address(addr[18:10]),
    .data(tri_w)
    );
    
    tri_table tri_tab_phase(
    .address(addr[18:10]+phase),
    .data(tri_w_phase)
    ); 
endmodule
