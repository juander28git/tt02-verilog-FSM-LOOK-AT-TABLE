//////////////////////////////////////////////////////////////////////////////////
// Company: PONTIFICIA UNIVERSIDAD JAVERIANA
// Engineer: JUAN DIEGO SANCHEZ ROJAS
// 
// Create Date:    22:52:12 02/28/2023 
// Design Name: 
// Module Name:    dff_5 
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

module dff_5
	(
		input clk, rst,
		input in,en,
		output [4:0]out
	);
		wire q0,q1,q2,q3,q4;
		
		assign out[0] = q4;
		assign out[1] = q3;
		assign out[2] = q2;
		assign out[3] = q1;
		assign out[4] = q0;
		
		d_ff U0(
		.clk(clk),
		.reset(rst),
		.en(en),
		.d(in),
		.q(q0)
		);
		d_ff U1(
		.clk(clk),
		.reset(rst),
		.en(en),
		.d(q0),
		.q(q1)
		);
		d_ff U2(
		.clk(clk),
		.reset(rst),
		.en(en),
		.d(q1),
		.q(q2)
		);
		d_ff U3(
		.clk(clk),
		.reset(rst),
		.en(en),
		.d(q2),
		.q(q3)
		);
		d_ff U4(
		.clk(clk),
		.reset(rst),
		.en(en),
		.d(q3),
		.q(q4)
		);
		
endmodule