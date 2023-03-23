module inv_with_delay(input A,output Y);
  `ifdef COCOTB_SIM
  assign #0.02 Y = ~A; // pick a fairly quick delay from the tt_025C_1v80 liberty file
                       // the actualy delay per stage is going to be slower
  `else
  sky130_fd_sc_hd__inv_2 inv(.A(A),.Y(Y));
  `endif
endmodule
