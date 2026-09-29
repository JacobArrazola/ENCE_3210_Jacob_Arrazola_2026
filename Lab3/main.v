// A gated RS latch using logic expressions
// Designed for Part 1 of the structural modeling lab assignment
module main(Clk, R, S, Q, R_g, S_g, Qa, Qb);
    input Clk, R, S;
    output Q, R_g, S_g, Qa, Qb;

    // The synthesis keep directive instructs the compiler to preserve 
    // these internal signals so they can be viewed in the Technology Viewer
    wire R_g, S_g, Qa, Qb /* synthesis keep */;

    assign R_g = R & Clk;
    assign S_g = S & Clk;
    assign Qa  = ~(R_g | Qb);
    assign Qb  = ~(S_g | Qa);
    
    // Connect the latch output to the main module output port
    assign Q   = Qa;

endmodule


