//////////////////////////////////////////////////////////////////////////////////
// Company: PONTIFICIA UNIVERSIDAD JAVERIANA
// Engineer: JUAN DIEGO SANCHEZ ROJAS
// 
// Create Date:    22:52:12 02/28/2023 
// Design Name: 
// Module Name:    SISO 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module SIPO
	(
		input clock, rst,
		input in,en,
		output [26:0]out,
		output [1:0]clk_sel,
		output out_sel,
		output [4:0]out1,
		output [4:0]out2,
		output [4:0]out3,
		output [4:0]out4,
		output [4:0]out5,
		output finished
	);
		wire [4:0]q0,q1,q2,q3,q4;
		wire ok,AA,BB,CC;
		
	   assign finished = ok; 
		assign clk = (!ok) & clock;
		assign out1 = q0 & ok;
		assign out2 = q1 & ok;
		assign out3 = q2 & ok;
		assign out4 = q3 & ok;
		assign out5 = q4 & ok;
		assign out  = {q4,q3,q2,q1,q0};
		assign clk_sel = {AA&ok,BB&ok};
		assign out_sel = CC&ok;
		
		d_ff Uout(
		.clk(clk),
		.reset(rst),
		.en(en),
		.d(in),
		.q(CC)
		);
		
		d_ff UA(
		.clk(clk),
		.reset(rst),
		.en(en),
		.d(in),
		.q(AA)
		);
		
		d_ff UB(
		.clk(clk),
		.reset(rst),
		.en(en),
		.d(AA),
		.q(BB)
		);
		
		dff_5 U0(
		.clk(clk),
		.rst(rst),
		.en(en),
		.in(in),
		.out(q4)
		);
		dff_5 U1(
		.clk(clk),
		.rst(rst),
		.en(en),
		.in(q4[0]),
		.out(q3)
		);
		dff_5 U2(
		.clk(clk),
		.rst(rst),
		.en(en),
		.in(q3[0]),
		.out(q2)
		);
		dff_5 U3(
		.clk(clk),
		.rst(rst),
		.en(en),
		.in(q2[0]),
		.out(q1)
		);
		dff_5 U4(
		.clk(clk),
		.rst(rst),
		.en(en),
		.in(q1[0]),
		.out(q0)
		);
		d_ff ennd(
		.clk(clk),
		.reset(rst),
		.en(en),
		.d(q0[0]),
		.q(ok)
		);
endmodule