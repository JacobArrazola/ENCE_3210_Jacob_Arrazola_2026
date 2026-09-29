// Part 5: 8-Bit Data Register Storage with Hexadecimal Display Decoders
module part5 (Clock, SW, HEX3, HEX2, HEX1, HEX0);
    input Clock;
    input [7:0] SW;
    output [6:0] HEX3, HEX2, HEX1, HEX0;

    reg [7:0] Register_A; // The 8-bit storage register for value A
    wire [7:0] Value_B;   // Holds the current live switch value for B

    // Connect live switches directly to value B
    assign Value_B = SW[7:0];

    // Positive-Edge Triggered 8-Bit Register to capture value A
    always @(posedge Clock) begin
        Register_A <= SW[7:0];
    end

    // Instantiate 7-Segment Decoders for Stored Value A (Upper 4-bits & Lower 4-bits)
    hex_decoder hex3_inst (.nibble(Register_A[7:4]), .seg(HEX3));
    hex_decoder hex2_inst (.nibble(Register_A[3:0]), .seg(HEX2));

    // Instantiate 7-Segment Decoders for Live Value B (Upper 4-bits & Lower 4-bits)
    hex_decoder hex1_inst (.nibble(Value_B[7:4]), .seg(HEX1));
    hex_decoder hex0_inst (.nibble(Value_B[3:0]), .seg(HEX0));

endmodule

// Sub-Module: 7-Segment Hexadecimal Character Decoder (Active-Low for DE10-Lite)
module hex_decoder (nibble, seg);
    input [3:0] nibble;
    output reg [6:0] seg;

    always @(*) begin
        case (nibble)
            4'h0: seg = 7'b1000000; // Display 0
            4'h1: seg = 7'b1111001; // Display 1
            4'h2: seg = 7'b0100100; // Display 2
            4'h3: seg = 7'b0110000; // Display 3
            4'h4: seg = 7'b0011001; // Display 4
            4'h5: seg = 7'b0010010; // Display 5
            4'h6: seg = 7'b0000010; // Display 6
            4'h7: seg = 7'b1111000; // Display 7
            4'h8: seg = 7'b0000000; // Display 8
            4'h9: seg = 7'b0010000; // Display 9
            4'hA: seg = 7'b0001000; // Display A
            4'hb: seg = 7'b0000011; // Display b
            4'hC: seg = 7'b1000110; // Display C
            4'hd: seg = 7'b0100001; // Display d
            4'hE: seg = 7'b0000110; // Display E
            4'hF: seg = 7'b0001110; // Display F
            default: seg = 7'b1111111; // All Segments OFF
        endcase
    end
endmodule
