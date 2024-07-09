module descriptor_read_which_resides_within_amm_master_qsys_with_pcie_sgdma_control_bits_fifo (
                                                                                                // inputs:
                                                                                                 clk,
                                                                                                 controlbitsfifo_data,
                                                                                                 controlbitsfifo_rdreq,
                                                                                                 controlbitsfifo_wrreq,
                                                                                                 reset,
                                                                                                // outputs:
                                                                                                 controlbitsfifo_empty,
                                                                                                 controlbitsfifo_full,
                                                                                                 controlbitsfifo_q
                                                                                              )
;
  output           controlbitsfifo_empty;
  output           controlbitsfifo_full;
  output  [  6: 0] controlbitsfifo_q;
  input            clk;
  input   [  6: 0] controlbitsfifo_data;
  input            controlbitsfifo_rdreq;
  input            controlbitsfifo_wrreq;
  input            reset;
  wire             controlbitsfifo_empty;
  wire             controlbitsfifo_full;
  wire    [  6: 0] controlbitsfifo_q;
  scfifo descriptor_read_which_resides_within_amm_master_qsys_with_pcie_sgdma_control_bits_fifo_controlbitsfifo
    (
      .aclr (reset),
      .clock (clk),
      .data (controlbitsfifo_data),
      .empty (controlbitsfifo_empty),
      .full (controlbitsfifo_full),
      .q (controlbitsfifo_q),
      .rdreq (controlbitsfifo_rdreq),
      .wrreq (controlbitsfifo_wrreq)
    );
  defparam descriptor_read_which_resides_within_amm_master_qsys_with_pcie_sgdma_control_bits_fifo_controlbitsfifo.add_ram_output_register = "ON",
           descriptor_read_which_resides_within_amm_master_qsys_with_pcie_sgdma_control_bits_fifo_controlbitsfifo.intended_device_family = "CYCLONEIVGX",
           descriptor_read_which_resides_within_amm_master_qsys_with_pcie_sgdma_control_bits_fifo_controlbitsfifo.lpm_numwords = 2,
           descriptor_read_which_resides_within_amm_master_qsys_with_pcie_sgdma_control_bits_fifo_controlbitsfifo.lpm_showahead = "OFF",
           descriptor_read_which_resides_within_amm_master_qsys_with_pcie_sgdma_control_bits_fifo_controlbitsfifo.lpm_type = "scfifo",
           descriptor_read_which_resides_within_amm_master_qsys_with_pcie_sgdma_control_bits_fifo_controlbitsfifo.lpm_width = 7,
           descriptor_read_which_resides_within_amm_master_qsys_with_pcie_sgdma_control_bits_fifo_controlbitsfifo.lpm_widthu = 1,
           descriptor_read_which_resides_within_amm_master_qsys_with_pcie_sgdma_control_bits_fifo_controlbitsfifo.overflow_checking = "ON",
           descriptor_read_which_resides_within_amm_master_qsys_with_pcie_sgdma_control_bits_fifo_controlbitsfifo.underflow_checking = "ON",
           descriptor_read_which_resides_within_amm_master_qsys_with_pcie_sgdma_control_bits_fifo_controlbitsfifo.use_eab = "OFF";
endmodule