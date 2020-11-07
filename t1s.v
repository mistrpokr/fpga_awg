module t1s (clk,
            s);
    input clk;
    output s;
    
    parameter TIMER_1SEC = 28'd100000000; //TODO change to d100000000 for 100MHZ
    
    reg [27:0] loop;
    reg cnt;
    
    initial begin
        loop <= 28'd0;
        cnt  <= 1'd0;
    end
    always @(posedge clk) begin
        loop <= loop + 28'd1;
        if (loop > TIMER_1SEC) begin
            loop <= 28'd0;
            cnt  <= 1'd1;
        end
        else begin
            loop <= loop + 28'd1;
            cnt  <= 1'd0;
        end
    end
    
    assign s = cnt;
endmodule
