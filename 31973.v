module fifo8_256 (
  input  wire       clock,
  input  wire [7:0] data,
  input  wire       rdreq,
  input  wire       sclr,
  input  wire       wrreq,
  output wire       empty,
  output wire       full,
  output wire [7:0] q,
  output wire [8:0] usedw
);
  scfifo  scfifo_component (
        .clock (clock),
        .data (data),
        .rdreq (rdreq),
        .sclr (sclr),
        .wrreq (wrreq),
        .empty ( empty ),
        .full ( full ),
        .q ( q ),
        .aclr (),
        .almost_empty (),
        .almost_full (),
        .eccstatus (),
        .usedw ( usedw ));
  defparam
    scfifo_component.add_ram_output_register = "OFF",
    scfifo_component.intended_device_family = "Cyclone IV E",
    scfifo_component.lpm_numwords = 512,
    scfifo_component.lpm_showahead = "ON",
    scfifo_component.lpm_type = "scfifo",
    scfifo_component.lpm_width = 8,
    scfifo_component.lpm_widthu = 9,
    scfifo_component.overflow_checking = "ON",
    scfifo_component.underflow_checking = "ON",
    scfifo_component.use_eab = "ON";
endmodule