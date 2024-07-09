module tse_mac2 (
	ff_tx_data,
	ff_tx_eop,
	ff_tx_err,
	ff_tx_sop,
	ff_tx_wren,
	ff_tx_clk,
	ff_rx_rdy,
	ff_rx_clk,
	address,
	read,
	writedata,
	write,
	clk,
	reset,
	mdio_in,
	rxp,
	ref_clk,
	ff_tx_rdy,
	ff_rx_data,
	ff_rx_dval,
	ff_rx_eop,
	ff_rx_sop,
	rx_err,
	readdata,
	waitrequest,
	mdio_out,
	mdio_oen,
	mdc,
	led_an,
	led_char_err,
	led_link,
	led_disp_err,
	led_crs,
	led_col,
	txp,
	rx_recovclkout);
	input	[7:0]	ff_tx_data;
	input		ff_tx_eop;
	input		ff_tx_err;
	input		ff_tx_sop;
	input		ff_tx_wren;
	input		ff_tx_clk;
	input		ff_rx_rdy;
	input		ff_rx_clk;
	input	[7:0]	address;
	input		read;
	input	[31:0]	writedata;
	input		write;
	input		clk;
	input		reset;
	input		mdio_in;
	input		rxp;
	input		ref_clk;
	output		ff_tx_rdy;
	output	[7:0]	ff_rx_data;
	output		ff_rx_dval;
	output		ff_rx_eop;
	output		ff_rx_sop;
	output	[5:0]	rx_err;
	output	[31:0]	readdata;
	output		waitrequest;
	output		mdio_out;
	output		mdio_oen;
	output		mdc;
	output		led_an;
	output		led_char_err;
	output		led_link;
	output		led_disp_err;
	output		led_crs;
	output		led_col;
	output		txp;
	output		rx_recovclkout;
	altera_tse_mac_pcs_pma	altera_tse_mac_pcs_pma_inst(
		.ff_tx_data(ff_tx_data),
		.ff_tx_eop(ff_tx_eop),
		.ff_tx_err(ff_tx_err),
		.ff_tx_sop(ff_tx_sop),
		.ff_tx_wren(ff_tx_wren),
		.ff_tx_clk(ff_tx_clk),
		.ff_rx_rdy(ff_rx_rdy),
		.ff_rx_clk(ff_rx_clk),
		.address(address),
		.read(read),
		.writedata(writedata),
		.write(write),
		.clk(clk),
		.reset(reset),
		.mdio_in(mdio_in),
		.rxp(rxp),
		.ref_clk(ref_clk),
		.ff_tx_rdy(ff_tx_rdy),
		.ff_rx_data(ff_rx_data),
		.ff_rx_dval(ff_rx_dval),
		.ff_rx_eop(ff_rx_eop),
		.ff_rx_sop(ff_rx_sop),
		.rx_err(rx_err),
		.readdata(readdata),
		.waitrequest(waitrequest),
		.mdio_out(mdio_out),
		.mdio_oen(mdio_oen),
		.mdc(mdc),
		.led_an(led_an),
		.led_char_err(led_char_err),
		.led_link(led_link),
		.led_disp_err(led_disp_err),
		.led_crs(led_crs),
		.led_col(led_col),
		.txp(txp),
		.rx_recovclkout(rx_recovclkout));
	defparam
		altera_tse_mac_pcs_pma_inst.ENABLE_MAGIC_DETECT = 1,
		altera_tse_mac_pcs_pma_inst.ENABLE_MDIO = 1,
		altera_tse_mac_pcs_pma_inst.ENABLE_SHIFT16 = 0,
		altera_tse_mac_pcs_pma_inst.ENABLE_SUP_ADDR = 1,
		altera_tse_mac_pcs_pma_inst.CORE_VERSION = 16'h0b01,
		altera_tse_mac_pcs_pma_inst.CRC32GENDELAY = 6,
		altera_tse_mac_pcs_pma_inst.MDIO_CLK_DIV = 50,
		altera_tse_mac_pcs_pma_inst.ENA_HASH = 1,
		altera_tse_mac_pcs_pma_inst.USE_SYNC_RESET = 1,
		altera_tse_mac_pcs_pma_inst.STAT_CNT_ENA = 1,
		altera_tse_mac_pcs_pma_inst.ENABLE_EXTENDED_STAT_REG = 0,
		altera_tse_mac_pcs_pma_inst.ENABLE_HD_LOGIC = 1,
		altera_tse_mac_pcs_pma_inst.REDUCED_INTERFACE_ENA = 0,
		altera_tse_mac_pcs_pma_inst.CRC32S1L2_EXTERN = 0,
		altera_tse_mac_pcs_pma_inst.ENABLE_GMII_LOOPBACK = 0,
		altera_tse_mac_pcs_pma_inst.CRC32DWIDTH = 8,
		altera_tse_mac_pcs_pma_inst.CUST_VERSION = 0,
		altera_tse_mac_pcs_pma_inst.RESET_LEVEL = 8'h01,
		altera_tse_mac_pcs_pma_inst.CRC32CHECK16BIT = 8'h00,
		altera_tse_mac_pcs_pma_inst.ENABLE_MAC_FLOW_CTRL = 1,
		altera_tse_mac_pcs_pma_inst.ENABLE_MAC_TXADDR_SET = 1,
		altera_tse_mac_pcs_pma_inst.ENABLE_MAC_RX_VLAN = 1,
		altera_tse_mac_pcs_pma_inst.ENABLE_MAC_TX_VLAN = 1,
		altera_tse_mac_pcs_pma_inst.SYNCHRONIZER_DEPTH = 4,
		altera_tse_mac_pcs_pma_inst.EG_FIFO = 2048,
		altera_tse_mac_pcs_pma_inst.EG_ADDR = 11,
		altera_tse_mac_pcs_pma_inst.ING_FIFO = 2048,
		altera_tse_mac_pcs_pma_inst.ENABLE_ENA = 8,
		altera_tse_mac_pcs_pma_inst.ING_ADDR = 11,
		altera_tse_mac_pcs_pma_inst.RAM_TYPE = "AUTO",
		altera_tse_mac_pcs_pma_inst.INSERT_TA = 1,
		altera_tse_mac_pcs_pma_inst.ENABLE_MACLITE = 0,
		altera_tse_mac_pcs_pma_inst.MACLITE_GIGE = 0,
		altera_tse_mac_pcs_pma_inst.PHY_IDENTIFIER = 32'h00000000,
		altera_tse_mac_pcs_pma_inst.DEV_VERSION = 16'h0b01,
		altera_tse_mac_pcs_pma_inst.ENABLE_SGMII = 1,
		altera_tse_mac_pcs_pma_inst.DEVICE_FAMILY = "STRATIXIV",
		altera_tse_mac_pcs_pma_inst.EXPORT_PWRDN = 0,
		altera_tse_mac_pcs_pma_inst.TRANSCEIVER_OPTION = 1,
		altera_tse_mac_pcs_pma_inst.ENABLE_ALT_RECONFIG = 0;
endmodule