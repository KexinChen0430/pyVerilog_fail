module romtest2 (
    input wire sysclk,
    input wire clk,
    input wire rst,
    output wire d0,
    output wire d1,
    output wire d2,
    output wire d3,
    output wire d4,
    output wire d5,
    output wire d6,
    output wire d7
);
wire [7:0] dout;
reg [3:0] addr;
rom16x8
  ROM (
        .clk(sysclk),
        .addr(addr),
        .data(dout)
      );
wire clk_in, clk2;
wire rst_in, rst2;
wire sw;
SB_IO #(
   .PIN_TYPE(6'b 1010_01),
   .PULLUP(1'b 1)
) io_pin (
   .PACKAGE_PIN(clk),
   .D_IN_0(clk2)
);
SB_IO #(
   .PIN_TYPE(6'b 1010_01),
   .PULLUP(1'b 1)
) io_pin2 (
   .PACKAGE_PIN(rst),
   .D_IN_0(rst2)
);
assign rst_in = ~rst2;
assign sw = ~clk2;
debounce deb1 (
  .clk(sysclk),
  .sw_in(sw),
  .sw_out(clk_in)
  );
always @(posedge clk_in or posedge rst_in) begin
  if (rst_in==1'b1)
    addr <= 4'b0;
  else
    addr <= addr + 1;
end
assign {d7,d6,d5,d4,d3,d2,d1,d0} = dout;
endmodule