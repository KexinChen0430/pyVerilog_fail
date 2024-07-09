module.
	// Indeed, the ZipCPU will halt (and ignore us) once the i_wr has been
	// set until o_valid gets set.
	// Here, we clear o_valid on a reset, and any time we are on the last
	// bit while busy (provided the sign is zero, or we are dividing by
	// zero).  Since o_valid is self-clearing, we don't need to clear
	// it on an i_wr signal.
	initial	o_valid = 1'b0;
	always @(posedge i_clk)
		if (i_rst)
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
		if((i_rst)||(o_valid))
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
	always @(posedge i_clk)
		if ((r_busy)&&(!pre_sign))
			r_bit <= r_bit + {(LGBW){1'b1}};
		else
			r_bit <= {(LGBW){1'b1}};
	// last_bit
	// This logic replaces a lot of logic that was inside our giant state
	// machine with ... something simpler.  In particular, we'll use this
	// logic to determine we are processing our last bit.  The only trick
	// is, this bit needs to be set whenever (r_busy) and (r_bit == 0),
	// hence we need to set on (r_busy) and (r_bit == 1) so as to be set
	// when (r_bit == 0).
	initial	last_bit = 1'b0;
	always @(posedge i_clk)
		if (r_busy)
			last_bit <= (r_bit == {{(LGBW-1){1'b0}},1'b1});
		else
			last_bit <= 1'b0;
	// pre_sign
	// This is part of the state machine.  pre_sign indicates that we need
	// a extra clock to take the absolute value of our inputs.  It need only
	// be true for the one clock, and then it must clear itself.
	initial	pre_sign = 1'b0;
	always @(posedge i_clk)
		if (i_wr)
			pre_sign <= i_signed;
		else
			pre_sign <= 1'b0;
	// As a result of our operation, we need to set the flags.  The most
	// difficult of these is the "Z" flag indicating that the result is
	// zero.  Here, we'll use the same logic that sets the low-order
	// bit to clear our zero flag, and leave the zero flag set in all
	// other cases.  Well ... not quite.  If we need to flip the sign of
	// our value, then we can't quite clear the zero flag ... yet.
	always @(posedge i_clk)
		if((r_busy)&&(r_divisor[(2*BW-2):(BW)] == 0)&&(!diff[BW]))
			// If we are busy, the upper bits of our divisor are
			// zero (i.e., we got the shift right), and the top
			// (carry) bit of the difference is zero (no overflow),
			// then we could subtract our divisor from our dividend
			// and hence we add a '1' to the quotient, while setting
			// the zero flag to false.
			r_z <= 1'b0;
		else if ((!r_busy)&&(!r_sign))
			r_z <= 1'b1;
	// r_dividend
	// This is initially the numerator.  On a signed divide, it then becomes
	// the absolute value of the numerator.  We'll subtract from this value
	// the divisor shifted as appropriate for every output bit we are
	// looking for--just as with traditional long division.
	always @(posedge i_clk)
		if (pre_sign)
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
		if (pre_sign)
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
		if (pre_sign)
			r_sign <= ((r_divisor[(2*BW-2)])^(r_dividend[(BW-1)]));
		else if (r_busy)
			r_sign <= (r_sign)&&(!zero_divisor);
		else
			r_sign <= 1'b0;
	always @(posedge i_clk)
		if (r_busy)
		begin
			o_quotient <= { o_quotient[(BW-2):0], 1'b0 };
			if ((r_divisor[(2*BW-2):(BW)] == 0)&&(!diff[BW]))
			begin
				o_quotient[0] <= 1'b1;
			end
		end else if (r_sign)
			o_quotient <= -o_quotient;
		else
			o_quotient <= 0;
	// Set Carry on an exact divide
	// Perhaps nothing uses this, but ... well, I suppose we could remove
	// this logic eventually, just ... not yet.
	always @(posedge i_clk)
		r_c <= (r_busy)&&((diff == 0)||(r_dividend == 0));
	// The last flag: Negative.  This flag is set assuming that the result
	// of the divide was negative (i.e., the high order bit is set).  This
	// will also be true of an unsigned divide--if the high order bit is
	// ever set upon completion.  Indeed, you might argue that there's no
	// logic involved.
	wire	w_n;
	assign w_n = o_quotient[(BW-1)];
	assign o_flags = { 1'b0, w_n, r_c, r_z };
endmodule