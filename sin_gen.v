module sin_gen (en,
                addr,
                DAC_in);
    input [15:0] addr;
    input en;
    output [13:0] DAC_in;
    
    wire [13:0] sin_w;
    
    assign DAC_in[13:0] = en?sin_w:14'b0;
    
    sin_table sin_tab_inst(
    .address(addr[15:7]),
    .data(sin_w)
    );
endmodule
