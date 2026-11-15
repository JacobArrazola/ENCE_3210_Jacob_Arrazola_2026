module Counter_LPM_16bit(
    input ena,
    input clk,
    input clear,
    output [15:0] count
);

    lpm_counter counter_inst(
        .clock(clk),
        .cnt_en(ena),
        .sclr(~clear),
        .q(count)
    );

    defparam
        counter_inst.lpm_width = 16,
        counter_inst.lpm_direction = "UP";

endmodule
