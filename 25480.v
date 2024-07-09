module will be a wishbone master)
    mem_o_we
    mem_o_stb
    mem_o_cyc
    mem_o_sel
    mem_o_adr
    mem_o_dat
    mem_i_dat
    mem_i_ack
    mem_i_int
  Currently this bus is disabled so if will not interface with memory these signals can be left
  For a reference check out wb_sd_host
*/
assign  mem_o_we                = 0;
assign  mem_o_stb               = 0;
assign  mem_o_cyc               = 0;
assign  mem_o_sel               = 0;
assign  mem_o_adr               = 0;
assign  mem_o_dat               = 0;
//Submodules
//Asynchronous Logic
//Synchronous Logic
//Simulation Control
initial begin
  $dumpfile ("design.vcd");
  $dumpvars(0, tb_cocotb);
end
always @ (posedge clk) begin
  if (r_rst) begin
    r_pcie_reset_n  <=  0;
  end
  else begin
    r_pcie_reset_n  <=  1;
  end
end
endmodule