module chaout(
input [4:0] in,
input sel,
output reg [4:0] out
);
wire [4:0]A=5'b00101;
wire [4:0]B;

always @*
begin
	if(sel)begin
		 case (in)
			  5'b00001: out = A;
			  5'b00010: out = 5'b00000;
			  5'b00100: out = 5'b01000;
			  5'b01000: out = 5'b10000;
			  5'b10000: out = 5'b00010;
			  default:  out = 5'b00000;
		 endcase
	end else begin
		out =in;
	end
end

endmodule
