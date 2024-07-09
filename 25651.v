module directly to the
	// wb_dat_o outputs.
	// Update -- we need to insert wait states for the Kestrel's
	// specific implementation of the J1A processor, because it's
	// unable to handle at-clock-rate memory accesses.
	// Original code: assign wb_ack_o = wb_stb_i;
	reg wb_ack;
	assign wb_ack_o = wb_ack;
	// When writing, however, we need to be more careful.  First,
	// we need to capture the values of the C and D signals, and
	// perhaps drive the corresponding PS/2 signals low.
	reg c_oe;
	reg d_oe;
	assign c_oe_o = c_oe;
	assign d_oe_o = d_oe;
	// We also want to pop the FIFO upon writing to the port.
	// rp_inc_n is the next clock's value for rp_inc.
	reg rp_inc;
	wire rp_inc_n = (~sys_reset_i & wb_stb_i & wb_we_i);
	assign rp_inc_o = rp_inc;
	always @(posedge sys_clk_i) begin
		if (sys_reset_i) begin
			c_oe <= 0;
			d_oe <= 0;
			rp_inc <= 0;
			wb_ack <= 0;
		end else begin
			wb_ack <= ~wb_ack & wb_stb_i;
			rp_inc <= rp_inc_n;
			if(wb_stb_i & wb_we_i) begin
				c_oe <= ~wb_dat_9_i;
				d_oe <= ~wb_dat_8_i;
			end
		end
	end
endmodule