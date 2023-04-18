
module Comparador(A,B,out);
 
  input [19:0]A,B;
  output out;

  assign out =(A>B)?1'b1:1'b0;
  
  endmodule