module PS2MemoryWrapper(
	dout,
	din,
	address,
	size,
	read_write,
	enable,
	interrupt,
	ps2_clock,
	ps2_data,
	reset,
	clk
);
	`include "definition/Definition.v"
	output	reg			[WORD-1:0]								dout;
	input	wire		[WORD-1:0]								din;
	input	wire		[WORD-1:0]								address;
	input	wire		[LOGWORDBYTE-1:0]						size;
	input	wire												read_write;
	input	wire												enable;
	output	reg													interrupt;
	inout														ps2_clock;
	inout														ps2_data;
			wire		[BYTE-1:0]								rx_data;
	input														reset;
	input														clk;
			reg			[WORD-1:0]								key_normal;
			wire												rx_done;
	// Memory interface
	always @(posedge clk) begin
		if(reset) begin
			dout	<= 0;
		end
		else if((address==0) && (enable==ENABLE) && (read_write==READ)) begin
			dout	<= key_normal;
		end
	end
	// Local definitions
	localparam UNSPECIAL = 0;
	localparam SPECIAL = 224;
	localparam EXTRA = 255;
	localparam BREAK = 240;
	// Key disambiguation
	reg				ignore;
	reg [WORD-1:0]	specialc;
	reg				breakc;
	// Key translation
	reg	[WORD-1:0]	try_normalized;
	reg				try_interrupt;
	reg				try_ignore;
	always @(posedge clk) begin
		if(reset) begin
			ignore		<= 0;
			specialc	<= UNSPECIAL;
			breakc		<= 0;
		end
		else begin
			if(!rx_done) begin
				ignore		<= ignore;
				specialc	<= specialc;
				breakc		<= breakc;
			end
			else begin
				case(rx_data)
					SPECIAL: begin
						ignore		<= ignore;
						specialc	<= SPECIAL;
						breakc		<= 0;
					end
					EXTRA: begin
						ignore		<= ignore;
						specialc	<= EXTRA;
						breakc		<= 0;
					end
					BREAK: begin
						ignore		<= ignore;
						specialc	<= specialc;
						breakc		<= 1;
					end
					default: begin
						ignore		<= try_ignore;
						specialc	<= UNSPECIAL;
						breakc		<= 0;
					end
				endcase
			end
		end
	end
	// In the lookup table determine the normalized key
	always @(*) begin
		if(!rx_done) begin
			try_normalized	<= 0;
			try_interrupt	<= 0;
			try_ignore		<= 0;
		end
		else begin
			`include "meta-include/Scan-Code.meta.v"
		end
	end
	// Combine all the information and send an interrupt if necessary
	always @(posedge clk) begin
		if(reset) begin
			interrupt	<= 0;
			key_normal	<= 0;
		end
		else if(try_interrupt) begin
			interrupt	<= !ignore;
			key_normal	<= (breakc<<(WORD-1)) | try_normalized;
		end
		else begin
			interrupt	<= 0;
			key_normal	<= key_normal;
		end
	end
	PS2 hardware(
		.ps2_clock(ps2_clock),
		.ps2_data(ps2_data),
		.rx_data(rx_data),
		.rx_done(rx_done),
		.reset(reset),
		.clk(clk)
	);
endmodule