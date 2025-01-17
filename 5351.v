module MyReconfigLogic (
  input Reset_n_i,
  input Clk_i,
  input AdcConvComplete_i,
  output AdcDoConvert_o,
  input[9:0] AdcValue_i,
  input I2C_Busy_i,
  output[7:0] I2C_DataIn_o,
  input[7:0] I2C_DataOut_i,
  output[15:0] I2C_Divider800_o,
  output I2C_ErrAckParam_o,
  input I2C_Error_i,
  output I2C_F100_400_n_o,
  input I2C_FIFOEmpty_i,
  input I2C_FIFOFull_i,
  output I2C_FIFOReadNext_o,
  output I2C_FIFOWrite_o,
  output[3:0] I2C_ReadCount_o,
  output I2C_ReceiveSend_n_o,
  output I2C_StartProcess_o,
  input[7:0] Inputs_i,
  output[7:0] Outputs_o,
  output[4:0] ReconfModuleIRQs_o,
  output SPI_CPHA_o,
  output SPI_CPOL_o,
  output[7:0] SPI_DataIn_o,
  input[7:0] SPI_DataOut_i,
  input SPI_FIFOEmpty_i,
  input SPI_FIFOFull_i,
  output SPI_LSBFE_o,
  output SPI_ReadNext_o,
  output[7:0] SPI_SPPR_SPR_o,
  input SPI_Transmission_i,
  output SPI_Write_o,
  input[7:0] ReconfModuleIn_i,
  output[7:0] ReconfModuleOut_o,
  input[7:0] I2C_Errors_i,
  input[13:0] PerAddr_i,
  input[15:0] PerDIn_i,
  input[1:0] PerWr_i,
  input PerEn_i,
  output[15:0] CfgIntfDOut_o,
  output[15:0] ParamIntfDOut_o
);
  wire [15:0] PeriodCounterPreset_s;
  wire [15:0] SPICounterPresetH_s;
  wire [15:0] SPICounterPresetL_s;
  wire [15:0] SensorValue_s;
  wire [15:0] Threshold_s;
  wire [0:0] CfgClk_s;
  wire CfgMode_s;
  wire [0:0] CfgShift_s;
  wire CfgDataOut_s;
  wire [0:0] CfgDataIn_s;
  wire [2:0] ParamWrAddr_s;
  wire [15:0] ParamWrData_s;
  wire ParamWr_s;
  wire [0:0] ParamRdAddr_s;
  wire [15:0] ParamRdData_s;
TODO: implement
  wire Params_s;
  wire [0:0] I2C_ErrAckParam_s;
  wire ParamI2C_Divider800Enable_s;
  wire ParamI2C_ErrAckParamEnable_s;
  wire ParamPeriodCounterPresetEnable_s;
  wire ParamSPICounterPresetHEnable_s;
  wire ParamSPICounterPresetLEnable_s;
  wire ParamThresholdEnable_s;
  // Configuration Interface
  CfgIntf #(
    .BaseAddr('h0180),
    .NumCfgs(1)
  ) CfgIntf_0 (
    .Reset_n_i(Reset_n_i),
    .Clk_i(Clk_i),
    .PerAddr_i(PerAddr_i),
    .PerDIn_i(PerDIn_i),
    .PerDOut_o(CfgIntfDOut_o),
    .PerWr_i(PerWr_i),
    .PerEn_i(PerEn_i),
    .CfgClk_o(CfgClk_s),
    .CfgMode_o(CfgMode_s),
    .CfgShift_o(CfgShift_s),
    .CfgDataOut_o(CfgDataOut_s),
    .CfgDataIn_i(CfgDataIn_s)
  );
  // Parameterization Interface: 6 write addresses, 2 read addresses
  ParamIntf #(
    .BaseAddr('h0188),
    .WrAddrWidth(3),
    .RdAddrWidth(1)
  ) ParamIntf_0 (
    .Reset_n_i(Reset_n_i),
    .Clk_i(Clk_i),
    .PerAddr_i(PerAddr_i),
    .PerDIn_i(PerDIn_i),
    .PerDOut_o(ParamIntfDOut_o),
    .PerWr_i(PerWr_i),
    .PerEn_i(PerEn_i),
    .ParamWrAddr_o(ParamWrAddr_s),
    .ParamWrData_o(ParamWrData_s),
    .ParamWr_o(ParamWr_s),
    .ParamRdAddr_o(ParamRdAddr_s),
    .ParamRdData_i(ParamRdData_s)
  );
  ADT7310 ADT7310_0 (
    .ADT7310CS_n_o(Outputs_o[0]),
    .CpuIntr_o(ReconfModuleIRQs_o[0]),
    .SPI_Data_o(SPI_DataIn_o),
    .SPI_Data_i(SPI_DataOut_i),
    .SPI_FIFOEmpty_i(SPI_FIFOEmpty_i),
    .SPI_FIFOFull_i(SPI_FIFOFull_i),
    .SPI_ReadNext_o(SPI_ReadNext_o),
    .SPI_Transmission_i(SPI_Transmission_i),
    .SPI_Write_o(SPI_Write_o),
    .Enable_i(ReconfModuleIn_i[0]),
    .Clk_i(Clk_i),
    .Reset_n_i(Reset_n_i),
    .PeriodCounterPreset_i(PeriodCounterPreset_s),
    .SPICounterPresetH_i(SPICounterPresetH_s),
    .SPICounterPresetL_i(SPICounterPresetL_s),
    .SensorValue_o(SensorValue_s),
    .Threshold_i(Threshold_s)
  );
  assign AdcDoConvert_o = 1'b0;
  assign I2C_DataIn_o = 8'b00000000;
  assign I2C_F100_400_n_o = 1'b0;
  assign I2C_FIFOReadNext_o = 1'b0;
  assign I2C_FIFOWrite_o = 1'b0;
  assign I2C_ReadCount_o = 4'b0000;
  assign I2C_ReceiveSend_n_o = 1'b0;
  assign I2C_StartProcess_o = 1'b0;
  assign Outputs_o[1] = 1'b0;
  assign Outputs_o[2] = 1'b0;
  assign Outputs_o[3] = 1'b0;
  assign Outputs_o[4] = 1'b0;
  assign Outputs_o[5] = 1'b0;
  assign Outputs_o[6] = 1'b0;
  assign Outputs_o[7] = 1'b0;
  assign ReconfModuleIRQs_o[1] = 1'b0;
  assign ReconfModuleIRQs_o[2] = 1'b0;
  assign ReconfModuleIRQs_o[3] = 1'b0;
  assign ReconfModuleIRQs_o[4] = 1'b0;
  assign SPI_CPHA_o = 1'b0;
  assign SPI_CPOL_o = 1'b0;
  assign SPI_LSBFE_o = 1'b0;
  assign SPI_SPPR_SPR_o = 8'b00000000;
  assign ReconfModuleOut_o[0] = 1'b0;
  assign ReconfModuleOut_o[1] = 1'b0;
  assign ReconfModuleOut_o[2] = 1'b0;
  assign ReconfModuleOut_o[3] = 1'b0;
  assign ReconfModuleOut_o[4] = 1'b0;
  assign ReconfModuleOut_o[5] = 1'b0;
  assign ReconfModuleOut_o[6] = 1'b0;
  assign ReconfModuleOut_o[7] = 1'b0;
  /* just a fixed value for the config interface */
  assign CfgDataIn_s = 1'b0;
  /* Param read address decoder
  Synthesis: Accept undefined behavior if ParamRdAddr_s >= NumParams and
    hope that the synthesis optimizes the MUX
  Simulation: ModelSim complains "Fatal: (vsim-3421) Value x is out of range
    0 to n.", even during param write cycles, because ParamRdAddr has the
    source as ParamWrAddr. Use the parameter "-noindexcheck" during
    compilation ("vcom"). Simulation works fine then, but ModelSim generates
    numerous "INTERNAL ERROR"s to stdout, which seem harmless. */
  assign ParamRdData_s = Params_s[to_integer(unsigned(ParamRdAddr_s))];
  ParamOutReg #(
    .Width(16)
  ) ParamOutReg_I2C_Divider800 (
    .Reset_n_i(Reset_n_i),
    .Clk_i(Clk_i),
    .Param_o(I2C_Divider800_o),
    .Enable_i(ParamI2C_Divider800Enable_s),
    .ParamWrData_i(ParamWrData_s)
  );
  ParamOutReg #(
    .Width(1)
  ) ParamOutReg_I2C_ErrAckParam (
    .Reset_n_i(Reset_n_i),
    .Clk_i(Clk_i),
    .Param_o(I2C_ErrAckParam_s),
    .Enable_i(ParamI2C_ErrAckParamEnable_s),
    .ParamWrData_i(ParamWrData_s[0:0])
  );
  ParamOutReg #(
    .Width(16)
  ) ParamOutReg_PeriodCounterPreset (
    .Reset_n_i(Reset_n_i),
    .Clk_i(Clk_i),
    .Param_o(PeriodCounterPreset_s),
    .Enable_i(ParamPeriodCounterPresetEnable_s),
    .ParamWrData_i(ParamWrData_s)
  );
  ParamOutReg #(
    .Width(16)
  ) ParamOutReg_SPICounterPresetH (
    .Reset_n_i(Reset_n_i),
    .Clk_i(Clk_i),
    .Param_o(SPICounterPresetH_s),
    .Enable_i(ParamSPICounterPresetHEnable_s),
    .ParamWrData_i(ParamWrData_s)
  );
  ParamOutReg #(
    .Width(16)
  ) ParamOutReg_SPICounterPresetL (
    .Reset_n_i(Reset_n_i),
    .Clk_i(Clk_i),
    .Param_o(SPICounterPresetL_s),
    .Enable_i(ParamSPICounterPresetLEnable_s),
    .ParamWrData_i(ParamWrData_s)
  );
  ParamOutReg #(
    .Width(16)
  ) ParamOutReg_Threshold (
    .Reset_n_i(Reset_n_i),
    .Clk_i(Clk_i),
    .Param_o(Threshold_s),
    .Enable_i(ParamThresholdEnable_s),
    .ParamWrData_i(ParamWrData_s)
  );
  assign I2C_ErrAckParam_o = I2C_ErrAckParam_s[0];
  /* Address $00 */
  assign Params_s[0] = { 8'b00000000, I2C_Errors_i };
  /* Address $01 */
  assign Params_s[1] = SensorValue_s;
  /* Address $00 */
  assign ParamI2C_Divider800Enable_s = TODO: implement;
  /* Address $01 */
  assign ParamI2C_ErrAckParamEnable_s = TODO: implement;
  /* Address $02 */
  assign ParamPeriodCounterPresetEnable_s = TODO: implement;
  /* Address $03 */
  assign ParamSPICounterPresetHEnable_s = TODO: implement;
  /* Address $04 */
  assign ParamSPICounterPresetLEnable_s = TODO: implement;
  /* Address $05 */
  assign ParamThresholdEnable_s = TODO: implement;
endmodule