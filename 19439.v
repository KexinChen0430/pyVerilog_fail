module UartCtrlRx (
      input  [2:0] io_configFrame_dataLength,
      input  `UartStopType_binary_sequancial_type io_configFrame_stop,
      input  `UartParityType_binary_sequancial_type io_configFrame_parity,
      input   io_samplingTick,
      output  io_read_valid,
      output [7:0] io_read_payload,
      input   io_rxd,
      input   io_mainClk,
      input   resetCtrl_systemReset);
  wire  _zz_2;
  wire  _zz_3;
  wire  _zz_4;
  wire  _zz_5;
  wire  _zz_6;
  wire [0:0] _zz_7;
  wire [2:0] _zz_8;
  wire  sampler_syncroniser;
  wire  _zz_1;
  wire  sampler_samples_0;
  reg  sampler_samples_1;
  reg  sampler_samples_2;
  reg  sampler_value;
  reg  sampler_tick;
  reg [2:0] bitTimer_counter;
  reg  bitTimer_tick;
  reg [2:0] bitCounter_value;
  reg `UartCtrlRxState_binary_sequancial_type stateMachine_state;
  reg  stateMachine_parity;
  reg [7:0] stateMachine_shifter;
  reg  stateMachine_validReg;
  assign _zz_4 = (sampler_tick && (! sampler_value));
  assign _zz_5 = (bitCounter_value == io_configFrame_dataLength);
  assign _zz_6 = (bitTimer_counter == (3'b000));
  assign _zz_7 = ((io_configFrame_stop == `UartStopType_binary_sequancial_ONE) ? (1'b0) : (1'b1));
  assign _zz_8 = {2'd0, _zz_7};
  BufferCC bufferCC_3 (
    .io_initial(_zz_2),
    .io_dataIn(io_rxd),
    .io_dataOut(_zz_3),
    .io_mainClk(io_mainClk),
    .resetCtrl_systemReset(resetCtrl_systemReset)
  );
  assign _zz_2 = 1'b0;
  assign sampler_syncroniser = _zz_3;
  assign _zz_1 = 1'b1;
  assign sampler_samples_0 = sampler_syncroniser;
  always @ (*) begin
    bitTimer_tick = 1'b0;
    if(sampler_tick)begin
      if(_zz_6)begin
        bitTimer_tick = 1'b1;
      end
    end
  end
  assign io_read_valid = stateMachine_validReg;
  assign io_read_payload = stateMachine_shifter;
  always @ (posedge io_mainClk or posedge resetCtrl_systemReset) begin
    if (resetCtrl_systemReset) begin
      sampler_samples_1 <= _zz_1;
      sampler_samples_2 <= _zz_1;
      sampler_value <= 1'b1;
      sampler_tick <= 1'b0;
      stateMachine_state <= `UartCtrlRxState_binary_sequancial_IDLE;
      stateMachine_validReg <= 1'b0;
    end else begin
      if(io_samplingTick)begin
        sampler_samples_1 <= sampler_samples_0;
      end
      if(io_samplingTick)begin
        sampler_samples_2 <= sampler_samples_1;
      end
      sampler_value <= (((1'b0 || ((1'b1 && sampler_samples_0) && sampler_samples_1)) || ((1'b1 && sampler_samples_0) && sampler_samples_2)) || ((1'b1 && sampler_samples_1) && sampler_samples_2));
      sampler_tick <= io_samplingTick;
      stateMachine_validReg <= 1'b0;
      case(stateMachine_state)
        `UartCtrlRxState_binary_sequancial_IDLE : begin
          if(_zz_4)begin
            stateMachine_state <= `UartCtrlRxState_binary_sequancial_START;
          end
        end
        `UartCtrlRxState_binary_sequancial_START : begin
          if(bitTimer_tick)begin
            stateMachine_state <= `UartCtrlRxState_binary_sequancial_DATA;
            if((sampler_value == 1'b1))begin
              stateMachine_state <= `UartCtrlRxState_binary_sequancial_IDLE;
            end
          end
        end
        `UartCtrlRxState_binary_sequancial_DATA : begin
          if(bitTimer_tick)begin
            if(_zz_5)begin
              if((io_configFrame_parity == `UartParityType_binary_sequancial_NONE))begin
                stateMachine_state <= `UartCtrlRxState_binary_sequancial_STOP;
                stateMachine_validReg <= 1'b1;
              end else begin
                stateMachine_state <= `UartCtrlRxState_binary_sequancial_PARITY;
              end
            end
          end
        end
        `UartCtrlRxState_binary_sequancial_PARITY : begin
          if(bitTimer_tick)begin
            if((stateMachine_parity == sampler_value))begin
              stateMachine_state <= `UartCtrlRxState_binary_sequancial_STOP;
              stateMachine_validReg <= 1'b1;
            end else begin
              stateMachine_state <= `UartCtrlRxState_binary_sequancial_IDLE;
            end
          end
        end
        default : begin
          if(bitTimer_tick)begin
            if((! sampler_value))begin
              stateMachine_state <= `UartCtrlRxState_binary_sequancial_IDLE;
            end else begin
              if((bitCounter_value == _zz_8))begin
                stateMachine_state <= `UartCtrlRxState_binary_sequancial_IDLE;
              end
            end
          end
        end
      endcase
    end
  end
  always @ (posedge io_mainClk) begin
    if(sampler_tick)begin
      bitTimer_counter <= (bitTimer_counter - (3'b001));
      if(_zz_6)begin
        bitTimer_counter <= (3'b100);
      end
    end
    if(bitTimer_tick)begin
      bitCounter_value <= (bitCounter_value + (3'b001));
    end
    if(bitTimer_tick)begin
      stateMachine_parity <= (stateMachine_parity ^ sampler_value);
    end
    case(stateMachine_state)
      `UartCtrlRxState_binary_sequancial_IDLE : begin
        if(_zz_4)begin
          bitTimer_counter <= (3'b001);
        end
      end
      `UartCtrlRxState_binary_sequancial_START : begin
        if(bitTimer_tick)begin
          bitCounter_value <= (3'b000);
          stateMachine_parity <= (io_configFrame_parity == `UartParityType_binary_sequancial_ODD);
        end
      end
      `UartCtrlRxState_binary_sequancial_DATA : begin
        if(bitTimer_tick)begin
          stateMachine_shifter[bitCounter_value] <= sampler_value;
          if(_zz_5)begin
            bitCounter_value <= (3'b000);
          end
        end
      end
      `UartCtrlRxState_binary_sequancial_PARITY : begin
        if(bitTimer_tick)begin
          bitCounter_value <= (3'b000);
        end
      end
      default : begin
      end
    endcase
  end
endmodule