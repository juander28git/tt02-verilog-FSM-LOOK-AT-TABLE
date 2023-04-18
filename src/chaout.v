module chaout(
input [7:0] in,
input sel,
output  reg [4:0] out,
output [2:0]out_in
);
wire [4:0]A=5'b00101;
assign out_in = in[7:5];
always @*
begin
	if(sel)begin
		out[1]=in[4];
		out[3]=in[2];
		out[4]=in[3];
		if(in[0])begin
		out[0]=1'b1;
		out[2]=1'b1;
		end else begin
		out[0]=1'b0;
		out[2]=1'b0;
		end
	end else begin
		out =in[4:0];
	end
end

endmodule