module chip (
	/********** NbN & Zbg **********/
	input  wire						 clk,		  // NbN
	input  wire						 clk_,		  // ½]NbN
	input  wire						 reset		  // Zbg
	/********** UART  **********/
`ifdef IMPLEMENT_UART // UARTÀ
	, input	 wire					 uart_rx	  // UARTóMM
	, output wire					 uart_tx	  // UARTMM
`endif
	/********** ÄpüoÍ|[g **********/
`ifdef IMPLEMENT_GPIO // GPIOÀ
`ifdef GPIO_IN_CH	 // üÍ|[gÌÀ
	, input wire [`GPIO_IN_CH-1:0]	 gpio_in	  // üÍ|[g
`endif
`ifdef GPIO_OUT_CH	 // oÍ|[gÌÀ
	, output wire [`GPIO_OUT_CH-1:0] gpio_out	  // oÍ|[g
`endif
`ifdef GPIO_IO_CH	 // üoÍ|[gÌÀ
	, inout wire [`GPIO_IO_CH-1:0]	 gpio_io	  // üoÍ|[g
`endif
`endif
);
	/********** oX}X^M **********/
	// S}X^¤ÊM~
	wire [`WordDataBus] m_rd_data;				  // ÇÝoµf[^
	wire				m_rdy_;					  // fB
	// oX}X^0
	wire				m0_req_;				  // oXNGXg
	wire [`WordAddrBus] m0_addr;				  // AhX
	wire				m0_as_;					  // AhXXg[u
	wire				m0_rw;					  // ÇÝ^«
	wire [`WordDataBus] m0_wr_data;				  // «Ýf[^
	wire				m0_grnt_;				  // oXOg
	// oX}X^1
	wire				m1_req_;				  // oXNGXg
	wire [`WordAddrBus] m1_addr;				  // AhX
	wire				m1_as_;					  // AhXXg[u
	wire				m1_rw;					  // ÇÝ^«
	wire [`WordDataBus] m1_wr_data;				  // «Ýf[^
	wire				m1_grnt_;				  // oXOg
	// oX}X^2
	wire				m2_req_;				  // oXNGXg
	wire [`WordAddrBus] m2_addr;				  // AhX
	wire				m2_as_;					  // AhXXg[u
	wire				m2_rw;					  // ÇÝ^«
	wire [`WordDataBus] m2_wr_data;				  // «Ýf[^
	wire				m2_grnt_;				  // oXOg
	// oX}X^3
	wire				m3_req_;				  // oXNGXg
	wire [`WordAddrBus] m3_addr;				  // AhX
	wire				m3_as_;					  // AhXXg[u
	wire				m3_rw;					  // ÇÝ^«
	wire [`WordDataBus] m3_wr_data;				  // «Ýf[^
	wire				m3_grnt_;				  // oXOg
	/********** oXX[uM **********/
	// SX[u¤ÊM
	wire [`WordAddrBus] s_addr;					  // AhX
	wire				s_as_;					  // AhXXg[u
	wire				s_rw;					  // ÇÝ^«
	wire [`WordDataBus] s_wr_data;				  // «Ýf[^
	// oXX[u0Ô
	wire [`WordDataBus] s0_rd_data;				  // ÇÝoµf[^
	wire				s0_rdy_;				  // fB
	wire				s0_cs_;					  // `bvZNg
	// oXX[u1Ô
	wire [`WordDataBus] s1_rd_data;				  // ÇÝoµf[^
	wire				s1_rdy_;				  // fB
	wire				s1_cs_;					  // `bvZNg
	// oXX[u2Ô
	wire [`WordDataBus] s2_rd_data;				  // ÇÝoµf[^
	wire				s2_rdy_;				  // fB
	wire				s2_cs_;					  // `bvZNg
	// oXX[u3Ô
	wire [`WordDataBus] s3_rd_data;				  // ÇÝoµf[^
	wire				s3_rdy_;				  // fB
	wire				s3_cs_;					  // `bvZNg
	// oXX[u4Ô
	wire [`WordDataBus] s4_rd_data;				  // ÇÝoµf[^
	wire				s4_rdy_;				  // fB
	wire				s4_cs_;					  // `bvZNg
	// oXX[u5Ô
	wire [`WordDataBus] s5_rd_data;				  // ÇÝoµf[^
	wire				s5_rdy_;				  // fB
	wire				s5_cs_;					  // `bvZNg
	// oXX[u6Ô
	wire [`WordDataBus] s6_rd_data;				  // ÇÝoµf[^
	wire				s6_rdy_;				  // fB
	wire				s6_cs_;					  // `bvZNg
	// oXX[u7Ô
	wire [`WordDataBus] s7_rd_data;				  // ÇÝoµf[^
	wire				s7_rdy_;				  // fB
	wire				s7_cs_;					  // `bvZNg
	/********** èÝvM **********/
	wire				   irq_timer;			  // ^C}IRQ
	wire				   irq_uart_rx;			  // UART IRQióMj
	wire				   irq_uart_tx;			  // UART IRQiMj
	wire [`CPU_IRQ_CH-1:0] cpu_irq;				  // CPU IRQ
	assign cpu_irq = {{`CPU_IRQ_CH-3{`LOW}},
					  irq_uart_rx, irq_uart_tx, irq_timer};
	/********** CPU **********/
	cpu cpu (
		/********** NbN & Zbg **********/
		.clk			 (clk),					  // NbN
		.clk_			 (clk_),				  // ½]NbN
		.reset			 (reset),				  // ñ¯úZbg
		/********** oXC^tF[X **********/
		// IF Stage
		.if_bus_rd_data	 (m_rd_data),			  // ÇÝoµf[^
		.if_bus_rdy_	 (m_rdy_),				  // fB
		.if_bus_grnt_	 (m0_grnt_),			  // oXOg
		.if_bus_req_	 (m0_req_),				  // oXNGXg
		.if_bus_addr	 (m0_addr),				  // AhX
		.if_bus_as_		 (m0_as_),				  // AhXXg[u
		.if_bus_rw		 (m0_rw),				  // ÇÝ^«
		.if_bus_wr_data	 (m0_wr_data),			  // «Ýf[^
		// MEM Stage
		.mem_bus_rd_data (m_rd_data),			  // ÇÝoµf[^
		.mem_bus_rdy_	 (m_rdy_),				  // fB
		.mem_bus_grnt_	 (m1_grnt_),			  // oXOg
		.mem_bus_req_	 (m1_req_),				  // oXNGXg
		.mem_bus_addr	 (m1_addr),				  // AhX
		.mem_bus_as_	 (m1_as_),				  // AhXXg[u
		.mem_bus_rw		 (m1_rw),				  // ÇÝ^«
		.mem_bus_wr_data (m1_wr_data),			  // «Ýf[^
		/********** èÝ **********/
		.cpu_irq		 (cpu_irq)				  // èÝv
	);
	/********** oX}X^ 2 : ¢À **********/
	assign m2_addr	  = `WORD_ADDR_W'h0;
	assign m2_as_	  = `DISABLE_;
	assign m2_rw	  = `READ;
	assign m2_wr_data = `WORD_DATA_W'h0;
	assign m2_req_	  = `DISABLE_;
	/********** oX}X^ 3 : ¢À **********/
	assign m3_addr	  = `WORD_ADDR_W'h0;
	assign m3_as_	  = `DISABLE_;
	assign m3_rw	  = `READ;
	assign m3_wr_data = `WORD_DATA_W'h0;
	assign m3_req_	  = `DISABLE_;
	/********** oXX[u 0 : ROM **********/
	rom rom (
		/********** Clock & Reset **********/
		.clk			 (clk),					  // NbN
		.reset			 (reset),				  // ñ¯úZbg
		/********** Bus Interface **********/
		.cs_			 (s0_cs_),				  // `bvZNg
		.as_			 (s_as_),				  // AhXXg[u
		.addr			 (s_addr[`RomAddrLoc]),	  // AhX
		.rd_data		 (s0_rd_data),			  // ÇÝoµf[^
		.rdy_			 (s0_rdy_)				  // fB
	);
	/********** oXX[u 1 : Scratch Pad Memory **********/
	assign s1_rd_data = `WORD_DATA_W'h0;
	assign s1_rdy_	  = `DISABLE_;
	/********** oXX[u 2 : ^C} **********/
`ifdef IMPLEMENT_TIMER // ^C}À
	timer timer (
		/********** NbN & Zbg **********/
		.clk			 (clk),					  // NbN
		.reset			 (reset),				  // Zbg
		/********** oXC^tF[X **********/
		.cs_			 (s2_cs_),				  // `bvZNg
		.as_			 (s_as_),				  // AhXXg[u
		.addr			 (s_addr[`TimerAddrLoc]), // AhX
		.rw				 (s_rw),				  // Read / Write
		.wr_data		 (s_wr_data),			  // «Ýf[^
		.rd_data		 (s2_rd_data),			  // ÇÝoµf[^
		.rdy_			 (s2_rdy_),				  // fB
		/********** èÝ **********/
		.irq			 (irq_timer)			  // èÝv
	 );
`else				   // ^C}¢À
	assign s2_rd_data = `WORD_DATA_W'h0;
	assign s2_rdy_	  = `DISABLE_;
	assign irq_timer  = `DISABLE;
`endif
	/********** oXX[u 3 : UART **********/
`ifdef IMPLEMENT_UART // UARTÀ
	uart uart (
		/********** NbN & Zbg **********/
		.clk			 (clk),					  // NbN
		.reset			 (reset),				  // ñ¯úZbg
		/********** oXC^tF[X **********/
		.cs_			 (s3_cs_),				  // `bvZNg
		.as_			 (s_as_),				  // AhXXg[u
		.rw				 (s_rw),				  // Read / Write
		.addr			 (s_addr[`UartAddrLoc]),  // AhX
		.wr_data		 (s_wr_data),			  // «Ýf[^
		.rd_data		 (s3_rd_data),			  // ÇÝoµf[^
		.rdy_			 (s3_rdy_),				  // fB
		/********** èÝ **********/
		.irq_rx			 (irq_uart_rx),			  // óM®¹èÝ
		.irq_tx			 (irq_uart_tx),			  // M®¹èÝ
		/********** UARTóMM	**********/
		.rx				 (uart_rx),				  // UARTóMM
		.tx				 (uart_tx)				  // UARTMM
	);
`else				  // UART¢À
	assign s3_rd_data  = `WORD_DATA_W'h0;
	assign s3_rdy_	   = `DISABLE_;
	assign irq_uart_rx = `DISABLE;
	assign irq_uart_tx = `DISABLE;
`endif
	/********** oXX[u 4 : GPIO **********/
`ifdef IMPLEMENT_GPIO // GPIOÀ
	gpio gpio (
		/********** NbN & Zbg **********/
		.clk			 (clk),					 // NbN
		.reset			 (reset),				 // Zbg
		/********** oXC^tF[X **********/
		.cs_			 (s4_cs_),				 // `bvZNg
		.as_			 (s_as_),				 // AhXXg[u
		.rw				 (s_rw),				 // Read / Write
		.addr			 (s_addr[`GpioAddrLoc]), // AhX
		.wr_data		 (s_wr_data),			 // «Ýf[^
		.rd_data		 (s4_rd_data),			 // ÇÝoµf[^
		.rdy_			 (s4_rdy_)				 // fB
		/********** ÄpüoÍ|[g **********/
`ifdef GPIO_IN_CH	 // üÍ|[gÌÀ
		, .gpio_in		 (gpio_in)				 // üÍ|[g
`endif
`ifdef GPIO_OUT_CH	 // oÍ|[gÌÀ
		, .gpio_out		 (gpio_out)				 // oÍ|[g
`endif
`ifdef GPIO_IO_CH	 // üoÍ|[gÌÀ
		, .gpio_io		 (gpio_io)				 // üoÍ|[g
`endif
	);
`else				  // GPIO¢À
	assign s4_rd_data = `WORD_DATA_W'h0;
	assign s4_rdy_	  = `DISABLE_;
`endif
	/********** oXX[u 5 : ¢À **********/
	assign s5_rd_data = `WORD_DATA_W'h0;
	assign s5_rdy_	  = `DISABLE_;
	/********** oXX[u 6 : ¢À **********/
	assign s6_rd_data = `WORD_DATA_W'h0;
	assign s6_rdy_	  = `DISABLE_;
	/********** oXX[u 7 : ¢À **********/
	assign s7_rd_data = `WORD_DATA_W'h0;
	assign s7_rdy_	  = `DISABLE_;
	/********** oX **********/
	bus bus (
		/********** NbN & Zbg **********/
		.clk			 (clk),					 // NbN
		.reset			 (reset),				 // ñ¯úZbg
		/********** oX}X^M **********/
		// S}X^¤ÊM
		.m_rd_data		 (m_rd_data),			 // ÇÝoµf[^
		.m_rdy_			 (m_rdy_),				 // fB
		// oX}X^0
		.m0_req_		 (m0_req_),				 // oXNGXg
		.m0_addr		 (m0_addr),				 // AhX
		.m0_as_			 (m0_as_),				 // AhXXg[u
		.m0_rw			 (m0_rw),				 // ÇÝ^«
		.m0_wr_data		 (m0_wr_data),			 // «Ýf[^
		.m0_grnt_		 (m0_grnt_),			 // oXOg
		// oX}X^1
		.m1_req_		 (m1_req_),				 // oXNGXg
		.m1_addr		 (m1_addr),				 // AhX
		.m1_as_			 (m1_as_),				 // AhXXg[u
		.m1_rw			 (m1_rw),				 // ÇÝ^«
		.m1_wr_data		 (m1_wr_data),			 // «Ýf[^
		.m1_grnt_		 (m1_grnt_),			 // oXOg
		// oX}X^2
		.m2_req_		 (m2_req_),				 // oXNGXg
		.m2_addr		 (m2_addr),				 // AhX
		.m2_as_			 (m2_as_),				 // AhXXg[u
		.m2_rw			 (m2_rw),				 // ÇÝ^«
		.m2_wr_data		 (m2_wr_data),			 // «Ýf[^
		.m2_grnt_		 (m2_grnt_),			 // oXOg
		// oX}X^3
		.m3_req_		 (m3_req_),				 // oXNGXg
		.m3_addr		 (m3_addr),				 // AhX
		.m3_as_			 (m3_as_),				 // AhXXg[u
		.m3_rw			 (m3_rw),				 // ÇÝ^«
		.m3_wr_data		 (m3_wr_data),			 // «Ýf[^
		.m3_grnt_		 (m3_grnt_),			 // oXOg
		/********** oXX[uM **********/
		// SX[u¤ÊM
		.s_addr			 (s_addr),				 // AhX
		.s_as_			 (s_as_),				 // AhXXg[u
		.s_rw			 (s_rw),				 // ÇÝ^«
		.s_wr_data		 (s_wr_data),			 // «Ýf[^
		// oXX[u0Ô
		.s0_rd_data		 (s0_rd_data),			 // ÇÝoµf[^
		.s0_rdy_		 (s0_rdy_),				 // fB
		.s0_cs_			 (s0_cs_),				 // `bvZNg
		// oXX[u1Ô
		.s1_rd_data		 (s1_rd_data),			 // ÇÝoµf[^
		.s1_rdy_		 (s1_rdy_),				 // fB
		.s1_cs_			 (s1_cs_),				 // `bvZNg
		// oXX[u2Ô
		.s2_rd_data		 (s2_rd_data),			 // ÇÝoµf[^
		.s2_rdy_		 (s2_rdy_),				 // fB
		.s2_cs_			 (s2_cs_),				 // `bvZNg
		// oXX[u3Ô
		.s3_rd_data		 (s3_rd_data),			 // ÇÝoµf[^
		.s3_rdy_		 (s3_rdy_),				 // fB
		.s3_cs_			 (s3_cs_),				 // `bvZNg
		// oXX[u4Ô
		.s4_rd_data		 (s4_rd_data),			 // ÇÝoµf[^
		.s4_rdy_		 (s4_rdy_),				 // fB
		.s4_cs_			 (s4_cs_),				 // `bvZNg
		// oXX[u5Ô
		.s5_rd_data		 (s5_rd_data),			 // ÇÝoµf[^
		.s5_rdy_		 (s5_rdy_),				 // fB
		.s5_cs_			 (s5_cs_),				 // `bvZNg
		// oXX[u6Ô
		.s6_rd_data		 (s6_rd_data),			 // ÇÝoµf[^
		.s6_rdy_		 (s6_rdy_),				 // fB
		.s6_cs_			 (s6_cs_),				 // `bvZNg
		// oXX[u7Ô
		.s7_rd_data		 (s7_rd_data),			 // ÇÝoµf[^
		.s7_rdy_		 (s7_rdy_),				 // fB
		.s7_cs_			 (s7_cs_)				 // `bvZNg
	);
endmodule