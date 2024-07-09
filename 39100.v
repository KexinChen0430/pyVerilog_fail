module peg_l2_mac_rx #(
    parameter PKT_DATA_W      = 8,
    parameter PKT_SIZE_W      = 16,
    parameter NUM_FIELDS      = 8,
    parameter BFFR_SIZE       = 48
)
(
  input                       clk,
  input                       rst_n,
  //Outputs to MAC TX
  output                      mac_pause_en,
  //MAC Logic Link packet interface
  `pkt_intf_ports_m(llc_rx_,,PKT_DATA_W),
  //RS packet interface
  `pkt_intf_ports_s(rs_rx_,,PKT_DATA_W)
);
  wire  [NUM_FIELDS-1:0]        rx_field_valid_vec_w;
  wire  [BFFR_SIZE-1:0]         rx_bffr_w;
  wire                          fcs_calc_rst_w;
  wire                          fcs_calc_en_w;
  wire  [PKT_DATA_W-1:0]        fcs_calc_data_w;
  peg_l2_mac_rx_parser #(
    .PKT_DATA_W(PKT_DATA_W),
    .PKT_SIZE_W(PKT_SIZE_W),
    .NUM_FIELDS(NUM_FIELDS),
    .BFFR_SIZE(BFFR_SIZE)
  )
    u_l2_mac_rx_parser
  (
    .clk            (clk),
    .rst_n          (rst_n),
    //Config interface
    .config_l2_mac_rx_en,
    .config_l2_mac_rx_fcs_en,
    .config_l2_mac_rx_strip_preamble_sfd,
    .config_l2_mac_rx_strip_fcs,
    //Status interface
    .l2_mac_rx_fsm_state,
    //Interface to RX Filter & Pause Gen
    .rx_field_valid_vec       (rx_field_valid_vec_w),
    .rx_bffr                  (rx_bffr_w),
    //Interface to FCS Calculator
    .rx_fcs_rst               (fcs_calc_rst_w),
    .rx_fcs_calc_en           (fcs_calc_en_w),
    .rx_fcs_calc_data         (fcs_calc_data_w),
    //RS packet interface
    `pkt_intf_port_connect(rs_rx_,,rs_rx_,),
    //LLC packet interface
    `pkt_intf_port_connect(llc_rx_,,llc_rx_,)
  );
  peg_l2_mac_pause_cntr  #(
    .BPCLK(PKT_DATA_W)
  )
    u_pause_cntr
  (
    .clk          (clk),
    .rst_n        (rst_n),
    //Config
    .pause_en     (),
    //Inputs from Parser
    .pause_time_valid   (rx_field_valid_vec_w[MAC_FIDX_PAUSE_TIME]),
    .pause_time         (rx_bffr_w[15:0]),
    //Pause Status
    .pause_valid  (mac_pause_en)
  );
  peg_l2_fcs_gen #(
    .DATA_W(PKT_DATA_W),
    .CRC_INIT_VAL(32'd0)
  )
    u_l2_fcs_gen
  (
    .clk            (clk),
    .rst_n          (rst_n),
    .fcs_calc_rst   (fcs_calc_rst_w),
    .fcs_calc_valid (fcs_calc_en_w),
    .fcs_calc_data  (fcs_calc_data_w),
    .fcs            ()
  );
endmodule