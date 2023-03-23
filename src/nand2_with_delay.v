module nand2_with_delay(input A,input B,output Y);
  `ifdef COCOTB_SIM
  assign #0.05 Y = ~(A & B);
  `else
  sky130_fd_sc_hd__nand2_2 nand2(.A(A),.B(B),.Y(Y));
  `endif
endmodule
