module ArrayMultiplier4(
    input [3:0] A,
    input [3:0] B,
    output [7:0] P
);

    // ==========================================
    // PARTIAL PRODUCTS USING AND GATES
    // ==========================================

    wire [3:0] pp0;
    wire [3:0] pp1;
    wire [3:0] pp2;
    wire [3:0] pp3;

    assign pp0 = A & {4{B[0]}};
    assign pp1 = A & {4{B[1]}};
    assign pp2 = A & {4{B[2]}};
    assign pp3 = A & {4{B[3]}};

    // ==========================================
    // FIRST ROW OF FULL ADDERS
    // ==========================================

    wire [3:0] s1;
    wire [4:0] c1;

    assign c1[0] = 1'b0;

    genvar i;

    generate
        for (i = 0; i < 4; i = i + 1) begin: ROW1

            FullAdder fa1(
                .a(({1'b0, pp0[3:1]} >> i) & 1'b1),
                .b(pp1[i]),
                .cin(c1[i]),
                .sum(s1[i]),
                .cout(c1[i+1])
            );

        end
    endgenerate

    // ==========================================
    // SECOND ROW OF FULL ADDERS
    // ==========================================

    wire [3:0] s2;
    wire [4:0] c2;
    wire [3:0] row2_input;

    assign row2_input = {c1[4], s1[3:1]};
    assign c2[0] = 1'b0;

    generate
        for (i = 0; i < 4; i = i + 1) begin: ROW2

            FullAdder fa2(
                .a(row2_input[i]),
                .b(pp2[i]),
                .cin(c2[i]),
                .sum(s2[i]),
                .cout(c2[i+1])
            );

        end
    endgenerate

    // ==========================================
    // THIRD ROW OF FULL ADDERS
    // ==========================================

    wire [3:0] s3;
    wire [4:0] c3;
    wire [3:0] row3_input;

    assign row3_input = {c2[4], s2[3:1]};
    assign c3[0] = 1'b0;

    generate
        for (i = 0; i < 4; i = i + 1) begin: ROW3

            FullAdder fa3(
                .a(row3_input[i]),
                .b(pp3[i]),
                .cin(c3[i]),
                .sum(s3[i]),
                .cout(c3[i+1])
            );

        end
    endgenerate

    // ==========================================
    // FINAL 8-BIT PRODUCT
    // ==========================================

    assign P[0] = pp0[0];
    assign P[1] = s1[0];
    assign P[2] = s2[0];
    assign P[6:3] = s3[3:0];
    assign P[7] = c3[4];

endmodule
