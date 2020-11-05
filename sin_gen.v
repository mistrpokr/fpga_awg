module sin_gen (en,
                clk,
                state_freq,
                state_amp,
                state_phase,
                DAC_in);
    // input [15:0] addr;
    input en;
    input clk;
    input [11:0] state_freq;
    input [7:0] state_amp;
    input [7:0] state_phase;
    output [13:0] DAC_in;
    
    reg [15:0] addr;
    wire [13:0] sin_w;
    wire [15:0] addr_step;
    
    assign DAC_in[13:0]    = en?sin_w:14'b0;
    assign addr_step[11:0] = state_freq[11:0];
    
    always @(posedge clk) begin
        addr <= addr + addr_step;
    end
    
    sin_table sin_tab_inst(
    .address(addr[15:7]),
    .data(sin_w)
    );
endmodule
