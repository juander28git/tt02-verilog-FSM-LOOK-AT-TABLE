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
// define a module for the design
module clk_sel(clk1, clk2,  select, out);

// define input  port
input clk1, clk2;
input select;

// define the output port
output out;




assign out  = select ? clk2 : clk1;


endmodule 
