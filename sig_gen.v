module sig_gen(input clk,
               input [2:0] state,
               input [11:0] state_freq,
               input [3:0] state_amp,
               input [7:0] state_phase,
               output reg [13:0]DA_A,
               output DA_CLK_A,
               output DA_WR_A,
               output reg [13:0]DA_B,
               output DA_CLK_B,
               output DA_WR_B);
    
    parameter MAX_state = 5'd3;
    
    wire t_1sec;
    
    // reg [4:0] state;
    reg [3:0] en;
    reg [15:0] addr;
    reg [13:0] DAC_data;
    reg [13:0] DAC_data_phase;
    
    wire [13:0] saw;
    wire [13:0] Tri; // 'tri' is reserved in verilog
    wire [13:0] sqr;
    wire [13:0] sin;
    wire [13:0] rand;
    wire [13:0] saw_phase;
    wire [13:0] Tri_phase; // 'tri' is reserved in verilog
    wire [13:0] sqr_phase;
    wire [13:0] sin_phase;
    
    wire [11:0] freq;
    wire [3:0] amp;
    wire [8:0] phase;
    
    initial begin
        addr <= 15'b0;
        en   <= 4'b0;
    end
    
    assign DA_CLK_A = clk;
    assign DA_WR_A  = ~clk;
    assign DA_CLK_B = clk;
    assign DA_WR_B  = ~clk;
    
    // assign freq = 12'd524 * state_freq;
    assign freq    = freq_calc(state_freq[3:0]);
    assign amp     = state_amp;
    // assign amp  = 3'd1;
    assign phase   = 64*state_phase;
    
    function [11:0] freq_calc;
        input [3:0] state_freq;
        begin
            case (state_freq[3:0])
                4'd1: freq_calc    = 12'd5; //1k
                4'd2: freq_calc    = 12'd52; //10k
                4'd3: freq_calc    = 12'd105; //20k
                4'd4: freq_calc    = 12'd524; //100k
                4'd5: freq_calc    = 12'd1048; //200k
                4'd6: freq_calc    = 12'd2620; //500k
                // 4'd7: freq_calc    = 12'd5240; //1M
                // 4'd8: freq_calc    = 12'd52400; //10M?
                default: freq_calc = 12'd1;
            endcase
        end
    endfunction
    
    always @(posedge clk)
    begin
        DA_A <= DAC_data;
        DA_B <= DAC_data_phase;
        
        case (state)
            3'd0: begin
                en             <= 4'b0001;
                DAC_data       <= saw; //sawtooth
                DAC_data_phase <= saw_phase;
            end
            
            3'd1: begin
                en             <= 4'b0010;
                DAC_data       <= Tri; //triangular
                DAC_data_phase <= Tri_phase;
            end
            
            3'd2: begin
                en             <= 4'b0100;
                DAC_data       <= sqr;
                DAC_data_phase <= sqr_phase;
            end
            
            3'd3: begin
                en             <= 4'b1000;
                DAC_data       <= sin;
                DAC_data_phase <= sin_phase;
            end
            
            3'd4: begin
                DAC_data       <= rand;
                DAC_data_phase <= rand;
            end
            
            3'd7: begin
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
    .clk(clk),
    .en(en[0]),
    .freq(freq),
    .amp(amp),
    .phase(phase),
    .DA_A(saw),
    .DA_B(saw_phase)
    );
    
    tri_gen tri_inst(
    .clk(clk),
    .en(en[1]),
    .freq(freq),
    .amp(amp),
    .phase(phase),
    .DA_A(Tri),
    .DA_B(Tri_phase)
    );
    
    sqr_gen sqr_inst(
    .clk(clk),
    .en(en[2]),
    .freq(freq),
    .amp(amp),
    .phase(phase),
    .DA_A(sqr),
    .DA_B(sqr_phase)
    );
    
    sin_gen sin_inst(
    .clk(clk),
    .en(en[3]),
    .freq(freq),
    .amp(amp),
    .phase(phase),
    .DA_A(sin),
    .DA_B(sin_phase)
    );
    
    lfsr lfsr_inst(
    .clk(clk),
    .en(1'b1),
    .DA(rand)
    );
    
endmodule
