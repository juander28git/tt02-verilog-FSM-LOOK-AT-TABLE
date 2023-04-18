// Here we will learn to write a verilog HDL to design a 4 bit counter
module counter(clk,reset,en,count,max);
  //define input and output ports
  input clk,reset,en;
  output max;
  output reg [19:0] count;
  //always block will be executed at each and every positive edge of the clock
  assign max =(count == 20'b11111111111111111111)?1'b1:1'b0;
  always@(posedge clk) 
  begin
    if(reset)    //Set Counter to Zero
      count <= 0;
    else if(en)   
      count <= count + 1;
    else            //count down
      count <= count ;
  end
  

endmodule