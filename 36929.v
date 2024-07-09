module sim_ctrl (
  output reg sim_ctrl_clk_op `EXM_VLTOR_PUBLIC_RW,
  output     sim_ctrl_rst_op `EXM_VLTOR_PUBLIC_RW
); // sim_ctrl
`ifdef EXM_USE_DPI
  import "DPI-C" context task sim_ctrl_scope_t ();
`ifdef verilator
  export "DPI-C"         task sim_ctrl_sig_t;
`endif
`endif
  /*
   */
   task sim_ctrl_sig_t;
     sim_ctrl_clk_op
  `ifdef verilator
      =
  `else
      <=
  `endif
       ~sim_ctrl_clk_op;
  endtask : sim_ctrl_sig_t
  initial
    begin
       sim_ctrl_clk_op = `false;
`ifdef verilator
       // driven externally via sim_ctrl_sig_t task
       sim_ctrl_scope_t; // register this scope
`else
       // event driven simulations
       forever #1 sim_ctrl_sig_t;
`endif
    end
  /*
   */
  integer sim_ctrl_cycles_i       `EXM_VLTOR_PUBLIC_RD;
  integer sim_ctrl_cycles_freq_i  `EXM_VLTOR_PUBLIC_RW;
  integer sim_ctrl_rst_i          `EXM_VLTOR_PUBLIC_RW;
  integer sim_ctrl_timeout_i      `EXM_VLTOR_PUBLIC_RW;
  reg     sim_ctrl_finish_r       `EXM_VLTOR_PUBLIC_RW;
  always @(posedge sim_ctrl_clk_op)
    begin
      sim_ctrl_cycles_i <= sim_ctrl_cycles_i + 1;
      if (sim_ctrl_cycles_i % sim_ctrl_cycles_freq_i == 0)
        `EXM_INFORMATION("%10d cycles", sim_ctrl_cycles_i);
      if (sim_ctrl_cycles_i > sim_ctrl_timeout_i)
	sim_ctrl_finish_r <= `true;
    end
  initial sim_ctrl_rst_i = 5;
  assign sim_ctrl_rst_op = sim_ctrl_cycles_i < sim_ctrl_rst_i;
  /*
   */
  initial sim_ctrl_timeout_i = 10;
  always @(sim_ctrl_timeout_i)
    `EXM_INFORMATION("%m : timeout set to %d", sim_ctrl_timeout_i);
  initial sim_ctrl_cycles_i      = 0;
  initial sim_ctrl_cycles_freq_i = 1000;
   /*
    */
   initial sim_ctrl_finish_r = `false;
   always @(posedge sim_ctrl_finish_r)
     begin
      `EXM_INFORMATION("End of simulation at %d", sim_ctrl_cycles_i);
       $finish;
     end
  /*
   */
  initial `EXM_PYTHON();
  /*
   */
  initial
    begin : sim_ctrl_vcd_l
      integer sim_ctrl_vcd_depth_r = 0;
      reg [`std_char_sz_c*128-1:0] sim_ctrl_vcd_filename_r;
      reg 			   sim_ctrl_vcd_r;
      sim_ctrl_vcd_r = `EXM_WAVES(sim_ctrl_vcd_filename_r, sim_ctrl_vcd_depth_r);
      if (sim_ctrl_vcd_r)
	begin
`ifndef verilator
          $dumpfile(sim_ctrl_vcd_filename_r);
          $dumpvars(sim_ctrl_vcd_depth_r);
          `EXM_INFORMATION("Enabling waves depth %d, dumping to file %s", sim_ctrl_vcd_depth_r, sim_ctrl_vcd_filename_r);
`endif
        end
    end
endmodule