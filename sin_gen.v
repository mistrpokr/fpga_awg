module sin_gen (en,
                clk,
                freq,
                amp,
                phase,
                DA_A,
                DA_B);
    input en;
    input clk;
    input [11:0] freq;
    input [3:0] amp;
    input [7:0] phase;
    output [13:0] DA_A;
    output [13:0] DA_B;
    
    reg [18:0] addr;
    reg [13:0] sin_amp;
    reg [13:0] sin_amp_phase;
    wire [13:0] sin_w;
    wire [13:0] sin_w_phase;    
    wire [15:0] addr_step;
    
    assign DA_A[13:0]      = en?sin_amp:14'b0;
    assign DA_B[13:0]      = en?sin_amp_phase:14'b0;
    assign addr_step[11:0] = freq[11:0];
    
    always @(posedge clk) begin
        addr          <= addr + addr_step;
        sin_amp       <= sin_w/amp-14'd8192/amp+14'd8192;
        sin_amp_phase <= sin_w_phase/amp-14'd8192/amp+14'd8192;
    end
    
    sin_table sin_tab_inst(
    .address(addr[18:10]),
    .data(sin_w)
    );
    
    sin_table sin_tab_phase(
    .address(addr[18:10]+phase),
    .data(sin_w_phase)
    ); 
endmodule
