module amm_master_qsys_with_pcie_sgdma_m_readfifo_m_readfifo (
                                                               // inputs:
                                                                clk,
                                                                m_readfifo_data,
                                                                m_readfifo_rdreq,
                                                                m_readfifo_wrreq,
                                                                reset,
                                                               // outputs:
                                                                m_readfifo_empty,
                                                                m_readfifo_full,
                                                                m_readfifo_q,
                                                                m_readfifo_usedw
                                                             )
;
  output           m_readfifo_empty;
  output           m_readfifo_full;
  output  [ 68: 0] m_readfifo_q;
  output  [  4: 0] m_readfifo_usedw;
  input            clk;
  input   [ 68: 0] m_readfifo_data;
  input            m_readfifo_rdreq;
  input            m_readfifo_wrreq;
  input            reset;
  wire             m_readfifo_empty;
  wire             m_readfifo_full;
  wire    [ 68: 0] m_readfifo_q;
  wire    [  4: 0] m_readfifo_usedw;
  scfifo amm_master_qsys_with_pcie_sgdma_m_readfifo_m_readfifo_m_readfifo
    (
      .aclr (reset),
      .clock (clk),
      .data (m_readfifo_data),
      .empty (m_readfifo_empty),
      .full (m_readfifo_full),
      .q (m_readfifo_q),
      .rdreq (m_readfifo_rdreq),
      .usedw (m_readfifo_usedw),
      .wrreq (m_readfifo_wrreq)
    );
  defparam amm_master_qsys_with_pcie_sgdma_m_readfifo_m_readfifo_m_readfifo.add_ram_output_register = "ON",
           amm_master_qsys_with_pcie_sgdma_m_readfifo_m_readfifo_m_readfifo.intended_device_family = "CYCLONEIVGX",
           amm_master_qsys_with_pcie_sgdma_m_readfifo_m_readfifo_m_readfifo.lpm_numwords = 32,
           amm_master_qsys_with_pcie_sgdma_m_readfifo_m_readfifo_m_readfifo.lpm_showahead = "OFF",
           amm_master_qsys_with_pcie_sgdma_m_readfifo_m_readfifo_m_readfifo.lpm_type = "scfifo",
           amm_master_qsys_with_pcie_sgdma_m_readfifo_m_readfifo_m_readfifo.lpm_width = 69,
           amm_master_qsys_with_pcie_sgdma_m_readfifo_m_readfifo_m_readfifo.lpm_widthu = 5,
           amm_master_qsys_with_pcie_sgdma_m_readfifo_m_readfifo_m_readfifo.overflow_checking = "ON",
           amm_master_qsys_with_pcie_sgdma_m_readfifo_m_readfifo_m_readfifo.underflow_checking = "ON",
           amm_master_qsys_with_pcie_sgdma_m_readfifo_m_readfifo_m_readfifo.use_eab = "ON";
endmodule