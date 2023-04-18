module clock_divider(
   input           clk,     // reloj entrante de 50MHz
   output reg      clk2      // nuevo reloj de 5MHz
    );

reg [4:0] count;

// divisor de reloj 50MHz a 5MHz
always@(posedge clk)
    
        if(count==5'd16)      // cuenta 5 ciclos (0-4) de reloj    
            begin
              count<=0;      // reinicia cuenta a 0
              clk2 <= ~clk2; // transiciona clk2 a alto o bajo
            end
        else
            begin
            count<=count+1;  //  aumenta contador
            end                  
endmodule   