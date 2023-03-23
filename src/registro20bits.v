module registro20bits(clk, reset, data_in, enable, data_out);

input clk, reset, enable;
input [19:0] data_in;
output reg [19:0] data_out;

always @ (posedge clk, posedge reset)
begin
    if (reset)
        data_out <= 8'b0; // Se reinicia el registro a 0
    else if (enable)
        data_out <= data_in; // Se carga el valor de data_in al registro
end

endmodule