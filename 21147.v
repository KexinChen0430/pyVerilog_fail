module
generate for (j = 4; j < 5; j = j+1) begin
    red_pitaya_iir_block iir (
	     // data
	     .clk_i        (  clk_i          ),  // clock
	     .rstn_i       (  rstn_i         ),  // reset - active low
	     .dat_i        (  input_signal [j] ),  // input data
	     .dat_o        (  output_direct[j]),  // output data
		 //communincation with PS
		 .addr ( sys_addr[16-1:0] ),
		 .wen  ( sys_wen & (sys_addr[20-1:16]==j) ),
		 .ren  ( sys_ren & (sys_addr[20-1:16]==j) ),
		 .ack  ( module_ack[j] ),
		 .rdata (module_rdata[j]),
	     .wdata (sys_wdata)
      );
	  assign output_signal[j] = output_direct[j];
end endgenerate
//IQ modules
generate for (j = 5; j < 7; j = j+1) begin
    red_pitaya_iq_block
      iq
      (
	     // data
	     .clk_i        (  clk_i          ),  // clock
	     .rstn_i       (  rstn_i         ),  // reset - active low
         .sync_i       (  sync[j]        ),  // syncronization of different dsp modules
	     .dat_i        (  input_signal [j] ),  // input data
	     .dat_o        (  output_direct[j]),  // output data
		 .signal_o     (  output_signal[j]),  // output signal
         // not using 2nd quadrature for most iq's: multipliers will be
         // synthesized away by Vivado
         //.signal2_o  (  output_signal[j*2]),  // output signal
		 //communincation with PS
		 .addr ( sys_addr[16-1:0] ),
		 .wen  ( sys_wen & (sys_addr[20-1:16]==j) ),
		 .ren  ( sys_ren & (sys_addr[20-1:16]==j) ),
		 .ack  ( module_ack[j] ),
		 .rdata (module_rdata[j]),
	     .wdata (sys_wdata)
      );
end endgenerate
// IQ with two outputs
generate for (j = 7; j < 8; j = j+1) begin
    red_pitaya_iq_block   #( .QUADRATUREFILTERSTAGES(4) )
      iq_2_outputs
      (
         // data
         .clk_i        (  clk_i          ),  // clock
         .rstn_i       (  rstn_i         ),  // reset - active low
         .sync_i       (  sync[j]        ),  // syncronization of different dsp modules
         .dat_i        (  input_signal [j] ),  // input data
         .dat_o        (  output_direct[j]),  // output data
         .signal_o     (  output_signal[j]),  // output signal
         .signal2_o    (  output_signal[j*2]),  // output signal 2
         //communincation with PS
         .addr ( sys_addr[16-1:0] ),
         .wen  ( sys_wen & (sys_addr[20-1:16]==j) ),
         .ren  ( sys_ren & (sys_addr[20-1:16]==j) ),
         .ack  ( module_ack[j] ),
         .rdata (module_rdata[j]),
         .wdata (sys_wdata)
      );
end endgenerate
endmodule