module outputs
  wire [578 : 0] l2_to_l1_server_response_first;
  wire [131 : 0] imem_ptw_server_response_get;
  wire [130 : 0] mmio_client_request_get;
  wire [68 : 0] l1_to_l2_client_request_first;
  wire [63 : 0] addr, mv_tohost_value, st_amo_val, word64;
  wire [3 : 0] exc_code;
  wire RDY_flush_server_request_put,
       RDY_flush_server_response_get,
       RDY_imem_pte_writeback_p_put,
       RDY_imem_ptw_server_request_put,
       RDY_imem_ptw_server_response_get,
       RDY_l1_to_l2_client_request_deq,
       RDY_l1_to_l2_client_request_first,
       RDY_l1_to_l2_client_request_notEmpty,
       RDY_l1_to_l2_client_response_enq,
       RDY_l1_to_l2_client_response_notFull,
       RDY_l2_to_l1_server_request_enq,
       RDY_l2_to_l1_server_request_notFull,
       RDY_l2_to_l1_server_response_deq,
       RDY_l2_to_l1_server_response_first,
       RDY_l2_to_l1_server_response_notEmpty,
       RDY_mmio_client_request_get,
       RDY_mmio_client_response_put,
       RDY_mv_tohost_value,
       RDY_set_watch_tohost,
       RDY_tlb_flush,
       exc,
       l1_to_l2_client_request_notEmpty,
       l1_to_l2_client_response_notFull,
       l2_to_l1_server_request_notFull,
       l2_to_l1_server_response_notEmpty,
       valid;
  // inlined wires
  reg [3 : 0] crg_exc_code$port0__write_1, crg_state$port0__write_1;
  reg [1 : 0] crg_mmu_cache_req_state$port0__write_1;
  reg crg_exc$port0__write_1;
  wire [207 : 0] crg_mmu_cache_req$port1__write_1,
		 crg_mmu_cache_req$port2__read;
  wire [63 : 0] crg_final_st_val$port0__write_1,
		crg_final_st_val$port1__read,
		crg_ld_val$port0__write_1,
		crg_ld_val$port1__read;
  wire [3 : 0] crg_exc_code$port1__read, crg_state$port1__read;
  wire [1 : 0] crg_mmu_cache_req_state$port1__read,
	       crg_mmu_cache_req_state$port1__write_1,
	       crg_mmu_cache_req_state$port2__read;
  wire crg_exc$EN_port0__write,
       crg_exc$port1__read,
       crg_exc_code$EN_port0__write,
       crg_final_st_val$EN_port0__write,
       crg_ld_val$EN_port0__write,
       crg_mmu_cache_req_state$EN_port0__write,
       crg_state$EN_port0__write,
       crg_valid$EN_port0__write,
       crg_valid$port0__write_1,
       crg_valid$port1__read,
       crg_valid$port2__read;
  // register crg_exc
  reg crg_exc;
  wire crg_exc$D_IN, crg_exc$EN;
  // register crg_exc_code
  reg [3 : 0] crg_exc_code;
  wire [3 : 0] crg_exc_code$D_IN;
  wire crg_exc_code$EN;
  // register crg_final_st_val
  reg [63 : 0] crg_final_st_val;
  wire [63 : 0] crg_final_st_val$D_IN;
  wire crg_final_st_val$EN;
  // register crg_ld_val
  reg [63 : 0] crg_ld_val;
  wire [63 : 0] crg_ld_val$D_IN;
  wire crg_ld_val$EN;
  // register crg_mmu_cache_req
  reg [207 : 0] crg_mmu_cache_req;
  wire [207 : 0] crg_mmu_cache_req$D_IN;
  wire crg_mmu_cache_req$EN;
  // register crg_mmu_cache_req_state
  reg [1 : 0] crg_mmu_cache_req_state;
  wire [1 : 0] crg_mmu_cache_req_state$D_IN;
  wire crg_mmu_cache_req_state$EN;
  // register crg_state
  reg [3 : 0] crg_state;
  wire [3 : 0] crg_state$D_IN;
  wire crg_state$EN;
  // register crg_valid
  reg crg_valid;
  wire crg_valid$D_IN, crg_valid$EN;
  // register rg_ptw_mem_req
  reg [63 : 0] rg_ptw_mem_req;
  wire [63 : 0] rg_ptw_mem_req$D_IN;
  wire rg_ptw_mem_req$EN;
  // register rg_state_stack_during_ptw_rd
  reg [3 : 0] rg_state_stack_during_ptw_rd;
  wire [3 : 0] rg_state_stack_during_ptw_rd$D_IN;
  wire rg_state_stack_during_ptw_rd$EN;
  // register rg_tohost_addr
  reg [63 : 0] rg_tohost_addr;
  wire [63 : 0] rg_tohost_addr$D_IN;
  wire rg_tohost_addr$EN;
  // register rg_tohost_value
  reg [63 : 0] rg_tohost_value;
  wire [63 : 0] rg_tohost_value$D_IN;
  wire rg_tohost_value$EN;
  // register rg_watch_tohost
  reg rg_watch_tohost;
  wire rg_watch_tohost$D_IN, rg_watch_tohost$EN;
  // ports of submodule cache
  reg [207 : 0] cache$mav_request_pa_req;
  reg [63 : 0] cache$ma_request_va_va, cache$mav_request_pa_pa;
  wire [578 : 0] cache$l1_to_l2_client_response_enq_x,
		 cache$l2_to_l1_server_response_first;
  wire [129 : 0] cache$mav_request_pa;
  wire [68 : 0] cache$l1_to_l2_client_request_first;
  wire [65 : 0] cache$l2_to_l1_server_request_enq_x;
  wire cache$EN_flush_server_request_put,
       cache$EN_flush_server_response_get,
       cache$EN_l1_to_l2_client_request_deq,
       cache$EN_l1_to_l2_client_response_enq,
       cache$EN_l2_to_l1_server_request_enq,
       cache$EN_l2_to_l1_server_response_deq,
       cache$EN_ma_request_va,
       cache$EN_mav_request_pa,
       cache$RDY_flush_server_request_put,
       cache$RDY_flush_server_response_get,
       cache$RDY_l1_to_l2_client_request_deq,
       cache$RDY_l1_to_l2_client_request_first,
       cache$RDY_l1_to_l2_client_response_enq,
       cache$RDY_l2_to_l1_server_request_enq,
       cache$RDY_l2_to_l1_server_response_deq,
       cache$RDY_l2_to_l1_server_response_first,
       cache$RDY_mav_request_pa,
       cache$RDY_mv_refill_ok,
       cache$flush_server_request_put,
       cache$l1_to_l2_client_request_notEmpty,
       cache$l1_to_l2_client_response_notFull,
       cache$l2_to_l1_server_request_notFull,
       cache$l2_to_l1_server_response_notEmpty,
       cache$mv_is_idle,
       cache$mv_refill_ok;
  // ports of submodule f_cache_flush_reqs
  wire f_cache_flush_reqs$CLR,
       f_cache_flush_reqs$DEQ,
       f_cache_flush_reqs$D_IN,
       f_cache_flush_reqs$D_OUT,
       f_cache_flush_reqs$EMPTY_N,
       f_cache_flush_reqs$ENQ,
       f_cache_flush_reqs$FULL_N;
  // ports of submodule f_cache_flush_rsps
  wire f_cache_flush_rsps$CLR,
       f_cache_flush_rsps$DEQ,
       f_cache_flush_rsps$EMPTY_N,
       f_cache_flush_rsps$ENQ,
       f_cache_flush_rsps$FULL_N;
  // ports of submodule f_dmem_pte_writebacks
  wire [127 : 0] f_dmem_pte_writebacks$D_IN, f_dmem_pte_writebacks$D_OUT;
  wire f_dmem_pte_writebacks$CLR,
       f_dmem_pte_writebacks$DEQ,
       f_dmem_pte_writebacks$EMPTY_N,
       f_dmem_pte_writebacks$ENQ,
       f_dmem_pte_writebacks$FULL_N;
  // ports of submodule f_imem_pte_writebacks
  wire [127 : 0] f_imem_pte_writebacks$D_IN, f_imem_pte_writebacks$D_OUT;
  wire f_imem_pte_writebacks$CLR,
       f_imem_pte_writebacks$DEQ,
       f_imem_pte_writebacks$EMPTY_N,
       f_imem_pte_writebacks$ENQ,
       f_imem_pte_writebacks$FULL_N;
  // ports of submodule f_pte_writebacks
  wire [127 : 0] f_pte_writebacks$D_IN, f_pte_writebacks$D_OUT;
  wire f_pte_writebacks$CLR,
       f_pte_writebacks$DEQ,
       f_pte_writebacks$EMPTY_N,
       f_pte_writebacks$ENQ,
       f_pte_writebacks$FULL_N;
  // ports of submodule mmio
  wire [207 : 0] mmio$req_mmu_cache_req;
  wire [130 : 0] mmio$mmio_client_request_get;
  wire [64 : 0] mmio$mmio_client_response_put;
  wire [63 : 0] mmio$result_snd_fst, mmio$result_snd_snd, mmio$start_pa;
  wire mmio$EN_mmio_client_request_get,
       mmio$EN_mmio_client_response_put,
       mmio$EN_req,
       mmio$EN_start,
       mmio$RDY_mmio_client_request_get,
       mmio$RDY_mmio_client_response_put,
       mmio$RDY_result_fst,
       mmio$RDY_result_snd_fst,
       mmio$RDY_result_snd_snd,
       mmio$result_fst;
  // ports of submodule ptw
  wire [131 : 0] ptw$dmem_server_response_get, ptw$imem_server_response_get;
  wire [127 : 0] ptw$dmem_server_request_put, ptw$imem_server_request_put;
  wire [64 : 0] ptw$mem_client_response_put;
  wire [63 : 0] ptw$mem_client_request_get;
  wire ptw$EN_dmem_server_request_put,
       ptw$EN_dmem_server_response_get,
       ptw$EN_imem_server_request_put,
       ptw$EN_imem_server_response_get,
       ptw$EN_mem_client_request_get,
       ptw$EN_mem_client_response_put,
       ptw$RDY_dmem_server_request_put,
       ptw$RDY_dmem_server_response_get,
       ptw$RDY_imem_server_request_put,
       ptw$RDY_imem_server_response_get,
       ptw$RDY_mem_client_request_get,
       ptw$RDY_mem_client_response_put;
  // ports of submodule tlb
  wire [200 : 0] tlb$mv_vm_xlate;
  wire [63 : 0] tlb$ma_insert_pte,
		tlb$ma_insert_pte_pa,
		tlb$mv_vm_xlate_satp,
		tlb$mv_vm_xlate_va;
  wire [26 : 0] tlb$ma_insert_vpn;
  wire [15 : 0] tlb$ma_insert_asid;
  wire [1 : 0] tlb$ma_insert_level, tlb$mv_vm_xlate_priv;
  wire tlb$EN_ma_flush,
       tlb$EN_ma_insert,
       tlb$mv_vm_xlate_mstatus_MXR,
       tlb$mv_vm_xlate_read_not_write,
       tlb$mv_vm_xlate_sstatus_SUM;
  // rule scheduling signals
  wire CAN_FIRE_RL_mkConnectionGetPut,
       CAN_FIRE_RL_mkConnectionGetPut_1,
       CAN_FIRE_RL_rl_CPU_ST_wait,
       CAN_FIRE_RL_rl_CPU_cache_wait,
       CAN_FIRE_RL_rl_CPU_req,
       CAN_FIRE_RL_rl_CPU_req_A,
       CAN_FIRE_RL_rl_CPU_req_B,
       CAN_FIRE_RL_rl_CPU_req_mmio_WAIT,
       CAN_FIRE_RL_rl_PTW_wait,
       CAN_FIRE_RL_rl_cache_flush_finish,
       CAN_FIRE_RL_rl_cache_flush_start,
       CAN_FIRE_RL_rl_pte_wb_cache_WAIT,
       CAN_FIRE_RL_rl_pte_wb_req_A,
       CAN_FIRE_RL_rl_pte_wb_req_B,
       CAN_FIRE_RL_rl_ptw_rd_A,
       CAN_FIRE_RL_rl_ptw_rd_B,
       CAN_FIRE_RL_rl_ptw_rd_wait,
       CAN_FIRE_flush_server_request_put,
       CAN_FIRE_flush_server_response_get,
       CAN_FIRE_imem_pte_writeback_p_put,
       CAN_FIRE_imem_ptw_server_request_put,
       CAN_FIRE_imem_ptw_server_response_get,
       CAN_FIRE_l1_to_l2_client_request_deq,
       CAN_FIRE_l1_to_l2_client_response_enq,
       CAN_FIRE_l2_to_l1_server_request_enq,
       CAN_FIRE_l2_to_l1_server_response_deq,
       CAN_FIRE_ma_req,
       CAN_FIRE_mmio_client_request_get,
       CAN_FIRE_mmio_client_response_put,
       CAN_FIRE_set_watch_tohost,
       CAN_FIRE_tlb_flush,
       WILL_FIRE_RL_mkConnectionGetPut,
       WILL_FIRE_RL_mkConnectionGetPut_1,
       WILL_FIRE_RL_rl_CPU_ST_wait,
       WILL_FIRE_RL_rl_CPU_cache_wait,
       WILL_FIRE_RL_rl_CPU_req,
       WILL_FIRE_RL_rl_CPU_req_A,
       WILL_FIRE_RL_rl_CPU_req_B,
       WILL_FIRE_RL_rl_CPU_req_mmio_WAIT,
       WILL_FIRE_RL_rl_PTW_wait,
       WILL_FIRE_RL_rl_cache_flush_finish,
       WILL_FIRE_RL_rl_cache_flush_start,
       WILL_FIRE_RL_rl_pte_wb_cache_WAIT,
       WILL_FIRE_RL_rl_pte_wb_req_A,
       WILL_FIRE_RL_rl_pte_wb_req_B,
       WILL_FIRE_RL_rl_ptw_rd_A,
       WILL_FIRE_RL_rl_ptw_rd_B,
       WILL_FIRE_RL_rl_ptw_rd_wait,
       WILL_FIRE_flush_server_request_put,
       WILL_FIRE_flush_server_response_get,
       WILL_FIRE_imem_pte_writeback_p_put,
       WILL_FIRE_imem_ptw_server_request_put,
       WILL_FIRE_imem_ptw_server_response_get,
       WILL_FIRE_l1_to_l2_client_request_deq,
       WILL_FIRE_l1_to_l2_client_response_enq,
       WILL_FIRE_l2_to_l1_server_request_enq,
       WILL_FIRE_l2_to_l1_server_response_deq,
       WILL_FIRE_ma_req,
       WILL_FIRE_mmio_client_request_get,
       WILL_FIRE_mmio_client_response_put,
       WILL_FIRE_set_watch_tohost,
       WILL_FIRE_tlb_flush;
  // inputs to muxes for submodule ports
  wire [207 : 0] MUX_cache$mav_request_pa_1__VAL_2,
		 MUX_cache$mav_request_pa_1__VAL_3;
  wire [64 : 0] MUX_ptw$mem_client_response_put_1__VAL_1;
  wire [3 : 0] MUX_crg_exc_code$port0__write_1__VAL_1,
	       MUX_crg_exc_code$port0__write_1__VAL_3,
	       MUX_crg_state$port0__write_1__VAL_1,
	       MUX_crg_state$port0__write_1__VAL_2,
	       MUX_crg_state$port0__write_1__VAL_3,
	       MUX_crg_state$port0__write_1__VAL_4;
  wire [1 : 0] MUX_crg_mmu_cache_req_state$port0__write_1__VAL_3;
  wire MUX_cache$ma_request_va_1__SEL_1,
       MUX_cache$mav_request_pa_1__SEL_1,
       MUX_crg_exc$port0__write_1__SEL_1,
       MUX_crg_exc$port0__write_1__SEL_2,
       MUX_crg_exc$port0__write_1__SEL_3,
       MUX_crg_exc$port0__write_1__VAL_1,
       MUX_crg_exc_code$port0__write_1__SEL_1,
       MUX_crg_final_st_val$port0__write_1__SEL_1,
       MUX_crg_mmu_cache_req_state$port0__write_1__SEL_1,
       MUX_crg_mmu_cache_req_state$port0__write_1__SEL_4,
       MUX_crg_state$port0__write_1__SEL_1,
       MUX_crg_state$port0__write_1__SEL_5,
       MUX_crg_state$port0__write_1__SEL_8,
       MUX_crg_valid$port0__write_1__SEL_1,
       MUX_crg_valid$port0__write_1__VAL_1,
       MUX_ptw$mem_client_response_put_1__SEL_1,
       MUX_tlb$ma_insert_1__SEL_1,
       MUX_tlb$ma_insert_1__SEL_2;
  // declarations used by system tasks
  // synopsys translate_off
  reg [31 : 0] v__h8559;
  reg [31 : 0] v__h6532;
  reg [31 : 0] v__h7557;
  reg [31 : 0] v__h2123;
  reg [31 : 0] v__h2117;
  reg [31 : 0] v__h6526;
  reg [31 : 0] v__h7551;
  reg [31 : 0] v__h8553;
  // synopsys translate_on
  // remaining internal signals
  wire [3 : 0] IF_NOT_tlb_mv_vm_xlate_crg_mmu_cache_req_port0_ETC___d212,
	       x1__h3434,
	       x1__h4806,
	       x1__h5626;
  wire IF_tlb_mv_vm_xlate_crg_mmu_cache_req_port0__re_ETC___d163,
       NOT_crg_mmu_cache_req_port0__read__05_BITS_204_ETC___d128,
       NOT_tlb_mv_vm_xlate_crg_mmu_cache_req_port0__r_ETC___d185,
       NOT_tlb_mv_vm_xlate_crg_mmu_cache_req_port0__r_ETC___d190,
       NOT_tlb_mv_vm_xlate_crg_mmu_cache_req_port0__r_ETC___d230,
       NOT_tlb_mv_vm_xlate_crg_mmu_cache_req_port0__r_ETC___d238,
       NOT_tlb_mv_vm_xlate_crg_mmu_cache_req_port0__r_ETC___d245,
       cache_mav_request_pa_68_BITS_129_TO_128_69_EQ__ETC___d175,
       cache_mav_request_pa_68_BITS_129_TO_128_69_EQ__ETC___d207,
       crg_mmu_cache_req_port0__read__05_BITS_204_TO__ETC___d204,
       tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d150,
       tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d151,
       tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d154,
       tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d155,
       tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d160;
  // action method ma_req
  assign CAN_FIRE_ma_req = 1'd1 ;
  assign WILL_FIRE_ma_req = EN_ma_req ;
  // value method valid
  assign valid = crg_valid ;
  // value method addr
  assign addr = crg_mmu_cache_req[202:139] ;
  // value method word64
  assign word64 = crg_ld_val ;
  // value method st_amo_val
  assign st_amo_val = crg_final_st_val ;
  // value method exc
  assign exc = crg_exc ;
  // value method exc_code
  assign exc_code = crg_exc_code ;
  // action method flush_server_request_put
  assign RDY_flush_server_request_put = f_cache_flush_reqs$FULL_N ;
  assign CAN_FIRE_flush_server_request_put = f_cache_flush_reqs$FULL_N ;
  assign WILL_FIRE_flush_server_request_put = EN_flush_server_request_put ;
  // action method flush_server_response_get
  assign RDY_flush_server_response_get = f_cache_flush_rsps$EMPTY_N ;
  assign CAN_FIRE_flush_server_response_get = f_cache_flush_rsps$EMPTY_N ;
  assign WILL_FIRE_flush_server_response_get = EN_flush_server_response_get ;
  // action method tlb_flush
  assign RDY_tlb_flush = 1'd1 ;
  assign CAN_FIRE_tlb_flush = 1'd1 ;
  assign WILL_FIRE_tlb_flush = EN_tlb_flush ;
  // action method imem_ptw_server_request_put
  assign RDY_imem_ptw_server_request_put = ptw$RDY_imem_server_request_put ;
  assign CAN_FIRE_imem_ptw_server_request_put =
	     ptw$RDY_imem_server_request_put ;
  assign WILL_FIRE_imem_ptw_server_request_put =
	     EN_imem_ptw_server_request_put ;
  // actionvalue method imem_ptw_server_response_get
  assign imem_ptw_server_response_get = ptw$imem_server_response_get ;
  assign RDY_imem_ptw_server_response_get = ptw$RDY_imem_server_response_get ;
  assign CAN_FIRE_imem_ptw_server_response_get =
	     ptw$RDY_imem_server_response_get ;
  assign WILL_FIRE_imem_ptw_server_response_get =
	     EN_imem_ptw_server_response_get ;
  // action method imem_pte_writeback_p_put
  assign RDY_imem_pte_writeback_p_put = f_imem_pte_writebacks$FULL_N ;
  assign CAN_FIRE_imem_pte_writeback_p_put = f_imem_pte_writebacks$FULL_N ;
  assign WILL_FIRE_imem_pte_writeback_p_put = EN_imem_pte_writeback_p_put ;
  // value method l1_to_l2_client_request_first
  assign l1_to_l2_client_request_first = cache$l1_to_l2_client_request_first ;
  assign RDY_l1_to_l2_client_request_first =
	     cache$RDY_l1_to_l2_client_request_first ;
  // action method l1_to_l2_client_request_deq
  assign RDY_l1_to_l2_client_request_deq =
	     cache$RDY_l1_to_l2_client_request_deq ;
  assign CAN_FIRE_l1_to_l2_client_request_deq =
	     cache$RDY_l1_to_l2_client_request_deq ;
  assign WILL_FIRE_l1_to_l2_client_request_deq =
	     EN_l1_to_l2_client_request_deq ;
  // value method l1_to_l2_client_request_notEmpty
  assign l1_to_l2_client_request_notEmpty =
	     cache$l1_to_l2_client_request_notEmpty ;
  assign RDY_l1_to_l2_client_request_notEmpty = 1'd1 ;
  // action method l1_to_l2_client_response_enq
  assign RDY_l1_to_l2_client_response_enq =
	     cache$RDY_l1_to_l2_client_response_enq ;
  assign CAN_FIRE_l1_to_l2_client_response_enq =
	     cache$RDY_l1_to_l2_client_response_enq ;
  assign WILL_FIRE_l1_to_l2_client_response_enq =
	     EN_l1_to_l2_client_response_enq ;
  // value method l1_to_l2_client_response_notFull
  assign l1_to_l2_client_response_notFull =
	     cache$l1_to_l2_client_response_notFull ;
  assign RDY_l1_to_l2_client_response_notFull = 1'd1 ;
  // action method l2_to_l1_server_request_enq
  assign RDY_l2_to_l1_server_request_enq =
	     cache$RDY_l2_to_l1_server_request_enq ;
  assign CAN_FIRE_l2_to_l1_server_request_enq =
	     cache$RDY_l2_to_l1_server_request_enq ;
  assign WILL_FIRE_l2_to_l1_server_request_enq =
	     EN_l2_to_l1_server_request_enq ;
  // value method l2_to_l1_server_request_notFull
  assign l2_to_l1_server_request_notFull =
	     cache$l2_to_l1_server_request_notFull ;
  assign RDY_l2_to_l1_server_request_notFull = 1'd1 ;
  // value method l2_to_l1_server_response_first
  assign l2_to_l1_server_response_first =
	     cache$l2_to_l1_server_response_first ;
  assign RDY_l2_to_l1_server_response_first =
	     cache$RDY_l2_to_l1_server_response_first ;
  // action method l2_to_l1_server_response_deq
  assign RDY_l2_to_l1_server_response_deq =
	     cache$RDY_l2_to_l1_server_response_deq ;
  assign CAN_FIRE_l2_to_l1_server_response_deq =
	     cache$RDY_l2_to_l1_server_response_deq ;
  assign WILL_FIRE_l2_to_l1_server_response_deq =
	     EN_l2_to_l1_server_response_deq ;
  // value method l2_to_l1_server_response_notEmpty
  assign l2_to_l1_server_response_notEmpty =
	     cache$l2_to_l1_server_response_notEmpty ;
  assign RDY_l2_to_l1_server_response_notEmpty = 1'd1 ;
  // actionvalue method mmio_client_request_get
  assign mmio_client_request_get = mmio$mmio_client_request_get ;
  assign RDY_mmio_client_request_get = mmio$RDY_mmio_client_request_get ;
  assign CAN_FIRE_mmio_client_request_get = mmio$RDY_mmio_client_request_get ;
  assign WILL_FIRE_mmio_client_request_get = EN_mmio_client_request_get ;
  // action method mmio_client_response_put
  assign RDY_mmio_client_response_put = mmio$RDY_mmio_client_response_put ;
  assign CAN_FIRE_mmio_client_response_put =
	     mmio$RDY_mmio_client_response_put ;
  assign WILL_FIRE_mmio_client_response_put = EN_mmio_client_response_put ;
  // action method set_watch_tohost
  assign RDY_set_watch_tohost = 1'd1 ;
  assign CAN_FIRE_set_watch_tohost = 1'd1 ;
  assign WILL_FIRE_set_watch_tohost = EN_set_watch_tohost ;
  // value method mv_tohost_value
  assign mv_tohost_value = rg_tohost_value ;
  assign RDY_mv_tohost_value = 1'd1 ;
  // submodule cache
  mkCache #(.dcache_not_icache(1'd1), .verbosity(3'd0)) cache(.CLK(CLK),
							      .RST_N(RST_N),
							      .flush_server_request_put(cache$flush_server_request_put),
							      .l1_to_l2_client_response_enq_x(cache$l1_to_l2_client_response_enq_x),
							      .l2_to_l1_server_request_enq_x(cache$l2_to_l1_server_request_enq_x),
							      .ma_request_va_va(cache$ma_request_va_va),
							      .mav_request_pa_pa(cache$mav_request_pa_pa),
							      .mav_request_pa_req(cache$mav_request_pa_req),
							      .EN_ma_request_va(cache$EN_ma_request_va),
							      .EN_mav_request_pa(cache$EN_mav_request_pa),
							      .EN_flush_server_request_put(cache$EN_flush_server_request_put),
							      .EN_flush_server_response_get(cache$EN_flush_server_response_get),
							      .EN_l1_to_l2_client_request_deq(cache$EN_l1_to_l2_client_request_deq),
							      .EN_l1_to_l2_client_response_enq(cache$EN_l1_to_l2_client_response_enq),
							      .EN_l2_to_l1_server_request_enq(cache$EN_l2_to_l1_server_request_enq),
							      .EN_l2_to_l1_server_response_deq(cache$EN_l2_to_l1_server_response_deq),
							      .mav_request_pa(cache$mav_request_pa),
							      .RDY_mav_request_pa(cache$RDY_mav_request_pa),
							      .mv_is_idle(cache$mv_is_idle),
							      .mv_refill_ok(cache$mv_refill_ok),
							      .RDY_mv_refill_ok(cache$RDY_mv_refill_ok),
							      .RDY_flush_server_request_put(cache$RDY_flush_server_request_put),
							      .RDY_flush_server_response_get(cache$RDY_flush_server_response_get),
							      .l1_to_l2_client_request_first(cache$l1_to_l2_client_request_first),
							      .RDY_l1_to_l2_client_request_first(cache$RDY_l1_to_l2_client_request_first),
							      .RDY_l1_to_l2_client_request_deq(cache$RDY_l1_to_l2_client_request_deq),
							      .l1_to_l2_client_request_notEmpty(cache$l1_to_l2_client_request_notEmpty),
							      .RDY_l1_to_l2_client_request_notEmpty(),
							      .RDY_l1_to_l2_client_response_enq(cache$RDY_l1_to_l2_client_response_enq),
							      .l1_to_l2_client_response_notFull(cache$l1_to_l2_client_response_notFull),
							      .RDY_l1_to_l2_client_response_notFull(),
							      .RDY_l2_to_l1_server_request_enq(cache$RDY_l2_to_l1_server_request_enq),
							      .l2_to_l1_server_request_notFull(cache$l2_to_l1_server_request_notFull),
							      .RDY_l2_to_l1_server_request_notFull(),
							      .l2_to_l1_server_response_first(cache$l2_to_l1_server_response_first),
							      .RDY_l2_to_l1_server_response_first(cache$RDY_l2_to_l1_server_response_first),
							      .RDY_l2_to_l1_server_response_deq(cache$RDY_l2_to_l1_server_response_deq),
							      .l2_to_l1_server_response_notEmpty(cache$l2_to_l1_server_response_notEmpty),
							      .RDY_l2_to_l1_server_response_notEmpty());
  // submodule f_cache_flush_reqs
  FIFO2 #(.width(32'd1), .guarded(1'd1)) f_cache_flush_reqs(.RST(RST_N),
							    .CLK(CLK),
							    .D_IN(f_cache_flush_reqs$D_IN),
							    .ENQ(f_cache_flush_reqs$ENQ),
							    .DEQ(f_cache_flush_reqs$DEQ),
							    .CLR(f_cache_flush_reqs$CLR),
							    .D_OUT(f_cache_flush_reqs$D_OUT),
							    .FULL_N(f_cache_flush_reqs$FULL_N),
							    .EMPTY_N(f_cache_flush_reqs$EMPTY_N));
  // submodule f_cache_flush_rsps
  FIFO20 #(.guarded(1'd1)) f_cache_flush_rsps(.RST(RST_N),
					      .CLK(CLK),
					      .ENQ(f_cache_flush_rsps$ENQ),
					      .DEQ(f_cache_flush_rsps$DEQ),
					      .CLR(f_cache_flush_rsps$CLR),
					      .FULL_N(f_cache_flush_rsps$FULL_N),
					      .EMPTY_N(f_cache_flush_rsps$EMPTY_N));
  // submodule f_dmem_pte_writebacks
  FIFO2 #(.width(32'd128), .guarded(1'd1)) f_dmem_pte_writebacks(.RST(RST_N),
								 .CLK(CLK),
								 .D_IN(f_dmem_pte_writebacks$D_IN),
								 .ENQ(f_dmem_pte_writebacks$ENQ),
								 .DEQ(f_dmem_pte_writebacks$DEQ),
								 .CLR(f_dmem_pte_writebacks$CLR),
								 .D_OUT(f_dmem_pte_writebacks$D_OUT),
								 .FULL_N(f_dmem_pte_writebacks$FULL_N),
								 .EMPTY_N(f_dmem_pte_writebacks$EMPTY_N));
  // submodule f_imem_pte_writebacks
  FIFO2 #(.width(32'd128), .guarded(1'd1)) f_imem_pte_writebacks(.RST(RST_N),
								 .CLK(CLK),
								 .D_IN(f_imem_pte_writebacks$D_IN),
								 .ENQ(f_imem_pte_writebacks$ENQ),
								 .DEQ(f_imem_pte_writebacks$DEQ),
								 .CLR(f_imem_pte_writebacks$CLR),
								 .D_OUT(f_imem_pte_writebacks$D_OUT),
								 .FULL_N(f_imem_pte_writebacks$FULL_N),
								 .EMPTY_N(f_imem_pte_writebacks$EMPTY_N));
  // submodule f_pte_writebacks
  FIFO2 #(.width(32'd128), .guarded(1'd1)) f_pte_writebacks(.RST(RST_N),
							    .CLK(CLK),
							    .D_IN(f_pte_writebacks$D_IN),
							    .ENQ(f_pte_writebacks$ENQ),
							    .DEQ(f_pte_writebacks$DEQ),
							    .CLR(f_pte_writebacks$CLR),
							    .D_OUT(f_pte_writebacks$D_OUT),
							    .FULL_N(f_pte_writebacks$FULL_N),
							    .EMPTY_N(f_pte_writebacks$EMPTY_N));
  // submodule mmio
  mkMMIO #(.verbosity(3'd0)) mmio(.CLK(CLK),
				  .RST_N(RST_N),
				  .mmio_client_response_put(mmio$mmio_client_response_put),
				  .req_mmu_cache_req(mmio$req_mmu_cache_req),
				  .start_pa(mmio$start_pa),
				  .EN_req(mmio$EN_req),
				  .EN_start(mmio$EN_start),
				  .EN_mmio_client_request_get(mmio$EN_mmio_client_request_get),
				  .EN_mmio_client_response_put(mmio$EN_mmio_client_response_put),
				  .RDY_req(),
				  .RDY_start(),
				  .result_fst(mmio$result_fst),
				  .RDY_result_fst(mmio$RDY_result_fst),
				  .result_snd_fst(mmio$result_snd_fst),
				  .RDY_result_snd_fst(mmio$RDY_result_snd_fst),
				  .result_snd_snd(mmio$result_snd_snd),
				  .RDY_result_snd_snd(mmio$RDY_result_snd_snd),
				  .mmio_client_request_get(mmio$mmio_client_request_get),
				  .RDY_mmio_client_request_get(mmio$RDY_mmio_client_request_get),
				  .RDY_mmio_client_response_put(mmio$RDY_mmio_client_response_put));
  // submodule ptw
  mkPTW #(.verbosity(3'd0)) ptw(.CLK(CLK),
				.RST_N(RST_N),
				.dmem_server_request_put(ptw$dmem_server_request_put),
				.imem_server_request_put(ptw$imem_server_request_put),
				.mem_client_response_put(ptw$mem_client_response_put),
				.EN_imem_server_request_put(ptw$EN_imem_server_request_put),
				.EN_imem_server_response_get(ptw$EN_imem_server_response_get),
				.EN_dmem_server_request_put(ptw$EN_dmem_server_request_put),
				.EN_dmem_server_response_get(ptw$EN_dmem_server_response_get),
				.EN_mem_client_request_get(ptw$EN_mem_client_request_get),
				.EN_mem_client_response_put(ptw$EN_mem_client_response_put),
				.RDY_imem_server_request_put(ptw$RDY_imem_server_request_put),
				.imem_server_response_get(ptw$imem_server_response_get),
				.RDY_imem_server_response_get(ptw$RDY_imem_server_response_get),
				.RDY_dmem_server_request_put(ptw$RDY_dmem_server_request_put),
				.dmem_server_response_get(ptw$dmem_server_response_get),
				.RDY_dmem_server_response_get(ptw$RDY_dmem_server_response_get),
				.mem_client_request_get(ptw$mem_client_request_get),
				.RDY_mem_client_request_get(ptw$RDY_mem_client_request_get),
				.RDY_mem_client_response_put(ptw$RDY_mem_client_response_put));
  // submodule tlb
  mkTLB #(.dmem_not_imem(1'd1), .verbosity(3'd0)) tlb(.CLK(CLK),
						      .RST_N(RST_N),
						      .ma_insert_asid(tlb$ma_insert_asid),
						      .ma_insert_level(tlb$ma_insert_level),
						      .ma_insert_pte(tlb$ma_insert_pte),
						      .ma_insert_pte_pa(tlb$ma_insert_pte_pa),
						      .ma_insert_vpn(tlb$ma_insert_vpn),
						      .mv_vm_xlate_mstatus_MXR(tlb$mv_vm_xlate_mstatus_MXR),
						      .mv_vm_xlate_priv(tlb$mv_vm_xlate_priv),
						      .mv_vm_xlate_read_not_write(tlb$mv_vm_xlate_read_not_write),
						      .mv_vm_xlate_satp(tlb$mv_vm_xlate_satp),
						      .mv_vm_xlate_sstatus_SUM(tlb$mv_vm_xlate_sstatus_SUM),
						      .mv_vm_xlate_va(tlb$mv_vm_xlate_va),
						      .EN_ma_insert(tlb$EN_ma_insert),
						      .EN_ma_flush(tlb$EN_ma_flush),
						      .mv_vm_xlate(tlb$mv_vm_xlate),
						      .RDY_mv_vm_xlate(),
						      .RDY_ma_insert(),
						      .RDY_ma_flush());
  // rule RL_rl_CPU_req_A
  assign CAN_FIRE_RL_rl_CPU_req_A =
	     crg_state == 4'd0 && crg_mmu_cache_req_state == 2'd1 &&
	     cache$mv_is_idle ;
  assign WILL_FIRE_RL_rl_CPU_req_A = CAN_FIRE_RL_rl_CPU_req_A && !EN_ma_req ;
  // rule RL_rl_CPU_req_B
  assign CAN_FIRE_RL_rl_CPU_req_B =
	     (NOT_crg_mmu_cache_req_port0__read__05_BITS_204_ETC___d128 ||
	      IF_tlb_mv_vm_xlate_crg_mmu_cache_req_port0__re_ETC___d163) &&
	     crg_state == 4'd0 &&
	     crg_mmu_cache_req_state == 2'd2 ;
  assign WILL_FIRE_RL_rl_CPU_req_B = CAN_FIRE_RL_rl_CPU_req_B && !EN_ma_req ;
  // rule RL_rl_CPU_ST_wait
  assign CAN_FIRE_RL_rl_CPU_ST_wait = crg_state == 4'd1 ;
  assign WILL_FIRE_RL_rl_CPU_ST_wait = CAN_FIRE_RL_rl_CPU_ST_wait ;
  // rule RL_rl_CPU_cache_wait
  assign CAN_FIRE_RL_rl_CPU_cache_wait =
	     cache$RDY_mv_refill_ok && crg_state == 4'd2 ;
  assign WILL_FIRE_RL_rl_CPU_cache_wait = CAN_FIRE_RL_rl_CPU_cache_wait ;
  // rule RL_rl_CPU_req_mmio_WAIT
  assign CAN_FIRE_RL_rl_CPU_req_mmio_WAIT =
	     mmio$RDY_result_snd_snd && mmio$RDY_result_snd_fst &&
	     mmio$RDY_result_fst &&
	     crg_state == 4'd3 ;
  assign WILL_FIRE_RL_rl_CPU_req_mmio_WAIT =
	     CAN_FIRE_RL_rl_CPU_req_mmio_WAIT ;
  // rule RL_rl_PTW_wait
  assign CAN_FIRE_RL_rl_PTW_wait =
	     ptw$RDY_dmem_server_response_get && crg_state == 4'd5 ;
  assign WILL_FIRE_RL_rl_PTW_wait = CAN_FIRE_RL_rl_PTW_wait ;
  // rule RL_rl_cache_flush_start
  assign CAN_FIRE_RL_rl_cache_flush_start =
	     cache$RDY_flush_server_request_put &&
	     f_cache_flush_reqs$EMPTY_N &&
	     crg_state == 4'd0 &&
	     crg_mmu_cache_req_state == 2'd0 ;
  assign WILL_FIRE_RL_rl_cache_flush_start =
	     CAN_FIRE_RL_rl_cache_flush_start ;
  // rule RL_rl_cache_flush_finish
  assign CAN_FIRE_RL_rl_cache_flush_finish =
	     cache$RDY_flush_server_response_get &&
	     f_cache_flush_reqs$EMPTY_N &&
	     f_cache_flush_rsps$FULL_N &&
	     crg_state == 4'd4 ;
  assign WILL_FIRE_RL_rl_cache_flush_finish =
	     CAN_FIRE_RL_rl_cache_flush_finish ;
  // rule RL_rl_ptw_rd_A
  assign CAN_FIRE_RL_rl_ptw_rd_A =
	     ptw$RDY_mem_client_request_get && cache$mv_is_idle &&
	     (crg_state == 4'd5 ||
	      crg_state == 4'd0 && crg_mmu_cache_req_state == 2'd0) ;
  assign WILL_FIRE_RL_rl_ptw_rd_A =
	     CAN_FIRE_RL_rl_ptw_rd_A && !WILL_FIRE_RL_rl_cache_flush_start &&
	     !WILL_FIRE_RL_rl_PTW_wait &&
	     !EN_ma_req ;
  // rule RL_rl_ptw_rd_B
  assign CAN_FIRE_RL_rl_ptw_rd_B =
	     cache$RDY_mav_request_pa && ptw$RDY_mem_client_response_put &&
	     crg_state == 4'd6 ;
  assign WILL_FIRE_RL_rl_ptw_rd_B = CAN_FIRE_RL_rl_ptw_rd_B && !EN_ma_req ;
  // rule RL_rl_ptw_rd_wait
  assign CAN_FIRE_RL_rl_ptw_rd_wait =
	     cache$RDY_mv_refill_ok &&
	     (cache$mv_refill_ok || ptw$RDY_mem_client_response_put) &&
	     crg_state == 4'd7 ;
  assign WILL_FIRE_RL_rl_ptw_rd_wait = CAN_FIRE_RL_rl_ptw_rd_wait ;
  // rule RL_mkConnectionGetPut
  assign CAN_FIRE_RL_mkConnectionGetPut =
	     f_imem_pte_writebacks$EMPTY_N && f_pte_writebacks$FULL_N ;
  assign WILL_FIRE_RL_mkConnectionGetPut = CAN_FIRE_RL_mkConnectionGetPut ;
  // rule RL_mkConnectionGetPut_1
  assign CAN_FIRE_RL_mkConnectionGetPut_1 =
	     f_pte_writebacks$FULL_N && f_dmem_pte_writebacks$EMPTY_N ;
  assign WILL_FIRE_RL_mkConnectionGetPut_1 =
	     CAN_FIRE_RL_mkConnectionGetPut_1 &&
	     !WILL_FIRE_RL_mkConnectionGetPut ;
  // rule RL_rl_pte_wb_req_A
  assign CAN_FIRE_RL_rl_pte_wb_req_A =
	     f_pte_writebacks$EMPTY_N && crg_state == 4'd0 &&
	     cache$mv_is_idle &&
	     crg_mmu_cache_req_state == 2'd0 ;
  assign WILL_FIRE_RL_rl_pte_wb_req_A =
	     CAN_FIRE_RL_rl_pte_wb_req_A && !WILL_FIRE_RL_rl_ptw_rd_A &&
	     !WILL_FIRE_RL_rl_cache_flush_start &&
	     !EN_ma_req ;
  // rule RL_rl_pte_wb_req_B
  assign CAN_FIRE_RL_rl_pte_wb_req_B =
	     cache$RDY_mav_request_pa && f_pte_writebacks$EMPTY_N &&
	     crg_state == 4'd8 ;
  assign WILL_FIRE_RL_rl_pte_wb_req_B =
	     CAN_FIRE_RL_rl_pte_wb_req_B && !EN_ma_req ;
  // rule RL_rl_pte_wb_cache_WAIT
  assign CAN_FIRE_RL_rl_pte_wb_cache_WAIT =
	     cache$RDY_mv_refill_ok &&
	     (cache$mv_refill_ok || f_pte_writebacks$EMPTY_N) &&
	     crg_state == 4'd9 ;
  assign WILL_FIRE_RL_rl_pte_wb_cache_WAIT =
	     CAN_FIRE_RL_rl_pte_wb_cache_WAIT ;
  // rule RL_rl_CPU_req
  assign CAN_FIRE_RL_rl_CPU_req = EN_ma_req ;
  assign WILL_FIRE_RL_rl_CPU_req = EN_ma_req ;
  // inputs to muxes for submodule ports
  assign MUX_cache$ma_request_va_1__SEL_1 =
	     EN_ma_req && crg_state$port1__read == 4'd0 && cache$mv_is_idle ;
  assign MUX_cache$mav_request_pa_1__SEL_1 =
	     WILL_FIRE_RL_rl_CPU_req_B &&
	     crg_mmu_cache_req_port0__read__05_BITS_204_TO__ETC___d204 &&
	     tlb$mv_vm_xlate[200:199] != 2'd1 &&
	     NOT_tlb_mv_vm_xlate_crg_mmu_cache_req_port0__r_ETC___d230 ;
  assign MUX_crg_exc$port0__write_1__SEL_1 =
	     WILL_FIRE_RL_rl_CPU_req_B &&
	     (NOT_crg_mmu_cache_req_port0__read__05_BITS_204_ETC___d128 ||
	      tlb$mv_vm_xlate[200:199] != 2'd1 &&
	      (tlb$mv_vm_xlate[200:199] == 2'd2 ||
	       NOT_tlb_mv_vm_xlate_crg_mmu_cache_req_port0__r_ETC___d190)) ;
  assign MUX_crg_exc$port0__write_1__SEL_2 =
	     WILL_FIRE_RL_rl_CPU_cache_wait && !cache$mv_refill_ok ;
  assign MUX_crg_exc$port0__write_1__SEL_3 =
	     WILL_FIRE_RL_rl_PTW_wait &&
	     ptw$dmem_server_response_get[131:130] != 2'd0 ;
  assign MUX_crg_exc_code$port0__write_1__SEL_1 =
	     WILL_FIRE_RL_rl_CPU_req_B &&
	     (NOT_crg_mmu_cache_req_port0__read__05_BITS_204_ETC___d128 ||
	      tlb$mv_vm_xlate[200:199] == 2'd2) ;
  assign MUX_crg_final_st_val$port0__write_1__SEL_1 =
	     WILL_FIRE_RL_rl_CPU_req_B &&
	     crg_mmu_cache_req_port0__read__05_BITS_204_TO__ETC___d204 &&
	     tlb$mv_vm_xlate[200:199] != 2'd1 &&
	     tlb$mv_vm_xlate[200:199] != 2'd2 &&
	     NOT_tlb_mv_vm_xlate_crg_mmu_cache_req_port0__r_ETC___d190 ;
  assign MUX_crg_mmu_cache_req_state$port0__write_1__SEL_1 =
	     WILL_FIRE_RL_rl_CPU_req_B &&
	     (NOT_crg_mmu_cache_req_port0__read__05_BITS_204_ETC___d128 ||
	      tlb$mv_vm_xlate[200:199] != 2'd1 &&
	      (tlb$mv_vm_xlate[200:199] == 2'd2 ||
	       NOT_tlb_mv_vm_xlate_crg_mmu_cache_req_port0__r_ETC___d185)) ;
  assign MUX_crg_mmu_cache_req_state$port0__write_1__SEL_4 =
	     WILL_FIRE_RL_rl_CPU_req_mmio_WAIT ||
	     WILL_FIRE_RL_rl_CPU_ST_wait ;
  assign MUX_crg_state$port0__write_1__SEL_1 =
	     WILL_FIRE_RL_rl_CPU_req_B &&
	     crg_mmu_cache_req_port0__read__05_BITS_204_TO__ETC___d204 &&
	     (tlb$mv_vm_xlate[200:199] == 2'd1 ||
	      tlb$mv_vm_xlate[200:199] != 2'd2 &&
	      cache_mav_request_pa_68_BITS_129_TO_128_69_EQ__ETC___d207) ;
  assign MUX_crg_state$port0__write_1__SEL_5 =
	     WILL_FIRE_RL_rl_cache_flush_finish || WILL_FIRE_RL_rl_PTW_wait ||
	     WILL_FIRE_RL_rl_CPU_req_mmio_WAIT ||
	     WILL_FIRE_RL_rl_CPU_cache_wait ||
	     WILL_FIRE_RL_rl_CPU_ST_wait ;
  assign MUX_crg_state$port0__write_1__SEL_8 =
	     WILL_FIRE_RL_rl_pte_wb_cache_WAIT ||
	     WILL_FIRE_RL_rl_pte_wb_req_A ;
  assign MUX_crg_valid$port0__write_1__SEL_1 =
	     WILL_FIRE_RL_rl_CPU_req_B &&
	     (NOT_crg_mmu_cache_req_port0__read__05_BITS_204_ETC___d128 ||
	      tlb$mv_vm_xlate[200:199] == 2'd1 ||
	      tlb$mv_vm_xlate[200:199] == 2'd2 ||
	      cache_mav_request_pa_68_BITS_129_TO_128_69_EQ__ETC___d175) ;
  assign MUX_ptw$mem_client_response_put_1__SEL_1 =
	     WILL_FIRE_RL_rl_ptw_rd_B &&
	     cache$mav_request_pa[129:128] == 2'd1 ;
  assign MUX_tlb$ma_insert_1__SEL_1 =
	     WILL_FIRE_RL_rl_PTW_wait &&
	     ptw$dmem_server_response_get[131:130] == 2'd0 ;
  assign MUX_tlb$ma_insert_1__SEL_2 =
	     WILL_FIRE_RL_rl_CPU_req_B &&
	     crg_mmu_cache_req_port0__read__05_BITS_204_TO__ETC___d204 &&
	     tlb$mv_vm_xlate[200:199] != 2'd1 &&
	     tlb$mv_vm_xlate[200:199] != 2'd2 &&
	     tlb$mv_vm_xlate[130] ;
  assign MUX_cache$mav_request_pa_1__VAL_2 =
	     { 5'd3,
	       rg_ptw_mem_req,
	       139'h555555555555555500C0000000000000000 } ;
  assign MUX_cache$mav_request_pa_1__VAL_3 =
	     { 5'd11, f_pte_writebacks$D_OUT, 75'h00C0000000000000000 } ;
  assign MUX_crg_exc$port0__write_1__VAL_1 =
	     NOT_crg_mmu_cache_req_port0__read__05_BITS_204_ETC___d128 ||
	     tlb$mv_vm_xlate[200:199] == 2'd2 ;
  assign MUX_crg_exc_code$port0__write_1__VAL_1 =
	     NOT_crg_mmu_cache_req_port0__read__05_BITS_204_ETC___d128 ?
	       x1__h3434 :
	       tlb$mv_vm_xlate[134:131] ;
  assign MUX_crg_exc_code$port0__write_1__VAL_3 =
	     (ptw$dmem_server_response_get[131:130] == 2'd1) ?
	       x1__h4806 :
	       x1__h5626 ;
  assign MUX_crg_mmu_cache_req_state$port0__write_1__VAL_3 =
	     (ptw$dmem_server_response_get[131:130] == 2'd0) ? 2'd1 : 2'd0 ;
  assign MUX_crg_state$port0__write_1__VAL_1 =
	     (tlb$mv_vm_xlate[200:199] == 2'd1) ?
	       4'd5 :
	       IF_NOT_tlb_mv_vm_xlate_crg_mmu_cache_req_port0_ETC___d212 ;
  assign MUX_crg_state$port0__write_1__VAL_2 =
	     (cache$mav_request_pa[129:128] == 2'd1) ?
	       rg_state_stack_during_ptw_rd :
	       4'd7 ;
  assign MUX_crg_state$port0__write_1__VAL_3 =
	     cache$mv_refill_ok ? 4'd6 : 4'd0 ;
  assign MUX_crg_state$port0__write_1__VAL_4 =
	     (cache$mav_request_pa[129:128] == 2'd2) ? 4'd0 : 4'd9 ;
  assign MUX_crg_valid$port0__write_1__VAL_1 =
	     NOT_crg_mmu_cache_req_port0__read__05_BITS_204_ETC___d128 ||
	     tlb$mv_vm_xlate[200:199] != 2'd1 &&
	     (tlb$mv_vm_xlate[200:199] == 2'd2 ||
	      NOT_tlb_mv_vm_xlate_crg_mmu_cache_req_port0__r_ETC___d185) ;
  assign MUX_ptw$mem_client_response_put_1__VAL_1 =
	     { 1'd1, cache$mav_request_pa[127:64] } ;
  // inlined wires
  assign crg_state$EN_port0__write =
	     MUX_crg_state$port0__write_1__SEL_1 ||
	     WILL_FIRE_RL_rl_ptw_rd_B ||
	     WILL_FIRE_RL_rl_ptw_rd_wait ||
	     WILL_FIRE_RL_rl_pte_wb_req_B ||
	     WILL_FIRE_RL_rl_cache_flush_finish ||
	     WILL_FIRE_RL_rl_PTW_wait ||
	     WILL_FIRE_RL_rl_CPU_req_mmio_WAIT ||
	     WILL_FIRE_RL_rl_CPU_cache_wait ||
	     WILL_FIRE_RL_rl_CPU_ST_wait ||
	     WILL_FIRE_RL_rl_cache_flush_start ||
	     WILL_FIRE_RL_rl_ptw_rd_A ||
	     WILL_FIRE_RL_rl_pte_wb_cache_WAIT ||
	     WILL_FIRE_RL_rl_pte_wb_req_A ;
  always@(MUX_crg_state$port0__write_1__SEL_1 or
	  MUX_crg_state$port0__write_1__VAL_1 or
	  WILL_FIRE_RL_rl_ptw_rd_B or
	  MUX_crg_state$port0__write_1__VAL_2 or
	  WILL_FIRE_RL_rl_ptw_rd_wait or
	  MUX_crg_state$port0__write_1__VAL_3 or
	  WILL_FIRE_RL_rl_pte_wb_req_B or
	  MUX_crg_state$port0__write_1__VAL_4 or
	  MUX_crg_state$port0__write_1__SEL_5 or
	  WILL_FIRE_RL_rl_cache_flush_start or
	  WILL_FIRE_RL_rl_ptw_rd_A or MUX_crg_state$port0__write_1__SEL_8)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_crg_state$port0__write_1__SEL_1:
	  crg_state$port0__write_1 = MUX_crg_state$port0__write_1__VAL_1;
      WILL_FIRE_RL_rl_ptw_rd_B:
	  crg_state$port0__write_1 = MUX_crg_state$port0__write_1__VAL_2;
      WILL_FIRE_RL_rl_ptw_rd_wait:
	  crg_state$port0__write_1 = MUX_crg_state$port0__write_1__VAL_3;
      WILL_FIRE_RL_rl_pte_wb_req_B:
	  crg_state$port0__write_1 = MUX_crg_state$port0__write_1__VAL_4;
      MUX_crg_state$port0__write_1__SEL_5: crg_state$port0__write_1 = 4'd0;
      WILL_FIRE_RL_rl_cache_flush_start: crg_state$port0__write_1 = 4'd4;
      WILL_FIRE_RL_rl_ptw_rd_A: crg_state$port0__write_1 = 4'd6;
      MUX_crg_state$port0__write_1__SEL_8: crg_state$port0__write_1 = 4'd8;
      default: crg_state$port0__write_1 = 4'b1010 /* unspecified value */ ;
    endcase
  end
  assign crg_state$port1__read =
	     crg_state$EN_port0__write ?
	       crg_state$port0__write_1 :
	       crg_state ;
  assign crg_mmu_cache_req_state$EN_port0__write =
	     MUX_crg_mmu_cache_req_state$port0__write_1__SEL_1 ||
	     WILL_FIRE_RL_rl_CPU_cache_wait && !cache$mv_refill_ok ||
	     WILL_FIRE_RL_rl_PTW_wait ||
	     WILL_FIRE_RL_rl_CPU_req_mmio_WAIT ||
	     WILL_FIRE_RL_rl_CPU_ST_wait ||
	     WILL_FIRE_RL_rl_CPU_req_A ;
  always@(WILL_FIRE_RL_rl_PTW_wait or
	  MUX_crg_mmu_cache_req_state$port0__write_1__VAL_3 or
	  MUX_crg_mmu_cache_req_state$port0__write_1__SEL_1 or
	  MUX_crg_exc$port0__write_1__SEL_2 or
	  MUX_crg_mmu_cache_req_state$port0__write_1__SEL_4 or
	  WILL_FIRE_RL_rl_CPU_req_A)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_rl_PTW_wait:
	  crg_mmu_cache_req_state$port0__write_1 =
	      MUX_crg_mmu_cache_req_state$port0__write_1__VAL_3;
      MUX_crg_mmu_cache_req_state$port0__write_1__SEL_1 ||
      MUX_crg_exc$port0__write_1__SEL_2 ||
      MUX_crg_mmu_cache_req_state$port0__write_1__SEL_4:
	  crg_mmu_cache_req_state$port0__write_1 = 2'd0;
      WILL_FIRE_RL_rl_CPU_req_A:
	  crg_mmu_cache_req_state$port0__write_1 = 2'd2;
      default: crg_mmu_cache_req_state$port0__write_1 =
		   2'b10 /* unspecified value */ ;
    endcase
  end
  assign crg_mmu_cache_req_state$port1__read =
	     crg_mmu_cache_req_state$EN_port0__write ?
	       crg_mmu_cache_req_state$port0__write_1 :
	       crg_mmu_cache_req_state ;
  assign crg_mmu_cache_req_state$port1__write_1 =
	     (crg_state$port1__read != 4'd0 || !cache$mv_is_idle) ?
	       2'd1 :
	       2'd2 ;
  assign crg_mmu_cache_req_state$port2__read =
	     EN_ma_req ?
	       crg_mmu_cache_req_state$port1__write_1 :
	       crg_mmu_cache_req_state$port1__read ;
  assign crg_mmu_cache_req$port1__write_1 =
	     { ma_req_op,
	       ma_req_f3,
	       ma_req_va,
	       ma_req_st_value,
	       ma_req_amo_funct7,
	       ma_req_priv,
	       ma_req_sstatus_SUM,
	       ma_req_mstatus_MXR,
	       ma_req_satp } ;
  assign crg_mmu_cache_req$port2__read =
	     EN_ma_req ?
	       crg_mmu_cache_req$port1__write_1 :
	       crg_mmu_cache_req ;
  assign crg_valid$EN_port0__write =
	     WILL_FIRE_RL_rl_CPU_req_B &&
	     (NOT_crg_mmu_cache_req_port0__read__05_BITS_204_ETC___d128 ||
	      tlb$mv_vm_xlate[200:199] == 2'd1 ||
	      tlb$mv_vm_xlate[200:199] == 2'd2 ||
	      cache_mav_request_pa_68_BITS_129_TO_128_69_EQ__ETC___d175) ||
	     WILL_FIRE_RL_rl_CPU_cache_wait && !cache$mv_refill_ok ||
	     WILL_FIRE_RL_rl_PTW_wait &&
	     ptw$dmem_server_response_get[131:130] != 2'd0 ||
	     WILL_FIRE_RL_rl_CPU_req_mmio_WAIT ||
	     WILL_FIRE_RL_rl_CPU_ST_wait ;
  assign crg_valid$port0__write_1 =
	     !MUX_crg_valid$port0__write_1__SEL_1 ||
	     MUX_crg_valid$port0__write_1__VAL_1 ;
  assign crg_valid$port1__read =
	     crg_valid$EN_port0__write ?
	       crg_valid$port0__write_1 :
	       crg_valid ;
  assign crg_valid$port2__read = !EN_ma_req && crg_valid$port1__read ;
  assign crg_exc$EN_port0__write =
	     MUX_crg_exc$port0__write_1__SEL_1 ||
	     WILL_FIRE_RL_rl_CPU_cache_wait && !cache$mv_refill_ok ||
	     WILL_FIRE_RL_rl_PTW_wait &&
	     ptw$dmem_server_response_get[131:130] != 2'd0 ||
	     WILL_FIRE_RL_rl_CPU_req_mmio_WAIT ;
  always@(WILL_FIRE_RL_rl_CPU_req_mmio_WAIT or
	  mmio$result_fst or
	  MUX_crg_exc$port0__write_1__SEL_1 or
	  MUX_crg_exc$port0__write_1__VAL_1 or
	  MUX_crg_exc$port0__write_1__SEL_2 or
	  MUX_crg_exc$port0__write_1__SEL_3)
  begin
    case (1'b1) // synopsys parallel_case
      WILL_FIRE_RL_rl_CPU_req_mmio_WAIT:
	  crg_exc$port0__write_1 = mmio$result_fst;
      MUX_crg_exc$port0__write_1__SEL_1:
	  crg_exc$port0__write_1 = MUX_crg_exc$port0__write_1__VAL_1;
      MUX_crg_exc$port0__write_1__SEL_2 || MUX_crg_exc$port0__write_1__SEL_3:
	  crg_exc$port0__write_1 = 1'd1;
      default: crg_exc$port0__write_1 = 1'b0 /* unspecified value */ ;
    endcase
  end
  assign crg_exc$port1__read =
	     crg_exc$EN_port0__write ? crg_exc$port0__write_1 : crg_exc ;
  assign crg_exc_code$EN_port0__write =
	     WILL_FIRE_RL_rl_CPU_req_B &&
	     (NOT_crg_mmu_cache_req_port0__read__05_BITS_204_ETC___d128 ||
	      tlb$mv_vm_xlate[200:199] == 2'd2) ||
	     WILL_FIRE_RL_rl_CPU_cache_wait && !cache$mv_refill_ok ||
	     WILL_FIRE_RL_rl_PTW_wait &&
	     ptw$dmem_server_response_get[131:130] != 2'd0 ||
	     WILL_FIRE_RL_rl_CPU_req_mmio_WAIT ;
  always@(MUX_crg_exc_code$port0__write_1__SEL_1 or
	  MUX_crg_exc_code$port0__write_1__VAL_1 or
	  MUX_crg_exc$port0__write_1__SEL_2 or
	  x1__h4806 or
	  MUX_crg_exc$port0__write_1__SEL_3 or
	  MUX_crg_exc_code$port0__write_1__VAL_3 or
	  WILL_FIRE_RL_rl_CPU_req_mmio_WAIT)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_crg_exc_code$port0__write_1__SEL_1:
	  crg_exc_code$port0__write_1 =
	      MUX_crg_exc_code$port0__write_1__VAL_1;
      MUX_crg_exc$port0__write_1__SEL_2:
	  crg_exc_code$port0__write_1 = x1__h4806;
      MUX_crg_exc$port0__write_1__SEL_3:
	  crg_exc_code$port0__write_1 =
	      MUX_crg_exc_code$port0__write_1__VAL_3;
      WILL_FIRE_RL_rl_CPU_req_mmio_WAIT:
	  crg_exc_code$port0__write_1 = x1__h4806;
      default: crg_exc_code$port0__write_1 = 4'b1010 /* unspecified value */ ;
    endcase
  end
  assign crg_exc_code$port1__read =
	     crg_exc_code$EN_port0__write ?
	       crg_exc_code$port0__write_1 :
	       crg_exc_code ;
  assign crg_ld_val$EN_port0__write =
	     WILL_FIRE_RL_rl_CPU_req_B &&
	     crg_mmu_cache_req_port0__read__05_BITS_204_TO__ETC___d204 &&
	     tlb$mv_vm_xlate[200:199] != 2'd1 &&
	     tlb$mv_vm_xlate[200:199] != 2'd2 &&
	     NOT_tlb_mv_vm_xlate_crg_mmu_cache_req_port0__r_ETC___d190 ||
	     WILL_FIRE_RL_rl_CPU_req_mmio_WAIT ;
  assign crg_ld_val$port0__write_1 =
	     MUX_crg_final_st_val$port0__write_1__SEL_1 ?
	       cache$mav_request_pa[127:64] :
	       mmio$result_snd_fst ;
  assign crg_ld_val$port1__read =
	     crg_ld_val$EN_port0__write ?
	       crg_ld_val$port0__write_1 :
	       crg_ld_val ;
  assign crg_final_st_val$EN_port0__write =
	     WILL_FIRE_RL_rl_CPU_req_B &&
	     crg_mmu_cache_req_port0__read__05_BITS_204_TO__ETC___d204 &&
	     tlb$mv_vm_xlate[200:199] != 2'd1 &&
	     tlb$mv_vm_xlate[200:199] != 2'd2 &&
	     NOT_tlb_mv_vm_xlate_crg_mmu_cache_req_port0__r_ETC___d190 ||
	     WILL_FIRE_RL_rl_CPU_req_mmio_WAIT ;
  assign crg_final_st_val$port0__write_1 =
	     MUX_crg_final_st_val$port0__write_1__SEL_1 ?
	       cache$mav_request_pa[63:0] :
	       mmio$result_snd_snd ;
  assign crg_final_st_val$port1__read =
	     crg_final_st_val$EN_port0__write ?
	       crg_final_st_val$port0__write_1 :
	       crg_final_st_val ;
  // register crg_exc
  assign crg_exc$D_IN = crg_exc$port1__read ;
  assign crg_exc$EN = 1'b1 ;
  // register crg_exc_code
  assign crg_exc_code$D_IN = crg_exc_code$port1__read ;
  assign crg_exc_code$EN = 1'b1 ;
  // register crg_final_st_val
  assign crg_final_st_val$D_IN = crg_final_st_val$port1__read ;
  assign crg_final_st_val$EN = 1'b1 ;
  // register crg_ld_val
  assign crg_ld_val$D_IN = crg_ld_val$port1__read ;
  assign crg_ld_val$EN = 1'b1 ;
  // register crg_mmu_cache_req
  assign crg_mmu_cache_req$D_IN = crg_mmu_cache_req$port2__read ;
  assign crg_mmu_cache_req$EN = 1'b1 ;
  // register crg_mmu_cache_req_state
  assign crg_mmu_cache_req_state$D_IN = crg_mmu_cache_req_state$port2__read ;
  assign crg_mmu_cache_req_state$EN = 1'b1 ;
  // register crg_state
  assign crg_state$D_IN = crg_state$port1__read ;
  assign crg_state$EN = 1'b1 ;
  // register crg_valid
  assign crg_valid$D_IN = crg_valid$port2__read ;
  assign crg_valid$EN = 1'b1 ;
  // register rg_ptw_mem_req
  assign rg_ptw_mem_req$D_IN = ptw$mem_client_request_get ;
  assign rg_ptw_mem_req$EN = WILL_FIRE_RL_rl_ptw_rd_A ;
  // register rg_state_stack_during_ptw_rd
  assign rg_state_stack_during_ptw_rd$D_IN = crg_state ;
  assign rg_state_stack_during_ptw_rd$EN = WILL_FIRE_RL_rl_ptw_rd_A ;
  // register rg_tohost_addr
  assign rg_tohost_addr$D_IN = set_watch_tohost_tohost_addr ;
  assign rg_tohost_addr$EN = EN_set_watch_tohost ;
  // register rg_tohost_value
  assign rg_tohost_value$D_IN =
	     EN_set_watch_tohost ? 64'd0 : crg_mmu_cache_req[138:75] ;
  assign rg_tohost_value$EN =
	     WILL_FIRE_RL_rl_CPU_req_B &&
	     crg_mmu_cache_req_port0__read__05_BITS_204_TO__ETC___d204 &&
	     tlb$mv_vm_xlate[200:199] != 2'd1 &&
	     NOT_tlb_mv_vm_xlate_crg_mmu_cache_req_port0__r_ETC___d245 ||
	     EN_set_watch_tohost ;
  // register rg_watch_tohost
  assign rg_watch_tohost$D_IN = set_watch_tohost_watch_tohost ;
  assign rg_watch_tohost$EN = EN_set_watch_tohost ;
  // submodule cache
  assign cache$flush_server_request_put = f_cache_flush_reqs$D_OUT ;
  assign cache$l1_to_l2_client_response_enq_x =
	     l1_to_l2_client_response_enq_x ;
  assign cache$l2_to_l1_server_request_enq_x = l2_to_l1_server_request_enq_x ;
  always@(MUX_cache$ma_request_va_1__SEL_1 or
	  crg_mmu_cache_req$port1__write_1 or
	  WILL_FIRE_RL_rl_CPU_req_A or
	  crg_mmu_cache_req or
	  WILL_FIRE_RL_rl_pte_wb_req_A or
	  f_pte_writebacks$D_OUT or
	  WILL_FIRE_RL_rl_ptw_rd_A or ptw$mem_client_request_get)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_cache$ma_request_va_1__SEL_1:
	  cache$ma_request_va_va = crg_mmu_cache_req$port1__write_1[202:139];
      WILL_FIRE_RL_rl_CPU_req_A:
	  cache$ma_request_va_va = crg_mmu_cache_req[202:139];
      WILL_FIRE_RL_rl_pte_wb_req_A:
	  cache$ma_request_va_va = f_pte_writebacks$D_OUT[127:64];
      WILL_FIRE_RL_rl_ptw_rd_A:
	  cache$ma_request_va_va = ptw$mem_client_request_get;
      default: cache$ma_request_va_va =
		   64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  always@(MUX_cache$mav_request_pa_1__SEL_1 or
	  tlb$mv_vm_xlate or
	  WILL_FIRE_RL_rl_ptw_rd_B or
	  rg_ptw_mem_req or
	  WILL_FIRE_RL_rl_pte_wb_req_B or f_pte_writebacks$D_OUT)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_cache$mav_request_pa_1__SEL_1:
	  cache$mav_request_pa_pa = tlb$mv_vm_xlate[198:135];
      WILL_FIRE_RL_rl_ptw_rd_B: cache$mav_request_pa_pa = rg_ptw_mem_req;
      WILL_FIRE_RL_rl_pte_wb_req_B:
	  cache$mav_request_pa_pa = f_pte_writebacks$D_OUT[127:64];
      default: cache$mav_request_pa_pa =
		   64'hAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  always@(MUX_cache$mav_request_pa_1__SEL_1 or
	  crg_mmu_cache_req or
	  WILL_FIRE_RL_rl_ptw_rd_B or
	  MUX_cache$mav_request_pa_1__VAL_2 or
	  WILL_FIRE_RL_rl_pte_wb_req_B or MUX_cache$mav_request_pa_1__VAL_3)
  begin
    case (1'b1) // synopsys parallel_case
      MUX_cache$mav_request_pa_1__SEL_1:
	  cache$mav_request_pa_req = crg_mmu_cache_req;
      WILL_FIRE_RL_rl_ptw_rd_B:
	  cache$mav_request_pa_req = MUX_cache$mav_request_pa_1__VAL_2;
      WILL_FIRE_RL_rl_pte_wb_req_B:
	  cache$mav_request_pa_req = MUX_cache$mav_request_pa_1__VAL_3;
      default: cache$mav_request_pa_req =
		   208'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA /* unspecified value */ ;
    endcase
  end
  assign cache$EN_ma_request_va =
	     EN_ma_req && crg_state$port1__read == 4'd0 && cache$mv_is_idle ||
	     WILL_FIRE_RL_rl_CPU_req_A ||
	     WILL_FIRE_RL_rl_pte_wb_req_A ||
	     WILL_FIRE_RL_rl_ptw_rd_A ;
  assign cache$EN_mav_request_pa =
	     WILL_FIRE_RL_rl_CPU_req_B &&
	     crg_mmu_cache_req_port0__read__05_BITS_204_TO__ETC___d204 &&
	     tlb$mv_vm_xlate[200:199] != 2'd1 &&
	     NOT_tlb_mv_vm_xlate_crg_mmu_cache_req_port0__r_ETC___d230 ||
	     WILL_FIRE_RL_rl_ptw_rd_B ||
	     WILL_FIRE_RL_rl_pte_wb_req_B ;
  assign cache$EN_flush_server_request_put =
	     CAN_FIRE_RL_rl_cache_flush_start ;
  assign cache$EN_flush_server_response_get =
	     CAN_FIRE_RL_rl_cache_flush_finish ;
  assign cache$EN_l1_to_l2_client_request_deq =
	     EN_l1_to_l2_client_request_deq ;
  assign cache$EN_l1_to_l2_client_response_enq =
	     EN_l1_to_l2_client_response_enq ;
  assign cache$EN_l2_to_l1_server_request_enq =
	     EN_l2_to_l1_server_request_enq ;
  assign cache$EN_l2_to_l1_server_response_deq =
	     EN_l2_to_l1_server_response_deq ;
  // submodule f_cache_flush_reqs
  assign f_cache_flush_reqs$D_IN = flush_server_request_put ;
  assign f_cache_flush_reqs$ENQ = EN_flush_server_request_put ;
  assign f_cache_flush_reqs$DEQ = CAN_FIRE_RL_rl_cache_flush_finish ;
  assign f_cache_flush_reqs$CLR = 1'b0 ;
  // submodule f_cache_flush_rsps
  assign f_cache_flush_rsps$ENQ = CAN_FIRE_RL_rl_cache_flush_finish ;
  assign f_cache_flush_rsps$DEQ = EN_flush_server_response_get ;
  assign f_cache_flush_rsps$CLR = 1'b0 ;
  // submodule f_dmem_pte_writebacks
  assign f_dmem_pte_writebacks$D_IN =
	     { tlb$mv_vm_xlate[63:0], tlb$mv_vm_xlate[129:66] } ;
  assign f_dmem_pte_writebacks$ENQ = MUX_tlb$ma_insert_1__SEL_2 ;
  assign f_dmem_pte_writebacks$DEQ = WILL_FIRE_RL_mkConnectionGetPut_1 ;
  assign f_dmem_pte_writebacks$CLR = 1'b0 ;
  // submodule f_imem_pte_writebacks
  assign f_imem_pte_writebacks$D_IN = imem_pte_writeback_p_put ;
  assign f_imem_pte_writebacks$ENQ = EN_imem_pte_writeback_p_put ;
  assign f_imem_pte_writebacks$DEQ = CAN_FIRE_RL_mkConnectionGetPut ;
  assign f_imem_pte_writebacks$CLR = 1'b0 ;
  // submodule f_pte_writebacks
  assign f_pte_writebacks$D_IN =
	     WILL_FIRE_RL_mkConnectionGetPut ?
	       f_imem_pte_writebacks$D_OUT :
	       f_dmem_pte_writebacks$D_OUT ;
  assign f_pte_writebacks$ENQ =
	     WILL_FIRE_RL_mkConnectionGetPut ||
	     WILL_FIRE_RL_mkConnectionGetPut_1 ;
  assign f_pte_writebacks$DEQ =
	     WILL_FIRE_RL_rl_pte_wb_req_B &&
	     cache$mav_request_pa[129:128] == 2'd2 ;
  assign f_pte_writebacks$CLR = 1'b0 ;
  // submodule mmio
  assign mmio$mmio_client_response_put = mmio_client_response_put ;
  assign mmio$req_mmu_cache_req = crg_mmu_cache_req$port1__write_1 ;
  assign mmio$start_pa = tlb$mv_vm_xlate[198:135] ;
  assign mmio$EN_req = EN_ma_req ;
  assign mmio$EN_start =
	     WILL_FIRE_RL_rl_CPU_req_B &&
	     crg_mmu_cache_req_port0__read__05_BITS_204_TO__ETC___d204 &&
	     tlb$mv_vm_xlate[200:199] != 2'd1 &&
	     NOT_tlb_mv_vm_xlate_crg_mmu_cache_req_port0__r_ETC___d238 ;
  assign mmio$EN_mmio_client_request_get = EN_mmio_client_request_get ;
  assign mmio$EN_mmio_client_response_put = EN_mmio_client_response_put ;
  // submodule ptw
  assign ptw$dmem_server_request_put =
	     { crg_mmu_cache_req[202:139], crg_mmu_cache_req[63:0] } ;
  assign ptw$imem_server_request_put = imem_ptw_server_request_put ;
  assign ptw$mem_client_response_put =
	     MUX_ptw$mem_client_response_put_1__SEL_1 ?
	       MUX_ptw$mem_client_response_put_1__VAL_1 :
	       65'h0AAAAAAAAAAAAAAAA ;
  assign ptw$EN_imem_server_request_put = EN_imem_ptw_server_request_put ;
  assign ptw$EN_imem_server_response_get = EN_imem_ptw_server_response_get ;
  assign ptw$EN_dmem_server_request_put =
	     WILL_FIRE_RL_rl_CPU_req_B &&
	     crg_mmu_cache_req_port0__read__05_BITS_204_TO__ETC___d204 &&
	     tlb$mv_vm_xlate[200:199] == 2'd1 ;
  assign ptw$EN_dmem_server_response_get = CAN_FIRE_RL_rl_PTW_wait ;
  assign ptw$EN_mem_client_request_get = WILL_FIRE_RL_rl_ptw_rd_A ;
  assign ptw$EN_mem_client_response_put =
	     WILL_FIRE_RL_rl_ptw_rd_B &&
	     cache$mav_request_pa[129:128] == 2'd1 ||
	     WILL_FIRE_RL_rl_ptw_rd_wait && !cache$mv_refill_ok ;
  // submodule tlb
  assign tlb$ma_insert_asid = crg_mmu_cache_req[59:44] ;
  assign tlb$ma_insert_level =
	     MUX_tlb$ma_insert_1__SEL_1 ?
	       ptw$dmem_server_response_get[65:64] :
	       tlb$mv_vm_xlate[65:64] ;
  assign tlb$ma_insert_pte =
	     MUX_tlb$ma_insert_1__SEL_1 ?
	       ptw$dmem_server_response_get[129:66] :
	       tlb$mv_vm_xlate[129:66] ;
  assign tlb$ma_insert_pte_pa =
	     MUX_tlb$ma_insert_1__SEL_1 ?
	       ptw$dmem_server_response_get[63:0] :
	       tlb$mv_vm_xlate[63:0] ;
  assign tlb$ma_insert_vpn = crg_mmu_cache_req[177:151] ;
  assign tlb$mv_vm_xlate_mstatus_MXR = crg_mmu_cache_req[64] ;
  assign tlb$mv_vm_xlate_priv = crg_mmu_cache_req[67:66] ;
  assign tlb$mv_vm_xlate_read_not_write =
	     crg_mmu_cache_req[207:206] == 2'd0 ||
	     crg_mmu_cache_req[207:206] == 2'd2 &&
	     crg_mmu_cache_req[74:70] == 5'b00010 ;
  assign tlb$mv_vm_xlate_satp = crg_mmu_cache_req[63:0] ;
  assign tlb$mv_vm_xlate_sstatus_SUM = crg_mmu_cache_req[65] ;
  assign tlb$mv_vm_xlate_va = crg_mmu_cache_req[202:139] ;
  assign tlb$EN_ma_insert =
	     WILL_FIRE_RL_rl_PTW_wait &&
	     ptw$dmem_server_response_get[131:130] == 2'd0 ||
	     WILL_FIRE_RL_rl_CPU_req_B &&
	     crg_mmu_cache_req_port0__read__05_BITS_204_TO__ETC___d204 &&
	     tlb$mv_vm_xlate[200:199] != 2'd1 &&
	     tlb$mv_vm_xlate[200:199] != 2'd2 &&
	     tlb$mv_vm_xlate[130] ;
  assign tlb$EN_ma_flush = EN_tlb_flush ;
  // remaining internal signals
  assign IF_NOT_tlb_mv_vm_xlate_crg_mmu_cache_req_port0_ETC___d212 =
	     (!tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d150 &&
	      tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d151 ||
	      !tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d154 &&
	      tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d155) ?
	       ((cache$mav_request_pa[129:128] == 2'd0) ? 4'd2 : 4'd1) :
	       4'd3 ;
  assign IF_tlb_mv_vm_xlate_crg_mmu_cache_req_port0__re_ETC___d163 =
	     (tlb$mv_vm_xlate[200:199] == 2'd1) ?
	       ptw$RDY_dmem_server_request_put :
	       tlb$mv_vm_xlate[200:199] == 2'd2 ||
	       (!tlb$mv_vm_xlate[130] || f_dmem_pte_writebacks$FULL_N) &&
	       tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d160 ;
  assign NOT_crg_mmu_cache_req_port0__read__05_BITS_204_ETC___d128 =
	     crg_mmu_cache_req[204:203] != 2'b0 &&
	     (crg_mmu_cache_req[204:203] != 2'b01 ||
	      crg_mmu_cache_req[139]) &&
	     (crg_mmu_cache_req[204:203] != 2'b10 ||
	      crg_mmu_cache_req[140:139] != 2'b0) &&
	     (crg_mmu_cache_req[204:203] != 2'b11 ||
	      crg_mmu_cache_req[141:139] != 3'b0) ;
  assign NOT_tlb_mv_vm_xlate_crg_mmu_cache_req_port0__r_ETC___d185 =
	     (!tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d150 &&
	      tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d151 ||
	      !tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d154 &&
	      tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d155) &&
	     cache$mav_request_pa[129:128] == 2'd1 ;
  assign NOT_tlb_mv_vm_xlate_crg_mmu_cache_req_port0__r_ETC___d190 =
	     (!tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d150 &&
	      tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d151 ||
	      !tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d154 &&
	      tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d155) &&
	     cache$mav_request_pa[129:128] != 2'd0 ;
  assign NOT_tlb_mv_vm_xlate_crg_mmu_cache_req_port0__r_ETC___d230 =
	     tlb$mv_vm_xlate[200:199] != 2'd2 &&
	     (!tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d150 &&
	      tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d151 ||
	      !tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d154 &&
	      tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d155) ;
  assign NOT_tlb_mv_vm_xlate_crg_mmu_cache_req_port0__r_ETC___d238 =
	     tlb$mv_vm_xlate[200:199] != 2'd2 &&
	     (tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d150 ||
	      !tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d151) &&
	     (tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d154 ||
	      !tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d155) ;
  assign NOT_tlb_mv_vm_xlate_crg_mmu_cache_req_port0__r_ETC___d245 =
	     tlb$mv_vm_xlate[200:199] != 2'd2 && rg_watch_tohost &&
	     tlb$mv_vm_xlate[198:135] == rg_tohost_addr ;
  assign cache_mav_request_pa_68_BITS_129_TO_128_69_EQ__ETC___d175 =
	     cache$mav_request_pa[129:128] == 2'd0 ||
	     cache$mav_request_pa[129:128] == 2'd1 ||
	     cache$mav_request_pa[129:128] == 2'd2 ||
	     (tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d150 ||
	      !tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d151) &&
	     (tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d154 ||
	      !tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d155) ;
  assign cache_mav_request_pa_68_BITS_129_TO_128_69_EQ__ETC___d207 =
	     cache$mav_request_pa[129:128] == 2'd0 ||
	     cache$mav_request_pa[129:128] == 2'd2 ||
	     (tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d150 ||
	      !tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d151) &&
	     (tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d154 ||
	      !tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d155) ;
  assign crg_mmu_cache_req_port0__read__05_BITS_204_TO__ETC___d204 =
	     crg_mmu_cache_req[204:203] == 2'b0 ||
	     crg_mmu_cache_req[204:203] == 2'b01 && !crg_mmu_cache_req[139] ||
	     crg_mmu_cache_req[204:203] == 2'b10 &&
	     crg_mmu_cache_req[140:139] == 2'b0 ||
	     crg_mmu_cache_req[204:203] == 2'b11 &&
	     crg_mmu_cache_req[141:139] == 3'b0 ;
  assign tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d150 =
	     tlb$mv_vm_xlate[198:135] < 64'h0000000000001000 ;
  assign tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d151 =
	     tlb$mv_vm_xlate[198:135] < 64'd8192 ;
  assign tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d154 =
	     tlb$mv_vm_xlate[198:135] < 64'h0000000080000000 ;
  assign tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d155 =
	     tlb$mv_vm_xlate[198:135] < 64'h0000000090000000 ;
  assign tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d160 =
	     (tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d150 ||
	      !tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d151) &&
	     (tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d154 ||
	      !tlb_mv_vm_xlate_crg_mmu_cache_req_port0__read__ETC___d155) ||
	     cache$RDY_mav_request_pa ;
  assign x1__h3434 =
	     (crg_mmu_cache_req[207:206] == 2'd0 ||
	      crg_mmu_cache_req[207:206] == 2'd2 &&
	      crg_mmu_cache_req[74:70] == 5'b00010) ?
	       4'd4 :
	       4'd6 ;
  assign x1__h4806 =
	     (crg_mmu_cache_req[207:206] == 2'd0 ||
	      crg_mmu_cache_req[207:206] == 2'd2 &&
	      crg_mmu_cache_req[74:70] == 5'b00010) ?
	       4'd5 :
	       4'd7 ;
  assign x1__h5626 =
	     (crg_mmu_cache_req[207:206] == 2'd0 ||
	      crg_mmu_cache_req[207:206] == 2'd2 &&
	      crg_mmu_cache_req[74:70] == 5'b00010) ?
	       4'd13 :
	       4'd15 ;
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        crg_mmu_cache_req_state <= `BSV_ASSIGNMENT_DELAY 2'd0;
	crg_state <= `BSV_ASSIGNMENT_DELAY 4'd0;
	crg_valid <= `BSV_ASSIGNMENT_DELAY 1'd0;
	rg_tohost_addr <= `BSV_ASSIGNMENT_DELAY 64'h0000000080001000;
	rg_tohost_value <= `BSV_ASSIGNMENT_DELAY 64'd0;
	rg_watch_tohost <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (crg_mmu_cache_req_state$EN)
	  crg_mmu_cache_req_state <= `BSV_ASSIGNMENT_DELAY
	      crg_mmu_cache_req_state$D_IN;
	if (crg_state$EN) crg_state <= `BSV_ASSIGNMENT_DELAY crg_state$D_IN;
	if (crg_valid$EN) crg_valid <= `BSV_ASSIGNMENT_DELAY crg_valid$D_IN;
	if (rg_tohost_addr$EN)
	  rg_tohost_addr <= `BSV_ASSIGNMENT_DELAY rg_tohost_addr$D_IN;
	if (rg_tohost_value$EN)
	  rg_tohost_value <= `BSV_ASSIGNMENT_DELAY rg_tohost_value$D_IN;
	if (rg_watch_tohost$EN)
	  rg_watch_tohost <= `BSV_ASSIGNMENT_DELAY rg_watch_tohost$D_IN;
      end
    if (crg_exc$EN) crg_exc <= `BSV_ASSIGNMENT_DELAY crg_exc$D_IN;
    if (crg_exc_code$EN)
      crg_exc_code <= `BSV_ASSIGNMENT_DELAY crg_exc_code$D_IN;
    if (crg_final_st_val$EN)
      crg_final_st_val <= `BSV_ASSIGNMENT_DELAY crg_final_st_val$D_IN;
    if (crg_ld_val$EN) crg_ld_val <= `BSV_ASSIGNMENT_DELAY crg_ld_val$D_IN;
    if (crg_mmu_cache_req$EN)
      crg_mmu_cache_req <= `BSV_ASSIGNMENT_DELAY crg_mmu_cache_req$D_IN;
    if (rg_ptw_mem_req$EN)
      rg_ptw_mem_req <= `BSV_ASSIGNMENT_DELAY rg_ptw_mem_req$D_IN;
    if (rg_state_stack_during_ptw_rd$EN)
      rg_state_stack_during_ptw_rd <= `BSV_ASSIGNMENT_DELAY
	  rg_state_stack_during_ptw_rd$D_IN;
  end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    crg_exc = 1'h0;
    crg_exc_code = 4'hA;
    crg_final_st_val = 64'hAAAAAAAAAAAAAAAA;
    crg_ld_val = 64'hAAAAAAAAAAAAAAAA;
    crg_mmu_cache_req =
	208'hAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA;
    crg_mmu_cache_req_state = 2'h2;
    crg_state = 4'hA;
    crg_valid = 1'h0;
    rg_ptw_mem_req = 64'hAAAAAAAAAAAAAAAA;
    rg_state_stack_during_ptw_rd = 4'hA;
    rg_tohost_addr = 64'hAAAAAAAAAAAAAAAA;
    rg_tohost_value = 64'hAAAAAAAAAAAAAAAA;
    rg_watch_tohost = 1'h0;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
  // handling of system tasks
  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_CPU_req_B &&
	  crg_mmu_cache_req_port0__read__05_BITS_204_TO__ETC___d204 &&
	  tlb$mv_vm_xlate[200:199] != 2'd1 &&
	  tlb$mv_vm_xlate[200:199] != 2'd2 &&
	  tlb$mv_vm_xlate[200:199] != 2'd0)
	$display("Dynamic assertion failed: \"../../src_Core/Near_Mem_VM_WB_L1_L2/D_MMU_Cache.bsv\", line 456, column 67\nFAIL: unknown vm_xlate result");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_CPU_req_B &&
	  crg_mmu_cache_req_port0__read__05_BITS_204_TO__ETC___d204 &&
	  tlb$mv_vm_xlate[200:199] != 2'd1 &&
	  tlb$mv_vm_xlate[200:199] != 2'd2 &&
	  tlb$mv_vm_xlate[200:199] != 2'd0)
	$finish(32'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_set_watch_tohost)
	begin
	  v__h8559 = $stime;
	  #0;
	end
    v__h8553 = v__h8559 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_set_watch_tohost)
	$display("%0d: %m.set_watch_tohost: watch %0d, addr %0h",
		 v__h8553,
		 set_watch_tohost_watch_tohost,
		 set_watch_tohost_tohost_addr);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_rd_B && cache$mav_request_pa[129:128] == 2'd2)
	begin
	  v__h6532 = $stime;
	  #0;
	end
    v__h6526 = v__h6532 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_rd_B && cache$mav_request_pa[129:128] == 2'd2)
	$display("%0d: %m.rl_ptw_rd_B", v__h6526);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_rd_B && cache$mav_request_pa[129:128] == 2'd2)
	$display("    INTERNAL ERROR: cannot have CACHE_WRITE_HIT for PTW read-request to cache");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_rd_B && cache$mav_request_pa[129:128] == 2'd2)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_rd_B && cache$mav_request_pa[129:128] == 2'd2)
	$write("MMU_Cache_Req{");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_rd_B && cache$mav_request_pa[129:128] == 2'd2)
	$write("CACHE_LD", " f3 %3b", 3'b011);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_rd_B && cache$mav_request_pa[129:128] == 2'd2)
	$write(" va %0h", rg_ptw_mem_req);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_rd_B && cache$mav_request_pa[129:128] == 2'd2)
	$write(" priv %0d sstatus_SUM %0d mstatus_MXR %0d satp %0h",
	       2'b11,
	       1'd0,
	       1'd0,
	       64'd0);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_rd_B && cache$mav_request_pa[129:128] == 2'd2)
	$write("}");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_rd_B && cache$mav_request_pa[129:128] == 2'd2)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_ptw_rd_B && cache$mav_request_pa[129:128] == 2'd2)
	$finish(32'd1);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pte_wb_cache_WAIT && !cache$mv_refill_ok)
	begin
	  v__h7557 = $stime;
	  #0;
	end
    v__h7551 = v__h7557 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pte_wb_cache_WAIT && !cache$mv_refill_ok)
	$display("%0d: %m.rl_pte_wb_req_cache_WAIT: ERROR: unexpected cache error response",
		 v__h7551);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pte_wb_cache_WAIT && !cache$mv_refill_ok)
	$display("    pte_pa %0d  pa %0h",
		 f_pte_writebacks$D_OUT[127:64],
		 f_pte_writebacks$D_OUT[63:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (WILL_FIRE_RL_rl_pte_wb_cache_WAIT && !cache$mv_refill_ok)
	$finish(32'd1);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0)
	begin
	  v__h2123 = $stime;
	  #0;
	end
    v__h2117 = v__h2123 / 32'd10;
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0)
	$display("%0d: %m.rl_CPU_req", v__h2117);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0)
	$write("    INTERNAL ERROR: crg_mmu_cache_req_state: ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read == 2'd1)
	$write("REQ_STATE_FULL_A");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0 &&
	  crg_mmu_cache_req_state$port1__read != 2'd1)
	$write("REQ_STATE_FULL_B");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0)
	$write("; expected EMPTY", "\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0)
	$write("    ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0 &&
	  crg_mmu_cache_req$port1__write_1[207:206] == 2'd2)
	$write("MMU_Cache_Req{");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0 &&
	  crg_mmu_cache_req$port1__write_1[207:206] != 2'd2)
	$write("MMU_Cache_Req{");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0 &&
	  crg_mmu_cache_req$port1__write_1[207:206] == 2'd2)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0 &&
	  crg_mmu_cache_req$port1__write_1[207:206] == 2'd0)
	$write("CACHE_LD");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0 &&
	  crg_mmu_cache_req$port1__write_1[207:206] == 2'd1)
	$write("CACHE_ST");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0 &&
	  crg_mmu_cache_req$port1__write_1[207:206] != 2'd2 &&
	  crg_mmu_cache_req$port1__write_1[207:206] != 2'd0 &&
	  crg_mmu_cache_req$port1__write_1[207:206] != 2'd1)
	$write("CACHE_AMO");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0 &&
	  crg_mmu_cache_req$port1__write_1[207:206] == 2'd2)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0 &&
	  crg_mmu_cache_req$port1__write_1[207:206] != 2'd2)
	$write(" f3 %3b", crg_mmu_cache_req$port1__write_1[205:203]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0 &&
	  crg_mmu_cache_req$port1__write_1[207:206] == 2'd2)
	$write("CACHE_AMO");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0 &&
	  crg_mmu_cache_req$port1__write_1[207:206] != 2'd2)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0 &&
	  crg_mmu_cache_req$port1__write_1[207:206] == 2'd2)
	$write(" f3 %3b", crg_mmu_cache_req$port1__write_1[205:203]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0 &&
	  crg_mmu_cache_req$port1__write_1[207:206] != 2'd2)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0 &&
	  crg_mmu_cache_req$port1__write_1[207:206] == 2'd2)
	$write(" ");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0 &&
	  crg_mmu_cache_req$port1__write_1[207:206] != 2'd2)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0 &&
	  crg_mmu_cache_req$port1__write_1[207:206] == 2'd2 &&
	  crg_mmu_cache_req$port1__write_1[74:70] == 5'b00010)
	$write("LR");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0 &&
	  crg_mmu_cache_req$port1__write_1[207:206] == 2'd2 &&
	  crg_mmu_cache_req$port1__write_1[74:70] == 5'b00011)
	$write("SC");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0 &&
	  crg_mmu_cache_req$port1__write_1[207:206] == 2'd2 &&
	  crg_mmu_cache_req$port1__write_1[74:70] == 5'b0)
	$write("ADD");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0 &&
	  crg_mmu_cache_req$port1__write_1[207:206] == 2'd2 &&
	  crg_mmu_cache_req$port1__write_1[74:70] == 5'b00001)
	$write("SWAP");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0 &&
	  crg_mmu_cache_req$port1__write_1[207:206] == 2'd2 &&
	  crg_mmu_cache_req$port1__write_1[74:70] == 5'b00100)
	$write("XOR");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0 &&
	  crg_mmu_cache_req$port1__write_1[207:206] == 2'd2 &&
	  crg_mmu_cache_req$port1__write_1[74:70] == 5'b01100)
	$write("AND");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0 &&
	  crg_mmu_cache_req$port1__write_1[207:206] == 2'd2 &&
	  crg_mmu_cache_req$port1__write_1[74:70] == 5'b01000)
	$write("OR");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0 &&
	  crg_mmu_cache_req$port1__write_1[207:206] == 2'd2 &&
	  crg_mmu_cache_req$port1__write_1[74:70] == 5'b10000)
	$write("MIN");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0 &&
	  crg_mmu_cache_req$port1__write_1[207:206] == 2'd2 &&
	  crg_mmu_cache_req$port1__write_1[74:70] == 5'b10100)
	$write("MAX");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0 &&
	  crg_mmu_cache_req$port1__write_1[207:206] == 2'd2 &&
	  crg_mmu_cache_req$port1__write_1[74:70] == 5'b11000)
	$write("MINU");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0 &&
	  crg_mmu_cache_req$port1__write_1[207:206] == 2'd2 &&
	  crg_mmu_cache_req$port1__write_1[74:70] != 5'b00010 &&
	  crg_mmu_cache_req$port1__write_1[74:70] != 5'b00011 &&
	  crg_mmu_cache_req$port1__write_1[74:70] != 5'b0 &&
	  crg_mmu_cache_req$port1__write_1[74:70] != 5'b00001 &&
	  crg_mmu_cache_req$port1__write_1[74:70] != 5'b00100 &&
	  crg_mmu_cache_req$port1__write_1[74:70] != 5'b01100 &&
	  crg_mmu_cache_req$port1__write_1[74:70] != 5'b01000 &&
	  crg_mmu_cache_req$port1__write_1[74:70] != 5'b10000 &&
	  crg_mmu_cache_req$port1__write_1[74:70] != 5'b10100 &&
	  crg_mmu_cache_req$port1__write_1[74:70] != 5'b11000)
	$write("MAXU");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0 &&
	  crg_mmu_cache_req$port1__write_1[207:206] != 2'd2)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0 &&
	  crg_mmu_cache_req$port1__write_1[207:206] == 2'd2)
	$write(" aqrl %2b", crg_mmu_cache_req$port1__write_1[69:68]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0 &&
	  crg_mmu_cache_req$port1__write_1[207:206] != 2'd2)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0)
	$write(" va %0h", crg_mmu_cache_req$port1__write_1[202:139]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0 &&
	  (crg_mmu_cache_req$port1__write_1[207:206] == 2'd2 &&
	   crg_mmu_cache_req$port1__write_1[74:70] != 5'b00010 ||
	   crg_mmu_cache_req$port1__write_1[207:206] == 2'd1))
	$write(" st_val %0h", crg_mmu_cache_req$port1__write_1[138:75]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0 &&
	  (crg_mmu_cache_req$port1__write_1[207:206] != 2'd2 ||
	   crg_mmu_cache_req$port1__write_1[74:70] == 5'b00010) &&
	  crg_mmu_cache_req$port1__write_1[207:206] != 2'd1)
	$write("");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0)
	$write(" priv %0d sstatus_SUM %0d mstatus_MXR %0d satp %0h",
	       crg_mmu_cache_req$port1__write_1[67:66],
	       crg_mmu_cache_req$port1__write_1[65],
	       crg_mmu_cache_req$port1__write_1[64],
	       crg_mmu_cache_req$port1__write_1[63:0]);
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0)
	$write("}");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0)
	$write("\n");
    if (RST_N != `BSV_RESET_VALUE)
      if (EN_ma_req && crg_mmu_cache_req_state$port1__read != 2'd0)
	$finish(32'd1);
  end
  // synopsys translate_on
endmodule