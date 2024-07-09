module mem(
	   input wire 			  clk_i, // clock
	   output reg 			  kpu_wait_o, // Stop kpu execution if needed
	   input wire [`N-1:0] 		  i_addr_i, // instruction memory address
	   output reg [`N-1:0] 		  i_data_o, // instruction data output
	   input wire [`N-1:0] 		  d_addr_i, // data memory address
	   input wire [3:0] 		  d_sel_i, // data byte select
	   input wire [`N-1:0] 		  d_data_i, // data input
	   output reg [`N-1:0] 		  d_data_o, // data output
	   input wire [`N-1:0] 		  d_gp_i, // general purpose input
	   output reg [`N-1:0] 		  d_gp_o, // general purpose output
	   input wire [`N-1:0] 		  io_int_num_i, // interrupt number input
	   output reg 			  int_ctrl_rst_o, // rst int ctrl line
	   // Wishbone handler lines
	   output reg 			  wb_ready_o,
	   output reg [31:0] 		  wb_command_o = 0,
	   output reg [31:0] 		  wb_addr_o = 0,
	   output reg [31:0] 		  wb_data_o = 0,
	   output reg [27:0] 		  wb_data_count_o = 0,
	   input wire [31:0] 		  wb_status_i,
	   input wire [31:0] 		  wb_data_i,
	   input wire [27:0] 		  wb_data_count_i,
	   input wire 			  wb_o_en_i,
	   // External SRAM interface
	   output wire [`SRAM_ADDR_W-1:0] sram_addr_o,
	   inout wire [`SRAM_DATA_W-1:0]  sram_data_io,
	   output wire 			  sram_cs_o,
	   output wire 			  sram_we_o,
	   output wire 			  sram_oe_o,
	   output wire 			  sram_hb_o,
	   output wire 			  sram_lb_o
	   );
	reg [`N-1:0] 		ram [0:`RAM_SIZE - 1] /* synthesis syn_ramstyle=no_rw_check */;
	reg [`N-1:0] 		rom [0:`ROM_SIZE - 1] /* synthesis syn_ramstyle=no_rw_check */;
	reg [3:0] 		wb_interface_state;
	reg 			wb_write_start 	= 1'b0;
	reg 			wb_read_start 	= 1'b0;
	reg [1:0] 		wb_byte_count_read, wb_data_count_tmp;
	reg [31:0] 		wb_data_write, wb_reg_write, wb_reg_read;
	reg 			wb_was_read, wb_readed_data_ready;
	reg [31:0] 		wb_readed_data;
	wire 			kcache_wait;
	// WB write states
	localparam WB_IDLE  = 0;
	localparam WB_READ_ONGOING  = 1;
	localparam WB_WRITE_ONGOING  = 2;
	localparam WB_READ_WAIT  = 3;
	localparam WB_WRITE_WAIT  = 4;
	initial
		begin
 `ifdef ROM_IMAGE
			$readmemh(`ROM_IMAGE, rom);
 `else
			$readmemh("rom/rom.hex", rom);
 `endif
			d_gp_o 	    = `N'h0;
			kpu_wait_o 	    = `N'h0;
			wb_interface_state  = 3'b0;
			wb_ready_o 	    = 1'b0;
		end // initial begin
	kcache kcache_i(
			.clk_i(clk_i),
			.wait_o(kcache_wait),
			.flush_i(1'b0), // TODO to be populated with correct mem mapped reg
			.i_addr_i(0),
			.i_data_o(),
			.d_addr_i(0),
			.d_sel_wr_i(4'b0),
			.d_data_i(0),
			.d_data_o(),
			// SRAM wires
			.sram_addr_o(sram_addr_o),
			.sram_data_io(sram_data_io),
			.sram_cs_o(sram_cs_o),
			.sram_we_o(sram_we_o),
			.sram_oe_o(sram_oe_o),
			.sram_hb_o(sram_hb_o),
			.sram_lb_o(sram_lb_o)
			);
	always @(ram[i_addr_i] or i_addr_i) begin
		if ((i_addr_i << 2) & `ROM_ADDR)
			i_data_o  = rom[i_addr_i & ~(`ROM_ADDR >> 2)];
		else
			i_data_o  = ram[i_addr_i];
	end
	always @(*)
		kpu_wait_o = wb_interface_state != WB_IDLE ||
			     wb_write_start || wb_read_start || kcache_wait;
	// read
	always @(ram[d_addr_i] or d_addr_i or d_gp_i or d_sel_i
		 or io_int_num_i or wb_interface_state or wb_readed_data
		 or wb_readed_data_ready) begin
		wb_read_start 	    = 1'b0;
		wb_byte_count_read  = 2'd3;
		wb_reg_read 	    = 32'b0;
		d_data_o 	    = `N'h0;
		if (wb_readed_data_ready)
			d_data_o  = wb_readed_data;
		else if (d_sel_i == 4'b0000)
			case (d_addr_i << 2)
				`IO_INT_NUM_MAP: begin // Raised IO interrupt number
					d_data_o  = io_int_num_i;
				end
				`GP_IN_MAP: begin // General purpose input read
					d_data_o  = d_gp_i;
				end
				`UART_CONTROL_REG_MAP: begin
					if (wb_interface_state == WB_IDLE) begin
						wb_read_start  = 1'b1;
						wb_reg_read    = `UART_REG_CONTROL;
					end
				end
				`UART_STATUS_REG_MAP: begin
					if (wb_interface_state == WB_IDLE) begin
						wb_read_start  = 1'b1;
						wb_reg_read    = `UART_REG_STATUS;
					end
				end
				`UART_PRESCALER_REG_MAP: begin
					if (wb_interface_state == WB_IDLE) begin
						wb_read_start  = 1'b1;
						wb_reg_read    = `UART_REG_PRESCALER;
					end
				end
				`UART_CLOCK_DIV_REG_MAP: begin
					if (wb_interface_state == WB_IDLE) begin
						wb_read_start  = 1'b1;
						wb_reg_read    = `UART_REG_CLOCK_DIV;
					end
				end
				`UART_WRITE_COUNT_REG_MAP: begin
					if (wb_interface_state == WB_IDLE) begin
						wb_read_start  = 1'b1;
						wb_reg_read    = `UART_REG_WRITE_COUNT;
					end
				end
				`UART_WRITE_REG_MAP: begin
					if (wb_interface_state == WB_IDLE) begin
						wb_read_start  = 1'b1;
						wb_reg_read    = `UART_REG_WRITE;
					end
				end
				`UART_READ_COUNT_REG_MAP: begin
					if (wb_interface_state == WB_IDLE) begin
						wb_read_start 	= 1'b1;
						wb_reg_read 	= `UART_REG_READ_COUNT;
					end
				end
				`UART_READ_REG_MAP: begin
					if (wb_interface_state == WB_IDLE) begin
						wb_byte_count_read  = 2'd1;
						wb_read_start 	    = 1'b1;
						wb_reg_read 	    = `UART_REG_READ;
					end
				end
				default: begin // Normal memory read
					if ((d_addr_i << 2) & `ROM_ADDR)
						d_data_o  = rom[d_addr_i & ~(`ROM_ADDR >> 2)];
					else
						d_data_o  = ram[d_addr_i];
				end
			endcase
	end
	// write
	always @(posedge clk_i) begin
		wb_write_start <= #1 1'b0;
		casex (d_addr_i << 2)
			`GP_OUT_MAP: begin // General purpose output write
				if (d_sel_i[0])
					d_gp_o[7:0] <= #1 d_data_i[7:0];
				if (d_sel_i[1])
					d_gp_o[15:8] <= #1 d_data_i[15:8];
				if (d_sel_i[2])
					d_gp_o[23:16] <= #1 d_data_i[23:16];
				if (d_sel_i[3])
					d_gp_o[31:24] <= #1 d_data_i[31:24];
			end
			`UART_CONTROL_REG_MAP: begin
				// Start wishbone write procedure
				if (d_sel_i) begin
					if (wb_interface_state == WB_IDLE) begin
						wb_write_start <= #1 1'b1;
						wb_data_write  <= #1 d_data_i;
						wb_reg_write   <= #1 `UART_REG_CONTROL;
					end
					else begin
						wb_write_start <= #1 1'b0;
					end
				end
			end
			`UART_CLOCK_DIV_REG_MAP: begin
				// Start wishbone write procedure
				if (d_sel_i) begin
					if (wb_interface_state == WB_IDLE) begin
						wb_write_start <= #1 1'b1;
						wb_data_write  <= #1 d_data_i;
						wb_reg_write   <= #1 `UART_REG_CLOCK_DIV;
					end
					else begin
						wb_write_start <= #1 1'b0;
					end
				end
			end
			`UART_WRITE_REG_MAP: begin
				// Start wishbone write procedure
				if (d_sel_i) begin
					if (wb_interface_state == WB_IDLE) begin
						wb_write_start <= #1 1'b1;
						wb_data_write  <= #1 (1 << 16) | (d_data_i[7:0] << 8);
						wb_reg_write   <= #1 `UART_REG_WRITE;
					end
					else begin
						wb_write_start <= #1 1'b0;
					end
				end
			end
			default: begin // Normal memory write
				if (d_sel_i[0])
					ram[d_addr_i][7:0] <= #1 d_data_i[7:0];
				if (d_sel_i[1])
					ram[d_addr_i][15:8] <= #1 d_data_i[15:8];
				if (d_sel_i[2])
					ram[d_addr_i][23:16] <= #1 d_data_i[23:16];
				if (d_sel_i[3])
					ram[d_addr_i][31:24] <= #1 d_data_i[31:24];
			end
		endcase // case (wb_interface_state)
	end
	////////////////////////////////
        // WISHBONE READ/WRITE	      //
	always @(posedge clk_i) begin
		case (wb_interface_state )
			WB_IDLE: begin
				wb_readed_data_ready <= #1 1'b0;
				if (wb_write_start) begin
					wb_interface_state <= #1 WB_WRITE_ONGOING;
					wb_command_o 	   <= #1 `COMMAND_WRITE;
					wb_addr_o 	   <= #1 wb_reg_write;
					wb_data_o 	   <= #1 wb_data_write;
					wb_data_count_o  <= #1 28'h0;
					wb_ready_o 	   <= #1 1'b1;
				end
				else if (wb_read_start) begin
					wb_interface_state <= #1 WB_READ_ONGOING;
					wb_command_o 	   <= #1 `COMMAND_READ;
					wb_addr_o 	   <= #1 wb_reg_read;
					wb_data_count_o  <= #1 28'h0;
					wb_ready_o 	   <= #1 1'b1;
					wb_data_count_tmp  <= #1 wb_byte_count_read;
				end
			end
			WB_READ_ONGOING: begin
				if (wb_status_i == ~wb_command_o &&
				    (wb_data_count_i == 28'h0)) begin
					wb_ready_o 	   <= #1 1'b0;
					wb_interface_state <= #1 WB_READ_WAIT;
				end
			end
			WB_WRITE_ONGOING: begin
				if (wb_status_i == ~wb_command_o) begin
					wb_ready_o 	   <= #1 1'b0;
					wb_interface_state <= #1 WB_WRITE_WAIT;
				end
			end
			WB_READ_WAIT: begin
				if (wb_o_en_i) begin
					wb_ready_o 	     <= #1 1'b0;
					wb_interface_state   <= #1 WB_IDLE;
					wb_readed_data_ready <= #1 1'b1;
					if (wb_data_count_tmp == 2'd1)
						wb_readed_data <= #1 {24'b0, wb_data_i[31:24]};
					else
						wb_readed_data <= #1 wb_data_i;
				end
			end
			WB_WRITE_WAIT: begin
				if (wb_o_en_i) begin
					wb_ready_o 	   <= #1 1'b0;
					wb_interface_state <= #1 WB_IDLE;
				end
			end
		endcase
	end
	// Reset interrupt controller
	always @(posedge clk_i) begin
		if (d_addr_i << 2 == `IO_INT_NUM_MAP && d_sel_i != 4'b0000)
			int_ctrl_rst_o <= 1'b1;
		else
			int_ctrl_rst_o <= 1'b0;
	end
endmodule