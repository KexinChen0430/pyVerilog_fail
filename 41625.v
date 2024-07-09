module test_case ();
   // Test Configuration
   // These parameters need to be set for each test case
   parameter simulation_name = "test_00";
   parameter number_of_tests = 2;
   reg  err;
   reg [31:0] data_out;
   integer    i;
   initial begin
      $display("Test 00 Case");
      `TB.master_bfm.reset;
      @(posedge `WB_RST);
      @(negedge `WB_RST);
      @(posedge `WB_CLK);
      `TB.master_bfm.read_burst(`SPI_CONTROL_REG_ADDRESS, data_out, 4'h8, 1, 0, err);
      `TEST_COMPARE("SPI Control REG POR", 32'h10000000, data_out);
     `TB.master_bfm.read_burst(`SPI_STATUS_REG_ADDRESS, data_out, 4'h4, 1, 0, err);
      `TEST_COMPARE("SPI Status REG POR", 32'h0005_0000, data_out);
      #10000;
      `TEST_COMPLETE;
   end
endmodule