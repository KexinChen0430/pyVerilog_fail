module StripedMemory(
	dout,
	din,
	address,
	size,
	read_write,
	enable,
	clk,
	reset
);
	`include "definition/Definition.v"
	parameter	MDIR		= BLANKFILE;
	// interface
	output	reg			[WORD-1:0]								dout;
	input				[WORD-1:0]								din;
	input				[WORD-1:0]								address;
	input				[LOGWORDBYTE-1:0]						size;		// [0 to WORDBYTE-1] maps to [1 to WORDBYTE]
	input														read_write;
	input														enable;
	input														clk;
	input														reset;
			wire		[WORD-1:0]								stripe_dout			[WORDBYTE-1:0];
			reg			[WORD-1:0]								stripe_din			[WORDBYTE-1:0];
			reg			[WORD-1:0]								stripe_address		[WORDBYTE-1:0];
			//reg		[0-1:0]									stripe_size			[WORDBYTE-1:0];
			reg													stripe_read_write	[WORDBYTE-1:0];
			reg													stripe_enable		[WORDBYTE-1:0];
			reg			[LOGWORDBYTE-1:0]						end_left;
			reg			[LOGWORDBYTE-1:0]						end_right;
			reg			[LOGWORDBYTE-1:0]						off_addr			[WORDBYTE-1:0];
			reg			[WORD-1:0]								div_addr			[WORDBYTE-1:0];
			reg			[LOGWORDBYTE-1:0]						iselect				[WORDBYTE-1:0];
			reg			[LOGWORDBYTE-1:0]						oselect				[WORDBYTE-1:0];
			reg			[BYTE-1:0]								breakout_din		[WORDBYTE-1:0];
			reg			[LOGWORDBYTE-1:0]						d_size;
			reg			[LOGWORDBYTE-1:0]						d_oselect			[WORDBYTE-1:0];
	always @(posedge clk) begin
		if(reset) begin
			d_size	<= 0;
		end
		else begin
			d_size	<= size;
		end
	end
	always @(*) begin
		end_left	<= ((address+0   ) % WORDBYTE);
		end_right	<= ((address+size) % WORDBYTE);
	end
	genvar i;
	generate
		for(i=0; i<WORDBYTE; i=i+1) begin : MEMGEN
			if(MDIR != BLANKFILE) begin
				Memory #(
					.MWIDTH			(BYTE				),	// 8-bit word
					.LOGWORDBYTE	(LOGWORDBYTE		),	// with 32-bit interfaces
					.LOGMEM			(LOGMEM-LOGWORDBYTE	)	// divide by 8 for the 8 banks
				)
				mem (
					.dout		(stripe_dout[i]			),
					.din		(stripe_din[i]			),
					.address	(stripe_address[i]		),
					.size		(0						),
					.read_write	(stripe_read_write[i]	),
					.enable		(stripe_enable[i]		),
					.clk		(clk					),
					.reset		(reset					)
				);
			end
			else begin
				Memory #(
					.MFILE			(BLANKFILE			),	// no input file
					.MWIDTH			(BYTE				),	// 8-bit word
					.LOGWORDBYTE	(LOGWORDBYTE		),	// with 32-bit interfaces
					.LOGMEM			(LOGMEM-LOGWORDBYTE	)	// divide by 8 for the 8 banks
				)
				mem (
					.dout		(stripe_dout[i]			),
					.din		(stripe_din[i]			),
					.address	(stripe_address[i]		),
					.size		(0						),
					.read_write	(stripe_read_write[i]	),
					.enable		(stripe_enable[i]		),
					.clk		(clk					),
					.reset		(reset					)
				);
			end
			always @(*) begin
				stripe_address[i]		<= div_addr[i];
				stripe_read_write[i]	<= read_write;
				stripe_enable[i]		<= enable &&
												(
													(end_left <= end_right) ?
														((end_left<=i) && (i<=end_right)) :
														((end_left<=i) || (i<=end_right))
												);
				off_addr[i]				<= end_left <= i ? i-end_left : (WORDBYTE-end_left)+i;
				div_addr[i]				<= (address+off_addr[i]) / WORDBYTE;
				stripe_din[i]			<= breakout_din[iselect[i]];
				iselect[i]				<= (i + WORDBYTE - end_left) % WORDBYTE;
				oselect[i]				<= (i + WORDBYTE + end_left) % WORDBYTE;
				breakout_din[i]			<= din[ (BYTE*(i+1))-1 : (BYTE*(i+0)) ];
				dout[ (BYTE*(i+1))-1 : (BYTE*(i+0))-0 ]	<= (i<=d_size) ? stripe_dout[d_oselect[i]] : 0;
			end
			always @(posedge clk) begin
				if(reset)	begin	d_oselect[i]	<= 0;			end
				else		begin	d_oselect[i]	<= oselect[i];	end
			end
		end
	endgenerate
endmodule