module, and
		// i_tap_wr causes all of them to shift forward by one.
		reg	[(TW-1):0]	tap;
		initial	tap = INITIAL_VALUE;
		always @(posedge i_clk)
			if (i_tap_wr)
				tap <= i_tap;
		assign o_tap = tap;
	end endgenerate
	// Forward the sample on down the line, to be the input sample for the
	// next component
	initial	o_sample = 0;
	initial	delayed_sample = 0;
	always @(posedge i_clk)
		if (i_reset)
		begin
			delayed_sample <= 0;
			o_sample <= 0;
		end else if (i_ce)
		begin
			// Note the two sample delay in this forwarding
			// structure.  This aligns the inputs up so that the
			// accumulator structure (below) works.
			delayed_sample <= i_sample;
			o_sample <= delayed_sample;
		end
`ifndef	FORMAL
	// Multiply the filter tap by the incoming sample
	always @(posedge i_clk)
		if (i_reset)
			product <= 0;
		else if (i_ce)
			product <= o_tap * i_sample;
`else
	wire	[(TW+IW-1):0]	w_pre_product;
	abs_mpy #(.AW(TW), .BW(IW), .OPT_SIGNED(1'b1))
		abs_bypass(i_clk, i_reset, o_tap, i_sample, w_pre_product);
	initial	product = 0;
	always @(posedge i_clk)
	if (i_reset)
		product <= 0;
	else if (i_ce)
		product <= w_pre_product;
`endif
	// Continue summing together the output components of the FIR filter
	initial	o_acc = 0;
	always @(posedge i_clk)
		if (i_reset)
			o_acc <= 0;
		else if (i_ce)
			o_acc <= i_partial_acc
				+ { {(OW-(TW+IW)){product[(TW+IW-1)]}},
						product };
	// Make verilator happy
	// verilate lint_on  UNUSED
	wire	unused;
	assign	unused = i_tap_wr;
	// verilate lint_off UNUSED
endmodule