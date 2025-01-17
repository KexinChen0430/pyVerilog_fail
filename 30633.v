module or a submodule
  output  reg         o_wbs_int,
  //PCIE Physical Signals
  input               i_clk_100mhz_gtp_p,
  input               i_clk_100mhz_gtp_n,
  output              o_pcie_phy_tx_p,
  output              o_pcie_phy_tx_n,
  input               i_pcie_phy_rx_p,
  input               i_pcie_phy_rx_n,
  input               i_pcie_reset_n,
  output              o_pcie_wake_n,
  output              o_62p5_clk,
  output      [31:0]  o_debug_data
);
//Local Parameters
localparam    CONTROL_BUFFER_SIZE = 2 ** CONTROL_FIFO_DEPTH;
localparam    CONTROL             = 0;
localparam    STATUS              = 1;
localparam    NUM_BLOCK_READ      = 2;
localparam    LOCAL_BUFFER_SIZE   = 3;
localparam    PCIE_CLOCK_CNT      = 4;
localparam    TEST_CLOCK          = 5;
localparam    TX_DIFF_CTRL        = 6;
localparam    RX_EQUALIZER_CTRL   = 7;
localparam    LTSSM_STATE         = 8;
localparam    TX_PRE_EMPH         = 9;
localparam    DBG_DATA            = 9;
localparam    CONFIG_COMMAND      = 10;
localparam    CONFIG_STATUS       = 11;
localparam    CONFIG_DCOMMAND     = 12;
localparam    CONFIG_DSTATUS      = 13;
localparam    CONFIG_LCOMMAND     = 14;
localparam    CONFIG_LSTATUS      = 15;
localparam    DBG_FLAGS           = 16;
//Local Registers/Wires
wire      [31:0]        status;
reg                     r_enable_pcie;
//reg                     r_enable_ext_reset;
//reg                     r_manual_pcie_reset;
reg       [31:0]        r_clock_1_sec;
reg       [31:0]        r_clock_count;
reg       [31:0]        r_host_clock_count;
reg                     r_1sec_stb_100mhz;
wire                    w_1sec_stb_65mhz;
// Transaction (TRN) Interface
wire                    user_lnk_up;
  // Flow Control
wire      [2:0]         fc_sel;
wire      [7:0]         fc_nph;
wire      [11:0]        fc_npd;
wire      [7:0]         fc_ph;
wire      [11:0]        fc_pd;
wire      [7:0]         fc_cplh;
wire      [11:0]        fc_cpld;
// Host (CFG) Interface
wire      [31:0]        cfg_do;
wire                    cfg_rd_wr_done;
wire      [9:0]         cfg_dwaddr;
wire                    cfg_rd_en;
// Configuration: Error
wire                    cfg_err_ur;
wire                    cfg_err_cor;
wire                    cfg_err_ecrc;
wire                    cfg_err_cpl_timeout;
wire                    cfg_err_cpl_abort;
wire                    cfg_err_posted;
wire                    cfg_err_locked;
wire      [47:0]        cfg_err_tlp_cpl_header;
wire                    cfg_err_cpl_rdy;
// Conifguration: Interrupt
wire                    cfg_interrupt;
wire                    cfg_interrupt_rdy;
wire                    cfg_interrupt_assert;
wire      [7:0]         cfg_interrupt_do;
wire      [7:0]         cfg_interrupt_di;
wire      [2:0]         cfg_interrupt_mmenable;
wire                    cfg_interrupt_msienable;
// Configuration: Power Management
reg                     cfg_turnoff_ok;
reg                     trn_pending;
wire                    cfg_to_turnoff;
wire                    cfg_pm_wake;
// Configuration: System/Status
wire      [2:0]         cfg_pcie_link_state;
reg                     r_cfg_trn_pending;
wire      [7:0]         cfg_bus_number;
wire      [4:0]         cfg_device_number;
wire      [2:0]         cfg_function_number;
wire      [15:0]        cfg_status;
wire      [15:0]        cfg_command;
wire      [15:0]        cfg_dstatus;
wire      [15:0]        cfg_dcommand;
wire      [15:0]        cfg_lstatus;
wire      [15:0]        cfg_lcommand;
// System Interface
wire                              pcie_reset;
wire                              pcie_clk;
wire                              received_hot_reset;
reg                               r_ppfifo_2_mem_en;
reg                               r_mem_2_ppfifo_stb;
reg                               r_cancel_write_stb;
wire  [31:0]                      w_num_reads;
wire                              w_idle;
wire                              pll_lock_detect;
wire                              rx_elec_idle;
wire                              gtp_pll_lock_detect;
wire                              gtp_reset_done;
//User Memory Interface
reg                               r_lcl_mem_we;
wire  [CONTROL_FIFO_DEPTH -1: 0]  w_lcl_mem_addr;
reg   [31:0]                      r_lcl_mem_din;
wire  [31:0]                      w_lcl_mem_dout;
wire                              w_lcl_mem_valid;
wire                              w_lcl_mem_en;
wire                              w_cmd_in_rd_stb;
wire                              w_cmd_in_rd_ready;
wire                              w_cmd_in_rd_activate;
wire  [23:0]                      w_cmd_in_rd_size;
wire  [31:0]                      w_cmd_in_rd_data;
wire  [1:0]                       w_cmd_out_wr_ready;
wire  [1:0]                       w_cmd_out_wr_activate;
wire  [23:0]                      w_cmd_out_wr_size;
wire                              w_cmd_out_wr_stb;
wire  [31:0]                      w_cmd_out_wr_data;
wire                              w_data_in_rd_stb;
wire                              w_data_in_rd_ready;
wire                              w_data_in_rd_activate;
wire  [23:0]                      w_data_in_rd_size;
wire  [31:0]                      w_data_in_rd_data;
wire  [1:0]                       w_data_out_wr_ready;
wire  [1:0]                       w_data_out_wr_activate;
wire  [23:0]                      w_data_out_wr_size;
wire                              w_data_out_wr_stb;
wire  [31:0]                      w_data_out_wr_data;
reg   [1:0]                       r_rx_equalizer_ctrl;
reg   [3:0]                       r_tx_diff_ctrl;
reg   [2:0]                       r_tx_pre_emphasis;
wire  [4:0]                       cfg_ltssm_state;
wire                              dbg_reg_detected_correctable;
wire                              dbg_reg_detected_fatal;
wire                              dbg_reg_detected_non_fatal;
wire                              dbg_reg_detected_unsupported;
reg                               dbg_correctable;
reg                               dbg_fatal;
reg                               dbg_non_fatal;
reg                               dbg_unsupported;
wire                              dbg_bad_dllp_status;
wire                              dbg_bad_tlp_lcrc;
wire                              dbg_bad_tlp_seq_num;
wire                              dbg_bad_tlp_status;
wire                              dbg_dl_protocol_status;
wire                              dbg_fc_protocol_err_status;
wire                              dbg_mlfrmd_length;
wire                              dbg_mlfrmd_mps;
wire                              dbg_mlfrmd_tcvc;
wire                              dbg_mlfrmd_tlp_status;
wire                              dbg_mlfrmd_unrec_type;
wire                              dbg_poistlpstatus;
wire                              dbg_rcvr_overflow_status;
wire                              dbg_rply_rollover_status;
wire                              dbg_rply_timeout_status;
wire                              dbg_ur_no_bar_hit;
wire                              dbg_ur_pois_cfg_wr;
wire                              dbg_ur_status;
wire                              dbg_ur_unsup_msg;
reg                               r_dbg_bad_dllp_status;
reg                               r_dbg_bad_tlp_lcrc;
reg                               r_dbg_bad_tlp_seq_num;
reg                               r_dbg_bad_tlp_status;
reg                               r_dbg_dl_protocol_status;
reg                               r_dbg_fc_protocol_err_status;
reg                               r_dbg_mlfrmd_length;
reg                               r_dbg_mlfrmd_mps;
reg                               r_dbg_mlfrmd_tcvc;
reg                               r_dbg_mlfrmd_tlp_status;
reg                               r_dbg_mlfrmd_unrec_type;
reg                               r_dbg_poistlpstatus;
reg                               r_dbg_rcvr_overflow_status;
reg                               r_dbg_rply_rollover_status;
reg                               r_dbg_rply_timeout_status;
reg                               r_dbg_ur_no_bar_hit;
reg                               r_dbg_ur_pois_cfg_wr;
reg                               r_dbg_ur_status;
reg                               r_dbg_ur_unsup_msg;
//Submodules
artemis_pcie_interface #(
  .CONTROL_FIFO_DEPTH             (CONTROL_FIFO_DEPTH     ),
  .DATA_FIFO_DEPTH                (DATA_FIFO_DEPTH        ),
  .SERIAL_NUMBER                  (64'h000000000000C594   )
)api (
  .clk                            (clk                    ),
  .rst                            (rst || !r_enable_pcie  || !i_pcie_reset_n ),
  .gtp_clk_p                      (i_clk_100mhz_gtp_p     ),
  .gtp_clk_n                      (i_clk_100mhz_gtp_n     ),
  .pci_exp_txp                    (o_pcie_phy_tx_p        ),
  .pci_exp_txn                    (o_pcie_phy_tx_n        ),
  .pci_exp_rxp                    (i_pcie_phy_rx_p        ),
  .pci_exp_rxn                    (i_pcie_phy_rx_n        ),
  // Transaction (TRN) Interface
  .user_lnk_up                    (user_lnk_up            ),
  .pcie_clk                       (pcie_clk               ),
  // Flow Control
  .fc_sel                         (fc_sel                 ),
  .fc_nph                         (fc_nph                 ),
  .fc_npd                         (fc_npd                 ),
  .fc_ph                          (fc_ph                  ),
  .fc_pd                          (fc_pd                  ),
  .fc_cplh                        (fc_cplh                ),
  .fc_cpld                        (fc_cpld                ),
  // Host (CFG) Interface
  .cfg_do                         (cfg_do                 ),
  .cfg_rd_wr_done                 (cfg_rd_wr_done         ),
  .cfg_dwaddr                     (cfg_dwaddr             ),
  .cfg_rd_en                      (cfg_rd_en              ),
  // Configuration: Error
  .cfg_err_ur                     (cfg_err_ur             ),
  .cfg_err_cor                    (cfg_err_cor            ),
  .cfg_err_ecrc                   (cfg_err_ecrc           ),
  .cfg_err_cpl_timeout            (cfg_err_cpl_timeout    ),
  .cfg_err_cpl_abort              (cfg_err_cpl_abort      ),
  .cfg_err_posted                 (cfg_err_posted         ),
  .cfg_err_locked                 (cfg_err_locked         ),
  .cfg_err_tlp_cpl_header         (cfg_err_tlp_cpl_header ),
  .cfg_err_cpl_rdy                (cfg_err_cpl_rdy        ),
  // Conifguration: Interrupt
  .cfg_interrupt                  (cfg_interrupt          ),
  .cfg_interrupt_rdy              (cfg_interrupt_rdy      ),
  .cfg_interrupt_assert           (cfg_interrupt_assert   ),
  .cfg_interrupt_do               (cfg_interrupt_do       ),
  .cfg_interrupt_di               (cfg_interrupt_di       ),
  .cfg_interrupt_mmenable         (cfg_interrupt_mmenable ),
  .cfg_interrupt_msienable        (cfg_interrupt_msienable),
  // Configuration: Power Management
  .cfg_turnoff_ok                 (cfg_turnoff_ok         ),
  .cfg_to_turnoff                 (cfg_to_turnoff         ),
  .cfg_pm_wake                    (cfg_pm_wake            ),
  // Configuration: System/Status
  .cfg_pcie_link_state            (cfg_pcie_link_state    ),
  .cfg_trn_pending_stb            (r_cfg_trn_pending      ),
  .cfg_bus_number                 (cfg_bus_number         ),
  .cfg_device_number              (cfg_device_number      ),
  .cfg_function_number            (cfg_function_number    ),
  .cfg_status                     (cfg_status             ),
  .cfg_command                    (cfg_command            ),
  .cfg_dstatus                    (cfg_dstatus            ),
  .cfg_dcommand                   (cfg_dcommand           ),
  .cfg_lstatus                    (cfg_lstatus            ),
  .cfg_lcommand                   (cfg_lcommand           ),
  // System Interface
  .pcie_reset                     (pcie_reset             ),
  .received_hot_reset             (received_hot_reset     ),
  .gtp_pll_lock_detect            (gtp_pll_lock_detect    ),
  .gtp_reset_done                 (gtp_reset_done         ),
  .pll_lock_detect                (pll_lock_detect        ),
  .rx_elec_idle                   (rx_elec_idle           ),
  .i_cmd_in_rd_stb                (w_cmd_in_rd_stb        ),
  .o_cmd_in_rd_ready              (w_cmd_in_rd_ready      ),
  .i_cmd_in_rd_activate           (w_cmd_in_rd_activate   ),
  .o_cmd_in_rd_count              (w_cmd_in_rd_size       ),
  .o_cmd_in_rd_data               (w_cmd_in_rd_data       ),
  .o_cmd_out_wr_ready             (w_cmd_out_wr_ready     ),
  .i_cmd_out_wr_activate          (w_cmd_out_wr_activate  ),
  .o_cmd_out_wr_size              (w_cmd_out_wr_size      ),
  .i_cmd_out_wr_stb               (w_cmd_out_wr_stb       ),
  .i_cmd_out_wr_data              (w_cmd_out_wr_data      ),
  .i_data_in_rd_stb               (w_data_in_rd_stb       ),
  .o_data_in_rd_ready             (w_data_in_rd_ready     ),
  .i_data_in_rd_activate          (w_data_in_rd_activate  ),
  .o_data_in_rd_count             (w_data_in_rd_size     ),
  .o_data_in_rd_data              (w_data_in_rd_data      ),
  .o_data_out_wr_ready            (w_data_out_wr_ready    ),
  .i_data_out_wr_activate         (w_data_out_wr_activate ),
  .o_data_out_wr_size             (w_data_out_wr_size     ),
  .i_data_out_wr_stb              (w_data_out_wr_stb      ),
  .i_data_out_wr_data             (w_data_out_wr_data     ),
  .rx_equalizer_ctrl              (r_rx_equalizer_ctrl    ),
  .tx_diff_ctrl                   (r_tx_diff_ctrl         ),
  .tx_pre_emphasis                (r_tx_pre_emphasis      ),
  .cfg_ltssm_state                (cfg_ltssm_state        ),
  .dbg_reg_detected_correctable      (dbg_reg_detected_correctable ),
  .dbg_reg_detected_fatal            (dbg_reg_detected_fatal       ),
  .dbg_reg_detected_non_fatal        (dbg_reg_detected_non_fatal   ),
  .dbg_reg_detected_unsupported      (dbg_reg_detected_unsupported ),
  .dbg_bad_dllp_status               (dbg_bad_dllp_status          ),
  .dbg_bad_tlp_lcrc                  (dbg_bad_tlp_lcrc             ),
  .dbg_bad_tlp_seq_num               (dbg_bad_tlp_seq_num          ),
  .dbg_bad_tlp_status                (dbg_bad_tlp_status           ),
  .dbg_dl_protocol_status            (dbg_dl_protocol_status       ),
  .dbg_fc_protocol_err_status        (dbg_fc_protocol_err_status   ),
  .dbg_mlfrmd_length                 (dbg_mlfrmd_length            ),
  .dbg_mlfrmd_mps                    (dbg_mlfrmd_mps               ),
  .dbg_mlfrmd_tcvc                   (dbg_mlfrmd_tcvc              ),
  .dbg_mlfrmd_tlp_status             (dbg_mlfrmd_tlp_status        ),
  .dbg_mlfrmd_unrec_type             (dbg_mlfrmd_unrec_type        ),
  .dbg_poistlpstatus                 (dbg_poistlpstatus            ),
  .dbg_rcvr_overflow_status          (dbg_rcvr_overflow_status     ),
  .dbg_rply_rollover_status          (dbg_rply_rollover_status     ),
  .dbg_rply_timeout_status           (dbg_rply_timeout_status      ),
  .dbg_ur_no_bar_hit                 (dbg_ur_no_bar_hit            ),
  .dbg_ur_pois_cfg_wr                (dbg_ur_pois_cfg_wr           ),
  .dbg_ur_status                     (dbg_ur_status                ),
  .dbg_ur_unsup_msg                  (dbg_ur_unsup_msg             )
);
adapter_dpb_ppfifo #(
  .MEM_DEPTH                          (CONTROL_FIFO_DEPTH     ),
  .DATA_WIDTH                         (32                     )
)dpb_bridge (
  .clk                                (clk                    ),
  .rst                                (rst                    ),
  .i_ppfifo_2_mem_en                  (r_ppfifo_2_mem_en      ),
  .i_mem_2_ppfifo_stb                 (r_mem_2_ppfifo_stb     ),
  .i_cancel_write_stb                 (r_cancel_write_stb     ),
  .o_num_reads                        (w_num_reads            ),
  .o_idle                             (w_idle                 ),
  .i_bram_we                          (r_lcl_mem_we           ),
  .i_bram_addr                        (w_lcl_mem_addr         ),
  .i_bram_din                         (r_lcl_mem_din          ),
  .o_bram_dout                        (w_lcl_mem_dout         ),
  .o_bram_valid                       (w_lcl_mem_valid        ),
  .ppfifo_clk                         (clk                    ),
  .i_write_ready                      (w_cmd_out_wr_ready     ),
  .o_write_activate                   (w_cmd_out_wr_activate  ),
  .i_write_size                       (w_cmd_out_wr_size      ),
  .o_write_stb                        (w_cmd_out_wr_stb       ),
  .o_write_data                       (w_cmd_out_wr_data      ),
  .i_read_ready                       (w_cmd_in_rd_ready      ),
  .o_read_activate                    (w_cmd_in_rd_activate   ),
  .i_read_size                        (w_cmd_in_rd_size       ),
  .i_read_data                        (w_cmd_in_rd_data       ),
  .o_read_stb                         (w_cmd_in_rd_stb        )
);
cross_clock_strobe clk_stb(
  .rst                                (rst                    ),
  .in_clk                             (clk                    ),
  .in_stb                             (r_1sec_stb_100mhz      ),
  .out_clk                            (pcie_clk               ),
  .out_stb                            (w_1sec_stb_65mhz       )
);
//Asynchronous Logic
assign  fc_sel                 = 3'h0;
assign  cfg_dwaddr             = 10'h0;
assign  cfg_rd_en              = 1'b0;
assign  cfg_err_ur             = 0;
assign  cfg_err_cor            = 0;
assign  cfg_err_ecrc           = 0;
assign  cfg_err_cpl_timeout    = 0;
assign  cfg_err_cpl_abort      = 0;
assign  cfg_err_posted         = 0;
assign  cfg_err_locked         = 0;
assign  cfg_err_tlp_cpl_header = 0;
assign  cfg_interrupt          = 0;
assign  cfg_interrupt_assert   = 0;
assign  cfg_interrupt_di       = 0;
//assign  cfg_turnoff_ok         = 0;
assign  cfg_pm_wake            = 0;
assign  w_data_in_rd_activate   = 0;
assign  w_data_in_rd_stb        = 0;
assign  w_data_out_wr_activate  = 0;
assign  w_data_out_wr_stb       = 0;
assign  w_data_out_wr_data      = 0;
assign  o_pcie_wake_n           = 1;
assign  w_lcl_mem_en            = ((i_wbs_adr >= `LOCAL_BUFFER_OFFSET) &&
                                   (i_wbs_adr < (`LOCAL_BUFFER_OFFSET + CONTROL_BUFFER_SIZE)));
assign  w_lcl_mem_addr          = w_lcl_mem_en ? (i_wbs_adr - `LOCAL_BUFFER_OFFSET) : 0;
//assign  !i_pcie_reset_n          = r_enable_ext_reset ? !i_pcie_reset_n : r_manual_pcie_reset;
//assign  !i_pcie_reset_n          = i_pcie_reset_n;
assign  o_62p5_clk              = pcie_clk;
assign  o_debug_data            = { dbg_reg_detected_correctable,
                                    dbg_reg_detected_fatal,
                                    dbg_reg_detected_non_fatal,
                                    dbg_reg_detected_unsupported,
                                    dbg_bad_dllp_status,
                                    dbg_bad_tlp_lcrc,
                                    dbg_bad_tlp_seq_num,
                                    dbg_bad_tlp_status,
                                    dbg_dl_protocol_status,
                                    dbg_fc_protocol_err_status,
                                    dbg_mlfrmd_length,
                                    dbg_mlfrmd_mps,
                                    dbg_mlfrmd_tcvc,
                                    dbg_mlfrmd_tlp_status,
                                    dbg_mlfrmd_unrec_type,
                                    dbg_poistlpstatus,
                                    dbg_rcvr_overflow_status,
                                    dbg_rply_rollover_status,
                                    dbg_rply_timeout_status,
                                    dbg_ur_no_bar_hit,
                                    dbg_ur_pois_cfg_wr,
                                    dbg_ur_status,
                                    dbg_ur_unsup_msg,
                                    pll_lock_detect,
                                    pcie_reset,
                                    user_lnk_up,
                                    cfg_ltssm_state};
//Synchronous Logic
always @ (posedge pcie_clk) begin
  if (!i_pcie_reset_n) begin
    r_clock_1_sec   <=  0;
    r_clock_count   <=  0;
    dbg_correctable <= 0;
    dbg_fatal       <= 0;
    dbg_non_fatal   <= 0;
    dbg_unsupported <= 0;
    cfg_turnoff_ok  <= 0;
    trn_pending     <= 0;
    r_dbg_bad_dllp_status        <= 0;
    r_dbg_bad_tlp_lcrc           <= 0;
    r_dbg_bad_tlp_seq_num        <= 0;
    r_dbg_bad_tlp_status         <= 0;
    r_dbg_dl_protocol_status     <= 0;
    r_dbg_fc_protocol_err_status <= 0;
    r_dbg_mlfrmd_length          <= 0;
    r_dbg_mlfrmd_mps             <= 0;
    r_dbg_mlfrmd_tcvc            <= 0;
    r_dbg_mlfrmd_tlp_status      <= 0;
    r_dbg_mlfrmd_unrec_type      <= 0;
    r_dbg_poistlpstatus          <= 0;
    r_dbg_rcvr_overflow_status   <= 0;
    r_dbg_rply_rollover_status   <= 0;
    r_dbg_rply_timeout_status    <= 0;
    r_dbg_ur_no_bar_hit          <= 0;
    r_dbg_ur_pois_cfg_wr         <= 0;
    r_dbg_ur_status              <= 0;
    r_dbg_ur_unsup_msg           <= 0;
  end
  else begin
    r_clock_count   <=  r_clock_count + 1;
    if (w_1sec_stb_65mhz) begin
      r_clock_1_sec   <=  r_clock_count;
      r_clock_count   <=  0;
    end
    if (dbg_reg_detected_correctable) begin
      dbg_correctable <= 1;
    end
    if (dbg_reg_detected_fatal) begin
      dbg_fatal       <= 1;
    end
    if (dbg_reg_detected_non_fatal) begin
      dbg_non_fatal   <= 1;
    end
    if (dbg_reg_detected_unsupported) begin
      dbg_unsupported <= 1;
    end
    //Power Controller
    if (cfg_to_turnoff && !trn_pending) begin
      cfg_turnoff_ok    <=  1;
    end
    else begin
      cfg_turnoff_ok    <=  0;
    end
    if (dbg_bad_dllp_status) begin
      r_dbg_bad_dllp_status        <= 1;
    end
    if (dbg_bad_tlp_lcrc) begin
      r_dbg_bad_tlp_lcrc           <= 1;
    end
    if (dbg_bad_tlp_seq_num) begin
      r_dbg_bad_tlp_seq_num        <= 1;
    end
    if (dbg_bad_tlp_status) begin
      r_dbg_bad_tlp_status         <= 1;
    end
    if (dbg_dl_protocol_status) begin
      r_dbg_dl_protocol_status     <= 1;
    end
    if (dbg_fc_protocol_err_status) begin
      r_dbg_fc_protocol_err_status <= 1;
    end
    if (dbg_mlfrmd_length) begin
      r_dbg_mlfrmd_length          <= 1;
    end
    if (dbg_mlfrmd_mps) begin
      r_dbg_mlfrmd_mps             <= 1;
    end
    if (dbg_mlfrmd_tcvc) begin
      r_dbg_mlfrmd_tcvc            <= 1;
    end
    if (dbg_mlfrmd_tlp_status) begin
      r_dbg_mlfrmd_tlp_status      <= 1;
    end
    if (dbg_mlfrmd_unrec_type) begin
      r_dbg_mlfrmd_unrec_type      <= 1;
    end
    if (dbg_poistlpstatus) begin
      r_dbg_poistlpstatus          <= 1;
    end
    if (dbg_rcvr_overflow_status) begin
      r_dbg_rcvr_overflow_status   <= 1;
    end
    if (dbg_rply_rollover_status) begin
      r_dbg_rply_rollover_status   <= 1;
    end
    if (dbg_rply_timeout_status) begin
      r_dbg_rply_timeout_status    <= 1;
    end
    if (dbg_ur_no_bar_hit) begin
      r_dbg_ur_no_bar_hit          <= 1;
    end
    if (dbg_ur_pois_cfg_wr) begin
      r_dbg_ur_pois_cfg_wr         <= 1;
    end
    if (dbg_ur_status) begin
      r_dbg_ur_status              <= 1;
    end
    if (dbg_ur_unsup_msg) begin
      r_dbg_ur_unsup_msg           <= 1;
    end
  end
end
always @ (posedge clk) begin
  //Deassert Strobes
  r_mem_2_ppfifo_stb            <=  0;
  r_cancel_write_stb            <=  0;
  r_lcl_mem_we                  <=  0;
  r_1sec_stb_100mhz             <=  0;
  r_cfg_trn_pending             <=  0;
  if (rst) begin
    o_wbs_dat                   <=  32'h0;
    o_wbs_ack                   <=  0;
    o_wbs_int                   <=  0;
    r_ppfifo_2_mem_en           <=  1;
    r_enable_pcie               <=  1;
    //r_enable_ext_reset          <=  1;
    //r_manual_pcie_reset         <=  0;
    r_lcl_mem_din               <=  0;
    r_host_clock_count          <=  0;
    r_rx_equalizer_ctrl         <=  2'b11;
    r_tx_diff_ctrl              <=  4'b1001;
    r_tx_pre_emphasis           <=  3'b00;
  end
  else begin
    //when the master acks our ack, then put our ack down
    if (o_wbs_ack && ~i_wbs_stb)begin
      o_wbs_ack <= 0;
    end
    if (i_wbs_stb && i_wbs_cyc) begin
      //master is requesting somethign
      if (!o_wbs_ack) begin
        if (i_wbs_we) begin
          //write request
          case (i_wbs_adr)
            CONTROL: begin
              $display("ADDR: %h user wrote %h", i_wbs_adr, i_wbs_dat);
              r_enable_pcie       <=  i_wbs_dat[`CTRL_BIT_ENABLE];
              r_mem_2_ppfifo_stb  <=  i_wbs_dat[`CTRL_BIT_SEND_CONTROL_BLOCK];
              r_cancel_write_stb  <=  i_wbs_dat[`CTRL_BIT_CANCEL_SEND_BLOCK];
              r_ppfifo_2_mem_en   <=  i_wbs_dat[`CTRL_BIT_ENABLE_LOCAL_READ];
              //r_enable_ext_reset  <=  i_wbs_dat[`CTRL_BIT_ENABLE_EXT_RESET];
              //r_manual_pcie_reset <=  i_wbs_dat[`CTRL_BIT_MANUAL_USER_RESET];
            end
            TX_DIFF_CTRL: begin
              r_tx_diff_ctrl      <=  i_wbs_dat[3:0];
            end
            TX_DIFF_CTRL: begin
              r_tx_pre_emphasis   <=  i_wbs_dat[2:0];
            end
            RX_EQUALIZER_CTRL: begin
              r_rx_equalizer_ctrl <=  i_wbs_dat[1:0];
            end
            default: begin
              if (w_lcl_mem_en) begin
                r_lcl_mem_we                          <=  1;
                r_lcl_mem_din                         <=  i_wbs_dat;
              end
            end
          endcase
          o_wbs_ack <= 1;
        end
        else begin
          //read request
          case (i_wbs_adr)
            CONTROL: begin
              o_wbs_dat                               <=  0;
              o_wbs_dat[`CTRL_BIT_ENABLE_LOCAL_READ]  <=  r_ppfifo_2_mem_en;
              o_wbs_dat[`CTRL_BIT_ENABLE]             <=  r_enable_pcie;
              //o_wbs_dat[`CTRL_BIT_ENABLE_EXT_RESET]   <=  r_enable_ext_reset;
              //o_wbs_dat[`CTRL_BIT_MANUAL_USER_RESET]  <=  r_manual_pcie_reset;
            end
            STATUS: begin
              o_wbs_dat                               <=  0;
              o_wbs_dat[`STS_BIT_PCIE_RESET]          <=  pcie_reset;
              o_wbs_dat[`STS_BIT_LINKUP]              <=  user_lnk_up;
              o_wbs_dat[`STS_BIT_RECEIVED_HOT_RESET]  <=  received_hot_reset;
              o_wbs_dat[`STS_BITS_PCIE_LINK_STATE]    <=  cfg_pcie_link_state;
              o_wbs_dat[`STS_BITS_PCIE_BUS_NUM]       <=  cfg_bus_number;
              o_wbs_dat[`STS_BITS_PCIE_DEV_NUM]       <=  cfg_device_number;
              o_wbs_dat[`STS_BITS_PCIE_FUNC_NUM]      <=  cfg_function_number;
              o_wbs_dat[`STS_BIT_GTP_PLL_LOCK_DETECT] <=  gtp_pll_lock_detect;
              o_wbs_dat[`STS_BIT_PLL_LOCK_DETECT]     <=  pll_lock_detect;
              o_wbs_dat[`STS_BIT_GTP_RESET_DONE]      <=  gtp_reset_done;
              o_wbs_dat[`STS_BIT_RX_ELEC_IDLE]        <=  rx_elec_idle;
              o_wbs_dat[`STS_BIT_CFG_TO_TURNOFF]      <=  cfg_to_turnoff;
              o_wbs_dat[`STS_BIT_PCIE_EXT_RESET]      <=  !i_pcie_reset_n;
            end
            NUM_BLOCK_READ: begin
              o_wbs_dat <= w_num_reads;
            end
            LOCAL_BUFFER_SIZE: begin
              o_wbs_dat <= CONTROL_BUFFER_SIZE;
            end
            PCIE_CLOCK_CNT: begin
              o_wbs_dat <=  r_clock_1_sec;
            end
            TEST_CLOCK: begin
              o_wbs_dat       <=  r_clock_count;
            end
            TX_DIFF_CTRL: begin
              o_wbs_dat       <=  0;
              o_wbs_dat[3:0]  <=  r_tx_diff_ctrl;
            end
            TX_PRE_EMPH: begin
              o_wbs_dat       <=  0;
              o_wbs_dat[3:0]  <=  r_tx_pre_emphasis;
            end
            RX_EQUALIZER_CTRL: begin
              o_wbs_dat       <=  0;
              o_wbs_dat[1:0]  <=  r_rx_equalizer_ctrl;
            end
            LTSSM_STATE: begin
              o_wbs_dat       <=  0;
              o_wbs_dat[4:0]  <=  cfg_ltssm_state;
            end
            DBG_DATA: begin
              o_wbs_dat       <=  0;
              o_wbs_dat[`DBG_CORRECTABLE ] <=  dbg_correctable;
              o_wbs_dat[`DBG_FATAL       ] <=  dbg_fatal;
              o_wbs_dat[`DBG_NON_FATAL   ] <=  dbg_non_fatal;
              o_wbs_dat[`DBG_UNSUPPORTED ] <=  dbg_unsupported;
            end
            CONFIG_COMMAND: begin
              o_wbs_dat       <=  0;
              o_wbs_dat                       <=  {16'h0000, cfg_command};
            end
            CONFIG_STATUS: begin
              o_wbs_dat       <=  0;
              o_wbs_dat                       <=  {16'h0000, cfg_status};
            end
            CONFIG_DSTATUS: begin
              o_wbs_dat       <=  0;
              o_wbs_dat                       <=  {16'h0000, cfg_dstatus};
            end
            CONFIG_DCOMMAND: begin
              o_wbs_dat       <=  0;
              o_wbs_dat                       <=  {16'h0000, cfg_dcommand};
            end
            CONFIG_LSTATUS: begin
              o_wbs_dat       <=  0;
              o_wbs_dat                       <=  {16'h0000, cfg_lstatus};
            end
            CONFIG_LCOMMAND: begin
              o_wbs_dat       <=  0;
              o_wbs_dat                       <=  {16'h0000, cfg_lcommand};
            end
            DBG_FLAGS: begin
              o_wbs_dat       <=  0;
              o_wbs_dat[`DBG_BAD_DLLP_STATUS          ] <=  r_dbg_bad_dllp_status;
              o_wbs_dat[`DBG_BAD_TLP_LCRC             ] <=  r_dbg_bad_tlp_lcrc;
              o_wbs_dat[`DBG_BAD_TLP_SEQ_NUM          ] <=  r_dbg_bad_tlp_seq_num;
              o_wbs_dat[`DBG_BAD_TLP_STATUS           ] <=  r_dbg_bad_tlp_status;
              o_wbs_dat[`DBG_DL_PROTOCOL_STATUS       ] <=  r_dbg_dl_protocol_status;
              o_wbs_dat[`DBG_FC_PROTOCOL_ERR_STATUS   ] <=  r_dbg_fc_protocol_err_status;
              o_wbs_dat[`DBG_MLFMD_LENGTH             ] <=  r_dbg_mlfrmd_length;
              o_wbs_dat[`DBG_MLFMD_MPS                ] <=  r_dbg_mlfrmd_mps;
              o_wbs_dat[`DBG_MLFMD_TCVC               ] <=  r_dbg_mlfrmd_tcvc;
              o_wbs_dat[`DBG_MLFMD_TLP_STATUS         ] <=  r_dbg_mlfrmd_tlp_status;
              o_wbs_dat[`DBG_MLFMD_UNREC_TYPE         ] <=  r_dbg_mlfrmd_unrec_type;
              o_wbs_dat[`DBG_POISTLPSTATUS            ] <=  r_dbg_poistlpstatus;
              o_wbs_dat[`DBG_RCVR_OVERFLOW_STATUS     ] <=  r_dbg_rcvr_overflow_status;
              o_wbs_dat[`DBG_RPLY_ROLLOVER_STATUS     ] <=  r_dbg_rply_rollover_status;
              o_wbs_dat[`DBG_RPLY_TIMEOUT_STATUS      ] <=  r_dbg_rply_timeout_status;
              o_wbs_dat[`DBG_UR_NO_BAR_HIT            ] <=  r_dbg_ur_no_bar_hit;
              o_wbs_dat[`DBG_UR_POIS_CFG_WR           ] <=  r_dbg_ur_pois_cfg_wr;
              o_wbs_dat[`DBG_UR_STATUS                ] <=  r_dbg_ur_status;
              o_wbs_dat[`DBG_UR_UNSUP_MSG             ] <=  r_dbg_ur_unsup_msg;
            end
            default: begin
              if (w_lcl_mem_en) begin
                o_wbs_dat                             <=  w_lcl_mem_dout;
              end
            end
          endcase
          if (w_lcl_mem_valid) begin
            o_wbs_ack <= 1;
          end
        end
      end
    end
    if (r_host_clock_count < `CLOCK_RATE) begin
      r_host_clock_count                        <= r_host_clock_count + 1;
    end
    else begin
      r_host_clock_count                        <= 0;
      r_1sec_stb_100mhz                         <= 1;
    end
  end
end
endmodule