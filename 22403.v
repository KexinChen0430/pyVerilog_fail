module.
	// Indeed, the ZipCPU will halt (and ignore us) once the i_wr has been
	// set until o_valid gets set.
	// Here, we clear o_valid on a reset, and any time we are on the last
	// bit while busy (provided the sign is zero, or we are dividing by
	// zero).  Since o_valid is self-clearing, we don't need to clear
	// it on an i_wr signal.
	initial	o_valid = 1'b0;
	always @(posedge i_clk)
	if (i_reset)
		o_valid <= 1'b0;
	else if (r_busy)
	begin
		if ((last_bit)||(zero_divisor))
			o_valid <= (zero_divisor)||(!r_sign);
	end else if (r_sign)
	begin
		o_valid <= (!zero_divisor); // 1'b1;
	end else
		o_valid <= 1'b0;
	// Division by zero error reporting.  Anytime we detect a zero divisor,
	// we set our output error, and then hold it until we are valid and
	// everything clears.
	initial	o_err = 1'b0;
	always @(posedge i_clk)
	if (i_reset)
		o_err <= 1'b0;
	else if (o_valid)
		o_err <= 1'b0;
	else if (((r_busy)||(r_sign))&&(zero_divisor))
		o_err <= 1'b1;
	else
		o_err <= 1'b0;
	// r_bit
	// Keep track of which "bit" of our divide we are on.  This number
	// ranges from 31 down to zero.  On any write, we set ourselves to
	// 5'h1f.  Otherwise, while we are busy (but not within the pre-sign
	// adjustment stage), we subtract one from our value on every clock.
	initial	r_bit = 0;
	always @(posedge i_clk)
	if (i_reset)
		r_bit <= 0;
	else if ((r_busy)&&(!pre_sign))
		r_bit <= r_bit + 1'b1;
	else
		r_bit <= 0;
	// last_bit
	// This logic replaces a lot of logic that was inside our giant state
	// machine with ... something simpler.  In particular, we'll use this
	// logic to determine we are processing our last bit.  The only trick
	// is, this bit needs to be set whenever (r_busy) and (r_bit == 0),
	// hence we need to set on (r_busy) and (r_bit == 1) so as to be set
	// when (r_bit == 0).
	initial	last_bit = 1'b0;
	always @(posedge i_clk)
	if (i_reset)
		last_bit <= 1'b0;
	else if (r_busy)
		last_bit <= (r_bit == {(LGBW){1'b1}}-1'b1);
	else
		last_bit <= 1'b0;
	// pre_sign
	// This is part of the state machine.  pre_sign indicates that we need
	// a extra clock to take the absolute value of our inputs.  It need only
	// be true for the one clock, and then it must clear itself.
	initial	pre_sign = 1'b0;
	always @(posedge i_clk)
	if (i_reset)
		pre_sign <= 1'b0;
	else if (i_wr)
		pre_sign <= (i_signed)&&((i_numerator[BW-1])||(i_denominator[BW-1]));
	else
		pre_sign <= 1'b0;
	// As a result of our operation, we need to set the flags.  The most
	// difficult of these is the "Z" flag indicating that the result is
	// zero.  Here, we'll use the same logic that sets the low-order
	// bit to clear our zero flag, and leave the zero flag set in all
	// other cases.  Well ... not quite.  If we need to flip the sign of
	// our value, then we can't quite clear the zero flag ... yet.
	initial	r_z = 1'b0;
	always @(posedge i_clk)
	if (i_reset)
		r_z <= 1'b0;
	else if((r_busy)&&(r_divisor[(2*BW-2):(BW)] == 0)&&(!diff[BW]))
			// If we are busy, the upper bits of our divisor are
			// zero (i.e., we got the shift right), and the top
			// (carry) bit of the difference is zero (no overflow),
			// then we could subtract our divisor from our dividend
			// and hence we add a '1' to the quotient, while setting
			// the zero flag to false.
		r_z <= 1'b0;
	else if (i_wr)
		r_z <= 1'b1;
	// r_dividend
	// This is initially the numerator.  On a signed divide, it then becomes
	// the absolute value of the numerator.  We'll subtract from this value
	// the divisor shifted as appropriate for every output bit we are
	// looking for--just as with traditional long division.
	initial	r_dividend = 0;
	always @(posedge i_clk)
	if (i_reset)
		r_dividend <= 0;
	else if (pre_sign)
	begin
		// If we are doing a signed divide, then take the
		// absolute value of the dividend
		if (r_dividend[BW-1])
			r_dividend <= -r_dividend;
		// The begin/end block is important so we don't lose
		// the fact that on an else we don't do anything.
	end else if((r_busy)&&(r_divisor[(2*BW-2):(BW)]==0)&&(!diff[BW]))
		// This is the condition whereby we set a '1' in our
		// output quotient, and we subtract the (current)
		// divisor from our dividend.  (The difference is
		// already kept in the diff vector above.)
		r_dividend <= diff[(BW-1):0];
	else if (!r_busy)
		// Once we are done, and r_busy is no longer high, we'll
		// always accept new values into our dividend.  This
		// guarantees that, when i_wr is set, the new value
		// is already set as desired.
		r_dividend <=  i_numerator;
	initial	r_divisor = 0;
	always @(posedge i_clk)
	if (i_reset)
		r_divisor <= 0;
	else if (pre_sign)
	begin
		if (r_divisor[(2*BW-2)])
			r_divisor[(2*BW-2):(BW-1)]
				<= -r_divisor[(2*BW-2):(BW-1)];
	end else if (r_busy)
		r_divisor <= { 1'b0, r_divisor[(2*BW-2):1] };
	else
		r_divisor <= {  i_denominator, {(BW-1){1'b0}} };
	// r_sign
	// is a flag for our state machine control(s).  r_sign will be set to
	// true any time we are doing a signed divide and the result must be
	// negative.  In that case, we take a final logic stage at the end of
	// the divide to negate the output.  This flag is what tells us we need
	// to do that.  r_busy will be true during the divide, then when r_busy
	// goes low, r_sign will be checked, then the idle/reset stage will have
	// been reached.  For this reason, we cannot set r_sign unless we are
	// up to something.
	initial	r_sign = 1'b0;
	always @(posedge i_clk)
	if (i_reset)
		r_sign <= 1'b0;
	else if (pre_sign)
		r_sign <= ((r_divisor[(2*BW-2)])^(r_dividend[(BW-1)]));
	else if (r_busy)
		r_sign <= (r_sign)&&(!zero_divisor);
	else
		r_sign <= 1'b0;
	initial	o_quotient = 0;
	always @(posedge i_clk)
	if (i_reset)
		o_quotient <= 0;
	else if (r_busy)
	begin
		o_quotient <= { o_quotient[(BW-2):0], 1'b0 };
		if ((r_divisor[(2*BW-2):(BW)] == 0)&&(!diff[BW]))
			o_quotient[0] <= 1'b1;
	end else if (r_sign)
		o_quotient <= -o_quotient;
	else
		o_quotient <= 0;
	// Set Carry on an exact divide
	// Perhaps nothing uses this, but ... well, I suppose we could remove
	// this logic eventually, just ... not yet.
	initial	r_c = 1'b0;
	always @(posedge i_clk)
	if (i_reset)
		r_c <= 1'b0;
	else
		r_c <= (r_busy)&&((diff == 0)||(r_dividend == 0));
	// The last flag: Negative.  This flag is set assuming that the result
	// of the divide was negative (i.e., the high order bit is set).  This
	// will also be true of an unsigned divide--if the high order bit is
	// ever set upon completion.  Indeed, you might argue that there's no
	// logic involved.
	wire	w_n;
	assign w_n = o_quotient[(BW-1)];
	assign o_flags = { 1'b0, w_n, r_c, r_z };
`ifdef	FORMAL
	reg	f_past_valid;
	initial	f_past_valid = 0;
	always @(posedge i_clk)
		f_past_valid <= 1'b1;
`ifdef	DIV
`define	ASSUME	assume
`else
`define	ASSUME	assert
`endif
	initial	`ASSUME(i_reset);
	always @(*)
	if (!f_past_valid)
		`ASSUME(i_reset);
	always @(posedge i_clk)
	if ((!f_past_valid)||($past(i_reset)))
	begin
		assert(!o_busy);
		assert(!o_valid);
		assert(!o_err);
		assert(!r_busy);
		assert(!zero_divisor);
		assert(r_bit==0);
		assert(!last_bit);
		assert(!pre_sign);
		assert(!r_z);
		assert(r_dividend==0);
		assert(o_quotient==0);
		assert(!r_c);
		assert(r_divisor==0);
		`ASSUME(!i_wr);
	end
	always @(*)
	if (o_busy)
		`ASSUME(!i_wr);
	always @(posedge i_clk)
	if ((f_past_valid)&&(!$past(i_reset))&&($past(o_busy))&&(!o_busy))
	begin
		assert(o_valid);
	end
	// A formal methods section
	// This section isn't yet complete.  For now, it is just
	// a description of things I think should be in here ... not
	// yet a description of what it would take to prove
	// this divide (yet).
	always @(*)
	if (o_err)
		assert(o_valid);
	always @(posedge i_clk)
	if ((f_past_valid)&&(!$past(i_wr)))
		assert(!pre_sign);
	always @(posedge i_clk)
	if ((f_past_valid)&&(!$past(i_reset))&&($past(i_wr))&&($past(i_signed))
			&&(|$past({i_numerator[BW-1],i_denominator[BW-1]})))
		assert(pre_sign);
	// always @(posedge i_clk)
	// if ((f_past_valid)&&(!$past(pre_sign)))
		// assert(!r_sign);
	always @(posedge i_clk)
	if ((f_past_valid)&&(!$past(i_reset))&&($past(i_wr)))
		assert(o_busy);
	always @(posedge i_clk)
	if ((f_past_valid)&&($past(o_valid)))
		assert(!o_valid);
	always @(*)
	if ((o_valid)&&(!o_err))
		assert(r_z == ((o_quotient == 0)? 1'b1:1'b0));
	always @(*)
	if ((o_valid)&&(!o_err))
		assert(w_n == o_quotient[BW-1]);
	always @(posedge i_clk)
	if ((f_past_valid)&&(!$past(r_busy))&&(!$past(i_wr)))
		assert(!o_busy);
	always @(posedge i_clk)
		assert((!o_busy)||(!o_valid));
	always @(posedge i_clk)
	if(o_busy) `ASSUME(!i_wr);
	always @(*)
		if(r_busy) assert(o_busy);
	reg	[BW:0]	f_bits_set;
	always @(posedge i_clk)
	if (i_reset)
		f_bits_set <= 0;
	else if (i_wr)
		f_bits_set <= 0;
	else if ((r_busy)&&(!pre_sign))
		f_bits_set <= { f_bits_set[BW-1:0], 1'b1 };
	always @(*)
	if ((o_valid)&&(!o_err))
		assert((!f_bits_set[BW])&&(&f_bits_set[BW-1:0]));
	always @(posedge i_clk)
	if ((f_past_valid)&&(!$past(i_reset))&&($past(r_busy))
		&&($past(r_divisor[2*BW-2:BW])==0))
	begin
		if ($past(r_divisor) == 0)
			assert(o_err);
		else if ($past(pre_sign))
		begin
			if ($past(r_dividend[BW-1]))
				assert(r_dividend == -$past(r_dividend));
			if ($past(r_divisor[(2*BW-2)]))
			begin
				assert(r_divisor[(2*BW-2):(BW-1)]
					== -$past(r_divisor[(2*BW-2):(BW-1)]));
				assert(r_divisor[BW-2:0] == 0);
			end
		end else begin
			if (o_quotient[0])
				assert(r_dividend == $past(diff));
			else
				assert(r_dividend == $past(r_dividend));
			// r_divisor should shift down on every step
			assert(r_divisor[2*BW-2]==0);
			assert(r_divisor[2*BW-3:0]==$past(r_divisor[2*BW-2:1]));
		end
		if ($past(r_dividend) >= $past(r_divisor[BW-1:0]))
			assert(o_quotient[0]);
		else
			assert(!o_quotient[0]);
	end
`endif
endmodule