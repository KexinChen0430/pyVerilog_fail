module
	// does not hurt at any time (yet), so attached forever
	spitest_print spitest_print(
		.sdclk (sdclk ),
		.sddi  (sddi  ),
		.sddo  (sddo  ),
		.sdcs_n(sdcs_n)
	);
	// spitest AVR imitator
	spitest_avr spitest_avr(
		.spick  (spick  ),
		.spics_n(spics_n),
		.spido  (spido  ),
		.spidi  (spidi  )
	);
`else
	assign sddi = 1'b1;
	assign spics_n = 1'b1;
	assign spick   = 1'b0;
	assign spido   = 1'b1;
`endif
	// set up breakpoint
/*
	wire bpt = za===16'h3FEC && zmreq_n===1'b0 && zrd_n===1'b0 && zm1_n===1'b0;
	initial
	begin
		#(1_800_000_000);
		@(posedge fclk);
		forever
		begin
			@(posedge bpt);
			$display("Stop at breakpoint");
			$stop;
		end
	end
*/
	// log INI command
	wire [15:0] #(0.1) dza;
	wire [ 7:0] #(0.1) dzw;
	wire [ 7:0] #(0.1) dzr;
	typedef enum {FETCH,MRD,MWR,IORD,IOWR,IACK} cycle_t;
	cycle_t curr_cycle;
	cycle_t cycles[0:3];
	logic [15:0] addrs[0:3];
	logic [ 7:0] wdata[0:3];
	logic [ 7:0] rdata[0:3];
	wire is_fetch, is_mrd, is_mwr, is_iord, is_iowr, is_iack;
	wire is_any;
	assign dza = za;
	assign dzw = zd;
	assign dzr = zd_dut_to_z80;
	assign is_fetch = zm1_n===1'b0 && zmreq_n===1'b0 &&                   zrd_n===1'b0;
	assign is_mrd   = zm1_n===1'b1 && zmreq_n===1'b0 &&                   zrd_n===1'b0;
	assign is_mwr   =                 zmreq_n===1'b0 &&                                   zwr_n===1'b0;
	assign is_iord  =                                   ziorq_n===1'b0 && zrd_n===1'b0;
	assign is_iowr  =                                   ziorq_n===1'b0 &&                 zwr_n===1'b0;
	assign is_iack  = zm1_n===1'b0 &&                   ziorq_n===1'b0;
	assign is_any = is_fetch || is_mrd || is_mwr || is_iord || is_iowr || is_iack;
	always @(negedge is_any)
	begin : remember
		int i;
		for(i=1;i<4;i++)
		begin
			addrs [i]  <= addrs [i-1];
			cycles[i]  <= cycles[i-1];
			wdata [i]  <= wdata [i-1];
			rdata [i]  <= rdata [i-1];
		end
		addrs[0] <= dza;
		cycles[0] <= curr_cycle;
		wdata[0] <= dzw;
		rdata[0] <= dzr;
	end
	always @(posedge is_any)
	if(      is_fetch ) curr_cycle <= FETCH;
	else if( is_mrd )   curr_cycle <= MRD;
	else if( is_mwr )   curr_cycle <= MWR;
	else if( is_iord )  curr_cycle <= IORD;
	else if( is_iowr )  curr_cycle <= IOWR;
	else if( is_iack )  curr_cycle <= IACK;
	else
	begin
		$display("Spurious cycle detect!");
		$stop;
	end
	// actual break
	always @(negedge is_any)
	begin
		if( cycles[3]==FETCH && addrs[3][15:0 ]==16'h3FEC && rdata[3]==8'hED &&
		    cycles[2]==FETCH &&                              rdata[2]==8'hA2 &&
		    cycles[1]==IORD  &&
		    cycles[0]==MWR   && addrs[0][15:14]== 2'd0
		)
		begin
			$display("trd INI caught! port=%04x, wraddr=%04x, time=%t",addrs[1],addrs[0],$time());
		end
	end
	// timestamps
	always
	begin
		$display("Running for %t ms",$time()/1000000000.0);
		#1000000.0;
	end
	// generate nmi after 2s
	initial
	begin
		#2000000000.0;
		force DUT.set_nmi[0] = 1'b1;
		#1000000.0;
		release DUT.set_nmi[0];
	end
	task put_byte;
		input [21:0] addr;
		input [ 7:0] data;
		reg [19:0] arraddr;
		begin
			arraddr = { addr[21:12], addr[11:2] };
			case( addr[1:0] ) // chipsel, bytesel
			2'b00: tb.dramko1.array[arraddr][15:8] = data;
			2'b01: tb.dramko1.array[arraddr][ 7:0] = data;
			2'b10: tb.dramko2.array[arraddr][15:8] = data;
			2'b11: tb.dramko2.array[arraddr][ 7:0] = data;
			endcase
		end
	endtask
	task put_byte_48k
	(
		input [15:0] addr,
		input [ 7:0] data
	);
		case( addr[15:14] )
			2'b01: put_byte(addr-16'h4000 + 22'h14000,data);
			2'b10: put_byte(addr-16'h8000 + 22'h08000,data);
			2'b11: put_byte(addr-16'hc000 + 22'h00000,data);
		endcase
	endtask
endmodule