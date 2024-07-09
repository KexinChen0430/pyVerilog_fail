module arriaiigz_io_config (
  	datain,
  	clk,
  	ena,
  	update,
  	devclrn,
  	devpor,
  	padtoinputregisterdelaysetting,
  	outputdelaysetting1,
  	outputdelaysetting2,
  	dutycycledelaymode,
  	dutycycledelaysettings,
  	outputfinedelaysetting1,
  	outputfinedelaysetting2,
  	outputonlydelaysetting2,
  	outputonlyfinedelaysetting2,
  	padtoinputregisterfinedelaysetting,
  	dataout
  );
  parameter enhanced_mode = "false";
  parameter lpm_type = "arriaiigz_io_config";
  input        datain;
  input        clk;
  input        ena;
  input        update;
  input        devclrn;
  input        devpor;
  output [3:0] padtoinputregisterdelaysetting;
  output [3:0] outputdelaysetting1;
  output [2:0] outputdelaysetting2;
  output       dataout;
  // new STRATIXIV: ww30.2008
  output       dutycycledelaymode;
  output [3:0] dutycycledelaysettings;
  output       outputfinedelaysetting1;
  output       outputfinedelaysetting2;
  output [2:0] outputonlydelaysetting2;
  output       outputonlyfinedelaysetting2;
  output       padtoinputregisterfinedelaysetting;
  tri1 devclrn;
  tri1 devpor;
  reg  [10:0] shift_reg;
  reg  [10:0] output_reg;
  wire        tmp_dataout;
  wire [10:0] tmp_output;
  reg  [22:0] enhance_shift_reg;
  reg  [22:0] enhance_output_reg;
  wire [22:0] enhance_tmp_output;
  // buffer layer
  wire        datain_in;
  wire        clk_in;
  wire        ena_in;
  wire        update_in;
  wire        devclrn_in, devpor_in;
  assign datain_in =  datain;
  assign clk_in =  clk;
  assign ena_in =  (ena === 1'b1) ? 1'b1 : 1'b0;
  assign update_in =  (update === 1'b1) ? 1'b1 : 1'b0;
  assign  devclrn_in = (devclrn === 1'b0) ? 1'b0 : 1'b1;
  assign  devpor_in  = (devpor  === 1'b0) ? 1'b0 : 1'b1;
  // TCO DELAYS, IO PATH and SETUP-HOLD CHECKS
  specify
  	(posedge clk => (dataout +: tmp_dataout)) = (0, 0);
  	$setuphold(posedge clk, datain, 0, 0);
  endspecify
  // DRIVERs FOR outputs
  and (dataout, tmp_dataout, 1'b1);
  // primary outputs
  assign tmp_dataout = (enhanced_mode == "true") ? enhance_shift_reg[22] : shift_reg[10];
  // bit order changed in wys revision 1.32
  assign outputdelaysetting1            = (enhanced_mode == "true") ? enhance_tmp_output[3:0]  : tmp_output[3:0];
  assign outputdelaysetting2            = (enhanced_mode == "true") ? enhance_tmp_output[6:4]  : tmp_output[6:4];
  assign padtoinputregisterdelaysetting = (enhanced_mode == "true") ? enhance_tmp_output[10:7] : tmp_output[10:7];
  assign outputfinedelaysetting1            = (enhanced_mode == "true") ? enhance_tmp_output[11]     : 1'b0;
  assign outputfinedelaysetting2            = (enhanced_mode == "true") ? enhance_tmp_output[12]     : 1'b0;
  assign padtoinputregisterfinedelaysetting = (enhanced_mode == "true") ? enhance_tmp_output[13]     : 1'b0;
  assign outputonlyfinedelaysetting2        = (enhanced_mode == "true") ? enhance_tmp_output[14]     : 1'b0;
  assign outputonlydelaysetting2            = (enhanced_mode == "true") ? enhance_tmp_output[17:15]  : 3'b000;
  assign dutycycledelaymode                 = (enhanced_mode == "true") ? enhance_tmp_output[18]     : 1'b0;
  assign dutycycledelaysettings             = (enhanced_mode == "true") ? enhance_tmp_output[22:19]  : 4'h0;
  assign tmp_output = output_reg;
  assign enhance_tmp_output = enhance_output_reg;
  initial
  begin
      shift_reg = 'b0;
      output_reg = 'b0;
      enhance_shift_reg = 'b0;
      enhance_output_reg = 'b0;
  end
  always @(posedge clk_in)
  begin
      if (ena_in === 1'b1)
      begin
          shift_reg[0] <= datain_in;
          shift_reg[10:1] <= shift_reg[9:0];
          enhance_shift_reg[0] <= datain_in;
          enhance_shift_reg[22:1] <= enhance_shift_reg[21:0];
      end
  end
  always @(posedge clk_in)
  begin
      if (update_in === 1'b1)
      begin
          output_reg <= shift_reg;
          enhance_output_reg <= enhance_shift_reg;
      end
  end
  endmodule