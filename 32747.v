module test_bsg
#(
  parameter cycle_time_p = 20,
  parameter width_p = `WIDTH_P,
  parameter reset_cycles_lo_p=1,
  parameter reset_cycles_hi_p=5
);
  wire clk;
  wire reset;
  bsg_nonsynth_clock_gen #(  .cycle_time_p(cycle_time_p)
                          )  clock_gen
                          (  .o(clk)
                          );
  bsg_nonsynth_reset_gen #(  .num_clocks_p     (1)
                           , .reset_cycles_lo_p(reset_cycles_lo_p)
                           , .reset_cycles_hi_p(reset_cycles_lo_p)
                          )  reset_gen
                          (  .clk_i        (clk)
                           , .async_reset_o(reset)
                          );
  initial
  begin
    $display("\n\n\n");
    $display("===========================================================");
    $display("testing with ...");
    $display("WIDTH_P: %d\n", width_p);
  end
  logic [width_p-1:0] count, count_r;
  bsg_cycle_counter #(  .width_p(width_p)
                     )  bcc
                     (  .clk_i    (clk)
                      , .reset_i(reset)
                      , .ctr_r_o(count)
                     );
  logic [width_p-1:0] test_input;
  wire  [width_p-1:0] test_output;
  assign test_input = (count>>1) ^ count; // test_input is gray code of count
  always_ff @(posedge clk)
  begin
    count_r <= count;
    /*$display("\ntest_input: %b, count: %b, test_output: %b"
             , test_input, count, test_output);*/
    if(!reset)
      assert(test_output == count)
        else $error("mismatch on input %x", test_input);
    if(!(|count) & (&count_r))
      begin
        $display("===============================================================\n");
        $finish;
      end
  end
  bsg_gray_to_binary #(  .width_p(width_p)
                      )  DUT
                      (  .gray_i  (test_input)
                       , .binary_o(test_output)
                      );
  /*bsg_nonsynth_ascii_writer #(  .width_p      (width_p)
                              , .values_p     (3)
                              , .filename_p   ("output.log")
                              , .fopen_param_p("a+")
                              , .format_p     ("%x")
                             )  ascii_writer
                             (  .clk    (clk)
                              , .reset_i(reset)
                              , .valid_i(1'b1)
                              , .data_i ({test_output,
                                          count,
                                          test_input}
                                        )
                             );*/
endmodule