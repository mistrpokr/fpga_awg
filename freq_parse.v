module freq_parse (freq_update,
                   freq,
                   addr_step);
    input freq_update;
    input freq;
    output addr_step;
    
	parameter TABLE_BIT = 4'd9;
	parameter PHASE_ACC_WIDTH = 4'd7;
	parameter SYS_CLK = 32'd100000000;

    always @(posedge freq_update) begin
        addr_step= 2**(TABLE_BIT+PHASE_ACC_WIDTH)*freq_update/
    end
endmodule
