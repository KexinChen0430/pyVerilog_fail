module  pcie_app_v6#(
  parameter C_DATA_WIDTH = 64,            // RX/TX interface data width
  // Do not override parameters below this line
  parameter STRB_WIDTH = C_DATA_WIDTH / 8               // TSTRB width
)(
  input                         user_clk,
  input                         user_reset,
  input                         user_lnk_up,
  // Tx
  input  [5:0]                  tx_buf_av,
  input                         tx_cfg_req,
  input                         tx_err_drop,
  output                        tx_cfg_gnt,
  input                         s_axis_tx_tready,
  output  [C_DATA_WIDTH-1:0]    s_axis_tx_tdata,
  output  [STRB_WIDTH-1:0]      s_axis_tx_tstrb,
  output  [3:0]                 s_axis_tx_tuser,
  output                        s_axis_tx_tlast,
  output                        s_axis_tx_tvalid,
  // Rx
  output                        rx_np_ok,
  input  [C_DATA_WIDTH-1:0]     m_axis_rx_tdata,
  input  [STRB_WIDTH-1:0]       m_axis_rx_tstrb,
  input                         m_axis_rx_tlast,
  input                         m_axis_rx_tvalid,
  output                        m_axis_rx_tready,
  input  [21:0]                 m_axis_rx_tuser,
  // Flow Control
  input  [11:0]                 fc_cpld,
  input  [7:0]                  fc_cplh,
  input  [11:0]                 fc_npd,
  input  [7:0]                  fc_nph,
  input  [11:0]                 fc_pd,
  input  [7:0]                  fc_ph,
  output [2:0]                  fc_sel,
  // CFG
  input  [31:0]                 cfg_do,
  input                         cfg_rd_wr_done,
  output [31:0]                 cfg_di,
  output [3:0]                  cfg_byte_en,
  output [9:0]                  cfg_dwaddr,
  output                        cfg_wr_en,
  output                        cfg_rd_en,
  output                        cfg_err_cor,
  output                        cfg_err_ur,
  output                        cfg_err_ecrc,
  output                        cfg_err_cpl_timeout,
  output                        cfg_err_cpl_abort,
  output                        cfg_err_cpl_unexpect,
  output                        cfg_err_posted,
  output                        cfg_err_locked,
  output [47:0]                 cfg_err_tlp_cpl_header,
  input                         cfg_err_cpl_rdy,
  output                        cfg_interrupt,
  input                         cfg_interrupt_rdy,
  output                        cfg_interrupt_assert,
  output [7:0]                  cfg_interrupt_di,
  input  [7:0]                  cfg_interrupt_do,
  input  [2:0]                  cfg_interrupt_mmenable,
  input                         cfg_interrupt_msienable,
  input                         cfg_interrupt_msixenable,
  input                         cfg_interrupt_msixfm,
  output                        cfg_turnoff_ok,
  input                         cfg_to_turnoff,
  output                        cfg_trn_pending,
  output                        cfg_pm_wake,
  input   [7:0]                 cfg_bus_number,
  input   [4:0]                 cfg_device_number,
  input   [2:0]                 cfg_function_number,
  input  [15:0]                 cfg_status,
  input  [15:0]                 cfg_command,
  input  [15:0]                 cfg_dstatus,
  input  [15:0]                 cfg_dcommand,
  input  [15:0]                 cfg_lstatus,
  input  [15:0]                 cfg_lcommand,
  input  [15:0]                 cfg_dcommand2,
  input   [2:0]                 cfg_pcie_link_state,
  output [1:0]                  pl_directed_link_change,
  input  [5:0]                  pl_ltssm_state,
  output [1:0]                  pl_directed_link_width,
  output                        pl_directed_link_speed,
  output                        pl_directed_link_auton,
  output                        pl_upstream_prefer_deemph,
  input  [1:0]                  pl_sel_link_width,
  input                         pl_sel_link_rate,
  input                         pl_link_gen2_capable,
  input                         pl_link_partner_gen2_supported,
  input  [2:0]                  pl_initial_link_width,
  input                         pl_link_upcfg_capable,
  input  [1:0]                  pl_lane_reversal_mode,
  input                         pl_received_hot_rst,
  output [63:0]                 cfg_dsn
);
// Core input tie-offs
assign fc_sel = 3'b0;
assign rx_np_ok = 1'b1;
assign s_axis_tx_tuser[0] = 1'b0; // Unused for V6
assign s_axis_tx_tuser[1] = 1'b0; // Error forward packet
assign s_axis_tx_tuser[2] = 1'b0; // Stream packet
assign tx_cfg_gnt = 1'b1;
assign cfg_err_cor = 1'b0;
assign cfg_err_ur = 1'b0;
assign cfg_err_ecrc = 1'b0;
assign cfg_err_cpl_timeout = 1'b0;
assign cfg_err_cpl_abort = 1'b0;
assign cfg_err_cpl_unexpect = 1'b0;
assign cfg_err_posted = 1'b0;
assign cfg_err_locked = 1'b0;
assign cfg_pm_wake = 1'b0;
assign cfg_trn_pending = 1'b0;
assign cfg_interrupt_assert = 1'b0;
assign cfg_interrupt = 1'b0;
assign cfg_dwaddr = 0;
assign cfg_rd_en = 0;
assign pl_directed_link_change = 0;
assign pl_directed_link_width = 0;
assign pl_directed_link_speed = 0;
assign pl_directed_link_auton = 0;
assign pl_upstream_prefer_deemph = 1'b1;
assign cfg_interrupt_di = 8'b0;
assign cfg_err_tlp_cpl_header = 47'h0;
assign cfg_di = 0;
assign cfg_byte_en = 4'h0;
assign cfg_wr_en = 0;
assign cfg_dsn = {`PCI_EXP_EP_DSN_2, `PCI_EXP_EP_DSN_1};
// Programmable I/O Module
wire [15:0] cfg_completer_id      = { cfg_bus_number, cfg_device_number, cfg_function_number };
wire        cfg_bus_mstr_enable   = cfg_command[2];
  PIO  #(
    .C_DATA_WIDTH( C_DATA_WIDTH ),
    .STRB_WIDTH( STRB_WIDTH )
  ) PIO (
  .user_clk ( user_clk ),                         // I
  .user_reset ( user_reset ),                     // I
  .user_lnk_up ( user_lnk_up ),                   // I
  .s_axis_tx_tready ( s_axis_tx_tready ),         // I
  .s_axis_tx_tdata ( s_axis_tx_tdata ),           // O
  .s_axis_tx_tstrb ( s_axis_tx_tstrb ),           // O
  .s_axis_tx_tlast ( s_axis_tx_tlast ),           // O
  .s_axis_tx_tvalid ( s_axis_tx_tvalid ),         // O
  .tx_src_dsc ( s_axis_tx_tuser[3] ),             // O
  .m_axis_rx_tdata( m_axis_rx_tdata ),            // I
  .m_axis_rx_tstrb( m_axis_rx_tstrb ),            // I
  .m_axis_rx_tlast( m_axis_rx_tlast ),            // I
  .m_axis_rx_tvalid( m_axis_rx_tvalid ),          // I
  .m_axis_rx_tready( m_axis_rx_tready ),          // O
  .m_axis_rx_tuser ( m_axis_rx_tuser ),           // I
  .cfg_to_turnoff ( cfg_to_turnoff ),             // I
  .cfg_turnoff_ok ( cfg_turnoff_ok ),             // O
  .cfg_completer_id ( cfg_completer_id ),         // I [15:0]
  .cfg_bus_mstr_enable (cfg_bus_mstr_enable )     // I
        );
endmodule