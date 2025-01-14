module test_bsg
#(
  parameter cycle_time_p = 20,
  parameter width_p      = `WIDTH_P,
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
    $display("==============================================================\n");
    $display(  "testing with ...\n"
             , "WIDTH_P: %d\n", width_p
            );
  end
  logic [width_p-1:0] test_input_data, test_input_data_r, test_output;
  logic [width_p+1:0] count; // counter of width_p+2 -- to prevent overflow
  logic test_input_en, test_input_reset, finish_r;
  bsg_cycle_counter #(  .width_p(width_p+2)
                     )  bcc
                     (  .clk_i    (clk)
                      , .reset_i(reset)
                      , .ctr_r_o(count)
                     );
  always_ff @(posedge clk)
  begin
    if(reset)
      begin
        test_input_data  <= width_p'(1'b0);
        test_input_reset <= 1'b1;
        test_input_en    <= 1'b1;
      end
    else
      begin
        test_input_data  <= (test_input_data << 1) + 1;
        if(test_input_reset == 1'b1)
          test_input_reset <= 1'b0;
        if(test_input_en == 1'b0)
          test_input_en <= 1'b1;
        assert(test_input_data_r == test_output)
          else $error("mismatch on input %x; expected output: %x; output: %x"
                        , test_input_data, test_input_data_r, test_output);
      end
    /*$display("test_input_data_r: %b, test_output: %b\n"
              , test_input_data_r, test_output);*///
    if(test_input_reset)
      test_input_data_r <= width_p'(0);
    else if(test_input_en)
      test_input_data_r <= test_input_data;
    case(count)
      width_p  : test_input_reset <= 1'b1;
      width_p+1: test_input_en    <= 1'b0;
      width_p+4:
        begin
          $display("===========================================================\n");
          $finish;
        end
    endcase
  end
  bsg_dff_reset_en #(  .width_p(width_p)
                       )  DUT
    (  .clk_i(clk)
       , .data_i (test_input_data)
       , .en_i   (test_input_en)
       , .reset_i(test_input_reset)
       , .data_o (test_output)
       );
endmodule