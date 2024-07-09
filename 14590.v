module main (input clk,
             input sw1,
             input sw2,
             output c0,
             output c1,
             output c2,
             output c3,
             output c4,
             output c5,
             output c6,
             output c7);
wire sw1_p;  //-- up input with pull-up
wire sw2_p;
wire up;
wire down;
SB_IO #(
   .PIN_TYPE(6'b 1010_01),
   .PULLUP(1'b 1)
) io_pin (
   .PACKAGE_PIN(sw1),
   .D_IN_0(sw1_p)
);
SB_IO #(
   .PIN_TYPE(6'b 1010_01),
   .PULLUP(1'b 1)
) io_pin2 (
   .PACKAGE_PIN(sw2),
   .D_IN_0(sw2_p)
);
debounce d1 (
  .clk(clk),
  .sw_in(~sw1_p),
  .sw_out(up)
  );
debounce d2 (
  .clk(clk),
  .sw_in(~sw2_p),
  .sw_out(down)
  );
reg [7:0] counter = 8'h08;
 always @(posedge clk) begin
   if (up)
     counter <= counter + 1;
   else
     if (down)
       counter <= counter - 1;
 end
 assign {c7,c6,c5,c4,c3,c2,c1,c0} = counter;
endmodule