module outputs)
   wire [OPTION_OPERAND_WIDTH-1:0] dbus_adr_o;	// From mor1kx_cpu of mor1kx_cpu.v
   wire [3:0]		dbus_bsel_o;		// From mor1kx_cpu of mor1kx_cpu.v
   wire			dbus_burst_o;		// From mor1kx_cpu of mor1kx_cpu.v
   wire [OPTION_OPERAND_WIDTH-1:0] dbus_dat_o;	// From mor1kx_cpu of mor1kx_cpu.v
   wire			dbus_req_o;		// From mor1kx_cpu of mor1kx_cpu.v
   wire			dbus_we_o;		// From mor1kx_cpu of mor1kx_cpu.v
   wire [OPTION_OPERAND_WIDTH-1:0] ibus_adr_o;	// From mor1kx_cpu of mor1kx_cpu.v
   wire			ibus_burst_o;		// From mor1kx_cpu of mor1kx_cpu.v
   wire			ibus_req_o;		// From mor1kx_cpu of mor1kx_cpu.v
   wire [15:0]		spr_bus_addr_o;		// From mor1kx_cpu of mor1kx_cpu.v
   wire [OPTION_OPERAND_WIDTH-1:0] spr_bus_dat_o;// From mor1kx_cpu of mor1kx_cpu.v
   wire			spr_bus_stb_o;		// From mor1kx_cpu of mor1kx_cpu.v
   wire			spr_bus_we_o;		// From mor1kx_cpu of mor1kx_cpu.v
   wire [15:0]		spr_sr_o;		// From mor1kx_cpu of mor1kx_cpu.v
   // End of automatics
   wire 			   ibus_ack_i;
   wire [OPTION_OPERAND_WIDTH-1:0] ibus_dat_i;
   wire 			   ibus_err_i;
   wire 			   dbus_ack_i;
   wire [OPTION_OPERAND_WIDTH-1:0] dbus_dat_i;
   wire 			   dbus_err_i;
   generate
      if (BUS_IF_TYPE=="WISHBONE32") begin : bus_gen
	 /* mor1kx_bus_if_wb32 AUTO_TEMPLATE (
	  .cpu_err_o			(ibus_err_i),
	  .cpu_ack_o			(ibus_ack_i),
	  .cpu_dat_o			(ibus_dat_i[`OR1K_INSN_WIDTH-1:0]),
	  .wbm_adr_o			(iwbm_adr_o),
	  .wbm_stb_o			(iwbm_stb_o),
	  .wbm_cyc_o			(iwbm_cyc_o),
	  .wbm_sel_o			(iwbm_sel_o),
	  .wbm_we_o			(iwbm_we_o),
	  .wbm_cti_o			(iwbm_cti_o),
	  .wbm_bte_o			(iwbm_bte_o),
	  .wbm_dat_o			(iwbm_dat_o),
	  // Inputs
	  .cpu_adr_i			(ibus_adr_o),
	  .cpu_dat_i			({OPTION_OPERAND_WIDTH{1'b0}}),
	  .cpu_req_i			(ibus_req_o),
	  .cpu_we_i			(1'b0),
	  .cpu_bsel_i			(4'b1111),
	  .cpu_burst_i			(ibus_burst_o),
	  .wbm_err_i			(iwbm_err_i),
	  .wbm_ack_i			(iwbm_ack_i),
	  .wbm_dat_i			(iwbm_dat_i),
	  .wbm_rty_i			(iwbm_rty_i),
	  ); */
	 mor1kx_bus_if_wb32
	   #(.BUS_IF_TYPE(IBUS_WB_TYPE),
	     .BURST_LENGTH((FEATURE_INSTRUCTIONCACHE != "NONE") ?
			   ((OPTION_ICACHE_BLOCK_WIDTH == 4) ? 4 :
			    ((OPTION_ICACHE_BLOCK_WIDTH == 5) ? 8 : 1))
			   : 1 ))
	 ibus_bridge
		      (/*AUTOINST*/
		       // Outputs
		       .cpu_err_o	(ibus_err_i),		 // Templated
		       .cpu_ack_o	(ibus_ack_i),		 // Templated
		       .cpu_dat_o	(ibus_dat_i[`OR1K_INSN_WIDTH-1:0]), // Templated
		       .wbm_adr_o	(iwbm_adr_o),		 // Templated
		       .wbm_stb_o	(iwbm_stb_o),		 // Templated
		       .wbm_cyc_o	(iwbm_cyc_o),		 // Templated
		       .wbm_sel_o	(iwbm_sel_o),		 // Templated
		       .wbm_we_o	(iwbm_we_o),		 // Templated
		       .wbm_cti_o	(iwbm_cti_o),		 // Templated
		       .wbm_bte_o	(iwbm_bte_o),		 // Templated
		       .wbm_dat_o	(iwbm_dat_o),		 // Templated
		       // Inputs
		       .clk		(clk),
		       .rst		(rst),
		       .cpu_adr_i	(ibus_adr_o),		 // Templated
		       .cpu_dat_i	({OPTION_OPERAND_WIDTH{1'b0}}), // Templated
		       .cpu_req_i	(ibus_req_o),		 // Templated
		       .cpu_bsel_i	(4'b1111),		 // Templated
		       .cpu_we_i	(1'b0),			 // Templated
		       .cpu_burst_i	(ibus_burst_o),		 // Templated
		       .wbm_err_i	(iwbm_err_i),		 // Templated
		       .wbm_ack_i	(iwbm_ack_i),		 // Templated
		       .wbm_dat_i	(iwbm_dat_i),		 // Templated
		       .wbm_rty_i	(iwbm_rty_i));		 // Templated
	 /* mor1kx_bus_if_wb32 AUTO_TEMPLATE (
	  .cpu_err_o			(dbus_err_i),
	  .cpu_ack_o			(dbus_ack_i),
	  .cpu_dat_o			(dbus_dat_i[OPTION_OPERAND_WIDTH-1:0]),
	  .wbm_adr_o			(dwbm_adr_o),
	  .wbm_stb_o			(dwbm_stb_o),
	  .wbm_cyc_o			(dwbm_cyc_o),
	  .wbm_sel_o			(dwbm_sel_o),
	  .wbm_we_o			(dwbm_we_o),
	  .wbm_cti_o			(dwbm_cti_o),
	  .wbm_bte_o			(dwbm_bte_o),
	  .wbm_dat_o			(dwbm_dat_o),
	  // Inputs
	  .cpu_adr_i			(dbus_adr_o[31:0]),
	  .cpu_dat_i			(dbus_dat_o),
	  .cpu_req_i			(dbus_req_o),
	  .cpu_we_i			(dbus_we_o),
	  .cpu_bsel_i			(dbus_bsel_o),
	  .cpu_burst_i			(dbus_burst_o),
	  .wbm_err_i			(dwbm_err_i),
	  .wbm_ack_i			(dwbm_ack_i),
	  .wbm_dat_i			(dwbm_dat_i),
	  .wbm_rty_i			(dwbm_rty_i),
	  ); */
	 mor1kx_bus_if_wb32
	   #(.BUS_IF_TYPE(DBUS_WB_TYPE),
	     .BURST_LENGTH((FEATURE_DATACACHE != "NONE") ?
			   ((OPTION_DCACHE_BLOCK_WIDTH == 4) ? 4 :
			    ((OPTION_DCACHE_BLOCK_WIDTH == 5) ? 8 : 1))
			   : 1 ))
	 dbus_bridge
	   (/*AUTOINST*/
	    // Outputs
	    .cpu_err_o			(dbus_err_i),		 // Templated
	    .cpu_ack_o			(dbus_ack_i),		 // Templated
	    .cpu_dat_o			(dbus_dat_i[OPTION_OPERAND_WIDTH-1:0]), // Templated
	    .wbm_adr_o			(dwbm_adr_o),		 // Templated
	    .wbm_stb_o			(dwbm_stb_o),		 // Templated
	    .wbm_cyc_o			(dwbm_cyc_o),		 // Templated
	    .wbm_sel_o			(dwbm_sel_o),		 // Templated
	    .wbm_we_o			(dwbm_we_o),		 // Templated
	    .wbm_cti_o			(dwbm_cti_o),		 // Templated
	    .wbm_bte_o			(dwbm_bte_o),		 // Templated
	    .wbm_dat_o			(dwbm_dat_o),		 // Templated
	    // Inputs
	    .clk			(clk),
	    .rst			(rst),
	    .cpu_adr_i			(dbus_adr_o[31:0]),	 // Templated
	    .cpu_dat_i			(dbus_dat_o),		 // Templated
	    .cpu_req_i			(dbus_req_o),		 // Templated
	    .cpu_bsel_i			(dbus_bsel_o),		 // Templated
	    .cpu_we_i			(dbus_we_o),		 // Templated
	    .cpu_burst_i		(dbus_burst_o),		 // Templated
	    .wbm_err_i			(dwbm_err_i),		 // Templated
	    .wbm_ack_i			(dwbm_ack_i),		 // Templated
	    .wbm_dat_i			(dwbm_dat_i),		 // Templated
	    .wbm_rty_i			(dwbm_rty_i));		 // Templated
      end else begin
	   initial begin
	      $display("Error: BUS_IF_TYPE not correct");
	      $finish();
	   end
	end // else: !if(BUS_IF_TYPE=="WISHBONE32")
   endgenerate
   /* mor1kx_cpu AUTO_TEMPLATE
    (
    .spr_bus_dat_dmmu_i		(),
    .spr_bus_ack_dmmu_i		(),
    .spr_bus_dat_immu_i		(),
    .spr_bus_ack_immu_i		(),
    .spr_bus_dat_mac_i		(),
    .spr_bus_ack_mac_i		(),
    .spr_bus_dat_pmu_i		(),
    .spr_bus_ack_pmu_i		(),
    .spr_bus_dat_pcu_i		(),
    .spr_bus_ack_pcu_i		(),
    .spr_bus_dat_fpu_i		(),
    .spr_bus_ack_fpu_i		(),
    ); */
   mor1kx_cpu
     	   #(
	     .OPTION_OPERAND_WIDTH(OPTION_OPERAND_WIDTH),
	     .OPTION_CPU(OPTION_CPU0),
	     .FEATURE_DATACACHE(FEATURE_DATACACHE),
	     .OPTION_DCACHE_BLOCK_WIDTH(OPTION_DCACHE_BLOCK_WIDTH),
	     .OPTION_DCACHE_SET_WIDTH(OPTION_DCACHE_SET_WIDTH),
	     .OPTION_DCACHE_WAYS(OPTION_DCACHE_WAYS),
	     .OPTION_DCACHE_LIMIT_WIDTH(OPTION_DCACHE_LIMIT_WIDTH),
             .OPTION_DCACHE_SNOOP(OPTION_DCACHE_SNOOP),
	     .FEATURE_DMMU(FEATURE_DMMU),
	     .FEATURE_DMMU_HW_TLB_RELOAD(FEATURE_DMMU_HW_TLB_RELOAD),
	     .OPTION_DMMU_SET_WIDTH(OPTION_DMMU_SET_WIDTH),
	     .OPTION_DMMU_WAYS(OPTION_DMMU_WAYS),
	     .FEATURE_INSTRUCTIONCACHE(FEATURE_INSTRUCTIONCACHE),
	     .OPTION_ICACHE_BLOCK_WIDTH(OPTION_ICACHE_BLOCK_WIDTH),
	     .OPTION_ICACHE_SET_WIDTH(OPTION_ICACHE_SET_WIDTH),
	     .OPTION_ICACHE_WAYS(OPTION_ICACHE_WAYS),
	     .OPTION_ICACHE_LIMIT_WIDTH(OPTION_ICACHE_LIMIT_WIDTH),
	     .FEATURE_IMMU(FEATURE_IMMU),
	     .FEATURE_IMMU_HW_TLB_RELOAD(FEATURE_IMMU_HW_TLB_RELOAD),
	     .OPTION_IMMU_SET_WIDTH(OPTION_IMMU_SET_WIDTH),
	     .OPTION_IMMU_WAYS(OPTION_IMMU_WAYS),
	     .FEATURE_PIC(FEATURE_PIC),
	     .FEATURE_TIMER(FEATURE_TIMER),
	     .FEATURE_DEBUGUNIT(FEATURE_DEBUGUNIT),
	     .FEATURE_PERFCOUNTERS(FEATURE_PERFCOUNTERS),
	     .FEATURE_MAC(FEATURE_MAC),
	     .FEATURE_SYSCALL(FEATURE_SYSCALL),
	     .FEATURE_TRAP(FEATURE_TRAP),
	     .FEATURE_RANGE(FEATURE_RANGE),
	     .OPTION_PIC_TRIGGER(OPTION_PIC_TRIGGER),
	     .OPTION_PIC_NMI_WIDTH(OPTION_PIC_NMI_WIDTH),
	     .FEATURE_DSX(FEATURE_DSX),
	     .FEATURE_OVERFLOW(FEATURE_OVERFLOW),
	     .FEATURE_CARRY_FLAG(FEATURE_CARRY_FLAG),
	     .FEATURE_FASTCONTEXTS(FEATURE_FASTCONTEXTS),
	     .OPTION_RF_CLEAR_ON_INIT(OPTION_RF_CLEAR_ON_INIT),
	     .OPTION_RF_NUM_SHADOW_GPR(OPTION_RF_NUM_SHADOW_GPR),
	     .OPTION_RF_ADDR_WIDTH(OPTION_RF_ADDR_WIDTH),
	     .OPTION_RF_WORDS(OPTION_RF_WORDS),
	     .OPTION_RESET_PC(OPTION_RESET_PC),
	     .FEATURE_MULTIPLIER(FEATURE_MULTIPLIER),
	     .FEATURE_DIVIDER(FEATURE_DIVIDER),
	     .FEATURE_ADDC(FEATURE_ADDC),
	     .FEATURE_SRA(FEATURE_SRA),
	     .FEATURE_ROR(FEATURE_ROR),
	     .FEATURE_EXT(FEATURE_EXT),
	     .FEATURE_CMOV(FEATURE_CMOV),
	     .FEATURE_FFL1(FEATURE_FFL1),
	     .FEATURE_ATOMIC(FEATURE_ATOMIC),
	     .FEATURE_FPU(FEATURE_FPU), // mor1kx_cpu instance
	     .FEATURE_CUST1(FEATURE_CUST1),
	     .FEATURE_CUST2(FEATURE_CUST2),
	     .FEATURE_CUST3(FEATURE_CUST3),
	     .FEATURE_CUST4(FEATURE_CUST4),
	     .FEATURE_CUST5(FEATURE_CUST5),
	     .FEATURE_CUST6(FEATURE_CUST6),
	     .FEATURE_CUST7(FEATURE_CUST7),
	     .FEATURE_CUST8(FEATURE_CUST8),
	     .OPTION_SHIFTER(OPTION_SHIFTER),
	     .FEATURE_STORE_BUFFER(FEATURE_STORE_BUFFER),
	     .OPTION_STORE_BUFFER_DEPTH_WIDTH(OPTION_STORE_BUFFER_DEPTH_WIDTH),
	     .FEATURE_MULTICORE(FEATURE_MULTICORE),
	     .FEATURE_TRACEPORT_EXEC(FEATURE_TRACEPORT_EXEC)
	     )
   mor1kx_cpu
     (/*AUTOINST*/
      // Outputs
      .ibus_adr_o			(ibus_adr_o[OPTION_OPERAND_WIDTH-1:0]),
      .ibus_req_o			(ibus_req_o),
      .ibus_burst_o			(ibus_burst_o),
      .dbus_adr_o			(dbus_adr_o[OPTION_OPERAND_WIDTH-1:0]),
      .dbus_dat_o			(dbus_dat_o[OPTION_OPERAND_WIDTH-1:0]),
      .dbus_req_o			(dbus_req_o),
      .dbus_bsel_o			(dbus_bsel_o[3:0]),
      .dbus_we_o			(dbus_we_o),
      .dbus_burst_o			(dbus_burst_o),
      .du_dat_o				(du_dat_o[OPTION_OPERAND_WIDTH-1:0]),
      .du_ack_o				(du_ack_o),
      .du_stall_o			(du_stall_o),
      .traceport_exec_valid_o		(traceport_exec_valid_o),
      .traceport_exec_pc_o		(traceport_exec_pc_o[31:0]),
      .traceport_exec_insn_o		(traceport_exec_insn_o[`OR1K_INSN_WIDTH-1:0]),
      .traceport_exec_wbdata_o		(traceport_exec_wbdata_o[OPTION_OPERAND_WIDTH-1:0]),
      .traceport_exec_wbreg_o		(traceport_exec_wbreg_o[OPTION_RF_ADDR_WIDTH-1:0]),
      .traceport_exec_wben_o		(traceport_exec_wben_o),
      .spr_bus_addr_o			(spr_bus_addr_o[15:0]),
      .spr_bus_we_o			(spr_bus_we_o),
      .spr_bus_stb_o			(spr_bus_stb_o),
      .spr_bus_dat_o			(spr_bus_dat_o[OPTION_OPERAND_WIDTH-1:0]),
      .spr_sr_o				(spr_sr_o[15:0]),
      // Inputs
      .clk				(clk),
      .rst				(rst),
      .ibus_err_i			(ibus_err_i),
      .ibus_ack_i			(ibus_ack_i),
      .ibus_dat_i			(ibus_dat_i[`OR1K_INSN_WIDTH-1:0]),
      .dbus_err_i			(dbus_err_i),
      .dbus_ack_i			(dbus_ack_i),
      .dbus_dat_i			(dbus_dat_i[OPTION_OPERAND_WIDTH-1:0]),
      .irq_i				(irq_i[31:0]),
      .du_addr_i			(du_addr_i[15:0]),
      .du_stb_i				(du_stb_i),
      .du_dat_i				(du_dat_i[OPTION_OPERAND_WIDTH-1:0]),
      .du_we_i				(du_we_i),
      .du_stall_i			(du_stall_i),
      .spr_bus_dat_dmmu_i		(),			 // Templated
      .spr_bus_ack_dmmu_i		(),			 // Templated
      .spr_bus_dat_immu_i		(),			 // Templated
      .spr_bus_ack_immu_i		(),			 // Templated
      .spr_bus_dat_mac_i		(),			 // Templated
      .spr_bus_ack_mac_i		(),			 // Templated
      .spr_bus_dat_pmu_i		(),			 // Templated
      .spr_bus_ack_pmu_i		(),			 // Templated
      .spr_bus_dat_pcu_i		(),			 // Templated
      .spr_bus_ack_pcu_i		(),			 // Templated
      .spr_bus_dat_fpu_i		(),			 // Templated
      .spr_bus_ack_fpu_i		(),			 // Templated
      .multicore_coreid_i		(multicore_coreid_i[OPTION_OPERAND_WIDTH-1:0]),
      .multicore_numcores_i		(multicore_numcores_i[OPTION_OPERAND_WIDTH-1:0]),
      .snoop_adr_i			(snoop_adr_i[31:0]),
      .snoop_en_i			(snoop_en_i));
endmodule