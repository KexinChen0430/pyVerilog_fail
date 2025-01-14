module test_case ();
   // Test Configuration
   // These parameters need to be set for each test case
   parameter simulation_name = "simple_slave_00";
   parameter ram_image = "simple_slave_00.mem";
   parameter channel0_adc_image = "simple_slave_00_adc.mem";
   parameter channel1_adc_image = "simple_slave_00_adc.mem";
   parameter channel2_adc_image = "simple_slave_00_adc.mem";
   parameter channel3_adc_image = "simple_slave_00_adc.mem";
   parameter number_of_tests = 1035;
   reg  err;
   reg [31:0] data_out;
   integer    i;
   initial begin
      $display("Simple Slave Test Case");
      `TB.master_bfm.reset;
      @(posedge `WB_RST);
      @(negedge `WB_RST);
      @(posedge `WB_CLK);
      `TB.master_bfm.write(`WB_DSP_EQUATION0_ADDRESS_REG, 32'h1122_3344, 4'hF, err);
      `TB.master_bfm.write(`WB_DSP_EQUATION1_ADDRESS_REG, 32'h5566_7788, 4'hF, err);
      `TB.master_bfm.write(`WB_DSP_EQUATION2_ADDRESS_REG, 32'h99aa_bbcc, 4'hF, err);
      `TB.master_bfm.write(`WB_DSP_EQUATION3_ADDRESS_REG, 32'hddee_ff00, 4'hF, err);
      `TB.master_bfm.write(`WB_DSP_CONTROL_REG, 32'h5566_7788, 4'hF, err);
      `TB.master_bfm.write(`WB_DAQ_CONTROL_REG, 32'h99AA_BBCC, 4'hF, err);
      `TB.master_bfm.write(`WB_DAQ_CHANNEL0_CONTROL_REG, 32'h1234_5678, 4'hF, err);
      `TB.master_bfm.write(`WB_DAQ_CHANNEL1_CONTROL_REG, 32'h9ABC_DEF0, 4'hF, err);
      `TB.master_bfm.write(`WB_DAQ_CHANNEL2_CONTROL_REG, 32'hA5B6_C7D8, 4'hF, err);
      `TB.master_bfm.write(`WB_DAQ_CHANNEL3_CONTROL_REG, 32'hE9FA_DEAD, 4'hF, err);
      @(posedge `WB_CLK);
      `TB.master_bfm.read_burst(`WB_DSP_EQUATION0_ADDRESS_REG, data_out, 4'hF, 1, 0, err);
      `TEST_COMPARE("DSP Equation0 Read", 32'h1122_3344, data_out);
      @(posedge `WB_CLK);
      `TB.master_bfm.read_burst(`WB_DSP_EQUATION1_ADDRESS_REG, data_out, 4'hF, 1, 0, err);
      `TEST_COMPARE("DSP Equation1 Read", 32'h5566_7788, data_out);
      @(posedge `WB_CLK);
      `TB.master_bfm.read_burst(`WB_DSP_EQUATION2_ADDRESS_REG, data_out, 4'hF, 1, 0, err);
      `TEST_COMPARE("DSP Equation2 Read", 32'h99aa_bbcc, data_out);
      @(posedge `WB_CLK);
      `TB.master_bfm.read_burst(`WB_DSP_EQUATION3_ADDRESS_REG, data_out, 4'hF, 1, 0, err);
      `TEST_COMPARE("DSP Equation3 Read", 32'hddee_ff00, data_out);
      @(posedge `WB_CLK);
      `TB.master_bfm.read_burst(`WB_DSP_CONTROL_REG, data_out, 4'hF, 1, 0, err);
      `TEST_COMPARE("DSP Control Read", 32'h5566_7788, data_out);
      @(posedge `WB_CLK);
      `TB.master_bfm.read_burst(`WB_DSP_STATUS_REG, data_out, 4'hF, 1, 0, err);
      `TEST_COMPARE("DSP Status Read", 32'h1, data_out);
      @(posedge `WB_CLK);
      `TB.master_bfm.read_burst(`WB_DAQ_CONTROL_REG, data_out, 4'hF, 1, 0, err);
      #3 `TEST_COMPARE("DAQ Control Read", 32'h99AA_BBCC, data_out);
      @(posedge `WB_CLK);
      `TB.master_bfm.read_burst(`WB_DAQ_CHANNEL0_CONTROL_REG, data_out, 4'hF, 1, 0, err);
      `TEST_COMPARE("DAQ CH0 Control Read", 32'h1234_5678, data_out);
      @(posedge `WB_CLK);
      `TB.master_bfm.read_burst(`WB_DAQ_CHANNEL1_CONTROL_REG, data_out, 4'hF, 1, 0, err);
      `TEST_COMPARE("DAQ CH1 Control Read", 32'h9ABC_DEF0, data_out);
      @(posedge `WB_CLK);
      `TB.master_bfm.read_burst(`WB_DAQ_CHANNEL2_CONTROL_REG, data_out, 4'hF, 1, 0, err);
      `TEST_COMPARE("DAQ CH2 Control Read", 32'hA5B6_C7D8, data_out);
      @(posedge `WB_CLK);
      `TB.master_bfm.read_burst(`WB_DAQ_CHANNEL3_CONTROL_REG, data_out, 4'hF, 1, 0, err);
      `TEST_COMPARE("DAQ CH3 Control Read", 32'hE9FA_DEAD, data_out);
      repeat(10) @(posedge `WB_CLK);
      for (i=0; i<4096; i=i+4)begin
         `TB.master_bfm.write(`WB_DSP_RAM_BASE_ADDRESS + i, {i[7:0],i[7:0],i[7:0],i[7:0]}, 4'hF, err);
      end
      for (i=0; i<4096; i=i+4)begin
         `TB.master_bfm.read_burst(`WB_DSP_RAM_BASE_ADDRESS+i, data_out, 4'hF, 1, 0, err);
         `TEST_COMPARE("RAM0 Read", {i[7:0],i[7:0],i[7:0],i[7:0]}, data_out);
      end
      for (i=0; i<4096; i=i+4)begin
         `TB.master_bfm.write(`WB_DSP_RAM_BASE_ADDRESS + i, {24'h0,i[7:0]*4'd2}, 4'h1, err);
         `TB.master_bfm.write(`WB_DSP_RAM_BASE_ADDRESS + i, {16'h0,i[7:0]*4'd3,8'h00}, 4'h2, err);
         `TB.master_bfm.write(`WB_DSP_RAM_BASE_ADDRESS + i, {8'h0,i[7:0]*4'd4,16'h0}, 4'h4, err);
         `TB.master_bfm.write(`WB_DSP_RAM_BASE_ADDRESS + i, {i[7:0]*4'd5,24'h0}, 4'h8, err);
      end
      #1000;
      `TEST_COMPLETE;
   end
endmodule