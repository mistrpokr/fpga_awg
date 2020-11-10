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
    output [2:0] state_amp;
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
        parsed    <= 32'b0001_0001_0001_0001;
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
            
            // always @(posedge clk) begin
            
            // 	// if (shif t_1s) begin
            // 	// 	state_freq <= state_freq + 12'd100;
            // 	// end
            
            //     case (cmd)
            //         8'd49: begin //1
            //             state <= 5'd0;
            //         end
            //         8'd50: begin //2
            //             state <= 5'd1;
            //         end
            //         8'd51: begin //3
            //             state <= 5'd2;
            //         end
            //         8'd52: begin //4
            //             state <= 5'd3;
            //         end
            //         8'd53: begin //5
            //             state <= 5'd4;
            //         end
            //         8'd48: begin //0
            //             state <= 5'd10;
            //         end
            //         default: state <= state;
            //     endcase
            //     // case (cmd)
            //     //     8'd49: begin //1
            //     //         state_freq <= 12'd1;
            // 	// 		state_amp           <= 3'd1;
            //     //     end
            //     //     8'd50: begin //2
            // 	// 		state_freq <= 12'd524;
            // 	// 		state_amp  <= 3'd2;
            //     //     end
            //     //     8'd51: begin //3
            // 	// 		state_freq <= 12'd100;
            // 	// 		state_amp  <= 3'd3;
            //     //     end
            //     //     8'd52: begin //4
            // 	// 		state_freq <= 12'd1000;
            // 	// 		state_amp  <= 3'd4;
            //     //     end
            //     //     8'd48: begin //0
            // 	// 		state_freq <= 12'd10000;
            //     //     end
            //     //     default: state <= state;
            //     // endcase
            // end
            
            // always @(posedge rd) begin
            //     if (cmd == 8'd102) begin //"f"
            //         cmd_state <= 2'd1;
            //         parse_buf <= 32'd0;
            //         parsed    <= 32'd0;
            //         // state  <= state+ 1'd1;
            //     end
            //     else begin
            //         case (cmd_state)
            //             2'd0: begin //Keep Output
            //                 cmd_state <= 2'd0;  // TODO is this necessary?
            
            //                 //repeatedly sets all states to corresponding decimal number
            //                 // state       <= state+ 1'd1;
            //                 state          <= parsed[31:24] - 8'd48;
            //                 // state_freq  <= parsed[23:16] - 8'd48;
            //                 // state_amp   <= parsed[15:8] - 8'd48;
            //                 // state_phase <= parsed[7:0] - 8'd48;
            //             end
            
            //             2'd1: begin //Receive command after "f" received
            //                 //48-'0', 57-'9'
            
            //                 // Got other than 1~9 or got 0, clears buffer and restarts
            //                 if (cmd == 8'd48 || cmd < 8'd48 || cmd > 8'd57) begin
            //                     parse_buf <= 32'd0;
            //                     cmd_state <= 2'd0;
            //                 end
            //                 else begin
            //                     // Append received cmd to 8 LSB of parse buffer
            //                     parse_buf <= {parse_buf[23:0], cmd[7:0]};
            //                 end
            
            //                 // When 8 MSBs are filled(received 4th cmd char)
            //                 // if (parse_buf[31]|parse_buf[30]|parse_buf[29]|parse_buf[28]|
            //                 // parse_buf[27]|parse_buf[26]|parse_buf[25]|parse_buf[24])
            //                 if (parse_buf[24] == 1'b0)
            //                 begin
            //                     parsed[31:0] <= parse_buf[31:0]; // Send buffer to "permanent" parsed register
            
            //                     // state       <= state+ 1'd1;
            //                     state          <= parsed[31:24] - 8'd48;
            //                     // state_freq  <= parsed[23:16] - 8'd48;
            //                     // state_amp   <= parsed[15:8] - 8'd48;
            //                     // state_phase <= parsed[7:0] - 8'd48;
            
            //                     cmd_state <= 2'd0; // Keep normal output following 4-digit command
            //                 end
            //             end
            //         endcase
            //     end
            // end
            
            t1s freq_shift(
            .clk(clk),
            .s(shift_1s)
            );
            endmodule
