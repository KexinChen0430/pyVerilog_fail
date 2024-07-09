module sync_pulse(input ci, i, co, output reg o=0);
   reg it = 0;
   always @ (posedge ci)
     it <= i ^ it;
   wire it_o;
   sync sync_i(.c(co), .i(it), .o(it_o));
   reg 	it_o_prev = 0;
   always @ (posedge co)
     begin
	it_o_prev <= it_o;
	o <= it_o ^ it_o_prev;
     end
endmodule