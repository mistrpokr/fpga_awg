module sig_gen(input clk,
               input [4:0] state,
               output reg [13:0]DA_A,
               output DA_CLK_A,
               output DA_WR_A);
    
    parameter MAX_state = 5'd3;
    
    wire t_1sec;
    
    reg [13:0] cnt;
    // reg [4:0] state;
    reg [3:0] en;
    reg [15:0] addr;
    reg [13:0] DAC_data;
    
    wire [13:0] saw;
    wire [13:0] Tri; // 'tri' is reserved in verilog
    wire [13:0] sqr;
    wire [13:0] sin;
    
    initial begin
        cnt  <= 16'b0;
        addr <= 15'b0;
        en   <= 4'b0;
    end
    
    assign DA_CLK_A = clk;
    assign DA_WR_A  = ~clk;
    
    always @(posedge clk)
    begin
        cnt  <= cnt + 14'h1;
        DA_A <= DAC_data;
        
        addr <= addr + 16'd1321;
        
        // if (t_1sec) begin
        //     state = (state == MAX_state)?5'd0:(state + 5'd1); //changes state
        // end
        
        case (state)
            5'd0: begin
                en       <= 4'b0001;
                DAC_data <= saw; //sawtooth
            end
            
            5'd1: begin
                en       <= 4'b0010;
                DAC_data <= Tri; //triangular
            end
            
            5'd2: begin
                en       <= 4'b0100;
                DAC_data <= sqr;
            end
            
            5'd3: begin
                en       <= 4'b1000;
                DAC_data <= sin;
            end
            
            5'd10: begin
                en       <= 4'b0000;
                DAC_data <= 14'b0;
            end
            
            default:
            DAC_data <= 14'b0;
        endcase
    end
    
    t1s t1s_inst(
    .clk(clk),
    .s(t_1sec)
    );
    
    saw_gen saw_inst(
    .cnt(cnt),
    .en(en[0]),
    .DAC_in(saw)
    );
    
    tri_gen tri_inst(
    .cnt(cnt),
    .en(en[1]),
    .DAC_in(Tri),
    );
    
    sqr_gen sqr_inst(
    .cnt(cnt),
    .en(en[2]),
    .DAC_in(sqr),
    );
    
    sin_gen sin_inst(
    .addr(addr),
    .en(en[3]),
    .DAC_in(sin),
    );
    
endmodule
