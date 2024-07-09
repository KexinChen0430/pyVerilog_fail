module test (
   itf whole_int,
   itf.test modported_int,
   input logic clk, rst,
   input logic d_in,
   output logic d_out
   );
   import mypackage::*;
   logic 	d_int;
   logic [7:0] 	data_, bork[2];
   assign      d_int = d_in + pkg_data;
   assign  modported_int.data = data_;
   always_ff @(posedge clk or negedge rst) begin
      if (~rst) d_out <= '0;
      else     d_out <= d_int;
   end
   property p1;
      @(posedge clk)
	disable iff(!rst)
	  $rose(d_int) |-> ##1 d_int;
   endproperty
   //a1:   assert property(p1) else $warning("\nProperty violated\n");
   c1:     cover  property(p1)  $display("\np1_cover\n");
endmodule