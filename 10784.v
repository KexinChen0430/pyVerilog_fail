module pci_exp_usrapp_cfg (
                          cfg_do,
                          cfg_di,
                          cfg_byte_en_n,
                          cfg_dwaddr,
                          cfg_wr_en_n,
                          cfg_rd_en_n,
                          cfg_rd_wr_done_n,
                          cfg_err_cor_n,
                          cfg_err_ur_n,
                          cfg_err_ecrc_n,
                          cfg_err_cpl_timeout_n,
                          cfg_err_cpl_abort_n,
                          cfg_err_cpl_unexpect_n,
                          cfg_err_posted_n,
                          cfg_err_tlp_cpl_header,
                          cfg_interrupt_n,
                          cfg_interrupt_rdy_n,
                          cfg_turnoff_ok_n,
                          cfg_to_turnoff_n,
                          cfg_bus_number,
                          cfg_device_number,
                          cfg_function_number,
                           cfg_status,
                          cfg_command,
                          cfg_dstatus,
                          cfg_dcommand,
                          cfg_lstatus,
                          cfg_lcommand,
                          cfg_pcie_link_state_n,
                          cfg_trn_pending_n,
                          cfg_pm_wake_n,
                          trn_clk,
                          trn_reset_n
                          );
input   [(32 - 1):0]     cfg_do;
output  [(32 - 1):0]     cfg_di;
output  [(32/8 - 1):0]   cfg_byte_en_n;
output  [(10 - 1):0]     cfg_dwaddr;
output                                        cfg_wr_en_n;
output                                        cfg_rd_en_n;
input                                         cfg_rd_wr_done_n;
output                                        cfg_err_cor_n;
output                                        cfg_err_ur_n;
output                                        cfg_err_ecrc_n;
output                                        cfg_err_cpl_timeout_n;
output                                        cfg_err_cpl_abort_n;
output                                        cfg_err_cpl_unexpect_n;
output                                        cfg_err_posted_n;
output  [(48 - 1):0]   cfg_err_tlp_cpl_header;
output                                        cfg_interrupt_n;
input                                         cfg_interrupt_rdy_n;
output                                        cfg_turnoff_ok_n;
input                                         cfg_to_turnoff_n;
output                                        cfg_pm_wake_n;
input    [(8 - 1):0]  cfg_bus_number;
input    [(5 - 1):0]  cfg_device_number;
input    [(3 - 1):0]  cfg_function_number;
input   [(16 - 1):0]      cfg_status;
input   [(16- 1):0]      cfg_command;
input   [(16- 1):0]      cfg_dstatus;
input   [(16 - 1):0]      cfg_dcommand;
input   [(16 - 1):0]      cfg_lstatus;
input   [(16 - 1):0]      cfg_lcommand;
input  [(3 - 1):0]     cfg_pcie_link_state_n;
output                                        cfg_trn_pending_n;
input                                         trn_clk;
input                                         trn_reset_n;
parameter                                     Tcq = 1;
reg  [(32 - 1):0]        cfg_di;
reg  [(32/8 - 1):0]      cfg_byte_en_n;
reg  [(10 - 1):0]        cfg_dwaddr;
reg                                           cfg_wr_en_n;
reg                                           cfg_rd_en_n;
reg                                           cfg_err_cor_n;
reg                                           cfg_err_ecrc_n;
reg                                           cfg_err_ur_n;
reg                                           cfg_err_cpl_timeout_n;
reg                                           cfg_err_cpl_abort_n;
reg                                           cfg_err_cpl_unexpect_n;
reg                                           cfg_err_posted_n;
reg  [(48 - 1):0]      cfg_err_tlp_cpl_header;
reg                                           cfg_interrupt_n;
reg                                           cfg_turnoff_ok_n;
reg                                           cfg_pm_wake_n;
reg                                           cfg_trn_pending_n;
initial begin
  cfg_err_cor_n <= 1'b1;
  cfg_err_ur_n <= 1'b1;
  cfg_err_ecrc_n <= 1'b1;
  cfg_err_cpl_timeout_n <= 1'b1;
  cfg_err_cpl_abort_n <= 1'b1;
  cfg_err_cpl_unexpect_n <= 1'b1;
  cfg_err_posted_n <= 1'b0;
  cfg_interrupt_n <= 1'b1;
  cfg_turnoff_ok_n <= 1'b1;
  cfg_dwaddr <= 0;
  cfg_err_tlp_cpl_header <= 0;
  cfg_di <= 0;
  cfg_byte_en_n <= 4'hf;
  cfg_wr_en_n <= 1;
  cfg_rd_en_n <= 1;
  cfg_pm_wake_n <= 1;
  cfg_trn_pending_n <= 1'b0;
end
/************************************************************
Task : TSK_READ_CFG_DW
Description : Read Configuration Space DW
task TSK_READ_CFG_DW;
input   [31:0]   addr_;
begin
  if (!trn_reset_n) begin
    $display("[%t] : trn_reset_n is asserted", $realtime);
    $finish(1);
  end
  wait ( cfg_rd_wr_done_n == 1'b1)
  @(posedge trn_clk);
  cfg_dwaddr <= #(Tcq) addr_;
  cfg_wr_en_n <= #(Tcq) 1'b1;
  cfg_rd_en_n <= #(Tcq) 1'b0;
  $display("[%t] : Reading Cfg Addr [0x%h]", $realtime, addr_);
  $fdisplay(board.RP.com_usrapp.tx_file_ptr,
            "\n[%t] : Local Configuration Read Access :",
            $realtime);
  @(posedge trn_clk);
  #(Tcq);
  wait ( cfg_rd_wr_done_n == 1'b0)
  #(Tcq);
  $fdisplay(board.RP.com_usrapp.tx_file_ptr,
            "\t\t\tCfg Addr [0x%h] -> Data [0x%h]\n",
            {addr_,2'b00}, cfg_do);
  cfg_rd_en_n <= #(Tcq) 1'b1;
end
endtask // TSK_READ_CFG_DW;
/************************************************************
Task : TSK_WRITE_CFG_DW
Description : Write Configuration Space DW
task TSK_WRITE_CFG_DW;
input   [31:0]   addr_;
input   [31:0]   data_;
input   [3:0]    ben_;
begin
  if (!trn_reset_n) begin
    $display("[%t] : trn_reset_n is asserted", $realtime);
    $finish(1);
  end
  wait ( cfg_rd_wr_done_n == 1'b1)
  @(posedge trn_clk);
  cfg_dwaddr <= #(Tcq) addr_;
  cfg_di      <= #(Tcq) data_;
  cfg_byte_en_n <= #(Tcq) ben_;
  cfg_wr_en_n <= #(Tcq) 1'b0;
  cfg_rd_en_n <= #(Tcq) 1'b1;
  $display("[%t] : Writing Cfg Addr [0x%h]", $realtime, addr_);
  $fdisplay(board.RP.com_usrapp.tx_file_ptr,
            "\n[%t] : Local Configuration Write Access :",
            $realtime);
  @(posedge trn_clk);
  #(Tcq);
  wait ( cfg_rd_wr_done_n == 1'b0)
  #(Tcq);
  cfg_wr_en_n <= #(Tcq) 1'b1;
end
endtask // TSK_WRITE_CFG_DW;
endmodule