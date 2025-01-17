module test_bsg
#(
  parameter cycle_time_p = 20,
  parameter width_p = `WIDTH_P,
  parameter els_p = `ELS_P,
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
    $display("WIDTH_P: %d", width_p);
    $display("ELS_P  : %d\n", els_p);
  end
  logic [els_p-1:0][width_p-1:0]    test_input_data;
  logic [`BSG_SAFE_CLOG2(els_p)-1:0] test_input_sel;
  logic [width_p-1:0]                test_output;
  genvar i;
  generate
    for(i=0; i<els_p; ++i)
      assign test_input_data[i] = width_p'(i);
  endgenerate
  always_ff @(posedge clk)
  begin
    if(reset)
      test_input_sel <= `BSG_SAFE_CLOG2(els_p) ' (1'b0);
    else
      test_input_sel <= test_input_sel + 1;
  end
  always_ff @(posedge clk)
  begin
    /*$display("\ntest_input_data[sel] : %b, test_output: %b"
             , width_p'(test_input_sel), test_output);*////
    if(!reset)
      assert (test_output==width_p'(test_input_sel))
        else $error("mismatch on input %x", test_input_sel);
    if(test_input_sel==(els_p-1))
      begin
        $display("===============================================================\n");
        $finish;
      end
  end
  bsg_mux #(  .width_p  (width_p)
            , .els_p    (els_p)
            , .lg_els_lp()
           )  DUT
           (  .data_i(test_input_data)
            , .sel_i (test_input_sel)
            , .data_o(test_output)
           );
  /*logic [(2*width_p)-1:0] log;
  assign log = {test_output,
                width_p'(test_input_sel)};
  bsg_nonsynth_ascii_writer   #(  .width_p      (width_p)
                                , .values_p     (2)
                                , .filename_p   ("output.log")
                                , .fopen_param_p("a+")
                                , .format_p     ("%b")
                               )  ascii_writer
                               (  .clk    (clk)
                                , .reset_i(reset)
                                , .valid_i(1'b1)
                                , .data_i (log)
                               );*/
endmodule