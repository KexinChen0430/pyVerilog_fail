module outputs)
   wire [5:0]		emon_zero_flag;		// From emon of emon.v
   wire [DW-1:0]	mi_data_out;		// From emon of emon.v
   // End of automatics
   /*AUTOWIRE*/
   //DUT
   emon emon(
	     /*AUTOINST*/
	     // Outputs
	     .mi_data_out		(mi_data_out[DW-1:0]),
	     .emon_zero_flag		(emon_zero_flag[5:0]),
	     // Inputs
	     .clk			(clk),
	     .reset			(reset),
	     .mi_access			(mi_access),
	     .mi_write			(mi_write),
	     .mi_addr			(mi_addr[19:0]),
	     .mi_data_in		(mi_data_in[DW-1:0]),
	     .erx_rdfifo_access		(erx_rdfifo_access),
	     .erx_rdfifo_wait		(erx_rdfifo_wait),
	     .erx_wrfifo_access		(erx_wrfifo_access),
	     .erx_wrfifo_wait		(erx_wrfifo_wait),
	     .erx_wbfifo_access		(erx_wbfifo_access),
	     .erx_wbfifo_wait		(erx_wbfifo_wait),
	     .etx_rdfifo_access		(etx_rdfifo_access),
	     .etx_rdfifo_wait		(etx_rdfifo_wait),
	     .etx_wrfifo_access		(etx_wrfifo_access),
	     .etx_wrfifo_wait		(etx_wrfifo_wait),
	     .etx_wbfifo_access		(etx_wbfifo_access),
	     .etx_wbfifo_wait		(etx_wbfifo_wait));
   //Waveform dump
   initial
     begin
	$dumpfile("test.vcd");
	$dumpvars(0, dv_emon);
     end
endmodule