module clock_div ( input in, output out);  

	wire [5:0] A;
	
	 jk_ff reg1( .j(1'b1), .k(1'b1), .clk(in),   .q(A[0]));  
	 jk_ff reg2( .j(1'b1), .k(1'b1), .clk(A[0]), .q(A[1]));  
	 jk_ff reg3( .j(1'b1), .k(1'b1), .clk(A[1]), .q(A[2])); 
	 jk_ff reg4( .j(1'b1), .k(1'b1), .clk(A[2]), .q(A[3])); 
	 jk_ff reg5( .j(1'b1), .k(1'b1), .clk(A[3]), .q(A[4])); 
	 jk_ff reg6( .j(1'b1), .k(1'b1), .clk(A[4]), .q(A[5]));
	 jk_ff reg7( .j(1'b1), .k(1'b1), .clk(A[5]), .q(out)); 
	 
	 
	 endmodule