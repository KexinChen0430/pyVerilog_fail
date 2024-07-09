module JtagBridge (
      input   io_jtag_tms,
      input   io_jtag_tdi,
      output reg  io_jtag_tdo,
      input   io_jtag_tck,
      output  io_remote_cmd_valid,
      input   io_remote_cmd_ready,
      output  io_remote_cmd_payload_last,
      output [0:0] io_remote_cmd_payload_fragment,
      input   io_remote_rsp_valid,
      output  io_remote_rsp_ready,
      input   io_remote_rsp_payload_error,
      input  [31:0] io_remote_rsp_payload_data,
      input   io_mainClk,
      input   resetCtrl_mainClkReset);
  wire  _zz_2;
  wire  _zz_3;
  wire  _zz_4;
  wire  _zz_5;
  wire [0:0] _zz_6;
  wire  _zz_7;
  wire  _zz_8;
  wire [3:0] _zz_9;
  wire [3:0] _zz_10;
  wire [3:0] _zz_11;
  wire  system_cmd_valid;
  wire  system_cmd_payload_last;
  wire [0:0] system_cmd_payload_fragment;
  reg  system_rsp_valid;
  reg  system_rsp_payload_error;
  reg [31:0] system_rsp_payload_data;
  wire `JtagState_binary_sequancial_type jtag_tap_fsm_stateNext;
  reg `JtagState_binary_sequancial_type jtag_tap_fsm_state = `JtagState_binary_sequancial_IR_UPDATE;
  reg `JtagState_binary_sequancial_type _zz_1;
  reg [3:0] jtag_tap_instruction;
  reg [3:0] jtag_tap_instructionShift;
  reg  jtag_tap_bypass;
  wire [0:0] jtag_idcodeArea_instructionId;
  wire  jtag_idcodeArea_instructionHit;
  reg [31:0] jtag_idcodeArea_shifter;
  wire [1:0] jtag_writeArea_instructionId;
  wire  jtag_writeArea_instructionHit;
  reg  jtag_writeArea_source_valid;
  wire  jtag_writeArea_source_payload_last;
  wire [0:0] jtag_writeArea_source_payload_fragment;
  wire [1:0] jtag_readArea_instructionId;
  wire  jtag_readArea_instructionHit;
  reg [33:0] jtag_readArea_shifter;
  assign io_remote_cmd_valid = _zz_2;
  assign io_remote_rsp_ready = _zz_3;
  assign _zz_7 = (jtag_tap_fsm_state == `JtagState_binary_sequancial_DR_SHIFT);
  assign _zz_8 = (jtag_tap_fsm_state == `JtagState_binary_sequancial_DR_SHIFT);
  assign _zz_9 = {3'd0, jtag_idcodeArea_instructionId};
  assign _zz_10 = {2'd0, jtag_writeArea_instructionId};
  assign _zz_11 = {2'd0, jtag_readArea_instructionId};
  FlowCCByToggle flowCCByToggle_1 (
    .io_input_valid(jtag_writeArea_source_valid),
    .io_input_payload_last(jtag_writeArea_source_payload_last),
    .io_input_payload_fragment(jtag_writeArea_source_payload_fragment),
    .io_output_valid(_zz_4),
    .io_output_payload_last(_zz_5),
    .io_output_payload_fragment(_zz_6),
    .io_jtag_tck(io_jtag_tck),
    .io_mainClk(io_mainClk),
    .resetCtrl_mainClkReset(resetCtrl_mainClkReset)
  );
  assign _zz_2 = system_cmd_valid;
  assign io_remote_cmd_payload_last = system_cmd_payload_last;
  assign io_remote_cmd_payload_fragment = system_cmd_payload_fragment;
  assign _zz_3 = 1'b1;
  always @ (*) begin
    case(jtag_tap_fsm_state)
      `JtagState_binary_sequancial_IDLE : begin
        _zz_1 = (io_jtag_tms ? `JtagState_binary_sequancial_DR_SELECT : `JtagState_binary_sequancial_IDLE);
      end
      `JtagState_binary_sequancial_IR_SELECT : begin
        _zz_1 = (io_jtag_tms ? `JtagState_binary_sequancial_RESET : `JtagState_binary_sequancial_IR_CAPTURE);
      end
      `JtagState_binary_sequancial_IR_CAPTURE : begin
        _zz_1 = (io_jtag_tms ? `JtagState_binary_sequancial_IR_EXIT1 : `JtagState_binary_sequancial_IR_SHIFT);
      end
      `JtagState_binary_sequancial_IR_SHIFT : begin
        _zz_1 = (io_jtag_tms ? `JtagState_binary_sequancial_IR_EXIT1 : `JtagState_binary_sequancial_IR_SHIFT);
      end
      `JtagState_binary_sequancial_IR_EXIT1 : begin
        _zz_1 = (io_jtag_tms ? `JtagState_binary_sequancial_IR_UPDATE : `JtagState_binary_sequancial_IR_PAUSE);
      end
      `JtagState_binary_sequancial_IR_PAUSE : begin
        _zz_1 = (io_jtag_tms ? `JtagState_binary_sequancial_IR_EXIT2 : `JtagState_binary_sequancial_IR_PAUSE);
      end
      `JtagState_binary_sequancial_IR_EXIT2 : begin
        _zz_1 = (io_jtag_tms ? `JtagState_binary_sequancial_IR_UPDATE : `JtagState_binary_sequancial_IR_SHIFT);
      end
      `JtagState_binary_sequancial_IR_UPDATE : begin
        _zz_1 = (io_jtag_tms ? `JtagState_binary_sequancial_DR_SELECT : `JtagState_binary_sequancial_IDLE);
      end
      `JtagState_binary_sequancial_DR_SELECT : begin
        _zz_1 = (io_jtag_tms ? `JtagState_binary_sequancial_IR_SELECT : `JtagState_binary_sequancial_DR_CAPTURE);
      end
      `JtagState_binary_sequancial_DR_CAPTURE : begin
        _zz_1 = (io_jtag_tms ? `JtagState_binary_sequancial_DR_EXIT1 : `JtagState_binary_sequancial_DR_SHIFT);
      end
      `JtagState_binary_sequancial_DR_SHIFT : begin
        _zz_1 = (io_jtag_tms ? `JtagState_binary_sequancial_DR_EXIT1 : `JtagState_binary_sequancial_DR_SHIFT);
      end
      `JtagState_binary_sequancial_DR_EXIT1 : begin
        _zz_1 = (io_jtag_tms ? `JtagState_binary_sequancial_DR_UPDATE : `JtagState_binary_sequancial_DR_PAUSE);
      end
      `JtagState_binary_sequancial_DR_PAUSE : begin
        _zz_1 = (io_jtag_tms ? `JtagState_binary_sequancial_DR_EXIT2 : `JtagState_binary_sequancial_DR_PAUSE);
      end
      `JtagState_binary_sequancial_DR_EXIT2 : begin
        _zz_1 = (io_jtag_tms ? `JtagState_binary_sequancial_DR_UPDATE : `JtagState_binary_sequancial_DR_SHIFT);
      end
      `JtagState_binary_sequancial_DR_UPDATE : begin
        _zz_1 = (io_jtag_tms ? `JtagState_binary_sequancial_DR_SELECT : `JtagState_binary_sequancial_IDLE);
      end
      default : begin
        _zz_1 = (io_jtag_tms ? `JtagState_binary_sequancial_RESET : `JtagState_binary_sequancial_IDLE);
      end
    endcase
  end
  assign jtag_tap_fsm_stateNext = _zz_1;
  always @ (*) begin
    io_jtag_tdo = jtag_tap_bypass;
    case(jtag_tap_fsm_state)
      `JtagState_binary_sequancial_IR_CAPTURE : begin
      end
      `JtagState_binary_sequancial_IR_SHIFT : begin
        io_jtag_tdo = jtag_tap_instructionShift[0];
      end
      `JtagState_binary_sequancial_IR_UPDATE : begin
      end
      `JtagState_binary_sequancial_DR_SHIFT : begin
      end
      default : begin
      end
    endcase
    if(jtag_idcodeArea_instructionHit)begin
      if(_zz_8)begin
        io_jtag_tdo = jtag_idcodeArea_shifter[0];
      end
    end
    if(jtag_readArea_instructionHit)begin
      if(_zz_7)begin
        io_jtag_tdo = jtag_readArea_shifter[0];
      end
    end
  end
  assign jtag_idcodeArea_instructionId = (1'b1);
  assign jtag_idcodeArea_instructionHit = (jtag_tap_instruction == _zz_9);
  assign jtag_writeArea_instructionId = (2'b10);
  assign jtag_writeArea_instructionHit = (jtag_tap_instruction == _zz_10);
  always @ (*) begin
    jtag_writeArea_source_valid = 1'b0;
    if(jtag_writeArea_instructionHit)begin
      if((jtag_tap_fsm_state == `JtagState_binary_sequancial_DR_SHIFT))begin
        jtag_writeArea_source_valid = 1'b1;
      end
    end
  end
  assign jtag_writeArea_source_payload_last = io_jtag_tms;
  assign jtag_writeArea_source_payload_fragment[0] = io_jtag_tdi;
  assign system_cmd_valid = _zz_4;
  assign system_cmd_payload_last = _zz_5;
  assign system_cmd_payload_fragment = _zz_6;
  assign jtag_readArea_instructionId = (2'b11);
  assign jtag_readArea_instructionHit = (jtag_tap_instruction == _zz_11);
  always @ (posedge io_mainClk) begin
    if(_zz_2)begin
      system_rsp_valid <= 1'b0;
    end
    if((io_remote_rsp_valid && _zz_3))begin
      system_rsp_valid <= 1'b1;
      system_rsp_payload_error <= io_remote_rsp_payload_error;
      system_rsp_payload_data <= io_remote_rsp_payload_data;
    end
  end
  always @ (posedge io_jtag_tck) begin
    jtag_tap_fsm_state <= jtag_tap_fsm_stateNext;
    case(jtag_tap_fsm_state)
      `JtagState_binary_sequancial_IR_CAPTURE : begin
        jtag_tap_instructionShift <= jtag_tap_instruction;
      end
      `JtagState_binary_sequancial_IR_SHIFT : begin
        jtag_tap_instructionShift <= ({io_jtag_tdi,jtag_tap_instructionShift} >>> 1);
      end
      `JtagState_binary_sequancial_IR_UPDATE : begin
        jtag_tap_instruction <= jtag_tap_instructionShift;
      end
      `JtagState_binary_sequancial_DR_SHIFT : begin
        jtag_tap_bypass <= io_jtag_tdi;
      end
      default : begin
      end
    endcase
    if(jtag_idcodeArea_instructionHit)begin
      if(_zz_8)begin
        jtag_idcodeArea_shifter <= ({io_jtag_tdi,jtag_idcodeArea_shifter} >>> 1);
      end
    end
    if((jtag_tap_fsm_state == `JtagState_binary_sequancial_RESET))begin
      jtag_idcodeArea_shifter <= (32'b00010000000000000001111111111111);
      jtag_tap_instruction <= {3'd0, jtag_idcodeArea_instructionId};
    end
    if(jtag_readArea_instructionHit)begin
      if((jtag_tap_fsm_state == `JtagState_binary_sequancial_DR_CAPTURE))begin
        jtag_readArea_shifter <= {{system_rsp_payload_data,system_rsp_payload_error},system_rsp_valid};
      end
      if(_zz_7)begin
        jtag_readArea_shifter <= ({io_jtag_tdi,jtag_readArea_shifter} >>> 1);
      end
    end
  end
endmodule