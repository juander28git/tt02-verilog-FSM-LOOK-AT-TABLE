
module Comparador(A,B,out);
 
  input A,B;
  output out;

  assign out =(A>B)?1'b1:1'b0;
  
  endmodule