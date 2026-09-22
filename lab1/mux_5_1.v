module mux_5_1(
    input s2,
    input s1,
    input s0,
    input u,
    input v,
    input w,
    input x,
    input y,
    output m
);

    wire a, b, c;

    mux_2_1 MUX0(
        .s(s0),
        .x(u),
        .y(v),
        .m(a)
    );

    mux_2_1 MUX1(
        .s(s0),
        .x(w),
        .y(x),
        .m(b)
    );

    mux_2_1 MUX2(
        .s(s1),
        .x(a),
        .y(b),
        .m(c)
    );

    mux_2_1 MUX3(
        .s(s2),
        .x(c),
        .y(y),
        .m(m)
    );

endmodule
 