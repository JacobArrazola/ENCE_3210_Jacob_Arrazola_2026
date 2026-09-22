module char_7seg(
    input  [2:0] C,
    output [7:0] Display
);

    // C[2] = c2
    // C[1] = c1
    // C[0] = c0

    // Segment 0
    assign Display[0] = C[2] | (C[1] & ~C[0]);

    // Segment 1
    assign Display[1] = C[2] | (C[0] & ~C[1]) | (C[1] & ~C[0]);

    // Segment 2
    assign Display[2] = C[2] | (C[0] & ~C[1]) | (C[1] & ~C[0]);

    // Segment 3
    assign Display[3] = C[2] | (~C[0] & ~C[1]);

    // Segment 4
    assign Display[4] = C[2];

    // Segment 5
    assign Display[5] = C[2];

    // Segment 6
    assign Display[6] = C[1] | C[2];

    // Decimal point
    assign Display[7] = 1'b1;

endmodule