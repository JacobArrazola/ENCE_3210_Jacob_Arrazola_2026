module One_Second_Timer(
    input clk,
    input clear,
    output reg tick = 1'b0
);

    reg [25:0] timer_count = 26'd0;

    always @(posedge clk) begin
        if (clear) begin
            timer_count <= 26'd0;
            tick <= 1'b0;
        end
        else if (timer_count == 26'd49_999_999) begin
            timer_count <= 26'd0;
            tick <= 1'b1;
        end
        else begin
            timer_count <= timer_count + 1'b1;
            tick <= 1'b0;
        end
    end

endmodule
