module AdderTree_8bit(
    input clk,
    input reset_n,
    input enable,
    input load_b,
    input [7:0] data_in,

    output reg [7:0] A_reg,
    output reg [7:0] B_reg,
    output reg [15:0] P
);

    // PART V - 8x8 ADDER TREE MULTIPLIER
	 
    // Eight 16-bit partial products
    wire [15:0] pp0, pp1, pp2, pp3;
    wire [15:0] pp4, pp5, pp6, pp7;

    assign pp0 = ({8'b0, A_reg} << 0) &
                 {16{B_reg[0]}};

    assign pp1 = ({8'b0, A_reg} << 1) &
                 {16{B_reg[1]}};

    assign pp2 = ({8'b0, A_reg} << 2) &
                 {16{B_reg[2]}};

    assign pp3 = ({8'b0, A_reg} << 3) &
                 {16{B_reg[3]}};

    assign pp4 = ({8'b0, A_reg} << 4) &
                 {16{B_reg[4]}};

    assign pp5 = ({8'b0, A_reg} << 5) &
                 {16{B_reg[5]}};

    assign pp6 = ({8'b0, A_reg} << 6) &
                 {16{B_reg[6]}};

    assign pp7 = ({8'b0, A_reg} << 7) &
                 {16{B_reg[7]}};

    // LEVEL 1 - FOUR PARALLEL ADDITIONS

    wire [15:0] sum0, sum1, sum2, sum3;

    assign sum0 = pp0 + pp1;
    assign sum1 = pp2 + pp3;
    assign sum2 = pp4 + pp5;
    assign sum3 = pp6 + pp7;

    // LEVEL 2 - TWO PARALLEL ADDITIONS

    wire [15:0] sum4, sum5;

    assign sum4 = sum0 + sum1;
    assign sum5 = sum2 + sum3;

    // LEVEL 3 - FINAL ADDITION

    wire [15:0] product;

    assign product = sum4 + sum5;

    // REGISTERED INPUTS AND OUTPUT

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
            P <= product;

        end
    end

endmodule