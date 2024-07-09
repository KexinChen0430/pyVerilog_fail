module outputs
  wire [63 : 0] cpu_dmem_master_araddr,
		cpu_dmem_master_awaddr,
		cpu_dmem_master_wdata,
		cpu_imem_master_araddr,
		cpu_imem_master_awaddr,
		cpu_imem_master_wdata;
  wire [7 : 0] cpu_dmem_master_arlen,
	       cpu_dmem_master_awlen,
	       cpu_dmem_master_wstrb,
	       cpu_imem_master_arlen,
	       cpu_imem_master_awlen,
	       cpu_imem_master_wstrb;
  wire [3 : 0] cpu_dmem_master_arcache,
	       cpu_dmem_master_arid,
	       cpu_dmem_master_arqos,
	       cpu_dmem_master_arregion,
	       cpu_dmem_master_awcache,
	       cpu_dmem_master_awid,
	       cpu_dmem_master_awqos,
	       cpu_dmem_master_awregion,
	       cpu_imem_master_arcache,
	       cpu_imem_master_arid,
	       cpu_imem_master_arqos,
	       cpu_imem_master_arregion,
	       cpu_imem_master_awcache,
	       cpu_imem_master_awid,
	       cpu_imem_master_awqos,
	       cpu_imem_master_awregion;
  wire [2 : 0] cpu_dmem_master_arprot,
	       cpu_dmem_master_arsize,
	       cpu_dmem_master_awprot,
	       cpu_dmem_master_awsize,
	       cpu_imem_master_arprot,
	       cpu_imem_master_arsize,
	       cpu_imem_master_awprot,
	       cpu_imem_master_awsize;
  wire [1 : 0] cpu_dmem_master_arburst,
	       cpu_dmem_master_awburst,
	       cpu_imem_master_arburst,
	       cpu_imem_master_awburst;
  wire RDY_cpu_reset_server_request_put,
       RDY_cpu_reset_server_response_get,
       RDY_set_verbosity,
       RDY_set_watch_tohost,
       cpu_dmem_master_arlock,
       cpu_dmem_master_arvalid,
       cpu_dmem_master_awlock,
       cpu_dmem_master_awvalid,
       cpu_dmem_master_bready,
       cpu_dmem_master_rready,
       cpu_dmem_master_wlast,
       cpu_dmem_master_wvalid,
       cpu_imem_master_arlock,
       cpu_imem_master_arvalid,
       cpu_imem_master_awlock,
       cpu_imem_master_awvalid,
       cpu_imem_master_bready,
       cpu_imem_master_rready,
       cpu_imem_master_wlast,
       cpu_imem_master_wvalid,
       cpu_reset_server_response_get;
  // ports of submodule cpu
  wire [63 : 0] cpu$dmem_master_araddr,
		cpu$dmem_master_awaddr,
		cpu$dmem_master_rdata,
		cpu$dmem_master_wdata,
		cpu$imem_master_araddr,
		cpu$imem_master_awaddr,
		cpu$imem_master_rdata,
		cpu$imem_master_wdata,
		cpu$set_verbosity_logdelay,
		cpu$set_watch_tohost_tohost_addr;
  wire [7 : 0] cpu$dmem_master_arlen,
	       cpu$dmem_master_awlen,
	       cpu$dmem_master_wstrb,
	       cpu$imem_master_arlen,
	       cpu$imem_master_awlen,
	       cpu$imem_master_wstrb;
  wire [3 : 0] cpu$dmem_master_arcache,
	       cpu$dmem_master_arid,
	       cpu$dmem_master_arqos,
	       cpu$dmem_master_arregion,
	       cpu$dmem_master_awcache,
	       cpu$dmem_master_awid,
	       cpu$dmem_master_awqos,
	       cpu$dmem_master_awregion,
	       cpu$dmem_master_bid,
	       cpu$dmem_master_rid,
	       cpu$imem_master_arcache,
	       cpu$imem_master_arid,
	       cpu$imem_master_arqos,
	       cpu$imem_master_arregion,
	       cpu$imem_master_awcache,
	       cpu$imem_master_awid,
	       cpu$imem_master_awqos,
	       cpu$imem_master_awregion,
	       cpu$imem_master_bid,
	       cpu$imem_master_rid,
	       cpu$set_verbosity_verbosity;
  wire [2 : 0] cpu$dmem_master_arprot,
	       cpu$dmem_master_arsize,
	       cpu$dmem_master_awprot,
	       cpu$dmem_master_awsize,
	       cpu$imem_master_arprot,
	       cpu$imem_master_arsize,
	       cpu$imem_master_awprot,
	       cpu$imem_master_awsize;
  wire [1 : 0] cpu$dmem_master_arburst,
	       cpu$dmem_master_awburst,
	       cpu$dmem_master_bresp,
	       cpu$dmem_master_rresp,
	       cpu$imem_master_arburst,
	       cpu$imem_master_awburst,
	       cpu$imem_master_bresp,
	       cpu$imem_master_rresp;
  wire cpu$EN_hart0_server_reset_request_put,
       cpu$EN_hart0_server_reset_response_get,
       cpu$EN_set_verbosity,
       cpu$EN_set_watch_tohost,
       cpu$RDY_hart0_server_reset_request_put,
       cpu$RDY_hart0_server_reset_response_get,
       cpu$dmem_master_arlock,
       cpu$dmem_master_arready,
       cpu$dmem_master_arvalid,
       cpu$dmem_master_awlock,
       cpu$dmem_master_awready,
       cpu$dmem_master_awvalid,
       cpu$dmem_master_bready,
       cpu$dmem_master_bvalid,
       cpu$dmem_master_rlast,
       cpu$dmem_master_rready,
       cpu$dmem_master_rvalid,
       cpu$dmem_master_wlast,
       cpu$dmem_master_wready,
       cpu$dmem_master_wvalid,
       cpu$hart0_server_reset_request_put,
       cpu$hart0_server_reset_response_get,
       cpu$imem_master_arlock,
       cpu$imem_master_arready,
       cpu$imem_master_arvalid,
       cpu$imem_master_awlock,
       cpu$imem_master_awready,
       cpu$imem_master_awvalid,
       cpu$imem_master_bready,
       cpu$imem_master_bvalid,
       cpu$imem_master_rlast,
       cpu$imem_master_rready,
       cpu$imem_master_rvalid,
       cpu$imem_master_wlast,
       cpu$imem_master_wready,
       cpu$imem_master_wvalid,
       cpu$m_external_interrupt_req_set_not_clear,
       cpu$nmi_req_set_not_clear,
       cpu$s_external_interrupt_req_set_not_clear,
       cpu$set_watch_tohost_watch_tohost,
       cpu$software_interrupt_req_set_not_clear,
       cpu$timer_interrupt_req_set_not_clear;
  // ports of submodule f_reset_reqs
  wire f_reset_reqs$CLR,
       f_reset_reqs$DEQ,
       f_reset_reqs$D_IN,
       f_reset_reqs$D_OUT,
       f_reset_reqs$EMPTY_N,
       f_reset_reqs$ENQ,
       f_reset_reqs$FULL_N;
  // ports of submodule f_reset_rsps
  wire f_reset_rsps$CLR,
       f_reset_rsps$DEQ,
       f_reset_rsps$D_IN,
       f_reset_rsps$D_OUT,
       f_reset_rsps$EMPTY_N,
       f_reset_rsps$ENQ,
       f_reset_rsps$FULL_N;
  // ports of submodule fabric_2x3
  wire [63 : 0] fabric_2x3$v_from_masters_0_araddr,
		fabric_2x3$v_from_masters_0_awaddr,
		fabric_2x3$v_from_masters_0_rdata,
		fabric_2x3$v_from_masters_0_wdata,
		fabric_2x3$v_from_masters_1_araddr,
		fabric_2x3$v_from_masters_1_awaddr,
		fabric_2x3$v_from_masters_1_wdata,
		fabric_2x3$v_to_slaves_0_araddr,
		fabric_2x3$v_to_slaves_0_awaddr,
		fabric_2x3$v_to_slaves_0_rdata,
		fabric_2x3$v_to_slaves_0_wdata,
		fabric_2x3$v_to_slaves_1_araddr,
		fabric_2x3$v_to_slaves_1_awaddr,
		fabric_2x3$v_to_slaves_1_rdata,
		fabric_2x3$v_to_slaves_1_wdata,
		fabric_2x3$v_to_slaves_2_araddr,
		fabric_2x3$v_to_slaves_2_awaddr,
		fabric_2x3$v_to_slaves_2_rdata,
		fabric_2x3$v_to_slaves_2_wdata;
  wire [7 : 0] fabric_2x3$v_from_masters_0_arlen,
	       fabric_2x3$v_from_masters_0_awlen,
	       fabric_2x3$v_from_masters_0_wstrb,
	       fabric_2x3$v_from_masters_1_arlen,
	       fabric_2x3$v_from_masters_1_awlen,
	       fabric_2x3$v_from_masters_1_wstrb,
	       fabric_2x3$v_to_slaves_0_arlen,
	       fabric_2x3$v_to_slaves_0_awlen,
	       fabric_2x3$v_to_slaves_0_wstrb,
	       fabric_2x3$v_to_slaves_1_arlen,
	       fabric_2x3$v_to_slaves_1_awlen,
	       fabric_2x3$v_to_slaves_1_wstrb,
	       fabric_2x3$v_to_slaves_2_arlen,
	       fabric_2x3$v_to_slaves_2_awlen,
	       fabric_2x3$v_to_slaves_2_wstrb;
  wire [3 : 0] fabric_2x3$set_verbosity_verbosity,
	       fabric_2x3$v_from_masters_0_arcache,
	       fabric_2x3$v_from_masters_0_arid,
	       fabric_2x3$v_from_masters_0_arqos,
	       fabric_2x3$v_from_masters_0_arregion,
	       fabric_2x3$v_from_masters_0_awcache,
	       fabric_2x3$v_from_masters_0_awid,
	       fabric_2x3$v_from_masters_0_awqos,
	       fabric_2x3$v_from_masters_0_awregion,
	       fabric_2x3$v_from_masters_0_bid,
	       fabric_2x3$v_from_masters_0_rid,
	       fabric_2x3$v_from_masters_1_arcache,
	       fabric_2x3$v_from_masters_1_arid,
	       fabric_2x3$v_from_masters_1_arqos,
	       fabric_2x3$v_from_masters_1_arregion,
	       fabric_2x3$v_from_masters_1_awcache,
	       fabric_2x3$v_from_masters_1_awid,
	       fabric_2x3$v_from_masters_1_awqos,
	       fabric_2x3$v_from_masters_1_awregion,
	       fabric_2x3$v_to_slaves_0_arcache,
	       fabric_2x3$v_to_slaves_0_arid,
	       fabric_2x3$v_to_slaves_0_arqos,
	       fabric_2x3$v_to_slaves_0_arregion,
	       fabric_2x3$v_to_slaves_0_awcache,
	       fabric_2x3$v_to_slaves_0_awid,
	       fabric_2x3$v_to_slaves_0_awqos,
	       fabric_2x3$v_to_slaves_0_awregion,
	       fabric_2x3$v_to_slaves_0_bid,
	       fabric_2x3$v_to_slaves_0_rid,
	       fabric_2x3$v_to_slaves_1_arcache,
	       fabric_2x3$v_to_slaves_1_arid,
	       fabric_2x3$v_to_slaves_1_arqos,
	       fabric_2x3$v_to_slaves_1_arregion,
	       fabric_2x3$v_to_slaves_1_awcache,
	       fabric_2x3$v_to_slaves_1_awid,
	       fabric_2x3$v_to_slaves_1_awqos,
	       fabric_2x3$v_to_slaves_1_awregion,
	       fabric_2x3$v_to_slaves_1_bid,
	       fabric_2x3$v_to_slaves_1_rid,
	       fabric_2x3$v_to_slaves_2_arcache,
	       fabric_2x3$v_to_slaves_2_arid,
	       fabric_2x3$v_to_slaves_2_arqos,
	       fabric_2x3$v_to_slaves_2_arregion,
	       fabric_2x3$v_to_slaves_2_awcache,
	       fabric_2x3$v_to_slaves_2_awid,
	       fabric_2x3$v_to_slaves_2_awqos,
	       fabric_2x3$v_to_slaves_2_awregion,
	       fabric_2x3$v_to_slaves_2_bid,
	       fabric_2x3$v_to_slaves_2_rid;
  wire [2 : 0] fabric_2x3$v_from_masters_0_arprot,
	       fabric_2x3$v_from_masters_0_arsize,
	       fabric_2x3$v_from_masters_0_awprot,
	       fabric_2x3$v_from_masters_0_awsize,
	       fabric_2x3$v_from_masters_1_arprot,
	       fabric_2x3$v_from_masters_1_arsize,
	       fabric_2x3$v_from_masters_1_awprot,
	       fabric_2x3$v_from_masters_1_awsize,
	       fabric_2x3$v_to_slaves_0_arprot,
	       fabric_2x3$v_to_slaves_0_arsize,
	       fabric_2x3$v_to_slaves_0_awprot,
	       fabric_2x3$v_to_slaves_0_awsize,
	       fabric_2x3$v_to_slaves_1_arprot,
	       fabric_2x3$v_to_slaves_1_arsize,
	       fabric_2x3$v_to_slaves_1_awprot,
	       fabric_2x3$v_to_slaves_1_awsize,
	       fabric_2x3$v_to_slaves_2_arprot,
	       fabric_2x3$v_to_slaves_2_arsize,
	       fabric_2x3$v_to_slaves_2_awprot,
	       fabric_2x3$v_to_slaves_2_awsize;
  wire [1 : 0] fabric_2x3$v_from_masters_0_arburst,
	       fabric_2x3$v_from_masters_0_awburst,
	       fabric_2x3$v_from_masters_0_bresp,
	       fabric_2x3$v_from_masters_0_rresp,
	       fabric_2x3$v_from_masters_1_arburst,
	       fabric_2x3$v_from_masters_1_awburst,
	       fabric_2x3$v_to_slaves_0_arburst,
	       fabric_2x3$v_to_slaves_0_awburst,
	       fabric_2x3$v_to_slaves_0_bresp,
	       fabric_2x3$v_to_slaves_0_rresp,
	       fabric_2x3$v_to_slaves_1_arburst,
	       fabric_2x3$v_to_slaves_1_awburst,
	       fabric_2x3$v_to_slaves_1_bresp,
	       fabric_2x3$v_to_slaves_1_rresp,
	       fabric_2x3$v_to_slaves_2_arburst,
	       fabric_2x3$v_to_slaves_2_awburst,
	       fabric_2x3$v_to_slaves_2_bresp,
	       fabric_2x3$v_to_slaves_2_rresp;
  wire fabric_2x3$EN_reset,
       fabric_2x3$EN_set_verbosity,
       fabric_2x3$RDY_reset,
       fabric_2x3$v_from_masters_0_arlock,
       fabric_2x3$v_from_masters_0_arready,
       fabric_2x3$v_from_masters_0_arvalid,
       fabric_2x3$v_from_masters_0_awlock,
       fabric_2x3$v_from_masters_0_awready,
       fabric_2x3$v_from_masters_0_awvalid,
       fabric_2x3$v_from_masters_0_bready,
       fabric_2x3$v_from_masters_0_bvalid,
       fabric_2x3$v_from_masters_0_rlast,
       fabric_2x3$v_from_masters_0_rready,
       fabric_2x3$v_from_masters_0_rvalid,
       fabric_2x3$v_from_masters_0_wlast,
       fabric_2x3$v_from_masters_0_wready,
       fabric_2x3$v_from_masters_0_wvalid,
       fabric_2x3$v_from_masters_1_arlock,
       fabric_2x3$v_from_masters_1_arvalid,
       fabric_2x3$v_from_masters_1_awlock,
       fabric_2x3$v_from_masters_1_awvalid,
       fabric_2x3$v_from_masters_1_bready,
       fabric_2x3$v_from_masters_1_rready,
       fabric_2x3$v_from_masters_1_wlast,
       fabric_2x3$v_from_masters_1_wvalid,
       fabric_2x3$v_to_slaves_0_arlock,
       fabric_2x3$v_to_slaves_0_arready,
       fabric_2x3$v_to_slaves_0_arvalid,
       fabric_2x3$v_to_slaves_0_awlock,
       fabric_2x3$v_to_slaves_0_awready,
       fabric_2x3$v_to_slaves_0_awvalid,
       fabric_2x3$v_to_slaves_0_bready,
       fabric_2x3$v_to_slaves_0_bvalid,
       fabric_2x3$v_to_slaves_0_rlast,
       fabric_2x3$v_to_slaves_0_rready,
       fabric_2x3$v_to_slaves_0_rvalid,
       fabric_2x3$v_to_slaves_0_wlast,
       fabric_2x3$v_to_slaves_0_wready,
       fabric_2x3$v_to_slaves_0_wvalid,
       fabric_2x3$v_to_slaves_1_arlock,
       fabric_2x3$v_to_slaves_1_arready,
       fabric_2x3$v_to_slaves_1_arvalid,
       fabric_2x3$v_to_slaves_1_awlock,
       fabric_2x3$v_to_slaves_1_awready,
       fabric_2x3$v_to_slaves_1_awvalid,
       fabric_2x3$v_to_slaves_1_bready,
       fabric_2x3$v_to_slaves_1_bvalid,
       fabric_2x3$v_to_slaves_1_rlast,
       fabric_2x3$v_to_slaves_1_rready,
       fabric_2x3$v_to_slaves_1_rvalid,
       fabric_2x3$v_to_slaves_1_wlast,
       fabric_2x3$v_to_slaves_1_wready,
       fabric_2x3$v_to_slaves_1_wvalid,
       fabric_2x3$v_to_slaves_2_arlock,
       fabric_2x3$v_to_slaves_2_arready,
       fabric_2x3$v_to_slaves_2_arvalid,
       fabric_2x3$v_to_slaves_2_awlock,
       fabric_2x3$v_to_slaves_2_awready,
       fabric_2x3$v_to_slaves_2_awvalid,
       fabric_2x3$v_to_slaves_2_bready,
       fabric_2x3$v_to_slaves_2_bvalid,
       fabric_2x3$v_to_slaves_2_rlast,
       fabric_2x3$v_to_slaves_2_rready,
       fabric_2x3$v_to_slaves_2_rvalid,
       fabric_2x3$v_to_slaves_2_wlast,
       fabric_2x3$v_to_slaves_2_wready,
       fabric_2x3$v_to_slaves_2_wvalid;
  // ports of submodule near_mem_io
  wire [63 : 0] near_mem_io$axi4_slave_araddr,
		near_mem_io$axi4_slave_awaddr,
		near_mem_io$axi4_slave_rdata,
		near_mem_io$axi4_slave_wdata,
		near_mem_io$set_addr_map_addr_base,
		near_mem_io$set_addr_map_addr_lim;
  wire [7 : 0] near_mem_io$axi4_slave_arlen,
	       near_mem_io$axi4_slave_awlen,
	       near_mem_io$axi4_slave_wstrb;
  wire [3 : 0] near_mem_io$axi4_slave_arcache,
	       near_mem_io$axi4_slave_arid,
	       near_mem_io$axi4_slave_arqos,
	       near_mem_io$axi4_slave_arregion,
	       near_mem_io$axi4_slave_awcache,
	       near_mem_io$axi4_slave_awid,
	       near_mem_io$axi4_slave_awqos,
	       near_mem_io$axi4_slave_awregion,
	       near_mem_io$axi4_slave_bid,
	       near_mem_io$axi4_slave_rid;
  wire [2 : 0] near_mem_io$axi4_slave_arprot,
	       near_mem_io$axi4_slave_arsize,
	       near_mem_io$axi4_slave_awprot,
	       near_mem_io$axi4_slave_awsize;
  wire [1 : 0] near_mem_io$axi4_slave_arburst,
	       near_mem_io$axi4_slave_awburst,
	       near_mem_io$axi4_slave_bresp,
	       near_mem_io$axi4_slave_rresp;
  wire near_mem_io$EN_get_sw_interrupt_req_get,
       near_mem_io$EN_get_timer_interrupt_req_get,
       near_mem_io$EN_server_reset_request_put,
       near_mem_io$EN_server_reset_response_get,
       near_mem_io$EN_set_addr_map,
       near_mem_io$RDY_get_sw_interrupt_req_get,
       near_mem_io$RDY_get_timer_interrupt_req_get,
       near_mem_io$RDY_server_reset_request_put,
       near_mem_io$RDY_server_reset_response_get,
       near_mem_io$axi4_slave_arlock,
       near_mem_io$axi4_slave_arready,
       near_mem_io$axi4_slave_arvalid,
       near_mem_io$axi4_slave_awlock,
       near_mem_io$axi4_slave_awready,
       near_mem_io$axi4_slave_awvalid,
       near_mem_io$axi4_slave_bready,
       near_mem_io$axi4_slave_bvalid,
       near_mem_io$axi4_slave_rlast,
       near_mem_io$axi4_slave_rready,
       near_mem_io$axi4_slave_rvalid,
       near_mem_io$axi4_slave_wlast,
       near_mem_io$axi4_slave_wready,
       near_mem_io$axi4_slave_wvalid,
       near_mem_io$get_sw_interrupt_req_get,
       near_mem_io$get_timer_interrupt_req_get;
  // ports of submodule plic
  wire [63 : 0] plic$axi4_slave_araddr,
		plic$axi4_slave_awaddr,
		plic$axi4_slave_rdata,
		plic$axi4_slave_wdata,
		plic$set_addr_map_addr_base,
		plic$set_addr_map_addr_lim;
  wire [7 : 0] plic$axi4_slave_arlen,
	       plic$axi4_slave_awlen,
	       plic$axi4_slave_wstrb;
  wire [3 : 0] plic$axi4_slave_arcache,
	       plic$axi4_slave_arid,
	       plic$axi4_slave_arqos,
	       plic$axi4_slave_arregion,
	       plic$axi4_slave_awcache,
	       plic$axi4_slave_awid,
	       plic$axi4_slave_awqos,
	       plic$axi4_slave_awregion,
	       plic$axi4_slave_bid,
	       plic$axi4_slave_rid,
	       plic$set_verbosity_verbosity;
  wire [2 : 0] plic$axi4_slave_arprot,
	       plic$axi4_slave_arsize,
	       plic$axi4_slave_awprot,
	       plic$axi4_slave_awsize;
  wire [1 : 0] plic$axi4_slave_arburst,
	       plic$axi4_slave_awburst,
	       plic$axi4_slave_bresp,
	       plic$axi4_slave_rresp;
  wire plic$EN_server_reset_request_put,
       plic$EN_server_reset_response_get,
       plic$EN_set_addr_map,
       plic$EN_set_verbosity,
       plic$EN_show_PLIC_state,
       plic$RDY_server_reset_request_put,
       plic$RDY_server_reset_response_get,
       plic$axi4_slave_arlock,
       plic$axi4_slave_arready,
       plic$axi4_slave_arvalid,
       plic$axi4_slave_awlock,
       plic$axi4_slave_awready,
       plic$axi4_slave_awvalid,
       plic$axi4_slave_bready,
       plic$axi4_slave_bvalid,
       plic$axi4_slave_rlast,
       plic$axi4_slave_rready,
       plic$axi4_slave_rvalid,
       plic$axi4_slave_wlast,
       plic$axi4_slave_wready,
       plic$axi4_slave_wvalid,
       plic$v_sources_0_m_interrupt_req_set_not_clear,
       plic$v_sources_10_m_interrupt_req_set_not_clear,
       plic$v_sources_11_m_interrupt_req_set_not_clear,
       plic$v_sources_12_m_interrupt_req_set_not_clear,
       plic$v_sources_13_m_interrupt_req_set_not_clear,
       plic$v_sources_14_m_interrupt_req_set_not_clear,
       plic$v_sources_15_m_interrupt_req_set_not_clear,
       plic$v_sources_1_m_interrupt_req_set_not_clear,
       plic$v_sources_2_m_interrupt_req_set_not_clear,
       plic$v_sources_3_m_interrupt_req_set_not_clear,
       plic$v_sources_4_m_interrupt_req_set_not_clear,
       plic$v_sources_5_m_interrupt_req_set_not_clear,
       plic$v_sources_6_m_interrupt_req_set_not_clear,
       plic$v_sources_7_m_interrupt_req_set_not_clear,
       plic$v_sources_8_m_interrupt_req_set_not_clear,
       plic$v_sources_9_m_interrupt_req_set_not_clear,
       plic$v_targets_0_m_eip,
       plic$v_targets_1_m_eip;
  // ports of submodule soc_map
  wire [63 : 0] soc_map$m_is_IO_addr_addr,
		soc_map$m_is_mem_addr_addr,
		soc_map$m_is_near_mem_IO_addr_addr,
		soc_map$m_near_mem_io_addr_base,
		soc_map$m_near_mem_io_addr_lim,
		soc_map$m_plic_addr_base,
		soc_map$m_plic_addr_lim;
  // rule scheduling signals
  wire CAN_FIRE_RL_rl_cpu_hart0_reset_complete,
       CAN_FIRE_RL_rl_cpu_hart0_reset_from_soc_start,
       CAN_FIRE_RL_rl_rd_addr_channel,
       CAN_FIRE_RL_rl_rd_addr_channel_1,
       CAN_FIRE_RL_rl_rd_addr_channel_2,
       CAN_FIRE_RL_rl_rd_addr_channel_3,
       CAN_FIRE_RL_rl_rd_data_channel,
       CAN_FIRE_RL_rl_rd_data_channel_1,
       CAN_FIRE_RL_rl_rd_data_channel_2,
       CAN_FIRE_RL_rl_rd_data_channel_3,
       CAN_FIRE_RL_rl_relay_external_interrupts,
       CAN_FIRE_RL_rl_relay_sw_interrupts,
       CAN_FIRE_RL_rl_relay_timer_interrupts,
       CAN_FIRE_RL_rl_wr_addr_channel,
       CAN_FIRE_RL_rl_wr_addr_channel_1,
       CAN_FIRE_RL_rl_wr_addr_channel_2,
       CAN_FIRE_RL_rl_wr_addr_channel_3,
       CAN_FIRE_RL_rl_wr_data_channel,
       CAN_FIRE_RL_rl_wr_data_channel_1,
       CAN_FIRE_RL_rl_wr_data_channel_2,
       CAN_FIRE_RL_rl_wr_data_channel_3,
       CAN_FIRE_RL_rl_wr_response_channel,
       CAN_FIRE_RL_rl_wr_response_channel_1,
       CAN_FIRE_RL_rl_wr_response_channel_2,
       CAN_FIRE_RL_rl_wr_response_channel_3,
       CAN_FIRE_core_external_interrupt_sources_0_m_interrupt_req,
       CAN_FIRE_core_external_interrupt_sources_10_m_interrupt_req,
       CAN_FIRE_core_external_interrupt_sources_11_m_interrupt_req,
       CAN_FIRE_core_external_interrupt_sources_12_m_interrupt_req,
       CAN_FIRE_core_external_interrupt_sources_13_m_interrupt_req,
       CAN_FIRE_core_external_interrupt_sources_14_m_interrupt_req,
       CAN_FIRE_core_external_interrupt_sources_15_m_interrupt_req,
       CAN_FIRE_core_external_interrupt_sources_1_m_interrupt_req,
       CAN_FIRE_core_external_interrupt_sources_2_m_interrupt_req,
       CAN_FIRE_core_external_interrupt_sources_3_m_interrupt_req,
       CAN_FIRE_core_external_interrupt_sources_4_m_interrupt_req,
       CAN_FIRE_core_external_interrupt_sources_5_m_interrupt_req,
       CAN_FIRE_core_external_interrupt_sources_6_m_interrupt_req,
       CAN_FIRE_core_external_interrupt_sources_7_m_interrupt_req,
       CAN_FIRE_core_external_interrupt_sources_8_m_interrupt_req,
       CAN_FIRE_core_external_interrupt_sources_9_m_interrupt_req,
       CAN_FIRE_cpu_dmem_master_m_arready,
       CAN_FIRE_cpu_dmem_master_m_awready,
       CAN_FIRE_cpu_dmem_master_m_bvalid,
       CAN_FIRE_cpu_dmem_master_m_rvalid,
       CAN_FIRE_cpu_dmem_master_m_wready,
       CAN_FIRE_cpu_imem_master_m_arready,
       CAN_FIRE_cpu_imem_master_m_awready,
       CAN_FIRE_cpu_imem_master_m_bvalid,
       CAN_FIRE_cpu_imem_master_m_rvalid,
       CAN_FIRE_cpu_imem_master_m_wready,
       CAN_FIRE_cpu_reset_server_request_put,
       CAN_FIRE_cpu_reset_server_response_get,
       CAN_FIRE_nmi_req,
       CAN_FIRE_set_verbosity,
       CAN_FIRE_set_watch_tohost,
       WILL_FIRE_RL_rl_cpu_hart0_reset_complete,
       WILL_FIRE_RL_rl_cpu_hart0_reset_from_soc_start,
       WILL_FIRE_RL_rl_rd_addr_channel,
       WILL_FIRE_RL_rl_rd_addr_channel_1,
       WILL_FIRE_RL_rl_rd_addr_channel_2,
       WILL_FIRE_RL_rl_rd_addr_channel_3,
       WILL_FIRE_RL_rl_rd_data_channel,
       WILL_FIRE_RL_rl_rd_data_channel_1,
       WILL_FIRE_RL_rl_rd_data_channel_2,
       WILL_FIRE_RL_rl_rd_data_channel_3,
       WILL_FIRE_RL_rl_relay_external_interrupts,
       WILL_FIRE_RL_rl_relay_sw_interrupts,
       WILL_FIRE_RL_rl_relay_timer_interrupts,
       WILL_FIRE_RL_rl_wr_addr_channel,
       WILL_FIRE_RL_rl_wr_addr_channel_1,
       WILL_FIRE_RL_rl_wr_addr_channel_2,
       WILL_FIRE_RL_rl_wr_addr_channel_3,
       WILL_FIRE_RL_rl_wr_data_channel,
       WILL_FIRE_RL_rl_wr_data_channel_1,
       WILL_FIRE_RL_rl_wr_data_channel_2,
       WILL_FIRE_RL_rl_wr_data_channel_3,
       WILL_FIRE_RL_rl_wr_response_channel,
       WILL_FIRE_RL_rl_wr_response_channel_1,
       WILL_FIRE_RL_rl_wr_response_channel_2,
       WILL_FIRE_RL_rl_wr_response_channel_3,
       WILL_FIRE_core_external_interrupt_sources_0_m_interrupt_req,
       WILL_FIRE_core_external_interrupt_sources_10_m_interrupt_req,
       WILL_FIRE_core_external_interrupt_sources_11_m_interrupt_req,
       WILL_FIRE_core_external_interrupt_sources_12_m_interrupt_req,
       WILL_FIRE_core_external_interrupt_sources_13_m_interrupt_req,
       WILL_FIRE_core_external_interrupt_sources_14_m_interrupt_req,
       WILL_FIRE_core_external_interrupt_sources_15_m_interrupt_req,
       WILL_FIRE_core_external_interrupt_sources_1_m_interrupt_req,
       WILL_FIRE_core_external_interrupt_sources_2_m_interrupt_req,
       WILL_FIRE_core_external_interrupt_sources_3_m_interrupt_req,
       WILL_FIRE_core_external_interrupt_sources_4_m_interrupt_req,
       WILL_FIRE_core_external_interrupt_sources_5_m_interrupt_req,
       WILL_FIRE_core_external_interrupt_sources_6_m_interrupt_req,
       WILL_FIRE_core_external_interrupt_sources_7_m_interrupt_req,
       WILL_FIRE_core_external_interrupt_sources_8_m_interrupt_req,
       WILL_FIRE_core_external_interrupt_sources_9_m_interrupt_req,
       WILL_FIRE_cpu_dmem_master_m_arready,
       WILL_FIRE_cpu_dmem_master_m_awready,
       WILL_FIRE_cpu_dmem_master_m_bvalid,
       WILL_FIRE_cpu_dmem_master_m_rvalid,
       WILL_FIRE_cpu_dmem_master_m_wready,
       WILL_FIRE_cpu_imem_master_m_arready,
       WILL_FIRE_cpu_imem_master_m_awready,
       WILL_FIRE_cpu_imem_master_m_bvalid,
       WILL_FIRE_cpu_imem_master_m_rvalid,
       WILL_FIRE_cpu_imem_master_m_wready,
       WILL_FIRE_cpu_reset_server_request_put,
       WILL_FIRE_cpu_reset_server_response_get,
       WILL_FIRE_nmi_req,
       WILL_FIRE_set_verbosity,
       WILL_FIRE_set_watch_tohost;
  // declarations used by system tasks
  // synopsys translate_off
  reg [31 : 0] v__h4255;
  reg [31 : 0] v__h4496;
  reg [31 : 0] v__h4249;
  reg [31 : 0] v__h4490;
  // synopsys translate_on
  // remaining internal signals
  wire plic_RDY_server_reset_request_put_AND_fabric_2_ETC___d8;
  // action method set_verbosity
  assign RDY_set_verbosity = 1'd1 ;
  assign CAN_FIRE_set_verbosity = 1'd1 ;
  assign WILL_FIRE_set_verbosity = EN_set_verbosity ;
  // action method cpu_reset_server_request_put
  assign RDY_cpu_reset_server_request_put = f_reset_reqs$FULL_N ;
  assign CAN_FIRE_cpu_reset_server_request_put = f_reset_reqs$FULL_N ;
  assign WILL_FIRE_cpu_reset_server_request_put =
	     EN_cpu_reset_server_request_put ;
  // actionvalue method cpu_reset_server_response_get
  assign cpu_reset_server_response_get = f_reset_rsps$D_OUT ;
  assign RDY_cpu_reset_server_response_get = f_reset_rsps$EMPTY_N ;
  assign CAN_FIRE_cpu_reset_server_response_get = f_reset_rsps$EMPTY_N ;
  assign WILL_FIRE_cpu_reset_server_response_get =
	     EN_cpu_reset_server_response_get ;
  // value method cpu_imem_master_m_awvalid
  assign cpu_imem_master_awvalid = cpu$imem_master_awvalid ;
  // value method cpu_imem_master_m_awid
  assign cpu_imem_master_awid = cpu$imem_master_awid ;
  // value method cpu_imem_master_m_awaddr
  assign cpu_imem_master_awaddr = cpu$imem_master_awaddr ;
  // value method cpu_imem_master_m_awlen
  assign cpu_imem_master_awlen = cpu$imem_master_awlen ;
  // value method cpu_imem_master_m_awsize
  assign cpu_imem_master_awsize = cpu$imem_master_awsize ;
  // value method cpu_imem_master_m_awburst
  assign cpu_imem_master_awburst = cpu$imem_master_awburst ;
  // value method cpu_imem_master_m_awlock
  assign cpu_imem_master_awlock = cpu$imem_master_awlock ;
  // value method cpu_imem_master_m_awcache
  assign cpu_imem_master_awcache = cpu$imem_master_awcache ;
  // value method cpu_imem_master_m_awprot
  assign cpu_imem_master_awprot = cpu$imem_master_awprot ;
  // value method cpu_imem_master_m_awqos
  assign cpu_imem_master_awqos = cpu$imem_master_awqos ;
  // value method cpu_imem_master_m_awregion
  assign cpu_imem_master_awregion = cpu$imem_master_awregion ;
  // action method cpu_imem_master_m_awready
  assign CAN_FIRE_cpu_imem_master_m_awready = 1'd1 ;
  assign WILL_FIRE_cpu_imem_master_m_awready = 1'd1 ;
  // value method cpu_imem_master_m_wvalid
  assign cpu_imem_master_wvalid = cpu$imem_master_wvalid ;
  // value method cpu_imem_master_m_wdata
  assign cpu_imem_master_wdata = cpu$imem_master_wdata ;
  // value method cpu_imem_master_m_wstrb
  assign cpu_imem_master_wstrb = cpu$imem_master_wstrb ;
  // value method cpu_imem_master_m_wlast
  assign cpu_imem_master_wlast = cpu$imem_master_wlast ;
  // action method cpu_imem_master_m_wready
  assign CAN_FIRE_cpu_imem_master_m_wready = 1'd1 ;
  assign WILL_FIRE_cpu_imem_master_m_wready = 1'd1 ;
  // action method cpu_imem_master_m_bvalid
  assign CAN_FIRE_cpu_imem_master_m_bvalid = 1'd1 ;
  assign WILL_FIRE_cpu_imem_master_m_bvalid = 1'd1 ;
  // value method cpu_imem_master_m_bready
  assign cpu_imem_master_bready = cpu$imem_master_bready ;
  // value method cpu_imem_master_m_arvalid
  assign cpu_imem_master_arvalid = cpu$imem_master_arvalid ;
  // value method cpu_imem_master_m_arid
  assign cpu_imem_master_arid = cpu$imem_master_arid ;
  // value method cpu_imem_master_m_araddr
  assign cpu_imem_master_araddr = cpu$imem_master_araddr ;
  // value method cpu_imem_master_m_arlen
  assign cpu_imem_master_arlen = cpu$imem_master_arlen ;
  // value method cpu_imem_master_m_arsize
  assign cpu_imem_master_arsize = cpu$imem_master_arsize ;
  // value method cpu_imem_master_m_arburst
  assign cpu_imem_master_arburst = cpu$imem_master_arburst ;
  // value method cpu_imem_master_m_arlock
  assign cpu_imem_master_arlock = cpu$imem_master_arlock ;
  // value method cpu_imem_master_m_arcache
  assign cpu_imem_master_arcache = cpu$imem_master_arcache ;
  // value method cpu_imem_master_m_arprot
  assign cpu_imem_master_arprot = cpu$imem_master_arprot ;
  // value method cpu_imem_master_m_arqos
  assign cpu_imem_master_arqos = cpu$imem_master_arqos ;
  // value method cpu_imem_master_m_arregion
  assign cpu_imem_master_arregion = cpu$imem_master_arregion ;
  // action method cpu_imem_master_m_arready
  assign CAN_FIRE_cpu_imem_master_m_arready = 1'd1 ;
  assign WILL_FIRE_cpu_imem_master_m_arready = 1'd1 ;
  // action method cpu_imem_master_m_rvalid
  assign CAN_FIRE_cpu_imem_master_m_rvalid = 1'd1 ;
  assign WILL_FIRE_cpu_imem_master_m_rvalid = 1'd1 ;
  // value method cpu_imem_master_m_rready
  assign cpu_imem_master_rready = cpu$imem_master_rready ;
  // value method cpu_dmem_master_m_awvalid
  assign cpu_dmem_master_awvalid = fabric_2x3$v_to_slaves_0_awvalid ;
  // value method cpu_dmem_master_m_awid
  assign cpu_dmem_master_awid = fabric_2x3$v_to_slaves_0_awid ;
  // value method cpu_dmem_master_m_awaddr
  assign cpu_dmem_master_awaddr = fabric_2x3$v_to_slaves_0_awaddr ;
  // value method cpu_dmem_master_m_awlen
  assign cpu_dmem_master_awlen = fabric_2x3$v_to_slaves_0_awlen ;
  // value method cpu_dmem_master_m_awsize
  assign cpu_dmem_master_awsize = fabric_2x3$v_to_slaves_0_awsize ;
  // value method cpu_dmem_master_m_awburst
  assign cpu_dmem_master_awburst = fabric_2x3$v_to_slaves_0_awburst ;
  // value method cpu_dmem_master_m_awlock
  assign cpu_dmem_master_awlock = fabric_2x3$v_to_slaves_0_awlock ;
  // value method cpu_dmem_master_m_awcache
  assign cpu_dmem_master_awcache = fabric_2x3$v_to_slaves_0_awcache ;
  // value method cpu_dmem_master_m_awprot
  assign cpu_dmem_master_awprot = fabric_2x3$v_to_slaves_0_awprot ;
  // value method cpu_dmem_master_m_awqos
  assign cpu_dmem_master_awqos = fabric_2x3$v_to_slaves_0_awqos ;
  // value method cpu_dmem_master_m_awregion
  assign cpu_dmem_master_awregion = fabric_2x3$v_to_slaves_0_awregion ;
  // action method cpu_dmem_master_m_awready
  assign CAN_FIRE_cpu_dmem_master_m_awready = 1'd1 ;
  assign WILL_FIRE_cpu_dmem_master_m_awready = 1'd1 ;
  // value method cpu_dmem_master_m_wvalid
  assign cpu_dmem_master_wvalid = fabric_2x3$v_to_slaves_0_wvalid ;
  // value method cpu_dmem_master_m_wdata
  assign cpu_dmem_master_wdata = fabric_2x3$v_to_slaves_0_wdata ;
  // value method cpu_dmem_master_m_wstrb
  assign cpu_dmem_master_wstrb = fabric_2x3$v_to_slaves_0_wstrb ;
  // value method cpu_dmem_master_m_wlast
  assign cpu_dmem_master_wlast = fabric_2x3$v_to_slaves_0_wlast ;
  // action method cpu_dmem_master_m_wready
  assign CAN_FIRE_cpu_dmem_master_m_wready = 1'd1 ;
  assign WILL_FIRE_cpu_dmem_master_m_wready = 1'd1 ;
  // action method cpu_dmem_master_m_bvalid
  assign CAN_FIRE_cpu_dmem_master_m_bvalid = 1'd1 ;
  assign WILL_FIRE_cpu_dmem_master_m_bvalid = 1'd1 ;
  // value method cpu_dmem_master_m_bready
  assign cpu_dmem_master_bready = fabric_2x3$v_to_slaves_0_bready ;
  // value method cpu_dmem_master_m_arvalid
  assign cpu_dmem_master_arvalid = fabric_2x3$v_to_slaves_0_arvalid ;
  // value method cpu_dmem_master_m_arid
  assign cpu_dmem_master_arid = fabric_2x3$v_to_slaves_0_arid ;
  // value method cpu_dmem_master_m_araddr
  assign cpu_dmem_master_araddr = fabric_2x3$v_to_slaves_0_araddr ;
  // value method cpu_dmem_master_m_arlen
  assign cpu_dmem_master_arlen = fabric_2x3$v_to_slaves_0_arlen ;
  // value method cpu_dmem_master_m_arsize
  assign cpu_dmem_master_arsize = fabric_2x3$v_to_slaves_0_arsize ;
  // value method cpu_dmem_master_m_arburst
  assign cpu_dmem_master_arburst = fabric_2x3$v_to_slaves_0_arburst ;
  // value method cpu_dmem_master_m_arlock
  assign cpu_dmem_master_arlock = fabric_2x3$v_to_slaves_0_arlock ;
  // value method cpu_dmem_master_m_arcache
  assign cpu_dmem_master_arcache = fabric_2x3$v_to_slaves_0_arcache ;
  // value method cpu_dmem_master_m_arprot
  assign cpu_dmem_master_arprot = fabric_2x3$v_to_slaves_0_arprot ;
  // value method cpu_dmem_master_m_arqos
  assign cpu_dmem_master_arqos = fabric_2x3$v_to_slaves_0_arqos ;
  // value method cpu_dmem_master_m_arregion
  assign cpu_dmem_master_arregion = fabric_2x3$v_to_slaves_0_arregion ;
  // action method cpu_dmem_master_m_arready
  assign CAN_FIRE_cpu_dmem_master_m_arready = 1'd1 ;
  assign WILL_FIRE_cpu_dmem_master_m_arready = 1'd1 ;
  // action method cpu_dmem_master_m_rvalid
  assign CAN_FIRE_cpu_dmem_master_m_rvalid = 1'd1 ;
  assign WILL_FIRE_cpu_dmem_master_m_rvalid = 1'd1 ;
  // value method cpu_dmem_master_m_rready
  assign cpu_dmem_master_rready = fabric_2x3$v_to_slaves_0_rready ;
  // action method core_external_interrupt_sources_0_m_interrupt_req
  assign CAN_FIRE_core_external_interrupt_sources_0_m_interrupt_req = 1'd1 ;
  assign WILL_FIRE_core_external_interrupt_sources_0_m_interrupt_req = 1'd1 ;
  // action method core_external_interrupt_sources_1_m_interrupt_req
  assign CAN_FIRE_core_external_interrupt_sources_1_m_interrupt_req = 1'd1 ;
  assign WILL_FIRE_core_external_interrupt_sources_1_m_interrupt_req = 1'd1 ;
  // action method core_external_interrupt_sources_2_m_interrupt_req
  assign CAN_FIRE_core_external_interrupt_sources_2_m_interrupt_req = 1'd1 ;
  assign WILL_FIRE_core_external_interrupt_sources_2_m_interrupt_req = 1'd1 ;
  // action method core_external_interrupt_sources_3_m_interrupt_req
  assign CAN_FIRE_core_external_interrupt_sources_3_m_interrupt_req = 1'd1 ;
  assign WILL_FIRE_core_external_interrupt_sources_3_m_interrupt_req = 1'd1 ;
  // action method core_external_interrupt_sources_4_m_interrupt_req
  assign CAN_FIRE_core_external_interrupt_sources_4_m_interrupt_req = 1'd1 ;
  assign WILL_FIRE_core_external_interrupt_sources_4_m_interrupt_req = 1'd1 ;
  // action method core_external_interrupt_sources_5_m_interrupt_req
  assign CAN_FIRE_core_external_interrupt_sources_5_m_interrupt_req = 1'd1 ;
  assign WILL_FIRE_core_external_interrupt_sources_5_m_interrupt_req = 1'd1 ;
  // action method core_external_interrupt_sources_6_m_interrupt_req
  assign CAN_FIRE_core_external_interrupt_sources_6_m_interrupt_req = 1'd1 ;
  assign WILL_FIRE_core_external_interrupt_sources_6_m_interrupt_req = 1'd1 ;
  // action method core_external_interrupt_sources_7_m_interrupt_req
  assign CAN_FIRE_core_external_interrupt_sources_7_m_interrupt_req = 1'd1 ;
  assign WILL_FIRE_core_external_interrupt_sources_7_m_interrupt_req = 1'd1 ;
  // action method core_external_interrupt_sources_8_m_interrupt_req
  assign CAN_FIRE_core_external_interrupt_sources_8_m_interrupt_req = 1'd1 ;
  assign WILL_FIRE_core_external_interrupt_sources_8_m_interrupt_req = 1'd1 ;
  // action method core_external_interrupt_sources_9_m_interrupt_req
  assign CAN_FIRE_core_external_interrupt_sources_9_m_interrupt_req = 1'd1 ;
  assign WILL_FIRE_core_external_interrupt_sources_9_m_interrupt_req = 1'd1 ;
  // action method core_external_interrupt_sources_10_m_interrupt_req
  assign CAN_FIRE_core_external_interrupt_sources_10_m_interrupt_req = 1'd1 ;
  assign WILL_FIRE_core_external_interrupt_sources_10_m_interrupt_req = 1'd1 ;
  // action method core_external_interrupt_sources_11_m_interrupt_req
  assign CAN_FIRE_core_external_interrupt_sources_11_m_interrupt_req = 1'd1 ;
  assign WILL_FIRE_core_external_interrupt_sources_11_m_interrupt_req = 1'd1 ;
  // action method core_external_interrupt_sources_12_m_interrupt_req
  assign CAN_FIRE_core_external_interrupt_sources_12_m_interrupt_req = 1'd1 ;
  assign WILL_FIRE_core_external_interrupt_sources_12_m_interrupt_req = 1'd1 ;
  // action method core_external_interrupt_sources_13_m_interrupt_req
  assign CAN_FIRE_core_external_interrupt_sources_13_m_interrupt_req = 1'd1 ;
  assign WILL_FIRE_core_external_interrupt_sources_13_m_interrupt_req = 1'd1 ;
  // action method core_external_interrupt_sources_14_m_interrupt_req
  assign CAN_FIRE_core_external_interrupt_sources_14_m_interrupt_req = 1'd1 ;
  assign WILL_FIRE_core_external_interrupt_sources_14_m_interrupt_req = 1'd1 ;
  // action method core_external_interrupt_sources_15_m_interrupt_req
  assign CAN_FIRE_core_external_interrupt_sources_15_m_interrupt_req = 1'd1 ;
  assign WILL_FIRE_core_external_interrupt_sources_15_m_interrupt_req = 1'd1 ;
  // action method nmi_req
  assign CAN_FIRE_nmi_req = 1'd1 ;
  assign WILL_FIRE_nmi_req = 1'd1 ;
  // action method set_watch_tohost
  assign RDY_set_watch_tohost = 1'd1 ;
  assign CAN_FIRE_set_watch_tohost = 1'd1 ;
  assign WILL_FIRE_set_watch_tohost = EN_set_watch_tohost ;
  // submodule cpu
  mkCPU cpu(.CLK(CLK),
	    .RST_N(RST_N),
	    .dmem_master_arready(cpu$dmem_master_arready),
	    .dmem_master_awready(cpu$dmem_master_awready),
	    .dmem_master_bid(cpu$dmem_master_bid),
	    .dmem_master_bresp(cpu$dmem_master_bresp),
	    .dmem_master_bvalid(cpu$dmem_master_bvalid),
	    .dmem_master_rdata(cpu$dmem_master_rdata),
	    .dmem_master_rid(cpu$dmem_master_rid),
	    .dmem_master_rlast(cpu$dmem_master_rlast),
	    .dmem_master_rresp(cpu$dmem_master_rresp),
	    .dmem_master_rvalid(cpu$dmem_master_rvalid),
	    .dmem_master_wready(cpu$dmem_master_wready),
	    .hart0_server_reset_request_put(cpu$hart0_server_reset_request_put),
	    .imem_master_arready(cpu$imem_master_arready),
	    .imem_master_awready(cpu$imem_master_awready),
	    .imem_master_bid(cpu$imem_master_bid),
	    .imem_master_bresp(cpu$imem_master_bresp),
	    .imem_master_bvalid(cpu$imem_master_bvalid),
	    .imem_master_rdata(cpu$imem_master_rdata),
	    .imem_master_rid(cpu$imem_master_rid),
	    .imem_master_rlast(cpu$imem_master_rlast),
	    .imem_master_rresp(cpu$imem_master_rresp),
	    .imem_master_rvalid(cpu$imem_master_rvalid),
	    .imem_master_wready(cpu$imem_master_wready),
	    .m_external_interrupt_req_set_not_clear(cpu$m_external_interrupt_req_set_not_clear),
	    .nmi_req_set_not_clear(cpu$nmi_req_set_not_clear),
	    .s_external_interrupt_req_set_not_clear(cpu$s_external_interrupt_req_set_not_clear),
	    .set_verbosity_logdelay(cpu$set_verbosity_logdelay),
	    .set_verbosity_verbosity(cpu$set_verbosity_verbosity),
	    .set_watch_tohost_tohost_addr(cpu$set_watch_tohost_tohost_addr),
	    .set_watch_tohost_watch_tohost(cpu$set_watch_tohost_watch_tohost),
	    .software_interrupt_req_set_not_clear(cpu$software_interrupt_req_set_not_clear),
	    .timer_interrupt_req_set_not_clear(cpu$timer_interrupt_req_set_not_clear),
	    .EN_hart0_server_reset_request_put(cpu$EN_hart0_server_reset_request_put),
	    .EN_hart0_server_reset_response_get(cpu$EN_hart0_server_reset_response_get),
	    .EN_set_verbosity(cpu$EN_set_verbosity),
	    .EN_set_watch_tohost(cpu$EN_set_watch_tohost),
	    .RDY_hart0_server_reset_request_put(cpu$RDY_hart0_server_reset_request_put),
	    .hart0_server_reset_response_get(cpu$hart0_server_reset_response_get),
	    .RDY_hart0_server_reset_response_get(cpu$RDY_hart0_server_reset_response_get),
	    .imem_master_awvalid(cpu$imem_master_awvalid),
	    .imem_master_awid(cpu$imem_master_awid),
	    .imem_master_awaddr(cpu$imem_master_awaddr),
	    .imem_master_awlen(cpu$imem_master_awlen),
	    .imem_master_awsize(cpu$imem_master_awsize),
	    .imem_master_awburst(cpu$imem_master_awburst),
	    .imem_master_awlock(cpu$imem_master_awlock),
	    .imem_master_awcache(cpu$imem_master_awcache),
	    .imem_master_awprot(cpu$imem_master_awprot),
	    .imem_master_awqos(cpu$imem_master_awqos),
	    .imem_master_awregion(cpu$imem_master_awregion),
	    .imem_master_wvalid(cpu$imem_master_wvalid),
	    .imem_master_wdata(cpu$imem_master_wdata),
	    .imem_master_wstrb(cpu$imem_master_wstrb),
	    .imem_master_wlast(cpu$imem_master_wlast),
	    .imem_master_bready(cpu$imem_master_bready),
	    .imem_master_arvalid(cpu$imem_master_arvalid),
	    .imem_master_arid(cpu$imem_master_arid),
	    .imem_master_araddr(cpu$imem_master_araddr),
	    .imem_master_arlen(cpu$imem_master_arlen),
	    .imem_master_arsize(cpu$imem_master_arsize),
	    .imem_master_arburst(cpu$imem_master_arburst),
	    .imem_master_arlock(cpu$imem_master_arlock),
	    .imem_master_arcache(cpu$imem_master_arcache),
	    .imem_master_arprot(cpu$imem_master_arprot),
	    .imem_master_arqos(cpu$imem_master_arqos),
	    .imem_master_arregion(cpu$imem_master_arregion),
	    .imem_master_rready(cpu$imem_master_rready),
	    .dmem_master_awvalid(cpu$dmem_master_awvalid),
	    .dmem_master_awid(cpu$dmem_master_awid),
	    .dmem_master_awaddr(cpu$dmem_master_awaddr),
	    .dmem_master_awlen(cpu$dmem_master_awlen),
	    .dmem_master_awsize(cpu$dmem_master_awsize),
	    .dmem_master_awburst(cpu$dmem_master_awburst),
	    .dmem_master_awlock(cpu$dmem_master_awlock),
	    .dmem_master_awcache(cpu$dmem_master_awcache),
	    .dmem_master_awprot(cpu$dmem_master_awprot),
	    .dmem_master_awqos(cpu$dmem_master_awqos),
	    .dmem_master_awregion(cpu$dmem_master_awregion),
	    .dmem_master_wvalid(cpu$dmem_master_wvalid),
	    .dmem_master_wdata(cpu$dmem_master_wdata),
	    .dmem_master_wstrb(cpu$dmem_master_wstrb),
	    .dmem_master_wlast(cpu$dmem_master_wlast),
	    .dmem_master_bready(cpu$dmem_master_bready),
	    .dmem_master_arvalid(cpu$dmem_master_arvalid),
	    .dmem_master_arid(cpu$dmem_master_arid),
	    .dmem_master_araddr(cpu$dmem_master_araddr),
	    .dmem_master_arlen(cpu$dmem_master_arlen),
	    .dmem_master_arsize(cpu$dmem_master_arsize),
	    .dmem_master_arburst(cpu$dmem_master_arburst),
	    .dmem_master_arlock(cpu$dmem_master_arlock),
	    .dmem_master_arcache(cpu$dmem_master_arcache),
	    .dmem_master_arprot(cpu$dmem_master_arprot),
	    .dmem_master_arqos(cpu$dmem_master_arqos),
	    .dmem_master_arregion(cpu$dmem_master_arregion),
	    .dmem_master_rready(cpu$dmem_master_rready),
	    .RDY_set_verbosity(),
	    .RDY_set_watch_tohost());
  // submodule f_reset_reqs
  FIFO2 #(.width(32'd1), .guarded(32'd1)) f_reset_reqs(.RST(RST_N),
						       .CLK(CLK),
						       .D_IN(f_reset_reqs$D_IN),
						       .ENQ(f_reset_reqs$ENQ),
						       .DEQ(f_reset_reqs$DEQ),
						       .CLR(f_reset_reqs$CLR),
						       .D_OUT(f_reset_reqs$D_OUT),
						       .FULL_N(f_reset_reqs$FULL_N),
						       .EMPTY_N(f_reset_reqs$EMPTY_N));
  // submodule f_reset_rsps
  FIFO2 #(.width(32'd1), .guarded(32'd1)) f_reset_rsps(.RST(RST_N),
						       .CLK(CLK),
						       .D_IN(f_reset_rsps$D_IN),
						       .ENQ(f_reset_rsps$ENQ),
						       .DEQ(f_reset_rsps$DEQ),
						       .CLR(f_reset_rsps$CLR),
						       .D_OUT(f_reset_rsps$D_OUT),
						       .FULL_N(f_reset_rsps$FULL_N),
						       .EMPTY_N(f_reset_rsps$EMPTY_N));
  // submodule fabric_2x3
  mkFabric_2x3 fabric_2x3(.CLK(CLK),
			  .RST_N(RST_N),
			  .set_verbosity_verbosity(fabric_2x3$set_verbosity_verbosity),
			  .v_from_masters_0_araddr(fabric_2x3$v_from_masters_0_araddr),
			  .v_from_masters_0_arburst(fabric_2x3$v_from_masters_0_arburst),
			  .v_from_masters_0_arcache(fabric_2x3$v_from_masters_0_arcache),
			  .v_from_masters_0_arid(fabric_2x3$v_from_masters_0_arid),
			  .v_from_masters_0_arlen(fabric_2x3$v_from_masters_0_arlen),
			  .v_from_masters_0_arlock(fabric_2x3$v_from_masters_0_arlock),
			  .v_from_masters_0_arprot(fabric_2x3$v_from_masters_0_arprot),
			  .v_from_masters_0_arqos(fabric_2x3$v_from_masters_0_arqos),
			  .v_from_masters_0_arregion(fabric_2x3$v_from_masters_0_arregion),
			  .v_from_masters_0_arsize(fabric_2x3$v_from_masters_0_arsize),
			  .v_from_masters_0_arvalid(fabric_2x3$v_from_masters_0_arvalid),
			  .v_from_masters_0_awaddr(fabric_2x3$v_from_masters_0_awaddr),
			  .v_from_masters_0_awburst(fabric_2x3$v_from_masters_0_awburst),
			  .v_from_masters_0_awcache(fabric_2x3$v_from_masters_0_awcache),
			  .v_from_masters_0_awid(fabric_2x3$v_from_masters_0_awid),
			  .v_from_masters_0_awlen(fabric_2x3$v_from_masters_0_awlen),
			  .v_from_masters_0_awlock(fabric_2x3$v_from_masters_0_awlock),
			  .v_from_masters_0_awprot(fabric_2x3$v_from_masters_0_awprot),
			  .v_from_masters_0_awqos(fabric_2x3$v_from_masters_0_awqos),
			  .v_from_masters_0_awregion(fabric_2x3$v_from_masters_0_awregion),
			  .v_from_masters_0_awsize(fabric_2x3$v_from_masters_0_awsize),
			  .v_from_masters_0_awvalid(fabric_2x3$v_from_masters_0_awvalid),
			  .v_from_masters_0_bready(fabric_2x3$v_from_masters_0_bready),
			  .v_from_masters_0_rready(fabric_2x3$v_from_masters_0_rready),
			  .v_from_masters_0_wdata(fabric_2x3$v_from_masters_0_wdata),
			  .v_from_masters_0_wlast(fabric_2x3$v_from_masters_0_wlast),
			  .v_from_masters_0_wstrb(fabric_2x3$v_from_masters_0_wstrb),
			  .v_from_masters_0_wvalid(fabric_2x3$v_from_masters_0_wvalid),
			  .v_from_masters_1_araddr(fabric_2x3$v_from_masters_1_araddr),
			  .v_from_masters_1_arburst(fabric_2x3$v_from_masters_1_arburst),
			  .v_from_masters_1_arcache(fabric_2x3$v_from_masters_1_arcache),
			  .v_from_masters_1_arid(fabric_2x3$v_from_masters_1_arid),
			  .v_from_masters_1_arlen(fabric_2x3$v_from_masters_1_arlen),
			  .v_from_masters_1_arlock(fabric_2x3$v_from_masters_1_arlock),
			  .v_from_masters_1_arprot(fabric_2x3$v_from_masters_1_arprot),
			  .v_from_masters_1_arqos(fabric_2x3$v_from_masters_1_arqos),
			  .v_from_masters_1_arregion(fabric_2x3$v_from_masters_1_arregion),
			  .v_from_masters_1_arsize(fabric_2x3$v_from_masters_1_arsize),
			  .v_from_masters_1_arvalid(fabric_2x3$v_from_masters_1_arvalid),
			  .v_from_masters_1_awaddr(fabric_2x3$v_from_masters_1_awaddr),
			  .v_from_masters_1_awburst(fabric_2x3$v_from_masters_1_awburst),
			  .v_from_masters_1_awcache(fabric_2x3$v_from_masters_1_awcache),
			  .v_from_masters_1_awid(fabric_2x3$v_from_masters_1_awid),
			  .v_from_masters_1_awlen(fabric_2x3$v_from_masters_1_awlen),
			  .v_from_masters_1_awlock(fabric_2x3$v_from_masters_1_awlock),
			  .v_from_masters_1_awprot(fabric_2x3$v_from_masters_1_awprot),
			  .v_from_masters_1_awqos(fabric_2x3$v_from_masters_1_awqos),
			  .v_from_masters_1_awregion(fabric_2x3$v_from_masters_1_awregion),
			  .v_from_masters_1_awsize(fabric_2x3$v_from_masters_1_awsize),
			  .v_from_masters_1_awvalid(fabric_2x3$v_from_masters_1_awvalid),
			  .v_from_masters_1_bready(fabric_2x3$v_from_masters_1_bready),
			  .v_from_masters_1_rready(fabric_2x3$v_from_masters_1_rready),
			  .v_from_masters_1_wdata(fabric_2x3$v_from_masters_1_wdata),
			  .v_from_masters_1_wlast(fabric_2x3$v_from_masters_1_wlast),
			  .v_from_masters_1_wstrb(fabric_2x3$v_from_masters_1_wstrb),
			  .v_from_masters_1_wvalid(fabric_2x3$v_from_masters_1_wvalid),
			  .v_to_slaves_0_arready(fabric_2x3$v_to_slaves_0_arready),
			  .v_to_slaves_0_awready(fabric_2x3$v_to_slaves_0_awready),
			  .v_to_slaves_0_bid(fabric_2x3$v_to_slaves_0_bid),
			  .v_to_slaves_0_bresp(fabric_2x3$v_to_slaves_0_bresp),
			  .v_to_slaves_0_bvalid(fabric_2x3$v_to_slaves_0_bvalid),
			  .v_to_slaves_0_rdata(fabric_2x3$v_to_slaves_0_rdata),
			  .v_to_slaves_0_rid(fabric_2x3$v_to_slaves_0_rid),
			  .v_to_slaves_0_rlast(fabric_2x3$v_to_slaves_0_rlast),
			  .v_to_slaves_0_rresp(fabric_2x3$v_to_slaves_0_rresp),
			  .v_to_slaves_0_rvalid(fabric_2x3$v_to_slaves_0_rvalid),
			  .v_to_slaves_0_wready(fabric_2x3$v_to_slaves_0_wready),
			  .v_to_slaves_1_arready(fabric_2x3$v_to_slaves_1_arready),
			  .v_to_slaves_1_awready(fabric_2x3$v_to_slaves_1_awready),
			  .v_to_slaves_1_bid(fabric_2x3$v_to_slaves_1_bid),
			  .v_to_slaves_1_bresp(fabric_2x3$v_to_slaves_1_bresp),
			  .v_to_slaves_1_bvalid(fabric_2x3$v_to_slaves_1_bvalid),
			  .v_to_slaves_1_rdata(fabric_2x3$v_to_slaves_1_rdata),
			  .v_to_slaves_1_rid(fabric_2x3$v_to_slaves_1_rid),
			  .v_to_slaves_1_rlast(fabric_2x3$v_to_slaves_1_rlast),
			  .v_to_slaves_1_rresp(fabric_2x3$v_to_slaves_1_rresp),
			  .v_to_slaves_1_rvalid(fabric_2x3$v_to_slaves_1_rvalid),
			  .v_to_slaves_1_wready(fabric_2x3$v_to_slaves_1_wready),
			  .v_to_slaves_2_arready(fabric_2x3$v_to_slaves_2_arready),
			  .v_to_slaves_2_awready(fabric_2x3$v_to_slaves_2_awready),
			  .v_to_slaves_2_bid(fabric_2x3$v_to_slaves_2_bid),
			  .v_to_slaves_2_bresp(fabric_2x3$v_to_slaves_2_bresp),
			  .v_to_slaves_2_bvalid(fabric_2x3$v_to_slaves_2_bvalid),
			  .v_to_slaves_2_rdata(fabric_2x3$v_to_slaves_2_rdata),
			  .v_to_slaves_2_rid(fabric_2x3$v_to_slaves_2_rid),
			  .v_to_slaves_2_rlast(fabric_2x3$v_to_slaves_2_rlast),
			  .v_to_slaves_2_rresp(fabric_2x3$v_to_slaves_2_rresp),
			  .v_to_slaves_2_rvalid(fabric_2x3$v_to_slaves_2_rvalid),
			  .v_to_slaves_2_wready(fabric_2x3$v_to_slaves_2_wready),
			  .EN_reset(fabric_2x3$EN_reset),
			  .EN_set_verbosity(fabric_2x3$EN_set_verbosity),
			  .RDY_reset(fabric_2x3$RDY_reset),
			  .RDY_set_verbosity(),
			  .v_from_masters_0_awready(fabric_2x3$v_from_masters_0_awready),
			  .v_from_masters_0_wready(fabric_2x3$v_from_masters_0_wready),
			  .v_from_masters_0_bvalid(fabric_2x3$v_from_masters_0_bvalid),
			  .v_from_masters_0_bid(fabric_2x3$v_from_masters_0_bid),
			  .v_from_masters_0_bresp(fabric_2x3$v_from_masters_0_bresp),
			  .v_from_masters_0_arready(fabric_2x3$v_from_masters_0_arready),
			  .v_from_masters_0_rvalid(fabric_2x3$v_from_masters_0_rvalid),
			  .v_from_masters_0_rid(fabric_2x3$v_from_masters_0_rid),
			  .v_from_masters_0_rdata(fabric_2x3$v_from_masters_0_rdata),
			  .v_from_masters_0_rresp(fabric_2x3$v_from_masters_0_rresp),
			  .v_from_masters_0_rlast(fabric_2x3$v_from_masters_0_rlast),
			  .v_from_masters_1_awready(),
			  .v_from_masters_1_wready(),
			  .v_from_masters_1_bvalid(),
			  .v_from_masters_1_bid(),
			  .v_from_masters_1_bresp(),
			  .v_from_masters_1_arready(),
			  .v_from_masters_1_rvalid(),
			  .v_from_masters_1_rid(),
			  .v_from_masters_1_rdata(),
			  .v_from_masters_1_rresp(),
			  .v_from_masters_1_rlast(),
			  .v_to_slaves_0_awvalid(fabric_2x3$v_to_slaves_0_awvalid),
			  .v_to_slaves_0_awid(fabric_2x3$v_to_slaves_0_awid),
			  .v_to_slaves_0_awaddr(fabric_2x3$v_to_slaves_0_awaddr),
			  .v_to_slaves_0_awlen(fabric_2x3$v_to_slaves_0_awlen),
			  .v_to_slaves_0_awsize(fabric_2x3$v_to_slaves_0_awsize),
			  .v_to_slaves_0_awburst(fabric_2x3$v_to_slaves_0_awburst),
			  .v_to_slaves_0_awlock(fabric_2x3$v_to_slaves_0_awlock),
			  .v_to_slaves_0_awcache(fabric_2x3$v_to_slaves_0_awcache),
			  .v_to_slaves_0_awprot(fabric_2x3$v_to_slaves_0_awprot),
			  .v_to_slaves_0_awqos(fabric_2x3$v_to_slaves_0_awqos),
			  .v_to_slaves_0_awregion(fabric_2x3$v_to_slaves_0_awregion),
			  .v_to_slaves_0_wvalid(fabric_2x3$v_to_slaves_0_wvalid),
			  .v_to_slaves_0_wdata(fabric_2x3$v_to_slaves_0_wdata),
			  .v_to_slaves_0_wstrb(fabric_2x3$v_to_slaves_0_wstrb),
			  .v_to_slaves_0_wlast(fabric_2x3$v_to_slaves_0_wlast),
			  .v_to_slaves_0_bready(fabric_2x3$v_to_slaves_0_bready),
			  .v_to_slaves_0_arvalid(fabric_2x3$v_to_slaves_0_arvalid),
			  .v_to_slaves_0_arid(fabric_2x3$v_to_slaves_0_arid),
			  .v_to_slaves_0_araddr(fabric_2x3$v_to_slaves_0_araddr),
			  .v_to_slaves_0_arlen(fabric_2x3$v_to_slaves_0_arlen),
			  .v_to_slaves_0_arsize(fabric_2x3$v_to_slaves_0_arsize),
			  .v_to_slaves_0_arburst(fabric_2x3$v_to_slaves_0_arburst),
			  .v_to_slaves_0_arlock(fabric_2x3$v_to_slaves_0_arlock),
			  .v_to_slaves_0_arcache(fabric_2x3$v_to_slaves_0_arcache),
			  .v_to_slaves_0_arprot(fabric_2x3$v_to_slaves_0_arprot),
			  .v_to_slaves_0_arqos(fabric_2x3$v_to_slaves_0_arqos),
			  .v_to_slaves_0_arregion(fabric_2x3$v_to_slaves_0_arregion),
			  .v_to_slaves_0_rready(fabric_2x3$v_to_slaves_0_rready),
			  .v_to_slaves_1_awvalid(fabric_2x3$v_to_slaves_1_awvalid),
			  .v_to_slaves_1_awid(fabric_2x3$v_to_slaves_1_awid),
			  .v_to_slaves_1_awaddr(fabric_2x3$v_to_slaves_1_awaddr),
			  .v_to_slaves_1_awlen(fabric_2x3$v_to_slaves_1_awlen),
			  .v_to_slaves_1_awsize(fabric_2x3$v_to_slaves_1_awsize),
			  .v_to_slaves_1_awburst(fabric_2x3$v_to_slaves_1_awburst),
			  .v_to_slaves_1_awlock(fabric_2x3$v_to_slaves_1_awlock),
			  .v_to_slaves_1_awcache(fabric_2x3$v_to_slaves_1_awcache),
			  .v_to_slaves_1_awprot(fabric_2x3$v_to_slaves_1_awprot),
			  .v_to_slaves_1_awqos(fabric_2x3$v_to_slaves_1_awqos),
			  .v_to_slaves_1_awregion(fabric_2x3$v_to_slaves_1_awregion),
			  .v_to_slaves_1_wvalid(fabric_2x3$v_to_slaves_1_wvalid),
			  .v_to_slaves_1_wdata(fabric_2x3$v_to_slaves_1_wdata),
			  .v_to_slaves_1_wstrb(fabric_2x3$v_to_slaves_1_wstrb),
			  .v_to_slaves_1_wlast(fabric_2x3$v_to_slaves_1_wlast),
			  .v_to_slaves_1_bready(fabric_2x3$v_to_slaves_1_bready),
			  .v_to_slaves_1_arvalid(fabric_2x3$v_to_slaves_1_arvalid),
			  .v_to_slaves_1_arid(fabric_2x3$v_to_slaves_1_arid),
			  .v_to_slaves_1_araddr(fabric_2x3$v_to_slaves_1_araddr),
			  .v_to_slaves_1_arlen(fabric_2x3$v_to_slaves_1_arlen),
			  .v_to_slaves_1_arsize(fabric_2x3$v_to_slaves_1_arsize),
			  .v_to_slaves_1_arburst(fabric_2x3$v_to_slaves_1_arburst),
			  .v_to_slaves_1_arlock(fabric_2x3$v_to_slaves_1_arlock),
			  .v_to_slaves_1_arcache(fabric_2x3$v_to_slaves_1_arcache),
			  .v_to_slaves_1_arprot(fabric_2x3$v_to_slaves_1_arprot),
			  .v_to_slaves_1_arqos(fabric_2x3$v_to_slaves_1_arqos),
			  .v_to_slaves_1_arregion(fabric_2x3$v_to_slaves_1_arregion),
			  .v_to_slaves_1_rready(fabric_2x3$v_to_slaves_1_rready),
			  .v_to_slaves_2_awvalid(fabric_2x3$v_to_slaves_2_awvalid),
			  .v_to_slaves_2_awid(fabric_2x3$v_to_slaves_2_awid),
			  .v_to_slaves_2_awaddr(fabric_2x3$v_to_slaves_2_awaddr),
			  .v_to_slaves_2_awlen(fabric_2x3$v_to_slaves_2_awlen),
			  .v_to_slaves_2_awsize(fabric_2x3$v_to_slaves_2_awsize),
			  .v_to_slaves_2_awburst(fabric_2x3$v_to_slaves_2_awburst),
			  .v_to_slaves_2_awlock(fabric_2x3$v_to_slaves_2_awlock),
			  .v_to_slaves_2_awcache(fabric_2x3$v_to_slaves_2_awcache),
			  .v_to_slaves_2_awprot(fabric_2x3$v_to_slaves_2_awprot),
			  .v_to_slaves_2_awqos(fabric_2x3$v_to_slaves_2_awqos),
			  .v_to_slaves_2_awregion(fabric_2x3$v_to_slaves_2_awregion),
			  .v_to_slaves_2_wvalid(fabric_2x3$v_to_slaves_2_wvalid),
			  .v_to_slaves_2_wdata(fabric_2x3$v_to_slaves_2_wdata),
			  .v_to_slaves_2_wstrb(fabric_2x3$v_to_slaves_2_wstrb),
			  .v_to_slaves_2_wlast(fabric_2x3$v_to_slaves_2_wlast),
			  .v_to_slaves_2_bready(fabric_2x3$v_to_slaves_2_bready),
			  .v_to_slaves_2_arvalid(fabric_2x3$v_to_slaves_2_arvalid),
			  .v_to_slaves_2_arid(fabric_2x3$v_to_slaves_2_arid),
			  .v_to_slaves_2_araddr(fabric_2x3$v_to_slaves_2_araddr),
			  .v_to_slaves_2_arlen(fabric_2x3$v_to_slaves_2_arlen),
			  .v_to_slaves_2_arsize(fabric_2x3$v_to_slaves_2_arsize),
			  .v_to_slaves_2_arburst(fabric_2x3$v_to_slaves_2_arburst),
			  .v_to_slaves_2_arlock(fabric_2x3$v_to_slaves_2_arlock),
			  .v_to_slaves_2_arcache(fabric_2x3$v_to_slaves_2_arcache),
			  .v_to_slaves_2_arprot(fabric_2x3$v_to_slaves_2_arprot),
			  .v_to_slaves_2_arqos(fabric_2x3$v_to_slaves_2_arqos),
			  .v_to_slaves_2_arregion(fabric_2x3$v_to_slaves_2_arregion),
			  .v_to_slaves_2_rready(fabric_2x3$v_to_slaves_2_rready));
  // submodule near_mem_io
  mkNear_Mem_IO_AXI4 near_mem_io(.CLK(CLK),
				 .RST_N(RST_N),
				 .axi4_slave_araddr(near_mem_io$axi4_slave_araddr),
				 .axi4_slave_arburst(near_mem_io$axi4_slave_arburst),
				 .axi4_slave_arcache(near_mem_io$axi4_slave_arcache),
				 .axi4_slave_arid(near_mem_io$axi4_slave_arid),
				 .axi4_slave_arlen(near_mem_io$axi4_slave_arlen),
				 .axi4_slave_arlock(near_mem_io$axi4_slave_arlock),
				 .axi4_slave_arprot(near_mem_io$axi4_slave_arprot),
				 .axi4_slave_arqos(near_mem_io$axi4_slave_arqos),
				 .axi4_slave_arregion(near_mem_io$axi4_slave_arregion),
				 .axi4_slave_arsize(near_mem_io$axi4_slave_arsize),
				 .axi4_slave_arvalid(near_mem_io$axi4_slave_arvalid),
				 .axi4_slave_awaddr(near_mem_io$axi4_slave_awaddr),
				 .axi4_slave_awburst(near_mem_io$axi4_slave_awburst),
				 .axi4_slave_awcache(near_mem_io$axi4_slave_awcache),
				 .axi4_slave_awid(near_mem_io$axi4_slave_awid),
				 .axi4_slave_awlen(near_mem_io$axi4_slave_awlen),
				 .axi4_slave_awlock(near_mem_io$axi4_slave_awlock),
				 .axi4_slave_awprot(near_mem_io$axi4_slave_awprot),
				 .axi4_slave_awqos(near_mem_io$axi4_slave_awqos),
				 .axi4_slave_awregion(near_mem_io$axi4_slave_awregion),
				 .axi4_slave_awsize(near_mem_io$axi4_slave_awsize),
				 .axi4_slave_awvalid(near_mem_io$axi4_slave_awvalid),
				 .axi4_slave_bready(near_mem_io$axi4_slave_bready),
				 .axi4_slave_rready(near_mem_io$axi4_slave_rready),
				 .axi4_slave_wdata(near_mem_io$axi4_slave_wdata),
				 .axi4_slave_wlast(near_mem_io$axi4_slave_wlast),
				 .axi4_slave_wstrb(near_mem_io$axi4_slave_wstrb),
				 .axi4_slave_wvalid(near_mem_io$axi4_slave_wvalid),
				 .set_addr_map_addr_base(near_mem_io$set_addr_map_addr_base),
				 .set_addr_map_addr_lim(near_mem_io$set_addr_map_addr_lim),
				 .EN_server_reset_request_put(near_mem_io$EN_server_reset_request_put),
				 .EN_server_reset_response_get(near_mem_io$EN_server_reset_response_get),
				 .EN_set_addr_map(near_mem_io$EN_set_addr_map),
				 .EN_get_timer_interrupt_req_get(near_mem_io$EN_get_timer_interrupt_req_get),
				 .EN_get_sw_interrupt_req_get(near_mem_io$EN_get_sw_interrupt_req_get),
				 .RDY_server_reset_request_put(near_mem_io$RDY_server_reset_request_put),
				 .RDY_server_reset_response_get(near_mem_io$RDY_server_reset_response_get),
				 .RDY_set_addr_map(),
				 .axi4_slave_awready(near_mem_io$axi4_slave_awready),
				 .axi4_slave_wready(near_mem_io$axi4_slave_wready),
				 .axi4_slave_bvalid(near_mem_io$axi4_slave_bvalid),
				 .axi4_slave_bid(near_mem_io$axi4_slave_bid),
				 .axi4_slave_bresp(near_mem_io$axi4_slave_bresp),
				 .axi4_slave_arready(near_mem_io$axi4_slave_arready),
				 .axi4_slave_rvalid(near_mem_io$axi4_slave_rvalid),
				 .axi4_slave_rid(near_mem_io$axi4_slave_rid),
				 .axi4_slave_rdata(near_mem_io$axi4_slave_rdata),
				 .axi4_slave_rresp(near_mem_io$axi4_slave_rresp),
				 .axi4_slave_rlast(near_mem_io$axi4_slave_rlast),
				 .get_timer_interrupt_req_get(near_mem_io$get_timer_interrupt_req_get),
				 .RDY_get_timer_interrupt_req_get(near_mem_io$RDY_get_timer_interrupt_req_get),
				 .get_sw_interrupt_req_get(near_mem_io$get_sw_interrupt_req_get),
				 .RDY_get_sw_interrupt_req_get(near_mem_io$RDY_get_sw_interrupt_req_get));
  // submodule plic
  mkPLIC_16_2_7 plic(.CLK(CLK),
		     .RST_N(RST_N),
		     .axi4_slave_araddr(plic$axi4_slave_araddr),
		     .axi4_slave_arburst(plic$axi4_slave_arburst),
		     .axi4_slave_arcache(plic$axi4_slave_arcache),
		     .axi4_slave_arid(plic$axi4_slave_arid),
		     .axi4_slave_arlen(plic$axi4_slave_arlen),
		     .axi4_slave_arlock(plic$axi4_slave_arlock),
		     .axi4_slave_arprot(plic$axi4_slave_arprot),
		     .axi4_slave_arqos(plic$axi4_slave_arqos),
		     .axi4_slave_arregion(plic$axi4_slave_arregion),
		     .axi4_slave_arsize(plic$axi4_slave_arsize),
		     .axi4_slave_arvalid(plic$axi4_slave_arvalid),
		     .axi4_slave_awaddr(plic$axi4_slave_awaddr),
		     .axi4_slave_awburst(plic$axi4_slave_awburst),
		     .axi4_slave_awcache(plic$axi4_slave_awcache),
		     .axi4_slave_awid(plic$axi4_slave_awid),
		     .axi4_slave_awlen(plic$axi4_slave_awlen),
		     .axi4_slave_awlock(plic$axi4_slave_awlock),
		     .axi4_slave_awprot(plic$axi4_slave_awprot),
		     .axi4_slave_awqos(plic$axi4_slave_awqos),
		     .axi4_slave_awregion(plic$axi4_slave_awregion),
		     .axi4_slave_awsize(plic$axi4_slave_awsize),
		     .axi4_slave_awvalid(plic$axi4_slave_awvalid),
		     .axi4_slave_bready(plic$axi4_slave_bready),
		     .axi4_slave_rready(plic$axi4_slave_rready),
		     .axi4_slave_wdata(plic$axi4_slave_wdata),
		     .axi4_slave_wlast(plic$axi4_slave_wlast),
		     .axi4_slave_wstrb(plic$axi4_slave_wstrb),
		     .axi4_slave_wvalid(plic$axi4_slave_wvalid),
		     .set_addr_map_addr_base(plic$set_addr_map_addr_base),
		     .set_addr_map_addr_lim(plic$set_addr_map_addr_lim),
		     .set_verbosity_verbosity(plic$set_verbosity_verbosity),
		     .v_sources_0_m_interrupt_req_set_not_clear(plic$v_sources_0_m_interrupt_req_set_not_clear),
		     .v_sources_10_m_interrupt_req_set_not_clear(plic$v_sources_10_m_interrupt_req_set_not_clear),
		     .v_sources_11_m_interrupt_req_set_not_clear(plic$v_sources_11_m_interrupt_req_set_not_clear),
		     .v_sources_12_m_interrupt_req_set_not_clear(plic$v_sources_12_m_interrupt_req_set_not_clear),
		     .v_sources_13_m_interrupt_req_set_not_clear(plic$v_sources_13_m_interrupt_req_set_not_clear),
		     .v_sources_14_m_interrupt_req_set_not_clear(plic$v_sources_14_m_interrupt_req_set_not_clear),
		     .v_sources_15_m_interrupt_req_set_not_clear(plic$v_sources_15_m_interrupt_req_set_not_clear),
		     .v_sources_1_m_interrupt_req_set_not_clear(plic$v_sources_1_m_interrupt_req_set_not_clear),
		     .v_sources_2_m_interrupt_req_set_not_clear(plic$v_sources_2_m_interrupt_req_set_not_clear),
		     .v_sources_3_m_interrupt_req_set_not_clear(plic$v_sources_3_m_interrupt_req_set_not_clear),
		     .v_sources_4_m_interrupt_req_set_not_clear(plic$v_sources_4_m_interrupt_req_set_not_clear),
		     .v_sources_5_m_interrupt_req_set_not_clear(plic$v_sources_5_m_interrupt_req_set_not_clear),
		     .v_sources_6_m_interrupt_req_set_not_clear(plic$v_sources_6_m_interrupt_req_set_not_clear),
		     .v_sources_7_m_interrupt_req_set_not_clear(plic$v_sources_7_m_interrupt_req_set_not_clear),
		     .v_sources_8_m_interrupt_req_set_not_clear(plic$v_sources_8_m_interrupt_req_set_not_clear),
		     .v_sources_9_m_interrupt_req_set_not_clear(plic$v_sources_9_m_interrupt_req_set_not_clear),
		     .EN_set_verbosity(plic$EN_set_verbosity),
		     .EN_show_PLIC_state(plic$EN_show_PLIC_state),
		     .EN_server_reset_request_put(plic$EN_server_reset_request_put),
		     .EN_server_reset_response_get(plic$EN_server_reset_response_get),
		     .EN_set_addr_map(plic$EN_set_addr_map),
		     .RDY_set_verbosity(),
		     .RDY_show_PLIC_state(),
		     .RDY_server_reset_request_put(plic$RDY_server_reset_request_put),
		     .RDY_server_reset_response_get(plic$RDY_server_reset_response_get),
		     .RDY_set_addr_map(),
		     .axi4_slave_awready(plic$axi4_slave_awready),
		     .axi4_slave_wready(plic$axi4_slave_wready),
		     .axi4_slave_bvalid(plic$axi4_slave_bvalid),
		     .axi4_slave_bid(plic$axi4_slave_bid),
		     .axi4_slave_bresp(plic$axi4_slave_bresp),
		     .axi4_slave_arready(plic$axi4_slave_arready),
		     .axi4_slave_rvalid(plic$axi4_slave_rvalid),
		     .axi4_slave_rid(plic$axi4_slave_rid),
		     .axi4_slave_rdata(plic$axi4_slave_rdata),
		     .axi4_slave_rresp(plic$axi4_slave_rresp),
		     .axi4_slave_rlast(plic$axi4_slave_rlast),
		     .v_targets_0_m_eip(plic$v_targets_0_m_eip),
		     .v_targets_1_m_eip(plic$v_targets_1_m_eip));
  // submodule soc_map
  mkSoC_Map soc_map(.CLK(CLK),
		    .RST_N(RST_N),
		    .m_is_IO_addr_addr(soc_map$m_is_IO_addr_addr),
		    .m_is_mem_addr_addr(soc_map$m_is_mem_addr_addr),
		    .m_is_near_mem_IO_addr_addr(soc_map$m_is_near_mem_IO_addr_addr),
		    .m_near_mem_io_addr_base(soc_map$m_near_mem_io_addr_base),
		    .m_near_mem_io_addr_size(),
		    .m_near_mem_io_addr_lim(soc_map$m_near_mem_io_addr_lim),
		    .m_plic_addr_base(soc_map$m_plic_addr_base),
		    .m_plic_addr_size(),
		    .m_plic_addr_lim(soc_map$m_plic_addr_lim),
		    .m_uart0_addr_base(),
		    .m_uart0_addr_size(),
		    .m_uart0_addr_lim(),
		    .m_boot_rom_addr_base(),
		    .m_boot_rom_addr_size(),
		    .m_boot_rom_addr_lim(),
		    .m_mem0_controller_addr_base(),
		    .m_mem0_controller_addr_size(),
		    .m_mem0_controller_addr_lim(),
		    .m_tcm_addr_base(),
		    .m_tcm_addr_size(),
		    .m_tcm_addr_lim(),
		    .m_is_mem_addr(),
		    .m_is_IO_addr(),
		    .m_is_near_mem_IO_addr(),
		    .m_pc_reset_value(),
		    .m_mtvec_reset_value(),
		    .m_nmivec_reset_value());
  // rule RL_rl_wr_addr_channel
  assign CAN_FIRE_RL_rl_wr_addr_channel = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_addr_channel = 1'd1 ;
  // rule RL_rl_wr_data_channel
  assign CAN_FIRE_RL_rl_wr_data_channel = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_data_channel = 1'd1 ;
  // rule RL_rl_wr_response_channel
  assign CAN_FIRE_RL_rl_wr_response_channel = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_response_channel = 1'd1 ;
  // rule RL_rl_rd_addr_channel
  assign CAN_FIRE_RL_rl_rd_addr_channel = 1'd1 ;
  assign WILL_FIRE_RL_rl_rd_addr_channel = 1'd1 ;
  // rule RL_rl_rd_data_channel
  assign CAN_FIRE_RL_rl_rd_data_channel = 1'd1 ;
  assign WILL_FIRE_RL_rl_rd_data_channel = 1'd1 ;
  // rule RL_rl_wr_addr_channel_1
  assign CAN_FIRE_RL_rl_wr_addr_channel_1 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_addr_channel_1 = 1'd1 ;
  // rule RL_rl_wr_data_channel_1
  assign CAN_FIRE_RL_rl_wr_data_channel_1 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_data_channel_1 = 1'd1 ;
  // rule RL_rl_wr_response_channel_1
  assign CAN_FIRE_RL_rl_wr_response_channel_1 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_response_channel_1 = 1'd1 ;
  // rule RL_rl_rd_addr_channel_1
  assign CAN_FIRE_RL_rl_rd_addr_channel_1 = 1'd1 ;
  assign WILL_FIRE_RL_rl_rd_addr_channel_1 = 1'd1 ;
  // rule RL_rl_rd_data_channel_1
  assign CAN_FIRE_RL_rl_rd_data_channel_1 = 1'd1 ;
  assign WILL_FIRE_RL_rl_rd_data_channel_1 = 1'd1 ;
  // rule RL_rl_wr_addr_channel_2
  assign CAN_FIRE_RL_rl_wr_addr_channel_2 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_addr_channel_2 = 1'd1 ;
  // rule RL_rl_wr_data_channel_2
  assign CAN_FIRE_RL_rl_wr_data_channel_2 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_data_channel_2 = 1'd1 ;
  // rule RL_rl_wr_response_channel_2
  assign CAN_FIRE_RL_rl_wr_response_channel_2 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_response_channel_2 = 1'd1 ;
  // rule RL_rl_rd_addr_channel_2
  assign CAN_FIRE_RL_rl_rd_addr_channel_2 = 1'd1 ;
  assign WILL_FIRE_RL_rl_rd_addr_channel_2 = 1'd1 ;
  // rule RL_rl_rd_data_channel_2
  assign CAN_FIRE_RL_rl_rd_data_channel_2 = 1'd1 ;
  assign WILL_FIRE_RL_rl_rd_data_channel_2 = 1'd1 ;
  // rule RL_rl_wr_addr_channel_3
  assign CAN_FIRE_RL_rl_wr_addr_channel_3 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_addr_channel_3 = 1'd1 ;
  // rule RL_rl_wr_data_channel_3
  assign CAN_FIRE_RL_rl_wr_data_channel_3 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_data_channel_3 = 1'd1 ;
  // rule RL_rl_wr_response_channel_3
  assign CAN_FIRE_RL_rl_wr_response_channel_3 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_response_channel_3 = 1'd1 ;
  // rule RL_rl_rd_addr_channel_3
  assign CAN_FIRE_RL_rl_rd_addr_channel_3 = 1'd1 ;
  assign WILL_FIRE_RL_rl_rd_addr_channel_3 = 1'd1 ;
  // rule RL_rl_rd_data_channel_3
  assign CAN_FIRE_RL_rl_rd_data_channel_3 = 1'd1 ;
  assign WILL_FIRE_RL_rl_rd_data_channel_3 = 1'd1 ;
  // rule RL_rl_relay_sw_interrupts
  assign CAN_FIRE_RL_rl_relay_sw_interrupts =
	     near_mem_io$RDY_get_sw_interrupt_req_get ;
  assign WILL_FIRE_RL_rl_relay_sw_interrupts =
	     near_mem_io$RDY_get_sw_interrupt_req_get ;
  // rule RL_rl_relay_timer_interrupts
  assign CAN_FIRE_RL_rl_relay_timer_interrupts =
	     near_mem_io$RDY_get_timer_interrupt_req_get ;
  assign WILL_FIRE_RL_rl_relay_timer_interrupts =
	     near_mem_io$RDY_get_timer_interrupt_req_get ;
  // rule RL_rl_relay_external_interrupts
  assign CAN_FIRE_RL_rl_relay_external_interrupts = 1'd1 ;
  assign WILL_FIRE_RL_rl_relay_external_interrupts = 1'd1 ;
  // rule RL_rl_cpu_hart0_reset_from_soc_start
  assign CAN_FIRE_RL_rl_cpu_hart0_reset_from_soc_start =
	     near_mem_io$RDY_server_reset_request_put &&
	     plic_RDY_server_reset_request_put_AND_fabric_2_ETC___d8 ;
  assign WILL_FIRE_RL_rl_cpu_hart0_reset_from_soc_start =
	     CAN_FIRE_RL_rl_cpu_hart0_reset_from_soc_start ;
  // rule RL_rl_cpu_hart0_reset_complete
  assign CAN_FIRE_RL_rl_cpu_hart0_reset_complete =
	     near_mem_io$RDY_server_reset_response_get &&
	     plic$RDY_server_reset_response_get &&
	     cpu$RDY_hart0_server_reset_response_get &&
	     f_reset_rsps$FULL_N ;
  assign WILL_FIRE_RL_rl_cpu_hart0_reset_complete =
	     CAN_FIRE_RL_rl_cpu_hart0_reset_complete ;
  // submodule cpu
  assign cpu$dmem_master_arready = fabric_2x3$v_from_masters_0_arready ;
  assign cpu$dmem_master_awready = fabric_2x3$v_from_masters_0_awready ;
  assign cpu$dmem_master_bid = fabric_2x3$v_from_masters_0_bid ;
  assign cpu$dmem_master_bresp = fabric_2x3$v_from_masters_0_bresp ;
  assign cpu$dmem_master_bvalid = fabric_2x3$v_from_masters_0_bvalid ;
  assign cpu$dmem_master_rdata = fabric_2x3$v_from_masters_0_rdata ;
  assign cpu$dmem_master_rid = fabric_2x3$v_from_masters_0_rid ;
  assign cpu$dmem_master_rlast = fabric_2x3$v_from_masters_0_rlast ;
  assign cpu$dmem_master_rresp = fabric_2x3$v_from_masters_0_rresp ;
  assign cpu$dmem_master_rvalid = fabric_2x3$v_from_masters_0_rvalid ;
  assign cpu$dmem_master_wready = fabric_2x3$v_from_masters_0_wready ;
  assign cpu$hart0_server_reset_request_put = f_reset_reqs$D_OUT ;
  assign cpu$imem_master_arready = cpu_imem_master_arready ;
  assign cpu$imem_master_awready = cpu_imem_master_awready ;
  assign cpu$imem_master_bid = cpu_imem_master_bid ;
  assign cpu$imem_master_bresp = cpu_imem_master_bresp ;
  assign cpu$imem_master_bvalid = cpu_imem_master_bvalid ;
  assign cpu$imem_master_rdata = cpu_imem_master_rdata ;
  assign cpu$imem_master_rid = cpu_imem_master_rid ;
  assign cpu$imem_master_rlast = cpu_imem_master_rlast ;
  assign cpu$imem_master_rresp = cpu_imem_master_rresp ;
  assign cpu$imem_master_rvalid = cpu_imem_master_rvalid ;
  assign cpu$imem_master_wready = cpu_imem_master_wready ;
  assign cpu$m_external_interrupt_req_set_not_clear = plic$v_targets_0_m_eip ;
  assign cpu$nmi_req_set_not_clear = nmi_req_set_not_clear ;
  assign cpu$s_external_interrupt_req_set_not_clear = plic$v_targets_1_m_eip ;
  assign cpu$set_verbosity_logdelay = set_verbosity_logdelay ;
  assign cpu$set_verbosity_verbosity = set_verbosity_verbosity ;
  assign cpu$set_watch_tohost_tohost_addr = set_watch_tohost_tohost_addr ;
  assign cpu$set_watch_tohost_watch_tohost = set_watch_tohost_watch_tohost ;
  assign cpu$software_interrupt_req_set_not_clear =
	     near_mem_io$get_sw_interrupt_req_get ;
  assign cpu$timer_interrupt_req_set_not_clear =
	     near_mem_io$get_timer_interrupt_req_get ;
  assign cpu$EN_hart0_server_reset_request_put =
	     CAN_FIRE_RL_rl_cpu_hart0_reset_from_soc_start ;
  assign cpu$EN_hart0_server_reset_response_get =
	     CAN_FIRE_RL_rl_cpu_hart0_reset_complete ;
  assign cpu$EN_set_verbosity = EN_set_verbosity ;
  assign cpu$EN_set_watch_tohost = EN_set_watch_tohost ;
  // submodule f_reset_reqs
  assign f_reset_reqs$D_IN = cpu_reset_server_request_put ;
  assign f_reset_reqs$ENQ = EN_cpu_reset_server_request_put ;
  assign f_reset_reqs$DEQ =
	     near_mem_io$RDY_server_reset_request_put &&
	     plic_RDY_server_reset_request_put_AND_fabric_2_ETC___d8 ;
  assign f_reset_reqs$CLR = 1'b0 ;
  // submodule f_reset_rsps
  assign f_reset_rsps$D_IN = cpu$hart0_server_reset_response_get ;
  assign f_reset_rsps$ENQ =
	     near_mem_io$RDY_server_reset_response_get &&
	     plic$RDY_server_reset_response_get &&
	     cpu$RDY_hart0_server_reset_response_get &&
	     f_reset_rsps$FULL_N ;
  assign f_reset_rsps$DEQ = EN_cpu_reset_server_response_get ;
  assign f_reset_rsps$CLR = 1'b0 ;
  // submodule fabric_2x3
  assign fabric_2x3$set_verbosity_verbosity = 4'h0 ;
  assign fabric_2x3$v_from_masters_0_araddr = cpu$dmem_master_araddr ;
  assign fabric_2x3$v_from_masters_0_arburst = cpu$dmem_master_arburst ;
  assign fabric_2x3$v_from_masters_0_arcache = cpu$dmem_master_arcache ;
  assign fabric_2x3$v_from_masters_0_arid = cpu$dmem_master_arid ;
  assign fabric_2x3$v_from_masters_0_arlen = cpu$dmem_master_arlen ;
  assign fabric_2x3$v_from_masters_0_arlock = cpu$dmem_master_arlock ;
  assign fabric_2x3$v_from_masters_0_arprot = cpu$dmem_master_arprot ;
  assign fabric_2x3$v_from_masters_0_arqos = cpu$dmem_master_arqos ;
  assign fabric_2x3$v_from_masters_0_arregion = cpu$dmem_master_arregion ;
  assign fabric_2x3$v_from_masters_0_arsize = cpu$dmem_master_arsize ;
  assign fabric_2x3$v_from_masters_0_arvalid = cpu$dmem_master_arvalid ;
  assign fabric_2x3$v_from_masters_0_awaddr = cpu$dmem_master_awaddr ;
  assign fabric_2x3$v_from_masters_0_awburst = cpu$dmem_master_awburst ;
  assign fabric_2x3$v_from_masters_0_awcache = cpu$dmem_master_awcache ;
  assign fabric_2x3$v_from_masters_0_awid = cpu$dmem_master_awid ;
  assign fabric_2x3$v_from_masters_0_awlen = cpu$dmem_master_awlen ;
  assign fabric_2x3$v_from_masters_0_awlock = cpu$dmem_master_awlock ;
  assign fabric_2x3$v_from_masters_0_awprot = cpu$dmem_master_awprot ;
  assign fabric_2x3$v_from_masters_0_awqos = cpu$dmem_master_awqos ;
  assign fabric_2x3$v_from_masters_0_awregion = cpu$dmem_master_awregion ;
  assign fabric_2x3$v_from_masters_0_awsize = cpu$dmem_master_awsize ;
  assign fabric_2x3$v_from_masters_0_awvalid = cpu$dmem_master_awvalid ;
  assign fabric_2x3$v_from_masters_0_bready = cpu$dmem_master_bready ;
  assign fabric_2x3$v_from_masters_0_rready = cpu$dmem_master_rready ;
  assign fabric_2x3$v_from_masters_0_wdata = cpu$dmem_master_wdata ;
  assign fabric_2x3$v_from_masters_0_wlast = cpu$dmem_master_wlast ;
  assign fabric_2x3$v_from_masters_0_wstrb = cpu$dmem_master_wstrb ;
  assign fabric_2x3$v_from_masters_0_wvalid = cpu$dmem_master_wvalid ;
  assign fabric_2x3$v_from_masters_1_araddr =
	     64'hAAAAAAAAAAAAAAAA /* unspecified value */  ;
  assign fabric_2x3$v_from_masters_1_arburst =
	     2'b10 /* unspecified value */  ;
  assign fabric_2x3$v_from_masters_1_arcache =
	     4'b1010 /* unspecified value */  ;
  assign fabric_2x3$v_from_masters_1_arid = 4'b1010 /* unspecified value */  ;
  assign fabric_2x3$v_from_masters_1_arlen =
	     8'b10101010 /* unspecified value */  ;
  assign fabric_2x3$v_from_masters_1_arlock = 1'b0 /* unspecified value */  ;
  assign fabric_2x3$v_from_masters_1_arprot =
	     3'b010 /* unspecified value */  ;
  assign fabric_2x3$v_from_masters_1_arqos =
	     4'b1010 /* unspecified value */  ;
  assign fabric_2x3$v_from_masters_1_arregion =
	     4'b1010 /* unspecified value */  ;
  assign fabric_2x3$v_from_masters_1_arsize =
	     3'b010 /* unspecified value */  ;
  assign fabric_2x3$v_from_masters_1_arvalid = 1'd0 ;
  assign fabric_2x3$v_from_masters_1_awaddr =
	     64'hAAAAAAAAAAAAAAAA /* unspecified value */  ;
  assign fabric_2x3$v_from_masters_1_awburst =
	     2'b10 /* unspecified value */  ;
  assign fabric_2x3$v_from_masters_1_awcache =
	     4'b1010 /* unspecified value */  ;
  assign fabric_2x3$v_from_masters_1_awid = 4'b1010 /* unspecified value */  ;
  assign fabric_2x3$v_from_masters_1_awlen =
	     8'b10101010 /* unspecified value */  ;
  assign fabric_2x3$v_from_masters_1_awlock = 1'b0 /* unspecified value */  ;
  assign fabric_2x3$v_from_masters_1_awprot =
	     3'b010 /* unspecified value */  ;
  assign fabric_2x3$v_from_masters_1_awqos =
	     4'b1010 /* unspecified value */  ;
  assign fabric_2x3$v_from_masters_1_awregion =
	     4'b1010 /* unspecified value */  ;
  assign fabric_2x3$v_from_masters_1_awsize =
	     3'b010 /* unspecified value */  ;
  assign fabric_2x3$v_from_masters_1_awvalid = 1'd0 ;
  assign fabric_2x3$v_from_masters_1_bready = 1'd0 ;
  assign fabric_2x3$v_from_masters_1_rready = 1'd0 ;
  assign fabric_2x3$v_from_masters_1_wdata =
	     64'hAAAAAAAAAAAAAAAA /* unspecified value */  ;
  assign fabric_2x3$v_from_masters_1_wlast = 1'b0 /* unspecified value */  ;
  assign fabric_2x3$v_from_masters_1_wstrb =
	     8'b10101010 /* unspecified value */  ;
  assign fabric_2x3$v_from_masters_1_wvalid = 1'd0 ;
  assign fabric_2x3$v_to_slaves_0_arready = cpu_dmem_master_arready ;
  assign fabric_2x3$v_to_slaves_0_awready = cpu_dmem_master_awready ;
  assign fabric_2x3$v_to_slaves_0_bid = cpu_dmem_master_bid ;
  assign fabric_2x3$v_to_slaves_0_bresp = cpu_dmem_master_bresp ;
  assign fabric_2x3$v_to_slaves_0_bvalid = cpu_dmem_master_bvalid ;
  assign fabric_2x3$v_to_slaves_0_rdata = cpu_dmem_master_rdata ;
  assign fabric_2x3$v_to_slaves_0_rid = cpu_dmem_master_rid ;
  assign fabric_2x3$v_to_slaves_0_rlast = cpu_dmem_master_rlast ;
  assign fabric_2x3$v_to_slaves_0_rresp = cpu_dmem_master_rresp ;
  assign fabric_2x3$v_to_slaves_0_rvalid = cpu_dmem_master_rvalid ;
  assign fabric_2x3$v_to_slaves_0_wready = cpu_dmem_master_wready ;
  assign fabric_2x3$v_to_slaves_1_arready = near_mem_io$axi4_slave_arready ;
  assign fabric_2x3$v_to_slaves_1_awready = near_mem_io$axi4_slave_awready ;
  assign fabric_2x3$v_to_slaves_1_bid = near_mem_io$axi4_slave_bid ;
  assign fabric_2x3$v_to_slaves_1_bresp = near_mem_io$axi4_slave_bresp ;
  assign fabric_2x3$v_to_slaves_1_bvalid = near_mem_io$axi4_slave_bvalid ;
  assign fabric_2x3$v_to_slaves_1_rdata = near_mem_io$axi4_slave_rdata ;
  assign fabric_2x3$v_to_slaves_1_rid = near_mem_io$axi4_slave_rid ;
  assign fabric_2x3$v_to_slaves_1_rlast = near_mem_io$axi4_slave_rlast ;
  assign fabric_2x3$v_to_slaves_1_rresp = near_mem_io$axi4_slave_rresp ;
  assign fabric_2x3$v_to_slaves_1_rvalid = near_mem_io$axi4_slave_rvalid ;
  assign fabric_2x3$v_to_slaves_1_wready = near_mem_io$axi4_slave_wready ;
  assign fabric_2x3$v_to_slaves_2_arready = plic$axi4_slave_arready ;
  assign fabric_2x3$v_to_slaves_2_awready = plic$axi4_slave_awready ;
  assign fabric_2x3$v_to_slaves_2_bid = plic$axi4_slave_bid ;
  assign fabric_2x3$v_to_slaves_2_bresp = plic$axi4_slave_bresp ;
  assign fabric_2x3$v_to_slaves_2_bvalid = plic$axi4_slave_bvalid ;
  assign fabric_2x3$v_to_slaves_2_rdata = plic$axi4_slave_rdata ;
  assign fabric_2x3$v_to_slaves_2_rid = plic$axi4_slave_rid ;
  assign fabric_2x3$v_to_slaves_2_rlast = plic$axi4_slave_rlast ;
  assign fabric_2x3$v_to_slaves_2_rresp = plic$axi4_slave_rresp ;
  assign fabric_2x3$v_to_slaves_2_rvalid = plic$axi4_slave_rvalid ;
  assign fabric_2x3$v_to_slaves_2_wready = plic$axi4_slave_wready ;
  assign fabric_2x3$EN_reset = CAN_FIRE_RL_rl_cpu_hart0_reset_from_soc_start ;
  assign fabric_2x3$EN_set_verbosity = 1'b0 ;
  // submodule near_mem_io
  assign near_mem_io$axi4_slave_araddr = fabric_2x3$v_to_slaves_1_araddr ;
  assign near_mem_io$axi4_slave_arburst = fabric_2x3$v_to_slaves_1_arburst ;
  assign near_mem_io$axi4_slave_arcache = fabric_2x3$v_to_slaves_1_arcache ;
  assign near_mem_io$axi4_slave_arid = fabric_2x3$v_to_slaves_1_arid ;
  assign near_mem_io$axi4_slave_arlen = fabric_2x3$v_to_slaves_1_arlen ;
  assign near_mem_io$axi4_slave_arlock = fabric_2x3$v_to_slaves_1_arlock ;
  assign near_mem_io$axi4_slave_arprot = fabric_2x3$v_to_slaves_1_arprot ;
  assign near_mem_io$axi4_slave_arqos = fabric_2x3$v_to_slaves_1_arqos ;
  assign near_mem_io$axi4_slave_arregion = fabric_2x3$v_to_slaves_1_arregion ;
  assign near_mem_io$axi4_slave_arsize = fabric_2x3$v_to_slaves_1_arsize ;
  assign near_mem_io$axi4_slave_arvalid = fabric_2x3$v_to_slaves_1_arvalid ;
  assign near_mem_io$axi4_slave_awaddr = fabric_2x3$v_to_slaves_1_awaddr ;
  assign near_mem_io$axi4_slave_awburst = fabric_2x3$v_to_slaves_1_awburst ;
  assign near_mem_io$axi4_slave_awcache = fabric_2x3$v_to_slaves_1_awcache ;
  assign near_mem_io$axi4_slave_awid = fabric_2x3$v_to_slaves_1_awid ;
  assign near_mem_io$axi4_slave_awlen = fabric_2x3$v_to_slaves_1_awlen ;
  assign near_mem_io$axi4_slave_awlock = fabric_2x3$v_to_slaves_1_awlock ;
  assign near_mem_io$axi4_slave_awprot = fabric_2x3$v_to_slaves_1_awprot ;
  assign near_mem_io$axi4_slave_awqos = fabric_2x3$v_to_slaves_1_awqos ;
  assign near_mem_io$axi4_slave_awregion = fabric_2x3$v_to_slaves_1_awregion ;
  assign near_mem_io$axi4_slave_awsize = fabric_2x3$v_to_slaves_1_awsize ;
  assign near_mem_io$axi4_slave_awvalid = fabric_2x3$v_to_slaves_1_awvalid ;
  assign near_mem_io$axi4_slave_bready = fabric_2x3$v_to_slaves_1_bready ;
  assign near_mem_io$axi4_slave_rready = fabric_2x3$v_to_slaves_1_rready ;
  assign near_mem_io$axi4_slave_wdata = fabric_2x3$v_to_slaves_1_wdata ;
  assign near_mem_io$axi4_slave_wlast = fabric_2x3$v_to_slaves_1_wlast ;
  assign near_mem_io$axi4_slave_wstrb = fabric_2x3$v_to_slaves_1_wstrb ;
  assign near_mem_io$axi4_slave_wvalid = fabric_2x3$v_to_slaves_1_wvalid ;
  assign near_mem_io$set_addr_map_addr_base =
	     soc_map$m_near_mem_io_addr_base ;
  assign near_mem_io$set_addr_map_addr_lim = soc_map$m_near_mem_io_addr_lim ;
  assign near_mem_io$EN_server_reset_request_put =
	     CAN_FIRE_RL_rl_cpu_hart0_reset_from_soc_start ;
  assign near_mem_io$EN_server_reset_response_get =
	     CAN_FIRE_RL_rl_cpu_hart0_reset_complete ;
  assign near_mem_io$EN_set_addr_map =
	     CAN_FIRE_RL_rl_cpu_hart0_reset_complete ;
  assign near_mem_io$EN_get_timer_interrupt_req_get =
	     near_mem_io$RDY_get_timer_interrupt_req_get ;
  assign near_mem_io$EN_get_sw_interrupt_req_get =
	     near_mem_io$RDY_get_sw_interrupt_req_get ;
  // submodule plic
  assign plic$axi4_slave_araddr = fabric_2x3$v_to_slaves_2_araddr ;
  assign plic$axi4_slave_arburst = fabric_2x3$v_to_slaves_2_arburst ;
  assign plic$axi4_slave_arcache = fabric_2x3$v_to_slaves_2_arcache ;
  assign plic$axi4_slave_arid = fabric_2x3$v_to_slaves_2_arid ;
  assign plic$axi4_slave_arlen = fabric_2x3$v_to_slaves_2_arlen ;
  assign plic$axi4_slave_arlock = fabric_2x3$v_to_slaves_2_arlock ;
  assign plic$axi4_slave_arprot = fabric_2x3$v_to_slaves_2_arprot ;
  assign plic$axi4_slave_arqos = fabric_2x3$v_to_slaves_2_arqos ;
  assign plic$axi4_slave_arregion = fabric_2x3$v_to_slaves_2_arregion ;
  assign plic$axi4_slave_arsize = fabric_2x3$v_to_slaves_2_arsize ;
  assign plic$axi4_slave_arvalid = fabric_2x3$v_to_slaves_2_arvalid ;
  assign plic$axi4_slave_awaddr = fabric_2x3$v_to_slaves_2_awaddr ;
  assign plic$axi4_slave_awburst = fabric_2x3$v_to_slaves_2_awburst ;
  assign plic$axi4_slave_awcache = fabric_2x3$v_to_slaves_2_awcache ;
  assign plic$axi4_slave_awid = fabric_2x3$v_to_slaves_2_awid ;
  assign plic$axi4_slave_awlen = fabric_2x3$v_to_slaves_2_awlen ;
  assign plic$axi4_slave_awlock = fabric_2x3$v_to_slaves_2_awlock ;
  assign plic$axi4_slave_awprot = fabric_2x3$v_to_slaves_2_awprot ;
  assign plic$axi4_slave_awqos = fabric_2x3$v_to_slaves_2_awqos ;
  assign plic$axi4_slave_awregion = fabric_2x3$v_to_slaves_2_awregion ;
  assign plic$axi4_slave_awsize = fabric_2x3$v_to_slaves_2_awsize ;
  assign plic$axi4_slave_awvalid = fabric_2x3$v_to_slaves_2_awvalid ;
  assign plic$axi4_slave_bready = fabric_2x3$v_to_slaves_2_bready ;
  assign plic$axi4_slave_rready = fabric_2x3$v_to_slaves_2_rready ;
  assign plic$axi4_slave_wdata = fabric_2x3$v_to_slaves_2_wdata ;
  assign plic$axi4_slave_wlast = fabric_2x3$v_to_slaves_2_wlast ;
  assign plic$axi4_slave_wstrb = fabric_2x3$v_to_slaves_2_wstrb ;
  assign plic$axi4_slave_wvalid = fabric_2x3$v_to_slaves_2_wvalid ;
  assign plic$set_addr_map_addr_base = soc_map$m_plic_addr_base ;
  assign plic$set_addr_map_addr_lim = soc_map$m_plic_addr_lim ;
  assign plic$set_verbosity_verbosity = 4'h0 ;
  assign plic$v_sources_0_m_interrupt_req_set_not_clear =
	     core_external_interrupt_sources_0_m_interrupt_req_set_not_clear ;
  assign plic$v_sources_10_m_interrupt_req_set_not_clear =
	     core_external_interrupt_sources_10_m_interrupt_req_set_not_clear ;
  assign plic$v_sources_11_m_interrupt_req_set_not_clear =
	     core_external_interrupt_sources_11_m_interrupt_req_set_not_clear ;
  assign plic$v_sources_12_m_interrupt_req_set_not_clear =
	     core_external_interrupt_sources_12_m_interrupt_req_set_not_clear ;
  assign plic$v_sources_13_m_interrupt_req_set_not_clear =
	     core_external_interrupt_sources_13_m_interrupt_req_set_not_clear ;
  assign plic$v_sources_14_m_interrupt_req_set_not_clear =
	     core_external_interrupt_sources_14_m_interrupt_req_set_not_clear ;
  assign plic$v_sources_15_m_interrupt_req_set_not_clear =
	     core_external_interrupt_sources_15_m_interrupt_req_set_not_clear ;
  assign plic$v_sources_1_m_interrupt_req_set_not_clear =
	     core_external_interrupt_sources_1_m_interrupt_req_set_not_clear ;
  assign plic$v_sources_2_m_interrupt_req_set_not_clear =
	     core_external_interrupt_sources_2_m_interrupt_req_set_not_clear ;
  assign plic$v_sources_3_m_interrupt_req_set_not_clear =
	     core_external_interrupt_sources_3_m_interrupt_req_set_not_clear ;
  assign plic$v_sources_4_m_interrupt_req_set_not_clear =
	     core_external_interrupt_sources_4_m_interrupt_req_set_not_clear ;
  assign plic$v_sources_5_m_interrupt_req_set_not_clear =
	     core_external_interrupt_sources_5_m_interrupt_req_set_not_clear ;
  assign plic$v_sources_6_m_interrupt_req_set_not_clear =
	     core_external_interrupt_sources_6_m_interrupt_req_set_not_clear ;
  assign plic$v_sources_7_m_interrupt_req_set_not_clear =
	     core_external_interrupt_sources_7_m_interrupt_req_set_not_clear ;
  assign plic$v_sources_8_m_interrupt_req_set_not_clear =
	     core_external_interrupt_sources_8_m_interrupt_req_set_not_clear ;
  assign plic$v_sources_9_m_interrupt_req_set_not_clear =
	     core_external_interrupt_sources_9_m_interrupt_req_set_not_clear ;
  assign plic$EN_set_verbosity = 1'b0 ;
  assign plic$EN_show_PLIC_state = 1'b0 ;
  assign plic$EN_server_reset_request_put =
	     CAN_FIRE_RL_rl_cpu_hart0_reset_from_soc_start ;
  assign plic$EN_server_reset_response_get =
	     CAN_FIRE_RL_rl_cpu_hart0_reset_complete ;
  assign plic$EN_set_addr_map = CAN_FIRE_RL_rl_cpu_hart0_reset_complete ;
  // submodule soc_map
  assign soc_map$m_is_IO_addr_addr = 64'h0 ;
  assign soc_map$m_is_mem_addr_addr = 64'h0 ;
  assign soc_map$m_is_near_mem_IO_addr_addr = 64'h0 ;
  // remaining internal signals
  assign plic_RDY_server_reset_request_put_AND_fabric_2_ETC___d8 =
	     plic$RDY_server_reset_request_put && fabric_2x3$RDY_reset &&
	     cpu$RDY_hart0_server_reset_request_put &&
	     f_reset_reqs$EMPTY_N ;
  // handling of system tasks
  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cpu_hart0_reset_from_soc_start)
	begin
	  v__h4255 = $stime;
	  #0;
	end
    v__h4249 = v__h4255 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cpu_hart0_reset_from_soc_start)
	$display("%0d: Core.rl_cpu_hart0_reset_from_soc_start", v__h4249);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cpu_hart0_reset_complete)
	begin
	  v__h4496 = $stime;
	  #0;
	end
    v__h4490 = v__h4496 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cpu_hart0_reset_complete)
	$display("%0d: Core.rl_cpu_hart0_reset_complete", v__h4490);
  end
  // synopsys translate_on
endmodule