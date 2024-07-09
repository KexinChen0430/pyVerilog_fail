module
		// must assert the data on the d_i ports, then assert
		// we_i by the next rising edge of sys_clk_i.
		//            __       _____        _____
		// sys_clk_i    \_____/     \______/     \___
		//       _____ ________________ _____________
		// d_i 	_____X________________X_____________
		//                  _____________
		// we_i  __________/             \___________
		// Note that this operation can fail; if the queue is
		// full at the time the data is written, nothing will
		// be stored.
		if (~sys_reset_i & we_i & ~full_o) begin
			fifo[wp] <= d_i;
		end
		// After writing a byte to the FIFO, the driver must in-
		// crement the write pointer explicitly.
		//            __       _____        _____
		// sys_clk_i    \_____/     \______/     \___
		//       _____ ________________ _____________
		// d_i 	_____X________________X_____________
		//                  _____________
		// we_i  __________/             \___________
		//                                ________
		// inc_wp_i  ____________________/        \__
		// Note that this operation may fail, too.  In the event
		// that the queue is full, it will not increment.
		if (~sys_reset_i & wp_inc_i & ~full_o) begin
			wp <= wp+1;
		end
		// After reading the q_o ports, an upstream device may
		// pop the queue by incrementing the read pointer.  This
		// operation may potentially fail -- if the queue is
		// already empty, popping the queue does nothing.
		if (~sys_reset_i & rp_inc_i & data_available_o) begin
			rp <= rp+1;
		end
	end
endmodule