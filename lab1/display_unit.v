module display_unit(
    input  [2:0] S,
    input  [2:0] U,
    input  [2:0] V,
    input  [2:0] W,
    input  [2:0] X,
    input  [2:0] Y,
    output [0:6] HEX
);

    wire [2:0] M;

    mux_3bit_5to1 MUX0(
        .S(S),
        .U(U),
        .V(V),
        .W(W),
        .X(X),
        .Y(Y),
        .M(M)
    );

    char_7seg D0(
        .C(M),
        .Display(HEX)
    );

endmodule