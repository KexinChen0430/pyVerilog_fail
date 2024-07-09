module fifo_addr
  (
   wr_clk,
   wr_en,
   wr_addr,
   wr_en_ram,
   wr_full,
   wr_almost_full,
   wr_full_count,  // amount can write until full
   rd_clk,
   rd_en,
   rd_addr,
   rd_en_ram,
   rd_empty,
   rd_empty_count,  // amount can read until empty
   fifo_reset
);
   // removed CNTR_W, because counters will be 1 bit more than addresses
   parameter ADDR_W = 5;           // number of bits wide for address
   parameter ALMOSTFULL_LIMIT = 4; // number of entries left before almost full active
   parameter DELAY_READ = 0; // Set to 1 when using blockram (1 clock delay to
                             // get data back), set to 0 when using selectram
   parameter ONECLOCK = 1'b0; // set to 1 to get rid of resync logic.
   parameter GEN_RDCOUNT = 1;
   parameter GEN_WRCOUNT = 1;
   parameter GEN_WRALMOSTFULL = 1;
   parameter IGNORE_FULL_WR = 1'b0; // set to 1 to allow WR to go through when FULL is asserted (breaks the FIFO, but allows much higher clock rates). WARNING: setting this parameter can make the FIFO misbehave
   parameter IGNORE_EMPTY_RD = 1'b0; // set to 1 to allow RD to go through when EMPTY is asserted (breaks the FIFO, but allows much higher clock rates). WARNING: setting this parameter can make the FIFO misbehave
   parameter FAST_WR_TO_RD = 1'b0; // set to 1 to allow RD the following clk after WR
   input wr_clk;
   input wr_en;
   output [ADDR_W-1:0] wr_addr;
   output wr_en_ram;
   output wr_full;
   output wr_almost_full;
   output [ADDR_W:0] wr_full_count;  // amount can write until full
   input rd_clk;
   input rd_en;
   output [ADDR_W-1:0] rd_addr;
   output rd_empty;
   output [ADDR_W:0] rd_empty_count;  // amount can read until empty
   output rd_en_ram;
   input fifo_reset;
// Reg and wire declarations
   reg allempty_rdclk;
   reg allfull_wrclk;
   reg wr_almost_full;
   wire read_allow, write_allow;
   reg [ADDR_W:0]    read_address;
   wire [ADDR_W:0]   read_address_plus1 /* synthesis syn_keep=1 */;
   reg [ADDR_W:0]    read_addrgray      /* synthesis syn_keep=1 */;
   reg [ADDR_W:0]    write_address;
   reg [ADDR_W:0]    write_addrgray /* synthesis syn_keep=1 */;
// Calculation of empty count
   reg [ADDR_W:0]    write_address_r;
   wire              write_equals_read_noread   /* synthesis syn_keep=1 */;
   wire              write_equals_read_withread   /* synthesis syn_keep=1 */;
   wire [ADDR_W:0]   write_minus_read_noread   /* synthesis syn_keep=1 */;
   wire [ADDR_W:0]   write_minus_read_withread /* synthesis syn_keep=1 */;
   reg [ADDR_W:0]    rd_empty_count;
   // Calculation of full count
   reg [ADDR_W:0]    read_address_w;
   wire [ADDR_W:0]   read_minus_write;
   reg [ADDR_W:0]    wr_full_count;
   genvar            ra_cnt;
   //reg               wr_en_ram_d;
// output assignments
	reg pre_first_read;
	wire reset_rdclk;
	always @(posedge rd_clk or posedge reset_rdclk) begin
		if (reset_rdclk) begin
			pre_first_read <= 1'b1;
		end else begin
			//if (read_allow)
				pre_first_read <= 1'b0;
		end
	end
	assign wr_full        = allfull_wrclk;
	assign rd_empty       = allempty_rdclk;
	assign wr_en_ram      = write_allow | fifo_reset; // 7series rams have reset assertion issues for the first read/write, so do a bunch of extra writes.
	//assign rd_en_ram      = (read_allow ? (~write_equals_read_withread) : (allempty_rdclk & (~write_equals_read_noread) )) | reset_rdclk; // 7series RAMS have reset assertion issues for the first read/write, so do a bunch of extra reads.
	assign rd_en_ram      = (read_allow ? (~write_equals_read_withread) : (allempty_rdclk & (~write_equals_read_noread) )) | ((~reset_rdclk) & pre_first_read) | (wr_en & FAST_WR_TO_RD[0] & ONECLOCK[0]); // 7series RAMS have reset assertion issues for the first read/write, so do a bunch of extra reads.
   //always @ (posedge wr_clk or posedge fifo_reset) begin
     //if (fifo_reset) begin
      //wr_en_ram_d <= 'b0;
     //end else begin
      //wr_en_ram_d <= wr_en_ram;
     //end
   //end
   // when blockram, output next address 1 clock cycle early
   // to compensate for 1 clock cycle out of block ram
   assign read_address_plus1 = read_address + 1'b1;
   assign rd_addr = (DELAY_READ ? (read_allow ? read_address_plus1[ADDR_W-1:0] : read_address[ADDR_W-1:0] ) : read_address[ADDR_W-1:0]);
   assign wr_addr = write_address[ADDR_W-1:0];
/**********************************************************\
\**********************************************************/
  `ifndef NO_OVERFLOW_CHECK
    (* dont_touch = "true", keep = "true" *) reg overflow;
    always @ (posedge wr_clk or posedge fifo_reset) begin
      if(fifo_reset) begin
        overflow <= 'b0;
      end else begin
        if(wr_en & wr_full) begin
          overflow <= 'b1;
    /* synthesis translate_off*/
      $display("WARNING: %m: writing to a full fifo: time=%t",$time);
      if (IGNORE_FULL_WR) begin
        $display("ERROR: %m: Writing to a FULL FIFO: IGNORE_FULL_WR=1, FULL=1, WR=1, time=%t",$time);
        $stop;
      end
    /* synthesis translate_on*/
        end
      end
    end
  `endif
   integer rg_cnt;
	reset_resync i_rst (
			.clk_in(wr_clk),
			.rst_in(fifo_reset),
			.clk_out(rd_clk),
			.rst_out(reset_rdclk)
	);
	always @(posedge rd_clk or posedge reset_rdclk) begin
		if (reset_rdclk) begin
			read_address <= 0;
			read_addrgray <= 0;
		end else begin
  /* synthesis translate_off*/
			if ( (rd_en!==1'b0) && (rd_en!==1'b1) ) begin
				$display("ERROR: rd_en=%x not valid: %m time=%t",rd_en,$time);
				$stop;
			end
  /* synthesis translate_on*/
			if (read_allow)
				read_address <= read_address_plus1;
			read_addrgray[ADDR_W] <= read_address[ADDR_W];
			for (rg_cnt=0;rg_cnt<ADDR_W;rg_cnt=rg_cnt+1)
				read_addrgray[rg_cnt] <= read_address[rg_cnt+1] ^ read_address[rg_cnt];
  /* synthesis translate_off*/
			if ((IGNORE_EMPTY_RD!=0) && (rd_en==1'b1) && (allempty_rdclk==1'b1)) begin
				$display("ERROR: %m: Reading from an EMPTY FIFO: IGNORE_EMPTY_RD=1, EMPTY=1, RD=1, time=%t",$time);
				$stop;
			end
  /* synthesis translate_on*/
		end
	end
/**********************************************************\
\**********************************************************/
   integer wg_cnt;
	always @(posedge wr_clk or posedge fifo_reset) begin
		if (fifo_reset) begin
   			write_address <= 'b0;
			write_addrgray <= 0;
		end else begin
  /* synthesis translate_off*/
			if ( ($time>0) && (wr_en!==1'b0) && (wr_en!==1'b1) ) begin
				$display("ERROR: wr_en=%x not valid: %m time=%t",wr_en,$time);
				//$stop;
			end
  /* synthesis translate_on*/
			if (write_allow)
				write_address <= write_address + 1'b1;
			write_addrgray[ADDR_W] <= write_address[ADDR_W];
			for(wg_cnt=0;wg_cnt<ADDR_W;wg_cnt=wg_cnt+1)
				write_addrgray[wg_cnt] <= write_address[wg_cnt+1] ^ write_address[wg_cnt];
		end
	end
/**********************************************************\
\**********************************************************/
   assign read_allow  = rd_en & (IGNORE_EMPTY_RD[0] | (~allempty_rdclk) | (wr_en & FAST_WR_TO_RD[0] & ONECLOCK[0]));
   assign write_allow = wr_en & (IGNORE_FULL_WR[0] | (~allfull_wrclk));
/**********************************************************\
\**********************************************************/
generate
if(ONECLOCK==0) begin : gen_write_address_async
  // We don't want to declare ASYNC_REGs that are unused because they will act as a keep in synthesis and a don't touch in place/route
  (* ASYNC_REG = "TRUE" *) reg [ADDR_W:0]    write_addrgray_m /* synthesis syn_keep=1 */;
  (* ASYNC_REG = "TRUE" *) reg [ADDR_W:0]    write_addrgray_r /* synthesis syn_keep=1 */;
	always @(posedge rd_clk or posedge reset_rdclk) begin
		if (reset_rdclk) begin
			write_addrgray_m <= 'b0;
			write_addrgray_r <= 'b0;
		end else begin
			write_addrgray_m <= write_addrgray;
			write_addrgray_r <= write_addrgray_m;
		end
	end
  // Gray-code conversion to binary
   genvar wa_cnt;
   // ADDS 1 CLOCK CYCLE DELAY THROUGH FIFO TO EMPTY FLAG, SPLITTING LOGIC ACROSS TWO CLOCKS
   wire [ADDR_W:0]   write_address_c;
   assign write_address_c[ADDR_W] = write_addrgray_r[ADDR_W];
   for (wa_cnt=0;wa_cnt <ADDR_W;wa_cnt=wa_cnt+1) begin:gen_wr_addr_c
     assign write_address_c[wa_cnt] = ^(write_addrgray_r[ADDR_W:0] >> wa_cnt);
   end
`ifdef BETTER_TIMING
   always @(posedge rd_clk or posedge reset_rdclk)
     if (reset_rdclk)
       write_address_r <= 0;
	 else begin
`else
   // CUTS OUT 1 CLOCK CYCLE DELAY THROUGH FIFO TO EMPTY FLAG, BUT MORE LOGIC IN THIS CLOCK CYCLE
   always @(*) begin
`endif
      write_address_r <= write_address_c;
   end
//end else begin : gen_write_address_sync
//  always @ (*)
//    write_address_r <= 'bx;
end
endgenerate
	always @(posedge rd_clk or posedge reset_rdclk) begin
		if (reset_rdclk) begin
   			if (GEN_RDCOUNT == 1)
				rd_empty_count <= 0;
			allempty_rdclk <= 1;
		end else begin
   			if (GEN_RDCOUNT == 1)
				rd_empty_count <= (read_allow ? write_minus_read_withread : write_minus_read_noread );
			allempty_rdclk <= (read_allow ? (write_minus_read_withread==0) : write_equals_read_noread) & (~(wr_en & FAST_WR_TO_RD[0] & ONECLOCK[0]));
		end
	end
  /* synthesis translate_off*/
	always @(*) begin
		if (GEN_RDCOUNT == 0) begin
      rd_empty_count <= 'b0;
      `ifndef IVERILOG_SIM
        rd_empty_count <= {ADDR_W+1{1'bx}};
      `endif
    end
  end
  /* synthesis translate_on*/
  // Check that ONECLOCK is set correctly
  // synthesis translate_off
  initial begin
    if (ALMOSTFULL_LIMIT+1 > (1 << ADDR_W)) begin
		$display("ERROR: %m ALMOSTFULL_LIMIT set larger than FIFO");
		$stop;
    end
    if ((ONECLOCK==0) && (GEN_WRALMOSTFULL!=0) && (ALMOSTFULL_LIMIT+12 > (1 << ADDR_W)) && (ALMOSTFULL_LIMIT*2 > (1 << ADDR_W)) ) begin
		$display("WARNING: %m ALMOSTFULL_LIMIT=%d should be at least 12 less than fifo depth=%d for ASYNC FIFOs",ALMOSTFULL_LIMIT,(1<<ADDR_W));
		$stop;
    end
    wait(fifo_reset===1'b0);
    repeat(100) @(posedge rd_clk);
    repeat(100) begin
      @(posedge rd_clk);
      if(ONECLOCK && (rd_clk!=wr_clk)) begin
        $display("%m: ERROR: ONECLOCK parameter is not set correctly; async domains detected!");
        $stop;
      end
      @(posedge wr_clk);
      if(ONECLOCK && (rd_clk!=wr_clk)) begin
        $display("%m: ERROR: ONECLOCK parameter is not set correctly; async domains detected!");
        $stop;
      end
    end
  end
  // synthesis translate_on
		// Pre-calculate the emptiness with and without read, and mux in
		// read as the very last stage.
   assign write_minus_read_noread = ((ONECLOCK ? write_address : write_address_r ) - read_address);
   assign write_equals_read_noread = ((ONECLOCK ? write_address : write_address_r ) == read_address);
   assign write_minus_read_withread = ((ONECLOCK ? write_address : write_address_r ) - read_address - 1'b1);
   assign write_equals_read_withread = (write_minus_read_withread==0);
/**********************************************************\
\**********************************************************/
generate
if(ONECLOCK==0) begin : gen_read_address_async
  // We don't want to declare ASYNC_REGs that are unused because they will act as a keep in synthesis and a don't touch in place/route
  (* ASYNC_REG = "TRUE" *) reg [ADDR_W:0]    read_addrgray_m  /* synthesis syn_keep=1 */;
  (* ASYNC_REG = "TRUE" *) reg [ADDR_W:0]    read_addrgray_md /* synthesis syn_keep=1 */;
   wire [ADDR_W:0]   read_address_c;
  always @(posedge wr_clk or posedge fifo_reset) begin
    if (fifo_reset) begin
       read_addrgray_m <= 'b0;
       read_addrgray_md <= 'b0;
    end else begin
       read_addrgray_m <= read_addrgray;
       read_addrgray_md <= read_addrgray_m;
    end
  end
  // Gray-code conversion to binary
  // ADDS 1 CLOCK CYCLE DELAY THROUGH FIFO TO FULL FLAG, SPLITTING LOGIC ACROSS TWO CLOCKS
  assign read_address_c[ADDR_W] = read_addrgray_md[ADDR_W];
  for(ra_cnt=0;ra_cnt<ADDR_W;ra_cnt=ra_cnt+1) begin:gen_rd_addr_c
    assign read_address_c[ra_cnt] = (^(read_addrgray_md[ADDR_W:0]>>ra_cnt) );
  end
`ifdef BETTER_TIMING
  always @(posedge wr_clk or posedge fifo_reset)
  if (fifo_reset) begin
    read_address_w <= 0;
  end else begin
`else
  // CUTS OUT 1 CLOCK CYCLE DELAY THROUGH FIFO TO FULL FLAG, BUT MORE LOGIC IN THIS CLOCK CYCLE
  always @(*) begin
`endif
    read_address_w <= read_address_c;
  end
//end else begin : gen_read_address_sync
//  always @(*)
//    read_address_w <= 'bx;
end
endgenerate
   // FULL COUNT
	always @(posedge wr_clk or posedge fifo_reset) begin
		if (fifo_reset) begin
			if (GEN_WRCOUNT==1) begin
				wr_full_count <= 0;
				wr_full_count[ADDR_W] <= 1;
			end
			if (GEN_WRALMOSTFULL==1) begin
				wr_almost_full <= 1'b0;
			end
			allfull_wrclk <= 1'b0;
		end else begin
			if (GEN_WRCOUNT==1) begin
				wr_full_count <= read_minus_write;
			end
			if (GEN_WRALMOSTFULL==1) begin
				wr_almost_full <= (read_minus_write < ALMOSTFULL_LIMIT);
			end
			allfull_wrclk <= (read_minus_write == 0);
		end
	end
  /* synthesis translate_off*/
  always @(*) begin
		if (GEN_WRCOUNT == 0) begin
      wr_full_count <= 'b0;
      `ifndef IVERILOG_SIM
        wr_full_count <= {ADDR_W+1{1'bx}};
      `endif
    end
    if (GEN_WRALMOSTFULL == 0) begin
      wr_almost_full <= 'b0;
      `ifndef IVERILOG_SIM
        wr_almost_full <= 'bx;
      `endif
    end
  end
  /* synthesis translate_on*/
    assign read_minus_write = ((ONECLOCK ? {~read_address[ADDR_W],read_address[ADDR_W-1:0]} : {~read_address_w[ADDR_W],read_address_w[ADDR_W-1:0]}) - write_address - {{(ADDR_W-1){1'b0}}, write_allow});
  /* synthesis translate_off*/
   always @(posedge wr_clk)
	   if (~fifo_reset) begin
		   if ( wr_en & wr_full )
			   $display("Warning: Writing to a full fifo %m: time=%t",$time);
	   end
  /* synthesis translate_on*/
	   /*
   always @(posedge rd_clk)
	   if (~reset_rdclk) begin
		   if ( rd_en & rd_empty )
			   $display("Warning: Reading from an empty fifo %m: time=%t",$time);
	   end
	   */
endmodule