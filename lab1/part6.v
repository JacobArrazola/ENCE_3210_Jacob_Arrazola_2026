module part6(
    input  [17:0] SW,
    output [7:0] HEX0,
    output [7:0] HEX1,
    output [7:0] HEX2,
    output [7:0] HEX3,
    output [7:0] HEX4,
    output [7:0] HEX5
);

    // PART VI

    wire s2;
    wire s1;
    wire s0;

    assign s2 = SW[9];
    assign s1 = SW[8];
    assign s0 = SW[7];


    // CHARACTER CODES

    wire [2:0] H;
    wire [2:0] E;
    wire [2:0] L;
    wire [2:0] O;
    wire [2:0] BLANK;


    // H = 000

    assign H[0] = SW[0] & ~SW[0];
    assign H[1] = SW[0] & ~SW[0];
    assign H[2] = SW[0] & ~SW[0];


    // E = 001

    assign E[0] = SW[0] | ~SW[0];
    assign E[1] = SW[0] & ~SW[0];
    assign E[2] = SW[0] & ~SW[0];


    // L = 010

    assign L[0] = SW[0] & ~SW[0];
    assign L[1] = SW[0] | ~SW[0];
    assign L[2] = SW[0] & ~SW[0];


    // O = 011

    assign O[0] = SW[0] | ~SW[0];
    assign O[1] = SW[0] | ~SW[0];
    assign O[2] = SW[0] & ~SW[0];


    // BLANK = 100

    assign BLANK[0] = SW[0] & ~SW[0];
    assign BLANK[1] = SW[0] & ~SW[0];
    assign BLANK[2] = SW[0] | ~SW[0];


    // MUX OUTPUTS

    wire [2:0] M0;
    wire [2:0] M1;
    wire [2:0] M2;
    wire [2:0] M3;
    wire [2:0] M4;
    wire [2:0] M5;


    // HEX0
	mux_3_5to1 MUX0(
		 .S({s2, s1, s0}),
		 .U(H),
		 .V(H),
		 .W(H),
		 .X(E),
		 .Y(L),
		 .M(M0)
	);

	// HEX1
	mux_3_5to1 MUX1(
		 .S({s2, s1, s0}),
		 .U(E),
		 .V(E),
		 .W(E),
		 .X(L),
		 .Y(L),
		 .M(M1)
	);

	// HEX2
	mux_3_5to1 MUX2(
		 .S({s2, s1, s0}),
		 .U(L),
		 .V(L),
		 .W(L),
		 .X(L),
		 .Y(O),
		 .M(M2)
	);

	// HEX3
	mux_3_5to1 MUX3(
		 .S({s2, s1, s0}),
		 .U(L),
		 .V(L),
		 .W(L),
		 .X(O),
		 .Y(BLANK),
		 .M(M3)
	);

	// HEX4
	mux_3_5to1 MUX4(
		 .S({s2, s1, s0}),
		 .U(O),
		 .V(O),
		 .W(O),
		 .X(BLANK),
		 .Y(BLANK),
		 .M(M4)
	);

	// HEX5
	mux_3_5to1 MUX5(
		 .S({s2, s1, s0}),
		 .U(BLANK),
		 .V(BLANK),
		 .W(BLANK),
		 .X(BLANK),
		 .Y(BLANK),
		 .M(M5)
	);

    // 7-SEGMENT DISPLAYS

    char_7seg D0(
        .C(M0),
        .Display(HEX0)
    );

    char_7seg D1(
        .C(M1),
        .Display(HEX1)
    );

    char_7seg D2(
        .C(M2),
        .Display(HEX2)
    );

    char_7seg D3(
        .C(M3),
        .Display(HEX3)
    );

    char_7seg D4(
        .C(M4),
        .Display(HEX4)
    );

    char_7seg D5(
        .C(M5),
        .Display(HEX5)
    );

endmodule