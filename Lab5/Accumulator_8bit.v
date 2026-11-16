

module Accumulator_8bit(
    input [7:0] A,
    input clk,
    input reset_n,
    input enable,
    input add_sub,
    output reg [7:0] S,
    output reg overflow
);

    reg [7:0] A_reg;

    wire [8:0] add_result;
    wire [8:0] sub_result;
    wire [8:0] result;

    // Addition
    assign add_result = {1'b0, S} + {1'b0, A_reg};

    // Subtraction
    assign sub_result = {1'b0, S} - {1'b0, A_reg};

    // Select operation
    assign result = add_sub ? sub_result : add_result;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            A_reg <= 8'd0;
            S <= 8'd0;
            overflow <= 1'b0;
        end
        else if (enable) begin
            // Register input A
            A_reg <= A;

            // Store the selected result
            S <= result[7:0];

            // Carry for addition, borrow for subtraction
            overflow <= result[8];
        end
    end

endmodule
