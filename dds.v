module dds(input clk,
           output reg [13:0]DA_A,
           output DA_CLK_A,
           output DA_WR_A);
    
    parameter MAX_state = 5'd2;
    
    wire clk_40M;
    wire clk_100M;
    wire t_1sec;
    
    clk2	clk2_inst (
    .inclk0 (clk),
    .c0 (clk_40M),
    .c1 (clk_100M)
    );
    
    reg [13:0] cnt;
    reg [4:0] state;
    reg [13:0] DAC_data;
    
    initial begin
        cnt <= 16'b0;
    end
    
    wire cnt_tap = cnt[7];     // we take one bit out of the counter (here bit 7 = the 8th bit)
    
    always @(posedge clk_100M)
    begin
        cnt  <= cnt + 14'h1;
        DA_A <= DAC_data;
    end
    assign DA_CLK_A = clk_100M;
    assign DA_WR_A  = ~clk_100M;
    
    always @(posedge clk) begin
        if (t_1sec) begin
            state = (state == MAX_state)?5'd0:(state + 5'd1); //changes state
        end
        
        case (state)
            5'd0: begin
                DAC_data <= cnt[13:0]; //sawtooth
            end
            
            5'd1: begin
                DAC_data <= {1'b1, cnt[13] ? ~cnt[12:0] : cnt[12:0]}; //triangular
            end
            
            5'd2: begin
                DAC_data <= {cnt[13], 13'b0};
            end

            default:
            DAC_data <= {cnt[13], 13'b0};
        endcase
    end
    
    t1s t1s_inst(
    .clk(clk),
    .s(t_1sec),
    );
endmodule
