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
					 output [4:0]out
					 );
					 
					 wire clk,ok;
					 wire [4:0]state1,state2,state3,state4,state5;
					 wire [1:0]sel_clk;
					 wire [26:0] reg_in_par;
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
					 .out(out)
					 );
			
			
	
					 
endmodule
