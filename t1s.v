module t1s (clk,
            s);
    input clk;
    output s;
    
    parameter TIMER_1SEC = 24'd11999999;
    
    reg [23:0] loop;
    reg cnt;
    
    initial begin
        loop <= 24'd0;
        cnt  <= 1'd0;
    end
    always @(posedge clk) begin
        loop <= loop + 24'd1;
        if (loop > TIMER_1SEC) begin
            loop <= 24'd0;
            cnt  <= 1'd1;
        end
        else begin
            loop <= loop + 24'd1;
            cnt  <= 1'd0;
        end
    end
    
    assign s = cnt;
endmodule
