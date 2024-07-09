module LAG_crossbar_oh_select (data_in, select, data_out);
   //parameter type dtype_t = byte;
   parameter n = 4;
   input flit_t data_in [n-1:0];
   // select[output][select-input];
   input [n-1:0][n-1:0] select;   // n one-hot encoded select signals per output
   output flit_t data_out [n-1:0];
   genvar i;
   generate
      for (i=0; i<n; i++) begin:outmuxes
	 LAG_mux_oh_select #(.n(n)) xbarmux (data_in, select[i], data_out[i]);
      end
   endgenerate
endmodule