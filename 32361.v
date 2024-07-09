module outputs
  wire [352 : 0] to_raw_mem_request_get;
  wire [63 : 0] mv_tohost_value;
  wire [7 : 0] get_to_console_get, mv_status, status;
  wire RDY_get_to_console_get,
       RDY_ma_ddr4_ready,
       RDY_mv_tohost_value,
       RDY_put_from_console_put,
       RDY_set_verbosity,
       RDY_set_watch_tohost,
       RDY_to_raw_mem_request_get,
       RDY_to_raw_mem_response_put;
  // register rg_state
  reg [1 : 0] rg_state;
  wire [1 : 0] rg_state$D_IN;
  wire rg_state$EN;
  // ports of submodule boot_rom
  wire [63 : 0] boot_rom$set_addr_map_addr_base,
		boot_rom$set_addr_map_addr_lim,
		boot_rom$slave_araddr,
		boot_rom$slave_awaddr,
		boot_rom$slave_rdata,
		boot_rom$slave_wdata;
  wire [15 : 0] boot_rom$slave_arid,
		boot_rom$slave_awid,
		boot_rom$slave_bid,
		boot_rom$slave_rid;
  wire [7 : 0] boot_rom$slave_arlen,
	       boot_rom$slave_awlen,
	       boot_rom$slave_wstrb;
  wire [3 : 0] boot_rom$slave_arcache,
	       boot_rom$slave_arqos,
	       boot_rom$slave_arregion,
	       boot_rom$slave_awcache,
	       boot_rom$slave_awqos,
	       boot_rom$slave_awregion;
  wire [2 : 0] boot_rom$slave_arprot,
	       boot_rom$slave_arsize,
	       boot_rom$slave_awprot,
	       boot_rom$slave_awsize;
  wire [1 : 0] boot_rom$slave_arburst,
	       boot_rom$slave_awburst,
	       boot_rom$slave_bresp,
	       boot_rom$slave_rresp;
  wire boot_rom$EN_set_addr_map,
       boot_rom$slave_arlock,
       boot_rom$slave_arready,
       boot_rom$slave_arvalid,
       boot_rom$slave_awlock,
       boot_rom$slave_awready,
       boot_rom$slave_awvalid,
       boot_rom$slave_bready,
       boot_rom$slave_bvalid,
       boot_rom$slave_rlast,
       boot_rom$slave_rready,
       boot_rom$slave_rvalid,
       boot_rom$slave_wlast,
       boot_rom$slave_wready,
       boot_rom$slave_wvalid;
  // ports of submodule boot_rom_axi4_deburster
  wire [63 : 0] boot_rom_axi4_deburster$from_master_araddr,
		boot_rom_axi4_deburster$from_master_awaddr,
		boot_rom_axi4_deburster$from_master_rdata,
		boot_rom_axi4_deburster$from_master_wdata,
		boot_rom_axi4_deburster$to_slave_araddr,
		boot_rom_axi4_deburster$to_slave_awaddr,
		boot_rom_axi4_deburster$to_slave_rdata,
		boot_rom_axi4_deburster$to_slave_wdata;
  wire [15 : 0] boot_rom_axi4_deburster$from_master_arid,
		boot_rom_axi4_deburster$from_master_awid,
		boot_rom_axi4_deburster$from_master_bid,
		boot_rom_axi4_deburster$from_master_rid,
		boot_rom_axi4_deburster$to_slave_arid,
		boot_rom_axi4_deburster$to_slave_awid,
		boot_rom_axi4_deburster$to_slave_bid,
		boot_rom_axi4_deburster$to_slave_rid;
  wire [7 : 0] boot_rom_axi4_deburster$from_master_arlen,
	       boot_rom_axi4_deburster$from_master_awlen,
	       boot_rom_axi4_deburster$from_master_wstrb,
	       boot_rom_axi4_deburster$to_slave_arlen,
	       boot_rom_axi4_deburster$to_slave_awlen,
	       boot_rom_axi4_deburster$to_slave_wstrb;
  wire [3 : 0] boot_rom_axi4_deburster$from_master_arcache,
	       boot_rom_axi4_deburster$from_master_arqos,
	       boot_rom_axi4_deburster$from_master_arregion,
	       boot_rom_axi4_deburster$from_master_awcache,
	       boot_rom_axi4_deburster$from_master_awqos,
	       boot_rom_axi4_deburster$from_master_awregion,
	       boot_rom_axi4_deburster$to_slave_arcache,
	       boot_rom_axi4_deburster$to_slave_arqos,
	       boot_rom_axi4_deburster$to_slave_arregion,
	       boot_rom_axi4_deburster$to_slave_awcache,
	       boot_rom_axi4_deburster$to_slave_awqos,
	       boot_rom_axi4_deburster$to_slave_awregion;
  wire [2 : 0] boot_rom_axi4_deburster$from_master_arprot,
	       boot_rom_axi4_deburster$from_master_arsize,
	       boot_rom_axi4_deburster$from_master_awprot,
	       boot_rom_axi4_deburster$from_master_awsize,
	       boot_rom_axi4_deburster$to_slave_arprot,
	       boot_rom_axi4_deburster$to_slave_arsize,
	       boot_rom_axi4_deburster$to_slave_awprot,
	       boot_rom_axi4_deburster$to_slave_awsize;
  wire [1 : 0] boot_rom_axi4_deburster$from_master_arburst,
	       boot_rom_axi4_deburster$from_master_awburst,
	       boot_rom_axi4_deburster$from_master_bresp,
	       boot_rom_axi4_deburster$from_master_rresp,
	       boot_rom_axi4_deburster$to_slave_arburst,
	       boot_rom_axi4_deburster$to_slave_awburst,
	       boot_rom_axi4_deburster$to_slave_bresp,
	       boot_rom_axi4_deburster$to_slave_rresp;
  wire boot_rom_axi4_deburster$EN_reset,
       boot_rom_axi4_deburster$from_master_arlock,
       boot_rom_axi4_deburster$from_master_arready,
       boot_rom_axi4_deburster$from_master_arvalid,
       boot_rom_axi4_deburster$from_master_awlock,
       boot_rom_axi4_deburster$from_master_awready,
       boot_rom_axi4_deburster$from_master_awvalid,
       boot_rom_axi4_deburster$from_master_bready,
       boot_rom_axi4_deburster$from_master_bvalid,
       boot_rom_axi4_deburster$from_master_rlast,
       boot_rom_axi4_deburster$from_master_rready,
       boot_rom_axi4_deburster$from_master_rvalid,
       boot_rom_axi4_deburster$from_master_wlast,
       boot_rom_axi4_deburster$from_master_wready,
       boot_rom_axi4_deburster$from_master_wvalid,
       boot_rom_axi4_deburster$to_slave_arlock,
       boot_rom_axi4_deburster$to_slave_arready,
       boot_rom_axi4_deburster$to_slave_arvalid,
       boot_rom_axi4_deburster$to_slave_awlock,
       boot_rom_axi4_deburster$to_slave_awready,
       boot_rom_axi4_deburster$to_slave_awvalid,
       boot_rom_axi4_deburster$to_slave_bready,
       boot_rom_axi4_deburster$to_slave_bvalid,
       boot_rom_axi4_deburster$to_slave_rlast,
       boot_rom_axi4_deburster$to_slave_rready,
       boot_rom_axi4_deburster$to_slave_rvalid,
       boot_rom_axi4_deburster$to_slave_wlast,
       boot_rom_axi4_deburster$to_slave_wready,
       boot_rom_axi4_deburster$to_slave_wvalid;
  // ports of submodule core
  wire [511 : 0] core$dma_server_wdata;
  wire [63 : 0] core$core_mem_master_araddr,
		core$core_mem_master_awaddr,
		core$core_mem_master_rdata,
		core$core_mem_master_wdata,
		core$cpu_imem_master_araddr,
		core$cpu_imem_master_awaddr,
		core$cpu_imem_master_rdata,
		core$cpu_imem_master_wdata,
		core$dma_server_araddr,
		core$dma_server_awaddr,
		core$dma_server_wstrb,
		core$mv_tohost_value,
		core$set_verbosity_logdelay,
		core$set_watch_tohost_tohost_addr;
  wire [15 : 0] core$core_mem_master_arid,
		core$core_mem_master_awid,
		core$core_mem_master_bid,
		core$core_mem_master_rid,
		core$cpu_imem_master_arid,
		core$cpu_imem_master_awid,
		core$cpu_imem_master_bid,
		core$cpu_imem_master_rid,
		core$dma_server_arid,
		core$dma_server_awid;
  wire [7 : 0] core$core_mem_master_arlen,
	       core$core_mem_master_awlen,
	       core$core_mem_master_wstrb,
	       core$cpu_imem_master_arlen,
	       core$cpu_imem_master_awlen,
	       core$cpu_imem_master_wstrb,
	       core$dma_server_arlen,
	       core$dma_server_awlen,
	       core$mv_status;
  wire [3 : 0] core$core_mem_master_arcache,
	       core$core_mem_master_arqos,
	       core$core_mem_master_arregion,
	       core$core_mem_master_awcache,
	       core$core_mem_master_awqos,
	       core$core_mem_master_awregion,
	       core$cpu_imem_master_arcache,
	       core$cpu_imem_master_arqos,
	       core$cpu_imem_master_arregion,
	       core$cpu_imem_master_awcache,
	       core$cpu_imem_master_awqos,
	       core$cpu_imem_master_awregion,
	       core$dma_server_arcache,
	       core$dma_server_arqos,
	       core$dma_server_arregion,
	       core$dma_server_awcache,
	       core$dma_server_awqos,
	       core$dma_server_awregion,
	       core$set_verbosity_verbosity;
  wire [2 : 0] core$core_mem_master_arprot,
	       core$core_mem_master_arsize,
	       core$core_mem_master_awprot,
	       core$core_mem_master_awsize,
	       core$cpu_imem_master_arprot,
	       core$cpu_imem_master_arsize,
	       core$cpu_imem_master_awprot,
	       core$cpu_imem_master_awsize,
	       core$dma_server_arprot,
	       core$dma_server_arsize,
	       core$dma_server_awprot,
	       core$dma_server_awsize;
  wire [1 : 0] core$core_mem_master_arburst,
	       core$core_mem_master_awburst,
	       core$core_mem_master_bresp,
	       core$core_mem_master_rresp,
	       core$cpu_imem_master_arburst,
	       core$cpu_imem_master_awburst,
	       core$cpu_imem_master_bresp,
	       core$cpu_imem_master_rresp,
	       core$dma_server_arburst,
	       core$dma_server_awburst;
  wire core$EN_cpu_reset_server_request_put,
       core$EN_cpu_reset_server_response_get,
       core$EN_ma_ddr4_ready,
       core$EN_set_verbosity,
       core$EN_set_watch_tohost,
       core$RDY_cpu_reset_server_request_put,
       core$RDY_cpu_reset_server_response_get,
       core$core_external_interrupt_sources_0_m_interrupt_req_set_not_clear,
       core$core_external_interrupt_sources_10_m_interrupt_req_set_not_clear,
       core$core_external_interrupt_sources_11_m_interrupt_req_set_not_clear,
       core$core_external_interrupt_sources_12_m_interrupt_req_set_not_clear,
       core$core_external_interrupt_sources_13_m_interrupt_req_set_not_clear,
       core$core_external_interrupt_sources_14_m_interrupt_req_set_not_clear,
       core$core_external_interrupt_sources_15_m_interrupt_req_set_not_clear,
       core$core_external_interrupt_sources_1_m_interrupt_req_set_not_clear,
       core$core_external_interrupt_sources_2_m_interrupt_req_set_not_clear,
       core$core_external_interrupt_sources_3_m_interrupt_req_set_not_clear,
       core$core_external_interrupt_sources_4_m_interrupt_req_set_not_clear,
       core$core_external_interrupt_sources_5_m_interrupt_req_set_not_clear,
       core$core_external_interrupt_sources_6_m_interrupt_req_set_not_clear,
       core$core_external_interrupt_sources_7_m_interrupt_req_set_not_clear,
       core$core_external_interrupt_sources_8_m_interrupt_req_set_not_clear,
       core$core_external_interrupt_sources_9_m_interrupt_req_set_not_clear,
       core$core_mem_master_arlock,
       core$core_mem_master_arready,
       core$core_mem_master_arvalid,
       core$core_mem_master_awlock,
       core$core_mem_master_awready,
       core$core_mem_master_awvalid,
       core$core_mem_master_bready,
       core$core_mem_master_bvalid,
       core$core_mem_master_rlast,
       core$core_mem_master_rready,
       core$core_mem_master_rvalid,
       core$core_mem_master_wlast,
       core$core_mem_master_wready,
       core$core_mem_master_wvalid,
       core$cpu_imem_master_arlock,
       core$cpu_imem_master_arready,
       core$cpu_imem_master_arvalid,
       core$cpu_imem_master_awlock,
       core$cpu_imem_master_awready,
       core$cpu_imem_master_awvalid,
       core$cpu_imem_master_bready,
       core$cpu_imem_master_bvalid,
       core$cpu_imem_master_rlast,
       core$cpu_imem_master_rready,
       core$cpu_imem_master_rvalid,
       core$cpu_imem_master_wlast,
       core$cpu_imem_master_wready,
       core$cpu_imem_master_wvalid,
       core$cpu_reset_server_request_put,
       core$dma_server_arlock,
       core$dma_server_arvalid,
       core$dma_server_awlock,
       core$dma_server_awvalid,
       core$dma_server_bready,
       core$dma_server_rready,
       core$dma_server_wlast,
       core$dma_server_wvalid,
       core$nmi_req_set_not_clear,
       core$set_watch_tohost_watch_tohost;
  // ports of submodule fabric
  wire [63 : 0] fabric$v_from_masters_0_araddr,
		fabric$v_from_masters_0_awaddr,
		fabric$v_from_masters_0_rdata,
		fabric$v_from_masters_0_wdata,
		fabric$v_from_masters_1_araddr,
		fabric$v_from_masters_1_awaddr,
		fabric$v_from_masters_1_rdata,
		fabric$v_from_masters_1_wdata,
		fabric$v_to_slaves_0_araddr,
		fabric$v_to_slaves_0_awaddr,
		fabric$v_to_slaves_0_rdata,
		fabric$v_to_slaves_0_wdata,
		fabric$v_to_slaves_1_araddr,
		fabric$v_to_slaves_1_awaddr,
		fabric$v_to_slaves_1_rdata,
		fabric$v_to_slaves_1_wdata,
		fabric$v_to_slaves_2_araddr,
		fabric$v_to_slaves_2_awaddr,
		fabric$v_to_slaves_2_rdata,
		fabric$v_to_slaves_2_wdata;
  wire [15 : 0] fabric$v_from_masters_0_arid,
		fabric$v_from_masters_0_awid,
		fabric$v_from_masters_0_bid,
		fabric$v_from_masters_0_rid,
		fabric$v_from_masters_1_arid,
		fabric$v_from_masters_1_awid,
		fabric$v_from_masters_1_bid,
		fabric$v_from_masters_1_rid,
		fabric$v_to_slaves_0_arid,
		fabric$v_to_slaves_0_awid,
		fabric$v_to_slaves_0_bid,
		fabric$v_to_slaves_0_rid,
		fabric$v_to_slaves_1_arid,
		fabric$v_to_slaves_1_awid,
		fabric$v_to_slaves_1_bid,
		fabric$v_to_slaves_1_rid,
		fabric$v_to_slaves_2_arid,
		fabric$v_to_slaves_2_awid,
		fabric$v_to_slaves_2_bid,
		fabric$v_to_slaves_2_rid;
  wire [7 : 0] fabric$v_from_masters_0_arlen,
	       fabric$v_from_masters_0_awlen,
	       fabric$v_from_masters_0_wstrb,
	       fabric$v_from_masters_1_arlen,
	       fabric$v_from_masters_1_awlen,
	       fabric$v_from_masters_1_wstrb,
	       fabric$v_to_slaves_0_arlen,
	       fabric$v_to_slaves_0_awlen,
	       fabric$v_to_slaves_0_wstrb,
	       fabric$v_to_slaves_1_arlen,
	       fabric$v_to_slaves_1_awlen,
	       fabric$v_to_slaves_1_wstrb,
	       fabric$v_to_slaves_2_arlen,
	       fabric$v_to_slaves_2_awlen,
	       fabric$v_to_slaves_2_wstrb;
  wire [3 : 0] fabric$set_verbosity_verbosity,
	       fabric$v_from_masters_0_arcache,
	       fabric$v_from_masters_0_arqos,
	       fabric$v_from_masters_0_arregion,
	       fabric$v_from_masters_0_awcache,
	       fabric$v_from_masters_0_awqos,
	       fabric$v_from_masters_0_awregion,
	       fabric$v_from_masters_1_arcache,
	       fabric$v_from_masters_1_arqos,
	       fabric$v_from_masters_1_arregion,
	       fabric$v_from_masters_1_awcache,
	       fabric$v_from_masters_1_awqos,
	       fabric$v_from_masters_1_awregion,
	       fabric$v_to_slaves_0_arcache,
	       fabric$v_to_slaves_0_arqos,
	       fabric$v_to_slaves_0_arregion,
	       fabric$v_to_slaves_0_awcache,
	       fabric$v_to_slaves_0_awqos,
	       fabric$v_to_slaves_0_awregion,
	       fabric$v_to_slaves_1_arcache,
	       fabric$v_to_slaves_1_arqos,
	       fabric$v_to_slaves_1_arregion,
	       fabric$v_to_slaves_1_awcache,
	       fabric$v_to_slaves_1_awqos,
	       fabric$v_to_slaves_1_awregion,
	       fabric$v_to_slaves_2_arcache,
	       fabric$v_to_slaves_2_arqos,
	       fabric$v_to_slaves_2_arregion,
	       fabric$v_to_slaves_2_awcache,
	       fabric$v_to_slaves_2_awqos,
	       fabric$v_to_slaves_2_awregion;
  wire [2 : 0] fabric$v_from_masters_0_arprot,
	       fabric$v_from_masters_0_arsize,
	       fabric$v_from_masters_0_awprot,
	       fabric$v_from_masters_0_awsize,
	       fabric$v_from_masters_1_arprot,
	       fabric$v_from_masters_1_arsize,
	       fabric$v_from_masters_1_awprot,
	       fabric$v_from_masters_1_awsize,
	       fabric$v_to_slaves_0_arprot,
	       fabric$v_to_slaves_0_arsize,
	       fabric$v_to_slaves_0_awprot,
	       fabric$v_to_slaves_0_awsize,
	       fabric$v_to_slaves_1_arprot,
	       fabric$v_to_slaves_1_arsize,
	       fabric$v_to_slaves_1_awprot,
	       fabric$v_to_slaves_1_awsize,
	       fabric$v_to_slaves_2_arprot,
	       fabric$v_to_slaves_2_arsize,
	       fabric$v_to_slaves_2_awprot,
	       fabric$v_to_slaves_2_awsize;
  wire [1 : 0] fabric$v_from_masters_0_arburst,
	       fabric$v_from_masters_0_awburst,
	       fabric$v_from_masters_0_bresp,
	       fabric$v_from_masters_0_rresp,
	       fabric$v_from_masters_1_arburst,
	       fabric$v_from_masters_1_awburst,
	       fabric$v_from_masters_1_bresp,
	       fabric$v_from_masters_1_rresp,
	       fabric$v_to_slaves_0_arburst,
	       fabric$v_to_slaves_0_awburst,
	       fabric$v_to_slaves_0_bresp,
	       fabric$v_to_slaves_0_rresp,
	       fabric$v_to_slaves_1_arburst,
	       fabric$v_to_slaves_1_awburst,
	       fabric$v_to_slaves_1_bresp,
	       fabric$v_to_slaves_1_rresp,
	       fabric$v_to_slaves_2_arburst,
	       fabric$v_to_slaves_2_awburst,
	       fabric$v_to_slaves_2_bresp,
	       fabric$v_to_slaves_2_rresp;
  wire fabric$EN_reset,
       fabric$EN_set_verbosity,
       fabric$RDY_reset,
       fabric$v_from_masters_0_arlock,
       fabric$v_from_masters_0_arready,
       fabric$v_from_masters_0_arvalid,
       fabric$v_from_masters_0_awlock,
       fabric$v_from_masters_0_awready,
       fabric$v_from_masters_0_awvalid,
       fabric$v_from_masters_0_bready,
       fabric$v_from_masters_0_bvalid,
       fabric$v_from_masters_0_rlast,
       fabric$v_from_masters_0_rready,
       fabric$v_from_masters_0_rvalid,
       fabric$v_from_masters_0_wlast,
       fabric$v_from_masters_0_wready,
       fabric$v_from_masters_0_wvalid,
       fabric$v_from_masters_1_arlock,
       fabric$v_from_masters_1_arready,
       fabric$v_from_masters_1_arvalid,
       fabric$v_from_masters_1_awlock,
       fabric$v_from_masters_1_awready,
       fabric$v_from_masters_1_awvalid,
       fabric$v_from_masters_1_bready,
       fabric$v_from_masters_1_bvalid,
       fabric$v_from_masters_1_rlast,
       fabric$v_from_masters_1_rready,
       fabric$v_from_masters_1_rvalid,
       fabric$v_from_masters_1_wlast,
       fabric$v_from_masters_1_wready,
       fabric$v_from_masters_1_wvalid,
       fabric$v_to_slaves_0_arlock,
       fabric$v_to_slaves_0_arready,
       fabric$v_to_slaves_0_arvalid,
       fabric$v_to_slaves_0_awlock,
       fabric$v_to_slaves_0_awready,
       fabric$v_to_slaves_0_awvalid,
       fabric$v_to_slaves_0_bready,
       fabric$v_to_slaves_0_bvalid,
       fabric$v_to_slaves_0_rlast,
       fabric$v_to_slaves_0_rready,
       fabric$v_to_slaves_0_rvalid,
       fabric$v_to_slaves_0_wlast,
       fabric$v_to_slaves_0_wready,
       fabric$v_to_slaves_0_wvalid,
       fabric$v_to_slaves_1_arlock,
       fabric$v_to_slaves_1_arready,
       fabric$v_to_slaves_1_arvalid,
       fabric$v_to_slaves_1_awlock,
       fabric$v_to_slaves_1_awready,
       fabric$v_to_slaves_1_awvalid,
       fabric$v_to_slaves_1_bready,
       fabric$v_to_slaves_1_bvalid,
       fabric$v_to_slaves_1_rlast,
       fabric$v_to_slaves_1_rready,
       fabric$v_to_slaves_1_rvalid,
       fabric$v_to_slaves_1_wlast,
       fabric$v_to_slaves_1_wready,
       fabric$v_to_slaves_1_wvalid,
       fabric$v_to_slaves_2_arlock,
       fabric$v_to_slaves_2_arready,
       fabric$v_to_slaves_2_arvalid,
       fabric$v_to_slaves_2_awlock,
       fabric$v_to_slaves_2_awready,
       fabric$v_to_slaves_2_awvalid,
       fabric$v_to_slaves_2_bready,
       fabric$v_to_slaves_2_bvalid,
       fabric$v_to_slaves_2_rlast,
       fabric$v_to_slaves_2_rready,
       fabric$v_to_slaves_2_rvalid,
       fabric$v_to_slaves_2_wlast,
       fabric$v_to_slaves_2_wready,
       fabric$v_to_slaves_2_wvalid;
  // ports of submodule mem0_controller
  wire [352 : 0] mem0_controller$to_raw_mem_request_get;
  wire [255 : 0] mem0_controller$to_raw_mem_response_put;
  wire [63 : 0] mem0_controller$set_addr_map_addr_base,
		mem0_controller$set_addr_map_addr_lim,
		mem0_controller$set_watch_tohost_tohost_addr,
		mem0_controller$slave_araddr,
		mem0_controller$slave_awaddr,
		mem0_controller$slave_rdata,
		mem0_controller$slave_wdata;
  wire [15 : 0] mem0_controller$slave_arid,
		mem0_controller$slave_awid,
		mem0_controller$slave_bid,
		mem0_controller$slave_rid;
  wire [7 : 0] mem0_controller$slave_arlen,
	       mem0_controller$slave_awlen,
	       mem0_controller$slave_wstrb;
  wire [3 : 0] mem0_controller$slave_arcache,
	       mem0_controller$slave_arqos,
	       mem0_controller$slave_arregion,
	       mem0_controller$slave_awcache,
	       mem0_controller$slave_awqos,
	       mem0_controller$slave_awregion;
  wire [2 : 0] mem0_controller$slave_arprot,
	       mem0_controller$slave_arsize,
	       mem0_controller$slave_awprot,
	       mem0_controller$slave_awsize;
  wire [1 : 0] mem0_controller$slave_arburst,
	       mem0_controller$slave_awburst,
	       mem0_controller$slave_bresp,
	       mem0_controller$slave_rresp;
  wire mem0_controller$EN_server_reset_request_put,
       mem0_controller$EN_server_reset_response_get,
       mem0_controller$EN_set_addr_map,
       mem0_controller$EN_set_watch_tohost,
       mem0_controller$EN_to_raw_mem_request_get,
       mem0_controller$EN_to_raw_mem_response_put,
       mem0_controller$RDY_server_reset_request_put,
       mem0_controller$RDY_server_reset_response_get,
       mem0_controller$RDY_set_addr_map,
       mem0_controller$RDY_to_raw_mem_request_get,
       mem0_controller$RDY_to_raw_mem_response_put,
       mem0_controller$set_watch_tohost_watch_tohost,
       mem0_controller$slave_arlock,
       mem0_controller$slave_arready,
       mem0_controller$slave_arvalid,
       mem0_controller$slave_awlock,
       mem0_controller$slave_awready,
       mem0_controller$slave_awvalid,
       mem0_controller$slave_bready,
       mem0_controller$slave_bvalid,
       mem0_controller$slave_rlast,
       mem0_controller$slave_rready,
       mem0_controller$slave_rvalid,
       mem0_controller$slave_wlast,
       mem0_controller$slave_wready,
       mem0_controller$slave_wvalid;
  // ports of submodule mem0_controller_axi4_deburster
  wire [63 : 0] mem0_controller_axi4_deburster$from_master_araddr,
		mem0_controller_axi4_deburster$from_master_awaddr,
		mem0_controller_axi4_deburster$from_master_rdata,
		mem0_controller_axi4_deburster$from_master_wdata,
		mem0_controller_axi4_deburster$to_slave_araddr,
		mem0_controller_axi4_deburster$to_slave_awaddr,
		mem0_controller_axi4_deburster$to_slave_rdata,
		mem0_controller_axi4_deburster$to_slave_wdata;
  wire [15 : 0] mem0_controller_axi4_deburster$from_master_arid,
		mem0_controller_axi4_deburster$from_master_awid,
		mem0_controller_axi4_deburster$from_master_bid,
		mem0_controller_axi4_deburster$from_master_rid,
		mem0_controller_axi4_deburster$to_slave_arid,
		mem0_controller_axi4_deburster$to_slave_awid,
		mem0_controller_axi4_deburster$to_slave_bid,
		mem0_controller_axi4_deburster$to_slave_rid;
  wire [7 : 0] mem0_controller_axi4_deburster$from_master_arlen,
	       mem0_controller_axi4_deburster$from_master_awlen,
	       mem0_controller_axi4_deburster$from_master_wstrb,
	       mem0_controller_axi4_deburster$to_slave_arlen,
	       mem0_controller_axi4_deburster$to_slave_awlen,
	       mem0_controller_axi4_deburster$to_slave_wstrb;
  wire [3 : 0] mem0_controller_axi4_deburster$from_master_arcache,
	       mem0_controller_axi4_deburster$from_master_arqos,
	       mem0_controller_axi4_deburster$from_master_arregion,
	       mem0_controller_axi4_deburster$from_master_awcache,
	       mem0_controller_axi4_deburster$from_master_awqos,
	       mem0_controller_axi4_deburster$from_master_awregion,
	       mem0_controller_axi4_deburster$to_slave_arcache,
	       mem0_controller_axi4_deburster$to_slave_arqos,
	       mem0_controller_axi4_deburster$to_slave_arregion,
	       mem0_controller_axi4_deburster$to_slave_awcache,
	       mem0_controller_axi4_deburster$to_slave_awqos,
	       mem0_controller_axi4_deburster$to_slave_awregion;
  wire [2 : 0] mem0_controller_axi4_deburster$from_master_arprot,
	       mem0_controller_axi4_deburster$from_master_arsize,
	       mem0_controller_axi4_deburster$from_master_awprot,
	       mem0_controller_axi4_deburster$from_master_awsize,
	       mem0_controller_axi4_deburster$to_slave_arprot,
	       mem0_controller_axi4_deburster$to_slave_arsize,
	       mem0_controller_axi4_deburster$to_slave_awprot,
	       mem0_controller_axi4_deburster$to_slave_awsize;
  wire [1 : 0] mem0_controller_axi4_deburster$from_master_arburst,
	       mem0_controller_axi4_deburster$from_master_awburst,
	       mem0_controller_axi4_deburster$from_master_bresp,
	       mem0_controller_axi4_deburster$from_master_rresp,
	       mem0_controller_axi4_deburster$to_slave_arburst,
	       mem0_controller_axi4_deburster$to_slave_awburst,
	       mem0_controller_axi4_deburster$to_slave_bresp,
	       mem0_controller_axi4_deburster$to_slave_rresp;
  wire mem0_controller_axi4_deburster$EN_reset,
       mem0_controller_axi4_deburster$from_master_arlock,
       mem0_controller_axi4_deburster$from_master_arready,
       mem0_controller_axi4_deburster$from_master_arvalid,
       mem0_controller_axi4_deburster$from_master_awlock,
       mem0_controller_axi4_deburster$from_master_awready,
       mem0_controller_axi4_deburster$from_master_awvalid,
       mem0_controller_axi4_deburster$from_master_bready,
       mem0_controller_axi4_deburster$from_master_bvalid,
       mem0_controller_axi4_deburster$from_master_rlast,
       mem0_controller_axi4_deburster$from_master_rready,
       mem0_controller_axi4_deburster$from_master_rvalid,
       mem0_controller_axi4_deburster$from_master_wlast,
       mem0_controller_axi4_deburster$from_master_wready,
       mem0_controller_axi4_deburster$from_master_wvalid,
       mem0_controller_axi4_deburster$to_slave_arlock,
       mem0_controller_axi4_deburster$to_slave_arready,
       mem0_controller_axi4_deburster$to_slave_arvalid,
       mem0_controller_axi4_deburster$to_slave_awlock,
       mem0_controller_axi4_deburster$to_slave_awready,
       mem0_controller_axi4_deburster$to_slave_awvalid,
       mem0_controller_axi4_deburster$to_slave_bready,
       mem0_controller_axi4_deburster$to_slave_bvalid,
       mem0_controller_axi4_deburster$to_slave_rlast,
       mem0_controller_axi4_deburster$to_slave_rready,
       mem0_controller_axi4_deburster$to_slave_rvalid,
       mem0_controller_axi4_deburster$to_slave_wlast,
       mem0_controller_axi4_deburster$to_slave_wready,
       mem0_controller_axi4_deburster$to_slave_wvalid;
  // ports of submodule uart0
  wire [63 : 0] uart0$set_addr_map_addr_base,
		uart0$set_addr_map_addr_lim,
		uart0$slave_araddr,
		uart0$slave_awaddr,
		uart0$slave_rdata,
		uart0$slave_wdata;
  wire [15 : 0] uart0$slave_arid,
		uart0$slave_awid,
		uart0$slave_bid,
		uart0$slave_rid;
  wire [7 : 0] uart0$get_to_console_get,
	       uart0$put_from_console_put,
	       uart0$slave_arlen,
	       uart0$slave_awlen,
	       uart0$slave_wstrb;
  wire [3 : 0] uart0$slave_arcache,
	       uart0$slave_arqos,
	       uart0$slave_arregion,
	       uart0$slave_awcache,
	       uart0$slave_awqos,
	       uart0$slave_awregion;
  wire [2 : 0] uart0$slave_arprot,
	       uart0$slave_arsize,
	       uart0$slave_awprot,
	       uart0$slave_awsize;
  wire [1 : 0] uart0$slave_arburst,
	       uart0$slave_awburst,
	       uart0$slave_bresp,
	       uart0$slave_rresp;
  wire uart0$EN_get_to_console_get,
       uart0$EN_put_from_console_put,
       uart0$EN_server_reset_request_put,
       uart0$EN_server_reset_response_get,
       uart0$EN_set_addr_map,
       uart0$RDY_get_to_console_get,
       uart0$RDY_put_from_console_put,
       uart0$RDY_server_reset_request_put,
       uart0$RDY_server_reset_response_get,
       uart0$intr,
       uart0$slave_arlock,
       uart0$slave_arready,
       uart0$slave_arvalid,
       uart0$slave_awlock,
       uart0$slave_awready,
       uart0$slave_awvalid,
       uart0$slave_bready,
       uart0$slave_bvalid,
       uart0$slave_rlast,
       uart0$slave_rready,
       uart0$slave_rvalid,
       uart0$slave_wlast,
       uart0$slave_wready,
       uart0$slave_wvalid;
  // rule scheduling signals
  wire CAN_FIRE_RL_rl_connect_external_interrupt_requests,
       CAN_FIRE_RL_rl_rd_addr_channel,
       CAN_FIRE_RL_rl_rd_addr_channel_1,
       CAN_FIRE_RL_rl_rd_addr_channel_2,
       CAN_FIRE_RL_rl_rd_addr_channel_3,
       CAN_FIRE_RL_rl_rd_addr_channel_4,
       CAN_FIRE_RL_rl_rd_addr_channel_5,
       CAN_FIRE_RL_rl_rd_addr_channel_6,
       CAN_FIRE_RL_rl_rd_addr_channel_7,
       CAN_FIRE_RL_rl_rd_data_channel,
       CAN_FIRE_RL_rl_rd_data_channel_1,
       CAN_FIRE_RL_rl_rd_data_channel_2,
       CAN_FIRE_RL_rl_rd_data_channel_3,
       CAN_FIRE_RL_rl_rd_data_channel_4,
       CAN_FIRE_RL_rl_rd_data_channel_5,
       CAN_FIRE_RL_rl_rd_data_channel_6,
       CAN_FIRE_RL_rl_rd_data_channel_7,
       CAN_FIRE_RL_rl_reset_complete_initial,
       CAN_FIRE_RL_rl_reset_start_initial,
       CAN_FIRE_RL_rl_wr_addr_channel,
       CAN_FIRE_RL_rl_wr_addr_channel_1,
       CAN_FIRE_RL_rl_wr_addr_channel_2,
       CAN_FIRE_RL_rl_wr_addr_channel_3,
       CAN_FIRE_RL_rl_wr_addr_channel_4,
       CAN_FIRE_RL_rl_wr_addr_channel_5,
       CAN_FIRE_RL_rl_wr_addr_channel_6,
       CAN_FIRE_RL_rl_wr_addr_channel_7,
       CAN_FIRE_RL_rl_wr_data_channel,
       CAN_FIRE_RL_rl_wr_data_channel_1,
       CAN_FIRE_RL_rl_wr_data_channel_2,
       CAN_FIRE_RL_rl_wr_data_channel_3,
       CAN_FIRE_RL_rl_wr_data_channel_4,
       CAN_FIRE_RL_rl_wr_data_channel_5,
       CAN_FIRE_RL_rl_wr_data_channel_6,
       CAN_FIRE_RL_rl_wr_data_channel_7,
       CAN_FIRE_RL_rl_wr_response_channel,
       CAN_FIRE_RL_rl_wr_response_channel_1,
       CAN_FIRE_RL_rl_wr_response_channel_2,
       CAN_FIRE_RL_rl_wr_response_channel_3,
       CAN_FIRE_RL_rl_wr_response_channel_4,
       CAN_FIRE_RL_rl_wr_response_channel_5,
       CAN_FIRE_RL_rl_wr_response_channel_6,
       CAN_FIRE_RL_rl_wr_response_channel_7,
       CAN_FIRE_get_to_console_get,
       CAN_FIRE_ma_ddr4_ready,
       CAN_FIRE_put_from_console_put,
       CAN_FIRE_set_verbosity,
       CAN_FIRE_set_watch_tohost,
       CAN_FIRE_to_raw_mem_request_get,
       CAN_FIRE_to_raw_mem_response_put,
       WILL_FIRE_RL_rl_connect_external_interrupt_requests,
       WILL_FIRE_RL_rl_rd_addr_channel,
       WILL_FIRE_RL_rl_rd_addr_channel_1,
       WILL_FIRE_RL_rl_rd_addr_channel_2,
       WILL_FIRE_RL_rl_rd_addr_channel_3,
       WILL_FIRE_RL_rl_rd_addr_channel_4,
       WILL_FIRE_RL_rl_rd_addr_channel_5,
       WILL_FIRE_RL_rl_rd_addr_channel_6,
       WILL_FIRE_RL_rl_rd_addr_channel_7,
       WILL_FIRE_RL_rl_rd_data_channel,
       WILL_FIRE_RL_rl_rd_data_channel_1,
       WILL_FIRE_RL_rl_rd_data_channel_2,
       WILL_FIRE_RL_rl_rd_data_channel_3,
       WILL_FIRE_RL_rl_rd_data_channel_4,
       WILL_FIRE_RL_rl_rd_data_channel_5,
       WILL_FIRE_RL_rl_rd_data_channel_6,
       WILL_FIRE_RL_rl_rd_data_channel_7,
       WILL_FIRE_RL_rl_reset_complete_initial,
       WILL_FIRE_RL_rl_reset_start_initial,
       WILL_FIRE_RL_rl_wr_addr_channel,
       WILL_FIRE_RL_rl_wr_addr_channel_1,
       WILL_FIRE_RL_rl_wr_addr_channel_2,
       WILL_FIRE_RL_rl_wr_addr_channel_3,
       WILL_FIRE_RL_rl_wr_addr_channel_4,
       WILL_FIRE_RL_rl_wr_addr_channel_5,
       WILL_FIRE_RL_rl_wr_addr_channel_6,
       WILL_FIRE_RL_rl_wr_addr_channel_7,
       WILL_FIRE_RL_rl_wr_data_channel,
       WILL_FIRE_RL_rl_wr_data_channel_1,
       WILL_FIRE_RL_rl_wr_data_channel_2,
       WILL_FIRE_RL_rl_wr_data_channel_3,
       WILL_FIRE_RL_rl_wr_data_channel_4,
       WILL_FIRE_RL_rl_wr_data_channel_5,
       WILL_FIRE_RL_rl_wr_data_channel_6,
       WILL_FIRE_RL_rl_wr_data_channel_7,
       WILL_FIRE_RL_rl_wr_response_channel,
       WILL_FIRE_RL_rl_wr_response_channel_1,
       WILL_FIRE_RL_rl_wr_response_channel_2,
       WILL_FIRE_RL_rl_wr_response_channel_3,
       WILL_FIRE_RL_rl_wr_response_channel_4,
       WILL_FIRE_RL_rl_wr_response_channel_5,
       WILL_FIRE_RL_rl_wr_response_channel_6,
       WILL_FIRE_RL_rl_wr_response_channel_7,
       WILL_FIRE_get_to_console_get,
       WILL_FIRE_ma_ddr4_ready,
       WILL_FIRE_put_from_console_put,
       WILL_FIRE_set_verbosity,
       WILL_FIRE_set_watch_tohost,
       WILL_FIRE_to_raw_mem_request_get,
       WILL_FIRE_to_raw_mem_response_put;
  // inputs to muxes for submodule ports
  wire MUX_rg_state$write_1__SEL_1, MUX_rg_state$write_1__SEL_2;
  // declarations used by system tasks
  // synopsys translate_off
  reg [31 : 0] v__h11352;
  reg [31 : 0] v__h11582;
  reg [31 : 0] v__h11346;
  reg [31 : 0] v__h11576;
  // synopsys translate_on
  // actionvalue method to_raw_mem_request_get
  assign to_raw_mem_request_get = mem0_controller$to_raw_mem_request_get ;
  assign RDY_to_raw_mem_request_get =
	     mem0_controller$RDY_to_raw_mem_request_get ;
  assign CAN_FIRE_to_raw_mem_request_get =
	     mem0_controller$RDY_to_raw_mem_request_get ;
  assign WILL_FIRE_to_raw_mem_request_get = EN_to_raw_mem_request_get ;
  // action method to_raw_mem_response_put
  assign RDY_to_raw_mem_response_put =
	     mem0_controller$RDY_to_raw_mem_response_put ;
  assign CAN_FIRE_to_raw_mem_response_put =
	     mem0_controller$RDY_to_raw_mem_response_put ;
  assign WILL_FIRE_to_raw_mem_response_put = EN_to_raw_mem_response_put ;
  // actionvalue method get_to_console_get
  assign get_to_console_get = uart0$get_to_console_get ;
  assign RDY_get_to_console_get = uart0$RDY_get_to_console_get ;
  assign CAN_FIRE_get_to_console_get = uart0$RDY_get_to_console_get ;
  assign WILL_FIRE_get_to_console_get = EN_get_to_console_get ;
  // action method put_from_console_put
  assign RDY_put_from_console_put = uart0$RDY_put_from_console_put ;
  assign CAN_FIRE_put_from_console_put = uart0$RDY_put_from_console_put ;
  assign WILL_FIRE_put_from_console_put = EN_put_from_console_put ;
  // value method status
  assign status = 8'd0 ;
  // action method set_verbosity
  assign RDY_set_verbosity = 1'd1 ;
  assign CAN_FIRE_set_verbosity = 1'd1 ;
  assign WILL_FIRE_set_verbosity = EN_set_verbosity ;
  // action method set_watch_tohost
  assign RDY_set_watch_tohost = 1'd1 ;
  assign CAN_FIRE_set_watch_tohost = 1'd1 ;
  assign WILL_FIRE_set_watch_tohost = EN_set_watch_tohost ;
  // value method mv_tohost_value
  assign mv_tohost_value = core$mv_tohost_value ;
  assign RDY_mv_tohost_value = 1'd1 ;
  // action method ma_ddr4_ready
  assign RDY_ma_ddr4_ready = 1'd1 ;
  assign CAN_FIRE_ma_ddr4_ready = 1'd1 ;
  assign WILL_FIRE_ma_ddr4_ready = EN_ma_ddr4_ready ;
  // value method mv_status
  assign mv_status = core$mv_status ;
  // submodule boot_rom
  mkBoot_ROM boot_rom(.CLK(CLK),
		      .RST_N(RST_N),
		      .set_addr_map_addr_base(boot_rom$set_addr_map_addr_base),
		      .set_addr_map_addr_lim(boot_rom$set_addr_map_addr_lim),
		      .slave_araddr(boot_rom$slave_araddr),
		      .slave_arburst(boot_rom$slave_arburst),
		      .slave_arcache(boot_rom$slave_arcache),
		      .slave_arid(boot_rom$slave_arid),
		      .slave_arlen(boot_rom$slave_arlen),
		      .slave_arlock(boot_rom$slave_arlock),
		      .slave_arprot(boot_rom$slave_arprot),
		      .slave_arqos(boot_rom$slave_arqos),
		      .slave_arregion(boot_rom$slave_arregion),
		      .slave_arsize(boot_rom$slave_arsize),
		      .slave_arvalid(boot_rom$slave_arvalid),
		      .slave_awaddr(boot_rom$slave_awaddr),
		      .slave_awburst(boot_rom$slave_awburst),
		      .slave_awcache(boot_rom$slave_awcache),
		      .slave_awid(boot_rom$slave_awid),
		      .slave_awlen(boot_rom$slave_awlen),
		      .slave_awlock(boot_rom$slave_awlock),
		      .slave_awprot(boot_rom$slave_awprot),
		      .slave_awqos(boot_rom$slave_awqos),
		      .slave_awregion(boot_rom$slave_awregion),
		      .slave_awsize(boot_rom$slave_awsize),
		      .slave_awvalid(boot_rom$slave_awvalid),
		      .slave_bready(boot_rom$slave_bready),
		      .slave_rready(boot_rom$slave_rready),
		      .slave_wdata(boot_rom$slave_wdata),
		      .slave_wlast(boot_rom$slave_wlast),
		      .slave_wstrb(boot_rom$slave_wstrb),
		      .slave_wvalid(boot_rom$slave_wvalid),
		      .EN_set_addr_map(boot_rom$EN_set_addr_map),
		      .RDY_set_addr_map(),
		      .slave_awready(boot_rom$slave_awready),
		      .slave_wready(boot_rom$slave_wready),
		      .slave_bvalid(boot_rom$slave_bvalid),
		      .slave_bid(boot_rom$slave_bid),
		      .slave_bresp(boot_rom$slave_bresp),
		      .slave_arready(boot_rom$slave_arready),
		      .slave_rvalid(boot_rom$slave_rvalid),
		      .slave_rid(boot_rom$slave_rid),
		      .slave_rdata(boot_rom$slave_rdata),
		      .slave_rresp(boot_rom$slave_rresp),
		      .slave_rlast(boot_rom$slave_rlast));
  // submodule boot_rom_axi4_deburster
  mkAXI4_Deburster_A boot_rom_axi4_deburster(.CLK(CLK),
					     .RST_N(RST_N),
					     .from_master_araddr(boot_rom_axi4_deburster$from_master_araddr),
					     .from_master_arburst(boot_rom_axi4_deburster$from_master_arburst),
					     .from_master_arcache(boot_rom_axi4_deburster$from_master_arcache),
					     .from_master_arid(boot_rom_axi4_deburster$from_master_arid),
					     .from_master_arlen(boot_rom_axi4_deburster$from_master_arlen),
					     .from_master_arlock(boot_rom_axi4_deburster$from_master_arlock),
					     .from_master_arprot(boot_rom_axi4_deburster$from_master_arprot),
					     .from_master_arqos(boot_rom_axi4_deburster$from_master_arqos),
					     .from_master_arregion(boot_rom_axi4_deburster$from_master_arregion),
					     .from_master_arsize(boot_rom_axi4_deburster$from_master_arsize),
					     .from_master_arvalid(boot_rom_axi4_deburster$from_master_arvalid),
					     .from_master_awaddr(boot_rom_axi4_deburster$from_master_awaddr),
					     .from_master_awburst(boot_rom_axi4_deburster$from_master_awburst),
					     .from_master_awcache(boot_rom_axi4_deburster$from_master_awcache),
					     .from_master_awid(boot_rom_axi4_deburster$from_master_awid),
					     .from_master_awlen(boot_rom_axi4_deburster$from_master_awlen),
					     .from_master_awlock(boot_rom_axi4_deburster$from_master_awlock),
					     .from_master_awprot(boot_rom_axi4_deburster$from_master_awprot),
					     .from_master_awqos(boot_rom_axi4_deburster$from_master_awqos),
					     .from_master_awregion(boot_rom_axi4_deburster$from_master_awregion),
					     .from_master_awsize(boot_rom_axi4_deburster$from_master_awsize),
					     .from_master_awvalid(boot_rom_axi4_deburster$from_master_awvalid),
					     .from_master_bready(boot_rom_axi4_deburster$from_master_bready),
					     .from_master_rready(boot_rom_axi4_deburster$from_master_rready),
					     .from_master_wdata(boot_rom_axi4_deburster$from_master_wdata),
					     .from_master_wlast(boot_rom_axi4_deburster$from_master_wlast),
					     .from_master_wstrb(boot_rom_axi4_deburster$from_master_wstrb),
					     .from_master_wvalid(boot_rom_axi4_deburster$from_master_wvalid),
					     .to_slave_arready(boot_rom_axi4_deburster$to_slave_arready),
					     .to_slave_awready(boot_rom_axi4_deburster$to_slave_awready),
					     .to_slave_bid(boot_rom_axi4_deburster$to_slave_bid),
					     .to_slave_bresp(boot_rom_axi4_deburster$to_slave_bresp),
					     .to_slave_bvalid(boot_rom_axi4_deburster$to_slave_bvalid),
					     .to_slave_rdata(boot_rom_axi4_deburster$to_slave_rdata),
					     .to_slave_rid(boot_rom_axi4_deburster$to_slave_rid),
					     .to_slave_rlast(boot_rom_axi4_deburster$to_slave_rlast),
					     .to_slave_rresp(boot_rom_axi4_deburster$to_slave_rresp),
					     .to_slave_rvalid(boot_rom_axi4_deburster$to_slave_rvalid),
					     .to_slave_wready(boot_rom_axi4_deburster$to_slave_wready),
					     .EN_reset(boot_rom_axi4_deburster$EN_reset),
					     .RDY_reset(),
					     .from_master_awready(boot_rom_axi4_deburster$from_master_awready),
					     .from_master_wready(boot_rom_axi4_deburster$from_master_wready),
					     .from_master_bvalid(boot_rom_axi4_deburster$from_master_bvalid),
					     .from_master_bid(boot_rom_axi4_deburster$from_master_bid),
					     .from_master_bresp(boot_rom_axi4_deburster$from_master_bresp),
					     .from_master_arready(boot_rom_axi4_deburster$from_master_arready),
					     .from_master_rvalid(boot_rom_axi4_deburster$from_master_rvalid),
					     .from_master_rid(boot_rom_axi4_deburster$from_master_rid),
					     .from_master_rdata(boot_rom_axi4_deburster$from_master_rdata),
					     .from_master_rresp(boot_rom_axi4_deburster$from_master_rresp),
					     .from_master_rlast(boot_rom_axi4_deburster$from_master_rlast),
					     .to_slave_awvalid(boot_rom_axi4_deburster$to_slave_awvalid),
					     .to_slave_awid(boot_rom_axi4_deburster$to_slave_awid),
					     .to_slave_awaddr(boot_rom_axi4_deburster$to_slave_awaddr),
					     .to_slave_awlen(boot_rom_axi4_deburster$to_slave_awlen),
					     .to_slave_awsize(boot_rom_axi4_deburster$to_slave_awsize),
					     .to_slave_awburst(boot_rom_axi4_deburster$to_slave_awburst),
					     .to_slave_awlock(boot_rom_axi4_deburster$to_slave_awlock),
					     .to_slave_awcache(boot_rom_axi4_deburster$to_slave_awcache),
					     .to_slave_awprot(boot_rom_axi4_deburster$to_slave_awprot),
					     .to_slave_awqos(boot_rom_axi4_deburster$to_slave_awqos),
					     .to_slave_awregion(boot_rom_axi4_deburster$to_slave_awregion),
					     .to_slave_wvalid(boot_rom_axi4_deburster$to_slave_wvalid),
					     .to_slave_wdata(boot_rom_axi4_deburster$to_slave_wdata),
					     .to_slave_wstrb(boot_rom_axi4_deburster$to_slave_wstrb),
					     .to_slave_wlast(boot_rom_axi4_deburster$to_slave_wlast),
					     .to_slave_bready(boot_rom_axi4_deburster$to_slave_bready),
					     .to_slave_arvalid(boot_rom_axi4_deburster$to_slave_arvalid),
					     .to_slave_arid(boot_rom_axi4_deburster$to_slave_arid),
					     .to_slave_araddr(boot_rom_axi4_deburster$to_slave_araddr),
					     .to_slave_arlen(boot_rom_axi4_deburster$to_slave_arlen),
					     .to_slave_arsize(boot_rom_axi4_deburster$to_slave_arsize),
					     .to_slave_arburst(boot_rom_axi4_deburster$to_slave_arburst),
					     .to_slave_arlock(boot_rom_axi4_deburster$to_slave_arlock),
					     .to_slave_arcache(boot_rom_axi4_deburster$to_slave_arcache),
					     .to_slave_arprot(boot_rom_axi4_deburster$to_slave_arprot),
					     .to_slave_arqos(boot_rom_axi4_deburster$to_slave_arqos),
					     .to_slave_arregion(boot_rom_axi4_deburster$to_slave_arregion),
					     .to_slave_rready(boot_rom_axi4_deburster$to_slave_rready));
  // submodule core
  mkCore core(.RST_N_dm_power_on_reset(RST_N),
	      .CLK(CLK),
	      .RST_N(RST_N),
	      .core_external_interrupt_sources_0_m_interrupt_req_set_not_clear(core$core_external_interrupt_sources_0_m_interrupt_req_set_not_clear),
	      .core_external_interrupt_sources_10_m_interrupt_req_set_not_clear(core$core_external_interrupt_sources_10_m_interrupt_req_set_not_clear),
	      .core_external_interrupt_sources_11_m_interrupt_req_set_not_clear(core$core_external_interrupt_sources_11_m_interrupt_req_set_not_clear),
	      .core_external_interrupt_sources_12_m_interrupt_req_set_not_clear(core$core_external_interrupt_sources_12_m_interrupt_req_set_not_clear),
	      .core_external_interrupt_sources_13_m_interrupt_req_set_not_clear(core$core_external_interrupt_sources_13_m_interrupt_req_set_not_clear),
	      .core_external_interrupt_sources_14_m_interrupt_req_set_not_clear(core$core_external_interrupt_sources_14_m_interrupt_req_set_not_clear),
	      .core_external_interrupt_sources_15_m_interrupt_req_set_not_clear(core$core_external_interrupt_sources_15_m_interrupt_req_set_not_clear),
	      .core_external_interrupt_sources_1_m_interrupt_req_set_not_clear(core$core_external_interrupt_sources_1_m_interrupt_req_set_not_clear),
	      .core_external_interrupt_sources_2_m_interrupt_req_set_not_clear(core$core_external_interrupt_sources_2_m_interrupt_req_set_not_clear),
	      .core_external_interrupt_sources_3_m_interrupt_req_set_not_clear(core$core_external_interrupt_sources_3_m_interrupt_req_set_not_clear),
	      .core_external_interrupt_sources_4_m_interrupt_req_set_not_clear(core$core_external_interrupt_sources_4_m_interrupt_req_set_not_clear),
	      .core_external_interrupt_sources_5_m_interrupt_req_set_not_clear(core$core_external_interrupt_sources_5_m_interrupt_req_set_not_clear),
	      .core_external_interrupt_sources_6_m_interrupt_req_set_not_clear(core$core_external_interrupt_sources_6_m_interrupt_req_set_not_clear),
	      .core_external_interrupt_sources_7_m_interrupt_req_set_not_clear(core$core_external_interrupt_sources_7_m_interrupt_req_set_not_clear),
	      .core_external_interrupt_sources_8_m_interrupt_req_set_not_clear(core$core_external_interrupt_sources_8_m_interrupt_req_set_not_clear),
	      .core_external_interrupt_sources_9_m_interrupt_req_set_not_clear(core$core_external_interrupt_sources_9_m_interrupt_req_set_not_clear),
	      .core_mem_master_arready(core$core_mem_master_arready),
	      .core_mem_master_awready(core$core_mem_master_awready),
	      .core_mem_master_bid(core$core_mem_master_bid),
	      .core_mem_master_bresp(core$core_mem_master_bresp),
	      .core_mem_master_bvalid(core$core_mem_master_bvalid),
	      .core_mem_master_rdata(core$core_mem_master_rdata),
	      .core_mem_master_rid(core$core_mem_master_rid),
	      .core_mem_master_rlast(core$core_mem_master_rlast),
	      .core_mem_master_rresp(core$core_mem_master_rresp),
	      .core_mem_master_rvalid(core$core_mem_master_rvalid),
	      .core_mem_master_wready(core$core_mem_master_wready),
	      .cpu_imem_master_arready(core$cpu_imem_master_arready),
	      .cpu_imem_master_awready(core$cpu_imem_master_awready),
	      .cpu_imem_master_bid(core$cpu_imem_master_bid),
	      .cpu_imem_master_bresp(core$cpu_imem_master_bresp),
	      .cpu_imem_master_bvalid(core$cpu_imem_master_bvalid),
	      .cpu_imem_master_rdata(core$cpu_imem_master_rdata),
	      .cpu_imem_master_rid(core$cpu_imem_master_rid),
	      .cpu_imem_master_rlast(core$cpu_imem_master_rlast),
	      .cpu_imem_master_rresp(core$cpu_imem_master_rresp),
	      .cpu_imem_master_rvalid(core$cpu_imem_master_rvalid),
	      .cpu_imem_master_wready(core$cpu_imem_master_wready),
	      .cpu_reset_server_request_put(core$cpu_reset_server_request_put),
	      .dma_server_araddr(core$dma_server_araddr),
	      .dma_server_arburst(core$dma_server_arburst),
	      .dma_server_arcache(core$dma_server_arcache),
	      .dma_server_arid(core$dma_server_arid),
	      .dma_server_arlen(core$dma_server_arlen),
	      .dma_server_arlock(core$dma_server_arlock),
	      .dma_server_arprot(core$dma_server_arprot),
	      .dma_server_arqos(core$dma_server_arqos),
	      .dma_server_arregion(core$dma_server_arregion),
	      .dma_server_arsize(core$dma_server_arsize),
	      .dma_server_arvalid(core$dma_server_arvalid),
	      .dma_server_awaddr(core$dma_server_awaddr),
	      .dma_server_awburst(core$dma_server_awburst),
	      .dma_server_awcache(core$dma_server_awcache),
	      .dma_server_awid(core$dma_server_awid),
	      .dma_server_awlen(core$dma_server_awlen),
	      .dma_server_awlock(core$dma_server_awlock),
	      .dma_server_awprot(core$dma_server_awprot),
	      .dma_server_awqos(core$dma_server_awqos),
	      .dma_server_awregion(core$dma_server_awregion),
	      .dma_server_awsize(core$dma_server_awsize),
	      .dma_server_awvalid(core$dma_server_awvalid),
	      .dma_server_bready(core$dma_server_bready),
	      .dma_server_rready(core$dma_server_rready),
	      .dma_server_wdata(core$dma_server_wdata),
	      .dma_server_wlast(core$dma_server_wlast),
	      .dma_server_wstrb(core$dma_server_wstrb),
	      .dma_server_wvalid(core$dma_server_wvalid),
	      .nmi_req_set_not_clear(core$nmi_req_set_not_clear),
	      .set_verbosity_logdelay(core$set_verbosity_logdelay),
	      .set_verbosity_verbosity(core$set_verbosity_verbosity),
	      .set_watch_tohost_tohost_addr(core$set_watch_tohost_tohost_addr),
	      .set_watch_tohost_watch_tohost(core$set_watch_tohost_watch_tohost),
	      .EN_cpu_reset_server_request_put(core$EN_cpu_reset_server_request_put),
	      .EN_cpu_reset_server_response_get(core$EN_cpu_reset_server_response_get),
	      .EN_set_verbosity(core$EN_set_verbosity),
	      .EN_set_watch_tohost(core$EN_set_watch_tohost),
	      .EN_ma_ddr4_ready(core$EN_ma_ddr4_ready),
	      .RDY_cpu_reset_server_request_put(core$RDY_cpu_reset_server_request_put),
	      .cpu_reset_server_response_get(),
	      .RDY_cpu_reset_server_response_get(core$RDY_cpu_reset_server_response_get),
	      .cpu_imem_master_awvalid(core$cpu_imem_master_awvalid),
	      .cpu_imem_master_awid(core$cpu_imem_master_awid),
	      .cpu_imem_master_awaddr(core$cpu_imem_master_awaddr),
	      .cpu_imem_master_awlen(core$cpu_imem_master_awlen),
	      .cpu_imem_master_awsize(core$cpu_imem_master_awsize),
	      .cpu_imem_master_awburst(core$cpu_imem_master_awburst),
	      .cpu_imem_master_awlock(core$cpu_imem_master_awlock),
	      .cpu_imem_master_awcache(core$cpu_imem_master_awcache),
	      .cpu_imem_master_awprot(core$cpu_imem_master_awprot),
	      .cpu_imem_master_awqos(core$cpu_imem_master_awqos),
	      .cpu_imem_master_awregion(core$cpu_imem_master_awregion),
	      .cpu_imem_master_wvalid(core$cpu_imem_master_wvalid),
	      .cpu_imem_master_wdata(core$cpu_imem_master_wdata),
	      .cpu_imem_master_wstrb(core$cpu_imem_master_wstrb),
	      .cpu_imem_master_wlast(core$cpu_imem_master_wlast),
	      .cpu_imem_master_bready(core$cpu_imem_master_bready),
	      .cpu_imem_master_arvalid(core$cpu_imem_master_arvalid),
	      .cpu_imem_master_arid(core$cpu_imem_master_arid),
	      .cpu_imem_master_araddr(core$cpu_imem_master_araddr),
	      .cpu_imem_master_arlen(core$cpu_imem_master_arlen),
	      .cpu_imem_master_arsize(core$cpu_imem_master_arsize),
	      .cpu_imem_master_arburst(core$cpu_imem_master_arburst),
	      .cpu_imem_master_arlock(core$cpu_imem_master_arlock),
	      .cpu_imem_master_arcache(core$cpu_imem_master_arcache),
	      .cpu_imem_master_arprot(core$cpu_imem_master_arprot),
	      .cpu_imem_master_arqos(core$cpu_imem_master_arqos),
	      .cpu_imem_master_arregion(core$cpu_imem_master_arregion),
	      .cpu_imem_master_rready(core$cpu_imem_master_rready),
	      .core_mem_master_awvalid(core$core_mem_master_awvalid),
	      .core_mem_master_awid(core$core_mem_master_awid),
	      .core_mem_master_awaddr(core$core_mem_master_awaddr),
	      .core_mem_master_awlen(core$core_mem_master_awlen),
	      .core_mem_master_awsize(core$core_mem_master_awsize),
	      .core_mem_master_awburst(core$core_mem_master_awburst),
	      .core_mem_master_awlock(core$core_mem_master_awlock),
	      .core_mem_master_awcache(core$core_mem_master_awcache),
	      .core_mem_master_awprot(core$core_mem_master_awprot),
	      .core_mem_master_awqos(core$core_mem_master_awqos),
	      .core_mem_master_awregion(core$core_mem_master_awregion),
	      .core_mem_master_wvalid(core$core_mem_master_wvalid),
	      .core_mem_master_wdata(core$core_mem_master_wdata),
	      .core_mem_master_wstrb(core$core_mem_master_wstrb),
	      .core_mem_master_wlast(core$core_mem_master_wlast),
	      .core_mem_master_bready(core$core_mem_master_bready),
	      .core_mem_master_arvalid(core$core_mem_master_arvalid),
	      .core_mem_master_arid(core$core_mem_master_arid),
	      .core_mem_master_araddr(core$core_mem_master_araddr),
	      .core_mem_master_arlen(core$core_mem_master_arlen),
	      .core_mem_master_arsize(core$core_mem_master_arsize),
	      .core_mem_master_arburst(core$core_mem_master_arburst),
	      .core_mem_master_arlock(core$core_mem_master_arlock),
	      .core_mem_master_arcache(core$core_mem_master_arcache),
	      .core_mem_master_arprot(core$core_mem_master_arprot),
	      .core_mem_master_arqos(core$core_mem_master_arqos),
	      .core_mem_master_arregion(core$core_mem_master_arregion),
	      .core_mem_master_rready(core$core_mem_master_rready),
	      .dma_server_awready(),
	      .dma_server_wready(),
	      .dma_server_bvalid(),
	      .dma_server_bid(),
	      .dma_server_bresp(),
	      .dma_server_arready(),
	      .dma_server_rvalid(),
	      .dma_server_rid(),
	      .dma_server_rdata(),
	      .dma_server_rresp(),
	      .dma_server_rlast(),
	      .RDY_set_verbosity(),
	      .RDY_set_watch_tohost(),
	      .mv_tohost_value(core$mv_tohost_value),
	      .RDY_mv_tohost_value(),
	      .RDY_ma_ddr4_ready(),
	      .mv_status(core$mv_status));
  // submodule fabric
  mkFabric_AXI4 fabric(.CLK(CLK),
		       .RST_N(RST_N),
		       .set_verbosity_verbosity(fabric$set_verbosity_verbosity),
		       .v_from_masters_0_araddr(fabric$v_from_masters_0_araddr),
		       .v_from_masters_0_arburst(fabric$v_from_masters_0_arburst),
		       .v_from_masters_0_arcache(fabric$v_from_masters_0_arcache),
		       .v_from_masters_0_arid(fabric$v_from_masters_0_arid),
		       .v_from_masters_0_arlen(fabric$v_from_masters_0_arlen),
		       .v_from_masters_0_arlock(fabric$v_from_masters_0_arlock),
		       .v_from_masters_0_arprot(fabric$v_from_masters_0_arprot),
		       .v_from_masters_0_arqos(fabric$v_from_masters_0_arqos),
		       .v_from_masters_0_arregion(fabric$v_from_masters_0_arregion),
		       .v_from_masters_0_arsize(fabric$v_from_masters_0_arsize),
		       .v_from_masters_0_arvalid(fabric$v_from_masters_0_arvalid),
		       .v_from_masters_0_awaddr(fabric$v_from_masters_0_awaddr),
		       .v_from_masters_0_awburst(fabric$v_from_masters_0_awburst),
		       .v_from_masters_0_awcache(fabric$v_from_masters_0_awcache),
		       .v_from_masters_0_awid(fabric$v_from_masters_0_awid),
		       .v_from_masters_0_awlen(fabric$v_from_masters_0_awlen),
		       .v_from_masters_0_awlock(fabric$v_from_masters_0_awlock),
		       .v_from_masters_0_awprot(fabric$v_from_masters_0_awprot),
		       .v_from_masters_0_awqos(fabric$v_from_masters_0_awqos),
		       .v_from_masters_0_awregion(fabric$v_from_masters_0_awregion),
		       .v_from_masters_0_awsize(fabric$v_from_masters_0_awsize),
		       .v_from_masters_0_awvalid(fabric$v_from_masters_0_awvalid),
		       .v_from_masters_0_bready(fabric$v_from_masters_0_bready),
		       .v_from_masters_0_rready(fabric$v_from_masters_0_rready),
		       .v_from_masters_0_wdata(fabric$v_from_masters_0_wdata),
		       .v_from_masters_0_wlast(fabric$v_from_masters_0_wlast),
		       .v_from_masters_0_wstrb(fabric$v_from_masters_0_wstrb),
		       .v_from_masters_0_wvalid(fabric$v_from_masters_0_wvalid),
		       .v_from_masters_1_araddr(fabric$v_from_masters_1_araddr),
		       .v_from_masters_1_arburst(fabric$v_from_masters_1_arburst),
		       .v_from_masters_1_arcache(fabric$v_from_masters_1_arcache),
		       .v_from_masters_1_arid(fabric$v_from_masters_1_arid),
		       .v_from_masters_1_arlen(fabric$v_from_masters_1_arlen),
		       .v_from_masters_1_arlock(fabric$v_from_masters_1_arlock),
		       .v_from_masters_1_arprot(fabric$v_from_masters_1_arprot),
		       .v_from_masters_1_arqos(fabric$v_from_masters_1_arqos),
		       .v_from_masters_1_arregion(fabric$v_from_masters_1_arregion),
		       .v_from_masters_1_arsize(fabric$v_from_masters_1_arsize),
		       .v_from_masters_1_arvalid(fabric$v_from_masters_1_arvalid),
		       .v_from_masters_1_awaddr(fabric$v_from_masters_1_awaddr),
		       .v_from_masters_1_awburst(fabric$v_from_masters_1_awburst),
		       .v_from_masters_1_awcache(fabric$v_from_masters_1_awcache),
		       .v_from_masters_1_awid(fabric$v_from_masters_1_awid),
		       .v_from_masters_1_awlen(fabric$v_from_masters_1_awlen),
		       .v_from_masters_1_awlock(fabric$v_from_masters_1_awlock),
		       .v_from_masters_1_awprot(fabric$v_from_masters_1_awprot),
		       .v_from_masters_1_awqos(fabric$v_from_masters_1_awqos),
		       .v_from_masters_1_awregion(fabric$v_from_masters_1_awregion),
		       .v_from_masters_1_awsize(fabric$v_from_masters_1_awsize),
		       .v_from_masters_1_awvalid(fabric$v_from_masters_1_awvalid),
		       .v_from_masters_1_bready(fabric$v_from_masters_1_bready),
		       .v_from_masters_1_rready(fabric$v_from_masters_1_rready),
		       .v_from_masters_1_wdata(fabric$v_from_masters_1_wdata),
		       .v_from_masters_1_wlast(fabric$v_from_masters_1_wlast),
		       .v_from_masters_1_wstrb(fabric$v_from_masters_1_wstrb),
		       .v_from_masters_1_wvalid(fabric$v_from_masters_1_wvalid),
		       .v_to_slaves_0_arready(fabric$v_to_slaves_0_arready),
		       .v_to_slaves_0_awready(fabric$v_to_slaves_0_awready),
		       .v_to_slaves_0_bid(fabric$v_to_slaves_0_bid),
		       .v_to_slaves_0_bresp(fabric$v_to_slaves_0_bresp),
		       .v_to_slaves_0_bvalid(fabric$v_to_slaves_0_bvalid),
		       .v_to_slaves_0_rdata(fabric$v_to_slaves_0_rdata),
		       .v_to_slaves_0_rid(fabric$v_to_slaves_0_rid),
		       .v_to_slaves_0_rlast(fabric$v_to_slaves_0_rlast),
		       .v_to_slaves_0_rresp(fabric$v_to_slaves_0_rresp),
		       .v_to_slaves_0_rvalid(fabric$v_to_slaves_0_rvalid),
		       .v_to_slaves_0_wready(fabric$v_to_slaves_0_wready),
		       .v_to_slaves_1_arready(fabric$v_to_slaves_1_arready),
		       .v_to_slaves_1_awready(fabric$v_to_slaves_1_awready),
		       .v_to_slaves_1_bid(fabric$v_to_slaves_1_bid),
		       .v_to_slaves_1_bresp(fabric$v_to_slaves_1_bresp),
		       .v_to_slaves_1_bvalid(fabric$v_to_slaves_1_bvalid),
		       .v_to_slaves_1_rdata(fabric$v_to_slaves_1_rdata),
		       .v_to_slaves_1_rid(fabric$v_to_slaves_1_rid),
		       .v_to_slaves_1_rlast(fabric$v_to_slaves_1_rlast),
		       .v_to_slaves_1_rresp(fabric$v_to_slaves_1_rresp),
		       .v_to_slaves_1_rvalid(fabric$v_to_slaves_1_rvalid),
		       .v_to_slaves_1_wready(fabric$v_to_slaves_1_wready),
		       .v_to_slaves_2_arready(fabric$v_to_slaves_2_arready),
		       .v_to_slaves_2_awready(fabric$v_to_slaves_2_awready),
		       .v_to_slaves_2_bid(fabric$v_to_slaves_2_bid),
		       .v_to_slaves_2_bresp(fabric$v_to_slaves_2_bresp),
		       .v_to_slaves_2_bvalid(fabric$v_to_slaves_2_bvalid),
		       .v_to_slaves_2_rdata(fabric$v_to_slaves_2_rdata),
		       .v_to_slaves_2_rid(fabric$v_to_slaves_2_rid),
		       .v_to_slaves_2_rlast(fabric$v_to_slaves_2_rlast),
		       .v_to_slaves_2_rresp(fabric$v_to_slaves_2_rresp),
		       .v_to_slaves_2_rvalid(fabric$v_to_slaves_2_rvalid),
		       .v_to_slaves_2_wready(fabric$v_to_slaves_2_wready),
		       .EN_reset(fabric$EN_reset),
		       .EN_set_verbosity(fabric$EN_set_verbosity),
		       .RDY_reset(fabric$RDY_reset),
		       .RDY_set_verbosity(),
		       .v_from_masters_0_awready(fabric$v_from_masters_0_awready),
		       .v_from_masters_0_wready(fabric$v_from_masters_0_wready),
		       .v_from_masters_0_bvalid(fabric$v_from_masters_0_bvalid),
		       .v_from_masters_0_bid(fabric$v_from_masters_0_bid),
		       .v_from_masters_0_bresp(fabric$v_from_masters_0_bresp),
		       .v_from_masters_0_arready(fabric$v_from_masters_0_arready),
		       .v_from_masters_0_rvalid(fabric$v_from_masters_0_rvalid),
		       .v_from_masters_0_rid(fabric$v_from_masters_0_rid),
		       .v_from_masters_0_rdata(fabric$v_from_masters_0_rdata),
		       .v_from_masters_0_rresp(fabric$v_from_masters_0_rresp),
		       .v_from_masters_0_rlast(fabric$v_from_masters_0_rlast),
		       .v_from_masters_1_awready(fabric$v_from_masters_1_awready),
		       .v_from_masters_1_wready(fabric$v_from_masters_1_wready),
		       .v_from_masters_1_bvalid(fabric$v_from_masters_1_bvalid),
		       .v_from_masters_1_bid(fabric$v_from_masters_1_bid),
		       .v_from_masters_1_bresp(fabric$v_from_masters_1_bresp),
		       .v_from_masters_1_arready(fabric$v_from_masters_1_arready),
		       .v_from_masters_1_rvalid(fabric$v_from_masters_1_rvalid),
		       .v_from_masters_1_rid(fabric$v_from_masters_1_rid),
		       .v_from_masters_1_rdata(fabric$v_from_masters_1_rdata),
		       .v_from_masters_1_rresp(fabric$v_from_masters_1_rresp),
		       .v_from_masters_1_rlast(fabric$v_from_masters_1_rlast),
		       .v_to_slaves_0_awvalid(fabric$v_to_slaves_0_awvalid),
		       .v_to_slaves_0_awid(fabric$v_to_slaves_0_awid),
		       .v_to_slaves_0_awaddr(fabric$v_to_slaves_0_awaddr),
		       .v_to_slaves_0_awlen(fabric$v_to_slaves_0_awlen),
		       .v_to_slaves_0_awsize(fabric$v_to_slaves_0_awsize),
		       .v_to_slaves_0_awburst(fabric$v_to_slaves_0_awburst),
		       .v_to_slaves_0_awlock(fabric$v_to_slaves_0_awlock),
		       .v_to_slaves_0_awcache(fabric$v_to_slaves_0_awcache),
		       .v_to_slaves_0_awprot(fabric$v_to_slaves_0_awprot),
		       .v_to_slaves_0_awqos(fabric$v_to_slaves_0_awqos),
		       .v_to_slaves_0_awregion(fabric$v_to_slaves_0_awregion),
		       .v_to_slaves_0_wvalid(fabric$v_to_slaves_0_wvalid),
		       .v_to_slaves_0_wdata(fabric$v_to_slaves_0_wdata),
		       .v_to_slaves_0_wstrb(fabric$v_to_slaves_0_wstrb),
		       .v_to_slaves_0_wlast(fabric$v_to_slaves_0_wlast),
		       .v_to_slaves_0_bready(fabric$v_to_slaves_0_bready),
		       .v_to_slaves_0_arvalid(fabric$v_to_slaves_0_arvalid),
		       .v_to_slaves_0_arid(fabric$v_to_slaves_0_arid),
		       .v_to_slaves_0_araddr(fabric$v_to_slaves_0_araddr),
		       .v_to_slaves_0_arlen(fabric$v_to_slaves_0_arlen),
		       .v_to_slaves_0_arsize(fabric$v_to_slaves_0_arsize),
		       .v_to_slaves_0_arburst(fabric$v_to_slaves_0_arburst),
		       .v_to_slaves_0_arlock(fabric$v_to_slaves_0_arlock),
		       .v_to_slaves_0_arcache(fabric$v_to_slaves_0_arcache),
		       .v_to_slaves_0_arprot(fabric$v_to_slaves_0_arprot),
		       .v_to_slaves_0_arqos(fabric$v_to_slaves_0_arqos),
		       .v_to_slaves_0_arregion(fabric$v_to_slaves_0_arregion),
		       .v_to_slaves_0_rready(fabric$v_to_slaves_0_rready),
		       .v_to_slaves_1_awvalid(fabric$v_to_slaves_1_awvalid),
		       .v_to_slaves_1_awid(fabric$v_to_slaves_1_awid),
		       .v_to_slaves_1_awaddr(fabric$v_to_slaves_1_awaddr),
		       .v_to_slaves_1_awlen(fabric$v_to_slaves_1_awlen),
		       .v_to_slaves_1_awsize(fabric$v_to_slaves_1_awsize),
		       .v_to_slaves_1_awburst(fabric$v_to_slaves_1_awburst),
		       .v_to_slaves_1_awlock(fabric$v_to_slaves_1_awlock),
		       .v_to_slaves_1_awcache(fabric$v_to_slaves_1_awcache),
		       .v_to_slaves_1_awprot(fabric$v_to_slaves_1_awprot),
		       .v_to_slaves_1_awqos(fabric$v_to_slaves_1_awqos),
		       .v_to_slaves_1_awregion(fabric$v_to_slaves_1_awregion),
		       .v_to_slaves_1_wvalid(fabric$v_to_slaves_1_wvalid),
		       .v_to_slaves_1_wdata(fabric$v_to_slaves_1_wdata),
		       .v_to_slaves_1_wstrb(fabric$v_to_slaves_1_wstrb),
		       .v_to_slaves_1_wlast(fabric$v_to_slaves_1_wlast),
		       .v_to_slaves_1_bready(fabric$v_to_slaves_1_bready),
		       .v_to_slaves_1_arvalid(fabric$v_to_slaves_1_arvalid),
		       .v_to_slaves_1_arid(fabric$v_to_slaves_1_arid),
		       .v_to_slaves_1_araddr(fabric$v_to_slaves_1_araddr),
		       .v_to_slaves_1_arlen(fabric$v_to_slaves_1_arlen),
		       .v_to_slaves_1_arsize(fabric$v_to_slaves_1_arsize),
		       .v_to_slaves_1_arburst(fabric$v_to_slaves_1_arburst),
		       .v_to_slaves_1_arlock(fabric$v_to_slaves_1_arlock),
		       .v_to_slaves_1_arcache(fabric$v_to_slaves_1_arcache),
		       .v_to_slaves_1_arprot(fabric$v_to_slaves_1_arprot),
		       .v_to_slaves_1_arqos(fabric$v_to_slaves_1_arqos),
		       .v_to_slaves_1_arregion(fabric$v_to_slaves_1_arregion),
		       .v_to_slaves_1_rready(fabric$v_to_slaves_1_rready),
		       .v_to_slaves_2_awvalid(fabric$v_to_slaves_2_awvalid),
		       .v_to_slaves_2_awid(fabric$v_to_slaves_2_awid),
		       .v_to_slaves_2_awaddr(fabric$v_to_slaves_2_awaddr),
		       .v_to_slaves_2_awlen(fabric$v_to_slaves_2_awlen),
		       .v_to_slaves_2_awsize(fabric$v_to_slaves_2_awsize),
		       .v_to_slaves_2_awburst(fabric$v_to_slaves_2_awburst),
		       .v_to_slaves_2_awlock(fabric$v_to_slaves_2_awlock),
		       .v_to_slaves_2_awcache(fabric$v_to_slaves_2_awcache),
		       .v_to_slaves_2_awprot(fabric$v_to_slaves_2_awprot),
		       .v_to_slaves_2_awqos(fabric$v_to_slaves_2_awqos),
		       .v_to_slaves_2_awregion(fabric$v_to_slaves_2_awregion),
		       .v_to_slaves_2_wvalid(fabric$v_to_slaves_2_wvalid),
		       .v_to_slaves_2_wdata(fabric$v_to_slaves_2_wdata),
		       .v_to_slaves_2_wstrb(fabric$v_to_slaves_2_wstrb),
		       .v_to_slaves_2_wlast(fabric$v_to_slaves_2_wlast),
		       .v_to_slaves_2_bready(fabric$v_to_slaves_2_bready),
		       .v_to_slaves_2_arvalid(fabric$v_to_slaves_2_arvalid),
		       .v_to_slaves_2_arid(fabric$v_to_slaves_2_arid),
		       .v_to_slaves_2_araddr(fabric$v_to_slaves_2_araddr),
		       .v_to_slaves_2_arlen(fabric$v_to_slaves_2_arlen),
		       .v_to_slaves_2_arsize(fabric$v_to_slaves_2_arsize),
		       .v_to_slaves_2_arburst(fabric$v_to_slaves_2_arburst),
		       .v_to_slaves_2_arlock(fabric$v_to_slaves_2_arlock),
		       .v_to_slaves_2_arcache(fabric$v_to_slaves_2_arcache),
		       .v_to_slaves_2_arprot(fabric$v_to_slaves_2_arprot),
		       .v_to_slaves_2_arqos(fabric$v_to_slaves_2_arqos),
		       .v_to_slaves_2_arregion(fabric$v_to_slaves_2_arregion),
		       .v_to_slaves_2_rready(fabric$v_to_slaves_2_rready));
  // submodule mem0_controller
  mkMem_Controller mem0_controller(.CLK(CLK),
				   .RST_N(RST_N),
				   .set_addr_map_addr_base(mem0_controller$set_addr_map_addr_base),
				   .set_addr_map_addr_lim(mem0_controller$set_addr_map_addr_lim),
				   .set_watch_tohost_tohost_addr(mem0_controller$set_watch_tohost_tohost_addr),
				   .set_watch_tohost_watch_tohost(mem0_controller$set_watch_tohost_watch_tohost),
				   .slave_araddr(mem0_controller$slave_araddr),
				   .slave_arburst(mem0_controller$slave_arburst),
				   .slave_arcache(mem0_controller$slave_arcache),
				   .slave_arid(mem0_controller$slave_arid),
				   .slave_arlen(mem0_controller$slave_arlen),
				   .slave_arlock(mem0_controller$slave_arlock),
				   .slave_arprot(mem0_controller$slave_arprot),
				   .slave_arqos(mem0_controller$slave_arqos),
				   .slave_arregion(mem0_controller$slave_arregion),
				   .slave_arsize(mem0_controller$slave_arsize),
				   .slave_arvalid(mem0_controller$slave_arvalid),
				   .slave_awaddr(mem0_controller$slave_awaddr),
				   .slave_awburst(mem0_controller$slave_awburst),
				   .slave_awcache(mem0_controller$slave_awcache),
				   .slave_awid(mem0_controller$slave_awid),
				   .slave_awlen(mem0_controller$slave_awlen),
				   .slave_awlock(mem0_controller$slave_awlock),
				   .slave_awprot(mem0_controller$slave_awprot),
				   .slave_awqos(mem0_controller$slave_awqos),
				   .slave_awregion(mem0_controller$slave_awregion),
				   .slave_awsize(mem0_controller$slave_awsize),
				   .slave_awvalid(mem0_controller$slave_awvalid),
				   .slave_bready(mem0_controller$slave_bready),
				   .slave_rready(mem0_controller$slave_rready),
				   .slave_wdata(mem0_controller$slave_wdata),
				   .slave_wlast(mem0_controller$slave_wlast),
				   .slave_wstrb(mem0_controller$slave_wstrb),
				   .slave_wvalid(mem0_controller$slave_wvalid),
				   .to_raw_mem_response_put(mem0_controller$to_raw_mem_response_put),
				   .EN_server_reset_request_put(mem0_controller$EN_server_reset_request_put),
				   .EN_server_reset_response_get(mem0_controller$EN_server_reset_response_get),
				   .EN_set_addr_map(mem0_controller$EN_set_addr_map),
				   .EN_to_raw_mem_request_get(mem0_controller$EN_to_raw_mem_request_get),
				   .EN_to_raw_mem_response_put(mem0_controller$EN_to_raw_mem_response_put),
				   .EN_set_watch_tohost(mem0_controller$EN_set_watch_tohost),
				   .RDY_server_reset_request_put(mem0_controller$RDY_server_reset_request_put),
				   .RDY_server_reset_response_get(mem0_controller$RDY_server_reset_response_get),
				   .RDY_set_addr_map(mem0_controller$RDY_set_addr_map),
				   .slave_awready(mem0_controller$slave_awready),
				   .slave_wready(mem0_controller$slave_wready),
				   .slave_bvalid(mem0_controller$slave_bvalid),
				   .slave_bid(mem0_controller$slave_bid),
				   .slave_bresp(mem0_controller$slave_bresp),
				   .slave_arready(mem0_controller$slave_arready),
				   .slave_rvalid(mem0_controller$slave_rvalid),
				   .slave_rid(mem0_controller$slave_rid),
				   .slave_rdata(mem0_controller$slave_rdata),
				   .slave_rresp(mem0_controller$slave_rresp),
				   .slave_rlast(mem0_controller$slave_rlast),
				   .to_raw_mem_request_get(mem0_controller$to_raw_mem_request_get),
				   .RDY_to_raw_mem_request_get(mem0_controller$RDY_to_raw_mem_request_get),
				   .RDY_to_raw_mem_response_put(mem0_controller$RDY_to_raw_mem_response_put),
				   .status(),
				   .RDY_set_watch_tohost());
  // submodule mem0_controller_axi4_deburster
  mkAXI4_Deburster_A mem0_controller_axi4_deburster(.CLK(CLK),
						    .RST_N(RST_N),
						    .from_master_araddr(mem0_controller_axi4_deburster$from_master_araddr),
						    .from_master_arburst(mem0_controller_axi4_deburster$from_master_arburst),
						    .from_master_arcache(mem0_controller_axi4_deburster$from_master_arcache),
						    .from_master_arid(mem0_controller_axi4_deburster$from_master_arid),
						    .from_master_arlen(mem0_controller_axi4_deburster$from_master_arlen),
						    .from_master_arlock(mem0_controller_axi4_deburster$from_master_arlock),
						    .from_master_arprot(mem0_controller_axi4_deburster$from_master_arprot),
						    .from_master_arqos(mem0_controller_axi4_deburster$from_master_arqos),
						    .from_master_arregion(mem0_controller_axi4_deburster$from_master_arregion),
						    .from_master_arsize(mem0_controller_axi4_deburster$from_master_arsize),
						    .from_master_arvalid(mem0_controller_axi4_deburster$from_master_arvalid),
						    .from_master_awaddr(mem0_controller_axi4_deburster$from_master_awaddr),
						    .from_master_awburst(mem0_controller_axi4_deburster$from_master_awburst),
						    .from_master_awcache(mem0_controller_axi4_deburster$from_master_awcache),
						    .from_master_awid(mem0_controller_axi4_deburster$from_master_awid),
						    .from_master_awlen(mem0_controller_axi4_deburster$from_master_awlen),
						    .from_master_awlock(mem0_controller_axi4_deburster$from_master_awlock),
						    .from_master_awprot(mem0_controller_axi4_deburster$from_master_awprot),
						    .from_master_awqos(mem0_controller_axi4_deburster$from_master_awqos),
						    .from_master_awregion(mem0_controller_axi4_deburster$from_master_awregion),
						    .from_master_awsize(mem0_controller_axi4_deburster$from_master_awsize),
						    .from_master_awvalid(mem0_controller_axi4_deburster$from_master_awvalid),
						    .from_master_bready(mem0_controller_axi4_deburster$from_master_bready),
						    .from_master_rready(mem0_controller_axi4_deburster$from_master_rready),
						    .from_master_wdata(mem0_controller_axi4_deburster$from_master_wdata),
						    .from_master_wlast(mem0_controller_axi4_deburster$from_master_wlast),
						    .from_master_wstrb(mem0_controller_axi4_deburster$from_master_wstrb),
						    .from_master_wvalid(mem0_controller_axi4_deburster$from_master_wvalid),
						    .to_slave_arready(mem0_controller_axi4_deburster$to_slave_arready),
						    .to_slave_awready(mem0_controller_axi4_deburster$to_slave_awready),
						    .to_slave_bid(mem0_controller_axi4_deburster$to_slave_bid),
						    .to_slave_bresp(mem0_controller_axi4_deburster$to_slave_bresp),
						    .to_slave_bvalid(mem0_controller_axi4_deburster$to_slave_bvalid),
						    .to_slave_rdata(mem0_controller_axi4_deburster$to_slave_rdata),
						    .to_slave_rid(mem0_controller_axi4_deburster$to_slave_rid),
						    .to_slave_rlast(mem0_controller_axi4_deburster$to_slave_rlast),
						    .to_slave_rresp(mem0_controller_axi4_deburster$to_slave_rresp),
						    .to_slave_rvalid(mem0_controller_axi4_deburster$to_slave_rvalid),
						    .to_slave_wready(mem0_controller_axi4_deburster$to_slave_wready),
						    .EN_reset(mem0_controller_axi4_deburster$EN_reset),
						    .RDY_reset(),
						    .from_master_awready(mem0_controller_axi4_deburster$from_master_awready),
						    .from_master_wready(mem0_controller_axi4_deburster$from_master_wready),
						    .from_master_bvalid(mem0_controller_axi4_deburster$from_master_bvalid),
						    .from_master_bid(mem0_controller_axi4_deburster$from_master_bid),
						    .from_master_bresp(mem0_controller_axi4_deburster$from_master_bresp),
						    .from_master_arready(mem0_controller_axi4_deburster$from_master_arready),
						    .from_master_rvalid(mem0_controller_axi4_deburster$from_master_rvalid),
						    .from_master_rid(mem0_controller_axi4_deburster$from_master_rid),
						    .from_master_rdata(mem0_controller_axi4_deburster$from_master_rdata),
						    .from_master_rresp(mem0_controller_axi4_deburster$from_master_rresp),
						    .from_master_rlast(mem0_controller_axi4_deburster$from_master_rlast),
						    .to_slave_awvalid(mem0_controller_axi4_deburster$to_slave_awvalid),
						    .to_slave_awid(mem0_controller_axi4_deburster$to_slave_awid),
						    .to_slave_awaddr(mem0_controller_axi4_deburster$to_slave_awaddr),
						    .to_slave_awlen(mem0_controller_axi4_deburster$to_slave_awlen),
						    .to_slave_awsize(mem0_controller_axi4_deburster$to_slave_awsize),
						    .to_slave_awburst(mem0_controller_axi4_deburster$to_slave_awburst),
						    .to_slave_awlock(mem0_controller_axi4_deburster$to_slave_awlock),
						    .to_slave_awcache(mem0_controller_axi4_deburster$to_slave_awcache),
						    .to_slave_awprot(mem0_controller_axi4_deburster$to_slave_awprot),
						    .to_slave_awqos(mem0_controller_axi4_deburster$to_slave_awqos),
						    .to_slave_awregion(mem0_controller_axi4_deburster$to_slave_awregion),
						    .to_slave_wvalid(mem0_controller_axi4_deburster$to_slave_wvalid),
						    .to_slave_wdata(mem0_controller_axi4_deburster$to_slave_wdata),
						    .to_slave_wstrb(mem0_controller_axi4_deburster$to_slave_wstrb),
						    .to_slave_wlast(mem0_controller_axi4_deburster$to_slave_wlast),
						    .to_slave_bready(mem0_controller_axi4_deburster$to_slave_bready),
						    .to_slave_arvalid(mem0_controller_axi4_deburster$to_slave_arvalid),
						    .to_slave_arid(mem0_controller_axi4_deburster$to_slave_arid),
						    .to_slave_araddr(mem0_controller_axi4_deburster$to_slave_araddr),
						    .to_slave_arlen(mem0_controller_axi4_deburster$to_slave_arlen),
						    .to_slave_arsize(mem0_controller_axi4_deburster$to_slave_arsize),
						    .to_slave_arburst(mem0_controller_axi4_deburster$to_slave_arburst),
						    .to_slave_arlock(mem0_controller_axi4_deburster$to_slave_arlock),
						    .to_slave_arcache(mem0_controller_axi4_deburster$to_slave_arcache),
						    .to_slave_arprot(mem0_controller_axi4_deburster$to_slave_arprot),
						    .to_slave_arqos(mem0_controller_axi4_deburster$to_slave_arqos),
						    .to_slave_arregion(mem0_controller_axi4_deburster$to_slave_arregion),
						    .to_slave_rready(mem0_controller_axi4_deburster$to_slave_rready));
  // submodule uart0
  mkUART uart0(.CLK(CLK),
	       .RST_N(RST_N),
	       .put_from_console_put(uart0$put_from_console_put),
	       .set_addr_map_addr_base(uart0$set_addr_map_addr_base),
	       .set_addr_map_addr_lim(uart0$set_addr_map_addr_lim),
	       .slave_araddr(uart0$slave_araddr),
	       .slave_arburst(uart0$slave_arburst),
	       .slave_arcache(uart0$slave_arcache),
	       .slave_arid(uart0$slave_arid),
	       .slave_arlen(uart0$slave_arlen),
	       .slave_arlock(uart0$slave_arlock),
	       .slave_arprot(uart0$slave_arprot),
	       .slave_arqos(uart0$slave_arqos),
	       .slave_arregion(uart0$slave_arregion),
	       .slave_arsize(uart0$slave_arsize),
	       .slave_arvalid(uart0$slave_arvalid),
	       .slave_awaddr(uart0$slave_awaddr),
	       .slave_awburst(uart0$slave_awburst),
	       .slave_awcache(uart0$slave_awcache),
	       .slave_awid(uart0$slave_awid),
	       .slave_awlen(uart0$slave_awlen),
	       .slave_awlock(uart0$slave_awlock),
	       .slave_awprot(uart0$slave_awprot),
	       .slave_awqos(uart0$slave_awqos),
	       .slave_awregion(uart0$slave_awregion),
	       .slave_awsize(uart0$slave_awsize),
	       .slave_awvalid(uart0$slave_awvalid),
	       .slave_bready(uart0$slave_bready),
	       .slave_rready(uart0$slave_rready),
	       .slave_wdata(uart0$slave_wdata),
	       .slave_wlast(uart0$slave_wlast),
	       .slave_wstrb(uart0$slave_wstrb),
	       .slave_wvalid(uart0$slave_wvalid),
	       .EN_server_reset_request_put(uart0$EN_server_reset_request_put),
	       .EN_server_reset_response_get(uart0$EN_server_reset_response_get),
	       .EN_set_addr_map(uart0$EN_set_addr_map),
	       .EN_get_to_console_get(uart0$EN_get_to_console_get),
	       .EN_put_from_console_put(uart0$EN_put_from_console_put),
	       .RDY_server_reset_request_put(uart0$RDY_server_reset_request_put),
	       .RDY_server_reset_response_get(uart0$RDY_server_reset_response_get),
	       .RDY_set_addr_map(),
	       .slave_awready(uart0$slave_awready),
	       .slave_wready(uart0$slave_wready),
	       .slave_bvalid(uart0$slave_bvalid),
	       .slave_bid(uart0$slave_bid),
	       .slave_bresp(uart0$slave_bresp),
	       .slave_arready(uart0$slave_arready),
	       .slave_rvalid(uart0$slave_rvalid),
	       .slave_rid(uart0$slave_rid),
	       .slave_rdata(uart0$slave_rdata),
	       .slave_rresp(uart0$slave_rresp),
	       .slave_rlast(uart0$slave_rlast),
	       .get_to_console_get(uart0$get_to_console_get),
	       .RDY_get_to_console_get(uart0$RDY_get_to_console_get),
	       .RDY_put_from_console_put(uart0$RDY_put_from_console_put),
	       .intr(uart0$intr));
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
  // rule RL_rl_wr_addr_channel_4
  assign CAN_FIRE_RL_rl_wr_addr_channel_4 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_addr_channel_4 = 1'd1 ;
  // rule RL_rl_wr_data_channel_4
  assign CAN_FIRE_RL_rl_wr_data_channel_4 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_data_channel_4 = 1'd1 ;
  // rule RL_rl_wr_response_channel_4
  assign CAN_FIRE_RL_rl_wr_response_channel_4 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_response_channel_4 = 1'd1 ;
  // rule RL_rl_rd_addr_channel_4
  assign CAN_FIRE_RL_rl_rd_addr_channel_4 = 1'd1 ;
  assign WILL_FIRE_RL_rl_rd_addr_channel_4 = 1'd1 ;
  // rule RL_rl_rd_data_channel_4
  assign CAN_FIRE_RL_rl_rd_data_channel_4 = 1'd1 ;
  assign WILL_FIRE_RL_rl_rd_data_channel_4 = 1'd1 ;
  // rule RL_rl_wr_addr_channel_5
  assign CAN_FIRE_RL_rl_wr_addr_channel_5 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_addr_channel_5 = 1'd1 ;
  // rule RL_rl_wr_data_channel_5
  assign CAN_FIRE_RL_rl_wr_data_channel_5 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_data_channel_5 = 1'd1 ;
  // rule RL_rl_wr_response_channel_5
  assign CAN_FIRE_RL_rl_wr_response_channel_5 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_response_channel_5 = 1'd1 ;
  // rule RL_rl_rd_addr_channel_5
  assign CAN_FIRE_RL_rl_rd_addr_channel_5 = 1'd1 ;
  assign WILL_FIRE_RL_rl_rd_addr_channel_5 = 1'd1 ;
  // rule RL_rl_rd_data_channel_5
  assign CAN_FIRE_RL_rl_rd_data_channel_5 = 1'd1 ;
  assign WILL_FIRE_RL_rl_rd_data_channel_5 = 1'd1 ;
  // rule RL_rl_wr_addr_channel_6
  assign CAN_FIRE_RL_rl_wr_addr_channel_6 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_addr_channel_6 = 1'd1 ;
  // rule RL_rl_wr_data_channel_6
  assign CAN_FIRE_RL_rl_wr_data_channel_6 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_data_channel_6 = 1'd1 ;
  // rule RL_rl_wr_response_channel_6
  assign CAN_FIRE_RL_rl_wr_response_channel_6 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_response_channel_6 = 1'd1 ;
  // rule RL_rl_rd_addr_channel_6
  assign CAN_FIRE_RL_rl_rd_addr_channel_6 = 1'd1 ;
  assign WILL_FIRE_RL_rl_rd_addr_channel_6 = 1'd1 ;
  // rule RL_rl_rd_data_channel_6
  assign CAN_FIRE_RL_rl_rd_data_channel_6 = 1'd1 ;
  assign WILL_FIRE_RL_rl_rd_data_channel_6 = 1'd1 ;
  // rule RL_rl_wr_addr_channel_7
  assign CAN_FIRE_RL_rl_wr_addr_channel_7 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_addr_channel_7 = 1'd1 ;
  // rule RL_rl_wr_data_channel_7
  assign CAN_FIRE_RL_rl_wr_data_channel_7 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_data_channel_7 = 1'd1 ;
  // rule RL_rl_wr_response_channel_7
  assign CAN_FIRE_RL_rl_wr_response_channel_7 = 1'd1 ;
  assign WILL_FIRE_RL_rl_wr_response_channel_7 = 1'd1 ;
  // rule RL_rl_rd_addr_channel_7
  assign CAN_FIRE_RL_rl_rd_addr_channel_7 = 1'd1 ;
  assign WILL_FIRE_RL_rl_rd_addr_channel_7 = 1'd1 ;
  // rule RL_rl_rd_data_channel_7
  assign CAN_FIRE_RL_rl_rd_data_channel_7 = 1'd1 ;
  assign WILL_FIRE_RL_rl_rd_data_channel_7 = 1'd1 ;
  // rule RL_rl_connect_external_interrupt_requests
  assign CAN_FIRE_RL_rl_connect_external_interrupt_requests = 1'd1 ;
  assign WILL_FIRE_RL_rl_connect_external_interrupt_requests = 1'd1 ;
  // rule RL_rl_reset_start_initial
  assign CAN_FIRE_RL_rl_reset_start_initial = MUX_rg_state$write_1__SEL_1 ;
  assign WILL_FIRE_RL_rl_reset_start_initial = MUX_rg_state$write_1__SEL_1 ;
  // rule RL_rl_reset_complete_initial
  assign CAN_FIRE_RL_rl_reset_complete_initial = MUX_rg_state$write_1__SEL_2 ;
  assign WILL_FIRE_RL_rl_reset_complete_initial =
	     MUX_rg_state$write_1__SEL_2 ;
  // inputs to muxes for submodule ports
  assign MUX_rg_state$write_1__SEL_1 =
	     mem0_controller$RDY_server_reset_request_put &&
	     uart0$RDY_server_reset_request_put &&
	     fabric$RDY_reset &&
	     core$RDY_cpu_reset_server_request_put &&
	     rg_state == 2'd0 ;
  assign MUX_rg_state$write_1__SEL_2 =
	     mem0_controller$RDY_set_addr_map &&
	     mem0_controller$RDY_server_reset_response_get &&
	     uart0$RDY_server_reset_response_get &&
	     core$RDY_cpu_reset_server_response_get &&
	     rg_state == 2'd1 ;
  // register rg_state
  assign rg_state$D_IN = WILL_FIRE_RL_rl_reset_start_initial ? 2'd1 : 2'd2 ;
  assign rg_state$EN =
	     WILL_FIRE_RL_rl_reset_start_initial ||
	     WILL_FIRE_RL_rl_reset_complete_initial ;
  // submodule boot_rom
  assign boot_rom$set_addr_map_addr_base = 64'h0000000000001000 ;
  assign boot_rom$set_addr_map_addr_lim = 64'd8192 ;
  assign boot_rom$slave_araddr = boot_rom_axi4_deburster$to_slave_araddr ;
  assign boot_rom$slave_arburst = boot_rom_axi4_deburster$to_slave_arburst ;
  assign boot_rom$slave_arcache = boot_rom_axi4_deburster$to_slave_arcache ;
  assign boot_rom$slave_arid = boot_rom_axi4_deburster$to_slave_arid ;
  assign boot_rom$slave_arlen = boot_rom_axi4_deburster$to_slave_arlen ;
  assign boot_rom$slave_arlock = boot_rom_axi4_deburster$to_slave_arlock ;
  assign boot_rom$slave_arprot = boot_rom_axi4_deburster$to_slave_arprot ;
  assign boot_rom$slave_arqos = boot_rom_axi4_deburster$to_slave_arqos ;
  assign boot_rom$slave_arregion = boot_rom_axi4_deburster$to_slave_arregion ;
  assign boot_rom$slave_arsize = boot_rom_axi4_deburster$to_slave_arsize ;
  assign boot_rom$slave_arvalid = boot_rom_axi4_deburster$to_slave_arvalid ;
  assign boot_rom$slave_awaddr = boot_rom_axi4_deburster$to_slave_awaddr ;
  assign boot_rom$slave_awburst = boot_rom_axi4_deburster$to_slave_awburst ;
  assign boot_rom$slave_awcache = boot_rom_axi4_deburster$to_slave_awcache ;
  assign boot_rom$slave_awid = boot_rom_axi4_deburster$to_slave_awid ;
  assign boot_rom$slave_awlen = boot_rom_axi4_deburster$to_slave_awlen ;
  assign boot_rom$slave_awlock = boot_rom_axi4_deburster$to_slave_awlock ;
  assign boot_rom$slave_awprot = boot_rom_axi4_deburster$to_slave_awprot ;
  assign boot_rom$slave_awqos = boot_rom_axi4_deburster$to_slave_awqos ;
  assign boot_rom$slave_awregion = boot_rom_axi4_deburster$to_slave_awregion ;
  assign boot_rom$slave_awsize = boot_rom_axi4_deburster$to_slave_awsize ;
  assign boot_rom$slave_awvalid = boot_rom_axi4_deburster$to_slave_awvalid ;
  assign boot_rom$slave_bready = boot_rom_axi4_deburster$to_slave_bready ;
  assign boot_rom$slave_rready = boot_rom_axi4_deburster$to_slave_rready ;
  assign boot_rom$slave_wdata = boot_rom_axi4_deburster$to_slave_wdata ;
  assign boot_rom$slave_wlast = boot_rom_axi4_deburster$to_slave_wlast ;
  assign boot_rom$slave_wstrb = boot_rom_axi4_deburster$to_slave_wstrb ;
  assign boot_rom$slave_wvalid = boot_rom_axi4_deburster$to_slave_wvalid ;
  assign boot_rom$EN_set_addr_map = MUX_rg_state$write_1__SEL_2 ;
  // submodule boot_rom_axi4_deburster
  assign boot_rom_axi4_deburster$from_master_araddr =
	     fabric$v_to_slaves_0_araddr ;
  assign boot_rom_axi4_deburster$from_master_arburst =
	     fabric$v_to_slaves_0_arburst ;
  assign boot_rom_axi4_deburster$from_master_arcache =
	     fabric$v_to_slaves_0_arcache ;
  assign boot_rom_axi4_deburster$from_master_arid =
	     fabric$v_to_slaves_0_arid ;
  assign boot_rom_axi4_deburster$from_master_arlen =
	     fabric$v_to_slaves_0_arlen ;
  assign boot_rom_axi4_deburster$from_master_arlock =
	     fabric$v_to_slaves_0_arlock ;
  assign boot_rom_axi4_deburster$from_master_arprot =
	     fabric$v_to_slaves_0_arprot ;
  assign boot_rom_axi4_deburster$from_master_arqos =
	     fabric$v_to_slaves_0_arqos ;
  assign boot_rom_axi4_deburster$from_master_arregion =
	     fabric$v_to_slaves_0_arregion ;
  assign boot_rom_axi4_deburster$from_master_arsize =
	     fabric$v_to_slaves_0_arsize ;
  assign boot_rom_axi4_deburster$from_master_arvalid =
	     fabric$v_to_slaves_0_arvalid ;
  assign boot_rom_axi4_deburster$from_master_awaddr =
	     fabric$v_to_slaves_0_awaddr ;
  assign boot_rom_axi4_deburster$from_master_awburst =
	     fabric$v_to_slaves_0_awburst ;
  assign boot_rom_axi4_deburster$from_master_awcache =
	     fabric$v_to_slaves_0_awcache ;
  assign boot_rom_axi4_deburster$from_master_awid =
	     fabric$v_to_slaves_0_awid ;
  assign boot_rom_axi4_deburster$from_master_awlen =
	     fabric$v_to_slaves_0_awlen ;
  assign boot_rom_axi4_deburster$from_master_awlock =
	     fabric$v_to_slaves_0_awlock ;
  assign boot_rom_axi4_deburster$from_master_awprot =
	     fabric$v_to_slaves_0_awprot ;
  assign boot_rom_axi4_deburster$from_master_awqos =
	     fabric$v_to_slaves_0_awqos ;
  assign boot_rom_axi4_deburster$from_master_awregion =
	     fabric$v_to_slaves_0_awregion ;
  assign boot_rom_axi4_deburster$from_master_awsize =
	     fabric$v_to_slaves_0_awsize ;
  assign boot_rom_axi4_deburster$from_master_awvalid =
	     fabric$v_to_slaves_0_awvalid ;
  assign boot_rom_axi4_deburster$from_master_bready =
	     fabric$v_to_slaves_0_bready ;
  assign boot_rom_axi4_deburster$from_master_rready =
	     fabric$v_to_slaves_0_rready ;
  assign boot_rom_axi4_deburster$from_master_wdata =
	     fabric$v_to_slaves_0_wdata ;
  assign boot_rom_axi4_deburster$from_master_wlast =
	     fabric$v_to_slaves_0_wlast ;
  assign boot_rom_axi4_deburster$from_master_wstrb =
	     fabric$v_to_slaves_0_wstrb ;
  assign boot_rom_axi4_deburster$from_master_wvalid =
	     fabric$v_to_slaves_0_wvalid ;
  assign boot_rom_axi4_deburster$to_slave_arready = boot_rom$slave_arready ;
  assign boot_rom_axi4_deburster$to_slave_awready = boot_rom$slave_awready ;
  assign boot_rom_axi4_deburster$to_slave_bid = boot_rom$slave_bid ;
  assign boot_rom_axi4_deburster$to_slave_bresp = boot_rom$slave_bresp ;
  assign boot_rom_axi4_deburster$to_slave_bvalid = boot_rom$slave_bvalid ;
  assign boot_rom_axi4_deburster$to_slave_rdata = boot_rom$slave_rdata ;
  assign boot_rom_axi4_deburster$to_slave_rid = boot_rom$slave_rid ;
  assign boot_rom_axi4_deburster$to_slave_rlast = boot_rom$slave_rlast ;
  assign boot_rom_axi4_deburster$to_slave_rresp = boot_rom$slave_rresp ;
  assign boot_rom_axi4_deburster$to_slave_rvalid = boot_rom$slave_rvalid ;
  assign boot_rom_axi4_deburster$to_slave_wready = boot_rom$slave_wready ;
  assign boot_rom_axi4_deburster$EN_reset = 1'b0 ;
  // submodule core
  assign core$core_external_interrupt_sources_0_m_interrupt_req_set_not_clear =
	     uart0$intr ;
  assign core$core_external_interrupt_sources_10_m_interrupt_req_set_not_clear =
	     1'd0 ;
  assign core$core_external_interrupt_sources_11_m_interrupt_req_set_not_clear =
	     1'd0 ;
  assign core$core_external_interrupt_sources_12_m_interrupt_req_set_not_clear =
	     1'd0 ;
  assign core$core_external_interrupt_sources_13_m_interrupt_req_set_not_clear =
	     1'd0 ;
  assign core$core_external_interrupt_sources_14_m_interrupt_req_set_not_clear =
	     1'd0 ;
  assign core$core_external_interrupt_sources_15_m_interrupt_req_set_not_clear =
	     1'd0 ;
  assign core$core_external_interrupt_sources_1_m_interrupt_req_set_not_clear =
	     1'd0 ;
  assign core$core_external_interrupt_sources_2_m_interrupt_req_set_not_clear =
	     1'd0 ;
  assign core$core_external_interrupt_sources_3_m_interrupt_req_set_not_clear =
	     1'd0 ;
  assign core$core_external_interrupt_sources_4_m_interrupt_req_set_not_clear =
	     1'd0 ;
  assign core$core_external_interrupt_sources_5_m_interrupt_req_set_not_clear =
	     1'd0 ;
  assign core$core_external_interrupt_sources_6_m_interrupt_req_set_not_clear =
	     1'd0 ;
  assign core$core_external_interrupt_sources_7_m_interrupt_req_set_not_clear =
	     1'd0 ;
  assign core$core_external_interrupt_sources_8_m_interrupt_req_set_not_clear =
	     1'd0 ;
  assign core$core_external_interrupt_sources_9_m_interrupt_req_set_not_clear =
	     1'd0 ;
  assign core$core_mem_master_arready = fabric$v_from_masters_1_arready ;
  assign core$core_mem_master_awready = fabric$v_from_masters_1_awready ;
  assign core$core_mem_master_bid = fabric$v_from_masters_1_bid ;
  assign core$core_mem_master_bresp = fabric$v_from_masters_1_bresp ;
  assign core$core_mem_master_bvalid = fabric$v_from_masters_1_bvalid ;
  assign core$core_mem_master_rdata = fabric$v_from_masters_1_rdata ;
  assign core$core_mem_master_rid = fabric$v_from_masters_1_rid ;
  assign core$core_mem_master_rlast = fabric$v_from_masters_1_rlast ;
  assign core$core_mem_master_rresp = fabric$v_from_masters_1_rresp ;
  assign core$core_mem_master_rvalid = fabric$v_from_masters_1_rvalid ;
  assign core$core_mem_master_wready = fabric$v_from_masters_1_wready ;
  assign core$cpu_imem_master_arready = fabric$v_from_masters_0_arready ;
  assign core$cpu_imem_master_awready = fabric$v_from_masters_0_awready ;
  assign core$cpu_imem_master_bid = fabric$v_from_masters_0_bid ;
  assign core$cpu_imem_master_bresp = fabric$v_from_masters_0_bresp ;
  assign core$cpu_imem_master_bvalid = fabric$v_from_masters_0_bvalid ;
  assign core$cpu_imem_master_rdata = fabric$v_from_masters_0_rdata ;
  assign core$cpu_imem_master_rid = fabric$v_from_masters_0_rid ;
  assign core$cpu_imem_master_rlast = fabric$v_from_masters_0_rlast ;
  assign core$cpu_imem_master_rresp = fabric$v_from_masters_0_rresp ;
  assign core$cpu_imem_master_rvalid = fabric$v_from_masters_0_rvalid ;
  assign core$cpu_imem_master_wready = fabric$v_from_masters_0_wready ;
  assign core$cpu_reset_server_request_put = 1'd1 ;
  assign core$dma_server_araddr =
	     64'hAAAAAAAAAAAAAAAA /* unspecified value */  ;
  assign core$dma_server_arburst = 2'b10 /* unspecified value */  ;
  assign core$dma_server_arcache = 4'b1010 /* unspecified value */  ;
  assign core$dma_server_arid =
	     16'b1010101010101010 /* unspecified value */  ;
  assign core$dma_server_arlen = 8'b10101010 /* unspecified value */  ;
  assign core$dma_server_arlock = 1'b0 /* unspecified value */  ;
  assign core$dma_server_arprot = 3'b010 /* unspecified value */  ;
  assign core$dma_server_arqos = 4'b1010 /* unspecified value */  ;
  assign core$dma_server_arregion = 4'b1010 /* unspecified value */  ;
  assign core$dma_server_arsize = 3'b010 /* unspecified value */  ;
  assign core$dma_server_arvalid = 1'd0 ;
  assign core$dma_server_awaddr =
	     64'hAAAAAAAAAAAAAAAA /* unspecified value */  ;
  assign core$dma_server_awburst = 2'b10 /* unspecified value */  ;
  assign core$dma_server_awcache = 4'b1010 /* unspecified value */  ;
  assign core$dma_server_awid =
	     16'b1010101010101010 /* unspecified value */  ;
  assign core$dma_server_awlen = 8'b10101010 /* unspecified value */  ;
  assign core$dma_server_awlock = 1'b0 /* unspecified value */  ;
  assign core$dma_server_awprot = 3'b010 /* unspecified value */  ;
  assign core$dma_server_awqos = 4'b1010 /* unspecified value */  ;
  assign core$dma_server_awregion = 4'b1010 /* unspecified value */  ;
  assign core$dma_server_awsize = 3'b010 /* unspecified value */  ;
  assign core$dma_server_awvalid = 1'd0 ;
  assign core$dma_server_bready = 1'd0 ;
  assign core$dma_server_rready = 1'd0 ;
  assign core$dma_server_wdata =
	     512'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */  ;
  assign core$dma_server_wlast = 1'b0 /* unspecified value */  ;
  assign core$dma_server_wstrb =
	     64'hAAAAAAAAAAAAAAAA /* unspecified value */  ;
  assign core$dma_server_wvalid = 1'd0 ;
  assign core$nmi_req_set_not_clear = 1'd0 ;
  assign core$set_verbosity_logdelay = set_verbosity_logdelay ;
  assign core$set_verbosity_verbosity = set_verbosity_verbosity ;
  assign core$set_watch_tohost_tohost_addr = set_watch_tohost_tohost_addr ;
  assign core$set_watch_tohost_watch_tohost = set_watch_tohost_watch_tohost ;
  assign core$EN_cpu_reset_server_request_put = MUX_rg_state$write_1__SEL_1 ;
  assign core$EN_cpu_reset_server_response_get = MUX_rg_state$write_1__SEL_2 ;
  assign core$EN_set_verbosity = EN_set_verbosity ;
  assign core$EN_set_watch_tohost = EN_set_watch_tohost ;
  assign core$EN_ma_ddr4_ready = EN_ma_ddr4_ready ;
  // submodule fabric
  assign fabric$set_verbosity_verbosity = 4'h0 ;
  assign fabric$v_from_masters_0_araddr = core$cpu_imem_master_araddr ;
  assign fabric$v_from_masters_0_arburst = core$cpu_imem_master_arburst ;
  assign fabric$v_from_masters_0_arcache = core$cpu_imem_master_arcache ;
  assign fabric$v_from_masters_0_arid = core$cpu_imem_master_arid ;
  assign fabric$v_from_masters_0_arlen = core$cpu_imem_master_arlen ;
  assign fabric$v_from_masters_0_arlock = core$cpu_imem_master_arlock ;
  assign fabric$v_from_masters_0_arprot = core$cpu_imem_master_arprot ;
  assign fabric$v_from_masters_0_arqos = core$cpu_imem_master_arqos ;
  assign fabric$v_from_masters_0_arregion = core$cpu_imem_master_arregion ;
  assign fabric$v_from_masters_0_arsize = core$cpu_imem_master_arsize ;
  assign fabric$v_from_masters_0_arvalid = core$cpu_imem_master_arvalid ;
  assign fabric$v_from_masters_0_awaddr = core$cpu_imem_master_awaddr ;
  assign fabric$v_from_masters_0_awburst = core$cpu_imem_master_awburst ;
  assign fabric$v_from_masters_0_awcache = core$cpu_imem_master_awcache ;
  assign fabric$v_from_masters_0_awid = core$cpu_imem_master_awid ;
  assign fabric$v_from_masters_0_awlen = core$cpu_imem_master_awlen ;
  assign fabric$v_from_masters_0_awlock = core$cpu_imem_master_awlock ;
  assign fabric$v_from_masters_0_awprot = core$cpu_imem_master_awprot ;
  assign fabric$v_from_masters_0_awqos = core$cpu_imem_master_awqos ;
  assign fabric$v_from_masters_0_awregion = core$cpu_imem_master_awregion ;
  assign fabric$v_from_masters_0_awsize = core$cpu_imem_master_awsize ;
  assign fabric$v_from_masters_0_awvalid = core$cpu_imem_master_awvalid ;
  assign fabric$v_from_masters_0_bready = core$cpu_imem_master_bready ;
  assign fabric$v_from_masters_0_rready = core$cpu_imem_master_rready ;
  assign fabric$v_from_masters_0_wdata = core$cpu_imem_master_wdata ;
  assign fabric$v_from_masters_0_wlast = core$cpu_imem_master_wlast ;
  assign fabric$v_from_masters_0_wstrb = core$cpu_imem_master_wstrb ;
  assign fabric$v_from_masters_0_wvalid = core$cpu_imem_master_wvalid ;
  assign fabric$v_from_masters_1_araddr = core$core_mem_master_araddr ;
  assign fabric$v_from_masters_1_arburst = core$core_mem_master_arburst ;
  assign fabric$v_from_masters_1_arcache = core$core_mem_master_arcache ;
  assign fabric$v_from_masters_1_arid = core$core_mem_master_arid ;
  assign fabric$v_from_masters_1_arlen = core$core_mem_master_arlen ;
  assign fabric$v_from_masters_1_arlock = core$core_mem_master_arlock ;
  assign fabric$v_from_masters_1_arprot = core$core_mem_master_arprot ;
  assign fabric$v_from_masters_1_arqos = core$core_mem_master_arqos ;
  assign fabric$v_from_masters_1_arregion = core$core_mem_master_arregion ;
  assign fabric$v_from_masters_1_arsize = core$core_mem_master_arsize ;
  assign fabric$v_from_masters_1_arvalid = core$core_mem_master_arvalid ;
  assign fabric$v_from_masters_1_awaddr = core$core_mem_master_awaddr ;
  assign fabric$v_from_masters_1_awburst = core$core_mem_master_awburst ;
  assign fabric$v_from_masters_1_awcache = core$core_mem_master_awcache ;
  assign fabric$v_from_masters_1_awid = core$core_mem_master_awid ;
  assign fabric$v_from_masters_1_awlen = core$core_mem_master_awlen ;
  assign fabric$v_from_masters_1_awlock = core$core_mem_master_awlock ;
  assign fabric$v_from_masters_1_awprot = core$core_mem_master_awprot ;
  assign fabric$v_from_masters_1_awqos = core$core_mem_master_awqos ;
  assign fabric$v_from_masters_1_awregion = core$core_mem_master_awregion ;
  assign fabric$v_from_masters_1_awsize = core$core_mem_master_awsize ;
  assign fabric$v_from_masters_1_awvalid = core$core_mem_master_awvalid ;
  assign fabric$v_from_masters_1_bready = core$core_mem_master_bready ;
  assign fabric$v_from_masters_1_rready = core$core_mem_master_rready ;
  assign fabric$v_from_masters_1_wdata = core$core_mem_master_wdata ;
  assign fabric$v_from_masters_1_wlast = core$core_mem_master_wlast ;
  assign fabric$v_from_masters_1_wstrb = core$core_mem_master_wstrb ;
  assign fabric$v_from_masters_1_wvalid = core$core_mem_master_wvalid ;
  assign fabric$v_to_slaves_0_arready =
	     boot_rom_axi4_deburster$from_master_arready ;
  assign fabric$v_to_slaves_0_awready =
	     boot_rom_axi4_deburster$from_master_awready ;
  assign fabric$v_to_slaves_0_bid = boot_rom_axi4_deburster$from_master_bid ;
  assign fabric$v_to_slaves_0_bresp =
	     boot_rom_axi4_deburster$from_master_bresp ;
  assign fabric$v_to_slaves_0_bvalid =
	     boot_rom_axi4_deburster$from_master_bvalid ;
  assign fabric$v_to_slaves_0_rdata =
	     boot_rom_axi4_deburster$from_master_rdata ;
  assign fabric$v_to_slaves_0_rid = boot_rom_axi4_deburster$from_master_rid ;
  assign fabric$v_to_slaves_0_rlast =
	     boot_rom_axi4_deburster$from_master_rlast ;
  assign fabric$v_to_slaves_0_rresp =
	     boot_rom_axi4_deburster$from_master_rresp ;
  assign fabric$v_to_slaves_0_rvalid =
	     boot_rom_axi4_deburster$from_master_rvalid ;
  assign fabric$v_to_slaves_0_wready =
	     boot_rom_axi4_deburster$from_master_wready ;
  assign fabric$v_to_slaves_1_arready =
	     mem0_controller_axi4_deburster$from_master_arready ;
  assign fabric$v_to_slaves_1_awready =
	     mem0_controller_axi4_deburster$from_master_awready ;
  assign fabric$v_to_slaves_1_bid =
	     mem0_controller_axi4_deburster$from_master_bid ;
  assign fabric$v_to_slaves_1_bresp =
	     mem0_controller_axi4_deburster$from_master_bresp ;
  assign fabric$v_to_slaves_1_bvalid =
	     mem0_controller_axi4_deburster$from_master_bvalid ;
  assign fabric$v_to_slaves_1_rdata =
	     mem0_controller_axi4_deburster$from_master_rdata ;
  assign fabric$v_to_slaves_1_rid =
	     mem0_controller_axi4_deburster$from_master_rid ;
  assign fabric$v_to_slaves_1_rlast =
	     mem0_controller_axi4_deburster$from_master_rlast ;
  assign fabric$v_to_slaves_1_rresp =
	     mem0_controller_axi4_deburster$from_master_rresp ;
  assign fabric$v_to_slaves_1_rvalid =
	     mem0_controller_axi4_deburster$from_master_rvalid ;
  assign fabric$v_to_slaves_1_wready =
	     mem0_controller_axi4_deburster$from_master_wready ;
  assign fabric$v_to_slaves_2_arready = uart0$slave_arready ;
  assign fabric$v_to_slaves_2_awready = uart0$slave_awready ;
  assign fabric$v_to_slaves_2_bid = uart0$slave_bid ;
  assign fabric$v_to_slaves_2_bresp = uart0$slave_bresp ;
  assign fabric$v_to_slaves_2_bvalid = uart0$slave_bvalid ;
  assign fabric$v_to_slaves_2_rdata = uart0$slave_rdata ;
  assign fabric$v_to_slaves_2_rid = uart0$slave_rid ;
  assign fabric$v_to_slaves_2_rlast = uart0$slave_rlast ;
  assign fabric$v_to_slaves_2_rresp = uart0$slave_rresp ;
  assign fabric$v_to_slaves_2_rvalid = uart0$slave_rvalid ;
  assign fabric$v_to_slaves_2_wready = uart0$slave_wready ;
  assign fabric$EN_reset = MUX_rg_state$write_1__SEL_1 ;
  assign fabric$EN_set_verbosity = 1'b0 ;
  // submodule mem0_controller
  assign mem0_controller$set_addr_map_addr_base = 64'h0000000080000000 ;
  assign mem0_controller$set_addr_map_addr_lim = 64'h0000000090000000 ;
  assign mem0_controller$set_watch_tohost_tohost_addr = 64'h0 ;
  assign mem0_controller$set_watch_tohost_watch_tohost = 1'b0 ;
  assign mem0_controller$slave_araddr =
	     mem0_controller_axi4_deburster$to_slave_araddr ;
  assign mem0_controller$slave_arburst =
	     mem0_controller_axi4_deburster$to_slave_arburst ;
  assign mem0_controller$slave_arcache =
	     mem0_controller_axi4_deburster$to_slave_arcache ;
  assign mem0_controller$slave_arid =
	     mem0_controller_axi4_deburster$to_slave_arid ;
  assign mem0_controller$slave_arlen =
	     mem0_controller_axi4_deburster$to_slave_arlen ;
  assign mem0_controller$slave_arlock =
	     mem0_controller_axi4_deburster$to_slave_arlock ;
  assign mem0_controller$slave_arprot =
	     mem0_controller_axi4_deburster$to_slave_arprot ;
  assign mem0_controller$slave_arqos =
	     mem0_controller_axi4_deburster$to_slave_arqos ;
  assign mem0_controller$slave_arregion =
	     mem0_controller_axi4_deburster$to_slave_arregion ;
  assign mem0_controller$slave_arsize =
	     mem0_controller_axi4_deburster$to_slave_arsize ;
  assign mem0_controller$slave_arvalid =
	     mem0_controller_axi4_deburster$to_slave_arvalid ;
  assign mem0_controller$slave_awaddr =
	     mem0_controller_axi4_deburster$to_slave_awaddr ;
  assign mem0_controller$slave_awburst =
	     mem0_controller_axi4_deburster$to_slave_awburst ;
  assign mem0_controller$slave_awcache =
	     mem0_controller_axi4_deburster$to_slave_awcache ;
  assign mem0_controller$slave_awid =
	     mem0_controller_axi4_deburster$to_slave_awid ;
  assign mem0_controller$slave_awlen =
	     mem0_controller_axi4_deburster$to_slave_awlen ;
  assign mem0_controller$slave_awlock =
	     mem0_controller_axi4_deburster$to_slave_awlock ;
  assign mem0_controller$slave_awprot =
	     mem0_controller_axi4_deburster$to_slave_awprot ;
  assign mem0_controller$slave_awqos =
	     mem0_controller_axi4_deburster$to_slave_awqos ;
  assign mem0_controller$slave_awregion =
	     mem0_controller_axi4_deburster$to_slave_awregion ;
  assign mem0_controller$slave_awsize =
	     mem0_controller_axi4_deburster$to_slave_awsize ;
  assign mem0_controller$slave_awvalid =
	     mem0_controller_axi4_deburster$to_slave_awvalid ;
  assign mem0_controller$slave_bready =
	     mem0_controller_axi4_deburster$to_slave_bready ;
  assign mem0_controller$slave_rready =
	     mem0_controller_axi4_deburster$to_slave_rready ;
  assign mem0_controller$slave_wdata =
	     mem0_controller_axi4_deburster$to_slave_wdata ;
  assign mem0_controller$slave_wlast =
	     mem0_controller_axi4_deburster$to_slave_wlast ;
  assign mem0_controller$slave_wstrb =
	     mem0_controller_axi4_deburster$to_slave_wstrb ;
  assign mem0_controller$slave_wvalid =
	     mem0_controller_axi4_deburster$to_slave_wvalid ;
  assign mem0_controller$to_raw_mem_response_put = to_raw_mem_response_put ;
  assign mem0_controller$EN_server_reset_request_put =
	     MUX_rg_state$write_1__SEL_1 ;
  assign mem0_controller$EN_server_reset_response_get =
	     MUX_rg_state$write_1__SEL_2 ;
  assign mem0_controller$EN_set_addr_map = MUX_rg_state$write_1__SEL_2 ;
  assign mem0_controller$EN_to_raw_mem_request_get =
	     EN_to_raw_mem_request_get ;
  assign mem0_controller$EN_to_raw_mem_response_put =
	     EN_to_raw_mem_response_put ;
  assign mem0_controller$EN_set_watch_tohost = 1'b0 ;
  // submodule mem0_controller_axi4_deburster
  assign mem0_controller_axi4_deburster$from_master_araddr =
	     fabric$v_to_slaves_1_araddr ;
  assign mem0_controller_axi4_deburster$from_master_arburst =
	     fabric$v_to_slaves_1_arburst ;
  assign mem0_controller_axi4_deburster$from_master_arcache =
	     fabric$v_to_slaves_1_arcache ;
  assign mem0_controller_axi4_deburster$from_master_arid =
	     fabric$v_to_slaves_1_arid ;
  assign mem0_controller_axi4_deburster$from_master_arlen =
	     fabric$v_to_slaves_1_arlen ;
  assign mem0_controller_axi4_deburster$from_master_arlock =
	     fabric$v_to_slaves_1_arlock ;
  assign mem0_controller_axi4_deburster$from_master_arprot =
	     fabric$v_to_slaves_1_arprot ;
  assign mem0_controller_axi4_deburster$from_master_arqos =
	     fabric$v_to_slaves_1_arqos ;
  assign mem0_controller_axi4_deburster$from_master_arregion =
	     fabric$v_to_slaves_1_arregion ;
  assign mem0_controller_axi4_deburster$from_master_arsize =
	     fabric$v_to_slaves_1_arsize ;
  assign mem0_controller_axi4_deburster$from_master_arvalid =
	     fabric$v_to_slaves_1_arvalid ;
  assign mem0_controller_axi4_deburster$from_master_awaddr =
	     fabric$v_to_slaves_1_awaddr ;
  assign mem0_controller_axi4_deburster$from_master_awburst =
	     fabric$v_to_slaves_1_awburst ;
  assign mem0_controller_axi4_deburster$from_master_awcache =
	     fabric$v_to_slaves_1_awcache ;
  assign mem0_controller_axi4_deburster$from_master_awid =
	     fabric$v_to_slaves_1_awid ;
  assign mem0_controller_axi4_deburster$from_master_awlen =
	     fabric$v_to_slaves_1_awlen ;
  assign mem0_controller_axi4_deburster$from_master_awlock =
	     fabric$v_to_slaves_1_awlock ;
  assign mem0_controller_axi4_deburster$from_master_awprot =
	     fabric$v_to_slaves_1_awprot ;
  assign mem0_controller_axi4_deburster$from_master_awqos =
	     fabric$v_to_slaves_1_awqos ;
  assign mem0_controller_axi4_deburster$from_master_awregion =
	     fabric$v_to_slaves_1_awregion ;
  assign mem0_controller_axi4_deburster$from_master_awsize =
	     fabric$v_to_slaves_1_awsize ;
  assign mem0_controller_axi4_deburster$from_master_awvalid =
	     fabric$v_to_slaves_1_awvalid ;
  assign mem0_controller_axi4_deburster$from_master_bready =
	     fabric$v_to_slaves_1_bready ;
  assign mem0_controller_axi4_deburster$from_master_rready =
	     fabric$v_to_slaves_1_rready ;
  assign mem0_controller_axi4_deburster$from_master_wdata =
	     fabric$v_to_slaves_1_wdata ;
  assign mem0_controller_axi4_deburster$from_master_wlast =
	     fabric$v_to_slaves_1_wlast ;
  assign mem0_controller_axi4_deburster$from_master_wstrb =
	     fabric$v_to_slaves_1_wstrb ;
  assign mem0_controller_axi4_deburster$from_master_wvalid =
	     fabric$v_to_slaves_1_wvalid ;
  assign mem0_controller_axi4_deburster$to_slave_arready =
	     mem0_controller$slave_arready ;
  assign mem0_controller_axi4_deburster$to_slave_awready =
	     mem0_controller$slave_awready ;
  assign mem0_controller_axi4_deburster$to_slave_bid =
	     mem0_controller$slave_bid ;
  assign mem0_controller_axi4_deburster$to_slave_bresp =
	     mem0_controller$slave_bresp ;
  assign mem0_controller_axi4_deburster$to_slave_bvalid =
	     mem0_controller$slave_bvalid ;
  assign mem0_controller_axi4_deburster$to_slave_rdata =
	     mem0_controller$slave_rdata ;
  assign mem0_controller_axi4_deburster$to_slave_rid =
	     mem0_controller$slave_rid ;
  assign mem0_controller_axi4_deburster$to_slave_rlast =
	     mem0_controller$slave_rlast ;
  assign mem0_controller_axi4_deburster$to_slave_rresp =
	     mem0_controller$slave_rresp ;
  assign mem0_controller_axi4_deburster$to_slave_rvalid =
	     mem0_controller$slave_rvalid ;
  assign mem0_controller_axi4_deburster$to_slave_wready =
	     mem0_controller$slave_wready ;
  assign mem0_controller_axi4_deburster$EN_reset = 1'b0 ;
  // submodule uart0
  assign uart0$put_from_console_put = put_from_console_put ;
  assign uart0$set_addr_map_addr_base = 64'h00000000C0000000 ;
  assign uart0$set_addr_map_addr_lim = 64'h00000000C0000080 ;
  assign uart0$slave_araddr = fabric$v_to_slaves_2_araddr ;
  assign uart0$slave_arburst = fabric$v_to_slaves_2_arburst ;
  assign uart0$slave_arcache = fabric$v_to_slaves_2_arcache ;
  assign uart0$slave_arid = fabric$v_to_slaves_2_arid ;
  assign uart0$slave_arlen = fabric$v_to_slaves_2_arlen ;
  assign uart0$slave_arlock = fabric$v_to_slaves_2_arlock ;
  assign uart0$slave_arprot = fabric$v_to_slaves_2_arprot ;
  assign uart0$slave_arqos = fabric$v_to_slaves_2_arqos ;
  assign uart0$slave_arregion = fabric$v_to_slaves_2_arregion ;
  assign uart0$slave_arsize = fabric$v_to_slaves_2_arsize ;
  assign uart0$slave_arvalid = fabric$v_to_slaves_2_arvalid ;
  assign uart0$slave_awaddr = fabric$v_to_slaves_2_awaddr ;
  assign uart0$slave_awburst = fabric$v_to_slaves_2_awburst ;
  assign uart0$slave_awcache = fabric$v_to_slaves_2_awcache ;
  assign uart0$slave_awid = fabric$v_to_slaves_2_awid ;
  assign uart0$slave_awlen = fabric$v_to_slaves_2_awlen ;
  assign uart0$slave_awlock = fabric$v_to_slaves_2_awlock ;
  assign uart0$slave_awprot = fabric$v_to_slaves_2_awprot ;
  assign uart0$slave_awqos = fabric$v_to_slaves_2_awqos ;
  assign uart0$slave_awregion = fabric$v_to_slaves_2_awregion ;
  assign uart0$slave_awsize = fabric$v_to_slaves_2_awsize ;
  assign uart0$slave_awvalid = fabric$v_to_slaves_2_awvalid ;
  assign uart0$slave_bready = fabric$v_to_slaves_2_bready ;
  assign uart0$slave_rready = fabric$v_to_slaves_2_rready ;
  assign uart0$slave_wdata = fabric$v_to_slaves_2_wdata ;
  assign uart0$slave_wlast = fabric$v_to_slaves_2_wlast ;
  assign uart0$slave_wstrb = fabric$v_to_slaves_2_wstrb ;
  assign uart0$slave_wvalid = fabric$v_to_slaves_2_wvalid ;
  assign uart0$EN_server_reset_request_put = MUX_rg_state$write_1__SEL_1 ;
  assign uart0$EN_server_reset_response_get = MUX_rg_state$write_1__SEL_2 ;
  assign uart0$EN_set_addr_map = MUX_rg_state$write_1__SEL_2 ;
  assign uart0$EN_get_to_console_get = EN_get_to_console_get ;
  assign uart0$EN_put_from_console_put = EN_put_from_console_put ;
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        rg_state <= `BSV_ASSIGNMENT_DELAY 2'd0;
      end
    else
      begin
        if (rg_state$EN) rg_state <= `BSV_ASSIGNMENT_DELAY rg_state$D_IN;
      end
  end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    rg_state = 2'h2;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
  // handling of system tasks
  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_start_initial)
	begin
	  v__h11352 = $stime;
	  #0;
	end
    v__h11346 = v__h11352 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_start_initial)
	$display("%0d:%m.rl_reset_start_initial ...", v__h11346);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_complete_initial)
	begin
	  v__h11582 = $stime;
	  #0;
	end
    v__h11576 = v__h11582 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_complete_initial)
	$display("%0d:%m.rl_reset_complete_initial", v__h11576);
  end
  // synopsys translate_on
endmodule