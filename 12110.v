module deepgate_top(
	// 50MHz clock input
	input clk50MHz,
	// Input from reset button (active low)
	input rst_n,
	// cclk input from AVR, high when AVR is ready
	input cclk,
	// Outputs to the 8 onboard LEDs
	output wire [7:0] led,
	// AVR SPI connections
	output spi_miso,
	input spi_ss,
	input spi_mosi,
	input spi_sck,
	// AVR ADC channel select
	output [3:0] spi_channel,
	// Serial connections
	input 	avr_tx, 			// AVR Tx => FPGA Rx
	output 	avr_rx, 			// AVR Rx => FPGA Tx
	input 	avr_rx_busy, 	// AVR Rx buffer full
	//SDRAM interface
	output sdram_clk,
	output sdram_cle,
	output sdram_dqm,
	output sdram_cs,
	output sdram_we,
	output sdram_cas,
	output sdram_ras,
	output [1:0] sdram_ba,
	output [12:0] sdram_a,
	inout [7:0] sdram_dq
);
`include "param_include.v"
wire rst = ~rst_n; //becomes active high
wire clk;
//wire pllLock;
wire pllFeedbackClk;
/*
PLL_BASE#(
	.BANDWIDTH					("OPTIMIZED"),
	.CLKFBOUT_MULT				(10),
	.CLKFBOUT_PHASE			(0.0),
	.CLKIN_PERIOD				("20"),
	.CLKOUT0_DIVIDE			(5),
	.CLKOUT0_DUTY_CYCLE		(0.5),
	.CLKOUT0_PHASE				(0.0),
	.CLK_FEEDBACK				("CLKFBOUT"),
	//.COMPENSATION			("INTERNAL"),
	.DIVCLK_DIVIDE				(1),
	.REF_JITTER					(0.1),
	.RESET_ON_LOSS_OF_LOCK	("FALSE")
)
PLL_BASE_inst(
	.CLKFBOUT					(pllFeedbackClk),
	.CLKOUT0						(clk),
//	.LOCKED						(pllLock),
	.CLKFBIN						(pllFeedbackClk),
	.CLKIN						(clk50MHz),
	.RST							(0)
);
*/
assign clk = clk50MHz;
wire 	[7:0] tx_data;
wire 			tx_busy;
wire 	[7:0] rx_data;
wire 			new_rx_data;
wire			newTXData;
avr_interface AVR (
	 .clk				(clk),
	 .rst				(rst),
	 .cclk			(cclk),
	 .spi_miso		(spi_miso),
	 .spi_mosi		(spi_mosi),
	 .spi_sck		(spi_sck),
	 .spi_ss			(spi_ss),
	 .spi_channel	(spi_channel),
	 .tx				(avr_rx),
	 .rx				(avr_tx),
	 .channel		(4'd15),
	 .tx_data		(tx_data),
	 .new_tx_data	(newTXData),
	 .tx_busy		(tx_busy),
	 .tx_block		(avr_rx_busy),
	 .rx_data		(rx_data),
	 .new_rx_data	(new_rx_data)
);
wire [31:0] sdramDataTX;
wire [31:0] sdramDataRX;
wire [22:0] sdramAddr;
wire sdramBusy;
wire sdramTXValid;
wire sdramRXValid;
wire sdramRW;
sdram SDRAM (
	  .clk			(clk),
	  .rst			(rst),
	  // these signals go directly to the IO pins
	  .sdram_clk	(sdram_clk),
	  .sdram_cle	(sdram_cle),
	  .sdram_cs		(sdram_cs),
	  .sdram_cas	(sdram_cas),
	  .sdram_ras	(sdram_ras),
	  .sdram_we		(sdram_we),
	  .sdram_dqm	(sdram_dqm),
	  .sdram_ba		(sdram_ba),
	  .sdram_a		(sdram_a),
	  .sdram_dq		(sdram_dq),
	  // User interface
	  .addr			(sdramAddr),      // address to read/write
	  .rw				(sdramRW),        // 1 = write, 0 = read
	  .data_in		(sdramDataTX),   	// sdram data to write
	  .data_out		(sdramDataRX), 	// sdram data from read
	  .busy			(sdramBusy),      // controller is busy when high
	  .in_valid		(sdramTXValid),   // pulse high to initiate a read/write
	  .out_valid	(sdramRXValid)   // pulses high when data from read is valid
);
wire procBegin;
wire procComplete;
wire [7:0] networkDataIn;
wire [7:0] networkOut;
wire networkIdle;
wire networkRead;
wire inputRead;
wire [7:0] weightData;
wire [NUM_TILES - 1'b1 : 0] pipelineLock;
wire [NUM_TILES - 1'b1 : 0] weightRAMwrEn;
//neural network
tile_network ANN(
	.clk_i				(clk),
	.en_i					(procBegin),
	.data_rd_o			(inputRead),
	.data_rd_i			(networkRead),
	.data_i				(networkDataIn),
	.network_idle_o	(networkIdle),
	.data_o				(networkOut),
	.proc_complete_o	(procComplete),
	.weight_wr_i		(weightRAMwrEn),
	.weight_data_i		(weightData),
	.pipeline_lock_o  (pipelineLock)
);
master_control MCU(
	.clk				(clk),
	.rst				(rst),
	//AVR SPI
	.TXBusy			(tx_busy),
	.newRXData		(new_rx_data),
	.RXData			(rx_data),
	.TXDataBuffer	(tx_data),
	.newTXData		(newTXData),
	//MLPNN
	.inputRead		(inputRead),
	.networkIdle	(networkIdle),
	.procComplete	(procComplete),
	.networkOut		(networkOut),
	.networkDataIn	(networkDataIn),
	.procBegin		(procBegin),
	.networkRead	(networkRead),
	.weightRAMwrEn	(weightRAMwrEn),
	.weightDataOut	(weightData),
	.pipelineLock	(pipelineLock),
	.sdramBusy		(sdramBusy),
	.sdramRXValid	(sdramRXValid),
	.sdramDataRX	(sdramDataRX),
	.sdramDataTX	(sdramDataTX),
	.sdramAddr		(sdramAddr),
	.sdramTXValid	(sdramTXValid),
	.sdramRW			(sdramRW),
	.LED				(led)
);
endmodule