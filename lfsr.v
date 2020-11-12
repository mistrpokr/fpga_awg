module lfsr (input clk,
             input en,
             output reg [13:0] DA);
    
    wire feedback = DA[13]^DA[12]^DA[11]^DA[1] ;
    
    initial begin
        DA <= 14'd1;
    end
    
    always @(posedge clk) begin
        if (en) begin
            DA <= {DA[12:0], feedback} ;
        end
    end
endmodule
