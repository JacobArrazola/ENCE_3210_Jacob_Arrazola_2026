// Part 4: Behavioral comparison of a Gated D Latch, Pos-Edge DFF, and Neg-Edge DFF
module part4 (Clock, D, Qa, Qb, Qc);
    input Clock, D;
    output reg Qa, Qb, Qc; // Declared as reg because they are assigned inside always blocks

    // 1. Gated D Latch (Level-Sensitive to Clock being HIGH)
    always @(D or Clock) begin
        if (Clock)
            Qa <= D;
    end

    // 2. Positive-Edge Triggered D Flip-Flop (Updates on 0 -> 1 transition)
    always @(posedge Clock) begin
        Qb <= D;
    end

    // 3. Negative-Edge Triggered D Flip-Flop (Updates on 1 -> 0 transition)
    always @(negedge Clock) begin
        Qc <= D;
    end

endmodule
