module top
(
    // Clocking & Reset
    input clk_i,
    input rst_i,
    // Fault Output
    output fault_o,
    // Break Output
    output break_o,
    // Interrupt Input
    input intr_i
);
// Params
parameter           CLK_KHZ              = 8192;
parameter           BOOT_VECTOR          = 32'h10000000;
parameter           ISR_VECTOR           = 32'h10000000;
// Registers / Wires
wire [31:0]         soc_addr;
wire [31:0]         soc_data_w;
wire [31:0]         soc_data_r;
wire                soc_we;
wire                soc_stb;
wire                soc_ack;
wire                soc_irq;
wire[31:0]          dmem_address;
wire[31:0]          dmem_data_w;
wire[31:0]          dmem_data_r;
wire[3:0]           dmem_sel;
wire[2:0]           dmem_cti;
wire                dmem_we;
wire                dmem_stb;
wire                dmem_cyc;
wire                dmem_stall;
wire                dmem_ack;
wire[31:0]          imem_addr;
wire[31:0]          imem_data;
wire[3:0]           imem_sel;
wire                imem_stb;
wire                imem_cyc;
wire[2:0]           imem_cti;
wire                imem_stall;
wire                imem_ack;
// Instantiation
ram
u_ram
(
    .clka_i(clk_i),
    .rsta_i(rst_i),
    .stba_i(imem_stb),
    .wea_i(1'b0),
    .sela_i(imem_sel),
    .addra_i(imem_addr[31:2]),
    .dataa_i(32'b0),
    .dataa_o(imem_data),
    .acka_o(imem_ack),
    .clkb_i(clk_i),
    .rstb_i(rst_i),
    .stbb_i(dmem_stb),
    .web_i(dmem_we),
    .selb_i(dmem_sel),
    .addrb_i(dmem_address[31:2]),
    .datab_i(dmem_data_w),
    .datab_o(dmem_data_r),
    .ackb_o(dmem_ack)
);
cpu_if
#(
    .CLK_KHZ(CLK_KHZ),
    .BOOT_VECTOR(32'h10000000),
    .ISR_VECTOR(32'h10000000),
    .ENABLE_ICACHE(`ICACHE_ENABLED),
    .ENABLE_DCACHE(`DCACHE_ENABLED),
    .REGISTER_FILE_TYPE("SIMULATION")
)
u_cpu
(
    // General - clocking & reset
    .clk_i(clk_i),
    .rst_i(rst_i),
    .fault_o(fault_o),
    .break_o(break_o),
    .nmi_i(1'b0),
    .intr_i(soc_irq),
    // Instruction Memory 0 (0x10000000 - 0x10FFFFFF)
    .imem0_addr_o(imem_addr),
    .imem0_data_i(imem_data),
    .imem0_sel_o(imem_sel),
    .imem0_cti_o(imem_cti),
    .imem0_cyc_o(imem_cyc),
    .imem0_stb_o(imem_stb),
    .imem0_stall_i(1'b0),
    .imem0_ack_i(imem_ack),
    // Data Memory 0 (0x10000000 - 0x10FFFFFF)
    .dmem0_addr_o(dmem_address),
    .dmem0_data_o(dmem_data_w),
    .dmem0_data_i(dmem_data_r),
    .dmem0_sel_o(dmem_sel),
    .dmem0_cti_o(dmem_cti),
    .dmem0_cyc_o(dmem_cyc),
    .dmem0_we_o(dmem_we),
    .dmem0_stb_o(dmem_stb),
    .dmem0_stall_i(1'b0),
    .dmem0_ack_i(dmem_ack),
    // Data Memory 1 (0x11000000 - 0x11FFFFFF)
    .dmem1_addr_o(/*open*/),
    .dmem1_data_o(/*open*/),
    .dmem1_data_i(32'b0),
    .dmem1_sel_o(/*open*/),
    .dmem1_we_o(/*open*/),
    .dmem1_stb_o(/*open*/),
    .dmem1_cyc_o(/*open*/),
    .dmem1_cti_o(/*open*/),
    .dmem1_stall_i(1'b0),
    .dmem1_ack_i(1'b1),
    // Data Memory 2 (0x12000000 - 0x12FFFFFF)
    .dmem2_addr_o(soc_addr),
    .dmem2_data_o(soc_data_w),
    .dmem2_data_i(soc_data_r),
    .dmem2_sel_o(/*open*/),
    .dmem2_we_o(soc_we),
    .dmem2_stb_o(soc_stb),
    .dmem2_cyc_o(/*open*/),
    .dmem2_cti_o(/*open*/),
    .dmem2_stall_i(1'b0),
    .dmem2_ack_i(soc_ack)
);
// CPU SOC
soc
#(
    .CLK_KHZ(CLK_KHZ),
    .ENABLE_SYSTICK_TIMER("ENABLED"),
    .ENABLE_HIGHRES_TIMER("ENABLED"),
    .EXTERNAL_INTERRUPTS(1)
)
u_soc
(
    // General - clocking & reset
    .clk_i(clk_i),
    .rst_i(rst_i),
    .ext_intr_i(1'b0),
    .intr_o(soc_irq),
    // Memory Port
    .io_addr_i(soc_addr),
    .io_data_i(soc_data_w),
    .io_data_o(soc_data_r),
    .io_we_i(soc_we),
    .io_stb_i(soc_stb),
    .io_ack_o(soc_ack)
);
endmodule