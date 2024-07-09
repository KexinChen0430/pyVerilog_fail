module
// CPU_NR Register
//   | 15  14  13  12  11  10   9   8  |  7   6   5   4   3   2   1   0  |
//   |---------------------------------+---------------------------------|
//   |            CPU_TOTAL_NR         |           CPU_INST_NR           |
wire [15:0] cpu_nr = {cpu_nr_total, cpu_nr_inst};
// CPU_CTL Register
//       7         6          5          4           3        2     1    0
//   Reserved   CPU_RST  RST_BRK_EN  FRZ_BRK_EN  SW_BRK_EN  ISTEP  RUN  HALT
reg   [6:3] cpu_ctl;
wire        cpu_ctl_wr = reg_wr[CPU_CTL];
always @ (posedge dbg_clk or posedge dbg_rst)
`ifdef DBG_RST_BRK_EN
  if (dbg_rst)         cpu_ctl <=  4'h6;
`else
  if (dbg_rst)         cpu_ctl <=  4'h2;
`endif
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
wire  [3:2] cpu_stat_set = {dbg_swbrk, puc_pnd_set};
wire  [3:2] cpu_stat_clr = ~dbg_din[3:2];
always @ (posedge dbg_clk or posedge dbg_rst)
  if (dbg_rst)          cpu_stat <=  2'b00;
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
always @ (posedge dbg_clk or posedge dbg_rst)
  if (dbg_rst)         mem_ctl <=  3'h0;
  else if (mem_ctl_wr) mem_ctl <=  dbg_din[3:1];
wire  [7:0] mem_ctl_full  = {4'b0000, mem_ctl, 1'b0};
reg         mem_start;
always @ (posedge dbg_clk or posedge dbg_rst)
  if (dbg_rst)  mem_start <=  1'b0;
  else          mem_start <=  mem_ctl_wr & dbg_din[0];
wire        mem_bw    = mem_ctl[3];
// MEM_DATA Register
reg  [15:0] mem_data;
reg  [15:0] mem_addr;
wire        mem_access;
wire        mem_data_wr = reg_wr[MEM_DATA];
wire [15:0] dbg_mem_din_bw = ~mem_bw      ? dbg_mem_din                :
	                      mem_addr[0] ? {8'h00, dbg_mem_din[15:8]} :
	                                    {8'h00, dbg_mem_din[7:0]};
always @ (posedge dbg_clk or posedge dbg_rst)
  if (dbg_rst)             mem_data <=  16'h0000;
  else if (mem_data_wr)    mem_data <=  dbg_din;
  else if (dbg_reg_rd)     mem_data <=  dbg_reg_din;
  else if (dbg_mem_rd_dly) mem_data <=  dbg_mem_din_bw;
// MEM_ADDR Register
reg  [15:0] mem_cnt;
wire        mem_addr_wr  = reg_wr[MEM_ADDR];
wire        dbg_mem_acc  = (|dbg_mem_wr | (dbg_rd_rdy & ~mem_ctl[2]));
wire        dbg_reg_acc  = ( dbg_reg_wr | (dbg_rd_rdy &  mem_ctl[2]));
wire [15:0] mem_addr_inc = (mem_cnt==16'h0000)                       ? 16'h0000 :
                           (mem_burst &  dbg_mem_acc & ~mem_bw)      ? 16'h0002 :
                           (mem_burst & (dbg_mem_acc | dbg_reg_acc)) ? 16'h0001 : 16'h0000;
always @ (posedge dbg_clk or posedge dbg_rst)
  if (dbg_rst)          mem_addr <=  16'h0000;
  else if (mem_addr_wr) mem_addr <=  dbg_din;
  else                  mem_addr <=  mem_addr + mem_addr_inc;
// MEM_CNT Register
wire        mem_cnt_wr  = reg_wr[MEM_CNT];
wire [15:0] mem_cnt_dec = (mem_cnt==16'h0000)                       ? 16'h0000 :
                          (mem_burst & (dbg_mem_acc | dbg_reg_acc)) ? 16'hffff : 16'h0000;
always @ (posedge dbg_clk or posedge dbg_rst)
  if (dbg_rst)         mem_cnt <=  16'h0000;
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
    .brk_halt     (brk0_halt),    // Hardware breakpoint command
    .brk_pnd      (brk0_pnd),     // Hardware break/watch-point pending
    .brk_dout     (brk0_dout),    // Hardware break/watch-point register data input
// INPUTs
    .brk_reg_rd   (brk0_reg_rd),  // Hardware break/watch-point register read select
    .brk_reg_wr   (brk0_reg_wr),  // Hardware break/watch-point register write select
    .dbg_clk      (dbg_clk),      // Debug unit clock
    .dbg_din      (dbg_din),      // Debug register data input
    .dbg_rst      (dbg_rst),      // Debug unit reset
    .decode_noirq (decode_noirq), // Frontend decode instruction
    .eu_mab       (eu_mab),       // Execution-Unit Memory address bus
    .eu_mb_en     (eu_mb_en),     // Execution-Unit Memory bus enable
    .eu_mb_wr     (eu_mb_wr),     // Execution-Unit Memory bus write transfer
    .pc           (pc)            // Program counter
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
    .brk_halt     (brk1_halt),    // Hardware breakpoint command
    .brk_pnd      (brk1_pnd),     // Hardware break/watch-point pending
    .brk_dout     (brk1_dout),    // Hardware break/watch-point register data input
// INPUTs
    .brk_reg_rd   (brk1_reg_rd),  // Hardware break/watch-point register read select
    .brk_reg_wr   (brk1_reg_wr),  // Hardware break/watch-point register write select
    .dbg_clk      (dbg_clk),      // Debug unit clock
    .dbg_din      (dbg_din),      // Debug register data input
    .dbg_rst      (dbg_rst),      // Debug unit reset
    .decode_noirq (decode_noirq), // Frontend decode instruction
    .eu_mab       (eu_mab),       // Execution-Unit Memory address bus
    .eu_mb_en     (eu_mb_en),     // Execution-Unit Memory bus enable
    .eu_mb_wr     (eu_mb_wr),     // Execution-Unit Memory bus write transfer
    .pc           (pc)            // Program counter
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
    .brk_halt     (brk2_halt),    // Hardware breakpoint command
    .brk_pnd      (brk2_pnd),     // Hardware break/watch-point pending
    .brk_dout     (brk2_dout),    // Hardware break/watch-point register data input
// INPUTs
    .brk_reg_rd   (brk2_reg_rd),  // Hardware break/watch-point register read select
    .brk_reg_wr   (brk2_reg_wr),  // Hardware break/watch-point register write select
    .dbg_clk      (dbg_clk),      // Debug unit clock
    .dbg_din      (dbg_din),      // Debug register data input
    .dbg_rst      (dbg_rst),      // Debug unit reset
    .decode_noirq (decode_noirq), // Frontend decode instruction
    .eu_mab       (eu_mab),       // Execution-Unit Memory address bus
    .eu_mb_en     (eu_mb_en),     // Execution-Unit Memory bus enable
    .eu_mb_wr     (eu_mb_wr),     // Execution-Unit Memory bus write transfer
    .pc           (pc)            // Program counter
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
    .brk_halt     (brk3_halt),    // Hardware breakpoint command
    .brk_pnd      (brk3_pnd),     // Hardware break/watch-point pending
    .brk_dout     (brk3_dout),    // Hardware break/watch-point register data input
// INPUTs
    .brk_reg_rd   (brk3_reg_rd),  // Hardware break/watch-point register read select
    .brk_reg_wr   (brk3_reg_wr),  // Hardware break/watch-point register write select
    .dbg_clk      (dbg_clk),      // Debug unit clock
    .dbg_din      (dbg_din),      // Debug register data input
    .dbg_rst      (dbg_rst),      // Debug unit reset
    .decode_noirq (decode_noirq), // Frontend decode instruction
    .eu_mab       (eu_mab),       // Execution-Unit Memory address bus
    .eu_mb_en     (eu_mb_en),     // Execution-Unit Memory bus enable
    .eu_mb_wr     (eu_mb_wr),     // Execution-Unit Memory bus write transfer
    .pc           (pc)            // Program counter
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
wire [15:0] cpu_nr_rd    = cpu_nr                 & {16{reg_rd[CPU_NR]}};
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
                       brk3_dout    |
                       cpu_nr_rd;
// Tell UART/I2C interface that the data is ready to be read
always @ (posedge dbg_clk or posedge dbg_rst)
  if (dbg_rst)                       dbg_rd_rdy  <=  1'b0;
  else if (mem_burst | mem_burst_rd) dbg_rd_rdy  <= (dbg_reg_rd | dbg_mem_rd_dly);
  else                               dbg_rd_rdy  <=  dbg_rd;
//============================================================================
// 7) CPU CONTROL
//============================================================================
// Reset CPU
wire dbg_cpu_reset  = cpu_ctl[`CPU_RST];
// Break after reset
wire halt_rst = cpu_ctl[`RST_BRK_EN] & dbg_en_s & puc_pnd_set;
// Freeze peripherals
wire dbg_freeze = dbg_halt_st & (cpu_ctl[`FRZ_BRK_EN] | ~cpu_en_s);
// Software break
assign dbg_swbrk = (fe_mdb_in==`DBG_SWBRK_OP) & decode_noirq & cpu_ctl[`SW_BRK_EN];
// Single step
reg [1:0] inc_step;
always @(posedge dbg_clk or posedge dbg_rst)
  if (dbg_rst)    inc_step <= 2'b00;
  else if (istep) inc_step <= 2'b11;
  else            inc_step <= {inc_step[0], 1'b0};
// Run / Halt
reg   halt_flag;
wire  mem_halt_cpu;
wire  mem_run_cpu;
wire  halt_flag_clr = run_cpu   | mem_run_cpu;
wire  halt_flag_set = halt_cpu  | halt_rst  | dbg_swbrk | mem_halt_cpu |
                      brk0_halt | brk1_halt | brk2_halt | brk3_halt;
always @(posedge dbg_clk or posedge dbg_rst)
  if (dbg_rst)            halt_flag <= 1'b0;
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
always @(posedge dbg_clk or posedge dbg_rst)
  if (dbg_rst)              mem_burst <= 1'b0;
  else if (mem_burst_start) mem_burst <= 1'b1;
  else if (mem_burst_end)   mem_burst <= 1'b0;
// Control signals for UART/I2C interface
assign mem_burst_rd = (mem_burst_start & ~mem_ctl[1]);
assign mem_burst_wr = (mem_burst_start &  mem_ctl[1]);
// Trigger CPU Register or memory access during a burst
reg        mem_startb;
always @(posedge dbg_clk or posedge dbg_rst)
  if (dbg_rst) mem_startb <= 1'b0;
  else         mem_startb <= (mem_burst & (dbg_wr | dbg_rd)) | mem_burst_rd;
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
  // pragma coverage off
    default      : mem_state_nxt =  M_IDLE;
  // pragma coverage on
  endcase
// State machine
always @(posedge dbg_clk or posedge dbg_rst)
  if (dbg_rst) mem_state <= M_IDLE;
  else         mem_state <= mem_state_nxt;
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
always @(posedge dbg_clk or posedge dbg_rst)
  if (dbg_rst) dbg_mem_rd_dly <= 1'b0;
  else         dbg_mem_rd_dly <= dbg_mem_rd;
//=============================================================================
// 9)  UART COMMUNICATION
//=============================================================================
`ifdef DBG_UART
omsp_dbg_uart dbg_uart_0 (
// OUTPUTs
    .dbg_addr         (dbg_addr),         // Debug register address
    .dbg_din          (dbg_din),          // Debug register data input
    .dbg_rd           (dbg_rd),           // Debug register data read
    .dbg_uart_txd     (dbg_uart_txd),     // Debug interface: UART TXD
    .dbg_wr           (dbg_wr),           // Debug register data write
// INPUTs
    .dbg_clk          (dbg_clk),          // Debug unit clock
    .dbg_dout         (dbg_dout),         // Debug register data output
    .dbg_rd_rdy       (dbg_rd_rdy),       // Debug register data is ready for read
    .dbg_rst          (dbg_rst),          // Debug unit reset
    .dbg_uart_rxd     (dbg_uart_rxd),     // Debug interface: UART RXD
    .mem_burst        (mem_burst),        // Burst on going
    .mem_burst_end    (mem_burst_end),    // End TX/RX burst
    .mem_burst_rd     (mem_burst_rd),     // Start TX burst
    .mem_burst_wr     (mem_burst_wr),     // Start RX burst
    .mem_bw           (mem_bw)            // Burst byte width
);
`else
    assign dbg_uart_txd    =  1'b1;
  `ifdef DBG_I2C
  `else
    assign dbg_addr        =  6'h00;
    assign dbg_din         = 16'h0000;
    assign dbg_rd          =  1'b0;
    assign dbg_wr          =  1'b0;
  `endif
`endif
//=============================================================================
// 10)  I2C COMMUNICATION
//=============================================================================
`ifdef DBG_I2C
omsp_dbg_i2c dbg_i2c_0 (
// OUTPUTs
    .dbg_addr          (dbg_addr),          // Debug register address
    .dbg_din           (dbg_din),           // Debug register data input
    .dbg_i2c_sda_out   (dbg_i2c_sda_out),   // Debug interface: I2C SDA OUT
    .dbg_rd            (dbg_rd),            // Debug register data read
    .dbg_wr            (dbg_wr),            // Debug register data write
// INPUTs
    .dbg_clk           (dbg_clk),           // Debug unit clock
    .dbg_dout          (dbg_dout),          // Debug register data output
    .dbg_i2c_addr      (dbg_i2c_addr),      // Debug interface: I2C Address
    .dbg_i2c_broadcast (dbg_i2c_broadcast), // Debug interface: I2C Broadcast Address (for multicore systems)
    .dbg_i2c_scl       (dbg_i2c_scl),       // Debug interface: I2C SCL
    .dbg_i2c_sda_in    (dbg_i2c_sda_in),    // Debug interface: I2C SDA IN
    .dbg_rd_rdy        (dbg_rd_rdy),        // Debug register data is ready for read
    .dbg_rst           (dbg_rst),           // Debug unit reset
    .mem_burst         (mem_burst),         // Burst on going
    .mem_burst_end     (mem_burst_end),     // End TX/RX burst
    .mem_burst_rd      (mem_burst_rd),      // Start TX burst
    .mem_burst_wr      (mem_burst_wr),      // Start RX burst
    .mem_bw            (mem_bw)             // Burst byte width
);
`else
    assign dbg_i2c_sda_out =  1'b1;
`endif
endmodule