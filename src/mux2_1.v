// define a module for the design
module mux2_1(in1, in2, in3 ,  select, out);

// define input  port
input in1, in2, in3;
input [1:0]select;

// define the output port
output out;

wire A;

// assign one of the inputs to the output based upon select line input
assign A = select[0] ? in2 : in1;
assign out = select[1] ? in3 : A;
endmodule 