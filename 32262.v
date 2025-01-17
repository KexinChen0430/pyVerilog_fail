module test_bsg
#(
  parameter cycle_time_p = 20,
  parameter width_p = `WIDTH_P,
  parameter reset_cycles_lo_p=0,
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
                           , .reset_cycles_hi_p(reset_cycles_hi_p)
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
  logic [width_p-1:0] test_input_A,
                       test_input_B,
                       test_input_sel,
                       test_output,
                       test_input_sel_r;
  always_ff @(posedge clk)
  begin
    if(reset)
      begin
        test_input_A <= {width_p{1'b1}};
        test_input_B <= 0;
        test_input_sel <= 0;
      end
    else
      test_input_sel <= test_input_sel+1;
    test_input_sel_r <= test_input_sel;
  end
  always_ff @(posedge clk)
  begin
    if(!reset)
      assert (test_output==test_input_sel)
        else $error("mismatch on input %x", test_input_sel);
    /*$display("\ntest_input_A: %b test_input_B: %b test_input_sel: %b test_output: %b"
             , test_input_A, test_input_B, test_input_sel, test_output);*/
    if((&test_input_sel_r) & (~|test_input_sel))
      begin
        $display("==============================================================\n");
        $finish;
      end
  end
  bsg_mux_bitwise #(
    .width_p(width_p)
  )  DUT (
    .data0_i(test_input_A)
    ,.data1_i(test_input_B)
    ,.sel_i(test_input_sel)
    ,.data_o(test_output)
  );
endmodule