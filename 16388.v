module DeepGATE_top(
	// 50MHz clock input
	input clk,
	// Input from reset button (active low)
	input rst_n,
	// cclk input from AVR, high when AVR is ready
	input cclk,
	// Outputs to the 8 onboard LEDs
	output wire [7:0]led,
	//	Raspberry Pi Interface
	input 	  RaspberrySPI_SS,
	input 	  RaspberrySPI_SCLK,
	input 	  RaspberrySPI_MOSI,
	output reg RaspberrySPI_MISO,
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
`include "networkParam_include.v"
wire 			rst = ~rst_n; //becomes active high
wire 	[7:0] tx_data;
wire 			tx_busy;
wire 	[7:0] rx_data;
wire 			new_rx_data;
reg 	[7:0]	tx_data_buffer = 0;
reg 	[7:0]	rx_data_buffer = 0;
reg  			new_tx_data = 0;
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
    .new_tx_data	(new_tx_data),
    .tx_busy		(tx_busy),
    .tx_block		(avr_rx_busy),
    .rx_data		(rx_data),
    .new_rx_data	(new_rx_data)
);
wire [31:0] sdramDataOut;
wire [22:0] sdramAddr;
wire sdramBusy;
wire sdramOutValid;
reg [31:0] sdramDataIn;
reg sdramInValid;
reg sdramRW = 0;
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
  .data_in		(sdramDataIn),   	// data from a read
  .data_out		(sdramDataOut), 	// data for a write
  .busy			(sdramBusy),      // controller is busy when high
  .in_valid		(sdramInValid),   // pulse high to initiate a read/write
  .out_valid	(sdramOutValid)   // pulses high when data from read is valid
);
wire [7:0] networkOut;
wire networkIdle;
wire networkDataReady;
wire [7:0] networkTestData;
reg [31:0] transferCnt = 0;
reg [7:0] testData = 0;
reg [7:0] networkAddr = 0;
reg procBegin = 0;
reg procBeginFlag = 0;
reg networkWriteEn = 0;
reg [7:0] networkDataIn = 0;
tileNetwork MLPNN(			//multi-layer perceptron neural network
.clk				(clk),
.procBegin		(procBegin),
.dataIn			(networkDataIn),
.wr				(networkWriteEn),
.wr_addr			(networkAddr),
.weightDataIn	(48'hBABEFACEBABE),
.networkIdle	(networkIdle),
.networkOut		(networkOut),
.dataReady		(networkDataReady)
);
reg start = 0;
reg transfer = 0;
reg dataSent = 0;
reg first = 0;
reg [22:0] readAddr = 0;
reg [22:0] writeAddr = 0;
reg [22:0] stopAddr = 0;
reg [23:0] command = 0;
reg [79:0] test_reg = 0;
reg [31:0] readCnt = 0;
reg [7:0] dataRAM [783 : 0];
reg [7:0] hold = 0;
//initial begin
	//$readmemh("C:/Users/cedric/Documents/UCF/C Programs/DeepGateDataGeneration/DeepGateDataGeneration/randomNetworkData.txt", dataRAM);
//end
assign tx_data = !start ? tx_data_buffer : test_reg[7:0];
assign led = rx_data_buffer;
assign sdramAddr = !transfer ? writeAddr : readAddr;
always@(posedge clk) begin
	sdramRW 			<= 0;
	sdramInValid 	<= 0;
	procBegin 		<= 0;
	new_tx_data 	<= 0;
	if(new_rx_data && !transfer) begin
		writeAddr <= writeAddr + 1'b1;
		rx_data_buffer <= rx_data;
		dataRAM[writeAddr] <= rx_data;
		command <= {command[15:0], rx_data};
	end
	else if(!tx_busy && !new_tx_data && (transfer || start)) begin
		new_tx_data <= 1'b1;
		readAddr <= readAddr + 1'b1;
		tx_data_buffer <= dataRAM[readAddr];
	end
	if(writeAddr == 784) begin
		writeAddr <= 0;
		transfer <= 1;
	end
	if(readAddr == 784) begin
		transfer <= 0;
		readAddr <= 0;
	end
	if(transfer)
		readCnt <= readCnt + 1'b1;
	//if(sdramOutValid)
		//tx_data_buffer <= sdramDataOut;
	if(!sdramBusy && !sdramInValid) begin
		if(!transfer) begin
			sdramDataIn <= rx_data_buffer;
			sdramRW <= 1;
		end
		sdramInValid <= 1;
	end
	/*
	if(command == 24'h242424) begin //$$$ in ASCII
		//transfer <= 1;
		writeAddr <= 0;
		stopAddr <= writeAddr;
		command <= 0;
	end
	*/
	if(command == 24'h262626) //&&& in ASCII
		start <= 1;
	if(networkDataReady)
		test_reg <= {test_reg[71:0], networkOut};
	else if(!networkDataReady && !tx_busy && !new_tx_data)
		test_reg <= {test_reg[71:0], test_reg[79:72]} ;
	if(start && networkIdle && !procBeginFlag) begin
		procBegin <= 1;
		procBeginFlag <= 1;
	end
	if(((procBeginFlag && !procBegin && transferCnt == 0) || (transferCnt > 0 && transferCnt < 784)) && !hold) begin
		transferCnt <= transferCnt + 1'b1;
		networkDataIn <= dataRAM[transferCnt];
	end
	if(transferCnt == 784) begin
			hold <= hold + 1'b1;
			if(hold == 10) begin
				transferCnt <= 0;
				hold <= 0;
			end
	end
end
endmodule