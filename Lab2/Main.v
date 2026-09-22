module Main(
    // Pinout Assignment
//    input  [9:0] SW,
//    output [9:0] LEDR,
//    output [7:0] HEX0,
//    output [7:0] HEX1,
//    output [7:0] HEX2,
//    output [7:0] HEX3,
//    output [7:0] HEX4,
//    output [7:0] HEX5
//);

	  // Part I
	  
    // Connect switches to LEDs
    //assign LEDR[9:0] = SW[9:0];

	 
	 // PART II
	 
//	 wire [3:0] w_m;
//
//    // 7-Segment Decoder
//    Seg7_Decoder D0(
//        .m(w_m),
//        .out(HEX0)
//    );
//
//	 wire w_z;
//     // FIX: w_z is a 1-bit wire, but SW[9:0] is 10 bits. 
//     // This assignment was removed because the Comparator (myC) drives w_z correctly below.
//	 
//	 wire [2:0] w_ca;
//	 
//	 // multiplexers
//	 mux_2_1 m0(
//		.s(w_z),
//		.x(SW[0]),
//		.y(w_ca[0]),
//		.m(w_m[0])
//	 );
//
//	 mux_2_1 m1(
//		.s(w_z),
//		.x(SW[1]),
//		.y(w_ca[1]),
//		.m(w_m[1])
//	 );
//	 
//	 mux_2_1 m2(
//		.s(w_z),
//		.x(SW[2]),
//		.y(w_ca[2]),
//		.m(w_m[2])
//	 );
//	 
//	 mux_2_1 m3(
//		.s(w_z),
//		.x(SW[3]),
//		.y(1'b0),
//		.m(w_m[3])
//	 );
//	 
//	 //Circuit A
//	 CircuitA CA(
//		.v({SW[2], SW[1], SW[0]}),
//		.out(w_ca)              // FIX: Removed the trailing comma here
//	 );
//	
//	//Comparator
//	Comparator myC(
//		.v({SW[3], SW[2], SW[1], SW[0]}),
//		.z(w_z)
//	);
//
//	// Circuit B
//	circuitB CB(
//		.z(w_z),
//		.s(HEX1)
//	);
	
	// PART III
	
	// Comment out lines 3-11 with ctrl + q or ctrl + shift + C and uncomment 85-139 with ctrl + shift + q or ctrl + shift + u
//	 input [9:0] SW,
//    output [9:0] LEDR,
//    output [2:0] LEDG
//);
//	
//	   wire c1;
//    wire c2;
//    wire c3;
//    wire cout;
//
//    wire [3:0] S;
//
//    // Show switches on red LEDs
//    assign LEDR = SW;
//
//   FullAdder FA0(
//		 .a(SW[0]),
//		 .b(SW[4]),
//		 .cin(SW[8]),
//		 .s(S[0]),
//		 .cout(c1)
//	);
//
//	FullAdder FA1(
//		 .a(SW[1]),
//		 .b(SW[5]),
//		 .cin(c1),
//		 .s(S[1]),
//		 .cout(c2)
//	);
//
//	FullAdder FA2(
//		 .a(SW[2]),
//		 .b(SW[6]),
//		 .cin(c2),
//		 .s(S[2]),
//		 .cout(c3)
//	);
//
//	FullAdder FA3(
//		 .a(SW[3]),
//		 .b(SW[7]),
//		 .cin(c3),
//		 .s(S[3]),
//		 .cout(cout)
//	);
//
//    // Green LEDs show the result
//    assign LEDG[0] = S[0];
//    assign LEDG[1] = S[1];
//    assign LEDG[2] = S[2];

	
	// PART IV
	
	// Show switches on LEDs
    // LEDR[9] is used for the BCD error indicator

//    wire error;
//
//    assign LEDR[8:0] = SW[8:0];
//
//    // Error if A > 9 OR B > 9
//    assign error = (SW[7:4] > 4'd9) | 
//                   (SW[3:0] > 4'd9);
//
//    assign LEDR[9] = error;
//
//    // 4-bit binary adder
//    // A = SW[7:4]
//    // B = SW[3:0]
//    // cin = SW[8]
//
//    wire [3:0] S;
//
//    wire c1;
//    wire c2;
//    wire c3;
//    wire cout;
//
//    FullAdder FA0(
//        .a(SW[4]),
//        .b(SW[0]),
//        .cin(SW[8]),
//        .s(S[0]),
//        .cout(c1)
//    );
//
//    FullAdder FA1(
//        .a(SW[5]),
//        .b(SW[1]),
//        .cin(c1),
//        .s(S[1]),
//        .cout(c2)
//    );
//
//    FullAdder FA2(
//        .a(SW[6]),
//        .b(SW[2]),
//        .cin(c2),
//        .s(S[2]),
//        .cout(c3)
//    );
//
//    FullAdder FA3(
//        .a(SW[7]),
//        .b(SW[3]),
//        .cin(c3),
//        .s(S[3]),
//        .cout(cout)
//    );
//
//    // 5-bit result
//
//    wire [4:0] T;
//
//    assign T = {cout, S};
//
//    // Detect if result is 10-19
//	 
//    wire z;
//
//    assign z = T[4] | (T[3] & (T[2] | T[1]));
//
//    // BCD result
//    // S1 = tens digit
//    // S0 = ones digit
//
//    wire [3:0] S1;
//    wire [3:0] S0;
//
//    assign S1 = {3'b000, z};
//
//    assign S0 = z ? (T - 5'd10) : T[3:0];
//
//    // Display A and B
//
//    Seg7_Decoder DA(
//        .m(SW[7:4]),
//        .out(HEX5)
//    );
//
//    Seg7_Decoder DB(
//        .m(SW[3:0]),
//        .out(HEX4)
//    );
//
//    // Display BCD result
//
//    Seg7_Decoder DS1(
//        .m(S1),
//        .out(HEX1)
//    );
//
//    Seg7_Decoder DS0(
//        .m(S0),
//        .out(HEX0)
//    );
//
//    // Unused displays OFF
//
//    assign HEX2 = 8'b11111111;
//    assign HEX3 = 8'b11111111;
	 
	 // PART V
	 // Comment out lines 3-11
	 input  [15:0] SW,
    output [15:0] LEDR,

    output [7:0] HEX0,
    output [7:0] HEX1,
    output [7:0] HEX2,
    output [7:0] HEX3,
    output [7:0] HEX4,
    output [7:0] HEX5,
    output [7:0] HEX6,
    output [7:0] HEX7
);

//    // Show switches on LEDs
//
//    assign LEDR = SW;
//
//    // Separate A and B
//
//    wire [3:0] A1;
//    wire [3:0] A0;
//    wire [3:0] B1;
//    wire [3:0] B0;
//
//    assign A1 = SW[15:12];
//    assign A0 = SW[11:8];
//
//    assign B1 = SW[7:4];
//    assign B0 = SW[3:0];
//
//    // Results
//
//    wire [3:0] S0;
//    wire [3:0] S1;
//    wire [3:0] S2;
//
//    // Carry from lower BCD digit
//    wire carry0;
//
//    // FIRST BCD ADDER   A0 + B0
//
//    BCD_Adder ADDER0(
//        .A(A0),
//        .B(B0),
//        .cin(1'b0),
//        .S0(S0),
//        .S1(carry0)
//    );
//
//    // SECOND BCD ADDER   A1 + B1 + carry0
//
//    BCD_Adder ADDER1(
//        .A(A1),
//        .B(B1),
//        .cin(carry0),
//        .S0(S1),
//        .S1(S2)
//    );
//
//    // DISPLAY A
//
//    Seg7_Decoder DA1(
//        .m(A1),
//        .out(HEX7)
//    );
//
//    Seg7_Decoder DA0(
//        .m(A0),
//        .out(HEX6)
//    );
//
//    // DISPLAY B
//
//    Seg7_Decoder DB1(
//        .m(B1),
//        .out(HEX5)
//    );
//
//    Seg7_Decoder DB0(
//        .m(B0),
//        .out(HEX4)
//    );
//
//    // DISPLAY RESULT S2 S1 S0
//
//    Seg7_Decoder DS2(
//        .m(S2),
//        .out(HEX2)
//    );
//
//    Seg7_Decoder DS1(
//        .m(S1),
//        .out(HEX1)
//    );
//
//    Seg7_Decoder DS0(
//        .m(S0),
//        .out(HEX0)
//    );
//
//    // Unused display
//
//    assign HEX3 = 8'b11111111;
	 
	 // PART VI
	 // Comment out 264-353
	wire [3:0] A1;
	wire [3:0] A0;
	wire [3:0] B1;
	wire [3:0] B0;

	wire [3:0] S0;
	wire [3:0] S1;
	wire S2;

	// SWITCHES

	assign A1 = SW[15:12];
	assign A0 = SW[11:8];

	assign B1 = SW[7:4];
	assign B0 = SW[3:0];

	// TWO-DIGIT BCD ADDER

	BCD_Adder_Algorithm BCD0(
		 .A0(A0),
		 .A1(A1),
		 .B0(B0),
		 .B1(B1),
		 .S0(S0),
		 .S1(S1),
		 .S2(S2)
	);
	
	// 7-SEGMENT DISPLAYS

	// Ones digit
	Seg7_Decoder D0(
		 .m(S0),
		 .out(HEX0)
	);

	// Tens digit
	Seg7_Decoder D1(
		 .m(S1),
		 .out(HEX1)
	);

	// Hundreds digit
	Seg7_Decoder D2(
		 .m({3'b000, S2}),
		 .out(HEX2)
	);

	// DISPLAY INPUT A

	Seg7_Decoder DA1(
		 .m(A1),
		 .out(HEX7)
	);

	Seg7_Decoder DA0(
		 .m(A0),
		 .out(HEX6)
	);

	// DISPLAY INPUT B

	Seg7_Decoder DB1(
		 .m(B1),
		 .out(HEX5)
	);

	Seg7_Decoder DB0(
		 .m(B0),
		 .out(HEX4)
	);

	// UNUSED DISPLAY

	assign HEX3 = 8'b11111111;
	 
endmodule
