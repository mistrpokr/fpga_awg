module saw_gen (en,
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
    input [2:0] amp;
    input [7:0] phase;
    output [13:0] DA_A;
    output [13:0] DA_B;
    
    reg [18:0] addr;
    reg [13:0] saw_amp;
    reg [13:0] saw_amp_phase;
    wire [13:0] saw_w;
    wire [13:0] saw_w_phase;    
    wire [15:0] addr_step;
    
    assign DA_A[13:0]      = en?saw_amp:14'b0;
    assign DA_B[13:0]      = en?saw_amp_phase:14'b0;
    assign addr_step[11:0] = freq[11:0];
    
    always @(posedge clk) begin
        addr          <= addr + addr_step;
        // saw_amp    <= (saw_w - 14'd8192)/(amp)*(saw_w[13]?-1'd1:-1'd1) + 14'd8192;
        // saw_amp    <= (saw_w - 14'd8192)/(amp) + 14'd8192;
        saw_amp       <= saw_w/amp-14'd8192/amp+14'd8192;
        saw_amp_phase <= saw_w_phase/amp-14'd8192/amp+14'd8192;
    end
    
    saw_table saw_tab_inst(
    .address(addr[18:10]),
    .data(saw_w)
    );
    
    saw_table saw_tab_phase(
    .address(addr[18:10]+phase),
    .data(saw_w_phase)
    ); 
endmodule
