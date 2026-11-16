
module Key_Debounce(
    input clk,
    input key_n,
    output reg press_pulse = 1'b0
);

    reg sync0 = 1'b1;
    reg sync1 = 1'b1;
    reg stable_key = 1'b1;
    reg [19:0] debounce_count = 20'd0;

    // Synchronize button input to 50 MHz clock
    always @(posedge clk) begin
        sync0 <= key_n;
        sync1 <= sync0;
    end

    // Debounce button and generate one pulse
    always @(posedge clk) begin
        press_pulse <= 1'b0;

        if (sync1 == stable_key) begin
            debounce_count <= 20'd0;
        end
        else if (debounce_count == 20'd999999) begin
            debounce_count <= 20'd0;
            stable_key <= sync1;

            // Generate pulse when button is pressed
            if (sync1 == 1'b0)
                press_pulse <= 1'b1;
        end
        else begin
            debounce_count <= debounce_count + 1'b1;
        end
    end

endmodule