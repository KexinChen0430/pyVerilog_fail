module  openMSP430 (
// OUTPUTs
    aclk_en,                       // ACLK enable
    dbg_freeze,                    // Freeze peripherals
    dbg_uart_txd,                  // Debug interface: UART TXD
    dmem_addr,                     // Data Memory address
    dmem_cen,                      // Data Memory chip enable (low active)
    dmem_din,                      // Data Memory data input
    dmem_wen,                      // Data Memory write enable (low active)
    irq_acc,                       // Interrupt request accepted (one-hot signal)
    mclk,                          // Main system clock
    per_addr,                      // Peripheral address
    per_din,                       // Peripheral data input
    per_wen,                       // Peripheral write enable (high active)
    per_en,                        // Peripheral enable (high active)
    pmem_addr,                     // Program Memory address
    pmem_cen,                      // Program Memory chip enable (low active)
    pmem_din,                      // Program Memory data input (optional)
    pmem_wen,                      // Program Memory write enable (low active) (optional)
    puc,                           // Main system reset
    smclk_en,                      // SMCLK enable
// INPUTs
    dbg_uart_rxd,                  // Debug interface: UART RXD
    dco_clk,                       // Fast oscillator (fast clock)
    dmem_dout,                     // Data Memory data output
    irq,                           // Maskable interrupts
    lfxt_clk,                      // Low frequency oscillator (typ 32kHz)
    nmi,                           // Non-maskable interrupt (asynchronous)
    per_dout,                      // Peripheral data output
    pmem_dout,                     // Program Memory data output
    reset_n                        // Reset Pin (low active)
);
// OUTPUTs
//=========
output               aclk_en;      // ACLK enable
output               dbg_freeze;   // Freeze peripherals
output               dbg_uart_txd; // Debug interface: UART TXD
output [`DMEM_MSB:0] dmem_addr;    // Data Memory address
output               dmem_cen;     // Data Memory chip enable (low active)
output        [15:0] dmem_din;     // Data Memory data input
output         [1:0] dmem_wen;     // Data Memory write enable (low active)
output        [13:0] irq_acc;      // Interrupt request accepted (one-hot signal)
output               mclk;         // Main system clock
output         [7:0] per_addr;     // Peripheral address
output        [15:0] per_din;      // Peripheral data input
output         [1:0] per_wen;      // Peripheral write enable (high active)
output               per_en;       // Peripheral enable (high active)
output [`PMEM_MSB:0] pmem_addr;    // Program Memory address
output               pmem_cen;     // Program Memory chip enable (low active)
output        [15:0] pmem_din;     // Program Memory data input (optional)
output         [1:0] pmem_wen;     // Program Memory write enable (low active) (optional)
output               puc;          // Main system reset
output               smclk_en;     // SMCLK enable
// INPUTs
//=========
input                dbg_uart_rxd; // Debug interface: UART RXD
input                dco_clk;      // Fast oscillator (fast clock)
input         [15:0] dmem_dout;    // Data Memory data output
input  	      [13:0] irq;          // Maskable interrupts
input                lfxt_clk;     // Low frequency oscillator (typ 32kHz)
input  	             nmi;          // Non-maskable interrupt (asynchronous)
input         [15:0] per_dout;     // Peripheral data output
input         [15:0] pmem_dout;    // Program Memory data output
input                reset_n;      // Reset Pin (active low)
//=============================================================================
// 1)  INTERNAL WIRES/REGISTERS/PARAMETERS DECLARATION
//=============================================================================
wire          [7:0] inst_ad;
wire          [7:0] inst_as;
wire         [11:0] inst_alu;
wire                inst_bw;
wire         [15:0] inst_dest;
wire         [15:0] inst_dext;
wire         [15:0] inst_sext;
wire          [7:0] inst_so;
wire         [15:0] inst_src;
wire          [2:0] inst_type;
wire          [3:0] e_state;
wire                exec_done;
wire         [15:0] eu_mab;
wire         [15:0] eu_mdb_in;
wire         [15:0] eu_mdb_out;
wire          [1:0] eu_mb_wr;
wire         [15:0] fe_mab;
wire         [15:0] fe_mdb_in;
wire         [15:0] pc_sw;
wire          [7:0] inst_jmp;
wire         [15:0] pc;
wire         [15:0] pc_nxt;
wire         [15:0] dbg_mem_addr;
wire         [15:0] dbg_mem_dout;
wire         [15:0] dbg_mem_din;
wire         [15:0] dbg_reg_din;
wire          [1:0] dbg_mem_wr;
wire         [15:0] per_dout_or;
wire         [15:0] per_dout_sfr;
wire         [15:0] per_dout_wdog;
wire         [15:0] per_dout_clk;
//=============================================================================
// 2)  GLOBAL CLOCK & RESET MANAGEMENT
//=============================================================================
omsp_clock_module clock_module_0 (
// OUTPUTs
    .aclk_en      (aclk_en),       // ACLK enablex
    .mclk         (mclk),          // Main system clock
    .per_dout     (per_dout_clk),  // Peripheral data output
    .por          (por),           // Power-on reset
    .puc          (puc),           // Main system reset
    .smclk_en     (smclk_en),      // SMCLK enable
// INPUTs
    .dbg_reset    (dbg_reset),     // Reset CPU from debug interface
    .dco_clk      (dco_clk),       // Fast oscillator (fast clock)
    .lfxt_clk     (lfxt_clk),      // Low frequency oscillator (typ 32kHz)
    .oscoff       (oscoff),        // Turns off LFXT1 clock input
    .per_addr     (per_addr),      // Peripheral address
    .per_din      (per_din),       // Peripheral data input
    .per_en       (per_en),        // Peripheral enable (high active)
    .per_wen      (per_wen),       // Peripheral write enable (high active)
    .reset_n      (reset_n),       // Reset Pin (low active)
    .scg1         (scg1),          // System clock generator 1. Turns off the SMCLK
    .wdt_reset    (wdt_reset)      // Watchdog-timer reset
);
//=============================================================================
// 3)  FRONTEND (<=> FETCH & DECODE)
//=============================================================================
omsp_frontend frontend_0 (
// OUTPUTs
    .dbg_halt_st  (dbg_halt_st),   // Halt/Run status from CPU
    .decode_noirq (decode_noirq),  // Frontend decode instruction
    .e_state      (e_state),       // Execution state
    .exec_done    (exec_done),     // Execution completed
    .inst_ad      (inst_ad),       // Decoded Inst: destination addressing mode
    .inst_as      (inst_as),       // Decoded Inst: source addressing mode
    .inst_alu     (inst_alu),      // ALU control signals
    .inst_bw      (inst_bw),       // Decoded Inst: byte width
    .inst_dest    (inst_dest),     // Decoded Inst: destination (one hot)
    .inst_dext    (inst_dext),     // Decoded Inst: destination extended instruction word
    .inst_irq_rst (inst_irq_rst),  // Decoded Inst: Reset interrupt
    .inst_jmp     (inst_jmp),      // Decoded Inst: Conditional jump
    .inst_sext    (inst_sext),     // Decoded Inst: source extended instruction word
    .inst_so      (inst_so),       // Decoded Inst: Single-operand arithmetic
    .inst_src     (inst_src),      // Decoded Inst: source (one hot)
    .inst_type    (inst_type),     // Decoded Instruction type
    .irq_acc      (irq_acc),       // Interrupt request accepted
    .mab          (fe_mab),        // Frontend Memory address bus
    .mb_en        (fe_mb_en),      // Frontend Memory bus enable
    .nmi_acc      (nmi_acc),       // Non-Maskable interrupt request accepted
    .pc           (pc),            // Program counter
    .pc_nxt       (pc_nxt),        // Next PC value (for CALL & IRQ)
// INPUTs
    .cpuoff       (cpuoff),        // Turns off the CPU
    .dbg_halt_cmd (dbg_halt_cmd),  // Halt CPU command
    .dbg_reg_sel  (dbg_mem_addr[3:0]), // Debug selected register for rd/wr access
    .fe_pmem_wait (fe_pmem_wait),  // Frontend wait for Instruction fetch
    .gie          (gie),           // General interrupt enable
    .irq          (irq),           // Maskable interrupts
    .mclk         (mclk),          // Main system clock
    .mdb_in       (fe_mdb_in),     // Frontend Memory data bus input
    .nmi_evt      (nmi_evt),       // Non-maskable interrupt event
    .pc_sw        (pc_sw),         // Program counter software value
    .pc_sw_wr     (pc_sw_wr),      // Program counter software write
    .puc          (puc),           // Main system reset
    .wdt_irq      (wdt_irq)        // Watchdog-timer interrupt
);
//=============================================================================
// 4)  EXECUTION UNIT
//=============================================================================
omsp_execution_unit execution_unit_0 (
// OUTPUTs
    .cpuoff       (cpuoff),        // Turns off the CPU
    .dbg_reg_din  (dbg_reg_din),   // Debug unit CPU register data input
    .mab          (eu_mab),        // Memory address bus
    .mb_en        (eu_mb_en),      // Memory bus enable
    .mb_wr        (eu_mb_wr),      // Memory bus write transfer
    .mdb_out      (eu_mdb_out),    // Memory data bus output
    .oscoff       (oscoff),        // Turns off LFXT1 clock input
    .pc_sw        (pc_sw),         // Program counter software value
    .pc_sw_wr     (pc_sw_wr),      // Program counter software write
    .scg1         (scg1),          // System clock generator 1. Turns off the SMCLK
// INPUTs
    .dbg_halt_st  (dbg_halt_st),   // Halt/Run status from CPU
    .dbg_mem_dout (dbg_mem_dout),  // Debug unit data output
    .dbg_reg_wr   (dbg_reg_wr),    // Debug unit CPU register write
    .e_state      (e_state),       // Execution state
    .exec_done    (exec_done),     // Execution completed
    .gie          (gie),           // General interrupt enable
    .inst_ad      (inst_ad),       // Decoded Inst: destination addressing mode
    .inst_as      (inst_as),       // Decoded Inst: source addressing mode
    .inst_alu     (inst_alu),      // ALU control signals
    .inst_bw      (inst_bw),       // Decoded Inst: byte width
    .inst_dest    (inst_dest),     // Decoded Inst: destination (one hot)
    .inst_dext    (inst_dext),     // Decoded Inst: destination extended instruction word
    .inst_irq_rst (inst_irq_rst),  // Decoded Inst: reset interrupt
    .inst_jmp     (inst_jmp),      // Decoded Inst: Conditional jump
    .inst_sext    (inst_sext),     // Decoded Inst: source extended instruction word
    .inst_so      (inst_so),       // Decoded Inst: Single-operand arithmetic
    .inst_src     (inst_src),      // Decoded Inst: source (one hot)
    .inst_type    (inst_type),     // Decoded Instruction type
    .mclk         (mclk),          // Main system clock
    .mdb_in       (eu_mdb_in),     // Memory data bus input
    .pc           (pc),            // Program counter
    .pc_nxt       (pc_nxt),        // Next PC value (for CALL & IRQ)
    .puc          (puc)            // Main system reset
);
//=============================================================================
// 5)  MEMORY BACKBONE
//=============================================================================
omsp_mem_backbone mem_backbone_0 (
// OUTPUTs
    .dbg_mem_din  (dbg_mem_din),   // Debug unit Memory data input
    .dmem_addr    (dmem_addr),     // Data Memory address
    .dmem_cen     (dmem_cen),      // Data Memory chip enable (low active)
    .dmem_din     (dmem_din),      // Data Memory data input
    .dmem_wen     (dmem_wen),      // Data Memory write enable (low active)
    .eu_mdb_in    (eu_mdb_in),     // Execution Unit Memory data bus input
    .fe_mdb_in    (fe_mdb_in),     // Frontend Memory data bus input
    .fe_pmem_wait (fe_pmem_wait),  // Frontend wait for Instruction fetch
    .per_addr     (per_addr),      // Peripheral address
    .per_din      (per_din),       // Peripheral data input
    .per_wen      (per_wen),       // Peripheral write enable (high active)
    .per_en       (per_en),        // Peripheral enable (high active)
    .pmem_addr    (pmem_addr),     // Program Memory address
    .pmem_cen     (pmem_cen),      // Program Memory chip enable (low active)
    .pmem_din     (pmem_din),      // Program Memory data input (optional)
    .pmem_wen     (pmem_wen),      // Program Memory write enable (low active) (optional)
// INPUTs
    .dbg_halt_st  (dbg_halt_st),   // Halt/Run status from CPU
    .dbg_mem_addr (dbg_mem_addr),  // Debug address for rd/wr access
    .dbg_mem_dout (dbg_mem_dout),  // Debug unit data output
    .dbg_mem_en   (dbg_mem_en),    // Debug unit memory enable
    .dbg_mem_wr   (dbg_mem_wr),    // Debug unit memory write
    .dmem_dout    (dmem_dout),     // Data Memory data output
    .eu_mab       (eu_mab[15:1]),  // Execution Unit Memory address bus
    .eu_mb_en     (eu_mb_en),      // Execution Unit Memory bus enable
    .eu_mb_wr     (eu_mb_wr),      // Execution Unit Memory bus write transfer
    .eu_mdb_out   (eu_mdb_out),    // Execution Unit Memory data bus output
    .fe_mab       (fe_mab[15:1]),  // Frontend Memory address bus
    .fe_mb_en     (fe_mb_en),      // Frontend Memory bus enable
    .mclk         (mclk),          // Main system clock
    .per_dout     (per_dout_or),   // Peripheral data output
    .pmem_dout    (pmem_dout),     // Program Memory data output
    .puc          (puc)            // Main system reset
);
//=============================================================================
// 6)  SPECIAL FUNCTION REGISTERS
//=============================================================================
omsp_sfr sfr_0 (
// OUTPUTs
    .nmie         (nmie),          // Non-maskable interrupt enable
    .per_dout     (per_dout_sfr),  // Peripheral data output
    .wdt_irq      (wdt_irq),       // Watchdog-timer interrupt
    .wdt_reset    (wdt_reset),     // Watchdog-timer reset
    .wdtie        (wdtie),         // Watchdog-timer interrupt enable
// INPUTs
    .mclk         (mclk),          // Main system clock
    .nmi_acc      (nmi_acc),       // Non-Maskable interrupt request accepted
    .per_addr     (per_addr),      // Peripheral address
    .per_din      (per_din),       // Peripheral data input
    .per_en       (per_en),        // Peripheral enable (high active)
    .per_wen      (per_wen),       // Peripheral write enable (high active)
    .por          (por),           // Power-on reset
    .puc          (puc),           // Main system reset
    .wdtifg_clr   (irq_acc[10]),   // Clear Watchdog-timer interrupt flag
    .wdtifg_set   (wdtifg_set),    // Set Watchdog-timer interrupt flag
    .wdtpw_error  (wdtpw_error),   // Watchdog-timer password error
    .wdttmsel     (wdttmsel)       // Watchdog-timer mode select
);
//=============================================================================
// 7)  WATCHDOG TIMER
//=============================================================================
omsp_watchdog watchdog_0 (
// OUTPUTs
    .nmi_evt      (nmi_evt),       // NMI Event
    .per_dout     (per_dout_wdog), // Peripheral data output
    .wdtifg_set   (wdtifg_set),    // Set Watchdog-timer interrupt flag
    .wdtpw_error  (wdtpw_error),   // Watchdog-timer password error
    .wdttmsel     (wdttmsel),      // Watchdog-timer mode select
// INPUTs
    .aclk_en      (aclk_en),       // ACLK enable
    .dbg_freeze   (dbg_freeze),    // Freeze Watchdog counter
    .mclk         (mclk),          // Main system clock
    .nmi          (nmi),           // Non-maskable interrupt (asynchronous)
    .nmie         (nmie),          // Non-maskable interrupt enable
    .per_addr     (per_addr),      // Peripheral address
    .per_din      (per_din),       // Peripheral data input
    .per_en       (per_en),        // Peripheral enable (high active)
    .per_wen      (per_wen),       // Peripheral write enable (high active)
    .puc          (puc),           // Main system reset
    .smclk_en     (smclk_en),      // SMCLK enable
    .wdtie        (wdtie)          // Watchdog-timer interrupt enable
);
//=============================================================================
// 8)  PERIPHERALS' OUTPUT BUS
//=============================================================================
assign  per_dout_or  =  per_dout      |
                        per_dout_clk  |
                        per_dout_sfr  |
                        per_dout_wdog;
//=============================================================================
// 9)  DEBUG INTERFACE
//=============================================================================
`ifdef DBG_EN
omsp_dbg dbg_0 (
// OUTPUTs
    .dbg_freeze   (dbg_freeze),    // Freeze peripherals
    .dbg_halt_cmd (dbg_halt_cmd),  // Halt CPU command
    .dbg_mem_addr (dbg_mem_addr),  // Debug address for rd/wr access
    .dbg_mem_dout (dbg_mem_dout),  // Debug unit data output
    .dbg_mem_en   (dbg_mem_en),    // Debug unit memory enable
    .dbg_mem_wr   (dbg_mem_wr),    // Debug unit memory write
    .dbg_reg_wr   (dbg_reg_wr),    // Debug unit CPU register write
    .dbg_reset    (dbg_reset),     // Reset CPU from debug interface
    .dbg_uart_txd (dbg_uart_txd),  // Debug interface: UART TXD
// INPUTs
    .dbg_halt_st  (dbg_halt_st),   // Halt/Run status from CPU
    .dbg_mem_din  (dbg_mem_din),   // Debug unit Memory data input
    .dbg_reg_din  (dbg_reg_din),   // Debug unit CPU register data input
    .dbg_uart_rxd (dbg_uart_rxd),  // Debug interface: UART RXD
    .decode_noirq (decode_noirq),  // Frontend decode instruction
    .eu_mab       (eu_mab),        // Execution-Unit Memory address bus
    .eu_mb_en     (eu_mb_en),      // Execution-Unit Memory bus enable
    .eu_mb_wr     (eu_mb_wr),      // Execution-Unit Memory bus write transfer
    .eu_mdb_in    (eu_mdb_in),     // Memory data bus input
    .eu_mdb_out   (eu_mdb_out),    // Memory data bus output
    .exec_done    (exec_done),     // Execution completed
    .fe_mb_en     (fe_mb_en),      // Frontend Memory bus enable
    .fe_mdb_in    (fe_mdb_in),     // Frontend Memory data bus input
    .mclk         (mclk),          // Main system clock
    .pc           (pc),            // Program counter
    .por          (por),           // Power on reset
    .puc          (puc)            // Main system reset
);
`else
assign dbg_freeze   =  1'b0;
assign dbg_halt_cmd =  1'b0;
assign dbg_mem_addr = 16'h0000;
assign dbg_mem_dout = 16'h0000;
assign dbg_mem_en   =  1'b0;
assign dbg_mem_wr   =  2'b00;
assign dbg_reg_wr   =  1'b0;
assign dbg_reset    =  1'b0;
assign dbg_uart_txd =  1'b0;
`endif
endmodule