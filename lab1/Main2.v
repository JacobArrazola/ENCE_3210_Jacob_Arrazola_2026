module Main2(
    input  [17:0] SW,
    output [17:0] LEDR,
    output [2:0]  LEDG,
    output [7:0] HEX0,
    output [7:0] HEX1,
    output [7:0] HEX2,
    output [7:0] HEX3,
    output [7:0] HEX4,
    output [7:0] HEX5
);

    // PART I

    assign LEDR = SW;


    // PART II

	 wire [7:0] X;
	 wire [7:0] Y;
	 wire [7:0] M;

	 assign X = SW[7:0];
	 assign Y = SW[15:8];
		
    mux_2_1_8b MUX0(
        .s(SW[9]),
        .x(X),
        .y(Y),
        .m(M)
    );


    // PART III

    wire M5;

    mux_5_1 MUX1(
        .s2(SW[9]),
        .s1(SW[8]),
        .s0(SW[7]),
        .u(SW[6]),
        .v(SW[5]),
        .w(SW[4]),
        .x(SW[3]),
        .y(SW[2]),
        .m(M5)
    );


    // PART IV

    char_7seg D0(
        .C(SW[2:0]),
        .Display(HEX0)
    );


    // PART VI

    part6 P6(
        .SW(SW),
        .HEX0(HEX0),
        .HEX1(HEX1),
        .HEX2(HEX2),
        .HEX3(HEX3),
        .HEX4(HEX4),
        .HEX5(HEX5)
    );

endmodule