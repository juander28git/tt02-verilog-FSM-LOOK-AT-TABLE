`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: PONTIFICIA UNIVERSIDAD JAVERIANA
// Engineer: JUAN DIEGO SANCHEZ ROJAS
// 
// Create Date:    22:52:12 02/28/2023 
// Design Name: 
// Module Name:    FSM 
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


 
module FSM(
					 input clk,
					 input reset,
					 input [4:0]in,
					 input ok,
					 input [4:0]jump1,
					 input [4:0]jump2,
					 input [4:0]jump3,
					 input [4:0]jump4,
					 input [4:0]jump5,
					 output [2:0] out_state,
					 output reg[4:0] out
					 );

	localparam [2:0] state_zero   = 0,
						  state_one    = 1,
						  state_two    = 2,
						  state_three  = 3,
						  state_four   = 4,
						  state_five   = 5;
						  
	reg [2:0]state = 0,nx_state= 0;
	
	
	assign out_state = state;

	always @(posedge clk)
	begin
		if(reset)
			begin
				state <= state_zero;
			end 
		else 
			 begin
				state <= nx_state;
			 end
	end
	
	
	always @(state, in, jump1, jump2,jump3,jump4,jump5,ok)
begin
	
	nx_state = state;
	
	case (state)
	
		//El estado 0 sirve para esperar mientras se almacenan los datos 
		//del registro para modificar la secuencia de los estados
		state_zero:
			if(ok)begin
				//salidas
				out		=	5'b00001;
				//ya se cargo el registro se cambia al estado 2
				nx_state = state_one;
				
			end else begin
				//salidas
				out		=	5'b00000;
				//ya se cargo el registro se cambia al estado 2
				nx_state = state_zero;
			end
			
		state_one:
			if(jump1[0])begin
					if(in[0])begin
						//salidas
						out		=	5'b00010;
						//Entrada == 1 cambio de estado
						nx_state = state_two;
					end else begin
					//salidas
						out		=	5'b00001;
						//Entrada == 0 no se cambia de estado
						nx_state = state_one;
					end
				
			end else if(jump1[1])begin
					if(in[0])begin
						//salidas
						out		=	5'b00100;
						//ya se cargo el registro se cambia al estado 2
						nx_state = state_three;
					end else begin
					//salidas
						out		=	5'b00001;
						//ya se cargo el registro se cambia al estado 2
						nx_state = state_one;
					end
			
			end else if(jump1[2])begin
					if(in[0])begin
						//salidas
						out		=	5'b01000;
						//ya se cargo el registro se cambia al estado 2
						nx_state = state_four;
					end else begin
					//salidas
						out		=	5'b00001;
						//ya se cargo el registro se cambia al estado 2
						nx_state = state_one;
					end
					
			end else if(jump1[3])begin
					if(in[0])begin
						//salidas
						out		=	5'b10000;
						//ya se cargo el registro se cambia al estado 2
						nx_state = state_five;
					end else begin
					//salidas
						out		=	5'b00001;
						//ya se cargo el registro se cambia al estado 2
						nx_state = state_one;
						end
			end else if(jump1[4])begin
					if(in[0])begin
						//salidas
						out		=	5'b10010;
						//ya se cargo el registro se cambia al estado 2
						nx_state = state_two;
					end else begin
					//salidas
						out		=	5'b00100;
						//ya se cargo el registro se cambia al estado 2
						nx_state = state_three;
						end
			end else begin
						//salidas
						out		=	5'b00001;
						//ya se cargo el registro se cambia al estado 2
						nx_state = state_one;
			end
				 
		state_two:
		
			if(jump2[0])begin
					if(in[1])begin
						//salidas
						out		=	5'b00100;
						//Entrada == 1 cambio de estado
						nx_state = state_three;
					end else begin
					//salidas
						out		=	5'b00010;
						//Entrada == 0 no se cambia de estado
						nx_state = state_two;
					end
				
			end else if(jump2[1])begin
					if(in[1])begin
						//salidas
						out		=	5'b01000;
						//ya se cargo el registro se cambia al estado 2
						nx_state = state_four;
					end else begin
					//salidas
						out		=	5'b00010;
						//ya se cargo el registro se cambia al estado 2
						nx_state = state_two;
					end
			
			end else if(jump2[2])begin
					if(in[1])begin
						//salidas
						out		=	5'b10000;
						//ya se cargo el registro se cambia al estado 2
						nx_state = state_five;
					end else begin
					//salidas
						out		=	5'b00010;
						//ya se cargo el registro se cambia al estado 2
						nx_state = state_two;
					end
			end else if(jump2[3])begin
					if(in[1])begin
						//salidas
						out		=	5'b00001;
						//ya se cargo el registro se cambia al estado 2
						nx_state = state_one;
					end else begin
					//salidas
						out		=	5'b00010;
						//ya se cargo el registro se cambia al estado 2
						nx_state = state_two;
					end
			end else if(jump2[4])begin
					if(in[1])begin
						//salidas
						out		=	5'b00100;
						//ya se cargo el registro se cambia al estado 2
						nx_state = state_three;
					end else begin
					//salidas
						out		=	5'b01000;
						//ya se cargo el registro se cambia al estado 2
						nx_state = state_four;
					end
			end else begin
						//salidas
						out		=	5'b00010;
						//ya se cargo el registro se cambia al estado 2
						nx_state = state_two;
			end	
		
				 
		state_three:
			
			if(jump3[0])begin
					if(in[2])begin
						//salidas
						out		=	5'b01000;
						//Entrada == 1 cambio de estado
						nx_state = state_four;
					end else begin
					//salidas
						out		=	5'b00100;
						//Entrada == 0 no se cambia de estado
						nx_state = state_three;
					end
				
			end else if(jump3[1])begin
					if(in[2])begin
						//salidas
						out		=	5'b10000;
						//Entrada == 1 cambio de estado
						nx_state = state_five;
					end else begin
					//salidas
						out		=	5'b00100;
						//Entrada == 0 no se cambia de estado
						nx_state = state_three;
					end
			
			end else if(jump3[2])begin
					if(in[2])begin
						//salidas
						out		=	5'b00001;
						//Entrada == 1 cambio de estado
						nx_state = state_one;
					end else begin
					//salidas
						out		=	5'b00100;
						//Entrada == 0 no se cambia de estado
						nx_state = state_three;
					end
			end else if(jump3[3])begin
					if(in[2])begin
						//salidas
						out		=	5'b00010;
						//Entrada == 1 cambio de estado
						nx_state = state_two;
					end else begin
					//salidas
						out		=	5'b00100;
						//Entrada == 0 no se cambia de estado
						nx_state = state_three;
					end
			end else if(jump3[4])begin
					if(in[1])begin
						//salidas
						out		=	5'b01000;
						//ya se cargo el registro se cambia al estado 2
						nx_state = state_four;
					end else begin
					//salidas
						out		=	5'b10000;
						//ya se cargo el registro se cambia al estado 2
						nx_state = state_five;
					end
			end else begin
						//salidas
						out		=	5'b00100;
						//ya se cargo el registro se cambia al estado 2
						nx_state = state_three;
			end
				 
			
		state_four:
		
			if(jump4[0])begin
					if(in[3])begin
						//salidas
						out		=	5'b10000;
						//Entrada == 1 cambio de estado
						nx_state = state_five;
					end else begin
					//salidas
						out		=	5'b01000;
						//Entrada == 0 no se cambia de estado
						nx_state = state_four;
					end
				
			end else if(jump4[1])begin
					if(in[3])begin
						//salidas
						out		=	5'b00001;
						//Entrada == 1 cambio de estado
						nx_state = state_one;
					end else begin
					//salidas
						out		=	5'b01000;
						//Entrada == 0 no se cambia de estado
						nx_state = state_four;
					end
			
			end else if(jump4[2])begin
					if(in[3])begin
						//salidas
						out		=	5'b00010;
						//Entrada == 1 cambio de estado
						nx_state = state_two;
					end else begin
					//salidas
						out		=	5'b01000;
						//Entrada == 0 no se cambia de estado
						nx_state = state_four;
					end
			end else if(jump4[3])begin
					if(in[3])begin
						//salidas
						out		=	5'b000100;
						//Entrada == 1 cambio de estado
						nx_state = state_three;
					end else begin
					//salidas
						out		=	5'b01000;
						//Entrada == 0 no se cambia de estado
						nx_state = state_four;
					end
			end else if(jump4[4])begin
					if(in[1])begin
						//salidas
						out		=	5'b10000;
						//ya se cargo el registro se cambia al estado 2
						nx_state = state_five;
					end else begin
					//salidas
						out		=	5'b00001;
						//ya se cargo el registro se cambia al estado 2
						nx_state = state_one;
					end
			end else begin
						//salidas
						out		=	5'b01000;
						//ya se cargo el registro se cambia al estado 2
						nx_state = state_four;
			end
		
		state_five:
		
			if(jump5[0])begin
					if(in[4])begin
						//salidas
						out		=	5'b00001;
						//Entrada == 1 cambio de estado
						nx_state = state_one;
					end else begin
					//salidas
						out		=	5'b10000;
						//Entrada == 0 no se cambia de estado
						nx_state = state_five;
					end
				
			end else if(jump5[1])begin
					
					if(in[4])begin
						//salidas
						out		=	5'b00010;
						//Entrada == 1 cambio de estado
						nx_state = state_two;
					end else begin
					//salidas
						out		=	5'b10000;
						//Entrada == 0 no se cambia de estado
						nx_state = state_five;
					end
			
			end else if(jump5[2])begin
					
					if(in[4])begin
						//salidas
						out		=	5'b00100;
						//Entrada == 1 cambio de estado
						nx_state = state_three;
					end else begin
					//salidas
						out		=	5'b10000;
						//Entrada == 0 no se cambia de estado
						nx_state = state_five;
					end
					
			end else if(jump5[3])begin
					
					if(in[4])begin
						//salidas
						out		=	5'b01000;
						//Entrada == 1 cambio de estado
						nx_state = state_four;
					end else begin
					//salidas
						out		=	5'b10000;
						//Entrada == 0 no se cambia de estado
						nx_state = state_five;
					end
					
			end else if(jump5[4])begin
					if(in[1])begin
						//salidas
						out		=	5'b00001;
						//ya se cargo el registro se cambia al estado 2
						nx_state = state_one;
					end else begin
					//salidas
						out		=	5'b00010;
						//ya se cargo el registro se cambia al estado 2
						nx_state = state_two;
					end
			end else begin
						//salidas
						out		=	5'b10000;
						//ya se cargo el registro se cambia al estado 2
						nx_state = state_five;
			end
		
		
	endcase 
	
end

endmodule

	
	
	
