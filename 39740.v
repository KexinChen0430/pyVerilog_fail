module AcqSys(
	//////////// CLOCK //////////
	input 		          		CLOCK_50,
	input 		          		CLOCK2_50,
	input 		          		CLOCK3_50,
    input            [3:0]      KEY,
	 //////////// LEDG ////////
	 output          [8:0]   LEDG,
	 //////////// LEDR
	 output          [17:0]  LEDR,
	//////////// PCIe //////////
	input 		          		PCIE_PERST_N,
	input 		          		PCIE_REFCLK_P,
	input 		     [0:0]		PCIE_RX_P,
	output		     [0:0]		PCIE_TX_P,
	output		          		PCIE_WAKE_N,
	//////////// GPIO, GPIO connect to GPIO Default //////////
	inout 		     [35:0]		GPIO,
	//////////// Fan Control //////////
	inout 		          		FAN_CTRL
);
//=======================================================
//  REG/WIRE declarations
//=======================================================
//=======================================================
//  Structural coding
//=======================================================
    PCIe_AvalonBSV test0 (
        .pcie_hard_ip_0_refclk_export              (PCIE_REFCLK_P),
        .pcie_hard_ip_0_pcie_rstn_export           (PCIE_PERST_N),
        .pcie_hard_ip_0_powerdown_pll_powerdown    (PCIE_WAKE_N),
        .pcie_hard_ip_0_powerdown_gxb_powerdown    (PCIE_WAKE_N),
        .pcie_hard_ip_0_rx_in_rx_datain_0          (PCIE_RX_P[0]),
        .pcie_hard_ip_0_tx_out_tx_dataout_0        (PCIE_TX_P[0]),
        .status_led                                (LEDR[17:8]),
		  .input_ch0                                 (GPIO[0]),
		  .input_ch1                                 (GPIO[1]),
		  .input_ch2                                 (GPIO[2]),
		  .input_ch3                                 (GPIO[3]),
		  .input_ch4                                 (GPIO[4]),
		  .input_ch5                                 (GPIO[5]),
		  .input_ch6                                 (GPIO[6]),
		  .input_ch7                                 (~ KEY[0]),
		  .stim_stim                                 (LEDG[7:0]),
    );
	//////////// FAN Control //////////
assign FAN_CTRL = 1'bz; // turn on FAN
assign LEDR[7:0] = 0;
assign LEDG[8] = 0;
endmodule