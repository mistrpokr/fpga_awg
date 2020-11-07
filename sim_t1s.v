`timescale 1ns/1ns

module sim_t1s ();
    reg clk;
    wire s;
    
	initial clk <= 1'b0; 

    always #1 clk <= ~clk;
    
    t1s t1s_inst(
    .clk(clk),
    .s(s)
    );
endmodule
