module piso_1_bit(
						input data,
						input shift_in,
						input clk,
						input rst,
						input load,
						output out
);
wire a = ((!load) & data )|(load & shift_in);



d_ff flip(
		.clk(clk),
		.reset(rst),
		.en(1'b1),
		.d(a),
		.q(out)
	);

endmodule