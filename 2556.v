module attosoc (
	input clk,
	input reset,
	output reg [7:0] led
);
	reg [5:0] reset_cnt = 0;
	wire resetn = &reset_cnt;
	always @(posedge clk) begin
		if (reset)
			reset_cnt <= 0;
		else
			reset_cnt <= reset_cnt + !resetn;
	end
	parameter integer MEM_WORDS = 256;
	parameter [31:0] STACKADDR = (4*MEM_WORDS);       // end of memory
	parameter [31:0] PROGADDR_RESET = 32'h 0000_0000; // ROM at 0x0
	parameter integer ROM_WORDS = 64;
	reg [31:0] rom [0:ROM_WORDS-1];
	wire [31:0] rom_rdata = rom[mem_addr[31:2]];
	initial $readmemh("firmware.hex", rom);
	wire mem_valid;
	wire mem_instr;
	wire mem_ready;
	wire [31:0] mem_addr;
	wire [31:0] mem_wdata;
	wire [3:0] mem_wstrb;
	wire [31:0] mem_rdata;
    wire rom_ready = mem_valid && mem_addr[31:24] == 8'h00;
	wire iomem_valid;
	wire iomem_ready;
	wire [31:0] iomem_addr;
	wire [31:0] iomem_wdata;
	wire [3:0] iomem_wstrb;
	wire [31:0] iomem_rdata;
	assign iomem_valid = mem_valid && (mem_addr[31:24] > 8'h 01);
	assign iomem_ready = 1'b1;
	assign iomem_wstrb = mem_wstrb;
	assign iomem_addr = mem_addr;
	assign iomem_wdata = mem_wdata;
	wire [31:0] spimemio_cfgreg_do;
    always @(posedge clk)
        if (iomem_valid && iomem_wstrb[0])
            led <= iomem_wdata[7:0];
	assign mem_ready = (iomem_valid && iomem_ready) || rom_ready;
	assign mem_rdata = rom_rdata;
	picorv32 #(
		.STACKADDR(STACKADDR),
		.PROGADDR_RESET(PROGADDR_RESET),
		.PROGADDR_IRQ(32'h 0000_0000),
		.BARREL_SHIFTER(0),
		.COMPRESSED_ISA(0),
		.ENABLE_MUL(0),
		.ENABLE_DIV(0),
		.ENABLE_IRQ(0),
		.ENABLE_IRQ_QREGS(0),
		.ENABLE_COUNTERS(0),
		.TWO_STAGE_SHIFT(0),
		.ENABLE_REGS_16_31(0)
	) cpu (
		.clk         (clk        ),
		.resetn      (resetn     ),
		.mem_valid   (mem_valid  ),
		.mem_instr   (mem_instr  ),
		.mem_ready   (mem_ready  ),
		.mem_addr    (mem_addr   ),
		.mem_wdata   (mem_wdata  ),
		.mem_wstrb   (mem_wstrb  ),
		.mem_rdata   (mem_rdata  )
	);
endmodule