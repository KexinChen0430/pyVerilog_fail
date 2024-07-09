module system(clk, rstn, datain_ch0, datain_ch1, datain_ch2, datain_ch3, serialout, testout0, testout1, testout2, testout3);
	input clk;				// Counter and fifo clock
	input rstn;				// Global reset, low true
	input datain_ch0;		// Channel 0 Data bit input
	input datain_ch1;		// Channel 1 Data bit input
	input datain_ch2;		// Channel 2 Data bit input
	input datain_ch3;		// Channel 3 Data bit input
	output serialout;   	// Async serial data out
	output testout0;
	output testout1;
	output testout2;
	output testout3;
	wire unload_ch0;
	wire clearoverrun_ch0;
	wire attention_ch0;
	wire overrun_ch0;
	wire unload_ch1;
	wire clearoverrun_ch1;
	wire attention_ch1;
	wire overrun_ch1;
	wire unload_ch2;
	wire clearoverrun_ch2;
	wire attention_ch2;
	wire overrun_ch2;
	wire unload_ch3;
	wire clearoverrun_ch3;
	wire attention_ch3;
	wire overrun_ch3;
	wire txdone;
	wire nextbyte;
	wire txstart;
	wire overrun_cur;
	wire overrun_next;
	wire next_scan_channel;
	wire [2:0] sys_sm_cur;
	wire [2:0] sys_sm_next;
	wire [2:0] byteaddr;
	wire [1:0] channel_cur;
	wire [1:0] channel_scan;
	wire [1:0] channel_next;
	wire [7:0] txdata;
	wire [7:0] dataout_ch0;
	wire [7:0] dataout_ch1;
	wire [7:0] dataout_ch2;
	wire [7:0] dataout_ch3;
	wire [7:0] dataout;
	wire [7:0] hexchar;
	wire [3:0] hexnybble;
	wire [62:0] count;
	// Instantiate free running counter
	counter ctr63(
		.clk(clk),
		.rstn(rstn),
		.up(1'b1),
		.down(1'b0),
		.count(count)
		);
	defparam ctr63.WIDTH = 63;
	// Scan counter
	counter ctr2(
		.clk(clk),
		.rstn(rstn),
		.up(next_scan_channel),
		.down(1'b0),
		.count(channel_scan)
		);
	defparam ctr2.WIDTH = 2;
	// Instantiate channel 0
	channel ch0(
		.clk(clk),
		.rstn(rstn),
		.datain(datain_ch0),
		.unload(unload_ch0),
		.counterin(count),
		.byteaddr(~byteaddr), // Complemented so high nybbles get sent first
		.clearoverrun(clearoverrun_ch0),
		.overrun(overrun_ch0),
		.attention(attention_ch0),
		.dataout(dataout_ch0),
		.testouta(testout0),
		.testoutb(testout2)
		);
	// Instantiate channel 1
	channel ch1(
		.clk(clk),
		.rstn(rstn),
		.datain(datain_ch1),
		.unload(unload_ch1),
		.counterin(count),
		.byteaddr(~byteaddr), // Complemented so high nybbles get sent first
		.clearoverrun(clearoverrun_ch1),
		.overrun(overrun_ch1),
		.attention(attention_ch1),
		.dataout(dataout_ch1),
		.testouta(testout1),
		.testoutb(testout3)
		);
		// Instantiate channel 2
	channel ch2(
		.clk(clk),
		.rstn(rstn),
		.datain(datain_ch2),
		.unload(unload_ch2),
		.counterin(count),
		.byteaddr(~byteaddr), // Complemented so high nybbles get sent first
		.clearoverrun(clearoverrun_ch2),
		.overrun(overrun_ch2),
		.attention(attention_ch2),
		.dataout(dataout_ch2)
		);
		// Instantiate channel 3
	channel ch3(
		.clk(clk),
		.rstn(rstn),
		.datain(datain_ch3),
		.unload(unload_ch3),
		.counterin(count),
		.byteaddr(~byteaddr), // Complemented so high nybbles get sent first
		.clearoverrun(clearoverrun_ch3),
		.overrun(overrun_ch3),
		.attention(attention_ch3),
		.dataout(dataout_ch3)
		);
	// Instantiate channel multiplexer
	channel_mux cmux0(
		.ch0(dataout_ch0),
		.ch1(dataout_ch1),
		.ch2(dataout_ch2),
		.ch3(dataout_ch3),
		.channel(channel_cur),
		.dataout(dataout)
		);
	// Instantiate byte counter
	counter bc0(
		.clk(clk),
		.rstn(rstn),
		.up(nextbyte),
		.down(1'b0),
		.count(byteaddr)
		);
	defparam bc0.WIDTH = 3;
	// Instantiate nybble to ascii hex converter
	nybbletohexdigit ntohd0(
		.nybble(hexnybble),
		.digit(hexchar)
		);
	// Instantiate combinatorial part of state machine
	sys_sm_comb ssc0(
		.sys_sm_cur(sys_sm_cur),
		.channel_cur(channel_cur),
		.channel_scan(channel_scan),
		.byteaddr(byteaddr),
		.channel_data(dataout),
		.attention_ch0(attention_ch0),
		.attention_ch1(attention_ch1),
		.attention_ch2(attention_ch2),
		.attention_ch3(attention_ch3),
		.overrun_cur(overrun_cur),
		.overrun_ch0(overrun_ch0),
		.overrun_ch1(overrun_ch1),
		.overrun_ch2(overrun_ch2),
		.overrun_ch3(overrun_ch3),
		.utxdone(txdone),
		.hexchar(hexchar),
		.clearoverrun_ch0(clearoverrun_ch0),
		.clearoverrun_ch1(clearoverrun_ch1),
		.clearoverrun_ch2(clearoverrun_ch2),
		.clearoverrun_ch3(clearoverrun_ch3),
		.txstart(txstart),
		.nextbyte(nextbyte),
		.overrun_next(overrun_next),
		.unload_ch0(unload_ch0),
		.unload_ch1(unload_ch1),
		.unload_ch2(unload_ch2),
		.unload_ch3(unload_ch3),
		.next_scan_channel(next_scan_channel),
		.sys_sm_next(sys_sm_next),
		.channel_next(channel_next),
		.txdata(txdata),
		.hexnybble(hexnybble)
		);
	// Instantiate sequential part of state machine
	sys_sm_seq sss0(
		.clk(clk),
		.rstn(rstn),
		.overrun_next(overrun_next),
		.sys_sm_next(sys_sm_next),
		.channel_next(channel_next),
		.overrun_cur(overrun_cur),
		.sys_sm_cur(sys_sm_cur),
		.channel_cur(channel_cur)
		);
	// Instantiate a UART Transmitter
	utx utx0(
		.clk(clk),
		.rstn(rstn),
		.load(txstart),
		.inbyte(txdata),
		.serialout(serialout),
		.done(txdone)
		);
endmodule