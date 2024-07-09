module arriaiigz_half_rate_input (
  	datain,
  	directin,
  	clk,
  	areset,
  	dataoutbypass,
  	devclrn,
  	devpor,
  	dffin,
  	dataout
  );
  parameter power_up = "low";
  parameter async_mode = "none";
  parameter use_dataoutbypass = "false";
  parameter lpm_type = "arriaiigz_half_rate_input";
  input [1:0]  datain;
  input        directin;
  input        clk;
  input        areset;
  input        dataoutbypass;
  input        devclrn;
  input        devpor;
  output [3:0] dataout;
  output [1:0] dffin;     // buried
  tri1 devclrn;
  tri1 devpor;
  // delayed version to ensure one cycle of latency in functional as expected
  wire [1:0] datain_in;
  // IO registers
  // common
  wire        neg_clk_in;
  reg         adatasdata_in_r;
  reg         aload_in_r;
  // low_bank  = {1, 0} - capturing datain at falling edge then sending at falling rise
  // high_bank = {3, 2} - output of register datain at rising
  wire [1:0]  high_bank;
  wire [1:0]  low_bank;
  wire        low_bank_low;
  wire        low_bank_high;
  wire        high_bank_low;
  wire        high_bank_high;
  wire [1:0]  dataout_reg_n;
  wire [3:0]   tmp_dataout;
  // buffer layer
  wire [1:0]  datain_ipd;
  wire        directin_in;
  wire        clk_in;
  wire        areset_in;
  wire        dataoutbypass_in;
  wire        devclrn_in, devpor_in;
  assign datain_ipd =  datain;
  assign directin_in =  directin;
  assign clk_in =  clk;
  assign areset_in =  (areset === 1'b1) ? 1'b1 : 1'b0;
  assign dataoutbypass_in =  (dataoutbypass === 1'b1) ? 1'b1 : 1'b0;
  assign devclrn_in = (devclrn === 1'b0) ? 1'b0 : 1'b1;
  assign devpor_in  = (devpor  === 1'b0) ? 1'b0 : 1'b1;
  // primary input
  assign #2 datain_in = datain_ipd;
  // primary output
  assign dataout = tmp_dataout;
  assign tmp_dataout[3] = (dataoutbypass_in === 1'b0 && use_dataoutbypass == "true") ?  directin_in : high_bank_high;
  assign tmp_dataout[2] = (dataoutbypass_in === 1'b0 && use_dataoutbypass == "true") ?  directin_in : high_bank_low;
  assign tmp_dataout[1] = low_bank[1];
  assign tmp_dataout[0] = low_bank[0];
  assign low_bank  = {low_bank_high, low_bank_low};
  assign high_bank = {high_bank_high, high_bank_low};
  // resolve reset modes
  always @(areset_in)
  begin
      if(async_mode == "clear")
      begin
          aload_in_r   = areset_in;
          adatasdata_in_r = 1'b0;
      end
      else if(async_mode == "preset")
      begin
          aload_in_r   = areset_in;
          adatasdata_in_r = 1'b1;
      end
      else  // async_mode == "none"
      begin
          aload_in_r   = 1'b0;
          adatasdata_in_r = 1'b0;
      end
  end
  assign neg_clk_in = ~clk_in;
  // datain_1 - H
  arriaiigz_ddr_io_reg  reg1_h(
                        .d(datain_in[1]),
                        .clk(clk_in),
                        .ena(1'b1),
                        .clrn(1'b1),
                        .prn(1'b1),
                        .aload(aload_in_r),
                        .asdata(adatasdata_in_r),
                        .sclr(1'b0),
                        .sload(1'b0),
                        .devclrn(devclrn_in),
                        .devpor(devpor_in),
                        .rpt_violation(1'b1),
                        .q(high_bank_high)
                    );
           defparam reg1_h.power_up = power_up;
  // datain_0 - H
  arriaiigz_ddr_io_reg  reg0_h(
                        .d(datain_in[0]),
                        .clk(clk_in),
                        .ena(1'b1),
                        .clrn(1'b1),
                        .prn(1'b1),
                        .aload(aload_in_r),
                        .asdata(adatasdata_in_r),
                        .sclr(1'b0),
                        .sload(1'b0),
                        .devclrn(devclrn_in),
                        .devpor(devpor_in),
                        .rpt_violation(1'b1),
                        .q(high_bank_low)
                    );
           defparam reg0_h.power_up = power_up;
  // datain_1 - L (n)
  arriaiigz_ddr_io_reg  reg1_l_n(
                        .d(datain_in[1]),
                        .clk(neg_clk_in),
                        .ena(1'b1),
                        .clrn(1'b1),
                        .prn(1'b1),
                        .aload(aload_in_r),
                        .asdata(adatasdata_in_r),
                        .sclr(1'b0),
                        .sload(1'b0),
                        .devclrn(devclrn_in),
                        .devpor(devpor_in),
                        .rpt_violation(1'b1),
                        .q(dataout_reg_n[1])
                    );
           defparam reg1_l_n.power_up = power_up;
  // datain_1 - L
  arriaiigz_ddr_io_reg reg1_l(
                        .d(dataout_reg_n[1]),
                        .clk(clk_in),
                        .ena(1'b1),
                        .clrn(1'b1),
                        .prn(1'b1),
                        .aload(aload_in_r),
                        .asdata(adatasdata_in_r),
                        .sclr(1'b0),
                        .sload(1'b0),
                        .devclrn(devclrn_in),
                        .devpor(devpor_in),
                        .rpt_violation(1'b0),
                        .q(low_bank_high)
                    );
           defparam reg1_l.power_up = power_up;
  // datain_0 - L (n)
  arriaiigz_ddr_io_reg  reg0_l_n(
                        .d(datain_in[0]),
                        .clk(neg_clk_in),
                        .ena(1'b1),
                        .clrn(1'b1),
                        .prn(1'b1),
                        .aload(aload_in_r),
                        .asdata(adatasdata_in_r),
                        .sclr(1'b0),
                        .sload(1'b0),
                        .devclrn(devclrn_in),
                        .devpor(devpor_in),
                        .rpt_violation(1'b1),
                        .q(dataout_reg_n[0])
                    );
           defparam reg0_l_n.power_up = power_up;
  // datain_0 - L
  arriaiigz_ddr_io_reg reg0_l(
                        .d(dataout_reg_n[0]),
                        .clk(clk_in),
                        .ena(1'b1),
                        .clrn(1'b1),
                        .prn(1'b1),
                        .aload(aload_in_r),
                        .asdata(adatasdata_in_r),
                        .sclr(1'b0),
                        .sload(1'b0),
                        .devclrn(devclrn_in),
                        .devpor(devpor_in),
                        .rpt_violation(1'b0),
                        .q(low_bank_low)
                    );
           defparam reg0_l.power_up = power_up;
  endmodule