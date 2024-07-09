module outputs
  wire [511 : 0] dma_server_rdata;
  wire [63 : 0] core_mem_master_araddr,
		core_mem_master_awaddr,
		core_mem_master_wdata,
		cpu_imem_master_araddr,
		cpu_imem_master_awaddr,
		cpu_imem_master_wdata,
		mv_tohost_value;
  wire [15 : 0] core_mem_master_arid,
		core_mem_master_awid,
		cpu_imem_master_arid,
		cpu_imem_master_awid,
		dma_server_bid,
		dma_server_rid;
  wire [7 : 0] core_mem_master_arlen,
	       core_mem_master_awlen,
	       core_mem_master_wstrb,
	       cpu_imem_master_arlen,
	       cpu_imem_master_awlen,
	       cpu_imem_master_wstrb,
	       mv_status;
  wire [3 : 0] core_mem_master_arcache,
	       core_mem_master_arqos,
	       core_mem_master_arregion,
	       core_mem_master_awcache,
	       core_mem_master_awqos,
	       core_mem_master_awregion,
	       cpu_imem_master_arcache,
	       cpu_imem_master_arqos,
	       cpu_imem_master_arregion,
	       cpu_imem_master_awcache,
	       cpu_imem_master_awqos,
	       cpu_imem_master_awregion;
  wire [2 : 0] core_mem_master_arprot,
	       core_mem_master_arsize,
	       core_mem_master_awprot,
	       core_mem_master_awsize,
	       cpu_imem_master_arprot,
	       cpu_imem_master_arsize,
	       cpu_imem_master_awprot,
	       cpu_imem_master_awsize;
  wire [1 : 0] core_mem_master_arburst,
	       core_mem_master_awburst,
	       cpu_imem_master_arburst,
	       cpu_imem_master_awburst,
	       dma_server_bresp,
	       dma_server_rresp;
  wire RDY_cpu_reset_server_request_put,
       RDY_cpu_reset_server_response_get,
       RDY_ma_ddr4_ready,
       RDY_mv_tohost_value,
       RDY_set_verbosity,
       RDY_set_watch_tohost,
       core_mem_master_arlock,
       core_mem_master_arvalid,
       core_mem_master_awlock,
       core_mem_master_awvalid,
       core_mem_master_bready,
       core_mem_master_rready,
       core_mem_master_wlast,
       core_mem_master_wvalid,
       cpu_imem_master_arlock,
       cpu_imem_master_arvalid,
       cpu_imem_master_awlock,
       cpu_imem_master_awvalid,
       cpu_imem_master_bready,
       cpu_imem_master_rready,
       cpu_imem_master_wlast,
       cpu_imem_master_wvalid,
       cpu_reset_server_response_get,
       dma_server_arready,
       dma_server_awready,
       dma_server_bvalid,
       dma_server_rlast,
       dma_server_rvalid,
       dma_server_wready;
  // ports of submodule cpu
  wire [511 : 0] cpu$dma_server_rdata, cpu$dma_server_wdata;
  wire [63 : 0] cpu$dma_server_araddr,
		cpu$dma_server_awaddr,
		cpu$dma_server_wstrb,
		cpu$imem_master_araddr,
		cpu$imem_master_awaddr,
		cpu$imem_master_rdata,
		cpu$imem_master_wdata,
		cpu$mem_master_araddr,
		cpu$mem_master_awaddr,
		cpu$mem_master_rdata,
		cpu$mem_master_wdata,
		cpu$mv_tohost_value,
		cpu$set_verbosity_logdelay,
		cpu$set_watch_tohost_tohost_addr;
  wire [15 : 0] cpu$dma_server_arid,
		cpu$dma_server_awid,
		cpu$dma_server_bid,
		cpu$dma_server_rid,
		cpu$imem_master_arid,
		cpu$imem_master_awid,
		cpu$imem_master_bid,
		cpu$imem_master_rid,
		cpu$mem_master_arid,
		cpu$mem_master_awid,
		cpu$mem_master_bid,
		cpu$mem_master_rid;
  wire [7 : 0] cpu$dma_server_arlen,
	       cpu$dma_server_awlen,
	       cpu$imem_master_arlen,
	       cpu$imem_master_awlen,
	       cpu$imem_master_wstrb,
	       cpu$mem_master_arlen,
	       cpu$mem_master_awlen,
	       cpu$mem_master_wstrb,
	       cpu$mv_status;
  wire [3 : 0] cpu$dma_server_arcache,
	       cpu$dma_server_arqos,
	       cpu$dma_server_arregion,
	       cpu$dma_server_awcache,
	       cpu$dma_server_awqos,
	       cpu$dma_server_awregion,
	       cpu$imem_master_arcache,
	       cpu$imem_master_arqos,
	       cpu$imem_master_arregion,
	       cpu$imem_master_awcache,
	       cpu$imem_master_awqos,
	       cpu$imem_master_awregion,
	       cpu$mem_master_arcache,
	       cpu$mem_master_arqos,
	       cpu$mem_master_arregion,
	       cpu$mem_master_awcache,
	       cpu$mem_master_awqos,
	       cpu$mem_master_awregion,
	       cpu$set_verbosity_verbosity;
  wire [2 : 0] cpu$dma_server_arprot,
	       cpu$dma_server_arsize,
	       cpu$dma_server_awprot,
	       cpu$dma_server_awsize,
	       cpu$imem_master_arprot,
	       cpu$imem_master_arsize,
	       cpu$imem_master_awprot,
	       cpu$imem_master_awsize,
	       cpu$mem_master_arprot,
	       cpu$mem_master_arsize,
	       cpu$mem_master_awprot,
	       cpu$mem_master_awsize;
  wire [1 : 0] cpu$dma_server_arburst,
	       cpu$dma_server_awburst,
	       cpu$dma_server_bresp,
	       cpu$dma_server_rresp,
	       cpu$imem_master_arburst,
	       cpu$imem_master_awburst,
	       cpu$imem_master_bresp,
	       cpu$imem_master_rresp,
	       cpu$mem_master_arburst,
	       cpu$mem_master_awburst,
	       cpu$mem_master_bresp,
	       cpu$mem_master_rresp;
  wire cpu$EN_hart0_server_reset_request_put,
       cpu$EN_hart0_server_reset_response_get,
       cpu$EN_ma_ddr4_ready,
       cpu$EN_set_verbosity,
       cpu$EN_set_watch_tohost,
       cpu$RDY_hart0_server_reset_request_put,
       cpu$RDY_hart0_server_reset_response_get,
       cpu$dma_server_arlock,
       cpu$dma_server_arready,
       cpu$dma_server_arvalid,
       cpu$dma_server_awlock,
       cpu$dma_server_awready,
       cpu$dma_server_awvalid,
       cpu$dma_server_bready,
       cpu$dma_server_bvalid,
       cpu$dma_server_rlast,
       cpu$dma_server_rready,
       cpu$dma_server_rvalid,
       cpu$dma_server_wlast,
       cpu$dma_server_wready,
       cpu$dma_server_wvalid,
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
       cpu$mem_master_arlock,
       cpu$mem_master_arready,
       cpu$mem_master_arvalid,
       cpu$mem_master_awlock,
       cpu$mem_master_awready,
       cpu$mem_master_awvalid,
       cpu$mem_master_bready,
       cpu$mem_master_bvalid,
       cpu$mem_master_rlast,
       cpu$mem_master_rready,
       cpu$mem_master_rvalid,
       cpu$mem_master_wlast,
       cpu$mem_master_wready,
       cpu$mem_master_wvalid,
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
  // ports of submodule fabric_1x3
  wire [63 : 0] fabric_1x3$v_from_masters_0_araddr,
		fabric_1x3$v_from_masters_0_awaddr,
		fabric_1x3$v_from_masters_0_rdata,
		fabric_1x3$v_from_masters_0_wdata,
		fabric_1x3$v_to_slaves_0_araddr,
		fabric_1x3$v_to_slaves_0_awaddr,
		fabric_1x3$v_to_slaves_0_rdata,
		fabric_1x3$v_to_slaves_0_wdata,
		fabric_1x3$v_to_slaves_1_araddr,
		fabric_1x3$v_to_slaves_1_awaddr,
		fabric_1x3$v_to_slaves_1_rdata,
		fabric_1x3$v_to_slaves_1_wdata,
		fabric_1x3$v_to_slaves_2_araddr,
		fabric_1x3$v_to_slaves_2_awaddr,
		fabric_1x3$v_to_slaves_2_rdata,
		fabric_1x3$v_to_slaves_2_wdata;
  wire [15 : 0] fabric_1x3$v_from_masters_0_arid,
		fabric_1x3$v_from_masters_0_awid,
		fabric_1x3$v_from_masters_0_bid,
		fabric_1x3$v_from_masters_0_rid,
		fabric_1x3$v_to_slaves_0_arid,
		fabric_1x3$v_to_slaves_0_awid,
		fabric_1x3$v_to_slaves_0_bid,
		fabric_1x3$v_to_slaves_0_rid,
		fabric_1x3$v_to_slaves_1_arid,
		fabric_1x3$v_to_slaves_1_awid,
		fabric_1x3$v_to_slaves_1_bid,
		fabric_1x3$v_to_slaves_1_rid,
		fabric_1x3$v_to_slaves_2_arid,
		fabric_1x3$v_to_slaves_2_awid,
		fabric_1x3$v_to_slaves_2_bid,
		fabric_1x3$v_to_slaves_2_rid;
  wire [7 : 0] fabric_1x3$v_from_masters_0_arlen,
	       fabric_1x3$v_from_masters_0_awlen,
	       fabric_1x3$v_from_masters_0_wstrb,
	       fabric_1x3$v_to_slaves_0_arlen,
	       fabric_1x3$v_to_slaves_0_awlen,
	       fabric_1x3$v_to_slaves_0_wstrb,
	       fabric_1x3$v_to_slaves_1_arlen,
	       fabric_1x3$v_to_slaves_1_awlen,
	       fabric_1x3$v_to_slaves_1_wstrb,
	       fabric_1x3$v_to_slaves_2_arlen,
	       fabric_1x3$v_to_slaves_2_awlen,
	       fabric_1x3$v_to_slaves_2_wstrb;
  wire [3 : 0] fabric_1x3$set_verbosity_verbosity,
	       fabric_1x3$v_from_masters_0_arcache,
	       fabric_1x3$v_from_masters_0_arqos,
	       fabric_1x3$v_from_masters_0_arregion,
	       fabric_1x3$v_from_masters_0_awcache,
	       fabric_1x3$v_from_masters_0_awqos,
	       fabric_1x3$v_from_masters_0_awregion,
	       fabric_1x3$v_to_slaves_0_arcache,
	       fabric_1x3$v_to_slaves_0_arqos,
	       fabric_1x3$v_to_slaves_0_arregion,
	       fabric_1x3$v_to_slaves_0_awcache,
	       fabric_1x3$v_to_slaves_0_awqos,
	       fabric_1x3$v_to_slaves_0_awregion,
	       fabric_1x3$v_to_slaves_1_arcache,
	       fabric_1x3$v_to_slaves_1_arqos,
	       fabric_1x3$v_to_slaves_1_arregion,
	       fabric_1x3$v_to_slaves_1_awcache,
	       fabric_1x3$v_to_slaves_1_awqos,
	       fabric_1x3$v_to_slaves_1_awregion,
	       fabric_1x3$v_to_slaves_2_arcache,
	       fabric_1x3$v_to_slaves_2_arqos,
	       fabric_1x3$v_to_slaves_2_arregion,
	       fabric_1x3$v_to_slaves_2_awcache,
	       fabric_1x3$v_to_slaves_2_awqos,
	       fabric_1x3$v_to_slaves_2_awregion;
  wire [2 : 0] fabric_1x3$v_from_masters_0_arprot,
	       fabric_1x3$v_from_masters_0_arsize,
	       fabric_1x3$v_from_masters_0_awprot,
	       fabric_1x3$v_from_masters_0_awsize,
	       fabric_1x3$v_to_slaves_0_arprot,
	       fabric_1x3$v_to_slaves_0_arsize,
	       fabric_1x3$v_to_slaves_0_awprot,
	       fabric_1x3$v_to_slaves_0_awsize,
	       fabric_1x3$v_to_slaves_1_arprot,
	       fabric_1x3$v_to_slaves_1_arsize,
	       fabric_1x3$v_to_slaves_1_awprot,
	       fabric_1x3$v_to_slaves_1_awsize,
	       fabric_1x3$v_to_slaves_2_arprot,
	       fabric_1x3$v_to_slaves_2_arsize,
	       fabric_1x3$v_to_slaves_2_awprot,
	       fabric_1x3$v_to_slaves_2_awsize;
  wire [1 : 0] fabric_1x3$v_from_masters_0_arburst,
	       fabric_1x3$v_from_masters_0_awburst,
	       fabric_1x3$v_from_masters_0_bresp,
	       fabric_1x3$v_from_masters_0_rresp,
	       fabric_1x3$v_to_slaves_0_arburst,
	       fabric_1x3$v_to_slaves_0_awburst,
	       fabric_1x3$v_to_slaves_0_bresp,
	       fabric_1x3$v_to_slaves_0_rresp,
	       fabric_1x3$v_to_slaves_1_arburst,
	       fabric_1x3$v_to_slaves_1_awburst,
	       fabric_1x3$v_to_slaves_1_bresp,
	       fabric_1x3$v_to_slaves_1_rresp,
	       fabric_1x3$v_to_slaves_2_arburst,
	       fabric_1x3$v_to_slaves_2_awburst,
	       fabric_1x3$v_to_slaves_2_bresp,
	       fabric_1x3$v_to_slaves_2_rresp;
  wire fabric_1x3$EN_reset,
       fabric_1x3$EN_set_verbosity,
       fabric_1x3$RDY_reset,
       fabric_1x3$v_from_masters_0_arlock,
       fabric_1x3$v_from_masters_0_arready,
       fabric_1x3$v_from_masters_0_arvalid,
       fabric_1x3$v_from_masters_0_awlock,
       fabric_1x3$v_from_masters_0_awready,
       fabric_1x3$v_from_masters_0_awvalid,
       fabric_1x3$v_from_masters_0_bready,
       fabric_1x3$v_from_masters_0_bvalid,
       fabric_1x3$v_from_masters_0_rlast,
       fabric_1x3$v_from_masters_0_rready,
       fabric_1x3$v_from_masters_0_rvalid,
       fabric_1x3$v_from_masters_0_wlast,
       fabric_1x3$v_from_masters_0_wready,
       fabric_1x3$v_from_masters_0_wvalid,
       fabric_1x3$v_to_slaves_0_arlock,
       fabric_1x3$v_to_slaves_0_arready,
       fabric_1x3$v_to_slaves_0_arvalid,
       fabric_1x3$v_to_slaves_0_awlock,
       fabric_1x3$v_to_slaves_0_awready,
       fabric_1x3$v_to_slaves_0_awvalid,
       fabric_1x3$v_to_slaves_0_bready,
       fabric_1x3$v_to_slaves_0_bvalid,
       fabric_1x3$v_to_slaves_0_rlast,
       fabric_1x3$v_to_slaves_0_rready,
       fabric_1x3$v_to_slaves_0_rvalid,
       fabric_1x3$v_to_slaves_0_wlast,
       fabric_1x3$v_to_slaves_0_wready,
       fabric_1x3$v_to_slaves_0_wvalid,
       fabric_1x3$v_to_slaves_1_arlock,
       fabric_1x3$v_to_slaves_1_arready,
       fabric_1x3$v_to_slaves_1_arvalid,
       fabric_1x3$v_to_slaves_1_awlock,
       fabric_1x3$v_to_slaves_1_awready,
       fabric_1x3$v_to_slaves_1_awvalid,
       fabric_1x3$v_to_slaves_1_bready,
       fabric_1x3$v_to_slaves_1_bvalid,
       fabric_1x3$v_to_slaves_1_rlast,
       fabric_1x3$v_to_slaves_1_rready,
       fabric_1x3$v_to_slaves_1_rvalid,
       fabric_1x3$v_to_slaves_1_wlast,
       fabric_1x3$v_to_slaves_1_wready,
       fabric_1x3$v_to_slaves_1_wvalid,
       fabric_1x3$v_to_slaves_2_arlock,
       fabric_1x3$v_to_slaves_2_arready,
       fabric_1x3$v_to_slaves_2_arvalid,
       fabric_1x3$v_to_slaves_2_awlock,
       fabric_1x3$v_to_slaves_2_awready,
       fabric_1x3$v_to_slaves_2_awvalid,
       fabric_1x3$v_to_slaves_2_bready,
       fabric_1x3$v_to_slaves_2_bvalid,
       fabric_1x3$v_to_slaves_2_rlast,
       fabric_1x3$v_to_slaves_2_rready,
       fabric_1x3$v_to_slaves_2_rvalid,
       fabric_1x3$v_to_slaves_2_wlast,
       fabric_1x3$v_to_slaves_2_wready,
       fabric_1x3$v_to_slaves_2_wvalid;
  // ports of submodule near_mem_io
  wire [63 : 0] near_mem_io$axi4_slave_araddr,
		near_mem_io$axi4_slave_awaddr,
		near_mem_io$axi4_slave_rdata,
		near_mem_io$axi4_slave_wdata,
		near_mem_io$set_addr_map_addr_base,
		near_mem_io$set_addr_map_addr_lim;
  wire [15 : 0] near_mem_io$axi4_slave_arid,
		near_mem_io$axi4_slave_awid,
		near_mem_io$axi4_slave_bid,
		near_mem_io$axi4_slave_rid;
  wire [7 : 0] near_mem_io$axi4_slave_arlen,
	       near_mem_io$axi4_slave_awlen,
	       near_mem_io$axi4_slave_wstrb;
  wire [3 : 0] near_mem_io$axi4_slave_arcache,
	       near_mem_io$axi4_slave_arqos,
	       near_mem_io$axi4_slave_arregion,
	       near_mem_io$axi4_slave_awcache,
	       near_mem_io$axi4_slave_awqos,
	       near_mem_io$axi4_slave_awregion;
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
       near_mem_io$RDY_set_addr_map,
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
  wire [15 : 0] plic$axi4_slave_arid,
		plic$axi4_slave_awid,
		plic$axi4_slave_bid,
		plic$axi4_slave_rid;
  wire [7 : 0] plic$axi4_slave_arlen,
	       plic$axi4_slave_awlen,
	       plic$axi4_slave_wstrb;
  wire [3 : 0] plic$axi4_slave_arcache,
	       plic$axi4_slave_arqos,
	       plic$axi4_slave_arregion,
	       plic$axi4_slave_awcache,
	       plic$axi4_slave_awqos,
	       plic$axi4_slave_awregion,
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
  // rule scheduling signals
  wire CAN_FIRE_RL_rl_cpu_hart0_reset_complete,
       CAN_FIRE_RL_rl_cpu_hart0_reset_from_soc_start,
       CAN_FIRE_RL_rl_rd_addr_channel,
       CAN_FIRE_RL_rl_rd_addr_channel_1,
       CAN_FIRE_RL_rl_rd_addr_channel_2,
       CAN_FIRE_RL_rl_rd_data_channel,
       CAN_FIRE_RL_rl_rd_data_channel_1,
       CAN_FIRE_RL_rl_rd_data_channel_2,
       CAN_FIRE_RL_rl_relay_external_interrupts,
       CAN_FIRE_RL_rl_relay_sw_interrupts,
       CAN_FIRE_RL_rl_relay_timer_interrupts,
       CAN_FIRE_RL_rl_wr_addr_channel,
       CAN_FIRE_RL_rl_wr_addr_channel_1,
       CAN_FIRE_RL_rl_wr_addr_channel_2,
       CAN_FIRE_RL_rl_wr_data_channel,
       CAN_FIRE_RL_rl_wr_data_channel_1,
       CAN_FIRE_RL_rl_wr_data_channel_2,
       CAN_FIRE_RL_rl_wr_response_channel,
       CAN_FIRE_RL_rl_wr_response_channel_1,
       CAN_FIRE_RL_rl_wr_response_channel_2,
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
       CAN_FIRE_core_mem_master_m_arready,
       CAN_FIRE_core_mem_master_m_awready,
       CAN_FIRE_core_mem_master_m_bvalid,
       CAN_FIRE_core_mem_master_m_rvalid,
       CAN_FIRE_core_mem_master_m_wready,
       CAN_FIRE_cpu_imem_master_m_arready,
       CAN_FIRE_cpu_imem_master_m_awready,
       CAN_FIRE_cpu_imem_master_m_bvalid,
       CAN_FIRE_cpu_imem_master_m_rvalid,
       CAN_FIRE_cpu_imem_master_m_wready,
       CAN_FIRE_cpu_reset_server_request_put,
       CAN_FIRE_cpu_reset_server_response_get,
       CAN_FIRE_dma_server_m_arvalid,
       CAN_FIRE_dma_server_m_awvalid,
       CAN_FIRE_dma_server_m_bready,
       CAN_FIRE_dma_server_m_rready,
       CAN_FIRE_dma_server_m_wvalid,
       CAN_FIRE_ma_ddr4_ready,
       CAN_FIRE_nmi_req,
       CAN_FIRE_set_verbosity,
       CAN_FIRE_set_watch_tohost,
       WILL_FIRE_RL_rl_cpu_hart0_reset_complete,
       WILL_FIRE_RL_rl_cpu_hart0_reset_from_soc_start,
       WILL_FIRE_RL_rl_rd_addr_channel,
       WILL_FIRE_RL_rl_rd_addr_channel_1,
       WILL_FIRE_RL_rl_rd_addr_channel_2,
       WILL_FIRE_RL_rl_rd_data_channel,
       WILL_FIRE_RL_rl_rd_data_channel_1,
       WILL_FIRE_RL_rl_rd_data_channel_2,
       WILL_FIRE_RL_rl_relay_external_interrupts,
       WILL_FIRE_RL_rl_relay_sw_interrupts,
       WILL_FIRE_RL_rl_relay_timer_interrupts,
       WILL_FIRE_RL_rl_wr_addr_channel,
       WILL_FIRE_RL_rl_wr_addr_channel_1,
       WILL_FIRE_RL_rl_wr_addr_channel_2,
       WILL_FIRE_RL_rl_wr_data_channel,
       WILL_FIRE_RL_rl_wr_data_channel_1,
       WILL_FIRE_RL_rl_wr_data_channel_2,
       WILL_FIRE_RL_rl_wr_response_channel,
       WILL_FIRE_RL_rl_wr_response_channel_1,
       WILL_FIRE_RL_rl_wr_response_channel_2,
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
       WILL_FIRE_core_mem_master_m_arready,
       WILL_FIRE_core_mem_master_m_awready,
       WILL_FIRE_core_mem_master_m_bvalid,
       WILL_FIRE_core_mem_master_m_rvalid,
       WILL_FIRE_core_mem_master_m_wready,
       WILL_FIRE_cpu_imem_master_m_arready,
       WILL_FIRE_cpu_imem_master_m_awready,
       WILL_FIRE_cpu_imem_master_m_bvalid,
       WILL_FIRE_cpu_imem_master_m_rvalid,
       WILL_FIRE_cpu_imem_master_m_wready,
       WILL_FIRE_cpu_reset_server_request_put,
       WILL_FIRE_cpu_reset_server_response_get,
       WILL_FIRE_dma_server_m_arvalid,
       WILL_FIRE_dma_server_m_awvalid,
       WILL_FIRE_dma_server_m_bready,
       WILL_FIRE_dma_server_m_rready,
       WILL_FIRE_dma_server_m_wvalid,
       WILL_FIRE_ma_ddr4_ready,
       WILL_FIRE_nmi_req,
       WILL_FIRE_set_verbosity,
       WILL_FIRE_set_watch_tohost;
  // declarations used by system tasks
  // synopsys translate_off
  reg [31 : 0] v__h4222;
  reg [31 : 0] v__h4020;
  reg [31 : 0] v__h4014;
  reg [31 : 0] v__h4216;
  // synopsys translate_on
  // remaining internal signals
  wire near_mem_io_RDY_server_reset_response_get__4_A_ETC___d20,
       plic_RDY_server_reset_request_put_AND_fabric_1_ETC___d8;
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
  assign cpu_imem_master_awvalid = fabric_1x3$v_to_slaves_0_awvalid ;
  // value method cpu_imem_master_m_awid
  assign cpu_imem_master_awid = fabric_1x3$v_to_slaves_0_awid ;
  // value method cpu_imem_master_m_awaddr
  assign cpu_imem_master_awaddr = fabric_1x3$v_to_slaves_0_awaddr ;
  // value method cpu_imem_master_m_awlen
  assign cpu_imem_master_awlen = fabric_1x3$v_to_slaves_0_awlen ;
  // value method cpu_imem_master_m_awsize
  assign cpu_imem_master_awsize = fabric_1x3$v_to_slaves_0_awsize ;
  // value method cpu_imem_master_m_awburst
  assign cpu_imem_master_awburst = fabric_1x3$v_to_slaves_0_awburst ;
  // value method cpu_imem_master_m_awlock
  assign cpu_imem_master_awlock = fabric_1x3$v_to_slaves_0_awlock ;
  // value method cpu_imem_master_m_awcache
  assign cpu_imem_master_awcache = fabric_1x3$v_to_slaves_0_awcache ;
  // value method cpu_imem_master_m_awprot
  assign cpu_imem_master_awprot = fabric_1x3$v_to_slaves_0_awprot ;
  // value method cpu_imem_master_m_awqos
  assign cpu_imem_master_awqos = fabric_1x3$v_to_slaves_0_awqos ;
  // value method cpu_imem_master_m_awregion
  assign cpu_imem_master_awregion = fabric_1x3$v_to_slaves_0_awregion ;
  // action method cpu_imem_master_m_awready
  assign CAN_FIRE_cpu_imem_master_m_awready = 1'd1 ;
  assign WILL_FIRE_cpu_imem_master_m_awready = 1'd1 ;
  // value method cpu_imem_master_m_wvalid
  assign cpu_imem_master_wvalid = fabric_1x3$v_to_slaves_0_wvalid ;
  // value method cpu_imem_master_m_wdata
  assign cpu_imem_master_wdata = fabric_1x3$v_to_slaves_0_wdata ;
  // value method cpu_imem_master_m_wstrb
  assign cpu_imem_master_wstrb = fabric_1x3$v_to_slaves_0_wstrb ;
  // value method cpu_imem_master_m_wlast
  assign cpu_imem_master_wlast = fabric_1x3$v_to_slaves_0_wlast ;
  // action method cpu_imem_master_m_wready
  assign CAN_FIRE_cpu_imem_master_m_wready = 1'd1 ;
  assign WILL_FIRE_cpu_imem_master_m_wready = 1'd1 ;
  // action method cpu_imem_master_m_bvalid
  assign CAN_FIRE_cpu_imem_master_m_bvalid = 1'd1 ;
  assign WILL_FIRE_cpu_imem_master_m_bvalid = 1'd1 ;
  // value method cpu_imem_master_m_bready
  assign cpu_imem_master_bready = fabric_1x3$v_to_slaves_0_bready ;
  // value method cpu_imem_master_m_arvalid
  assign cpu_imem_master_arvalid = fabric_1x3$v_to_slaves_0_arvalid ;
  // value method cpu_imem_master_m_arid
  assign cpu_imem_master_arid = fabric_1x3$v_to_slaves_0_arid ;
  // value method cpu_imem_master_m_araddr
  assign cpu_imem_master_araddr = fabric_1x3$v_to_slaves_0_araddr ;
  // value method cpu_imem_master_m_arlen
  assign cpu_imem_master_arlen = fabric_1x3$v_to_slaves_0_arlen ;
  // value method cpu_imem_master_m_arsize
  assign cpu_imem_master_arsize = fabric_1x3$v_to_slaves_0_arsize ;
  // value method cpu_imem_master_m_arburst
  assign cpu_imem_master_arburst = fabric_1x3$v_to_slaves_0_arburst ;
  // value method cpu_imem_master_m_arlock
  assign cpu_imem_master_arlock = fabric_1x3$v_to_slaves_0_arlock ;
  // value method cpu_imem_master_m_arcache
  assign cpu_imem_master_arcache = fabric_1x3$v_to_slaves_0_arcache ;
  // value method cpu_imem_master_m_arprot
  assign cpu_imem_master_arprot = fabric_1x3$v_to_slaves_0_arprot ;
  // value method cpu_imem_master_m_arqos
  assign cpu_imem_master_arqos = fabric_1x3$v_to_slaves_0_arqos ;
  // value method cpu_imem_master_m_arregion
  assign cpu_imem_master_arregion = fabric_1x3$v_to_slaves_0_arregion ;
  // action method cpu_imem_master_m_arready
  assign CAN_FIRE_cpu_imem_master_m_arready = 1'd1 ;
  assign WILL_FIRE_cpu_imem_master_m_arready = 1'd1 ;
  // action method cpu_imem_master_m_rvalid
  assign CAN_FIRE_cpu_imem_master_m_rvalid = 1'd1 ;
  assign WILL_FIRE_cpu_imem_master_m_rvalid = 1'd1 ;
  // value method cpu_imem_master_m_rready
  assign cpu_imem_master_rready = fabric_1x3$v_to_slaves_0_rready ;
  // value method core_mem_master_m_awvalid
  assign core_mem_master_awvalid = cpu$mem_master_awvalid ;
  // value method core_mem_master_m_awid
  assign core_mem_master_awid = cpu$mem_master_awid ;
  // value method core_mem_master_m_awaddr
  assign core_mem_master_awaddr = cpu$mem_master_awaddr ;
  // value method core_mem_master_m_awlen
  assign core_mem_master_awlen = cpu$mem_master_awlen ;
  // value method core_mem_master_m_awsize
  assign core_mem_master_awsize = cpu$mem_master_awsize ;
  // value method core_mem_master_m_awburst
  assign core_mem_master_awburst = cpu$mem_master_awburst ;
  // value method core_mem_master_m_awlock
  assign core_mem_master_awlock = cpu$mem_master_awlock ;
  // value method core_mem_master_m_awcache
  assign core_mem_master_awcache = cpu$mem_master_awcache ;
  // value method core_mem_master_m_awprot
  assign core_mem_master_awprot = cpu$mem_master_awprot ;
  // value method core_mem_master_m_awqos
  assign core_mem_master_awqos = cpu$mem_master_awqos ;
  // value method core_mem_master_m_awregion
  assign core_mem_master_awregion = cpu$mem_master_awregion ;
  // action method core_mem_master_m_awready
  assign CAN_FIRE_core_mem_master_m_awready = 1'd1 ;
  assign WILL_FIRE_core_mem_master_m_awready = 1'd1 ;
  // value method core_mem_master_m_wvalid
  assign core_mem_master_wvalid = cpu$mem_master_wvalid ;
  // value method core_mem_master_m_wdata
  assign core_mem_master_wdata = cpu$mem_master_wdata ;
  // value method core_mem_master_m_wstrb
  assign core_mem_master_wstrb = cpu$mem_master_wstrb ;
  // value method core_mem_master_m_wlast
  assign core_mem_master_wlast = cpu$mem_master_wlast ;
  // action method core_mem_master_m_wready
  assign CAN_FIRE_core_mem_master_m_wready = 1'd1 ;
  assign WILL_FIRE_core_mem_master_m_wready = 1'd1 ;
  // action method core_mem_master_m_bvalid
  assign CAN_FIRE_core_mem_master_m_bvalid = 1'd1 ;
  assign WILL_FIRE_core_mem_master_m_bvalid = 1'd1 ;
  // value method core_mem_master_m_bready
  assign core_mem_master_bready = cpu$mem_master_bready ;
  // value method core_mem_master_m_arvalid
  assign core_mem_master_arvalid = cpu$mem_master_arvalid ;
  // value method core_mem_master_m_arid
  assign core_mem_master_arid = cpu$mem_master_arid ;
  // value method core_mem_master_m_araddr
  assign core_mem_master_araddr = cpu$mem_master_araddr ;
  // value method core_mem_master_m_arlen
  assign core_mem_master_arlen = cpu$mem_master_arlen ;
  // value method core_mem_master_m_arsize
  assign core_mem_master_arsize = cpu$mem_master_arsize ;
  // value method core_mem_master_m_arburst
  assign core_mem_master_arburst = cpu$mem_master_arburst ;
  // value method core_mem_master_m_arlock
  assign core_mem_master_arlock = cpu$mem_master_arlock ;
  // value method core_mem_master_m_arcache
  assign core_mem_master_arcache = cpu$mem_master_arcache ;
  // value method core_mem_master_m_arprot
  assign core_mem_master_arprot = cpu$mem_master_arprot ;
  // value method core_mem_master_m_arqos
  assign core_mem_master_arqos = cpu$mem_master_arqos ;
  // value method core_mem_master_m_arregion
  assign core_mem_master_arregion = cpu$mem_master_arregion ;
  // action method core_mem_master_m_arready
  assign CAN_FIRE_core_mem_master_m_arready = 1'd1 ;
  assign WILL_FIRE_core_mem_master_m_arready = 1'd1 ;
  // action method core_mem_master_m_rvalid
  assign CAN_FIRE_core_mem_master_m_rvalid = 1'd1 ;
  assign WILL_FIRE_core_mem_master_m_rvalid = 1'd1 ;
  // value method core_mem_master_m_rready
  assign core_mem_master_rready = cpu$mem_master_rready ;
  // action method dma_server_m_awvalid
  assign CAN_FIRE_dma_server_m_awvalid = 1'd1 ;
  assign WILL_FIRE_dma_server_m_awvalid = 1'd1 ;
  // value method dma_server_m_awready
  assign dma_server_awready = cpu$dma_server_awready ;
  // action method dma_server_m_wvalid
  assign CAN_FIRE_dma_server_m_wvalid = 1'd1 ;
  assign WILL_FIRE_dma_server_m_wvalid = 1'd1 ;
  // value method dma_server_m_wready
  assign dma_server_wready = cpu$dma_server_wready ;
  // value method dma_server_m_bvalid
  assign dma_server_bvalid = cpu$dma_server_bvalid ;
  // value method dma_server_m_bid
  assign dma_server_bid = cpu$dma_server_bid ;
  // value method dma_server_m_bresp
  assign dma_server_bresp = cpu$dma_server_bresp ;
  // action method dma_server_m_bready
  assign CAN_FIRE_dma_server_m_bready = 1'd1 ;
  assign WILL_FIRE_dma_server_m_bready = 1'd1 ;
  // action method dma_server_m_arvalid
  assign CAN_FIRE_dma_server_m_arvalid = 1'd1 ;
  assign WILL_FIRE_dma_server_m_arvalid = 1'd1 ;
  // value method dma_server_m_arready
  assign dma_server_arready = cpu$dma_server_arready ;
  // value method dma_server_m_rvalid
  assign dma_server_rvalid = cpu$dma_server_rvalid ;
  // value method dma_server_m_rid
  assign dma_server_rid = cpu$dma_server_rid ;
  // value method dma_server_m_rdata
  assign dma_server_rdata = cpu$dma_server_rdata ;
  // value method dma_server_m_rresp
  assign dma_server_rresp = cpu$dma_server_rresp ;
  // value method dma_server_m_rlast
  assign dma_server_rlast = cpu$dma_server_rlast ;
  // action method dma_server_m_rready
  assign CAN_FIRE_dma_server_m_rready = 1'd1 ;
  assign WILL_FIRE_dma_server_m_rready = 1'd1 ;
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
  // action method set_verbosity
  assign RDY_set_verbosity = 1'd1 ;
  assign CAN_FIRE_set_verbosity = 1'd1 ;
  assign WILL_FIRE_set_verbosity = EN_set_verbosity ;
  // action method set_watch_tohost
  assign RDY_set_watch_tohost = 1'd1 ;
  assign CAN_FIRE_set_watch_tohost = 1'd1 ;
  assign WILL_FIRE_set_watch_tohost = EN_set_watch_tohost ;
  // value method mv_tohost_value
  assign mv_tohost_value = cpu$mv_tohost_value ;
  assign RDY_mv_tohost_value = 1'd1 ;
  // action method ma_ddr4_ready
  assign RDY_ma_ddr4_ready = 1'd1 ;
  assign CAN_FIRE_ma_ddr4_ready = 1'd1 ;
  assign WILL_FIRE_ma_ddr4_ready = EN_ma_ddr4_ready ;
  // value method mv_status
  assign mv_status = cpu$mv_status ;
  // submodule cpu
  mkCPU cpu(.CLK(CLK),
	    .RST_N(RST_N),
	    .dma_server_araddr(cpu$dma_server_araddr),
	    .dma_server_arburst(cpu$dma_server_arburst),
	    .dma_server_arcache(cpu$dma_server_arcache),
	    .dma_server_arid(cpu$dma_server_arid),
	    .dma_server_arlen(cpu$dma_server_arlen),
	    .dma_server_arlock(cpu$dma_server_arlock),
	    .dma_server_arprot(cpu$dma_server_arprot),
	    .dma_server_arqos(cpu$dma_server_arqos),
	    .dma_server_arregion(cpu$dma_server_arregion),
	    .dma_server_arsize(cpu$dma_server_arsize),
	    .dma_server_arvalid(cpu$dma_server_arvalid),
	    .dma_server_awaddr(cpu$dma_server_awaddr),
	    .dma_server_awburst(cpu$dma_server_awburst),
	    .dma_server_awcache(cpu$dma_server_awcache),
	    .dma_server_awid(cpu$dma_server_awid),
	    .dma_server_awlen(cpu$dma_server_awlen),
	    .dma_server_awlock(cpu$dma_server_awlock),
	    .dma_server_awprot(cpu$dma_server_awprot),
	    .dma_server_awqos(cpu$dma_server_awqos),
	    .dma_server_awregion(cpu$dma_server_awregion),
	    .dma_server_awsize(cpu$dma_server_awsize),
	    .dma_server_awvalid(cpu$dma_server_awvalid),
	    .dma_server_bready(cpu$dma_server_bready),
	    .dma_server_rready(cpu$dma_server_rready),
	    .dma_server_wdata(cpu$dma_server_wdata),
	    .dma_server_wlast(cpu$dma_server_wlast),
	    .dma_server_wstrb(cpu$dma_server_wstrb),
	    .dma_server_wvalid(cpu$dma_server_wvalid),
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
	    .mem_master_arready(cpu$mem_master_arready),
	    .mem_master_awready(cpu$mem_master_awready),
	    .mem_master_bid(cpu$mem_master_bid),
	    .mem_master_bresp(cpu$mem_master_bresp),
	    .mem_master_bvalid(cpu$mem_master_bvalid),
	    .mem_master_rdata(cpu$mem_master_rdata),
	    .mem_master_rid(cpu$mem_master_rid),
	    .mem_master_rlast(cpu$mem_master_rlast),
	    .mem_master_rresp(cpu$mem_master_rresp),
	    .mem_master_rvalid(cpu$mem_master_rvalid),
	    .mem_master_wready(cpu$mem_master_wready),
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
	    .EN_ma_ddr4_ready(cpu$EN_ma_ddr4_ready),
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
	    .mem_master_awvalid(cpu$mem_master_awvalid),
	    .mem_master_awid(cpu$mem_master_awid),
	    .mem_master_awaddr(cpu$mem_master_awaddr),
	    .mem_master_awlen(cpu$mem_master_awlen),
	    .mem_master_awsize(cpu$mem_master_awsize),
	    .mem_master_awburst(cpu$mem_master_awburst),
	    .mem_master_awlock(cpu$mem_master_awlock),
	    .mem_master_awcache(cpu$mem_master_awcache),
	    .mem_master_awprot(cpu$mem_master_awprot),
	    .mem_master_awqos(cpu$mem_master_awqos),
	    .mem_master_awregion(cpu$mem_master_awregion),
	    .mem_master_wvalid(cpu$mem_master_wvalid),
	    .mem_master_wdata(cpu$mem_master_wdata),
	    .mem_master_wstrb(cpu$mem_master_wstrb),
	    .mem_master_wlast(cpu$mem_master_wlast),
	    .mem_master_bready(cpu$mem_master_bready),
	    .mem_master_arvalid(cpu$mem_master_arvalid),
	    .mem_master_arid(cpu$mem_master_arid),
	    .mem_master_araddr(cpu$mem_master_araddr),
	    .mem_master_arlen(cpu$mem_master_arlen),
	    .mem_master_arsize(cpu$mem_master_arsize),
	    .mem_master_arburst(cpu$mem_master_arburst),
	    .mem_master_arlock(cpu$mem_master_arlock),
	    .mem_master_arcache(cpu$mem_master_arcache),
	    .mem_master_arprot(cpu$mem_master_arprot),
	    .mem_master_arqos(cpu$mem_master_arqos),
	    .mem_master_arregion(cpu$mem_master_arregion),
	    .mem_master_rready(cpu$mem_master_rready),
	    .dma_server_awready(cpu$dma_server_awready),
	    .dma_server_wready(cpu$dma_server_wready),
	    .dma_server_bvalid(cpu$dma_server_bvalid),
	    .dma_server_bid(cpu$dma_server_bid),
	    .dma_server_bresp(cpu$dma_server_bresp),
	    .dma_server_arready(cpu$dma_server_arready),
	    .dma_server_rvalid(cpu$dma_server_rvalid),
	    .dma_server_rid(cpu$dma_server_rid),
	    .dma_server_rdata(cpu$dma_server_rdata),
	    .dma_server_rresp(cpu$dma_server_rresp),
	    .dma_server_rlast(cpu$dma_server_rlast),
	    .RDY_set_verbosity(),
	    .RDY_set_watch_tohost(),
	    .mv_tohost_value(cpu$mv_tohost_value),
	    .RDY_mv_tohost_value(),
	    .RDY_ma_ddr4_ready(),
	    .mv_status(cpu$mv_status));
  // submodule f_reset_reqs
  FIFO2 #(.width(32'd1), .guarded(1'd1)) f_reset_reqs(.RST(RST_N),
						      .CLK(CLK),
						      .D_IN(f_reset_reqs$D_IN),
						      .ENQ(f_reset_reqs$ENQ),
						      .DEQ(f_reset_reqs$DEQ),
						      .CLR(f_reset_reqs$CLR),
						      .D_OUT(f_reset_reqs$D_OUT),
						      .FULL_N(f_reset_reqs$FULL_N),
						      .EMPTY_N(f_reset_reqs$EMPTY_N));
  // submodule f_reset_rsps
  FIFO2 #(.width(32'd1), .guarded(1'd1)) f_reset_rsps(.RST(RST_N),
						      .CLK(CLK),
						      .D_IN(f_reset_rsps$D_IN),
						      .ENQ(f_reset_rsps$ENQ),
						      .DEQ(f_reset_rsps$DEQ),
						      .CLR(f_reset_rsps$CLR),
						      .D_OUT(f_reset_rsps$D_OUT),
						      .FULL_N(f_reset_rsps$FULL_N),
						      .EMPTY_N(f_reset_rsps$EMPTY_N));
  // submodule fabric_1x3
  mkFabric_1x3 fabric_1x3(.CLK(CLK),
			  .RST_N(RST_N),
			  .set_verbosity_verbosity(fabric_1x3$set_verbosity_verbosity),
			  .v_from_masters_0_araddr(fabric_1x3$v_from_masters_0_araddr),
			  .v_from_masters_0_arburst(fabric_1x3$v_from_masters_0_arburst),
			  .v_from_masters_0_arcache(fabric_1x3$v_from_masters_0_arcache),
			  .v_from_masters_0_arid(fabric_1x3$v_from_masters_0_arid),
			  .v_from_masters_0_arlen(fabric_1x3$v_from_masters_0_arlen),
			  .v_from_masters_0_arlock(fabric_1x3$v_from_masters_0_arlock),
			  .v_from_masters_0_arprot(fabric_1x3$v_from_masters_0_arprot),
			  .v_from_masters_0_arqos(fabric_1x3$v_from_masters_0_arqos),
			  .v_from_masters_0_arregion(fabric_1x3$v_from_masters_0_arregion),
			  .v_from_masters_0_arsize(fabric_1x3$v_from_masters_0_arsize),
			  .v_from_masters_0_arvalid(fabric_1x3$v_from_masters_0_arvalid),
			  .v_from_masters_0_awaddr(fabric_1x3$v_from_masters_0_awaddr),
			  .v_from_masters_0_awburst(fabric_1x3$v_from_masters_0_awburst),
			  .v_from_masters_0_awcache(fabric_1x3$v_from_masters_0_awcache),
			  .v_from_masters_0_awid(fabric_1x3$v_from_masters_0_awid),
			  .v_from_masters_0_awlen(fabric_1x3$v_from_masters_0_awlen),
			  .v_from_masters_0_awlock(fabric_1x3$v_from_masters_0_awlock),
			  .v_from_masters_0_awprot(fabric_1x3$v_from_masters_0_awprot),
			  .v_from_masters_0_awqos(fabric_1x3$v_from_masters_0_awqos),
			  .v_from_masters_0_awregion(fabric_1x3$v_from_masters_0_awregion),
			  .v_from_masters_0_awsize(fabric_1x3$v_from_masters_0_awsize),
			  .v_from_masters_0_awvalid(fabric_1x3$v_from_masters_0_awvalid),
			  .v_from_masters_0_bready(fabric_1x3$v_from_masters_0_bready),
			  .v_from_masters_0_rready(fabric_1x3$v_from_masters_0_rready),
			  .v_from_masters_0_wdata(fabric_1x3$v_from_masters_0_wdata),
			  .v_from_masters_0_wlast(fabric_1x3$v_from_masters_0_wlast),
			  .v_from_masters_0_wstrb(fabric_1x3$v_from_masters_0_wstrb),
			  .v_from_masters_0_wvalid(fabric_1x3$v_from_masters_0_wvalid),
			  .v_to_slaves_0_arready(fabric_1x3$v_to_slaves_0_arready),
			  .v_to_slaves_0_awready(fabric_1x3$v_to_slaves_0_awready),
			  .v_to_slaves_0_bid(fabric_1x3$v_to_slaves_0_bid),
			  .v_to_slaves_0_bresp(fabric_1x3$v_to_slaves_0_bresp),
			  .v_to_slaves_0_bvalid(fabric_1x3$v_to_slaves_0_bvalid),
			  .v_to_slaves_0_rdata(fabric_1x3$v_to_slaves_0_rdata),
			  .v_to_slaves_0_rid(fabric_1x3$v_to_slaves_0_rid),
			  .v_to_slaves_0_rlast(fabric_1x3$v_to_slaves_0_rlast),
			  .v_to_slaves_0_rresp(fabric_1x3$v_to_slaves_0_rresp),
			  .v_to_slaves_0_rvalid(fabric_1x3$v_to_slaves_0_rvalid),
			  .v_to_slaves_0_wready(fabric_1x3$v_to_slaves_0_wready),
			  .v_to_slaves_1_arready(fabric_1x3$v_to_slaves_1_arready),
			  .v_to_slaves_1_awready(fabric_1x3$v_to_slaves_1_awready),
			  .v_to_slaves_1_bid(fabric_1x3$v_to_slaves_1_bid),
			  .v_to_slaves_1_bresp(fabric_1x3$v_to_slaves_1_bresp),
			  .v_to_slaves_1_bvalid(fabric_1x3$v_to_slaves_1_bvalid),
			  .v_to_slaves_1_rdata(fabric_1x3$v_to_slaves_1_rdata),
			  .v_to_slaves_1_rid(fabric_1x3$v_to_slaves_1_rid),
			  .v_to_slaves_1_rlast(fabric_1x3$v_to_slaves_1_rlast),
			  .v_to_slaves_1_rresp(fabric_1x3$v_to_slaves_1_rresp),
			  .v_to_slaves_1_rvalid(fabric_1x3$v_to_slaves_1_rvalid),
			  .v_to_slaves_1_wready(fabric_1x3$v_to_slaves_1_wready),
			  .v_to_slaves_2_arready(fabric_1x3$v_to_slaves_2_arready),
			  .v_to_slaves_2_awready(fabric_1x3$v_to_slaves_2_awready),
			  .v_to_slaves_2_bid(fabric_1x3$v_to_slaves_2_bid),
			  .v_to_slaves_2_bresp(fabric_1x3$v_to_slaves_2_bresp),
			  .v_to_slaves_2_bvalid(fabric_1x3$v_to_slaves_2_bvalid),
			  .v_to_slaves_2_rdata(fabric_1x3$v_to_slaves_2_rdata),
			  .v_to_slaves_2_rid(fabric_1x3$v_to_slaves_2_rid),
			  .v_to_slaves_2_rlast(fabric_1x3$v_to_slaves_2_rlast),
			  .v_to_slaves_2_rresp(fabric_1x3$v_to_slaves_2_rresp),
			  .v_to_slaves_2_rvalid(fabric_1x3$v_to_slaves_2_rvalid),
			  .v_to_slaves_2_wready(fabric_1x3$v_to_slaves_2_wready),
			  .EN_reset(fabric_1x3$EN_reset),
			  .EN_set_verbosity(fabric_1x3$EN_set_verbosity),
			  .RDY_reset(fabric_1x3$RDY_reset),
			  .RDY_set_verbosity(),
			  .v_from_masters_0_awready(fabric_1x3$v_from_masters_0_awready),
			  .v_from_masters_0_wready(fabric_1x3$v_from_masters_0_wready),
			  .v_from_masters_0_bvalid(fabric_1x3$v_from_masters_0_bvalid),
			  .v_from_masters_0_bid(fabric_1x3$v_from_masters_0_bid),
			  .v_from_masters_0_bresp(fabric_1x3$v_from_masters_0_bresp),
			  .v_from_masters_0_arready(fabric_1x3$v_from_masters_0_arready),
			  .v_from_masters_0_rvalid(fabric_1x3$v_from_masters_0_rvalid),
			  .v_from_masters_0_rid(fabric_1x3$v_from_masters_0_rid),
			  .v_from_masters_0_rdata(fabric_1x3$v_from_masters_0_rdata),
			  .v_from_masters_0_rresp(fabric_1x3$v_from_masters_0_rresp),
			  .v_from_masters_0_rlast(fabric_1x3$v_from_masters_0_rlast),
			  .v_to_slaves_0_awvalid(fabric_1x3$v_to_slaves_0_awvalid),
			  .v_to_slaves_0_awid(fabric_1x3$v_to_slaves_0_awid),
			  .v_to_slaves_0_awaddr(fabric_1x3$v_to_slaves_0_awaddr),
			  .v_to_slaves_0_awlen(fabric_1x3$v_to_slaves_0_awlen),
			  .v_to_slaves_0_awsize(fabric_1x3$v_to_slaves_0_awsize),
			  .v_to_slaves_0_awburst(fabric_1x3$v_to_slaves_0_awburst),
			  .v_to_slaves_0_awlock(fabric_1x3$v_to_slaves_0_awlock),
			  .v_to_slaves_0_awcache(fabric_1x3$v_to_slaves_0_awcache),
			  .v_to_slaves_0_awprot(fabric_1x3$v_to_slaves_0_awprot),
			  .v_to_slaves_0_awqos(fabric_1x3$v_to_slaves_0_awqos),
			  .v_to_slaves_0_awregion(fabric_1x3$v_to_slaves_0_awregion),
			  .v_to_slaves_0_wvalid(fabric_1x3$v_to_slaves_0_wvalid),
			  .v_to_slaves_0_wdata(fabric_1x3$v_to_slaves_0_wdata),
			  .v_to_slaves_0_wstrb(fabric_1x3$v_to_slaves_0_wstrb),
			  .v_to_slaves_0_wlast(fabric_1x3$v_to_slaves_0_wlast),
			  .v_to_slaves_0_bready(fabric_1x3$v_to_slaves_0_bready),
			  .v_to_slaves_0_arvalid(fabric_1x3$v_to_slaves_0_arvalid),
			  .v_to_slaves_0_arid(fabric_1x3$v_to_slaves_0_arid),
			  .v_to_slaves_0_araddr(fabric_1x3$v_to_slaves_0_araddr),
			  .v_to_slaves_0_arlen(fabric_1x3$v_to_slaves_0_arlen),
			  .v_to_slaves_0_arsize(fabric_1x3$v_to_slaves_0_arsize),
			  .v_to_slaves_0_arburst(fabric_1x3$v_to_slaves_0_arburst),
			  .v_to_slaves_0_arlock(fabric_1x3$v_to_slaves_0_arlock),
			  .v_to_slaves_0_arcache(fabric_1x3$v_to_slaves_0_arcache),
			  .v_to_slaves_0_arprot(fabric_1x3$v_to_slaves_0_arprot),
			  .v_to_slaves_0_arqos(fabric_1x3$v_to_slaves_0_arqos),
			  .v_to_slaves_0_arregion(fabric_1x3$v_to_slaves_0_arregion),
			  .v_to_slaves_0_rready(fabric_1x3$v_to_slaves_0_rready),
			  .v_to_slaves_1_awvalid(fabric_1x3$v_to_slaves_1_awvalid),
			  .v_to_slaves_1_awid(fabric_1x3$v_to_slaves_1_awid),
			  .v_to_slaves_1_awaddr(fabric_1x3$v_to_slaves_1_awaddr),
			  .v_to_slaves_1_awlen(fabric_1x3$v_to_slaves_1_awlen),
			  .v_to_slaves_1_awsize(fabric_1x3$v_to_slaves_1_awsize),
			  .v_to_slaves_1_awburst(fabric_1x3$v_to_slaves_1_awburst),
			  .v_to_slaves_1_awlock(fabric_1x3$v_to_slaves_1_awlock),
			  .v_to_slaves_1_awcache(fabric_1x3$v_to_slaves_1_awcache),
			  .v_to_slaves_1_awprot(fabric_1x3$v_to_slaves_1_awprot),
			  .v_to_slaves_1_awqos(fabric_1x3$v_to_slaves_1_awqos),
			  .v_to_slaves_1_awregion(fabric_1x3$v_to_slaves_1_awregion),
			  .v_to_slaves_1_wvalid(fabric_1x3$v_to_slaves_1_wvalid),
			  .v_to_slaves_1_wdata(fabric_1x3$v_to_slaves_1_wdata),
			  .v_to_slaves_1_wstrb(fabric_1x3$v_to_slaves_1_wstrb),
			  .v_to_slaves_1_wlast(fabric_1x3$v_to_slaves_1_wlast),
			  .v_to_slaves_1_bready(fabric_1x3$v_to_slaves_1_bready),
			  .v_to_slaves_1_arvalid(fabric_1x3$v_to_slaves_1_arvalid),
			  .v_to_slaves_1_arid(fabric_1x3$v_to_slaves_1_arid),
			  .v_to_slaves_1_araddr(fabric_1x3$v_to_slaves_1_araddr),
			  .v_to_slaves_1_arlen(fabric_1x3$v_to_slaves_1_arlen),
			  .v_to_slaves_1_arsize(fabric_1x3$v_to_slaves_1_arsize),
			  .v_to_slaves_1_arburst(fabric_1x3$v_to_slaves_1_arburst),
			  .v_to_slaves_1_arlock(fabric_1x3$v_to_slaves_1_arlock),
			  .v_to_slaves_1_arcache(fabric_1x3$v_to_slaves_1_arcache),
			  .v_to_slaves_1_arprot(fabric_1x3$v_to_slaves_1_arprot),
			  .v_to_slaves_1_arqos(fabric_1x3$v_to_slaves_1_arqos),
			  .v_to_slaves_1_arregion(fabric_1x3$v_to_slaves_1_arregion),
			  .v_to_slaves_1_rready(fabric_1x3$v_to_slaves_1_rready),
			  .v_to_slaves_2_awvalid(fabric_1x3$v_to_slaves_2_awvalid),
			  .v_to_slaves_2_awid(fabric_1x3$v_to_slaves_2_awid),
			  .v_to_slaves_2_awaddr(fabric_1x3$v_to_slaves_2_awaddr),
			  .v_to_slaves_2_awlen(fabric_1x3$v_to_slaves_2_awlen),
			  .v_to_slaves_2_awsize(fabric_1x3$v_to_slaves_2_awsize),
			  .v_to_slaves_2_awburst(fabric_1x3$v_to_slaves_2_awburst),
			  .v_to_slaves_2_awlock(fabric_1x3$v_to_slaves_2_awlock),
			  .v_to_slaves_2_awcache(fabric_1x3$v_to_slaves_2_awcache),
			  .v_to_slaves_2_awprot(fabric_1x3$v_to_slaves_2_awprot),
			  .v_to_slaves_2_awqos(fabric_1x3$v_to_slaves_2_awqos),
			  .v_to_slaves_2_awregion(fabric_1x3$v_to_slaves_2_awregion),
			  .v_to_slaves_2_wvalid(fabric_1x3$v_to_slaves_2_wvalid),
			  .v_to_slaves_2_wdata(fabric_1x3$v_to_slaves_2_wdata),
			  .v_to_slaves_2_wstrb(fabric_1x3$v_to_slaves_2_wstrb),
			  .v_to_slaves_2_wlast(fabric_1x3$v_to_slaves_2_wlast),
			  .v_to_slaves_2_bready(fabric_1x3$v_to_slaves_2_bready),
			  .v_to_slaves_2_arvalid(fabric_1x3$v_to_slaves_2_arvalid),
			  .v_to_slaves_2_arid(fabric_1x3$v_to_slaves_2_arid),
			  .v_to_slaves_2_araddr(fabric_1x3$v_to_slaves_2_araddr),
			  .v_to_slaves_2_arlen(fabric_1x3$v_to_slaves_2_arlen),
			  .v_to_slaves_2_arsize(fabric_1x3$v_to_slaves_2_arsize),
			  .v_to_slaves_2_arburst(fabric_1x3$v_to_slaves_2_arburst),
			  .v_to_slaves_2_arlock(fabric_1x3$v_to_slaves_2_arlock),
			  .v_to_slaves_2_arcache(fabric_1x3$v_to_slaves_2_arcache),
			  .v_to_slaves_2_arprot(fabric_1x3$v_to_slaves_2_arprot),
			  .v_to_slaves_2_arqos(fabric_1x3$v_to_slaves_2_arqos),
			  .v_to_slaves_2_arregion(fabric_1x3$v_to_slaves_2_arregion),
			  .v_to_slaves_2_rready(fabric_1x3$v_to_slaves_2_rready));
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
				 .RDY_set_addr_map(near_mem_io$RDY_set_addr_map),
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
  // rule RL_rl_cpu_hart0_reset_complete
  assign CAN_FIRE_RL_rl_cpu_hart0_reset_complete =
	     near_mem_io$RDY_set_addr_map &&
	     near_mem_io_RDY_server_reset_response_get__4_A_ETC___d20 ;
  assign WILL_FIRE_RL_rl_cpu_hart0_reset_complete =
	     CAN_FIRE_RL_rl_cpu_hart0_reset_complete ;
  // rule RL_rl_cpu_hart0_reset_from_soc_start
  assign CAN_FIRE_RL_rl_cpu_hart0_reset_from_soc_start =
	     near_mem_io$RDY_server_reset_request_put &&
	     plic_RDY_server_reset_request_put_AND_fabric_1_ETC___d8 ;
  assign WILL_FIRE_RL_rl_cpu_hart0_reset_from_soc_start =
	     CAN_FIRE_RL_rl_cpu_hart0_reset_from_soc_start ;
  // submodule cpu
  assign cpu$dma_server_araddr = dma_server_araddr ;
  assign cpu$dma_server_arburst = dma_server_arburst ;
  assign cpu$dma_server_arcache = dma_server_arcache ;
  assign cpu$dma_server_arid = dma_server_arid ;
  assign cpu$dma_server_arlen = dma_server_arlen ;
  assign cpu$dma_server_arlock = dma_server_arlock ;
  assign cpu$dma_server_arprot = dma_server_arprot ;
  assign cpu$dma_server_arqos = dma_server_arqos ;
  assign cpu$dma_server_arregion = dma_server_arregion ;
  assign cpu$dma_server_arsize = dma_server_arsize ;
  assign cpu$dma_server_arvalid = dma_server_arvalid ;
  assign cpu$dma_server_awaddr = dma_server_awaddr ;
  assign cpu$dma_server_awburst = dma_server_awburst ;
  assign cpu$dma_server_awcache = dma_server_awcache ;
  assign cpu$dma_server_awid = dma_server_awid ;
  assign cpu$dma_server_awlen = dma_server_awlen ;
  assign cpu$dma_server_awlock = dma_server_awlock ;
  assign cpu$dma_server_awprot = dma_server_awprot ;
  assign cpu$dma_server_awqos = dma_server_awqos ;
  assign cpu$dma_server_awregion = dma_server_awregion ;
  assign cpu$dma_server_awsize = dma_server_awsize ;
  assign cpu$dma_server_awvalid = dma_server_awvalid ;
  assign cpu$dma_server_bready = dma_server_bready ;
  assign cpu$dma_server_rready = dma_server_rready ;
  assign cpu$dma_server_wdata = dma_server_wdata ;
  assign cpu$dma_server_wlast = dma_server_wlast ;
  assign cpu$dma_server_wstrb = dma_server_wstrb ;
  assign cpu$dma_server_wvalid = dma_server_wvalid ;
  assign cpu$hart0_server_reset_request_put = f_reset_reqs$D_OUT ;
  assign cpu$imem_master_arready = fabric_1x3$v_from_masters_0_arready ;
  assign cpu$imem_master_awready = fabric_1x3$v_from_masters_0_awready ;
  assign cpu$imem_master_bid = fabric_1x3$v_from_masters_0_bid ;
  assign cpu$imem_master_bresp = fabric_1x3$v_from_masters_0_bresp ;
  assign cpu$imem_master_bvalid = fabric_1x3$v_from_masters_0_bvalid ;
  assign cpu$imem_master_rdata = fabric_1x3$v_from_masters_0_rdata ;
  assign cpu$imem_master_rid = fabric_1x3$v_from_masters_0_rid ;
  assign cpu$imem_master_rlast = fabric_1x3$v_from_masters_0_rlast ;
  assign cpu$imem_master_rresp = fabric_1x3$v_from_masters_0_rresp ;
  assign cpu$imem_master_rvalid = fabric_1x3$v_from_masters_0_rvalid ;
  assign cpu$imem_master_wready = fabric_1x3$v_from_masters_0_wready ;
  assign cpu$m_external_interrupt_req_set_not_clear = plic$v_targets_0_m_eip ;
  assign cpu$mem_master_arready = core_mem_master_arready ;
  assign cpu$mem_master_awready = core_mem_master_awready ;
  assign cpu$mem_master_bid = core_mem_master_bid ;
  assign cpu$mem_master_bresp = core_mem_master_bresp ;
  assign cpu$mem_master_bvalid = core_mem_master_bvalid ;
  assign cpu$mem_master_rdata = core_mem_master_rdata ;
  assign cpu$mem_master_rid = core_mem_master_rid ;
  assign cpu$mem_master_rlast = core_mem_master_rlast ;
  assign cpu$mem_master_rresp = core_mem_master_rresp ;
  assign cpu$mem_master_rvalid = core_mem_master_rvalid ;
  assign cpu$mem_master_wready = core_mem_master_wready ;
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
  assign cpu$EN_ma_ddr4_ready = EN_ma_ddr4_ready ;
  // submodule f_reset_reqs
  assign f_reset_reqs$D_IN = cpu_reset_server_request_put ;
  assign f_reset_reqs$ENQ = EN_cpu_reset_server_request_put ;
  assign f_reset_reqs$DEQ =
	     near_mem_io$RDY_server_reset_request_put &&
	     plic_RDY_server_reset_request_put_AND_fabric_1_ETC___d8 ;
  assign f_reset_reqs$CLR = 1'b0 ;
  // submodule f_reset_rsps
  assign f_reset_rsps$D_IN = cpu$hart0_server_reset_response_get ;
  assign f_reset_rsps$ENQ =
	     near_mem_io$RDY_set_addr_map &&
	     near_mem_io_RDY_server_reset_response_get__4_A_ETC___d20 ;
  assign f_reset_rsps$DEQ = EN_cpu_reset_server_response_get ;
  assign f_reset_rsps$CLR = 1'b0 ;
  // submodule fabric_1x3
  assign fabric_1x3$set_verbosity_verbosity = 4'h0 ;
  assign fabric_1x3$v_from_masters_0_araddr = cpu$imem_master_araddr ;
  assign fabric_1x3$v_from_masters_0_arburst = cpu$imem_master_arburst ;
  assign fabric_1x3$v_from_masters_0_arcache = cpu$imem_master_arcache ;
  assign fabric_1x3$v_from_masters_0_arid = cpu$imem_master_arid ;
  assign fabric_1x3$v_from_masters_0_arlen = cpu$imem_master_arlen ;
  assign fabric_1x3$v_from_masters_0_arlock = cpu$imem_master_arlock ;
  assign fabric_1x3$v_from_masters_0_arprot = cpu$imem_master_arprot ;
  assign fabric_1x3$v_from_masters_0_arqos = cpu$imem_master_arqos ;
  assign fabric_1x3$v_from_masters_0_arregion = cpu$imem_master_arregion ;
  assign fabric_1x3$v_from_masters_0_arsize = cpu$imem_master_arsize ;
  assign fabric_1x3$v_from_masters_0_arvalid = cpu$imem_master_arvalid ;
  assign fabric_1x3$v_from_masters_0_awaddr = cpu$imem_master_awaddr ;
  assign fabric_1x3$v_from_masters_0_awburst = cpu$imem_master_awburst ;
  assign fabric_1x3$v_from_masters_0_awcache = cpu$imem_master_awcache ;
  assign fabric_1x3$v_from_masters_0_awid = cpu$imem_master_awid ;
  assign fabric_1x3$v_from_masters_0_awlen = cpu$imem_master_awlen ;
  assign fabric_1x3$v_from_masters_0_awlock = cpu$imem_master_awlock ;
  assign fabric_1x3$v_from_masters_0_awprot = cpu$imem_master_awprot ;
  assign fabric_1x3$v_from_masters_0_awqos = cpu$imem_master_awqos ;
  assign fabric_1x3$v_from_masters_0_awregion = cpu$imem_master_awregion ;
  assign fabric_1x3$v_from_masters_0_awsize = cpu$imem_master_awsize ;
  assign fabric_1x3$v_from_masters_0_awvalid = cpu$imem_master_awvalid ;
  assign fabric_1x3$v_from_masters_0_bready = cpu$imem_master_bready ;
  assign fabric_1x3$v_from_masters_0_rready = cpu$imem_master_rready ;
  assign fabric_1x3$v_from_masters_0_wdata = cpu$imem_master_wdata ;
  assign fabric_1x3$v_from_masters_0_wlast = cpu$imem_master_wlast ;
  assign fabric_1x3$v_from_masters_0_wstrb = cpu$imem_master_wstrb ;
  assign fabric_1x3$v_from_masters_0_wvalid = cpu$imem_master_wvalid ;
  assign fabric_1x3$v_to_slaves_0_arready = cpu_imem_master_arready ;
  assign fabric_1x3$v_to_slaves_0_awready = cpu_imem_master_awready ;
  assign fabric_1x3$v_to_slaves_0_bid = cpu_imem_master_bid ;
  assign fabric_1x3$v_to_slaves_0_bresp = cpu_imem_master_bresp ;
  assign fabric_1x3$v_to_slaves_0_bvalid = cpu_imem_master_bvalid ;
  assign fabric_1x3$v_to_slaves_0_rdata = cpu_imem_master_rdata ;
  assign fabric_1x3$v_to_slaves_0_rid = cpu_imem_master_rid ;
  assign fabric_1x3$v_to_slaves_0_rlast = cpu_imem_master_rlast ;
  assign fabric_1x3$v_to_slaves_0_rresp = cpu_imem_master_rresp ;
  assign fabric_1x3$v_to_slaves_0_rvalid = cpu_imem_master_rvalid ;
  assign fabric_1x3$v_to_slaves_0_wready = cpu_imem_master_wready ;
  assign fabric_1x3$v_to_slaves_1_arready = near_mem_io$axi4_slave_arready ;
  assign fabric_1x3$v_to_slaves_1_awready = near_mem_io$axi4_slave_awready ;
  assign fabric_1x3$v_to_slaves_1_bid = near_mem_io$axi4_slave_bid ;
  assign fabric_1x3$v_to_slaves_1_bresp = near_mem_io$axi4_slave_bresp ;
  assign fabric_1x3$v_to_slaves_1_bvalid = near_mem_io$axi4_slave_bvalid ;
  assign fabric_1x3$v_to_slaves_1_rdata = near_mem_io$axi4_slave_rdata ;
  assign fabric_1x3$v_to_slaves_1_rid = near_mem_io$axi4_slave_rid ;
  assign fabric_1x3$v_to_slaves_1_rlast = near_mem_io$axi4_slave_rlast ;
  assign fabric_1x3$v_to_slaves_1_rresp = near_mem_io$axi4_slave_rresp ;
  assign fabric_1x3$v_to_slaves_1_rvalid = near_mem_io$axi4_slave_rvalid ;
  assign fabric_1x3$v_to_slaves_1_wready = near_mem_io$axi4_slave_wready ;
  assign fabric_1x3$v_to_slaves_2_arready = plic$axi4_slave_arready ;
  assign fabric_1x3$v_to_slaves_2_awready = plic$axi4_slave_awready ;
  assign fabric_1x3$v_to_slaves_2_bid = plic$axi4_slave_bid ;
  assign fabric_1x3$v_to_slaves_2_bresp = plic$axi4_slave_bresp ;
  assign fabric_1x3$v_to_slaves_2_bvalid = plic$axi4_slave_bvalid ;
  assign fabric_1x3$v_to_slaves_2_rdata = plic$axi4_slave_rdata ;
  assign fabric_1x3$v_to_slaves_2_rid = plic$axi4_slave_rid ;
  assign fabric_1x3$v_to_slaves_2_rlast = plic$axi4_slave_rlast ;
  assign fabric_1x3$v_to_slaves_2_rresp = plic$axi4_slave_rresp ;
  assign fabric_1x3$v_to_slaves_2_rvalid = plic$axi4_slave_rvalid ;
  assign fabric_1x3$v_to_slaves_2_wready = plic$axi4_slave_wready ;
  assign fabric_1x3$EN_reset = CAN_FIRE_RL_rl_cpu_hart0_reset_from_soc_start ;
  assign fabric_1x3$EN_set_verbosity = 1'b0 ;
  // submodule near_mem_io
  assign near_mem_io$axi4_slave_araddr = fabric_1x3$v_to_slaves_1_araddr ;
  assign near_mem_io$axi4_slave_arburst = fabric_1x3$v_to_slaves_1_arburst ;
  assign near_mem_io$axi4_slave_arcache = fabric_1x3$v_to_slaves_1_arcache ;
  assign near_mem_io$axi4_slave_arid = fabric_1x3$v_to_slaves_1_arid ;
  assign near_mem_io$axi4_slave_arlen = fabric_1x3$v_to_slaves_1_arlen ;
  assign near_mem_io$axi4_slave_arlock = fabric_1x3$v_to_slaves_1_arlock ;
  assign near_mem_io$axi4_slave_arprot = fabric_1x3$v_to_slaves_1_arprot ;
  assign near_mem_io$axi4_slave_arqos = fabric_1x3$v_to_slaves_1_arqos ;
  assign near_mem_io$axi4_slave_arregion = fabric_1x3$v_to_slaves_1_arregion ;
  assign near_mem_io$axi4_slave_arsize = fabric_1x3$v_to_slaves_1_arsize ;
  assign near_mem_io$axi4_slave_arvalid = fabric_1x3$v_to_slaves_1_arvalid ;
  assign near_mem_io$axi4_slave_awaddr = fabric_1x3$v_to_slaves_1_awaddr ;
  assign near_mem_io$axi4_slave_awburst = fabric_1x3$v_to_slaves_1_awburst ;
  assign near_mem_io$axi4_slave_awcache = fabric_1x3$v_to_slaves_1_awcache ;
  assign near_mem_io$axi4_slave_awid = fabric_1x3$v_to_slaves_1_awid ;
  assign near_mem_io$axi4_slave_awlen = fabric_1x3$v_to_slaves_1_awlen ;
  assign near_mem_io$axi4_slave_awlock = fabric_1x3$v_to_slaves_1_awlock ;
  assign near_mem_io$axi4_slave_awprot = fabric_1x3$v_to_slaves_1_awprot ;
  assign near_mem_io$axi4_slave_awqos = fabric_1x3$v_to_slaves_1_awqos ;
  assign near_mem_io$axi4_slave_awregion = fabric_1x3$v_to_slaves_1_awregion ;
  assign near_mem_io$axi4_slave_awsize = fabric_1x3$v_to_slaves_1_awsize ;
  assign near_mem_io$axi4_slave_awvalid = fabric_1x3$v_to_slaves_1_awvalid ;
  assign near_mem_io$axi4_slave_bready = fabric_1x3$v_to_slaves_1_bready ;
  assign near_mem_io$axi4_slave_rready = fabric_1x3$v_to_slaves_1_rready ;
  assign near_mem_io$axi4_slave_wdata = fabric_1x3$v_to_slaves_1_wdata ;
  assign near_mem_io$axi4_slave_wlast = fabric_1x3$v_to_slaves_1_wlast ;
  assign near_mem_io$axi4_slave_wstrb = fabric_1x3$v_to_slaves_1_wstrb ;
  assign near_mem_io$axi4_slave_wvalid = fabric_1x3$v_to_slaves_1_wvalid ;
  assign near_mem_io$set_addr_map_addr_base = 64'd33554432 ;
  assign near_mem_io$set_addr_map_addr_lim = 64'd33603584 ;
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
  assign plic$axi4_slave_araddr = fabric_1x3$v_to_slaves_2_araddr ;
  assign plic$axi4_slave_arburst = fabric_1x3$v_to_slaves_2_arburst ;
  assign plic$axi4_slave_arcache = fabric_1x3$v_to_slaves_2_arcache ;
  assign plic$axi4_slave_arid = fabric_1x3$v_to_slaves_2_arid ;
  assign plic$axi4_slave_arlen = fabric_1x3$v_to_slaves_2_arlen ;
  assign plic$axi4_slave_arlock = fabric_1x3$v_to_slaves_2_arlock ;
  assign plic$axi4_slave_arprot = fabric_1x3$v_to_slaves_2_arprot ;
  assign plic$axi4_slave_arqos = fabric_1x3$v_to_slaves_2_arqos ;
  assign plic$axi4_slave_arregion = fabric_1x3$v_to_slaves_2_arregion ;
  assign plic$axi4_slave_arsize = fabric_1x3$v_to_slaves_2_arsize ;
  assign plic$axi4_slave_arvalid = fabric_1x3$v_to_slaves_2_arvalid ;
  assign plic$axi4_slave_awaddr = fabric_1x3$v_to_slaves_2_awaddr ;
  assign plic$axi4_slave_awburst = fabric_1x3$v_to_slaves_2_awburst ;
  assign plic$axi4_slave_awcache = fabric_1x3$v_to_slaves_2_awcache ;
  assign plic$axi4_slave_awid = fabric_1x3$v_to_slaves_2_awid ;
  assign plic$axi4_slave_awlen = fabric_1x3$v_to_slaves_2_awlen ;
  assign plic$axi4_slave_awlock = fabric_1x3$v_to_slaves_2_awlock ;
  assign plic$axi4_slave_awprot = fabric_1x3$v_to_slaves_2_awprot ;
  assign plic$axi4_slave_awqos = fabric_1x3$v_to_slaves_2_awqos ;
  assign plic$axi4_slave_awregion = fabric_1x3$v_to_slaves_2_awregion ;
  assign plic$axi4_slave_awsize = fabric_1x3$v_to_slaves_2_awsize ;
  assign plic$axi4_slave_awvalid = fabric_1x3$v_to_slaves_2_awvalid ;
  assign plic$axi4_slave_bready = fabric_1x3$v_to_slaves_2_bready ;
  assign plic$axi4_slave_rready = fabric_1x3$v_to_slaves_2_rready ;
  assign plic$axi4_slave_wdata = fabric_1x3$v_to_slaves_2_wdata ;
  assign plic$axi4_slave_wlast = fabric_1x3$v_to_slaves_2_wlast ;
  assign plic$axi4_slave_wstrb = fabric_1x3$v_to_slaves_2_wstrb ;
  assign plic$axi4_slave_wvalid = fabric_1x3$v_to_slaves_2_wvalid ;
  assign plic$set_addr_map_addr_base = 64'd201326592 ;
  assign plic$set_addr_map_addr_lim = 64'd205520896 ;
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
  // remaining internal signals
  assign near_mem_io_RDY_server_reset_response_get__4_A_ETC___d20 =
	     near_mem_io$RDY_server_reset_response_get &&
	     plic$RDY_server_reset_response_get &&
	     cpu$RDY_hart0_server_reset_response_get &&
	     f_reset_rsps$FULL_N ;
  assign plic_RDY_server_reset_request_put_AND_fabric_1_ETC___d8 =
	     plic$RDY_server_reset_request_put && fabric_1x3$RDY_reset &&
	     cpu$RDY_hart0_server_reset_request_put &&
	     f_reset_reqs$EMPTY_N ;
  // handling of system tasks
  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cpu_hart0_reset_complete)
	begin
	  v__h4222 = $stime;
	  #0;
	end
    v__h4216 = v__h4222 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cpu_hart0_reset_complete)
	$display("%0d: Core.rl_cpu_hart0_reset_complete", v__h4216);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cpu_hart0_reset_from_soc_start)
	begin
	  v__h4020 = $stime;
	  #0;
	end
    v__h4014 = v__h4020 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_cpu_hart0_reset_from_soc_start)
	$display("%0d: Core.rl_cpu_hart0_reset_from_soc_start", v__h4014);
  end
  // synopsys translate_on
endmodule