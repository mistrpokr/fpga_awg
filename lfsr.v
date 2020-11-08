module lfsr (input clk,
             input en,
             output reg [13:0] DAC_in);
    
    wire feedback = DAC_in[13]^DAC_in[12]^DAC_in[11]^DAC_in[1] ;
    
    initial begin
        DAC_in <= 14'd1;
        cnt  <= 6'd0;
    end
    
    always @(posedge clk) begin
        if (en) begin
            DAC_in <= {DAC_in[12:0], feedback} ;
        end
    end
endmodule
