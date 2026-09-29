// Part 3: A Master-Slave D Flip-Flop made from two Gated D Latches
module part3 (Clock, D, Q, Q_bar, Qm);
    input Clock, D;
    output Q, Q_bar, Qm;

    // Internal wires connecting the blocks together
    wire Clk_not;
    wire Qm; // Master output connecting to slave input
    
    // Invert the clock line for the Master stage
    assign Clk_not = ~Clock;

    // 1. Instantiate the MASTER Latch (Controlled by inverted clock)
    part2 master_latch (
        .Clk(Clk_not),
        .D(D),
        .Q(Qm),
        // Leave the extra observational internal signals unconnected here
        .S(), .R(), .S_g(), .R_g(), .Qa(), .Qb() 
    );

    // 2. Instantiate the SLAVE Latch (Controlled by direct clock)
    part2 slave_latch (
        .Clk(Clock),
        .D(Qm),
        .Q(Q),
        .S(), .R(), .S_g(), .R_g(), .Qa(Q), .Qb(Q_bar)
    );

endmodule
