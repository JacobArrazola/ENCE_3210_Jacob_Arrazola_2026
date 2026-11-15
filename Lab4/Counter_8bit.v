module Counter_8bit(
	input ena,
	input clk,
	input clear,
	output [7:0] count
);

	assign count = w_out;
	wire [6:0] w_and;
	wire [7:0] w_out;

	assign w_and[0] = ena & w_out[0];
	assign w_and[1] = w_and[0] & w_out[1];
   assign w_and[2] = w_and[1] & w_out[2];
   assign w_and[3] = w_and[2] & w_out[3];
   assign w_and[4] = w_and[3] & w_out[4];
   assign w_and[5] = w_and[4] & w_out[5];
   assign w_and[6] = w_and[5] & w_out[6];
	
	TFlipF tff0(
		.T(ena),
		.clk(clk),
		.clear(clear),
		.Qt(w_out[0])
	);
	
	TFlipF tff1(
		.T(w_and[0]),
		.clk(clk),
		.clear(clear),
		.Qt(w_out[1])
	);
	
	TFlipF tff2(
		.T(w_and[1]),
		.clk(clk),
		.clear(clear),
		.Qt(w_out[2])
	);
	
	TFlipF tff3(
		.T(w_and[2]),
		.clk(clk),
		.clear(clear),
		.Qt(w_out[3])
	);
	
	TFlipF tff4(
		.T(w_and[3]),
		.clk(clk),
		.clear(clear),
		.Qt(w_out[4])
	);
	
	TFlipF tff5(
		.T(w_and[4]),
		.clk(clk),
		.clear(clear),
		.Qt(w_out[5])
	);
	
	TFlipF tff6(
		.T(w_and[5]),
		.clk(clk),
		.clear(clear),
		.Qt(w_out[6])
	);
	
	TFlipF tff7(
		.T(w_and[6]),
		.clk(clk),
		.clear(clear),
		.Qt(w_out[7])
	);
	

endmodule