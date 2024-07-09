module spmc_uart_light_peri(
	input	wire		clk_peri,		//Systemtakt
        input	wire	[17:0]	do_peri,		//Datenbus  vom MC
        output	wire	[17:0]	di_peri,		//Datenbus  zum MC
        input	wire	[9:0]	addr_peri,		//Adressbus vom MC
        input	wire		access_peri,		//Signale fuer Peripheriezugriffe
        input	wire		wr_peri,		//Schreibsignal
	input	wire		reset,			//Reset-Signal
        output	wire		intr,			//Interrupt
	input	wire		rx,
	output	wire		tx,
	input	wire		tx_chain_i
	);
	`include "uart_light/util/uart_functions.v"
	parameter
	BASE_ADR		= 10'h0,
	USTATUS_ADR		= 0,
	URX_ADR			= 1,
	UTX_ADR			= 2,
    	CLOCK_FREQUENCY		= 25000000,
    	FIFO_TX_DEPTH		= 8,
    	FIFO_RX_DEPTH		= 8,
    	BAUDRATE		= 115200,
	INTERRUPT_SUPPORTED	= "FALSE",
	ENABLE_TX_CHAIN		= "FALSE",
	ALL_PORTS		= 3,
	DECODSIM_DEB		= "NO",
	FIFO_ADDR_BITS_TX	= log2(FIFO_TX_DEPTH - 1),
	FIFO_ADDR_BITS_RX	= log2(FIFO_RX_DEPTH - 1),
	BAUD_ERROR_09		= baud_error(CLOCK_FREQUENCY,  9, BAUDRATE),
	BAUD_ERROR_10		= baud_error(CLOCK_FREQUENCY, 10, BAUDRATE),
	BAUD_ERROR_11		= baud_error(CLOCK_FREQUENCY, 11, BAUDRATE),
	BAUD_ERROR_12		= baud_error(CLOCK_FREQUENCY, 12, BAUDRATE),
	BAUD_ERROR_13		= baud_error(CLOCK_FREQUENCY, 13, BAUDRATE),
	BAUD_ERROR_14		= baud_error(CLOCK_FREQUENCY, 14, BAUDRATE),
	BAUD_ERROR_15		= baud_error(CLOCK_FREQUENCY, 15, BAUDRATE),
	BAUD_ERROR_16		= baud_error(CLOCK_FREQUENCY, 16, BAUDRATE),
	BAUD_ERROR_17		= baud_error(CLOCK_FREQUENCY, 17, BAUDRATE),
	BAUD_ERROR_18		= baud_error(CLOCK_FREQUENCY, 18, BAUDRATE),
	BAUD_ERROR_19		= baud_error(CLOCK_FREQUENCY, 19, BAUDRATE),
	BAUD_ERROR_20		= baud_error(CLOCK_FREQUENCY, 20, BAUDRATE),
	BAUD_ERROR_21		= baud_error(CLOCK_FREQUENCY, 21, BAUDRATE),
	SAMPLING_COUNT		= find_best_ovs_rate(CLOCK_FREQUENCY, BAUDRATE),
	SC_SIZE			= log2(SAMPLING_COUNT),
	BR_DIVISOR_TX		= CLOCK_FREQUENCY/BAUDRATE,
	BR_DIVISOR_RX		= baud_divisor(ovs_freq_10x(CLOCK_FREQUENCY, SAMPLING_COUNT), BAUDRATE),
	BRD_SIZE_TX		= log2(BR_DIVISOR_TX - 1),
	BRD_SIZE_RX		= log2(BR_DIVISOR_RX - 1);
	wire		fifo_rx_full;
	wire		fifo_rx_empty;
	wire		fifo_tx_full;
	wire		fifo_tx_empty;
	wire		fifo_tx_read;
	wire	[17:0]	port_status;
	wire	[17:0]	port_rx;
	wire	[7:0]	word_rx;
	wire		uart_tx;
	wire clk_rx;
  generate
    if (ENABLE_TX_CHAIN == "TRUE")
      assign tx = uart_tx & tx_chain_i;
    else
      assign tx = uart_tx;
  endgenerate
// Dekodierung der Adressen ********************** START *************************************
// chipselect fuer die Statusregister (ohne Modemsignale)
wire					select_status_read;	// Lesen
wire					select_rx;		// Lesen
wire					select_tx;		// Schreiben
wire					select;
wire		[ALL_PORTS-1:0]		reg_select;
wire		[ALL_PORTS-1:0]		reg_read;
wire		[ALL_PORTS-1:0]		reg_write;
// Addressdekoder fuer alle Geraeteregister
reg_access_decoder	#(
		.REG_COUNT(	ALL_PORTS	),
		.BASE_ADR(	BASE_ADR	),
		.SIM_DEBUG(	DECODSIM_DEB	)
			)
decod1			(
		.reset(		reset		),
		.clk_peri(	clk_peri	),
		.addr_peri(	addr_peri	),
		.access_peri(	access_peri	),
		.wr_peri(	wr_peri		),
		.peri_select(	select		),
		.reg_select(	reg_select	),
		.reg_read(	reg_read	),
		.reg_write(	reg_write	)
			);
// chipselect fuer die FIFO-,Status- und Steuerregister
assign	select_status_read	= reg_read[USTATUS_ADR];	// Lesen
assign	select_rx		= reg_read[URX_ADR];		// Lesen
assign	select_tx		= reg_write[UTX_ADR];		// Schreiben
// Dekodierung der Adressen ********************** END **************************************
	generate
	if(INTERRUPT_SUPPORTED == "FALSE") begin: ININTERRUPT_IS_NOT_SUPPORTED
		assign port_status = {14'b0, fifo_tx_full, fifo_tx_empty, fifo_rx_full, fifo_rx_empty};
		assign intr        = 1'b0;
	end else begin: INTERRUPT_IS_SUPPORTED
		wire select_status_write, ir_tx, ir_rx;
		reg  intr_enable_tx, intr_enable_rx, intr_tx, intr_rx, intr_txr, fifo_rx_read;
		reg clk_rx_toggle, clk_rx_lock, clk_rx_lock_val;
		assign select_status_write = reg_write[USTATUS_ADR];		// Schreiben
		assign port_status = {7'b0, intr_enable_tx, intr_enable_rx, 3'b0, intr_tx, intr_txr, fifo_tx_full, fifo_tx_empty, fifo_rx_full, fifo_rx_empty};
		assign intr	   = ir_tx | ir_rx;
		assign ir_tx	   = intr_enable_tx ? intr_tx:1'b0;
		assign ir_rx	   = intr_enable_rx ? intr_rx:1'b0;
		always @(posedge clk_peri, posedge reset) begin
			if(reset) begin
				intr_enable_tx <= 1'b0;
				intr_enable_rx <= 1'b0;
			end
			else if(select_status_write) begin	// INTR Freigabe im Statusregister
				{intr_enable_tx, intr_enable_rx} <= do_peri[10:9];
			end
		end
		always @(posedge clk_rx) begin
		  clk_rx_toggle <= !clk_rx_toggle;
		end
		always @(posedge clk_peri, posedge reset) begin
			if(reset) begin
				intr_tx      <= 1'b0;
				intr_rx      <= 1'b0;
				intr_txr     <= 1'b1;		// 1. Tx Interrupt sofort senden
				fifo_rx_read <= 1'b0;
			end
			else if(select_status_write) begin
				intr_tx <= 1'b0;
			end
			else if(select_rx)begin
				intr_rx <= 1'b0;
				clk_rx_lock <= 1'b1; // clk_rx lock setzen
				fifo_rx_read <= 1'b1;		// Daten lesen merken und Freigabe fuer einen Takt sperren
			end
			else if(select_tx) begin
				intr_txr <= 1'b1;		// Schreiben von Daten merken
			end
			else begin
				if(!fifo_tx_full && intr_txr && !intr_tx) begin
					intr_txr <= 1'b0;	// naechste Interrupt erst wenn wieder etwas geschrieben wurde.
					intr_tx  <= 1'b1;
				end
				if(!fifo_rx_empty && !clk_rx_lock) begin //intr_rx wird gesetzt, sofern fifo_rx nicht leer ist
					intr_rx <= 1'b1;
				end
				if (fifo_rx_read)
				  clk_rx_lock_val <= clk_rx_toggle;
				else
				  if (clk_rx_toggle != clk_rx_lock_val)
				    clk_rx_lock <= 1'b0;
				fifo_rx_read <= 1'b0;		// intr_rx wieder freigeben
			end
		end
	end
	endgenerate
	assign port_rx     = {10'b0, word_rx};
	assign di_peri     = select_status_read ? port_status : (select_rx ? port_rx : 18'b0);
	uart_light
	#(
		.FIFO_ADDR_BITS_RX(FIFO_ADDR_BITS_RX),
		.FIFO_ADDR_BITS_TX(FIFO_ADDR_BITS_TX),
		.BR_DIVISOR_TX(BR_DIVISOR_TX),
		.BR_DIVISOR_RX(BR_DIVISOR_RX),
		.BRD_SIZE_TX(BRD_SIZE_TX),
		.BRD_SIZE_RX(BRD_SIZE_RX),
		.SAMPLING_COUNT(SAMPLING_COUNT),
		.SC_SIZE(SC_SIZE)
	)
		uart0(
		.reset(reset),
		.clk_peri(clk_peri),
		//tx
		.tx(uart_tx),
		.word_ready(select_tx),
		.word_tx(do_peri[7:0]),
		.fifo_tx_full(fifo_tx_full),
		.fifo_tx_empty(fifo_tx_empty),
		.fifo_tx_read(fifo_tx_read),
		//rx
		.rx(rx),
		.read_ready(select_rx),
		.word_rx(word_rx),
		.fifo_rx_full(fifo_rx_full),
		.fifo_rx_empty(fifo_rx_empty),
		.clk_rx_out(clk_rx)
   	);
endmodule