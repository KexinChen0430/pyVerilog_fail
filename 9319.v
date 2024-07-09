module usbHostSlaveAvalonWrap(
  clk,
  reset,
  address,
  writedata,
  readdata,
  write,
  read,
  waitrequest,
  chipselect,
  irq,
  usbClk,
  USBWireVPI,
  USBWireVMI,
  USBWireDataInTick,
  USBWireVPO,
  USBWireVMO,
  USBWireDataOutTick,
  USBWireOutEn_n,
  USBFullSpeed
   );
input clk;
input reset;
input [7:0] address;
input [7:0] writedata;
output [7:0] readdata;
input write;
input read;
output waitrequest;
input chipselect;
output irq;
input usbClk;
input USBWireVPI /* synthesis useioff=1 */;
input USBWireVMI /* synthesis useioff=1 */;
output USBWireVPO /* synthesis useioff=1 */;
output USBWireVMO /* synthesis useioff=1 */;
output USBWireDataOutTick  /* synthesis useioff=1 */;
output USBWireDataInTick /* synthesis useioff=1 */;
output USBWireOutEn_n /* synthesis useioff=1 */;
output USBFullSpeed /* synthesis useioff=1 */;
wire clk;
wire reset;
wire [7:0] address;
wire [7:0] writedata;
wire [7:0] readdata;
wire write;
wire read;
wire waitrequest;
wire chipselect;
wire irq;
wire usbClk;
wire USBWireVPI;
wire USBWireVMI;
wire USBWireVPO;
wire USBWireVMO;
wire USBWireDataOutTick;
wire USBWireDataInTick;
wire USBWireOutEn_n;
wire USBFullSpeed;
//internal wiring
wire strobe_i;
wire ack_o;
wire hostSOFSentIntOut;
wire hostConnEventIntOut;
wire hostResumeIntOut;
wire hostTransDoneIntOut;
wire slaveSOFRxedIntOut;
wire slaveResetEventIntOut;
wire slaveResumeIntOut;
wire slaveTransDoneIntOut;
wire slaveNAKSentIntOut;
wire USBWireCtrlOut;
wire [1:0] USBWireDataIn;
wire [1:0] USBWireDataOut;
assign irq = hostSOFSentIntOut | hostConnEventIntOut |
             hostResumeIntOut | hostTransDoneIntOut |
             slaveSOFRxedIntOut | slaveResetEventIntOut |
             slaveResumeIntOut | slaveTransDoneIntOut |
             slaveNAKSentIntOut;
assign strobe_i = chipselect & ( read | write);
assign waitrequest = ~ack_o;
assign USBWireOutEn_n = ~USBWireCtrlOut;
assign USBWireDataIn = {USBWireVPI, USBWireVMI};
assign {USBWireVPO, USBWireVMO} = USBWireDataOut;
//Parameters declaration:
defparam usbHostSlaveInst.HOST_FIFO_DEPTH = 64;
parameter HOST_FIFO_DEPTH = 64;
defparam usbHostSlaveInst.HOST_FIFO_ADDR_WIDTH = 6;
parameter HOST_FIFO_ADDR_WIDTH = 6;
defparam usbHostSlaveInst.EP0_FIFO_DEPTH = 64;
parameter EP0_FIFO_DEPTH = 64;
defparam usbHostSlaveInst.EP0_FIFO_ADDR_WIDTH = 6;
parameter EP0_FIFO_ADDR_WIDTH = 6;
defparam usbHostSlaveInst.EP1_FIFO_DEPTH = 64;
parameter EP1_FIFO_DEPTH = 64;
defparam usbHostSlaveInst.EP1_FIFO_ADDR_WIDTH = 6;
parameter EP1_FIFO_ADDR_WIDTH = 6;
defparam usbHostSlaveInst.EP2_FIFO_DEPTH = 64;
parameter EP2_FIFO_DEPTH = 64;
defparam usbHostSlaveInst.EP2_FIFO_ADDR_WIDTH = 6;
parameter EP2_FIFO_ADDR_WIDTH = 6;
defparam usbHostSlaveInst.EP3_FIFO_DEPTH = 64;
parameter EP3_FIFO_DEPTH = 64;
defparam usbHostSlaveInst.EP3_FIFO_ADDR_WIDTH = 6;
parameter EP3_FIFO_ADDR_WIDTH = 6;
usbHostSlave usbHostSlaveInst (
  .clk_i(clk),
  .rst_i(reset),
  .address_i(address),
  .data_i(writedata),
  .data_o(readdata),
  .we_i(write),
  .strobe_i(strobe_i),
  .ack_o(ack_o),
  .usbClk(usbClk),
  .hostSOFSentIntOut(hostSOFSentIntOut),
  .hostConnEventIntOut(hostConnEventIntOut),
  .hostResumeIntOut(hostResumeIntOut),
  .hostTransDoneIntOut(hostTransDoneIntOut),
  .slaveSOFRxedIntOut(slaveSOFRxedIntOut),
  .slaveResetEventIntOut(slaveResetEventIntOut),
  .slaveResumeIntOut(slaveResumeIntOut),
  .slaveTransDoneIntOut(slaveTransDoneIntOut),
  .slaveNAKSentIntOut(slaveNAKSentIntOut),
  .USBWireDataIn(USBWireDataIn),
  .USBWireDataInTick(USBWireDataInTick),
  .USBWireDataOut(USBWireDataOut),
  .USBWireDataOutTick(USBWireDataOutTick),
  .USBWireCtrlOut(USBWireCtrlOut),
  .USBFullSpeed(USBFullSpeed));
endmodule