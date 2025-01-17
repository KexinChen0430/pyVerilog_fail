module system (
	input            clk,
	input            resetn,
	output           trap,
        output reg [7:0] out_byte,
	output reg       out_byte_en
);
	// 0x2000 32bit words = 0x8000 Byte = 32kByte memory
        parameter MEMW_SIZE = 16'h8000;
        integer            tb_idx;
	wire mem_valid;
	wire mem_instr;
	reg mem_ready;
	reg mem_ready_last;
	wire [31:0] mem_addr;
	wire [31:0] mem_wdata;
	wire [3:0] mem_wstrb;
	reg [31:0] mem_rdata;
        wire uart_cs;
       	wire [3:0] uart_wstrb;
        wire [31:0] uart_rdata;
        wire [31:0] irqs;
        wire [31:0] eois;
	picorv32 picorv32_core (
		.clk         (clk         ),
		.resetn      (resetn      ),
		.trap        (trap        ),
		.mem_valid   (mem_valid   ),
		.mem_instr   (mem_instr   ),
		.mem_ready   (mem_ready   ),
		.mem_addr    (mem_addr    ),
		.mem_wdata   (mem_wdata   ),
		.mem_wstrb   (mem_wstrb   ),
		.mem_rdata   (mem_rdata   ),
                .irq(irqs),
                .eoi(eois)
	);
      `ifndef MEM_FILENAME
             simuart uart(
		.clk(clk),
		.cs(uart_cs),
		.bus_addr(mem_addr),
		.bus_wr_val(mem_wdata),
		.bus_bytesel(uart_wstrb),
		.bus_ack(),
		.bus_data(uart_rdata),
                .inter(irqs[0]),
                .intack(eois[0])
             );
      `else
           assign uart_rdata = 32'b0;
           assign irqs = 32'b0;
      `endif
       assign irqs[31:1] = 31'b0;
       assign uart_cs =  mem_addr[31:4] == 28'h1000000 && mem_valid;
       assign uart_wstrb = mem_wstrb & mem_ready;
	reg [31:0] memory [0:MEMW_SIZE-1];
	initial begin
                for (tb_idx=0; tb_idx < MEMW_SIZE; tb_idx=tb_idx+1)
                       memory[tb_idx] = 32'b0;
                `ifdef MEM_FILENAME
                     $readmemh(`MEM_FILENAME, memory);
                `else
                     $readmemh("../firmware.hex", memory);
                `endif
        end
	reg [31:0] m_read_data;
	reg m_read_en;
	always @(posedge clk) begin
			m_read_en <= 0;
			mem_ready <= mem_valid && !mem_ready_last && !mem_ready && m_read_en;
			mem_ready_last <= mem_ready;
                        out_byte_en <= 0;
			(* parallel_case *)
			case (1)
				mem_valid && !mem_ready && !mem_wstrb && (mem_addr >> 2) < MEMW_SIZE: begin
					m_read_en <= 1;
				        m_read_data <= memory[mem_addr >> 2];
				        mem_rdata <= m_read_data;
				end
				mem_valid && !mem_ready && |mem_wstrb && (mem_addr >> 2) < MEMW_SIZE: begin
					if (mem_wstrb[0]) memory[mem_addr >> 2][ 7: 0] <= mem_wdata[ 7: 0];
					if (mem_wstrb[1]) memory[mem_addr >> 2][15: 8] <= mem_wdata[15: 8];
					if (mem_wstrb[2]) memory[mem_addr >> 2][23:16] <= mem_wdata[23:16];
					if (mem_wstrb[3]) memory[mem_addr >> 2][31:24] <= mem_wdata[31:24];
					mem_ready <= 1;
				end
			        mem_valid && !mem_ready && !mem_wstrb && uart_cs: begin
					m_read_en <= 1;
                                        mem_rdata <= uart_rdata;
                                        //mem_rdata <= m_read_data;
				end
                                mem_valid && !mem_ready && |mem_wstrb && mem_addr == 32'h2000_0000: begin
					out_byte_en <= 1;
					out_byte <= mem_wdata;
					mem_ready <= 1;
				end
				mem_valid && !mem_ready && |mem_wstrb : begin
					mem_ready <= 1;
				end
			endcase
                        if (resetn && out_byte_en) begin
			   $write("%c", out_byte);
		        end
		end
endmodule