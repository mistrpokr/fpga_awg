module saw_gen (en,
                clk,
                state_freq,
                state_amp,
                state_phase,
                DAC_in);
    input en;
    input clk;
    input [11:0] state_freq;
    input [2:0] state_amp;
    input [7:0] state_phase;
    output [13:0] DAC_in;
    
    reg [18:0] addr;
    reg [13:0] data_amp;
    wire [13:0] data;
    wire [15:0] addr_step;
    
    initial addr <= 19'd0;
    
    assign DAC_in[13:0]    = en?data:14'b0;
    assign addr_step[11:0] = state_freq[11:0];
    
    always @(posedge clk) begin
        addr        <= addr + state_freq; 
        data_amp <= (data[13]?
        (data-14'd8192)/state_amp+14'd8192
        :14'd8192-(14'd8192-data)/state_amp);
    end
    
    saw_table saw_table_inst(
    .address(addr[18:9]),
    .data(data)
    );
endmodule
