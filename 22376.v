module BankManager(
	dout,
	din,
	address,
	size,
	read_write,
	enable,
	bank,
	bank_enable,
	reset,
	clk
);
	`include "definition/Definition.v"
	localparam	ELEM_VALID	= 0;
	localparam	ELEM_SLOT	= 1;
	localparam	ELEM_LINK	= 2;
	output	reg			[WORD-1:0]								dout;
	input	wire		[WORD-1:0]								din;
	input	wire		[WORD-1:0]								address;
	input	wire		[LOGWORDBYTE-1:0]						size;
	input	wire												read_write;
	input	wire												enable;
	output	reg			[WORD-1:0]								bank;
	output	reg													bank_enable;
	input														reset;
	input														clk;
			reg													valid			[NUM_BANK-1:0];
			reg			[WORD-1:0]								slot			[NUM_BANK-1:0];
			reg			[WORD-1:0]								link			[NUM_BANK-1:0];
			reg													sel_section		[NUM_BANK-1:0];
			reg			[WORD-1:0]								stage;
	// under the standard configuration (8 banks and 7 pipeline stages + PC-only stage)
	// this initialization is inefficient since one bubble per round can be cut out and only one bank is used
	// to get the most efficient bootup set the next-to-last link to point back to 0 and/or enable
	// more banks working in multiprocessing mode with trusted code
	genvar i;
	generate
		for(i=0; i<NUM_BANK; i=i+1) begin : GENBANK
			always @(posedge clk) begin
				if(reset) begin
					// for bank 0:
					// turn on bank by default to enable bootstrapping
					// for other banks:
					// leave the other banks off at reset so they don't interfere with bank 0
					// until explicitly told to active with bank 0 at the root of that activation chain
					valid[i]	<= (i==0) ? ENABLE : DISABLE;	// enable only 0 by default
					slot[i]		<= i;							// for bank i
					link[i]		<= (i+1)%NUM_BANK;				// point to next slot
				end
				else begin
					if( sel_section[i] && ((address/(WORDBYTE*NUM_BANK))==ELEM_VALID) ) begin
						valid[i]	<= din;
					end
					else begin
						valid[i]	<= valid[i];
					end
					if( sel_section[i] && ((address/(WORDBYTE*NUM_BANK))==ELEM_SLOT) ) begin
						slot[i]	<= din;
					end
					else begin
						slot[i]	<= slot[i];
					end
					if( sel_section[i] && ((address/(WORDBYTE*NUM_BANK))==ELEM_LINK) ) begin
						link[i]	<= din;
					end
					else begin
						link[i]	<= link[i];
					end
				end
			end
			always @(*) begin
				sel_section[i]	<= (((address/WORDBYTE)%NUM_BANK)==i) && (read_write==WRITE) && (enable==ENABLE);
			end
		end
	endgenerate
	always @(posedge clk) begin
		if(reset) begin
			stage	<= 0;
		end
		else begin
			stage	<= link[stage];
		end
	end
	always @(*) begin
		bank		<= slot[stage];
		bank_enable	<= valid[stage];
	end
endmodule