module                                              */
	wire spi_rx_irq;
	wire spi_tx_irq;
	wire [7:0] spi_rx_data;
	reg [7:0] spi_tx_data;
	spi_slave #(
		.WORDSIZE(8),
		.CPOL(SPI_CPOL),
		.CPHA(SPI_CPHA),
		.MSB_FIRST(SPI_MSB_FIRST),
	) spi (
		.clk(clk),
		.mosi(mosi),
		.miso(miso),
		.sck(sck),
		.ss(ss),
		.rx_irq(spi_rx_irq),
		.rx_data(spi_rx_data),
		.tx_data(spi_tx_data),
	);
	assign spi_tx_irq = spi_rx_irq;
	initial begin
		spi_tx_data <= 0;
	end
	/* UART receive                                            */
	/* This process receives data from the Profibus line       */
	/* and puts it into the Profibus receive buffer.           */
	reg [23:0] tsyn_clks;
	/* Receive interrupts */
	assign rx_irq_edge = rx_buf_wr;
	assign rx_irq_level = rx_buf_wr | (rx_buf_wr_addr != rx_buf_rd_addr);
	initial begin
		tsyn_clks <= 0;
	end
	always @(posedge clk) begin
		if (n_reset & ~softreset) begin
			if (uart_rx_irq) begin
				if (uart_rx_parity_ok & ~uart_rx_frame_error) begin
					if (rx_buf_wr_addr_next != rx_buf_rd_addr) begin
						rx_buf_wr_data[7:0] <= uart_rx_data;
						/* Start-of-telegram bit. */
						rx_buf_wr_data[RXBUF_SOT_BIT] <= (timer_idle_saved >= tsyn_clks);
						rx_buf_wr <= 1;
					end else begin
						/* RX buffer overflow. */
						rx_buf_overflow_set();
					end
				end
			end else begin
				if (rx_buf_wr) begin
					rx_buf_wr <= 0;
					rx_buf_wr_addr <= rx_buf_wr_addr_next;
				end
			end
		end else begin
			/* Reset */
			rx_buf_wr <= 0;
			rx_buf_wr_addr <= 0;
		end
	end
	/* UART transmit.                                          */
	/* This process transmits data to the Profibus line        */
	/* from the Profibus transmit buffer.                      */
	always @(posedge clk) begin
		if (n_reset & ~softreset) begin
			if (uart_tx_trigger) begin
				uart_tx_trigger <= 0;
			end else begin
				/* Check if new TX data is pending. */
				if (tx_buf_rd_addr != tx_buf_wr_addr) begin
					/* Check if we are able to transmit. */
					if (~uart_tx_active & ~uart_tx_pending) begin
						/* Transmit the byte to the PB line. */
						uart_tx_data <= tx_buf_rd_data;
						uart_tx_trigger <= 1;
						tx_buf_rd_addr <= tx_buf_rd_addr + 1;
					end
				end
			end
		end else begin
			/* Reset */
			uart_tx_data <= 0;
			uart_tx_trigger <= 0;
			tx_buf_rd_addr <= 0;
		end
	end
	/* SPI receive.                                            */
	/* This process receives data from the host SPI bus        */
	/* and puts it into the Profibus transmit buffer.          */
	localparam SPIRX_BEGIN		= 0;
	localparam SPIRX_FLG		= 1;
	localparam SPIRX_DATA		= 2;
	localparam SPIRX_CTRL		= 3;
	localparam SPIRX_CTRL_DATA	= 4;
	localparam SPIRX_CRC		= 5;
	localparam SPIRX_CTRL_EXEC	= 6;
	reg [2:0] spirx_state;
	reg [7:0] spirx_len;
	reg spirx_len_valid;
	reg [7:0] spirx_bytecount;
	reg [7:0] spirx_ctrl;
	reg [31:0] spirx_ctrl_data;
	reg [7:0] spirx_crc;
	reg [1:0] spirx_ctrl_crcerr;
	/* Length calculation of PB frames. */
	wire spirx_lencalc_n_reset_wire;
	reg spirx_lencalc_n_reset;
	reg [7:0] spirx_lencalc_byte;
	reg spirx_lencalc_new;
	wire spirx_lencalc_valid;
	wire [7:0] spirx_lencalc_length;
	wire spirx_lencalc_error;
	profibus_telegram_length spirx_lencalc (
		.clk(clk),
		.n_reset(spirx_lencalc_n_reset_wire),
		.in_byte(spirx_lencalc_byte),
		.new_byte(spirx_lencalc_new),
		.length_valid(spirx_lencalc_valid),
		.length(spirx_lencalc_length),
		.error(spirx_lencalc_error),
	);
	assign spirx_lencalc_n_reset_wire = spirx_lencalc_n_reset & ~softreset & n_reset;
	initial begin
		spirx_state <= SPIRX_BEGIN;
		spirx_len <= 0;
		spirx_len_valid <= 0;
		spirx_bytecount <= 0;
		spirx_ctrl <= 0;
		spirx_ctrl_data <= 0;
		spirx_crc <= 0;
		spirx_ctrl_crcerr <= 0;
		spirx_lencalc_n_reset <= 0;
		spirx_lencalc_byte <= 0;
		spirx_lencalc_new <= 0;
	end
	function automatic spirx_ctrl_crcerr_get;
		begin spirx_ctrl_crcerr_get = spirx_ctrl_crcerr[0] ^ spirx_ctrl_crcerr[1]; end
	endfunction
	task automatic spirx_ctrl_crcerr_set;
		begin spirx_ctrl_crcerr[0] <= ~spirx_ctrl_crcerr[1]; end
	endtask
	task automatic spirx_ctrl_crcerr_reset;
		begin spirx_ctrl_crcerr[1] <= spirx_ctrl_crcerr[0]; end
	endtask
	always @(posedge clk) begin
		if (n_reset & ~softreset) begin
			case (spirx_state)
				SPIRX_BEGIN: begin
					/* Wait for start of SPI receive. */
					if (spi_rx_irq) begin
						if (spi_rx_data == SPI_MS_MAGIC) begin
							spirx_ctrl <= 0;
							spirx_ctrl_data <= 0;
							spirx_len <= 0;
							spirx_len_valid <= 0;
							spirx_crc <= 8'hFF;
							spirx_state <= SPIRX_FLG;
						end
					end
					if (tx_buf_wr) begin
						tx_buf_wr_addr <= tx_buf_wr_addr + 1;
						tx_buf_wr <= 0;
					end
					spirx_lencalc_byte <= 0;
					spirx_lencalc_new <= 0;
					spirx_lencalc_n_reset <= 0;
				end
				SPIRX_FLG: begin
					/* Flags field. */
					if (spi_rx_irq) begin
						/* Check the FLG checksum. */
						if (parity8(ODD,
								    spi_rx_data[0],
								    spi_rx_data[1],
								    spi_rx_data[2],
								    spi_rx_data[3],
								    spi_rx_data[4],
								    spi_rx_data[5],
								    spi_rx_data[6],
								    spi_rx_data[7]) == 0) begin
							if (spi_rx_data[SPI_FLG_CTRL]) begin
								/* We have a control message. */
								spirx_bytecount <= 0;
								spirx_state <= SPIRX_CTRL;
							end else begin
								/* Begin PB data. */
								spirx_lencalc_n_reset <= 1;
								spirx_bytecount <= 0;
								spirx_state <= SPIRX_DATA;
							end
						end else begin
							/* Incorrect checksum. */
							spirx_state <= SPIRX_BEGIN;
						end
					end
				end
				SPIRX_DATA: begin
					/* Receive data bytes. */
					if (spirx_len_valid) begin
						/* spirx_len is valid.
						if (spirx_bytecount >= spirx_len) begin
							spirx_state <= SPIRX_BEGIN;
						end
					end else begin
						/* Try to calculate the telegram length. */
						spirx_lencalc_byte <= spi_rx_data;
						spirx_lencalc_new <= spi_rx_irq;
						if (spirx_lencalc_error) begin
							/* Failed to calculate the length. Abort. */
							spirx_lencalc_n_reset <= 0;
							spirx_state <= SPIRX_BEGIN;
						end else if (spirx_lencalc_valid) begin
							/* Successfully calculated the data length. */
							spirx_len <= spirx_lencalc_length;
							spirx_len_valid <= 1;
							spirx_lencalc_n_reset <= 0;
						end
					end
					if (tx_buf_wr) begin
						/* Increment TX buffer pointer. */
						tx_buf_wr_addr <= tx_buf_wr_addr + 1;
						tx_buf_wr <= 0;
					end else begin
						/* Did we receive a byte? */
						if (spi_rx_irq) begin
							if (tx_buf_wr_addr_next != tx_buf_rd_addr) begin
								/* Put the new byte into the TX buffer. */
								tx_buf_wr_data <= spi_rx_data;
								tx_buf_wr <= 1;
								spirx_bytecount <= spirx_bytecount + 1;
							end else begin
								/* TX buffer overflow. */
								tx_buf_overflow_set();
								spirx_bytecount <= spirx_bytecount + 1;
							end
						end
					end
				end
				SPIRX_CTRL: begin
					/* Receive control command byte. */
					if (spi_rx_irq) begin
						spirx_ctrl <= spi_rx_data;
						spirx_crc <= crc8(spirx_crc, spi_rx_data);
						spirx_state <= SPIRX_CTRL_DATA;
					end
				end
				SPIRX_CTRL_DATA: begin
					/* Receive control data bytes. */
					if (spi_rx_irq) begin
						spirx_ctrl_data <= (spirx_ctrl_data << 8) | spi_rx_data;
						spirx_crc <= crc8(spirx_crc, spi_rx_data);
						if (spirx_bytecount >= 4 - 1) begin
							spirx_state <= SPIRX_CRC;
						end
						spirx_bytecount <= spirx_bytecount + 1;
					end
				end
				SPIRX_CRC: begin
					/* Receive CRC byte. */
					if (spi_rx_irq) begin
						if (spi_rx_data == spirx_crc) begin
							spirx_state <= SPIRX_CTRL_EXEC;
						end else begin
							/* Incorrect CRC. Do not run the control command. */
							spirx_ctrl_crcerr_set();
							spirx_state <= SPIRX_BEGIN;
						end
					end
				end
				SPIRX_CTRL_EXEC: begin
					/* Handle received control message. */
					case (spirx_ctrl)
						SPICTRL_NOP: begin
							/* NOP command. Do nothing. */
							spirx_state <= SPIRX_BEGIN;
						end
						SPICTRL_PING: begin
							/* PING command. Send PONG. */
							if (spitx_ctrl_pending == spitx_ctrl_pending_ack) begin
								spitx_ctrl_reply <= SPICTRL_PONG;
								spitx_ctrl_reply_data <= 0;
								spitx_ctrl_pending <= ~spitx_ctrl_pending_ack;
								spirx_state <= SPIRX_BEGIN;
							end
						end
						SPICTRL_PONG: begin
							/* Ignore. */
							spirx_state <= SPIRX_BEGIN;
						end
						SPICTRL_SOFTRESET: begin
							/* Trigger a soft reset. */
							softreset <= 1;
							spirx_state <= SPIRX_BEGIN;
						end
						SPICTRL_GETSTATUS: begin
							if (spitx_ctrl_pending == spitx_ctrl_pending_ack) begin
								spitx_ctrl_reply <= SPICTRL_STATUS;
								spitx_ctrl_reply_data[SPISTAT_PONRESET] <= ~n_poweronreset_status;
								spitx_ctrl_reply_data[SPISTAT_HARDRESET] <= ~n_hardreset_status;
								spitx_ctrl_reply_data[SPISTAT_SOFTRESET] <= softreset_status;
								spitx_ctrl_reply_data[SPISTAT_TXOVR] <= tx_buf_overflow_get();
								spitx_ctrl_reply_data[SPISTAT_RXOVR] <= rx_buf_overflow_get();
								spitx_ctrl_reply_data[SPISTAT_CTRLCRCERR] <= spirx_ctrl_crcerr_get();
								spitx_ctrl_reply_data[31:6] <= 0;
								spitx_ctrl_pending <= ~spitx_ctrl_pending_ack;
								/* Reset all error states. */
								tx_buf_overflow_reset();
								rx_buf_overflow_reset();
								spirx_ctrl_crcerr_reset();
								/* Reset all reset status bits */
								n_poweronreset_status <= 1;
								n_hardreset_status <= 1;
								softreset_status <= 0;
								spirx_state <= SPIRX_BEGIN;
							end
						end
						SPICTRL_STATUS: begin
							/* Ignore. */
							spirx_state <= SPIRX_BEGIN;
						end
						SPICTRL_GETBAUD: begin
							if (spitx_ctrl_pending == spitx_ctrl_pending_ack) begin
								spitx_ctrl_reply <= SPICTRL_BAUD;
								spitx_ctrl_reply_data[31:24] <= 0;
								spitx_ctrl_reply_data[23:0] <= spirx_ctrl_data[23:0];
								spitx_ctrl_pending <= ~spitx_ctrl_pending_ack;
								spirx_state <= SPIRX_BEGIN;
							end
						end
						SPICTRL_BAUD: begin
							if (spitx_ctrl_pending == spitx_ctrl_pending_ack) begin
								spitx_ctrl_reply <= SPICTRL_BAUD;
								spitx_ctrl_reply_data[31:24] <= 0;
								spitx_ctrl_reply_data[23:0] <= spirx_ctrl_data[23:0];
								spitx_ctrl_pending <= ~spitx_ctrl_pending_ack;
								/* Set the new baud rate. */
								uart_clks_per_sym[23:0] <= spirx_ctrl_data[23:0];
								/* Set the new TSYN timing.
								 */
								tsyn_clks <= (spirx_ctrl_data[23:0] << 5) + spirx_ctrl_data[23:0];
								spirx_state <= SPIRX_BEGIN;
							end
						end
						default: begin
							/* Unknown control command. */
							spirx_state <= SPIRX_BEGIN;
						end
					endcase
				end
				default: begin
					/* Invalid case. */
					spirx_ctrl <= 0;
					spirx_ctrl_data <= 0;
					tx_buf_wr_addr <= 0;
					tx_buf_wr_data <= 0;
					tx_buf_wr <= 0;
					spirx_state <= SPIRX_BEGIN;
					spirx_lencalc_n_reset <= 0;
				end
			endcase
		end else begin
			/* Reset */
			spirx_ctrl <= 0;
			spirx_ctrl_data <= 0;
			tx_buf_wr_addr <= 0;
			tx_buf_wr_data <= 0;
			tx_buf_wr <= 0;
			spirx_state <= SPIRX_BEGIN;
			spirx_lencalc_n_reset <= 0;
			rx_buf_overflow_reset();
			tx_buf_overflow_reset();
			spirx_ctrl_crcerr_reset();
			softreset_status <= softreset;
			n_hardreset_status <= n_reset;
			n_poweronreset_status <= 1;
			softreset <= 0;
		end
	end
	/* SPI transmit.                                           */
	/* This process transmits data to the host SPI bus         */
	/* from the Profibus receive buffer.                       */
	reg [7:0] spitx_ctrl_reply;
	reg [31:0] spitx_ctrl_reply_data;
	reg spitx_ctrl_pending;
	reg spitx_ctrl_pending_ack;
	reg [7:0] spitx_bytecount;
	reg [7:0] spitx_len;
	reg spitx_tail;
	reg spitx_ctrl_running;
	reg spitx_data_running;
	reg [7:0] spitx_crc;
	initial begin
		spitx_ctrl_reply <= 0;
		spitx_ctrl_reply_data <= 0;
		spitx_ctrl_pending <= 0;
		spitx_ctrl_pending_ack <= 0;
		spitx_bytecount <= 0;
		spitx_len <= 0;
		spitx_ctrl_running <= 0;
		spitx_data_running <= 0;
		spitx_crc <= 0;
	end
	always @(posedge clk) begin
		if (n_reset & ~softreset) begin
			/* Are we currently not transmitting a data frame
			if (~spitx_data_running &&
			    spitx_ctrl_pending != spitx_ctrl_pending_ack) begin
				if (spi_tx_irq) begin
					case (spitx_bytecount)
						0: begin
							spi_tx_data <= SPI_SM_MAGIC;
							spitx_bytecount <= spitx_bytecount + 1;
							spitx_ctrl_running <= 1;
						end
						1: begin
							spi_tx_data[SPI_FLG_START] <= 0;
							spi_tx_data[SPI_FLG_CTRL] <= 1;
							spi_tx_data[SPI_FLG_NEWSTAT] <= new_status_available;
							spi_tx_data[SPI_FLG_RESET] <= any_reset_status;
							spi_tx_data[SPI_FLG_UNUSED4] <= 0;
							spi_tx_data[SPI_FLG_UNUSED5] <= 0;
							spi_tx_data[SPI_FLG_UNUSED6] <= 0;
							spi_tx_data[SPI_FLG_PARITY] <= parity8(ODD, 0,
											0,
											1,
											new_status_available,
											any_reset_status,
											0,
											0,
											0);
							spitx_crc <= 8'hFF;
							spitx_bytecount <= spitx_bytecount + 1;
							spitx_ctrl_running <= 1;
						end
						2: begin
							spi_tx_data <= spitx_ctrl_reply;
							spitx_crc <= crc8(spitx_crc, spitx_ctrl_reply);
							spitx_bytecount <= spitx_bytecount + 1;
							spitx_ctrl_running <= 1;
						end
						3: begin
							spi_tx_data <= spitx_ctrl_reply_data[31:24];
							spitx_crc <= crc8(spitx_crc, spitx_ctrl_reply_data[31:24]);
							spitx_bytecount <= spitx_bytecount + 1;
							spitx_ctrl_running <= 1;
						end
						4: begin
							spi_tx_data <= spitx_ctrl_reply_data[23:16];
							spitx_crc <= crc8(spitx_crc, spitx_ctrl_reply_data[23:16]);
							spitx_bytecount <= spitx_bytecount + 1;
							spitx_ctrl_running <= 1;
						end
						5: begin
							spi_tx_data <= spitx_ctrl_reply_data[15:8];
							spitx_crc <= crc8(spitx_crc, spitx_ctrl_reply_data[15:8]);
							spitx_bytecount <= spitx_bytecount + 1;
							spitx_ctrl_running <= 1;
						end
						6: begin
							spi_tx_data <= spitx_ctrl_reply_data[7:0];
							spitx_crc <= crc8(spitx_crc, spitx_ctrl_reply_data[7:0]);
							spitx_bytecount <= spitx_bytecount + 1;
							spitx_ctrl_running <= 1;
						end
						7: begin
							spi_tx_data <= spitx_crc;
							spitx_bytecount <= 0;
							spitx_ctrl_running <= 0;
							spitx_ctrl_pending_ack <= spitx_ctrl_pending;
						end
						default: begin
							spitx_bytecount <= 0;
							spitx_ctrl_running <= 0;
							spitx_ctrl_pending_ack <= spitx_ctrl_pending;
						end
					endcase
				end
			/* Are we currently not transmitting a control frame
			end else if ((~spitx_ctrl_running &&
			              rx_buf_wr_addr != rx_buf_rd_addr) ||
						 spitx_data_running) begin
				if (spi_tx_irq) begin
					/* We have a new PB telegram byte. Send it to the host. */
					if (spitx_bytecount == 0) begin
						spi_tx_data <= SPI_SM_MAGIC;
						spitx_bytecount <= spitx_bytecount + 1;
						spitx_len <= 0;
						spitx_tail <= 0;
						spitx_data_running <= 1;
					end else if (spitx_bytecount == 1) begin
						spi_tx_data[SPI_FLG_START] = rx_buf_rd_data[RXBUF_SOT_BIT];
						spi_tx_data[SPI_FLG_CTRL] = 0;
						spi_tx_data[SPI_FLG_NEWSTAT] = new_status_available;
						spi_tx_data[SPI_FLG_RESET] = any_reset_status;
						spi_tx_data[SPI_FLG_UNUSED4] = 0;
						spi_tx_data[SPI_FLG_UNUSED5] = 0;
						spi_tx_data[SPI_FLG_UNUSED6] = 0;
						spi_tx_data[SPI_FLG_PARITY] = parity8(ODD, 0,
										rx_buf_rd_data[RXBUF_SOT_BIT],
										0,
										new_status_available,
										any_reset_status,
										0,
										0,
										0);
						spitx_bytecount <= spitx_bytecount + 1;
						spitx_data_running <= 1;
					end else if (spitx_bytecount >= 2 && spitx_bytecount <= 9) begin
						if (spitx_tail ||
						    (rx_buf_wr_addr == rx_buf_rd_addr) ||
						    (spitx_bytecount >= 3 && rx_buf_rd_data[RXBUF_SOT_BIT])) begin
							spi_tx_data <= 0;
							spitx_bytecount <= spitx_bytecount + 1;
							spitx_tail <= 1;
						end else begin
							spi_tx_data <= rx_buf_rd_data;
							rx_buf_rd_addr <= rx_buf_rd_addr + 1;
							spitx_bytecount <= spitx_bytecount + 1;
							spitx_len <= spitx_len + 1;
						end
						spitx_data_running <= 1;
					end else begin
						spi_tx_data <= spitx_len;
						spitx_bytecount <= 0;
						spitx_data_running <= 0;
					end
				end
			end else begin
				/* No frame pending. */
				if (spi_tx_irq) begin
					spi_tx_data <= 0;
				end
				spitx_bytecount <= 0;
				spitx_data_running <= 0;
				spitx_ctrl_running <= 0;
			end
		end else begin
			/* Reset. */
			spi_tx_data <= 0;
			spitx_bytecount <= 0;
			spitx_len <= 0;
			spitx_tail <= 0;
			spitx_ctrl_running <= 0;
			spitx_data_running <= 0;
			spitx_ctrl_pending_ack <= spitx_ctrl_pending;
			spitx_crc <= 0;
		end
	end
	/* PB timekeeping.                                         */
	reg timer_idle_active;
	reg [23:0] timer_idle;
	reg [23:0] timer_idle_saved;
	localparam TIMER_MAX = 24'hFFFFFF;
	initial begin
		timer_idle_active <= 0;
		timer_idle <= 0;
		timer_idle_saved <= TIMER_MAX;
	end
	always @(posedge clk) begin
		if (n_reset & ~softreset) begin
			if (uart_tx_active | uart_tx_irq |
			    uart_rx_active | uart_rx_irq) begin
				/* A PB transmission is active. Reset idle timer. */
				if (timer_idle_active) begin
					timer_idle_saved <= timer_idle;
				end
				timer_idle_active <= 0;
				timer_idle <= 0;
			end else begin
				/* PB is idle, increment the idle timer. Avoid overflow. */
				if (timer_idle < TIMER_MAX) begin
					timer_idle <= timer_idle + 1;
				end
				timer_idle_active <= 1;
			end
		end else begin
			timer_idle_active <= 0;
			timer_idle <= 0;
			timer_idle_saved <= TIMER_MAX;
		end
	end
endmodule