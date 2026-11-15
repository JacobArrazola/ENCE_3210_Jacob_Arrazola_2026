module MyName(
    input clk,
    input clear,
    input enable,
    output [7:0] HEX0,
    output [7:0] HEX1,
    output [7:0] HEX2,
    output [7:0] HEX3,
    output [7:0] HEX4,
    output [7:0] HEX5
);

    // Character codes
    localparam J = 3'd0;
    localparam A = 3'd1;
    localparam C = 3'd2;
    localparam O = 3'd3;
	 localparam B = 3'd4;
    localparam BLANK = 3'd5;

    // Six character positions:
    // HEX5 HEX4 HEX3 HEX2 HEX1 HEX0
    reg [17:0] letters = {
        J, A, C, O, B, BLANK
    };

    // Shift one position to the left every second
    always @(posedge clk) begin
        if (clear)
            letters <= {J, A, C, O, B, BLANK};
        else if (enable)
            letters <= {letters[14:0], letters[17:15]};
    end

    // Convert characters to seven-segment patterns
    // Segment order: a b c d e f g
    // Active-low outputs

    function [7:0] char_decoder;
        input [2:0] character;
        begin
            case (character)
                J: char_decoder = 8'b11100001;
					 A: char_decoder = 8'b10001000;
                C: char_decoder = 8'b11000110;
                O: char_decoder = 8'b11000000;
                B: char_decoder = 8'b10000000;
                default: char_decoder = 8'b11111111;
            endcase
        end
    endfunction

    // Connect each character to its HEX display
    assign HEX5 = char_decoder(letters[17:15]);
    assign HEX4 = char_decoder(letters[14:12]);
    assign HEX3 = char_decoder(letters[11:9]);
    assign HEX2 = char_decoder(letters[8:6]);
    assign HEX1 = char_decoder(letters[5:3]);
    assign HEX0 = char_decoder(letters[2:0]);

endmodule
