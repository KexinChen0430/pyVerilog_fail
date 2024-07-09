module testbench;
  // Testbench signals
  wire        reset;
  wire        tx_client_clk;
  wire [7:0]  tx_ifg_delay;
  wire        rx_client_clk;
  wire [15:0] pause_val;
  wire        pause_req;
  // GMII wires
  wire        gmii_tx_clk;
  wire        gmii_tx_en;
  wire        gmii_tx_er;
  wire [7:0]  gmii_txd;
  wire        gmii_rx_clk;
  wire        gmii_rx_dv;
  wire        gmii_rx_er;
  wire [7:0]  gmii_rxd;
  // Not asserted: full duplex only testbench
  wire        mii_tx_clk;
  wire        gmii_crs;
  wire        gmii_col;
  // MDIO wires
  wire        mdc;
  wire        mdc_in;
  wire        mdio_in;
  wire        mdio_out;
  wire        mdio_tri;
  // Host wires
  wire [1:0]  host_opcode;
  wire [9:0]  host_addr;
  wire [31:0] host_wr_data;
  wire [31:0] host_rd_data;
  wire        host_miim_sel;
  wire        host_req;
  wire        host_miim_rdy;
  // Clock wires
  wire        host_clk;
  reg         gtx_clk;
  reg         refclk;
  // Testbench Semaphores
  wire        configuration_busy;
  wire        monitor_finished_1g;
  wire        monitor_finished_100m;
  wire        monitor_finished_10m;
  // Wire up device under test
  v6_emac_v1_3_example_design dut
    (
    // Client receiver interface
    .EMACCLIENTRXDVLD         (),
    .EMACCLIENTRXFRAMEDROP    (),
    .EMACCLIENTRXSTATS        (),
    .EMACCLIENTRXSTATSVLD     (),
    .EMACCLIENTRXSTATSBYTEVLD (),
    // Client transmitter interface
    .CLIENTEMACTXIFGDELAY     (tx_ifg_delay),
    .EMACCLIENTTXSTATS        (),
    .EMACCLIENTTXSTATSVLD     (),
    .EMACCLIENTTXSTATSBYTEVLD (),
    // MAC Control interface
    .CLIENTEMACPAUSEREQ       (pause_req),
    .CLIENTEMACPAUSEVAL       (pause_val),
     // Clock signal
    .GTX_CLK                  (gtx_clk),
    // GMII interface
    .GMII_TXD                 (gmii_txd),
    .GMII_TX_EN               (gmii_tx_en),
    .GMII_TX_ER               (gmii_tx_er),
    .GMII_TX_CLK              (gmii_tx_clk),
    .GMII_RXD                 (gmii_rxd),
    .GMII_RX_DV               (gmii_rx_dv),
    .GMII_RX_ER               (gmii_rx_er),
    .GMII_RX_CLK              (gmii_rx_clk),
    // MDIO interface
    .MDC                      (mdc),
    .MDIO_I                   (mdio_in),
    .MDIO_O                   (mdio_out),
    .MDIO_T                   (mdio_tri),
    // Host interface
    .HOSTCLK                  (host_clk),
    .HOSTOPCODE               (host_opcode),
    .HOSTREQ                  (host_req),
    .HOSTMIIMSEL              (host_miim_sel),
    .HOSTADDR                 (host_addr),
    .HOSTWRDATA               (host_wr_data),
    .HOSTMIIMRDY              (host_miim_rdy),
    .HOSTRDDATA               (host_rd_data),
    .REFCLK                   (refclk),
    // Asynchronous reset
    .RESET                    (reset)
  );
  // Flow control is unused in this demonstration
  assign pause_req = 1'b0;
  assign pause_val = 16'b0;
  // IFG stretching not used in demo.
  assign tx_ifg_delay = 8'b0;
  // Simulate the MDIO_IN port floating high
  assign (strong0, weak1) mdio_in = 1'b1;
  // Clock drivers
  // Drive GTX_CLK at 125 MHz
  initial
  begin
    gtx_clk <= 1'b0;
    #10000;
    forever
    begin
      gtx_clk <= 1'b0;
      #4000;
      gtx_clk <= 1'b1;
      #4000;
    end
  end
  // Drive refclk at 200MHz
  initial
  begin
    refclk <= 1'b0;
    #10000;
    forever
    begin
      refclk <= 1'b1;
      #2500;
      refclk <= 1'b0;
      #2500;
    end
  end
  // Instantiate the PHY stimulus and monitor
  phy_tb phy_test
    (
      // GMII interface
      .gmii_txd              (gmii_txd),
      .gmii_tx_en            (gmii_tx_en),
      .gmii_tx_er            (gmii_tx_er),
      .gmii_tx_clk           (gmii_tx_clk),
      .gmii_rxd              (gmii_rxd),
      .gmii_rx_dv            (gmii_rx_dv),
      .gmii_rx_er            (gmii_rx_er),
      .gmii_rx_clk           (gmii_rx_clk),
      .gmii_col              (gmii_col),
      .gmii_crs              (gmii_crs),
      .mii_tx_clk            (mii_tx_clk),
      // Testbench semaphores
      .configuration_busy    (configuration_busy),
      .monitor_finished_1g   (monitor_finished_1g),
      .monitor_finished_100m (monitor_finished_100m),
      .monitor_finished_10m  (monitor_finished_10m),
      .monitor_error         (monitor_error)
    );
  // Instantiate the host configuration stimulus
  configuration_tb config_test
    (
      .reset                 (reset),
      // Host interface
      .host_clk              (host_clk),
      .host_opcode           (host_opcode),
      .host_req              (host_req),
      .host_miim_sel         (host_miim_sel),
      .host_addr             (host_addr),
      .host_wr_data          (host_wr_data),
      .host_miim_rdy         (host_miim_rdy),
      .host_rd_data          (host_rd_data),
      // Testbench semaphores
      .configuration_busy    (configuration_busy),
      .monitor_finished_1g   (monitor_finished_1g),
      .monitor_finished_100m (monitor_finished_100m),
      .monitor_finished_10m  (monitor_finished_10m),
      .monitor_error         (monitor_error)
    );
endmodule