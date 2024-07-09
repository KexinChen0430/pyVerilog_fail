module
    I2C_FSM_TimerPreset = 1'b1;
    I2C_FSM_TimerEnable = 1'b0;
    I2C_FSM_Wr1         = 1'b0;
    I2C_FSM_Wr0         = 1'b0;
    // next state and output logic
    case (I2C_FSM_State)
      stIdle: begin
        if (Start_i == 1'b1)
        begin
          // single-shot measurement mode: write 0x20 to config register at 0x03
          // "10010aa0" "00000011" "00100000"
          I2C_FSM_NextState = stWriteReq1;
          I2C_Data_o        = 8'b10010000;
          I2C_FIFOWrite_o   = 1'b1;
        end
        else
        begin
          // nobody cares about the value, so simplify the MUX
          I2C_Data_o        = 8'b10010000;
        end
      end
      stWriteReq1: begin
        I2C_FSM_NextState   = stWriteReq2;
        I2C_Data_o          = 8'b00000011;
        I2C_FIFOWrite_o     = 1'b1;
      end
      stWriteReq2: begin
        I2C_FSM_NextState   = stStartReq;
        I2C_Data_o          = 8'h20;
        I2C_FIFOWrite_o     = 1'b1;
      end
      stStartReq: begin
        I2C_StartProcess_o  = 1'b1;
        I2C_FSM_NextState   = stWaitReq;
      end
      stWaitReq: begin
        // wait until I2C transmission has finished
        if (I2C_Error_i == 1'b1)
        begin
          I2C_FSM_NextState   = stIdle;
          Error_o             = 1'b1;
        end
        else if (I2C_Busy_i == 1'b0)
        begin
          I2C_FSM_NextState   = stWait;
          I2C_FSM_TimerPreset = 1'b0;
          I2C_FSM_TimerEnable = 1'b1;  // start timer
        end
      end
      stWait: begin
        // wait for 240ms
        if (I2C_FSM_TimerOvfl == 1'b0)
        begin
          I2C_FSM_TimerPreset = 1'b0;
          I2C_FSM_TimerEnable = 1'b1;  // timer running
          // nobody cares about the value, so simplify the MUX
          I2C_Data_o          = 8'b10010000;
        end
        else
        begin
          // timer overflow -> continue: write register address:  "10010aa0" "00000000"
          I2C_FSM_NextState   = stWriteAddr1;
          I2C_Data_o          = 8'b10010000;
          I2C_FIFOWrite_o     = 1'b1;
        end
      end
      stWriteAddr1: begin
        I2C_FSM_NextState   = stStartAddr;
        I2C_Data_o          = 8'b00000000;
        I2C_FIFOWrite_o     = 1'b1;
      end
      stStartAddr: begin
        // start sending register address
        I2C_StartProcess_o  = 1'b1;
        I2C_FSM_NextState   = stWaitAddr;
      end
      stWaitAddr: begin
        // wait until I2C transmission has finished
        if (I2C_Busy_i == 1'b0)
        begin
          I2C_FSM_NextState   = stStartQuery;
          I2C_Data_o          = 8'b10010001;   // read transfer: R/W = 1
          I2C_FIFOWrite_o     = 1'b1;
        end
        else
        begin
          // nobody cares about the value, so simplify the MUX
          I2C_Data_o          = 8'b10010001;   // read transfer: R/W = 1
        end
      end
      stStartQuery: begin
        // start sending read transfer
        I2C_ReceiveSend_n_o = 1'b1;
        I2C_ReadCount_o     = 8'h02;
        I2C_StartProcess_o  = 1'b1;
        I2C_FSM_NextState   = stWaitQuery;
      end
      stWaitQuery: begin
        I2C_ReceiveSend_n_o = 1'b1;
        I2C_ReadCount_o     = 8'h02;
        // wait until I2C transmission has finished
        if (I2C_Busy_i == 1'b0)
        begin
          I2C_FSM_NextState   = stRead1;
          // consume and store first byte
          I2C_FIFOReadNext_o  = 1'b1;
          I2C_FSM_Wr1         = 1'b1;
        end
      end
      stRead1: begin
        // consume and store second byte
        I2C_FIFOReadNext_o  = 1'b1;
        I2C_FSM_Wr0         = 1'b1;
        I2C_FSM_NextState   = stPause;
      end
      stPause: begin
        Done_o              = 1'b1;
        I2C_FSM_NextState   = stIdle;
      end
      default: begin
      end
    endcase
  end
  // Byte-wide Memory /////////////////////////////////////////////////////////
  always @(negedge Reset_n_i or posedge Clk_i)
  begin
    if (!Reset_n_i)
    begin
      Byte0_o <= 8'd0;
      Byte1_o <= 8'd0;
    end
    else
    begin
      if (I2C_FSM_Wr0)
      begin
        Byte0_o <= I2C_Data_i;
      end
      if (I2C_FSM_Wr1)
      begin
        Byte1_o <= I2C_Data_i;
      end
    end
  end
  // Word Arithmetic //////////////////////////////////////////////////////////
  reg [31:0] I2C_FSM_Timer;
  always @(negedge Reset_n_i or posedge Clk_i)
  begin
    if (!Reset_n_i)
    begin
      I2C_FSM_Timer <= 32'd0;
    end
    else
    begin
      if (I2C_FSM_TimerPreset)
      begin
        I2C_FSM_Timer <= {ParamCounterPresetH_i, ParamCounterPresetL_i};
      end
      else if (I2C_FSM_TimerEnable)
      begin
        I2C_FSM_Timer <= I2C_FSM_Timer - 1'b1;
      end
    end
  end
  assign I2C_FSM_TimerOvfl = (I2C_FSM_Timer == 0) ? 1'b1 : 1'b0;
endmodule