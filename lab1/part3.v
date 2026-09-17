module part3 (
    input  [9:0] SW,
    output [9:0] LEDR
);
    wire m;
 
    mux_5_1 M0 (
        .s2(SW[7]), .s1(SW[6]), .s0(SW[5]),
        .u(SW[0]), .v(SW[1]), .w(SW[2]), .x(SW[3]), .y(SW[4]),
        .m(m)
    );
 
    assign LEDR[7:0] = SW[7:0];
    assign LEDR[8]   = m;
    assign LEDR[9]   = 1'b0;
	 
endmodule