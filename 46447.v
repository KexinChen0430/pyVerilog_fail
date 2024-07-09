module eth_outbound_chain_tx_tb();
wire clk_50;
sim_clk #(50) clk_50_inst(clk_50);
wire clk_100;
sim_clk #(100) clk_100_inst(clk_100);
wire [1:0] rmii_txd, rmii_rxd;
wire rmii_rst, mdc, mdio;
wire rmii_txen, rmii_rxdv;
fake_rmii_phy #(.INPUT_FILE_NAME("tb_packets.dat")) phy
(.refclk(clk_50), .rst(rmii_rst), .mdc(mdc), .mdio(mdio),
 .txd(rmii_txd), .txen(rmii_txen),
 .rxd(rmii_rxd), .rxdv(rmii_rxdv));
wire [7:0] rxd; // upstream ethernet RXD
wire rxdv, rxe; // upstream ethernet RXDV and end-RX
eth_rx upe // upstream ethernet PHY interface
(.c(clk_50),
 .d(rxd), .dv(rxdv), .erx(rxe),
 .phy_rxd(rmii_rxd), .phy_rxdv(rmii_rxdv));
wire [1:0] phy_txd;
wire phy_txen;
eth_outbound_chain_tx dut(.*);
fake_rmii_phy b0_sim_rmii_phy
(.refclk(clk_50), .mdc(enet_mdc), .mdio(enet_mdio), .rst(1'b1),
 .txd(rmii_txd), .txen(rmii_txen));
wire [7:0] b1_enet_rxd , b2_enet_rxd , b3_enet_rxd;
wire       b1_enet_rxdv, b2_enet_rxdv, b3_enet_rxdv;
wire       b1_enet_erx , b2_enet_erx , b3_enet_erx;
wire [1:0] b1_phy_txd  , b2_phy_txd  , b3_phy_txd;
wire       b1_phy_txen , b2_phy_txen , b3_phy_txen;
// board 1
eth_rx b1_upe // rx interface on the next board in the chain
(.c(clk_50),
 .d(b1_enet_rxd), .dv(b1_enet_rxdv), .erx(b1_enet_erx),
 .phy_rxd(phy_txd), .phy_rxdv(phy_txen));
eth_outbound_chain_tx b1_chain_tx
(.clk_50(clk_50),
 .rxd(b1_enet_rxd), .rxdv(b1_enet_rxdv), .rxe(b1_enet_erx),
 .phy_txd(b1_phy_txd), .phy_txen(b1_phy_txen));
wire [7:0] b1_upu_rxd; // upstream UDP RXD
wire b1_upu_rxdv, b1_upu_erx; // upstreadm UDP RXDV and end-RX
wire [15:0] b1_upu_port;
udp_rx b1_upu_rx
(.c(clk_50),
 .eth_d(b1_enet_rxd), .eth_dv(b1_enet_rxdv), .eth_stop(b1_enet_erx),
 .udp_d(b1_upu_rxd), .udp_dv(b1_upu_rxdv), .udp_last(b1_upu_erx),
 .udp_port(b1_upu_port));
wire [7:0] b1_submsg_rxd;
wire b1_submsg_rxdv, b1_submsg_rxlast;
udp_outbound_chain_rx b1_outbound_chain_rx_inst
(.clk_50(clk_50), .clk_100(clk_100),
 .rxd(b1_upu_rxd), .rxdv(b1_upu_rxdv & b1_upu_port == 16'd11300),
 .rxlast(b1_upu_erx),
 .submsg_rxd(b1_submsg_rxd),
 .submsg_rxdv(b1_submsg_rxdv),
 .submsg_rxlast(b1_submsg_rxlast));
fake_rmii_phy b1_sim_rmii_phy
(.refclk(clk_50), .mdc(enet_mdc), .mdio(enet_mdio), .rst(1'b1),
 .txd(b1_phy_txd), .txen(b1_phy_txen));
// board 2
wire b2_clk_50, b2_clk_100;
assign b2_clk_50 = clk_50;
assign b2_clk_100 = clk_100;
eth_rx b2_upe // rx interface on the next board in the chain
(.c(b2_clk_50),
 .d(b2_enet_rxd), .dv(b2_enet_rxdv), .erx(b2_enet_erx),
 .phy_rxd(b1_phy_txd), .phy_rxdv(b1_phy_txen));
eth_outbound_chain_tx b2_chain_tx
(.clk_50(b2_clk_50),
 .rxd(b2_enet_rxd), .rxdv(b2_enet_rxdv), .rxe(b2_enet_erx),
 .phy_txd(b2_phy_txd), .phy_txen(b2_phy_txen));
wire [7:0] b2_upu_rxd; // upstream UDP RXD
wire b2_upu_rxdv, b2_upu_erx; // upstreadm UDP RXDV and end-RX
wire [15:0] b2_upu_port;
udp_rx b2_upu_rx
(.c(b2_clk_50),
 .eth_d(b2_enet_rxd), .eth_dv(b2_enet_rxdv), .eth_stop(b2_enet_erx),
 .udp_d(b2_upu_rxd), .udp_dv(b2_upu_rxdv), .udp_last(b2_upu_erx),
 .udp_port(b2_upu_port));
wire [7:0] b2_submsg_rxd;
wire b2_submsg_rxdv, b2_submsg_rxlast;
udp_outbound_chain_rx b2_outbound_chain_rx_inst
(.clk_50(b2_clk_50), .clk_100(b2_clk_100),
 .rxd(b2_upu_rxd), .rxdv(b2_upu_rxdv & b2_upu_port == 16'd11300),
 .rxlast(b2_upu_erx),
 .submsg_rxd(b2_submsg_rxd),
 .submsg_rxdv(b2_submsg_rxdv),
 .submsg_rxlast(b2_submsg_rxlast));
fake_rmii_phy b2_sim_rmii_phy
(.refclk(clk_50), .mdc(enet_mdc), .mdio(enet_mdio), .rst(1'b1),
 .txd(b2_phy_txd), .txen(b2_phy_txen));
// board 3
eth_rx b3_upe // rx interface on the next board in the chain
(.c(clk_50),
 .d(b3_enet_rxd), .dv(b3_enet_rxdv), .erx(b3_enet_erx),
 .phy_rxd(b2_phy_txd), .phy_rxdv(b2_phy_txen));
eth_outbound_chain_tx b3_chain_tx
(.clk_50(clk_50),
 .rxd(b3_enet_rxd), .rxdv(b3_enet_rxdv), .rxe(b3_enet_erx),
 .phy_txd(b3_phy_txd), .phy_txen(b3_phy_txen));
fake_rmii_phy b3_sim_rmii_phy
(.refclk(clk_50), .mdc(enet_mdc), .mdio(enet_mdio), .rst(1'b1),
 .txd(b3_phy_txd), .txen(b3_phy_txen));
initial begin
  $dumpfile("eth_outbound_chain_tx.lxt");
  $dumpvars();
  #50000;
  $finish();
end
endmodule