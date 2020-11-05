module state_sel (clk,
                  cmd,
                  state,
                  state_freq,
                  state_amp,
                  state_phase);
    input clk;
    input [7:0] cmd;
    output reg [4:0] state;
    output reg [11:0] state_freq;
    output reg [7:0] state_amp;
    output reg [7:0] state_phase;
    
	parameter DEF_STATE = 5'd3;

	wire shift_1s; 

    initial begin
        state <= DEF_STATE;
		state_freq <= 12'd1; 
		state_amp <= 8'd50; 
		state_phase <= 8'd50; 
    end
    
    always @(posedge clk) begin

		// if (shift_1s) begin
		// 	state_freq <= state_freq + 12'd100; 
		// end

        // case (cmd)
        //     8'd49: begin //1
        //         state <= 5'd0;
        //     end
        //     8'd50: begin //2
        //         state <= 5'd1;
        //     end
        //     8'd51: begin //3
        //         state <= 5'd2;
        //     end
        //     8'd52: begin //4
        //         state <= 5'd3;
        //     end
        //     8'd48: begin //0
        //         state <= 5'd10;
        //     end
        //     default: state <= state;
        // endcase
        case (cmd)
            8'd49: begin //1
                state_freq <= 12'd1;
            end
            8'd50: begin //2
				state_freq <= 12'd524; 
            end
            8'd51: begin //3
				state_freq <= 12'd100; 
            end
            8'd52: begin //4
				state_freq <= 12'd1000; 
            end
            8'd48: begin //0
				state_freq <= 12'd10000; 
            end
            default: state <= state;
        endcase
    end

	t1s freq_shift(
		.clk(clk), 
		.s(shift_1s)
	); 
endmodule
