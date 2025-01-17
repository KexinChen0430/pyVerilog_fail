module test_bsg
#(
  parameter cycle_time_p = 20,
  parameter inputs_p     = `INPUTS_P,
  parameter reset_cycles_lo_p=0,
  parameter reset_cycles_hi_p=5
);
  // Clock and reset generation
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
	  $display("INPUTS_P: %d\n", inputs_p);
  end
  logic test_input_ready;
  logic [inputs_p-1:0] test_input_reqs, test_output_grants;
  logic finish_r;
  logic [`BSG_SAFE_CLOG2(2*inputs_p+1)-1:0] grant_count [inputs_p-1:0];
  logic [`BSG_SAFE_CLOG2(2*inputs_p)-1:0] count;
  // test input generation
  always_ff @(posedge clk)
  begin
    /*$display("count: %d", count
             , " | ready: %b", test_input_ready
             , " | test_reqs: %b", test_input_reqs
             , " | grant_count: %p", grant_count
             , " | reqs_popcount: %d", reqs_popcount);*/
    if(reset)
      begin
        test_input_reqs  <= (inputs_p)'(0);
        test_input_ready <= 1'b1;
        count            <= 0;
        finish_r         <= 1'b0;
      end
    else
      begin
        count <= (count + test_input_ready) % (2*inputs_p);
        if(!(|count) && !test_input_ready)
          begin
            test_input_reqs <= test_input_reqs + 1;
            if(&test_input_reqs)
              finish_r <= 1'b1;
          end
        if(count == 2*inputs_p-1)
          test_input_ready <= 1'b0;
        if(!test_input_ready)
          test_input_ready <= 1'b1;
      end
  end
   wire v;
  bsg_round_robin_arb #(.inputs_p(inputs_p)
                       ) UUT
                       ( .clk_i   (clk)
                        ,.reset_i (reset)
                        ,.grants_en_i (test_input_ready)
                        ,.reqs_i  (test_input_reqs)
                        ,.grants_o(test_output_grants)
		        ,.v_o   (v)
			,.tag_o ( )
		        ,.yumi_i(v)
                       );
  // calculates the no. of requests
  logic [`BSG_SAFE_CLOG2(inputs_p+1)-1:0] reqs_popcount;
  bsg_popcount #(.width_p(inputs_p)
                ) popcounter
                ( .i(test_input_reqs)
                 ,.o(reqs_popcount)
                );
  // test output verification
  always_ff @(posedge clk)
  begin
    if(reset)
      grant_count <= '{inputs_p{0}};
    else
      begin
        for(int i=0; i<inputs_p; ++i)
        begin
          if(test_output_grants[i])
            grant_count[i] <= grant_count[i] + 1;
        end
        if(!(|count) && !test_input_ready)
          begin
            grant_count <= '{inputs_p{0}};
            for(int i=0; i<inputs_p; ++i)
            begin
              if(!test_input_reqs[i])
                assert(!(|grant_count[i]))
                  else $error("Granted input is not requested");
              else
                assert(grant_count[i] <= (2*inputs_p/reqs_popcount)+1
                        && grant_count[i] >= (2*inputs_p/reqs_popcount))
                  else $error("Arbitrer is unfair");
            end
          end
      end
  end
  // finish
  always_ff @(posedge clk)
    if(finish_r)
      begin
        $display("==========================================================");
        $finish;
      end
endmodule