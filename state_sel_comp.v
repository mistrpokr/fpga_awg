module state_sel_comp (clk,
                       cmd,
                       rd,
                       state,
                       state_freq,
                       state_amp,
                       state_phase);
    input clk;
    input [7:0] cmd;
	input rd; 
    output reg [4:0] state; // TODO Will 5 bits work?
    output reg [7:0] state_freq;
    output reg [7:0] state_amp;
    output reg [7:0] state_phase;
    
    parameter DEF_STATE = 5'd3;
    
    wire shift_1s;
    
	reg [1:0] cmd_state; 
    reg [31:0] parse_buf;
    reg [31:0] parsed;
    
    initial begin
        state       <= DEF_STATE;
        state_freq  <= 8'd1;
        state_amp   <= 8'd1;
        state_phase <= 8'd1;
        
        parse_buf <= 32'd0;
        parsed    <= 32'b0001_0001_0001_0001;
    end
    
    /*
     for every time posedge rd is triggered,
     a new ASCII char has already been read into cmd buffer
     in other words no worries for accidentally reading same char
     for more than one times.
     at every always @(posedge rd) begin,
     a new char comes in.
     */
    always @(posedge rd) begin
        // Sample input: "f1234"
        
        // *ONLY INPUT STARTING WITH AN "f" PUTS cmd_state into 2'd1*
        if (cmd == "f") begin
            cmd_state <= 2'd1;
            parse_buf <= 32'd0;
        end
        else begin
            case (cmd_state)
                2'd0: begin //Normal Output
                    cmd_state <= 2'd0;  // TODO is this necessary?
                    
                    //repeatedly sets all states to corresponding decimal number
                    state       <= parsed[31:24] - 8'd48;
                    state_freq  <= parsed[23:16] - 8'd48;
                    state_amp   <= parsed[15:8] - 8'd48;
                    state_phase <= parsed[7:0] - 8'd48;
                end
                
                2'd1: begin //Receive command after "f" received
                    //48-'0', 57-'9'
                    
                    // Got other than 1~9 or got 0, clears buffer and restarts
                    if (cmd == "0" || cmd < 8'd48 || cmd > 8'd57) begin
                        parse_buf <= 32'd0;
                        cmd_state <= 2'd0;
                    end
                    else begin
                        // Append received cmd to 8 LSB of parse buffer
                        parse_buf <= {parse_buf[31:8], cmd[7:0]}; 
                    end
                    
                    // When 8 MSBs are filled(received 4th cmd char)
                    if (parse_buf[31]|parse_buf[30]|parse_buf[29]|parse_buf[28]|
                    parse_buf[27]|parse_buf[26]|parse_buf[25]|parse_buf[24])
                    begin
                        parsed[31:0] <= parse_buf[31:0]; // Send buffer to "permanent" parsed register
                        
                        state       <= parsed[31:24] - 8'd48;
                        state_freq  <= parsed[23:16] - 8'd48;
                        state_amp   <= parsed[15:8] - 8'd48;
                        state_phase <= parsed[7:0] - 8'd48;
                        
                        cmd_state <= 2'd0; // Keep normal output following 4-digit command
                    end
                end
            endcase
        end
    end
    
endmodule
