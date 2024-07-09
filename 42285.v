module outputs
  wire [70 : 0] recv_ports_0_getFlit,
		recv_ports_10_getFlit,
		recv_ports_11_getFlit,
		recv_ports_1_getFlit,
		recv_ports_2_getFlit,
		recv_ports_3_getFlit,
		recv_ports_4_getFlit,
		recv_ports_5_getFlit,
		recv_ports_6_getFlit,
		recv_ports_7_getFlit,
		recv_ports_8_getFlit,
		recv_ports_9_getFlit;
  wire [3 : 0] recv_ports_info_0_getRecvPortID,
	       recv_ports_info_10_getRecvPortID,
	       recv_ports_info_11_getRecvPortID,
	       recv_ports_info_1_getRecvPortID,
	       recv_ports_info_2_getRecvPortID,
	       recv_ports_info_3_getRecvPortID,
	       recv_ports_info_4_getRecvPortID,
	       recv_ports_info_5_getRecvPortID,
	       recv_ports_info_6_getRecvPortID,
	       recv_ports_info_7_getRecvPortID,
	       recv_ports_info_8_getRecvPortID,
	       recv_ports_info_9_getRecvPortID;
  wire [1 : 0] send_ports_0_getNonFullVCs,
	       send_ports_10_getNonFullVCs,
	       send_ports_11_getNonFullVCs,
	       send_ports_1_getNonFullVCs,
	       send_ports_2_getNonFullVCs,
	       send_ports_3_getNonFullVCs,
	       send_ports_4_getNonFullVCs,
	       send_ports_5_getNonFullVCs,
	       send_ports_6_getNonFullVCs,
	       send_ports_7_getNonFullVCs,
	       send_ports_8_getNonFullVCs,
	       send_ports_9_getNonFullVCs;
  // ports of submodule net_routers_routeTable_1_rt_ifc_banks_banks_rf
  wire [3 : 0] net_routers_routeTable_1_rt_ifc_banks_banks_rf$ADDR_1,
	       net_routers_routeTable_1_rt_ifc_banks_banks_rf$ADDR_IN;
  wire [2 : 0] net_routers_routeTable_1_rt_ifc_banks_banks_rf$D_IN,
	       net_routers_routeTable_1_rt_ifc_banks_banks_rf$D_OUT_1;
  wire net_routers_routeTable_1_rt_ifc_banks_banks_rf$WE;
  // ports of submodule net_routers_routeTable_1_rt_ifc_banks_banks_rf_1
  wire [3 : 0] net_routers_routeTable_1_rt_ifc_banks_banks_rf_1$ADDR_1,
	       net_routers_routeTable_1_rt_ifc_banks_banks_rf_1$ADDR_IN;
  wire [2 : 0] net_routers_routeTable_1_rt_ifc_banks_banks_rf_1$D_IN,
	       net_routers_routeTable_1_rt_ifc_banks_banks_rf_1$D_OUT_1;
  wire net_routers_routeTable_1_rt_ifc_banks_banks_rf_1$WE;
  // ports of submodule net_routers_routeTable_1_rt_ifc_banks_banks_rf_2
  wire [3 : 0] net_routers_routeTable_1_rt_ifc_banks_banks_rf_2$ADDR_1,
	       net_routers_routeTable_1_rt_ifc_banks_banks_rf_2$ADDR_IN;
  wire [2 : 0] net_routers_routeTable_1_rt_ifc_banks_banks_rf_2$D_IN,
	       net_routers_routeTable_1_rt_ifc_banks_banks_rf_2$D_OUT_1;
  wire net_routers_routeTable_1_rt_ifc_banks_banks_rf_2$WE;
  // ports of submodule net_routers_routeTable_1_rt_ifc_banks_banks_rf_3
  wire [3 : 0] net_routers_routeTable_1_rt_ifc_banks_banks_rf_3$ADDR_1,
	       net_routers_routeTable_1_rt_ifc_banks_banks_rf_3$ADDR_IN;
  wire [2 : 0] net_routers_routeTable_1_rt_ifc_banks_banks_rf_3$D_IN,
	       net_routers_routeTable_1_rt_ifc_banks_banks_rf_3$D_OUT_1;
  wire net_routers_routeTable_1_rt_ifc_banks_banks_rf_3$WE;
  // ports of submodule net_routers_routeTable_1_rt_ifc_banks_banks_rf_4
  wire [3 : 0] net_routers_routeTable_1_rt_ifc_banks_banks_rf_4$ADDR_1,
	       net_routers_routeTable_1_rt_ifc_banks_banks_rf_4$ADDR_IN;
  wire [2 : 0] net_routers_routeTable_1_rt_ifc_banks_banks_rf_4$D_IN,
	       net_routers_routeTable_1_rt_ifc_banks_banks_rf_4$D_OUT_1;
  wire net_routers_routeTable_1_rt_ifc_banks_banks_rf_4$WE;
  // ports of submodule net_routers_routeTable_2_rt_ifc_banks_banks_rf
  wire [3 : 0] net_routers_routeTable_2_rt_ifc_banks_banks_rf$ADDR_1,
	       net_routers_routeTable_2_rt_ifc_banks_banks_rf$ADDR_IN;
  wire [2 : 0] net_routers_routeTable_2_rt_ifc_banks_banks_rf$D_IN,
	       net_routers_routeTable_2_rt_ifc_banks_banks_rf$D_OUT_1;
  wire net_routers_routeTable_2_rt_ifc_banks_banks_rf$WE;
  // ports of submodule net_routers_routeTable_2_rt_ifc_banks_banks_rf_1
  wire [3 : 0] net_routers_routeTable_2_rt_ifc_banks_banks_rf_1$ADDR_1,
	       net_routers_routeTable_2_rt_ifc_banks_banks_rf_1$ADDR_IN;
  wire [2 : 0] net_routers_routeTable_2_rt_ifc_banks_banks_rf_1$D_IN,
	       net_routers_routeTable_2_rt_ifc_banks_banks_rf_1$D_OUT_1;
  wire net_routers_routeTable_2_rt_ifc_banks_banks_rf_1$WE;
  // ports of submodule net_routers_routeTable_2_rt_ifc_banks_banks_rf_2
  wire [3 : 0] net_routers_routeTable_2_rt_ifc_banks_banks_rf_2$ADDR_1,
	       net_routers_routeTable_2_rt_ifc_banks_banks_rf_2$ADDR_IN;
  wire [2 : 0] net_routers_routeTable_2_rt_ifc_banks_banks_rf_2$D_IN,
	       net_routers_routeTable_2_rt_ifc_banks_banks_rf_2$D_OUT_1;
  wire net_routers_routeTable_2_rt_ifc_banks_banks_rf_2$WE;
  // ports of submodule net_routers_routeTable_2_rt_ifc_banks_banks_rf_3
  wire [3 : 0] net_routers_routeTable_2_rt_ifc_banks_banks_rf_3$ADDR_1,
	       net_routers_routeTable_2_rt_ifc_banks_banks_rf_3$ADDR_IN;
  wire [2 : 0] net_routers_routeTable_2_rt_ifc_banks_banks_rf_3$D_IN,
	       net_routers_routeTable_2_rt_ifc_banks_banks_rf_3$D_OUT_1;
  wire net_routers_routeTable_2_rt_ifc_banks_banks_rf_3$WE;
  // ports of submodule net_routers_routeTable_2_rt_ifc_banks_banks_rf_4
  wire [3 : 0] net_routers_routeTable_2_rt_ifc_banks_banks_rf_4$ADDR_1,
	       net_routers_routeTable_2_rt_ifc_banks_banks_rf_4$ADDR_IN;
  wire [2 : 0] net_routers_routeTable_2_rt_ifc_banks_banks_rf_4$D_IN,
	       net_routers_routeTable_2_rt_ifc_banks_banks_rf_4$D_OUT_1;
  wire net_routers_routeTable_2_rt_ifc_banks_banks_rf_4$WE;
  // ports of submodule net_routers_routeTable_3_rt_ifc_banks_banks_rf
  wire [3 : 0] net_routers_routeTable_3_rt_ifc_banks_banks_rf$ADDR_1,
	       net_routers_routeTable_3_rt_ifc_banks_banks_rf$ADDR_IN;
  wire [2 : 0] net_routers_routeTable_3_rt_ifc_banks_banks_rf$D_IN,
	       net_routers_routeTable_3_rt_ifc_banks_banks_rf$D_OUT_1;
  wire net_routers_routeTable_3_rt_ifc_banks_banks_rf$WE;
  // ports of submodule net_routers_routeTable_3_rt_ifc_banks_banks_rf_1
  wire [3 : 0] net_routers_routeTable_3_rt_ifc_banks_banks_rf_1$ADDR_1,
	       net_routers_routeTable_3_rt_ifc_banks_banks_rf_1$ADDR_IN;
  wire [2 : 0] net_routers_routeTable_3_rt_ifc_banks_banks_rf_1$D_IN,
	       net_routers_routeTable_3_rt_ifc_banks_banks_rf_1$D_OUT_1;
  wire net_routers_routeTable_3_rt_ifc_banks_banks_rf_1$WE;
  // ports of submodule net_routers_routeTable_3_rt_ifc_banks_banks_rf_2
  wire [3 : 0] net_routers_routeTable_3_rt_ifc_banks_banks_rf_2$ADDR_1,
	       net_routers_routeTable_3_rt_ifc_banks_banks_rf_2$ADDR_IN;
  wire [2 : 0] net_routers_routeTable_3_rt_ifc_banks_banks_rf_2$D_IN,
	       net_routers_routeTable_3_rt_ifc_banks_banks_rf_2$D_OUT_1;
  wire net_routers_routeTable_3_rt_ifc_banks_banks_rf_2$WE;
  // ports of submodule net_routers_routeTable_3_rt_ifc_banks_banks_rf_3
  wire [3 : 0] net_routers_routeTable_3_rt_ifc_banks_banks_rf_3$ADDR_1,
	       net_routers_routeTable_3_rt_ifc_banks_banks_rf_3$ADDR_IN;
  wire [2 : 0] net_routers_routeTable_3_rt_ifc_banks_banks_rf_3$D_IN,
	       net_routers_routeTable_3_rt_ifc_banks_banks_rf_3$D_OUT_1;
  wire net_routers_routeTable_3_rt_ifc_banks_banks_rf_3$WE;
  // ports of submodule net_routers_routeTable_3_rt_ifc_banks_banks_rf_4
  wire [3 : 0] net_routers_routeTable_3_rt_ifc_banks_banks_rf_4$ADDR_1,
	       net_routers_routeTable_3_rt_ifc_banks_banks_rf_4$ADDR_IN;
  wire [2 : 0] net_routers_routeTable_3_rt_ifc_banks_banks_rf_4$D_IN,
	       net_routers_routeTable_3_rt_ifc_banks_banks_rf_4$D_OUT_1;
  wire net_routers_routeTable_3_rt_ifc_banks_banks_rf_4$WE;
  // ports of submodule net_routers_routeTable_rt_ifc_banks_banks_rf
  wire [3 : 0] net_routers_routeTable_rt_ifc_banks_banks_rf$ADDR_1,
	       net_routers_routeTable_rt_ifc_banks_banks_rf$ADDR_IN;
  wire [2 : 0] net_routers_routeTable_rt_ifc_banks_banks_rf$D_IN,
	       net_routers_routeTable_rt_ifc_banks_banks_rf$D_OUT_1;
  wire net_routers_routeTable_rt_ifc_banks_banks_rf$WE;
  // ports of submodule net_routers_routeTable_rt_ifc_banks_banks_rf_1
  wire [3 : 0] net_routers_routeTable_rt_ifc_banks_banks_rf_1$ADDR_1,
	       net_routers_routeTable_rt_ifc_banks_banks_rf_1$ADDR_IN;
  wire [2 : 0] net_routers_routeTable_rt_ifc_banks_banks_rf_1$D_IN,
	       net_routers_routeTable_rt_ifc_banks_banks_rf_1$D_OUT_1;
  wire net_routers_routeTable_rt_ifc_banks_banks_rf_1$WE;
  // ports of submodule net_routers_routeTable_rt_ifc_banks_banks_rf_2
  wire [3 : 0] net_routers_routeTable_rt_ifc_banks_banks_rf_2$ADDR_1,
	       net_routers_routeTable_rt_ifc_banks_banks_rf_2$ADDR_IN;
  wire [2 : 0] net_routers_routeTable_rt_ifc_banks_banks_rf_2$D_IN,
	       net_routers_routeTable_rt_ifc_banks_banks_rf_2$D_OUT_1;
  wire net_routers_routeTable_rt_ifc_banks_banks_rf_2$WE;
  // ports of submodule net_routers_routeTable_rt_ifc_banks_banks_rf_3
  wire [3 : 0] net_routers_routeTable_rt_ifc_banks_banks_rf_3$ADDR_1,
	       net_routers_routeTable_rt_ifc_banks_banks_rf_3$ADDR_IN;
  wire [2 : 0] net_routers_routeTable_rt_ifc_banks_banks_rf_3$D_IN,
	       net_routers_routeTable_rt_ifc_banks_banks_rf_3$D_OUT_1;
  wire net_routers_routeTable_rt_ifc_banks_banks_rf_3$WE;
  // ports of submodule net_routers_routeTable_rt_ifc_banks_banks_rf_4
  wire [3 : 0] net_routers_routeTable_rt_ifc_banks_banks_rf_4$ADDR_1,
	       net_routers_routeTable_rt_ifc_banks_banks_rf_4$ADDR_IN;
  wire [2 : 0] net_routers_routeTable_rt_ifc_banks_banks_rf_4$D_IN,
	       net_routers_routeTable_rt_ifc_banks_banks_rf_4$D_OUT_1;
  wire net_routers_routeTable_rt_ifc_banks_banks_rf_4$WE;
  // ports of submodule net_routers_router_core
  wire [73 : 0] net_routers_router_core$in_ports_0_putRoutedFlit_flit_in,
		net_routers_router_core$in_ports_1_putRoutedFlit_flit_in,
		net_routers_router_core$in_ports_2_putRoutedFlit_flit_in,
		net_routers_router_core$in_ports_3_putRoutedFlit_flit_in,
		net_routers_router_core$in_ports_4_putRoutedFlit_flit_in;
  wire [70 : 0] net_routers_router_core$out_ports_0_getFlit,
		net_routers_router_core$out_ports_1_getFlit,
		net_routers_router_core$out_ports_2_getFlit,
		net_routers_router_core$out_ports_3_getFlit,
		net_routers_router_core$out_ports_4_getFlit;
  wire [1 : 0] net_routers_router_core$in_ports_0_getNonFullVCs,
	       net_routers_router_core$in_ports_1_getNonFullVCs,
	       net_routers_router_core$in_ports_2_getNonFullVCs,
	       net_routers_router_core$in_ports_3_getNonFullVCs,
	       net_routers_router_core$in_ports_4_getNonFullVCs,
	       net_routers_router_core$out_ports_0_putNonFullVCs_nonFullVCs,
	       net_routers_router_core$out_ports_1_putNonFullVCs_nonFullVCs,
	       net_routers_router_core$out_ports_2_putNonFullVCs_nonFullVCs,
	       net_routers_router_core$out_ports_3_putNonFullVCs_nonFullVCs,
	       net_routers_router_core$out_ports_4_putNonFullVCs_nonFullVCs;
  wire net_routers_router_core$EN_in_ports_0_getNonFullVCs,
       net_routers_router_core$EN_in_ports_0_putRoutedFlit,
       net_routers_router_core$EN_in_ports_1_getNonFullVCs,
       net_routers_router_core$EN_in_ports_1_putRoutedFlit,
       net_routers_router_core$EN_in_ports_2_getNonFullVCs,
       net_routers_router_core$EN_in_ports_2_putRoutedFlit,
       net_routers_router_core$EN_in_ports_3_getNonFullVCs,
       net_routers_router_core$EN_in_ports_3_putRoutedFlit,
       net_routers_router_core$EN_in_ports_4_getNonFullVCs,
       net_routers_router_core$EN_in_ports_4_putRoutedFlit,
       net_routers_router_core$EN_out_ports_0_getFlit,
       net_routers_router_core$EN_out_ports_0_putNonFullVCs,
       net_routers_router_core$EN_out_ports_1_getFlit,
       net_routers_router_core$EN_out_ports_1_putNonFullVCs,
       net_routers_router_core$EN_out_ports_2_getFlit,
       net_routers_router_core$EN_out_ports_2_putNonFullVCs,
       net_routers_router_core$EN_out_ports_3_getFlit,
       net_routers_router_core$EN_out_ports_3_putNonFullVCs,
       net_routers_router_core$EN_out_ports_4_getFlit,
       net_routers_router_core$EN_out_ports_4_putNonFullVCs;
  // ports of submodule net_routers_router_core_1
  wire [73 : 0] net_routers_router_core_1$in_ports_0_putRoutedFlit_flit_in,
		net_routers_router_core_1$in_ports_1_putRoutedFlit_flit_in,
		net_routers_router_core_1$in_ports_2_putRoutedFlit_flit_in,
		net_routers_router_core_1$in_ports_3_putRoutedFlit_flit_in,
		net_routers_router_core_1$in_ports_4_putRoutedFlit_flit_in;
  wire [70 : 0] net_routers_router_core_1$out_ports_0_getFlit,
		net_routers_router_core_1$out_ports_1_getFlit,
		net_routers_router_core_1$out_ports_2_getFlit,
		net_routers_router_core_1$out_ports_3_getFlit,
		net_routers_router_core_1$out_ports_4_getFlit;
  wire [1 : 0] net_routers_router_core_1$in_ports_0_getNonFullVCs,
	       net_routers_router_core_1$in_ports_1_getNonFullVCs,
	       net_routers_router_core_1$in_ports_2_getNonFullVCs,
	       net_routers_router_core_1$in_ports_3_getNonFullVCs,
	       net_routers_router_core_1$in_ports_4_getNonFullVCs,
	       net_routers_router_core_1$out_ports_0_putNonFullVCs_nonFullVCs,
	       net_routers_router_core_1$out_ports_1_putNonFullVCs_nonFullVCs,
	       net_routers_router_core_1$out_ports_2_putNonFullVCs_nonFullVCs,
	       net_routers_router_core_1$out_ports_3_putNonFullVCs_nonFullVCs,
	       net_routers_router_core_1$out_ports_4_putNonFullVCs_nonFullVCs;
  wire net_routers_router_core_1$EN_in_ports_0_getNonFullVCs,
       net_routers_router_core_1$EN_in_ports_0_putRoutedFlit,
       net_routers_router_core_1$EN_in_ports_1_getNonFullVCs,
       net_routers_router_core_1$EN_in_ports_1_putRoutedFlit,
       net_routers_router_core_1$EN_in_ports_2_getNonFullVCs,
       net_routers_router_core_1$EN_in_ports_2_putRoutedFlit,
       net_routers_router_core_1$EN_in_ports_3_getNonFullVCs,
       net_routers_router_core_1$EN_in_ports_3_putRoutedFlit,
       net_routers_router_core_1$EN_in_ports_4_getNonFullVCs,
       net_routers_router_core_1$EN_in_ports_4_putRoutedFlit,
       net_routers_router_core_1$EN_out_ports_0_getFlit,
       net_routers_router_core_1$EN_out_ports_0_putNonFullVCs,
       net_routers_router_core_1$EN_out_ports_1_getFlit,
       net_routers_router_core_1$EN_out_ports_1_putNonFullVCs,
       net_routers_router_core_1$EN_out_ports_2_getFlit,
       net_routers_router_core_1$EN_out_ports_2_putNonFullVCs,
       net_routers_router_core_1$EN_out_ports_3_getFlit,
       net_routers_router_core_1$EN_out_ports_3_putNonFullVCs,
       net_routers_router_core_1$EN_out_ports_4_getFlit,
       net_routers_router_core_1$EN_out_ports_4_putNonFullVCs;
  // ports of submodule net_routers_router_core_2
  wire [73 : 0] net_routers_router_core_2$in_ports_0_putRoutedFlit_flit_in,
		net_routers_router_core_2$in_ports_1_putRoutedFlit_flit_in,
		net_routers_router_core_2$in_ports_2_putRoutedFlit_flit_in,
		net_routers_router_core_2$in_ports_3_putRoutedFlit_flit_in,
		net_routers_router_core_2$in_ports_4_putRoutedFlit_flit_in;
  wire [70 : 0] net_routers_router_core_2$out_ports_0_getFlit,
		net_routers_router_core_2$out_ports_1_getFlit,
		net_routers_router_core_2$out_ports_2_getFlit,
		net_routers_router_core_2$out_ports_3_getFlit,
		net_routers_router_core_2$out_ports_4_getFlit;
  wire [1 : 0] net_routers_router_core_2$in_ports_0_getNonFullVCs,
	       net_routers_router_core_2$in_ports_1_getNonFullVCs,
	       net_routers_router_core_2$in_ports_2_getNonFullVCs,
	       net_routers_router_core_2$in_ports_3_getNonFullVCs,
	       net_routers_router_core_2$in_ports_4_getNonFullVCs,
	       net_routers_router_core_2$out_ports_0_putNonFullVCs_nonFullVCs,
	       net_routers_router_core_2$out_ports_1_putNonFullVCs_nonFullVCs,
	       net_routers_router_core_2$out_ports_2_putNonFullVCs_nonFullVCs,
	       net_routers_router_core_2$out_ports_3_putNonFullVCs_nonFullVCs,
	       net_routers_router_core_2$out_ports_4_putNonFullVCs_nonFullVCs;
  wire net_routers_router_core_2$EN_in_ports_0_getNonFullVCs,
       net_routers_router_core_2$EN_in_ports_0_putRoutedFlit,
       net_routers_router_core_2$EN_in_ports_1_getNonFullVCs,
       net_routers_router_core_2$EN_in_ports_1_putRoutedFlit,
       net_routers_router_core_2$EN_in_ports_2_getNonFullVCs,
       net_routers_router_core_2$EN_in_ports_2_putRoutedFlit,
       net_routers_router_core_2$EN_in_ports_3_getNonFullVCs,
       net_routers_router_core_2$EN_in_ports_3_putRoutedFlit,
       net_routers_router_core_2$EN_in_ports_4_getNonFullVCs,
       net_routers_router_core_2$EN_in_ports_4_putRoutedFlit,
       net_routers_router_core_2$EN_out_ports_0_getFlit,
       net_routers_router_core_2$EN_out_ports_0_putNonFullVCs,
       net_routers_router_core_2$EN_out_ports_1_getFlit,
       net_routers_router_core_2$EN_out_ports_1_putNonFullVCs,
       net_routers_router_core_2$EN_out_ports_2_getFlit,
       net_routers_router_core_2$EN_out_ports_2_putNonFullVCs,
       net_routers_router_core_2$EN_out_ports_3_getFlit,
       net_routers_router_core_2$EN_out_ports_3_putNonFullVCs,
       net_routers_router_core_2$EN_out_ports_4_getFlit,
       net_routers_router_core_2$EN_out_ports_4_putNonFullVCs;
  // ports of submodule net_routers_router_core_3
  wire [73 : 0] net_routers_router_core_3$in_ports_0_putRoutedFlit_flit_in,
		net_routers_router_core_3$in_ports_1_putRoutedFlit_flit_in,
		net_routers_router_core_3$in_ports_2_putRoutedFlit_flit_in,
		net_routers_router_core_3$in_ports_3_putRoutedFlit_flit_in,
		net_routers_router_core_3$in_ports_4_putRoutedFlit_flit_in;
  wire [70 : 0] net_routers_router_core_3$out_ports_0_getFlit,
		net_routers_router_core_3$out_ports_1_getFlit,
		net_routers_router_core_3$out_ports_2_getFlit,
		net_routers_router_core_3$out_ports_3_getFlit,
		net_routers_router_core_3$out_ports_4_getFlit;
  wire [1 : 0] net_routers_router_core_3$in_ports_0_getNonFullVCs,
	       net_routers_router_core_3$in_ports_1_getNonFullVCs,
	       net_routers_router_core_3$in_ports_2_getNonFullVCs,
	       net_routers_router_core_3$in_ports_3_getNonFullVCs,
	       net_routers_router_core_3$in_ports_4_getNonFullVCs,
	       net_routers_router_core_3$out_ports_0_putNonFullVCs_nonFullVCs,
	       net_routers_router_core_3$out_ports_1_putNonFullVCs_nonFullVCs,
	       net_routers_router_core_3$out_ports_2_putNonFullVCs_nonFullVCs,
	       net_routers_router_core_3$out_ports_3_putNonFullVCs_nonFullVCs,
	       net_routers_router_core_3$out_ports_4_putNonFullVCs_nonFullVCs;
  wire net_routers_router_core_3$EN_in_ports_0_getNonFullVCs,
       net_routers_router_core_3$EN_in_ports_0_putRoutedFlit,
       net_routers_router_core_3$EN_in_ports_1_getNonFullVCs,
       net_routers_router_core_3$EN_in_ports_1_putRoutedFlit,
       net_routers_router_core_3$EN_in_ports_2_getNonFullVCs,
       net_routers_router_core_3$EN_in_ports_2_putRoutedFlit,
       net_routers_router_core_3$EN_in_ports_3_getNonFullVCs,
       net_routers_router_core_3$EN_in_ports_3_putRoutedFlit,
       net_routers_router_core_3$EN_in_ports_4_getNonFullVCs,
       net_routers_router_core_3$EN_in_ports_4_putRoutedFlit,
       net_routers_router_core_3$EN_out_ports_0_getFlit,
       net_routers_router_core_3$EN_out_ports_0_putNonFullVCs,
       net_routers_router_core_3$EN_out_ports_1_getFlit,
       net_routers_router_core_3$EN_out_ports_1_putNonFullVCs,
       net_routers_router_core_3$EN_out_ports_2_getFlit,
       net_routers_router_core_3$EN_out_ports_2_putNonFullVCs,
       net_routers_router_core_3$EN_out_ports_3_getFlit,
       net_routers_router_core_3$EN_out_ports_3_putNonFullVCs,
       net_routers_router_core_3$EN_out_ports_4_getFlit,
       net_routers_router_core_3$EN_out_ports_4_putNonFullVCs;
  // actionvalue method send_ports_0_getNonFullVCs
  assign send_ports_0_getNonFullVCs =
	     net_routers_router_core$in_ports_0_getNonFullVCs ;
  // actionvalue method send_ports_1_getNonFullVCs
  assign send_ports_1_getNonFullVCs =
	     net_routers_router_core_1$in_ports_0_getNonFullVCs ;
  // actionvalue method send_ports_2_getNonFullVCs
  assign send_ports_2_getNonFullVCs =
	     net_routers_router_core_2$in_ports_0_getNonFullVCs ;
  // actionvalue method send_ports_3_getNonFullVCs
  assign send_ports_3_getNonFullVCs =
	     net_routers_router_core_3$in_ports_0_getNonFullVCs ;
  // actionvalue method send_ports_4_getNonFullVCs
  assign send_ports_4_getNonFullVCs =
	     net_routers_router_core$in_ports_3_getNonFullVCs ;
  // actionvalue method send_ports_5_getNonFullVCs
  assign send_ports_5_getNonFullVCs =
	     net_routers_router_core$in_ports_4_getNonFullVCs ;
  // actionvalue method send_ports_6_getNonFullVCs
  assign send_ports_6_getNonFullVCs =
	     net_routers_router_core_1$in_ports_4_getNonFullVCs ;
  // actionvalue method send_ports_7_getNonFullVCs
  assign send_ports_7_getNonFullVCs =
	     net_routers_router_core_1$in_ports_1_getNonFullVCs ;
  // actionvalue method send_ports_8_getNonFullVCs
  assign send_ports_8_getNonFullVCs =
	     net_routers_router_core_2$in_ports_3_getNonFullVCs ;
  // actionvalue method send_ports_9_getNonFullVCs
  assign send_ports_9_getNonFullVCs =
	     net_routers_router_core_2$in_ports_2_getNonFullVCs ;
  // actionvalue method send_ports_10_getNonFullVCs
  assign send_ports_10_getNonFullVCs =
	     net_routers_router_core_3$in_ports_1_getNonFullVCs ;
  // actionvalue method send_ports_11_getNonFullVCs
  assign send_ports_11_getNonFullVCs =
	     net_routers_router_core_3$in_ports_2_getNonFullVCs ;
  // actionvalue method recv_ports_0_getFlit
  assign recv_ports_0_getFlit = net_routers_router_core$out_ports_0_getFlit ;
  // actionvalue method recv_ports_1_getFlit
  assign recv_ports_1_getFlit =
	     net_routers_router_core_1$out_ports_0_getFlit ;
  // actionvalue method recv_ports_2_getFlit
  assign recv_ports_2_getFlit =
	     net_routers_router_core_2$out_ports_0_getFlit ;
  // actionvalue method recv_ports_3_getFlit
  assign recv_ports_3_getFlit =
	     net_routers_router_core_3$out_ports_0_getFlit ;
  // actionvalue method recv_ports_4_getFlit
  assign recv_ports_4_getFlit = net_routers_router_core$out_ports_1_getFlit ;
  // actionvalue method recv_ports_5_getFlit
  assign recv_ports_5_getFlit = net_routers_router_core$out_ports_2_getFlit ;
  // actionvalue method recv_ports_6_getFlit
  assign recv_ports_6_getFlit =
	     net_routers_router_core_1$out_ports_2_getFlit ;
  // actionvalue method recv_ports_7_getFlit
  assign recv_ports_7_getFlit =
	     net_routers_router_core_1$out_ports_3_getFlit ;
  // actionvalue method recv_ports_8_getFlit
  assign recv_ports_8_getFlit =
	     net_routers_router_core_2$out_ports_1_getFlit ;
  // actionvalue method recv_ports_9_getFlit
  assign recv_ports_9_getFlit =
	     net_routers_router_core_2$out_ports_4_getFlit ;
  // actionvalue method recv_ports_10_getFlit
  assign recv_ports_10_getFlit =
	     net_routers_router_core_3$out_ports_3_getFlit ;
  // actionvalue method recv_ports_11_getFlit
  assign recv_ports_11_getFlit =
	     net_routers_router_core_3$out_ports_4_getFlit ;
  // value method recv_ports_info_0_getRecvPortID
  assign recv_ports_info_0_getRecvPortID = 4'd0 ;
  // value method recv_ports_info_1_getRecvPortID
  assign recv_ports_info_1_getRecvPortID = 4'd1 ;
  // value method recv_ports_info_2_getRecvPortID
  assign recv_ports_info_2_getRecvPortID = 4'd2 ;
  // value method recv_ports_info_3_getRecvPortID
  assign recv_ports_info_3_getRecvPortID = 4'd3 ;
  // value method recv_ports_info_4_getRecvPortID
  assign recv_ports_info_4_getRecvPortID = 4'd4 ;
  // value method recv_ports_info_5_getRecvPortID
  assign recv_ports_info_5_getRecvPortID = 4'd5 ;
  // value method recv_ports_info_6_getRecvPortID
  assign recv_ports_info_6_getRecvPortID = 4'd6 ;
  // value method recv_ports_info_7_getRecvPortID
  assign recv_ports_info_7_getRecvPortID = 4'd7 ;
  // value method recv_ports_info_8_getRecvPortID
  assign recv_ports_info_8_getRecvPortID = 4'd8 ;
  // value method recv_ports_info_9_getRecvPortID
  assign recv_ports_info_9_getRecvPortID = 4'd9 ;
  // value method recv_ports_info_10_getRecvPortID
  assign recv_ports_info_10_getRecvPortID = 4'd10 ;
  // value method recv_ports_info_11_getRecvPortID
  assign recv_ports_info_11_getRecvPortID = 4'd11 ;
  // submodule net_routers_routeTable_1_rt_ifc_banks_banks_rf
  RegFileLoadSyn #( /*file*/ "mesh_4RTs_2VCs_8BD_64DW_SepIFRoundRobinAlloc_2RTsPerRow_2RTsPerCol_routing_1.hex",
		    /*addr_width*/ 32'd4,
		    /*data_width*/ 32'd3,
		    /*lo*/ 32'd0,
		    /*hi*/ 32'd15,
		    /*binary*/ 32'd0) net_routers_routeTable_1_rt_ifc_banks_banks_rf(.CLK(CLK),
										     .RST_N(RST_N),
										     .ADDR_1(net_routers_routeTable_1_rt_ifc_banks_banks_rf$ADDR_1),
										     .ADDR_IN(net_routers_routeTable_1_rt_ifc_banks_banks_rf$ADDR_IN),
										     .D_IN(net_routers_routeTable_1_rt_ifc_banks_banks_rf$D_IN),
										     .WE(net_routers_routeTable_1_rt_ifc_banks_banks_rf$WE),
										     .D_OUT_1(net_routers_routeTable_1_rt_ifc_banks_banks_rf$D_OUT_1));
  // submodule net_routers_routeTable_1_rt_ifc_banks_banks_rf_1
  RegFileLoadSyn #( /*file*/ "mesh_4RTs_2VCs_8BD_64DW_SepIFRoundRobinAlloc_2RTsPerRow_2RTsPerCol_routing_1.hex",
		    /*addr_width*/ 32'd4,
		    /*data_width*/ 32'd3,
		    /*lo*/ 32'd0,
		    /*hi*/ 32'd15,
		    /*binary*/ 32'd0) net_routers_routeTable_1_rt_ifc_banks_banks_rf_1(.CLK(CLK),
										       .RST_N(RST_N),
										       .ADDR_1(net_routers_routeTable_1_rt_ifc_banks_banks_rf_1$ADDR_1),
										       .ADDR_IN(net_routers_routeTable_1_rt_ifc_banks_banks_rf_1$ADDR_IN),
										       .D_IN(net_routers_routeTable_1_rt_ifc_banks_banks_rf_1$D_IN),
										       .WE(net_routers_routeTable_1_rt_ifc_banks_banks_rf_1$WE),
										       .D_OUT_1(net_routers_routeTable_1_rt_ifc_banks_banks_rf_1$D_OUT_1));
  // submodule net_routers_routeTable_1_rt_ifc_banks_banks_rf_2
  RegFileLoadSyn #( /*file*/ "mesh_4RTs_2VCs_8BD_64DW_SepIFRoundRobinAlloc_2RTsPerRow_2RTsPerCol_routing_1.hex",
		    /*addr_width*/ 32'd4,
		    /*data_width*/ 32'd3,
		    /*lo*/ 32'd0,
		    /*hi*/ 32'd15,
		    /*binary*/ 32'd0) net_routers_routeTable_1_rt_ifc_banks_banks_rf_2(.CLK(CLK),
										       .RST_N(RST_N),
										       .ADDR_1(net_routers_routeTable_1_rt_ifc_banks_banks_rf_2$ADDR_1),
										       .ADDR_IN(net_routers_routeTable_1_rt_ifc_banks_banks_rf_2$ADDR_IN),
										       .D_IN(net_routers_routeTable_1_rt_ifc_banks_banks_rf_2$D_IN),
										       .WE(net_routers_routeTable_1_rt_ifc_banks_banks_rf_2$WE),
										       .D_OUT_1(net_routers_routeTable_1_rt_ifc_banks_banks_rf_2$D_OUT_1));
  // submodule net_routers_routeTable_1_rt_ifc_banks_banks_rf_3
  RegFileLoadSyn #( /*file*/ "mesh_4RTs_2VCs_8BD_64DW_SepIFRoundRobinAlloc_2RTsPerRow_2RTsPerCol_routing_1.hex",
		    /*addr_width*/ 32'd4,
		    /*data_width*/ 32'd3,
		    /*lo*/ 32'd0,
		    /*hi*/ 32'd15,
		    /*binary*/ 32'd0) net_routers_routeTable_1_rt_ifc_banks_banks_rf_3(.CLK(CLK),
										       .RST_N(RST_N),
										       .ADDR_1(net_routers_routeTable_1_rt_ifc_banks_banks_rf_3$ADDR_1),
										       .ADDR_IN(net_routers_routeTable_1_rt_ifc_banks_banks_rf_3$ADDR_IN),
										       .D_IN(net_routers_routeTable_1_rt_ifc_banks_banks_rf_3$D_IN),
										       .WE(net_routers_routeTable_1_rt_ifc_banks_banks_rf_3$WE),
										       .D_OUT_1(net_routers_routeTable_1_rt_ifc_banks_banks_rf_3$D_OUT_1));
  // submodule net_routers_routeTable_1_rt_ifc_banks_banks_rf_4
  RegFileLoadSyn #( /*file*/ "mesh_4RTs_2VCs_8BD_64DW_SepIFRoundRobinAlloc_2RTsPerRow_2RTsPerCol_routing_1.hex",
		    /*addr_width*/ 32'd4,
		    /*data_width*/ 32'd3,
		    /*lo*/ 32'd0,
		    /*hi*/ 32'd15,
		    /*binary*/ 32'd0) net_routers_routeTable_1_rt_ifc_banks_banks_rf_4(.CLK(CLK),
										       .RST_N(RST_N),
										       .ADDR_1(net_routers_routeTable_1_rt_ifc_banks_banks_rf_4$ADDR_1),
										       .ADDR_IN(net_routers_routeTable_1_rt_ifc_banks_banks_rf_4$ADDR_IN),
										       .D_IN(net_routers_routeTable_1_rt_ifc_banks_banks_rf_4$D_IN),
										       .WE(net_routers_routeTable_1_rt_ifc_banks_banks_rf_4$WE),
										       .D_OUT_1(net_routers_routeTable_1_rt_ifc_banks_banks_rf_4$D_OUT_1));
  // submodule net_routers_routeTable_2_rt_ifc_banks_banks_rf
  RegFileLoadSyn #( /*file*/ "mesh_4RTs_2VCs_8BD_64DW_SepIFRoundRobinAlloc_2RTsPerRow_2RTsPerCol_routing_2.hex",
		    /*addr_width*/ 32'd4,
		    /*data_width*/ 32'd3,
		    /*lo*/ 32'd0,
		    /*hi*/ 32'd15,
		    /*binary*/ 32'd0) net_routers_routeTable_2_rt_ifc_banks_banks_rf(.CLK(CLK),
										     .RST_N(RST_N),
										     .ADDR_1(net_routers_routeTable_2_rt_ifc_banks_banks_rf$ADDR_1),
										     .ADDR_IN(net_routers_routeTable_2_rt_ifc_banks_banks_rf$ADDR_IN),
										     .D_IN(net_routers_routeTable_2_rt_ifc_banks_banks_rf$D_IN),
										     .WE(net_routers_routeTable_2_rt_ifc_banks_banks_rf$WE),
										     .D_OUT_1(net_routers_routeTable_2_rt_ifc_banks_banks_rf$D_OUT_1));
  // submodule net_routers_routeTable_2_rt_ifc_banks_banks_rf_1
  RegFileLoadSyn #( /*file*/ "mesh_4RTs_2VCs_8BD_64DW_SepIFRoundRobinAlloc_2RTsPerRow_2RTsPerCol_routing_2.hex",
		    /*addr_width*/ 32'd4,
		    /*data_width*/ 32'd3,
		    /*lo*/ 32'd0,
		    /*hi*/ 32'd15,
		    /*binary*/ 32'd0) net_routers_routeTable_2_rt_ifc_banks_banks_rf_1(.CLK(CLK),
										       .RST_N(RST_N),
										       .ADDR_1(net_routers_routeTable_2_rt_ifc_banks_banks_rf_1$ADDR_1),
										       .ADDR_IN(net_routers_routeTable_2_rt_ifc_banks_banks_rf_1$ADDR_IN),
										       .D_IN(net_routers_routeTable_2_rt_ifc_banks_banks_rf_1$D_IN),
										       .WE(net_routers_routeTable_2_rt_ifc_banks_banks_rf_1$WE),
										       .D_OUT_1(net_routers_routeTable_2_rt_ifc_banks_banks_rf_1$D_OUT_1));
  // submodule net_routers_routeTable_2_rt_ifc_banks_banks_rf_2
  RegFileLoadSyn #( /*file*/ "mesh_4RTs_2VCs_8BD_64DW_SepIFRoundRobinAlloc_2RTsPerRow_2RTsPerCol_routing_2.hex",
		    /*addr_width*/ 32'd4,
		    /*data_width*/ 32'd3,
		    /*lo*/ 32'd0,
		    /*hi*/ 32'd15,
		    /*binary*/ 32'd0) net_routers_routeTable_2_rt_ifc_banks_banks_rf_2(.CLK(CLK),
										       .RST_N(RST_N),
										       .ADDR_1(net_routers_routeTable_2_rt_ifc_banks_banks_rf_2$ADDR_1),
										       .ADDR_IN(net_routers_routeTable_2_rt_ifc_banks_banks_rf_2$ADDR_IN),
										       .D_IN(net_routers_routeTable_2_rt_ifc_banks_banks_rf_2$D_IN),
										       .WE(net_routers_routeTable_2_rt_ifc_banks_banks_rf_2$WE),
										       .D_OUT_1(net_routers_routeTable_2_rt_ifc_banks_banks_rf_2$D_OUT_1));
  // submodule net_routers_routeTable_2_rt_ifc_banks_banks_rf_3
  RegFileLoadSyn #( /*file*/ "mesh_4RTs_2VCs_8BD_64DW_SepIFRoundRobinAlloc_2RTsPerRow_2RTsPerCol_routing_2.hex",
		    /*addr_width*/ 32'd4,
		    /*data_width*/ 32'd3,
		    /*lo*/ 32'd0,
		    /*hi*/ 32'd15,
		    /*binary*/ 32'd0) net_routers_routeTable_2_rt_ifc_banks_banks_rf_3(.CLK(CLK),
										       .RST_N(RST_N),
										       .ADDR_1(net_routers_routeTable_2_rt_ifc_banks_banks_rf_3$ADDR_1),
										       .ADDR_IN(net_routers_routeTable_2_rt_ifc_banks_banks_rf_3$ADDR_IN),
										       .D_IN(net_routers_routeTable_2_rt_ifc_banks_banks_rf_3$D_IN),
										       .WE(net_routers_routeTable_2_rt_ifc_banks_banks_rf_3$WE),
										       .D_OUT_1(net_routers_routeTable_2_rt_ifc_banks_banks_rf_3$D_OUT_1));
  // submodule net_routers_routeTable_2_rt_ifc_banks_banks_rf_4
  RegFileLoadSyn #( /*file*/ "mesh_4RTs_2VCs_8BD_64DW_SepIFRoundRobinAlloc_2RTsPerRow_2RTsPerCol_routing_2.hex",
		    /*addr_width*/ 32'd4,
		    /*data_width*/ 32'd3,
		    /*lo*/ 32'd0,
		    /*hi*/ 32'd15,
		    /*binary*/ 32'd0) net_routers_routeTable_2_rt_ifc_banks_banks_rf_4(.CLK(CLK),
										       .RST_N(RST_N),
										       .ADDR_1(net_routers_routeTable_2_rt_ifc_banks_banks_rf_4$ADDR_1),
										       .ADDR_IN(net_routers_routeTable_2_rt_ifc_banks_banks_rf_4$ADDR_IN),
										       .D_IN(net_routers_routeTable_2_rt_ifc_banks_banks_rf_4$D_IN),
										       .WE(net_routers_routeTable_2_rt_ifc_banks_banks_rf_4$WE),
										       .D_OUT_1(net_routers_routeTable_2_rt_ifc_banks_banks_rf_4$D_OUT_1));
  // submodule net_routers_routeTable_3_rt_ifc_banks_banks_rf
  RegFileLoadSyn #( /*file*/ "mesh_4RTs_2VCs_8BD_64DW_SepIFRoundRobinAlloc_2RTsPerRow_2RTsPerCol_routing_3.hex",
		    /*addr_width*/ 32'd4,
		    /*data_width*/ 32'd3,
		    /*lo*/ 32'd0,
		    /*hi*/ 32'd15,
		    /*binary*/ 32'd0) net_routers_routeTable_3_rt_ifc_banks_banks_rf(.CLK(CLK),
										     .RST_N(RST_N),
										     .ADDR_1(net_routers_routeTable_3_rt_ifc_banks_banks_rf$ADDR_1),
										     .ADDR_IN(net_routers_routeTable_3_rt_ifc_banks_banks_rf$ADDR_IN),
										     .D_IN(net_routers_routeTable_3_rt_ifc_banks_banks_rf$D_IN),
										     .WE(net_routers_routeTable_3_rt_ifc_banks_banks_rf$WE),
										     .D_OUT_1(net_routers_routeTable_3_rt_ifc_banks_banks_rf$D_OUT_1));
  // submodule net_routers_routeTable_3_rt_ifc_banks_banks_rf_1
  RegFileLoadSyn #( /*file*/ "mesh_4RTs_2VCs_8BD_64DW_SepIFRoundRobinAlloc_2RTsPerRow_2RTsPerCol_routing_3.hex",
		    /*addr_width*/ 32'd4,
		    /*data_width*/ 32'd3,
		    /*lo*/ 32'd0,
		    /*hi*/ 32'd15,
		    /*binary*/ 32'd0) net_routers_routeTable_3_rt_ifc_banks_banks_rf_1(.CLK(CLK),
										       .RST_N(RST_N),
										       .ADDR_1(net_routers_routeTable_3_rt_ifc_banks_banks_rf_1$ADDR_1),
										       .ADDR_IN(net_routers_routeTable_3_rt_ifc_banks_banks_rf_1$ADDR_IN),
										       .D_IN(net_routers_routeTable_3_rt_ifc_banks_banks_rf_1$D_IN),
										       .WE(net_routers_routeTable_3_rt_ifc_banks_banks_rf_1$WE),
										       .D_OUT_1(net_routers_routeTable_3_rt_ifc_banks_banks_rf_1$D_OUT_1));
  // submodule net_routers_routeTable_3_rt_ifc_banks_banks_rf_2
  RegFileLoadSyn #( /*file*/ "mesh_4RTs_2VCs_8BD_64DW_SepIFRoundRobinAlloc_2RTsPerRow_2RTsPerCol_routing_3.hex",
		    /*addr_width*/ 32'd4,
		    /*data_width*/ 32'd3,
		    /*lo*/ 32'd0,
		    /*hi*/ 32'd15,
		    /*binary*/ 32'd0) net_routers_routeTable_3_rt_ifc_banks_banks_rf_2(.CLK(CLK),
										       .RST_N(RST_N),
										       .ADDR_1(net_routers_routeTable_3_rt_ifc_banks_banks_rf_2$ADDR_1),
										       .ADDR_IN(net_routers_routeTable_3_rt_ifc_banks_banks_rf_2$ADDR_IN),
										       .D_IN(net_routers_routeTable_3_rt_ifc_banks_banks_rf_2$D_IN),
										       .WE(net_routers_routeTable_3_rt_ifc_banks_banks_rf_2$WE),
										       .D_OUT_1(net_routers_routeTable_3_rt_ifc_banks_banks_rf_2$D_OUT_1));
  // submodule net_routers_routeTable_3_rt_ifc_banks_banks_rf_3
  RegFileLoadSyn #( /*file*/ "mesh_4RTs_2VCs_8BD_64DW_SepIFRoundRobinAlloc_2RTsPerRow_2RTsPerCol_routing_3.hex",
		    /*addr_width*/ 32'd4,
		    /*data_width*/ 32'd3,
		    /*lo*/ 32'd0,
		    /*hi*/ 32'd15,
		    /*binary*/ 32'd0) net_routers_routeTable_3_rt_ifc_banks_banks_rf_3(.CLK(CLK),
										       .RST_N(RST_N),
										       .ADDR_1(net_routers_routeTable_3_rt_ifc_banks_banks_rf_3$ADDR_1),
										       .ADDR_IN(net_routers_routeTable_3_rt_ifc_banks_banks_rf_3$ADDR_IN),
										       .D_IN(net_routers_routeTable_3_rt_ifc_banks_banks_rf_3$D_IN),
										       .WE(net_routers_routeTable_3_rt_ifc_banks_banks_rf_3$WE),
										       .D_OUT_1(net_routers_routeTable_3_rt_ifc_banks_banks_rf_3$D_OUT_1));
  // submodule net_routers_routeTable_3_rt_ifc_banks_banks_rf_4
  RegFileLoadSyn #( /*file*/ "mesh_4RTs_2VCs_8BD_64DW_SepIFRoundRobinAlloc_2RTsPerRow_2RTsPerCol_routing_3.hex",
		    /*addr_width*/ 32'd4,
		    /*data_width*/ 32'd3,
		    /*lo*/ 32'd0,
		    /*hi*/ 32'd15,
		    /*binary*/ 32'd0) net_routers_routeTable_3_rt_ifc_banks_banks_rf_4(.CLK(CLK),
										       .RST_N(RST_N),
										       .ADDR_1(net_routers_routeTable_3_rt_ifc_banks_banks_rf_4$ADDR_1),
										       .ADDR_IN(net_routers_routeTable_3_rt_ifc_banks_banks_rf_4$ADDR_IN),
										       .D_IN(net_routers_routeTable_3_rt_ifc_banks_banks_rf_4$D_IN),
										       .WE(net_routers_routeTable_3_rt_ifc_banks_banks_rf_4$WE),
										       .D_OUT_1(net_routers_routeTable_3_rt_ifc_banks_banks_rf_4$D_OUT_1));
  // submodule net_routers_routeTable_rt_ifc_banks_banks_rf
  RegFileLoadSyn #( /*file*/ "mesh_4RTs_2VCs_8BD_64DW_SepIFRoundRobinAlloc_2RTsPerRow_2RTsPerCol_routing_0.hex",
		    /*addr_width*/ 32'd4,
		    /*data_width*/ 32'd3,
		    /*lo*/ 32'd0,
		    /*hi*/ 32'd15,
		    /*binary*/ 32'd0) net_routers_routeTable_rt_ifc_banks_banks_rf(.CLK(CLK),
										   .RST_N(RST_N),
										   .ADDR_1(net_routers_routeTable_rt_ifc_banks_banks_rf$ADDR_1),
										   .ADDR_IN(net_routers_routeTable_rt_ifc_banks_banks_rf$ADDR_IN),
										   .D_IN(net_routers_routeTable_rt_ifc_banks_banks_rf$D_IN),
										   .WE(net_routers_routeTable_rt_ifc_banks_banks_rf$WE),
										   .D_OUT_1(net_routers_routeTable_rt_ifc_banks_banks_rf$D_OUT_1));
  // submodule net_routers_routeTable_rt_ifc_banks_banks_rf_1
  RegFileLoadSyn #( /*file*/ "mesh_4RTs_2VCs_8BD_64DW_SepIFRoundRobinAlloc_2RTsPerRow_2RTsPerCol_routing_0.hex",
		    /*addr_width*/ 32'd4,
		    /*data_width*/ 32'd3,
		    /*lo*/ 32'd0,
		    /*hi*/ 32'd15,
		    /*binary*/ 32'd0) net_routers_routeTable_rt_ifc_banks_banks_rf_1(.CLK(CLK),
										     .RST_N(RST_N),
										     .ADDR_1(net_routers_routeTable_rt_ifc_banks_banks_rf_1$ADDR_1),
										     .ADDR_IN(net_routers_routeTable_rt_ifc_banks_banks_rf_1$ADDR_IN),
										     .D_IN(net_routers_routeTable_rt_ifc_banks_banks_rf_1$D_IN),
										     .WE(net_routers_routeTable_rt_ifc_banks_banks_rf_1$WE),
										     .D_OUT_1(net_routers_routeTable_rt_ifc_banks_banks_rf_1$D_OUT_1));
  // submodule net_routers_routeTable_rt_ifc_banks_banks_rf_2
  RegFileLoadSyn #( /*file*/ "mesh_4RTs_2VCs_8BD_64DW_SepIFRoundRobinAlloc_2RTsPerRow_2RTsPerCol_routing_0.hex",
		    /*addr_width*/ 32'd4,
		    /*data_width*/ 32'd3,
		    /*lo*/ 32'd0,
		    /*hi*/ 32'd15,
		    /*binary*/ 32'd0) net_routers_routeTable_rt_ifc_banks_banks_rf_2(.CLK(CLK),
										     .RST_N(RST_N),
										     .ADDR_1(net_routers_routeTable_rt_ifc_banks_banks_rf_2$ADDR_1),
										     .ADDR_IN(net_routers_routeTable_rt_ifc_banks_banks_rf_2$ADDR_IN),
										     .D_IN(net_routers_routeTable_rt_ifc_banks_banks_rf_2$D_IN),
										     .WE(net_routers_routeTable_rt_ifc_banks_banks_rf_2$WE),
										     .D_OUT_1(net_routers_routeTable_rt_ifc_banks_banks_rf_2$D_OUT_1));
  // submodule net_routers_routeTable_rt_ifc_banks_banks_rf_3
  RegFileLoadSyn #( /*file*/ "mesh_4RTs_2VCs_8BD_64DW_SepIFRoundRobinAlloc_2RTsPerRow_2RTsPerCol_routing_0.hex",
		    /*addr_width*/ 32'd4,
		    /*data_width*/ 32'd3,
		    /*lo*/ 32'd0,
		    /*hi*/ 32'd15,
		    /*binary*/ 32'd0) net_routers_routeTable_rt_ifc_banks_banks_rf_3(.CLK(CLK),
										     .RST_N(RST_N),
										     .ADDR_1(net_routers_routeTable_rt_ifc_banks_banks_rf_3$ADDR_1),
										     .ADDR_IN(net_routers_routeTable_rt_ifc_banks_banks_rf_3$ADDR_IN),
										     .D_IN(net_routers_routeTable_rt_ifc_banks_banks_rf_3$D_IN),
										     .WE(net_routers_routeTable_rt_ifc_banks_banks_rf_3$WE),
										     .D_OUT_1(net_routers_routeTable_rt_ifc_banks_banks_rf_3$D_OUT_1));
  // submodule net_routers_routeTable_rt_ifc_banks_banks_rf_4
  RegFileLoadSyn #( /*file*/ "mesh_4RTs_2VCs_8BD_64DW_SepIFRoundRobinAlloc_2RTsPerRow_2RTsPerCol_routing_0.hex",
		    /*addr_width*/ 32'd4,
		    /*data_width*/ 32'd3,
		    /*lo*/ 32'd0,
		    /*hi*/ 32'd15,
		    /*binary*/ 32'd0) net_routers_routeTable_rt_ifc_banks_banks_rf_4(.CLK(CLK),
										     .RST_N(RST_N),
										     .ADDR_1(net_routers_routeTable_rt_ifc_banks_banks_rf_4$ADDR_1),
										     .ADDR_IN(net_routers_routeTable_rt_ifc_banks_banks_rf_4$ADDR_IN),
										     .D_IN(net_routers_routeTable_rt_ifc_banks_banks_rf_4$D_IN),
										     .WE(net_routers_routeTable_rt_ifc_banks_banks_rf_4$WE),
										     .D_OUT_1(net_routers_routeTable_rt_ifc_banks_banks_rf_4$D_OUT_1));
  // submodule net_routers_router_core
  mkRouterCoreSimple net_routers_router_core(.CLK(CLK),
					     .RST_N(RST_N),
					     .in_ports_0_putRoutedFlit_flit_in(net_routers_router_core$in_ports_0_putRoutedFlit_flit_in),
					     .in_ports_1_putRoutedFlit_flit_in(net_routers_router_core$in_ports_1_putRoutedFlit_flit_in),
					     .in_ports_2_putRoutedFlit_flit_in(net_routers_router_core$in_ports_2_putRoutedFlit_flit_in),
					     .in_ports_3_putRoutedFlit_flit_in(net_routers_router_core$in_ports_3_putRoutedFlit_flit_in),
					     .in_ports_4_putRoutedFlit_flit_in(net_routers_router_core$in_ports_4_putRoutedFlit_flit_in),
					     .out_ports_0_putNonFullVCs_nonFullVCs(net_routers_router_core$out_ports_0_putNonFullVCs_nonFullVCs),
					     .out_ports_1_putNonFullVCs_nonFullVCs(net_routers_router_core$out_ports_1_putNonFullVCs_nonFullVCs),
					     .out_ports_2_putNonFullVCs_nonFullVCs(net_routers_router_core$out_ports_2_putNonFullVCs_nonFullVCs),
					     .out_ports_3_putNonFullVCs_nonFullVCs(net_routers_router_core$out_ports_3_putNonFullVCs_nonFullVCs),
					     .out_ports_4_putNonFullVCs_nonFullVCs(net_routers_router_core$out_ports_4_putNonFullVCs_nonFullVCs),
					     .EN_in_ports_0_putRoutedFlit(net_routers_router_core$EN_in_ports_0_putRoutedFlit),
					     .EN_in_ports_0_getNonFullVCs(net_routers_router_core$EN_in_ports_0_getNonFullVCs),
					     .EN_in_ports_1_putRoutedFlit(net_routers_router_core$EN_in_ports_1_putRoutedFlit),
					     .EN_in_ports_1_getNonFullVCs(net_routers_router_core$EN_in_ports_1_getNonFullVCs),
					     .EN_in_ports_2_putRoutedFlit(net_routers_router_core$EN_in_ports_2_putRoutedFlit),
					     .EN_in_ports_2_getNonFullVCs(net_routers_router_core$EN_in_ports_2_getNonFullVCs),
					     .EN_in_ports_3_putRoutedFlit(net_routers_router_core$EN_in_ports_3_putRoutedFlit),
					     .EN_in_ports_3_getNonFullVCs(net_routers_router_core$EN_in_ports_3_getNonFullVCs),
					     .EN_in_ports_4_putRoutedFlit(net_routers_router_core$EN_in_ports_4_putRoutedFlit),
					     .EN_in_ports_4_getNonFullVCs(net_routers_router_core$EN_in_ports_4_getNonFullVCs),
					     .EN_out_ports_0_getFlit(net_routers_router_core$EN_out_ports_0_getFlit),
					     .EN_out_ports_0_putNonFullVCs(net_routers_router_core$EN_out_ports_0_putNonFullVCs),
					     .EN_out_ports_1_getFlit(net_routers_router_core$EN_out_ports_1_getFlit),
					     .EN_out_ports_1_putNonFullVCs(net_routers_router_core$EN_out_ports_1_putNonFullVCs),
					     .EN_out_ports_2_getFlit(net_routers_router_core$EN_out_ports_2_getFlit),
					     .EN_out_ports_2_putNonFullVCs(net_routers_router_core$EN_out_ports_2_putNonFullVCs),
					     .EN_out_ports_3_getFlit(net_routers_router_core$EN_out_ports_3_getFlit),
					     .EN_out_ports_3_putNonFullVCs(net_routers_router_core$EN_out_ports_3_putNonFullVCs),
					     .EN_out_ports_4_getFlit(net_routers_router_core$EN_out_ports_4_getFlit),
					     .EN_out_ports_4_putNonFullVCs(net_routers_router_core$EN_out_ports_4_putNonFullVCs),
					     .in_ports_0_getNonFullVCs(net_routers_router_core$in_ports_0_getNonFullVCs),
					     .in_ports_1_getNonFullVCs(net_routers_router_core$in_ports_1_getNonFullVCs),
					     .in_ports_2_getNonFullVCs(net_routers_router_core$in_ports_2_getNonFullVCs),
					     .in_ports_3_getNonFullVCs(net_routers_router_core$in_ports_3_getNonFullVCs),
					     .in_ports_4_getNonFullVCs(net_routers_router_core$in_ports_4_getNonFullVCs),
					     .out_ports_0_getFlit(net_routers_router_core$out_ports_0_getFlit),
					     .out_ports_1_getFlit(net_routers_router_core$out_ports_1_getFlit),
					     .out_ports_2_getFlit(net_routers_router_core$out_ports_2_getFlit),
					     .out_ports_3_getFlit(net_routers_router_core$out_ports_3_getFlit),
					     .out_ports_4_getFlit(net_routers_router_core$out_ports_4_getFlit));
  // submodule net_routers_router_core_1
  mkRouterCoreSimple net_routers_router_core_1(.CLK(CLK),
					       .RST_N(RST_N),
					       .in_ports_0_putRoutedFlit_flit_in(net_routers_router_core_1$in_ports_0_putRoutedFlit_flit_in),
					       .in_ports_1_putRoutedFlit_flit_in(net_routers_router_core_1$in_ports_1_putRoutedFlit_flit_in),
					       .in_ports_2_putRoutedFlit_flit_in(net_routers_router_core_1$in_ports_2_putRoutedFlit_flit_in),
					       .in_ports_3_putRoutedFlit_flit_in(net_routers_router_core_1$in_ports_3_putRoutedFlit_flit_in),
					       .in_ports_4_putRoutedFlit_flit_in(net_routers_router_core_1$in_ports_4_putRoutedFlit_flit_in),
					       .out_ports_0_putNonFullVCs_nonFullVCs(net_routers_router_core_1$out_ports_0_putNonFullVCs_nonFullVCs),
					       .out_ports_1_putNonFullVCs_nonFullVCs(net_routers_router_core_1$out_ports_1_putNonFullVCs_nonFullVCs),
					       .out_ports_2_putNonFullVCs_nonFullVCs(net_routers_router_core_1$out_ports_2_putNonFullVCs_nonFullVCs),
					       .out_ports_3_putNonFullVCs_nonFullVCs(net_routers_router_core_1$out_ports_3_putNonFullVCs_nonFullVCs),
					       .out_ports_4_putNonFullVCs_nonFullVCs(net_routers_router_core_1$out_ports_4_putNonFullVCs_nonFullVCs),
					       .EN_in_ports_0_putRoutedFlit(net_routers_router_core_1$EN_in_ports_0_putRoutedFlit),
					       .EN_in_ports_0_getNonFullVCs(net_routers_router_core_1$EN_in_ports_0_getNonFullVCs),
					       .EN_in_ports_1_putRoutedFlit(net_routers_router_core_1$EN_in_ports_1_putRoutedFlit),
					       .EN_in_ports_1_getNonFullVCs(net_routers_router_core_1$EN_in_ports_1_getNonFullVCs),
					       .EN_in_ports_2_putRoutedFlit(net_routers_router_core_1$EN_in_ports_2_putRoutedFlit),
					       .EN_in_ports_2_getNonFullVCs(net_routers_router_core_1$EN_in_ports_2_getNonFullVCs),
					       .EN_in_ports_3_putRoutedFlit(net_routers_router_core_1$EN_in_ports_3_putRoutedFlit),
					       .EN_in_ports_3_getNonFullVCs(net_routers_router_core_1$EN_in_ports_3_getNonFullVCs),
					       .EN_in_ports_4_putRoutedFlit(net_routers_router_core_1$EN_in_ports_4_putRoutedFlit),
					       .EN_in_ports_4_getNonFullVCs(net_routers_router_core_1$EN_in_ports_4_getNonFullVCs),
					       .EN_out_ports_0_getFlit(net_routers_router_core_1$EN_out_ports_0_getFlit),
					       .EN_out_ports_0_putNonFullVCs(net_routers_router_core_1$EN_out_ports_0_putNonFullVCs),
					       .EN_out_ports_1_getFlit(net_routers_router_core_1$EN_out_ports_1_getFlit),
					       .EN_out_ports_1_putNonFullVCs(net_routers_router_core_1$EN_out_ports_1_putNonFullVCs),
					       .EN_out_ports_2_getFlit(net_routers_router_core_1$EN_out_ports_2_getFlit),
					       .EN_out_ports_2_putNonFullVCs(net_routers_router_core_1$EN_out_ports_2_putNonFullVCs),
					       .EN_out_ports_3_getFlit(net_routers_router_core_1$EN_out_ports_3_getFlit),
					       .EN_out_ports_3_putNonFullVCs(net_routers_router_core_1$EN_out_ports_3_putNonFullVCs),
					       .EN_out_ports_4_getFlit(net_routers_router_core_1$EN_out_ports_4_getFlit),
					       .EN_out_ports_4_putNonFullVCs(net_routers_router_core_1$EN_out_ports_4_putNonFullVCs),
					       .in_ports_0_getNonFullVCs(net_routers_router_core_1$in_ports_0_getNonFullVCs),
					       .in_ports_1_getNonFullVCs(net_routers_router_core_1$in_ports_1_getNonFullVCs),
					       .in_ports_2_getNonFullVCs(net_routers_router_core_1$in_ports_2_getNonFullVCs),
					       .in_ports_3_getNonFullVCs(net_routers_router_core_1$in_ports_3_getNonFullVCs),
					       .in_ports_4_getNonFullVCs(net_routers_router_core_1$in_ports_4_getNonFullVCs),
					       .out_ports_0_getFlit(net_routers_router_core_1$out_ports_0_getFlit),
					       .out_ports_1_getFlit(net_routers_router_core_1$out_ports_1_getFlit),
					       .out_ports_2_getFlit(net_routers_router_core_1$out_ports_2_getFlit),
					       .out_ports_3_getFlit(net_routers_router_core_1$out_ports_3_getFlit),
					       .out_ports_4_getFlit(net_routers_router_core_1$out_ports_4_getFlit));
  // submodule net_routers_router_core_2
  mkRouterCoreSimple net_routers_router_core_2(.CLK(CLK),
					       .RST_N(RST_N),
					       .in_ports_0_putRoutedFlit_flit_in(net_routers_router_core_2$in_ports_0_putRoutedFlit_flit_in),
					       .in_ports_1_putRoutedFlit_flit_in(net_routers_router_core_2$in_ports_1_putRoutedFlit_flit_in),
					       .in_ports_2_putRoutedFlit_flit_in(net_routers_router_core_2$in_ports_2_putRoutedFlit_flit_in),
					       .in_ports_3_putRoutedFlit_flit_in(net_routers_router_core_2$in_ports_3_putRoutedFlit_flit_in),
					       .in_ports_4_putRoutedFlit_flit_in(net_routers_router_core_2$in_ports_4_putRoutedFlit_flit_in),
					       .out_ports_0_putNonFullVCs_nonFullVCs(net_routers_router_core_2$out_ports_0_putNonFullVCs_nonFullVCs),
					       .out_ports_1_putNonFullVCs_nonFullVCs(net_routers_router_core_2$out_ports_1_putNonFullVCs_nonFullVCs),
					       .out_ports_2_putNonFullVCs_nonFullVCs(net_routers_router_core_2$out_ports_2_putNonFullVCs_nonFullVCs),
					       .out_ports_3_putNonFullVCs_nonFullVCs(net_routers_router_core_2$out_ports_3_putNonFullVCs_nonFullVCs),
					       .out_ports_4_putNonFullVCs_nonFullVCs(net_routers_router_core_2$out_ports_4_putNonFullVCs_nonFullVCs),
					       .EN_in_ports_0_putRoutedFlit(net_routers_router_core_2$EN_in_ports_0_putRoutedFlit),
					       .EN_in_ports_0_getNonFullVCs(net_routers_router_core_2$EN_in_ports_0_getNonFullVCs),
					       .EN_in_ports_1_putRoutedFlit(net_routers_router_core_2$EN_in_ports_1_putRoutedFlit),
					       .EN_in_ports_1_getNonFullVCs(net_routers_router_core_2$EN_in_ports_1_getNonFullVCs),
					       .EN_in_ports_2_putRoutedFlit(net_routers_router_core_2$EN_in_ports_2_putRoutedFlit),
					       .EN_in_ports_2_getNonFullVCs(net_routers_router_core_2$EN_in_ports_2_getNonFullVCs),
					       .EN_in_ports_3_putRoutedFlit(net_routers_router_core_2$EN_in_ports_3_putRoutedFlit),
					       .EN_in_ports_3_getNonFullVCs(net_routers_router_core_2$EN_in_ports_3_getNonFullVCs),
					       .EN_in_ports_4_putRoutedFlit(net_routers_router_core_2$EN_in_ports_4_putRoutedFlit),
					       .EN_in_ports_4_getNonFullVCs(net_routers_router_core_2$EN_in_ports_4_getNonFullVCs),
					       .EN_out_ports_0_getFlit(net_routers_router_core_2$EN_out_ports_0_getFlit),
					       .EN_out_ports_0_putNonFullVCs(net_routers_router_core_2$EN_out_ports_0_putNonFullVCs),
					       .EN_out_ports_1_getFlit(net_routers_router_core_2$EN_out_ports_1_getFlit),
					       .EN_out_ports_1_putNonFullVCs(net_routers_router_core_2$EN_out_ports_1_putNonFullVCs),
					       .EN_out_ports_2_getFlit(net_routers_router_core_2$EN_out_ports_2_getFlit),
					       .EN_out_ports_2_putNonFullVCs(net_routers_router_core_2$EN_out_ports_2_putNonFullVCs),
					       .EN_out_ports_3_getFlit(net_routers_router_core_2$EN_out_ports_3_getFlit),
					       .EN_out_ports_3_putNonFullVCs(net_routers_router_core_2$EN_out_ports_3_putNonFullVCs),
					       .EN_out_ports_4_getFlit(net_routers_router_core_2$EN_out_ports_4_getFlit),
					       .EN_out_ports_4_putNonFullVCs(net_routers_router_core_2$EN_out_ports_4_putNonFullVCs),
					       .in_ports_0_getNonFullVCs(net_routers_router_core_2$in_ports_0_getNonFullVCs),
					       .in_ports_1_getNonFullVCs(net_routers_router_core_2$in_ports_1_getNonFullVCs),
					       .in_ports_2_getNonFullVCs(net_routers_router_core_2$in_ports_2_getNonFullVCs),
					       .in_ports_3_getNonFullVCs(net_routers_router_core_2$in_ports_3_getNonFullVCs),
					       .in_ports_4_getNonFullVCs(net_routers_router_core_2$in_ports_4_getNonFullVCs),
					       .out_ports_0_getFlit(net_routers_router_core_2$out_ports_0_getFlit),
					       .out_ports_1_getFlit(net_routers_router_core_2$out_ports_1_getFlit),
					       .out_ports_2_getFlit(net_routers_router_core_2$out_ports_2_getFlit),
					       .out_ports_3_getFlit(net_routers_router_core_2$out_ports_3_getFlit),
					       .out_ports_4_getFlit(net_routers_router_core_2$out_ports_4_getFlit));
  // submodule net_routers_router_core_3
  mkRouterCoreSimple net_routers_router_core_3(.CLK(CLK),
					       .RST_N(RST_N),
					       .in_ports_0_putRoutedFlit_flit_in(net_routers_router_core_3$in_ports_0_putRoutedFlit_flit_in),
					       .in_ports_1_putRoutedFlit_flit_in(net_routers_router_core_3$in_ports_1_putRoutedFlit_flit_in),
					       .in_ports_2_putRoutedFlit_flit_in(net_routers_router_core_3$in_ports_2_putRoutedFlit_flit_in),
					       .in_ports_3_putRoutedFlit_flit_in(net_routers_router_core_3$in_ports_3_putRoutedFlit_flit_in),
					       .in_ports_4_putRoutedFlit_flit_in(net_routers_router_core_3$in_ports_4_putRoutedFlit_flit_in),
					       .out_ports_0_putNonFullVCs_nonFullVCs(net_routers_router_core_3$out_ports_0_putNonFullVCs_nonFullVCs),
					       .out_ports_1_putNonFullVCs_nonFullVCs(net_routers_router_core_3$out_ports_1_putNonFullVCs_nonFullVCs),
					       .out_ports_2_putNonFullVCs_nonFullVCs(net_routers_router_core_3$out_ports_2_putNonFullVCs_nonFullVCs),
					       .out_ports_3_putNonFullVCs_nonFullVCs(net_routers_router_core_3$out_ports_3_putNonFullVCs_nonFullVCs),
					       .out_ports_4_putNonFullVCs_nonFullVCs(net_routers_router_core_3$out_ports_4_putNonFullVCs_nonFullVCs),
					       .EN_in_ports_0_putRoutedFlit(net_routers_router_core_3$EN_in_ports_0_putRoutedFlit),
					       .EN_in_ports_0_getNonFullVCs(net_routers_router_core_3$EN_in_ports_0_getNonFullVCs),
					       .EN_in_ports_1_putRoutedFlit(net_routers_router_core_3$EN_in_ports_1_putRoutedFlit),
					       .EN_in_ports_1_getNonFullVCs(net_routers_router_core_3$EN_in_ports_1_getNonFullVCs),
					       .EN_in_ports_2_putRoutedFlit(net_routers_router_core_3$EN_in_ports_2_putRoutedFlit),
					       .EN_in_ports_2_getNonFullVCs(net_routers_router_core_3$EN_in_ports_2_getNonFullVCs),
					       .EN_in_ports_3_putRoutedFlit(net_routers_router_core_3$EN_in_ports_3_putRoutedFlit),
					       .EN_in_ports_3_getNonFullVCs(net_routers_router_core_3$EN_in_ports_3_getNonFullVCs),
					       .EN_in_ports_4_putRoutedFlit(net_routers_router_core_3$EN_in_ports_4_putRoutedFlit),
					       .EN_in_ports_4_getNonFullVCs(net_routers_router_core_3$EN_in_ports_4_getNonFullVCs),
					       .EN_out_ports_0_getFlit(net_routers_router_core_3$EN_out_ports_0_getFlit),
					       .EN_out_ports_0_putNonFullVCs(net_routers_router_core_3$EN_out_ports_0_putNonFullVCs),
					       .EN_out_ports_1_getFlit(net_routers_router_core_3$EN_out_ports_1_getFlit),
					       .EN_out_ports_1_putNonFullVCs(net_routers_router_core_3$EN_out_ports_1_putNonFullVCs),
					       .EN_out_ports_2_getFlit(net_routers_router_core_3$EN_out_ports_2_getFlit),
					       .EN_out_ports_2_putNonFullVCs(net_routers_router_core_3$EN_out_ports_2_putNonFullVCs),
					       .EN_out_ports_3_getFlit(net_routers_router_core_3$EN_out_ports_3_getFlit),
					       .EN_out_ports_3_putNonFullVCs(net_routers_router_core_3$EN_out_ports_3_putNonFullVCs),
					       .EN_out_ports_4_getFlit(net_routers_router_core_3$EN_out_ports_4_getFlit),
					       .EN_out_ports_4_putNonFullVCs(net_routers_router_core_3$EN_out_ports_4_putNonFullVCs),
					       .in_ports_0_getNonFullVCs(net_routers_router_core_3$in_ports_0_getNonFullVCs),
					       .in_ports_1_getNonFullVCs(net_routers_router_core_3$in_ports_1_getNonFullVCs),
					       .in_ports_2_getNonFullVCs(net_routers_router_core_3$in_ports_2_getNonFullVCs),
					       .in_ports_3_getNonFullVCs(net_routers_router_core_3$in_ports_3_getNonFullVCs),
					       .in_ports_4_getNonFullVCs(net_routers_router_core_3$in_ports_4_getNonFullVCs),
					       .out_ports_0_getFlit(net_routers_router_core_3$out_ports_0_getFlit),
					       .out_ports_1_getFlit(net_routers_router_core_3$out_ports_1_getFlit),
					       .out_ports_2_getFlit(net_routers_router_core_3$out_ports_2_getFlit),
					       .out_ports_3_getFlit(net_routers_router_core_3$out_ports_3_getFlit),
					       .out_ports_4_getFlit(net_routers_router_core_3$out_ports_4_getFlit));
  // submodule net_routers_routeTable_1_rt_ifc_banks_banks_rf
  assign net_routers_routeTable_1_rt_ifc_banks_banks_rf$ADDR_1 =
	     send_ports_1_putFlit_flit_in[68:65] ;
  assign net_routers_routeTable_1_rt_ifc_banks_banks_rf$ADDR_IN = 4'h0 ;
  assign net_routers_routeTable_1_rt_ifc_banks_banks_rf$D_IN = 3'h0 ;
  assign net_routers_routeTable_1_rt_ifc_banks_banks_rf$WE = 1'b0 ;
  // submodule net_routers_routeTable_1_rt_ifc_banks_banks_rf_1
  assign net_routers_routeTable_1_rt_ifc_banks_banks_rf_1$ADDR_1 =
	     send_ports_7_putFlit_flit_in[68:65] ;
  assign net_routers_routeTable_1_rt_ifc_banks_banks_rf_1$ADDR_IN = 4'h0 ;
  assign net_routers_routeTable_1_rt_ifc_banks_banks_rf_1$D_IN = 3'h0 ;
  assign net_routers_routeTable_1_rt_ifc_banks_banks_rf_1$WE = 1'b0 ;
  // submodule net_routers_routeTable_1_rt_ifc_banks_banks_rf_2
  assign net_routers_routeTable_1_rt_ifc_banks_banks_rf_2$ADDR_1 =
	     net_routers_router_core_3$out_ports_2_getFlit[68:65] ;
  assign net_routers_routeTable_1_rt_ifc_banks_banks_rf_2$ADDR_IN = 4'h0 ;
  assign net_routers_routeTable_1_rt_ifc_banks_banks_rf_2$D_IN = 3'h0 ;
  assign net_routers_routeTable_1_rt_ifc_banks_banks_rf_2$WE = 1'b0 ;
  // submodule net_routers_routeTable_1_rt_ifc_banks_banks_rf_3
  assign net_routers_routeTable_1_rt_ifc_banks_banks_rf_3$ADDR_1 =
	     net_routers_router_core$out_ports_3_getFlit[68:65] ;
  assign net_routers_routeTable_1_rt_ifc_banks_banks_rf_3$ADDR_IN = 4'h0 ;
  assign net_routers_routeTable_1_rt_ifc_banks_banks_rf_3$D_IN = 3'h0 ;
  assign net_routers_routeTable_1_rt_ifc_banks_banks_rf_3$WE = 1'b0 ;
  // submodule net_routers_routeTable_1_rt_ifc_banks_banks_rf_4
  assign net_routers_routeTable_1_rt_ifc_banks_banks_rf_4$ADDR_1 =
	     send_ports_6_putFlit_flit_in[68:65] ;
  assign net_routers_routeTable_1_rt_ifc_banks_banks_rf_4$ADDR_IN = 4'h0 ;
  assign net_routers_routeTable_1_rt_ifc_banks_banks_rf_4$D_IN = 3'h0 ;
  assign net_routers_routeTable_1_rt_ifc_banks_banks_rf_4$WE = 1'b0 ;
  // submodule net_routers_routeTable_2_rt_ifc_banks_banks_rf
  assign net_routers_routeTable_2_rt_ifc_banks_banks_rf$ADDR_1 =
	     send_ports_2_putFlit_flit_in[68:65] ;
  assign net_routers_routeTable_2_rt_ifc_banks_banks_rf$ADDR_IN = 4'h0 ;
  assign net_routers_routeTable_2_rt_ifc_banks_banks_rf$D_IN = 3'h0 ;
  assign net_routers_routeTable_2_rt_ifc_banks_banks_rf$WE = 1'b0 ;
  // submodule net_routers_routeTable_2_rt_ifc_banks_banks_rf_1
  assign net_routers_routeTable_2_rt_ifc_banks_banks_rf_1$ADDR_1 =
	     net_routers_router_core_3$out_ports_1_getFlit[68:65] ;
  assign net_routers_routeTable_2_rt_ifc_banks_banks_rf_1$ADDR_IN = 4'h0 ;
  assign net_routers_routeTable_2_rt_ifc_banks_banks_rf_1$D_IN = 3'h0 ;
  assign net_routers_routeTable_2_rt_ifc_banks_banks_rf_1$WE = 1'b0 ;
  // submodule net_routers_routeTable_2_rt_ifc_banks_banks_rf_2
  assign net_routers_routeTable_2_rt_ifc_banks_banks_rf_2$ADDR_1 =
	     send_ports_9_putFlit_flit_in[68:65] ;
  assign net_routers_routeTable_2_rt_ifc_banks_banks_rf_2$ADDR_IN = 4'h0 ;
  assign net_routers_routeTable_2_rt_ifc_banks_banks_rf_2$D_IN = 3'h0 ;
  assign net_routers_routeTable_2_rt_ifc_banks_banks_rf_2$WE = 1'b0 ;
  // submodule net_routers_routeTable_2_rt_ifc_banks_banks_rf_3
  assign net_routers_routeTable_2_rt_ifc_banks_banks_rf_3$ADDR_1 =
	     send_ports_8_putFlit_flit_in[68:65] ;
  assign net_routers_routeTable_2_rt_ifc_banks_banks_rf_3$ADDR_IN = 4'h0 ;
  assign net_routers_routeTable_2_rt_ifc_banks_banks_rf_3$D_IN = 3'h0 ;
  assign net_routers_routeTable_2_rt_ifc_banks_banks_rf_3$WE = 1'b0 ;
  // submodule net_routers_routeTable_2_rt_ifc_banks_banks_rf_4
  assign net_routers_routeTable_2_rt_ifc_banks_banks_rf_4$ADDR_1 =
	     net_routers_router_core$out_ports_4_getFlit[68:65] ;
  assign net_routers_routeTable_2_rt_ifc_banks_banks_rf_4$ADDR_IN = 4'h0 ;
  assign net_routers_routeTable_2_rt_ifc_banks_banks_rf_4$D_IN = 3'h0 ;
  assign net_routers_routeTable_2_rt_ifc_banks_banks_rf_4$WE = 1'b0 ;
  // submodule net_routers_routeTable_3_rt_ifc_banks_banks_rf
  assign net_routers_routeTable_3_rt_ifc_banks_banks_rf$ADDR_1 =
	     send_ports_3_putFlit_flit_in[68:65] ;
  assign net_routers_routeTable_3_rt_ifc_banks_banks_rf$ADDR_IN = 4'h0 ;
  assign net_routers_routeTable_3_rt_ifc_banks_banks_rf$D_IN = 3'h0 ;
  assign net_routers_routeTable_3_rt_ifc_banks_banks_rf$WE = 1'b0 ;
  // submodule net_routers_routeTable_3_rt_ifc_banks_banks_rf_1
  assign net_routers_routeTable_3_rt_ifc_banks_banks_rf_1$ADDR_1 =
	     send_ports_10_putFlit_flit_in[68:65] ;
  assign net_routers_routeTable_3_rt_ifc_banks_banks_rf_1$ADDR_IN = 4'h0 ;
  assign net_routers_routeTable_3_rt_ifc_banks_banks_rf_1$D_IN = 3'h0 ;
  assign net_routers_routeTable_3_rt_ifc_banks_banks_rf_1$WE = 1'b0 ;
  // submodule net_routers_routeTable_3_rt_ifc_banks_banks_rf_2
  assign net_routers_routeTable_3_rt_ifc_banks_banks_rf_2$ADDR_1 =
	     send_ports_11_putFlit_flit_in[68:65] ;
  assign net_routers_routeTable_3_rt_ifc_banks_banks_rf_2$ADDR_IN = 4'h0 ;
  assign net_routers_routeTable_3_rt_ifc_banks_banks_rf_2$D_IN = 3'h0 ;
  assign net_routers_routeTable_3_rt_ifc_banks_banks_rf_2$WE = 1'b0 ;
  // submodule net_routers_routeTable_3_rt_ifc_banks_banks_rf_3
  assign net_routers_routeTable_3_rt_ifc_banks_banks_rf_3$ADDR_1 =
	     net_routers_router_core_2$out_ports_3_getFlit[68:65] ;
  assign net_routers_routeTable_3_rt_ifc_banks_banks_rf_3$ADDR_IN = 4'h0 ;
  assign net_routers_routeTable_3_rt_ifc_banks_banks_rf_3$D_IN = 3'h0 ;
  assign net_routers_routeTable_3_rt_ifc_banks_banks_rf_3$WE = 1'b0 ;
  // submodule net_routers_routeTable_3_rt_ifc_banks_banks_rf_4
  assign net_routers_routeTable_3_rt_ifc_banks_banks_rf_4$ADDR_1 =
	     net_routers_router_core_1$out_ports_4_getFlit[68:65] ;
  assign net_routers_routeTable_3_rt_ifc_banks_banks_rf_4$ADDR_IN = 4'h0 ;
  assign net_routers_routeTable_3_rt_ifc_banks_banks_rf_4$D_IN = 3'h0 ;
  assign net_routers_routeTable_3_rt_ifc_banks_banks_rf_4$WE = 1'b0 ;
  // submodule net_routers_routeTable_rt_ifc_banks_banks_rf
  assign net_routers_routeTable_rt_ifc_banks_banks_rf$ADDR_1 =
	     send_ports_0_putFlit_flit_in[68:65] ;
  assign net_routers_routeTable_rt_ifc_banks_banks_rf$ADDR_IN = 4'h0 ;
  assign net_routers_routeTable_rt_ifc_banks_banks_rf$D_IN = 3'h0 ;
  assign net_routers_routeTable_rt_ifc_banks_banks_rf$WE = 1'b0 ;
  // submodule net_routers_routeTable_rt_ifc_banks_banks_rf_1
  assign net_routers_routeTable_rt_ifc_banks_banks_rf_1$ADDR_1 =
	     net_routers_router_core_1$out_ports_1_getFlit[68:65] ;
  assign net_routers_routeTable_rt_ifc_banks_banks_rf_1$ADDR_IN = 4'h0 ;
  assign net_routers_routeTable_rt_ifc_banks_banks_rf_1$D_IN = 3'h0 ;
  assign net_routers_routeTable_rt_ifc_banks_banks_rf_1$WE = 1'b0 ;
  // submodule net_routers_routeTable_rt_ifc_banks_banks_rf_2
  assign net_routers_routeTable_rt_ifc_banks_banks_rf_2$ADDR_1 =
	     net_routers_router_core_2$out_ports_2_getFlit[68:65] ;
  assign net_routers_routeTable_rt_ifc_banks_banks_rf_2$ADDR_IN = 4'h0 ;
  assign net_routers_routeTable_rt_ifc_banks_banks_rf_2$D_IN = 3'h0 ;
  assign net_routers_routeTable_rt_ifc_banks_banks_rf_2$WE = 1'b0 ;
  // submodule net_routers_routeTable_rt_ifc_banks_banks_rf_3
  assign net_routers_routeTable_rt_ifc_banks_banks_rf_3$ADDR_1 =
	     send_ports_4_putFlit_flit_in[68:65] ;
  assign net_routers_routeTable_rt_ifc_banks_banks_rf_3$ADDR_IN = 4'h0 ;
  assign net_routers_routeTable_rt_ifc_banks_banks_rf_3$D_IN = 3'h0 ;
  assign net_routers_routeTable_rt_ifc_banks_banks_rf_3$WE = 1'b0 ;
  // submodule net_routers_routeTable_rt_ifc_banks_banks_rf_4
  assign net_routers_routeTable_rt_ifc_banks_banks_rf_4$ADDR_1 =
	     send_ports_5_putFlit_flit_in[68:65] ;
  assign net_routers_routeTable_rt_ifc_banks_banks_rf_4$ADDR_IN = 4'h0 ;
  assign net_routers_routeTable_rt_ifc_banks_banks_rf_4$D_IN = 3'h0 ;
  assign net_routers_routeTable_rt_ifc_banks_banks_rf_4$WE = 1'b0 ;
  // submodule net_routers_router_core
  assign net_routers_router_core$in_ports_0_putRoutedFlit_flit_in =
	     { send_ports_0_putFlit_flit_in,
	       net_routers_routeTable_rt_ifc_banks_banks_rf$D_OUT_1 } ;
  assign net_routers_router_core$in_ports_1_putRoutedFlit_flit_in =
	     { net_routers_router_core_1$out_ports_1_getFlit,
	       net_routers_routeTable_rt_ifc_banks_banks_rf_1$D_OUT_1 } ;
  assign net_routers_router_core$in_ports_2_putRoutedFlit_flit_in =
	     { net_routers_router_core_2$out_ports_2_getFlit,
	       net_routers_routeTable_rt_ifc_banks_banks_rf_2$D_OUT_1 } ;
  assign net_routers_router_core$in_ports_3_putRoutedFlit_flit_in =
	     { send_ports_4_putFlit_flit_in,
	       net_routers_routeTable_rt_ifc_banks_banks_rf_3$D_OUT_1 } ;
  assign net_routers_router_core$in_ports_4_putRoutedFlit_flit_in =
	     { send_ports_5_putFlit_flit_in,
	       net_routers_routeTable_rt_ifc_banks_banks_rf_4$D_OUT_1 } ;
  assign net_routers_router_core$out_ports_0_putNonFullVCs_nonFullVCs =
	     recv_ports_0_putNonFullVCs_nonFullVCs ;
  assign net_routers_router_core$out_ports_1_putNonFullVCs_nonFullVCs =
	     recv_ports_4_putNonFullVCs_nonFullVCs ;
  assign net_routers_router_core$out_ports_2_putNonFullVCs_nonFullVCs =
	     recv_ports_5_putNonFullVCs_nonFullVCs ;
  assign net_routers_router_core$out_ports_3_putNonFullVCs_nonFullVCs =
	     net_routers_router_core_1$in_ports_3_getNonFullVCs ;
  assign net_routers_router_core$out_ports_4_putNonFullVCs_nonFullVCs =
	     net_routers_router_core_2$in_ports_4_getNonFullVCs ;
  assign net_routers_router_core$EN_in_ports_0_putRoutedFlit =
	     EN_send_ports_0_putFlit ;
  assign net_routers_router_core$EN_in_ports_0_getNonFullVCs =
	     EN_send_ports_0_getNonFullVCs ;
  assign net_routers_router_core$EN_in_ports_1_putRoutedFlit = 1'd1 ;
  assign net_routers_router_core$EN_in_ports_1_getNonFullVCs = 1'd1 ;
  assign net_routers_router_core$EN_in_ports_2_putRoutedFlit = 1'd1 ;
  assign net_routers_router_core$EN_in_ports_2_getNonFullVCs = 1'd1 ;
  assign net_routers_router_core$EN_in_ports_3_putRoutedFlit =
	     EN_send_ports_4_putFlit ;
  assign net_routers_router_core$EN_in_ports_3_getNonFullVCs =
	     EN_send_ports_4_getNonFullVCs ;
  assign net_routers_router_core$EN_in_ports_4_putRoutedFlit =
	     EN_send_ports_5_putFlit ;
  assign net_routers_router_core$EN_in_ports_4_getNonFullVCs =
	     EN_send_ports_5_getNonFullVCs ;
  assign net_routers_router_core$EN_out_ports_0_getFlit =
	     EN_recv_ports_0_getFlit ;
  assign net_routers_router_core$EN_out_ports_0_putNonFullVCs =
	     EN_recv_ports_0_putNonFullVCs ;
  assign net_routers_router_core$EN_out_ports_1_getFlit =
	     EN_recv_ports_4_getFlit ;
  assign net_routers_router_core$EN_out_ports_1_putNonFullVCs =
	     EN_recv_ports_4_putNonFullVCs ;
  assign net_routers_router_core$EN_out_ports_2_getFlit =
	     EN_recv_ports_5_getFlit ;
  assign net_routers_router_core$EN_out_ports_2_putNonFullVCs =
	     EN_recv_ports_5_putNonFullVCs ;
  assign net_routers_router_core$EN_out_ports_3_getFlit = 1'd1 ;
  assign net_routers_router_core$EN_out_ports_3_putNonFullVCs = 1'd1 ;
  assign net_routers_router_core$EN_out_ports_4_getFlit = 1'd1 ;
  assign net_routers_router_core$EN_out_ports_4_putNonFullVCs = 1'd1 ;
  // submodule net_routers_router_core_1
  assign net_routers_router_core_1$in_ports_0_putRoutedFlit_flit_in =
	     { send_ports_1_putFlit_flit_in,
	       net_routers_routeTable_1_rt_ifc_banks_banks_rf$D_OUT_1 } ;
  assign net_routers_router_core_1$in_ports_1_putRoutedFlit_flit_in =
	     { send_ports_7_putFlit_flit_in,
	       net_routers_routeTable_1_rt_ifc_banks_banks_rf_1$D_OUT_1 } ;
  assign net_routers_router_core_1$in_ports_2_putRoutedFlit_flit_in =
	     { net_routers_router_core_3$out_ports_2_getFlit,
	       net_routers_routeTable_1_rt_ifc_banks_banks_rf_2$D_OUT_1 } ;
  assign net_routers_router_core_1$in_ports_3_putRoutedFlit_flit_in =
	     { net_routers_router_core$out_ports_3_getFlit,
	       net_routers_routeTable_1_rt_ifc_banks_banks_rf_3$D_OUT_1 } ;
  assign net_routers_router_core_1$in_ports_4_putRoutedFlit_flit_in =
	     { send_ports_6_putFlit_flit_in,
	       net_routers_routeTable_1_rt_ifc_banks_banks_rf_4$D_OUT_1 } ;
  assign net_routers_router_core_1$out_ports_0_putNonFullVCs_nonFullVCs =
	     recv_ports_1_putNonFullVCs_nonFullVCs ;
  assign net_routers_router_core_1$out_ports_1_putNonFullVCs_nonFullVCs =
	     net_routers_router_core$in_ports_1_getNonFullVCs ;
  assign net_routers_router_core_1$out_ports_2_putNonFullVCs_nonFullVCs =
	     recv_ports_6_putNonFullVCs_nonFullVCs ;
  assign net_routers_router_core_1$out_ports_3_putNonFullVCs_nonFullVCs =
	     recv_ports_7_putNonFullVCs_nonFullVCs ;
  assign net_routers_router_core_1$out_ports_4_putNonFullVCs_nonFullVCs =
	     net_routers_router_core_3$in_ports_4_getNonFullVCs ;
  assign net_routers_router_core_1$EN_in_ports_0_putRoutedFlit =
	     EN_send_ports_1_putFlit ;
  assign net_routers_router_core_1$EN_in_ports_0_getNonFullVCs =
	     EN_send_ports_1_getNonFullVCs ;
  assign net_routers_router_core_1$EN_in_ports_1_putRoutedFlit =
	     EN_send_ports_7_putFlit ;
  assign net_routers_router_core_1$EN_in_ports_1_getNonFullVCs =
	     EN_send_ports_7_getNonFullVCs ;
  assign net_routers_router_core_1$EN_in_ports_2_putRoutedFlit = 1'd1 ;
  assign net_routers_router_core_1$EN_in_ports_2_getNonFullVCs = 1'd1 ;
  assign net_routers_router_core_1$EN_in_ports_3_putRoutedFlit = 1'd1 ;
  assign net_routers_router_core_1$EN_in_ports_3_getNonFullVCs = 1'd1 ;
  assign net_routers_router_core_1$EN_in_ports_4_putRoutedFlit =
	     EN_send_ports_6_putFlit ;
  assign net_routers_router_core_1$EN_in_ports_4_getNonFullVCs =
	     EN_send_ports_6_getNonFullVCs ;
  assign net_routers_router_core_1$EN_out_ports_0_getFlit =
	     EN_recv_ports_1_getFlit ;
  assign net_routers_router_core_1$EN_out_ports_0_putNonFullVCs =
	     EN_recv_ports_1_putNonFullVCs ;
  assign net_routers_router_core_1$EN_out_ports_1_getFlit = 1'd1 ;
  assign net_routers_router_core_1$EN_out_ports_1_putNonFullVCs = 1'd1 ;
  assign net_routers_router_core_1$EN_out_ports_2_getFlit =
	     EN_recv_ports_6_getFlit ;
  assign net_routers_router_core_1$EN_out_ports_2_putNonFullVCs =
	     EN_recv_ports_6_putNonFullVCs ;
  assign net_routers_router_core_1$EN_out_ports_3_getFlit =
	     EN_recv_ports_7_getFlit ;
  assign net_routers_router_core_1$EN_out_ports_3_putNonFullVCs =
	     EN_recv_ports_7_putNonFullVCs ;
  assign net_routers_router_core_1$EN_out_ports_4_getFlit = 1'd1 ;
  assign net_routers_router_core_1$EN_out_ports_4_putNonFullVCs = 1'd1 ;
  // submodule net_routers_router_core_2
  assign net_routers_router_core_2$in_ports_0_putRoutedFlit_flit_in =
	     { send_ports_2_putFlit_flit_in,
	       net_routers_routeTable_2_rt_ifc_banks_banks_rf$D_OUT_1 } ;
  assign net_routers_router_core_2$in_ports_1_putRoutedFlit_flit_in =
	     { net_routers_router_core_3$out_ports_1_getFlit,
	       net_routers_routeTable_2_rt_ifc_banks_banks_rf_1$D_OUT_1 } ;
  assign net_routers_router_core_2$in_ports_2_putRoutedFlit_flit_in =
	     { send_ports_9_putFlit_flit_in,
	       net_routers_routeTable_2_rt_ifc_banks_banks_rf_2$D_OUT_1 } ;
  assign net_routers_router_core_2$in_ports_3_putRoutedFlit_flit_in =
	     { send_ports_8_putFlit_flit_in,
	       net_routers_routeTable_2_rt_ifc_banks_banks_rf_3$D_OUT_1 } ;
  assign net_routers_router_core_2$in_ports_4_putRoutedFlit_flit_in =
	     { net_routers_router_core$out_ports_4_getFlit,
	       net_routers_routeTable_2_rt_ifc_banks_banks_rf_4$D_OUT_1 } ;
  assign net_routers_router_core_2$out_ports_0_putNonFullVCs_nonFullVCs =
	     recv_ports_2_putNonFullVCs_nonFullVCs ;
  assign net_routers_router_core_2$out_ports_1_putNonFullVCs_nonFullVCs =
	     recv_ports_8_putNonFullVCs_nonFullVCs ;
  assign net_routers_router_core_2$out_ports_2_putNonFullVCs_nonFullVCs =
	     net_routers_router_core$in_ports_2_getNonFullVCs ;
  assign net_routers_router_core_2$out_ports_3_putNonFullVCs_nonFullVCs =
	     net_routers_router_core_3$in_ports_3_getNonFullVCs ;
  assign net_routers_router_core_2$out_ports_4_putNonFullVCs_nonFullVCs =
	     recv_ports_9_putNonFullVCs_nonFullVCs ;
  assign net_routers_router_core_2$EN_in_ports_0_putRoutedFlit =
	     EN_send_ports_2_putFlit ;
  assign net_routers_router_core_2$EN_in_ports_0_getNonFullVCs =
	     EN_send_ports_2_getNonFullVCs ;
  assign net_routers_router_core_2$EN_in_ports_1_putRoutedFlit = 1'd1 ;
  assign net_routers_router_core_2$EN_in_ports_1_getNonFullVCs = 1'd1 ;
  assign net_routers_router_core_2$EN_in_ports_2_putRoutedFlit =
	     EN_send_ports_9_putFlit ;
  assign net_routers_router_core_2$EN_in_ports_2_getNonFullVCs =
	     EN_send_ports_9_getNonFullVCs ;
  assign net_routers_router_core_2$EN_in_ports_3_putRoutedFlit =
	     EN_send_ports_8_putFlit ;
  assign net_routers_router_core_2$EN_in_ports_3_getNonFullVCs =
	     EN_send_ports_8_getNonFullVCs ;
  assign net_routers_router_core_2$EN_in_ports_4_putRoutedFlit = 1'd1 ;
  assign net_routers_router_core_2$EN_in_ports_4_getNonFullVCs = 1'd1 ;
  assign net_routers_router_core_2$EN_out_ports_0_getFlit =
	     EN_recv_ports_2_getFlit ;
  assign net_routers_router_core_2$EN_out_ports_0_putNonFullVCs =
	     EN_recv_ports_2_putNonFullVCs ;
  assign net_routers_router_core_2$EN_out_ports_1_getFlit =
	     EN_recv_ports_8_getFlit ;
  assign net_routers_router_core_2$EN_out_ports_1_putNonFullVCs =
	     EN_recv_ports_8_putNonFullVCs ;
  assign net_routers_router_core_2$EN_out_ports_2_getFlit = 1'd1 ;
  assign net_routers_router_core_2$EN_out_ports_2_putNonFullVCs = 1'd1 ;
  assign net_routers_router_core_2$EN_out_ports_3_getFlit = 1'd1 ;
  assign net_routers_router_core_2$EN_out_ports_3_putNonFullVCs = 1'd1 ;
  assign net_routers_router_core_2$EN_out_ports_4_getFlit =
	     EN_recv_ports_9_getFlit ;
  assign net_routers_router_core_2$EN_out_ports_4_putNonFullVCs =
	     EN_recv_ports_9_putNonFullVCs ;
  // submodule net_routers_router_core_3
  assign net_routers_router_core_3$in_ports_0_putRoutedFlit_flit_in =
	     { send_ports_3_putFlit_flit_in,
	       net_routers_routeTable_3_rt_ifc_banks_banks_rf$D_OUT_1 } ;
  assign net_routers_router_core_3$in_ports_1_putRoutedFlit_flit_in =
	     { send_ports_10_putFlit_flit_in,
	       net_routers_routeTable_3_rt_ifc_banks_banks_rf_1$D_OUT_1 } ;
  assign net_routers_router_core_3$in_ports_2_putRoutedFlit_flit_in =
	     { send_ports_11_putFlit_flit_in,
	       net_routers_routeTable_3_rt_ifc_banks_banks_rf_2$D_OUT_1 } ;
  assign net_routers_router_core_3$in_ports_3_putRoutedFlit_flit_in =
	     { net_routers_router_core_2$out_ports_3_getFlit,
	       net_routers_routeTable_3_rt_ifc_banks_banks_rf_3$D_OUT_1 } ;
  assign net_routers_router_core_3$in_ports_4_putRoutedFlit_flit_in =
	     { net_routers_router_core_1$out_ports_4_getFlit,
	       net_routers_routeTable_3_rt_ifc_banks_banks_rf_4$D_OUT_1 } ;
  assign net_routers_router_core_3$out_ports_0_putNonFullVCs_nonFullVCs =
	     recv_ports_3_putNonFullVCs_nonFullVCs ;
  assign net_routers_router_core_3$out_ports_1_putNonFullVCs_nonFullVCs =
	     net_routers_router_core_2$in_ports_1_getNonFullVCs ;
  assign net_routers_router_core_3$out_ports_2_putNonFullVCs_nonFullVCs =
	     net_routers_router_core_1$in_ports_2_getNonFullVCs ;
  assign net_routers_router_core_3$out_ports_3_putNonFullVCs_nonFullVCs =
	     recv_ports_10_putNonFullVCs_nonFullVCs ;
  assign net_routers_router_core_3$out_ports_4_putNonFullVCs_nonFullVCs =
	     recv_ports_11_putNonFullVCs_nonFullVCs ;
  assign net_routers_router_core_3$EN_in_ports_0_putRoutedFlit =
	     EN_send_ports_3_putFlit ;
  assign net_routers_router_core_3$EN_in_ports_0_getNonFullVCs =
	     EN_send_ports_3_getNonFullVCs ;
  assign net_routers_router_core_3$EN_in_ports_1_putRoutedFlit =
	     EN_send_ports_10_putFlit ;
  assign net_routers_router_core_3$EN_in_ports_1_getNonFullVCs =
	     EN_send_ports_10_getNonFullVCs ;
  assign net_routers_router_core_3$EN_in_ports_2_putRoutedFlit =
	     EN_send_ports_11_putFlit ;
  assign net_routers_router_core_3$EN_in_ports_2_getNonFullVCs =
	     EN_send_ports_11_getNonFullVCs ;
  assign net_routers_router_core_3$EN_in_ports_3_putRoutedFlit = 1'd1 ;
  assign net_routers_router_core_3$EN_in_ports_3_getNonFullVCs = 1'd1 ;
  assign net_routers_router_core_3$EN_in_ports_4_putRoutedFlit = 1'd1 ;
  assign net_routers_router_core_3$EN_in_ports_4_getNonFullVCs = 1'd1 ;
  assign net_routers_router_core_3$EN_out_ports_0_getFlit =
	     EN_recv_ports_3_getFlit ;
  assign net_routers_router_core_3$EN_out_ports_0_putNonFullVCs =
	     EN_recv_ports_3_putNonFullVCs ;
  assign net_routers_router_core_3$EN_out_ports_1_getFlit = 1'd1 ;
  assign net_routers_router_core_3$EN_out_ports_1_putNonFullVCs = 1'd1 ;
  assign net_routers_router_core_3$EN_out_ports_2_getFlit = 1'd1 ;
  assign net_routers_router_core_3$EN_out_ports_2_putNonFullVCs = 1'd1 ;
  assign net_routers_router_core_3$EN_out_ports_3_getFlit =
	     EN_recv_ports_10_getFlit ;
  assign net_routers_router_core_3$EN_out_ports_3_putNonFullVCs =
	     EN_recv_ports_10_putNonFullVCs ;
  assign net_routers_router_core_3$EN_out_ports_4_getFlit =
	     EN_recv_ports_11_getFlit ;
  assign net_routers_router_core_3$EN_out_ports_4_putNonFullVCs =
	     EN_recv_ports_11_putNonFullVCs ;
  // handling of system tasks
  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N)
      if (EN_send_ports_0_putFlit && send_ports_0_putFlit_flit_in[70])
	$write("");
    if (RST_N)
      if (EN_send_ports_1_putFlit && send_ports_1_putFlit_flit_in[70])
	$write("");
    if (RST_N)
      if (EN_send_ports_2_putFlit && send_ports_2_putFlit_flit_in[70])
	$write("");
    if (RST_N)
      if (EN_send_ports_3_putFlit && send_ports_3_putFlit_flit_in[70])
	$write("");
    if (RST_N)
      if (EN_send_ports_4_putFlit && send_ports_4_putFlit_flit_in[70])
	$write("");
    if (RST_N)
      if (EN_send_ports_5_putFlit && send_ports_5_putFlit_flit_in[70])
	$write("");
    if (RST_N)
      if (EN_send_ports_6_putFlit && send_ports_6_putFlit_flit_in[70])
	$write("");
    if (RST_N)
      if (EN_send_ports_7_putFlit && send_ports_7_putFlit_flit_in[70])
	$write("");
    if (RST_N)
      if (EN_send_ports_8_putFlit && send_ports_8_putFlit_flit_in[70])
	$write("");
    if (RST_N)
      if (EN_send_ports_9_putFlit && send_ports_9_putFlit_flit_in[70])
	$write("");
    if (RST_N)
      if (EN_send_ports_10_putFlit && send_ports_10_putFlit_flit_in[70])
	$write("");
    if (RST_N)
      if (EN_send_ports_11_putFlit && send_ports_11_putFlit_flit_in[70])
	$write("");
    if (RST_N)
      if (net_routers_router_core_1$out_ports_1_getFlit[70]) $write("");
    if (RST_N)
      if (net_routers_router_core_3$out_ports_1_getFlit[70]) $write("");
    if (RST_N)
      if (net_routers_router_core_2$out_ports_2_getFlit[70]) $write("");
    if (RST_N)
      if (net_routers_router_core_3$out_ports_2_getFlit[70]) $write("");
    if (RST_N)
      if (net_routers_router_core$out_ports_3_getFlit[70]) $write("");
    if (RST_N)
      if (net_routers_router_core_2$out_ports_3_getFlit[70]) $write("");
    if (RST_N)
      if (net_routers_router_core$out_ports_4_getFlit[70]) $write("");
    if (RST_N)
      if (net_routers_router_core_1$out_ports_4_getFlit[70]) $write("");
  end
  // synopsys translate_on
endmodule