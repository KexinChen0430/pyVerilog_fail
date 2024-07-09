module arriaiigz_dqs_config (
  	datain,
  	clk,
  	ena,
  	update,
  	devclrn,
  	devpor,
  	dqsbusoutdelaysetting,
  	dqsinputphasesetting,
  	dqsenablectrlphasesetting,
  	dqsoutputphasesetting,
  	dqoutputphasesetting,
  	resyncinputphasesetting,
  	dividerphasesetting,
  	enaoctcycledelaysetting,
  	enainputcycledelaysetting,
  	enaoutputcycledelaysetting,
  	dqsenabledelaysetting,
  	octdelaysetting1,
  	octdelaysetting2,
  	enadataoutbypass,
  	enadqsenablephasetransferreg, // new in 1.23
  	enaoctphasetransferreg,       // new in 1.23
  	enaoutputphasetransferreg,    // new in 1.23
  	enainputphasetransferreg,     // new in 1.23
  	resyncinputphaseinvert,         // new in 1.26
  	dqsenablectrlphaseinvert,       // new in 1.26
  	dqoutputphaseinvert,            // new in 1.26
  	dqsoutputphaseinvert,           // new in 1.26
  	dqsbusoutfinedelaysetting,
  	dqsenablefinedelaysetting,
  	dataout
  );
  parameter enhanced_mode = "false";
  parameter lpm_type = "arriaiigz_dqs_config";
  // INPUT PORTS
  input        datain;
  input        clk;
  input        ena;
  input        update;
  input        devclrn;
  input        devpor;
  // OUTPUT PORTS
  output [3:0] dqsbusoutdelaysetting;
  output [2:0] dqsinputphasesetting;
  output [3:0] dqsenablectrlphasesetting;
  output [3:0] dqsoutputphasesetting;
  output [3:0] dqoutputphasesetting;
  output [3:0] resyncinputphasesetting;
  output       dividerphasesetting;
  output       enaoctcycledelaysetting;
  output       enainputcycledelaysetting;
  output       enaoutputcycledelaysetting;
  output [2:0] dqsenabledelaysetting;
  output [3:0] octdelaysetting1;
  output [2:0] octdelaysetting2;
  output       enadataoutbypass;
  output       enadqsenablephasetransferreg; // new in 1.23
  output       enaoctphasetransferreg;       // new in 1.23
  output       enaoutputphasetransferreg;    // new in 1.23
  output       enainputphasetransferreg;     // new in 1.23
  output       resyncinputphaseinvert;         // new in 1.26
  output       dqsenablectrlphaseinvert;       // new in 1.26
  output       dqoutputphaseinvert;            // new in 1.26
  output       dqsoutputphaseinvert;           // new in 1.26
  output       dqsbusoutfinedelaysetting;  // new in 1.39
  output       dqsenablefinedelaysetting;  // new in 1.39
  output       dataout;
  tri1 devclrn;
  tri1 devpor;
  reg  [47:0] shift_reg;
  reg  [47:0] output_reg;
  wire        tmp_dataout;
  wire [47:0] tmp_output;
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
  assign tmp_dataout = (enhanced_mode == "true") ? shift_reg[47] : shift_reg[45];
  assign dqsbusoutdelaysetting     = tmp_output[3  : 0];
  assign dqsinputphasesetting      = tmp_output[6  : 4];
  assign dqsenablectrlphasesetting = tmp_output[10 : 7];
  assign dqsoutputphasesetting     = tmp_output[14 : 11];
  assign dqoutputphasesetting      = tmp_output[18 : 15];
  assign resyncinputphasesetting   = tmp_output[22 : 19];
  assign dividerphasesetting       = tmp_output[23];
  assign enaoctcycledelaysetting   = tmp_output[24];
  assign enainputcycledelaysetting = tmp_output[25];
  assign enaoutputcycledelaysetting= tmp_output[26];
  assign dqsenabledelaysetting     = tmp_output[29 : 27];
  assign octdelaysetting1          = tmp_output[33 : 30];
  assign octdelaysetting2          = tmp_output[36 : 34];
  assign enadataoutbypass          = tmp_output[37];
  assign enadqsenablephasetransferreg = tmp_output[38]; // new in 1.23
  assign enaoctphasetransferreg       = tmp_output[39]; // new in 1.23
  assign enaoutputphasetransferreg    = tmp_output[40]; // new in 1.23
  assign enainputphasetransferreg     = tmp_output[41]; // new in 1.23
  assign resyncinputphaseinvert       = tmp_output[42];    // new in 1.26
  assign dqsenablectrlphaseinvert     = tmp_output[43];    // new in 1.26
  assign dqoutputphaseinvert          = tmp_output[44];    // new in 1.26
  assign dqsoutputphaseinvert         = tmp_output[45];    // new in 1.26
  // new in STRATIXIV: ww30.2008
  assign dqsbusoutfinedelaysetting    = (enhanced_mode == "true") ? tmp_output[46] : 1'b0;
  assign dqsenablefinedelaysetting    = (enhanced_mode == "true") ? tmp_output[47] : 1'b0;
  assign tmp_output         = output_reg;
  initial
  begin
      shift_reg = 'b0;
      output_reg = 'b0;
  end
  always @(posedge clk_in)
  begin
      if (ena_in === 1'b1)
      begin
          shift_reg[0] <= datain_in;
          shift_reg[47:1] <= shift_reg[46:0];
      end
  end
  always @(posedge clk_in)
  begin
      if (update_in === 1'b1)
          output_reg <= shift_reg;
  end
  endmodule