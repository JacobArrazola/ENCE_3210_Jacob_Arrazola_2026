module Multiplier_8bit(
    input clk,
    input reset_n,
    input enable,
    input load_b,
    input [7:0] data_in,

    output reg [7:0] A_reg,
    output reg [7:0] B_reg,
    output reg [15:0] P
);

    // ==========================================
    // 8x8 MULTIPLIER - PART IV
    // ==========================================

    // Partial-product accumulation stages
    wire [15:0] stage [0:8];

    assign stage[0] = 16'd0;

    genvar i;

    generate
        for (i = 0; i < 8; i = i + 1) begin: ADDER_ROWS

            wire [15:0] partial_product;

            // Generate partial product using AND gates
            assign partial_product =
                ({8'b0, A_reg} << i) & {16{B_reg[i]}};

            // Add partial product to previous sum
            assign stage[i+1] =
                stage[i] + partial_product;

        end
    endgenerate

    // ==========================================
    // REGISTERED INPUTS AND OUTPUT
    // ==========================================

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            A_reg <= 8'd0;
            B_reg <= 8'd0;
            P <= 16'd0;
        end
        else if (enable) begin

            // Load A or B
            if (load_b)
                B_reg <= data_in;
            else
                A_reg <= data_in;

            // Register product from previous A and B
            P <= stage[8];

        end
    end

endmodule
