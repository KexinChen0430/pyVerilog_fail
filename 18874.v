module peg_l2_mac_tx #(
  parameter PKT_DATA_W        = 8,
  parameter PKT_SIZE_W        = 16
)
(
  input                       clk,
  input                       rst_n,
  //Inputs from L2 MAC RX
  input                       mac_pause_en,
  //MAC Logic Link Control packet interface
  `pkt_intf_ports_s(llc_tx_,,PKT_DATA_W),
  //RS packet interface
  pkt_intf_ports_m(rs_tx_,,PKT_DATA_W)
);
  peg_l2_mac_tx_framer #(
    .PKT_DATA_W(PKT_DATA_W),
    .PKT_SIZE_W(PKT_SIZE_W)
  )
    u_l2_mac_tx_framer
  (
    .clk          (clk),
    .rst_n        (rst_n),
    //Config interface
    .config_l2_mac_tx_en          (),
    .config_l2_mac_tx_padding_en  (),
    .config_l2_mac_tx_fcs_en      (),
    .config_l2_mac_addr           (),
    .config_l2_mac_tx_pause_gen   (),
    .config_l2_mac_tx_pause_time  (),
    //Status interface
    .l2_mac_tx_fsm_state          (),
    //Pause Interface from MAC RX
    .mac_pause_en                 (mac_pause_en),
    //MAC Logic Link Control packet interface
    `pkt_intf_port_connect(llc_tx_,,llc_tx_,),
    //RS packet interface
    `pkt_intf_port_connect(rs_tx_,,rs_tx_,)
  );
endmodule