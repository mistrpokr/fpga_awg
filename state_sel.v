module state_sel (clk,
                  cmd,
                  state,
                  state_freq,
                  state_amp,
                  state_phase);
    input clk;
    input [7:0] cmd;
    output reg [4:0] state;
    output reg [13:0] state_freq;
    output reg [7:0] state_amp;
    output reg [7:0] state_phase;
    
    initial state <= 5'd3;
    
    always @(posedge clk) begin
        case (cmd)
            8'd49: begin //1
                state <= 5'd0;
            end
            8'd50: begin //2
                state <= 5'd1;
            end
            8'd51: begin //3
                state <= 5'd2;
            end
            8'd52: begin //4
                state <= 5'd3;
            end
            8'd48: begin //0
                state <= 5'd10;
            end
            default: state <= state;
        endcase
    end
endmodule
