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
					 output [7:0]outt				 
					 );
					 
wire clk,sel_clk,sel_out,clk_ring,ok;
wire [4:0]state1,state2,state3,state4,state5;
wire [7:0]out;				 
				 
assign out[5] =clk;

				SIPO Sipo(
							.clock(clk_in),
							.rst(reset),
							.in(REG_STATE),
							.en(1),
							.clk_sel(sel_clk),
							.out_sel(sel_out),
							.out1(state1),
							.out2(state2),
							.out3(state3),
							.out4(state4),
							.out5(state5),
							.finished(ok)
							);	
							
							
				clk_sel clock_selector(
												.clk1(clk_in),
												.clk2(clk_in),
												.select(sel_clk),
												.out(clk));
					
					
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
					 .out(out[4:0])
					 );
					 
					 
		 
			chaout changa_out(
									.in(out),
									.sel(1),
									.out_in(outt[7:5]),
									.out(outt[4:0])
									);
									
	desition desition(
			.clk(clk),
			.rst(reset),
			.timer(out[4]),
			.register(out[3]),
			.comp(out[6]));
				
				
		   PISO_div PISO(
			.clk(clk),
			.rst(reset),
			.DATA({sel_out,sel_clk,state1,state2,state3,state4,state5,5'b01010}),
			.shift_in(0),
			.out(out[7])
			);

					 
endmodule


