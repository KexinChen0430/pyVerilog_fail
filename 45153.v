module top(
	output reg serial_tx,
	input wire serial_rx,
	input wire cpu_reset,
	(* dont_touch = "true" *)	input wire clk100,
	output wire eth_ref_clk,
	output wire [13:0] ddram_a,
	output wire [2:0] ddram_ba,
	output wire ddram_ras_n,
	output wire ddram_cas_n,
	output wire ddram_we_n,
	output wire ddram_cs_n,
	output wire [1:0] ddram_dm,
	inout wire [15:0] ddram_dq,
	inout wire [1:0] ddram_dqs_p,
	inout wire [1:0] ddram_dqs_n,
	output wire ddram_clk_p,
	output wire ddram_clk_n,
	output wire ddram_cke,
	output wire ddram_odt,
	output wire ddram_reset_n
);
reg main_basesoc_soccontroller_reset_storage = 1'd0;
reg main_basesoc_soccontroller_reset_re = 1'd0;
reg [31:0] main_basesoc_soccontroller_scratch_storage = 32'd305419896;
reg main_basesoc_soccontroller_scratch_re = 1'd0;
wire [31:0] main_basesoc_soccontroller_bus_errors_status;
wire main_basesoc_soccontroller_bus_errors_we;
wire main_basesoc_soccontroller_reset;
wire main_basesoc_soccontroller_bus_error;
reg [31:0] main_basesoc_soccontroller_bus_errors = 32'd0;
wire main_basesoc_vexriscvsmp_reset;
wire [29:0] main_basesoc_vexriscvsmp_pbus_adr;
wire [31:0] main_basesoc_vexriscvsmp_pbus_dat_w;
wire [31:0] main_basesoc_vexriscvsmp_pbus_dat_r;
wire [3:0] main_basesoc_vexriscvsmp_pbus_sel;
wire main_basesoc_vexriscvsmp_pbus_cyc;
wire main_basesoc_vexriscvsmp_pbus_stb;
wire main_basesoc_vexriscvsmp_pbus_ack;
wire main_basesoc_vexriscvsmp_pbus_we;
wire [2:0] main_basesoc_vexriscvsmp_pbus_cti;
wire [1:0] main_basesoc_vexriscvsmp_pbus_bte;
wire main_basesoc_vexriscvsmp_pbus_err;
wire main_basesoc_vexriscvsmp_ibus_cmd_valid;
wire main_basesoc_vexriscvsmp_ibus_cmd_ready;
reg main_basesoc_vexriscvsmp_ibus_cmd_first = 1'd0;
reg main_basesoc_vexriscvsmp_ibus_cmd_last = 1'd0;
wire main_basesoc_vexriscvsmp_ibus_cmd_payload_we;
wire [31:0] main_basesoc_vexriscvsmp_ibus_cmd_payload_addr;
wire main_basesoc_vexriscvsmp_ibus_wdata_valid;
wire main_basesoc_vexriscvsmp_ibus_wdata_ready;
reg main_basesoc_vexriscvsmp_ibus_wdata_first = 1'd0;
reg main_basesoc_vexriscvsmp_ibus_wdata_last = 1'd0;
wire [127:0] main_basesoc_vexriscvsmp_ibus_wdata_payload_data;
wire [15:0] main_basesoc_vexriscvsmp_ibus_wdata_payload_we;
wire main_basesoc_vexriscvsmp_ibus_rdata_valid;
wire main_basesoc_vexriscvsmp_ibus_rdata_ready;
wire main_basesoc_vexriscvsmp_ibus_rdata_first;
wire main_basesoc_vexriscvsmp_ibus_rdata_last;
wire [127:0] main_basesoc_vexriscvsmp_ibus_rdata_payload_data;
wire main_basesoc_vexriscvsmp_dbus_cmd_valid;
wire main_basesoc_vexriscvsmp_dbus_cmd_ready;
reg main_basesoc_vexriscvsmp_dbus_cmd_first = 1'd0;
reg main_basesoc_vexriscvsmp_dbus_cmd_last = 1'd0;
wire main_basesoc_vexriscvsmp_dbus_cmd_payload_we;
wire [31:0] main_basesoc_vexriscvsmp_dbus_cmd_payload_addr;
wire main_basesoc_vexriscvsmp_dbus_wdata_valid;
wire main_basesoc_vexriscvsmp_dbus_wdata_ready;
reg main_basesoc_vexriscvsmp_dbus_wdata_first = 1'd0;
reg main_basesoc_vexriscvsmp_dbus_wdata_last = 1'd0;
wire [127:0] main_basesoc_vexriscvsmp_dbus_wdata_payload_data;
wire [15:0] main_basesoc_vexriscvsmp_dbus_wdata_payload_we;
wire main_basesoc_vexriscvsmp_dbus_rdata_valid;
wire main_basesoc_vexriscvsmp_dbus_rdata_ready;
wire main_basesoc_vexriscvsmp_dbus_rdata_first;
wire main_basesoc_vexriscvsmp_dbus_rdata_last;
wire [127:0] main_basesoc_vexriscvsmp_dbus_rdata_payload_data;
wire [29:0] main_basesoc_vexriscvsmp_cbus_adr;
wire [31:0] main_basesoc_vexriscvsmp_cbus_dat_w;
wire [31:0] main_basesoc_vexriscvsmp_cbus_dat_r;
wire [3:0] main_basesoc_vexriscvsmp_cbus_sel;
wire main_basesoc_vexriscvsmp_cbus_cyc;
wire main_basesoc_vexriscvsmp_cbus_stb;
wire main_basesoc_vexriscvsmp_cbus_ack;
wire main_basesoc_vexriscvsmp_cbus_we;
wire [2:0] main_basesoc_vexriscvsmp_cbus_cti;
wire [1:0] main_basesoc_vexriscvsmp_cbus_bte;
reg main_basesoc_vexriscvsmp_cbus_err = 1'd0;
wire main_basesoc_vexriscvsmp0;
wire main_basesoc_vexriscvsmp1;
wire [29:0] main_basesoc_basesoc_ram_bus_adr;
wire [31:0] main_basesoc_basesoc_ram_bus_dat_w;
wire [31:0] main_basesoc_basesoc_ram_bus_dat_r;
wire [3:0] main_basesoc_basesoc_ram_bus_sel;
wire main_basesoc_basesoc_ram_bus_cyc;
wire main_basesoc_basesoc_ram_bus_stb;
reg main_basesoc_basesoc_ram_bus_ack = 1'd0;
wire main_basesoc_basesoc_ram_bus_we;
wire [2:0] main_basesoc_basesoc_ram_bus_cti;
wire [1:0] main_basesoc_basesoc_ram_bus_bte;
reg main_basesoc_basesoc_ram_bus_err = 1'd0;
wire [12:0] main_basesoc_basesoc_adr;
wire [31:0] main_basesoc_basesoc_dat_r;
wire [29:0] main_basesoc_ram_bus_ram_bus_adr;
wire [31:0] main_basesoc_ram_bus_ram_bus_dat_w;
wire [31:0] main_basesoc_ram_bus_ram_bus_dat_r;
wire [3:0] main_basesoc_ram_bus_ram_bus_sel;
wire main_basesoc_ram_bus_ram_bus_cyc;
wire main_basesoc_ram_bus_ram_bus_stb;
reg main_basesoc_ram_bus_ram_bus_ack = 1'd0;
wire main_basesoc_ram_bus_ram_bus_we;
wire [2:0] main_basesoc_ram_bus_ram_bus_cti;
wire [1:0] main_basesoc_ram_bus_ram_bus_bte;
reg main_basesoc_ram_bus_ram_bus_err = 1'd0;
wire [9:0] main_basesoc_ram_adr;
wire [31:0] main_basesoc_ram_dat_r;
reg [3:0] main_basesoc_ram_we = 4'd0;
wire [31:0] main_basesoc_ram_dat_w;
reg [31:0] main_basesoc_storage = 32'd42949672;
reg main_basesoc_re = 1'd0;
wire main_basesoc_sink_valid;
reg main_basesoc_sink_ready = 1'd0;
wire main_basesoc_sink_first;
wire main_basesoc_sink_last;
wire [7:0] main_basesoc_sink_payload_data;
reg main_basesoc_uart_clk_txen = 1'd0;
reg [31:0] main_basesoc_phase_accumulator_tx = 32'd0;
reg [7:0] main_basesoc_tx_reg = 8'd0;
reg [3:0] main_basesoc_tx_bitcount = 4'd0;
reg main_basesoc_tx_busy = 1'd0;
reg main_basesoc_source_valid = 1'd0;
wire main_basesoc_source_ready;
reg main_basesoc_source_first = 1'd0;
reg main_basesoc_source_last = 1'd0;
reg [7:0] main_basesoc_source_payload_data = 8'd0;
reg main_basesoc_uart_clk_rxen = 1'd0;
reg [31:0] main_basesoc_phase_accumulator_rx = 32'd0;
wire main_basesoc_rx;
reg main_basesoc_rx_r = 1'd0;
reg [7:0] main_basesoc_rx_reg = 8'd0;
reg [3:0] main_basesoc_rx_bitcount = 4'd0;
reg main_basesoc_rx_busy = 1'd0;
wire main_basesoc_uart_rxtx_re;
wire [7:0] main_basesoc_uart_rxtx_r;
wire main_basesoc_uart_rxtx_we;
wire [7:0] main_basesoc_uart_rxtx_w;
wire main_basesoc_uart_txfull_status;
wire main_basesoc_uart_txfull_we;
wire main_basesoc_uart_rxempty_status;
wire main_basesoc_uart_rxempty_we;
wire main_basesoc_uart_irq;
wire main_basesoc_uart_tx_status;
reg main_basesoc_uart_tx_pending = 1'd0;
wire main_basesoc_uart_tx_trigger;
reg main_basesoc_uart_tx_clear = 1'd0;
reg main_basesoc_uart_tx_old_trigger = 1'd0;
wire main_basesoc_uart_rx_status;
reg main_basesoc_uart_rx_pending = 1'd0;
wire main_basesoc_uart_rx_trigger;
reg main_basesoc_uart_rx_clear = 1'd0;
reg main_basesoc_uart_rx_old_trigger = 1'd0;
wire main_basesoc_uart_eventmanager_status_re;
wire [1:0] main_basesoc_uart_eventmanager_status_r;
wire main_basesoc_uart_eventmanager_status_we;
reg [1:0] main_basesoc_uart_eventmanager_status_w = 2'd0;
wire main_basesoc_uart_eventmanager_pending_re;
wire [1:0] main_basesoc_uart_eventmanager_pending_r;
wire main_basesoc_uart_eventmanager_pending_we;
reg [1:0] main_basesoc_uart_eventmanager_pending_w = 2'd0;
reg [1:0] main_basesoc_uart_eventmanager_storage = 2'd0;
reg main_basesoc_uart_eventmanager_re = 1'd0;
wire main_basesoc_uart_uart_sink_valid;
wire main_basesoc_uart_uart_sink_ready;
wire main_basesoc_uart_uart_sink_first;
wire main_basesoc_uart_uart_sink_last;
wire [7:0] main_basesoc_uart_uart_sink_payload_data;
wire main_basesoc_uart_uart_source_valid;
wire main_basesoc_uart_uart_source_ready;
wire main_basesoc_uart_uart_source_first;
wire main_basesoc_uart_uart_source_last;
wire [7:0] main_basesoc_uart_uart_source_payload_data;
wire main_basesoc_uart_tx_fifo_sink_valid;
wire main_basesoc_uart_tx_fifo_sink_ready;
reg main_basesoc_uart_tx_fifo_sink_first = 1'd0;
reg main_basesoc_uart_tx_fifo_sink_last = 1'd0;
wire [7:0] main_basesoc_uart_tx_fifo_sink_payload_data;
wire main_basesoc_uart_tx_fifo_source_valid;
wire main_basesoc_uart_tx_fifo_source_ready;
wire main_basesoc_uart_tx_fifo_source_first;
wire main_basesoc_uart_tx_fifo_source_last;
wire [7:0] main_basesoc_uart_tx_fifo_source_payload_data;
wire main_basesoc_uart_tx_fifo_re;
reg main_basesoc_uart_tx_fifo_readable = 1'd0;
wire main_basesoc_uart_tx_fifo_syncfifo_we;
wire main_basesoc_uart_tx_fifo_syncfifo_writable;
wire main_basesoc_uart_tx_fifo_syncfifo_re;
wire main_basesoc_uart_tx_fifo_syncfifo_readable;
wire [9:0] main_basesoc_uart_tx_fifo_syncfifo_din;
wire [9:0] main_basesoc_uart_tx_fifo_syncfifo_dout;
reg [4:0] main_basesoc_uart_tx_fifo_level0 = 5'd0;
reg main_basesoc_uart_tx_fifo_replace = 1'd0;
reg [3:0] main_basesoc_uart_tx_fifo_produce = 4'd0;
reg [3:0] main_basesoc_uart_tx_fifo_consume = 4'd0;
reg [3:0] main_basesoc_uart_tx_fifo_wrport_adr = 4'd0;
wire [9:0] main_basesoc_uart_tx_fifo_wrport_dat_r;
wire main_basesoc_uart_tx_fifo_wrport_we;
wire [9:0] main_basesoc_uart_tx_fifo_wrport_dat_w;
wire main_basesoc_uart_tx_fifo_do_read;
wire [3:0] main_basesoc_uart_tx_fifo_rdport_adr;
wire [9:0] main_basesoc_uart_tx_fifo_rdport_dat_r;
wire main_basesoc_uart_tx_fifo_rdport_re;
wire [4:0] main_basesoc_uart_tx_fifo_level1;
wire [7:0] main_basesoc_uart_tx_fifo_fifo_in_payload_data;
wire main_basesoc_uart_tx_fifo_fifo_in_first;
wire main_basesoc_uart_tx_fifo_fifo_in_last;
wire [7:0] main_basesoc_uart_tx_fifo_fifo_out_payload_data;
wire main_basesoc_uart_tx_fifo_fifo_out_first;
wire main_basesoc_uart_tx_fifo_fifo_out_last;
wire main_basesoc_uart_rx_fifo_sink_valid;
wire main_basesoc_uart_rx_fifo_sink_ready;
wire main_basesoc_uart_rx_fifo_sink_first;
wire main_basesoc_uart_rx_fifo_sink_last;
wire [7:0] main_basesoc_uart_rx_fifo_sink_payload_data;
wire main_basesoc_uart_rx_fifo_source_valid;
wire main_basesoc_uart_rx_fifo_source_ready;
wire main_basesoc_uart_rx_fifo_source_first;
wire main_basesoc_uart_rx_fifo_source_last;
wire [7:0] main_basesoc_uart_rx_fifo_source_payload_data;
wire main_basesoc_uart_rx_fifo_re;
reg main_basesoc_uart_rx_fifo_readable = 1'd0;
wire main_basesoc_uart_rx_fifo_syncfifo_we;
wire main_basesoc_uart_rx_fifo_syncfifo_writable;
wire main_basesoc_uart_rx_fifo_syncfifo_re;
wire main_basesoc_uart_rx_fifo_syncfifo_readable;
wire [9:0] main_basesoc_uart_rx_fifo_syncfifo_din;
wire [9:0] main_basesoc_uart_rx_fifo_syncfifo_dout;
reg [4:0] main_basesoc_uart_rx_fifo_level0 = 5'd0;
reg main_basesoc_uart_rx_fifo_replace = 1'd0;
reg [3:0] main_basesoc_uart_rx_fifo_produce = 4'd0;
reg [3:0] main_basesoc_uart_rx_fifo_consume = 4'd0;
reg [3:0] main_basesoc_uart_rx_fifo_wrport_adr = 4'd0;
wire [9:0] main_basesoc_uart_rx_fifo_wrport_dat_r;
wire main_basesoc_uart_rx_fifo_wrport_we;
wire [9:0] main_basesoc_uart_rx_fifo_wrport_dat_w;
wire main_basesoc_uart_rx_fifo_do_read;
wire [3:0] main_basesoc_uart_rx_fifo_rdport_adr;
wire [9:0] main_basesoc_uart_rx_fifo_rdport_dat_r;
wire main_basesoc_uart_rx_fifo_rdport_re;
wire [4:0] main_basesoc_uart_rx_fifo_level1;
wire [7:0] main_basesoc_uart_rx_fifo_fifo_in_payload_data;
wire main_basesoc_uart_rx_fifo_fifo_in_first;
wire main_basesoc_uart_rx_fifo_fifo_in_last;
wire [7:0] main_basesoc_uart_rx_fifo_fifo_out_payload_data;
wire main_basesoc_uart_rx_fifo_fifo_out_first;
wire main_basesoc_uart_rx_fifo_fifo_out_last;
reg main_basesoc_uart_reset = 1'd0;
reg [31:0] main_basesoc_timer_load_storage = 32'd0;
reg main_basesoc_timer_load_re = 1'd0;
reg [31:0] main_basesoc_timer_reload_storage = 32'd0;
reg main_basesoc_timer_reload_re = 1'd0;
reg main_basesoc_timer_en_storage = 1'd0;
reg main_basesoc_timer_en_re = 1'd0;
reg main_basesoc_timer_update_value_storage = 1'd0;
reg main_basesoc_timer_update_value_re = 1'd0;
reg [31:0] main_basesoc_timer_value_status = 32'd0;
wire main_basesoc_timer_value_we;
wire main_basesoc_timer_irq;
wire main_basesoc_timer_zero_status;
reg main_basesoc_timer_zero_pending = 1'd0;
wire main_basesoc_timer_zero_trigger;
reg main_basesoc_timer_zero_clear = 1'd0;
reg main_basesoc_timer_zero_old_trigger = 1'd0;
wire main_basesoc_timer_eventmanager_status_re;
wire main_basesoc_timer_eventmanager_status_r;
wire main_basesoc_timer_eventmanager_status_we;
wire main_basesoc_timer_eventmanager_status_w;
wire main_basesoc_timer_eventmanager_pending_re;
wire main_basesoc_timer_eventmanager_pending_r;
wire main_basesoc_timer_eventmanager_pending_we;
wire main_basesoc_timer_eventmanager_pending_w;
reg main_basesoc_timer_eventmanager_storage = 1'd0;
reg main_basesoc_timer_eventmanager_re = 1'd0;
reg [31:0] main_basesoc_timer_value = 32'd0;
reg [13:0] main_basesoc_interface_adr = 14'd0;
reg main_basesoc_interface_we = 1'd0;
wire [7:0] main_basesoc_interface_dat_w;
wire [7:0] main_basesoc_interface_dat_r;
wire [29:0] main_basesoc_bus_wishbone_adr;
wire [31:0] main_basesoc_bus_wishbone_dat_w;
wire [31:0] main_basesoc_bus_wishbone_dat_r;
wire [3:0] main_basesoc_bus_wishbone_sel;
wire main_basesoc_bus_wishbone_cyc;
wire main_basesoc_bus_wishbone_stb;
reg main_basesoc_bus_wishbone_ack = 1'd0;
wire main_basesoc_bus_wishbone_we;
wire [2:0] main_basesoc_bus_wishbone_cti;
wire [1:0] main_basesoc_bus_wishbone_bte;
reg main_basesoc_bus_wishbone_err = 1'd0;
wire sys_clk;
wire sys_rst;
wire sys2x_clk;
wire sys4x_clk;
wire sys4x_dqs_clk;
wire clk200_clk;
wire clk200_rst;
wire eth_clk;
wire eth_rst;
wire main_reset;
wire main_locked;
wire main_clkin;
wire main_clkout0;
wire main_clkout_buf0;
wire main_clkout1;
wire main_clkout_buf1;
wire main_clkout2;
wire main_clkout_buf2;
wire main_clkout3;
wire main_clkout_buf3;
wire main_clkout4;
wire main_clkout_buf4;
wire main_clkout5;
wire main_clkout_buf5;
reg [3:0] main_reset_counter = 4'd15;
reg main_ic_reset = 1'd1;
reg [4:0] main_a7ddrphy_half_sys8x_taps_storage = 5'd8;
reg main_a7ddrphy_half_sys8x_taps_re = 1'd0;
reg main_a7ddrphy_wlevel_en_storage = 1'd0;
reg main_a7ddrphy_wlevel_en_re = 1'd0;
wire main_a7ddrphy_wlevel_strobe_re;
wire main_a7ddrphy_wlevel_strobe_r;
wire main_a7ddrphy_wlevel_strobe_we;
reg main_a7ddrphy_wlevel_strobe_w = 1'd0;
wire main_a7ddrphy_cdly_rst_re;
wire main_a7ddrphy_cdly_rst_r;
wire main_a7ddrphy_cdly_rst_we;
reg main_a7ddrphy_cdly_rst_w = 1'd0;
wire main_a7ddrphy_cdly_inc_re;
wire main_a7ddrphy_cdly_inc_r;
wire main_a7ddrphy_cdly_inc_we;
reg main_a7ddrphy_cdly_inc_w = 1'd0;
reg [1:0] main_a7ddrphy_dly_sel_storage = 2'd0;
reg main_a7ddrphy_dly_sel_re = 1'd0;
wire main_a7ddrphy_rdly_dq_rst_re;
wire main_a7ddrphy_rdly_dq_rst_r;
wire main_a7ddrphy_rdly_dq_rst_we;
reg main_a7ddrphy_rdly_dq_rst_w = 1'd0;
wire main_a7ddrphy_rdly_dq_inc_re;
wire main_a7ddrphy_rdly_dq_inc_r;
wire main_a7ddrphy_rdly_dq_inc_we;
reg main_a7ddrphy_rdly_dq_inc_w = 1'd0;
wire main_a7ddrphy_rdly_dq_bitslip_rst_re;
wire main_a7ddrphy_rdly_dq_bitslip_rst_r;
wire main_a7ddrphy_rdly_dq_bitslip_rst_we;
reg main_a7ddrphy_rdly_dq_bitslip_rst_w = 1'd0;
wire main_a7ddrphy_rdly_dq_bitslip_re;
wire main_a7ddrphy_rdly_dq_bitslip_r;
wire main_a7ddrphy_rdly_dq_bitslip_we;
reg main_a7ddrphy_rdly_dq_bitslip_w = 1'd0;
wire [13:0] main_a7ddrphy_dfi_p0_address;
wire [2:0] main_a7ddrphy_dfi_p0_bank;
wire main_a7ddrphy_dfi_p0_cas_n;
wire main_a7ddrphy_dfi_p0_cs_n;
wire main_a7ddrphy_dfi_p0_ras_n;
wire main_a7ddrphy_dfi_p0_we_n;
wire main_a7ddrphy_dfi_p0_cke;
wire main_a7ddrphy_dfi_p0_odt;
wire main_a7ddrphy_dfi_p0_reset_n;
wire main_a7ddrphy_dfi_p0_act_n;
wire [31:0] main_a7ddrphy_dfi_p0_wrdata;
wire main_a7ddrphy_dfi_p0_wrdata_en;
wire [3:0] main_a7ddrphy_dfi_p0_wrdata_mask;
wire main_a7ddrphy_dfi_p0_rddata_en;
reg [31:0] main_a7ddrphy_dfi_p0_rddata = 32'd0;
reg main_a7ddrphy_dfi_p0_rddata_valid = 1'd0;
wire [13:0] main_a7ddrphy_dfi_p1_address;
wire [2:0] main_a7ddrphy_dfi_p1_bank;
wire main_a7ddrphy_dfi_p1_cas_n;
wire main_a7ddrphy_dfi_p1_cs_n;
wire main_a7ddrphy_dfi_p1_ras_n;
wire main_a7ddrphy_dfi_p1_we_n;
wire main_a7ddrphy_dfi_p1_cke;
wire main_a7ddrphy_dfi_p1_odt;
wire main_a7ddrphy_dfi_p1_reset_n;
wire main_a7ddrphy_dfi_p1_act_n;
wire [31:0] main_a7ddrphy_dfi_p1_wrdata;
wire main_a7ddrphy_dfi_p1_wrdata_en;
wire [3:0] main_a7ddrphy_dfi_p1_wrdata_mask;
wire main_a7ddrphy_dfi_p1_rddata_en;
reg [31:0] main_a7ddrphy_dfi_p1_rddata = 32'd0;
reg main_a7ddrphy_dfi_p1_rddata_valid = 1'd0;
wire [13:0] main_a7ddrphy_dfi_p2_address;
wire [2:0] main_a7ddrphy_dfi_p2_bank;
wire main_a7ddrphy_dfi_p2_cas_n;
wire main_a7ddrphy_dfi_p2_cs_n;
wire main_a7ddrphy_dfi_p2_ras_n;
wire main_a7ddrphy_dfi_p2_we_n;
wire main_a7ddrphy_dfi_p2_cke;
wire main_a7ddrphy_dfi_p2_odt;
wire main_a7ddrphy_dfi_p2_reset_n;
wire main_a7ddrphy_dfi_p2_act_n;
wire [31:0] main_a7ddrphy_dfi_p2_wrdata;
wire main_a7ddrphy_dfi_p2_wrdata_en;
wire [3:0] main_a7ddrphy_dfi_p2_wrdata_mask;
wire main_a7ddrphy_dfi_p2_rddata_en;
reg [31:0] main_a7ddrphy_dfi_p2_rddata = 32'd0;
reg main_a7ddrphy_dfi_p2_rddata_valid = 1'd0;
wire [13:0] main_a7ddrphy_dfi_p3_address;
wire [2:0] main_a7ddrphy_dfi_p3_bank;
wire main_a7ddrphy_dfi_p3_cas_n;
wire main_a7ddrphy_dfi_p3_cs_n;
wire main_a7ddrphy_dfi_p3_ras_n;
wire main_a7ddrphy_dfi_p3_we_n;
wire main_a7ddrphy_dfi_p3_cke;
wire main_a7ddrphy_dfi_p3_odt;
wire main_a7ddrphy_dfi_p3_reset_n;
wire main_a7ddrphy_dfi_p3_act_n;
wire [31:0] main_a7ddrphy_dfi_p3_wrdata;
wire main_a7ddrphy_dfi_p3_wrdata_en;
wire [3:0] main_a7ddrphy_dfi_p3_wrdata_mask;
wire main_a7ddrphy_dfi_p3_rddata_en;
reg [31:0] main_a7ddrphy_dfi_p3_rddata = 32'd0;
reg main_a7ddrphy_dfi_p3_rddata_valid = 1'd0;
wire main_a7ddrphy_sd_clk_se_nodelay;
reg main_a7ddrphy_dqs_oe = 1'd0;
reg main_a7ddrphy_dqs_oe_delayed = 1'd0;
wire main_a7ddrphy_dqspattern0;
wire main_a7ddrphy_dqspattern1;
reg [7:0] main_a7ddrphy_dqspattern_o0 = 8'd0;
reg [7:0] main_a7ddrphy_dqspattern_o1 = 8'd0;
wire [1:0] main_a7ddrphy_dqs_i;
wire [1:0] main_a7ddrphy_dqs_i_delayed;
wire main_a7ddrphy_dqs_o_no_delay0;
wire main_a7ddrphy_dqs_t0;
wire main_a7ddrphy0;
wire main_a7ddrphy_dqs_o_no_delay1;
wire main_a7ddrphy_dqs_t1;
wire main_a7ddrphy1;
wire main_a7ddrphy_dq_oe;
reg main_a7ddrphy_dq_oe_delayed = 1'd0;
wire main_a7ddrphy_dq_o_nodelay0;
wire main_a7ddrphy_dq_i_nodelay0;
wire main_a7ddrphy_dq_i_delayed0;
wire main_a7ddrphy_dq_t0;
reg [7:0] main_a7ddrphy_dq_i_data0 = 8'd0;
wire [3:0] main_a7ddrphy_dq_i_data_sys2x0;
wire [7:0] main_a7ddrphy_bitslip0_i;
reg [7:0] main_a7ddrphy_bitslip0_o = 8'd0;
reg [2:0] main_a7ddrphy_bitslip0_value = 3'd0;
reg [15:0] main_a7ddrphy_bitslip0_r = 16'd0;
wire main_a7ddrphy_dq_o_nodelay1;
wire main_a7ddrphy_dq_i_nodelay1;
wire main_a7ddrphy_dq_i_delayed1;
wire main_a7ddrphy_dq_t1;
reg [7:0] main_a7ddrphy_dq_i_data1 = 8'd0;
wire [3:0] main_a7ddrphy_dq_i_data_sys2x1;
wire [7:0] main_a7ddrphy_bitslip1_i;
reg [7:0] main_a7ddrphy_bitslip1_o = 8'd0;
reg [2:0] main_a7ddrphy_bitslip1_value = 3'd0;
reg [15:0] main_a7ddrphy_bitslip1_r = 16'd0;
wire main_a7ddrphy_dq_o_nodelay2;
wire main_a7ddrphy_dq_i_nodelay2;
wire main_a7ddrphy_dq_i_delayed2;
wire main_a7ddrphy_dq_t2;
reg [7:0] main_a7ddrphy_dq_i_data2 = 8'd0;
wire [3:0] main_a7ddrphy_dq_i_data_sys2x2;
wire [7:0] main_a7ddrphy_bitslip2_i;
reg [7:0] main_a7ddrphy_bitslip2_o = 8'd0;
reg [2:0] main_a7ddrphy_bitslip2_value = 3'd0;
reg [15:0] main_a7ddrphy_bitslip2_r = 16'd0;
wire main_a7ddrphy_dq_o_nodelay3;
wire main_a7ddrphy_dq_i_nodelay3;
wire main_a7ddrphy_dq_i_delayed3;
wire main_a7ddrphy_dq_t3;
reg [7:0] main_a7ddrphy_dq_i_data3 = 8'd0;
wire [3:0] main_a7ddrphy_dq_i_data_sys2x3;
wire [7:0] main_a7ddrphy_bitslip3_i;
reg [7:0] main_a7ddrphy_bitslip3_o = 8'd0;
reg [2:0] main_a7ddrphy_bitslip3_value = 3'd0;
reg [15:0] main_a7ddrphy_bitslip3_r = 16'd0;
wire main_a7ddrphy_dq_o_nodelay4;
wire main_a7ddrphy_dq_i_nodelay4;
wire main_a7ddrphy_dq_i_delayed4;
wire main_a7ddrphy_dq_t4;
reg [7:0] main_a7ddrphy_dq_i_data4 = 8'd0;
wire [3:0] main_a7ddrphy_dq_i_data_sys2x4;
wire [7:0] main_a7ddrphy_bitslip4_i;
reg [7:0] main_a7ddrphy_bitslip4_o = 8'd0;
reg [2:0] main_a7ddrphy_bitslip4_value = 3'd0;
reg [15:0] main_a7ddrphy_bitslip4_r = 16'd0;
wire main_a7ddrphy_dq_o_nodelay5;
wire main_a7ddrphy_dq_i_nodelay5;
wire main_a7ddrphy_dq_i_delayed5;
wire main_a7ddrphy_dq_t5;
reg [7:0] main_a7ddrphy_dq_i_data5 = 8'd0;
wire [3:0] main_a7ddrphy_dq_i_data_sys2x5;
wire [7:0] main_a7ddrphy_bitslip5_i;
reg [7:0] main_a7ddrphy_bitslip5_o = 8'd0;
reg [2:0] main_a7ddrphy_bitslip5_value = 3'd0;
reg [15:0] main_a7ddrphy_bitslip5_r = 16'd0;
wire main_a7ddrphy_dq_o_nodelay6;
wire main_a7ddrphy_dq_i_nodelay6;
wire main_a7ddrphy_dq_i_delayed6;
wire main_a7ddrphy_dq_t6;
reg [7:0] main_a7ddrphy_dq_i_data6 = 8'd0;
wire [3:0] main_a7ddrphy_dq_i_data_sys2x6;
wire [7:0] main_a7ddrphy_bitslip6_i;
reg [7:0] main_a7ddrphy_bitslip6_o = 8'd0;
reg [2:0] main_a7ddrphy_bitslip6_value = 3'd0;
reg [15:0] main_a7ddrphy_bitslip6_r = 16'd0;
wire main_a7ddrphy_dq_o_nodelay7;
wire main_a7ddrphy_dq_i_nodelay7;
wire main_a7ddrphy_dq_i_delayed7;
wire main_a7ddrphy_dq_t7;
reg [7:0] main_a7ddrphy_dq_i_data7 = 8'd0;
wire [3:0] main_a7ddrphy_dq_i_data_sys2x7;
wire [7:0] main_a7ddrphy_bitslip7_i;
reg [7:0] main_a7ddrphy_bitslip7_o = 8'd0;
reg [2:0] main_a7ddrphy_bitslip7_value = 3'd0;
reg [15:0] main_a7ddrphy_bitslip7_r = 16'd0;
wire main_a7ddrphy_dq_o_nodelay8;
wire main_a7ddrphy_dq_i_nodelay8;
wire main_a7ddrphy_dq_i_delayed8;
wire main_a7ddrphy_dq_t8;
reg [7:0] main_a7ddrphy_dq_i_data8 = 8'd0;
wire [3:0] main_a7ddrphy_dq_i_data_sys2x8;
wire [7:0] main_a7ddrphy_bitslip8_i;
reg [7:0] main_a7ddrphy_bitslip8_o = 8'd0;
reg [2:0] main_a7ddrphy_bitslip8_value = 3'd0;
reg [15:0] main_a7ddrphy_bitslip8_r = 16'd0;
wire main_a7ddrphy_dq_o_nodelay9;
wire main_a7ddrphy_dq_i_nodelay9;
wire main_a7ddrphy_dq_i_delayed9;
wire main_a7ddrphy_dq_t9;
reg [7:0] main_a7ddrphy_dq_i_data9 = 8'd0;
wire [3:0] main_a7ddrphy_dq_i_data_sys2x9;
wire [7:0] main_a7ddrphy_bitslip9_i;
reg [7:0] main_a7ddrphy_bitslip9_o = 8'd0;
reg [2:0] main_a7ddrphy_bitslip9_value = 3'd0;
reg [15:0] main_a7ddrphy_bitslip9_r = 16'd0;
wire main_a7ddrphy_dq_o_nodelay10;
wire main_a7ddrphy_dq_i_nodelay10;
wire main_a7ddrphy_dq_i_delayed10;
wire main_a7ddrphy_dq_t10;
reg [7:0] main_a7ddrphy_dq_i_data10 = 8'd0;
wire [3:0] main_a7ddrphy_dq_i_data_sys2x10;
wire [7:0] main_a7ddrphy_bitslip10_i;
reg [7:0] main_a7ddrphy_bitslip10_o = 8'd0;
reg [2:0] main_a7ddrphy_bitslip10_value = 3'd0;
reg [15:0] main_a7ddrphy_bitslip10_r = 16'd0;
wire main_a7ddrphy_dq_o_nodelay11;
wire main_a7ddrphy_dq_i_nodelay11;
wire main_a7ddrphy_dq_i_delayed11;
wire main_a7ddrphy_dq_t11;
reg [7:0] main_a7ddrphy_dq_i_data11 = 8'd0;
wire [3:0] main_a7ddrphy_dq_i_data_sys2x11;
wire [7:0] main_a7ddrphy_bitslip11_i;
reg [7:0] main_a7ddrphy_bitslip11_o = 8'd0;
reg [2:0] main_a7ddrphy_bitslip11_value = 3'd0;
reg [15:0] main_a7ddrphy_bitslip11_r = 16'd0;
wire main_a7ddrphy_dq_o_nodelay12;
wire main_a7ddrphy_dq_i_nodelay12;
wire main_a7ddrphy_dq_i_delayed12;
wire main_a7ddrphy_dq_t12;
reg [7:0] main_a7ddrphy_dq_i_data12 = 8'd0;
wire [3:0] main_a7ddrphy_dq_i_data_sys2x12;
wire [7:0] main_a7ddrphy_bitslip12_i;
reg [7:0] main_a7ddrphy_bitslip12_o = 8'd0;
reg [2:0] main_a7ddrphy_bitslip12_value = 3'd0;
reg [15:0] main_a7ddrphy_bitslip12_r = 16'd0;
wire main_a7ddrphy_dq_o_nodelay13;
wire main_a7ddrphy_dq_i_nodelay13;
wire main_a7ddrphy_dq_i_delayed13;
wire main_a7ddrphy_dq_t13;
reg [7:0] main_a7ddrphy_dq_i_data13 = 8'd0;
wire [3:0] main_a7ddrphy_dq_i_data_sys2x13;
wire [7:0] main_a7ddrphy_bitslip13_i;
reg [7:0] main_a7ddrphy_bitslip13_o = 8'd0;
reg [2:0] main_a7ddrphy_bitslip13_value = 3'd0;
reg [15:0] main_a7ddrphy_bitslip13_r = 16'd0;
wire main_a7ddrphy_dq_o_nodelay14;
wire main_a7ddrphy_dq_i_nodelay14;
wire main_a7ddrphy_dq_i_delayed14;
wire main_a7ddrphy_dq_t14;
reg [7:0] main_a7ddrphy_dq_i_data14 = 8'd0;
wire [3:0] main_a7ddrphy_dq_i_data_sys2x14;
wire [7:0] main_a7ddrphy_bitslip14_i;
reg [7:0] main_a7ddrphy_bitslip14_o = 8'd0;
reg [2:0] main_a7ddrphy_bitslip14_value = 3'd0;
reg [15:0] main_a7ddrphy_bitslip14_r = 16'd0;
wire main_a7ddrphy_dq_o_nodelay15;
wire main_a7ddrphy_dq_i_nodelay15;
wire main_a7ddrphy_dq_i_delayed15;
wire main_a7ddrphy_dq_t15;
reg [7:0] main_a7ddrphy_dq_i_data15 = 8'd0;
wire [3:0] main_a7ddrphy_dq_i_data_sys2x15;
wire [7:0] main_a7ddrphy_bitslip15_i;
reg [7:0] main_a7ddrphy_bitslip15_o = 8'd0;
reg [2:0] main_a7ddrphy_bitslip15_value = 3'd0;
reg [15:0] main_a7ddrphy_bitslip15_r = 16'd0;
wire [6:0] main_a7ddrphy_rddata_en;
reg [6:0] main_a7ddrphy_rddata_en_last = 7'd0;
wire [3:0] main_a7ddrphy_wrdata_en;
reg [3:0] main_a7ddrphy_wrdata_en_last = 4'd0;
wire [13:0] main_sdram_inti_p0_address;
wire [2:0] main_sdram_inti_p0_bank;
reg main_sdram_inti_p0_cas_n = 1'd1;
reg main_sdram_inti_p0_cs_n = 1'd1;
reg main_sdram_inti_p0_ras_n = 1'd1;
reg main_sdram_inti_p0_we_n = 1'd1;
wire main_sdram_inti_p0_cke;
wire main_sdram_inti_p0_odt;
wire main_sdram_inti_p0_reset_n;
reg main_sdram_inti_p0_act_n = 1'd1;
wire [31:0] main_sdram_inti_p0_wrdata;
wire main_sdram_inti_p0_wrdata_en;
wire [3:0] main_sdram_inti_p0_wrdata_mask;
wire main_sdram_inti_p0_rddata_en;
reg [31:0] main_sdram_inti_p0_rddata = 32'd0;
reg main_sdram_inti_p0_rddata_valid = 1'd0;
wire [13:0] main_sdram_inti_p1_address;
wire [2:0] main_sdram_inti_p1_bank;
reg main_sdram_inti_p1_cas_n = 1'd1;
reg main_sdram_inti_p1_cs_n = 1'd1;
reg main_sdram_inti_p1_ras_n = 1'd1;
reg main_sdram_inti_p1_we_n = 1'd1;
wire main_sdram_inti_p1_cke;
wire main_sdram_inti_p1_odt;
wire main_sdram_inti_p1_reset_n;
reg main_sdram_inti_p1_act_n = 1'd1;
wire [31:0] main_sdram_inti_p1_wrdata;
wire main_sdram_inti_p1_wrdata_en;
wire [3:0] main_sdram_inti_p1_wrdata_mask;
wire main_sdram_inti_p1_rddata_en;
reg [31:0] main_sdram_inti_p1_rddata = 32'd0;
reg main_sdram_inti_p1_rddata_valid = 1'd0;
wire [13:0] main_sdram_inti_p2_address;
wire [2:0] main_sdram_inti_p2_bank;
reg main_sdram_inti_p2_cas_n = 1'd1;
reg main_sdram_inti_p2_cs_n = 1'd1;
reg main_sdram_inti_p2_ras_n = 1'd1;
reg main_sdram_inti_p2_we_n = 1'd1;
wire main_sdram_inti_p2_cke;
wire main_sdram_inti_p2_odt;
wire main_sdram_inti_p2_reset_n;
reg main_sdram_inti_p2_act_n = 1'd1;
wire [31:0] main_sdram_inti_p2_wrdata;
wire main_sdram_inti_p2_wrdata_en;
wire [3:0] main_sdram_inti_p2_wrdata_mask;
wire main_sdram_inti_p2_rddata_en;
reg [31:0] main_sdram_inti_p2_rddata = 32'd0;
reg main_sdram_inti_p2_rddata_valid = 1'd0;
wire [13:0] main_sdram_inti_p3_address;
wire [2:0] main_sdram_inti_p3_bank;
reg main_sdram_inti_p3_cas_n = 1'd1;
reg main_sdram_inti_p3_cs_n = 1'd1;
reg main_sdram_inti_p3_ras_n = 1'd1;
reg main_sdram_inti_p3_we_n = 1'd1;
wire main_sdram_inti_p3_cke;
wire main_sdram_inti_p3_odt;
wire main_sdram_inti_p3_reset_n;
reg main_sdram_inti_p3_act_n = 1'd1;
wire [31:0] main_sdram_inti_p3_wrdata;
wire main_sdram_inti_p3_wrdata_en;
wire [3:0] main_sdram_inti_p3_wrdata_mask;
wire main_sdram_inti_p3_rddata_en;
reg [31:0] main_sdram_inti_p3_rddata = 32'd0;
reg main_sdram_inti_p3_rddata_valid = 1'd0;
wire [13:0] main_sdram_slave_p0_address;
wire [2:0] main_sdram_slave_p0_bank;
wire main_sdram_slave_p0_cas_n;
wire main_sdram_slave_p0_cs_n;
wire main_sdram_slave_p0_ras_n;
wire main_sdram_slave_p0_we_n;
wire main_sdram_slave_p0_cke;
wire main_sdram_slave_p0_odt;
wire main_sdram_slave_p0_reset_n;
wire main_sdram_slave_p0_act_n;
wire [31:0] main_sdram_slave_p0_wrdata;
wire main_sdram_slave_p0_wrdata_en;
wire [3:0] main_sdram_slave_p0_wrdata_mask;
wire main_sdram_slave_p0_rddata_en;
reg [31:0] main_sdram_slave_p0_rddata = 32'd0;
reg main_sdram_slave_p0_rddata_valid = 1'd0;
wire [13:0] main_sdram_slave_p1_address;
wire [2:0] main_sdram_slave_p1_bank;
wire main_sdram_slave_p1_cas_n;
wire main_sdram_slave_p1_cs_n;
wire main_sdram_slave_p1_ras_n;
wire main_sdram_slave_p1_we_n;
wire main_sdram_slave_p1_cke;
wire main_sdram_slave_p1_odt;
wire main_sdram_slave_p1_reset_n;
wire main_sdram_slave_p1_act_n;
wire [31:0] main_sdram_slave_p1_wrdata;
wire main_sdram_slave_p1_wrdata_en;
wire [3:0] main_sdram_slave_p1_wrdata_mask;
wire main_sdram_slave_p1_rddata_en;
reg [31:0] main_sdram_slave_p1_rddata = 32'd0;
reg main_sdram_slave_p1_rddata_valid = 1'd0;
wire [13:0] main_sdram_slave_p2_address;
wire [2:0] main_sdram_slave_p2_bank;
wire main_sdram_slave_p2_cas_n;
wire main_sdram_slave_p2_cs_n;
wire main_sdram_slave_p2_ras_n;
wire main_sdram_slave_p2_we_n;
wire main_sdram_slave_p2_cke;
wire main_sdram_slave_p2_odt;
wire main_sdram_slave_p2_reset_n;
wire main_sdram_slave_p2_act_n;
wire [31:0] main_sdram_slave_p2_wrdata;
wire main_sdram_slave_p2_wrdata_en;
wire [3:0] main_sdram_slave_p2_wrdata_mask;
wire main_sdram_slave_p2_rddata_en;
reg [31:0] main_sdram_slave_p2_rddata = 32'd0;
reg main_sdram_slave_p2_rddata_valid = 1'd0;
wire [13:0] main_sdram_slave_p3_address;
wire [2:0] main_sdram_slave_p3_bank;
wire main_sdram_slave_p3_cas_n;
wire main_sdram_slave_p3_cs_n;
wire main_sdram_slave_p3_ras_n;
wire main_sdram_slave_p3_we_n;
wire main_sdram_slave_p3_cke;
wire main_sdram_slave_p3_odt;
wire main_sdram_slave_p3_reset_n;
wire main_sdram_slave_p3_act_n;
wire [31:0] main_sdram_slave_p3_wrdata;
wire main_sdram_slave_p3_wrdata_en;
wire [3:0] main_sdram_slave_p3_wrdata_mask;
wire main_sdram_slave_p3_rddata_en;
reg [31:0] main_sdram_slave_p3_rddata = 32'd0;
reg main_sdram_slave_p3_rddata_valid = 1'd0;
reg [13:0] main_sdram_master_p0_address = 14'd0;
reg [2:0] main_sdram_master_p0_bank = 3'd0;
reg main_sdram_master_p0_cas_n = 1'd1;
reg main_sdram_master_p0_cs_n = 1'd1;
reg main_sdram_master_p0_ras_n = 1'd1;
reg main_sdram_master_p0_we_n = 1'd1;
reg main_sdram_master_p0_cke = 1'd0;
reg main_sdram_master_p0_odt = 1'd0;
reg main_sdram_master_p0_reset_n = 1'd0;
reg main_sdram_master_p0_act_n = 1'd1;
reg [31:0] main_sdram_master_p0_wrdata = 32'd0;
reg main_sdram_master_p0_wrdata_en = 1'd0;
reg [3:0] main_sdram_master_p0_wrdata_mask = 4'd0;
reg main_sdram_master_p0_rddata_en = 1'd0;
wire [31:0] main_sdram_master_p0_rddata;
wire main_sdram_master_p0_rddata_valid;
reg [13:0] main_sdram_master_p1_address = 14'd0;
reg [2:0] main_sdram_master_p1_bank = 3'd0;
reg main_sdram_master_p1_cas_n = 1'd1;
reg main_sdram_master_p1_cs_n = 1'd1;
reg main_sdram_master_p1_ras_n = 1'd1;
reg main_sdram_master_p1_we_n = 1'd1;
reg main_sdram_master_p1_cke = 1'd0;
reg main_sdram_master_p1_odt = 1'd0;
reg main_sdram_master_p1_reset_n = 1'd0;
reg main_sdram_master_p1_act_n = 1'd1;
reg [31:0] main_sdram_master_p1_wrdata = 32'd0;
reg main_sdram_master_p1_wrdata_en = 1'd0;
reg [3:0] main_sdram_master_p1_wrdata_mask = 4'd0;
reg main_sdram_master_p1_rddata_en = 1'd0;
wire [31:0] main_sdram_master_p1_rddata;
wire main_sdram_master_p1_rddata_valid;
reg [13:0] main_sdram_master_p2_address = 14'd0;
reg [2:0] main_sdram_master_p2_bank = 3'd0;
reg main_sdram_master_p2_cas_n = 1'd1;
reg main_sdram_master_p2_cs_n = 1'd1;
reg main_sdram_master_p2_ras_n = 1'd1;
reg main_sdram_master_p2_we_n = 1'd1;
reg main_sdram_master_p2_cke = 1'd0;
reg main_sdram_master_p2_odt = 1'd0;
reg main_sdram_master_p2_reset_n = 1'd0;
reg main_sdram_master_p2_act_n = 1'd1;
reg [31:0] main_sdram_master_p2_wrdata = 32'd0;
reg main_sdram_master_p2_wrdata_en = 1'd0;
reg [3:0] main_sdram_master_p2_wrdata_mask = 4'd0;
reg main_sdram_master_p2_rddata_en = 1'd0;
wire [31:0] main_sdram_master_p2_rddata;
wire main_sdram_master_p2_rddata_valid;
reg [13:0] main_sdram_master_p3_address = 14'd0;
reg [2:0] main_sdram_master_p3_bank = 3'd0;
reg main_sdram_master_p3_cas_n = 1'd1;
reg main_sdram_master_p3_cs_n = 1'd1;
reg main_sdram_master_p3_ras_n = 1'd1;
reg main_sdram_master_p3_we_n = 1'd1;
reg main_sdram_master_p3_cke = 1'd0;
reg main_sdram_master_p3_odt = 1'd0;
reg main_sdram_master_p3_reset_n = 1'd0;
reg main_sdram_master_p3_act_n = 1'd1;
reg [31:0] main_sdram_master_p3_wrdata = 32'd0;
reg main_sdram_master_p3_wrdata_en = 1'd0;
reg [3:0] main_sdram_master_p3_wrdata_mask = 4'd0;
reg main_sdram_master_p3_rddata_en = 1'd0;
wire [31:0] main_sdram_master_p3_rddata;
wire main_sdram_master_p3_rddata_valid;
reg [3:0] main_sdram_storage = 4'd0;
reg main_sdram_re = 1'd0;
reg [5:0] main_sdram_phaseinjector0_command_storage = 6'd0;
reg main_sdram_phaseinjector0_command_re = 1'd0;
wire main_sdram_phaseinjector0_command_issue_re;
wire main_sdram_phaseinjector0_command_issue_r;
wire main_sdram_phaseinjector0_command_issue_we;
reg main_sdram_phaseinjector0_command_issue_w = 1'd0;
reg [13:0] main_sdram_phaseinjector0_address_storage = 14'd0;
reg main_sdram_phaseinjector0_address_re = 1'd0;
reg [2:0] main_sdram_phaseinjector0_baddress_storage = 3'd0;
reg main_sdram_phaseinjector0_baddress_re = 1'd0;
reg [31:0] main_sdram_phaseinjector0_wrdata_storage = 32'd0;
reg main_sdram_phaseinjector0_wrdata_re = 1'd0;
reg [31:0] main_sdram_phaseinjector0_status = 32'd0;
wire main_sdram_phaseinjector0_we;
reg [5:0] main_sdram_phaseinjector1_command_storage = 6'd0;
reg main_sdram_phaseinjector1_command_re = 1'd0;
wire main_sdram_phaseinjector1_command_issue_re;
wire main_sdram_phaseinjector1_command_issue_r;
wire main_sdram_phaseinjector1_command_issue_we;
reg main_sdram_phaseinjector1_command_issue_w = 1'd0;
reg [13:0] main_sdram_phaseinjector1_address_storage = 14'd0;
reg main_sdram_phaseinjector1_address_re = 1'd0;
reg [2:0] main_sdram_phaseinjector1_baddress_storage = 3'd0;
reg main_sdram_phaseinjector1_baddress_re = 1'd0;
reg [31:0] main_sdram_phaseinjector1_wrdata_storage = 32'd0;
reg main_sdram_phaseinjector1_wrdata_re = 1'd0;
reg [31:0] main_sdram_phaseinjector1_status = 32'd0;
wire main_sdram_phaseinjector1_we;
reg [5:0] main_sdram_phaseinjector2_command_storage = 6'd0;
reg main_sdram_phaseinjector2_command_re = 1'd0;
wire main_sdram_phaseinjector2_command_issue_re;
wire main_sdram_phaseinjector2_command_issue_r;
wire main_sdram_phaseinjector2_command_issue_we;
reg main_sdram_phaseinjector2_command_issue_w = 1'd0;
reg [13:0] main_sdram_phaseinjector2_address_storage = 14'd0;
reg main_sdram_phaseinjector2_address_re = 1'd0;
reg [2:0] main_sdram_phaseinjector2_baddress_storage = 3'd0;
reg main_sdram_phaseinjector2_baddress_re = 1'd0;
reg [31:0] main_sdram_phaseinjector2_wrdata_storage = 32'd0;
reg main_sdram_phaseinjector2_wrdata_re = 1'd0;
reg [31:0] main_sdram_phaseinjector2_status = 32'd0;
wire main_sdram_phaseinjector2_we;
reg [5:0] main_sdram_phaseinjector3_command_storage = 6'd0;
reg main_sdram_phaseinjector3_command_re = 1'd0;
wire main_sdram_phaseinjector3_command_issue_re;
wire main_sdram_phaseinjector3_command_issue_r;
wire main_sdram_phaseinjector3_command_issue_we;
reg main_sdram_phaseinjector3_command_issue_w = 1'd0;
reg [13:0] main_sdram_phaseinjector3_address_storage = 14'd0;
reg main_sdram_phaseinjector3_address_re = 1'd0;
reg [2:0] main_sdram_phaseinjector3_baddress_storage = 3'd0;
reg main_sdram_phaseinjector3_baddress_re = 1'd0;
reg [31:0] main_sdram_phaseinjector3_wrdata_storage = 32'd0;
reg main_sdram_phaseinjector3_wrdata_re = 1'd0;
reg [31:0] main_sdram_phaseinjector3_status = 32'd0;
wire main_sdram_phaseinjector3_we;
wire main_sdram_interface_bank0_valid;
wire main_sdram_interface_bank0_ready;
wire main_sdram_interface_bank0_we;
wire [20:0] main_sdram_interface_bank0_addr;
wire main_sdram_interface_bank0_lock;
wire main_sdram_interface_bank0_wdata_ready;
wire main_sdram_interface_bank0_rdata_valid;
wire main_sdram_interface_bank1_valid;
wire main_sdram_interface_bank1_ready;
wire main_sdram_interface_bank1_we;
wire [20:0] main_sdram_interface_bank1_addr;
wire main_sdram_interface_bank1_lock;
wire main_sdram_interface_bank1_wdata_ready;
wire main_sdram_interface_bank1_rdata_valid;
wire main_sdram_interface_bank2_valid;
wire main_sdram_interface_bank2_ready;
wire main_sdram_interface_bank2_we;
wire [20:0] main_sdram_interface_bank2_addr;
wire main_sdram_interface_bank2_lock;
wire main_sdram_interface_bank2_wdata_ready;
wire main_sdram_interface_bank2_rdata_valid;
wire main_sdram_interface_bank3_valid;
wire main_sdram_interface_bank3_ready;
wire main_sdram_interface_bank3_we;
wire [20:0] main_sdram_interface_bank3_addr;
wire main_sdram_interface_bank3_lock;
wire main_sdram_interface_bank3_wdata_ready;
wire main_sdram_interface_bank3_rdata_valid;
wire main_sdram_interface_bank4_valid;
wire main_sdram_interface_bank4_ready;
wire main_sdram_interface_bank4_we;
wire [20:0] main_sdram_interface_bank4_addr;
wire main_sdram_interface_bank4_lock;
wire main_sdram_interface_bank4_wdata_ready;
wire main_sdram_interface_bank4_rdata_valid;
wire main_sdram_interface_bank5_valid;
wire main_sdram_interface_bank5_ready;
wire main_sdram_interface_bank5_we;
wire [20:0] main_sdram_interface_bank5_addr;
wire main_sdram_interface_bank5_lock;
wire main_sdram_interface_bank5_wdata_ready;
wire main_sdram_interface_bank5_rdata_valid;
wire main_sdram_interface_bank6_valid;
wire main_sdram_interface_bank6_ready;
wire main_sdram_interface_bank6_we;
wire [20:0] main_sdram_interface_bank6_addr;
wire main_sdram_interface_bank6_lock;
wire main_sdram_interface_bank6_wdata_ready;
wire main_sdram_interface_bank6_rdata_valid;
wire main_sdram_interface_bank7_valid;
wire main_sdram_interface_bank7_ready;
wire main_sdram_interface_bank7_we;
wire [20:0] main_sdram_interface_bank7_addr;
wire main_sdram_interface_bank7_lock;
wire main_sdram_interface_bank7_wdata_ready;
wire main_sdram_interface_bank7_rdata_valid;
reg [127:0] main_sdram_interface_wdata = 128'd0;
reg [15:0] main_sdram_interface_wdata_we = 16'd0;
wire [127:0] main_sdram_interface_rdata;
reg [13:0] main_sdram_dfi_p0_address = 14'd0;
reg [2:0] main_sdram_dfi_p0_bank = 3'd0;
reg main_sdram_dfi_p0_cas_n = 1'd1;
reg main_sdram_dfi_p0_cs_n = 1'd1;
reg main_sdram_dfi_p0_ras_n = 1'd1;
reg main_sdram_dfi_p0_we_n = 1'd1;
wire main_sdram_dfi_p0_cke;
wire main_sdram_dfi_p0_odt;
wire main_sdram_dfi_p0_reset_n;
reg main_sdram_dfi_p0_act_n = 1'd1;
wire [31:0] main_sdram_dfi_p0_wrdata;
reg main_sdram_dfi_p0_wrdata_en = 1'd0;
wire [3:0] main_sdram_dfi_p0_wrdata_mask;
reg main_sdram_dfi_p0_rddata_en = 1'd0;
wire [31:0] main_sdram_dfi_p0_rddata;
wire main_sdram_dfi_p0_rddata_valid;
reg [13:0] main_sdram_dfi_p1_address = 14'd0;
reg [2:0] main_sdram_dfi_p1_bank = 3'd0;
reg main_sdram_dfi_p1_cas_n = 1'd1;
reg main_sdram_dfi_p1_cs_n = 1'd1;
reg main_sdram_dfi_p1_ras_n = 1'd1;
reg main_sdram_dfi_p1_we_n = 1'd1;
wire main_sdram_dfi_p1_cke;
wire main_sdram_dfi_p1_odt;
wire main_sdram_dfi_p1_reset_n;
reg main_sdram_dfi_p1_act_n = 1'd1;
wire [31:0] main_sdram_dfi_p1_wrdata;
reg main_sdram_dfi_p1_wrdata_en = 1'd0;
wire [3:0] main_sdram_dfi_p1_wrdata_mask;
reg main_sdram_dfi_p1_rddata_en = 1'd0;
wire [31:0] main_sdram_dfi_p1_rddata;
wire main_sdram_dfi_p1_rddata_valid;
reg [13:0] main_sdram_dfi_p2_address = 14'd0;
reg [2:0] main_sdram_dfi_p2_bank = 3'd0;
reg main_sdram_dfi_p2_cas_n = 1'd1;
reg main_sdram_dfi_p2_cs_n = 1'd1;
reg main_sdram_dfi_p2_ras_n = 1'd1;
reg main_sdram_dfi_p2_we_n = 1'd1;
wire main_sdram_dfi_p2_cke;
wire main_sdram_dfi_p2_odt;
wire main_sdram_dfi_p2_reset_n;
reg main_sdram_dfi_p2_act_n = 1'd1;
wire [31:0] main_sdram_dfi_p2_wrdata;
reg main_sdram_dfi_p2_wrdata_en = 1'd0;
wire [3:0] main_sdram_dfi_p2_wrdata_mask;
reg main_sdram_dfi_p2_rddata_en = 1'd0;
wire [31:0] main_sdram_dfi_p2_rddata;
wire main_sdram_dfi_p2_rddata_valid;
reg [13:0] main_sdram_dfi_p3_address = 14'd0;
reg [2:0] main_sdram_dfi_p3_bank = 3'd0;
reg main_sdram_dfi_p3_cas_n = 1'd1;
reg main_sdram_dfi_p3_cs_n = 1'd1;
reg main_sdram_dfi_p3_ras_n = 1'd1;
reg main_sdram_dfi_p3_we_n = 1'd1;
wire main_sdram_dfi_p3_cke;
wire main_sdram_dfi_p3_odt;
wire main_sdram_dfi_p3_reset_n;
reg main_sdram_dfi_p3_act_n = 1'd1;
wire [31:0] main_sdram_dfi_p3_wrdata;
reg main_sdram_dfi_p3_wrdata_en = 1'd0;
wire [3:0] main_sdram_dfi_p3_wrdata_mask;
reg main_sdram_dfi_p3_rddata_en = 1'd0;
wire [31:0] main_sdram_dfi_p3_rddata;
wire main_sdram_dfi_p3_rddata_valid;
reg main_sdram_cmd_valid = 1'd0;
reg main_sdram_cmd_ready = 1'd0;
reg main_sdram_cmd_last = 1'd0;
reg [13:0] main_sdram_cmd_payload_a = 14'd0;
reg [2:0] main_sdram_cmd_payload_ba = 3'd0;
reg main_sdram_cmd_payload_cas = 1'd0;
reg main_sdram_cmd_payload_ras = 1'd0;
reg main_sdram_cmd_payload_we = 1'd0;
reg main_sdram_cmd_payload_is_read = 1'd0;
reg main_sdram_cmd_payload_is_write = 1'd0;
wire main_sdram_wants_refresh;
wire main_sdram_wants_zqcs;
wire main_sdram_timer_wait;
wire main_sdram_timer_done0;
wire [9:0] main_sdram_timer_count0;
wire main_sdram_timer_done1;
reg [9:0] main_sdram_timer_count1 = 10'd781;
wire main_sdram_postponer_req_i;
reg main_sdram_postponer_req_o = 1'd0;
reg main_sdram_postponer_count = 1'd0;
reg main_sdram_sequencer_start0 = 1'd0;
wire main_sdram_sequencer_done0;
wire main_sdram_sequencer_start1;
reg main_sdram_sequencer_done1 = 1'd0;
reg [5:0] main_sdram_sequencer_counter = 6'd0;
reg main_sdram_sequencer_count = 1'd0;
wire main_sdram_zqcs_timer_wait;
wire main_sdram_zqcs_timer_done0;
wire [26:0] main_sdram_zqcs_timer_count0;
wire main_sdram_zqcs_timer_done1;
reg [26:0] main_sdram_zqcs_timer_count1 = 27'd99999999;
reg main_sdram_zqcs_executer_start = 1'd0;
reg main_sdram_zqcs_executer_done = 1'd0;
reg [4:0] main_sdram_zqcs_executer_counter = 5'd0;
wire main_sdram_bankmachine0_req_valid;
wire main_sdram_bankmachine0_req_ready;
wire main_sdram_bankmachine0_req_we;
wire [20:0] main_sdram_bankmachine0_req_addr;
wire main_sdram_bankmachine0_req_lock;
reg main_sdram_bankmachine0_req_wdata_ready = 1'd0;
reg main_sdram_bankmachine0_req_rdata_valid = 1'd0;
wire main_sdram_bankmachine0_refresh_req;
reg main_sdram_bankmachine0_refresh_gnt = 1'd0;
reg main_sdram_bankmachine0_cmd_valid = 1'd0;
reg main_sdram_bankmachine0_cmd_ready = 1'd0;
reg [13:0] main_sdram_bankmachine0_cmd_payload_a = 14'd0;
wire [2:0] main_sdram_bankmachine0_cmd_payload_ba;
reg main_sdram_bankmachine0_cmd_payload_cas = 1'd0;
reg main_sdram_bankmachine0_cmd_payload_ras = 1'd0;
reg main_sdram_bankmachine0_cmd_payload_we = 1'd0;
reg main_sdram_bankmachine0_cmd_payload_is_cmd = 1'd0;
reg main_sdram_bankmachine0_cmd_payload_is_read = 1'd0;
reg main_sdram_bankmachine0_cmd_payload_is_write = 1'd0;
reg main_sdram_bankmachine0_auto_precharge = 1'd0;
wire main_sdram_bankmachine0_cmd_buffer_lookahead_sink_valid;
wire main_sdram_bankmachine0_cmd_buffer_lookahead_sink_ready;
reg main_sdram_bankmachine0_cmd_buffer_lookahead_sink_first = 1'd0;
reg main_sdram_bankmachine0_cmd_buffer_lookahead_sink_last = 1'd0;
wire main_sdram_bankmachine0_cmd_buffer_lookahead_sink_payload_we;
wire [20:0] main_sdram_bankmachine0_cmd_buffer_lookahead_sink_payload_addr;
wire main_sdram_bankmachine0_cmd_buffer_lookahead_source_valid;
wire main_sdram_bankmachine0_cmd_buffer_lookahead_source_ready;
wire main_sdram_bankmachine0_cmd_buffer_lookahead_source_first;
wire main_sdram_bankmachine0_cmd_buffer_lookahead_source_last;
wire main_sdram_bankmachine0_cmd_buffer_lookahead_source_payload_we;
wire [20:0] main_sdram_bankmachine0_cmd_buffer_lookahead_source_payload_addr;
wire main_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_we;
wire main_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_writable;
wire main_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_re;
wire main_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_readable;
wire [23:0] main_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_din;
wire [23:0] main_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_dout;
reg [3:0] main_sdram_bankmachine0_cmd_buffer_lookahead_level = 4'd0;
reg main_sdram_bankmachine0_cmd_buffer_lookahead_replace = 1'd0;
reg [2:0] main_sdram_bankmachine0_cmd_buffer_lookahead_produce = 3'd0;
reg [2:0] main_sdram_bankmachine0_cmd_buffer_lookahead_consume = 3'd0;
reg [2:0] main_sdram_bankmachine0_cmd_buffer_lookahead_wrport_adr = 3'd0;
wire [23:0] main_sdram_bankmachine0_cmd_buffer_lookahead_wrport_dat_r;
wire main_sdram_bankmachine0_cmd_buffer_lookahead_wrport_we;
wire [23:0] main_sdram_bankmachine0_cmd_buffer_lookahead_wrport_dat_w;
wire main_sdram_bankmachine0_cmd_buffer_lookahead_do_read;
wire [2:0] main_sdram_bankmachine0_cmd_buffer_lookahead_rdport_adr;
wire [23:0] main_sdram_bankmachine0_cmd_buffer_lookahead_rdport_dat_r;
wire main_sdram_bankmachine0_cmd_buffer_lookahead_fifo_in_payload_we;
wire [20:0] main_sdram_bankmachine0_cmd_buffer_lookahead_fifo_in_payload_addr;
wire main_sdram_bankmachine0_cmd_buffer_lookahead_fifo_in_first;
wire main_sdram_bankmachine0_cmd_buffer_lookahead_fifo_in_last;
wire main_sdram_bankmachine0_cmd_buffer_lookahead_fifo_out_payload_we;
wire [20:0] main_sdram_bankmachine0_cmd_buffer_lookahead_fifo_out_payload_addr;
wire main_sdram_bankmachine0_cmd_buffer_lookahead_fifo_out_first;
wire main_sdram_bankmachine0_cmd_buffer_lookahead_fifo_out_last;
wire main_sdram_bankmachine0_cmd_buffer_sink_valid;
wire main_sdram_bankmachine0_cmd_buffer_sink_ready;
wire main_sdram_bankmachine0_cmd_buffer_sink_first;
wire main_sdram_bankmachine0_cmd_buffer_sink_last;
wire main_sdram_bankmachine0_cmd_buffer_sink_payload_we;
wire [20:0] main_sdram_bankmachine0_cmd_buffer_sink_payload_addr;
reg main_sdram_bankmachine0_cmd_buffer_source_valid = 1'd0;
wire main_sdram_bankmachine0_cmd_buffer_source_ready;
reg main_sdram_bankmachine0_cmd_buffer_source_first = 1'd0;
reg main_sdram_bankmachine0_cmd_buffer_source_last = 1'd0;
reg main_sdram_bankmachine0_cmd_buffer_source_payload_we = 1'd0;
reg [20:0] main_sdram_bankmachine0_cmd_buffer_source_payload_addr = 21'd0;
reg [13:0] main_sdram_bankmachine0_row = 14'd0;
reg main_sdram_bankmachine0_row_opened = 1'd0;
wire main_sdram_bankmachine0_row_hit;
reg main_sdram_bankmachine0_row_open = 1'd0;
reg main_sdram_bankmachine0_row_close = 1'd0;
reg main_sdram_bankmachine0_row_col_n_addr_sel = 1'd0;
wire main_sdram_bankmachine0_twtpcon_valid;
(* dont_touch = "true" *) reg main_sdram_bankmachine0_twtpcon_ready = 1'd1;
reg [2:0] main_sdram_bankmachine0_twtpcon_count = 3'd0;
wire main_sdram_bankmachine0_trccon_valid;
(* dont_touch = "true" *) reg main_sdram_bankmachine0_trccon_ready = 1'd1;
reg [2:0] main_sdram_bankmachine0_trccon_count = 3'd0;
wire main_sdram_bankmachine0_trascon_valid;
(* dont_touch = "true" *) reg main_sdram_bankmachine0_trascon_ready = 1'd1;
reg [2:0] main_sdram_bankmachine0_trascon_count = 3'd0;
wire main_sdram_bankmachine1_req_valid;
wire main_sdram_bankmachine1_req_ready;
wire main_sdram_bankmachine1_req_we;
wire [20:0] main_sdram_bankmachine1_req_addr;
wire main_sdram_bankmachine1_req_lock;
reg main_sdram_bankmachine1_req_wdata_ready = 1'd0;
reg main_sdram_bankmachine1_req_rdata_valid = 1'd0;
wire main_sdram_bankmachine1_refresh_req;
reg main_sdram_bankmachine1_refresh_gnt = 1'd0;
reg main_sdram_bankmachine1_cmd_valid = 1'd0;
reg main_sdram_bankmachine1_cmd_ready = 1'd0;
reg [13:0] main_sdram_bankmachine1_cmd_payload_a = 14'd0;
wire [2:0] main_sdram_bankmachine1_cmd_payload_ba;
reg main_sdram_bankmachine1_cmd_payload_cas = 1'd0;
reg main_sdram_bankmachine1_cmd_payload_ras = 1'd0;
reg main_sdram_bankmachine1_cmd_payload_we = 1'd0;
reg main_sdram_bankmachine1_cmd_payload_is_cmd = 1'd0;
reg main_sdram_bankmachine1_cmd_payload_is_read = 1'd0;
reg main_sdram_bankmachine1_cmd_payload_is_write = 1'd0;
reg main_sdram_bankmachine1_auto_precharge = 1'd0;
wire main_sdram_bankmachine1_cmd_buffer_lookahead_sink_valid;
wire main_sdram_bankmachine1_cmd_buffer_lookahead_sink_ready;
reg main_sdram_bankmachine1_cmd_buffer_lookahead_sink_first = 1'd0;
reg main_sdram_bankmachine1_cmd_buffer_lookahead_sink_last = 1'd0;
wire main_sdram_bankmachine1_cmd_buffer_lookahead_sink_payload_we;
wire [20:0] main_sdram_bankmachine1_cmd_buffer_lookahead_sink_payload_addr;
wire main_sdram_bankmachine1_cmd_buffer_lookahead_source_valid;
wire main_sdram_bankmachine1_cmd_buffer_lookahead_source_ready;
wire main_sdram_bankmachine1_cmd_buffer_lookahead_source_first;
wire main_sdram_bankmachine1_cmd_buffer_lookahead_source_last;
wire main_sdram_bankmachine1_cmd_buffer_lookahead_source_payload_we;
wire [20:0] main_sdram_bankmachine1_cmd_buffer_lookahead_source_payload_addr;
wire main_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_we;
wire main_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_writable;
wire main_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_re;
wire main_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_readable;
wire [23:0] main_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_din;
wire [23:0] main_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_dout;
reg [3:0] main_sdram_bankmachine1_cmd_buffer_lookahead_level = 4'd0;
reg main_sdram_bankmachine1_cmd_buffer_lookahead_replace = 1'd0;
reg [2:0] main_sdram_bankmachine1_cmd_buffer_lookahead_produce = 3'd0;
reg [2:0] main_sdram_bankmachine1_cmd_buffer_lookahead_consume = 3'd0;
reg [2:0] main_sdram_bankmachine1_cmd_buffer_lookahead_wrport_adr = 3'd0;
wire [23:0] main_sdram_bankmachine1_cmd_buffer_lookahead_wrport_dat_r;
wire main_sdram_bankmachine1_cmd_buffer_lookahead_wrport_we;
wire [23:0] main_sdram_bankmachine1_cmd_buffer_lookahead_wrport_dat_w;
wire main_sdram_bankmachine1_cmd_buffer_lookahead_do_read;
wire [2:0] main_sdram_bankmachine1_cmd_buffer_lookahead_rdport_adr;
wire [23:0] main_sdram_bankmachine1_cmd_buffer_lookahead_rdport_dat_r;
wire main_sdram_bankmachine1_cmd_buffer_lookahead_fifo_in_payload_we;
wire [20:0] main_sdram_bankmachine1_cmd_buffer_lookahead_fifo_in_payload_addr;
wire main_sdram_bankmachine1_cmd_buffer_lookahead_fifo_in_first;
wire main_sdram_bankmachine1_cmd_buffer_lookahead_fifo_in_last;
wire main_sdram_bankmachine1_cmd_buffer_lookahead_fifo_out_payload_we;
wire [20:0] main_sdram_bankmachine1_cmd_buffer_lookahead_fifo_out_payload_addr;
wire main_sdram_bankmachine1_cmd_buffer_lookahead_fifo_out_first;
wire main_sdram_bankmachine1_cmd_buffer_lookahead_fifo_out_last;
wire main_sdram_bankmachine1_cmd_buffer_sink_valid;
wire main_sdram_bankmachine1_cmd_buffer_sink_ready;
wire main_sdram_bankmachine1_cmd_buffer_sink_first;
wire main_sdram_bankmachine1_cmd_buffer_sink_last;
wire main_sdram_bankmachine1_cmd_buffer_sink_payload_we;
wire [20:0] main_sdram_bankmachine1_cmd_buffer_sink_payload_addr;
reg main_sdram_bankmachine1_cmd_buffer_source_valid = 1'd0;
wire main_sdram_bankmachine1_cmd_buffer_source_ready;
reg main_sdram_bankmachine1_cmd_buffer_source_first = 1'd0;
reg main_sdram_bankmachine1_cmd_buffer_source_last = 1'd0;
reg main_sdram_bankmachine1_cmd_buffer_source_payload_we = 1'd0;
reg [20:0] main_sdram_bankmachine1_cmd_buffer_source_payload_addr = 21'd0;
reg [13:0] main_sdram_bankmachine1_row = 14'd0;
reg main_sdram_bankmachine1_row_opened = 1'd0;
wire main_sdram_bankmachine1_row_hit;
reg main_sdram_bankmachine1_row_open = 1'd0;
reg main_sdram_bankmachine1_row_close = 1'd0;
reg main_sdram_bankmachine1_row_col_n_addr_sel = 1'd0;
wire main_sdram_bankmachine1_twtpcon_valid;
(* dont_touch = "true" *) reg main_sdram_bankmachine1_twtpcon_ready = 1'd1;
reg [2:0] main_sdram_bankmachine1_twtpcon_count = 3'd0;
wire main_sdram_bankmachine1_trccon_valid;
(* dont_touch = "true" *) reg main_sdram_bankmachine1_trccon_ready = 1'd1;
reg [2:0] main_sdram_bankmachine1_trccon_count = 3'd0;
wire main_sdram_bankmachine1_trascon_valid;
(* dont_touch = "true" *) reg main_sdram_bankmachine1_trascon_ready = 1'd1;
reg [2:0] main_sdram_bankmachine1_trascon_count = 3'd0;
wire main_sdram_bankmachine2_req_valid;
wire main_sdram_bankmachine2_req_ready;
wire main_sdram_bankmachine2_req_we;
wire [20:0] main_sdram_bankmachine2_req_addr;
wire main_sdram_bankmachine2_req_lock;
reg main_sdram_bankmachine2_req_wdata_ready = 1'd0;
reg main_sdram_bankmachine2_req_rdata_valid = 1'd0;
wire main_sdram_bankmachine2_refresh_req;
reg main_sdram_bankmachine2_refresh_gnt = 1'd0;
reg main_sdram_bankmachine2_cmd_valid = 1'd0;
reg main_sdram_bankmachine2_cmd_ready = 1'd0;
reg [13:0] main_sdram_bankmachine2_cmd_payload_a = 14'd0;
wire [2:0] main_sdram_bankmachine2_cmd_payload_ba;
reg main_sdram_bankmachine2_cmd_payload_cas = 1'd0;
reg main_sdram_bankmachine2_cmd_payload_ras = 1'd0;
reg main_sdram_bankmachine2_cmd_payload_we = 1'd0;
reg main_sdram_bankmachine2_cmd_payload_is_cmd = 1'd0;
reg main_sdram_bankmachine2_cmd_payload_is_read = 1'd0;
reg main_sdram_bankmachine2_cmd_payload_is_write = 1'd0;
reg main_sdram_bankmachine2_auto_precharge = 1'd0;
wire main_sdram_bankmachine2_cmd_buffer_lookahead_sink_valid;
wire main_sdram_bankmachine2_cmd_buffer_lookahead_sink_ready;
reg main_sdram_bankmachine2_cmd_buffer_lookahead_sink_first = 1'd0;
reg main_sdram_bankmachine2_cmd_buffer_lookahead_sink_last = 1'd0;
wire main_sdram_bankmachine2_cmd_buffer_lookahead_sink_payload_we;
wire [20:0] main_sdram_bankmachine2_cmd_buffer_lookahead_sink_payload_addr;
wire main_sdram_bankmachine2_cmd_buffer_lookahead_source_valid;
wire main_sdram_bankmachine2_cmd_buffer_lookahead_source_ready;
wire main_sdram_bankmachine2_cmd_buffer_lookahead_source_first;
wire main_sdram_bankmachine2_cmd_buffer_lookahead_source_last;
wire main_sdram_bankmachine2_cmd_buffer_lookahead_source_payload_we;
wire [20:0] main_sdram_bankmachine2_cmd_buffer_lookahead_source_payload_addr;
wire main_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_we;
wire main_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_writable;
wire main_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_re;
wire main_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_readable;
wire [23:0] main_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_din;
wire [23:0] main_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_dout;
reg [3:0] main_sdram_bankmachine2_cmd_buffer_lookahead_level = 4'd0;
reg main_sdram_bankmachine2_cmd_buffer_lookahead_replace = 1'd0;
reg [2:0] main_sdram_bankmachine2_cmd_buffer_lookahead_produce = 3'd0;
reg [2:0] main_sdram_bankmachine2_cmd_buffer_lookahead_consume = 3'd0;
reg [2:0] main_sdram_bankmachine2_cmd_buffer_lookahead_wrport_adr = 3'd0;
wire [23:0] main_sdram_bankmachine2_cmd_buffer_lookahead_wrport_dat_r;
wire main_sdram_bankmachine2_cmd_buffer_lookahead_wrport_we;
wire [23:0] main_sdram_bankmachine2_cmd_buffer_lookahead_wrport_dat_w;
wire main_sdram_bankmachine2_cmd_buffer_lookahead_do_read;
wire [2:0] main_sdram_bankmachine2_cmd_buffer_lookahead_rdport_adr;
wire [23:0] main_sdram_bankmachine2_cmd_buffer_lookahead_rdport_dat_r;
wire main_sdram_bankmachine2_cmd_buffer_lookahead_fifo_in_payload_we;
wire [20:0] main_sdram_bankmachine2_cmd_buffer_lookahead_fifo_in_payload_addr;
wire main_sdram_bankmachine2_cmd_buffer_lookahead_fifo_in_first;
wire main_sdram_bankmachine2_cmd_buffer_lookahead_fifo_in_last;
wire main_sdram_bankmachine2_cmd_buffer_lookahead_fifo_out_payload_we;
wire [20:0] main_sdram_bankmachine2_cmd_buffer_lookahead_fifo_out_payload_addr;
wire main_sdram_bankmachine2_cmd_buffer_lookahead_fifo_out_first;
wire main_sdram_bankmachine2_cmd_buffer_lookahead_fifo_out_last;
wire main_sdram_bankmachine2_cmd_buffer_sink_valid;
wire main_sdram_bankmachine2_cmd_buffer_sink_ready;
wire main_sdram_bankmachine2_cmd_buffer_sink_first;
wire main_sdram_bankmachine2_cmd_buffer_sink_last;
wire main_sdram_bankmachine2_cmd_buffer_sink_payload_we;
wire [20:0] main_sdram_bankmachine2_cmd_buffer_sink_payload_addr;
reg main_sdram_bankmachine2_cmd_buffer_source_valid = 1'd0;
wire main_sdram_bankmachine2_cmd_buffer_source_ready;
reg main_sdram_bankmachine2_cmd_buffer_source_first = 1'd0;
reg main_sdram_bankmachine2_cmd_buffer_source_last = 1'd0;
reg main_sdram_bankmachine2_cmd_buffer_source_payload_we = 1'd0;
reg [20:0] main_sdram_bankmachine2_cmd_buffer_source_payload_addr = 21'd0;
reg [13:0] main_sdram_bankmachine2_row = 14'd0;
reg main_sdram_bankmachine2_row_opened = 1'd0;
wire main_sdram_bankmachine2_row_hit;
reg main_sdram_bankmachine2_row_open = 1'd0;
reg main_sdram_bankmachine2_row_close = 1'd0;
reg main_sdram_bankmachine2_row_col_n_addr_sel = 1'd0;
wire main_sdram_bankmachine2_twtpcon_valid;
(* dont_touch = "true" *) reg main_sdram_bankmachine2_twtpcon_ready = 1'd1;
reg [2:0] main_sdram_bankmachine2_twtpcon_count = 3'd0;
wire main_sdram_bankmachine2_trccon_valid;
(* dont_touch = "true" *) reg main_sdram_bankmachine2_trccon_ready = 1'd1;
reg [2:0] main_sdram_bankmachine2_trccon_count = 3'd0;
wire main_sdram_bankmachine2_trascon_valid;
(* dont_touch = "true" *) reg main_sdram_bankmachine2_trascon_ready = 1'd1;
reg [2:0] main_sdram_bankmachine2_trascon_count = 3'd0;
wire main_sdram_bankmachine3_req_valid;
wire main_sdram_bankmachine3_req_ready;
wire main_sdram_bankmachine3_req_we;
wire [20:0] main_sdram_bankmachine3_req_addr;
wire main_sdram_bankmachine3_req_lock;
reg main_sdram_bankmachine3_req_wdata_ready = 1'd0;
reg main_sdram_bankmachine3_req_rdata_valid = 1'd0;
wire main_sdram_bankmachine3_refresh_req;
reg main_sdram_bankmachine3_refresh_gnt = 1'd0;
reg main_sdram_bankmachine3_cmd_valid = 1'd0;
reg main_sdram_bankmachine3_cmd_ready = 1'd0;
reg [13:0] main_sdram_bankmachine3_cmd_payload_a = 14'd0;
wire [2:0] main_sdram_bankmachine3_cmd_payload_ba;
reg main_sdram_bankmachine3_cmd_payload_cas = 1'd0;
reg main_sdram_bankmachine3_cmd_payload_ras = 1'd0;
reg main_sdram_bankmachine3_cmd_payload_we = 1'd0;
reg main_sdram_bankmachine3_cmd_payload_is_cmd = 1'd0;
reg main_sdram_bankmachine3_cmd_payload_is_read = 1'd0;
reg main_sdram_bankmachine3_cmd_payload_is_write = 1'd0;
reg main_sdram_bankmachine3_auto_precharge = 1'd0;
wire main_sdram_bankmachine3_cmd_buffer_lookahead_sink_valid;
wire main_sdram_bankmachine3_cmd_buffer_lookahead_sink_ready;
reg main_sdram_bankmachine3_cmd_buffer_lookahead_sink_first = 1'd0;
reg main_sdram_bankmachine3_cmd_buffer_lookahead_sink_last = 1'd0;
wire main_sdram_bankmachine3_cmd_buffer_lookahead_sink_payload_we;
wire [20:0] main_sdram_bankmachine3_cmd_buffer_lookahead_sink_payload_addr;
wire main_sdram_bankmachine3_cmd_buffer_lookahead_source_valid;
wire main_sdram_bankmachine3_cmd_buffer_lookahead_source_ready;
wire main_sdram_bankmachine3_cmd_buffer_lookahead_source_first;
wire main_sdram_bankmachine3_cmd_buffer_lookahead_source_last;
wire main_sdram_bankmachine3_cmd_buffer_lookahead_source_payload_we;
wire [20:0] main_sdram_bankmachine3_cmd_buffer_lookahead_source_payload_addr;
wire main_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_we;
wire main_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_writable;
wire main_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_re;
wire main_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_readable;
wire [23:0] main_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_din;
wire [23:0] main_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_dout;
reg [3:0] main_sdram_bankmachine3_cmd_buffer_lookahead_level = 4'd0;
reg main_sdram_bankmachine3_cmd_buffer_lookahead_replace = 1'd0;
reg [2:0] main_sdram_bankmachine3_cmd_buffer_lookahead_produce = 3'd0;
reg [2:0] main_sdram_bankmachine3_cmd_buffer_lookahead_consume = 3'd0;
reg [2:0] main_sdram_bankmachine3_cmd_buffer_lookahead_wrport_adr = 3'd0;
wire [23:0] main_sdram_bankmachine3_cmd_buffer_lookahead_wrport_dat_r;
wire main_sdram_bankmachine3_cmd_buffer_lookahead_wrport_we;
wire [23:0] main_sdram_bankmachine3_cmd_buffer_lookahead_wrport_dat_w;
wire main_sdram_bankmachine3_cmd_buffer_lookahead_do_read;
wire [2:0] main_sdram_bankmachine3_cmd_buffer_lookahead_rdport_adr;
wire [23:0] main_sdram_bankmachine3_cmd_buffer_lookahead_rdport_dat_r;
wire main_sdram_bankmachine3_cmd_buffer_lookahead_fifo_in_payload_we;
wire [20:0] main_sdram_bankmachine3_cmd_buffer_lookahead_fifo_in_payload_addr;
wire main_sdram_bankmachine3_cmd_buffer_lookahead_fifo_in_first;
wire main_sdram_bankmachine3_cmd_buffer_lookahead_fifo_in_last;
wire main_sdram_bankmachine3_cmd_buffer_lookahead_fifo_out_payload_we;
wire [20:0] main_sdram_bankmachine3_cmd_buffer_lookahead_fifo_out_payload_addr;
wire main_sdram_bankmachine3_cmd_buffer_lookahead_fifo_out_first;
wire main_sdram_bankmachine3_cmd_buffer_lookahead_fifo_out_last;
wire main_sdram_bankmachine3_cmd_buffer_sink_valid;
wire main_sdram_bankmachine3_cmd_buffer_sink_ready;
wire main_sdram_bankmachine3_cmd_buffer_sink_first;
wire main_sdram_bankmachine3_cmd_buffer_sink_last;
wire main_sdram_bankmachine3_cmd_buffer_sink_payload_we;
wire [20:0] main_sdram_bankmachine3_cmd_buffer_sink_payload_addr;
reg main_sdram_bankmachine3_cmd_buffer_source_valid = 1'd0;
wire main_sdram_bankmachine3_cmd_buffer_source_ready;
reg main_sdram_bankmachine3_cmd_buffer_source_first = 1'd0;
reg main_sdram_bankmachine3_cmd_buffer_source_last = 1'd0;
reg main_sdram_bankmachine3_cmd_buffer_source_payload_we = 1'd0;
reg [20:0] main_sdram_bankmachine3_cmd_buffer_source_payload_addr = 21'd0;
reg [13:0] main_sdram_bankmachine3_row = 14'd0;
reg main_sdram_bankmachine3_row_opened = 1'd0;
wire main_sdram_bankmachine3_row_hit;
reg main_sdram_bankmachine3_row_open = 1'd0;
reg main_sdram_bankmachine3_row_close = 1'd0;
reg main_sdram_bankmachine3_row_col_n_addr_sel = 1'd0;
wire main_sdram_bankmachine3_twtpcon_valid;
(* dont_touch = "true" *) reg main_sdram_bankmachine3_twtpcon_ready = 1'd1;
reg [2:0] main_sdram_bankmachine3_twtpcon_count = 3'd0;
wire main_sdram_bankmachine3_trccon_valid;
(* dont_touch = "true" *) reg main_sdram_bankmachine3_trccon_ready = 1'd1;
reg [2:0] main_sdram_bankmachine3_trccon_count = 3'd0;
wire main_sdram_bankmachine3_trascon_valid;
(* dont_touch = "true" *) reg main_sdram_bankmachine3_trascon_ready = 1'd1;
reg [2:0] main_sdram_bankmachine3_trascon_count = 3'd0;
wire main_sdram_bankmachine4_req_valid;
wire main_sdram_bankmachine4_req_ready;
wire main_sdram_bankmachine4_req_we;
wire [20:0] main_sdram_bankmachine4_req_addr;
wire main_sdram_bankmachine4_req_lock;
reg main_sdram_bankmachine4_req_wdata_ready = 1'd0;
reg main_sdram_bankmachine4_req_rdata_valid = 1'd0;
wire main_sdram_bankmachine4_refresh_req;
reg main_sdram_bankmachine4_refresh_gnt = 1'd0;
reg main_sdram_bankmachine4_cmd_valid = 1'd0;
reg main_sdram_bankmachine4_cmd_ready = 1'd0;
reg [13:0] main_sdram_bankmachine4_cmd_payload_a = 14'd0;
wire [2:0] main_sdram_bankmachine4_cmd_payload_ba;
reg main_sdram_bankmachine4_cmd_payload_cas = 1'd0;
reg main_sdram_bankmachine4_cmd_payload_ras = 1'd0;
reg main_sdram_bankmachine4_cmd_payload_we = 1'd0;
reg main_sdram_bankmachine4_cmd_payload_is_cmd = 1'd0;
reg main_sdram_bankmachine4_cmd_payload_is_read = 1'd0;
reg main_sdram_bankmachine4_cmd_payload_is_write = 1'd0;
reg main_sdram_bankmachine4_auto_precharge = 1'd0;
wire main_sdram_bankmachine4_cmd_buffer_lookahead_sink_valid;
wire main_sdram_bankmachine4_cmd_buffer_lookahead_sink_ready;
reg main_sdram_bankmachine4_cmd_buffer_lookahead_sink_first = 1'd0;
reg main_sdram_bankmachine4_cmd_buffer_lookahead_sink_last = 1'd0;
wire main_sdram_bankmachine4_cmd_buffer_lookahead_sink_payload_we;
wire [20:0] main_sdram_bankmachine4_cmd_buffer_lookahead_sink_payload_addr;
wire main_sdram_bankmachine4_cmd_buffer_lookahead_source_valid;
wire main_sdram_bankmachine4_cmd_buffer_lookahead_source_ready;
wire main_sdram_bankmachine4_cmd_buffer_lookahead_source_first;
wire main_sdram_bankmachine4_cmd_buffer_lookahead_source_last;
wire main_sdram_bankmachine4_cmd_buffer_lookahead_source_payload_we;
wire [20:0] main_sdram_bankmachine4_cmd_buffer_lookahead_source_payload_addr;
wire main_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_we;
wire main_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_writable;
wire main_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_re;
wire main_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_readable;
wire [23:0] main_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_din;
wire [23:0] main_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_dout;
reg [3:0] main_sdram_bankmachine4_cmd_buffer_lookahead_level = 4'd0;
reg main_sdram_bankmachine4_cmd_buffer_lookahead_replace = 1'd0;
reg [2:0] main_sdram_bankmachine4_cmd_buffer_lookahead_produce = 3'd0;
reg [2:0] main_sdram_bankmachine4_cmd_buffer_lookahead_consume = 3'd0;
reg [2:0] main_sdram_bankmachine4_cmd_buffer_lookahead_wrport_adr = 3'd0;
wire [23:0] main_sdram_bankmachine4_cmd_buffer_lookahead_wrport_dat_r;
wire main_sdram_bankmachine4_cmd_buffer_lookahead_wrport_we;
wire [23:0] main_sdram_bankmachine4_cmd_buffer_lookahead_wrport_dat_w;
wire main_sdram_bankmachine4_cmd_buffer_lookahead_do_read;
wire [2:0] main_sdram_bankmachine4_cmd_buffer_lookahead_rdport_adr;
wire [23:0] main_sdram_bankmachine4_cmd_buffer_lookahead_rdport_dat_r;
wire main_sdram_bankmachine4_cmd_buffer_lookahead_fifo_in_payload_we;
wire [20:0] main_sdram_bankmachine4_cmd_buffer_lookahead_fifo_in_payload_addr;
wire main_sdram_bankmachine4_cmd_buffer_lookahead_fifo_in_first;
wire main_sdram_bankmachine4_cmd_buffer_lookahead_fifo_in_last;
wire main_sdram_bankmachine4_cmd_buffer_lookahead_fifo_out_payload_we;
wire [20:0] main_sdram_bankmachine4_cmd_buffer_lookahead_fifo_out_payload_addr;
wire main_sdram_bankmachine4_cmd_buffer_lookahead_fifo_out_first;
wire main_sdram_bankmachine4_cmd_buffer_lookahead_fifo_out_last;
wire main_sdram_bankmachine4_cmd_buffer_sink_valid;
wire main_sdram_bankmachine4_cmd_buffer_sink_ready;
wire main_sdram_bankmachine4_cmd_buffer_sink_first;
wire main_sdram_bankmachine4_cmd_buffer_sink_last;
wire main_sdram_bankmachine4_cmd_buffer_sink_payload_we;
wire [20:0] main_sdram_bankmachine4_cmd_buffer_sink_payload_addr;
reg main_sdram_bankmachine4_cmd_buffer_source_valid = 1'd0;
wire main_sdram_bankmachine4_cmd_buffer_source_ready;
reg main_sdram_bankmachine4_cmd_buffer_source_first = 1'd0;
reg main_sdram_bankmachine4_cmd_buffer_source_last = 1'd0;
reg main_sdram_bankmachine4_cmd_buffer_source_payload_we = 1'd0;
reg [20:0] main_sdram_bankmachine4_cmd_buffer_source_payload_addr = 21'd0;
reg [13:0] main_sdram_bankmachine4_row = 14'd0;
reg main_sdram_bankmachine4_row_opened = 1'd0;
wire main_sdram_bankmachine4_row_hit;
reg main_sdram_bankmachine4_row_open = 1'd0;
reg main_sdram_bankmachine4_row_close = 1'd0;
reg main_sdram_bankmachine4_row_col_n_addr_sel = 1'd0;
wire main_sdram_bankmachine4_twtpcon_valid;
(* dont_touch = "true" *) reg main_sdram_bankmachine4_twtpcon_ready = 1'd1;
reg [2:0] main_sdram_bankmachine4_twtpcon_count = 3'd0;
wire main_sdram_bankmachine4_trccon_valid;
(* dont_touch = "true" *) reg main_sdram_bankmachine4_trccon_ready = 1'd1;
reg [2:0] main_sdram_bankmachine4_trccon_count = 3'd0;
wire main_sdram_bankmachine4_trascon_valid;
(* dont_touch = "true" *) reg main_sdram_bankmachine4_trascon_ready = 1'd1;
reg [2:0] main_sdram_bankmachine4_trascon_count = 3'd0;
wire main_sdram_bankmachine5_req_valid;
wire main_sdram_bankmachine5_req_ready;
wire main_sdram_bankmachine5_req_we;
wire [20:0] main_sdram_bankmachine5_req_addr;
wire main_sdram_bankmachine5_req_lock;
reg main_sdram_bankmachine5_req_wdata_ready = 1'd0;
reg main_sdram_bankmachine5_req_rdata_valid = 1'd0;
wire main_sdram_bankmachine5_refresh_req;
reg main_sdram_bankmachine5_refresh_gnt = 1'd0;
reg main_sdram_bankmachine5_cmd_valid = 1'd0;
reg main_sdram_bankmachine5_cmd_ready = 1'd0;
reg [13:0] main_sdram_bankmachine5_cmd_payload_a = 14'd0;
wire [2:0] main_sdram_bankmachine5_cmd_payload_ba;
reg main_sdram_bankmachine5_cmd_payload_cas = 1'd0;
reg main_sdram_bankmachine5_cmd_payload_ras = 1'd0;
reg main_sdram_bankmachine5_cmd_payload_we = 1'd0;
reg main_sdram_bankmachine5_cmd_payload_is_cmd = 1'd0;
reg main_sdram_bankmachine5_cmd_payload_is_read = 1'd0;
reg main_sdram_bankmachine5_cmd_payload_is_write = 1'd0;
reg main_sdram_bankmachine5_auto_precharge = 1'd0;
wire main_sdram_bankmachine5_cmd_buffer_lookahead_sink_valid;
wire main_sdram_bankmachine5_cmd_buffer_lookahead_sink_ready;
reg main_sdram_bankmachine5_cmd_buffer_lookahead_sink_first = 1'd0;
reg main_sdram_bankmachine5_cmd_buffer_lookahead_sink_last = 1'd0;
wire main_sdram_bankmachine5_cmd_buffer_lookahead_sink_payload_we;
wire [20:0] main_sdram_bankmachine5_cmd_buffer_lookahead_sink_payload_addr;
wire main_sdram_bankmachine5_cmd_buffer_lookahead_source_valid;
wire main_sdram_bankmachine5_cmd_buffer_lookahead_source_ready;
wire main_sdram_bankmachine5_cmd_buffer_lookahead_source_first;
wire main_sdram_bankmachine5_cmd_buffer_lookahead_source_last;
wire main_sdram_bankmachine5_cmd_buffer_lookahead_source_payload_we;
wire [20:0] main_sdram_bankmachine5_cmd_buffer_lookahead_source_payload_addr;
wire main_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_we;
wire main_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_writable;
wire main_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_re;
wire main_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_readable;
wire [23:0] main_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_din;
wire [23:0] main_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_dout;
reg [3:0] main_sdram_bankmachine5_cmd_buffer_lookahead_level = 4'd0;
reg main_sdram_bankmachine5_cmd_buffer_lookahead_replace = 1'd0;
reg [2:0] main_sdram_bankmachine5_cmd_buffer_lookahead_produce = 3'd0;
reg [2:0] main_sdram_bankmachine5_cmd_buffer_lookahead_consume = 3'd0;
reg [2:0] main_sdram_bankmachine5_cmd_buffer_lookahead_wrport_adr = 3'd0;
wire [23:0] main_sdram_bankmachine5_cmd_buffer_lookahead_wrport_dat_r;
wire main_sdram_bankmachine5_cmd_buffer_lookahead_wrport_we;
wire [23:0] main_sdram_bankmachine5_cmd_buffer_lookahead_wrport_dat_w;
wire main_sdram_bankmachine5_cmd_buffer_lookahead_do_read;
wire [2:0] main_sdram_bankmachine5_cmd_buffer_lookahead_rdport_adr;
wire [23:0] main_sdram_bankmachine5_cmd_buffer_lookahead_rdport_dat_r;
wire main_sdram_bankmachine5_cmd_buffer_lookahead_fifo_in_payload_we;
wire [20:0] main_sdram_bankmachine5_cmd_buffer_lookahead_fifo_in_payload_addr;
wire main_sdram_bankmachine5_cmd_buffer_lookahead_fifo_in_first;
wire main_sdram_bankmachine5_cmd_buffer_lookahead_fifo_in_last;
wire main_sdram_bankmachine5_cmd_buffer_lookahead_fifo_out_payload_we;
wire [20:0] main_sdram_bankmachine5_cmd_buffer_lookahead_fifo_out_payload_addr;
wire main_sdram_bankmachine5_cmd_buffer_lookahead_fifo_out_first;
wire main_sdram_bankmachine5_cmd_buffer_lookahead_fifo_out_last;
wire main_sdram_bankmachine5_cmd_buffer_sink_valid;
wire main_sdram_bankmachine5_cmd_buffer_sink_ready;
wire main_sdram_bankmachine5_cmd_buffer_sink_first;
wire main_sdram_bankmachine5_cmd_buffer_sink_last;
wire main_sdram_bankmachine5_cmd_buffer_sink_payload_we;
wire [20:0] main_sdram_bankmachine5_cmd_buffer_sink_payload_addr;
reg main_sdram_bankmachine5_cmd_buffer_source_valid = 1'd0;
wire main_sdram_bankmachine5_cmd_buffer_source_ready;
reg main_sdram_bankmachine5_cmd_buffer_source_first = 1'd0;
reg main_sdram_bankmachine5_cmd_buffer_source_last = 1'd0;
reg main_sdram_bankmachine5_cmd_buffer_source_payload_we = 1'd0;
reg [20:0] main_sdram_bankmachine5_cmd_buffer_source_payload_addr = 21'd0;
reg [13:0] main_sdram_bankmachine5_row = 14'd0;
reg main_sdram_bankmachine5_row_opened = 1'd0;
wire main_sdram_bankmachine5_row_hit;
reg main_sdram_bankmachine5_row_open = 1'd0;
reg main_sdram_bankmachine5_row_close = 1'd0;
reg main_sdram_bankmachine5_row_col_n_addr_sel = 1'd0;
wire main_sdram_bankmachine5_twtpcon_valid;
(* dont_touch = "true" *) reg main_sdram_bankmachine5_twtpcon_ready = 1'd1;
reg [2:0] main_sdram_bankmachine5_twtpcon_count = 3'd0;
wire main_sdram_bankmachine5_trccon_valid;
(* dont_touch = "true" *) reg main_sdram_bankmachine5_trccon_ready = 1'd1;
reg [2:0] main_sdram_bankmachine5_trccon_count = 3'd0;
wire main_sdram_bankmachine5_trascon_valid;
(* dont_touch = "true" *) reg main_sdram_bankmachine5_trascon_ready = 1'd1;
reg [2:0] main_sdram_bankmachine5_trascon_count = 3'd0;
wire main_sdram_bankmachine6_req_valid;
wire main_sdram_bankmachine6_req_ready;
wire main_sdram_bankmachine6_req_we;
wire [20:0] main_sdram_bankmachine6_req_addr;
wire main_sdram_bankmachine6_req_lock;
reg main_sdram_bankmachine6_req_wdata_ready = 1'd0;
reg main_sdram_bankmachine6_req_rdata_valid = 1'd0;
wire main_sdram_bankmachine6_refresh_req;
reg main_sdram_bankmachine6_refresh_gnt = 1'd0;
reg main_sdram_bankmachine6_cmd_valid = 1'd0;
reg main_sdram_bankmachine6_cmd_ready = 1'd0;
reg [13:0] main_sdram_bankmachine6_cmd_payload_a = 14'd0;
wire [2:0] main_sdram_bankmachine6_cmd_payload_ba;
reg main_sdram_bankmachine6_cmd_payload_cas = 1'd0;
reg main_sdram_bankmachine6_cmd_payload_ras = 1'd0;
reg main_sdram_bankmachine6_cmd_payload_we = 1'd0;
reg main_sdram_bankmachine6_cmd_payload_is_cmd = 1'd0;
reg main_sdram_bankmachine6_cmd_payload_is_read = 1'd0;
reg main_sdram_bankmachine6_cmd_payload_is_write = 1'd0;
reg main_sdram_bankmachine6_auto_precharge = 1'd0;
wire main_sdram_bankmachine6_cmd_buffer_lookahead_sink_valid;
wire main_sdram_bankmachine6_cmd_buffer_lookahead_sink_ready;
reg main_sdram_bankmachine6_cmd_buffer_lookahead_sink_first = 1'd0;
reg main_sdram_bankmachine6_cmd_buffer_lookahead_sink_last = 1'd0;
wire main_sdram_bankmachine6_cmd_buffer_lookahead_sink_payload_we;
wire [20:0] main_sdram_bankmachine6_cmd_buffer_lookahead_sink_payload_addr;
wire main_sdram_bankmachine6_cmd_buffer_lookahead_source_valid;
wire main_sdram_bankmachine6_cmd_buffer_lookahead_source_ready;
wire main_sdram_bankmachine6_cmd_buffer_lookahead_source_first;
wire main_sdram_bankmachine6_cmd_buffer_lookahead_source_last;
wire main_sdram_bankmachine6_cmd_buffer_lookahead_source_payload_we;
wire [20:0] main_sdram_bankmachine6_cmd_buffer_lookahead_source_payload_addr;
wire main_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_we;
wire main_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_writable;
wire main_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_re;
wire main_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_readable;
wire [23:0] main_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_din;
wire [23:0] main_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_dout;
reg [3:0] main_sdram_bankmachine6_cmd_buffer_lookahead_level = 4'd0;
reg main_sdram_bankmachine6_cmd_buffer_lookahead_replace = 1'd0;
reg [2:0] main_sdram_bankmachine6_cmd_buffer_lookahead_produce = 3'd0;
reg [2:0] main_sdram_bankmachine6_cmd_buffer_lookahead_consume = 3'd0;
reg [2:0] main_sdram_bankmachine6_cmd_buffer_lookahead_wrport_adr = 3'd0;
wire [23:0] main_sdram_bankmachine6_cmd_buffer_lookahead_wrport_dat_r;
wire main_sdram_bankmachine6_cmd_buffer_lookahead_wrport_we;
wire [23:0] main_sdram_bankmachine6_cmd_buffer_lookahead_wrport_dat_w;
wire main_sdram_bankmachine6_cmd_buffer_lookahead_do_read;
wire [2:0] main_sdram_bankmachine6_cmd_buffer_lookahead_rdport_adr;
wire [23:0] main_sdram_bankmachine6_cmd_buffer_lookahead_rdport_dat_r;
wire main_sdram_bankmachine6_cmd_buffer_lookahead_fifo_in_payload_we;
wire [20:0] main_sdram_bankmachine6_cmd_buffer_lookahead_fifo_in_payload_addr;
wire main_sdram_bankmachine6_cmd_buffer_lookahead_fifo_in_first;
wire main_sdram_bankmachine6_cmd_buffer_lookahead_fifo_in_last;
wire main_sdram_bankmachine6_cmd_buffer_lookahead_fifo_out_payload_we;
wire [20:0] main_sdram_bankmachine6_cmd_buffer_lookahead_fifo_out_payload_addr;
wire main_sdram_bankmachine6_cmd_buffer_lookahead_fifo_out_first;
wire main_sdram_bankmachine6_cmd_buffer_lookahead_fifo_out_last;
wire main_sdram_bankmachine6_cmd_buffer_sink_valid;
wire main_sdram_bankmachine6_cmd_buffer_sink_ready;
wire main_sdram_bankmachine6_cmd_buffer_sink_first;
wire main_sdram_bankmachine6_cmd_buffer_sink_last;
wire main_sdram_bankmachine6_cmd_buffer_sink_payload_we;
wire [20:0] main_sdram_bankmachine6_cmd_buffer_sink_payload_addr;
reg main_sdram_bankmachine6_cmd_buffer_source_valid = 1'd0;
wire main_sdram_bankmachine6_cmd_buffer_source_ready;
reg main_sdram_bankmachine6_cmd_buffer_source_first = 1'd0;
reg main_sdram_bankmachine6_cmd_buffer_source_last = 1'd0;
reg main_sdram_bankmachine6_cmd_buffer_source_payload_we = 1'd0;
reg [20:0] main_sdram_bankmachine6_cmd_buffer_source_payload_addr = 21'd0;
reg [13:0] main_sdram_bankmachine6_row = 14'd0;
reg main_sdram_bankmachine6_row_opened = 1'd0;
wire main_sdram_bankmachine6_row_hit;
reg main_sdram_bankmachine6_row_open = 1'd0;
reg main_sdram_bankmachine6_row_close = 1'd0;
reg main_sdram_bankmachine6_row_col_n_addr_sel = 1'd0;
wire main_sdram_bankmachine6_twtpcon_valid;
(* dont_touch = "true" *) reg main_sdram_bankmachine6_twtpcon_ready = 1'd1;
reg [2:0] main_sdram_bankmachine6_twtpcon_count = 3'd0;
wire main_sdram_bankmachine6_trccon_valid;
(* dont_touch = "true" *) reg main_sdram_bankmachine6_trccon_ready = 1'd1;
reg [2:0] main_sdram_bankmachine6_trccon_count = 3'd0;
wire main_sdram_bankmachine6_trascon_valid;
(* dont_touch = "true" *) reg main_sdram_bankmachine6_trascon_ready = 1'd1;
reg [2:0] main_sdram_bankmachine6_trascon_count = 3'd0;
wire main_sdram_bankmachine7_req_valid;
wire main_sdram_bankmachine7_req_ready;
wire main_sdram_bankmachine7_req_we;
wire [20:0] main_sdram_bankmachine7_req_addr;
wire main_sdram_bankmachine7_req_lock;
reg main_sdram_bankmachine7_req_wdata_ready = 1'd0;
reg main_sdram_bankmachine7_req_rdata_valid = 1'd0;
wire main_sdram_bankmachine7_refresh_req;
reg main_sdram_bankmachine7_refresh_gnt = 1'd0;
reg main_sdram_bankmachine7_cmd_valid = 1'd0;
reg main_sdram_bankmachine7_cmd_ready = 1'd0;
reg [13:0] main_sdram_bankmachine7_cmd_payload_a = 14'd0;
wire [2:0] main_sdram_bankmachine7_cmd_payload_ba;
reg main_sdram_bankmachine7_cmd_payload_cas = 1'd0;
reg main_sdram_bankmachine7_cmd_payload_ras = 1'd0;
reg main_sdram_bankmachine7_cmd_payload_we = 1'd0;
reg main_sdram_bankmachine7_cmd_payload_is_cmd = 1'd0;
reg main_sdram_bankmachine7_cmd_payload_is_read = 1'd0;
reg main_sdram_bankmachine7_cmd_payload_is_write = 1'd0;
reg main_sdram_bankmachine7_auto_precharge = 1'd0;
wire main_sdram_bankmachine7_cmd_buffer_lookahead_sink_valid;
wire main_sdram_bankmachine7_cmd_buffer_lookahead_sink_ready;
reg main_sdram_bankmachine7_cmd_buffer_lookahead_sink_first = 1'd0;
reg main_sdram_bankmachine7_cmd_buffer_lookahead_sink_last = 1'd0;
wire main_sdram_bankmachine7_cmd_buffer_lookahead_sink_payload_we;
wire [20:0] main_sdram_bankmachine7_cmd_buffer_lookahead_sink_payload_addr;
wire main_sdram_bankmachine7_cmd_buffer_lookahead_source_valid;
wire main_sdram_bankmachine7_cmd_buffer_lookahead_source_ready;
wire main_sdram_bankmachine7_cmd_buffer_lookahead_source_first;
wire main_sdram_bankmachine7_cmd_buffer_lookahead_source_last;
wire main_sdram_bankmachine7_cmd_buffer_lookahead_source_payload_we;
wire [20:0] main_sdram_bankmachine7_cmd_buffer_lookahead_source_payload_addr;
wire main_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_we;
wire main_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_writable;
wire main_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_re;
wire main_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_readable;
wire [23:0] main_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_din;
wire [23:0] main_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_dout;
reg [3:0] main_sdram_bankmachine7_cmd_buffer_lookahead_level = 4'd0;
reg main_sdram_bankmachine7_cmd_buffer_lookahead_replace = 1'd0;
reg [2:0] main_sdram_bankmachine7_cmd_buffer_lookahead_produce = 3'd0;
reg [2:0] main_sdram_bankmachine7_cmd_buffer_lookahead_consume = 3'd0;
reg [2:0] main_sdram_bankmachine7_cmd_buffer_lookahead_wrport_adr = 3'd0;
wire [23:0] main_sdram_bankmachine7_cmd_buffer_lookahead_wrport_dat_r;
wire main_sdram_bankmachine7_cmd_buffer_lookahead_wrport_we;
wire [23:0] main_sdram_bankmachine7_cmd_buffer_lookahead_wrport_dat_w;
wire main_sdram_bankmachine7_cmd_buffer_lookahead_do_read;
wire [2:0] main_sdram_bankmachine7_cmd_buffer_lookahead_rdport_adr;
wire [23:0] main_sdram_bankmachine7_cmd_buffer_lookahead_rdport_dat_r;
wire main_sdram_bankmachine7_cmd_buffer_lookahead_fifo_in_payload_we;
wire [20:0] main_sdram_bankmachine7_cmd_buffer_lookahead_fifo_in_payload_addr;
wire main_sdram_bankmachine7_cmd_buffer_lookahead_fifo_in_first;
wire main_sdram_bankmachine7_cmd_buffer_lookahead_fifo_in_last;
wire main_sdram_bankmachine7_cmd_buffer_lookahead_fifo_out_payload_we;
wire [20:0] main_sdram_bankmachine7_cmd_buffer_lookahead_fifo_out_payload_addr;
wire main_sdram_bankmachine7_cmd_buffer_lookahead_fifo_out_first;
wire main_sdram_bankmachine7_cmd_buffer_lookahead_fifo_out_last;
wire main_sdram_bankmachine7_cmd_buffer_sink_valid;
wire main_sdram_bankmachine7_cmd_buffer_sink_ready;
wire main_sdram_bankmachine7_cmd_buffer_sink_first;
wire main_sdram_bankmachine7_cmd_buffer_sink_last;
wire main_sdram_bankmachine7_cmd_buffer_sink_payload_we;
wire [20:0] main_sdram_bankmachine7_cmd_buffer_sink_payload_addr;
reg main_sdram_bankmachine7_cmd_buffer_source_valid = 1'd0;
wire main_sdram_bankmachine7_cmd_buffer_source_ready;
reg main_sdram_bankmachine7_cmd_buffer_source_first = 1'd0;
reg main_sdram_bankmachine7_cmd_buffer_source_last = 1'd0;
reg main_sdram_bankmachine7_cmd_buffer_source_payload_we = 1'd0;
reg [20:0] main_sdram_bankmachine7_cmd_buffer_source_payload_addr = 21'd0;
reg [13:0] main_sdram_bankmachine7_row = 14'd0;
reg main_sdram_bankmachine7_row_opened = 1'd0;
wire main_sdram_bankmachine7_row_hit;
reg main_sdram_bankmachine7_row_open = 1'd0;
reg main_sdram_bankmachine7_row_close = 1'd0;
reg main_sdram_bankmachine7_row_col_n_addr_sel = 1'd0;
wire main_sdram_bankmachine7_twtpcon_valid;
(* dont_touch = "true" *) reg main_sdram_bankmachine7_twtpcon_ready = 1'd1;
reg [2:0] main_sdram_bankmachine7_twtpcon_count = 3'd0;
wire main_sdram_bankmachine7_trccon_valid;
(* dont_touch = "true" *) reg main_sdram_bankmachine7_trccon_ready = 1'd1;
reg [2:0] main_sdram_bankmachine7_trccon_count = 3'd0;
wire main_sdram_bankmachine7_trascon_valid;
(* dont_touch = "true" *) reg main_sdram_bankmachine7_trascon_ready = 1'd1;
reg [2:0] main_sdram_bankmachine7_trascon_count = 3'd0;
wire main_sdram_ras_allowed;
wire main_sdram_cas_allowed;
reg main_sdram_choose_cmd_want_reads = 1'd0;
reg main_sdram_choose_cmd_want_writes = 1'd0;
reg main_sdram_choose_cmd_want_cmds = 1'd0;
reg main_sdram_choose_cmd_want_activates = 1'd0;
wire main_sdram_choose_cmd_cmd_valid;
reg main_sdram_choose_cmd_cmd_ready = 1'd0;
wire [13:0] main_sdram_choose_cmd_cmd_payload_a;
wire [2:0] main_sdram_choose_cmd_cmd_payload_ba;
reg main_sdram_choose_cmd_cmd_payload_cas = 1'd0;
reg main_sdram_choose_cmd_cmd_payload_ras = 1'd0;
reg main_sdram_choose_cmd_cmd_payload_we = 1'd0;
wire main_sdram_choose_cmd_cmd_payload_is_cmd;
wire main_sdram_choose_cmd_cmd_payload_is_read;
wire main_sdram_choose_cmd_cmd_payload_is_write;
reg [7:0] main_sdram_choose_cmd_valids = 8'd0;
wire [7:0] main_sdram_choose_cmd_request;
reg [2:0] main_sdram_choose_cmd_grant = 3'd0;
wire main_sdram_choose_cmd_ce;
reg main_sdram_choose_req_want_reads = 1'd0;
reg main_sdram_choose_req_want_writes = 1'd0;
reg main_sdram_choose_req_want_cmds = 1'd0;
reg main_sdram_choose_req_want_activates = 1'd0;
wire main_sdram_choose_req_cmd_valid;
reg main_sdram_choose_req_cmd_ready = 1'd0;
wire [13:0] main_sdram_choose_req_cmd_payload_a;
wire [2:0] main_sdram_choose_req_cmd_payload_ba;
reg main_sdram_choose_req_cmd_payload_cas = 1'd0;
reg main_sdram_choose_req_cmd_payload_ras = 1'd0;
reg main_sdram_choose_req_cmd_payload_we = 1'd0;
wire main_sdram_choose_req_cmd_payload_is_cmd;
wire main_sdram_choose_req_cmd_payload_is_read;
wire main_sdram_choose_req_cmd_payload_is_write;
reg [7:0] main_sdram_choose_req_valids = 8'd0;
wire [7:0] main_sdram_choose_req_request;
reg [2:0] main_sdram_choose_req_grant = 3'd0;
wire main_sdram_choose_req_ce;
reg [13:0] main_sdram_nop_a = 14'd0;
reg [2:0] main_sdram_nop_ba = 3'd0;
reg [1:0] main_sdram_steerer_sel0 = 2'd0;
reg [1:0] main_sdram_steerer_sel1 = 2'd0;
reg [1:0] main_sdram_steerer_sel2 = 2'd0;
reg [1:0] main_sdram_steerer_sel3 = 2'd0;
reg main_sdram_steerer0 = 1'd1;
reg main_sdram_steerer1 = 1'd1;
reg main_sdram_steerer2 = 1'd1;
reg main_sdram_steerer3 = 1'd1;
reg main_sdram_steerer4 = 1'd1;
reg main_sdram_steerer5 = 1'd1;
reg main_sdram_steerer6 = 1'd1;
reg main_sdram_steerer7 = 1'd1;
wire main_sdram_trrdcon_valid;
(* dont_touch = "true" *) reg main_sdram_trrdcon_ready = 1'd1;
reg main_sdram_trrdcon_count = 1'd0;
wire main_sdram_tfawcon_valid;
(* dont_touch = "true" *) reg main_sdram_tfawcon_ready = 1'd1;
wire [2:0] main_sdram_tfawcon_count;
reg [4:0] main_sdram_tfawcon_window = 5'd0;
wire main_sdram_tccdcon_valid;
(* dont_touch = "true" *) reg main_sdram_tccdcon_ready = 1'd1;
reg main_sdram_tccdcon_count = 1'd0;
wire main_sdram_twtrcon_valid;
(* dont_touch = "true" *) reg main_sdram_twtrcon_ready = 1'd1;
reg [2:0] main_sdram_twtrcon_count = 3'd0;
wire main_sdram_read_available;
wire main_sdram_write_available;
reg main_sdram_en0 = 1'd0;
wire main_sdram_max_time0;
reg [4:0] main_sdram_time0 = 5'd0;
reg main_sdram_en1 = 1'd0;
wire main_sdram_max_time1;
reg [3:0] main_sdram_time1 = 4'd0;
wire main_sdram_go_to_refresh;
wire main_litedramnativeport0_cmd_valid;
wire main_litedramnativeport0_cmd_ready;
wire main_litedramnativeport0_cmd_first;
wire main_litedramnativeport0_cmd_last;
wire main_litedramnativeport0_cmd_payload_we;
wire [23:0] main_litedramnativeport0_cmd_payload_addr;
wire main_litedramnativeport0_wdata_valid;
wire main_litedramnativeport0_wdata_ready;
wire main_litedramnativeport0_wdata_first;
wire main_litedramnativeport0_wdata_last;
wire [127:0] main_litedramnativeport0_wdata_payload_data;
wire [15:0] main_litedramnativeport0_wdata_payload_we;
wire main_litedramnativeport0_rdata_valid;
wire main_litedramnativeport0_rdata_ready;
reg main_litedramnativeport0_rdata_first = 1'd0;
reg main_litedramnativeport0_rdata_last = 1'd0;
wire [127:0] main_litedramnativeport0_rdata_payload_data;
wire main_litedramnativeport1_cmd_valid;
wire main_litedramnativeport1_cmd_ready;
wire main_litedramnativeport1_cmd_first;
wire main_litedramnativeport1_cmd_last;
wire main_litedramnativeport1_cmd_payload_we;
wire [23:0] main_litedramnativeport1_cmd_payload_addr;
wire main_litedramnativeport1_wdata_valid;
wire main_litedramnativeport1_wdata_ready;
wire main_litedramnativeport1_wdata_first;
wire main_litedramnativeport1_wdata_last;
wire [127:0] main_litedramnativeport1_wdata_payload_data;
wire [15:0] main_litedramnativeport1_wdata_payload_we;
wire main_litedramnativeport1_rdata_valid;
wire main_litedramnativeport1_rdata_ready;
reg main_litedramnativeport1_rdata_first = 1'd0;
reg main_litedramnativeport1_rdata_last = 1'd0;
wire [127:0] main_litedramnativeport1_rdata_payload_data;
reg builder_state = 1'd0;
reg builder_next_state = 1'd0;
wire builder_pll_fb;
reg [1:0] builder_refresher_state = 2'd0;
reg [1:0] builder_refresher_next_state = 2'd0;
reg [3:0] builder_bankmachine0_state = 4'd0;
reg [3:0] builder_bankmachine0_next_state = 4'd0;
reg [3:0] builder_bankmachine1_state = 4'd0;
reg [3:0] builder_bankmachine1_next_state = 4'd0;
reg [3:0] builder_bankmachine2_state = 4'd0;
reg [3:0] builder_bankmachine2_next_state = 4'd0;
reg [3:0] builder_bankmachine3_state = 4'd0;
reg [3:0] builder_bankmachine3_next_state = 4'd0;
reg [3:0] builder_bankmachine4_state = 4'd0;
reg [3:0] builder_bankmachine4_next_state = 4'd0;
reg [3:0] builder_bankmachine5_state = 4'd0;
reg [3:0] builder_bankmachine5_next_state = 4'd0;
reg [3:0] builder_bankmachine6_state = 4'd0;
reg [3:0] builder_bankmachine6_next_state = 4'd0;
reg [3:0] builder_bankmachine7_state = 4'd0;
reg [3:0] builder_bankmachine7_next_state = 4'd0;
reg [3:0] builder_multiplexer_state = 4'd0;
reg [3:0] builder_multiplexer_next_state = 4'd0;
wire [1:0] builder_roundrobin0_request;
reg builder_roundrobin0_grant = 1'd0;
wire builder_roundrobin0_ce;
wire [1:0] builder_roundrobin1_request;
reg builder_roundrobin1_grant = 1'd0;
wire builder_roundrobin1_ce;
wire [1:0] builder_roundrobin2_request;
reg builder_roundrobin2_grant = 1'd0;
wire builder_roundrobin2_ce;
wire [1:0] builder_roundrobin3_request;
reg builder_roundrobin3_grant = 1'd0;
wire builder_roundrobin3_ce;
wire [1:0] builder_roundrobin4_request;
reg builder_roundrobin4_grant = 1'd0;
wire builder_roundrobin4_ce;
wire [1:0] builder_roundrobin5_request;
reg builder_roundrobin5_grant = 1'd0;
wire builder_roundrobin5_ce;
wire [1:0] builder_roundrobin6_request;
reg builder_roundrobin6_grant = 1'd0;
wire builder_roundrobin6_ce;
wire [1:0] builder_roundrobin7_request;
reg builder_roundrobin7_grant = 1'd0;
wire builder_roundrobin7_ce;
reg builder_locked0 = 1'd0;
reg builder_locked1 = 1'd0;
reg builder_locked2 = 1'd0;
reg builder_locked3 = 1'd0;
reg builder_locked4 = 1'd0;
reg builder_locked5 = 1'd0;
reg builder_locked6 = 1'd0;
reg builder_locked7 = 1'd0;
reg builder_locked8 = 1'd0;
reg builder_locked9 = 1'd0;
reg builder_locked10 = 1'd0;
reg builder_locked11 = 1'd0;
reg builder_locked12 = 1'd0;
reg builder_locked13 = 1'd0;
reg builder_locked14 = 1'd0;
reg builder_locked15 = 1'd0;
reg builder_new_master_wdata_ready0 = 1'd0;
reg builder_new_master_wdata_ready1 = 1'd0;
reg builder_new_master_wdata_ready2 = 1'd0;
reg builder_new_master_wdata_ready3 = 1'd0;
reg builder_new_master_wdata_ready4 = 1'd0;
reg builder_new_master_wdata_ready5 = 1'd0;
reg builder_new_master_rdata_valid0 = 1'd0;
reg builder_new_master_rdata_valid1 = 1'd0;
reg builder_new_master_rdata_valid2 = 1'd0;
reg builder_new_master_rdata_valid3 = 1'd0;
reg builder_new_master_rdata_valid4 = 1'd0;
reg builder_new_master_rdata_valid5 = 1'd0;
reg builder_new_master_rdata_valid6 = 1'd0;
reg builder_new_master_rdata_valid7 = 1'd0;
reg builder_new_master_rdata_valid8 = 1'd0;
reg builder_new_master_rdata_valid9 = 1'd0;
reg builder_new_master_rdata_valid10 = 1'd0;
reg builder_new_master_rdata_valid11 = 1'd0;
reg builder_new_master_rdata_valid12 = 1'd0;
reg builder_new_master_rdata_valid13 = 1'd0;
reg builder_new_master_rdata_valid14 = 1'd0;
reg builder_new_master_rdata_valid15 = 1'd0;
wire [29:0] builder_shared_adr;
wire [31:0] builder_shared_dat_w;
reg [31:0] builder_shared_dat_r = 32'd0;
wire [3:0] builder_shared_sel;
wire builder_shared_cyc;
wire builder_shared_stb;
reg builder_shared_ack = 1'd0;
wire builder_shared_we;
wire [2:0] builder_shared_cti;
wire [1:0] builder_shared_bte;
wire builder_shared_err;
wire builder_request;
wire builder_grant;
reg [3:0] builder_slave_sel = 4'd0;
reg [3:0] builder_slave_sel_r = 4'd0;
reg builder_error = 1'd0;
wire builder_wait;
wire builder_done;
reg [19:0] builder_count = 20'd1000000;
wire [13:0] builder_interface0_bank_bus_adr;
wire builder_interface0_bank_bus_we;
wire [7:0] builder_interface0_bank_bus_dat_w;
reg [7:0] builder_interface0_bank_bus_dat_r = 8'd0;
wire builder_csrbank0_reset0_re;
wire builder_csrbank0_reset0_r;
wire builder_csrbank0_reset0_we;
wire builder_csrbank0_reset0_w;
wire builder_csrbank0_scratch3_re;
wire [7:0] builder_csrbank0_scratch3_r;
wire builder_csrbank0_scratch3_we;
wire [7:0] builder_csrbank0_scratch3_w;
wire builder_csrbank0_scratch2_re;
wire [7:0] builder_csrbank0_scratch2_r;
wire builder_csrbank0_scratch2_we;
wire [7:0] builder_csrbank0_scratch2_w;
wire builder_csrbank0_scratch1_re;
wire [7:0] builder_csrbank0_scratch1_r;
wire builder_csrbank0_scratch1_we;
wire [7:0] builder_csrbank0_scratch1_w;
wire builder_csrbank0_scratch0_re;
wire [7:0] builder_csrbank0_scratch0_r;
wire builder_csrbank0_scratch0_we;
wire [7:0] builder_csrbank0_scratch0_w;
wire builder_csrbank0_bus_errors3_re;
wire [7:0] builder_csrbank0_bus_errors3_r;
wire builder_csrbank0_bus_errors3_we;
wire [7:0] builder_csrbank0_bus_errors3_w;
wire builder_csrbank0_bus_errors2_re;
wire [7:0] builder_csrbank0_bus_errors2_r;
wire builder_csrbank0_bus_errors2_we;
wire [7:0] builder_csrbank0_bus_errors2_w;
wire builder_csrbank0_bus_errors1_re;
wire [7:0] builder_csrbank0_bus_errors1_r;
wire builder_csrbank0_bus_errors1_we;
wire [7:0] builder_csrbank0_bus_errors1_w;
wire builder_csrbank0_bus_errors0_re;
wire [7:0] builder_csrbank0_bus_errors0_r;
wire builder_csrbank0_bus_errors0_we;
wire [7:0] builder_csrbank0_bus_errors0_w;
wire builder_csrbank0_sel;
wire [13:0] builder_interface1_bank_bus_adr;
wire builder_interface1_bank_bus_we;
wire [7:0] builder_interface1_bank_bus_dat_w;
reg [7:0] builder_interface1_bank_bus_dat_r = 8'd0;
wire builder_csrbank1_half_sys8x_taps0_re;
wire [4:0] builder_csrbank1_half_sys8x_taps0_r;
wire builder_csrbank1_half_sys8x_taps0_we;
wire [4:0] builder_csrbank1_half_sys8x_taps0_w;
wire builder_csrbank1_wlevel_en0_re;
wire builder_csrbank1_wlevel_en0_r;
wire builder_csrbank1_wlevel_en0_we;
wire builder_csrbank1_wlevel_en0_w;
wire builder_csrbank1_dly_sel0_re;
wire [1:0] builder_csrbank1_dly_sel0_r;
wire builder_csrbank1_dly_sel0_we;
wire [1:0] builder_csrbank1_dly_sel0_w;
wire builder_csrbank1_sel;
wire [13:0] builder_interface2_bank_bus_adr;
wire builder_interface2_bank_bus_we;
wire [7:0] builder_interface2_bank_bus_dat_w;
reg [7:0] builder_interface2_bank_bus_dat_r = 8'd0;
wire builder_csrbank2_dfii_control0_re;
wire [3:0] builder_csrbank2_dfii_control0_r;
wire builder_csrbank2_dfii_control0_we;
wire [3:0] builder_csrbank2_dfii_control0_w;
wire builder_csrbank2_dfii_pi0_command0_re;
wire [5:0] builder_csrbank2_dfii_pi0_command0_r;
wire builder_csrbank2_dfii_pi0_command0_we;
wire [5:0] builder_csrbank2_dfii_pi0_command0_w;
wire builder_csrbank2_dfii_pi0_address1_re;
wire [5:0] builder_csrbank2_dfii_pi0_address1_r;
wire builder_csrbank2_dfii_pi0_address1_we;
wire [5:0] builder_csrbank2_dfii_pi0_address1_w;
wire builder_csrbank2_dfii_pi0_address0_re;
wire [7:0] builder_csrbank2_dfii_pi0_address0_r;
wire builder_csrbank2_dfii_pi0_address0_we;
wire [7:0] builder_csrbank2_dfii_pi0_address0_w;
wire builder_csrbank2_dfii_pi0_baddress0_re;
wire [2:0] builder_csrbank2_dfii_pi0_baddress0_r;
wire builder_csrbank2_dfii_pi0_baddress0_we;
wire [2:0] builder_csrbank2_dfii_pi0_baddress0_w;
wire builder_csrbank2_dfii_pi0_wrdata3_re;
wire [7:0] builder_csrbank2_dfii_pi0_wrdata3_r;
wire builder_csrbank2_dfii_pi0_wrdata3_we;
wire [7:0] builder_csrbank2_dfii_pi0_wrdata3_w;
wire builder_csrbank2_dfii_pi0_wrdata2_re;
wire [7:0] builder_csrbank2_dfii_pi0_wrdata2_r;
wire builder_csrbank2_dfii_pi0_wrdata2_we;
wire [7:0] builder_csrbank2_dfii_pi0_wrdata2_w;
wire builder_csrbank2_dfii_pi0_wrdata1_re;
wire [7:0] builder_csrbank2_dfii_pi0_wrdata1_r;
wire builder_csrbank2_dfii_pi0_wrdata1_we;
wire [7:0] builder_csrbank2_dfii_pi0_wrdata1_w;
wire builder_csrbank2_dfii_pi0_wrdata0_re;
wire [7:0] builder_csrbank2_dfii_pi0_wrdata0_r;
wire builder_csrbank2_dfii_pi0_wrdata0_we;
wire [7:0] builder_csrbank2_dfii_pi0_wrdata0_w;
wire builder_csrbank2_dfii_pi0_rddata3_re;
wire [7:0] builder_csrbank2_dfii_pi0_rddata3_r;
wire builder_csrbank2_dfii_pi0_rddata3_we;
wire [7:0] builder_csrbank2_dfii_pi0_rddata3_w;
wire builder_csrbank2_dfii_pi0_rddata2_re;
wire [7:0] builder_csrbank2_dfii_pi0_rddata2_r;
wire builder_csrbank2_dfii_pi0_rddata2_we;
wire [7:0] builder_csrbank2_dfii_pi0_rddata2_w;
wire builder_csrbank2_dfii_pi0_rddata1_re;
wire [7:0] builder_csrbank2_dfii_pi0_rddata1_r;
wire builder_csrbank2_dfii_pi0_rddata1_we;
wire [7:0] builder_csrbank2_dfii_pi0_rddata1_w;
wire builder_csrbank2_dfii_pi0_rddata0_re;
wire [7:0] builder_csrbank2_dfii_pi0_rddata0_r;
wire builder_csrbank2_dfii_pi0_rddata0_we;
wire [7:0] builder_csrbank2_dfii_pi0_rddata0_w;
wire builder_csrbank2_dfii_pi1_command0_re;
wire [5:0] builder_csrbank2_dfii_pi1_command0_r;
wire builder_csrbank2_dfii_pi1_command0_we;
wire [5:0] builder_csrbank2_dfii_pi1_command0_w;
wire builder_csrbank2_dfii_pi1_address1_re;
wire [5:0] builder_csrbank2_dfii_pi1_address1_r;
wire builder_csrbank2_dfii_pi1_address1_we;
wire [5:0] builder_csrbank2_dfii_pi1_address1_w;
wire builder_csrbank2_dfii_pi1_address0_re;
wire [7:0] builder_csrbank2_dfii_pi1_address0_r;
wire builder_csrbank2_dfii_pi1_address0_we;
wire [7:0] builder_csrbank2_dfii_pi1_address0_w;
wire builder_csrbank2_dfii_pi1_baddress0_re;
wire [2:0] builder_csrbank2_dfii_pi1_baddress0_r;
wire builder_csrbank2_dfii_pi1_baddress0_we;
wire [2:0] builder_csrbank2_dfii_pi1_baddress0_w;
wire builder_csrbank2_dfii_pi1_wrdata3_re;
wire [7:0] builder_csrbank2_dfii_pi1_wrdata3_r;
wire builder_csrbank2_dfii_pi1_wrdata3_we;
wire [7:0] builder_csrbank2_dfii_pi1_wrdata3_w;
wire builder_csrbank2_dfii_pi1_wrdata2_re;
wire [7:0] builder_csrbank2_dfii_pi1_wrdata2_r;
wire builder_csrbank2_dfii_pi1_wrdata2_we;
wire [7:0] builder_csrbank2_dfii_pi1_wrdata2_w;
wire builder_csrbank2_dfii_pi1_wrdata1_re;
wire [7:0] builder_csrbank2_dfii_pi1_wrdata1_r;
wire builder_csrbank2_dfii_pi1_wrdata1_we;
wire [7:0] builder_csrbank2_dfii_pi1_wrdata1_w;
wire builder_csrbank2_dfii_pi1_wrdata0_re;
wire [7:0] builder_csrbank2_dfii_pi1_wrdata0_r;
wire builder_csrbank2_dfii_pi1_wrdata0_we;
wire [7:0] builder_csrbank2_dfii_pi1_wrdata0_w;
wire builder_csrbank2_dfii_pi1_rddata3_re;
wire [7:0] builder_csrbank2_dfii_pi1_rddata3_r;
wire builder_csrbank2_dfii_pi1_rddata3_we;
wire [7:0] builder_csrbank2_dfii_pi1_rddata3_w;
wire builder_csrbank2_dfii_pi1_rddata2_re;
wire [7:0] builder_csrbank2_dfii_pi1_rddata2_r;
wire builder_csrbank2_dfii_pi1_rddata2_we;
wire [7:0] builder_csrbank2_dfii_pi1_rddata2_w;
wire builder_csrbank2_dfii_pi1_rddata1_re;
wire [7:0] builder_csrbank2_dfii_pi1_rddata1_r;
wire builder_csrbank2_dfii_pi1_rddata1_we;
wire [7:0] builder_csrbank2_dfii_pi1_rddata1_w;
wire builder_csrbank2_dfii_pi1_rddata0_re;
wire [7:0] builder_csrbank2_dfii_pi1_rddata0_r;
wire builder_csrbank2_dfii_pi1_rddata0_we;
wire [7:0] builder_csrbank2_dfii_pi1_rddata0_w;
wire builder_csrbank2_dfii_pi2_command0_re;
wire [5:0] builder_csrbank2_dfii_pi2_command0_r;
wire builder_csrbank2_dfii_pi2_command0_we;
wire [5:0] builder_csrbank2_dfii_pi2_command0_w;
wire builder_csrbank2_dfii_pi2_address1_re;
wire [5:0] builder_csrbank2_dfii_pi2_address1_r;
wire builder_csrbank2_dfii_pi2_address1_we;
wire [5:0] builder_csrbank2_dfii_pi2_address1_w;
wire builder_csrbank2_dfii_pi2_address0_re;
wire [7:0] builder_csrbank2_dfii_pi2_address0_r;
wire builder_csrbank2_dfii_pi2_address0_we;
wire [7:0] builder_csrbank2_dfii_pi2_address0_w;
wire builder_csrbank2_dfii_pi2_baddress0_re;
wire [2:0] builder_csrbank2_dfii_pi2_baddress0_r;
wire builder_csrbank2_dfii_pi2_baddress0_we;
wire [2:0] builder_csrbank2_dfii_pi2_baddress0_w;
wire builder_csrbank2_dfii_pi2_wrdata3_re;
wire [7:0] builder_csrbank2_dfii_pi2_wrdata3_r;
wire builder_csrbank2_dfii_pi2_wrdata3_we;
wire [7:0] builder_csrbank2_dfii_pi2_wrdata3_w;
wire builder_csrbank2_dfii_pi2_wrdata2_re;
wire [7:0] builder_csrbank2_dfii_pi2_wrdata2_r;
wire builder_csrbank2_dfii_pi2_wrdata2_we;
wire [7:0] builder_csrbank2_dfii_pi2_wrdata2_w;
wire builder_csrbank2_dfii_pi2_wrdata1_re;
wire [7:0] builder_csrbank2_dfii_pi2_wrdata1_r;
wire builder_csrbank2_dfii_pi2_wrdata1_we;
wire [7:0] builder_csrbank2_dfii_pi2_wrdata1_w;
wire builder_csrbank2_dfii_pi2_wrdata0_re;
wire [7:0] builder_csrbank2_dfii_pi2_wrdata0_r;
wire builder_csrbank2_dfii_pi2_wrdata0_we;
wire [7:0] builder_csrbank2_dfii_pi2_wrdata0_w;
wire builder_csrbank2_dfii_pi2_rddata3_re;
wire [7:0] builder_csrbank2_dfii_pi2_rddata3_r;
wire builder_csrbank2_dfii_pi2_rddata3_we;
wire [7:0] builder_csrbank2_dfii_pi2_rddata3_w;
wire builder_csrbank2_dfii_pi2_rddata2_re;
wire [7:0] builder_csrbank2_dfii_pi2_rddata2_r;
wire builder_csrbank2_dfii_pi2_rddata2_we;
wire [7:0] builder_csrbank2_dfii_pi2_rddata2_w;
wire builder_csrbank2_dfii_pi2_rddata1_re;
wire [7:0] builder_csrbank2_dfii_pi2_rddata1_r;
wire builder_csrbank2_dfii_pi2_rddata1_we;
wire [7:0] builder_csrbank2_dfii_pi2_rddata1_w;
wire builder_csrbank2_dfii_pi2_rddata0_re;
wire [7:0] builder_csrbank2_dfii_pi2_rddata0_r;
wire builder_csrbank2_dfii_pi2_rddata0_we;
wire [7:0] builder_csrbank2_dfii_pi2_rddata0_w;
wire builder_csrbank2_dfii_pi3_command0_re;
wire [5:0] builder_csrbank2_dfii_pi3_command0_r;
wire builder_csrbank2_dfii_pi3_command0_we;
wire [5:0] builder_csrbank2_dfii_pi3_command0_w;
wire builder_csrbank2_dfii_pi3_address1_re;
wire [5:0] builder_csrbank2_dfii_pi3_address1_r;
wire builder_csrbank2_dfii_pi3_address1_we;
wire [5:0] builder_csrbank2_dfii_pi3_address1_w;
wire builder_csrbank2_dfii_pi3_address0_re;
wire [7:0] builder_csrbank2_dfii_pi3_address0_r;
wire builder_csrbank2_dfii_pi3_address0_we;
wire [7:0] builder_csrbank2_dfii_pi3_address0_w;
wire builder_csrbank2_dfii_pi3_baddress0_re;
wire [2:0] builder_csrbank2_dfii_pi3_baddress0_r;
wire builder_csrbank2_dfii_pi3_baddress0_we;
wire [2:0] builder_csrbank2_dfii_pi3_baddress0_w;
wire builder_csrbank2_dfii_pi3_wrdata3_re;
wire [7:0] builder_csrbank2_dfii_pi3_wrdata3_r;
wire builder_csrbank2_dfii_pi3_wrdata3_we;
wire [7:0] builder_csrbank2_dfii_pi3_wrdata3_w;
wire builder_csrbank2_dfii_pi3_wrdata2_re;
wire [7:0] builder_csrbank2_dfii_pi3_wrdata2_r;
wire builder_csrbank2_dfii_pi3_wrdata2_we;
wire [7:0] builder_csrbank2_dfii_pi3_wrdata2_w;
wire builder_csrbank2_dfii_pi3_wrdata1_re;
wire [7:0] builder_csrbank2_dfii_pi3_wrdata1_r;
wire builder_csrbank2_dfii_pi3_wrdata1_we;
wire [7:0] builder_csrbank2_dfii_pi3_wrdata1_w;
wire builder_csrbank2_dfii_pi3_wrdata0_re;
wire [7:0] builder_csrbank2_dfii_pi3_wrdata0_r;
wire builder_csrbank2_dfii_pi3_wrdata0_we;
wire [7:0] builder_csrbank2_dfii_pi3_wrdata0_w;
wire builder_csrbank2_dfii_pi3_rddata3_re;
wire [7:0] builder_csrbank2_dfii_pi3_rddata3_r;
wire builder_csrbank2_dfii_pi3_rddata3_we;
wire [7:0] builder_csrbank2_dfii_pi3_rddata3_w;
wire builder_csrbank2_dfii_pi3_rddata2_re;
wire [7:0] builder_csrbank2_dfii_pi3_rddata2_r;
wire builder_csrbank2_dfii_pi3_rddata2_we;
wire [7:0] builder_csrbank2_dfii_pi3_rddata2_w;
wire builder_csrbank2_dfii_pi3_rddata1_re;
wire [7:0] builder_csrbank2_dfii_pi3_rddata1_r;
wire builder_csrbank2_dfii_pi3_rddata1_we;
wire [7:0] builder_csrbank2_dfii_pi3_rddata1_w;
wire builder_csrbank2_dfii_pi3_rddata0_re;
wire [7:0] builder_csrbank2_dfii_pi3_rddata0_r;
wire builder_csrbank2_dfii_pi3_rddata0_we;
wire [7:0] builder_csrbank2_dfii_pi3_rddata0_w;
wire builder_csrbank2_sel;
wire [13:0] builder_interface3_bank_bus_adr;
wire builder_interface3_bank_bus_we;
wire [7:0] builder_interface3_bank_bus_dat_w;
reg [7:0] builder_interface3_bank_bus_dat_r = 8'd0;
wire builder_csrbank3_load3_re;
wire [7:0] builder_csrbank3_load3_r;
wire builder_csrbank3_load3_we;
wire [7:0] builder_csrbank3_load3_w;
wire builder_csrbank3_load2_re;
wire [7:0] builder_csrbank3_load2_r;
wire builder_csrbank3_load2_we;
wire [7:0] builder_csrbank3_load2_w;
wire builder_csrbank3_load1_re;
wire [7:0] builder_csrbank3_load1_r;
wire builder_csrbank3_load1_we;
wire [7:0] builder_csrbank3_load1_w;
wire builder_csrbank3_load0_re;
wire [7:0] builder_csrbank3_load0_r;
wire builder_csrbank3_load0_we;
wire [7:0] builder_csrbank3_load0_w;
wire builder_csrbank3_reload3_re;
wire [7:0] builder_csrbank3_reload3_r;
wire builder_csrbank3_reload3_we;
wire [7:0] builder_csrbank3_reload3_w;
wire builder_csrbank3_reload2_re;
wire [7:0] builder_csrbank3_reload2_r;
wire builder_csrbank3_reload2_we;
wire [7:0] builder_csrbank3_reload2_w;
wire builder_csrbank3_reload1_re;
wire [7:0] builder_csrbank3_reload1_r;
wire builder_csrbank3_reload1_we;
wire [7:0] builder_csrbank3_reload1_w;
wire builder_csrbank3_reload0_re;
wire [7:0] builder_csrbank3_reload0_r;
wire builder_csrbank3_reload0_we;
wire [7:0] builder_csrbank3_reload0_w;
wire builder_csrbank3_en0_re;
wire builder_csrbank3_en0_r;
wire builder_csrbank3_en0_we;
wire builder_csrbank3_en0_w;
wire builder_csrbank3_update_value0_re;
wire builder_csrbank3_update_value0_r;
wire builder_csrbank3_update_value0_we;
wire builder_csrbank3_update_value0_w;
wire builder_csrbank3_value3_re;
wire [7:0] builder_csrbank3_value3_r;
wire builder_csrbank3_value3_we;
wire [7:0] builder_csrbank3_value3_w;
wire builder_csrbank3_value2_re;
wire [7:0] builder_csrbank3_value2_r;
wire builder_csrbank3_value2_we;
wire [7:0] builder_csrbank3_value2_w;
wire builder_csrbank3_value1_re;
wire [7:0] builder_csrbank3_value1_r;
wire builder_csrbank3_value1_we;
wire [7:0] builder_csrbank3_value1_w;
wire builder_csrbank3_value0_re;
wire [7:0] builder_csrbank3_value0_r;
wire builder_csrbank3_value0_we;
wire [7:0] builder_csrbank3_value0_w;
wire builder_csrbank3_ev_enable0_re;
wire builder_csrbank3_ev_enable0_r;
wire builder_csrbank3_ev_enable0_we;
wire builder_csrbank3_ev_enable0_w;
wire builder_csrbank3_sel;
wire [13:0] builder_interface4_bank_bus_adr;
wire builder_interface4_bank_bus_we;
wire [7:0] builder_interface4_bank_bus_dat_w;
reg [7:0] builder_interface4_bank_bus_dat_r = 8'd0;
wire builder_csrbank4_txfull_re;
wire builder_csrbank4_txfull_r;
wire builder_csrbank4_txfull_we;
wire builder_csrbank4_txfull_w;
wire builder_csrbank4_rxempty_re;
wire builder_csrbank4_rxempty_r;
wire builder_csrbank4_rxempty_we;
wire builder_csrbank4_rxempty_w;
wire builder_csrbank4_ev_enable0_re;
wire [1:0] builder_csrbank4_ev_enable0_r;
wire builder_csrbank4_ev_enable0_we;
wire [1:0] builder_csrbank4_ev_enable0_w;
wire builder_csrbank4_sel;
wire [13:0] builder_interface5_bank_bus_adr;
wire builder_interface5_bank_bus_we;
wire [7:0] builder_interface5_bank_bus_dat_w;
reg [7:0] builder_interface5_bank_bus_dat_r = 8'd0;
wire builder_csrbank5_tuning_word3_re;
wire [7:0] builder_csrbank5_tuning_word3_r;
wire builder_csrbank5_tuning_word3_we;
wire [7:0] builder_csrbank5_tuning_word3_w;
wire builder_csrbank5_tuning_word2_re;
wire [7:0] builder_csrbank5_tuning_word2_r;
wire builder_csrbank5_tuning_word2_we;
wire [7:0] builder_csrbank5_tuning_word2_w;
wire builder_csrbank5_tuning_word1_re;
wire [7:0] builder_csrbank5_tuning_word1_r;
wire builder_csrbank5_tuning_word1_we;
wire [7:0] builder_csrbank5_tuning_word1_w;
wire builder_csrbank5_tuning_word0_re;
wire [7:0] builder_csrbank5_tuning_word0_r;
wire builder_csrbank5_tuning_word0_we;
wire [7:0] builder_csrbank5_tuning_word0_w;
wire builder_csrbank5_sel;
wire [13:0] builder_adr;
wire builder_we;
wire [7:0] builder_dat_w;
wire [7:0] builder_dat_r;
reg builder_rhs_array_muxed0 = 1'd0;
reg [13:0] builder_rhs_array_muxed1 = 14'd0;
reg [2:0] builder_rhs_array_muxed2 = 3'd0;
reg builder_rhs_array_muxed3 = 1'd0;
reg builder_rhs_array_muxed4 = 1'd0;
reg builder_rhs_array_muxed5 = 1'd0;
reg builder_t_array_muxed0 = 1'd0;
reg builder_t_array_muxed1 = 1'd0;
reg builder_t_array_muxed2 = 1'd0;
reg builder_rhs_array_muxed6 = 1'd0;
reg [13:0] builder_rhs_array_muxed7 = 14'd0;
reg [2:0] builder_rhs_array_muxed8 = 3'd0;
reg builder_rhs_array_muxed9 = 1'd0;
reg builder_rhs_array_muxed10 = 1'd0;
reg builder_rhs_array_muxed11 = 1'd0;
reg builder_t_array_muxed3 = 1'd0;
reg builder_t_array_muxed4 = 1'd0;
reg builder_t_array_muxed5 = 1'd0;
reg [20:0] builder_rhs_array_muxed12 = 21'd0;
reg builder_rhs_array_muxed13 = 1'd0;
reg builder_rhs_array_muxed14 = 1'd0;
reg [20:0] builder_rhs_array_muxed15 = 21'd0;
reg builder_rhs_array_muxed16 = 1'd0;
reg builder_rhs_array_muxed17 = 1'd0;
reg [20:0] builder_rhs_array_muxed18 = 21'd0;
reg builder_rhs_array_muxed19 = 1'd0;
reg builder_rhs_array_muxed20 = 1'd0;
reg [20:0] builder_rhs_array_muxed21 = 21'd0;
reg builder_rhs_array_muxed22 = 1'd0;
reg builder_rhs_array_muxed23 = 1'd0;
reg [20:0] builder_rhs_array_muxed24 = 21'd0;
reg builder_rhs_array_muxed25 = 1'd0;
reg builder_rhs_array_muxed26 = 1'd0;
reg [20:0] builder_rhs_array_muxed27 = 21'd0;
reg builder_rhs_array_muxed28 = 1'd0;
reg builder_rhs_array_muxed29 = 1'd0;
reg [20:0] builder_rhs_array_muxed30 = 21'd0;
reg builder_rhs_array_muxed31 = 1'd0;
reg builder_rhs_array_muxed32 = 1'd0;
reg [20:0] builder_rhs_array_muxed33 = 21'd0;
reg builder_rhs_array_muxed34 = 1'd0;
reg builder_rhs_array_muxed35 = 1'd0;
reg [29:0] builder_rhs_array_muxed36 = 30'd0;
reg [31:0] builder_rhs_array_muxed37 = 32'd0;
reg [3:0] builder_rhs_array_muxed38 = 4'd0;
reg builder_rhs_array_muxed39 = 1'd0;
reg builder_rhs_array_muxed40 = 1'd0;
reg builder_rhs_array_muxed41 = 1'd0;
reg [2:0] builder_rhs_array_muxed42 = 3'd0;
reg [1:0] builder_rhs_array_muxed43 = 2'd0;
reg [2:0] builder_array_muxed0 = 3'd0;
reg [13:0] builder_array_muxed1 = 14'd0;
reg builder_array_muxed2 = 1'd0;
reg builder_array_muxed3 = 1'd0;
reg builder_array_muxed4 = 1'd0;
reg builder_array_muxed5 = 1'd0;
reg builder_array_muxed6 = 1'd0;
reg [2:0] builder_array_muxed7 = 3'd0;
reg [13:0] builder_array_muxed8 = 14'd0;
reg builder_array_muxed9 = 1'd0;
reg builder_array_muxed10 = 1'd0;
reg builder_array_muxed11 = 1'd0;
reg builder_array_muxed12 = 1'd0;
reg builder_array_muxed13 = 1'd0;
reg [2:0] builder_array_muxed14 = 3'd0;
reg [13:0] builder_array_muxed15 = 14'd0;
reg builder_array_muxed16 = 1'd0;
reg builder_array_muxed17 = 1'd0;
reg builder_array_muxed18 = 1'd0;
reg builder_array_muxed19 = 1'd0;
reg builder_array_muxed20 = 1'd0;
reg [2:0] builder_array_muxed21 = 3'd0;
reg [13:0] builder_array_muxed22 = 14'd0;
reg builder_array_muxed23 = 1'd0;
reg builder_array_muxed24 = 1'd0;
reg builder_array_muxed25 = 1'd0;
reg builder_array_muxed26 = 1'd0;
reg builder_array_muxed27 = 1'd0;
(* async_reg = "true", mr_ff = "true", dont_touch = "true" *) reg builder_regs0 = 1'd0;
(* async_reg = "true", dont_touch = "true" *) reg builder_regs1 = 1'd0;
wire builder_xilinxasyncresetsynchronizerimpl0;
wire builder_xilinxasyncresetsynchronizerimpl0_rst_meta;
wire builder_xilinxasyncresetsynchronizerimpl1;
wire builder_xilinxasyncresetsynchronizerimpl1_rst_meta;
wire builder_xilinxasyncresetsynchronizerimpl1_expr;
wire builder_xilinxasyncresetsynchronizerimpl2;
wire builder_xilinxasyncresetsynchronizerimpl2_rst_meta;
wire builder_xilinxasyncresetsynchronizerimpl2_expr;
wire builder_xilinxasyncresetsynchronizerimpl3;
wire builder_xilinxasyncresetsynchronizerimpl3_rst_meta;
wire builder_xilinxasyncresetsynchronizerimpl3_expr;
wire builder_xilinxasyncresetsynchronizerimpl4;
wire builder_xilinxasyncresetsynchronizerimpl4_rst_meta;
wire builder_xilinxasyncresetsynchronizerimpl5;
wire builder_xilinxasyncresetsynchronizerimpl5_rst_meta;
assign main_basesoc_vexriscvsmp_reset = main_basesoc_soccontroller_reset;
assign main_litedramnativeport0_cmd_valid = main_basesoc_vexriscvsmp_ibus_cmd_valid;
assign main_basesoc_vexriscvsmp_ibus_cmd_ready = main_litedramnativeport0_cmd_ready;
assign main_litedramnativeport0_cmd_first = main_basesoc_vexriscvsmp_ibus_cmd_first;
assign main_litedramnativeport0_cmd_last = main_basesoc_vexriscvsmp_ibus_cmd_last;
assign main_litedramnativeport0_cmd_payload_we = main_basesoc_vexriscvsmp_ibus_cmd_payload_we;
assign main_litedramnativeport0_cmd_payload_addr = main_basesoc_vexriscvsmp_ibus_cmd_payload_addr;
assign main_litedramnativeport0_wdata_valid = main_basesoc_vexriscvsmp_ibus_wdata_valid;
assign main_basesoc_vexriscvsmp_ibus_wdata_ready = main_litedramnativeport0_wdata_ready;
assign main_litedramnativeport0_wdata_first = main_basesoc_vexriscvsmp_ibus_wdata_first;
assign main_litedramnativeport0_wdata_last = main_basesoc_vexriscvsmp_ibus_wdata_last;
assign main_litedramnativeport0_wdata_payload_data = main_basesoc_vexriscvsmp_ibus_wdata_payload_data;
assign main_litedramnativeport0_wdata_payload_we = main_basesoc_vexriscvsmp_ibus_wdata_payload_we;
assign main_basesoc_vexriscvsmp_ibus_rdata_valid = main_litedramnativeport0_rdata_valid;
assign main_litedramnativeport0_rdata_ready = main_basesoc_vexriscvsmp_ibus_rdata_ready;
assign main_basesoc_vexriscvsmp_ibus_rdata_first = main_litedramnativeport0_rdata_first;
assign main_basesoc_vexriscvsmp_ibus_rdata_last = main_litedramnativeport0_rdata_last;
assign main_basesoc_vexriscvsmp_ibus_rdata_payload_data = main_litedramnativeport0_rdata_payload_data;
assign main_litedramnativeport1_cmd_valid = main_basesoc_vexriscvsmp_dbus_cmd_valid;
assign main_basesoc_vexriscvsmp_dbus_cmd_ready = main_litedramnativeport1_cmd_ready;
assign main_litedramnativeport1_cmd_first = main_basesoc_vexriscvsmp_dbus_cmd_first;
assign main_litedramnativeport1_cmd_last = main_basesoc_vexriscvsmp_dbus_cmd_last;
assign main_litedramnativeport1_cmd_payload_we = main_basesoc_vexriscvsmp_dbus_cmd_payload_we;
assign main_litedramnativeport1_cmd_payload_addr = main_basesoc_vexriscvsmp_dbus_cmd_payload_addr;
assign main_litedramnativeport1_wdata_valid = main_basesoc_vexriscvsmp_dbus_wdata_valid;
assign main_basesoc_vexriscvsmp_dbus_wdata_ready = main_litedramnativeport1_wdata_ready;
assign main_litedramnativeport1_wdata_first = main_basesoc_vexriscvsmp_dbus_wdata_first;
assign main_litedramnativeport1_wdata_last = main_basesoc_vexriscvsmp_dbus_wdata_last;
assign main_litedramnativeport1_wdata_payload_data = main_basesoc_vexriscvsmp_dbus_wdata_payload_data;
assign main_litedramnativeport1_wdata_payload_we = main_basesoc_vexriscvsmp_dbus_wdata_payload_we;
assign main_basesoc_vexriscvsmp_dbus_rdata_valid = main_litedramnativeport1_rdata_valid;
assign main_litedramnativeport1_rdata_ready = main_basesoc_vexriscvsmp_dbus_rdata_ready;
assign main_basesoc_vexriscvsmp_dbus_rdata_first = main_litedramnativeport1_rdata_first;
assign main_basesoc_vexriscvsmp_dbus_rdata_last = main_litedramnativeport1_rdata_last;
assign main_basesoc_vexriscvsmp_dbus_rdata_payload_data = main_litedramnativeport1_rdata_payload_data;
assign main_basesoc_soccontroller_bus_error = builder_error;
assign main_basesoc_soccontroller_reset = main_basesoc_soccontroller_reset_re;
assign main_basesoc_soccontroller_bus_errors_status = main_basesoc_soccontroller_bus_errors;
assign main_basesoc_basesoc_adr = main_basesoc_basesoc_ram_bus_adr[12:0];
assign main_basesoc_basesoc_ram_bus_dat_r = main_basesoc_basesoc_dat_r;
always @(*) begin
	main_basesoc_ram_we <= 4'd0;
	main_basesoc_ram_we[0] <= (((main_basesoc_ram_bus_ram_bus_cyc & main_basesoc_ram_bus_ram_bus_stb) & main_basesoc_ram_bus_ram_bus_we) & main_basesoc_ram_bus_ram_bus_sel[0]);
	main_basesoc_ram_we[1] <= (((main_basesoc_ram_bus_ram_bus_cyc & main_basesoc_ram_bus_ram_bus_stb) & main_basesoc_ram_bus_ram_bus_we) & main_basesoc_ram_bus_ram_bus_sel[1]);
	main_basesoc_ram_we[2] <= (((main_basesoc_ram_bus_ram_bus_cyc & main_basesoc_ram_bus_ram_bus_stb) & main_basesoc_ram_bus_ram_bus_we) & main_basesoc_ram_bus_ram_bus_sel[2]);
	main_basesoc_ram_we[3] <= (((main_basesoc_ram_bus_ram_bus_cyc & main_basesoc_ram_bus_ram_bus_stb) & main_basesoc_ram_bus_ram_bus_we) & main_basesoc_ram_bus_ram_bus_sel[3]);
end
assign main_basesoc_ram_adr = main_basesoc_ram_bus_ram_bus_adr[9:0];
assign main_basesoc_ram_bus_ram_bus_dat_r = main_basesoc_ram_dat_r;
assign main_basesoc_ram_dat_w = main_basesoc_ram_bus_ram_bus_dat_w;
assign main_basesoc_uart_uart_sink_valid = main_basesoc_source_valid;
assign main_basesoc_source_ready = main_basesoc_uart_uart_sink_ready;
assign main_basesoc_uart_uart_sink_first = main_basesoc_source_first;
assign main_basesoc_uart_uart_sink_last = main_basesoc_source_last;
assign main_basesoc_uart_uart_sink_payload_data = main_basesoc_source_payload_data;
assign main_basesoc_sink_valid = main_basesoc_uart_uart_source_valid;
assign main_basesoc_uart_uart_source_ready = main_basesoc_sink_ready;
assign main_basesoc_sink_first = main_basesoc_uart_uart_source_first;
assign main_basesoc_sink_last = main_basesoc_uart_uart_source_last;
assign main_basesoc_sink_payload_data = main_basesoc_uart_uart_source_payload_data;
assign main_basesoc_uart_tx_fifo_sink_valid = main_basesoc_uart_rxtx_re;
assign main_basesoc_uart_tx_fifo_sink_payload_data = main_basesoc_uart_rxtx_r;
assign main_basesoc_uart_txfull_status = (~main_basesoc_uart_tx_fifo_sink_ready);
assign main_basesoc_uart_uart_source_valid = main_basesoc_uart_tx_fifo_source_valid;
assign main_basesoc_uart_tx_fifo_source_ready = main_basesoc_uart_uart_source_ready;
assign main_basesoc_uart_uart_source_first = main_basesoc_uart_tx_fifo_source_first;
assign main_basesoc_uart_uart_source_last = main_basesoc_uart_tx_fifo_source_last;
assign main_basesoc_uart_uart_source_payload_data = main_basesoc_uart_tx_fifo_source_payload_data;
assign main_basesoc_uart_tx_trigger = (~main_basesoc_uart_tx_fifo_sink_ready);
assign main_basesoc_uart_rx_fifo_sink_valid = main_basesoc_uart_uart_sink_valid;
assign main_basesoc_uart_uart_sink_ready = main_basesoc_uart_rx_fifo_sink_ready;
assign main_basesoc_uart_rx_fifo_sink_first = main_basesoc_uart_uart_sink_first;
assign main_basesoc_uart_rx_fifo_sink_last = main_basesoc_uart_uart_sink_last;
assign main_basesoc_uart_rx_fifo_sink_payload_data = main_basesoc_uart_uart_sink_payload_data;
assign main_basesoc_uart_rxempty_status = (~main_basesoc_uart_rx_fifo_source_valid);
assign main_basesoc_uart_rxtx_w = main_basesoc_uart_rx_fifo_source_payload_data;
assign main_basesoc_uart_rx_fifo_source_ready = (main_basesoc_uart_rx_clear | (1'd0 & main_basesoc_uart_rxtx_we));
assign main_basesoc_uart_rx_trigger = (~main_basesoc_uart_rx_fifo_source_valid);
always @(*) begin
	main_basesoc_uart_tx_clear <= 1'd0;
	if ((main_basesoc_uart_eventmanager_pending_re & main_basesoc_uart_eventmanager_pending_r[0])) begin
		main_basesoc_uart_tx_clear <= 1'd1;
	end
end
always @(*) begin
	main_basesoc_uart_eventmanager_status_w <= 2'd0;
	main_basesoc_uart_eventmanager_status_w[0] <= main_basesoc_uart_tx_status;
	main_basesoc_uart_eventmanager_status_w[1] <= main_basesoc_uart_rx_status;
end
always @(*) begin
	main_basesoc_uart_rx_clear <= 1'd0;
	if ((main_basesoc_uart_eventmanager_pending_re & main_basesoc_uart_eventmanager_pending_r[1])) begin
		main_basesoc_uart_rx_clear <= 1'd1;
	end
end
always @(*) begin
	main_basesoc_uart_eventmanager_pending_w <= 2'd0;
	main_basesoc_uart_eventmanager_pending_w[0] <= main_basesoc_uart_tx_pending;
	main_basesoc_uart_eventmanager_pending_w[1] <= main_basesoc_uart_rx_pending;
end
assign main_basesoc_uart_irq = ((main_basesoc_uart_eventmanager_pending_w[0] & main_basesoc_uart_eventmanager_storage[0]) | (main_basesoc_uart_eventmanager_pending_w[1] & main_basesoc_uart_eventmanager_storage[1]));
assign main_basesoc_uart_tx_status = main_basesoc_uart_tx_trigger;
assign main_basesoc_uart_rx_status = main_basesoc_uart_rx_trigger;
assign main_basesoc_uart_tx_fifo_syncfifo_din = {main_basesoc_uart_tx_fifo_fifo_in_last, main_basesoc_uart_tx_fifo_fifo_in_first, main_basesoc_uart_tx_fifo_fifo_in_payload_data};
assign {main_basesoc_uart_tx_fifo_fifo_out_last, main_basesoc_uart_tx_fifo_fifo_out_first, main_basesoc_uart_tx_fifo_fifo_out_payload_data} = main_basesoc_uart_tx_fifo_syncfifo_dout;
assign main_basesoc_uart_tx_fifo_sink_ready = main_basesoc_uart_tx_fifo_syncfifo_writable;
assign main_basesoc_uart_tx_fifo_syncfifo_we = main_basesoc_uart_tx_fifo_sink_valid;
assign main_basesoc_uart_tx_fifo_fifo_in_first = main_basesoc_uart_tx_fifo_sink_first;
assign main_basesoc_uart_tx_fifo_fifo_in_last = main_basesoc_uart_tx_fifo_sink_last;
assign main_basesoc_uart_tx_fifo_fifo_in_payload_data = main_basesoc_uart_tx_fifo_sink_payload_data;
assign main_basesoc_uart_tx_fifo_source_valid = main_basesoc_uart_tx_fifo_readable;
assign main_basesoc_uart_tx_fifo_source_first = main_basesoc_uart_tx_fifo_fifo_out_first;
assign main_basesoc_uart_tx_fifo_source_last = main_basesoc_uart_tx_fifo_fifo_out_last;
assign main_basesoc_uart_tx_fifo_source_payload_data = main_basesoc_uart_tx_fifo_fifo_out_payload_data;
assign main_basesoc_uart_tx_fifo_re = main_basesoc_uart_tx_fifo_source_ready;
assign main_basesoc_uart_tx_fifo_syncfifo_re = (main_basesoc_uart_tx_fifo_syncfifo_readable & ((~main_basesoc_uart_tx_fifo_readable) | main_basesoc_uart_tx_fifo_re));
assign main_basesoc_uart_tx_fifo_level1 = (main_basesoc_uart_tx_fifo_level0 + main_basesoc_uart_tx_fifo_readable);
always @(*) begin
	main_basesoc_uart_tx_fifo_wrport_adr <= 4'd0;
	if (main_basesoc_uart_tx_fifo_replace) begin
		main_basesoc_uart_tx_fifo_wrport_adr <= (main_basesoc_uart_tx_fifo_produce - 1'd1);
	end else begin
		main_basesoc_uart_tx_fifo_wrport_adr <= main_basesoc_uart_tx_fifo_produce;
	end
end
assign main_basesoc_uart_tx_fifo_wrport_dat_w = main_basesoc_uart_tx_fifo_syncfifo_din;
assign main_basesoc_uart_tx_fifo_wrport_we = (main_basesoc_uart_tx_fifo_syncfifo_we & (main_basesoc_uart_tx_fifo_syncfifo_writable | main_basesoc_uart_tx_fifo_replace));
assign main_basesoc_uart_tx_fifo_do_read = (main_basesoc_uart_tx_fifo_syncfifo_readable & main_basesoc_uart_tx_fifo_syncfifo_re);
assign main_basesoc_uart_tx_fifo_rdport_adr = main_basesoc_uart_tx_fifo_consume;
assign main_basesoc_uart_tx_fifo_syncfifo_dout = main_basesoc_uart_tx_fifo_rdport_dat_r;
assign main_basesoc_uart_tx_fifo_rdport_re = main_basesoc_uart_tx_fifo_do_read;
assign main_basesoc_uart_tx_fifo_syncfifo_writable = (main_basesoc_uart_tx_fifo_level0 != 5'd16);
assign main_basesoc_uart_tx_fifo_syncfifo_readable = (main_basesoc_uart_tx_fifo_level0 != 1'd0);
assign main_basesoc_uart_rx_fifo_syncfifo_din = {main_basesoc_uart_rx_fifo_fifo_in_last, main_basesoc_uart_rx_fifo_fifo_in_first, main_basesoc_uart_rx_fifo_fifo_in_payload_data};
assign {main_basesoc_uart_rx_fifo_fifo_out_last, main_basesoc_uart_rx_fifo_fifo_out_first, main_basesoc_uart_rx_fifo_fifo_out_payload_data} = main_basesoc_uart_rx_fifo_syncfifo_dout;
assign main_basesoc_uart_rx_fifo_sink_ready = main_basesoc_uart_rx_fifo_syncfifo_writable;
assign main_basesoc_uart_rx_fifo_syncfifo_we = main_basesoc_uart_rx_fifo_sink_valid;
assign main_basesoc_uart_rx_fifo_fifo_in_first = main_basesoc_uart_rx_fifo_sink_first;
assign main_basesoc_uart_rx_fifo_fifo_in_last = main_basesoc_uart_rx_fifo_sink_last;
assign main_basesoc_uart_rx_fifo_fifo_in_payload_data = main_basesoc_uart_rx_fifo_sink_payload_data;
assign main_basesoc_uart_rx_fifo_source_valid = main_basesoc_uart_rx_fifo_readable;
assign main_basesoc_uart_rx_fifo_source_first = main_basesoc_uart_rx_fifo_fifo_out_first;
assign main_basesoc_uart_rx_fifo_source_last = main_basesoc_uart_rx_fifo_fifo_out_last;
assign main_basesoc_uart_rx_fifo_source_payload_data = main_basesoc_uart_rx_fifo_fifo_out_payload_data;
assign main_basesoc_uart_rx_fifo_re = main_basesoc_uart_rx_fifo_source_ready;
assign main_basesoc_uart_rx_fifo_syncfifo_re = (main_basesoc_uart_rx_fifo_syncfifo_readable & ((~main_basesoc_uart_rx_fifo_readable) | main_basesoc_uart_rx_fifo_re));
assign main_basesoc_uart_rx_fifo_level1 = (main_basesoc_uart_rx_fifo_level0 + main_basesoc_uart_rx_fifo_readable);
always @(*) begin
	main_basesoc_uart_rx_fifo_wrport_adr <= 4'd0;
	if (main_basesoc_uart_rx_fifo_replace) begin
		main_basesoc_uart_rx_fifo_wrport_adr <= (main_basesoc_uart_rx_fifo_produce - 1'd1);
	end else begin
		main_basesoc_uart_rx_fifo_wrport_adr <= main_basesoc_uart_rx_fifo_produce;
	end
end
assign main_basesoc_uart_rx_fifo_wrport_dat_w = main_basesoc_uart_rx_fifo_syncfifo_din;
assign main_basesoc_uart_rx_fifo_wrport_we = (main_basesoc_uart_rx_fifo_syncfifo_we & (main_basesoc_uart_rx_fifo_syncfifo_writable | main_basesoc_uart_rx_fifo_replace));
assign main_basesoc_uart_rx_fifo_do_read = (main_basesoc_uart_rx_fifo_syncfifo_readable & main_basesoc_uart_rx_fifo_syncfifo_re);
assign main_basesoc_uart_rx_fifo_rdport_adr = main_basesoc_uart_rx_fifo_consume;
assign main_basesoc_uart_rx_fifo_syncfifo_dout = main_basesoc_uart_rx_fifo_rdport_dat_r;
assign main_basesoc_uart_rx_fifo_rdport_re = main_basesoc_uart_rx_fifo_do_read;
assign main_basesoc_uart_rx_fifo_syncfifo_writable = (main_basesoc_uart_rx_fifo_level0 != 5'd16);
assign main_basesoc_uart_rx_fifo_syncfifo_readable = (main_basesoc_uart_rx_fifo_level0 != 1'd0);
assign main_basesoc_timer_zero_trigger = (main_basesoc_timer_value != 1'd0);
assign main_basesoc_timer_eventmanager_status_w = main_basesoc_timer_zero_status;
always @(*) begin
	main_basesoc_timer_zero_clear <= 1'd0;
	if ((main_basesoc_timer_eventmanager_pending_re & main_basesoc_timer_eventmanager_pending_r)) begin
		main_basesoc_timer_zero_clear <= 1'd1;
	end
end
assign main_basesoc_timer_eventmanager_pending_w = main_basesoc_timer_zero_pending;
assign main_basesoc_timer_irq = (main_basesoc_timer_eventmanager_pending_w & main_basesoc_timer_eventmanager_storage);
assign main_basesoc_timer_zero_status = main_basesoc_timer_zero_trigger;
assign main_basesoc_interface_dat_w = main_basesoc_bus_wishbone_dat_w;
assign main_basesoc_bus_wishbone_dat_r = main_basesoc_interface_dat_r;
always @(*) begin
	main_basesoc_bus_wishbone_ack <= 1'd0;
	builder_next_state <= 1'd0;
	main_basesoc_interface_adr <= 14'd0;
	main_basesoc_interface_we <= 1'd0;
	builder_next_state <= builder_state;
	case (builder_state)
		1'd1: begin
			main_basesoc_bus_wishbone_ack <= 1'd1;
			builder_next_state <= 1'd0;
		end
		default: begin
			if ((main_basesoc_bus_wishbone_cyc & main_basesoc_bus_wishbone_stb)) begin
				main_basesoc_interface_adr <= main_basesoc_bus_wishbone_adr;
				main_basesoc_interface_we <= main_basesoc_bus_wishbone_we;
				builder_next_state <= 1'd1;
			end
		end
	endcase
end
assign main_reset = (~cpu_reset);
assign eth_ref_clk = eth_clk;
assign main_clkin = clk100;
assign sys_clk = main_clkout_buf0;
assign sys2x_clk = main_clkout_buf1;
assign sys4x_clk = main_clkout_buf2;
assign sys4x_dqs_clk = main_clkout_buf3;
assign clk200_clk = main_clkout_buf4;
assign eth_clk = main_clkout_buf5;
assign main_a7ddrphy_bitslip0_i = main_a7ddrphy_dq_i_data0;
assign main_a7ddrphy_bitslip1_i = main_a7ddrphy_dq_i_data1;
assign main_a7ddrphy_bitslip2_i = main_a7ddrphy_dq_i_data2;
assign main_a7ddrphy_bitslip3_i = main_a7ddrphy_dq_i_data3;
assign main_a7ddrphy_bitslip4_i = main_a7ddrphy_dq_i_data4;
assign main_a7ddrphy_bitslip5_i = main_a7ddrphy_dq_i_data5;
assign main_a7ddrphy_bitslip6_i = main_a7ddrphy_dq_i_data6;
assign main_a7ddrphy_bitslip7_i = main_a7ddrphy_dq_i_data7;
assign main_a7ddrphy_bitslip8_i = main_a7ddrphy_dq_i_data8;
assign main_a7ddrphy_bitslip9_i = main_a7ddrphy_dq_i_data9;
assign main_a7ddrphy_bitslip10_i = main_a7ddrphy_dq_i_data10;
assign main_a7ddrphy_bitslip11_i = main_a7ddrphy_dq_i_data11;
assign main_a7ddrphy_bitslip12_i = main_a7ddrphy_dq_i_data12;
assign main_a7ddrphy_bitslip13_i = main_a7ddrphy_dq_i_data13;
assign main_a7ddrphy_bitslip14_i = main_a7ddrphy_dq_i_data14;
assign main_a7ddrphy_bitslip15_i = main_a7ddrphy_dq_i_data15;
always @(*) begin
	main_a7ddrphy_dfi_p0_rddata <= 32'd0;
	main_a7ddrphy_dfi_p0_rddata[0] <= main_a7ddrphy_bitslip0_o[0];
	main_a7ddrphy_dfi_p0_rddata[16] <= main_a7ddrphy_bitslip0_o[1];
	main_a7ddrphy_dfi_p0_rddata[1] <= main_a7ddrphy_bitslip1_o[0];
	main_a7ddrphy_dfi_p0_rddata[17] <= main_a7ddrphy_bitslip1_o[1];
	main_a7ddrphy_dfi_p0_rddata[2] <= main_a7ddrphy_bitslip2_o[0];
	main_a7ddrphy_dfi_p0_rddata[18] <= main_a7ddrphy_bitslip2_o[1];
	main_a7ddrphy_dfi_p0_rddata[3] <= main_a7ddrphy_bitslip3_o[0];
	main_a7ddrphy_dfi_p0_rddata[19] <= main_a7ddrphy_bitslip3_o[1];
	main_a7ddrphy_dfi_p0_rddata[4] <= main_a7ddrphy_bitslip4_o[0];
	main_a7ddrphy_dfi_p0_rddata[20] <= main_a7ddrphy_bitslip4_o[1];
	main_a7ddrphy_dfi_p0_rddata[5] <= main_a7ddrphy_bitslip5_o[0];
	main_a7ddrphy_dfi_p0_rddata[21] <= main_a7ddrphy_bitslip5_o[1];
	main_a7ddrphy_dfi_p0_rddata[6] <= main_a7ddrphy_bitslip6_o[0];
	main_a7ddrphy_dfi_p0_rddata[22] <= main_a7ddrphy_bitslip6_o[1];
	main_a7ddrphy_dfi_p0_rddata[7] <= main_a7ddrphy_bitslip7_o[0];
	main_a7ddrphy_dfi_p0_rddata[23] <= main_a7ddrphy_bitslip7_o[1];
	main_a7ddrphy_dfi_p0_rddata[8] <= main_a7ddrphy_bitslip8_o[0];
	main_a7ddrphy_dfi_p0_rddata[24] <= main_a7ddrphy_bitslip8_o[1];
	main_a7ddrphy_dfi_p0_rddata[9] <= main_a7ddrphy_bitslip9_o[0];
	main_a7ddrphy_dfi_p0_rddata[25] <= main_a7ddrphy_bitslip9_o[1];
	main_a7ddrphy_dfi_p0_rddata[10] <= main_a7ddrphy_bitslip10_o[0];
	main_a7ddrphy_dfi_p0_rddata[26] <= main_a7ddrphy_bitslip10_o[1];
	main_a7ddrphy_dfi_p0_rddata[11] <= main_a7ddrphy_bitslip11_o[0];
	main_a7ddrphy_dfi_p0_rddata[27] <= main_a7ddrphy_bitslip11_o[1];
	main_a7ddrphy_dfi_p0_rddata[12] <= main_a7ddrphy_bitslip12_o[0];
	main_a7ddrphy_dfi_p0_rddata[28] <= main_a7ddrphy_bitslip12_o[1];
	main_a7ddrphy_dfi_p0_rddata[13] <= main_a7ddrphy_bitslip13_o[0];
	main_a7ddrphy_dfi_p0_rddata[29] <= main_a7ddrphy_bitslip13_o[1];
	main_a7ddrphy_dfi_p0_rddata[14] <= main_a7ddrphy_bitslip14_o[0];
	main_a7ddrphy_dfi_p0_rddata[30] <= main_a7ddrphy_bitslip14_o[1];
	main_a7ddrphy_dfi_p0_rddata[15] <= main_a7ddrphy_bitslip15_o[0];
	main_a7ddrphy_dfi_p0_rddata[31] <= main_a7ddrphy_bitslip15_o[1];
end
always @(*) begin
	main_a7ddrphy_dfi_p1_rddata <= 32'd0;
	main_a7ddrphy_dfi_p1_rddata[0] <= main_a7ddrphy_bitslip0_o[2];
	main_a7ddrphy_dfi_p1_rddata[16] <= main_a7ddrphy_bitslip0_o[3];
	main_a7ddrphy_dfi_p1_rddata[1] <= main_a7ddrphy_bitslip1_o[2];
	main_a7ddrphy_dfi_p1_rddata[17] <= main_a7ddrphy_bitslip1_o[3];
	main_a7ddrphy_dfi_p1_rddata[2] <= main_a7ddrphy_bitslip2_o[2];
	main_a7ddrphy_dfi_p1_rddata[18] <= main_a7ddrphy_bitslip2_o[3];
	main_a7ddrphy_dfi_p1_rddata[3] <= main_a7ddrphy_bitslip3_o[2];
	main_a7ddrphy_dfi_p1_rddata[19] <= main_a7ddrphy_bitslip3_o[3];
	main_a7ddrphy_dfi_p1_rddata[4] <= main_a7ddrphy_bitslip4_o[2];
	main_a7ddrphy_dfi_p1_rddata[20] <= main_a7ddrphy_bitslip4_o[3];
	main_a7ddrphy_dfi_p1_rddata[5] <= main_a7ddrphy_bitslip5_o[2];
	main_a7ddrphy_dfi_p1_rddata[21] <= main_a7ddrphy_bitslip5_o[3];
	main_a7ddrphy_dfi_p1_rddata[6] <= main_a7ddrphy_bitslip6_o[2];
	main_a7ddrphy_dfi_p1_rddata[22] <= main_a7ddrphy_bitslip6_o[3];
	main_a7ddrphy_dfi_p1_rddata[7] <= main_a7ddrphy_bitslip7_o[2];
	main_a7ddrphy_dfi_p1_rddata[23] <= main_a7ddrphy_bitslip7_o[3];
	main_a7ddrphy_dfi_p1_rddata[8] <= main_a7ddrphy_bitslip8_o[2];
	main_a7ddrphy_dfi_p1_rddata[24] <= main_a7ddrphy_bitslip8_o[3];
	main_a7ddrphy_dfi_p1_rddata[9] <= main_a7ddrphy_bitslip9_o[2];
	main_a7ddrphy_dfi_p1_rddata[25] <= main_a7ddrphy_bitslip9_o[3];
	main_a7ddrphy_dfi_p1_rddata[10] <= main_a7ddrphy_bitslip10_o[2];
	main_a7ddrphy_dfi_p1_rddata[26] <= main_a7ddrphy_bitslip10_o[3];
	main_a7ddrphy_dfi_p1_rddata[11] <= main_a7ddrphy_bitslip11_o[2];
	main_a7ddrphy_dfi_p1_rddata[27] <= main_a7ddrphy_bitslip11_o[3];
	main_a7ddrphy_dfi_p1_rddata[12] <= main_a7ddrphy_bitslip12_o[2];
	main_a7ddrphy_dfi_p1_rddata[28] <= main_a7ddrphy_bitslip12_o[3];
	main_a7ddrphy_dfi_p1_rddata[13] <= main_a7ddrphy_bitslip13_o[2];
	main_a7ddrphy_dfi_p1_rddata[29] <= main_a7ddrphy_bitslip13_o[3];
	main_a7ddrphy_dfi_p1_rddata[14] <= main_a7ddrphy_bitslip14_o[2];
	main_a7ddrphy_dfi_p1_rddata[30] <= main_a7ddrphy_bitslip14_o[3];
	main_a7ddrphy_dfi_p1_rddata[15] <= main_a7ddrphy_bitslip15_o[2];
	main_a7ddrphy_dfi_p1_rddata[31] <= main_a7ddrphy_bitslip15_o[3];
end
always @(*) begin
	main_a7ddrphy_dfi_p2_rddata <= 32'd0;
	main_a7ddrphy_dfi_p2_rddata[0] <= main_a7ddrphy_bitslip0_o[4];
	main_a7ddrphy_dfi_p2_rddata[16] <= main_a7ddrphy_bitslip0_o[5];
	main_a7ddrphy_dfi_p2_rddata[1] <= main_a7ddrphy_bitslip1_o[4];
	main_a7ddrphy_dfi_p2_rddata[17] <= main_a7ddrphy_bitslip1_o[5];
	main_a7ddrphy_dfi_p2_rddata[2] <= main_a7ddrphy_bitslip2_o[4];
	main_a7ddrphy_dfi_p2_rddata[18] <= main_a7ddrphy_bitslip2_o[5];
	main_a7ddrphy_dfi_p2_rddata[3] <= main_a7ddrphy_bitslip3_o[4];
	main_a7ddrphy_dfi_p2_rddata[19] <= main_a7ddrphy_bitslip3_o[5];
	main_a7ddrphy_dfi_p2_rddata[4] <= main_a7ddrphy_bitslip4_o[4];
	main_a7ddrphy_dfi_p2_rddata[20] <= main_a7ddrphy_bitslip4_o[5];
	main_a7ddrphy_dfi_p2_rddata[5] <= main_a7ddrphy_bitslip5_o[4];
	main_a7ddrphy_dfi_p2_rddata[21] <= main_a7ddrphy_bitslip5_o[5];
	main_a7ddrphy_dfi_p2_rddata[6] <= main_a7ddrphy_bitslip6_o[4];
	main_a7ddrphy_dfi_p2_rddata[22] <= main_a7ddrphy_bitslip6_o[5];
	main_a7ddrphy_dfi_p2_rddata[7] <= main_a7ddrphy_bitslip7_o[4];
	main_a7ddrphy_dfi_p2_rddata[23] <= main_a7ddrphy_bitslip7_o[5];
	main_a7ddrphy_dfi_p2_rddata[8] <= main_a7ddrphy_bitslip8_o[4];
	main_a7ddrphy_dfi_p2_rddata[24] <= main_a7ddrphy_bitslip8_o[5];
	main_a7ddrphy_dfi_p2_rddata[9] <= main_a7ddrphy_bitslip9_o[4];
	main_a7ddrphy_dfi_p2_rddata[25] <= main_a7ddrphy_bitslip9_o[5];
	main_a7ddrphy_dfi_p2_rddata[10] <= main_a7ddrphy_bitslip10_o[4];
	main_a7ddrphy_dfi_p2_rddata[26] <= main_a7ddrphy_bitslip10_o[5];
	main_a7ddrphy_dfi_p2_rddata[11] <= main_a7ddrphy_bitslip11_o[4];
	main_a7ddrphy_dfi_p2_rddata[27] <= main_a7ddrphy_bitslip11_o[5];
	main_a7ddrphy_dfi_p2_rddata[12] <= main_a7ddrphy_bitslip12_o[4];
	main_a7ddrphy_dfi_p2_rddata[28] <= main_a7ddrphy_bitslip12_o[5];
	main_a7ddrphy_dfi_p2_rddata[13] <= main_a7ddrphy_bitslip13_o[4];
	main_a7ddrphy_dfi_p2_rddata[29] <= main_a7ddrphy_bitslip13_o[5];
	main_a7ddrphy_dfi_p2_rddata[14] <= main_a7ddrphy_bitslip14_o[4];
	main_a7ddrphy_dfi_p2_rddata[30] <= main_a7ddrphy_bitslip14_o[5];
	main_a7ddrphy_dfi_p2_rddata[15] <= main_a7ddrphy_bitslip15_o[4];
	main_a7ddrphy_dfi_p2_rddata[31] <= main_a7ddrphy_bitslip15_o[5];
end
always @(*) begin
	main_a7ddrphy_dfi_p3_rddata <= 32'd0;
	main_a7ddrphy_dfi_p3_rddata[0] <= main_a7ddrphy_bitslip0_o[6];
	main_a7ddrphy_dfi_p3_rddata[16] <= main_a7ddrphy_bitslip0_o[7];
	main_a7ddrphy_dfi_p3_rddata[1] <= main_a7ddrphy_bitslip1_o[6];
	main_a7ddrphy_dfi_p3_rddata[17] <= main_a7ddrphy_bitslip1_o[7];
	main_a7ddrphy_dfi_p3_rddata[2] <= main_a7ddrphy_bitslip2_o[6];
	main_a7ddrphy_dfi_p3_rddata[18] <= main_a7ddrphy_bitslip2_o[7];
	main_a7ddrphy_dfi_p3_rddata[3] <= main_a7ddrphy_bitslip3_o[6];
	main_a7ddrphy_dfi_p3_rddata[19] <= main_a7ddrphy_bitslip3_o[7];
	main_a7ddrphy_dfi_p3_rddata[4] <= main_a7ddrphy_bitslip4_o[6];
	main_a7ddrphy_dfi_p3_rddata[20] <= main_a7ddrphy_bitslip4_o[7];
	main_a7ddrphy_dfi_p3_rddata[5] <= main_a7ddrphy_bitslip5_o[6];
	main_a7ddrphy_dfi_p3_rddata[21] <= main_a7ddrphy_bitslip5_o[7];
	main_a7ddrphy_dfi_p3_rddata[6] <= main_a7ddrphy_bitslip6_o[6];
	main_a7ddrphy_dfi_p3_rddata[22] <= main_a7ddrphy_bitslip6_o[7];
	main_a7ddrphy_dfi_p3_rddata[7] <= main_a7ddrphy_bitslip7_o[6];
	main_a7ddrphy_dfi_p3_rddata[23] <= main_a7ddrphy_bitslip7_o[7];
	main_a7ddrphy_dfi_p3_rddata[8] <= main_a7ddrphy_bitslip8_o[6];
	main_a7ddrphy_dfi_p3_rddata[24] <= main_a7ddrphy_bitslip8_o[7];
	main_a7ddrphy_dfi_p3_rddata[9] <= main_a7ddrphy_bitslip9_o[6];
	main_a7ddrphy_dfi_p3_rddata[25] <= main_a7ddrphy_bitslip9_o[7];
	main_a7ddrphy_dfi_p3_rddata[10] <= main_a7ddrphy_bitslip10_o[6];
	main_a7ddrphy_dfi_p3_rddata[26] <= main_a7ddrphy_bitslip10_o[7];
	main_a7ddrphy_dfi_p3_rddata[11] <= main_a7ddrphy_bitslip11_o[6];
	main_a7ddrphy_dfi_p3_rddata[27] <= main_a7ddrphy_bitslip11_o[7];
	main_a7ddrphy_dfi_p3_rddata[12] <= main_a7ddrphy_bitslip12_o[6];
	main_a7ddrphy_dfi_p3_rddata[28] <= main_a7ddrphy_bitslip12_o[7];
	main_a7ddrphy_dfi_p3_rddata[13] <= main_a7ddrphy_bitslip13_o[6];
	main_a7ddrphy_dfi_p3_rddata[29] <= main_a7ddrphy_bitslip13_o[7];
	main_a7ddrphy_dfi_p3_rddata[14] <= main_a7ddrphy_bitslip14_o[6];
	main_a7ddrphy_dfi_p3_rddata[30] <= main_a7ddrphy_bitslip14_o[7];
	main_a7ddrphy_dfi_p3_rddata[15] <= main_a7ddrphy_bitslip15_o[6];
	main_a7ddrphy_dfi_p3_rddata[31] <= main_a7ddrphy_bitslip15_o[7];
end
assign main_a7ddrphy_rddata_en = {main_a7ddrphy_rddata_en_last, main_a7ddrphy_dfi_p2_rddata_en};
assign main_a7ddrphy_wrdata_en = {main_a7ddrphy_wrdata_en_last, main_a7ddrphy_dfi_p3_wrdata_en};
assign main_a7ddrphy_dq_oe = main_a7ddrphy_wrdata_en[2];
always @(*) begin
	main_a7ddrphy_dqs_oe <= 1'd0;
	if (main_a7ddrphy_wlevel_en_storage) begin
		main_a7ddrphy_dqs_oe <= 1'd1;
	end else begin
		main_a7ddrphy_dqs_oe <= main_a7ddrphy_dq_oe;
	end
end
assign main_a7ddrphy_dqspattern0 = (main_a7ddrphy_wrdata_en[1] & (~main_a7ddrphy_wrdata_en[2]));
assign main_a7ddrphy_dqspattern1 = (main_a7ddrphy_wrdata_en[3] & (~main_a7ddrphy_wrdata_en[2]));
always @(*) begin
	main_a7ddrphy_dqspattern_o0 <= 8'd0;
	main_a7ddrphy_dqspattern_o0 <= 7'd85;
	if (main_a7ddrphy_dqspattern0) begin
		main_a7ddrphy_dqspattern_o0 <= 5'd21;
	end
	if (main_a7ddrphy_dqspattern1) begin
		main_a7ddrphy_dqspattern_o0 <= 7'd84;
	end
	if (main_a7ddrphy_wlevel_en_storage) begin
		main_a7ddrphy_dqspattern_o0 <= 1'd0;
		if (main_a7ddrphy_wlevel_strobe_re) begin
			main_a7ddrphy_dqspattern_o0 <= 1'd1;
		end
	end
end
always @(*) begin
	main_a7ddrphy_bitslip0_o <= 8'd0;
	case (main_a7ddrphy_bitslip0_value)
		1'd0: begin
			main_a7ddrphy_bitslip0_o <= main_a7ddrphy_bitslip0_r[7:0];
		end
		1'd1: begin
			main_a7ddrphy_bitslip0_o <= main_a7ddrphy_bitslip0_r[8:1];
		end
		2'd2: begin
			main_a7ddrphy_bitslip0_o <= main_a7ddrphy_bitslip0_r[9:2];
		end
		2'd3: begin
			main_a7ddrphy_bitslip0_o <= main_a7ddrphy_bitslip0_r[10:3];
		end
		3'd4: begin
			main_a7ddrphy_bitslip0_o <= main_a7ddrphy_bitslip0_r[11:4];
		end
		3'd5: begin
			main_a7ddrphy_bitslip0_o <= main_a7ddrphy_bitslip0_r[12:5];
		end
		3'd6: begin
			main_a7ddrphy_bitslip0_o <= main_a7ddrphy_bitslip0_r[13:6];
		end
		3'd7: begin
			main_a7ddrphy_bitslip0_o <= main_a7ddrphy_bitslip0_r[14:7];
		end
	endcase
end
always @(*) begin
	main_a7ddrphy_bitslip1_o <= 8'd0;
	case (main_a7ddrphy_bitslip1_value)
		1'd0: begin
			main_a7ddrphy_bitslip1_o <= main_a7ddrphy_bitslip1_r[7:0];
		end
		1'd1: begin
			main_a7ddrphy_bitslip1_o <= main_a7ddrphy_bitslip1_r[8:1];
		end
		2'd2: begin
			main_a7ddrphy_bitslip1_o <= main_a7ddrphy_bitslip1_r[9:2];
		end
		2'd3: begin
			main_a7ddrphy_bitslip1_o <= main_a7ddrphy_bitslip1_r[10:3];
		end
		3'd4: begin
			main_a7ddrphy_bitslip1_o <= main_a7ddrphy_bitslip1_r[11:4];
		end
		3'd5: begin
			main_a7ddrphy_bitslip1_o <= main_a7ddrphy_bitslip1_r[12:5];
		end
		3'd6: begin
			main_a7ddrphy_bitslip1_o <= main_a7ddrphy_bitslip1_r[13:6];
		end
		3'd7: begin
			main_a7ddrphy_bitslip1_o <= main_a7ddrphy_bitslip1_r[14:7];
		end
	endcase
end
always @(*) begin
	main_a7ddrphy_bitslip2_o <= 8'd0;
	case (main_a7ddrphy_bitslip2_value)
		1'd0: begin
			main_a7ddrphy_bitslip2_o <= main_a7ddrphy_bitslip2_r[7:0];
		end
		1'd1: begin
			main_a7ddrphy_bitslip2_o <= main_a7ddrphy_bitslip2_r[8:1];
		end
		2'd2: begin
			main_a7ddrphy_bitslip2_o <= main_a7ddrphy_bitslip2_r[9:2];
		end
		2'd3: begin
			main_a7ddrphy_bitslip2_o <= main_a7ddrphy_bitslip2_r[10:3];
		end
		3'd4: begin
			main_a7ddrphy_bitslip2_o <= main_a7ddrphy_bitslip2_r[11:4];
		end
		3'd5: begin
			main_a7ddrphy_bitslip2_o <= main_a7ddrphy_bitslip2_r[12:5];
		end
		3'd6: begin
			main_a7ddrphy_bitslip2_o <= main_a7ddrphy_bitslip2_r[13:6];
		end
		3'd7: begin
			main_a7ddrphy_bitslip2_o <= main_a7ddrphy_bitslip2_r[14:7];
		end
	endcase
end
always @(*) begin
	main_a7ddrphy_bitslip3_o <= 8'd0;
	case (main_a7ddrphy_bitslip3_value)
		1'd0: begin
			main_a7ddrphy_bitslip3_o <= main_a7ddrphy_bitslip3_r[7:0];
		end
		1'd1: begin
			main_a7ddrphy_bitslip3_o <= main_a7ddrphy_bitslip3_r[8:1];
		end
		2'd2: begin
			main_a7ddrphy_bitslip3_o <= main_a7ddrphy_bitslip3_r[9:2];
		end
		2'd3: begin
			main_a7ddrphy_bitslip3_o <= main_a7ddrphy_bitslip3_r[10:3];
		end
		3'd4: begin
			main_a7ddrphy_bitslip3_o <= main_a7ddrphy_bitslip3_r[11:4];
		end
		3'd5: begin
			main_a7ddrphy_bitslip3_o <= main_a7ddrphy_bitslip3_r[12:5];
		end
		3'd6: begin
			main_a7ddrphy_bitslip3_o <= main_a7ddrphy_bitslip3_r[13:6];
		end
		3'd7: begin
			main_a7ddrphy_bitslip3_o <= main_a7ddrphy_bitslip3_r[14:7];
		end
	endcase
end
always @(*) begin
	main_a7ddrphy_bitslip4_o <= 8'd0;
	case (main_a7ddrphy_bitslip4_value)
		1'd0: begin
			main_a7ddrphy_bitslip4_o <= main_a7ddrphy_bitslip4_r[7:0];
		end
		1'd1: begin
			main_a7ddrphy_bitslip4_o <= main_a7ddrphy_bitslip4_r[8:1];
		end
		2'd2: begin
			main_a7ddrphy_bitslip4_o <= main_a7ddrphy_bitslip4_r[9:2];
		end
		2'd3: begin
			main_a7ddrphy_bitslip4_o <= main_a7ddrphy_bitslip4_r[10:3];
		end
		3'd4: begin
			main_a7ddrphy_bitslip4_o <= main_a7ddrphy_bitslip4_r[11:4];
		end
		3'd5: begin
			main_a7ddrphy_bitslip4_o <= main_a7ddrphy_bitslip4_r[12:5];
		end
		3'd6: begin
			main_a7ddrphy_bitslip4_o <= main_a7ddrphy_bitslip4_r[13:6];
		end
		3'd7: begin
			main_a7ddrphy_bitslip4_o <= main_a7ddrphy_bitslip4_r[14:7];
		end
	endcase
end
always @(*) begin
	main_a7ddrphy_bitslip5_o <= 8'd0;
	case (main_a7ddrphy_bitslip5_value)
		1'd0: begin
			main_a7ddrphy_bitslip5_o <= main_a7ddrphy_bitslip5_r[7:0];
		end
		1'd1: begin
			main_a7ddrphy_bitslip5_o <= main_a7ddrphy_bitslip5_r[8:1];
		end
		2'd2: begin
			main_a7ddrphy_bitslip5_o <= main_a7ddrphy_bitslip5_r[9:2];
		end
		2'd3: begin
			main_a7ddrphy_bitslip5_o <= main_a7ddrphy_bitslip5_r[10:3];
		end
		3'd4: begin
			main_a7ddrphy_bitslip5_o <= main_a7ddrphy_bitslip5_r[11:4];
		end
		3'd5: begin
			main_a7ddrphy_bitslip5_o <= main_a7ddrphy_bitslip5_r[12:5];
		end
		3'd6: begin
			main_a7ddrphy_bitslip5_o <= main_a7ddrphy_bitslip5_r[13:6];
		end
		3'd7: begin
			main_a7ddrphy_bitslip5_o <= main_a7ddrphy_bitslip5_r[14:7];
		end
	endcase
end
always @(*) begin
	main_a7ddrphy_bitslip6_o <= 8'd0;
	case (main_a7ddrphy_bitslip6_value)
		1'd0: begin
			main_a7ddrphy_bitslip6_o <= main_a7ddrphy_bitslip6_r[7:0];
		end
		1'd1: begin
			main_a7ddrphy_bitslip6_o <= main_a7ddrphy_bitslip6_r[8:1];
		end
		2'd2: begin
			main_a7ddrphy_bitslip6_o <= main_a7ddrphy_bitslip6_r[9:2];
		end
		2'd3: begin
			main_a7ddrphy_bitslip6_o <= main_a7ddrphy_bitslip6_r[10:3];
		end
		3'd4: begin
			main_a7ddrphy_bitslip6_o <= main_a7ddrphy_bitslip6_r[11:4];
		end
		3'd5: begin
			main_a7ddrphy_bitslip6_o <= main_a7ddrphy_bitslip6_r[12:5];
		end
		3'd6: begin
			main_a7ddrphy_bitslip6_o <= main_a7ddrphy_bitslip6_r[13:6];
		end
		3'd7: begin
			main_a7ddrphy_bitslip6_o <= main_a7ddrphy_bitslip6_r[14:7];
		end
	endcase
end
always @(*) begin
	main_a7ddrphy_bitslip7_o <= 8'd0;
	case (main_a7ddrphy_bitslip7_value)
		1'd0: begin
			main_a7ddrphy_bitslip7_o <= main_a7ddrphy_bitslip7_r[7:0];
		end
		1'd1: begin
			main_a7ddrphy_bitslip7_o <= main_a7ddrphy_bitslip7_r[8:1];
		end
		2'd2: begin
			main_a7ddrphy_bitslip7_o <= main_a7ddrphy_bitslip7_r[9:2];
		end
		2'd3: begin
			main_a7ddrphy_bitslip7_o <= main_a7ddrphy_bitslip7_r[10:3];
		end
		3'd4: begin
			main_a7ddrphy_bitslip7_o <= main_a7ddrphy_bitslip7_r[11:4];
		end
		3'd5: begin
			main_a7ddrphy_bitslip7_o <= main_a7ddrphy_bitslip7_r[12:5];
		end
		3'd6: begin
			main_a7ddrphy_bitslip7_o <= main_a7ddrphy_bitslip7_r[13:6];
		end
		3'd7: begin
			main_a7ddrphy_bitslip7_o <= main_a7ddrphy_bitslip7_r[14:7];
		end
	endcase
end
always @(*) begin
	main_a7ddrphy_bitslip8_o <= 8'd0;
	case (main_a7ddrphy_bitslip8_value)
		1'd0: begin
			main_a7ddrphy_bitslip8_o <= main_a7ddrphy_bitslip8_r[7:0];
		end
		1'd1: begin
			main_a7ddrphy_bitslip8_o <= main_a7ddrphy_bitslip8_r[8:1];
		end
		2'd2: begin
			main_a7ddrphy_bitslip8_o <= main_a7ddrphy_bitslip8_r[9:2];
		end
		2'd3: begin
			main_a7ddrphy_bitslip8_o <= main_a7ddrphy_bitslip8_r[10:3];
		end
		3'd4: begin
			main_a7ddrphy_bitslip8_o <= main_a7ddrphy_bitslip8_r[11:4];
		end
		3'd5: begin
			main_a7ddrphy_bitslip8_o <= main_a7ddrphy_bitslip8_r[12:5];
		end
		3'd6: begin
			main_a7ddrphy_bitslip8_o <= main_a7ddrphy_bitslip8_r[13:6];
		end
		3'd7: begin
			main_a7ddrphy_bitslip8_o <= main_a7ddrphy_bitslip8_r[14:7];
		end
	endcase
end
always @(*) begin
	main_a7ddrphy_bitslip9_o <= 8'd0;
	case (main_a7ddrphy_bitslip9_value)
		1'd0: begin
			main_a7ddrphy_bitslip9_o <= main_a7ddrphy_bitslip9_r[7:0];
		end
		1'd1: begin
			main_a7ddrphy_bitslip9_o <= main_a7ddrphy_bitslip9_r[8:1];
		end
		2'd2: begin
			main_a7ddrphy_bitslip9_o <= main_a7ddrphy_bitslip9_r[9:2];
		end
		2'd3: begin
			main_a7ddrphy_bitslip9_o <= main_a7ddrphy_bitslip9_r[10:3];
		end
		3'd4: begin
			main_a7ddrphy_bitslip9_o <= main_a7ddrphy_bitslip9_r[11:4];
		end
		3'd5: begin
			main_a7ddrphy_bitslip9_o <= main_a7ddrphy_bitslip9_r[12:5];
		end
		3'd6: begin
			main_a7ddrphy_bitslip9_o <= main_a7ddrphy_bitslip9_r[13:6];
		end
		3'd7: begin
			main_a7ddrphy_bitslip9_o <= main_a7ddrphy_bitslip9_r[14:7];
		end
	endcase
end
always @(*) begin
	main_a7ddrphy_bitslip10_o <= 8'd0;
	case (main_a7ddrphy_bitslip10_value)
		1'd0: begin
			main_a7ddrphy_bitslip10_o <= main_a7ddrphy_bitslip10_r[7:0];
		end
		1'd1: begin
			main_a7ddrphy_bitslip10_o <= main_a7ddrphy_bitslip10_r[8:1];
		end
		2'd2: begin
			main_a7ddrphy_bitslip10_o <= main_a7ddrphy_bitslip10_r[9:2];
		end
		2'd3: begin
			main_a7ddrphy_bitslip10_o <= main_a7ddrphy_bitslip10_r[10:3];
		end
		3'd4: begin
			main_a7ddrphy_bitslip10_o <= main_a7ddrphy_bitslip10_r[11:4];
		end
		3'd5: begin
			main_a7ddrphy_bitslip10_o <= main_a7ddrphy_bitslip10_r[12:5];
		end
		3'd6: begin
			main_a7ddrphy_bitslip10_o <= main_a7ddrphy_bitslip10_r[13:6];
		end
		3'd7: begin
			main_a7ddrphy_bitslip10_o <= main_a7ddrphy_bitslip10_r[14:7];
		end
	endcase
end
always @(*) begin
	main_a7ddrphy_bitslip11_o <= 8'd0;
	case (main_a7ddrphy_bitslip11_value)
		1'd0: begin
			main_a7ddrphy_bitslip11_o <= main_a7ddrphy_bitslip11_r[7:0];
		end
		1'd1: begin
			main_a7ddrphy_bitslip11_o <= main_a7ddrphy_bitslip11_r[8:1];
		end
		2'd2: begin
			main_a7ddrphy_bitslip11_o <= main_a7ddrphy_bitslip11_r[9:2];
		end
		2'd3: begin
			main_a7ddrphy_bitslip11_o <= main_a7ddrphy_bitslip11_r[10:3];
		end
		3'd4: begin
			main_a7ddrphy_bitslip11_o <= main_a7ddrphy_bitslip11_r[11:4];
		end
		3'd5: begin
			main_a7ddrphy_bitslip11_o <= main_a7ddrphy_bitslip11_r[12:5];
		end
		3'd6: begin
			main_a7ddrphy_bitslip11_o <= main_a7ddrphy_bitslip11_r[13:6];
		end
		3'd7: begin
			main_a7ddrphy_bitslip11_o <= main_a7ddrphy_bitslip11_r[14:7];
		end
	endcase
end
always @(*) begin
	main_a7ddrphy_bitslip12_o <= 8'd0;
	case (main_a7ddrphy_bitslip12_value)
		1'd0: begin
			main_a7ddrphy_bitslip12_o <= main_a7ddrphy_bitslip12_r[7:0];
		end
		1'd1: begin
			main_a7ddrphy_bitslip12_o <= main_a7ddrphy_bitslip12_r[8:1];
		end
		2'd2: begin
			main_a7ddrphy_bitslip12_o <= main_a7ddrphy_bitslip12_r[9:2];
		end
		2'd3: begin
			main_a7ddrphy_bitslip12_o <= main_a7ddrphy_bitslip12_r[10:3];
		end
		3'd4: begin
			main_a7ddrphy_bitslip12_o <= main_a7ddrphy_bitslip12_r[11:4];
		end
		3'd5: begin
			main_a7ddrphy_bitslip12_o <= main_a7ddrphy_bitslip12_r[12:5];
		end
		3'd6: begin
			main_a7ddrphy_bitslip12_o <= main_a7ddrphy_bitslip12_r[13:6];
		end
		3'd7: begin
			main_a7ddrphy_bitslip12_o <= main_a7ddrphy_bitslip12_r[14:7];
		end
	endcase
end
always @(*) begin
	main_a7ddrphy_bitslip13_o <= 8'd0;
	case (main_a7ddrphy_bitslip13_value)
		1'd0: begin
			main_a7ddrphy_bitslip13_o <= main_a7ddrphy_bitslip13_r[7:0];
		end
		1'd1: begin
			main_a7ddrphy_bitslip13_o <= main_a7ddrphy_bitslip13_r[8:1];
		end
		2'd2: begin
			main_a7ddrphy_bitslip13_o <= main_a7ddrphy_bitslip13_r[9:2];
		end
		2'd3: begin
			main_a7ddrphy_bitslip13_o <= main_a7ddrphy_bitslip13_r[10:3];
		end
		3'd4: begin
			main_a7ddrphy_bitslip13_o <= main_a7ddrphy_bitslip13_r[11:4];
		end
		3'd5: begin
			main_a7ddrphy_bitslip13_o <= main_a7ddrphy_bitslip13_r[12:5];
		end
		3'd6: begin
			main_a7ddrphy_bitslip13_o <= main_a7ddrphy_bitslip13_r[13:6];
		end
		3'd7: begin
			main_a7ddrphy_bitslip13_o <= main_a7ddrphy_bitslip13_r[14:7];
		end
	endcase
end
always @(*) begin
	main_a7ddrphy_bitslip14_o <= 8'd0;
	case (main_a7ddrphy_bitslip14_value)
		1'd0: begin
			main_a7ddrphy_bitslip14_o <= main_a7ddrphy_bitslip14_r[7:0];
		end
		1'd1: begin
			main_a7ddrphy_bitslip14_o <= main_a7ddrphy_bitslip14_r[8:1];
		end
		2'd2: begin
			main_a7ddrphy_bitslip14_o <= main_a7ddrphy_bitslip14_r[9:2];
		end
		2'd3: begin
			main_a7ddrphy_bitslip14_o <= main_a7ddrphy_bitslip14_r[10:3];
		end
		3'd4: begin
			main_a7ddrphy_bitslip14_o <= main_a7ddrphy_bitslip14_r[11:4];
		end
		3'd5: begin
			main_a7ddrphy_bitslip14_o <= main_a7ddrphy_bitslip14_r[12:5];
		end
		3'd6: begin
			main_a7ddrphy_bitslip14_o <= main_a7ddrphy_bitslip14_r[13:6];
		end
		3'd7: begin
			main_a7ddrphy_bitslip14_o <= main_a7ddrphy_bitslip14_r[14:7];
		end
	endcase
end
always @(*) begin
	main_a7ddrphy_bitslip15_o <= 8'd0;
	case (main_a7ddrphy_bitslip15_value)
		1'd0: begin
			main_a7ddrphy_bitslip15_o <= main_a7ddrphy_bitslip15_r[7:0];
		end
		1'd1: begin
			main_a7ddrphy_bitslip15_o <= main_a7ddrphy_bitslip15_r[8:1];
		end
		2'd2: begin
			main_a7ddrphy_bitslip15_o <= main_a7ddrphy_bitslip15_r[9:2];
		end
		2'd3: begin
			main_a7ddrphy_bitslip15_o <= main_a7ddrphy_bitslip15_r[10:3];
		end
		3'd4: begin
			main_a7ddrphy_bitslip15_o <= main_a7ddrphy_bitslip15_r[11:4];
		end
		3'd5: begin
			main_a7ddrphy_bitslip15_o <= main_a7ddrphy_bitslip15_r[12:5];
		end
		3'd6: begin
			main_a7ddrphy_bitslip15_o <= main_a7ddrphy_bitslip15_r[13:6];
		end
		3'd7: begin
			main_a7ddrphy_bitslip15_o <= main_a7ddrphy_bitslip15_r[14:7];
		end
	endcase
end
assign main_a7ddrphy_dfi_p0_address = main_sdram_master_p0_address;
assign main_a7ddrphy_dfi_p0_bank = main_sdram_master_p0_bank;
assign main_a7ddrphy_dfi_p0_cas_n = main_sdram_master_p0_cas_n;
assign main_a7ddrphy_dfi_p0_cs_n = main_sdram_master_p0_cs_n;
assign main_a7ddrphy_dfi_p0_ras_n = main_sdram_master_p0_ras_n;
assign main_a7ddrphy_dfi_p0_we_n = main_sdram_master_p0_we_n;
assign main_a7ddrphy_dfi_p0_cke = main_sdram_master_p0_cke;
assign main_a7ddrphy_dfi_p0_odt = main_sdram_master_p0_odt;
assign main_a7ddrphy_dfi_p0_reset_n = main_sdram_master_p0_reset_n;
assign main_a7ddrphy_dfi_p0_act_n = main_sdram_master_p0_act_n;
assign main_a7ddrphy_dfi_p0_wrdata = main_sdram_master_p0_wrdata;
assign main_a7ddrphy_dfi_p0_wrdata_en = main_sdram_master_p0_wrdata_en;
assign main_a7ddrphy_dfi_p0_wrdata_mask = main_sdram_master_p0_wrdata_mask;
assign main_a7ddrphy_dfi_p0_rddata_en = main_sdram_master_p0_rddata_en;
assign main_sdram_master_p0_rddata = main_a7ddrphy_dfi_p0_rddata;
assign main_sdram_master_p0_rddata_valid = main_a7ddrphy_dfi_p0_rddata_valid;
assign main_a7ddrphy_dfi_p1_address = main_sdram_master_p1_address;
assign main_a7ddrphy_dfi_p1_bank = main_sdram_master_p1_bank;
assign main_a7ddrphy_dfi_p1_cas_n = main_sdram_master_p1_cas_n;
assign main_a7ddrphy_dfi_p1_cs_n = main_sdram_master_p1_cs_n;
assign main_a7ddrphy_dfi_p1_ras_n = main_sdram_master_p1_ras_n;
assign main_a7ddrphy_dfi_p1_we_n = main_sdram_master_p1_we_n;
assign main_a7ddrphy_dfi_p1_cke = main_sdram_master_p1_cke;
assign main_a7ddrphy_dfi_p1_odt = main_sdram_master_p1_odt;
assign main_a7ddrphy_dfi_p1_reset_n = main_sdram_master_p1_reset_n;
assign main_a7ddrphy_dfi_p1_act_n = main_sdram_master_p1_act_n;
assign main_a7ddrphy_dfi_p1_wrdata = main_sdram_master_p1_wrdata;
assign main_a7ddrphy_dfi_p1_wrdata_en = main_sdram_master_p1_wrdata_en;
assign main_a7ddrphy_dfi_p1_wrdata_mask = main_sdram_master_p1_wrdata_mask;
assign main_a7ddrphy_dfi_p1_rddata_en = main_sdram_master_p1_rddata_en;
assign main_sdram_master_p1_rddata = main_a7ddrphy_dfi_p1_rddata;
assign main_sdram_master_p1_rddata_valid = main_a7ddrphy_dfi_p1_rddata_valid;
assign main_a7ddrphy_dfi_p2_address = main_sdram_master_p2_address;
assign main_a7ddrphy_dfi_p2_bank = main_sdram_master_p2_bank;
assign main_a7ddrphy_dfi_p2_cas_n = main_sdram_master_p2_cas_n;
assign main_a7ddrphy_dfi_p2_cs_n = main_sdram_master_p2_cs_n;
assign main_a7ddrphy_dfi_p2_ras_n = main_sdram_master_p2_ras_n;
assign main_a7ddrphy_dfi_p2_we_n = main_sdram_master_p2_we_n;
assign main_a7ddrphy_dfi_p2_cke = main_sdram_master_p2_cke;
assign main_a7ddrphy_dfi_p2_odt = main_sdram_master_p2_odt;
assign main_a7ddrphy_dfi_p2_reset_n = main_sdram_master_p2_reset_n;
assign main_a7ddrphy_dfi_p2_act_n = main_sdram_master_p2_act_n;
assign main_a7ddrphy_dfi_p2_wrdata = main_sdram_master_p2_wrdata;
assign main_a7ddrphy_dfi_p2_wrdata_en = main_sdram_master_p2_wrdata_en;
assign main_a7ddrphy_dfi_p2_wrdata_mask = main_sdram_master_p2_wrdata_mask;
assign main_a7ddrphy_dfi_p2_rddata_en = main_sdram_master_p2_rddata_en;
assign main_sdram_master_p2_rddata = main_a7ddrphy_dfi_p2_rddata;
assign main_sdram_master_p2_rddata_valid = main_a7ddrphy_dfi_p2_rddata_valid;
assign main_a7ddrphy_dfi_p3_address = main_sdram_master_p3_address;
assign main_a7ddrphy_dfi_p3_bank = main_sdram_master_p3_bank;
assign main_a7ddrphy_dfi_p3_cas_n = main_sdram_master_p3_cas_n;
assign main_a7ddrphy_dfi_p3_cs_n = main_sdram_master_p3_cs_n;
assign main_a7ddrphy_dfi_p3_ras_n = main_sdram_master_p3_ras_n;
assign main_a7ddrphy_dfi_p3_we_n = main_sdram_master_p3_we_n;
assign main_a7ddrphy_dfi_p3_cke = main_sdram_master_p3_cke;
assign main_a7ddrphy_dfi_p3_odt = main_sdram_master_p3_odt;
assign main_a7ddrphy_dfi_p3_reset_n = main_sdram_master_p3_reset_n;
assign main_a7ddrphy_dfi_p3_act_n = main_sdram_master_p3_act_n;
assign main_a7ddrphy_dfi_p3_wrdata = main_sdram_master_p3_wrdata;
assign main_a7ddrphy_dfi_p3_wrdata_en = main_sdram_master_p3_wrdata_en;
assign main_a7ddrphy_dfi_p3_wrdata_mask = main_sdram_master_p3_wrdata_mask;
assign main_a7ddrphy_dfi_p3_rddata_en = main_sdram_master_p3_rddata_en;
assign main_sdram_master_p3_rddata = main_a7ddrphy_dfi_p3_rddata;
assign main_sdram_master_p3_rddata_valid = main_a7ddrphy_dfi_p3_rddata_valid;
assign main_sdram_slave_p0_address = main_sdram_dfi_p0_address;
assign main_sdram_slave_p0_bank = main_sdram_dfi_p0_bank;
assign main_sdram_slave_p0_cas_n = main_sdram_dfi_p0_cas_n;
assign main_sdram_slave_p0_cs_n = main_sdram_dfi_p0_cs_n;
assign main_sdram_slave_p0_ras_n = main_sdram_dfi_p0_ras_n;
assign main_sdram_slave_p0_we_n = main_sdram_dfi_p0_we_n;
assign main_sdram_slave_p0_cke = main_sdram_dfi_p0_cke;
assign main_sdram_slave_p0_odt = main_sdram_dfi_p0_odt;
assign main_sdram_slave_p0_reset_n = main_sdram_dfi_p0_reset_n;
assign main_sdram_slave_p0_act_n = main_sdram_dfi_p0_act_n;
assign main_sdram_slave_p0_wrdata = main_sdram_dfi_p0_wrdata;
assign main_sdram_slave_p0_wrdata_en = main_sdram_dfi_p0_wrdata_en;
assign main_sdram_slave_p0_wrdata_mask = main_sdram_dfi_p0_wrdata_mask;
assign main_sdram_slave_p0_rddata_en = main_sdram_dfi_p0_rddata_en;
assign main_sdram_dfi_p0_rddata = main_sdram_slave_p0_rddata;
assign main_sdram_dfi_p0_rddata_valid = main_sdram_slave_p0_rddata_valid;
assign main_sdram_slave_p1_address = main_sdram_dfi_p1_address;
assign main_sdram_slave_p1_bank = main_sdram_dfi_p1_bank;
assign main_sdram_slave_p1_cas_n = main_sdram_dfi_p1_cas_n;
assign main_sdram_slave_p1_cs_n = main_sdram_dfi_p1_cs_n;
assign main_sdram_slave_p1_ras_n = main_sdram_dfi_p1_ras_n;
assign main_sdram_slave_p1_we_n = main_sdram_dfi_p1_we_n;
assign main_sdram_slave_p1_cke = main_sdram_dfi_p1_cke;
assign main_sdram_slave_p1_odt = main_sdram_dfi_p1_odt;
assign main_sdram_slave_p1_reset_n = main_sdram_dfi_p1_reset_n;
assign main_sdram_slave_p1_act_n = main_sdram_dfi_p1_act_n;
assign main_sdram_slave_p1_wrdata = main_sdram_dfi_p1_wrdata;
assign main_sdram_slave_p1_wrdata_en = main_sdram_dfi_p1_wrdata_en;
assign main_sdram_slave_p1_wrdata_mask = main_sdram_dfi_p1_wrdata_mask;
assign main_sdram_slave_p1_rddata_en = main_sdram_dfi_p1_rddata_en;
assign main_sdram_dfi_p1_rddata = main_sdram_slave_p1_rddata;
assign main_sdram_dfi_p1_rddata_valid = main_sdram_slave_p1_rddata_valid;
assign main_sdram_slave_p2_address = main_sdram_dfi_p2_address;
assign main_sdram_slave_p2_bank = main_sdram_dfi_p2_bank;
assign main_sdram_slave_p2_cas_n = main_sdram_dfi_p2_cas_n;
assign main_sdram_slave_p2_cs_n = main_sdram_dfi_p2_cs_n;
assign main_sdram_slave_p2_ras_n = main_sdram_dfi_p2_ras_n;
assign main_sdram_slave_p2_we_n = main_sdram_dfi_p2_we_n;
assign main_sdram_slave_p2_cke = main_sdram_dfi_p2_cke;
assign main_sdram_slave_p2_odt = main_sdram_dfi_p2_odt;
assign main_sdram_slave_p2_reset_n = main_sdram_dfi_p2_reset_n;
assign main_sdram_slave_p2_act_n = main_sdram_dfi_p2_act_n;
assign main_sdram_slave_p2_wrdata = main_sdram_dfi_p2_wrdata;
assign main_sdram_slave_p2_wrdata_en = main_sdram_dfi_p2_wrdata_en;
assign main_sdram_slave_p2_wrdata_mask = main_sdram_dfi_p2_wrdata_mask;
assign main_sdram_slave_p2_rddata_en = main_sdram_dfi_p2_rddata_en;
assign main_sdram_dfi_p2_rddata = main_sdram_slave_p2_rddata;
assign main_sdram_dfi_p2_rddata_valid = main_sdram_slave_p2_rddata_valid;
assign main_sdram_slave_p3_address = main_sdram_dfi_p3_address;
assign main_sdram_slave_p3_bank = main_sdram_dfi_p3_bank;
assign main_sdram_slave_p3_cas_n = main_sdram_dfi_p3_cas_n;
assign main_sdram_slave_p3_cs_n = main_sdram_dfi_p3_cs_n;
assign main_sdram_slave_p3_ras_n = main_sdram_dfi_p3_ras_n;
assign main_sdram_slave_p3_we_n = main_sdram_dfi_p3_we_n;
assign main_sdram_slave_p3_cke = main_sdram_dfi_p3_cke;
assign main_sdram_slave_p3_odt = main_sdram_dfi_p3_odt;
assign main_sdram_slave_p3_reset_n = main_sdram_dfi_p3_reset_n;
assign main_sdram_slave_p3_act_n = main_sdram_dfi_p3_act_n;
assign main_sdram_slave_p3_wrdata = main_sdram_dfi_p3_wrdata;
assign main_sdram_slave_p3_wrdata_en = main_sdram_dfi_p3_wrdata_en;
assign main_sdram_slave_p3_wrdata_mask = main_sdram_dfi_p3_wrdata_mask;
assign main_sdram_slave_p3_rddata_en = main_sdram_dfi_p3_rddata_en;
assign main_sdram_dfi_p3_rddata = main_sdram_slave_p3_rddata;
assign main_sdram_dfi_p3_rddata_valid = main_sdram_slave_p3_rddata_valid;
always @(*) begin
	main_sdram_slave_p3_rddata <= 32'd0;
	main_sdram_slave_p3_rddata_valid <= 1'd0;
	main_sdram_inti_p0_rddata <= 32'd0;
	main_sdram_inti_p0_rddata_valid <= 1'd0;
	main_sdram_master_p0_address <= 14'd0;
	main_sdram_master_p0_bank <= 3'd0;
	main_sdram_master_p0_cas_n <= 1'd1;
	main_sdram_master_p0_cs_n <= 1'd1;
	main_sdram_master_p0_ras_n <= 1'd1;
	main_sdram_master_p0_we_n <= 1'd1;
	main_sdram_master_p0_cke <= 1'd0;
	main_sdram_master_p0_odt <= 1'd0;
	main_sdram_master_p0_reset_n <= 1'd0;
	main_sdram_master_p0_act_n <= 1'd1;
	main_sdram_master_p0_wrdata <= 32'd0;
	main_sdram_inti_p1_rddata <= 32'd0;
	main_sdram_master_p0_wrdata_en <= 1'd0;
	main_sdram_inti_p1_rddata_valid <= 1'd0;
	main_sdram_master_p0_wrdata_mask <= 4'd0;
	main_sdram_master_p0_rddata_en <= 1'd0;
	main_sdram_master_p1_address <= 14'd0;
	main_sdram_master_p1_bank <= 3'd0;
	main_sdram_master_p1_cas_n <= 1'd1;
	main_sdram_master_p1_cs_n <= 1'd1;
	main_sdram_master_p1_ras_n <= 1'd1;
	main_sdram_master_p1_we_n <= 1'd1;
	main_sdram_master_p1_cke <= 1'd0;
	main_sdram_master_p1_odt <= 1'd0;
	main_sdram_master_p1_reset_n <= 1'd0;
	main_sdram_master_p1_act_n <= 1'd1;
	main_sdram_master_p1_wrdata <= 32'd0;
	main_sdram_inti_p2_rddata <= 32'd0;
	main_sdram_master_p1_wrdata_en <= 1'd0;
	main_sdram_inti_p2_rddata_valid <= 1'd0;
	main_sdram_master_p1_wrdata_mask <= 4'd0;
	main_sdram_master_p1_rddata_en <= 1'd0;
	main_sdram_master_p2_address <= 14'd0;
	main_sdram_master_p2_bank <= 3'd0;
	main_sdram_master_p2_cas_n <= 1'd1;
	main_sdram_master_p2_cs_n <= 1'd1;
	main_sdram_master_p2_ras_n <= 1'd1;
	main_sdram_master_p2_we_n <= 1'd1;
	main_sdram_master_p2_cke <= 1'd0;
	main_sdram_master_p2_odt <= 1'd0;
	main_sdram_master_p2_reset_n <= 1'd0;
	main_sdram_master_p2_act_n <= 1'd1;
	main_sdram_master_p2_wrdata <= 32'd0;
	main_sdram_inti_p3_rddata <= 32'd0;
	main_sdram_master_p2_wrdata_en <= 1'd0;
	main_sdram_inti_p3_rddata_valid <= 1'd0;
	main_sdram_master_p2_wrdata_mask <= 4'd0;
	main_sdram_master_p2_rddata_en <= 1'd0;
	main_sdram_master_p3_address <= 14'd0;
	main_sdram_master_p3_bank <= 3'd0;
	main_sdram_master_p3_cas_n <= 1'd1;
	main_sdram_master_p3_cs_n <= 1'd1;
	main_sdram_master_p3_ras_n <= 1'd1;
	main_sdram_master_p3_we_n <= 1'd1;
	main_sdram_master_p3_cke <= 1'd0;
	main_sdram_master_p3_odt <= 1'd0;
	main_sdram_master_p3_reset_n <= 1'd0;
	main_sdram_master_p3_act_n <= 1'd1;
	main_sdram_master_p3_wrdata <= 32'd0;
	main_sdram_master_p3_wrdata_en <= 1'd0;
	main_sdram_master_p3_wrdata_mask <= 4'd0;
	main_sdram_master_p3_rddata_en <= 1'd0;
	main_sdram_slave_p0_rddata <= 32'd0;
	main_sdram_slave_p0_rddata_valid <= 1'd0;
	main_sdram_slave_p1_rddata <= 32'd0;
	main_sdram_slave_p1_rddata_valid <= 1'd0;
	main_sdram_slave_p2_rddata <= 32'd0;
	main_sdram_slave_p2_rddata_valid <= 1'd0;
	if (main_sdram_storage[0]) begin
		main_sdram_master_p0_address <= main_sdram_slave_p0_address;
		main_sdram_master_p0_bank <= main_sdram_slave_p0_bank;
		main_sdram_master_p0_cas_n <= main_sdram_slave_p0_cas_n;
		main_sdram_master_p0_cs_n <= main_sdram_slave_p0_cs_n;
		main_sdram_master_p0_ras_n <= main_sdram_slave_p0_ras_n;
		main_sdram_master_p0_we_n <= main_sdram_slave_p0_we_n;
		main_sdram_master_p0_cke <= main_sdram_slave_p0_cke;
		main_sdram_master_p0_odt <= main_sdram_slave_p0_odt;
		main_sdram_master_p0_reset_n <= main_sdram_slave_p0_reset_n;
		main_sdram_master_p0_act_n <= main_sdram_slave_p0_act_n;
		main_sdram_master_p0_wrdata <= main_sdram_slave_p0_wrdata;
		main_sdram_master_p0_wrdata_en <= main_sdram_slave_p0_wrdata_en;
		main_sdram_master_p0_wrdata_mask <= main_sdram_slave_p0_wrdata_mask;
		main_sdram_master_p0_rddata_en <= main_sdram_slave_p0_rddata_en;
		main_sdram_slave_p0_rddata <= main_sdram_master_p0_rddata;
		main_sdram_slave_p0_rddata_valid <= main_sdram_master_p0_rddata_valid;
		main_sdram_master_p1_address <= main_sdram_slave_p1_address;
		main_sdram_master_p1_bank <= main_sdram_slave_p1_bank;
		main_sdram_master_p1_cas_n <= main_sdram_slave_p1_cas_n;
		main_sdram_master_p1_cs_n <= main_sdram_slave_p1_cs_n;
		main_sdram_master_p1_ras_n <= main_sdram_slave_p1_ras_n;
		main_sdram_master_p1_we_n <= main_sdram_slave_p1_we_n;
		main_sdram_master_p1_cke <= main_sdram_slave_p1_cke;
		main_sdram_master_p1_odt <= main_sdram_slave_p1_odt;
		main_sdram_master_p1_reset_n <= main_sdram_slave_p1_reset_n;
		main_sdram_master_p1_act_n <= main_sdram_slave_p1_act_n;
		main_sdram_master_p1_wrdata <= main_sdram_slave_p1_wrdata;
		main_sdram_master_p1_wrdata_en <= main_sdram_slave_p1_wrdata_en;
		main_sdram_master_p1_wrdata_mask <= main_sdram_slave_p1_wrdata_mask;
		main_sdram_master_p1_rddata_en <= main_sdram_slave_p1_rddata_en;
		main_sdram_slave_p1_rddata <= main_sdram_master_p1_rddata;
		main_sdram_slave_p1_rddata_valid <= main_sdram_master_p1_rddata_valid;
		main_sdram_master_p2_address <= main_sdram_slave_p2_address;
		main_sdram_master_p2_bank <= main_sdram_slave_p2_bank;
		main_sdram_master_p2_cas_n <= main_sdram_slave_p2_cas_n;
		main_sdram_master_p2_cs_n <= main_sdram_slave_p2_cs_n;
		main_sdram_master_p2_ras_n <= main_sdram_slave_p2_ras_n;
		main_sdram_master_p2_we_n <= main_sdram_slave_p2_we_n;
		main_sdram_master_p2_cke <= main_sdram_slave_p2_cke;
		main_sdram_master_p2_odt <= main_sdram_slave_p2_odt;
		main_sdram_master_p2_reset_n <= main_sdram_slave_p2_reset_n;
		main_sdram_master_p2_act_n <= main_sdram_slave_p2_act_n;
		main_sdram_master_p2_wrdata <= main_sdram_slave_p2_wrdata;
		main_sdram_master_p2_wrdata_en <= main_sdram_slave_p2_wrdata_en;
		main_sdram_master_p2_wrdata_mask <= main_sdram_slave_p2_wrdata_mask;
		main_sdram_master_p2_rddata_en <= main_sdram_slave_p2_rddata_en;
		main_sdram_slave_p2_rddata <= main_sdram_master_p2_rddata;
		main_sdram_slave_p2_rddata_valid <= main_sdram_master_p2_rddata_valid;
		main_sdram_master_p3_address <= main_sdram_slave_p3_address;
		main_sdram_master_p3_bank <= main_sdram_slave_p3_bank;
		main_sdram_master_p3_cas_n <= main_sdram_slave_p3_cas_n;
		main_sdram_master_p3_cs_n <= main_sdram_slave_p3_cs_n;
		main_sdram_master_p3_ras_n <= main_sdram_slave_p3_ras_n;
		main_sdram_master_p3_we_n <= main_sdram_slave_p3_we_n;
		main_sdram_master_p3_cke <= main_sdram_slave_p3_cke;
		main_sdram_master_p3_odt <= main_sdram_slave_p3_odt;
		main_sdram_master_p3_reset_n <= main_sdram_slave_p3_reset_n;
		main_sdram_master_p3_act_n <= main_sdram_slave_p3_act_n;
		main_sdram_master_p3_wrdata <= main_sdram_slave_p3_wrdata;
		main_sdram_master_p3_wrdata_en <= main_sdram_slave_p3_wrdata_en;
		main_sdram_master_p3_wrdata_mask <= main_sdram_slave_p3_wrdata_mask;
		main_sdram_master_p3_rddata_en <= main_sdram_slave_p3_rddata_en;
		main_sdram_slave_p3_rddata <= main_sdram_master_p3_rddata;
		main_sdram_slave_p3_rddata_valid <= main_sdram_master_p3_rddata_valid;
	end else begin
		main_sdram_master_p0_address <= main_sdram_inti_p0_address;
		main_sdram_master_p0_bank <= main_sdram_inti_p0_bank;
		main_sdram_master_p0_cas_n <= main_sdram_inti_p0_cas_n;
		main_sdram_master_p0_cs_n <= main_sdram_inti_p0_cs_n;
		main_sdram_master_p0_ras_n <= main_sdram_inti_p0_ras_n;
		main_sdram_master_p0_we_n <= main_sdram_inti_p0_we_n;
		main_sdram_master_p0_cke <= main_sdram_inti_p0_cke;
		main_sdram_master_p0_odt <= main_sdram_inti_p0_odt;
		main_sdram_master_p0_reset_n <= main_sdram_inti_p0_reset_n;
		main_sdram_master_p0_act_n <= main_sdram_inti_p0_act_n;
		main_sdram_master_p0_wrdata <= main_sdram_inti_p0_wrdata;
		main_sdram_master_p0_wrdata_en <= main_sdram_inti_p0_wrdata_en;
		main_sdram_master_p0_wrdata_mask <= main_sdram_inti_p0_wrdata_mask;
		main_sdram_master_p0_rddata_en <= main_sdram_inti_p0_rddata_en;
		main_sdram_inti_p0_rddata <= main_sdram_master_p0_rddata;
		main_sdram_inti_p0_rddata_valid <= main_sdram_master_p0_rddata_valid;
		main_sdram_master_p1_address <= main_sdram_inti_p1_address;
		main_sdram_master_p1_bank <= main_sdram_inti_p1_bank;
		main_sdram_master_p1_cas_n <= main_sdram_inti_p1_cas_n;
		main_sdram_master_p1_cs_n <= main_sdram_inti_p1_cs_n;
		main_sdram_master_p1_ras_n <= main_sdram_inti_p1_ras_n;
		main_sdram_master_p1_we_n <= main_sdram_inti_p1_we_n;
		main_sdram_master_p1_cke <= main_sdram_inti_p1_cke;
		main_sdram_master_p1_odt <= main_sdram_inti_p1_odt;
		main_sdram_master_p1_reset_n <= main_sdram_inti_p1_reset_n;
		main_sdram_master_p1_act_n <= main_sdram_inti_p1_act_n;
		main_sdram_master_p1_wrdata <= main_sdram_inti_p1_wrdata;
		main_sdram_master_p1_wrdata_en <= main_sdram_inti_p1_wrdata_en;
		main_sdram_master_p1_wrdata_mask <= main_sdram_inti_p1_wrdata_mask;
		main_sdram_master_p1_rddata_en <= main_sdram_inti_p1_rddata_en;
		main_sdram_inti_p1_rddata <= main_sdram_master_p1_rddata;
		main_sdram_inti_p1_rddata_valid <= main_sdram_master_p1_rddata_valid;
		main_sdram_master_p2_address <= main_sdram_inti_p2_address;
		main_sdram_master_p2_bank <= main_sdram_inti_p2_bank;
		main_sdram_master_p2_cas_n <= main_sdram_inti_p2_cas_n;
		main_sdram_master_p2_cs_n <= main_sdram_inti_p2_cs_n;
		main_sdram_master_p2_ras_n <= main_sdram_inti_p2_ras_n;
		main_sdram_master_p2_we_n <= main_sdram_inti_p2_we_n;
		main_sdram_master_p2_cke <= main_sdram_inti_p2_cke;
		main_sdram_master_p2_odt <= main_sdram_inti_p2_odt;
		main_sdram_master_p2_reset_n <= main_sdram_inti_p2_reset_n;
		main_sdram_master_p2_act_n <= main_sdram_inti_p2_act_n;
		main_sdram_master_p2_wrdata <= main_sdram_inti_p2_wrdata;
		main_sdram_master_p2_wrdata_en <= main_sdram_inti_p2_wrdata_en;
		main_sdram_master_p2_wrdata_mask <= main_sdram_inti_p2_wrdata_mask;
		main_sdram_master_p2_rddata_en <= main_sdram_inti_p2_rddata_en;
		main_sdram_inti_p2_rddata <= main_sdram_master_p2_rddata;
		main_sdram_inti_p2_rddata_valid <= main_sdram_master_p2_rddata_valid;
		main_sdram_master_p3_address <= main_sdram_inti_p3_address;
		main_sdram_master_p3_bank <= main_sdram_inti_p3_bank;
		main_sdram_master_p3_cas_n <= main_sdram_inti_p3_cas_n;
		main_sdram_master_p3_cs_n <= main_sdram_inti_p3_cs_n;
		main_sdram_master_p3_ras_n <= main_sdram_inti_p3_ras_n;
		main_sdram_master_p3_we_n <= main_sdram_inti_p3_we_n;
		main_sdram_master_p3_cke <= main_sdram_inti_p3_cke;
		main_sdram_master_p3_odt <= main_sdram_inti_p3_odt;
		main_sdram_master_p3_reset_n <= main_sdram_inti_p3_reset_n;
		main_sdram_master_p3_act_n <= main_sdram_inti_p3_act_n;
		main_sdram_master_p3_wrdata <= main_sdram_inti_p3_wrdata;
		main_sdram_master_p3_wrdata_en <= main_sdram_inti_p3_wrdata_en;
		main_sdram_master_p3_wrdata_mask <= main_sdram_inti_p3_wrdata_mask;
		main_sdram_master_p3_rddata_en <= main_sdram_inti_p3_rddata_en;
		main_sdram_inti_p3_rddata <= main_sdram_master_p3_rddata;
		main_sdram_inti_p3_rddata_valid <= main_sdram_master_p3_rddata_valid;
	end
end
assign main_sdram_inti_p0_cke = main_sdram_storage[1];
assign main_sdram_inti_p1_cke = main_sdram_storage[1];
assign main_sdram_inti_p2_cke = main_sdram_storage[1];
assign main_sdram_inti_p3_cke = main_sdram_storage[1];
assign main_sdram_inti_p0_odt = main_sdram_storage[2];
assign main_sdram_inti_p1_odt = main_sdram_storage[2];
assign main_sdram_inti_p2_odt = main_sdram_storage[2];
assign main_sdram_inti_p3_odt = main_sdram_storage[2];
assign main_sdram_inti_p0_reset_n = main_sdram_storage[3];
assign main_sdram_inti_p1_reset_n = main_sdram_storage[3];
assign main_sdram_inti_p2_reset_n = main_sdram_storage[3];
assign main_sdram_inti_p3_reset_n = main_sdram_storage[3];
always @(*) begin
	main_sdram_inti_p0_cas_n <= 1'd1;
	main_sdram_inti_p0_cs_n <= 1'd1;
	main_sdram_inti_p0_ras_n <= 1'd1;
	main_sdram_inti_p0_we_n <= 1'd1;
	if (main_sdram_phaseinjector0_command_issue_re) begin
		main_sdram_inti_p0_cs_n <= {1{(~main_sdram_phaseinjector0_command_storage[0])}};
		main_sdram_inti_p0_we_n <= (~main_sdram_phaseinjector0_command_storage[1]);
		main_sdram_inti_p0_cas_n <= (~main_sdram_phaseinjector0_command_storage[2]);
		main_sdram_inti_p0_ras_n <= (~main_sdram_phaseinjector0_command_storage[3]);
	end else begin
		main_sdram_inti_p0_cs_n <= {1{1'd1}};
		main_sdram_inti_p0_we_n <= 1'd1;
		main_sdram_inti_p0_cas_n <= 1'd1;
		main_sdram_inti_p0_ras_n <= 1'd1;
	end
end
assign main_sdram_inti_p0_address = main_sdram_phaseinjector0_address_storage;
assign main_sdram_inti_p0_bank = main_sdram_phaseinjector0_baddress_storage;
assign main_sdram_inti_p0_wrdata_en = (main_sdram_phaseinjector0_command_issue_re & main_sdram_phaseinjector0_command_storage[4]);
assign main_sdram_inti_p0_rddata_en = (main_sdram_phaseinjector0_command_issue_re & main_sdram_phaseinjector0_command_storage[5]);
assign main_sdram_inti_p0_wrdata = main_sdram_phaseinjector0_wrdata_storage;
assign main_sdram_inti_p0_wrdata_mask = 1'd0;
always @(*) begin
	main_sdram_inti_p1_cas_n <= 1'd1;
	main_sdram_inti_p1_cs_n <= 1'd1;
	main_sdram_inti_p1_ras_n <= 1'd1;
	main_sdram_inti_p1_we_n <= 1'd1;
	if (main_sdram_phaseinjector1_command_issue_re) begin
		main_sdram_inti_p1_cs_n <= {1{(~main_sdram_phaseinjector1_command_storage[0])}};
		main_sdram_inti_p1_we_n <= (~main_sdram_phaseinjector1_command_storage[1]);
		main_sdram_inti_p1_cas_n <= (~main_sdram_phaseinjector1_command_storage[2]);
		main_sdram_inti_p1_ras_n <= (~main_sdram_phaseinjector1_command_storage[3]);
	end else begin
		main_sdram_inti_p1_cs_n <= {1{1'd1}};
		main_sdram_inti_p1_we_n <= 1'd1;
		main_sdram_inti_p1_cas_n <= 1'd1;
		main_sdram_inti_p1_ras_n <= 1'd1;
	end
end
assign main_sdram_inti_p1_address = main_sdram_phaseinjector1_address_storage;
assign main_sdram_inti_p1_bank = main_sdram_phaseinjector1_baddress_storage;
assign main_sdram_inti_p1_wrdata_en = (main_sdram_phaseinjector1_command_issue_re & main_sdram_phaseinjector1_command_storage[4]);
assign main_sdram_inti_p1_rddata_en = (main_sdram_phaseinjector1_command_issue_re & main_sdram_phaseinjector1_command_storage[5]);
assign main_sdram_inti_p1_wrdata = main_sdram_phaseinjector1_wrdata_storage;
assign main_sdram_inti_p1_wrdata_mask = 1'd0;
always @(*) begin
	main_sdram_inti_p2_cas_n <= 1'd1;
	main_sdram_inti_p2_cs_n <= 1'd1;
	main_sdram_inti_p2_ras_n <= 1'd1;
	main_sdram_inti_p2_we_n <= 1'd1;
	if (main_sdram_phaseinjector2_command_issue_re) begin
		main_sdram_inti_p2_cs_n <= {1{(~main_sdram_phaseinjector2_command_storage[0])}};
		main_sdram_inti_p2_we_n <= (~main_sdram_phaseinjector2_command_storage[1]);
		main_sdram_inti_p2_cas_n <= (~main_sdram_phaseinjector2_command_storage[2]);
		main_sdram_inti_p2_ras_n <= (~main_sdram_phaseinjector2_command_storage[3]);
	end else begin
		main_sdram_inti_p2_cs_n <= {1{1'd1}};
		main_sdram_inti_p2_we_n <= 1'd1;
		main_sdram_inti_p2_cas_n <= 1'd1;
		main_sdram_inti_p2_ras_n <= 1'd1;
	end
end
assign main_sdram_inti_p2_address = main_sdram_phaseinjector2_address_storage;
assign main_sdram_inti_p2_bank = main_sdram_phaseinjector2_baddress_storage;
assign main_sdram_inti_p2_wrdata_en = (main_sdram_phaseinjector2_command_issue_re & main_sdram_phaseinjector2_command_storage[4]);
assign main_sdram_inti_p2_rddata_en = (main_sdram_phaseinjector2_command_issue_re & main_sdram_phaseinjector2_command_storage[5]);
assign main_sdram_inti_p2_wrdata = main_sdram_phaseinjector2_wrdata_storage;
assign main_sdram_inti_p2_wrdata_mask = 1'd0;
always @(*) begin
	main_sdram_inti_p3_cas_n <= 1'd1;
	main_sdram_inti_p3_cs_n <= 1'd1;
	main_sdram_inti_p3_ras_n <= 1'd1;
	main_sdram_inti_p3_we_n <= 1'd1;
	if (main_sdram_phaseinjector3_command_issue_re) begin
		main_sdram_inti_p3_cs_n <= {1{(~main_sdram_phaseinjector3_command_storage[0])}};
		main_sdram_inti_p3_we_n <= (~main_sdram_phaseinjector3_command_storage[1]);
		main_sdram_inti_p3_cas_n <= (~main_sdram_phaseinjector3_command_storage[2]);
		main_sdram_inti_p3_ras_n <= (~main_sdram_phaseinjector3_command_storage[3]);
	end else begin
		main_sdram_inti_p3_cs_n <= {1{1'd1}};
		main_sdram_inti_p3_we_n <= 1'd1;
		main_sdram_inti_p3_cas_n <= 1'd1;
		main_sdram_inti_p3_ras_n <= 1'd1;
	end
end
assign main_sdram_inti_p3_address = main_sdram_phaseinjector3_address_storage;
assign main_sdram_inti_p3_bank = main_sdram_phaseinjector3_baddress_storage;
assign main_sdram_inti_p3_wrdata_en = (main_sdram_phaseinjector3_command_issue_re & main_sdram_phaseinjector3_command_storage[4]);
assign main_sdram_inti_p3_rddata_en = (main_sdram_phaseinjector3_command_issue_re & main_sdram_phaseinjector3_command_storage[5]);
assign main_sdram_inti_p3_wrdata = main_sdram_phaseinjector3_wrdata_storage;
assign main_sdram_inti_p3_wrdata_mask = 1'd0;
assign main_sdram_bankmachine0_req_valid = main_sdram_interface_bank0_valid;
assign main_sdram_interface_bank0_ready = main_sdram_bankmachine0_req_ready;
assign main_sdram_bankmachine0_req_we = main_sdram_interface_bank0_we;
assign main_sdram_bankmachine0_req_addr = main_sdram_interface_bank0_addr;
assign main_sdram_interface_bank0_lock = main_sdram_bankmachine0_req_lock;
assign main_sdram_interface_bank0_wdata_ready = main_sdram_bankmachine0_req_wdata_ready;
assign main_sdram_interface_bank0_rdata_valid = main_sdram_bankmachine0_req_rdata_valid;
assign main_sdram_bankmachine1_req_valid = main_sdram_interface_bank1_valid;
assign main_sdram_interface_bank1_ready = main_sdram_bankmachine1_req_ready;
assign main_sdram_bankmachine1_req_we = main_sdram_interface_bank1_we;
assign main_sdram_bankmachine1_req_addr = main_sdram_interface_bank1_addr;
assign main_sdram_interface_bank1_lock = main_sdram_bankmachine1_req_lock;
assign main_sdram_interface_bank1_wdata_ready = main_sdram_bankmachine1_req_wdata_ready;
assign main_sdram_interface_bank1_rdata_valid = main_sdram_bankmachine1_req_rdata_valid;
assign main_sdram_bankmachine2_req_valid = main_sdram_interface_bank2_valid;
assign main_sdram_interface_bank2_ready = main_sdram_bankmachine2_req_ready;
assign main_sdram_bankmachine2_req_we = main_sdram_interface_bank2_we;
assign main_sdram_bankmachine2_req_addr = main_sdram_interface_bank2_addr;
assign main_sdram_interface_bank2_lock = main_sdram_bankmachine2_req_lock;
assign main_sdram_interface_bank2_wdata_ready = main_sdram_bankmachine2_req_wdata_ready;
assign main_sdram_interface_bank2_rdata_valid = main_sdram_bankmachine2_req_rdata_valid;
assign main_sdram_bankmachine3_req_valid = main_sdram_interface_bank3_valid;
assign main_sdram_interface_bank3_ready = main_sdram_bankmachine3_req_ready;
assign main_sdram_bankmachine3_req_we = main_sdram_interface_bank3_we;
assign main_sdram_bankmachine3_req_addr = main_sdram_interface_bank3_addr;
assign main_sdram_interface_bank3_lock = main_sdram_bankmachine3_req_lock;
assign main_sdram_interface_bank3_wdata_ready = main_sdram_bankmachine3_req_wdata_ready;
assign main_sdram_interface_bank3_rdata_valid = main_sdram_bankmachine3_req_rdata_valid;
assign main_sdram_bankmachine4_req_valid = main_sdram_interface_bank4_valid;
assign main_sdram_interface_bank4_ready = main_sdram_bankmachine4_req_ready;
assign main_sdram_bankmachine4_req_we = main_sdram_interface_bank4_we;
assign main_sdram_bankmachine4_req_addr = main_sdram_interface_bank4_addr;
assign main_sdram_interface_bank4_lock = main_sdram_bankmachine4_req_lock;
assign main_sdram_interface_bank4_wdata_ready = main_sdram_bankmachine4_req_wdata_ready;
assign main_sdram_interface_bank4_rdata_valid = main_sdram_bankmachine4_req_rdata_valid;
assign main_sdram_bankmachine5_req_valid = main_sdram_interface_bank5_valid;
assign main_sdram_interface_bank5_ready = main_sdram_bankmachine5_req_ready;
assign main_sdram_bankmachine5_req_we = main_sdram_interface_bank5_we;
assign main_sdram_bankmachine5_req_addr = main_sdram_interface_bank5_addr;
assign main_sdram_interface_bank5_lock = main_sdram_bankmachine5_req_lock;
assign main_sdram_interface_bank5_wdata_ready = main_sdram_bankmachine5_req_wdata_ready;
assign main_sdram_interface_bank5_rdata_valid = main_sdram_bankmachine5_req_rdata_valid;
assign main_sdram_bankmachine6_req_valid = main_sdram_interface_bank6_valid;
assign main_sdram_interface_bank6_ready = main_sdram_bankmachine6_req_ready;
assign main_sdram_bankmachine6_req_we = main_sdram_interface_bank6_we;
assign main_sdram_bankmachine6_req_addr = main_sdram_interface_bank6_addr;
assign main_sdram_interface_bank6_lock = main_sdram_bankmachine6_req_lock;
assign main_sdram_interface_bank6_wdata_ready = main_sdram_bankmachine6_req_wdata_ready;
assign main_sdram_interface_bank6_rdata_valid = main_sdram_bankmachine6_req_rdata_valid;
assign main_sdram_bankmachine7_req_valid = main_sdram_interface_bank7_valid;
assign main_sdram_interface_bank7_ready = main_sdram_bankmachine7_req_ready;
assign main_sdram_bankmachine7_req_we = main_sdram_interface_bank7_we;
assign main_sdram_bankmachine7_req_addr = main_sdram_interface_bank7_addr;
assign main_sdram_interface_bank7_lock = main_sdram_bankmachine7_req_lock;
assign main_sdram_interface_bank7_wdata_ready = main_sdram_bankmachine7_req_wdata_ready;
assign main_sdram_interface_bank7_rdata_valid = main_sdram_bankmachine7_req_rdata_valid;
assign main_sdram_timer_wait = (~main_sdram_timer_done0);
assign main_sdram_postponer_req_i = main_sdram_timer_done0;
assign main_sdram_wants_refresh = main_sdram_postponer_req_o;
assign main_sdram_wants_zqcs = main_sdram_zqcs_timer_done0;
assign main_sdram_zqcs_timer_wait = (~main_sdram_zqcs_executer_done);
assign main_sdram_timer_done1 = (main_sdram_timer_count1 == 1'd0);
assign main_sdram_timer_done0 = main_sdram_timer_done1;
assign main_sdram_timer_count0 = main_sdram_timer_count1;
assign main_sdram_sequencer_start1 = (main_sdram_sequencer_start0 | (main_sdram_sequencer_count != 1'd0));
assign main_sdram_sequencer_done0 = (main_sdram_sequencer_done1 & (main_sdram_sequencer_count == 1'd0));
assign main_sdram_zqcs_timer_done1 = (main_sdram_zqcs_timer_count1 == 1'd0);
assign main_sdram_zqcs_timer_done0 = main_sdram_zqcs_timer_done1;
assign main_sdram_zqcs_timer_count0 = main_sdram_zqcs_timer_count1;
always @(*) begin
	main_sdram_sequencer_start0 <= 1'd0;
	builder_refresher_next_state <= 2'd0;
	main_sdram_cmd_valid <= 1'd0;
	main_sdram_zqcs_executer_start <= 1'd0;
	main_sdram_cmd_last <= 1'd0;
	builder_refresher_next_state <= builder_refresher_state;
	case (builder_refresher_state)
		1'd1: begin
			main_sdram_cmd_valid <= 1'd1;
			if (main_sdram_cmd_ready) begin
				main_sdram_sequencer_start0 <= 1'd1;
				builder_refresher_next_state <= 2'd2;
			end
		end
		2'd2: begin
			main_sdram_cmd_valid <= 1'd1;
			if (main_sdram_sequencer_done0) begin
				if (main_sdram_wants_zqcs) begin
					main_sdram_zqcs_executer_start <= 1'd1;
					builder_refresher_next_state <= 2'd3;
				end else begin
					main_sdram_cmd_valid <= 1'd0;
					main_sdram_cmd_last <= 1'd1;
					builder_refresher_next_state <= 1'd0;
				end
			end
		end
		2'd3: begin
			main_sdram_cmd_valid <= 1'd1;
			if (main_sdram_zqcs_executer_done) begin
				main_sdram_cmd_valid <= 1'd0;
				main_sdram_cmd_last <= 1'd1;
				builder_refresher_next_state <= 1'd0;
			end
		end
		default: begin
			if (1'd1) begin
				if (main_sdram_wants_refresh) begin
					builder_refresher_next_state <= 1'd1;
				end
			end
		end
	endcase
end
assign main_sdram_bankmachine0_cmd_buffer_lookahead_sink_valid = main_sdram_bankmachine0_req_valid;
assign main_sdram_bankmachine0_req_ready = main_sdram_bankmachine0_cmd_buffer_lookahead_sink_ready;
assign main_sdram_bankmachine0_cmd_buffer_lookahead_sink_payload_we = main_sdram_bankmachine0_req_we;
assign main_sdram_bankmachine0_cmd_buffer_lookahead_sink_payload_addr = main_sdram_bankmachine0_req_addr;
assign main_sdram_bankmachine0_cmd_buffer_sink_valid = main_sdram_bankmachine0_cmd_buffer_lookahead_source_valid;
assign main_sdram_bankmachine0_cmd_buffer_lookahead_source_ready = main_sdram_bankmachine0_cmd_buffer_sink_ready;
assign main_sdram_bankmachine0_cmd_buffer_sink_first = main_sdram_bankmachine0_cmd_buffer_lookahead_source_first;
assign main_sdram_bankmachine0_cmd_buffer_sink_last = main_sdram_bankmachine0_cmd_buffer_lookahead_source_last;
assign main_sdram_bankmachine0_cmd_buffer_sink_payload_we = main_sdram_bankmachine0_cmd_buffer_lookahead_source_payload_we;
assign main_sdram_bankmachine0_cmd_buffer_sink_payload_addr = main_sdram_bankmachine0_cmd_buffer_lookahead_source_payload_addr;
assign main_sdram_bankmachine0_cmd_buffer_source_ready = (main_sdram_bankmachine0_req_wdata_ready | main_sdram_bankmachine0_req_rdata_valid);
assign main_sdram_bankmachine0_req_lock = (main_sdram_bankmachine0_cmd_buffer_lookahead_source_valid | main_sdram_bankmachine0_cmd_buffer_source_valid);
assign main_sdram_bankmachine0_row_hit = (main_sdram_bankmachine0_row == main_sdram_bankmachine0_cmd_buffer_source_payload_addr[20:7]);
assign main_sdram_bankmachine0_cmd_payload_ba = 1'd0;
always @(*) begin
	main_sdram_bankmachine0_cmd_payload_a <= 14'd0;
	if (main_sdram_bankmachine0_row_col_n_addr_sel) begin
		main_sdram_bankmachine0_cmd_payload_a <= main_sdram_bankmachine0_cmd_buffer_source_payload_addr[20:7];
	end else begin
		main_sdram_bankmachine0_cmd_payload_a <= ((main_sdram_bankmachine0_auto_precharge <<< 4'd10) | {main_sdram_bankmachine0_cmd_buffer_source_payload_addr[6:0], {3{1'd0}}});
	end
end
assign main_sdram_bankmachine0_twtpcon_valid = ((main_sdram_bankmachine0_cmd_valid & main_sdram_bankmachine0_cmd_ready) & main_sdram_bankmachine0_cmd_payload_is_write);
assign main_sdram_bankmachine0_trccon_valid = ((main_sdram_bankmachine0_cmd_valid & main_sdram_bankmachine0_cmd_ready) & main_sdram_bankmachine0_row_open);
assign main_sdram_bankmachine0_trascon_valid = ((main_sdram_bankmachine0_cmd_valid & main_sdram_bankmachine0_cmd_ready) & main_sdram_bankmachine0_row_open);
always @(*) begin
	main_sdram_bankmachine0_auto_precharge <= 1'd0;
	if ((main_sdram_bankmachine0_cmd_buffer_lookahead_source_valid & main_sdram_bankmachine0_cmd_buffer_source_valid)) begin
		if ((main_sdram_bankmachine0_cmd_buffer_lookahead_source_payload_addr[20:7] != main_sdram_bankmachine0_cmd_buffer_source_payload_addr[20:7])) begin
			main_sdram_bankmachine0_auto_precharge <= (main_sdram_bankmachine0_row_close == 1'd0);
		end
	end
end
assign main_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_din = {main_sdram_bankmachine0_cmd_buffer_lookahead_fifo_in_last, main_sdram_bankmachine0_cmd_buffer_lookahead_fifo_in_first, main_sdram_bankmachine0_cmd_buffer_lookahead_fifo_in_payload_addr, main_sdram_bankmachine0_cmd_buffer_lookahead_fifo_in_payload_we};
assign {main_sdram_bankmachine0_cmd_buffer_lookahead_fifo_out_last, main_sdram_bankmachine0_cmd_buffer_lookahead_fifo_out_first, main_sdram_bankmachine0_cmd_buffer_lookahead_fifo_out_payload_addr, main_sdram_bankmachine0_cmd_buffer_lookahead_fifo_out_payload_we} = main_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_dout;
assign main_sdram_bankmachine0_cmd_buffer_lookahead_sink_ready = main_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_writable;
assign main_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_we = main_sdram_bankmachine0_cmd_buffer_lookahead_sink_valid;
assign main_sdram_bankmachine0_cmd_buffer_lookahead_fifo_in_first = main_sdram_bankmachine0_cmd_buffer_lookahead_sink_first;
assign main_sdram_bankmachine0_cmd_buffer_lookahead_fifo_in_last = main_sdram_bankmachine0_cmd_buffer_lookahead_sink_last;
assign main_sdram_bankmachine0_cmd_buffer_lookahead_fifo_in_payload_we = main_sdram_bankmachine0_cmd_buffer_lookahead_sink_payload_we;
assign main_sdram_bankmachine0_cmd_buffer_lookahead_fifo_in_payload_addr = main_sdram_bankmachine0_cmd_buffer_lookahead_sink_payload_addr;
assign main_sdram_bankmachine0_cmd_buffer_lookahead_source_valid = main_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_readable;
assign main_sdram_bankmachine0_cmd_buffer_lookahead_source_first = main_sdram_bankmachine0_cmd_buffer_lookahead_fifo_out_first;
assign main_sdram_bankmachine0_cmd_buffer_lookahead_source_last = main_sdram_bankmachine0_cmd_buffer_lookahead_fifo_out_last;
assign main_sdram_bankmachine0_cmd_buffer_lookahead_source_payload_we = main_sdram_bankmachine0_cmd_buffer_lookahead_fifo_out_payload_we;
assign main_sdram_bankmachine0_cmd_buffer_lookahead_source_payload_addr = main_sdram_bankmachine0_cmd_buffer_lookahead_fifo_out_payload_addr;
assign main_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_re = main_sdram_bankmachine0_cmd_buffer_lookahead_source_ready;
always @(*) begin
	main_sdram_bankmachine0_cmd_buffer_lookahead_wrport_adr <= 3'd0;
	if (main_sdram_bankmachine0_cmd_buffer_lookahead_replace) begin
		main_sdram_bankmachine0_cmd_buffer_lookahead_wrport_adr <= (main_sdram_bankmachine0_cmd_buffer_lookahead_produce - 1'd1);
	end else begin
		main_sdram_bankmachine0_cmd_buffer_lookahead_wrport_adr <= main_sdram_bankmachine0_cmd_buffer_lookahead_produce;
	end
end
assign main_sdram_bankmachine0_cmd_buffer_lookahead_wrport_dat_w = main_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_din;
assign main_sdram_bankmachine0_cmd_buffer_lookahead_wrport_we = (main_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_we & (main_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_writable | main_sdram_bankmachine0_cmd_buffer_lookahead_replace));
assign main_sdram_bankmachine0_cmd_buffer_lookahead_do_read = (main_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_readable & main_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_re);
assign main_sdram_bankmachine0_cmd_buffer_lookahead_rdport_adr = main_sdram_bankmachine0_cmd_buffer_lookahead_consume;
assign main_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_dout = main_sdram_bankmachine0_cmd_buffer_lookahead_rdport_dat_r;
assign main_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_writable = (main_sdram_bankmachine0_cmd_buffer_lookahead_level != 4'd8);
assign main_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_readable = (main_sdram_bankmachine0_cmd_buffer_lookahead_level != 1'd0);
assign main_sdram_bankmachine0_cmd_buffer_sink_ready = ((~main_sdram_bankmachine0_cmd_buffer_source_valid) | main_sdram_bankmachine0_cmd_buffer_source_ready);
always @(*) begin
	main_sdram_bankmachine0_cmd_payload_we <= 1'd0;
	main_sdram_bankmachine0_row_col_n_addr_sel <= 1'd0;
	main_sdram_bankmachine0_cmd_payload_is_cmd <= 1'd0;
	builder_bankmachine0_next_state <= 4'd0;
	main_sdram_bankmachine0_cmd_payload_is_read <= 1'd0;
	main_sdram_bankmachine0_cmd_payload_is_write <= 1'd0;
	main_sdram_bankmachine0_req_wdata_ready <= 1'd0;
	main_sdram_bankmachine0_req_rdata_valid <= 1'd0;
	main_sdram_bankmachine0_refresh_gnt <= 1'd0;
	main_sdram_bankmachine0_cmd_valid <= 1'd0;
	main_sdram_bankmachine0_row_open <= 1'd0;
	main_sdram_bankmachine0_row_close <= 1'd0;
	main_sdram_bankmachine0_cmd_payload_cas <= 1'd0;
	main_sdram_bankmachine0_cmd_payload_ras <= 1'd0;
	builder_bankmachine0_next_state <= builder_bankmachine0_state;
	case (builder_bankmachine0_state)
		1'd1: begin
			if ((main_sdram_bankmachine0_twtpcon_ready & main_sdram_bankmachine0_trascon_ready)) begin
				main_sdram_bankmachine0_cmd_valid <= 1'd1;
				if (main_sdram_bankmachine0_cmd_ready) begin
					builder_bankmachine0_next_state <= 3'd5;
				end
				main_sdram_bankmachine0_cmd_payload_ras <= 1'd1;
				main_sdram_bankmachine0_cmd_payload_we <= 1'd1;
				main_sdram_bankmachine0_cmd_payload_is_cmd <= 1'd1;
			end
			main_sdram_bankmachine0_row_close <= 1'd1;
		end
		2'd2: begin
			if ((main_sdram_bankmachine0_twtpcon_ready & main_sdram_bankmachine0_trascon_ready)) begin
				builder_bankmachine0_next_state <= 3'd5;
			end
			main_sdram_bankmachine0_row_close <= 1'd1;
		end
		2'd3: begin
			if (main_sdram_bankmachine0_trccon_ready) begin
				main_sdram_bankmachine0_row_col_n_addr_sel <= 1'd1;
				main_sdram_bankmachine0_row_open <= 1'd1;
				main_sdram_bankmachine0_cmd_valid <= 1'd1;
				main_sdram_bankmachine0_cmd_payload_is_cmd <= 1'd1;
				if (main_sdram_bankmachine0_cmd_ready) begin
					builder_bankmachine0_next_state <= 3'd7;
				end
				main_sdram_bankmachine0_cmd_payload_ras <= 1'd1;
			end
		end
		3'd4: begin
			if (main_sdram_bankmachine0_twtpcon_ready) begin
				main_sdram_bankmachine0_refresh_gnt <= 1'd1;
			end
			main_sdram_bankmachine0_row_close <= 1'd1;
			main_sdram_bankmachine0_cmd_payload_is_cmd <= 1'd1;
			if ((~main_sdram_bankmachine0_refresh_req)) begin
				builder_bankmachine0_next_state <= 1'd0;
			end
		end
		3'd5: begin
			builder_bankmachine0_next_state <= 3'd6;
		end
		3'd6: begin
			builder_bankmachine0_next_state <= 2'd3;
		end
		3'd7: begin
			builder_bankmachine0_next_state <= 4'd8;
		end
		4'd8: begin
			builder_bankmachine0_next_state <= 1'd0;
		end
		default: begin
			if (main_sdram_bankmachine0_refresh_req) begin
				builder_bankmachine0_next_state <= 3'd4;
			end else begin
				if (main_sdram_bankmachine0_cmd_buffer_source_valid) begin
					if (main_sdram_bankmachine0_row_opened) begin
						if (main_sdram_bankmachine0_row_hit) begin
							main_sdram_bankmachine0_cmd_valid <= 1'd1;
							if (main_sdram_bankmachine0_cmd_buffer_source_payload_we) begin
								main_sdram_bankmachine0_req_wdata_ready <= main_sdram_bankmachine0_cmd_ready;
								main_sdram_bankmachine0_cmd_payload_is_write <= 1'd1;
								main_sdram_bankmachine0_cmd_payload_we <= 1'd1;
							end else begin
								main_sdram_bankmachine0_req_rdata_valid <= main_sdram_bankmachine0_cmd_ready;
								main_sdram_bankmachine0_cmd_payload_is_read <= 1'd1;
							end
							main_sdram_bankmachine0_cmd_payload_cas <= 1'd1;
							if ((main_sdram_bankmachine0_cmd_ready & main_sdram_bankmachine0_auto_precharge)) begin
								builder_bankmachine0_next_state <= 2'd2;
							end
						end else begin
							builder_bankmachine0_next_state <= 1'd1;
						end
					end else begin
						builder_bankmachine0_next_state <= 2'd3;
					end
				end
			end
		end
	endcase
end
assign main_sdram_bankmachine1_cmd_buffer_lookahead_sink_valid = main_sdram_bankmachine1_req_valid;
assign main_sdram_bankmachine1_req_ready = main_sdram_bankmachine1_cmd_buffer_lookahead_sink_ready;
assign main_sdram_bankmachine1_cmd_buffer_lookahead_sink_payload_we = main_sdram_bankmachine1_req_we;
assign main_sdram_bankmachine1_cmd_buffer_lookahead_sink_payload_addr = main_sdram_bankmachine1_req_addr;
assign main_sdram_bankmachine1_cmd_buffer_sink_valid = main_sdram_bankmachine1_cmd_buffer_lookahead_source_valid;
assign main_sdram_bankmachine1_cmd_buffer_lookahead_source_ready = main_sdram_bankmachine1_cmd_buffer_sink_ready;
assign main_sdram_bankmachine1_cmd_buffer_sink_first = main_sdram_bankmachine1_cmd_buffer_lookahead_source_first;
assign main_sdram_bankmachine1_cmd_buffer_sink_last = main_sdram_bankmachine1_cmd_buffer_lookahead_source_last;
assign main_sdram_bankmachine1_cmd_buffer_sink_payload_we = main_sdram_bankmachine1_cmd_buffer_lookahead_source_payload_we;
assign main_sdram_bankmachine1_cmd_buffer_sink_payload_addr = main_sdram_bankmachine1_cmd_buffer_lookahead_source_payload_addr;
assign main_sdram_bankmachine1_cmd_buffer_source_ready = (main_sdram_bankmachine1_req_wdata_ready | main_sdram_bankmachine1_req_rdata_valid);
assign main_sdram_bankmachine1_req_lock = (main_sdram_bankmachine1_cmd_buffer_lookahead_source_valid | main_sdram_bankmachine1_cmd_buffer_source_valid);
assign main_sdram_bankmachine1_row_hit = (main_sdram_bankmachine1_row == main_sdram_bankmachine1_cmd_buffer_source_payload_addr[20:7]);
assign main_sdram_bankmachine1_cmd_payload_ba = 1'd1;
always @(*) begin
	main_sdram_bankmachine1_cmd_payload_a <= 14'd0;
	if (main_sdram_bankmachine1_row_col_n_addr_sel) begin
		main_sdram_bankmachine1_cmd_payload_a <= main_sdram_bankmachine1_cmd_buffer_source_payload_addr[20:7];
	end else begin
		main_sdram_bankmachine1_cmd_payload_a <= ((main_sdram_bankmachine1_auto_precharge <<< 4'd10) | {main_sdram_bankmachine1_cmd_buffer_source_payload_addr[6:0], {3{1'd0}}});
	end
end
assign main_sdram_bankmachine1_twtpcon_valid = ((main_sdram_bankmachine1_cmd_valid & main_sdram_bankmachine1_cmd_ready) & main_sdram_bankmachine1_cmd_payload_is_write);
assign main_sdram_bankmachine1_trccon_valid = ((main_sdram_bankmachine1_cmd_valid & main_sdram_bankmachine1_cmd_ready) & main_sdram_bankmachine1_row_open);
assign main_sdram_bankmachine1_trascon_valid = ((main_sdram_bankmachine1_cmd_valid & main_sdram_bankmachine1_cmd_ready) & main_sdram_bankmachine1_row_open);
always @(*) begin
	main_sdram_bankmachine1_auto_precharge <= 1'd0;
	if ((main_sdram_bankmachine1_cmd_buffer_lookahead_source_valid & main_sdram_bankmachine1_cmd_buffer_source_valid)) begin
		if ((main_sdram_bankmachine1_cmd_buffer_lookahead_source_payload_addr[20:7] != main_sdram_bankmachine1_cmd_buffer_source_payload_addr[20:7])) begin
			main_sdram_bankmachine1_auto_precharge <= (main_sdram_bankmachine1_row_close == 1'd0);
		end
	end
end
assign main_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_din = {main_sdram_bankmachine1_cmd_buffer_lookahead_fifo_in_last, main_sdram_bankmachine1_cmd_buffer_lookahead_fifo_in_first, main_sdram_bankmachine1_cmd_buffer_lookahead_fifo_in_payload_addr, main_sdram_bankmachine1_cmd_buffer_lookahead_fifo_in_payload_we};
assign {main_sdram_bankmachine1_cmd_buffer_lookahead_fifo_out_last, main_sdram_bankmachine1_cmd_buffer_lookahead_fifo_out_first, main_sdram_bankmachine1_cmd_buffer_lookahead_fifo_out_payload_addr, main_sdram_bankmachine1_cmd_buffer_lookahead_fifo_out_payload_we} = main_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_dout;
assign main_sdram_bankmachine1_cmd_buffer_lookahead_sink_ready = main_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_writable;
assign main_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_we = main_sdram_bankmachine1_cmd_buffer_lookahead_sink_valid;
assign main_sdram_bankmachine1_cmd_buffer_lookahead_fifo_in_first = main_sdram_bankmachine1_cmd_buffer_lookahead_sink_first;
assign main_sdram_bankmachine1_cmd_buffer_lookahead_fifo_in_last = main_sdram_bankmachine1_cmd_buffer_lookahead_sink_last;
assign main_sdram_bankmachine1_cmd_buffer_lookahead_fifo_in_payload_we = main_sdram_bankmachine1_cmd_buffer_lookahead_sink_payload_we;
assign main_sdram_bankmachine1_cmd_buffer_lookahead_fifo_in_payload_addr = main_sdram_bankmachine1_cmd_buffer_lookahead_sink_payload_addr;
assign main_sdram_bankmachine1_cmd_buffer_lookahead_source_valid = main_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_readable;
assign main_sdram_bankmachine1_cmd_buffer_lookahead_source_first = main_sdram_bankmachine1_cmd_buffer_lookahead_fifo_out_first;
assign main_sdram_bankmachine1_cmd_buffer_lookahead_source_last = main_sdram_bankmachine1_cmd_buffer_lookahead_fifo_out_last;
assign main_sdram_bankmachine1_cmd_buffer_lookahead_source_payload_we = main_sdram_bankmachine1_cmd_buffer_lookahead_fifo_out_payload_we;
assign main_sdram_bankmachine1_cmd_buffer_lookahead_source_payload_addr = main_sdram_bankmachine1_cmd_buffer_lookahead_fifo_out_payload_addr;
assign main_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_re = main_sdram_bankmachine1_cmd_buffer_lookahead_source_ready;
always @(*) begin
	main_sdram_bankmachine1_cmd_buffer_lookahead_wrport_adr <= 3'd0;
	if (main_sdram_bankmachine1_cmd_buffer_lookahead_replace) begin
		main_sdram_bankmachine1_cmd_buffer_lookahead_wrport_adr <= (main_sdram_bankmachine1_cmd_buffer_lookahead_produce - 1'd1);
	end else begin
		main_sdram_bankmachine1_cmd_buffer_lookahead_wrport_adr <= main_sdram_bankmachine1_cmd_buffer_lookahead_produce;
	end
end
assign main_sdram_bankmachine1_cmd_buffer_lookahead_wrport_dat_w = main_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_din;
assign main_sdram_bankmachine1_cmd_buffer_lookahead_wrport_we = (main_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_we & (main_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_writable | main_sdram_bankmachine1_cmd_buffer_lookahead_replace));
assign main_sdram_bankmachine1_cmd_buffer_lookahead_do_read = (main_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_readable & main_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_re);
assign main_sdram_bankmachine1_cmd_buffer_lookahead_rdport_adr = main_sdram_bankmachine1_cmd_buffer_lookahead_consume;
assign main_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_dout = main_sdram_bankmachine1_cmd_buffer_lookahead_rdport_dat_r;
assign main_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_writable = (main_sdram_bankmachine1_cmd_buffer_lookahead_level != 4'd8);
assign main_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_readable = (main_sdram_bankmachine1_cmd_buffer_lookahead_level != 1'd0);
assign main_sdram_bankmachine1_cmd_buffer_sink_ready = ((~main_sdram_bankmachine1_cmd_buffer_source_valid) | main_sdram_bankmachine1_cmd_buffer_source_ready);
always @(*) begin
	main_sdram_bankmachine1_cmd_payload_we <= 1'd0;
	main_sdram_bankmachine1_row_col_n_addr_sel <= 1'd0;
	main_sdram_bankmachine1_cmd_payload_is_cmd <= 1'd0;
	builder_bankmachine1_next_state <= 4'd0;
	main_sdram_bankmachine1_cmd_payload_is_read <= 1'd0;
	main_sdram_bankmachine1_cmd_payload_is_write <= 1'd0;
	main_sdram_bankmachine1_req_wdata_ready <= 1'd0;
	main_sdram_bankmachine1_req_rdata_valid <= 1'd0;
	main_sdram_bankmachine1_refresh_gnt <= 1'd0;
	main_sdram_bankmachine1_cmd_valid <= 1'd0;
	main_sdram_bankmachine1_row_open <= 1'd0;
	main_sdram_bankmachine1_row_close <= 1'd0;
	main_sdram_bankmachine1_cmd_payload_cas <= 1'd0;
	main_sdram_bankmachine1_cmd_payload_ras <= 1'd0;
	builder_bankmachine1_next_state <= builder_bankmachine1_state;
	case (builder_bankmachine1_state)
		1'd1: begin
			if ((main_sdram_bankmachine1_twtpcon_ready & main_sdram_bankmachine1_trascon_ready)) begin
				main_sdram_bankmachine1_cmd_valid <= 1'd1;
				if (main_sdram_bankmachine1_cmd_ready) begin
					builder_bankmachine1_next_state <= 3'd5;
				end
				main_sdram_bankmachine1_cmd_payload_ras <= 1'd1;
				main_sdram_bankmachine1_cmd_payload_we <= 1'd1;
				main_sdram_bankmachine1_cmd_payload_is_cmd <= 1'd1;
			end
			main_sdram_bankmachine1_row_close <= 1'd1;
		end
		2'd2: begin
			if ((main_sdram_bankmachine1_twtpcon_ready & main_sdram_bankmachine1_trascon_ready)) begin
				builder_bankmachine1_next_state <= 3'd5;
			end
			main_sdram_bankmachine1_row_close <= 1'd1;
		end
		2'd3: begin
			if (main_sdram_bankmachine1_trccon_ready) begin
				main_sdram_bankmachine1_row_col_n_addr_sel <= 1'd1;
				main_sdram_bankmachine1_row_open <= 1'd1;
				main_sdram_bankmachine1_cmd_valid <= 1'd1;
				main_sdram_bankmachine1_cmd_payload_is_cmd <= 1'd1;
				if (main_sdram_bankmachine1_cmd_ready) begin
					builder_bankmachine1_next_state <= 3'd7;
				end
				main_sdram_bankmachine1_cmd_payload_ras <= 1'd1;
			end
		end
		3'd4: begin
			if (main_sdram_bankmachine1_twtpcon_ready) begin
				main_sdram_bankmachine1_refresh_gnt <= 1'd1;
			end
			main_sdram_bankmachine1_row_close <= 1'd1;
			main_sdram_bankmachine1_cmd_payload_is_cmd <= 1'd1;
			if ((~main_sdram_bankmachine1_refresh_req)) begin
				builder_bankmachine1_next_state <= 1'd0;
			end
		end
		3'd5: begin
			builder_bankmachine1_next_state <= 3'd6;
		end
		3'd6: begin
			builder_bankmachine1_next_state <= 2'd3;
		end
		3'd7: begin
			builder_bankmachine1_next_state <= 4'd8;
		end
		4'd8: begin
			builder_bankmachine1_next_state <= 1'd0;
		end
		default: begin
			if (main_sdram_bankmachine1_refresh_req) begin
				builder_bankmachine1_next_state <= 3'd4;
			end else begin
				if (main_sdram_bankmachine1_cmd_buffer_source_valid) begin
					if (main_sdram_bankmachine1_row_opened) begin
						if (main_sdram_bankmachine1_row_hit) begin
							main_sdram_bankmachine1_cmd_valid <= 1'd1;
							if (main_sdram_bankmachine1_cmd_buffer_source_payload_we) begin
								main_sdram_bankmachine1_req_wdata_ready <= main_sdram_bankmachine1_cmd_ready;
								main_sdram_bankmachine1_cmd_payload_is_write <= 1'd1;
								main_sdram_bankmachine1_cmd_payload_we <= 1'd1;
							end else begin
								main_sdram_bankmachine1_req_rdata_valid <= main_sdram_bankmachine1_cmd_ready;
								main_sdram_bankmachine1_cmd_payload_is_read <= 1'd1;
							end
							main_sdram_bankmachine1_cmd_payload_cas <= 1'd1;
							if ((main_sdram_bankmachine1_cmd_ready & main_sdram_bankmachine1_auto_precharge)) begin
								builder_bankmachine1_next_state <= 2'd2;
							end
						end else begin
							builder_bankmachine1_next_state <= 1'd1;
						end
					end else begin
						builder_bankmachine1_next_state <= 2'd3;
					end
				end
			end
		end
	endcase
end
assign main_sdram_bankmachine2_cmd_buffer_lookahead_sink_valid = main_sdram_bankmachine2_req_valid;
assign main_sdram_bankmachine2_req_ready = main_sdram_bankmachine2_cmd_buffer_lookahead_sink_ready;
assign main_sdram_bankmachine2_cmd_buffer_lookahead_sink_payload_we = main_sdram_bankmachine2_req_we;
assign main_sdram_bankmachine2_cmd_buffer_lookahead_sink_payload_addr = main_sdram_bankmachine2_req_addr;
assign main_sdram_bankmachine2_cmd_buffer_sink_valid = main_sdram_bankmachine2_cmd_buffer_lookahead_source_valid;
assign main_sdram_bankmachine2_cmd_buffer_lookahead_source_ready = main_sdram_bankmachine2_cmd_buffer_sink_ready;
assign main_sdram_bankmachine2_cmd_buffer_sink_first = main_sdram_bankmachine2_cmd_buffer_lookahead_source_first;
assign main_sdram_bankmachine2_cmd_buffer_sink_last = main_sdram_bankmachine2_cmd_buffer_lookahead_source_last;
assign main_sdram_bankmachine2_cmd_buffer_sink_payload_we = main_sdram_bankmachine2_cmd_buffer_lookahead_source_payload_we;
assign main_sdram_bankmachine2_cmd_buffer_sink_payload_addr = main_sdram_bankmachine2_cmd_buffer_lookahead_source_payload_addr;
assign main_sdram_bankmachine2_cmd_buffer_source_ready = (main_sdram_bankmachine2_req_wdata_ready | main_sdram_bankmachine2_req_rdata_valid);
assign main_sdram_bankmachine2_req_lock = (main_sdram_bankmachine2_cmd_buffer_lookahead_source_valid | main_sdram_bankmachine2_cmd_buffer_source_valid);
assign main_sdram_bankmachine2_row_hit = (main_sdram_bankmachine2_row == main_sdram_bankmachine2_cmd_buffer_source_payload_addr[20:7]);
assign main_sdram_bankmachine2_cmd_payload_ba = 2'd2;
always @(*) begin
	main_sdram_bankmachine2_cmd_payload_a <= 14'd0;
	if (main_sdram_bankmachine2_row_col_n_addr_sel) begin
		main_sdram_bankmachine2_cmd_payload_a <= main_sdram_bankmachine2_cmd_buffer_source_payload_addr[20:7];
	end else begin
		main_sdram_bankmachine2_cmd_payload_a <= ((main_sdram_bankmachine2_auto_precharge <<< 4'd10) | {main_sdram_bankmachine2_cmd_buffer_source_payload_addr[6:0], {3{1'd0}}});
	end
end
assign main_sdram_bankmachine2_twtpcon_valid = ((main_sdram_bankmachine2_cmd_valid & main_sdram_bankmachine2_cmd_ready) & main_sdram_bankmachine2_cmd_payload_is_write);
assign main_sdram_bankmachine2_trccon_valid = ((main_sdram_bankmachine2_cmd_valid & main_sdram_bankmachine2_cmd_ready) & main_sdram_bankmachine2_row_open);
assign main_sdram_bankmachine2_trascon_valid = ((main_sdram_bankmachine2_cmd_valid & main_sdram_bankmachine2_cmd_ready) & main_sdram_bankmachine2_row_open);
always @(*) begin
	main_sdram_bankmachine2_auto_precharge <= 1'd0;
	if ((main_sdram_bankmachine2_cmd_buffer_lookahead_source_valid & main_sdram_bankmachine2_cmd_buffer_source_valid)) begin
		if ((main_sdram_bankmachine2_cmd_buffer_lookahead_source_payload_addr[20:7] != main_sdram_bankmachine2_cmd_buffer_source_payload_addr[20:7])) begin
			main_sdram_bankmachine2_auto_precharge <= (main_sdram_bankmachine2_row_close == 1'd0);
		end
	end
end
assign main_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_din = {main_sdram_bankmachine2_cmd_buffer_lookahead_fifo_in_last, main_sdram_bankmachine2_cmd_buffer_lookahead_fifo_in_first, main_sdram_bankmachine2_cmd_buffer_lookahead_fifo_in_payload_addr, main_sdram_bankmachine2_cmd_buffer_lookahead_fifo_in_payload_we};
assign {main_sdram_bankmachine2_cmd_buffer_lookahead_fifo_out_last, main_sdram_bankmachine2_cmd_buffer_lookahead_fifo_out_first, main_sdram_bankmachine2_cmd_buffer_lookahead_fifo_out_payload_addr, main_sdram_bankmachine2_cmd_buffer_lookahead_fifo_out_payload_we} = main_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_dout;
assign main_sdram_bankmachine2_cmd_buffer_lookahead_sink_ready = main_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_writable;
assign main_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_we = main_sdram_bankmachine2_cmd_buffer_lookahead_sink_valid;
assign main_sdram_bankmachine2_cmd_buffer_lookahead_fifo_in_first = main_sdram_bankmachine2_cmd_buffer_lookahead_sink_first;
assign main_sdram_bankmachine2_cmd_buffer_lookahead_fifo_in_last = main_sdram_bankmachine2_cmd_buffer_lookahead_sink_last;
assign main_sdram_bankmachine2_cmd_buffer_lookahead_fifo_in_payload_we = main_sdram_bankmachine2_cmd_buffer_lookahead_sink_payload_we;
assign main_sdram_bankmachine2_cmd_buffer_lookahead_fifo_in_payload_addr = main_sdram_bankmachine2_cmd_buffer_lookahead_sink_payload_addr;
assign main_sdram_bankmachine2_cmd_buffer_lookahead_source_valid = main_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_readable;
assign main_sdram_bankmachine2_cmd_buffer_lookahead_source_first = main_sdram_bankmachine2_cmd_buffer_lookahead_fifo_out_first;
assign main_sdram_bankmachine2_cmd_buffer_lookahead_source_last = main_sdram_bankmachine2_cmd_buffer_lookahead_fifo_out_last;
assign main_sdram_bankmachine2_cmd_buffer_lookahead_source_payload_we = main_sdram_bankmachine2_cmd_buffer_lookahead_fifo_out_payload_we;
assign main_sdram_bankmachine2_cmd_buffer_lookahead_source_payload_addr = main_sdram_bankmachine2_cmd_buffer_lookahead_fifo_out_payload_addr;
assign main_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_re = main_sdram_bankmachine2_cmd_buffer_lookahead_source_ready;
always @(*) begin
	main_sdram_bankmachine2_cmd_buffer_lookahead_wrport_adr <= 3'd0;
	if (main_sdram_bankmachine2_cmd_buffer_lookahead_replace) begin
		main_sdram_bankmachine2_cmd_buffer_lookahead_wrport_adr <= (main_sdram_bankmachine2_cmd_buffer_lookahead_produce - 1'd1);
	end else begin
		main_sdram_bankmachine2_cmd_buffer_lookahead_wrport_adr <= main_sdram_bankmachine2_cmd_buffer_lookahead_produce;
	end
end
assign main_sdram_bankmachine2_cmd_buffer_lookahead_wrport_dat_w = main_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_din;
assign main_sdram_bankmachine2_cmd_buffer_lookahead_wrport_we = (main_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_we & (main_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_writable | main_sdram_bankmachine2_cmd_buffer_lookahead_replace));
assign main_sdram_bankmachine2_cmd_buffer_lookahead_do_read = (main_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_readable & main_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_re);
assign main_sdram_bankmachine2_cmd_buffer_lookahead_rdport_adr = main_sdram_bankmachine2_cmd_buffer_lookahead_consume;
assign main_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_dout = main_sdram_bankmachine2_cmd_buffer_lookahead_rdport_dat_r;
assign main_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_writable = (main_sdram_bankmachine2_cmd_buffer_lookahead_level != 4'd8);
assign main_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_readable = (main_sdram_bankmachine2_cmd_buffer_lookahead_level != 1'd0);
assign main_sdram_bankmachine2_cmd_buffer_sink_ready = ((~main_sdram_bankmachine2_cmd_buffer_source_valid) | main_sdram_bankmachine2_cmd_buffer_source_ready);
always @(*) begin
	main_sdram_bankmachine2_cmd_payload_we <= 1'd0;
	main_sdram_bankmachine2_row_col_n_addr_sel <= 1'd0;
	main_sdram_bankmachine2_cmd_payload_is_cmd <= 1'd0;
	builder_bankmachine2_next_state <= 4'd0;
	main_sdram_bankmachine2_cmd_payload_is_read <= 1'd0;
	main_sdram_bankmachine2_cmd_payload_is_write <= 1'd0;
	main_sdram_bankmachine2_req_wdata_ready <= 1'd0;
	main_sdram_bankmachine2_req_rdata_valid <= 1'd0;
	main_sdram_bankmachine2_refresh_gnt <= 1'd0;
	main_sdram_bankmachine2_cmd_valid <= 1'd0;
	main_sdram_bankmachine2_row_open <= 1'd0;
	main_sdram_bankmachine2_row_close <= 1'd0;
	main_sdram_bankmachine2_cmd_payload_cas <= 1'd0;
	main_sdram_bankmachine2_cmd_payload_ras <= 1'd0;
	builder_bankmachine2_next_state <= builder_bankmachine2_state;
	case (builder_bankmachine2_state)
		1'd1: begin
			if ((main_sdram_bankmachine2_twtpcon_ready & main_sdram_bankmachine2_trascon_ready)) begin
				main_sdram_bankmachine2_cmd_valid <= 1'd1;
				if (main_sdram_bankmachine2_cmd_ready) begin
					builder_bankmachine2_next_state <= 3'd5;
				end
				main_sdram_bankmachine2_cmd_payload_ras <= 1'd1;
				main_sdram_bankmachine2_cmd_payload_we <= 1'd1;
				main_sdram_bankmachine2_cmd_payload_is_cmd <= 1'd1;
			end
			main_sdram_bankmachine2_row_close <= 1'd1;
		end
		2'd2: begin
			if ((main_sdram_bankmachine2_twtpcon_ready & main_sdram_bankmachine2_trascon_ready)) begin
				builder_bankmachine2_next_state <= 3'd5;
			end
			main_sdram_bankmachine2_row_close <= 1'd1;
		end
		2'd3: begin
			if (main_sdram_bankmachine2_trccon_ready) begin
				main_sdram_bankmachine2_row_col_n_addr_sel <= 1'd1;
				main_sdram_bankmachine2_row_open <= 1'd1;
				main_sdram_bankmachine2_cmd_valid <= 1'd1;
				main_sdram_bankmachine2_cmd_payload_is_cmd <= 1'd1;
				if (main_sdram_bankmachine2_cmd_ready) begin
					builder_bankmachine2_next_state <= 3'd7;
				end
				main_sdram_bankmachine2_cmd_payload_ras <= 1'd1;
			end
		end
		3'd4: begin
			if (main_sdram_bankmachine2_twtpcon_ready) begin
				main_sdram_bankmachine2_refresh_gnt <= 1'd1;
			end
			main_sdram_bankmachine2_row_close <= 1'd1;
			main_sdram_bankmachine2_cmd_payload_is_cmd <= 1'd1;
			if ((~main_sdram_bankmachine2_refresh_req)) begin
				builder_bankmachine2_next_state <= 1'd0;
			end
		end
		3'd5: begin
			builder_bankmachine2_next_state <= 3'd6;
		end
		3'd6: begin
			builder_bankmachine2_next_state <= 2'd3;
		end
		3'd7: begin
			builder_bankmachine2_next_state <= 4'd8;
		end
		4'd8: begin
			builder_bankmachine2_next_state <= 1'd0;
		end
		default: begin
			if (main_sdram_bankmachine2_refresh_req) begin
				builder_bankmachine2_next_state <= 3'd4;
			end else begin
				if (main_sdram_bankmachine2_cmd_buffer_source_valid) begin
					if (main_sdram_bankmachine2_row_opened) begin
						if (main_sdram_bankmachine2_row_hit) begin
							main_sdram_bankmachine2_cmd_valid <= 1'd1;
							if (main_sdram_bankmachine2_cmd_buffer_source_payload_we) begin
								main_sdram_bankmachine2_req_wdata_ready <= main_sdram_bankmachine2_cmd_ready;
								main_sdram_bankmachine2_cmd_payload_is_write <= 1'd1;
								main_sdram_bankmachine2_cmd_payload_we <= 1'd1;
							end else begin
								main_sdram_bankmachine2_req_rdata_valid <= main_sdram_bankmachine2_cmd_ready;
								main_sdram_bankmachine2_cmd_payload_is_read <= 1'd1;
							end
							main_sdram_bankmachine2_cmd_payload_cas <= 1'd1;
							if ((main_sdram_bankmachine2_cmd_ready & main_sdram_bankmachine2_auto_precharge)) begin
								builder_bankmachine2_next_state <= 2'd2;
							end
						end else begin
							builder_bankmachine2_next_state <= 1'd1;
						end
					end else begin
						builder_bankmachine2_next_state <= 2'd3;
					end
				end
			end
		end
	endcase
end
assign main_sdram_bankmachine3_cmd_buffer_lookahead_sink_valid = main_sdram_bankmachine3_req_valid;
assign main_sdram_bankmachine3_req_ready = main_sdram_bankmachine3_cmd_buffer_lookahead_sink_ready;
assign main_sdram_bankmachine3_cmd_buffer_lookahead_sink_payload_we = main_sdram_bankmachine3_req_we;
assign main_sdram_bankmachine3_cmd_buffer_lookahead_sink_payload_addr = main_sdram_bankmachine3_req_addr;
assign main_sdram_bankmachine3_cmd_buffer_sink_valid = main_sdram_bankmachine3_cmd_buffer_lookahead_source_valid;
assign main_sdram_bankmachine3_cmd_buffer_lookahead_source_ready = main_sdram_bankmachine3_cmd_buffer_sink_ready;
assign main_sdram_bankmachine3_cmd_buffer_sink_first = main_sdram_bankmachine3_cmd_buffer_lookahead_source_first;
assign main_sdram_bankmachine3_cmd_buffer_sink_last = main_sdram_bankmachine3_cmd_buffer_lookahead_source_last;
assign main_sdram_bankmachine3_cmd_buffer_sink_payload_we = main_sdram_bankmachine3_cmd_buffer_lookahead_source_payload_we;
assign main_sdram_bankmachine3_cmd_buffer_sink_payload_addr = main_sdram_bankmachine3_cmd_buffer_lookahead_source_payload_addr;
assign main_sdram_bankmachine3_cmd_buffer_source_ready = (main_sdram_bankmachine3_req_wdata_ready | main_sdram_bankmachine3_req_rdata_valid);
assign main_sdram_bankmachine3_req_lock = (main_sdram_bankmachine3_cmd_buffer_lookahead_source_valid | main_sdram_bankmachine3_cmd_buffer_source_valid);
assign main_sdram_bankmachine3_row_hit = (main_sdram_bankmachine3_row == main_sdram_bankmachine3_cmd_buffer_source_payload_addr[20:7]);
assign main_sdram_bankmachine3_cmd_payload_ba = 2'd3;
always @(*) begin
	main_sdram_bankmachine3_cmd_payload_a <= 14'd0;
	if (main_sdram_bankmachine3_row_col_n_addr_sel) begin
		main_sdram_bankmachine3_cmd_payload_a <= main_sdram_bankmachine3_cmd_buffer_source_payload_addr[20:7];
	end else begin
		main_sdram_bankmachine3_cmd_payload_a <= ((main_sdram_bankmachine3_auto_precharge <<< 4'd10) | {main_sdram_bankmachine3_cmd_buffer_source_payload_addr[6:0], {3{1'd0}}});
	end
end
assign main_sdram_bankmachine3_twtpcon_valid = ((main_sdram_bankmachine3_cmd_valid & main_sdram_bankmachine3_cmd_ready) & main_sdram_bankmachine3_cmd_payload_is_write);
assign main_sdram_bankmachine3_trccon_valid = ((main_sdram_bankmachine3_cmd_valid & main_sdram_bankmachine3_cmd_ready) & main_sdram_bankmachine3_row_open);
assign main_sdram_bankmachine3_trascon_valid = ((main_sdram_bankmachine3_cmd_valid & main_sdram_bankmachine3_cmd_ready) & main_sdram_bankmachine3_row_open);
always @(*) begin
	main_sdram_bankmachine3_auto_precharge <= 1'd0;
	if ((main_sdram_bankmachine3_cmd_buffer_lookahead_source_valid & main_sdram_bankmachine3_cmd_buffer_source_valid)) begin
		if ((main_sdram_bankmachine3_cmd_buffer_lookahead_source_payload_addr[20:7] != main_sdram_bankmachine3_cmd_buffer_source_payload_addr[20:7])) begin
			main_sdram_bankmachine3_auto_precharge <= (main_sdram_bankmachine3_row_close == 1'd0);
		end
	end
end
assign main_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_din = {main_sdram_bankmachine3_cmd_buffer_lookahead_fifo_in_last, main_sdram_bankmachine3_cmd_buffer_lookahead_fifo_in_first, main_sdram_bankmachine3_cmd_buffer_lookahead_fifo_in_payload_addr, main_sdram_bankmachine3_cmd_buffer_lookahead_fifo_in_payload_we};
assign {main_sdram_bankmachine3_cmd_buffer_lookahead_fifo_out_last, main_sdram_bankmachine3_cmd_buffer_lookahead_fifo_out_first, main_sdram_bankmachine3_cmd_buffer_lookahead_fifo_out_payload_addr, main_sdram_bankmachine3_cmd_buffer_lookahead_fifo_out_payload_we} = main_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_dout;
assign main_sdram_bankmachine3_cmd_buffer_lookahead_sink_ready = main_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_writable;
assign main_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_we = main_sdram_bankmachine3_cmd_buffer_lookahead_sink_valid;
assign main_sdram_bankmachine3_cmd_buffer_lookahead_fifo_in_first = main_sdram_bankmachine3_cmd_buffer_lookahead_sink_first;
assign main_sdram_bankmachine3_cmd_buffer_lookahead_fifo_in_last = main_sdram_bankmachine3_cmd_buffer_lookahead_sink_last;
assign main_sdram_bankmachine3_cmd_buffer_lookahead_fifo_in_payload_we = main_sdram_bankmachine3_cmd_buffer_lookahead_sink_payload_we;
assign main_sdram_bankmachine3_cmd_buffer_lookahead_fifo_in_payload_addr = main_sdram_bankmachine3_cmd_buffer_lookahead_sink_payload_addr;
assign main_sdram_bankmachine3_cmd_buffer_lookahead_source_valid = main_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_readable;
assign main_sdram_bankmachine3_cmd_buffer_lookahead_source_first = main_sdram_bankmachine3_cmd_buffer_lookahead_fifo_out_first;
assign main_sdram_bankmachine3_cmd_buffer_lookahead_source_last = main_sdram_bankmachine3_cmd_buffer_lookahead_fifo_out_last;
assign main_sdram_bankmachine3_cmd_buffer_lookahead_source_payload_we = main_sdram_bankmachine3_cmd_buffer_lookahead_fifo_out_payload_we;
assign main_sdram_bankmachine3_cmd_buffer_lookahead_source_payload_addr = main_sdram_bankmachine3_cmd_buffer_lookahead_fifo_out_payload_addr;
assign main_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_re = main_sdram_bankmachine3_cmd_buffer_lookahead_source_ready;
always @(*) begin
	main_sdram_bankmachine3_cmd_buffer_lookahead_wrport_adr <= 3'd0;
	if (main_sdram_bankmachine3_cmd_buffer_lookahead_replace) begin
		main_sdram_bankmachine3_cmd_buffer_lookahead_wrport_adr <= (main_sdram_bankmachine3_cmd_buffer_lookahead_produce - 1'd1);
	end else begin
		main_sdram_bankmachine3_cmd_buffer_lookahead_wrport_adr <= main_sdram_bankmachine3_cmd_buffer_lookahead_produce;
	end
end
assign main_sdram_bankmachine3_cmd_buffer_lookahead_wrport_dat_w = main_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_din;
assign main_sdram_bankmachine3_cmd_buffer_lookahead_wrport_we = (main_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_we & (main_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_writable | main_sdram_bankmachine3_cmd_buffer_lookahead_replace));
assign main_sdram_bankmachine3_cmd_buffer_lookahead_do_read = (main_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_readable & main_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_re);
assign main_sdram_bankmachine3_cmd_buffer_lookahead_rdport_adr = main_sdram_bankmachine3_cmd_buffer_lookahead_consume;
assign main_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_dout = main_sdram_bankmachine3_cmd_buffer_lookahead_rdport_dat_r;
assign main_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_writable = (main_sdram_bankmachine3_cmd_buffer_lookahead_level != 4'd8);
assign main_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_readable = (main_sdram_bankmachine3_cmd_buffer_lookahead_level != 1'd0);
assign main_sdram_bankmachine3_cmd_buffer_sink_ready = ((~main_sdram_bankmachine3_cmd_buffer_source_valid) | main_sdram_bankmachine3_cmd_buffer_source_ready);
always @(*) begin
	main_sdram_bankmachine3_cmd_payload_we <= 1'd0;
	main_sdram_bankmachine3_row_col_n_addr_sel <= 1'd0;
	main_sdram_bankmachine3_cmd_payload_is_cmd <= 1'd0;
	builder_bankmachine3_next_state <= 4'd0;
	main_sdram_bankmachine3_cmd_payload_is_read <= 1'd0;
	main_sdram_bankmachine3_cmd_payload_is_write <= 1'd0;
	main_sdram_bankmachine3_req_wdata_ready <= 1'd0;
	main_sdram_bankmachine3_req_rdata_valid <= 1'd0;
	main_sdram_bankmachine3_refresh_gnt <= 1'd0;
	main_sdram_bankmachine3_cmd_valid <= 1'd0;
	main_sdram_bankmachine3_row_open <= 1'd0;
	main_sdram_bankmachine3_row_close <= 1'd0;
	main_sdram_bankmachine3_cmd_payload_cas <= 1'd0;
	main_sdram_bankmachine3_cmd_payload_ras <= 1'd0;
	builder_bankmachine3_next_state <= builder_bankmachine3_state;
	case (builder_bankmachine3_state)
		1'd1: begin
			if ((main_sdram_bankmachine3_twtpcon_ready & main_sdram_bankmachine3_trascon_ready)) begin
				main_sdram_bankmachine3_cmd_valid <= 1'd1;
				if (main_sdram_bankmachine3_cmd_ready) begin
					builder_bankmachine3_next_state <= 3'd5;
				end
				main_sdram_bankmachine3_cmd_payload_ras <= 1'd1;
				main_sdram_bankmachine3_cmd_payload_we <= 1'd1;
				main_sdram_bankmachine3_cmd_payload_is_cmd <= 1'd1;
			end
			main_sdram_bankmachine3_row_close <= 1'd1;
		end
		2'd2: begin
			if ((main_sdram_bankmachine3_twtpcon_ready & main_sdram_bankmachine3_trascon_ready)) begin
				builder_bankmachine3_next_state <= 3'd5;
			end
			main_sdram_bankmachine3_row_close <= 1'd1;
		end
		2'd3: begin
			if (main_sdram_bankmachine3_trccon_ready) begin
				main_sdram_bankmachine3_row_col_n_addr_sel <= 1'd1;
				main_sdram_bankmachine3_row_open <= 1'd1;
				main_sdram_bankmachine3_cmd_valid <= 1'd1;
				main_sdram_bankmachine3_cmd_payload_is_cmd <= 1'd1;
				if (main_sdram_bankmachine3_cmd_ready) begin
					builder_bankmachine3_next_state <= 3'd7;
				end
				main_sdram_bankmachine3_cmd_payload_ras <= 1'd1;
			end
		end
		3'd4: begin
			if (main_sdram_bankmachine3_twtpcon_ready) begin
				main_sdram_bankmachine3_refresh_gnt <= 1'd1;
			end
			main_sdram_bankmachine3_row_close <= 1'd1;
			main_sdram_bankmachine3_cmd_payload_is_cmd <= 1'd1;
			if ((~main_sdram_bankmachine3_refresh_req)) begin
				builder_bankmachine3_next_state <= 1'd0;
			end
		end
		3'd5: begin
			builder_bankmachine3_next_state <= 3'd6;
		end
		3'd6: begin
			builder_bankmachine3_next_state <= 2'd3;
		end
		3'd7: begin
			builder_bankmachine3_next_state <= 4'd8;
		end
		4'd8: begin
			builder_bankmachine3_next_state <= 1'd0;
		end
		default: begin
			if (main_sdram_bankmachine3_refresh_req) begin
				builder_bankmachine3_next_state <= 3'd4;
			end else begin
				if (main_sdram_bankmachine3_cmd_buffer_source_valid) begin
					if (main_sdram_bankmachine3_row_opened) begin
						if (main_sdram_bankmachine3_row_hit) begin
							main_sdram_bankmachine3_cmd_valid <= 1'd1;
							if (main_sdram_bankmachine3_cmd_buffer_source_payload_we) begin
								main_sdram_bankmachine3_req_wdata_ready <= main_sdram_bankmachine3_cmd_ready;
								main_sdram_bankmachine3_cmd_payload_is_write <= 1'd1;
								main_sdram_bankmachine3_cmd_payload_we <= 1'd1;
							end else begin
								main_sdram_bankmachine3_req_rdata_valid <= main_sdram_bankmachine3_cmd_ready;
								main_sdram_bankmachine3_cmd_payload_is_read <= 1'd1;
							end
							main_sdram_bankmachine3_cmd_payload_cas <= 1'd1;
							if ((main_sdram_bankmachine3_cmd_ready & main_sdram_bankmachine3_auto_precharge)) begin
								builder_bankmachine3_next_state <= 2'd2;
							end
						end else begin
							builder_bankmachine3_next_state <= 1'd1;
						end
					end else begin
						builder_bankmachine3_next_state <= 2'd3;
					end
				end
			end
		end
	endcase
end
assign main_sdram_bankmachine4_cmd_buffer_lookahead_sink_valid = main_sdram_bankmachine4_req_valid;
assign main_sdram_bankmachine4_req_ready = main_sdram_bankmachine4_cmd_buffer_lookahead_sink_ready;
assign main_sdram_bankmachine4_cmd_buffer_lookahead_sink_payload_we = main_sdram_bankmachine4_req_we;
assign main_sdram_bankmachine4_cmd_buffer_lookahead_sink_payload_addr = main_sdram_bankmachine4_req_addr;
assign main_sdram_bankmachine4_cmd_buffer_sink_valid = main_sdram_bankmachine4_cmd_buffer_lookahead_source_valid;
assign main_sdram_bankmachine4_cmd_buffer_lookahead_source_ready = main_sdram_bankmachine4_cmd_buffer_sink_ready;
assign main_sdram_bankmachine4_cmd_buffer_sink_first = main_sdram_bankmachine4_cmd_buffer_lookahead_source_first;
assign main_sdram_bankmachine4_cmd_buffer_sink_last = main_sdram_bankmachine4_cmd_buffer_lookahead_source_last;
assign main_sdram_bankmachine4_cmd_buffer_sink_payload_we = main_sdram_bankmachine4_cmd_buffer_lookahead_source_payload_we;
assign main_sdram_bankmachine4_cmd_buffer_sink_payload_addr = main_sdram_bankmachine4_cmd_buffer_lookahead_source_payload_addr;
assign main_sdram_bankmachine4_cmd_buffer_source_ready = (main_sdram_bankmachine4_req_wdata_ready | main_sdram_bankmachine4_req_rdata_valid);
assign main_sdram_bankmachine4_req_lock = (main_sdram_bankmachine4_cmd_buffer_lookahead_source_valid | main_sdram_bankmachine4_cmd_buffer_source_valid);
assign main_sdram_bankmachine4_row_hit = (main_sdram_bankmachine4_row == main_sdram_bankmachine4_cmd_buffer_source_payload_addr[20:7]);
assign main_sdram_bankmachine4_cmd_payload_ba = 3'd4;
always @(*) begin
	main_sdram_bankmachine4_cmd_payload_a <= 14'd0;
	if (main_sdram_bankmachine4_row_col_n_addr_sel) begin
		main_sdram_bankmachine4_cmd_payload_a <= main_sdram_bankmachine4_cmd_buffer_source_payload_addr[20:7];
	end else begin
		main_sdram_bankmachine4_cmd_payload_a <= ((main_sdram_bankmachine4_auto_precharge <<< 4'd10) | {main_sdram_bankmachine4_cmd_buffer_source_payload_addr[6:0], {3{1'd0}}});
	end
end
assign main_sdram_bankmachine4_twtpcon_valid = ((main_sdram_bankmachine4_cmd_valid & main_sdram_bankmachine4_cmd_ready) & main_sdram_bankmachine4_cmd_payload_is_write);
assign main_sdram_bankmachine4_trccon_valid = ((main_sdram_bankmachine4_cmd_valid & main_sdram_bankmachine4_cmd_ready) & main_sdram_bankmachine4_row_open);
assign main_sdram_bankmachine4_trascon_valid = ((main_sdram_bankmachine4_cmd_valid & main_sdram_bankmachine4_cmd_ready) & main_sdram_bankmachine4_row_open);
always @(*) begin
	main_sdram_bankmachine4_auto_precharge <= 1'd0;
	if ((main_sdram_bankmachine4_cmd_buffer_lookahead_source_valid & main_sdram_bankmachine4_cmd_buffer_source_valid)) begin
		if ((main_sdram_bankmachine4_cmd_buffer_lookahead_source_payload_addr[20:7] != main_sdram_bankmachine4_cmd_buffer_source_payload_addr[20:7])) begin
			main_sdram_bankmachine4_auto_precharge <= (main_sdram_bankmachine4_row_close == 1'd0);
		end
	end
end
assign main_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_din = {main_sdram_bankmachine4_cmd_buffer_lookahead_fifo_in_last, main_sdram_bankmachine4_cmd_buffer_lookahead_fifo_in_first, main_sdram_bankmachine4_cmd_buffer_lookahead_fifo_in_payload_addr, main_sdram_bankmachine4_cmd_buffer_lookahead_fifo_in_payload_we};
assign {main_sdram_bankmachine4_cmd_buffer_lookahead_fifo_out_last, main_sdram_bankmachine4_cmd_buffer_lookahead_fifo_out_first, main_sdram_bankmachine4_cmd_buffer_lookahead_fifo_out_payload_addr, main_sdram_bankmachine4_cmd_buffer_lookahead_fifo_out_payload_we} = main_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_dout;
assign main_sdram_bankmachine4_cmd_buffer_lookahead_sink_ready = main_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_writable;
assign main_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_we = main_sdram_bankmachine4_cmd_buffer_lookahead_sink_valid;
assign main_sdram_bankmachine4_cmd_buffer_lookahead_fifo_in_first = main_sdram_bankmachine4_cmd_buffer_lookahead_sink_first;
assign main_sdram_bankmachine4_cmd_buffer_lookahead_fifo_in_last = main_sdram_bankmachine4_cmd_buffer_lookahead_sink_last;
assign main_sdram_bankmachine4_cmd_buffer_lookahead_fifo_in_payload_we = main_sdram_bankmachine4_cmd_buffer_lookahead_sink_payload_we;
assign main_sdram_bankmachine4_cmd_buffer_lookahead_fifo_in_payload_addr = main_sdram_bankmachine4_cmd_buffer_lookahead_sink_payload_addr;
assign main_sdram_bankmachine4_cmd_buffer_lookahead_source_valid = main_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_readable;
assign main_sdram_bankmachine4_cmd_buffer_lookahead_source_first = main_sdram_bankmachine4_cmd_buffer_lookahead_fifo_out_first;
assign main_sdram_bankmachine4_cmd_buffer_lookahead_source_last = main_sdram_bankmachine4_cmd_buffer_lookahead_fifo_out_last;
assign main_sdram_bankmachine4_cmd_buffer_lookahead_source_payload_we = main_sdram_bankmachine4_cmd_buffer_lookahead_fifo_out_payload_we;
assign main_sdram_bankmachine4_cmd_buffer_lookahead_source_payload_addr = main_sdram_bankmachine4_cmd_buffer_lookahead_fifo_out_payload_addr;
assign main_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_re = main_sdram_bankmachine4_cmd_buffer_lookahead_source_ready;
always @(*) begin
	main_sdram_bankmachine4_cmd_buffer_lookahead_wrport_adr <= 3'd0;
	if (main_sdram_bankmachine4_cmd_buffer_lookahead_replace) begin
		main_sdram_bankmachine4_cmd_buffer_lookahead_wrport_adr <= (main_sdram_bankmachine4_cmd_buffer_lookahead_produce - 1'd1);
	end else begin
		main_sdram_bankmachine4_cmd_buffer_lookahead_wrport_adr <= main_sdram_bankmachine4_cmd_buffer_lookahead_produce;
	end
end
assign main_sdram_bankmachine4_cmd_buffer_lookahead_wrport_dat_w = main_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_din;
assign main_sdram_bankmachine4_cmd_buffer_lookahead_wrport_we = (main_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_we & (main_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_writable | main_sdram_bankmachine4_cmd_buffer_lookahead_replace));
assign main_sdram_bankmachine4_cmd_buffer_lookahead_do_read = (main_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_readable & main_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_re);
assign main_sdram_bankmachine4_cmd_buffer_lookahead_rdport_adr = main_sdram_bankmachine4_cmd_buffer_lookahead_consume;
assign main_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_dout = main_sdram_bankmachine4_cmd_buffer_lookahead_rdport_dat_r;
assign main_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_writable = (main_sdram_bankmachine4_cmd_buffer_lookahead_level != 4'd8);
assign main_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_readable = (main_sdram_bankmachine4_cmd_buffer_lookahead_level != 1'd0);
assign main_sdram_bankmachine4_cmd_buffer_sink_ready = ((~main_sdram_bankmachine4_cmd_buffer_source_valid) | main_sdram_bankmachine4_cmd_buffer_source_ready);
always @(*) begin
	main_sdram_bankmachine4_cmd_payload_we <= 1'd0;
	main_sdram_bankmachine4_row_col_n_addr_sel <= 1'd0;
	main_sdram_bankmachine4_cmd_payload_is_cmd <= 1'd0;
	builder_bankmachine4_next_state <= 4'd0;
	main_sdram_bankmachine4_cmd_payload_is_read <= 1'd0;
	main_sdram_bankmachine4_cmd_payload_is_write <= 1'd0;
	main_sdram_bankmachine4_req_wdata_ready <= 1'd0;
	main_sdram_bankmachine4_req_rdata_valid <= 1'd0;
	main_sdram_bankmachine4_refresh_gnt <= 1'd0;
	main_sdram_bankmachine4_cmd_valid <= 1'd0;
	main_sdram_bankmachine4_row_open <= 1'd0;
	main_sdram_bankmachine4_row_close <= 1'd0;
	main_sdram_bankmachine4_cmd_payload_cas <= 1'd0;
	main_sdram_bankmachine4_cmd_payload_ras <= 1'd0;
	builder_bankmachine4_next_state <= builder_bankmachine4_state;
	case (builder_bankmachine4_state)
		1'd1: begin
			if ((main_sdram_bankmachine4_twtpcon_ready & main_sdram_bankmachine4_trascon_ready)) begin
				main_sdram_bankmachine4_cmd_valid <= 1'd1;
				if (main_sdram_bankmachine4_cmd_ready) begin
					builder_bankmachine4_next_state <= 3'd5;
				end
				main_sdram_bankmachine4_cmd_payload_ras <= 1'd1;
				main_sdram_bankmachine4_cmd_payload_we <= 1'd1;
				main_sdram_bankmachine4_cmd_payload_is_cmd <= 1'd1;
			end
			main_sdram_bankmachine4_row_close <= 1'd1;
		end
		2'd2: begin
			if ((main_sdram_bankmachine4_twtpcon_ready & main_sdram_bankmachine4_trascon_ready)) begin
				builder_bankmachine4_next_state <= 3'd5;
			end
			main_sdram_bankmachine4_row_close <= 1'd1;
		end
		2'd3: begin
			if (main_sdram_bankmachine4_trccon_ready) begin
				main_sdram_bankmachine4_row_col_n_addr_sel <= 1'd1;
				main_sdram_bankmachine4_row_open <= 1'd1;
				main_sdram_bankmachine4_cmd_valid <= 1'd1;
				main_sdram_bankmachine4_cmd_payload_is_cmd <= 1'd1;
				if (main_sdram_bankmachine4_cmd_ready) begin
					builder_bankmachine4_next_state <= 3'd7;
				end
				main_sdram_bankmachine4_cmd_payload_ras <= 1'd1;
			end
		end
		3'd4: begin
			if (main_sdram_bankmachine4_twtpcon_ready) begin
				main_sdram_bankmachine4_refresh_gnt <= 1'd1;
			end
			main_sdram_bankmachine4_row_close <= 1'd1;
			main_sdram_bankmachine4_cmd_payload_is_cmd <= 1'd1;
			if ((~main_sdram_bankmachine4_refresh_req)) begin
				builder_bankmachine4_next_state <= 1'd0;
			end
		end
		3'd5: begin
			builder_bankmachine4_next_state <= 3'd6;
		end
		3'd6: begin
			builder_bankmachine4_next_state <= 2'd3;
		end
		3'd7: begin
			builder_bankmachine4_next_state <= 4'd8;
		end
		4'd8: begin
			builder_bankmachine4_next_state <= 1'd0;
		end
		default: begin
			if (main_sdram_bankmachine4_refresh_req) begin
				builder_bankmachine4_next_state <= 3'd4;
			end else begin
				if (main_sdram_bankmachine4_cmd_buffer_source_valid) begin
					if (main_sdram_bankmachine4_row_opened) begin
						if (main_sdram_bankmachine4_row_hit) begin
							main_sdram_bankmachine4_cmd_valid <= 1'd1;
							if (main_sdram_bankmachine4_cmd_buffer_source_payload_we) begin
								main_sdram_bankmachine4_req_wdata_ready <= main_sdram_bankmachine4_cmd_ready;
								main_sdram_bankmachine4_cmd_payload_is_write <= 1'd1;
								main_sdram_bankmachine4_cmd_payload_we <= 1'd1;
							end else begin
								main_sdram_bankmachine4_req_rdata_valid <= main_sdram_bankmachine4_cmd_ready;
								main_sdram_bankmachine4_cmd_payload_is_read <= 1'd1;
							end
							main_sdram_bankmachine4_cmd_payload_cas <= 1'd1;
							if ((main_sdram_bankmachine4_cmd_ready & main_sdram_bankmachine4_auto_precharge)) begin
								builder_bankmachine4_next_state <= 2'd2;
							end
						end else begin
							builder_bankmachine4_next_state <= 1'd1;
						end
					end else begin
						builder_bankmachine4_next_state <= 2'd3;
					end
				end
			end
		end
	endcase
end
assign main_sdram_bankmachine5_cmd_buffer_lookahead_sink_valid = main_sdram_bankmachine5_req_valid;
assign main_sdram_bankmachine5_req_ready = main_sdram_bankmachine5_cmd_buffer_lookahead_sink_ready;
assign main_sdram_bankmachine5_cmd_buffer_lookahead_sink_payload_we = main_sdram_bankmachine5_req_we;
assign main_sdram_bankmachine5_cmd_buffer_lookahead_sink_payload_addr = main_sdram_bankmachine5_req_addr;
assign main_sdram_bankmachine5_cmd_buffer_sink_valid = main_sdram_bankmachine5_cmd_buffer_lookahead_source_valid;
assign main_sdram_bankmachine5_cmd_buffer_lookahead_source_ready = main_sdram_bankmachine5_cmd_buffer_sink_ready;
assign main_sdram_bankmachine5_cmd_buffer_sink_first = main_sdram_bankmachine5_cmd_buffer_lookahead_source_first;
assign main_sdram_bankmachine5_cmd_buffer_sink_last = main_sdram_bankmachine5_cmd_buffer_lookahead_source_last;
assign main_sdram_bankmachine5_cmd_buffer_sink_payload_we = main_sdram_bankmachine5_cmd_buffer_lookahead_source_payload_we;
assign main_sdram_bankmachine5_cmd_buffer_sink_payload_addr = main_sdram_bankmachine5_cmd_buffer_lookahead_source_payload_addr;
assign main_sdram_bankmachine5_cmd_buffer_source_ready = (main_sdram_bankmachine5_req_wdata_ready | main_sdram_bankmachine5_req_rdata_valid);
assign main_sdram_bankmachine5_req_lock = (main_sdram_bankmachine5_cmd_buffer_lookahead_source_valid | main_sdram_bankmachine5_cmd_buffer_source_valid);
assign main_sdram_bankmachine5_row_hit = (main_sdram_bankmachine5_row == main_sdram_bankmachine5_cmd_buffer_source_payload_addr[20:7]);
assign main_sdram_bankmachine5_cmd_payload_ba = 3'd5;
always @(*) begin
	main_sdram_bankmachine5_cmd_payload_a <= 14'd0;
	if (main_sdram_bankmachine5_row_col_n_addr_sel) begin
		main_sdram_bankmachine5_cmd_payload_a <= main_sdram_bankmachine5_cmd_buffer_source_payload_addr[20:7];
	end else begin
		main_sdram_bankmachine5_cmd_payload_a <= ((main_sdram_bankmachine5_auto_precharge <<< 4'd10) | {main_sdram_bankmachine5_cmd_buffer_source_payload_addr[6:0], {3{1'd0}}});
	end
end
assign main_sdram_bankmachine5_twtpcon_valid = ((main_sdram_bankmachine5_cmd_valid & main_sdram_bankmachine5_cmd_ready) & main_sdram_bankmachine5_cmd_payload_is_write);
assign main_sdram_bankmachine5_trccon_valid = ((main_sdram_bankmachine5_cmd_valid & main_sdram_bankmachine5_cmd_ready) & main_sdram_bankmachine5_row_open);
assign main_sdram_bankmachine5_trascon_valid = ((main_sdram_bankmachine5_cmd_valid & main_sdram_bankmachine5_cmd_ready) & main_sdram_bankmachine5_row_open);
always @(*) begin
	main_sdram_bankmachine5_auto_precharge <= 1'd0;
	if ((main_sdram_bankmachine5_cmd_buffer_lookahead_source_valid & main_sdram_bankmachine5_cmd_buffer_source_valid)) begin
		if ((main_sdram_bankmachine5_cmd_buffer_lookahead_source_payload_addr[20:7] != main_sdram_bankmachine5_cmd_buffer_source_payload_addr[20:7])) begin
			main_sdram_bankmachine5_auto_precharge <= (main_sdram_bankmachine5_row_close == 1'd0);
		end
	end
end
assign main_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_din = {main_sdram_bankmachine5_cmd_buffer_lookahead_fifo_in_last, main_sdram_bankmachine5_cmd_buffer_lookahead_fifo_in_first, main_sdram_bankmachine5_cmd_buffer_lookahead_fifo_in_payload_addr, main_sdram_bankmachine5_cmd_buffer_lookahead_fifo_in_payload_we};
assign {main_sdram_bankmachine5_cmd_buffer_lookahead_fifo_out_last, main_sdram_bankmachine5_cmd_buffer_lookahead_fifo_out_first, main_sdram_bankmachine5_cmd_buffer_lookahead_fifo_out_payload_addr, main_sdram_bankmachine5_cmd_buffer_lookahead_fifo_out_payload_we} = main_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_dout;
assign main_sdram_bankmachine5_cmd_buffer_lookahead_sink_ready = main_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_writable;
assign main_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_we = main_sdram_bankmachine5_cmd_buffer_lookahead_sink_valid;
assign main_sdram_bankmachine5_cmd_buffer_lookahead_fifo_in_first = main_sdram_bankmachine5_cmd_buffer_lookahead_sink_first;
assign main_sdram_bankmachine5_cmd_buffer_lookahead_fifo_in_last = main_sdram_bankmachine5_cmd_buffer_lookahead_sink_last;
assign main_sdram_bankmachine5_cmd_buffer_lookahead_fifo_in_payload_we = main_sdram_bankmachine5_cmd_buffer_lookahead_sink_payload_we;
assign main_sdram_bankmachine5_cmd_buffer_lookahead_fifo_in_payload_addr = main_sdram_bankmachine5_cmd_buffer_lookahead_sink_payload_addr;
assign main_sdram_bankmachine5_cmd_buffer_lookahead_source_valid = main_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_readable;
assign main_sdram_bankmachine5_cmd_buffer_lookahead_source_first = main_sdram_bankmachine5_cmd_buffer_lookahead_fifo_out_first;
assign main_sdram_bankmachine5_cmd_buffer_lookahead_source_last = main_sdram_bankmachine5_cmd_buffer_lookahead_fifo_out_last;
assign main_sdram_bankmachine5_cmd_buffer_lookahead_source_payload_we = main_sdram_bankmachine5_cmd_buffer_lookahead_fifo_out_payload_we;
assign main_sdram_bankmachine5_cmd_buffer_lookahead_source_payload_addr = main_sdram_bankmachine5_cmd_buffer_lookahead_fifo_out_payload_addr;
assign main_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_re = main_sdram_bankmachine5_cmd_buffer_lookahead_source_ready;
always @(*) begin
	main_sdram_bankmachine5_cmd_buffer_lookahead_wrport_adr <= 3'd0;
	if (main_sdram_bankmachine5_cmd_buffer_lookahead_replace) begin
		main_sdram_bankmachine5_cmd_buffer_lookahead_wrport_adr <= (main_sdram_bankmachine5_cmd_buffer_lookahead_produce - 1'd1);
	end else begin
		main_sdram_bankmachine5_cmd_buffer_lookahead_wrport_adr <= main_sdram_bankmachine5_cmd_buffer_lookahead_produce;
	end
end
assign main_sdram_bankmachine5_cmd_buffer_lookahead_wrport_dat_w = main_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_din;
assign main_sdram_bankmachine5_cmd_buffer_lookahead_wrport_we = (main_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_we & (main_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_writable | main_sdram_bankmachine5_cmd_buffer_lookahead_replace));
assign main_sdram_bankmachine5_cmd_buffer_lookahead_do_read = (main_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_readable & main_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_re);
assign main_sdram_bankmachine5_cmd_buffer_lookahead_rdport_adr = main_sdram_bankmachine5_cmd_buffer_lookahead_consume;
assign main_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_dout = main_sdram_bankmachine5_cmd_buffer_lookahead_rdport_dat_r;
assign main_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_writable = (main_sdram_bankmachine5_cmd_buffer_lookahead_level != 4'd8);
assign main_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_readable = (main_sdram_bankmachine5_cmd_buffer_lookahead_level != 1'd0);
assign main_sdram_bankmachine5_cmd_buffer_sink_ready = ((~main_sdram_bankmachine5_cmd_buffer_source_valid) | main_sdram_bankmachine5_cmd_buffer_source_ready);
always @(*) begin
	main_sdram_bankmachine5_cmd_payload_we <= 1'd0;
	main_sdram_bankmachine5_row_col_n_addr_sel <= 1'd0;
	main_sdram_bankmachine5_cmd_payload_is_cmd <= 1'd0;
	builder_bankmachine5_next_state <= 4'd0;
	main_sdram_bankmachine5_cmd_payload_is_read <= 1'd0;
	main_sdram_bankmachine5_cmd_payload_is_write <= 1'd0;
	main_sdram_bankmachine5_req_wdata_ready <= 1'd0;
	main_sdram_bankmachine5_req_rdata_valid <= 1'd0;
	main_sdram_bankmachine5_refresh_gnt <= 1'd0;
	main_sdram_bankmachine5_cmd_valid <= 1'd0;
	main_sdram_bankmachine5_row_open <= 1'd0;
	main_sdram_bankmachine5_row_close <= 1'd0;
	main_sdram_bankmachine5_cmd_payload_cas <= 1'd0;
	main_sdram_bankmachine5_cmd_payload_ras <= 1'd0;
	builder_bankmachine5_next_state <= builder_bankmachine5_state;
	case (builder_bankmachine5_state)
		1'd1: begin
			if ((main_sdram_bankmachine5_twtpcon_ready & main_sdram_bankmachine5_trascon_ready)) begin
				main_sdram_bankmachine5_cmd_valid <= 1'd1;
				if (main_sdram_bankmachine5_cmd_ready) begin
					builder_bankmachine5_next_state <= 3'd5;
				end
				main_sdram_bankmachine5_cmd_payload_ras <= 1'd1;
				main_sdram_bankmachine5_cmd_payload_we <= 1'd1;
				main_sdram_bankmachine5_cmd_payload_is_cmd <= 1'd1;
			end
			main_sdram_bankmachine5_row_close <= 1'd1;
		end
		2'd2: begin
			if ((main_sdram_bankmachine5_twtpcon_ready & main_sdram_bankmachine5_trascon_ready)) begin
				builder_bankmachine5_next_state <= 3'd5;
			end
			main_sdram_bankmachine5_row_close <= 1'd1;
		end
		2'd3: begin
			if (main_sdram_bankmachine5_trccon_ready) begin
				main_sdram_bankmachine5_row_col_n_addr_sel <= 1'd1;
				main_sdram_bankmachine5_row_open <= 1'd1;
				main_sdram_bankmachine5_cmd_valid <= 1'd1;
				main_sdram_bankmachine5_cmd_payload_is_cmd <= 1'd1;
				if (main_sdram_bankmachine5_cmd_ready) begin
					builder_bankmachine5_next_state <= 3'd7;
				end
				main_sdram_bankmachine5_cmd_payload_ras <= 1'd1;
			end
		end
		3'd4: begin
			if (main_sdram_bankmachine5_twtpcon_ready) begin
				main_sdram_bankmachine5_refresh_gnt <= 1'd1;
			end
			main_sdram_bankmachine5_row_close <= 1'd1;
			main_sdram_bankmachine5_cmd_payload_is_cmd <= 1'd1;
			if ((~main_sdram_bankmachine5_refresh_req)) begin
				builder_bankmachine5_next_state <= 1'd0;
			end
		end
		3'd5: begin
			builder_bankmachine5_next_state <= 3'd6;
		end
		3'd6: begin
			builder_bankmachine5_next_state <= 2'd3;
		end
		3'd7: begin
			builder_bankmachine5_next_state <= 4'd8;
		end
		4'd8: begin
			builder_bankmachine5_next_state <= 1'd0;
		end
		default: begin
			if (main_sdram_bankmachine5_refresh_req) begin
				builder_bankmachine5_next_state <= 3'd4;
			end else begin
				if (main_sdram_bankmachine5_cmd_buffer_source_valid) begin
					if (main_sdram_bankmachine5_row_opened) begin
						if (main_sdram_bankmachine5_row_hit) begin
							main_sdram_bankmachine5_cmd_valid <= 1'd1;
							if (main_sdram_bankmachine5_cmd_buffer_source_payload_we) begin
								main_sdram_bankmachine5_req_wdata_ready <= main_sdram_bankmachine5_cmd_ready;
								main_sdram_bankmachine5_cmd_payload_is_write <= 1'd1;
								main_sdram_bankmachine5_cmd_payload_we <= 1'd1;
							end else begin
								main_sdram_bankmachine5_req_rdata_valid <= main_sdram_bankmachine5_cmd_ready;
								main_sdram_bankmachine5_cmd_payload_is_read <= 1'd1;
							end
							main_sdram_bankmachine5_cmd_payload_cas <= 1'd1;
							if ((main_sdram_bankmachine5_cmd_ready & main_sdram_bankmachine5_auto_precharge)) begin
								builder_bankmachine5_next_state <= 2'd2;
							end
						end else begin
							builder_bankmachine5_next_state <= 1'd1;
						end
					end else begin
						builder_bankmachine5_next_state <= 2'd3;
					end
				end
			end
		end
	endcase
end
assign main_sdram_bankmachine6_cmd_buffer_lookahead_sink_valid = main_sdram_bankmachine6_req_valid;
assign main_sdram_bankmachine6_req_ready = main_sdram_bankmachine6_cmd_buffer_lookahead_sink_ready;
assign main_sdram_bankmachine6_cmd_buffer_lookahead_sink_payload_we = main_sdram_bankmachine6_req_we;
assign main_sdram_bankmachine6_cmd_buffer_lookahead_sink_payload_addr = main_sdram_bankmachine6_req_addr;
assign main_sdram_bankmachine6_cmd_buffer_sink_valid = main_sdram_bankmachine6_cmd_buffer_lookahead_source_valid;
assign main_sdram_bankmachine6_cmd_buffer_lookahead_source_ready = main_sdram_bankmachine6_cmd_buffer_sink_ready;
assign main_sdram_bankmachine6_cmd_buffer_sink_first = main_sdram_bankmachine6_cmd_buffer_lookahead_source_first;
assign main_sdram_bankmachine6_cmd_buffer_sink_last = main_sdram_bankmachine6_cmd_buffer_lookahead_source_last;
assign main_sdram_bankmachine6_cmd_buffer_sink_payload_we = main_sdram_bankmachine6_cmd_buffer_lookahead_source_payload_we;
assign main_sdram_bankmachine6_cmd_buffer_sink_payload_addr = main_sdram_bankmachine6_cmd_buffer_lookahead_source_payload_addr;
assign main_sdram_bankmachine6_cmd_buffer_source_ready = (main_sdram_bankmachine6_req_wdata_ready | main_sdram_bankmachine6_req_rdata_valid);
assign main_sdram_bankmachine6_req_lock = (main_sdram_bankmachine6_cmd_buffer_lookahead_source_valid | main_sdram_bankmachine6_cmd_buffer_source_valid);
assign main_sdram_bankmachine6_row_hit = (main_sdram_bankmachine6_row == main_sdram_bankmachine6_cmd_buffer_source_payload_addr[20:7]);
assign main_sdram_bankmachine6_cmd_payload_ba = 3'd6;
always @(*) begin
	main_sdram_bankmachine6_cmd_payload_a <= 14'd0;
	if (main_sdram_bankmachine6_row_col_n_addr_sel) begin
		main_sdram_bankmachine6_cmd_payload_a <= main_sdram_bankmachine6_cmd_buffer_source_payload_addr[20:7];
	end else begin
		main_sdram_bankmachine6_cmd_payload_a <= ((main_sdram_bankmachine6_auto_precharge <<< 4'd10) | {main_sdram_bankmachine6_cmd_buffer_source_payload_addr[6:0], {3{1'd0}}});
	end
end
assign main_sdram_bankmachine6_twtpcon_valid = ((main_sdram_bankmachine6_cmd_valid & main_sdram_bankmachine6_cmd_ready) & main_sdram_bankmachine6_cmd_payload_is_write);
assign main_sdram_bankmachine6_trccon_valid = ((main_sdram_bankmachine6_cmd_valid & main_sdram_bankmachine6_cmd_ready) & main_sdram_bankmachine6_row_open);
assign main_sdram_bankmachine6_trascon_valid = ((main_sdram_bankmachine6_cmd_valid & main_sdram_bankmachine6_cmd_ready) & main_sdram_bankmachine6_row_open);
always @(*) begin
	main_sdram_bankmachine6_auto_precharge <= 1'd0;
	if ((main_sdram_bankmachine6_cmd_buffer_lookahead_source_valid & main_sdram_bankmachine6_cmd_buffer_source_valid)) begin
		if ((main_sdram_bankmachine6_cmd_buffer_lookahead_source_payload_addr[20:7] != main_sdram_bankmachine6_cmd_buffer_source_payload_addr[20:7])) begin
			main_sdram_bankmachine6_auto_precharge <= (main_sdram_bankmachine6_row_close == 1'd0);
		end
	end
end
assign main_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_din = {main_sdram_bankmachine6_cmd_buffer_lookahead_fifo_in_last, main_sdram_bankmachine6_cmd_buffer_lookahead_fifo_in_first, main_sdram_bankmachine6_cmd_buffer_lookahead_fifo_in_payload_addr, main_sdram_bankmachine6_cmd_buffer_lookahead_fifo_in_payload_we};
assign {main_sdram_bankmachine6_cmd_buffer_lookahead_fifo_out_last, main_sdram_bankmachine6_cmd_buffer_lookahead_fifo_out_first, main_sdram_bankmachine6_cmd_buffer_lookahead_fifo_out_payload_addr, main_sdram_bankmachine6_cmd_buffer_lookahead_fifo_out_payload_we} = main_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_dout;
assign main_sdram_bankmachine6_cmd_buffer_lookahead_sink_ready = main_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_writable;
assign main_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_we = main_sdram_bankmachine6_cmd_buffer_lookahead_sink_valid;
assign main_sdram_bankmachine6_cmd_buffer_lookahead_fifo_in_first = main_sdram_bankmachine6_cmd_buffer_lookahead_sink_first;
assign main_sdram_bankmachine6_cmd_buffer_lookahead_fifo_in_last = main_sdram_bankmachine6_cmd_buffer_lookahead_sink_last;
assign main_sdram_bankmachine6_cmd_buffer_lookahead_fifo_in_payload_we = main_sdram_bankmachine6_cmd_buffer_lookahead_sink_payload_we;
assign main_sdram_bankmachine6_cmd_buffer_lookahead_fifo_in_payload_addr = main_sdram_bankmachine6_cmd_buffer_lookahead_sink_payload_addr;
assign main_sdram_bankmachine6_cmd_buffer_lookahead_source_valid = main_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_readable;
assign main_sdram_bankmachine6_cmd_buffer_lookahead_source_first = main_sdram_bankmachine6_cmd_buffer_lookahead_fifo_out_first;
assign main_sdram_bankmachine6_cmd_buffer_lookahead_source_last = main_sdram_bankmachine6_cmd_buffer_lookahead_fifo_out_last;
assign main_sdram_bankmachine6_cmd_buffer_lookahead_source_payload_we = main_sdram_bankmachine6_cmd_buffer_lookahead_fifo_out_payload_we;
assign main_sdram_bankmachine6_cmd_buffer_lookahead_source_payload_addr = main_sdram_bankmachine6_cmd_buffer_lookahead_fifo_out_payload_addr;
assign main_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_re = main_sdram_bankmachine6_cmd_buffer_lookahead_source_ready;
always @(*) begin
	main_sdram_bankmachine6_cmd_buffer_lookahead_wrport_adr <= 3'd0;
	if (main_sdram_bankmachine6_cmd_buffer_lookahead_replace) begin
		main_sdram_bankmachine6_cmd_buffer_lookahead_wrport_adr <= (main_sdram_bankmachine6_cmd_buffer_lookahead_produce - 1'd1);
	end else begin
		main_sdram_bankmachine6_cmd_buffer_lookahead_wrport_adr <= main_sdram_bankmachine6_cmd_buffer_lookahead_produce;
	end
end
assign main_sdram_bankmachine6_cmd_buffer_lookahead_wrport_dat_w = main_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_din;
assign main_sdram_bankmachine6_cmd_buffer_lookahead_wrport_we = (main_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_we & (main_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_writable | main_sdram_bankmachine6_cmd_buffer_lookahead_replace));
assign main_sdram_bankmachine6_cmd_buffer_lookahead_do_read = (main_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_readable & main_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_re);
assign main_sdram_bankmachine6_cmd_buffer_lookahead_rdport_adr = main_sdram_bankmachine6_cmd_buffer_lookahead_consume;
assign main_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_dout = main_sdram_bankmachine6_cmd_buffer_lookahead_rdport_dat_r;
assign main_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_writable = (main_sdram_bankmachine6_cmd_buffer_lookahead_level != 4'd8);
assign main_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_readable = (main_sdram_bankmachine6_cmd_buffer_lookahead_level != 1'd0);
assign main_sdram_bankmachine6_cmd_buffer_sink_ready = ((~main_sdram_bankmachine6_cmd_buffer_source_valid) | main_sdram_bankmachine6_cmd_buffer_source_ready);
always @(*) begin
	main_sdram_bankmachine6_cmd_payload_we <= 1'd0;
	main_sdram_bankmachine6_row_col_n_addr_sel <= 1'd0;
	main_sdram_bankmachine6_cmd_payload_is_cmd <= 1'd0;
	builder_bankmachine6_next_state <= 4'd0;
	main_sdram_bankmachine6_cmd_payload_is_read <= 1'd0;
	main_sdram_bankmachine6_cmd_payload_is_write <= 1'd0;
	main_sdram_bankmachine6_req_wdata_ready <= 1'd0;
	main_sdram_bankmachine6_req_rdata_valid <= 1'd0;
	main_sdram_bankmachine6_refresh_gnt <= 1'd0;
	main_sdram_bankmachine6_cmd_valid <= 1'd0;
	main_sdram_bankmachine6_row_open <= 1'd0;
	main_sdram_bankmachine6_row_close <= 1'd0;
	main_sdram_bankmachine6_cmd_payload_cas <= 1'd0;
	main_sdram_bankmachine6_cmd_payload_ras <= 1'd0;
	builder_bankmachine6_next_state <= builder_bankmachine6_state;
	case (builder_bankmachine6_state)
		1'd1: begin
			if ((main_sdram_bankmachine6_twtpcon_ready & main_sdram_bankmachine6_trascon_ready)) begin
				main_sdram_bankmachine6_cmd_valid <= 1'd1;
				if (main_sdram_bankmachine6_cmd_ready) begin
					builder_bankmachine6_next_state <= 3'd5;
				end
				main_sdram_bankmachine6_cmd_payload_ras <= 1'd1;
				main_sdram_bankmachine6_cmd_payload_we <= 1'd1;
				main_sdram_bankmachine6_cmd_payload_is_cmd <= 1'd1;
			end
			main_sdram_bankmachine6_row_close <= 1'd1;
		end
		2'd2: begin
			if ((main_sdram_bankmachine6_twtpcon_ready & main_sdram_bankmachine6_trascon_ready)) begin
				builder_bankmachine6_next_state <= 3'd5;
			end
			main_sdram_bankmachine6_row_close <= 1'd1;
		end
		2'd3: begin
			if (main_sdram_bankmachine6_trccon_ready) begin
				main_sdram_bankmachine6_row_col_n_addr_sel <= 1'd1;
				main_sdram_bankmachine6_row_open <= 1'd1;
				main_sdram_bankmachine6_cmd_valid <= 1'd1;
				main_sdram_bankmachine6_cmd_payload_is_cmd <= 1'd1;
				if (main_sdram_bankmachine6_cmd_ready) begin
					builder_bankmachine6_next_state <= 3'd7;
				end
				main_sdram_bankmachine6_cmd_payload_ras <= 1'd1;
			end
		end
		3'd4: begin
			if (main_sdram_bankmachine6_twtpcon_ready) begin
				main_sdram_bankmachine6_refresh_gnt <= 1'd1;
			end
			main_sdram_bankmachine6_row_close <= 1'd1;
			main_sdram_bankmachine6_cmd_payload_is_cmd <= 1'd1;
			if ((~main_sdram_bankmachine6_refresh_req)) begin
				builder_bankmachine6_next_state <= 1'd0;
			end
		end
		3'd5: begin
			builder_bankmachine6_next_state <= 3'd6;
		end
		3'd6: begin
			builder_bankmachine6_next_state <= 2'd3;
		end
		3'd7: begin
			builder_bankmachine6_next_state <= 4'd8;
		end
		4'd8: begin
			builder_bankmachine6_next_state <= 1'd0;
		end
		default: begin
			if (main_sdram_bankmachine6_refresh_req) begin
				builder_bankmachine6_next_state <= 3'd4;
			end else begin
				if (main_sdram_bankmachine6_cmd_buffer_source_valid) begin
					if (main_sdram_bankmachine6_row_opened) begin
						if (main_sdram_bankmachine6_row_hit) begin
							main_sdram_bankmachine6_cmd_valid <= 1'd1;
							if (main_sdram_bankmachine6_cmd_buffer_source_payload_we) begin
								main_sdram_bankmachine6_req_wdata_ready <= main_sdram_bankmachine6_cmd_ready;
								main_sdram_bankmachine6_cmd_payload_is_write <= 1'd1;
								main_sdram_bankmachine6_cmd_payload_we <= 1'd1;
							end else begin
								main_sdram_bankmachine6_req_rdata_valid <= main_sdram_bankmachine6_cmd_ready;
								main_sdram_bankmachine6_cmd_payload_is_read <= 1'd1;
							end
							main_sdram_bankmachine6_cmd_payload_cas <= 1'd1;
							if ((main_sdram_bankmachine6_cmd_ready & main_sdram_bankmachine6_auto_precharge)) begin
								builder_bankmachine6_next_state <= 2'd2;
							end
						end else begin
							builder_bankmachine6_next_state <= 1'd1;
						end
					end else begin
						builder_bankmachine6_next_state <= 2'd3;
					end
				end
			end
		end
	endcase
end
assign main_sdram_bankmachine7_cmd_buffer_lookahead_sink_valid = main_sdram_bankmachine7_req_valid;
assign main_sdram_bankmachine7_req_ready = main_sdram_bankmachine7_cmd_buffer_lookahead_sink_ready;
assign main_sdram_bankmachine7_cmd_buffer_lookahead_sink_payload_we = main_sdram_bankmachine7_req_we;
assign main_sdram_bankmachine7_cmd_buffer_lookahead_sink_payload_addr = main_sdram_bankmachine7_req_addr;
assign main_sdram_bankmachine7_cmd_buffer_sink_valid = main_sdram_bankmachine7_cmd_buffer_lookahead_source_valid;
assign main_sdram_bankmachine7_cmd_buffer_lookahead_source_ready = main_sdram_bankmachine7_cmd_buffer_sink_ready;
assign main_sdram_bankmachine7_cmd_buffer_sink_first = main_sdram_bankmachine7_cmd_buffer_lookahead_source_first;
assign main_sdram_bankmachine7_cmd_buffer_sink_last = main_sdram_bankmachine7_cmd_buffer_lookahead_source_last;
assign main_sdram_bankmachine7_cmd_buffer_sink_payload_we = main_sdram_bankmachine7_cmd_buffer_lookahead_source_payload_we;
assign main_sdram_bankmachine7_cmd_buffer_sink_payload_addr = main_sdram_bankmachine7_cmd_buffer_lookahead_source_payload_addr;
assign main_sdram_bankmachine7_cmd_buffer_source_ready = (main_sdram_bankmachine7_req_wdata_ready | main_sdram_bankmachine7_req_rdata_valid);
assign main_sdram_bankmachine7_req_lock = (main_sdram_bankmachine7_cmd_buffer_lookahead_source_valid | main_sdram_bankmachine7_cmd_buffer_source_valid);
assign main_sdram_bankmachine7_row_hit = (main_sdram_bankmachine7_row == main_sdram_bankmachine7_cmd_buffer_source_payload_addr[20:7]);
assign main_sdram_bankmachine7_cmd_payload_ba = 3'd7;
always @(*) begin
	main_sdram_bankmachine7_cmd_payload_a <= 14'd0;
	if (main_sdram_bankmachine7_row_col_n_addr_sel) begin
		main_sdram_bankmachine7_cmd_payload_a <= main_sdram_bankmachine7_cmd_buffer_source_payload_addr[20:7];
	end else begin
		main_sdram_bankmachine7_cmd_payload_a <= ((main_sdram_bankmachine7_auto_precharge <<< 4'd10) | {main_sdram_bankmachine7_cmd_buffer_source_payload_addr[6:0], {3{1'd0}}});
	end
end
assign main_sdram_bankmachine7_twtpcon_valid = ((main_sdram_bankmachine7_cmd_valid & main_sdram_bankmachine7_cmd_ready) & main_sdram_bankmachine7_cmd_payload_is_write);
assign main_sdram_bankmachine7_trccon_valid = ((main_sdram_bankmachine7_cmd_valid & main_sdram_bankmachine7_cmd_ready) & main_sdram_bankmachine7_row_open);
assign main_sdram_bankmachine7_trascon_valid = ((main_sdram_bankmachine7_cmd_valid & main_sdram_bankmachine7_cmd_ready) & main_sdram_bankmachine7_row_open);
always @(*) begin
	main_sdram_bankmachine7_auto_precharge <= 1'd0;
	if ((main_sdram_bankmachine7_cmd_buffer_lookahead_source_valid & main_sdram_bankmachine7_cmd_buffer_source_valid)) begin
		if ((main_sdram_bankmachine7_cmd_buffer_lookahead_source_payload_addr[20:7] != main_sdram_bankmachine7_cmd_buffer_source_payload_addr[20:7])) begin
			main_sdram_bankmachine7_auto_precharge <= (main_sdram_bankmachine7_row_close == 1'd0);
		end
	end
end
assign main_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_din = {main_sdram_bankmachine7_cmd_buffer_lookahead_fifo_in_last, main_sdram_bankmachine7_cmd_buffer_lookahead_fifo_in_first, main_sdram_bankmachine7_cmd_buffer_lookahead_fifo_in_payload_addr, main_sdram_bankmachine7_cmd_buffer_lookahead_fifo_in_payload_we};
assign {main_sdram_bankmachine7_cmd_buffer_lookahead_fifo_out_last, main_sdram_bankmachine7_cmd_buffer_lookahead_fifo_out_first, main_sdram_bankmachine7_cmd_buffer_lookahead_fifo_out_payload_addr, main_sdram_bankmachine7_cmd_buffer_lookahead_fifo_out_payload_we} = main_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_dout;
assign main_sdram_bankmachine7_cmd_buffer_lookahead_sink_ready = main_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_writable;
assign main_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_we = main_sdram_bankmachine7_cmd_buffer_lookahead_sink_valid;
assign main_sdram_bankmachine7_cmd_buffer_lookahead_fifo_in_first = main_sdram_bankmachine7_cmd_buffer_lookahead_sink_first;
assign main_sdram_bankmachine7_cmd_buffer_lookahead_fifo_in_last = main_sdram_bankmachine7_cmd_buffer_lookahead_sink_last;
assign main_sdram_bankmachine7_cmd_buffer_lookahead_fifo_in_payload_we = main_sdram_bankmachine7_cmd_buffer_lookahead_sink_payload_we;
assign main_sdram_bankmachine7_cmd_buffer_lookahead_fifo_in_payload_addr = main_sdram_bankmachine7_cmd_buffer_lookahead_sink_payload_addr;
assign main_sdram_bankmachine7_cmd_buffer_lookahead_source_valid = main_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_readable;
assign main_sdram_bankmachine7_cmd_buffer_lookahead_source_first = main_sdram_bankmachine7_cmd_buffer_lookahead_fifo_out_first;
assign main_sdram_bankmachine7_cmd_buffer_lookahead_source_last = main_sdram_bankmachine7_cmd_buffer_lookahead_fifo_out_last;
assign main_sdram_bankmachine7_cmd_buffer_lookahead_source_payload_we = main_sdram_bankmachine7_cmd_buffer_lookahead_fifo_out_payload_we;
assign main_sdram_bankmachine7_cmd_buffer_lookahead_source_payload_addr = main_sdram_bankmachine7_cmd_buffer_lookahead_fifo_out_payload_addr;
assign main_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_re = main_sdram_bankmachine7_cmd_buffer_lookahead_source_ready;
always @(*) begin
	main_sdram_bankmachine7_cmd_buffer_lookahead_wrport_adr <= 3'd0;
	if (main_sdram_bankmachine7_cmd_buffer_lookahead_replace) begin
		main_sdram_bankmachine7_cmd_buffer_lookahead_wrport_adr <= (main_sdram_bankmachine7_cmd_buffer_lookahead_produce - 1'd1);
	end else begin
		main_sdram_bankmachine7_cmd_buffer_lookahead_wrport_adr <= main_sdram_bankmachine7_cmd_buffer_lookahead_produce;
	end
end
assign main_sdram_bankmachine7_cmd_buffer_lookahead_wrport_dat_w = main_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_din;
assign main_sdram_bankmachine7_cmd_buffer_lookahead_wrport_we = (main_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_we & (main_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_writable | main_sdram_bankmachine7_cmd_buffer_lookahead_replace));
assign main_sdram_bankmachine7_cmd_buffer_lookahead_do_read = (main_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_readable & main_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_re);
assign main_sdram_bankmachine7_cmd_buffer_lookahead_rdport_adr = main_sdram_bankmachine7_cmd_buffer_lookahead_consume;
assign main_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_dout = main_sdram_bankmachine7_cmd_buffer_lookahead_rdport_dat_r;
assign main_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_writable = (main_sdram_bankmachine7_cmd_buffer_lookahead_level != 4'd8);
assign main_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_readable = (main_sdram_bankmachine7_cmd_buffer_lookahead_level != 1'd0);
assign main_sdram_bankmachine7_cmd_buffer_sink_ready = ((~main_sdram_bankmachine7_cmd_buffer_source_valid) | main_sdram_bankmachine7_cmd_buffer_source_ready);
always @(*) begin
	main_sdram_bankmachine7_cmd_payload_we <= 1'd0;
	main_sdram_bankmachine7_row_col_n_addr_sel <= 1'd0;
	main_sdram_bankmachine7_cmd_payload_is_cmd <= 1'd0;
	builder_bankmachine7_next_state <= 4'd0;
	main_sdram_bankmachine7_cmd_payload_is_read <= 1'd0;
	main_sdram_bankmachine7_cmd_payload_is_write <= 1'd0;
	main_sdram_bankmachine7_req_wdata_ready <= 1'd0;
	main_sdram_bankmachine7_req_rdata_valid <= 1'd0;
	main_sdram_bankmachine7_refresh_gnt <= 1'd0;
	main_sdram_bankmachine7_cmd_valid <= 1'd0;
	main_sdram_bankmachine7_row_open <= 1'd0;
	main_sdram_bankmachine7_row_close <= 1'd0;
	main_sdram_bankmachine7_cmd_payload_cas <= 1'd0;
	main_sdram_bankmachine7_cmd_payload_ras <= 1'd0;
	builder_bankmachine7_next_state <= builder_bankmachine7_state;
	case (builder_bankmachine7_state)
		1'd1: begin
			if ((main_sdram_bankmachine7_twtpcon_ready & main_sdram_bankmachine7_trascon_ready)) begin
				main_sdram_bankmachine7_cmd_valid <= 1'd1;
				if (main_sdram_bankmachine7_cmd_ready) begin
					builder_bankmachine7_next_state <= 3'd5;
				end
				main_sdram_bankmachine7_cmd_payload_ras <= 1'd1;
				main_sdram_bankmachine7_cmd_payload_we <= 1'd1;
				main_sdram_bankmachine7_cmd_payload_is_cmd <= 1'd1;
			end
			main_sdram_bankmachine7_row_close <= 1'd1;
		end
		2'd2: begin
			if ((main_sdram_bankmachine7_twtpcon_ready & main_sdram_bankmachine7_trascon_ready)) begin
				builder_bankmachine7_next_state <= 3'd5;
			end
			main_sdram_bankmachine7_row_close <= 1'd1;
		end
		2'd3: begin
			if (main_sdram_bankmachine7_trccon_ready) begin
				main_sdram_bankmachine7_row_col_n_addr_sel <= 1'd1;
				main_sdram_bankmachine7_row_open <= 1'd1;
				main_sdram_bankmachine7_cmd_valid <= 1'd1;
				main_sdram_bankmachine7_cmd_payload_is_cmd <= 1'd1;
				if (main_sdram_bankmachine7_cmd_ready) begin
					builder_bankmachine7_next_state <= 3'd7;
				end
				main_sdram_bankmachine7_cmd_payload_ras <= 1'd1;
			end
		end
		3'd4: begin
			if (main_sdram_bankmachine7_twtpcon_ready) begin
				main_sdram_bankmachine7_refresh_gnt <= 1'd1;
			end
			main_sdram_bankmachine7_row_close <= 1'd1;
			main_sdram_bankmachine7_cmd_payload_is_cmd <= 1'd1;
			if ((~main_sdram_bankmachine7_refresh_req)) begin
				builder_bankmachine7_next_state <= 1'd0;
			end
		end
		3'd5: begin
			builder_bankmachine7_next_state <= 3'd6;
		end
		3'd6: begin
			builder_bankmachine7_next_state <= 2'd3;
		end
		3'd7: begin
			builder_bankmachine7_next_state <= 4'd8;
		end
		4'd8: begin
			builder_bankmachine7_next_state <= 1'd0;
		end
		default: begin
			if (main_sdram_bankmachine7_refresh_req) begin
				builder_bankmachine7_next_state <= 3'd4;
			end else begin
				if (main_sdram_bankmachine7_cmd_buffer_source_valid) begin
					if (main_sdram_bankmachine7_row_opened) begin
						if (main_sdram_bankmachine7_row_hit) begin
							main_sdram_bankmachine7_cmd_valid <= 1'd1;
							if (main_sdram_bankmachine7_cmd_buffer_source_payload_we) begin
								main_sdram_bankmachine7_req_wdata_ready <= main_sdram_bankmachine7_cmd_ready;
								main_sdram_bankmachine7_cmd_payload_is_write <= 1'd1;
								main_sdram_bankmachine7_cmd_payload_we <= 1'd1;
							end else begin
								main_sdram_bankmachine7_req_rdata_valid <= main_sdram_bankmachine7_cmd_ready;
								main_sdram_bankmachine7_cmd_payload_is_read <= 1'd1;
							end
							main_sdram_bankmachine7_cmd_payload_cas <= 1'd1;
							if ((main_sdram_bankmachine7_cmd_ready & main_sdram_bankmachine7_auto_precharge)) begin
								builder_bankmachine7_next_state <= 2'd2;
							end
						end else begin
							builder_bankmachine7_next_state <= 1'd1;
						end
					end else begin
						builder_bankmachine7_next_state <= 2'd3;
					end
				end
			end
		end
	endcase
end
assign main_sdram_trrdcon_valid = ((main_sdram_choose_cmd_cmd_valid & main_sdram_choose_cmd_cmd_ready) & ((main_sdram_choose_cmd_cmd_payload_ras & (~main_sdram_choose_cmd_cmd_payload_cas)) & (~main_sdram_choose_cmd_cmd_payload_we)));
assign main_sdram_tfawcon_valid = ((main_sdram_choose_cmd_cmd_valid & main_sdram_choose_cmd_cmd_ready) & ((main_sdram_choose_cmd_cmd_payload_ras & (~main_sdram_choose_cmd_cmd_payload_cas)) & (~main_sdram_choose_cmd_cmd_payload_we)));
assign main_sdram_ras_allowed = (main_sdram_trrdcon_ready & main_sdram_tfawcon_ready);
assign main_sdram_tccdcon_valid = ((main_sdram_choose_req_cmd_valid & main_sdram_choose_req_cmd_ready) & (main_sdram_choose_req_cmd_payload_is_write | main_sdram_choose_req_cmd_payload_is_read));
assign main_sdram_cas_allowed = main_sdram_tccdcon_ready;
assign main_sdram_twtrcon_valid = ((main_sdram_choose_req_cmd_valid & main_sdram_choose_req_cmd_ready) & main_sdram_choose_req_cmd_payload_is_write);
assign main_sdram_read_available = ((((((((main_sdram_bankmachine0_cmd_valid & main_sdram_bankmachine0_cmd_payload_is_read) | (main_sdram_bankmachine1_cmd_valid & main_sdram_bankmachine1_cmd_payload_is_read)) | (main_sdram_bankmachine2_cmd_valid & main_sdram_bankmachine2_cmd_payload_is_read)) | (main_sdram_bankmachine3_cmd_valid & main_sdram_bankmachine3_cmd_payload_is_read)) | (main_sdram_bankmachine4_cmd_valid & main_sdram_bankmachine4_cmd_payload_is_read)) | (main_sdram_bankmachine5_cmd_valid & main_sdram_bankmachine5_cmd_payload_is_read)) | (main_sdram_bankmachine6_cmd_valid & main_sdram_bankmachine6_cmd_payload_is_read)) | (main_sdram_bankmachine7_cmd_valid & main_sdram_bankmachine7_cmd_payload_is_read));
assign main_sdram_write_available = ((((((((main_sdram_bankmachine0_cmd_valid & main_sdram_bankmachine0_cmd_payload_is_write) | (main_sdram_bankmachine1_cmd_valid & main_sdram_bankmachine1_cmd_payload_is_write)) | (main_sdram_bankmachine2_cmd_valid & main_sdram_bankmachine2_cmd_payload_is_write)) | (main_sdram_bankmachine3_cmd_valid & main_sdram_bankmachine3_cmd_payload_is_write)) | (main_sdram_bankmachine4_cmd_valid & main_sdram_bankmachine4_cmd_payload_is_write)) | (main_sdram_bankmachine5_cmd_valid & main_sdram_bankmachine5_cmd_payload_is_write)) | (main_sdram_bankmachine6_cmd_valid & main_sdram_bankmachine6_cmd_payload_is_write)) | (main_sdram_bankmachine7_cmd_valid & main_sdram_bankmachine7_cmd_payload_is_write));
assign main_sdram_max_time0 = (main_sdram_time0 == 1'd0);
assign main_sdram_max_time1 = (main_sdram_time1 == 1'd0);
assign main_sdram_bankmachine0_refresh_req = main_sdram_cmd_valid;
assign main_sdram_bankmachine1_refresh_req = main_sdram_cmd_valid;
assign main_sdram_bankmachine2_refresh_req = main_sdram_cmd_valid;
assign main_sdram_bankmachine3_refresh_req = main_sdram_cmd_valid;
assign main_sdram_bankmachine4_refresh_req = main_sdram_cmd_valid;
assign main_sdram_bankmachine5_refresh_req = main_sdram_cmd_valid;
assign main_sdram_bankmachine6_refresh_req = main_sdram_cmd_valid;
assign main_sdram_bankmachine7_refresh_req = main_sdram_cmd_valid;
assign main_sdram_go_to_refresh = (((((((main_sdram_bankmachine0_refresh_gnt & main_sdram_bankmachine1_refresh_gnt) & main_sdram_bankmachine2_refresh_gnt) & main_sdram_bankmachine3_refresh_gnt) & main_sdram_bankmachine4_refresh_gnt) & main_sdram_bankmachine5_refresh_gnt) & main_sdram_bankmachine6_refresh_gnt) & main_sdram_bankmachine7_refresh_gnt);
assign main_sdram_interface_rdata = {main_sdram_dfi_p3_rddata, main_sdram_dfi_p2_rddata, main_sdram_dfi_p1_rddata, main_sdram_dfi_p0_rddata};
assign {main_sdram_dfi_p3_wrdata, main_sdram_dfi_p2_wrdata, main_sdram_dfi_p1_wrdata, main_sdram_dfi_p0_wrdata} = main_sdram_interface_wdata;
assign {main_sdram_dfi_p3_wrdata_mask, main_sdram_dfi_p2_wrdata_mask, main_sdram_dfi_p1_wrdata_mask, main_sdram_dfi_p0_wrdata_mask} = (~main_sdram_interface_wdata_we);
always @(*) begin
	main_sdram_choose_cmd_valids <= 8'd0;
	main_sdram_choose_cmd_valids[0] <= (main_sdram_bankmachine0_cmd_valid & (((main_sdram_bankmachine0_cmd_payload_is_cmd & main_sdram_choose_cmd_want_cmds) & ((~((main_sdram_bankmachine0_cmd_payload_ras & (~main_sdram_bankmachine0_cmd_payload_cas)) & (~main_sdram_bankmachine0_cmd_payload_we))) | main_sdram_choose_cmd_want_activates)) | ((main_sdram_bankmachine0_cmd_payload_is_read == main_sdram_choose_cmd_want_reads) & (main_sdram_bankmachine0_cmd_payload_is_write == main_sdram_choose_cmd_want_writes))));
	main_sdram_choose_cmd_valids[1] <= (main_sdram_bankmachine1_cmd_valid & (((main_sdram_bankmachine1_cmd_payload_is_cmd & main_sdram_choose_cmd_want_cmds) & ((~((main_sdram_bankmachine1_cmd_payload_ras & (~main_sdram_bankmachine1_cmd_payload_cas)) & (~main_sdram_bankmachine1_cmd_payload_we))) | main_sdram_choose_cmd_want_activates)) | ((main_sdram_bankmachine1_cmd_payload_is_read == main_sdram_choose_cmd_want_reads) & (main_sdram_bankmachine1_cmd_payload_is_write == main_sdram_choose_cmd_want_writes))));
	main_sdram_choose_cmd_valids[2] <= (main_sdram_bankmachine2_cmd_valid & (((main_sdram_bankmachine2_cmd_payload_is_cmd & main_sdram_choose_cmd_want_cmds) & ((~((main_sdram_bankmachine2_cmd_payload_ras & (~main_sdram_bankmachine2_cmd_payload_cas)) & (~main_sdram_bankmachine2_cmd_payload_we))) | main_sdram_choose_cmd_want_activates)) | ((main_sdram_bankmachine2_cmd_payload_is_read == main_sdram_choose_cmd_want_reads) & (main_sdram_bankmachine2_cmd_payload_is_write == main_sdram_choose_cmd_want_writes))));
	main_sdram_choose_cmd_valids[3] <= (main_sdram_bankmachine3_cmd_valid & (((main_sdram_bankmachine3_cmd_payload_is_cmd & main_sdram_choose_cmd_want_cmds) & ((~((main_sdram_bankmachine3_cmd_payload_ras & (~main_sdram_bankmachine3_cmd_payload_cas)) & (~main_sdram_bankmachine3_cmd_payload_we))) | main_sdram_choose_cmd_want_activates)) | ((main_sdram_bankmachine3_cmd_payload_is_read == main_sdram_choose_cmd_want_reads) & (main_sdram_bankmachine3_cmd_payload_is_write == main_sdram_choose_cmd_want_writes))));
	main_sdram_choose_cmd_valids[4] <= (main_sdram_bankmachine4_cmd_valid & (((main_sdram_bankmachine4_cmd_payload_is_cmd & main_sdram_choose_cmd_want_cmds) & ((~((main_sdram_bankmachine4_cmd_payload_ras & (~main_sdram_bankmachine4_cmd_payload_cas)) & (~main_sdram_bankmachine4_cmd_payload_we))) | main_sdram_choose_cmd_want_activates)) | ((main_sdram_bankmachine4_cmd_payload_is_read == main_sdram_choose_cmd_want_reads) & (main_sdram_bankmachine4_cmd_payload_is_write == main_sdram_choose_cmd_want_writes))));
	main_sdram_choose_cmd_valids[5] <= (main_sdram_bankmachine5_cmd_valid & (((main_sdram_bankmachine5_cmd_payload_is_cmd & main_sdram_choose_cmd_want_cmds) & ((~((main_sdram_bankmachine5_cmd_payload_ras & (~main_sdram_bankmachine5_cmd_payload_cas)) & (~main_sdram_bankmachine5_cmd_payload_we))) | main_sdram_choose_cmd_want_activates)) | ((main_sdram_bankmachine5_cmd_payload_is_read == main_sdram_choose_cmd_want_reads) & (main_sdram_bankmachine5_cmd_payload_is_write == main_sdram_choose_cmd_want_writes))));
	main_sdram_choose_cmd_valids[6] <= (main_sdram_bankmachine6_cmd_valid & (((main_sdram_bankmachine6_cmd_payload_is_cmd & main_sdram_choose_cmd_want_cmds) & ((~((main_sdram_bankmachine6_cmd_payload_ras & (~main_sdram_bankmachine6_cmd_payload_cas)) & (~main_sdram_bankmachine6_cmd_payload_we))) | main_sdram_choose_cmd_want_activates)) | ((main_sdram_bankmachine6_cmd_payload_is_read == main_sdram_choose_cmd_want_reads) & (main_sdram_bankmachine6_cmd_payload_is_write == main_sdram_choose_cmd_want_writes))));
	main_sdram_choose_cmd_valids[7] <= (main_sdram_bankmachine7_cmd_valid & (((main_sdram_bankmachine7_cmd_payload_is_cmd & main_sdram_choose_cmd_want_cmds) & ((~((main_sdram_bankmachine7_cmd_payload_ras & (~main_sdram_bankmachine7_cmd_payload_cas)) & (~main_sdram_bankmachine7_cmd_payload_we))) | main_sdram_choose_cmd_want_activates)) | ((main_sdram_bankmachine7_cmd_payload_is_read == main_sdram_choose_cmd_want_reads) & (main_sdram_bankmachine7_cmd_payload_is_write == main_sdram_choose_cmd_want_writes))));
end
assign main_sdram_choose_cmd_request = main_sdram_choose_cmd_valids;
assign main_sdram_choose_cmd_cmd_valid = builder_rhs_array_muxed0;
assign main_sdram_choose_cmd_cmd_payload_a = builder_rhs_array_muxed1;
assign main_sdram_choose_cmd_cmd_payload_ba = builder_rhs_array_muxed2;
assign main_sdram_choose_cmd_cmd_payload_is_read = builder_rhs_array_muxed3;
assign main_sdram_choose_cmd_cmd_payload_is_write = builder_rhs_array_muxed4;
assign main_sdram_choose_cmd_cmd_payload_is_cmd = builder_rhs_array_muxed5;
always @(*) begin
	main_sdram_choose_cmd_cmd_payload_cas <= 1'd0;
	if (main_sdram_choose_cmd_cmd_valid) begin
		main_sdram_choose_cmd_cmd_payload_cas <= builder_t_array_muxed0;
	end
end
always @(*) begin
	main_sdram_choose_cmd_cmd_payload_ras <= 1'd0;
	if (main_sdram_choose_cmd_cmd_valid) begin
		main_sdram_choose_cmd_cmd_payload_ras <= builder_t_array_muxed1;
	end
end
always @(*) begin
	main_sdram_choose_cmd_cmd_payload_we <= 1'd0;
	if (main_sdram_choose_cmd_cmd_valid) begin
		main_sdram_choose_cmd_cmd_payload_we <= builder_t_array_muxed2;
	end
end
assign main_sdram_choose_cmd_ce = (main_sdram_choose_cmd_cmd_ready | (~main_sdram_choose_cmd_cmd_valid));
always @(*) begin
	main_sdram_choose_req_valids <= 8'd0;
	main_sdram_choose_req_valids[0] <= (main_sdram_bankmachine0_cmd_valid & (((main_sdram_bankmachine0_cmd_payload_is_cmd & main_sdram_choose_req_want_cmds) & ((~((main_sdram_bankmachine0_cmd_payload_ras & (~main_sdram_bankmachine0_cmd_payload_cas)) & (~main_sdram_bankmachine0_cmd_payload_we))) | main_sdram_choose_req_want_activates)) | ((main_sdram_bankmachine0_cmd_payload_is_read == main_sdram_choose_req_want_reads) & (main_sdram_bankmachine0_cmd_payload_is_write == main_sdram_choose_req_want_writes))));
	main_sdram_choose_req_valids[1] <= (main_sdram_bankmachine1_cmd_valid & (((main_sdram_bankmachine1_cmd_payload_is_cmd & main_sdram_choose_req_want_cmds) & ((~((main_sdram_bankmachine1_cmd_payload_ras & (~main_sdram_bankmachine1_cmd_payload_cas)) & (~main_sdram_bankmachine1_cmd_payload_we))) | main_sdram_choose_req_want_activates)) | ((main_sdram_bankmachine1_cmd_payload_is_read == main_sdram_choose_req_want_reads) & (main_sdram_bankmachine1_cmd_payload_is_write == main_sdram_choose_req_want_writes))));
	main_sdram_choose_req_valids[2] <= (main_sdram_bankmachine2_cmd_valid & (((main_sdram_bankmachine2_cmd_payload_is_cmd & main_sdram_choose_req_want_cmds) & ((~((main_sdram_bankmachine2_cmd_payload_ras & (~main_sdram_bankmachine2_cmd_payload_cas)) & (~main_sdram_bankmachine2_cmd_payload_we))) | main_sdram_choose_req_want_activates)) | ((main_sdram_bankmachine2_cmd_payload_is_read == main_sdram_choose_req_want_reads) & (main_sdram_bankmachine2_cmd_payload_is_write == main_sdram_choose_req_want_writes))));
	main_sdram_choose_req_valids[3] <= (main_sdram_bankmachine3_cmd_valid & (((main_sdram_bankmachine3_cmd_payload_is_cmd & main_sdram_choose_req_want_cmds) & ((~((main_sdram_bankmachine3_cmd_payload_ras & (~main_sdram_bankmachine3_cmd_payload_cas)) & (~main_sdram_bankmachine3_cmd_payload_we))) | main_sdram_choose_req_want_activates)) | ((main_sdram_bankmachine3_cmd_payload_is_read == main_sdram_choose_req_want_reads) & (main_sdram_bankmachine3_cmd_payload_is_write == main_sdram_choose_req_want_writes))));
	main_sdram_choose_req_valids[4] <= (main_sdram_bankmachine4_cmd_valid & (((main_sdram_bankmachine4_cmd_payload_is_cmd & main_sdram_choose_req_want_cmds) & ((~((main_sdram_bankmachine4_cmd_payload_ras & (~main_sdram_bankmachine4_cmd_payload_cas)) & (~main_sdram_bankmachine4_cmd_payload_we))) | main_sdram_choose_req_want_activates)) | ((main_sdram_bankmachine4_cmd_payload_is_read == main_sdram_choose_req_want_reads) & (main_sdram_bankmachine4_cmd_payload_is_write == main_sdram_choose_req_want_writes))));
	main_sdram_choose_req_valids[5] <= (main_sdram_bankmachine5_cmd_valid & (((main_sdram_bankmachine5_cmd_payload_is_cmd & main_sdram_choose_req_want_cmds) & ((~((main_sdram_bankmachine5_cmd_payload_ras & (~main_sdram_bankmachine5_cmd_payload_cas)) & (~main_sdram_bankmachine5_cmd_payload_we))) | main_sdram_choose_req_want_activates)) | ((main_sdram_bankmachine5_cmd_payload_is_read == main_sdram_choose_req_want_reads) & (main_sdram_bankmachine5_cmd_payload_is_write == main_sdram_choose_req_want_writes))));
	main_sdram_choose_req_valids[6] <= (main_sdram_bankmachine6_cmd_valid & (((main_sdram_bankmachine6_cmd_payload_is_cmd & main_sdram_choose_req_want_cmds) & ((~((main_sdram_bankmachine6_cmd_payload_ras & (~main_sdram_bankmachine6_cmd_payload_cas)) & (~main_sdram_bankmachine6_cmd_payload_we))) | main_sdram_choose_req_want_activates)) | ((main_sdram_bankmachine6_cmd_payload_is_read == main_sdram_choose_req_want_reads) & (main_sdram_bankmachine6_cmd_payload_is_write == main_sdram_choose_req_want_writes))));
	main_sdram_choose_req_valids[7] <= (main_sdram_bankmachine7_cmd_valid & (((main_sdram_bankmachine7_cmd_payload_is_cmd & main_sdram_choose_req_want_cmds) & ((~((main_sdram_bankmachine7_cmd_payload_ras & (~main_sdram_bankmachine7_cmd_payload_cas)) & (~main_sdram_bankmachine7_cmd_payload_we))) | main_sdram_choose_req_want_activates)) | ((main_sdram_bankmachine7_cmd_payload_is_read == main_sdram_choose_req_want_reads) & (main_sdram_bankmachine7_cmd_payload_is_write == main_sdram_choose_req_want_writes))));
end
assign main_sdram_choose_req_request = main_sdram_choose_req_valids;
assign main_sdram_choose_req_cmd_valid = builder_rhs_array_muxed6;
assign main_sdram_choose_req_cmd_payload_a = builder_rhs_array_muxed7;
assign main_sdram_choose_req_cmd_payload_ba = builder_rhs_array_muxed8;
assign main_sdram_choose_req_cmd_payload_is_read = builder_rhs_array_muxed9;
assign main_sdram_choose_req_cmd_payload_is_write = builder_rhs_array_muxed10;
assign main_sdram_choose_req_cmd_payload_is_cmd = builder_rhs_array_muxed11;
always @(*) begin
	main_sdram_choose_req_cmd_payload_cas <= 1'd0;
	if (main_sdram_choose_req_cmd_valid) begin
		main_sdram_choose_req_cmd_payload_cas <= builder_t_array_muxed3;
	end
end
always @(*) begin
	main_sdram_choose_req_cmd_payload_ras <= 1'd0;
	if (main_sdram_choose_req_cmd_valid) begin
		main_sdram_choose_req_cmd_payload_ras <= builder_t_array_muxed4;
	end
end
always @(*) begin
	main_sdram_choose_req_cmd_payload_we <= 1'd0;
	if (main_sdram_choose_req_cmd_valid) begin
		main_sdram_choose_req_cmd_payload_we <= builder_t_array_muxed5;
	end
end
always @(*) begin
	main_sdram_bankmachine0_cmd_ready <= 1'd0;
	if (((main_sdram_choose_cmd_cmd_valid & main_sdram_choose_cmd_cmd_ready) & (main_sdram_choose_cmd_grant == 1'd0))) begin
		main_sdram_bankmachine0_cmd_ready <= 1'd1;
	end
	if (((main_sdram_choose_req_cmd_valid & main_sdram_choose_req_cmd_ready) & (main_sdram_choose_req_grant == 1'd0))) begin
		main_sdram_bankmachine0_cmd_ready <= 1'd1;
	end
end
always @(*) begin
	main_sdram_bankmachine1_cmd_ready <= 1'd0;
	if (((main_sdram_choose_cmd_cmd_valid & main_sdram_choose_cmd_cmd_ready) & (main_sdram_choose_cmd_grant == 1'd1))) begin
		main_sdram_bankmachine1_cmd_ready <= 1'd1;
	end
	if (((main_sdram_choose_req_cmd_valid & main_sdram_choose_req_cmd_ready) & (main_sdram_choose_req_grant == 1'd1))) begin
		main_sdram_bankmachine1_cmd_ready <= 1'd1;
	end
end
always @(*) begin
	main_sdram_bankmachine2_cmd_ready <= 1'd0;
	if (((main_sdram_choose_cmd_cmd_valid & main_sdram_choose_cmd_cmd_ready) & (main_sdram_choose_cmd_grant == 2'd2))) begin
		main_sdram_bankmachine2_cmd_ready <= 1'd1;
	end
	if (((main_sdram_choose_req_cmd_valid & main_sdram_choose_req_cmd_ready) & (main_sdram_choose_req_grant == 2'd2))) begin
		main_sdram_bankmachine2_cmd_ready <= 1'd1;
	end
end
always @(*) begin
	main_sdram_bankmachine3_cmd_ready <= 1'd0;
	if (((main_sdram_choose_cmd_cmd_valid & main_sdram_choose_cmd_cmd_ready) & (main_sdram_choose_cmd_grant == 2'd3))) begin
		main_sdram_bankmachine3_cmd_ready <= 1'd1;
	end
	if (((main_sdram_choose_req_cmd_valid & main_sdram_choose_req_cmd_ready) & (main_sdram_choose_req_grant == 2'd3))) begin
		main_sdram_bankmachine3_cmd_ready <= 1'd1;
	end
end
always @(*) begin
	main_sdram_bankmachine4_cmd_ready <= 1'd0;
	if (((main_sdram_choose_cmd_cmd_valid & main_sdram_choose_cmd_cmd_ready) & (main_sdram_choose_cmd_grant == 3'd4))) begin
		main_sdram_bankmachine4_cmd_ready <= 1'd1;
	end
	if (((main_sdram_choose_req_cmd_valid & main_sdram_choose_req_cmd_ready) & (main_sdram_choose_req_grant == 3'd4))) begin
		main_sdram_bankmachine4_cmd_ready <= 1'd1;
	end
end
always @(*) begin
	main_sdram_bankmachine5_cmd_ready <= 1'd0;
	if (((main_sdram_choose_cmd_cmd_valid & main_sdram_choose_cmd_cmd_ready) & (main_sdram_choose_cmd_grant == 3'd5))) begin
		main_sdram_bankmachine5_cmd_ready <= 1'd1;
	end
	if (((main_sdram_choose_req_cmd_valid & main_sdram_choose_req_cmd_ready) & (main_sdram_choose_req_grant == 3'd5))) begin
		main_sdram_bankmachine5_cmd_ready <= 1'd1;
	end
end
always @(*) begin
	main_sdram_bankmachine6_cmd_ready <= 1'd0;
	if (((main_sdram_choose_cmd_cmd_valid & main_sdram_choose_cmd_cmd_ready) & (main_sdram_choose_cmd_grant == 3'd6))) begin
		main_sdram_bankmachine6_cmd_ready <= 1'd1;
	end
	if (((main_sdram_choose_req_cmd_valid & main_sdram_choose_req_cmd_ready) & (main_sdram_choose_req_grant == 3'd6))) begin
		main_sdram_bankmachine6_cmd_ready <= 1'd1;
	end
end
always @(*) begin
	main_sdram_bankmachine7_cmd_ready <= 1'd0;
	if (((main_sdram_choose_cmd_cmd_valid & main_sdram_choose_cmd_cmd_ready) & (main_sdram_choose_cmd_grant == 3'd7))) begin
		main_sdram_bankmachine7_cmd_ready <= 1'd1;
	end
	if (((main_sdram_choose_req_cmd_valid & main_sdram_choose_req_cmd_ready) & (main_sdram_choose_req_grant == 3'd7))) begin
		main_sdram_bankmachine7_cmd_ready <= 1'd1;
	end
end
assign main_sdram_choose_req_ce = (main_sdram_choose_req_cmd_ready | (~main_sdram_choose_req_cmd_valid));
assign main_sdram_dfi_p0_reset_n = 1'd1;
assign main_sdram_dfi_p0_cke = {1{main_sdram_steerer0}};
assign main_sdram_dfi_p0_odt = {1{main_sdram_steerer1}};
assign main_sdram_dfi_p1_reset_n = 1'd1;
assign main_sdram_dfi_p1_cke = {1{main_sdram_steerer2}};
assign main_sdram_dfi_p1_odt = {1{main_sdram_steerer3}};
assign main_sdram_dfi_p2_reset_n = 1'd1;
assign main_sdram_dfi_p2_cke = {1{main_sdram_steerer4}};
assign main_sdram_dfi_p2_odt = {1{main_sdram_steerer5}};
assign main_sdram_dfi_p3_reset_n = 1'd1;
assign main_sdram_dfi_p3_cke = {1{main_sdram_steerer6}};
assign main_sdram_dfi_p3_odt = {1{main_sdram_steerer7}};
assign main_sdram_tfawcon_count = ((((main_sdram_tfawcon_window[0] + main_sdram_tfawcon_window[1]) + main_sdram_tfawcon_window[2]) + main_sdram_tfawcon_window[3]) + main_sdram_tfawcon_window[4]);
always @(*) begin
	main_sdram_steerer_sel0 <= 2'd0;
	main_sdram_steerer_sel1 <= 2'd0;
	builder_multiplexer_next_state <= 4'd0;
	main_sdram_steerer_sel2 <= 2'd0;
	main_sdram_choose_cmd_want_activates <= 1'd0;
	main_sdram_steerer_sel3 <= 2'd0;
	main_sdram_en0 <= 1'd0;
	main_sdram_cmd_ready <= 1'd0;
	main_sdram_choose_cmd_cmd_ready <= 1'd0;
	main_sdram_choose_req_want_reads <= 1'd0;
	main_sdram_choose_req_want_writes <= 1'd0;
	main_sdram_choose_req_cmd_ready <= 1'd0;
	main_sdram_en1 <= 1'd0;
	builder_multiplexer_next_state <= builder_multiplexer_state;
	case (builder_multiplexer_state)
		1'd1: begin
			main_sdram_en1 <= 1'd1;
			main_sdram_choose_req_want_writes <= 1'd1;
			if (1'd0) begin
				main_sdram_choose_req_cmd_ready <= (main_sdram_cas_allowed & ((~((main_sdram_choose_req_cmd_payload_ras & (~main_sdram_choose_req_cmd_payload_cas)) & (~main_sdram_choose_req_cmd_payload_we))) | main_sdram_ras_allowed));
			end else begin
				main_sdram_choose_cmd_want_activates <= main_sdram_ras_allowed;
				main_sdram_choose_cmd_cmd_ready <= ((~((main_sdram_choose_cmd_cmd_payload_ras & (~main_sdram_choose_cmd_cmd_payload_cas)) & (~main_sdram_choose_cmd_cmd_payload_we))) | main_sdram_ras_allowed);
				main_sdram_choose_req_cmd_ready <= main_sdram_cas_allowed;
			end
			main_sdram_steerer_sel0 <= 1'd0;
			main_sdram_steerer_sel1 <= 1'd0;
			main_sdram_steerer_sel2 <= 1'd1;
			main_sdram_steerer_sel3 <= 2'd2;
			if (main_sdram_read_available) begin
				if (((~main_sdram_write_available) | main_sdram_max_time1)) begin
					builder_multiplexer_next_state <= 2'd3;
				end
			end
			if (main_sdram_go_to_refresh) begin
				builder_multiplexer_next_state <= 2'd2;
			end
		end
		2'd2: begin
			main_sdram_steerer_sel0 <= 2'd3;
			main_sdram_cmd_ready <= 1'd1;
			if (main_sdram_cmd_last) begin
				builder_multiplexer_next_state <= 1'd0;
			end
		end
		2'd3: begin
			if (main_sdram_twtrcon_ready) begin
				builder_multiplexer_next_state <= 1'd0;
			end
		end
		3'd4: begin
			builder_multiplexer_next_state <= 3'd5;
		end
		3'd5: begin
			builder_multiplexer_next_state <= 3'd6;
		end
		3'd6: begin
			builder_multiplexer_next_state <= 3'd7;
		end
		3'd7: begin
			builder_multiplexer_next_state <= 4'd8;
		end
		4'd8: begin
			builder_multiplexer_next_state <= 4'd9;
		end
		4'd9: begin
			builder_multiplexer_next_state <= 1'd1;
		end
		default: begin
			main_sdram_en0 <= 1'd1;
			main_sdram_choose_req_want_reads <= 1'd1;
			if (1'd0) begin
				main_sdram_choose_req_cmd_ready <= (main_sdram_cas_allowed & ((~((main_sdram_choose_req_cmd_payload_ras & (~main_sdram_choose_req_cmd_payload_cas)) & (~main_sdram_choose_req_cmd_payload_we))) | main_sdram_ras_allowed));
			end else begin
				main_sdram_choose_cmd_want_activates <= main_sdram_ras_allowed;
				main_sdram_choose_cmd_cmd_ready <= ((~((main_sdram_choose_cmd_cmd_payload_ras & (~main_sdram_choose_cmd_cmd_payload_cas)) & (~main_sdram_choose_cmd_cmd_payload_we))) | main_sdram_ras_allowed);
				main_sdram_choose_req_cmd_ready <= main_sdram_cas_allowed;
			end
			main_sdram_steerer_sel0 <= 1'd0;
			main_sdram_steerer_sel1 <= 1'd1;
			main_sdram_steerer_sel2 <= 2'd2;
			main_sdram_steerer_sel3 <= 1'd0;
			if (main_sdram_write_available) begin
				if (((~main_sdram_read_available) | main_sdram_max_time0)) begin
					builder_multiplexer_next_state <= 3'd4;
				end
			end
			if (main_sdram_go_to_refresh) begin
				builder_multiplexer_next_state <= 2'd2;
			end
		end
	endcase
end
assign builder_roundrobin0_request = {(((main_litedramnativeport1_cmd_payload_addr[9:7] == 1'd0) & (~(((((((builder_locked1 | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd1))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd1))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd1))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd1))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd1))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd1))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd1))))) & main_litedramnativeport1_cmd_valid), (((main_litedramnativeport0_cmd_payload_addr[9:7] == 1'd0) & (~(((((((builder_locked0 | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0))))) & main_litedramnativeport0_cmd_valid)};
assign builder_roundrobin0_ce = ((~main_sdram_interface_bank0_valid) & (~main_sdram_interface_bank0_lock));
assign main_sdram_interface_bank0_addr = builder_rhs_array_muxed12;
assign main_sdram_interface_bank0_we = builder_rhs_array_muxed13;
assign main_sdram_interface_bank0_valid = builder_rhs_array_muxed14;
assign builder_roundrobin1_request = {(((main_litedramnativeport1_cmd_payload_addr[9:7] == 1'd1) & (~(((((((builder_locked3 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd1))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd1))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd1))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd1))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd1))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd1))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd1))))) & main_litedramnativeport1_cmd_valid), (((main_litedramnativeport0_cmd_payload_addr[9:7] == 1'd1) & (~(((((((builder_locked2 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0))))) & main_litedramnativeport0_cmd_valid)};
assign builder_roundrobin1_ce = ((~main_sdram_interface_bank1_valid) & (~main_sdram_interface_bank1_lock));
assign main_sdram_interface_bank1_addr = builder_rhs_array_muxed15;
assign main_sdram_interface_bank1_we = builder_rhs_array_muxed16;
assign main_sdram_interface_bank1_valid = builder_rhs_array_muxed17;
assign builder_roundrobin2_request = {(((main_litedramnativeport1_cmd_payload_addr[9:7] == 2'd2) & (~(((((((builder_locked5 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd1))) | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd1))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd1))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd1))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd1))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd1))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd1))))) & main_litedramnativeport1_cmd_valid), (((main_litedramnativeport0_cmd_payload_addr[9:7] == 2'd2) & (~(((((((builder_locked4 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0))))) & main_litedramnativeport0_cmd_valid)};
assign builder_roundrobin2_ce = ((~main_sdram_interface_bank2_valid) & (~main_sdram_interface_bank2_lock));
assign main_sdram_interface_bank2_addr = builder_rhs_array_muxed18;
assign main_sdram_interface_bank2_we = builder_rhs_array_muxed19;
assign main_sdram_interface_bank2_valid = builder_rhs_array_muxed20;
assign builder_roundrobin3_request = {(((main_litedramnativeport1_cmd_payload_addr[9:7] == 2'd3) & (~(((((((builder_locked7 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd1))) | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd1))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd1))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd1))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd1))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd1))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd1))))) & main_litedramnativeport1_cmd_valid), (((main_litedramnativeport0_cmd_payload_addr[9:7] == 2'd3) & (~(((((((builder_locked6 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0))))) & main_litedramnativeport0_cmd_valid)};
assign builder_roundrobin3_ce = ((~main_sdram_interface_bank3_valid) & (~main_sdram_interface_bank3_lock));
assign main_sdram_interface_bank3_addr = builder_rhs_array_muxed21;
assign main_sdram_interface_bank3_we = builder_rhs_array_muxed22;
assign main_sdram_interface_bank3_valid = builder_rhs_array_muxed23;
assign builder_roundrobin4_request = {(((main_litedramnativeport1_cmd_payload_addr[9:7] == 3'd4) & (~(((((((builder_locked9 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd1))) | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd1))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd1))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd1))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd1))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd1))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd1))))) & main_litedramnativeport1_cmd_valid), (((main_litedramnativeport0_cmd_payload_addr[9:7] == 3'd4) & (~(((((((builder_locked8 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0))))) & main_litedramnativeport0_cmd_valid)};
assign builder_roundrobin4_ce = ((~main_sdram_interface_bank4_valid) & (~main_sdram_interface_bank4_lock));
assign main_sdram_interface_bank4_addr = builder_rhs_array_muxed24;
assign main_sdram_interface_bank4_we = builder_rhs_array_muxed25;
assign main_sdram_interface_bank4_valid = builder_rhs_array_muxed26;
assign builder_roundrobin5_request = {(((main_litedramnativeport1_cmd_payload_addr[9:7] == 3'd5) & (~(((((((builder_locked11 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd1))) | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd1))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd1))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd1))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd1))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd1))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd1))))) & main_litedramnativeport1_cmd_valid), (((main_litedramnativeport0_cmd_payload_addr[9:7] == 3'd5) & (~(((((((builder_locked10 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0))))) & main_litedramnativeport0_cmd_valid)};
assign builder_roundrobin5_ce = ((~main_sdram_interface_bank5_valid) & (~main_sdram_interface_bank5_lock));
assign main_sdram_interface_bank5_addr = builder_rhs_array_muxed27;
assign main_sdram_interface_bank5_we = builder_rhs_array_muxed28;
assign main_sdram_interface_bank5_valid = builder_rhs_array_muxed29;
assign builder_roundrobin6_request = {(((main_litedramnativeport1_cmd_payload_addr[9:7] == 3'd6) & (~(((((((builder_locked13 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd1))) | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd1))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd1))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd1))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd1))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd1))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd1))))) & main_litedramnativeport1_cmd_valid), (((main_litedramnativeport0_cmd_payload_addr[9:7] == 3'd6) & (~(((((((builder_locked12 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0))))) & main_litedramnativeport0_cmd_valid)};
assign builder_roundrobin6_ce = ((~main_sdram_interface_bank6_valid) & (~main_sdram_interface_bank6_lock));
assign main_sdram_interface_bank6_addr = builder_rhs_array_muxed30;
assign main_sdram_interface_bank6_we = builder_rhs_array_muxed31;
assign main_sdram_interface_bank6_valid = builder_rhs_array_muxed32;
assign builder_roundrobin7_request = {(((main_litedramnativeport1_cmd_payload_addr[9:7] == 3'd7) & (~(((((((builder_locked15 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd1))) | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd1))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd1))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd1))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd1))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd1))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd1))))) & main_litedramnativeport1_cmd_valid), (((main_litedramnativeport0_cmd_payload_addr[9:7] == 3'd7) & (~(((((((builder_locked14 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0))))) & main_litedramnativeport0_cmd_valid)};
assign builder_roundrobin7_ce = ((~main_sdram_interface_bank7_valid) & (~main_sdram_interface_bank7_lock));
assign main_sdram_interface_bank7_addr = builder_rhs_array_muxed33;
assign main_sdram_interface_bank7_we = builder_rhs_array_muxed34;
assign main_sdram_interface_bank7_valid = builder_rhs_array_muxed35;
assign main_litedramnativeport0_cmd_ready = ((((((((1'd0 | (((builder_roundrobin0_grant == 1'd0) & ((main_litedramnativeport0_cmd_payload_addr[9:7] == 1'd0) & (~(((((((builder_locked0 | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0)))))) & main_sdram_interface_bank0_ready)) | (((builder_roundrobin1_grant == 1'd0) & ((main_litedramnativeport0_cmd_payload_addr[9:7] == 1'd1) & (~(((((((builder_locked2 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0)))))) & main_sdram_interface_bank1_ready)) | (((builder_roundrobin2_grant == 1'd0) & ((main_litedramnativeport0_cmd_payload_addr[9:7] == 2'd2) & (~(((((((builder_locked4 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0)))))) & main_sdram_interface_bank2_ready)) | (((builder_roundrobin3_grant == 1'd0) & ((main_litedramnativeport0_cmd_payload_addr[9:7] == 2'd3) & (~(((((((builder_locked6 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0)))))) & main_sdram_interface_bank3_ready)) | (((builder_roundrobin4_grant == 1'd0) & ((main_litedramnativeport0_cmd_payload_addr[9:7] == 3'd4) & (~(((((((builder_locked8 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0)))))) & main_sdram_interface_bank4_ready)) | (((builder_roundrobin5_grant == 1'd0) & ((main_litedramnativeport0_cmd_payload_addr[9:7] == 3'd5) & (~(((((((builder_locked10 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0)))))) & main_sdram_interface_bank5_ready)) | (((builder_roundrobin6_grant == 1'd0) & ((main_litedramnativeport0_cmd_payload_addr[9:7] == 3'd6) & (~(((((((builder_locked12 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0)))))) & main_sdram_interface_bank6_ready)) | (((builder_roundrobin7_grant == 1'd0) & ((main_litedramnativeport0_cmd_payload_addr[9:7] == 3'd7) & (~(((((((builder_locked14 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0)))))) & main_sdram_interface_bank7_ready));
assign main_litedramnativeport1_cmd_ready = ((((((((1'd0 | (((builder_roundrobin0_grant == 1'd1) & ((main_litedramnativeport1_cmd_payload_addr[9:7] == 1'd0) & (~(((((((builder_locked1 | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd1))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd1))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd1))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd1))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd1))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd1))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd1)))))) & main_sdram_interface_bank0_ready)) | (((builder_roundrobin1_grant == 1'd1) & ((main_litedramnativeport1_cmd_payload_addr[9:7] == 1'd1) & (~(((((((builder_locked3 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd1))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd1))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd1))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd1))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd1))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd1))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd1)))))) & main_sdram_interface_bank1_ready)) | (((builder_roundrobin2_grant == 1'd1) & ((main_litedramnativeport1_cmd_payload_addr[9:7] == 2'd2) & (~(((((((builder_locked5 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd1))) | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd1))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd1))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd1))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd1))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd1))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd1)))))) & main_sdram_interface_bank2_ready)) | (((builder_roundrobin3_grant == 1'd1) & ((main_litedramnativeport1_cmd_payload_addr[9:7] == 2'd3) & (~(((((((builder_locked7 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd1))) | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd1))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd1))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd1))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd1))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd1))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd1)))))) & main_sdram_interface_bank3_ready)) | (((builder_roundrobin4_grant == 1'd1) & ((main_litedramnativeport1_cmd_payload_addr[9:7] == 3'd4) & (~(((((((builder_locked9 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd1))) | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd1))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd1))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd1))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd1))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd1))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd1)))))) & main_sdram_interface_bank4_ready)) | (((builder_roundrobin5_grant == 1'd1) & ((main_litedramnativeport1_cmd_payload_addr[9:7] == 3'd5) & (~(((((((builder_locked11 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd1))) | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd1))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd1))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd1))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd1))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd1))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd1)))))) & main_sdram_interface_bank5_ready)) | (((builder_roundrobin6_grant == 1'd1) & ((main_litedramnativeport1_cmd_payload_addr[9:7] == 3'd6) & (~(((((((builder_locked13 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd1))) | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd1))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd1))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd1))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd1))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd1))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd1)))))) & main_sdram_interface_bank6_ready)) | (((builder_roundrobin7_grant == 1'd1) & ((main_litedramnativeport1_cmd_payload_addr[9:7] == 3'd7) & (~(((((((builder_locked15 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd1))) | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd1))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd1))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd1))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd1))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd1))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd1)))))) & main_sdram_interface_bank7_ready));
assign main_litedramnativeport0_wdata_ready = builder_new_master_wdata_ready2;
assign main_litedramnativeport1_wdata_ready = builder_new_master_wdata_ready5;
assign main_litedramnativeport0_rdata_valid = builder_new_master_rdata_valid7;
assign main_litedramnativeport1_rdata_valid = builder_new_master_rdata_valid15;
always @(*) begin
	main_sdram_interface_wdata_we <= 16'd0;
	main_sdram_interface_wdata <= 128'd0;
	case ({builder_new_master_wdata_ready5, builder_new_master_wdata_ready2})
		1'd1: begin
			main_sdram_interface_wdata <= main_litedramnativeport0_wdata_payload_data;
			main_sdram_interface_wdata_we <= main_litedramnativeport0_wdata_payload_we;
		end
		2'd2: begin
			main_sdram_interface_wdata <= main_litedramnativeport1_wdata_payload_data;
			main_sdram_interface_wdata_we <= main_litedramnativeport1_wdata_payload_we;
		end
		default: begin
			main_sdram_interface_wdata <= 1'd0;
			main_sdram_interface_wdata_we <= 1'd0;
		end
	endcase
end
assign main_litedramnativeport0_rdata_payload_data = main_sdram_interface_rdata;
assign main_litedramnativeport1_rdata_payload_data = main_sdram_interface_rdata;
assign builder_shared_adr = builder_rhs_array_muxed36;
assign builder_shared_dat_w = builder_rhs_array_muxed37;
assign builder_shared_sel = builder_rhs_array_muxed38;
assign builder_shared_cyc = builder_rhs_array_muxed39;
assign builder_shared_stb = builder_rhs_array_muxed40;
assign builder_shared_we = builder_rhs_array_muxed41;
assign builder_shared_cti = builder_rhs_array_muxed42;
assign builder_shared_bte = builder_rhs_array_muxed43;
assign main_basesoc_vexriscvsmp_pbus_dat_r = builder_shared_dat_r;
assign main_basesoc_vexriscvsmp_pbus_ack = (builder_shared_ack & (builder_grant == 1'd0));
assign main_basesoc_vexriscvsmp_pbus_err = (builder_shared_err & (builder_grant == 1'd0));
assign builder_request = {main_basesoc_vexriscvsmp_pbus_cyc};
assign builder_grant = 1'd0;
always @(*) begin
	builder_slave_sel <= 4'd0;
	builder_slave_sel[0] <= (builder_shared_adr[29:13] == 1'd0);
	builder_slave_sel[1] <= (builder_shared_adr[29:10] == 17'd65536);
	builder_slave_sel[2] <= (builder_shared_adr[29:14] == 16'd61440);
	builder_slave_sel[3] <= (builder_shared_adr[29:14] == 16'd61441);
end
assign main_basesoc_basesoc_ram_bus_adr = builder_shared_adr;
assign main_basesoc_basesoc_ram_bus_dat_w = builder_shared_dat_w;
assign main_basesoc_basesoc_ram_bus_sel = builder_shared_sel;
assign main_basesoc_basesoc_ram_bus_stb = builder_shared_stb;
assign main_basesoc_basesoc_ram_bus_we = builder_shared_we;
assign main_basesoc_basesoc_ram_bus_cti = builder_shared_cti;
assign main_basesoc_basesoc_ram_bus_bte = builder_shared_bte;
assign main_basesoc_ram_bus_ram_bus_adr = builder_shared_adr;
assign main_basesoc_ram_bus_ram_bus_dat_w = builder_shared_dat_w;
assign main_basesoc_ram_bus_ram_bus_sel = builder_shared_sel;
assign main_basesoc_ram_bus_ram_bus_stb = builder_shared_stb;
assign main_basesoc_ram_bus_ram_bus_we = builder_shared_we;
assign main_basesoc_ram_bus_ram_bus_cti = builder_shared_cti;
assign main_basesoc_ram_bus_ram_bus_bte = builder_shared_bte;
assign main_basesoc_bus_wishbone_adr = builder_shared_adr;
assign main_basesoc_bus_wishbone_dat_w = builder_shared_dat_w;
assign main_basesoc_bus_wishbone_sel = builder_shared_sel;
assign main_basesoc_bus_wishbone_stb = builder_shared_stb;
assign main_basesoc_bus_wishbone_we = builder_shared_we;
assign main_basesoc_bus_wishbone_cti = builder_shared_cti;
assign main_basesoc_bus_wishbone_bte = builder_shared_bte;
assign main_basesoc_vexriscvsmp_cbus_adr = builder_shared_adr;
assign main_basesoc_vexriscvsmp_cbus_dat_w = builder_shared_dat_w;
assign main_basesoc_vexriscvsmp_cbus_sel = builder_shared_sel;
assign main_basesoc_vexriscvsmp_cbus_stb = builder_shared_stb;
assign main_basesoc_vexriscvsmp_cbus_we = builder_shared_we;
assign main_basesoc_vexriscvsmp_cbus_cti = builder_shared_cti;
assign main_basesoc_vexriscvsmp_cbus_bte = builder_shared_bte;
assign main_basesoc_basesoc_ram_bus_cyc = (builder_shared_cyc & builder_slave_sel[0]);
assign main_basesoc_ram_bus_ram_bus_cyc = (builder_shared_cyc & builder_slave_sel[1]);
assign main_basesoc_bus_wishbone_cyc = (builder_shared_cyc & builder_slave_sel[2]);
assign main_basesoc_vexriscvsmp_cbus_cyc = (builder_shared_cyc & builder_slave_sel[3]);
assign builder_shared_err = (((main_basesoc_basesoc_ram_bus_err | main_basesoc_ram_bus_ram_bus_err) | main_basesoc_bus_wishbone_err) | main_basesoc_vexriscvsmp_cbus_err);
assign builder_wait = ((builder_shared_stb & builder_shared_cyc) & (~builder_shared_ack));
always @(*) begin
	builder_shared_dat_r <= 32'd0;
	builder_shared_ack <= 1'd0;
	builder_error <= 1'd0;
	builder_shared_ack <= (((main_basesoc_basesoc_ram_bus_ack | main_basesoc_ram_bus_ram_bus_ack) | main_basesoc_bus_wishbone_ack) | main_basesoc_vexriscvsmp_cbus_ack);
	builder_shared_dat_r <= (((({32{builder_slave_sel_r[0]}} & main_basesoc_basesoc_ram_bus_dat_r) | ({32{builder_slave_sel_r[1]}} & main_basesoc_ram_bus_ram_bus_dat_r)) | ({32{builder_slave_sel_r[2]}} & main_basesoc_bus_wishbone_dat_r)) | ({32{builder_slave_sel_r[3]}} & main_basesoc_vexriscvsmp_cbus_dat_r));
	if (builder_done) begin
		builder_shared_dat_r <= 32'd4294967295;
		builder_shared_ack <= 1'd1;
		builder_error <= 1'd1;
	end
end
assign builder_done = (builder_count == 1'd0);
assign builder_csrbank0_sel = (builder_interface0_bank_bus_adr[13:9] == 1'd0);
assign builder_csrbank0_reset0_r = builder_interface0_bank_bus_dat_w[0];
assign builder_csrbank0_reset0_re = ((builder_csrbank0_sel & builder_interface0_bank_bus_we) & (builder_interface0_bank_bus_adr[3:0] == 1'd0));
assign builder_csrbank0_reset0_we = ((builder_csrbank0_sel & (~builder_interface0_bank_bus_we)) & (builder_interface0_bank_bus_adr[3:0] == 1'd0));
assign builder_csrbank0_scratch3_r = builder_interface0_bank_bus_dat_w[7:0];
assign builder_csrbank0_scratch3_re = ((builder_csrbank0_sel & builder_interface0_bank_bus_we) & (builder_interface0_bank_bus_adr[3:0] == 1'd1));
assign builder_csrbank0_scratch3_we = ((builder_csrbank0_sel & (~builder_interface0_bank_bus_we)) & (builder_interface0_bank_bus_adr[3:0] == 1'd1));
assign builder_csrbank0_scratch2_r = builder_interface0_bank_bus_dat_w[7:0];
assign builder_csrbank0_scratch2_re = ((builder_csrbank0_sel & builder_interface0_bank_bus_we) & (builder_interface0_bank_bus_adr[3:0] == 2'd2));
assign builder_csrbank0_scratch2_we = ((builder_csrbank0_sel & (~builder_interface0_bank_bus_we)) & (builder_interface0_bank_bus_adr[3:0] == 2'd2));
assign builder_csrbank0_scratch1_r = builder_interface0_bank_bus_dat_w[7:0];
assign builder_csrbank0_scratch1_re = ((builder_csrbank0_sel & builder_interface0_bank_bus_we) & (builder_interface0_bank_bus_adr[3:0] == 2'd3));
assign builder_csrbank0_scratch1_we = ((builder_csrbank0_sel & (~builder_interface0_bank_bus_we)) & (builder_interface0_bank_bus_adr[3:0] == 2'd3));
assign builder_csrbank0_scratch0_r = builder_interface0_bank_bus_dat_w[7:0];
assign builder_csrbank0_scratch0_re = ((builder_csrbank0_sel & builder_interface0_bank_bus_we) & (builder_interface0_bank_bus_adr[3:0] == 3'd4));
assign builder_csrbank0_scratch0_we = ((builder_csrbank0_sel & (~builder_interface0_bank_bus_we)) & (builder_interface0_bank_bus_adr[3:0] == 3'd4));
assign builder_csrbank0_bus_errors3_r = builder_interface0_bank_bus_dat_w[7:0];
assign builder_csrbank0_bus_errors3_re = ((builder_csrbank0_sel & builder_interface0_bank_bus_we) & (builder_interface0_bank_bus_adr[3:0] == 3'd5));
assign builder_csrbank0_bus_errors3_we = ((builder_csrbank0_sel & (~builder_interface0_bank_bus_we)) & (builder_interface0_bank_bus_adr[3:0] == 3'd5));
assign builder_csrbank0_bus_errors2_r = builder_interface0_bank_bus_dat_w[7:0];
assign builder_csrbank0_bus_errors2_re = ((builder_csrbank0_sel & builder_interface0_bank_bus_we) & (builder_interface0_bank_bus_adr[3:0] == 3'd6));
assign builder_csrbank0_bus_errors2_we = ((builder_csrbank0_sel & (~builder_interface0_bank_bus_we)) & (builder_interface0_bank_bus_adr[3:0] == 3'd6));
assign builder_csrbank0_bus_errors1_r = builder_interface0_bank_bus_dat_w[7:0];
assign builder_csrbank0_bus_errors1_re = ((builder_csrbank0_sel & builder_interface0_bank_bus_we) & (builder_interface0_bank_bus_adr[3:0] == 3'd7));
assign builder_csrbank0_bus_errors1_we = ((builder_csrbank0_sel & (~builder_interface0_bank_bus_we)) & (builder_interface0_bank_bus_adr[3:0] == 3'd7));
assign builder_csrbank0_bus_errors0_r = builder_interface0_bank_bus_dat_w[7:0];
assign builder_csrbank0_bus_errors0_re = ((builder_csrbank0_sel & builder_interface0_bank_bus_we) & (builder_interface0_bank_bus_adr[3:0] == 4'd8));
assign builder_csrbank0_bus_errors0_we = ((builder_csrbank0_sel & (~builder_interface0_bank_bus_we)) & (builder_interface0_bank_bus_adr[3:0] == 4'd8));
assign builder_csrbank0_reset0_w = main_basesoc_soccontroller_reset_storage;
assign builder_csrbank0_scratch3_w = main_basesoc_soccontroller_scratch_storage[31:24];
assign builder_csrbank0_scratch2_w = main_basesoc_soccontroller_scratch_storage[23:16];
assign builder_csrbank0_scratch1_w = main_basesoc_soccontroller_scratch_storage[15:8];
assign builder_csrbank0_scratch0_w = main_basesoc_soccontroller_scratch_storage[7:0];
assign builder_csrbank0_bus_errors3_w = main_basesoc_soccontroller_bus_errors_status[31:24];
assign builder_csrbank0_bus_errors2_w = main_basesoc_soccontroller_bus_errors_status[23:16];
assign builder_csrbank0_bus_errors1_w = main_basesoc_soccontroller_bus_errors_status[15:8];
assign builder_csrbank0_bus_errors0_w = main_basesoc_soccontroller_bus_errors_status[7:0];
assign main_basesoc_soccontroller_bus_errors_we = builder_csrbank0_bus_errors0_we;
assign builder_csrbank1_sel = (builder_interface1_bank_bus_adr[13:9] == 3'd5);
assign builder_csrbank1_half_sys8x_taps0_r = builder_interface1_bank_bus_dat_w[4:0];
assign builder_csrbank1_half_sys8x_taps0_re = ((builder_csrbank1_sel & builder_interface1_bank_bus_we) & (builder_interface1_bank_bus_adr[3:0] == 1'd0));
assign builder_csrbank1_half_sys8x_taps0_we = ((builder_csrbank1_sel & (~builder_interface1_bank_bus_we)) & (builder_interface1_bank_bus_adr[3:0] == 1'd0));
assign builder_csrbank1_wlevel_en0_r = builder_interface1_bank_bus_dat_w[0];
assign builder_csrbank1_wlevel_en0_re = ((builder_csrbank1_sel & builder_interface1_bank_bus_we) & (builder_interface1_bank_bus_adr[3:0] == 1'd1));
assign builder_csrbank1_wlevel_en0_we = ((builder_csrbank1_sel & (~builder_interface1_bank_bus_we)) & (builder_interface1_bank_bus_adr[3:0] == 1'd1));
assign main_a7ddrphy_wlevel_strobe_r = builder_interface1_bank_bus_dat_w[0];
assign main_a7ddrphy_wlevel_strobe_re = ((builder_csrbank1_sel & builder_interface1_bank_bus_we) & (builder_interface1_bank_bus_adr[3:0] == 2'd2));
assign main_a7ddrphy_wlevel_strobe_we = ((builder_csrbank1_sel & (~builder_interface1_bank_bus_we)) & (builder_interface1_bank_bus_adr[3:0] == 2'd2));
assign main_a7ddrphy_cdly_rst_r = builder_interface1_bank_bus_dat_w[0];
assign main_a7ddrphy_cdly_rst_re = ((builder_csrbank1_sel & builder_interface1_bank_bus_we) & (builder_interface1_bank_bus_adr[3:0] == 2'd3));
assign main_a7ddrphy_cdly_rst_we = ((builder_csrbank1_sel & (~builder_interface1_bank_bus_we)) & (builder_interface1_bank_bus_adr[3:0] == 2'd3));
assign main_a7ddrphy_cdly_inc_r = builder_interface1_bank_bus_dat_w[0];
assign main_a7ddrphy_cdly_inc_re = ((builder_csrbank1_sel & builder_interface1_bank_bus_we) & (builder_interface1_bank_bus_adr[3:0] == 3'd4));
assign main_a7ddrphy_cdly_inc_we = ((builder_csrbank1_sel & (~builder_interface1_bank_bus_we)) & (builder_interface1_bank_bus_adr[3:0] == 3'd4));
assign builder_csrbank1_dly_sel0_r = builder_interface1_bank_bus_dat_w[1:0];
assign builder_csrbank1_dly_sel0_re = ((builder_csrbank1_sel & builder_interface1_bank_bus_we) & (builder_interface1_bank_bus_adr[3:0] == 3'd5));
assign builder_csrbank1_dly_sel0_we = ((builder_csrbank1_sel & (~builder_interface1_bank_bus_we)) & (builder_interface1_bank_bus_adr[3:0] == 3'd5));
assign main_a7ddrphy_rdly_dq_rst_r = builder_interface1_bank_bus_dat_w[0];
assign main_a7ddrphy_rdly_dq_rst_re = ((builder_csrbank1_sel & builder_interface1_bank_bus_we) & (builder_interface1_bank_bus_adr[3:0] == 3'd6));
assign main_a7ddrphy_rdly_dq_rst_we = ((builder_csrbank1_sel & (~builder_interface1_bank_bus_we)) & (builder_interface1_bank_bus_adr[3:0] == 3'd6));
assign main_a7ddrphy_rdly_dq_inc_r = builder_interface1_bank_bus_dat_w[0];
assign main_a7ddrphy_rdly_dq_inc_re = ((builder_csrbank1_sel & builder_interface1_bank_bus_we) & (builder_interface1_bank_bus_adr[3:0] == 3'd7));
assign main_a7ddrphy_rdly_dq_inc_we = ((builder_csrbank1_sel & (~builder_interface1_bank_bus_we)) & (builder_interface1_bank_bus_adr[3:0] == 3'd7));
assign main_a7ddrphy_rdly_dq_bitslip_rst_r = builder_interface1_bank_bus_dat_w[0];
assign main_a7ddrphy_rdly_dq_bitslip_rst_re = ((builder_csrbank1_sel & builder_interface1_bank_bus_we) & (builder_interface1_bank_bus_adr[3:0] == 4'd8));
assign main_a7ddrphy_rdly_dq_bitslip_rst_we = ((builder_csrbank1_sel & (~builder_interface1_bank_bus_we)) & (builder_interface1_bank_bus_adr[3:0] == 4'd8));
assign main_a7ddrphy_rdly_dq_bitslip_r = builder_interface1_bank_bus_dat_w[0];
assign main_a7ddrphy_rdly_dq_bitslip_re = ((builder_csrbank1_sel & builder_interface1_bank_bus_we) & (builder_interface1_bank_bus_adr[3:0] == 4'd9));
assign main_a7ddrphy_rdly_dq_bitslip_we = ((builder_csrbank1_sel & (~builder_interface1_bank_bus_we)) & (builder_interface1_bank_bus_adr[3:0] == 4'd9));
assign builder_csrbank1_half_sys8x_taps0_w = main_a7ddrphy_half_sys8x_taps_storage[4:0];
assign builder_csrbank1_wlevel_en0_w = main_a7ddrphy_wlevel_en_storage;
assign builder_csrbank1_dly_sel0_w = main_a7ddrphy_dly_sel_storage[1:0];
assign builder_csrbank2_sel = (builder_interface2_bank_bus_adr[13:9] == 3'd6);
assign builder_csrbank2_dfii_control0_r = builder_interface2_bank_bus_dat_w[3:0];
assign builder_csrbank2_dfii_control0_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 1'd0));
assign builder_csrbank2_dfii_control0_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 1'd0));
assign builder_csrbank2_dfii_pi0_command0_r = builder_interface2_bank_bus_dat_w[5:0];
assign builder_csrbank2_dfii_pi0_command0_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 1'd1));
assign builder_csrbank2_dfii_pi0_command0_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 1'd1));
assign main_sdram_phaseinjector0_command_issue_r = builder_interface2_bank_bus_dat_w[0];
assign main_sdram_phaseinjector0_command_issue_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 2'd2));
assign main_sdram_phaseinjector0_command_issue_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 2'd2));
assign builder_csrbank2_dfii_pi0_address1_r = builder_interface2_bank_bus_dat_w[5:0];
assign builder_csrbank2_dfii_pi0_address1_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 2'd3));
assign builder_csrbank2_dfii_pi0_address1_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 2'd3));
assign builder_csrbank2_dfii_pi0_address0_r = builder_interface2_bank_bus_dat_w[7:0];
assign builder_csrbank2_dfii_pi0_address0_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 3'd4));
assign builder_csrbank2_dfii_pi0_address0_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 3'd4));
assign builder_csrbank2_dfii_pi0_baddress0_r = builder_interface2_bank_bus_dat_w[2:0];
assign builder_csrbank2_dfii_pi0_baddress0_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 3'd5));
assign builder_csrbank2_dfii_pi0_baddress0_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 3'd5));
assign builder_csrbank2_dfii_pi0_wrdata3_r = builder_interface2_bank_bus_dat_w[7:0];
assign builder_csrbank2_dfii_pi0_wrdata3_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 3'd6));
assign builder_csrbank2_dfii_pi0_wrdata3_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 3'd6));
assign builder_csrbank2_dfii_pi0_wrdata2_r = builder_interface2_bank_bus_dat_w[7:0];
assign builder_csrbank2_dfii_pi0_wrdata2_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 3'd7));
assign builder_csrbank2_dfii_pi0_wrdata2_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 3'd7));
assign builder_csrbank2_dfii_pi0_wrdata1_r = builder_interface2_bank_bus_dat_w[7:0];
assign builder_csrbank2_dfii_pi0_wrdata1_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 4'd8));
assign builder_csrbank2_dfii_pi0_wrdata1_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 4'd8));
assign builder_csrbank2_dfii_pi0_wrdata0_r = builder_interface2_bank_bus_dat_w[7:0];
assign builder_csrbank2_dfii_pi0_wrdata0_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 4'd9));
assign builder_csrbank2_dfii_pi0_wrdata0_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 4'd9));
assign builder_csrbank2_dfii_pi0_rddata3_r = builder_interface2_bank_bus_dat_w[7:0];
assign builder_csrbank2_dfii_pi0_rddata3_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 4'd10));
assign builder_csrbank2_dfii_pi0_rddata3_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 4'd10));
assign builder_csrbank2_dfii_pi0_rddata2_r = builder_interface2_bank_bus_dat_w[7:0];
assign builder_csrbank2_dfii_pi0_rddata2_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 4'd11));
assign builder_csrbank2_dfii_pi0_rddata2_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 4'd11));
assign builder_csrbank2_dfii_pi0_rddata1_r = builder_interface2_bank_bus_dat_w[7:0];
assign builder_csrbank2_dfii_pi0_rddata1_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 4'd12));
assign builder_csrbank2_dfii_pi0_rddata1_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 4'd12));
assign builder_csrbank2_dfii_pi0_rddata0_r = builder_interface2_bank_bus_dat_w[7:0];
assign builder_csrbank2_dfii_pi0_rddata0_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 4'd13));
assign builder_csrbank2_dfii_pi0_rddata0_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 4'd13));
assign builder_csrbank2_dfii_pi1_command0_r = builder_interface2_bank_bus_dat_w[5:0];
assign builder_csrbank2_dfii_pi1_command0_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 4'd14));
assign builder_csrbank2_dfii_pi1_command0_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 4'd14));
assign main_sdram_phaseinjector1_command_issue_r = builder_interface2_bank_bus_dat_w[0];
assign main_sdram_phaseinjector1_command_issue_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 4'd15));
assign main_sdram_phaseinjector1_command_issue_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 4'd15));
assign builder_csrbank2_dfii_pi1_address1_r = builder_interface2_bank_bus_dat_w[5:0];
assign builder_csrbank2_dfii_pi1_address1_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 5'd16));
assign builder_csrbank2_dfii_pi1_address1_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 5'd16));
assign builder_csrbank2_dfii_pi1_address0_r = builder_interface2_bank_bus_dat_w[7:0];
assign builder_csrbank2_dfii_pi1_address0_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 5'd17));
assign builder_csrbank2_dfii_pi1_address0_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 5'd17));
assign builder_csrbank2_dfii_pi1_baddress0_r = builder_interface2_bank_bus_dat_w[2:0];
assign builder_csrbank2_dfii_pi1_baddress0_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 5'd18));
assign builder_csrbank2_dfii_pi1_baddress0_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 5'd18));
assign builder_csrbank2_dfii_pi1_wrdata3_r = builder_interface2_bank_bus_dat_w[7:0];
assign builder_csrbank2_dfii_pi1_wrdata3_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 5'd19));
assign builder_csrbank2_dfii_pi1_wrdata3_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 5'd19));
assign builder_csrbank2_dfii_pi1_wrdata2_r = builder_interface2_bank_bus_dat_w[7:0];
assign builder_csrbank2_dfii_pi1_wrdata2_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 5'd20));
assign builder_csrbank2_dfii_pi1_wrdata2_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 5'd20));
assign builder_csrbank2_dfii_pi1_wrdata1_r = builder_interface2_bank_bus_dat_w[7:0];
assign builder_csrbank2_dfii_pi1_wrdata1_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 5'd21));
assign builder_csrbank2_dfii_pi1_wrdata1_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 5'd21));
assign builder_csrbank2_dfii_pi1_wrdata0_r = builder_interface2_bank_bus_dat_w[7:0];
assign builder_csrbank2_dfii_pi1_wrdata0_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 5'd22));
assign builder_csrbank2_dfii_pi1_wrdata0_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 5'd22));
assign builder_csrbank2_dfii_pi1_rddata3_r = builder_interface2_bank_bus_dat_w[7:0];
assign builder_csrbank2_dfii_pi1_rddata3_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 5'd23));
assign builder_csrbank2_dfii_pi1_rddata3_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 5'd23));
assign builder_csrbank2_dfii_pi1_rddata2_r = builder_interface2_bank_bus_dat_w[7:0];
assign builder_csrbank2_dfii_pi1_rddata2_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 5'd24));
assign builder_csrbank2_dfii_pi1_rddata2_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 5'd24));
assign builder_csrbank2_dfii_pi1_rddata1_r = builder_interface2_bank_bus_dat_w[7:0];
assign builder_csrbank2_dfii_pi1_rddata1_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 5'd25));
assign builder_csrbank2_dfii_pi1_rddata1_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 5'd25));
assign builder_csrbank2_dfii_pi1_rddata0_r = builder_interface2_bank_bus_dat_w[7:0];
assign builder_csrbank2_dfii_pi1_rddata0_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 5'd26));
assign builder_csrbank2_dfii_pi1_rddata0_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 5'd26));
assign builder_csrbank2_dfii_pi2_command0_r = builder_interface2_bank_bus_dat_w[5:0];
assign builder_csrbank2_dfii_pi2_command0_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 5'd27));
assign builder_csrbank2_dfii_pi2_command0_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 5'd27));
assign main_sdram_phaseinjector2_command_issue_r = builder_interface2_bank_bus_dat_w[0];
assign main_sdram_phaseinjector2_command_issue_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 5'd28));
assign main_sdram_phaseinjector2_command_issue_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 5'd28));
assign builder_csrbank2_dfii_pi2_address1_r = builder_interface2_bank_bus_dat_w[5:0];
assign builder_csrbank2_dfii_pi2_address1_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 5'd29));
assign builder_csrbank2_dfii_pi2_address1_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 5'd29));
assign builder_csrbank2_dfii_pi2_address0_r = builder_interface2_bank_bus_dat_w[7:0];
assign builder_csrbank2_dfii_pi2_address0_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 5'd30));
assign builder_csrbank2_dfii_pi2_address0_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 5'd30));
assign builder_csrbank2_dfii_pi2_baddress0_r = builder_interface2_bank_bus_dat_w[2:0];
assign builder_csrbank2_dfii_pi2_baddress0_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 5'd31));
assign builder_csrbank2_dfii_pi2_baddress0_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 5'd31));
assign builder_csrbank2_dfii_pi2_wrdata3_r = builder_interface2_bank_bus_dat_w[7:0];
assign builder_csrbank2_dfii_pi2_wrdata3_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 6'd32));
assign builder_csrbank2_dfii_pi2_wrdata3_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 6'd32));
assign builder_csrbank2_dfii_pi2_wrdata2_r = builder_interface2_bank_bus_dat_w[7:0];
assign builder_csrbank2_dfii_pi2_wrdata2_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 6'd33));
assign builder_csrbank2_dfii_pi2_wrdata2_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 6'd33));
assign builder_csrbank2_dfii_pi2_wrdata1_r = builder_interface2_bank_bus_dat_w[7:0];
assign builder_csrbank2_dfii_pi2_wrdata1_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 6'd34));
assign builder_csrbank2_dfii_pi2_wrdata1_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 6'd34));
assign builder_csrbank2_dfii_pi2_wrdata0_r = builder_interface2_bank_bus_dat_w[7:0];
assign builder_csrbank2_dfii_pi2_wrdata0_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 6'd35));
assign builder_csrbank2_dfii_pi2_wrdata0_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 6'd35));
assign builder_csrbank2_dfii_pi2_rddata3_r = builder_interface2_bank_bus_dat_w[7:0];
assign builder_csrbank2_dfii_pi2_rddata3_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 6'd36));
assign builder_csrbank2_dfii_pi2_rddata3_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 6'd36));
assign builder_csrbank2_dfii_pi2_rddata2_r = builder_interface2_bank_bus_dat_w[7:0];
assign builder_csrbank2_dfii_pi2_rddata2_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 6'd37));
assign builder_csrbank2_dfii_pi2_rddata2_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 6'd37));
assign builder_csrbank2_dfii_pi2_rddata1_r = builder_interface2_bank_bus_dat_w[7:0];
assign builder_csrbank2_dfii_pi2_rddata1_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 6'd38));
assign builder_csrbank2_dfii_pi2_rddata1_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 6'd38));
assign builder_csrbank2_dfii_pi2_rddata0_r = builder_interface2_bank_bus_dat_w[7:0];
assign builder_csrbank2_dfii_pi2_rddata0_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 6'd39));
assign builder_csrbank2_dfii_pi2_rddata0_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 6'd39));
assign builder_csrbank2_dfii_pi3_command0_r = builder_interface2_bank_bus_dat_w[5:0];
assign builder_csrbank2_dfii_pi3_command0_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 6'd40));
assign builder_csrbank2_dfii_pi3_command0_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 6'd40));
assign main_sdram_phaseinjector3_command_issue_r = builder_interface2_bank_bus_dat_w[0];
assign main_sdram_phaseinjector3_command_issue_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 6'd41));
assign main_sdram_phaseinjector3_command_issue_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 6'd41));
assign builder_csrbank2_dfii_pi3_address1_r = builder_interface2_bank_bus_dat_w[5:0];
assign builder_csrbank2_dfii_pi3_address1_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 6'd42));
assign builder_csrbank2_dfii_pi3_address1_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 6'd42));
assign builder_csrbank2_dfii_pi3_address0_r = builder_interface2_bank_bus_dat_w[7:0];
assign builder_csrbank2_dfii_pi3_address0_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 6'd43));
assign builder_csrbank2_dfii_pi3_address0_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 6'd43));
assign builder_csrbank2_dfii_pi3_baddress0_r = builder_interface2_bank_bus_dat_w[2:0];
assign builder_csrbank2_dfii_pi3_baddress0_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 6'd44));
assign builder_csrbank2_dfii_pi3_baddress0_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 6'd44));
assign builder_csrbank2_dfii_pi3_wrdata3_r = builder_interface2_bank_bus_dat_w[7:0];
assign builder_csrbank2_dfii_pi3_wrdata3_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 6'd45));
assign builder_csrbank2_dfii_pi3_wrdata3_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 6'd45));
assign builder_csrbank2_dfii_pi3_wrdata2_r = builder_interface2_bank_bus_dat_w[7:0];
assign builder_csrbank2_dfii_pi3_wrdata2_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 6'd46));
assign builder_csrbank2_dfii_pi3_wrdata2_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 6'd46));
assign builder_csrbank2_dfii_pi3_wrdata1_r = builder_interface2_bank_bus_dat_w[7:0];
assign builder_csrbank2_dfii_pi3_wrdata1_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 6'd47));
assign builder_csrbank2_dfii_pi3_wrdata1_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 6'd47));
assign builder_csrbank2_dfii_pi3_wrdata0_r = builder_interface2_bank_bus_dat_w[7:0];
assign builder_csrbank2_dfii_pi3_wrdata0_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 6'd48));
assign builder_csrbank2_dfii_pi3_wrdata0_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 6'd48));
assign builder_csrbank2_dfii_pi3_rddata3_r = builder_interface2_bank_bus_dat_w[7:0];
assign builder_csrbank2_dfii_pi3_rddata3_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 6'd49));
assign builder_csrbank2_dfii_pi3_rddata3_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 6'd49));
assign builder_csrbank2_dfii_pi3_rddata2_r = builder_interface2_bank_bus_dat_w[7:0];
assign builder_csrbank2_dfii_pi3_rddata2_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 6'd50));
assign builder_csrbank2_dfii_pi3_rddata2_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 6'd50));
assign builder_csrbank2_dfii_pi3_rddata1_r = builder_interface2_bank_bus_dat_w[7:0];
assign builder_csrbank2_dfii_pi3_rddata1_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 6'd51));
assign builder_csrbank2_dfii_pi3_rddata1_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 6'd51));
assign builder_csrbank2_dfii_pi3_rddata0_r = builder_interface2_bank_bus_dat_w[7:0];
assign builder_csrbank2_dfii_pi3_rddata0_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[5:0] == 6'd52));
assign builder_csrbank2_dfii_pi3_rddata0_we = ((builder_csrbank2_sel & (~builder_interface2_bank_bus_we)) & (builder_interface2_bank_bus_adr[5:0] == 6'd52));
assign builder_csrbank2_dfii_control0_w = main_sdram_storage[3:0];
assign builder_csrbank2_dfii_pi0_command0_w = main_sdram_phaseinjector0_command_storage[5:0];
assign builder_csrbank2_dfii_pi0_address1_w = main_sdram_phaseinjector0_address_storage[13:8];
assign builder_csrbank2_dfii_pi0_address0_w = main_sdram_phaseinjector0_address_storage[7:0];
assign builder_csrbank2_dfii_pi0_baddress0_w = main_sdram_phaseinjector0_baddress_storage[2:0];
assign builder_csrbank2_dfii_pi0_wrdata3_w = main_sdram_phaseinjector0_wrdata_storage[31:24];
assign builder_csrbank2_dfii_pi0_wrdata2_w = main_sdram_phaseinjector0_wrdata_storage[23:16];
assign builder_csrbank2_dfii_pi0_wrdata1_w = main_sdram_phaseinjector0_wrdata_storage[15:8];
assign builder_csrbank2_dfii_pi0_wrdata0_w = main_sdram_phaseinjector0_wrdata_storage[7:0];
assign builder_csrbank2_dfii_pi0_rddata3_w = main_sdram_phaseinjector0_status[31:24];
assign builder_csrbank2_dfii_pi0_rddata2_w = main_sdram_phaseinjector0_status[23:16];
assign builder_csrbank2_dfii_pi0_rddata1_w = main_sdram_phaseinjector0_status[15:8];
assign builder_csrbank2_dfii_pi0_rddata0_w = main_sdram_phaseinjector0_status[7:0];
assign main_sdram_phaseinjector0_we = builder_csrbank2_dfii_pi0_rddata0_we;
assign builder_csrbank2_dfii_pi1_command0_w = main_sdram_phaseinjector1_command_storage[5:0];
assign builder_csrbank2_dfii_pi1_address1_w = main_sdram_phaseinjector1_address_storage[13:8];
assign builder_csrbank2_dfii_pi1_address0_w = main_sdram_phaseinjector1_address_storage[7:0];
assign builder_csrbank2_dfii_pi1_baddress0_w = main_sdram_phaseinjector1_baddress_storage[2:0];
assign builder_csrbank2_dfii_pi1_wrdata3_w = main_sdram_phaseinjector1_wrdata_storage[31:24];
assign builder_csrbank2_dfii_pi1_wrdata2_w = main_sdram_phaseinjector1_wrdata_storage[23:16];
assign builder_csrbank2_dfii_pi1_wrdata1_w = main_sdram_phaseinjector1_wrdata_storage[15:8];
assign builder_csrbank2_dfii_pi1_wrdata0_w = main_sdram_phaseinjector1_wrdata_storage[7:0];
assign builder_csrbank2_dfii_pi1_rddata3_w = main_sdram_phaseinjector1_status[31:24];
assign builder_csrbank2_dfii_pi1_rddata2_w = main_sdram_phaseinjector1_status[23:16];
assign builder_csrbank2_dfii_pi1_rddata1_w = main_sdram_phaseinjector1_status[15:8];
assign builder_csrbank2_dfii_pi1_rddata0_w = main_sdram_phaseinjector1_status[7:0];
assign main_sdram_phaseinjector1_we = builder_csrbank2_dfii_pi1_rddata0_we;
assign builder_csrbank2_dfii_pi2_command0_w = main_sdram_phaseinjector2_command_storage[5:0];
assign builder_csrbank2_dfii_pi2_address1_w = main_sdram_phaseinjector2_address_storage[13:8];
assign builder_csrbank2_dfii_pi2_address0_w = main_sdram_phaseinjector2_address_storage[7:0];
assign builder_csrbank2_dfii_pi2_baddress0_w = main_sdram_phaseinjector2_baddress_storage[2:0];
assign builder_csrbank2_dfii_pi2_wrdata3_w = main_sdram_phaseinjector2_wrdata_storage[31:24];
assign builder_csrbank2_dfii_pi2_wrdata2_w = main_sdram_phaseinjector2_wrdata_storage[23:16];
assign builder_csrbank2_dfii_pi2_wrdata1_w = main_sdram_phaseinjector2_wrdata_storage[15:8];
assign builder_csrbank2_dfii_pi2_wrdata0_w = main_sdram_phaseinjector2_wrdata_storage[7:0];
assign builder_csrbank2_dfii_pi2_rddata3_w = main_sdram_phaseinjector2_status[31:24];
assign builder_csrbank2_dfii_pi2_rddata2_w = main_sdram_phaseinjector2_status[23:16];
assign builder_csrbank2_dfii_pi2_rddata1_w = main_sdram_phaseinjector2_status[15:8];
assign builder_csrbank2_dfii_pi2_rddata0_w = main_sdram_phaseinjector2_status[7:0];
assign main_sdram_phaseinjector2_we = builder_csrbank2_dfii_pi2_rddata0_we;
assign builder_csrbank2_dfii_pi3_command0_w = main_sdram_phaseinjector3_command_storage[5:0];
assign builder_csrbank2_dfii_pi3_address1_w = main_sdram_phaseinjector3_address_storage[13:8];
assign builder_csrbank2_dfii_pi3_address0_w = main_sdram_phaseinjector3_address_storage[7:0];
assign builder_csrbank2_dfii_pi3_baddress0_w = main_sdram_phaseinjector3_baddress_storage[2:0];
assign builder_csrbank2_dfii_pi3_wrdata3_w = main_sdram_phaseinjector3_wrdata_storage[31:24];
assign builder_csrbank2_dfii_pi3_wrdata2_w = main_sdram_phaseinjector3_wrdata_storage[23:16];
assign builder_csrbank2_dfii_pi3_wrdata1_w = main_sdram_phaseinjector3_wrdata_storage[15:8];
assign builder_csrbank2_dfii_pi3_wrdata0_w = main_sdram_phaseinjector3_wrdata_storage[7:0];
assign builder_csrbank2_dfii_pi3_rddata3_w = main_sdram_phaseinjector3_status[31:24];
assign builder_csrbank2_dfii_pi3_rddata2_w = main_sdram_phaseinjector3_status[23:16];
assign builder_csrbank2_dfii_pi3_rddata1_w = main_sdram_phaseinjector3_status[15:8];
assign builder_csrbank2_dfii_pi3_rddata0_w = main_sdram_phaseinjector3_status[7:0];
assign main_sdram_phaseinjector3_we = builder_csrbank2_dfii_pi3_rddata0_we;
assign builder_csrbank3_sel = (builder_interface3_bank_bus_adr[13:9] == 3'd4);
assign builder_csrbank3_load3_r = builder_interface3_bank_bus_dat_w[7:0];
assign builder_csrbank3_load3_re = ((builder_csrbank3_sel & builder_interface3_bank_bus_we) & (builder_interface3_bank_bus_adr[4:0] == 1'd0));
assign builder_csrbank3_load3_we = ((builder_csrbank3_sel & (~builder_interface3_bank_bus_we)) & (builder_interface3_bank_bus_adr[4:0] == 1'd0));
assign builder_csrbank3_load2_r = builder_interface3_bank_bus_dat_w[7:0];
assign builder_csrbank3_load2_re = ((builder_csrbank3_sel & builder_interface3_bank_bus_we) & (builder_interface3_bank_bus_adr[4:0] == 1'd1));
assign builder_csrbank3_load2_we = ((builder_csrbank3_sel & (~builder_interface3_bank_bus_we)) & (builder_interface3_bank_bus_adr[4:0] == 1'd1));
assign builder_csrbank3_load1_r = builder_interface3_bank_bus_dat_w[7:0];
assign builder_csrbank3_load1_re = ((builder_csrbank3_sel & builder_interface3_bank_bus_we) & (builder_interface3_bank_bus_adr[4:0] == 2'd2));
assign builder_csrbank3_load1_we = ((builder_csrbank3_sel & (~builder_interface3_bank_bus_we)) & (builder_interface3_bank_bus_adr[4:0] == 2'd2));
assign builder_csrbank3_load0_r = builder_interface3_bank_bus_dat_w[7:0];
assign builder_csrbank3_load0_re = ((builder_csrbank3_sel & builder_interface3_bank_bus_we) & (builder_interface3_bank_bus_adr[4:0] == 2'd3));
assign builder_csrbank3_load0_we = ((builder_csrbank3_sel & (~builder_interface3_bank_bus_we)) & (builder_interface3_bank_bus_adr[4:0] == 2'd3));
assign builder_csrbank3_reload3_r = builder_interface3_bank_bus_dat_w[7:0];
assign builder_csrbank3_reload3_re = ((builder_csrbank3_sel & builder_interface3_bank_bus_we) & (builder_interface3_bank_bus_adr[4:0] == 3'd4));
assign builder_csrbank3_reload3_we = ((builder_csrbank3_sel & (~builder_interface3_bank_bus_we)) & (builder_interface3_bank_bus_adr[4:0] == 3'd4));
assign builder_csrbank3_reload2_r = builder_interface3_bank_bus_dat_w[7:0];
assign builder_csrbank3_reload2_re = ((builder_csrbank3_sel & builder_interface3_bank_bus_we) & (builder_interface3_bank_bus_adr[4:0] == 3'd5));
assign builder_csrbank3_reload2_we = ((builder_csrbank3_sel & (~builder_interface3_bank_bus_we)) & (builder_interface3_bank_bus_adr[4:0] == 3'd5));
assign builder_csrbank3_reload1_r = builder_interface3_bank_bus_dat_w[7:0];
assign builder_csrbank3_reload1_re = ((builder_csrbank3_sel & builder_interface3_bank_bus_we) & (builder_interface3_bank_bus_adr[4:0] == 3'd6));
assign builder_csrbank3_reload1_we = ((builder_csrbank3_sel & (~builder_interface3_bank_bus_we)) & (builder_interface3_bank_bus_adr[4:0] == 3'd6));
assign builder_csrbank3_reload0_r = builder_interface3_bank_bus_dat_w[7:0];
assign builder_csrbank3_reload0_re = ((builder_csrbank3_sel & builder_interface3_bank_bus_we) & (builder_interface3_bank_bus_adr[4:0] == 3'd7));
assign builder_csrbank3_reload0_we = ((builder_csrbank3_sel & (~builder_interface3_bank_bus_we)) & (builder_interface3_bank_bus_adr[4:0] == 3'd7));
assign builder_csrbank3_en0_r = builder_interface3_bank_bus_dat_w[0];
assign builder_csrbank3_en0_re = ((builder_csrbank3_sel & builder_interface3_bank_bus_we) & (builder_interface3_bank_bus_adr[4:0] == 4'd8));
assign builder_csrbank3_en0_we = ((builder_csrbank3_sel & (~builder_interface3_bank_bus_we)) & (builder_interface3_bank_bus_adr[4:0] == 4'd8));
assign builder_csrbank3_update_value0_r = builder_interface3_bank_bus_dat_w[0];
assign builder_csrbank3_update_value0_re = ((builder_csrbank3_sel & builder_interface3_bank_bus_we) & (builder_interface3_bank_bus_adr[4:0] == 4'd9));
assign builder_csrbank3_update_value0_we = ((builder_csrbank3_sel & (~builder_interface3_bank_bus_we)) & (builder_interface3_bank_bus_adr[4:0] == 4'd9));
assign builder_csrbank3_value3_r = builder_interface3_bank_bus_dat_w[7:0];
assign builder_csrbank3_value3_re = ((builder_csrbank3_sel & builder_interface3_bank_bus_we) & (builder_interface3_bank_bus_adr[4:0] == 4'd10));
assign builder_csrbank3_value3_we = ((builder_csrbank3_sel & (~builder_interface3_bank_bus_we)) & (builder_interface3_bank_bus_adr[4:0] == 4'd10));
assign builder_csrbank3_value2_r = builder_interface3_bank_bus_dat_w[7:0];
assign builder_csrbank3_value2_re = ((builder_csrbank3_sel & builder_interface3_bank_bus_we) & (builder_interface3_bank_bus_adr[4:0] == 4'd11));
assign builder_csrbank3_value2_we = ((builder_csrbank3_sel & (~builder_interface3_bank_bus_we)) & (builder_interface3_bank_bus_adr[4:0] == 4'd11));
assign builder_csrbank3_value1_r = builder_interface3_bank_bus_dat_w[7:0];
assign builder_csrbank3_value1_re = ((builder_csrbank3_sel & builder_interface3_bank_bus_we) & (builder_interface3_bank_bus_adr[4:0] == 4'd12));
assign builder_csrbank3_value1_we = ((builder_csrbank3_sel & (~builder_interface3_bank_bus_we)) & (builder_interface3_bank_bus_adr[4:0] == 4'd12));
assign builder_csrbank3_value0_r = builder_interface3_bank_bus_dat_w[7:0];
assign builder_csrbank3_value0_re = ((builder_csrbank3_sel & builder_interface3_bank_bus_we) & (builder_interface3_bank_bus_adr[4:0] == 4'd13));
assign builder_csrbank3_value0_we = ((builder_csrbank3_sel & (~builder_interface3_bank_bus_we)) & (builder_interface3_bank_bus_adr[4:0] == 4'd13));
assign main_basesoc_timer_eventmanager_status_r = builder_interface3_bank_bus_dat_w[0];
assign main_basesoc_timer_eventmanager_status_re = ((builder_csrbank3_sel & builder_interface3_bank_bus_we) & (builder_interface3_bank_bus_adr[4:0] == 4'd14));
assign main_basesoc_timer_eventmanager_status_we = ((builder_csrbank3_sel & (~builder_interface3_bank_bus_we)) & (builder_interface3_bank_bus_adr[4:0] == 4'd14));
assign main_basesoc_timer_eventmanager_pending_r = builder_interface3_bank_bus_dat_w[0];
assign main_basesoc_timer_eventmanager_pending_re = ((builder_csrbank3_sel & builder_interface3_bank_bus_we) & (builder_interface3_bank_bus_adr[4:0] == 4'd15));
assign main_basesoc_timer_eventmanager_pending_we = ((builder_csrbank3_sel & (~builder_interface3_bank_bus_we)) & (builder_interface3_bank_bus_adr[4:0] == 4'd15));
assign builder_csrbank3_ev_enable0_r = builder_interface3_bank_bus_dat_w[0];
assign builder_csrbank3_ev_enable0_re = ((builder_csrbank3_sel & builder_interface3_bank_bus_we) & (builder_interface3_bank_bus_adr[4:0] == 5'd16));
assign builder_csrbank3_ev_enable0_we = ((builder_csrbank3_sel & (~builder_interface3_bank_bus_we)) & (builder_interface3_bank_bus_adr[4:0] == 5'd16));
assign builder_csrbank3_load3_w = main_basesoc_timer_load_storage[31:24];
assign builder_csrbank3_load2_w = main_basesoc_timer_load_storage[23:16];
assign builder_csrbank3_load1_w = main_basesoc_timer_load_storage[15:8];
assign builder_csrbank3_load0_w = main_basesoc_timer_load_storage[7:0];
assign builder_csrbank3_reload3_w = main_basesoc_timer_reload_storage[31:24];
assign builder_csrbank3_reload2_w = main_basesoc_timer_reload_storage[23:16];
assign builder_csrbank3_reload1_w = main_basesoc_timer_reload_storage[15:8];
assign builder_csrbank3_reload0_w = main_basesoc_timer_reload_storage[7:0];
assign builder_csrbank3_en0_w = main_basesoc_timer_en_storage;
assign builder_csrbank3_update_value0_w = main_basesoc_timer_update_value_storage;
assign builder_csrbank3_value3_w = main_basesoc_timer_value_status[31:24];
assign builder_csrbank3_value2_w = main_basesoc_timer_value_status[23:16];
assign builder_csrbank3_value1_w = main_basesoc_timer_value_status[15:8];
assign builder_csrbank3_value0_w = main_basesoc_timer_value_status[7:0];
assign main_basesoc_timer_value_we = builder_csrbank3_value0_we;
assign builder_csrbank3_ev_enable0_w = main_basesoc_timer_eventmanager_storage;
assign builder_csrbank4_sel = (builder_interface4_bank_bus_adr[13:9] == 2'd3);
assign main_basesoc_uart_rxtx_r = builder_interface4_bank_bus_dat_w[7:0];
assign main_basesoc_uart_rxtx_re = ((builder_csrbank4_sel & builder_interface4_bank_bus_we) & (builder_interface4_bank_bus_adr[2:0] == 1'd0));
assign main_basesoc_uart_rxtx_we = ((builder_csrbank4_sel & (~builder_interface4_bank_bus_we)) & (builder_interface4_bank_bus_adr[2:0] == 1'd0));
assign builder_csrbank4_txfull_r = builder_interface4_bank_bus_dat_w[0];
assign builder_csrbank4_txfull_re = ((builder_csrbank4_sel & builder_interface4_bank_bus_we) & (builder_interface4_bank_bus_adr[2:0] == 1'd1));
assign builder_csrbank4_txfull_we = ((builder_csrbank4_sel & (~builder_interface4_bank_bus_we)) & (builder_interface4_bank_bus_adr[2:0] == 1'd1));
assign builder_csrbank4_rxempty_r = builder_interface4_bank_bus_dat_w[0];
assign builder_csrbank4_rxempty_re = ((builder_csrbank4_sel & builder_interface4_bank_bus_we) & (builder_interface4_bank_bus_adr[2:0] == 2'd2));
assign builder_csrbank4_rxempty_we = ((builder_csrbank4_sel & (~builder_interface4_bank_bus_we)) & (builder_interface4_bank_bus_adr[2:0] == 2'd2));
assign main_basesoc_uart_eventmanager_status_r = builder_interface4_bank_bus_dat_w[1:0];
assign main_basesoc_uart_eventmanager_status_re = ((builder_csrbank4_sel & builder_interface4_bank_bus_we) & (builder_interface4_bank_bus_adr[2:0] == 2'd3));
assign main_basesoc_uart_eventmanager_status_we = ((builder_csrbank4_sel & (~builder_interface4_bank_bus_we)) & (builder_interface4_bank_bus_adr[2:0] == 2'd3));
assign main_basesoc_uart_eventmanager_pending_r = builder_interface4_bank_bus_dat_w[1:0];
assign main_basesoc_uart_eventmanager_pending_re = ((builder_csrbank4_sel & builder_interface4_bank_bus_we) & (builder_interface4_bank_bus_adr[2:0] == 3'd4));
assign main_basesoc_uart_eventmanager_pending_we = ((builder_csrbank4_sel & (~builder_interface4_bank_bus_we)) & (builder_interface4_bank_bus_adr[2:0] == 3'd4));
assign builder_csrbank4_ev_enable0_r = builder_interface4_bank_bus_dat_w[1:0];
assign builder_csrbank4_ev_enable0_re = ((builder_csrbank4_sel & builder_interface4_bank_bus_we) & (builder_interface4_bank_bus_adr[2:0] == 3'd5));
assign builder_csrbank4_ev_enable0_we = ((builder_csrbank4_sel & (~builder_interface4_bank_bus_we)) & (builder_interface4_bank_bus_adr[2:0] == 3'd5));
assign builder_csrbank4_txfull_w = main_basesoc_uart_txfull_status;
assign main_basesoc_uart_txfull_we = builder_csrbank4_txfull_we;
assign builder_csrbank4_rxempty_w = main_basesoc_uart_rxempty_status;
assign main_basesoc_uart_rxempty_we = builder_csrbank4_rxempty_we;
assign builder_csrbank4_ev_enable0_w = main_basesoc_uart_eventmanager_storage[1:0];
assign builder_csrbank5_sel = (builder_interface5_bank_bus_adr[13:9] == 2'd2);
assign builder_csrbank5_tuning_word3_r = builder_interface5_bank_bus_dat_w[7:0];
assign builder_csrbank5_tuning_word3_re = ((builder_csrbank5_sel & builder_interface5_bank_bus_we) & (builder_interface5_bank_bus_adr[1:0] == 1'd0));
assign builder_csrbank5_tuning_word3_we = ((builder_csrbank5_sel & (~builder_interface5_bank_bus_we)) & (builder_interface5_bank_bus_adr[1:0] == 1'd0));
assign builder_csrbank5_tuning_word2_r = builder_interface5_bank_bus_dat_w[7:0];
assign builder_csrbank5_tuning_word2_re = ((builder_csrbank5_sel & builder_interface5_bank_bus_we) & (builder_interface5_bank_bus_adr[1:0] == 1'd1));
assign builder_csrbank5_tuning_word2_we = ((builder_csrbank5_sel & (~builder_interface5_bank_bus_we)) & (builder_interface5_bank_bus_adr[1:0] == 1'd1));
assign builder_csrbank5_tuning_word1_r = builder_interface5_bank_bus_dat_w[7:0];
assign builder_csrbank5_tuning_word1_re = ((builder_csrbank5_sel & builder_interface5_bank_bus_we) & (builder_interface5_bank_bus_adr[1:0] == 2'd2));
assign builder_csrbank5_tuning_word1_we = ((builder_csrbank5_sel & (~builder_interface5_bank_bus_we)) & (builder_interface5_bank_bus_adr[1:0] == 2'd2));
assign builder_csrbank5_tuning_word0_r = builder_interface5_bank_bus_dat_w[7:0];
assign builder_csrbank5_tuning_word0_re = ((builder_csrbank5_sel & builder_interface5_bank_bus_we) & (builder_interface5_bank_bus_adr[1:0] == 2'd3));
assign builder_csrbank5_tuning_word0_we = ((builder_csrbank5_sel & (~builder_interface5_bank_bus_we)) & (builder_interface5_bank_bus_adr[1:0] == 2'd3));
assign builder_csrbank5_tuning_word3_w = main_basesoc_storage[31:24];
assign builder_csrbank5_tuning_word2_w = main_basesoc_storage[23:16];
assign builder_csrbank5_tuning_word1_w = main_basesoc_storage[15:8];
assign builder_csrbank5_tuning_word0_w = main_basesoc_storage[7:0];
assign builder_adr = main_basesoc_interface_adr;
assign builder_we = main_basesoc_interface_we;
assign builder_dat_w = main_basesoc_interface_dat_w;
assign main_basesoc_interface_dat_r = builder_dat_r;
assign builder_interface0_bank_bus_adr = builder_adr;
assign builder_interface1_bank_bus_adr = builder_adr;
assign builder_interface2_bank_bus_adr = builder_adr;
assign builder_interface3_bank_bus_adr = builder_adr;
assign builder_interface4_bank_bus_adr = builder_adr;
assign builder_interface5_bank_bus_adr = builder_adr;
assign builder_interface0_bank_bus_we = builder_we;
assign builder_interface1_bank_bus_we = builder_we;
assign builder_interface2_bank_bus_we = builder_we;
assign builder_interface3_bank_bus_we = builder_we;
assign builder_interface4_bank_bus_we = builder_we;
assign builder_interface5_bank_bus_we = builder_we;
assign builder_interface0_bank_bus_dat_w = builder_dat_w;
assign builder_interface1_bank_bus_dat_w = builder_dat_w;
assign builder_interface2_bank_bus_dat_w = builder_dat_w;
assign builder_interface3_bank_bus_dat_w = builder_dat_w;
assign builder_interface4_bank_bus_dat_w = builder_dat_w;
assign builder_interface5_bank_bus_dat_w = builder_dat_w;
assign builder_dat_r = (((((builder_interface0_bank_bus_dat_r | builder_interface1_bank_bus_dat_r) | builder_interface2_bank_bus_dat_r) | builder_interface3_bank_bus_dat_r) | builder_interface4_bank_bus_dat_r) | builder_interface5_bank_bus_dat_r);
always @(*) begin
	builder_rhs_array_muxed0 <= 1'd0;
	case (main_sdram_choose_cmd_grant)
		1'd0: begin
			builder_rhs_array_muxed0 <= main_sdram_choose_cmd_valids[0];
		end
		1'd1: begin
			builder_rhs_array_muxed0 <= main_sdram_choose_cmd_valids[1];
		end
		2'd2: begin
			builder_rhs_array_muxed0 <= main_sdram_choose_cmd_valids[2];
		end
		2'd3: begin
			builder_rhs_array_muxed0 <= main_sdram_choose_cmd_valids[3];
		end
		3'd4: begin
			builder_rhs_array_muxed0 <= main_sdram_choose_cmd_valids[4];
		end
		3'd5: begin
			builder_rhs_array_muxed0 <= main_sdram_choose_cmd_valids[5];
		end
		3'd6: begin
			builder_rhs_array_muxed0 <= main_sdram_choose_cmd_valids[6];
		end
		default: begin
			builder_rhs_array_muxed0 <= main_sdram_choose_cmd_valids[7];
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed1 <= 14'd0;
	case (main_sdram_choose_cmd_grant)
		1'd0: begin
			builder_rhs_array_muxed1 <= main_sdram_bankmachine0_cmd_payload_a;
		end
		1'd1: begin
			builder_rhs_array_muxed1 <= main_sdram_bankmachine1_cmd_payload_a;
		end
		2'd2: begin
			builder_rhs_array_muxed1 <= main_sdram_bankmachine2_cmd_payload_a;
		end
		2'd3: begin
			builder_rhs_array_muxed1 <= main_sdram_bankmachine3_cmd_payload_a;
		end
		3'd4: begin
			builder_rhs_array_muxed1 <= main_sdram_bankmachine4_cmd_payload_a;
		end
		3'd5: begin
			builder_rhs_array_muxed1 <= main_sdram_bankmachine5_cmd_payload_a;
		end
		3'd6: begin
			builder_rhs_array_muxed1 <= main_sdram_bankmachine6_cmd_payload_a;
		end
		default: begin
			builder_rhs_array_muxed1 <= main_sdram_bankmachine7_cmd_payload_a;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed2 <= 3'd0;
	case (main_sdram_choose_cmd_grant)
		1'd0: begin
			builder_rhs_array_muxed2 <= main_sdram_bankmachine0_cmd_payload_ba;
		end
		1'd1: begin
			builder_rhs_array_muxed2 <= main_sdram_bankmachine1_cmd_payload_ba;
		end
		2'd2: begin
			builder_rhs_array_muxed2 <= main_sdram_bankmachine2_cmd_payload_ba;
		end
		2'd3: begin
			builder_rhs_array_muxed2 <= main_sdram_bankmachine3_cmd_payload_ba;
		end
		3'd4: begin
			builder_rhs_array_muxed2 <= main_sdram_bankmachine4_cmd_payload_ba;
		end
		3'd5: begin
			builder_rhs_array_muxed2 <= main_sdram_bankmachine5_cmd_payload_ba;
		end
		3'd6: begin
			builder_rhs_array_muxed2 <= main_sdram_bankmachine6_cmd_payload_ba;
		end
		default: begin
			builder_rhs_array_muxed2 <= main_sdram_bankmachine7_cmd_payload_ba;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed3 <= 1'd0;
	case (main_sdram_choose_cmd_grant)
		1'd0: begin
			builder_rhs_array_muxed3 <= main_sdram_bankmachine0_cmd_payload_is_read;
		end
		1'd1: begin
			builder_rhs_array_muxed3 <= main_sdram_bankmachine1_cmd_payload_is_read;
		end
		2'd2: begin
			builder_rhs_array_muxed3 <= main_sdram_bankmachine2_cmd_payload_is_read;
		end
		2'd3: begin
			builder_rhs_array_muxed3 <= main_sdram_bankmachine3_cmd_payload_is_read;
		end
		3'd4: begin
			builder_rhs_array_muxed3 <= main_sdram_bankmachine4_cmd_payload_is_read;
		end
		3'd5: begin
			builder_rhs_array_muxed3 <= main_sdram_bankmachine5_cmd_payload_is_read;
		end
		3'd6: begin
			builder_rhs_array_muxed3 <= main_sdram_bankmachine6_cmd_payload_is_read;
		end
		default: begin
			builder_rhs_array_muxed3 <= main_sdram_bankmachine7_cmd_payload_is_read;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed4 <= 1'd0;
	case (main_sdram_choose_cmd_grant)
		1'd0: begin
			builder_rhs_array_muxed4 <= main_sdram_bankmachine0_cmd_payload_is_write;
		end
		1'd1: begin
			builder_rhs_array_muxed4 <= main_sdram_bankmachine1_cmd_payload_is_write;
		end
		2'd2: begin
			builder_rhs_array_muxed4 <= main_sdram_bankmachine2_cmd_payload_is_write;
		end
		2'd3: begin
			builder_rhs_array_muxed4 <= main_sdram_bankmachine3_cmd_payload_is_write;
		end
		3'd4: begin
			builder_rhs_array_muxed4 <= main_sdram_bankmachine4_cmd_payload_is_write;
		end
		3'd5: begin
			builder_rhs_array_muxed4 <= main_sdram_bankmachine5_cmd_payload_is_write;
		end
		3'd6: begin
			builder_rhs_array_muxed4 <= main_sdram_bankmachine6_cmd_payload_is_write;
		end
		default: begin
			builder_rhs_array_muxed4 <= main_sdram_bankmachine7_cmd_payload_is_write;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed5 <= 1'd0;
	case (main_sdram_choose_cmd_grant)
		1'd0: begin
			builder_rhs_array_muxed5 <= main_sdram_bankmachine0_cmd_payload_is_cmd;
		end
		1'd1: begin
			builder_rhs_array_muxed5 <= main_sdram_bankmachine1_cmd_payload_is_cmd;
		end
		2'd2: begin
			builder_rhs_array_muxed5 <= main_sdram_bankmachine2_cmd_payload_is_cmd;
		end
		2'd3: begin
			builder_rhs_array_muxed5 <= main_sdram_bankmachine3_cmd_payload_is_cmd;
		end
		3'd4: begin
			builder_rhs_array_muxed5 <= main_sdram_bankmachine4_cmd_payload_is_cmd;
		end
		3'd5: begin
			builder_rhs_array_muxed5 <= main_sdram_bankmachine5_cmd_payload_is_cmd;
		end
		3'd6: begin
			builder_rhs_array_muxed5 <= main_sdram_bankmachine6_cmd_payload_is_cmd;
		end
		default: begin
			builder_rhs_array_muxed5 <= main_sdram_bankmachine7_cmd_payload_is_cmd;
		end
	endcase
end
always @(*) begin
	builder_t_array_muxed0 <= 1'd0;
	case (main_sdram_choose_cmd_grant)
		1'd0: begin
			builder_t_array_muxed0 <= main_sdram_bankmachine0_cmd_payload_cas;
		end
		1'd1: begin
			builder_t_array_muxed0 <= main_sdram_bankmachine1_cmd_payload_cas;
		end
		2'd2: begin
			builder_t_array_muxed0 <= main_sdram_bankmachine2_cmd_payload_cas;
		end
		2'd3: begin
			builder_t_array_muxed0 <= main_sdram_bankmachine3_cmd_payload_cas;
		end
		3'd4: begin
			builder_t_array_muxed0 <= main_sdram_bankmachine4_cmd_payload_cas;
		end
		3'd5: begin
			builder_t_array_muxed0 <= main_sdram_bankmachine5_cmd_payload_cas;
		end
		3'd6: begin
			builder_t_array_muxed0 <= main_sdram_bankmachine6_cmd_payload_cas;
		end
		default: begin
			builder_t_array_muxed0 <= main_sdram_bankmachine7_cmd_payload_cas;
		end
	endcase
end
always @(*) begin
	builder_t_array_muxed1 <= 1'd0;
	case (main_sdram_choose_cmd_grant)
		1'd0: begin
			builder_t_array_muxed1 <= main_sdram_bankmachine0_cmd_payload_ras;
		end
		1'd1: begin
			builder_t_array_muxed1 <= main_sdram_bankmachine1_cmd_payload_ras;
		end
		2'd2: begin
			builder_t_array_muxed1 <= main_sdram_bankmachine2_cmd_payload_ras;
		end
		2'd3: begin
			builder_t_array_muxed1 <= main_sdram_bankmachine3_cmd_payload_ras;
		end
		3'd4: begin
			builder_t_array_muxed1 <= main_sdram_bankmachine4_cmd_payload_ras;
		end
		3'd5: begin
			builder_t_array_muxed1 <= main_sdram_bankmachine5_cmd_payload_ras;
		end
		3'd6: begin
			builder_t_array_muxed1 <= main_sdram_bankmachine6_cmd_payload_ras;
		end
		default: begin
			builder_t_array_muxed1 <= main_sdram_bankmachine7_cmd_payload_ras;
		end
	endcase
end
always @(*) begin
	builder_t_array_muxed2 <= 1'd0;
	case (main_sdram_choose_cmd_grant)
		1'd0: begin
			builder_t_array_muxed2 <= main_sdram_bankmachine0_cmd_payload_we;
		end
		1'd1: begin
			builder_t_array_muxed2 <= main_sdram_bankmachine1_cmd_payload_we;
		end
		2'd2: begin
			builder_t_array_muxed2 <= main_sdram_bankmachine2_cmd_payload_we;
		end
		2'd3: begin
			builder_t_array_muxed2 <= main_sdram_bankmachine3_cmd_payload_we;
		end
		3'd4: begin
			builder_t_array_muxed2 <= main_sdram_bankmachine4_cmd_payload_we;
		end
		3'd5: begin
			builder_t_array_muxed2 <= main_sdram_bankmachine5_cmd_payload_we;
		end
		3'd6: begin
			builder_t_array_muxed2 <= main_sdram_bankmachine6_cmd_payload_we;
		end
		default: begin
			builder_t_array_muxed2 <= main_sdram_bankmachine7_cmd_payload_we;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed6 <= 1'd0;
	case (main_sdram_choose_req_grant)
		1'd0: begin
			builder_rhs_array_muxed6 <= main_sdram_choose_req_valids[0];
		end
		1'd1: begin
			builder_rhs_array_muxed6 <= main_sdram_choose_req_valids[1];
		end
		2'd2: begin
			builder_rhs_array_muxed6 <= main_sdram_choose_req_valids[2];
		end
		2'd3: begin
			builder_rhs_array_muxed6 <= main_sdram_choose_req_valids[3];
		end
		3'd4: begin
			builder_rhs_array_muxed6 <= main_sdram_choose_req_valids[4];
		end
		3'd5: begin
			builder_rhs_array_muxed6 <= main_sdram_choose_req_valids[5];
		end
		3'd6: begin
			builder_rhs_array_muxed6 <= main_sdram_choose_req_valids[6];
		end
		default: begin
			builder_rhs_array_muxed6 <= main_sdram_choose_req_valids[7];
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed7 <= 14'd0;
	case (main_sdram_choose_req_grant)
		1'd0: begin
			builder_rhs_array_muxed7 <= main_sdram_bankmachine0_cmd_payload_a;
		end
		1'd1: begin
			builder_rhs_array_muxed7 <= main_sdram_bankmachine1_cmd_payload_a;
		end
		2'd2: begin
			builder_rhs_array_muxed7 <= main_sdram_bankmachine2_cmd_payload_a;
		end
		2'd3: begin
			builder_rhs_array_muxed7 <= main_sdram_bankmachine3_cmd_payload_a;
		end
		3'd4: begin
			builder_rhs_array_muxed7 <= main_sdram_bankmachine4_cmd_payload_a;
		end
		3'd5: begin
			builder_rhs_array_muxed7 <= main_sdram_bankmachine5_cmd_payload_a;
		end
		3'd6: begin
			builder_rhs_array_muxed7 <= main_sdram_bankmachine6_cmd_payload_a;
		end
		default: begin
			builder_rhs_array_muxed7 <= main_sdram_bankmachine7_cmd_payload_a;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed8 <= 3'd0;
	case (main_sdram_choose_req_grant)
		1'd0: begin
			builder_rhs_array_muxed8 <= main_sdram_bankmachine0_cmd_payload_ba;
		end
		1'd1: begin
			builder_rhs_array_muxed8 <= main_sdram_bankmachine1_cmd_payload_ba;
		end
		2'd2: begin
			builder_rhs_array_muxed8 <= main_sdram_bankmachine2_cmd_payload_ba;
		end
		2'd3: begin
			builder_rhs_array_muxed8 <= main_sdram_bankmachine3_cmd_payload_ba;
		end
		3'd4: begin
			builder_rhs_array_muxed8 <= main_sdram_bankmachine4_cmd_payload_ba;
		end
		3'd5: begin
			builder_rhs_array_muxed8 <= main_sdram_bankmachine5_cmd_payload_ba;
		end
		3'd6: begin
			builder_rhs_array_muxed8 <= main_sdram_bankmachine6_cmd_payload_ba;
		end
		default: begin
			builder_rhs_array_muxed8 <= main_sdram_bankmachine7_cmd_payload_ba;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed9 <= 1'd0;
	case (main_sdram_choose_req_grant)
		1'd0: begin
			builder_rhs_array_muxed9 <= main_sdram_bankmachine0_cmd_payload_is_read;
		end
		1'd1: begin
			builder_rhs_array_muxed9 <= main_sdram_bankmachine1_cmd_payload_is_read;
		end
		2'd2: begin
			builder_rhs_array_muxed9 <= main_sdram_bankmachine2_cmd_payload_is_read;
		end
		2'd3: begin
			builder_rhs_array_muxed9 <= main_sdram_bankmachine3_cmd_payload_is_read;
		end
		3'd4: begin
			builder_rhs_array_muxed9 <= main_sdram_bankmachine4_cmd_payload_is_read;
		end
		3'd5: begin
			builder_rhs_array_muxed9 <= main_sdram_bankmachine5_cmd_payload_is_read;
		end
		3'd6: begin
			builder_rhs_array_muxed9 <= main_sdram_bankmachine6_cmd_payload_is_read;
		end
		default: begin
			builder_rhs_array_muxed9 <= main_sdram_bankmachine7_cmd_payload_is_read;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed10 <= 1'd0;
	case (main_sdram_choose_req_grant)
		1'd0: begin
			builder_rhs_array_muxed10 <= main_sdram_bankmachine0_cmd_payload_is_write;
		end
		1'd1: begin
			builder_rhs_array_muxed10 <= main_sdram_bankmachine1_cmd_payload_is_write;
		end
		2'd2: begin
			builder_rhs_array_muxed10 <= main_sdram_bankmachine2_cmd_payload_is_write;
		end
		2'd3: begin
			builder_rhs_array_muxed10 <= main_sdram_bankmachine3_cmd_payload_is_write;
		end
		3'd4: begin
			builder_rhs_array_muxed10 <= main_sdram_bankmachine4_cmd_payload_is_write;
		end
		3'd5: begin
			builder_rhs_array_muxed10 <= main_sdram_bankmachine5_cmd_payload_is_write;
		end
		3'd6: begin
			builder_rhs_array_muxed10 <= main_sdram_bankmachine6_cmd_payload_is_write;
		end
		default: begin
			builder_rhs_array_muxed10 <= main_sdram_bankmachine7_cmd_payload_is_write;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed11 <= 1'd0;
	case (main_sdram_choose_req_grant)
		1'd0: begin
			builder_rhs_array_muxed11 <= main_sdram_bankmachine0_cmd_payload_is_cmd;
		end
		1'd1: begin
			builder_rhs_array_muxed11 <= main_sdram_bankmachine1_cmd_payload_is_cmd;
		end
		2'd2: begin
			builder_rhs_array_muxed11 <= main_sdram_bankmachine2_cmd_payload_is_cmd;
		end
		2'd3: begin
			builder_rhs_array_muxed11 <= main_sdram_bankmachine3_cmd_payload_is_cmd;
		end
		3'd4: begin
			builder_rhs_array_muxed11 <= main_sdram_bankmachine4_cmd_payload_is_cmd;
		end
		3'd5: begin
			builder_rhs_array_muxed11 <= main_sdram_bankmachine5_cmd_payload_is_cmd;
		end
		3'd6: begin
			builder_rhs_array_muxed11 <= main_sdram_bankmachine6_cmd_payload_is_cmd;
		end
		default: begin
			builder_rhs_array_muxed11 <= main_sdram_bankmachine7_cmd_payload_is_cmd;
		end
	endcase
end
always @(*) begin
	builder_t_array_muxed3 <= 1'd0;
	case (main_sdram_choose_req_grant)
		1'd0: begin
			builder_t_array_muxed3 <= main_sdram_bankmachine0_cmd_payload_cas;
		end
		1'd1: begin
			builder_t_array_muxed3 <= main_sdram_bankmachine1_cmd_payload_cas;
		end
		2'd2: begin
			builder_t_array_muxed3 <= main_sdram_bankmachine2_cmd_payload_cas;
		end
		2'd3: begin
			builder_t_array_muxed3 <= main_sdram_bankmachine3_cmd_payload_cas;
		end
		3'd4: begin
			builder_t_array_muxed3 <= main_sdram_bankmachine4_cmd_payload_cas;
		end
		3'd5: begin
			builder_t_array_muxed3 <= main_sdram_bankmachine5_cmd_payload_cas;
		end
		3'd6: begin
			builder_t_array_muxed3 <= main_sdram_bankmachine6_cmd_payload_cas;
		end
		default: begin
			builder_t_array_muxed3 <= main_sdram_bankmachine7_cmd_payload_cas;
		end
	endcase
end
always @(*) begin
	builder_t_array_muxed4 <= 1'd0;
	case (main_sdram_choose_req_grant)
		1'd0: begin
			builder_t_array_muxed4 <= main_sdram_bankmachine0_cmd_payload_ras;
		end
		1'd1: begin
			builder_t_array_muxed4 <= main_sdram_bankmachine1_cmd_payload_ras;
		end
		2'd2: begin
			builder_t_array_muxed4 <= main_sdram_bankmachine2_cmd_payload_ras;
		end
		2'd3: begin
			builder_t_array_muxed4 <= main_sdram_bankmachine3_cmd_payload_ras;
		end
		3'd4: begin
			builder_t_array_muxed4 <= main_sdram_bankmachine4_cmd_payload_ras;
		end
		3'd5: begin
			builder_t_array_muxed4 <= main_sdram_bankmachine5_cmd_payload_ras;
		end
		3'd6: begin
			builder_t_array_muxed4 <= main_sdram_bankmachine6_cmd_payload_ras;
		end
		default: begin
			builder_t_array_muxed4 <= main_sdram_bankmachine7_cmd_payload_ras;
		end
	endcase
end
always @(*) begin
	builder_t_array_muxed5 <= 1'd0;
	case (main_sdram_choose_req_grant)
		1'd0: begin
			builder_t_array_muxed5 <= main_sdram_bankmachine0_cmd_payload_we;
		end
		1'd1: begin
			builder_t_array_muxed5 <= main_sdram_bankmachine1_cmd_payload_we;
		end
		2'd2: begin
			builder_t_array_muxed5 <= main_sdram_bankmachine2_cmd_payload_we;
		end
		2'd3: begin
			builder_t_array_muxed5 <= main_sdram_bankmachine3_cmd_payload_we;
		end
		3'd4: begin
			builder_t_array_muxed5 <= main_sdram_bankmachine4_cmd_payload_we;
		end
		3'd5: begin
			builder_t_array_muxed5 <= main_sdram_bankmachine5_cmd_payload_we;
		end
		3'd6: begin
			builder_t_array_muxed5 <= main_sdram_bankmachine6_cmd_payload_we;
		end
		default: begin
			builder_t_array_muxed5 <= main_sdram_bankmachine7_cmd_payload_we;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed12 <= 21'd0;
	case (builder_roundrobin0_grant)
		1'd0: begin
			builder_rhs_array_muxed12 <= {main_litedramnativeport0_cmd_payload_addr[23:10], main_litedramnativeport0_cmd_payload_addr[6:0]};
		end
		default: begin
			builder_rhs_array_muxed12 <= {main_litedramnativeport1_cmd_payload_addr[23:10], main_litedramnativeport1_cmd_payload_addr[6:0]};
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed13 <= 1'd0;
	case (builder_roundrobin0_grant)
		1'd0: begin
			builder_rhs_array_muxed13 <= main_litedramnativeport0_cmd_payload_we;
		end
		default: begin
			builder_rhs_array_muxed13 <= main_litedramnativeport1_cmd_payload_we;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed14 <= 1'd0;
	case (builder_roundrobin0_grant)
		1'd0: begin
			builder_rhs_array_muxed14 <= (((main_litedramnativeport0_cmd_payload_addr[9:7] == 1'd0) & (~(((((((builder_locked0 | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0))))) & main_litedramnativeport0_cmd_valid);
		end
		default: begin
			builder_rhs_array_muxed14 <= (((main_litedramnativeport1_cmd_payload_addr[9:7] == 1'd0) & (~(((((((builder_locked1 | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd1))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd1))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd1))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd1))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd1))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd1))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd1))))) & main_litedramnativeport1_cmd_valid);
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed15 <= 21'd0;
	case (builder_roundrobin1_grant)
		1'd0: begin
			builder_rhs_array_muxed15 <= {main_litedramnativeport0_cmd_payload_addr[23:10], main_litedramnativeport0_cmd_payload_addr[6:0]};
		end
		default: begin
			builder_rhs_array_muxed15 <= {main_litedramnativeport1_cmd_payload_addr[23:10], main_litedramnativeport1_cmd_payload_addr[6:0]};
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed16 <= 1'd0;
	case (builder_roundrobin1_grant)
		1'd0: begin
			builder_rhs_array_muxed16 <= main_litedramnativeport0_cmd_payload_we;
		end
		default: begin
			builder_rhs_array_muxed16 <= main_litedramnativeport1_cmd_payload_we;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed17 <= 1'd0;
	case (builder_roundrobin1_grant)
		1'd0: begin
			builder_rhs_array_muxed17 <= (((main_litedramnativeport0_cmd_payload_addr[9:7] == 1'd1) & (~(((((((builder_locked2 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0))))) & main_litedramnativeport0_cmd_valid);
		end
		default: begin
			builder_rhs_array_muxed17 <= (((main_litedramnativeport1_cmd_payload_addr[9:7] == 1'd1) & (~(((((((builder_locked3 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd1))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd1))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd1))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd1))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd1))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd1))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd1))))) & main_litedramnativeport1_cmd_valid);
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed18 <= 21'd0;
	case (builder_roundrobin2_grant)
		1'd0: begin
			builder_rhs_array_muxed18 <= {main_litedramnativeport0_cmd_payload_addr[23:10], main_litedramnativeport0_cmd_payload_addr[6:0]};
		end
		default: begin
			builder_rhs_array_muxed18 <= {main_litedramnativeport1_cmd_payload_addr[23:10], main_litedramnativeport1_cmd_payload_addr[6:0]};
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed19 <= 1'd0;
	case (builder_roundrobin2_grant)
		1'd0: begin
			builder_rhs_array_muxed19 <= main_litedramnativeport0_cmd_payload_we;
		end
		default: begin
			builder_rhs_array_muxed19 <= main_litedramnativeport1_cmd_payload_we;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed20 <= 1'd0;
	case (builder_roundrobin2_grant)
		1'd0: begin
			builder_rhs_array_muxed20 <= (((main_litedramnativeport0_cmd_payload_addr[9:7] == 2'd2) & (~(((((((builder_locked4 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0))))) & main_litedramnativeport0_cmd_valid);
		end
		default: begin
			builder_rhs_array_muxed20 <= (((main_litedramnativeport1_cmd_payload_addr[9:7] == 2'd2) & (~(((((((builder_locked5 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd1))) | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd1))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd1))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd1))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd1))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd1))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd1))))) & main_litedramnativeport1_cmd_valid);
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed21 <= 21'd0;
	case (builder_roundrobin3_grant)
		1'd0: begin
			builder_rhs_array_muxed21 <= {main_litedramnativeport0_cmd_payload_addr[23:10], main_litedramnativeport0_cmd_payload_addr[6:0]};
		end
		default: begin
			builder_rhs_array_muxed21 <= {main_litedramnativeport1_cmd_payload_addr[23:10], main_litedramnativeport1_cmd_payload_addr[6:0]};
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed22 <= 1'd0;
	case (builder_roundrobin3_grant)
		1'd0: begin
			builder_rhs_array_muxed22 <= main_litedramnativeport0_cmd_payload_we;
		end
		default: begin
			builder_rhs_array_muxed22 <= main_litedramnativeport1_cmd_payload_we;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed23 <= 1'd0;
	case (builder_roundrobin3_grant)
		1'd0: begin
			builder_rhs_array_muxed23 <= (((main_litedramnativeport0_cmd_payload_addr[9:7] == 2'd3) & (~(((((((builder_locked6 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0))))) & main_litedramnativeport0_cmd_valid);
		end
		default: begin
			builder_rhs_array_muxed23 <= (((main_litedramnativeport1_cmd_payload_addr[9:7] == 2'd3) & (~(((((((builder_locked7 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd1))) | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd1))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd1))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd1))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd1))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd1))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd1))))) & main_litedramnativeport1_cmd_valid);
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed24 <= 21'd0;
	case (builder_roundrobin4_grant)
		1'd0: begin
			builder_rhs_array_muxed24 <= {main_litedramnativeport0_cmd_payload_addr[23:10], main_litedramnativeport0_cmd_payload_addr[6:0]};
		end
		default: begin
			builder_rhs_array_muxed24 <= {main_litedramnativeport1_cmd_payload_addr[23:10], main_litedramnativeport1_cmd_payload_addr[6:0]};
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed25 <= 1'd0;
	case (builder_roundrobin4_grant)
		1'd0: begin
			builder_rhs_array_muxed25 <= main_litedramnativeport0_cmd_payload_we;
		end
		default: begin
			builder_rhs_array_muxed25 <= main_litedramnativeport1_cmd_payload_we;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed26 <= 1'd0;
	case (builder_roundrobin4_grant)
		1'd0: begin
			builder_rhs_array_muxed26 <= (((main_litedramnativeport0_cmd_payload_addr[9:7] == 3'd4) & (~(((((((builder_locked8 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0))))) & main_litedramnativeport0_cmd_valid);
		end
		default: begin
			builder_rhs_array_muxed26 <= (((main_litedramnativeport1_cmd_payload_addr[9:7] == 3'd4) & (~(((((((builder_locked9 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd1))) | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd1))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd1))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd1))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd1))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd1))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd1))))) & main_litedramnativeport1_cmd_valid);
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed27 <= 21'd0;
	case (builder_roundrobin5_grant)
		1'd0: begin
			builder_rhs_array_muxed27 <= {main_litedramnativeport0_cmd_payload_addr[23:10], main_litedramnativeport0_cmd_payload_addr[6:0]};
		end
		default: begin
			builder_rhs_array_muxed27 <= {main_litedramnativeport1_cmd_payload_addr[23:10], main_litedramnativeport1_cmd_payload_addr[6:0]};
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed28 <= 1'd0;
	case (builder_roundrobin5_grant)
		1'd0: begin
			builder_rhs_array_muxed28 <= main_litedramnativeport0_cmd_payload_we;
		end
		default: begin
			builder_rhs_array_muxed28 <= main_litedramnativeport1_cmd_payload_we;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed29 <= 1'd0;
	case (builder_roundrobin5_grant)
		1'd0: begin
			builder_rhs_array_muxed29 <= (((main_litedramnativeport0_cmd_payload_addr[9:7] == 3'd5) & (~(((((((builder_locked10 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0))))) & main_litedramnativeport0_cmd_valid);
		end
		default: begin
			builder_rhs_array_muxed29 <= (((main_litedramnativeport1_cmd_payload_addr[9:7] == 3'd5) & (~(((((((builder_locked11 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd1))) | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd1))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd1))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd1))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd1))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd1))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd1))))) & main_litedramnativeport1_cmd_valid);
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed30 <= 21'd0;
	case (builder_roundrobin6_grant)
		1'd0: begin
			builder_rhs_array_muxed30 <= {main_litedramnativeport0_cmd_payload_addr[23:10], main_litedramnativeport0_cmd_payload_addr[6:0]};
		end
		default: begin
			builder_rhs_array_muxed30 <= {main_litedramnativeport1_cmd_payload_addr[23:10], main_litedramnativeport1_cmd_payload_addr[6:0]};
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed31 <= 1'd0;
	case (builder_roundrobin6_grant)
		1'd0: begin
			builder_rhs_array_muxed31 <= main_litedramnativeport0_cmd_payload_we;
		end
		default: begin
			builder_rhs_array_muxed31 <= main_litedramnativeport1_cmd_payload_we;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed32 <= 1'd0;
	case (builder_roundrobin6_grant)
		1'd0: begin
			builder_rhs_array_muxed32 <= (((main_litedramnativeport0_cmd_payload_addr[9:7] == 3'd6) & (~(((((((builder_locked12 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0))))) & main_litedramnativeport0_cmd_valid);
		end
		default: begin
			builder_rhs_array_muxed32 <= (((main_litedramnativeport1_cmd_payload_addr[9:7] == 3'd6) & (~(((((((builder_locked13 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd1))) | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd1))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd1))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd1))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd1))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd1))) | (main_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd1))))) & main_litedramnativeport1_cmd_valid);
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed33 <= 21'd0;
	case (builder_roundrobin7_grant)
		1'd0: begin
			builder_rhs_array_muxed33 <= {main_litedramnativeport0_cmd_payload_addr[23:10], main_litedramnativeport0_cmd_payload_addr[6:0]};
		end
		default: begin
			builder_rhs_array_muxed33 <= {main_litedramnativeport1_cmd_payload_addr[23:10], main_litedramnativeport1_cmd_payload_addr[6:0]};
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed34 <= 1'd0;
	case (builder_roundrobin7_grant)
		1'd0: begin
			builder_rhs_array_muxed34 <= main_litedramnativeport0_cmd_payload_we;
		end
		default: begin
			builder_rhs_array_muxed34 <= main_litedramnativeport1_cmd_payload_we;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed35 <= 1'd0;
	case (builder_roundrobin7_grant)
		1'd0: begin
			builder_rhs_array_muxed35 <= (((main_litedramnativeport0_cmd_payload_addr[9:7] == 3'd7) & (~(((((((builder_locked14 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0))))) & main_litedramnativeport0_cmd_valid);
		end
		default: begin
			builder_rhs_array_muxed35 <= (((main_litedramnativeport1_cmd_payload_addr[9:7] == 3'd7) & (~(((((((builder_locked15 | (main_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd1))) | (main_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd1))) | (main_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd1))) | (main_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd1))) | (main_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd1))) | (main_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd1))) | (main_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd1))))) & main_litedramnativeport1_cmd_valid);
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed36 <= 30'd0;
	case (builder_grant)
		default: begin
			builder_rhs_array_muxed36 <= main_basesoc_vexriscvsmp_pbus_adr;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed37 <= 32'd0;
	case (builder_grant)
		default: begin
			builder_rhs_array_muxed37 <= main_basesoc_vexriscvsmp_pbus_dat_w;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed38 <= 4'd0;
	case (builder_grant)
		default: begin
			builder_rhs_array_muxed38 <= main_basesoc_vexriscvsmp_pbus_sel;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed39 <= 1'd0;
	case (builder_grant)
		default: begin
			builder_rhs_array_muxed39 <= main_basesoc_vexriscvsmp_pbus_cyc;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed40 <= 1'd0;
	case (builder_grant)
		default: begin
			builder_rhs_array_muxed40 <= main_basesoc_vexriscvsmp_pbus_stb;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed41 <= 1'd0;
	case (builder_grant)
		default: begin
			builder_rhs_array_muxed41 <= main_basesoc_vexriscvsmp_pbus_we;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed42 <= 3'd0;
	case (builder_grant)
		default: begin
			builder_rhs_array_muxed42 <= main_basesoc_vexriscvsmp_pbus_cti;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed43 <= 2'd0;
	case (builder_grant)
		default: begin
			builder_rhs_array_muxed43 <= main_basesoc_vexriscvsmp_pbus_bte;
		end
	endcase
end
always @(*) begin
	builder_array_muxed0 <= 3'd0;
	case (main_sdram_steerer_sel0)
		1'd0: begin
			builder_array_muxed0 <= main_sdram_nop_ba[2:0];
		end
		1'd1: begin
			builder_array_muxed0 <= main_sdram_choose_cmd_cmd_payload_ba[2:0];
		end
		2'd2: begin
			builder_array_muxed0 <= main_sdram_choose_req_cmd_payload_ba[2:0];
		end
		default: begin
			builder_array_muxed0 <= main_sdram_cmd_payload_ba[2:0];
		end
	endcase
end
always @(*) begin
	builder_array_muxed1 <= 14'd0;
	case (main_sdram_steerer_sel0)
		1'd0: begin
			builder_array_muxed1 <= main_sdram_nop_a;
		end
		1'd1: begin
			builder_array_muxed1 <= main_sdram_choose_cmd_cmd_payload_a;
		end
		2'd2: begin
			builder_array_muxed1 <= main_sdram_choose_req_cmd_payload_a;
		end
		default: begin
			builder_array_muxed1 <= main_sdram_cmd_payload_a;
		end
	endcase
end
always @(*) begin
	builder_array_muxed2 <= 1'd0;
	case (main_sdram_steerer_sel0)
		1'd0: begin
			builder_array_muxed2 <= 1'd0;
		end
		1'd1: begin
			builder_array_muxed2 <= ((main_sdram_choose_cmd_cmd_valid & main_sdram_choose_cmd_cmd_ready) & main_sdram_choose_cmd_cmd_payload_cas);
		end
		2'd2: begin
			builder_array_muxed2 <= ((main_sdram_choose_req_cmd_valid & main_sdram_choose_req_cmd_ready) & main_sdram_choose_req_cmd_payload_cas);
		end
		default: begin
			builder_array_muxed2 <= ((main_sdram_cmd_valid & main_sdram_cmd_ready) & main_sdram_cmd_payload_cas);
		end
	endcase
end
always @(*) begin
	builder_array_muxed3 <= 1'd0;
	case (main_sdram_steerer_sel0)
		1'd0: begin
			builder_array_muxed3 <= 1'd0;
		end
		1'd1: begin
			builder_array_muxed3 <= ((main_sdram_choose_cmd_cmd_valid & main_sdram_choose_cmd_cmd_ready) & main_sdram_choose_cmd_cmd_payload_ras);
		end
		2'd2: begin
			builder_array_muxed3 <= ((main_sdram_choose_req_cmd_valid & main_sdram_choose_req_cmd_ready) & main_sdram_choose_req_cmd_payload_ras);
		end
		default: begin
			builder_array_muxed3 <= ((main_sdram_cmd_valid & main_sdram_cmd_ready) & main_sdram_cmd_payload_ras);
		end
	endcase
end
always @(*) begin
	builder_array_muxed4 <= 1'd0;
	case (main_sdram_steerer_sel0)
		1'd0: begin
			builder_array_muxed4 <= 1'd0;
		end
		1'd1: begin
			builder_array_muxed4 <= ((main_sdram_choose_cmd_cmd_valid & main_sdram_choose_cmd_cmd_ready) & main_sdram_choose_cmd_cmd_payload_we);
		end
		2'd2: begin
			builder_array_muxed4 <= ((main_sdram_choose_req_cmd_valid & main_sdram_choose_req_cmd_ready) & main_sdram_choose_req_cmd_payload_we);
		end
		default: begin
			builder_array_muxed4 <= ((main_sdram_cmd_valid & main_sdram_cmd_ready) & main_sdram_cmd_payload_we);
		end
	endcase
end
always @(*) begin
	builder_array_muxed5 <= 1'd0;
	case (main_sdram_steerer_sel0)
		1'd0: begin
			builder_array_muxed5 <= 1'd0;
		end
		1'd1: begin
			builder_array_muxed5 <= ((main_sdram_choose_cmd_cmd_valid & main_sdram_choose_cmd_cmd_ready) & main_sdram_choose_cmd_cmd_payload_is_read);
		end
		2'd2: begin
			builder_array_muxed5 <= ((main_sdram_choose_req_cmd_valid & main_sdram_choose_req_cmd_ready) & main_sdram_choose_req_cmd_payload_is_read);
		end
		default: begin
			builder_array_muxed5 <= ((main_sdram_cmd_valid & main_sdram_cmd_ready) & main_sdram_cmd_payload_is_read);
		end
	endcase
end
always @(*) begin
	builder_array_muxed6 <= 1'd0;
	case (main_sdram_steerer_sel0)
		1'd0: begin
			builder_array_muxed6 <= 1'd0;
		end
		1'd1: begin
			builder_array_muxed6 <= ((main_sdram_choose_cmd_cmd_valid & main_sdram_choose_cmd_cmd_ready) & main_sdram_choose_cmd_cmd_payload_is_write);
		end
		2'd2: begin
			builder_array_muxed6 <= ((main_sdram_choose_req_cmd_valid & main_sdram_choose_req_cmd_ready) & main_sdram_choose_req_cmd_payload_is_write);
		end
		default: begin
			builder_array_muxed6 <= ((main_sdram_cmd_valid & main_sdram_cmd_ready) & main_sdram_cmd_payload_is_write);
		end
	endcase
end
always @(*) begin
	builder_array_muxed7 <= 3'd0;
	case (main_sdram_steerer_sel1)
		1'd0: begin
			builder_array_muxed7 <= main_sdram_nop_ba[2:0];
		end
		1'd1: begin
			builder_array_muxed7 <= main_sdram_choose_cmd_cmd_payload_ba[2:0];
		end
		2'd2: begin
			builder_array_muxed7 <= main_sdram_choose_req_cmd_payload_ba[2:0];
		end
		default: begin
			builder_array_muxed7 <= main_sdram_cmd_payload_ba[2:0];
		end
	endcase
end
always @(*) begin
	builder_array_muxed8 <= 14'd0;
	case (main_sdram_steerer_sel1)
		1'd0: begin
			builder_array_muxed8 <= main_sdram_nop_a;
		end
		1'd1: begin
			builder_array_muxed8 <= main_sdram_choose_cmd_cmd_payload_a;
		end
		2'd2: begin
			builder_array_muxed8 <= main_sdram_choose_req_cmd_payload_a;
		end
		default: begin
			builder_array_muxed8 <= main_sdram_cmd_payload_a;
		end
	endcase
end
always @(*) begin
	builder_array_muxed9 <= 1'd0;
	case (main_sdram_steerer_sel1)
		1'd0: begin
			builder_array_muxed9 <= 1'd0;
		end
		1'd1: begin
			builder_array_muxed9 <= ((main_sdram_choose_cmd_cmd_valid & main_sdram_choose_cmd_cmd_ready) & main_sdram_choose_cmd_cmd_payload_cas);
		end
		2'd2: begin
			builder_array_muxed9 <= ((main_sdram_choose_req_cmd_valid & main_sdram_choose_req_cmd_ready) & main_sdram_choose_req_cmd_payload_cas);
		end
		default: begin
			builder_array_muxed9 <= ((main_sdram_cmd_valid & main_sdram_cmd_ready) & main_sdram_cmd_payload_cas);
		end
	endcase
end
always @(*) begin
	builder_array_muxed10 <= 1'd0;
	case (main_sdram_steerer_sel1)
		1'd0: begin
			builder_array_muxed10 <= 1'd0;
		end
		1'd1: begin
			builder_array_muxed10 <= ((main_sdram_choose_cmd_cmd_valid & main_sdram_choose_cmd_cmd_ready) & main_sdram_choose_cmd_cmd_payload_ras);
		end
		2'd2: begin
			builder_array_muxed10 <= ((main_sdram_choose_req_cmd_valid & main_sdram_choose_req_cmd_ready) & main_sdram_choose_req_cmd_payload_ras);
		end
		default: begin
			builder_array_muxed10 <= ((main_sdram_cmd_valid & main_sdram_cmd_ready) & main_sdram_cmd_payload_ras);
		end
	endcase
end
always @(*) begin
	builder_array_muxed11 <= 1'd0;
	case (main_sdram_steerer_sel1)
		1'd0: begin
			builder_array_muxed11 <= 1'd0;
		end
		1'd1: begin
			builder_array_muxed11 <= ((main_sdram_choose_cmd_cmd_valid & main_sdram_choose_cmd_cmd_ready) & main_sdram_choose_cmd_cmd_payload_we);
		end
		2'd2: begin
			builder_array_muxed11 <= ((main_sdram_choose_req_cmd_valid & main_sdram_choose_req_cmd_ready) & main_sdram_choose_req_cmd_payload_we);
		end
		default: begin
			builder_array_muxed11 <= ((main_sdram_cmd_valid & main_sdram_cmd_ready) & main_sdram_cmd_payload_we);
		end
	endcase
end
always @(*) begin
	builder_array_muxed12 <= 1'd0;
	case (main_sdram_steerer_sel1)
		1'd0: begin
			builder_array_muxed12 <= 1'd0;
		end
		1'd1: begin
			builder_array_muxed12 <= ((main_sdram_choose_cmd_cmd_valid & main_sdram_choose_cmd_cmd_ready) & main_sdram_choose_cmd_cmd_payload_is_read);
		end
		2'd2: begin
			builder_array_muxed12 <= ((main_sdram_choose_req_cmd_valid & main_sdram_choose_req_cmd_ready) & main_sdram_choose_req_cmd_payload_is_read);
		end
		default: begin
			builder_array_muxed12 <= ((main_sdram_cmd_valid & main_sdram_cmd_ready) & main_sdram_cmd_payload_is_read);
		end
	endcase
end
always @(*) begin
	builder_array_muxed13 <= 1'd0;
	case (main_sdram_steerer_sel1)
		1'd0: begin
			builder_array_muxed13 <= 1'd0;
		end
		1'd1: begin
			builder_array_muxed13 <= ((main_sdram_choose_cmd_cmd_valid & main_sdram_choose_cmd_cmd_ready) & main_sdram_choose_cmd_cmd_payload_is_write);
		end
		2'd2: begin
			builder_array_muxed13 <= ((main_sdram_choose_req_cmd_valid & main_sdram_choose_req_cmd_ready) & main_sdram_choose_req_cmd_payload_is_write);
		end
		default: begin
			builder_array_muxed13 <= ((main_sdram_cmd_valid & main_sdram_cmd_ready) & main_sdram_cmd_payload_is_write);
		end
	endcase
end
always @(*) begin
	builder_array_muxed14 <= 3'd0;
	case (main_sdram_steerer_sel2)
		1'd0: begin
			builder_array_muxed14 <= main_sdram_nop_ba[2:0];
		end
		1'd1: begin
			builder_array_muxed14 <= main_sdram_choose_cmd_cmd_payload_ba[2:0];
		end
		2'd2: begin
			builder_array_muxed14 <= main_sdram_choose_req_cmd_payload_ba[2:0];
		end
		default: begin
			builder_array_muxed14 <= main_sdram_cmd_payload_ba[2:0];
		end
	endcase
end
always @(*) begin
	builder_array_muxed15 <= 14'd0;
	case (main_sdram_steerer_sel2)
		1'd0: begin
			builder_array_muxed15 <= main_sdram_nop_a;
		end
		1'd1: begin
			builder_array_muxed15 <= main_sdram_choose_cmd_cmd_payload_a;
		end
		2'd2: begin
			builder_array_muxed15 <= main_sdram_choose_req_cmd_payload_a;
		end
		default: begin
			builder_array_muxed15 <= main_sdram_cmd_payload_a;
		end
	endcase
end
always @(*) begin
	builder_array_muxed16 <= 1'd0;
	case (main_sdram_steerer_sel2)
		1'd0: begin
			builder_array_muxed16 <= 1'd0;
		end
		1'd1: begin
			builder_array_muxed16 <= ((main_sdram_choose_cmd_cmd_valid & main_sdram_choose_cmd_cmd_ready) & main_sdram_choose_cmd_cmd_payload_cas);
		end
		2'd2: begin
			builder_array_muxed16 <= ((main_sdram_choose_req_cmd_valid & main_sdram_choose_req_cmd_ready) & main_sdram_choose_req_cmd_payload_cas);
		end
		default: begin
			builder_array_muxed16 <= ((main_sdram_cmd_valid & main_sdram_cmd_ready) & main_sdram_cmd_payload_cas);
		end
	endcase
end
always @(*) begin
	builder_array_muxed17 <= 1'd0;
	case (main_sdram_steerer_sel2)
		1'd0: begin
			builder_array_muxed17 <= 1'd0;
		end
		1'd1: begin
			builder_array_muxed17 <= ((main_sdram_choose_cmd_cmd_valid & main_sdram_choose_cmd_cmd_ready) & main_sdram_choose_cmd_cmd_payload_ras);
		end
		2'd2: begin
			builder_array_muxed17 <= ((main_sdram_choose_req_cmd_valid & main_sdram_choose_req_cmd_ready) & main_sdram_choose_req_cmd_payload_ras);
		end
		default: begin
			builder_array_muxed17 <= ((main_sdram_cmd_valid & main_sdram_cmd_ready) & main_sdram_cmd_payload_ras);
		end
	endcase
end
always @(*) begin
	builder_array_muxed18 <= 1'd0;
	case (main_sdram_steerer_sel2)
		1'd0: begin
			builder_array_muxed18 <= 1'd0;
		end
		1'd1: begin
			builder_array_muxed18 <= ((main_sdram_choose_cmd_cmd_valid & main_sdram_choose_cmd_cmd_ready) & main_sdram_choose_cmd_cmd_payload_we);
		end
		2'd2: begin
			builder_array_muxed18 <= ((main_sdram_choose_req_cmd_valid & main_sdram_choose_req_cmd_ready) & main_sdram_choose_req_cmd_payload_we);
		end
		default: begin
			builder_array_muxed18 <= ((main_sdram_cmd_valid & main_sdram_cmd_ready) & main_sdram_cmd_payload_we);
		end
	endcase
end
always @(*) begin
	builder_array_muxed19 <= 1'd0;
	case (main_sdram_steerer_sel2)
		1'd0: begin
			builder_array_muxed19 <= 1'd0;
		end
		1'd1: begin
			builder_array_muxed19 <= ((main_sdram_choose_cmd_cmd_valid & main_sdram_choose_cmd_cmd_ready) & main_sdram_choose_cmd_cmd_payload_is_read);
		end
		2'd2: begin
			builder_array_muxed19 <= ((main_sdram_choose_req_cmd_valid & main_sdram_choose_req_cmd_ready) & main_sdram_choose_req_cmd_payload_is_read);
		end
		default: begin
			builder_array_muxed19 <= ((main_sdram_cmd_valid & main_sdram_cmd_ready) & main_sdram_cmd_payload_is_read);
		end
	endcase
end
always @(*) begin
	builder_array_muxed20 <= 1'd0;
	case (main_sdram_steerer_sel2)
		1'd0: begin
			builder_array_muxed20 <= 1'd0;
		end
		1'd1: begin
			builder_array_muxed20 <= ((main_sdram_choose_cmd_cmd_valid & main_sdram_choose_cmd_cmd_ready) & main_sdram_choose_cmd_cmd_payload_is_write);
		end
		2'd2: begin
			builder_array_muxed20 <= ((main_sdram_choose_req_cmd_valid & main_sdram_choose_req_cmd_ready) & main_sdram_choose_req_cmd_payload_is_write);
		end
		default: begin
			builder_array_muxed20 <= ((main_sdram_cmd_valid & main_sdram_cmd_ready) & main_sdram_cmd_payload_is_write);
		end
	endcase
end
always @(*) begin
	builder_array_muxed21 <= 3'd0;
	case (main_sdram_steerer_sel3)
		1'd0: begin
			builder_array_muxed21 <= main_sdram_nop_ba[2:0];
		end
		1'd1: begin
			builder_array_muxed21 <= main_sdram_choose_cmd_cmd_payload_ba[2:0];
		end
		2'd2: begin
			builder_array_muxed21 <= main_sdram_choose_req_cmd_payload_ba[2:0];
		end
		default: begin
			builder_array_muxed21 <= main_sdram_cmd_payload_ba[2:0];
		end
	endcase
end
always @(*) begin
	builder_array_muxed22 <= 14'd0;
	case (main_sdram_steerer_sel3)
		1'd0: begin
			builder_array_muxed22 <= main_sdram_nop_a;
		end
		1'd1: begin
			builder_array_muxed22 <= main_sdram_choose_cmd_cmd_payload_a;
		end
		2'd2: begin
			builder_array_muxed22 <= main_sdram_choose_req_cmd_payload_a;
		end
		default: begin
			builder_array_muxed22 <= main_sdram_cmd_payload_a;
		end
	endcase
end
always @(*) begin
	builder_array_muxed23 <= 1'd0;
	case (main_sdram_steerer_sel3)
		1'd0: begin
			builder_array_muxed23 <= 1'd0;
		end
		1'd1: begin
			builder_array_muxed23 <= ((main_sdram_choose_cmd_cmd_valid & main_sdram_choose_cmd_cmd_ready) & main_sdram_choose_cmd_cmd_payload_cas);
		end
		2'd2: begin
			builder_array_muxed23 <= ((main_sdram_choose_req_cmd_valid & main_sdram_choose_req_cmd_ready) & main_sdram_choose_req_cmd_payload_cas);
		end
		default: begin
			builder_array_muxed23 <= ((main_sdram_cmd_valid & main_sdram_cmd_ready) & main_sdram_cmd_payload_cas);
		end
	endcase
end
always @(*) begin
	builder_array_muxed24 <= 1'd0;
	case (main_sdram_steerer_sel3)
		1'd0: begin
			builder_array_muxed24 <= 1'd0;
		end
		1'd1: begin
			builder_array_muxed24 <= ((main_sdram_choose_cmd_cmd_valid & main_sdram_choose_cmd_cmd_ready) & main_sdram_choose_cmd_cmd_payload_ras);
		end
		2'd2: begin
			builder_array_muxed24 <= ((main_sdram_choose_req_cmd_valid & main_sdram_choose_req_cmd_ready) & main_sdram_choose_req_cmd_payload_ras);
		end
		default: begin
			builder_array_muxed24 <= ((main_sdram_cmd_valid & main_sdram_cmd_ready) & main_sdram_cmd_payload_ras);
		end
	endcase
end
always @(*) begin
	builder_array_muxed25 <= 1'd0;
	case (main_sdram_steerer_sel3)
		1'd0: begin
			builder_array_muxed25 <= 1'd0;
		end
		1'd1: begin
			builder_array_muxed25 <= ((main_sdram_choose_cmd_cmd_valid & main_sdram_choose_cmd_cmd_ready) & main_sdram_choose_cmd_cmd_payload_we);
		end
		2'd2: begin
			builder_array_muxed25 <= ((main_sdram_choose_req_cmd_valid & main_sdram_choose_req_cmd_ready) & main_sdram_choose_req_cmd_payload_we);
		end
		default: begin
			builder_array_muxed25 <= ((main_sdram_cmd_valid & main_sdram_cmd_ready) & main_sdram_cmd_payload_we);
		end
	endcase
end
always @(*) begin
	builder_array_muxed26 <= 1'd0;
	case (main_sdram_steerer_sel3)
		1'd0: begin
			builder_array_muxed26 <= 1'd0;
		end
		1'd1: begin
			builder_array_muxed26 <= ((main_sdram_choose_cmd_cmd_valid & main_sdram_choose_cmd_cmd_ready) & main_sdram_choose_cmd_cmd_payload_is_read);
		end
		2'd2: begin
			builder_array_muxed26 <= ((main_sdram_choose_req_cmd_valid & main_sdram_choose_req_cmd_ready) & main_sdram_choose_req_cmd_payload_is_read);
		end
		default: begin
			builder_array_muxed26 <= ((main_sdram_cmd_valid & main_sdram_cmd_ready) & main_sdram_cmd_payload_is_read);
		end
	endcase
end
always @(*) begin
	builder_array_muxed27 <= 1'd0;
	case (main_sdram_steerer_sel3)
		1'd0: begin
			builder_array_muxed27 <= 1'd0;
		end
		1'd1: begin
			builder_array_muxed27 <= ((main_sdram_choose_cmd_cmd_valid & main_sdram_choose_cmd_cmd_ready) & main_sdram_choose_cmd_cmd_payload_is_write);
		end
		2'd2: begin
			builder_array_muxed27 <= ((main_sdram_choose_req_cmd_valid & main_sdram_choose_req_cmd_ready) & main_sdram_choose_req_cmd_payload_is_write);
		end
		default: begin
			builder_array_muxed27 <= ((main_sdram_cmd_valid & main_sdram_cmd_ready) & main_sdram_cmd_payload_is_write);
		end
	endcase
end
assign main_basesoc_rx = builder_regs1;
assign builder_xilinxasyncresetsynchronizerimpl0 = ((~main_locked) | main_reset);
assign builder_xilinxasyncresetsynchronizerimpl1 = ((~main_locked) | main_reset);
assign builder_xilinxasyncresetsynchronizerimpl2 = ((~main_locked) | main_reset);
assign builder_xilinxasyncresetsynchronizerimpl3 = ((~main_locked) | main_reset);
assign builder_xilinxasyncresetsynchronizerimpl4 = ((~main_locked) | main_reset);
assign builder_xilinxasyncresetsynchronizerimpl5 = ((~main_locked) | main_reset);
always @(posedge clk200_clk) begin
	if ((main_reset_counter != 1'd0)) begin
		main_reset_counter <= (main_reset_counter - 1'd1);
	end else begin
		main_ic_reset <= 1'd0;
	end
	if (clk200_rst) begin
		main_reset_counter <= 4'd15;
		main_ic_reset <= 1'd1;
	end
end
always @(posedge sys_clk) begin
	if ((main_basesoc_soccontroller_bus_errors != 32'd4294967295)) begin
		if (main_basesoc_soccontroller_bus_error) begin
			main_basesoc_soccontroller_bus_errors <= (main_basesoc_soccontroller_bus_errors + 1'd1);
		end
	end
	main_basesoc_basesoc_ram_bus_ack <= 1'd0;
	if (((main_basesoc_basesoc_ram_bus_cyc & main_basesoc_basesoc_ram_bus_stb) & (~main_basesoc_basesoc_ram_bus_ack))) begin
		main_basesoc_basesoc_ram_bus_ack <= 1'd1;
	end
	main_basesoc_ram_bus_ram_bus_ack <= 1'd0;
	if (((main_basesoc_ram_bus_ram_bus_cyc & main_basesoc_ram_bus_ram_bus_stb) & (~main_basesoc_ram_bus_ram_bus_ack))) begin
		main_basesoc_ram_bus_ram_bus_ack <= 1'd1;
	end
	main_basesoc_sink_ready <= 1'd0;
	if (((main_basesoc_sink_valid & (~main_basesoc_tx_busy)) & (~main_basesoc_sink_ready))) begin
		main_basesoc_tx_reg <= main_basesoc_sink_payload_data;
		main_basesoc_tx_bitcount <= 1'd0;
		main_basesoc_tx_busy <= 1'd1;
		serial_tx <= 1'd0;
	end else begin
		if ((main_basesoc_uart_clk_txen & main_basesoc_tx_busy)) begin
			main_basesoc_tx_bitcount <= (main_basesoc_tx_bitcount + 1'd1);
			if ((main_basesoc_tx_bitcount == 4'd8)) begin
				serial_tx <= 1'd1;
			end else begin
				if ((main_basesoc_tx_bitcount == 4'd9)) begin
					serial_tx <= 1'd1;
					main_basesoc_tx_busy <= 1'd0;
					main_basesoc_sink_ready <= 1'd1;
				end else begin
					serial_tx <= main_basesoc_tx_reg[0];
					main_basesoc_tx_reg <= {1'd0, main_basesoc_tx_reg[7:1]};
				end
			end
		end
	end
	if (main_basesoc_tx_busy) begin
		{main_basesoc_uart_clk_txen, main_basesoc_phase_accumulator_tx} <= (main_basesoc_phase_accumulator_tx + main_basesoc_storage);
	end else begin
		{main_basesoc_uart_clk_txen, main_basesoc_phase_accumulator_tx} <= 1'd0;
	end
	main_basesoc_source_valid <= 1'd0;
	main_basesoc_rx_r <= main_basesoc_rx;
	if ((~main_basesoc_rx_busy)) begin
		if (((~main_basesoc_rx) & main_basesoc_rx_r)) begin
			main_basesoc_rx_busy <= 1'd1;
			main_basesoc_rx_bitcount <= 1'd0;
		end
	end else begin
		if (main_basesoc_uart_clk_rxen) begin
			main_basesoc_rx_bitcount <= (main_basesoc_rx_bitcount + 1'd1);
			if ((main_basesoc_rx_bitcount == 1'd0)) begin
				if (main_basesoc_rx) begin
					main_basesoc_rx_busy <= 1'd0;
				end
			end else begin
				if ((main_basesoc_rx_bitcount == 4'd9)) begin
					main_basesoc_rx_busy <= 1'd0;
					if (main_basesoc_rx) begin
						main_basesoc_source_payload_data <= main_basesoc_rx_reg;
						main_basesoc_source_valid <= 1'd1;
					end
				end else begin
					main_basesoc_rx_reg <= {main_basesoc_rx, main_basesoc_rx_reg[7:1]};
				end
			end
		end
	end
	if (main_basesoc_rx_busy) begin
		{main_basesoc_uart_clk_rxen, main_basesoc_phase_accumulator_rx} <= (main_basesoc_phase_accumulator_rx + main_basesoc_storage);
	end else begin
		{main_basesoc_uart_clk_rxen, main_basesoc_phase_accumulator_rx} <= 32'd2147483648;
	end
	if (main_basesoc_uart_tx_clear) begin
		main_basesoc_uart_tx_pending <= 1'd0;
	end
	main_basesoc_uart_tx_old_trigger <= main_basesoc_uart_tx_trigger;
	if (((~main_basesoc_uart_tx_trigger) & main_basesoc_uart_tx_old_trigger)) begin
		main_basesoc_uart_tx_pending <= 1'd1;
	end
	if (main_basesoc_uart_rx_clear) begin
		main_basesoc_uart_rx_pending <= 1'd0;
	end
	main_basesoc_uart_rx_old_trigger <= main_basesoc_uart_rx_trigger;
	if (((~main_basesoc_uart_rx_trigger) & main_basesoc_uart_rx_old_trigger)) begin
		main_basesoc_uart_rx_pending <= 1'd1;
	end
	if (main_basesoc_uart_tx_fifo_syncfifo_re) begin
		main_basesoc_uart_tx_fifo_readable <= 1'd1;
	end else begin
		if (main_basesoc_uart_tx_fifo_re) begin
			main_basesoc_uart_tx_fifo_readable <= 1'd0;
		end
	end
	if (((main_basesoc_uart_tx_fifo_syncfifo_we & main_basesoc_uart_tx_fifo_syncfifo_writable) & (~main_basesoc_uart_tx_fifo_replace))) begin
		main_basesoc_uart_tx_fifo_produce <= (main_basesoc_uart_tx_fifo_produce + 1'd1);
	end
	if (main_basesoc_uart_tx_fifo_do_read) begin
		main_basesoc_uart_tx_fifo_consume <= (main_basesoc_uart_tx_fifo_consume + 1'd1);
	end
	if (((main_basesoc_uart_tx_fifo_syncfifo_we & main_basesoc_uart_tx_fifo_syncfifo_writable) & (~main_basesoc_uart_tx_fifo_replace))) begin
		if ((~main_basesoc_uart_tx_fifo_do_read)) begin
			main_basesoc_uart_tx_fifo_level0 <= (main_basesoc_uart_tx_fifo_level0 + 1'd1);
		end
	end else begin
		if (main_basesoc_uart_tx_fifo_do_read) begin
			main_basesoc_uart_tx_fifo_level0 <= (main_basesoc_uart_tx_fifo_level0 - 1'd1);
		end
	end
	if (main_basesoc_uart_rx_fifo_syncfifo_re) begin
		main_basesoc_uart_rx_fifo_readable <= 1'd1;
	end else begin
		if (main_basesoc_uart_rx_fifo_re) begin
			main_basesoc_uart_rx_fifo_readable <= 1'd0;
		end
	end
	if (((main_basesoc_uart_rx_fifo_syncfifo_we & main_basesoc_uart_rx_fifo_syncfifo_writable) & (~main_basesoc_uart_rx_fifo_replace))) begin
		main_basesoc_uart_rx_fifo_produce <= (main_basesoc_uart_rx_fifo_produce + 1'd1);
	end
	if (main_basesoc_uart_rx_fifo_do_read) begin
		main_basesoc_uart_rx_fifo_consume <= (main_basesoc_uart_rx_fifo_consume + 1'd1);
	end
	if (((main_basesoc_uart_rx_fifo_syncfifo_we & main_basesoc_uart_rx_fifo_syncfifo_writable) & (~main_basesoc_uart_rx_fifo_replace))) begin
		if ((~main_basesoc_uart_rx_fifo_do_read)) begin
			main_basesoc_uart_rx_fifo_level0 <= (main_basesoc_uart_rx_fifo_level0 + 1'd1);
		end
	end else begin
		if (main_basesoc_uart_rx_fifo_do_read) begin
			main_basesoc_uart_rx_fifo_level0 <= (main_basesoc_uart_rx_fifo_level0 - 1'd1);
		end
	end
	if (main_basesoc_uart_reset) begin
		main_basesoc_uart_tx_pending <= 1'd0;
		main_basesoc_uart_tx_old_trigger <= 1'd0;
		main_basesoc_uart_rx_pending <= 1'd0;
		main_basesoc_uart_rx_old_trigger <= 1'd0;
		main_basesoc_uart_tx_fifo_readable <= 1'd0;
		main_basesoc_uart_tx_fifo_level0 <= 5'd0;
		main_basesoc_uart_tx_fifo_produce <= 4'd0;
		main_basesoc_uart_tx_fifo_consume <= 4'd0;
		main_basesoc_uart_rx_fifo_readable <= 1'd0;
		main_basesoc_uart_rx_fifo_level0 <= 5'd0;
		main_basesoc_uart_rx_fifo_produce <= 4'd0;
		main_basesoc_uart_rx_fifo_consume <= 4'd0;
	end
	if (main_basesoc_timer_en_storage) begin
		if ((main_basesoc_timer_value == 1'd0)) begin
			main_basesoc_timer_value <= main_basesoc_timer_reload_storage;
		end else begin
			main_basesoc_timer_value <= (main_basesoc_timer_value - 1'd1);
		end
	end else begin
		main_basesoc_timer_value <= main_basesoc_timer_load_storage;
	end
	if (main_basesoc_timer_update_value_re) begin
		main_basesoc_timer_value_status <= main_basesoc_timer_value;
	end
	if (main_basesoc_timer_zero_clear) begin
		main_basesoc_timer_zero_pending <= 1'd0;
	end
	main_basesoc_timer_zero_old_trigger <= main_basesoc_timer_zero_trigger;
	if (((~main_basesoc_timer_zero_trigger) & main_basesoc_timer_zero_old_trigger)) begin
		main_basesoc_timer_zero_pending <= 1'd1;
	end
	builder_state <= builder_next_state;
	main_a7ddrphy_dqs_oe_delayed <= ((main_a7ddrphy_dqspattern0 | main_a7ddrphy_dqs_oe) | main_a7ddrphy_dqspattern1);
	main_a7ddrphy_dq_oe_delayed <= ((main_a7ddrphy_dqspattern0 | main_a7ddrphy_dq_oe) | main_a7ddrphy_dqspattern1);
	main_a7ddrphy_rddata_en_last <= main_a7ddrphy_rddata_en;
	main_a7ddrphy_dfi_p0_rddata_valid <= (main_a7ddrphy_rddata_en[6] | main_a7ddrphy_wlevel_en_storage);
	main_a7ddrphy_dfi_p1_rddata_valid <= (main_a7ddrphy_rddata_en[6] | main_a7ddrphy_wlevel_en_storage);
	main_a7ddrphy_dfi_p2_rddata_valid <= (main_a7ddrphy_rddata_en[6] | main_a7ddrphy_wlevel_en_storage);
	main_a7ddrphy_dfi_p3_rddata_valid <= (main_a7ddrphy_rddata_en[6] | main_a7ddrphy_wlevel_en_storage);
	main_a7ddrphy_wrdata_en_last <= main_a7ddrphy_wrdata_en;
	main_a7ddrphy_dqspattern_o1 <= main_a7ddrphy_dqspattern_o0;
	if ((main_a7ddrphy_dly_sel_storage[0] & main_a7ddrphy_rdly_dq_bitslip_re)) begin
		main_a7ddrphy_bitslip0_value <= (main_a7ddrphy_bitslip0_value + 1'd1);
	end
	if ((main_a7ddrphy_dly_sel_storage[0] & main_a7ddrphy_rdly_dq_bitslip_rst_re)) begin
		main_a7ddrphy_bitslip0_value <= 1'd0;
	end
	main_a7ddrphy_bitslip0_r <= {main_a7ddrphy_bitslip0_i, main_a7ddrphy_bitslip0_r[15:8]};
	if ((main_a7ddrphy_dly_sel_storage[0] & main_a7ddrphy_rdly_dq_bitslip_re)) begin
		main_a7ddrphy_bitslip1_value <= (main_a7ddrphy_bitslip1_value + 1'd1);
	end
	if ((main_a7ddrphy_dly_sel_storage[0] & main_a7ddrphy_rdly_dq_bitslip_rst_re)) begin
		main_a7ddrphy_bitslip1_value <= 1'd0;
	end
	main_a7ddrphy_bitslip1_r <= {main_a7ddrphy_bitslip1_i, main_a7ddrphy_bitslip1_r[15:8]};
	if ((main_a7ddrphy_dly_sel_storage[0] & main_a7ddrphy_rdly_dq_bitslip_re)) begin
		main_a7ddrphy_bitslip2_value <= (main_a7ddrphy_bitslip2_value + 1'd1);
	end
	if ((main_a7ddrphy_dly_sel_storage[0] & main_a7ddrphy_rdly_dq_bitslip_rst_re)) begin
		main_a7ddrphy_bitslip2_value <= 1'd0;
	end
	main_a7ddrphy_bitslip2_r <= {main_a7ddrphy_bitslip2_i, main_a7ddrphy_bitslip2_r[15:8]};
	if ((main_a7ddrphy_dly_sel_storage[0] & main_a7ddrphy_rdly_dq_bitslip_re)) begin
		main_a7ddrphy_bitslip3_value <= (main_a7ddrphy_bitslip3_value + 1'd1);
	end
	if ((main_a7ddrphy_dly_sel_storage[0] & main_a7ddrphy_rdly_dq_bitslip_rst_re)) begin
		main_a7ddrphy_bitslip3_value <= 1'd0;
	end
	main_a7ddrphy_bitslip3_r <= {main_a7ddrphy_bitslip3_i, main_a7ddrphy_bitslip3_r[15:8]};
	if ((main_a7ddrphy_dly_sel_storage[0] & main_a7ddrphy_rdly_dq_bitslip_re)) begin
		main_a7ddrphy_bitslip4_value <= (main_a7ddrphy_bitslip4_value + 1'd1);
	end
	if ((main_a7ddrphy_dly_sel_storage[0] & main_a7ddrphy_rdly_dq_bitslip_rst_re)) begin
		main_a7ddrphy_bitslip4_value <= 1'd0;
	end
	main_a7ddrphy_bitslip4_r <= {main_a7ddrphy_bitslip4_i, main_a7ddrphy_bitslip4_r[15:8]};
	if ((main_a7ddrphy_dly_sel_storage[0] & main_a7ddrphy_rdly_dq_bitslip_re)) begin
		main_a7ddrphy_bitslip5_value <= (main_a7ddrphy_bitslip5_value + 1'd1);
	end
	if ((main_a7ddrphy_dly_sel_storage[0] & main_a7ddrphy_rdly_dq_bitslip_rst_re)) begin
		main_a7ddrphy_bitslip5_value <= 1'd0;
	end
	main_a7ddrphy_bitslip5_r <= {main_a7ddrphy_bitslip5_i, main_a7ddrphy_bitslip5_r[15:8]};
	if ((main_a7ddrphy_dly_sel_storage[0] & main_a7ddrphy_rdly_dq_bitslip_re)) begin
		main_a7ddrphy_bitslip6_value <= (main_a7ddrphy_bitslip6_value + 1'd1);
	end
	if ((main_a7ddrphy_dly_sel_storage[0] & main_a7ddrphy_rdly_dq_bitslip_rst_re)) begin
		main_a7ddrphy_bitslip6_value <= 1'd0;
	end
	main_a7ddrphy_bitslip6_r <= {main_a7ddrphy_bitslip6_i, main_a7ddrphy_bitslip6_r[15:8]};
	if ((main_a7ddrphy_dly_sel_storage[0] & main_a7ddrphy_rdly_dq_bitslip_re)) begin
		main_a7ddrphy_bitslip7_value <= (main_a7ddrphy_bitslip7_value + 1'd1);
	end
	if ((main_a7ddrphy_dly_sel_storage[0] & main_a7ddrphy_rdly_dq_bitslip_rst_re)) begin
		main_a7ddrphy_bitslip7_value <= 1'd0;
	end
	main_a7ddrphy_bitslip7_r <= {main_a7ddrphy_bitslip7_i, main_a7ddrphy_bitslip7_r[15:8]};
	if ((main_a7ddrphy_dly_sel_storage[1] & main_a7ddrphy_rdly_dq_bitslip_re)) begin
		main_a7ddrphy_bitslip8_value <= (main_a7ddrphy_bitslip8_value + 1'd1);
	end
	if ((main_a7ddrphy_dly_sel_storage[1] & main_a7ddrphy_rdly_dq_bitslip_rst_re)) begin
		main_a7ddrphy_bitslip8_value <= 1'd0;
	end
	main_a7ddrphy_bitslip8_r <= {main_a7ddrphy_bitslip8_i, main_a7ddrphy_bitslip8_r[15:8]};
	if ((main_a7ddrphy_dly_sel_storage[1] & main_a7ddrphy_rdly_dq_bitslip_re)) begin
		main_a7ddrphy_bitslip9_value <= (main_a7ddrphy_bitslip9_value + 1'd1);
	end
	if ((main_a7ddrphy_dly_sel_storage[1] & main_a7ddrphy_rdly_dq_bitslip_rst_re)) begin
		main_a7ddrphy_bitslip9_value <= 1'd0;
	end
	main_a7ddrphy_bitslip9_r <= {main_a7ddrphy_bitslip9_i, main_a7ddrphy_bitslip9_r[15:8]};
	if ((main_a7ddrphy_dly_sel_storage[1] & main_a7ddrphy_rdly_dq_bitslip_re)) begin
		main_a7ddrphy_bitslip10_value <= (main_a7ddrphy_bitslip10_value + 1'd1);
	end
	if ((main_a7ddrphy_dly_sel_storage[1] & main_a7ddrphy_rdly_dq_bitslip_rst_re)) begin
		main_a7ddrphy_bitslip10_value <= 1'd0;
	end
	main_a7ddrphy_bitslip10_r <= {main_a7ddrphy_bitslip10_i, main_a7ddrphy_bitslip10_r[15:8]};
	if ((main_a7ddrphy_dly_sel_storage[1] & main_a7ddrphy_rdly_dq_bitslip_re)) begin
		main_a7ddrphy_bitslip11_value <= (main_a7ddrphy_bitslip11_value + 1'd1);
	end
	if ((main_a7ddrphy_dly_sel_storage[1] & main_a7ddrphy_rdly_dq_bitslip_rst_re)) begin
		main_a7ddrphy_bitslip11_value <= 1'd0;
	end
	main_a7ddrphy_bitslip11_r <= {main_a7ddrphy_bitslip11_i, main_a7ddrphy_bitslip11_r[15:8]};
	if ((main_a7ddrphy_dly_sel_storage[1] & main_a7ddrphy_rdly_dq_bitslip_re)) begin
		main_a7ddrphy_bitslip12_value <= (main_a7ddrphy_bitslip12_value + 1'd1);
	end
	if ((main_a7ddrphy_dly_sel_storage[1] & main_a7ddrphy_rdly_dq_bitslip_rst_re)) begin
		main_a7ddrphy_bitslip12_value <= 1'd0;
	end
	main_a7ddrphy_bitslip12_r <= {main_a7ddrphy_bitslip12_i, main_a7ddrphy_bitslip12_r[15:8]};
	if ((main_a7ddrphy_dly_sel_storage[1] & main_a7ddrphy_rdly_dq_bitslip_re)) begin
		main_a7ddrphy_bitslip13_value <= (main_a7ddrphy_bitslip13_value + 1'd1);
	end
	if ((main_a7ddrphy_dly_sel_storage[1] & main_a7ddrphy_rdly_dq_bitslip_rst_re)) begin
		main_a7ddrphy_bitslip13_value <= 1'd0;
	end
	main_a7ddrphy_bitslip13_r <= {main_a7ddrphy_bitslip13_i, main_a7ddrphy_bitslip13_r[15:8]};
	if ((main_a7ddrphy_dly_sel_storage[1] & main_a7ddrphy_rdly_dq_bitslip_re)) begin
		main_a7ddrphy_bitslip14_value <= (main_a7ddrphy_bitslip14_value + 1'd1);
	end
	if ((main_a7ddrphy_dly_sel_storage[1] & main_a7ddrphy_rdly_dq_bitslip_rst_re)) begin
		main_a7ddrphy_bitslip14_value <= 1'd0;
	end
	main_a7ddrphy_bitslip14_r <= {main_a7ddrphy_bitslip14_i, main_a7ddrphy_bitslip14_r[15:8]};
	if ((main_a7ddrphy_dly_sel_storage[1] & main_a7ddrphy_rdly_dq_bitslip_re)) begin
		main_a7ddrphy_bitslip15_value <= (main_a7ddrphy_bitslip15_value + 1'd1);
	end
	if ((main_a7ddrphy_dly_sel_storage[1] & main_a7ddrphy_rdly_dq_bitslip_rst_re)) begin
		main_a7ddrphy_bitslip15_value <= 1'd0;
	end
	main_a7ddrphy_bitslip15_r <= {main_a7ddrphy_bitslip15_i, main_a7ddrphy_bitslip15_r[15:8]};
	if (main_sdram_inti_p0_rddata_valid) begin
		main_sdram_phaseinjector0_status <= main_sdram_inti_p0_rddata;
	end
	if (main_sdram_inti_p1_rddata_valid) begin
		main_sdram_phaseinjector1_status <= main_sdram_inti_p1_rddata;
	end
	if (main_sdram_inti_p2_rddata_valid) begin
		main_sdram_phaseinjector2_status <= main_sdram_inti_p2_rddata;
	end
	if (main_sdram_inti_p3_rddata_valid) begin
		main_sdram_phaseinjector3_status <= main_sdram_inti_p3_rddata;
	end
	if ((main_sdram_timer_wait & (~main_sdram_timer_done0))) begin
		main_sdram_timer_count1 <= (main_sdram_timer_count1 - 1'd1);
	end else begin
		main_sdram_timer_count1 <= 10'd781;
	end
	main_sdram_postponer_req_o <= 1'd0;
	if (main_sdram_postponer_req_i) begin
		main_sdram_postponer_count <= (main_sdram_postponer_count - 1'd1);
		if ((main_sdram_postponer_count == 1'd0)) begin
			main_sdram_postponer_count <= 1'd0;
			main_sdram_postponer_req_o <= 1'd1;
		end
	end
	if (main_sdram_sequencer_start0) begin
		main_sdram_sequencer_count <= 1'd0;
	end else begin
		if (main_sdram_sequencer_done1) begin
			if ((main_sdram_sequencer_count != 1'd0)) begin
				main_sdram_sequencer_count <= (main_sdram_sequencer_count - 1'd1);
			end
		end
	end
	main_sdram_cmd_payload_a <= 1'd0;
	main_sdram_cmd_payload_ba <= 1'd0;
	main_sdram_cmd_payload_cas <= 1'd0;
	main_sdram_cmd_payload_ras <= 1'd0;
	main_sdram_cmd_payload_we <= 1'd0;
	main_sdram_sequencer_done1 <= 1'd0;
	if ((main_sdram_sequencer_start1 & (main_sdram_sequencer_counter == 1'd0))) begin
		main_sdram_cmd_payload_a <= 11'd1024;
		main_sdram_cmd_payload_ba <= 1'd0;
		main_sdram_cmd_payload_cas <= 1'd0;
		main_sdram_cmd_payload_ras <= 1'd1;
		main_sdram_cmd_payload_we <= 1'd1;
	end
	if ((main_sdram_sequencer_counter == 2'd3)) begin
		main_sdram_cmd_payload_a <= 1'd0;
		main_sdram_cmd_payload_ba <= 1'd0;
		main_sdram_cmd_payload_cas <= 1'd1;
		main_sdram_cmd_payload_ras <= 1'd1;
		main_sdram_cmd_payload_we <= 1'd0;
	end
	if ((main_sdram_sequencer_counter == 6'd35)) begin
		main_sdram_cmd_payload_a <= 1'd0;
		main_sdram_cmd_payload_ba <= 1'd0;
		main_sdram_cmd_payload_cas <= 1'd0;
		main_sdram_cmd_payload_ras <= 1'd0;
		main_sdram_cmd_payload_we <= 1'd0;
		main_sdram_sequencer_done1 <= 1'd1;
	end
	if ((main_sdram_sequencer_counter == 6'd35)) begin
		main_sdram_sequencer_counter <= 1'd0;
	end else begin
		if ((main_sdram_sequencer_counter != 1'd0)) begin
			main_sdram_sequencer_counter <= (main_sdram_sequencer_counter + 1'd1);
		end else begin
			if (main_sdram_sequencer_start1) begin
				main_sdram_sequencer_counter <= 1'd1;
			end
		end
	end
	if ((main_sdram_zqcs_timer_wait & (~main_sdram_zqcs_timer_done0))) begin
		main_sdram_zqcs_timer_count1 <= (main_sdram_zqcs_timer_count1 - 1'd1);
	end else begin
		main_sdram_zqcs_timer_count1 <= 27'd99999999;
	end
	main_sdram_zqcs_executer_done <= 1'd0;
	if ((main_sdram_zqcs_executer_start & (main_sdram_zqcs_executer_counter == 1'd0))) begin
		main_sdram_cmd_payload_a <= 11'd1024;
		main_sdram_cmd_payload_ba <= 1'd0;
		main_sdram_cmd_payload_cas <= 1'd0;
		main_sdram_cmd_payload_ras <= 1'd1;
		main_sdram_cmd_payload_we <= 1'd1;
	end
	if ((main_sdram_zqcs_executer_counter == 2'd3)) begin
		main_sdram_cmd_payload_a <= 1'd0;
		main_sdram_cmd_payload_ba <= 1'd0;
		main_sdram_cmd_payload_cas <= 1'd0;
		main_sdram_cmd_payload_ras <= 1'd0;
		main_sdram_cmd_payload_we <= 1'd1;
	end
	if ((main_sdram_zqcs_executer_counter == 5'd19)) begin
		main_sdram_cmd_payload_a <= 1'd0;
		main_sdram_cmd_payload_ba <= 1'd0;
		main_sdram_cmd_payload_cas <= 1'd0;
		main_sdram_cmd_payload_ras <= 1'd0;
		main_sdram_cmd_payload_we <= 1'd0;
		main_sdram_zqcs_executer_done <= 1'd1;
	end
	if ((main_sdram_zqcs_executer_counter == 5'd19)) begin
		main_sdram_zqcs_executer_counter <= 1'd0;
	end else begin
		if ((main_sdram_zqcs_executer_counter != 1'd0)) begin
			main_sdram_zqcs_executer_counter <= (main_sdram_zqcs_executer_counter + 1'd1);
		end else begin
			if (main_sdram_zqcs_executer_start) begin
				main_sdram_zqcs_executer_counter <= 1'd1;
			end
		end
	end
	builder_refresher_state <= builder_refresher_next_state;
	if (main_sdram_bankmachine0_row_close) begin
		main_sdram_bankmachine0_row_opened <= 1'd0;
	end else begin
		if (main_sdram_bankmachine0_row_open) begin
			main_sdram_bankmachine0_row_opened <= 1'd1;
			main_sdram_bankmachine0_row <= main_sdram_bankmachine0_cmd_buffer_source_payload_addr[20:7];
		end
	end
	if (((main_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_we & main_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_writable) & (~main_sdram_bankmachine0_cmd_buffer_lookahead_replace))) begin
		main_sdram_bankmachine0_cmd_buffer_lookahead_produce <= (main_sdram_bankmachine0_cmd_buffer_lookahead_produce + 1'd1);
	end
	if (main_sdram_bankmachine0_cmd_buffer_lookahead_do_read) begin
		main_sdram_bankmachine0_cmd_buffer_lookahead_consume <= (main_sdram_bankmachine0_cmd_buffer_lookahead_consume + 1'd1);
	end
	if (((main_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_we & main_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_writable) & (~main_sdram_bankmachine0_cmd_buffer_lookahead_replace))) begin
		if ((~main_sdram_bankmachine0_cmd_buffer_lookahead_do_read)) begin
			main_sdram_bankmachine0_cmd_buffer_lookahead_level <= (main_sdram_bankmachine0_cmd_buffer_lookahead_level + 1'd1);
		end
	end else begin
		if (main_sdram_bankmachine0_cmd_buffer_lookahead_do_read) begin
			main_sdram_bankmachine0_cmd_buffer_lookahead_level <= (main_sdram_bankmachine0_cmd_buffer_lookahead_level - 1'd1);
		end
	end
	if (((~main_sdram_bankmachine0_cmd_buffer_source_valid) | main_sdram_bankmachine0_cmd_buffer_source_ready)) begin
		main_sdram_bankmachine0_cmd_buffer_source_valid <= main_sdram_bankmachine0_cmd_buffer_sink_valid;
		main_sdram_bankmachine0_cmd_buffer_source_first <= main_sdram_bankmachine0_cmd_buffer_sink_first;
		main_sdram_bankmachine0_cmd_buffer_source_last <= main_sdram_bankmachine0_cmd_buffer_sink_last;
		main_sdram_bankmachine0_cmd_buffer_source_payload_we <= main_sdram_bankmachine0_cmd_buffer_sink_payload_we;
		main_sdram_bankmachine0_cmd_buffer_source_payload_addr <= main_sdram_bankmachine0_cmd_buffer_sink_payload_addr;
	end
	if (main_sdram_bankmachine0_twtpcon_valid) begin
		main_sdram_bankmachine0_twtpcon_count <= 3'd5;
		if (1'd0) begin
			main_sdram_bankmachine0_twtpcon_ready <= 1'd1;
		end else begin
			main_sdram_bankmachine0_twtpcon_ready <= 1'd0;
		end
	end else begin
		if ((~main_sdram_bankmachine0_twtpcon_ready)) begin
			main_sdram_bankmachine0_twtpcon_count <= (main_sdram_bankmachine0_twtpcon_count - 1'd1);
			if ((main_sdram_bankmachine0_twtpcon_count == 1'd1)) begin
				main_sdram_bankmachine0_twtpcon_ready <= 1'd1;
			end
		end
	end
	if (main_sdram_bankmachine0_trccon_valid) begin
		main_sdram_bankmachine0_trccon_count <= 3'd5;
		if (1'd0) begin
			main_sdram_bankmachine0_trccon_ready <= 1'd1;
		end else begin
			main_sdram_bankmachine0_trccon_ready <= 1'd0;
		end
	end else begin
		if ((~main_sdram_bankmachine0_trccon_ready)) begin
			main_sdram_bankmachine0_trccon_count <= (main_sdram_bankmachine0_trccon_count - 1'd1);
			if ((main_sdram_bankmachine0_trccon_count == 1'd1)) begin
				main_sdram_bankmachine0_trccon_ready <= 1'd1;
			end
		end
	end
	if (main_sdram_bankmachine0_trascon_valid) begin
		main_sdram_bankmachine0_trascon_count <= 3'd4;
		if (1'd0) begin
			main_sdram_bankmachine0_trascon_ready <= 1'd1;
		end else begin
			main_sdram_bankmachine0_trascon_ready <= 1'd0;
		end
	end else begin
		if ((~main_sdram_bankmachine0_trascon_ready)) begin
			main_sdram_bankmachine0_trascon_count <= (main_sdram_bankmachine0_trascon_count - 1'd1);
			if ((main_sdram_bankmachine0_trascon_count == 1'd1)) begin
				main_sdram_bankmachine0_trascon_ready <= 1'd1;
			end
		end
	end
	builder_bankmachine0_state <= builder_bankmachine0_next_state;
	if (main_sdram_bankmachine1_row_close) begin
		main_sdram_bankmachine1_row_opened <= 1'd0;
	end else begin
		if (main_sdram_bankmachine1_row_open) begin
			main_sdram_bankmachine1_row_opened <= 1'd1;
			main_sdram_bankmachine1_row <= main_sdram_bankmachine1_cmd_buffer_source_payload_addr[20:7];
		end
	end
	if (((main_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_we & main_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_writable) & (~main_sdram_bankmachine1_cmd_buffer_lookahead_replace))) begin
		main_sdram_bankmachine1_cmd_buffer_lookahead_produce <= (main_sdram_bankmachine1_cmd_buffer_lookahead_produce + 1'd1);
	end
	if (main_sdram_bankmachine1_cmd_buffer_lookahead_do_read) begin
		main_sdram_bankmachine1_cmd_buffer_lookahead_consume <= (main_sdram_bankmachine1_cmd_buffer_lookahead_consume + 1'd1);
	end
	if (((main_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_we & main_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_writable) & (~main_sdram_bankmachine1_cmd_buffer_lookahead_replace))) begin
		if ((~main_sdram_bankmachine1_cmd_buffer_lookahead_do_read)) begin
			main_sdram_bankmachine1_cmd_buffer_lookahead_level <= (main_sdram_bankmachine1_cmd_buffer_lookahead_level + 1'd1);
		end
	end else begin
		if (main_sdram_bankmachine1_cmd_buffer_lookahead_do_read) begin
			main_sdram_bankmachine1_cmd_buffer_lookahead_level <= (main_sdram_bankmachine1_cmd_buffer_lookahead_level - 1'd1);
		end
	end
	if (((~main_sdram_bankmachine1_cmd_buffer_source_valid) | main_sdram_bankmachine1_cmd_buffer_source_ready)) begin
		main_sdram_bankmachine1_cmd_buffer_source_valid <= main_sdram_bankmachine1_cmd_buffer_sink_valid;
		main_sdram_bankmachine1_cmd_buffer_source_first <= main_sdram_bankmachine1_cmd_buffer_sink_first;
		main_sdram_bankmachine1_cmd_buffer_source_last <= main_sdram_bankmachine1_cmd_buffer_sink_last;
		main_sdram_bankmachine1_cmd_buffer_source_payload_we <= main_sdram_bankmachine1_cmd_buffer_sink_payload_we;
		main_sdram_bankmachine1_cmd_buffer_source_payload_addr <= main_sdram_bankmachine1_cmd_buffer_sink_payload_addr;
	end
	if (main_sdram_bankmachine1_twtpcon_valid) begin
		main_sdram_bankmachine1_twtpcon_count <= 3'd5;
		if (1'd0) begin
			main_sdram_bankmachine1_twtpcon_ready <= 1'd1;
		end else begin
			main_sdram_bankmachine1_twtpcon_ready <= 1'd0;
		end
	end else begin
		if ((~main_sdram_bankmachine1_twtpcon_ready)) begin
			main_sdram_bankmachine1_twtpcon_count <= (main_sdram_bankmachine1_twtpcon_count - 1'd1);
			if ((main_sdram_bankmachine1_twtpcon_count == 1'd1)) begin
				main_sdram_bankmachine1_twtpcon_ready <= 1'd1;
			end
		end
	end
	if (main_sdram_bankmachine1_trccon_valid) begin
		main_sdram_bankmachine1_trccon_count <= 3'd5;
		if (1'd0) begin
			main_sdram_bankmachine1_trccon_ready <= 1'd1;
		end else begin
			main_sdram_bankmachine1_trccon_ready <= 1'd0;
		end
	end else begin
		if ((~main_sdram_bankmachine1_trccon_ready)) begin
			main_sdram_bankmachine1_trccon_count <= (main_sdram_bankmachine1_trccon_count - 1'd1);
			if ((main_sdram_bankmachine1_trccon_count == 1'd1)) begin
				main_sdram_bankmachine1_trccon_ready <= 1'd1;
			end
		end
	end
	if (main_sdram_bankmachine1_trascon_valid) begin
		main_sdram_bankmachine1_trascon_count <= 3'd4;
		if (1'd0) begin
			main_sdram_bankmachine1_trascon_ready <= 1'd1;
		end else begin
			main_sdram_bankmachine1_trascon_ready <= 1'd0;
		end
	end else begin
		if ((~main_sdram_bankmachine1_trascon_ready)) begin
			main_sdram_bankmachine1_trascon_count <= (main_sdram_bankmachine1_trascon_count - 1'd1);
			if ((main_sdram_bankmachine1_trascon_count == 1'd1)) begin
				main_sdram_bankmachine1_trascon_ready <= 1'd1;
			end
		end
	end
	builder_bankmachine1_state <= builder_bankmachine1_next_state;
	if (main_sdram_bankmachine2_row_close) begin
		main_sdram_bankmachine2_row_opened <= 1'd0;
	end else begin
		if (main_sdram_bankmachine2_row_open) begin
			main_sdram_bankmachine2_row_opened <= 1'd1;
			main_sdram_bankmachine2_row <= main_sdram_bankmachine2_cmd_buffer_source_payload_addr[20:7];
		end
	end
	if (((main_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_we & main_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_writable) & (~main_sdram_bankmachine2_cmd_buffer_lookahead_replace))) begin
		main_sdram_bankmachine2_cmd_buffer_lookahead_produce <= (main_sdram_bankmachine2_cmd_buffer_lookahead_produce + 1'd1);
	end
	if (main_sdram_bankmachine2_cmd_buffer_lookahead_do_read) begin
		main_sdram_bankmachine2_cmd_buffer_lookahead_consume <= (main_sdram_bankmachine2_cmd_buffer_lookahead_consume + 1'd1);
	end
	if (((main_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_we & main_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_writable) & (~main_sdram_bankmachine2_cmd_buffer_lookahead_replace))) begin
		if ((~main_sdram_bankmachine2_cmd_buffer_lookahead_do_read)) begin
			main_sdram_bankmachine2_cmd_buffer_lookahead_level <= (main_sdram_bankmachine2_cmd_buffer_lookahead_level + 1'd1);
		end
	end else begin
		if (main_sdram_bankmachine2_cmd_buffer_lookahead_do_read) begin
			main_sdram_bankmachine2_cmd_buffer_lookahead_level <= (main_sdram_bankmachine2_cmd_buffer_lookahead_level - 1'd1);
		end
	end
	if (((~main_sdram_bankmachine2_cmd_buffer_source_valid) | main_sdram_bankmachine2_cmd_buffer_source_ready)) begin
		main_sdram_bankmachine2_cmd_buffer_source_valid <= main_sdram_bankmachine2_cmd_buffer_sink_valid;
		main_sdram_bankmachine2_cmd_buffer_source_first <= main_sdram_bankmachine2_cmd_buffer_sink_first;
		main_sdram_bankmachine2_cmd_buffer_source_last <= main_sdram_bankmachine2_cmd_buffer_sink_last;
		main_sdram_bankmachine2_cmd_buffer_source_payload_we <= main_sdram_bankmachine2_cmd_buffer_sink_payload_we;
		main_sdram_bankmachine2_cmd_buffer_source_payload_addr <= main_sdram_bankmachine2_cmd_buffer_sink_payload_addr;
	end
	if (main_sdram_bankmachine2_twtpcon_valid) begin
		main_sdram_bankmachine2_twtpcon_count <= 3'd5;
		if (1'd0) begin
			main_sdram_bankmachine2_twtpcon_ready <= 1'd1;
		end else begin
			main_sdram_bankmachine2_twtpcon_ready <= 1'd0;
		end
	end else begin
		if ((~main_sdram_bankmachine2_twtpcon_ready)) begin
			main_sdram_bankmachine2_twtpcon_count <= (main_sdram_bankmachine2_twtpcon_count - 1'd1);
			if ((main_sdram_bankmachine2_twtpcon_count == 1'd1)) begin
				main_sdram_bankmachine2_twtpcon_ready <= 1'd1;
			end
		end
	end
	if (main_sdram_bankmachine2_trccon_valid) begin
		main_sdram_bankmachine2_trccon_count <= 3'd5;
		if (1'd0) begin
			main_sdram_bankmachine2_trccon_ready <= 1'd1;
		end else begin
			main_sdram_bankmachine2_trccon_ready <= 1'd0;
		end
	end else begin
		if ((~main_sdram_bankmachine2_trccon_ready)) begin
			main_sdram_bankmachine2_trccon_count <= (main_sdram_bankmachine2_trccon_count - 1'd1);
			if ((main_sdram_bankmachine2_trccon_count == 1'd1)) begin
				main_sdram_bankmachine2_trccon_ready <= 1'd1;
			end
		end
	end
	if (main_sdram_bankmachine2_trascon_valid) begin
		main_sdram_bankmachine2_trascon_count <= 3'd4;
		if (1'd0) begin
			main_sdram_bankmachine2_trascon_ready <= 1'd1;
		end else begin
			main_sdram_bankmachine2_trascon_ready <= 1'd0;
		end
	end else begin
		if ((~main_sdram_bankmachine2_trascon_ready)) begin
			main_sdram_bankmachine2_trascon_count <= (main_sdram_bankmachine2_trascon_count - 1'd1);
			if ((main_sdram_bankmachine2_trascon_count == 1'd1)) begin
				main_sdram_bankmachine2_trascon_ready <= 1'd1;
			end
		end
	end
	builder_bankmachine2_state <= builder_bankmachine2_next_state;
	if (main_sdram_bankmachine3_row_close) begin
		main_sdram_bankmachine3_row_opened <= 1'd0;
	end else begin
		if (main_sdram_bankmachine3_row_open) begin
			main_sdram_bankmachine3_row_opened <= 1'd1;
			main_sdram_bankmachine3_row <= main_sdram_bankmachine3_cmd_buffer_source_payload_addr[20:7];
		end
	end
	if (((main_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_we & main_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_writable) & (~main_sdram_bankmachine3_cmd_buffer_lookahead_replace))) begin
		main_sdram_bankmachine3_cmd_buffer_lookahead_produce <= (main_sdram_bankmachine3_cmd_buffer_lookahead_produce + 1'd1);
	end
	if (main_sdram_bankmachine3_cmd_buffer_lookahead_do_read) begin
		main_sdram_bankmachine3_cmd_buffer_lookahead_consume <= (main_sdram_bankmachine3_cmd_buffer_lookahead_consume + 1'd1);
	end
	if (((main_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_we & main_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_writable) & (~main_sdram_bankmachine3_cmd_buffer_lookahead_replace))) begin
		if ((~main_sdram_bankmachine3_cmd_buffer_lookahead_do_read)) begin
			main_sdram_bankmachine3_cmd_buffer_lookahead_level <= (main_sdram_bankmachine3_cmd_buffer_lookahead_level + 1'd1);
		end
	end else begin
		if (main_sdram_bankmachine3_cmd_buffer_lookahead_do_read) begin
			main_sdram_bankmachine3_cmd_buffer_lookahead_level <= (main_sdram_bankmachine3_cmd_buffer_lookahead_level - 1'd1);
		end
	end
	if (((~main_sdram_bankmachine3_cmd_buffer_source_valid) | main_sdram_bankmachine3_cmd_buffer_source_ready)) begin
		main_sdram_bankmachine3_cmd_buffer_source_valid <= main_sdram_bankmachine3_cmd_buffer_sink_valid;
		main_sdram_bankmachine3_cmd_buffer_source_first <= main_sdram_bankmachine3_cmd_buffer_sink_first;
		main_sdram_bankmachine3_cmd_buffer_source_last <= main_sdram_bankmachine3_cmd_buffer_sink_last;
		main_sdram_bankmachine3_cmd_buffer_source_payload_we <= main_sdram_bankmachine3_cmd_buffer_sink_payload_we;
		main_sdram_bankmachine3_cmd_buffer_source_payload_addr <= main_sdram_bankmachine3_cmd_buffer_sink_payload_addr;
	end
	if (main_sdram_bankmachine3_twtpcon_valid) begin
		main_sdram_bankmachine3_twtpcon_count <= 3'd5;
		if (1'd0) begin
			main_sdram_bankmachine3_twtpcon_ready <= 1'd1;
		end else begin
			main_sdram_bankmachine3_twtpcon_ready <= 1'd0;
		end
	end else begin
		if ((~main_sdram_bankmachine3_twtpcon_ready)) begin
			main_sdram_bankmachine3_twtpcon_count <= (main_sdram_bankmachine3_twtpcon_count - 1'd1);
			if ((main_sdram_bankmachine3_twtpcon_count == 1'd1)) begin
				main_sdram_bankmachine3_twtpcon_ready <= 1'd1;
			end
		end
	end
	if (main_sdram_bankmachine3_trccon_valid) begin
		main_sdram_bankmachine3_trccon_count <= 3'd5;
		if (1'd0) begin
			main_sdram_bankmachine3_trccon_ready <= 1'd1;
		end else begin
			main_sdram_bankmachine3_trccon_ready <= 1'd0;
		end
	end else begin
		if ((~main_sdram_bankmachine3_trccon_ready)) begin
			main_sdram_bankmachine3_trccon_count <= (main_sdram_bankmachine3_trccon_count - 1'd1);
			if ((main_sdram_bankmachine3_trccon_count == 1'd1)) begin
				main_sdram_bankmachine3_trccon_ready <= 1'd1;
			end
		end
	end
	if (main_sdram_bankmachine3_trascon_valid) begin
		main_sdram_bankmachine3_trascon_count <= 3'd4;
		if (1'd0) begin
			main_sdram_bankmachine3_trascon_ready <= 1'd1;
		end else begin
			main_sdram_bankmachine3_trascon_ready <= 1'd0;
		end
	end else begin
		if ((~main_sdram_bankmachine3_trascon_ready)) begin
			main_sdram_bankmachine3_trascon_count <= (main_sdram_bankmachine3_trascon_count - 1'd1);
			if ((main_sdram_bankmachine3_trascon_count == 1'd1)) begin
				main_sdram_bankmachine3_trascon_ready <= 1'd1;
			end
		end
	end
	builder_bankmachine3_state <= builder_bankmachine3_next_state;
	if (main_sdram_bankmachine4_row_close) begin
		main_sdram_bankmachine4_row_opened <= 1'd0;
	end else begin
		if (main_sdram_bankmachine4_row_open) begin
			main_sdram_bankmachine4_row_opened <= 1'd1;
			main_sdram_bankmachine4_row <= main_sdram_bankmachine4_cmd_buffer_source_payload_addr[20:7];
		end
	end
	if (((main_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_we & main_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_writable) & (~main_sdram_bankmachine4_cmd_buffer_lookahead_replace))) begin
		main_sdram_bankmachine4_cmd_buffer_lookahead_produce <= (main_sdram_bankmachine4_cmd_buffer_lookahead_produce + 1'd1);
	end
	if (main_sdram_bankmachine4_cmd_buffer_lookahead_do_read) begin
		main_sdram_bankmachine4_cmd_buffer_lookahead_consume <= (main_sdram_bankmachine4_cmd_buffer_lookahead_consume + 1'd1);
	end
	if (((main_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_we & main_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_writable) & (~main_sdram_bankmachine4_cmd_buffer_lookahead_replace))) begin
		if ((~main_sdram_bankmachine4_cmd_buffer_lookahead_do_read)) begin
			main_sdram_bankmachine4_cmd_buffer_lookahead_level <= (main_sdram_bankmachine4_cmd_buffer_lookahead_level + 1'd1);
		end
	end else begin
		if (main_sdram_bankmachine4_cmd_buffer_lookahead_do_read) begin
			main_sdram_bankmachine4_cmd_buffer_lookahead_level <= (main_sdram_bankmachine4_cmd_buffer_lookahead_level - 1'd1);
		end
	end
	if (((~main_sdram_bankmachine4_cmd_buffer_source_valid) | main_sdram_bankmachine4_cmd_buffer_source_ready)) begin
		main_sdram_bankmachine4_cmd_buffer_source_valid <= main_sdram_bankmachine4_cmd_buffer_sink_valid;
		main_sdram_bankmachine4_cmd_buffer_source_first <= main_sdram_bankmachine4_cmd_buffer_sink_first;
		main_sdram_bankmachine4_cmd_buffer_source_last <= main_sdram_bankmachine4_cmd_buffer_sink_last;
		main_sdram_bankmachine4_cmd_buffer_source_payload_we <= main_sdram_bankmachine4_cmd_buffer_sink_payload_we;
		main_sdram_bankmachine4_cmd_buffer_source_payload_addr <= main_sdram_bankmachine4_cmd_buffer_sink_payload_addr;
	end
	if (main_sdram_bankmachine4_twtpcon_valid) begin
		main_sdram_bankmachine4_twtpcon_count <= 3'd5;
		if (1'd0) begin
			main_sdram_bankmachine4_twtpcon_ready <= 1'd1;
		end else begin
			main_sdram_bankmachine4_twtpcon_ready <= 1'd0;
		end
	end else begin
		if ((~main_sdram_bankmachine4_twtpcon_ready)) begin
			main_sdram_bankmachine4_twtpcon_count <= (main_sdram_bankmachine4_twtpcon_count - 1'd1);
			if ((main_sdram_bankmachine4_twtpcon_count == 1'd1)) begin
				main_sdram_bankmachine4_twtpcon_ready <= 1'd1;
			end
		end
	end
	if (main_sdram_bankmachine4_trccon_valid) begin
		main_sdram_bankmachine4_trccon_count <= 3'd5;
		if (1'd0) begin
			main_sdram_bankmachine4_trccon_ready <= 1'd1;
		end else begin
			main_sdram_bankmachine4_trccon_ready <= 1'd0;
		end
	end else begin
		if ((~main_sdram_bankmachine4_trccon_ready)) begin
			main_sdram_bankmachine4_trccon_count <= (main_sdram_bankmachine4_trccon_count - 1'd1);
			if ((main_sdram_bankmachine4_trccon_count == 1'd1)) begin
				main_sdram_bankmachine4_trccon_ready <= 1'd1;
			end
		end
	end
	if (main_sdram_bankmachine4_trascon_valid) begin
		main_sdram_bankmachine4_trascon_count <= 3'd4;
		if (1'd0) begin
			main_sdram_bankmachine4_trascon_ready <= 1'd1;
		end else begin
			main_sdram_bankmachine4_trascon_ready <= 1'd0;
		end
	end else begin
		if ((~main_sdram_bankmachine4_trascon_ready)) begin
			main_sdram_bankmachine4_trascon_count <= (main_sdram_bankmachine4_trascon_count - 1'd1);
			if ((main_sdram_bankmachine4_trascon_count == 1'd1)) begin
				main_sdram_bankmachine4_trascon_ready <= 1'd1;
			end
		end
	end
	builder_bankmachine4_state <= builder_bankmachine4_next_state;
	if (main_sdram_bankmachine5_row_close) begin
		main_sdram_bankmachine5_row_opened <= 1'd0;
	end else begin
		if (main_sdram_bankmachine5_row_open) begin
			main_sdram_bankmachine5_row_opened <= 1'd1;
			main_sdram_bankmachine5_row <= main_sdram_bankmachine5_cmd_buffer_source_payload_addr[20:7];
		end
	end
	if (((main_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_we & main_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_writable) & (~main_sdram_bankmachine5_cmd_buffer_lookahead_replace))) begin
		main_sdram_bankmachine5_cmd_buffer_lookahead_produce <= (main_sdram_bankmachine5_cmd_buffer_lookahead_produce + 1'd1);
	end
	if (main_sdram_bankmachine5_cmd_buffer_lookahead_do_read) begin
		main_sdram_bankmachine5_cmd_buffer_lookahead_consume <= (main_sdram_bankmachine5_cmd_buffer_lookahead_consume + 1'd1);
	end
	if (((main_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_we & main_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_writable) & (~main_sdram_bankmachine5_cmd_buffer_lookahead_replace))) begin
		if ((~main_sdram_bankmachine5_cmd_buffer_lookahead_do_read)) begin
			main_sdram_bankmachine5_cmd_buffer_lookahead_level <= (main_sdram_bankmachine5_cmd_buffer_lookahead_level + 1'd1);
		end
	end else begin
		if (main_sdram_bankmachine5_cmd_buffer_lookahead_do_read) begin
			main_sdram_bankmachine5_cmd_buffer_lookahead_level <= (main_sdram_bankmachine5_cmd_buffer_lookahead_level - 1'd1);
		end
	end
	if (((~main_sdram_bankmachine5_cmd_buffer_source_valid) | main_sdram_bankmachine5_cmd_buffer_source_ready)) begin
		main_sdram_bankmachine5_cmd_buffer_source_valid <= main_sdram_bankmachine5_cmd_buffer_sink_valid;
		main_sdram_bankmachine5_cmd_buffer_source_first <= main_sdram_bankmachine5_cmd_buffer_sink_first;
		main_sdram_bankmachine5_cmd_buffer_source_last <= main_sdram_bankmachine5_cmd_buffer_sink_last;
		main_sdram_bankmachine5_cmd_buffer_source_payload_we <= main_sdram_bankmachine5_cmd_buffer_sink_payload_we;
		main_sdram_bankmachine5_cmd_buffer_source_payload_addr <= main_sdram_bankmachine5_cmd_buffer_sink_payload_addr;
	end
	if (main_sdram_bankmachine5_twtpcon_valid) begin
		main_sdram_bankmachine5_twtpcon_count <= 3'd5;
		if (1'd0) begin
			main_sdram_bankmachine5_twtpcon_ready <= 1'd1;
		end else begin
			main_sdram_bankmachine5_twtpcon_ready <= 1'd0;
		end
	end else begin
		if ((~main_sdram_bankmachine5_twtpcon_ready)) begin
			main_sdram_bankmachine5_twtpcon_count <= (main_sdram_bankmachine5_twtpcon_count - 1'd1);
			if ((main_sdram_bankmachine5_twtpcon_count == 1'd1)) begin
				main_sdram_bankmachine5_twtpcon_ready <= 1'd1;
			end
		end
	end
	if (main_sdram_bankmachine5_trccon_valid) begin
		main_sdram_bankmachine5_trccon_count <= 3'd5;
		if (1'd0) begin
			main_sdram_bankmachine5_trccon_ready <= 1'd1;
		end else begin
			main_sdram_bankmachine5_trccon_ready <= 1'd0;
		end
	end else begin
		if ((~main_sdram_bankmachine5_trccon_ready)) begin
			main_sdram_bankmachine5_trccon_count <= (main_sdram_bankmachine5_trccon_count - 1'd1);
			if ((main_sdram_bankmachine5_trccon_count == 1'd1)) begin
				main_sdram_bankmachine5_trccon_ready <= 1'd1;
			end
		end
	end
	if (main_sdram_bankmachine5_trascon_valid) begin
		main_sdram_bankmachine5_trascon_count <= 3'd4;
		if (1'd0) begin
			main_sdram_bankmachine5_trascon_ready <= 1'd1;
		end else begin
			main_sdram_bankmachine5_trascon_ready <= 1'd0;
		end
	end else begin
		if ((~main_sdram_bankmachine5_trascon_ready)) begin
			main_sdram_bankmachine5_trascon_count <= (main_sdram_bankmachine5_trascon_count - 1'd1);
			if ((main_sdram_bankmachine5_trascon_count == 1'd1)) begin
				main_sdram_bankmachine5_trascon_ready <= 1'd1;
			end
		end
	end
	builder_bankmachine5_state <= builder_bankmachine5_next_state;
	if (main_sdram_bankmachine6_row_close) begin
		main_sdram_bankmachine6_row_opened <= 1'd0;
	end else begin
		if (main_sdram_bankmachine6_row_open) begin
			main_sdram_bankmachine6_row_opened <= 1'd1;
			main_sdram_bankmachine6_row <= main_sdram_bankmachine6_cmd_buffer_source_payload_addr[20:7];
		end
	end
	if (((main_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_we & main_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_writable) & (~main_sdram_bankmachine6_cmd_buffer_lookahead_replace))) begin
		main_sdram_bankmachine6_cmd_buffer_lookahead_produce <= (main_sdram_bankmachine6_cmd_buffer_lookahead_produce + 1'd1);
	end
	if (main_sdram_bankmachine6_cmd_buffer_lookahead_do_read) begin
		main_sdram_bankmachine6_cmd_buffer_lookahead_consume <= (main_sdram_bankmachine6_cmd_buffer_lookahead_consume + 1'd1);
	end
	if (((main_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_we & main_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_writable) & (~main_sdram_bankmachine6_cmd_buffer_lookahead_replace))) begin
		if ((~main_sdram_bankmachine6_cmd_buffer_lookahead_do_read)) begin
			main_sdram_bankmachine6_cmd_buffer_lookahead_level <= (main_sdram_bankmachine6_cmd_buffer_lookahead_level + 1'd1);
		end
	end else begin
		if (main_sdram_bankmachine6_cmd_buffer_lookahead_do_read) begin
			main_sdram_bankmachine6_cmd_buffer_lookahead_level <= (main_sdram_bankmachine6_cmd_buffer_lookahead_level - 1'd1);
		end
	end
	if (((~main_sdram_bankmachine6_cmd_buffer_source_valid) | main_sdram_bankmachine6_cmd_buffer_source_ready)) begin
		main_sdram_bankmachine6_cmd_buffer_source_valid <= main_sdram_bankmachine6_cmd_buffer_sink_valid;
		main_sdram_bankmachine6_cmd_buffer_source_first <= main_sdram_bankmachine6_cmd_buffer_sink_first;
		main_sdram_bankmachine6_cmd_buffer_source_last <= main_sdram_bankmachine6_cmd_buffer_sink_last;
		main_sdram_bankmachine6_cmd_buffer_source_payload_we <= main_sdram_bankmachine6_cmd_buffer_sink_payload_we;
		main_sdram_bankmachine6_cmd_buffer_source_payload_addr <= main_sdram_bankmachine6_cmd_buffer_sink_payload_addr;
	end
	if (main_sdram_bankmachine6_twtpcon_valid) begin
		main_sdram_bankmachine6_twtpcon_count <= 3'd5;
		if (1'd0) begin
			main_sdram_bankmachine6_twtpcon_ready <= 1'd1;
		end else begin
			main_sdram_bankmachine6_twtpcon_ready <= 1'd0;
		end
	end else begin
		if ((~main_sdram_bankmachine6_twtpcon_ready)) begin
			main_sdram_bankmachine6_twtpcon_count <= (main_sdram_bankmachine6_twtpcon_count - 1'd1);
			if ((main_sdram_bankmachine6_twtpcon_count == 1'd1)) begin
				main_sdram_bankmachine6_twtpcon_ready <= 1'd1;
			end
		end
	end
	if (main_sdram_bankmachine6_trccon_valid) begin
		main_sdram_bankmachine6_trccon_count <= 3'd5;
		if (1'd0) begin
			main_sdram_bankmachine6_trccon_ready <= 1'd1;
		end else begin
			main_sdram_bankmachine6_trccon_ready <= 1'd0;
		end
	end else begin
		if ((~main_sdram_bankmachine6_trccon_ready)) begin
			main_sdram_bankmachine6_trccon_count <= (main_sdram_bankmachine6_trccon_count - 1'd1);
			if ((main_sdram_bankmachine6_trccon_count == 1'd1)) begin
				main_sdram_bankmachine6_trccon_ready <= 1'd1;
			end
		end
	end
	if (main_sdram_bankmachine6_trascon_valid) begin
		main_sdram_bankmachine6_trascon_count <= 3'd4;
		if (1'd0) begin
			main_sdram_bankmachine6_trascon_ready <= 1'd1;
		end else begin
			main_sdram_bankmachine6_trascon_ready <= 1'd0;
		end
	end else begin
		if ((~main_sdram_bankmachine6_trascon_ready)) begin
			main_sdram_bankmachine6_trascon_count <= (main_sdram_bankmachine6_trascon_count - 1'd1);
			if ((main_sdram_bankmachine6_trascon_count == 1'd1)) begin
				main_sdram_bankmachine6_trascon_ready <= 1'd1;
			end
		end
	end
	builder_bankmachine6_state <= builder_bankmachine6_next_state;
	if (main_sdram_bankmachine7_row_close) begin
		main_sdram_bankmachine7_row_opened <= 1'd0;
	end else begin
		if (main_sdram_bankmachine7_row_open) begin
			main_sdram_bankmachine7_row_opened <= 1'd1;
			main_sdram_bankmachine7_row <= main_sdram_bankmachine7_cmd_buffer_source_payload_addr[20:7];
		end
	end
	if (((main_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_we & main_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_writable) & (~main_sdram_bankmachine7_cmd_buffer_lookahead_replace))) begin
		main_sdram_bankmachine7_cmd_buffer_lookahead_produce <= (main_sdram_bankmachine7_cmd_buffer_lookahead_produce + 1'd1);
	end
	if (main_sdram_bankmachine7_cmd_buffer_lookahead_do_read) begin
		main_sdram_bankmachine7_cmd_buffer_lookahead_consume <= (main_sdram_bankmachine7_cmd_buffer_lookahead_consume + 1'd1);
	end
	if (((main_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_we & main_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_writable) & (~main_sdram_bankmachine7_cmd_buffer_lookahead_replace))) begin
		if ((~main_sdram_bankmachine7_cmd_buffer_lookahead_do_read)) begin
			main_sdram_bankmachine7_cmd_buffer_lookahead_level <= (main_sdram_bankmachine7_cmd_buffer_lookahead_level + 1'd1);
		end
	end else begin
		if (main_sdram_bankmachine7_cmd_buffer_lookahead_do_read) begin
			main_sdram_bankmachine7_cmd_buffer_lookahead_level <= (main_sdram_bankmachine7_cmd_buffer_lookahead_level - 1'd1);
		end
	end
	if (((~main_sdram_bankmachine7_cmd_buffer_source_valid) | main_sdram_bankmachine7_cmd_buffer_source_ready)) begin
		main_sdram_bankmachine7_cmd_buffer_source_valid <= main_sdram_bankmachine7_cmd_buffer_sink_valid;
		main_sdram_bankmachine7_cmd_buffer_source_first <= main_sdram_bankmachine7_cmd_buffer_sink_first;
		main_sdram_bankmachine7_cmd_buffer_source_last <= main_sdram_bankmachine7_cmd_buffer_sink_last;
		main_sdram_bankmachine7_cmd_buffer_source_payload_we <= main_sdram_bankmachine7_cmd_buffer_sink_payload_we;
		main_sdram_bankmachine7_cmd_buffer_source_payload_addr <= main_sdram_bankmachine7_cmd_buffer_sink_payload_addr;
	end
	if (main_sdram_bankmachine7_twtpcon_valid) begin
		main_sdram_bankmachine7_twtpcon_count <= 3'd5;
		if (1'd0) begin
			main_sdram_bankmachine7_twtpcon_ready <= 1'd1;
		end else begin
			main_sdram_bankmachine7_twtpcon_ready <= 1'd0;
		end
	end else begin
		if ((~main_sdram_bankmachine7_twtpcon_ready)) begin
			main_sdram_bankmachine7_twtpcon_count <= (main_sdram_bankmachine7_twtpcon_count - 1'd1);
			if ((main_sdram_bankmachine7_twtpcon_count == 1'd1)) begin
				main_sdram_bankmachine7_twtpcon_ready <= 1'd1;
			end
		end
	end
	if (main_sdram_bankmachine7_trccon_valid) begin
		main_sdram_bankmachine7_trccon_count <= 3'd5;
		if (1'd0) begin
			main_sdram_bankmachine7_trccon_ready <= 1'd1;
		end else begin
			main_sdram_bankmachine7_trccon_ready <= 1'd0;
		end
	end else begin
		if ((~main_sdram_bankmachine7_trccon_ready)) begin
			main_sdram_bankmachine7_trccon_count <= (main_sdram_bankmachine7_trccon_count - 1'd1);
			if ((main_sdram_bankmachine7_trccon_count == 1'd1)) begin
				main_sdram_bankmachine7_trccon_ready <= 1'd1;
			end
		end
	end
	if (main_sdram_bankmachine7_trascon_valid) begin
		main_sdram_bankmachine7_trascon_count <= 3'd4;
		if (1'd0) begin
			main_sdram_bankmachine7_trascon_ready <= 1'd1;
		end else begin
			main_sdram_bankmachine7_trascon_ready <= 1'd0;
		end
	end else begin
		if ((~main_sdram_bankmachine7_trascon_ready)) begin
			main_sdram_bankmachine7_trascon_count <= (main_sdram_bankmachine7_trascon_count - 1'd1);
			if ((main_sdram_bankmachine7_trascon_count == 1'd1)) begin
				main_sdram_bankmachine7_trascon_ready <= 1'd1;
			end
		end
	end
	builder_bankmachine7_state <= builder_bankmachine7_next_state;
	if ((~main_sdram_en0)) begin
		main_sdram_time0 <= 5'd31;
	end else begin
		if ((~main_sdram_max_time0)) begin
			main_sdram_time0 <= (main_sdram_time0 - 1'd1);
		end
	end
	if ((~main_sdram_en1)) begin
		main_sdram_time1 <= 4'd15;
	end else begin
		if ((~main_sdram_max_time1)) begin
			main_sdram_time1 <= (main_sdram_time1 - 1'd1);
		end
	end
	if (main_sdram_choose_cmd_ce) begin
		case (main_sdram_choose_cmd_grant)
			1'd0: begin
				if (main_sdram_choose_cmd_request[1]) begin
					main_sdram_choose_cmd_grant <= 1'd1;
				end else begin
					if (main_sdram_choose_cmd_request[2]) begin
						main_sdram_choose_cmd_grant <= 2'd2;
					end else begin
						if (main_sdram_choose_cmd_request[3]) begin
							main_sdram_choose_cmd_grant <= 2'd3;
						end else begin
							if (main_sdram_choose_cmd_request[4]) begin
								main_sdram_choose_cmd_grant <= 3'd4;
							end else begin
								if (main_sdram_choose_cmd_request[5]) begin
									main_sdram_choose_cmd_grant <= 3'd5;
								end else begin
									if (main_sdram_choose_cmd_request[6]) begin
										main_sdram_choose_cmd_grant <= 3'd6;
									end else begin
										if (main_sdram_choose_cmd_request[7]) begin
											main_sdram_choose_cmd_grant <= 3'd7;
										end
									end
								end
							end
						end
					end
				end
			end
			1'd1: begin
				if (main_sdram_choose_cmd_request[2]) begin
					main_sdram_choose_cmd_grant <= 2'd2;
				end else begin
					if (main_sdram_choose_cmd_request[3]) begin
						main_sdram_choose_cmd_grant <= 2'd3;
					end else begin
						if (main_sdram_choose_cmd_request[4]) begin
							main_sdram_choose_cmd_grant <= 3'd4;
						end else begin
							if (main_sdram_choose_cmd_request[5]) begin
								main_sdram_choose_cmd_grant <= 3'd5;
							end else begin
								if (main_sdram_choose_cmd_request[6]) begin
									main_sdram_choose_cmd_grant <= 3'd6;
								end else begin
									if (main_sdram_choose_cmd_request[7]) begin
										main_sdram_choose_cmd_grant <= 3'd7;
									end else begin
										if (main_sdram_choose_cmd_request[0]) begin
											main_sdram_choose_cmd_grant <= 1'd0;
										end
									end
								end
							end
						end
					end
				end
			end
			2'd2: begin
				if (main_sdram_choose_cmd_request[3]) begin
					main_sdram_choose_cmd_grant <= 2'd3;
				end else begin
					if (main_sdram_choose_cmd_request[4]) begin
						main_sdram_choose_cmd_grant <= 3'd4;
					end else begin
						if (main_sdram_choose_cmd_request[5]) begin
							main_sdram_choose_cmd_grant <= 3'd5;
						end else begin
							if (main_sdram_choose_cmd_request[6]) begin
								main_sdram_choose_cmd_grant <= 3'd6;
							end else begin
								if (main_sdram_choose_cmd_request[7]) begin
									main_sdram_choose_cmd_grant <= 3'd7;
								end else begin
									if (main_sdram_choose_cmd_request[0]) begin
										main_sdram_choose_cmd_grant <= 1'd0;
									end else begin
										if (main_sdram_choose_cmd_request[1]) begin
											main_sdram_choose_cmd_grant <= 1'd1;
										end
									end
								end
							end
						end
					end
				end
			end
			2'd3: begin
				if (main_sdram_choose_cmd_request[4]) begin
					main_sdram_choose_cmd_grant <= 3'd4;
				end else begin
					if (main_sdram_choose_cmd_request[5]) begin
						main_sdram_choose_cmd_grant <= 3'd5;
					end else begin
						if (main_sdram_choose_cmd_request[6]) begin
							main_sdram_choose_cmd_grant <= 3'd6;
						end else begin
							if (main_sdram_choose_cmd_request[7]) begin
								main_sdram_choose_cmd_grant <= 3'd7;
							end else begin
								if (main_sdram_choose_cmd_request[0]) begin
									main_sdram_choose_cmd_grant <= 1'd0;
								end else begin
									if (main_sdram_choose_cmd_request[1]) begin
										main_sdram_choose_cmd_grant <= 1'd1;
									end else begin
										if (main_sdram_choose_cmd_request[2]) begin
											main_sdram_choose_cmd_grant <= 2'd2;
										end
									end
								end
							end
						end
					end
				end
			end
			3'd4: begin
				if (main_sdram_choose_cmd_request[5]) begin
					main_sdram_choose_cmd_grant <= 3'd5;
				end else begin
					if (main_sdram_choose_cmd_request[6]) begin
						main_sdram_choose_cmd_grant <= 3'd6;
					end else begin
						if (main_sdram_choose_cmd_request[7]) begin
							main_sdram_choose_cmd_grant <= 3'd7;
						end else begin
							if (main_sdram_choose_cmd_request[0]) begin
								main_sdram_choose_cmd_grant <= 1'd0;
							end else begin
								if (main_sdram_choose_cmd_request[1]) begin
									main_sdram_choose_cmd_grant <= 1'd1;
								end else begin
									if (main_sdram_choose_cmd_request[2]) begin
										main_sdram_choose_cmd_grant <= 2'd2;
									end else begin
										if (main_sdram_choose_cmd_request[3]) begin
											main_sdram_choose_cmd_grant <= 2'd3;
										end
									end
								end
							end
						end
					end
				end
			end
			3'd5: begin
				if (main_sdram_choose_cmd_request[6]) begin
					main_sdram_choose_cmd_grant <= 3'd6;
				end else begin
					if (main_sdram_choose_cmd_request[7]) begin
						main_sdram_choose_cmd_grant <= 3'd7;
					end else begin
						if (main_sdram_choose_cmd_request[0]) begin
							main_sdram_choose_cmd_grant <= 1'd0;
						end else begin
							if (main_sdram_choose_cmd_request[1]) begin
								main_sdram_choose_cmd_grant <= 1'd1;
							end else begin
								if (main_sdram_choose_cmd_request[2]) begin
									main_sdram_choose_cmd_grant <= 2'd2;
								end else begin
									if (main_sdram_choose_cmd_request[3]) begin
										main_sdram_choose_cmd_grant <= 2'd3;
									end else begin
										if (main_sdram_choose_cmd_request[4]) begin
											main_sdram_choose_cmd_grant <= 3'd4;
										end
									end
								end
							end
						end
					end
				end
			end
			3'd6: begin
				if (main_sdram_choose_cmd_request[7]) begin
					main_sdram_choose_cmd_grant <= 3'd7;
				end else begin
					if (main_sdram_choose_cmd_request[0]) begin
						main_sdram_choose_cmd_grant <= 1'd0;
					end else begin
						if (main_sdram_choose_cmd_request[1]) begin
							main_sdram_choose_cmd_grant <= 1'd1;
						end else begin
							if (main_sdram_choose_cmd_request[2]) begin
								main_sdram_choose_cmd_grant <= 2'd2;
							end else begin
								if (main_sdram_choose_cmd_request[3]) begin
									main_sdram_choose_cmd_grant <= 2'd3;
								end else begin
									if (main_sdram_choose_cmd_request[4]) begin
										main_sdram_choose_cmd_grant <= 3'd4;
									end else begin
										if (main_sdram_choose_cmd_request[5]) begin
											main_sdram_choose_cmd_grant <= 3'd5;
										end
									end
								end
							end
						end
					end
				end
			end
			3'd7: begin
				if (main_sdram_choose_cmd_request[0]) begin
					main_sdram_choose_cmd_grant <= 1'd0;
				end else begin
					if (main_sdram_choose_cmd_request[1]) begin
						main_sdram_choose_cmd_grant <= 1'd1;
					end else begin
						if (main_sdram_choose_cmd_request[2]) begin
							main_sdram_choose_cmd_grant <= 2'd2;
						end else begin
							if (main_sdram_choose_cmd_request[3]) begin
								main_sdram_choose_cmd_grant <= 2'd3;
							end else begin
								if (main_sdram_choose_cmd_request[4]) begin
									main_sdram_choose_cmd_grant <= 3'd4;
								end else begin
									if (main_sdram_choose_cmd_request[5]) begin
										main_sdram_choose_cmd_grant <= 3'd5;
									end else begin
										if (main_sdram_choose_cmd_request[6]) begin
											main_sdram_choose_cmd_grant <= 3'd6;
										end
									end
								end
							end
						end
					end
				end
			end
		endcase
	end
	if (main_sdram_choose_req_ce) begin
		case (main_sdram_choose_req_grant)
			1'd0: begin
				if (main_sdram_choose_req_request[1]) begin
					main_sdram_choose_req_grant <= 1'd1;
				end else begin
					if (main_sdram_choose_req_request[2]) begin
						main_sdram_choose_req_grant <= 2'd2;
					end else begin
						if (main_sdram_choose_req_request[3]) begin
							main_sdram_choose_req_grant <= 2'd3;
						end else begin
							if (main_sdram_choose_req_request[4]) begin
								main_sdram_choose_req_grant <= 3'd4;
							end else begin
								if (main_sdram_choose_req_request[5]) begin
									main_sdram_choose_req_grant <= 3'd5;
								end else begin
									if (main_sdram_choose_req_request[6]) begin
										main_sdram_choose_req_grant <= 3'd6;
									end else begin
										if (main_sdram_choose_req_request[7]) begin
											main_sdram_choose_req_grant <= 3'd7;
										end
									end
								end
							end
						end
					end
				end
			end
			1'd1: begin
				if (main_sdram_choose_req_request[2]) begin
					main_sdram_choose_req_grant <= 2'd2;
				end else begin
					if (main_sdram_choose_req_request[3]) begin
						main_sdram_choose_req_grant <= 2'd3;
					end else begin
						if (main_sdram_choose_req_request[4]) begin
							main_sdram_choose_req_grant <= 3'd4;
						end else begin
							if (main_sdram_choose_req_request[5]) begin
								main_sdram_choose_req_grant <= 3'd5;
							end else begin
								if (main_sdram_choose_req_request[6]) begin
									main_sdram_choose_req_grant <= 3'd6;
								end else begin
									if (main_sdram_choose_req_request[7]) begin
										main_sdram_choose_req_grant <= 3'd7;
									end else begin
										if (main_sdram_choose_req_request[0]) begin
											main_sdram_choose_req_grant <= 1'd0;
										end
									end
								end
							end
						end
					end
				end
			end
			2'd2: begin
				if (main_sdram_choose_req_request[3]) begin
					main_sdram_choose_req_grant <= 2'd3;
				end else begin
					if (main_sdram_choose_req_request[4]) begin
						main_sdram_choose_req_grant <= 3'd4;
					end else begin
						if (main_sdram_choose_req_request[5]) begin
							main_sdram_choose_req_grant <= 3'd5;
						end else begin
							if (main_sdram_choose_req_request[6]) begin
								main_sdram_choose_req_grant <= 3'd6;
							end else begin
								if (main_sdram_choose_req_request[7]) begin
									main_sdram_choose_req_grant <= 3'd7;
								end else begin
									if (main_sdram_choose_req_request[0]) begin
										main_sdram_choose_req_grant <= 1'd0;
									end else begin
										if (main_sdram_choose_req_request[1]) begin
											main_sdram_choose_req_grant <= 1'd1;
										end
									end
								end
							end
						end
					end
				end
			end
			2'd3: begin
				if (main_sdram_choose_req_request[4]) begin
					main_sdram_choose_req_grant <= 3'd4;
				end else begin
					if (main_sdram_choose_req_request[5]) begin
						main_sdram_choose_req_grant <= 3'd5;
					end else begin
						if (main_sdram_choose_req_request[6]) begin
							main_sdram_choose_req_grant <= 3'd6;
						end else begin
							if (main_sdram_choose_req_request[7]) begin
								main_sdram_choose_req_grant <= 3'd7;
							end else begin
								if (main_sdram_choose_req_request[0]) begin
									main_sdram_choose_req_grant <= 1'd0;
								end else begin
									if (main_sdram_choose_req_request[1]) begin
										main_sdram_choose_req_grant <= 1'd1;
									end else begin
										if (main_sdram_choose_req_request[2]) begin
											main_sdram_choose_req_grant <= 2'd2;
										end
									end
								end
							end
						end
					end
				end
			end
			3'd4: begin
				if (main_sdram_choose_req_request[5]) begin
					main_sdram_choose_req_grant <= 3'd5;
				end else begin
					if (main_sdram_choose_req_request[6]) begin
						main_sdram_choose_req_grant <= 3'd6;
					end else begin
						if (main_sdram_choose_req_request[7]) begin
							main_sdram_choose_req_grant <= 3'd7;
						end else begin
							if (main_sdram_choose_req_request[0]) begin
								main_sdram_choose_req_grant <= 1'd0;
							end else begin
								if (main_sdram_choose_req_request[1]) begin
									main_sdram_choose_req_grant <= 1'd1;
								end else begin
									if (main_sdram_choose_req_request[2]) begin
										main_sdram_choose_req_grant <= 2'd2;
									end else begin
										if (main_sdram_choose_req_request[3]) begin
											main_sdram_choose_req_grant <= 2'd3;
										end
									end
								end
							end
						end
					end
				end
			end
			3'd5: begin
				if (main_sdram_choose_req_request[6]) begin
					main_sdram_choose_req_grant <= 3'd6;
				end else begin
					if (main_sdram_choose_req_request[7]) begin
						main_sdram_choose_req_grant <= 3'd7;
					end else begin
						if (main_sdram_choose_req_request[0]) begin
							main_sdram_choose_req_grant <= 1'd0;
						end else begin
							if (main_sdram_choose_req_request[1]) begin
								main_sdram_choose_req_grant <= 1'd1;
							end else begin
								if (main_sdram_choose_req_request[2]) begin
									main_sdram_choose_req_grant <= 2'd2;
								end else begin
									if (main_sdram_choose_req_request[3]) begin
										main_sdram_choose_req_grant <= 2'd3;
									end else begin
										if (main_sdram_choose_req_request[4]) begin
											main_sdram_choose_req_grant <= 3'd4;
										end
									end
								end
							end
						end
					end
				end
			end
			3'd6: begin
				if (main_sdram_choose_req_request[7]) begin
					main_sdram_choose_req_grant <= 3'd7;
				end else begin
					if (main_sdram_choose_req_request[0]) begin
						main_sdram_choose_req_grant <= 1'd0;
					end else begin
						if (main_sdram_choose_req_request[1]) begin
							main_sdram_choose_req_grant <= 1'd1;
						end else begin
							if (main_sdram_choose_req_request[2]) begin
								main_sdram_choose_req_grant <= 2'd2;
							end else begin
								if (main_sdram_choose_req_request[3]) begin
									main_sdram_choose_req_grant <= 2'd3;
								end else begin
									if (main_sdram_choose_req_request[4]) begin
										main_sdram_choose_req_grant <= 3'd4;
									end else begin
										if (main_sdram_choose_req_request[5]) begin
											main_sdram_choose_req_grant <= 3'd5;
										end
									end
								end
							end
						end
					end
				end
			end
			3'd7: begin
				if (main_sdram_choose_req_request[0]) begin
					main_sdram_choose_req_grant <= 1'd0;
				end else begin
					if (main_sdram_choose_req_request[1]) begin
						main_sdram_choose_req_grant <= 1'd1;
					end else begin
						if (main_sdram_choose_req_request[2]) begin
							main_sdram_choose_req_grant <= 2'd2;
						end else begin
							if (main_sdram_choose_req_request[3]) begin
								main_sdram_choose_req_grant <= 2'd3;
							end else begin
								if (main_sdram_choose_req_request[4]) begin
									main_sdram_choose_req_grant <= 3'd4;
								end else begin
									if (main_sdram_choose_req_request[5]) begin
										main_sdram_choose_req_grant <= 3'd5;
									end else begin
										if (main_sdram_choose_req_request[6]) begin
											main_sdram_choose_req_grant <= 3'd6;
										end
									end
								end
							end
						end
					end
				end
			end
		endcase
	end
	main_sdram_dfi_p0_cs_n <= 1'd0;
	main_sdram_dfi_p0_bank <= builder_array_muxed0;
	main_sdram_dfi_p0_address <= builder_array_muxed1;
	main_sdram_dfi_p0_cas_n <= (~builder_array_muxed2);
	main_sdram_dfi_p0_ras_n <= (~builder_array_muxed3);
	main_sdram_dfi_p0_we_n <= (~builder_array_muxed4);
	main_sdram_dfi_p0_rddata_en <= builder_array_muxed5;
	main_sdram_dfi_p0_wrdata_en <= builder_array_muxed6;
	main_sdram_dfi_p1_cs_n <= 1'd0;
	main_sdram_dfi_p1_bank <= builder_array_muxed7;
	main_sdram_dfi_p1_address <= builder_array_muxed8;
	main_sdram_dfi_p1_cas_n <= (~builder_array_muxed9);
	main_sdram_dfi_p1_ras_n <= (~builder_array_muxed10);
	main_sdram_dfi_p1_we_n <= (~builder_array_muxed11);
	main_sdram_dfi_p1_rddata_en <= builder_array_muxed12;
	main_sdram_dfi_p1_wrdata_en <= builder_array_muxed13;
	main_sdram_dfi_p2_cs_n <= 1'd0;
	main_sdram_dfi_p2_bank <= builder_array_muxed14;
	main_sdram_dfi_p2_address <= builder_array_muxed15;
	main_sdram_dfi_p2_cas_n <= (~builder_array_muxed16);
	main_sdram_dfi_p2_ras_n <= (~builder_array_muxed17);
	main_sdram_dfi_p2_we_n <= (~builder_array_muxed18);
	main_sdram_dfi_p2_rddata_en <= builder_array_muxed19;
	main_sdram_dfi_p2_wrdata_en <= builder_array_muxed20;
	main_sdram_dfi_p3_cs_n <= 1'd0;
	main_sdram_dfi_p3_bank <= builder_array_muxed21;
	main_sdram_dfi_p3_address <= builder_array_muxed22;
	main_sdram_dfi_p3_cas_n <= (~builder_array_muxed23);
	main_sdram_dfi_p3_ras_n <= (~builder_array_muxed24);
	main_sdram_dfi_p3_we_n <= (~builder_array_muxed25);
	main_sdram_dfi_p3_rddata_en <= builder_array_muxed26;
	main_sdram_dfi_p3_wrdata_en <= builder_array_muxed27;
	if (main_sdram_trrdcon_valid) begin
		main_sdram_trrdcon_count <= 1'd1;
		if (1'd0) begin
			main_sdram_trrdcon_ready <= 1'd1;
		end else begin
			main_sdram_trrdcon_ready <= 1'd0;
		end
	end else begin
		if ((~main_sdram_trrdcon_ready)) begin
			main_sdram_trrdcon_count <= (main_sdram_trrdcon_count - 1'd1);
			if ((main_sdram_trrdcon_count == 1'd1)) begin
				main_sdram_trrdcon_ready <= 1'd1;
			end
		end
	end
	main_sdram_tfawcon_window <= {main_sdram_tfawcon_window, main_sdram_tfawcon_valid};
	if ((main_sdram_tfawcon_count < 3'd4)) begin
		if ((main_sdram_tfawcon_count == 2'd3)) begin
			main_sdram_tfawcon_ready <= (~main_sdram_tfawcon_valid);
		end else begin
			main_sdram_tfawcon_ready <= 1'd1;
		end
	end
	if (main_sdram_tccdcon_valid) begin
		main_sdram_tccdcon_count <= 1'd0;
		if (1'd1) begin
			main_sdram_tccdcon_ready <= 1'd1;
		end else begin
			main_sdram_tccdcon_ready <= 1'd0;
		end
	end else begin
		if ((~main_sdram_tccdcon_ready)) begin
			main_sdram_tccdcon_count <= (main_sdram_tccdcon_count - 1'd1);
			if ((main_sdram_tccdcon_count == 1'd1)) begin
				main_sdram_tccdcon_ready <= 1'd1;
			end
		end
	end
	if (main_sdram_twtrcon_valid) begin
		main_sdram_twtrcon_count <= 3'd4;
		if (1'd0) begin
			main_sdram_twtrcon_ready <= 1'd1;
		end else begin
			main_sdram_twtrcon_ready <= 1'd0;
		end
	end else begin
		if ((~main_sdram_twtrcon_ready)) begin
			main_sdram_twtrcon_count <= (main_sdram_twtrcon_count - 1'd1);
			if ((main_sdram_twtrcon_count == 1'd1)) begin
				main_sdram_twtrcon_ready <= 1'd1;
			end
		end
	end
	builder_multiplexer_state <= builder_multiplexer_next_state;
	builder_new_master_wdata_ready0 <= ((((((((1'd0 | ((builder_roundrobin0_grant == 1'd0) & main_sdram_interface_bank0_wdata_ready)) | ((builder_roundrobin1_grant == 1'd0) & main_sdram_interface_bank1_wdata_ready)) | ((builder_roundrobin2_grant == 1'd0) & main_sdram_interface_bank2_wdata_ready)) | ((builder_roundrobin3_grant == 1'd0) & main_sdram_interface_bank3_wdata_ready)) | ((builder_roundrobin4_grant == 1'd0) & main_sdram_interface_bank4_wdata_ready)) | ((builder_roundrobin5_grant == 1'd0) & main_sdram_interface_bank5_wdata_ready)) | ((builder_roundrobin6_grant == 1'd0) & main_sdram_interface_bank6_wdata_ready)) | ((builder_roundrobin7_grant == 1'd0) & main_sdram_interface_bank7_wdata_ready));
	builder_new_master_wdata_ready1 <= builder_new_master_wdata_ready0;
	builder_new_master_wdata_ready2 <= builder_new_master_wdata_ready1;
	builder_new_master_wdata_ready3 <= ((((((((1'd0 | ((builder_roundrobin0_grant == 1'd1) & main_sdram_interface_bank0_wdata_ready)) | ((builder_roundrobin1_grant == 1'd1) & main_sdram_interface_bank1_wdata_ready)) | ((builder_roundrobin2_grant == 1'd1) & main_sdram_interface_bank2_wdata_ready)) | ((builder_roundrobin3_grant == 1'd1) & main_sdram_interface_bank3_wdata_ready)) | ((builder_roundrobin4_grant == 1'd1) & main_sdram_interface_bank4_wdata_ready)) | ((builder_roundrobin5_grant == 1'd1) & main_sdram_interface_bank5_wdata_ready)) | ((builder_roundrobin6_grant == 1'd1) & main_sdram_interface_bank6_wdata_ready)) | ((builder_roundrobin7_grant == 1'd1) & main_sdram_interface_bank7_wdata_ready));
	builder_new_master_wdata_ready4 <= builder_new_master_wdata_ready3;
	builder_new_master_wdata_ready5 <= builder_new_master_wdata_ready4;
	builder_new_master_rdata_valid0 <= ((((((((1'd0 | ((builder_roundrobin0_grant == 1'd0) & main_sdram_interface_bank0_rdata_valid)) | ((builder_roundrobin1_grant == 1'd0) & main_sdram_interface_bank1_rdata_valid)) | ((builder_roundrobin2_grant == 1'd0) & main_sdram_interface_bank2_rdata_valid)) | ((builder_roundrobin3_grant == 1'd0) & main_sdram_interface_bank3_rdata_valid)) | ((builder_roundrobin4_grant == 1'd0) & main_sdram_interface_bank4_rdata_valid)) | ((builder_roundrobin5_grant == 1'd0) & main_sdram_interface_bank5_rdata_valid)) | ((builder_roundrobin6_grant == 1'd0) & main_sdram_interface_bank6_rdata_valid)) | ((builder_roundrobin7_grant == 1'd0) & main_sdram_interface_bank7_rdata_valid));
	builder_new_master_rdata_valid1 <= builder_new_master_rdata_valid0;
	builder_new_master_rdata_valid2 <= builder_new_master_rdata_valid1;
	builder_new_master_rdata_valid3 <= builder_new_master_rdata_valid2;
	builder_new_master_rdata_valid4 <= builder_new_master_rdata_valid3;
	builder_new_master_rdata_valid5 <= builder_new_master_rdata_valid4;
	builder_new_master_rdata_valid6 <= builder_new_master_rdata_valid5;
	builder_new_master_rdata_valid7 <= builder_new_master_rdata_valid6;
	builder_new_master_rdata_valid8 <= ((((((((1'd0 | ((builder_roundrobin0_grant == 1'd1) & main_sdram_interface_bank0_rdata_valid)) | ((builder_roundrobin1_grant == 1'd1) & main_sdram_interface_bank1_rdata_valid)) | ((builder_roundrobin2_grant == 1'd1) & main_sdram_interface_bank2_rdata_valid)) | ((builder_roundrobin3_grant == 1'd1) & main_sdram_interface_bank3_rdata_valid)) | ((builder_roundrobin4_grant == 1'd1) & main_sdram_interface_bank4_rdata_valid)) | ((builder_roundrobin5_grant == 1'd1) & main_sdram_interface_bank5_rdata_valid)) | ((builder_roundrobin6_grant == 1'd1) & main_sdram_interface_bank6_rdata_valid)) | ((builder_roundrobin7_grant == 1'd1) & main_sdram_interface_bank7_rdata_valid));
	builder_new_master_rdata_valid9 <= builder_new_master_rdata_valid8;
	builder_new_master_rdata_valid10 <= builder_new_master_rdata_valid9;
	builder_new_master_rdata_valid11 <= builder_new_master_rdata_valid10;
	builder_new_master_rdata_valid12 <= builder_new_master_rdata_valid11;
	builder_new_master_rdata_valid13 <= builder_new_master_rdata_valid12;
	builder_new_master_rdata_valid14 <= builder_new_master_rdata_valid13;
	builder_new_master_rdata_valid15 <= builder_new_master_rdata_valid14;
	if (builder_roundrobin0_ce) begin
		case (builder_roundrobin0_grant)
			1'd0: begin
				if (builder_roundrobin0_request[1]) begin
					builder_roundrobin0_grant <= 1'd1;
				end
			end
			1'd1: begin
				if (builder_roundrobin0_request[0]) begin
					builder_roundrobin0_grant <= 1'd0;
				end
			end
		endcase
	end
	if (builder_roundrobin1_ce) begin
		case (builder_roundrobin1_grant)
			1'd0: begin
				if (builder_roundrobin1_request[1]) begin
					builder_roundrobin1_grant <= 1'd1;
				end
			end
			1'd1: begin
				if (builder_roundrobin1_request[0]) begin
					builder_roundrobin1_grant <= 1'd0;
				end
			end
		endcase
	end
	if (builder_roundrobin2_ce) begin
		case (builder_roundrobin2_grant)
			1'd0: begin
				if (builder_roundrobin2_request[1]) begin
					builder_roundrobin2_grant <= 1'd1;
				end
			end
			1'd1: begin
				if (builder_roundrobin2_request[0]) begin
					builder_roundrobin2_grant <= 1'd0;
				end
			end
		endcase
	end
	if (builder_roundrobin3_ce) begin
		case (builder_roundrobin3_grant)
			1'd0: begin
				if (builder_roundrobin3_request[1]) begin
					builder_roundrobin3_grant <= 1'd1;
				end
			end
			1'd1: begin
				if (builder_roundrobin3_request[0]) begin
					builder_roundrobin3_grant <= 1'd0;
				end
			end
		endcase
	end
	if (builder_roundrobin4_ce) begin
		case (builder_roundrobin4_grant)
			1'd0: begin
				if (builder_roundrobin4_request[1]) begin
					builder_roundrobin4_grant <= 1'd1;
				end
			end
			1'd1: begin
				if (builder_roundrobin4_request[0]) begin
					builder_roundrobin4_grant <= 1'd0;
				end
			end
		endcase
	end
	if (builder_roundrobin5_ce) begin
		case (builder_roundrobin5_grant)
			1'd0: begin
				if (builder_roundrobin5_request[1]) begin
					builder_roundrobin5_grant <= 1'd1;
				end
			end
			1'd1: begin
				if (builder_roundrobin5_request[0]) begin
					builder_roundrobin5_grant <= 1'd0;
				end
			end
		endcase
	end
	if (builder_roundrobin6_ce) begin
		case (builder_roundrobin6_grant)
			1'd0: begin
				if (builder_roundrobin6_request[1]) begin
					builder_roundrobin6_grant <= 1'd1;
				end
			end
			1'd1: begin
				if (builder_roundrobin6_request[0]) begin
					builder_roundrobin6_grant <= 1'd0;
				end
			end
		endcase
	end
	if (builder_roundrobin7_ce) begin
		case (builder_roundrobin7_grant)
			1'd0: begin
				if (builder_roundrobin7_request[1]) begin
					builder_roundrobin7_grant <= 1'd1;
				end
			end
			1'd1: begin
				if (builder_roundrobin7_request[0]) begin
					builder_roundrobin7_grant <= 1'd0;
				end
			end
		endcase
	end
	builder_slave_sel_r <= builder_slave_sel;
	if (builder_wait) begin
		if ((~builder_done)) begin
			builder_count <= (builder_count - 1'd1);
		end
	end else begin
		builder_count <= 20'd1000000;
	end
	builder_interface0_bank_bus_dat_r <= 1'd0;
	if (builder_csrbank0_sel) begin
		case (builder_interface0_bank_bus_adr[3:0])
			1'd0: begin
				builder_interface0_bank_bus_dat_r <= builder_csrbank0_reset0_w;
			end
			1'd1: begin
				builder_interface0_bank_bus_dat_r <= builder_csrbank0_scratch3_w;
			end
			2'd2: begin
				builder_interface0_bank_bus_dat_r <= builder_csrbank0_scratch2_w;
			end
			2'd3: begin
				builder_interface0_bank_bus_dat_r <= builder_csrbank0_scratch1_w;
			end
			3'd4: begin
				builder_interface0_bank_bus_dat_r <= builder_csrbank0_scratch0_w;
			end
			3'd5: begin
				builder_interface0_bank_bus_dat_r <= builder_csrbank0_bus_errors3_w;
			end
			3'd6: begin
				builder_interface0_bank_bus_dat_r <= builder_csrbank0_bus_errors2_w;
			end
			3'd7: begin
				builder_interface0_bank_bus_dat_r <= builder_csrbank0_bus_errors1_w;
			end
			4'd8: begin
				builder_interface0_bank_bus_dat_r <= builder_csrbank0_bus_errors0_w;
			end
		endcase
	end
	if (builder_csrbank0_reset0_re) begin
		main_basesoc_soccontroller_reset_storage <= builder_csrbank0_reset0_r;
	end
	main_basesoc_soccontroller_reset_re <= builder_csrbank0_reset0_re;
	if (builder_csrbank0_scratch3_re) begin
		main_basesoc_soccontroller_scratch_storage[31:24] <= builder_csrbank0_scratch3_r;
	end
	if (builder_csrbank0_scratch2_re) begin
		main_basesoc_soccontroller_scratch_storage[23:16] <= builder_csrbank0_scratch2_r;
	end
	if (builder_csrbank0_scratch1_re) begin
		main_basesoc_soccontroller_scratch_storage[15:8] <= builder_csrbank0_scratch1_r;
	end
	if (builder_csrbank0_scratch0_re) begin
		main_basesoc_soccontroller_scratch_storage[7:0] <= builder_csrbank0_scratch0_r;
	end
	main_basesoc_soccontroller_scratch_re <= builder_csrbank0_scratch0_re;
	builder_interface1_bank_bus_dat_r <= 1'd0;
	if (builder_csrbank1_sel) begin
		case (builder_interface1_bank_bus_adr[3:0])
			1'd0: begin
				builder_interface1_bank_bus_dat_r <= builder_csrbank1_half_sys8x_taps0_w;
			end
			1'd1: begin
				builder_interface1_bank_bus_dat_r <= builder_csrbank1_wlevel_en0_w;
			end
			2'd2: begin
				builder_interface1_bank_bus_dat_r <= main_a7ddrphy_wlevel_strobe_w;
			end
			2'd3: begin
				builder_interface1_bank_bus_dat_r <= main_a7ddrphy_cdly_rst_w;
			end
			3'd4: begin
				builder_interface1_bank_bus_dat_r <= main_a7ddrphy_cdly_inc_w;
			end
			3'd5: begin
				builder_interface1_bank_bus_dat_r <= builder_csrbank1_dly_sel0_w;
			end
			3'd6: begin
				builder_interface1_bank_bus_dat_r <= main_a7ddrphy_rdly_dq_rst_w;
			end
			3'd7: begin
				builder_interface1_bank_bus_dat_r <= main_a7ddrphy_rdly_dq_inc_w;
			end
			4'd8: begin
				builder_interface1_bank_bus_dat_r <= main_a7ddrphy_rdly_dq_bitslip_rst_w;
			end
			4'd9: begin
				builder_interface1_bank_bus_dat_r <= main_a7ddrphy_rdly_dq_bitslip_w;
			end
		endcase
	end
	if (builder_csrbank1_half_sys8x_taps0_re) begin
		main_a7ddrphy_half_sys8x_taps_storage[4:0] <= builder_csrbank1_half_sys8x_taps0_r;
	end
	main_a7ddrphy_half_sys8x_taps_re <= builder_csrbank1_half_sys8x_taps0_re;
	if (builder_csrbank1_wlevel_en0_re) begin
		main_a7ddrphy_wlevel_en_storage <= builder_csrbank1_wlevel_en0_r;
	end
	main_a7ddrphy_wlevel_en_re <= builder_csrbank1_wlevel_en0_re;
	if (builder_csrbank1_dly_sel0_re) begin
		main_a7ddrphy_dly_sel_storage[1:0] <= builder_csrbank1_dly_sel0_r;
	end
	main_a7ddrphy_dly_sel_re <= builder_csrbank1_dly_sel0_re;
	builder_interface2_bank_bus_dat_r <= 1'd0;
	if (builder_csrbank2_sel) begin
		case (builder_interface2_bank_bus_adr[5:0])
			1'd0: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_control0_w;
			end
			1'd1: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi0_command0_w;
			end
			2'd2: begin
				builder_interface2_bank_bus_dat_r <= main_sdram_phaseinjector0_command_issue_w;
			end
			2'd3: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi0_address1_w;
			end
			3'd4: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi0_address0_w;
			end
			3'd5: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi0_baddress0_w;
			end
			3'd6: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi0_wrdata3_w;
			end
			3'd7: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi0_wrdata2_w;
			end
			4'd8: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi0_wrdata1_w;
			end
			4'd9: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi0_wrdata0_w;
			end
			4'd10: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi0_rddata3_w;
			end
			4'd11: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi0_rddata2_w;
			end
			4'd12: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi0_rddata1_w;
			end
			4'd13: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi0_rddata0_w;
			end
			4'd14: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi1_command0_w;
			end
			4'd15: begin
				builder_interface2_bank_bus_dat_r <= main_sdram_phaseinjector1_command_issue_w;
			end
			5'd16: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi1_address1_w;
			end
			5'd17: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi1_address0_w;
			end
			5'd18: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi1_baddress0_w;
			end
			5'd19: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi1_wrdata3_w;
			end
			5'd20: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi1_wrdata2_w;
			end
			5'd21: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi1_wrdata1_w;
			end
			5'd22: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi1_wrdata0_w;
			end
			5'd23: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi1_rddata3_w;
			end
			5'd24: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi1_rddata2_w;
			end
			5'd25: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi1_rddata1_w;
			end
			5'd26: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi1_rddata0_w;
			end
			5'd27: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi2_command0_w;
			end
			5'd28: begin
				builder_interface2_bank_bus_dat_r <= main_sdram_phaseinjector2_command_issue_w;
			end
			5'd29: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi2_address1_w;
			end
			5'd30: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi2_address0_w;
			end
			5'd31: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi2_baddress0_w;
			end
			6'd32: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi2_wrdata3_w;
			end
			6'd33: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi2_wrdata2_w;
			end
			6'd34: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi2_wrdata1_w;
			end
			6'd35: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi2_wrdata0_w;
			end
			6'd36: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi2_rddata3_w;
			end
			6'd37: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi2_rddata2_w;
			end
			6'd38: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi2_rddata1_w;
			end
			6'd39: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi2_rddata0_w;
			end
			6'd40: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi3_command0_w;
			end
			6'd41: begin
				builder_interface2_bank_bus_dat_r <= main_sdram_phaseinjector3_command_issue_w;
			end
			6'd42: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi3_address1_w;
			end
			6'd43: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi3_address0_w;
			end
			6'd44: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi3_baddress0_w;
			end
			6'd45: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi3_wrdata3_w;
			end
			6'd46: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi3_wrdata2_w;
			end
			6'd47: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi3_wrdata1_w;
			end
			6'd48: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi3_wrdata0_w;
			end
			6'd49: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi3_rddata3_w;
			end
			6'd50: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi3_rddata2_w;
			end
			6'd51: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi3_rddata1_w;
			end
			6'd52: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_dfii_pi3_rddata0_w;
			end
		endcase
	end
	if (builder_csrbank2_dfii_control0_re) begin
		main_sdram_storage[3:0] <= builder_csrbank2_dfii_control0_r;
	end
	main_sdram_re <= builder_csrbank2_dfii_control0_re;
	if (builder_csrbank2_dfii_pi0_command0_re) begin
		main_sdram_phaseinjector0_command_storage[5:0] <= builder_csrbank2_dfii_pi0_command0_r;
	end
	main_sdram_phaseinjector0_command_re <= builder_csrbank2_dfii_pi0_command0_re;
	if (builder_csrbank2_dfii_pi0_address1_re) begin
		main_sdram_phaseinjector0_address_storage[13:8] <= builder_csrbank2_dfii_pi0_address1_r;
	end
	if (builder_csrbank2_dfii_pi0_address0_re) begin
		main_sdram_phaseinjector0_address_storage[7:0] <= builder_csrbank2_dfii_pi0_address0_r;
	end
	main_sdram_phaseinjector0_address_re <= builder_csrbank2_dfii_pi0_address0_re;
	if (builder_csrbank2_dfii_pi0_baddress0_re) begin
		main_sdram_phaseinjector0_baddress_storage[2:0] <= builder_csrbank2_dfii_pi0_baddress0_r;
	end
	main_sdram_phaseinjector0_baddress_re <= builder_csrbank2_dfii_pi0_baddress0_re;
	if (builder_csrbank2_dfii_pi0_wrdata3_re) begin
		main_sdram_phaseinjector0_wrdata_storage[31:24] <= builder_csrbank2_dfii_pi0_wrdata3_r;
	end
	if (builder_csrbank2_dfii_pi0_wrdata2_re) begin
		main_sdram_phaseinjector0_wrdata_storage[23:16] <= builder_csrbank2_dfii_pi0_wrdata2_r;
	end
	if (builder_csrbank2_dfii_pi0_wrdata1_re) begin
		main_sdram_phaseinjector0_wrdata_storage[15:8] <= builder_csrbank2_dfii_pi0_wrdata1_r;
	end
	if (builder_csrbank2_dfii_pi0_wrdata0_re) begin
		main_sdram_phaseinjector0_wrdata_storage[7:0] <= builder_csrbank2_dfii_pi0_wrdata0_r;
	end
	main_sdram_phaseinjector0_wrdata_re <= builder_csrbank2_dfii_pi0_wrdata0_re;
	if (builder_csrbank2_dfii_pi1_command0_re) begin
		main_sdram_phaseinjector1_command_storage[5:0] <= builder_csrbank2_dfii_pi1_command0_r;
	end
	main_sdram_phaseinjector1_command_re <= builder_csrbank2_dfii_pi1_command0_re;
	if (builder_csrbank2_dfii_pi1_address1_re) begin
		main_sdram_phaseinjector1_address_storage[13:8] <= builder_csrbank2_dfii_pi1_address1_r;
	end
	if (builder_csrbank2_dfii_pi1_address0_re) begin
		main_sdram_phaseinjector1_address_storage[7:0] <= builder_csrbank2_dfii_pi1_address0_r;
	end
	main_sdram_phaseinjector1_address_re <= builder_csrbank2_dfii_pi1_address0_re;
	if (builder_csrbank2_dfii_pi1_baddress0_re) begin
		main_sdram_phaseinjector1_baddress_storage[2:0] <= builder_csrbank2_dfii_pi1_baddress0_r;
	end
	main_sdram_phaseinjector1_baddress_re <= builder_csrbank2_dfii_pi1_baddress0_re;
	if (builder_csrbank2_dfii_pi1_wrdata3_re) begin
		main_sdram_phaseinjector1_wrdata_storage[31:24] <= builder_csrbank2_dfii_pi1_wrdata3_r;
	end
	if (builder_csrbank2_dfii_pi1_wrdata2_re) begin
		main_sdram_phaseinjector1_wrdata_storage[23:16] <= builder_csrbank2_dfii_pi1_wrdata2_r;
	end
	if (builder_csrbank2_dfii_pi1_wrdata1_re) begin
		main_sdram_phaseinjector1_wrdata_storage[15:8] <= builder_csrbank2_dfii_pi1_wrdata1_r;
	end
	if (builder_csrbank2_dfii_pi1_wrdata0_re) begin
		main_sdram_phaseinjector1_wrdata_storage[7:0] <= builder_csrbank2_dfii_pi1_wrdata0_r;
	end
	main_sdram_phaseinjector1_wrdata_re <= builder_csrbank2_dfii_pi1_wrdata0_re;
	if (builder_csrbank2_dfii_pi2_command0_re) begin
		main_sdram_phaseinjector2_command_storage[5:0] <= builder_csrbank2_dfii_pi2_command0_r;
	end
	main_sdram_phaseinjector2_command_re <= builder_csrbank2_dfii_pi2_command0_re;
	if (builder_csrbank2_dfii_pi2_address1_re) begin
		main_sdram_phaseinjector2_address_storage[13:8] <= builder_csrbank2_dfii_pi2_address1_r;
	end
	if (builder_csrbank2_dfii_pi2_address0_re) begin
		main_sdram_phaseinjector2_address_storage[7:0] <= builder_csrbank2_dfii_pi2_address0_r;
	end
	main_sdram_phaseinjector2_address_re <= builder_csrbank2_dfii_pi2_address0_re;
	if (builder_csrbank2_dfii_pi2_baddress0_re) begin
		main_sdram_phaseinjector2_baddress_storage[2:0] <= builder_csrbank2_dfii_pi2_baddress0_r;
	end
	main_sdram_phaseinjector2_baddress_re <= builder_csrbank2_dfii_pi2_baddress0_re;
	if (builder_csrbank2_dfii_pi2_wrdata3_re) begin
		main_sdram_phaseinjector2_wrdata_storage[31:24] <= builder_csrbank2_dfii_pi2_wrdata3_r;
	end
	if (builder_csrbank2_dfii_pi2_wrdata2_re) begin
		main_sdram_phaseinjector2_wrdata_storage[23:16] <= builder_csrbank2_dfii_pi2_wrdata2_r;
	end
	if (builder_csrbank2_dfii_pi2_wrdata1_re) begin
		main_sdram_phaseinjector2_wrdata_storage[15:8] <= builder_csrbank2_dfii_pi2_wrdata1_r;
	end
	if (builder_csrbank2_dfii_pi2_wrdata0_re) begin
		main_sdram_phaseinjector2_wrdata_storage[7:0] <= builder_csrbank2_dfii_pi2_wrdata0_r;
	end
	main_sdram_phaseinjector2_wrdata_re <= builder_csrbank2_dfii_pi2_wrdata0_re;
	if (builder_csrbank2_dfii_pi3_command0_re) begin
		main_sdram_phaseinjector3_command_storage[5:0] <= builder_csrbank2_dfii_pi3_command0_r;
	end
	main_sdram_phaseinjector3_command_re <= builder_csrbank2_dfii_pi3_command0_re;
	if (builder_csrbank2_dfii_pi3_address1_re) begin
		main_sdram_phaseinjector3_address_storage[13:8] <= builder_csrbank2_dfii_pi3_address1_r;
	end
	if (builder_csrbank2_dfii_pi3_address0_re) begin
		main_sdram_phaseinjector3_address_storage[7:0] <= builder_csrbank2_dfii_pi3_address0_r;
	end
	main_sdram_phaseinjector3_address_re <= builder_csrbank2_dfii_pi3_address0_re;
	if (builder_csrbank2_dfii_pi3_baddress0_re) begin
		main_sdram_phaseinjector3_baddress_storage[2:0] <= builder_csrbank2_dfii_pi3_baddress0_r;
	end
	main_sdram_phaseinjector3_baddress_re <= builder_csrbank2_dfii_pi3_baddress0_re;
	if (builder_csrbank2_dfii_pi3_wrdata3_re) begin
		main_sdram_phaseinjector3_wrdata_storage[31:24] <= builder_csrbank2_dfii_pi3_wrdata3_r;
	end
	if (builder_csrbank2_dfii_pi3_wrdata2_re) begin
		main_sdram_phaseinjector3_wrdata_storage[23:16] <= builder_csrbank2_dfii_pi3_wrdata2_r;
	end
	if (builder_csrbank2_dfii_pi3_wrdata1_re) begin
		main_sdram_phaseinjector3_wrdata_storage[15:8] <= builder_csrbank2_dfii_pi3_wrdata1_r;
	end
	if (builder_csrbank2_dfii_pi3_wrdata0_re) begin
		main_sdram_phaseinjector3_wrdata_storage[7:0] <= builder_csrbank2_dfii_pi3_wrdata0_r;
	end
	main_sdram_phaseinjector3_wrdata_re <= builder_csrbank2_dfii_pi3_wrdata0_re;
	builder_interface3_bank_bus_dat_r <= 1'd0;
	if (builder_csrbank3_sel) begin
		case (builder_interface3_bank_bus_adr[4:0])
			1'd0: begin
				builder_interface3_bank_bus_dat_r <= builder_csrbank3_load3_w;
			end
			1'd1: begin
				builder_interface3_bank_bus_dat_r <= builder_csrbank3_load2_w;
			end
			2'd2: begin
				builder_interface3_bank_bus_dat_r <= builder_csrbank3_load1_w;
			end
			2'd3: begin
				builder_interface3_bank_bus_dat_r <= builder_csrbank3_load0_w;
			end
			3'd4: begin
				builder_interface3_bank_bus_dat_r <= builder_csrbank3_reload3_w;
			end
			3'd5: begin
				builder_interface3_bank_bus_dat_r <= builder_csrbank3_reload2_w;
			end
			3'd6: begin
				builder_interface3_bank_bus_dat_r <= builder_csrbank3_reload1_w;
			end
			3'd7: begin
				builder_interface3_bank_bus_dat_r <= builder_csrbank3_reload0_w;
			end
			4'd8: begin
				builder_interface3_bank_bus_dat_r <= builder_csrbank3_en0_w;
			end
			4'd9: begin
				builder_interface3_bank_bus_dat_r <= builder_csrbank3_update_value0_w;
			end
			4'd10: begin
				builder_interface3_bank_bus_dat_r <= builder_csrbank3_value3_w;
			end
			4'd11: begin
				builder_interface3_bank_bus_dat_r <= builder_csrbank3_value2_w;
			end
			4'd12: begin
				builder_interface3_bank_bus_dat_r <= builder_csrbank3_value1_w;
			end
			4'd13: begin
				builder_interface3_bank_bus_dat_r <= builder_csrbank3_value0_w;
			end
			4'd14: begin
				builder_interface3_bank_bus_dat_r <= main_basesoc_timer_eventmanager_status_w;
			end
			4'd15: begin
				builder_interface3_bank_bus_dat_r <= main_basesoc_timer_eventmanager_pending_w;
			end
			5'd16: begin
				builder_interface3_bank_bus_dat_r <= builder_csrbank3_ev_enable0_w;
			end
		endcase
	end
	if (builder_csrbank3_load3_re) begin
		main_basesoc_timer_load_storage[31:24] <= builder_csrbank3_load3_r;
	end
	if (builder_csrbank3_load2_re) begin
		main_basesoc_timer_load_storage[23:16] <= builder_csrbank3_load2_r;
	end
	if (builder_csrbank3_load1_re) begin
		main_basesoc_timer_load_storage[15:8] <= builder_csrbank3_load1_r;
	end
	if (builder_csrbank3_load0_re) begin
		main_basesoc_timer_load_storage[7:0] <= builder_csrbank3_load0_r;
	end
	main_basesoc_timer_load_re <= builder_csrbank3_load0_re;
	if (builder_csrbank3_reload3_re) begin
		main_basesoc_timer_reload_storage[31:24] <= builder_csrbank3_reload3_r;
	end
	if (builder_csrbank3_reload2_re) begin
		main_basesoc_timer_reload_storage[23:16] <= builder_csrbank3_reload2_r;
	end
	if (builder_csrbank3_reload1_re) begin
		main_basesoc_timer_reload_storage[15:8] <= builder_csrbank3_reload1_r;
	end
	if (builder_csrbank3_reload0_re) begin
		main_basesoc_timer_reload_storage[7:0] <= builder_csrbank3_reload0_r;
	end
	main_basesoc_timer_reload_re <= builder_csrbank3_reload0_re;
	if (builder_csrbank3_en0_re) begin
		main_basesoc_timer_en_storage <= builder_csrbank3_en0_r;
	end
	main_basesoc_timer_en_re <= builder_csrbank3_en0_re;
	if (builder_csrbank3_update_value0_re) begin
		main_basesoc_timer_update_value_storage <= builder_csrbank3_update_value0_r;
	end
	main_basesoc_timer_update_value_re <= builder_csrbank3_update_value0_re;
	if (builder_csrbank3_ev_enable0_re) begin
		main_basesoc_timer_eventmanager_storage <= builder_csrbank3_ev_enable0_r;
	end
	main_basesoc_timer_eventmanager_re <= builder_csrbank3_ev_enable0_re;
	builder_interface4_bank_bus_dat_r <= 1'd0;
	if (builder_csrbank4_sel) begin
		case (builder_interface4_bank_bus_adr[2:0])
			1'd0: begin
				builder_interface4_bank_bus_dat_r <= main_basesoc_uart_rxtx_w;
			end
			1'd1: begin
				builder_interface4_bank_bus_dat_r <= builder_csrbank4_txfull_w;
			end
			2'd2: begin
				builder_interface4_bank_bus_dat_r <= builder_csrbank4_rxempty_w;
			end
			2'd3: begin
				builder_interface4_bank_bus_dat_r <= main_basesoc_uart_eventmanager_status_w;
			end
			3'd4: begin
				builder_interface4_bank_bus_dat_r <= main_basesoc_uart_eventmanager_pending_w;
			end
			3'd5: begin
				builder_interface4_bank_bus_dat_r <= builder_csrbank4_ev_enable0_w;
			end
		endcase
	end
	if (builder_csrbank4_ev_enable0_re) begin
		main_basesoc_uart_eventmanager_storage[1:0] <= builder_csrbank4_ev_enable0_r;
	end
	main_basesoc_uart_eventmanager_re <= builder_csrbank4_ev_enable0_re;
	builder_interface5_bank_bus_dat_r <= 1'd0;
	if (builder_csrbank5_sel) begin
		case (builder_interface5_bank_bus_adr[1:0])
			1'd0: begin
				builder_interface5_bank_bus_dat_r <= builder_csrbank5_tuning_word3_w;
			end
			1'd1: begin
				builder_interface5_bank_bus_dat_r <= builder_csrbank5_tuning_word2_w;
			end
			2'd2: begin
				builder_interface5_bank_bus_dat_r <= builder_csrbank5_tuning_word1_w;
			end
			2'd3: begin
				builder_interface5_bank_bus_dat_r <= builder_csrbank5_tuning_word0_w;
			end
		endcase
	end
	if (builder_csrbank5_tuning_word3_re) begin
		main_basesoc_storage[31:24] <= builder_csrbank5_tuning_word3_r;
	end
	if (builder_csrbank5_tuning_word2_re) begin
		main_basesoc_storage[23:16] <= builder_csrbank5_tuning_word2_r;
	end
	if (builder_csrbank5_tuning_word1_re) begin
		main_basesoc_storage[15:8] <= builder_csrbank5_tuning_word1_r;
	end
	if (builder_csrbank5_tuning_word0_re) begin
		main_basesoc_storage[7:0] <= builder_csrbank5_tuning_word0_r;
	end
	main_basesoc_re <= builder_csrbank5_tuning_word0_re;
	if (sys_rst) begin
		main_basesoc_soccontroller_reset_storage <= 1'd0;
		main_basesoc_soccontroller_reset_re <= 1'd0;
		main_basesoc_soccontroller_scratch_storage <= 32'd305419896;
		main_basesoc_soccontroller_scratch_re <= 1'd0;
		main_basesoc_soccontroller_bus_errors <= 32'd0;
		main_basesoc_basesoc_ram_bus_ack <= 1'd0;
		main_basesoc_ram_bus_ram_bus_ack <= 1'd0;
		serial_tx <= 1'd1;
		main_basesoc_storage <= 32'd42949672;
		main_basesoc_re <= 1'd0;
		main_basesoc_sink_ready <= 1'd0;
		main_basesoc_uart_clk_txen <= 1'd0;
		main_basesoc_tx_busy <= 1'd0;
		main_basesoc_source_valid <= 1'd0;
		main_basesoc_uart_clk_rxen <= 1'd0;
		main_basesoc_rx_r <= 1'd0;
		main_basesoc_rx_busy <= 1'd0;
		main_basesoc_uart_tx_pending <= 1'd0;
		main_basesoc_uart_tx_old_trigger <= 1'd0;
		main_basesoc_uart_rx_pending <= 1'd0;
		main_basesoc_uart_rx_old_trigger <= 1'd0;
		main_basesoc_uart_eventmanager_storage <= 2'd0;
		main_basesoc_uart_eventmanager_re <= 1'd0;
		main_basesoc_uart_tx_fifo_readable <= 1'd0;
		main_basesoc_uart_tx_fifo_level0 <= 5'd0;
		main_basesoc_uart_tx_fifo_produce <= 4'd0;
		main_basesoc_uart_tx_fifo_consume <= 4'd0;
		main_basesoc_uart_rx_fifo_readable <= 1'd0;
		main_basesoc_uart_rx_fifo_level0 <= 5'd0;
		main_basesoc_uart_rx_fifo_produce <= 4'd0;
		main_basesoc_uart_rx_fifo_consume <= 4'd0;
		main_basesoc_timer_load_storage <= 32'd0;
		main_basesoc_timer_load_re <= 1'd0;
		main_basesoc_timer_reload_storage <= 32'd0;
		main_basesoc_timer_reload_re <= 1'd0;
		main_basesoc_timer_en_storage <= 1'd0;
		main_basesoc_timer_en_re <= 1'd0;
		main_basesoc_timer_update_value_storage <= 1'd0;
		main_basesoc_timer_update_value_re <= 1'd0;
		main_basesoc_timer_value_status <= 32'd0;
		main_basesoc_timer_zero_pending <= 1'd0;
		main_basesoc_timer_zero_old_trigger <= 1'd0;
		main_basesoc_timer_eventmanager_storage <= 1'd0;
		main_basesoc_timer_eventmanager_re <= 1'd0;
		main_basesoc_timer_value <= 32'd0;
		main_a7ddrphy_half_sys8x_taps_storage <= 5'd8;
		main_a7ddrphy_half_sys8x_taps_re <= 1'd0;
		main_a7ddrphy_wlevel_en_storage <= 1'd0;
		main_a7ddrphy_wlevel_en_re <= 1'd0;
		main_a7ddrphy_dly_sel_storage <= 2'd0;
		main_a7ddrphy_dly_sel_re <= 1'd0;
		main_a7ddrphy_dfi_p0_rddata_valid <= 1'd0;
		main_a7ddrphy_dfi_p1_rddata_valid <= 1'd0;
		main_a7ddrphy_dfi_p2_rddata_valid <= 1'd0;
		main_a7ddrphy_dfi_p3_rddata_valid <= 1'd0;
		main_a7ddrphy_dqs_oe_delayed <= 1'd0;
		main_a7ddrphy_dqspattern_o1 <= 8'd0;
		main_a7ddrphy_dq_oe_delayed <= 1'd0;
		main_a7ddrphy_bitslip0_value <= 3'd0;
		main_a7ddrphy_bitslip1_value <= 3'd0;
		main_a7ddrphy_bitslip2_value <= 3'd0;
		main_a7ddrphy_bitslip3_value <= 3'd0;
		main_a7ddrphy_bitslip4_value <= 3'd0;
		main_a7ddrphy_bitslip5_value <= 3'd0;
		main_a7ddrphy_bitslip6_value <= 3'd0;
		main_a7ddrphy_bitslip7_value <= 3'd0;
		main_a7ddrphy_bitslip8_value <= 3'd0;
		main_a7ddrphy_bitslip9_value <= 3'd0;
		main_a7ddrphy_bitslip10_value <= 3'd0;
		main_a7ddrphy_bitslip11_value <= 3'd0;
		main_a7ddrphy_bitslip12_value <= 3'd0;
		main_a7ddrphy_bitslip13_value <= 3'd0;
		main_a7ddrphy_bitslip14_value <= 3'd0;
		main_a7ddrphy_bitslip15_value <= 3'd0;
		main_a7ddrphy_rddata_en_last <= 7'd0;
		main_a7ddrphy_wrdata_en_last <= 4'd0;
		main_sdram_storage <= 4'd0;
		main_sdram_re <= 1'd0;
		main_sdram_phaseinjector0_command_storage <= 6'd0;
		main_sdram_phaseinjector0_command_re <= 1'd0;
		main_sdram_phaseinjector0_address_re <= 1'd0;
		main_sdram_phaseinjector0_baddress_re <= 1'd0;
		main_sdram_phaseinjector0_wrdata_re <= 1'd0;
		main_sdram_phaseinjector0_status <= 32'd0;
		main_sdram_phaseinjector1_command_storage <= 6'd0;
		main_sdram_phaseinjector1_command_re <= 1'd0;
		main_sdram_phaseinjector1_address_re <= 1'd0;
		main_sdram_phaseinjector1_baddress_re <= 1'd0;
		main_sdram_phaseinjector1_wrdata_re <= 1'd0;
		main_sdram_phaseinjector1_status <= 32'd0;
		main_sdram_phaseinjector2_command_storage <= 6'd0;
		main_sdram_phaseinjector2_command_re <= 1'd0;
		main_sdram_phaseinjector2_address_re <= 1'd0;
		main_sdram_phaseinjector2_baddress_re <= 1'd0;
		main_sdram_phaseinjector2_wrdata_re <= 1'd0;
		main_sdram_phaseinjector2_status <= 32'd0;
		main_sdram_phaseinjector3_command_storage <= 6'd0;
		main_sdram_phaseinjector3_command_re <= 1'd0;
		main_sdram_phaseinjector3_address_re <= 1'd0;
		main_sdram_phaseinjector3_baddress_re <= 1'd0;
		main_sdram_phaseinjector3_wrdata_re <= 1'd0;
		main_sdram_phaseinjector3_status <= 32'd0;
		main_sdram_dfi_p0_address <= 14'd0;
		main_sdram_dfi_p0_bank <= 3'd0;
		main_sdram_dfi_p0_cas_n <= 1'd1;
		main_sdram_dfi_p0_cs_n <= 1'd1;
		main_sdram_dfi_p0_ras_n <= 1'd1;
		main_sdram_dfi_p0_we_n <= 1'd1;
		main_sdram_dfi_p0_wrdata_en <= 1'd0;
		main_sdram_dfi_p0_rddata_en <= 1'd0;
		main_sdram_dfi_p1_address <= 14'd0;
		main_sdram_dfi_p1_bank <= 3'd0;
		main_sdram_dfi_p1_cas_n <= 1'd1;
		main_sdram_dfi_p1_cs_n <= 1'd1;
		main_sdram_dfi_p1_ras_n <= 1'd1;
		main_sdram_dfi_p1_we_n <= 1'd1;
		main_sdram_dfi_p1_wrdata_en <= 1'd0;
		main_sdram_dfi_p1_rddata_en <= 1'd0;
		main_sdram_dfi_p2_address <= 14'd0;
		main_sdram_dfi_p2_bank <= 3'd0;
		main_sdram_dfi_p2_cas_n <= 1'd1;
		main_sdram_dfi_p2_cs_n <= 1'd1;
		main_sdram_dfi_p2_ras_n <= 1'd1;
		main_sdram_dfi_p2_we_n <= 1'd1;
		main_sdram_dfi_p2_wrdata_en <= 1'd0;
		main_sdram_dfi_p2_rddata_en <= 1'd0;
		main_sdram_dfi_p3_address <= 14'd0;
		main_sdram_dfi_p3_bank <= 3'd0;
		main_sdram_dfi_p3_cas_n <= 1'd1;
		main_sdram_dfi_p3_cs_n <= 1'd1;
		main_sdram_dfi_p3_ras_n <= 1'd1;
		main_sdram_dfi_p3_we_n <= 1'd1;
		main_sdram_dfi_p3_wrdata_en <= 1'd0;
		main_sdram_dfi_p3_rddata_en <= 1'd0;
		main_sdram_timer_count1 <= 10'd781;
		main_sdram_postponer_req_o <= 1'd0;
		main_sdram_postponer_count <= 1'd0;
		main_sdram_sequencer_done1 <= 1'd0;
		main_sdram_sequencer_counter <= 6'd0;
		main_sdram_sequencer_count <= 1'd0;
		main_sdram_zqcs_timer_count1 <= 27'd99999999;
		main_sdram_zqcs_executer_done <= 1'd0;
		main_sdram_zqcs_executer_counter <= 5'd0;
		main_sdram_bankmachine0_cmd_buffer_lookahead_level <= 4'd0;
		main_sdram_bankmachine0_cmd_buffer_lookahead_produce <= 3'd0;
		main_sdram_bankmachine0_cmd_buffer_lookahead_consume <= 3'd0;
		main_sdram_bankmachine0_cmd_buffer_source_valid <= 1'd0;
		main_sdram_bankmachine0_row <= 14'd0;
		main_sdram_bankmachine0_row_opened <= 1'd0;
		main_sdram_bankmachine0_twtpcon_ready <= 1'd1;
		main_sdram_bankmachine0_twtpcon_count <= 3'd0;
		main_sdram_bankmachine0_trccon_ready <= 1'd1;
		main_sdram_bankmachine0_trccon_count <= 3'd0;
		main_sdram_bankmachine0_trascon_ready <= 1'd1;
		main_sdram_bankmachine0_trascon_count <= 3'd0;
		main_sdram_bankmachine1_cmd_buffer_lookahead_level <= 4'd0;
		main_sdram_bankmachine1_cmd_buffer_lookahead_produce <= 3'd0;
		main_sdram_bankmachine1_cmd_buffer_lookahead_consume <= 3'd0;
		main_sdram_bankmachine1_cmd_buffer_source_valid <= 1'd0;
		main_sdram_bankmachine1_row <= 14'd0;
		main_sdram_bankmachine1_row_opened <= 1'd0;
		main_sdram_bankmachine1_twtpcon_ready <= 1'd1;
		main_sdram_bankmachine1_twtpcon_count <= 3'd0;
		main_sdram_bankmachine1_trccon_ready <= 1'd1;
		main_sdram_bankmachine1_trccon_count <= 3'd0;
		main_sdram_bankmachine1_trascon_ready <= 1'd1;
		main_sdram_bankmachine1_trascon_count <= 3'd0;
		main_sdram_bankmachine2_cmd_buffer_lookahead_level <= 4'd0;
		main_sdram_bankmachine2_cmd_buffer_lookahead_produce <= 3'd0;
		main_sdram_bankmachine2_cmd_buffer_lookahead_consume <= 3'd0;
		main_sdram_bankmachine2_cmd_buffer_source_valid <= 1'd0;
		main_sdram_bankmachine2_row <= 14'd0;
		main_sdram_bankmachine2_row_opened <= 1'd0;
		main_sdram_bankmachine2_twtpcon_ready <= 1'd1;
		main_sdram_bankmachine2_twtpcon_count <= 3'd0;
		main_sdram_bankmachine2_trccon_ready <= 1'd1;
		main_sdram_bankmachine2_trccon_count <= 3'd0;
		main_sdram_bankmachine2_trascon_ready <= 1'd1;
		main_sdram_bankmachine2_trascon_count <= 3'd0;
		main_sdram_bankmachine3_cmd_buffer_lookahead_level <= 4'd0;
		main_sdram_bankmachine3_cmd_buffer_lookahead_produce <= 3'd0;
		main_sdram_bankmachine3_cmd_buffer_lookahead_consume <= 3'd0;
		main_sdram_bankmachine3_cmd_buffer_source_valid <= 1'd0;
		main_sdram_bankmachine3_row <= 14'd0;
		main_sdram_bankmachine3_row_opened <= 1'd0;
		main_sdram_bankmachine3_twtpcon_ready <= 1'd1;
		main_sdram_bankmachine3_twtpcon_count <= 3'd0;
		main_sdram_bankmachine3_trccon_ready <= 1'd1;
		main_sdram_bankmachine3_trccon_count <= 3'd0;
		main_sdram_bankmachine3_trascon_ready <= 1'd1;
		main_sdram_bankmachine3_trascon_count <= 3'd0;
		main_sdram_bankmachine4_cmd_buffer_lookahead_level <= 4'd0;
		main_sdram_bankmachine4_cmd_buffer_lookahead_produce <= 3'd0;
		main_sdram_bankmachine4_cmd_buffer_lookahead_consume <= 3'd0;
		main_sdram_bankmachine4_cmd_buffer_source_valid <= 1'd0;
		main_sdram_bankmachine4_row <= 14'd0;
		main_sdram_bankmachine4_row_opened <= 1'd0;
		main_sdram_bankmachine4_twtpcon_ready <= 1'd1;
		main_sdram_bankmachine4_twtpcon_count <= 3'd0;
		main_sdram_bankmachine4_trccon_ready <= 1'd1;
		main_sdram_bankmachine4_trccon_count <= 3'd0;
		main_sdram_bankmachine4_trascon_ready <= 1'd1;
		main_sdram_bankmachine4_trascon_count <= 3'd0;
		main_sdram_bankmachine5_cmd_buffer_lookahead_level <= 4'd0;
		main_sdram_bankmachine5_cmd_buffer_lookahead_produce <= 3'd0;
		main_sdram_bankmachine5_cmd_buffer_lookahead_consume <= 3'd0;
		main_sdram_bankmachine5_cmd_buffer_source_valid <= 1'd0;
		main_sdram_bankmachine5_row <= 14'd0;
		main_sdram_bankmachine5_row_opened <= 1'd0;
		main_sdram_bankmachine5_twtpcon_ready <= 1'd1;
		main_sdram_bankmachine5_twtpcon_count <= 3'd0;
		main_sdram_bankmachine5_trccon_ready <= 1'd1;
		main_sdram_bankmachine5_trccon_count <= 3'd0;
		main_sdram_bankmachine5_trascon_ready <= 1'd1;
		main_sdram_bankmachine5_trascon_count <= 3'd0;
		main_sdram_bankmachine6_cmd_buffer_lookahead_level <= 4'd0;
		main_sdram_bankmachine6_cmd_buffer_lookahead_produce <= 3'd0;
		main_sdram_bankmachine6_cmd_buffer_lookahead_consume <= 3'd0;
		main_sdram_bankmachine6_cmd_buffer_source_valid <= 1'd0;
		main_sdram_bankmachine6_row <= 14'd0;
		main_sdram_bankmachine6_row_opened <= 1'd0;
		main_sdram_bankmachine6_twtpcon_ready <= 1'd1;
		main_sdram_bankmachine6_twtpcon_count <= 3'd0;
		main_sdram_bankmachine6_trccon_ready <= 1'd1;
		main_sdram_bankmachine6_trccon_count <= 3'd0;
		main_sdram_bankmachine6_trascon_ready <= 1'd1;
		main_sdram_bankmachine6_trascon_count <= 3'd0;
		main_sdram_bankmachine7_cmd_buffer_lookahead_level <= 4'd0;
		main_sdram_bankmachine7_cmd_buffer_lookahead_produce <= 3'd0;
		main_sdram_bankmachine7_cmd_buffer_lookahead_consume <= 3'd0;
		main_sdram_bankmachine7_cmd_buffer_source_valid <= 1'd0;
		main_sdram_bankmachine7_row <= 14'd0;
		main_sdram_bankmachine7_row_opened <= 1'd0;
		main_sdram_bankmachine7_twtpcon_ready <= 1'd1;
		main_sdram_bankmachine7_twtpcon_count <= 3'd0;
		main_sdram_bankmachine7_trccon_ready <= 1'd1;
		main_sdram_bankmachine7_trccon_count <= 3'd0;
		main_sdram_bankmachine7_trascon_ready <= 1'd1;
		main_sdram_bankmachine7_trascon_count <= 3'd0;
		main_sdram_choose_cmd_grant <= 3'd0;
		main_sdram_choose_req_grant <= 3'd0;
		main_sdram_trrdcon_ready <= 1'd1;
		main_sdram_trrdcon_count <= 1'd0;
		main_sdram_tfawcon_ready <= 1'd1;
		main_sdram_tfawcon_window <= 5'd0;
		main_sdram_tccdcon_ready <= 1'd1;
		main_sdram_tccdcon_count <= 1'd0;
		main_sdram_twtrcon_ready <= 1'd1;
		main_sdram_twtrcon_count <= 3'd0;
		main_sdram_time0 <= 5'd0;
		main_sdram_time1 <= 4'd0;
		builder_state <= 1'd0;
		builder_refresher_state <= 2'd0;
		builder_bankmachine0_state <= 4'd0;
		builder_bankmachine1_state <= 4'd0;
		builder_bankmachine2_state <= 4'd0;
		builder_bankmachine3_state <= 4'd0;
		builder_bankmachine4_state <= 4'd0;
		builder_bankmachine5_state <= 4'd0;
		builder_bankmachine6_state <= 4'd0;
		builder_bankmachine7_state <= 4'd0;
		builder_multiplexer_state <= 4'd0;
		builder_roundrobin0_grant <= 1'd0;
		builder_roundrobin1_grant <= 1'd0;
		builder_roundrobin2_grant <= 1'd0;
		builder_roundrobin3_grant <= 1'd0;
		builder_roundrobin4_grant <= 1'd0;
		builder_roundrobin5_grant <= 1'd0;
		builder_roundrobin6_grant <= 1'd0;
		builder_roundrobin7_grant <= 1'd0;
		builder_new_master_wdata_ready0 <= 1'd0;
		builder_new_master_wdata_ready1 <= 1'd0;
		builder_new_master_wdata_ready2 <= 1'd0;
		builder_new_master_wdata_ready3 <= 1'd0;
		builder_new_master_wdata_ready4 <= 1'd0;
		builder_new_master_wdata_ready5 <= 1'd0;
		builder_new_master_rdata_valid0 <= 1'd0;
		builder_new_master_rdata_valid1 <= 1'd0;
		builder_new_master_rdata_valid2 <= 1'd0;
		builder_new_master_rdata_valid3 <= 1'd0;
		builder_new_master_rdata_valid4 <= 1'd0;
		builder_new_master_rdata_valid5 <= 1'd0;
		builder_new_master_rdata_valid6 <= 1'd0;
		builder_new_master_rdata_valid7 <= 1'd0;
		builder_new_master_rdata_valid8 <= 1'd0;
		builder_new_master_rdata_valid9 <= 1'd0;
		builder_new_master_rdata_valid10 <= 1'd0;
		builder_new_master_rdata_valid11 <= 1'd0;
		builder_new_master_rdata_valid12 <= 1'd0;
		builder_new_master_rdata_valid13 <= 1'd0;
		builder_new_master_rdata_valid14 <= 1'd0;
		builder_new_master_rdata_valid15 <= 1'd0;
		builder_slave_sel_r <= 4'd0;
		builder_count <= 20'd1000000;
	end
	builder_regs0 <= serial_rx;
	builder_regs1 <= builder_regs0;
end
always @(posedge sys2x_clk) begin
	main_a7ddrphy_dq_i_data0[3:0] <= main_a7ddrphy_dq_i_data0[7:4];
	main_a7ddrphy_dq_i_data0[7:4] <= main_a7ddrphy_dq_i_data_sys2x0;
	main_a7ddrphy_dq_i_data1[3:0] <= main_a7ddrphy_dq_i_data1[7:4];
	main_a7ddrphy_dq_i_data1[7:4] <= main_a7ddrphy_dq_i_data_sys2x1;
	main_a7ddrphy_dq_i_data2[3:0] <= main_a7ddrphy_dq_i_data2[7:4];
	main_a7ddrphy_dq_i_data2[7:4] <= main_a7ddrphy_dq_i_data_sys2x2;
	main_a7ddrphy_dq_i_data3[3:0] <= main_a7ddrphy_dq_i_data3[7:4];
	main_a7ddrphy_dq_i_data3[7:4] <= main_a7ddrphy_dq_i_data_sys2x3;
	main_a7ddrphy_dq_i_data4[3:0] <= main_a7ddrphy_dq_i_data4[7:4];
	main_a7ddrphy_dq_i_data4[7:4] <= main_a7ddrphy_dq_i_data_sys2x4;
	main_a7ddrphy_dq_i_data5[3:0] <= main_a7ddrphy_dq_i_data5[7:4];
	main_a7ddrphy_dq_i_data5[7:4] <= main_a7ddrphy_dq_i_data_sys2x5;
	main_a7ddrphy_dq_i_data6[3:0] <= main_a7ddrphy_dq_i_data6[7:4];
	main_a7ddrphy_dq_i_data6[7:4] <= main_a7ddrphy_dq_i_data_sys2x6;
	main_a7ddrphy_dq_i_data7[3:0] <= main_a7ddrphy_dq_i_data7[7:4];
	main_a7ddrphy_dq_i_data7[7:4] <= main_a7ddrphy_dq_i_data_sys2x7;
	main_a7ddrphy_dq_i_data8[3:0] <= main_a7ddrphy_dq_i_data8[7:4];
	main_a7ddrphy_dq_i_data8[7:4] <= main_a7ddrphy_dq_i_data_sys2x8;
	main_a7ddrphy_dq_i_data9[3:0] <= main_a7ddrphy_dq_i_data9[7:4];
	main_a7ddrphy_dq_i_data9[7:4] <= main_a7ddrphy_dq_i_data_sys2x9;
	main_a7ddrphy_dq_i_data10[3:0] <= main_a7ddrphy_dq_i_data10[7:4];
	main_a7ddrphy_dq_i_data10[7:4] <= main_a7ddrphy_dq_i_data_sys2x10;
	main_a7ddrphy_dq_i_data11[3:0] <= main_a7ddrphy_dq_i_data11[7:4];
	main_a7ddrphy_dq_i_data11[7:4] <= main_a7ddrphy_dq_i_data_sys2x11;
	main_a7ddrphy_dq_i_data12[3:0] <= main_a7ddrphy_dq_i_data12[7:4];
	main_a7ddrphy_dq_i_data12[7:4] <= main_a7ddrphy_dq_i_data_sys2x12;
	main_a7ddrphy_dq_i_data13[3:0] <= main_a7ddrphy_dq_i_data13[7:4];
	main_a7ddrphy_dq_i_data13[7:4] <= main_a7ddrphy_dq_i_data_sys2x13;
	main_a7ddrphy_dq_i_data14[3:0] <= main_a7ddrphy_dq_i_data14[7:4];
	main_a7ddrphy_dq_i_data14[7:4] <= main_a7ddrphy_dq_i_data_sys2x14;
	main_a7ddrphy_dq_i_data15[3:0] <= main_a7ddrphy_dq_i_data15[7:4];
	main_a7ddrphy_dq_i_data15[7:4] <= main_a7ddrphy_dq_i_data_sys2x15;
end
reg [31:0] mem[0:8191];
reg [31:0] memdat;
always @(posedge sys_clk) begin
	memdat <= mem[main_basesoc_basesoc_adr];
end
assign main_basesoc_basesoc_dat_r = memdat;
initial begin
	$readmemh("mem.init", mem);
end
reg [31:0] mem_1[0:1023];
reg [9:0] memadr;
always @(posedge sys_clk) begin
	if (main_basesoc_ram_we[0])
		mem_1[main_basesoc_ram_adr][7:0] <= main_basesoc_ram_dat_w[7:0];
	if (main_basesoc_ram_we[1])
		mem_1[main_basesoc_ram_adr][15:8] <= main_basesoc_ram_dat_w[15:8];
	if (main_basesoc_ram_we[2])
		mem_1[main_basesoc_ram_adr][23:16] <= main_basesoc_ram_dat_w[23:16];
	if (main_basesoc_ram_we[3])
		mem_1[main_basesoc_ram_adr][31:24] <= main_basesoc_ram_dat_w[31:24];
	memadr <= main_basesoc_ram_adr;
end
assign main_basesoc_ram_dat_r = mem_1[memadr];
initial begin
	$readmemh("mem_1.init", mem_1);
end
reg [9:0] storage[0:15];
reg [9:0] memdat_1;
reg [9:0] memdat_2;
always @(posedge sys_clk) begin
	if (main_basesoc_uart_tx_fifo_wrport_we)
		storage[main_basesoc_uart_tx_fifo_wrport_adr] <= main_basesoc_uart_tx_fifo_wrport_dat_w;
	memdat_1 <= storage[main_basesoc_uart_tx_fifo_wrport_adr];
end
always @(posedge sys_clk) begin
	if (main_basesoc_uart_tx_fifo_rdport_re)
		memdat_2 <= storage[main_basesoc_uart_tx_fifo_rdport_adr];
end
assign main_basesoc_uart_tx_fifo_wrport_dat_r = memdat_1;
assign main_basesoc_uart_tx_fifo_rdport_dat_r = memdat_2;
reg [9:0] storage_1[0:15];
reg [9:0] memdat_3;
reg [9:0] memdat_4;
always @(posedge sys_clk) begin
	if (main_basesoc_uart_rx_fifo_wrport_we)
		storage_1[main_basesoc_uart_rx_fifo_wrport_adr] <= main_basesoc_uart_rx_fifo_wrport_dat_w;
	memdat_3 <= storage_1[main_basesoc_uart_rx_fifo_wrport_adr];
end
always @(posedge sys_clk) begin
	if (main_basesoc_uart_rx_fifo_rdport_re)
		memdat_4 <= storage_1[main_basesoc_uart_rx_fifo_rdport_adr];
end
assign main_basesoc_uart_rx_fifo_wrport_dat_r = memdat_3;
assign main_basesoc_uart_rx_fifo_rdport_dat_r = memdat_4;
BUFG BUFG(
	.I(main_clkout0),
	.O(main_clkout_buf0)
);
BUFG BUFG_1(
	.I(main_clkout1),
	.O(main_clkout_buf1)
);
BUFG BUFG_2(
	.I(main_clkout2),
	.O(main_clkout_buf2)
);
BUFG BUFG_3(
	.I(main_clkout3),
	.O(main_clkout_buf3)
);
BUFG BUFG_4(
	.I(main_clkout4),
	.O(main_clkout_buf4)
);
BUFG BUFG_5(
	.I(main_clkout5),
	.O(main_clkout_buf5)
);
IDELAYCTRL IDELAYCTRL(
	.REFCLK(clk200_clk),
	.RST(main_ic_reset)
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(1'd0),
	.D2(1'd1),
	.D3(1'd0),
	.D4(1'd1),
	.D5(1'd0),
	.D6(1'd1),
	.D7(1'd0),
	.D8(1'd1),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(main_a7ddrphy_sd_clk_se_nodelay)
);
OBUFDS OBUFDS(
	.I(main_a7ddrphy_sd_clk_se_nodelay),
	.O(ddram_clk_p),
	.OB(ddram_clk_n)
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_1 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_address[0]),
	.D2(main_a7ddrphy_dfi_p0_address[0]),
	.D3(main_a7ddrphy_dfi_p1_address[0]),
	.D4(main_a7ddrphy_dfi_p1_address[0]),
	.D5(main_a7ddrphy_dfi_p2_address[0]),
	.D6(main_a7ddrphy_dfi_p2_address[0]),
	.D7(main_a7ddrphy_dfi_p3_address[0]),
	.D8(main_a7ddrphy_dfi_p3_address[0]),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_a[0])
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_2 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_address[1]),
	.D2(main_a7ddrphy_dfi_p0_address[1]),
	.D3(main_a7ddrphy_dfi_p1_address[1]),
	.D4(main_a7ddrphy_dfi_p1_address[1]),
	.D5(main_a7ddrphy_dfi_p2_address[1]),
	.D6(main_a7ddrphy_dfi_p2_address[1]),
	.D7(main_a7ddrphy_dfi_p3_address[1]),
	.D8(main_a7ddrphy_dfi_p3_address[1]),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_a[1])
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_3 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_address[2]),
	.D2(main_a7ddrphy_dfi_p0_address[2]),
	.D3(main_a7ddrphy_dfi_p1_address[2]),
	.D4(main_a7ddrphy_dfi_p1_address[2]),
	.D5(main_a7ddrphy_dfi_p2_address[2]),
	.D6(main_a7ddrphy_dfi_p2_address[2]),
	.D7(main_a7ddrphy_dfi_p3_address[2]),
	.D8(main_a7ddrphy_dfi_p3_address[2]),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_a[2])
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_4 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_address[3]),
	.D2(main_a7ddrphy_dfi_p0_address[3]),
	.D3(main_a7ddrphy_dfi_p1_address[3]),
	.D4(main_a7ddrphy_dfi_p1_address[3]),
	.D5(main_a7ddrphy_dfi_p2_address[3]),
	.D6(main_a7ddrphy_dfi_p2_address[3]),
	.D7(main_a7ddrphy_dfi_p3_address[3]),
	.D8(main_a7ddrphy_dfi_p3_address[3]),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_a[3])
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_5 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_address[4]),
	.D2(main_a7ddrphy_dfi_p0_address[4]),
	.D3(main_a7ddrphy_dfi_p1_address[4]),
	.D4(main_a7ddrphy_dfi_p1_address[4]),
	.D5(main_a7ddrphy_dfi_p2_address[4]),
	.D6(main_a7ddrphy_dfi_p2_address[4]),
	.D7(main_a7ddrphy_dfi_p3_address[4]),
	.D8(main_a7ddrphy_dfi_p3_address[4]),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_a[4])
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_6 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_address[5]),
	.D2(main_a7ddrphy_dfi_p0_address[5]),
	.D3(main_a7ddrphy_dfi_p1_address[5]),
	.D4(main_a7ddrphy_dfi_p1_address[5]),
	.D5(main_a7ddrphy_dfi_p2_address[5]),
	.D6(main_a7ddrphy_dfi_p2_address[5]),
	.D7(main_a7ddrphy_dfi_p3_address[5]),
	.D8(main_a7ddrphy_dfi_p3_address[5]),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_a[5])
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_7 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_address[6]),
	.D2(main_a7ddrphy_dfi_p0_address[6]),
	.D3(main_a7ddrphy_dfi_p1_address[6]),
	.D4(main_a7ddrphy_dfi_p1_address[6]),
	.D5(main_a7ddrphy_dfi_p2_address[6]),
	.D6(main_a7ddrphy_dfi_p2_address[6]),
	.D7(main_a7ddrphy_dfi_p3_address[6]),
	.D8(main_a7ddrphy_dfi_p3_address[6]),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_a[6])
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_8 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_address[7]),
	.D2(main_a7ddrphy_dfi_p0_address[7]),
	.D3(main_a7ddrphy_dfi_p1_address[7]),
	.D4(main_a7ddrphy_dfi_p1_address[7]),
	.D5(main_a7ddrphy_dfi_p2_address[7]),
	.D6(main_a7ddrphy_dfi_p2_address[7]),
	.D7(main_a7ddrphy_dfi_p3_address[7]),
	.D8(main_a7ddrphy_dfi_p3_address[7]),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_a[7])
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_9 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_address[8]),
	.D2(main_a7ddrphy_dfi_p0_address[8]),
	.D3(main_a7ddrphy_dfi_p1_address[8]),
	.D4(main_a7ddrphy_dfi_p1_address[8]),
	.D5(main_a7ddrphy_dfi_p2_address[8]),
	.D6(main_a7ddrphy_dfi_p2_address[8]),
	.D7(main_a7ddrphy_dfi_p3_address[8]),
	.D8(main_a7ddrphy_dfi_p3_address[8]),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_a[8])
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_10 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_address[9]),
	.D2(main_a7ddrphy_dfi_p0_address[9]),
	.D3(main_a7ddrphy_dfi_p1_address[9]),
	.D4(main_a7ddrphy_dfi_p1_address[9]),
	.D5(main_a7ddrphy_dfi_p2_address[9]),
	.D6(main_a7ddrphy_dfi_p2_address[9]),
	.D7(main_a7ddrphy_dfi_p3_address[9]),
	.D8(main_a7ddrphy_dfi_p3_address[9]),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_a[9])
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_11 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_address[10]),
	.D2(main_a7ddrphy_dfi_p0_address[10]),
	.D3(main_a7ddrphy_dfi_p1_address[10]),
	.D4(main_a7ddrphy_dfi_p1_address[10]),
	.D5(main_a7ddrphy_dfi_p2_address[10]),
	.D6(main_a7ddrphy_dfi_p2_address[10]),
	.D7(main_a7ddrphy_dfi_p3_address[10]),
	.D8(main_a7ddrphy_dfi_p3_address[10]),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_a[10])
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_12 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_address[11]),
	.D2(main_a7ddrphy_dfi_p0_address[11]),
	.D3(main_a7ddrphy_dfi_p1_address[11]),
	.D4(main_a7ddrphy_dfi_p1_address[11]),
	.D5(main_a7ddrphy_dfi_p2_address[11]),
	.D6(main_a7ddrphy_dfi_p2_address[11]),
	.D7(main_a7ddrphy_dfi_p3_address[11]),
	.D8(main_a7ddrphy_dfi_p3_address[11]),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_a[11])
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_13 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_address[12]),
	.D2(main_a7ddrphy_dfi_p0_address[12]),
	.D3(main_a7ddrphy_dfi_p1_address[12]),
	.D4(main_a7ddrphy_dfi_p1_address[12]),
	.D5(main_a7ddrphy_dfi_p2_address[12]),
	.D6(main_a7ddrphy_dfi_p2_address[12]),
	.D7(main_a7ddrphy_dfi_p3_address[12]),
	.D8(main_a7ddrphy_dfi_p3_address[12]),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_a[12])
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_14 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_address[13]),
	.D2(main_a7ddrphy_dfi_p0_address[13]),
	.D3(main_a7ddrphy_dfi_p1_address[13]),
	.D4(main_a7ddrphy_dfi_p1_address[13]),
	.D5(main_a7ddrphy_dfi_p2_address[13]),
	.D6(main_a7ddrphy_dfi_p2_address[13]),
	.D7(main_a7ddrphy_dfi_p3_address[13]),
	.D8(main_a7ddrphy_dfi_p3_address[13]),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_a[13])
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_15 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_bank[0]),
	.D2(main_a7ddrphy_dfi_p0_bank[0]),
	.D3(main_a7ddrphy_dfi_p1_bank[0]),
	.D4(main_a7ddrphy_dfi_p1_bank[0]),
	.D5(main_a7ddrphy_dfi_p2_bank[0]),
	.D6(main_a7ddrphy_dfi_p2_bank[0]),
	.D7(main_a7ddrphy_dfi_p3_bank[0]),
	.D8(main_a7ddrphy_dfi_p3_bank[0]),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_ba[0])
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_16 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_bank[1]),
	.D2(main_a7ddrphy_dfi_p0_bank[1]),
	.D3(main_a7ddrphy_dfi_p1_bank[1]),
	.D4(main_a7ddrphy_dfi_p1_bank[1]),
	.D5(main_a7ddrphy_dfi_p2_bank[1]),
	.D6(main_a7ddrphy_dfi_p2_bank[1]),
	.D7(main_a7ddrphy_dfi_p3_bank[1]),
	.D8(main_a7ddrphy_dfi_p3_bank[1]),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_ba[1])
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_17 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_bank[2]),
	.D2(main_a7ddrphy_dfi_p0_bank[2]),
	.D3(main_a7ddrphy_dfi_p1_bank[2]),
	.D4(main_a7ddrphy_dfi_p1_bank[2]),
	.D5(main_a7ddrphy_dfi_p2_bank[2]),
	.D6(main_a7ddrphy_dfi_p2_bank[2]),
	.D7(main_a7ddrphy_dfi_p3_bank[2]),
	.D8(main_a7ddrphy_dfi_p3_bank[2]),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_ba[2])
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_18 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_ras_n),
	.D2(main_a7ddrphy_dfi_p0_ras_n),
	.D3(main_a7ddrphy_dfi_p1_ras_n),
	.D4(main_a7ddrphy_dfi_p1_ras_n),
	.D5(main_a7ddrphy_dfi_p2_ras_n),
	.D6(main_a7ddrphy_dfi_p2_ras_n),
	.D7(main_a7ddrphy_dfi_p3_ras_n),
	.D8(main_a7ddrphy_dfi_p3_ras_n),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_ras_n)
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_19 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_cas_n),
	.D2(main_a7ddrphy_dfi_p0_cas_n),
	.D3(main_a7ddrphy_dfi_p1_cas_n),
	.D4(main_a7ddrphy_dfi_p1_cas_n),
	.D5(main_a7ddrphy_dfi_p2_cas_n),
	.D6(main_a7ddrphy_dfi_p2_cas_n),
	.D7(main_a7ddrphy_dfi_p3_cas_n),
	.D8(main_a7ddrphy_dfi_p3_cas_n),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_cas_n)
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_20 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_we_n),
	.D2(main_a7ddrphy_dfi_p0_we_n),
	.D3(main_a7ddrphy_dfi_p1_we_n),
	.D4(main_a7ddrphy_dfi_p1_we_n),
	.D5(main_a7ddrphy_dfi_p2_we_n),
	.D6(main_a7ddrphy_dfi_p2_we_n),
	.D7(main_a7ddrphy_dfi_p3_we_n),
	.D8(main_a7ddrphy_dfi_p3_we_n),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_we_n)
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_21 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_cke),
	.D2(main_a7ddrphy_dfi_p0_cke),
	.D3(main_a7ddrphy_dfi_p1_cke),
	.D4(main_a7ddrphy_dfi_p1_cke),
	.D5(main_a7ddrphy_dfi_p2_cke),
	.D6(main_a7ddrphy_dfi_p2_cke),
	.D7(main_a7ddrphy_dfi_p3_cke),
	.D8(main_a7ddrphy_dfi_p3_cke),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_cke)
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_22 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_odt),
	.D2(main_a7ddrphy_dfi_p0_odt),
	.D3(main_a7ddrphy_dfi_p1_odt),
	.D4(main_a7ddrphy_dfi_p1_odt),
	.D5(main_a7ddrphy_dfi_p2_odt),
	.D6(main_a7ddrphy_dfi_p2_odt),
	.D7(main_a7ddrphy_dfi_p3_odt),
	.D8(main_a7ddrphy_dfi_p3_odt),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_odt)
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_23 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_reset_n),
	.D2(main_a7ddrphy_dfi_p0_reset_n),
	.D3(main_a7ddrphy_dfi_p1_reset_n),
	.D4(main_a7ddrphy_dfi_p1_reset_n),
	.D5(main_a7ddrphy_dfi_p2_reset_n),
	.D6(main_a7ddrphy_dfi_p2_reset_n),
	.D7(main_a7ddrphy_dfi_p3_reset_n),
	.D8(main_a7ddrphy_dfi_p3_reset_n),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_reset_n)
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_24 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_cs_n),
	.D2(main_a7ddrphy_dfi_p0_cs_n),
	.D3(main_a7ddrphy_dfi_p1_cs_n),
	.D4(main_a7ddrphy_dfi_p1_cs_n),
	.D5(main_a7ddrphy_dfi_p2_cs_n),
	.D6(main_a7ddrphy_dfi_p2_cs_n),
	.D7(main_a7ddrphy_dfi_p3_cs_n),
	.D8(main_a7ddrphy_dfi_p3_cs_n),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_cs_n)
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_25 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_wrdata_mask[0]),
	.D2(main_a7ddrphy_dfi_p0_wrdata_mask[2]),
	.D3(main_a7ddrphy_dfi_p1_wrdata_mask[0]),
	.D4(main_a7ddrphy_dfi_p1_wrdata_mask[2]),
	.D5(main_a7ddrphy_dfi_p2_wrdata_mask[0]),
	.D6(main_a7ddrphy_dfi_p2_wrdata_mask[2]),
	.D7(main_a7ddrphy_dfi_p3_wrdata_mask[0]),
	.D8(main_a7ddrphy_dfi_p3_wrdata_mask[2]),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_dm[0])
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_26 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_wrdata_mask[1]),
	.D2(main_a7ddrphy_dfi_p0_wrdata_mask[3]),
	.D3(main_a7ddrphy_dfi_p1_wrdata_mask[1]),
	.D4(main_a7ddrphy_dfi_p1_wrdata_mask[3]),
	.D5(main_a7ddrphy_dfi_p2_wrdata_mask[1]),
	.D6(main_a7ddrphy_dfi_p2_wrdata_mask[3]),
	.D7(main_a7ddrphy_dfi_p3_wrdata_mask[1]),
	.D8(main_a7ddrphy_dfi_p3_wrdata_mask[3]),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_dm[1])
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_27 (
	.CLK(sys4x_dqs_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dqspattern_o1[0]),
	.D2(main_a7ddrphy_dqspattern_o1[1]),
	.D3(main_a7ddrphy_dqspattern_o1[2]),
	.D4(main_a7ddrphy_dqspattern_o1[3]),
	.D5(main_a7ddrphy_dqspattern_o1[4]),
	.D6(main_a7ddrphy_dqspattern_o1[5]),
	.D7(main_a7ddrphy_dqspattern_o1[6]),
	.D8(main_a7ddrphy_dqspattern_o1[7]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~main_a7ddrphy_dqs_oe_delayed)),
	.TCE(1'd1),
	.OFB(main_a7ddrphy0),
	.OQ(main_a7ddrphy_dqs_o_no_delay0),
	.TQ(main_a7ddrphy_dqs_t0)
);
IDELAYE2 #(
	.CINVCTRL_SEL("FALSE"),
	.DELAY_SRC("IDATAIN"),
	.HIGH_PERFORMANCE_MODE("TRUE"),
	.IDELAY_TYPE("FIXED"),
	.IDELAY_VALUE(4'd8),
	.PIPE_SEL("FALSE"),
	.REFCLK_FREQUENCY(200.0),
	.SIGNAL_PATTERN("DATA")
) IDELAYE2 (
	.IDATAIN(main_a7ddrphy_dqs_i[0]),
	.DATAOUT(main_a7ddrphy_dqs_i_delayed[0])
);
IOBUFDS IOBUFDS(
	.I(main_a7ddrphy_dqs_o_no_delay0),
	.T(main_a7ddrphy_dqs_t0),
	.IO(ddram_dqs_p[0]),
	.IOB(ddram_dqs_n[0]),
	.O(main_a7ddrphy_dqs_i[0])
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_28 (
	.CLK(sys4x_dqs_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dqspattern_o1[0]),
	.D2(main_a7ddrphy_dqspattern_o1[1]),
	.D3(main_a7ddrphy_dqspattern_o1[2]),
	.D4(main_a7ddrphy_dqspattern_o1[3]),
	.D5(main_a7ddrphy_dqspattern_o1[4]),
	.D6(main_a7ddrphy_dqspattern_o1[5]),
	.D7(main_a7ddrphy_dqspattern_o1[6]),
	.D8(main_a7ddrphy_dqspattern_o1[7]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~main_a7ddrphy_dqs_oe_delayed)),
	.TCE(1'd1),
	.OFB(main_a7ddrphy1),
	.OQ(main_a7ddrphy_dqs_o_no_delay1),
	.TQ(main_a7ddrphy_dqs_t1)
);
IDELAYE2 #(
	.CINVCTRL_SEL("FALSE"),
	.DELAY_SRC("IDATAIN"),
	.HIGH_PERFORMANCE_MODE("TRUE"),
	.IDELAY_TYPE("FIXED"),
	.IDELAY_VALUE(4'd8),
	.PIPE_SEL("FALSE"),
	.REFCLK_FREQUENCY(200.0),
	.SIGNAL_PATTERN("DATA")
) IDELAYE2_1 (
	.IDATAIN(main_a7ddrphy_dqs_i[1]),
	.DATAOUT(main_a7ddrphy_dqs_i_delayed[1])
);
IOBUFDS IOBUFDS_1(
	.I(main_a7ddrphy_dqs_o_no_delay1),
	.T(main_a7ddrphy_dqs_t1),
	.IO(ddram_dqs_p[1]),
	.IOB(ddram_dqs_n[1]),
	.O(main_a7ddrphy_dqs_i[1])
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_29 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_wrdata[0]),
	.D2(main_a7ddrphy_dfi_p0_wrdata[16]),
	.D3(main_a7ddrphy_dfi_p1_wrdata[0]),
	.D4(main_a7ddrphy_dfi_p1_wrdata[16]),
	.D5(main_a7ddrphy_dfi_p2_wrdata[0]),
	.D6(main_a7ddrphy_dfi_p2_wrdata[16]),
	.D7(main_a7ddrphy_dfi_p3_wrdata[0]),
	.D8(main_a7ddrphy_dfi_p3_wrdata[16]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~main_a7ddrphy_dq_oe_delayed)),
	.TCE(1'd1),
	.OQ(main_a7ddrphy_dq_o_nodelay0),
	.TQ(main_a7ddrphy_dq_t0)
);
ISERDESE2 #(
	.DATA_RATE("DDR"),
	.DATA_WIDTH(3'd4),
	.INTERFACE_TYPE("MEMORY"),
	.IOBDELAY("IFD"),
	.NUM_CE(1'd1),
	.SERDES_MODE("MASTER")
) ISERDESE2 (
	.BITSLIP(1'd0),
	.CE1(1'd1),
	.CLK(main_a7ddrphy_dqs_i_delayed[0]),
	.CLKB((~main_a7ddrphy_dqs_i_delayed[0])),
	.CLKDIV(sys2x_clk),
	.DDLY(main_a7ddrphy_dq_i_delayed0),
	.OCLK(sys4x_clk),
	.OCLKB((~sys4x_clk)),
	.RST(sys_rst),
	.Q1(main_a7ddrphy_dq_i_data_sys2x0[3]),
	.Q2(main_a7ddrphy_dq_i_data_sys2x0[2]),
	.Q3(main_a7ddrphy_dq_i_data_sys2x0[1]),
	.Q4(main_a7ddrphy_dq_i_data_sys2x0[0])
);
IDELAYE2 #(
	.CINVCTRL_SEL("FALSE"),
	.DELAY_SRC("IDATAIN"),
	.HIGH_PERFORMANCE_MODE("TRUE"),
	.IDELAY_TYPE("VARIABLE"),
	.IDELAY_VALUE(1'd0),
	.PIPE_SEL("FALSE"),
	.REFCLK_FREQUENCY(200.0),
	.SIGNAL_PATTERN("DATA")
) IDELAYE2_2 (
	.C(sys_clk),
	.CE((main_a7ddrphy_dly_sel_storage[0] & main_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(main_a7ddrphy_dq_i_nodelay0),
	.INC(1'd1),
	.LD((main_a7ddrphy_dly_sel_storage[0] & main_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(main_a7ddrphy_dq_i_delayed0)
);
IOBUF IOBUF(
	.I(main_a7ddrphy_dq_o_nodelay0),
	.T(main_a7ddrphy_dq_t0),
	.IO(ddram_dq[0]),
	.O(main_a7ddrphy_dq_i_nodelay0)
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_30 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_wrdata[1]),
	.D2(main_a7ddrphy_dfi_p0_wrdata[17]),
	.D3(main_a7ddrphy_dfi_p1_wrdata[1]),
	.D4(main_a7ddrphy_dfi_p1_wrdata[17]),
	.D5(main_a7ddrphy_dfi_p2_wrdata[1]),
	.D6(main_a7ddrphy_dfi_p2_wrdata[17]),
	.D7(main_a7ddrphy_dfi_p3_wrdata[1]),
	.D8(main_a7ddrphy_dfi_p3_wrdata[17]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~main_a7ddrphy_dq_oe_delayed)),
	.TCE(1'd1),
	.OQ(main_a7ddrphy_dq_o_nodelay1),
	.TQ(main_a7ddrphy_dq_t1)
);
ISERDESE2 #(
	.DATA_RATE("DDR"),
	.DATA_WIDTH(3'd4),
	.INTERFACE_TYPE("MEMORY"),
	.IOBDELAY("IFD"),
	.NUM_CE(1'd1),
	.SERDES_MODE("MASTER")
) ISERDESE2_1 (
	.BITSLIP(1'd0),
	.CE1(1'd1),
	.CLK(main_a7ddrphy_dqs_i_delayed[0]),
	.CLKB((~main_a7ddrphy_dqs_i_delayed[0])),
	.CLKDIV(sys2x_clk),
	.DDLY(main_a7ddrphy_dq_i_delayed1),
	.OCLK(sys4x_clk),
	.OCLKB((~sys4x_clk)),
	.RST(sys_rst),
	.Q1(main_a7ddrphy_dq_i_data_sys2x1[3]),
	.Q2(main_a7ddrphy_dq_i_data_sys2x1[2]),
	.Q3(main_a7ddrphy_dq_i_data_sys2x1[1]),
	.Q4(main_a7ddrphy_dq_i_data_sys2x1[0])
);
IDELAYE2 #(
	.CINVCTRL_SEL("FALSE"),
	.DELAY_SRC("IDATAIN"),
	.HIGH_PERFORMANCE_MODE("TRUE"),
	.IDELAY_TYPE("VARIABLE"),
	.IDELAY_VALUE(1'd0),
	.PIPE_SEL("FALSE"),
	.REFCLK_FREQUENCY(200.0),
	.SIGNAL_PATTERN("DATA")
) IDELAYE2_3 (
	.C(sys_clk),
	.CE((main_a7ddrphy_dly_sel_storage[0] & main_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(main_a7ddrphy_dq_i_nodelay1),
	.INC(1'd1),
	.LD((main_a7ddrphy_dly_sel_storage[0] & main_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(main_a7ddrphy_dq_i_delayed1)
);
IOBUF IOBUF_1(
	.I(main_a7ddrphy_dq_o_nodelay1),
	.T(main_a7ddrphy_dq_t1),
	.IO(ddram_dq[1]),
	.O(main_a7ddrphy_dq_i_nodelay1)
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_31 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_wrdata[2]),
	.D2(main_a7ddrphy_dfi_p0_wrdata[18]),
	.D3(main_a7ddrphy_dfi_p1_wrdata[2]),
	.D4(main_a7ddrphy_dfi_p1_wrdata[18]),
	.D5(main_a7ddrphy_dfi_p2_wrdata[2]),
	.D6(main_a7ddrphy_dfi_p2_wrdata[18]),
	.D7(main_a7ddrphy_dfi_p3_wrdata[2]),
	.D8(main_a7ddrphy_dfi_p3_wrdata[18]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~main_a7ddrphy_dq_oe_delayed)),
	.TCE(1'd1),
	.OQ(main_a7ddrphy_dq_o_nodelay2),
	.TQ(main_a7ddrphy_dq_t2)
);
ISERDESE2 #(
	.DATA_RATE("DDR"),
	.DATA_WIDTH(3'd4),
	.INTERFACE_TYPE("MEMORY"),
	.IOBDELAY("IFD"),
	.NUM_CE(1'd1),
	.SERDES_MODE("MASTER")
) ISERDESE2_2 (
	.BITSLIP(1'd0),
	.CE1(1'd1),
	.CLK(main_a7ddrphy_dqs_i_delayed[0]),
	.CLKB((~main_a7ddrphy_dqs_i_delayed[0])),
	.CLKDIV(sys2x_clk),
	.DDLY(main_a7ddrphy_dq_i_delayed2),
	.OCLK(sys4x_clk),
	.OCLKB((~sys4x_clk)),
	.RST(sys_rst),
	.Q1(main_a7ddrphy_dq_i_data_sys2x2[3]),
	.Q2(main_a7ddrphy_dq_i_data_sys2x2[2]),
	.Q3(main_a7ddrphy_dq_i_data_sys2x2[1]),
	.Q4(main_a7ddrphy_dq_i_data_sys2x2[0])
);
IDELAYE2 #(
	.CINVCTRL_SEL("FALSE"),
	.DELAY_SRC("IDATAIN"),
	.HIGH_PERFORMANCE_MODE("TRUE"),
	.IDELAY_TYPE("VARIABLE"),
	.IDELAY_VALUE(1'd0),
	.PIPE_SEL("FALSE"),
	.REFCLK_FREQUENCY(200.0),
	.SIGNAL_PATTERN("DATA")
) IDELAYE2_4 (
	.C(sys_clk),
	.CE((main_a7ddrphy_dly_sel_storage[0] & main_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(main_a7ddrphy_dq_i_nodelay2),
	.INC(1'd1),
	.LD((main_a7ddrphy_dly_sel_storage[0] & main_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(main_a7ddrphy_dq_i_delayed2)
);
IOBUF IOBUF_2(
	.I(main_a7ddrphy_dq_o_nodelay2),
	.T(main_a7ddrphy_dq_t2),
	.IO(ddram_dq[2]),
	.O(main_a7ddrphy_dq_i_nodelay2)
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_32 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_wrdata[3]),
	.D2(main_a7ddrphy_dfi_p0_wrdata[19]),
	.D3(main_a7ddrphy_dfi_p1_wrdata[3]),
	.D4(main_a7ddrphy_dfi_p1_wrdata[19]),
	.D5(main_a7ddrphy_dfi_p2_wrdata[3]),
	.D6(main_a7ddrphy_dfi_p2_wrdata[19]),
	.D7(main_a7ddrphy_dfi_p3_wrdata[3]),
	.D8(main_a7ddrphy_dfi_p3_wrdata[19]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~main_a7ddrphy_dq_oe_delayed)),
	.TCE(1'd1),
	.OQ(main_a7ddrphy_dq_o_nodelay3),
	.TQ(main_a7ddrphy_dq_t3)
);
ISERDESE2 #(
	.DATA_RATE("DDR"),
	.DATA_WIDTH(3'd4),
	.INTERFACE_TYPE("MEMORY"),
	.IOBDELAY("IFD"),
	.NUM_CE(1'd1),
	.SERDES_MODE("MASTER")
) ISERDESE2_3 (
	.BITSLIP(1'd0),
	.CE1(1'd1),
	.CLK(main_a7ddrphy_dqs_i_delayed[0]),
	.CLKB((~main_a7ddrphy_dqs_i_delayed[0])),
	.CLKDIV(sys2x_clk),
	.DDLY(main_a7ddrphy_dq_i_delayed3),
	.OCLK(sys4x_clk),
	.OCLKB((~sys4x_clk)),
	.RST(sys_rst),
	.Q1(main_a7ddrphy_dq_i_data_sys2x3[3]),
	.Q2(main_a7ddrphy_dq_i_data_sys2x3[2]),
	.Q3(main_a7ddrphy_dq_i_data_sys2x3[1]),
	.Q4(main_a7ddrphy_dq_i_data_sys2x3[0])
);
IDELAYE2 #(
	.CINVCTRL_SEL("FALSE"),
	.DELAY_SRC("IDATAIN"),
	.HIGH_PERFORMANCE_MODE("TRUE"),
	.IDELAY_TYPE("VARIABLE"),
	.IDELAY_VALUE(1'd0),
	.PIPE_SEL("FALSE"),
	.REFCLK_FREQUENCY(200.0),
	.SIGNAL_PATTERN("DATA")
) IDELAYE2_5 (
	.C(sys_clk),
	.CE((main_a7ddrphy_dly_sel_storage[0] & main_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(main_a7ddrphy_dq_i_nodelay3),
	.INC(1'd1),
	.LD((main_a7ddrphy_dly_sel_storage[0] & main_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(main_a7ddrphy_dq_i_delayed3)
);
IOBUF IOBUF_3(
	.I(main_a7ddrphy_dq_o_nodelay3),
	.T(main_a7ddrphy_dq_t3),
	.IO(ddram_dq[3]),
	.O(main_a7ddrphy_dq_i_nodelay3)
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_33 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_wrdata[4]),
	.D2(main_a7ddrphy_dfi_p0_wrdata[20]),
	.D3(main_a7ddrphy_dfi_p1_wrdata[4]),
	.D4(main_a7ddrphy_dfi_p1_wrdata[20]),
	.D5(main_a7ddrphy_dfi_p2_wrdata[4]),
	.D6(main_a7ddrphy_dfi_p2_wrdata[20]),
	.D7(main_a7ddrphy_dfi_p3_wrdata[4]),
	.D8(main_a7ddrphy_dfi_p3_wrdata[20]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~main_a7ddrphy_dq_oe_delayed)),
	.TCE(1'd1),
	.OQ(main_a7ddrphy_dq_o_nodelay4),
	.TQ(main_a7ddrphy_dq_t4)
);
ISERDESE2 #(
	.DATA_RATE("DDR"),
	.DATA_WIDTH(3'd4),
	.INTERFACE_TYPE("MEMORY"),
	.IOBDELAY("IFD"),
	.NUM_CE(1'd1),
	.SERDES_MODE("MASTER")
) ISERDESE2_4 (
	.BITSLIP(1'd0),
	.CE1(1'd1),
	.CLK(main_a7ddrphy_dqs_i_delayed[0]),
	.CLKB((~main_a7ddrphy_dqs_i_delayed[0])),
	.CLKDIV(sys2x_clk),
	.DDLY(main_a7ddrphy_dq_i_delayed4),
	.OCLK(sys4x_clk),
	.OCLKB((~sys4x_clk)),
	.RST(sys_rst),
	.Q1(main_a7ddrphy_dq_i_data_sys2x4[3]),
	.Q2(main_a7ddrphy_dq_i_data_sys2x4[2]),
	.Q3(main_a7ddrphy_dq_i_data_sys2x4[1]),
	.Q4(main_a7ddrphy_dq_i_data_sys2x4[0])
);
IDELAYE2 #(
	.CINVCTRL_SEL("FALSE"),
	.DELAY_SRC("IDATAIN"),
	.HIGH_PERFORMANCE_MODE("TRUE"),
	.IDELAY_TYPE("VARIABLE"),
	.IDELAY_VALUE(1'd0),
	.PIPE_SEL("FALSE"),
	.REFCLK_FREQUENCY(200.0),
	.SIGNAL_PATTERN("DATA")
) IDELAYE2_6 (
	.C(sys_clk),
	.CE((main_a7ddrphy_dly_sel_storage[0] & main_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(main_a7ddrphy_dq_i_nodelay4),
	.INC(1'd1),
	.LD((main_a7ddrphy_dly_sel_storage[0] & main_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(main_a7ddrphy_dq_i_delayed4)
);
IOBUF IOBUF_4(
	.I(main_a7ddrphy_dq_o_nodelay4),
	.T(main_a7ddrphy_dq_t4),
	.IO(ddram_dq[4]),
	.O(main_a7ddrphy_dq_i_nodelay4)
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_34 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_wrdata[5]),
	.D2(main_a7ddrphy_dfi_p0_wrdata[21]),
	.D3(main_a7ddrphy_dfi_p1_wrdata[5]),
	.D4(main_a7ddrphy_dfi_p1_wrdata[21]),
	.D5(main_a7ddrphy_dfi_p2_wrdata[5]),
	.D6(main_a7ddrphy_dfi_p2_wrdata[21]),
	.D7(main_a7ddrphy_dfi_p3_wrdata[5]),
	.D8(main_a7ddrphy_dfi_p3_wrdata[21]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~main_a7ddrphy_dq_oe_delayed)),
	.TCE(1'd1),
	.OQ(main_a7ddrphy_dq_o_nodelay5),
	.TQ(main_a7ddrphy_dq_t5)
);
ISERDESE2 #(
	.DATA_RATE("DDR"),
	.DATA_WIDTH(3'd4),
	.INTERFACE_TYPE("MEMORY"),
	.IOBDELAY("IFD"),
	.NUM_CE(1'd1),
	.SERDES_MODE("MASTER")
) ISERDESE2_5 (
	.BITSLIP(1'd0),
	.CE1(1'd1),
	.CLK(main_a7ddrphy_dqs_i_delayed[0]),
	.CLKB((~main_a7ddrphy_dqs_i_delayed[0])),
	.CLKDIV(sys2x_clk),
	.DDLY(main_a7ddrphy_dq_i_delayed5),
	.OCLK(sys4x_clk),
	.OCLKB((~sys4x_clk)),
	.RST(sys_rst),
	.Q1(main_a7ddrphy_dq_i_data_sys2x5[3]),
	.Q2(main_a7ddrphy_dq_i_data_sys2x5[2]),
	.Q3(main_a7ddrphy_dq_i_data_sys2x5[1]),
	.Q4(main_a7ddrphy_dq_i_data_sys2x5[0])
);
IDELAYE2 #(
	.CINVCTRL_SEL("FALSE"),
	.DELAY_SRC("IDATAIN"),
	.HIGH_PERFORMANCE_MODE("TRUE"),
	.IDELAY_TYPE("VARIABLE"),
	.IDELAY_VALUE(1'd0),
	.PIPE_SEL("FALSE"),
	.REFCLK_FREQUENCY(200.0),
	.SIGNAL_PATTERN("DATA")
) IDELAYE2_7 (
	.C(sys_clk),
	.CE((main_a7ddrphy_dly_sel_storage[0] & main_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(main_a7ddrphy_dq_i_nodelay5),
	.INC(1'd1),
	.LD((main_a7ddrphy_dly_sel_storage[0] & main_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(main_a7ddrphy_dq_i_delayed5)
);
IOBUF IOBUF_5(
	.I(main_a7ddrphy_dq_o_nodelay5),
	.T(main_a7ddrphy_dq_t5),
	.IO(ddram_dq[5]),
	.O(main_a7ddrphy_dq_i_nodelay5)
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_35 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_wrdata[6]),
	.D2(main_a7ddrphy_dfi_p0_wrdata[22]),
	.D3(main_a7ddrphy_dfi_p1_wrdata[6]),
	.D4(main_a7ddrphy_dfi_p1_wrdata[22]),
	.D5(main_a7ddrphy_dfi_p2_wrdata[6]),
	.D6(main_a7ddrphy_dfi_p2_wrdata[22]),
	.D7(main_a7ddrphy_dfi_p3_wrdata[6]),
	.D8(main_a7ddrphy_dfi_p3_wrdata[22]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~main_a7ddrphy_dq_oe_delayed)),
	.TCE(1'd1),
	.OQ(main_a7ddrphy_dq_o_nodelay6),
	.TQ(main_a7ddrphy_dq_t6)
);
ISERDESE2 #(
	.DATA_RATE("DDR"),
	.DATA_WIDTH(3'd4),
	.INTERFACE_TYPE("MEMORY"),
	.IOBDELAY("IFD"),
	.NUM_CE(1'd1),
	.SERDES_MODE("MASTER")
) ISERDESE2_6 (
	.BITSLIP(1'd0),
	.CE1(1'd1),
	.CLK(main_a7ddrphy_dqs_i_delayed[0]),
	.CLKB((~main_a7ddrphy_dqs_i_delayed[0])),
	.CLKDIV(sys2x_clk),
	.DDLY(main_a7ddrphy_dq_i_delayed6),
	.OCLK(sys4x_clk),
	.OCLKB((~sys4x_clk)),
	.RST(sys_rst),
	.Q1(main_a7ddrphy_dq_i_data_sys2x6[3]),
	.Q2(main_a7ddrphy_dq_i_data_sys2x6[2]),
	.Q3(main_a7ddrphy_dq_i_data_sys2x6[1]),
	.Q4(main_a7ddrphy_dq_i_data_sys2x6[0])
);
IDELAYE2 #(
	.CINVCTRL_SEL("FALSE"),
	.DELAY_SRC("IDATAIN"),
	.HIGH_PERFORMANCE_MODE("TRUE"),
	.IDELAY_TYPE("VARIABLE"),
	.IDELAY_VALUE(1'd0),
	.PIPE_SEL("FALSE"),
	.REFCLK_FREQUENCY(200.0),
	.SIGNAL_PATTERN("DATA")
) IDELAYE2_8 (
	.C(sys_clk),
	.CE((main_a7ddrphy_dly_sel_storage[0] & main_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(main_a7ddrphy_dq_i_nodelay6),
	.INC(1'd1),
	.LD((main_a7ddrphy_dly_sel_storage[0] & main_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(main_a7ddrphy_dq_i_delayed6)
);
IOBUF IOBUF_6(
	.I(main_a7ddrphy_dq_o_nodelay6),
	.T(main_a7ddrphy_dq_t6),
	.IO(ddram_dq[6]),
	.O(main_a7ddrphy_dq_i_nodelay6)
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_36 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_wrdata[7]),
	.D2(main_a7ddrphy_dfi_p0_wrdata[23]),
	.D3(main_a7ddrphy_dfi_p1_wrdata[7]),
	.D4(main_a7ddrphy_dfi_p1_wrdata[23]),
	.D5(main_a7ddrphy_dfi_p2_wrdata[7]),
	.D6(main_a7ddrphy_dfi_p2_wrdata[23]),
	.D7(main_a7ddrphy_dfi_p3_wrdata[7]),
	.D8(main_a7ddrphy_dfi_p3_wrdata[23]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~main_a7ddrphy_dq_oe_delayed)),
	.TCE(1'd1),
	.OQ(main_a7ddrphy_dq_o_nodelay7),
	.TQ(main_a7ddrphy_dq_t7)
);
ISERDESE2 #(
	.DATA_RATE("DDR"),
	.DATA_WIDTH(3'd4),
	.INTERFACE_TYPE("MEMORY"),
	.IOBDELAY("IFD"),
	.NUM_CE(1'd1),
	.SERDES_MODE("MASTER")
) ISERDESE2_7 (
	.BITSLIP(1'd0),
	.CE1(1'd1),
	.CLK(main_a7ddrphy_dqs_i_delayed[0]),
	.CLKB((~main_a7ddrphy_dqs_i_delayed[0])),
	.CLKDIV(sys2x_clk),
	.DDLY(main_a7ddrphy_dq_i_delayed7),
	.OCLK(sys4x_clk),
	.OCLKB((~sys4x_clk)),
	.RST(sys_rst),
	.Q1(main_a7ddrphy_dq_i_data_sys2x7[3]),
	.Q2(main_a7ddrphy_dq_i_data_sys2x7[2]),
	.Q3(main_a7ddrphy_dq_i_data_sys2x7[1]),
	.Q4(main_a7ddrphy_dq_i_data_sys2x7[0])
);
IDELAYE2 #(
	.CINVCTRL_SEL("FALSE"),
	.DELAY_SRC("IDATAIN"),
	.HIGH_PERFORMANCE_MODE("TRUE"),
	.IDELAY_TYPE("VARIABLE"),
	.IDELAY_VALUE(1'd0),
	.PIPE_SEL("FALSE"),
	.REFCLK_FREQUENCY(200.0),
	.SIGNAL_PATTERN("DATA")
) IDELAYE2_9 (
	.C(sys_clk),
	.CE((main_a7ddrphy_dly_sel_storage[0] & main_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(main_a7ddrphy_dq_i_nodelay7),
	.INC(1'd1),
	.LD((main_a7ddrphy_dly_sel_storage[0] & main_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(main_a7ddrphy_dq_i_delayed7)
);
IOBUF IOBUF_7(
	.I(main_a7ddrphy_dq_o_nodelay7),
	.T(main_a7ddrphy_dq_t7),
	.IO(ddram_dq[7]),
	.O(main_a7ddrphy_dq_i_nodelay7)
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_37 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_wrdata[8]),
	.D2(main_a7ddrphy_dfi_p0_wrdata[24]),
	.D3(main_a7ddrphy_dfi_p1_wrdata[8]),
	.D4(main_a7ddrphy_dfi_p1_wrdata[24]),
	.D5(main_a7ddrphy_dfi_p2_wrdata[8]),
	.D6(main_a7ddrphy_dfi_p2_wrdata[24]),
	.D7(main_a7ddrphy_dfi_p3_wrdata[8]),
	.D8(main_a7ddrphy_dfi_p3_wrdata[24]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~main_a7ddrphy_dq_oe_delayed)),
	.TCE(1'd1),
	.OQ(main_a7ddrphy_dq_o_nodelay8),
	.TQ(main_a7ddrphy_dq_t8)
);
ISERDESE2 #(
	.DATA_RATE("DDR"),
	.DATA_WIDTH(3'd4),
	.INTERFACE_TYPE("MEMORY"),
	.IOBDELAY("IFD"),
	.NUM_CE(1'd1),
	.SERDES_MODE("MASTER")
) ISERDESE2_8 (
	.BITSLIP(1'd0),
	.CE1(1'd1),
	.CLK(main_a7ddrphy_dqs_i_delayed[1]),
	.CLKB((~main_a7ddrphy_dqs_i_delayed[1])),
	.CLKDIV(sys2x_clk),
	.DDLY(main_a7ddrphy_dq_i_delayed8),
	.OCLK(sys4x_clk),
	.OCLKB((~sys4x_clk)),
	.RST(sys_rst),
	.Q1(main_a7ddrphy_dq_i_data_sys2x8[3]),
	.Q2(main_a7ddrphy_dq_i_data_sys2x8[2]),
	.Q3(main_a7ddrphy_dq_i_data_sys2x8[1]),
	.Q4(main_a7ddrphy_dq_i_data_sys2x8[0])
);
IDELAYE2 #(
	.CINVCTRL_SEL("FALSE"),
	.DELAY_SRC("IDATAIN"),
	.HIGH_PERFORMANCE_MODE("TRUE"),
	.IDELAY_TYPE("VARIABLE"),
	.IDELAY_VALUE(1'd0),
	.PIPE_SEL("FALSE"),
	.REFCLK_FREQUENCY(200.0),
	.SIGNAL_PATTERN("DATA")
) IDELAYE2_10 (
	.C(sys_clk),
	.CE((main_a7ddrphy_dly_sel_storage[1] & main_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(main_a7ddrphy_dq_i_nodelay8),
	.INC(1'd1),
	.LD((main_a7ddrphy_dly_sel_storage[1] & main_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(main_a7ddrphy_dq_i_delayed8)
);
IOBUF IOBUF_8(
	.I(main_a7ddrphy_dq_o_nodelay8),
	.T(main_a7ddrphy_dq_t8),
	.IO(ddram_dq[8]),
	.O(main_a7ddrphy_dq_i_nodelay8)
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_38 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_wrdata[9]),
	.D2(main_a7ddrphy_dfi_p0_wrdata[25]),
	.D3(main_a7ddrphy_dfi_p1_wrdata[9]),
	.D4(main_a7ddrphy_dfi_p1_wrdata[25]),
	.D5(main_a7ddrphy_dfi_p2_wrdata[9]),
	.D6(main_a7ddrphy_dfi_p2_wrdata[25]),
	.D7(main_a7ddrphy_dfi_p3_wrdata[9]),
	.D8(main_a7ddrphy_dfi_p3_wrdata[25]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~main_a7ddrphy_dq_oe_delayed)),
	.TCE(1'd1),
	.OQ(main_a7ddrphy_dq_o_nodelay9),
	.TQ(main_a7ddrphy_dq_t9)
);
ISERDESE2 #(
	.DATA_RATE("DDR"),
	.DATA_WIDTH(3'd4),
	.INTERFACE_TYPE("MEMORY"),
	.IOBDELAY("IFD"),
	.NUM_CE(1'd1),
	.SERDES_MODE("MASTER")
) ISERDESE2_9 (
	.BITSLIP(1'd0),
	.CE1(1'd1),
	.CLK(main_a7ddrphy_dqs_i_delayed[1]),
	.CLKB((~main_a7ddrphy_dqs_i_delayed[1])),
	.CLKDIV(sys2x_clk),
	.DDLY(main_a7ddrphy_dq_i_delayed9),
	.OCLK(sys4x_clk),
	.OCLKB((~sys4x_clk)),
	.RST(sys_rst),
	.Q1(main_a7ddrphy_dq_i_data_sys2x9[3]),
	.Q2(main_a7ddrphy_dq_i_data_sys2x9[2]),
	.Q3(main_a7ddrphy_dq_i_data_sys2x9[1]),
	.Q4(main_a7ddrphy_dq_i_data_sys2x9[0])
);
IDELAYE2 #(
	.CINVCTRL_SEL("FALSE"),
	.DELAY_SRC("IDATAIN"),
	.HIGH_PERFORMANCE_MODE("TRUE"),
	.IDELAY_TYPE("VARIABLE"),
	.IDELAY_VALUE(1'd0),
	.PIPE_SEL("FALSE"),
	.REFCLK_FREQUENCY(200.0),
	.SIGNAL_PATTERN("DATA")
) IDELAYE2_11 (
	.C(sys_clk),
	.CE((main_a7ddrphy_dly_sel_storage[1] & main_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(main_a7ddrphy_dq_i_nodelay9),
	.INC(1'd1),
	.LD((main_a7ddrphy_dly_sel_storage[1] & main_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(main_a7ddrphy_dq_i_delayed9)
);
IOBUF IOBUF_9(
	.I(main_a7ddrphy_dq_o_nodelay9),
	.T(main_a7ddrphy_dq_t9),
	.IO(ddram_dq[9]),
	.O(main_a7ddrphy_dq_i_nodelay9)
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_39 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_wrdata[10]),
	.D2(main_a7ddrphy_dfi_p0_wrdata[26]),
	.D3(main_a7ddrphy_dfi_p1_wrdata[10]),
	.D4(main_a7ddrphy_dfi_p1_wrdata[26]),
	.D5(main_a7ddrphy_dfi_p2_wrdata[10]),
	.D6(main_a7ddrphy_dfi_p2_wrdata[26]),
	.D7(main_a7ddrphy_dfi_p3_wrdata[10]),
	.D8(main_a7ddrphy_dfi_p3_wrdata[26]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~main_a7ddrphy_dq_oe_delayed)),
	.TCE(1'd1),
	.OQ(main_a7ddrphy_dq_o_nodelay10),
	.TQ(main_a7ddrphy_dq_t10)
);
ISERDESE2 #(
	.DATA_RATE("DDR"),
	.DATA_WIDTH(3'd4),
	.INTERFACE_TYPE("MEMORY"),
	.IOBDELAY("IFD"),
	.NUM_CE(1'd1),
	.SERDES_MODE("MASTER")
) ISERDESE2_10 (
	.BITSLIP(1'd0),
	.CE1(1'd1),
	.CLK(main_a7ddrphy_dqs_i_delayed[1]),
	.CLKB((~main_a7ddrphy_dqs_i_delayed[1])),
	.CLKDIV(sys2x_clk),
	.DDLY(main_a7ddrphy_dq_i_delayed10),
	.OCLK(sys4x_clk),
	.OCLKB((~sys4x_clk)),
	.RST(sys_rst),
	.Q1(main_a7ddrphy_dq_i_data_sys2x10[3]),
	.Q2(main_a7ddrphy_dq_i_data_sys2x10[2]),
	.Q3(main_a7ddrphy_dq_i_data_sys2x10[1]),
	.Q4(main_a7ddrphy_dq_i_data_sys2x10[0])
);
IDELAYE2 #(
	.CINVCTRL_SEL("FALSE"),
	.DELAY_SRC("IDATAIN"),
	.HIGH_PERFORMANCE_MODE("TRUE"),
	.IDELAY_TYPE("VARIABLE"),
	.IDELAY_VALUE(1'd0),
	.PIPE_SEL("FALSE"),
	.REFCLK_FREQUENCY(200.0),
	.SIGNAL_PATTERN("DATA")
) IDELAYE2_12 (
	.C(sys_clk),
	.CE((main_a7ddrphy_dly_sel_storage[1] & main_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(main_a7ddrphy_dq_i_nodelay10),
	.INC(1'd1),
	.LD((main_a7ddrphy_dly_sel_storage[1] & main_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(main_a7ddrphy_dq_i_delayed10)
);
IOBUF IOBUF_10(
	.I(main_a7ddrphy_dq_o_nodelay10),
	.T(main_a7ddrphy_dq_t10),
	.IO(ddram_dq[10]),
	.O(main_a7ddrphy_dq_i_nodelay10)
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_40 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_wrdata[11]),
	.D2(main_a7ddrphy_dfi_p0_wrdata[27]),
	.D3(main_a7ddrphy_dfi_p1_wrdata[11]),
	.D4(main_a7ddrphy_dfi_p1_wrdata[27]),
	.D5(main_a7ddrphy_dfi_p2_wrdata[11]),
	.D6(main_a7ddrphy_dfi_p2_wrdata[27]),
	.D7(main_a7ddrphy_dfi_p3_wrdata[11]),
	.D8(main_a7ddrphy_dfi_p3_wrdata[27]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~main_a7ddrphy_dq_oe_delayed)),
	.TCE(1'd1),
	.OQ(main_a7ddrphy_dq_o_nodelay11),
	.TQ(main_a7ddrphy_dq_t11)
);
ISERDESE2 #(
	.DATA_RATE("DDR"),
	.DATA_WIDTH(3'd4),
	.INTERFACE_TYPE("MEMORY"),
	.IOBDELAY("IFD"),
	.NUM_CE(1'd1),
	.SERDES_MODE("MASTER")
) ISERDESE2_11 (
	.BITSLIP(1'd0),
	.CE1(1'd1),
	.CLK(main_a7ddrphy_dqs_i_delayed[1]),
	.CLKB((~main_a7ddrphy_dqs_i_delayed[1])),
	.CLKDIV(sys2x_clk),
	.DDLY(main_a7ddrphy_dq_i_delayed11),
	.OCLK(sys4x_clk),
	.OCLKB((~sys4x_clk)),
	.RST(sys_rst),
	.Q1(main_a7ddrphy_dq_i_data_sys2x11[3]),
	.Q2(main_a7ddrphy_dq_i_data_sys2x11[2]),
	.Q3(main_a7ddrphy_dq_i_data_sys2x11[1]),
	.Q4(main_a7ddrphy_dq_i_data_sys2x11[0])
);
IDELAYE2 #(
	.CINVCTRL_SEL("FALSE"),
	.DELAY_SRC("IDATAIN"),
	.HIGH_PERFORMANCE_MODE("TRUE"),
	.IDELAY_TYPE("VARIABLE"),
	.IDELAY_VALUE(1'd0),
	.PIPE_SEL("FALSE"),
	.REFCLK_FREQUENCY(200.0),
	.SIGNAL_PATTERN("DATA")
) IDELAYE2_13 (
	.C(sys_clk),
	.CE((main_a7ddrphy_dly_sel_storage[1] & main_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(main_a7ddrphy_dq_i_nodelay11),
	.INC(1'd1),
	.LD((main_a7ddrphy_dly_sel_storage[1] & main_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(main_a7ddrphy_dq_i_delayed11)
);
IOBUF IOBUF_11(
	.I(main_a7ddrphy_dq_o_nodelay11),
	.T(main_a7ddrphy_dq_t11),
	.IO(ddram_dq[11]),
	.O(main_a7ddrphy_dq_i_nodelay11)
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_41 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_wrdata[12]),
	.D2(main_a7ddrphy_dfi_p0_wrdata[28]),
	.D3(main_a7ddrphy_dfi_p1_wrdata[12]),
	.D4(main_a7ddrphy_dfi_p1_wrdata[28]),
	.D5(main_a7ddrphy_dfi_p2_wrdata[12]),
	.D6(main_a7ddrphy_dfi_p2_wrdata[28]),
	.D7(main_a7ddrphy_dfi_p3_wrdata[12]),
	.D8(main_a7ddrphy_dfi_p3_wrdata[28]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~main_a7ddrphy_dq_oe_delayed)),
	.TCE(1'd1),
	.OQ(main_a7ddrphy_dq_o_nodelay12),
	.TQ(main_a7ddrphy_dq_t12)
);
ISERDESE2 #(
	.DATA_RATE("DDR"),
	.DATA_WIDTH(3'd4),
	.INTERFACE_TYPE("MEMORY"),
	.IOBDELAY("IFD"),
	.NUM_CE(1'd1),
	.SERDES_MODE("MASTER")
) ISERDESE2_12 (
	.BITSLIP(1'd0),
	.CE1(1'd1),
	.CLK(main_a7ddrphy_dqs_i_delayed[1]),
	.CLKB((~main_a7ddrphy_dqs_i_delayed[1])),
	.CLKDIV(sys2x_clk),
	.DDLY(main_a7ddrphy_dq_i_delayed12),
	.OCLK(sys4x_clk),
	.OCLKB((~sys4x_clk)),
	.RST(sys_rst),
	.Q1(main_a7ddrphy_dq_i_data_sys2x12[3]),
	.Q2(main_a7ddrphy_dq_i_data_sys2x12[2]),
	.Q3(main_a7ddrphy_dq_i_data_sys2x12[1]),
	.Q4(main_a7ddrphy_dq_i_data_sys2x12[0])
);
IDELAYE2 #(
	.CINVCTRL_SEL("FALSE"),
	.DELAY_SRC("IDATAIN"),
	.HIGH_PERFORMANCE_MODE("TRUE"),
	.IDELAY_TYPE("VARIABLE"),
	.IDELAY_VALUE(1'd0),
	.PIPE_SEL("FALSE"),
	.REFCLK_FREQUENCY(200.0),
	.SIGNAL_PATTERN("DATA")
) IDELAYE2_14 (
	.C(sys_clk),
	.CE((main_a7ddrphy_dly_sel_storage[1] & main_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(main_a7ddrphy_dq_i_nodelay12),
	.INC(1'd1),
	.LD((main_a7ddrphy_dly_sel_storage[1] & main_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(main_a7ddrphy_dq_i_delayed12)
);
IOBUF IOBUF_12(
	.I(main_a7ddrphy_dq_o_nodelay12),
	.T(main_a7ddrphy_dq_t12),
	.IO(ddram_dq[12]),
	.O(main_a7ddrphy_dq_i_nodelay12)
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_42 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_wrdata[13]),
	.D2(main_a7ddrphy_dfi_p0_wrdata[29]),
	.D3(main_a7ddrphy_dfi_p1_wrdata[13]),
	.D4(main_a7ddrphy_dfi_p1_wrdata[29]),
	.D5(main_a7ddrphy_dfi_p2_wrdata[13]),
	.D6(main_a7ddrphy_dfi_p2_wrdata[29]),
	.D7(main_a7ddrphy_dfi_p3_wrdata[13]),
	.D8(main_a7ddrphy_dfi_p3_wrdata[29]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~main_a7ddrphy_dq_oe_delayed)),
	.TCE(1'd1),
	.OQ(main_a7ddrphy_dq_o_nodelay13),
	.TQ(main_a7ddrphy_dq_t13)
);
ISERDESE2 #(
	.DATA_RATE("DDR"),
	.DATA_WIDTH(3'd4),
	.INTERFACE_TYPE("MEMORY"),
	.IOBDELAY("IFD"),
	.NUM_CE(1'd1),
	.SERDES_MODE("MASTER")
) ISERDESE2_13 (
	.BITSLIP(1'd0),
	.CE1(1'd1),
	.CLK(main_a7ddrphy_dqs_i_delayed[1]),
	.CLKB((~main_a7ddrphy_dqs_i_delayed[1])),
	.CLKDIV(sys2x_clk),
	.DDLY(main_a7ddrphy_dq_i_delayed13),
	.OCLK(sys4x_clk),
	.OCLKB((~sys4x_clk)),
	.RST(sys_rst),
	.Q1(main_a7ddrphy_dq_i_data_sys2x13[3]),
	.Q2(main_a7ddrphy_dq_i_data_sys2x13[2]),
	.Q3(main_a7ddrphy_dq_i_data_sys2x13[1]),
	.Q4(main_a7ddrphy_dq_i_data_sys2x13[0])
);
IDELAYE2 #(
	.CINVCTRL_SEL("FALSE"),
	.DELAY_SRC("IDATAIN"),
	.HIGH_PERFORMANCE_MODE("TRUE"),
	.IDELAY_TYPE("VARIABLE"),
	.IDELAY_VALUE(1'd0),
	.PIPE_SEL("FALSE"),
	.REFCLK_FREQUENCY(200.0),
	.SIGNAL_PATTERN("DATA")
) IDELAYE2_15 (
	.C(sys_clk),
	.CE((main_a7ddrphy_dly_sel_storage[1] & main_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(main_a7ddrphy_dq_i_nodelay13),
	.INC(1'd1),
	.LD((main_a7ddrphy_dly_sel_storage[1] & main_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(main_a7ddrphy_dq_i_delayed13)
);
IOBUF IOBUF_13(
	.I(main_a7ddrphy_dq_o_nodelay13),
	.T(main_a7ddrphy_dq_t13),
	.IO(ddram_dq[13]),
	.O(main_a7ddrphy_dq_i_nodelay13)
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_43 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_wrdata[14]),
	.D2(main_a7ddrphy_dfi_p0_wrdata[30]),
	.D3(main_a7ddrphy_dfi_p1_wrdata[14]),
	.D4(main_a7ddrphy_dfi_p1_wrdata[30]),
	.D5(main_a7ddrphy_dfi_p2_wrdata[14]),
	.D6(main_a7ddrphy_dfi_p2_wrdata[30]),
	.D7(main_a7ddrphy_dfi_p3_wrdata[14]),
	.D8(main_a7ddrphy_dfi_p3_wrdata[30]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~main_a7ddrphy_dq_oe_delayed)),
	.TCE(1'd1),
	.OQ(main_a7ddrphy_dq_o_nodelay14),
	.TQ(main_a7ddrphy_dq_t14)
);
ISERDESE2 #(
	.DATA_RATE("DDR"),
	.DATA_WIDTH(3'd4),
	.INTERFACE_TYPE("MEMORY"),
	.IOBDELAY("IFD"),
	.NUM_CE(1'd1),
	.SERDES_MODE("MASTER")
) ISERDESE2_14 (
	.BITSLIP(1'd0),
	.CE1(1'd1),
	.CLK(main_a7ddrphy_dqs_i_delayed[1]),
	.CLKB((~main_a7ddrphy_dqs_i_delayed[1])),
	.CLKDIV(sys2x_clk),
	.DDLY(main_a7ddrphy_dq_i_delayed14),
	.OCLK(sys4x_clk),
	.OCLKB((~sys4x_clk)),
	.RST(sys_rst),
	.Q1(main_a7ddrphy_dq_i_data_sys2x14[3]),
	.Q2(main_a7ddrphy_dq_i_data_sys2x14[2]),
	.Q3(main_a7ddrphy_dq_i_data_sys2x14[1]),
	.Q4(main_a7ddrphy_dq_i_data_sys2x14[0])
);
IDELAYE2 #(
	.CINVCTRL_SEL("FALSE"),
	.DELAY_SRC("IDATAIN"),
	.HIGH_PERFORMANCE_MODE("TRUE"),
	.IDELAY_TYPE("VARIABLE"),
	.IDELAY_VALUE(1'd0),
	.PIPE_SEL("FALSE"),
	.REFCLK_FREQUENCY(200.0),
	.SIGNAL_PATTERN("DATA")
) IDELAYE2_16 (
	.C(sys_clk),
	.CE((main_a7ddrphy_dly_sel_storage[1] & main_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(main_a7ddrphy_dq_i_nodelay14),
	.INC(1'd1),
	.LD((main_a7ddrphy_dly_sel_storage[1] & main_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(main_a7ddrphy_dq_i_delayed14)
);
IOBUF IOBUF_14(
	.I(main_a7ddrphy_dq_o_nodelay14),
	.T(main_a7ddrphy_dq_t14),
	.IO(ddram_dq[14]),
	.O(main_a7ddrphy_dq_i_nodelay14)
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_44 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_a7ddrphy_dfi_p0_wrdata[15]),
	.D2(main_a7ddrphy_dfi_p0_wrdata[31]),
	.D3(main_a7ddrphy_dfi_p1_wrdata[15]),
	.D4(main_a7ddrphy_dfi_p1_wrdata[31]),
	.D5(main_a7ddrphy_dfi_p2_wrdata[15]),
	.D6(main_a7ddrphy_dfi_p2_wrdata[31]),
	.D7(main_a7ddrphy_dfi_p3_wrdata[15]),
	.D8(main_a7ddrphy_dfi_p3_wrdata[31]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~main_a7ddrphy_dq_oe_delayed)),
	.TCE(1'd1),
	.OQ(main_a7ddrphy_dq_o_nodelay15),
	.TQ(main_a7ddrphy_dq_t15)
);
ISERDESE2 #(
	.DATA_RATE("DDR"),
	.DATA_WIDTH(3'd4),
	.INTERFACE_TYPE("MEMORY"),
	.IOBDELAY("IFD"),
	.NUM_CE(1'd1),
	.SERDES_MODE("MASTER")
) ISERDESE2_15 (
	.BITSLIP(1'd0),
	.CE1(1'd1),
	.CLK(main_a7ddrphy_dqs_i_delayed[1]),
	.CLKB((~main_a7ddrphy_dqs_i_delayed[1])),
	.CLKDIV(sys2x_clk),
	.DDLY(main_a7ddrphy_dq_i_delayed15),
	.OCLK(sys4x_clk),
	.OCLKB((~sys4x_clk)),
	.RST(sys_rst),
	.Q1(main_a7ddrphy_dq_i_data_sys2x15[3]),
	.Q2(main_a7ddrphy_dq_i_data_sys2x15[2]),
	.Q3(main_a7ddrphy_dq_i_data_sys2x15[1]),
	.Q4(main_a7ddrphy_dq_i_data_sys2x15[0])
);
IDELAYE2 #(
	.CINVCTRL_SEL("FALSE"),
	.DELAY_SRC("IDATAIN"),
	.HIGH_PERFORMANCE_MODE("TRUE"),
	.IDELAY_TYPE("VARIABLE"),
	.IDELAY_VALUE(1'd0),
	.PIPE_SEL("FALSE"),
	.REFCLK_FREQUENCY(200.0),
	.SIGNAL_PATTERN("DATA")
) IDELAYE2_17 (
	.C(sys_clk),
	.CE((main_a7ddrphy_dly_sel_storage[1] & main_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(main_a7ddrphy_dq_i_nodelay15),
	.INC(1'd1),
	.LD((main_a7ddrphy_dly_sel_storage[1] & main_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(main_a7ddrphy_dq_i_delayed15)
);
IOBUF IOBUF_15(
	.I(main_a7ddrphy_dq_o_nodelay15),
	.T(main_a7ddrphy_dq_t15),
	.IO(ddram_dq[15]),
	.O(main_a7ddrphy_dq_i_nodelay15)
);
reg [23:0] storage_2[0:7];
reg [23:0] memdat_5;
always @(posedge sys_clk) begin
	if (main_sdram_bankmachine0_cmd_buffer_lookahead_wrport_we)
		storage_2[main_sdram_bankmachine0_cmd_buffer_lookahead_wrport_adr] <= main_sdram_bankmachine0_cmd_buffer_lookahead_wrport_dat_w;
	memdat_5 <= storage_2[main_sdram_bankmachine0_cmd_buffer_lookahead_wrport_adr];
end
always @(posedge sys_clk) begin
end
assign main_sdram_bankmachine0_cmd_buffer_lookahead_wrport_dat_r = memdat_5;
assign main_sdram_bankmachine0_cmd_buffer_lookahead_rdport_dat_r = storage_2[main_sdram_bankmachine0_cmd_buffer_lookahead_rdport_adr];
reg [23:0] storage_3[0:7];
reg [23:0] memdat_6;
always @(posedge sys_clk) begin
	if (main_sdram_bankmachine1_cmd_buffer_lookahead_wrport_we)
		storage_3[main_sdram_bankmachine1_cmd_buffer_lookahead_wrport_adr] <= main_sdram_bankmachine1_cmd_buffer_lookahead_wrport_dat_w;
	memdat_6 <= storage_3[main_sdram_bankmachine1_cmd_buffer_lookahead_wrport_adr];
end
always @(posedge sys_clk) begin
end
assign main_sdram_bankmachine1_cmd_buffer_lookahead_wrport_dat_r = memdat_6;
assign main_sdram_bankmachine1_cmd_buffer_lookahead_rdport_dat_r = storage_3[main_sdram_bankmachine1_cmd_buffer_lookahead_rdport_adr];
reg [23:0] storage_4[0:7];
reg [23:0] memdat_7;
always @(posedge sys_clk) begin
	if (main_sdram_bankmachine2_cmd_buffer_lookahead_wrport_we)
		storage_4[main_sdram_bankmachine2_cmd_buffer_lookahead_wrport_adr] <= main_sdram_bankmachine2_cmd_buffer_lookahead_wrport_dat_w;
	memdat_7 <= storage_4[main_sdram_bankmachine2_cmd_buffer_lookahead_wrport_adr];
end
always @(posedge sys_clk) begin
end
assign main_sdram_bankmachine2_cmd_buffer_lookahead_wrport_dat_r = memdat_7;
assign main_sdram_bankmachine2_cmd_buffer_lookahead_rdport_dat_r = storage_4[main_sdram_bankmachine2_cmd_buffer_lookahead_rdport_adr];
reg [23:0] storage_5[0:7];
reg [23:0] memdat_8;
always @(posedge sys_clk) begin
	if (main_sdram_bankmachine3_cmd_buffer_lookahead_wrport_we)
		storage_5[main_sdram_bankmachine3_cmd_buffer_lookahead_wrport_adr] <= main_sdram_bankmachine3_cmd_buffer_lookahead_wrport_dat_w;
	memdat_8 <= storage_5[main_sdram_bankmachine3_cmd_buffer_lookahead_wrport_adr];
end
always @(posedge sys_clk) begin
end
assign main_sdram_bankmachine3_cmd_buffer_lookahead_wrport_dat_r = memdat_8;
assign main_sdram_bankmachine3_cmd_buffer_lookahead_rdport_dat_r = storage_5[main_sdram_bankmachine3_cmd_buffer_lookahead_rdport_adr];
reg [23:0] storage_6[0:7];
reg [23:0] memdat_9;
always @(posedge sys_clk) begin
	if (main_sdram_bankmachine4_cmd_buffer_lookahead_wrport_we)
		storage_6[main_sdram_bankmachine4_cmd_buffer_lookahead_wrport_adr] <= main_sdram_bankmachine4_cmd_buffer_lookahead_wrport_dat_w;
	memdat_9 <= storage_6[main_sdram_bankmachine4_cmd_buffer_lookahead_wrport_adr];
end
always @(posedge sys_clk) begin
end
assign main_sdram_bankmachine4_cmd_buffer_lookahead_wrport_dat_r = memdat_9;
assign main_sdram_bankmachine4_cmd_buffer_lookahead_rdport_dat_r = storage_6[main_sdram_bankmachine4_cmd_buffer_lookahead_rdport_adr];
reg [23:0] storage_7[0:7];
reg [23:0] memdat_10;
always @(posedge sys_clk) begin
	if (main_sdram_bankmachine5_cmd_buffer_lookahead_wrport_we)
		storage_7[main_sdram_bankmachine5_cmd_buffer_lookahead_wrport_adr] <= main_sdram_bankmachine5_cmd_buffer_lookahead_wrport_dat_w;
	memdat_10 <= storage_7[main_sdram_bankmachine5_cmd_buffer_lookahead_wrport_adr];
end
always @(posedge sys_clk) begin
end
assign main_sdram_bankmachine5_cmd_buffer_lookahead_wrport_dat_r = memdat_10;
assign main_sdram_bankmachine5_cmd_buffer_lookahead_rdport_dat_r = storage_7[main_sdram_bankmachine5_cmd_buffer_lookahead_rdport_adr];
reg [23:0] storage_8[0:7];
reg [23:0] memdat_11;
always @(posedge sys_clk) begin
	if (main_sdram_bankmachine6_cmd_buffer_lookahead_wrport_we)
		storage_8[main_sdram_bankmachine6_cmd_buffer_lookahead_wrport_adr] <= main_sdram_bankmachine6_cmd_buffer_lookahead_wrport_dat_w;
	memdat_11 <= storage_8[main_sdram_bankmachine6_cmd_buffer_lookahead_wrport_adr];
end
always @(posedge sys_clk) begin
end
assign main_sdram_bankmachine6_cmd_buffer_lookahead_wrport_dat_r = memdat_11;
assign main_sdram_bankmachine6_cmd_buffer_lookahead_rdport_dat_r = storage_8[main_sdram_bankmachine6_cmd_buffer_lookahead_rdport_adr];
reg [23:0] storage_9[0:7];
reg [23:0] memdat_12;
always @(posedge sys_clk) begin
	if (main_sdram_bankmachine7_cmd_buffer_lookahead_wrport_we)
		storage_9[main_sdram_bankmachine7_cmd_buffer_lookahead_wrport_adr] <= main_sdram_bankmachine7_cmd_buffer_lookahead_wrport_dat_w;
	memdat_12 <= storage_9[main_sdram_bankmachine7_cmd_buffer_lookahead_wrport_adr];
end
always @(posedge sys_clk) begin
end
assign main_sdram_bankmachine7_cmd_buffer_lookahead_wrport_dat_r = memdat_12;
assign main_sdram_bankmachine7_cmd_buffer_lookahead_rdport_dat_r = storage_9[main_sdram_bankmachine7_cmd_buffer_lookahead_rdport_adr];
VexRiscvLitexSmpCluster_4c VexRiscvLitexSmpCluster_4c(
	.clk(sys_clk),
	.debugResetIn((sys_rst | main_basesoc_vexriscvsmp_reset)),
	.io_clint_ADR(main_basesoc_vexriscvsmp_cbus_adr),
	.io_clint_CYC(main_basesoc_vexriscvsmp_cbus_cyc),
	.io_clint_DAT_MOSI(main_basesoc_vexriscvsmp_cbus_dat_w),
	.io_clint_STB(main_basesoc_vexriscvsmp_cbus_stb),
	.io_clint_WE(main_basesoc_vexriscvsmp_cbus_we),
	.io_dMem_cmd_ready(main_basesoc_vexriscvsmp_dbus_cmd_ready),
	.io_dMem_rdata_payload_data(main_basesoc_vexriscvsmp_dbus_rdata_payload_data),
	.io_dMem_rdata_valid(main_basesoc_vexriscvsmp_dbus_rdata_valid),
	.io_dMem_wdata_ready(main_basesoc_vexriscvsmp_dbus_wdata_ready),
	.io_externalInterrupts(1'd0),
	.io_externalSupervisorInterrupts(1'd0),
	.io_iMem_cmd_ready(main_basesoc_vexriscvsmp_ibus_cmd_ready),
	.io_iMem_rdata_payload_data(main_basesoc_vexriscvsmp_ibus_rdata_payload_data),
	.io_iMem_rdata_valid(main_basesoc_vexriscvsmp_ibus_rdata_valid),
	.io_iMem_wdata_ready(main_basesoc_vexriscvsmp_ibus_wdata_ready),
	.io_jtag_tck(1'd0),
	.io_jtag_tdi(1'd0),
	.io_jtag_tms(1'd0),
	.io_peripheral_ACK(main_basesoc_vexriscvsmp_pbus_ack),
	.io_peripheral_DAT_MISO(main_basesoc_vexriscvsmp_pbus_dat_r),
	.io_peripheral_ERR(main_basesoc_vexriscvsmp_pbus_err),
	.reset((sys_rst | main_basesoc_vexriscvsmp_reset)),
	.io_clint_ACK(main_basesoc_vexriscvsmp_cbus_ack),
	.io_clint_DAT_MISO(main_basesoc_vexriscvsmp_cbus_dat_r),
	.io_dMem_cmd_payload_addr(main_basesoc_vexriscvsmp_dbus_cmd_payload_addr),
	.io_dMem_cmd_payload_we(main_basesoc_vexriscvsmp_dbus_cmd_payload_we),
	.io_dMem_cmd_valid(main_basesoc_vexriscvsmp_dbus_cmd_valid),
	.io_dMem_rdata_ready(main_basesoc_vexriscvsmp_dbus_rdata_ready),
	.io_dMem_wdata_payload_data(main_basesoc_vexriscvsmp_dbus_wdata_payload_data),
	.io_dMem_wdata_payload_we(main_basesoc_vexriscvsmp_dbus_wdata_payload_we),
	.io_dMem_wdata_valid(main_basesoc_vexriscvsmp_dbus_wdata_valid),
	.io_debugReset(main_basesoc_vexriscvsmp0),
	.io_iMem_cmd_payload_addr(main_basesoc_vexriscvsmp_ibus_cmd_payload_addr),
	.io_iMem_cmd_payload_we(main_basesoc_vexriscvsmp_ibus_cmd_payload_we),
	.io_iMem_cmd_valid(main_basesoc_vexriscvsmp_ibus_cmd_valid),
	.io_iMem_rdata_ready(main_basesoc_vexriscvsmp_ibus_rdata_ready),
	.io_iMem_wdata_payload_data(main_basesoc_vexriscvsmp_ibus_wdata_payload_data),
	.io_iMem_wdata_payload_we(main_basesoc_vexriscvsmp_ibus_wdata_payload_we),
	.io_iMem_wdata_valid(main_basesoc_vexriscvsmp_ibus_wdata_valid),
	.io_jtag_tdo(main_basesoc_vexriscvsmp1),
	.io_peripheral_ADR(main_basesoc_vexriscvsmp_pbus_adr),
	.io_peripheral_BTE(main_basesoc_vexriscvsmp_pbus_bte),
	.io_peripheral_CTI(main_basesoc_vexriscvsmp_pbus_cti),
	.io_peripheral_CYC(main_basesoc_vexriscvsmp_pbus_cyc),
	.io_peripheral_DAT_MOSI(main_basesoc_vexriscvsmp_pbus_dat_w),
	.io_peripheral_SEL(main_basesoc_vexriscvsmp_pbus_sel),
	.io_peripheral_STB(main_basesoc_vexriscvsmp_pbus_stb),
	.io_peripheral_WE(main_basesoc_vexriscvsmp_pbus_we)
);
PLLE2_ADV #(
	.CLKFBOUT_MULT(5'd16),
	.CLKIN1_PERIOD(10.0),
	.CLKOUT0_DIVIDE(5'd16),
	.CLKOUT0_PHASE(1'd0),
	.CLKOUT1_DIVIDE(4'd8),
	.CLKOUT1_PHASE(1'd0),
	.CLKOUT2_DIVIDE(3'd4),
	.CLKOUT2_PHASE(1'd0),
	.CLKOUT3_DIVIDE(3'd4),
	.CLKOUT3_PHASE(7'd90),
	.CLKOUT4_DIVIDE(4'd8),
	.CLKOUT4_PHASE(1'd0),
	.CLKOUT5_DIVIDE(7'd64),
	.CLKOUT5_PHASE(1'd0),
	.DIVCLK_DIVIDE(1'd1),
	.REF_JITTER1(0.01),
	.STARTUP_WAIT("FALSE")
) PLLE2_ADV (
	.CLKFBIN(builder_pll_fb),
	.CLKIN1(main_clkin),
	.RST(main_reset),
	.CLKFBOUT(builder_pll_fb),
	.CLKOUT0(main_clkout0),
	.CLKOUT1(main_clkout1),
	.CLKOUT2(main_clkout2),
	.CLKOUT3(main_clkout3),
	.CLKOUT4(main_clkout4),
	.CLKOUT5(main_clkout5),
	.LOCKED(main_locked)
);
(* ars_ff1 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE (
	.C(sys_clk),
	.CE(1'd1),
	.D(1'd0),
	.PRE(builder_xilinxasyncresetsynchronizerimpl0),
	.Q(builder_xilinxasyncresetsynchronizerimpl0_rst_meta)
);
(* ars_ff2 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_1 (
	.C(sys_clk),
	.CE(1'd1),
	.D(builder_xilinxasyncresetsynchronizerimpl0_rst_meta),
	.PRE(builder_xilinxasyncresetsynchronizerimpl0),
	.Q(sys_rst)
);
(* ars_ff1 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_2 (
	.C(sys2x_clk),
	.CE(1'd1),
	.D(1'd0),
	.PRE(builder_xilinxasyncresetsynchronizerimpl1),
	.Q(builder_xilinxasyncresetsynchronizerimpl1_rst_meta)
);
(* ars_ff2 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_3 (
	.C(sys2x_clk),
	.CE(1'd1),
	.D(builder_xilinxasyncresetsynchronizerimpl1_rst_meta),
	.PRE(builder_xilinxasyncresetsynchronizerimpl1),
	.Q(builder_xilinxasyncresetsynchronizerimpl1_expr)
);
(* ars_ff1 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_4 (
	.C(sys4x_clk),
	.CE(1'd1),
	.D(1'd0),
	.PRE(builder_xilinxasyncresetsynchronizerimpl2),
	.Q(builder_xilinxasyncresetsynchronizerimpl2_rst_meta)
);
(* ars_ff2 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_5 (
	.C(sys4x_clk),
	.CE(1'd1),
	.D(builder_xilinxasyncresetsynchronizerimpl2_rst_meta),
	.PRE(builder_xilinxasyncresetsynchronizerimpl2),
	.Q(builder_xilinxasyncresetsynchronizerimpl2_expr)
);
(* ars_ff1 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_6 (
	.C(sys4x_dqs_clk),
	.CE(1'd1),
	.D(1'd0),
	.PRE(builder_xilinxasyncresetsynchronizerimpl3),
	.Q(builder_xilinxasyncresetsynchronizerimpl3_rst_meta)
);
(* ars_ff2 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_7 (
	.C(sys4x_dqs_clk),
	.CE(1'd1),
	.D(builder_xilinxasyncresetsynchronizerimpl3_rst_meta),
	.PRE(builder_xilinxasyncresetsynchronizerimpl3),
	.Q(builder_xilinxasyncresetsynchronizerimpl3_expr)
);
(* ars_ff1 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_8 (
	.C(clk200_clk),
	.CE(1'd1),
	.D(1'd0),
	.PRE(builder_xilinxasyncresetsynchronizerimpl4),
	.Q(builder_xilinxasyncresetsynchronizerimpl4_rst_meta)
);
(* ars_ff2 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_9 (
	.C(clk200_clk),
	.CE(1'd1),
	.D(builder_xilinxasyncresetsynchronizerimpl4_rst_meta),
	.PRE(builder_xilinxasyncresetsynchronizerimpl4),
	.Q(clk200_rst)
);
(* ars_ff1 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_10 (
	.C(eth_clk),
	.CE(1'd1),
	.D(1'd0),
	.PRE(builder_xilinxasyncresetsynchronizerimpl5),
	.Q(builder_xilinxasyncresetsynchronizerimpl5_rst_meta)
);
(* ars_ff2 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_11 (
	.C(eth_clk),
	.CE(1'd1),
	.D(builder_xilinxasyncresetsynchronizerimpl5_rst_meta),
	.PRE(builder_xilinxasyncresetsynchronizerimpl5),
	.Q(eth_rst)
);
endmodule