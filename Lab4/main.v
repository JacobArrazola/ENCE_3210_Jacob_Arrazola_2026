module main(
    input MAX10_CLK1_50,
    input  [9:0] SW,       // SW[1] = Enable, SW[0] = Clear
    input  [1:0] KEY,      // KEY[0] = manual clock button
    output [9:0] LEDR,
    output [35:0] GPIO,
    output [7:0] HEX0,
    output [7:0] HEX1,
    output [7:0] HEX2,
    output [7:0] HEX3,
    output [7:0] HEX4,
    output [7:0] HEX5
);

	// assign LEDR = SW;

	// PART I
	/*
    wire [7:0] Q;
	 
    
	 reg [24:0] clk_divider = 25'b0;
    
    always @(posedge MAX10_CLK1_50) begin
        clk_divider <= clk_divider + 1'b1;
    end
    
    // Use the highest bit of the counter as your clean clock
    wire manual_clock;
    assign manual_clock = clk_divider[24]; 
	 
	 wire manual_clock;
	 assign manual_clock = ~KEY[0];
	 
	 
    // DEBOUNCED KEY0 - ONE COUNT PER PRESS
	 
    wire key0_pulse;

    Key_Debounce debounce_inst(
        .clk(MAX10_CLK1_50),
        .key_n(KEY[0]),
        .press_pulse(key0_pulse)
    );

   /*
	// 8-BIT COUNTER

    wire [7:0] Q;

    Counter_8bit counter_inst(
        .ena(SW[1] & key0_pulse),
        .clk(MAX10_CLK1_50),
        .clear(~SW[0]),
        .count(Q)
    );

	 // Display binary count on LEDs
    assign LEDR[7:0] = Q;
    assign LEDR[9:8] = 2'b00;

    // HEX0 - LOWER 4 BITS

    hex_decoder hex0_display (
        .nibble(Q[3:0]),
        .seg(HEX0[6:0])
    );

    // Decimal point OFF
    assign HEX0[7] = 1'b1;

    // HEX1 - UPPER 4 BITS

    hex_decoder hex1_display (
        .nibble(Q[7:4]),
        .seg(HEX1[6:0])
    );

    // Decimal point OFF
    assign HEX1[7] = 1'b1;

    // UNUSED HEX DISPLAYS

    assign HEX2 = 8'b11111111;
    assign HEX3 = 8'b11111111;
    assign HEX4 = 8'b11111111;
    assign HEX5 = 8'b11111111;
	 */
	 
	 /*
    // LAB 4 - PART II
    // 16-BIT COUNTER USING ADDITION

    wire [15:0] Q2;
    wire key0_pulse;

    // Debounce KEY0
    Key_Debounce debounce_inst(
        .clk(MAX10_CLK1_50),
        .key_n(KEY[0]),
        .press_pulse(key0_pulse)
    );

    // 16-bit counter
    Counter_16bit counter2_inst(
        .ena(SW[1] & key0_pulse),
        .clk(MAX10_CLK1_50),
        .clear(~SW[0]),
        .count(Q2)
    );

    // Display lower 10 bits on LEDs
    assign LEDR = Q2[9:0];

    // Display 16-bit hexadecimal count
    hex_decoder hex0_display(
        .nibble(Q2[3:0]),
        .seg(HEX0[6:0])
    );

    hex_decoder hex1_display(
        .nibble(Q2[7:4]),
        .seg(HEX1[6:0])
    );

    hex_decoder hex2_display(
        .nibble(Q2[11:8]),
        .seg(HEX2[6:0])
    );

    hex_decoder hex3_display(
        .nibble(Q2[15:12]),
        .seg(HEX3[6:0])
    );

    // Turn decimal points OFF
    assign HEX0[7] = 1'b1;
    assign HEX1[7] = 1'b1;
    assign HEX2[7] = 1'b1;
    assign HEX3[7] = 1'b1;

    // Unused displays
    assign HEX4 = 8'b11111111;
    assign HEX5 = 8'b11111111;

    // Unused GPIO outputs
    assign GPIO = 36'b0;
	 */
	 
	 /*
    // LAB 4 - PART III
    // 16-BIT LPM COUNTER

    wire key0_pulse;
	 wire [15:0] Q2;
	 
	 assign LEDR = Q2[9:0];

	Key_Debounce debounce_inst(
		 .clk(MAX10_CLK1_50),
		 .key_n(KEY[0]),
		 .press_pulse(key0_pulse)
	);
	
	 Counter_LPM_16bit counter3_inst(
        .ena(SW[1] & key0_pulse),
        .clk(MAX10_CLK1_50),
        .clear(~SW[0]),
        .count(Q2)
    );
	 
    // HEX0 - LOWER 4 BITS
    hex_decoder hex0_display(
        .nibble(Q2[3:0]),
        .seg(HEX0[6:0])
    );
	 
    // HEX1 - BITS 7:4
    hex_decoder hex1_display(
        .nibble(Q2[7:4]),
        .seg(HEX1[6:0])
    );
	 
    // HEX2 - BITS 11:8
    hex_decoder hex2_display(
        .nibble(Q2[11:8]),
        .seg(HEX2[6:0])
    );
	 
    // HEX3 - UPPER 4 BITS
    hex_decoder hex3_display(
        .nibble(Q2[15:12]),
        .seg(HEX3[6:0])
    );

    // Decimal points OFF
    assign HEX0[7] = 1'b1;
    assign HEX1[7] = 1'b1;
    assign HEX2[7] = 1'b1;
    assign HEX3[7] = 1'b1;

    // Unused HEX displays
    assign HEX4 = 8'b11111111;
    assign HEX5 = 8'b11111111;
	 */
	 
	 
	 /*
    // LAB 4 - PART IV
    // DISPLAY DIGITS 0 TO 9 EVERY SECOND

    wire one_second_tick;
    wire [3:0] digit;

    // One-second timer
    One_Second_Timer timer_inst(
        .clk(MAX10_CLK1_50),
        .clear(SW[0]),
        .tick(one_second_tick)
    );

    // Counter from 0 to 9
    Counter_0to9 digit_counter_inst(
        .clk(MAX10_CLK1_50),
        .clear(SW[0]),
        .enable(one_second_tick),
        .count(digit)
    );

    // Display digit on HEX0
    hex_decoder hex0_display(
        .nibble(digit),
        .seg(HEX0[6:0])
    );

    // Decimal point OFF
    assign HEX0[7] = 1'b1;

    // Turn off unused HEX displays
    assign HEX1 = 8'b11111111;
    assign HEX2 = 8'b11111111;
    assign HEX3 = 8'b11111111;
    assign HEX4 = 8'b11111111;
    assign HEX5 = 8'b11111111;

    // Show the digit in binary on LEDs
    assign LEDR[3:0] = digit;
    assign LEDR[9:4] = 6'b000000;

    // Unused GPIO
    assign GPIO = 36'b0;
	 */
	
	 /*
    // LAB 4 - PART V
    // SCROLLING HELLO MESSAGE

    wire one_second_tick;

    // Generate one pulse every second
    One_Second_Timer timer_inst(
        .clk(MAX10_CLK1_50),
        .clear(SW[0]),
        .tick(one_second_tick)
    );

    // Scroll HELLO across six HEX displays
    Hello_Scroll scroll_inst(
        .clk(MAX10_CLK1_50),
        .clear(SW[0]),
        .enable(one_second_tick),

        .HEX0(HEX0),
        .HEX1(HEX1),
        .HEX2(HEX2),
        .HEX3(HEX3),
        .HEX4(HEX4),
        .HEX5(HEX5)
    );

    // LEDs off
    assign LEDR = 10'b0000000000;

    // Unused GPIO
    assign GPIO = 36'b0;
	 */
	 
	 // Just for fun my name
    // SCROLLING my name MESSAGE

    wire one_second_tick;

    // Generate one pulse every second
    One_Second_Timer timer_inst(
        .clk(MAX10_CLK1_50),
        .clear(SW[0]),
        .tick(one_second_tick)
    );

    // Scroll HELLO across six HEX displays
    MyName scroll_inst(
        .clk(MAX10_CLK1_50),
        .clear(SW[0]),
        .enable(one_second_tick),

        .HEX0(HEX0),
        .HEX1(HEX1),
        .HEX2(HEX2),
        .HEX3(HEX3),
        .HEX4(HEX4),
        .HEX5(HEX5)
    );

    // LEDs off
    assign LEDR = 10'b0000000000;

    // Unused GPIO
    assign GPIO = 36'b0;
	 


endmodule