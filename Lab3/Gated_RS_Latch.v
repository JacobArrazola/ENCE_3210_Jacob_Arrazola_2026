// A gated RS latch adapted for your DE10-Lite project
module Gated_RS_Latch (Clk, R, S, Q, R_g, S_g, Qa, Qb);
    input Clk, R, S;
    output Q, R_g, S_g, Qa, Qb; // Brought inside outputs to observe them!

    // The synthesis keep directive tells Quartus not to optimize these wires away
    wire R_g, S_g, Qa, Qb /* synthesis keep */;

    assign R_g = R & Clk;
    assign S_g = S & Clk;
    assign Qa  = ~(R_g | Qb);
    assign Qb  = ~(S_g | Qa);
    assign Q   = Qa;

endmodule
