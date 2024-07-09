module Apb3UartCtrl (
      input  [3:0] io_apb_PADDR,
      input  [0:0] io_apb_PSEL,
      input   io_apb_PENABLE,
      output  io_apb_PREADY,
      input   io_apb_PWRITE,
      input  [31:0] io_apb_PWDATA,
      output reg [31:0] io_apb_PRDATA,
      output  io_uart_txd,
      input   io_uart_rxd,
      output  io_interrupt,
      input   io_mainClk,
      input   resetCtrl_systemReset);
  wire  _zz_3;
  reg  _zz_4;
  wire  _zz_5;
  wire  _zz_6;
  wire  _zz_7;
  wire  _zz_8;
  wire [7:0] _zz_9;
  wire  _zz_10;
  wire  _zz_11;
  wire  _zz_12;
  wire [7:0] _zz_13;
  wire [4:0] _zz_14;
  wire [4:0] _zz_15;
  wire  _zz_16;
  wire  _zz_17;
  wire [7:0] _zz_18;
  wire [4:0] _zz_19;
  wire [4:0] _zz_20;
  wire [0:0] _zz_21;
  wire [0:0] _zz_22;
  wire [4:0] _zz_23;
  wire  busCtrl_askWrite;
  wire  busCtrl_askRead;
  wire  busCtrl_doWrite;
  wire  busCtrl_doRead;
  wire [2:0] bridge_uartConfigReg_frame_dataLength;
  wire `UartStopType_binary_sequancial_type bridge_uartConfigReg_frame_stop;
  wire `UartParityType_binary_sequancial_type bridge_uartConfigReg_frame_parity;
  reg [19:0] bridge_uartConfigReg_clockDivider;
  reg  _zz_1;
  wire  bridge_write_streamUnbuffered_valid;
  wire  bridge_write_streamUnbuffered_ready;
  wire [7:0] bridge_write_streamUnbuffered_payload;
  reg  bridge_interruptCtrl_writeIntEnable;
  reg  bridge_interruptCtrl_readIntEnable;
  wire  bridge_interruptCtrl_readInt;
  wire  bridge_interruptCtrl_writeInt;
  wire  bridge_interruptCtrl_interrupt;
  wire [7:0] _zz_2;
  function [19:0] zz_bridge_uartConfigReg_clockDivider(input dummy);
    begin
      zz_bridge_uartConfigReg_clockDivider = (20'b00000000000000000000);
      zz_bridge_uartConfigReg_clockDivider = (20'b00000000000000010011);
    end
  endfunction
  wire [19:0] _zz_24;
  assign io_apb_PREADY = _zz_6;
  assign _zz_21 = io_apb_PWDATA[0 : 0];
  assign _zz_22 = io_apb_PWDATA[1 : 1];
  assign _zz_23 = ((5'b10000) - _zz_14);
  UartCtrl uartCtrl_1 (
    .io_config_frame_dataLength(bridge_uartConfigReg_frame_dataLength),
    .io_config_frame_stop(bridge_uartConfigReg_frame_stop),
    .io_config_frame_parity(bridge_uartConfigReg_frame_parity),
    .io_config_clockDivider(bridge_uartConfigReg_clockDivider),
    .io_write_valid(_zz_12),
    .io_write_ready(_zz_7),
    .io_write_payload(_zz_13),
    .io_read_valid(_zz_8),
    .io_read_payload(_zz_9),
    .io_uart_txd(_zz_10),
    .io_uart_rxd(io_uart_rxd),
    .io_mainClk(io_mainClk),
    .resetCtrl_systemReset(resetCtrl_systemReset)
  );
  StreamFifo streamFifo_2 (
    .io_push_valid(bridge_write_streamUnbuffered_valid),
    .io_push_ready(_zz_11),
    .io_push_payload(bridge_write_streamUnbuffered_payload),
    .io_pop_valid(_zz_12),
    .io_pop_ready(_zz_7),
    .io_pop_payload(_zz_13),
    .io_flush(_zz_3),
    .io_occupancy(_zz_14),
    .io_availability(_zz_15),
    .io_mainClk(io_mainClk),
    .resetCtrl_systemReset(resetCtrl_systemReset)
  );
  StreamFifo streamFifo_3 (
    .io_push_valid(_zz_8),
    .io_push_ready(_zz_16),
    .io_push_payload(_zz_9),
    .io_pop_valid(_zz_17),
    .io_pop_ready(_zz_4),
    .io_pop_payload(_zz_18),
    .io_flush(_zz_5),
    .io_occupancy(_zz_19),
    .io_availability(_zz_20),
    .io_mainClk(io_mainClk),
    .resetCtrl_systemReset(resetCtrl_systemReset)
  );
  assign io_uart_txd = _zz_10;
  assign _zz_6 = 1'b1;
  always @ (*) begin
    io_apb_PRDATA = (32'b00000000000000000000000000000000);
    _zz_1 = 1'b0;
    _zz_4 = 1'b0;
    case(io_apb_PADDR)
      4'b0000 : begin
        if(busCtrl_doWrite)begin
          _zz_1 = 1'b1;
        end
        if(busCtrl_doRead)begin
          _zz_4 = 1'b1;
        end
        io_apb_PRDATA[16 : 16] = _zz_17;
        io_apb_PRDATA[7 : 0] = _zz_18;
      end
      4'b0100 : begin
        io_apb_PRDATA[20 : 16] = _zz_23;
        io_apb_PRDATA[28 : 24] = _zz_19;
        io_apb_PRDATA[0 : 0] = bridge_interruptCtrl_writeIntEnable;
        io_apb_PRDATA[1 : 1] = bridge_interruptCtrl_readIntEnable;
        io_apb_PRDATA[8 : 8] = bridge_interruptCtrl_writeInt;
        io_apb_PRDATA[9 : 9] = bridge_interruptCtrl_readInt;
      end
      default : begin
      end
    endcase
  end
  assign busCtrl_askWrite = ((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PWRITE);
  assign busCtrl_askRead = ((io_apb_PSEL[0] && io_apb_PENABLE) && (! io_apb_PWRITE));
  assign busCtrl_doWrite = (((io_apb_PSEL[0] && io_apb_PENABLE) && _zz_6) && io_apb_PWRITE);
  assign busCtrl_doRead = (((io_apb_PSEL[0] && io_apb_PENABLE) && _zz_6) && (! io_apb_PWRITE));
  assign _zz_24 = zz_bridge_uartConfigReg_clockDivider(1'b0);
  always @ (*) bridge_uartConfigReg_clockDivider = _zz_24;
  assign bridge_uartConfigReg_frame_dataLength = (3'b111);
  assign bridge_uartConfigReg_frame_parity = `UartParityType_binary_sequancial_NONE;
  assign bridge_uartConfigReg_frame_stop = `UartStopType_binary_sequancial_ONE;
  assign bridge_write_streamUnbuffered_valid = _zz_1;
  assign bridge_write_streamUnbuffered_payload = _zz_2;
  assign bridge_write_streamUnbuffered_ready = _zz_11;
  assign bridge_interruptCtrl_readInt = (bridge_interruptCtrl_readIntEnable && _zz_17);
  assign bridge_interruptCtrl_writeInt = (bridge_interruptCtrl_writeIntEnable && (! _zz_12));
  assign bridge_interruptCtrl_interrupt = (bridge_interruptCtrl_readInt || bridge_interruptCtrl_writeInt);
  assign io_interrupt = bridge_interruptCtrl_interrupt;
  assign _zz_2 = io_apb_PWDATA[7 : 0];
  assign _zz_3 = 1'b0;
  assign _zz_5 = 1'b0;
  always @ (posedge io_mainClk or posedge resetCtrl_systemReset) begin
    if (resetCtrl_systemReset) begin
      bridge_interruptCtrl_writeIntEnable <= 1'b0;
      bridge_interruptCtrl_readIntEnable <= 1'b0;
    end else begin
      case(io_apb_PADDR)
        4'b0000 : begin
        end
        4'b0100 : begin
          if(busCtrl_doWrite)begin
            bridge_interruptCtrl_writeIntEnable <= _zz_21[0];
            bridge_interruptCtrl_readIntEnable <= _zz_22[0];
          end
        end
        default : begin
        end
      endcase
    end
  end
endmodule