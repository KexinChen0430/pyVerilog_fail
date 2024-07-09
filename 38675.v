module (when it loads new data)
	wire [15:0] dac_pardata; // parallel data from sound_mulacc to sound_dac
	reg mulacc_load;   // load to sound_mulacc
	reg mulacc_clrsum; // clr_sum to sound_mulacc
	wire mulacc_ready; // ready from sound_mulacc
	wire [7:0] mem_do; // data output of DAT or VOL
	reg [8:0] mem_rdaddr;  // read address for both memory blocks
	reg int_mode_8chans;  // internal and sync-in mode_8chans signals
	reg sync_mode_8chans; //
	reg int_mode_pan4ch,sync_mode_pan4ch; // same for pan4ch signal
	reg int_mode_inv7b, sync_mode_inv7b;  // ...
	reg [1:0] chanptr; // pointer to channels (4 channels total: 0,1,4,5 or 2,3,6,7 depending on lrptr state)
	reg lrptr;         // left-right pointer (selects either left (0) or right (1) channels)
	reg [2:0] cur_st,nxt_st;
	// for simulation purposes
	initial
	begin
		bf_wraddr <= 0;
		bf_datnvol <= 0;
		bf_data <= 0;
		do_write <= 0;
		cur_st <= START;
	end
	// instantiating modules
	sound_dac my_dac( .clock(clock),
	                  .dac_clock(dac_clock),
	                  .dac_leftright(dac_leftright),
	                  .dac_data(dac_data),
	                  .load(dac_load),
	                  .datain(dac_pardata) );
	sound_mulacc my_mulacc( .clock(clock),
	                        .vol_in(vol),
	                        .dat_in(mem_do),
	                        .mode_inv7b(int_mode_inv7b),
	                        .load(mulacc_load),
	                        .clr_sum(mulacc_clrsum),
	                        .ready(mulacc_ready),
	                        .sum_out(dac_pardata) );
	// DAT-VOL memory block
	mem512b my_mem( .clk(clock),
	                .rdaddr(mem_rdaddr),
	                .dataout(mem_do),
	                .wraddr({5'b0,bf_datnvol,bf_wraddr}),
	                .datain(bf_data),
	                .we(mem_we) );
	// syncing in asynchronous control signals
	always @(posedge clock)
	begin
		{ int_mode_8chans,sync_mode_8chans } <= { sync_mode_8chans, mode_8chans };
		{ int_mode_pan4ch,sync_mode_pan4ch } <= { sync_mode_pan4ch, mode_pan4ch };
		{ int_mode_inv7b ,sync_mode_inv7b  } <= { sync_mode_inv7b,  mode_inv7b  };
	end
	// load lrptr (left-right pointer) on dac_load pulse
	always @(posedge clock)
	begin
		if( dac_load )
			lrptr <= ~dac_leftright;
	end
	// make memory read address from chanptr and lrptr
	always @*
	begin
/*		mem_rdaddr[8:4] <= 5'd0;
		mem_rdaddr[3]   <= datnvol;
		mem_rdaddr[2]   <= int_mode_8chans ? chanptr[1] : 1'b0;
		mem_rdaddr[1]   <= lrptr;
		mem_rdaddr[0]   <= chanptr[0];*/
		mem_rdaddr[8:4] <= 5'd0;
		if( int_mode_8chans )
		begin
			mem_rdaddr[3]   <= datnvol;
			mem_rdaddr[2]   <= chanptr[1];
			mem_rdaddr[1]   <= lrptr;
			mem_rdaddr[0]   <= chanptr[0];
		end
		else if( int_mode_pan4ch )
		begin
			mem_rdaddr[3] <= datnvol;
			if( datnvol ) // sample data
			begin
				mem_rdaddr[2] <= 1'b0;
				mem_rdaddr[1] <= chanptr[1];
				mem_rdaddr[0] <= chanptr[0];
			end
			else // !datnvol: volumes
			begin
				mem_rdaddr[2]   <= chanptr[1]; // same as in 8 channel
				mem_rdaddr[1]   <= lrptr;
				mem_rdaddr[0]   <= chanptr[0];
			end
		end
		else //normal 4 channel mode
		begin
			mem_rdaddr[3]   <= datnvol;
			mem_rdaddr[2]   <= 1'b0;
			mem_rdaddr[1]   <= lrptr;
			mem_rdaddr[0]   <= chanptr[0];
		end
	end
	// handle mulacc_clrsum signal
	always @(posedge clock)
	begin
		if( dac_load )
			mulacc_clrsum <= 1'b1;     // set on dac_load pulse
		else if( mulacc_load )
			mulacc_clrsum <= 1'b0;     // clear on mulacc_load pulse, so only first mulacc cycle will read clrsum high
	end
	localparam START      = 0;
	localparam LOAD_VOL   = 1;
	localparam LOAD_VOL2  = 2;
	localparam LOAD_DAT   = 3;
	localparam LOAD_DAT2  = 4;
	localparam START_MUL  = 5;
	localparam WAIT_STOP  = 6;
	localparam LOOP       = 7;
	// FSM!
	always @(posedge clock)
	begin
		if( dac_load )
			cur_st <= START;
		else
			cur_st <= nxt_st;
	end
	always @*
	begin
		case( cur_st )
		START:
			nxt_st <= LOAD_VOL;
		LOAD_VOL:
			nxt_st <= LOAD_VOL2;
		LOAD_VOL2:
			nxt_st <= LOAD_DAT;
		LOAD_DAT:
			nxt_st <= LOAD_DAT2;
		LOAD_DAT2:
			nxt_st <= START_MUL;
		START_MUL:
			nxt_st <= WAIT_STOP;
		WAIT_STOP:
			if( (!mulacc_ready) || (chanptr == 2'd3) )
				nxt_st <= WAIT_STOP;
			else
				nxt_st <= LOOP;
		LOOP:
			nxt_st <= LOAD_VOL;
		endcase
	end
	always @(posedge clock)
	begin
		case( cur_st )
		START:
		begin
			chanptr <= 2'd0;
			mulacc_load <= 1'b0;
			mem_read <= 1'b0;
		end
		LOAD_VOL:
		begin
			mem_read <= 1'b1;
			datnvol <= 1'b0;
		end
		LOAD_VOL2:
		begin
			mem_read <= 1'b0;
		end
		LOAD_DAT:
		begin
			vol <= mem_do[5:0];
			mem_read <= 1'b1;
			datnvol <= 1'b1;
		end
		LOAD_DAT2:
		begin
			mem_read <= 1'b0;
			mulacc_load <= 1'b1;
		end
		START_MUL:
		begin
			mulacc_load <= 1'b0;
		end
//		WAIT_STOP:
		LOOP:
		begin
			chanptr <= chanptr + 2'd1;
		end
		endcase
	end
// controlling writes to memory
	// toggles
	always @(negedge clock)
		wrtgl1 <= in_wrtoggle;
	always @(posedge clock)
		{wrtgl3,wrtgl2} <= {wrtgl2,wrtgl1};
	// intermediate buffers and writing
	always @(posedge clock)
	begin
		if( wrtgl3!=wrtgl2 )
		begin
			bf_wraddr  <= in_wraddr;
			bf_data    <= in_data;
			bf_datnvol <= in_datnvol;
			do_write <= 1'b1;
		end
		else if( mem_we )
		begin
			do_write <= 1'b0;
		end
	end
	always @*
	begin
		mem_we <= do_write & (~mem_read);
	end
endmodule