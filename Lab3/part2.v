// Part 2: A Gated D Latch implemented with logic expressions
module part2 (Clk, D, Q, S, R, S_g, R_g, Qa, Qb);
    input Clk, D;
    output Q, S, R, S_g, R_g, Qa, Qb;

    // Preserve internal nodes exactly as shown in Figure 4
    wire S, R, S_g, R_g, Qa, Qb /* synthesis keep */;

    // Structural logic expressions based on Figure 4 schematic
    assign S   = D;
    assign R   = ~D;
    
    assign S_g = S & Clk;
    assign R_g = R & Clk;
    
    assign Qa  = ~(S_g | Qb);
    assign Qb  = ~(R_g | Qa);
    
    // Connect the latch state to the top-level output port
    assign Q   = Qa;

endmodule
