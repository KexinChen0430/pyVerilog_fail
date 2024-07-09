module NW_pipereg (push, pop, data_in, data_out, ready, valid, clk, rst_n);
   //parameter type reg_t = flit_t;
   input push, pop, clk, rst_n;
   input reg_t data_in;
   output reg_t data_out;
   output valid, ready;
   logic  valid;
   reg_t r;
   always@(posedge clk) begin
      if (!rst_n) begin
	 valid<=1'b0;
      end else begin
	 // attempt to push when register isn't ready
	 assert (!(push & !ready)) else $fatal;
	 if (pop) begin
//	    $display ("%d: %m: pop", $time);
	 end
	 if (push) begin
	    r <= data_in;
	    valid<=1'b1;
//	    $display ("%d: %m: push, new data=%1d, output_port=%b", $time, data_in.data, data_in.control.output_port);
	 end else begin
	    if (pop) begin
	       valid<=1'b0;
	    end
	 end
      end
   end // always@ (posedge clk)
   assign ready = !valid || pop ;
   assign data_out = r;
endmodule