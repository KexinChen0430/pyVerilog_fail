module openMSP430_fpga (
// OUTPUTs
    aclk_en,                      // ACLK enable
    dbg_freeze,                   // Freeze peripherals
    dbg_uart_txd,                 // Debug interface: UART TXD
    irq_acc,                      // Interrupt request accepted (one-hot signal)
    per_addr,                     // Peripheral address
    per_din,                      // Peripheral data input
    per_wen,                      // Peripheral write enable (high active)
    per_en,                       // Peripheral enable (high active)
    smclk_en,                     // SMCLK enable
// INPUTs
    dbg_uart_rxd,                 // Debug interface: UART RXD
    dco_clk,                      // Fast oscillator (fast clock)
    irq,                          // Maskable interrupts
    lfxt_clk,                     // Low frequency oscillator (typ 32kHz)
    nmi,                          // Non-maskable interrupt (asynchronous)
    per_dout,                     // Peripheral data output
    reset_n                       // Reset Pin (low active)
);
// OUTPUTs
//=========
output              aclk_en;      // ACLK enable
output              dbg_freeze;   // Freeze peripherals
output              dbg_uart_txd; // Debug interface: UART TXD
output       [13:0] irq_acc;      // Interrupt request accepted (one-hot signal)
output        [7:0] per_addr;     // Peripheral address
output       [15:0] per_din;      // Peripheral data input
output        [1:0] per_wen;      // Peripheral write enable (high active)
output              per_en;       // Peripheral enable (high active)
output              smclk_en;     // SMCLK enable
// INPUTs
//=========
input               dbg_uart_rxd; // Debug interface: UART RXD
input               dco_clk;      // Fast oscillator (fast clock)
input  	     [13:0] irq;          // Maskable interrupts
input               lfxt_clk;     // Low frequency oscillator (typ 32kHz)
input  	            nmi;          // Non-maskable interrupt (asynchronous)
input        [15:0] per_dout;     // Peripheral data output
input               reset_n;      // Reset Pin (active low)
//=============================================================================
// 1)  INTERNAL WIRES/REGISTERS/PARAMETERS DECLARATION
//=============================================================================
wire  [`DMEM_MSB:0] dmem_addr;
wire                dmem_cen;
wire         [15:0] dmem_din;
wire          [1:0] dmem_wen;
wire         [15:0] dmem_dout;
wire  [`PMEM_MSB:0] pmem_addr;
wire                pmem_cen;
wire         [15:0] pmem_din;
wire          [1:0] pmem_wen;
wire         [15:0] pmem_dout;
wire                mclk;
wire                puc;
//=============================================================================
// 2)  PROGRAM AND DATA MEMORIES
//=============================================================================
dmem dmem_hi (.WD(dmem_din[15:8]), .RD(dmem_dout[15:8]), .WEN(dmem_wen[1] | dmem_cen), .REN(dmem_cen), .WADDR(dmem_addr) , .RADDR(dmem_addr), .RWCLK(mclk), .RESET(puc));
dmem dmem_lo (.WD(dmem_din[7:0]),  .RD(dmem_dout[7:0]),  .WEN(dmem_wen[0] | dmem_cen), .REN(dmem_cen), .WADDR(dmem_addr) , .RADDR(dmem_addr), .RWCLK(mclk), .RESET(puc));
pmem pmem_hi (.WD(pmem_din[15:8]), .RD(pmem_dout[15:8]), .WEN(pmem_wen[1] | pmem_cen), .REN(pmem_cen), .WADDR(pmem_addr) , .RADDR(pmem_addr), .RWCLK(mclk), .RESET(puc));
pmem pmem_lo (.WD(pmem_din[7:0]),  .RD(pmem_dout[7:0]),  .WEN(pmem_wen[0] | pmem_cen), .REN(pmem_cen), .WADDR(pmem_addr) , .RADDR(pmem_addr), .RWCLK(mclk), .RESET(puc));
//=============================================================================
// 3)  OPENMSP430
//=============================================================================
openMSP430 openMSP430_0 (
// OUTPUTs
    .aclk_en      (aclk_en),      // ACLK enable
    .dbg_freeze   (dbg_freeze),   // Freeze peripherals
    .dbg_uart_txd (dbg_uart_txd), // Debug interface: UART TXD
    .dmem_addr    (dmem_addr),    // Data Memory address
    .dmem_cen     (dmem_cen),     // Data Memory chip enable (low active)
    .dmem_din     (dmem_din),     // Data Memory data input
    .dmem_wen     (dmem_wen),     // Data Memory write enable (low active)
    .irq_acc      (irq_acc),      // Interrupt request accepted (one-hot signal)
    .mclk         (mclk),         // Main system clock
    .per_addr     (per_addr),     // Peripheral address
    .per_din      (per_din),      // Peripheral data input
    .per_wen      (per_wen),      // Peripheral write enable (high active)
    .per_en       (per_en),       // Peripheral enable (high active)
    .pmem_addr    (pmem_addr),    // Program Memory address
    .pmem_cen     (pmem_cen),     // Program Memory chip enable (low active)
    .pmem_din     (pmem_din),     // Program Memory data input (optional)
    .pmem_wen     (pmem_wen),     // Program Memory write enable (low active) (optional)
    .puc          (puc),          // Main system reset
    .smclk_en     (smclk_en),     // SMCLK enable
// INPUTs
    .dbg_uart_rxd (dbg_uart_rxd), // Debug interface: UART RXD
    .dco_clk      (dco_clk),      // Fast oscillator (fast clock)
    .dmem_dout    (dmem_dout),    // Data Memory data output
    .irq          (irq),          // Maskable interrupts
    .lfxt_clk     (lfxt_clk),     // Low frequency oscillator (typ 32kHz)
    .nmi          (nmi),          // Non-maskable interrupt (asynchronous)
    .per_dout     (per_dout),     // Peripheral data output
    .pmem_dout    (pmem_dout),    // Program Memory data output
    .reset_n      (reset_n)       // Reset Pin (low active)
);
endmodule