module  omsp_dbg (
// OUTPUTs
    dbg_freeze,                     // Freeze peripherals
    dbg_halt_cmd,                   // Halt CPU command
    dbg_mem_addr,                   // Debug address for rd/wr access
    dbg_mem_dout,                   // Debug unit data output
    dbg_mem_en,                     // Debug unit memory enable
    dbg_mem_wr,                     // Debug unit memory write
    dbg_reg_wr,                     // Debug unit CPU register write
    dbg_reset,                      // Reset CPU from debug interface
    dbg_uart_txd,                   // Debug interface: UART TXD
// INPUTs
    dbg_halt_st,                    // Halt/Run status from CPU
    dbg_mem_din,                    // Debug unit Memory data input
    dbg_reg_din,                    // Debug unit CPU register data input
    dbg_uart_rxd,                   // Debug interface: UART RXD
    decode_noirq,                   // Frontend decode instruction
    eu_mab,                         // Execution-Unit Memory address bus
    eu_mb_en,                       // Execution-Unit Memory bus enable
    eu_mb_wr,                       // Execution-Unit Memory bus write transfer
    eu_mdb_in,                      // Memory data bus input
    eu_mdb_out,                     // Memory data bus output
    exec_done,                      // Execution completed
    fe_mb_en,                       // Frontend Memory bus enable
    fe_mdb_in,                      // Frontend Memory data bus input
    mclk,                           // Main system clock
    pc,                             // Program counter
    por,                            // Power on reset
    puc                             // Main system reset
);
// OUTPUTs
//=========
output              dbg_freeze;     // Freeze peripherals
output              dbg_halt_cmd;   // Halt CPU command
output       [15:0] dbg_mem_addr;   // Debug address for rd/wr access
output       [15:0] dbg_mem_dout;   // Debug unit data output
output              dbg_mem_en;     // Debug unit memory enable
output        [1:0] dbg_mem_wr;     // Debug unit memory write
output              dbg_reg_wr;     // Debug unit CPU register write
output              dbg_reset;      // Reset CPU from debug interface
output              dbg_uart_txd;   // Debug interface: UART TXD
// INPUTs
//=========
input               dbg_halt_st;    // Halt/Run status from CPU
input        [15:0] dbg_mem_din;    // Debug unit Memory data input
input        [15:0] dbg_reg_din;    // Debug unit CPU register data input
input               dbg_uart_rxd;   // Debug interface: UART RXD
input               decode_noirq;   // Frontend decode instruction
input        [15:0] eu_mab;         // Execution-Unit Memory address bus
input               eu_mb_en;       // Execution-Unit Memory bus enable
input         [1:0] eu_mb_wr;       // Execution-Unit Memory bus write transfer
input        [15:0] eu_mdb_in;      // Memory data bus input
input        [15:0] eu_mdb_out;     // Memory data bus output
input               exec_done;      // Execution completed
input               fe_mb_en;       // Frontend Memory bus enable
input        [15:0] fe_mdb_in;      // Frontend Memory data bus input
input               mclk;           // Main system clock
input        [15:0] pc;             // Program counter
input               por;            // Power on reset
input               puc;            // Main system reset
//=============================================================================
// 1)  WIRE & PARAMETER DECLARATION
//=============================================================================
// Diverse wires and registers
wire  [5:0] dbg_addr;
wire [15:0] dbg_din;
wire        dbg_wr;
reg 	    mem_burst;
wire        dbg_reg_rd;
wire        dbg_mem_rd;
reg         dbg_mem_rd_dly;
wire        dbg_swbrk;
wire        dbg_rd;
reg         dbg_rd_rdy;
wire        mem_burst_rd;
wire        mem_burst_wr;
wire        brk0_halt;
wire        brk0_pnd;
wire [15:0] brk0_dout;
wire        brk1_halt;
wire        brk1_pnd;
wire [15:0] brk1_dout;
wire        brk2_halt;
wire        brk2_pnd;
wire [15:0] brk2_dout;
wire        brk3_halt;
wire        brk3_pnd;
wire [15:0] brk3_dout;
// Register addresses
parameter           CPU_ID_LO    = 6'h00;
parameter           CPU_ID_HI    = 6'h01;
parameter           CPU_CTL      = 6'h02;
parameter           CPU_STAT     = 6'h03;
parameter           MEM_CTL      = 6'h04;
parameter           MEM_ADDR     = 6'h05;
parameter           MEM_DATA     = 6'h06;
parameter           MEM_CNT      = 6'h07;
`ifdef DBG_HWBRK_0
parameter           BRK0_CTL     = 6'h08;
parameter           BRK0_STAT    = 6'h09;
parameter           BRK0_ADDR0   = 6'h0A;
parameter           BRK0_ADDR1   = 6'h0B;
`endif
`ifdef DBG_HWBRK_1
parameter           BRK1_CTL     = 6'h0C;
parameter           BRK1_STAT    = 6'h0D;
parameter           BRK1_ADDR0   = 6'h0E;
parameter           BRK1_ADDR1   = 6'h0F;
`endif
`ifdef DBG_HWBRK_2
parameter           BRK2_CTL     = 6'h10;
parameter           BRK2_STAT    = 6'h11;
parameter           BRK2_ADDR0   = 6'h12;
parameter           BRK2_ADDR1   = 6'h13;
`endif
`ifdef DBG_HWBRK_3
parameter           BRK3_CTL     = 6'h14;
parameter           BRK3_STAT    = 6'h15;
parameter           BRK3_ADDR0   = 6'h16;
parameter           BRK3_ADDR1   = 6'h17;
`endif
// Register one-hot decoder
parameter           CPU_ID_LO_D  = (64'h1 << CPU_ID_LO);
parameter           CPU_ID_HI_D  = (64'h1 << CPU_ID_HI);
parameter           CPU_CTL_D    = (64'h1 << CPU_CTL);
parameter           CPU_STAT_D   = (64'h1 << CPU_STAT);
parameter           MEM_CTL_D    = (64'h1 << MEM_CTL);
parameter           MEM_ADDR_D   = (64'h1 << MEM_ADDR);
parameter           MEM_DATA_D   = (64'h1 << MEM_DATA);
parameter           MEM_CNT_D    = (64'h1 << MEM_CNT);
`ifdef DBG_HWBRK_0
parameter           BRK0_CTL_D   = (64'h1 << BRK0_CTL);
parameter           BRK0_STAT_D  = (64'h1 << BRK0_STAT);
parameter           BRK0_ADDR0_D = (64'h1 << BRK0_ADDR0);
parameter           BRK0_ADDR1_D = (64'h1 << BRK0_ADDR1);
`endif
`ifdef DBG_HWBRK_1
parameter           BRK1_CTL_D   = (64'h1 << BRK1_CTL);
parameter           BRK1_STAT_D  = (64'h1 << BRK1_STAT);
parameter           BRK1_ADDR0_D = (64'h1 << BRK1_ADDR0);
parameter           BRK1_ADDR1_D = (64'h1 << BRK1_ADDR1);
`endif
`ifdef DBG_HWBRK_2
parameter           BRK2_CTL_D   = (64'h1 << BRK2_CTL);
parameter           BRK2_STAT_D  = (64'h1 << BRK2_STAT);
parameter           BRK2_ADDR0_D = (64'h1 << BRK2_ADDR0);
parameter           BRK2_ADDR1_D = (64'h1 << BRK2_ADDR1);
`endif
`ifdef DBG_HWBRK_3
parameter           BRK3_CTL_D   = (64'h1 << BRK3_CTL);
parameter           BRK3_STAT_D  = (64'h1 << BRK3_STAT);
parameter           BRK3_ADDR0_D = (64'h1 << BRK3_ADDR0);
parameter           BRK3_ADDR1_D = (64'h1 << BRK3_ADDR1);
`endif
//============================================================================
// 2)  REGISTER DECODER
//============================================================================
// Select Data register during a burst
wire  [5:0] dbg_addr_in = mem_burst ? MEM_DATA : dbg_addr;
// Register address decode
reg  [63:0]  reg_dec;
always @(dbg_addr_in)
  case (dbg_addr_in)
    CPU_ID_LO :  reg_dec  =  CPU_ID_LO_D;
    CPU_ID_HI :  reg_dec  =  CPU_ID_HI_D;
    CPU_CTL   :  reg_dec  =  CPU_CTL_D;
    CPU_STAT  :  reg_dec  =  CPU_STAT_D;
    MEM_CTL   :  reg_dec  =  MEM_CTL_D;
    MEM_ADDR  :  reg_dec  =  MEM_ADDR_D;
    MEM_DATA  :  reg_dec  =  MEM_DATA_D;
    MEM_CNT   :  reg_dec  =  MEM_CNT_D;
`ifdef DBG_HWBRK_0
    BRK0_CTL  :  reg_dec  =  BRK0_CTL_D;
    BRK0_STAT :  reg_dec  =  BRK0_STAT_D;
    BRK0_ADDR0:  reg_dec  =  BRK0_ADDR0_D;
    BRK0_ADDR1:  reg_dec  =  BRK0_ADDR1_D;
`endif
`ifdef DBG_HWBRK_1
    BRK1_CTL  :  reg_dec  =  BRK1_CTL_D;
    BRK1_STAT :  reg_dec  =  BRK1_STAT_D;
    BRK1_ADDR0:  reg_dec  =  BRK1_ADDR0_D;
    BRK1_ADDR1:  reg_dec  =  BRK1_ADDR1_D;
`endif
`ifdef DBG_HWBRK_2
    BRK2_CTL  :  reg_dec  =  BRK2_CTL_D;
    BRK2_STAT :  reg_dec  =  BRK2_STAT_D;
    BRK2_ADDR0:  reg_dec  =  BRK2_ADDR0_D;
    BRK2_ADDR1:  reg_dec  =  BRK2_ADDR1_D;
`endif
`ifdef DBG_HWBRK_3
    BRK3_CTL  :  reg_dec  =  BRK3_CTL_D;
    BRK3_STAT :  reg_dec  =  BRK3_STAT_D;
    BRK3_ADDR0:  reg_dec  =  BRK3_ADDR0_D;
    BRK3_ADDR1:  reg_dec  =  BRK3_ADDR1_D;
`endif
    default:     reg_dec  =  {64{1'b0}};
  endcase
// Read/Write probes
wire         reg_write =  dbg_wr;
wire         reg_read  =  1'b1;
// Read/Write vectors
wire [511:0] reg_wr    = reg_dec & {64{reg_write}};
wire [511:0] reg_rd    = reg_dec & {64{reg_read}};
//=============================================================================
// 3)  REGISTER: CORE INTERFACE
//=============================================================================
// CPU_ID Register
wire  [3:0] cpu_id_pmem = `PMEM_AWIDTH;
wire  [3:0] cpu_id_dmem = `DMEM_AWIDTH;
wire [31:0] cpu_id      = {`DBG_ID, cpu_id_pmem, cpu_id_dmem};
// CPU_CTL Register
//       7         6          5          4           3        2     1    0
//   Reserved   CPU_RST  RST_BRK_EN  FRZ_BRK_EN  SW_BRK_EN  ISTEP  RUN  HALT
reg   [6:3] cpu_ctl;
wire        cpu_ctl_wr = reg_wr[CPU_CTL];
always @ (posedge mclk or posedge por)
  if (por)             cpu_ctl <=  4'h0;
  else if (cpu_ctl_wr) cpu_ctl <=  dbg_din[6:3];
wire  [7:0] cpu_ctl_full = {1'b0, cpu_ctl, 3'b000};
wire        halt_cpu = cpu_ctl_wr & dbg_din[`HALT]  & ~dbg_halt_st;
wire        run_cpu  = cpu_ctl_wr & dbg_din[`RUN]   &  dbg_halt_st;
wire        istep    = cpu_ctl_wr & dbg_din[`ISTEP] &  dbg_halt_st;
// CPU_STAT Register
//      7           6          5           4           3         2      1       0
// HWBRK3_PND  HWBRK2_PND  HWBRK1_PND  HWBRK0_PND  SWBRK_PND  PUC_PND  Res.  HALT_RUN
reg   [3:2] cpu_stat;
wire        cpu_stat_wr  = reg_wr[CPU_STAT];
wire  [3:2] cpu_stat_set = {dbg_swbrk, puc};
wire  [3:2] cpu_stat_clr = ~dbg_din[3:2];
always @ (posedge mclk or posedge por)
  if (por)              cpu_stat <=  2'b00;
  else if (cpu_stat_wr) cpu_stat <= ((cpu_stat & cpu_stat_clr) | cpu_stat_set);
  else                  cpu_stat <=  (cpu_stat                 | cpu_stat_set);
wire  [7:0] cpu_stat_full = {brk3_pnd, brk2_pnd, brk1_pnd, brk0_pnd,
                             cpu_stat, 1'b0, dbg_halt_st};
//=============================================================================
// 4)  REGISTER: MEMORY INTERFACE
//=============================================================================
// MEM_CTL Register
//       7     6     5     4          3        2         1       0
//            Reserved               B/W    MEM/REG    RD/WR   START
// START  :  -  0 : Do nothing.
// RD/WR  :  -  0 : Read access.
// MEM/REG:  -  0 : Memory access.
// B/W    :  -  0 : 16 bit access.
reg   [3:1] mem_ctl;
wire        mem_ctl_wr = reg_wr[MEM_CTL];
always @ (posedge mclk or posedge por)
  if (por)             mem_ctl <=  3'h0;
  else if (mem_ctl_wr) mem_ctl <=  dbg_din[3:1];
wire  [7:0] mem_ctl_full  = {4'b0000, mem_ctl, 1'b0};
reg         mem_start;
always @ (posedge mclk or posedge por)
  if (por)  mem_start <=  1'b0;
  else      mem_start <=  mem_ctl_wr & dbg_din[0];
wire        mem_bw    = mem_ctl[3];
// MEM_DATA Register
reg  [15:0] mem_data;
reg  [15:0] mem_addr;
wire        mem_access;
wire        mem_data_wr = reg_wr[MEM_DATA];
wire [15:0] dbg_mem_din_bw = ~mem_bw      ? dbg_mem_din                :
	                      mem_addr[0] ? {8'h00, dbg_mem_din[15:8]} :
	                                    {8'h00, dbg_mem_din[7:0]};
always @ (posedge mclk or posedge por)
  if (por)                 mem_data <=  16'h0000;
  else if (mem_data_wr)    mem_data <=  dbg_din;
  else if (dbg_reg_rd)     mem_data <=  dbg_reg_din;
  else if (dbg_mem_rd_dly) mem_data <=  dbg_mem_din_bw;
// MEM_ADDR Register
reg  [15:0] mem_cnt;
wire        mem_addr_wr  = reg_wr[MEM_ADDR];
wire        dbg_mem_acc  = (|dbg_mem_wr | (dbg_rd_rdy & ~mem_ctl[2]));
wire        dbg_reg_acc  = ( dbg_reg_wr | (dbg_rd_rdy &  mem_ctl[2]));
wire [15:0] mem_addr_inc = (mem_cnt==16'h0000)         ? 16'h0000 :
                           (dbg_mem_acc & ~mem_bw)     ? 16'h0002 :
                           (dbg_mem_acc | dbg_reg_acc) ? 16'h0001 : 16'h0000;
always @ (posedge mclk or posedge por)
  if (por)              mem_addr <=  16'h0000;
  else if (mem_addr_wr) mem_addr <=  dbg_din;
  else                  mem_addr <=  mem_addr + mem_addr_inc;
// MEM_CNT Register
wire        mem_cnt_wr  = reg_wr[MEM_CNT];
wire [15:0] mem_cnt_dec = (mem_cnt==16'h0000)         ? 16'h0000 :
                          (dbg_mem_acc | dbg_reg_acc) ? 16'hffff : 16'h0000;
always @ (posedge mclk or posedge por)
  if (por)             mem_cnt <=  16'h0000;
  else if (mem_cnt_wr) mem_cnt <=  dbg_din;
  else                 mem_cnt <=  mem_cnt + mem_cnt_dec;
//=============================================================================
// 5)  BREAKPOINTS / WATCHPOINTS
//=============================================================================
`ifdef DBG_HWBRK_0
// Hardware Breakpoint/Watchpoint Register read select
wire [3:0] brk0_reg_rd = {reg_rd[BRK0_ADDR1],
                          reg_rd[BRK0_ADDR0],
                          reg_rd[BRK0_STAT],
                          reg_rd[BRK0_CTL]};
// Hardware Breakpoint/Watchpoint Register write select
wire [3:0] brk0_reg_wr = {reg_wr[BRK0_ADDR1],
                          reg_wr[BRK0_ADDR0],
                          reg_wr[BRK0_STAT],
                          reg_wr[BRK0_CTL]};
omsp_dbg_hwbrk dbg_hwbr_0 (
// OUTPUTs
    .brk_halt   (brk0_halt),   // Hardware breakpoint command
    .brk_pnd    (brk0_pnd),    // Hardware break/watch-point pending
    .brk_dout   (brk0_dout),   // Hardware break/watch-point register data input
// INPUTs
    .brk_reg_rd (brk0_reg_rd), // Hardware break/watch-point register read select
    .brk_reg_wr (brk0_reg_wr), // Hardware break/watch-point register write select
    .dbg_din    (dbg_din),     // Debug register data input
    .eu_mab     (eu_mab),      // Execution-Unit Memory address bus
    .eu_mb_en   (eu_mb_en),    // Execution-Unit Memory bus enable
    .eu_mb_wr   (eu_mb_wr),    // Execution-Unit Memory bus write transfer
    .eu_mdb_in  (eu_mdb_in),   // Memory data bus input
    .eu_mdb_out (eu_mdb_out),  // Memory data bus output
    .exec_done  (exec_done),   // Execution completed
    .fe_mb_en   (fe_mb_en),    // Frontend Memory bus enable
    .mclk       (mclk),        // Main system clock
    .pc         (pc),          // Program counter
    .por        (por)          // Power on reset
);
`else
assign brk0_halt =  1'b0;
assign brk0_pnd  =  1'b0;
assign brk0_dout = 16'h0000;
`endif
`ifdef DBG_HWBRK_1
// Hardware Breakpoint/Watchpoint Register read select
wire [3:0] brk1_reg_rd = {reg_rd[BRK1_ADDR1],
                          reg_rd[BRK1_ADDR0],
                          reg_rd[BRK1_STAT],
                          reg_rd[BRK1_CTL]};
// Hardware Breakpoint/Watchpoint Register write select
wire [3:0] brk1_reg_wr = {reg_wr[BRK1_ADDR1],
                          reg_wr[BRK1_ADDR0],
                          reg_wr[BRK1_STAT],
                          reg_wr[BRK1_CTL]};
omsp_dbg_hwbrk dbg_hwbr_1 (
// OUTPUTs
    .brk_halt   (brk1_halt),   // Hardware breakpoint command
    .brk_pnd    (brk1_pnd),    // Hardware break/watch-point pending
    .brk_dout   (brk1_dout),   // Hardware break/watch-point register data input
// INPUTs
    .brk_reg_rd (brk1_reg_rd), // Hardware break/watch-point register read select
    .brk_reg_wr (brk1_reg_wr), // Hardware break/watch-point register write select
    .dbg_din    (dbg_din),     // Debug register data input
    .eu_mab     (eu_mab),      // Execution-Unit Memory address bus
    .eu_mb_en   (eu_mb_en),    // Execution-Unit Memory bus enable
    .eu_mb_wr   (eu_mb_wr),    // Execution-Unit Memory bus write transfer
    .eu_mdb_in  (eu_mdb_in),   // Memory data bus input
    .eu_mdb_out (eu_mdb_out),  // Memory data bus output
    .exec_done  (exec_done),   // Execution completed
    .fe_mb_en   (fe_mb_en),    // Frontend Memory bus enable
    .mclk       (mclk),        // Main system clock
    .pc         (pc),          // Program counter
    .por        (por)          // Power on reset
);
`else
assign brk1_halt =  1'b0;
assign brk1_pnd  =  1'b0;
assign brk1_dout = 16'h0000;
`endif
 `ifdef DBG_HWBRK_2
// Hardware Breakpoint/Watchpoint Register read select
wire [3:0] brk2_reg_rd = {reg_rd[BRK2_ADDR1],
                          reg_rd[BRK2_ADDR0],
                          reg_rd[BRK2_STAT],
                          reg_rd[BRK2_CTL]};
// Hardware Breakpoint/Watchpoint Register write select
wire [3:0] brk2_reg_wr = {reg_wr[BRK2_ADDR1],
                          reg_wr[BRK2_ADDR0],
                          reg_wr[BRK2_STAT],
                          reg_wr[BRK2_CTL]};
omsp_dbg_hwbrk dbg_hwbr_2 (
// OUTPUTs
    .brk_halt   (brk2_halt),   // Hardware breakpoint command
    .brk_pnd    (brk2_pnd),    // Hardware break/watch-point pending
    .brk_dout   (brk2_dout),   // Hardware break/watch-point register data input
// INPUTs
    .brk_reg_rd (brk2_reg_rd), // Hardware break/watch-point register read select
    .brk_reg_wr (brk2_reg_wr), // Hardware break/watch-point register write select
    .dbg_din    (dbg_din),     // Debug register data input
    .eu_mab     (eu_mab),      // Execution-Unit Memory address bus
    .eu_mb_en   (eu_mb_en),    // Execution-Unit Memory bus enable
    .eu_mb_wr   (eu_mb_wr),    // Execution-Unit Memory bus write transfer
    .eu_mdb_in  (eu_mdb_in),   // Memory data bus input
    .eu_mdb_out (eu_mdb_out),  // Memory data bus output
    .exec_done  (exec_done),   // Execution completed
    .fe_mb_en   (fe_mb_en),    // Frontend Memory bus enable
    .mclk       (mclk),        // Main system clock
    .pc         (pc),          // Program counter
    .por        (por)          // Power on reset
);
`else
assign brk2_halt =  1'b0;
assign brk2_pnd  =  1'b0;
assign brk2_dout = 16'h0000;
`endif
`ifdef DBG_HWBRK_3
// Hardware Breakpoint/Watchpoint Register read select
wire [3:0] brk3_reg_rd = {reg_rd[BRK3_ADDR1],
                          reg_rd[BRK3_ADDR0],
                          reg_rd[BRK3_STAT],
                          reg_rd[BRK3_CTL]};
// Hardware Breakpoint/Watchpoint Register write select
wire [3:0] brk3_reg_wr = {reg_wr[BRK3_ADDR1],
                          reg_wr[BRK3_ADDR0],
                          reg_wr[BRK3_STAT],
                          reg_wr[BRK3_CTL]};
omsp_dbg_hwbrk dbg_hwbr_3 (
// OUTPUTs
    .brk_halt   (brk3_halt),   // Hardware breakpoint command
    .brk_pnd    (brk3_pnd),    // Hardware break/watch-point pending
    .brk_dout   (brk3_dout),   // Hardware break/watch-point register data input
// INPUTs
    .brk_reg_rd (brk3_reg_rd), // Hardware break/watch-point register read select
    .brk_reg_wr (brk3_reg_wr), // Hardware break/watch-point register write select
    .dbg_din    (dbg_din),     // Debug register data input
    .eu_mab     (eu_mab),      // Execution-Unit Memory address bus
    .eu_mb_en   (eu_mb_en),    // Execution-Unit Memory bus enable
    .eu_mb_wr   (eu_mb_wr),    // Execution-Unit Memory bus write transfer
    .eu_mdb_in  (eu_mdb_in),   // Memory data bus input
    .eu_mdb_out (eu_mdb_out),  // Memory data bus output
    .exec_done  (exec_done),   // Execution completed
    .fe_mb_en   (fe_mb_en),    // Frontend Memory bus enable
    .mclk       (mclk),        // Main system clock
    .pc         (pc),          // Program counter
    .por        (por)          // Power on reset
);
`else
assign brk3_halt =  1'b0;
assign brk3_pnd  =  1'b0;
assign brk3_dout = 16'h0000;
`endif
//============================================================================
// 6) DATA OUTPUT GENERATION
//============================================================================
wire [15:0] cpu_id_lo_rd = cpu_id[15:0]           & {16{reg_rd[CPU_ID_LO]}};
wire [15:0] cpu_id_hi_rd = cpu_id[31:16]          & {16{reg_rd[CPU_ID_HI]}};
wire [15:0] cpu_ctl_rd   = {8'h00, cpu_ctl_full}  & {16{reg_rd[CPU_CTL]}};
wire [15:0] cpu_stat_rd  = {8'h00, cpu_stat_full} & {16{reg_rd[CPU_STAT]}};
wire [15:0] mem_ctl_rd   = {8'h00, mem_ctl_full}  & {16{reg_rd[MEM_CTL]}};
wire [15:0] mem_data_rd  = mem_data               & {16{reg_rd[MEM_DATA]}};
wire [15:0] mem_addr_rd  = mem_addr               & {16{reg_rd[MEM_ADDR]}};
wire [15:0] mem_cnt_rd   = mem_cnt                & {16{reg_rd[MEM_CNT]}};
wire [15:0] dbg_dout = cpu_id_lo_rd |
                       cpu_id_hi_rd |
                       cpu_ctl_rd   |
                       cpu_stat_rd  |
                       mem_ctl_rd   |
                       mem_data_rd  |
                       mem_addr_rd  |
                       mem_cnt_rd   |
                       brk0_dout    |
                       brk1_dout    |
                       brk2_dout    |
                       brk3_dout;
// Tell UART/JTAG interface that the data is ready to be read
always @ (posedge mclk or posedge por)
  if (por)                           dbg_rd_rdy  <=  1'b0;
  else if (mem_burst | mem_burst_rd) dbg_rd_rdy  <= (dbg_reg_rd | dbg_mem_rd_dly);
  else                               dbg_rd_rdy  <=  dbg_rd;
//============================================================================
// 7) CPU CONTROL
//============================================================================
// Reset CPU
wire dbg_reset  = cpu_ctl[`CPU_RST];
// Break after reset
wire halt_rst = cpu_ctl[`RST_BRK_EN] & puc;
// Freeze peripherals
wire dbg_freeze = dbg_halt_st & cpu_ctl[`FRZ_BRK_EN];
// Software break
assign dbg_swbrk = (fe_mdb_in==`DBG_SWBRK_OP) & decode_noirq & cpu_ctl[`SW_BRK_EN];
// Single step
reg [1:0] inc_step;
always @(posedge mclk or posedge por)
  if (por)        inc_step <= 2'b00;
  else if (istep) inc_step <= 2'b11;
  else            inc_step <= {inc_step[0], 1'b0};
// Run / Halt
reg   halt_flag;
wire  mem_halt_cpu;
wire  mem_run_cpu;
wire  halt_flag_clr = run_cpu   | mem_run_cpu;
wire  halt_flag_set = halt_cpu  | halt_rst  | dbg_swbrk | mem_halt_cpu |
                      brk0_halt | brk1_halt | brk2_halt | brk3_halt;
always @(posedge mclk or posedge por)
  if (por)                halt_flag <= 1'b0;
  else if (halt_flag_clr) halt_flag <= 1'b0;
  else if (halt_flag_set) halt_flag <= 1'b1;
wire dbg_halt_cmd = (halt_flag | halt_flag_set) & ~inc_step[1];
//============================================================================
// 8) MEMORY CONTROL
//============================================================================
// Control Memory bursts
wire mem_burst_start = (mem_start             &  |mem_cnt);
wire mem_burst_end   = ((dbg_wr | dbg_rd_rdy) & ~|mem_cnt);
// Detect when burst is on going
always @(posedge mclk or posedge por)
  if (por)                  mem_burst <= 1'b0;
  else if (mem_burst_start) mem_burst <= 1'b1;
  else if (mem_burst_end)   mem_burst <= 1'b0;
// Control signals for UART/JTAG interface
assign mem_burst_rd = (mem_burst_start & ~mem_ctl[1]);
assign mem_burst_wr = (mem_burst_start &  mem_ctl[1]);
// Trigger CPU Register or memory access during a burst
reg        mem_startb;
always @(posedge mclk or posedge por)
  if (por) mem_startb <= 1'b0;
  else     mem_startb <= (mem_burst & (dbg_wr | dbg_rd)) | mem_burst_rd;
// Combine single and burst memory start of sequence
wire       mem_seq_start = ((mem_start & ~|mem_cnt) | mem_startb);
// Memory access state machine
reg  [1:0] mem_state;
reg  [1:0] mem_state_nxt;
// State machine definition
parameter  M_IDLE       = 2'h0;
parameter  M_SET_BRK    = 2'h1;
parameter  M_ACCESS_BRK = 2'h2;
parameter  M_ACCESS     = 2'h3;
// State transition
always @(mem_state or mem_seq_start or dbg_halt_st)
  case (mem_state)
    M_IDLE       : mem_state_nxt = ~mem_seq_start ? M_IDLE       :
                                    dbg_halt_st   ? M_ACCESS     : M_SET_BRK;
    M_SET_BRK    : mem_state_nxt =  dbg_halt_st   ? M_ACCESS_BRK : M_SET_BRK;
    M_ACCESS_BRK : mem_state_nxt =  M_IDLE;
    M_ACCESS     : mem_state_nxt =  M_IDLE;
    default      : mem_state_nxt =  M_IDLE;
  endcase
// State machine
always @(posedge mclk or posedge por)
  if (por) mem_state <= M_IDLE;
  else     mem_state <= mem_state_nxt;
// Utility signals
assign mem_halt_cpu = (mem_state==M_IDLE)       & (mem_state_nxt==M_SET_BRK);
assign mem_run_cpu  = (mem_state==M_ACCESS_BRK) & (mem_state_nxt==M_IDLE);
assign mem_access   = (mem_state==M_ACCESS)     | (mem_state==M_ACCESS_BRK);
// Interface to CPU Registers and Memory bacbkone
assign      dbg_mem_addr   =  mem_addr;
assign      dbg_mem_dout   = ~mem_bw      ? mem_data               :
                              mem_addr[0] ? {mem_data[7:0], 8'h00} :
                                            {8'h00, mem_data[7:0]};
assign      dbg_reg_wr     = mem_access &  mem_ctl[1] &  mem_ctl[2];
assign      dbg_reg_rd     = mem_access & ~mem_ctl[1] &  mem_ctl[2];
assign      dbg_mem_en     = mem_access & ~mem_ctl[2];
assign      dbg_mem_rd     = dbg_mem_en & ~mem_ctl[1];
wire  [1:0] dbg_mem_wr_msk = ~mem_bw      ? 2'b11 :
                              mem_addr[0] ? 2'b10 : 2'b01;
assign      dbg_mem_wr     = {2{dbg_mem_en & mem_ctl[1]}} & dbg_mem_wr_msk;
// It takes one additional cycle to read from Memory as from registers
always @(posedge mclk or posedge por)
  if (por) dbg_mem_rd_dly <= 1'b0;
  else     dbg_mem_rd_dly <= dbg_mem_rd;
//=============================================================================
// 9)  UART COMMUNICATION
//=============================================================================
`ifdef DBG_UART
omsp_dbg_uart dbg_uart_0 (
// OUTPUTs
    .dbg_addr     (dbg_addr),      // Debug register address
    .dbg_din      (dbg_din),       // Debug register data input
    .dbg_rd       (dbg_rd),        // Debug register data read
    .dbg_uart_txd (dbg_uart_txd),  // Debug interface: UART TXD
    .dbg_wr       (dbg_wr),        // Debug register data write
// INPUTs
    .dbg_dout     (dbg_dout),      // Debug register data output
    .dbg_rd_rdy   (dbg_rd_rdy),    // Debug register data is ready for read
    .dbg_uart_rxd (dbg_uart_rxd),  // Debug interface: UART RXD
    .mclk         (mclk),          // Main system clock
    .mem_burst    (mem_burst),     // Burst on going
    .mem_burst_end(mem_burst_end), // End TX/RX burst
    .mem_burst_rd (mem_burst_rd),  // Start TX burst
    .mem_burst_wr (mem_burst_wr),  // Start RX burst
    .mem_bw       (mem_bw),        // Burst byte width
    .por          (por)            // Power on reset
);
`else
assign dbg_addr     =  6'h00;
assign dbg_din      = 16'h0000;
assign dbg_rd       =  1'b0;
assign dbg_uart_txd =  1'b0;
assign dbg_wr       =  1'b0;
`endif
//=============================================================================
// 10)  JTAG COMMUNICATION
//=============================================================================
`ifdef DBG_JTAG
JTAG INTERFACE IS NOT SUPPORTED YET
`else
`endif
endmodule