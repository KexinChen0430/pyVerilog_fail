module top(
	(* dont_touch = "true" *)	input clk100,
	input cpu_reset,
	output reg serial_tx,
	input serial_rx,
	output eth_clocks_tx,
	(* dont_touch = "true" *)	input eth_clocks_rx,
	output eth_rst_n,
	input eth_int_n,
	inout eth_mdio,
	output eth_mdc,
	input eth_rx_ctl,
	input [3:0] eth_rx_data,
	output eth_tx_ctl,
	output [3:0] eth_tx_data,
	output [1:0] vadj,
	output usb_reset_n0,
	output usb_pipe_ctrl0_phy_reset_n,
	output usb_pipe_ctrl0_tx_detrx_lpbk,
	output usb_pipe_ctrl0_tx_elecidle,
	output [1:0] usb_pipe_ctrl0_power_down,
	output usb_pipe_ctrl0_tx_oneszeros,
	output [1:0] usb_pipe_ctrl0_tx_deemph,
	output [1:0] usb_pipe_ctrl0_tx_margin,
	output usb_pipe_ctrl0_tx_swing,
	output usb_pipe_ctrl0_rx_polarity,
	output usb_pipe_ctrl0_rx_termination,
	output usb_pipe_ctrl0_rate,
	output usb_pipe_ctrl0_elas_buf_mode,
	inout usb_pipe_status0_rx_elecidle,
	input [2:0] usb_pipe_status0_rx_status,
	inout usb_pipe_status0_phy_status,
	input usb_pipe_status0_pwr_present,
	input usb_pipe_data0_rx_clk,
	input usb_pipe_data0_rx_valid,
	input [15:0] usb_pipe_data0_rx_data,
	input [1:0] usb_pipe_data0_rx_datak,
	output usb_pipe_data0_tx_clk,
	output [15:0] usb_pipe_data0_tx_data,
	output [1:0] usb_pipe_data0_tx_datak,
	input user_sw0,
	input user_sw1
);
reg soc_usbsoc_reset_storage = 1'd0;
reg soc_usbsoc_reset_re = 1'd0;
reg [31:0] soc_usbsoc_scratch_storage = 32'd305419896;
reg soc_usbsoc_scratch_re = 1'd0;
wire [31:0] soc_usbsoc_bus_errors_status;
wire soc_usbsoc_bus_errors_we;
wire soc_usbsoc_reset;
wire soc_usbsoc_bus_error;
reg [31:0] soc_usbsoc_bus_errors = 32'd0;
reg [13:0] soc_usbsoc_adr = 14'd0;
reg soc_usbsoc_we = 1'd0;
wire [7:0] soc_usbsoc_dat_w;
wire [7:0] soc_usbsoc_dat_r;
wire [29:0] soc_usbsoc_bus_wishbone_adr;
wire [31:0] soc_usbsoc_bus_wishbone_dat_w;
wire [31:0] soc_usbsoc_bus_wishbone_dat_r;
wire [3:0] soc_usbsoc_bus_wishbone_sel;
wire soc_usbsoc_bus_wishbone_cyc;
wire soc_usbsoc_bus_wishbone_stb;
reg soc_usbsoc_bus_wishbone_ack = 1'd0;
wire soc_usbsoc_bus_wishbone_we;
wire [2:0] soc_usbsoc_bus_wishbone_cti;
wire [1:0] soc_usbsoc_bus_wishbone_bte;
reg soc_usbsoc_bus_wishbone_err = 1'd0;
(* dont_touch = "true" *) wire sys_clk;
wire sys_rst;
wire clk200_clk;
wire clk200_rst;
wire soc_pll_locked;
wire soc_pll_fb;
wire soc_pll_sys;
wire soc_pll_clk200;
reg [3:0] soc_reset_counter = 4'd15;
reg soc_ic_reset = 1'd1;
reg [31:0] soc_uart_bridge_storage = 32'd3720152;
reg soc_uart_bridge_sink_valid = 1'd0;
reg soc_uart_bridge_sink_ready = 1'd0;
wire soc_uart_bridge_sink_last;
reg [7:0] soc_uart_bridge_sink_payload_data = 8'd0;
reg soc_uart_bridge_uart_clk_txen = 1'd0;
reg [31:0] soc_uart_bridge_phase_accumulator_tx = 32'd0;
reg [7:0] soc_uart_bridge_tx_reg = 8'd0;
reg [3:0] soc_uart_bridge_tx_bitcount = 4'd0;
reg soc_uart_bridge_tx_busy = 1'd0;
reg soc_uart_bridge_source_valid = 1'd0;
wire soc_uart_bridge_source_ready;
reg [7:0] soc_uart_bridge_source_payload_data = 8'd0;
reg soc_uart_bridge_uart_clk_rxen = 1'd0;
reg [31:0] soc_uart_bridge_phase_accumulator_rx = 32'd0;
wire soc_uart_bridge_rx;
reg soc_uart_bridge_rx_r = 1'd0;
reg [7:0] soc_uart_bridge_rx_reg = 8'd0;
reg [3:0] soc_uart_bridge_rx_bitcount = 4'd0;
reg soc_uart_bridge_rx_busy = 1'd0;
wire [29:0] soc_uart_bridge_wishbone_adr;
wire [31:0] soc_uart_bridge_wishbone_dat_w;
wire [31:0] soc_uart_bridge_wishbone_dat_r;
wire [3:0] soc_uart_bridge_wishbone_sel;
reg soc_uart_bridge_wishbone_cyc = 1'd0;
reg soc_uart_bridge_wishbone_stb = 1'd0;
wire soc_uart_bridge_wishbone_ack;
reg soc_uart_bridge_wishbone_we = 1'd0;
reg [2:0] soc_uart_bridge_wishbone_cti = 3'd0;
reg [1:0] soc_uart_bridge_wishbone_bte = 2'd0;
wire soc_uart_bridge_wishbone_err;
reg [2:0] soc_uart_bridge_byte_counter = 3'd0;
reg soc_uart_bridge_byte_counter_reset = 1'd0;
reg soc_uart_bridge_byte_counter_ce = 1'd0;
reg [2:0] soc_uart_bridge_word_counter = 3'd0;
reg soc_uart_bridge_word_counter_reset = 1'd0;
reg soc_uart_bridge_word_counter_ce = 1'd0;
reg [7:0] soc_uart_bridge_cmd = 8'd0;
reg soc_uart_bridge_cmd_ce = 1'd0;
reg [7:0] soc_uart_bridge_length = 8'd0;
reg soc_uart_bridge_length_ce = 1'd0;
reg [31:0] soc_uart_bridge_address = 32'd0;
reg soc_uart_bridge_address_ce = 1'd0;
reg [31:0] soc_uart_bridge_data = 32'd0;
reg soc_uart_bridge_rx_data_ce = 1'd0;
reg soc_uart_bridge_tx_data_ce = 1'd0;
wire soc_uart_bridge_reset;
wire soc_uart_bridge_wait;
wire soc_uart_bridge_done;
reg [23:0] soc_uart_bridge_count = 24'd13300000;
reg soc_uart_bridge_is_ongoing = 1'd0;
reg soc_eth_phy_reset_storage = 1'd0;
reg soc_eth_phy_reset_re = 1'd0;
(* dont_touch = "true" *) wire eth_rx_clk;
wire eth_rx_rst;
(* dont_touch = "true" *) wire eth_tx_clk;
wire eth_tx_rst;
wire eth_tx_delayed_clk;
wire soc_eth_phy_eth_rx_clk_ibuf;
reg soc_eth_phy_pll_reset = 1'd0;
wire soc_eth_phy_pll_locked;
wire soc_eth_phy_clkin;
wire soc_eth_phy_clkout0;
wire soc_eth_phy_clkout_buf0;
wire soc_eth_phy_clkout1;
wire soc_eth_phy_clkout_buf1;
wire soc_eth_phy_eth_tx_clk_obuf;
wire soc_eth_phy_reset;
wire soc_eth_phy_hw_reset_reset;
reg [8:0] soc_eth_phy_hw_reset_counter = 9'd0;
wire soc_eth_phy_hw_reset_counter_done;
wire soc_eth_phy_hw_reset_counter_ce;
wire soc_eth_phy_sink_valid;
wire soc_eth_phy_sink_ready;
wire soc_eth_phy_sink_first;
wire soc_eth_phy_sink_last;
wire [7:0] soc_eth_phy_sink_payload_data;
wire soc_eth_phy_sink_payload_last_be;
wire soc_eth_phy_sink_payload_error;
wire soc_eth_phy_tx_ctl_obuf;
wire [3:0] soc_eth_phy_tx_data_obuf;
reg soc_eth_phy_liteethphyrgmiirx_source_valid = 1'd0;
wire soc_eth_phy_liteethphyrgmiirx_source_ready;
reg soc_eth_phy_liteethphyrgmiirx_source_first = 1'd0;
wire soc_eth_phy_liteethphyrgmiirx_source_last;
reg [7:0] soc_eth_phy_liteethphyrgmiirx_source_payload_data = 8'd0;
reg soc_eth_phy_liteethphyrgmiirx_source_payload_last_be = 1'd0;
reg soc_eth_phy_liteethphyrgmiirx_source_payload_error = 1'd0;
wire soc_eth_phy_liteethphyrgmiirx_rx_ctl_ibuf;
wire soc_eth_phy_liteethphyrgmiirx_rx_ctl_idelay;
wire soc_eth_phy_liteethphyrgmiirx_rx_ctl;
wire [3:0] soc_eth_phy_liteethphyrgmiirx_rx_data_ibuf;
wire [3:0] soc_eth_phy_liteethphyrgmiirx_rx_data_idelay;
wire [7:0] soc_eth_phy_liteethphyrgmiirx_rx_data;
wire soc_eth_phy_liteethphyrgmiirx;
reg soc_eth_phy_liteethphyrgmiirx_rx_ctl_d = 1'd0;
wire soc_eth_phy_liteethphyrgmiirx_last;
wire soc_eth_phy_mdc;
wire soc_eth_phy_oe;
wire soc_eth_phy_w;
reg [2:0] soc_eth_phy_storage = 3'd0;
reg soc_eth_phy_re = 1'd0;
reg soc_eth_phy_r = 1'd0;
reg soc_eth_phy_status = 1'd0;
wire soc_eth_phy_we;
wire soc_eth_phy_data_w;
wire soc_eth_phy_data_oe;
wire soc_eth_phy_data_r;
wire soc_eth_core_mac_tx_gap_inserter_sink_valid;
reg soc_eth_core_mac_tx_gap_inserter_sink_ready = 1'd0;
wire soc_eth_core_mac_tx_gap_inserter_sink_first;
wire soc_eth_core_mac_tx_gap_inserter_sink_last;
wire [7:0] soc_eth_core_mac_tx_gap_inserter_sink_payload_data;
wire soc_eth_core_mac_tx_gap_inserter_sink_payload_last_be;
wire soc_eth_core_mac_tx_gap_inserter_sink_payload_error;
reg soc_eth_core_mac_tx_gap_inserter_source_valid = 1'd0;
wire soc_eth_core_mac_tx_gap_inserter_source_ready;
reg soc_eth_core_mac_tx_gap_inserter_source_first = 1'd0;
reg soc_eth_core_mac_tx_gap_inserter_source_last = 1'd0;
reg [7:0] soc_eth_core_mac_tx_gap_inserter_source_payload_data = 8'd0;
reg soc_eth_core_mac_tx_gap_inserter_source_payload_last_be = 1'd0;
reg soc_eth_core_mac_tx_gap_inserter_source_payload_error = 1'd0;
reg [3:0] soc_eth_core_mac_tx_gap_inserter_counter = 4'd0;
reg soc_eth_core_mac_tx_gap_inserter_counter_reset = 1'd0;
reg soc_eth_core_mac_tx_gap_inserter_counter_ce = 1'd0;
reg [31:0] soc_eth_core_mac_preamble_errors_status = 32'd0;
reg [31:0] soc_eth_core_mac_crc_errors_status = 32'd0;
wire soc_eth_core_mac_preamble_inserter_sink_valid;
reg soc_eth_core_mac_preamble_inserter_sink_ready = 1'd0;
wire soc_eth_core_mac_preamble_inserter_sink_first;
wire soc_eth_core_mac_preamble_inserter_sink_last;
wire [7:0] soc_eth_core_mac_preamble_inserter_sink_payload_data;
wire soc_eth_core_mac_preamble_inserter_sink_payload_last_be;
wire soc_eth_core_mac_preamble_inserter_sink_payload_error;
reg soc_eth_core_mac_preamble_inserter_source_valid = 1'd0;
wire soc_eth_core_mac_preamble_inserter_source_ready;
reg soc_eth_core_mac_preamble_inserter_source_first = 1'd0;
reg soc_eth_core_mac_preamble_inserter_source_last = 1'd0;
reg [7:0] soc_eth_core_mac_preamble_inserter_source_payload_data = 8'd0;
wire soc_eth_core_mac_preamble_inserter_source_payload_last_be;
reg soc_eth_core_mac_preamble_inserter_source_payload_error = 1'd0;
reg [63:0] soc_eth_core_mac_preamble_inserter_preamble = 64'd15372286728091293013;
reg [2:0] soc_eth_core_mac_preamble_inserter_cnt = 3'd0;
reg soc_eth_core_mac_preamble_inserter_clr_cnt = 1'd0;
reg soc_eth_core_mac_preamble_inserter_inc_cnt = 1'd0;
wire soc_eth_core_mac_preamble_checker_sink_valid;
reg soc_eth_core_mac_preamble_checker_sink_ready = 1'd0;
wire soc_eth_core_mac_preamble_checker_sink_first;
wire soc_eth_core_mac_preamble_checker_sink_last;
wire [7:0] soc_eth_core_mac_preamble_checker_sink_payload_data;
wire soc_eth_core_mac_preamble_checker_sink_payload_last_be;
wire soc_eth_core_mac_preamble_checker_sink_payload_error;
reg soc_eth_core_mac_preamble_checker_source_valid = 1'd0;
wire soc_eth_core_mac_preamble_checker_source_ready;
reg soc_eth_core_mac_preamble_checker_source_first = 1'd0;
reg soc_eth_core_mac_preamble_checker_source_last = 1'd0;
wire [7:0] soc_eth_core_mac_preamble_checker_source_payload_data;
wire soc_eth_core_mac_preamble_checker_source_payload_last_be;
reg soc_eth_core_mac_preamble_checker_source_payload_error = 1'd0;
reg soc_eth_core_mac_preamble_checker_error = 1'd0;
wire soc_eth_core_mac_crc32_inserter_sink_valid;
reg soc_eth_core_mac_crc32_inserter_sink_ready = 1'd0;
wire soc_eth_core_mac_crc32_inserter_sink_first;
wire soc_eth_core_mac_crc32_inserter_sink_last;
wire [7:0] soc_eth_core_mac_crc32_inserter_sink_payload_data;
wire soc_eth_core_mac_crc32_inserter_sink_payload_last_be;
wire soc_eth_core_mac_crc32_inserter_sink_payload_error;
reg soc_eth_core_mac_crc32_inserter_source_valid = 1'd0;
wire soc_eth_core_mac_crc32_inserter_source_ready;
reg soc_eth_core_mac_crc32_inserter_source_first = 1'd0;
reg soc_eth_core_mac_crc32_inserter_source_last = 1'd0;
reg [7:0] soc_eth_core_mac_crc32_inserter_source_payload_data = 8'd0;
reg soc_eth_core_mac_crc32_inserter_source_payload_last_be = 1'd0;
reg soc_eth_core_mac_crc32_inserter_source_payload_error = 1'd0;
reg [7:0] soc_eth_core_mac_crc32_inserter_data0 = 8'd0;
wire [31:0] soc_eth_core_mac_crc32_inserter_value;
wire soc_eth_core_mac_crc32_inserter_error;
wire [7:0] soc_eth_core_mac_crc32_inserter_data1;
wire [31:0] soc_eth_core_mac_crc32_inserter_last;
reg [31:0] soc_eth_core_mac_crc32_inserter_next = 32'd0;
reg [31:0] soc_eth_core_mac_crc32_inserter_reg = 32'd4294967295;
reg soc_eth_core_mac_crc32_inserter_ce = 1'd0;
reg soc_eth_core_mac_crc32_inserter_reset = 1'd0;
reg [1:0] soc_eth_core_mac_crc32_inserter_cnt = 2'd3;
wire soc_eth_core_mac_crc32_inserter_cnt_done;
reg soc_eth_core_mac_crc32_inserter_is_ongoing0 = 1'd0;
reg soc_eth_core_mac_crc32_inserter_is_ongoing1 = 1'd0;
wire soc_eth_core_mac_crc32_checker_sink_sink_valid;
reg soc_eth_core_mac_crc32_checker_sink_sink_ready = 1'd0;
wire soc_eth_core_mac_crc32_checker_sink_sink_first;
wire soc_eth_core_mac_crc32_checker_sink_sink_last;
wire [7:0] soc_eth_core_mac_crc32_checker_sink_sink_payload_data;
wire soc_eth_core_mac_crc32_checker_sink_sink_payload_last_be;
wire soc_eth_core_mac_crc32_checker_sink_sink_payload_error;
wire soc_eth_core_mac_crc32_checker_source_source_valid;
wire soc_eth_core_mac_crc32_checker_source_source_ready;
reg soc_eth_core_mac_crc32_checker_source_source_first = 1'd0;
wire soc_eth_core_mac_crc32_checker_source_source_last;
wire [7:0] soc_eth_core_mac_crc32_checker_source_source_payload_data;
wire soc_eth_core_mac_crc32_checker_source_source_payload_last_be;
reg soc_eth_core_mac_crc32_checker_source_source_payload_error = 1'd0;
wire soc_eth_core_mac_crc32_checker_error;
wire [7:0] soc_eth_core_mac_crc32_checker_crc_data0;
wire [31:0] soc_eth_core_mac_crc32_checker_crc_value;
wire soc_eth_core_mac_crc32_checker_crc_error;
wire [7:0] soc_eth_core_mac_crc32_checker_crc_data1;
wire [31:0] soc_eth_core_mac_crc32_checker_crc_last;
reg [31:0] soc_eth_core_mac_crc32_checker_crc_next = 32'd0;
reg [31:0] soc_eth_core_mac_crc32_checker_crc_reg = 32'd4294967295;
reg soc_eth_core_mac_crc32_checker_crc_ce = 1'd0;
reg soc_eth_core_mac_crc32_checker_crc_reset = 1'd0;
reg soc_eth_core_mac_crc32_checker_syncfifo_sink_valid = 1'd0;
wire soc_eth_core_mac_crc32_checker_syncfifo_sink_ready;
wire soc_eth_core_mac_crc32_checker_syncfifo_sink_first;
wire soc_eth_core_mac_crc32_checker_syncfifo_sink_last;
wire [7:0] soc_eth_core_mac_crc32_checker_syncfifo_sink_payload_data;
wire soc_eth_core_mac_crc32_checker_syncfifo_sink_payload_last_be;
wire soc_eth_core_mac_crc32_checker_syncfifo_sink_payload_error;
wire soc_eth_core_mac_crc32_checker_syncfifo_source_valid;
wire soc_eth_core_mac_crc32_checker_syncfifo_source_ready;
wire soc_eth_core_mac_crc32_checker_syncfifo_source_first;
wire soc_eth_core_mac_crc32_checker_syncfifo_source_last;
wire [7:0] soc_eth_core_mac_crc32_checker_syncfifo_source_payload_data;
wire soc_eth_core_mac_crc32_checker_syncfifo_source_payload_last_be;
wire soc_eth_core_mac_crc32_checker_syncfifo_source_payload_error;
wire soc_eth_core_mac_crc32_checker_syncfifo_syncfifo_we;
wire soc_eth_core_mac_crc32_checker_syncfifo_syncfifo_writable;
wire soc_eth_core_mac_crc32_checker_syncfifo_syncfifo_re;
wire soc_eth_core_mac_crc32_checker_syncfifo_syncfifo_readable;
wire [11:0] soc_eth_core_mac_crc32_checker_syncfifo_syncfifo_din;
wire [11:0] soc_eth_core_mac_crc32_checker_syncfifo_syncfifo_dout;
reg [2:0] soc_eth_core_mac_crc32_checker_syncfifo_level = 3'd0;
reg soc_eth_core_mac_crc32_checker_syncfifo_replace = 1'd0;
reg [2:0] soc_eth_core_mac_crc32_checker_syncfifo_produce = 3'd0;
reg [2:0] soc_eth_core_mac_crc32_checker_syncfifo_consume = 3'd0;
reg [2:0] soc_eth_core_mac_crc32_checker_syncfifo_wrport_adr = 3'd0;
wire [11:0] soc_eth_core_mac_crc32_checker_syncfifo_wrport_dat_r;
wire soc_eth_core_mac_crc32_checker_syncfifo_wrport_we;
wire [11:0] soc_eth_core_mac_crc32_checker_syncfifo_wrport_dat_w;
wire soc_eth_core_mac_crc32_checker_syncfifo_do_read;
wire [2:0] soc_eth_core_mac_crc32_checker_syncfifo_rdport_adr;
wire [11:0] soc_eth_core_mac_crc32_checker_syncfifo_rdport_dat_r;
wire [7:0] soc_eth_core_mac_crc32_checker_syncfifo_fifo_in_payload_data;
wire soc_eth_core_mac_crc32_checker_syncfifo_fifo_in_payload_last_be;
wire soc_eth_core_mac_crc32_checker_syncfifo_fifo_in_payload_error;
wire soc_eth_core_mac_crc32_checker_syncfifo_fifo_in_first;
wire soc_eth_core_mac_crc32_checker_syncfifo_fifo_in_last;
wire [7:0] soc_eth_core_mac_crc32_checker_syncfifo_fifo_out_payload_data;
wire soc_eth_core_mac_crc32_checker_syncfifo_fifo_out_payload_last_be;
wire soc_eth_core_mac_crc32_checker_syncfifo_fifo_out_payload_error;
wire soc_eth_core_mac_crc32_checker_syncfifo_fifo_out_first;
wire soc_eth_core_mac_crc32_checker_syncfifo_fifo_out_last;
reg soc_eth_core_mac_crc32_checker_fifo_reset = 1'd0;
wire soc_eth_core_mac_crc32_checker_fifo_in;
wire soc_eth_core_mac_crc32_checker_fifo_out;
wire soc_eth_core_mac_crc32_checker_fifo_full;
wire soc_eth_core_mac_ps_preamble_error_i;
wire soc_eth_core_mac_ps_preamble_error_o;
reg soc_eth_core_mac_ps_preamble_error_toggle_i = 1'd0;
wire soc_eth_core_mac_ps_preamble_error_toggle_o;
reg soc_eth_core_mac_ps_preamble_error_toggle_o_r = 1'd0;
wire soc_eth_core_mac_ps_crc_error_i;
wire soc_eth_core_mac_ps_crc_error_o;
reg soc_eth_core_mac_ps_crc_error_toggle_i = 1'd0;
wire soc_eth_core_mac_ps_crc_error_toggle_o;
reg soc_eth_core_mac_ps_crc_error_toggle_o_r = 1'd0;
wire soc_eth_core_mac_padding_inserter_sink_valid;
reg soc_eth_core_mac_padding_inserter_sink_ready = 1'd0;
wire soc_eth_core_mac_padding_inserter_sink_first;
wire soc_eth_core_mac_padding_inserter_sink_last;
wire [7:0] soc_eth_core_mac_padding_inserter_sink_payload_data;
wire soc_eth_core_mac_padding_inserter_sink_payload_last_be;
wire soc_eth_core_mac_padding_inserter_sink_payload_error;
reg soc_eth_core_mac_padding_inserter_source_valid = 1'd0;
wire soc_eth_core_mac_padding_inserter_source_ready;
reg soc_eth_core_mac_padding_inserter_source_first = 1'd0;
reg soc_eth_core_mac_padding_inserter_source_last = 1'd0;
reg [7:0] soc_eth_core_mac_padding_inserter_source_payload_data = 8'd0;
reg soc_eth_core_mac_padding_inserter_source_payload_last_be = 1'd0;
reg soc_eth_core_mac_padding_inserter_source_payload_error = 1'd0;
reg [15:0] soc_eth_core_mac_padding_inserter_counter = 16'd1;
wire soc_eth_core_mac_padding_inserter_counter_done;
reg soc_eth_core_mac_padding_inserter_counter_reset = 1'd0;
reg soc_eth_core_mac_padding_inserter_counter_ce = 1'd0;
wire soc_eth_core_mac_padding_checker_sink_valid;
wire soc_eth_core_mac_padding_checker_sink_ready;
wire soc_eth_core_mac_padding_checker_sink_first;
wire soc_eth_core_mac_padding_checker_sink_last;
wire [7:0] soc_eth_core_mac_padding_checker_sink_payload_data;
wire soc_eth_core_mac_padding_checker_sink_payload_last_be;
wire soc_eth_core_mac_padding_checker_sink_payload_error;
wire soc_eth_core_mac_padding_checker_source_valid;
wire soc_eth_core_mac_padding_checker_source_ready;
wire soc_eth_core_mac_padding_checker_source_first;
wire soc_eth_core_mac_padding_checker_source_last;
wire [7:0] soc_eth_core_mac_padding_checker_source_payload_data;
wire soc_eth_core_mac_padding_checker_source_payload_last_be;
wire soc_eth_core_mac_padding_checker_source_payload_error;
wire soc_eth_core_mac_tx_cdc_sink_valid;
wire soc_eth_core_mac_tx_cdc_sink_ready;
wire soc_eth_core_mac_tx_cdc_sink_first;
wire soc_eth_core_mac_tx_cdc_sink_last;
wire [7:0] soc_eth_core_mac_tx_cdc_sink_payload_data;
wire soc_eth_core_mac_tx_cdc_sink_payload_last_be;
wire soc_eth_core_mac_tx_cdc_sink_payload_error;
wire soc_eth_core_mac_tx_cdc_source_valid;
wire soc_eth_core_mac_tx_cdc_source_ready;
wire soc_eth_core_mac_tx_cdc_source_first;
wire soc_eth_core_mac_tx_cdc_source_last;
wire [7:0] soc_eth_core_mac_tx_cdc_source_payload_data;
wire soc_eth_core_mac_tx_cdc_source_payload_last_be;
wire soc_eth_core_mac_tx_cdc_source_payload_error;
wire soc_eth_core_mac_tx_cdc_asyncfifo_we;
wire soc_eth_core_mac_tx_cdc_asyncfifo_writable;
wire soc_eth_core_mac_tx_cdc_asyncfifo_re;
wire soc_eth_core_mac_tx_cdc_asyncfifo_readable;
wire [11:0] soc_eth_core_mac_tx_cdc_asyncfifo_din;
wire [11:0] soc_eth_core_mac_tx_cdc_asyncfifo_dout;
wire soc_eth_core_mac_tx_cdc_graycounter0_ce;
(* dont_touch = "true" *) reg [6:0] soc_eth_core_mac_tx_cdc_graycounter0_q = 7'd0;
wire [6:0] soc_eth_core_mac_tx_cdc_graycounter0_q_next;
reg [6:0] soc_eth_core_mac_tx_cdc_graycounter0_q_binary = 7'd0;
reg [6:0] soc_eth_core_mac_tx_cdc_graycounter0_q_next_binary = 7'd0;
wire soc_eth_core_mac_tx_cdc_graycounter1_ce;
(* dont_touch = "true" *) reg [6:0] soc_eth_core_mac_tx_cdc_graycounter1_q = 7'd0;
wire [6:0] soc_eth_core_mac_tx_cdc_graycounter1_q_next;
reg [6:0] soc_eth_core_mac_tx_cdc_graycounter1_q_binary = 7'd0;
reg [6:0] soc_eth_core_mac_tx_cdc_graycounter1_q_next_binary = 7'd0;
wire [6:0] soc_eth_core_mac_tx_cdc_produce_rdomain;
wire [6:0] soc_eth_core_mac_tx_cdc_consume_wdomain;
wire [5:0] soc_eth_core_mac_tx_cdc_wrport_adr;
wire [11:0] soc_eth_core_mac_tx_cdc_wrport_dat_r;
wire soc_eth_core_mac_tx_cdc_wrport_we;
wire [11:0] soc_eth_core_mac_tx_cdc_wrport_dat_w;
wire [5:0] soc_eth_core_mac_tx_cdc_rdport_adr;
wire [11:0] soc_eth_core_mac_tx_cdc_rdport_dat_r;
wire [7:0] soc_eth_core_mac_tx_cdc_fifo_in_payload_data;
wire soc_eth_core_mac_tx_cdc_fifo_in_payload_last_be;
wire soc_eth_core_mac_tx_cdc_fifo_in_payload_error;
wire soc_eth_core_mac_tx_cdc_fifo_in_first;
wire soc_eth_core_mac_tx_cdc_fifo_in_last;
wire [7:0] soc_eth_core_mac_tx_cdc_fifo_out_payload_data;
wire soc_eth_core_mac_tx_cdc_fifo_out_payload_last_be;
wire soc_eth_core_mac_tx_cdc_fifo_out_payload_error;
wire soc_eth_core_mac_tx_cdc_fifo_out_first;
wire soc_eth_core_mac_tx_cdc_fifo_out_last;
wire soc_eth_core_mac_rx_cdc_sink_valid;
wire soc_eth_core_mac_rx_cdc_sink_ready;
wire soc_eth_core_mac_rx_cdc_sink_first;
wire soc_eth_core_mac_rx_cdc_sink_last;
wire [7:0] soc_eth_core_mac_rx_cdc_sink_payload_data;
wire soc_eth_core_mac_rx_cdc_sink_payload_last_be;
wire soc_eth_core_mac_rx_cdc_sink_payload_error;
wire soc_eth_core_mac_rx_cdc_source_valid;
wire soc_eth_core_mac_rx_cdc_source_ready;
wire soc_eth_core_mac_rx_cdc_source_first;
wire soc_eth_core_mac_rx_cdc_source_last;
wire [7:0] soc_eth_core_mac_rx_cdc_source_payload_data;
wire soc_eth_core_mac_rx_cdc_source_payload_last_be;
wire soc_eth_core_mac_rx_cdc_source_payload_error;
wire soc_eth_core_mac_rx_cdc_asyncfifo_we;
wire soc_eth_core_mac_rx_cdc_asyncfifo_writable;
wire soc_eth_core_mac_rx_cdc_asyncfifo_re;
wire soc_eth_core_mac_rx_cdc_asyncfifo_readable;
wire [11:0] soc_eth_core_mac_rx_cdc_asyncfifo_din;
wire [11:0] soc_eth_core_mac_rx_cdc_asyncfifo_dout;
wire soc_eth_core_mac_rx_cdc_graycounter0_ce;
(* dont_touch = "true" *) reg [6:0] soc_eth_core_mac_rx_cdc_graycounter0_q = 7'd0;
wire [6:0] soc_eth_core_mac_rx_cdc_graycounter0_q_next;
reg [6:0] soc_eth_core_mac_rx_cdc_graycounter0_q_binary = 7'd0;
reg [6:0] soc_eth_core_mac_rx_cdc_graycounter0_q_next_binary = 7'd0;
wire soc_eth_core_mac_rx_cdc_graycounter1_ce;
(* dont_touch = "true" *) reg [6:0] soc_eth_core_mac_rx_cdc_graycounter1_q = 7'd0;
wire [6:0] soc_eth_core_mac_rx_cdc_graycounter1_q_next;
reg [6:0] soc_eth_core_mac_rx_cdc_graycounter1_q_binary = 7'd0;
reg [6:0] soc_eth_core_mac_rx_cdc_graycounter1_q_next_binary = 7'd0;
wire [6:0] soc_eth_core_mac_rx_cdc_produce_rdomain;
wire [6:0] soc_eth_core_mac_rx_cdc_consume_wdomain;
wire [5:0] soc_eth_core_mac_rx_cdc_wrport_adr;
wire [11:0] soc_eth_core_mac_rx_cdc_wrport_dat_r;
wire soc_eth_core_mac_rx_cdc_wrport_we;
wire [11:0] soc_eth_core_mac_rx_cdc_wrport_dat_w;
wire [5:0] soc_eth_core_mac_rx_cdc_rdport_adr;
wire [11:0] soc_eth_core_mac_rx_cdc_rdport_dat_r;
wire [7:0] soc_eth_core_mac_rx_cdc_fifo_in_payload_data;
wire soc_eth_core_mac_rx_cdc_fifo_in_payload_last_be;
wire soc_eth_core_mac_rx_cdc_fifo_in_payload_error;
wire soc_eth_core_mac_rx_cdc_fifo_in_first;
wire soc_eth_core_mac_rx_cdc_fifo_in_last;
wire [7:0] soc_eth_core_mac_rx_cdc_fifo_out_payload_data;
wire soc_eth_core_mac_rx_cdc_fifo_out_payload_last_be;
wire soc_eth_core_mac_rx_cdc_fifo_out_payload_error;
wire soc_eth_core_mac_rx_cdc_fifo_out_first;
wire soc_eth_core_mac_rx_cdc_fifo_out_last;
reg soc_eth_core_mac_crossbar_source_valid = 1'd0;
wire soc_eth_core_mac_crossbar_source_ready;
reg soc_eth_core_mac_crossbar_source_first = 1'd0;
reg soc_eth_core_mac_crossbar_source_last = 1'd0;
reg [15:0] soc_eth_core_mac_crossbar_source_payload_ethernet_type = 16'd0;
reg [47:0] soc_eth_core_mac_crossbar_source_payload_sender_mac = 48'd0;
reg [47:0] soc_eth_core_mac_crossbar_source_payload_target_mac = 48'd0;
reg [7:0] soc_eth_core_mac_crossbar_source_payload_data = 8'd0;
reg soc_eth_core_mac_crossbar_source_payload_last_be = 1'd0;
reg soc_eth_core_mac_crossbar_source_payload_error = 1'd0;
wire soc_eth_core_mac_crossbar_sink_valid;
reg soc_eth_core_mac_crossbar_sink_ready = 1'd0;
wire soc_eth_core_mac_crossbar_sink_first;
wire soc_eth_core_mac_crossbar_sink_last;
wire [15:0] soc_eth_core_mac_crossbar_sink_payload_ethernet_type;
wire [47:0] soc_eth_core_mac_crossbar_sink_payload_sender_mac;
wire [47:0] soc_eth_core_mac_crossbar_sink_payload_target_mac;
wire [7:0] soc_eth_core_mac_crossbar_sink_payload_data;
wire soc_eth_core_mac_crossbar_sink_payload_last_be;
wire soc_eth_core_mac_crossbar_sink_payload_error;
wire soc_eth_core_mac_packetizer_sink_valid;
reg soc_eth_core_mac_packetizer_sink_ready = 1'd0;
wire soc_eth_core_mac_packetizer_sink_first;
wire soc_eth_core_mac_packetizer_sink_last;
wire [15:0] soc_eth_core_mac_packetizer_sink_payload_ethernet_type;
wire [47:0] soc_eth_core_mac_packetizer_sink_payload_sender_mac;
wire [47:0] soc_eth_core_mac_packetizer_sink_payload_target_mac;
wire [7:0] soc_eth_core_mac_packetizer_sink_payload_data;
wire soc_eth_core_mac_packetizer_sink_payload_last_be;
wire soc_eth_core_mac_packetizer_sink_payload_error;
reg soc_eth_core_mac_packetizer_source_valid = 1'd0;
wire soc_eth_core_mac_packetizer_source_ready;
reg soc_eth_core_mac_packetizer_source_first = 1'd0;
reg soc_eth_core_mac_packetizer_source_last = 1'd0;
reg [7:0] soc_eth_core_mac_packetizer_source_payload_data = 8'd0;
wire soc_eth_core_mac_packetizer_source_payload_last_be;
wire soc_eth_core_mac_packetizer_source_payload_error;
reg [111:0] soc_eth_core_mac_packetizer_header = 112'd0;
reg [111:0] soc_eth_core_mac_packetizer_sr = 112'd0;
reg soc_eth_core_mac_packetizer_sr_load = 1'd0;
reg soc_eth_core_mac_packetizer_sr_shift = 1'd0;
reg [3:0] soc_eth_core_mac_packetizer_count = 4'd0;
reg soc_eth_core_mac_packetizer_sink_d_valid = 1'd0;
reg soc_eth_core_mac_packetizer_sink_d_ready = 1'd0;
reg soc_eth_core_mac_packetizer_sink_d_first = 1'd0;
reg soc_eth_core_mac_packetizer_sink_d_last = 1'd0;
reg [15:0] soc_eth_core_mac_packetizer_sink_d_payload_ethernet_type = 16'd0;
reg [47:0] soc_eth_core_mac_packetizer_sink_d_payload_sender_mac = 48'd0;
reg [47:0] soc_eth_core_mac_packetizer_sink_d_payload_target_mac = 48'd0;
reg [7:0] soc_eth_core_mac_packetizer_sink_d_payload_data = 8'd0;
reg soc_eth_core_mac_packetizer_sink_d_payload_last_be = 1'd0;
reg soc_eth_core_mac_packetizer_sink_d_payload_error = 1'd0;
reg soc_eth_core_mac_packetizer_fsm_from_idle = 1'd0;
wire soc_eth_core_mac_depacketizer_sink_valid;
reg soc_eth_core_mac_depacketizer_sink_ready = 1'd0;
wire soc_eth_core_mac_depacketizer_sink_first;
wire soc_eth_core_mac_depacketizer_sink_last;
wire [7:0] soc_eth_core_mac_depacketizer_sink_payload_data;
wire soc_eth_core_mac_depacketizer_sink_payload_last_be;
wire soc_eth_core_mac_depacketizer_sink_payload_error;
reg soc_eth_core_mac_depacketizer_source_valid = 1'd0;
wire soc_eth_core_mac_depacketizer_source_ready;
reg soc_eth_core_mac_depacketizer_source_first = 1'd0;
reg soc_eth_core_mac_depacketizer_source_last = 1'd0;
wire [15:0] soc_eth_core_mac_depacketizer_source_payload_ethernet_type;
wire [47:0] soc_eth_core_mac_depacketizer_source_payload_sender_mac;
wire [47:0] soc_eth_core_mac_depacketizer_source_payload_target_mac;
reg [7:0] soc_eth_core_mac_depacketizer_source_payload_data = 8'd0;
wire soc_eth_core_mac_depacketizer_source_payload_last_be;
wire soc_eth_core_mac_depacketizer_source_payload_error;
wire [111:0] soc_eth_core_mac_depacketizer_header;
reg [111:0] soc_eth_core_mac_depacketizer_sr = 112'd0;
reg soc_eth_core_mac_depacketizer_sr_shift = 1'd0;
reg soc_eth_core_mac_depacketizer_sr_shift_leftover = 1'd0;
reg [3:0] soc_eth_core_mac_depacketizer_count = 4'd0;
reg soc_eth_core_mac_depacketizer_sink_d_valid = 1'd0;
reg soc_eth_core_mac_depacketizer_sink_d_ready = 1'd0;
reg soc_eth_core_mac_depacketizer_sink_d_first = 1'd0;
reg soc_eth_core_mac_depacketizer_sink_d_last = 1'd0;
reg [7:0] soc_eth_core_mac_depacketizer_sink_d_payload_data = 8'd0;
reg soc_eth_core_mac_depacketizer_sink_d_payload_last_be = 1'd0;
reg soc_eth_core_mac_depacketizer_sink_d_payload_error = 1'd0;
reg soc_eth_core_mac_depacketizer_fsm_from_idle = 1'd0;
wire soc_eth_core_arp_tx_sink_sink_valid;
reg soc_eth_core_arp_tx_sink_sink_ready = 1'd0;
wire soc_eth_core_arp_tx_sink_sink_first;
wire soc_eth_core_arp_tx_sink_sink_last;
wire soc_eth_core_arp_tx_sink_sink_payload_reply;
wire soc_eth_core_arp_tx_sink_sink_payload_request;
wire [31:0] soc_eth_core_arp_tx_sink_sink_payload_ip_address;
wire [47:0] soc_eth_core_arp_tx_sink_sink_payload_mac_address;
reg soc_eth_core_arp_tx_source_source_valid = 1'd0;
wire soc_eth_core_arp_tx_source_source_ready;
reg soc_eth_core_arp_tx_source_source_first = 1'd0;
reg soc_eth_core_arp_tx_source_source_last = 1'd0;
reg [15:0] soc_eth_core_arp_tx_source_source_payload_ethernet_type = 16'd0;
reg [47:0] soc_eth_core_arp_tx_source_source_payload_sender_mac = 48'd0;
reg [47:0] soc_eth_core_arp_tx_source_source_payload_target_mac = 48'd0;
reg [7:0] soc_eth_core_arp_tx_source_source_payload_data = 8'd0;
reg soc_eth_core_arp_tx_source_source_payload_last_be = 1'd0;
reg soc_eth_core_arp_tx_source_source_payload_error = 1'd0;
reg soc_eth_core_arp_tx_packetizer_sink_valid = 1'd0;
reg soc_eth_core_arp_tx_packetizer_sink_ready = 1'd0;
reg soc_eth_core_arp_tx_packetizer_sink_first = 1'd0;
wire soc_eth_core_arp_tx_packetizer_sink_last;
reg [7:0] soc_eth_core_arp_tx_packetizer_sink_payload_data = 8'd0;
reg soc_eth_core_arp_tx_packetizer_sink_payload_error = 1'd0;
wire [7:0] soc_eth_core_arp_tx_packetizer_sink_param_hwsize;
wire [15:0] soc_eth_core_arp_tx_packetizer_sink_param_hwtype;
reg [15:0] soc_eth_core_arp_tx_packetizer_sink_param_opcode = 16'd0;
wire [15:0] soc_eth_core_arp_tx_packetizer_sink_param_proto;
wire [7:0] soc_eth_core_arp_tx_packetizer_sink_param_protosize;
wire [31:0] soc_eth_core_arp_tx_packetizer_sink_param_sender_ip;
wire [47:0] soc_eth_core_arp_tx_packetizer_sink_param_sender_mac;
reg [31:0] soc_eth_core_arp_tx_packetizer_sink_param_target_ip = 32'd0;
reg [47:0] soc_eth_core_arp_tx_packetizer_sink_param_target_mac = 48'd0;
reg soc_eth_core_arp_tx_packetizer_source_valid = 1'd0;
reg soc_eth_core_arp_tx_packetizer_source_ready = 1'd0;
reg soc_eth_core_arp_tx_packetizer_source_first = 1'd0;
reg soc_eth_core_arp_tx_packetizer_source_last = 1'd0;
reg [15:0] soc_eth_core_arp_tx_packetizer_source_payload_ethernet_type = 16'd0;
reg [47:0] soc_eth_core_arp_tx_packetizer_source_payload_sender_mac = 48'd0;
reg [47:0] soc_eth_core_arp_tx_packetizer_source_payload_target_mac = 48'd0;
reg [7:0] soc_eth_core_arp_tx_packetizer_source_payload_data = 8'd0;
reg soc_eth_core_arp_tx_packetizer_source_payload_last_be = 1'd0;
wire soc_eth_core_arp_tx_packetizer_source_payload_error;
reg [223:0] soc_eth_core_arp_tx_packetizer_header = 224'd0;
reg [223:0] soc_eth_core_arp_tx_packetizer_sr = 224'd0;
reg soc_eth_core_arp_tx_packetizer_sr_load = 1'd0;
reg soc_eth_core_arp_tx_packetizer_sr_shift = 1'd0;
reg [4:0] soc_eth_core_arp_tx_packetizer_count = 5'd0;
reg soc_eth_core_arp_tx_packetizer_sink_d_valid = 1'd0;
reg soc_eth_core_arp_tx_packetizer_sink_d_ready = 1'd0;
reg soc_eth_core_arp_tx_packetizer_sink_d_first = 1'd0;
reg soc_eth_core_arp_tx_packetizer_sink_d_last = 1'd0;
reg [7:0] soc_eth_core_arp_tx_packetizer_sink_d_payload_data = 8'd0;
reg soc_eth_core_arp_tx_packetizer_sink_d_payload_error = 1'd0;
reg [7:0] soc_eth_core_arp_tx_packetizer_sink_d_param_hwsize = 8'd0;
reg [15:0] soc_eth_core_arp_tx_packetizer_sink_d_param_hwtype = 16'd0;
reg [15:0] soc_eth_core_arp_tx_packetizer_sink_d_param_opcode = 16'd0;
reg [15:0] soc_eth_core_arp_tx_packetizer_sink_d_param_proto = 16'd0;
reg [7:0] soc_eth_core_arp_tx_packetizer_sink_d_param_protosize = 8'd0;
reg [31:0] soc_eth_core_arp_tx_packetizer_sink_d_param_sender_ip = 32'd0;
reg [47:0] soc_eth_core_arp_tx_packetizer_sink_d_param_sender_mac = 48'd0;
reg [31:0] soc_eth_core_arp_tx_packetizer_sink_d_param_target_ip = 32'd0;
reg [47:0] soc_eth_core_arp_tx_packetizer_sink_d_param_target_mac = 48'd0;
reg soc_eth_core_arp_tx_packetizer_fsm_from_idle = 1'd0;
reg [5:0] soc_eth_core_arp_tx_counter = 6'd0;
reg soc_eth_core_arp_tx_counter_reset = 1'd0;
reg soc_eth_core_arp_tx_counter_ce = 1'd0;
wire soc_eth_core_arp_rx_sink_sink_valid;
wire soc_eth_core_arp_rx_sink_sink_ready;
wire soc_eth_core_arp_rx_sink_sink_first;
wire soc_eth_core_arp_rx_sink_sink_last;
wire [15:0] soc_eth_core_arp_rx_sink_sink_payload_ethernet_type;
wire [47:0] soc_eth_core_arp_rx_sink_sink_payload_sender_mac;
wire [47:0] soc_eth_core_arp_rx_sink_sink_payload_target_mac;
wire [7:0] soc_eth_core_arp_rx_sink_sink_payload_data;
wire soc_eth_core_arp_rx_sink_sink_payload_last_be;
wire soc_eth_core_arp_rx_sink_sink_payload_error;
reg soc_eth_core_arp_rx_source_source_valid = 1'd0;
wire soc_eth_core_arp_rx_source_source_ready;
reg soc_eth_core_arp_rx_source_source_first = 1'd0;
reg soc_eth_core_arp_rx_source_source_last = 1'd0;
reg soc_eth_core_arp_rx_source_source_payload_reply = 1'd0;
reg soc_eth_core_arp_rx_source_source_payload_request = 1'd0;
wire [31:0] soc_eth_core_arp_rx_source_source_payload_ip_address;
wire [47:0] soc_eth_core_arp_rx_source_source_payload_mac_address;
wire soc_eth_core_arp_rx_depacketizer_sink_valid;
reg soc_eth_core_arp_rx_depacketizer_sink_ready = 1'd0;
wire soc_eth_core_arp_rx_depacketizer_sink_first;
wire soc_eth_core_arp_rx_depacketizer_sink_last;
wire [15:0] soc_eth_core_arp_rx_depacketizer_sink_payload_ethernet_type;
wire [47:0] soc_eth_core_arp_rx_depacketizer_sink_payload_sender_mac;
wire [47:0] soc_eth_core_arp_rx_depacketizer_sink_payload_target_mac;
wire [7:0] soc_eth_core_arp_rx_depacketizer_sink_payload_data;
wire soc_eth_core_arp_rx_depacketizer_sink_payload_last_be;
wire soc_eth_core_arp_rx_depacketizer_sink_payload_error;
reg soc_eth_core_arp_rx_depacketizer_source_valid = 1'd0;
reg soc_eth_core_arp_rx_depacketizer_source_ready = 1'd0;
reg soc_eth_core_arp_rx_depacketizer_source_last = 1'd0;
reg [7:0] soc_eth_core_arp_rx_depacketizer_source_payload_data = 8'd0;
wire soc_eth_core_arp_rx_depacketizer_source_payload_error;
wire [7:0] soc_eth_core_arp_rx_depacketizer_source_param_hwsize;
wire [15:0] soc_eth_core_arp_rx_depacketizer_source_param_hwtype;
wire [15:0] soc_eth_core_arp_rx_depacketizer_source_param_opcode;
wire [15:0] soc_eth_core_arp_rx_depacketizer_source_param_proto;
wire [7:0] soc_eth_core_arp_rx_depacketizer_source_param_protosize;
wire [31:0] soc_eth_core_arp_rx_depacketizer_source_param_sender_ip;
wire [47:0] soc_eth_core_arp_rx_depacketizer_source_param_sender_mac;
wire [31:0] soc_eth_core_arp_rx_depacketizer_source_param_target_ip;
wire [47:0] soc_eth_core_arp_rx_depacketizer_source_param_target_mac;
wire [223:0] soc_eth_core_arp_rx_depacketizer_header;
reg [223:0] soc_eth_core_arp_rx_depacketizer_sr = 224'd0;
reg soc_eth_core_arp_rx_depacketizer_sr_shift = 1'd0;
reg soc_eth_core_arp_rx_depacketizer_sr_shift_leftover = 1'd0;
reg [4:0] soc_eth_core_arp_rx_depacketizer_count = 5'd0;
reg soc_eth_core_arp_rx_depacketizer_sink_d_valid = 1'd0;
reg soc_eth_core_arp_rx_depacketizer_sink_d_ready = 1'd0;
reg soc_eth_core_arp_rx_depacketizer_sink_d_first = 1'd0;
reg soc_eth_core_arp_rx_depacketizer_sink_d_last = 1'd0;
reg [15:0] soc_eth_core_arp_rx_depacketizer_sink_d_payload_ethernet_type = 16'd0;
reg [47:0] soc_eth_core_arp_rx_depacketizer_sink_d_payload_sender_mac = 48'd0;
reg [47:0] soc_eth_core_arp_rx_depacketizer_sink_d_payload_target_mac = 48'd0;
reg [7:0] soc_eth_core_arp_rx_depacketizer_sink_d_payload_data = 8'd0;
reg soc_eth_core_arp_rx_depacketizer_sink_d_payload_last_be = 1'd0;
reg soc_eth_core_arp_rx_depacketizer_sink_d_payload_error = 1'd0;
reg soc_eth_core_arp_rx_depacketizer_fsm_from_idle = 1'd0;
reg soc_eth_core_arp_rx_valid = 1'd0;
reg soc_eth_core_arp_rx_reply = 1'd0;
reg soc_eth_core_arp_rx_request = 1'd0;
wire soc_eth_core_arp_table_sink_valid;
reg soc_eth_core_arp_table_sink_ready = 1'd0;
wire soc_eth_core_arp_table_sink_first;
wire soc_eth_core_arp_table_sink_last;
wire soc_eth_core_arp_table_sink_payload_reply;
wire soc_eth_core_arp_table_sink_payload_request;
wire [31:0] soc_eth_core_arp_table_sink_payload_ip_address;
wire [47:0] soc_eth_core_arp_table_sink_payload_mac_address;
reg soc_eth_core_arp_table_source_valid = 1'd0;
wire soc_eth_core_arp_table_source_ready;
reg soc_eth_core_arp_table_source_first = 1'd0;
reg soc_eth_core_arp_table_source_last = 1'd0;
reg soc_eth_core_arp_table_source_payload_reply = 1'd0;
reg soc_eth_core_arp_table_source_payload_request = 1'd0;
reg [31:0] soc_eth_core_arp_table_source_payload_ip_address = 32'd0;
reg [47:0] soc_eth_core_arp_table_source_payload_mac_address = 48'd0;
reg soc_eth_core_arp_table_request_valid = 1'd0;
reg soc_eth_core_arp_table_request_ready = 1'd0;
wire [31:0] soc_eth_core_arp_table_request_payload_ip_address;
reg soc_eth_core_arp_table_response_valid = 1'd0;
reg soc_eth_core_arp_table_response_ready = 1'd0;
reg soc_eth_core_arp_table_response_payload_failed = 1'd0;
wire [47:0] soc_eth_core_arp_table_response_payload_mac_address;
reg soc_eth_core_arp_table_request_pending = 1'd0;
reg soc_eth_core_arp_table_request_pending_clr = 1'd0;
reg soc_eth_core_arp_table_request_pending_set = 1'd0;
reg [31:0] soc_eth_core_arp_table_request_ip_address = 32'd0;
reg soc_eth_core_arp_table_request_ip_address_reset = 1'd0;
reg soc_eth_core_arp_table_request_ip_address_update = 1'd0;
wire soc_eth_core_arp_table_request_timer_wait;
wire soc_eth_core_arp_table_request_timer_done;
reg [23:0] soc_eth_core_arp_table_request_timer_count = 24'd13300000;
reg [2:0] soc_eth_core_arp_table_request_counter = 3'd0;
reg soc_eth_core_arp_table_request_counter_reset = 1'd0;
reg soc_eth_core_arp_table_request_counter_ce = 1'd0;
reg soc_eth_core_arp_table_update = 1'd0;
reg soc_eth_core_arp_table_cached_valid = 1'd0;
reg [31:0] soc_eth_core_arp_table_cached_ip_address = 32'd0;
reg [47:0] soc_eth_core_arp_table_cached_mac_address = 48'd0;
wire soc_eth_core_arp_table_cached_timer_wait;
wire soc_eth_core_arp_table_cached_timer_done;
reg [30:0] soc_eth_core_arp_table_cached_timer_count = 31'd1330000000;
wire soc_eth_core_arp_mac_port_sink_valid;
reg soc_eth_core_arp_mac_port_sink_ready = 1'd0;
wire soc_eth_core_arp_mac_port_sink_first;
wire soc_eth_core_arp_mac_port_sink_last;
wire [15:0] soc_eth_core_arp_mac_port_sink_payload_ethernet_type;
wire [47:0] soc_eth_core_arp_mac_port_sink_payload_sender_mac;
wire [47:0] soc_eth_core_arp_mac_port_sink_payload_target_mac;
wire [7:0] soc_eth_core_arp_mac_port_sink_payload_data;
wire soc_eth_core_arp_mac_port_sink_payload_last_be;
wire soc_eth_core_arp_mac_port_sink_payload_error;
reg soc_eth_core_arp_mac_port_source_valid = 1'd0;
wire soc_eth_core_arp_mac_port_source_ready;
reg soc_eth_core_arp_mac_port_source_first = 1'd0;
reg soc_eth_core_arp_mac_port_source_last = 1'd0;
reg [15:0] soc_eth_core_arp_mac_port_source_payload_ethernet_type = 16'd0;
reg [47:0] soc_eth_core_arp_mac_port_source_payload_sender_mac = 48'd0;
reg [47:0] soc_eth_core_arp_mac_port_source_payload_target_mac = 48'd0;
reg [7:0] soc_eth_core_arp_mac_port_source_payload_data = 8'd0;
reg soc_eth_core_arp_mac_port_source_payload_last_be = 1'd0;
reg soc_eth_core_arp_mac_port_source_payload_error = 1'd0;
wire soc_eth_core_ip_tx_sink_sink_valid;
wire soc_eth_core_ip_tx_sink_sink_ready;
wire soc_eth_core_ip_tx_sink_sink_first;
wire soc_eth_core_ip_tx_sink_sink_last;
wire [7:0] soc_eth_core_ip_tx_sink_sink_payload_data;
wire soc_eth_core_ip_tx_sink_sink_payload_error;
wire [15:0] soc_eth_core_ip_tx_sink_sink_param_length;
wire [7:0] soc_eth_core_ip_tx_sink_sink_param_protocol;
wire [31:0] soc_eth_core_ip_tx_sink_sink_param_ip_address;
reg soc_eth_core_ip_tx_source_source_valid = 1'd0;
wire soc_eth_core_ip_tx_source_source_ready;
reg soc_eth_core_ip_tx_source_source_first = 1'd0;
reg soc_eth_core_ip_tx_source_source_last = 1'd0;
reg [15:0] soc_eth_core_ip_tx_source_source_payload_ethernet_type = 16'd0;
reg [47:0] soc_eth_core_ip_tx_source_source_payload_sender_mac = 48'd0;
reg [47:0] soc_eth_core_ip_tx_source_source_payload_target_mac = 48'd0;
reg [7:0] soc_eth_core_ip_tx_source_source_payload_data = 8'd0;
reg soc_eth_core_ip_tx_source_source_payload_last_be = 1'd0;
reg soc_eth_core_ip_tx_source_source_payload_error = 1'd0;
reg soc_eth_core_ip_tx_target_unreachable = 1'd0;
wire [159:0] soc_eth_core_ip_tx_liteethipv4checksum_header;
wire [15:0] soc_eth_core_ip_tx_liteethipv4checksum_value;
wire soc_eth_core_ip_tx_liteethipv4checksum_done;
reg [16:0] soc_eth_core_ip_tx_liteethipv4checksum_r = 17'd0;
wire [16:0] soc_eth_core_ip_tx_liteethipv4checksum_s_next0;
reg [16:0] soc_eth_core_ip_tx_liteethipv4checksum_r_next0 = 17'd0;
reg soc_eth_core_ip_tx_liteethipv4checksum0 = 1'd0;
wire [16:0] soc_eth_core_ip_tx_liteethipv4checksum_s_next1;
reg [16:0] soc_eth_core_ip_tx_liteethipv4checksum_r_next1 = 17'd0;
reg soc_eth_core_ip_tx_liteethipv4checksum1 = 1'd0;
wire [16:0] soc_eth_core_ip_tx_liteethipv4checksum_s_next2;
reg [16:0] soc_eth_core_ip_tx_liteethipv4checksum_r_next2 = 17'd0;
reg soc_eth_core_ip_tx_liteethipv4checksum2 = 1'd0;
wire [16:0] soc_eth_core_ip_tx_liteethipv4checksum_s_next3;
reg [16:0] soc_eth_core_ip_tx_liteethipv4checksum_r_next3 = 17'd0;
reg soc_eth_core_ip_tx_liteethipv4checksum3 = 1'd0;
wire [16:0] soc_eth_core_ip_tx_liteethipv4checksum_s_next4;
reg [16:0] soc_eth_core_ip_tx_liteethipv4checksum_r_next4 = 17'd0;
reg soc_eth_core_ip_tx_liteethipv4checksum4 = 1'd0;
wire [16:0] soc_eth_core_ip_tx_liteethipv4checksum_s_next5;
reg [16:0] soc_eth_core_ip_tx_liteethipv4checksum_r_next5 = 17'd0;
reg soc_eth_core_ip_tx_liteethipv4checksum5 = 1'd0;
wire [16:0] soc_eth_core_ip_tx_liteethipv4checksum_s_next6;
reg [16:0] soc_eth_core_ip_tx_liteethipv4checksum_r_next6 = 17'd0;
reg soc_eth_core_ip_tx_liteethipv4checksum6 = 1'd0;
wire [16:0] soc_eth_core_ip_tx_liteethipv4checksum_s_next7;
reg [16:0] soc_eth_core_ip_tx_liteethipv4checksum_r_next7 = 17'd0;
reg soc_eth_core_ip_tx_liteethipv4checksum7 = 1'd0;
wire [16:0] soc_eth_core_ip_tx_liteethipv4checksum_s_next8;
reg [16:0] soc_eth_core_ip_tx_liteethipv4checksum_r_next8 = 17'd0;
reg soc_eth_core_ip_tx_liteethipv4checksum8 = 1'd0;
reg [3:0] soc_eth_core_ip_tx_liteethipv4checksum_counter = 4'd0;
wire soc_eth_core_ip_tx_liteethipv4checksum_counter_ce;
wire soc_eth_core_ip_tx_ce;
wire soc_eth_core_ip_tx_reset;
wire soc_eth_core_ip_tx_packetizer_sink_valid;
reg soc_eth_core_ip_tx_packetizer_sink_ready = 1'd0;
reg soc_eth_core_ip_tx_packetizer_sink_first = 1'd0;
wire soc_eth_core_ip_tx_packetizer_sink_last;
wire [7:0] soc_eth_core_ip_tx_packetizer_sink_payload_data;
reg soc_eth_core_ip_tx_packetizer_sink_payload_error = 1'd0;
wire [15:0] soc_eth_core_ip_tx_packetizer_sink_param_checksum;
wire [15:0] soc_eth_core_ip_tx_packetizer_sink_param_identification;
wire [3:0] soc_eth_core_ip_tx_packetizer_sink_param_ihl;
wire [7:0] soc_eth_core_ip_tx_packetizer_sink_param_protocol;
wire [31:0] soc_eth_core_ip_tx_packetizer_sink_param_sender_ip;
wire [31:0] soc_eth_core_ip_tx_packetizer_sink_param_target_ip;
wire [15:0] soc_eth_core_ip_tx_packetizer_sink_param_total_length;
wire [7:0] soc_eth_core_ip_tx_packetizer_sink_param_ttl;
wire [3:0] soc_eth_core_ip_tx_packetizer_sink_param_version;
reg soc_eth_core_ip_tx_packetizer_source_valid = 1'd0;
reg soc_eth_core_ip_tx_packetizer_source_ready = 1'd0;
reg soc_eth_core_ip_tx_packetizer_source_first = 1'd0;
reg soc_eth_core_ip_tx_packetizer_source_last = 1'd0;
reg [15:0] soc_eth_core_ip_tx_packetizer_source_payload_ethernet_type = 16'd0;
reg [47:0] soc_eth_core_ip_tx_packetizer_source_payload_sender_mac = 48'd0;
reg [47:0] soc_eth_core_ip_tx_packetizer_source_payload_target_mac = 48'd0;
reg [7:0] soc_eth_core_ip_tx_packetizer_source_payload_data = 8'd0;
reg soc_eth_core_ip_tx_packetizer_source_payload_last_be = 1'd0;
wire soc_eth_core_ip_tx_packetizer_source_payload_error;
reg [159:0] soc_eth_core_ip_tx_packetizer_header = 160'd0;
reg [159:0] soc_eth_core_ip_tx_packetizer_sr = 160'd0;
reg soc_eth_core_ip_tx_packetizer_sr_load = 1'd0;
reg soc_eth_core_ip_tx_packetizer_sr_shift = 1'd0;
reg [4:0] soc_eth_core_ip_tx_packetizer_count = 5'd0;
reg soc_eth_core_ip_tx_packetizer_sink_d_valid = 1'd0;
reg soc_eth_core_ip_tx_packetizer_sink_d_ready = 1'd0;
reg soc_eth_core_ip_tx_packetizer_sink_d_first = 1'd0;
reg soc_eth_core_ip_tx_packetizer_sink_d_last = 1'd0;
reg [7:0] soc_eth_core_ip_tx_packetizer_sink_d_payload_data = 8'd0;
reg soc_eth_core_ip_tx_packetizer_sink_d_payload_error = 1'd0;
reg [15:0] soc_eth_core_ip_tx_packetizer_sink_d_param_checksum = 16'd0;
reg [15:0] soc_eth_core_ip_tx_packetizer_sink_d_param_identification = 16'd0;
reg [3:0] soc_eth_core_ip_tx_packetizer_sink_d_param_ihl = 4'd0;
reg [7:0] soc_eth_core_ip_tx_packetizer_sink_d_param_protocol = 8'd0;
reg [31:0] soc_eth_core_ip_tx_packetizer_sink_d_param_sender_ip = 32'd0;
reg [31:0] soc_eth_core_ip_tx_packetizer_sink_d_param_target_ip = 32'd0;
reg [15:0] soc_eth_core_ip_tx_packetizer_sink_d_param_total_length = 16'd0;
reg [7:0] soc_eth_core_ip_tx_packetizer_sink_d_param_ttl = 8'd0;
reg [3:0] soc_eth_core_ip_tx_packetizer_sink_d_param_version = 4'd0;
reg soc_eth_core_ip_tx_packetizer_fsm_from_idle = 1'd0;
reg [47:0] soc_eth_core_ip_tx_target_mac = 48'd0;
wire soc_eth_core_ip_rx_sink_sink_valid;
wire soc_eth_core_ip_rx_sink_sink_ready;
wire soc_eth_core_ip_rx_sink_sink_first;
wire soc_eth_core_ip_rx_sink_sink_last;
wire [15:0] soc_eth_core_ip_rx_sink_sink_payload_ethernet_type;
wire [47:0] soc_eth_core_ip_rx_sink_sink_payload_sender_mac;
wire [47:0] soc_eth_core_ip_rx_sink_sink_payload_target_mac;
wire [7:0] soc_eth_core_ip_rx_sink_sink_payload_data;
wire soc_eth_core_ip_rx_sink_sink_payload_last_be;
wire soc_eth_core_ip_rx_sink_sink_payload_error;
reg soc_eth_core_ip_rx_source_source_valid = 1'd0;
wire soc_eth_core_ip_rx_source_source_ready;
reg soc_eth_core_ip_rx_source_source_first = 1'd0;
wire soc_eth_core_ip_rx_source_source_last;
wire [7:0] soc_eth_core_ip_rx_source_source_payload_data;
wire soc_eth_core_ip_rx_source_source_payload_error;
wire [15:0] soc_eth_core_ip_rx_source_source_param_length;
wire [7:0] soc_eth_core_ip_rx_source_source_param_protocol;
wire [31:0] soc_eth_core_ip_rx_source_source_param_ip_address;
wire soc_eth_core_ip_rx_depacketizer_sink_valid;
reg soc_eth_core_ip_rx_depacketizer_sink_ready = 1'd0;
wire soc_eth_core_ip_rx_depacketizer_sink_first;
wire soc_eth_core_ip_rx_depacketizer_sink_last;
wire [15:0] soc_eth_core_ip_rx_depacketizer_sink_payload_ethernet_type;
wire [47:0] soc_eth_core_ip_rx_depacketizer_sink_payload_sender_mac;
wire [47:0] soc_eth_core_ip_rx_depacketizer_sink_payload_target_mac;
wire [7:0] soc_eth_core_ip_rx_depacketizer_sink_payload_data;
wire soc_eth_core_ip_rx_depacketizer_sink_payload_last_be;
wire soc_eth_core_ip_rx_depacketizer_sink_payload_error;
reg soc_eth_core_ip_rx_depacketizer_source_valid = 1'd0;
reg soc_eth_core_ip_rx_depacketizer_source_ready = 1'd0;
reg soc_eth_core_ip_rx_depacketizer_source_last = 1'd0;
reg [7:0] soc_eth_core_ip_rx_depacketizer_source_payload_data = 8'd0;
wire soc_eth_core_ip_rx_depacketizer_source_payload_error;
wire [15:0] soc_eth_core_ip_rx_depacketizer_source_param_checksum;
wire [15:0] soc_eth_core_ip_rx_depacketizer_source_param_identification;
wire [3:0] soc_eth_core_ip_rx_depacketizer_source_param_ihl;
wire [7:0] soc_eth_core_ip_rx_depacketizer_source_param_protocol;
wire [31:0] soc_eth_core_ip_rx_depacketizer_source_param_sender_ip;
wire [31:0] soc_eth_core_ip_rx_depacketizer_source_param_target_ip;
wire [15:0] soc_eth_core_ip_rx_depacketizer_source_param_total_length;
wire [7:0] soc_eth_core_ip_rx_depacketizer_source_param_ttl;
wire [3:0] soc_eth_core_ip_rx_depacketizer_source_param_version;
wire [159:0] soc_eth_core_ip_rx_depacketizer_header;
reg [159:0] soc_eth_core_ip_rx_depacketizer_sr = 160'd0;
reg soc_eth_core_ip_rx_depacketizer_sr_shift = 1'd0;
reg soc_eth_core_ip_rx_depacketizer_sr_shift_leftover = 1'd0;
reg [4:0] soc_eth_core_ip_rx_depacketizer_count = 5'd0;
reg soc_eth_core_ip_rx_depacketizer_sink_d_valid = 1'd0;
reg soc_eth_core_ip_rx_depacketizer_sink_d_ready = 1'd0;
reg soc_eth_core_ip_rx_depacketizer_sink_d_first = 1'd0;
reg soc_eth_core_ip_rx_depacketizer_sink_d_last = 1'd0;
reg [15:0] soc_eth_core_ip_rx_depacketizer_sink_d_payload_ethernet_type = 16'd0;
reg [47:0] soc_eth_core_ip_rx_depacketizer_sink_d_payload_sender_mac = 48'd0;
reg [47:0] soc_eth_core_ip_rx_depacketizer_sink_d_payload_target_mac = 48'd0;
reg [7:0] soc_eth_core_ip_rx_depacketizer_sink_d_payload_data = 8'd0;
reg soc_eth_core_ip_rx_depacketizer_sink_d_payload_last_be = 1'd0;
reg soc_eth_core_ip_rx_depacketizer_sink_d_payload_error = 1'd0;
reg soc_eth_core_ip_rx_depacketizer_fsm_from_idle = 1'd0;
wire [159:0] soc_eth_core_ip_rx_liteethipv4checksum_header;
wire [15:0] soc_eth_core_ip_rx_liteethipv4checksum_value;
wire soc_eth_core_ip_rx_liteethipv4checksum_done;
reg [16:0] soc_eth_core_ip_rx_liteethipv4checksum_r = 17'd0;
wire [16:0] soc_eth_core_ip_rx_liteethipv4checksum_s_next0;
reg [16:0] soc_eth_core_ip_rx_liteethipv4checksum_r_next0 = 17'd0;
reg soc_eth_core_ip_rx_liteethipv4checksum0 = 1'd0;
wire [16:0] soc_eth_core_ip_rx_liteethipv4checksum_s_next1;
reg [16:0] soc_eth_core_ip_rx_liteethipv4checksum_r_next1 = 17'd0;
reg soc_eth_core_ip_rx_liteethipv4checksum1 = 1'd0;
wire [16:0] soc_eth_core_ip_rx_liteethipv4checksum_s_next2;
reg [16:0] soc_eth_core_ip_rx_liteethipv4checksum_r_next2 = 17'd0;
reg soc_eth_core_ip_rx_liteethipv4checksum2 = 1'd0;
wire [16:0] soc_eth_core_ip_rx_liteethipv4checksum_s_next3;
reg [16:0] soc_eth_core_ip_rx_liteethipv4checksum_r_next3 = 17'd0;
reg soc_eth_core_ip_rx_liteethipv4checksum3 = 1'd0;
wire [16:0] soc_eth_core_ip_rx_liteethipv4checksum_s_next4;
reg [16:0] soc_eth_core_ip_rx_liteethipv4checksum_r_next4 = 17'd0;
reg soc_eth_core_ip_rx_liteethipv4checksum4 = 1'd0;
wire [16:0] soc_eth_core_ip_rx_liteethipv4checksum_s_next5;
reg [16:0] soc_eth_core_ip_rx_liteethipv4checksum_r_next5 = 17'd0;
reg soc_eth_core_ip_rx_liteethipv4checksum5 = 1'd0;
wire [16:0] soc_eth_core_ip_rx_liteethipv4checksum_s_next6;
reg [16:0] soc_eth_core_ip_rx_liteethipv4checksum_r_next6 = 17'd0;
reg soc_eth_core_ip_rx_liteethipv4checksum6 = 1'd0;
wire [16:0] soc_eth_core_ip_rx_liteethipv4checksum_s_next7;
reg [16:0] soc_eth_core_ip_rx_liteethipv4checksum_r_next7 = 17'd0;
reg soc_eth_core_ip_rx_liteethipv4checksum7 = 1'd0;
wire [16:0] soc_eth_core_ip_rx_liteethipv4checksum_s_next8;
reg [16:0] soc_eth_core_ip_rx_liteethipv4checksum_r_next8 = 17'd0;
reg soc_eth_core_ip_rx_liteethipv4checksum8 = 1'd0;
wire [16:0] soc_eth_core_ip_rx_liteethipv4checksum_s_next9;
reg [16:0] soc_eth_core_ip_rx_liteethipv4checksum_r_next9 = 17'd0;
reg soc_eth_core_ip_rx_liteethipv4checksum9 = 1'd0;
reg [3:0] soc_eth_core_ip_rx_liteethipv4checksum_counter = 4'd0;
wire soc_eth_core_ip_rx_liteethipv4checksum_counter_ce;
wire soc_eth_core_ip_rx_ce;
wire soc_eth_core_ip_rx_reset;
reg soc_eth_core_ip_rx_valid = 1'd0;
wire soc_eth_core_ip_mac_port_sink_valid;
reg soc_eth_core_ip_mac_port_sink_ready = 1'd0;
wire soc_eth_core_ip_mac_port_sink_first;
wire soc_eth_core_ip_mac_port_sink_last;
wire [15:0] soc_eth_core_ip_mac_port_sink_payload_ethernet_type;
wire [47:0] soc_eth_core_ip_mac_port_sink_payload_sender_mac;
wire [47:0] soc_eth_core_ip_mac_port_sink_payload_target_mac;
wire [7:0] soc_eth_core_ip_mac_port_sink_payload_data;
wire soc_eth_core_ip_mac_port_sink_payload_last_be;
wire soc_eth_core_ip_mac_port_sink_payload_error;
reg soc_eth_core_ip_mac_port_source_valid = 1'd0;
wire soc_eth_core_ip_mac_port_source_ready;
reg soc_eth_core_ip_mac_port_source_first = 1'd0;
reg soc_eth_core_ip_mac_port_source_last = 1'd0;
reg [15:0] soc_eth_core_ip_mac_port_source_payload_ethernet_type = 16'd0;
reg [47:0] soc_eth_core_ip_mac_port_source_payload_sender_mac = 48'd0;
reg [47:0] soc_eth_core_ip_mac_port_source_payload_target_mac = 48'd0;
reg [7:0] soc_eth_core_ip_mac_port_source_payload_data = 8'd0;
reg soc_eth_core_ip_mac_port_source_payload_last_be = 1'd0;
reg soc_eth_core_ip_mac_port_source_payload_error = 1'd0;
reg soc_eth_core_ip_crossbar_source_valid = 1'd0;
wire soc_eth_core_ip_crossbar_source_ready;
reg soc_eth_core_ip_crossbar_source_first = 1'd0;
reg soc_eth_core_ip_crossbar_source_last = 1'd0;
reg [7:0] soc_eth_core_ip_crossbar_source_payload_data = 8'd0;
reg soc_eth_core_ip_crossbar_source_payload_error = 1'd0;
reg [15:0] soc_eth_core_ip_crossbar_source_param_length = 16'd0;
reg [7:0] soc_eth_core_ip_crossbar_source_param_protocol = 8'd0;
reg [31:0] soc_eth_core_ip_crossbar_source_param_ip_address = 32'd0;
wire soc_eth_core_ip_crossbar_sink_valid;
reg soc_eth_core_ip_crossbar_sink_ready = 1'd0;
wire soc_eth_core_ip_crossbar_sink_first;
wire soc_eth_core_ip_crossbar_sink_last;
wire [7:0] soc_eth_core_ip_crossbar_sink_payload_data;
wire soc_eth_core_ip_crossbar_sink_payload_error;
wire [15:0] soc_eth_core_ip_crossbar_sink_param_length;
wire [7:0] soc_eth_core_ip_crossbar_sink_param_protocol;
wire [31:0] soc_eth_core_ip_crossbar_sink_param_ip_address;
wire soc_eth_core_icmp_tx_sink_sink_valid;
wire soc_eth_core_icmp_tx_sink_sink_ready;
wire soc_eth_core_icmp_tx_sink_sink_first;
wire soc_eth_core_icmp_tx_sink_sink_last;
wire [7:0] soc_eth_core_icmp_tx_sink_sink_payload_data;
wire soc_eth_core_icmp_tx_sink_sink_payload_error;
wire [15:0] soc_eth_core_icmp_tx_sink_sink_param_checksum;
wire [7:0] soc_eth_core_icmp_tx_sink_sink_param_code;
wire [7:0] soc_eth_core_icmp_tx_sink_sink_param_msgtype;
wire [31:0] soc_eth_core_icmp_tx_sink_sink_param_quench;
wire [31:0] soc_eth_core_icmp_tx_sink_sink_param_ip_address;
wire [15:0] soc_eth_core_icmp_tx_sink_sink_param_length;
reg soc_eth_core_icmp_tx_source_source_valid = 1'd0;
wire soc_eth_core_icmp_tx_source_source_ready;
reg soc_eth_core_icmp_tx_source_source_first = 1'd0;
reg soc_eth_core_icmp_tx_source_source_last = 1'd0;
reg [7:0] soc_eth_core_icmp_tx_source_source_payload_data = 8'd0;
reg soc_eth_core_icmp_tx_source_source_payload_error = 1'd0;
reg [15:0] soc_eth_core_icmp_tx_source_source_param_length = 16'd0;
reg [7:0] soc_eth_core_icmp_tx_source_source_param_protocol = 8'd0;
reg [31:0] soc_eth_core_icmp_tx_source_source_param_ip_address = 32'd0;
wire soc_eth_core_icmp_tx_packetizer_sink_valid;
reg soc_eth_core_icmp_tx_packetizer_sink_ready = 1'd0;
reg soc_eth_core_icmp_tx_packetizer_sink_first = 1'd0;
wire soc_eth_core_icmp_tx_packetizer_sink_last;
wire [7:0] soc_eth_core_icmp_tx_packetizer_sink_payload_data;
reg soc_eth_core_icmp_tx_packetizer_sink_payload_error = 1'd0;
wire [15:0] soc_eth_core_icmp_tx_packetizer_sink_param_checksum;
wire [7:0] soc_eth_core_icmp_tx_packetizer_sink_param_code;
wire [7:0] soc_eth_core_icmp_tx_packetizer_sink_param_msgtype;
wire [31:0] soc_eth_core_icmp_tx_packetizer_sink_param_quench;
reg soc_eth_core_icmp_tx_packetizer_source_valid = 1'd0;
reg soc_eth_core_icmp_tx_packetizer_source_ready = 1'd0;
reg soc_eth_core_icmp_tx_packetizer_source_first = 1'd0;
reg soc_eth_core_icmp_tx_packetizer_source_last = 1'd0;
reg [7:0] soc_eth_core_icmp_tx_packetizer_source_payload_data = 8'd0;
wire soc_eth_core_icmp_tx_packetizer_source_payload_error;
reg [15:0] soc_eth_core_icmp_tx_packetizer_source_param_length = 16'd0;
reg [7:0] soc_eth_core_icmp_tx_packetizer_source_param_protocol = 8'd0;
reg [31:0] soc_eth_core_icmp_tx_packetizer_source_param_ip_address = 32'd0;
reg [63:0] soc_eth_core_icmp_tx_packetizer_header = 64'd0;
reg [63:0] soc_eth_core_icmp_tx_packetizer_sr = 64'd0;
reg soc_eth_core_icmp_tx_packetizer_sr_load = 1'd0;
reg soc_eth_core_icmp_tx_packetizer_sr_shift = 1'd0;
reg [2:0] soc_eth_core_icmp_tx_packetizer_count = 3'd0;
reg soc_eth_core_icmp_tx_packetizer_sink_d_valid = 1'd0;
reg soc_eth_core_icmp_tx_packetizer_sink_d_ready = 1'd0;
reg soc_eth_core_icmp_tx_packetizer_sink_d_first = 1'd0;
reg soc_eth_core_icmp_tx_packetizer_sink_d_last = 1'd0;
reg [7:0] soc_eth_core_icmp_tx_packetizer_sink_d_payload_data = 8'd0;
reg soc_eth_core_icmp_tx_packetizer_sink_d_payload_error = 1'd0;
reg [15:0] soc_eth_core_icmp_tx_packetizer_sink_d_param_checksum = 16'd0;
reg [7:0] soc_eth_core_icmp_tx_packetizer_sink_d_param_code = 8'd0;
reg [7:0] soc_eth_core_icmp_tx_packetizer_sink_d_param_msgtype = 8'd0;
reg [31:0] soc_eth_core_icmp_tx_packetizer_sink_d_param_quench = 32'd0;
reg soc_eth_core_icmp_tx_packetizer_fsm_from_idle = 1'd0;
wire soc_eth_core_icmp_rx_sink_sink_valid;
wire soc_eth_core_icmp_rx_sink_sink_ready;
wire soc_eth_core_icmp_rx_sink_sink_first;
wire soc_eth_core_icmp_rx_sink_sink_last;
wire [7:0] soc_eth_core_icmp_rx_sink_sink_payload_data;
wire soc_eth_core_icmp_rx_sink_sink_payload_error;
wire [15:0] soc_eth_core_icmp_rx_sink_sink_param_length;
wire [7:0] soc_eth_core_icmp_rx_sink_sink_param_protocol;
wire [31:0] soc_eth_core_icmp_rx_sink_sink_param_ip_address;
reg soc_eth_core_icmp_rx_source_source_valid = 1'd0;
wire soc_eth_core_icmp_rx_source_source_ready;
reg soc_eth_core_icmp_rx_source_source_first = 1'd0;
wire soc_eth_core_icmp_rx_source_source_last;
wire [7:0] soc_eth_core_icmp_rx_source_source_payload_data;
wire soc_eth_core_icmp_rx_source_source_payload_error;
wire [15:0] soc_eth_core_icmp_rx_source_source_param_checksum;
wire [7:0] soc_eth_core_icmp_rx_source_source_param_code;
wire [7:0] soc_eth_core_icmp_rx_source_source_param_msgtype;
wire [31:0] soc_eth_core_icmp_rx_source_source_param_quench;
wire [31:0] soc_eth_core_icmp_rx_source_source_param_ip_address;
wire [15:0] soc_eth_core_icmp_rx_source_source_param_length;
wire soc_eth_core_icmp_rx_depacketizer_sink_valid;
reg soc_eth_core_icmp_rx_depacketizer_sink_ready = 1'd0;
wire soc_eth_core_icmp_rx_depacketizer_sink_first;
wire soc_eth_core_icmp_rx_depacketizer_sink_last;
wire [7:0] soc_eth_core_icmp_rx_depacketizer_sink_payload_data;
wire soc_eth_core_icmp_rx_depacketizer_sink_payload_error;
wire [15:0] soc_eth_core_icmp_rx_depacketizer_sink_param_length;
wire [7:0] soc_eth_core_icmp_rx_depacketizer_sink_param_protocol;
wire [31:0] soc_eth_core_icmp_rx_depacketizer_sink_param_ip_address;
reg soc_eth_core_icmp_rx_depacketizer_source_valid = 1'd0;
reg soc_eth_core_icmp_rx_depacketizer_source_ready = 1'd0;
reg soc_eth_core_icmp_rx_depacketizer_source_last = 1'd0;
reg [7:0] soc_eth_core_icmp_rx_depacketizer_source_payload_data = 8'd0;
wire soc_eth_core_icmp_rx_depacketizer_source_payload_error;
wire [15:0] soc_eth_core_icmp_rx_depacketizer_source_param_checksum;
wire [7:0] soc_eth_core_icmp_rx_depacketizer_source_param_code;
wire [7:0] soc_eth_core_icmp_rx_depacketizer_source_param_msgtype;
wire [31:0] soc_eth_core_icmp_rx_depacketizer_source_param_quench;
wire [63:0] soc_eth_core_icmp_rx_depacketizer_header;
reg [63:0] soc_eth_core_icmp_rx_depacketizer_sr = 64'd0;
reg soc_eth_core_icmp_rx_depacketizer_sr_shift = 1'd0;
reg soc_eth_core_icmp_rx_depacketizer_sr_shift_leftover = 1'd0;
reg [2:0] soc_eth_core_icmp_rx_depacketizer_count = 3'd0;
reg soc_eth_core_icmp_rx_depacketizer_sink_d_valid = 1'd0;
reg soc_eth_core_icmp_rx_depacketizer_sink_d_ready = 1'd0;
reg soc_eth_core_icmp_rx_depacketizer_sink_d_first = 1'd0;
reg soc_eth_core_icmp_rx_depacketizer_sink_d_last = 1'd0;
reg [7:0] soc_eth_core_icmp_rx_depacketizer_sink_d_payload_data = 8'd0;
reg soc_eth_core_icmp_rx_depacketizer_sink_d_payload_error = 1'd0;
reg [15:0] soc_eth_core_icmp_rx_depacketizer_sink_d_param_length = 16'd0;
reg [7:0] soc_eth_core_icmp_rx_depacketizer_sink_d_param_protocol = 8'd0;
reg [31:0] soc_eth_core_icmp_rx_depacketizer_sink_d_param_ip_address = 32'd0;
reg soc_eth_core_icmp_rx_depacketizer_fsm_from_idle = 1'd0;
reg soc_eth_core_icmp_rx_valid = 1'd0;
wire soc_eth_core_icmp_echo_sink_sink_valid;
wire soc_eth_core_icmp_echo_sink_sink_ready;
wire soc_eth_core_icmp_echo_sink_sink_first;
wire soc_eth_core_icmp_echo_sink_sink_last;
wire [7:0] soc_eth_core_icmp_echo_sink_sink_payload_data;
wire soc_eth_core_icmp_echo_sink_sink_payload_error;
wire [15:0] soc_eth_core_icmp_echo_sink_sink_param_checksum;
wire [7:0] soc_eth_core_icmp_echo_sink_sink_param_code;
wire [7:0] soc_eth_core_icmp_echo_sink_sink_param_msgtype;
wire [31:0] soc_eth_core_icmp_echo_sink_sink_param_quench;
wire [31:0] soc_eth_core_icmp_echo_sink_sink_param_ip_address;
wire [15:0] soc_eth_core_icmp_echo_sink_sink_param_length;
wire soc_eth_core_icmp_echo_source_source_valid;
wire soc_eth_core_icmp_echo_source_source_ready;
wire soc_eth_core_icmp_echo_source_source_first;
wire soc_eth_core_icmp_echo_source_source_last;
wire [7:0] soc_eth_core_icmp_echo_source_source_payload_data;
wire soc_eth_core_icmp_echo_source_source_payload_error;
reg [15:0] soc_eth_core_icmp_echo_source_source_param_checksum = 16'd0;
wire [7:0] soc_eth_core_icmp_echo_source_source_param_code;
reg [7:0] soc_eth_core_icmp_echo_source_source_param_msgtype = 8'd0;
wire [31:0] soc_eth_core_icmp_echo_source_source_param_quench;
wire [31:0] soc_eth_core_icmp_echo_source_source_param_ip_address;
wire [15:0] soc_eth_core_icmp_echo_source_source_param_length;
wire soc_eth_core_icmp_echo_buffer_sink_valid;
wire soc_eth_core_icmp_echo_buffer_sink_ready;
wire soc_eth_core_icmp_echo_buffer_sink_first;
wire soc_eth_core_icmp_echo_buffer_sink_last;
wire [7:0] soc_eth_core_icmp_echo_buffer_sink_payload_data;
wire soc_eth_core_icmp_echo_buffer_sink_payload_error;
wire [15:0] soc_eth_core_icmp_echo_buffer_sink_param_checksum;
wire [7:0] soc_eth_core_icmp_echo_buffer_sink_param_code;
wire [7:0] soc_eth_core_icmp_echo_buffer_sink_param_msgtype;
wire [31:0] soc_eth_core_icmp_echo_buffer_sink_param_quench;
wire [31:0] soc_eth_core_icmp_echo_buffer_sink_param_ip_address;
wire [15:0] soc_eth_core_icmp_echo_buffer_sink_param_length;
wire soc_eth_core_icmp_echo_buffer_source_valid;
wire soc_eth_core_icmp_echo_buffer_source_ready;
wire soc_eth_core_icmp_echo_buffer_source_first;
wire soc_eth_core_icmp_echo_buffer_source_last;
wire [7:0] soc_eth_core_icmp_echo_buffer_source_payload_data;
wire soc_eth_core_icmp_echo_buffer_source_payload_error;
wire [15:0] soc_eth_core_icmp_echo_buffer_source_param_checksum;
wire [7:0] soc_eth_core_icmp_echo_buffer_source_param_code;
wire [7:0] soc_eth_core_icmp_echo_buffer_source_param_msgtype;
wire [31:0] soc_eth_core_icmp_echo_buffer_source_param_quench;
wire [31:0] soc_eth_core_icmp_echo_buffer_source_param_ip_address;
wire [15:0] soc_eth_core_icmp_echo_buffer_source_param_length;
wire soc_eth_core_icmp_echo_buffer_re;
reg soc_eth_core_icmp_echo_buffer_readable = 1'd0;
wire soc_eth_core_icmp_echo_buffer_syncfifo_we;
wire soc_eth_core_icmp_echo_buffer_syncfifo_writable;
wire soc_eth_core_icmp_echo_buffer_syncfifo_re;
wire soc_eth_core_icmp_echo_buffer_syncfifo_readable;
wire [122:0] soc_eth_core_icmp_echo_buffer_syncfifo_din;
wire [122:0] soc_eth_core_icmp_echo_buffer_syncfifo_dout;
reg [7:0] soc_eth_core_icmp_echo_buffer_level0 = 8'd0;
reg soc_eth_core_icmp_echo_buffer_replace = 1'd0;
reg [6:0] soc_eth_core_icmp_echo_buffer_produce = 7'd0;
reg [6:0] soc_eth_core_icmp_echo_buffer_consume = 7'd0;
reg [6:0] soc_eth_core_icmp_echo_buffer_wrport_adr = 7'd0;
wire [122:0] soc_eth_core_icmp_echo_buffer_wrport_dat_r;
wire soc_eth_core_icmp_echo_buffer_wrport_we;
wire [122:0] soc_eth_core_icmp_echo_buffer_wrport_dat_w;
wire soc_eth_core_icmp_echo_buffer_do_read;
wire [6:0] soc_eth_core_icmp_echo_buffer_rdport_adr;
wire [122:0] soc_eth_core_icmp_echo_buffer_rdport_dat_r;
wire soc_eth_core_icmp_echo_buffer_rdport_re;
wire [7:0] soc_eth_core_icmp_echo_buffer_level1;
wire [7:0] soc_eth_core_icmp_echo_buffer_fifo_in_payload_data;
wire soc_eth_core_icmp_echo_buffer_fifo_in_payload_error;
wire [15:0] soc_eth_core_icmp_echo_buffer_fifo_in_param_checksum;
wire [7:0] soc_eth_core_icmp_echo_buffer_fifo_in_param_code;
wire [7:0] soc_eth_core_icmp_echo_buffer_fifo_in_param_msgtype;
wire [31:0] soc_eth_core_icmp_echo_buffer_fifo_in_param_quench;
wire [31:0] soc_eth_core_icmp_echo_buffer_fifo_in_param_ip_address;
wire [15:0] soc_eth_core_icmp_echo_buffer_fifo_in_param_length;
wire soc_eth_core_icmp_echo_buffer_fifo_in_first;
wire soc_eth_core_icmp_echo_buffer_fifo_in_last;
wire [7:0] soc_eth_core_icmp_echo_buffer_fifo_out_payload_data;
wire soc_eth_core_icmp_echo_buffer_fifo_out_payload_error;
wire [15:0] soc_eth_core_icmp_echo_buffer_fifo_out_param_checksum;
wire [7:0] soc_eth_core_icmp_echo_buffer_fifo_out_param_code;
wire [7:0] soc_eth_core_icmp_echo_buffer_fifo_out_param_msgtype;
wire [31:0] soc_eth_core_icmp_echo_buffer_fifo_out_param_quench;
wire [31:0] soc_eth_core_icmp_echo_buffer_fifo_out_param_ip_address;
wire [15:0] soc_eth_core_icmp_echo_buffer_fifo_out_param_length;
wire soc_eth_core_icmp_echo_buffer_fifo_out_first;
wire soc_eth_core_icmp_echo_buffer_fifo_out_last;
wire soc_eth_core_icmp_sink_valid;
reg soc_eth_core_icmp_sink_ready = 1'd0;
wire soc_eth_core_icmp_sink_first;
wire soc_eth_core_icmp_sink_last;
wire [7:0] soc_eth_core_icmp_sink_payload_data;
wire soc_eth_core_icmp_sink_payload_error;
wire [15:0] soc_eth_core_icmp_sink_param_length;
wire [7:0] soc_eth_core_icmp_sink_param_protocol;
wire [31:0] soc_eth_core_icmp_sink_param_ip_address;
reg soc_eth_core_icmp_source_valid = 1'd0;
wire soc_eth_core_icmp_source_ready;
reg soc_eth_core_icmp_source_first = 1'd0;
reg soc_eth_core_icmp_source_last = 1'd0;
reg [7:0] soc_eth_core_icmp_source_payload_data = 8'd0;
reg soc_eth_core_icmp_source_payload_error = 1'd0;
reg [15:0] soc_eth_core_icmp_source_param_length = 16'd0;
reg [7:0] soc_eth_core_icmp_source_param_protocol = 8'd0;
reg [31:0] soc_eth_core_icmp_source_param_ip_address = 32'd0;
wire soc_eth_core_tx_sink_sink_valid;
wire soc_eth_core_tx_sink_sink_ready;
wire soc_eth_core_tx_sink_sink_first;
wire soc_eth_core_tx_sink_sink_last;
wire [7:0] soc_eth_core_tx_sink_sink_payload_data;
wire soc_eth_core_tx_sink_sink_payload_error;
wire [15:0] soc_eth_core_tx_sink_sink_param_src_port;
wire [15:0] soc_eth_core_tx_sink_sink_param_dst_port;
wire [31:0] soc_eth_core_tx_sink_sink_param_ip_address;
wire [15:0] soc_eth_core_tx_sink_sink_param_length;
reg soc_eth_core_tx_source_source_valid = 1'd0;
wire soc_eth_core_tx_source_source_ready;
reg soc_eth_core_tx_source_source_first = 1'd0;
reg soc_eth_core_tx_source_source_last = 1'd0;
reg [7:0] soc_eth_core_tx_source_source_payload_data = 8'd0;
reg soc_eth_core_tx_source_source_payload_error = 1'd0;
reg [15:0] soc_eth_core_tx_source_source_param_length = 16'd0;
reg [7:0] soc_eth_core_tx_source_source_param_protocol = 8'd0;
reg [31:0] soc_eth_core_tx_source_source_param_ip_address = 32'd0;
wire soc_eth_core_tx_packetizer_sink_valid;
reg soc_eth_core_tx_packetizer_sink_ready = 1'd0;
reg soc_eth_core_tx_packetizer_sink_first = 1'd0;
wire soc_eth_core_tx_packetizer_sink_last;
wire [7:0] soc_eth_core_tx_packetizer_sink_payload_data;
reg soc_eth_core_tx_packetizer_sink_payload_error = 1'd0;
wire [15:0] soc_eth_core_tx_packetizer_sink_param_checksum;
wire [15:0] soc_eth_core_tx_packetizer_sink_param_dst_port;
wire [15:0] soc_eth_core_tx_packetizer_sink_param_length;
wire [15:0] soc_eth_core_tx_packetizer_sink_param_src_port;
reg soc_eth_core_tx_packetizer_source_valid = 1'd0;
reg soc_eth_core_tx_packetizer_source_ready = 1'd0;
reg soc_eth_core_tx_packetizer_source_first = 1'd0;
reg soc_eth_core_tx_packetizer_source_last = 1'd0;
reg [7:0] soc_eth_core_tx_packetizer_source_payload_data = 8'd0;
wire soc_eth_core_tx_packetizer_source_payload_error;
reg [15:0] soc_eth_core_tx_packetizer_source_param_length = 16'd0;
reg [7:0] soc_eth_core_tx_packetizer_source_param_protocol = 8'd0;
reg [31:0] soc_eth_core_tx_packetizer_source_param_ip_address = 32'd0;
reg [63:0] soc_eth_core_tx_packetizer_header = 64'd0;
reg [63:0] soc_eth_core_tx_packetizer_sr = 64'd0;
reg soc_eth_core_tx_packetizer_sr_load = 1'd0;
reg soc_eth_core_tx_packetizer_sr_shift = 1'd0;
reg [2:0] soc_eth_core_tx_packetizer_count = 3'd0;
reg soc_eth_core_tx_packetizer_sink_d_valid = 1'd0;
reg soc_eth_core_tx_packetizer_sink_d_ready = 1'd0;
reg soc_eth_core_tx_packetizer_sink_d_first = 1'd0;
reg soc_eth_core_tx_packetizer_sink_d_last = 1'd0;
reg [7:0] soc_eth_core_tx_packetizer_sink_d_payload_data = 8'd0;
reg soc_eth_core_tx_packetizer_sink_d_payload_error = 1'd0;
reg [15:0] soc_eth_core_tx_packetizer_sink_d_param_checksum = 16'd0;
reg [15:0] soc_eth_core_tx_packetizer_sink_d_param_dst_port = 16'd0;
reg [15:0] soc_eth_core_tx_packetizer_sink_d_param_length = 16'd0;
reg [15:0] soc_eth_core_tx_packetizer_sink_d_param_src_port = 16'd0;
reg soc_eth_core_tx_packetizer_fsm_from_idle = 1'd0;
wire soc_eth_core_rx_sink_sink_valid;
wire soc_eth_core_rx_sink_sink_ready;
wire soc_eth_core_rx_sink_sink_first;
wire soc_eth_core_rx_sink_sink_last;
wire [7:0] soc_eth_core_rx_sink_sink_payload_data;
wire soc_eth_core_rx_sink_sink_payload_error;
wire [15:0] soc_eth_core_rx_sink_sink_param_length;
wire [7:0] soc_eth_core_rx_sink_sink_param_protocol;
wire [31:0] soc_eth_core_rx_sink_sink_param_ip_address;
reg soc_eth_core_rx_source_source_valid = 1'd0;
wire soc_eth_core_rx_source_source_ready;
reg soc_eth_core_rx_source_source_first = 1'd0;
wire soc_eth_core_rx_source_source_last;
wire [7:0] soc_eth_core_rx_source_source_payload_data;
wire soc_eth_core_rx_source_source_payload_error;
wire [15:0] soc_eth_core_rx_source_source_param_src_port;
wire [15:0] soc_eth_core_rx_source_source_param_dst_port;
wire [31:0] soc_eth_core_rx_source_source_param_ip_address;
wire [15:0] soc_eth_core_rx_source_source_param_length;
wire soc_eth_core_rx_depacketizer_sink_valid;
reg soc_eth_core_rx_depacketizer_sink_ready = 1'd0;
wire soc_eth_core_rx_depacketizer_sink_first;
wire soc_eth_core_rx_depacketizer_sink_last;
wire [7:0] soc_eth_core_rx_depacketizer_sink_payload_data;
wire soc_eth_core_rx_depacketizer_sink_payload_error;
wire [15:0] soc_eth_core_rx_depacketizer_sink_param_length;
wire [7:0] soc_eth_core_rx_depacketizer_sink_param_protocol;
wire [31:0] soc_eth_core_rx_depacketizer_sink_param_ip_address;
reg soc_eth_core_rx_depacketizer_source_valid = 1'd0;
reg soc_eth_core_rx_depacketizer_source_ready = 1'd0;
reg soc_eth_core_rx_depacketizer_source_last = 1'd0;
reg [7:0] soc_eth_core_rx_depacketizer_source_payload_data = 8'd0;
wire soc_eth_core_rx_depacketizer_source_payload_error;
wire [15:0] soc_eth_core_rx_depacketizer_source_param_checksum;
wire [15:0] soc_eth_core_rx_depacketizer_source_param_dst_port;
wire [15:0] soc_eth_core_rx_depacketizer_source_param_length;
wire [15:0] soc_eth_core_rx_depacketizer_source_param_src_port;
wire [63:0] soc_eth_core_rx_depacketizer_header;
reg [63:0] soc_eth_core_rx_depacketizer_sr = 64'd0;
reg soc_eth_core_rx_depacketizer_sr_shift = 1'd0;
reg soc_eth_core_rx_depacketizer_sr_shift_leftover = 1'd0;
reg [2:0] soc_eth_core_rx_depacketizer_count = 3'd0;
reg soc_eth_core_rx_depacketizer_sink_d_valid = 1'd0;
reg soc_eth_core_rx_depacketizer_sink_d_ready = 1'd0;
reg soc_eth_core_rx_depacketizer_sink_d_first = 1'd0;
reg soc_eth_core_rx_depacketizer_sink_d_last = 1'd0;
reg [7:0] soc_eth_core_rx_depacketizer_sink_d_payload_data = 8'd0;
reg soc_eth_core_rx_depacketizer_sink_d_payload_error = 1'd0;
reg [15:0] soc_eth_core_rx_depacketizer_sink_d_param_length = 16'd0;
reg [7:0] soc_eth_core_rx_depacketizer_sink_d_param_protocol = 8'd0;
reg [31:0] soc_eth_core_rx_depacketizer_sink_d_param_ip_address = 32'd0;
reg soc_eth_core_rx_depacketizer_fsm_from_idle = 1'd0;
reg soc_eth_core_rx_valid = 1'd0;
wire soc_eth_core_ip_port_sink_valid;
reg soc_eth_core_ip_port_sink_ready = 1'd0;
wire soc_eth_core_ip_port_sink_first;
wire soc_eth_core_ip_port_sink_last;
wire [7:0] soc_eth_core_ip_port_sink_payload_data;
wire soc_eth_core_ip_port_sink_payload_error;
wire [15:0] soc_eth_core_ip_port_sink_param_length;
wire [7:0] soc_eth_core_ip_port_sink_param_protocol;
wire [31:0] soc_eth_core_ip_port_sink_param_ip_address;
reg soc_eth_core_ip_port_source_valid = 1'd0;
wire soc_eth_core_ip_port_source_ready;
reg soc_eth_core_ip_port_source_first = 1'd0;
reg soc_eth_core_ip_port_source_last = 1'd0;
reg [7:0] soc_eth_core_ip_port_source_payload_data = 8'd0;
reg soc_eth_core_ip_port_source_payload_error = 1'd0;
reg [15:0] soc_eth_core_ip_port_source_param_length = 16'd0;
reg [7:0] soc_eth_core_ip_port_source_param_protocol = 8'd0;
reg [31:0] soc_eth_core_ip_port_source_param_ip_address = 32'd0;
wire soc_eth_core_crossbar_source_valid;
wire soc_eth_core_crossbar_source_ready;
wire soc_eth_core_crossbar_source_first;
wire soc_eth_core_crossbar_source_last;
wire [7:0] soc_eth_core_crossbar_source_payload_data;
wire soc_eth_core_crossbar_source_payload_error;
wire [15:0] soc_eth_core_crossbar_source_param_src_port;
wire [15:0] soc_eth_core_crossbar_source_param_dst_port;
wire [31:0] soc_eth_core_crossbar_source_param_ip_address;
wire [15:0] soc_eth_core_crossbar_source_param_length;
wire soc_eth_core_crossbar_sink_valid;
wire soc_eth_core_crossbar_sink_ready;
wire soc_eth_core_crossbar_sink_first;
wire soc_eth_core_crossbar_sink_last;
wire [7:0] soc_eth_core_crossbar_sink_payload_data;
wire soc_eth_core_crossbar_sink_payload_error;
wire [15:0] soc_eth_core_crossbar_sink_param_src_port;
wire [15:0] soc_eth_core_crossbar_sink_param_dst_port;
wire [31:0] soc_eth_core_crossbar_sink_param_ip_address;
wire [15:0] soc_eth_core_crossbar_sink_param_length;
reg soc_etherbone_tx_sink_sink_valid = 1'd0;
wire soc_etherbone_tx_sink_sink_ready;
reg soc_etherbone_tx_sink_sink_first = 1'd0;
reg soc_etherbone_tx_sink_sink_last = 1'd0;
reg [31:0] soc_etherbone_tx_sink_sink_payload_data = 32'd0;
reg [3:0] soc_etherbone_tx_sink_sink_payload_error = 4'd0;
reg [3:0] soc_etherbone_tx_sink_sink_param_addr_size = 4'd0;
reg soc_etherbone_tx_sink_sink_param_nr = 1'd0;
reg soc_etherbone_tx_sink_sink_param_pf = 1'd0;
reg [3:0] soc_etherbone_tx_sink_sink_param_port_size = 4'd0;
reg soc_etherbone_tx_sink_sink_param_pr = 1'd0;
reg [15:0] soc_etherbone_tx_sink_sink_param_src_port = 16'd0;
reg [15:0] soc_etherbone_tx_sink_sink_param_dst_port = 16'd0;
reg [31:0] soc_etherbone_tx_sink_sink_param_ip_address = 32'd0;
reg [15:0] soc_etherbone_tx_sink_sink_param_length = 16'd0;
reg soc_etherbone_tx_source_source_valid = 1'd0;
wire soc_etherbone_tx_source_source_ready;
reg soc_etherbone_tx_source_source_first = 1'd0;
reg soc_etherbone_tx_source_source_last = 1'd0;
reg [31:0] soc_etherbone_tx_source_source_payload_data = 32'd0;
reg [3:0] soc_etherbone_tx_source_source_payload_error = 4'd0;
reg [15:0] soc_etherbone_tx_source_source_param_src_port = 16'd0;
reg [15:0] soc_etherbone_tx_source_source_param_dst_port = 16'd0;
reg [31:0] soc_etherbone_tx_source_source_param_ip_address = 32'd0;
reg [15:0] soc_etherbone_tx_source_source_param_length = 16'd0;
wire soc_etherbone_tx_packetizer_sink_valid;
reg soc_etherbone_tx_packetizer_sink_ready = 1'd0;
reg soc_etherbone_tx_packetizer_sink_first = 1'd0;
wire soc_etherbone_tx_packetizer_sink_last;
wire [31:0] soc_etherbone_tx_packetizer_sink_payload_data;
reg [3:0] soc_etherbone_tx_packetizer_sink_payload_error = 4'd0;
wire [3:0] soc_etherbone_tx_packetizer_sink_param_addr_size;
wire [15:0] soc_etherbone_tx_packetizer_sink_param_magic;
wire soc_etherbone_tx_packetizer_sink_param_nr;
wire soc_etherbone_tx_packetizer_sink_param_pf;
wire [3:0] soc_etherbone_tx_packetizer_sink_param_port_size;
wire soc_etherbone_tx_packetizer_sink_param_pr;
wire [3:0] soc_etherbone_tx_packetizer_sink_param_version;
reg soc_etherbone_tx_packetizer_source_valid = 1'd0;
reg soc_etherbone_tx_packetizer_source_ready = 1'd0;
reg soc_etherbone_tx_packetizer_source_first = 1'd0;
reg soc_etherbone_tx_packetizer_source_last = 1'd0;
reg [31:0] soc_etherbone_tx_packetizer_source_payload_data = 32'd0;
wire [3:0] soc_etherbone_tx_packetizer_source_payload_error;
reg [15:0] soc_etherbone_tx_packetizer_source_param_src_port = 16'd0;
reg [15:0] soc_etherbone_tx_packetizer_source_param_dst_port = 16'd0;
reg [31:0] soc_etherbone_tx_packetizer_source_param_ip_address = 32'd0;
reg [15:0] soc_etherbone_tx_packetizer_source_param_length = 16'd0;
reg [63:0] soc_etherbone_tx_packetizer_header = 64'd0;
reg [63:0] soc_etherbone_tx_packetizer_sr = 64'd0;
reg soc_etherbone_tx_packetizer_sr_load = 1'd0;
reg soc_etherbone_tx_packetizer_sr_shift = 1'd0;
reg soc_etherbone_tx_packetizer_count = 1'd0;
reg soc_etherbone_tx_packetizer_sink_d_valid = 1'd0;
reg soc_etherbone_tx_packetizer_sink_d_ready = 1'd0;
reg soc_etherbone_tx_packetizer_sink_d_first = 1'd0;
reg soc_etherbone_tx_packetizer_sink_d_last = 1'd0;
reg [31:0] soc_etherbone_tx_packetizer_sink_d_payload_data = 32'd0;
reg [3:0] soc_etherbone_tx_packetizer_sink_d_payload_error = 4'd0;
reg [3:0] soc_etherbone_tx_packetizer_sink_d_param_addr_size = 4'd0;
reg [15:0] soc_etherbone_tx_packetizer_sink_d_param_magic = 16'd0;
reg soc_etherbone_tx_packetizer_sink_d_param_nr = 1'd0;
reg soc_etherbone_tx_packetizer_sink_d_param_pf = 1'd0;
reg [3:0] soc_etherbone_tx_packetizer_sink_d_param_port_size = 4'd0;
reg soc_etherbone_tx_packetizer_sink_d_param_pr = 1'd0;
reg [3:0] soc_etherbone_tx_packetizer_sink_d_param_version = 4'd0;
reg soc_etherbone_tx_packetizer_fsm_from_idle = 1'd0;
wire soc_etherbone_rx_sink_sink_valid;
wire soc_etherbone_rx_sink_sink_ready;
wire soc_etherbone_rx_sink_sink_first;
wire soc_etherbone_rx_sink_sink_last;
wire [31:0] soc_etherbone_rx_sink_sink_payload_data;
wire [3:0] soc_etherbone_rx_sink_sink_payload_error;
wire [15:0] soc_etherbone_rx_sink_sink_param_src_port;
wire [15:0] soc_etherbone_rx_sink_sink_param_dst_port;
wire [31:0] soc_etherbone_rx_sink_sink_param_ip_address;
wire [15:0] soc_etherbone_rx_sink_sink_param_length;
reg soc_etherbone_rx_source_source_valid = 1'd0;
reg soc_etherbone_rx_source_source_ready = 1'd0;
reg soc_etherbone_rx_source_source_first = 1'd0;
wire soc_etherbone_rx_source_source_last;
wire [31:0] soc_etherbone_rx_source_source_payload_data;
reg [3:0] soc_etherbone_rx_source_source_payload_error = 4'd0;
reg [3:0] soc_etherbone_rx_source_source_param_addr_size = 4'd0;
wire soc_etherbone_rx_source_source_param_nr;
wire soc_etherbone_rx_source_source_param_pf;
reg [3:0] soc_etherbone_rx_source_source_param_port_size = 4'd0;
wire soc_etherbone_rx_source_source_param_pr;
wire [15:0] soc_etherbone_rx_source_source_param_src_port;
wire [15:0] soc_etherbone_rx_source_source_param_dst_port;
wire [31:0] soc_etherbone_rx_source_source_param_ip_address;
wire [15:0] soc_etherbone_rx_source_source_param_length;
wire soc_etherbone_rx_depacketizer_sink_valid;
reg soc_etherbone_rx_depacketizer_sink_ready = 1'd0;
wire soc_etherbone_rx_depacketizer_sink_first;
wire soc_etherbone_rx_depacketizer_sink_last;
wire [31:0] soc_etherbone_rx_depacketizer_sink_payload_data;
wire [3:0] soc_etherbone_rx_depacketizer_sink_payload_error;
wire [15:0] soc_etherbone_rx_depacketizer_sink_param_src_port;
wire [15:0] soc_etherbone_rx_depacketizer_sink_param_dst_port;
wire [31:0] soc_etherbone_rx_depacketizer_sink_param_ip_address;
wire [15:0] soc_etherbone_rx_depacketizer_sink_param_length;
reg soc_etherbone_rx_depacketizer_source_valid = 1'd0;
reg soc_etherbone_rx_depacketizer_source_ready = 1'd0;
reg soc_etherbone_rx_depacketizer_source_last = 1'd0;
reg [31:0] soc_etherbone_rx_depacketizer_source_payload_data = 32'd0;
wire [3:0] soc_etherbone_rx_depacketizer_source_payload_error;
wire [3:0] soc_etherbone_rx_depacketizer_source_param_addr_size;
wire [15:0] soc_etherbone_rx_depacketizer_source_param_magic;
wire soc_etherbone_rx_depacketizer_source_param_nr;
wire soc_etherbone_rx_depacketizer_source_param_pf;
wire [3:0] soc_etherbone_rx_depacketizer_source_param_port_size;
wire soc_etherbone_rx_depacketizer_source_param_pr;
wire [3:0] soc_etherbone_rx_depacketizer_source_param_version;
wire [63:0] soc_etherbone_rx_depacketizer_header;
reg [63:0] soc_etherbone_rx_depacketizer_sr = 64'd0;
reg soc_etherbone_rx_depacketizer_sr_shift = 1'd0;
reg soc_etherbone_rx_depacketizer_sr_shift_leftover = 1'd0;
reg soc_etherbone_rx_depacketizer_count = 1'd0;
reg soc_etherbone_rx_depacketizer_sink_d_valid = 1'd0;
reg soc_etherbone_rx_depacketizer_sink_d_ready = 1'd0;
reg soc_etherbone_rx_depacketizer_sink_d_first = 1'd0;
reg soc_etherbone_rx_depacketizer_sink_d_last = 1'd0;
reg [31:0] soc_etherbone_rx_depacketizer_sink_d_payload_data = 32'd0;
reg [3:0] soc_etherbone_rx_depacketizer_sink_d_payload_error = 4'd0;
reg [15:0] soc_etherbone_rx_depacketizer_sink_d_param_src_port = 16'd0;
reg [15:0] soc_etherbone_rx_depacketizer_sink_d_param_dst_port = 16'd0;
reg [31:0] soc_etherbone_rx_depacketizer_sink_d_param_ip_address = 32'd0;
reg [15:0] soc_etherbone_rx_depacketizer_sink_d_param_length = 16'd0;
reg soc_etherbone_rx_depacketizer_fsm_from_idle = 1'd0;
reg soc_etherbone_rx_valid = 1'd0;
wire soc_etherbone_user_port_sink_valid;
wire soc_etherbone_user_port_sink_ready;
wire soc_etherbone_user_port_sink_first;
wire soc_etherbone_user_port_sink_last;
wire [31:0] soc_etherbone_user_port_sink_payload_data;
wire [3:0] soc_etherbone_user_port_sink_payload_error;
wire [15:0] soc_etherbone_user_port_sink_param_src_port;
wire [15:0] soc_etherbone_user_port_sink_param_dst_port;
wire [31:0] soc_etherbone_user_port_sink_param_ip_address;
wire [15:0] soc_etherbone_user_port_sink_param_length;
wire soc_etherbone_user_port_source_valid;
wire soc_etherbone_user_port_source_ready;
wire soc_etherbone_user_port_source_first;
wire soc_etherbone_user_port_source_last;
wire [31:0] soc_etherbone_user_port_source_payload_data;
wire [3:0] soc_etherbone_user_port_source_payload_error;
wire [15:0] soc_etherbone_user_port_source_param_src_port;
wire [15:0] soc_etherbone_user_port_source_param_dst_port;
wire [31:0] soc_etherbone_user_port_source_param_ip_address;
wire [15:0] soc_etherbone_user_port_source_param_length;
wire soc_etherbone_internal_port_sink_valid;
wire soc_etherbone_internal_port_sink_ready;
wire soc_etherbone_internal_port_sink_first;
wire soc_etherbone_internal_port_sink_last;
wire [7:0] soc_etherbone_internal_port_sink_payload_data;
wire soc_etherbone_internal_port_sink_payload_error;
wire [15:0] soc_etherbone_internal_port_sink_param_src_port;
wire [15:0] soc_etherbone_internal_port_sink_param_dst_port;
wire [31:0] soc_etherbone_internal_port_sink_param_ip_address;
wire [15:0] soc_etherbone_internal_port_sink_param_length;
wire soc_etherbone_internal_port_source_valid;
wire soc_etherbone_internal_port_source_ready;
wire soc_etherbone_internal_port_source_first;
wire soc_etherbone_internal_port_source_last;
wire [7:0] soc_etherbone_internal_port_source_payload_data;
wire soc_etherbone_internal_port_source_payload_error;
wire [15:0] soc_etherbone_internal_port_source_param_src_port;
wire [15:0] soc_etherbone_internal_port_source_param_dst_port;
wire [31:0] soc_etherbone_internal_port_source_param_ip_address;
wire [15:0] soc_etherbone_internal_port_source_param_length;
wire soc_etherbone_tx_converter_sink_valid;
wire soc_etherbone_tx_converter_sink_ready;
wire soc_etherbone_tx_converter_sink_first;
wire soc_etherbone_tx_converter_sink_last;
wire [31:0] soc_etherbone_tx_converter_sink_payload_data;
wire [3:0] soc_etherbone_tx_converter_sink_payload_error;
wire [15:0] soc_etherbone_tx_converter_sink_param_src_port;
wire [15:0] soc_etherbone_tx_converter_sink_param_dst_port;
wire [31:0] soc_etherbone_tx_converter_sink_param_ip_address;
wire [15:0] soc_etherbone_tx_converter_sink_param_length;
wire soc_etherbone_tx_converter_source_valid;
wire soc_etherbone_tx_converter_source_ready;
wire soc_etherbone_tx_converter_source_first;
wire soc_etherbone_tx_converter_source_last;
wire [7:0] soc_etherbone_tx_converter_source_payload_data;
wire soc_etherbone_tx_converter_source_payload_error;
wire [15:0] soc_etherbone_tx_converter_source_param_src_port;
wire [15:0] soc_etherbone_tx_converter_source_param_dst_port;
wire [31:0] soc_etherbone_tx_converter_source_param_ip_address;
wire [15:0] soc_etherbone_tx_converter_source_param_length;
wire soc_etherbone_tx_converter_converter_sink_valid;
wire soc_etherbone_tx_converter_converter_sink_ready;
wire soc_etherbone_tx_converter_converter_sink_first;
wire soc_etherbone_tx_converter_converter_sink_last;
reg [35:0] soc_etherbone_tx_converter_converter_sink_payload_data = 36'd0;
wire soc_etherbone_tx_converter_converter_source_valid;
wire soc_etherbone_tx_converter_converter_source_ready;
wire soc_etherbone_tx_converter_converter_source_first;
wire soc_etherbone_tx_converter_converter_source_last;
reg [8:0] soc_etherbone_tx_converter_converter_source_payload_data = 9'd0;
wire soc_etherbone_tx_converter_converter_source_payload_valid_token_count;
reg [1:0] soc_etherbone_tx_converter_converter_mux = 2'd0;
wire soc_etherbone_tx_converter_converter_first;
wire soc_etherbone_tx_converter_converter_last;
wire soc_etherbone_tx_converter_source_source_valid;
wire soc_etherbone_tx_converter_source_source_ready;
wire soc_etherbone_tx_converter_source_source_first;
wire soc_etherbone_tx_converter_source_source_last;
wire [8:0] soc_etherbone_tx_converter_source_source_payload_data;
wire soc_etherbone_rx_converter_sink_valid;
wire soc_etherbone_rx_converter_sink_ready;
wire soc_etherbone_rx_converter_sink_first;
wire soc_etherbone_rx_converter_sink_last;
wire [7:0] soc_etherbone_rx_converter_sink_payload_data;
wire soc_etherbone_rx_converter_sink_payload_error;
wire [15:0] soc_etherbone_rx_converter_sink_param_src_port;
wire [15:0] soc_etherbone_rx_converter_sink_param_dst_port;
wire [31:0] soc_etherbone_rx_converter_sink_param_ip_address;
wire [15:0] soc_etherbone_rx_converter_sink_param_length;
wire soc_etherbone_rx_converter_source_valid;
wire soc_etherbone_rx_converter_source_ready;
wire soc_etherbone_rx_converter_source_first;
wire soc_etherbone_rx_converter_source_last;
reg [31:0] soc_etherbone_rx_converter_source_payload_data = 32'd0;
reg [3:0] soc_etherbone_rx_converter_source_payload_error = 4'd0;
reg [15:0] soc_etherbone_rx_converter_source_param_src_port = 16'd0;
reg [15:0] soc_etherbone_rx_converter_source_param_dst_port = 16'd0;
reg [31:0] soc_etherbone_rx_converter_source_param_ip_address = 32'd0;
reg [15:0] soc_etherbone_rx_converter_source_param_length = 16'd0;
wire soc_etherbone_rx_converter_converter_sink_valid;
wire soc_etherbone_rx_converter_converter_sink_ready;
wire soc_etherbone_rx_converter_converter_sink_first;
wire soc_etherbone_rx_converter_converter_sink_last;
wire [8:0] soc_etherbone_rx_converter_converter_sink_payload_data;
wire soc_etherbone_rx_converter_converter_source_valid;
wire soc_etherbone_rx_converter_converter_source_ready;
reg soc_etherbone_rx_converter_converter_source_first = 1'd0;
reg soc_etherbone_rx_converter_converter_source_last = 1'd0;
reg [35:0] soc_etherbone_rx_converter_converter_source_payload_data = 36'd0;
reg [2:0] soc_etherbone_rx_converter_converter_source_payload_valid_token_count = 3'd0;
reg [1:0] soc_etherbone_rx_converter_converter_demux = 2'd0;
wire soc_etherbone_rx_converter_converter_load_part;
reg soc_etherbone_rx_converter_converter_strobe_all = 1'd0;
wire soc_etherbone_rx_converter_source_source_valid;
wire soc_etherbone_rx_converter_source_source_ready;
wire soc_etherbone_rx_converter_source_source_first;
wire soc_etherbone_rx_converter_source_source_last;
wire [35:0] soc_etherbone_rx_converter_source_source_payload_data;
reg soc_etherbone_probe_sink_valid = 1'd0;
reg soc_etherbone_probe_sink_ready = 1'd0;
reg soc_etherbone_probe_sink_first = 1'd0;
reg soc_etherbone_probe_sink_last = 1'd0;
reg [31:0] soc_etherbone_probe_sink_payload_data = 32'd0;
reg [3:0] soc_etherbone_probe_sink_payload_error = 4'd0;
reg [3:0] soc_etherbone_probe_sink_param_addr_size = 4'd0;
reg soc_etherbone_probe_sink_param_nr = 1'd0;
reg soc_etherbone_probe_sink_param_pf = 1'd0;
reg [3:0] soc_etherbone_probe_sink_param_port_size = 4'd0;
reg soc_etherbone_probe_sink_param_pr = 1'd0;
reg [15:0] soc_etherbone_probe_sink_param_src_port = 16'd0;
reg [15:0] soc_etherbone_probe_sink_param_dst_port = 16'd0;
reg [31:0] soc_etherbone_probe_sink_param_ip_address = 32'd0;
reg [15:0] soc_etherbone_probe_sink_param_length = 16'd0;
reg soc_etherbone_probe_source_valid = 1'd0;
reg soc_etherbone_probe_source_ready = 1'd0;
reg soc_etherbone_probe_source_first = 1'd0;
reg soc_etherbone_probe_source_last = 1'd0;
reg [31:0] soc_etherbone_probe_source_payload_data = 32'd0;
reg [3:0] soc_etherbone_probe_source_payload_error = 4'd0;
reg [3:0] soc_etherbone_probe_source_param_addr_size = 4'd0;
reg soc_etherbone_probe_source_param_nr = 1'd0;
reg soc_etherbone_probe_source_param_pf = 1'd0;
reg [3:0] soc_etherbone_probe_source_param_port_size = 4'd0;
reg soc_etherbone_probe_source_param_pr = 1'd0;
reg [15:0] soc_etherbone_probe_source_param_src_port = 16'd0;
reg [15:0] soc_etherbone_probe_source_param_dst_port = 16'd0;
reg [31:0] soc_etherbone_probe_source_param_ip_address = 32'd0;
reg [15:0] soc_etherbone_probe_source_param_length = 16'd0;
reg soc_etherbone_record_sink_sink_valid = 1'd0;
wire soc_etherbone_record_sink_sink_ready;
reg soc_etherbone_record_sink_sink_first = 1'd0;
reg soc_etherbone_record_sink_sink_last = 1'd0;
reg [31:0] soc_etherbone_record_sink_sink_payload_data = 32'd0;
reg [3:0] soc_etherbone_record_sink_sink_payload_error = 4'd0;
reg [3:0] soc_etherbone_record_sink_sink_param_addr_size = 4'd0;
reg soc_etherbone_record_sink_sink_param_nr = 1'd0;
reg soc_etherbone_record_sink_sink_param_pf = 1'd0;
reg [3:0] soc_etherbone_record_sink_sink_param_port_size = 4'd0;
reg soc_etherbone_record_sink_sink_param_pr = 1'd0;
reg [15:0] soc_etherbone_record_sink_sink_param_src_port = 16'd0;
reg [15:0] soc_etherbone_record_sink_sink_param_dst_port = 16'd0;
reg [31:0] soc_etherbone_record_sink_sink_param_ip_address = 32'd0;
reg [15:0] soc_etherbone_record_sink_sink_param_length = 16'd0;
wire soc_etherbone_record_source_source_valid;
reg soc_etherbone_record_source_source_ready = 1'd0;
wire soc_etherbone_record_source_source_first;
wire soc_etherbone_record_source_source_last;
wire [31:0] soc_etherbone_record_source_source_payload_data;
wire [3:0] soc_etherbone_record_source_source_payload_error;
wire [3:0] soc_etherbone_record_source_source_param_addr_size;
wire soc_etherbone_record_source_source_param_nr;
wire soc_etherbone_record_source_source_param_pf;
wire [3:0] soc_etherbone_record_source_source_param_port_size;
wire soc_etherbone_record_source_source_param_pr;
wire [15:0] soc_etherbone_record_source_source_param_src_port;
wire [15:0] soc_etherbone_record_source_source_param_dst_port;
reg [31:0] soc_etherbone_record_source_source_param_ip_address = 32'd0;
reg [15:0] soc_etherbone_record_source_source_param_length = 16'd0;
wire soc_etherbone_record_depacketizer_sink_valid;
reg soc_etherbone_record_depacketizer_sink_ready = 1'd0;
wire soc_etherbone_record_depacketizer_sink_first;
wire soc_etherbone_record_depacketizer_sink_last;
wire [31:0] soc_etherbone_record_depacketizer_sink_payload_data;
wire [3:0] soc_etherbone_record_depacketizer_sink_payload_error;
wire [3:0] soc_etherbone_record_depacketizer_sink_param_addr_size;
wire soc_etherbone_record_depacketizer_sink_param_nr;
wire soc_etherbone_record_depacketizer_sink_param_pf;
wire [3:0] soc_etherbone_record_depacketizer_sink_param_port_size;
wire soc_etherbone_record_depacketizer_sink_param_pr;
wire [15:0] soc_etherbone_record_depacketizer_sink_param_src_port;
wire [15:0] soc_etherbone_record_depacketizer_sink_param_dst_port;
wire [31:0] soc_etherbone_record_depacketizer_sink_param_ip_address;
wire [15:0] soc_etherbone_record_depacketizer_sink_param_length;
reg soc_etherbone_record_depacketizer_source_valid = 1'd0;
wire soc_etherbone_record_depacketizer_source_ready;
reg soc_etherbone_record_depacketizer_source_first = 1'd0;
reg soc_etherbone_record_depacketizer_source_last = 1'd0;
reg [31:0] soc_etherbone_record_depacketizer_source_payload_data = 32'd0;
wire [3:0] soc_etherbone_record_depacketizer_source_payload_error;
wire soc_etherbone_record_depacketizer_source_param_bca;
wire [7:0] soc_etherbone_record_depacketizer_source_param_byte_enable;
wire soc_etherbone_record_depacketizer_source_param_cyc;
wire soc_etherbone_record_depacketizer_source_param_rca;
wire [7:0] soc_etherbone_record_depacketizer_source_param_rcount;
wire soc_etherbone_record_depacketizer_source_param_rff;
wire soc_etherbone_record_depacketizer_source_param_wca;
wire [7:0] soc_etherbone_record_depacketizer_source_param_wcount;
wire soc_etherbone_record_depacketizer_source_param_wff;
wire [31:0] soc_etherbone_record_depacketizer_header;
reg [31:0] soc_etherbone_record_depacketizer_sr = 32'd0;
reg soc_etherbone_record_depacketizer_sr_shift = 1'd0;
reg soc_etherbone_record_depacketizer_sr_shift_leftover = 1'd0;
reg soc_etherbone_record_depacketizer_count = 1'd0;
reg soc_etherbone_record_depacketizer_sink_d_valid = 1'd0;
reg soc_etherbone_record_depacketizer_sink_d_ready = 1'd0;
reg soc_etherbone_record_depacketizer_sink_d_first = 1'd0;
reg soc_etherbone_record_depacketizer_sink_d_last = 1'd0;
reg [31:0] soc_etherbone_record_depacketizer_sink_d_payload_data = 32'd0;
reg [3:0] soc_etherbone_record_depacketizer_sink_d_payload_error = 4'd0;
reg [3:0] soc_etherbone_record_depacketizer_sink_d_param_addr_size = 4'd0;
reg soc_etherbone_record_depacketizer_sink_d_param_nr = 1'd0;
reg soc_etherbone_record_depacketizer_sink_d_param_pf = 1'd0;
reg [3:0] soc_etherbone_record_depacketizer_sink_d_param_port_size = 4'd0;
reg soc_etherbone_record_depacketizer_sink_d_param_pr = 1'd0;
reg [15:0] soc_etherbone_record_depacketizer_sink_d_param_src_port = 16'd0;
reg [15:0] soc_etherbone_record_depacketizer_sink_d_param_dst_port = 16'd0;
reg [31:0] soc_etherbone_record_depacketizer_sink_d_param_ip_address = 32'd0;
reg [15:0] soc_etherbone_record_depacketizer_sink_d_param_length = 16'd0;
reg soc_etherbone_record_depacketizer_fsm_from_idle = 1'd0;
wire soc_etherbone_record_receiver_sink_sink_valid;
wire soc_etherbone_record_receiver_sink_sink_ready;
wire soc_etherbone_record_receiver_sink_sink_first;
wire soc_etherbone_record_receiver_sink_sink_last;
reg [31:0] soc_etherbone_record_receiver_sink_sink_payload_data = 32'd0;
wire [3:0] soc_etherbone_record_receiver_sink_sink_payload_error;
wire soc_etherbone_record_receiver_sink_sink_param_bca;
wire [7:0] soc_etherbone_record_receiver_sink_sink_param_byte_enable;
wire soc_etherbone_record_receiver_sink_sink_param_cyc;
wire soc_etherbone_record_receiver_sink_sink_param_rca;
wire [7:0] soc_etherbone_record_receiver_sink_sink_param_rcount;
wire soc_etherbone_record_receiver_sink_sink_param_rff;
wire soc_etherbone_record_receiver_sink_sink_param_wca;
wire [7:0] soc_etherbone_record_receiver_sink_sink_param_wcount;
wire soc_etherbone_record_receiver_sink_sink_param_wff;
reg soc_etherbone_record_receiver_source_source_valid = 1'd0;
wire soc_etherbone_record_receiver_source_source_ready;
reg soc_etherbone_record_receiver_source_source_first = 1'd0;
reg soc_etherbone_record_receiver_source_source_last = 1'd0;
reg [31:0] soc_etherbone_record_receiver_source_source_payload_addr = 32'd0;
reg [31:0] soc_etherbone_record_receiver_source_source_payload_data = 32'd0;
reg soc_etherbone_record_receiver_source_source_param_we = 1'd0;
reg [7:0] soc_etherbone_record_receiver_source_source_param_count = 8'd0;
reg [31:0] soc_etherbone_record_receiver_source_source_param_base_addr = 32'd0;
reg [3:0] soc_etherbone_record_receiver_source_source_param_be = 4'd0;
wire soc_etherbone_record_receiver_fifo_sink_valid;
wire soc_etherbone_record_receiver_fifo_sink_ready;
wire soc_etherbone_record_receiver_fifo_sink_first;
wire soc_etherbone_record_receiver_fifo_sink_last;
wire [31:0] soc_etherbone_record_receiver_fifo_sink_payload_data;
wire [3:0] soc_etherbone_record_receiver_fifo_sink_payload_error;
wire soc_etherbone_record_receiver_fifo_sink_param_bca;
wire [7:0] soc_etherbone_record_receiver_fifo_sink_param_byte_enable;
wire soc_etherbone_record_receiver_fifo_sink_param_cyc;
wire soc_etherbone_record_receiver_fifo_sink_param_rca;
wire [7:0] soc_etherbone_record_receiver_fifo_sink_param_rcount;
wire soc_etherbone_record_receiver_fifo_sink_param_rff;
wire soc_etherbone_record_receiver_fifo_sink_param_wca;
wire [7:0] soc_etherbone_record_receiver_fifo_sink_param_wcount;
wire soc_etherbone_record_receiver_fifo_sink_param_wff;
wire soc_etherbone_record_receiver_fifo_source_valid;
reg soc_etherbone_record_receiver_fifo_source_ready = 1'd0;
wire soc_etherbone_record_receiver_fifo_source_first;
wire soc_etherbone_record_receiver_fifo_source_last;
wire [31:0] soc_etherbone_record_receiver_fifo_source_payload_data;
wire [3:0] soc_etherbone_record_receiver_fifo_source_payload_error;
wire soc_etherbone_record_receiver_fifo_source_param_bca;
wire [7:0] soc_etherbone_record_receiver_fifo_source_param_byte_enable;
wire soc_etherbone_record_receiver_fifo_source_param_cyc;
wire soc_etherbone_record_receiver_fifo_source_param_rca;
wire [7:0] soc_etherbone_record_receiver_fifo_source_param_rcount;
wire soc_etherbone_record_receiver_fifo_source_param_rff;
wire soc_etherbone_record_receiver_fifo_source_param_wca;
wire [7:0] soc_etherbone_record_receiver_fifo_source_param_wcount;
wire soc_etherbone_record_receiver_fifo_source_param_wff;
wire soc_etherbone_record_receiver_fifo_re;
reg soc_etherbone_record_receiver_fifo_readable = 1'd0;
wire soc_etherbone_record_receiver_fifo_syncfifo_we;
wire soc_etherbone_record_receiver_fifo_syncfifo_writable;
wire soc_etherbone_record_receiver_fifo_syncfifo_re;
wire soc_etherbone_record_receiver_fifo_syncfifo_readable;
wire [67:0] soc_etherbone_record_receiver_fifo_syncfifo_din;
wire [67:0] soc_etherbone_record_receiver_fifo_syncfifo_dout;
reg [2:0] soc_etherbone_record_receiver_fifo_level0 = 3'd0;
reg soc_etherbone_record_receiver_fifo_replace = 1'd0;
reg [1:0] soc_etherbone_record_receiver_fifo_produce = 2'd0;
reg [1:0] soc_etherbone_record_receiver_fifo_consume = 2'd0;
reg [1:0] soc_etherbone_record_receiver_fifo_wrport_adr = 2'd0;
wire [67:0] soc_etherbone_record_receiver_fifo_wrport_dat_r;
wire soc_etherbone_record_receiver_fifo_wrport_we;
wire [67:0] soc_etherbone_record_receiver_fifo_wrport_dat_w;
wire soc_etherbone_record_receiver_fifo_do_read;
wire [1:0] soc_etherbone_record_receiver_fifo_rdport_adr;
wire [67:0] soc_etherbone_record_receiver_fifo_rdport_dat_r;
wire soc_etherbone_record_receiver_fifo_rdport_re;
wire [2:0] soc_etherbone_record_receiver_fifo_level1;
wire [31:0] soc_etherbone_record_receiver_fifo_fifo_in_payload_data;
wire [3:0] soc_etherbone_record_receiver_fifo_fifo_in_payload_error;
wire soc_etherbone_record_receiver_fifo_fifo_in_param_bca;
wire [7:0] soc_etherbone_record_receiver_fifo_fifo_in_param_byte_enable;
wire soc_etherbone_record_receiver_fifo_fifo_in_param_cyc;
wire soc_etherbone_record_receiver_fifo_fifo_in_param_rca;
wire [7:0] soc_etherbone_record_receiver_fifo_fifo_in_param_rcount;
wire soc_etherbone_record_receiver_fifo_fifo_in_param_rff;
wire soc_etherbone_record_receiver_fifo_fifo_in_param_wca;
wire [7:0] soc_etherbone_record_receiver_fifo_fifo_in_param_wcount;
wire soc_etherbone_record_receiver_fifo_fifo_in_param_wff;
wire soc_etherbone_record_receiver_fifo_fifo_in_first;
wire soc_etherbone_record_receiver_fifo_fifo_in_last;
wire [31:0] soc_etherbone_record_receiver_fifo_fifo_out_payload_data;
wire [3:0] soc_etherbone_record_receiver_fifo_fifo_out_payload_error;
wire soc_etherbone_record_receiver_fifo_fifo_out_param_bca;
wire [7:0] soc_etherbone_record_receiver_fifo_fifo_out_param_byte_enable;
wire soc_etherbone_record_receiver_fifo_fifo_out_param_cyc;
wire soc_etherbone_record_receiver_fifo_fifo_out_param_rca;
wire [7:0] soc_etherbone_record_receiver_fifo_fifo_out_param_rcount;
wire soc_etherbone_record_receiver_fifo_fifo_out_param_rff;
wire soc_etherbone_record_receiver_fifo_fifo_out_param_wca;
wire [7:0] soc_etherbone_record_receiver_fifo_fifo_out_param_wcount;
wire soc_etherbone_record_receiver_fifo_fifo_out_param_wff;
wire soc_etherbone_record_receiver_fifo_fifo_out_first;
wire soc_etherbone_record_receiver_fifo_fifo_out_last;
reg [31:0] soc_etherbone_record_receiver_base_addr = 32'd0;
reg soc_etherbone_record_receiver_base_addr_update = 1'd0;
reg [8:0] soc_etherbone_record_receiver_counter = 9'd0;
reg soc_etherbone_record_receiver_counter_reset = 1'd0;
reg soc_etherbone_record_receiver_counter_ce = 1'd0;
reg soc_etherbone_record_first = 1'd1;
reg [31:0] soc_etherbone_record_last_ip_address = 32'd0;
wire soc_etherbone_record_sender_sink_sink_valid;
wire soc_etherbone_record_sender_sink_sink_ready;
wire soc_etherbone_record_sender_sink_sink_first;
wire soc_etherbone_record_sender_sink_sink_last;
wire [31:0] soc_etherbone_record_sender_sink_sink_payload_addr;
wire [31:0] soc_etherbone_record_sender_sink_sink_payload_data;
wire soc_etherbone_record_sender_sink_sink_param_we;
wire [7:0] soc_etherbone_record_sender_sink_sink_param_count;
wire [31:0] soc_etherbone_record_sender_sink_sink_param_base_addr;
wire [3:0] soc_etherbone_record_sender_sink_sink_param_be;
reg soc_etherbone_record_sender_source_source_valid = 1'd0;
wire soc_etherbone_record_sender_source_source_ready;
reg soc_etherbone_record_sender_source_source_first = 1'd0;
reg soc_etherbone_record_sender_source_source_last = 1'd0;
reg [31:0] soc_etherbone_record_sender_source_source_payload_data = 32'd0;
reg [3:0] soc_etherbone_record_sender_source_source_payload_error = 4'd0;
reg soc_etherbone_record_sender_source_source_param_bca = 1'd0;
reg [7:0] soc_etherbone_record_sender_source_source_param_byte_enable = 8'd0;
reg soc_etherbone_record_sender_source_source_param_cyc = 1'd0;
reg soc_etherbone_record_sender_source_source_param_rca = 1'd0;
reg [7:0] soc_etherbone_record_sender_source_source_param_rcount = 8'd0;
reg soc_etherbone_record_sender_source_source_param_rff = 1'd0;
reg soc_etherbone_record_sender_source_source_param_wca = 1'd0;
reg [7:0] soc_etherbone_record_sender_source_source_param_wcount = 8'd0;
reg soc_etherbone_record_sender_source_source_param_wff = 1'd0;
wire soc_etherbone_record_sender_fifo_sink_valid;
wire soc_etherbone_record_sender_fifo_sink_ready;
wire soc_etherbone_record_sender_fifo_sink_first;
wire soc_etherbone_record_sender_fifo_sink_last;
wire [31:0] soc_etherbone_record_sender_fifo_sink_payload_addr;
wire [31:0] soc_etherbone_record_sender_fifo_sink_payload_data;
wire soc_etherbone_record_sender_fifo_sink_param_we;
wire [7:0] soc_etherbone_record_sender_fifo_sink_param_count;
wire [31:0] soc_etherbone_record_sender_fifo_sink_param_base_addr;
wire [3:0] soc_etherbone_record_sender_fifo_sink_param_be;
wire soc_etherbone_record_sender_fifo_source_valid;
reg soc_etherbone_record_sender_fifo_source_ready = 1'd0;
wire soc_etherbone_record_sender_fifo_source_first;
wire soc_etherbone_record_sender_fifo_source_last;
wire [31:0] soc_etherbone_record_sender_fifo_source_payload_addr;
wire [31:0] soc_etherbone_record_sender_fifo_source_payload_data;
wire soc_etherbone_record_sender_fifo_source_param_we;
wire [7:0] soc_etherbone_record_sender_fifo_source_param_count;
wire [31:0] soc_etherbone_record_sender_fifo_source_param_base_addr;
wire [3:0] soc_etherbone_record_sender_fifo_source_param_be;
wire soc_etherbone_record_sender_fifo_re;
reg soc_etherbone_record_sender_fifo_readable = 1'd0;
wire soc_etherbone_record_sender_fifo_syncfifo_we;
wire soc_etherbone_record_sender_fifo_syncfifo_writable;
wire soc_etherbone_record_sender_fifo_syncfifo_re;
wire soc_etherbone_record_sender_fifo_syncfifo_readable;
wire [110:0] soc_etherbone_record_sender_fifo_syncfifo_din;
wire [110:0] soc_etherbone_record_sender_fifo_syncfifo_dout;
reg [2:0] soc_etherbone_record_sender_fifo_level0 = 3'd0;
reg soc_etherbone_record_sender_fifo_replace = 1'd0;
reg [1:0] soc_etherbone_record_sender_fifo_produce = 2'd0;
reg [1:0] soc_etherbone_record_sender_fifo_consume = 2'd0;
reg [1:0] soc_etherbone_record_sender_fifo_wrport_adr = 2'd0;
wire [110:0] soc_etherbone_record_sender_fifo_wrport_dat_r;
wire soc_etherbone_record_sender_fifo_wrport_we;
wire [110:0] soc_etherbone_record_sender_fifo_wrport_dat_w;
wire soc_etherbone_record_sender_fifo_do_read;
wire [1:0] soc_etherbone_record_sender_fifo_rdport_adr;
wire [110:0] soc_etherbone_record_sender_fifo_rdport_dat_r;
wire soc_etherbone_record_sender_fifo_rdport_re;
wire [2:0] soc_etherbone_record_sender_fifo_level1;
wire [31:0] soc_etherbone_record_sender_fifo_fifo_in_payload_addr;
wire [31:0] soc_etherbone_record_sender_fifo_fifo_in_payload_data;
wire soc_etherbone_record_sender_fifo_fifo_in_param_we;
wire [7:0] soc_etherbone_record_sender_fifo_fifo_in_param_count;
wire [31:0] soc_etherbone_record_sender_fifo_fifo_in_param_base_addr;
wire [3:0] soc_etherbone_record_sender_fifo_fifo_in_param_be;
wire soc_etherbone_record_sender_fifo_fifo_in_first;
wire soc_etherbone_record_sender_fifo_fifo_in_last;
wire [31:0] soc_etherbone_record_sender_fifo_fifo_out_payload_addr;
wire [31:0] soc_etherbone_record_sender_fifo_fifo_out_payload_data;
wire soc_etherbone_record_sender_fifo_fifo_out_param_we;
wire [7:0] soc_etherbone_record_sender_fifo_fifo_out_param_count;
wire [31:0] soc_etherbone_record_sender_fifo_fifo_out_param_base_addr;
wire [3:0] soc_etherbone_record_sender_fifo_fifo_out_param_be;
wire soc_etherbone_record_sender_fifo_fifo_out_first;
wire soc_etherbone_record_sender_fifo_fifo_out_last;
reg soc_etherbone_record_sender_data_sel = 1'd0;
wire soc_etherbone_record_packetizer_sink_valid;
reg soc_etherbone_record_packetizer_sink_ready = 1'd0;
wire soc_etherbone_record_packetizer_sink_first;
wire soc_etherbone_record_packetizer_sink_last;
reg [31:0] soc_etherbone_record_packetizer_sink_payload_data = 32'd0;
wire [3:0] soc_etherbone_record_packetizer_sink_payload_error;
wire soc_etherbone_record_packetizer_sink_param_bca;
wire [7:0] soc_etherbone_record_packetizer_sink_param_byte_enable;
wire soc_etherbone_record_packetizer_sink_param_cyc;
wire soc_etherbone_record_packetizer_sink_param_rca;
wire [7:0] soc_etherbone_record_packetizer_sink_param_rcount;
wire soc_etherbone_record_packetizer_sink_param_rff;
wire soc_etherbone_record_packetizer_sink_param_wca;
wire [7:0] soc_etherbone_record_packetizer_sink_param_wcount;
wire soc_etherbone_record_packetizer_sink_param_wff;
reg soc_etherbone_record_packetizer_source_valid = 1'd0;
wire soc_etherbone_record_packetizer_source_ready;
reg soc_etherbone_record_packetizer_source_first = 1'd0;
reg soc_etherbone_record_packetizer_source_last = 1'd0;
reg [31:0] soc_etherbone_record_packetizer_source_payload_data = 32'd0;
wire [3:0] soc_etherbone_record_packetizer_source_payload_error;
reg [3:0] soc_etherbone_record_packetizer_source_param_addr_size = 4'd0;
reg soc_etherbone_record_packetizer_source_param_nr = 1'd0;
reg soc_etherbone_record_packetizer_source_param_pf = 1'd0;
reg [3:0] soc_etherbone_record_packetizer_source_param_port_size = 4'd0;
reg soc_etherbone_record_packetizer_source_param_pr = 1'd0;
reg [15:0] soc_etherbone_record_packetizer_source_param_src_port = 16'd0;
reg [15:0] soc_etherbone_record_packetizer_source_param_dst_port = 16'd0;
reg [31:0] soc_etherbone_record_packetizer_source_param_ip_address = 32'd0;
reg [15:0] soc_etherbone_record_packetizer_source_param_length = 16'd0;
reg [31:0] soc_etherbone_record_packetizer_header = 32'd0;
reg [31:0] soc_etherbone_record_packetizer_sr = 32'd0;
reg soc_etherbone_record_packetizer_sr_load = 1'd0;
reg soc_etherbone_record_packetizer_sr_shift = 1'd0;
reg soc_etherbone_record_packetizer_count = 1'd0;
reg soc_etherbone_record_packetizer_sink_d_valid = 1'd0;
reg soc_etherbone_record_packetizer_sink_d_ready = 1'd0;
reg soc_etherbone_record_packetizer_sink_d_first = 1'd0;
reg soc_etherbone_record_packetizer_sink_d_last = 1'd0;
reg [31:0] soc_etherbone_record_packetizer_sink_d_payload_data = 32'd0;
reg [3:0] soc_etherbone_record_packetizer_sink_d_payload_error = 4'd0;
reg soc_etherbone_record_packetizer_sink_d_param_bca = 1'd0;
reg [7:0] soc_etherbone_record_packetizer_sink_d_param_byte_enable = 8'd0;
reg soc_etherbone_record_packetizer_sink_d_param_cyc = 1'd0;
reg soc_etherbone_record_packetizer_sink_d_param_rca = 1'd0;
reg [7:0] soc_etherbone_record_packetizer_sink_d_param_rcount = 8'd0;
reg soc_etherbone_record_packetizer_sink_d_param_rff = 1'd0;
reg soc_etherbone_record_packetizer_sink_d_param_wca = 1'd0;
reg [7:0] soc_etherbone_record_packetizer_sink_d_param_wcount = 8'd0;
reg soc_etherbone_record_packetizer_sink_d_param_wff = 1'd0;
reg soc_etherbone_record_packetizer_fsm_from_idle = 1'd0;
wire soc_etherbone_dispatcher_sel0;
reg soc_etherbone_dispatcher_first = 1'd1;
reg soc_etherbone_dispatcher_last = 1'd0;
wire soc_etherbone_dispatcher_ongoing0;
reg soc_etherbone_dispatcher_ongoing1 = 1'd0;
reg soc_etherbone_dispatcher_sel1 = 1'd0;
reg soc_etherbone_dispatcher_sel_ongoing = 1'd0;
reg [1:0] soc_etherbone_request = 2'd0;
reg soc_etherbone_grant = 1'd0;
reg soc_etherbone_status0_first = 1'd1;
reg soc_etherbone_status0_last = 1'd0;
wire soc_etherbone_status0_ongoing0;
reg soc_etherbone_status0_ongoing1 = 1'd0;
reg soc_etherbone_status1_first = 1'd1;
reg soc_etherbone_status1_last = 1'd0;
wire soc_etherbone_status1_ongoing0;
reg soc_etherbone_status1_ongoing1 = 1'd0;
wire soc_etherbone_wishbone_sink_valid;
reg soc_etherbone_wishbone_sink_ready = 1'd0;
wire soc_etherbone_wishbone_sink_first;
wire soc_etherbone_wishbone_sink_last;
wire [31:0] soc_etherbone_wishbone_sink_payload_addr;
wire [31:0] soc_etherbone_wishbone_sink_payload_data;
wire soc_etherbone_wishbone_sink_param_we;
wire [7:0] soc_etherbone_wishbone_sink_param_count;
wire [31:0] soc_etherbone_wishbone_sink_param_base_addr;
wire [3:0] soc_etherbone_wishbone_sink_param_be;
reg soc_etherbone_wishbone_source_valid = 1'd0;
wire soc_etherbone_wishbone_source_ready;
reg soc_etherbone_wishbone_source_first = 1'd0;
reg soc_etherbone_wishbone_source_last = 1'd0;
reg [31:0] soc_etherbone_wishbone_source_payload_addr = 32'd0;
reg [31:0] soc_etherbone_wishbone_source_payload_data = 32'd0;
reg soc_etherbone_wishbone_source_param_we = 1'd0;
reg [7:0] soc_etherbone_wishbone_source_param_count = 8'd0;
reg [31:0] soc_etherbone_wishbone_source_param_base_addr = 32'd0;
reg [3:0] soc_etherbone_wishbone_source_param_be = 4'd0;
reg [29:0] soc_etherbone_wishbone_bus_adr = 30'd0;
reg [31:0] soc_etherbone_wishbone_bus_dat_w = 32'd0;
wire [31:0] soc_etherbone_wishbone_bus_dat_r;
reg [3:0] soc_etherbone_wishbone_bus_sel = 4'd0;
reg soc_etherbone_wishbone_bus_cyc = 1'd0;
reg soc_etherbone_wishbone_bus_stb = 1'd0;
wire soc_etherbone_wishbone_bus_ack;
reg soc_etherbone_wishbone_bus_we = 1'd0;
reg [2:0] soc_etherbone_wishbone_bus_cti = 3'd0;
reg [1:0] soc_etherbone_wishbone_bus_bte = 2'd0;
wire soc_etherbone_wishbone_bus_err;
reg soc_etherbone_wishbone_data_update = 1'd0;
wire soc_usb3_reset_n;
reg soc_phy_enable_storage = 1'd0;
reg soc_phy_enable_re = 1'd0;
reg soc_core_enable_storage = 1'd0;
reg soc_core_enable_re = 1'd0;
reg [8:0] soc_buf_in_addr_storage = 9'd0;
reg soc_buf_in_addr_re = 1'd0;
reg [31:0] soc_buf_in_data_storage = 32'd0;
reg soc_buf_in_data_re = 1'd0;
wire soc_buf_in_wren_re;
wire soc_buf_in_wren_r;
wire soc_buf_in_wren_we;
reg soc_buf_in_wren_w = 1'd0;
wire soc_buf_in_request_status;
wire soc_buf_in_request_we;
wire soc_buf_in_ready_status;
wire soc_buf_in_ready_we;
wire soc_buf_in_commit_re;
wire soc_buf_in_commit_r;
wire soc_buf_in_commit_we;
reg soc_buf_in_commit_w = 1'd0;
reg [10:0] soc_buf_in_commit_len_storage = 11'd0;
reg soc_buf_in_commit_len_re = 1'd0;
wire soc_buf_in_commit_ack_status;
wire soc_buf_in_commit_ack_we;
reg [8:0] soc_buf_out_addr_storage = 9'd0;
reg soc_buf_out_addr_re = 1'd0;
wire [31:0] soc_buf_out_q_status;
wire soc_buf_out_q_we;
wire [10:0] soc_buf_out_len_status;
wire soc_buf_out_len_we;
wire soc_buf_out_hasdata_status;
wire soc_buf_out_hasdata_we;
wire soc_buf_out_arm_re;
wire soc_buf_out_arm_r;
wire soc_buf_out_arm_we;
reg soc_buf_out_arm_w = 1'd0;
wire soc_buf_out_arm_ack_status;
wire soc_buf_out_arm_ack_we;
wire soc_phy_pipe_pll_locked;
wire soc_phy_pipe_pll_fb;
wire soc_phy_pipe_half_clk_pll;
wire soc_phy_pipe_half_clk_phase_pll;
wire soc_phy_pipe_quarter_clk_pll;
wire soc_phy_pipe_tx_clk_phase_pll;
wire soc_phy_pipe_half_clk;
wire soc_phy_pipe_half_clk_phase;
wire soc_phy_pipe_quarter_clk;
wire soc_phy_pipe_tx_clk_phase;
(* dont_touch = "true" *) wire phy_pipe_half_clk;
wire phy_pipe_half_rst;
(* dont_touch = "true" *) wire phy_pipe_half_phase_clk;
wire phy_pipe_half_phase_rst;
(* dont_touch = "true" *) wire phy_pipe_quarter_clk;
wire phy_pipe_quarter_rst;
(* dont_touch = "true" *) wire phy_pipe_tx_phase_clk;
wire phy_pipe_tx_phase_rst;
wire [31:0] soc_phy_pipe_rx_data;
wire [3:0] soc_phy_pipe_rx_datak;
wire [1:0] soc_phy_pipe_rx_valid;
wire [31:0] soc_phy_pipe_tx_data;
wire [3:0] soc_phy_pipe_tx_datak;
wire [5:0] soc_phy_rx_status;
wire [1:0] soc_phy_phy_status;
wire [5:0] soc_dbg_pipe_state;
wire [4:0] soc_dbg_ltssm_state;
wire soc_usb_pipe_status_phy_status;
reg vns_wb2csr_state = 1'd0;
reg vns_wb2csr_next_state = 1'd0;
reg [2:0] vns_uartwishbonebridge_state = 3'd0;
reg [2:0] vns_uartwishbonebridge_next_state = 3'd0;
wire vns_pll_fb;
reg vns_liteethudpipcore_liteethmac_liteethmacgap_state = 1'd0;
reg vns_liteethudpipcore_liteethmac_liteethmacgap_next_state = 1'd0;
reg [1:0] vns_liteethudpipcore_liteethmac_liteethmacpreambleinserter_state = 2'd0;
reg [1:0] vns_liteethudpipcore_liteethmac_liteethmacpreambleinserter_next_state = 2'd0;
reg vns_liteethudpipcore_liteethmac_liteethmacpreamblechecker_state = 1'd0;
reg vns_liteethudpipcore_liteethmac_liteethmacpreamblechecker_next_state = 1'd0;
reg [1:0] vns_liteethudpipcore_liteethmac_liteethmaccrc32inserter_state = 2'd0;
reg [1:0] vns_liteethudpipcore_liteethmac_liteethmaccrc32inserter_next_state = 2'd0;
reg [1:0] vns_liteethudpipcore_liteethmac_liteethmaccrc32checker_state = 2'd0;
reg [1:0] vns_liteethudpipcore_liteethmac_liteethmaccrc32checker_next_state = 2'd0;
reg vns_liteethudpipcore_liteethmac_liteethmacpaddinginserter_state = 1'd0;
reg vns_liteethudpipcore_liteethmac_liteethmacpaddinginserter_next_state = 1'd0;
reg [1:0] vns_liteethudpipcore_liteethmac_request = 2'd0;
reg vns_liteethudpipcore_liteethmac_grant = 1'd0;
reg vns_liteethudpipcore_liteethmac_status0_first = 1'd1;
reg vns_liteethudpipcore_liteethmac_status0_last = 1'd0;
wire vns_liteethudpipcore_liteethmac_status0_ongoing0;
reg vns_liteethudpipcore_liteethmac_status0_ongoing1 = 1'd0;
reg vns_liteethudpipcore_liteethmac_status1_first = 1'd1;
reg vns_liteethudpipcore_liteethmac_status1_last = 1'd0;
wire vns_liteethudpipcore_liteethmac_status1_ongoing0;
reg vns_liteethudpipcore_liteethmac_status1_ongoing1 = 1'd0;
reg [1:0] vns_liteethudpipcore_liteethmac_sel0 = 2'd0;
reg vns_liteethudpipcore_liteethmac_first = 1'd1;
reg vns_liteethudpipcore_liteethmac_last = 1'd0;
wire vns_liteethudpipcore_liteethmac_ongoing0;
reg vns_liteethudpipcore_liteethmac_ongoing1 = 1'd0;
reg [1:0] vns_liteethudpipcore_liteethmac_sel1 = 2'd0;
reg [1:0] vns_liteethudpipcore_liteethmac_sel_ongoing = 2'd0;
reg [1:0] vns_liteethudpipcore_liteethmac_liteethmacpacketizer_state = 2'd0;
reg [1:0] vns_liteethudpipcore_liteethmac_liteethmacpacketizer_next_state = 2'd0;
reg [3:0] soc_eth_core_mac_packetizer_count_liteethmacpacketizer_next_value0 = 4'd0;
reg soc_eth_core_mac_packetizer_count_liteethmacpacketizer_next_value_ce0 = 1'd0;
reg soc_eth_core_mac_packetizer_fsm_from_idle_liteethmacpacketizer_next_value1 = 1'd0;
reg soc_eth_core_mac_packetizer_fsm_from_idle_liteethmacpacketizer_next_value_ce1 = 1'd0;
reg [1:0] vns_liteethudpipcore_liteethmac_liteethmacdepacketizer_state = 2'd0;
reg [1:0] vns_liteethudpipcore_liteethmac_liteethmacdepacketizer_next_state = 2'd0;
reg [3:0] soc_eth_core_mac_depacketizer_count_liteethmacdepacketizer_next_value0 = 4'd0;
reg soc_eth_core_mac_depacketizer_count_liteethmacdepacketizer_next_value_ce0 = 1'd0;
reg soc_eth_core_mac_depacketizer_fsm_from_idle_liteethmacdepacketizer_next_value1 = 1'd0;
reg soc_eth_core_mac_depacketizer_fsm_from_idle_liteethmacdepacketizer_next_value_ce1 = 1'd0;
reg [1:0] vns_liteethudpipcore_liteetharptx_liteetharppacketizer_state = 2'd0;
reg [1:0] vns_liteethudpipcore_liteetharptx_liteetharppacketizer_next_state = 2'd0;
reg [4:0] soc_eth_core_arp_tx_packetizer_count_liteetharptx_next_value0 = 5'd0;
reg soc_eth_core_arp_tx_packetizer_count_liteetharptx_next_value_ce0 = 1'd0;
reg soc_eth_core_arp_tx_packetizer_fsm_from_idle_liteetharptx_next_value1 = 1'd0;
reg soc_eth_core_arp_tx_packetizer_fsm_from_idle_liteetharptx_next_value_ce1 = 1'd0;
reg vns_liteethudpipcore_liteetharptx_fsm_state = 1'd0;
reg vns_liteethudpipcore_liteetharptx_fsm_next_state = 1'd0;
reg [1:0] vns_liteethudpipcore_liteetharprx_liteetharpdepacketizer_state = 2'd0;
reg [1:0] vns_liteethudpipcore_liteetharprx_liteetharpdepacketizer_next_state = 2'd0;
reg [4:0] soc_eth_core_arp_rx_depacketizer_count_liteetharprx_next_value0 = 5'd0;
reg soc_eth_core_arp_rx_depacketizer_count_liteetharprx_next_value_ce0 = 1'd0;
reg soc_eth_core_arp_rx_depacketizer_fsm_from_idle_liteetharprx_next_value1 = 1'd0;
reg soc_eth_core_arp_rx_depacketizer_fsm_from_idle_liteetharprx_next_value_ce1 = 1'd0;
reg [1:0] vns_liteethudpipcore_liteetharprx_fsm_state = 2'd0;
reg [1:0] vns_liteethudpipcore_liteetharprx_fsm_next_state = 2'd0;
reg [2:0] vns_liteethudpipcore_state = 3'd0;
reg [2:0] vns_liteethudpipcore_next_state = 3'd0;
reg [1:0] vns_liteethudpipcore_liteethip_liteethiptx_liteethipv4packetizer_state = 2'd0;
reg [1:0] vns_liteethudpipcore_liteethip_liteethiptx_liteethipv4packetizer_next_state = 2'd0;
reg [4:0] soc_eth_core_ip_tx_packetizer_count_liteethiptx_next_value0 = 5'd0;
reg soc_eth_core_ip_tx_packetizer_count_liteethiptx_next_value_ce0 = 1'd0;
reg soc_eth_core_ip_tx_packetizer_fsm_from_idle_liteethiptx_next_value1 = 1'd0;
reg soc_eth_core_ip_tx_packetizer_fsm_from_idle_liteethiptx_next_value_ce1 = 1'd0;
reg [2:0] vns_liteethudpipcore_liteethip_liteethiptx_fsm_state = 3'd0;
reg [2:0] vns_liteethudpipcore_liteethip_liteethiptx_fsm_next_state = 3'd0;
reg [1:0] vns_liteethudpipcore_liteethip_liteethiprx_liteethipv4depacketizer_state = 2'd0;
reg [1:0] vns_liteethudpipcore_liteethip_liteethiprx_liteethipv4depacketizer_next_state = 2'd0;
reg [4:0] soc_eth_core_ip_rx_depacketizer_count_liteethiprx_next_value0 = 5'd0;
reg soc_eth_core_ip_rx_depacketizer_count_liteethiprx_next_value_ce0 = 1'd0;
reg soc_eth_core_ip_rx_depacketizer_fsm_from_idle_liteethiprx_next_value1 = 1'd0;
reg soc_eth_core_ip_rx_depacketizer_fsm_from_idle_liteethiprx_next_value_ce1 = 1'd0;
reg [1:0] vns_liteethudpipcore_liteethip_liteethiprx_fsm_state = 2'd0;
reg [1:0] vns_liteethudpipcore_liteethip_liteethiprx_fsm_next_state = 2'd0;
reg [1:0] vns_liteethudpipcore_liteethip_request = 2'd0;
reg vns_liteethudpipcore_liteethip_grant = 1'd0;
reg vns_liteethudpipcore_liteethip_status0_first = 1'd1;
reg vns_liteethudpipcore_liteethip_status0_last = 1'd0;
wire vns_liteethudpipcore_liteethip_status0_ongoing0;
reg vns_liteethudpipcore_liteethip_status0_ongoing1 = 1'd0;
reg vns_liteethudpipcore_liteethip_status1_first = 1'd1;
reg vns_liteethudpipcore_liteethip_status1_last = 1'd0;
wire vns_liteethudpipcore_liteethip_status1_ongoing0;
reg vns_liteethudpipcore_liteethip_status1_ongoing1 = 1'd0;
reg [1:0] vns_liteethudpipcore_liteethip_sel0 = 2'd0;
reg vns_liteethudpipcore_liteethip_first = 1'd1;
reg vns_liteethudpipcore_liteethip_last = 1'd0;
wire vns_liteethudpipcore_liteethip_ongoing0;
reg vns_liteethudpipcore_liteethip_ongoing1 = 1'd0;
reg [1:0] vns_liteethudpipcore_liteethip_sel1 = 2'd0;
reg [1:0] vns_liteethudpipcore_liteethip_sel_ongoing = 2'd0;
reg [1:0] vns_liteethudpipcore_liteethicmptx_liteethicmppacketizer_state = 2'd0;
reg [1:0] vns_liteethudpipcore_liteethicmptx_liteethicmppacketizer_next_state = 2'd0;
reg [2:0] soc_eth_core_icmp_tx_packetizer_count_liteethicmptx_next_value0 = 3'd0;
reg soc_eth_core_icmp_tx_packetizer_count_liteethicmptx_next_value_ce0 = 1'd0;
reg soc_eth_core_icmp_tx_packetizer_fsm_from_idle_liteethicmptx_next_value1 = 1'd0;
reg soc_eth_core_icmp_tx_packetizer_fsm_from_idle_liteethicmptx_next_value_ce1 = 1'd0;
reg vns_liteethudpipcore_liteethicmptx_fsm_state = 1'd0;
reg vns_liteethudpipcore_liteethicmptx_fsm_next_state = 1'd0;
reg [1:0] vns_liteethudpipcore_liteethicmprx_liteethicmpdepacketizer_state = 2'd0;
reg [1:0] vns_liteethudpipcore_liteethicmprx_liteethicmpdepacketizer_next_state = 2'd0;
reg [2:0] soc_eth_core_icmp_rx_depacketizer_count_liteethicmprx_next_value0 = 3'd0;
reg soc_eth_core_icmp_rx_depacketizer_count_liteethicmprx_next_value_ce0 = 1'd0;
reg soc_eth_core_icmp_rx_depacketizer_fsm_from_idle_liteethicmprx_next_value1 = 1'd0;
reg soc_eth_core_icmp_rx_depacketizer_fsm_from_idle_liteethicmprx_next_value_ce1 = 1'd0;
reg [1:0] vns_liteethudpipcore_liteethicmprx_fsm_state = 2'd0;
reg [1:0] vns_liteethudpipcore_liteethicmprx_fsm_next_state = 2'd0;
reg [1:0] vns_liteethudpipcore_liteethudp_liteethudptx_liteethudppacketizer_state = 2'd0;
reg [1:0] vns_liteethudpipcore_liteethudp_liteethudptx_liteethudppacketizer_next_state = 2'd0;
reg [2:0] soc_eth_core_tx_packetizer_count_liteethudptx_next_value0 = 3'd0;
reg soc_eth_core_tx_packetizer_count_liteethudptx_next_value_ce0 = 1'd0;
reg soc_eth_core_tx_packetizer_fsm_from_idle_liteethudptx_next_value1 = 1'd0;
reg soc_eth_core_tx_packetizer_fsm_from_idle_liteethudptx_next_value_ce1 = 1'd0;
reg vns_liteethudpipcore_liteethudp_liteethudptx_fsm_state = 1'd0;
reg vns_liteethudpipcore_liteethudp_liteethudptx_fsm_next_state = 1'd0;
reg [1:0] vns_liteethudpipcore_liteethudp_liteethudprx_liteethudpdepacketizer_state = 2'd0;
reg [1:0] vns_liteethudpipcore_liteethudp_liteethudprx_liteethudpdepacketizer_next_state = 2'd0;
reg [2:0] soc_eth_core_rx_depacketizer_count_liteethudprx_next_value0 = 3'd0;
reg soc_eth_core_rx_depacketizer_count_liteethudprx_next_value_ce0 = 1'd0;
reg soc_eth_core_rx_depacketizer_fsm_from_idle_liteethudprx_next_value1 = 1'd0;
reg soc_eth_core_rx_depacketizer_fsm_from_idle_liteethudprx_next_value_ce1 = 1'd0;
reg [1:0] vns_liteethudpipcore_liteethudp_liteethudprx_fsm_state = 2'd0;
reg [1:0] vns_liteethudpipcore_liteethudp_liteethudprx_fsm_next_state = 2'd0;
reg vns_liteethudpipcore_liteethudp_sel = 1'd0;
reg [1:0] vns_liteethetherbonepackettx_liteethetherbonepacketpacketizer_state = 2'd0;
reg [1:0] vns_liteethetherbonepackettx_liteethetherbonepacketpacketizer_next_state = 2'd0;
reg soc_etherbone_tx_packetizer_count_liteethetherbonepackettx_next_value0 = 1'd0;
reg soc_etherbone_tx_packetizer_count_liteethetherbonepackettx_next_value_ce0 = 1'd0;
reg soc_etherbone_tx_packetizer_fsm_from_idle_liteethetherbonepackettx_next_value1 = 1'd0;
reg soc_etherbone_tx_packetizer_fsm_from_idle_liteethetherbonepackettx_next_value_ce1 = 1'd0;
reg vns_liteethetherbonepackettx_fsm_state = 1'd0;
reg vns_liteethetherbonepackettx_fsm_next_state = 1'd0;
reg [1:0] vns_liteethetherbonepacketrx_liteethetherbonepacketdepacketizer_state = 2'd0;
reg [1:0] vns_liteethetherbonepacketrx_liteethetherbonepacketdepacketizer_next_state = 2'd0;
reg soc_etherbone_rx_depacketizer_count_liteethetherbonepacketrx_next_value0 = 1'd0;
reg soc_etherbone_rx_depacketizer_count_liteethetherbonepacketrx_next_value_ce0 = 1'd0;
reg soc_etherbone_rx_depacketizer_fsm_from_idle_liteethetherbonepacketrx_next_value1 = 1'd0;
reg soc_etherbone_rx_depacketizer_fsm_from_idle_liteethetherbonepacketrx_next_value_ce1 = 1'd0;
reg [1:0] vns_liteethetherbonepacketrx_fsm_state = 2'd0;
reg [1:0] vns_liteethetherbonepacketrx_fsm_next_state = 2'd0;
reg vns_liteethetherboneprobe_state = 1'd0;
reg vns_liteethetherboneprobe_next_state = 1'd0;
reg [1:0] vns_liteethetherbonerecorddepacketizer_state = 2'd0;
reg [1:0] vns_liteethetherbonerecorddepacketizer_next_state = 2'd0;
reg soc_etherbone_record_depacketizer_count_liteethetherbonerecorddepacketizer_next_value0 = 1'd0;
reg soc_etherbone_record_depacketizer_count_liteethetherbonerecorddepacketizer_next_value_ce0 = 1'd0;
reg soc_etherbone_record_depacketizer_fsm_from_idle_liteethetherbonerecorddepacketizer_next_value1 = 1'd0;
reg soc_etherbone_record_depacketizer_fsm_from_idle_liteethetherbonerecorddepacketizer_next_value_ce1 = 1'd0;
reg [1:0] vns_liteethetherbonerecordreceiver_state = 2'd0;
reg [1:0] vns_liteethetherbonerecordreceiver_next_state = 2'd0;
reg [1:0] vns_liteethetherbonerecordsender_state = 2'd0;
reg [1:0] vns_liteethetherbonerecordsender_next_state = 2'd0;
reg [1:0] vns_liteethetherbonerecordpacketizer_state = 2'd0;
reg [1:0] vns_liteethetherbonerecordpacketizer_next_state = 2'd0;
reg soc_etherbone_record_packetizer_count_liteethetherbonerecordpacketizer_next_value0 = 1'd0;
reg soc_etherbone_record_packetizer_count_liteethetherbonerecordpacketizer_next_value_ce0 = 1'd0;
reg soc_etherbone_record_packetizer_fsm_from_idle_liteethetherbonerecordpacketizer_next_value1 = 1'd0;
reg soc_etherbone_record_packetizer_fsm_from_idle_liteethetherbonerecordpacketizer_next_value_ce1 = 1'd0;
reg [1:0] vns_liteethetherbonewishbonemaster_state = 2'd0;
reg [1:0] vns_liteethetherbonewishbonemaster_next_state = 2'd0;
wire [29:0] vns_shared_adr;
wire [31:0] vns_shared_dat_w;
reg [31:0] vns_shared_dat_r = 32'd0;
wire [3:0] vns_shared_sel;
wire vns_shared_cyc;
wire vns_shared_stb;
reg vns_shared_ack = 1'd0;
wire vns_shared_we;
wire [2:0] vns_shared_cti;
wire [1:0] vns_shared_bte;
wire vns_shared_err;
wire [1:0] vns_request;
reg vns_grant = 1'd0;
wire vns_slave_sel;
reg vns_slave_sel_r = 1'd0;
reg vns_error = 1'd0;
wire vns_wait;
wire vns_done;
reg [19:0] vns_count = 20'd1000000;
wire [13:0] vns_csr_bankarray_interface0_bank_bus_adr;
wire vns_csr_bankarray_interface0_bank_bus_we;
wire [7:0] vns_csr_bankarray_interface0_bank_bus_dat_w;
reg [7:0] vns_csr_bankarray_interface0_bank_bus_dat_r = 8'd0;
wire vns_csr_bankarray_csrbank0_reset0_re;
wire vns_csr_bankarray_csrbank0_reset0_r;
wire vns_csr_bankarray_csrbank0_reset0_we;
wire vns_csr_bankarray_csrbank0_reset0_w;
wire vns_csr_bankarray_csrbank0_scratch3_re;
wire [7:0] vns_csr_bankarray_csrbank0_scratch3_r;
wire vns_csr_bankarray_csrbank0_scratch3_we;
wire [7:0] vns_csr_bankarray_csrbank0_scratch3_w;
wire vns_csr_bankarray_csrbank0_scratch2_re;
wire [7:0] vns_csr_bankarray_csrbank0_scratch2_r;
wire vns_csr_bankarray_csrbank0_scratch2_we;
wire [7:0] vns_csr_bankarray_csrbank0_scratch2_w;
wire vns_csr_bankarray_csrbank0_scratch1_re;
wire [7:0] vns_csr_bankarray_csrbank0_scratch1_r;
wire vns_csr_bankarray_csrbank0_scratch1_we;
wire [7:0] vns_csr_bankarray_csrbank0_scratch1_w;
wire vns_csr_bankarray_csrbank0_scratch0_re;
wire [7:0] vns_csr_bankarray_csrbank0_scratch0_r;
wire vns_csr_bankarray_csrbank0_scratch0_we;
wire [7:0] vns_csr_bankarray_csrbank0_scratch0_w;
wire vns_csr_bankarray_csrbank0_bus_errors3_re;
wire [7:0] vns_csr_bankarray_csrbank0_bus_errors3_r;
wire vns_csr_bankarray_csrbank0_bus_errors3_we;
wire [7:0] vns_csr_bankarray_csrbank0_bus_errors3_w;
wire vns_csr_bankarray_csrbank0_bus_errors2_re;
wire [7:0] vns_csr_bankarray_csrbank0_bus_errors2_r;
wire vns_csr_bankarray_csrbank0_bus_errors2_we;
wire [7:0] vns_csr_bankarray_csrbank0_bus_errors2_w;
wire vns_csr_bankarray_csrbank0_bus_errors1_re;
wire [7:0] vns_csr_bankarray_csrbank0_bus_errors1_r;
wire vns_csr_bankarray_csrbank0_bus_errors1_we;
wire [7:0] vns_csr_bankarray_csrbank0_bus_errors1_w;
wire vns_csr_bankarray_csrbank0_bus_errors0_re;
wire [7:0] vns_csr_bankarray_csrbank0_bus_errors0_r;
wire vns_csr_bankarray_csrbank0_bus_errors0_we;
wire [7:0] vns_csr_bankarray_csrbank0_bus_errors0_w;
wire vns_csr_bankarray_csrbank0_sel;
wire [13:0] vns_csr_bankarray_interface1_bank_bus_adr;
wire vns_csr_bankarray_interface1_bank_bus_we;
wire [7:0] vns_csr_bankarray_interface1_bank_bus_dat_w;
reg [7:0] vns_csr_bankarray_interface1_bank_bus_dat_r = 8'd0;
wire vns_csr_bankarray_csrbank1_crg_reset0_re;
wire vns_csr_bankarray_csrbank1_crg_reset0_r;
wire vns_csr_bankarray_csrbank1_crg_reset0_we;
wire vns_csr_bankarray_csrbank1_crg_reset0_w;
wire vns_csr_bankarray_csrbank1_mdio_w0_re;
wire [2:0] vns_csr_bankarray_csrbank1_mdio_w0_r;
wire vns_csr_bankarray_csrbank1_mdio_w0_we;
wire [2:0] vns_csr_bankarray_csrbank1_mdio_w0_w;
wire vns_csr_bankarray_csrbank1_mdio_r_re;
wire vns_csr_bankarray_csrbank1_mdio_r_r;
wire vns_csr_bankarray_csrbank1_mdio_r_we;
wire vns_csr_bankarray_csrbank1_mdio_r_w;
wire vns_csr_bankarray_csrbank1_sel;
wire [13:0] vns_csr_bankarray_sram_bus_adr;
wire vns_csr_bankarray_sram_bus_we;
wire [7:0] vns_csr_bankarray_sram_bus_dat_w;
reg [7:0] vns_csr_bankarray_sram_bus_dat_r = 8'd0;
wire [5:0] vns_csr_bankarray_adr;
wire [7:0] vns_csr_bankarray_dat_r;
wire vns_csr_bankarray_sel;
reg vns_csr_bankarray_sel_r = 1'd0;
wire [13:0] vns_csr_bankarray_interface2_bank_bus_adr;
wire vns_csr_bankarray_interface2_bank_bus_we;
wire [7:0] vns_csr_bankarray_interface2_bank_bus_dat_w;
reg [7:0] vns_csr_bankarray_interface2_bank_bus_dat_r = 8'd0;
wire vns_csr_bankarray_csrbank2_phy_enable0_re;
wire vns_csr_bankarray_csrbank2_phy_enable0_r;
wire vns_csr_bankarray_csrbank2_phy_enable0_we;
wire vns_csr_bankarray_csrbank2_phy_enable0_w;
wire vns_csr_bankarray_csrbank2_core_enable0_re;
wire vns_csr_bankarray_csrbank2_core_enable0_r;
wire vns_csr_bankarray_csrbank2_core_enable0_we;
wire vns_csr_bankarray_csrbank2_core_enable0_w;
wire vns_csr_bankarray_csrbank2_buf_in_addr1_re;
wire vns_csr_bankarray_csrbank2_buf_in_addr1_r;
wire vns_csr_bankarray_csrbank2_buf_in_addr1_we;
wire vns_csr_bankarray_csrbank2_buf_in_addr1_w;
wire vns_csr_bankarray_csrbank2_buf_in_addr0_re;
wire [7:0] vns_csr_bankarray_csrbank2_buf_in_addr0_r;
wire vns_csr_bankarray_csrbank2_buf_in_addr0_we;
wire [7:0] vns_csr_bankarray_csrbank2_buf_in_addr0_w;
wire vns_csr_bankarray_csrbank2_buf_in_data3_re;
wire [7:0] vns_csr_bankarray_csrbank2_buf_in_data3_r;
wire vns_csr_bankarray_csrbank2_buf_in_data3_we;
wire [7:0] vns_csr_bankarray_csrbank2_buf_in_data3_w;
wire vns_csr_bankarray_csrbank2_buf_in_data2_re;
wire [7:0] vns_csr_bankarray_csrbank2_buf_in_data2_r;
wire vns_csr_bankarray_csrbank2_buf_in_data2_we;
wire [7:0] vns_csr_bankarray_csrbank2_buf_in_data2_w;
wire vns_csr_bankarray_csrbank2_buf_in_data1_re;
wire [7:0] vns_csr_bankarray_csrbank2_buf_in_data1_r;
wire vns_csr_bankarray_csrbank2_buf_in_data1_we;
wire [7:0] vns_csr_bankarray_csrbank2_buf_in_data1_w;
wire vns_csr_bankarray_csrbank2_buf_in_data0_re;
wire [7:0] vns_csr_bankarray_csrbank2_buf_in_data0_r;
wire vns_csr_bankarray_csrbank2_buf_in_data0_we;
wire [7:0] vns_csr_bankarray_csrbank2_buf_in_data0_w;
wire vns_csr_bankarray_csrbank2_buf_in_request_re;
wire vns_csr_bankarray_csrbank2_buf_in_request_r;
wire vns_csr_bankarray_csrbank2_buf_in_request_we;
wire vns_csr_bankarray_csrbank2_buf_in_request_w;
wire vns_csr_bankarray_csrbank2_buf_in_ready_re;
wire vns_csr_bankarray_csrbank2_buf_in_ready_r;
wire vns_csr_bankarray_csrbank2_buf_in_ready_we;
wire vns_csr_bankarray_csrbank2_buf_in_ready_w;
wire vns_csr_bankarray_csrbank2_buf_in_commit_len1_re;
wire [2:0] vns_csr_bankarray_csrbank2_buf_in_commit_len1_r;
wire vns_csr_bankarray_csrbank2_buf_in_commit_len1_we;
wire [2:0] vns_csr_bankarray_csrbank2_buf_in_commit_len1_w;
wire vns_csr_bankarray_csrbank2_buf_in_commit_len0_re;
wire [7:0] vns_csr_bankarray_csrbank2_buf_in_commit_len0_r;
wire vns_csr_bankarray_csrbank2_buf_in_commit_len0_we;
wire [7:0] vns_csr_bankarray_csrbank2_buf_in_commit_len0_w;
wire vns_csr_bankarray_csrbank2_buf_in_commit_ack_re;
wire vns_csr_bankarray_csrbank2_buf_in_commit_ack_r;
wire vns_csr_bankarray_csrbank2_buf_in_commit_ack_we;
wire vns_csr_bankarray_csrbank2_buf_in_commit_ack_w;
wire vns_csr_bankarray_csrbank2_buf_out_addr1_re;
wire vns_csr_bankarray_csrbank2_buf_out_addr1_r;
wire vns_csr_bankarray_csrbank2_buf_out_addr1_we;
wire vns_csr_bankarray_csrbank2_buf_out_addr1_w;
wire vns_csr_bankarray_csrbank2_buf_out_addr0_re;
wire [7:0] vns_csr_bankarray_csrbank2_buf_out_addr0_r;
wire vns_csr_bankarray_csrbank2_buf_out_addr0_we;
wire [7:0] vns_csr_bankarray_csrbank2_buf_out_addr0_w;
wire vns_csr_bankarray_csrbank2_buf_out_q3_re;
wire [7:0] vns_csr_bankarray_csrbank2_buf_out_q3_r;
wire vns_csr_bankarray_csrbank2_buf_out_q3_we;
wire [7:0] vns_csr_bankarray_csrbank2_buf_out_q3_w;
wire vns_csr_bankarray_csrbank2_buf_out_q2_re;
wire [7:0] vns_csr_bankarray_csrbank2_buf_out_q2_r;
wire vns_csr_bankarray_csrbank2_buf_out_q2_we;
wire [7:0] vns_csr_bankarray_csrbank2_buf_out_q2_w;
wire vns_csr_bankarray_csrbank2_buf_out_q1_re;
wire [7:0] vns_csr_bankarray_csrbank2_buf_out_q1_r;
wire vns_csr_bankarray_csrbank2_buf_out_q1_we;
wire [7:0] vns_csr_bankarray_csrbank2_buf_out_q1_w;
wire vns_csr_bankarray_csrbank2_buf_out_q0_re;
wire [7:0] vns_csr_bankarray_csrbank2_buf_out_q0_r;
wire vns_csr_bankarray_csrbank2_buf_out_q0_we;
wire [7:0] vns_csr_bankarray_csrbank2_buf_out_q0_w;
wire vns_csr_bankarray_csrbank2_buf_out_len1_re;
wire [2:0] vns_csr_bankarray_csrbank2_buf_out_len1_r;
wire vns_csr_bankarray_csrbank2_buf_out_len1_we;
wire [2:0] vns_csr_bankarray_csrbank2_buf_out_len1_w;
wire vns_csr_bankarray_csrbank2_buf_out_len0_re;
wire [7:0] vns_csr_bankarray_csrbank2_buf_out_len0_r;
wire vns_csr_bankarray_csrbank2_buf_out_len0_we;
wire [7:0] vns_csr_bankarray_csrbank2_buf_out_len0_w;
wire vns_csr_bankarray_csrbank2_buf_out_hasdata_re;
wire vns_csr_bankarray_csrbank2_buf_out_hasdata_r;
wire vns_csr_bankarray_csrbank2_buf_out_hasdata_we;
wire vns_csr_bankarray_csrbank2_buf_out_hasdata_w;
wire vns_csr_bankarray_csrbank2_buf_out_arm_ack_re;
wire vns_csr_bankarray_csrbank2_buf_out_arm_ack_r;
wire vns_csr_bankarray_csrbank2_buf_out_arm_ack_we;
wire vns_csr_bankarray_csrbank2_buf_out_arm_ack_w;
wire vns_csr_bankarray_csrbank2_sel;
wire [13:0] vns_csr_interconnect_adr;
wire vns_csr_interconnect_we;
wire [7:0] vns_csr_interconnect_dat_w;
wire [7:0] vns_csr_interconnect_dat_r;
wire [15:0] vns_slice_proxy0;
wire [15:0] vns_slice_proxy1;
wire [47:0] vns_slice_proxy2;
wire [47:0] vns_slice_proxy3;
wire [47:0] vns_slice_proxy4;
wire [47:0] vns_slice_proxy5;
wire [47:0] vns_slice_proxy6;
wire [47:0] vns_slice_proxy7;
wire [47:0] vns_slice_proxy8;
wire [47:0] vns_slice_proxy9;
wire [47:0] vns_slice_proxy10;
wire [47:0] vns_slice_proxy11;
wire [47:0] vns_slice_proxy12;
wire [47:0] vns_slice_proxy13;
wire [7:0] vns_slice_proxy14;
wire [15:0] vns_slice_proxy15;
wire [15:0] vns_slice_proxy16;
wire [15:0] vns_slice_proxy17;
wire [15:0] vns_slice_proxy18;
wire [15:0] vns_slice_proxy19;
wire [15:0] vns_slice_proxy20;
wire [7:0] vns_slice_proxy21;
wire [31:0] vns_slice_proxy22;
wire [31:0] vns_slice_proxy23;
wire [31:0] vns_slice_proxy24;
wire [31:0] vns_slice_proxy25;
wire [47:0] vns_slice_proxy26;
wire [47:0] vns_slice_proxy27;
wire [47:0] vns_slice_proxy28;
wire [47:0] vns_slice_proxy29;
wire [47:0] vns_slice_proxy30;
wire [47:0] vns_slice_proxy31;
wire [31:0] vns_slice_proxy32;
wire [31:0] vns_slice_proxy33;
wire [31:0] vns_slice_proxy34;
wire [31:0] vns_slice_proxy35;
wire [47:0] vns_slice_proxy36;
wire [47:0] vns_slice_proxy37;
wire [47:0] vns_slice_proxy38;
wire [47:0] vns_slice_proxy39;
wire [47:0] vns_slice_proxy40;
wire [47:0] vns_slice_proxy41;
wire [15:0] vns_slice_proxy42;
wire [15:0] vns_slice_proxy43;
wire [15:0] vns_slice_proxy44;
wire [15:0] vns_slice_proxy45;
wire [3:0] vns_slice_proxy46;
wire [7:0] vns_slice_proxy47;
wire [31:0] vns_slice_proxy48;
wire [31:0] vns_slice_proxy49;
wire [31:0] vns_slice_proxy50;
wire [31:0] vns_slice_proxy51;
wire [31:0] vns_slice_proxy52;
wire [31:0] vns_slice_proxy53;
wire [31:0] vns_slice_proxy54;
wire [31:0] vns_slice_proxy55;
wire [15:0] vns_slice_proxy56;
wire [15:0] vns_slice_proxy57;
wire [7:0] vns_slice_proxy58;
wire [3:0] vns_slice_proxy59;
wire [15:0] vns_slice_proxy60;
wire [15:0] vns_slice_proxy61;
wire [7:0] vns_slice_proxy62;
wire [7:0] vns_slice_proxy63;
wire [31:0] vns_slice_proxy64;
wire [31:0] vns_slice_proxy65;
wire [31:0] vns_slice_proxy66;
wire [31:0] vns_slice_proxy67;
wire [15:0] vns_slice_proxy68;
wire [15:0] vns_slice_proxy69;
wire [15:0] vns_slice_proxy70;
wire [15:0] vns_slice_proxy71;
wire [15:0] vns_slice_proxy72;
wire [15:0] vns_slice_proxy73;
wire [15:0] vns_slice_proxy74;
wire [15:0] vns_slice_proxy75;
wire [3:0] vns_slice_proxy76;
wire [15:0] vns_slice_proxy77;
wire [15:0] vns_slice_proxy78;
wire vns_slice_proxy79;
wire vns_slice_proxy80;
wire [3:0] vns_slice_proxy81;
wire vns_slice_proxy82;
wire [3:0] vns_slice_proxy83;
wire vns_slice_proxy84;
wire [7:0] vns_slice_proxy85;
wire vns_slice_proxy86;
wire vns_slice_proxy87;
wire [7:0] vns_slice_proxy88;
wire vns_slice_proxy89;
wire vns_slice_proxy90;
wire [7:0] vns_slice_proxy91;
wire vns_slice_proxy92;
reg [29:0] vns_array_muxed0 = 30'd0;
reg [31:0] vns_array_muxed1 = 32'd0;
reg [3:0] vns_array_muxed2 = 4'd0;
reg vns_array_muxed3 = 1'd0;
reg vns_array_muxed4 = 1'd0;
reg vns_array_muxed5 = 1'd0;
reg [2:0] vns_array_muxed6 = 3'd0;
reg [1:0] vns_array_muxed7 = 2'd0;
wire vns_xilinxasyncresetsynchronizerimpl0;
wire vns_xilinxasyncresetsynchronizerimpl0_rst_meta;
wire vns_xilinxasyncresetsynchronizerimpl1;
wire vns_xilinxasyncresetsynchronizerimpl1_rst_meta;
(* async_reg = "true", mr_ff = "true", dont_touch = "true" *) reg vns_xilinxmultiregimpl0_regs0 = 1'd0;
(* async_reg = "true", dont_touch = "true" *) reg vns_xilinxmultiregimpl0_regs1 = 1'd0;
wire vns_xilinxasyncresetsynchronizerimpl2;
wire vns_xilinxasyncresetsynchronizerimpl2_rst_meta;
wire vns_xilinxasyncresetsynchronizerimpl2_expr;
wire vns_xilinxasyncresetsynchronizerimpl3_rst_meta;
wire vns_xilinxasyncresetsynchronizerimpl4_rst_meta;
(* async_reg = "true", mr_ff = "true", dont_touch = "true" *) reg vns_xilinxmultiregimpl1_regs0 = 1'd0;
(* async_reg = "true", dont_touch = "true" *) reg vns_xilinxmultiregimpl1_regs1 = 1'd0;
(* async_reg = "true", mr_ff = "true", dont_touch = "true" *) reg vns_xilinxmultiregimpl2_regs0 = 1'd0;
(* async_reg = "true", dont_touch = "true" *) reg vns_xilinxmultiregimpl2_regs1 = 1'd0;
(* async_reg = "true", mr_ff = "true", dont_touch = "true" *) reg vns_xilinxmultiregimpl3_regs0 = 1'd0;
(* async_reg = "true", dont_touch = "true" *) reg vns_xilinxmultiregimpl3_regs1 = 1'd0;
(* async_reg = "true", mr_ff = "true", dont_touch = "true" *) reg [6:0] vns_xilinxmultiregimpl4_regs0 = 7'd0;
(* async_reg = "true", dont_touch = "true" *) reg [6:0] vns_xilinxmultiregimpl4_regs1 = 7'd0;
(* async_reg = "true", mr_ff = "true", dont_touch = "true" *) reg [6:0] vns_xilinxmultiregimpl5_regs0 = 7'd0;
(* async_reg = "true", dont_touch = "true" *) reg [6:0] vns_xilinxmultiregimpl5_regs1 = 7'd0;
(* async_reg = "true", mr_ff = "true", dont_touch = "true" *) reg [6:0] vns_xilinxmultiregimpl6_regs0 = 7'd0;
(* async_reg = "true", dont_touch = "true" *) reg [6:0] vns_xilinxmultiregimpl6_regs1 = 7'd0;
(* async_reg = "true", mr_ff = "true", dont_touch = "true" *) reg [6:0] vns_xilinxmultiregimpl7_regs0 = 7'd0;
(* async_reg = "true", dont_touch = "true" *) reg [6:0] vns_xilinxmultiregimpl7_regs1 = 7'd0;
wire vns_xilinxasyncresetsynchronizerimpl5;
wire vns_xilinxasyncresetsynchronizerimpl5_rst_meta;
wire vns_xilinxasyncresetsynchronizerimpl6;
wire vns_xilinxasyncresetsynchronizerimpl6_rst_meta;
wire vns_xilinxasyncresetsynchronizerimpl7;
wire vns_xilinxasyncresetsynchronizerimpl7_rst_meta;
wire vns_xilinxasyncresetsynchronizerimpl8;
wire vns_xilinxasyncresetsynchronizerimpl8_rst_meta;
assign vadj = 2'd2;
assign usb_reset_n0 = soc_usb3_reset_n;
assign phy_pipe_half_clk = soc_phy_pipe_half_clk;
assign phy_pipe_half_phase_clk = soc_phy_pipe_half_clk_phase;
assign phy_pipe_quarter_clk = soc_phy_pipe_quarter_clk;
assign phy_pipe_tx_phase_clk = soc_phy_pipe_tx_clk_phase;
assign soc_usb3_reset_n = (soc_phy_enable_storage | user_sw0);
assign soc_usbsoc_bus_error = vns_error;
assign soc_usbsoc_reset = soc_usbsoc_reset_re;
assign soc_usbsoc_bus_errors_status = soc_usbsoc_bus_errors;
assign soc_usbsoc_dat_w = soc_usbsoc_bus_wishbone_dat_w;
assign soc_usbsoc_bus_wishbone_dat_r = soc_usbsoc_dat_r;
always @(*) begin
	soc_usbsoc_bus_wishbone_ack <= 1'd0;
	vns_wb2csr_next_state <= 1'd0;
	soc_usbsoc_adr <= 14'd0;
	soc_usbsoc_we <= 1'd0;
	vns_wb2csr_next_state <= vns_wb2csr_state;
	case (vns_wb2csr_state)
		1'd1: begin
			soc_usbsoc_bus_wishbone_ack <= 1'd1;
			vns_wb2csr_next_state <= 1'd0;
		end
		default: begin
			if ((soc_usbsoc_bus_wishbone_cyc & soc_usbsoc_bus_wishbone_stb)) begin
				soc_usbsoc_adr <= soc_usbsoc_bus_wishbone_adr;
				soc_usbsoc_we <= soc_usbsoc_bus_wishbone_we;
				vns_wb2csr_next_state <= 1'd1;
			end
		end
	endcase
end
assign soc_uart_bridge_reset = soc_uart_bridge_done;
assign soc_uart_bridge_source_ready = 1'd1;
assign soc_uart_bridge_wishbone_adr = (soc_uart_bridge_address + soc_uart_bridge_word_counter);
assign soc_uart_bridge_wishbone_dat_w = soc_uart_bridge_data;
assign soc_uart_bridge_wishbone_sel = 4'd15;
always @(*) begin
	soc_uart_bridge_sink_payload_data <= 8'd0;
	case (soc_uart_bridge_byte_counter)
		1'd0: begin
			soc_uart_bridge_sink_payload_data <= soc_uart_bridge_data[31:24];
		end
		1'd1: begin
			soc_uart_bridge_sink_payload_data <= soc_uart_bridge_data[23:16];
		end
		2'd2: begin
			soc_uart_bridge_sink_payload_data <= soc_uart_bridge_data[15:8];
		end
		default: begin
			soc_uart_bridge_sink_payload_data <= soc_uart_bridge_data[7:0];
		end
	endcase
end
assign soc_uart_bridge_wait = (~soc_uart_bridge_is_ongoing);
assign soc_uart_bridge_sink_last = ((soc_uart_bridge_byte_counter == 2'd3) & (soc_uart_bridge_word_counter == (soc_uart_bridge_length - 1'd1)));
always @(*) begin
	soc_uart_bridge_wishbone_we <= 1'd0;
	soc_uart_bridge_address_ce <= 1'd0;
	soc_uart_bridge_rx_data_ce <= 1'd0;
	soc_uart_bridge_byte_counter_reset <= 1'd0;
	soc_uart_bridge_tx_data_ce <= 1'd0;
	soc_uart_bridge_byte_counter_ce <= 1'd0;
	soc_uart_bridge_wishbone_stb <= 1'd0;
	soc_uart_bridge_word_counter_reset <= 1'd0;
	vns_uartwishbonebridge_next_state <= 3'd0;
	soc_uart_bridge_is_ongoing <= 1'd0;
	soc_uart_bridge_word_counter_ce <= 1'd0;
	soc_uart_bridge_sink_valid <= 1'd0;
	soc_uart_bridge_wishbone_cyc <= 1'd0;
	soc_uart_bridge_cmd_ce <= 1'd0;
	soc_uart_bridge_length_ce <= 1'd0;
	vns_uartwishbonebridge_next_state <= vns_uartwishbonebridge_state;
	case (vns_uartwishbonebridge_state)
		1'd1: begin
			if (soc_uart_bridge_source_valid) begin
				soc_uart_bridge_length_ce <= 1'd1;
				vns_uartwishbonebridge_next_state <= 2'd2;
			end
		end
		2'd2: begin
			if (soc_uart_bridge_source_valid) begin
				soc_uart_bridge_address_ce <= 1'd1;
				soc_uart_bridge_byte_counter_ce <= 1'd1;
				if ((soc_uart_bridge_byte_counter == 2'd3)) begin
					if ((soc_uart_bridge_cmd == 1'd1)) begin
						vns_uartwishbonebridge_next_state <= 2'd3;
					end else begin
						if ((soc_uart_bridge_cmd == 2'd2)) begin
							vns_uartwishbonebridge_next_state <= 3'd5;
						end
					end
					soc_uart_bridge_byte_counter_reset <= 1'd1;
				end
			end
		end
		2'd3: begin
			if (soc_uart_bridge_source_valid) begin
				soc_uart_bridge_rx_data_ce <= 1'd1;
				soc_uart_bridge_byte_counter_ce <= 1'd1;
				if ((soc_uart_bridge_byte_counter == 2'd3)) begin
					vns_uartwishbonebridge_next_state <= 3'd4;
					soc_uart_bridge_byte_counter_reset <= 1'd1;
				end
			end
		end
		3'd4: begin
			soc_uart_bridge_wishbone_stb <= 1'd1;
			soc_uart_bridge_wishbone_we <= 1'd1;
			soc_uart_bridge_wishbone_cyc <= 1'd1;
			if (soc_uart_bridge_wishbone_ack) begin
				soc_uart_bridge_word_counter_ce <= 1'd1;
				if ((soc_uart_bridge_word_counter == (soc_uart_bridge_length - 1'd1))) begin
					vns_uartwishbonebridge_next_state <= 1'd0;
				end else begin
					vns_uartwishbonebridge_next_state <= 2'd3;
				end
			end
		end
		3'd5: begin
			soc_uart_bridge_wishbone_stb <= 1'd1;
			soc_uart_bridge_wishbone_we <= 1'd0;
			soc_uart_bridge_wishbone_cyc <= 1'd1;
			if (soc_uart_bridge_wishbone_ack) begin
				soc_uart_bridge_tx_data_ce <= 1'd1;
				vns_uartwishbonebridge_next_state <= 3'd6;
			end
		end
		3'd6: begin
			soc_uart_bridge_sink_valid <= 1'd1;
			if (soc_uart_bridge_sink_ready) begin
				soc_uart_bridge_byte_counter_ce <= 1'd1;
				if ((soc_uart_bridge_byte_counter == 2'd3)) begin
					soc_uart_bridge_word_counter_ce <= 1'd1;
					if ((soc_uart_bridge_word_counter == (soc_uart_bridge_length - 1'd1))) begin
						vns_uartwishbonebridge_next_state <= 1'd0;
					end else begin
						vns_uartwishbonebridge_next_state <= 3'd5;
						soc_uart_bridge_byte_counter_reset <= 1'd1;
					end
				end
			end
		end
		default: begin
			if (soc_uart_bridge_source_valid) begin
				soc_uart_bridge_cmd_ce <= 1'd1;
				if (((soc_uart_bridge_source_payload_data == 1'd1) | (soc_uart_bridge_source_payload_data == 2'd2))) begin
					vns_uartwishbonebridge_next_state <= 1'd1;
				end
				soc_uart_bridge_byte_counter_reset <= 1'd1;
				soc_uart_bridge_word_counter_reset <= 1'd1;
			end
			soc_uart_bridge_is_ongoing <= 1'd1;
		end
	endcase
end
assign soc_uart_bridge_done = (soc_uart_bridge_count == 1'd0);
assign soc_eth_phy_reset = (soc_eth_phy_reset_storage | soc_eth_phy_hw_reset_reset);
assign eth_rst_n = (~soc_eth_phy_reset);
assign soc_eth_phy_clkin = eth_rx_clk;
assign eth_tx_clk = soc_eth_phy_clkout_buf0;
assign eth_tx_delayed_clk = soc_eth_phy_clkout_buf1;
assign soc_eth_phy_hw_reset_counter_done = (soc_eth_phy_hw_reset_counter == 9'd256);
assign soc_eth_phy_hw_reset_counter_ce = (~soc_eth_phy_hw_reset_counter_done);
assign soc_eth_phy_hw_reset_reset = (~soc_eth_phy_hw_reset_counter_done);
assign soc_eth_phy_sink_ready = 1'd1;
assign soc_eth_phy_liteethphyrgmiirx_last = ((~soc_eth_phy_liteethphyrgmiirx_rx_ctl) & soc_eth_phy_liteethphyrgmiirx_rx_ctl_d);
assign soc_eth_phy_liteethphyrgmiirx_source_last = soc_eth_phy_liteethphyrgmiirx_last;
assign eth_mdc = soc_eth_phy_storage[0];
assign soc_eth_phy_data_oe = soc_eth_phy_storage[1];
assign soc_eth_phy_data_w = soc_eth_phy_storage[2];
assign soc_eth_core_mac_packetizer_sink_valid = soc_eth_core_mac_crossbar_source_valid;
assign soc_eth_core_mac_crossbar_source_ready = soc_eth_core_mac_packetizer_sink_ready;
assign soc_eth_core_mac_packetizer_sink_first = soc_eth_core_mac_crossbar_source_first;
assign soc_eth_core_mac_packetizer_sink_last = soc_eth_core_mac_crossbar_source_last;
assign soc_eth_core_mac_packetizer_sink_payload_ethernet_type = soc_eth_core_mac_crossbar_source_payload_ethernet_type;
assign soc_eth_core_mac_packetizer_sink_payload_sender_mac = soc_eth_core_mac_crossbar_source_payload_sender_mac;
assign soc_eth_core_mac_packetizer_sink_payload_target_mac = soc_eth_core_mac_crossbar_source_payload_target_mac;
assign soc_eth_core_mac_packetizer_sink_payload_data = soc_eth_core_mac_crossbar_source_payload_data;
assign soc_eth_core_mac_packetizer_sink_payload_last_be = soc_eth_core_mac_crossbar_source_payload_last_be;
assign soc_eth_core_mac_packetizer_sink_payload_error = soc_eth_core_mac_crossbar_source_payload_error;
assign soc_eth_core_mac_tx_cdc_sink_valid = soc_eth_core_mac_packetizer_source_valid;
assign soc_eth_core_mac_packetizer_source_ready = soc_eth_core_mac_tx_cdc_sink_ready;
assign soc_eth_core_mac_tx_cdc_sink_first = soc_eth_core_mac_packetizer_source_first;
assign soc_eth_core_mac_tx_cdc_sink_last = soc_eth_core_mac_packetizer_source_last;
assign soc_eth_core_mac_tx_cdc_sink_payload_data = soc_eth_core_mac_packetizer_source_payload_data;
assign soc_eth_core_mac_tx_cdc_sink_payload_last_be = soc_eth_core_mac_packetizer_source_payload_last_be;
assign soc_eth_core_mac_tx_cdc_sink_payload_error = soc_eth_core_mac_packetizer_source_payload_error;
assign soc_eth_core_mac_depacketizer_sink_valid = soc_eth_core_mac_rx_cdc_source_valid;
assign soc_eth_core_mac_rx_cdc_source_ready = soc_eth_core_mac_depacketizer_sink_ready;
assign soc_eth_core_mac_depacketizer_sink_first = soc_eth_core_mac_rx_cdc_source_first;
assign soc_eth_core_mac_depacketizer_sink_last = soc_eth_core_mac_rx_cdc_source_last;
assign soc_eth_core_mac_depacketizer_sink_payload_data = soc_eth_core_mac_rx_cdc_source_payload_data;
assign soc_eth_core_mac_depacketizer_sink_payload_last_be = soc_eth_core_mac_rx_cdc_source_payload_last_be;
assign soc_eth_core_mac_depacketizer_sink_payload_error = soc_eth_core_mac_rx_cdc_source_payload_error;
assign soc_eth_core_mac_crossbar_sink_valid = soc_eth_core_mac_depacketizer_source_valid;
assign soc_eth_core_mac_depacketizer_source_ready = soc_eth_core_mac_crossbar_sink_ready;
assign soc_eth_core_mac_crossbar_sink_first = soc_eth_core_mac_depacketizer_source_first;
assign soc_eth_core_mac_crossbar_sink_last = soc_eth_core_mac_depacketizer_source_last;
assign soc_eth_core_mac_crossbar_sink_payload_ethernet_type = soc_eth_core_mac_depacketizer_source_payload_ethernet_type;
assign soc_eth_core_mac_crossbar_sink_payload_sender_mac = soc_eth_core_mac_depacketizer_source_payload_sender_mac;
assign soc_eth_core_mac_crossbar_sink_payload_target_mac = soc_eth_core_mac_depacketizer_source_payload_target_mac;
assign soc_eth_core_mac_crossbar_sink_payload_data = soc_eth_core_mac_depacketizer_source_payload_data;
assign soc_eth_core_mac_crossbar_sink_payload_last_be = soc_eth_core_mac_depacketizer_source_payload_last_be;
assign soc_eth_core_mac_crossbar_sink_payload_error = soc_eth_core_mac_depacketizer_source_payload_error;
assign soc_eth_core_mac_ps_preamble_error_i = soc_eth_core_mac_preamble_checker_error;
assign soc_eth_core_mac_ps_crc_error_i = soc_eth_core_mac_crc32_checker_error;
always @(*) begin
	soc_eth_core_mac_tx_gap_inserter_source_valid <= 1'd0;
	soc_eth_core_mac_tx_gap_inserter_source_first <= 1'd0;
	soc_eth_core_mac_tx_gap_inserter_source_last <= 1'd0;
	soc_eth_core_mac_tx_gap_inserter_source_payload_data <= 8'd0;
	soc_eth_core_mac_tx_gap_inserter_source_payload_last_be <= 1'd0;
	soc_eth_core_mac_tx_gap_inserter_source_payload_error <= 1'd0;
	soc_eth_core_mac_tx_gap_inserter_counter_reset <= 1'd0;
	soc_eth_core_mac_tx_gap_inserter_counter_ce <= 1'd0;
	soc_eth_core_mac_tx_gap_inserter_sink_ready <= 1'd0;
	vns_liteethudpipcore_liteethmac_liteethmacgap_next_state <= 1'd0;
	vns_liteethudpipcore_liteethmac_liteethmacgap_next_state <= vns_liteethudpipcore_liteethmac_liteethmacgap_state;
	case (vns_liteethudpipcore_liteethmac_liteethmacgap_state)
		1'd1: begin
			soc_eth_core_mac_tx_gap_inserter_counter_ce <= 1'd1;
			if ((soc_eth_core_mac_tx_gap_inserter_counter == 4'd11)) begin
				vns_liteethudpipcore_liteethmac_liteethmacgap_next_state <= 1'd0;
			end
		end
		default: begin
			soc_eth_core_mac_tx_gap_inserter_counter_reset <= 1'd1;
			soc_eth_core_mac_tx_gap_inserter_source_valid <= soc_eth_core_mac_tx_gap_inserter_sink_valid;
			soc_eth_core_mac_tx_gap_inserter_sink_ready <= soc_eth_core_mac_tx_gap_inserter_source_ready;
			soc_eth_core_mac_tx_gap_inserter_source_first <= soc_eth_core_mac_tx_gap_inserter_sink_first;
			soc_eth_core_mac_tx_gap_inserter_source_last <= soc_eth_core_mac_tx_gap_inserter_sink_last;
			soc_eth_core_mac_tx_gap_inserter_source_payload_data <= soc_eth_core_mac_tx_gap_inserter_sink_payload_data;
			soc_eth_core_mac_tx_gap_inserter_source_payload_last_be <= soc_eth_core_mac_tx_gap_inserter_sink_payload_last_be;
			soc_eth_core_mac_tx_gap_inserter_source_payload_error <= soc_eth_core_mac_tx_gap_inserter_sink_payload_error;
			if (((soc_eth_core_mac_tx_gap_inserter_sink_valid & soc_eth_core_mac_tx_gap_inserter_sink_last) & soc_eth_core_mac_tx_gap_inserter_sink_ready)) begin
				vns_liteethudpipcore_liteethmac_liteethmacgap_next_state <= 1'd1;
			end
		end
	endcase
end
assign soc_eth_core_mac_preamble_inserter_source_payload_last_be = soc_eth_core_mac_preamble_inserter_sink_payload_last_be;
always @(*) begin
	soc_eth_core_mac_preamble_inserter_source_valid <= 1'd0;
	soc_eth_core_mac_preamble_inserter_source_first <= 1'd0;
	soc_eth_core_mac_preamble_inserter_source_last <= 1'd0;
	soc_eth_core_mac_preamble_inserter_source_payload_data <= 8'd0;
	soc_eth_core_mac_preamble_inserter_inc_cnt <= 1'd0;
	vns_liteethudpipcore_liteethmac_liteethmacpreambleinserter_next_state <= 2'd0;
	soc_eth_core_mac_preamble_inserter_source_payload_error <= 1'd0;
	soc_eth_core_mac_preamble_inserter_clr_cnt <= 1'd0;
	soc_eth_core_mac_preamble_inserter_sink_ready <= 1'd0;
	soc_eth_core_mac_preamble_inserter_source_payload_data <= soc_eth_core_mac_preamble_inserter_sink_payload_data;
	vns_liteethudpipcore_liteethmac_liteethmacpreambleinserter_next_state <= vns_liteethudpipcore_liteethmac_liteethmacpreambleinserter_state;
	case (vns_liteethudpipcore_liteethmac_liteethmacpreambleinserter_state)
		1'd1: begin
			soc_eth_core_mac_preamble_inserter_source_valid <= 1'd1;
			case (soc_eth_core_mac_preamble_inserter_cnt)
				1'd0: begin
					soc_eth_core_mac_preamble_inserter_source_payload_data <= soc_eth_core_mac_preamble_inserter_preamble[7:0];
				end
				1'd1: begin
					soc_eth_core_mac_preamble_inserter_source_payload_data <= soc_eth_core_mac_preamble_inserter_preamble[15:8];
				end
				2'd2: begin
					soc_eth_core_mac_preamble_inserter_source_payload_data <= soc_eth_core_mac_preamble_inserter_preamble[23:16];
				end
				2'd3: begin
					soc_eth_core_mac_preamble_inserter_source_payload_data <= soc_eth_core_mac_preamble_inserter_preamble[31:24];
				end
				3'd4: begin
					soc_eth_core_mac_preamble_inserter_source_payload_data <= soc_eth_core_mac_preamble_inserter_preamble[39:32];
				end
				3'd5: begin
					soc_eth_core_mac_preamble_inserter_source_payload_data <= soc_eth_core_mac_preamble_inserter_preamble[47:40];
				end
				3'd6: begin
					soc_eth_core_mac_preamble_inserter_source_payload_data <= soc_eth_core_mac_preamble_inserter_preamble[55:48];
				end
				default: begin
					soc_eth_core_mac_preamble_inserter_source_payload_data <= soc_eth_core_mac_preamble_inserter_preamble[63:56];
				end
			endcase
			if ((soc_eth_core_mac_preamble_inserter_cnt == 3'd7)) begin
				if (soc_eth_core_mac_preamble_inserter_source_ready) begin
					vns_liteethudpipcore_liteethmac_liteethmacpreambleinserter_next_state <= 2'd2;
				end
			end else begin
				soc_eth_core_mac_preamble_inserter_inc_cnt <= soc_eth_core_mac_preamble_inserter_source_ready;
			end
		end
		2'd2: begin
			soc_eth_core_mac_preamble_inserter_source_valid <= soc_eth_core_mac_preamble_inserter_sink_valid;
			soc_eth_core_mac_preamble_inserter_sink_ready <= soc_eth_core_mac_preamble_inserter_source_ready;
			soc_eth_core_mac_preamble_inserter_source_first <= soc_eth_core_mac_preamble_inserter_sink_first;
			soc_eth_core_mac_preamble_inserter_source_last <= soc_eth_core_mac_preamble_inserter_sink_last;
			soc_eth_core_mac_preamble_inserter_source_payload_error <= soc_eth_core_mac_preamble_inserter_sink_payload_error;
			if (((soc_eth_core_mac_preamble_inserter_sink_valid & soc_eth_core_mac_preamble_inserter_sink_last) & soc_eth_core_mac_preamble_inserter_source_ready)) begin
				vns_liteethudpipcore_liteethmac_liteethmacpreambleinserter_next_state <= 1'd0;
			end
		end
		default: begin
			soc_eth_core_mac_preamble_inserter_sink_ready <= 1'd1;
			soc_eth_core_mac_preamble_inserter_clr_cnt <= 1'd1;
			if (soc_eth_core_mac_preamble_inserter_sink_valid) begin
				soc_eth_core_mac_preamble_inserter_sink_ready <= 1'd0;
				vns_liteethudpipcore_liteethmac_liteethmacpreambleinserter_next_state <= 1'd1;
			end
		end
	endcase
end
assign soc_eth_core_mac_preamble_checker_source_payload_data = soc_eth_core_mac_preamble_checker_sink_payload_data;
assign soc_eth_core_mac_preamble_checker_source_payload_last_be = soc_eth_core_mac_preamble_checker_sink_payload_last_be;
always @(*) begin
	soc_eth_core_mac_preamble_checker_error <= 1'd0;
	soc_eth_core_mac_preamble_checker_source_valid <= 1'd0;
	vns_liteethudpipcore_liteethmac_liteethmacpreamblechecker_next_state <= 1'd0;
	soc_eth_core_mac_preamble_checker_source_first <= 1'd0;
	soc_eth_core_mac_preamble_checker_sink_ready <= 1'd0;
	soc_eth_core_mac_preamble_checker_source_last <= 1'd0;
	soc_eth_core_mac_preamble_checker_source_payload_error <= 1'd0;
	vns_liteethudpipcore_liteethmac_liteethmacpreamblechecker_next_state <= vns_liteethudpipcore_liteethmac_liteethmacpreamblechecker_state;
	case (vns_liteethudpipcore_liteethmac_liteethmacpreamblechecker_state)
		1'd1: begin
			soc_eth_core_mac_preamble_checker_source_valid <= soc_eth_core_mac_preamble_checker_sink_valid;
			soc_eth_core_mac_preamble_checker_sink_ready <= soc_eth_core_mac_preamble_checker_source_ready;
			soc_eth_core_mac_preamble_checker_source_first <= soc_eth_core_mac_preamble_checker_sink_first;
			soc_eth_core_mac_preamble_checker_source_last <= soc_eth_core_mac_preamble_checker_sink_last;
			soc_eth_core_mac_preamble_checker_source_payload_error <= soc_eth_core_mac_preamble_checker_sink_payload_error;
			if (((soc_eth_core_mac_preamble_checker_source_valid & soc_eth_core_mac_preamble_checker_source_last) & soc_eth_core_mac_preamble_checker_source_ready)) begin
				vns_liteethudpipcore_liteethmac_liteethmacpreamblechecker_next_state <= 1'd0;
			end
		end
		default: begin
			soc_eth_core_mac_preamble_checker_sink_ready <= 1'd1;
			if (((soc_eth_core_mac_preamble_checker_sink_valid & (~soc_eth_core_mac_preamble_checker_sink_last)) & (soc_eth_core_mac_preamble_checker_sink_payload_data == 8'd213))) begin
				vns_liteethudpipcore_liteethmac_liteethmacpreamblechecker_next_state <= 1'd1;
			end
			if ((soc_eth_core_mac_preamble_checker_sink_valid & soc_eth_core_mac_preamble_checker_sink_last)) begin
				soc_eth_core_mac_preamble_checker_error <= 1'd1;
			end
		end
	endcase
end
assign soc_eth_core_mac_crc32_inserter_cnt_done = (soc_eth_core_mac_crc32_inserter_cnt == 1'd0);
assign soc_eth_core_mac_crc32_inserter_data1 = soc_eth_core_mac_crc32_inserter_data0;
assign soc_eth_core_mac_crc32_inserter_last = soc_eth_core_mac_crc32_inserter_reg;
assign soc_eth_core_mac_crc32_inserter_value = (~{soc_eth_core_mac_crc32_inserter_reg[0], soc_eth_core_mac_crc32_inserter_reg[1], soc_eth_core_mac_crc32_inserter_reg[2], soc_eth_core_mac_crc32_inserter_reg[3], soc_eth_core_mac_crc32_inserter_reg[4], soc_eth_core_mac_crc32_inserter_reg[5], soc_eth_core_mac_crc32_inserter_reg[6], soc_eth_core_mac_crc32_inserter_reg[7], soc_eth_core_mac_crc32_inserter_reg[8], soc_eth_core_mac_crc32_inserter_reg[9], soc_eth_core_mac_crc32_inserter_reg[10], soc_eth_core_mac_crc32_inserter_reg[11], soc_eth_core_mac_crc32_inserter_reg[12], soc_eth_core_mac_crc32_inserter_reg[13], soc_eth_core_mac_crc32_inserter_reg[14], soc_eth_core_mac_crc32_inserter_reg[15], soc_eth_core_mac_crc32_inserter_reg[16], soc_eth_core_mac_crc32_inserter_reg[17], soc_eth_core_mac_crc32_inserter_reg[18], soc_eth_core_mac_crc32_inserter_reg[19], soc_eth_core_mac_crc32_inserter_reg[20], soc_eth_core_mac_crc32_inserter_reg[21], soc_eth_core_mac_crc32_inserter_reg[22], soc_eth_core_mac_crc32_inserter_reg[23], soc_eth_core_mac_crc32_inserter_reg[24], soc_eth_core_mac_crc32_inserter_reg[25], soc_eth_core_mac_crc32_inserter_reg[26], soc_eth_core_mac_crc32_inserter_reg[27], soc_eth_core_mac_crc32_inserter_reg[28], soc_eth_core_mac_crc32_inserter_reg[29], soc_eth_core_mac_crc32_inserter_reg[30], soc_eth_core_mac_crc32_inserter_reg[31]});
assign soc_eth_core_mac_crc32_inserter_error = (soc_eth_core_mac_crc32_inserter_next != 32'd3338984827);
always @(*) begin
	soc_eth_core_mac_crc32_inserter_next <= 32'd0;
	soc_eth_core_mac_crc32_inserter_next[0] <= (((soc_eth_core_mac_crc32_inserter_last[24] ^ soc_eth_core_mac_crc32_inserter_last[30]) ^ soc_eth_core_mac_crc32_inserter_data1[1]) ^ soc_eth_core_mac_crc32_inserter_data1[7]);
	soc_eth_core_mac_crc32_inserter_next[1] <= (((((((soc_eth_core_mac_crc32_inserter_last[25] ^ soc_eth_core_mac_crc32_inserter_last[31]) ^ soc_eth_core_mac_crc32_inserter_data1[0]) ^ soc_eth_core_mac_crc32_inserter_data1[6]) ^ soc_eth_core_mac_crc32_inserter_last[24]) ^ soc_eth_core_mac_crc32_inserter_last[30]) ^ soc_eth_core_mac_crc32_inserter_data1[1]) ^ soc_eth_core_mac_crc32_inserter_data1[7]);
	soc_eth_core_mac_crc32_inserter_next[2] <= (((((((((soc_eth_core_mac_crc32_inserter_last[26] ^ soc_eth_core_mac_crc32_inserter_data1[5]) ^ soc_eth_core_mac_crc32_inserter_last[25]) ^ soc_eth_core_mac_crc32_inserter_last[31]) ^ soc_eth_core_mac_crc32_inserter_data1[0]) ^ soc_eth_core_mac_crc32_inserter_data1[6]) ^ soc_eth_core_mac_crc32_inserter_last[24]) ^ soc_eth_core_mac_crc32_inserter_last[30]) ^ soc_eth_core_mac_crc32_inserter_data1[1]) ^ soc_eth_core_mac_crc32_inserter_data1[7]);
	soc_eth_core_mac_crc32_inserter_next[3] <= (((((((soc_eth_core_mac_crc32_inserter_last[27] ^ soc_eth_core_mac_crc32_inserter_data1[4]) ^ soc_eth_core_mac_crc32_inserter_last[26]) ^ soc_eth_core_mac_crc32_inserter_data1[5]) ^ soc_eth_core_mac_crc32_inserter_last[25]) ^ soc_eth_core_mac_crc32_inserter_last[31]) ^ soc_eth_core_mac_crc32_inserter_data1[0]) ^ soc_eth_core_mac_crc32_inserter_data1[6]);
	soc_eth_core_mac_crc32_inserter_next[4] <= (((((((((soc_eth_core_mac_crc32_inserter_last[28] ^ soc_eth_core_mac_crc32_inserter_data1[3]) ^ soc_eth_core_mac_crc32_inserter_last[27]) ^ soc_eth_core_mac_crc32_inserter_data1[4]) ^ soc_eth_core_mac_crc32_inserter_last[26]) ^ soc_eth_core_mac_crc32_inserter_data1[5]) ^ soc_eth_core_mac_crc32_inserter_last[24]) ^ soc_eth_core_mac_crc32_inserter_last[30]) ^ soc_eth_core_mac_crc32_inserter_data1[1]) ^ soc_eth_core_mac_crc32_inserter_data1[7]);
	soc_eth_core_mac_crc32_inserter_next[5] <= (((((((((((((soc_eth_core_mac_crc32_inserter_last[29] ^ soc_eth_core_mac_crc32_inserter_data1[2]) ^ soc_eth_core_mac_crc32_inserter_last[28]) ^ soc_eth_core_mac_crc32_inserter_data1[3]) ^ soc_eth_core_mac_crc32_inserter_last[27]) ^ soc_eth_core_mac_crc32_inserter_data1[4]) ^ soc_eth_core_mac_crc32_inserter_last[25]) ^ soc_eth_core_mac_crc32_inserter_last[31]) ^ soc_eth_core_mac_crc32_inserter_data1[0]) ^ soc_eth_core_mac_crc32_inserter_data1[6]) ^ soc_eth_core_mac_crc32_inserter_last[24]) ^ soc_eth_core_mac_crc32_inserter_last[30]) ^ soc_eth_core_mac_crc32_inserter_data1[1]) ^ soc_eth_core_mac_crc32_inserter_data1[7]);
	soc_eth_core_mac_crc32_inserter_next[6] <= (((((((((((soc_eth_core_mac_crc32_inserter_last[30] ^ soc_eth_core_mac_crc32_inserter_data1[1]) ^ soc_eth_core_mac_crc32_inserter_last[29]) ^ soc_eth_core_mac_crc32_inserter_data1[2]) ^ soc_eth_core_mac_crc32_inserter_last[28]) ^ soc_eth_core_mac_crc32_inserter_data1[3]) ^ soc_eth_core_mac_crc32_inserter_last[26]) ^ soc_eth_core_mac_crc32_inserter_data1[5]) ^ soc_eth_core_mac_crc32_inserter_last[25]) ^ soc_eth_core_mac_crc32_inserter_last[31]) ^ soc_eth_core_mac_crc32_inserter_data1[0]) ^ soc_eth_core_mac_crc32_inserter_data1[6]);
	soc_eth_core_mac_crc32_inserter_next[7] <= (((((((((soc_eth_core_mac_crc32_inserter_last[31] ^ soc_eth_core_mac_crc32_inserter_data1[0]) ^ soc_eth_core_mac_crc32_inserter_last[29]) ^ soc_eth_core_mac_crc32_inserter_data1[2]) ^ soc_eth_core_mac_crc32_inserter_last[27]) ^ soc_eth_core_mac_crc32_inserter_data1[4]) ^ soc_eth_core_mac_crc32_inserter_last[26]) ^ soc_eth_core_mac_crc32_inserter_data1[5]) ^ soc_eth_core_mac_crc32_inserter_last[24]) ^ soc_eth_core_mac_crc32_inserter_data1[7]);
	soc_eth_core_mac_crc32_inserter_next[8] <= ((((((((soc_eth_core_mac_crc32_inserter_last[0] ^ soc_eth_core_mac_crc32_inserter_last[28]) ^ soc_eth_core_mac_crc32_inserter_data1[3]) ^ soc_eth_core_mac_crc32_inserter_last[27]) ^ soc_eth_core_mac_crc32_inserter_data1[4]) ^ soc_eth_core_mac_crc32_inserter_last[25]) ^ soc_eth_core_mac_crc32_inserter_data1[6]) ^ soc_eth_core_mac_crc32_inserter_last[24]) ^ soc_eth_core_mac_crc32_inserter_data1[7]);
	soc_eth_core_mac_crc32_inserter_next[9] <= ((((((((soc_eth_core_mac_crc32_inserter_last[1] ^ soc_eth_core_mac_crc32_inserter_last[29]) ^ soc_eth_core_mac_crc32_inserter_data1[2]) ^ soc_eth_core_mac_crc32_inserter_last[28]) ^ soc_eth_core_mac_crc32_inserter_data1[3]) ^ soc_eth_core_mac_crc32_inserter_last[26]) ^ soc_eth_core_mac_crc32_inserter_data1[5]) ^ soc_eth_core_mac_crc32_inserter_last[25]) ^ soc_eth_core_mac_crc32_inserter_data1[6]);
	soc_eth_core_mac_crc32_inserter_next[10] <= ((((((((soc_eth_core_mac_crc32_inserter_last[2] ^ soc_eth_core_mac_crc32_inserter_last[29]) ^ soc_eth_core_mac_crc32_inserter_data1[2]) ^ soc_eth_core_mac_crc32_inserter_last[27]) ^ soc_eth_core_mac_crc32_inserter_data1[4]) ^ soc_eth_core_mac_crc32_inserter_last[26]) ^ soc_eth_core_mac_crc32_inserter_data1[5]) ^ soc_eth_core_mac_crc32_inserter_last[24]) ^ soc_eth_core_mac_crc32_inserter_data1[7]);
	soc_eth_core_mac_crc32_inserter_next[11] <= ((((((((soc_eth_core_mac_crc32_inserter_last[3] ^ soc_eth_core_mac_crc32_inserter_last[28]) ^ soc_eth_core_mac_crc32_inserter_data1[3]) ^ soc_eth_core_mac_crc32_inserter_last[27]) ^ soc_eth_core_mac_crc32_inserter_data1[4]) ^ soc_eth_core_mac_crc32_inserter_last[25]) ^ soc_eth_core_mac_crc32_inserter_data1[6]) ^ soc_eth_core_mac_crc32_inserter_last[24]) ^ soc_eth_core_mac_crc32_inserter_data1[7]);
	soc_eth_core_mac_crc32_inserter_next[12] <= ((((((((((((soc_eth_core_mac_crc32_inserter_last[4] ^ soc_eth_core_mac_crc32_inserter_last[29]) ^ soc_eth_core_mac_crc32_inserter_data1[2]) ^ soc_eth_core_mac_crc32_inserter_last[28]) ^ soc_eth_core_mac_crc32_inserter_data1[3]) ^ soc_eth_core_mac_crc32_inserter_last[26]) ^ soc_eth_core_mac_crc32_inserter_data1[5]) ^ soc_eth_core_mac_crc32_inserter_last[25]) ^ soc_eth_core_mac_crc32_inserter_data1[6]) ^ soc_eth_core_mac_crc32_inserter_last[24]) ^ soc_eth_core_mac_crc32_inserter_last[30]) ^ soc_eth_core_mac_crc32_inserter_data1[1]) ^ soc_eth_core_mac_crc32_inserter_data1[7]);
	soc_eth_core_mac_crc32_inserter_next[13] <= ((((((((((((soc_eth_core_mac_crc32_inserter_last[5] ^ soc_eth_core_mac_crc32_inserter_last[30]) ^ soc_eth_core_mac_crc32_inserter_data1[1]) ^ soc_eth_core_mac_crc32_inserter_last[29]) ^ soc_eth_core_mac_crc32_inserter_data1[2]) ^ soc_eth_core_mac_crc32_inserter_last[27]) ^ soc_eth_core_mac_crc32_inserter_data1[4]) ^ soc_eth_core_mac_crc32_inserter_last[26]) ^ soc_eth_core_mac_crc32_inserter_data1[5]) ^ soc_eth_core_mac_crc32_inserter_last[25]) ^ soc_eth_core_mac_crc32_inserter_last[31]) ^ soc_eth_core_mac_crc32_inserter_data1[0]) ^ soc_eth_core_mac_crc32_inserter_data1[6]);
	soc_eth_core_mac_crc32_inserter_next[14] <= ((((((((((soc_eth_core_mac_crc32_inserter_last[6] ^ soc_eth_core_mac_crc32_inserter_last[31]) ^ soc_eth_core_mac_crc32_inserter_data1[0]) ^ soc_eth_core_mac_crc32_inserter_last[30]) ^ soc_eth_core_mac_crc32_inserter_data1[1]) ^ soc_eth_core_mac_crc32_inserter_last[28]) ^ soc_eth_core_mac_crc32_inserter_data1[3]) ^ soc_eth_core_mac_crc32_inserter_last[27]) ^ soc_eth_core_mac_crc32_inserter_data1[4]) ^ soc_eth_core_mac_crc32_inserter_last[26]) ^ soc_eth_core_mac_crc32_inserter_data1[5]);
	soc_eth_core_mac_crc32_inserter_next[15] <= ((((((((soc_eth_core_mac_crc32_inserter_last[7] ^ soc_eth_core_mac_crc32_inserter_last[31]) ^ soc_eth_core_mac_crc32_inserter_data1[0]) ^ soc_eth_core_mac_crc32_inserter_last[29]) ^ soc_eth_core_mac_crc32_inserter_data1[2]) ^ soc_eth_core_mac_crc32_inserter_last[28]) ^ soc_eth_core_mac_crc32_inserter_data1[3]) ^ soc_eth_core_mac_crc32_inserter_last[27]) ^ soc_eth_core_mac_crc32_inserter_data1[4]);
	soc_eth_core_mac_crc32_inserter_next[16] <= ((((((soc_eth_core_mac_crc32_inserter_last[8] ^ soc_eth_core_mac_crc32_inserter_last[29]) ^ soc_eth_core_mac_crc32_inserter_data1[2]) ^ soc_eth_core_mac_crc32_inserter_last[28]) ^ soc_eth_core_mac_crc32_inserter_data1[3]) ^ soc_eth_core_mac_crc32_inserter_last[24]) ^ soc_eth_core_mac_crc32_inserter_data1[7]);
	soc_eth_core_mac_crc32_inserter_next[17] <= ((((((soc_eth_core_mac_crc32_inserter_last[9] ^ soc_eth_core_mac_crc32_inserter_last[30]) ^ soc_eth_core_mac_crc32_inserter_data1[1]) ^ soc_eth_core_mac_crc32_inserter_last[29]) ^ soc_eth_core_mac_crc32_inserter_data1[2]) ^ soc_eth_core_mac_crc32_inserter_last[25]) ^ soc_eth_core_mac_crc32_inserter_data1[6]);
	soc_eth_core_mac_crc32_inserter_next[18] <= ((((((soc_eth_core_mac_crc32_inserter_last[10] ^ soc_eth_core_mac_crc32_inserter_last[31]) ^ soc_eth_core_mac_crc32_inserter_data1[0]) ^ soc_eth_core_mac_crc32_inserter_last[30]) ^ soc_eth_core_mac_crc32_inserter_data1[1]) ^ soc_eth_core_mac_crc32_inserter_last[26]) ^ soc_eth_core_mac_crc32_inserter_data1[5]);
	soc_eth_core_mac_crc32_inserter_next[19] <= ((((soc_eth_core_mac_crc32_inserter_last[11] ^ soc_eth_core_mac_crc32_inserter_last[31]) ^ soc_eth_core_mac_crc32_inserter_data1[0]) ^ soc_eth_core_mac_crc32_inserter_last[27]) ^ soc_eth_core_mac_crc32_inserter_data1[4]);
	soc_eth_core_mac_crc32_inserter_next[20] <= ((soc_eth_core_mac_crc32_inserter_last[12] ^ soc_eth_core_mac_crc32_inserter_last[28]) ^ soc_eth_core_mac_crc32_inserter_data1[3]);
	soc_eth_core_mac_crc32_inserter_next[21] <= ((soc_eth_core_mac_crc32_inserter_last[13] ^ soc_eth_core_mac_crc32_inserter_last[29]) ^ soc_eth_core_mac_crc32_inserter_data1[2]);
	soc_eth_core_mac_crc32_inserter_next[22] <= ((soc_eth_core_mac_crc32_inserter_last[14] ^ soc_eth_core_mac_crc32_inserter_last[24]) ^ soc_eth_core_mac_crc32_inserter_data1[7]);
	soc_eth_core_mac_crc32_inserter_next[23] <= ((((((soc_eth_core_mac_crc32_inserter_last[15] ^ soc_eth_core_mac_crc32_inserter_last[25]) ^ soc_eth_core_mac_crc32_inserter_data1[6]) ^ soc_eth_core_mac_crc32_inserter_last[24]) ^ soc_eth_core_mac_crc32_inserter_last[30]) ^ soc_eth_core_mac_crc32_inserter_data1[1]) ^ soc_eth_core_mac_crc32_inserter_data1[7]);
	soc_eth_core_mac_crc32_inserter_next[24] <= ((((((soc_eth_core_mac_crc32_inserter_last[16] ^ soc_eth_core_mac_crc32_inserter_last[26]) ^ soc_eth_core_mac_crc32_inserter_data1[5]) ^ soc_eth_core_mac_crc32_inserter_last[25]) ^ soc_eth_core_mac_crc32_inserter_last[31]) ^ soc_eth_core_mac_crc32_inserter_data1[0]) ^ soc_eth_core_mac_crc32_inserter_data1[6]);
	soc_eth_core_mac_crc32_inserter_next[25] <= ((((soc_eth_core_mac_crc32_inserter_last[17] ^ soc_eth_core_mac_crc32_inserter_last[27]) ^ soc_eth_core_mac_crc32_inserter_data1[4]) ^ soc_eth_core_mac_crc32_inserter_last[26]) ^ soc_eth_core_mac_crc32_inserter_data1[5]);
	soc_eth_core_mac_crc32_inserter_next[26] <= ((((((((soc_eth_core_mac_crc32_inserter_last[18] ^ soc_eth_core_mac_crc32_inserter_last[28]) ^ soc_eth_core_mac_crc32_inserter_data1[3]) ^ soc_eth_core_mac_crc32_inserter_last[27]) ^ soc_eth_core_mac_crc32_inserter_data1[4]) ^ soc_eth_core_mac_crc32_inserter_last[24]) ^ soc_eth_core_mac_crc32_inserter_last[30]) ^ soc_eth_core_mac_crc32_inserter_data1[1]) ^ soc_eth_core_mac_crc32_inserter_data1[7]);
	soc_eth_core_mac_crc32_inserter_next[27] <= ((((((((soc_eth_core_mac_crc32_inserter_last[19] ^ soc_eth_core_mac_crc32_inserter_last[29]) ^ soc_eth_core_mac_crc32_inserter_data1[2]) ^ soc_eth_core_mac_crc32_inserter_last[28]) ^ soc_eth_core_mac_crc32_inserter_data1[3]) ^ soc_eth_core_mac_crc32_inserter_last[25]) ^ soc_eth_core_mac_crc32_inserter_last[31]) ^ soc_eth_core_mac_crc32_inserter_data1[0]) ^ soc_eth_core_mac_crc32_inserter_data1[6]);
	soc_eth_core_mac_crc32_inserter_next[28] <= ((((((soc_eth_core_mac_crc32_inserter_last[20] ^ soc_eth_core_mac_crc32_inserter_last[30]) ^ soc_eth_core_mac_crc32_inserter_data1[1]) ^ soc_eth_core_mac_crc32_inserter_last[29]) ^ soc_eth_core_mac_crc32_inserter_data1[2]) ^ soc_eth_core_mac_crc32_inserter_last[26]) ^ soc_eth_core_mac_crc32_inserter_data1[5]);
	soc_eth_core_mac_crc32_inserter_next[29] <= ((((((soc_eth_core_mac_crc32_inserter_last[21] ^ soc_eth_core_mac_crc32_inserter_last[31]) ^ soc_eth_core_mac_crc32_inserter_data1[0]) ^ soc_eth_core_mac_crc32_inserter_last[30]) ^ soc_eth_core_mac_crc32_inserter_data1[1]) ^ soc_eth_core_mac_crc32_inserter_last[27]) ^ soc_eth_core_mac_crc32_inserter_data1[4]);
	soc_eth_core_mac_crc32_inserter_next[30] <= ((((soc_eth_core_mac_crc32_inserter_last[22] ^ soc_eth_core_mac_crc32_inserter_last[31]) ^ soc_eth_core_mac_crc32_inserter_data1[0]) ^ soc_eth_core_mac_crc32_inserter_last[28]) ^ soc_eth_core_mac_crc32_inserter_data1[3]);
	soc_eth_core_mac_crc32_inserter_next[31] <= ((soc_eth_core_mac_crc32_inserter_last[23] ^ soc_eth_core_mac_crc32_inserter_last[29]) ^ soc_eth_core_mac_crc32_inserter_data1[2]);
end
always @(*) begin
	soc_eth_core_mac_crc32_inserter_is_ongoing1 <= 1'd0;
	soc_eth_core_mac_crc32_inserter_ce <= 1'd0;
	soc_eth_core_mac_crc32_inserter_reset <= 1'd0;
	soc_eth_core_mac_crc32_inserter_source_valid <= 1'd0;
	soc_eth_core_mac_crc32_inserter_source_first <= 1'd0;
	soc_eth_core_mac_crc32_inserter_source_last <= 1'd0;
	soc_eth_core_mac_crc32_inserter_source_payload_data <= 8'd0;
	soc_eth_core_mac_crc32_inserter_source_payload_last_be <= 1'd0;
	soc_eth_core_mac_crc32_inserter_source_payload_error <= 1'd0;
	vns_liteethudpipcore_liteethmac_liteethmaccrc32inserter_next_state <= 2'd0;
	soc_eth_core_mac_crc32_inserter_data0 <= 8'd0;
	soc_eth_core_mac_crc32_inserter_is_ongoing0 <= 1'd0;
	soc_eth_core_mac_crc32_inserter_sink_ready <= 1'd0;
	vns_liteethudpipcore_liteethmac_liteethmaccrc32inserter_next_state <= vns_liteethudpipcore_liteethmac_liteethmaccrc32inserter_state;
	case (vns_liteethudpipcore_liteethmac_liteethmaccrc32inserter_state)
		1'd1: begin
			soc_eth_core_mac_crc32_inserter_ce <= (soc_eth_core_mac_crc32_inserter_sink_valid & soc_eth_core_mac_crc32_inserter_source_ready);
			soc_eth_core_mac_crc32_inserter_data0 <= soc_eth_core_mac_crc32_inserter_sink_payload_data;
			soc_eth_core_mac_crc32_inserter_source_valid <= soc_eth_core_mac_crc32_inserter_sink_valid;
			soc_eth_core_mac_crc32_inserter_sink_ready <= soc_eth_core_mac_crc32_inserter_source_ready;
			soc_eth_core_mac_crc32_inserter_source_first <= soc_eth_core_mac_crc32_inserter_sink_first;
			soc_eth_core_mac_crc32_inserter_source_last <= soc_eth_core_mac_crc32_inserter_sink_last;
			soc_eth_core_mac_crc32_inserter_source_payload_data <= soc_eth_core_mac_crc32_inserter_sink_payload_data;
			soc_eth_core_mac_crc32_inserter_source_payload_last_be <= soc_eth_core_mac_crc32_inserter_sink_payload_last_be;
			soc_eth_core_mac_crc32_inserter_source_payload_error <= soc_eth_core_mac_crc32_inserter_sink_payload_error;
			soc_eth_core_mac_crc32_inserter_source_last <= 1'd0;
			if (((soc_eth_core_mac_crc32_inserter_sink_valid & soc_eth_core_mac_crc32_inserter_sink_last) & soc_eth_core_mac_crc32_inserter_source_ready)) begin
				vns_liteethudpipcore_liteethmac_liteethmaccrc32inserter_next_state <= 2'd2;
			end
		end
		2'd2: begin
			soc_eth_core_mac_crc32_inserter_source_valid <= 1'd1;
			case (soc_eth_core_mac_crc32_inserter_cnt)
				1'd0: begin
					soc_eth_core_mac_crc32_inserter_source_payload_data <= soc_eth_core_mac_crc32_inserter_value[31:24];
				end
				1'd1: begin
					soc_eth_core_mac_crc32_inserter_source_payload_data <= soc_eth_core_mac_crc32_inserter_value[23:16];
				end
				2'd2: begin
					soc_eth_core_mac_crc32_inserter_source_payload_data <= soc_eth_core_mac_crc32_inserter_value[15:8];
				end
				default: begin
					soc_eth_core_mac_crc32_inserter_source_payload_data <= soc_eth_core_mac_crc32_inserter_value[7:0];
				end
			endcase
			if (soc_eth_core_mac_crc32_inserter_cnt_done) begin
				soc_eth_core_mac_crc32_inserter_source_last <= 1'd1;
				if (soc_eth_core_mac_crc32_inserter_source_ready) begin
					vns_liteethudpipcore_liteethmac_liteethmaccrc32inserter_next_state <= 1'd0;
				end
			end
			soc_eth_core_mac_crc32_inserter_is_ongoing1 <= 1'd1;
		end
		default: begin
			soc_eth_core_mac_crc32_inserter_reset <= 1'd1;
			soc_eth_core_mac_crc32_inserter_sink_ready <= 1'd1;
			if (soc_eth_core_mac_crc32_inserter_sink_valid) begin
				soc_eth_core_mac_crc32_inserter_sink_ready <= 1'd0;
				vns_liteethudpipcore_liteethmac_liteethmaccrc32inserter_next_state <= 1'd1;
			end
			soc_eth_core_mac_crc32_inserter_is_ongoing0 <= 1'd1;
		end
	endcase
end
assign soc_eth_core_mac_crc32_checker_fifo_full = (soc_eth_core_mac_crc32_checker_syncfifo_level == 3'd4);
assign soc_eth_core_mac_crc32_checker_fifo_in = (soc_eth_core_mac_crc32_checker_sink_sink_valid & ((~soc_eth_core_mac_crc32_checker_fifo_full) | soc_eth_core_mac_crc32_checker_fifo_out));
assign soc_eth_core_mac_crc32_checker_fifo_out = (soc_eth_core_mac_crc32_checker_source_source_valid & soc_eth_core_mac_crc32_checker_source_source_ready);
assign soc_eth_core_mac_crc32_checker_syncfifo_sink_first = soc_eth_core_mac_crc32_checker_sink_sink_first;
assign soc_eth_core_mac_crc32_checker_syncfifo_sink_last = soc_eth_core_mac_crc32_checker_sink_sink_last;
assign soc_eth_core_mac_crc32_checker_syncfifo_sink_payload_data = soc_eth_core_mac_crc32_checker_sink_sink_payload_data;
assign soc_eth_core_mac_crc32_checker_syncfifo_sink_payload_last_be = soc_eth_core_mac_crc32_checker_sink_sink_payload_last_be;
assign soc_eth_core_mac_crc32_checker_syncfifo_sink_payload_error = soc_eth_core_mac_crc32_checker_sink_sink_payload_error;
always @(*) begin
	soc_eth_core_mac_crc32_checker_syncfifo_sink_valid <= 1'd0;
	soc_eth_core_mac_crc32_checker_syncfifo_sink_valid <= soc_eth_core_mac_crc32_checker_sink_sink_valid;
	soc_eth_core_mac_crc32_checker_syncfifo_sink_valid <= soc_eth_core_mac_crc32_checker_fifo_in;
end
always @(*) begin
	soc_eth_core_mac_crc32_checker_sink_sink_ready <= 1'd0;
	soc_eth_core_mac_crc32_checker_sink_sink_ready <= soc_eth_core_mac_crc32_checker_syncfifo_sink_ready;
	soc_eth_core_mac_crc32_checker_sink_sink_ready <= soc_eth_core_mac_crc32_checker_fifo_in;
end
assign soc_eth_core_mac_crc32_checker_source_source_valid = (soc_eth_core_mac_crc32_checker_sink_sink_valid & soc_eth_core_mac_crc32_checker_fifo_full);
assign soc_eth_core_mac_crc32_checker_source_source_last = soc_eth_core_mac_crc32_checker_sink_sink_last;
assign soc_eth_core_mac_crc32_checker_syncfifo_source_ready = soc_eth_core_mac_crc32_checker_fifo_out;
assign soc_eth_core_mac_crc32_checker_source_source_payload_data = soc_eth_core_mac_crc32_checker_syncfifo_source_payload_data;
assign soc_eth_core_mac_crc32_checker_source_source_payload_last_be = soc_eth_core_mac_crc32_checker_syncfifo_source_payload_last_be;
always @(*) begin
	soc_eth_core_mac_crc32_checker_source_source_payload_error <= 1'd0;
	soc_eth_core_mac_crc32_checker_source_source_payload_error <= soc_eth_core_mac_crc32_checker_syncfifo_source_payload_error;
	soc_eth_core_mac_crc32_checker_source_source_payload_error <= (soc_eth_core_mac_crc32_checker_sink_sink_payload_error | soc_eth_core_mac_crc32_checker_crc_error);
end
assign soc_eth_core_mac_crc32_checker_error = ((soc_eth_core_mac_crc32_checker_source_source_valid & soc_eth_core_mac_crc32_checker_source_source_last) & soc_eth_core_mac_crc32_checker_crc_error);
assign soc_eth_core_mac_crc32_checker_crc_data0 = soc_eth_core_mac_crc32_checker_sink_sink_payload_data;
assign soc_eth_core_mac_crc32_checker_crc_data1 = soc_eth_core_mac_crc32_checker_crc_data0;
assign soc_eth_core_mac_crc32_checker_crc_last = soc_eth_core_mac_crc32_checker_crc_reg;
assign soc_eth_core_mac_crc32_checker_crc_value = (~{soc_eth_core_mac_crc32_checker_crc_reg[0], soc_eth_core_mac_crc32_checker_crc_reg[1], soc_eth_core_mac_crc32_checker_crc_reg[2], soc_eth_core_mac_crc32_checker_crc_reg[3], soc_eth_core_mac_crc32_checker_crc_reg[4], soc_eth_core_mac_crc32_checker_crc_reg[5], soc_eth_core_mac_crc32_checker_crc_reg[6], soc_eth_core_mac_crc32_checker_crc_reg[7], soc_eth_core_mac_crc32_checker_crc_reg[8], soc_eth_core_mac_crc32_checker_crc_reg[9], soc_eth_core_mac_crc32_checker_crc_reg[10], soc_eth_core_mac_crc32_checker_crc_reg[11], soc_eth_core_mac_crc32_checker_crc_reg[12], soc_eth_core_mac_crc32_checker_crc_reg[13], soc_eth_core_mac_crc32_checker_crc_reg[14], soc_eth_core_mac_crc32_checker_crc_reg[15], soc_eth_core_mac_crc32_checker_crc_reg[16], soc_eth_core_mac_crc32_checker_crc_reg[17], soc_eth_core_mac_crc32_checker_crc_reg[18], soc_eth_core_mac_crc32_checker_crc_reg[19], soc_eth_core_mac_crc32_checker_crc_reg[20], soc_eth_core_mac_crc32_checker_crc_reg[21], soc_eth_core_mac_crc32_checker_crc_reg[22], soc_eth_core_mac_crc32_checker_crc_reg[23], soc_eth_core_mac_crc32_checker_crc_reg[24], soc_eth_core_mac_crc32_checker_crc_reg[25], soc_eth_core_mac_crc32_checker_crc_reg[26], soc_eth_core_mac_crc32_checker_crc_reg[27], soc_eth_core_mac_crc32_checker_crc_reg[28], soc_eth_core_mac_crc32_checker_crc_reg[29], soc_eth_core_mac_crc32_checker_crc_reg[30], soc_eth_core_mac_crc32_checker_crc_reg[31]});
assign soc_eth_core_mac_crc32_checker_crc_error = (soc_eth_core_mac_crc32_checker_crc_next != 32'd3338984827);
always @(*) begin
	soc_eth_core_mac_crc32_checker_crc_next <= 32'd0;
	soc_eth_core_mac_crc32_checker_crc_next[0] <= (((soc_eth_core_mac_crc32_checker_crc_last[24] ^ soc_eth_core_mac_crc32_checker_crc_last[30]) ^ soc_eth_core_mac_crc32_checker_crc_data1[1]) ^ soc_eth_core_mac_crc32_checker_crc_data1[7]);
	soc_eth_core_mac_crc32_checker_crc_next[1] <= (((((((soc_eth_core_mac_crc32_checker_crc_last[25] ^ soc_eth_core_mac_crc32_checker_crc_last[31]) ^ soc_eth_core_mac_crc32_checker_crc_data1[0]) ^ soc_eth_core_mac_crc32_checker_crc_data1[6]) ^ soc_eth_core_mac_crc32_checker_crc_last[24]) ^ soc_eth_core_mac_crc32_checker_crc_last[30]) ^ soc_eth_core_mac_crc32_checker_crc_data1[1]) ^ soc_eth_core_mac_crc32_checker_crc_data1[7]);
	soc_eth_core_mac_crc32_checker_crc_next[2] <= (((((((((soc_eth_core_mac_crc32_checker_crc_last[26] ^ soc_eth_core_mac_crc32_checker_crc_data1[5]) ^ soc_eth_core_mac_crc32_checker_crc_last[25]) ^ soc_eth_core_mac_crc32_checker_crc_last[31]) ^ soc_eth_core_mac_crc32_checker_crc_data1[0]) ^ soc_eth_core_mac_crc32_checker_crc_data1[6]) ^ soc_eth_core_mac_crc32_checker_crc_last[24]) ^ soc_eth_core_mac_crc32_checker_crc_last[30]) ^ soc_eth_core_mac_crc32_checker_crc_data1[1]) ^ soc_eth_core_mac_crc32_checker_crc_data1[7]);
	soc_eth_core_mac_crc32_checker_crc_next[3] <= (((((((soc_eth_core_mac_crc32_checker_crc_last[27] ^ soc_eth_core_mac_crc32_checker_crc_data1[4]) ^ soc_eth_core_mac_crc32_checker_crc_last[26]) ^ soc_eth_core_mac_crc32_checker_crc_data1[5]) ^ soc_eth_core_mac_crc32_checker_crc_last[25]) ^ soc_eth_core_mac_crc32_checker_crc_last[31]) ^ soc_eth_core_mac_crc32_checker_crc_data1[0]) ^ soc_eth_core_mac_crc32_checker_crc_data1[6]);
	soc_eth_core_mac_crc32_checker_crc_next[4] <= (((((((((soc_eth_core_mac_crc32_checker_crc_last[28] ^ soc_eth_core_mac_crc32_checker_crc_data1[3]) ^ soc_eth_core_mac_crc32_checker_crc_last[27]) ^ soc_eth_core_mac_crc32_checker_crc_data1[4]) ^ soc_eth_core_mac_crc32_checker_crc_last[26]) ^ soc_eth_core_mac_crc32_checker_crc_data1[5]) ^ soc_eth_core_mac_crc32_checker_crc_last[24]) ^ soc_eth_core_mac_crc32_checker_crc_last[30]) ^ soc_eth_core_mac_crc32_checker_crc_data1[1]) ^ soc_eth_core_mac_crc32_checker_crc_data1[7]);
	soc_eth_core_mac_crc32_checker_crc_next[5] <= (((((((((((((soc_eth_core_mac_crc32_checker_crc_last[29] ^ soc_eth_core_mac_crc32_checker_crc_data1[2]) ^ soc_eth_core_mac_crc32_checker_crc_last[28]) ^ soc_eth_core_mac_crc32_checker_crc_data1[3]) ^ soc_eth_core_mac_crc32_checker_crc_last[27]) ^ soc_eth_core_mac_crc32_checker_crc_data1[4]) ^ soc_eth_core_mac_crc32_checker_crc_last[25]) ^ soc_eth_core_mac_crc32_checker_crc_last[31]) ^ soc_eth_core_mac_crc32_checker_crc_data1[0]) ^ soc_eth_core_mac_crc32_checker_crc_data1[6]) ^ soc_eth_core_mac_crc32_checker_crc_last[24]) ^ soc_eth_core_mac_crc32_checker_crc_last[30]) ^ soc_eth_core_mac_crc32_checker_crc_data1[1]) ^ soc_eth_core_mac_crc32_checker_crc_data1[7]);
	soc_eth_core_mac_crc32_checker_crc_next[6] <= (((((((((((soc_eth_core_mac_crc32_checker_crc_last[30] ^ soc_eth_core_mac_crc32_checker_crc_data1[1]) ^ soc_eth_core_mac_crc32_checker_crc_last[29]) ^ soc_eth_core_mac_crc32_checker_crc_data1[2]) ^ soc_eth_core_mac_crc32_checker_crc_last[28]) ^ soc_eth_core_mac_crc32_checker_crc_data1[3]) ^ soc_eth_core_mac_crc32_checker_crc_last[26]) ^ soc_eth_core_mac_crc32_checker_crc_data1[5]) ^ soc_eth_core_mac_crc32_checker_crc_last[25]) ^ soc_eth_core_mac_crc32_checker_crc_last[31]) ^ soc_eth_core_mac_crc32_checker_crc_data1[0]) ^ soc_eth_core_mac_crc32_checker_crc_data1[6]);
	soc_eth_core_mac_crc32_checker_crc_next[7] <= (((((((((soc_eth_core_mac_crc32_checker_crc_last[31] ^ soc_eth_core_mac_crc32_checker_crc_data1[0]) ^ soc_eth_core_mac_crc32_checker_crc_last[29]) ^ soc_eth_core_mac_crc32_checker_crc_data1[2]) ^ soc_eth_core_mac_crc32_checker_crc_last[27]) ^ soc_eth_core_mac_crc32_checker_crc_data1[4]) ^ soc_eth_core_mac_crc32_checker_crc_last[26]) ^ soc_eth_core_mac_crc32_checker_crc_data1[5]) ^ soc_eth_core_mac_crc32_checker_crc_last[24]) ^ soc_eth_core_mac_crc32_checker_crc_data1[7]);
	soc_eth_core_mac_crc32_checker_crc_next[8] <= ((((((((soc_eth_core_mac_crc32_checker_crc_last[0] ^ soc_eth_core_mac_crc32_checker_crc_last[28]) ^ soc_eth_core_mac_crc32_checker_crc_data1[3]) ^ soc_eth_core_mac_crc32_checker_crc_last[27]) ^ soc_eth_core_mac_crc32_checker_crc_data1[4]) ^ soc_eth_core_mac_crc32_checker_crc_last[25]) ^ soc_eth_core_mac_crc32_checker_crc_data1[6]) ^ soc_eth_core_mac_crc32_checker_crc_last[24]) ^ soc_eth_core_mac_crc32_checker_crc_data1[7]);
	soc_eth_core_mac_crc32_checker_crc_next[9] <= ((((((((soc_eth_core_mac_crc32_checker_crc_last[1] ^ soc_eth_core_mac_crc32_checker_crc_last[29]) ^ soc_eth_core_mac_crc32_checker_crc_data1[2]) ^ soc_eth_core_mac_crc32_checker_crc_last[28]) ^ soc_eth_core_mac_crc32_checker_crc_data1[3]) ^ soc_eth_core_mac_crc32_checker_crc_last[26]) ^ soc_eth_core_mac_crc32_checker_crc_data1[5]) ^ soc_eth_core_mac_crc32_checker_crc_last[25]) ^ soc_eth_core_mac_crc32_checker_crc_data1[6]);
	soc_eth_core_mac_crc32_checker_crc_next[10] <= ((((((((soc_eth_core_mac_crc32_checker_crc_last[2] ^ soc_eth_core_mac_crc32_checker_crc_last[29]) ^ soc_eth_core_mac_crc32_checker_crc_data1[2]) ^ soc_eth_core_mac_crc32_checker_crc_last[27]) ^ soc_eth_core_mac_crc32_checker_crc_data1[4]) ^ soc_eth_core_mac_crc32_checker_crc_last[26]) ^ soc_eth_core_mac_crc32_checker_crc_data1[5]) ^ soc_eth_core_mac_crc32_checker_crc_last[24]) ^ soc_eth_core_mac_crc32_checker_crc_data1[7]);
	soc_eth_core_mac_crc32_checker_crc_next[11] <= ((((((((soc_eth_core_mac_crc32_checker_crc_last[3] ^ soc_eth_core_mac_crc32_checker_crc_last[28]) ^ soc_eth_core_mac_crc32_checker_crc_data1[3]) ^ soc_eth_core_mac_crc32_checker_crc_last[27]) ^ soc_eth_core_mac_crc32_checker_crc_data1[4]) ^ soc_eth_core_mac_crc32_checker_crc_last[25]) ^ soc_eth_core_mac_crc32_checker_crc_data1[6]) ^ soc_eth_core_mac_crc32_checker_crc_last[24]) ^ soc_eth_core_mac_crc32_checker_crc_data1[7]);
	soc_eth_core_mac_crc32_checker_crc_next[12] <= ((((((((((((soc_eth_core_mac_crc32_checker_crc_last[4] ^ soc_eth_core_mac_crc32_checker_crc_last[29]) ^ soc_eth_core_mac_crc32_checker_crc_data1[2]) ^ soc_eth_core_mac_crc32_checker_crc_last[28]) ^ soc_eth_core_mac_crc32_checker_crc_data1[3]) ^ soc_eth_core_mac_crc32_checker_crc_last[26]) ^ soc_eth_core_mac_crc32_checker_crc_data1[5]) ^ soc_eth_core_mac_crc32_checker_crc_last[25]) ^ soc_eth_core_mac_crc32_checker_crc_data1[6]) ^ soc_eth_core_mac_crc32_checker_crc_last[24]) ^ soc_eth_core_mac_crc32_checker_crc_last[30]) ^ soc_eth_core_mac_crc32_checker_crc_data1[1]) ^ soc_eth_core_mac_crc32_checker_crc_data1[7]);
	soc_eth_core_mac_crc32_checker_crc_next[13] <= ((((((((((((soc_eth_core_mac_crc32_checker_crc_last[5] ^ soc_eth_core_mac_crc32_checker_crc_last[30]) ^ soc_eth_core_mac_crc32_checker_crc_data1[1]) ^ soc_eth_core_mac_crc32_checker_crc_last[29]) ^ soc_eth_core_mac_crc32_checker_crc_data1[2]) ^ soc_eth_core_mac_crc32_checker_crc_last[27]) ^ soc_eth_core_mac_crc32_checker_crc_data1[4]) ^ soc_eth_core_mac_crc32_checker_crc_last[26]) ^ soc_eth_core_mac_crc32_checker_crc_data1[5]) ^ soc_eth_core_mac_crc32_checker_crc_last[25]) ^ soc_eth_core_mac_crc32_checker_crc_last[31]) ^ soc_eth_core_mac_crc32_checker_crc_data1[0]) ^ soc_eth_core_mac_crc32_checker_crc_data1[6]);
	soc_eth_core_mac_crc32_checker_crc_next[14] <= ((((((((((soc_eth_core_mac_crc32_checker_crc_last[6] ^ soc_eth_core_mac_crc32_checker_crc_last[31]) ^ soc_eth_core_mac_crc32_checker_crc_data1[0]) ^ soc_eth_core_mac_crc32_checker_crc_last[30]) ^ soc_eth_core_mac_crc32_checker_crc_data1[1]) ^ soc_eth_core_mac_crc32_checker_crc_last[28]) ^ soc_eth_core_mac_crc32_checker_crc_data1[3]) ^ soc_eth_core_mac_crc32_checker_crc_last[27]) ^ soc_eth_core_mac_crc32_checker_crc_data1[4]) ^ soc_eth_core_mac_crc32_checker_crc_last[26]) ^ soc_eth_core_mac_crc32_checker_crc_data1[5]);
	soc_eth_core_mac_crc32_checker_crc_next[15] <= ((((((((soc_eth_core_mac_crc32_checker_crc_last[7] ^ soc_eth_core_mac_crc32_checker_crc_last[31]) ^ soc_eth_core_mac_crc32_checker_crc_data1[0]) ^ soc_eth_core_mac_crc32_checker_crc_last[29]) ^ soc_eth_core_mac_crc32_checker_crc_data1[2]) ^ soc_eth_core_mac_crc32_checker_crc_last[28]) ^ soc_eth_core_mac_crc32_checker_crc_data1[3]) ^ soc_eth_core_mac_crc32_checker_crc_last[27]) ^ soc_eth_core_mac_crc32_checker_crc_data1[4]);
	soc_eth_core_mac_crc32_checker_crc_next[16] <= ((((((soc_eth_core_mac_crc32_checker_crc_last[8] ^ soc_eth_core_mac_crc32_checker_crc_last[29]) ^ soc_eth_core_mac_crc32_checker_crc_data1[2]) ^ soc_eth_core_mac_crc32_checker_crc_last[28]) ^ soc_eth_core_mac_crc32_checker_crc_data1[3]) ^ soc_eth_core_mac_crc32_checker_crc_last[24]) ^ soc_eth_core_mac_crc32_checker_crc_data1[7]);
	soc_eth_core_mac_crc32_checker_crc_next[17] <= ((((((soc_eth_core_mac_crc32_checker_crc_last[9] ^ soc_eth_core_mac_crc32_checker_crc_last[30]) ^ soc_eth_core_mac_crc32_checker_crc_data1[1]) ^ soc_eth_core_mac_crc32_checker_crc_last[29]) ^ soc_eth_core_mac_crc32_checker_crc_data1[2]) ^ soc_eth_core_mac_crc32_checker_crc_last[25]) ^ soc_eth_core_mac_crc32_checker_crc_data1[6]);
	soc_eth_core_mac_crc32_checker_crc_next[18] <= ((((((soc_eth_core_mac_crc32_checker_crc_last[10] ^ soc_eth_core_mac_crc32_checker_crc_last[31]) ^ soc_eth_core_mac_crc32_checker_crc_data1[0]) ^ soc_eth_core_mac_crc32_checker_crc_last[30]) ^ soc_eth_core_mac_crc32_checker_crc_data1[1]) ^ soc_eth_core_mac_crc32_checker_crc_last[26]) ^ soc_eth_core_mac_crc32_checker_crc_data1[5]);
	soc_eth_core_mac_crc32_checker_crc_next[19] <= ((((soc_eth_core_mac_crc32_checker_crc_last[11] ^ soc_eth_core_mac_crc32_checker_crc_last[31]) ^ soc_eth_core_mac_crc32_checker_crc_data1[0]) ^ soc_eth_core_mac_crc32_checker_crc_last[27]) ^ soc_eth_core_mac_crc32_checker_crc_data1[4]);
	soc_eth_core_mac_crc32_checker_crc_next[20] <= ((soc_eth_core_mac_crc32_checker_crc_last[12] ^ soc_eth_core_mac_crc32_checker_crc_last[28]) ^ soc_eth_core_mac_crc32_checker_crc_data1[3]);
	soc_eth_core_mac_crc32_checker_crc_next[21] <= ((soc_eth_core_mac_crc32_checker_crc_last[13] ^ soc_eth_core_mac_crc32_checker_crc_last[29]) ^ soc_eth_core_mac_crc32_checker_crc_data1[2]);
	soc_eth_core_mac_crc32_checker_crc_next[22] <= ((soc_eth_core_mac_crc32_checker_crc_last[14] ^ soc_eth_core_mac_crc32_checker_crc_last[24]) ^ soc_eth_core_mac_crc32_checker_crc_data1[7]);
	soc_eth_core_mac_crc32_checker_crc_next[23] <= ((((((soc_eth_core_mac_crc32_checker_crc_last[15] ^ soc_eth_core_mac_crc32_checker_crc_last[25]) ^ soc_eth_core_mac_crc32_checker_crc_data1[6]) ^ soc_eth_core_mac_crc32_checker_crc_last[24]) ^ soc_eth_core_mac_crc32_checker_crc_last[30]) ^ soc_eth_core_mac_crc32_checker_crc_data1[1]) ^ soc_eth_core_mac_crc32_checker_crc_data1[7]);
	soc_eth_core_mac_crc32_checker_crc_next[24] <= ((((((soc_eth_core_mac_crc32_checker_crc_last[16] ^ soc_eth_core_mac_crc32_checker_crc_last[26]) ^ soc_eth_core_mac_crc32_checker_crc_data1[5]) ^ soc_eth_core_mac_crc32_checker_crc_last[25]) ^ soc_eth_core_mac_crc32_checker_crc_last[31]) ^ soc_eth_core_mac_crc32_checker_crc_data1[0]) ^ soc_eth_core_mac_crc32_checker_crc_data1[6]);
	soc_eth_core_mac_crc32_checker_crc_next[25] <= ((((soc_eth_core_mac_crc32_checker_crc_last[17] ^ soc_eth_core_mac_crc32_checker_crc_last[27]) ^ soc_eth_core_mac_crc32_checker_crc_data1[4]) ^ soc_eth_core_mac_crc32_checker_crc_last[26]) ^ soc_eth_core_mac_crc32_checker_crc_data1[5]);
	soc_eth_core_mac_crc32_checker_crc_next[26] <= ((((((((soc_eth_core_mac_crc32_checker_crc_last[18] ^ soc_eth_core_mac_crc32_checker_crc_last[28]) ^ soc_eth_core_mac_crc32_checker_crc_data1[3]) ^ soc_eth_core_mac_crc32_checker_crc_last[27]) ^ soc_eth_core_mac_crc32_checker_crc_data1[4]) ^ soc_eth_core_mac_crc32_checker_crc_last[24]) ^ soc_eth_core_mac_crc32_checker_crc_last[30]) ^ soc_eth_core_mac_crc32_checker_crc_data1[1]) ^ soc_eth_core_mac_crc32_checker_crc_data1[7]);
	soc_eth_core_mac_crc32_checker_crc_next[27] <= ((((((((soc_eth_core_mac_crc32_checker_crc_last[19] ^ soc_eth_core_mac_crc32_checker_crc_last[29]) ^ soc_eth_core_mac_crc32_checker_crc_data1[2]) ^ soc_eth_core_mac_crc32_checker_crc_last[28]) ^ soc_eth_core_mac_crc32_checker_crc_data1[3]) ^ soc_eth_core_mac_crc32_checker_crc_last[25]) ^ soc_eth_core_mac_crc32_checker_crc_last[31]) ^ soc_eth_core_mac_crc32_checker_crc_data1[0]) ^ soc_eth_core_mac_crc32_checker_crc_data1[6]);
	soc_eth_core_mac_crc32_checker_crc_next[28] <= ((((((soc_eth_core_mac_crc32_checker_crc_last[20] ^ soc_eth_core_mac_crc32_checker_crc_last[30]) ^ soc_eth_core_mac_crc32_checker_crc_data1[1]) ^ soc_eth_core_mac_crc32_checker_crc_last[29]) ^ soc_eth_core_mac_crc32_checker_crc_data1[2]) ^ soc_eth_core_mac_crc32_checker_crc_last[26]) ^ soc_eth_core_mac_crc32_checker_crc_data1[5]);
	soc_eth_core_mac_crc32_checker_crc_next[29] <= ((((((soc_eth_core_mac_crc32_checker_crc_last[21] ^ soc_eth_core_mac_crc32_checker_crc_last[31]) ^ soc_eth_core_mac_crc32_checker_crc_data1[0]) ^ soc_eth_core_mac_crc32_checker_crc_last[30]) ^ soc_eth_core_mac_crc32_checker_crc_data1[1]) ^ soc_eth_core_mac_crc32_checker_crc_last[27]) ^ soc_eth_core_mac_crc32_checker_crc_data1[4]);
	soc_eth_core_mac_crc32_checker_crc_next[30] <= ((((soc_eth_core_mac_crc32_checker_crc_last[22] ^ soc_eth_core_mac_crc32_checker_crc_last[31]) ^ soc_eth_core_mac_crc32_checker_crc_data1[0]) ^ soc_eth_core_mac_crc32_checker_crc_last[28]) ^ soc_eth_core_mac_crc32_checker_crc_data1[3]);
	soc_eth_core_mac_crc32_checker_crc_next[31] <= ((soc_eth_core_mac_crc32_checker_crc_last[23] ^ soc_eth_core_mac_crc32_checker_crc_last[29]) ^ soc_eth_core_mac_crc32_checker_crc_data1[2]);
end
assign soc_eth_core_mac_crc32_checker_syncfifo_syncfifo_din = {soc_eth_core_mac_crc32_checker_syncfifo_fifo_in_last, soc_eth_core_mac_crc32_checker_syncfifo_fifo_in_first, soc_eth_core_mac_crc32_checker_syncfifo_fifo_in_payload_error, soc_eth_core_mac_crc32_checker_syncfifo_fifo_in_payload_last_be, soc_eth_core_mac_crc32_checker_syncfifo_fifo_in_payload_data};
assign {soc_eth_core_mac_crc32_checker_syncfifo_fifo_out_last, soc_eth_core_mac_crc32_checker_syncfifo_fifo_out_first, soc_eth_core_mac_crc32_checker_syncfifo_fifo_out_payload_error, soc_eth_core_mac_crc32_checker_syncfifo_fifo_out_payload_last_be, soc_eth_core_mac_crc32_checker_syncfifo_fifo_out_payload_data} = soc_eth_core_mac_crc32_checker_syncfifo_syncfifo_dout;
assign soc_eth_core_mac_crc32_checker_syncfifo_sink_ready = soc_eth_core_mac_crc32_checker_syncfifo_syncfifo_writable;
assign soc_eth_core_mac_crc32_checker_syncfifo_syncfifo_we = soc_eth_core_mac_crc32_checker_syncfifo_sink_valid;
assign soc_eth_core_mac_crc32_checker_syncfifo_fifo_in_first = soc_eth_core_mac_crc32_checker_syncfifo_sink_first;
assign soc_eth_core_mac_crc32_checker_syncfifo_fifo_in_last = soc_eth_core_mac_crc32_checker_syncfifo_sink_last;
assign soc_eth_core_mac_crc32_checker_syncfifo_fifo_in_payload_data = soc_eth_core_mac_crc32_checker_syncfifo_sink_payload_data;
assign soc_eth_core_mac_crc32_checker_syncfifo_fifo_in_payload_last_be = soc_eth_core_mac_crc32_checker_syncfifo_sink_payload_last_be;
assign soc_eth_core_mac_crc32_checker_syncfifo_fifo_in_payload_error = soc_eth_core_mac_crc32_checker_syncfifo_sink_payload_error;
assign soc_eth_core_mac_crc32_checker_syncfifo_source_valid = soc_eth_core_mac_crc32_checker_syncfifo_syncfifo_readable;
assign soc_eth_core_mac_crc32_checker_syncfifo_source_first = soc_eth_core_mac_crc32_checker_syncfifo_fifo_out_first;
assign soc_eth_core_mac_crc32_checker_syncfifo_source_last = soc_eth_core_mac_crc32_checker_syncfifo_fifo_out_last;
assign soc_eth_core_mac_crc32_checker_syncfifo_source_payload_data = soc_eth_core_mac_crc32_checker_syncfifo_fifo_out_payload_data;
assign soc_eth_core_mac_crc32_checker_syncfifo_source_payload_last_be = soc_eth_core_mac_crc32_checker_syncfifo_fifo_out_payload_last_be;
assign soc_eth_core_mac_crc32_checker_syncfifo_source_payload_error = soc_eth_core_mac_crc32_checker_syncfifo_fifo_out_payload_error;
assign soc_eth_core_mac_crc32_checker_syncfifo_syncfifo_re = soc_eth_core_mac_crc32_checker_syncfifo_source_ready;
always @(*) begin
	soc_eth_core_mac_crc32_checker_syncfifo_wrport_adr <= 3'd0;
	if (soc_eth_core_mac_crc32_checker_syncfifo_replace) begin
		soc_eth_core_mac_crc32_checker_syncfifo_wrport_adr <= (soc_eth_core_mac_crc32_checker_syncfifo_produce - 1'd1);
	end else begin
		soc_eth_core_mac_crc32_checker_syncfifo_wrport_adr <= soc_eth_core_mac_crc32_checker_syncfifo_produce;
	end
end
assign soc_eth_core_mac_crc32_checker_syncfifo_wrport_dat_w = soc_eth_core_mac_crc32_checker_syncfifo_syncfifo_din;
assign soc_eth_core_mac_crc32_checker_syncfifo_wrport_we = (soc_eth_core_mac_crc32_checker_syncfifo_syncfifo_we & (soc_eth_core_mac_crc32_checker_syncfifo_syncfifo_writable | soc_eth_core_mac_crc32_checker_syncfifo_replace));
assign soc_eth_core_mac_crc32_checker_syncfifo_do_read = (soc_eth_core_mac_crc32_checker_syncfifo_syncfifo_readable & soc_eth_core_mac_crc32_checker_syncfifo_syncfifo_re);
assign soc_eth_core_mac_crc32_checker_syncfifo_rdport_adr = soc_eth_core_mac_crc32_checker_syncfifo_consume;
assign soc_eth_core_mac_crc32_checker_syncfifo_syncfifo_dout = soc_eth_core_mac_crc32_checker_syncfifo_rdport_dat_r;
assign soc_eth_core_mac_crc32_checker_syncfifo_syncfifo_writable = (soc_eth_core_mac_crc32_checker_syncfifo_level != 3'd5);
assign soc_eth_core_mac_crc32_checker_syncfifo_syncfifo_readable = (soc_eth_core_mac_crc32_checker_syncfifo_level != 1'd0);
always @(*) begin
	soc_eth_core_mac_crc32_checker_crc_reset <= 1'd0;
	soc_eth_core_mac_crc32_checker_fifo_reset <= 1'd0;
	vns_liteethudpipcore_liteethmac_liteethmaccrc32checker_next_state <= 2'd0;
	soc_eth_core_mac_crc32_checker_crc_ce <= 1'd0;
	vns_liteethudpipcore_liteethmac_liteethmaccrc32checker_next_state <= vns_liteethudpipcore_liteethmac_liteethmaccrc32checker_state;
	case (vns_liteethudpipcore_liteethmac_liteethmaccrc32checker_state)
		1'd1: begin
			if ((soc_eth_core_mac_crc32_checker_sink_sink_valid & soc_eth_core_mac_crc32_checker_sink_sink_ready)) begin
				soc_eth_core_mac_crc32_checker_crc_ce <= 1'd1;
				vns_liteethudpipcore_liteethmac_liteethmaccrc32checker_next_state <= 2'd2;
			end
		end
		2'd2: begin
			if ((soc_eth_core_mac_crc32_checker_sink_sink_valid & soc_eth_core_mac_crc32_checker_sink_sink_ready)) begin
				soc_eth_core_mac_crc32_checker_crc_ce <= 1'd1;
				if (soc_eth_core_mac_crc32_checker_sink_sink_last) begin
					vns_liteethudpipcore_liteethmac_liteethmaccrc32checker_next_state <= 1'd0;
				end
			end
		end
		default: begin
			soc_eth_core_mac_crc32_checker_crc_reset <= 1'd1;
			soc_eth_core_mac_crc32_checker_fifo_reset <= 1'd1;
			vns_liteethudpipcore_liteethmac_liteethmaccrc32checker_next_state <= 1'd1;
		end
	endcase
end
assign soc_eth_core_mac_ps_preamble_error_o = (soc_eth_core_mac_ps_preamble_error_toggle_o ^ soc_eth_core_mac_ps_preamble_error_toggle_o_r);
assign soc_eth_core_mac_ps_crc_error_o = (soc_eth_core_mac_ps_crc_error_toggle_o ^ soc_eth_core_mac_ps_crc_error_toggle_o_r);
assign soc_eth_core_mac_padding_inserter_counter_done = (soc_eth_core_mac_padding_inserter_counter >= 6'd59);
always @(*) begin
	soc_eth_core_mac_padding_inserter_sink_ready <= 1'd0;
	soc_eth_core_mac_padding_inserter_counter_ce <= 1'd0;
	soc_eth_core_mac_padding_inserter_source_valid <= 1'd0;
	soc_eth_core_mac_padding_inserter_source_first <= 1'd0;
	soc_eth_core_mac_padding_inserter_source_last <= 1'd0;
	soc_eth_core_mac_padding_inserter_source_payload_data <= 8'd0;
	soc_eth_core_mac_padding_inserter_source_payload_last_be <= 1'd0;
	soc_eth_core_mac_padding_inserter_source_payload_error <= 1'd0;
	vns_liteethudpipcore_liteethmac_liteethmacpaddinginserter_next_state <= 1'd0;
	soc_eth_core_mac_padding_inserter_counter_reset <= 1'd0;
	vns_liteethudpipcore_liteethmac_liteethmacpaddinginserter_next_state <= vns_liteethudpipcore_liteethmac_liteethmacpaddinginserter_state;
	case (vns_liteethudpipcore_liteethmac_liteethmacpaddinginserter_state)
		1'd1: begin
			soc_eth_core_mac_padding_inserter_source_valid <= 1'd1;
			soc_eth_core_mac_padding_inserter_source_last <= soc_eth_core_mac_padding_inserter_counter_done;
			soc_eth_core_mac_padding_inserter_source_payload_data <= 1'd0;
			if ((soc_eth_core_mac_padding_inserter_source_valid & soc_eth_core_mac_padding_inserter_source_ready)) begin
				soc_eth_core_mac_padding_inserter_counter_ce <= 1'd1;
				if (soc_eth_core_mac_padding_inserter_counter_done) begin
					soc_eth_core_mac_padding_inserter_counter_reset <= 1'd1;
					vns_liteethudpipcore_liteethmac_liteethmacpaddinginserter_next_state <= 1'd0;
				end
			end
		end
		default: begin
			soc_eth_core_mac_padding_inserter_source_valid <= soc_eth_core_mac_padding_inserter_sink_valid;
			soc_eth_core_mac_padding_inserter_sink_ready <= soc_eth_core_mac_padding_inserter_source_ready;
			soc_eth_core_mac_padding_inserter_source_first <= soc_eth_core_mac_padding_inserter_sink_first;
			soc_eth_core_mac_padding_inserter_source_last <= soc_eth_core_mac_padding_inserter_sink_last;
			soc_eth_core_mac_padding_inserter_source_payload_data <= soc_eth_core_mac_padding_inserter_sink_payload_data;
			soc_eth_core_mac_padding_inserter_source_payload_last_be <= soc_eth_core_mac_padding_inserter_sink_payload_last_be;
			soc_eth_core_mac_padding_inserter_source_payload_error <= soc_eth_core_mac_padding_inserter_sink_payload_error;
			if ((soc_eth_core_mac_padding_inserter_source_valid & soc_eth_core_mac_padding_inserter_source_ready)) begin
				soc_eth_core_mac_padding_inserter_counter_ce <= 1'd1;
				if (soc_eth_core_mac_padding_inserter_sink_last) begin
					if ((~soc_eth_core_mac_padding_inserter_counter_done)) begin
						soc_eth_core_mac_padding_inserter_source_last <= 1'd0;
						vns_liteethudpipcore_liteethmac_liteethmacpaddinginserter_next_state <= 1'd1;
					end else begin
						soc_eth_core_mac_padding_inserter_counter_reset <= 1'd1;
					end
				end
			end
		end
	endcase
end
assign soc_eth_core_mac_padding_checker_source_valid = soc_eth_core_mac_padding_checker_sink_valid;
assign soc_eth_core_mac_padding_checker_sink_ready = soc_eth_core_mac_padding_checker_source_ready;
assign soc_eth_core_mac_padding_checker_source_first = soc_eth_core_mac_padding_checker_sink_first;
assign soc_eth_core_mac_padding_checker_source_last = soc_eth_core_mac_padding_checker_sink_last;
assign soc_eth_core_mac_padding_checker_source_payload_data = soc_eth_core_mac_padding_checker_sink_payload_data;
assign soc_eth_core_mac_padding_checker_source_payload_last_be = soc_eth_core_mac_padding_checker_sink_payload_last_be;
assign soc_eth_core_mac_padding_checker_source_payload_error = soc_eth_core_mac_padding_checker_sink_payload_error;
assign soc_eth_core_mac_tx_cdc_asyncfifo_din = {soc_eth_core_mac_tx_cdc_fifo_in_last, soc_eth_core_mac_tx_cdc_fifo_in_first, soc_eth_core_mac_tx_cdc_fifo_in_payload_error, soc_eth_core_mac_tx_cdc_fifo_in_payload_last_be, soc_eth_core_mac_tx_cdc_fifo_in_payload_data};
assign {soc_eth_core_mac_tx_cdc_fifo_out_last, soc_eth_core_mac_tx_cdc_fifo_out_first, soc_eth_core_mac_tx_cdc_fifo_out_payload_error, soc_eth_core_mac_tx_cdc_fifo_out_payload_last_be, soc_eth_core_mac_tx_cdc_fifo_out_payload_data} = soc_eth_core_mac_tx_cdc_asyncfifo_dout;
assign soc_eth_core_mac_tx_cdc_sink_ready = soc_eth_core_mac_tx_cdc_asyncfifo_writable;
assign soc_eth_core_mac_tx_cdc_asyncfifo_we = soc_eth_core_mac_tx_cdc_sink_valid;
assign soc_eth_core_mac_tx_cdc_fifo_in_first = soc_eth_core_mac_tx_cdc_sink_first;
assign soc_eth_core_mac_tx_cdc_fifo_in_last = soc_eth_core_mac_tx_cdc_sink_last;
assign soc_eth_core_mac_tx_cdc_fifo_in_payload_data = soc_eth_core_mac_tx_cdc_sink_payload_data;
assign soc_eth_core_mac_tx_cdc_fifo_in_payload_last_be = soc_eth_core_mac_tx_cdc_sink_payload_last_be;
assign soc_eth_core_mac_tx_cdc_fifo_in_payload_error = soc_eth_core_mac_tx_cdc_sink_payload_error;
assign soc_eth_core_mac_tx_cdc_source_valid = soc_eth_core_mac_tx_cdc_asyncfifo_readable;
assign soc_eth_core_mac_tx_cdc_source_first = soc_eth_core_mac_tx_cdc_fifo_out_first;
assign soc_eth_core_mac_tx_cdc_source_last = soc_eth_core_mac_tx_cdc_fifo_out_last;
assign soc_eth_core_mac_tx_cdc_source_payload_data = soc_eth_core_mac_tx_cdc_fifo_out_payload_data;
assign soc_eth_core_mac_tx_cdc_source_payload_last_be = soc_eth_core_mac_tx_cdc_fifo_out_payload_last_be;
assign soc_eth_core_mac_tx_cdc_source_payload_error = soc_eth_core_mac_tx_cdc_fifo_out_payload_error;
assign soc_eth_core_mac_tx_cdc_asyncfifo_re = soc_eth_core_mac_tx_cdc_source_ready;
assign soc_eth_core_mac_tx_cdc_graycounter0_ce = (soc_eth_core_mac_tx_cdc_asyncfifo_writable & soc_eth_core_mac_tx_cdc_asyncfifo_we);
assign soc_eth_core_mac_tx_cdc_graycounter1_ce = (soc_eth_core_mac_tx_cdc_asyncfifo_readable & soc_eth_core_mac_tx_cdc_asyncfifo_re);
assign soc_eth_core_mac_tx_cdc_asyncfifo_writable = (((soc_eth_core_mac_tx_cdc_graycounter0_q[6] == soc_eth_core_mac_tx_cdc_consume_wdomain[6]) | (soc_eth_core_mac_tx_cdc_graycounter0_q[5] == soc_eth_core_mac_tx_cdc_consume_wdomain[5])) | (soc_eth_core_mac_tx_cdc_graycounter0_q[4:0] != soc_eth_core_mac_tx_cdc_consume_wdomain[4:0]));
assign soc_eth_core_mac_tx_cdc_asyncfifo_readable = (soc_eth_core_mac_tx_cdc_graycounter1_q != soc_eth_core_mac_tx_cdc_produce_rdomain);
assign soc_eth_core_mac_tx_cdc_wrport_adr = soc_eth_core_mac_tx_cdc_graycounter0_q_binary[5:0];
assign soc_eth_core_mac_tx_cdc_wrport_dat_w = soc_eth_core_mac_tx_cdc_asyncfifo_din;
assign soc_eth_core_mac_tx_cdc_wrport_we = soc_eth_core_mac_tx_cdc_graycounter0_ce;
assign soc_eth_core_mac_tx_cdc_rdport_adr = soc_eth_core_mac_tx_cdc_graycounter1_q_next_binary[5:0];
assign soc_eth_core_mac_tx_cdc_asyncfifo_dout = soc_eth_core_mac_tx_cdc_rdport_dat_r;
always @(*) begin
	soc_eth_core_mac_tx_cdc_graycounter0_q_next_binary <= 7'd0;
	if (soc_eth_core_mac_tx_cdc_graycounter0_ce) begin
		soc_eth_core_mac_tx_cdc_graycounter0_q_next_binary <= (soc_eth_core_mac_tx_cdc_graycounter0_q_binary + 1'd1);
	end else begin
		soc_eth_core_mac_tx_cdc_graycounter0_q_next_binary <= soc_eth_core_mac_tx_cdc_graycounter0_q_binary;
	end
end
assign soc_eth_core_mac_tx_cdc_graycounter0_q_next = (soc_eth_core_mac_tx_cdc_graycounter0_q_next_binary ^ soc_eth_core_mac_tx_cdc_graycounter0_q_next_binary[6:1]);
always @(*) begin
	soc_eth_core_mac_tx_cdc_graycounter1_q_next_binary <= 7'd0;
	if (soc_eth_core_mac_tx_cdc_graycounter1_ce) begin
		soc_eth_core_mac_tx_cdc_graycounter1_q_next_binary <= (soc_eth_core_mac_tx_cdc_graycounter1_q_binary + 1'd1);
	end else begin
		soc_eth_core_mac_tx_cdc_graycounter1_q_next_binary <= soc_eth_core_mac_tx_cdc_graycounter1_q_binary;
	end
end
assign soc_eth_core_mac_tx_cdc_graycounter1_q_next = (soc_eth_core_mac_tx_cdc_graycounter1_q_next_binary ^ soc_eth_core_mac_tx_cdc_graycounter1_q_next_binary[6:1]);
assign soc_eth_core_mac_rx_cdc_asyncfifo_din = {soc_eth_core_mac_rx_cdc_fifo_in_last, soc_eth_core_mac_rx_cdc_fifo_in_first, soc_eth_core_mac_rx_cdc_fifo_in_payload_error, soc_eth_core_mac_rx_cdc_fifo_in_payload_last_be, soc_eth_core_mac_rx_cdc_fifo_in_payload_data};
assign {soc_eth_core_mac_rx_cdc_fifo_out_last, soc_eth_core_mac_rx_cdc_fifo_out_first, soc_eth_core_mac_rx_cdc_fifo_out_payload_error, soc_eth_core_mac_rx_cdc_fifo_out_payload_last_be, soc_eth_core_mac_rx_cdc_fifo_out_payload_data} = soc_eth_core_mac_rx_cdc_asyncfifo_dout;
assign soc_eth_core_mac_rx_cdc_sink_ready = soc_eth_core_mac_rx_cdc_asyncfifo_writable;
assign soc_eth_core_mac_rx_cdc_asyncfifo_we = soc_eth_core_mac_rx_cdc_sink_valid;
assign soc_eth_core_mac_rx_cdc_fifo_in_first = soc_eth_core_mac_rx_cdc_sink_first;
assign soc_eth_core_mac_rx_cdc_fifo_in_last = soc_eth_core_mac_rx_cdc_sink_last;
assign soc_eth_core_mac_rx_cdc_fifo_in_payload_data = soc_eth_core_mac_rx_cdc_sink_payload_data;
assign soc_eth_core_mac_rx_cdc_fifo_in_payload_last_be = soc_eth_core_mac_rx_cdc_sink_payload_last_be;
assign soc_eth_core_mac_rx_cdc_fifo_in_payload_error = soc_eth_core_mac_rx_cdc_sink_payload_error;
assign soc_eth_core_mac_rx_cdc_source_valid = soc_eth_core_mac_rx_cdc_asyncfifo_readable;
assign soc_eth_core_mac_rx_cdc_source_first = soc_eth_core_mac_rx_cdc_fifo_out_first;
assign soc_eth_core_mac_rx_cdc_source_last = soc_eth_core_mac_rx_cdc_fifo_out_last;
assign soc_eth_core_mac_rx_cdc_source_payload_data = soc_eth_core_mac_rx_cdc_fifo_out_payload_data;
assign soc_eth_core_mac_rx_cdc_source_payload_last_be = soc_eth_core_mac_rx_cdc_fifo_out_payload_last_be;
assign soc_eth_core_mac_rx_cdc_source_payload_error = soc_eth_core_mac_rx_cdc_fifo_out_payload_error;
assign soc_eth_core_mac_rx_cdc_asyncfifo_re = soc_eth_core_mac_rx_cdc_source_ready;
assign soc_eth_core_mac_rx_cdc_graycounter0_ce = (soc_eth_core_mac_rx_cdc_asyncfifo_writable & soc_eth_core_mac_rx_cdc_asyncfifo_we);
assign soc_eth_core_mac_rx_cdc_graycounter1_ce = (soc_eth_core_mac_rx_cdc_asyncfifo_readable & soc_eth_core_mac_rx_cdc_asyncfifo_re);
assign soc_eth_core_mac_rx_cdc_asyncfifo_writable = (((soc_eth_core_mac_rx_cdc_graycounter0_q[6] == soc_eth_core_mac_rx_cdc_consume_wdomain[6]) | (soc_eth_core_mac_rx_cdc_graycounter0_q[5] == soc_eth_core_mac_rx_cdc_consume_wdomain[5])) | (soc_eth_core_mac_rx_cdc_graycounter0_q[4:0] != soc_eth_core_mac_rx_cdc_consume_wdomain[4:0]));
assign soc_eth_core_mac_rx_cdc_asyncfifo_readable = (soc_eth_core_mac_rx_cdc_graycounter1_q != soc_eth_core_mac_rx_cdc_produce_rdomain);
assign soc_eth_core_mac_rx_cdc_wrport_adr = soc_eth_core_mac_rx_cdc_graycounter0_q_binary[5:0];
assign soc_eth_core_mac_rx_cdc_wrport_dat_w = soc_eth_core_mac_rx_cdc_asyncfifo_din;
assign soc_eth_core_mac_rx_cdc_wrport_we = soc_eth_core_mac_rx_cdc_graycounter0_ce;
assign soc_eth_core_mac_rx_cdc_rdport_adr = soc_eth_core_mac_rx_cdc_graycounter1_q_next_binary[5:0];
assign soc_eth_core_mac_rx_cdc_asyncfifo_dout = soc_eth_core_mac_rx_cdc_rdport_dat_r;
always @(*) begin
	soc_eth_core_mac_rx_cdc_graycounter0_q_next_binary <= 7'd0;
	if (soc_eth_core_mac_rx_cdc_graycounter0_ce) begin
		soc_eth_core_mac_rx_cdc_graycounter0_q_next_binary <= (soc_eth_core_mac_rx_cdc_graycounter0_q_binary + 1'd1);
	end else begin
		soc_eth_core_mac_rx_cdc_graycounter0_q_next_binary <= soc_eth_core_mac_rx_cdc_graycounter0_q_binary;
	end
end
assign soc_eth_core_mac_rx_cdc_graycounter0_q_next = (soc_eth_core_mac_rx_cdc_graycounter0_q_next_binary ^ soc_eth_core_mac_rx_cdc_graycounter0_q_next_binary[6:1]);
always @(*) begin
	soc_eth_core_mac_rx_cdc_graycounter1_q_next_binary <= 7'd0;
	if (soc_eth_core_mac_rx_cdc_graycounter1_ce) begin
		soc_eth_core_mac_rx_cdc_graycounter1_q_next_binary <= (soc_eth_core_mac_rx_cdc_graycounter1_q_binary + 1'd1);
	end else begin
		soc_eth_core_mac_rx_cdc_graycounter1_q_next_binary <= soc_eth_core_mac_rx_cdc_graycounter1_q_binary;
	end
end
assign soc_eth_core_mac_rx_cdc_graycounter1_q_next = (soc_eth_core_mac_rx_cdc_graycounter1_q_next_binary ^ soc_eth_core_mac_rx_cdc_graycounter1_q_next_binary[6:1]);
assign soc_eth_core_mac_padding_inserter_sink_valid = soc_eth_core_mac_tx_cdc_source_valid;
assign soc_eth_core_mac_tx_cdc_source_ready = soc_eth_core_mac_padding_inserter_sink_ready;
assign soc_eth_core_mac_padding_inserter_sink_first = soc_eth_core_mac_tx_cdc_source_first;
assign soc_eth_core_mac_padding_inserter_sink_last = soc_eth_core_mac_tx_cdc_source_last;
assign soc_eth_core_mac_padding_inserter_sink_payload_data = soc_eth_core_mac_tx_cdc_source_payload_data;
assign soc_eth_core_mac_padding_inserter_sink_payload_last_be = soc_eth_core_mac_tx_cdc_source_payload_last_be;
assign soc_eth_core_mac_padding_inserter_sink_payload_error = soc_eth_core_mac_tx_cdc_source_payload_error;
assign soc_eth_core_mac_crc32_inserter_sink_valid = soc_eth_core_mac_padding_inserter_source_valid;
assign soc_eth_core_mac_padding_inserter_source_ready = soc_eth_core_mac_crc32_inserter_sink_ready;
assign soc_eth_core_mac_crc32_inserter_sink_first = soc_eth_core_mac_padding_inserter_source_first;
assign soc_eth_core_mac_crc32_inserter_sink_last = soc_eth_core_mac_padding_inserter_source_last;
assign soc_eth_core_mac_crc32_inserter_sink_payload_data = soc_eth_core_mac_padding_inserter_source_payload_data;
assign soc_eth_core_mac_crc32_inserter_sink_payload_last_be = soc_eth_core_mac_padding_inserter_source_payload_last_be;
assign soc_eth_core_mac_crc32_inserter_sink_payload_error = soc_eth_core_mac_padding_inserter_source_payload_error;
assign soc_eth_core_mac_preamble_inserter_sink_valid = soc_eth_core_mac_crc32_inserter_source_valid;
assign soc_eth_core_mac_crc32_inserter_source_ready = soc_eth_core_mac_preamble_inserter_sink_ready;
assign soc_eth_core_mac_preamble_inserter_sink_first = soc_eth_core_mac_crc32_inserter_source_first;
assign soc_eth_core_mac_preamble_inserter_sink_last = soc_eth_core_mac_crc32_inserter_source_last;
assign soc_eth_core_mac_preamble_inserter_sink_payload_data = soc_eth_core_mac_crc32_inserter_source_payload_data;
assign soc_eth_core_mac_preamble_inserter_sink_payload_last_be = soc_eth_core_mac_crc32_inserter_source_payload_last_be;
assign soc_eth_core_mac_preamble_inserter_sink_payload_error = soc_eth_core_mac_crc32_inserter_source_payload_error;
assign soc_eth_core_mac_tx_gap_inserter_sink_valid = soc_eth_core_mac_preamble_inserter_source_valid;
assign soc_eth_core_mac_preamble_inserter_source_ready = soc_eth_core_mac_tx_gap_inserter_sink_ready;
assign soc_eth_core_mac_tx_gap_inserter_sink_first = soc_eth_core_mac_preamble_inserter_source_first;
assign soc_eth_core_mac_tx_gap_inserter_sink_last = soc_eth_core_mac_preamble_inserter_source_last;
assign soc_eth_core_mac_tx_gap_inserter_sink_payload_data = soc_eth_core_mac_preamble_inserter_source_payload_data;
assign soc_eth_core_mac_tx_gap_inserter_sink_payload_last_be = soc_eth_core_mac_preamble_inserter_source_payload_last_be;
assign soc_eth_core_mac_tx_gap_inserter_sink_payload_error = soc_eth_core_mac_preamble_inserter_source_payload_error;
assign soc_eth_phy_sink_valid = soc_eth_core_mac_tx_gap_inserter_source_valid;
assign soc_eth_core_mac_tx_gap_inserter_source_ready = soc_eth_phy_sink_ready;
assign soc_eth_phy_sink_first = soc_eth_core_mac_tx_gap_inserter_source_first;
assign soc_eth_phy_sink_last = soc_eth_core_mac_tx_gap_inserter_source_last;
assign soc_eth_phy_sink_payload_data = soc_eth_core_mac_tx_gap_inserter_source_payload_data;
assign soc_eth_phy_sink_payload_last_be = soc_eth_core_mac_tx_gap_inserter_source_payload_last_be;
assign soc_eth_phy_sink_payload_error = soc_eth_core_mac_tx_gap_inserter_source_payload_error;
assign soc_eth_core_mac_preamble_checker_sink_valid = soc_eth_phy_liteethphyrgmiirx_source_valid;
assign soc_eth_phy_liteethphyrgmiirx_source_ready = soc_eth_core_mac_preamble_checker_sink_ready;
assign soc_eth_core_mac_preamble_checker_sink_first = soc_eth_phy_liteethphyrgmiirx_source_first;
assign soc_eth_core_mac_preamble_checker_sink_last = soc_eth_phy_liteethphyrgmiirx_source_last;
assign soc_eth_core_mac_preamble_checker_sink_payload_data = soc_eth_phy_liteethphyrgmiirx_source_payload_data;
assign soc_eth_core_mac_preamble_checker_sink_payload_last_be = soc_eth_phy_liteethphyrgmiirx_source_payload_last_be;
assign soc_eth_core_mac_preamble_checker_sink_payload_error = soc_eth_phy_liteethphyrgmiirx_source_payload_error;
assign soc_eth_core_mac_crc32_checker_sink_sink_valid = soc_eth_core_mac_preamble_checker_source_valid;
assign soc_eth_core_mac_preamble_checker_source_ready = soc_eth_core_mac_crc32_checker_sink_sink_ready;
assign soc_eth_core_mac_crc32_checker_sink_sink_first = soc_eth_core_mac_preamble_checker_source_first;
assign soc_eth_core_mac_crc32_checker_sink_sink_last = soc_eth_core_mac_preamble_checker_source_last;
assign soc_eth_core_mac_crc32_checker_sink_sink_payload_data = soc_eth_core_mac_preamble_checker_source_payload_data;
assign soc_eth_core_mac_crc32_checker_sink_sink_payload_last_be = soc_eth_core_mac_preamble_checker_source_payload_last_be;
assign soc_eth_core_mac_crc32_checker_sink_sink_payload_error = soc_eth_core_mac_preamble_checker_source_payload_error;
assign soc_eth_core_mac_padding_checker_sink_valid = soc_eth_core_mac_crc32_checker_source_source_valid;
assign soc_eth_core_mac_crc32_checker_source_source_ready = soc_eth_core_mac_padding_checker_sink_ready;
assign soc_eth_core_mac_padding_checker_sink_first = soc_eth_core_mac_crc32_checker_source_source_first;
assign soc_eth_core_mac_padding_checker_sink_last = soc_eth_core_mac_crc32_checker_source_source_last;
assign soc_eth_core_mac_padding_checker_sink_payload_data = soc_eth_core_mac_crc32_checker_source_source_payload_data;
assign soc_eth_core_mac_padding_checker_sink_payload_last_be = soc_eth_core_mac_crc32_checker_source_source_payload_last_be;
assign soc_eth_core_mac_padding_checker_sink_payload_error = soc_eth_core_mac_crc32_checker_source_source_payload_error;
assign soc_eth_core_mac_rx_cdc_sink_valid = soc_eth_core_mac_padding_checker_source_valid;
assign soc_eth_core_mac_padding_checker_source_ready = soc_eth_core_mac_rx_cdc_sink_ready;
assign soc_eth_core_mac_rx_cdc_sink_first = soc_eth_core_mac_padding_checker_source_first;
assign soc_eth_core_mac_rx_cdc_sink_last = soc_eth_core_mac_padding_checker_source_last;
assign soc_eth_core_mac_rx_cdc_sink_payload_data = soc_eth_core_mac_padding_checker_source_payload_data;
assign soc_eth_core_mac_rx_cdc_sink_payload_last_be = soc_eth_core_mac_padding_checker_source_payload_last_be;
assign soc_eth_core_mac_rx_cdc_sink_payload_error = soc_eth_core_mac_padding_checker_source_payload_error;
always @(*) begin
	vns_liteethudpipcore_liteethmac_sel0 <= 2'd0;
	case (soc_eth_core_mac_crossbar_sink_payload_ethernet_type)
		12'd2048: begin
			vns_liteethudpipcore_liteethmac_sel0 <= 2'd2;
		end
		12'd2054: begin
			vns_liteethudpipcore_liteethmac_sel0 <= 1'd1;
		end
		default: begin
			vns_liteethudpipcore_liteethmac_sel0 <= 1'd0;
		end
	endcase
end
always @(*) begin
	vns_liteethudpipcore_liteethmac_request <= 2'd0;
	vns_liteethudpipcore_liteethmac_request[0] <= vns_liteethudpipcore_liteethmac_status0_ongoing0;
	vns_liteethudpipcore_liteethmac_request[1] <= vns_liteethudpipcore_liteethmac_status1_ongoing0;
end
always @(*) begin
	soc_eth_core_mac_crossbar_source_payload_last_be <= 1'd0;
	soc_eth_core_mac_crossbar_source_payload_error <= 1'd0;
	soc_eth_core_mac_crossbar_source_valid <= 1'd0;
	soc_eth_core_mac_crossbar_source_first <= 1'd0;
	soc_eth_core_arp_mac_port_sink_ready <= 1'd0;
	soc_eth_core_mac_crossbar_source_last <= 1'd0;
	soc_eth_core_mac_crossbar_source_payload_ethernet_type <= 16'd0;
	soc_eth_core_ip_mac_port_sink_ready <= 1'd0;
	soc_eth_core_mac_crossbar_source_payload_sender_mac <= 48'd0;
	soc_eth_core_mac_crossbar_source_payload_target_mac <= 48'd0;
	soc_eth_core_mac_crossbar_source_payload_data <= 8'd0;
	case (vns_liteethudpipcore_liteethmac_grant)
		1'd0: begin
			soc_eth_core_mac_crossbar_source_valid <= soc_eth_core_arp_mac_port_sink_valid;
			soc_eth_core_arp_mac_port_sink_ready <= soc_eth_core_mac_crossbar_source_ready;
			soc_eth_core_mac_crossbar_source_first <= soc_eth_core_arp_mac_port_sink_first;
			soc_eth_core_mac_crossbar_source_last <= soc_eth_core_arp_mac_port_sink_last;
			soc_eth_core_mac_crossbar_source_payload_ethernet_type <= soc_eth_core_arp_mac_port_sink_payload_ethernet_type;
			soc_eth_core_mac_crossbar_source_payload_sender_mac <= soc_eth_core_arp_mac_port_sink_payload_sender_mac;
			soc_eth_core_mac_crossbar_source_payload_target_mac <= soc_eth_core_arp_mac_port_sink_payload_target_mac;
			soc_eth_core_mac_crossbar_source_payload_data <= soc_eth_core_arp_mac_port_sink_payload_data;
			soc_eth_core_mac_crossbar_source_payload_last_be <= soc_eth_core_arp_mac_port_sink_payload_last_be;
			soc_eth_core_mac_crossbar_source_payload_error <= soc_eth_core_arp_mac_port_sink_payload_error;
		end
		1'd1: begin
			soc_eth_core_mac_crossbar_source_valid <= soc_eth_core_ip_mac_port_sink_valid;
			soc_eth_core_ip_mac_port_sink_ready <= soc_eth_core_mac_crossbar_source_ready;
			soc_eth_core_mac_crossbar_source_first <= soc_eth_core_ip_mac_port_sink_first;
			soc_eth_core_mac_crossbar_source_last <= soc_eth_core_ip_mac_port_sink_last;
			soc_eth_core_mac_crossbar_source_payload_ethernet_type <= soc_eth_core_ip_mac_port_sink_payload_ethernet_type;
			soc_eth_core_mac_crossbar_source_payload_sender_mac <= soc_eth_core_ip_mac_port_sink_payload_sender_mac;
			soc_eth_core_mac_crossbar_source_payload_target_mac <= soc_eth_core_ip_mac_port_sink_payload_target_mac;
			soc_eth_core_mac_crossbar_source_payload_data <= soc_eth_core_ip_mac_port_sink_payload_data;
			soc_eth_core_mac_crossbar_source_payload_last_be <= soc_eth_core_ip_mac_port_sink_payload_last_be;
			soc_eth_core_mac_crossbar_source_payload_error <= soc_eth_core_ip_mac_port_sink_payload_error;
		end
	endcase
end
always @(*) begin
	vns_liteethudpipcore_liteethmac_status0_last <= 1'd0;
	if (soc_eth_core_arp_mac_port_sink_valid) begin
		vns_liteethudpipcore_liteethmac_status0_last <= (soc_eth_core_arp_mac_port_sink_last & soc_eth_core_arp_mac_port_sink_ready);
	end
end
assign vns_liteethudpipcore_liteethmac_status0_ongoing0 = ((soc_eth_core_arp_mac_port_sink_valid | vns_liteethudpipcore_liteethmac_status0_ongoing1) & (~vns_liteethudpipcore_liteethmac_status0_last));
always @(*) begin
	vns_liteethudpipcore_liteethmac_status1_last <= 1'd0;
	if (soc_eth_core_ip_mac_port_sink_valid) begin
		vns_liteethudpipcore_liteethmac_status1_last <= (soc_eth_core_ip_mac_port_sink_last & soc_eth_core_ip_mac_port_sink_ready);
	end
end
assign vns_liteethudpipcore_liteethmac_status1_ongoing0 = ((soc_eth_core_ip_mac_port_sink_valid | vns_liteethudpipcore_liteethmac_status1_ongoing1) & (~vns_liteethudpipcore_liteethmac_status1_last));
always @(*) begin
	vns_liteethudpipcore_liteethmac_sel1 <= 2'd0;
	if (vns_liteethudpipcore_liteethmac_first) begin
		vns_liteethudpipcore_liteethmac_sel1 <= vns_liteethudpipcore_liteethmac_sel0;
	end else begin
		vns_liteethudpipcore_liteethmac_sel1 <= vns_liteethudpipcore_liteethmac_sel_ongoing;
	end
end
always @(*) begin
	soc_eth_core_ip_mac_port_source_payload_last_be <= 1'd0;
	soc_eth_core_ip_mac_port_source_payload_error <= 1'd0;
	soc_eth_core_mac_crossbar_sink_ready <= 1'd0;
	soc_eth_core_arp_mac_port_source_valid <= 1'd0;
	soc_eth_core_arp_mac_port_source_first <= 1'd0;
	soc_eth_core_arp_mac_port_source_last <= 1'd0;
	soc_eth_core_arp_mac_port_source_payload_ethernet_type <= 16'd0;
	soc_eth_core_ip_mac_port_source_valid <= 1'd0;
	soc_eth_core_arp_mac_port_source_payload_sender_mac <= 48'd0;
	soc_eth_core_arp_mac_port_source_payload_target_mac <= 48'd0;
	soc_eth_core_ip_mac_port_source_first <= 1'd0;
	soc_eth_core_arp_mac_port_source_payload_data <= 8'd0;
	soc_eth_core_ip_mac_port_source_last <= 1'd0;
	soc_eth_core_arp_mac_port_source_payload_last_be <= 1'd0;
	soc_eth_core_ip_mac_port_source_payload_ethernet_type <= 16'd0;
	soc_eth_core_arp_mac_port_source_payload_error <= 1'd0;
	soc_eth_core_ip_mac_port_source_payload_sender_mac <= 48'd0;
	soc_eth_core_ip_mac_port_source_payload_target_mac <= 48'd0;
	soc_eth_core_ip_mac_port_source_payload_data <= 8'd0;
	case (vns_liteethudpipcore_liteethmac_sel1)
		1'd1: begin
			soc_eth_core_arp_mac_port_source_valid <= soc_eth_core_mac_crossbar_sink_valid;
			soc_eth_core_mac_crossbar_sink_ready <= soc_eth_core_arp_mac_port_source_ready;
			soc_eth_core_arp_mac_port_source_first <= soc_eth_core_mac_crossbar_sink_first;
			soc_eth_core_arp_mac_port_source_last <= soc_eth_core_mac_crossbar_sink_last;
			soc_eth_core_arp_mac_port_source_payload_ethernet_type <= soc_eth_core_mac_crossbar_sink_payload_ethernet_type;
			soc_eth_core_arp_mac_port_source_payload_sender_mac <= soc_eth_core_mac_crossbar_sink_payload_sender_mac;
			soc_eth_core_arp_mac_port_source_payload_target_mac <= soc_eth_core_mac_crossbar_sink_payload_target_mac;
			soc_eth_core_arp_mac_port_source_payload_data <= soc_eth_core_mac_crossbar_sink_payload_data;
			soc_eth_core_arp_mac_port_source_payload_last_be <= soc_eth_core_mac_crossbar_sink_payload_last_be;
			soc_eth_core_arp_mac_port_source_payload_error <= soc_eth_core_mac_crossbar_sink_payload_error;
		end
		2'd2: begin
			soc_eth_core_ip_mac_port_source_valid <= soc_eth_core_mac_crossbar_sink_valid;
			soc_eth_core_mac_crossbar_sink_ready <= soc_eth_core_ip_mac_port_source_ready;
			soc_eth_core_ip_mac_port_source_first <= soc_eth_core_mac_crossbar_sink_first;
			soc_eth_core_ip_mac_port_source_last <= soc_eth_core_mac_crossbar_sink_last;
			soc_eth_core_ip_mac_port_source_payload_ethernet_type <= soc_eth_core_mac_crossbar_sink_payload_ethernet_type;
			soc_eth_core_ip_mac_port_source_payload_sender_mac <= soc_eth_core_mac_crossbar_sink_payload_sender_mac;
			soc_eth_core_ip_mac_port_source_payload_target_mac <= soc_eth_core_mac_crossbar_sink_payload_target_mac;
			soc_eth_core_ip_mac_port_source_payload_data <= soc_eth_core_mac_crossbar_sink_payload_data;
			soc_eth_core_ip_mac_port_source_payload_last_be <= soc_eth_core_mac_crossbar_sink_payload_last_be;
			soc_eth_core_ip_mac_port_source_payload_error <= soc_eth_core_mac_crossbar_sink_payload_error;
		end
		default: begin
			soc_eth_core_mac_crossbar_sink_ready <= 1'd1;
		end
	endcase
end
always @(*) begin
	vns_liteethudpipcore_liteethmac_last <= 1'd0;
	if (soc_eth_core_mac_crossbar_sink_valid) begin
		vns_liteethudpipcore_liteethmac_last <= (soc_eth_core_mac_crossbar_sink_last & soc_eth_core_mac_crossbar_sink_ready);
	end
end
assign vns_liteethudpipcore_liteethmac_ongoing0 = ((soc_eth_core_mac_crossbar_sink_valid | vns_liteethudpipcore_liteethmac_ongoing1) & (~vns_liteethudpipcore_liteethmac_last));
always @(*) begin
	soc_eth_core_mac_packetizer_header <= 112'd0;
	soc_eth_core_mac_packetizer_header[111:96] <= {soc_eth_core_mac_packetizer_sink_payload_ethernet_type[7:0], soc_eth_core_mac_packetizer_sink_payload_ethernet_type[15:8]};
	soc_eth_core_mac_packetizer_header[95:48] <= {soc_eth_core_mac_packetizer_sink_payload_sender_mac[7:0], soc_eth_core_mac_packetizer_sink_payload_sender_mac[15:8], soc_eth_core_mac_packetizer_sink_payload_sender_mac[23:16], soc_eth_core_mac_packetizer_sink_payload_sender_mac[31:24], soc_eth_core_mac_packetizer_sink_payload_sender_mac[39:32], soc_eth_core_mac_packetizer_sink_payload_sender_mac[47:40]};
	soc_eth_core_mac_packetizer_header[47:0] <= {soc_eth_core_mac_packetizer_sink_payload_target_mac[7:0], soc_eth_core_mac_packetizer_sink_payload_target_mac[15:8], soc_eth_core_mac_packetizer_sink_payload_target_mac[23:16], soc_eth_core_mac_packetizer_sink_payload_target_mac[31:24], soc_eth_core_mac_packetizer_sink_payload_target_mac[39:32], soc_eth_core_mac_packetizer_sink_payload_target_mac[47:40]};
end
assign soc_eth_core_mac_packetizer_source_payload_error = soc_eth_core_mac_packetizer_sink_payload_error;
assign soc_eth_core_mac_packetizer_source_payload_last_be = {soc_eth_core_mac_packetizer_sink_payload_last_be};
always @(*) begin
	soc_eth_core_mac_packetizer_count_liteethmacpacketizer_next_value0 <= 4'd0;
	soc_eth_core_mac_packetizer_sr_shift <= 1'd0;
	soc_eth_core_mac_packetizer_count_liteethmacpacketizer_next_value_ce0 <= 1'd0;
	soc_eth_core_mac_packetizer_fsm_from_idle_liteethmacpacketizer_next_value1 <= 1'd0;
	soc_eth_core_mac_packetizer_fsm_from_idle_liteethmacpacketizer_next_value_ce1 <= 1'd0;
	soc_eth_core_mac_packetizer_source_valid <= 1'd0;
	vns_liteethudpipcore_liteethmac_liteethmacpacketizer_next_state <= 2'd0;
	soc_eth_core_mac_packetizer_source_last <= 1'd0;
	soc_eth_core_mac_packetizer_source_payload_data <= 8'd0;
	soc_eth_core_mac_packetizer_sink_ready <= 1'd0;
	soc_eth_core_mac_packetizer_sr_load <= 1'd0;
	vns_liteethudpipcore_liteethmac_liteethmacpacketizer_next_state <= vns_liteethudpipcore_liteethmac_liteethmacpacketizer_state;
	case (vns_liteethudpipcore_liteethmac_liteethmacpacketizer_state)
		1'd1: begin
			soc_eth_core_mac_packetizer_source_valid <= 1'd1;
			soc_eth_core_mac_packetizer_source_last <= 1'd0;
			soc_eth_core_mac_packetizer_source_payload_data <= soc_eth_core_mac_packetizer_sr[111:8];
			if ((soc_eth_core_mac_packetizer_source_valid & soc_eth_core_mac_packetizer_source_ready)) begin
				soc_eth_core_mac_packetizer_sr_shift <= 1'd1;
				if ((soc_eth_core_mac_packetizer_count == 4'd13)) begin
					soc_eth_core_mac_packetizer_sr_shift <= 1'd0;
					if (1'd0) begin
						vns_liteethudpipcore_liteethmac_liteethmacpacketizer_next_state <= 2'd3;
						soc_eth_core_mac_packetizer_count_liteethmacpacketizer_next_value0 <= (soc_eth_core_mac_packetizer_count + 1'd1);
						soc_eth_core_mac_packetizer_count_liteethmacpacketizer_next_value_ce0 <= 1'd1;
					end else begin
						vns_liteethudpipcore_liteethmac_liteethmacpacketizer_next_state <= 2'd2;
					end
				end else begin
					soc_eth_core_mac_packetizer_count_liteethmacpacketizer_next_value0 <= (soc_eth_core_mac_packetizer_count + 1'd1);
					soc_eth_core_mac_packetizer_count_liteethmacpacketizer_next_value_ce0 <= 1'd1;
				end
			end
		end
		2'd2: begin
			soc_eth_core_mac_packetizer_source_valid <= soc_eth_core_mac_packetizer_sink_valid;
			soc_eth_core_mac_packetizer_source_last <= soc_eth_core_mac_packetizer_sink_last;
			soc_eth_core_mac_packetizer_source_payload_data <= soc_eth_core_mac_packetizer_sink_payload_data;
			if ((soc_eth_core_mac_packetizer_source_valid & soc_eth_core_mac_packetizer_source_ready)) begin
				soc_eth_core_mac_packetizer_sink_ready <= 1'd1;
				if (soc_eth_core_mac_packetizer_source_last) begin
					vns_liteethudpipcore_liteethmac_liteethmacpacketizer_next_state <= 1'd0;
				end
			end
		end
		2'd3: begin
			soc_eth_core_mac_packetizer_source_valid <= (soc_eth_core_mac_packetizer_sink_valid | soc_eth_core_mac_packetizer_sink_d_last);
			soc_eth_core_mac_packetizer_source_last <= soc_eth_core_mac_packetizer_sink_d_last;
			if (soc_eth_core_mac_packetizer_fsm_from_idle) begin
				soc_eth_core_mac_packetizer_source_payload_data[0] <= soc_eth_core_mac_packetizer_sr[111:16];
			end else begin
				soc_eth_core_mac_packetizer_source_payload_data[0] <= soc_eth_core_mac_packetizer_sink_d_payload_data[7];
			end
			soc_eth_core_mac_packetizer_source_payload_data[7:0] <= soc_eth_core_mac_packetizer_sink_payload_data;
			if ((soc_eth_core_mac_packetizer_source_valid & soc_eth_core_mac_packetizer_source_ready)) begin
				soc_eth_core_mac_packetizer_sink_ready <= (~soc_eth_core_mac_packetizer_source_last);
				soc_eth_core_mac_packetizer_fsm_from_idle_liteethmacpacketizer_next_value1 <= 1'd0;
				soc_eth_core_mac_packetizer_fsm_from_idle_liteethmacpacketizer_next_value_ce1 <= 1'd1;
				if (soc_eth_core_mac_packetizer_source_last) begin
					vns_liteethudpipcore_liteethmac_liteethmacpacketizer_next_state <= 1'd0;
				end
			end
		end
		default: begin
			soc_eth_core_mac_packetizer_sink_ready <= 1'd1;
			soc_eth_core_mac_packetizer_count_liteethmacpacketizer_next_value0 <= 1'd1;
			soc_eth_core_mac_packetizer_count_liteethmacpacketizer_next_value_ce0 <= 1'd1;
			if (soc_eth_core_mac_packetizer_sink_valid) begin
				soc_eth_core_mac_packetizer_sink_ready <= 1'd0;
				soc_eth_core_mac_packetizer_source_valid <= 1'd1;
				soc_eth_core_mac_packetizer_source_last <= 1'd0;
				soc_eth_core_mac_packetizer_source_payload_data <= soc_eth_core_mac_packetizer_header[7:0];
				if ((soc_eth_core_mac_packetizer_source_valid & soc_eth_core_mac_packetizer_source_ready)) begin
					soc_eth_core_mac_packetizer_sr_load <= 1'd1;
					soc_eth_core_mac_packetizer_fsm_from_idle_liteethmacpacketizer_next_value1 <= 1'd1;
					soc_eth_core_mac_packetizer_fsm_from_idle_liteethmacpacketizer_next_value_ce1 <= 1'd1;
					if (1'd0) begin
						if (1'd0) begin
							vns_liteethudpipcore_liteethmac_liteethmacpacketizer_next_state <= 2'd3;
						end else begin
							vns_liteethudpipcore_liteethmac_liteethmacpacketizer_next_state <= 2'd2;
						end
					end else begin
						vns_liteethudpipcore_liteethmac_liteethmacpacketizer_next_state <= 1'd1;
					end
				end
			end
		end
	endcase
end
assign soc_eth_core_mac_depacketizer_header = soc_eth_core_mac_depacketizer_sr;
assign soc_eth_core_mac_depacketizer_source_payload_ethernet_type = {vns_slice_proxy1[7:0], vns_slice_proxy0[15:8]};
assign soc_eth_core_mac_depacketizer_source_payload_sender_mac = {vns_slice_proxy7[7:0], vns_slice_proxy6[15:8], vns_slice_proxy5[23:16], vns_slice_proxy4[31:24], vns_slice_proxy3[39:32], vns_slice_proxy2[47:40]};
assign soc_eth_core_mac_depacketizer_source_payload_target_mac = {vns_slice_proxy13[7:0], vns_slice_proxy12[15:8], vns_slice_proxy11[23:16], vns_slice_proxy10[31:24], vns_slice_proxy9[39:32], vns_slice_proxy8[47:40]};
assign soc_eth_core_mac_depacketizer_source_payload_error = soc_eth_core_mac_depacketizer_sink_payload_error;
assign soc_eth_core_mac_depacketizer_source_payload_last_be = {soc_eth_core_mac_depacketizer_sink_payload_last_be};
always @(*) begin
	soc_eth_core_mac_depacketizer_source_last <= 1'd0;
	soc_eth_core_mac_depacketizer_source_payload_data <= 8'd0;
	vns_liteethudpipcore_liteethmac_liteethmacdepacketizer_next_state <= 2'd0;
	soc_eth_core_mac_depacketizer_count_liteethmacdepacketizer_next_value0 <= 4'd0;
	soc_eth_core_mac_depacketizer_count_liteethmacdepacketizer_next_value_ce0 <= 1'd0;
	soc_eth_core_mac_depacketizer_sink_ready <= 1'd0;
	soc_eth_core_mac_depacketizer_fsm_from_idle_liteethmacdepacketizer_next_value1 <= 1'd0;
	soc_eth_core_mac_depacketizer_sr_shift <= 1'd0;
	soc_eth_core_mac_depacketizer_fsm_from_idle_liteethmacdepacketizer_next_value_ce1 <= 1'd0;
	soc_eth_core_mac_depacketizer_sr_shift_leftover <= 1'd0;
	soc_eth_core_mac_depacketizer_source_valid <= 1'd0;
	vns_liteethudpipcore_liteethmac_liteethmacdepacketizer_next_state <= vns_liteethudpipcore_liteethmac_liteethmacdepacketizer_state;
	case (vns_liteethudpipcore_liteethmac_liteethmacdepacketizer_state)
		1'd1: begin
			soc_eth_core_mac_depacketizer_sink_ready <= 1'd1;
			if (soc_eth_core_mac_depacketizer_sink_valid) begin
				soc_eth_core_mac_depacketizer_count_liteethmacdepacketizer_next_value0 <= (soc_eth_core_mac_depacketizer_count + 1'd1);
				soc_eth_core_mac_depacketizer_count_liteethmacdepacketizer_next_value_ce0 <= 1'd1;
				soc_eth_core_mac_depacketizer_sr_shift <= 1'd1;
				if ((soc_eth_core_mac_depacketizer_count == 4'd13)) begin
					if (1'd0) begin
						soc_eth_core_mac_depacketizer_count_liteethmacdepacketizer_next_value0 <= (soc_eth_core_mac_depacketizer_count + 1'd1);
						soc_eth_core_mac_depacketizer_count_liteethmacdepacketizer_next_value_ce0 <= 1'd1;
						vns_liteethudpipcore_liteethmac_liteethmacdepacketizer_next_state <= 2'd2;
					end else begin
						vns_liteethudpipcore_liteethmac_liteethmacdepacketizer_next_state <= 2'd3;
					end
				end
			end
		end
		2'd2: begin
			soc_eth_core_mac_depacketizer_source_valid <= (soc_eth_core_mac_depacketizer_sink_valid | soc_eth_core_mac_depacketizer_sink_d_last);
			soc_eth_core_mac_depacketizer_source_last <= (soc_eth_core_mac_depacketizer_sink_last | soc_eth_core_mac_depacketizer_sink_d_last);
			soc_eth_core_mac_depacketizer_sink_ready <= soc_eth_core_mac_depacketizer_source_ready;
			soc_eth_core_mac_depacketizer_source_payload_data <= soc_eth_core_mac_depacketizer_sink_d_payload_data[7:0];
			soc_eth_core_mac_depacketizer_source_payload_data[7] <= soc_eth_core_mac_depacketizer_sink_payload_data;
			if (soc_eth_core_mac_depacketizer_fsm_from_idle) begin
				soc_eth_core_mac_depacketizer_source_valid <= soc_eth_core_mac_depacketizer_sink_d_last;
				soc_eth_core_mac_depacketizer_sink_ready <= 1'd1;
				if (soc_eth_core_mac_depacketizer_sink_valid) begin
					soc_eth_core_mac_depacketizer_fsm_from_idle_liteethmacdepacketizer_next_value1 <= 1'd0;
					soc_eth_core_mac_depacketizer_fsm_from_idle_liteethmacdepacketizer_next_value_ce1 <= 1'd1;
					soc_eth_core_mac_depacketizer_sr_shift_leftover <= 1'd1;
				end
			end
			if ((soc_eth_core_mac_depacketizer_source_valid & soc_eth_core_mac_depacketizer_source_ready)) begin
				if (soc_eth_core_mac_depacketizer_source_last) begin
					vns_liteethudpipcore_liteethmac_liteethmacdepacketizer_next_state <= 1'd0;
				end
			end
		end
		2'd3: begin
			soc_eth_core_mac_depacketizer_source_valid <= (soc_eth_core_mac_depacketizer_sink_valid | soc_eth_core_mac_depacketizer_sink_d_last);
			soc_eth_core_mac_depacketizer_source_last <= (soc_eth_core_mac_depacketizer_sink_last | soc_eth_core_mac_depacketizer_sink_d_last);
			soc_eth_core_mac_depacketizer_sink_ready <= soc_eth_core_mac_depacketizer_source_ready;
			soc_eth_core_mac_depacketizer_source_payload_data <= soc_eth_core_mac_depacketizer_sink_payload_data;
			if ((soc_eth_core_mac_depacketizer_source_valid & soc_eth_core_mac_depacketizer_source_ready)) begin
				if (soc_eth_core_mac_depacketizer_source_last) begin
					vns_liteethudpipcore_liteethmac_liteethmacdepacketizer_next_state <= 1'd0;
				end
			end
		end
		default: begin
			soc_eth_core_mac_depacketizer_sink_ready <= 1'd1;
			soc_eth_core_mac_depacketizer_count_liteethmacdepacketizer_next_value0 <= 1'd1;
			soc_eth_core_mac_depacketizer_count_liteethmacdepacketizer_next_value_ce0 <= 1'd1;
			if (soc_eth_core_mac_depacketizer_sink_valid) begin
				soc_eth_core_mac_depacketizer_sr_shift <= 1'd1;
				soc_eth_core_mac_depacketizer_fsm_from_idle_liteethmacdepacketizer_next_value1 <= 1'd1;
				soc_eth_core_mac_depacketizer_fsm_from_idle_liteethmacdepacketizer_next_value_ce1 <= 1'd1;
				if (1'd0) begin
					if (1'd0) begin
						vns_liteethudpipcore_liteethmac_liteethmacdepacketizer_next_state <= 2'd2;
					end else begin
						vns_liteethudpipcore_liteethmac_liteethmacdepacketizer_next_state <= 2'd3;
					end
				end else begin
					vns_liteethudpipcore_liteethmac_liteethmacdepacketizer_next_state <= 1'd1;
				end
			end
		end
	endcase
end
assign soc_eth_core_arp_table_sink_valid = soc_eth_core_arp_rx_source_source_valid;
assign soc_eth_core_arp_rx_source_source_ready = soc_eth_core_arp_table_sink_ready;
assign soc_eth_core_arp_table_sink_first = soc_eth_core_arp_rx_source_source_first;
assign soc_eth_core_arp_table_sink_last = soc_eth_core_arp_rx_source_source_last;
assign soc_eth_core_arp_table_sink_payload_reply = soc_eth_core_arp_rx_source_source_payload_reply;
assign soc_eth_core_arp_table_sink_payload_request = soc_eth_core_arp_rx_source_source_payload_request;
assign soc_eth_core_arp_table_sink_payload_ip_address = soc_eth_core_arp_rx_source_source_payload_ip_address;
assign soc_eth_core_arp_table_sink_payload_mac_address = soc_eth_core_arp_rx_source_source_payload_mac_address;
assign soc_eth_core_arp_tx_sink_sink_valid = soc_eth_core_arp_table_source_valid;
assign soc_eth_core_arp_table_source_ready = soc_eth_core_arp_tx_sink_sink_ready;
assign soc_eth_core_arp_tx_sink_sink_first = soc_eth_core_arp_table_source_first;
assign soc_eth_core_arp_tx_sink_sink_last = soc_eth_core_arp_table_source_last;
assign soc_eth_core_arp_tx_sink_sink_payload_reply = soc_eth_core_arp_table_source_payload_reply;
assign soc_eth_core_arp_tx_sink_sink_payload_request = soc_eth_core_arp_table_source_payload_request;
assign soc_eth_core_arp_tx_sink_sink_payload_ip_address = soc_eth_core_arp_table_source_payload_ip_address;
assign soc_eth_core_arp_tx_sink_sink_payload_mac_address = soc_eth_core_arp_table_source_payload_mac_address;
assign soc_eth_core_arp_mac_port_sink_valid = soc_eth_core_arp_tx_source_source_valid;
assign soc_eth_core_arp_tx_source_source_ready = soc_eth_core_arp_mac_port_sink_ready;
assign soc_eth_core_arp_mac_port_sink_first = soc_eth_core_arp_tx_source_source_first;
assign soc_eth_core_arp_mac_port_sink_last = soc_eth_core_arp_tx_source_source_last;
assign soc_eth_core_arp_mac_port_sink_payload_ethernet_type = soc_eth_core_arp_tx_source_source_payload_ethernet_type;
assign soc_eth_core_arp_mac_port_sink_payload_sender_mac = soc_eth_core_arp_tx_source_source_payload_sender_mac;
assign soc_eth_core_arp_mac_port_sink_payload_target_mac = soc_eth_core_arp_tx_source_source_payload_target_mac;
assign soc_eth_core_arp_mac_port_sink_payload_data = soc_eth_core_arp_tx_source_source_payload_data;
assign soc_eth_core_arp_mac_port_sink_payload_last_be = soc_eth_core_arp_tx_source_source_payload_last_be;
assign soc_eth_core_arp_mac_port_sink_payload_error = soc_eth_core_arp_tx_source_source_payload_error;
assign soc_eth_core_arp_rx_sink_sink_valid = soc_eth_core_arp_mac_port_source_valid;
assign soc_eth_core_arp_mac_port_source_ready = soc_eth_core_arp_rx_sink_sink_ready;
assign soc_eth_core_arp_rx_sink_sink_first = soc_eth_core_arp_mac_port_source_first;
assign soc_eth_core_arp_rx_sink_sink_last = soc_eth_core_arp_mac_port_source_last;
assign soc_eth_core_arp_rx_sink_sink_payload_ethernet_type = soc_eth_core_arp_mac_port_source_payload_ethernet_type;
assign soc_eth_core_arp_rx_sink_sink_payload_sender_mac = soc_eth_core_arp_mac_port_source_payload_sender_mac;
assign soc_eth_core_arp_rx_sink_sink_payload_target_mac = soc_eth_core_arp_mac_port_source_payload_target_mac;
assign soc_eth_core_arp_rx_sink_sink_payload_data = soc_eth_core_arp_mac_port_source_payload_data;
assign soc_eth_core_arp_rx_sink_sink_payload_last_be = soc_eth_core_arp_mac_port_source_payload_last_be;
assign soc_eth_core_arp_rx_sink_sink_payload_error = soc_eth_core_arp_mac_port_source_payload_error;
assign soc_eth_core_arp_tx_packetizer_sink_last = (soc_eth_core_arp_tx_counter == 6'd45);
assign soc_eth_core_arp_tx_packetizer_sink_param_hwtype = 1'd1;
assign soc_eth_core_arp_tx_packetizer_sink_param_proto = 12'd2048;
assign soc_eth_core_arp_tx_packetizer_sink_param_hwsize = 3'd6;
assign soc_eth_core_arp_tx_packetizer_sink_param_protosize = 3'd4;
assign soc_eth_core_arp_tx_packetizer_sink_param_sender_mac = 45'd18566422200320;
assign soc_eth_core_arp_tx_packetizer_sink_param_sender_ip = 32'd3232235826;
always @(*) begin
	soc_eth_core_arp_tx_packetizer_sink_param_opcode <= 16'd0;
	soc_eth_core_arp_tx_packetizer_sink_param_target_ip <= 32'd0;
	soc_eth_core_arp_tx_packetizer_sink_param_target_mac <= 48'd0;
	if (soc_eth_core_arp_tx_sink_sink_payload_reply) begin
		soc_eth_core_arp_tx_packetizer_sink_param_opcode <= 2'd2;
		soc_eth_core_arp_tx_packetizer_sink_param_target_mac <= soc_eth_core_arp_tx_sink_sink_payload_mac_address;
		soc_eth_core_arp_tx_packetizer_sink_param_target_ip <= soc_eth_core_arp_tx_sink_sink_payload_ip_address;
	end else begin
		if (soc_eth_core_arp_tx_sink_sink_payload_request) begin
			soc_eth_core_arp_tx_packetizer_sink_param_opcode <= 1'd1;
			soc_eth_core_arp_tx_packetizer_sink_param_target_mac <= 48'd281474976710655;
			soc_eth_core_arp_tx_packetizer_sink_param_target_ip <= soc_eth_core_arp_tx_sink_sink_payload_ip_address;
		end
	end
end
always @(*) begin
	soc_eth_core_arp_tx_packetizer_header <= 224'd0;
	soc_eth_core_arp_tx_packetizer_header[39:32] <= {soc_eth_core_arp_tx_packetizer_sink_param_hwsize[7:0]};
	soc_eth_core_arp_tx_packetizer_header[15:0] <= {soc_eth_core_arp_tx_packetizer_sink_param_hwtype[7:0], soc_eth_core_arp_tx_packetizer_sink_param_hwtype[15:8]};
	soc_eth_core_arp_tx_packetizer_header[63:48] <= {soc_eth_core_arp_tx_packetizer_sink_param_opcode[7:0], soc_eth_core_arp_tx_packetizer_sink_param_opcode[15:8]};
	soc_eth_core_arp_tx_packetizer_header[31:16] <= {soc_eth_core_arp_tx_packetizer_sink_param_proto[7:0], soc_eth_core_arp_tx_packetizer_sink_param_proto[15:8]};
	soc_eth_core_arp_tx_packetizer_header[47:40] <= {soc_eth_core_arp_tx_packetizer_sink_param_protosize[7:0]};
	soc_eth_core_arp_tx_packetizer_header[143:112] <= {soc_eth_core_arp_tx_packetizer_sink_param_sender_ip[7:0], soc_eth_core_arp_tx_packetizer_sink_param_sender_ip[15:8], soc_eth_core_arp_tx_packetizer_sink_param_sender_ip[23:16], soc_eth_core_arp_tx_packetizer_sink_param_sender_ip[31:24]};
	soc_eth_core_arp_tx_packetizer_header[111:64] <= {soc_eth_core_arp_tx_packetizer_sink_param_sender_mac[7:0], soc_eth_core_arp_tx_packetizer_sink_param_sender_mac[15:8], soc_eth_core_arp_tx_packetizer_sink_param_sender_mac[23:16], soc_eth_core_arp_tx_packetizer_sink_param_sender_mac[31:24], soc_eth_core_arp_tx_packetizer_sink_param_sender_mac[39:32], soc_eth_core_arp_tx_packetizer_sink_param_sender_mac[47:40]};
	soc_eth_core_arp_tx_packetizer_header[223:192] <= {soc_eth_core_arp_tx_packetizer_sink_param_target_ip[7:0], soc_eth_core_arp_tx_packetizer_sink_param_target_ip[15:8], soc_eth_core_arp_tx_packetizer_sink_param_target_ip[23:16], soc_eth_core_arp_tx_packetizer_sink_param_target_ip[31:24]};
	soc_eth_core_arp_tx_packetizer_header[191:144] <= {soc_eth_core_arp_tx_packetizer_sink_param_target_mac[7:0], soc_eth_core_arp_tx_packetizer_sink_param_target_mac[15:8], soc_eth_core_arp_tx_packetizer_sink_param_target_mac[23:16], soc_eth_core_arp_tx_packetizer_sink_param_target_mac[31:24], soc_eth_core_arp_tx_packetizer_sink_param_target_mac[39:32], soc_eth_core_arp_tx_packetizer_sink_param_target_mac[47:40]};
end
assign soc_eth_core_arp_tx_packetizer_source_payload_error = soc_eth_core_arp_tx_packetizer_sink_payload_error;
always @(*) begin
	soc_eth_core_arp_tx_packetizer_source_valid <= 1'd0;
	soc_eth_core_arp_tx_packetizer_sr_shift <= 1'd0;
	soc_eth_core_arp_tx_packetizer_fsm_from_idle_liteetharptx_next_value1 <= 1'd0;
	soc_eth_core_arp_tx_packetizer_sink_ready <= 1'd0;
	soc_eth_core_arp_tx_packetizer_fsm_from_idle_liteetharptx_next_value_ce1 <= 1'd0;
	soc_eth_core_arp_tx_packetizer_source_last <= 1'd0;
	soc_eth_core_arp_tx_packetizer_source_payload_data <= 8'd0;
	vns_liteethudpipcore_liteetharptx_liteetharppacketizer_next_state <= 2'd0;
	soc_eth_core_arp_tx_packetizer_sr_load <= 1'd0;
	soc_eth_core_arp_tx_packetizer_count_liteetharptx_next_value0 <= 5'd0;
	soc_eth_core_arp_tx_packetizer_count_liteetharptx_next_value_ce0 <= 1'd0;
	vns_liteethudpipcore_liteetharptx_liteetharppacketizer_next_state <= vns_liteethudpipcore_liteetharptx_liteetharppacketizer_state;
	case (vns_liteethudpipcore_liteetharptx_liteetharppacketizer_state)
		1'd1: begin
			soc_eth_core_arp_tx_packetizer_source_valid <= 1'd1;
			soc_eth_core_arp_tx_packetizer_source_last <= 1'd0;
			soc_eth_core_arp_tx_packetizer_source_payload_data <= soc_eth_core_arp_tx_packetizer_sr[223:8];
			if ((soc_eth_core_arp_tx_packetizer_source_valid & soc_eth_core_arp_tx_packetizer_source_ready)) begin
				soc_eth_core_arp_tx_packetizer_sr_shift <= 1'd1;
				if ((soc_eth_core_arp_tx_packetizer_count == 5'd27)) begin
					soc_eth_core_arp_tx_packetizer_sr_shift <= 1'd0;
					if (1'd0) begin
						vns_liteethudpipcore_liteetharptx_liteetharppacketizer_next_state <= 2'd3;
						soc_eth_core_arp_tx_packetizer_count_liteetharptx_next_value0 <= (soc_eth_core_arp_tx_packetizer_count + 1'd1);
						soc_eth_core_arp_tx_packetizer_count_liteetharptx_next_value_ce0 <= 1'd1;
					end else begin
						vns_liteethudpipcore_liteetharptx_liteetharppacketizer_next_state <= 2'd2;
					end
				end else begin
					soc_eth_core_arp_tx_packetizer_count_liteetharptx_next_value0 <= (soc_eth_core_arp_tx_packetizer_count + 1'd1);
					soc_eth_core_arp_tx_packetizer_count_liteetharptx_next_value_ce0 <= 1'd1;
				end
			end
		end
		2'd2: begin
			soc_eth_core_arp_tx_packetizer_source_valid <= soc_eth_core_arp_tx_packetizer_sink_valid;
			soc_eth_core_arp_tx_packetizer_source_last <= soc_eth_core_arp_tx_packetizer_sink_last;
			soc_eth_core_arp_tx_packetizer_source_payload_data <= soc_eth_core_arp_tx_packetizer_sink_payload_data;
			if ((soc_eth_core_arp_tx_packetizer_source_valid & soc_eth_core_arp_tx_packetizer_source_ready)) begin
				soc_eth_core_arp_tx_packetizer_sink_ready <= 1'd1;
				if (soc_eth_core_arp_tx_packetizer_source_last) begin
					vns_liteethudpipcore_liteetharptx_liteetharppacketizer_next_state <= 1'd0;
				end
			end
		end
		2'd3: begin
			soc_eth_core_arp_tx_packetizer_source_valid <= (soc_eth_core_arp_tx_packetizer_sink_valid | soc_eth_core_arp_tx_packetizer_sink_d_last);
			soc_eth_core_arp_tx_packetizer_source_last <= soc_eth_core_arp_tx_packetizer_sink_d_last;
			if (soc_eth_core_arp_tx_packetizer_fsm_from_idle) begin
				soc_eth_core_arp_tx_packetizer_source_payload_data[0] <= soc_eth_core_arp_tx_packetizer_sr[223:16];
			end else begin
				soc_eth_core_arp_tx_packetizer_source_payload_data[0] <= soc_eth_core_arp_tx_packetizer_sink_d_payload_data[7];
			end
			soc_eth_core_arp_tx_packetizer_source_payload_data[7:0] <= soc_eth_core_arp_tx_packetizer_sink_payload_data;
			if ((soc_eth_core_arp_tx_packetizer_source_valid & soc_eth_core_arp_tx_packetizer_source_ready)) begin
				soc_eth_core_arp_tx_packetizer_sink_ready <= (~soc_eth_core_arp_tx_packetizer_source_last);
				soc_eth_core_arp_tx_packetizer_fsm_from_idle_liteetharptx_next_value1 <= 1'd0;
				soc_eth_core_arp_tx_packetizer_fsm_from_idle_liteetharptx_next_value_ce1 <= 1'd1;
				if (soc_eth_core_arp_tx_packetizer_source_last) begin
					vns_liteethudpipcore_liteetharptx_liteetharppacketizer_next_state <= 1'd0;
				end
			end
		end
		default: begin
			soc_eth_core_arp_tx_packetizer_sink_ready <= 1'd1;
			soc_eth_core_arp_tx_packetizer_count_liteetharptx_next_value0 <= 1'd1;
			soc_eth_core_arp_tx_packetizer_count_liteetharptx_next_value_ce0 <= 1'd1;
			if (soc_eth_core_arp_tx_packetizer_sink_valid) begin
				soc_eth_core_arp_tx_packetizer_sink_ready <= 1'd0;
				soc_eth_core_arp_tx_packetizer_source_valid <= 1'd1;
				soc_eth_core_arp_tx_packetizer_source_last <= 1'd0;
				soc_eth_core_arp_tx_packetizer_source_payload_data <= soc_eth_core_arp_tx_packetizer_header[7:0];
				if ((soc_eth_core_arp_tx_packetizer_source_valid & soc_eth_core_arp_tx_packetizer_source_ready)) begin
					soc_eth_core_arp_tx_packetizer_sr_load <= 1'd1;
					soc_eth_core_arp_tx_packetizer_fsm_from_idle_liteetharptx_next_value1 <= 1'd1;
					soc_eth_core_arp_tx_packetizer_fsm_from_idle_liteetharptx_next_value_ce1 <= 1'd1;
					if (1'd0) begin
						if (1'd0) begin
							vns_liteethudpipcore_liteetharptx_liteetharppacketizer_next_state <= 2'd3;
						end else begin
							vns_liteethudpipcore_liteetharptx_liteetharppacketizer_next_state <= 2'd2;
						end
					end else begin
						vns_liteethudpipcore_liteetharptx_liteetharppacketizer_next_state <= 1'd1;
					end
				end
			end
		end
	endcase
end
always @(*) begin
	soc_eth_core_arp_tx_sink_sink_ready <= 1'd0;
	soc_eth_core_arp_tx_source_source_payload_error <= 1'd0;
	soc_eth_core_arp_tx_packetizer_sink_valid <= 1'd0;
	soc_eth_core_arp_tx_packetizer_source_ready <= 1'd0;
	vns_liteethudpipcore_liteetharptx_fsm_next_state <= 1'd0;
	soc_eth_core_arp_tx_source_source_valid <= 1'd0;
	soc_eth_core_arp_tx_counter_reset <= 1'd0;
	soc_eth_core_arp_tx_counter_ce <= 1'd0;
	soc_eth_core_arp_tx_source_source_first <= 1'd0;
	soc_eth_core_arp_tx_source_source_last <= 1'd0;
	soc_eth_core_arp_tx_source_source_payload_ethernet_type <= 16'd0;
	soc_eth_core_arp_tx_source_source_payload_sender_mac <= 48'd0;
	soc_eth_core_arp_tx_source_source_payload_target_mac <= 48'd0;
	soc_eth_core_arp_tx_source_source_payload_data <= 8'd0;
	soc_eth_core_arp_tx_source_source_payload_last_be <= 1'd0;
	vns_liteethudpipcore_liteetharptx_fsm_next_state <= vns_liteethudpipcore_liteetharptx_fsm_state;
	case (vns_liteethudpipcore_liteetharptx_fsm_state)
		1'd1: begin
			soc_eth_core_arp_tx_packetizer_sink_valid <= 1'd1;
			soc_eth_core_arp_tx_source_source_valid <= soc_eth_core_arp_tx_packetizer_source_valid;
			soc_eth_core_arp_tx_packetizer_source_ready <= soc_eth_core_arp_tx_source_source_ready;
			soc_eth_core_arp_tx_source_source_first <= soc_eth_core_arp_tx_packetizer_source_first;
			soc_eth_core_arp_tx_source_source_last <= soc_eth_core_arp_tx_packetizer_source_last;
			soc_eth_core_arp_tx_source_source_payload_ethernet_type <= soc_eth_core_arp_tx_packetizer_source_payload_ethernet_type;
			soc_eth_core_arp_tx_source_source_payload_sender_mac <= soc_eth_core_arp_tx_packetizer_source_payload_sender_mac;
			soc_eth_core_arp_tx_source_source_payload_target_mac <= soc_eth_core_arp_tx_packetizer_source_payload_target_mac;
			soc_eth_core_arp_tx_source_source_payload_data <= soc_eth_core_arp_tx_packetizer_source_payload_data;
			soc_eth_core_arp_tx_source_source_payload_last_be <= soc_eth_core_arp_tx_packetizer_source_payload_last_be;
			soc_eth_core_arp_tx_source_source_payload_error <= soc_eth_core_arp_tx_packetizer_source_payload_error;
			soc_eth_core_arp_tx_source_source_payload_target_mac <= soc_eth_core_arp_tx_packetizer_sink_param_target_mac;
			soc_eth_core_arp_tx_source_source_payload_sender_mac <= 45'd18566422200320;
			soc_eth_core_arp_tx_source_source_payload_ethernet_type <= 12'd2054;
			if ((soc_eth_core_arp_tx_source_source_valid & soc_eth_core_arp_tx_source_source_ready)) begin
				soc_eth_core_arp_tx_counter_ce <= 1'd1;
				if (soc_eth_core_arp_tx_source_source_last) begin
					soc_eth_core_arp_tx_sink_sink_ready <= 1'd1;
					vns_liteethudpipcore_liteetharptx_fsm_next_state <= 1'd0;
				end
			end
		end
		default: begin
			soc_eth_core_arp_tx_sink_sink_ready <= 1'd1;
			soc_eth_core_arp_tx_counter_reset <= 1'd1;
			if (soc_eth_core_arp_tx_sink_sink_valid) begin
				soc_eth_core_arp_tx_sink_sink_ready <= 1'd0;
				vns_liteethudpipcore_liteetharptx_fsm_next_state <= 1'd1;
			end
		end
	endcase
end
assign soc_eth_core_arp_rx_depacketizer_sink_valid = soc_eth_core_arp_rx_sink_sink_valid;
assign soc_eth_core_arp_rx_sink_sink_ready = soc_eth_core_arp_rx_depacketizer_sink_ready;
assign soc_eth_core_arp_rx_depacketizer_sink_first = soc_eth_core_arp_rx_sink_sink_first;
assign soc_eth_core_arp_rx_depacketizer_sink_last = soc_eth_core_arp_rx_sink_sink_last;
assign soc_eth_core_arp_rx_depacketizer_sink_payload_ethernet_type = soc_eth_core_arp_rx_sink_sink_payload_ethernet_type;
assign soc_eth_core_arp_rx_depacketizer_sink_payload_sender_mac = soc_eth_core_arp_rx_sink_sink_payload_sender_mac;
assign soc_eth_core_arp_rx_depacketizer_sink_payload_target_mac = soc_eth_core_arp_rx_sink_sink_payload_target_mac;
assign soc_eth_core_arp_rx_depacketizer_sink_payload_data = soc_eth_core_arp_rx_sink_sink_payload_data;
assign soc_eth_core_arp_rx_depacketizer_sink_payload_last_be = soc_eth_core_arp_rx_sink_sink_payload_last_be;
assign soc_eth_core_arp_rx_depacketizer_sink_payload_error = soc_eth_core_arp_rx_sink_sink_payload_error;
always @(*) begin
	soc_eth_core_arp_rx_request <= 1'd0;
	soc_eth_core_arp_rx_reply <= 1'd0;
	case (soc_eth_core_arp_rx_depacketizer_source_param_opcode)
		1'd1: begin
			soc_eth_core_arp_rx_request <= 1'd1;
		end
		2'd2: begin
			soc_eth_core_arp_rx_reply <= 1'd1;
		end
		default: begin
		end
	endcase
end
assign soc_eth_core_arp_rx_source_source_payload_ip_address = soc_eth_core_arp_rx_depacketizer_source_param_sender_ip;
assign soc_eth_core_arp_rx_source_source_payload_mac_address = soc_eth_core_arp_rx_depacketizer_source_param_sender_mac;
assign soc_eth_core_arp_rx_depacketizer_header = soc_eth_core_arp_rx_depacketizer_sr;
assign soc_eth_core_arp_rx_depacketizer_source_param_hwsize = {vns_slice_proxy14[7:0]};
assign soc_eth_core_arp_rx_depacketizer_source_param_hwtype = {vns_slice_proxy16[7:0], vns_slice_proxy15[15:8]};
assign soc_eth_core_arp_rx_depacketizer_source_param_opcode = {vns_slice_proxy18[7:0], vns_slice_proxy17[15:8]};
assign soc_eth_core_arp_rx_depacketizer_source_param_proto = {vns_slice_proxy20[7:0], vns_slice_proxy19[15:8]};
assign soc_eth_core_arp_rx_depacketizer_source_param_protosize = {vns_slice_proxy21[7:0]};
assign soc_eth_core_arp_rx_depacketizer_source_param_sender_ip = {vns_slice_proxy25[7:0], vns_slice_proxy24[15:8], vns_slice_proxy23[23:16], vns_slice_proxy22[31:24]};
assign soc_eth_core_arp_rx_depacketizer_source_param_sender_mac = {vns_slice_proxy31[7:0], vns_slice_proxy30[15:8], vns_slice_proxy29[23:16], vns_slice_proxy28[31:24], vns_slice_proxy27[39:32], vns_slice_proxy26[47:40]};
assign soc_eth_core_arp_rx_depacketizer_source_param_target_ip = {vns_slice_proxy35[7:0], vns_slice_proxy34[15:8], vns_slice_proxy33[23:16], vns_slice_proxy32[31:24]};
assign soc_eth_core_arp_rx_depacketizer_source_param_target_mac = {vns_slice_proxy41[7:0], vns_slice_proxy40[15:8], vns_slice_proxy39[23:16], vns_slice_proxy38[31:24], vns_slice_proxy37[39:32], vns_slice_proxy36[47:40]};
assign soc_eth_core_arp_rx_depacketizer_source_payload_error = soc_eth_core_arp_rx_depacketizer_sink_payload_error;
always @(*) begin
	soc_eth_core_arp_rx_depacketizer_source_valid <= 1'd0;
	soc_eth_core_arp_rx_depacketizer_sr_shift <= 1'd0;
	soc_eth_core_arp_rx_depacketizer_sr_shift_leftover <= 1'd0;
	soc_eth_core_arp_rx_depacketizer_source_last <= 1'd0;
	soc_eth_core_arp_rx_depacketizer_source_payload_data <= 8'd0;
	soc_eth_core_arp_rx_depacketizer_sink_ready <= 1'd0;
	vns_liteethudpipcore_liteetharprx_liteetharpdepacketizer_next_state <= 2'd0;
	soc_eth_core_arp_rx_depacketizer_count_liteetharprx_next_value0 <= 5'd0;
	soc_eth_core_arp_rx_depacketizer_count_liteetharprx_next_value_ce0 <= 1'd0;
	soc_eth_core_arp_rx_depacketizer_fsm_from_idle_liteetharprx_next_value1 <= 1'd0;
	soc_eth_core_arp_rx_depacketizer_fsm_from_idle_liteetharprx_next_value_ce1 <= 1'd0;
	vns_liteethudpipcore_liteetharprx_liteetharpdepacketizer_next_state <= vns_liteethudpipcore_liteetharprx_liteetharpdepacketizer_state;
	case (vns_liteethudpipcore_liteetharprx_liteetharpdepacketizer_state)
		1'd1: begin
			soc_eth_core_arp_rx_depacketizer_sink_ready <= 1'd1;
			if (soc_eth_core_arp_rx_depacketizer_sink_valid) begin
				soc_eth_core_arp_rx_depacketizer_count_liteetharprx_next_value0 <= (soc_eth_core_arp_rx_depacketizer_count + 1'd1);
				soc_eth_core_arp_rx_depacketizer_count_liteetharprx_next_value_ce0 <= 1'd1;
				soc_eth_core_arp_rx_depacketizer_sr_shift <= 1'd1;
				if ((soc_eth_core_arp_rx_depacketizer_count == 5'd27)) begin
					if (1'd0) begin
						soc_eth_core_arp_rx_depacketizer_count_liteetharprx_next_value0 <= (soc_eth_core_arp_rx_depacketizer_count + 1'd1);
						soc_eth_core_arp_rx_depacketizer_count_liteetharprx_next_value_ce0 <= 1'd1;
						vns_liteethudpipcore_liteetharprx_liteetharpdepacketizer_next_state <= 2'd2;
					end else begin
						vns_liteethudpipcore_liteetharprx_liteetharpdepacketizer_next_state <= 2'd3;
					end
				end
			end
		end
		2'd2: begin
			soc_eth_core_arp_rx_depacketizer_source_valid <= (soc_eth_core_arp_rx_depacketizer_sink_valid | soc_eth_core_arp_rx_depacketizer_sink_d_last);
			soc_eth_core_arp_rx_depacketizer_source_last <= (soc_eth_core_arp_rx_depacketizer_sink_last | soc_eth_core_arp_rx_depacketizer_sink_d_last);
			soc_eth_core_arp_rx_depacketizer_sink_ready <= soc_eth_core_arp_rx_depacketizer_source_ready;
			soc_eth_core_arp_rx_depacketizer_source_payload_data <= soc_eth_core_arp_rx_depacketizer_sink_d_payload_data[7:0];
			soc_eth_core_arp_rx_depacketizer_source_payload_data[7] <= soc_eth_core_arp_rx_depacketizer_sink_payload_data;
			if (soc_eth_core_arp_rx_depacketizer_fsm_from_idle) begin
				soc_eth_core_arp_rx_depacketizer_source_valid <= soc_eth_core_arp_rx_depacketizer_sink_d_last;
				soc_eth_core_arp_rx_depacketizer_sink_ready <= 1'd1;
				if (soc_eth_core_arp_rx_depacketizer_sink_valid) begin
					soc_eth_core_arp_rx_depacketizer_fsm_from_idle_liteetharprx_next_value1 <= 1'd0;
					soc_eth_core_arp_rx_depacketizer_fsm_from_idle_liteetharprx_next_value_ce1 <= 1'd1;
					soc_eth_core_arp_rx_depacketizer_sr_shift_leftover <= 1'd1;
				end
			end
			if ((soc_eth_core_arp_rx_depacketizer_source_valid & soc_eth_core_arp_rx_depacketizer_source_ready)) begin
				if (soc_eth_core_arp_rx_depacketizer_source_last) begin
					vns_liteethudpipcore_liteetharprx_liteetharpdepacketizer_next_state <= 1'd0;
				end
			end
		end
		2'd3: begin
			soc_eth_core_arp_rx_depacketizer_source_valid <= (soc_eth_core_arp_rx_depacketizer_sink_valid | soc_eth_core_arp_rx_depacketizer_sink_d_last);
			soc_eth_core_arp_rx_depacketizer_source_last <= (soc_eth_core_arp_rx_depacketizer_sink_last | soc_eth_core_arp_rx_depacketizer_sink_d_last);
			soc_eth_core_arp_rx_depacketizer_sink_ready <= soc_eth_core_arp_rx_depacketizer_source_ready;
			soc_eth_core_arp_rx_depacketizer_source_payload_data <= soc_eth_core_arp_rx_depacketizer_sink_payload_data;
			if ((soc_eth_core_arp_rx_depacketizer_source_valid & soc_eth_core_arp_rx_depacketizer_source_ready)) begin
				if (soc_eth_core_arp_rx_depacketizer_source_last) begin
					vns_liteethudpipcore_liteetharprx_liteetharpdepacketizer_next_state <= 1'd0;
				end
			end
		end
		default: begin
			soc_eth_core_arp_rx_depacketizer_sink_ready <= 1'd1;
			soc_eth_core_arp_rx_depacketizer_count_liteetharprx_next_value0 <= 1'd1;
			soc_eth_core_arp_rx_depacketizer_count_liteetharprx_next_value_ce0 <= 1'd1;
			if (soc_eth_core_arp_rx_depacketizer_sink_valid) begin
				soc_eth_core_arp_rx_depacketizer_sr_shift <= 1'd1;
				soc_eth_core_arp_rx_depacketizer_fsm_from_idle_liteetharprx_next_value1 <= 1'd1;
				soc_eth_core_arp_rx_depacketizer_fsm_from_idle_liteetharprx_next_value_ce1 <= 1'd1;
				if (1'd0) begin
					if (1'd0) begin
						vns_liteethudpipcore_liteetharprx_liteetharpdepacketizer_next_state <= 2'd2;
					end else begin
						vns_liteethudpipcore_liteetharprx_liteetharpdepacketizer_next_state <= 2'd3;
					end
				end else begin
					vns_liteethudpipcore_liteetharprx_liteetharpdepacketizer_next_state <= 1'd1;
				end
			end
		end
	endcase
end
always @(*) begin
	vns_liteethudpipcore_liteetharprx_fsm_next_state <= 2'd0;
	soc_eth_core_arp_rx_depacketizer_source_ready <= 1'd0;
	soc_eth_core_arp_rx_source_source_payload_reply <= 1'd0;
	soc_eth_core_arp_rx_source_source_payload_request <= 1'd0;
	soc_eth_core_arp_rx_source_source_valid <= 1'd0;
	vns_liteethudpipcore_liteetharprx_fsm_next_state <= vns_liteethudpipcore_liteetharprx_fsm_state;
	case (vns_liteethudpipcore_liteetharprx_fsm_state)
		1'd1: begin
			if (soc_eth_core_arp_rx_valid) begin
				soc_eth_core_arp_rx_source_source_valid <= 1'd1;
				soc_eth_core_arp_rx_source_source_payload_reply <= soc_eth_core_arp_rx_reply;
				soc_eth_core_arp_rx_source_source_payload_request <= soc_eth_core_arp_rx_request;
			end
			vns_liteethudpipcore_liteetharprx_fsm_next_state <= 2'd2;
		end
		2'd2: begin
			soc_eth_core_arp_rx_depacketizer_source_ready <= 1'd1;
			if ((soc_eth_core_arp_rx_depacketizer_source_valid & soc_eth_core_arp_rx_depacketizer_source_last)) begin
				vns_liteethudpipcore_liteetharprx_fsm_next_state <= 1'd0;
			end
		end
		default: begin
			soc_eth_core_arp_rx_depacketizer_source_ready <= 1'd1;
			if (soc_eth_core_arp_rx_depacketizer_source_valid) begin
				soc_eth_core_arp_rx_depacketizer_source_ready <= 1'd0;
				vns_liteethudpipcore_liteetharprx_fsm_next_state <= 1'd1;
			end
		end
	endcase
end
assign soc_eth_core_arp_table_request_timer_wait = (soc_eth_core_arp_table_request_pending & (~soc_eth_core_arp_table_request_counter_ce));
assign soc_eth_core_arp_table_cached_timer_wait = (~soc_eth_core_arp_table_update);
assign soc_eth_core_arp_table_response_payload_mac_address = soc_eth_core_arp_table_cached_mac_address;
assign soc_eth_core_arp_table_request_timer_done = (soc_eth_core_arp_table_request_timer_count == 1'd0);
assign soc_eth_core_arp_table_cached_timer_done = (soc_eth_core_arp_table_cached_timer_count == 1'd0);
always @(*) begin
	soc_eth_core_arp_table_source_payload_reply <= 1'd0;
	soc_eth_core_arp_table_request_pending_clr <= 1'd0;
	soc_eth_core_arp_table_source_payload_request <= 1'd0;
	soc_eth_core_arp_table_update <= 1'd0;
	soc_eth_core_arp_table_source_payload_ip_address <= 32'd0;
	soc_eth_core_arp_table_request_pending_set <= 1'd0;
	soc_eth_core_arp_table_source_payload_mac_address <= 48'd0;
	soc_eth_core_arp_table_request_ip_address_reset <= 1'd0;
	soc_eth_core_arp_table_request_ready <= 1'd0;
	soc_eth_core_arp_table_request_ip_address_update <= 1'd0;
	vns_liteethudpipcore_next_state <= 3'd0;
	soc_eth_core_arp_table_response_payload_failed <= 1'd0;
	soc_eth_core_arp_table_response_valid <= 1'd0;
	soc_eth_core_arp_table_source_valid <= 1'd0;
	soc_eth_core_arp_table_request_counter_reset <= 1'd0;
	soc_eth_core_arp_table_request_counter_ce <= 1'd0;
	if ((soc_eth_core_arp_table_request_counter == 3'd7)) begin
		soc_eth_core_arp_table_response_payload_failed <= 1'd1;
		soc_eth_core_arp_table_request_counter_reset <= 1'd1;
		soc_eth_core_arp_table_request_pending_clr <= 1'd1;
	end
	vns_liteethudpipcore_next_state <= vns_liteethudpipcore_state;
	case (vns_liteethudpipcore_state)
		1'd1: begin
			soc_eth_core_arp_table_source_valid <= 1'd1;
			soc_eth_core_arp_table_source_payload_reply <= 1'd1;
			soc_eth_core_arp_table_source_payload_ip_address <= soc_eth_core_arp_table_sink_payload_ip_address;
			soc_eth_core_arp_table_source_payload_mac_address <= soc_eth_core_arp_table_sink_payload_mac_address;
			if (soc_eth_core_arp_table_source_ready) begin
				vns_liteethudpipcore_next_state <= 1'd0;
			end
		end
		2'd2: begin
			soc_eth_core_arp_table_request_pending_clr <= 1'd1;
			soc_eth_core_arp_table_update <= 1'd1;
			vns_liteethudpipcore_next_state <= 2'd3;
		end
		2'd3: begin
			if (soc_eth_core_arp_table_cached_valid) begin
				if ((soc_eth_core_arp_table_request_ip_address == soc_eth_core_arp_table_cached_ip_address)) begin
					soc_eth_core_arp_table_request_ip_address_reset <= 1'd1;
					vns_liteethudpipcore_next_state <= 3'd5;
				end else begin
					if ((soc_eth_core_arp_table_request_payload_ip_address == soc_eth_core_arp_table_cached_ip_address)) begin
						soc_eth_core_arp_table_request_ready <= soc_eth_core_arp_table_request_valid;
						vns_liteethudpipcore_next_state <= 3'd5;
					end else begin
						soc_eth_core_arp_table_request_ip_address_update <= soc_eth_core_arp_table_request_valid;
						vns_liteethudpipcore_next_state <= 3'd4;
					end
				end
			end else begin
				soc_eth_core_arp_table_request_ip_address_update <= soc_eth_core_arp_table_request_valid;
				vns_liteethudpipcore_next_state <= 3'd4;
			end
		end
		3'd4: begin
			soc_eth_core_arp_table_source_valid <= 1'd1;
			soc_eth_core_arp_table_source_payload_request <= 1'd1;
			soc_eth_core_arp_table_source_payload_ip_address <= soc_eth_core_arp_table_request_ip_address;
			if (soc_eth_core_arp_table_source_ready) begin
				soc_eth_core_arp_table_request_counter_reset <= soc_eth_core_arp_table_request_valid;
				soc_eth_core_arp_table_request_counter_ce <= 1'd1;
				soc_eth_core_arp_table_request_pending_set <= 1'd1;
				soc_eth_core_arp_table_request_ready <= 1'd1;
				vns_liteethudpipcore_next_state <= 1'd0;
			end
		end
		3'd5: begin
			soc_eth_core_arp_table_response_valid <= 1'd1;
			if (soc_eth_core_arp_table_response_ready) begin
				vns_liteethudpipcore_next_state <= 1'd0;
			end
		end
		default: begin
			if ((soc_eth_core_arp_table_sink_valid & soc_eth_core_arp_table_sink_payload_request)) begin
				vns_liteethudpipcore_next_state <= 1'd1;
			end else begin
				if (((soc_eth_core_arp_table_sink_valid & soc_eth_core_arp_table_sink_payload_reply) & soc_eth_core_arp_table_request_pending)) begin
					vns_liteethudpipcore_next_state <= 2'd2;
				end else begin
					if ((soc_eth_core_arp_table_request_counter == 3'd7)) begin
						vns_liteethudpipcore_next_state <= 3'd5;
					end else begin
						if ((soc_eth_core_arp_table_request_valid | (soc_eth_core_arp_table_request_pending & soc_eth_core_arp_table_request_timer_done))) begin
							vns_liteethudpipcore_next_state <= 2'd3;
						end
					end
				end
			end
		end
	endcase
end
assign soc_eth_core_ip_mac_port_sink_valid = soc_eth_core_ip_tx_source_source_valid;
assign soc_eth_core_ip_tx_source_source_ready = soc_eth_core_ip_mac_port_sink_ready;
assign soc_eth_core_ip_mac_port_sink_first = soc_eth_core_ip_tx_source_source_first;
assign soc_eth_core_ip_mac_port_sink_last = soc_eth_core_ip_tx_source_source_last;
assign soc_eth_core_ip_mac_port_sink_payload_ethernet_type = soc_eth_core_ip_tx_source_source_payload_ethernet_type;
assign soc_eth_core_ip_mac_port_sink_payload_sender_mac = soc_eth_core_ip_tx_source_source_payload_sender_mac;
assign soc_eth_core_ip_mac_port_sink_payload_target_mac = soc_eth_core_ip_tx_source_source_payload_target_mac;
assign soc_eth_core_ip_mac_port_sink_payload_data = soc_eth_core_ip_tx_source_source_payload_data;
assign soc_eth_core_ip_mac_port_sink_payload_last_be = soc_eth_core_ip_tx_source_source_payload_last_be;
assign soc_eth_core_ip_mac_port_sink_payload_error = soc_eth_core_ip_tx_source_source_payload_error;
assign soc_eth_core_ip_rx_sink_sink_valid = soc_eth_core_ip_mac_port_source_valid;
assign soc_eth_core_ip_mac_port_source_ready = soc_eth_core_ip_rx_sink_sink_ready;
assign soc_eth_core_ip_rx_sink_sink_first = soc_eth_core_ip_mac_port_source_first;
assign soc_eth_core_ip_rx_sink_sink_last = soc_eth_core_ip_mac_port_source_last;
assign soc_eth_core_ip_rx_sink_sink_payload_ethernet_type = soc_eth_core_ip_mac_port_source_payload_ethernet_type;
assign soc_eth_core_ip_rx_sink_sink_payload_sender_mac = soc_eth_core_ip_mac_port_source_payload_sender_mac;
assign soc_eth_core_ip_rx_sink_sink_payload_target_mac = soc_eth_core_ip_mac_port_source_payload_target_mac;
assign soc_eth_core_ip_rx_sink_sink_payload_data = soc_eth_core_ip_mac_port_source_payload_data;
assign soc_eth_core_ip_rx_sink_sink_payload_last_be = soc_eth_core_ip_mac_port_source_payload_last_be;
assign soc_eth_core_ip_rx_sink_sink_payload_error = soc_eth_core_ip_mac_port_source_payload_error;
assign soc_eth_core_ip_tx_sink_sink_valid = soc_eth_core_ip_crossbar_source_valid;
assign soc_eth_core_ip_crossbar_source_ready = soc_eth_core_ip_tx_sink_sink_ready;
assign soc_eth_core_ip_tx_sink_sink_first = soc_eth_core_ip_crossbar_source_first;
assign soc_eth_core_ip_tx_sink_sink_last = soc_eth_core_ip_crossbar_source_last;
assign soc_eth_core_ip_tx_sink_sink_payload_data = soc_eth_core_ip_crossbar_source_payload_data;
assign soc_eth_core_ip_tx_sink_sink_payload_error = soc_eth_core_ip_crossbar_source_payload_error;
assign soc_eth_core_ip_tx_sink_sink_param_length = soc_eth_core_ip_crossbar_source_param_length;
assign soc_eth_core_ip_tx_sink_sink_param_protocol = soc_eth_core_ip_crossbar_source_param_protocol;
assign soc_eth_core_ip_tx_sink_sink_param_ip_address = soc_eth_core_ip_crossbar_source_param_ip_address;
assign soc_eth_core_ip_crossbar_sink_valid = soc_eth_core_ip_rx_source_source_valid;
assign soc_eth_core_ip_rx_source_source_ready = soc_eth_core_ip_crossbar_sink_ready;
assign soc_eth_core_ip_crossbar_sink_first = soc_eth_core_ip_rx_source_source_first;
assign soc_eth_core_ip_crossbar_sink_last = soc_eth_core_ip_rx_source_source_last;
assign soc_eth_core_ip_crossbar_sink_payload_data = soc_eth_core_ip_rx_source_source_payload_data;
assign soc_eth_core_ip_crossbar_sink_payload_error = soc_eth_core_ip_rx_source_source_payload_error;
assign soc_eth_core_ip_crossbar_sink_param_length = soc_eth_core_ip_rx_source_source_param_length;
assign soc_eth_core_ip_crossbar_sink_param_protocol = soc_eth_core_ip_rx_source_source_param_protocol;
assign soc_eth_core_ip_crossbar_sink_param_ip_address = soc_eth_core_ip_rx_source_source_param_ip_address;
assign soc_eth_core_ip_tx_ce = soc_eth_core_ip_tx_sink_sink_valid;
assign soc_eth_core_ip_tx_reset = ((soc_eth_core_ip_tx_source_source_valid & soc_eth_core_ip_tx_source_source_last) & soc_eth_core_ip_tx_source_source_ready);
assign soc_eth_core_ip_tx_packetizer_sink_valid = (soc_eth_core_ip_tx_sink_sink_valid & soc_eth_core_ip_tx_liteethipv4checksum_done);
assign soc_eth_core_ip_tx_packetizer_sink_last = soc_eth_core_ip_tx_sink_sink_last;
assign soc_eth_core_ip_tx_sink_sink_ready = (soc_eth_core_ip_tx_packetizer_sink_ready & soc_eth_core_ip_tx_liteethipv4checksum_done);
assign soc_eth_core_ip_tx_packetizer_sink_param_target_ip = soc_eth_core_ip_tx_sink_sink_param_ip_address;
assign soc_eth_core_ip_tx_packetizer_sink_param_protocol = soc_eth_core_ip_tx_sink_sink_param_protocol;
assign soc_eth_core_ip_tx_packetizer_sink_param_total_length = (soc_eth_core_ip_tx_sink_sink_param_length + 5'd20);
assign soc_eth_core_ip_tx_packetizer_sink_param_version = 3'd4;
assign soc_eth_core_ip_tx_packetizer_sink_param_ihl = 3'd5;
assign soc_eth_core_ip_tx_packetizer_sink_param_identification = 1'd0;
assign soc_eth_core_ip_tx_packetizer_sink_param_ttl = 8'd128;
assign soc_eth_core_ip_tx_packetizer_sink_param_sender_ip = 32'd3232235826;
assign soc_eth_core_ip_tx_packetizer_sink_payload_data = soc_eth_core_ip_tx_sink_sink_payload_data;
assign soc_eth_core_ip_tx_liteethipv4checksum_header = soc_eth_core_ip_tx_packetizer_header;
assign soc_eth_core_ip_tx_packetizer_sink_param_checksum = soc_eth_core_ip_tx_liteethipv4checksum_value;
assign soc_eth_core_arp_table_request_payload_ip_address = soc_eth_core_ip_tx_sink_sink_param_ip_address;
assign soc_eth_core_ip_tx_liteethipv4checksum_s_next0 = (soc_eth_core_ip_tx_liteethipv4checksum_r + soc_eth_core_ip_tx_liteethipv4checksum_header[15:0]);
assign soc_eth_core_ip_tx_liteethipv4checksum_s_next1 = (soc_eth_core_ip_tx_liteethipv4checksum_r_next0 + soc_eth_core_ip_tx_liteethipv4checksum_header[31:16]);
assign soc_eth_core_ip_tx_liteethipv4checksum_s_next2 = (soc_eth_core_ip_tx_liteethipv4checksum_r_next1 + soc_eth_core_ip_tx_liteethipv4checksum_header[47:32]);
assign soc_eth_core_ip_tx_liteethipv4checksum_s_next3 = (soc_eth_core_ip_tx_liteethipv4checksum_r_next2 + soc_eth_core_ip_tx_liteethipv4checksum_header[63:48]);
assign soc_eth_core_ip_tx_liteethipv4checksum_s_next4 = (soc_eth_core_ip_tx_liteethipv4checksum_r_next3 + soc_eth_core_ip_tx_liteethipv4checksum_header[79:64]);
assign soc_eth_core_ip_tx_liteethipv4checksum_s_next5 = (soc_eth_core_ip_tx_liteethipv4checksum_r_next4 + soc_eth_core_ip_tx_liteethipv4checksum_header[111:96]);
assign soc_eth_core_ip_tx_liteethipv4checksum_s_next6 = (soc_eth_core_ip_tx_liteethipv4checksum_r_next5 + soc_eth_core_ip_tx_liteethipv4checksum_header[127:112]);
assign soc_eth_core_ip_tx_liteethipv4checksum_s_next7 = (soc_eth_core_ip_tx_liteethipv4checksum_r_next6 + soc_eth_core_ip_tx_liteethipv4checksum_header[143:128]);
assign soc_eth_core_ip_tx_liteethipv4checksum_s_next8 = (soc_eth_core_ip_tx_liteethipv4checksum_r_next7 + soc_eth_core_ip_tx_liteethipv4checksum_header[159:144]);
assign soc_eth_core_ip_tx_liteethipv4checksum_value = (~{soc_eth_core_ip_tx_liteethipv4checksum_r_next8[7:0], soc_eth_core_ip_tx_liteethipv4checksum_r_next8[15:8]});
assign soc_eth_core_ip_tx_liteethipv4checksum_counter_ce = (~soc_eth_core_ip_tx_liteethipv4checksum_done);
assign soc_eth_core_ip_tx_liteethipv4checksum_done = (soc_eth_core_ip_tx_liteethipv4checksum_counter == 4'd9);
always @(*) begin
	soc_eth_core_ip_tx_packetizer_header <= 160'd0;
	soc_eth_core_ip_tx_packetizer_header[95:80] <= {soc_eth_core_ip_tx_packetizer_sink_param_checksum[7:0], soc_eth_core_ip_tx_packetizer_sink_param_checksum[15:8]};
	soc_eth_core_ip_tx_packetizer_header[47:32] <= {soc_eth_core_ip_tx_packetizer_sink_param_identification[7:0], soc_eth_core_ip_tx_packetizer_sink_param_identification[15:8]};
	soc_eth_core_ip_tx_packetizer_header[3:0] <= {soc_eth_core_ip_tx_packetizer_sink_param_ihl[3:0]};
	soc_eth_core_ip_tx_packetizer_header[79:72] <= {soc_eth_core_ip_tx_packetizer_sink_param_protocol[7:0]};
	soc_eth_core_ip_tx_packetizer_header[127:96] <= {soc_eth_core_ip_tx_packetizer_sink_param_sender_ip[7:0], soc_eth_core_ip_tx_packetizer_sink_param_sender_ip[15:8], soc_eth_core_ip_tx_packetizer_sink_param_sender_ip[23:16], soc_eth_core_ip_tx_packetizer_sink_param_sender_ip[31:24]};
	soc_eth_core_ip_tx_packetizer_header[159:128] <= {soc_eth_core_ip_tx_packetizer_sink_param_target_ip[7:0], soc_eth_core_ip_tx_packetizer_sink_param_target_ip[15:8], soc_eth_core_ip_tx_packetizer_sink_param_target_ip[23:16], soc_eth_core_ip_tx_packetizer_sink_param_target_ip[31:24]};
	soc_eth_core_ip_tx_packetizer_header[31:16] <= {soc_eth_core_ip_tx_packetizer_sink_param_total_length[7:0], soc_eth_core_ip_tx_packetizer_sink_param_total_length[15:8]};
	soc_eth_core_ip_tx_packetizer_header[71:64] <= {soc_eth_core_ip_tx_packetizer_sink_param_ttl[7:0]};
	soc_eth_core_ip_tx_packetizer_header[7:4] <= {soc_eth_core_ip_tx_packetizer_sink_param_version[3:0]};
end
assign soc_eth_core_ip_tx_packetizer_source_payload_error = soc_eth_core_ip_tx_packetizer_sink_payload_error;
always @(*) begin
	soc_eth_core_ip_tx_packetizer_source_payload_data <= 8'd0;
	soc_eth_core_ip_tx_packetizer_sr_load <= 1'd0;
	soc_eth_core_ip_tx_packetizer_sr_shift <= 1'd0;
	vns_liteethudpipcore_liteethip_liteethiptx_liteethipv4packetizer_next_state <= 2'd0;
	soc_eth_core_ip_tx_packetizer_count_liteethiptx_next_value0 <= 5'd0;
	soc_eth_core_ip_tx_packetizer_source_valid <= 1'd0;
	soc_eth_core_ip_tx_packetizer_count_liteethiptx_next_value_ce0 <= 1'd0;
	soc_eth_core_ip_tx_packetizer_sink_ready <= 1'd0;
	soc_eth_core_ip_tx_packetizer_source_last <= 1'd0;
	soc_eth_core_ip_tx_packetizer_fsm_from_idle_liteethiptx_next_value_ce1 <= 1'd0;
	soc_eth_core_ip_tx_packetizer_fsm_from_idle_liteethiptx_next_value1 <= 1'd0;
	vns_liteethudpipcore_liteethip_liteethiptx_liteethipv4packetizer_next_state <= vns_liteethudpipcore_liteethip_liteethiptx_liteethipv4packetizer_state;
	case (vns_liteethudpipcore_liteethip_liteethiptx_liteethipv4packetizer_state)
		1'd1: begin
			soc_eth_core_ip_tx_packetizer_source_valid <= 1'd1;
			soc_eth_core_ip_tx_packetizer_source_last <= 1'd0;
			soc_eth_core_ip_tx_packetizer_source_payload_data <= soc_eth_core_ip_tx_packetizer_sr[159:8];
			if ((soc_eth_core_ip_tx_packetizer_source_valid & soc_eth_core_ip_tx_packetizer_source_ready)) begin
				soc_eth_core_ip_tx_packetizer_sr_shift <= 1'd1;
				if ((soc_eth_core_ip_tx_packetizer_count == 5'd19)) begin
					soc_eth_core_ip_tx_packetizer_sr_shift <= 1'd0;
					if (1'd0) begin
						vns_liteethudpipcore_liteethip_liteethiptx_liteethipv4packetizer_next_state <= 2'd3;
						soc_eth_core_ip_tx_packetizer_count_liteethiptx_next_value0 <= (soc_eth_core_ip_tx_packetizer_count + 1'd1);
						soc_eth_core_ip_tx_packetizer_count_liteethiptx_next_value_ce0 <= 1'd1;
					end else begin
						vns_liteethudpipcore_liteethip_liteethiptx_liteethipv4packetizer_next_state <= 2'd2;
					end
				end else begin
					soc_eth_core_ip_tx_packetizer_count_liteethiptx_next_value0 <= (soc_eth_core_ip_tx_packetizer_count + 1'd1);
					soc_eth_core_ip_tx_packetizer_count_liteethiptx_next_value_ce0 <= 1'd1;
				end
			end
		end
		2'd2: begin
			soc_eth_core_ip_tx_packetizer_source_valid <= soc_eth_core_ip_tx_packetizer_sink_valid;
			soc_eth_core_ip_tx_packetizer_source_last <= soc_eth_core_ip_tx_packetizer_sink_last;
			soc_eth_core_ip_tx_packetizer_source_payload_data <= soc_eth_core_ip_tx_packetizer_sink_payload_data;
			if ((soc_eth_core_ip_tx_packetizer_source_valid & soc_eth_core_ip_tx_packetizer_source_ready)) begin
				soc_eth_core_ip_tx_packetizer_sink_ready <= 1'd1;
				if (soc_eth_core_ip_tx_packetizer_source_last) begin
					vns_liteethudpipcore_liteethip_liteethiptx_liteethipv4packetizer_next_state <= 1'd0;
				end
			end
		end
		2'd3: begin
			soc_eth_core_ip_tx_packetizer_source_valid <= (soc_eth_core_ip_tx_packetizer_sink_valid | soc_eth_core_ip_tx_packetizer_sink_d_last);
			soc_eth_core_ip_tx_packetizer_source_last <= soc_eth_core_ip_tx_packetizer_sink_d_last;
			if (soc_eth_core_ip_tx_packetizer_fsm_from_idle) begin
				soc_eth_core_ip_tx_packetizer_source_payload_data[0] <= soc_eth_core_ip_tx_packetizer_sr[159:16];
			end else begin
				soc_eth_core_ip_tx_packetizer_source_payload_data[0] <= soc_eth_core_ip_tx_packetizer_sink_d_payload_data[7];
			end
			soc_eth_core_ip_tx_packetizer_source_payload_data[7:0] <= soc_eth_core_ip_tx_packetizer_sink_payload_data;
			if ((soc_eth_core_ip_tx_packetizer_source_valid & soc_eth_core_ip_tx_packetizer_source_ready)) begin
				soc_eth_core_ip_tx_packetizer_sink_ready <= (~soc_eth_core_ip_tx_packetizer_source_last);
				soc_eth_core_ip_tx_packetizer_fsm_from_idle_liteethiptx_next_value1 <= 1'd0;
				soc_eth_core_ip_tx_packetizer_fsm_from_idle_liteethiptx_next_value_ce1 <= 1'd1;
				if (soc_eth_core_ip_tx_packetizer_source_last) begin
					vns_liteethudpipcore_liteethip_liteethiptx_liteethipv4packetizer_next_state <= 1'd0;
				end
			end
		end
		default: begin
			soc_eth_core_ip_tx_packetizer_sink_ready <= 1'd1;
			soc_eth_core_ip_tx_packetizer_count_liteethiptx_next_value0 <= 1'd1;
			soc_eth_core_ip_tx_packetizer_count_liteethiptx_next_value_ce0 <= 1'd1;
			if (soc_eth_core_ip_tx_packetizer_sink_valid) begin
				soc_eth_core_ip_tx_packetizer_sink_ready <= 1'd0;
				soc_eth_core_ip_tx_packetizer_source_valid <= 1'd1;
				soc_eth_core_ip_tx_packetizer_source_last <= 1'd0;
				soc_eth_core_ip_tx_packetizer_source_payload_data <= soc_eth_core_ip_tx_packetizer_header[7:0];
				if ((soc_eth_core_ip_tx_packetizer_source_valid & soc_eth_core_ip_tx_packetizer_source_ready)) begin
					soc_eth_core_ip_tx_packetizer_sr_load <= 1'd1;
					soc_eth_core_ip_tx_packetizer_fsm_from_idle_liteethiptx_next_value1 <= 1'd1;
					soc_eth_core_ip_tx_packetizer_fsm_from_idle_liteethiptx_next_value_ce1 <= 1'd1;
					if (1'd0) begin
						if (1'd0) begin
							vns_liteethudpipcore_liteethip_liteethiptx_liteethipv4packetizer_next_state <= 2'd3;
						end else begin
							vns_liteethudpipcore_liteethip_liteethiptx_liteethipv4packetizer_next_state <= 2'd2;
						end
					end else begin
						vns_liteethudpipcore_liteethip_liteethiptx_liteethipv4packetizer_next_state <= 1'd1;
					end
				end
			end
		end
	endcase
end
always @(*) begin
	soc_eth_core_ip_tx_source_source_payload_sender_mac <= 48'd0;
	soc_eth_core_ip_tx_target_unreachable <= 1'd0;
	soc_eth_core_ip_tx_source_source_payload_error <= 1'd0;
	soc_eth_core_arp_table_request_valid <= 1'd0;
	soc_eth_core_ip_tx_source_source_valid <= 1'd0;
	soc_eth_core_ip_tx_source_source_first <= 1'd0;
	soc_eth_core_ip_tx_source_source_last <= 1'd0;
	soc_eth_core_ip_tx_packetizer_source_ready <= 1'd0;
	soc_eth_core_arp_table_response_ready <= 1'd0;
	soc_eth_core_ip_tx_source_source_payload_ethernet_type <= 16'd0;
	soc_eth_core_ip_tx_source_source_payload_target_mac <= 48'd0;
	soc_eth_core_ip_tx_source_source_payload_data <= 8'd0;
	soc_eth_core_ip_tx_source_source_payload_last_be <= 1'd0;
	vns_liteethudpipcore_liteethip_liteethiptx_fsm_next_state <= 3'd0;
	vns_liteethudpipcore_liteethip_liteethiptx_fsm_next_state <= vns_liteethudpipcore_liteethip_liteethiptx_fsm_state;
	case (vns_liteethudpipcore_liteethip_liteethiptx_fsm_state)
		1'd1: begin
			soc_eth_core_arp_table_request_valid <= 1'd1;
			if ((soc_eth_core_arp_table_request_valid & soc_eth_core_arp_table_request_ready)) begin
				vns_liteethudpipcore_liteethip_liteethiptx_fsm_next_state <= 2'd2;
			end
		end
		2'd2: begin
			if (soc_eth_core_arp_table_response_valid) begin
				soc_eth_core_arp_table_response_ready <= 1'd1;
				if (soc_eth_core_arp_table_response_payload_failed) begin
					soc_eth_core_ip_tx_target_unreachable <= 1'd1;
					vns_liteethudpipcore_liteethip_liteethiptx_fsm_next_state <= 3'd4;
				end else begin
					vns_liteethudpipcore_liteethip_liteethiptx_fsm_next_state <= 2'd3;
				end
			end
		end
		2'd3: begin
			soc_eth_core_ip_tx_source_source_valid <= soc_eth_core_ip_tx_packetizer_source_valid;
			soc_eth_core_ip_tx_packetizer_source_ready <= soc_eth_core_ip_tx_source_source_ready;
			soc_eth_core_ip_tx_source_source_first <= soc_eth_core_ip_tx_packetizer_source_first;
			soc_eth_core_ip_tx_source_source_last <= soc_eth_core_ip_tx_packetizer_source_last;
			soc_eth_core_ip_tx_source_source_payload_ethernet_type <= soc_eth_core_ip_tx_packetizer_source_payload_ethernet_type;
			soc_eth_core_ip_tx_source_source_payload_sender_mac <= soc_eth_core_ip_tx_packetizer_source_payload_sender_mac;
			soc_eth_core_ip_tx_source_source_payload_target_mac <= soc_eth_core_ip_tx_packetizer_source_payload_target_mac;
			soc_eth_core_ip_tx_source_source_payload_data <= soc_eth_core_ip_tx_packetizer_source_payload_data;
			soc_eth_core_ip_tx_source_source_payload_last_be <= soc_eth_core_ip_tx_packetizer_source_payload_last_be;
			soc_eth_core_ip_tx_source_source_payload_error <= soc_eth_core_ip_tx_packetizer_source_payload_error;
			soc_eth_core_ip_tx_source_source_payload_ethernet_type <= 12'd2048;
			soc_eth_core_ip_tx_source_source_payload_target_mac <= soc_eth_core_ip_tx_target_mac;
			soc_eth_core_ip_tx_source_source_payload_sender_mac <= 45'd18566422200320;
			if (((soc_eth_core_ip_tx_source_source_valid & soc_eth_core_ip_tx_source_source_last) & soc_eth_core_ip_tx_source_source_ready)) begin
				vns_liteethudpipcore_liteethip_liteethiptx_fsm_next_state <= 1'd0;
			end
		end
		3'd4: begin
			soc_eth_core_ip_tx_packetizer_source_ready <= 1'd1;
			if (((soc_eth_core_ip_tx_packetizer_source_valid & soc_eth_core_ip_tx_packetizer_source_last) & soc_eth_core_ip_tx_packetizer_source_ready)) begin
				vns_liteethudpipcore_liteethip_liteethiptx_fsm_next_state <= 1'd0;
			end
		end
		default: begin
			soc_eth_core_ip_tx_packetizer_source_ready <= 1'd1;
			if (soc_eth_core_ip_tx_packetizer_source_valid) begin
				soc_eth_core_ip_tx_packetizer_source_ready <= 1'd0;
				vns_liteethudpipcore_liteethip_liteethiptx_fsm_next_state <= 1'd1;
			end
		end
	endcase
end
assign soc_eth_core_ip_rx_depacketizer_sink_valid = soc_eth_core_ip_rx_sink_sink_valid;
assign soc_eth_core_ip_rx_sink_sink_ready = soc_eth_core_ip_rx_depacketizer_sink_ready;
assign soc_eth_core_ip_rx_depacketizer_sink_first = soc_eth_core_ip_rx_sink_sink_first;
assign soc_eth_core_ip_rx_depacketizer_sink_last = soc_eth_core_ip_rx_sink_sink_last;
assign soc_eth_core_ip_rx_depacketizer_sink_payload_ethernet_type = soc_eth_core_ip_rx_sink_sink_payload_ethernet_type;
assign soc_eth_core_ip_rx_depacketizer_sink_payload_sender_mac = soc_eth_core_ip_rx_sink_sink_payload_sender_mac;
assign soc_eth_core_ip_rx_depacketizer_sink_payload_target_mac = soc_eth_core_ip_rx_sink_sink_payload_target_mac;
assign soc_eth_core_ip_rx_depacketizer_sink_payload_data = soc_eth_core_ip_rx_sink_sink_payload_data;
assign soc_eth_core_ip_rx_depacketizer_sink_payload_last_be = soc_eth_core_ip_rx_sink_sink_payload_last_be;
assign soc_eth_core_ip_rx_depacketizer_sink_payload_error = soc_eth_core_ip_rx_sink_sink_payload_error;
assign soc_eth_core_ip_rx_liteethipv4checksum_header = soc_eth_core_ip_rx_depacketizer_header;
assign soc_eth_core_ip_rx_reset = (~soc_eth_core_ip_rx_depacketizer_source_valid);
assign soc_eth_core_ip_rx_ce = 1'd1;
assign soc_eth_core_ip_rx_source_source_last = soc_eth_core_ip_rx_depacketizer_source_last;
assign soc_eth_core_ip_rx_source_source_param_length = (soc_eth_core_ip_rx_depacketizer_source_param_total_length - 5'd20);
assign soc_eth_core_ip_rx_source_source_param_protocol = soc_eth_core_ip_rx_depacketizer_source_param_protocol;
assign soc_eth_core_ip_rx_source_source_param_ip_address = soc_eth_core_ip_rx_depacketizer_source_param_sender_ip;
assign soc_eth_core_ip_rx_source_source_payload_data = soc_eth_core_ip_rx_depacketizer_source_payload_data;
assign soc_eth_core_ip_rx_source_source_payload_error = soc_eth_core_ip_rx_depacketizer_source_payload_error;
assign soc_eth_core_ip_rx_depacketizer_header = soc_eth_core_ip_rx_depacketizer_sr;
assign soc_eth_core_ip_rx_depacketizer_source_param_checksum = {vns_slice_proxy43[7:0], vns_slice_proxy42[15:8]};
assign soc_eth_core_ip_rx_depacketizer_source_param_identification = {vns_slice_proxy45[7:0], vns_slice_proxy44[15:8]};
assign soc_eth_core_ip_rx_depacketizer_source_param_ihl = {vns_slice_proxy46[3:0]};
assign soc_eth_core_ip_rx_depacketizer_source_param_protocol = {vns_slice_proxy47[7:0]};
assign soc_eth_core_ip_rx_depacketizer_source_param_sender_ip = {vns_slice_proxy51[7:0], vns_slice_proxy50[15:8], vns_slice_proxy49[23:16], vns_slice_proxy48[31:24]};
assign soc_eth_core_ip_rx_depacketizer_source_param_target_ip = {vns_slice_proxy55[7:0], vns_slice_proxy54[15:8], vns_slice_proxy53[23:16], vns_slice_proxy52[31:24]};
assign soc_eth_core_ip_rx_depacketizer_source_param_total_length = {vns_slice_proxy57[7:0], vns_slice_proxy56[15:8]};
assign soc_eth_core_ip_rx_depacketizer_source_param_ttl = {vns_slice_proxy58[7:0]};
assign soc_eth_core_ip_rx_depacketizer_source_param_version = {vns_slice_proxy59[3:0]};
assign soc_eth_core_ip_rx_depacketizer_source_payload_error = soc_eth_core_ip_rx_depacketizer_sink_payload_error;
always @(*) begin
	soc_eth_core_ip_rx_depacketizer_fsm_from_idle_liteethiprx_next_value_ce1 <= 1'd0;
	soc_eth_core_ip_rx_depacketizer_source_valid <= 1'd0;
	soc_eth_core_ip_rx_depacketizer_sr_shift <= 1'd0;
	soc_eth_core_ip_rx_depacketizer_sr_shift_leftover <= 1'd0;
	soc_eth_core_ip_rx_depacketizer_source_last <= 1'd0;
	soc_eth_core_ip_rx_depacketizer_source_payload_data <= 8'd0;
	soc_eth_core_ip_rx_depacketizer_sink_ready <= 1'd0;
	vns_liteethudpipcore_liteethip_liteethiprx_liteethipv4depacketizer_next_state <= 2'd0;
	soc_eth_core_ip_rx_depacketizer_count_liteethiprx_next_value0 <= 5'd0;
	soc_eth_core_ip_rx_depacketizer_count_liteethiprx_next_value_ce0 <= 1'd0;
	soc_eth_core_ip_rx_depacketizer_fsm_from_idle_liteethiprx_next_value1 <= 1'd0;
	vns_liteethudpipcore_liteethip_liteethiprx_liteethipv4depacketizer_next_state <= vns_liteethudpipcore_liteethip_liteethiprx_liteethipv4depacketizer_state;
	case (vns_liteethudpipcore_liteethip_liteethiprx_liteethipv4depacketizer_state)
		1'd1: begin
			soc_eth_core_ip_rx_depacketizer_sink_ready <= 1'd1;
			if (soc_eth_core_ip_rx_depacketizer_sink_valid) begin
				soc_eth_core_ip_rx_depacketizer_count_liteethiprx_next_value0 <= (soc_eth_core_ip_rx_depacketizer_count + 1'd1);
				soc_eth_core_ip_rx_depacketizer_count_liteethiprx_next_value_ce0 <= 1'd1;
				soc_eth_core_ip_rx_depacketizer_sr_shift <= 1'd1;
				if ((soc_eth_core_ip_rx_depacketizer_count == 5'd19)) begin
					if (1'd0) begin
						soc_eth_core_ip_rx_depacketizer_count_liteethiprx_next_value0 <= (soc_eth_core_ip_rx_depacketizer_count + 1'd1);
						soc_eth_core_ip_rx_depacketizer_count_liteethiprx_next_value_ce0 <= 1'd1;
						vns_liteethudpipcore_liteethip_liteethiprx_liteethipv4depacketizer_next_state <= 2'd2;
					end else begin
						vns_liteethudpipcore_liteethip_liteethiprx_liteethipv4depacketizer_next_state <= 2'd3;
					end
				end
			end
		end
		2'd2: begin
			soc_eth_core_ip_rx_depacketizer_source_valid <= (soc_eth_core_ip_rx_depacketizer_sink_valid | soc_eth_core_ip_rx_depacketizer_sink_d_last);
			soc_eth_core_ip_rx_depacketizer_source_last <= (soc_eth_core_ip_rx_depacketizer_sink_last | soc_eth_core_ip_rx_depacketizer_sink_d_last);
			soc_eth_core_ip_rx_depacketizer_sink_ready <= soc_eth_core_ip_rx_depacketizer_source_ready;
			soc_eth_core_ip_rx_depacketizer_source_payload_data <= soc_eth_core_ip_rx_depacketizer_sink_d_payload_data[7:0];
			soc_eth_core_ip_rx_depacketizer_source_payload_data[7] <= soc_eth_core_ip_rx_depacketizer_sink_payload_data;
			if (soc_eth_core_ip_rx_depacketizer_fsm_from_idle) begin
				soc_eth_core_ip_rx_depacketizer_source_valid <= soc_eth_core_ip_rx_depacketizer_sink_d_last;
				soc_eth_core_ip_rx_depacketizer_sink_ready <= 1'd1;
				if (soc_eth_core_ip_rx_depacketizer_sink_valid) begin
					soc_eth_core_ip_rx_depacketizer_fsm_from_idle_liteethiprx_next_value1 <= 1'd0;
					soc_eth_core_ip_rx_depacketizer_fsm_from_idle_liteethiprx_next_value_ce1 <= 1'd1;
					soc_eth_core_ip_rx_depacketizer_sr_shift_leftover <= 1'd1;
				end
			end
			if ((soc_eth_core_ip_rx_depacketizer_source_valid & soc_eth_core_ip_rx_depacketizer_source_ready)) begin
				if (soc_eth_core_ip_rx_depacketizer_source_last) begin
					vns_liteethudpipcore_liteethip_liteethiprx_liteethipv4depacketizer_next_state <= 1'd0;
				end
			end
		end
		2'd3: begin
			soc_eth_core_ip_rx_depacketizer_source_valid <= (soc_eth_core_ip_rx_depacketizer_sink_valid | soc_eth_core_ip_rx_depacketizer_sink_d_last);
			soc_eth_core_ip_rx_depacketizer_source_last <= (soc_eth_core_ip_rx_depacketizer_sink_last | soc_eth_core_ip_rx_depacketizer_sink_d_last);
			soc_eth_core_ip_rx_depacketizer_sink_ready <= soc_eth_core_ip_rx_depacketizer_source_ready;
			soc_eth_core_ip_rx_depacketizer_source_payload_data <= soc_eth_core_ip_rx_depacketizer_sink_payload_data;
			if ((soc_eth_core_ip_rx_depacketizer_source_valid & soc_eth_core_ip_rx_depacketizer_source_ready)) begin
				if (soc_eth_core_ip_rx_depacketizer_source_last) begin
					vns_liteethudpipcore_liteethip_liteethiprx_liteethipv4depacketizer_next_state <= 1'd0;
				end
			end
		end
		default: begin
			soc_eth_core_ip_rx_depacketizer_sink_ready <= 1'd1;
			soc_eth_core_ip_rx_depacketizer_count_liteethiprx_next_value0 <= 1'd1;
			soc_eth_core_ip_rx_depacketizer_count_liteethiprx_next_value_ce0 <= 1'd1;
			if (soc_eth_core_ip_rx_depacketizer_sink_valid) begin
				soc_eth_core_ip_rx_depacketizer_sr_shift <= 1'd1;
				soc_eth_core_ip_rx_depacketizer_fsm_from_idle_liteethiprx_next_value1 <= 1'd1;
				soc_eth_core_ip_rx_depacketizer_fsm_from_idle_liteethiprx_next_value_ce1 <= 1'd1;
				if (1'd0) begin
					if (1'd0) begin
						vns_liteethudpipcore_liteethip_liteethiprx_liteethipv4depacketizer_next_state <= 2'd2;
					end else begin
						vns_liteethudpipcore_liteethip_liteethiprx_liteethipv4depacketizer_next_state <= 2'd3;
					end
				end else begin
					vns_liteethudpipcore_liteethip_liteethiprx_liteethipv4depacketizer_next_state <= 1'd1;
				end
			end
		end
	endcase
end
assign soc_eth_core_ip_rx_liteethipv4checksum_s_next0 = (soc_eth_core_ip_rx_liteethipv4checksum_r + soc_eth_core_ip_rx_liteethipv4checksum_header[15:0]);
assign soc_eth_core_ip_rx_liteethipv4checksum_s_next1 = (soc_eth_core_ip_rx_liteethipv4checksum_r_next0 + soc_eth_core_ip_rx_liteethipv4checksum_header[31:16]);
assign soc_eth_core_ip_rx_liteethipv4checksum_s_next2 = (soc_eth_core_ip_rx_liteethipv4checksum_r_next1 + soc_eth_core_ip_rx_liteethipv4checksum_header[47:32]);
assign soc_eth_core_ip_rx_liteethipv4checksum_s_next3 = (soc_eth_core_ip_rx_liteethipv4checksum_r_next2 + soc_eth_core_ip_rx_liteethipv4checksum_header[63:48]);
assign soc_eth_core_ip_rx_liteethipv4checksum_s_next4 = (soc_eth_core_ip_rx_liteethipv4checksum_r_next3 + soc_eth_core_ip_rx_liteethipv4checksum_header[79:64]);
assign soc_eth_core_ip_rx_liteethipv4checksum_s_next5 = (soc_eth_core_ip_rx_liteethipv4checksum_r_next4 + soc_eth_core_ip_rx_liteethipv4checksum_header[95:80]);
assign soc_eth_core_ip_rx_liteethipv4checksum_s_next6 = (soc_eth_core_ip_rx_liteethipv4checksum_r_next5 + soc_eth_core_ip_rx_liteethipv4checksum_header[111:96]);
assign soc_eth_core_ip_rx_liteethipv4checksum_s_next7 = (soc_eth_core_ip_rx_liteethipv4checksum_r_next6 + soc_eth_core_ip_rx_liteethipv4checksum_header[127:112]);
assign soc_eth_core_ip_rx_liteethipv4checksum_s_next8 = (soc_eth_core_ip_rx_liteethipv4checksum_r_next7 + soc_eth_core_ip_rx_liteethipv4checksum_header[143:128]);
assign soc_eth_core_ip_rx_liteethipv4checksum_s_next9 = (soc_eth_core_ip_rx_liteethipv4checksum_r_next8 + soc_eth_core_ip_rx_liteethipv4checksum_header[159:144]);
assign soc_eth_core_ip_rx_liteethipv4checksum_value = (~{soc_eth_core_ip_rx_liteethipv4checksum_r_next9[7:0], soc_eth_core_ip_rx_liteethipv4checksum_r_next9[15:8]});
assign soc_eth_core_ip_rx_liteethipv4checksum_counter_ce = (~soc_eth_core_ip_rx_liteethipv4checksum_done);
assign soc_eth_core_ip_rx_liteethipv4checksum_done = (soc_eth_core_ip_rx_liteethipv4checksum_counter == 4'd11);
always @(*) begin
	vns_liteethudpipcore_liteethip_liteethiprx_fsm_next_state <= 2'd0;
	soc_eth_core_ip_rx_depacketizer_source_ready <= 1'd0;
	soc_eth_core_ip_rx_source_source_valid <= 1'd0;
	vns_liteethudpipcore_liteethip_liteethiprx_fsm_next_state <= vns_liteethudpipcore_liteethip_liteethiprx_fsm_state;
	case (vns_liteethudpipcore_liteethip_liteethiprx_fsm_state)
		1'd1: begin
			if (soc_eth_core_ip_rx_liteethipv4checksum_done) begin
				if (soc_eth_core_ip_rx_valid) begin
					vns_liteethudpipcore_liteethip_liteethiprx_fsm_next_state <= 2'd2;
				end else begin
					vns_liteethudpipcore_liteethip_liteethiprx_fsm_next_state <= 2'd3;
				end
			end
		end
		2'd2: begin
			soc_eth_core_ip_rx_source_source_valid <= soc_eth_core_ip_rx_depacketizer_source_valid;
			soc_eth_core_ip_rx_depacketizer_source_ready <= soc_eth_core_ip_rx_source_source_ready;
			if (((soc_eth_core_ip_rx_source_source_valid & soc_eth_core_ip_rx_source_source_last) & soc_eth_core_ip_rx_source_source_ready)) begin
				vns_liteethudpipcore_liteethip_liteethiprx_fsm_next_state <= 1'd0;
			end
		end
		2'd3: begin
			soc_eth_core_ip_rx_depacketizer_source_ready <= 1'd1;
			if (((soc_eth_core_ip_rx_depacketizer_source_valid & soc_eth_core_ip_rx_depacketizer_source_last) & soc_eth_core_ip_rx_depacketizer_source_ready)) begin
				vns_liteethudpipcore_liteethip_liteethiprx_fsm_next_state <= 1'd0;
			end
		end
		default: begin
			soc_eth_core_ip_rx_depacketizer_source_ready <= 1'd1;
			if (soc_eth_core_ip_rx_depacketizer_source_valid) begin
				soc_eth_core_ip_rx_depacketizer_source_ready <= 1'd0;
				vns_liteethudpipcore_liteethip_liteethiprx_fsm_next_state <= 1'd1;
			end
		end
	endcase
end
always @(*) begin
	vns_liteethudpipcore_liteethip_sel0 <= 2'd0;
	case (soc_eth_core_ip_crossbar_sink_param_protocol)
		1'd1: begin
			vns_liteethudpipcore_liteethip_sel0 <= 1'd1;
		end
		5'd17: begin
			vns_liteethudpipcore_liteethip_sel0 <= 2'd2;
		end
		default: begin
			vns_liteethudpipcore_liteethip_sel0 <= 1'd0;
		end
	endcase
end
always @(*) begin
	vns_liteethudpipcore_liteethip_request <= 2'd0;
	vns_liteethudpipcore_liteethip_request[0] <= vns_liteethudpipcore_liteethip_status0_ongoing0;
	vns_liteethudpipcore_liteethip_request[1] <= vns_liteethudpipcore_liteethip_status1_ongoing0;
end
always @(*) begin
	soc_eth_core_ip_crossbar_source_valid <= 1'd0;
	soc_eth_core_ip_crossbar_source_first <= 1'd0;
	soc_eth_core_ip_crossbar_source_last <= 1'd0;
	soc_eth_core_ip_crossbar_source_payload_data <= 8'd0;
	soc_eth_core_ip_port_sink_ready <= 1'd0;
	soc_eth_core_ip_crossbar_source_payload_error <= 1'd0;
	soc_eth_core_ip_crossbar_source_param_length <= 16'd0;
	soc_eth_core_ip_crossbar_source_param_protocol <= 8'd0;
	soc_eth_core_ip_crossbar_source_param_ip_address <= 32'd0;
	soc_eth_core_icmp_sink_ready <= 1'd0;
	case (vns_liteethudpipcore_liteethip_grant)
		1'd0: begin
			soc_eth_core_ip_crossbar_source_valid <= soc_eth_core_icmp_sink_valid;
			soc_eth_core_icmp_sink_ready <= soc_eth_core_ip_crossbar_source_ready;
			soc_eth_core_ip_crossbar_source_first <= soc_eth_core_icmp_sink_first;
			soc_eth_core_ip_crossbar_source_last <= soc_eth_core_icmp_sink_last;
			soc_eth_core_ip_crossbar_source_payload_data <= soc_eth_core_icmp_sink_payload_data;
			soc_eth_core_ip_crossbar_source_payload_error <= soc_eth_core_icmp_sink_payload_error;
			soc_eth_core_ip_crossbar_source_param_length <= soc_eth_core_icmp_sink_param_length;
			soc_eth_core_ip_crossbar_source_param_protocol <= soc_eth_core_icmp_sink_param_protocol;
			soc_eth_core_ip_crossbar_source_param_ip_address <= soc_eth_core_icmp_sink_param_ip_address;
		end
		1'd1: begin
			soc_eth_core_ip_crossbar_source_valid <= soc_eth_core_ip_port_sink_valid;
			soc_eth_core_ip_port_sink_ready <= soc_eth_core_ip_crossbar_source_ready;
			soc_eth_core_ip_crossbar_source_first <= soc_eth_core_ip_port_sink_first;
			soc_eth_core_ip_crossbar_source_last <= soc_eth_core_ip_port_sink_last;
			soc_eth_core_ip_crossbar_source_payload_data <= soc_eth_core_ip_port_sink_payload_data;
			soc_eth_core_ip_crossbar_source_payload_error <= soc_eth_core_ip_port_sink_payload_error;
			soc_eth_core_ip_crossbar_source_param_length <= soc_eth_core_ip_port_sink_param_length;
			soc_eth_core_ip_crossbar_source_param_protocol <= soc_eth_core_ip_port_sink_param_protocol;
			soc_eth_core_ip_crossbar_source_param_ip_address <= soc_eth_core_ip_port_sink_param_ip_address;
		end
	endcase
end
always @(*) begin
	vns_liteethudpipcore_liteethip_status0_last <= 1'd0;
	if (soc_eth_core_icmp_sink_valid) begin
		vns_liteethudpipcore_liteethip_status0_last <= (soc_eth_core_icmp_sink_last & soc_eth_core_icmp_sink_ready);
	end
end
assign vns_liteethudpipcore_liteethip_status0_ongoing0 = ((soc_eth_core_icmp_sink_valid | vns_liteethudpipcore_liteethip_status0_ongoing1) & (~vns_liteethudpipcore_liteethip_status0_last));
always @(*) begin
	vns_liteethudpipcore_liteethip_status1_last <= 1'd0;
	if (soc_eth_core_ip_port_sink_valid) begin
		vns_liteethudpipcore_liteethip_status1_last <= (soc_eth_core_ip_port_sink_last & soc_eth_core_ip_port_sink_ready);
	end
end
assign vns_liteethudpipcore_liteethip_status1_ongoing0 = ((soc_eth_core_ip_port_sink_valid | vns_liteethudpipcore_liteethip_status1_ongoing1) & (~vns_liteethudpipcore_liteethip_status1_last));
always @(*) begin
	vns_liteethudpipcore_liteethip_sel1 <= 2'd0;
	if (vns_liteethudpipcore_liteethip_first) begin
		vns_liteethudpipcore_liteethip_sel1 <= vns_liteethudpipcore_liteethip_sel0;
	end else begin
		vns_liteethudpipcore_liteethip_sel1 <= vns_liteethudpipcore_liteethip_sel_ongoing;
	end
end
always @(*) begin
	soc_eth_core_ip_crossbar_sink_ready <= 1'd0;
	soc_eth_core_ip_port_source_valid <= 1'd0;
	soc_eth_core_ip_port_source_first <= 1'd0;
	soc_eth_core_ip_port_source_last <= 1'd0;
	soc_eth_core_ip_port_source_payload_data <= 8'd0;
	soc_eth_core_ip_port_source_payload_error <= 1'd0;
	soc_eth_core_ip_port_source_param_length <= 16'd0;
	soc_eth_core_ip_port_source_param_protocol <= 8'd0;
	soc_eth_core_ip_port_source_param_ip_address <= 32'd0;
	soc_eth_core_icmp_source_valid <= 1'd0;
	soc_eth_core_icmp_source_first <= 1'd0;
	soc_eth_core_icmp_source_last <= 1'd0;
	soc_eth_core_icmp_source_payload_data <= 8'd0;
	soc_eth_core_icmp_source_payload_error <= 1'd0;
	soc_eth_core_icmp_source_param_length <= 16'd0;
	soc_eth_core_icmp_source_param_protocol <= 8'd0;
	soc_eth_core_icmp_source_param_ip_address <= 32'd0;
	case (vns_liteethudpipcore_liteethip_sel1)
		1'd1: begin
			soc_eth_core_icmp_source_valid <= soc_eth_core_ip_crossbar_sink_valid;
			soc_eth_core_ip_crossbar_sink_ready <= soc_eth_core_icmp_source_ready;
			soc_eth_core_icmp_source_first <= soc_eth_core_ip_crossbar_sink_first;
			soc_eth_core_icmp_source_last <= soc_eth_core_ip_crossbar_sink_last;
			soc_eth_core_icmp_source_payload_data <= soc_eth_core_ip_crossbar_sink_payload_data;
			soc_eth_core_icmp_source_payload_error <= soc_eth_core_ip_crossbar_sink_payload_error;
			soc_eth_core_icmp_source_param_length <= soc_eth_core_ip_crossbar_sink_param_length;
			soc_eth_core_icmp_source_param_protocol <= soc_eth_core_ip_crossbar_sink_param_protocol;
			soc_eth_core_icmp_source_param_ip_address <= soc_eth_core_ip_crossbar_sink_param_ip_address;
		end
		2'd2: begin
			soc_eth_core_ip_port_source_valid <= soc_eth_core_ip_crossbar_sink_valid;
			soc_eth_core_ip_crossbar_sink_ready <= soc_eth_core_ip_port_source_ready;
			soc_eth_core_ip_port_source_first <= soc_eth_core_ip_crossbar_sink_first;
			soc_eth_core_ip_port_source_last <= soc_eth_core_ip_crossbar_sink_last;
			soc_eth_core_ip_port_source_payload_data <= soc_eth_core_ip_crossbar_sink_payload_data;
			soc_eth_core_ip_port_source_payload_error <= soc_eth_core_ip_crossbar_sink_payload_error;
			soc_eth_core_ip_port_source_param_length <= soc_eth_core_ip_crossbar_sink_param_length;
			soc_eth_core_ip_port_source_param_protocol <= soc_eth_core_ip_crossbar_sink_param_protocol;
			soc_eth_core_ip_port_source_param_ip_address <= soc_eth_core_ip_crossbar_sink_param_ip_address;
		end
		default: begin
			soc_eth_core_ip_crossbar_sink_ready <= 1'd1;
		end
	endcase
end
always @(*) begin
	vns_liteethudpipcore_liteethip_last <= 1'd0;
	if (soc_eth_core_ip_crossbar_sink_valid) begin
		vns_liteethudpipcore_liteethip_last <= (soc_eth_core_ip_crossbar_sink_last & soc_eth_core_ip_crossbar_sink_ready);
	end
end
assign vns_liteethudpipcore_liteethip_ongoing0 = ((soc_eth_core_ip_crossbar_sink_valid | vns_liteethudpipcore_liteethip_ongoing1) & (~vns_liteethudpipcore_liteethip_last));
assign soc_eth_core_icmp_echo_sink_sink_valid = soc_eth_core_icmp_rx_source_source_valid;
assign soc_eth_core_icmp_rx_source_source_ready = soc_eth_core_icmp_echo_sink_sink_ready;
assign soc_eth_core_icmp_echo_sink_sink_first = soc_eth_core_icmp_rx_source_source_first;
assign soc_eth_core_icmp_echo_sink_sink_last = soc_eth_core_icmp_rx_source_source_last;
assign soc_eth_core_icmp_echo_sink_sink_payload_data = soc_eth_core_icmp_rx_source_source_payload_data;
assign soc_eth_core_icmp_echo_sink_sink_payload_error = soc_eth_core_icmp_rx_source_source_payload_error;
assign soc_eth_core_icmp_echo_sink_sink_param_checksum = soc_eth_core_icmp_rx_source_source_param_checksum;
assign soc_eth_core_icmp_echo_sink_sink_param_code = soc_eth_core_icmp_rx_source_source_param_code;
assign soc_eth_core_icmp_echo_sink_sink_param_msgtype = soc_eth_core_icmp_rx_source_source_param_msgtype;
assign soc_eth_core_icmp_echo_sink_sink_param_quench = soc_eth_core_icmp_rx_source_source_param_quench;
assign soc_eth_core_icmp_echo_sink_sink_param_ip_address = soc_eth_core_icmp_rx_source_source_param_ip_address;
assign soc_eth_core_icmp_echo_sink_sink_param_length = soc_eth_core_icmp_rx_source_source_param_length;
assign soc_eth_core_icmp_tx_sink_sink_valid = soc_eth_core_icmp_echo_source_source_valid;
assign soc_eth_core_icmp_echo_source_source_ready = soc_eth_core_icmp_tx_sink_sink_ready;
assign soc_eth_core_icmp_tx_sink_sink_first = soc_eth_core_icmp_echo_source_source_first;
assign soc_eth_core_icmp_tx_sink_sink_last = soc_eth_core_icmp_echo_source_source_last;
assign soc_eth_core_icmp_tx_sink_sink_payload_data = soc_eth_core_icmp_echo_source_source_payload_data;
assign soc_eth_core_icmp_tx_sink_sink_payload_error = soc_eth_core_icmp_echo_source_source_payload_error;
assign soc_eth_core_icmp_tx_sink_sink_param_checksum = soc_eth_core_icmp_echo_source_source_param_checksum;
assign soc_eth_core_icmp_tx_sink_sink_param_code = soc_eth_core_icmp_echo_source_source_param_code;
assign soc_eth_core_icmp_tx_sink_sink_param_msgtype = soc_eth_core_icmp_echo_source_source_param_msgtype;
assign soc_eth_core_icmp_tx_sink_sink_param_quench = soc_eth_core_icmp_echo_source_source_param_quench;
assign soc_eth_core_icmp_tx_sink_sink_param_ip_address = soc_eth_core_icmp_echo_source_source_param_ip_address;
assign soc_eth_core_icmp_tx_sink_sink_param_length = soc_eth_core_icmp_echo_source_source_param_length;
assign soc_eth_core_icmp_sink_valid = soc_eth_core_icmp_tx_source_source_valid;
assign soc_eth_core_icmp_tx_source_source_ready = soc_eth_core_icmp_sink_ready;
assign soc_eth_core_icmp_sink_first = soc_eth_core_icmp_tx_source_source_first;
assign soc_eth_core_icmp_sink_last = soc_eth_core_icmp_tx_source_source_last;
assign soc_eth_core_icmp_sink_payload_data = soc_eth_core_icmp_tx_source_source_payload_data;
assign soc_eth_core_icmp_sink_payload_error = soc_eth_core_icmp_tx_source_source_payload_error;
assign soc_eth_core_icmp_sink_param_length = soc_eth_core_icmp_tx_source_source_param_length;
assign soc_eth_core_icmp_sink_param_protocol = soc_eth_core_icmp_tx_source_source_param_protocol;
assign soc_eth_core_icmp_sink_param_ip_address = soc_eth_core_icmp_tx_source_source_param_ip_address;
assign soc_eth_core_icmp_rx_sink_sink_valid = soc_eth_core_icmp_source_valid;
assign soc_eth_core_icmp_source_ready = soc_eth_core_icmp_rx_sink_sink_ready;
assign soc_eth_core_icmp_rx_sink_sink_first = soc_eth_core_icmp_source_first;
assign soc_eth_core_icmp_rx_sink_sink_last = soc_eth_core_icmp_source_last;
assign soc_eth_core_icmp_rx_sink_sink_payload_data = soc_eth_core_icmp_source_payload_data;
assign soc_eth_core_icmp_rx_sink_sink_payload_error = soc_eth_core_icmp_source_payload_error;
assign soc_eth_core_icmp_rx_sink_sink_param_length = soc_eth_core_icmp_source_param_length;
assign soc_eth_core_icmp_rx_sink_sink_param_protocol = soc_eth_core_icmp_source_param_protocol;
assign soc_eth_core_icmp_rx_sink_sink_param_ip_address = soc_eth_core_icmp_source_param_ip_address;
assign soc_eth_core_icmp_tx_packetizer_sink_valid = soc_eth_core_icmp_tx_sink_sink_valid;
assign soc_eth_core_icmp_tx_packetizer_sink_last = soc_eth_core_icmp_tx_sink_sink_last;
assign soc_eth_core_icmp_tx_sink_sink_ready = soc_eth_core_icmp_tx_packetizer_sink_ready;
assign soc_eth_core_icmp_tx_packetizer_sink_param_msgtype = soc_eth_core_icmp_tx_sink_sink_param_msgtype;
assign soc_eth_core_icmp_tx_packetizer_sink_param_code = soc_eth_core_icmp_tx_sink_sink_param_code;
assign soc_eth_core_icmp_tx_packetizer_sink_param_checksum = soc_eth_core_icmp_tx_sink_sink_param_checksum;
assign soc_eth_core_icmp_tx_packetizer_sink_param_quench = soc_eth_core_icmp_tx_sink_sink_param_quench;
assign soc_eth_core_icmp_tx_packetizer_sink_payload_data = soc_eth_core_icmp_tx_sink_sink_payload_data;
always @(*) begin
	soc_eth_core_icmp_tx_packetizer_header <= 64'd0;
	soc_eth_core_icmp_tx_packetizer_header[31:16] <= {soc_eth_core_icmp_tx_packetizer_sink_param_checksum[7:0], soc_eth_core_icmp_tx_packetizer_sink_param_checksum[15:8]};
	soc_eth_core_icmp_tx_packetizer_header[15:8] <= {soc_eth_core_icmp_tx_packetizer_sink_param_code[7:0]};
	soc_eth_core_icmp_tx_packetizer_header[7:0] <= {soc_eth_core_icmp_tx_packetizer_sink_param_msgtype[7:0]};
	soc_eth_core_icmp_tx_packetizer_header[63:32] <= {soc_eth_core_icmp_tx_packetizer_sink_param_quench[7:0], soc_eth_core_icmp_tx_packetizer_sink_param_quench[15:8], soc_eth_core_icmp_tx_packetizer_sink_param_quench[23:16], soc_eth_core_icmp_tx_packetizer_sink_param_quench[31:24]};
end
assign soc_eth_core_icmp_tx_packetizer_source_payload_error = soc_eth_core_icmp_tx_packetizer_sink_payload_error;
always @(*) begin
	soc_eth_core_icmp_tx_packetizer_source_valid <= 1'd0;
	vns_liteethudpipcore_liteethicmptx_liteethicmppacketizer_next_state <= 2'd0;
	soc_eth_core_icmp_tx_packetizer_source_last <= 1'd0;
	soc_eth_core_icmp_tx_packetizer_count_liteethicmptx_next_value0 <= 3'd0;
	soc_eth_core_icmp_tx_packetizer_source_payload_data <= 8'd0;
	soc_eth_core_icmp_tx_packetizer_count_liteethicmptx_next_value_ce0 <= 1'd0;
	soc_eth_core_icmp_tx_packetizer_sink_ready <= 1'd0;
	soc_eth_core_icmp_tx_packetizer_fsm_from_idle_liteethicmptx_next_value1 <= 1'd0;
	soc_eth_core_icmp_tx_packetizer_fsm_from_idle_liteethicmptx_next_value_ce1 <= 1'd0;
	soc_eth_core_icmp_tx_packetizer_sr_load <= 1'd0;
	soc_eth_core_icmp_tx_packetizer_sr_shift <= 1'd0;
	vns_liteethudpipcore_liteethicmptx_liteethicmppacketizer_next_state <= vns_liteethudpipcore_liteethicmptx_liteethicmppacketizer_state;
	case (vns_liteethudpipcore_liteethicmptx_liteethicmppacketizer_state)
		1'd1: begin
			soc_eth_core_icmp_tx_packetizer_source_valid <= 1'd1;
			soc_eth_core_icmp_tx_packetizer_source_last <= 1'd0;
			soc_eth_core_icmp_tx_packetizer_source_payload_data <= soc_eth_core_icmp_tx_packetizer_sr[63:8];
			if ((soc_eth_core_icmp_tx_packetizer_source_valid & soc_eth_core_icmp_tx_packetizer_source_ready)) begin
				soc_eth_core_icmp_tx_packetizer_sr_shift <= 1'd1;
				if ((soc_eth_core_icmp_tx_packetizer_count == 3'd7)) begin
					soc_eth_core_icmp_tx_packetizer_sr_shift <= 1'd0;
					if (1'd0) begin
						vns_liteethudpipcore_liteethicmptx_liteethicmppacketizer_next_state <= 2'd3;
						soc_eth_core_icmp_tx_packetizer_count_liteethicmptx_next_value0 <= (soc_eth_core_icmp_tx_packetizer_count + 1'd1);
						soc_eth_core_icmp_tx_packetizer_count_liteethicmptx_next_value_ce0 <= 1'd1;
					end else begin
						vns_liteethudpipcore_liteethicmptx_liteethicmppacketizer_next_state <= 2'd2;
					end
				end else begin
					soc_eth_core_icmp_tx_packetizer_count_liteethicmptx_next_value0 <= (soc_eth_core_icmp_tx_packetizer_count + 1'd1);
					soc_eth_core_icmp_tx_packetizer_count_liteethicmptx_next_value_ce0 <= 1'd1;
				end
			end
		end
		2'd2: begin
			soc_eth_core_icmp_tx_packetizer_source_valid <= soc_eth_core_icmp_tx_packetizer_sink_valid;
			soc_eth_core_icmp_tx_packetizer_source_last <= soc_eth_core_icmp_tx_packetizer_sink_last;
			soc_eth_core_icmp_tx_packetizer_source_payload_data <= soc_eth_core_icmp_tx_packetizer_sink_payload_data;
			if ((soc_eth_core_icmp_tx_packetizer_source_valid & soc_eth_core_icmp_tx_packetizer_source_ready)) begin
				soc_eth_core_icmp_tx_packetizer_sink_ready <= 1'd1;
				if (soc_eth_core_icmp_tx_packetizer_source_last) begin
					vns_liteethudpipcore_liteethicmptx_liteethicmppacketizer_next_state <= 1'd0;
				end
			end
		end
		2'd3: begin
			soc_eth_core_icmp_tx_packetizer_source_valid <= (soc_eth_core_icmp_tx_packetizer_sink_valid | soc_eth_core_icmp_tx_packetizer_sink_d_last);
			soc_eth_core_icmp_tx_packetizer_source_last <= soc_eth_core_icmp_tx_packetizer_sink_d_last;
			if (soc_eth_core_icmp_tx_packetizer_fsm_from_idle) begin
				soc_eth_core_icmp_tx_packetizer_source_payload_data[0] <= soc_eth_core_icmp_tx_packetizer_sr[63:16];
			end else begin
				soc_eth_core_icmp_tx_packetizer_source_payload_data[0] <= soc_eth_core_icmp_tx_packetizer_sink_d_payload_data[7];
			end
			soc_eth_core_icmp_tx_packetizer_source_payload_data[7:0] <= soc_eth_core_icmp_tx_packetizer_sink_payload_data;
			if ((soc_eth_core_icmp_tx_packetizer_source_valid & soc_eth_core_icmp_tx_packetizer_source_ready)) begin
				soc_eth_core_icmp_tx_packetizer_sink_ready <= (~soc_eth_core_icmp_tx_packetizer_source_last);
				soc_eth_core_icmp_tx_packetizer_fsm_from_idle_liteethicmptx_next_value1 <= 1'd0;
				soc_eth_core_icmp_tx_packetizer_fsm_from_idle_liteethicmptx_next_value_ce1 <= 1'd1;
				if (soc_eth_core_icmp_tx_packetizer_source_last) begin
					vns_liteethudpipcore_liteethicmptx_liteethicmppacketizer_next_state <= 1'd0;
				end
			end
		end
		default: begin
			soc_eth_core_icmp_tx_packetizer_sink_ready <= 1'd1;
			soc_eth_core_icmp_tx_packetizer_count_liteethicmptx_next_value0 <= 1'd1;
			soc_eth_core_icmp_tx_packetizer_count_liteethicmptx_next_value_ce0 <= 1'd1;
			if (soc_eth_core_icmp_tx_packetizer_sink_valid) begin
				soc_eth_core_icmp_tx_packetizer_sink_ready <= 1'd0;
				soc_eth_core_icmp_tx_packetizer_source_valid <= 1'd1;
				soc_eth_core_icmp_tx_packetizer_source_last <= 1'd0;
				soc_eth_core_icmp_tx_packetizer_source_payload_data <= soc_eth_core_icmp_tx_packetizer_header[7:0];
				if ((soc_eth_core_icmp_tx_packetizer_source_valid & soc_eth_core_icmp_tx_packetizer_source_ready)) begin
					soc_eth_core_icmp_tx_packetizer_sr_load <= 1'd1;
					soc_eth_core_icmp_tx_packetizer_fsm_from_idle_liteethicmptx_next_value1 <= 1'd1;
					soc_eth_core_icmp_tx_packetizer_fsm_from_idle_liteethicmptx_next_value_ce1 <= 1'd1;
					if (1'd0) begin
						if (1'd0) begin
							vns_liteethudpipcore_liteethicmptx_liteethicmppacketizer_next_state <= 2'd3;
						end else begin
							vns_liteethudpipcore_liteethicmptx_liteethicmppacketizer_next_state <= 2'd2;
						end
					end else begin
						vns_liteethudpipcore_liteethicmptx_liteethicmppacketizer_next_state <= 1'd1;
					end
				end
			end
		end
	endcase
end
always @(*) begin
	soc_eth_core_icmp_tx_source_source_valid <= 1'd0;
	soc_eth_core_icmp_tx_source_source_first <= 1'd0;
	soc_eth_core_icmp_tx_source_source_last <= 1'd0;
	soc_eth_core_icmp_tx_packetizer_source_ready <= 1'd0;
	soc_eth_core_icmp_tx_source_source_payload_data <= 8'd0;
	soc_eth_core_icmp_tx_source_source_payload_error <= 1'd0;
	soc_eth_core_icmp_tx_source_source_param_length <= 16'd0;
	soc_eth_core_icmp_tx_source_source_param_protocol <= 8'd0;
	soc_eth_core_icmp_tx_source_source_param_ip_address <= 32'd0;
	vns_liteethudpipcore_liteethicmptx_fsm_next_state <= 1'd0;
	vns_liteethudpipcore_liteethicmptx_fsm_next_state <= vns_liteethudpipcore_liteethicmptx_fsm_state;
	case (vns_liteethudpipcore_liteethicmptx_fsm_state)
		1'd1: begin
			soc_eth_core_icmp_tx_source_source_valid <= soc_eth_core_icmp_tx_packetizer_source_valid;
			soc_eth_core_icmp_tx_packetizer_source_ready <= soc_eth_core_icmp_tx_source_source_ready;
			soc_eth_core_icmp_tx_source_source_first <= soc_eth_core_icmp_tx_packetizer_source_first;
			soc_eth_core_icmp_tx_source_source_last <= soc_eth_core_icmp_tx_packetizer_source_last;
			soc_eth_core_icmp_tx_source_source_payload_data <= soc_eth_core_icmp_tx_packetizer_source_payload_data;
			soc_eth_core_icmp_tx_source_source_payload_error <= soc_eth_core_icmp_tx_packetizer_source_payload_error;
			soc_eth_core_icmp_tx_source_source_param_length <= soc_eth_core_icmp_tx_packetizer_source_param_length;
			soc_eth_core_icmp_tx_source_source_param_protocol <= soc_eth_core_icmp_tx_packetizer_source_param_protocol;
			soc_eth_core_icmp_tx_source_source_param_ip_address <= soc_eth_core_icmp_tx_packetizer_source_param_ip_address;
			soc_eth_core_icmp_tx_source_source_param_length <= (soc_eth_core_icmp_tx_sink_sink_param_length + 4'd8);
			soc_eth_core_icmp_tx_source_source_param_protocol <= 1'd1;
			soc_eth_core_icmp_tx_source_source_param_ip_address <= soc_eth_core_icmp_tx_sink_sink_param_ip_address;
			if (((soc_eth_core_icmp_tx_source_source_valid & soc_eth_core_icmp_tx_source_source_last) & soc_eth_core_icmp_tx_source_source_ready)) begin
				vns_liteethudpipcore_liteethicmptx_fsm_next_state <= 1'd0;
			end
		end
		default: begin
			soc_eth_core_icmp_tx_packetizer_source_ready <= 1'd1;
			if (soc_eth_core_icmp_tx_packetizer_source_valid) begin
				soc_eth_core_icmp_tx_packetizer_source_ready <= 1'd0;
				vns_liteethudpipcore_liteethicmptx_fsm_next_state <= 1'd1;
			end
		end
	endcase
end
assign soc_eth_core_icmp_rx_depacketizer_sink_valid = soc_eth_core_icmp_rx_sink_sink_valid;
assign soc_eth_core_icmp_rx_sink_sink_ready = soc_eth_core_icmp_rx_depacketizer_sink_ready;
assign soc_eth_core_icmp_rx_depacketizer_sink_first = soc_eth_core_icmp_rx_sink_sink_first;
assign soc_eth_core_icmp_rx_depacketizer_sink_last = soc_eth_core_icmp_rx_sink_sink_last;
assign soc_eth_core_icmp_rx_depacketizer_sink_payload_data = soc_eth_core_icmp_rx_sink_sink_payload_data;
assign soc_eth_core_icmp_rx_depacketizer_sink_payload_error = soc_eth_core_icmp_rx_sink_sink_payload_error;
assign soc_eth_core_icmp_rx_depacketizer_sink_param_length = soc_eth_core_icmp_rx_sink_sink_param_length;
assign soc_eth_core_icmp_rx_depacketizer_sink_param_protocol = soc_eth_core_icmp_rx_sink_sink_param_protocol;
assign soc_eth_core_icmp_rx_depacketizer_sink_param_ip_address = soc_eth_core_icmp_rx_sink_sink_param_ip_address;
assign soc_eth_core_icmp_rx_source_source_last = soc_eth_core_icmp_rx_depacketizer_source_last;
assign soc_eth_core_icmp_rx_source_source_param_msgtype = soc_eth_core_icmp_rx_depacketizer_source_param_msgtype;
assign soc_eth_core_icmp_rx_source_source_param_code = soc_eth_core_icmp_rx_depacketizer_source_param_code;
assign soc_eth_core_icmp_rx_source_source_param_checksum = soc_eth_core_icmp_rx_depacketizer_source_param_checksum;
assign soc_eth_core_icmp_rx_source_source_param_quench = soc_eth_core_icmp_rx_depacketizer_source_param_quench;
assign soc_eth_core_icmp_rx_source_source_param_ip_address = soc_eth_core_icmp_rx_sink_sink_param_ip_address;
assign soc_eth_core_icmp_rx_source_source_param_length = (soc_eth_core_icmp_rx_sink_sink_param_length - 4'd8);
assign soc_eth_core_icmp_rx_source_source_payload_data = soc_eth_core_icmp_rx_depacketizer_source_payload_data;
assign soc_eth_core_icmp_rx_source_source_payload_error = soc_eth_core_icmp_rx_depacketizer_source_payload_error;
assign soc_eth_core_icmp_rx_depacketizer_header = soc_eth_core_icmp_rx_depacketizer_sr;
assign soc_eth_core_icmp_rx_depacketizer_source_param_checksum = {vns_slice_proxy61[7:0], vns_slice_proxy60[15:8]};
assign soc_eth_core_icmp_rx_depacketizer_source_param_code = {vns_slice_proxy62[7:0]};
assign soc_eth_core_icmp_rx_depacketizer_source_param_msgtype = {vns_slice_proxy63[7:0]};
assign soc_eth_core_icmp_rx_depacketizer_source_param_quench = {vns_slice_proxy67[7:0], vns_slice_proxy66[15:8], vns_slice_proxy65[23:16], vns_slice_proxy64[31:24]};
assign soc_eth_core_icmp_rx_depacketizer_source_payload_error = soc_eth_core_icmp_rx_depacketizer_sink_payload_error;
always @(*) begin
	soc_eth_core_icmp_rx_depacketizer_sr_shift <= 1'd0;
	soc_eth_core_icmp_rx_depacketizer_sr_shift_leftover <= 1'd0;
	vns_liteethudpipcore_liteethicmprx_liteethicmpdepacketizer_next_state <= 2'd0;
	soc_eth_core_icmp_rx_depacketizer_count_liteethicmprx_next_value0 <= 3'd0;
	soc_eth_core_icmp_rx_depacketizer_source_valid <= 1'd0;
	soc_eth_core_icmp_rx_depacketizer_count_liteethicmprx_next_value_ce0 <= 1'd0;
	soc_eth_core_icmp_rx_depacketizer_fsm_from_idle_liteethicmprx_next_value1 <= 1'd0;
	soc_eth_core_icmp_rx_depacketizer_source_last <= 1'd0;
	soc_eth_core_icmp_rx_depacketizer_fsm_from_idle_liteethicmprx_next_value_ce1 <= 1'd0;
	soc_eth_core_icmp_rx_depacketizer_source_payload_data <= 8'd0;
	soc_eth_core_icmp_rx_depacketizer_sink_ready <= 1'd0;
	vns_liteethudpipcore_liteethicmprx_liteethicmpdepacketizer_next_state <= vns_liteethudpipcore_liteethicmprx_liteethicmpdepacketizer_state;
	case (vns_liteethudpipcore_liteethicmprx_liteethicmpdepacketizer_state)
		1'd1: begin
			soc_eth_core_icmp_rx_depacketizer_sink_ready <= 1'd1;
			if (soc_eth_core_icmp_rx_depacketizer_sink_valid) begin
				soc_eth_core_icmp_rx_depacketizer_count_liteethicmprx_next_value0 <= (soc_eth_core_icmp_rx_depacketizer_count + 1'd1);
				soc_eth_core_icmp_rx_depacketizer_count_liteethicmprx_next_value_ce0 <= 1'd1;
				soc_eth_core_icmp_rx_depacketizer_sr_shift <= 1'd1;
				if ((soc_eth_core_icmp_rx_depacketizer_count == 3'd7)) begin
					if (1'd0) begin
						soc_eth_core_icmp_rx_depacketizer_count_liteethicmprx_next_value0 <= (soc_eth_core_icmp_rx_depacketizer_count + 1'd1);
						soc_eth_core_icmp_rx_depacketizer_count_liteethicmprx_next_value_ce0 <= 1'd1;
						vns_liteethudpipcore_liteethicmprx_liteethicmpdepacketizer_next_state <= 2'd2;
					end else begin
						vns_liteethudpipcore_liteethicmprx_liteethicmpdepacketizer_next_state <= 2'd3;
					end
				end
			end
		end
		2'd2: begin
			soc_eth_core_icmp_rx_depacketizer_source_valid <= (soc_eth_core_icmp_rx_depacketizer_sink_valid | soc_eth_core_icmp_rx_depacketizer_sink_d_last);
			soc_eth_core_icmp_rx_depacketizer_source_last <= (soc_eth_core_icmp_rx_depacketizer_sink_last | soc_eth_core_icmp_rx_depacketizer_sink_d_last);
			soc_eth_core_icmp_rx_depacketizer_sink_ready <= soc_eth_core_icmp_rx_depacketizer_source_ready;
			soc_eth_core_icmp_rx_depacketizer_source_payload_data <= soc_eth_core_icmp_rx_depacketizer_sink_d_payload_data[7:0];
			soc_eth_core_icmp_rx_depacketizer_source_payload_data[7] <= soc_eth_core_icmp_rx_depacketizer_sink_payload_data;
			if (soc_eth_core_icmp_rx_depacketizer_fsm_from_idle) begin
				soc_eth_core_icmp_rx_depacketizer_source_valid <= soc_eth_core_icmp_rx_depacketizer_sink_d_last;
				soc_eth_core_icmp_rx_depacketizer_sink_ready <= 1'd1;
				if (soc_eth_core_icmp_rx_depacketizer_sink_valid) begin
					soc_eth_core_icmp_rx_depacketizer_fsm_from_idle_liteethicmprx_next_value1 <= 1'd0;
					soc_eth_core_icmp_rx_depacketizer_fsm_from_idle_liteethicmprx_next_value_ce1 <= 1'd1;
					soc_eth_core_icmp_rx_depacketizer_sr_shift_leftover <= 1'd1;
				end
			end
			if ((soc_eth_core_icmp_rx_depacketizer_source_valid & soc_eth_core_icmp_rx_depacketizer_source_ready)) begin
				if (soc_eth_core_icmp_rx_depacketizer_source_last) begin
					vns_liteethudpipcore_liteethicmprx_liteethicmpdepacketizer_next_state <= 1'd0;
				end
			end
		end
		2'd3: begin
			soc_eth_core_icmp_rx_depacketizer_source_valid <= (soc_eth_core_icmp_rx_depacketizer_sink_valid | soc_eth_core_icmp_rx_depacketizer_sink_d_last);
			soc_eth_core_icmp_rx_depacketizer_source_last <= (soc_eth_core_icmp_rx_depacketizer_sink_last | soc_eth_core_icmp_rx_depacketizer_sink_d_last);
			soc_eth_core_icmp_rx_depacketizer_sink_ready <= soc_eth_core_icmp_rx_depacketizer_source_ready;
			soc_eth_core_icmp_rx_depacketizer_source_payload_data <= soc_eth_core_icmp_rx_depacketizer_sink_payload_data;
			if ((soc_eth_core_icmp_rx_depacketizer_source_valid & soc_eth_core_icmp_rx_depacketizer_source_ready)) begin
				if (soc_eth_core_icmp_rx_depacketizer_source_last) begin
					vns_liteethudpipcore_liteethicmprx_liteethicmpdepacketizer_next_state <= 1'd0;
				end
			end
		end
		default: begin
			soc_eth_core_icmp_rx_depacketizer_sink_ready <= 1'd1;
			soc_eth_core_icmp_rx_depacketizer_count_liteethicmprx_next_value0 <= 1'd1;
			soc_eth_core_icmp_rx_depacketizer_count_liteethicmprx_next_value_ce0 <= 1'd1;
			if (soc_eth_core_icmp_rx_depacketizer_sink_valid) begin
				soc_eth_core_icmp_rx_depacketizer_sr_shift <= 1'd1;
				soc_eth_core_icmp_rx_depacketizer_fsm_from_idle_liteethicmprx_next_value1 <= 1'd1;
				soc_eth_core_icmp_rx_depacketizer_fsm_from_idle_liteethicmprx_next_value_ce1 <= 1'd1;
				if (1'd0) begin
					if (1'd0) begin
						vns_liteethudpipcore_liteethicmprx_liteethicmpdepacketizer_next_state <= 2'd2;
					end else begin
						vns_liteethudpipcore_liteethicmprx_liteethicmpdepacketizer_next_state <= 2'd3;
					end
				end else begin
					vns_liteethudpipcore_liteethicmprx_liteethicmpdepacketizer_next_state <= 1'd1;
				end
			end
		end
	endcase
end
always @(*) begin
	soc_eth_core_icmp_rx_source_source_valid <= 1'd0;
	vns_liteethudpipcore_liteethicmprx_fsm_next_state <= 2'd0;
	soc_eth_core_icmp_rx_depacketizer_source_ready <= 1'd0;
	vns_liteethudpipcore_liteethicmprx_fsm_next_state <= vns_liteethudpipcore_liteethicmprx_fsm_state;
	case (vns_liteethudpipcore_liteethicmprx_fsm_state)
		1'd1: begin
			if (soc_eth_core_icmp_rx_valid) begin
				vns_liteethudpipcore_liteethicmprx_fsm_next_state <= 2'd2;
			end else begin
				vns_liteethudpipcore_liteethicmprx_fsm_next_state <= 2'd3;
			end
		end
		2'd2: begin
			soc_eth_core_icmp_rx_source_source_valid <= soc_eth_core_icmp_rx_depacketizer_source_valid;
			soc_eth_core_icmp_rx_depacketizer_source_ready <= soc_eth_core_icmp_rx_source_source_ready;
			if (((soc_eth_core_icmp_rx_source_source_valid & soc_eth_core_icmp_rx_source_source_last) & soc_eth_core_icmp_rx_source_source_ready)) begin
				vns_liteethudpipcore_liteethicmprx_fsm_next_state <= 1'd0;
			end
		end
		2'd3: begin
			soc_eth_core_icmp_rx_depacketizer_source_ready <= 1'd1;
			if (((soc_eth_core_icmp_rx_depacketizer_source_valid & soc_eth_core_icmp_rx_depacketizer_source_last) & soc_eth_core_icmp_rx_depacketizer_source_ready)) begin
				vns_liteethudpipcore_liteethicmprx_fsm_next_state <= 1'd0;
			end
		end
		default: begin
			soc_eth_core_icmp_rx_depacketizer_source_ready <= 1'd1;
			if (soc_eth_core_icmp_rx_depacketizer_source_valid) begin
				soc_eth_core_icmp_rx_depacketizer_source_ready <= 1'd0;
				vns_liteethudpipcore_liteethicmprx_fsm_next_state <= 1'd1;
			end
		end
	endcase
end
assign soc_eth_core_icmp_echo_buffer_sink_valid = soc_eth_core_icmp_echo_sink_sink_valid;
assign soc_eth_core_icmp_echo_sink_sink_ready = soc_eth_core_icmp_echo_buffer_sink_ready;
assign soc_eth_core_icmp_echo_buffer_sink_first = soc_eth_core_icmp_echo_sink_sink_first;
assign soc_eth_core_icmp_echo_buffer_sink_last = soc_eth_core_icmp_echo_sink_sink_last;
assign soc_eth_core_icmp_echo_buffer_sink_payload_data = soc_eth_core_icmp_echo_sink_sink_payload_data;
assign soc_eth_core_icmp_echo_buffer_sink_payload_error = soc_eth_core_icmp_echo_sink_sink_payload_error;
assign soc_eth_core_icmp_echo_buffer_sink_param_checksum = soc_eth_core_icmp_echo_sink_sink_param_checksum;
assign soc_eth_core_icmp_echo_buffer_sink_param_code = soc_eth_core_icmp_echo_sink_sink_param_code;
assign soc_eth_core_icmp_echo_buffer_sink_param_msgtype = soc_eth_core_icmp_echo_sink_sink_param_msgtype;
assign soc_eth_core_icmp_echo_buffer_sink_param_quench = soc_eth_core_icmp_echo_sink_sink_param_quench;
assign soc_eth_core_icmp_echo_buffer_sink_param_ip_address = soc_eth_core_icmp_echo_sink_sink_param_ip_address;
assign soc_eth_core_icmp_echo_buffer_sink_param_length = soc_eth_core_icmp_echo_sink_sink_param_length;
assign soc_eth_core_icmp_echo_source_source_valid = soc_eth_core_icmp_echo_buffer_source_valid;
assign soc_eth_core_icmp_echo_buffer_source_ready = soc_eth_core_icmp_echo_source_source_ready;
assign soc_eth_core_icmp_echo_source_source_first = soc_eth_core_icmp_echo_buffer_source_first;
assign soc_eth_core_icmp_echo_source_source_last = soc_eth_core_icmp_echo_buffer_source_last;
assign soc_eth_core_icmp_echo_source_source_payload_data = soc_eth_core_icmp_echo_buffer_source_payload_data;
assign soc_eth_core_icmp_echo_source_source_payload_error = soc_eth_core_icmp_echo_buffer_source_payload_error;
assign soc_eth_core_icmp_echo_source_source_param_code = soc_eth_core_icmp_echo_buffer_source_param_code;
assign soc_eth_core_icmp_echo_source_source_param_quench = soc_eth_core_icmp_echo_buffer_source_param_quench;
assign soc_eth_core_icmp_echo_source_source_param_ip_address = soc_eth_core_icmp_echo_buffer_source_param_ip_address;
assign soc_eth_core_icmp_echo_source_source_param_length = soc_eth_core_icmp_echo_buffer_source_param_length;
always @(*) begin
	soc_eth_core_icmp_echo_source_source_param_msgtype <= 8'd0;
	soc_eth_core_icmp_echo_source_source_param_msgtype <= soc_eth_core_icmp_echo_buffer_source_param_msgtype;
	soc_eth_core_icmp_echo_source_source_param_msgtype <= 1'd0;
end
always @(*) begin
	soc_eth_core_icmp_echo_source_source_param_checksum <= 16'd0;
	soc_eth_core_icmp_echo_source_source_param_checksum <= soc_eth_core_icmp_echo_buffer_source_param_checksum;
	soc_eth_core_icmp_echo_source_source_param_checksum <= ((soc_eth_core_icmp_echo_buffer_source_param_checksum + 12'd2048) + (soc_eth_core_icmp_echo_buffer_source_param_checksum >= 16'd63488));
end
assign soc_eth_core_icmp_echo_buffer_syncfifo_din = {soc_eth_core_icmp_echo_buffer_fifo_in_last, soc_eth_core_icmp_echo_buffer_fifo_in_first, soc_eth_core_icmp_echo_buffer_fifo_in_param_length, soc_eth_core_icmp_echo_buffer_fifo_in_param_ip_address, soc_eth_core_icmp_echo_buffer_fifo_in_param_quench, soc_eth_core_icmp_echo_buffer_fifo_in_param_msgtype, soc_eth_core_icmp_echo_buffer_fifo_in_param_code, soc_eth_core_icmp_echo_buffer_fifo_in_param_checksum, soc_eth_core_icmp_echo_buffer_fifo_in_payload_error, soc_eth_core_icmp_echo_buffer_fifo_in_payload_data};
assign {soc_eth_core_icmp_echo_buffer_fifo_out_last, soc_eth_core_icmp_echo_buffer_fifo_out_first, soc_eth_core_icmp_echo_buffer_fifo_out_param_length, soc_eth_core_icmp_echo_buffer_fifo_out_param_ip_address, soc_eth_core_icmp_echo_buffer_fifo_out_param_quench, soc_eth_core_icmp_echo_buffer_fifo_out_param_msgtype, soc_eth_core_icmp_echo_buffer_fifo_out_param_code, soc_eth_core_icmp_echo_buffer_fifo_out_param_checksum, soc_eth_core_icmp_echo_buffer_fifo_out_payload_error, soc_eth_core_icmp_echo_buffer_fifo_out_payload_data} = soc_eth_core_icmp_echo_buffer_syncfifo_dout;
assign soc_eth_core_icmp_echo_buffer_sink_ready = soc_eth_core_icmp_echo_buffer_syncfifo_writable;
assign soc_eth_core_icmp_echo_buffer_syncfifo_we = soc_eth_core_icmp_echo_buffer_sink_valid;
assign soc_eth_core_icmp_echo_buffer_fifo_in_first = soc_eth_core_icmp_echo_buffer_sink_first;
assign soc_eth_core_icmp_echo_buffer_fifo_in_last = soc_eth_core_icmp_echo_buffer_sink_last;
assign soc_eth_core_icmp_echo_buffer_fifo_in_payload_data = soc_eth_core_icmp_echo_buffer_sink_payload_data;
assign soc_eth_core_icmp_echo_buffer_fifo_in_payload_error = soc_eth_core_icmp_echo_buffer_sink_payload_error;
assign soc_eth_core_icmp_echo_buffer_fifo_in_param_checksum = soc_eth_core_icmp_echo_buffer_sink_param_checksum;
assign soc_eth_core_icmp_echo_buffer_fifo_in_param_code = soc_eth_core_icmp_echo_buffer_sink_param_code;
assign soc_eth_core_icmp_echo_buffer_fifo_in_param_msgtype = soc_eth_core_icmp_echo_buffer_sink_param_msgtype;
assign soc_eth_core_icmp_echo_buffer_fifo_in_param_quench = soc_eth_core_icmp_echo_buffer_sink_param_quench;
assign soc_eth_core_icmp_echo_buffer_fifo_in_param_ip_address = soc_eth_core_icmp_echo_buffer_sink_param_ip_address;
assign soc_eth_core_icmp_echo_buffer_fifo_in_param_length = soc_eth_core_icmp_echo_buffer_sink_param_length;
assign soc_eth_core_icmp_echo_buffer_source_valid = soc_eth_core_icmp_echo_buffer_readable;
assign soc_eth_core_icmp_echo_buffer_source_first = soc_eth_core_icmp_echo_buffer_fifo_out_first;
assign soc_eth_core_icmp_echo_buffer_source_last = soc_eth_core_icmp_echo_buffer_fifo_out_last;
assign soc_eth_core_icmp_echo_buffer_source_payload_data = soc_eth_core_icmp_echo_buffer_fifo_out_payload_data;
assign soc_eth_core_icmp_echo_buffer_source_payload_error = soc_eth_core_icmp_echo_buffer_fifo_out_payload_error;
assign soc_eth_core_icmp_echo_buffer_source_param_checksum = soc_eth_core_icmp_echo_buffer_fifo_out_param_checksum;
assign soc_eth_core_icmp_echo_buffer_source_param_code = soc_eth_core_icmp_echo_buffer_fifo_out_param_code;
assign soc_eth_core_icmp_echo_buffer_source_param_msgtype = soc_eth_core_icmp_echo_buffer_fifo_out_param_msgtype;
assign soc_eth_core_icmp_echo_buffer_source_param_quench = soc_eth_core_icmp_echo_buffer_fifo_out_param_quench;
assign soc_eth_core_icmp_echo_buffer_source_param_ip_address = soc_eth_core_icmp_echo_buffer_fifo_out_param_ip_address;
assign soc_eth_core_icmp_echo_buffer_source_param_length = soc_eth_core_icmp_echo_buffer_fifo_out_param_length;
assign soc_eth_core_icmp_echo_buffer_re = soc_eth_core_icmp_echo_buffer_source_ready;
assign soc_eth_core_icmp_echo_buffer_syncfifo_re = (soc_eth_core_icmp_echo_buffer_syncfifo_readable & ((~soc_eth_core_icmp_echo_buffer_readable) | soc_eth_core_icmp_echo_buffer_re));
assign soc_eth_core_icmp_echo_buffer_level1 = (soc_eth_core_icmp_echo_buffer_level0 + soc_eth_core_icmp_echo_buffer_readable);
always @(*) begin
	soc_eth_core_icmp_echo_buffer_wrport_adr <= 7'd0;
	if (soc_eth_core_icmp_echo_buffer_replace) begin
		soc_eth_core_icmp_echo_buffer_wrport_adr <= (soc_eth_core_icmp_echo_buffer_produce - 1'd1);
	end else begin
		soc_eth_core_icmp_echo_buffer_wrport_adr <= soc_eth_core_icmp_echo_buffer_produce;
	end
end
assign soc_eth_core_icmp_echo_buffer_wrport_dat_w = soc_eth_core_icmp_echo_buffer_syncfifo_din;
assign soc_eth_core_icmp_echo_buffer_wrport_we = (soc_eth_core_icmp_echo_buffer_syncfifo_we & (soc_eth_core_icmp_echo_buffer_syncfifo_writable | soc_eth_core_icmp_echo_buffer_replace));
assign soc_eth_core_icmp_echo_buffer_do_read = (soc_eth_core_icmp_echo_buffer_syncfifo_readable & soc_eth_core_icmp_echo_buffer_syncfifo_re);
assign soc_eth_core_icmp_echo_buffer_rdport_adr = soc_eth_core_icmp_echo_buffer_consume;
assign soc_eth_core_icmp_echo_buffer_syncfifo_dout = soc_eth_core_icmp_echo_buffer_rdport_dat_r;
assign soc_eth_core_icmp_echo_buffer_rdport_re = soc_eth_core_icmp_echo_buffer_do_read;
assign soc_eth_core_icmp_echo_buffer_syncfifo_writable = (soc_eth_core_icmp_echo_buffer_level0 != 8'd128);
assign soc_eth_core_icmp_echo_buffer_syncfifo_readable = (soc_eth_core_icmp_echo_buffer_level0 != 1'd0);
assign soc_eth_core_ip_port_sink_valid = soc_eth_core_tx_source_source_valid;
assign soc_eth_core_tx_source_source_ready = soc_eth_core_ip_port_sink_ready;
assign soc_eth_core_ip_port_sink_first = soc_eth_core_tx_source_source_first;
assign soc_eth_core_ip_port_sink_last = soc_eth_core_tx_source_source_last;
assign soc_eth_core_ip_port_sink_payload_data = soc_eth_core_tx_source_source_payload_data;
assign soc_eth_core_ip_port_sink_payload_error = soc_eth_core_tx_source_source_payload_error;
assign soc_eth_core_ip_port_sink_param_length = soc_eth_core_tx_source_source_param_length;
assign soc_eth_core_ip_port_sink_param_protocol = soc_eth_core_tx_source_source_param_protocol;
assign soc_eth_core_ip_port_sink_param_ip_address = soc_eth_core_tx_source_source_param_ip_address;
assign soc_eth_core_rx_sink_sink_valid = soc_eth_core_ip_port_source_valid;
assign soc_eth_core_ip_port_source_ready = soc_eth_core_rx_sink_sink_ready;
assign soc_eth_core_rx_sink_sink_first = soc_eth_core_ip_port_source_first;
assign soc_eth_core_rx_sink_sink_last = soc_eth_core_ip_port_source_last;
assign soc_eth_core_rx_sink_sink_payload_data = soc_eth_core_ip_port_source_payload_data;
assign soc_eth_core_rx_sink_sink_payload_error = soc_eth_core_ip_port_source_payload_error;
assign soc_eth_core_rx_sink_sink_param_length = soc_eth_core_ip_port_source_param_length;
assign soc_eth_core_rx_sink_sink_param_protocol = soc_eth_core_ip_port_source_param_protocol;
assign soc_eth_core_rx_sink_sink_param_ip_address = soc_eth_core_ip_port_source_param_ip_address;
assign soc_eth_core_tx_sink_sink_valid = soc_eth_core_crossbar_source_valid;
assign soc_eth_core_crossbar_source_ready = soc_eth_core_tx_sink_sink_ready;
assign soc_eth_core_tx_sink_sink_first = soc_eth_core_crossbar_source_first;
assign soc_eth_core_tx_sink_sink_last = soc_eth_core_crossbar_source_last;
assign soc_eth_core_tx_sink_sink_payload_data = soc_eth_core_crossbar_source_payload_data;
assign soc_eth_core_tx_sink_sink_payload_error = soc_eth_core_crossbar_source_payload_error;
assign soc_eth_core_tx_sink_sink_param_src_port = soc_eth_core_crossbar_source_param_src_port;
assign soc_eth_core_tx_sink_sink_param_dst_port = soc_eth_core_crossbar_source_param_dst_port;
assign soc_eth_core_tx_sink_sink_param_ip_address = soc_eth_core_crossbar_source_param_ip_address;
assign soc_eth_core_tx_sink_sink_param_length = soc_eth_core_crossbar_source_param_length;
assign soc_eth_core_crossbar_sink_valid = soc_eth_core_rx_source_source_valid;
assign soc_eth_core_rx_source_source_ready = soc_eth_core_crossbar_sink_ready;
assign soc_eth_core_crossbar_sink_first = soc_eth_core_rx_source_source_first;
assign soc_eth_core_crossbar_sink_last = soc_eth_core_rx_source_source_last;
assign soc_eth_core_crossbar_sink_payload_data = soc_eth_core_rx_source_source_payload_data;
assign soc_eth_core_crossbar_sink_payload_error = soc_eth_core_rx_source_source_payload_error;
assign soc_eth_core_crossbar_sink_param_src_port = soc_eth_core_rx_source_source_param_src_port;
assign soc_eth_core_crossbar_sink_param_dst_port = soc_eth_core_rx_source_source_param_dst_port;
assign soc_eth_core_crossbar_sink_param_ip_address = soc_eth_core_rx_source_source_param_ip_address;
assign soc_eth_core_crossbar_sink_param_length = soc_eth_core_rx_source_source_param_length;
assign soc_eth_core_tx_packetizer_sink_valid = soc_eth_core_tx_sink_sink_valid;
assign soc_eth_core_tx_packetizer_sink_last = soc_eth_core_tx_sink_sink_last;
assign soc_eth_core_tx_sink_sink_ready = soc_eth_core_tx_packetizer_sink_ready;
assign soc_eth_core_tx_packetizer_sink_param_src_port = soc_eth_core_tx_sink_sink_param_src_port;
assign soc_eth_core_tx_packetizer_sink_param_dst_port = soc_eth_core_tx_sink_sink_param_dst_port;
assign soc_eth_core_tx_packetizer_sink_param_length = (soc_eth_core_tx_sink_sink_param_length + 4'd8);
assign soc_eth_core_tx_packetizer_sink_param_checksum = 1'd0;
assign soc_eth_core_tx_packetizer_sink_payload_data = soc_eth_core_tx_sink_sink_payload_data;
always @(*) begin
	soc_eth_core_tx_packetizer_header <= 64'd0;
	soc_eth_core_tx_packetizer_header[63:48] <= {soc_eth_core_tx_packetizer_sink_param_checksum[7:0], soc_eth_core_tx_packetizer_sink_param_checksum[15:8]};
	soc_eth_core_tx_packetizer_header[31:16] <= {soc_eth_core_tx_packetizer_sink_param_dst_port[7:0], soc_eth_core_tx_packetizer_sink_param_dst_port[15:8]};
	soc_eth_core_tx_packetizer_header[47:32] <= {soc_eth_core_tx_packetizer_sink_param_length[7:0], soc_eth_core_tx_packetizer_sink_param_length[15:8]};
	soc_eth_core_tx_packetizer_header[15:0] <= {soc_eth_core_tx_packetizer_sink_param_src_port[7:0], soc_eth_core_tx_packetizer_sink_param_src_port[15:8]};
end
assign soc_eth_core_tx_packetizer_source_payload_error = soc_eth_core_tx_packetizer_sink_payload_error;
always @(*) begin
	soc_eth_core_tx_packetizer_source_last <= 1'd0;
	soc_eth_core_tx_packetizer_source_payload_data <= 8'd0;
	vns_liteethudpipcore_liteethudp_liteethudptx_liteethudppacketizer_next_state <= 2'd0;
	soc_eth_core_tx_packetizer_sink_ready <= 1'd0;
	soc_eth_core_tx_packetizer_count_liteethudptx_next_value0 <= 3'd0;
	soc_eth_core_tx_packetizer_count_liteethudptx_next_value_ce0 <= 1'd0;
	soc_eth_core_tx_packetizer_sr_load <= 1'd0;
	soc_eth_core_tx_packetizer_fsm_from_idle_liteethudptx_next_value1 <= 1'd0;
	soc_eth_core_tx_packetizer_sr_shift <= 1'd0;
	soc_eth_core_tx_packetizer_fsm_from_idle_liteethudptx_next_value_ce1 <= 1'd0;
	soc_eth_core_tx_packetizer_source_valid <= 1'd0;
	vns_liteethudpipcore_liteethudp_liteethudptx_liteethudppacketizer_next_state <= vns_liteethudpipcore_liteethudp_liteethudptx_liteethudppacketizer_state;
	case (vns_liteethudpipcore_liteethudp_liteethudptx_liteethudppacketizer_state)
		1'd1: begin
			soc_eth_core_tx_packetizer_source_valid <= 1'd1;
			soc_eth_core_tx_packetizer_source_last <= 1'd0;
			soc_eth_core_tx_packetizer_source_payload_data <= soc_eth_core_tx_packetizer_sr[63:8];
			if ((soc_eth_core_tx_packetizer_source_valid & soc_eth_core_tx_packetizer_source_ready)) begin
				soc_eth_core_tx_packetizer_sr_shift <= 1'd1;
				if ((soc_eth_core_tx_packetizer_count == 3'd7)) begin
					soc_eth_core_tx_packetizer_sr_shift <= 1'd0;
					if (1'd0) begin
						vns_liteethudpipcore_liteethudp_liteethudptx_liteethudppacketizer_next_state <= 2'd3;
						soc_eth_core_tx_packetizer_count_liteethudptx_next_value0 <= (soc_eth_core_tx_packetizer_count + 1'd1);
						soc_eth_core_tx_packetizer_count_liteethudptx_next_value_ce0 <= 1'd1;
					end else begin
						vns_liteethudpipcore_liteethudp_liteethudptx_liteethudppacketizer_next_state <= 2'd2;
					end
				end else begin
					soc_eth_core_tx_packetizer_count_liteethudptx_next_value0 <= (soc_eth_core_tx_packetizer_count + 1'd1);
					soc_eth_core_tx_packetizer_count_liteethudptx_next_value_ce0 <= 1'd1;
				end
			end
		end
		2'd2: begin
			soc_eth_core_tx_packetizer_source_valid <= soc_eth_core_tx_packetizer_sink_valid;
			soc_eth_core_tx_packetizer_source_last <= soc_eth_core_tx_packetizer_sink_last;
			soc_eth_core_tx_packetizer_source_payload_data <= soc_eth_core_tx_packetizer_sink_payload_data;
			if ((soc_eth_core_tx_packetizer_source_valid & soc_eth_core_tx_packetizer_source_ready)) begin
				soc_eth_core_tx_packetizer_sink_ready <= 1'd1;
				if (soc_eth_core_tx_packetizer_source_last) begin
					vns_liteethudpipcore_liteethudp_liteethudptx_liteethudppacketizer_next_state <= 1'd0;
				end
			end
		end
		2'd3: begin
			soc_eth_core_tx_packetizer_source_valid <= (soc_eth_core_tx_packetizer_sink_valid | soc_eth_core_tx_packetizer_sink_d_last);
			soc_eth_core_tx_packetizer_source_last <= soc_eth_core_tx_packetizer_sink_d_last;
			if (soc_eth_core_tx_packetizer_fsm_from_idle) begin
				soc_eth_core_tx_packetizer_source_payload_data[0] <= soc_eth_core_tx_packetizer_sr[63:16];
			end else begin
				soc_eth_core_tx_packetizer_source_payload_data[0] <= soc_eth_core_tx_packetizer_sink_d_payload_data[7];
			end
			soc_eth_core_tx_packetizer_source_payload_data[7:0] <= soc_eth_core_tx_packetizer_sink_payload_data;
			if ((soc_eth_core_tx_packetizer_source_valid & soc_eth_core_tx_packetizer_source_ready)) begin
				soc_eth_core_tx_packetizer_sink_ready <= (~soc_eth_core_tx_packetizer_source_last);
				soc_eth_core_tx_packetizer_fsm_from_idle_liteethudptx_next_value1 <= 1'd0;
				soc_eth_core_tx_packetizer_fsm_from_idle_liteethudptx_next_value_ce1 <= 1'd1;
				if (soc_eth_core_tx_packetizer_source_last) begin
					vns_liteethudpipcore_liteethudp_liteethudptx_liteethudppacketizer_next_state <= 1'd0;
				end
			end
		end
		default: begin
			soc_eth_core_tx_packetizer_sink_ready <= 1'd1;
			soc_eth_core_tx_packetizer_count_liteethudptx_next_value0 <= 1'd1;
			soc_eth_core_tx_packetizer_count_liteethudptx_next_value_ce0 <= 1'd1;
			if (soc_eth_core_tx_packetizer_sink_valid) begin
				soc_eth_core_tx_packetizer_sink_ready <= 1'd0;
				soc_eth_core_tx_packetizer_source_valid <= 1'd1;
				soc_eth_core_tx_packetizer_source_last <= 1'd0;
				soc_eth_core_tx_packetizer_source_payload_data <= soc_eth_core_tx_packetizer_header[7:0];
				if ((soc_eth_core_tx_packetizer_source_valid & soc_eth_core_tx_packetizer_source_ready)) begin
					soc_eth_core_tx_packetizer_sr_load <= 1'd1;
					soc_eth_core_tx_packetizer_fsm_from_idle_liteethudptx_next_value1 <= 1'd1;
					soc_eth_core_tx_packetizer_fsm_from_idle_liteethudptx_next_value_ce1 <= 1'd1;
					if (1'd0) begin
						if (1'd0) begin
							vns_liteethudpipcore_liteethudp_liteethudptx_liteethudppacketizer_next_state <= 2'd3;
						end else begin
							vns_liteethudpipcore_liteethudp_liteethudptx_liteethudppacketizer_next_state <= 2'd2;
						end
					end else begin
						vns_liteethudpipcore_liteethudp_liteethudptx_liteethudppacketizer_next_state <= 1'd1;
					end
				end
			end
		end
	endcase
end
always @(*) begin
	soc_eth_core_tx_source_source_param_length <= 16'd0;
	soc_eth_core_tx_source_source_param_protocol <= 8'd0;
	soc_eth_core_tx_source_source_param_ip_address <= 32'd0;
	soc_eth_core_tx_source_source_payload_data <= 8'd0;
	soc_eth_core_tx_source_source_valid <= 1'd0;
	vns_liteethudpipcore_liteethudp_liteethudptx_fsm_next_state <= 1'd0;
	soc_eth_core_tx_source_source_first <= 1'd0;
	soc_eth_core_tx_source_source_last <= 1'd0;
	soc_eth_core_tx_packetizer_source_ready <= 1'd0;
	soc_eth_core_tx_source_source_payload_error <= 1'd0;
	vns_liteethudpipcore_liteethudp_liteethudptx_fsm_next_state <= vns_liteethudpipcore_liteethudp_liteethudptx_fsm_state;
	case (vns_liteethudpipcore_liteethudp_liteethudptx_fsm_state)
		1'd1: begin
			soc_eth_core_tx_source_source_valid <= soc_eth_core_tx_packetizer_source_valid;
			soc_eth_core_tx_packetizer_source_ready <= soc_eth_core_tx_source_source_ready;
			soc_eth_core_tx_source_source_first <= soc_eth_core_tx_packetizer_source_first;
			soc_eth_core_tx_source_source_last <= soc_eth_core_tx_packetizer_source_last;
			soc_eth_core_tx_source_source_payload_data <= soc_eth_core_tx_packetizer_source_payload_data;
			soc_eth_core_tx_source_source_payload_error <= soc_eth_core_tx_packetizer_source_payload_error;
			soc_eth_core_tx_source_source_param_length <= soc_eth_core_tx_packetizer_source_param_length;
			soc_eth_core_tx_source_source_param_protocol <= soc_eth_core_tx_packetizer_source_param_protocol;
			soc_eth_core_tx_source_source_param_ip_address <= soc_eth_core_tx_packetizer_source_param_ip_address;
			soc_eth_core_tx_source_source_param_length <= soc_eth_core_tx_packetizer_sink_param_length;
			soc_eth_core_tx_source_source_param_protocol <= 5'd17;
			soc_eth_core_tx_source_source_param_ip_address <= soc_eth_core_tx_sink_sink_param_ip_address;
			if (((soc_eth_core_tx_source_source_valid & soc_eth_core_tx_source_source_last) & soc_eth_core_tx_source_source_ready)) begin
				vns_liteethudpipcore_liteethudp_liteethudptx_fsm_next_state <= 1'd0;
			end
		end
		default: begin
			soc_eth_core_tx_packetizer_source_ready <= 1'd1;
			if (soc_eth_core_tx_packetizer_source_valid) begin
				soc_eth_core_tx_packetizer_source_ready <= 1'd0;
				vns_liteethudpipcore_liteethudp_liteethudptx_fsm_next_state <= 1'd1;
			end
		end
	endcase
end
assign soc_eth_core_rx_depacketizer_sink_valid = soc_eth_core_rx_sink_sink_valid;
assign soc_eth_core_rx_sink_sink_ready = soc_eth_core_rx_depacketizer_sink_ready;
assign soc_eth_core_rx_depacketizer_sink_first = soc_eth_core_rx_sink_sink_first;
assign soc_eth_core_rx_depacketizer_sink_last = soc_eth_core_rx_sink_sink_last;
assign soc_eth_core_rx_depacketizer_sink_payload_data = soc_eth_core_rx_sink_sink_payload_data;
assign soc_eth_core_rx_depacketizer_sink_payload_error = soc_eth_core_rx_sink_sink_payload_error;
assign soc_eth_core_rx_depacketizer_sink_param_length = soc_eth_core_rx_sink_sink_param_length;
assign soc_eth_core_rx_depacketizer_sink_param_protocol = soc_eth_core_rx_sink_sink_param_protocol;
assign soc_eth_core_rx_depacketizer_sink_param_ip_address = soc_eth_core_rx_sink_sink_param_ip_address;
assign soc_eth_core_rx_source_source_last = soc_eth_core_rx_depacketizer_source_last;
assign soc_eth_core_rx_source_source_param_src_port = soc_eth_core_rx_depacketizer_source_param_src_port;
assign soc_eth_core_rx_source_source_param_dst_port = soc_eth_core_rx_depacketizer_source_param_dst_port;
assign soc_eth_core_rx_source_source_param_ip_address = soc_eth_core_rx_sink_sink_param_ip_address;
assign soc_eth_core_rx_source_source_param_length = (soc_eth_core_rx_depacketizer_source_param_length - 4'd8);
assign soc_eth_core_rx_source_source_payload_data = soc_eth_core_rx_depacketizer_source_payload_data;
assign soc_eth_core_rx_source_source_payload_error = soc_eth_core_rx_depacketizer_source_payload_error;
assign soc_eth_core_rx_depacketizer_header = soc_eth_core_rx_depacketizer_sr;
assign soc_eth_core_rx_depacketizer_source_param_checksum = {vns_slice_proxy69[7:0], vns_slice_proxy68[15:8]};
assign soc_eth_core_rx_depacketizer_source_param_dst_port = {vns_slice_proxy71[7:0], vns_slice_proxy70[15:8]};
assign soc_eth_core_rx_depacketizer_source_param_length = {vns_slice_proxy73[7:0], vns_slice_proxy72[15:8]};
assign soc_eth_core_rx_depacketizer_source_param_src_port = {vns_slice_proxy75[7:0], vns_slice_proxy74[15:8]};
assign soc_eth_core_rx_depacketizer_source_payload_error = soc_eth_core_rx_depacketizer_sink_payload_error;
always @(*) begin
	soc_eth_core_rx_depacketizer_source_last <= 1'd0;
	vns_liteethudpipcore_liteethudp_liteethudprx_liteethudpdepacketizer_next_state <= 2'd0;
	soc_eth_core_rx_depacketizer_source_payload_data <= 8'd0;
	soc_eth_core_rx_depacketizer_count_liteethudprx_next_value0 <= 3'd0;
	soc_eth_core_rx_depacketizer_count_liteethudprx_next_value_ce0 <= 1'd0;
	soc_eth_core_rx_depacketizer_fsm_from_idle_liteethudprx_next_value1 <= 1'd0;
	soc_eth_core_rx_depacketizer_sink_ready <= 1'd0;
	soc_eth_core_rx_depacketizer_fsm_from_idle_liteethudprx_next_value_ce1 <= 1'd0;
	soc_eth_core_rx_depacketizer_sr_shift <= 1'd0;
	soc_eth_core_rx_depacketizer_sr_shift_leftover <= 1'd0;
	soc_eth_core_rx_depacketizer_source_valid <= 1'd0;
	vns_liteethudpipcore_liteethudp_liteethudprx_liteethudpdepacketizer_next_state <= vns_liteethudpipcore_liteethudp_liteethudprx_liteethudpdepacketizer_state;
	case (vns_liteethudpipcore_liteethudp_liteethudprx_liteethudpdepacketizer_state)
		1'd1: begin
			soc_eth_core_rx_depacketizer_sink_ready <= 1'd1;
			if (soc_eth_core_rx_depacketizer_sink_valid) begin
				soc_eth_core_rx_depacketizer_count_liteethudprx_next_value0 <= (soc_eth_core_rx_depacketizer_count + 1'd1);
				soc_eth_core_rx_depacketizer_count_liteethudprx_next_value_ce0 <= 1'd1;
				soc_eth_core_rx_depacketizer_sr_shift <= 1'd1;
				if ((soc_eth_core_rx_depacketizer_count == 3'd7)) begin
					if (1'd0) begin
						soc_eth_core_rx_depacketizer_count_liteethudprx_next_value0 <= (soc_eth_core_rx_depacketizer_count + 1'd1);
						soc_eth_core_rx_depacketizer_count_liteethudprx_next_value_ce0 <= 1'd1;
						vns_liteethudpipcore_liteethudp_liteethudprx_liteethudpdepacketizer_next_state <= 2'd2;
					end else begin
						vns_liteethudpipcore_liteethudp_liteethudprx_liteethudpdepacketizer_next_state <= 2'd3;
					end
				end
			end
		end
		2'd2: begin
			soc_eth_core_rx_depacketizer_source_valid <= (soc_eth_core_rx_depacketizer_sink_valid | soc_eth_core_rx_depacketizer_sink_d_last);
			soc_eth_core_rx_depacketizer_source_last <= (soc_eth_core_rx_depacketizer_sink_last | soc_eth_core_rx_depacketizer_sink_d_last);
			soc_eth_core_rx_depacketizer_sink_ready <= soc_eth_core_rx_depacketizer_source_ready;
			soc_eth_core_rx_depacketizer_source_payload_data <= soc_eth_core_rx_depacketizer_sink_d_payload_data[7:0];
			soc_eth_core_rx_depacketizer_source_payload_data[7] <= soc_eth_core_rx_depacketizer_sink_payload_data;
			if (soc_eth_core_rx_depacketizer_fsm_from_idle) begin
				soc_eth_core_rx_depacketizer_source_valid <= soc_eth_core_rx_depacketizer_sink_d_last;
				soc_eth_core_rx_depacketizer_sink_ready <= 1'd1;
				if (soc_eth_core_rx_depacketizer_sink_valid) begin
					soc_eth_core_rx_depacketizer_fsm_from_idle_liteethudprx_next_value1 <= 1'd0;
					soc_eth_core_rx_depacketizer_fsm_from_idle_liteethudprx_next_value_ce1 <= 1'd1;
					soc_eth_core_rx_depacketizer_sr_shift_leftover <= 1'd1;
				end
			end
			if ((soc_eth_core_rx_depacketizer_source_valid & soc_eth_core_rx_depacketizer_source_ready)) begin
				if (soc_eth_core_rx_depacketizer_source_last) begin
					vns_liteethudpipcore_liteethudp_liteethudprx_liteethudpdepacketizer_next_state <= 1'd0;
				end
			end
		end
		2'd3: begin
			soc_eth_core_rx_depacketizer_source_valid <= (soc_eth_core_rx_depacketizer_sink_valid | soc_eth_core_rx_depacketizer_sink_d_last);
			soc_eth_core_rx_depacketizer_source_last <= (soc_eth_core_rx_depacketizer_sink_last | soc_eth_core_rx_depacketizer_sink_d_last);
			soc_eth_core_rx_depacketizer_sink_ready <= soc_eth_core_rx_depacketizer_source_ready;
			soc_eth_core_rx_depacketizer_source_payload_data <= soc_eth_core_rx_depacketizer_sink_payload_data;
			if ((soc_eth_core_rx_depacketizer_source_valid & soc_eth_core_rx_depacketizer_source_ready)) begin
				if (soc_eth_core_rx_depacketizer_source_last) begin
					vns_liteethudpipcore_liteethudp_liteethudprx_liteethudpdepacketizer_next_state <= 1'd0;
				end
			end
		end
		default: begin
			soc_eth_core_rx_depacketizer_sink_ready <= 1'd1;
			soc_eth_core_rx_depacketizer_count_liteethudprx_next_value0 <= 1'd1;
			soc_eth_core_rx_depacketizer_count_liteethudprx_next_value_ce0 <= 1'd1;
			if (soc_eth_core_rx_depacketizer_sink_valid) begin
				soc_eth_core_rx_depacketizer_sr_shift <= 1'd1;
				soc_eth_core_rx_depacketizer_fsm_from_idle_liteethudprx_next_value1 <= 1'd1;
				soc_eth_core_rx_depacketizer_fsm_from_idle_liteethudprx_next_value_ce1 <= 1'd1;
				if (1'd0) begin
					if (1'd0) begin
						vns_liteethudpipcore_liteethudp_liteethudprx_liteethudpdepacketizer_next_state <= 2'd2;
					end else begin
						vns_liteethudpipcore_liteethudp_liteethudprx_liteethudpdepacketizer_next_state <= 2'd3;
					end
				end else begin
					vns_liteethudpipcore_liteethudp_liteethudprx_liteethudpdepacketizer_next_state <= 1'd1;
				end
			end
		end
	endcase
end
always @(*) begin
	soc_eth_core_rx_depacketizer_source_ready <= 1'd0;
	soc_eth_core_rx_source_source_valid <= 1'd0;
	vns_liteethudpipcore_liteethudp_liteethudprx_fsm_next_state <= 2'd0;
	vns_liteethudpipcore_liteethudp_liteethudprx_fsm_next_state <= vns_liteethudpipcore_liteethudp_liteethudprx_fsm_state;
	case (vns_liteethudpipcore_liteethudp_liteethudprx_fsm_state)
		1'd1: begin
			if (soc_eth_core_rx_valid) begin
				vns_liteethudpipcore_liteethudp_liteethudprx_fsm_next_state <= 2'd2;
			end else begin
				vns_liteethudpipcore_liteethudp_liteethudprx_fsm_next_state <= 2'd3;
			end
		end
		2'd2: begin
			soc_eth_core_rx_source_source_valid <= soc_eth_core_rx_depacketizer_source_valid;
			soc_eth_core_rx_depacketizer_source_ready <= soc_eth_core_rx_source_source_ready;
			if (((soc_eth_core_rx_source_source_valid & soc_eth_core_rx_source_source_last) & soc_eth_core_rx_source_source_ready)) begin
				vns_liteethudpipcore_liteethudp_liteethudprx_fsm_next_state <= 1'd0;
			end
		end
		2'd3: begin
			soc_eth_core_rx_depacketizer_source_ready <= 1'd1;
			if (((soc_eth_core_rx_depacketizer_source_valid & soc_eth_core_rx_depacketizer_source_last) & soc_eth_core_rx_depacketizer_source_ready)) begin
				vns_liteethudpipcore_liteethudp_liteethudprx_fsm_next_state <= 1'd0;
			end
		end
		default: begin
			soc_eth_core_rx_depacketizer_source_ready <= 1'd1;
			if (soc_eth_core_rx_depacketizer_source_valid) begin
				soc_eth_core_rx_depacketizer_source_ready <= 1'd0;
				vns_liteethudpipcore_liteethudp_liteethudprx_fsm_next_state <= 1'd1;
			end
		end
	endcase
end
assign soc_etherbone_tx_converter_sink_valid = soc_etherbone_user_port_sink_valid;
assign soc_etherbone_user_port_sink_ready = soc_etherbone_tx_converter_sink_ready;
assign soc_etherbone_tx_converter_sink_first = soc_etherbone_user_port_sink_first;
assign soc_etherbone_tx_converter_sink_last = soc_etherbone_user_port_sink_last;
assign soc_etherbone_tx_converter_sink_payload_data = soc_etherbone_user_port_sink_payload_data;
assign soc_etherbone_tx_converter_sink_payload_error = soc_etherbone_user_port_sink_payload_error;
assign soc_etherbone_tx_converter_sink_param_src_port = soc_etherbone_user_port_sink_param_src_port;
assign soc_etherbone_tx_converter_sink_param_dst_port = soc_etherbone_user_port_sink_param_dst_port;
assign soc_etherbone_tx_converter_sink_param_ip_address = soc_etherbone_user_port_sink_param_ip_address;
assign soc_etherbone_tx_converter_sink_param_length = soc_etherbone_user_port_sink_param_length;
assign soc_etherbone_internal_port_sink_valid = soc_etherbone_tx_converter_source_valid;
assign soc_etherbone_tx_converter_source_ready = soc_etherbone_internal_port_sink_ready;
assign soc_etherbone_internal_port_sink_first = soc_etherbone_tx_converter_source_first;
assign soc_etherbone_internal_port_sink_last = soc_etherbone_tx_converter_source_last;
assign soc_etherbone_internal_port_sink_payload_data = soc_etherbone_tx_converter_source_payload_data;
assign soc_etherbone_internal_port_sink_payload_error = soc_etherbone_tx_converter_source_payload_error;
assign soc_etherbone_internal_port_sink_param_src_port = soc_etherbone_tx_converter_source_param_src_port;
assign soc_etherbone_internal_port_sink_param_dst_port = soc_etherbone_tx_converter_source_param_dst_port;
assign soc_etherbone_internal_port_sink_param_ip_address = soc_etherbone_tx_converter_source_param_ip_address;
assign soc_etherbone_internal_port_sink_param_length = soc_etherbone_tx_converter_source_param_length;
assign soc_etherbone_rx_converter_sink_valid = soc_etherbone_internal_port_source_valid;
assign soc_etherbone_internal_port_source_ready = soc_etherbone_rx_converter_sink_ready;
assign soc_etherbone_rx_converter_sink_first = soc_etherbone_internal_port_source_first;
assign soc_etherbone_rx_converter_sink_last = soc_etherbone_internal_port_source_last;
assign soc_etherbone_rx_converter_sink_payload_data = soc_etherbone_internal_port_source_payload_data;
assign soc_etherbone_rx_converter_sink_payload_error = soc_etherbone_internal_port_source_payload_error;
assign soc_etherbone_rx_converter_sink_param_src_port = soc_etherbone_internal_port_source_param_src_port;
assign soc_etherbone_rx_converter_sink_param_dst_port = soc_etherbone_internal_port_source_param_dst_port;
assign soc_etherbone_rx_converter_sink_param_ip_address = soc_etherbone_internal_port_source_param_ip_address;
assign soc_etherbone_rx_converter_sink_param_length = soc_etherbone_internal_port_source_param_length;
assign soc_etherbone_user_port_source_valid = soc_etherbone_rx_converter_source_valid;
assign soc_etherbone_rx_converter_source_ready = soc_etherbone_user_port_source_ready;
assign soc_etherbone_user_port_source_first = soc_etherbone_rx_converter_source_first;
assign soc_etherbone_user_port_source_last = soc_etherbone_rx_converter_source_last;
assign soc_etherbone_user_port_source_payload_data = soc_etherbone_rx_converter_source_payload_data;
assign soc_etherbone_user_port_source_payload_error = soc_etherbone_rx_converter_source_payload_error;
assign soc_etherbone_user_port_source_param_src_port = soc_etherbone_rx_converter_source_param_src_port;
assign soc_etherbone_user_port_source_param_dst_port = soc_etherbone_rx_converter_source_param_dst_port;
assign soc_etherbone_user_port_source_param_ip_address = soc_etherbone_rx_converter_source_param_ip_address;
assign soc_etherbone_user_port_source_param_length = soc_etherbone_rx_converter_source_param_length;
always @(*) begin
	vns_liteethudpipcore_liteethudp_sel <= 1'd0;
	case (soc_eth_core_crossbar_sink_param_dst_port)
		11'd1234: begin
			vns_liteethudpipcore_liteethudp_sel <= 1'd1;
		end
		default: begin
			vns_liteethudpipcore_liteethudp_sel <= 1'd0;
		end
	endcase
end
assign soc_etherbone_tx_converter_converter_sink_valid = soc_etherbone_tx_converter_sink_valid;
assign soc_etherbone_tx_converter_converter_sink_first = soc_etherbone_tx_converter_sink_first;
assign soc_etherbone_tx_converter_converter_sink_last = soc_etherbone_tx_converter_sink_last;
assign soc_etherbone_tx_converter_sink_ready = soc_etherbone_tx_converter_converter_sink_ready;
always @(*) begin
	soc_etherbone_tx_converter_converter_sink_payload_data <= 36'd0;
	soc_etherbone_tx_converter_converter_sink_payload_data[7:0] <= soc_etherbone_tx_converter_sink_payload_data[7:0];
	soc_etherbone_tx_converter_converter_sink_payload_data[8] <= soc_etherbone_tx_converter_sink_payload_error[0];
	soc_etherbone_tx_converter_converter_sink_payload_data[16:9] <= soc_etherbone_tx_converter_sink_payload_data[15:8];
	soc_etherbone_tx_converter_converter_sink_payload_data[17] <= soc_etherbone_tx_converter_sink_payload_error[1];
	soc_etherbone_tx_converter_converter_sink_payload_data[25:18] <= soc_etherbone_tx_converter_sink_payload_data[23:16];
	soc_etherbone_tx_converter_converter_sink_payload_data[26] <= soc_etherbone_tx_converter_sink_payload_error[2];
	soc_etherbone_tx_converter_converter_sink_payload_data[34:27] <= soc_etherbone_tx_converter_sink_payload_data[31:24];
	soc_etherbone_tx_converter_converter_sink_payload_data[35] <= soc_etherbone_tx_converter_sink_payload_error[3];
end
assign soc_etherbone_tx_converter_source_valid = soc_etherbone_tx_converter_source_source_valid;
assign soc_etherbone_tx_converter_source_first = soc_etherbone_tx_converter_source_source_first;
assign soc_etherbone_tx_converter_source_last = soc_etherbone_tx_converter_source_source_last;
assign soc_etherbone_tx_converter_source_source_ready = soc_etherbone_tx_converter_source_ready;
assign {soc_etherbone_tx_converter_source_payload_error, soc_etherbone_tx_converter_source_payload_data} = soc_etherbone_tx_converter_source_source_payload_data;
assign soc_etherbone_tx_converter_source_param_src_port = soc_etherbone_tx_converter_sink_param_src_port;
assign soc_etherbone_tx_converter_source_param_dst_port = soc_etherbone_tx_converter_sink_param_dst_port;
assign soc_etherbone_tx_converter_source_param_ip_address = soc_etherbone_tx_converter_sink_param_ip_address;
assign soc_etherbone_tx_converter_source_param_length = soc_etherbone_tx_converter_sink_param_length;
assign soc_etherbone_tx_converter_source_source_valid = soc_etherbone_tx_converter_converter_source_valid;
assign soc_etherbone_tx_converter_converter_source_ready = soc_etherbone_tx_converter_source_source_ready;
assign soc_etherbone_tx_converter_source_source_first = soc_etherbone_tx_converter_converter_source_first;
assign soc_etherbone_tx_converter_source_source_last = soc_etherbone_tx_converter_converter_source_last;
assign soc_etherbone_tx_converter_source_source_payload_data = soc_etherbone_tx_converter_converter_source_payload_data;
assign soc_etherbone_tx_converter_converter_first = (soc_etherbone_tx_converter_converter_mux == 1'd0);
assign soc_etherbone_tx_converter_converter_last = (soc_etherbone_tx_converter_converter_mux == 2'd3);
assign soc_etherbone_tx_converter_converter_source_valid = soc_etherbone_tx_converter_converter_sink_valid;
assign soc_etherbone_tx_converter_converter_source_first = (soc_etherbone_tx_converter_converter_sink_first & soc_etherbone_tx_converter_converter_first);
assign soc_etherbone_tx_converter_converter_source_last = (soc_etherbone_tx_converter_converter_sink_last & soc_etherbone_tx_converter_converter_last);
assign soc_etherbone_tx_converter_converter_sink_ready = (soc_etherbone_tx_converter_converter_last & soc_etherbone_tx_converter_converter_source_ready);
always @(*) begin
	soc_etherbone_tx_converter_converter_source_payload_data <= 9'd0;
	case (soc_etherbone_tx_converter_converter_mux)
		1'd0: begin
			soc_etherbone_tx_converter_converter_source_payload_data <= soc_etherbone_tx_converter_converter_sink_payload_data[8:0];
		end
		1'd1: begin
			soc_etherbone_tx_converter_converter_source_payload_data <= soc_etherbone_tx_converter_converter_sink_payload_data[17:9];
		end
		2'd2: begin
			soc_etherbone_tx_converter_converter_source_payload_data <= soc_etherbone_tx_converter_converter_sink_payload_data[26:18];
		end
		default: begin
			soc_etherbone_tx_converter_converter_source_payload_data <= soc_etherbone_tx_converter_converter_sink_payload_data[35:27];
		end
	endcase
end
assign soc_etherbone_tx_converter_converter_source_payload_valid_token_count = soc_etherbone_tx_converter_converter_last;
assign soc_etherbone_rx_converter_converter_sink_valid = soc_etherbone_rx_converter_sink_valid;
assign soc_etherbone_rx_converter_converter_sink_first = soc_etherbone_rx_converter_sink_first;
assign soc_etherbone_rx_converter_converter_sink_last = soc_etherbone_rx_converter_sink_last;
assign soc_etherbone_rx_converter_sink_ready = soc_etherbone_rx_converter_converter_sink_ready;
assign soc_etherbone_rx_converter_converter_sink_payload_data = {soc_etherbone_rx_converter_sink_payload_error, soc_etherbone_rx_converter_sink_payload_data};
assign soc_etherbone_rx_converter_source_valid = soc_etherbone_rx_converter_source_source_valid;
assign soc_etherbone_rx_converter_source_first = soc_etherbone_rx_converter_source_source_first;
assign soc_etherbone_rx_converter_source_last = soc_etherbone_rx_converter_source_source_last;
assign soc_etherbone_rx_converter_source_source_ready = soc_etherbone_rx_converter_source_ready;
always @(*) begin
	soc_etherbone_rx_converter_source_payload_data <= 32'd0;
	soc_etherbone_rx_converter_source_payload_data[7:0] <= soc_etherbone_rx_converter_source_source_payload_data[7:0];
	soc_etherbone_rx_converter_source_payload_data[15:8] <= soc_etherbone_rx_converter_source_source_payload_data[16:9];
	soc_etherbone_rx_converter_source_payload_data[23:16] <= soc_etherbone_rx_converter_source_source_payload_data[25:18];
	soc_etherbone_rx_converter_source_payload_data[31:24] <= soc_etherbone_rx_converter_source_source_payload_data[34:27];
end
always @(*) begin
	soc_etherbone_rx_converter_source_payload_error <= 4'd0;
	soc_etherbone_rx_converter_source_payload_error[0] <= soc_etherbone_rx_converter_source_source_payload_data[8];
	soc_etherbone_rx_converter_source_payload_error[1] <= soc_etherbone_rx_converter_source_source_payload_data[17];
	soc_etherbone_rx_converter_source_payload_error[2] <= soc_etherbone_rx_converter_source_source_payload_data[26];
	soc_etherbone_rx_converter_source_payload_error[3] <= soc_etherbone_rx_converter_source_source_payload_data[35];
end
assign soc_etherbone_rx_converter_source_source_valid = soc_etherbone_rx_converter_converter_source_valid;
assign soc_etherbone_rx_converter_converter_source_ready = soc_etherbone_rx_converter_source_source_ready;
assign soc_etherbone_rx_converter_source_source_first = soc_etherbone_rx_converter_converter_source_first;
assign soc_etherbone_rx_converter_source_source_last = soc_etherbone_rx_converter_converter_source_last;
assign soc_etherbone_rx_converter_source_source_payload_data = soc_etherbone_rx_converter_converter_source_payload_data;
assign soc_etherbone_rx_converter_converter_sink_ready = ((~soc_etherbone_rx_converter_converter_strobe_all) | soc_etherbone_rx_converter_converter_source_ready);
assign soc_etherbone_rx_converter_converter_source_valid = soc_etherbone_rx_converter_converter_strobe_all;
assign soc_etherbone_rx_converter_converter_load_part = (soc_etherbone_rx_converter_converter_sink_valid & soc_etherbone_rx_converter_converter_sink_ready);
assign soc_eth_core_crossbar_source_valid = soc_etherbone_internal_port_sink_valid;
assign soc_etherbone_internal_port_sink_ready = soc_eth_core_crossbar_source_ready;
assign soc_eth_core_crossbar_source_first = soc_etherbone_internal_port_sink_first;
assign soc_eth_core_crossbar_source_last = soc_etherbone_internal_port_sink_last;
assign soc_eth_core_crossbar_source_payload_data = soc_etherbone_internal_port_sink_payload_data;
assign soc_eth_core_crossbar_source_payload_error = soc_etherbone_internal_port_sink_payload_error;
assign soc_eth_core_crossbar_source_param_src_port = soc_etherbone_internal_port_sink_param_src_port;
assign soc_eth_core_crossbar_source_param_dst_port = soc_etherbone_internal_port_sink_param_dst_port;
assign soc_eth_core_crossbar_source_param_ip_address = soc_etherbone_internal_port_sink_param_ip_address;
assign soc_eth_core_crossbar_source_param_length = soc_etherbone_internal_port_sink_param_length;
assign soc_etherbone_internal_port_source_valid = soc_eth_core_crossbar_sink_valid;
assign soc_eth_core_crossbar_sink_ready = soc_etherbone_internal_port_source_ready;
assign soc_etherbone_internal_port_source_first = soc_eth_core_crossbar_sink_first;
assign soc_etherbone_internal_port_source_last = soc_eth_core_crossbar_sink_last;
assign soc_etherbone_internal_port_source_payload_data = soc_eth_core_crossbar_sink_payload_data;
assign soc_etherbone_internal_port_source_payload_error = soc_eth_core_crossbar_sink_payload_error;
assign soc_etherbone_internal_port_source_param_src_port = soc_eth_core_crossbar_sink_param_src_port;
assign soc_etherbone_internal_port_source_param_dst_port = soc_eth_core_crossbar_sink_param_dst_port;
assign soc_etherbone_internal_port_source_param_ip_address = soc_eth_core_crossbar_sink_param_ip_address;
assign soc_etherbone_internal_port_source_param_length = soc_eth_core_crossbar_sink_param_length;
assign soc_etherbone_dispatcher_sel0 = (~soc_etherbone_rx_source_source_param_pf);
assign soc_etherbone_wishbone_sink_valid = soc_etherbone_record_receiver_source_source_valid;
assign soc_etherbone_record_receiver_source_source_ready = soc_etherbone_wishbone_sink_ready;
assign soc_etherbone_wishbone_sink_first = soc_etherbone_record_receiver_source_source_first;
assign soc_etherbone_wishbone_sink_last = soc_etherbone_record_receiver_source_source_last;
assign soc_etherbone_wishbone_sink_payload_addr = soc_etherbone_record_receiver_source_source_payload_addr;
assign soc_etherbone_wishbone_sink_payload_data = soc_etherbone_record_receiver_source_source_payload_data;
assign soc_etherbone_wishbone_sink_param_we = soc_etherbone_record_receiver_source_source_param_we;
assign soc_etherbone_wishbone_sink_param_count = soc_etherbone_record_receiver_source_source_param_count;
assign soc_etherbone_wishbone_sink_param_base_addr = soc_etherbone_record_receiver_source_source_param_base_addr;
assign soc_etherbone_wishbone_sink_param_be = soc_etherbone_record_receiver_source_source_param_be;
assign soc_etherbone_record_sender_sink_sink_valid = soc_etherbone_wishbone_source_valid;
assign soc_etherbone_wishbone_source_ready = soc_etherbone_record_sender_sink_sink_ready;
assign soc_etherbone_record_sender_sink_sink_first = soc_etherbone_wishbone_source_first;
assign soc_etherbone_record_sender_sink_sink_last = soc_etherbone_wishbone_source_last;
assign soc_etherbone_record_sender_sink_sink_payload_addr = soc_etherbone_wishbone_source_payload_addr;
assign soc_etherbone_record_sender_sink_sink_payload_data = soc_etherbone_wishbone_source_payload_data;
assign soc_etherbone_record_sender_sink_sink_param_we = soc_etherbone_wishbone_source_param_we;
assign soc_etherbone_record_sender_sink_sink_param_count = soc_etherbone_wishbone_source_param_count;
assign soc_etherbone_record_sender_sink_sink_param_base_addr = soc_etherbone_wishbone_source_param_base_addr;
assign soc_etherbone_record_sender_sink_sink_param_be = soc_etherbone_wishbone_source_param_be;
assign soc_etherbone_user_port_sink_valid = soc_etherbone_tx_source_source_valid;
assign soc_etherbone_tx_source_source_ready = soc_etherbone_user_port_sink_ready;
assign soc_etherbone_user_port_sink_first = soc_etherbone_tx_source_source_first;
assign soc_etherbone_user_port_sink_last = soc_etherbone_tx_source_source_last;
assign soc_etherbone_user_port_sink_payload_data = soc_etherbone_tx_source_source_payload_data;
assign soc_etherbone_user_port_sink_payload_error = soc_etherbone_tx_source_source_payload_error;
assign soc_etherbone_user_port_sink_param_src_port = soc_etherbone_tx_source_source_param_src_port;
assign soc_etherbone_user_port_sink_param_dst_port = soc_etherbone_tx_source_source_param_dst_port;
assign soc_etherbone_user_port_sink_param_ip_address = soc_etherbone_tx_source_source_param_ip_address;
assign soc_etherbone_user_port_sink_param_length = soc_etherbone_tx_source_source_param_length;
assign soc_etherbone_rx_sink_sink_valid = soc_etherbone_user_port_source_valid;
assign soc_etherbone_user_port_source_ready = soc_etherbone_rx_sink_sink_ready;
assign soc_etherbone_rx_sink_sink_first = soc_etherbone_user_port_source_first;
assign soc_etherbone_rx_sink_sink_last = soc_etherbone_user_port_source_last;
assign soc_etherbone_rx_sink_sink_payload_data = soc_etherbone_user_port_source_payload_data;
assign soc_etherbone_rx_sink_sink_payload_error = soc_etherbone_user_port_source_payload_error;
assign soc_etherbone_rx_sink_sink_param_src_port = soc_etherbone_user_port_source_param_src_port;
assign soc_etherbone_rx_sink_sink_param_dst_port = soc_etherbone_user_port_source_param_dst_port;
assign soc_etherbone_rx_sink_sink_param_ip_address = soc_etherbone_user_port_source_param_ip_address;
assign soc_etherbone_rx_sink_sink_param_length = soc_etherbone_user_port_source_param_length;
assign soc_etherbone_tx_packetizer_sink_valid = soc_etherbone_tx_sink_sink_valid;
assign soc_etherbone_tx_packetizer_sink_last = soc_etherbone_tx_sink_sink_last;
assign soc_etherbone_tx_sink_sink_ready = soc_etherbone_tx_packetizer_sink_ready;
assign soc_etherbone_tx_packetizer_sink_param_magic = 15'd20079;
assign soc_etherbone_tx_packetizer_sink_param_port_size = 3'd4;
assign soc_etherbone_tx_packetizer_sink_param_addr_size = 3'd4;
assign soc_etherbone_tx_packetizer_sink_param_pf = soc_etherbone_tx_sink_sink_param_pf;
assign soc_etherbone_tx_packetizer_sink_param_pr = soc_etherbone_tx_sink_sink_param_pr;
assign soc_etherbone_tx_packetizer_sink_param_nr = soc_etherbone_tx_sink_sink_param_nr;
assign soc_etherbone_tx_packetizer_sink_param_version = 1'd1;
assign soc_etherbone_tx_packetizer_sink_payload_data = soc_etherbone_tx_sink_sink_payload_data;
always @(*) begin
	soc_etherbone_tx_packetizer_header <= 64'd0;
	soc_etherbone_tx_packetizer_header[31:28] <= {soc_etherbone_tx_packetizer_sink_param_addr_size[3:0]};
	soc_etherbone_tx_packetizer_header[15:0] <= {soc_etherbone_tx_packetizer_sink_param_magic[7:0], soc_etherbone_tx_packetizer_sink_param_magic[15:8]};
	soc_etherbone_tx_packetizer_header[18] <= {soc_etherbone_tx_packetizer_sink_param_nr};
	soc_etherbone_tx_packetizer_header[16] <= {soc_etherbone_tx_packetizer_sink_param_pf};
	soc_etherbone_tx_packetizer_header[27:24] <= {soc_etherbone_tx_packetizer_sink_param_port_size[3:0]};
	soc_etherbone_tx_packetizer_header[17] <= {soc_etherbone_tx_packetizer_sink_param_pr};
	soc_etherbone_tx_packetizer_header[23:20] <= {soc_etherbone_tx_packetizer_sink_param_version[3:0]};
end
assign soc_etherbone_tx_packetizer_source_payload_error = soc_etherbone_tx_packetizer_sink_payload_error;
always @(*) begin
	soc_etherbone_tx_packetizer_source_valid <= 1'd0;
	soc_etherbone_tx_packetizer_source_last <= 1'd0;
	soc_etherbone_tx_packetizer_sink_ready <= 1'd0;
	soc_etherbone_tx_packetizer_source_payload_data <= 32'd0;
	vns_liteethetherbonepackettx_liteethetherbonepacketpacketizer_next_state <= 2'd0;
	soc_etherbone_tx_packetizer_count_liteethetherbonepackettx_next_value0 <= 1'd0;
	soc_etherbone_tx_packetizer_count_liteethetherbonepackettx_next_value_ce0 <= 1'd0;
	soc_etherbone_tx_packetizer_fsm_from_idle_liteethetherbonepackettx_next_value1 <= 1'd0;
	soc_etherbone_tx_packetizer_fsm_from_idle_liteethetherbonepackettx_next_value_ce1 <= 1'd0;
	soc_etherbone_tx_packetizer_sr_load <= 1'd0;
	soc_etherbone_tx_packetizer_sr_shift <= 1'd0;
	vns_liteethetherbonepackettx_liteethetherbonepacketpacketizer_next_state <= vns_liteethetherbonepackettx_liteethetherbonepacketpacketizer_state;
	case (vns_liteethetherbonepackettx_liteethetherbonepacketpacketizer_state)
		1'd1: begin
			soc_etherbone_tx_packetizer_source_valid <= 1'd1;
			soc_etherbone_tx_packetizer_source_last <= 1'd0;
			soc_etherbone_tx_packetizer_source_payload_data <= soc_etherbone_tx_packetizer_sr[63:32];
			if ((soc_etherbone_tx_packetizer_source_valid & soc_etherbone_tx_packetizer_source_ready)) begin
				soc_etherbone_tx_packetizer_sr_shift <= 1'd1;
				if ((soc_etherbone_tx_packetizer_count == 1'd1)) begin
					soc_etherbone_tx_packetizer_sr_shift <= 1'd0;
					if (1'd0) begin
						vns_liteethetherbonepackettx_liteethetherbonepacketpacketizer_next_state <= 2'd3;
						soc_etherbone_tx_packetizer_count_liteethetherbonepackettx_next_value0 <= (soc_etherbone_tx_packetizer_count + 1'd1);
						soc_etherbone_tx_packetizer_count_liteethetherbonepackettx_next_value_ce0 <= 1'd1;
					end else begin
						vns_liteethetherbonepackettx_liteethetherbonepacketpacketizer_next_state <= 2'd2;
					end
				end else begin
					soc_etherbone_tx_packetizer_count_liteethetherbonepackettx_next_value0 <= (soc_etherbone_tx_packetizer_count + 1'd1);
					soc_etherbone_tx_packetizer_count_liteethetherbonepackettx_next_value_ce0 <= 1'd1;
				end
			end
		end
		2'd2: begin
			soc_etherbone_tx_packetizer_source_valid <= soc_etherbone_tx_packetizer_sink_valid;
			soc_etherbone_tx_packetizer_source_last <= soc_etherbone_tx_packetizer_sink_last;
			soc_etherbone_tx_packetizer_source_payload_data <= soc_etherbone_tx_packetizer_sink_payload_data;
			if ((soc_etherbone_tx_packetizer_source_valid & soc_etherbone_tx_packetizer_source_ready)) begin
				soc_etherbone_tx_packetizer_sink_ready <= 1'd1;
				if (soc_etherbone_tx_packetizer_source_last) begin
					vns_liteethetherbonepackettx_liteethetherbonepacketpacketizer_next_state <= 1'd0;
				end
			end
		end
		2'd3: begin
			soc_etherbone_tx_packetizer_source_valid <= (soc_etherbone_tx_packetizer_sink_valid | soc_etherbone_tx_packetizer_sink_d_last);
			soc_etherbone_tx_packetizer_source_last <= soc_etherbone_tx_packetizer_sink_d_last;
			if (soc_etherbone_tx_packetizer_fsm_from_idle) begin
				soc_etherbone_tx_packetizer_source_payload_data[0] <= soc_etherbone_tx_packetizer_sr[63];
			end else begin
				soc_etherbone_tx_packetizer_source_payload_data[0] <= soc_etherbone_tx_packetizer_sink_d_payload_data[31];
			end
			soc_etherbone_tx_packetizer_source_payload_data[31:0] <= soc_etherbone_tx_packetizer_sink_payload_data;
			if ((soc_etherbone_tx_packetizer_source_valid & soc_etherbone_tx_packetizer_source_ready)) begin
				soc_etherbone_tx_packetizer_sink_ready <= (~soc_etherbone_tx_packetizer_source_last);
				soc_etherbone_tx_packetizer_fsm_from_idle_liteethetherbonepackettx_next_value1 <= 1'd0;
				soc_etherbone_tx_packetizer_fsm_from_idle_liteethetherbonepackettx_next_value_ce1 <= 1'd1;
				if (soc_etherbone_tx_packetizer_source_last) begin
					vns_liteethetherbonepackettx_liteethetherbonepacketpacketizer_next_state <= 1'd0;
				end
			end
		end
		default: begin
			soc_etherbone_tx_packetizer_sink_ready <= 1'd1;
			soc_etherbone_tx_packetizer_count_liteethetherbonepackettx_next_value0 <= 1'd1;
			soc_etherbone_tx_packetizer_count_liteethetherbonepackettx_next_value_ce0 <= 1'd1;
			if (soc_etherbone_tx_packetizer_sink_valid) begin
				soc_etherbone_tx_packetizer_sink_ready <= 1'd0;
				soc_etherbone_tx_packetizer_source_valid <= 1'd1;
				soc_etherbone_tx_packetizer_source_last <= 1'd0;
				soc_etherbone_tx_packetizer_source_payload_data <= soc_etherbone_tx_packetizer_header[31:0];
				if ((soc_etherbone_tx_packetizer_source_valid & soc_etherbone_tx_packetizer_source_ready)) begin
					soc_etherbone_tx_packetizer_sr_load <= 1'd1;
					soc_etherbone_tx_packetizer_fsm_from_idle_liteethetherbonepackettx_next_value1 <= 1'd1;
					soc_etherbone_tx_packetizer_fsm_from_idle_liteethetherbonepackettx_next_value_ce1 <= 1'd1;
					if (1'd0) begin
						if (1'd0) begin
							vns_liteethetherbonepackettx_liteethetherbonepacketpacketizer_next_state <= 2'd3;
						end else begin
							vns_liteethetherbonepackettx_liteethetherbonepacketpacketizer_next_state <= 2'd2;
						end
					end else begin
						vns_liteethetherbonepackettx_liteethetherbonepacketpacketizer_next_state <= 1'd1;
					end
				end
			end
		end
	endcase
end
always @(*) begin
	soc_etherbone_tx_source_source_param_src_port <= 16'd0;
	soc_etherbone_tx_source_source_param_dst_port <= 16'd0;
	soc_etherbone_tx_packetizer_source_ready <= 1'd0;
	soc_etherbone_tx_source_source_param_ip_address <= 32'd0;
	soc_etherbone_tx_source_source_param_length <= 16'd0;
	soc_etherbone_tx_source_source_valid <= 1'd0;
	soc_etherbone_tx_source_source_first <= 1'd0;
	soc_etherbone_tx_source_source_last <= 1'd0;
	vns_liteethetherbonepackettx_fsm_next_state <= 1'd0;
	soc_etherbone_tx_source_source_payload_data <= 32'd0;
	soc_etherbone_tx_source_source_payload_error <= 4'd0;
	vns_liteethetherbonepackettx_fsm_next_state <= vns_liteethetherbonepackettx_fsm_state;
	case (vns_liteethetherbonepackettx_fsm_state)
		1'd1: begin
			soc_etherbone_tx_source_source_valid <= soc_etherbone_tx_packetizer_source_valid;
			soc_etherbone_tx_packetizer_source_ready <= soc_etherbone_tx_source_source_ready;
			soc_etherbone_tx_source_source_first <= soc_etherbone_tx_packetizer_source_first;
			soc_etherbone_tx_source_source_last <= soc_etherbone_tx_packetizer_source_last;
			soc_etherbone_tx_source_source_payload_data <= soc_etherbone_tx_packetizer_source_payload_data;
			soc_etherbone_tx_source_source_payload_error <= soc_etherbone_tx_packetizer_source_payload_error;
			soc_etherbone_tx_source_source_param_src_port <= soc_etherbone_tx_packetizer_source_param_src_port;
			soc_etherbone_tx_source_source_param_dst_port <= soc_etherbone_tx_packetizer_source_param_dst_port;
			soc_etherbone_tx_source_source_param_ip_address <= soc_etherbone_tx_packetizer_source_param_ip_address;
			soc_etherbone_tx_source_source_param_length <= soc_etherbone_tx_packetizer_source_param_length;
			soc_etherbone_tx_source_source_param_src_port <= 11'd1234;
			soc_etherbone_tx_source_source_param_dst_port <= 11'd1234;
			soc_etherbone_tx_source_source_param_ip_address <= soc_etherbone_tx_sink_sink_param_ip_address;
			soc_etherbone_tx_source_source_param_length <= (soc_etherbone_tx_sink_sink_param_length + 4'd8);
			if (((soc_etherbone_tx_source_source_valid & soc_etherbone_tx_source_source_last) & soc_etherbone_tx_source_source_ready)) begin
				vns_liteethetherbonepackettx_fsm_next_state <= 1'd0;
			end
		end
		default: begin
			soc_etherbone_tx_packetizer_source_ready <= 1'd1;
			if (soc_etherbone_tx_packetizer_source_valid) begin
				soc_etherbone_tx_packetizer_source_ready <= 1'd0;
				vns_liteethetherbonepackettx_fsm_next_state <= 1'd1;
			end
		end
	endcase
end
assign soc_etherbone_rx_depacketizer_sink_valid = soc_etherbone_rx_sink_sink_valid;
assign soc_etherbone_rx_sink_sink_ready = soc_etherbone_rx_depacketizer_sink_ready;
assign soc_etherbone_rx_depacketizer_sink_first = soc_etherbone_rx_sink_sink_first;
assign soc_etherbone_rx_depacketizer_sink_last = soc_etherbone_rx_sink_sink_last;
assign soc_etherbone_rx_depacketizer_sink_payload_data = soc_etherbone_rx_sink_sink_payload_data;
assign soc_etherbone_rx_depacketizer_sink_payload_error = soc_etherbone_rx_sink_sink_payload_error;
assign soc_etherbone_rx_depacketizer_sink_param_src_port = soc_etherbone_rx_sink_sink_param_src_port;
assign soc_etherbone_rx_depacketizer_sink_param_dst_port = soc_etherbone_rx_sink_sink_param_dst_port;
assign soc_etherbone_rx_depacketizer_sink_param_ip_address = soc_etherbone_rx_sink_sink_param_ip_address;
assign soc_etherbone_rx_depacketizer_sink_param_length = soc_etherbone_rx_sink_sink_param_length;
assign soc_etherbone_rx_source_source_last = soc_etherbone_rx_depacketizer_source_last;
assign soc_etherbone_rx_source_source_param_pf = soc_etherbone_rx_depacketizer_source_param_pf;
assign soc_etherbone_rx_source_source_param_pr = soc_etherbone_rx_depacketizer_source_param_pr;
assign soc_etherbone_rx_source_source_param_nr = soc_etherbone_rx_depacketizer_source_param_nr;
assign soc_etherbone_rx_source_source_payload_data = soc_etherbone_rx_depacketizer_source_payload_data;
assign soc_etherbone_rx_source_source_param_src_port = soc_etherbone_rx_sink_sink_param_src_port;
assign soc_etherbone_rx_source_source_param_dst_port = soc_etherbone_rx_sink_sink_param_dst_port;
assign soc_etherbone_rx_source_source_param_ip_address = soc_etherbone_rx_sink_sink_param_ip_address;
assign soc_etherbone_rx_source_source_param_length = (soc_etherbone_rx_sink_sink_param_length - 4'd8);
assign soc_etherbone_rx_depacketizer_header = soc_etherbone_rx_depacketizer_sr;
assign soc_etherbone_rx_depacketizer_source_param_addr_size = {vns_slice_proxy76[3:0]};
assign soc_etherbone_rx_depacketizer_source_param_magic = {vns_slice_proxy78[7:0], vns_slice_proxy77[15:8]};
assign soc_etherbone_rx_depacketizer_source_param_nr = {vns_slice_proxy79};
assign soc_etherbone_rx_depacketizer_source_param_pf = {vns_slice_proxy80};
assign soc_etherbone_rx_depacketizer_source_param_port_size = {vns_slice_proxy81[3:0]};
assign soc_etherbone_rx_depacketizer_source_param_pr = {vns_slice_proxy82};
assign soc_etherbone_rx_depacketizer_source_param_version = {vns_slice_proxy83[3:0]};
assign soc_etherbone_rx_depacketizer_source_payload_error = soc_etherbone_rx_depacketizer_sink_payload_error;
always @(*) begin
	soc_etherbone_rx_depacketizer_sr_shift <= 1'd0;
	soc_etherbone_rx_depacketizer_source_valid <= 1'd0;
	soc_etherbone_rx_depacketizer_sr_shift_leftover <= 1'd0;
	vns_liteethetherbonepacketrx_liteethetherbonepacketdepacketizer_next_state <= 2'd0;
	soc_etherbone_rx_depacketizer_count_liteethetherbonepacketrx_next_value0 <= 1'd0;
	soc_etherbone_rx_depacketizer_source_last <= 1'd0;
	soc_etherbone_rx_depacketizer_count_liteethetherbonepacketrx_next_value_ce0 <= 1'd0;
	soc_etherbone_rx_depacketizer_source_payload_data <= 32'd0;
	soc_etherbone_rx_depacketizer_fsm_from_idle_liteethetherbonepacketrx_next_value1 <= 1'd0;
	soc_etherbone_rx_depacketizer_sink_ready <= 1'd0;
	soc_etherbone_rx_depacketizer_fsm_from_idle_liteethetherbonepacketrx_next_value_ce1 <= 1'd0;
	vns_liteethetherbonepacketrx_liteethetherbonepacketdepacketizer_next_state <= vns_liteethetherbonepacketrx_liteethetherbonepacketdepacketizer_state;
	case (vns_liteethetherbonepacketrx_liteethetherbonepacketdepacketizer_state)
		1'd1: begin
			soc_etherbone_rx_depacketizer_sink_ready <= 1'd1;
			if (soc_etherbone_rx_depacketizer_sink_valid) begin
				soc_etherbone_rx_depacketizer_count_liteethetherbonepacketrx_next_value0 <= (soc_etherbone_rx_depacketizer_count + 1'd1);
				soc_etherbone_rx_depacketizer_count_liteethetherbonepacketrx_next_value_ce0 <= 1'd1;
				soc_etherbone_rx_depacketizer_sr_shift <= 1'd1;
				if ((soc_etherbone_rx_depacketizer_count == 1'd1)) begin
					if (1'd0) begin
						soc_etherbone_rx_depacketizer_count_liteethetherbonepacketrx_next_value0 <= (soc_etherbone_rx_depacketizer_count + 1'd1);
						soc_etherbone_rx_depacketizer_count_liteethetherbonepacketrx_next_value_ce0 <= 1'd1;
						vns_liteethetherbonepacketrx_liteethetherbonepacketdepacketizer_next_state <= 2'd2;
					end else begin
						vns_liteethetherbonepacketrx_liteethetherbonepacketdepacketizer_next_state <= 2'd3;
					end
				end
			end
		end
		2'd2: begin
			soc_etherbone_rx_depacketizer_source_valid <= (soc_etherbone_rx_depacketizer_sink_valid | soc_etherbone_rx_depacketizer_sink_d_last);
			soc_etherbone_rx_depacketizer_source_last <= (soc_etherbone_rx_depacketizer_sink_last | soc_etherbone_rx_depacketizer_sink_d_last);
			soc_etherbone_rx_depacketizer_sink_ready <= soc_etherbone_rx_depacketizer_source_ready;
			soc_etherbone_rx_depacketizer_source_payload_data <= soc_etherbone_rx_depacketizer_sink_d_payload_data[31:0];
			soc_etherbone_rx_depacketizer_source_payload_data[31] <= soc_etherbone_rx_depacketizer_sink_payload_data;
			if (soc_etherbone_rx_depacketizer_fsm_from_idle) begin
				soc_etherbone_rx_depacketizer_source_valid <= soc_etherbone_rx_depacketizer_sink_d_last;
				soc_etherbone_rx_depacketizer_sink_ready <= 1'd1;
				if (soc_etherbone_rx_depacketizer_sink_valid) begin
					soc_etherbone_rx_depacketizer_fsm_from_idle_liteethetherbonepacketrx_next_value1 <= 1'd0;
					soc_etherbone_rx_depacketizer_fsm_from_idle_liteethetherbonepacketrx_next_value_ce1 <= 1'd1;
					soc_etherbone_rx_depacketizer_sr_shift_leftover <= 1'd1;
				end
			end
			if ((soc_etherbone_rx_depacketizer_source_valid & soc_etherbone_rx_depacketizer_source_ready)) begin
				if (soc_etherbone_rx_depacketizer_source_last) begin
					vns_liteethetherbonepacketrx_liteethetherbonepacketdepacketizer_next_state <= 1'd0;
				end
			end
		end
		2'd3: begin
			soc_etherbone_rx_depacketizer_source_valid <= (soc_etherbone_rx_depacketizer_sink_valid | soc_etherbone_rx_depacketizer_sink_d_last);
			soc_etherbone_rx_depacketizer_source_last <= (soc_etherbone_rx_depacketizer_sink_last | soc_etherbone_rx_depacketizer_sink_d_last);
			soc_etherbone_rx_depacketizer_sink_ready <= soc_etherbone_rx_depacketizer_source_ready;
			soc_etherbone_rx_depacketizer_source_payload_data <= soc_etherbone_rx_depacketizer_sink_payload_data;
			if ((soc_etherbone_rx_depacketizer_source_valid & soc_etherbone_rx_depacketizer_source_ready)) begin
				if (soc_etherbone_rx_depacketizer_source_last) begin
					vns_liteethetherbonepacketrx_liteethetherbonepacketdepacketizer_next_state <= 1'd0;
				end
			end
		end
		default: begin
			soc_etherbone_rx_depacketizer_sink_ready <= 1'd1;
			soc_etherbone_rx_depacketizer_count_liteethetherbonepacketrx_next_value0 <= 1'd1;
			soc_etherbone_rx_depacketizer_count_liteethetherbonepacketrx_next_value_ce0 <= 1'd1;
			if (soc_etherbone_rx_depacketizer_sink_valid) begin
				soc_etherbone_rx_depacketizer_sr_shift <= 1'd1;
				soc_etherbone_rx_depacketizer_fsm_from_idle_liteethetherbonepacketrx_next_value1 <= 1'd1;
				soc_etherbone_rx_depacketizer_fsm_from_idle_liteethetherbonepacketrx_next_value_ce1 <= 1'd1;
				if (1'd0) begin
					if (1'd0) begin
						vns_liteethetherbonepacketrx_liteethetherbonepacketdepacketizer_next_state <= 2'd2;
					end else begin
						vns_liteethetherbonepacketrx_liteethetherbonepacketdepacketizer_next_state <= 2'd3;
					end
				end else begin
					vns_liteethetherbonepacketrx_liteethetherbonepacketdepacketizer_next_state <= 1'd1;
				end
			end
		end
	endcase
end
always @(*) begin
	soc_etherbone_rx_source_source_valid <= 1'd0;
	vns_liteethetherbonepacketrx_fsm_next_state <= 2'd0;
	soc_etherbone_rx_depacketizer_source_ready <= 1'd0;
	vns_liteethetherbonepacketrx_fsm_next_state <= vns_liteethetherbonepacketrx_fsm_state;
	case (vns_liteethetherbonepacketrx_fsm_state)
		1'd1: begin
			if (soc_etherbone_rx_valid) begin
				vns_liteethetherbonepacketrx_fsm_next_state <= 2'd2;
			end else begin
				vns_liteethetherbonepacketrx_fsm_next_state <= 2'd3;
			end
		end
		2'd2: begin
			soc_etherbone_rx_source_source_valid <= soc_etherbone_rx_depacketizer_source_valid;
			soc_etherbone_rx_depacketizer_source_ready <= soc_etherbone_rx_source_source_ready;
			if (((soc_etherbone_rx_source_source_valid & soc_etherbone_rx_source_source_last) & soc_etherbone_rx_source_source_ready)) begin
				vns_liteethetherbonepacketrx_fsm_next_state <= 1'd0;
			end
		end
		2'd3: begin
			soc_etherbone_rx_depacketizer_source_ready <= 1'd1;
			if (((soc_etherbone_rx_depacketizer_source_valid & soc_etherbone_rx_depacketizer_source_last) & soc_etherbone_rx_depacketizer_source_ready)) begin
				vns_liteethetherbonepacketrx_fsm_next_state <= 1'd0;
			end
		end
		default: begin
			soc_etherbone_rx_depacketizer_source_ready <= 1'd1;
			if (soc_etherbone_rx_depacketizer_source_valid) begin
				soc_etherbone_rx_depacketizer_source_ready <= 1'd0;
				vns_liteethetherbonepacketrx_fsm_next_state <= 1'd1;
			end
		end
	endcase
end
always @(*) begin
	soc_etherbone_probe_source_first <= 1'd0;
	soc_etherbone_probe_source_last <= 1'd0;
	soc_etherbone_probe_source_payload_data <= 32'd0;
	vns_liteethetherboneprobe_next_state <= 1'd0;
	soc_etherbone_probe_source_payload_error <= 4'd0;
	soc_etherbone_probe_source_param_addr_size <= 4'd0;
	soc_etherbone_probe_source_param_nr <= 1'd0;
	soc_etherbone_probe_source_param_pf <= 1'd0;
	soc_etherbone_probe_source_param_port_size <= 4'd0;
	soc_etherbone_probe_source_param_pr <= 1'd0;
	soc_etherbone_probe_source_param_src_port <= 16'd0;
	soc_etherbone_probe_source_param_dst_port <= 16'd0;
	soc_etherbone_probe_source_param_ip_address <= 32'd0;
	soc_etherbone_probe_source_param_length <= 16'd0;
	soc_etherbone_probe_sink_ready <= 1'd0;
	soc_etherbone_probe_source_valid <= 1'd0;
	vns_liteethetherboneprobe_next_state <= vns_liteethetherboneprobe_state;
	case (vns_liteethetherboneprobe_state)
		1'd1: begin
			soc_etherbone_probe_source_valid <= soc_etherbone_probe_sink_valid;
			soc_etherbone_probe_sink_ready <= soc_etherbone_probe_source_ready;
			soc_etherbone_probe_source_first <= soc_etherbone_probe_sink_first;
			soc_etherbone_probe_source_last <= soc_etherbone_probe_sink_last;
			soc_etherbone_probe_source_payload_data <= soc_etherbone_probe_sink_payload_data;
			soc_etherbone_probe_source_payload_error <= soc_etherbone_probe_sink_payload_error;
			soc_etherbone_probe_source_param_addr_size <= soc_etherbone_probe_sink_param_addr_size;
			soc_etherbone_probe_source_param_nr <= soc_etherbone_probe_sink_param_nr;
			soc_etherbone_probe_source_param_pf <= soc_etherbone_probe_sink_param_pf;
			soc_etherbone_probe_source_param_port_size <= soc_etherbone_probe_sink_param_port_size;
			soc_etherbone_probe_source_param_pr <= soc_etherbone_probe_sink_param_pr;
			soc_etherbone_probe_source_param_src_port <= soc_etherbone_probe_sink_param_src_port;
			soc_etherbone_probe_source_param_dst_port <= soc_etherbone_probe_sink_param_dst_port;
			soc_etherbone_probe_source_param_ip_address <= soc_etherbone_probe_sink_param_ip_address;
			soc_etherbone_probe_source_param_length <= soc_etherbone_probe_sink_param_length;
			soc_etherbone_probe_source_param_pf <= 1'd0;
			soc_etherbone_probe_source_param_pr <= 1'd1;
			if (((soc_etherbone_probe_source_valid & soc_etherbone_probe_source_last) & soc_etherbone_probe_source_ready)) begin
				vns_liteethetherboneprobe_next_state <= 1'd0;
			end
		end
		default: begin
			soc_etherbone_probe_sink_ready <= 1'd1;
			if (soc_etherbone_probe_sink_valid) begin
				soc_etherbone_probe_sink_ready <= 1'd0;
				vns_liteethetherboneprobe_next_state <= 1'd1;
			end
		end
	endcase
end
assign soc_etherbone_record_depacketizer_sink_valid = soc_etherbone_record_sink_sink_valid;
assign soc_etherbone_record_sink_sink_ready = soc_etherbone_record_depacketizer_sink_ready;
assign soc_etherbone_record_depacketizer_sink_first = soc_etherbone_record_sink_sink_first;
assign soc_etherbone_record_depacketizer_sink_last = soc_etherbone_record_sink_sink_last;
assign soc_etherbone_record_depacketizer_sink_payload_data = soc_etherbone_record_sink_sink_payload_data;
assign soc_etherbone_record_depacketizer_sink_payload_error = soc_etherbone_record_sink_sink_payload_error;
assign soc_etherbone_record_depacketizer_sink_param_addr_size = soc_etherbone_record_sink_sink_param_addr_size;
assign soc_etherbone_record_depacketizer_sink_param_nr = soc_etherbone_record_sink_sink_param_nr;
assign soc_etherbone_record_depacketizer_sink_param_pf = soc_etherbone_record_sink_sink_param_pf;
assign soc_etherbone_record_depacketizer_sink_param_port_size = soc_etherbone_record_sink_sink_param_port_size;
assign soc_etherbone_record_depacketizer_sink_param_pr = soc_etherbone_record_sink_sink_param_pr;
assign soc_etherbone_record_depacketizer_sink_param_src_port = soc_etherbone_record_sink_sink_param_src_port;
assign soc_etherbone_record_depacketizer_sink_param_dst_port = soc_etherbone_record_sink_sink_param_dst_port;
assign soc_etherbone_record_depacketizer_sink_param_ip_address = soc_etherbone_record_sink_sink_param_ip_address;
assign soc_etherbone_record_depacketizer_sink_param_length = soc_etherbone_record_sink_sink_param_length;
assign soc_etherbone_record_receiver_sink_sink_valid = soc_etherbone_record_depacketizer_source_valid;
assign soc_etherbone_record_depacketizer_source_ready = soc_etherbone_record_receiver_sink_sink_ready;
assign soc_etherbone_record_receiver_sink_sink_first = soc_etherbone_record_depacketizer_source_first;
assign soc_etherbone_record_receiver_sink_sink_last = soc_etherbone_record_depacketizer_source_last;
assign soc_etherbone_record_receiver_sink_sink_payload_error = soc_etherbone_record_depacketizer_source_payload_error;
assign soc_etherbone_record_receiver_sink_sink_param_bca = soc_etherbone_record_depacketizer_source_param_bca;
assign soc_etherbone_record_receiver_sink_sink_param_byte_enable = soc_etherbone_record_depacketizer_source_param_byte_enable;
assign soc_etherbone_record_receiver_sink_sink_param_cyc = soc_etherbone_record_depacketizer_source_param_cyc;
assign soc_etherbone_record_receiver_sink_sink_param_rca = soc_etherbone_record_depacketizer_source_param_rca;
assign soc_etherbone_record_receiver_sink_sink_param_rcount = soc_etherbone_record_depacketizer_source_param_rcount;
assign soc_etherbone_record_receiver_sink_sink_param_rff = soc_etherbone_record_depacketizer_source_param_rff;
assign soc_etherbone_record_receiver_sink_sink_param_wca = soc_etherbone_record_depacketizer_source_param_wca;
assign soc_etherbone_record_receiver_sink_sink_param_wcount = soc_etherbone_record_depacketizer_source_param_wcount;
assign soc_etherbone_record_receiver_sink_sink_param_wff = soc_etherbone_record_depacketizer_source_param_wff;
always @(*) begin
	soc_etherbone_record_receiver_sink_sink_payload_data <= 32'd0;
	soc_etherbone_record_receiver_sink_sink_payload_data <= soc_etherbone_record_depacketizer_source_payload_data;
	soc_etherbone_record_receiver_sink_sink_payload_data <= {soc_etherbone_record_depacketizer_source_payload_data[7:0], soc_etherbone_record_depacketizer_source_payload_data[15:8], soc_etherbone_record_depacketizer_source_payload_data[23:16], soc_etherbone_record_depacketizer_source_payload_data[31:24]};
end
assign soc_etherbone_record_packetizer_sink_valid = soc_etherbone_record_sender_source_source_valid;
assign soc_etherbone_record_sender_source_source_ready = soc_etherbone_record_packetizer_sink_ready;
assign soc_etherbone_record_packetizer_sink_first = soc_etherbone_record_sender_source_source_first;
assign soc_etherbone_record_packetizer_sink_last = soc_etherbone_record_sender_source_source_last;
assign soc_etherbone_record_packetizer_sink_payload_error = soc_etherbone_record_sender_source_source_payload_error;
assign soc_etherbone_record_packetizer_sink_param_bca = soc_etherbone_record_sender_source_source_param_bca;
assign soc_etherbone_record_packetizer_sink_param_byte_enable = soc_etherbone_record_sender_source_source_param_byte_enable;
assign soc_etherbone_record_packetizer_sink_param_cyc = soc_etherbone_record_sender_source_source_param_cyc;
assign soc_etherbone_record_packetizer_sink_param_rca = soc_etherbone_record_sender_source_source_param_rca;
assign soc_etherbone_record_packetizer_sink_param_rcount = soc_etherbone_record_sender_source_source_param_rcount;
assign soc_etherbone_record_packetizer_sink_param_rff = soc_etherbone_record_sender_source_source_param_rff;
assign soc_etherbone_record_packetizer_sink_param_wca = soc_etherbone_record_sender_source_source_param_wca;
assign soc_etherbone_record_packetizer_sink_param_wcount = soc_etherbone_record_sender_source_source_param_wcount;
assign soc_etherbone_record_packetizer_sink_param_wff = soc_etherbone_record_sender_source_source_param_wff;
assign soc_etherbone_record_source_source_valid = soc_etherbone_record_packetizer_source_valid;
assign soc_etherbone_record_packetizer_source_ready = soc_etherbone_record_source_source_ready;
assign soc_etherbone_record_source_source_first = soc_etherbone_record_packetizer_source_first;
assign soc_etherbone_record_source_source_last = soc_etherbone_record_packetizer_source_last;
assign soc_etherbone_record_source_source_payload_data = soc_etherbone_record_packetizer_source_payload_data;
assign soc_etherbone_record_source_source_payload_error = soc_etherbone_record_packetizer_source_payload_error;
assign soc_etherbone_record_source_source_param_addr_size = soc_etherbone_record_packetizer_source_param_addr_size;
assign soc_etherbone_record_source_source_param_nr = soc_etherbone_record_packetizer_source_param_nr;
assign soc_etherbone_record_source_source_param_pf = soc_etherbone_record_packetizer_source_param_pf;
assign soc_etherbone_record_source_source_param_port_size = soc_etherbone_record_packetizer_source_param_port_size;
assign soc_etherbone_record_source_source_param_pr = soc_etherbone_record_packetizer_source_param_pr;
assign soc_etherbone_record_source_source_param_src_port = soc_etherbone_record_packetizer_source_param_src_port;
assign soc_etherbone_record_source_source_param_dst_port = soc_etherbone_record_packetizer_source_param_dst_port;
always @(*) begin
	soc_etherbone_record_source_source_param_length <= 16'd0;
	soc_etherbone_record_source_source_param_length <= soc_etherbone_record_packetizer_source_param_length;
	soc_etherbone_record_source_source_param_length <= ((((3'd4 + ((soc_etherbone_record_sender_source_source_param_wcount != 1'd0) * 3'd4)) + (soc_etherbone_record_sender_source_source_param_wcount * 3'd4)) + ((soc_etherbone_record_sender_source_source_param_rcount != 1'd0) * 3'd4)) + (soc_etherbone_record_sender_source_source_param_rcount * 3'd4));
end
always @(*) begin
	soc_etherbone_record_source_source_param_ip_address <= 32'd0;
	soc_etherbone_record_source_source_param_ip_address <= soc_etherbone_record_packetizer_source_param_ip_address;
	soc_etherbone_record_source_source_param_ip_address <= soc_etherbone_record_last_ip_address;
end
always @(*) begin
	soc_etherbone_record_packetizer_sink_payload_data <= 32'd0;
	soc_etherbone_record_packetizer_sink_payload_data <= soc_etherbone_record_sender_source_source_payload_data;
	soc_etherbone_record_packetizer_sink_payload_data <= {soc_etherbone_record_sender_source_source_payload_data[7:0], soc_etherbone_record_sender_source_source_payload_data[15:8], soc_etherbone_record_sender_source_source_payload_data[23:16], soc_etherbone_record_sender_source_source_payload_data[31:24]};
end
assign soc_etherbone_record_depacketizer_header = soc_etherbone_record_depacketizer_sr;
assign soc_etherbone_record_depacketizer_source_param_bca = {vns_slice_proxy84};
assign soc_etherbone_record_depacketizer_source_param_byte_enable = {vns_slice_proxy85[7:0]};
assign soc_etherbone_record_depacketizer_source_param_cyc = {vns_slice_proxy86};
assign soc_etherbone_record_depacketizer_source_param_rca = {vns_slice_proxy87};
assign soc_etherbone_record_depacketizer_source_param_rcount = {vns_slice_proxy88[7:0]};
assign soc_etherbone_record_depacketizer_source_param_rff = {vns_slice_proxy89};
assign soc_etherbone_record_depacketizer_source_param_wca = {vns_slice_proxy90};
assign soc_etherbone_record_depacketizer_source_param_wcount = {vns_slice_proxy91[7:0]};
assign soc_etherbone_record_depacketizer_source_param_wff = {vns_slice_proxy92};
assign soc_etherbone_record_depacketizer_source_payload_error = soc_etherbone_record_depacketizer_sink_payload_error;
always @(*) begin
	soc_etherbone_record_depacketizer_sink_ready <= 1'd0;
	soc_etherbone_record_depacketizer_sr_shift_leftover <= 1'd0;
	soc_etherbone_record_depacketizer_source_last <= 1'd0;
	soc_etherbone_record_depacketizer_source_payload_data <= 32'd0;
	vns_liteethetherbonerecorddepacketizer_next_state <= 2'd0;
	soc_etherbone_record_depacketizer_count_liteethetherbonerecorddepacketizer_next_value0 <= 1'd0;
	soc_etherbone_record_depacketizer_count_liteethetherbonerecorddepacketizer_next_value_ce0 <= 1'd0;
	soc_etherbone_record_depacketizer_source_valid <= 1'd0;
	soc_etherbone_record_depacketizer_fsm_from_idle_liteethetherbonerecorddepacketizer_next_value1 <= 1'd0;
	soc_etherbone_record_depacketizer_sr_shift <= 1'd0;
	soc_etherbone_record_depacketizer_fsm_from_idle_liteethetherbonerecorddepacketizer_next_value_ce1 <= 1'd0;
	vns_liteethetherbonerecorddepacketizer_next_state <= vns_liteethetherbonerecorddepacketizer_state;
	case (vns_liteethetherbonerecorddepacketizer_state)
		1'd1: begin
			soc_etherbone_record_depacketizer_sink_ready <= 1'd1;
			if (soc_etherbone_record_depacketizer_sink_valid) begin
				soc_etherbone_record_depacketizer_count_liteethetherbonerecorddepacketizer_next_value0 <= (soc_etherbone_record_depacketizer_count + 1'd1);
				soc_etherbone_record_depacketizer_count_liteethetherbonerecorddepacketizer_next_value_ce0 <= 1'd1;
				soc_etherbone_record_depacketizer_sr_shift <= 1'd1;
				if ((soc_etherbone_record_depacketizer_count == 1'd0)) begin
					if (1'd0) begin
						soc_etherbone_record_depacketizer_count_liteethetherbonerecorddepacketizer_next_value0 <= (soc_etherbone_record_depacketizer_count + 1'd1);
						soc_etherbone_record_depacketizer_count_liteethetherbonerecorddepacketizer_next_value_ce0 <= 1'd1;
						vns_liteethetherbonerecorddepacketizer_next_state <= 2'd2;
					end else begin
						vns_liteethetherbonerecorddepacketizer_next_state <= 2'd3;
					end
				end
			end
		end
		2'd2: begin
			soc_etherbone_record_depacketizer_source_valid <= (soc_etherbone_record_depacketizer_sink_valid | soc_etherbone_record_depacketizer_sink_d_last);
			soc_etherbone_record_depacketizer_source_last <= (soc_etherbone_record_depacketizer_sink_last | soc_etherbone_record_depacketizer_sink_d_last);
			soc_etherbone_record_depacketizer_sink_ready <= soc_etherbone_record_depacketizer_source_ready;
			soc_etherbone_record_depacketizer_source_payload_data <= soc_etherbone_record_depacketizer_sink_d_payload_data[31:0];
			soc_etherbone_record_depacketizer_source_payload_data[31] <= soc_etherbone_record_depacketizer_sink_payload_data;
			if (soc_etherbone_record_depacketizer_fsm_from_idle) begin
				soc_etherbone_record_depacketizer_source_valid <= soc_etherbone_record_depacketizer_sink_d_last;
				soc_etherbone_record_depacketizer_sink_ready <= 1'd1;
				if (soc_etherbone_record_depacketizer_sink_valid) begin
					soc_etherbone_record_depacketizer_fsm_from_idle_liteethetherbonerecorddepacketizer_next_value1 <= 1'd0;
					soc_etherbone_record_depacketizer_fsm_from_idle_liteethetherbonerecorddepacketizer_next_value_ce1 <= 1'd1;
					soc_etherbone_record_depacketizer_sr_shift_leftover <= 1'd1;
				end
			end
			if ((soc_etherbone_record_depacketizer_source_valid & soc_etherbone_record_depacketizer_source_ready)) begin
				if (soc_etherbone_record_depacketizer_source_last) begin
					vns_liteethetherbonerecorddepacketizer_next_state <= 1'd0;
				end
			end
		end
		2'd3: begin
			soc_etherbone_record_depacketizer_source_valid <= (soc_etherbone_record_depacketizer_sink_valid | soc_etherbone_record_depacketizer_sink_d_last);
			soc_etherbone_record_depacketizer_source_last <= (soc_etherbone_record_depacketizer_sink_last | soc_etherbone_record_depacketizer_sink_d_last);
			soc_etherbone_record_depacketizer_sink_ready <= soc_etherbone_record_depacketizer_source_ready;
			soc_etherbone_record_depacketizer_source_payload_data <= soc_etherbone_record_depacketizer_sink_payload_data;
			if ((soc_etherbone_record_depacketizer_source_valid & soc_etherbone_record_depacketizer_source_ready)) begin
				if (soc_etherbone_record_depacketizer_source_last) begin
					vns_liteethetherbonerecorddepacketizer_next_state <= 1'd0;
				end
			end
		end
		default: begin
			soc_etherbone_record_depacketizer_sink_ready <= 1'd1;
			soc_etherbone_record_depacketizer_count_liteethetherbonerecorddepacketizer_next_value0 <= 1'd1;
			soc_etherbone_record_depacketizer_count_liteethetherbonerecorddepacketizer_next_value_ce0 <= 1'd1;
			if (soc_etherbone_record_depacketizer_sink_valid) begin
				soc_etherbone_record_depacketizer_sr_shift <= 1'd1;
				soc_etherbone_record_depacketizer_fsm_from_idle_liteethetherbonerecorddepacketizer_next_value1 <= 1'd1;
				soc_etherbone_record_depacketizer_fsm_from_idle_liteethetherbonerecorddepacketizer_next_value_ce1 <= 1'd1;
				if (1'd1) begin
					if (1'd0) begin
						vns_liteethetherbonerecorddepacketizer_next_state <= 2'd2;
					end else begin
						vns_liteethetherbonerecorddepacketizer_next_state <= 2'd3;
					end
				end else begin
					vns_liteethetherbonerecorddepacketizer_next_state <= 1'd1;
				end
			end
		end
	endcase
end
assign soc_etherbone_record_receiver_fifo_sink_valid = soc_etherbone_record_receiver_sink_sink_valid;
assign soc_etherbone_record_receiver_sink_sink_ready = soc_etherbone_record_receiver_fifo_sink_ready;
assign soc_etherbone_record_receiver_fifo_sink_first = soc_etherbone_record_receiver_sink_sink_first;
assign soc_etherbone_record_receiver_fifo_sink_last = soc_etherbone_record_receiver_sink_sink_last;
assign soc_etherbone_record_receiver_fifo_sink_payload_data = soc_etherbone_record_receiver_sink_sink_payload_data;
assign soc_etherbone_record_receiver_fifo_sink_payload_error = soc_etherbone_record_receiver_sink_sink_payload_error;
assign soc_etherbone_record_receiver_fifo_sink_param_bca = soc_etherbone_record_receiver_sink_sink_param_bca;
assign soc_etherbone_record_receiver_fifo_sink_param_byte_enable = soc_etherbone_record_receiver_sink_sink_param_byte_enable;
assign soc_etherbone_record_receiver_fifo_sink_param_cyc = soc_etherbone_record_receiver_sink_sink_param_cyc;
assign soc_etherbone_record_receiver_fifo_sink_param_rca = soc_etherbone_record_receiver_sink_sink_param_rca;
assign soc_etherbone_record_receiver_fifo_sink_param_rcount = soc_etherbone_record_receiver_sink_sink_param_rcount;
assign soc_etherbone_record_receiver_fifo_sink_param_rff = soc_etherbone_record_receiver_sink_sink_param_rff;
assign soc_etherbone_record_receiver_fifo_sink_param_wca = soc_etherbone_record_receiver_sink_sink_param_wca;
assign soc_etherbone_record_receiver_fifo_sink_param_wcount = soc_etherbone_record_receiver_sink_sink_param_wcount;
assign soc_etherbone_record_receiver_fifo_sink_param_wff = soc_etherbone_record_receiver_sink_sink_param_wff;
assign soc_etherbone_record_receiver_fifo_syncfifo_din = {soc_etherbone_record_receiver_fifo_fifo_in_last, soc_etherbone_record_receiver_fifo_fifo_in_first, soc_etherbone_record_receiver_fifo_fifo_in_param_wff, soc_etherbone_record_receiver_fifo_fifo_in_param_wcount, soc_etherbone_record_receiver_fifo_fifo_in_param_wca, soc_etherbone_record_receiver_fifo_fifo_in_param_rff, soc_etherbone_record_receiver_fifo_fifo_in_param_rcount, soc_etherbone_record_receiver_fifo_fifo_in_param_rca, soc_etherbone_record_receiver_fifo_fifo_in_param_cyc, soc_etherbone_record_receiver_fifo_fifo_in_param_byte_enable, soc_etherbone_record_receiver_fifo_fifo_in_param_bca, soc_etherbone_record_receiver_fifo_fifo_in_payload_error, soc_etherbone_record_receiver_fifo_fifo_in_payload_data};
assign {soc_etherbone_record_receiver_fifo_fifo_out_last, soc_etherbone_record_receiver_fifo_fifo_out_first, soc_etherbone_record_receiver_fifo_fifo_out_param_wff, soc_etherbone_record_receiver_fifo_fifo_out_param_wcount, soc_etherbone_record_receiver_fifo_fifo_out_param_wca, soc_etherbone_record_receiver_fifo_fifo_out_param_rff, soc_etherbone_record_receiver_fifo_fifo_out_param_rcount, soc_etherbone_record_receiver_fifo_fifo_out_param_rca, soc_etherbone_record_receiver_fifo_fifo_out_param_cyc, soc_etherbone_record_receiver_fifo_fifo_out_param_byte_enable, soc_etherbone_record_receiver_fifo_fifo_out_param_bca, soc_etherbone_record_receiver_fifo_fifo_out_payload_error, soc_etherbone_record_receiver_fifo_fifo_out_payload_data} = soc_etherbone_record_receiver_fifo_syncfifo_dout;
assign soc_etherbone_record_receiver_fifo_sink_ready = soc_etherbone_record_receiver_fifo_syncfifo_writable;
assign soc_etherbone_record_receiver_fifo_syncfifo_we = soc_etherbone_record_receiver_fifo_sink_valid;
assign soc_etherbone_record_receiver_fifo_fifo_in_first = soc_etherbone_record_receiver_fifo_sink_first;
assign soc_etherbone_record_receiver_fifo_fifo_in_last = soc_etherbone_record_receiver_fifo_sink_last;
assign soc_etherbone_record_receiver_fifo_fifo_in_payload_data = soc_etherbone_record_receiver_fifo_sink_payload_data;
assign soc_etherbone_record_receiver_fifo_fifo_in_payload_error = soc_etherbone_record_receiver_fifo_sink_payload_error;
assign soc_etherbone_record_receiver_fifo_fifo_in_param_bca = soc_etherbone_record_receiver_fifo_sink_param_bca;
assign soc_etherbone_record_receiver_fifo_fifo_in_param_byte_enable = soc_etherbone_record_receiver_fifo_sink_param_byte_enable;
assign soc_etherbone_record_receiver_fifo_fifo_in_param_cyc = soc_etherbone_record_receiver_fifo_sink_param_cyc;
assign soc_etherbone_record_receiver_fifo_fifo_in_param_rca = soc_etherbone_record_receiver_fifo_sink_param_rca;
assign soc_etherbone_record_receiver_fifo_fifo_in_param_rcount = soc_etherbone_record_receiver_fifo_sink_param_rcount;
assign soc_etherbone_record_receiver_fifo_fifo_in_param_rff = soc_etherbone_record_receiver_fifo_sink_param_rff;
assign soc_etherbone_record_receiver_fifo_fifo_in_param_wca = soc_etherbone_record_receiver_fifo_sink_param_wca;
assign soc_etherbone_record_receiver_fifo_fifo_in_param_wcount = soc_etherbone_record_receiver_fifo_sink_param_wcount;
assign soc_etherbone_record_receiver_fifo_fifo_in_param_wff = soc_etherbone_record_receiver_fifo_sink_param_wff;
assign soc_etherbone_record_receiver_fifo_source_valid = soc_etherbone_record_receiver_fifo_readable;
assign soc_etherbone_record_receiver_fifo_source_first = soc_etherbone_record_receiver_fifo_fifo_out_first;
assign soc_etherbone_record_receiver_fifo_source_last = soc_etherbone_record_receiver_fifo_fifo_out_last;
assign soc_etherbone_record_receiver_fifo_source_payload_data = soc_etherbone_record_receiver_fifo_fifo_out_payload_data;
assign soc_etherbone_record_receiver_fifo_source_payload_error = soc_etherbone_record_receiver_fifo_fifo_out_payload_error;
assign soc_etherbone_record_receiver_fifo_source_param_bca = soc_etherbone_record_receiver_fifo_fifo_out_param_bca;
assign soc_etherbone_record_receiver_fifo_source_param_byte_enable = soc_etherbone_record_receiver_fifo_fifo_out_param_byte_enable;
assign soc_etherbone_record_receiver_fifo_source_param_cyc = soc_etherbone_record_receiver_fifo_fifo_out_param_cyc;
assign soc_etherbone_record_receiver_fifo_source_param_rca = soc_etherbone_record_receiver_fifo_fifo_out_param_rca;
assign soc_etherbone_record_receiver_fifo_source_param_rcount = soc_etherbone_record_receiver_fifo_fifo_out_param_rcount;
assign soc_etherbone_record_receiver_fifo_source_param_rff = soc_etherbone_record_receiver_fifo_fifo_out_param_rff;
assign soc_etherbone_record_receiver_fifo_source_param_wca = soc_etherbone_record_receiver_fifo_fifo_out_param_wca;
assign soc_etherbone_record_receiver_fifo_source_param_wcount = soc_etherbone_record_receiver_fifo_fifo_out_param_wcount;
assign soc_etherbone_record_receiver_fifo_source_param_wff = soc_etherbone_record_receiver_fifo_fifo_out_param_wff;
assign soc_etherbone_record_receiver_fifo_re = soc_etherbone_record_receiver_fifo_source_ready;
assign soc_etherbone_record_receiver_fifo_syncfifo_re = (soc_etherbone_record_receiver_fifo_syncfifo_readable & ((~soc_etherbone_record_receiver_fifo_readable) | soc_etherbone_record_receiver_fifo_re));
assign soc_etherbone_record_receiver_fifo_level1 = (soc_etherbone_record_receiver_fifo_level0 + soc_etherbone_record_receiver_fifo_readable);
always @(*) begin
	soc_etherbone_record_receiver_fifo_wrport_adr <= 2'd0;
	if (soc_etherbone_record_receiver_fifo_replace) begin
		soc_etherbone_record_receiver_fifo_wrport_adr <= (soc_etherbone_record_receiver_fifo_produce - 1'd1);
	end else begin
		soc_etherbone_record_receiver_fifo_wrport_adr <= soc_etherbone_record_receiver_fifo_produce;
	end
end
assign soc_etherbone_record_receiver_fifo_wrport_dat_w = soc_etherbone_record_receiver_fifo_syncfifo_din;
assign soc_etherbone_record_receiver_fifo_wrport_we = (soc_etherbone_record_receiver_fifo_syncfifo_we & (soc_etherbone_record_receiver_fifo_syncfifo_writable | soc_etherbone_record_receiver_fifo_replace));
assign soc_etherbone_record_receiver_fifo_do_read = (soc_etherbone_record_receiver_fifo_syncfifo_readable & soc_etherbone_record_receiver_fifo_syncfifo_re);
assign soc_etherbone_record_receiver_fifo_rdport_adr = soc_etherbone_record_receiver_fifo_consume;
assign soc_etherbone_record_receiver_fifo_syncfifo_dout = soc_etherbone_record_receiver_fifo_rdport_dat_r;
assign soc_etherbone_record_receiver_fifo_rdport_re = soc_etherbone_record_receiver_fifo_do_read;
assign soc_etherbone_record_receiver_fifo_syncfifo_writable = (soc_etherbone_record_receiver_fifo_level0 != 3'd4);
assign soc_etherbone_record_receiver_fifo_syncfifo_readable = (soc_etherbone_record_receiver_fifo_level0 != 1'd0);
always @(*) begin
	vns_liteethetherbonerecordreceiver_next_state <= 2'd0;
	soc_etherbone_record_receiver_source_source_param_we <= 1'd0;
	soc_etherbone_record_receiver_source_source_param_count <= 8'd0;
	soc_etherbone_record_receiver_source_source_param_base_addr <= 32'd0;
	soc_etherbone_record_receiver_source_source_param_be <= 4'd0;
	soc_etherbone_record_receiver_fifo_source_ready <= 1'd0;
	soc_etherbone_record_receiver_base_addr_update <= 1'd0;
	soc_etherbone_record_receiver_source_source_valid <= 1'd0;
	soc_etherbone_record_receiver_counter_reset <= 1'd0;
	soc_etherbone_record_receiver_counter_ce <= 1'd0;
	soc_etherbone_record_receiver_source_source_last <= 1'd0;
	soc_etherbone_record_receiver_source_source_payload_addr <= 32'd0;
	soc_etherbone_record_receiver_source_source_payload_data <= 32'd0;
	vns_liteethetherbonerecordreceiver_next_state <= vns_liteethetherbonerecordreceiver_state;
	case (vns_liteethetherbonerecordreceiver_state)
		1'd1: begin
			soc_etherbone_record_receiver_source_source_valid <= soc_etherbone_record_receiver_fifo_source_valid;
			soc_etherbone_record_receiver_source_source_last <= (soc_etherbone_record_receiver_counter == (soc_etherbone_record_receiver_fifo_source_param_wcount - 1'd1));
			soc_etherbone_record_receiver_source_source_param_count <= soc_etherbone_record_receiver_fifo_source_param_wcount;
			soc_etherbone_record_receiver_source_source_param_be <= soc_etherbone_record_receiver_fifo_source_param_byte_enable;
			soc_etherbone_record_receiver_source_source_payload_addr <= (soc_etherbone_record_receiver_base_addr[31:2] + soc_etherbone_record_receiver_counter);
			soc_etherbone_record_receiver_source_source_param_we <= 1'd1;
			soc_etherbone_record_receiver_source_source_payload_data <= soc_etherbone_record_receiver_fifo_source_payload_data;
			soc_etherbone_record_receiver_fifo_source_ready <= soc_etherbone_record_receiver_source_source_ready;
			if ((soc_etherbone_record_receiver_source_source_valid & soc_etherbone_record_receiver_source_source_ready)) begin
				soc_etherbone_record_receiver_counter_ce <= 1'd1;
				if (soc_etherbone_record_receiver_source_source_last) begin
					if (soc_etherbone_record_receiver_fifo_source_param_rcount) begin
						vns_liteethetherbonerecordreceiver_next_state <= 2'd2;
					end else begin
						vns_liteethetherbonerecordreceiver_next_state <= 1'd0;
					end
				end
			end
		end
		2'd2: begin
			soc_etherbone_record_receiver_counter_reset <= 1'd1;
			if (soc_etherbone_record_receiver_fifo_source_valid) begin
				soc_etherbone_record_receiver_base_addr_update <= 1'd1;
				vns_liteethetherbonerecordreceiver_next_state <= 2'd3;
			end
		end
		2'd3: begin
			soc_etherbone_record_receiver_source_source_valid <= soc_etherbone_record_receiver_fifo_source_valid;
			soc_etherbone_record_receiver_source_source_last <= (soc_etherbone_record_receiver_counter == (soc_etherbone_record_receiver_fifo_source_param_rcount - 1'd1));
			soc_etherbone_record_receiver_source_source_param_count <= soc_etherbone_record_receiver_fifo_source_param_rcount;
			soc_etherbone_record_receiver_source_source_param_base_addr <= soc_etherbone_record_receiver_base_addr;
			soc_etherbone_record_receiver_source_source_payload_addr <= soc_etherbone_record_receiver_fifo_source_payload_data[31:2];
			soc_etherbone_record_receiver_fifo_source_ready <= soc_etherbone_record_receiver_source_source_ready;
			if ((soc_etherbone_record_receiver_source_source_valid & soc_etherbone_record_receiver_source_source_ready)) begin
				soc_etherbone_record_receiver_counter_ce <= 1'd1;
				if (soc_etherbone_record_receiver_source_source_last) begin
					vns_liteethetherbonerecordreceiver_next_state <= 1'd0;
				end
			end
		end
		default: begin
			soc_etherbone_record_receiver_fifo_source_ready <= 1'd1;
			soc_etherbone_record_receiver_counter_reset <= 1'd1;
			if (soc_etherbone_record_receiver_fifo_source_valid) begin
				soc_etherbone_record_receiver_base_addr_update <= 1'd1;
				if (soc_etherbone_record_receiver_fifo_source_param_wcount) begin
					vns_liteethetherbonerecordreceiver_next_state <= 1'd1;
				end else begin
					if (soc_etherbone_record_receiver_fifo_source_param_rcount) begin
						vns_liteethetherbonerecordreceiver_next_state <= 2'd3;
					end
				end
			end
		end
	endcase
end
assign soc_etherbone_record_sender_fifo_sink_valid = soc_etherbone_record_sender_sink_sink_valid;
assign soc_etherbone_record_sender_sink_sink_ready = soc_etherbone_record_sender_fifo_sink_ready;
assign soc_etherbone_record_sender_fifo_sink_first = soc_etherbone_record_sender_sink_sink_first;
assign soc_etherbone_record_sender_fifo_sink_last = soc_etherbone_record_sender_sink_sink_last;
assign soc_etherbone_record_sender_fifo_sink_payload_addr = soc_etherbone_record_sender_sink_sink_payload_addr;
assign soc_etherbone_record_sender_fifo_sink_payload_data = soc_etherbone_record_sender_sink_sink_payload_data;
assign soc_etherbone_record_sender_fifo_sink_param_we = soc_etherbone_record_sender_sink_sink_param_we;
assign soc_etherbone_record_sender_fifo_sink_param_count = soc_etherbone_record_sender_sink_sink_param_count;
assign soc_etherbone_record_sender_fifo_sink_param_base_addr = soc_etherbone_record_sender_sink_sink_param_base_addr;
assign soc_etherbone_record_sender_fifo_sink_param_be = soc_etherbone_record_sender_sink_sink_param_be;
assign soc_etherbone_record_sender_fifo_syncfifo_din = {soc_etherbone_record_sender_fifo_fifo_in_last, soc_etherbone_record_sender_fifo_fifo_in_first, soc_etherbone_record_sender_fifo_fifo_in_param_be, soc_etherbone_record_sender_fifo_fifo_in_param_base_addr, soc_etherbone_record_sender_fifo_fifo_in_param_count, soc_etherbone_record_sender_fifo_fifo_in_param_we, soc_etherbone_record_sender_fifo_fifo_in_payload_data, soc_etherbone_record_sender_fifo_fifo_in_payload_addr};
assign {soc_etherbone_record_sender_fifo_fifo_out_last, soc_etherbone_record_sender_fifo_fifo_out_first, soc_etherbone_record_sender_fifo_fifo_out_param_be, soc_etherbone_record_sender_fifo_fifo_out_param_base_addr, soc_etherbone_record_sender_fifo_fifo_out_param_count, soc_etherbone_record_sender_fifo_fifo_out_param_we, soc_etherbone_record_sender_fifo_fifo_out_payload_data, soc_etherbone_record_sender_fifo_fifo_out_payload_addr} = soc_etherbone_record_sender_fifo_syncfifo_dout;
assign soc_etherbone_record_sender_fifo_sink_ready = soc_etherbone_record_sender_fifo_syncfifo_writable;
assign soc_etherbone_record_sender_fifo_syncfifo_we = soc_etherbone_record_sender_fifo_sink_valid;
assign soc_etherbone_record_sender_fifo_fifo_in_first = soc_etherbone_record_sender_fifo_sink_first;
assign soc_etherbone_record_sender_fifo_fifo_in_last = soc_etherbone_record_sender_fifo_sink_last;
assign soc_etherbone_record_sender_fifo_fifo_in_payload_addr = soc_etherbone_record_sender_fifo_sink_payload_addr;
assign soc_etherbone_record_sender_fifo_fifo_in_payload_data = soc_etherbone_record_sender_fifo_sink_payload_data;
assign soc_etherbone_record_sender_fifo_fifo_in_param_we = soc_etherbone_record_sender_fifo_sink_param_we;
assign soc_etherbone_record_sender_fifo_fifo_in_param_count = soc_etherbone_record_sender_fifo_sink_param_count;
assign soc_etherbone_record_sender_fifo_fifo_in_param_base_addr = soc_etherbone_record_sender_fifo_sink_param_base_addr;
assign soc_etherbone_record_sender_fifo_fifo_in_param_be = soc_etherbone_record_sender_fifo_sink_param_be;
assign soc_etherbone_record_sender_fifo_source_valid = soc_etherbone_record_sender_fifo_readable;
assign soc_etherbone_record_sender_fifo_source_first = soc_etherbone_record_sender_fifo_fifo_out_first;
assign soc_etherbone_record_sender_fifo_source_last = soc_etherbone_record_sender_fifo_fifo_out_last;
assign soc_etherbone_record_sender_fifo_source_payload_addr = soc_etherbone_record_sender_fifo_fifo_out_payload_addr;
assign soc_etherbone_record_sender_fifo_source_payload_data = soc_etherbone_record_sender_fifo_fifo_out_payload_data;
assign soc_etherbone_record_sender_fifo_source_param_we = soc_etherbone_record_sender_fifo_fifo_out_param_we;
assign soc_etherbone_record_sender_fifo_source_param_count = soc_etherbone_record_sender_fifo_fifo_out_param_count;
assign soc_etherbone_record_sender_fifo_source_param_base_addr = soc_etherbone_record_sender_fifo_fifo_out_param_base_addr;
assign soc_etherbone_record_sender_fifo_source_param_be = soc_etherbone_record_sender_fifo_fifo_out_param_be;
assign soc_etherbone_record_sender_fifo_re = soc_etherbone_record_sender_fifo_source_ready;
assign soc_etherbone_record_sender_fifo_syncfifo_re = (soc_etherbone_record_sender_fifo_syncfifo_readable & ((~soc_etherbone_record_sender_fifo_readable) | soc_etherbone_record_sender_fifo_re));
assign soc_etherbone_record_sender_fifo_level1 = (soc_etherbone_record_sender_fifo_level0 + soc_etherbone_record_sender_fifo_readable);
always @(*) begin
	soc_etherbone_record_sender_fifo_wrport_adr <= 2'd0;
	if (soc_etherbone_record_sender_fifo_replace) begin
		soc_etherbone_record_sender_fifo_wrport_adr <= (soc_etherbone_record_sender_fifo_produce - 1'd1);
	end else begin
		soc_etherbone_record_sender_fifo_wrport_adr <= soc_etherbone_record_sender_fifo_produce;
	end
end
assign soc_etherbone_record_sender_fifo_wrport_dat_w = soc_etherbone_record_sender_fifo_syncfifo_din;
assign soc_etherbone_record_sender_fifo_wrport_we = (soc_etherbone_record_sender_fifo_syncfifo_we & (soc_etherbone_record_sender_fifo_syncfifo_writable | soc_etherbone_record_sender_fifo_replace));
assign soc_etherbone_record_sender_fifo_do_read = (soc_etherbone_record_sender_fifo_syncfifo_readable & soc_etherbone_record_sender_fifo_syncfifo_re);
assign soc_etherbone_record_sender_fifo_rdport_adr = soc_etherbone_record_sender_fifo_consume;
assign soc_etherbone_record_sender_fifo_syncfifo_dout = soc_etherbone_record_sender_fifo_rdport_dat_r;
assign soc_etherbone_record_sender_fifo_rdport_re = soc_etherbone_record_sender_fifo_do_read;
assign soc_etherbone_record_sender_fifo_syncfifo_writable = (soc_etherbone_record_sender_fifo_level0 != 3'd4);
assign soc_etherbone_record_sender_fifo_syncfifo_readable = (soc_etherbone_record_sender_fifo_level0 != 1'd0);
always @(*) begin
	soc_etherbone_record_sender_fifo_source_ready <= 1'd0;
	soc_etherbone_record_sender_source_source_last <= 1'd0;
	vns_liteethetherbonerecordsender_next_state <= 2'd0;
	soc_etherbone_record_sender_data_sel <= 1'd0;
	soc_etherbone_record_sender_source_source_valid <= 1'd0;
	vns_liteethetherbonerecordsender_next_state <= vns_liteethetherbonerecordsender_state;
	case (vns_liteethetherbonerecordsender_state)
		1'd1: begin
			soc_etherbone_record_sender_source_source_valid <= 1'd1;
			soc_etherbone_record_sender_source_source_last <= 1'd0;
			if (soc_etherbone_record_sender_source_source_ready) begin
				soc_etherbone_record_sender_data_sel <= 1'd1;
				vns_liteethetherbonerecordsender_next_state <= 2'd2;
			end
		end
		2'd2: begin
			soc_etherbone_record_sender_source_source_valid <= 1'd1;
			soc_etherbone_record_sender_source_source_last <= soc_etherbone_record_sender_fifo_source_last;
			soc_etherbone_record_sender_data_sel <= 1'd1;
			if ((soc_etherbone_record_sender_source_source_valid & soc_etherbone_record_sender_source_source_ready)) begin
				soc_etherbone_record_sender_fifo_source_ready <= 1'd1;
				if (soc_etherbone_record_sender_source_source_last) begin
					vns_liteethetherbonerecordsender_next_state <= 1'd0;
				end
			end
		end
		default: begin
			soc_etherbone_record_sender_fifo_source_ready <= 1'd1;
			if (soc_etherbone_record_sender_fifo_source_valid) begin
				soc_etherbone_record_sender_fifo_source_ready <= 1'd0;
				vns_liteethetherbonerecordsender_next_state <= 1'd1;
			end
		end
	endcase
end
always @(*) begin
	soc_etherbone_record_packetizer_header <= 32'd0;
	soc_etherbone_record_packetizer_header[0] <= {soc_etherbone_record_packetizer_sink_param_bca};
	soc_etherbone_record_packetizer_header[15:8] <= {soc_etherbone_record_packetizer_sink_param_byte_enable[7:0]};
	soc_etherbone_record_packetizer_header[4] <= {soc_etherbone_record_packetizer_sink_param_cyc};
	soc_etherbone_record_packetizer_header[1] <= {soc_etherbone_record_packetizer_sink_param_rca};
	soc_etherbone_record_packetizer_header[31:24] <= {soc_etherbone_record_packetizer_sink_param_rcount[7:0]};
	soc_etherbone_record_packetizer_header[2] <= {soc_etherbone_record_packetizer_sink_param_rff};
	soc_etherbone_record_packetizer_header[5] <= {soc_etherbone_record_packetizer_sink_param_wca};
	soc_etherbone_record_packetizer_header[23:16] <= {soc_etherbone_record_packetizer_sink_param_wcount[7:0]};
	soc_etherbone_record_packetizer_header[6] <= {soc_etherbone_record_packetizer_sink_param_wff};
end
assign soc_etherbone_record_packetizer_source_payload_error = soc_etherbone_record_packetizer_sink_payload_error;
always @(*) begin
	vns_liteethetherbonerecordpacketizer_next_state <= 2'd0;
	soc_etherbone_record_packetizer_count_liteethetherbonerecordpacketizer_next_value0 <= 1'd0;
	soc_etherbone_record_packetizer_count_liteethetherbonerecordpacketizer_next_value_ce0 <= 1'd0;
	soc_etherbone_record_packetizer_sr_shift <= 1'd0;
	soc_etherbone_record_packetizer_fsm_from_idle_liteethetherbonerecordpacketizer_next_value1 <= 1'd0;
	soc_etherbone_record_packetizer_source_valid <= 1'd0;
	soc_etherbone_record_packetizer_fsm_from_idle_liteethetherbonerecordpacketizer_next_value_ce1 <= 1'd0;
	soc_etherbone_record_packetizer_sr_load <= 1'd0;
	soc_etherbone_record_packetizer_sink_ready <= 1'd0;
	soc_etherbone_record_packetizer_source_last <= 1'd0;
	soc_etherbone_record_packetizer_source_payload_data <= 32'd0;
	vns_liteethetherbonerecordpacketizer_next_state <= vns_liteethetherbonerecordpacketizer_state;
	case (vns_liteethetherbonerecordpacketizer_state)
		1'd1: begin
			soc_etherbone_record_packetizer_source_valid <= 1'd1;
			soc_etherbone_record_packetizer_source_last <= 1'd0;
			soc_etherbone_record_packetizer_source_payload_data <= soc_etherbone_record_packetizer_sr[31];
			if ((soc_etherbone_record_packetizer_source_valid & soc_etherbone_record_packetizer_source_ready)) begin
				soc_etherbone_record_packetizer_sr_shift <= 1'd1;
				if ((soc_etherbone_record_packetizer_count == 1'd0)) begin
					soc_etherbone_record_packetizer_sr_shift <= 1'd0;
					if (1'd0) begin
						vns_liteethetherbonerecordpacketizer_next_state <= 2'd3;
						soc_etherbone_record_packetizer_count_liteethetherbonerecordpacketizer_next_value0 <= (soc_etherbone_record_packetizer_count + 1'd1);
						soc_etherbone_record_packetizer_count_liteethetherbonerecordpacketizer_next_value_ce0 <= 1'd1;
					end else begin
						vns_liteethetherbonerecordpacketizer_next_state <= 2'd2;
					end
				end else begin
					soc_etherbone_record_packetizer_count_liteethetherbonerecordpacketizer_next_value0 <= (soc_etherbone_record_packetizer_count + 1'd1);
					soc_etherbone_record_packetizer_count_liteethetherbonerecordpacketizer_next_value_ce0 <= 1'd1;
				end
			end
		end
		2'd2: begin
			soc_etherbone_record_packetizer_source_valid <= soc_etherbone_record_packetizer_sink_valid;
			soc_etherbone_record_packetizer_source_last <= soc_etherbone_record_packetizer_sink_last;
			soc_etherbone_record_packetizer_source_payload_data <= soc_etherbone_record_packetizer_sink_payload_data;
			if ((soc_etherbone_record_packetizer_source_valid & soc_etherbone_record_packetizer_source_ready)) begin
				soc_etherbone_record_packetizer_sink_ready <= 1'd1;
				if (soc_etherbone_record_packetizer_source_last) begin
					vns_liteethetherbonerecordpacketizer_next_state <= 1'd0;
				end
			end
		end
		2'd3: begin
			soc_etherbone_record_packetizer_source_valid <= (soc_etherbone_record_packetizer_sink_valid | soc_etherbone_record_packetizer_sink_d_last);
			soc_etherbone_record_packetizer_source_last <= soc_etherbone_record_packetizer_sink_d_last;
			if (soc_etherbone_record_packetizer_fsm_from_idle) begin
				soc_etherbone_record_packetizer_source_payload_data[0] <= soc_etherbone_record_packetizer_sr[31];
			end else begin
				soc_etherbone_record_packetizer_source_payload_data[0] <= soc_etherbone_record_packetizer_sink_d_payload_data[31];
			end
			soc_etherbone_record_packetizer_source_payload_data[31:0] <= soc_etherbone_record_packetizer_sink_payload_data;
			if ((soc_etherbone_record_packetizer_source_valid & soc_etherbone_record_packetizer_source_ready)) begin
				soc_etherbone_record_packetizer_sink_ready <= (~soc_etherbone_record_packetizer_source_last);
				soc_etherbone_record_packetizer_fsm_from_idle_liteethetherbonerecordpacketizer_next_value1 <= 1'd0;
				soc_etherbone_record_packetizer_fsm_from_idle_liteethetherbonerecordpacketizer_next_value_ce1 <= 1'd1;
				if (soc_etherbone_record_packetizer_source_last) begin
					vns_liteethetherbonerecordpacketizer_next_state <= 1'd0;
				end
			end
		end
		default: begin
			soc_etherbone_record_packetizer_sink_ready <= 1'd1;
			soc_etherbone_record_packetizer_count_liteethetherbonerecordpacketizer_next_value0 <= 1'd1;
			soc_etherbone_record_packetizer_count_liteethetherbonerecordpacketizer_next_value_ce0 <= 1'd1;
			if (soc_etherbone_record_packetizer_sink_valid) begin
				soc_etherbone_record_packetizer_sink_ready <= 1'd0;
				soc_etherbone_record_packetizer_source_valid <= 1'd1;
				soc_etherbone_record_packetizer_source_last <= 1'd0;
				soc_etherbone_record_packetizer_source_payload_data <= soc_etherbone_record_packetizer_header[31:0];
				if ((soc_etherbone_record_packetizer_source_valid & soc_etherbone_record_packetizer_source_ready)) begin
					soc_etherbone_record_packetizer_sr_load <= 1'd1;
					soc_etherbone_record_packetizer_fsm_from_idle_liteethetherbonerecordpacketizer_next_value1 <= 1'd1;
					soc_etherbone_record_packetizer_fsm_from_idle_liteethetherbonerecordpacketizer_next_value_ce1 <= 1'd1;
					if (1'd1) begin
						if (1'd0) begin
							vns_liteethetherbonerecordpacketizer_next_state <= 2'd3;
						end else begin
							vns_liteethetherbonerecordpacketizer_next_state <= 2'd2;
						end
					end else begin
						vns_liteethetherbonerecordpacketizer_next_state <= 1'd1;
					end
				end
			end
		end
	endcase
end
always @(*) begin
	soc_etherbone_dispatcher_sel1 <= 1'd0;
	if (soc_etherbone_dispatcher_first) begin
		soc_etherbone_dispatcher_sel1 <= soc_etherbone_dispatcher_sel0;
	end else begin
		soc_etherbone_dispatcher_sel1 <= soc_etherbone_dispatcher_sel_ongoing;
	end
end
always @(*) begin
	soc_etherbone_probe_sink_param_length <= 16'd0;
	soc_etherbone_probe_sink_param_dst_port <= 16'd0;
	soc_etherbone_probe_sink_param_ip_address <= 32'd0;
	soc_etherbone_probe_sink_valid <= 1'd0;
	soc_etherbone_record_sink_sink_valid <= 1'd0;
	soc_etherbone_probe_sink_first <= 1'd0;
	soc_etherbone_record_sink_sink_first <= 1'd0;
	soc_etherbone_probe_sink_last <= 1'd0;
	soc_etherbone_record_sink_sink_last <= 1'd0;
	soc_etherbone_probe_sink_payload_data <= 32'd0;
	soc_etherbone_record_sink_sink_payload_data <= 32'd0;
	soc_etherbone_probe_sink_payload_error <= 4'd0;
	soc_etherbone_record_sink_sink_payload_error <= 4'd0;
	soc_etherbone_probe_sink_param_addr_size <= 4'd0;
	soc_etherbone_record_sink_sink_param_addr_size <= 4'd0;
	soc_etherbone_probe_sink_param_nr <= 1'd0;
	soc_etherbone_record_sink_sink_param_nr <= 1'd0;
	soc_etherbone_probe_sink_param_pf <= 1'd0;
	soc_etherbone_record_sink_sink_param_pf <= 1'd0;
	soc_etherbone_probe_sink_param_port_size <= 4'd0;
	soc_etherbone_record_sink_sink_param_port_size <= 4'd0;
	soc_etherbone_probe_sink_param_pr <= 1'd0;
	soc_etherbone_record_sink_sink_param_pr <= 1'd0;
	soc_etherbone_rx_source_source_ready <= 1'd0;
	soc_etherbone_record_sink_sink_param_src_port <= 16'd0;
	soc_etherbone_probe_sink_param_src_port <= 16'd0;
	soc_etherbone_record_sink_sink_param_dst_port <= 16'd0;
	soc_etherbone_record_sink_sink_param_ip_address <= 32'd0;
	soc_etherbone_record_sink_sink_param_length <= 16'd0;
	case (soc_etherbone_dispatcher_sel1)
		1'd0: begin
			soc_etherbone_probe_sink_valid <= soc_etherbone_rx_source_source_valid;
			soc_etherbone_rx_source_source_ready <= soc_etherbone_probe_sink_ready;
			soc_etherbone_probe_sink_first <= soc_etherbone_rx_source_source_first;
			soc_etherbone_probe_sink_last <= soc_etherbone_rx_source_source_last;
			soc_etherbone_probe_sink_payload_data <= soc_etherbone_rx_source_source_payload_data;
			soc_etherbone_probe_sink_payload_error <= soc_etherbone_rx_source_source_payload_error;
			soc_etherbone_probe_sink_param_addr_size <= soc_etherbone_rx_source_source_param_addr_size;
			soc_etherbone_probe_sink_param_nr <= soc_etherbone_rx_source_source_param_nr;
			soc_etherbone_probe_sink_param_pf <= soc_etherbone_rx_source_source_param_pf;
			soc_etherbone_probe_sink_param_port_size <= soc_etherbone_rx_source_source_param_port_size;
			soc_etherbone_probe_sink_param_pr <= soc_etherbone_rx_source_source_param_pr;
			soc_etherbone_probe_sink_param_src_port <= soc_etherbone_rx_source_source_param_src_port;
			soc_etherbone_probe_sink_param_dst_port <= soc_etherbone_rx_source_source_param_dst_port;
			soc_etherbone_probe_sink_param_ip_address <= soc_etherbone_rx_source_source_param_ip_address;
			soc_etherbone_probe_sink_param_length <= soc_etherbone_rx_source_source_param_length;
		end
		1'd1: begin
			soc_etherbone_record_sink_sink_valid <= soc_etherbone_rx_source_source_valid;
			soc_etherbone_rx_source_source_ready <= soc_etherbone_record_sink_sink_ready;
			soc_etherbone_record_sink_sink_first <= soc_etherbone_rx_source_source_first;
			soc_etherbone_record_sink_sink_last <= soc_etherbone_rx_source_source_last;
			soc_etherbone_record_sink_sink_payload_data <= soc_etherbone_rx_source_source_payload_data;
			soc_etherbone_record_sink_sink_payload_error <= soc_etherbone_rx_source_source_payload_error;
			soc_etherbone_record_sink_sink_param_addr_size <= soc_etherbone_rx_source_source_param_addr_size;
			soc_etherbone_record_sink_sink_param_nr <= soc_etherbone_rx_source_source_param_nr;
			soc_etherbone_record_sink_sink_param_pf <= soc_etherbone_rx_source_source_param_pf;
			soc_etherbone_record_sink_sink_param_port_size <= soc_etherbone_rx_source_source_param_port_size;
			soc_etherbone_record_sink_sink_param_pr <= soc_etherbone_rx_source_source_param_pr;
			soc_etherbone_record_sink_sink_param_src_port <= soc_etherbone_rx_source_source_param_src_port;
			soc_etherbone_record_sink_sink_param_dst_port <= soc_etherbone_rx_source_source_param_dst_port;
			soc_etherbone_record_sink_sink_param_ip_address <= soc_etherbone_rx_source_source_param_ip_address;
			soc_etherbone_record_sink_sink_param_length <= soc_etherbone_rx_source_source_param_length;
		end
		default: begin
			soc_etherbone_rx_source_source_ready <= 1'd1;
		end
	endcase
end
always @(*) begin
	soc_etherbone_dispatcher_last <= 1'd0;
	if (soc_etherbone_rx_source_source_valid) begin
		soc_etherbone_dispatcher_last <= (soc_etherbone_rx_source_source_last & soc_etherbone_rx_source_source_ready);
	end
end
assign soc_etherbone_dispatcher_ongoing0 = ((soc_etherbone_rx_source_source_valid | soc_etherbone_dispatcher_ongoing1) & (~soc_etherbone_dispatcher_last));
always @(*) begin
	soc_etherbone_request <= 2'd0;
	soc_etherbone_request[0] <= soc_etherbone_status0_ongoing0;
	soc_etherbone_request[1] <= soc_etherbone_status1_ongoing0;
end
always @(*) begin
	soc_etherbone_probe_source_ready <= 1'd0;
	soc_etherbone_record_source_source_ready <= 1'd0;
	soc_etherbone_tx_sink_sink_valid <= 1'd0;
	soc_etherbone_tx_sink_sink_first <= 1'd0;
	soc_etherbone_tx_sink_sink_last <= 1'd0;
	soc_etherbone_tx_sink_sink_payload_data <= 32'd0;
	soc_etherbone_tx_sink_sink_payload_error <= 4'd0;
	soc_etherbone_tx_sink_sink_param_addr_size <= 4'd0;
	soc_etherbone_tx_sink_sink_param_nr <= 1'd0;
	soc_etherbone_tx_sink_sink_param_pf <= 1'd0;
	soc_etherbone_tx_sink_sink_param_port_size <= 4'd0;
	soc_etherbone_tx_sink_sink_param_pr <= 1'd0;
	soc_etherbone_tx_sink_sink_param_src_port <= 16'd0;
	soc_etherbone_tx_sink_sink_param_dst_port <= 16'd0;
	soc_etherbone_tx_sink_sink_param_ip_address <= 32'd0;
	soc_etherbone_tx_sink_sink_param_length <= 16'd0;
	case (soc_etherbone_grant)
		1'd0: begin
			soc_etherbone_tx_sink_sink_valid <= soc_etherbone_probe_source_valid;
			soc_etherbone_probe_source_ready <= soc_etherbone_tx_sink_sink_ready;
			soc_etherbone_tx_sink_sink_first <= soc_etherbone_probe_source_first;
			soc_etherbone_tx_sink_sink_last <= soc_etherbone_probe_source_last;
			soc_etherbone_tx_sink_sink_payload_data <= soc_etherbone_probe_source_payload_data;
			soc_etherbone_tx_sink_sink_payload_error <= soc_etherbone_probe_source_payload_error;
			soc_etherbone_tx_sink_sink_param_addr_size <= soc_etherbone_probe_source_param_addr_size;
			soc_etherbone_tx_sink_sink_param_nr <= soc_etherbone_probe_source_param_nr;
			soc_etherbone_tx_sink_sink_param_pf <= soc_etherbone_probe_source_param_pf;
			soc_etherbone_tx_sink_sink_param_port_size <= soc_etherbone_probe_source_param_port_size;
			soc_etherbone_tx_sink_sink_param_pr <= soc_etherbone_probe_source_param_pr;
			soc_etherbone_tx_sink_sink_param_src_port <= soc_etherbone_probe_source_param_src_port;
			soc_etherbone_tx_sink_sink_param_dst_port <= soc_etherbone_probe_source_param_dst_port;
			soc_etherbone_tx_sink_sink_param_ip_address <= soc_etherbone_probe_source_param_ip_address;
			soc_etherbone_tx_sink_sink_param_length <= soc_etherbone_probe_source_param_length;
		end
		1'd1: begin
			soc_etherbone_tx_sink_sink_valid <= soc_etherbone_record_source_source_valid;
			soc_etherbone_record_source_source_ready <= soc_etherbone_tx_sink_sink_ready;
			soc_etherbone_tx_sink_sink_first <= soc_etherbone_record_source_source_first;
			soc_etherbone_tx_sink_sink_last <= soc_etherbone_record_source_source_last;
			soc_etherbone_tx_sink_sink_payload_data <= soc_etherbone_record_source_source_payload_data;
			soc_etherbone_tx_sink_sink_payload_error <= soc_etherbone_record_source_source_payload_error;
			soc_etherbone_tx_sink_sink_param_addr_size <= soc_etherbone_record_source_source_param_addr_size;
			soc_etherbone_tx_sink_sink_param_nr <= soc_etherbone_record_source_source_param_nr;
			soc_etherbone_tx_sink_sink_param_pf <= soc_etherbone_record_source_source_param_pf;
			soc_etherbone_tx_sink_sink_param_port_size <= soc_etherbone_record_source_source_param_port_size;
			soc_etherbone_tx_sink_sink_param_pr <= soc_etherbone_record_source_source_param_pr;
			soc_etherbone_tx_sink_sink_param_src_port <= soc_etherbone_record_source_source_param_src_port;
			soc_etherbone_tx_sink_sink_param_dst_port <= soc_etherbone_record_source_source_param_dst_port;
			soc_etherbone_tx_sink_sink_param_ip_address <= soc_etherbone_record_source_source_param_ip_address;
			soc_etherbone_tx_sink_sink_param_length <= soc_etherbone_record_source_source_param_length;
		end
	endcase
end
always @(*) begin
	soc_etherbone_status0_last <= 1'd0;
	if (soc_etherbone_probe_source_valid) begin
		soc_etherbone_status0_last <= (soc_etherbone_probe_source_last & soc_etherbone_probe_source_ready);
	end
end
assign soc_etherbone_status0_ongoing0 = ((soc_etherbone_probe_source_valid | soc_etherbone_status0_ongoing1) & (~soc_etherbone_status0_last));
always @(*) begin
	soc_etherbone_status1_last <= 1'd0;
	if (soc_etherbone_record_source_source_valid) begin
		soc_etherbone_status1_last <= (soc_etherbone_record_source_source_last & soc_etherbone_record_source_source_ready);
	end
end
assign soc_etherbone_status1_ongoing0 = ((soc_etherbone_record_source_source_valid | soc_etherbone_status1_ongoing1) & (~soc_etherbone_status1_last));
always @(*) begin
	soc_etherbone_wishbone_sink_ready <= 1'd0;
	soc_etherbone_wishbone_bus_adr <= 30'd0;
	soc_etherbone_wishbone_bus_dat_w <= 32'd0;
	soc_etherbone_wishbone_bus_sel <= 4'd0;
	soc_etherbone_wishbone_bus_cyc <= 1'd0;
	soc_etherbone_wishbone_bus_stb <= 1'd0;
	soc_etherbone_wishbone_source_valid <= 1'd0;
	soc_etherbone_wishbone_bus_we <= 1'd0;
	vns_liteethetherbonewishbonemaster_next_state <= 2'd0;
	soc_etherbone_wishbone_source_last <= 1'd0;
	soc_etherbone_wishbone_data_update <= 1'd0;
	vns_liteethetherbonewishbonemaster_next_state <= vns_liteethetherbonewishbonemaster_state;
	case (vns_liteethetherbonewishbonemaster_state)
		1'd1: begin
			soc_etherbone_wishbone_bus_adr <= soc_etherbone_wishbone_sink_payload_addr;
			soc_etherbone_wishbone_bus_dat_w <= soc_etherbone_wishbone_sink_payload_data;
			soc_etherbone_wishbone_bus_sel <= soc_etherbone_wishbone_sink_param_be;
			soc_etherbone_wishbone_bus_stb <= soc_etherbone_wishbone_sink_valid;
			soc_etherbone_wishbone_bus_we <= 1'd1;
			soc_etherbone_wishbone_bus_cyc <= 1'd1;
			if ((soc_etherbone_wishbone_bus_stb & soc_etherbone_wishbone_bus_ack)) begin
				soc_etherbone_wishbone_sink_ready <= 1'd1;
				if (soc_etherbone_wishbone_sink_last) begin
					vns_liteethetherbonewishbonemaster_next_state <= 1'd0;
				end
			end
		end
		2'd2: begin
			soc_etherbone_wishbone_bus_adr <= soc_etherbone_wishbone_sink_payload_addr;
			soc_etherbone_wishbone_bus_sel <= soc_etherbone_wishbone_sink_param_be;
			soc_etherbone_wishbone_bus_stb <= soc_etherbone_wishbone_sink_valid;
			soc_etherbone_wishbone_bus_cyc <= 1'd1;
			if ((soc_etherbone_wishbone_bus_stb & soc_etherbone_wishbone_bus_ack)) begin
				soc_etherbone_wishbone_data_update <= 1'd1;
				vns_liteethetherbonewishbonemaster_next_state <= 2'd3;
			end
		end
		2'd3: begin
			soc_etherbone_wishbone_source_valid <= soc_etherbone_wishbone_sink_valid;
			soc_etherbone_wishbone_source_last <= soc_etherbone_wishbone_sink_last;
			if ((soc_etherbone_wishbone_source_valid & soc_etherbone_wishbone_source_ready)) begin
				soc_etherbone_wishbone_sink_ready <= 1'd1;
				if (soc_etherbone_wishbone_source_last) begin
					vns_liteethetherbonewishbonemaster_next_state <= 1'd0;
				end else begin
					vns_liteethetherbonewishbonemaster_next_state <= 2'd2;
				end
			end
		end
		default: begin
			soc_etherbone_wishbone_sink_ready <= 1'd1;
			if (soc_etherbone_wishbone_sink_valid) begin
				soc_etherbone_wishbone_sink_ready <= 1'd0;
				if (soc_etherbone_wishbone_sink_param_we) begin
					vns_liteethetherbonewishbonemaster_next_state <= 1'd1;
				end else begin
					vns_liteethetherbonewishbonemaster_next_state <= 2'd2;
				end
			end
		end
	endcase
end
assign vns_shared_adr = vns_array_muxed0;
assign vns_shared_dat_w = vns_array_muxed1;
assign vns_shared_sel = vns_array_muxed2;
assign vns_shared_cyc = vns_array_muxed3;
assign vns_shared_stb = vns_array_muxed4;
assign vns_shared_we = vns_array_muxed5;
assign vns_shared_cti = vns_array_muxed6;
assign vns_shared_bte = vns_array_muxed7;
assign soc_uart_bridge_wishbone_dat_r = vns_shared_dat_r;
assign soc_etherbone_wishbone_bus_dat_r = vns_shared_dat_r;
assign soc_uart_bridge_wishbone_ack = (vns_shared_ack & (vns_grant == 1'd0));
assign soc_etherbone_wishbone_bus_ack = (vns_shared_ack & (vns_grant == 1'd1));
assign soc_uart_bridge_wishbone_err = (vns_shared_err & (vns_grant == 1'd0));
assign soc_etherbone_wishbone_bus_err = (vns_shared_err & (vns_grant == 1'd1));
assign vns_request = {soc_etherbone_wishbone_bus_cyc, soc_uart_bridge_wishbone_cyc};
assign vns_slave_sel = (vns_shared_adr[29:14] == 16'd33280);
assign soc_usbsoc_bus_wishbone_adr = vns_shared_adr;
assign soc_usbsoc_bus_wishbone_dat_w = vns_shared_dat_w;
assign soc_usbsoc_bus_wishbone_sel = vns_shared_sel;
assign soc_usbsoc_bus_wishbone_stb = vns_shared_stb;
assign soc_usbsoc_bus_wishbone_we = vns_shared_we;
assign soc_usbsoc_bus_wishbone_cti = vns_shared_cti;
assign soc_usbsoc_bus_wishbone_bte = vns_shared_bte;
assign soc_usbsoc_bus_wishbone_cyc = (vns_shared_cyc & vns_slave_sel);
assign vns_shared_err = soc_usbsoc_bus_wishbone_err;
assign vns_wait = ((vns_shared_stb & vns_shared_cyc) & (~vns_shared_ack));
always @(*) begin
	vns_error <= 1'd0;
	vns_shared_dat_r <= 32'd0;
	vns_shared_ack <= 1'd0;
	vns_shared_ack <= soc_usbsoc_bus_wishbone_ack;
	vns_shared_dat_r <= ({32{vns_slave_sel_r}} & soc_usbsoc_bus_wishbone_dat_r);
	if (vns_done) begin
		vns_shared_dat_r <= 32'd4294967295;
		vns_shared_ack <= 1'd1;
		vns_error <= 1'd1;
	end
end
assign vns_done = (vns_count == 1'd0);
assign vns_csr_bankarray_csrbank0_sel = (vns_csr_bankarray_interface0_bank_bus_adr[13:9] == 1'd0);
assign vns_csr_bankarray_csrbank0_reset0_r = vns_csr_bankarray_interface0_bank_bus_dat_w[0];
assign vns_csr_bankarray_csrbank0_reset0_re = ((vns_csr_bankarray_csrbank0_sel & vns_csr_bankarray_interface0_bank_bus_we) & (vns_csr_bankarray_interface0_bank_bus_adr[3:0] == 1'd0));
assign vns_csr_bankarray_csrbank0_reset0_we = ((vns_csr_bankarray_csrbank0_sel & (~vns_csr_bankarray_interface0_bank_bus_we)) & (vns_csr_bankarray_interface0_bank_bus_adr[3:0] == 1'd0));
assign vns_csr_bankarray_csrbank0_scratch3_r = vns_csr_bankarray_interface0_bank_bus_dat_w[7:0];
assign vns_csr_bankarray_csrbank0_scratch3_re = ((vns_csr_bankarray_csrbank0_sel & vns_csr_bankarray_interface0_bank_bus_we) & (vns_csr_bankarray_interface0_bank_bus_adr[3:0] == 1'd1));
assign vns_csr_bankarray_csrbank0_scratch3_we = ((vns_csr_bankarray_csrbank0_sel & (~vns_csr_bankarray_interface0_bank_bus_we)) & (vns_csr_bankarray_interface0_bank_bus_adr[3:0] == 1'd1));
assign vns_csr_bankarray_csrbank0_scratch2_r = vns_csr_bankarray_interface0_bank_bus_dat_w[7:0];
assign vns_csr_bankarray_csrbank0_scratch2_re = ((vns_csr_bankarray_csrbank0_sel & vns_csr_bankarray_interface0_bank_bus_we) & (vns_csr_bankarray_interface0_bank_bus_adr[3:0] == 2'd2));
assign vns_csr_bankarray_csrbank0_scratch2_we = ((vns_csr_bankarray_csrbank0_sel & (~vns_csr_bankarray_interface0_bank_bus_we)) & (vns_csr_bankarray_interface0_bank_bus_adr[3:0] == 2'd2));
assign vns_csr_bankarray_csrbank0_scratch1_r = vns_csr_bankarray_interface0_bank_bus_dat_w[7:0];
assign vns_csr_bankarray_csrbank0_scratch1_re = ((vns_csr_bankarray_csrbank0_sel & vns_csr_bankarray_interface0_bank_bus_we) & (vns_csr_bankarray_interface0_bank_bus_adr[3:0] == 2'd3));
assign vns_csr_bankarray_csrbank0_scratch1_we = ((vns_csr_bankarray_csrbank0_sel & (~vns_csr_bankarray_interface0_bank_bus_we)) & (vns_csr_bankarray_interface0_bank_bus_adr[3:0] == 2'd3));
assign vns_csr_bankarray_csrbank0_scratch0_r = vns_csr_bankarray_interface0_bank_bus_dat_w[7:0];
assign vns_csr_bankarray_csrbank0_scratch0_re = ((vns_csr_bankarray_csrbank0_sel & vns_csr_bankarray_interface0_bank_bus_we) & (vns_csr_bankarray_interface0_bank_bus_adr[3:0] == 3'd4));
assign vns_csr_bankarray_csrbank0_scratch0_we = ((vns_csr_bankarray_csrbank0_sel & (~vns_csr_bankarray_interface0_bank_bus_we)) & (vns_csr_bankarray_interface0_bank_bus_adr[3:0] == 3'd4));
assign vns_csr_bankarray_csrbank0_bus_errors3_r = vns_csr_bankarray_interface0_bank_bus_dat_w[7:0];
assign vns_csr_bankarray_csrbank0_bus_errors3_re = ((vns_csr_bankarray_csrbank0_sel & vns_csr_bankarray_interface0_bank_bus_we) & (vns_csr_bankarray_interface0_bank_bus_adr[3:0] == 3'd5));
assign vns_csr_bankarray_csrbank0_bus_errors3_we = ((vns_csr_bankarray_csrbank0_sel & (~vns_csr_bankarray_interface0_bank_bus_we)) & (vns_csr_bankarray_interface0_bank_bus_adr[3:0] == 3'd5));
assign vns_csr_bankarray_csrbank0_bus_errors2_r = vns_csr_bankarray_interface0_bank_bus_dat_w[7:0];
assign vns_csr_bankarray_csrbank0_bus_errors2_re = ((vns_csr_bankarray_csrbank0_sel & vns_csr_bankarray_interface0_bank_bus_we) & (vns_csr_bankarray_interface0_bank_bus_adr[3:0] == 3'd6));
assign vns_csr_bankarray_csrbank0_bus_errors2_we = ((vns_csr_bankarray_csrbank0_sel & (~vns_csr_bankarray_interface0_bank_bus_we)) & (vns_csr_bankarray_interface0_bank_bus_adr[3:0] == 3'd6));
assign vns_csr_bankarray_csrbank0_bus_errors1_r = vns_csr_bankarray_interface0_bank_bus_dat_w[7:0];
assign vns_csr_bankarray_csrbank0_bus_errors1_re = ((vns_csr_bankarray_csrbank0_sel & vns_csr_bankarray_interface0_bank_bus_we) & (vns_csr_bankarray_interface0_bank_bus_adr[3:0] == 3'd7));
assign vns_csr_bankarray_csrbank0_bus_errors1_we = ((vns_csr_bankarray_csrbank0_sel & (~vns_csr_bankarray_interface0_bank_bus_we)) & (vns_csr_bankarray_interface0_bank_bus_adr[3:0] == 3'd7));
assign vns_csr_bankarray_csrbank0_bus_errors0_r = vns_csr_bankarray_interface0_bank_bus_dat_w[7:0];
assign vns_csr_bankarray_csrbank0_bus_errors0_re = ((vns_csr_bankarray_csrbank0_sel & vns_csr_bankarray_interface0_bank_bus_we) & (vns_csr_bankarray_interface0_bank_bus_adr[3:0] == 4'd8));
assign vns_csr_bankarray_csrbank0_bus_errors0_we = ((vns_csr_bankarray_csrbank0_sel & (~vns_csr_bankarray_interface0_bank_bus_we)) & (vns_csr_bankarray_interface0_bank_bus_adr[3:0] == 4'd8));
assign vns_csr_bankarray_csrbank0_reset0_w = soc_usbsoc_reset_storage;
assign vns_csr_bankarray_csrbank0_scratch3_w = soc_usbsoc_scratch_storage[31:24];
assign vns_csr_bankarray_csrbank0_scratch2_w = soc_usbsoc_scratch_storage[23:16];
assign vns_csr_bankarray_csrbank0_scratch1_w = soc_usbsoc_scratch_storage[15:8];
assign vns_csr_bankarray_csrbank0_scratch0_w = soc_usbsoc_scratch_storage[7:0];
assign vns_csr_bankarray_csrbank0_bus_errors3_w = soc_usbsoc_bus_errors_status[31:24];
assign vns_csr_bankarray_csrbank0_bus_errors2_w = soc_usbsoc_bus_errors_status[23:16];
assign vns_csr_bankarray_csrbank0_bus_errors1_w = soc_usbsoc_bus_errors_status[15:8];
assign vns_csr_bankarray_csrbank0_bus_errors0_w = soc_usbsoc_bus_errors_status[7:0];
assign soc_usbsoc_bus_errors_we = vns_csr_bankarray_csrbank0_bus_errors0_we;
assign vns_csr_bankarray_csrbank1_sel = (vns_csr_bankarray_interface1_bank_bus_adr[13:9] == 4'd11);
assign vns_csr_bankarray_csrbank1_crg_reset0_r = vns_csr_bankarray_interface1_bank_bus_dat_w[0];
assign vns_csr_bankarray_csrbank1_crg_reset0_re = ((vns_csr_bankarray_csrbank1_sel & vns_csr_bankarray_interface1_bank_bus_we) & (vns_csr_bankarray_interface1_bank_bus_adr[1:0] == 1'd0));
assign vns_csr_bankarray_csrbank1_crg_reset0_we = ((vns_csr_bankarray_csrbank1_sel & (~vns_csr_bankarray_interface1_bank_bus_we)) & (vns_csr_bankarray_interface1_bank_bus_adr[1:0] == 1'd0));
assign vns_csr_bankarray_csrbank1_mdio_w0_r = vns_csr_bankarray_interface1_bank_bus_dat_w[2:0];
assign vns_csr_bankarray_csrbank1_mdio_w0_re = ((vns_csr_bankarray_csrbank1_sel & vns_csr_bankarray_interface1_bank_bus_we) & (vns_csr_bankarray_interface1_bank_bus_adr[1:0] == 1'd1));
assign vns_csr_bankarray_csrbank1_mdio_w0_we = ((vns_csr_bankarray_csrbank1_sel & (~vns_csr_bankarray_interface1_bank_bus_we)) & (vns_csr_bankarray_interface1_bank_bus_adr[1:0] == 1'd1));
assign vns_csr_bankarray_csrbank1_mdio_r_r = vns_csr_bankarray_interface1_bank_bus_dat_w[0];
assign vns_csr_bankarray_csrbank1_mdio_r_re = ((vns_csr_bankarray_csrbank1_sel & vns_csr_bankarray_interface1_bank_bus_we) & (vns_csr_bankarray_interface1_bank_bus_adr[1:0] == 2'd2));
assign vns_csr_bankarray_csrbank1_mdio_r_we = ((vns_csr_bankarray_csrbank1_sel & (~vns_csr_bankarray_interface1_bank_bus_we)) & (vns_csr_bankarray_interface1_bank_bus_adr[1:0] == 2'd2));
assign vns_csr_bankarray_csrbank1_crg_reset0_w = soc_eth_phy_reset_storage;
assign soc_eth_phy_mdc = soc_eth_phy_storage[0];
assign soc_eth_phy_oe = soc_eth_phy_storage[1];
assign soc_eth_phy_w = soc_eth_phy_storage[2];
assign vns_csr_bankarray_csrbank1_mdio_w0_w = soc_eth_phy_storage[2:0];
assign vns_csr_bankarray_csrbank1_mdio_r_w = soc_eth_phy_status;
assign soc_eth_phy_we = vns_csr_bankarray_csrbank1_mdio_r_we;
assign vns_csr_bankarray_sel = (vns_csr_bankarray_sram_bus_adr[13:9] == 1'd1);
always @(*) begin
	vns_csr_bankarray_sram_bus_dat_r <= 8'd0;
	if (vns_csr_bankarray_sel_r) begin
		vns_csr_bankarray_sram_bus_dat_r <= vns_csr_bankarray_dat_r;
	end
end
assign vns_csr_bankarray_adr = vns_csr_bankarray_sram_bus_adr[5:0];
assign vns_csr_bankarray_csrbank2_sel = (vns_csr_bankarray_interface2_bank_bus_adr[13:9] == 2'd2);
assign vns_csr_bankarray_csrbank2_phy_enable0_r = vns_csr_bankarray_interface2_bank_bus_dat_w[0];
assign vns_csr_bankarray_csrbank2_phy_enable0_re = ((vns_csr_bankarray_csrbank2_sel & vns_csr_bankarray_interface2_bank_bus_we) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 1'd0));
assign vns_csr_bankarray_csrbank2_phy_enable0_we = ((vns_csr_bankarray_csrbank2_sel & (~vns_csr_bankarray_interface2_bank_bus_we)) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 1'd0));
assign vns_csr_bankarray_csrbank2_core_enable0_r = vns_csr_bankarray_interface2_bank_bus_dat_w[0];
assign vns_csr_bankarray_csrbank2_core_enable0_re = ((vns_csr_bankarray_csrbank2_sel & vns_csr_bankarray_interface2_bank_bus_we) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 1'd1));
assign vns_csr_bankarray_csrbank2_core_enable0_we = ((vns_csr_bankarray_csrbank2_sel & (~vns_csr_bankarray_interface2_bank_bus_we)) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 1'd1));
assign vns_csr_bankarray_csrbank2_buf_in_addr1_r = vns_csr_bankarray_interface2_bank_bus_dat_w[0];
assign vns_csr_bankarray_csrbank2_buf_in_addr1_re = ((vns_csr_bankarray_csrbank2_sel & vns_csr_bankarray_interface2_bank_bus_we) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 2'd2));
assign vns_csr_bankarray_csrbank2_buf_in_addr1_we = ((vns_csr_bankarray_csrbank2_sel & (~vns_csr_bankarray_interface2_bank_bus_we)) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 2'd2));
assign vns_csr_bankarray_csrbank2_buf_in_addr0_r = vns_csr_bankarray_interface2_bank_bus_dat_w[7:0];
assign vns_csr_bankarray_csrbank2_buf_in_addr0_re = ((vns_csr_bankarray_csrbank2_sel & vns_csr_bankarray_interface2_bank_bus_we) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 2'd3));
assign vns_csr_bankarray_csrbank2_buf_in_addr0_we = ((vns_csr_bankarray_csrbank2_sel & (~vns_csr_bankarray_interface2_bank_bus_we)) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 2'd3));
assign vns_csr_bankarray_csrbank2_buf_in_data3_r = vns_csr_bankarray_interface2_bank_bus_dat_w[7:0];
assign vns_csr_bankarray_csrbank2_buf_in_data3_re = ((vns_csr_bankarray_csrbank2_sel & vns_csr_bankarray_interface2_bank_bus_we) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 3'd4));
assign vns_csr_bankarray_csrbank2_buf_in_data3_we = ((vns_csr_bankarray_csrbank2_sel & (~vns_csr_bankarray_interface2_bank_bus_we)) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 3'd4));
assign vns_csr_bankarray_csrbank2_buf_in_data2_r = vns_csr_bankarray_interface2_bank_bus_dat_w[7:0];
assign vns_csr_bankarray_csrbank2_buf_in_data2_re = ((vns_csr_bankarray_csrbank2_sel & vns_csr_bankarray_interface2_bank_bus_we) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 3'd5));
assign vns_csr_bankarray_csrbank2_buf_in_data2_we = ((vns_csr_bankarray_csrbank2_sel & (~vns_csr_bankarray_interface2_bank_bus_we)) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 3'd5));
assign vns_csr_bankarray_csrbank2_buf_in_data1_r = vns_csr_bankarray_interface2_bank_bus_dat_w[7:0];
assign vns_csr_bankarray_csrbank2_buf_in_data1_re = ((vns_csr_bankarray_csrbank2_sel & vns_csr_bankarray_interface2_bank_bus_we) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 3'd6));
assign vns_csr_bankarray_csrbank2_buf_in_data1_we = ((vns_csr_bankarray_csrbank2_sel & (~vns_csr_bankarray_interface2_bank_bus_we)) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 3'd6));
assign vns_csr_bankarray_csrbank2_buf_in_data0_r = vns_csr_bankarray_interface2_bank_bus_dat_w[7:0];
assign vns_csr_bankarray_csrbank2_buf_in_data0_re = ((vns_csr_bankarray_csrbank2_sel & vns_csr_bankarray_interface2_bank_bus_we) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 3'd7));
assign vns_csr_bankarray_csrbank2_buf_in_data0_we = ((vns_csr_bankarray_csrbank2_sel & (~vns_csr_bankarray_interface2_bank_bus_we)) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 3'd7));
assign soc_buf_in_wren_r = vns_csr_bankarray_interface2_bank_bus_dat_w[0];
assign soc_buf_in_wren_re = ((vns_csr_bankarray_csrbank2_sel & vns_csr_bankarray_interface2_bank_bus_we) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 4'd8));
assign soc_buf_in_wren_we = ((vns_csr_bankarray_csrbank2_sel & (~vns_csr_bankarray_interface2_bank_bus_we)) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 4'd8));
assign vns_csr_bankarray_csrbank2_buf_in_request_r = vns_csr_bankarray_interface2_bank_bus_dat_w[0];
assign vns_csr_bankarray_csrbank2_buf_in_request_re = ((vns_csr_bankarray_csrbank2_sel & vns_csr_bankarray_interface2_bank_bus_we) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 4'd9));
assign vns_csr_bankarray_csrbank2_buf_in_request_we = ((vns_csr_bankarray_csrbank2_sel & (~vns_csr_bankarray_interface2_bank_bus_we)) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 4'd9));
assign vns_csr_bankarray_csrbank2_buf_in_ready_r = vns_csr_bankarray_interface2_bank_bus_dat_w[0];
assign vns_csr_bankarray_csrbank2_buf_in_ready_re = ((vns_csr_bankarray_csrbank2_sel & vns_csr_bankarray_interface2_bank_bus_we) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 4'd10));
assign vns_csr_bankarray_csrbank2_buf_in_ready_we = ((vns_csr_bankarray_csrbank2_sel & (~vns_csr_bankarray_interface2_bank_bus_we)) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 4'd10));
assign soc_buf_in_commit_r = vns_csr_bankarray_interface2_bank_bus_dat_w[0];
assign soc_buf_in_commit_re = ((vns_csr_bankarray_csrbank2_sel & vns_csr_bankarray_interface2_bank_bus_we) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 4'd11));
assign soc_buf_in_commit_we = ((vns_csr_bankarray_csrbank2_sel & (~vns_csr_bankarray_interface2_bank_bus_we)) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 4'd11));
assign vns_csr_bankarray_csrbank2_buf_in_commit_len1_r = vns_csr_bankarray_interface2_bank_bus_dat_w[2:0];
assign vns_csr_bankarray_csrbank2_buf_in_commit_len1_re = ((vns_csr_bankarray_csrbank2_sel & vns_csr_bankarray_interface2_bank_bus_we) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 4'd12));
assign vns_csr_bankarray_csrbank2_buf_in_commit_len1_we = ((vns_csr_bankarray_csrbank2_sel & (~vns_csr_bankarray_interface2_bank_bus_we)) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 4'd12));
assign vns_csr_bankarray_csrbank2_buf_in_commit_len0_r = vns_csr_bankarray_interface2_bank_bus_dat_w[7:0];
assign vns_csr_bankarray_csrbank2_buf_in_commit_len0_re = ((vns_csr_bankarray_csrbank2_sel & vns_csr_bankarray_interface2_bank_bus_we) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 4'd13));
assign vns_csr_bankarray_csrbank2_buf_in_commit_len0_we = ((vns_csr_bankarray_csrbank2_sel & (~vns_csr_bankarray_interface2_bank_bus_we)) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 4'd13));
assign vns_csr_bankarray_csrbank2_buf_in_commit_ack_r = vns_csr_bankarray_interface2_bank_bus_dat_w[0];
assign vns_csr_bankarray_csrbank2_buf_in_commit_ack_re = ((vns_csr_bankarray_csrbank2_sel & vns_csr_bankarray_interface2_bank_bus_we) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 4'd14));
assign vns_csr_bankarray_csrbank2_buf_in_commit_ack_we = ((vns_csr_bankarray_csrbank2_sel & (~vns_csr_bankarray_interface2_bank_bus_we)) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 4'd14));
assign vns_csr_bankarray_csrbank2_buf_out_addr1_r = vns_csr_bankarray_interface2_bank_bus_dat_w[0];
assign vns_csr_bankarray_csrbank2_buf_out_addr1_re = ((vns_csr_bankarray_csrbank2_sel & vns_csr_bankarray_interface2_bank_bus_we) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 4'd15));
assign vns_csr_bankarray_csrbank2_buf_out_addr1_we = ((vns_csr_bankarray_csrbank2_sel & (~vns_csr_bankarray_interface2_bank_bus_we)) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 4'd15));
assign vns_csr_bankarray_csrbank2_buf_out_addr0_r = vns_csr_bankarray_interface2_bank_bus_dat_w[7:0];
assign vns_csr_bankarray_csrbank2_buf_out_addr0_re = ((vns_csr_bankarray_csrbank2_sel & vns_csr_bankarray_interface2_bank_bus_we) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 5'd16));
assign vns_csr_bankarray_csrbank2_buf_out_addr0_we = ((vns_csr_bankarray_csrbank2_sel & (~vns_csr_bankarray_interface2_bank_bus_we)) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 5'd16));
assign vns_csr_bankarray_csrbank2_buf_out_q3_r = vns_csr_bankarray_interface2_bank_bus_dat_w[7:0];
assign vns_csr_bankarray_csrbank2_buf_out_q3_re = ((vns_csr_bankarray_csrbank2_sel & vns_csr_bankarray_interface2_bank_bus_we) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 5'd17));
assign vns_csr_bankarray_csrbank2_buf_out_q3_we = ((vns_csr_bankarray_csrbank2_sel & (~vns_csr_bankarray_interface2_bank_bus_we)) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 5'd17));
assign vns_csr_bankarray_csrbank2_buf_out_q2_r = vns_csr_bankarray_interface2_bank_bus_dat_w[7:0];
assign vns_csr_bankarray_csrbank2_buf_out_q2_re = ((vns_csr_bankarray_csrbank2_sel & vns_csr_bankarray_interface2_bank_bus_we) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 5'd18));
assign vns_csr_bankarray_csrbank2_buf_out_q2_we = ((vns_csr_bankarray_csrbank2_sel & (~vns_csr_bankarray_interface2_bank_bus_we)) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 5'd18));
assign vns_csr_bankarray_csrbank2_buf_out_q1_r = vns_csr_bankarray_interface2_bank_bus_dat_w[7:0];
assign vns_csr_bankarray_csrbank2_buf_out_q1_re = ((vns_csr_bankarray_csrbank2_sel & vns_csr_bankarray_interface2_bank_bus_we) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 5'd19));
assign vns_csr_bankarray_csrbank2_buf_out_q1_we = ((vns_csr_bankarray_csrbank2_sel & (~vns_csr_bankarray_interface2_bank_bus_we)) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 5'd19));
assign vns_csr_bankarray_csrbank2_buf_out_q0_r = vns_csr_bankarray_interface2_bank_bus_dat_w[7:0];
assign vns_csr_bankarray_csrbank2_buf_out_q0_re = ((vns_csr_bankarray_csrbank2_sel & vns_csr_bankarray_interface2_bank_bus_we) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 5'd20));
assign vns_csr_bankarray_csrbank2_buf_out_q0_we = ((vns_csr_bankarray_csrbank2_sel & (~vns_csr_bankarray_interface2_bank_bus_we)) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 5'd20));
assign vns_csr_bankarray_csrbank2_buf_out_len1_r = vns_csr_bankarray_interface2_bank_bus_dat_w[2:0];
assign vns_csr_bankarray_csrbank2_buf_out_len1_re = ((vns_csr_bankarray_csrbank2_sel & vns_csr_bankarray_interface2_bank_bus_we) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 5'd21));
assign vns_csr_bankarray_csrbank2_buf_out_len1_we = ((vns_csr_bankarray_csrbank2_sel & (~vns_csr_bankarray_interface2_bank_bus_we)) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 5'd21));
assign vns_csr_bankarray_csrbank2_buf_out_len0_r = vns_csr_bankarray_interface2_bank_bus_dat_w[7:0];
assign vns_csr_bankarray_csrbank2_buf_out_len0_re = ((vns_csr_bankarray_csrbank2_sel & vns_csr_bankarray_interface2_bank_bus_we) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 5'd22));
assign vns_csr_bankarray_csrbank2_buf_out_len0_we = ((vns_csr_bankarray_csrbank2_sel & (~vns_csr_bankarray_interface2_bank_bus_we)) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 5'd22));
assign vns_csr_bankarray_csrbank2_buf_out_hasdata_r = vns_csr_bankarray_interface2_bank_bus_dat_w[0];
assign vns_csr_bankarray_csrbank2_buf_out_hasdata_re = ((vns_csr_bankarray_csrbank2_sel & vns_csr_bankarray_interface2_bank_bus_we) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 5'd23));
assign vns_csr_bankarray_csrbank2_buf_out_hasdata_we = ((vns_csr_bankarray_csrbank2_sel & (~vns_csr_bankarray_interface2_bank_bus_we)) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 5'd23));
assign soc_buf_out_arm_r = vns_csr_bankarray_interface2_bank_bus_dat_w[0];
assign soc_buf_out_arm_re = ((vns_csr_bankarray_csrbank2_sel & vns_csr_bankarray_interface2_bank_bus_we) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 5'd24));
assign soc_buf_out_arm_we = ((vns_csr_bankarray_csrbank2_sel & (~vns_csr_bankarray_interface2_bank_bus_we)) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 5'd24));
assign vns_csr_bankarray_csrbank2_buf_out_arm_ack_r = vns_csr_bankarray_interface2_bank_bus_dat_w[0];
assign vns_csr_bankarray_csrbank2_buf_out_arm_ack_re = ((vns_csr_bankarray_csrbank2_sel & vns_csr_bankarray_interface2_bank_bus_we) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 5'd25));
assign vns_csr_bankarray_csrbank2_buf_out_arm_ack_we = ((vns_csr_bankarray_csrbank2_sel & (~vns_csr_bankarray_interface2_bank_bus_we)) & (vns_csr_bankarray_interface2_bank_bus_adr[4:0] == 5'd25));
assign vns_csr_bankarray_csrbank2_phy_enable0_w = soc_phy_enable_storage;
assign vns_csr_bankarray_csrbank2_core_enable0_w = soc_core_enable_storage;
assign vns_csr_bankarray_csrbank2_buf_in_addr1_w = soc_buf_in_addr_storage[8];
assign vns_csr_bankarray_csrbank2_buf_in_addr0_w = soc_buf_in_addr_storage[7:0];
assign vns_csr_bankarray_csrbank2_buf_in_data3_w = soc_buf_in_data_storage[31:24];
assign vns_csr_bankarray_csrbank2_buf_in_data2_w = soc_buf_in_data_storage[23:16];
assign vns_csr_bankarray_csrbank2_buf_in_data1_w = soc_buf_in_data_storage[15:8];
assign vns_csr_bankarray_csrbank2_buf_in_data0_w = soc_buf_in_data_storage[7:0];
assign vns_csr_bankarray_csrbank2_buf_in_request_w = soc_buf_in_request_status;
assign soc_buf_in_request_we = vns_csr_bankarray_csrbank2_buf_in_request_we;
assign vns_csr_bankarray_csrbank2_buf_in_ready_w = soc_buf_in_ready_status;
assign soc_buf_in_ready_we = vns_csr_bankarray_csrbank2_buf_in_ready_we;
assign vns_csr_bankarray_csrbank2_buf_in_commit_len1_w = soc_buf_in_commit_len_storage[10:8];
assign vns_csr_bankarray_csrbank2_buf_in_commit_len0_w = soc_buf_in_commit_len_storage[7:0];
assign vns_csr_bankarray_csrbank2_buf_in_commit_ack_w = soc_buf_in_commit_ack_status;
assign soc_buf_in_commit_ack_we = vns_csr_bankarray_csrbank2_buf_in_commit_ack_we;
assign vns_csr_bankarray_csrbank2_buf_out_addr1_w = soc_buf_out_addr_storage[8];
assign vns_csr_bankarray_csrbank2_buf_out_addr0_w = soc_buf_out_addr_storage[7:0];
assign vns_csr_bankarray_csrbank2_buf_out_q3_w = soc_buf_out_q_status[31:24];
assign vns_csr_bankarray_csrbank2_buf_out_q2_w = soc_buf_out_q_status[23:16];
assign vns_csr_bankarray_csrbank2_buf_out_q1_w = soc_buf_out_q_status[15:8];
assign vns_csr_bankarray_csrbank2_buf_out_q0_w = soc_buf_out_q_status[7:0];
assign soc_buf_out_q_we = vns_csr_bankarray_csrbank2_buf_out_q0_we;
assign vns_csr_bankarray_csrbank2_buf_out_len1_w = soc_buf_out_len_status[10:8];
assign vns_csr_bankarray_csrbank2_buf_out_len0_w = soc_buf_out_len_status[7:0];
assign soc_buf_out_len_we = vns_csr_bankarray_csrbank2_buf_out_len0_we;
assign vns_csr_bankarray_csrbank2_buf_out_hasdata_w = soc_buf_out_hasdata_status;
assign soc_buf_out_hasdata_we = vns_csr_bankarray_csrbank2_buf_out_hasdata_we;
assign vns_csr_bankarray_csrbank2_buf_out_arm_ack_w = soc_buf_out_arm_ack_status;
assign soc_buf_out_arm_ack_we = vns_csr_bankarray_csrbank2_buf_out_arm_ack_we;
assign vns_csr_interconnect_adr = soc_usbsoc_adr;
assign vns_csr_interconnect_we = soc_usbsoc_we;
assign vns_csr_interconnect_dat_w = soc_usbsoc_dat_w;
assign soc_usbsoc_dat_r = vns_csr_interconnect_dat_r;
assign vns_csr_bankarray_interface0_bank_bus_adr = vns_csr_interconnect_adr;
assign vns_csr_bankarray_interface1_bank_bus_adr = vns_csr_interconnect_adr;
assign vns_csr_bankarray_interface2_bank_bus_adr = vns_csr_interconnect_adr;
assign vns_csr_bankarray_sram_bus_adr = vns_csr_interconnect_adr;
assign vns_csr_bankarray_interface0_bank_bus_we = vns_csr_interconnect_we;
assign vns_csr_bankarray_interface1_bank_bus_we = vns_csr_interconnect_we;
assign vns_csr_bankarray_interface2_bank_bus_we = vns_csr_interconnect_we;
assign vns_csr_bankarray_sram_bus_we = vns_csr_interconnect_we;
assign vns_csr_bankarray_interface0_bank_bus_dat_w = vns_csr_interconnect_dat_w;
assign vns_csr_bankarray_interface1_bank_bus_dat_w = vns_csr_interconnect_dat_w;
assign vns_csr_bankarray_interface2_bank_bus_dat_w = vns_csr_interconnect_dat_w;
assign vns_csr_bankarray_sram_bus_dat_w = vns_csr_interconnect_dat_w;
assign vns_csr_interconnect_dat_r = (((vns_csr_bankarray_interface0_bank_bus_dat_r | vns_csr_bankarray_interface1_bank_bus_dat_r) | vns_csr_bankarray_interface2_bank_bus_dat_r) | vns_csr_bankarray_sram_bus_dat_r);
assign vns_slice_proxy0 = soc_eth_core_mac_depacketizer_header[111:96];
assign vns_slice_proxy1 = soc_eth_core_mac_depacketizer_header[111:96];
assign vns_slice_proxy2 = soc_eth_core_mac_depacketizer_header[95:48];
assign vns_slice_proxy3 = soc_eth_core_mac_depacketizer_header[95:48];
assign vns_slice_proxy4 = soc_eth_core_mac_depacketizer_header[95:48];
assign vns_slice_proxy5 = soc_eth_core_mac_depacketizer_header[95:48];
assign vns_slice_proxy6 = soc_eth_core_mac_depacketizer_header[95:48];
assign vns_slice_proxy7 = soc_eth_core_mac_depacketizer_header[95:48];
assign vns_slice_proxy8 = soc_eth_core_mac_depacketizer_header[47:0];
assign vns_slice_proxy9 = soc_eth_core_mac_depacketizer_header[47:0];
assign vns_slice_proxy10 = soc_eth_core_mac_depacketizer_header[47:0];
assign vns_slice_proxy11 = soc_eth_core_mac_depacketizer_header[47:0];
assign vns_slice_proxy12 = soc_eth_core_mac_depacketizer_header[47:0];
assign vns_slice_proxy13 = soc_eth_core_mac_depacketizer_header[47:0];
assign vns_slice_proxy14 = soc_eth_core_arp_rx_depacketizer_header[39:32];
assign vns_slice_proxy15 = soc_eth_core_arp_rx_depacketizer_header[15:0];
assign vns_slice_proxy16 = soc_eth_core_arp_rx_depacketizer_header[15:0];
assign vns_slice_proxy17 = soc_eth_core_arp_rx_depacketizer_header[63:48];
assign vns_slice_proxy18 = soc_eth_core_arp_rx_depacketizer_header[63:48];
assign vns_slice_proxy19 = soc_eth_core_arp_rx_depacketizer_header[31:16];
assign vns_slice_proxy20 = soc_eth_core_arp_rx_depacketizer_header[31:16];
assign vns_slice_proxy21 = soc_eth_core_arp_rx_depacketizer_header[47:40];
assign vns_slice_proxy22 = soc_eth_core_arp_rx_depacketizer_header[143:112];
assign vns_slice_proxy23 = soc_eth_core_arp_rx_depacketizer_header[143:112];
assign vns_slice_proxy24 = soc_eth_core_arp_rx_depacketizer_header[143:112];
assign vns_slice_proxy25 = soc_eth_core_arp_rx_depacketizer_header[143:112];
assign vns_slice_proxy26 = soc_eth_core_arp_rx_depacketizer_header[111:64];
assign vns_slice_proxy27 = soc_eth_core_arp_rx_depacketizer_header[111:64];
assign vns_slice_proxy28 = soc_eth_core_arp_rx_depacketizer_header[111:64];
assign vns_slice_proxy29 = soc_eth_core_arp_rx_depacketizer_header[111:64];
assign vns_slice_proxy30 = soc_eth_core_arp_rx_depacketizer_header[111:64];
assign vns_slice_proxy31 = soc_eth_core_arp_rx_depacketizer_header[111:64];
assign vns_slice_proxy32 = soc_eth_core_arp_rx_depacketizer_header[223:192];
assign vns_slice_proxy33 = soc_eth_core_arp_rx_depacketizer_header[223:192];
assign vns_slice_proxy34 = soc_eth_core_arp_rx_depacketizer_header[223:192];
assign vns_slice_proxy35 = soc_eth_core_arp_rx_depacketizer_header[223:192];
assign vns_slice_proxy36 = soc_eth_core_arp_rx_depacketizer_header[191:144];
assign vns_slice_proxy37 = soc_eth_core_arp_rx_depacketizer_header[191:144];
assign vns_slice_proxy38 = soc_eth_core_arp_rx_depacketizer_header[191:144];
assign vns_slice_proxy39 = soc_eth_core_arp_rx_depacketizer_header[191:144];
assign vns_slice_proxy40 = soc_eth_core_arp_rx_depacketizer_header[191:144];
assign vns_slice_proxy41 = soc_eth_core_arp_rx_depacketizer_header[191:144];
assign vns_slice_proxy42 = soc_eth_core_ip_rx_depacketizer_header[95:80];
assign vns_slice_proxy43 = soc_eth_core_ip_rx_depacketizer_header[95:80];
assign vns_slice_proxy44 = soc_eth_core_ip_rx_depacketizer_header[47:32];
assign vns_slice_proxy45 = soc_eth_core_ip_rx_depacketizer_header[47:32];
assign vns_slice_proxy46 = soc_eth_core_ip_rx_depacketizer_header[3:0];
assign vns_slice_proxy47 = soc_eth_core_ip_rx_depacketizer_header[79:72];
assign vns_slice_proxy48 = soc_eth_core_ip_rx_depacketizer_header[127:96];
assign vns_slice_proxy49 = soc_eth_core_ip_rx_depacketizer_header[127:96];
assign vns_slice_proxy50 = soc_eth_core_ip_rx_depacketizer_header[127:96];
assign vns_slice_proxy51 = soc_eth_core_ip_rx_depacketizer_header[127:96];
assign vns_slice_proxy52 = soc_eth_core_ip_rx_depacketizer_header[159:128];
assign vns_slice_proxy53 = soc_eth_core_ip_rx_depacketizer_header[159:128];
assign vns_slice_proxy54 = soc_eth_core_ip_rx_depacketizer_header[159:128];
assign vns_slice_proxy55 = soc_eth_core_ip_rx_depacketizer_header[159:128];
assign vns_slice_proxy56 = soc_eth_core_ip_rx_depacketizer_header[31:16];
assign vns_slice_proxy57 = soc_eth_core_ip_rx_depacketizer_header[31:16];
assign vns_slice_proxy58 = soc_eth_core_ip_rx_depacketizer_header[71:64];
assign vns_slice_proxy59 = soc_eth_core_ip_rx_depacketizer_header[7:4];
assign vns_slice_proxy60 = soc_eth_core_icmp_rx_depacketizer_header[31:16];
assign vns_slice_proxy61 = soc_eth_core_icmp_rx_depacketizer_header[31:16];
assign vns_slice_proxy62 = soc_eth_core_icmp_rx_depacketizer_header[15:8];
assign vns_slice_proxy63 = soc_eth_core_icmp_rx_depacketizer_header[7:0];
assign vns_slice_proxy64 = soc_eth_core_icmp_rx_depacketizer_header[63:32];
assign vns_slice_proxy65 = soc_eth_core_icmp_rx_depacketizer_header[63:32];
assign vns_slice_proxy66 = soc_eth_core_icmp_rx_depacketizer_header[63:32];
assign vns_slice_proxy67 = soc_eth_core_icmp_rx_depacketizer_header[63:32];
assign vns_slice_proxy68 = soc_eth_core_rx_depacketizer_header[63:48];
assign vns_slice_proxy69 = soc_eth_core_rx_depacketizer_header[63:48];
assign vns_slice_proxy70 = soc_eth_core_rx_depacketizer_header[31:16];
assign vns_slice_proxy71 = soc_eth_core_rx_depacketizer_header[31:16];
assign vns_slice_proxy72 = soc_eth_core_rx_depacketizer_header[47:32];
assign vns_slice_proxy73 = soc_eth_core_rx_depacketizer_header[47:32];
assign vns_slice_proxy74 = soc_eth_core_rx_depacketizer_header[15:0];
assign vns_slice_proxy75 = soc_eth_core_rx_depacketizer_header[15:0];
assign vns_slice_proxy76 = soc_etherbone_rx_depacketizer_header[31:28];
assign vns_slice_proxy77 = soc_etherbone_rx_depacketizer_header[15:0];
assign vns_slice_proxy78 = soc_etherbone_rx_depacketizer_header[15:0];
assign vns_slice_proxy79 = soc_etherbone_rx_depacketizer_header[18];
assign vns_slice_proxy80 = soc_etherbone_rx_depacketizer_header[16];
assign vns_slice_proxy81 = soc_etherbone_rx_depacketizer_header[27:24];
assign vns_slice_proxy82 = soc_etherbone_rx_depacketizer_header[17];
assign vns_slice_proxy83 = soc_etherbone_rx_depacketizer_header[23:20];
assign vns_slice_proxy84 = soc_etherbone_record_depacketizer_header[0];
assign vns_slice_proxy85 = soc_etherbone_record_depacketizer_header[15:8];
assign vns_slice_proxy86 = soc_etherbone_record_depacketizer_header[4];
assign vns_slice_proxy87 = soc_etherbone_record_depacketizer_header[1];
assign vns_slice_proxy88 = soc_etherbone_record_depacketizer_header[31:24];
assign vns_slice_proxy89 = soc_etherbone_record_depacketizer_header[2];
assign vns_slice_proxy90 = soc_etherbone_record_depacketizer_header[5];
assign vns_slice_proxy91 = soc_etherbone_record_depacketizer_header[23:16];
assign vns_slice_proxy92 = soc_etherbone_record_depacketizer_header[6];
always @(*) begin
	vns_array_muxed0 <= 30'd0;
	case (vns_grant)
		1'd0: begin
			vns_array_muxed0 <= soc_uart_bridge_wishbone_adr;
		end
		default: begin
			vns_array_muxed0 <= soc_etherbone_wishbone_bus_adr;
		end
	endcase
end
always @(*) begin
	vns_array_muxed1 <= 32'd0;
	case (vns_grant)
		1'd0: begin
			vns_array_muxed1 <= soc_uart_bridge_wishbone_dat_w;
		end
		default: begin
			vns_array_muxed1 <= soc_etherbone_wishbone_bus_dat_w;
		end
	endcase
end
always @(*) begin
	vns_array_muxed2 <= 4'd0;
	case (vns_grant)
		1'd0: begin
			vns_array_muxed2 <= soc_uart_bridge_wishbone_sel;
		end
		default: begin
			vns_array_muxed2 <= soc_etherbone_wishbone_bus_sel;
		end
	endcase
end
always @(*) begin
	vns_array_muxed3 <= 1'd0;
	case (vns_grant)
		1'd0: begin
			vns_array_muxed3 <= soc_uart_bridge_wishbone_cyc;
		end
		default: begin
			vns_array_muxed3 <= soc_etherbone_wishbone_bus_cyc;
		end
	endcase
end
always @(*) begin
	vns_array_muxed4 <= 1'd0;
	case (vns_grant)
		1'd0: begin
			vns_array_muxed4 <= soc_uart_bridge_wishbone_stb;
		end
		default: begin
			vns_array_muxed4 <= soc_etherbone_wishbone_bus_stb;
		end
	endcase
end
always @(*) begin
	vns_array_muxed5 <= 1'd0;
	case (vns_grant)
		1'd0: begin
			vns_array_muxed5 <= soc_uart_bridge_wishbone_we;
		end
		default: begin
			vns_array_muxed5 <= soc_etherbone_wishbone_bus_we;
		end
	endcase
end
always @(*) begin
	vns_array_muxed6 <= 3'd0;
	case (vns_grant)
		1'd0: begin
			vns_array_muxed6 <= soc_uart_bridge_wishbone_cti;
		end
		default: begin
			vns_array_muxed6 <= soc_etherbone_wishbone_bus_cti;
		end
	endcase
end
always @(*) begin
	vns_array_muxed7 <= 2'd0;
	case (vns_grant)
		1'd0: begin
			vns_array_muxed7 <= soc_uart_bridge_wishbone_bte;
		end
		default: begin
			vns_array_muxed7 <= soc_etherbone_wishbone_bus_bte;
		end
	endcase
end
assign vns_xilinxasyncresetsynchronizerimpl0 = ((~soc_pll_locked) | (~cpu_reset));
assign vns_xilinxasyncresetsynchronizerimpl1 = ((~soc_pll_locked) | (~cpu_reset));
assign soc_uart_bridge_rx = vns_xilinxmultiregimpl0_regs1;
assign vns_xilinxasyncresetsynchronizerimpl2 = ((~soc_eth_phy_pll_locked) | soc_eth_phy_pll_reset);
always @(*) begin
	soc_eth_phy_status <= 1'd0;
	soc_eth_phy_status <= soc_eth_phy_r;
	soc_eth_phy_status <= vns_xilinxmultiregimpl1_regs1;
end
assign soc_eth_core_mac_ps_preamble_error_toggle_o = vns_xilinxmultiregimpl2_regs1;
assign soc_eth_core_mac_ps_crc_error_toggle_o = vns_xilinxmultiregimpl3_regs1;
assign soc_eth_core_mac_tx_cdc_produce_rdomain = vns_xilinxmultiregimpl4_regs1;
assign soc_eth_core_mac_tx_cdc_consume_wdomain = vns_xilinxmultiregimpl5_regs1;
assign soc_eth_core_mac_rx_cdc_produce_rdomain = vns_xilinxmultiregimpl6_regs1;
assign soc_eth_core_mac_rx_cdc_consume_wdomain = vns_xilinxmultiregimpl7_regs1;
assign vns_xilinxasyncresetsynchronizerimpl5 = (~soc_phy_pipe_pll_locked);
assign vns_xilinxasyncresetsynchronizerimpl6 = (~soc_phy_pipe_pll_locked);
assign vns_xilinxasyncresetsynchronizerimpl7 = (~soc_phy_pipe_pll_locked);
assign vns_xilinxasyncresetsynchronizerimpl8 = (~soc_phy_pipe_pll_locked);
always @(posedge clk200_clk) begin
	if ((soc_reset_counter != 1'd0)) begin
		soc_reset_counter <= (soc_reset_counter - 1'd1);
	end else begin
		soc_ic_reset <= 1'd0;
	end
	if (clk200_rst) begin
		soc_reset_counter <= 4'd15;
		soc_ic_reset <= 1'd1;
	end
end
always @(posedge eth_rx_clk) begin
	soc_eth_phy_liteethphyrgmiirx_rx_ctl_d <= soc_eth_phy_liteethphyrgmiirx_rx_ctl;
	soc_eth_phy_liteethphyrgmiirx_source_valid <= soc_eth_phy_liteethphyrgmiirx_rx_ctl;
	soc_eth_phy_liteethphyrgmiirx_source_payload_data <= soc_eth_phy_liteethphyrgmiirx_rx_data;
	vns_liteethudpipcore_liteethmac_liteethmacpreamblechecker_state <= vns_liteethudpipcore_liteethmac_liteethmacpreamblechecker_next_state;
	if (soc_eth_core_mac_crc32_checker_crc_ce) begin
		soc_eth_core_mac_crc32_checker_crc_reg <= soc_eth_core_mac_crc32_checker_crc_next;
	end
	if (soc_eth_core_mac_crc32_checker_crc_reset) begin
		soc_eth_core_mac_crc32_checker_crc_reg <= 32'd4294967295;
	end
	if (((soc_eth_core_mac_crc32_checker_syncfifo_syncfifo_we & soc_eth_core_mac_crc32_checker_syncfifo_syncfifo_writable) & (~soc_eth_core_mac_crc32_checker_syncfifo_replace))) begin
		if ((soc_eth_core_mac_crc32_checker_syncfifo_produce == 3'd4)) begin
			soc_eth_core_mac_crc32_checker_syncfifo_produce <= 1'd0;
		end else begin
			soc_eth_core_mac_crc32_checker_syncfifo_produce <= (soc_eth_core_mac_crc32_checker_syncfifo_produce + 1'd1);
		end
	end
	if (soc_eth_core_mac_crc32_checker_syncfifo_do_read) begin
		if ((soc_eth_core_mac_crc32_checker_syncfifo_consume == 3'd4)) begin
			soc_eth_core_mac_crc32_checker_syncfifo_consume <= 1'd0;
		end else begin
			soc_eth_core_mac_crc32_checker_syncfifo_consume <= (soc_eth_core_mac_crc32_checker_syncfifo_consume + 1'd1);
		end
	end
	if (((soc_eth_core_mac_crc32_checker_syncfifo_syncfifo_we & soc_eth_core_mac_crc32_checker_syncfifo_syncfifo_writable) & (~soc_eth_core_mac_crc32_checker_syncfifo_replace))) begin
		if ((~soc_eth_core_mac_crc32_checker_syncfifo_do_read)) begin
			soc_eth_core_mac_crc32_checker_syncfifo_level <= (soc_eth_core_mac_crc32_checker_syncfifo_level + 1'd1);
		end
	end else begin
		if (soc_eth_core_mac_crc32_checker_syncfifo_do_read) begin
			soc_eth_core_mac_crc32_checker_syncfifo_level <= (soc_eth_core_mac_crc32_checker_syncfifo_level - 1'd1);
		end
	end
	if (soc_eth_core_mac_crc32_checker_fifo_reset) begin
		soc_eth_core_mac_crc32_checker_syncfifo_level <= 3'd0;
		soc_eth_core_mac_crc32_checker_syncfifo_produce <= 3'd0;
		soc_eth_core_mac_crc32_checker_syncfifo_consume <= 3'd0;
	end
	vns_liteethudpipcore_liteethmac_liteethmaccrc32checker_state <= vns_liteethudpipcore_liteethmac_liteethmaccrc32checker_next_state;
	if (soc_eth_core_mac_ps_preamble_error_i) begin
		soc_eth_core_mac_ps_preamble_error_toggle_i <= (~soc_eth_core_mac_ps_preamble_error_toggle_i);
	end
	if (soc_eth_core_mac_ps_crc_error_i) begin
		soc_eth_core_mac_ps_crc_error_toggle_i <= (~soc_eth_core_mac_ps_crc_error_toggle_i);
	end
	soc_eth_core_mac_rx_cdc_graycounter0_q_binary <= soc_eth_core_mac_rx_cdc_graycounter0_q_next_binary;
	soc_eth_core_mac_rx_cdc_graycounter0_q <= soc_eth_core_mac_rx_cdc_graycounter0_q_next;
	if (eth_rx_rst) begin
		soc_eth_phy_liteethphyrgmiirx_source_valid <= 1'd0;
		soc_eth_phy_liteethphyrgmiirx_source_payload_data <= 8'd0;
		soc_eth_phy_liteethphyrgmiirx_rx_ctl_d <= 1'd0;
		soc_eth_core_mac_crc32_checker_crc_reg <= 32'd4294967295;
		soc_eth_core_mac_crc32_checker_syncfifo_level <= 3'd0;
		soc_eth_core_mac_crc32_checker_syncfifo_produce <= 3'd0;
		soc_eth_core_mac_crc32_checker_syncfifo_consume <= 3'd0;
		soc_eth_core_mac_rx_cdc_graycounter0_q <= 7'd0;
		soc_eth_core_mac_rx_cdc_graycounter0_q_binary <= 7'd0;
		vns_liteethudpipcore_liteethmac_liteethmacpreamblechecker_state <= 1'd0;
		vns_liteethudpipcore_liteethmac_liteethmaccrc32checker_state <= 2'd0;
	end
	vns_xilinxmultiregimpl7_regs0 <= soc_eth_core_mac_rx_cdc_graycounter1_q;
	vns_xilinxmultiregimpl7_regs1 <= vns_xilinxmultiregimpl7_regs0;
end
always @(posedge eth_tx_clk) begin
	if (soc_eth_core_mac_tx_gap_inserter_counter_reset) begin
		soc_eth_core_mac_tx_gap_inserter_counter <= 1'd0;
	end else begin
		if (soc_eth_core_mac_tx_gap_inserter_counter_ce) begin
			soc_eth_core_mac_tx_gap_inserter_counter <= (soc_eth_core_mac_tx_gap_inserter_counter + 1'd1);
		end
	end
	vns_liteethudpipcore_liteethmac_liteethmacgap_state <= vns_liteethudpipcore_liteethmac_liteethmacgap_next_state;
	if (soc_eth_core_mac_preamble_inserter_clr_cnt) begin
		soc_eth_core_mac_preamble_inserter_cnt <= 1'd0;
	end else begin
		if (soc_eth_core_mac_preamble_inserter_inc_cnt) begin
			soc_eth_core_mac_preamble_inserter_cnt <= (soc_eth_core_mac_preamble_inserter_cnt + 1'd1);
		end
	end
	vns_liteethudpipcore_liteethmac_liteethmacpreambleinserter_state <= vns_liteethudpipcore_liteethmac_liteethmacpreambleinserter_next_state;
	if (soc_eth_core_mac_crc32_inserter_is_ongoing0) begin
		soc_eth_core_mac_crc32_inserter_cnt <= 2'd3;
	end else begin
		if ((soc_eth_core_mac_crc32_inserter_is_ongoing1 & (~soc_eth_core_mac_crc32_inserter_cnt_done))) begin
			soc_eth_core_mac_crc32_inserter_cnt <= (soc_eth_core_mac_crc32_inserter_cnt - soc_eth_core_mac_crc32_inserter_source_ready);
		end
	end
	if (soc_eth_core_mac_crc32_inserter_ce) begin
		soc_eth_core_mac_crc32_inserter_reg <= soc_eth_core_mac_crc32_inserter_next;
	end
	if (soc_eth_core_mac_crc32_inserter_reset) begin
		soc_eth_core_mac_crc32_inserter_reg <= 32'd4294967295;
	end
	vns_liteethudpipcore_liteethmac_liteethmaccrc32inserter_state <= vns_liteethudpipcore_liteethmac_liteethmaccrc32inserter_next_state;
	if (soc_eth_core_mac_padding_inserter_counter_reset) begin
		soc_eth_core_mac_padding_inserter_counter <= 1'd0;
	end else begin
		if (soc_eth_core_mac_padding_inserter_counter_ce) begin
			soc_eth_core_mac_padding_inserter_counter <= (soc_eth_core_mac_padding_inserter_counter + 1'd1);
		end
	end
	vns_liteethudpipcore_liteethmac_liteethmacpaddinginserter_state <= vns_liteethudpipcore_liteethmac_liteethmacpaddinginserter_next_state;
	soc_eth_core_mac_tx_cdc_graycounter1_q_binary <= soc_eth_core_mac_tx_cdc_graycounter1_q_next_binary;
	soc_eth_core_mac_tx_cdc_graycounter1_q <= soc_eth_core_mac_tx_cdc_graycounter1_q_next;
	if (eth_tx_rst) begin
		soc_eth_core_mac_crc32_inserter_reg <= 32'd4294967295;
		soc_eth_core_mac_crc32_inserter_cnt <= 2'd3;
		soc_eth_core_mac_padding_inserter_counter <= 16'd1;
		soc_eth_core_mac_tx_cdc_graycounter1_q <= 7'd0;
		soc_eth_core_mac_tx_cdc_graycounter1_q_binary <= 7'd0;
		vns_liteethudpipcore_liteethmac_liteethmacgap_state <= 1'd0;
		vns_liteethudpipcore_liteethmac_liteethmacpreambleinserter_state <= 2'd0;
		vns_liteethudpipcore_liteethmac_liteethmaccrc32inserter_state <= 2'd0;
		vns_liteethudpipcore_liteethmac_liteethmacpaddinginserter_state <= 1'd0;
	end
	vns_xilinxmultiregimpl4_regs0 <= soc_eth_core_mac_tx_cdc_graycounter0_q;
	vns_xilinxmultiregimpl4_regs1 <= vns_xilinxmultiregimpl4_regs0;
end
always @(posedge sys_clk) begin
	if ((soc_usbsoc_bus_errors != 32'd4294967295)) begin
		if (soc_usbsoc_bus_error) begin
			soc_usbsoc_bus_errors <= (soc_usbsoc_bus_errors + 1'd1);
		end
	end
	vns_wb2csr_state <= vns_wb2csr_next_state;
	if (soc_uart_bridge_byte_counter_reset) begin
		soc_uart_bridge_byte_counter <= 1'd0;
	end else begin
		if (soc_uart_bridge_byte_counter_ce) begin
			soc_uart_bridge_byte_counter <= (soc_uart_bridge_byte_counter + 1'd1);
		end
	end
	if (soc_uart_bridge_word_counter_reset) begin
		soc_uart_bridge_word_counter <= 1'd0;
	end else begin
		if (soc_uart_bridge_word_counter_ce) begin
			soc_uart_bridge_word_counter <= (soc_uart_bridge_word_counter + 1'd1);
		end
	end
	if (soc_uart_bridge_cmd_ce) begin
		soc_uart_bridge_cmd <= soc_uart_bridge_source_payload_data;
	end
	if (soc_uart_bridge_length_ce) begin
		soc_uart_bridge_length <= soc_uart_bridge_source_payload_data;
	end
	if (soc_uart_bridge_address_ce) begin
		soc_uart_bridge_address <= {soc_uart_bridge_address[23:0], soc_uart_bridge_source_payload_data};
	end
	if (soc_uart_bridge_rx_data_ce) begin
		soc_uart_bridge_data <= {soc_uart_bridge_data[23:0], soc_uart_bridge_source_payload_data};
	end else begin
		if (soc_uart_bridge_tx_data_ce) begin
			soc_uart_bridge_data <= soc_uart_bridge_wishbone_dat_r;
		end
	end
	soc_uart_bridge_sink_ready <= 1'd0;
	if (((soc_uart_bridge_sink_valid & (~soc_uart_bridge_tx_busy)) & (~soc_uart_bridge_sink_ready))) begin
		soc_uart_bridge_tx_reg <= soc_uart_bridge_sink_payload_data;
		soc_uart_bridge_tx_bitcount <= 1'd0;
		soc_uart_bridge_tx_busy <= 1'd1;
		serial_tx <= 1'd0;
	end else begin
		if ((soc_uart_bridge_uart_clk_txen & soc_uart_bridge_tx_busy)) begin
			soc_uart_bridge_tx_bitcount <= (soc_uart_bridge_tx_bitcount + 1'd1);
			if ((soc_uart_bridge_tx_bitcount == 4'd8)) begin
				serial_tx <= 1'd1;
			end else begin
				if ((soc_uart_bridge_tx_bitcount == 4'd9)) begin
					serial_tx <= 1'd1;
					soc_uart_bridge_tx_busy <= 1'd0;
					soc_uart_bridge_sink_ready <= 1'd1;
				end else begin
					serial_tx <= soc_uart_bridge_tx_reg[0];
					soc_uart_bridge_tx_reg <= {1'd0, soc_uart_bridge_tx_reg[7:1]};
				end
			end
		end
	end
	if (soc_uart_bridge_tx_busy) begin
		{soc_uart_bridge_uart_clk_txen, soc_uart_bridge_phase_accumulator_tx} <= (soc_uart_bridge_phase_accumulator_tx + soc_uart_bridge_storage);
	end else begin
		{soc_uart_bridge_uart_clk_txen, soc_uart_bridge_phase_accumulator_tx} <= 1'd0;
	end
	soc_uart_bridge_source_valid <= 1'd0;
	soc_uart_bridge_rx_r <= soc_uart_bridge_rx;
	if ((~soc_uart_bridge_rx_busy)) begin
		if (((~soc_uart_bridge_rx) & soc_uart_bridge_rx_r)) begin
			soc_uart_bridge_rx_busy <= 1'd1;
			soc_uart_bridge_rx_bitcount <= 1'd0;
		end
	end else begin
		if (soc_uart_bridge_uart_clk_rxen) begin
			soc_uart_bridge_rx_bitcount <= (soc_uart_bridge_rx_bitcount + 1'd1);
			if ((soc_uart_bridge_rx_bitcount == 1'd0)) begin
				if (soc_uart_bridge_rx) begin
					soc_uart_bridge_rx_busy <= 1'd0;
				end
			end else begin
				if ((soc_uart_bridge_rx_bitcount == 4'd9)) begin
					soc_uart_bridge_rx_busy <= 1'd0;
					if (soc_uart_bridge_rx) begin
						soc_uart_bridge_source_payload_data <= soc_uart_bridge_rx_reg;
						soc_uart_bridge_source_valid <= 1'd1;
					end
				end else begin
					soc_uart_bridge_rx_reg <= {soc_uart_bridge_rx, soc_uart_bridge_rx_reg[7:1]};
				end
			end
		end
	end
	if (soc_uart_bridge_rx_busy) begin
		{soc_uart_bridge_uart_clk_rxen, soc_uart_bridge_phase_accumulator_rx} <= (soc_uart_bridge_phase_accumulator_rx + soc_uart_bridge_storage);
	end else begin
		{soc_uart_bridge_uart_clk_rxen, soc_uart_bridge_phase_accumulator_rx} <= 32'd2147483648;
	end
	vns_uartwishbonebridge_state <= vns_uartwishbonebridge_next_state;
	if (soc_uart_bridge_reset) begin
		vns_uartwishbonebridge_state <= 3'd0;
	end
	if (soc_uart_bridge_wait) begin
		if ((~soc_uart_bridge_done)) begin
			soc_uart_bridge_count <= (soc_uart_bridge_count - 1'd1);
		end
	end else begin
		soc_uart_bridge_count <= 24'd13300000;
	end
	if (soc_eth_phy_hw_reset_counter_ce) begin
		soc_eth_phy_hw_reset_counter <= (soc_eth_phy_hw_reset_counter + 1'd1);
	end
	if (soc_eth_core_mac_ps_preamble_error_o) begin
		soc_eth_core_mac_preamble_errors_status <= (soc_eth_core_mac_preamble_errors_status + 1'd1);
	end
	if (soc_eth_core_mac_ps_crc_error_o) begin
		soc_eth_core_mac_crc_errors_status <= (soc_eth_core_mac_crc_errors_status + 1'd1);
	end
	soc_eth_core_mac_ps_preamble_error_toggle_o_r <= soc_eth_core_mac_ps_preamble_error_toggle_o;
	soc_eth_core_mac_ps_crc_error_toggle_o_r <= soc_eth_core_mac_ps_crc_error_toggle_o;
	soc_eth_core_mac_tx_cdc_graycounter0_q_binary <= soc_eth_core_mac_tx_cdc_graycounter0_q_next_binary;
	soc_eth_core_mac_tx_cdc_graycounter0_q <= soc_eth_core_mac_tx_cdc_graycounter0_q_next;
	soc_eth_core_mac_rx_cdc_graycounter1_q_binary <= soc_eth_core_mac_rx_cdc_graycounter1_q_next_binary;
	soc_eth_core_mac_rx_cdc_graycounter1_q <= soc_eth_core_mac_rx_cdc_graycounter1_q_next;
	case (vns_liteethudpipcore_liteethmac_grant)
		1'd0: begin
			if ((~vns_liteethudpipcore_liteethmac_request[0])) begin
				if (vns_liteethudpipcore_liteethmac_request[1]) begin
					vns_liteethudpipcore_liteethmac_grant <= 1'd1;
				end
			end
		end
		1'd1: begin
			if ((~vns_liteethudpipcore_liteethmac_request[1])) begin
				if (vns_liteethudpipcore_liteethmac_request[0]) begin
					vns_liteethudpipcore_liteethmac_grant <= 1'd0;
				end
			end
		end
	endcase
	vns_liteethudpipcore_liteethmac_status0_ongoing1 <= ((soc_eth_core_arp_mac_port_sink_valid | vns_liteethudpipcore_liteethmac_status0_ongoing1) & (~vns_liteethudpipcore_liteethmac_status0_last));
	if (vns_liteethudpipcore_liteethmac_status0_last) begin
		vns_liteethudpipcore_liteethmac_status0_first <= 1'd1;
	end else begin
		if ((soc_eth_core_arp_mac_port_sink_valid & soc_eth_core_arp_mac_port_sink_ready)) begin
			vns_liteethudpipcore_liteethmac_status0_first <= 1'd0;
		end
	end
	vns_liteethudpipcore_liteethmac_status1_ongoing1 <= ((soc_eth_core_ip_mac_port_sink_valid | vns_liteethudpipcore_liteethmac_status1_ongoing1) & (~vns_liteethudpipcore_liteethmac_status1_last));
	if (vns_liteethudpipcore_liteethmac_status1_last) begin
		vns_liteethudpipcore_liteethmac_status1_first <= 1'd1;
	end else begin
		if ((soc_eth_core_ip_mac_port_sink_valid & soc_eth_core_ip_mac_port_sink_ready)) begin
			vns_liteethudpipcore_liteethmac_status1_first <= 1'd0;
		end
	end
	if (vns_liteethudpipcore_liteethmac_first) begin
		vns_liteethudpipcore_liteethmac_sel_ongoing <= vns_liteethudpipcore_liteethmac_sel0;
	end
	vns_liteethudpipcore_liteethmac_ongoing1 <= ((soc_eth_core_mac_crossbar_sink_valid | vns_liteethudpipcore_liteethmac_ongoing1) & (~vns_liteethudpipcore_liteethmac_last));
	if (vns_liteethudpipcore_liteethmac_last) begin
		vns_liteethudpipcore_liteethmac_first <= 1'd1;
	end else begin
		if ((soc_eth_core_mac_crossbar_sink_valid & soc_eth_core_mac_crossbar_sink_ready)) begin
			vns_liteethudpipcore_liteethmac_first <= 1'd0;
		end
	end
	if (soc_eth_core_mac_packetizer_sr_load) begin
		soc_eth_core_mac_packetizer_sr <= soc_eth_core_mac_packetizer_header;
	end
	if (soc_eth_core_mac_packetizer_sr_shift) begin
		soc_eth_core_mac_packetizer_sr <= soc_eth_core_mac_packetizer_sr[111:8];
	end
	if (soc_eth_core_mac_packetizer_source_ready) begin
		soc_eth_core_mac_packetizer_sink_d_valid <= soc_eth_core_mac_packetizer_sink_valid;
		soc_eth_core_mac_packetizer_sink_d_ready <= soc_eth_core_mac_packetizer_sink_ready;
		soc_eth_core_mac_packetizer_sink_d_first <= soc_eth_core_mac_packetizer_sink_first;
		soc_eth_core_mac_packetizer_sink_d_last <= soc_eth_core_mac_packetizer_sink_last;
		soc_eth_core_mac_packetizer_sink_d_payload_ethernet_type <= soc_eth_core_mac_packetizer_sink_payload_ethernet_type;
		soc_eth_core_mac_packetizer_sink_d_payload_sender_mac <= soc_eth_core_mac_packetizer_sink_payload_sender_mac;
		soc_eth_core_mac_packetizer_sink_d_payload_target_mac <= soc_eth_core_mac_packetizer_sink_payload_target_mac;
		soc_eth_core_mac_packetizer_sink_d_payload_data <= soc_eth_core_mac_packetizer_sink_payload_data;
		soc_eth_core_mac_packetizer_sink_d_payload_last_be <= soc_eth_core_mac_packetizer_sink_payload_last_be;
		soc_eth_core_mac_packetizer_sink_d_payload_error <= soc_eth_core_mac_packetizer_sink_payload_error;
	end
	vns_liteethudpipcore_liteethmac_liteethmacpacketizer_state <= vns_liteethudpipcore_liteethmac_liteethmacpacketizer_next_state;
	if (soc_eth_core_mac_packetizer_count_liteethmacpacketizer_next_value_ce0) begin
		soc_eth_core_mac_packetizer_count <= soc_eth_core_mac_packetizer_count_liteethmacpacketizer_next_value0;
	end
	if (soc_eth_core_mac_packetizer_fsm_from_idle_liteethmacpacketizer_next_value_ce1) begin
		soc_eth_core_mac_packetizer_fsm_from_idle <= soc_eth_core_mac_packetizer_fsm_from_idle_liteethmacpacketizer_next_value1;
	end
	if (soc_eth_core_mac_depacketizer_sr_shift) begin
		soc_eth_core_mac_depacketizer_sr <= {soc_eth_core_mac_depacketizer_sink_payload_data, soc_eth_core_mac_depacketizer_sr[111:8]};
	end
	if (soc_eth_core_mac_depacketizer_sr_shift_leftover) begin
		soc_eth_core_mac_depacketizer_sr <= {soc_eth_core_mac_depacketizer_sink_payload_data, soc_eth_core_mac_depacketizer_sr[111:0]};
	end
	if ((soc_eth_core_mac_depacketizer_sink_valid & soc_eth_core_mac_depacketizer_sink_ready)) begin
		soc_eth_core_mac_depacketizer_sink_d_valid <= soc_eth_core_mac_depacketizer_sink_valid;
		soc_eth_core_mac_depacketizer_sink_d_ready <= soc_eth_core_mac_depacketizer_sink_ready;
		soc_eth_core_mac_depacketizer_sink_d_first <= soc_eth_core_mac_depacketizer_sink_first;
		soc_eth_core_mac_depacketizer_sink_d_last <= soc_eth_core_mac_depacketizer_sink_last;
		soc_eth_core_mac_depacketizer_sink_d_payload_data <= soc_eth_core_mac_depacketizer_sink_payload_data;
		soc_eth_core_mac_depacketizer_sink_d_payload_last_be <= soc_eth_core_mac_depacketizer_sink_payload_last_be;
		soc_eth_core_mac_depacketizer_sink_d_payload_error <= soc_eth_core_mac_depacketizer_sink_payload_error;
	end
	vns_liteethudpipcore_liteethmac_liteethmacdepacketizer_state <= vns_liteethudpipcore_liteethmac_liteethmacdepacketizer_next_state;
	if (soc_eth_core_mac_depacketizer_count_liteethmacdepacketizer_next_value_ce0) begin
		soc_eth_core_mac_depacketizer_count <= soc_eth_core_mac_depacketizer_count_liteethmacdepacketizer_next_value0;
	end
	if (soc_eth_core_mac_depacketizer_fsm_from_idle_liteethmacdepacketizer_next_value_ce1) begin
		soc_eth_core_mac_depacketizer_fsm_from_idle <= soc_eth_core_mac_depacketizer_fsm_from_idle_liteethmacdepacketizer_next_value1;
	end
	if (soc_eth_core_arp_tx_counter_reset) begin
		soc_eth_core_arp_tx_counter <= 1'd0;
	end else begin
		if (soc_eth_core_arp_tx_counter_ce) begin
			soc_eth_core_arp_tx_counter <= (soc_eth_core_arp_tx_counter + 1'd1);
		end
	end
	if (soc_eth_core_arp_tx_packetizer_sr_load) begin
		soc_eth_core_arp_tx_packetizer_sr <= soc_eth_core_arp_tx_packetizer_header;
	end
	if (soc_eth_core_arp_tx_packetizer_sr_shift) begin
		soc_eth_core_arp_tx_packetizer_sr <= soc_eth_core_arp_tx_packetizer_sr[223:8];
	end
	if (soc_eth_core_arp_tx_packetizer_source_ready) begin
		soc_eth_core_arp_tx_packetizer_sink_d_valid <= soc_eth_core_arp_tx_packetizer_sink_valid;
		soc_eth_core_arp_tx_packetizer_sink_d_ready <= soc_eth_core_arp_tx_packetizer_sink_ready;
		soc_eth_core_arp_tx_packetizer_sink_d_first <= soc_eth_core_arp_tx_packetizer_sink_first;
		soc_eth_core_arp_tx_packetizer_sink_d_last <= soc_eth_core_arp_tx_packetizer_sink_last;
		soc_eth_core_arp_tx_packetizer_sink_d_payload_data <= soc_eth_core_arp_tx_packetizer_sink_payload_data;
		soc_eth_core_arp_tx_packetizer_sink_d_payload_error <= soc_eth_core_arp_tx_packetizer_sink_payload_error;
		soc_eth_core_arp_tx_packetizer_sink_d_param_hwsize <= soc_eth_core_arp_tx_packetizer_sink_param_hwsize;
		soc_eth_core_arp_tx_packetizer_sink_d_param_hwtype <= soc_eth_core_arp_tx_packetizer_sink_param_hwtype;
		soc_eth_core_arp_tx_packetizer_sink_d_param_opcode <= soc_eth_core_arp_tx_packetizer_sink_param_opcode;
		soc_eth_core_arp_tx_packetizer_sink_d_param_proto <= soc_eth_core_arp_tx_packetizer_sink_param_proto;
		soc_eth_core_arp_tx_packetizer_sink_d_param_protosize <= soc_eth_core_arp_tx_packetizer_sink_param_protosize;
		soc_eth_core_arp_tx_packetizer_sink_d_param_sender_ip <= soc_eth_core_arp_tx_packetizer_sink_param_sender_ip;
		soc_eth_core_arp_tx_packetizer_sink_d_param_sender_mac <= soc_eth_core_arp_tx_packetizer_sink_param_sender_mac;
		soc_eth_core_arp_tx_packetizer_sink_d_param_target_ip <= soc_eth_core_arp_tx_packetizer_sink_param_target_ip;
		soc_eth_core_arp_tx_packetizer_sink_d_param_target_mac <= soc_eth_core_arp_tx_packetizer_sink_param_target_mac;
	end
	vns_liteethudpipcore_liteetharptx_liteetharppacketizer_state <= vns_liteethudpipcore_liteetharptx_liteetharppacketizer_next_state;
	if (soc_eth_core_arp_tx_packetizer_count_liteetharptx_next_value_ce0) begin
		soc_eth_core_arp_tx_packetizer_count <= soc_eth_core_arp_tx_packetizer_count_liteetharptx_next_value0;
	end
	if (soc_eth_core_arp_tx_packetizer_fsm_from_idle_liteetharptx_next_value_ce1) begin
		soc_eth_core_arp_tx_packetizer_fsm_from_idle <= soc_eth_core_arp_tx_packetizer_fsm_from_idle_liteetharptx_next_value1;
	end
	vns_liteethudpipcore_liteetharptx_fsm_state <= vns_liteethudpipcore_liteetharptx_fsm_next_state;
	soc_eth_core_arp_rx_valid <= (((((soc_eth_core_arp_rx_depacketizer_source_valid & (soc_eth_core_arp_rx_depacketizer_source_param_hwtype == 1'd1)) & (soc_eth_core_arp_rx_depacketizer_source_param_proto == 12'd2048)) & (soc_eth_core_arp_rx_depacketizer_source_param_hwsize == 3'd6)) & (soc_eth_core_arp_rx_depacketizer_source_param_protosize == 3'd4)) & (soc_eth_core_arp_rx_depacketizer_source_param_target_ip == 32'd3232235826));
	if (soc_eth_core_arp_rx_depacketizer_sr_shift) begin
		soc_eth_core_arp_rx_depacketizer_sr <= {soc_eth_core_arp_rx_depacketizer_sink_payload_data, soc_eth_core_arp_rx_depacketizer_sr[223:8]};
	end
	if (soc_eth_core_arp_rx_depacketizer_sr_shift_leftover) begin
		soc_eth_core_arp_rx_depacketizer_sr <= {soc_eth_core_arp_rx_depacketizer_sink_payload_data, soc_eth_core_arp_rx_depacketizer_sr[223:0]};
	end
	if ((soc_eth_core_arp_rx_depacketizer_sink_valid & soc_eth_core_arp_rx_depacketizer_sink_ready)) begin
		soc_eth_core_arp_rx_depacketizer_sink_d_valid <= soc_eth_core_arp_rx_depacketizer_sink_valid;
		soc_eth_core_arp_rx_depacketizer_sink_d_ready <= soc_eth_core_arp_rx_depacketizer_sink_ready;
		soc_eth_core_arp_rx_depacketizer_sink_d_first <= soc_eth_core_arp_rx_depacketizer_sink_first;
		soc_eth_core_arp_rx_depacketizer_sink_d_last <= soc_eth_core_arp_rx_depacketizer_sink_last;
		soc_eth_core_arp_rx_depacketizer_sink_d_payload_ethernet_type <= soc_eth_core_arp_rx_depacketizer_sink_payload_ethernet_type;
		soc_eth_core_arp_rx_depacketizer_sink_d_payload_sender_mac <= soc_eth_core_arp_rx_depacketizer_sink_payload_sender_mac;
		soc_eth_core_arp_rx_depacketizer_sink_d_payload_target_mac <= soc_eth_core_arp_rx_depacketizer_sink_payload_target_mac;
		soc_eth_core_arp_rx_depacketizer_sink_d_payload_data <= soc_eth_core_arp_rx_depacketizer_sink_payload_data;
		soc_eth_core_arp_rx_depacketizer_sink_d_payload_last_be <= soc_eth_core_arp_rx_depacketizer_sink_payload_last_be;
		soc_eth_core_arp_rx_depacketizer_sink_d_payload_error <= soc_eth_core_arp_rx_depacketizer_sink_payload_error;
	end
	vns_liteethudpipcore_liteetharprx_liteetharpdepacketizer_state <= vns_liteethudpipcore_liteetharprx_liteetharpdepacketizer_next_state;
	if (soc_eth_core_arp_rx_depacketizer_count_liteetharprx_next_value_ce0) begin
		soc_eth_core_arp_rx_depacketizer_count <= soc_eth_core_arp_rx_depacketizer_count_liteetharprx_next_value0;
	end
	if (soc_eth_core_arp_rx_depacketizer_fsm_from_idle_liteetharprx_next_value_ce1) begin
		soc_eth_core_arp_rx_depacketizer_fsm_from_idle <= soc_eth_core_arp_rx_depacketizer_fsm_from_idle_liteetharprx_next_value1;
	end
	vns_liteethudpipcore_liteetharprx_fsm_state <= vns_liteethudpipcore_liteetharprx_fsm_next_state;
	if (soc_eth_core_arp_table_request_pending_clr) begin
		soc_eth_core_arp_table_request_pending <= 1'd0;
	end else begin
		if (soc_eth_core_arp_table_request_pending_set) begin
			soc_eth_core_arp_table_request_pending <= 1'd1;
		end
	end
	if (soc_eth_core_arp_table_request_ip_address_reset) begin
		soc_eth_core_arp_table_request_ip_address <= 1'd0;
	end else begin
		if (soc_eth_core_arp_table_request_ip_address_update) begin
			soc_eth_core_arp_table_request_ip_address <= soc_eth_core_arp_table_request_payload_ip_address;
		end
	end
	if (soc_eth_core_arp_table_request_counter_reset) begin
		soc_eth_core_arp_table_request_counter <= 1'd0;
	end else begin
		if (soc_eth_core_arp_table_request_counter_ce) begin
			soc_eth_core_arp_table_request_counter <= (soc_eth_core_arp_table_request_counter + 1'd1);
		end
	end
	if (soc_eth_core_arp_table_update) begin
		soc_eth_core_arp_table_cached_valid <= 1'd1;
		soc_eth_core_arp_table_cached_ip_address <= soc_eth_core_arp_table_sink_payload_ip_address;
		soc_eth_core_arp_table_cached_mac_address <= soc_eth_core_arp_table_sink_payload_mac_address;
	end else begin
		if (soc_eth_core_arp_table_cached_timer_done) begin
			soc_eth_core_arp_table_cached_valid <= 1'd0;
		end
	end
	if (soc_eth_core_arp_table_request_timer_wait) begin
		if ((~soc_eth_core_arp_table_request_timer_done)) begin
			soc_eth_core_arp_table_request_timer_count <= (soc_eth_core_arp_table_request_timer_count - 1'd1);
		end
	end else begin
		soc_eth_core_arp_table_request_timer_count <= 24'd13300000;
	end
	if (soc_eth_core_arp_table_cached_timer_wait) begin
		if ((~soc_eth_core_arp_table_cached_timer_done)) begin
			soc_eth_core_arp_table_cached_timer_count <= (soc_eth_core_arp_table_cached_timer_count - 1'd1);
		end
	end else begin
		soc_eth_core_arp_table_cached_timer_count <= 31'd1330000000;
	end
	vns_liteethudpipcore_state <= vns_liteethudpipcore_next_state;
	if (soc_eth_core_arp_table_response_valid) begin
		soc_eth_core_ip_tx_target_mac <= soc_eth_core_arp_table_response_payload_mac_address;
	end
	if (soc_eth_core_ip_tx_ce) begin
		if ((~soc_eth_core_ip_tx_liteethipv4checksum_done)) begin
			soc_eth_core_ip_tx_liteethipv4checksum_r_next0 <= {soc_eth_core_ip_tx_liteethipv4checksum0, (soc_eth_core_ip_tx_liteethipv4checksum_s_next0[15:0] + soc_eth_core_ip_tx_liteethipv4checksum_s_next0[16])};
		end
		if ((~soc_eth_core_ip_tx_liteethipv4checksum_done)) begin
			soc_eth_core_ip_tx_liteethipv4checksum_r_next1 <= {soc_eth_core_ip_tx_liteethipv4checksum1, (soc_eth_core_ip_tx_liteethipv4checksum_s_next1[15:0] + soc_eth_core_ip_tx_liteethipv4checksum_s_next1[16])};
		end
		if ((~soc_eth_core_ip_tx_liteethipv4checksum_done)) begin
			soc_eth_core_ip_tx_liteethipv4checksum_r_next2 <= {soc_eth_core_ip_tx_liteethipv4checksum2, (soc_eth_core_ip_tx_liteethipv4checksum_s_next2[15:0] + soc_eth_core_ip_tx_liteethipv4checksum_s_next2[16])};
		end
		if ((~soc_eth_core_ip_tx_liteethipv4checksum_done)) begin
			soc_eth_core_ip_tx_liteethipv4checksum_r_next3 <= {soc_eth_core_ip_tx_liteethipv4checksum3, (soc_eth_core_ip_tx_liteethipv4checksum_s_next3[15:0] + soc_eth_core_ip_tx_liteethipv4checksum_s_next3[16])};
		end
		if ((~soc_eth_core_ip_tx_liteethipv4checksum_done)) begin
			soc_eth_core_ip_tx_liteethipv4checksum_r_next4 <= {soc_eth_core_ip_tx_liteethipv4checksum4, (soc_eth_core_ip_tx_liteethipv4checksum_s_next4[15:0] + soc_eth_core_ip_tx_liteethipv4checksum_s_next4[16])};
		end
		if ((~soc_eth_core_ip_tx_liteethipv4checksum_done)) begin
			soc_eth_core_ip_tx_liteethipv4checksum_r_next5 <= {soc_eth_core_ip_tx_liteethipv4checksum5, (soc_eth_core_ip_tx_liteethipv4checksum_s_next5[15:0] + soc_eth_core_ip_tx_liteethipv4checksum_s_next5[16])};
		end
		if ((~soc_eth_core_ip_tx_liteethipv4checksum_done)) begin
			soc_eth_core_ip_tx_liteethipv4checksum_r_next6 <= {soc_eth_core_ip_tx_liteethipv4checksum6, (soc_eth_core_ip_tx_liteethipv4checksum_s_next6[15:0] + soc_eth_core_ip_tx_liteethipv4checksum_s_next6[16])};
		end
		if ((~soc_eth_core_ip_tx_liteethipv4checksum_done)) begin
			soc_eth_core_ip_tx_liteethipv4checksum_r_next7 <= {soc_eth_core_ip_tx_liteethipv4checksum7, (soc_eth_core_ip_tx_liteethipv4checksum_s_next7[15:0] + soc_eth_core_ip_tx_liteethipv4checksum_s_next7[16])};
		end
		if ((~soc_eth_core_ip_tx_liteethipv4checksum_done)) begin
			soc_eth_core_ip_tx_liteethipv4checksum_r_next8 <= {soc_eth_core_ip_tx_liteethipv4checksum8, (soc_eth_core_ip_tx_liteethipv4checksum_s_next8[15:0] + soc_eth_core_ip_tx_liteethipv4checksum_s_next8[16])};
		end
		if (soc_eth_core_ip_tx_liteethipv4checksum_counter_ce) begin
			soc_eth_core_ip_tx_liteethipv4checksum_counter <= (soc_eth_core_ip_tx_liteethipv4checksum_counter + 1'd1);
		end
	end
	if (soc_eth_core_ip_tx_reset) begin
		soc_eth_core_ip_tx_liteethipv4checksum_counter <= 4'd0;
	end
	if (soc_eth_core_ip_tx_packetizer_sr_load) begin
		soc_eth_core_ip_tx_packetizer_sr <= soc_eth_core_ip_tx_packetizer_header;
	end
	if (soc_eth_core_ip_tx_packetizer_sr_shift) begin
		soc_eth_core_ip_tx_packetizer_sr <= soc_eth_core_ip_tx_packetizer_sr[159:8];
	end
	if (soc_eth_core_ip_tx_packetizer_source_ready) begin
		soc_eth_core_ip_tx_packetizer_sink_d_valid <= soc_eth_core_ip_tx_packetizer_sink_valid;
		soc_eth_core_ip_tx_packetizer_sink_d_ready <= soc_eth_core_ip_tx_packetizer_sink_ready;
		soc_eth_core_ip_tx_packetizer_sink_d_first <= soc_eth_core_ip_tx_packetizer_sink_first;
		soc_eth_core_ip_tx_packetizer_sink_d_last <= soc_eth_core_ip_tx_packetizer_sink_last;
		soc_eth_core_ip_tx_packetizer_sink_d_payload_data <= soc_eth_core_ip_tx_packetizer_sink_payload_data;
		soc_eth_core_ip_tx_packetizer_sink_d_payload_error <= soc_eth_core_ip_tx_packetizer_sink_payload_error;
		soc_eth_core_ip_tx_packetizer_sink_d_param_checksum <= soc_eth_core_ip_tx_packetizer_sink_param_checksum;
		soc_eth_core_ip_tx_packetizer_sink_d_param_identification <= soc_eth_core_ip_tx_packetizer_sink_param_identification;
		soc_eth_core_ip_tx_packetizer_sink_d_param_ihl <= soc_eth_core_ip_tx_packetizer_sink_param_ihl;
		soc_eth_core_ip_tx_packetizer_sink_d_param_protocol <= soc_eth_core_ip_tx_packetizer_sink_param_protocol;
		soc_eth_core_ip_tx_packetizer_sink_d_param_sender_ip <= soc_eth_core_ip_tx_packetizer_sink_param_sender_ip;
		soc_eth_core_ip_tx_packetizer_sink_d_param_target_ip <= soc_eth_core_ip_tx_packetizer_sink_param_target_ip;
		soc_eth_core_ip_tx_packetizer_sink_d_param_total_length <= soc_eth_core_ip_tx_packetizer_sink_param_total_length;
		soc_eth_core_ip_tx_packetizer_sink_d_param_ttl <= soc_eth_core_ip_tx_packetizer_sink_param_ttl;
		soc_eth_core_ip_tx_packetizer_sink_d_param_version <= soc_eth_core_ip_tx_packetizer_sink_param_version;
	end
	vns_liteethudpipcore_liteethip_liteethiptx_liteethipv4packetizer_state <= vns_liteethudpipcore_liteethip_liteethiptx_liteethipv4packetizer_next_state;
	if (soc_eth_core_ip_tx_packetizer_count_liteethiptx_next_value_ce0) begin
		soc_eth_core_ip_tx_packetizer_count <= soc_eth_core_ip_tx_packetizer_count_liteethiptx_next_value0;
	end
	if (soc_eth_core_ip_tx_packetizer_fsm_from_idle_liteethiptx_next_value_ce1) begin
		soc_eth_core_ip_tx_packetizer_fsm_from_idle <= soc_eth_core_ip_tx_packetizer_fsm_from_idle_liteethiptx_next_value1;
	end
	vns_liteethudpipcore_liteethip_liteethiptx_fsm_state <= vns_liteethudpipcore_liteethip_liteethiptx_fsm_next_state;
	soc_eth_core_ip_rx_valid <= ((((soc_eth_core_ip_rx_depacketizer_source_valid & (soc_eth_core_ip_rx_depacketizer_source_param_target_ip == 32'd3232235826)) & (soc_eth_core_ip_rx_depacketizer_source_param_version == 3'd4)) & (soc_eth_core_ip_rx_depacketizer_source_param_ihl == 3'd5)) & (soc_eth_core_ip_rx_liteethipv4checksum_value == 1'd0));
	if (soc_eth_core_ip_rx_depacketizer_sr_shift) begin
		soc_eth_core_ip_rx_depacketizer_sr <= {soc_eth_core_ip_rx_depacketizer_sink_payload_data, soc_eth_core_ip_rx_depacketizer_sr[159:8]};
	end
	if (soc_eth_core_ip_rx_depacketizer_sr_shift_leftover) begin
		soc_eth_core_ip_rx_depacketizer_sr <= {soc_eth_core_ip_rx_depacketizer_sink_payload_data, soc_eth_core_ip_rx_depacketizer_sr[159:0]};
	end
	if ((soc_eth_core_ip_rx_depacketizer_sink_valid & soc_eth_core_ip_rx_depacketizer_sink_ready)) begin
		soc_eth_core_ip_rx_depacketizer_sink_d_valid <= soc_eth_core_ip_rx_depacketizer_sink_valid;
		soc_eth_core_ip_rx_depacketizer_sink_d_ready <= soc_eth_core_ip_rx_depacketizer_sink_ready;
		soc_eth_core_ip_rx_depacketizer_sink_d_first <= soc_eth_core_ip_rx_depacketizer_sink_first;
		soc_eth_core_ip_rx_depacketizer_sink_d_last <= soc_eth_core_ip_rx_depacketizer_sink_last;
		soc_eth_core_ip_rx_depacketizer_sink_d_payload_ethernet_type <= soc_eth_core_ip_rx_depacketizer_sink_payload_ethernet_type;
		soc_eth_core_ip_rx_depacketizer_sink_d_payload_sender_mac <= soc_eth_core_ip_rx_depacketizer_sink_payload_sender_mac;
		soc_eth_core_ip_rx_depacketizer_sink_d_payload_target_mac <= soc_eth_core_ip_rx_depacketizer_sink_payload_target_mac;
		soc_eth_core_ip_rx_depacketizer_sink_d_payload_data <= soc_eth_core_ip_rx_depacketizer_sink_payload_data;
		soc_eth_core_ip_rx_depacketizer_sink_d_payload_last_be <= soc_eth_core_ip_rx_depacketizer_sink_payload_last_be;
		soc_eth_core_ip_rx_depacketizer_sink_d_payload_error <= soc_eth_core_ip_rx_depacketizer_sink_payload_error;
	end
	vns_liteethudpipcore_liteethip_liteethiprx_liteethipv4depacketizer_state <= vns_liteethudpipcore_liteethip_liteethiprx_liteethipv4depacketizer_next_state;
	if (soc_eth_core_ip_rx_depacketizer_count_liteethiprx_next_value_ce0) begin
		soc_eth_core_ip_rx_depacketizer_count <= soc_eth_core_ip_rx_depacketizer_count_liteethiprx_next_value0;
	end
	if (soc_eth_core_ip_rx_depacketizer_fsm_from_idle_liteethiprx_next_value_ce1) begin
		soc_eth_core_ip_rx_depacketizer_fsm_from_idle <= soc_eth_core_ip_rx_depacketizer_fsm_from_idle_liteethiprx_next_value1;
	end
	if (soc_eth_core_ip_rx_ce) begin
		if ((~soc_eth_core_ip_rx_liteethipv4checksum_done)) begin
			soc_eth_core_ip_rx_liteethipv4checksum_r_next0 <= {soc_eth_core_ip_rx_liteethipv4checksum0, (soc_eth_core_ip_rx_liteethipv4checksum_s_next0[15:0] + soc_eth_core_ip_rx_liteethipv4checksum_s_next0[16])};
		end
		if ((~soc_eth_core_ip_rx_liteethipv4checksum_done)) begin
			soc_eth_core_ip_rx_liteethipv4checksum_r_next1 <= {soc_eth_core_ip_rx_liteethipv4checksum1, (soc_eth_core_ip_rx_liteethipv4checksum_s_next1[15:0] + soc_eth_core_ip_rx_liteethipv4checksum_s_next1[16])};
		end
		if ((~soc_eth_core_ip_rx_liteethipv4checksum_done)) begin
			soc_eth_core_ip_rx_liteethipv4checksum_r_next2 <= {soc_eth_core_ip_rx_liteethipv4checksum2, (soc_eth_core_ip_rx_liteethipv4checksum_s_next2[15:0] + soc_eth_core_ip_rx_liteethipv4checksum_s_next2[16])};
		end
		if ((~soc_eth_core_ip_rx_liteethipv4checksum_done)) begin
			soc_eth_core_ip_rx_liteethipv4checksum_r_next3 <= {soc_eth_core_ip_rx_liteethipv4checksum3, (soc_eth_core_ip_rx_liteethipv4checksum_s_next3[15:0] + soc_eth_core_ip_rx_liteethipv4checksum_s_next3[16])};
		end
		if ((~soc_eth_core_ip_rx_liteethipv4checksum_done)) begin
			soc_eth_core_ip_rx_liteethipv4checksum_r_next4 <= {soc_eth_core_ip_rx_liteethipv4checksum4, (soc_eth_core_ip_rx_liteethipv4checksum_s_next4[15:0] + soc_eth_core_ip_rx_liteethipv4checksum_s_next4[16])};
		end
		if ((~soc_eth_core_ip_rx_liteethipv4checksum_done)) begin
			soc_eth_core_ip_rx_liteethipv4checksum_r_next5 <= {soc_eth_core_ip_rx_liteethipv4checksum5, (soc_eth_core_ip_rx_liteethipv4checksum_s_next5[15:0] + soc_eth_core_ip_rx_liteethipv4checksum_s_next5[16])};
		end
		if ((~soc_eth_core_ip_rx_liteethipv4checksum_done)) begin
			soc_eth_core_ip_rx_liteethipv4checksum_r_next6 <= {soc_eth_core_ip_rx_liteethipv4checksum6, (soc_eth_core_ip_rx_liteethipv4checksum_s_next6[15:0] + soc_eth_core_ip_rx_liteethipv4checksum_s_next6[16])};
		end
		if ((~soc_eth_core_ip_rx_liteethipv4checksum_done)) begin
			soc_eth_core_ip_rx_liteethipv4checksum_r_next7 <= {soc_eth_core_ip_rx_liteethipv4checksum7, (soc_eth_core_ip_rx_liteethipv4checksum_s_next7[15:0] + soc_eth_core_ip_rx_liteethipv4checksum_s_next7[16])};
		end
		if ((~soc_eth_core_ip_rx_liteethipv4checksum_done)) begin
			soc_eth_core_ip_rx_liteethipv4checksum_r_next8 <= {soc_eth_core_ip_rx_liteethipv4checksum8, (soc_eth_core_ip_rx_liteethipv4checksum_s_next8[15:0] + soc_eth_core_ip_rx_liteethipv4checksum_s_next8[16])};
		end
		if ((~soc_eth_core_ip_rx_liteethipv4checksum_done)) begin
			soc_eth_core_ip_rx_liteethipv4checksum_r_next9 <= {soc_eth_core_ip_rx_liteethipv4checksum9, (soc_eth_core_ip_rx_liteethipv4checksum_s_next9[15:0] + soc_eth_core_ip_rx_liteethipv4checksum_s_next9[16])};
		end
		if (soc_eth_core_ip_rx_liteethipv4checksum_counter_ce) begin
			soc_eth_core_ip_rx_liteethipv4checksum_counter <= (soc_eth_core_ip_rx_liteethipv4checksum_counter + 1'd1);
		end
	end
	if (soc_eth_core_ip_rx_reset) begin
		soc_eth_core_ip_rx_liteethipv4checksum_counter <= 4'd0;
	end
	vns_liteethudpipcore_liteethip_liteethiprx_fsm_state <= vns_liteethudpipcore_liteethip_liteethiprx_fsm_next_state;
	case (vns_liteethudpipcore_liteethip_grant)
		1'd0: begin
			if ((~vns_liteethudpipcore_liteethip_request[0])) begin
				if (vns_liteethudpipcore_liteethip_request[1]) begin
					vns_liteethudpipcore_liteethip_grant <= 1'd1;
				end
			end
		end
		1'd1: begin
			if ((~vns_liteethudpipcore_liteethip_request[1])) begin
				if (vns_liteethudpipcore_liteethip_request[0]) begin
					vns_liteethudpipcore_liteethip_grant <= 1'd0;
				end
			end
		end
	endcase
	vns_liteethudpipcore_liteethip_status0_ongoing1 <= ((soc_eth_core_icmp_sink_valid | vns_liteethudpipcore_liteethip_status0_ongoing1) & (~vns_liteethudpipcore_liteethip_status0_last));
	if (vns_liteethudpipcore_liteethip_status0_last) begin
		vns_liteethudpipcore_liteethip_status0_first <= 1'd1;
	end else begin
		if ((soc_eth_core_icmp_sink_valid & soc_eth_core_icmp_sink_ready)) begin
			vns_liteethudpipcore_liteethip_status0_first <= 1'd0;
		end
	end
	vns_liteethudpipcore_liteethip_status1_ongoing1 <= ((soc_eth_core_ip_port_sink_valid | vns_liteethudpipcore_liteethip_status1_ongoing1) & (~vns_liteethudpipcore_liteethip_status1_last));
	if (vns_liteethudpipcore_liteethip_status1_last) begin
		vns_liteethudpipcore_liteethip_status1_first <= 1'd1;
	end else begin
		if ((soc_eth_core_ip_port_sink_valid & soc_eth_core_ip_port_sink_ready)) begin
			vns_liteethudpipcore_liteethip_status1_first <= 1'd0;
		end
	end
	if (vns_liteethudpipcore_liteethip_first) begin
		vns_liteethudpipcore_liteethip_sel_ongoing <= vns_liteethudpipcore_liteethip_sel0;
	end
	vns_liteethudpipcore_liteethip_ongoing1 <= ((soc_eth_core_ip_crossbar_sink_valid | vns_liteethudpipcore_liteethip_ongoing1) & (~vns_liteethudpipcore_liteethip_last));
	if (vns_liteethudpipcore_liteethip_last) begin
		vns_liteethudpipcore_liteethip_first <= 1'd1;
	end else begin
		if ((soc_eth_core_ip_crossbar_sink_valid & soc_eth_core_ip_crossbar_sink_ready)) begin
			vns_liteethudpipcore_liteethip_first <= 1'd0;
		end
	end
	if (soc_eth_core_icmp_tx_packetizer_sr_load) begin
		soc_eth_core_icmp_tx_packetizer_sr <= soc_eth_core_icmp_tx_packetizer_header;
	end
	if (soc_eth_core_icmp_tx_packetizer_sr_shift) begin
		soc_eth_core_icmp_tx_packetizer_sr <= soc_eth_core_icmp_tx_packetizer_sr[63:8];
	end
	if (soc_eth_core_icmp_tx_packetizer_source_ready) begin
		soc_eth_core_icmp_tx_packetizer_sink_d_valid <= soc_eth_core_icmp_tx_packetizer_sink_valid;
		soc_eth_core_icmp_tx_packetizer_sink_d_ready <= soc_eth_core_icmp_tx_packetizer_sink_ready;
		soc_eth_core_icmp_tx_packetizer_sink_d_first <= soc_eth_core_icmp_tx_packetizer_sink_first;
		soc_eth_core_icmp_tx_packetizer_sink_d_last <= soc_eth_core_icmp_tx_packetizer_sink_last;
		soc_eth_core_icmp_tx_packetizer_sink_d_payload_data <= soc_eth_core_icmp_tx_packetizer_sink_payload_data;
		soc_eth_core_icmp_tx_packetizer_sink_d_payload_error <= soc_eth_core_icmp_tx_packetizer_sink_payload_error;
		soc_eth_core_icmp_tx_packetizer_sink_d_param_checksum <= soc_eth_core_icmp_tx_packetizer_sink_param_checksum;
		soc_eth_core_icmp_tx_packetizer_sink_d_param_code <= soc_eth_core_icmp_tx_packetizer_sink_param_code;
		soc_eth_core_icmp_tx_packetizer_sink_d_param_msgtype <= soc_eth_core_icmp_tx_packetizer_sink_param_msgtype;
		soc_eth_core_icmp_tx_packetizer_sink_d_param_quench <= soc_eth_core_icmp_tx_packetizer_sink_param_quench;
	end
	vns_liteethudpipcore_liteethicmptx_liteethicmppacketizer_state <= vns_liteethudpipcore_liteethicmptx_liteethicmppacketizer_next_state;
	if (soc_eth_core_icmp_tx_packetizer_count_liteethicmptx_next_value_ce0) begin
		soc_eth_core_icmp_tx_packetizer_count <= soc_eth_core_icmp_tx_packetizer_count_liteethicmptx_next_value0;
	end
	if (soc_eth_core_icmp_tx_packetizer_fsm_from_idle_liteethicmptx_next_value_ce1) begin
		soc_eth_core_icmp_tx_packetizer_fsm_from_idle <= soc_eth_core_icmp_tx_packetizer_fsm_from_idle_liteethicmptx_next_value1;
	end
	vns_liteethudpipcore_liteethicmptx_fsm_state <= vns_liteethudpipcore_liteethicmptx_fsm_next_state;
	soc_eth_core_icmp_rx_valid <= (soc_eth_core_icmp_rx_depacketizer_source_valid & (soc_eth_core_icmp_rx_sink_sink_param_protocol == 1'd1));
	if (soc_eth_core_icmp_rx_depacketizer_sr_shift) begin
		soc_eth_core_icmp_rx_depacketizer_sr <= {soc_eth_core_icmp_rx_depacketizer_sink_payload_data, soc_eth_core_icmp_rx_depacketizer_sr[63:8]};
	end
	if (soc_eth_core_icmp_rx_depacketizer_sr_shift_leftover) begin
		soc_eth_core_icmp_rx_depacketizer_sr <= {soc_eth_core_icmp_rx_depacketizer_sink_payload_data, soc_eth_core_icmp_rx_depacketizer_sr[63:0]};
	end
	if ((soc_eth_core_icmp_rx_depacketizer_sink_valid & soc_eth_core_icmp_rx_depacketizer_sink_ready)) begin
		soc_eth_core_icmp_rx_depacketizer_sink_d_valid <= soc_eth_core_icmp_rx_depacketizer_sink_valid;
		soc_eth_core_icmp_rx_depacketizer_sink_d_ready <= soc_eth_core_icmp_rx_depacketizer_sink_ready;
		soc_eth_core_icmp_rx_depacketizer_sink_d_first <= soc_eth_core_icmp_rx_depacketizer_sink_first;
		soc_eth_core_icmp_rx_depacketizer_sink_d_last <= soc_eth_core_icmp_rx_depacketizer_sink_last;
		soc_eth_core_icmp_rx_depacketizer_sink_d_payload_data <= soc_eth_core_icmp_rx_depacketizer_sink_payload_data;
		soc_eth_core_icmp_rx_depacketizer_sink_d_payload_error <= soc_eth_core_icmp_rx_depacketizer_sink_payload_error;
		soc_eth_core_icmp_rx_depacketizer_sink_d_param_length <= soc_eth_core_icmp_rx_depacketizer_sink_param_length;
		soc_eth_core_icmp_rx_depacketizer_sink_d_param_protocol <= soc_eth_core_icmp_rx_depacketizer_sink_param_protocol;
		soc_eth_core_icmp_rx_depacketizer_sink_d_param_ip_address <= soc_eth_core_icmp_rx_depacketizer_sink_param_ip_address;
	end
	vns_liteethudpipcore_liteethicmprx_liteethicmpdepacketizer_state <= vns_liteethudpipcore_liteethicmprx_liteethicmpdepacketizer_next_state;
	if (soc_eth_core_icmp_rx_depacketizer_count_liteethicmprx_next_value_ce0) begin
		soc_eth_core_icmp_rx_depacketizer_count <= soc_eth_core_icmp_rx_depacketizer_count_liteethicmprx_next_value0;
	end
	if (soc_eth_core_icmp_rx_depacketizer_fsm_from_idle_liteethicmprx_next_value_ce1) begin
		soc_eth_core_icmp_rx_depacketizer_fsm_from_idle <= soc_eth_core_icmp_rx_depacketizer_fsm_from_idle_liteethicmprx_next_value1;
	end
	vns_liteethudpipcore_liteethicmprx_fsm_state <= vns_liteethudpipcore_liteethicmprx_fsm_next_state;
	if (soc_eth_core_icmp_echo_buffer_syncfifo_re) begin
		soc_eth_core_icmp_echo_buffer_readable <= 1'd1;
	end else begin
		if (soc_eth_core_icmp_echo_buffer_re) begin
			soc_eth_core_icmp_echo_buffer_readable <= 1'd0;
		end
	end
	if (((soc_eth_core_icmp_echo_buffer_syncfifo_we & soc_eth_core_icmp_echo_buffer_syncfifo_writable) & (~soc_eth_core_icmp_echo_buffer_replace))) begin
		soc_eth_core_icmp_echo_buffer_produce <= (soc_eth_core_icmp_echo_buffer_produce + 1'd1);
	end
	if (soc_eth_core_icmp_echo_buffer_do_read) begin
		soc_eth_core_icmp_echo_buffer_consume <= (soc_eth_core_icmp_echo_buffer_consume + 1'd1);
	end
	if (((soc_eth_core_icmp_echo_buffer_syncfifo_we & soc_eth_core_icmp_echo_buffer_syncfifo_writable) & (~soc_eth_core_icmp_echo_buffer_replace))) begin
		if ((~soc_eth_core_icmp_echo_buffer_do_read)) begin
			soc_eth_core_icmp_echo_buffer_level0 <= (soc_eth_core_icmp_echo_buffer_level0 + 1'd1);
		end
	end else begin
		if (soc_eth_core_icmp_echo_buffer_do_read) begin
			soc_eth_core_icmp_echo_buffer_level0 <= (soc_eth_core_icmp_echo_buffer_level0 - 1'd1);
		end
	end
	if (soc_eth_core_tx_packetizer_sr_load) begin
		soc_eth_core_tx_packetizer_sr <= soc_eth_core_tx_packetizer_header;
	end
	if (soc_eth_core_tx_packetizer_sr_shift) begin
		soc_eth_core_tx_packetizer_sr <= soc_eth_core_tx_packetizer_sr[63:8];
	end
	if (soc_eth_core_tx_packetizer_source_ready) begin
		soc_eth_core_tx_packetizer_sink_d_valid <= soc_eth_core_tx_packetizer_sink_valid;
		soc_eth_core_tx_packetizer_sink_d_ready <= soc_eth_core_tx_packetizer_sink_ready;
		soc_eth_core_tx_packetizer_sink_d_first <= soc_eth_core_tx_packetizer_sink_first;
		soc_eth_core_tx_packetizer_sink_d_last <= soc_eth_core_tx_packetizer_sink_last;
		soc_eth_core_tx_packetizer_sink_d_payload_data <= soc_eth_core_tx_packetizer_sink_payload_data;
		soc_eth_core_tx_packetizer_sink_d_payload_error <= soc_eth_core_tx_packetizer_sink_payload_error;
		soc_eth_core_tx_packetizer_sink_d_param_checksum <= soc_eth_core_tx_packetizer_sink_param_checksum;
		soc_eth_core_tx_packetizer_sink_d_param_dst_port <= soc_eth_core_tx_packetizer_sink_param_dst_port;
		soc_eth_core_tx_packetizer_sink_d_param_length <= soc_eth_core_tx_packetizer_sink_param_length;
		soc_eth_core_tx_packetizer_sink_d_param_src_port <= soc_eth_core_tx_packetizer_sink_param_src_port;
	end
	vns_liteethudpipcore_liteethudp_liteethudptx_liteethudppacketizer_state <= vns_liteethudpipcore_liteethudp_liteethudptx_liteethudppacketizer_next_state;
	if (soc_eth_core_tx_packetizer_count_liteethudptx_next_value_ce0) begin
		soc_eth_core_tx_packetizer_count <= soc_eth_core_tx_packetizer_count_liteethudptx_next_value0;
	end
	if (soc_eth_core_tx_packetizer_fsm_from_idle_liteethudptx_next_value_ce1) begin
		soc_eth_core_tx_packetizer_fsm_from_idle <= soc_eth_core_tx_packetizer_fsm_from_idle_liteethudptx_next_value1;
	end
	vns_liteethudpipcore_liteethudp_liteethudptx_fsm_state <= vns_liteethudpipcore_liteethudp_liteethudptx_fsm_next_state;
	soc_eth_core_rx_valid <= (soc_eth_core_rx_depacketizer_source_valid & (soc_eth_core_rx_sink_sink_param_protocol == 5'd17));
	if (soc_eth_core_rx_depacketizer_sr_shift) begin
		soc_eth_core_rx_depacketizer_sr <= {soc_eth_core_rx_depacketizer_sink_payload_data, soc_eth_core_rx_depacketizer_sr[63:8]};
	end
	if (soc_eth_core_rx_depacketizer_sr_shift_leftover) begin
		soc_eth_core_rx_depacketizer_sr <= {soc_eth_core_rx_depacketizer_sink_payload_data, soc_eth_core_rx_depacketizer_sr[63:0]};
	end
	if ((soc_eth_core_rx_depacketizer_sink_valid & soc_eth_core_rx_depacketizer_sink_ready)) begin
		soc_eth_core_rx_depacketizer_sink_d_valid <= soc_eth_core_rx_depacketizer_sink_valid;
		soc_eth_core_rx_depacketizer_sink_d_ready <= soc_eth_core_rx_depacketizer_sink_ready;
		soc_eth_core_rx_depacketizer_sink_d_first <= soc_eth_core_rx_depacketizer_sink_first;
		soc_eth_core_rx_depacketizer_sink_d_last <= soc_eth_core_rx_depacketizer_sink_last;
		soc_eth_core_rx_depacketizer_sink_d_payload_data <= soc_eth_core_rx_depacketizer_sink_payload_data;
		soc_eth_core_rx_depacketizer_sink_d_payload_error <= soc_eth_core_rx_depacketizer_sink_payload_error;
		soc_eth_core_rx_depacketizer_sink_d_param_length <= soc_eth_core_rx_depacketizer_sink_param_length;
		soc_eth_core_rx_depacketizer_sink_d_param_protocol <= soc_eth_core_rx_depacketizer_sink_param_protocol;
		soc_eth_core_rx_depacketizer_sink_d_param_ip_address <= soc_eth_core_rx_depacketizer_sink_param_ip_address;
	end
	vns_liteethudpipcore_liteethudp_liteethudprx_liteethudpdepacketizer_state <= vns_liteethudpipcore_liteethudp_liteethudprx_liteethudpdepacketizer_next_state;
	if (soc_eth_core_rx_depacketizer_count_liteethudprx_next_value_ce0) begin
		soc_eth_core_rx_depacketizer_count <= soc_eth_core_rx_depacketizer_count_liteethudprx_next_value0;
	end
	if (soc_eth_core_rx_depacketizer_fsm_from_idle_liteethudprx_next_value_ce1) begin
		soc_eth_core_rx_depacketizer_fsm_from_idle <= soc_eth_core_rx_depacketizer_fsm_from_idle_liteethudprx_next_value1;
	end
	vns_liteethudpipcore_liteethudp_liteethudprx_fsm_state <= vns_liteethudpipcore_liteethudp_liteethudprx_fsm_next_state;
	if ((soc_etherbone_tx_converter_converter_source_valid & soc_etherbone_tx_converter_converter_source_ready)) begin
		if (soc_etherbone_tx_converter_converter_last) begin
			soc_etherbone_tx_converter_converter_mux <= 1'd0;
		end else begin
			soc_etherbone_tx_converter_converter_mux <= (soc_etherbone_tx_converter_converter_mux + 1'd1);
		end
	end
	soc_etherbone_rx_converter_source_param_src_port <= soc_etherbone_rx_converter_sink_param_src_port;
	soc_etherbone_rx_converter_source_param_dst_port <= soc_etherbone_rx_converter_sink_param_dst_port;
	soc_etherbone_rx_converter_source_param_ip_address <= soc_etherbone_rx_converter_sink_param_ip_address;
	soc_etherbone_rx_converter_source_param_length <= soc_etherbone_rx_converter_sink_param_length;
	if (soc_etherbone_rx_converter_converter_source_ready) begin
		soc_etherbone_rx_converter_converter_strobe_all <= 1'd0;
	end
	if (soc_etherbone_rx_converter_converter_load_part) begin
		if (((soc_etherbone_rx_converter_converter_demux == 2'd3) | soc_etherbone_rx_converter_converter_sink_last)) begin
			soc_etherbone_rx_converter_converter_demux <= 1'd0;
			soc_etherbone_rx_converter_converter_strobe_all <= 1'd1;
		end else begin
			soc_etherbone_rx_converter_converter_demux <= (soc_etherbone_rx_converter_converter_demux + 1'd1);
		end
	end
	if ((soc_etherbone_rx_converter_converter_source_valid & soc_etherbone_rx_converter_converter_source_ready)) begin
		if ((soc_etherbone_rx_converter_converter_sink_valid & soc_etherbone_rx_converter_converter_sink_ready)) begin
			soc_etherbone_rx_converter_converter_source_first <= soc_etherbone_rx_converter_converter_sink_first;
			soc_etherbone_rx_converter_converter_source_last <= soc_etherbone_rx_converter_converter_sink_last;
		end else begin
			soc_etherbone_rx_converter_converter_source_first <= 1'd0;
			soc_etherbone_rx_converter_converter_source_last <= 1'd0;
		end
	end else begin
		if ((soc_etherbone_rx_converter_converter_sink_valid & soc_etherbone_rx_converter_converter_sink_ready)) begin
			soc_etherbone_rx_converter_converter_source_first <= (soc_etherbone_rx_converter_converter_sink_first | soc_etherbone_rx_converter_converter_source_first);
			soc_etherbone_rx_converter_converter_source_last <= (soc_etherbone_rx_converter_converter_sink_last | soc_etherbone_rx_converter_converter_source_last);
		end
	end
	if (soc_etherbone_rx_converter_converter_load_part) begin
		case (soc_etherbone_rx_converter_converter_demux)
			1'd0: begin
				soc_etherbone_rx_converter_converter_source_payload_data[8:0] <= soc_etherbone_rx_converter_converter_sink_payload_data;
			end
			1'd1: begin
				soc_etherbone_rx_converter_converter_source_payload_data[17:9] <= soc_etherbone_rx_converter_converter_sink_payload_data;
			end
			2'd2: begin
				soc_etherbone_rx_converter_converter_source_payload_data[26:18] <= soc_etherbone_rx_converter_converter_sink_payload_data;
			end
			2'd3: begin
				soc_etherbone_rx_converter_converter_source_payload_data[35:27] <= soc_etherbone_rx_converter_converter_sink_payload_data;
			end
		endcase
	end
	if (soc_etherbone_rx_converter_converter_load_part) begin
		soc_etherbone_rx_converter_converter_source_payload_valid_token_count <= (soc_etherbone_rx_converter_converter_demux + 1'd1);
	end
	if (soc_etherbone_tx_packetizer_sr_load) begin
		soc_etherbone_tx_packetizer_sr <= soc_etherbone_tx_packetizer_header;
	end
	if (soc_etherbone_tx_packetizer_sr_shift) begin
		soc_etherbone_tx_packetizer_sr <= soc_etherbone_tx_packetizer_sr[63:32];
	end
	if (soc_etherbone_tx_packetizer_source_ready) begin
		soc_etherbone_tx_packetizer_sink_d_valid <= soc_etherbone_tx_packetizer_sink_valid;
		soc_etherbone_tx_packetizer_sink_d_ready <= soc_etherbone_tx_packetizer_sink_ready;
		soc_etherbone_tx_packetizer_sink_d_first <= soc_etherbone_tx_packetizer_sink_first;
		soc_etherbone_tx_packetizer_sink_d_last <= soc_etherbone_tx_packetizer_sink_last;
		soc_etherbone_tx_packetizer_sink_d_payload_data <= soc_etherbone_tx_packetizer_sink_payload_data;
		soc_etherbone_tx_packetizer_sink_d_payload_error <= soc_etherbone_tx_packetizer_sink_payload_error;
		soc_etherbone_tx_packetizer_sink_d_param_addr_size <= soc_etherbone_tx_packetizer_sink_param_addr_size;
		soc_etherbone_tx_packetizer_sink_d_param_magic <= soc_etherbone_tx_packetizer_sink_param_magic;
		soc_etherbone_tx_packetizer_sink_d_param_nr <= soc_etherbone_tx_packetizer_sink_param_nr;
		soc_etherbone_tx_packetizer_sink_d_param_pf <= soc_etherbone_tx_packetizer_sink_param_pf;
		soc_etherbone_tx_packetizer_sink_d_param_port_size <= soc_etherbone_tx_packetizer_sink_param_port_size;
		soc_etherbone_tx_packetizer_sink_d_param_pr <= soc_etherbone_tx_packetizer_sink_param_pr;
		soc_etherbone_tx_packetizer_sink_d_param_version <= soc_etherbone_tx_packetizer_sink_param_version;
	end
	vns_liteethetherbonepackettx_liteethetherbonepacketpacketizer_state <= vns_liteethetherbonepackettx_liteethetherbonepacketpacketizer_next_state;
	if (soc_etherbone_tx_packetizer_count_liteethetherbonepackettx_next_value_ce0) begin
		soc_etherbone_tx_packetizer_count <= soc_etherbone_tx_packetizer_count_liteethetherbonepackettx_next_value0;
	end
	if (soc_etherbone_tx_packetizer_fsm_from_idle_liteethetherbonepackettx_next_value_ce1) begin
		soc_etherbone_tx_packetizer_fsm_from_idle <= soc_etherbone_tx_packetizer_fsm_from_idle_liteethetherbonepackettx_next_value1;
	end
	vns_liteethetherbonepackettx_fsm_state <= vns_liteethetherbonepackettx_fsm_next_state;
	soc_etherbone_rx_valid <= (soc_etherbone_rx_depacketizer_source_valid & (soc_etherbone_rx_depacketizer_source_param_magic == 15'd20079));
	if (soc_etherbone_rx_depacketizer_sr_shift) begin
		soc_etherbone_rx_depacketizer_sr <= {soc_etherbone_rx_depacketizer_sink_payload_data, soc_etherbone_rx_depacketizer_sr[63:32]};
	end
	if (soc_etherbone_rx_depacketizer_sr_shift_leftover) begin
		soc_etherbone_rx_depacketizer_sr <= {soc_etherbone_rx_depacketizer_sink_payload_data, soc_etherbone_rx_depacketizer_sr[63:0]};
	end
	if ((soc_etherbone_rx_depacketizer_sink_valid & soc_etherbone_rx_depacketizer_sink_ready)) begin
		soc_etherbone_rx_depacketizer_sink_d_valid <= soc_etherbone_rx_depacketizer_sink_valid;
		soc_etherbone_rx_depacketizer_sink_d_ready <= soc_etherbone_rx_depacketizer_sink_ready;
		soc_etherbone_rx_depacketizer_sink_d_first <= soc_etherbone_rx_depacketizer_sink_first;
		soc_etherbone_rx_depacketizer_sink_d_last <= soc_etherbone_rx_depacketizer_sink_last;
		soc_etherbone_rx_depacketizer_sink_d_payload_data <= soc_etherbone_rx_depacketizer_sink_payload_data;
		soc_etherbone_rx_depacketizer_sink_d_payload_error <= soc_etherbone_rx_depacketizer_sink_payload_error;
		soc_etherbone_rx_depacketizer_sink_d_param_src_port <= soc_etherbone_rx_depacketizer_sink_param_src_port;
		soc_etherbone_rx_depacketizer_sink_d_param_dst_port <= soc_etherbone_rx_depacketizer_sink_param_dst_port;
		soc_etherbone_rx_depacketizer_sink_d_param_ip_address <= soc_etherbone_rx_depacketizer_sink_param_ip_address;
		soc_etherbone_rx_depacketizer_sink_d_param_length <= soc_etherbone_rx_depacketizer_sink_param_length;
	end
	vns_liteethetherbonepacketrx_liteethetherbonepacketdepacketizer_state <= vns_liteethetherbonepacketrx_liteethetherbonepacketdepacketizer_next_state;
	if (soc_etherbone_rx_depacketizer_count_liteethetherbonepacketrx_next_value_ce0) begin
		soc_etherbone_rx_depacketizer_count <= soc_etherbone_rx_depacketizer_count_liteethetherbonepacketrx_next_value0;
	end
	if (soc_etherbone_rx_depacketizer_fsm_from_idle_liteethetherbonepacketrx_next_value_ce1) begin
		soc_etherbone_rx_depacketizer_fsm_from_idle <= soc_etherbone_rx_depacketizer_fsm_from_idle_liteethetherbonepacketrx_next_value1;
	end
	vns_liteethetherbonepacketrx_fsm_state <= vns_liteethetherbonepacketrx_fsm_next_state;
	vns_liteethetherboneprobe_state <= vns_liteethetherboneprobe_next_state;
	if ((soc_etherbone_record_sink_sink_valid & soc_etherbone_record_sink_sink_ready)) begin
		if (soc_etherbone_record_first) begin
			soc_etherbone_record_last_ip_address <= soc_etherbone_record_sink_sink_param_ip_address;
		end
		soc_etherbone_record_first <= soc_etherbone_record_sink_sink_last;
	end
	if (soc_etherbone_record_depacketizer_sr_shift) begin
		soc_etherbone_record_depacketizer_sr <= soc_etherbone_record_depacketizer_sink_payload_data;
	end
	if ((soc_etherbone_record_depacketizer_sink_valid & soc_etherbone_record_depacketizer_sink_ready)) begin
		soc_etherbone_record_depacketizer_sink_d_valid <= soc_etherbone_record_depacketizer_sink_valid;
		soc_etherbone_record_depacketizer_sink_d_ready <= soc_etherbone_record_depacketizer_sink_ready;
		soc_etherbone_record_depacketizer_sink_d_first <= soc_etherbone_record_depacketizer_sink_first;
		soc_etherbone_record_depacketizer_sink_d_last <= soc_etherbone_record_depacketizer_sink_last;
		soc_etherbone_record_depacketizer_sink_d_payload_data <= soc_etherbone_record_depacketizer_sink_payload_data;
		soc_etherbone_record_depacketizer_sink_d_payload_error <= soc_etherbone_record_depacketizer_sink_payload_error;
		soc_etherbone_record_depacketizer_sink_d_param_addr_size <= soc_etherbone_record_depacketizer_sink_param_addr_size;
		soc_etherbone_record_depacketizer_sink_d_param_nr <= soc_etherbone_record_depacketizer_sink_param_nr;
		soc_etherbone_record_depacketizer_sink_d_param_pf <= soc_etherbone_record_depacketizer_sink_param_pf;
		soc_etherbone_record_depacketizer_sink_d_param_port_size <= soc_etherbone_record_depacketizer_sink_param_port_size;
		soc_etherbone_record_depacketizer_sink_d_param_pr <= soc_etherbone_record_depacketizer_sink_param_pr;
		soc_etherbone_record_depacketizer_sink_d_param_src_port <= soc_etherbone_record_depacketizer_sink_param_src_port;
		soc_etherbone_record_depacketizer_sink_d_param_dst_port <= soc_etherbone_record_depacketizer_sink_param_dst_port;
		soc_etherbone_record_depacketizer_sink_d_param_ip_address <= soc_etherbone_record_depacketizer_sink_param_ip_address;
		soc_etherbone_record_depacketizer_sink_d_param_length <= soc_etherbone_record_depacketizer_sink_param_length;
	end
	vns_liteethetherbonerecorddepacketizer_state <= vns_liteethetherbonerecorddepacketizer_next_state;
	if (soc_etherbone_record_depacketizer_count_liteethetherbonerecorddepacketizer_next_value_ce0) begin
		soc_etherbone_record_depacketizer_count <= soc_etherbone_record_depacketizer_count_liteethetherbonerecorddepacketizer_next_value0;
	end
	if (soc_etherbone_record_depacketizer_fsm_from_idle_liteethetherbonerecorddepacketizer_next_value_ce1) begin
		soc_etherbone_record_depacketizer_fsm_from_idle <= soc_etherbone_record_depacketizer_fsm_from_idle_liteethetherbonerecorddepacketizer_next_value1;
	end
	if (soc_etherbone_record_receiver_base_addr_update) begin
		soc_etherbone_record_receiver_base_addr <= soc_etherbone_record_receiver_fifo_source_payload_data;
	end
	if (soc_etherbone_record_receiver_counter_reset) begin
		soc_etherbone_record_receiver_counter <= 1'd0;
	end else begin
		if (soc_etherbone_record_receiver_counter_ce) begin
			soc_etherbone_record_receiver_counter <= (soc_etherbone_record_receiver_counter + 1'd1);
		end
	end
	if (soc_etherbone_record_receiver_fifo_syncfifo_re) begin
		soc_etherbone_record_receiver_fifo_readable <= 1'd1;
	end else begin
		if (soc_etherbone_record_receiver_fifo_re) begin
			soc_etherbone_record_receiver_fifo_readable <= 1'd0;
		end
	end
	if (((soc_etherbone_record_receiver_fifo_syncfifo_we & soc_etherbone_record_receiver_fifo_syncfifo_writable) & (~soc_etherbone_record_receiver_fifo_replace))) begin
		soc_etherbone_record_receiver_fifo_produce <= (soc_etherbone_record_receiver_fifo_produce + 1'd1);
	end
	if (soc_etherbone_record_receiver_fifo_do_read) begin
		soc_etherbone_record_receiver_fifo_consume <= (soc_etherbone_record_receiver_fifo_consume + 1'd1);
	end
	if (((soc_etherbone_record_receiver_fifo_syncfifo_we & soc_etherbone_record_receiver_fifo_syncfifo_writable) & (~soc_etherbone_record_receiver_fifo_replace))) begin
		if ((~soc_etherbone_record_receiver_fifo_do_read)) begin
			soc_etherbone_record_receiver_fifo_level0 <= (soc_etherbone_record_receiver_fifo_level0 + 1'd1);
		end
	end else begin
		if (soc_etherbone_record_receiver_fifo_do_read) begin
			soc_etherbone_record_receiver_fifo_level0 <= (soc_etherbone_record_receiver_fifo_level0 - 1'd1);
		end
	end
	vns_liteethetherbonerecordreceiver_state <= vns_liteethetherbonerecordreceiver_next_state;
	soc_etherbone_record_sender_source_source_param_byte_enable <= soc_etherbone_record_sender_fifo_source_param_be;
	if (soc_etherbone_record_sender_fifo_source_param_we) begin
		soc_etherbone_record_sender_source_source_param_wcount <= soc_etherbone_record_sender_fifo_source_param_count;
	end else begin
		soc_etherbone_record_sender_source_source_param_rcount <= soc_etherbone_record_sender_fifo_source_param_count;
	end
	if (soc_etherbone_record_sender_data_sel) begin
		soc_etherbone_record_sender_source_source_payload_data <= soc_etherbone_record_sender_fifo_source_payload_data;
	end else begin
		soc_etherbone_record_sender_source_source_payload_data <= soc_etherbone_record_sender_fifo_source_param_base_addr;
	end
	if (soc_etherbone_record_sender_fifo_syncfifo_re) begin
		soc_etherbone_record_sender_fifo_readable <= 1'd1;
	end else begin
		if (soc_etherbone_record_sender_fifo_re) begin
			soc_etherbone_record_sender_fifo_readable <= 1'd0;
		end
	end
	if (((soc_etherbone_record_sender_fifo_syncfifo_we & soc_etherbone_record_sender_fifo_syncfifo_writable) & (~soc_etherbone_record_sender_fifo_replace))) begin
		soc_etherbone_record_sender_fifo_produce <= (soc_etherbone_record_sender_fifo_produce + 1'd1);
	end
	if (soc_etherbone_record_sender_fifo_do_read) begin
		soc_etherbone_record_sender_fifo_consume <= (soc_etherbone_record_sender_fifo_consume + 1'd1);
	end
	if (((soc_etherbone_record_sender_fifo_syncfifo_we & soc_etherbone_record_sender_fifo_syncfifo_writable) & (~soc_etherbone_record_sender_fifo_replace))) begin
		if ((~soc_etherbone_record_sender_fifo_do_read)) begin
			soc_etherbone_record_sender_fifo_level0 <= (soc_etherbone_record_sender_fifo_level0 + 1'd1);
		end
	end else begin
		if (soc_etherbone_record_sender_fifo_do_read) begin
			soc_etherbone_record_sender_fifo_level0 <= (soc_etherbone_record_sender_fifo_level0 - 1'd1);
		end
	end
	vns_liteethetherbonerecordsender_state <= vns_liteethetherbonerecordsender_next_state;
	if (soc_etherbone_record_packetizer_sr_load) begin
		soc_etherbone_record_packetizer_sr <= soc_etherbone_record_packetizer_header;
	end
	if (soc_etherbone_record_packetizer_source_ready) begin
		soc_etherbone_record_packetizer_sink_d_valid <= soc_etherbone_record_packetizer_sink_valid;
		soc_etherbone_record_packetizer_sink_d_ready <= soc_etherbone_record_packetizer_sink_ready;
		soc_etherbone_record_packetizer_sink_d_first <= soc_etherbone_record_packetizer_sink_first;
		soc_etherbone_record_packetizer_sink_d_last <= soc_etherbone_record_packetizer_sink_last;
		soc_etherbone_record_packetizer_sink_d_payload_data <= soc_etherbone_record_packetizer_sink_payload_data;
		soc_etherbone_record_packetizer_sink_d_payload_error <= soc_etherbone_record_packetizer_sink_payload_error;
		soc_etherbone_record_packetizer_sink_d_param_bca <= soc_etherbone_record_packetizer_sink_param_bca;
		soc_etherbone_record_packetizer_sink_d_param_byte_enable <= soc_etherbone_record_packetizer_sink_param_byte_enable;
		soc_etherbone_record_packetizer_sink_d_param_cyc <= soc_etherbone_record_packetizer_sink_param_cyc;
		soc_etherbone_record_packetizer_sink_d_param_rca <= soc_etherbone_record_packetizer_sink_param_rca;
		soc_etherbone_record_packetizer_sink_d_param_rcount <= soc_etherbone_record_packetizer_sink_param_rcount;
		soc_etherbone_record_packetizer_sink_d_param_rff <= soc_etherbone_record_packetizer_sink_param_rff;
		soc_etherbone_record_packetizer_sink_d_param_wca <= soc_etherbone_record_packetizer_sink_param_wca;
		soc_etherbone_record_packetizer_sink_d_param_wcount <= soc_etherbone_record_packetizer_sink_param_wcount;
		soc_etherbone_record_packetizer_sink_d_param_wff <= soc_etherbone_record_packetizer_sink_param_wff;
	end
	vns_liteethetherbonerecordpacketizer_state <= vns_liteethetherbonerecordpacketizer_next_state;
	if (soc_etherbone_record_packetizer_count_liteethetherbonerecordpacketizer_next_value_ce0) begin
		soc_etherbone_record_packetizer_count <= soc_etherbone_record_packetizer_count_liteethetherbonerecordpacketizer_next_value0;
	end
	if (soc_etherbone_record_packetizer_fsm_from_idle_liteethetherbonerecordpacketizer_next_value_ce1) begin
		soc_etherbone_record_packetizer_fsm_from_idle <= soc_etherbone_record_packetizer_fsm_from_idle_liteethetherbonerecordpacketizer_next_value1;
	end
	if (soc_etherbone_dispatcher_first) begin
		soc_etherbone_dispatcher_sel_ongoing <= soc_etherbone_dispatcher_sel0;
	end
	soc_etherbone_dispatcher_ongoing1 <= ((soc_etherbone_rx_source_source_valid | soc_etherbone_dispatcher_ongoing1) & (~soc_etherbone_dispatcher_last));
	if (soc_etherbone_dispatcher_last) begin
		soc_etherbone_dispatcher_first <= 1'd1;
	end else begin
		if ((soc_etherbone_rx_source_source_valid & soc_etherbone_rx_source_source_ready)) begin
			soc_etherbone_dispatcher_first <= 1'd0;
		end
	end
	case (soc_etherbone_grant)
		1'd0: begin
			if ((~soc_etherbone_request[0])) begin
				if (soc_etherbone_request[1]) begin
					soc_etherbone_grant <= 1'd1;
				end
			end
		end
		1'd1: begin
			if ((~soc_etherbone_request[1])) begin
				if (soc_etherbone_request[0]) begin
					soc_etherbone_grant <= 1'd0;
				end
			end
		end
	endcase
	soc_etherbone_status0_ongoing1 <= ((soc_etherbone_probe_source_valid | soc_etherbone_status0_ongoing1) & (~soc_etherbone_status0_last));
	if (soc_etherbone_status0_last) begin
		soc_etherbone_status0_first <= 1'd1;
	end else begin
		if ((soc_etherbone_probe_source_valid & soc_etherbone_probe_source_ready)) begin
			soc_etherbone_status0_first <= 1'd0;
		end
	end
	soc_etherbone_status1_ongoing1 <= ((soc_etherbone_record_source_source_valid | soc_etherbone_status1_ongoing1) & (~soc_etherbone_status1_last));
	if (soc_etherbone_status1_last) begin
		soc_etherbone_status1_first <= 1'd1;
	end else begin
		if ((soc_etherbone_record_source_source_valid & soc_etherbone_record_source_source_ready)) begin
			soc_etherbone_status1_first <= 1'd0;
		end
	end
	soc_etherbone_wishbone_source_param_base_addr <= soc_etherbone_wishbone_sink_param_base_addr;
	soc_etherbone_wishbone_source_payload_addr <= soc_etherbone_wishbone_sink_payload_addr;
	soc_etherbone_wishbone_source_param_count <= soc_etherbone_wishbone_sink_param_count;
	soc_etherbone_wishbone_source_param_be <= soc_etherbone_wishbone_sink_param_be;
	soc_etherbone_wishbone_source_param_we <= 1'd1;
	if (soc_etherbone_wishbone_data_update) begin
		soc_etherbone_wishbone_source_payload_data <= soc_etherbone_wishbone_bus_dat_r;
	end
	vns_liteethetherbonewishbonemaster_state <= vns_liteethetherbonewishbonemaster_next_state;
	case (vns_grant)
		1'd0: begin
			if ((~vns_request[0])) begin
				if (vns_request[1]) begin
					vns_grant <= 1'd1;
				end
			end
		end
		1'd1: begin
			if ((~vns_request[1])) begin
				if (vns_request[0]) begin
					vns_grant <= 1'd0;
				end
			end
		end
	endcase
	vns_slave_sel_r <= vns_slave_sel;
	if (vns_wait) begin
		if ((~vns_done)) begin
			vns_count <= (vns_count - 1'd1);
		end
	end else begin
		vns_count <= 20'd1000000;
	end
	vns_csr_bankarray_interface0_bank_bus_dat_r <= 1'd0;
	if (vns_csr_bankarray_csrbank0_sel) begin
		case (vns_csr_bankarray_interface0_bank_bus_adr[3:0])
			1'd0: begin
				vns_csr_bankarray_interface0_bank_bus_dat_r <= vns_csr_bankarray_csrbank0_reset0_w;
			end
			1'd1: begin
				vns_csr_bankarray_interface0_bank_bus_dat_r <= vns_csr_bankarray_csrbank0_scratch3_w;
			end
			2'd2: begin
				vns_csr_bankarray_interface0_bank_bus_dat_r <= vns_csr_bankarray_csrbank0_scratch2_w;
			end
			2'd3: begin
				vns_csr_bankarray_interface0_bank_bus_dat_r <= vns_csr_bankarray_csrbank0_scratch1_w;
			end
			3'd4: begin
				vns_csr_bankarray_interface0_bank_bus_dat_r <= vns_csr_bankarray_csrbank0_scratch0_w;
			end
			3'd5: begin
				vns_csr_bankarray_interface0_bank_bus_dat_r <= vns_csr_bankarray_csrbank0_bus_errors3_w;
			end
			3'd6: begin
				vns_csr_bankarray_interface0_bank_bus_dat_r <= vns_csr_bankarray_csrbank0_bus_errors2_w;
			end
			3'd7: begin
				vns_csr_bankarray_interface0_bank_bus_dat_r <= vns_csr_bankarray_csrbank0_bus_errors1_w;
			end
			4'd8: begin
				vns_csr_bankarray_interface0_bank_bus_dat_r <= vns_csr_bankarray_csrbank0_bus_errors0_w;
			end
		endcase
	end
	if (vns_csr_bankarray_csrbank0_reset0_re) begin
		soc_usbsoc_reset_storage <= vns_csr_bankarray_csrbank0_reset0_r;
	end
	soc_usbsoc_reset_re <= vns_csr_bankarray_csrbank0_reset0_re;
	if (vns_csr_bankarray_csrbank0_scratch3_re) begin
		soc_usbsoc_scratch_storage[31:24] <= vns_csr_bankarray_csrbank0_scratch3_r;
	end
	if (vns_csr_bankarray_csrbank0_scratch2_re) begin
		soc_usbsoc_scratch_storage[23:16] <= vns_csr_bankarray_csrbank0_scratch2_r;
	end
	if (vns_csr_bankarray_csrbank0_scratch1_re) begin
		soc_usbsoc_scratch_storage[15:8] <= vns_csr_bankarray_csrbank0_scratch1_r;
	end
	if (vns_csr_bankarray_csrbank0_scratch0_re) begin
		soc_usbsoc_scratch_storage[7:0] <= vns_csr_bankarray_csrbank0_scratch0_r;
	end
	soc_usbsoc_scratch_re <= vns_csr_bankarray_csrbank0_scratch0_re;
	vns_csr_bankarray_interface1_bank_bus_dat_r <= 1'd0;
	if (vns_csr_bankarray_csrbank1_sel) begin
		case (vns_csr_bankarray_interface1_bank_bus_adr[1:0])
			1'd0: begin
				vns_csr_bankarray_interface1_bank_bus_dat_r <= vns_csr_bankarray_csrbank1_crg_reset0_w;
			end
			1'd1: begin
				vns_csr_bankarray_interface1_bank_bus_dat_r <= vns_csr_bankarray_csrbank1_mdio_w0_w;
			end
			2'd2: begin
				vns_csr_bankarray_interface1_bank_bus_dat_r <= vns_csr_bankarray_csrbank1_mdio_r_w;
			end
		endcase
	end
	if (vns_csr_bankarray_csrbank1_crg_reset0_re) begin
		soc_eth_phy_reset_storage <= vns_csr_bankarray_csrbank1_crg_reset0_r;
	end
	soc_eth_phy_reset_re <= vns_csr_bankarray_csrbank1_crg_reset0_re;
	if (vns_csr_bankarray_csrbank1_mdio_w0_re) begin
		soc_eth_phy_storage[2:0] <= vns_csr_bankarray_csrbank1_mdio_w0_r;
	end
	soc_eth_phy_re <= vns_csr_bankarray_csrbank1_mdio_w0_re;
	vns_csr_bankarray_sel_r <= vns_csr_bankarray_sel;
	vns_csr_bankarray_interface2_bank_bus_dat_r <= 1'd0;
	if (vns_csr_bankarray_csrbank2_sel) begin
		case (vns_csr_bankarray_interface2_bank_bus_adr[4:0])
			1'd0: begin
				vns_csr_bankarray_interface2_bank_bus_dat_r <= vns_csr_bankarray_csrbank2_phy_enable0_w;
			end
			1'd1: begin
				vns_csr_bankarray_interface2_bank_bus_dat_r <= vns_csr_bankarray_csrbank2_core_enable0_w;
			end
			2'd2: begin
				vns_csr_bankarray_interface2_bank_bus_dat_r <= vns_csr_bankarray_csrbank2_buf_in_addr1_w;
			end
			2'd3: begin
				vns_csr_bankarray_interface2_bank_bus_dat_r <= vns_csr_bankarray_csrbank2_buf_in_addr0_w;
			end
			3'd4: begin
				vns_csr_bankarray_interface2_bank_bus_dat_r <= vns_csr_bankarray_csrbank2_buf_in_data3_w;
			end
			3'd5: begin
				vns_csr_bankarray_interface2_bank_bus_dat_r <= vns_csr_bankarray_csrbank2_buf_in_data2_w;
			end
			3'd6: begin
				vns_csr_bankarray_interface2_bank_bus_dat_r <= vns_csr_bankarray_csrbank2_buf_in_data1_w;
			end
			3'd7: begin
				vns_csr_bankarray_interface2_bank_bus_dat_r <= vns_csr_bankarray_csrbank2_buf_in_data0_w;
			end
			4'd8: begin
				vns_csr_bankarray_interface2_bank_bus_dat_r <= soc_buf_in_wren_w;
			end
			4'd9: begin
				vns_csr_bankarray_interface2_bank_bus_dat_r <= vns_csr_bankarray_csrbank2_buf_in_request_w;
			end
			4'd10: begin
				vns_csr_bankarray_interface2_bank_bus_dat_r <= vns_csr_bankarray_csrbank2_buf_in_ready_w;
			end
			4'd11: begin
				vns_csr_bankarray_interface2_bank_bus_dat_r <= soc_buf_in_commit_w;
			end
			4'd12: begin
				vns_csr_bankarray_interface2_bank_bus_dat_r <= vns_csr_bankarray_csrbank2_buf_in_commit_len1_w;
			end
			4'd13: begin
				vns_csr_bankarray_interface2_bank_bus_dat_r <= vns_csr_bankarray_csrbank2_buf_in_commit_len0_w;
			end
			4'd14: begin
				vns_csr_bankarray_interface2_bank_bus_dat_r <= vns_csr_bankarray_csrbank2_buf_in_commit_ack_w;
			end
			4'd15: begin
				vns_csr_bankarray_interface2_bank_bus_dat_r <= vns_csr_bankarray_csrbank2_buf_out_addr1_w;
			end
			5'd16: begin
				vns_csr_bankarray_interface2_bank_bus_dat_r <= vns_csr_bankarray_csrbank2_buf_out_addr0_w;
			end
			5'd17: begin
				vns_csr_bankarray_interface2_bank_bus_dat_r <= vns_csr_bankarray_csrbank2_buf_out_q3_w;
			end
			5'd18: begin
				vns_csr_bankarray_interface2_bank_bus_dat_r <= vns_csr_bankarray_csrbank2_buf_out_q2_w;
			end
			5'd19: begin
				vns_csr_bankarray_interface2_bank_bus_dat_r <= vns_csr_bankarray_csrbank2_buf_out_q1_w;
			end
			5'd20: begin
				vns_csr_bankarray_interface2_bank_bus_dat_r <= vns_csr_bankarray_csrbank2_buf_out_q0_w;
			end
			5'd21: begin
				vns_csr_bankarray_interface2_bank_bus_dat_r <= vns_csr_bankarray_csrbank2_buf_out_len1_w;
			end
			5'd22: begin
				vns_csr_bankarray_interface2_bank_bus_dat_r <= vns_csr_bankarray_csrbank2_buf_out_len0_w;
			end
			5'd23: begin
				vns_csr_bankarray_interface2_bank_bus_dat_r <= vns_csr_bankarray_csrbank2_buf_out_hasdata_w;
			end
			5'd24: begin
				vns_csr_bankarray_interface2_bank_bus_dat_r <= soc_buf_out_arm_w;
			end
			5'd25: begin
				vns_csr_bankarray_interface2_bank_bus_dat_r <= vns_csr_bankarray_csrbank2_buf_out_arm_ack_w;
			end
		endcase
	end
	if (vns_csr_bankarray_csrbank2_phy_enable0_re) begin
		soc_phy_enable_storage <= vns_csr_bankarray_csrbank2_phy_enable0_r;
	end
	soc_phy_enable_re <= vns_csr_bankarray_csrbank2_phy_enable0_re;
	if (vns_csr_bankarray_csrbank2_core_enable0_re) begin
		soc_core_enable_storage <= vns_csr_bankarray_csrbank2_core_enable0_r;
	end
	soc_core_enable_re <= vns_csr_bankarray_csrbank2_core_enable0_re;
	if (vns_csr_bankarray_csrbank2_buf_in_addr1_re) begin
		soc_buf_in_addr_storage[8] <= vns_csr_bankarray_csrbank2_buf_in_addr1_r;
	end
	if (vns_csr_bankarray_csrbank2_buf_in_addr0_re) begin
		soc_buf_in_addr_storage[7:0] <= vns_csr_bankarray_csrbank2_buf_in_addr0_r;
	end
	soc_buf_in_addr_re <= vns_csr_bankarray_csrbank2_buf_in_addr0_re;
	if (vns_csr_bankarray_csrbank2_buf_in_data3_re) begin
		soc_buf_in_data_storage[31:24] <= vns_csr_bankarray_csrbank2_buf_in_data3_r;
	end
	if (vns_csr_bankarray_csrbank2_buf_in_data2_re) begin
		soc_buf_in_data_storage[23:16] <= vns_csr_bankarray_csrbank2_buf_in_data2_r;
	end
	if (vns_csr_bankarray_csrbank2_buf_in_data1_re) begin
		soc_buf_in_data_storage[15:8] <= vns_csr_bankarray_csrbank2_buf_in_data1_r;
	end
	if (vns_csr_bankarray_csrbank2_buf_in_data0_re) begin
		soc_buf_in_data_storage[7:0] <= vns_csr_bankarray_csrbank2_buf_in_data0_r;
	end
	soc_buf_in_data_re <= vns_csr_bankarray_csrbank2_buf_in_data0_re;
	if (vns_csr_bankarray_csrbank2_buf_in_commit_len1_re) begin
		soc_buf_in_commit_len_storage[10:8] <= vns_csr_bankarray_csrbank2_buf_in_commit_len1_r;
	end
	if (vns_csr_bankarray_csrbank2_buf_in_commit_len0_re) begin
		soc_buf_in_commit_len_storage[7:0] <= vns_csr_bankarray_csrbank2_buf_in_commit_len0_r;
	end
	soc_buf_in_commit_len_re <= vns_csr_bankarray_csrbank2_buf_in_commit_len0_re;
	if (vns_csr_bankarray_csrbank2_buf_out_addr1_re) begin
		soc_buf_out_addr_storage[8] <= vns_csr_bankarray_csrbank2_buf_out_addr1_r;
	end
	if (vns_csr_bankarray_csrbank2_buf_out_addr0_re) begin
		soc_buf_out_addr_storage[7:0] <= vns_csr_bankarray_csrbank2_buf_out_addr0_r;
	end
	soc_buf_out_addr_re <= vns_csr_bankarray_csrbank2_buf_out_addr0_re;
	if (sys_rst) begin
		soc_usbsoc_reset_storage <= 1'd0;
		soc_usbsoc_reset_re <= 1'd0;
		soc_usbsoc_scratch_storage <= 32'd305419896;
		soc_usbsoc_scratch_re <= 1'd0;
		soc_usbsoc_bus_errors <= 32'd0;
		serial_tx <= 1'd1;
		soc_uart_bridge_sink_ready <= 1'd0;
		soc_uart_bridge_uart_clk_txen <= 1'd0;
		soc_uart_bridge_phase_accumulator_tx <= 32'd0;
		soc_uart_bridge_tx_reg <= 8'd0;
		soc_uart_bridge_tx_bitcount <= 4'd0;
		soc_uart_bridge_tx_busy <= 1'd0;
		soc_uart_bridge_source_valid <= 1'd0;
		soc_uart_bridge_source_payload_data <= 8'd0;
		soc_uart_bridge_uart_clk_rxen <= 1'd0;
		soc_uart_bridge_phase_accumulator_rx <= 32'd0;
		soc_uart_bridge_rx_r <= 1'd0;
		soc_uart_bridge_rx_reg <= 8'd0;
		soc_uart_bridge_rx_bitcount <= 4'd0;
		soc_uart_bridge_rx_busy <= 1'd0;
		soc_uart_bridge_count <= 24'd13300000;
		soc_eth_phy_reset_storage <= 1'd0;
		soc_eth_phy_reset_re <= 1'd0;
		soc_eth_phy_hw_reset_counter <= 9'd0;
		soc_eth_phy_storage <= 3'd0;
		soc_eth_phy_re <= 1'd0;
		soc_eth_core_mac_preamble_errors_status <= 32'd0;
		soc_eth_core_mac_crc_errors_status <= 32'd0;
		soc_eth_core_mac_tx_cdc_graycounter0_q <= 7'd0;
		soc_eth_core_mac_tx_cdc_graycounter0_q_binary <= 7'd0;
		soc_eth_core_mac_rx_cdc_graycounter1_q <= 7'd0;
		soc_eth_core_mac_rx_cdc_graycounter1_q_binary <= 7'd0;
		soc_eth_core_mac_packetizer_count <= 4'd0;
		soc_eth_core_mac_packetizer_sink_d_valid <= 1'd0;
		soc_eth_core_mac_packetizer_sink_d_ready <= 1'd0;
		soc_eth_core_mac_packetizer_sink_d_first <= 1'd0;
		soc_eth_core_mac_packetizer_sink_d_last <= 1'd0;
		soc_eth_core_mac_packetizer_sink_d_payload_ethernet_type <= 16'd0;
		soc_eth_core_mac_packetizer_sink_d_payload_sender_mac <= 48'd0;
		soc_eth_core_mac_packetizer_sink_d_payload_target_mac <= 48'd0;
		soc_eth_core_mac_packetizer_sink_d_payload_data <= 8'd0;
		soc_eth_core_mac_packetizer_sink_d_payload_last_be <= 1'd0;
		soc_eth_core_mac_packetizer_sink_d_payload_error <= 1'd0;
		soc_eth_core_mac_packetizer_fsm_from_idle <= 1'd0;
		soc_eth_core_mac_depacketizer_count <= 4'd0;
		soc_eth_core_mac_depacketizer_sink_d_valid <= 1'd0;
		soc_eth_core_mac_depacketizer_sink_d_ready <= 1'd0;
		soc_eth_core_mac_depacketizer_sink_d_first <= 1'd0;
		soc_eth_core_mac_depacketizer_sink_d_last <= 1'd0;
		soc_eth_core_mac_depacketizer_sink_d_payload_data <= 8'd0;
		soc_eth_core_mac_depacketizer_sink_d_payload_last_be <= 1'd0;
		soc_eth_core_mac_depacketizer_sink_d_payload_error <= 1'd0;
		soc_eth_core_mac_depacketizer_fsm_from_idle <= 1'd0;
		soc_eth_core_arp_tx_packetizer_count <= 5'd0;
		soc_eth_core_arp_tx_packetizer_sink_d_valid <= 1'd0;
		soc_eth_core_arp_tx_packetizer_sink_d_ready <= 1'd0;
		soc_eth_core_arp_tx_packetizer_sink_d_first <= 1'd0;
		soc_eth_core_arp_tx_packetizer_sink_d_last <= 1'd0;
		soc_eth_core_arp_tx_packetizer_sink_d_payload_data <= 8'd0;
		soc_eth_core_arp_tx_packetizer_sink_d_payload_error <= 1'd0;
		soc_eth_core_arp_tx_packetizer_sink_d_param_hwsize <= 8'd0;
		soc_eth_core_arp_tx_packetizer_sink_d_param_hwtype <= 16'd0;
		soc_eth_core_arp_tx_packetizer_sink_d_param_opcode <= 16'd0;
		soc_eth_core_arp_tx_packetizer_sink_d_param_proto <= 16'd0;
		soc_eth_core_arp_tx_packetizer_sink_d_param_protosize <= 8'd0;
		soc_eth_core_arp_tx_packetizer_sink_d_param_sender_ip <= 32'd0;
		soc_eth_core_arp_tx_packetizer_sink_d_param_sender_mac <= 48'd0;
		soc_eth_core_arp_tx_packetizer_sink_d_param_target_ip <= 32'd0;
		soc_eth_core_arp_tx_packetizer_sink_d_param_target_mac <= 48'd0;
		soc_eth_core_arp_tx_packetizer_fsm_from_idle <= 1'd0;
		soc_eth_core_arp_rx_depacketizer_count <= 5'd0;
		soc_eth_core_arp_rx_depacketizer_sink_d_valid <= 1'd0;
		soc_eth_core_arp_rx_depacketizer_sink_d_ready <= 1'd0;
		soc_eth_core_arp_rx_depacketizer_sink_d_first <= 1'd0;
		soc_eth_core_arp_rx_depacketizer_sink_d_last <= 1'd0;
		soc_eth_core_arp_rx_depacketizer_sink_d_payload_ethernet_type <= 16'd0;
		soc_eth_core_arp_rx_depacketizer_sink_d_payload_sender_mac <= 48'd0;
		soc_eth_core_arp_rx_depacketizer_sink_d_payload_target_mac <= 48'd0;
		soc_eth_core_arp_rx_depacketizer_sink_d_payload_data <= 8'd0;
		soc_eth_core_arp_rx_depacketizer_sink_d_payload_last_be <= 1'd0;
		soc_eth_core_arp_rx_depacketizer_sink_d_payload_error <= 1'd0;
		soc_eth_core_arp_rx_depacketizer_fsm_from_idle <= 1'd0;
		soc_eth_core_arp_table_request_pending <= 1'd0;
		soc_eth_core_arp_table_request_timer_count <= 24'd13300000;
		soc_eth_core_arp_table_request_counter <= 3'd0;
		soc_eth_core_arp_table_cached_valid <= 1'd0;
		soc_eth_core_arp_table_cached_timer_count <= 31'd1330000000;
		soc_eth_core_ip_tx_liteethipv4checksum_counter <= 4'd0;
		soc_eth_core_ip_tx_packetizer_count <= 5'd0;
		soc_eth_core_ip_tx_packetizer_sink_d_valid <= 1'd0;
		soc_eth_core_ip_tx_packetizer_sink_d_ready <= 1'd0;
		soc_eth_core_ip_tx_packetizer_sink_d_first <= 1'd0;
		soc_eth_core_ip_tx_packetizer_sink_d_last <= 1'd0;
		soc_eth_core_ip_tx_packetizer_sink_d_payload_data <= 8'd0;
		soc_eth_core_ip_tx_packetizer_sink_d_payload_error <= 1'd0;
		soc_eth_core_ip_tx_packetizer_sink_d_param_checksum <= 16'd0;
		soc_eth_core_ip_tx_packetizer_sink_d_param_identification <= 16'd0;
		soc_eth_core_ip_tx_packetizer_sink_d_param_ihl <= 4'd0;
		soc_eth_core_ip_tx_packetizer_sink_d_param_protocol <= 8'd0;
		soc_eth_core_ip_tx_packetizer_sink_d_param_sender_ip <= 32'd0;
		soc_eth_core_ip_tx_packetizer_sink_d_param_target_ip <= 32'd0;
		soc_eth_core_ip_tx_packetizer_sink_d_param_total_length <= 16'd0;
		soc_eth_core_ip_tx_packetizer_sink_d_param_ttl <= 8'd0;
		soc_eth_core_ip_tx_packetizer_sink_d_param_version <= 4'd0;
		soc_eth_core_ip_tx_packetizer_fsm_from_idle <= 1'd0;
		soc_eth_core_ip_rx_depacketizer_count <= 5'd0;
		soc_eth_core_ip_rx_depacketizer_sink_d_valid <= 1'd0;
		soc_eth_core_ip_rx_depacketizer_sink_d_ready <= 1'd0;
		soc_eth_core_ip_rx_depacketizer_sink_d_first <= 1'd0;
		soc_eth_core_ip_rx_depacketizer_sink_d_last <= 1'd0;
		soc_eth_core_ip_rx_depacketizer_sink_d_payload_ethernet_type <= 16'd0;
		soc_eth_core_ip_rx_depacketizer_sink_d_payload_sender_mac <= 48'd0;
		soc_eth_core_ip_rx_depacketizer_sink_d_payload_target_mac <= 48'd0;
		soc_eth_core_ip_rx_depacketizer_sink_d_payload_data <= 8'd0;
		soc_eth_core_ip_rx_depacketizer_sink_d_payload_last_be <= 1'd0;
		soc_eth_core_ip_rx_depacketizer_sink_d_payload_error <= 1'd0;
		soc_eth_core_ip_rx_depacketizer_fsm_from_idle <= 1'd0;
		soc_eth_core_ip_rx_liteethipv4checksum_counter <= 4'd0;
		soc_eth_core_icmp_tx_packetizer_count <= 3'd0;
		soc_eth_core_icmp_tx_packetizer_sink_d_valid <= 1'd0;
		soc_eth_core_icmp_tx_packetizer_sink_d_ready <= 1'd0;
		soc_eth_core_icmp_tx_packetizer_sink_d_first <= 1'd0;
		soc_eth_core_icmp_tx_packetizer_sink_d_last <= 1'd0;
		soc_eth_core_icmp_tx_packetizer_sink_d_payload_data <= 8'd0;
		soc_eth_core_icmp_tx_packetizer_sink_d_payload_error <= 1'd0;
		soc_eth_core_icmp_tx_packetizer_sink_d_param_checksum <= 16'd0;
		soc_eth_core_icmp_tx_packetizer_sink_d_param_code <= 8'd0;
		soc_eth_core_icmp_tx_packetizer_sink_d_param_msgtype <= 8'd0;
		soc_eth_core_icmp_tx_packetizer_sink_d_param_quench <= 32'd0;
		soc_eth_core_icmp_tx_packetizer_fsm_from_idle <= 1'd0;
		soc_eth_core_icmp_rx_depacketizer_count <= 3'd0;
		soc_eth_core_icmp_rx_depacketizer_sink_d_valid <= 1'd0;
		soc_eth_core_icmp_rx_depacketizer_sink_d_ready <= 1'd0;
		soc_eth_core_icmp_rx_depacketizer_sink_d_first <= 1'd0;
		soc_eth_core_icmp_rx_depacketizer_sink_d_last <= 1'd0;
		soc_eth_core_icmp_rx_depacketizer_sink_d_payload_data <= 8'd0;
		soc_eth_core_icmp_rx_depacketizer_sink_d_payload_error <= 1'd0;
		soc_eth_core_icmp_rx_depacketizer_sink_d_param_length <= 16'd0;
		soc_eth_core_icmp_rx_depacketizer_sink_d_param_protocol <= 8'd0;
		soc_eth_core_icmp_rx_depacketizer_sink_d_param_ip_address <= 32'd0;
		soc_eth_core_icmp_rx_depacketizer_fsm_from_idle <= 1'd0;
		soc_eth_core_icmp_echo_buffer_readable <= 1'd0;
		soc_eth_core_icmp_echo_buffer_level0 <= 8'd0;
		soc_eth_core_icmp_echo_buffer_produce <= 7'd0;
		soc_eth_core_icmp_echo_buffer_consume <= 7'd0;
		soc_eth_core_tx_packetizer_count <= 3'd0;
		soc_eth_core_tx_packetizer_sink_d_valid <= 1'd0;
		soc_eth_core_tx_packetizer_sink_d_ready <= 1'd0;
		soc_eth_core_tx_packetizer_sink_d_first <= 1'd0;
		soc_eth_core_tx_packetizer_sink_d_last <= 1'd0;
		soc_eth_core_tx_packetizer_sink_d_payload_data <= 8'd0;
		soc_eth_core_tx_packetizer_sink_d_payload_error <= 1'd0;
		soc_eth_core_tx_packetizer_sink_d_param_checksum <= 16'd0;
		soc_eth_core_tx_packetizer_sink_d_param_dst_port <= 16'd0;
		soc_eth_core_tx_packetizer_sink_d_param_length <= 16'd0;
		soc_eth_core_tx_packetizer_sink_d_param_src_port <= 16'd0;
		soc_eth_core_tx_packetizer_fsm_from_idle <= 1'd0;
		soc_eth_core_rx_depacketizer_count <= 3'd0;
		soc_eth_core_rx_depacketizer_sink_d_valid <= 1'd0;
		soc_eth_core_rx_depacketizer_sink_d_ready <= 1'd0;
		soc_eth_core_rx_depacketizer_sink_d_first <= 1'd0;
		soc_eth_core_rx_depacketizer_sink_d_last <= 1'd0;
		soc_eth_core_rx_depacketizer_sink_d_payload_data <= 8'd0;
		soc_eth_core_rx_depacketizer_sink_d_payload_error <= 1'd0;
		soc_eth_core_rx_depacketizer_sink_d_param_length <= 16'd0;
		soc_eth_core_rx_depacketizer_sink_d_param_protocol <= 8'd0;
		soc_eth_core_rx_depacketizer_sink_d_param_ip_address <= 32'd0;
		soc_eth_core_rx_depacketizer_fsm_from_idle <= 1'd0;
		soc_etherbone_tx_packetizer_count <= 1'd0;
		soc_etherbone_tx_packetizer_sink_d_valid <= 1'd0;
		soc_etherbone_tx_packetizer_sink_d_ready <= 1'd0;
		soc_etherbone_tx_packetizer_sink_d_first <= 1'd0;
		soc_etherbone_tx_packetizer_sink_d_last <= 1'd0;
		soc_etherbone_tx_packetizer_sink_d_payload_data <= 32'd0;
		soc_etherbone_tx_packetizer_sink_d_payload_error <= 4'd0;
		soc_etherbone_tx_packetizer_sink_d_param_addr_size <= 4'd0;
		soc_etherbone_tx_packetizer_sink_d_param_magic <= 16'd0;
		soc_etherbone_tx_packetizer_sink_d_param_nr <= 1'd0;
		soc_etherbone_tx_packetizer_sink_d_param_pf <= 1'd0;
		soc_etherbone_tx_packetizer_sink_d_param_port_size <= 4'd0;
		soc_etherbone_tx_packetizer_sink_d_param_pr <= 1'd0;
		soc_etherbone_tx_packetizer_sink_d_param_version <= 4'd0;
		soc_etherbone_tx_packetizer_fsm_from_idle <= 1'd0;
		soc_etherbone_rx_depacketizer_count <= 1'd0;
		soc_etherbone_rx_depacketizer_sink_d_valid <= 1'd0;
		soc_etherbone_rx_depacketizer_sink_d_ready <= 1'd0;
		soc_etherbone_rx_depacketizer_sink_d_first <= 1'd0;
		soc_etherbone_rx_depacketizer_sink_d_last <= 1'd0;
		soc_etherbone_rx_depacketizer_sink_d_payload_data <= 32'd0;
		soc_etherbone_rx_depacketizer_sink_d_payload_error <= 4'd0;
		soc_etherbone_rx_depacketizer_sink_d_param_src_port <= 16'd0;
		soc_etherbone_rx_depacketizer_sink_d_param_dst_port <= 16'd0;
		soc_etherbone_rx_depacketizer_sink_d_param_ip_address <= 32'd0;
		soc_etherbone_rx_depacketizer_sink_d_param_length <= 16'd0;
		soc_etherbone_rx_depacketizer_fsm_from_idle <= 1'd0;
		soc_etherbone_tx_converter_converter_mux <= 2'd0;
		soc_etherbone_rx_converter_source_param_src_port <= 16'd0;
		soc_etherbone_rx_converter_source_param_dst_port <= 16'd0;
		soc_etherbone_rx_converter_source_param_ip_address <= 32'd0;
		soc_etherbone_rx_converter_source_param_length <= 16'd0;
		soc_etherbone_rx_converter_converter_source_first <= 1'd0;
		soc_etherbone_rx_converter_converter_source_last <= 1'd0;
		soc_etherbone_rx_converter_converter_source_payload_data <= 36'd0;
		soc_etherbone_rx_converter_converter_source_payload_valid_token_count <= 3'd0;
		soc_etherbone_rx_converter_converter_demux <= 2'd0;
		soc_etherbone_rx_converter_converter_strobe_all <= 1'd0;
		soc_etherbone_record_depacketizer_count <= 1'd0;
		soc_etherbone_record_depacketizer_sink_d_valid <= 1'd0;
		soc_etherbone_record_depacketizer_sink_d_ready <= 1'd0;
		soc_etherbone_record_depacketizer_sink_d_first <= 1'd0;
		soc_etherbone_record_depacketizer_sink_d_last <= 1'd0;
		soc_etherbone_record_depacketizer_sink_d_payload_data <= 32'd0;
		soc_etherbone_record_depacketizer_sink_d_payload_error <= 4'd0;
		soc_etherbone_record_depacketizer_sink_d_param_addr_size <= 4'd0;
		soc_etherbone_record_depacketizer_sink_d_param_nr <= 1'd0;
		soc_etherbone_record_depacketizer_sink_d_param_pf <= 1'd0;
		soc_etherbone_record_depacketizer_sink_d_param_port_size <= 4'd0;
		soc_etherbone_record_depacketizer_sink_d_param_pr <= 1'd0;
		soc_etherbone_record_depacketizer_sink_d_param_src_port <= 16'd0;
		soc_etherbone_record_depacketizer_sink_d_param_dst_port <= 16'd0;
		soc_etherbone_record_depacketizer_sink_d_param_ip_address <= 32'd0;
		soc_etherbone_record_depacketizer_sink_d_param_length <= 16'd0;
		soc_etherbone_record_depacketizer_fsm_from_idle <= 1'd0;
		soc_etherbone_record_receiver_fifo_readable <= 1'd0;
		soc_etherbone_record_receiver_fifo_level0 <= 3'd0;
		soc_etherbone_record_receiver_fifo_produce <= 2'd0;
		soc_etherbone_record_receiver_fifo_consume <= 2'd0;
		soc_etherbone_record_first <= 1'd1;
		soc_etherbone_record_sender_source_source_payload_data <= 32'd0;
		soc_etherbone_record_sender_source_source_param_byte_enable <= 8'd0;
		soc_etherbone_record_sender_source_source_param_rcount <= 8'd0;
		soc_etherbone_record_sender_source_source_param_wcount <= 8'd0;
		soc_etherbone_record_sender_fifo_readable <= 1'd0;
		soc_etherbone_record_sender_fifo_level0 <= 3'd0;
		soc_etherbone_record_sender_fifo_produce <= 2'd0;
		soc_etherbone_record_sender_fifo_consume <= 2'd0;
		soc_etherbone_record_packetizer_count <= 1'd0;
		soc_etherbone_record_packetizer_sink_d_valid <= 1'd0;
		soc_etherbone_record_packetizer_sink_d_ready <= 1'd0;
		soc_etherbone_record_packetizer_sink_d_first <= 1'd0;
		soc_etherbone_record_packetizer_sink_d_last <= 1'd0;
		soc_etherbone_record_packetizer_sink_d_payload_data <= 32'd0;
		soc_etherbone_record_packetizer_sink_d_payload_error <= 4'd0;
		soc_etherbone_record_packetizer_sink_d_param_bca <= 1'd0;
		soc_etherbone_record_packetizer_sink_d_param_byte_enable <= 8'd0;
		soc_etherbone_record_packetizer_sink_d_param_cyc <= 1'd0;
		soc_etherbone_record_packetizer_sink_d_param_rca <= 1'd0;
		soc_etherbone_record_packetizer_sink_d_param_rcount <= 8'd0;
		soc_etherbone_record_packetizer_sink_d_param_rff <= 1'd0;
		soc_etherbone_record_packetizer_sink_d_param_wca <= 1'd0;
		soc_etherbone_record_packetizer_sink_d_param_wcount <= 8'd0;
		soc_etherbone_record_packetizer_sink_d_param_wff <= 1'd0;
		soc_etherbone_record_packetizer_fsm_from_idle <= 1'd0;
		soc_etherbone_dispatcher_first <= 1'd1;
		soc_etherbone_dispatcher_ongoing1 <= 1'd0;
		soc_etherbone_dispatcher_sel_ongoing <= 1'd0;
		soc_etherbone_grant <= 1'd0;
		soc_etherbone_status0_first <= 1'd1;
		soc_etherbone_status0_ongoing1 <= 1'd0;
		soc_etherbone_status1_first <= 1'd1;
		soc_etherbone_status1_ongoing1 <= 1'd0;
		soc_etherbone_wishbone_source_payload_addr <= 32'd0;
		soc_etherbone_wishbone_source_payload_data <= 32'd0;
		soc_etherbone_wishbone_source_param_we <= 1'd0;
		soc_etherbone_wishbone_source_param_count <= 8'd0;
		soc_etherbone_wishbone_source_param_base_addr <= 32'd0;
		soc_etherbone_wishbone_source_param_be <= 4'd0;
		soc_phy_enable_storage <= 1'd0;
		soc_phy_enable_re <= 1'd0;
		soc_core_enable_storage <= 1'd0;
		soc_core_enable_re <= 1'd0;
		soc_buf_in_addr_storage <= 9'd0;
		soc_buf_in_addr_re <= 1'd0;
		soc_buf_in_data_storage <= 32'd0;
		soc_buf_in_data_re <= 1'd0;
		soc_buf_in_commit_len_storage <= 11'd0;
		soc_buf_in_commit_len_re <= 1'd0;
		soc_buf_out_addr_storage <= 9'd0;
		soc_buf_out_addr_re <= 1'd0;
		vns_wb2csr_state <= 1'd0;
		vns_uartwishbonebridge_state <= 3'd0;
		vns_liteethudpipcore_liteethmac_grant <= 1'd0;
		vns_liteethudpipcore_liteethmac_status0_first <= 1'd1;
		vns_liteethudpipcore_liteethmac_status0_ongoing1 <= 1'd0;
		vns_liteethudpipcore_liteethmac_status1_first <= 1'd1;
		vns_liteethudpipcore_liteethmac_status1_ongoing1 <= 1'd0;
		vns_liteethudpipcore_liteethmac_first <= 1'd1;
		vns_liteethudpipcore_liteethmac_ongoing1 <= 1'd0;
		vns_liteethudpipcore_liteethmac_sel_ongoing <= 2'd0;
		vns_liteethudpipcore_liteethmac_liteethmacpacketizer_state <= 2'd0;
		vns_liteethudpipcore_liteethmac_liteethmacdepacketizer_state <= 2'd0;
		vns_liteethudpipcore_liteetharptx_liteetharppacketizer_state <= 2'd0;
		vns_liteethudpipcore_liteetharptx_fsm_state <= 1'd0;
		vns_liteethudpipcore_liteetharprx_liteetharpdepacketizer_state <= 2'd0;
		vns_liteethudpipcore_liteetharprx_fsm_state <= 2'd0;
		vns_liteethudpipcore_state <= 3'd0;
		vns_liteethudpipcore_liteethip_liteethiptx_liteethipv4packetizer_state <= 2'd0;
		vns_liteethudpipcore_liteethip_liteethiptx_fsm_state <= 3'd0;
		vns_liteethudpipcore_liteethip_liteethiprx_liteethipv4depacketizer_state <= 2'd0;
		vns_liteethudpipcore_liteethip_liteethiprx_fsm_state <= 2'd0;
		vns_liteethudpipcore_liteethip_grant <= 1'd0;
		vns_liteethudpipcore_liteethip_status0_first <= 1'd1;
		vns_liteethudpipcore_liteethip_status0_ongoing1 <= 1'd0;
		vns_liteethudpipcore_liteethip_status1_first <= 1'd1;
		vns_liteethudpipcore_liteethip_status1_ongoing1 <= 1'd0;
		vns_liteethudpipcore_liteethip_first <= 1'd1;
		vns_liteethudpipcore_liteethip_ongoing1 <= 1'd0;
		vns_liteethudpipcore_liteethip_sel_ongoing <= 2'd0;
		vns_liteethudpipcore_liteethicmptx_liteethicmppacketizer_state <= 2'd0;
		vns_liteethudpipcore_liteethicmptx_fsm_state <= 1'd0;
		vns_liteethudpipcore_liteethicmprx_liteethicmpdepacketizer_state <= 2'd0;
		vns_liteethudpipcore_liteethicmprx_fsm_state <= 2'd0;
		vns_liteethudpipcore_liteethudp_liteethudptx_liteethudppacketizer_state <= 2'd0;
		vns_liteethudpipcore_liteethudp_liteethudptx_fsm_state <= 1'd0;
		vns_liteethudpipcore_liteethudp_liteethudprx_liteethudpdepacketizer_state <= 2'd0;
		vns_liteethudpipcore_liteethudp_liteethudprx_fsm_state <= 2'd0;
		vns_liteethetherbonepackettx_liteethetherbonepacketpacketizer_state <= 2'd0;
		vns_liteethetherbonepackettx_fsm_state <= 1'd0;
		vns_liteethetherbonepacketrx_liteethetherbonepacketdepacketizer_state <= 2'd0;
		vns_liteethetherbonepacketrx_fsm_state <= 2'd0;
		vns_liteethetherboneprobe_state <= 1'd0;
		vns_liteethetherbonerecorddepacketizer_state <= 2'd0;
		vns_liteethetherbonerecordreceiver_state <= 2'd0;
		vns_liteethetherbonerecordsender_state <= 2'd0;
		vns_liteethetherbonerecordpacketizer_state <= 2'd0;
		vns_liteethetherbonewishbonemaster_state <= 2'd0;
		vns_grant <= 1'd0;
		vns_slave_sel_r <= 1'd0;
		vns_count <= 20'd1000000;
		vns_csr_bankarray_interface0_bank_bus_dat_r <= 8'd0;
		vns_csr_bankarray_interface1_bank_bus_dat_r <= 8'd0;
		vns_csr_bankarray_sel_r <= 1'd0;
		vns_csr_bankarray_interface2_bank_bus_dat_r <= 8'd0;
	end
	vns_xilinxmultiregimpl0_regs0 <= serial_rx;
	vns_xilinxmultiregimpl0_regs1 <= vns_xilinxmultiregimpl0_regs0;
	vns_xilinxmultiregimpl1_regs0 <= soc_eth_phy_data_r;
	vns_xilinxmultiregimpl1_regs1 <= vns_xilinxmultiregimpl1_regs0;
	vns_xilinxmultiregimpl2_regs0 <= soc_eth_core_mac_ps_preamble_error_toggle_i;
	vns_xilinxmultiregimpl2_regs1 <= vns_xilinxmultiregimpl2_regs0;
	vns_xilinxmultiregimpl3_regs0 <= soc_eth_core_mac_ps_crc_error_toggle_i;
	vns_xilinxmultiregimpl3_regs1 <= vns_xilinxmultiregimpl3_regs0;
	vns_xilinxmultiregimpl5_regs0 <= soc_eth_core_mac_tx_cdc_graycounter1_q;
	vns_xilinxmultiregimpl5_regs1 <= vns_xilinxmultiregimpl5_regs0;
	vns_xilinxmultiregimpl6_regs0 <= soc_eth_core_mac_rx_cdc_graycounter0_q;
	vns_xilinxmultiregimpl6_regs1 <= vns_xilinxmultiregimpl6_regs0;
end
reg [7:0] mem[0:45];
reg [5:0] memadr;
always @(posedge sys_clk) begin
	memadr <= vns_csr_bankarray_adr;
end
assign vns_csr_bankarray_dat_r = mem[memadr];
initial begin
	$readmemh("mem.init", mem);
end
(* LOC="PLLE2_ADV_X1Y2" *)
PLLE2_ADV #(
	.CLKFBOUT_MULT(5'd16),
	.CLKIN1_PERIOD(10.0),
	.CLKOUT0_DIVIDE(4'd12),
	.CLKOUT0_PHASE(0.0),
	.CLKOUT1_DIVIDE(4'd8),
	.CLKOUT1_PHASE(0.0),
	.DIVCLK_DIVIDE(1'd1),
	.REF_JITTER1(0.01),
	.STARTUP_WAIT("FALSE")
) PLLE2_ADV_1 (
	.CLKFBIN(soc_pll_fb),
	.CLKIN1(clk100),
	.CLKFBOUT(soc_pll_fb),
	.CLKOUT0(soc_pll_sys),
	.CLKOUT1(soc_pll_clk200),
	.LOCKED(soc_pll_locked)
);
BUFG BUFG(
	.I(soc_pll_sys),
	.O(sys_clk)
);
BUFG BUFG_1(
	.I(soc_pll_clk200),
	.O(clk200_clk)
);
IDELAYCTRL IDELAYCTRL(
	.REFCLK(clk200_clk),
	.RST(soc_ic_reset)
);
IBUF IBUF(
	.I(eth_clocks_rx),
	.O(soc_eth_phy_eth_rx_clk_ibuf)
);
BUFG BUFG_2(
	.I(soc_eth_phy_eth_rx_clk_ibuf),
	.O(eth_rx_clk)
);
BUFG BUFG_3(
	.I(soc_eth_phy_clkout0),
	.O(soc_eth_phy_clkout_buf0)
);
BUFG BUFG_4(
	.I(soc_eth_phy_clkout1),
	.O(soc_eth_phy_clkout_buf1)
);
ODDR #(
	.DDR_CLK_EDGE("SAME_EDGE")
) ODDR (
	.C(eth_tx_delayed_clk),
	.CE(1'd1),
	.D1(1'd1),
	.D2(1'd0),
	.R(1'd0),
	.S(1'd0),
	.Q(soc_eth_phy_eth_tx_clk_obuf)
);
OBUF OBUF(
	.I(soc_eth_phy_eth_tx_clk_obuf),
	.O(eth_clocks_tx)
);
ODDR #(
	.DDR_CLK_EDGE("SAME_EDGE")
) ODDR_1 (
	.C(eth_tx_clk),
	.CE(1'd1),
	.D1(soc_eth_phy_sink_valid),
	.D2(soc_eth_phy_sink_valid),
	.R(1'd0),
	.S(1'd0),
	.Q(soc_eth_phy_tx_ctl_obuf)
);
OBUF OBUF_1(
	.I(soc_eth_phy_tx_ctl_obuf),
	.O(eth_tx_ctl)
);
ODDR #(
	.DDR_CLK_EDGE("SAME_EDGE")
) ODDR_2 (
	.C(eth_tx_clk),
	.CE(1'd1),
	.D1(soc_eth_phy_sink_payload_data[0]),
	.D2(soc_eth_phy_sink_payload_data[4]),
	.R(1'd0),
	.S(1'd0),
	.Q(soc_eth_phy_tx_data_obuf[0])
);
OBUF OBUF_2(
	.I(soc_eth_phy_tx_data_obuf[0]),
	.O(eth_tx_data[0])
);
ODDR #(
	.DDR_CLK_EDGE("SAME_EDGE")
) ODDR_3 (
	.C(eth_tx_clk),
	.CE(1'd1),
	.D1(soc_eth_phy_sink_payload_data[1]),
	.D2(soc_eth_phy_sink_payload_data[5]),
	.R(1'd0),
	.S(1'd0),
	.Q(soc_eth_phy_tx_data_obuf[1])
);
OBUF OBUF_3(
	.I(soc_eth_phy_tx_data_obuf[1]),
	.O(eth_tx_data[1])
);
ODDR #(
	.DDR_CLK_EDGE("SAME_EDGE")
) ODDR_4 (
	.C(eth_tx_clk),
	.CE(1'd1),
	.D1(soc_eth_phy_sink_payload_data[2]),
	.D2(soc_eth_phy_sink_payload_data[6]),
	.R(1'd0),
	.S(1'd0),
	.Q(soc_eth_phy_tx_data_obuf[2])
);
OBUF OBUF_4(
	.I(soc_eth_phy_tx_data_obuf[2]),
	.O(eth_tx_data[2])
);
ODDR #(
	.DDR_CLK_EDGE("SAME_EDGE")
) ODDR_5 (
	.C(eth_tx_clk),
	.CE(1'd1),
	.D1(soc_eth_phy_sink_payload_data[3]),
	.D2(soc_eth_phy_sink_payload_data[7]),
	.R(1'd0),
	.S(1'd0),
	.Q(soc_eth_phy_tx_data_obuf[3])
);
OBUF OBUF_5(
	.I(soc_eth_phy_tx_data_obuf[3]),
	.O(eth_tx_data[3])
);
IBUF IBUF_1(
	.I(eth_rx_ctl),
	.O(soc_eth_phy_liteethphyrgmiirx_rx_ctl_ibuf)
);
IDELAYE2 #(
	.IDELAY_TYPE("FIXED"),
	.IDELAY_VALUE(5'd25)
) IDELAYE2 (
	.C(1'd0),
	.CE(1'd0),
	.IDATAIN(soc_eth_phy_liteethphyrgmiirx_rx_ctl_ibuf),
	.INC(1'd0),
	.LD(1'd0),
	.LDPIPEEN(1'd0),
	.DATAOUT(soc_eth_phy_liteethphyrgmiirx_rx_ctl_idelay)
);
IDDR #(
	.DDR_CLK_EDGE("SAME_EDGE_PIPELINED")
) IDDR (
	.C(eth_rx_clk),
	.CE(1'd1),
	.D(soc_eth_phy_liteethphyrgmiirx_rx_ctl_idelay),
	.R(1'd0),
	.S(1'd0),
	.Q1(soc_eth_phy_liteethphyrgmiirx_rx_ctl),
	.Q2(soc_eth_phy_liteethphyrgmiirx)
);
IBUF IBUF_2(
	.I(eth_rx_data[0]),
	.O(soc_eth_phy_liteethphyrgmiirx_rx_data_ibuf[0])
);
IDELAYE2 #(
	.IDELAY_TYPE("FIXED"),
	.IDELAY_VALUE(5'd25)
) IDELAYE2_1 (
	.C(1'd0),
	.CE(1'd0),
	.IDATAIN(soc_eth_phy_liteethphyrgmiirx_rx_data_ibuf[0]),
	.INC(1'd0),
	.LD(1'd0),
	.LDPIPEEN(1'd0),
	.DATAOUT(soc_eth_phy_liteethphyrgmiirx_rx_data_idelay[0])
);
IDDR #(
	.DDR_CLK_EDGE("SAME_EDGE_PIPELINED")
) IDDR_1 (
	.C(eth_rx_clk),
	.CE(1'd1),
	.D(soc_eth_phy_liteethphyrgmiirx_rx_data_idelay[0]),
	.R(1'd0),
	.S(1'd0),
	.Q1(soc_eth_phy_liteethphyrgmiirx_rx_data[0]),
	.Q2(soc_eth_phy_liteethphyrgmiirx_rx_data[4])
);
IBUF IBUF_3(
	.I(eth_rx_data[1]),
	.O(soc_eth_phy_liteethphyrgmiirx_rx_data_ibuf[1])
);
IDELAYE2 #(
	.IDELAY_TYPE("FIXED"),
	.IDELAY_VALUE(5'd25)
) IDELAYE2_2 (
	.C(1'd0),
	.CE(1'd0),
	.IDATAIN(soc_eth_phy_liteethphyrgmiirx_rx_data_ibuf[1]),
	.INC(1'd0),
	.LD(1'd0),
	.LDPIPEEN(1'd0),
	.DATAOUT(soc_eth_phy_liteethphyrgmiirx_rx_data_idelay[1])
);
IDDR #(
	.DDR_CLK_EDGE("SAME_EDGE_PIPELINED")
) IDDR_2 (
	.C(eth_rx_clk),
	.CE(1'd1),
	.D(soc_eth_phy_liteethphyrgmiirx_rx_data_idelay[1]),
	.R(1'd0),
	.S(1'd0),
	.Q1(soc_eth_phy_liteethphyrgmiirx_rx_data[1]),
	.Q2(soc_eth_phy_liteethphyrgmiirx_rx_data[5])
);
IBUF IBUF_4(
	.I(eth_rx_data[2]),
	.O(soc_eth_phy_liteethphyrgmiirx_rx_data_ibuf[2])
);
IDELAYE2 #(
	.IDELAY_TYPE("FIXED"),
	.IDELAY_VALUE(5'd25)
) IDELAYE2_3 (
	.C(1'd0),
	.CE(1'd0),
	.IDATAIN(soc_eth_phy_liteethphyrgmiirx_rx_data_ibuf[2]),
	.INC(1'd0),
	.LD(1'd0),
	.LDPIPEEN(1'd0),
	.DATAOUT(soc_eth_phy_liteethphyrgmiirx_rx_data_idelay[2])
);
IDDR #(
	.DDR_CLK_EDGE("SAME_EDGE_PIPELINED")
) IDDR_3 (
	.C(eth_rx_clk),
	.CE(1'd1),
	.D(soc_eth_phy_liteethphyrgmiirx_rx_data_idelay[2]),
	.R(1'd0),
	.S(1'd0),
	.Q1(soc_eth_phy_liteethphyrgmiirx_rx_data[2]),
	.Q2(soc_eth_phy_liteethphyrgmiirx_rx_data[6])
);
IBUF IBUF_5(
	.I(eth_rx_data[3]),
	.O(soc_eth_phy_liteethphyrgmiirx_rx_data_ibuf[3])
);
IDELAYE2 #(
	.IDELAY_TYPE("FIXED"),
	.IDELAY_VALUE(5'd25)
) IDELAYE2_4 (
	.C(1'd0),
	.CE(1'd0),
	.IDATAIN(soc_eth_phy_liteethphyrgmiirx_rx_data_ibuf[3]),
	.INC(1'd0),
	.LD(1'd0),
	.LDPIPEEN(1'd0),
	.DATAOUT(soc_eth_phy_liteethphyrgmiirx_rx_data_idelay[3])
);
IDDR #(
	.DDR_CLK_EDGE("SAME_EDGE_PIPELINED")
) IDDR_4 (
	.C(eth_rx_clk),
	.CE(1'd1),
	.D(soc_eth_phy_liteethphyrgmiirx_rx_data_idelay[3]),
	.R(1'd0),
	.S(1'd0),
	.Q1(soc_eth_phy_liteethphyrgmiirx_rx_data[3]),
	.Q2(soc_eth_phy_liteethphyrgmiirx_rx_data[7])
);
assign eth_mdio = soc_eth_phy_data_oe ? soc_eth_phy_data_w : 1'bz;
assign soc_eth_phy_data_r = eth_mdio;
reg [11:0] storage[0:4];
reg [11:0] memdat;
always @(posedge eth_rx_clk) begin
	if (soc_eth_core_mac_crc32_checker_syncfifo_wrport_we)
		storage[soc_eth_core_mac_crc32_checker_syncfifo_wrport_adr] <= soc_eth_core_mac_crc32_checker_syncfifo_wrport_dat_w;
	memdat <= storage[soc_eth_core_mac_crc32_checker_syncfifo_wrport_adr];
end
always @(posedge eth_rx_clk) begin
end
assign soc_eth_core_mac_crc32_checker_syncfifo_wrport_dat_r = memdat;
assign soc_eth_core_mac_crc32_checker_syncfifo_rdport_dat_r = storage[soc_eth_core_mac_crc32_checker_syncfifo_rdport_adr];
reg [11:0] storage_1[0:63];
reg [5:0] memadr_1;
reg [5:0] memadr_2;
always @(posedge sys_clk) begin
	if (soc_eth_core_mac_tx_cdc_wrport_we)
		storage_1[soc_eth_core_mac_tx_cdc_wrport_adr] <= soc_eth_core_mac_tx_cdc_wrport_dat_w;
	memadr_1 <= soc_eth_core_mac_tx_cdc_wrport_adr;
end
always @(posedge eth_tx_clk) begin
	memadr_2 <= soc_eth_core_mac_tx_cdc_rdport_adr;
end
assign soc_eth_core_mac_tx_cdc_wrport_dat_r = storage_1[memadr_1];
assign soc_eth_core_mac_tx_cdc_rdport_dat_r = storage_1[memadr_2];
reg [11:0] storage_2[0:63];
reg [5:0] memadr_3;
reg [5:0] memadr_4;
always @(posedge eth_rx_clk) begin
	if (soc_eth_core_mac_rx_cdc_wrport_we)
		storage_2[soc_eth_core_mac_rx_cdc_wrport_adr] <= soc_eth_core_mac_rx_cdc_wrport_dat_w;
	memadr_3 <= soc_eth_core_mac_rx_cdc_wrport_adr;
end
always @(posedge sys_clk) begin
	memadr_4 <= soc_eth_core_mac_rx_cdc_rdport_adr;
end
assign soc_eth_core_mac_rx_cdc_wrport_dat_r = storage_2[memadr_3];
assign soc_eth_core_mac_rx_cdc_rdport_dat_r = storage_2[memadr_4];
reg [122:0] storage_3[0:127];
reg [122:0] memdat_1;
reg [122:0] memdat_2;
always @(posedge sys_clk) begin
	if (soc_eth_core_icmp_echo_buffer_wrport_we)
		storage_3[soc_eth_core_icmp_echo_buffer_wrport_adr] <= soc_eth_core_icmp_echo_buffer_wrport_dat_w;
	memdat_1 <= storage_3[soc_eth_core_icmp_echo_buffer_wrport_adr];
end
always @(posedge sys_clk) begin
	if (soc_eth_core_icmp_echo_buffer_rdport_re)
		memdat_2 <= storage_3[soc_eth_core_icmp_echo_buffer_rdport_adr];
end
assign soc_eth_core_icmp_echo_buffer_wrport_dat_r = memdat_1;
assign soc_eth_core_icmp_echo_buffer_rdport_dat_r = memdat_2;
reg [67:0] storage_4[0:3];
reg [67:0] memdat_3;
reg [67:0] memdat_4;
always @(posedge sys_clk) begin
	if (soc_etherbone_record_receiver_fifo_wrport_we)
		storage_4[soc_etherbone_record_receiver_fifo_wrport_adr] <= soc_etherbone_record_receiver_fifo_wrport_dat_w;
	memdat_3 <= storage_4[soc_etherbone_record_receiver_fifo_wrport_adr];
end
always @(posedge sys_clk) begin
	if (soc_etherbone_record_receiver_fifo_rdport_re)
		memdat_4 <= storage_4[soc_etherbone_record_receiver_fifo_rdport_adr];
end
assign soc_etherbone_record_receiver_fifo_wrport_dat_r = memdat_3;
assign soc_etherbone_record_receiver_fifo_rdport_dat_r = memdat_4;
reg [110:0] storage_5[0:3];
reg [110:0] memdat_5;
reg [110:0] memdat_6;
always @(posedge sys_clk) begin
	if (soc_etherbone_record_sender_fifo_wrport_we)
		storage_5[soc_etherbone_record_sender_fifo_wrport_adr] <= soc_etherbone_record_sender_fifo_wrport_dat_w;
	memdat_5 <= storage_5[soc_etherbone_record_sender_fifo_wrport_adr];
end
always @(posedge sys_clk) begin
	if (soc_etherbone_record_sender_fifo_rdport_re)
		memdat_6 <= storage_5[soc_etherbone_record_sender_fifo_rdport_adr];
end
assign soc_etherbone_record_sender_fifo_wrport_dat_r = memdat_5;
assign soc_etherbone_record_sender_fifo_rdport_dat_r = memdat_6;
(* LOC="PLLE2_ADV_X0Y3" *)
PLLE2_ADV #(
	.CLKFBOUT_MULT(3'd4),
	.CLKIN1_PERIOD(4.0),
	.CLKOUT0_DIVIDE(4'd8),
	.CLKOUT0_PHASE(0.0),
	.CLKOUT1_DIVIDE(4'd8),
	.CLKOUT1_PHASE(90.0),
	.CLKOUT2_DIVIDE(5'd16),
	.CLKOUT2_PHASE(0.0),
	.CLKOUT3_DIVIDE(3'd4),
	.CLKOUT3_PHASE(90.0),
	.DIVCLK_DIVIDE(1'd1),
	.REF_JITTER1(0.01),
	.STARTUP_WAIT("FALSE")
) PLLE2_ADV_2 (
	.CLKFBIN(soc_phy_pipe_pll_fb),
	.CLKIN1(usb_pipe_data0_rx_clk),
	.CLKFBOUT(soc_phy_pipe_pll_fb),
	.CLKOUT0(soc_phy_pipe_half_clk_pll),
	.CLKOUT1(soc_phy_pipe_half_clk_phase_pll),
	.CLKOUT2(soc_phy_pipe_quarter_clk_pll),
	.CLKOUT3(soc_phy_pipe_tx_clk_phase_pll),
	.LOCKED(soc_phy_pipe_pll_locked)
);
BUFG BUFG_5(
	.I(soc_phy_pipe_half_clk_pll),
	.O(soc_phy_pipe_half_clk)
);
BUFG BUFG_6(
	.I(soc_phy_pipe_half_clk_phase_pll),
	.O(soc_phy_pipe_half_clk_phase)
);
BUFG BUFG_7(
	.I(soc_phy_pipe_quarter_clk_pll),
	.O(soc_phy_pipe_quarter_clk)
);
BUFG BUFG_8(
	.I(soc_phy_pipe_tx_clk_phase_pll),
	.O(soc_phy_pipe_tx_clk_phase)
);
assign usb_pipe_status0_phy_status = (~soc_usb3_reset_n) ? 1'd0 : 1'bz;
assign soc_usb_pipe_status_phy_status = usb_pipe_status0_phy_status;
usb3_top usb3_top(
	.buf_in_addr(soc_buf_in_addr_storage),
	.buf_in_commit((soc_buf_in_commit_re & soc_buf_in_commit_r)),
	.buf_in_commit_len(soc_buf_in_commit_len_storage),
	.buf_in_data(soc_buf_in_data_storage),
	.buf_in_wren((soc_buf_in_wren_re & soc_buf_in_wren_r)),
	.buf_out_addr(soc_buf_out_addr_storage),
	.buf_out_arm((soc_buf_out_arm_re & soc_buf_out_arm_r)),
	.ext_clk(sys_clk),
	.phy_phy_status_i(soc_phy_phy_status),
	.phy_pipe_half_clk(phy_pipe_half_clk),
	.phy_pipe_half_clk_phase(phy_pipe_half_phase_clk),
	.phy_pipe_quarter_clk(phy_pipe_quarter_clk),
	.phy_pipe_rx_data(soc_phy_pipe_rx_data),
	.phy_pipe_rx_datak(soc_phy_pipe_rx_datak),
	.phy_pipe_rx_valid(soc_phy_pipe_rx_valid),
	.phy_pwrpresent(usb_pipe_status0_pwr_present),
	.phy_rx_status(soc_phy_rx_status),
	.reset_n((soc_core_enable_storage | user_sw1)),
	.phy_rx_elecidle(usb_pipe_status0_rx_elecidle),
	.buf_in_commit_ack(soc_buf_in_commit_ack_status),
	.buf_in_ready(soc_buf_in_ready_status),
	.buf_in_request(soc_buf_in_request_status),
	.buf_out_arm_ack(soc_buf_out_arm_ack_status),
	.buf_out_hasdata(soc_buf_out_hasdata_status),
	.buf_out_len(soc_buf_out_len_status),
	.buf_out_q(soc_buf_out_q_status),
	.dbg_ltssm_state(soc_dbg_ltssm_state),
	.dbg_pipe_state(soc_dbg_pipe_state),
	.phy_elas_buf_mode(usb_pipe_ctrl0_elas_buf_mode),
	.phy_phy_reset_n(usb_pipe_ctrl0_phy_reset_n),
	.phy_pipe_tx_data(soc_phy_pipe_tx_data),
	.phy_pipe_tx_datak(soc_phy_pipe_tx_datak),
	.phy_power_down(usb_pipe_ctrl0_power_down),
	.phy_rate(usb_pipe_ctrl0_rate),
	.phy_rx_polarity(usb_pipe_ctrl0_rx_polarity),
	.phy_rx_termination(usb_pipe_ctrl0_rx_termination),
	.phy_tx_deemph(usb_pipe_ctrl0_tx_deemph),
	.phy_tx_detrx_lpbk(usb_pipe_ctrl0_tx_detrx_lpbk),
	.phy_tx_elecidle(usb_pipe_ctrl0_tx_elecidle),
	.phy_tx_margin(usb_pipe_ctrl0_tx_margin),
	.phy_tx_oneszeros(usb_pipe_ctrl0_tx_oneszeros),
	.phy_tx_swing(usb_pipe_ctrl0_tx_swing)
);
IDDR #(
	.DDR_CLK_EDGE("SAME_EDGE_PIPELINED")
) IDDR_5 (
	.C(phy_pipe_half_clk),
	.CE(1'd1),
	.D(usb_pipe_data0_rx_valid),
	.R(1'd0),
	.S(1'd0),
	.Q1(soc_phy_pipe_rx_valid[0]),
	.Q2(soc_phy_pipe_rx_valid[1])
);
IDDR #(
	.DDR_CLK_EDGE("SAME_EDGE_PIPELINED")
) IDDR_6 (
	.C(phy_pipe_half_clk),
	.CE(1'd1),
	.D(usb_pipe_data0_rx_data[0]),
	.R(1'd0),
	.S(1'd0),
	.Q1(soc_phy_pipe_rx_data[0]),
	.Q2(soc_phy_pipe_rx_data[16])
);
IDDR #(
	.DDR_CLK_EDGE("SAME_EDGE_PIPELINED")
) IDDR_7 (
	.C(phy_pipe_half_clk),
	.CE(1'd1),
	.D(usb_pipe_data0_rx_data[1]),
	.R(1'd0),
	.S(1'd0),
	.Q1(soc_phy_pipe_rx_data[1]),
	.Q2(soc_phy_pipe_rx_data[17])
);
IDDR #(
	.DDR_CLK_EDGE("SAME_EDGE_PIPELINED")
) IDDR_8 (
	.C(phy_pipe_half_clk),
	.CE(1'd1),
	.D(usb_pipe_data0_rx_data[2]),
	.R(1'd0),
	.S(1'd0),
	.Q1(soc_phy_pipe_rx_data[2]),
	.Q2(soc_phy_pipe_rx_data[18])
);
IDDR #(
	.DDR_CLK_EDGE("SAME_EDGE_PIPELINED")
) IDDR_9 (
	.C(phy_pipe_half_clk),
	.CE(1'd1),
	.D(usb_pipe_data0_rx_data[3]),
	.R(1'd0),
	.S(1'd0),
	.Q1(soc_phy_pipe_rx_data[3]),
	.Q2(soc_phy_pipe_rx_data[19])
);
IDDR #(
	.DDR_CLK_EDGE("SAME_EDGE_PIPELINED")
) IDDR_10 (
	.C(phy_pipe_half_clk),
	.CE(1'd1),
	.D(usb_pipe_data0_rx_data[4]),
	.R(1'd0),
	.S(1'd0),
	.Q1(soc_phy_pipe_rx_data[4]),
	.Q2(soc_phy_pipe_rx_data[20])
);
IDDR #(
	.DDR_CLK_EDGE("SAME_EDGE_PIPELINED")
) IDDR_11 (
	.C(phy_pipe_half_clk),
	.CE(1'd1),
	.D(usb_pipe_data0_rx_data[5]),
	.R(1'd0),
	.S(1'd0),
	.Q1(soc_phy_pipe_rx_data[5]),
	.Q2(soc_phy_pipe_rx_data[21])
);
IDDR #(
	.DDR_CLK_EDGE("SAME_EDGE_PIPELINED")
) IDDR_12 (
	.C(phy_pipe_half_clk),
	.CE(1'd1),
	.D(usb_pipe_data0_rx_data[6]),
	.R(1'd0),
	.S(1'd0),
	.Q1(soc_phy_pipe_rx_data[6]),
	.Q2(soc_phy_pipe_rx_data[22])
);
IDDR #(
	.DDR_CLK_EDGE("SAME_EDGE_PIPELINED")
) IDDR_13 (
	.C(phy_pipe_half_clk),
	.CE(1'd1),
	.D(usb_pipe_data0_rx_data[7]),
	.R(1'd0),
	.S(1'd0),
	.Q1(soc_phy_pipe_rx_data[7]),
	.Q2(soc_phy_pipe_rx_data[23])
);
IDDR #(
	.DDR_CLK_EDGE("SAME_EDGE_PIPELINED")
) IDDR_14 (
	.C(phy_pipe_half_clk),
	.CE(1'd1),
	.D(usb_pipe_data0_rx_data[8]),
	.R(1'd0),
	.S(1'd0),
	.Q1(soc_phy_pipe_rx_data[8]),
	.Q2(soc_phy_pipe_rx_data[24])
);
IDDR #(
	.DDR_CLK_EDGE("SAME_EDGE_PIPELINED")
) IDDR_15 (
	.C(phy_pipe_half_clk),
	.CE(1'd1),
	.D(usb_pipe_data0_rx_data[9]),
	.R(1'd0),
	.S(1'd0),
	.Q1(soc_phy_pipe_rx_data[9]),
	.Q2(soc_phy_pipe_rx_data[25])
);
IDDR #(
	.DDR_CLK_EDGE("SAME_EDGE_PIPELINED")
) IDDR_16 (
	.C(phy_pipe_half_clk),
	.CE(1'd1),
	.D(usb_pipe_data0_rx_data[10]),
	.R(1'd0),
	.S(1'd0),
	.Q1(soc_phy_pipe_rx_data[10]),
	.Q2(soc_phy_pipe_rx_data[26])
);
IDDR #(
	.DDR_CLK_EDGE("SAME_EDGE_PIPELINED")
) IDDR_17 (
	.C(phy_pipe_half_clk),
	.CE(1'd1),
	.D(usb_pipe_data0_rx_data[11]),
	.R(1'd0),
	.S(1'd0),
	.Q1(soc_phy_pipe_rx_data[11]),
	.Q2(soc_phy_pipe_rx_data[27])
);
IDDR #(
	.DDR_CLK_EDGE("SAME_EDGE_PIPELINED")
) IDDR_18 (
	.C(phy_pipe_half_clk),
	.CE(1'd1),
	.D(usb_pipe_data0_rx_data[12]),
	.R(1'd0),
	.S(1'd0),
	.Q1(soc_phy_pipe_rx_data[12]),
	.Q2(soc_phy_pipe_rx_data[28])
);
IDDR #(
	.DDR_CLK_EDGE("SAME_EDGE_PIPELINED")
) IDDR_19 (
	.C(phy_pipe_half_clk),
	.CE(1'd1),
	.D(usb_pipe_data0_rx_data[13]),
	.R(1'd0),
	.S(1'd0),
	.Q1(soc_phy_pipe_rx_data[13]),
	.Q2(soc_phy_pipe_rx_data[29])
);
IDDR #(
	.DDR_CLK_EDGE("SAME_EDGE_PIPELINED")
) IDDR_20 (
	.C(phy_pipe_half_clk),
	.CE(1'd1),
	.D(usb_pipe_data0_rx_data[14]),
	.R(1'd0),
	.S(1'd0),
	.Q1(soc_phy_pipe_rx_data[14]),
	.Q2(soc_phy_pipe_rx_data[30])
);
IDDR #(
	.DDR_CLK_EDGE("SAME_EDGE_PIPELINED")
) IDDR_21 (
	.C(phy_pipe_half_clk),
	.CE(1'd1),
	.D(usb_pipe_data0_rx_data[15]),
	.R(1'd0),
	.S(1'd0),
	.Q1(soc_phy_pipe_rx_data[15]),
	.Q2(soc_phy_pipe_rx_data[31])
);
IDDR #(
	.DDR_CLK_EDGE("SAME_EDGE_PIPELINED")
) IDDR_22 (
	.C(phy_pipe_half_clk),
	.CE(1'd1),
	.D(usb_pipe_data0_rx_datak[0]),
	.R(1'd0),
	.S(1'd0),
	.Q1(soc_phy_pipe_rx_datak[0]),
	.Q2(soc_phy_pipe_rx_datak[2])
);
IDDR #(
	.DDR_CLK_EDGE("SAME_EDGE_PIPELINED")
) IDDR_23 (
	.C(phy_pipe_half_clk),
	.CE(1'd1),
	.D(usb_pipe_data0_rx_datak[1]),
	.R(1'd0),
	.S(1'd0),
	.Q1(soc_phy_pipe_rx_datak[1]),
	.Q2(soc_phy_pipe_rx_datak[3])
);
IDDR #(
	.DDR_CLK_EDGE("SAME_EDGE_PIPELINED")
) IDDR_24 (
	.C(phy_pipe_half_clk),
	.CE(1'd1),
	.D(usb_pipe_status0_rx_status[0]),
	.R(1'd0),
	.S(1'd0),
	.Q1(soc_phy_rx_status[0]),
	.Q2(soc_phy_rx_status[3])
);
IDDR #(
	.DDR_CLK_EDGE("SAME_EDGE_PIPELINED")
) IDDR_25 (
	.C(phy_pipe_half_clk),
	.CE(1'd1),
	.D(usb_pipe_status0_rx_status[1]),
	.R(1'd0),
	.S(1'd0),
	.Q1(soc_phy_rx_status[1]),
	.Q2(soc_phy_rx_status[4])
);
IDDR #(
	.DDR_CLK_EDGE("SAME_EDGE_PIPELINED")
) IDDR_26 (
	.C(phy_pipe_half_clk),
	.CE(1'd1),
	.D(usb_pipe_status0_rx_status[2]),
	.R(1'd0),
	.S(1'd0),
	.Q1(soc_phy_rx_status[2]),
	.Q2(soc_phy_rx_status[5])
);
IDDR #(
	.DDR_CLK_EDGE("SAME_EDGE_PIPELINED")
) IDDR_27 (
	.C(phy_pipe_half_clk),
	.CE(1'd1),
	.D(soc_usb_pipe_status_phy_status),
	.R(1'd0),
	.S(1'd0),
	.Q1(soc_phy_phy_status[0]),
	.Q2(soc_phy_phy_status[1])
);
ODDR #(
	.DDR_CLK_EDGE("SAME_EDGE")
) ODDR_6 (
	.C(phy_pipe_tx_phase_clk),
	.CE(1'd1),
	.D1(1'd1),
	.D2(1'd0),
	.R(1'd0),
	.S(1'd0),
	.Q(usb_pipe_data0_tx_clk)
);
ODDR #(
	.DDR_CLK_EDGE("SAME_EDGE")
) ODDR_7 (
	.C(phy_pipe_half_phase_clk),
	.CE(1'd1),
	.D1(soc_phy_pipe_tx_data[0]),
	.D2(soc_phy_pipe_tx_data[16]),
	.R(1'd0),
	.S(1'd0),
	.Q(usb_pipe_data0_tx_data[0])
);
ODDR #(
	.DDR_CLK_EDGE("SAME_EDGE")
) ODDR_8 (
	.C(phy_pipe_half_phase_clk),
	.CE(1'd1),
	.D1(soc_phy_pipe_tx_data[1]),
	.D2(soc_phy_pipe_tx_data[17]),
	.R(1'd0),
	.S(1'd0),
	.Q(usb_pipe_data0_tx_data[1])
);
ODDR #(
	.DDR_CLK_EDGE("SAME_EDGE")
) ODDR_9 (
	.C(phy_pipe_half_phase_clk),
	.CE(1'd1),
	.D1(soc_phy_pipe_tx_data[2]),
	.D2(soc_phy_pipe_tx_data[18]),
	.R(1'd0),
	.S(1'd0),
	.Q(usb_pipe_data0_tx_data[2])
);
ODDR #(
	.DDR_CLK_EDGE("SAME_EDGE")
) ODDR_10 (
	.C(phy_pipe_half_phase_clk),
	.CE(1'd1),
	.D1(soc_phy_pipe_tx_data[3]),
	.D2(soc_phy_pipe_tx_data[19]),
	.R(1'd0),
	.S(1'd0),
	.Q(usb_pipe_data0_tx_data[3])
);
ODDR #(
	.DDR_CLK_EDGE("SAME_EDGE")
) ODDR_11 (
	.C(phy_pipe_half_phase_clk),
	.CE(1'd1),
	.D1(soc_phy_pipe_tx_data[4]),
	.D2(soc_phy_pipe_tx_data[20]),
	.R(1'd0),
	.S(1'd0),
	.Q(usb_pipe_data0_tx_data[4])
);
ODDR #(
	.DDR_CLK_EDGE("SAME_EDGE")
) ODDR_12 (
	.C(phy_pipe_half_phase_clk),
	.CE(1'd1),
	.D1(soc_phy_pipe_tx_data[5]),
	.D2(soc_phy_pipe_tx_data[21]),
	.R(1'd0),
	.S(1'd0),
	.Q(usb_pipe_data0_tx_data[5])
);
ODDR #(
	.DDR_CLK_EDGE("SAME_EDGE")
) ODDR_13 (
	.C(phy_pipe_half_phase_clk),
	.CE(1'd1),
	.D1(soc_phy_pipe_tx_data[6]),
	.D2(soc_phy_pipe_tx_data[22]),
	.R(1'd0),
	.S(1'd0),
	.Q(usb_pipe_data0_tx_data[6])
);
ODDR #(
	.DDR_CLK_EDGE("SAME_EDGE")
) ODDR_14 (
	.C(phy_pipe_half_phase_clk),
	.CE(1'd1),
	.D1(soc_phy_pipe_tx_data[7]),
	.D2(soc_phy_pipe_tx_data[23]),
	.R(1'd0),
	.S(1'd0),
	.Q(usb_pipe_data0_tx_data[7])
);
ODDR #(
	.DDR_CLK_EDGE("SAME_EDGE")
) ODDR_15 (
	.C(phy_pipe_half_phase_clk),
	.CE(1'd1),
	.D1(soc_phy_pipe_tx_data[8]),
	.D2(soc_phy_pipe_tx_data[24]),
	.R(1'd0),
	.S(1'd0),
	.Q(usb_pipe_data0_tx_data[8])
);
ODDR #(
	.DDR_CLK_EDGE("SAME_EDGE")
) ODDR_16 (
	.C(phy_pipe_half_phase_clk),
	.CE(1'd1),
	.D1(soc_phy_pipe_tx_data[9]),
	.D2(soc_phy_pipe_tx_data[25]),
	.R(1'd0),
	.S(1'd0),
	.Q(usb_pipe_data0_tx_data[9])
);
ODDR #(
	.DDR_CLK_EDGE("SAME_EDGE")
) ODDR_17 (
	.C(phy_pipe_half_phase_clk),
	.CE(1'd1),
	.D1(soc_phy_pipe_tx_data[10]),
	.D2(soc_phy_pipe_tx_data[26]),
	.R(1'd0),
	.S(1'd0),
	.Q(usb_pipe_data0_tx_data[10])
);
ODDR #(
	.DDR_CLK_EDGE("SAME_EDGE")
) ODDR_18 (
	.C(phy_pipe_half_phase_clk),
	.CE(1'd1),
	.D1(soc_phy_pipe_tx_data[11]),
	.D2(soc_phy_pipe_tx_data[27]),
	.R(1'd0),
	.S(1'd0),
	.Q(usb_pipe_data0_tx_data[11])
);
ODDR #(
	.DDR_CLK_EDGE("SAME_EDGE")
) ODDR_19 (
	.C(phy_pipe_half_phase_clk),
	.CE(1'd1),
	.D1(soc_phy_pipe_tx_data[12]),
	.D2(soc_phy_pipe_tx_data[28]),
	.R(1'd0),
	.S(1'd0),
	.Q(usb_pipe_data0_tx_data[12])
);
ODDR #(
	.DDR_CLK_EDGE("SAME_EDGE")
) ODDR_20 (
	.C(phy_pipe_half_phase_clk),
	.CE(1'd1),
	.D1(soc_phy_pipe_tx_data[13]),
	.D2(soc_phy_pipe_tx_data[29]),
	.R(1'd0),
	.S(1'd0),
	.Q(usb_pipe_data0_tx_data[13])
);
ODDR #(
	.DDR_CLK_EDGE("SAME_EDGE")
) ODDR_21 (
	.C(phy_pipe_half_phase_clk),
	.CE(1'd1),
	.D1(soc_phy_pipe_tx_data[14]),
	.D2(soc_phy_pipe_tx_data[30]),
	.R(1'd0),
	.S(1'd0),
	.Q(usb_pipe_data0_tx_data[14])
);
ODDR #(
	.DDR_CLK_EDGE("SAME_EDGE")
) ODDR_22 (
	.C(phy_pipe_half_phase_clk),
	.CE(1'd1),
	.D1(soc_phy_pipe_tx_data[15]),
	.D2(soc_phy_pipe_tx_data[31]),
	.R(1'd0),
	.S(1'd0),
	.Q(usb_pipe_data0_tx_data[15])
);
ODDR #(
	.DDR_CLK_EDGE("SAME_EDGE")
) ODDR_23 (
	.C(phy_pipe_half_phase_clk),
	.CE(1'd1),
	.D1(soc_phy_pipe_tx_datak[0]),
	.D2(soc_phy_pipe_tx_datak[2]),
	.R(1'd0),
	.S(1'd0),
	.Q(usb_pipe_data0_tx_datak[0])
);
ODDR #(
	.DDR_CLK_EDGE("SAME_EDGE")
) ODDR_24 (
	.C(phy_pipe_half_phase_clk),
	.CE(1'd1),
	.D1(soc_phy_pipe_tx_datak[1]),
	.D2(soc_phy_pipe_tx_datak[3]),
	.R(1'd0),
	.S(1'd0),
	.Q(usb_pipe_data0_tx_datak[1])
);
(* LOC="PLLE2_ADV_X0Y2" *)
PLLE2_ADV #(
	.CLKFBOUT_MULT(4'd12),
	.CLKIN1_PERIOD(8.0),
	.CLKOUT0_DIVIDE(4'd12),
	.CLKOUT0_PHASE(1'd0),
	.CLKOUT1_DIVIDE(4'd12),
	.CLKOUT1_PHASE(90.0),
	.DIVCLK_DIVIDE(1'd1),
	.REF_JITTER1(0.01),
	.STARTUP_WAIT("FALSE")
) PLLE2_ADV (
	.CLKFBIN(vns_pll_fb),
	.CLKIN1(soc_eth_phy_clkin),
	.RST(soc_eth_phy_pll_reset),
	.CLKFBOUT(vns_pll_fb),
	.CLKOUT0(soc_eth_phy_clkout0),
	.CLKOUT1(soc_eth_phy_clkout1),
	.LOCKED(soc_eth_phy_pll_locked)
);
(* ars_ff1 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE (
	.C(sys_clk),
	.CE(1'd1),
	.D(1'd0),
	.PRE(vns_xilinxasyncresetsynchronizerimpl0),
	.Q(vns_xilinxasyncresetsynchronizerimpl0_rst_meta)
);
(* ars_ff2 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_1 (
	.C(sys_clk),
	.CE(1'd1),
	.D(vns_xilinxasyncresetsynchronizerimpl0_rst_meta),
	.PRE(vns_xilinxasyncresetsynchronizerimpl0),
	.Q(sys_rst)
);
(* ars_ff1 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_2 (
	.C(clk200_clk),
	.CE(1'd1),
	.D(1'd0),
	.PRE(vns_xilinxasyncresetsynchronizerimpl1),
	.Q(vns_xilinxasyncresetsynchronizerimpl1_rst_meta)
);
(* ars_ff2 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_3 (
	.C(clk200_clk),
	.CE(1'd1),
	.D(vns_xilinxasyncresetsynchronizerimpl1_rst_meta),
	.PRE(vns_xilinxasyncresetsynchronizerimpl1),
	.Q(clk200_rst)
);
(* ars_ff1 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_4 (
	.C(eth_tx_delayed_clk),
	.CE(1'd1),
	.D(1'd0),
	.PRE(vns_xilinxasyncresetsynchronizerimpl2),
	.Q(vns_xilinxasyncresetsynchronizerimpl2_rst_meta)
);
(* ars_ff2 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_5 (
	.C(eth_tx_delayed_clk),
	.CE(1'd1),
	.D(vns_xilinxasyncresetsynchronizerimpl2_rst_meta),
	.PRE(vns_xilinxasyncresetsynchronizerimpl2),
	.Q(vns_xilinxasyncresetsynchronizerimpl2_expr)
);
(* ars_ff1 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_6 (
	.C(eth_tx_clk),
	.CE(1'd1),
	.D(1'd0),
	.PRE(soc_eth_phy_reset),
	.Q(vns_xilinxasyncresetsynchronizerimpl3_rst_meta)
);
(* ars_ff2 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_7 (
	.C(eth_tx_clk),
	.CE(1'd1),
	.D(vns_xilinxasyncresetsynchronizerimpl3_rst_meta),
	.PRE(soc_eth_phy_reset),
	.Q(eth_tx_rst)
);
(* ars_ff1 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_8 (
	.C(eth_rx_clk),
	.CE(1'd1),
	.D(1'd0),
	.PRE(soc_eth_phy_reset),
	.Q(vns_xilinxasyncresetsynchronizerimpl4_rst_meta)
);
(* ars_ff2 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_9 (
	.C(eth_rx_clk),
	.CE(1'd1),
	.D(vns_xilinxasyncresetsynchronizerimpl4_rst_meta),
	.PRE(soc_eth_phy_reset),
	.Q(eth_rx_rst)
);
(* ars_ff1 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_10 (
	.C(phy_pipe_half_clk),
	.CE(1'd1),
	.D(1'd0),
	.PRE(vns_xilinxasyncresetsynchronizerimpl5),
	.Q(vns_xilinxasyncresetsynchronizerimpl5_rst_meta)
);
(* ars_ff2 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_11 (
	.C(phy_pipe_half_clk),
	.CE(1'd1),
	.D(vns_xilinxasyncresetsynchronizerimpl5_rst_meta),
	.PRE(vns_xilinxasyncresetsynchronizerimpl5),
	.Q(phy_pipe_half_rst)
);
(* ars_ff1 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_12 (
	.C(phy_pipe_half_phase_clk),
	.CE(1'd1),
	.D(1'd0),
	.PRE(vns_xilinxasyncresetsynchronizerimpl6),
	.Q(vns_xilinxasyncresetsynchronizerimpl6_rst_meta)
);
(* ars_ff2 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_13 (
	.C(phy_pipe_half_phase_clk),
	.CE(1'd1),
	.D(vns_xilinxasyncresetsynchronizerimpl6_rst_meta),
	.PRE(vns_xilinxasyncresetsynchronizerimpl6),
	.Q(phy_pipe_half_phase_rst)
);
(* ars_ff1 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_14 (
	.C(phy_pipe_quarter_clk),
	.CE(1'd1),
	.D(1'd0),
	.PRE(vns_xilinxasyncresetsynchronizerimpl7),
	.Q(vns_xilinxasyncresetsynchronizerimpl7_rst_meta)
);
(* ars_ff2 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_15 (
	.C(phy_pipe_quarter_clk),
	.CE(1'd1),
	.D(vns_xilinxasyncresetsynchronizerimpl7_rst_meta),
	.PRE(vns_xilinxasyncresetsynchronizerimpl7),
	.Q(phy_pipe_quarter_rst)
);
(* ars_ff1 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_16 (
	.C(phy_pipe_tx_phase_clk),
	.CE(1'd1),
	.D(1'd0),
	.PRE(vns_xilinxasyncresetsynchronizerimpl8),
	.Q(vns_xilinxasyncresetsynchronizerimpl8_rst_meta)
);
(* ars_ff2 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_17 (
	.C(phy_pipe_tx_phase_clk),
	.CE(1'd1),
	.D(vns_xilinxasyncresetsynchronizerimpl8_rst_meta),
	.PRE(vns_xilinxasyncresetsynchronizerimpl8),
	.Q(phy_pipe_tx_phase_rst)
);
endmodule