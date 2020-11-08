module saw_gen (en,
                clk,
                freq,
                amp,
                phase,
                DAC_in);
    input en;
    input clk;
    input [11:0] freq;
    input [2:0] amp;
    input [7:0] phase;
    output [13:0] DAC_in;
    
    reg [18:0] addr;
    reg [13:0] data_amp;
    wire [13:0] data;
    wire [15:0] addr_step;
    
    initial addr <= 19'd0;
    
    assign DAC_in[13:0]    = en?data:14'b0;
    assign addr_step[11:0] = freq[11:0];
    
    always @(posedge clk) begin
        addr <= addr + freq;
        data_amp <= (data[13]?
        (data-14'd8192)/amp+14'd8192
        :14'd8192-(14'd8192-data)/amp);
    end
    
    saw_table saw_table_inst(
    .address(addr[18:9]),
    .data(data)
    );
endmodule
