module test_bsg;
#(
  parameter width_p      = `WIDTH_P,
  parameter els_p        = `ELS_P,
  parameter addr_width_p = `BSG_SAFE_CLOG2(`ELS_P),
  parameter cycle_time_p = 20,
  parameter seed_p       = `SEED_P,
  parameter reset_cycles_lo_p=1,
  parameter reset_cycles_hi_p=5
);
  // clock and reset generation
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
    /*$monitor(  "@%0t: count:%d", $time, count
             , " test_input_data:%b test_input_addr:%b test_input_w:%b test_input_v:%b"
             , test_input_data, test_input_addr, test_input_w, test_input_v
             , " test_input_data_r:%b test_output_data:%b"
             , test_input_data_r, test_output_data
            );*/
    $display("\n\n\n");
    $display("===========================================================");
    $display("testing bsg_mem_1rw_sync with ...");
    $display("WIDTH_P: %0d", width_p);
    $display("ELS_P  : %0d\n", els_p);
  end
  logic [width_p-1:0] test_input_data, test_input_data_r
                       , test_output_data, test_output_data_r;
  logic [addr_width_p-1:0] test_input_addr;
  logic test_input_w, test_input_v;
  logic [`BSG_SAFE_CLOG2(3*els_p):0] count;
  bsg_cycle_counter #(  .width_p   (`BSG_SAFE_CLOG2(3*els_p)+1)
                      , .init_val_p()
                     )  cycle_counter
                     (  .clk_i    (clk)
                      , .reset_i(reset)
                      , .ctr_r_o(count)
                     );
  // random test data generation;
  // generates a new random number after every +ve clock edge
  bsg_nonsynth_random_gen #(  .width_p(width_p)
                            , .seed_p (seed_p)
                           )  random_gen
                           (  .clk_i  (clk)
                            , .reset_i(reset)
                            , .yumi_i (1'b1)
                            , .data_o (test_input_data)
                           );
  always_ff @(posedge clk)
  begin
    test_output_data_r <= test_output_data;
    if(test_input_w)
      test_input_data_r <= test_input_data;
    if(reset)
      begin
        test_input_addr <= addr_width_p'(0);
        test_input_w    <= 1'b1;
        test_input_v    <= 1'b1;
      end
    else
      begin
        test_input_w    <= !(test_input_w);
        test_input_addr <= test_input_addr + !(test_input_w);
        if(count < 2*els_p-1) // first pass
          test_input_v <= 1'b1;
        else if(count < 3*els_p) // second pass, covers only a portion of mem.
          test_input_v <= 1'b0;
        else
          begin
            $display("=======================================================\n");
            $finish;
          end
      end
  end
  logic new_read; // is set if newly written value is read in first pass
  always_ff @(posedge clk)
  begin
    if(reset)
        new_read <= 1'b0; // initializing new_read
    else
      begin
        // if w_i is low and v_i is high a new mem. location is read
        if(count <= 2*els_p-1)
          begin
            if((!test_input_w) && test_input_v)
              new_read <= 1'b1;
            else
              new_read <= 1'b0;
          end
        else
          new_read <= 1'b0;
        if(count >= 2)
          begin
            if(count <= 2*els_lp && new_read) // new read in first pass
              assert(test_output_data == test_input_data_r)
                else $error("output=%b expected_output:%b\n"
                            , test_output_data, test_input_data_r);
            else
              assert(test_output_data == test_output_data_r)
                else $error("output=%b expected_output:%b\n"
                            , test_output_data, test_output_data_r);
          end
      end
  end
  bsg_mem_1rw_sync #(  .width_p(width_p)
                     , .els_p  (els_p)
                    )  DUT
                    (  .clk_i  (clk)
                     , .reset_i(reset)
                     , .data_i (test_input_data)
                     , .addr_i (test_input_addr)
                     , .v_i    (test_input_v)
                     , .w_i    (test_input_w)
                     , .data_o (test_output_data)
                    );
endmodule