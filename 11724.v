module tb_blake2();
  // Internal constant and parameter definitions.
  parameter DEBUG = 0;
  parameter CLK_HALF_PERIOD = 2;
  // API for the dut.
  // Register and Wire declarations.
  reg tb_clk;
  reg tb_reset_n;
  reg           tb_cs;
  reg           tb_write_read;
  reg  [7 : 0]  tb_address;
  reg  [31 : 0] tb_data_in;
  wire [31 : 0] tb_data_out;
  wire          tb_error;
  reg [63 : 0] cycle_ctr;
  reg [31 : 0] error_ctr;
  reg [31 : 0] tc_ctr;
  reg          error_found;
  reg [31 : 0] read_data;
  reg [511 : 0] extracted_data;
  reg display_cycle_ctr;
  reg display_read_write;
  // Blake2 device under test.
  blake2 dut(
             // Clock and reset.
             .clk(tb_clk),
             .reset_n(tb_reset_n),
             // Control.
             .cs(tb_cs),
             .we(tb_write_read),
             // Data ports.
             .address(tb_address),
             .write_data(tb_data_in),
             .read_data(tb_data_out),
             .error(tb_error)
            );
  // clk_gen
  // Clock generator process.
  always
    begin : clk_gen
      #CLK_HALF_PERIOD tb_clk = !tb_clk;
    end // clk_gen
  // dut_monitor
  // Monitor displaying information every cycle.
  // Includes the cycle counter.
  always @ (posedge tb_clk)
    begin : dut_monitor
      cycle_ctr = cycle_ctr + 1;
      if (display_cycle_ctr)
        begin
          $display("cycle = %016x:", cycle_ctr);
        end
    end // dut_monitor
  // reset_dut
  task reset_dut();
    begin
      tb_reset_n = 0;
      #(4 * CLK_HALF_PERIOD);
      tb_reset_n = 1;
    end
  endtask // reset_dut
  // dump_dut_state
  // Dump the internal state of the dut to std out.
  task dump_dut_state();
    begin
      $display("");
      $display("DUT internal state");
      $display("------------------");
      $display("");
    end
  endtask // dump_dut_state
  // display_test_result()
  // Display the accumulated test results.
  task display_test_result();
    begin
      if (error_ctr == 0)
        begin
          $display("*** All %02d test cases completed successfully", tc_ctr);
        end
      else
        begin
          $display("*** %02d test cases did not complete successfully.", error_ctr);
        end
    end
  endtask // display_test_result
  // init_dut()
  // Set the input to the DUT to defined values.
  task init_dut();
    begin
      // Set clock, reset and DUT input signals to
      // defined values at simulation start.
      cycle_ctr     = 0;
      error_ctr     = 0;
      tc_ctr        = 0;
      tb_clk        = 0;
      tb_reset_n    = 0;
      tb_cs         = 0;
      tb_write_read = 0;
      tb_address    = 8'h00;
      tb_data_in    = 32'h00000000;
    end
  endtask // init_dut
  // blake2_test
  // The main test functionality.
  initial
    begin : blake2_test
      $display("   -- Testbench for blake2 started --");
      init_dut();
      reset_dut();
      $display("State at init after reset:");
      dump_dut_state();
      display_test_result();
      $display("*** blake2 simulation done.");
      $finish;
    end // blake2_test
endmodule