module outputs
  wire [511 : 0] dma_server_rdata;
  wire [63 : 0] dmem_st_amo_val,
		dmem_word64,
		imem_master_araddr,
		imem_master_awaddr,
		imem_master_wdata,
		mem_master_araddr,
		mem_master_awaddr,
		mem_master_wdata,
		mv_tohost_value;
  wire [31 : 0] imem_instr, imem_pc, imem_tval;
  wire [7 : 0] imem_master_arlen,
	       imem_master_awlen,
	       imem_master_wstrb,
	       mem_master_arlen,
	       mem_master_awlen,
	       mem_master_wstrb,
	       mv_status;
  wire [5 : 0] dma_server_bid, dma_server_rid;
  wire [3 : 0] dmem_exc_code,
	       imem_exc_code,
	       imem_master_arcache,
	       imem_master_arid,
	       imem_master_arqos,
	       imem_master_arregion,
	       imem_master_awcache,
	       imem_master_awid,
	       imem_master_awqos,
	       imem_master_awregion,
	       mem_master_arcache,
	       mem_master_arid,
	       mem_master_arqos,
	       mem_master_arregion,
	       mem_master_awcache,
	       mem_master_awid,
	       mem_master_awqos,
	       mem_master_awregion;
  wire [2 : 0] imem_master_arprot,
	       imem_master_arsize,
	       imem_master_awprot,
	       imem_master_awsize,
	       mem_master_arprot,
	       mem_master_arsize,
	       mem_master_awprot,
	       mem_master_awsize;
  wire [1 : 0] dma_server_bresp,
	       dma_server_rresp,
	       imem_master_arburst,
	       imem_master_awburst,
	       mem_master_arburst,
	       mem_master_awburst;
  wire RDY_ma_ddr4_ready,
       RDY_mv_tohost_value,
       RDY_server_fence_i_request_put,
       RDY_server_fence_i_response_get,
       RDY_server_fence_request_put,
       RDY_server_fence_response_get,
       RDY_server_reset_request_put,
       RDY_server_reset_response_get,
       RDY_set_watch_tohost,
       dma_server_arready,
       dma_server_awready,
       dma_server_bvalid,
       dma_server_rlast,
       dma_server_rvalid,
       dma_server_wready,
       dmem_exc,
       dmem_valid,
       imem_exc,
       imem_is_i32_not_i16,
       imem_master_arlock,
       imem_master_arvalid,
       imem_master_awlock,
       imem_master_awvalid,
       imem_master_bready,
       imem_master_rready,
       imem_master_wlast,
       imem_master_wvalid,
       imem_valid,
       mem_master_arlock,
       mem_master_arvalid,
       mem_master_awlock,
       mem_master_awvalid,
       mem_master_bready,
       mem_master_rready,
       mem_master_wlast,
       mem_master_wvalid;
  // register cfg_verbosity
  reg [3 : 0] cfg_verbosity;
  wire [3 : 0] cfg_verbosity$D_IN;
  wire cfg_verbosity$EN;
  // register rg_state
  reg [1 : 0] rg_state;
  reg [1 : 0] rg_state$D_IN;
  wire rg_state$EN;
  // ports of submodule dcache
  wire [63 : 0] dcache$cword,
		dcache$mem_master_araddr,
		dcache$mem_master_awaddr,
		dcache$mem_master_rdata,
		dcache$mem_master_wdata,
		dcache$mv_tohost_value,
		dcache$req_st_value,
		dcache$set_watch_tohost_tohost_addr;
  wire [31 : 0] dcache$req_addr, dcache$req_satp;
  wire [7 : 0] dcache$mem_master_arlen,
	       dcache$mem_master_awlen,
	       dcache$mem_master_wstrb,
	       dcache$mv_status;
  wire [3 : 0] dcache$exc_code,
	       dcache$mem_master_arcache,
	       dcache$mem_master_arid,
	       dcache$mem_master_arqos,
	       dcache$mem_master_arregion,
	       dcache$mem_master_awcache,
	       dcache$mem_master_awid,
	       dcache$mem_master_awqos,
	       dcache$mem_master_awregion,
	       dcache$mem_master_bid,
	       dcache$mem_master_rid,
	       dcache$set_verbosity_verbosity;
  wire [2 : 0] dcache$mem_master_arprot,
	       dcache$mem_master_arsize,
	       dcache$mem_master_awprot,
	       dcache$mem_master_awsize,
	       dcache$req_f3;
  wire [1 : 0] dcache$mem_master_arburst,
	       dcache$mem_master_awburst,
	       dcache$mem_master_bresp,
	       dcache$mem_master_rresp,
	       dcache$req_priv;
  wire dcache$EN_ma_ddr4_ready,
       dcache$EN_req,
       dcache$EN_server_flush_request_put,
       dcache$EN_server_flush_response_get,
       dcache$EN_server_reset_request_put,
       dcache$EN_server_reset_response_get,
       dcache$EN_set_verbosity,
       dcache$EN_set_watch_tohost,
       dcache$EN_tlb_flush,
       dcache$RDY_server_flush_request_put,
       dcache$RDY_server_flush_response_get,
       dcache$RDY_server_reset_request_put,
       dcache$RDY_server_reset_response_get,
       dcache$exc,
       dcache$mem_master_arlock,
       dcache$mem_master_arready,
       dcache$mem_master_arvalid,
       dcache$mem_master_awlock,
       dcache$mem_master_awready,
       dcache$mem_master_awvalid,
       dcache$mem_master_bready,
       dcache$mem_master_bvalid,
       dcache$mem_master_rlast,
       dcache$mem_master_rready,
       dcache$mem_master_rvalid,
       dcache$mem_master_wlast,
       dcache$mem_master_wready,
       dcache$mem_master_wvalid,
       dcache$req_mstatus_MXR,
       dcache$req_op,
       dcache$req_sstatus_SUM,
       dcache$set_watch_tohost_watch_tohost,
       dcache$valid;
  // ports of submodule f_reset_rsps
  wire f_reset_rsps$CLR,
       f_reset_rsps$DEQ,
       f_reset_rsps$EMPTY_N,
       f_reset_rsps$ENQ,
       f_reset_rsps$FULL_N;
  // ports of submodule icache
  wire [63 : 0] icache$cword,
		icache$mem_master_araddr,
		icache$mem_master_awaddr,
		icache$mem_master_rdata,
		icache$mem_master_wdata,
		icache$req_st_value,
		icache$set_watch_tohost_tohost_addr;
  wire [31 : 0] icache$addr, icache$req_addr, icache$req_satp;
  wire [7 : 0] icache$mem_master_arlen,
	       icache$mem_master_awlen,
	       icache$mem_master_wstrb;
  wire [3 : 0] icache$exc_code,
	       icache$mem_master_arcache,
	       icache$mem_master_arid,
	       icache$mem_master_arqos,
	       icache$mem_master_arregion,
	       icache$mem_master_awcache,
	       icache$mem_master_awid,
	       icache$mem_master_awqos,
	       icache$mem_master_awregion,
	       icache$mem_master_bid,
	       icache$mem_master_rid,
	       icache$set_verbosity_verbosity;
  wire [2 : 0] icache$mem_master_arprot,
	       icache$mem_master_arsize,
	       icache$mem_master_awprot,
	       icache$mem_master_awsize,
	       icache$req_f3;
  wire [1 : 0] icache$mem_master_arburst,
	       icache$mem_master_awburst,
	       icache$mem_master_bresp,
	       icache$mem_master_rresp,
	       icache$req_priv;
  wire icache$EN_ma_ddr4_ready,
       icache$EN_req,
       icache$EN_server_flush_request_put,
       icache$EN_server_flush_response_get,
       icache$EN_server_reset_request_put,
       icache$EN_server_reset_response_get,
       icache$EN_set_verbosity,
       icache$EN_set_watch_tohost,
       icache$EN_tlb_flush,
       icache$RDY_server_flush_request_put,
       icache$RDY_server_flush_response_get,
       icache$RDY_server_reset_request_put,
       icache$RDY_server_reset_response_get,
       icache$exc,
       icache$mem_master_arlock,
       icache$mem_master_arready,
       icache$mem_master_arvalid,
       icache$mem_master_awlock,
       icache$mem_master_awready,
       icache$mem_master_awvalid,
       icache$mem_master_bready,
       icache$mem_master_bvalid,
       icache$mem_master_rlast,
       icache$mem_master_rready,
       icache$mem_master_rvalid,
       icache$mem_master_wlast,
       icache$mem_master_wready,
       icache$mem_master_wvalid,
       icache$req_mstatus_MXR,
       icache$req_op,
       icache$req_sstatus_SUM,
       icache$set_watch_tohost_watch_tohost,
       icache$valid;
  // ports of submodule soc_map
  wire [63 : 0] soc_map$m_is_IO_addr_addr,
		soc_map$m_is_mem_addr_addr,
		soc_map$m_is_near_mem_IO_addr_addr;
  // rule scheduling signals
  wire CAN_FIRE_RL_rl_reset,
       CAN_FIRE_RL_rl_reset_complete,
       CAN_FIRE_dma_server_m_arvalid,
       CAN_FIRE_dma_server_m_awvalid,
       CAN_FIRE_dma_server_m_bready,
       CAN_FIRE_dma_server_m_rready,
       CAN_FIRE_dma_server_m_wvalid,
       CAN_FIRE_dmem_req,
       CAN_FIRE_imem_master_m_arready,
       CAN_FIRE_imem_master_m_awready,
       CAN_FIRE_imem_master_m_bvalid,
       CAN_FIRE_imem_master_m_rvalid,
       CAN_FIRE_imem_master_m_wready,
       CAN_FIRE_imem_req,
       CAN_FIRE_ma_ddr4_ready,
       CAN_FIRE_mem_master_m_arready,
       CAN_FIRE_mem_master_m_awready,
       CAN_FIRE_mem_master_m_bvalid,
       CAN_FIRE_mem_master_m_rvalid,
       CAN_FIRE_mem_master_m_wready,
       CAN_FIRE_server_fence_i_request_put,
       CAN_FIRE_server_fence_i_response_get,
       CAN_FIRE_server_fence_request_put,
       CAN_FIRE_server_fence_response_get,
       CAN_FIRE_server_reset_request_put,
       CAN_FIRE_server_reset_response_get,
       CAN_FIRE_set_watch_tohost,
       WILL_FIRE_RL_rl_reset,
       WILL_FIRE_RL_rl_reset_complete,
       WILL_FIRE_dma_server_m_arvalid,
       WILL_FIRE_dma_server_m_awvalid,
       WILL_FIRE_dma_server_m_bready,
       WILL_FIRE_dma_server_m_rready,
       WILL_FIRE_dma_server_m_wvalid,
       WILL_FIRE_dmem_req,
       WILL_FIRE_imem_master_m_arready,
       WILL_FIRE_imem_master_m_awready,
       WILL_FIRE_imem_master_m_bvalid,
       WILL_FIRE_imem_master_m_rvalid,
       WILL_FIRE_imem_master_m_wready,
       WILL_FIRE_imem_req,
       WILL_FIRE_ma_ddr4_ready,
       WILL_FIRE_mem_master_m_arready,
       WILL_FIRE_mem_master_m_awready,
       WILL_FIRE_mem_master_m_bvalid,
       WILL_FIRE_mem_master_m_rvalid,
       WILL_FIRE_mem_master_m_wready,
       WILL_FIRE_server_fence_i_request_put,
       WILL_FIRE_server_fence_i_response_get,
       WILL_FIRE_server_fence_request_put,
       WILL_FIRE_server_fence_response_get,
       WILL_FIRE_server_reset_request_put,
       WILL_FIRE_server_reset_response_get,
       WILL_FIRE_set_watch_tohost;
  // inputs to muxes for submodule ports
  wire MUX_rg_state$write_1__SEL_2, MUX_rg_state$write_1__SEL_3;
  // declarations used by system tasks
  // synopsys translate_off
  reg [31 : 0] v__h1715;
  reg [31 : 0] v__h1866;
  reg [31 : 0] v__h1709;
  reg [31 : 0] v__h1860;
  // synopsys translate_on
  // remaining internal signals
  wire NOT_cfg_verbosity_read_ULE_1___d9;
  // action method server_reset_request_put
  assign RDY_server_reset_request_put = rg_state == 2'd2 ;
  assign CAN_FIRE_server_reset_request_put = rg_state == 2'd2 ;
  assign WILL_FIRE_server_reset_request_put = EN_server_reset_request_put ;
  // action method server_reset_response_get
  assign RDY_server_reset_response_get = f_reset_rsps$EMPTY_N ;
  assign CAN_FIRE_server_reset_response_get = f_reset_rsps$EMPTY_N ;
  assign WILL_FIRE_server_reset_response_get = EN_server_reset_response_get ;
  // action method imem_req
  assign CAN_FIRE_imem_req = 1'd1 ;
  assign WILL_FIRE_imem_req = EN_imem_req ;
  // value method imem_valid
  assign imem_valid = icache$valid ;
  // value method imem_is_i32_not_i16
  assign imem_is_i32_not_i16 = 1'd1 ;
  // value method imem_pc
  assign imem_pc = icache$addr ;
  // value method imem_instr
  assign imem_instr = icache$cword[31:0] ;
  // value method imem_exc
  assign imem_exc = icache$exc ;
  // value method imem_exc_code
  assign imem_exc_code = icache$exc_code ;
  // value method imem_tval
  assign imem_tval = icache$addr ;
  // value method imem_master_m_awvalid
  assign imem_master_awvalid = icache$mem_master_awvalid ;
  // value method imem_master_m_awid
  assign imem_master_awid = icache$mem_master_awid ;
  // value method imem_master_m_awaddr
  assign imem_master_awaddr = icache$mem_master_awaddr ;
  // value method imem_master_m_awlen
  assign imem_master_awlen = icache$mem_master_awlen ;
  // value method imem_master_m_awsize
  assign imem_master_awsize = icache$mem_master_awsize ;
  // value method imem_master_m_awburst
  assign imem_master_awburst = icache$mem_master_awburst ;
  // value method imem_master_m_awlock
  assign imem_master_awlock = icache$mem_master_awlock ;
  // value method imem_master_m_awcache
  assign imem_master_awcache = icache$mem_master_awcache ;
  // value method imem_master_m_awprot
  assign imem_master_awprot = icache$mem_master_awprot ;
  // value method imem_master_m_awqos
  assign imem_master_awqos = icache$mem_master_awqos ;
  // value method imem_master_m_awregion
  assign imem_master_awregion = icache$mem_master_awregion ;
  // action method imem_master_m_awready
  assign CAN_FIRE_imem_master_m_awready = 1'd1 ;
  assign WILL_FIRE_imem_master_m_awready = 1'd1 ;
  // value method imem_master_m_wvalid
  assign imem_master_wvalid = icache$mem_master_wvalid ;
  // value method imem_master_m_wdata
  assign imem_master_wdata = icache$mem_master_wdata ;
  // value method imem_master_m_wstrb
  assign imem_master_wstrb = icache$mem_master_wstrb ;
  // value method imem_master_m_wlast
  assign imem_master_wlast = icache$mem_master_wlast ;
  // action method imem_master_m_wready
  assign CAN_FIRE_imem_master_m_wready = 1'd1 ;
  assign WILL_FIRE_imem_master_m_wready = 1'd1 ;
  // action method imem_master_m_bvalid
  assign CAN_FIRE_imem_master_m_bvalid = 1'd1 ;
  assign WILL_FIRE_imem_master_m_bvalid = 1'd1 ;
  // value method imem_master_m_bready
  assign imem_master_bready = icache$mem_master_bready ;
  // value method imem_master_m_arvalid
  assign imem_master_arvalid = icache$mem_master_arvalid ;
  // value method imem_master_m_arid
  assign imem_master_arid = icache$mem_master_arid ;
  // value method imem_master_m_araddr
  assign imem_master_araddr = icache$mem_master_araddr ;
  // value method imem_master_m_arlen
  assign imem_master_arlen = icache$mem_master_arlen ;
  // value method imem_master_m_arsize
  assign imem_master_arsize = icache$mem_master_arsize ;
  // value method imem_master_m_arburst
  assign imem_master_arburst = icache$mem_master_arburst ;
  // value method imem_master_m_arlock
  assign imem_master_arlock = icache$mem_master_arlock ;
  // value method imem_master_m_arcache
  assign imem_master_arcache = icache$mem_master_arcache ;
  // value method imem_master_m_arprot
  assign imem_master_arprot = icache$mem_master_arprot ;
  // value method imem_master_m_arqos
  assign imem_master_arqos = icache$mem_master_arqos ;
  // value method imem_master_m_arregion
  assign imem_master_arregion = icache$mem_master_arregion ;
  // action method imem_master_m_arready
  assign CAN_FIRE_imem_master_m_arready = 1'd1 ;
  assign WILL_FIRE_imem_master_m_arready = 1'd1 ;
  // action method imem_master_m_rvalid
  assign CAN_FIRE_imem_master_m_rvalid = 1'd1 ;
  assign WILL_FIRE_imem_master_m_rvalid = 1'd1 ;
  // value method imem_master_m_rready
  assign imem_master_rready = icache$mem_master_rready ;
  // action method dmem_req
  assign CAN_FIRE_dmem_req = 1'd1 ;
  assign WILL_FIRE_dmem_req = EN_dmem_req ;
  // value method dmem_valid
  assign dmem_valid = dcache$valid ;
  // value method dmem_word64
  assign dmem_word64 = dcache$cword ;
  // value method dmem_st_amo_val
  assign dmem_st_amo_val = 64'hAAAAAAAAAAAAAAAA ;
  // value method dmem_exc
  assign dmem_exc = dcache$exc ;
  // value method dmem_exc_code
  assign dmem_exc_code = dcache$exc_code ;
  // value method mem_master_m_awvalid
  assign mem_master_awvalid = dcache$mem_master_awvalid ;
  // value method mem_master_m_awid
  assign mem_master_awid = dcache$mem_master_awid ;
  // value method mem_master_m_awaddr
  assign mem_master_awaddr = dcache$mem_master_awaddr ;
  // value method mem_master_m_awlen
  assign mem_master_awlen = dcache$mem_master_awlen ;
  // value method mem_master_m_awsize
  assign mem_master_awsize = dcache$mem_master_awsize ;
  // value method mem_master_m_awburst
  assign mem_master_awburst = dcache$mem_master_awburst ;
  // value method mem_master_m_awlock
  assign mem_master_awlock = dcache$mem_master_awlock ;
  // value method mem_master_m_awcache
  assign mem_master_awcache = dcache$mem_master_awcache ;
  // value method mem_master_m_awprot
  assign mem_master_awprot = dcache$mem_master_awprot ;
  // value method mem_master_m_awqos
  assign mem_master_awqos = dcache$mem_master_awqos ;
  // value method mem_master_m_awregion
  assign mem_master_awregion = dcache$mem_master_awregion ;
  // action method mem_master_m_awready
  assign CAN_FIRE_mem_master_m_awready = 1'd1 ;
  assign WILL_FIRE_mem_master_m_awready = 1'd1 ;
  // value method mem_master_m_wvalid
  assign mem_master_wvalid = dcache$mem_master_wvalid ;
  // value method mem_master_m_wdata
  assign mem_master_wdata = dcache$mem_master_wdata ;
  // value method mem_master_m_wstrb
  assign mem_master_wstrb = dcache$mem_master_wstrb ;
  // value method mem_master_m_wlast
  assign mem_master_wlast = dcache$mem_master_wlast ;
  // action method mem_master_m_wready
  assign CAN_FIRE_mem_master_m_wready = 1'd1 ;
  assign WILL_FIRE_mem_master_m_wready = 1'd1 ;
  // action method mem_master_m_bvalid
  assign CAN_FIRE_mem_master_m_bvalid = 1'd1 ;
  assign WILL_FIRE_mem_master_m_bvalid = 1'd1 ;
  // value method mem_master_m_bready
  assign mem_master_bready = dcache$mem_master_bready ;
  // value method mem_master_m_arvalid
  assign mem_master_arvalid = dcache$mem_master_arvalid ;
  // value method mem_master_m_arid
  assign mem_master_arid = dcache$mem_master_arid ;
  // value method mem_master_m_araddr
  assign mem_master_araddr = dcache$mem_master_araddr ;
  // value method mem_master_m_arlen
  assign mem_master_arlen = dcache$mem_master_arlen ;
  // value method mem_master_m_arsize
  assign mem_master_arsize = dcache$mem_master_arsize ;
  // value method mem_master_m_arburst
  assign mem_master_arburst = dcache$mem_master_arburst ;
  // value method mem_master_m_arlock
  assign mem_master_arlock = dcache$mem_master_arlock ;
  // value method mem_master_m_arcache
  assign mem_master_arcache = dcache$mem_master_arcache ;
  // value method mem_master_m_arprot
  assign mem_master_arprot = dcache$mem_master_arprot ;
  // value method mem_master_m_arqos
  assign mem_master_arqos = dcache$mem_master_arqos ;
  // value method mem_master_m_arregion
  assign mem_master_arregion = dcache$mem_master_arregion ;
  // action method mem_master_m_arready
  assign CAN_FIRE_mem_master_m_arready = 1'd1 ;
  assign WILL_FIRE_mem_master_m_arready = 1'd1 ;
  // action method mem_master_m_rvalid
  assign CAN_FIRE_mem_master_m_rvalid = 1'd1 ;
  assign WILL_FIRE_mem_master_m_rvalid = 1'd1 ;
  // value method mem_master_m_rready
  assign mem_master_rready = dcache$mem_master_rready ;
  // action method server_fence_i_request_put
  assign RDY_server_fence_i_request_put =
	     dcache$RDY_server_flush_request_put &&
	     icache$RDY_server_flush_request_put ;
  assign CAN_FIRE_server_fence_i_request_put =
	     dcache$RDY_server_flush_request_put &&
	     icache$RDY_server_flush_request_put ;
  assign WILL_FIRE_server_fence_i_request_put =
	     EN_server_fence_i_request_put ;
  // action method server_fence_i_response_get
  assign RDY_server_fence_i_response_get =
	     dcache$RDY_server_flush_response_get &&
	     icache$RDY_server_flush_response_get ;
  assign CAN_FIRE_server_fence_i_response_get =
	     dcache$RDY_server_flush_response_get &&
	     icache$RDY_server_flush_response_get ;
  assign WILL_FIRE_server_fence_i_response_get =
	     EN_server_fence_i_response_get ;
  // action method server_fence_request_put
  assign RDY_server_fence_request_put = dcache$RDY_server_flush_request_put ;
  assign CAN_FIRE_server_fence_request_put =
	     dcache$RDY_server_flush_request_put ;
  assign WILL_FIRE_server_fence_request_put = EN_server_fence_request_put ;
  // action method server_fence_response_get
  assign RDY_server_fence_response_get =
	     dcache$RDY_server_flush_response_get ;
  assign CAN_FIRE_server_fence_response_get =
	     dcache$RDY_server_flush_response_get ;
  assign WILL_FIRE_server_fence_response_get = EN_server_fence_response_get ;
  // action method dma_server_m_awvalid
  assign CAN_FIRE_dma_server_m_awvalid = 1'd1 ;
  assign WILL_FIRE_dma_server_m_awvalid = 1'd1 ;
  // value method dma_server_m_awready
  assign dma_server_awready = 1'd0 ;
  // action method dma_server_m_wvalid
  assign CAN_FIRE_dma_server_m_wvalid = 1'd1 ;
  assign WILL_FIRE_dma_server_m_wvalid = 1'd1 ;
  // value method dma_server_m_wready
  assign dma_server_wready = 1'd0 ;
  // value method dma_server_m_bvalid
  assign dma_server_bvalid = 1'd0 ;
  // value method dma_server_m_bid
  assign dma_server_bid = 6'h2A ;
  // value method dma_server_m_bresp
  assign dma_server_bresp = 2'd0 ;
  // action method dma_server_m_bready
  assign CAN_FIRE_dma_server_m_bready = 1'd1 ;
  assign WILL_FIRE_dma_server_m_bready = 1'd1 ;
  // action method dma_server_m_arvalid
  assign CAN_FIRE_dma_server_m_arvalid = 1'd1 ;
  assign WILL_FIRE_dma_server_m_arvalid = 1'd1 ;
  // value method dma_server_m_arready
  assign dma_server_arready = 1'd0 ;
  // value method dma_server_m_rvalid
  assign dma_server_rvalid = 1'd0 ;
  // value method dma_server_m_rid
  assign dma_server_rid = 6'd0 ;
  // value method dma_server_m_rdata
  assign dma_server_rdata = 512'd0 ;
  // value method dma_server_m_rresp
  assign dma_server_rresp = 2'd0 ;
  // value method dma_server_m_rlast
  assign dma_server_rlast = 1'd1 ;
  // action method dma_server_m_rready
  assign CAN_FIRE_dma_server_m_rready = 1'd1 ;
  assign WILL_FIRE_dma_server_m_rready = 1'd1 ;
  // action method set_watch_tohost
  assign RDY_set_watch_tohost = 1'd1 ;
  assign CAN_FIRE_set_watch_tohost = 1'd1 ;
  assign WILL_FIRE_set_watch_tohost = EN_set_watch_tohost ;
  // value method mv_tohost_value
  assign mv_tohost_value = dcache$mv_tohost_value ;
  assign RDY_mv_tohost_value = 1'd1 ;
  // action method ma_ddr4_ready
  assign RDY_ma_ddr4_ready = 1'd1 ;
  assign CAN_FIRE_ma_ddr4_ready = 1'd1 ;
  assign WILL_FIRE_ma_ddr4_ready = EN_ma_ddr4_ready ;
  // value method mv_status
  assign mv_status = dcache$mv_status ;
  // submodule dcache
  mkMMU_Cache #(.dmem_not_imem(1'd1)) dcache(.CLK(CLK),
					     .RST_N(RST_N),
					     .mem_master_arready(dcache$mem_master_arready),
					     .mem_master_awready(dcache$mem_master_awready),
					     .mem_master_bid(dcache$mem_master_bid),
					     .mem_master_bresp(dcache$mem_master_bresp),
					     .mem_master_bvalid(dcache$mem_master_bvalid),
					     .mem_master_rdata(dcache$mem_master_rdata),
					     .mem_master_rid(dcache$mem_master_rid),
					     .mem_master_rlast(dcache$mem_master_rlast),
					     .mem_master_rresp(dcache$mem_master_rresp),
					     .mem_master_rvalid(dcache$mem_master_rvalid),
					     .mem_master_wready(dcache$mem_master_wready),
					     .req_addr(dcache$req_addr),
					     .req_f3(dcache$req_f3),
					     .req_mstatus_MXR(dcache$req_mstatus_MXR),
					     .req_op(dcache$req_op),
					     .req_priv(dcache$req_priv),
					     .req_satp(dcache$req_satp),
					     .req_sstatus_SUM(dcache$req_sstatus_SUM),
					     .req_st_value(dcache$req_st_value),
					     .set_verbosity_verbosity(dcache$set_verbosity_verbosity),
					     .set_watch_tohost_tohost_addr(dcache$set_watch_tohost_tohost_addr),
					     .set_watch_tohost_watch_tohost(dcache$set_watch_tohost_watch_tohost),
					     .EN_set_verbosity(dcache$EN_set_verbosity),
					     .EN_server_reset_request_put(dcache$EN_server_reset_request_put),
					     .EN_server_reset_response_get(dcache$EN_server_reset_response_get),
					     .EN_req(dcache$EN_req),
					     .EN_server_flush_request_put(dcache$EN_server_flush_request_put),
					     .EN_server_flush_response_get(dcache$EN_server_flush_response_get),
					     .EN_tlb_flush(dcache$EN_tlb_flush),
					     .EN_set_watch_tohost(dcache$EN_set_watch_tohost),
					     .EN_ma_ddr4_ready(dcache$EN_ma_ddr4_ready),
					     .RDY_set_verbosity(),
					     .RDY_server_reset_request_put(dcache$RDY_server_reset_request_put),
					     .RDY_server_reset_response_get(dcache$RDY_server_reset_response_get),
					     .valid(dcache$valid),
					     .addr(),
					     .cword(dcache$cword),
					     .st_amo_val(),
					     .exc(dcache$exc),
					     .exc_code(dcache$exc_code),
					     .RDY_server_flush_request_put(dcache$RDY_server_flush_request_put),
					     .RDY_server_flush_response_get(dcache$RDY_server_flush_response_get),
					     .RDY_tlb_flush(),
					     .mem_master_awvalid(dcache$mem_master_awvalid),
					     .mem_master_awid(dcache$mem_master_awid),
					     .mem_master_awaddr(dcache$mem_master_awaddr),
					     .mem_master_awlen(dcache$mem_master_awlen),
					     .mem_master_awsize(dcache$mem_master_awsize),
					     .mem_master_awburst(dcache$mem_master_awburst),
					     .mem_master_awlock(dcache$mem_master_awlock),
					     .mem_master_awcache(dcache$mem_master_awcache),
					     .mem_master_awprot(dcache$mem_master_awprot),
					     .mem_master_awqos(dcache$mem_master_awqos),
					     .mem_master_awregion(dcache$mem_master_awregion),
					     .mem_master_wvalid(dcache$mem_master_wvalid),
					     .mem_master_wdata(dcache$mem_master_wdata),
					     .mem_master_wstrb(dcache$mem_master_wstrb),
					     .mem_master_wlast(dcache$mem_master_wlast),
					     .mem_master_bready(dcache$mem_master_bready),
					     .mem_master_arvalid(dcache$mem_master_arvalid),
					     .mem_master_arid(dcache$mem_master_arid),
					     .mem_master_araddr(dcache$mem_master_araddr),
					     .mem_master_arlen(dcache$mem_master_arlen),
					     .mem_master_arsize(dcache$mem_master_arsize),
					     .mem_master_arburst(dcache$mem_master_arburst),
					     .mem_master_arlock(dcache$mem_master_arlock),
					     .mem_master_arcache(dcache$mem_master_arcache),
					     .mem_master_arprot(dcache$mem_master_arprot),
					     .mem_master_arqos(dcache$mem_master_arqos),
					     .mem_master_arregion(dcache$mem_master_arregion),
					     .mem_master_rready(dcache$mem_master_rready),
					     .RDY_set_watch_tohost(),
					     .mv_tohost_value(dcache$mv_tohost_value),
					     .RDY_mv_tohost_value(),
					     .RDY_ma_ddr4_ready(),
					     .mv_status(dcache$mv_status));
  // submodule f_reset_rsps
  FIFO20 #(.guarded(32'd1)) f_reset_rsps(.RST(RST_N),
					 .CLK(CLK),
					 .ENQ(f_reset_rsps$ENQ),
					 .DEQ(f_reset_rsps$DEQ),
					 .CLR(f_reset_rsps$CLR),
					 .FULL_N(f_reset_rsps$FULL_N),
					 .EMPTY_N(f_reset_rsps$EMPTY_N));
  // submodule icache
  mkMMU_Cache #(.dmem_not_imem(1'd0)) icache(.CLK(CLK),
					     .RST_N(RST_N),
					     .mem_master_arready(icache$mem_master_arready),
					     .mem_master_awready(icache$mem_master_awready),
					     .mem_master_bid(icache$mem_master_bid),
					     .mem_master_bresp(icache$mem_master_bresp),
					     .mem_master_bvalid(icache$mem_master_bvalid),
					     .mem_master_rdata(icache$mem_master_rdata),
					     .mem_master_rid(icache$mem_master_rid),
					     .mem_master_rlast(icache$mem_master_rlast),
					     .mem_master_rresp(icache$mem_master_rresp),
					     .mem_master_rvalid(icache$mem_master_rvalid),
					     .mem_master_wready(icache$mem_master_wready),
					     .req_addr(icache$req_addr),
					     .req_f3(icache$req_f3),
					     .req_mstatus_MXR(icache$req_mstatus_MXR),
					     .req_op(icache$req_op),
					     .req_priv(icache$req_priv),
					     .req_satp(icache$req_satp),
					     .req_sstatus_SUM(icache$req_sstatus_SUM),
					     .req_st_value(icache$req_st_value),
					     .set_verbosity_verbosity(icache$set_verbosity_verbosity),
					     .set_watch_tohost_tohost_addr(icache$set_watch_tohost_tohost_addr),
					     .set_watch_tohost_watch_tohost(icache$set_watch_tohost_watch_tohost),
					     .EN_set_verbosity(icache$EN_set_verbosity),
					     .EN_server_reset_request_put(icache$EN_server_reset_request_put),
					     .EN_server_reset_response_get(icache$EN_server_reset_response_get),
					     .EN_req(icache$EN_req),
					     .EN_server_flush_request_put(icache$EN_server_flush_request_put),
					     .EN_server_flush_response_get(icache$EN_server_flush_response_get),
					     .EN_tlb_flush(icache$EN_tlb_flush),
					     .EN_set_watch_tohost(icache$EN_set_watch_tohost),
					     .EN_ma_ddr4_ready(icache$EN_ma_ddr4_ready),
					     .RDY_set_verbosity(),
					     .RDY_server_reset_request_put(icache$RDY_server_reset_request_put),
					     .RDY_server_reset_response_get(icache$RDY_server_reset_response_get),
					     .valid(icache$valid),
					     .addr(icache$addr),
					     .cword(icache$cword),
					     .st_amo_val(),
					     .exc(icache$exc),
					     .exc_code(icache$exc_code),
					     .RDY_server_flush_request_put(icache$RDY_server_flush_request_put),
					     .RDY_server_flush_response_get(icache$RDY_server_flush_response_get),
					     .RDY_tlb_flush(),
					     .mem_master_awvalid(icache$mem_master_awvalid),
					     .mem_master_awid(icache$mem_master_awid),
					     .mem_master_awaddr(icache$mem_master_awaddr),
					     .mem_master_awlen(icache$mem_master_awlen),
					     .mem_master_awsize(icache$mem_master_awsize),
					     .mem_master_awburst(icache$mem_master_awburst),
					     .mem_master_awlock(icache$mem_master_awlock),
					     .mem_master_awcache(icache$mem_master_awcache),
					     .mem_master_awprot(icache$mem_master_awprot),
					     .mem_master_awqos(icache$mem_master_awqos),
					     .mem_master_awregion(icache$mem_master_awregion),
					     .mem_master_wvalid(icache$mem_master_wvalid),
					     .mem_master_wdata(icache$mem_master_wdata),
					     .mem_master_wstrb(icache$mem_master_wstrb),
					     .mem_master_wlast(icache$mem_master_wlast),
					     .mem_master_bready(icache$mem_master_bready),
					     .mem_master_arvalid(icache$mem_master_arvalid),
					     .mem_master_arid(icache$mem_master_arid),
					     .mem_master_araddr(icache$mem_master_araddr),
					     .mem_master_arlen(icache$mem_master_arlen),
					     .mem_master_arsize(icache$mem_master_arsize),
					     .mem_master_arburst(icache$mem_master_arburst),
					     .mem_master_arlock(icache$mem_master_arlock),
					     .mem_master_arcache(icache$mem_master_arcache),
					     .mem_master_arprot(icache$mem_master_arprot),
					     .mem_master_arqos(icache$mem_master_arqos),
					     .mem_master_arregion(icache$mem_master_arregion),
					     .mem_master_rready(icache$mem_master_rready),
					     .RDY_set_watch_tohost(),
					     .mv_tohost_value(),
					     .RDY_mv_tohost_value(),
					     .RDY_ma_ddr4_ready(),
					     .mv_status());
  // submodule soc_map
  mkSoC_Map soc_map(.CLK(CLK),
		    .RST_N(RST_N),
		    .m_is_IO_addr_addr(soc_map$m_is_IO_addr_addr),
		    .m_is_mem_addr_addr(soc_map$m_is_mem_addr_addr),
		    .m_is_near_mem_IO_addr_addr(soc_map$m_is_near_mem_IO_addr_addr),
		    .m_near_mem_io_addr_base(),
		    .m_near_mem_io_addr_size(),
		    .m_near_mem_io_addr_lim(),
		    .m_plic_addr_base(),
		    .m_plic_addr_size(),
		    .m_plic_addr_lim(),
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
  // rule RL_rl_reset
  assign CAN_FIRE_RL_rl_reset =
	     dcache$RDY_server_reset_request_put &&
	     icache$RDY_server_reset_request_put &&
	     rg_state == 2'd0 ;
  assign WILL_FIRE_RL_rl_reset = MUX_rg_state$write_1__SEL_2 ;
  // rule RL_rl_reset_complete
  assign CAN_FIRE_RL_rl_reset_complete = MUX_rg_state$write_1__SEL_3 ;
  assign WILL_FIRE_RL_rl_reset_complete = MUX_rg_state$write_1__SEL_3 ;
  // inputs to muxes for submodule ports
  assign MUX_rg_state$write_1__SEL_2 =
	     CAN_FIRE_RL_rl_reset && !EN_server_fence_request_put &&
	     !EN_server_fence_i_request_put ;
  assign MUX_rg_state$write_1__SEL_3 =
	     dcache$RDY_server_reset_response_get &&
	     icache$RDY_server_reset_response_get &&
	     f_reset_rsps$FULL_N &&
	     rg_state == 2'd1 ;
  // register cfg_verbosity
  assign cfg_verbosity$D_IN = 4'h0 ;
  assign cfg_verbosity$EN = 1'b0 ;
  // register rg_state
  always@(EN_server_reset_request_put or
	  WILL_FIRE_RL_rl_reset or WILL_FIRE_RL_rl_reset_complete)
  begin
    case (1'b1) // synopsys parallel_case
      EN_server_reset_request_put: rg_state$D_IN = 2'd0;
      WILL_FIRE_RL_rl_reset: rg_state$D_IN = 2'd1;
      WILL_FIRE_RL_rl_reset_complete: rg_state$D_IN = 2'd2;
      default: rg_state$D_IN = 2'b10 /* unspecified value */ ;
    endcase
  end
  assign rg_state$EN =
	     EN_server_reset_request_put || WILL_FIRE_RL_rl_reset ||
	     WILL_FIRE_RL_rl_reset_complete ;
  // submodule dcache
  assign dcache$mem_master_arready = mem_master_arready ;
  assign dcache$mem_master_awready = mem_master_awready ;
  assign dcache$mem_master_bid = mem_master_bid ;
  assign dcache$mem_master_bresp = mem_master_bresp ;
  assign dcache$mem_master_bvalid = mem_master_bvalid ;
  assign dcache$mem_master_rdata = mem_master_rdata ;
  assign dcache$mem_master_rid = mem_master_rid ;
  assign dcache$mem_master_rlast = mem_master_rlast ;
  assign dcache$mem_master_rresp = mem_master_rresp ;
  assign dcache$mem_master_rvalid = mem_master_rvalid ;
  assign dcache$mem_master_wready = mem_master_wready ;
  assign dcache$req_addr = dmem_req_addr ;
  assign dcache$req_f3 = dmem_req_f3 ;
  assign dcache$req_mstatus_MXR = dmem_req_mstatus_MXR ;
  assign dcache$req_op = dmem_req_op ;
  assign dcache$req_priv = dmem_req_priv ;
  assign dcache$req_satp = dmem_req_satp ;
  assign dcache$req_sstatus_SUM = dmem_req_sstatus_SUM ;
  assign dcache$req_st_value = dmem_req_store_value ;
  assign dcache$set_verbosity_verbosity = 4'h0 ;
  assign dcache$set_watch_tohost_tohost_addr = set_watch_tohost_tohost_addr ;
  assign dcache$set_watch_tohost_watch_tohost =
	     set_watch_tohost_watch_tohost ;
  assign dcache$EN_set_verbosity = 1'b0 ;
  assign dcache$EN_server_reset_request_put = MUX_rg_state$write_1__SEL_2 ;
  assign dcache$EN_server_reset_response_get = MUX_rg_state$write_1__SEL_3 ;
  assign dcache$EN_req = EN_dmem_req ;
  assign dcache$EN_server_flush_request_put =
	     EN_server_fence_i_request_put || EN_server_fence_request_put ;
  assign dcache$EN_server_flush_response_get =
	     EN_server_fence_i_response_get || EN_server_fence_response_get ;
  assign dcache$EN_tlb_flush = 1'b0 ;
  assign dcache$EN_set_watch_tohost = EN_set_watch_tohost ;
  assign dcache$EN_ma_ddr4_ready = EN_ma_ddr4_ready ;
  // submodule f_reset_rsps
  assign f_reset_rsps$ENQ = MUX_rg_state$write_1__SEL_3 ;
  assign f_reset_rsps$DEQ = EN_server_reset_response_get ;
  assign f_reset_rsps$CLR = 1'b0 ;
  // submodule icache
  assign icache$mem_master_arready = imem_master_arready ;
  assign icache$mem_master_awready = imem_master_awready ;
  assign icache$mem_master_bid = imem_master_bid ;
  assign icache$mem_master_bresp = imem_master_bresp ;
  assign icache$mem_master_bvalid = imem_master_bvalid ;
  assign icache$mem_master_rdata = imem_master_rdata ;
  assign icache$mem_master_rid = imem_master_rid ;
  assign icache$mem_master_rlast = imem_master_rlast ;
  assign icache$mem_master_rresp = imem_master_rresp ;
  assign icache$mem_master_rvalid = imem_master_rvalid ;
  assign icache$mem_master_wready = imem_master_wready ;
  assign icache$req_addr = imem_req_addr ;
  assign icache$req_f3 = imem_req_f3 ;
  assign icache$req_mstatus_MXR = imem_req_mstatus_MXR ;
  assign icache$req_op = 1'd0 ;
  assign icache$req_priv = imem_req_priv ;
  assign icache$req_satp = imem_req_satp ;
  assign icache$req_sstatus_SUM = imem_req_sstatus_SUM ;
  assign icache$req_st_value = 64'hAAAAAAAAAAAAAAAA /* unspecified value */  ;
  assign icache$set_verbosity_verbosity = 4'h0 ;
  assign icache$set_watch_tohost_tohost_addr = 64'h0 ;
  assign icache$set_watch_tohost_watch_tohost = 1'b0 ;
  assign icache$EN_set_verbosity = 1'b0 ;
  assign icache$EN_server_reset_request_put = MUX_rg_state$write_1__SEL_2 ;
  assign icache$EN_server_reset_response_get = MUX_rg_state$write_1__SEL_3 ;
  assign icache$EN_req = EN_imem_req ;
  assign icache$EN_server_flush_request_put = EN_server_fence_i_request_put ;
  assign icache$EN_server_flush_response_get =
	     EN_server_fence_i_response_get ;
  assign icache$EN_tlb_flush = 1'b0 ;
  assign icache$EN_set_watch_tohost = 1'b0 ;
  assign icache$EN_ma_ddr4_ready = EN_ma_ddr4_ready ;
  // submodule soc_map
  assign soc_map$m_is_IO_addr_addr = 64'h0 ;
  assign soc_map$m_is_mem_addr_addr = 64'h0 ;
  assign soc_map$m_is_near_mem_IO_addr_addr = 64'h0 ;
  // remaining internal signals
  assign NOT_cfg_verbosity_read_ULE_1___d9 = cfg_verbosity > 4'd1 ;
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        cfg_verbosity <= `BSV_ASSIGNMENT_DELAY 4'd0;
	rg_state <= `BSV_ASSIGNMENT_DELAY 2'd2;
      end
    else
      begin
        if (cfg_verbosity$EN)
	  cfg_verbosity <= `BSV_ASSIGNMENT_DELAY cfg_verbosity$D_IN;
	if (rg_state$EN) rg_state <= `BSV_ASSIGNMENT_DELAY rg_state$D_IN;
      end
  end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    cfg_verbosity = 4'hA;
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
      if (WILL_FIRE_RL_rl_reset && NOT_cfg_verbosity_read_ULE_1___d9)
	begin
	  v__h1715 = $stime;
	  #0;
	end
    v__h1709 = v__h1715 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset && NOT_cfg_verbosity_read_ULE_1___d9)
	$display("%0d: Near_Mem.rl_reset", v__h1709);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_complete && NOT_cfg_verbosity_read_ULE_1___d9)
	begin
	  v__h1866 = $stime;
	  #0;
	end
    v__h1860 = v__h1866 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_reset_complete && NOT_cfg_verbosity_read_ULE_1___d9)
	$display("%0d: Near_Mem.rl_reset_complete", v__h1860);
  end
  // synopsys translate_on
endmodule