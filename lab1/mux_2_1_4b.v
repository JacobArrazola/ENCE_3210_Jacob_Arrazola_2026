// Four-bit wide 2-to-1 multiplexer
// If s = 0, m = x. If s = 1, m = y.
module mux_2_1_4b(
    input        s,
    input  [3:0] x,
    input  [3:0] y,
    output [3:0] m
);
    assign m[0] = (~s & x[0]) | (s & y[0]);
    assign m[1] = (~s & x[1]) | (s & y[1]);
    assign m[2] = (~s & x[2]) | (s & y[2]);
    assign m[3] = (~s & x[3]) | (s & y[3]);
endmodule
 