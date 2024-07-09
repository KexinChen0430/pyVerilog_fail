module usbHostCyc2Wrap_usb1t11(
  clk_i,
  rst_i,
  address_i,
  data_i,
  data_o,
  we_i,
  strobe_i,
  ack_o,
  irq,
  usbClk,
  USBWireVPin,
  USBWireVMin,
  USBWireVPout,
  USBWireVMout,
  USBWireOE_n,
  USBFullSpeed
   );
input clk_i;
input rst_i;
input [7:0] address_i;
input [7:0] data_i;
output [7:0] data_o;
input we_i;
input strobe_i;
output ack_o;
output irq;
input usbClk;
input USBWireVPin /* synthesis useioff=1 */;
input USBWireVMin /* synthesis useioff=1 */;
output USBWireVPout /* synthesis useioff=1 */;
output USBWireVMout /* synthesis useioff=1 */;
output USBWireOE_n /* synthesis useioff=1 */;
output USBFullSpeed /* synthesis useioff=1 */;
wire clk_i;
wire rst_i;
wire [7:0] address_i;
wire [7:0] data_i;
wire [7:0] data_o;
wire irq;
wire usbClk;
wire USBWireDataOutTick;
wire USBWireDataInTick;
wire USBFullSpeed;
//internal wiring
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
             hostResumeIntOut | hostTransDoneIntOut;
assign USBWireDataIn = {USBWireVPin, USBWireVMin};
assign {USBWireVPout, USBWireVMout} = USBWireDataOut;
assign USBWireOE_n = ~USBWireCtrlOut;
//Parameters declaration:
defparam usbHostInst.HOST_FIFO_DEPTH = 64;
parameter HOST_FIFO_DEPTH = 64;
defparam usbHostInst.HOST_FIFO_ADDR_WIDTH = 6;
parameter HOST_FIFO_ADDR_WIDTH = 6;
usbHost usbHostInst (
  .clk_i(clk_i),
  .rst_i(rst_i),
  .address_i(address_i),
  .data_i(data_i),
  .data_o(data_o),
  .we_i(we_i),
  .strobe_i(strobe_i),
  .ack_o(ack_o),
  .usbClk(usbClk),
  .hostSOFSentIntOut(hostSOFSentIntOut),
  .hostConnEventIntOut(hostConnEventIntOut),
  .hostResumeIntOut(hostResumeIntOut),
  .hostTransDoneIntOut(hostTransDoneIntOut),
  .USBWireDataIn(USBWireDataIn),
  .USBWireDataInTick(USBWireDataInTick),
  .USBWireDataOut(USBWireDataOut),
  .USBWireDataOutTick(USBWireDataOutTick),
  .USBWireCtrlOut(USBWireCtrlOut),
  .USBFullSpeed(USBFullSpeed));
endmodule