module
  .instruction(instruction),
  .c_data_in_rdy(c_data_in_rdy),  // the (probably inverted) read_empty signal from the data fifo
  .c_data_out_rdy(c_data_out_rdy), // the fifo full signal for the core_data_out queue
  .iq_empty(iq_empty), // the empty signal for the instruction queue fifo
  .ack_mode_read(ack_mode_read), // the read request signal for show ahead fifo with flash mode commands
  .req_core_data(req_core_data), // read request signal to data fifo
  .output_dval(output_dval), // signal to indicate flash_q should be latched output flash_rdy,
  // flash control signals
  .oCE_N(oCE_N),
  .oCLE(oCLE),
  .oALE(oALE),
  .oWE_N(oWE_N),
  .oRE_N(oRE_N),
  .oWP_N(oWP_N),
  .iRB_N(iRB_N),
  // flash data signals
  .flash_data(flash_data),
  .flash_q(flash_q)
);
//===========================================================================
// Always blocks
//===========================================================================
always
  #tic clk = !clk;
//===========================================================================
// initial blocks
//===========================================================================
// apply stumulus
initial begin
  // init clock
  clk = 1'b0;
  #tic; // to align signals with posedge clk
  // reset device
  rst = 1'b1;
  core_data_out = IDLEDATA;
  instruction = 32'hffff0000;
  c_data_in_rdy = 1'b1; // should always be 1 unless fifo is full
  c_data_out_rdy = 1'b1; // should always be 1 unless fifo is full
  iq_empty = 1'b0; // should be 0 unluss command queue is empty
  iRB_N = 1'b1;
  core_data_out = IDLEDATA;
  #two_clk
  rst = 1'b0;
  #two_clk
  rst = 1'b1;
  // standby
  $display("Testing Standby at time %d", $time);
  core_data_out = 8'hff; // arbitrary patern, this should not affect outputs
  instruction = 32'hffff0000;
  // bus idle
  #four_clk // standby goes into bus idle automaticaly
  $display("Teseting Bus Idle at time %d", $time);
  instruction = 32'hffff0001;
  // command input
  #two_clk
  $display("Teseting Command Input at time %d", $time);
  instruction = 32'hffff0002;
  core_data_out = $random; // random command
  // addres input
  #two_clk
  $display("Teseting Address Input at time %d", $time);
  instruction = 32'hffff0003;
  core_data_out = $random; // random address
  // data input
  #two_clk
  $display("Teseting Data Input at time %d", $time);
  instruction = 32'hffff0004;
  core_data_out = $random; // random data
  // data output begin
  #two_clk
  $display("Testing Data Output at time %d", $time);
  instruction = 32'hffff0005;
  core_data_out = IDLEDATA;
  flash_q = $random;
  // data output end
  #two_clk
  $display("Testing Data Output End at time %d", $time);
  instruction = 32'hffff0006;
  flash_q = $random;
  // write protect
  #two_clk
  $display("Testing Write Protect at time %d", $time);
  instruction = 32'hffff0007;
  flash_q = IDLEDATA;
  // set up for repeat test
  #two_clk
  $display("Done Testing States");
  instruction = 32'hffff0001; // idle
  // wait for next ack_mode_read signal
  #three_clk
  // repeat counter test
  $display("Testing Repeat counter at time %t", $time);
  instruction = 32'hffff0043; // repeat Address input 4 more times
  #four_clk
  #four_clk
  #four_clk
  // command queue under flow test
  iq_empty = 1'b1;
  #two_clk
  instruction = 32'hfff0002;
  #two_clk
  iq_empty = 1'b0;
  // data in queue under flow test
  #two_clk
  c_data_in_rdy = 1'b0;
  #two_clk
  c_data_in_rdy = 1'b1;
  // data out queue over flow test
  #two_clk
  instruction = 32'hffff0005;
  #two_clk
  c_data_out_rdy = 1'b0;
  #two_clk
  c_data_out_rdy = 1'b1;
  #two_clk
  // end sim
  #100
  $stop;
end
endmodule