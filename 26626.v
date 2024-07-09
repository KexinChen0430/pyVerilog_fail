module outputs)
// End of automatics
wire [31:0]	tck_shft_data_nxt;
wire [31:0]	tck_shft_data_ff;
// Module Body
assign tck_shft_data_nxt
	      = ctu_efc_capturedr ? read_data_ff
	       : ctu_efc_shiftdr ? {tck_shft_data_ff[30:0], ctu_efc_data_in}
	       : tck_shft_data_ff;
dff_ns #(32) tck_shft_data_reg (.din(tck_shft_data_nxt ),
		   .q(tck_shft_data_ff ), .clk(tck));
assign       efc_ctu_data_out = tck_shft_data_ff[31];
endmodule