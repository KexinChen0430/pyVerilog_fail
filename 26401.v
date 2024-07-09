module main (input wire clk,
             input wire sw_in,
             output wire sw_out);
wire sw_in2, sw;
SB_IO #(
    .PIN_TYPE(6'b 1010_01),
    .PULLUP(1'b 1)
) io_pin (
    .PACKAGE_PIN(sw_in),
    .D_IN_0(sw_in2)
);
assign sw = ~sw_in2;
debounce d1 (
  .clk(clk),
  .sw_in(sw),
  .sw_out(sw_out)
  );
endmodule