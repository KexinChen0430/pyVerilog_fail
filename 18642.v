module mod_typ #(
   parameter type TYP = byte
)(
   input  logic clk,
   output TYP   cnt = 0,
   output int   siz
);
   always @ (posedge clk)
   cnt <= cnt + 1;
   assign siz = $bits (cnt);
endmodule