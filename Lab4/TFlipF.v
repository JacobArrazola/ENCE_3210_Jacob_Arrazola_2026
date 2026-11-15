module TFlipF(
    input T,
    input clk,
    input clear,
    output reg Qt
);

    // Active-low asynchronous reset
    always @(posedge clk or negedge clear) begin
        if (!clear)
            Qt <= 1'b0;
        else if (T)
            Qt <= ~Qt;
    end

endmodule
