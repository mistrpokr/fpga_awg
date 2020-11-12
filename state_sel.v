module state_sel (clk,
                  cmd,
                  rd,
                  state,
                  state_freq,
                  state_amp,
                  state_phase);
    input clk;
    input [7:0] cmd;
    input rd;
    output [2:0] state;
    output  [11:0] state_freq;
    output [3:0] state_amp;
    output [7:0] state_phase;
    
    parameter DEF_STATE = 5'd0;
    
    reg [1:0] cmd_state;
    reg [31:0] parse_buf;
    reg [31:0] parsed;
    
    wire shift_1s;
    
    initial begin
        // state       <= DEF_STATE;
        // state_freq  <= 12'd1;
        // state_amp   <= 3'd50;
        // state_phase <= 8'd50;
        
        parse_buf <= 32'd0;
    end
    
    assign state       = parse_buf[31:24] - 8'd48;
    assign state_freq  = parse_buf[23:16] - 8'd48;
    assign state_amp   = parse_buf[15:8] - 8'd48;
    assign state_phase = parse_buf[7:0] - 8'd48;
    
    
    always @(posedge rd) begin
        if (cmd > "0" && cmd <= "9") begin
            parse_buf <= {parse_buf[23:0], cmd[7:0]};
        end
        else if (cmd == "0") begin
            parse_buf <= 32'd0;
        end
    end

    endmodule
