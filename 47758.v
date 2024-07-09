module
  // interrupts from ReconfModule --> CPU
  (*keep*) wire [4:0] ReconfModuleIRQs_s;
  (*keep*) wire [7:0] ReconfModuleIn_s;
  (*keep*) wire [7:0] ReconfModuleOut_s;
  // ...
  /* Peripheral Address Space
   */
  // Inputs to the OpenMSP430 CPU
  assign Per_DOut_s = Gpio_DOut_s | TimerA_DOut_s | UART_DOut_s | SPI_DOut_s | CfgIntf_DOut_s | ParamIntf_DOut_s | 16'd0;
  assign IRQ_s  = {ReconfModuleIRQs_s[4],   // Vector 13  (0xFFFA) - unused in MSP430F1232, highest priority -
                   ReconfModuleIRQs_s[3],   // Vector 12  (0xFFF8) - unused in MSP430F1232 -
                   ReconfModuleIRQs_s[2],   // Vector 11  (0xFFF6) - unused in MSP430F1232 -
                   1'b0,                    // Vector 10  (0xFFF4) - Watchdog -
                   TimerA_IRQ1_s,           // Vector  9  (0xFFF2)
                   TimerA_IRQ2_s,           // Vector  8  (0xFFF0)
                   UART_IRQ_Rx_s,           // Vector  7  (0xFFEE) - UART Rx
                   UART_IRQ_Tx_s,           // Vector  6  (0xFFEC) - UART Tx
                   1'b0,                    // Vector  5  (0xFFEA) - ADC -
                   SPI_IRQ_s,               // Vector  4  (0xFFE8) - unused in MSP430F1232 -
                   Gpio_IRQ2_s,             // Vector  3  (0xFFE6)
                   Gpio_IRQ1_s,             // Vector  2  (0xFFE4)
                   ReconfModuleIRQs_s[1],   // Vector  1  (0xFFE2) - unused in MSP430F1232 -
                   ReconfModuleIRQs_s[0]};  // Vector  0  (0xFFE0) - unused in MSP430F1232, lowest priority -
  // GPIO Pads
  assign P1_DOut_o[0] = (P1_Sel_s[0] ? 1'b0             : P1_DOut_s[0]);
  assign P1_DOut_o[1] = (P1_Sel_s[1] ? TimerA_Out0_s    : P1_DOut_s[1]);
  assign P1_DOut_o[2] = (P1_Sel_s[2] ? TimerA_Out1_s    : P1_DOut_s[2]);
  assign P1_DOut_o[3] = (P1_Sel_s[3] ? TimerA_Out2_s    : P1_DOut_s[3]);
  assign P1_DOut_o[4] = (P1_Sel_s[4] ? SMClk_s          : P1_DOut_s[4]);
  assign P1_DOut_o[5] = (P1_Sel_s[5] ? TimerA_Out0_s    : P1_DOut_s[5]);
  assign P1_DOut_o[6] = (P1_Sel_s[6] ? TimerA_Out1_s    : P1_DOut_s[6]);
  assign P1_DOut_o[7] = (P1_Sel_s[7] ? TimerA_Out2_s    : P1_DOut_s[7]);
  assign P1_En_o  [0] = (P1_Sel_s[0] ? 1'b0             : P1_En_s[0]);
  assign P1_En_o  [1] = (P1_Sel_s[1] ? TimerA_Out0_En_s : P1_En_s[1]);
  assign P1_En_o  [2] = (P1_Sel_s[2] ? TimerA_Out1_En_s : P1_En_s[2]);
  assign P1_En_o  [3] = (P1_Sel_s[3] ? TimerA_Out2_En_s : P1_En_s[3]);
  assign P1_En_o  [4] = (P1_Sel_s[4] ? 1'b1             : P1_En_s[4]);
  assign P1_En_o  [5] = (P1_Sel_s[5] ? TimerA_Out0_En_s : P1_En_s[5]);
  assign P1_En_o  [6] = (P1_Sel_s[6] ? TimerA_Out1_En_s : P1_En_s[6]);
  assign P1_En_o  [7] = (P1_Sel_s[7] ? TimerA_Out2_En_s : P1_En_s[7]);
  assign P1_DIn_s       = P1_DIn_i;
  assign TAClk_s        = P1_DIn_i[0];
  assign TimerA_CCI0A_s = P1_DIn_i[1];
  assign TimerA_CCI1A_s = P1_DIn_i[2];
  assign TimerA_CCI2A_s = P1_DIn_i[3];
  // P1.[7:4] not used as inputs for peripherals
  assign P2_DOut_o[0] = (P2_Sel_s[0] ? AClk_En_s        : P2_DOut_s[0]);
  assign P2_DOut_o[1] = (P2_Sel_s[1] ? 1'b0             : P2_DOut_s[1]);
  assign P2_DOut_o[2] = (P2_Sel_s[2] ? TimerA_Out0_s    : P2_DOut_s[2]);
  assign P2_DOut_o[3] = (P2_Sel_s[3] ? TimerA_Out1_s    : P2_DOut_s[3]);
  assign P2_DOut_o[4] = (P2_Sel_s[4] ? TimerA_Out2_s    : P2_DOut_s[4]);
  assign P2_DOut_o[5] =                                   P2_DOut_s[5];
  assign P2_DOut_o[6] =                                   P2_DOut_s[6];
  assign P2_DOut_o[7] =                                   P2_DOut_s[7];
  assign P2_En_o  [0] = (P2_Sel_s[0] ? 1'b1             : P2_En_s[0]);
  assign P2_En_o  [1] = (P2_Sel_s[1] ? 1'b0             : P2_En_s[1]);
  assign P2_En_o  [2] = (P2_Sel_s[2] ? TimerA_Out0_En_s : P2_En_s[2]);
  assign P2_En_o  [3] = (P2_Sel_s[3] ? TimerA_Out1_En_s : P2_En_s[3]);
  assign P2_En_o  [4] = (P2_Sel_s[4] ? TimerA_Out2_En_s : P2_En_s[4]);
  assign P2_En_o  [5] =                                   P2_En_s[5];
  assign P2_En_o  [6] =                                   P2_En_s[6];
  assign P2_En_o  [7] =                                   P2_En_s[7];
  assign P2_DIn_s       = P2_DIn_i;
  assign INClk_s        = P2_DIn_i[1];
  assign TimerA_CCI0B_s = P2_DIn_i[2];
  assign TimerA_CCI1B_s = P2_DIn_i[3];
  assign TimerA_CCI2B_s = TAClk_s;
  // Port 3: connected to the Reconf.Module
  assign P3_DIn_s = ReconfModuleOut_s;
  assign ReconfModuleIn_s = P3_DOut_s;
  /* MSP430x11x2 and 12x2 Timer pin connections:
     P1.0/TACLK/...: Timer_A clock signal TACLK input
     P1.1/TA0:       Timer_A capture CCI0A input, compare Out0 output
     P1.2/TA1:       Timer_A capture CCI1A input, compare Out1 output
     P1.3/TA2:       Timer_A capture CCI2A input, compare Out2 output
     P1.4/...
     P1.5/TA0/...:   Timer_A compare Out0 output
     P1.6/TA1/...:   Timer_A compare Out1 output
     P1.7/TA2/...:   Timer_A compare Out2 output
     P2.0/...
     P2.1/INCLK/...: Timer_A clock signal INCLK input
     P2.2/TA0/...:   Timer_A capture CCI0B input, compare Out0 output
     P2.3/TA1/...:   Timer_A capture CCI1B input, compare Out1 output
     P2.4/TA2/...:   Timer_A compare Out2 output
     P2.5/...
     P2.6, P2.7: not defined
  */
`ifdef SIMULATION
  // Debug utility signals
  // Core testbench debuging signals
  wire    [8*32-1:0] i_state;
  wire    [8*32-1:0] e_state;
  wire        [31:0] inst_cycle;
  wire    [8*32-1:0] inst_full;
  wire        [31:0] inst_number;
  wire        [15:0] inst_pc;
  wire    [8*32-1:0] inst_short;
  msp_debug msp_debug_0 (
  // OUTPUTs
      .e_state      (e_state),           // Execution state
      .i_state      (i_state),           // Instruction fetch state
      .inst_cycle   (inst_cycle),        // Cycle number within current instruction
      .inst_full    (inst_full),         // Currently executed instruction (full version)
      .inst_number  (inst_number),       // Instruction number since last system reset
      .inst_pc      (inst_pc),           // Instruction Program counter
      .inst_short   (inst_short),        // Currently executed instruction (short version)
  // INPUTs
      .mclk         (MClk_s),            // Main system clock
      .puc_rst      (PUC_Reset_s)        // Main system reset
  );
`endif
  // SPI
  parameter SPI_DataWidth      = 8;
  parameter SPI_SPPRWidth      = 4;
  parameter SPI_SPRWidth       = 4;
  parameter SPI_FIFOReadWidth  = 2;
  parameter SPI_FIFOWriteWidth = 2;
  wire SPI_CPOL;
  wire SPI_CPHA;
  wire SPI_LSBFE;
  wire [(SPI_SPPRWidth+SPI_SPRWidth-1):0]  SPI_SPPR_SPR;
  wire SPI_Transmission;
  wire SPI_Write;
  wire SPI_ReadNext;
  wire [(SPI_DataWidth-1):0] SPI_DataIn;
  wire [(SPI_DataWidth-1):0] SPI_DataOut;
  wire SPI_FIFOFull;
  wire SPI_FIFOEmpty;
  wire SPI_ScanEnable;
  wire SPI_ScanClk;
  wire SPI_ScanDataIn;
  wire SPI_ScanDataOut;
  assign SPI_ScanEnable = 1'b0;
  assign SPI_ScanClk    = 1'b0;
  assign SPI_ScanDataIn = 1'b0;
  SPI_Master #(
    .DataWidth     (SPI_DataWidth),
    .SPPRWidth     (SPI_SPPRWidth),
    .SPRWidth      (SPI_SPRWidth),
    .FIFOReadWidth (SPI_FIFOReadWidth),
    .FIFOWriteWidth(SPI_FIFOWriteWidth)
  ) spi_master_1 (
    .Reset_n       (Reset_n_s),
    .Clk           (Clk_i),
    .CPOL_i        (SPI_CPOL),
    .CPHA_i        (SPI_CPHA),
    .LSBFE_i       (SPI_LSBFE),
    .SPPR_i        (SPI_SPPR_SPR[7:4]),
    .SPR_i         (SPI_SPPR_SPR[3:0]),
    .SCK_o         (SPISCK_o),
    .MOSI_o        (SPIMOSI_o),
    .MISO_i        (SPIMISO_i),
    .Transmission_o(SPI_Transmission),
    .Write_i       (SPI_Write),
    .ReadNext_i    (SPI_ReadNext),
    .Data_i        (SPI_DataIn),
    .Data_o        (SPI_DataOut),
    .FIFOFull_o    (SPI_FIFOFull),
    .FIFOEmpty_o   (SPI_FIFOEmpty),
    .ScanEnable_i  (SPI_ScanEnable),
    .ScanClk_i     (SPI_ScanClk),
    .ScanDataIn_i  (SPI_ScanDataIn),
    .ScanDataOut_o (SPI_ScanDataOut)
  );
  // I2C
  parameter I2C_ReadCountWidth   =  4;
  parameter I2C_FIFOAddressWidth =  2;
  parameter I2C_DividerWidth     = 16;
  wire I2C_F100_400_n;
  wire [(I2C_DividerWidth-1):0] I2C_Divider800;
  wire I2C_StartProcess;
  wire I2C_ReceiveSend_n;
  wire I2C_Busy;
  wire [(I2C_ReadCountWidth-1):0] I2C_ReadCount;
  wire I2C_FIFOReadNext;
  wire I2C_FIFOWrite;
  wire I2C_FIFOEmpty;
  wire I2C_FIFOFull;
  wire [7:0] I2C_DataIn;
  wire [7:0] I2C_DataOut;
  reg  I2C_ErrAck;
  wire I2C_ErrBusColl;
  wire I2C_ErrFIFOFull;
  wire I2C_ErrGotNAck;
  wire I2C_ErrCoreBusy;
  wire I2C_ErrFIFOEmpty;
  wire I2C_ErrCoreStopped;
  wire I2C_ErrDevNotPresent;
  wire I2C_ErrReadCountZero;
  (* keep *) wire [7:0] I2C_Errors;   // use this as readable parameter
  assign I2C_Errors = {I2C_ErrReadCountZero, I2C_ErrDevNotPresent, I2C_ErrCoreStopped, I2C_ErrFIFOEmpty, I2C_ErrCoreBusy, I2C_ErrGotNAck, I2C_ErrFIFOFull, I2C_ErrBusColl};
  (* keep *) wire I2C_Error;
  assign I2C_Error = |I2C_Errors;
  wire I2C_ScanEnable;
  wire I2C_ScanClk;
  wire I2C_ScanDataIn;
  wire I2C_ScanDataOut;
  assign I2C_ScanEnable = 1'b0;
  assign I2C_ScanClk    = 1'b0;
  assign I2C_ScanDataIn = 1'b0;
  i2c_master #(
    .ReadCountWidth_g  (I2C_ReadCountWidth),
    .FIFOAddressWidth_g(I2C_FIFOAddressWidth),
    .DividerWidth_g    (I2C_DividerWidth)
  ) i2c_master_1 (
    .Reset_i           (Reset_s),
    .Clk_i             (Clk_i),
    .F100_400_n_i      (I2C_F100_400_n),
    .Divider800_i      (I2C_Divider800),
    .StartProcess_i    (I2C_StartProcess),
    .ReceiveSend_n_i   (I2C_ReceiveSend_n),
    .Busy_o            (I2C_Busy),
    .ReadCount_i       (I2C_ReadCount),
    .FIFOReadNext_i    (I2C_FIFOReadNext),
    .FIFOWrite_i       (I2C_FIFOWrite),
    .FIFOEmpty_o       (I2C_FIFOEmpty),
    .FIFOFull_o        (I2C_FIFOFull),
    .Data_i            (I2C_DataIn),
    .Data_o            (I2C_DataOut),
    .ErrAck_i          (I2C_ErrAck),
    .ErrBusColl_o      (I2C_ErrBusColl),
    .ErrFIFOFull_o     (I2C_ErrFIFOFull),
    .ErrGotNAck_o      (I2C_ErrGotNAck),
    .ErrCoreBusy_o     (I2C_ErrCoreBusy),
    .ErrFIFOEmpty_o    (I2C_ErrFIFOEmpty),
    .ErrCoreStopped_o  (I2C_ErrCoreStopped),
    .ErrDevNotPresent_o(I2C_ErrDevNotPresent),
    .ErrReadCountZero_o(I2C_ErrReadCountZero),
    .SDA_i             (I2CSDA_i),
    .SDA_o             (I2CSDA_o),
    .SCL_o             (I2CSCL_o),
    .ScanEnable_i      (I2C_ScanEnable),
    .ScanClk_i         (I2C_ScanClk),
    .ScanDataIn_i      (I2C_ScanDataIn),
    .ScanDataOut_o     (I2C_ScanDataOut)
  );
  wire I2C_ErrAckParam;
  reg  I2C_ErrAckParamOld;
  always @(negedge Reset_n_s or posedge Clk_i)
  begin
    if (!Reset_n_s)
    begin
      I2C_ErrAck <= 1'b0;
      I2C_ErrAckParamOld <= 1'b0;
    end
    else
    begin
      // edge detection
      if (I2C_ErrAckParam == 1'b1 && I2C_ErrAckParamOld == 1'b0)
      begin
        I2C_ErrAck <= 1'b1;
      end
      else
      begin
        I2C_ErrAck <= 1'b0;
      end
      I2C_ErrAckParamOld <= I2C_ErrAckParam;
    end
  end
`ifdef INCLUDE_ONEWIRE
  // 1-Wire
  parameter OneWire_ROMIDArraySize         = 8;
  parameter OneWire_ROMIDIndexSize         = 3;
  parameter OneWire_ROMIDByteIndexSize     = 3;
  parameter OneWire_SearchCommand          = 8'hF0;
  parameter OneWire_CondSearchCommand      = 8'hEC;
  parameter OneWire_MatchCommand           = 8'h55;
  parameter OneWire_ReadCommand            = 8'h33;
  parameter OneWire_SkipCommand            = 8'hCC;
  parameter OneWire_OverdriveSkipCommand   = 8'h3C;
  parameter OneWire_OverdriveMatchCommand  = 8'h69;
  parameter OneWire_ConditionalReadCommand = 8'h0F;
  parameter OneWire_ResumeCommand          = 8'hA5;
  parameter OneWire_TimerWidth             = 16;
  wire OneWire_OWReset;
  wire OneWire_DeactivateOverdriveMode;
  wire OneWire_SearchROM;
  wire OneWire_ReadROM;
  wire OneWire_MatchROM;
  wire OneWire_SkipROM;
  wire OneWire_CondSearchROM;
  wire OneWire_OverdriveSkipROM;
  wire OneWire_OverdriveMatchROM;
  wire OneWire_CondReadROM;
  wire OneWire_ResumeROM;
  wire OneWire_WriteByte;
  wire OneWire_ReadByte;
  wire OneWire_GetROMID;
  wire [7:0] OneWire_DataIn;
  wire [7:0] OneWire_DataOut;
  wire [(OneWire_ROMIDIndexSize-1):0] OneWire_ROMIDsInArray;
  wire OneWire_Noslaves;
  wire OneWire_ROMIDArrayToSmall;
  wire OneWire_PDROut;
  wire OneWire_Ready;
  wire [(OneWire_TimerWidth-1):0] OneWire_ResetLowTime;
  wire [(OneWire_TimerWidth-1):0] OneWire_ResetTime;
  wire [(OneWire_TimerWidth-1):0] OneWire_ResetWaitForDetectionDuration;
  wire [(OneWire_TimerWidth-1):0] OneWire_ResetPrecenceIntervalDuration;
  wire [(OneWire_TimerWidth-1):0] OneWire_WRSlotHighDataTime;
  wire [(OneWire_TimerWidth-1):0] OneWire_RDSlotSampleTime;
  wire [(OneWire_TimerWidth-1):0] OneWire_SlotLowDataTime;
  wire [(OneWire_TimerWidth-1):0] OneWire_SlotDuration;
  wire [(OneWire_TimerWidth-1):0] OneWire_RDSlotInitTime;
  wire [(OneWire_TimerWidth-1):0] OneWire_ODResetLowTime;
  wire [(OneWire_TimerWidth-1):0] OneWire_ODResetTime;
  wire [(OneWire_TimerWidth-1):0] OneWire_ODResetWaitForDetectionDuration;
  wire [(OneWire_TimerWidth-1):0] OneWire_ODResetPrecenceIntervalDuration;
  wire [(OneWire_TimerWidth-1):0] OneWire_ODWRSlotHighDataTime;
  wire [(OneWire_TimerWidth-1):0] OneWire_ODRDSlotSampleTime;
  wire [(OneWire_TimerWidth-1):0] OneWire_ODSlotLowDataTime;
  wire [(OneWire_TimerWidth-1):0] OneWire_ODSlotDuration;
  wire [(OneWire_TimerWidth-1):0] OneWire_ODRDSlotInitTime;
  wire OneWire_ScanEnable;
  wire OneWire_ScanClk;
  wire OneWire_ScanDataIn;
  wire OneWire_ScanDataOut;
  assign OneWire_ScanEnable = 1'b0;
  assign OneWire_ScanClk    = 1'b0;
  assign OneWire_ScanDataIn = 1'b0;
  onewire_master #(
    .ROMIDArraySize        (OneWire_ROMIDArraySize),
    .ROMIDIndexSize        (OneWire_ROMIDIndexSize),
    .ROMIDByteIndexSize    (OneWire_ROMIDByteIndexSize),
    .SearchCommand         (OneWire_SearchCommand),
    .CondSearchCommand     (OneWire_CondSearchCommand),
    .MatchCommand          (OneWire_MatchCommand),
    .ReadCommand           (OneWire_ReadCommand),
    .SkipCommand           (OneWire_SkipCommand),
    .OverdriveSkipCommand  (OneWire_OverdriveSkipCommand),
    .OverdriveMatchCommand (OneWire_OverdriveMatchCommand),
    .ConditionalReadCommand(OneWire_ConditionalReadCommand),
    .ResumeCommand         (OneWire_ResumeCommand),
    .TimerWidth            (OneWire_TimerWidth)
  ) onewire_master_1 (
    .Clk                            (Clk_i),
    .Reset                          (Reset_s),
    .OWIn_i                         (OneWire_i),
    .OWOut_o                        (OneWire_o),
    .OWReset_i                      (OneWire_OWReset),
    .DeactivateOverdriveMode_i      (OneWire_DeactivateOverdriveMode),
    .SearchROM_i                    (OneWire_SearchROM),
    .ReadROM_i                      (OneWire_ReadROM),
    .MatchROM_i                     (OneWire_MatchROM),
    .SkipROM_i                      (OneWire_SkipROM),
    .CondSearchROM_i                (OneWire_CondSearchROM),
    .OverdriveSkipROM_i             (OneWire_OverdriveSkipROM),
    .OverdriveMatchROM_i            (OneWire_OverdriveMatchROM),
    .CondReadROM_i                  (OneWire_CondReadROM),
    .ResumeROM_i                    (OneWire_ResumeROM),
    .WriteByte_i                    (OneWire_WriteByte),
    .ReadByte_i                     (OneWire_ReadByte),
    .GetROMID_i                     (OneWire_GetROMID),
    .Data_i                         (OneWire_DataIn),
    .Data_o                         (OneWire_DataOut),
    .ROMIDsInArray_o                (OneWire_ROMIDsInArray),
    .Noslaves_o                     (OneWire_Noslaves),
    .ROMIDArrayToSmall_o            (OneWire_ROMIDArrayToSmall),
    .PDROut_o                       (OneWire_PDROut),
    .Ready_o                        (OneWire_Ready),
    .ResetLowTime                   (OneWire_ResetLowTime),
    .ResetTime                      (OneWire_ResetTime),
    .ResetWaitForDetectionDuration  (OneWire_ResetWaitForDetectionDuration),
    .ResetPrecenceIntervalDuration  (OneWire_ResetPrecenceIntervalDuration),
    .WRSlotHighDataTime             (OneWire_WRSlotHighDataTime),
    .RDSlotSampleTime               (OneWire_RDSlotSampleTime),
    .SlotLowDataTime                (OneWire_SlotLowDataTime),
    .SlotDuration                   (OneWire_SlotDuration),
    .RDSlotInitTime                 (OneWire_RDSlotInitTime),
    .ODResetLowTime                 (OneWire_ODResetLowTime),
    .ODResetTime                    (OneWire_ODResetTime),
    .ODResetWaitForDetectionDuration(OneWire_ODResetWaitForDetectionDuration),
    .ODResetPrecenceIntervalDuration(OneWire_ODResetPrecenceIntervalDuration),
    .ODWRSlotHighDataTime           (OneWire_ODWRSlotHighDataTime),
    .ODRDSlotSampleTime             (OneWire_ODRDSlotSampleTime),
    .ODSlotLowDataTime              (OneWire_ODSlotLowDataTime),
    .ODSlotDuration                 (OneWire_ODSlotDuration),
    .ODRDSlotInitTime               (OneWire_ODRDSlotInitTime),
    .ScanEnable_i                   (OneWire_ScanEnable),
    .ScanClk_i                      (OneWire_ScanClk),
    .ScanDataIn_i                   (OneWire_ScanDataIn),
    .ScanDataOut_o                  (OneWire_ScanDataOut)
  );
`endif   // INCLUDE_ONEWIRE
`ifdef INCLUDE_PWM
  // PWM
  parameter PWM_Resolution   = 12;
  parameter PWM_CounterWidth = 20;
  wire PWM_Polarity;
  wire [(PWM_Resolution-1):0] PWM_Value;
  wire PWM_NewValue;
  wire PWM_ScanEnable;
  wire PWM_ScanClk;
  wire PWM_ScanDataIn;
  wire PWM_ScanDataOut;
  assign PWM_ScanEnable = 1'b0;
  assign PWM_ScanClk    = 1'b0;
  assign PWM_ScanDataIn = 1'b0;
  pwm_master #(
    .Resolution_g  (PWM_Resolution),
    .CounterWidth_g(PWM_CounterWidth)
  ) pwm_master_1 (
    .Clk           (Clk_i),
    .Reset         (Reset_s),
    .Polarity_i    (PWM_Polarity),
    .Input_i       (PWMInput_i),
    .Value_o       (PWM_Value),
    .NewValue_o    (PWM_NewValue),
    .ScanEnable_i  (PWM_ScanEnable),
    .ScanClk_i     (PWM_ScanClk),
    .ScanDataIn_i  (PWM_ScanDataIn),
    .ScanDataOut_o (PWM_ScanDataOut)
  );
`endif   // INCLUDE_PWM
`ifdef INCLUDE_SENT
  // SENT
  parameter SENT_MaxDatNibble =  6;
  parameter SENT_CountWidth   = 16;
  wire SENT_Chipselect;
  wire [2:0] SENT_NumDatNibble;  // width is RoundUp(Ld(MaxDatNibble_g))
  wire [(SENT_CountWidth-1):0] SENT_MinSync;
  wire [(SENT_MaxDatNibble*4+3):0] SENT_OutWide;
  wire SENT_NewData;
  wire SENT_CrcOk;
  wire SENT_ScanEnable;
  wire SENT_ScanClk;
  wire SENT_ScanDataIn;
  wire SENT_ScanDataOut;
  assign SENT_ScanEnable = 1'b0;
  assign SENT_ScanClk    = 1'b0;
  assign SENT_ScanDataIn = 1'b0;
  sent_master #(
    .MaxDatNibble_g (SENT_MaxDatNibble),
    .CountWidth_g   (SENT_CountWidth)
  ) sent_master_1 (
    .Clk            (Clk_i),
    .Reset          (Reset_s),
    .Chipselect_i   (SENT_Chipselect),
    .NumDatNibble_i (SENT_NumDatNibble),
    .Input_i        (SENTInput_i),
    .MinSync_i      (SENT_MinSync),
    .Out_o          (SENT_OutWide),
    .NewData_o      (SENT_NewData),
    .CrcOk_o        (SENT_CrcOk),
    .ScanEnable_i   (SENT_ScanEnable),
    .ScanClk_i      (SENT_ScanClk),
    .ScanDataIn_i   (SENT_ScanDataIn),
    .ScanDataOut_o  (SENT_ScanDataOut)
  );
  (* keep *) wire [1:0] SENT_OutMUX;
  (* keep *) wire [7:0] SENT_OutByte;
  assign SENT_OutByte = ((SENT_OutMUX == 2'b00) ? (*keep*) SENT_OutWide[ 7: 0] :
                        ((SENT_OutMUX == 2'b01) ?          SENT_OutWide[15: 8] :
                        ((SENT_OutMUX == 2'b10) ?          SENT_OutWide[23:16] :
                                        {4'b0000,          SENT_OutWide[27:24]})));
  // The array-index form below doesn't work with Yosys, because its opt_clean
  // pass removes the $shr cell, because its output is unused.
  // (* keep *) assign SENT_Out = SENT_OutWide[((SENT_OutMUX << 3)+7) : (SENT_OutMUX << 3)];
`endif   // INCLUDE_SENT
`ifdef INCLUDE_SPC
  // SPC
  parameter SPC_MaxDatNibble =  6;
  parameter SPC_CountWidth   = 16;
  parameter SPC_TimeoutWidth = 16;
  parameter SPC_UseTimeout   =  1;
  wire SPC_Start;
  wire [2:0] SPC_NumDatNibble;  // width is RoundUp(Ld(MaxDatNibble_g))
  wire [(SPC_CountWidth-1):0]   SPC_LengthTrigger;
  wire [(SPC_TimeoutWidth-1):0] SPC_LengthTimeout;
  wire [(SPC_CountWidth-1):0]     SPC_MinSync;
  wire [(SPC_MaxDatNibble*4+3):0] SPC_OutWide;
  wire SPC_NewData;
  wire SPC_CrcOk;
  wire SPC_SPCReady;
  wire SPC_ScanEnable;
  wire SPC_ScanClk;
  wire SPC_ScanDataIn;
  wire SPC_ScanDataOut;
  assign SPC_ScanEnable = 1'b0;
  assign SPC_ScanClk    = 1'b0;
  assign SPC_ScanDataIn = 1'b0;
  spc_master #(
    .MaxDatNibble_g (SPC_MaxDatNibble),
    .CountWidth_g   (SPC_CountWidth),
    .TimeoutWidth_g (SPC_TimeoutWidth),
    .UseTimeout_g   (SPC_UseTimeout)
  ) spc_master_1 (
    .Clk            (Clk_i),
    .Reset          (Reset_s),
    .Input_i        (SPCInput_i),
    .Start_i        (SPC_Start),
    .NumDatNibble_i (SPC_NumDatNibble),
    .LengthTrigger_i(SPC_LengthTrigger),
    .LengthTimeout_i(SPC_LengthTimeout),
    .MinSync_i      (SPC_MinSync),
    .Out_o          (SPCTrigger_o),
    .DataOut_o      (SPC_OutWide),
    .NewData_o      (SPC_NewData),
    .CrcOk_o        (SPC_CrcOk),
    .SPCReady_o     (SPC_SPCReady),
    .ScanEnable_i   (SPC_ScanEnable),
    .ScanClk_i      (SPC_ScanClk),
    .ScanDataIn_i   (SPC_ScanDataIn),
    .ScanDataOut_o  (SPC_ScanDataOut)
  );
  (* keep *) wire [1:0] SPC_OutMUX;
  (* keep *) wire [7:0] SPC_OutByte;
  assign SPC_OutByte = ((SPC_OutMUX == 2'b00) ? (*keep*) SPC_OutWide[ 7: 0] :
                       ((SPC_OutMUX == 2'b01) ?          SPC_OutWide[15: 8] :
                       ((SPC_OutMUX == 2'b10) ?          SPC_OutWide[23:16] :
                                      {4'b0000,          SPC_OutWide[27:24]})));
`endif   // INCLUDE_SPC
  // Reconfigurable Module
  `ifdef ReconfModuleConstDrivers
    `include "const-drivers.inc.v";   // just drive constant values to undriven signals
  `else
    `ifndef ReconfModuleNone
      `include "reconflogic-instance.inc.v"         // auto-generated, use later
    `endif
  `endif
endmodule