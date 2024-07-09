module tb;
	reg clk;
	reg rst_n;
	// sync counter
	integer sync_cnt;
	bit pre_sync;
	// DUT connections
	wire [ 6:0] rd_addr;
	tri0 [31:0] rd_data;
	wire [ 6:0] wr_addr;
	wire [31:0] wr_data;
	wire        wr_stb;
	reg         sync_stb;
	reg  [31:0] ch_enas;
	wire [ 7:0] out_data;
	wire        out_stb_addr;
	wire        out_stb_mix;
	// channels memory
	reg [31:0] channels_mem [0:127];
	// test data
	channel_data chans[0:31];
	// generation fifos
	reg [7:0] mix_fifo[$];
	reg [7:0] addr_fifo[$];
	// init tb data structures
	initial
	begin : chans_create
		int i;
		for(i=0;i<32;i++) chans[i] = new;
		mix_fifo.delete();
		addr_fifo.delete();
	end
	// clock and reset gen
	initial
	begin
		rst_n = 1'b0;
		clk = 1'b1;
		forever #(`HALF_CLK) clk = ~clk;
	end
	initial
	begin
		#(1);
		repeat (3) @(posedge clk);
		rst_n <= 1'b1;
	end
	// sync generator
	initial
	begin
		sync_cnt = 0;
		pre_sync = 1'b0;
		sync_stb = 1'b0;
	end
	always @(posedge clk)
	if( !rst_n )
	begin
		sync_cnt <= 637;
		pre_sync <= 1'b0;
		sync_stb <= 1'b0;
	end
	else
	begin
		if( sync_cnt<(640-1) )
			sync_cnt <= sync_cnt + 1;
		else
			sync_cnt <= 0;
		pre_sync <= !sync_cnt;
		sync_stb <= pre_sync;
	end
	// channels memory emulator
	reg [31:0] rd_data_reg;
	assign rd_data = rd_data_reg;
	always @(posedge clk)
		rd_data_reg <= channels_mem[rd_addr];
	always @(posedge clk)
	if( wr_stb )
		channels_mem[wr_addr] <= wr_data;
	// fill queues off the output data
	always @(posedge clk)
	if( out_stb_mix ) mix_fifo.push_back(out_data);
	always @(posedge clk)
	if( out_stb_addr ) addr_fifo.push_back(out_data);
	// channel generator/checker
	always @(posedge clk)
	if( sync_stb )
	begin : chans
		int i;
		// if there was previous iteration, check it
		// init channels for new iteration
		for(i=0;i<32;i++)
		begin
			chans[i].init();
			channels_mem[i*4+0] = chans[i].get_word(0);
			channels_mem[i*4+1] = chans[i].get_word(1);
			channels_mem[i*4+2] = chans[i].get_word(2);
			channels_mem[i*4+3] = chans[i].get_word(3);
			chans[i].update();
		end
	end
	always @(posedge clk)
		ch_enas = 32'hFFFF_FFFF;
	// DUT
	chan_ctrl chan_ctrl
	(
		.clk  (clk  ),
		.rst_n(rst_n),
		.rd_addr(rd_addr),
		.rd_data(rd_data),
		.wr_addr(wr_addr),
		.wr_data(wr_data),
		.wr_stb (wr_stb ),
		.sync_stb(sync_stb),
		.ch_enas(ch_enas),
		.out_data    (out_data    ),
		.out_stb_addr(out_stb_addr),
		.out_stb_mix (out_stb_mix )
	);
endmodule