module BCD_Adder(
    input  [3:0] A,
    input  [3:0] B,
    input        cin,
    output [3:0] S0,
    output [3:0] S1
);

    wire [3:0] S;
    wire c1, c2, c3, cout;

    FullAdder FA0(
        .a(A[0]),
        .b(B[0]),
        .cin(cin),
        .s(S[0]),
        .cout(c1)
    );

    FullAdder FA1(
        .a(A[1]),
        .b(B[1]),
        .cin(c1),
        .s(S[1]),
        .cout(c2)
    );

    FullAdder FA2(
        .a(A[2]),
        .b(B[2]),
        .cin(c2),
        .s(S[2]),
        .cout(c3)
    );

    FullAdder FA3(
        .a(A[3]),
        .b(B[3]),
        .cin(c3),
        .s(S[3]),
        .cout(cout)
    );

    wire [4:0] T;

    assign T[4] = cout;
    assign T[3] = S[3];
    assign T[2] = S[2];
    assign T[1] = S[1];
    assign T[0] = S[0];

    wire z;

    assign z = T[4] | (T[3] & T[2]) | (T[3] & T[1]);

    assign S1[3] = 1'b0;
    assign S1[2] = 1'b0;
    assign S1[1] = 1'b0;
    assign S1[0] = z;

    assign S0[3] = (~z & T[3]) |
                   (z & ~T[3] & ~T[2] & ~T[1]);

    assign S0[2] = (~z & T[2]) |
                   (z & (T[2] ^ T[1]));

    assign S0[1] = (~z & T[1]) |
                   (z & ~T[1]);

    assign S0[0] = T[0];

endmodule