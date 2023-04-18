module desition(
	input clk,
	input rst,
	input timer,
	input register,
	output [19:0]out_timer,
	output [19:0]out_reg,
	output comp
);

wire [19:0] A,B;
wire C;

assign out_timer = A;
assign out_reg = B;

d_ff retardo(
		.clk(clk),
		.reset(rst),
		.en(1'b1),
		.d(register),
		.q(C)
	);
counter timerr(
			.clk(clk),
			.reset(rst|C),
			.en(timer),
			.count(A)
			);
registro20bits registerr(
							.clk(clk), 
							.reset(rst),
							.data_in(A), 
							.enable(register), 
							.data_out(B)
							);
Comparador comparator(
							.A(A),
							.B(B),
							.out(comp)
							);

endmodule 