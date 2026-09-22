module part5(
    input  [17:0] SW,
    output [7:0] HEX0,
    output [7:0] HEX1,
    output [7:0] HEX2,
    output [7:0] HEX3,
    output [7:0] HEX4
);

    // PART V

    wire s2;
    wire s1;
    wire s0;

    assign s2 = SW[9];
    assign s1 = SW[8];
    assign s0 = SW[7];

    // CHARACTER CODES

    wire [2:0] U;
    wire [2:0] V;
    wire [2:0] W;
    wire [2:0] X;
    wire [2:0] Y;

    // H = 000
    assign U[0] = SW[0] & ~SW[0];
    assign U[1] = SW[0] & ~SW[0];
    assign U[2] = SW[0] & ~SW[0];

    // E = 001
    assign V[0] = SW[0] | ~SW[0];
    assign V[1] = SW[0] & ~SW[0];
    assign V[2] = SW[0] & ~SW[0];

    // L = 010
    assign W[0] = SW[0] & ~SW[0];
    assign W[1] = SW[0] | ~SW[0];
    assign W[2] = SW[0] & ~SW[0];

    // L = 010
    assign X[0] = SW[0] & ~SW[0];
    assign X[1] = SW[0] | ~SW[0];
    assign X[2] = SW[0] & ~SW[0];

    // O = 011
    assign Y[0] = SW[0] | ~SW[0];
    assign Y[1] = SW[0] | ~SW[0];
    assign Y[2] = SW[0] & ~SW[0];

    // MUX OUTPUTS

    wire [2:0] M0;
    wire [2:0] M1;
    wire [2:0] M2;
    wire [2:0] M3;
    wire [2:0] M4;

    // HEX0
    mux_3_5to1 MUX0(
        .S({s2, s1, s0}),
        .U(U),
        .V(V),
        .W(W),
        .X(X),
        .Y(Y),
        .M(M0)
    );

    // HEX1
    mux_3_5to1 MUX1(
        .S({s2, s1, s0}),
        .U(V),
        .V(W),
        .W(X),
        .X(Y),
        .Y(U),
        .M(M1)
    );

    // HEX2
    mux_3_5to1 MUX2(
        .S({s2, s1, s0}),
        .U(W),
        .V(X),
        .W(Y),
        .X(U),
        .Y(V),
        .M(M2)
    );

    // HEX3
    mux_3_5to1 MUX3(
        .S({s2, s1, s0}),
        .U(X),
        .V(Y),
        .W(U),
        .X(V),
        .Y(W),
        .M(M3)
    );

    // HEX4
    mux_3_5to1 MUX4(
        .S({s2, s1, s0}),
        .U(Y),
        .V(U),
        .W(V),
        .X(W),
        .Y(X),
        .M(M4)
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

endmodule