module amm_master_qsys_with_pcie_sgdma_m_writefifo_m_writefifo (
                                                                 // inputs:
                                                                  clk,
                                                                  m_writefifo_data,
                                                                  m_writefifo_rdreq,
                                                                  m_writefifo_wrreq,
                                                                  reset,
                                                                 // outputs:
                                                                  m_writefifo_empty,
                                                                  m_writefifo_full,
                                                                  m_writefifo_q,
                                                                  m_writefifo_usedw
                                                               )
;
  output           m_writefifo_empty;
  output           m_writefifo_full;
  output  [ 68: 0] m_writefifo_q;
  output  [  8: 0] m_writefifo_usedw;
  input            clk;
  input   [ 68: 0] m_writefifo_data;
  input            m_writefifo_rdreq;
  input            m_writefifo_wrreq;
  input            reset;
  wire             m_writefifo_empty;
  wire             m_writefifo_full;
  wire    [ 68: 0] m_writefifo_q;
  wire    [  8: 0] m_writefifo_usedw;
  scfifo amm_master_qsys_with_pcie_sgdma_m_writefifo_m_writefifo_m_writefifo
    (
      .aclr (reset),
      .clock (clk),
      .data (m_writefifo_data),
      .empty (m_writefifo_empty),
      .full (m_writefifo_full),
      .q (m_writefifo_q),
      .rdreq (m_writefifo_rdreq),
      .usedw (m_writefifo_usedw),
      .wrreq (m_writefifo_wrreq)
    );
  defparam amm_master_qsys_with_pcie_sgdma_m_writefifo_m_writefifo_m_writefifo.add_ram_output_register = "ON",
           amm_master_qsys_with_pcie_sgdma_m_writefifo_m_writefifo_m_writefifo.intended_device_family = "CYCLONEIVGX",
           amm_master_qsys_with_pcie_sgdma_m_writefifo_m_writefifo_m_writefifo.lpm_numwords = 512,
           amm_master_qsys_with_pcie_sgdma_m_writefifo_m_writefifo_m_writefifo.lpm_showahead = "ON",
           amm_master_qsys_with_pcie_sgdma_m_writefifo_m_writefifo_m_writefifo.lpm_type = "scfifo",
           amm_master_qsys_with_pcie_sgdma_m_writefifo_m_writefifo_m_writefifo.lpm_width = 69,
           amm_master_qsys_with_pcie_sgdma_m_writefifo_m_writefifo_m_writefifo.lpm_widthu = 9,
           amm_master_qsys_with_pcie_sgdma_m_writefifo_m_writefifo_m_writefifo.overflow_checking = "ON",
           amm_master_qsys_with_pcie_sgdma_m_writefifo_m_writefifo_m_writefifo.underflow_checking = "ON",
           amm_master_qsys_with_pcie_sgdma_m_writefifo_m_writefifo_m_writefifo.use_eab = "ON";
endmodule