`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: PONTIFICIA UNIVERSIDAD JAVERIANA
// Engineer: JUAN DIEGO SANCHEZ ROJAS
// 
// Create Date:    22:52:12 02/28/2023 
// Design Name: 
// Module Name:    FSM_LAT
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

module FSM_LAT(
					 input clk_in,
					 input reset,
					 input [4:0]in,
					 input REG_STATE,
					 output clk_out,
					 output [4:0]out,
					 output [2:0]out11
					 
					 );
					 
					 wire clk,ok,sel_out,compp,rst_timer;
					 wire [4:0]state1,state2,state3,state4,state5,out_c;
					 wire [1:0]sel_clk;
					 wire [26:0] reg_in_par;
					 wire [19:0] sig_comp, save;
					 

	assign out11={compp,clk,1'b0};
	assign clk_out =clk;
				clk_sel clk_sel(
									.clk1(clk_in), 
									.clk2(0),
									.clk3(0),
									.select(sel_clk),
									.out(clk)
									);		 
				 
				SIPO Sipo(
							.clock(clk),
							.rst(reset),
							.in(REG_STATE),
							.en(1),
							.out(reg_in_par),
							.clk_sel(sel_clk),
							.out_sel(sel_out),
							.out1(state1),
							.out2(state2),
							.out3(state3),
							.out4(state4),
							.out5(state5),
							.finished(ok)
							);	
							
							
							
				 FSM State_machine(
					 .clk(clk),
					 .reset(reset),
					 .in(in),
					 .ok(ok),
					 .jump1(state1),
					 .jump2(state2),
					 .jump3(state3),
					 .jump4(state4),
					 .jump5(state5),
					 .out(out_c)
					 );
					 
					 
			chaout changa_out(
									.in(out_c),
									.sel(sel_out),
									.out(out));
	 d_ff retardo(
					.clk(clk),
					.reset(reset),
					.en(1'b1),
					.d(out_c[3]),
					.q(rst_timer)
	);
									
									
			counter Timer(
					.clk(clk),
					.reset(reset | rst_timer),
					.en(out_c[4]),
					.count(sig_comp),
					.max()
					);
			
			registro20bits register_timer (
								.clk(clk),
								.reset(reset),
								.data_in(sig_comp), 
								.enable(out_c[3]),
								.data_out(save)
								);
			
			Comparador comparaaaa(
							.A(sig_comp),
							.B(save),
							.out(compp)
							);
	
					 
endmodule
