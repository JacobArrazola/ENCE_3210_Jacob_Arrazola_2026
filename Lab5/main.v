module main(
    input MAX10_CLK1_50,
    input [9:0] SW,
    input [1:0] KEY,
    output [9:0] LEDR,
    output [35:0] GPIO,
    output [7:0] HEX0,
    output [7:0] HEX1,
    output [7:0] HEX2,
    output [7:0] HEX3,
    output [7:0] HEX4,
    output [7:0] HEX5
);

    // LAB 5 - PART I
    // 8-BIT ACCUMULATOR
	/*
    wire [7:0] S;
    wire overflow;

    wire key1_pulse;

	Key_Debounce debounce_inst(
		 .clk(MAX10_CLK1_50),
		 .key_n(KEY[1]),
		 .press_pulse(key1_pulse)
	);

	/*
    Accumulator_8bit accumulator_inst(
    .A(SW[7:0]),
    .clk(MAX10_CLK1_50),
    .reset_n(KEY[0]),
    .enable(key1_pulse),
    .S(S),
    .overflow(overflow)
	 );
	 /*
    assign LEDR[7:0] = S;
    assign LEDR[8] = overflow;
    assign LEDR[9] = 1'b0;
	
	
    // LAB 5 - PART I
    // Correct LEDR mapping

    assign LEDR[0] = S[0];
    assign LEDR[1] = S[1];
    assign LEDR[2] = S[2];
    assign LEDR[3] = S[3];
    assign LEDR[4] = S[4];
    assign LEDR[5] = S[5];
    assign LEDR[6] = S[6];
    assign LEDR[7] = S[7];

    assign LEDR[8] = overflow;
    assign LEDR[9] = 1'b0;

	 
    assign HEX0 = 8'b11111111;
    assign HEX1 = 8'b11111111;
    assign HEX2 = 8'b11111111;
    assign HEX3 = 8'b11111111;
    assign HEX4 = 8'b11111111;
    assign HEX5 = 8'b11111111;

    assign GPIO = 36'b0;
	 
endmodule
	 
	 */
	 
	 // PART II - ADDER AND SUBTRACTOR
	/*
    wire [7:0] S;
    wire overflow;
    wire key1_pulse;

    // Debounce KEY1
    Key_Debounce debounce_inst(
        .clk(MAX10_CLK1_50),
        .key_n(KEY[1]),
        .press_pulse(key1_pulse)
    );

    // 8-bit accumulator with add/subtract
    Accumulator_8bit accumulator_inst(
        .A(SW[7:0]),
        .clk(MAX10_CLK1_50),
        .reset_n(KEY[0]),
        .enable(key1_pulse),
        .add_sub(SW[8]),
        .S(S),
        .overflow(overflow)
    );

    // LED OUTPUTS

    assign LEDR[7:0] = S;
    assign LEDR[8] = overflow;
    assign LEDR[9] = 1'b0;

    // Turn off unused 7-segment displays
    assign HEX0 = 8'b11111111;
    assign HEX1 = 8'b11111111;
    assign HEX2 = 8'b11111111;
    assign HEX3 = 8'b11111111;
    assign HEX4 = 8'b11111111;
    assign HEX5 = 8'b11111111;
endmodule
	 */
	 
	 // LAB 5 - PART III
    // 4-BIT ARRAY MULTIPLIER
	 /*
    wire [3:0] A;
    wire [3:0] B;
    wire [7:0] P;

    assign A = SW[7:4];
    assign B = SW[3:0];

    // ARRAY MULTIPLIER
    ArrayMultiplier4 multiplier_inst(
        .A(A),
        .B(B),
        .P(P)
    );

    // 7-SEGMENT DISPLAYS

    // Display A on HEX5
    HexDecoder display_A(
        .value(A),
        .hex(HEX5[6:0])
    );

    // Display B on HEX4
    HexDecoder display_B(
        .value(B),
        .hex(HEX4[6:0])
    );

    // Display upper product digit on HEX1
    HexDecoder display_P_high(
        .value(P[7:4]),
        .hex(HEX1[6:0])
    );

    // Display lower product digit on HEX0
    HexDecoder display_P_low(
        .value(P[3:0]),
        .hex(HEX0[6:0])
    );

    // Turn off unused displays
    assign HEX2 = 8'b11111111;
    assign HEX3 = 8'b11111111;

    // Unused eighth bits
    assign HEX0[7] = 1'b1;
    assign HEX1[7] = 1'b1;
    assign HEX4[7] = 1'b1;
    assign HEX5[7] = 1'b1;

    // Display binary product on LEDs
    assign LEDR[7:0] = P;
    assign LEDR[9:8] = 2'b00;
endmodule
	 */
	 
	 // LAB 5 - PART IV
    // 8x8 REGISTERED MULTIPLIER
	 /*
    wire [7:0] A;
    wire [7:0] B;
    wire [15:0] P;

    wire key1_pulse;

    // KEY1 DEBOUNCER

    Key_Debounce debounce_inst(
        .clk(MAX10_CLK1_50),
        .key_n(KEY[1]),
        .press_pulse(key1_pulse)
    );

    // 8x8 MULTIPLIER

    Multiplier_8bit multiplier_inst(
        .clk(MAX10_CLK1_50),
        .reset_n(KEY[0]),
        .enable(key1_pulse),
        .load_b(SW[8]),
        .data_in(SW[7:0]),
        .A_reg(A),
        .B_reg(B),
        .P(P)
    );

    // PRODUCT DISPLAY SELECTION
    // SW9 = 0: LOWER BYTE
    // SW9 = 1: UPPER BYTE

    wire [7:0] product_display;

    assign product_display =
        SW[9] ? P[15:8] : P[7:0];

    // 7-SEGMENT DISPLAY DECODERS

    // Input A
    HexDecoder hex5_inst(
        .value(A[7:4]),
        .hex(HEX5[6:0])
    );

    HexDecoder hex4_inst(
        .value(A[3:0]),
        .hex(HEX4[6:0])
    );

    // Input B
    HexDecoder hex3_inst(
        .value(B[7:4]),
        .hex(HEX3[6:0])
    );

    HexDecoder hex2_inst(
        .value(B[3:0]),
        .hex(HEX2[6:0])
    );

    // Product
    HexDecoder hex1_inst(
        .value(product_display[7:4]),
        .hex(HEX1[6:0])
    );

    HexDecoder hex0_inst(
        .value(product_display[3:0]),
        .hex(HEX0[6:0])
    );

    // Unused eighth bits
	 
    assign HEX0[7] = 1'b1;
    assign HEX1[7] = 1'b1;
    assign HEX2[7] = 1'b1;
    assign HEX3[7] = 1'b1;
    assign HEX4[7] = 1'b1;
    assign HEX5[7] = 1'b1;

    // LED OUTPUTS

    assign LEDR[7:0] = product_display;
    assign LEDR[8] = SW[8];
    assign LEDR[9] = SW[9];
endmodule
	 */

    // LAB 5 - PART V
    // 8x8 ADDER TREE MULTIPLIER

    wire [7:0] A;
    wire [7:0] B;
    wire [15:0] P;

    wire key1_pulse;

    // KEY1 DEBOUNCER

    Key_Debounce debounce_inst(
        .clk(MAX10_CLK1_50),
        .key_n(KEY[1]),
        .press_pulse(key1_pulse)
    );

    // 8x8 ADDER TREE MULTIPLIER

    AdderTree_8bit multiplier_inst(
        .clk(MAX10_CLK1_50),
        .reset_n(KEY[0]),
        .enable(key1_pulse),
        .load_b(SW[8]),
        .data_in(SW[7:0]),
        .A_reg(A),
        .B_reg(B),
        .P(P)
    );

    // PRODUCT DISPLAY SELECTION
    // SW9 = 0: LOWER 8 BITS
    // SW9 = 1: UPPER 8 BITS

    wire [7:0] product_display;

    assign product_display =
        SW[9] ? P[15:8] : P[7:0];

    // 7-SEGMENT DISPLAY DECODERS

    // HEX5 and HEX4 display A
    HexDecoder hex5_inst(
        .value(A[7:4]),
        .hex(HEX5[6:0])
    );

    HexDecoder hex4_inst(
        .value(A[3:0]),
        .hex(HEX4[6:0])
    );

    // HEX3 and HEX2 display B
    HexDecoder hex3_inst(
        .value(B[7:4]),
        .hex(HEX3[6:0])
    );

    HexDecoder hex2_inst(
        .value(B[3:0]),
        .hex(HEX2[6:0])
    );

    // HEX1 and HEX0 display product
    HexDecoder hex1_inst(
        .value(product_display[7:4]),
        .hex(HEX1[6:0])
    );

    HexDecoder hex0_inst(
        .value(product_display[3:0]),
        .hex(HEX0[6:0])
    );

    // UNUSED 7-SEGMENT BITS

    assign HEX0[7] = 1'b1;
    assign HEX1[7] = 1'b1;
    assign HEX2[7] = 1'b1;
    assign HEX3[7] = 1'b1;
    assign HEX4[7] = 1'b1;
    assign HEX5[7] = 1'b1;

    // LED OUTPUTS

    // Display selected product byte on LEDs
    assign LEDR[7:0] = product_display;

    // LEDR8 shows input selection
    assign LEDR[8] = SW[8];

    // LEDR9 shows product byte selection
    assign LEDR[9] = SW[9];

endmodule

	 