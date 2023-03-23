module ring_osc(input nrst,output osc);
  // We count for 1 scan_clk period which expected at 166uS (6KHz).
  // If the delay of one inverter is 20ps and the ring is 150 inverters long,
  // then the ring period is 6nS (2*150inv*20pS/inv)
  // This is 166MHz so expect a count of 166*166 nominally. 
  // For more time resolution make scan_clk slower but that requires more
  // counter depth. 
  // scan clk slowing can be done externally to the TT IC or with the clk div. 

  localparam NUM_INVERTERS = 150; //  must be an even number
  
  // setup loop of inverters
  // http://svn.clairexen.net/handicraft/2015/ringosc/ringosc.v
  wire [NUM_INVERTERS-1:0] delay_in, delay_out;
  wire osc_out;
  inv_with_delay idelay [NUM_INVERTERS-1:0] (
        .A(delay_in),
        .Y(delay_out)
    );
  assign delay_in = {delay_out[NUM_INVERTERS-2:0], osc_out};
  nand2_with_delay nand2_with_delay(.A(nrst),.B(delay_out[NUM_INVERTERS-1]),.Y(osc_out));
  assign osc = osc_out;
endmodule
