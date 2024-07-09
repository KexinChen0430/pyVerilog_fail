module top(
	output reg serial_tx,
	input serial_rx,
	input cpu_reset,
	input clk100,
	output eth_ref_clk,
	output [13:0] ddram_a,
	output [2:0] ddram_ba,
	output ddram_ras_n,
	output ddram_cas_n,
	output ddram_we_n,
	output ddram_cs_n,
	output [1:0] ddram_dm,
	inout [15:0] ddram_dq,
	output [1:0] ddram_dqs_p,
	output [1:0] ddram_dqs_n,
	output ddram_clk_p,
	output ddram_clk_n,
	output ddram_cke,
	output ddram_odt,
	output ddram_reset_n,
	input eth_clocks_tx,
	input eth_clocks_rx,
	output eth_rst_n,
	inout eth_mdio,
	output eth_mdc,
	input eth_rx_dv,
	input eth_rx_er,
	input [3:0] eth_rx_data,
	output reg eth_tx_en,
	output reg [3:0] eth_tx_data,
	input eth_col,
	input eth_crs
);
wire main_ethernetsoc_ctrl_reset_reset_re;
wire main_ethernetsoc_ctrl_reset_reset_r;
reg main_ethernetsoc_ctrl_reset_reset_w = 1'd0;
reg [31:0] main_ethernetsoc_ctrl_storage_full = 32'd305419896;
wire [31:0] main_ethernetsoc_ctrl_storage;
reg main_ethernetsoc_ctrl_re = 1'd0;
wire [31:0] main_ethernetsoc_ctrl_bus_errors_status;
wire main_ethernetsoc_ctrl_reset;
wire main_ethernetsoc_ctrl_bus_error;
reg [31:0] main_ethernetsoc_ctrl_bus_errors = 32'd0;
wire main_ethernetsoc_vexriscv_reset;
wire [29:0] main_ethernetsoc_vexriscv_ibus_adr;
wire [31:0] main_ethernetsoc_vexriscv_ibus_dat_w;
wire [31:0] main_ethernetsoc_vexriscv_ibus_dat_r;
wire [3:0] main_ethernetsoc_vexriscv_ibus_sel;
wire main_ethernetsoc_vexriscv_ibus_cyc;
wire main_ethernetsoc_vexriscv_ibus_stb;
wire main_ethernetsoc_vexriscv_ibus_ack;
wire main_ethernetsoc_vexriscv_ibus_we;
wire [2:0] main_ethernetsoc_vexriscv_ibus_cti;
wire [1:0] main_ethernetsoc_vexriscv_ibus_bte;
wire main_ethernetsoc_vexriscv_ibus_err;
wire [29:0] main_ethernetsoc_vexriscv_dbus_adr;
wire [31:0] main_ethernetsoc_vexriscv_dbus_dat_w;
wire [31:0] main_ethernetsoc_vexriscv_dbus_dat_r;
wire [3:0] main_ethernetsoc_vexriscv_dbus_sel;
wire main_ethernetsoc_vexriscv_dbus_cyc;
wire main_ethernetsoc_vexriscv_dbus_stb;
wire main_ethernetsoc_vexriscv_dbus_ack;
wire main_ethernetsoc_vexriscv_dbus_we;
wire [2:0] main_ethernetsoc_vexriscv_dbus_cti;
wire [1:0] main_ethernetsoc_vexriscv_dbus_bte;
wire main_ethernetsoc_vexriscv_dbus_err;
reg [31:0] main_ethernetsoc_vexriscv_interrupt0 = 32'd0;
wire main_ethernetsoc_vexriscv_latch_re;
wire main_ethernetsoc_vexriscv_latch_r;
reg main_ethernetsoc_vexriscv_latch_w = 1'd0;
reg [63:0] main_ethernetsoc_vexriscv_time_status = 64'd0;
reg [63:0] main_ethernetsoc_vexriscv_time_cmp_storage_full = 64'd18446744073709551615;
wire [63:0] main_ethernetsoc_vexriscv_time_cmp_storage;
reg main_ethernetsoc_vexriscv_time_cmp_re = 1'd0;
wire main_ethernetsoc_vexriscv_interrupt1;
reg [63:0] main_ethernetsoc_vexriscv_time = 64'd0;
reg [63:0] main_ethernetsoc_vexriscv_time_cmp = 64'd18446744073709551615;
wire [29:0] main_ethernetsoc_rom_bus_adr;
wire [31:0] main_ethernetsoc_rom_bus_dat_w;
wire [31:0] main_ethernetsoc_rom_bus_dat_r;
wire [3:0] main_ethernetsoc_rom_bus_sel;
wire main_ethernetsoc_rom_bus_cyc;
wire main_ethernetsoc_rom_bus_stb;
reg main_ethernetsoc_rom_bus_ack = 1'd0;
wire main_ethernetsoc_rom_bus_we;
wire [2:0] main_ethernetsoc_rom_bus_cti;
wire [1:0] main_ethernetsoc_rom_bus_bte;
reg main_ethernetsoc_rom_bus_err = 1'd0;
wire [12:0] main_ethernetsoc_rom_adr;
wire [31:0] main_ethernetsoc_rom_dat_r;
wire [29:0] main_ethernetsoc_sram_bus_adr;
wire [31:0] main_ethernetsoc_sram_bus_dat_w;
wire [31:0] main_ethernetsoc_sram_bus_dat_r;
wire [3:0] main_ethernetsoc_sram_bus_sel;
wire main_ethernetsoc_sram_bus_cyc;
wire main_ethernetsoc_sram_bus_stb;
reg main_ethernetsoc_sram_bus_ack = 1'd0;
wire main_ethernetsoc_sram_bus_we;
wire [2:0] main_ethernetsoc_sram_bus_cti;
wire [1:0] main_ethernetsoc_sram_bus_bte;
reg main_ethernetsoc_sram_bus_err = 1'd0;
wire [12:0] main_ethernetsoc_sram_adr;
wire [31:0] main_ethernetsoc_sram_dat_r;
reg [3:0] main_ethernetsoc_sram_we = 4'd0;
wire [31:0] main_ethernetsoc_sram_dat_w;
reg [13:0] main_ethernetsoc_interface_adr = 14'd0;
reg main_ethernetsoc_interface_we = 1'd0;
reg [7:0] main_ethernetsoc_interface_dat_w = 8'd0;
wire [7:0] main_ethernetsoc_interface_dat_r;
wire [29:0] main_ethernetsoc_bus_wishbone_adr;
wire [31:0] main_ethernetsoc_bus_wishbone_dat_w;
reg [31:0] main_ethernetsoc_bus_wishbone_dat_r = 32'd0;
wire [3:0] main_ethernetsoc_bus_wishbone_sel;
wire main_ethernetsoc_bus_wishbone_cyc;
wire main_ethernetsoc_bus_wishbone_stb;
reg main_ethernetsoc_bus_wishbone_ack = 1'd0;
wire main_ethernetsoc_bus_wishbone_we;
wire [2:0] main_ethernetsoc_bus_wishbone_cti;
wire [1:0] main_ethernetsoc_bus_wishbone_bte;
reg main_ethernetsoc_bus_wishbone_err = 1'd0;
reg [1:0] main_ethernetsoc_counter = 2'd0;
reg [31:0] main_ethernetsoc_uart_phy_storage_full = 32'd4947802;
wire [31:0] main_ethernetsoc_uart_phy_storage;
reg main_ethernetsoc_uart_phy_re = 1'd0;
wire main_ethernetsoc_uart_phy_sink_valid;
reg main_ethernetsoc_uart_phy_sink_ready = 1'd0;
wire main_ethernetsoc_uart_phy_sink_first;
wire main_ethernetsoc_uart_phy_sink_last;
wire [7:0] main_ethernetsoc_uart_phy_sink_payload_data;
reg main_ethernetsoc_uart_phy_uart_clk_txen = 1'd0;
reg [31:0] main_ethernetsoc_uart_phy_phase_accumulator_tx = 32'd0;
reg [7:0] main_ethernetsoc_uart_phy_tx_reg = 8'd0;
reg [3:0] main_ethernetsoc_uart_phy_tx_bitcount = 4'd0;
reg main_ethernetsoc_uart_phy_tx_busy = 1'd0;
reg main_ethernetsoc_uart_phy_source_valid = 1'd0;
wire main_ethernetsoc_uart_phy_source_ready;
reg main_ethernetsoc_uart_phy_source_first = 1'd0;
reg main_ethernetsoc_uart_phy_source_last = 1'd0;
reg [7:0] main_ethernetsoc_uart_phy_source_payload_data = 8'd0;
reg main_ethernetsoc_uart_phy_uart_clk_rxen = 1'd0;
reg [31:0] main_ethernetsoc_uart_phy_phase_accumulator_rx = 32'd0;
wire main_ethernetsoc_uart_phy_rx;
reg main_ethernetsoc_uart_phy_rx_r = 1'd0;
reg [7:0] main_ethernetsoc_uart_phy_rx_reg = 8'd0;
reg [3:0] main_ethernetsoc_uart_phy_rx_bitcount = 4'd0;
reg main_ethernetsoc_uart_phy_rx_busy = 1'd0;
wire main_ethernetsoc_uart_rxtx_re;
wire [7:0] main_ethernetsoc_uart_rxtx_r;
wire [7:0] main_ethernetsoc_uart_rxtx_w;
wire main_ethernetsoc_uart_txfull_status;
wire main_ethernetsoc_uart_rxempty_status;
wire main_ethernetsoc_uart_irq;
wire main_ethernetsoc_uart_tx_status;
reg main_ethernetsoc_uart_tx_pending = 1'd0;
wire main_ethernetsoc_uart_tx_trigger;
reg main_ethernetsoc_uart_tx_clear = 1'd0;
reg main_ethernetsoc_uart_tx_old_trigger = 1'd0;
wire main_ethernetsoc_uart_rx_status;
reg main_ethernetsoc_uart_rx_pending = 1'd0;
wire main_ethernetsoc_uart_rx_trigger;
reg main_ethernetsoc_uart_rx_clear = 1'd0;
reg main_ethernetsoc_uart_rx_old_trigger = 1'd0;
wire main_ethernetsoc_uart_eventmanager_status_re;
wire [1:0] main_ethernetsoc_uart_eventmanager_status_r;
reg [1:0] main_ethernetsoc_uart_eventmanager_status_w = 2'd0;
wire main_ethernetsoc_uart_eventmanager_pending_re;
wire [1:0] main_ethernetsoc_uart_eventmanager_pending_r;
reg [1:0] main_ethernetsoc_uart_eventmanager_pending_w = 2'd0;
reg [1:0] main_ethernetsoc_uart_eventmanager_storage_full = 2'd0;
wire [1:0] main_ethernetsoc_uart_eventmanager_storage;
reg main_ethernetsoc_uart_eventmanager_re = 1'd0;
wire main_ethernetsoc_uart_tx_fifo_sink_valid;
wire main_ethernetsoc_uart_tx_fifo_sink_ready;
reg main_ethernetsoc_uart_tx_fifo_sink_first = 1'd0;
reg main_ethernetsoc_uart_tx_fifo_sink_last = 1'd0;
wire [7:0] main_ethernetsoc_uart_tx_fifo_sink_payload_data;
wire main_ethernetsoc_uart_tx_fifo_source_valid;
wire main_ethernetsoc_uart_tx_fifo_source_ready;
wire main_ethernetsoc_uart_tx_fifo_source_first;
wire main_ethernetsoc_uart_tx_fifo_source_last;
wire [7:0] main_ethernetsoc_uart_tx_fifo_source_payload_data;
wire main_ethernetsoc_uart_tx_fifo_re;
reg main_ethernetsoc_uart_tx_fifo_readable = 1'd0;
wire main_ethernetsoc_uart_tx_fifo_syncfifo_we;
wire main_ethernetsoc_uart_tx_fifo_syncfifo_writable;
wire main_ethernetsoc_uart_tx_fifo_syncfifo_re;
wire main_ethernetsoc_uart_tx_fifo_syncfifo_readable;
wire [9:0] main_ethernetsoc_uart_tx_fifo_syncfifo_din;
wire [9:0] main_ethernetsoc_uart_tx_fifo_syncfifo_dout;
reg [4:0] main_ethernetsoc_uart_tx_fifo_level0 = 5'd0;
reg main_ethernetsoc_uart_tx_fifo_replace = 1'd0;
reg [3:0] main_ethernetsoc_uart_tx_fifo_produce = 4'd0;
reg [3:0] main_ethernetsoc_uart_tx_fifo_consume = 4'd0;
reg [3:0] main_ethernetsoc_uart_tx_fifo_wrport_adr = 4'd0;
wire [9:0] main_ethernetsoc_uart_tx_fifo_wrport_dat_r;
wire main_ethernetsoc_uart_tx_fifo_wrport_we;
wire [9:0] main_ethernetsoc_uart_tx_fifo_wrport_dat_w;
wire main_ethernetsoc_uart_tx_fifo_do_read;
wire [3:0] main_ethernetsoc_uart_tx_fifo_rdport_adr;
wire [9:0] main_ethernetsoc_uart_tx_fifo_rdport_dat_r;
wire main_ethernetsoc_uart_tx_fifo_rdport_re;
wire [4:0] main_ethernetsoc_uart_tx_fifo_level1;
wire [7:0] main_ethernetsoc_uart_tx_fifo_fifo_in_payload_data;
wire main_ethernetsoc_uart_tx_fifo_fifo_in_first;
wire main_ethernetsoc_uart_tx_fifo_fifo_in_last;
wire [7:0] main_ethernetsoc_uart_tx_fifo_fifo_out_payload_data;
wire main_ethernetsoc_uart_tx_fifo_fifo_out_first;
wire main_ethernetsoc_uart_tx_fifo_fifo_out_last;
wire main_ethernetsoc_uart_rx_fifo_sink_valid;
wire main_ethernetsoc_uart_rx_fifo_sink_ready;
wire main_ethernetsoc_uart_rx_fifo_sink_first;
wire main_ethernetsoc_uart_rx_fifo_sink_last;
wire [7:0] main_ethernetsoc_uart_rx_fifo_sink_payload_data;
wire main_ethernetsoc_uart_rx_fifo_source_valid;
wire main_ethernetsoc_uart_rx_fifo_source_ready;
wire main_ethernetsoc_uart_rx_fifo_source_first;
wire main_ethernetsoc_uart_rx_fifo_source_last;
wire [7:0] main_ethernetsoc_uart_rx_fifo_source_payload_data;
wire main_ethernetsoc_uart_rx_fifo_re;
reg main_ethernetsoc_uart_rx_fifo_readable = 1'd0;
wire main_ethernetsoc_uart_rx_fifo_syncfifo_we;
wire main_ethernetsoc_uart_rx_fifo_syncfifo_writable;
wire main_ethernetsoc_uart_rx_fifo_syncfifo_re;
wire main_ethernetsoc_uart_rx_fifo_syncfifo_readable;
wire [9:0] main_ethernetsoc_uart_rx_fifo_syncfifo_din;
wire [9:0] main_ethernetsoc_uart_rx_fifo_syncfifo_dout;
reg [4:0] main_ethernetsoc_uart_rx_fifo_level0 = 5'd0;
reg main_ethernetsoc_uart_rx_fifo_replace = 1'd0;
reg [3:0] main_ethernetsoc_uart_rx_fifo_produce = 4'd0;
reg [3:0] main_ethernetsoc_uart_rx_fifo_consume = 4'd0;
reg [3:0] main_ethernetsoc_uart_rx_fifo_wrport_adr = 4'd0;
wire [9:0] main_ethernetsoc_uart_rx_fifo_wrport_dat_r;
wire main_ethernetsoc_uart_rx_fifo_wrport_we;
wire [9:0] main_ethernetsoc_uart_rx_fifo_wrport_dat_w;
wire main_ethernetsoc_uart_rx_fifo_do_read;
wire [3:0] main_ethernetsoc_uart_rx_fifo_rdport_adr;
wire [9:0] main_ethernetsoc_uart_rx_fifo_rdport_dat_r;
wire main_ethernetsoc_uart_rx_fifo_rdport_re;
wire [4:0] main_ethernetsoc_uart_rx_fifo_level1;
wire [7:0] main_ethernetsoc_uart_rx_fifo_fifo_in_payload_data;
wire main_ethernetsoc_uart_rx_fifo_fifo_in_first;
wire main_ethernetsoc_uart_rx_fifo_fifo_in_last;
wire [7:0] main_ethernetsoc_uart_rx_fifo_fifo_out_payload_data;
wire main_ethernetsoc_uart_rx_fifo_fifo_out_first;
wire main_ethernetsoc_uart_rx_fifo_fifo_out_last;
reg main_ethernetsoc_uart_reset = 1'd0;
reg [31:0] main_ethernetsoc_timer0_load_storage_full = 32'd0;
wire [31:0] main_ethernetsoc_timer0_load_storage;
reg main_ethernetsoc_timer0_load_re = 1'd0;
reg [31:0] main_ethernetsoc_timer0_reload_storage_full = 32'd0;
wire [31:0] main_ethernetsoc_timer0_reload_storage;
reg main_ethernetsoc_timer0_reload_re = 1'd0;
reg main_ethernetsoc_timer0_en_storage_full = 1'd0;
wire main_ethernetsoc_timer0_en_storage;
reg main_ethernetsoc_timer0_en_re = 1'd0;
wire main_ethernetsoc_timer0_update_value_re;
wire main_ethernetsoc_timer0_update_value_r;
reg main_ethernetsoc_timer0_update_value_w = 1'd0;
reg [31:0] main_ethernetsoc_timer0_value_status = 32'd0;
wire main_ethernetsoc_timer0_irq;
wire main_ethernetsoc_timer0_zero_status;
reg main_ethernetsoc_timer0_zero_pending = 1'd0;
wire main_ethernetsoc_timer0_zero_trigger;
reg main_ethernetsoc_timer0_zero_clear = 1'd0;
reg main_ethernetsoc_timer0_zero_old_trigger = 1'd0;
wire main_ethernetsoc_timer0_eventmanager_status_re;
wire main_ethernetsoc_timer0_eventmanager_status_r;
wire main_ethernetsoc_timer0_eventmanager_status_w;
wire main_ethernetsoc_timer0_eventmanager_pending_re;
wire main_ethernetsoc_timer0_eventmanager_pending_r;
wire main_ethernetsoc_timer0_eventmanager_pending_w;
reg main_ethernetsoc_timer0_eventmanager_storage_full = 1'd0;
wire main_ethernetsoc_timer0_eventmanager_storage;
reg main_ethernetsoc_timer0_eventmanager_re = 1'd0;
reg [31:0] main_ethernetsoc_timer0_value = 32'd0;
wire [29:0] main_ethernetsoc_interface0_wb_sdram_adr;
wire [31:0] main_ethernetsoc_interface0_wb_sdram_dat_w;
reg [31:0] main_ethernetsoc_interface0_wb_sdram_dat_r = 32'd0;
wire [3:0] main_ethernetsoc_interface0_wb_sdram_sel;
wire main_ethernetsoc_interface0_wb_sdram_cyc;
wire main_ethernetsoc_interface0_wb_sdram_stb;
reg main_ethernetsoc_interface0_wb_sdram_ack = 1'd0;
wire main_ethernetsoc_interface0_wb_sdram_we;
wire [2:0] main_ethernetsoc_interface0_wb_sdram_cti;
wire [1:0] main_ethernetsoc_interface0_wb_sdram_bte;
reg main_ethernetsoc_interface0_wb_sdram_err = 1'd0;
(* dont_touch = "true" *) wire sys_clk;
wire sys_rst;
(* dont_touch = "true" *) wire sys4x_clk;
(* dont_touch = "true" *) wire sys4x_dqs_clk;
wire clk200_clk;
wire clk200_rst;
wire eth_clk;
wire eth_rst;
wire main_ethernetsoc_reset;
wire main_ethernetsoc_locked;
wire main_ethernetsoc_clkin;
wire main_ethernetsoc_clkout0;
wire main_ethernetsoc_clkout_buf0;
wire main_ethernetsoc_clkout1;
wire main_ethernetsoc_clkout_buf1;
wire main_ethernetsoc_clkout2;
wire main_ethernetsoc_clkout_buf2;
wire main_ethernetsoc_clkout3;
wire main_ethernetsoc_clkout_buf3;
wire main_ethernetsoc_clkout4;
wire main_ethernetsoc_clkout_buf4;
reg [3:0] main_ethernetsoc_reset_counter = 4'd15;
reg main_ethernetsoc_ic_reset = 1'd1;
reg [3:0] main_ethernetsoc_a7ddrphy_half_sys8x_taps_storage_full = 4'd8;
wire [3:0] main_ethernetsoc_a7ddrphy_half_sys8x_taps_storage;
reg main_ethernetsoc_a7ddrphy_half_sys8x_taps_re = 1'd0;
wire main_ethernetsoc_a7ddrphy_cdly_rst_re;
wire main_ethernetsoc_a7ddrphy_cdly_rst_r;
reg main_ethernetsoc_a7ddrphy_cdly_rst_w = 1'd0;
wire main_ethernetsoc_a7ddrphy_cdly_inc_re;
wire main_ethernetsoc_a7ddrphy_cdly_inc_r;
reg main_ethernetsoc_a7ddrphy_cdly_inc_w = 1'd0;
reg [1:0] main_ethernetsoc_a7ddrphy_dly_sel_storage_full = 2'd0;
wire [1:0] main_ethernetsoc_a7ddrphy_dly_sel_storage;
reg main_ethernetsoc_a7ddrphy_dly_sel_re = 1'd0;
wire main_ethernetsoc_a7ddrphy_rdly_dq_rst_re;
wire main_ethernetsoc_a7ddrphy_rdly_dq_rst_r;
reg main_ethernetsoc_a7ddrphy_rdly_dq_rst_w = 1'd0;
wire main_ethernetsoc_a7ddrphy_rdly_dq_inc_re;
wire main_ethernetsoc_a7ddrphy_rdly_dq_inc_r;
reg main_ethernetsoc_a7ddrphy_rdly_dq_inc_w = 1'd0;
wire main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_rst_re;
wire main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_rst_r;
reg main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_rst_w = 1'd0;
wire main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_re;
wire main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_r;
reg main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_w = 1'd0;
wire [13:0] main_ethernetsoc_a7ddrphy_dfi_p0_address;
wire [2:0] main_ethernetsoc_a7ddrphy_dfi_p0_bank;
wire main_ethernetsoc_a7ddrphy_dfi_p0_cas_n;
wire main_ethernetsoc_a7ddrphy_dfi_p0_cs_n;
wire main_ethernetsoc_a7ddrphy_dfi_p0_ras_n;
wire main_ethernetsoc_a7ddrphy_dfi_p0_we_n;
wire main_ethernetsoc_a7ddrphy_dfi_p0_cke;
wire main_ethernetsoc_a7ddrphy_dfi_p0_odt;
wire main_ethernetsoc_a7ddrphy_dfi_p0_reset_n;
wire main_ethernetsoc_a7ddrphy_dfi_p0_act_n;
wire [31:0] main_ethernetsoc_a7ddrphy_dfi_p0_wrdata;
wire main_ethernetsoc_a7ddrphy_dfi_p0_wrdata_en;
wire [3:0] main_ethernetsoc_a7ddrphy_dfi_p0_wrdata_mask;
wire main_ethernetsoc_a7ddrphy_dfi_p0_rddata_en;
reg [31:0] main_ethernetsoc_a7ddrphy_dfi_p0_rddata = 32'd0;
reg main_ethernetsoc_a7ddrphy_dfi_p0_rddata_valid = 1'd0;
wire [13:0] main_ethernetsoc_a7ddrphy_dfi_p1_address;
wire [2:0] main_ethernetsoc_a7ddrphy_dfi_p1_bank;
wire main_ethernetsoc_a7ddrphy_dfi_p1_cas_n;
wire main_ethernetsoc_a7ddrphy_dfi_p1_cs_n;
wire main_ethernetsoc_a7ddrphy_dfi_p1_ras_n;
wire main_ethernetsoc_a7ddrphy_dfi_p1_we_n;
wire main_ethernetsoc_a7ddrphy_dfi_p1_cke;
wire main_ethernetsoc_a7ddrphy_dfi_p1_odt;
wire main_ethernetsoc_a7ddrphy_dfi_p1_reset_n;
wire main_ethernetsoc_a7ddrphy_dfi_p1_act_n;
wire [31:0] main_ethernetsoc_a7ddrphy_dfi_p1_wrdata;
wire main_ethernetsoc_a7ddrphy_dfi_p1_wrdata_en;
wire [3:0] main_ethernetsoc_a7ddrphy_dfi_p1_wrdata_mask;
wire main_ethernetsoc_a7ddrphy_dfi_p1_rddata_en;
reg [31:0] main_ethernetsoc_a7ddrphy_dfi_p1_rddata = 32'd0;
reg main_ethernetsoc_a7ddrphy_dfi_p1_rddata_valid = 1'd0;
wire [13:0] main_ethernetsoc_a7ddrphy_dfi_p2_address;
wire [2:0] main_ethernetsoc_a7ddrphy_dfi_p2_bank;
wire main_ethernetsoc_a7ddrphy_dfi_p2_cas_n;
wire main_ethernetsoc_a7ddrphy_dfi_p2_cs_n;
wire main_ethernetsoc_a7ddrphy_dfi_p2_ras_n;
wire main_ethernetsoc_a7ddrphy_dfi_p2_we_n;
wire main_ethernetsoc_a7ddrphy_dfi_p2_cke;
wire main_ethernetsoc_a7ddrphy_dfi_p2_odt;
wire main_ethernetsoc_a7ddrphy_dfi_p2_reset_n;
wire main_ethernetsoc_a7ddrphy_dfi_p2_act_n;
wire [31:0] main_ethernetsoc_a7ddrphy_dfi_p2_wrdata;
wire main_ethernetsoc_a7ddrphy_dfi_p2_wrdata_en;
wire [3:0] main_ethernetsoc_a7ddrphy_dfi_p2_wrdata_mask;
wire main_ethernetsoc_a7ddrphy_dfi_p2_rddata_en;
reg [31:0] main_ethernetsoc_a7ddrphy_dfi_p2_rddata = 32'd0;
reg main_ethernetsoc_a7ddrphy_dfi_p2_rddata_valid = 1'd0;
wire [13:0] main_ethernetsoc_a7ddrphy_dfi_p3_address;
wire [2:0] main_ethernetsoc_a7ddrphy_dfi_p3_bank;
wire main_ethernetsoc_a7ddrphy_dfi_p3_cas_n;
wire main_ethernetsoc_a7ddrphy_dfi_p3_cs_n;
wire main_ethernetsoc_a7ddrphy_dfi_p3_ras_n;
wire main_ethernetsoc_a7ddrphy_dfi_p3_we_n;
wire main_ethernetsoc_a7ddrphy_dfi_p3_cke;
wire main_ethernetsoc_a7ddrphy_dfi_p3_odt;
wire main_ethernetsoc_a7ddrphy_dfi_p3_reset_n;
wire main_ethernetsoc_a7ddrphy_dfi_p3_act_n;
wire [31:0] main_ethernetsoc_a7ddrphy_dfi_p3_wrdata;
wire main_ethernetsoc_a7ddrphy_dfi_p3_wrdata_en;
wire [3:0] main_ethernetsoc_a7ddrphy_dfi_p3_wrdata_mask;
wire main_ethernetsoc_a7ddrphy_dfi_p3_rddata_en;
reg [31:0] main_ethernetsoc_a7ddrphy_dfi_p3_rddata = 32'd0;
reg main_ethernetsoc_a7ddrphy_dfi_p3_rddata_valid = 1'd0;
wire main_ethernetsoc_a7ddrphy_sd_clk_se_nodelay;
reg main_ethernetsoc_a7ddrphy_oe_dqs = 1'd0;
wire main_ethernetsoc_a7ddrphy_dqs_preamble;
wire main_ethernetsoc_a7ddrphy_dqs_postamble;
reg [7:0] main_ethernetsoc_a7ddrphy_dqs_serdes_pattern = 8'd85;
wire main_ethernetsoc_a7ddrphy_dqs_nodelay0;
wire main_ethernetsoc_a7ddrphy_dqs_t0;
wire main_ethernetsoc_a7ddrphy0;
wire main_ethernetsoc_a7ddrphy_dqs_nodelay1;
wire main_ethernetsoc_a7ddrphy_dqs_t1;
wire main_ethernetsoc_a7ddrphy1;
reg main_ethernetsoc_a7ddrphy_oe_dq = 1'd0;
wire main_ethernetsoc_a7ddrphy_dq_o_nodelay0;
wire main_ethernetsoc_a7ddrphy_dq_i_nodelay0;
wire main_ethernetsoc_a7ddrphy_dq_i_delayed0;
wire main_ethernetsoc_a7ddrphy_dq_t0;
wire [7:0] main_ethernetsoc_a7ddrphy_dq_i_data0;
wire [7:0] main_ethernetsoc_a7ddrphy_bitslip0_i;
reg [7:0] main_ethernetsoc_a7ddrphy_bitslip0_o = 8'd0;
reg [2:0] main_ethernetsoc_a7ddrphy_bitslip0_value = 3'd0;
reg [15:0] main_ethernetsoc_a7ddrphy_bitslip0_r = 16'd0;
wire main_ethernetsoc_a7ddrphy_dq_o_nodelay1;
wire main_ethernetsoc_a7ddrphy_dq_i_nodelay1;
wire main_ethernetsoc_a7ddrphy_dq_i_delayed1;
wire main_ethernetsoc_a7ddrphy_dq_t1;
wire [7:0] main_ethernetsoc_a7ddrphy_dq_i_data1;
wire [7:0] main_ethernetsoc_a7ddrphy_bitslip1_i;
reg [7:0] main_ethernetsoc_a7ddrphy_bitslip1_o = 8'd0;
reg [2:0] main_ethernetsoc_a7ddrphy_bitslip1_value = 3'd0;
reg [15:0] main_ethernetsoc_a7ddrphy_bitslip1_r = 16'd0;
wire main_ethernetsoc_a7ddrphy_dq_o_nodelay2;
wire main_ethernetsoc_a7ddrphy_dq_i_nodelay2;
wire main_ethernetsoc_a7ddrphy_dq_i_delayed2;
wire main_ethernetsoc_a7ddrphy_dq_t2;
wire [7:0] main_ethernetsoc_a7ddrphy_dq_i_data2;
wire [7:0] main_ethernetsoc_a7ddrphy_bitslip2_i;
reg [7:0] main_ethernetsoc_a7ddrphy_bitslip2_o = 8'd0;
reg [2:0] main_ethernetsoc_a7ddrphy_bitslip2_value = 3'd0;
reg [15:0] main_ethernetsoc_a7ddrphy_bitslip2_r = 16'd0;
wire main_ethernetsoc_a7ddrphy_dq_o_nodelay3;
wire main_ethernetsoc_a7ddrphy_dq_i_nodelay3;
wire main_ethernetsoc_a7ddrphy_dq_i_delayed3;
wire main_ethernetsoc_a7ddrphy_dq_t3;
wire [7:0] main_ethernetsoc_a7ddrphy_dq_i_data3;
wire [7:0] main_ethernetsoc_a7ddrphy_bitslip3_i;
reg [7:0] main_ethernetsoc_a7ddrphy_bitslip3_o = 8'd0;
reg [2:0] main_ethernetsoc_a7ddrphy_bitslip3_value = 3'd0;
reg [15:0] main_ethernetsoc_a7ddrphy_bitslip3_r = 16'd0;
wire main_ethernetsoc_a7ddrphy_dq_o_nodelay4;
wire main_ethernetsoc_a7ddrphy_dq_i_nodelay4;
wire main_ethernetsoc_a7ddrphy_dq_i_delayed4;
wire main_ethernetsoc_a7ddrphy_dq_t4;
wire [7:0] main_ethernetsoc_a7ddrphy_dq_i_data4;
wire [7:0] main_ethernetsoc_a7ddrphy_bitslip4_i;
reg [7:0] main_ethernetsoc_a7ddrphy_bitslip4_o = 8'd0;
reg [2:0] main_ethernetsoc_a7ddrphy_bitslip4_value = 3'd0;
reg [15:0] main_ethernetsoc_a7ddrphy_bitslip4_r = 16'd0;
wire main_ethernetsoc_a7ddrphy_dq_o_nodelay5;
wire main_ethernetsoc_a7ddrphy_dq_i_nodelay5;
wire main_ethernetsoc_a7ddrphy_dq_i_delayed5;
wire main_ethernetsoc_a7ddrphy_dq_t5;
wire [7:0] main_ethernetsoc_a7ddrphy_dq_i_data5;
wire [7:0] main_ethernetsoc_a7ddrphy_bitslip5_i;
reg [7:0] main_ethernetsoc_a7ddrphy_bitslip5_o = 8'd0;
reg [2:0] main_ethernetsoc_a7ddrphy_bitslip5_value = 3'd0;
reg [15:0] main_ethernetsoc_a7ddrphy_bitslip5_r = 16'd0;
wire main_ethernetsoc_a7ddrphy_dq_o_nodelay6;
wire main_ethernetsoc_a7ddrphy_dq_i_nodelay6;
wire main_ethernetsoc_a7ddrphy_dq_i_delayed6;
wire main_ethernetsoc_a7ddrphy_dq_t6;
wire [7:0] main_ethernetsoc_a7ddrphy_dq_i_data6;
wire [7:0] main_ethernetsoc_a7ddrphy_bitslip6_i;
reg [7:0] main_ethernetsoc_a7ddrphy_bitslip6_o = 8'd0;
reg [2:0] main_ethernetsoc_a7ddrphy_bitslip6_value = 3'd0;
reg [15:0] main_ethernetsoc_a7ddrphy_bitslip6_r = 16'd0;
wire main_ethernetsoc_a7ddrphy_dq_o_nodelay7;
wire main_ethernetsoc_a7ddrphy_dq_i_nodelay7;
wire main_ethernetsoc_a7ddrphy_dq_i_delayed7;
wire main_ethernetsoc_a7ddrphy_dq_t7;
wire [7:0] main_ethernetsoc_a7ddrphy_dq_i_data7;
wire [7:0] main_ethernetsoc_a7ddrphy_bitslip7_i;
reg [7:0] main_ethernetsoc_a7ddrphy_bitslip7_o = 8'd0;
reg [2:0] main_ethernetsoc_a7ddrphy_bitslip7_value = 3'd0;
reg [15:0] main_ethernetsoc_a7ddrphy_bitslip7_r = 16'd0;
wire main_ethernetsoc_a7ddrphy_dq_o_nodelay8;
wire main_ethernetsoc_a7ddrphy_dq_i_nodelay8;
wire main_ethernetsoc_a7ddrphy_dq_i_delayed8;
wire main_ethernetsoc_a7ddrphy_dq_t8;
wire [7:0] main_ethernetsoc_a7ddrphy_dq_i_data8;
wire [7:0] main_ethernetsoc_a7ddrphy_bitslip8_i;
reg [7:0] main_ethernetsoc_a7ddrphy_bitslip8_o = 8'd0;
reg [2:0] main_ethernetsoc_a7ddrphy_bitslip8_value = 3'd0;
reg [15:0] main_ethernetsoc_a7ddrphy_bitslip8_r = 16'd0;
wire main_ethernetsoc_a7ddrphy_dq_o_nodelay9;
wire main_ethernetsoc_a7ddrphy_dq_i_nodelay9;
wire main_ethernetsoc_a7ddrphy_dq_i_delayed9;
wire main_ethernetsoc_a7ddrphy_dq_t9;
wire [7:0] main_ethernetsoc_a7ddrphy_dq_i_data9;
wire [7:0] main_ethernetsoc_a7ddrphy_bitslip9_i;
reg [7:0] main_ethernetsoc_a7ddrphy_bitslip9_o = 8'd0;
reg [2:0] main_ethernetsoc_a7ddrphy_bitslip9_value = 3'd0;
reg [15:0] main_ethernetsoc_a7ddrphy_bitslip9_r = 16'd0;
wire main_ethernetsoc_a7ddrphy_dq_o_nodelay10;
wire main_ethernetsoc_a7ddrphy_dq_i_nodelay10;
wire main_ethernetsoc_a7ddrphy_dq_i_delayed10;
wire main_ethernetsoc_a7ddrphy_dq_t10;
wire [7:0] main_ethernetsoc_a7ddrphy_dq_i_data10;
wire [7:0] main_ethernetsoc_a7ddrphy_bitslip10_i;
reg [7:0] main_ethernetsoc_a7ddrphy_bitslip10_o = 8'd0;
reg [2:0] main_ethernetsoc_a7ddrphy_bitslip10_value = 3'd0;
reg [15:0] main_ethernetsoc_a7ddrphy_bitslip10_r = 16'd0;
wire main_ethernetsoc_a7ddrphy_dq_o_nodelay11;
wire main_ethernetsoc_a7ddrphy_dq_i_nodelay11;
wire main_ethernetsoc_a7ddrphy_dq_i_delayed11;
wire main_ethernetsoc_a7ddrphy_dq_t11;
wire [7:0] main_ethernetsoc_a7ddrphy_dq_i_data11;
wire [7:0] main_ethernetsoc_a7ddrphy_bitslip11_i;
reg [7:0] main_ethernetsoc_a7ddrphy_bitslip11_o = 8'd0;
reg [2:0] main_ethernetsoc_a7ddrphy_bitslip11_value = 3'd0;
reg [15:0] main_ethernetsoc_a7ddrphy_bitslip11_r = 16'd0;
wire main_ethernetsoc_a7ddrphy_dq_o_nodelay12;
wire main_ethernetsoc_a7ddrphy_dq_i_nodelay12;
wire main_ethernetsoc_a7ddrphy_dq_i_delayed12;
wire main_ethernetsoc_a7ddrphy_dq_t12;
wire [7:0] main_ethernetsoc_a7ddrphy_dq_i_data12;
wire [7:0] main_ethernetsoc_a7ddrphy_bitslip12_i;
reg [7:0] main_ethernetsoc_a7ddrphy_bitslip12_o = 8'd0;
reg [2:0] main_ethernetsoc_a7ddrphy_bitslip12_value = 3'd0;
reg [15:0] main_ethernetsoc_a7ddrphy_bitslip12_r = 16'd0;
wire main_ethernetsoc_a7ddrphy_dq_o_nodelay13;
wire main_ethernetsoc_a7ddrphy_dq_i_nodelay13;
wire main_ethernetsoc_a7ddrphy_dq_i_delayed13;
wire main_ethernetsoc_a7ddrphy_dq_t13;
wire [7:0] main_ethernetsoc_a7ddrphy_dq_i_data13;
wire [7:0] main_ethernetsoc_a7ddrphy_bitslip13_i;
reg [7:0] main_ethernetsoc_a7ddrphy_bitslip13_o = 8'd0;
reg [2:0] main_ethernetsoc_a7ddrphy_bitslip13_value = 3'd0;
reg [15:0] main_ethernetsoc_a7ddrphy_bitslip13_r = 16'd0;
wire main_ethernetsoc_a7ddrphy_dq_o_nodelay14;
wire main_ethernetsoc_a7ddrphy_dq_i_nodelay14;
wire main_ethernetsoc_a7ddrphy_dq_i_delayed14;
wire main_ethernetsoc_a7ddrphy_dq_t14;
wire [7:0] main_ethernetsoc_a7ddrphy_dq_i_data14;
wire [7:0] main_ethernetsoc_a7ddrphy_bitslip14_i;
reg [7:0] main_ethernetsoc_a7ddrphy_bitslip14_o = 8'd0;
reg [2:0] main_ethernetsoc_a7ddrphy_bitslip14_value = 3'd0;
reg [15:0] main_ethernetsoc_a7ddrphy_bitslip14_r = 16'd0;
wire main_ethernetsoc_a7ddrphy_dq_o_nodelay15;
wire main_ethernetsoc_a7ddrphy_dq_i_nodelay15;
wire main_ethernetsoc_a7ddrphy_dq_i_delayed15;
wire main_ethernetsoc_a7ddrphy_dq_t15;
wire [7:0] main_ethernetsoc_a7ddrphy_dq_i_data15;
wire [7:0] main_ethernetsoc_a7ddrphy_bitslip15_i;
reg [7:0] main_ethernetsoc_a7ddrphy_bitslip15_o = 8'd0;
reg [2:0] main_ethernetsoc_a7ddrphy_bitslip15_value = 3'd0;
reg [15:0] main_ethernetsoc_a7ddrphy_bitslip15_r = 16'd0;
reg main_ethernetsoc_a7ddrphy_n_rddata_en0 = 1'd0;
reg main_ethernetsoc_a7ddrphy_n_rddata_en1 = 1'd0;
reg main_ethernetsoc_a7ddrphy_n_rddata_en2 = 1'd0;
reg main_ethernetsoc_a7ddrphy_n_rddata_en3 = 1'd0;
reg main_ethernetsoc_a7ddrphy_n_rddata_en4 = 1'd0;
reg main_ethernetsoc_a7ddrphy_n_rddata_en5 = 1'd0;
reg main_ethernetsoc_a7ddrphy_n_rddata_en6 = 1'd0;
reg main_ethernetsoc_a7ddrphy_n_rddata_en7 = 1'd0;
wire main_ethernetsoc_a7ddrphy_oe;
reg [3:0] main_ethernetsoc_a7ddrphy_last_wrdata_en = 4'd0;
wire [13:0] main_ethernetsoc_sdram_inti_p0_address;
wire [2:0] main_ethernetsoc_sdram_inti_p0_bank;
reg main_ethernetsoc_sdram_inti_p0_cas_n = 1'd1;
reg main_ethernetsoc_sdram_inti_p0_cs_n = 1'd1;
reg main_ethernetsoc_sdram_inti_p0_ras_n = 1'd1;
reg main_ethernetsoc_sdram_inti_p0_we_n = 1'd1;
wire main_ethernetsoc_sdram_inti_p0_cke;
wire main_ethernetsoc_sdram_inti_p0_odt;
wire main_ethernetsoc_sdram_inti_p0_reset_n;
reg main_ethernetsoc_sdram_inti_p0_act_n = 1'd1;
wire [31:0] main_ethernetsoc_sdram_inti_p0_wrdata;
wire main_ethernetsoc_sdram_inti_p0_wrdata_en;
wire [3:0] main_ethernetsoc_sdram_inti_p0_wrdata_mask;
wire main_ethernetsoc_sdram_inti_p0_rddata_en;
reg [31:0] main_ethernetsoc_sdram_inti_p0_rddata = 32'd0;
reg main_ethernetsoc_sdram_inti_p0_rddata_valid = 1'd0;
wire [13:0] main_ethernetsoc_sdram_inti_p1_address;
wire [2:0] main_ethernetsoc_sdram_inti_p1_bank;
reg main_ethernetsoc_sdram_inti_p1_cas_n = 1'd1;
reg main_ethernetsoc_sdram_inti_p1_cs_n = 1'd1;
reg main_ethernetsoc_sdram_inti_p1_ras_n = 1'd1;
reg main_ethernetsoc_sdram_inti_p1_we_n = 1'd1;
wire main_ethernetsoc_sdram_inti_p1_cke;
wire main_ethernetsoc_sdram_inti_p1_odt;
wire main_ethernetsoc_sdram_inti_p1_reset_n;
reg main_ethernetsoc_sdram_inti_p1_act_n = 1'd1;
wire [31:0] main_ethernetsoc_sdram_inti_p1_wrdata;
wire main_ethernetsoc_sdram_inti_p1_wrdata_en;
wire [3:0] main_ethernetsoc_sdram_inti_p1_wrdata_mask;
wire main_ethernetsoc_sdram_inti_p1_rddata_en;
reg [31:0] main_ethernetsoc_sdram_inti_p1_rddata = 32'd0;
reg main_ethernetsoc_sdram_inti_p1_rddata_valid = 1'd0;
wire [13:0] main_ethernetsoc_sdram_inti_p2_address;
wire [2:0] main_ethernetsoc_sdram_inti_p2_bank;
reg main_ethernetsoc_sdram_inti_p2_cas_n = 1'd1;
reg main_ethernetsoc_sdram_inti_p2_cs_n = 1'd1;
reg main_ethernetsoc_sdram_inti_p2_ras_n = 1'd1;
reg main_ethernetsoc_sdram_inti_p2_we_n = 1'd1;
wire main_ethernetsoc_sdram_inti_p2_cke;
wire main_ethernetsoc_sdram_inti_p2_odt;
wire main_ethernetsoc_sdram_inti_p2_reset_n;
reg main_ethernetsoc_sdram_inti_p2_act_n = 1'd1;
wire [31:0] main_ethernetsoc_sdram_inti_p2_wrdata;
wire main_ethernetsoc_sdram_inti_p2_wrdata_en;
wire [3:0] main_ethernetsoc_sdram_inti_p2_wrdata_mask;
wire main_ethernetsoc_sdram_inti_p2_rddata_en;
reg [31:0] main_ethernetsoc_sdram_inti_p2_rddata = 32'd0;
reg main_ethernetsoc_sdram_inti_p2_rddata_valid = 1'd0;
wire [13:0] main_ethernetsoc_sdram_inti_p3_address;
wire [2:0] main_ethernetsoc_sdram_inti_p3_bank;
reg main_ethernetsoc_sdram_inti_p3_cas_n = 1'd1;
reg main_ethernetsoc_sdram_inti_p3_cs_n = 1'd1;
reg main_ethernetsoc_sdram_inti_p3_ras_n = 1'd1;
reg main_ethernetsoc_sdram_inti_p3_we_n = 1'd1;
wire main_ethernetsoc_sdram_inti_p3_cke;
wire main_ethernetsoc_sdram_inti_p3_odt;
wire main_ethernetsoc_sdram_inti_p3_reset_n;
reg main_ethernetsoc_sdram_inti_p3_act_n = 1'd1;
wire [31:0] main_ethernetsoc_sdram_inti_p3_wrdata;
wire main_ethernetsoc_sdram_inti_p3_wrdata_en;
wire [3:0] main_ethernetsoc_sdram_inti_p3_wrdata_mask;
wire main_ethernetsoc_sdram_inti_p3_rddata_en;
reg [31:0] main_ethernetsoc_sdram_inti_p3_rddata = 32'd0;
reg main_ethernetsoc_sdram_inti_p3_rddata_valid = 1'd0;
wire [13:0] main_ethernetsoc_sdram_slave_p0_address;
wire [2:0] main_ethernetsoc_sdram_slave_p0_bank;
wire main_ethernetsoc_sdram_slave_p0_cas_n;
wire main_ethernetsoc_sdram_slave_p0_cs_n;
wire main_ethernetsoc_sdram_slave_p0_ras_n;
wire main_ethernetsoc_sdram_slave_p0_we_n;
wire main_ethernetsoc_sdram_slave_p0_cke;
wire main_ethernetsoc_sdram_slave_p0_odt;
wire main_ethernetsoc_sdram_slave_p0_reset_n;
wire main_ethernetsoc_sdram_slave_p0_act_n;
wire [31:0] main_ethernetsoc_sdram_slave_p0_wrdata;
wire main_ethernetsoc_sdram_slave_p0_wrdata_en;
wire [3:0] main_ethernetsoc_sdram_slave_p0_wrdata_mask;
wire main_ethernetsoc_sdram_slave_p0_rddata_en;
reg [31:0] main_ethernetsoc_sdram_slave_p0_rddata = 32'd0;
reg main_ethernetsoc_sdram_slave_p0_rddata_valid = 1'd0;
wire [13:0] main_ethernetsoc_sdram_slave_p1_address;
wire [2:0] main_ethernetsoc_sdram_slave_p1_bank;
wire main_ethernetsoc_sdram_slave_p1_cas_n;
wire main_ethernetsoc_sdram_slave_p1_cs_n;
wire main_ethernetsoc_sdram_slave_p1_ras_n;
wire main_ethernetsoc_sdram_slave_p1_we_n;
wire main_ethernetsoc_sdram_slave_p1_cke;
wire main_ethernetsoc_sdram_slave_p1_odt;
wire main_ethernetsoc_sdram_slave_p1_reset_n;
wire main_ethernetsoc_sdram_slave_p1_act_n;
wire [31:0] main_ethernetsoc_sdram_slave_p1_wrdata;
wire main_ethernetsoc_sdram_slave_p1_wrdata_en;
wire [3:0] main_ethernetsoc_sdram_slave_p1_wrdata_mask;
wire main_ethernetsoc_sdram_slave_p1_rddata_en;
reg [31:0] main_ethernetsoc_sdram_slave_p1_rddata = 32'd0;
reg main_ethernetsoc_sdram_slave_p1_rddata_valid = 1'd0;
wire [13:0] main_ethernetsoc_sdram_slave_p2_address;
wire [2:0] main_ethernetsoc_sdram_slave_p2_bank;
wire main_ethernetsoc_sdram_slave_p2_cas_n;
wire main_ethernetsoc_sdram_slave_p2_cs_n;
wire main_ethernetsoc_sdram_slave_p2_ras_n;
wire main_ethernetsoc_sdram_slave_p2_we_n;
wire main_ethernetsoc_sdram_slave_p2_cke;
wire main_ethernetsoc_sdram_slave_p2_odt;
wire main_ethernetsoc_sdram_slave_p2_reset_n;
wire main_ethernetsoc_sdram_slave_p2_act_n;
wire [31:0] main_ethernetsoc_sdram_slave_p2_wrdata;
wire main_ethernetsoc_sdram_slave_p2_wrdata_en;
wire [3:0] main_ethernetsoc_sdram_slave_p2_wrdata_mask;
wire main_ethernetsoc_sdram_slave_p2_rddata_en;
reg [31:0] main_ethernetsoc_sdram_slave_p2_rddata = 32'd0;
reg main_ethernetsoc_sdram_slave_p2_rddata_valid = 1'd0;
wire [13:0] main_ethernetsoc_sdram_slave_p3_address;
wire [2:0] main_ethernetsoc_sdram_slave_p3_bank;
wire main_ethernetsoc_sdram_slave_p3_cas_n;
wire main_ethernetsoc_sdram_slave_p3_cs_n;
wire main_ethernetsoc_sdram_slave_p3_ras_n;
wire main_ethernetsoc_sdram_slave_p3_we_n;
wire main_ethernetsoc_sdram_slave_p3_cke;
wire main_ethernetsoc_sdram_slave_p3_odt;
wire main_ethernetsoc_sdram_slave_p3_reset_n;
wire main_ethernetsoc_sdram_slave_p3_act_n;
wire [31:0] main_ethernetsoc_sdram_slave_p3_wrdata;
wire main_ethernetsoc_sdram_slave_p3_wrdata_en;
wire [3:0] main_ethernetsoc_sdram_slave_p3_wrdata_mask;
wire main_ethernetsoc_sdram_slave_p3_rddata_en;
reg [31:0] main_ethernetsoc_sdram_slave_p3_rddata = 32'd0;
reg main_ethernetsoc_sdram_slave_p3_rddata_valid = 1'd0;
reg [13:0] main_ethernetsoc_sdram_master_p0_address = 14'd0;
reg [2:0] main_ethernetsoc_sdram_master_p0_bank = 3'd0;
reg main_ethernetsoc_sdram_master_p0_cas_n = 1'd1;
reg main_ethernetsoc_sdram_master_p0_cs_n = 1'd1;
reg main_ethernetsoc_sdram_master_p0_ras_n = 1'd1;
reg main_ethernetsoc_sdram_master_p0_we_n = 1'd1;
reg main_ethernetsoc_sdram_master_p0_cke = 1'd0;
reg main_ethernetsoc_sdram_master_p0_odt = 1'd0;
reg main_ethernetsoc_sdram_master_p0_reset_n = 1'd0;
reg main_ethernetsoc_sdram_master_p0_act_n = 1'd1;
reg [31:0] main_ethernetsoc_sdram_master_p0_wrdata = 32'd0;
reg main_ethernetsoc_sdram_master_p0_wrdata_en = 1'd0;
reg [3:0] main_ethernetsoc_sdram_master_p0_wrdata_mask = 4'd0;
reg main_ethernetsoc_sdram_master_p0_rddata_en = 1'd0;
wire [31:0] main_ethernetsoc_sdram_master_p0_rddata;
wire main_ethernetsoc_sdram_master_p0_rddata_valid;
reg [13:0] main_ethernetsoc_sdram_master_p1_address = 14'd0;
reg [2:0] main_ethernetsoc_sdram_master_p1_bank = 3'd0;
reg main_ethernetsoc_sdram_master_p1_cas_n = 1'd1;
reg main_ethernetsoc_sdram_master_p1_cs_n = 1'd1;
reg main_ethernetsoc_sdram_master_p1_ras_n = 1'd1;
reg main_ethernetsoc_sdram_master_p1_we_n = 1'd1;
reg main_ethernetsoc_sdram_master_p1_cke = 1'd0;
reg main_ethernetsoc_sdram_master_p1_odt = 1'd0;
reg main_ethernetsoc_sdram_master_p1_reset_n = 1'd0;
reg main_ethernetsoc_sdram_master_p1_act_n = 1'd1;
reg [31:0] main_ethernetsoc_sdram_master_p1_wrdata = 32'd0;
reg main_ethernetsoc_sdram_master_p1_wrdata_en = 1'd0;
reg [3:0] main_ethernetsoc_sdram_master_p1_wrdata_mask = 4'd0;
reg main_ethernetsoc_sdram_master_p1_rddata_en = 1'd0;
wire [31:0] main_ethernetsoc_sdram_master_p1_rddata;
wire main_ethernetsoc_sdram_master_p1_rddata_valid;
reg [13:0] main_ethernetsoc_sdram_master_p2_address = 14'd0;
reg [2:0] main_ethernetsoc_sdram_master_p2_bank = 3'd0;
reg main_ethernetsoc_sdram_master_p2_cas_n = 1'd1;
reg main_ethernetsoc_sdram_master_p2_cs_n = 1'd1;
reg main_ethernetsoc_sdram_master_p2_ras_n = 1'd1;
reg main_ethernetsoc_sdram_master_p2_we_n = 1'd1;
reg main_ethernetsoc_sdram_master_p2_cke = 1'd0;
reg main_ethernetsoc_sdram_master_p2_odt = 1'd0;
reg main_ethernetsoc_sdram_master_p2_reset_n = 1'd0;
reg main_ethernetsoc_sdram_master_p2_act_n = 1'd1;
reg [31:0] main_ethernetsoc_sdram_master_p2_wrdata = 32'd0;
reg main_ethernetsoc_sdram_master_p2_wrdata_en = 1'd0;
reg [3:0] main_ethernetsoc_sdram_master_p2_wrdata_mask = 4'd0;
reg main_ethernetsoc_sdram_master_p2_rddata_en = 1'd0;
wire [31:0] main_ethernetsoc_sdram_master_p2_rddata;
wire main_ethernetsoc_sdram_master_p2_rddata_valid;
reg [13:0] main_ethernetsoc_sdram_master_p3_address = 14'd0;
reg [2:0] main_ethernetsoc_sdram_master_p3_bank = 3'd0;
reg main_ethernetsoc_sdram_master_p3_cas_n = 1'd1;
reg main_ethernetsoc_sdram_master_p3_cs_n = 1'd1;
reg main_ethernetsoc_sdram_master_p3_ras_n = 1'd1;
reg main_ethernetsoc_sdram_master_p3_we_n = 1'd1;
reg main_ethernetsoc_sdram_master_p3_cke = 1'd0;
reg main_ethernetsoc_sdram_master_p3_odt = 1'd0;
reg main_ethernetsoc_sdram_master_p3_reset_n = 1'd0;
reg main_ethernetsoc_sdram_master_p3_act_n = 1'd1;
reg [31:0] main_ethernetsoc_sdram_master_p3_wrdata = 32'd0;
reg main_ethernetsoc_sdram_master_p3_wrdata_en = 1'd0;
reg [3:0] main_ethernetsoc_sdram_master_p3_wrdata_mask = 4'd0;
reg main_ethernetsoc_sdram_master_p3_rddata_en = 1'd0;
wire [31:0] main_ethernetsoc_sdram_master_p3_rddata;
wire main_ethernetsoc_sdram_master_p3_rddata_valid;
reg [3:0] main_ethernetsoc_sdram_storage_full = 4'd0;
wire [3:0] main_ethernetsoc_sdram_storage;
reg main_ethernetsoc_sdram_re = 1'd0;
reg [5:0] main_ethernetsoc_sdram_phaseinjector0_command_storage_full = 6'd0;
wire [5:0] main_ethernetsoc_sdram_phaseinjector0_command_storage;
reg main_ethernetsoc_sdram_phaseinjector0_command_re = 1'd0;
wire main_ethernetsoc_sdram_phaseinjector0_command_issue_re;
wire main_ethernetsoc_sdram_phaseinjector0_command_issue_r;
reg main_ethernetsoc_sdram_phaseinjector0_command_issue_w = 1'd0;
reg [13:0] main_ethernetsoc_sdram_phaseinjector0_address_storage_full = 14'd0;
wire [13:0] main_ethernetsoc_sdram_phaseinjector0_address_storage;
reg main_ethernetsoc_sdram_phaseinjector0_address_re = 1'd0;
reg [2:0] main_ethernetsoc_sdram_phaseinjector0_baddress_storage_full = 3'd0;
wire [2:0] main_ethernetsoc_sdram_phaseinjector0_baddress_storage;
reg main_ethernetsoc_sdram_phaseinjector0_baddress_re = 1'd0;
reg [31:0] main_ethernetsoc_sdram_phaseinjector0_wrdata_storage_full = 32'd0;
wire [31:0] main_ethernetsoc_sdram_phaseinjector0_wrdata_storage;
reg main_ethernetsoc_sdram_phaseinjector0_wrdata_re = 1'd0;
reg [31:0] main_ethernetsoc_sdram_phaseinjector0_status = 32'd0;
reg [5:0] main_ethernetsoc_sdram_phaseinjector1_command_storage_full = 6'd0;
wire [5:0] main_ethernetsoc_sdram_phaseinjector1_command_storage;
reg main_ethernetsoc_sdram_phaseinjector1_command_re = 1'd0;
wire main_ethernetsoc_sdram_phaseinjector1_command_issue_re;
wire main_ethernetsoc_sdram_phaseinjector1_command_issue_r;
reg main_ethernetsoc_sdram_phaseinjector1_command_issue_w = 1'd0;
reg [13:0] main_ethernetsoc_sdram_phaseinjector1_address_storage_full = 14'd0;
wire [13:0] main_ethernetsoc_sdram_phaseinjector1_address_storage;
reg main_ethernetsoc_sdram_phaseinjector1_address_re = 1'd0;
reg [2:0] main_ethernetsoc_sdram_phaseinjector1_baddress_storage_full = 3'd0;
wire [2:0] main_ethernetsoc_sdram_phaseinjector1_baddress_storage;
reg main_ethernetsoc_sdram_phaseinjector1_baddress_re = 1'd0;
reg [31:0] main_ethernetsoc_sdram_phaseinjector1_wrdata_storage_full = 32'd0;
wire [31:0] main_ethernetsoc_sdram_phaseinjector1_wrdata_storage;
reg main_ethernetsoc_sdram_phaseinjector1_wrdata_re = 1'd0;
reg [31:0] main_ethernetsoc_sdram_phaseinjector1_status = 32'd0;
reg [5:0] main_ethernetsoc_sdram_phaseinjector2_command_storage_full = 6'd0;
wire [5:0] main_ethernetsoc_sdram_phaseinjector2_command_storage;
reg main_ethernetsoc_sdram_phaseinjector2_command_re = 1'd0;
wire main_ethernetsoc_sdram_phaseinjector2_command_issue_re;
wire main_ethernetsoc_sdram_phaseinjector2_command_issue_r;
reg main_ethernetsoc_sdram_phaseinjector2_command_issue_w = 1'd0;
reg [13:0] main_ethernetsoc_sdram_phaseinjector2_address_storage_full = 14'd0;
wire [13:0] main_ethernetsoc_sdram_phaseinjector2_address_storage;
reg main_ethernetsoc_sdram_phaseinjector2_address_re = 1'd0;
reg [2:0] main_ethernetsoc_sdram_phaseinjector2_baddress_storage_full = 3'd0;
wire [2:0] main_ethernetsoc_sdram_phaseinjector2_baddress_storage;
reg main_ethernetsoc_sdram_phaseinjector2_baddress_re = 1'd0;
reg [31:0] main_ethernetsoc_sdram_phaseinjector2_wrdata_storage_full = 32'd0;
wire [31:0] main_ethernetsoc_sdram_phaseinjector2_wrdata_storage;
reg main_ethernetsoc_sdram_phaseinjector2_wrdata_re = 1'd0;
reg [31:0] main_ethernetsoc_sdram_phaseinjector2_status = 32'd0;
reg [5:0] main_ethernetsoc_sdram_phaseinjector3_command_storage_full = 6'd0;
wire [5:0] main_ethernetsoc_sdram_phaseinjector3_command_storage;
reg main_ethernetsoc_sdram_phaseinjector3_command_re = 1'd0;
wire main_ethernetsoc_sdram_phaseinjector3_command_issue_re;
wire main_ethernetsoc_sdram_phaseinjector3_command_issue_r;
reg main_ethernetsoc_sdram_phaseinjector3_command_issue_w = 1'd0;
reg [13:0] main_ethernetsoc_sdram_phaseinjector3_address_storage_full = 14'd0;
wire [13:0] main_ethernetsoc_sdram_phaseinjector3_address_storage;
reg main_ethernetsoc_sdram_phaseinjector3_address_re = 1'd0;
reg [2:0] main_ethernetsoc_sdram_phaseinjector3_baddress_storage_full = 3'd0;
wire [2:0] main_ethernetsoc_sdram_phaseinjector3_baddress_storage;
reg main_ethernetsoc_sdram_phaseinjector3_baddress_re = 1'd0;
reg [31:0] main_ethernetsoc_sdram_phaseinjector3_wrdata_storage_full = 32'd0;
wire [31:0] main_ethernetsoc_sdram_phaseinjector3_wrdata_storage;
reg main_ethernetsoc_sdram_phaseinjector3_wrdata_re = 1'd0;
reg [31:0] main_ethernetsoc_sdram_phaseinjector3_status = 32'd0;
reg [13:0] main_ethernetsoc_sdram_dfi_p0_address = 14'd0;
reg [2:0] main_ethernetsoc_sdram_dfi_p0_bank = 3'd0;
reg main_ethernetsoc_sdram_dfi_p0_cas_n = 1'd1;
reg main_ethernetsoc_sdram_dfi_p0_cs_n = 1'd1;
reg main_ethernetsoc_sdram_dfi_p0_ras_n = 1'd1;
reg main_ethernetsoc_sdram_dfi_p0_we_n = 1'd1;
wire main_ethernetsoc_sdram_dfi_p0_cke;
wire main_ethernetsoc_sdram_dfi_p0_odt;
wire main_ethernetsoc_sdram_dfi_p0_reset_n;
reg main_ethernetsoc_sdram_dfi_p0_act_n = 1'd1;
wire [31:0] main_ethernetsoc_sdram_dfi_p0_wrdata;
reg main_ethernetsoc_sdram_dfi_p0_wrdata_en = 1'd0;
wire [3:0] main_ethernetsoc_sdram_dfi_p0_wrdata_mask;
reg main_ethernetsoc_sdram_dfi_p0_rddata_en = 1'd0;
wire [31:0] main_ethernetsoc_sdram_dfi_p0_rddata;
wire main_ethernetsoc_sdram_dfi_p0_rddata_valid;
reg [13:0] main_ethernetsoc_sdram_dfi_p1_address = 14'd0;
reg [2:0] main_ethernetsoc_sdram_dfi_p1_bank = 3'd0;
reg main_ethernetsoc_sdram_dfi_p1_cas_n = 1'd1;
reg main_ethernetsoc_sdram_dfi_p1_cs_n = 1'd1;
reg main_ethernetsoc_sdram_dfi_p1_ras_n = 1'd1;
reg main_ethernetsoc_sdram_dfi_p1_we_n = 1'd1;
wire main_ethernetsoc_sdram_dfi_p1_cke;
wire main_ethernetsoc_sdram_dfi_p1_odt;
wire main_ethernetsoc_sdram_dfi_p1_reset_n;
reg main_ethernetsoc_sdram_dfi_p1_act_n = 1'd1;
wire [31:0] main_ethernetsoc_sdram_dfi_p1_wrdata;
reg main_ethernetsoc_sdram_dfi_p1_wrdata_en = 1'd0;
wire [3:0] main_ethernetsoc_sdram_dfi_p1_wrdata_mask;
reg main_ethernetsoc_sdram_dfi_p1_rddata_en = 1'd0;
wire [31:0] main_ethernetsoc_sdram_dfi_p1_rddata;
wire main_ethernetsoc_sdram_dfi_p1_rddata_valid;
reg [13:0] main_ethernetsoc_sdram_dfi_p2_address = 14'd0;
reg [2:0] main_ethernetsoc_sdram_dfi_p2_bank = 3'd0;
reg main_ethernetsoc_sdram_dfi_p2_cas_n = 1'd1;
reg main_ethernetsoc_sdram_dfi_p2_cs_n = 1'd1;
reg main_ethernetsoc_sdram_dfi_p2_ras_n = 1'd1;
reg main_ethernetsoc_sdram_dfi_p2_we_n = 1'd1;
wire main_ethernetsoc_sdram_dfi_p2_cke;
wire main_ethernetsoc_sdram_dfi_p2_odt;
wire main_ethernetsoc_sdram_dfi_p2_reset_n;
reg main_ethernetsoc_sdram_dfi_p2_act_n = 1'd1;
wire [31:0] main_ethernetsoc_sdram_dfi_p2_wrdata;
reg main_ethernetsoc_sdram_dfi_p2_wrdata_en = 1'd0;
wire [3:0] main_ethernetsoc_sdram_dfi_p2_wrdata_mask;
reg main_ethernetsoc_sdram_dfi_p2_rddata_en = 1'd0;
wire [31:0] main_ethernetsoc_sdram_dfi_p2_rddata;
wire main_ethernetsoc_sdram_dfi_p2_rddata_valid;
reg [13:0] main_ethernetsoc_sdram_dfi_p3_address = 14'd0;
reg [2:0] main_ethernetsoc_sdram_dfi_p3_bank = 3'd0;
reg main_ethernetsoc_sdram_dfi_p3_cas_n = 1'd1;
reg main_ethernetsoc_sdram_dfi_p3_cs_n = 1'd1;
reg main_ethernetsoc_sdram_dfi_p3_ras_n = 1'd1;
reg main_ethernetsoc_sdram_dfi_p3_we_n = 1'd1;
wire main_ethernetsoc_sdram_dfi_p3_cke;
wire main_ethernetsoc_sdram_dfi_p3_odt;
wire main_ethernetsoc_sdram_dfi_p3_reset_n;
reg main_ethernetsoc_sdram_dfi_p3_act_n = 1'd1;
wire [31:0] main_ethernetsoc_sdram_dfi_p3_wrdata;
reg main_ethernetsoc_sdram_dfi_p3_wrdata_en = 1'd0;
wire [3:0] main_ethernetsoc_sdram_dfi_p3_wrdata_mask;
reg main_ethernetsoc_sdram_dfi_p3_rddata_en = 1'd0;
wire [31:0] main_ethernetsoc_sdram_dfi_p3_rddata;
wire main_ethernetsoc_sdram_dfi_p3_rddata_valid;
wire main_ethernetsoc_sdram_interface_bank0_valid;
wire main_ethernetsoc_sdram_interface_bank0_ready;
wire main_ethernetsoc_sdram_interface_bank0_we;
wire [20:0] main_ethernetsoc_sdram_interface_bank0_addr;
wire main_ethernetsoc_sdram_interface_bank0_lock;
wire main_ethernetsoc_sdram_interface_bank0_wdata_ready;
wire main_ethernetsoc_sdram_interface_bank0_rdata_valid;
wire main_ethernetsoc_sdram_interface_bank1_valid;
wire main_ethernetsoc_sdram_interface_bank1_ready;
wire main_ethernetsoc_sdram_interface_bank1_we;
wire [20:0] main_ethernetsoc_sdram_interface_bank1_addr;
wire main_ethernetsoc_sdram_interface_bank1_lock;
wire main_ethernetsoc_sdram_interface_bank1_wdata_ready;
wire main_ethernetsoc_sdram_interface_bank1_rdata_valid;
wire main_ethernetsoc_sdram_interface_bank2_valid;
wire main_ethernetsoc_sdram_interface_bank2_ready;
wire main_ethernetsoc_sdram_interface_bank2_we;
wire [20:0] main_ethernetsoc_sdram_interface_bank2_addr;
wire main_ethernetsoc_sdram_interface_bank2_lock;
wire main_ethernetsoc_sdram_interface_bank2_wdata_ready;
wire main_ethernetsoc_sdram_interface_bank2_rdata_valid;
wire main_ethernetsoc_sdram_interface_bank3_valid;
wire main_ethernetsoc_sdram_interface_bank3_ready;
wire main_ethernetsoc_sdram_interface_bank3_we;
wire [20:0] main_ethernetsoc_sdram_interface_bank3_addr;
wire main_ethernetsoc_sdram_interface_bank3_lock;
wire main_ethernetsoc_sdram_interface_bank3_wdata_ready;
wire main_ethernetsoc_sdram_interface_bank3_rdata_valid;
wire main_ethernetsoc_sdram_interface_bank4_valid;
wire main_ethernetsoc_sdram_interface_bank4_ready;
wire main_ethernetsoc_sdram_interface_bank4_we;
wire [20:0] main_ethernetsoc_sdram_interface_bank4_addr;
wire main_ethernetsoc_sdram_interface_bank4_lock;
wire main_ethernetsoc_sdram_interface_bank4_wdata_ready;
wire main_ethernetsoc_sdram_interface_bank4_rdata_valid;
wire main_ethernetsoc_sdram_interface_bank5_valid;
wire main_ethernetsoc_sdram_interface_bank5_ready;
wire main_ethernetsoc_sdram_interface_bank5_we;
wire [20:0] main_ethernetsoc_sdram_interface_bank5_addr;
wire main_ethernetsoc_sdram_interface_bank5_lock;
wire main_ethernetsoc_sdram_interface_bank5_wdata_ready;
wire main_ethernetsoc_sdram_interface_bank5_rdata_valid;
wire main_ethernetsoc_sdram_interface_bank6_valid;
wire main_ethernetsoc_sdram_interface_bank6_ready;
wire main_ethernetsoc_sdram_interface_bank6_we;
wire [20:0] main_ethernetsoc_sdram_interface_bank6_addr;
wire main_ethernetsoc_sdram_interface_bank6_lock;
wire main_ethernetsoc_sdram_interface_bank6_wdata_ready;
wire main_ethernetsoc_sdram_interface_bank6_rdata_valid;
wire main_ethernetsoc_sdram_interface_bank7_valid;
wire main_ethernetsoc_sdram_interface_bank7_ready;
wire main_ethernetsoc_sdram_interface_bank7_we;
wire [20:0] main_ethernetsoc_sdram_interface_bank7_addr;
wire main_ethernetsoc_sdram_interface_bank7_lock;
wire main_ethernetsoc_sdram_interface_bank7_wdata_ready;
wire main_ethernetsoc_sdram_interface_bank7_rdata_valid;
reg [127:0] main_ethernetsoc_sdram_interface_wdata = 128'd0;
reg [15:0] main_ethernetsoc_sdram_interface_wdata_we = 16'd0;
wire [127:0] main_ethernetsoc_sdram_interface_rdata;
reg main_ethernetsoc_sdram_cmd_valid = 1'd0;
reg main_ethernetsoc_sdram_cmd_ready = 1'd0;
reg main_ethernetsoc_sdram_cmd_last = 1'd0;
reg [13:0] main_ethernetsoc_sdram_cmd_payload_a = 14'd0;
reg [2:0] main_ethernetsoc_sdram_cmd_payload_ba = 3'd0;
reg main_ethernetsoc_sdram_cmd_payload_cas = 1'd0;
reg main_ethernetsoc_sdram_cmd_payload_ras = 1'd0;
reg main_ethernetsoc_sdram_cmd_payload_we = 1'd0;
reg main_ethernetsoc_sdram_cmd_payload_is_read = 1'd0;
reg main_ethernetsoc_sdram_cmd_payload_is_write = 1'd0;
wire main_ethernetsoc_sdram_timer_wait;
wire main_ethernetsoc_sdram_timer_done;
reg [9:0] main_ethernetsoc_sdram_timer_count = 10'd782;
reg main_ethernetsoc_sdram_timer_load = 1'd0;
reg [9:0] main_ethernetsoc_sdram_timer_load_count = 10'd0;
wire main_ethernetsoc_sdram_timer_reset;
reg main_ethernetsoc_sdram_generator_start = 1'd0;
reg main_ethernetsoc_sdram_generator_done = 1'd0;
reg [5:0] main_ethernetsoc_sdram_generator_counter = 6'd0;
wire main_ethernetsoc_sdram_bankmachine0_req_valid;
wire main_ethernetsoc_sdram_bankmachine0_req_ready;
wire main_ethernetsoc_sdram_bankmachine0_req_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine0_req_addr;
wire main_ethernetsoc_sdram_bankmachine0_req_lock;
reg main_ethernetsoc_sdram_bankmachine0_req_wdata_ready = 1'd0;
reg main_ethernetsoc_sdram_bankmachine0_req_rdata_valid = 1'd0;
wire main_ethernetsoc_sdram_bankmachine0_refresh_req;
reg main_ethernetsoc_sdram_bankmachine0_refresh_gnt = 1'd0;
reg main_ethernetsoc_sdram_bankmachine0_cmd_valid = 1'd0;
reg main_ethernetsoc_sdram_bankmachine0_cmd_ready = 1'd0;
reg [13:0] main_ethernetsoc_sdram_bankmachine0_cmd_payload_a = 14'd0;
wire [2:0] main_ethernetsoc_sdram_bankmachine0_cmd_payload_ba;
reg main_ethernetsoc_sdram_bankmachine0_cmd_payload_cas = 1'd0;
reg main_ethernetsoc_sdram_bankmachine0_cmd_payload_ras = 1'd0;
reg main_ethernetsoc_sdram_bankmachine0_cmd_payload_we = 1'd0;
reg main_ethernetsoc_sdram_bankmachine0_cmd_payload_is_cmd = 1'd0;
reg main_ethernetsoc_sdram_bankmachine0_cmd_payload_is_read = 1'd0;
reg main_ethernetsoc_sdram_bankmachine0_cmd_payload_is_write = 1'd0;
reg main_ethernetsoc_sdram_bankmachine0_auto_precharge = 1'd0;
wire main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_sink_valid;
wire main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_sink_ready;
reg main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_sink_first = 1'd0;
reg main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_sink_last = 1'd0;
wire main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_sink_payload_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_sink_payload_addr;
wire main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_valid;
wire main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_ready;
wire main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_first;
wire main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_last;
wire main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_payload_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_payload_addr;
wire main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_we;
wire main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_writable;
wire main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_re;
wire main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_readable;
wire [23:0] main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_din;
wire [23:0] main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_dout;
reg [3:0] main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_level = 4'd0;
reg main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_replace = 1'd0;
reg [2:0] main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_produce = 3'd0;
reg [2:0] main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_consume = 3'd0;
reg [2:0] main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_wrport_adr = 3'd0;
wire [23:0] main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_wrport_dat_r;
wire main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_wrport_we;
wire [23:0] main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_wrport_dat_w;
wire main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_do_read;
wire [2:0] main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_rdport_adr;
wire [23:0] main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_rdport_dat_r;
wire main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_in_payload_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_in_payload_addr;
wire main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_in_first;
wire main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_in_last;
wire main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_out_payload_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_out_payload_addr;
wire main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_out_first;
wire main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_out_last;
wire main_ethernetsoc_sdram_bankmachine0_cmd_buffer_sink_valid;
wire main_ethernetsoc_sdram_bankmachine0_cmd_buffer_sink_ready;
wire main_ethernetsoc_sdram_bankmachine0_cmd_buffer_sink_first;
wire main_ethernetsoc_sdram_bankmachine0_cmd_buffer_sink_last;
wire main_ethernetsoc_sdram_bankmachine0_cmd_buffer_sink_payload_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine0_cmd_buffer_sink_payload_addr;
wire main_ethernetsoc_sdram_bankmachine0_cmd_buffer_source_valid;
wire main_ethernetsoc_sdram_bankmachine0_cmd_buffer_source_ready;
wire main_ethernetsoc_sdram_bankmachine0_cmd_buffer_source_first;
wire main_ethernetsoc_sdram_bankmachine0_cmd_buffer_source_last;
reg main_ethernetsoc_sdram_bankmachine0_cmd_buffer_source_payload_we = 1'd0;
reg [20:0] main_ethernetsoc_sdram_bankmachine0_cmd_buffer_source_payload_addr = 21'd0;
wire main_ethernetsoc_sdram_bankmachine0_cmd_buffer_pipe_ce;
wire main_ethernetsoc_sdram_bankmachine0_cmd_buffer_busy;
reg main_ethernetsoc_sdram_bankmachine0_cmd_buffer_valid_n = 1'd0;
reg main_ethernetsoc_sdram_bankmachine0_cmd_buffer_first_n = 1'd0;
reg main_ethernetsoc_sdram_bankmachine0_cmd_buffer_last_n = 1'd0;
reg [13:0] main_ethernetsoc_sdram_bankmachine0_row = 14'd0;
reg main_ethernetsoc_sdram_bankmachine0_row_opened = 1'd0;
wire main_ethernetsoc_sdram_bankmachine0_row_hit;
reg main_ethernetsoc_sdram_bankmachine0_row_open = 1'd0;
reg main_ethernetsoc_sdram_bankmachine0_row_close = 1'd0;
reg main_ethernetsoc_sdram_bankmachine0_row_col_n_addr_sel = 1'd0;
wire main_ethernetsoc_sdram_bankmachine0_twtpcon_valid;
(* dont_touch = "true" *) reg main_ethernetsoc_sdram_bankmachine0_twtpcon_ready = 1'd1;
reg [2:0] main_ethernetsoc_sdram_bankmachine0_twtpcon_count = 3'd0;
wire main_ethernetsoc_sdram_bankmachine0_trccon_valid;
(* dont_touch = "true" *) reg main_ethernetsoc_sdram_bankmachine0_trccon_ready = 1'd1;
reg [2:0] main_ethernetsoc_sdram_bankmachine0_trccon_count = 3'd0;
wire main_ethernetsoc_sdram_bankmachine0_trascon_valid;
(* dont_touch = "true" *) reg main_ethernetsoc_sdram_bankmachine0_trascon_ready = 1'd1;
reg [2:0] main_ethernetsoc_sdram_bankmachine0_trascon_count = 3'd0;
wire main_ethernetsoc_sdram_bankmachine1_req_valid;
wire main_ethernetsoc_sdram_bankmachine1_req_ready;
wire main_ethernetsoc_sdram_bankmachine1_req_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine1_req_addr;
wire main_ethernetsoc_sdram_bankmachine1_req_lock;
reg main_ethernetsoc_sdram_bankmachine1_req_wdata_ready = 1'd0;
reg main_ethernetsoc_sdram_bankmachine1_req_rdata_valid = 1'd0;
wire main_ethernetsoc_sdram_bankmachine1_refresh_req;
reg main_ethernetsoc_sdram_bankmachine1_refresh_gnt = 1'd0;
reg main_ethernetsoc_sdram_bankmachine1_cmd_valid = 1'd0;
reg main_ethernetsoc_sdram_bankmachine1_cmd_ready = 1'd0;
reg [13:0] main_ethernetsoc_sdram_bankmachine1_cmd_payload_a = 14'd0;
wire [2:0] main_ethernetsoc_sdram_bankmachine1_cmd_payload_ba;
reg main_ethernetsoc_sdram_bankmachine1_cmd_payload_cas = 1'd0;
reg main_ethernetsoc_sdram_bankmachine1_cmd_payload_ras = 1'd0;
reg main_ethernetsoc_sdram_bankmachine1_cmd_payload_we = 1'd0;
reg main_ethernetsoc_sdram_bankmachine1_cmd_payload_is_cmd = 1'd0;
reg main_ethernetsoc_sdram_bankmachine1_cmd_payload_is_read = 1'd0;
reg main_ethernetsoc_sdram_bankmachine1_cmd_payload_is_write = 1'd0;
reg main_ethernetsoc_sdram_bankmachine1_auto_precharge = 1'd0;
wire main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_sink_valid;
wire main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_sink_ready;
reg main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_sink_first = 1'd0;
reg main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_sink_last = 1'd0;
wire main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_sink_payload_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_sink_payload_addr;
wire main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_valid;
wire main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_ready;
wire main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_first;
wire main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_last;
wire main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_payload_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_payload_addr;
wire main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_we;
wire main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_writable;
wire main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_re;
wire main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_readable;
wire [23:0] main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_din;
wire [23:0] main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_dout;
reg [3:0] main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_level = 4'd0;
reg main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_replace = 1'd0;
reg [2:0] main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_produce = 3'd0;
reg [2:0] main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_consume = 3'd0;
reg [2:0] main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_wrport_adr = 3'd0;
wire [23:0] main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_wrport_dat_r;
wire main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_wrport_we;
wire [23:0] main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_wrport_dat_w;
wire main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_do_read;
wire [2:0] main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_rdport_adr;
wire [23:0] main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_rdport_dat_r;
wire main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_in_payload_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_in_payload_addr;
wire main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_in_first;
wire main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_in_last;
wire main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_out_payload_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_out_payload_addr;
wire main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_out_first;
wire main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_out_last;
wire main_ethernetsoc_sdram_bankmachine1_cmd_buffer_sink_valid;
wire main_ethernetsoc_sdram_bankmachine1_cmd_buffer_sink_ready;
wire main_ethernetsoc_sdram_bankmachine1_cmd_buffer_sink_first;
wire main_ethernetsoc_sdram_bankmachine1_cmd_buffer_sink_last;
wire main_ethernetsoc_sdram_bankmachine1_cmd_buffer_sink_payload_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine1_cmd_buffer_sink_payload_addr;
wire main_ethernetsoc_sdram_bankmachine1_cmd_buffer_source_valid;
wire main_ethernetsoc_sdram_bankmachine1_cmd_buffer_source_ready;
wire main_ethernetsoc_sdram_bankmachine1_cmd_buffer_source_first;
wire main_ethernetsoc_sdram_bankmachine1_cmd_buffer_source_last;
reg main_ethernetsoc_sdram_bankmachine1_cmd_buffer_source_payload_we = 1'd0;
reg [20:0] main_ethernetsoc_sdram_bankmachine1_cmd_buffer_source_payload_addr = 21'd0;
wire main_ethernetsoc_sdram_bankmachine1_cmd_buffer_pipe_ce;
wire main_ethernetsoc_sdram_bankmachine1_cmd_buffer_busy;
reg main_ethernetsoc_sdram_bankmachine1_cmd_buffer_valid_n = 1'd0;
reg main_ethernetsoc_sdram_bankmachine1_cmd_buffer_first_n = 1'd0;
reg main_ethernetsoc_sdram_bankmachine1_cmd_buffer_last_n = 1'd0;
reg [13:0] main_ethernetsoc_sdram_bankmachine1_row = 14'd0;
reg main_ethernetsoc_sdram_bankmachine1_row_opened = 1'd0;
wire main_ethernetsoc_sdram_bankmachine1_row_hit;
reg main_ethernetsoc_sdram_bankmachine1_row_open = 1'd0;
reg main_ethernetsoc_sdram_bankmachine1_row_close = 1'd0;
reg main_ethernetsoc_sdram_bankmachine1_row_col_n_addr_sel = 1'd0;
wire main_ethernetsoc_sdram_bankmachine1_twtpcon_valid;
(* dont_touch = "true" *) reg main_ethernetsoc_sdram_bankmachine1_twtpcon_ready = 1'd1;
reg [2:0] main_ethernetsoc_sdram_bankmachine1_twtpcon_count = 3'd0;
wire main_ethernetsoc_sdram_bankmachine1_trccon_valid;
(* dont_touch = "true" *) reg main_ethernetsoc_sdram_bankmachine1_trccon_ready = 1'd1;
reg [2:0] main_ethernetsoc_sdram_bankmachine1_trccon_count = 3'd0;
wire main_ethernetsoc_sdram_bankmachine1_trascon_valid;
(* dont_touch = "true" *) reg main_ethernetsoc_sdram_bankmachine1_trascon_ready = 1'd1;
reg [2:0] main_ethernetsoc_sdram_bankmachine1_trascon_count = 3'd0;
wire main_ethernetsoc_sdram_bankmachine2_req_valid;
wire main_ethernetsoc_sdram_bankmachine2_req_ready;
wire main_ethernetsoc_sdram_bankmachine2_req_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine2_req_addr;
wire main_ethernetsoc_sdram_bankmachine2_req_lock;
reg main_ethernetsoc_sdram_bankmachine2_req_wdata_ready = 1'd0;
reg main_ethernetsoc_sdram_bankmachine2_req_rdata_valid = 1'd0;
wire main_ethernetsoc_sdram_bankmachine2_refresh_req;
reg main_ethernetsoc_sdram_bankmachine2_refresh_gnt = 1'd0;
reg main_ethernetsoc_sdram_bankmachine2_cmd_valid = 1'd0;
reg main_ethernetsoc_sdram_bankmachine2_cmd_ready = 1'd0;
reg [13:0] main_ethernetsoc_sdram_bankmachine2_cmd_payload_a = 14'd0;
wire [2:0] main_ethernetsoc_sdram_bankmachine2_cmd_payload_ba;
reg main_ethernetsoc_sdram_bankmachine2_cmd_payload_cas = 1'd0;
reg main_ethernetsoc_sdram_bankmachine2_cmd_payload_ras = 1'd0;
reg main_ethernetsoc_sdram_bankmachine2_cmd_payload_we = 1'd0;
reg main_ethernetsoc_sdram_bankmachine2_cmd_payload_is_cmd = 1'd0;
reg main_ethernetsoc_sdram_bankmachine2_cmd_payload_is_read = 1'd0;
reg main_ethernetsoc_sdram_bankmachine2_cmd_payload_is_write = 1'd0;
reg main_ethernetsoc_sdram_bankmachine2_auto_precharge = 1'd0;
wire main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_sink_valid;
wire main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_sink_ready;
reg main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_sink_first = 1'd0;
reg main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_sink_last = 1'd0;
wire main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_sink_payload_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_sink_payload_addr;
wire main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_valid;
wire main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_ready;
wire main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_first;
wire main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_last;
wire main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_payload_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_payload_addr;
wire main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_we;
wire main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_writable;
wire main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_re;
wire main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_readable;
wire [23:0] main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_din;
wire [23:0] main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_dout;
reg [3:0] main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_level = 4'd0;
reg main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_replace = 1'd0;
reg [2:0] main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_produce = 3'd0;
reg [2:0] main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_consume = 3'd0;
reg [2:0] main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_wrport_adr = 3'd0;
wire [23:0] main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_wrport_dat_r;
wire main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_wrport_we;
wire [23:0] main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_wrport_dat_w;
wire main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_do_read;
wire [2:0] main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_rdport_adr;
wire [23:0] main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_rdport_dat_r;
wire main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_in_payload_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_in_payload_addr;
wire main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_in_first;
wire main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_in_last;
wire main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_out_payload_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_out_payload_addr;
wire main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_out_first;
wire main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_out_last;
wire main_ethernetsoc_sdram_bankmachine2_cmd_buffer_sink_valid;
wire main_ethernetsoc_sdram_bankmachine2_cmd_buffer_sink_ready;
wire main_ethernetsoc_sdram_bankmachine2_cmd_buffer_sink_first;
wire main_ethernetsoc_sdram_bankmachine2_cmd_buffer_sink_last;
wire main_ethernetsoc_sdram_bankmachine2_cmd_buffer_sink_payload_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine2_cmd_buffer_sink_payload_addr;
wire main_ethernetsoc_sdram_bankmachine2_cmd_buffer_source_valid;
wire main_ethernetsoc_sdram_bankmachine2_cmd_buffer_source_ready;
wire main_ethernetsoc_sdram_bankmachine2_cmd_buffer_source_first;
wire main_ethernetsoc_sdram_bankmachine2_cmd_buffer_source_last;
reg main_ethernetsoc_sdram_bankmachine2_cmd_buffer_source_payload_we = 1'd0;
reg [20:0] main_ethernetsoc_sdram_bankmachine2_cmd_buffer_source_payload_addr = 21'd0;
wire main_ethernetsoc_sdram_bankmachine2_cmd_buffer_pipe_ce;
wire main_ethernetsoc_sdram_bankmachine2_cmd_buffer_busy;
reg main_ethernetsoc_sdram_bankmachine2_cmd_buffer_valid_n = 1'd0;
reg main_ethernetsoc_sdram_bankmachine2_cmd_buffer_first_n = 1'd0;
reg main_ethernetsoc_sdram_bankmachine2_cmd_buffer_last_n = 1'd0;
reg [13:0] main_ethernetsoc_sdram_bankmachine2_row = 14'd0;
reg main_ethernetsoc_sdram_bankmachine2_row_opened = 1'd0;
wire main_ethernetsoc_sdram_bankmachine2_row_hit;
reg main_ethernetsoc_sdram_bankmachine2_row_open = 1'd0;
reg main_ethernetsoc_sdram_bankmachine2_row_close = 1'd0;
reg main_ethernetsoc_sdram_bankmachine2_row_col_n_addr_sel = 1'd0;
wire main_ethernetsoc_sdram_bankmachine2_twtpcon_valid;
(* dont_touch = "true" *) reg main_ethernetsoc_sdram_bankmachine2_twtpcon_ready = 1'd1;
reg [2:0] main_ethernetsoc_sdram_bankmachine2_twtpcon_count = 3'd0;
wire main_ethernetsoc_sdram_bankmachine2_trccon_valid;
(* dont_touch = "true" *) reg main_ethernetsoc_sdram_bankmachine2_trccon_ready = 1'd1;
reg [2:0] main_ethernetsoc_sdram_bankmachine2_trccon_count = 3'd0;
wire main_ethernetsoc_sdram_bankmachine2_trascon_valid;
(* dont_touch = "true" *) reg main_ethernetsoc_sdram_bankmachine2_trascon_ready = 1'd1;
reg [2:0] main_ethernetsoc_sdram_bankmachine2_trascon_count = 3'd0;
wire main_ethernetsoc_sdram_bankmachine3_req_valid;
wire main_ethernetsoc_sdram_bankmachine3_req_ready;
wire main_ethernetsoc_sdram_bankmachine3_req_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine3_req_addr;
wire main_ethernetsoc_sdram_bankmachine3_req_lock;
reg main_ethernetsoc_sdram_bankmachine3_req_wdata_ready = 1'd0;
reg main_ethernetsoc_sdram_bankmachine3_req_rdata_valid = 1'd0;
wire main_ethernetsoc_sdram_bankmachine3_refresh_req;
reg main_ethernetsoc_sdram_bankmachine3_refresh_gnt = 1'd0;
reg main_ethernetsoc_sdram_bankmachine3_cmd_valid = 1'd0;
reg main_ethernetsoc_sdram_bankmachine3_cmd_ready = 1'd0;
reg [13:0] main_ethernetsoc_sdram_bankmachine3_cmd_payload_a = 14'd0;
wire [2:0] main_ethernetsoc_sdram_bankmachine3_cmd_payload_ba;
reg main_ethernetsoc_sdram_bankmachine3_cmd_payload_cas = 1'd0;
reg main_ethernetsoc_sdram_bankmachine3_cmd_payload_ras = 1'd0;
reg main_ethernetsoc_sdram_bankmachine3_cmd_payload_we = 1'd0;
reg main_ethernetsoc_sdram_bankmachine3_cmd_payload_is_cmd = 1'd0;
reg main_ethernetsoc_sdram_bankmachine3_cmd_payload_is_read = 1'd0;
reg main_ethernetsoc_sdram_bankmachine3_cmd_payload_is_write = 1'd0;
reg main_ethernetsoc_sdram_bankmachine3_auto_precharge = 1'd0;
wire main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_sink_valid;
wire main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_sink_ready;
reg main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_sink_first = 1'd0;
reg main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_sink_last = 1'd0;
wire main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_sink_payload_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_sink_payload_addr;
wire main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_valid;
wire main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_ready;
wire main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_first;
wire main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_last;
wire main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_payload_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_payload_addr;
wire main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_we;
wire main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_writable;
wire main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_re;
wire main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_readable;
wire [23:0] main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_din;
wire [23:0] main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_dout;
reg [3:0] main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_level = 4'd0;
reg main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_replace = 1'd0;
reg [2:0] main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_produce = 3'd0;
reg [2:0] main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_consume = 3'd0;
reg [2:0] main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_wrport_adr = 3'd0;
wire [23:0] main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_wrport_dat_r;
wire main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_wrport_we;
wire [23:0] main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_wrport_dat_w;
wire main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_do_read;
wire [2:0] main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_rdport_adr;
wire [23:0] main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_rdport_dat_r;
wire main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_in_payload_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_in_payload_addr;
wire main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_in_first;
wire main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_in_last;
wire main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_out_payload_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_out_payload_addr;
wire main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_out_first;
wire main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_out_last;
wire main_ethernetsoc_sdram_bankmachine3_cmd_buffer_sink_valid;
wire main_ethernetsoc_sdram_bankmachine3_cmd_buffer_sink_ready;
wire main_ethernetsoc_sdram_bankmachine3_cmd_buffer_sink_first;
wire main_ethernetsoc_sdram_bankmachine3_cmd_buffer_sink_last;
wire main_ethernetsoc_sdram_bankmachine3_cmd_buffer_sink_payload_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine3_cmd_buffer_sink_payload_addr;
wire main_ethernetsoc_sdram_bankmachine3_cmd_buffer_source_valid;
wire main_ethernetsoc_sdram_bankmachine3_cmd_buffer_source_ready;
wire main_ethernetsoc_sdram_bankmachine3_cmd_buffer_source_first;
wire main_ethernetsoc_sdram_bankmachine3_cmd_buffer_source_last;
reg main_ethernetsoc_sdram_bankmachine3_cmd_buffer_source_payload_we = 1'd0;
reg [20:0] main_ethernetsoc_sdram_bankmachine3_cmd_buffer_source_payload_addr = 21'd0;
wire main_ethernetsoc_sdram_bankmachine3_cmd_buffer_pipe_ce;
wire main_ethernetsoc_sdram_bankmachine3_cmd_buffer_busy;
reg main_ethernetsoc_sdram_bankmachine3_cmd_buffer_valid_n = 1'd0;
reg main_ethernetsoc_sdram_bankmachine3_cmd_buffer_first_n = 1'd0;
reg main_ethernetsoc_sdram_bankmachine3_cmd_buffer_last_n = 1'd0;
reg [13:0] main_ethernetsoc_sdram_bankmachine3_row = 14'd0;
reg main_ethernetsoc_sdram_bankmachine3_row_opened = 1'd0;
wire main_ethernetsoc_sdram_bankmachine3_row_hit;
reg main_ethernetsoc_sdram_bankmachine3_row_open = 1'd0;
reg main_ethernetsoc_sdram_bankmachine3_row_close = 1'd0;
reg main_ethernetsoc_sdram_bankmachine3_row_col_n_addr_sel = 1'd0;
wire main_ethernetsoc_sdram_bankmachine3_twtpcon_valid;
(* dont_touch = "true" *) reg main_ethernetsoc_sdram_bankmachine3_twtpcon_ready = 1'd1;
reg [2:0] main_ethernetsoc_sdram_bankmachine3_twtpcon_count = 3'd0;
wire main_ethernetsoc_sdram_bankmachine3_trccon_valid;
(* dont_touch = "true" *) reg main_ethernetsoc_sdram_bankmachine3_trccon_ready = 1'd1;
reg [2:0] main_ethernetsoc_sdram_bankmachine3_trccon_count = 3'd0;
wire main_ethernetsoc_sdram_bankmachine3_trascon_valid;
(* dont_touch = "true" *) reg main_ethernetsoc_sdram_bankmachine3_trascon_ready = 1'd1;
reg [2:0] main_ethernetsoc_sdram_bankmachine3_trascon_count = 3'd0;
wire main_ethernetsoc_sdram_bankmachine4_req_valid;
wire main_ethernetsoc_sdram_bankmachine4_req_ready;
wire main_ethernetsoc_sdram_bankmachine4_req_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine4_req_addr;
wire main_ethernetsoc_sdram_bankmachine4_req_lock;
reg main_ethernetsoc_sdram_bankmachine4_req_wdata_ready = 1'd0;
reg main_ethernetsoc_sdram_bankmachine4_req_rdata_valid = 1'd0;
wire main_ethernetsoc_sdram_bankmachine4_refresh_req;
reg main_ethernetsoc_sdram_bankmachine4_refresh_gnt = 1'd0;
reg main_ethernetsoc_sdram_bankmachine4_cmd_valid = 1'd0;
reg main_ethernetsoc_sdram_bankmachine4_cmd_ready = 1'd0;
reg [13:0] main_ethernetsoc_sdram_bankmachine4_cmd_payload_a = 14'd0;
wire [2:0] main_ethernetsoc_sdram_bankmachine4_cmd_payload_ba;
reg main_ethernetsoc_sdram_bankmachine4_cmd_payload_cas = 1'd0;
reg main_ethernetsoc_sdram_bankmachine4_cmd_payload_ras = 1'd0;
reg main_ethernetsoc_sdram_bankmachine4_cmd_payload_we = 1'd0;
reg main_ethernetsoc_sdram_bankmachine4_cmd_payload_is_cmd = 1'd0;
reg main_ethernetsoc_sdram_bankmachine4_cmd_payload_is_read = 1'd0;
reg main_ethernetsoc_sdram_bankmachine4_cmd_payload_is_write = 1'd0;
reg main_ethernetsoc_sdram_bankmachine4_auto_precharge = 1'd0;
wire main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_sink_valid;
wire main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_sink_ready;
reg main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_sink_first = 1'd0;
reg main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_sink_last = 1'd0;
wire main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_sink_payload_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_sink_payload_addr;
wire main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_valid;
wire main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_ready;
wire main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_first;
wire main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_last;
wire main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_payload_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_payload_addr;
wire main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_we;
wire main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_writable;
wire main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_re;
wire main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_readable;
wire [23:0] main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_din;
wire [23:0] main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_dout;
reg [3:0] main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_level = 4'd0;
reg main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_replace = 1'd0;
reg [2:0] main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_produce = 3'd0;
reg [2:0] main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_consume = 3'd0;
reg [2:0] main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_wrport_adr = 3'd0;
wire [23:0] main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_wrport_dat_r;
wire main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_wrport_we;
wire [23:0] main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_wrport_dat_w;
wire main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_do_read;
wire [2:0] main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_rdport_adr;
wire [23:0] main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_rdport_dat_r;
wire main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_in_payload_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_in_payload_addr;
wire main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_in_first;
wire main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_in_last;
wire main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_out_payload_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_out_payload_addr;
wire main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_out_first;
wire main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_out_last;
wire main_ethernetsoc_sdram_bankmachine4_cmd_buffer_sink_valid;
wire main_ethernetsoc_sdram_bankmachine4_cmd_buffer_sink_ready;
wire main_ethernetsoc_sdram_bankmachine4_cmd_buffer_sink_first;
wire main_ethernetsoc_sdram_bankmachine4_cmd_buffer_sink_last;
wire main_ethernetsoc_sdram_bankmachine4_cmd_buffer_sink_payload_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine4_cmd_buffer_sink_payload_addr;
wire main_ethernetsoc_sdram_bankmachine4_cmd_buffer_source_valid;
wire main_ethernetsoc_sdram_bankmachine4_cmd_buffer_source_ready;
wire main_ethernetsoc_sdram_bankmachine4_cmd_buffer_source_first;
wire main_ethernetsoc_sdram_bankmachine4_cmd_buffer_source_last;
reg main_ethernetsoc_sdram_bankmachine4_cmd_buffer_source_payload_we = 1'd0;
reg [20:0] main_ethernetsoc_sdram_bankmachine4_cmd_buffer_source_payload_addr = 21'd0;
wire main_ethernetsoc_sdram_bankmachine4_cmd_buffer_pipe_ce;
wire main_ethernetsoc_sdram_bankmachine4_cmd_buffer_busy;
reg main_ethernetsoc_sdram_bankmachine4_cmd_buffer_valid_n = 1'd0;
reg main_ethernetsoc_sdram_bankmachine4_cmd_buffer_first_n = 1'd0;
reg main_ethernetsoc_sdram_bankmachine4_cmd_buffer_last_n = 1'd0;
reg [13:0] main_ethernetsoc_sdram_bankmachine4_row = 14'd0;
reg main_ethernetsoc_sdram_bankmachine4_row_opened = 1'd0;
wire main_ethernetsoc_sdram_bankmachine4_row_hit;
reg main_ethernetsoc_sdram_bankmachine4_row_open = 1'd0;
reg main_ethernetsoc_sdram_bankmachine4_row_close = 1'd0;
reg main_ethernetsoc_sdram_bankmachine4_row_col_n_addr_sel = 1'd0;
wire main_ethernetsoc_sdram_bankmachine4_twtpcon_valid;
(* dont_touch = "true" *) reg main_ethernetsoc_sdram_bankmachine4_twtpcon_ready = 1'd1;
reg [2:0] main_ethernetsoc_sdram_bankmachine4_twtpcon_count = 3'd0;
wire main_ethernetsoc_sdram_bankmachine4_trccon_valid;
(* dont_touch = "true" *) reg main_ethernetsoc_sdram_bankmachine4_trccon_ready = 1'd1;
reg [2:0] main_ethernetsoc_sdram_bankmachine4_trccon_count = 3'd0;
wire main_ethernetsoc_sdram_bankmachine4_trascon_valid;
(* dont_touch = "true" *) reg main_ethernetsoc_sdram_bankmachine4_trascon_ready = 1'd1;
reg [2:0] main_ethernetsoc_sdram_bankmachine4_trascon_count = 3'd0;
wire main_ethernetsoc_sdram_bankmachine5_req_valid;
wire main_ethernetsoc_sdram_bankmachine5_req_ready;
wire main_ethernetsoc_sdram_bankmachine5_req_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine5_req_addr;
wire main_ethernetsoc_sdram_bankmachine5_req_lock;
reg main_ethernetsoc_sdram_bankmachine5_req_wdata_ready = 1'd0;
reg main_ethernetsoc_sdram_bankmachine5_req_rdata_valid = 1'd0;
wire main_ethernetsoc_sdram_bankmachine5_refresh_req;
reg main_ethernetsoc_sdram_bankmachine5_refresh_gnt = 1'd0;
reg main_ethernetsoc_sdram_bankmachine5_cmd_valid = 1'd0;
reg main_ethernetsoc_sdram_bankmachine5_cmd_ready = 1'd0;
reg [13:0] main_ethernetsoc_sdram_bankmachine5_cmd_payload_a = 14'd0;
wire [2:0] main_ethernetsoc_sdram_bankmachine5_cmd_payload_ba;
reg main_ethernetsoc_sdram_bankmachine5_cmd_payload_cas = 1'd0;
reg main_ethernetsoc_sdram_bankmachine5_cmd_payload_ras = 1'd0;
reg main_ethernetsoc_sdram_bankmachine5_cmd_payload_we = 1'd0;
reg main_ethernetsoc_sdram_bankmachine5_cmd_payload_is_cmd = 1'd0;
reg main_ethernetsoc_sdram_bankmachine5_cmd_payload_is_read = 1'd0;
reg main_ethernetsoc_sdram_bankmachine5_cmd_payload_is_write = 1'd0;
reg main_ethernetsoc_sdram_bankmachine5_auto_precharge = 1'd0;
wire main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_sink_valid;
wire main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_sink_ready;
reg main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_sink_first = 1'd0;
reg main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_sink_last = 1'd0;
wire main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_sink_payload_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_sink_payload_addr;
wire main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_valid;
wire main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_ready;
wire main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_first;
wire main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_last;
wire main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_payload_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_payload_addr;
wire main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_we;
wire main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_writable;
wire main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_re;
wire main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_readable;
wire [23:0] main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_din;
wire [23:0] main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_dout;
reg [3:0] main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_level = 4'd0;
reg main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_replace = 1'd0;
reg [2:0] main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_produce = 3'd0;
reg [2:0] main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_consume = 3'd0;
reg [2:0] main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_wrport_adr = 3'd0;
wire [23:0] main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_wrport_dat_r;
wire main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_wrport_we;
wire [23:0] main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_wrport_dat_w;
wire main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_do_read;
wire [2:0] main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_rdport_adr;
wire [23:0] main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_rdport_dat_r;
wire main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_in_payload_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_in_payload_addr;
wire main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_in_first;
wire main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_in_last;
wire main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_out_payload_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_out_payload_addr;
wire main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_out_first;
wire main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_out_last;
wire main_ethernetsoc_sdram_bankmachine5_cmd_buffer_sink_valid;
wire main_ethernetsoc_sdram_bankmachine5_cmd_buffer_sink_ready;
wire main_ethernetsoc_sdram_bankmachine5_cmd_buffer_sink_first;
wire main_ethernetsoc_sdram_bankmachine5_cmd_buffer_sink_last;
wire main_ethernetsoc_sdram_bankmachine5_cmd_buffer_sink_payload_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine5_cmd_buffer_sink_payload_addr;
wire main_ethernetsoc_sdram_bankmachine5_cmd_buffer_source_valid;
wire main_ethernetsoc_sdram_bankmachine5_cmd_buffer_source_ready;
wire main_ethernetsoc_sdram_bankmachine5_cmd_buffer_source_first;
wire main_ethernetsoc_sdram_bankmachine5_cmd_buffer_source_last;
reg main_ethernetsoc_sdram_bankmachine5_cmd_buffer_source_payload_we = 1'd0;
reg [20:0] main_ethernetsoc_sdram_bankmachine5_cmd_buffer_source_payload_addr = 21'd0;
wire main_ethernetsoc_sdram_bankmachine5_cmd_buffer_pipe_ce;
wire main_ethernetsoc_sdram_bankmachine5_cmd_buffer_busy;
reg main_ethernetsoc_sdram_bankmachine5_cmd_buffer_valid_n = 1'd0;
reg main_ethernetsoc_sdram_bankmachine5_cmd_buffer_first_n = 1'd0;
reg main_ethernetsoc_sdram_bankmachine5_cmd_buffer_last_n = 1'd0;
reg [13:0] main_ethernetsoc_sdram_bankmachine5_row = 14'd0;
reg main_ethernetsoc_sdram_bankmachine5_row_opened = 1'd0;
wire main_ethernetsoc_sdram_bankmachine5_row_hit;
reg main_ethernetsoc_sdram_bankmachine5_row_open = 1'd0;
reg main_ethernetsoc_sdram_bankmachine5_row_close = 1'd0;
reg main_ethernetsoc_sdram_bankmachine5_row_col_n_addr_sel = 1'd0;
wire main_ethernetsoc_sdram_bankmachine5_twtpcon_valid;
(* dont_touch = "true" *) reg main_ethernetsoc_sdram_bankmachine5_twtpcon_ready = 1'd1;
reg [2:0] main_ethernetsoc_sdram_bankmachine5_twtpcon_count = 3'd0;
wire main_ethernetsoc_sdram_bankmachine5_trccon_valid;
(* dont_touch = "true" *) reg main_ethernetsoc_sdram_bankmachine5_trccon_ready = 1'd1;
reg [2:0] main_ethernetsoc_sdram_bankmachine5_trccon_count = 3'd0;
wire main_ethernetsoc_sdram_bankmachine5_trascon_valid;
(* dont_touch = "true" *) reg main_ethernetsoc_sdram_bankmachine5_trascon_ready = 1'd1;
reg [2:0] main_ethernetsoc_sdram_bankmachine5_trascon_count = 3'd0;
wire main_ethernetsoc_sdram_bankmachine6_req_valid;
wire main_ethernetsoc_sdram_bankmachine6_req_ready;
wire main_ethernetsoc_sdram_bankmachine6_req_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine6_req_addr;
wire main_ethernetsoc_sdram_bankmachine6_req_lock;
reg main_ethernetsoc_sdram_bankmachine6_req_wdata_ready = 1'd0;
reg main_ethernetsoc_sdram_bankmachine6_req_rdata_valid = 1'd0;
wire main_ethernetsoc_sdram_bankmachine6_refresh_req;
reg main_ethernetsoc_sdram_bankmachine6_refresh_gnt = 1'd0;
reg main_ethernetsoc_sdram_bankmachine6_cmd_valid = 1'd0;
reg main_ethernetsoc_sdram_bankmachine6_cmd_ready = 1'd0;
reg [13:0] main_ethernetsoc_sdram_bankmachine6_cmd_payload_a = 14'd0;
wire [2:0] main_ethernetsoc_sdram_bankmachine6_cmd_payload_ba;
reg main_ethernetsoc_sdram_bankmachine6_cmd_payload_cas = 1'd0;
reg main_ethernetsoc_sdram_bankmachine6_cmd_payload_ras = 1'd0;
reg main_ethernetsoc_sdram_bankmachine6_cmd_payload_we = 1'd0;
reg main_ethernetsoc_sdram_bankmachine6_cmd_payload_is_cmd = 1'd0;
reg main_ethernetsoc_sdram_bankmachine6_cmd_payload_is_read = 1'd0;
reg main_ethernetsoc_sdram_bankmachine6_cmd_payload_is_write = 1'd0;
reg main_ethernetsoc_sdram_bankmachine6_auto_precharge = 1'd0;
wire main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_sink_valid;
wire main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_sink_ready;
reg main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_sink_first = 1'd0;
reg main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_sink_last = 1'd0;
wire main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_sink_payload_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_sink_payload_addr;
wire main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_valid;
wire main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_ready;
wire main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_first;
wire main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_last;
wire main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_payload_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_payload_addr;
wire main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_we;
wire main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_writable;
wire main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_re;
wire main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_readable;
wire [23:0] main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_din;
wire [23:0] main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_dout;
reg [3:0] main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_level = 4'd0;
reg main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_replace = 1'd0;
reg [2:0] main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_produce = 3'd0;
reg [2:0] main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_consume = 3'd0;
reg [2:0] main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_wrport_adr = 3'd0;
wire [23:0] main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_wrport_dat_r;
wire main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_wrport_we;
wire [23:0] main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_wrport_dat_w;
wire main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_do_read;
wire [2:0] main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_rdport_adr;
wire [23:0] main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_rdport_dat_r;
wire main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_in_payload_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_in_payload_addr;
wire main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_in_first;
wire main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_in_last;
wire main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_out_payload_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_out_payload_addr;
wire main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_out_first;
wire main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_out_last;
wire main_ethernetsoc_sdram_bankmachine6_cmd_buffer_sink_valid;
wire main_ethernetsoc_sdram_bankmachine6_cmd_buffer_sink_ready;
wire main_ethernetsoc_sdram_bankmachine6_cmd_buffer_sink_first;
wire main_ethernetsoc_sdram_bankmachine6_cmd_buffer_sink_last;
wire main_ethernetsoc_sdram_bankmachine6_cmd_buffer_sink_payload_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine6_cmd_buffer_sink_payload_addr;
wire main_ethernetsoc_sdram_bankmachine6_cmd_buffer_source_valid;
wire main_ethernetsoc_sdram_bankmachine6_cmd_buffer_source_ready;
wire main_ethernetsoc_sdram_bankmachine6_cmd_buffer_source_first;
wire main_ethernetsoc_sdram_bankmachine6_cmd_buffer_source_last;
reg main_ethernetsoc_sdram_bankmachine6_cmd_buffer_source_payload_we = 1'd0;
reg [20:0] main_ethernetsoc_sdram_bankmachine6_cmd_buffer_source_payload_addr = 21'd0;
wire main_ethernetsoc_sdram_bankmachine6_cmd_buffer_pipe_ce;
wire main_ethernetsoc_sdram_bankmachine6_cmd_buffer_busy;
reg main_ethernetsoc_sdram_bankmachine6_cmd_buffer_valid_n = 1'd0;
reg main_ethernetsoc_sdram_bankmachine6_cmd_buffer_first_n = 1'd0;
reg main_ethernetsoc_sdram_bankmachine6_cmd_buffer_last_n = 1'd0;
reg [13:0] main_ethernetsoc_sdram_bankmachine6_row = 14'd0;
reg main_ethernetsoc_sdram_bankmachine6_row_opened = 1'd0;
wire main_ethernetsoc_sdram_bankmachine6_row_hit;
reg main_ethernetsoc_sdram_bankmachine6_row_open = 1'd0;
reg main_ethernetsoc_sdram_bankmachine6_row_close = 1'd0;
reg main_ethernetsoc_sdram_bankmachine6_row_col_n_addr_sel = 1'd0;
wire main_ethernetsoc_sdram_bankmachine6_twtpcon_valid;
(* dont_touch = "true" *) reg main_ethernetsoc_sdram_bankmachine6_twtpcon_ready = 1'd1;
reg [2:0] main_ethernetsoc_sdram_bankmachine6_twtpcon_count = 3'd0;
wire main_ethernetsoc_sdram_bankmachine6_trccon_valid;
(* dont_touch = "true" *) reg main_ethernetsoc_sdram_bankmachine6_trccon_ready = 1'd1;
reg [2:0] main_ethernetsoc_sdram_bankmachine6_trccon_count = 3'd0;
wire main_ethernetsoc_sdram_bankmachine6_trascon_valid;
(* dont_touch = "true" *) reg main_ethernetsoc_sdram_bankmachine6_trascon_ready = 1'd1;
reg [2:0] main_ethernetsoc_sdram_bankmachine6_trascon_count = 3'd0;
wire main_ethernetsoc_sdram_bankmachine7_req_valid;
wire main_ethernetsoc_sdram_bankmachine7_req_ready;
wire main_ethernetsoc_sdram_bankmachine7_req_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine7_req_addr;
wire main_ethernetsoc_sdram_bankmachine7_req_lock;
reg main_ethernetsoc_sdram_bankmachine7_req_wdata_ready = 1'd0;
reg main_ethernetsoc_sdram_bankmachine7_req_rdata_valid = 1'd0;
wire main_ethernetsoc_sdram_bankmachine7_refresh_req;
reg main_ethernetsoc_sdram_bankmachine7_refresh_gnt = 1'd0;
reg main_ethernetsoc_sdram_bankmachine7_cmd_valid = 1'd0;
reg main_ethernetsoc_sdram_bankmachine7_cmd_ready = 1'd0;
reg [13:0] main_ethernetsoc_sdram_bankmachine7_cmd_payload_a = 14'd0;
wire [2:0] main_ethernetsoc_sdram_bankmachine7_cmd_payload_ba;
reg main_ethernetsoc_sdram_bankmachine7_cmd_payload_cas = 1'd0;
reg main_ethernetsoc_sdram_bankmachine7_cmd_payload_ras = 1'd0;
reg main_ethernetsoc_sdram_bankmachine7_cmd_payload_we = 1'd0;
reg main_ethernetsoc_sdram_bankmachine7_cmd_payload_is_cmd = 1'd0;
reg main_ethernetsoc_sdram_bankmachine7_cmd_payload_is_read = 1'd0;
reg main_ethernetsoc_sdram_bankmachine7_cmd_payload_is_write = 1'd0;
reg main_ethernetsoc_sdram_bankmachine7_auto_precharge = 1'd0;
wire main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_sink_valid;
wire main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_sink_ready;
reg main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_sink_first = 1'd0;
reg main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_sink_last = 1'd0;
wire main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_sink_payload_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_sink_payload_addr;
wire main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_valid;
wire main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_ready;
wire main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_first;
wire main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_last;
wire main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_payload_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_payload_addr;
wire main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_we;
wire main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_writable;
wire main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_re;
wire main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_readable;
wire [23:0] main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_din;
wire [23:0] main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_dout;
reg [3:0] main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_level = 4'd0;
reg main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_replace = 1'd0;
reg [2:0] main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_produce = 3'd0;
reg [2:0] main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_consume = 3'd0;
reg [2:0] main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_wrport_adr = 3'd0;
wire [23:0] main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_wrport_dat_r;
wire main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_wrport_we;
wire [23:0] main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_wrport_dat_w;
wire main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_do_read;
wire [2:0] main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_rdport_adr;
wire [23:0] main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_rdport_dat_r;
wire main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_in_payload_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_in_payload_addr;
wire main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_in_first;
wire main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_in_last;
wire main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_out_payload_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_out_payload_addr;
wire main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_out_first;
wire main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_out_last;
wire main_ethernetsoc_sdram_bankmachine7_cmd_buffer_sink_valid;
wire main_ethernetsoc_sdram_bankmachine7_cmd_buffer_sink_ready;
wire main_ethernetsoc_sdram_bankmachine7_cmd_buffer_sink_first;
wire main_ethernetsoc_sdram_bankmachine7_cmd_buffer_sink_last;
wire main_ethernetsoc_sdram_bankmachine7_cmd_buffer_sink_payload_we;
wire [20:0] main_ethernetsoc_sdram_bankmachine7_cmd_buffer_sink_payload_addr;
wire main_ethernetsoc_sdram_bankmachine7_cmd_buffer_source_valid;
wire main_ethernetsoc_sdram_bankmachine7_cmd_buffer_source_ready;
wire main_ethernetsoc_sdram_bankmachine7_cmd_buffer_source_first;
wire main_ethernetsoc_sdram_bankmachine7_cmd_buffer_source_last;
reg main_ethernetsoc_sdram_bankmachine7_cmd_buffer_source_payload_we = 1'd0;
reg [20:0] main_ethernetsoc_sdram_bankmachine7_cmd_buffer_source_payload_addr = 21'd0;
wire main_ethernetsoc_sdram_bankmachine7_cmd_buffer_pipe_ce;
wire main_ethernetsoc_sdram_bankmachine7_cmd_buffer_busy;
reg main_ethernetsoc_sdram_bankmachine7_cmd_buffer_valid_n = 1'd0;
reg main_ethernetsoc_sdram_bankmachine7_cmd_buffer_first_n = 1'd0;
reg main_ethernetsoc_sdram_bankmachine7_cmd_buffer_last_n = 1'd0;
reg [13:0] main_ethernetsoc_sdram_bankmachine7_row = 14'd0;
reg main_ethernetsoc_sdram_bankmachine7_row_opened = 1'd0;
wire main_ethernetsoc_sdram_bankmachine7_row_hit;
reg main_ethernetsoc_sdram_bankmachine7_row_open = 1'd0;
reg main_ethernetsoc_sdram_bankmachine7_row_close = 1'd0;
reg main_ethernetsoc_sdram_bankmachine7_row_col_n_addr_sel = 1'd0;
wire main_ethernetsoc_sdram_bankmachine7_twtpcon_valid;
(* dont_touch = "true" *) reg main_ethernetsoc_sdram_bankmachine7_twtpcon_ready = 1'd1;
reg [2:0] main_ethernetsoc_sdram_bankmachine7_twtpcon_count = 3'd0;
wire main_ethernetsoc_sdram_bankmachine7_trccon_valid;
(* dont_touch = "true" *) reg main_ethernetsoc_sdram_bankmachine7_trccon_ready = 1'd1;
reg [2:0] main_ethernetsoc_sdram_bankmachine7_trccon_count = 3'd0;
wire main_ethernetsoc_sdram_bankmachine7_trascon_valid;
(* dont_touch = "true" *) reg main_ethernetsoc_sdram_bankmachine7_trascon_ready = 1'd1;
reg [2:0] main_ethernetsoc_sdram_bankmachine7_trascon_count = 3'd0;
wire main_ethernetsoc_sdram_ras_allowed;
wire main_ethernetsoc_sdram_cas_allowed;
reg main_ethernetsoc_sdram_choose_cmd_want_reads = 1'd0;
reg main_ethernetsoc_sdram_choose_cmd_want_writes = 1'd0;
reg main_ethernetsoc_sdram_choose_cmd_want_cmds = 1'd0;
reg main_ethernetsoc_sdram_choose_cmd_want_activates = 1'd0;
wire main_ethernetsoc_sdram_choose_cmd_cmd_valid;
reg main_ethernetsoc_sdram_choose_cmd_cmd_ready = 1'd0;
wire [13:0] main_ethernetsoc_sdram_choose_cmd_cmd_payload_a;
wire [2:0] main_ethernetsoc_sdram_choose_cmd_cmd_payload_ba;
reg main_ethernetsoc_sdram_choose_cmd_cmd_payload_cas = 1'd0;
reg main_ethernetsoc_sdram_choose_cmd_cmd_payload_ras = 1'd0;
reg main_ethernetsoc_sdram_choose_cmd_cmd_payload_we = 1'd0;
wire main_ethernetsoc_sdram_choose_cmd_cmd_payload_is_cmd;
wire main_ethernetsoc_sdram_choose_cmd_cmd_payload_is_read;
wire main_ethernetsoc_sdram_choose_cmd_cmd_payload_is_write;
reg [7:0] main_ethernetsoc_sdram_choose_cmd_valids = 8'd0;
wire [7:0] main_ethernetsoc_sdram_choose_cmd_request;
reg [2:0] main_ethernetsoc_sdram_choose_cmd_grant = 3'd0;
wire main_ethernetsoc_sdram_choose_cmd_ce;
reg main_ethernetsoc_sdram_choose_req_want_reads = 1'd0;
reg main_ethernetsoc_sdram_choose_req_want_writes = 1'd0;
reg main_ethernetsoc_sdram_choose_req_want_cmds = 1'd0;
reg main_ethernetsoc_sdram_choose_req_want_activates = 1'd0;
wire main_ethernetsoc_sdram_choose_req_cmd_valid;
reg main_ethernetsoc_sdram_choose_req_cmd_ready = 1'd0;
wire [13:0] main_ethernetsoc_sdram_choose_req_cmd_payload_a;
wire [2:0] main_ethernetsoc_sdram_choose_req_cmd_payload_ba;
reg main_ethernetsoc_sdram_choose_req_cmd_payload_cas = 1'd0;
reg main_ethernetsoc_sdram_choose_req_cmd_payload_ras = 1'd0;
reg main_ethernetsoc_sdram_choose_req_cmd_payload_we = 1'd0;
wire main_ethernetsoc_sdram_choose_req_cmd_payload_is_cmd;
wire main_ethernetsoc_sdram_choose_req_cmd_payload_is_read;
wire main_ethernetsoc_sdram_choose_req_cmd_payload_is_write;
reg [7:0] main_ethernetsoc_sdram_choose_req_valids = 8'd0;
wire [7:0] main_ethernetsoc_sdram_choose_req_request;
reg [2:0] main_ethernetsoc_sdram_choose_req_grant = 3'd0;
wire main_ethernetsoc_sdram_choose_req_ce;
reg [13:0] main_ethernetsoc_sdram_nop_a = 14'd0;
reg [2:0] main_ethernetsoc_sdram_nop_ba = 3'd0;
reg [1:0] main_ethernetsoc_sdram_steerer_sel0 = 2'd0;
reg [1:0] main_ethernetsoc_sdram_steerer_sel1 = 2'd0;
reg [1:0] main_ethernetsoc_sdram_steerer_sel2 = 2'd0;
reg [1:0] main_ethernetsoc_sdram_steerer_sel3 = 2'd0;
reg main_ethernetsoc_sdram_steerer0 = 1'd1;
reg main_ethernetsoc_sdram_steerer1 = 1'd1;
reg main_ethernetsoc_sdram_steerer2 = 1'd1;
reg main_ethernetsoc_sdram_steerer3 = 1'd1;
reg main_ethernetsoc_sdram_steerer4 = 1'd1;
reg main_ethernetsoc_sdram_steerer5 = 1'd1;
reg main_ethernetsoc_sdram_steerer6 = 1'd1;
reg main_ethernetsoc_sdram_steerer7 = 1'd1;
wire main_ethernetsoc_sdram_trrdcon_valid;
(* dont_touch = "true" *) reg main_ethernetsoc_sdram_trrdcon_ready = 1'd1;
reg main_ethernetsoc_sdram_trrdcon_count = 1'd0;
wire main_ethernetsoc_sdram_tfawcon_valid;
(* dont_touch = "true" *) reg main_ethernetsoc_sdram_tfawcon_ready = 1'd1;
wire [2:0] main_ethernetsoc_sdram_tfawcon_count;
reg [4:0] main_ethernetsoc_sdram_tfawcon_window = 5'd0;
wire main_ethernetsoc_sdram_tccdcon_valid;
(* dont_touch = "true" *) reg main_ethernetsoc_sdram_tccdcon_ready = 1'd1;
reg main_ethernetsoc_sdram_tccdcon_count = 1'd0;
wire main_ethernetsoc_sdram_twtrcon_valid;
(* dont_touch = "true" *) reg main_ethernetsoc_sdram_twtrcon_ready = 1'd1;
reg [2:0] main_ethernetsoc_sdram_twtrcon_count = 3'd0;
wire main_ethernetsoc_sdram_read_available;
wire main_ethernetsoc_sdram_write_available;
reg main_ethernetsoc_sdram_en0 = 1'd0;
wire main_ethernetsoc_sdram_max_time0;
reg [4:0] main_ethernetsoc_sdram_time0 = 5'd0;
reg main_ethernetsoc_sdram_en1 = 1'd0;
wire main_ethernetsoc_sdram_max_time1;
reg [3:0] main_ethernetsoc_sdram_time1 = 4'd0;
wire main_ethernetsoc_sdram_go_to_refresh;
wire [29:0] main_ethernetsoc_interface1_wb_sdram_adr;
wire [31:0] main_ethernetsoc_interface1_wb_sdram_dat_w;
wire [31:0] main_ethernetsoc_interface1_wb_sdram_dat_r;
wire [3:0] main_ethernetsoc_interface1_wb_sdram_sel;
wire main_ethernetsoc_interface1_wb_sdram_cyc;
wire main_ethernetsoc_interface1_wb_sdram_stb;
wire main_ethernetsoc_interface1_wb_sdram_ack;
wire main_ethernetsoc_interface1_wb_sdram_we;
wire [2:0] main_ethernetsoc_interface1_wb_sdram_cti;
wire [1:0] main_ethernetsoc_interface1_wb_sdram_bte;
wire main_ethernetsoc_interface1_wb_sdram_err;
reg main_ethernetsoc_port_cmd_valid = 1'd0;
wire main_ethernetsoc_port_cmd_ready;
reg main_ethernetsoc_port_cmd_payload_we = 1'd0;
reg [23:0] main_ethernetsoc_port_cmd_payload_addr = 24'd0;
reg main_ethernetsoc_port_wdata_valid = 1'd0;
wire main_ethernetsoc_port_wdata_ready;
reg [127:0] main_ethernetsoc_port_wdata_payload_data = 128'd0;
reg [15:0] main_ethernetsoc_port_wdata_payload_we = 16'd0;
wire main_ethernetsoc_port_rdata_valid;
reg main_ethernetsoc_port_rdata_ready = 1'd0;
wire [127:0] main_ethernetsoc_port_rdata_payload_data;
wire [29:0] main_ethernetsoc_adr;
wire [127:0] main_ethernetsoc_dat_w;
reg [127:0] main_ethernetsoc_dat_r = 128'd0;
wire [15:0] main_ethernetsoc_sel;
reg main_ethernetsoc_cyc = 1'd0;
reg main_ethernetsoc_stb = 1'd0;
reg main_ethernetsoc_ack = 1'd0;
reg main_ethernetsoc_we = 1'd0;
wire [8:0] main_ethernetsoc_data_port_adr;
wire [127:0] main_ethernetsoc_data_port_dat_r;
reg [15:0] main_ethernetsoc_data_port_we = 16'd0;
reg [127:0] main_ethernetsoc_data_port_dat_w = 128'd0;
reg main_ethernetsoc_write_from_slave = 1'd0;
reg [1:0] main_ethernetsoc_adr_offset_r = 2'd0;
wire [8:0] main_ethernetsoc_tag_port_adr;
wire [23:0] main_ethernetsoc_tag_port_dat_r;
reg main_ethernetsoc_tag_port_we = 1'd0;
wire [23:0] main_ethernetsoc_tag_port_dat_w;
wire [22:0] main_ethernetsoc_tag_do_tag;
wire main_ethernetsoc_tag_do_dirty;
wire [22:0] main_ethernetsoc_tag_di_tag;
reg main_ethernetsoc_tag_di_dirty = 1'd0;
reg main_ethernetsoc_word_clr = 1'd0;
reg main_ethernetsoc_word_inc = 1'd0;
reg main_ethphy_reset_storage_full = 1'd0;
wire main_ethphy_reset_storage;
reg main_ethphy_reset_re = 1'd0;
(* dont_touch = "true" *) wire eth_rx_clk;
wire eth_rx_rst;
(* dont_touch = "true" *) wire eth_tx_clk;
wire eth_tx_rst;
wire main_ethphy_reset0;
wire main_ethphy_reset1;
reg [8:0] main_ethphy_counter = 9'd0;
wire main_ethphy_counter_done;
wire main_ethphy_counter_ce;
wire main_ethphy_liteethphymiitx_sink_sink_valid;
wire main_ethphy_liteethphymiitx_sink_sink_ready;
wire main_ethphy_liteethphymiitx_sink_sink_first;
wire main_ethphy_liteethphymiitx_sink_sink_last;
wire [7:0] main_ethphy_liteethphymiitx_sink_sink_payload_data;
wire main_ethphy_liteethphymiitx_sink_sink_payload_last_be;
wire main_ethphy_liteethphymiitx_sink_sink_payload_error;
wire main_ethphy_liteethphymiitx_converter_sink_valid;
wire main_ethphy_liteethphymiitx_converter_sink_ready;
reg main_ethphy_liteethphymiitx_converter_sink_first = 1'd0;
reg main_ethphy_liteethphymiitx_converter_sink_last = 1'd0;
wire [7:0] main_ethphy_liteethphymiitx_converter_sink_payload_data;
wire main_ethphy_liteethphymiitx_converter_source_valid;
wire main_ethphy_liteethphymiitx_converter_source_ready;
wire main_ethphy_liteethphymiitx_converter_source_first;
wire main_ethphy_liteethphymiitx_converter_source_last;
wire [3:0] main_ethphy_liteethphymiitx_converter_source_payload_data;
wire main_ethphy_liteethphymiitx_converter_converter_sink_valid;
wire main_ethphy_liteethphymiitx_converter_converter_sink_ready;
wire main_ethphy_liteethphymiitx_converter_converter_sink_first;
wire main_ethphy_liteethphymiitx_converter_converter_sink_last;
reg [7:0] main_ethphy_liteethphymiitx_converter_converter_sink_payload_data = 8'd0;
wire main_ethphy_liteethphymiitx_converter_converter_source_valid;
wire main_ethphy_liteethphymiitx_converter_converter_source_ready;
wire main_ethphy_liteethphymiitx_converter_converter_source_first;
wire main_ethphy_liteethphymiitx_converter_converter_source_last;
reg [3:0] main_ethphy_liteethphymiitx_converter_converter_source_payload_data = 4'd0;
wire main_ethphy_liteethphymiitx_converter_converter_source_payload_valid_token_count;
reg main_ethphy_liteethphymiitx_converter_converter_mux = 1'd0;
wire main_ethphy_liteethphymiitx_converter_converter_first;
wire main_ethphy_liteethphymiitx_converter_converter_last;
wire main_ethphy_liteethphymiitx_converter_source_source_valid;
wire main_ethphy_liteethphymiitx_converter_source_source_ready;
wire main_ethphy_liteethphymiitx_converter_source_source_first;
wire main_ethphy_liteethphymiitx_converter_source_source_last;
wire [3:0] main_ethphy_liteethphymiitx_converter_source_source_payload_data;
wire main_ethphy_liteethphymiirx_source_source_valid;
wire main_ethphy_liteethphymiirx_source_source_ready;
wire main_ethphy_liteethphymiirx_source_source_first;
wire main_ethphy_liteethphymiirx_source_source_last;
wire [7:0] main_ethphy_liteethphymiirx_source_source_payload_data;
reg main_ethphy_liteethphymiirx_source_source_payload_last_be = 1'd0;
reg main_ethphy_liteethphymiirx_source_source_payload_error = 1'd0;
reg main_ethphy_liteethphymiirx_converter_sink_valid = 1'd0;
wire main_ethphy_liteethphymiirx_converter_sink_ready;
reg main_ethphy_liteethphymiirx_converter_sink_first = 1'd0;
wire main_ethphy_liteethphymiirx_converter_sink_last;
reg [3:0] main_ethphy_liteethphymiirx_converter_sink_payload_data = 4'd0;
wire main_ethphy_liteethphymiirx_converter_source_valid;
wire main_ethphy_liteethphymiirx_converter_source_ready;
wire main_ethphy_liteethphymiirx_converter_source_first;
wire main_ethphy_liteethphymiirx_converter_source_last;
reg [7:0] main_ethphy_liteethphymiirx_converter_source_payload_data = 8'd0;
wire main_ethphy_liteethphymiirx_converter_converter_sink_valid;
wire main_ethphy_liteethphymiirx_converter_converter_sink_ready;
wire main_ethphy_liteethphymiirx_converter_converter_sink_first;
wire main_ethphy_liteethphymiirx_converter_converter_sink_last;
wire [3:0] main_ethphy_liteethphymiirx_converter_converter_sink_payload_data;
wire main_ethphy_liteethphymiirx_converter_converter_source_valid;
wire main_ethphy_liteethphymiirx_converter_converter_source_ready;
reg main_ethphy_liteethphymiirx_converter_converter_source_first = 1'd0;
reg main_ethphy_liteethphymiirx_converter_converter_source_last = 1'd0;
reg [7:0] main_ethphy_liteethphymiirx_converter_converter_source_payload_data = 8'd0;
reg [1:0] main_ethphy_liteethphymiirx_converter_converter_source_payload_valid_token_count = 2'd0;
reg main_ethphy_liteethphymiirx_converter_converter_demux = 1'd0;
wire main_ethphy_liteethphymiirx_converter_converter_load_part;
reg main_ethphy_liteethphymiirx_converter_converter_strobe_all = 1'd0;
wire main_ethphy_liteethphymiirx_converter_source_source_valid;
wire main_ethphy_liteethphymiirx_converter_source_source_ready;
wire main_ethphy_liteethphymiirx_converter_source_source_first;
wire main_ethphy_liteethphymiirx_converter_source_source_last;
wire [7:0] main_ethphy_liteethphymiirx_converter_source_source_payload_data;
reg main_ethphy_liteethphymiirx_converter_reset = 1'd0;
reg [2:0] main_ethphy_storage_full = 3'd0;
wire [2:0] main_ethphy_storage;
reg main_ethphy_re = 1'd0;
wire main_ethphy_status;
wire main_ethphy_data_w;
wire main_ethphy_data_oe;
wire main_ethphy_data_r;
wire main_tx_gap_inserter_sink_valid;
reg main_tx_gap_inserter_sink_ready = 1'd0;
wire main_tx_gap_inserter_sink_first;
wire main_tx_gap_inserter_sink_last;
wire [7:0] main_tx_gap_inserter_sink_payload_data;
wire main_tx_gap_inserter_sink_payload_last_be;
wire main_tx_gap_inserter_sink_payload_error;
reg main_tx_gap_inserter_source_valid = 1'd0;
wire main_tx_gap_inserter_source_ready;
reg main_tx_gap_inserter_source_first = 1'd0;
reg main_tx_gap_inserter_source_last = 1'd0;
reg [7:0] main_tx_gap_inserter_source_payload_data = 8'd0;
reg main_tx_gap_inserter_source_payload_last_be = 1'd0;
reg main_tx_gap_inserter_source_payload_error = 1'd0;
reg [3:0] main_tx_gap_inserter_counter = 4'd0;
reg main_tx_gap_inserter_counter_reset = 1'd0;
reg main_tx_gap_inserter_counter_ce = 1'd0;
reg main_preamble_crc_status = 1'd1;
reg [31:0] main_preamble_errors_status = 32'd0;
reg [31:0] main_crc_errors_status = 32'd0;
wire main_preamble_inserter_sink_valid;
reg main_preamble_inserter_sink_ready = 1'd0;
wire main_preamble_inserter_sink_first;
wire main_preamble_inserter_sink_last;
wire [7:0] main_preamble_inserter_sink_payload_data;
wire main_preamble_inserter_sink_payload_last_be;
wire main_preamble_inserter_sink_payload_error;
reg main_preamble_inserter_source_valid = 1'd0;
wire main_preamble_inserter_source_ready;
reg main_preamble_inserter_source_first = 1'd0;
reg main_preamble_inserter_source_last = 1'd0;
reg [7:0] main_preamble_inserter_source_payload_data = 8'd0;
wire main_preamble_inserter_source_payload_last_be;
reg main_preamble_inserter_source_payload_error = 1'd0;
reg [63:0] main_preamble_inserter_preamble = 64'd15372286728091293013;
reg [2:0] main_preamble_inserter_cnt = 3'd0;
reg main_preamble_inserter_clr_cnt = 1'd0;
reg main_preamble_inserter_inc_cnt = 1'd0;
wire main_preamble_checker_sink_valid;
reg main_preamble_checker_sink_ready = 1'd0;
wire main_preamble_checker_sink_first;
wire main_preamble_checker_sink_last;
wire [7:0] main_preamble_checker_sink_payload_data;
wire main_preamble_checker_sink_payload_last_be;
wire main_preamble_checker_sink_payload_error;
reg main_preamble_checker_source_valid = 1'd0;
wire main_preamble_checker_source_ready;
reg main_preamble_checker_source_first = 1'd0;
reg main_preamble_checker_source_last = 1'd0;
wire [7:0] main_preamble_checker_source_payload_data;
wire main_preamble_checker_source_payload_last_be;
reg main_preamble_checker_source_payload_error = 1'd0;
reg main_preamble_checker_error = 1'd0;
wire main_crc32_inserter_sink_valid;
reg main_crc32_inserter_sink_ready = 1'd0;
wire main_crc32_inserter_sink_first;
wire main_crc32_inserter_sink_last;
wire [7:0] main_crc32_inserter_sink_payload_data;
wire main_crc32_inserter_sink_payload_last_be;
wire main_crc32_inserter_sink_payload_error;
reg main_crc32_inserter_source_valid = 1'd0;
wire main_crc32_inserter_source_ready;
reg main_crc32_inserter_source_first = 1'd0;
reg main_crc32_inserter_source_last = 1'd0;
reg [7:0] main_crc32_inserter_source_payload_data = 8'd0;
reg main_crc32_inserter_source_payload_last_be = 1'd0;
reg main_crc32_inserter_source_payload_error = 1'd0;
reg [7:0] main_crc32_inserter_data0 = 8'd0;
wire [31:0] main_crc32_inserter_value;
wire main_crc32_inserter_error;
wire [7:0] main_crc32_inserter_data1;
wire [31:0] main_crc32_inserter_last;
reg [31:0] main_crc32_inserter_next = 32'd0;
reg [31:0] main_crc32_inserter_reg = 32'd4294967295;
reg main_crc32_inserter_ce = 1'd0;
reg main_crc32_inserter_reset = 1'd0;
reg [1:0] main_crc32_inserter_cnt = 2'd3;
wire main_crc32_inserter_cnt_done;
reg main_crc32_inserter_is_ongoing0 = 1'd0;
reg main_crc32_inserter_is_ongoing1 = 1'd0;
wire main_crc32_checker_sink_sink_valid;
reg main_crc32_checker_sink_sink_ready = 1'd0;
wire main_crc32_checker_sink_sink_first;
wire main_crc32_checker_sink_sink_last;
wire [7:0] main_crc32_checker_sink_sink_payload_data;
wire main_crc32_checker_sink_sink_payload_last_be;
wire main_crc32_checker_sink_sink_payload_error;
wire main_crc32_checker_source_source_valid;
wire main_crc32_checker_source_source_ready;
reg main_crc32_checker_source_source_first = 1'd0;
wire main_crc32_checker_source_source_last;
wire [7:0] main_crc32_checker_source_source_payload_data;
wire main_crc32_checker_source_source_payload_last_be;
reg main_crc32_checker_source_source_payload_error = 1'd0;
wire main_crc32_checker_error;
wire [7:0] main_crc32_checker_crc_data0;
wire [31:0] main_crc32_checker_crc_value;
wire main_crc32_checker_crc_error;
wire [7:0] main_crc32_checker_crc_data1;
wire [31:0] main_crc32_checker_crc_last;
reg [31:0] main_crc32_checker_crc_next = 32'd0;
reg [31:0] main_crc32_checker_crc_reg = 32'd4294967295;
reg main_crc32_checker_crc_ce = 1'd0;
reg main_crc32_checker_crc_reset = 1'd0;
reg main_crc32_checker_syncfifo_sink_valid = 1'd0;
wire main_crc32_checker_syncfifo_sink_ready;
wire main_crc32_checker_syncfifo_sink_first;
wire main_crc32_checker_syncfifo_sink_last;
wire [7:0] main_crc32_checker_syncfifo_sink_payload_data;
wire main_crc32_checker_syncfifo_sink_payload_last_be;
wire main_crc32_checker_syncfifo_sink_payload_error;
wire main_crc32_checker_syncfifo_source_valid;
wire main_crc32_checker_syncfifo_source_ready;
wire main_crc32_checker_syncfifo_source_first;
wire main_crc32_checker_syncfifo_source_last;
wire [7:0] main_crc32_checker_syncfifo_source_payload_data;
wire main_crc32_checker_syncfifo_source_payload_last_be;
wire main_crc32_checker_syncfifo_source_payload_error;
wire main_crc32_checker_syncfifo_syncfifo_we;
wire main_crc32_checker_syncfifo_syncfifo_writable;
wire main_crc32_checker_syncfifo_syncfifo_re;
wire main_crc32_checker_syncfifo_syncfifo_readable;
wire [11:0] main_crc32_checker_syncfifo_syncfifo_din;
wire [11:0] main_crc32_checker_syncfifo_syncfifo_dout;
reg [2:0] main_crc32_checker_syncfifo_level = 3'd0;
reg main_crc32_checker_syncfifo_replace = 1'd0;
reg [2:0] main_crc32_checker_syncfifo_produce = 3'd0;
reg [2:0] main_crc32_checker_syncfifo_consume = 3'd0;
reg [2:0] main_crc32_checker_syncfifo_wrport_adr = 3'd0;
wire [11:0] main_crc32_checker_syncfifo_wrport_dat_r;
wire main_crc32_checker_syncfifo_wrport_we;
wire [11:0] main_crc32_checker_syncfifo_wrport_dat_w;
wire main_crc32_checker_syncfifo_do_read;
wire [2:0] main_crc32_checker_syncfifo_rdport_adr;
wire [11:0] main_crc32_checker_syncfifo_rdport_dat_r;
wire [7:0] main_crc32_checker_syncfifo_fifo_in_payload_data;
wire main_crc32_checker_syncfifo_fifo_in_payload_last_be;
wire main_crc32_checker_syncfifo_fifo_in_payload_error;
wire main_crc32_checker_syncfifo_fifo_in_first;
wire main_crc32_checker_syncfifo_fifo_in_last;
wire [7:0] main_crc32_checker_syncfifo_fifo_out_payload_data;
wire main_crc32_checker_syncfifo_fifo_out_payload_last_be;
wire main_crc32_checker_syncfifo_fifo_out_payload_error;
wire main_crc32_checker_syncfifo_fifo_out_first;
wire main_crc32_checker_syncfifo_fifo_out_last;
reg main_crc32_checker_fifo_reset = 1'd0;
wire main_crc32_checker_fifo_in;
wire main_crc32_checker_fifo_out;
wire main_crc32_checker_fifo_full;
wire main_ps_preamble_error_i;
wire main_ps_preamble_error_o;
reg main_ps_preamble_error_toggle_i = 1'd0;
wire main_ps_preamble_error_toggle_o;
reg main_ps_preamble_error_toggle_o_r = 1'd0;
wire main_ps_crc_error_i;
wire main_ps_crc_error_o;
reg main_ps_crc_error_toggle_i = 1'd0;
wire main_ps_crc_error_toggle_o;
reg main_ps_crc_error_toggle_o_r = 1'd0;
wire main_padding_inserter_sink_valid;
reg main_padding_inserter_sink_ready = 1'd0;
wire main_padding_inserter_sink_first;
wire main_padding_inserter_sink_last;
wire [7:0] main_padding_inserter_sink_payload_data;
wire main_padding_inserter_sink_payload_last_be;
wire main_padding_inserter_sink_payload_error;
reg main_padding_inserter_source_valid = 1'd0;
wire main_padding_inserter_source_ready;
reg main_padding_inserter_source_first = 1'd0;
reg main_padding_inserter_source_last = 1'd0;
reg [7:0] main_padding_inserter_source_payload_data = 8'd0;
reg main_padding_inserter_source_payload_last_be = 1'd0;
reg main_padding_inserter_source_payload_error = 1'd0;
reg [15:0] main_padding_inserter_counter = 16'd1;
wire main_padding_inserter_counter_done;
reg main_padding_inserter_counter_reset = 1'd0;
reg main_padding_inserter_counter_ce = 1'd0;
wire main_padding_checker_sink_valid;
wire main_padding_checker_sink_ready;
wire main_padding_checker_sink_first;
wire main_padding_checker_sink_last;
wire [7:0] main_padding_checker_sink_payload_data;
wire main_padding_checker_sink_payload_last_be;
wire main_padding_checker_sink_payload_error;
wire main_padding_checker_source_valid;
wire main_padding_checker_source_ready;
wire main_padding_checker_source_first;
wire main_padding_checker_source_last;
wire [7:0] main_padding_checker_source_payload_data;
wire main_padding_checker_source_payload_last_be;
wire main_padding_checker_source_payload_error;
wire main_tx_last_be_sink_valid;
wire main_tx_last_be_sink_ready;
wire main_tx_last_be_sink_first;
wire main_tx_last_be_sink_last;
wire [7:0] main_tx_last_be_sink_payload_data;
wire main_tx_last_be_sink_payload_last_be;
wire main_tx_last_be_sink_payload_error;
wire main_tx_last_be_source_valid;
wire main_tx_last_be_source_ready;
reg main_tx_last_be_source_first = 1'd0;
wire main_tx_last_be_source_last;
wire [7:0] main_tx_last_be_source_payload_data;
reg main_tx_last_be_source_payload_last_be = 1'd0;
reg main_tx_last_be_source_payload_error = 1'd0;
reg main_tx_last_be_ongoing = 1'd1;
wire main_rx_last_be_sink_valid;
wire main_rx_last_be_sink_ready;
wire main_rx_last_be_sink_first;
wire main_rx_last_be_sink_last;
wire [7:0] main_rx_last_be_sink_payload_data;
wire main_rx_last_be_sink_payload_last_be;
wire main_rx_last_be_sink_payload_error;
wire main_rx_last_be_source_valid;
wire main_rx_last_be_source_ready;
wire main_rx_last_be_source_first;
wire main_rx_last_be_source_last;
wire [7:0] main_rx_last_be_source_payload_data;
reg main_rx_last_be_source_payload_last_be = 1'd0;
wire main_rx_last_be_source_payload_error;
wire main_tx_converter_sink_valid;
wire main_tx_converter_sink_ready;
wire main_tx_converter_sink_first;
wire main_tx_converter_sink_last;
wire [31:0] main_tx_converter_sink_payload_data;
wire [3:0] main_tx_converter_sink_payload_last_be;
wire [3:0] main_tx_converter_sink_payload_error;
wire main_tx_converter_source_valid;
wire main_tx_converter_source_ready;
wire main_tx_converter_source_first;
wire main_tx_converter_source_last;
wire [7:0] main_tx_converter_source_payload_data;
wire main_tx_converter_source_payload_last_be;
wire main_tx_converter_source_payload_error;
wire main_tx_converter_converter_sink_valid;
wire main_tx_converter_converter_sink_ready;
wire main_tx_converter_converter_sink_first;
wire main_tx_converter_converter_sink_last;
reg [39:0] main_tx_converter_converter_sink_payload_data = 40'd0;
wire main_tx_converter_converter_source_valid;
wire main_tx_converter_converter_source_ready;
wire main_tx_converter_converter_source_first;
wire main_tx_converter_converter_source_last;
reg [9:0] main_tx_converter_converter_source_payload_data = 10'd0;
wire main_tx_converter_converter_source_payload_valid_token_count;
reg [1:0] main_tx_converter_converter_mux = 2'd0;
wire main_tx_converter_converter_first;
wire main_tx_converter_converter_last;
wire main_tx_converter_source_source_valid;
wire main_tx_converter_source_source_ready;
wire main_tx_converter_source_source_first;
wire main_tx_converter_source_source_last;
wire [9:0] main_tx_converter_source_source_payload_data;
wire main_rx_converter_sink_valid;
wire main_rx_converter_sink_ready;
wire main_rx_converter_sink_first;
wire main_rx_converter_sink_last;
wire [7:0] main_rx_converter_sink_payload_data;
wire main_rx_converter_sink_payload_last_be;
wire main_rx_converter_sink_payload_error;
wire main_rx_converter_source_valid;
wire main_rx_converter_source_ready;
wire main_rx_converter_source_first;
wire main_rx_converter_source_last;
reg [31:0] main_rx_converter_source_payload_data = 32'd0;
reg [3:0] main_rx_converter_source_payload_last_be = 4'd0;
reg [3:0] main_rx_converter_source_payload_error = 4'd0;
wire main_rx_converter_converter_sink_valid;
wire main_rx_converter_converter_sink_ready;
wire main_rx_converter_converter_sink_first;
wire main_rx_converter_converter_sink_last;
wire [9:0] main_rx_converter_converter_sink_payload_data;
wire main_rx_converter_converter_source_valid;
wire main_rx_converter_converter_source_ready;
reg main_rx_converter_converter_source_first = 1'd0;
reg main_rx_converter_converter_source_last = 1'd0;
reg [39:0] main_rx_converter_converter_source_payload_data = 40'd0;
reg [2:0] main_rx_converter_converter_source_payload_valid_token_count = 3'd0;
reg [1:0] main_rx_converter_converter_demux = 2'd0;
wire main_rx_converter_converter_load_part;
reg main_rx_converter_converter_strobe_all = 1'd0;
wire main_rx_converter_source_source_valid;
wire main_rx_converter_source_source_ready;
wire main_rx_converter_source_source_first;
wire main_rx_converter_source_source_last;
wire [39:0] main_rx_converter_source_source_payload_data;
wire main_tx_cdc_sink_valid;
wire main_tx_cdc_sink_ready;
wire main_tx_cdc_sink_first;
wire main_tx_cdc_sink_last;
wire [31:0] main_tx_cdc_sink_payload_data;
wire [3:0] main_tx_cdc_sink_payload_last_be;
wire [3:0] main_tx_cdc_sink_payload_error;
wire main_tx_cdc_source_valid;
wire main_tx_cdc_source_ready;
wire main_tx_cdc_source_first;
wire main_tx_cdc_source_last;
wire [31:0] main_tx_cdc_source_payload_data;
wire [3:0] main_tx_cdc_source_payload_last_be;
wire [3:0] main_tx_cdc_source_payload_error;
wire main_tx_cdc_asyncfifo_we;
wire main_tx_cdc_asyncfifo_writable;
wire main_tx_cdc_asyncfifo_re;
wire main_tx_cdc_asyncfifo_readable;
wire [41:0] main_tx_cdc_asyncfifo_din;
wire [41:0] main_tx_cdc_asyncfifo_dout;
wire main_tx_cdc_graycounter0_ce;
(* dont_touch = "true" *) reg [6:0] main_tx_cdc_graycounter0_q = 7'd0;
wire [6:0] main_tx_cdc_graycounter0_q_next;
reg [6:0] main_tx_cdc_graycounter0_q_binary = 7'd0;
reg [6:0] main_tx_cdc_graycounter0_q_next_binary = 7'd0;
wire main_tx_cdc_graycounter1_ce;
(* dont_touch = "true" *) reg [6:0] main_tx_cdc_graycounter1_q = 7'd0;
wire [6:0] main_tx_cdc_graycounter1_q_next;
reg [6:0] main_tx_cdc_graycounter1_q_binary = 7'd0;
reg [6:0] main_tx_cdc_graycounter1_q_next_binary = 7'd0;
wire [6:0] main_tx_cdc_produce_rdomain;
wire [6:0] main_tx_cdc_consume_wdomain;
wire [5:0] main_tx_cdc_wrport_adr;
wire [41:0] main_tx_cdc_wrport_dat_r;
wire main_tx_cdc_wrport_we;
wire [41:0] main_tx_cdc_wrport_dat_w;
wire [5:0] main_tx_cdc_rdport_adr;
wire [41:0] main_tx_cdc_rdport_dat_r;
wire [31:0] main_tx_cdc_fifo_in_payload_data;
wire [3:0] main_tx_cdc_fifo_in_payload_last_be;
wire [3:0] main_tx_cdc_fifo_in_payload_error;
wire main_tx_cdc_fifo_in_first;
wire main_tx_cdc_fifo_in_last;
wire [31:0] main_tx_cdc_fifo_out_payload_data;
wire [3:0] main_tx_cdc_fifo_out_payload_last_be;
wire [3:0] main_tx_cdc_fifo_out_payload_error;
wire main_tx_cdc_fifo_out_first;
wire main_tx_cdc_fifo_out_last;
wire main_rx_cdc_sink_valid;
wire main_rx_cdc_sink_ready;
wire main_rx_cdc_sink_first;
wire main_rx_cdc_sink_last;
wire [31:0] main_rx_cdc_sink_payload_data;
wire [3:0] main_rx_cdc_sink_payload_last_be;
wire [3:0] main_rx_cdc_sink_payload_error;
wire main_rx_cdc_source_valid;
wire main_rx_cdc_source_ready;
wire main_rx_cdc_source_first;
wire main_rx_cdc_source_last;
wire [31:0] main_rx_cdc_source_payload_data;
wire [3:0] main_rx_cdc_source_payload_last_be;
wire [3:0] main_rx_cdc_source_payload_error;
wire main_rx_cdc_asyncfifo_we;
wire main_rx_cdc_asyncfifo_writable;
wire main_rx_cdc_asyncfifo_re;
wire main_rx_cdc_asyncfifo_readable;
wire [41:0] main_rx_cdc_asyncfifo_din;
wire [41:0] main_rx_cdc_asyncfifo_dout;
wire main_rx_cdc_graycounter0_ce;
(* dont_touch = "true" *) reg [6:0] main_rx_cdc_graycounter0_q = 7'd0;
wire [6:0] main_rx_cdc_graycounter0_q_next;
reg [6:0] main_rx_cdc_graycounter0_q_binary = 7'd0;
reg [6:0] main_rx_cdc_graycounter0_q_next_binary = 7'd0;
wire main_rx_cdc_graycounter1_ce;
(* dont_touch = "true" *) reg [6:0] main_rx_cdc_graycounter1_q = 7'd0;
wire [6:0] main_rx_cdc_graycounter1_q_next;
reg [6:0] main_rx_cdc_graycounter1_q_binary = 7'd0;
reg [6:0] main_rx_cdc_graycounter1_q_next_binary = 7'd0;
wire [6:0] main_rx_cdc_produce_rdomain;
wire [6:0] main_rx_cdc_consume_wdomain;
wire [5:0] main_rx_cdc_wrport_adr;
wire [41:0] main_rx_cdc_wrport_dat_r;
wire main_rx_cdc_wrport_we;
wire [41:0] main_rx_cdc_wrport_dat_w;
wire [5:0] main_rx_cdc_rdport_adr;
wire [41:0] main_rx_cdc_rdport_dat_r;
wire [31:0] main_rx_cdc_fifo_in_payload_data;
wire [3:0] main_rx_cdc_fifo_in_payload_last_be;
wire [3:0] main_rx_cdc_fifo_in_payload_error;
wire main_rx_cdc_fifo_in_first;
wire main_rx_cdc_fifo_in_last;
wire [31:0] main_rx_cdc_fifo_out_payload_data;
wire [3:0] main_rx_cdc_fifo_out_payload_last_be;
wire [3:0] main_rx_cdc_fifo_out_payload_error;
wire main_rx_cdc_fifo_out_first;
wire main_rx_cdc_fifo_out_last;
wire main_sink_valid;
wire main_sink_ready;
wire main_sink_first;
wire main_sink_last;
wire [31:0] main_sink_payload_data;
wire [3:0] main_sink_payload_last_be;
wire [3:0] main_sink_payload_error;
wire main_source_valid;
wire main_source_ready;
wire main_source_first;
wire main_source_last;
wire [31:0] main_source_payload_data;
wire [3:0] main_source_payload_last_be;
wire [3:0] main_source_payload_error;
wire [29:0] main_bus_adr;
wire [31:0] main_bus_dat_w;
wire [31:0] main_bus_dat_r;
wire [3:0] main_bus_sel;
wire main_bus_cyc;
wire main_bus_stb;
wire main_bus_ack;
wire main_bus_we;
wire [2:0] main_bus_cti;
wire [1:0] main_bus_bte;
wire main_bus_err;
wire main_writer_sink_sink_valid;
reg main_writer_sink_sink_ready = 1'd1;
wire main_writer_sink_sink_first;
wire main_writer_sink_sink_last;
wire [31:0] main_writer_sink_sink_payload_data;
wire [3:0] main_writer_sink_sink_payload_last_be;
wire [3:0] main_writer_sink_sink_payload_error;
wire main_writer_slot_status;
wire [31:0] main_writer_length_status;
reg [31:0] main_writer_errors_status = 32'd0;
wire main_writer_irq;
wire main_writer_available_status;
wire main_writer_available_pending;
wire main_writer_available_trigger;
reg main_writer_available_clear = 1'd0;
wire main_writer_status_re;
wire main_writer_status_r;
wire main_writer_status_w;
wire main_writer_pending_re;
wire main_writer_pending_r;
wire main_writer_pending_w;
reg main_writer_storage_full = 1'd0;
wire main_writer_storage;
reg main_writer_re = 1'd0;
reg [2:0] main_writer_inc = 3'd0;
reg [31:0] main_writer_counter = 32'd0;
reg main_writer_counter_reset = 1'd0;
reg main_writer_counter_ce = 1'd0;
reg main_writer_slot = 1'd0;
reg main_writer_slot_ce = 1'd0;
reg main_writer_ongoing = 1'd0;
reg main_writer_fifo_sink_valid = 1'd0;
wire main_writer_fifo_sink_ready;
reg main_writer_fifo_sink_first = 1'd0;
reg main_writer_fifo_sink_last = 1'd0;
wire main_writer_fifo_sink_payload_slot;
wire [31:0] main_writer_fifo_sink_payload_length;
wire main_writer_fifo_source_valid;
wire main_writer_fifo_source_ready;
wire main_writer_fifo_source_first;
wire main_writer_fifo_source_last;
wire main_writer_fifo_source_payload_slot;
wire [31:0] main_writer_fifo_source_payload_length;
wire main_writer_fifo_syncfifo_we;
wire main_writer_fifo_syncfifo_writable;
wire main_writer_fifo_syncfifo_re;
wire main_writer_fifo_syncfifo_readable;
wire [34:0] main_writer_fifo_syncfifo_din;
wire [34:0] main_writer_fifo_syncfifo_dout;
reg [1:0] main_writer_fifo_level = 2'd0;
reg main_writer_fifo_replace = 1'd0;
reg main_writer_fifo_produce = 1'd0;
reg main_writer_fifo_consume = 1'd0;
reg main_writer_fifo_wrport_adr = 1'd0;
wire [34:0] main_writer_fifo_wrport_dat_r;
wire main_writer_fifo_wrport_we;
wire [34:0] main_writer_fifo_wrport_dat_w;
wire main_writer_fifo_do_read;
wire main_writer_fifo_rdport_adr;
wire [34:0] main_writer_fifo_rdport_dat_r;
wire main_writer_fifo_fifo_in_payload_slot;
wire [31:0] main_writer_fifo_fifo_in_payload_length;
wire main_writer_fifo_fifo_in_first;
wire main_writer_fifo_fifo_in_last;
wire main_writer_fifo_fifo_out_payload_slot;
wire [31:0] main_writer_fifo_fifo_out_payload_length;
wire main_writer_fifo_fifo_out_first;
wire main_writer_fifo_fifo_out_last;
reg [8:0] main_writer_memory0_adr = 9'd0;
wire [31:0] main_writer_memory0_dat_r;
reg main_writer_memory0_we = 1'd0;
reg [31:0] main_writer_memory0_dat_w = 32'd0;
reg [8:0] main_writer_memory1_adr = 9'd0;
wire [31:0] main_writer_memory1_dat_r;
reg main_writer_memory1_we = 1'd0;
reg [31:0] main_writer_memory1_dat_w = 32'd0;
reg main_reader_source_source_valid = 1'd0;
wire main_reader_source_source_ready;
reg main_reader_source_source_first = 1'd0;
reg main_reader_source_source_last = 1'd0;
reg [31:0] main_reader_source_source_payload_data = 32'd0;
reg [3:0] main_reader_source_source_payload_last_be = 4'd0;
reg [3:0] main_reader_source_source_payload_error = 4'd0;
wire main_reader_start_re;
wire main_reader_start_r;
reg main_reader_start_w = 1'd0;
wire main_reader_ready_status;
wire [1:0] main_reader_level_status;
reg main_reader_slot_storage_full = 1'd0;
wire main_reader_slot_storage;
reg main_reader_slot_re = 1'd0;
reg [10:0] main_reader_length_storage_full = 11'd0;
wire [10:0] main_reader_length_storage;
reg main_reader_length_re = 1'd0;
wire main_reader_irq;
wire main_reader_done_status;
reg main_reader_done_pending = 1'd0;
reg main_reader_done_trigger = 1'd0;
reg main_reader_done_clear = 1'd0;
wire main_reader_eventmanager_status_re;
wire main_reader_eventmanager_status_r;
wire main_reader_eventmanager_status_w;
wire main_reader_eventmanager_pending_re;
wire main_reader_eventmanager_pending_r;
wire main_reader_eventmanager_pending_w;
reg main_reader_eventmanager_storage_full = 1'd0;
wire main_reader_eventmanager_storage;
reg main_reader_eventmanager_re = 1'd0;
wire main_reader_fifo_sink_valid;
wire main_reader_fifo_sink_ready;
reg main_reader_fifo_sink_first = 1'd0;
reg main_reader_fifo_sink_last = 1'd0;
wire main_reader_fifo_sink_payload_slot;
wire [10:0] main_reader_fifo_sink_payload_length;
wire main_reader_fifo_source_valid;
reg main_reader_fifo_source_ready = 1'd0;
wire main_reader_fifo_source_first;
wire main_reader_fifo_source_last;
wire main_reader_fifo_source_payload_slot;
wire [10:0] main_reader_fifo_source_payload_length;
wire main_reader_fifo_syncfifo_we;
wire main_reader_fifo_syncfifo_writable;
wire main_reader_fifo_syncfifo_re;
wire main_reader_fifo_syncfifo_readable;
wire [13:0] main_reader_fifo_syncfifo_din;
wire [13:0] main_reader_fifo_syncfifo_dout;
reg [1:0] main_reader_fifo_level = 2'd0;
reg main_reader_fifo_replace = 1'd0;
reg main_reader_fifo_produce = 1'd0;
reg main_reader_fifo_consume = 1'd0;
reg main_reader_fifo_wrport_adr = 1'd0;
wire [13:0] main_reader_fifo_wrport_dat_r;
wire main_reader_fifo_wrport_we;
wire [13:0] main_reader_fifo_wrport_dat_w;
wire main_reader_fifo_do_read;
wire main_reader_fifo_rdport_adr;
wire [13:0] main_reader_fifo_rdport_dat_r;
wire main_reader_fifo_fifo_in_payload_slot;
wire [10:0] main_reader_fifo_fifo_in_payload_length;
wire main_reader_fifo_fifo_in_first;
wire main_reader_fifo_fifo_in_last;
wire main_reader_fifo_fifo_out_payload_slot;
wire [10:0] main_reader_fifo_fifo_out_payload_length;
wire main_reader_fifo_fifo_out_first;
wire main_reader_fifo_fifo_out_last;
reg [10:0] main_reader_counter = 11'd0;
reg main_reader_counter_reset = 1'd0;
reg main_reader_counter_ce = 1'd0;
wire main_reader_last;
reg main_reader_last_d = 1'd0;
wire [8:0] main_reader_memory0_adr;
wire [31:0] main_reader_memory0_dat_r;
wire [8:0] main_reader_memory1_adr;
wire [31:0] main_reader_memory1_dat_r;
wire main_ev_irq;
wire [29:0] main_sram0_bus_adr0;
wire [31:0] main_sram0_bus_dat_w0;
wire [31:0] main_sram0_bus_dat_r0;
wire [3:0] main_sram0_bus_sel0;
wire main_sram0_bus_cyc0;
wire main_sram0_bus_stb0;
reg main_sram0_bus_ack0 = 1'd0;
wire main_sram0_bus_we0;
wire [2:0] main_sram0_bus_cti0;
wire [1:0] main_sram0_bus_bte0;
reg main_sram0_bus_err0 = 1'd0;
wire [8:0] main_sram0_adr0;
wire [31:0] main_sram0_dat_r0;
wire [29:0] main_sram1_bus_adr0;
wire [31:0] main_sram1_bus_dat_w0;
wire [31:0] main_sram1_bus_dat_r0;
wire [3:0] main_sram1_bus_sel0;
wire main_sram1_bus_cyc0;
wire main_sram1_bus_stb0;
reg main_sram1_bus_ack0 = 1'd0;
wire main_sram1_bus_we0;
wire [2:0] main_sram1_bus_cti0;
wire [1:0] main_sram1_bus_bte0;
reg main_sram1_bus_err0 = 1'd0;
wire [8:0] main_sram1_adr0;
wire [31:0] main_sram1_dat_r0;
wire [29:0] main_sram0_bus_adr1;
wire [31:0] main_sram0_bus_dat_w1;
wire [31:0] main_sram0_bus_dat_r1;
wire [3:0] main_sram0_bus_sel1;
wire main_sram0_bus_cyc1;
wire main_sram0_bus_stb1;
reg main_sram0_bus_ack1 = 1'd0;
wire main_sram0_bus_we1;
wire [2:0] main_sram0_bus_cti1;
wire [1:0] main_sram0_bus_bte1;
reg main_sram0_bus_err1 = 1'd0;
wire [8:0] main_sram0_adr1;
wire [31:0] main_sram0_dat_r1;
reg [3:0] main_sram0_we = 4'd0;
wire [31:0] main_sram0_dat_w;
wire [29:0] main_sram1_bus_adr1;
wire [31:0] main_sram1_bus_dat_w1;
wire [31:0] main_sram1_bus_dat_r1;
wire [3:0] main_sram1_bus_sel1;
wire main_sram1_bus_cyc1;
wire main_sram1_bus_stb1;
reg main_sram1_bus_ack1 = 1'd0;
wire main_sram1_bus_we1;
wire [2:0] main_sram1_bus_cti1;
wire [1:0] main_sram1_bus_bte1;
reg main_sram1_bus_err1 = 1'd0;
wire [8:0] main_sram1_adr1;
wire [31:0] main_sram1_dat_r1;
reg [3:0] main_sram1_we = 4'd0;
wire [31:0] main_sram1_dat_w;
reg [3:0] main_slave_sel = 4'd0;
reg [3:0] main_slave_sel_r = 4'd0;
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
wire builder_roundrobin0_request;
wire builder_roundrobin0_grant;
wire builder_roundrobin0_ce;
wire builder_roundrobin1_request;
wire builder_roundrobin1_grant;
wire builder_roundrobin1_ce;
wire builder_roundrobin2_request;
wire builder_roundrobin2_grant;
wire builder_roundrobin2_ce;
wire builder_roundrobin3_request;
wire builder_roundrobin3_grant;
wire builder_roundrobin3_ce;
wire builder_roundrobin4_request;
wire builder_roundrobin4_grant;
wire builder_roundrobin4_ce;
wire builder_roundrobin5_request;
wire builder_roundrobin5_grant;
wire builder_roundrobin5_ce;
wire builder_roundrobin6_request;
wire builder_roundrobin6_grant;
wire builder_roundrobin6_ce;
wire builder_roundrobin7_request;
wire builder_roundrobin7_grant;
wire builder_roundrobin7_ce;
reg [2:0] builder_rbank = 3'd0;
reg [2:0] builder_wbank = 3'd0;
reg builder_locked0 = 1'd0;
reg builder_locked1 = 1'd0;
reg builder_locked2 = 1'd0;
reg builder_locked3 = 1'd0;
reg builder_locked4 = 1'd0;
reg builder_locked5 = 1'd0;
reg builder_locked6 = 1'd0;
reg builder_locked7 = 1'd0;
reg builder_new_master_wdata_ready0 = 1'd0;
reg builder_new_master_wdata_ready1 = 1'd0;
reg builder_new_master_wdata_ready2 = 1'd0;
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
reg [2:0] builder_fullmemorywe_state = 3'd0;
reg [2:0] builder_fullmemorywe_next_state = 3'd0;
reg [1:0] builder_litedramwishbone2native_state = 2'd0;
reg [1:0] builder_litedramwishbone2native_next_state = 2'd0;
reg builder_liteethmacgap_state = 1'd0;
reg builder_liteethmacgap_next_state = 1'd0;
reg [1:0] builder_liteethmacpreambleinserter_state = 2'd0;
reg [1:0] builder_liteethmacpreambleinserter_next_state = 2'd0;
reg builder_liteethmacpreamblechecker_state = 1'd0;
reg builder_liteethmacpreamblechecker_next_state = 1'd0;
reg [1:0] builder_liteethmaccrc32inserter_state = 2'd0;
reg [1:0] builder_liteethmaccrc32inserter_next_state = 2'd0;
reg [1:0] builder_liteethmaccrc32checker_state = 2'd0;
reg [1:0] builder_liteethmaccrc32checker_next_state = 2'd0;
reg builder_liteethmacpaddinginserter_state = 1'd0;
reg builder_liteethmacpaddinginserter_next_state = 1'd0;
reg [2:0] builder_liteethmacsramwriter_state = 3'd0;
reg [2:0] builder_liteethmacsramwriter_next_state = 3'd0;
reg [31:0] main_writer_errors_status_next_value = 32'd0;
reg main_writer_errors_status_next_value_ce = 1'd0;
reg [1:0] builder_liteethmacsramreader_state = 2'd0;
reg [1:0] builder_liteethmacsramreader_next_state = 2'd0;
wire builder_wb_sdram_con_request;
wire builder_wb_sdram_con_grant;
wire [29:0] builder_ethernetsoc_shared_adr;
wire [31:0] builder_ethernetsoc_shared_dat_w;
reg [31:0] builder_ethernetsoc_shared_dat_r = 32'd0;
wire [3:0] builder_ethernetsoc_shared_sel;
wire builder_ethernetsoc_shared_cyc;
wire builder_ethernetsoc_shared_stb;
reg builder_ethernetsoc_shared_ack = 1'd0;
wire builder_ethernetsoc_shared_we;
wire [2:0] builder_ethernetsoc_shared_cti;
wire [1:0] builder_ethernetsoc_shared_bte;
wire builder_ethernetsoc_shared_err;
wire [1:0] builder_ethernetsoc_request;
reg builder_ethernetsoc_grant = 1'd0;
reg [4:0] builder_ethernetsoc_slave_sel = 5'd0;
reg [4:0] builder_ethernetsoc_slave_sel_r = 5'd0;
reg builder_ethernetsoc_error = 1'd0;
wire builder_ethernetsoc_wait;
wire builder_ethernetsoc_done;
reg [19:0] builder_ethernetsoc_count = 20'd1000000;
wire [13:0] builder_ethernetsoc_interface0_bank_bus_adr;
wire builder_ethernetsoc_interface0_bank_bus_we;
wire [7:0] builder_ethernetsoc_interface0_bank_bus_dat_w;
reg [7:0] builder_ethernetsoc_interface0_bank_bus_dat_r = 8'd0;
wire builder_ethernetsoc_csrbank0_timer_time7_re;
wire [7:0] builder_ethernetsoc_csrbank0_timer_time7_r;
wire [7:0] builder_ethernetsoc_csrbank0_timer_time7_w;
wire builder_ethernetsoc_csrbank0_timer_time6_re;
wire [7:0] builder_ethernetsoc_csrbank0_timer_time6_r;
wire [7:0] builder_ethernetsoc_csrbank0_timer_time6_w;
wire builder_ethernetsoc_csrbank0_timer_time5_re;
wire [7:0] builder_ethernetsoc_csrbank0_timer_time5_r;
wire [7:0] builder_ethernetsoc_csrbank0_timer_time5_w;
wire builder_ethernetsoc_csrbank0_timer_time4_re;
wire [7:0] builder_ethernetsoc_csrbank0_timer_time4_r;
wire [7:0] builder_ethernetsoc_csrbank0_timer_time4_w;
wire builder_ethernetsoc_csrbank0_timer_time3_re;
wire [7:0] builder_ethernetsoc_csrbank0_timer_time3_r;
wire [7:0] builder_ethernetsoc_csrbank0_timer_time3_w;
wire builder_ethernetsoc_csrbank0_timer_time2_re;
wire [7:0] builder_ethernetsoc_csrbank0_timer_time2_r;
wire [7:0] builder_ethernetsoc_csrbank0_timer_time2_w;
wire builder_ethernetsoc_csrbank0_timer_time1_re;
wire [7:0] builder_ethernetsoc_csrbank0_timer_time1_r;
wire [7:0] builder_ethernetsoc_csrbank0_timer_time1_w;
wire builder_ethernetsoc_csrbank0_timer_time0_re;
wire [7:0] builder_ethernetsoc_csrbank0_timer_time0_r;
wire [7:0] builder_ethernetsoc_csrbank0_timer_time0_w;
wire builder_ethernetsoc_csrbank0_timer_time_cmp7_re;
wire [7:0] builder_ethernetsoc_csrbank0_timer_time_cmp7_r;
wire [7:0] builder_ethernetsoc_csrbank0_timer_time_cmp7_w;
wire builder_ethernetsoc_csrbank0_timer_time_cmp6_re;
wire [7:0] builder_ethernetsoc_csrbank0_timer_time_cmp6_r;
wire [7:0] builder_ethernetsoc_csrbank0_timer_time_cmp6_w;
wire builder_ethernetsoc_csrbank0_timer_time_cmp5_re;
wire [7:0] builder_ethernetsoc_csrbank0_timer_time_cmp5_r;
wire [7:0] builder_ethernetsoc_csrbank0_timer_time_cmp5_w;
wire builder_ethernetsoc_csrbank0_timer_time_cmp4_re;
wire [7:0] builder_ethernetsoc_csrbank0_timer_time_cmp4_r;
wire [7:0] builder_ethernetsoc_csrbank0_timer_time_cmp4_w;
wire builder_ethernetsoc_csrbank0_timer_time_cmp3_re;
wire [7:0] builder_ethernetsoc_csrbank0_timer_time_cmp3_r;
wire [7:0] builder_ethernetsoc_csrbank0_timer_time_cmp3_w;
wire builder_ethernetsoc_csrbank0_timer_time_cmp2_re;
wire [7:0] builder_ethernetsoc_csrbank0_timer_time_cmp2_r;
wire [7:0] builder_ethernetsoc_csrbank0_timer_time_cmp2_w;
wire builder_ethernetsoc_csrbank0_timer_time_cmp1_re;
wire [7:0] builder_ethernetsoc_csrbank0_timer_time_cmp1_r;
wire [7:0] builder_ethernetsoc_csrbank0_timer_time_cmp1_w;
wire builder_ethernetsoc_csrbank0_timer_time_cmp0_re;
wire [7:0] builder_ethernetsoc_csrbank0_timer_time_cmp0_r;
wire [7:0] builder_ethernetsoc_csrbank0_timer_time_cmp0_w;
wire builder_ethernetsoc_csrbank0_sel;
wire [13:0] builder_ethernetsoc_interface1_bank_bus_adr;
wire builder_ethernetsoc_interface1_bank_bus_we;
wire [7:0] builder_ethernetsoc_interface1_bank_bus_dat_w;
reg [7:0] builder_ethernetsoc_interface1_bank_bus_dat_r = 8'd0;
wire builder_ethernetsoc_csrbank1_scratch3_re;
wire [7:0] builder_ethernetsoc_csrbank1_scratch3_r;
wire [7:0] builder_ethernetsoc_csrbank1_scratch3_w;
wire builder_ethernetsoc_csrbank1_scratch2_re;
wire [7:0] builder_ethernetsoc_csrbank1_scratch2_r;
wire [7:0] builder_ethernetsoc_csrbank1_scratch2_w;
wire builder_ethernetsoc_csrbank1_scratch1_re;
wire [7:0] builder_ethernetsoc_csrbank1_scratch1_r;
wire [7:0] builder_ethernetsoc_csrbank1_scratch1_w;
wire builder_ethernetsoc_csrbank1_scratch0_re;
wire [7:0] builder_ethernetsoc_csrbank1_scratch0_r;
wire [7:0] builder_ethernetsoc_csrbank1_scratch0_w;
wire builder_ethernetsoc_csrbank1_bus_errors3_re;
wire [7:0] builder_ethernetsoc_csrbank1_bus_errors3_r;
wire [7:0] builder_ethernetsoc_csrbank1_bus_errors3_w;
wire builder_ethernetsoc_csrbank1_bus_errors2_re;
wire [7:0] builder_ethernetsoc_csrbank1_bus_errors2_r;
wire [7:0] builder_ethernetsoc_csrbank1_bus_errors2_w;
wire builder_ethernetsoc_csrbank1_bus_errors1_re;
wire [7:0] builder_ethernetsoc_csrbank1_bus_errors1_r;
wire [7:0] builder_ethernetsoc_csrbank1_bus_errors1_w;
wire builder_ethernetsoc_csrbank1_bus_errors0_re;
wire [7:0] builder_ethernetsoc_csrbank1_bus_errors0_r;
wire [7:0] builder_ethernetsoc_csrbank1_bus_errors0_w;
wire builder_ethernetsoc_csrbank1_sel;
wire [13:0] builder_ethernetsoc_interface2_bank_bus_adr;
wire builder_ethernetsoc_interface2_bank_bus_we;
wire [7:0] builder_ethernetsoc_interface2_bank_bus_dat_w;
reg [7:0] builder_ethernetsoc_interface2_bank_bus_dat_r = 8'd0;
wire builder_ethernetsoc_csrbank2_half_sys8x_taps0_re;
wire [3:0] builder_ethernetsoc_csrbank2_half_sys8x_taps0_r;
wire [3:0] builder_ethernetsoc_csrbank2_half_sys8x_taps0_w;
wire builder_ethernetsoc_csrbank2_dly_sel0_re;
wire [1:0] builder_ethernetsoc_csrbank2_dly_sel0_r;
wire [1:0] builder_ethernetsoc_csrbank2_dly_sel0_w;
wire builder_ethernetsoc_csrbank2_sel;
wire [13:0] builder_ethernetsoc_interface3_bank_bus_adr;
wire builder_ethernetsoc_interface3_bank_bus_we;
wire [7:0] builder_ethernetsoc_interface3_bank_bus_dat_w;
reg [7:0] builder_ethernetsoc_interface3_bank_bus_dat_r = 8'd0;
wire builder_ethernetsoc_csrbank3_sram_writer_slot_re;
wire builder_ethernetsoc_csrbank3_sram_writer_slot_r;
wire builder_ethernetsoc_csrbank3_sram_writer_slot_w;
wire builder_ethernetsoc_csrbank3_sram_writer_length3_re;
wire [7:0] builder_ethernetsoc_csrbank3_sram_writer_length3_r;
wire [7:0] builder_ethernetsoc_csrbank3_sram_writer_length3_w;
wire builder_ethernetsoc_csrbank3_sram_writer_length2_re;
wire [7:0] builder_ethernetsoc_csrbank3_sram_writer_length2_r;
wire [7:0] builder_ethernetsoc_csrbank3_sram_writer_length2_w;
wire builder_ethernetsoc_csrbank3_sram_writer_length1_re;
wire [7:0] builder_ethernetsoc_csrbank3_sram_writer_length1_r;
wire [7:0] builder_ethernetsoc_csrbank3_sram_writer_length1_w;
wire builder_ethernetsoc_csrbank3_sram_writer_length0_re;
wire [7:0] builder_ethernetsoc_csrbank3_sram_writer_length0_r;
wire [7:0] builder_ethernetsoc_csrbank3_sram_writer_length0_w;
wire builder_ethernetsoc_csrbank3_sram_writer_errors3_re;
wire [7:0] builder_ethernetsoc_csrbank3_sram_writer_errors3_r;
wire [7:0] builder_ethernetsoc_csrbank3_sram_writer_errors3_w;
wire builder_ethernetsoc_csrbank3_sram_writer_errors2_re;
wire [7:0] builder_ethernetsoc_csrbank3_sram_writer_errors2_r;
wire [7:0] builder_ethernetsoc_csrbank3_sram_writer_errors2_w;
wire builder_ethernetsoc_csrbank3_sram_writer_errors1_re;
wire [7:0] builder_ethernetsoc_csrbank3_sram_writer_errors1_r;
wire [7:0] builder_ethernetsoc_csrbank3_sram_writer_errors1_w;
wire builder_ethernetsoc_csrbank3_sram_writer_errors0_re;
wire [7:0] builder_ethernetsoc_csrbank3_sram_writer_errors0_r;
wire [7:0] builder_ethernetsoc_csrbank3_sram_writer_errors0_w;
wire builder_ethernetsoc_csrbank3_sram_writer_ev_enable0_re;
wire builder_ethernetsoc_csrbank3_sram_writer_ev_enable0_r;
wire builder_ethernetsoc_csrbank3_sram_writer_ev_enable0_w;
wire builder_ethernetsoc_csrbank3_sram_reader_ready_re;
wire builder_ethernetsoc_csrbank3_sram_reader_ready_r;
wire builder_ethernetsoc_csrbank3_sram_reader_ready_w;
wire builder_ethernetsoc_csrbank3_sram_reader_level_re;
wire [1:0] builder_ethernetsoc_csrbank3_sram_reader_level_r;
wire [1:0] builder_ethernetsoc_csrbank3_sram_reader_level_w;
wire builder_ethernetsoc_csrbank3_sram_reader_slot0_re;
wire builder_ethernetsoc_csrbank3_sram_reader_slot0_r;
wire builder_ethernetsoc_csrbank3_sram_reader_slot0_w;
wire builder_ethernetsoc_csrbank3_sram_reader_length1_re;
wire [2:0] builder_ethernetsoc_csrbank3_sram_reader_length1_r;
wire [2:0] builder_ethernetsoc_csrbank3_sram_reader_length1_w;
wire builder_ethernetsoc_csrbank3_sram_reader_length0_re;
wire [7:0] builder_ethernetsoc_csrbank3_sram_reader_length0_r;
wire [7:0] builder_ethernetsoc_csrbank3_sram_reader_length0_w;
wire builder_ethernetsoc_csrbank3_sram_reader_ev_enable0_re;
wire builder_ethernetsoc_csrbank3_sram_reader_ev_enable0_r;
wire builder_ethernetsoc_csrbank3_sram_reader_ev_enable0_w;
wire builder_ethernetsoc_csrbank3_preamble_crc_re;
wire builder_ethernetsoc_csrbank3_preamble_crc_r;
wire builder_ethernetsoc_csrbank3_preamble_crc_w;
wire builder_ethernetsoc_csrbank3_preamble_errors3_re;
wire [7:0] builder_ethernetsoc_csrbank3_preamble_errors3_r;
wire [7:0] builder_ethernetsoc_csrbank3_preamble_errors3_w;
wire builder_ethernetsoc_csrbank3_preamble_errors2_re;
wire [7:0] builder_ethernetsoc_csrbank3_preamble_errors2_r;
wire [7:0] builder_ethernetsoc_csrbank3_preamble_errors2_w;
wire builder_ethernetsoc_csrbank3_preamble_errors1_re;
wire [7:0] builder_ethernetsoc_csrbank3_preamble_errors1_r;
wire [7:0] builder_ethernetsoc_csrbank3_preamble_errors1_w;
wire builder_ethernetsoc_csrbank3_preamble_errors0_re;
wire [7:0] builder_ethernetsoc_csrbank3_preamble_errors0_r;
wire [7:0] builder_ethernetsoc_csrbank3_preamble_errors0_w;
wire builder_ethernetsoc_csrbank3_crc_errors3_re;
wire [7:0] builder_ethernetsoc_csrbank3_crc_errors3_r;
wire [7:0] builder_ethernetsoc_csrbank3_crc_errors3_w;
wire builder_ethernetsoc_csrbank3_crc_errors2_re;
wire [7:0] builder_ethernetsoc_csrbank3_crc_errors2_r;
wire [7:0] builder_ethernetsoc_csrbank3_crc_errors2_w;
wire builder_ethernetsoc_csrbank3_crc_errors1_re;
wire [7:0] builder_ethernetsoc_csrbank3_crc_errors1_r;
wire [7:0] builder_ethernetsoc_csrbank3_crc_errors1_w;
wire builder_ethernetsoc_csrbank3_crc_errors0_re;
wire [7:0] builder_ethernetsoc_csrbank3_crc_errors0_r;
wire [7:0] builder_ethernetsoc_csrbank3_crc_errors0_w;
wire builder_ethernetsoc_csrbank3_sel;
wire [13:0] builder_ethernetsoc_interface4_bank_bus_adr;
wire builder_ethernetsoc_interface4_bank_bus_we;
wire [7:0] builder_ethernetsoc_interface4_bank_bus_dat_w;
reg [7:0] builder_ethernetsoc_interface4_bank_bus_dat_r = 8'd0;
wire builder_ethernetsoc_csrbank4_crg_reset0_re;
wire builder_ethernetsoc_csrbank4_crg_reset0_r;
wire builder_ethernetsoc_csrbank4_crg_reset0_w;
wire builder_ethernetsoc_csrbank4_mdio_w0_re;
wire [2:0] builder_ethernetsoc_csrbank4_mdio_w0_r;
wire [2:0] builder_ethernetsoc_csrbank4_mdio_w0_w;
wire builder_ethernetsoc_csrbank4_mdio_r_re;
wire builder_ethernetsoc_csrbank4_mdio_r_r;
wire builder_ethernetsoc_csrbank4_mdio_r_w;
wire builder_ethernetsoc_csrbank4_sel;
wire [13:0] builder_ethernetsoc_interface5_bank_bus_adr;
wire builder_ethernetsoc_interface5_bank_bus_we;
wire [7:0] builder_ethernetsoc_interface5_bank_bus_dat_w;
reg [7:0] builder_ethernetsoc_interface5_bank_bus_dat_r = 8'd0;
wire builder_ethernetsoc_csrbank5_dfii_control0_re;
wire [3:0] builder_ethernetsoc_csrbank5_dfii_control0_r;
wire [3:0] builder_ethernetsoc_csrbank5_dfii_control0_w;
wire builder_ethernetsoc_csrbank5_dfii_pi0_command0_re;
wire [5:0] builder_ethernetsoc_csrbank5_dfii_pi0_command0_r;
wire [5:0] builder_ethernetsoc_csrbank5_dfii_pi0_command0_w;
wire builder_ethernetsoc_csrbank5_dfii_pi0_address1_re;
wire [5:0] builder_ethernetsoc_csrbank5_dfii_pi0_address1_r;
wire [5:0] builder_ethernetsoc_csrbank5_dfii_pi0_address1_w;
wire builder_ethernetsoc_csrbank5_dfii_pi0_address0_re;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi0_address0_r;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi0_address0_w;
wire builder_ethernetsoc_csrbank5_dfii_pi0_baddress0_re;
wire [2:0] builder_ethernetsoc_csrbank5_dfii_pi0_baddress0_r;
wire [2:0] builder_ethernetsoc_csrbank5_dfii_pi0_baddress0_w;
wire builder_ethernetsoc_csrbank5_dfii_pi0_wrdata3_re;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi0_wrdata3_r;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi0_wrdata3_w;
wire builder_ethernetsoc_csrbank5_dfii_pi0_wrdata2_re;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi0_wrdata2_r;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi0_wrdata2_w;
wire builder_ethernetsoc_csrbank5_dfii_pi0_wrdata1_re;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi0_wrdata1_r;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi0_wrdata1_w;
wire builder_ethernetsoc_csrbank5_dfii_pi0_wrdata0_re;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi0_wrdata0_r;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi0_wrdata0_w;
wire builder_ethernetsoc_csrbank5_dfii_pi0_rddata3_re;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi0_rddata3_r;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi0_rddata3_w;
wire builder_ethernetsoc_csrbank5_dfii_pi0_rddata2_re;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi0_rddata2_r;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi0_rddata2_w;
wire builder_ethernetsoc_csrbank5_dfii_pi0_rddata1_re;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi0_rddata1_r;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi0_rddata1_w;
wire builder_ethernetsoc_csrbank5_dfii_pi0_rddata0_re;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi0_rddata0_r;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi0_rddata0_w;
wire builder_ethernetsoc_csrbank5_dfii_pi1_command0_re;
wire [5:0] builder_ethernetsoc_csrbank5_dfii_pi1_command0_r;
wire [5:0] builder_ethernetsoc_csrbank5_dfii_pi1_command0_w;
wire builder_ethernetsoc_csrbank5_dfii_pi1_address1_re;
wire [5:0] builder_ethernetsoc_csrbank5_dfii_pi1_address1_r;
wire [5:0] builder_ethernetsoc_csrbank5_dfii_pi1_address1_w;
wire builder_ethernetsoc_csrbank5_dfii_pi1_address0_re;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi1_address0_r;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi1_address0_w;
wire builder_ethernetsoc_csrbank5_dfii_pi1_baddress0_re;
wire [2:0] builder_ethernetsoc_csrbank5_dfii_pi1_baddress0_r;
wire [2:0] builder_ethernetsoc_csrbank5_dfii_pi1_baddress0_w;
wire builder_ethernetsoc_csrbank5_dfii_pi1_wrdata3_re;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi1_wrdata3_r;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi1_wrdata3_w;
wire builder_ethernetsoc_csrbank5_dfii_pi1_wrdata2_re;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi1_wrdata2_r;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi1_wrdata2_w;
wire builder_ethernetsoc_csrbank5_dfii_pi1_wrdata1_re;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi1_wrdata1_r;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi1_wrdata1_w;
wire builder_ethernetsoc_csrbank5_dfii_pi1_wrdata0_re;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi1_wrdata0_r;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi1_wrdata0_w;
wire builder_ethernetsoc_csrbank5_dfii_pi1_rddata3_re;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi1_rddata3_r;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi1_rddata3_w;
wire builder_ethernetsoc_csrbank5_dfii_pi1_rddata2_re;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi1_rddata2_r;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi1_rddata2_w;
wire builder_ethernetsoc_csrbank5_dfii_pi1_rddata1_re;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi1_rddata1_r;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi1_rddata1_w;
wire builder_ethernetsoc_csrbank5_dfii_pi1_rddata0_re;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi1_rddata0_r;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi1_rddata0_w;
wire builder_ethernetsoc_csrbank5_dfii_pi2_command0_re;
wire [5:0] builder_ethernetsoc_csrbank5_dfii_pi2_command0_r;
wire [5:0] builder_ethernetsoc_csrbank5_dfii_pi2_command0_w;
wire builder_ethernetsoc_csrbank5_dfii_pi2_address1_re;
wire [5:0] builder_ethernetsoc_csrbank5_dfii_pi2_address1_r;
wire [5:0] builder_ethernetsoc_csrbank5_dfii_pi2_address1_w;
wire builder_ethernetsoc_csrbank5_dfii_pi2_address0_re;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi2_address0_r;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi2_address0_w;
wire builder_ethernetsoc_csrbank5_dfii_pi2_baddress0_re;
wire [2:0] builder_ethernetsoc_csrbank5_dfii_pi2_baddress0_r;
wire [2:0] builder_ethernetsoc_csrbank5_dfii_pi2_baddress0_w;
wire builder_ethernetsoc_csrbank5_dfii_pi2_wrdata3_re;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi2_wrdata3_r;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi2_wrdata3_w;
wire builder_ethernetsoc_csrbank5_dfii_pi2_wrdata2_re;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi2_wrdata2_r;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi2_wrdata2_w;
wire builder_ethernetsoc_csrbank5_dfii_pi2_wrdata1_re;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi2_wrdata1_r;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi2_wrdata1_w;
wire builder_ethernetsoc_csrbank5_dfii_pi2_wrdata0_re;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi2_wrdata0_r;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi2_wrdata0_w;
wire builder_ethernetsoc_csrbank5_dfii_pi2_rddata3_re;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi2_rddata3_r;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi2_rddata3_w;
wire builder_ethernetsoc_csrbank5_dfii_pi2_rddata2_re;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi2_rddata2_r;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi2_rddata2_w;
wire builder_ethernetsoc_csrbank5_dfii_pi2_rddata1_re;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi2_rddata1_r;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi2_rddata1_w;
wire builder_ethernetsoc_csrbank5_dfii_pi2_rddata0_re;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi2_rddata0_r;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi2_rddata0_w;
wire builder_ethernetsoc_csrbank5_dfii_pi3_command0_re;
wire [5:0] builder_ethernetsoc_csrbank5_dfii_pi3_command0_r;
wire [5:0] builder_ethernetsoc_csrbank5_dfii_pi3_command0_w;
wire builder_ethernetsoc_csrbank5_dfii_pi3_address1_re;
wire [5:0] builder_ethernetsoc_csrbank5_dfii_pi3_address1_r;
wire [5:0] builder_ethernetsoc_csrbank5_dfii_pi3_address1_w;
wire builder_ethernetsoc_csrbank5_dfii_pi3_address0_re;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi3_address0_r;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi3_address0_w;
wire builder_ethernetsoc_csrbank5_dfii_pi3_baddress0_re;
wire [2:0] builder_ethernetsoc_csrbank5_dfii_pi3_baddress0_r;
wire [2:0] builder_ethernetsoc_csrbank5_dfii_pi3_baddress0_w;
wire builder_ethernetsoc_csrbank5_dfii_pi3_wrdata3_re;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi3_wrdata3_r;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi3_wrdata3_w;
wire builder_ethernetsoc_csrbank5_dfii_pi3_wrdata2_re;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi3_wrdata2_r;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi3_wrdata2_w;
wire builder_ethernetsoc_csrbank5_dfii_pi3_wrdata1_re;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi3_wrdata1_r;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi3_wrdata1_w;
wire builder_ethernetsoc_csrbank5_dfii_pi3_wrdata0_re;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi3_wrdata0_r;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi3_wrdata0_w;
wire builder_ethernetsoc_csrbank5_dfii_pi3_rddata3_re;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi3_rddata3_r;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi3_rddata3_w;
wire builder_ethernetsoc_csrbank5_dfii_pi3_rddata2_re;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi3_rddata2_r;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi3_rddata2_w;
wire builder_ethernetsoc_csrbank5_dfii_pi3_rddata1_re;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi3_rddata1_r;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi3_rddata1_w;
wire builder_ethernetsoc_csrbank5_dfii_pi3_rddata0_re;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi3_rddata0_r;
wire [7:0] builder_ethernetsoc_csrbank5_dfii_pi3_rddata0_w;
wire builder_ethernetsoc_csrbank5_sel;
wire [13:0] builder_ethernetsoc_interface6_bank_bus_adr;
wire builder_ethernetsoc_interface6_bank_bus_we;
wire [7:0] builder_ethernetsoc_interface6_bank_bus_dat_w;
reg [7:0] builder_ethernetsoc_interface6_bank_bus_dat_r = 8'd0;
wire builder_ethernetsoc_csrbank6_load3_re;
wire [7:0] builder_ethernetsoc_csrbank6_load3_r;
wire [7:0] builder_ethernetsoc_csrbank6_load3_w;
wire builder_ethernetsoc_csrbank6_load2_re;
wire [7:0] builder_ethernetsoc_csrbank6_load2_r;
wire [7:0] builder_ethernetsoc_csrbank6_load2_w;
wire builder_ethernetsoc_csrbank6_load1_re;
wire [7:0] builder_ethernetsoc_csrbank6_load1_r;
wire [7:0] builder_ethernetsoc_csrbank6_load1_w;
wire builder_ethernetsoc_csrbank6_load0_re;
wire [7:0] builder_ethernetsoc_csrbank6_load0_r;
wire [7:0] builder_ethernetsoc_csrbank6_load0_w;
wire builder_ethernetsoc_csrbank6_reload3_re;
wire [7:0] builder_ethernetsoc_csrbank6_reload3_r;
wire [7:0] builder_ethernetsoc_csrbank6_reload3_w;
wire builder_ethernetsoc_csrbank6_reload2_re;
wire [7:0] builder_ethernetsoc_csrbank6_reload2_r;
wire [7:0] builder_ethernetsoc_csrbank6_reload2_w;
wire builder_ethernetsoc_csrbank6_reload1_re;
wire [7:0] builder_ethernetsoc_csrbank6_reload1_r;
wire [7:0] builder_ethernetsoc_csrbank6_reload1_w;
wire builder_ethernetsoc_csrbank6_reload0_re;
wire [7:0] builder_ethernetsoc_csrbank6_reload0_r;
wire [7:0] builder_ethernetsoc_csrbank6_reload0_w;
wire builder_ethernetsoc_csrbank6_en0_re;
wire builder_ethernetsoc_csrbank6_en0_r;
wire builder_ethernetsoc_csrbank6_en0_w;
wire builder_ethernetsoc_csrbank6_value3_re;
wire [7:0] builder_ethernetsoc_csrbank6_value3_r;
wire [7:0] builder_ethernetsoc_csrbank6_value3_w;
wire builder_ethernetsoc_csrbank6_value2_re;
wire [7:0] builder_ethernetsoc_csrbank6_value2_r;
wire [7:0] builder_ethernetsoc_csrbank6_value2_w;
wire builder_ethernetsoc_csrbank6_value1_re;
wire [7:0] builder_ethernetsoc_csrbank6_value1_r;
wire [7:0] builder_ethernetsoc_csrbank6_value1_w;
wire builder_ethernetsoc_csrbank6_value0_re;
wire [7:0] builder_ethernetsoc_csrbank6_value0_r;
wire [7:0] builder_ethernetsoc_csrbank6_value0_w;
wire builder_ethernetsoc_csrbank6_ev_enable0_re;
wire builder_ethernetsoc_csrbank6_ev_enable0_r;
wire builder_ethernetsoc_csrbank6_ev_enable0_w;
wire builder_ethernetsoc_csrbank6_sel;
wire [13:0] builder_ethernetsoc_interface7_bank_bus_adr;
wire builder_ethernetsoc_interface7_bank_bus_we;
wire [7:0] builder_ethernetsoc_interface7_bank_bus_dat_w;
reg [7:0] builder_ethernetsoc_interface7_bank_bus_dat_r = 8'd0;
wire builder_ethernetsoc_csrbank7_txfull_re;
wire builder_ethernetsoc_csrbank7_txfull_r;
wire builder_ethernetsoc_csrbank7_txfull_w;
wire builder_ethernetsoc_csrbank7_rxempty_re;
wire builder_ethernetsoc_csrbank7_rxempty_r;
wire builder_ethernetsoc_csrbank7_rxempty_w;
wire builder_ethernetsoc_csrbank7_ev_enable0_re;
wire [1:0] builder_ethernetsoc_csrbank7_ev_enable0_r;
wire [1:0] builder_ethernetsoc_csrbank7_ev_enable0_w;
wire builder_ethernetsoc_csrbank7_sel;
wire [13:0] builder_ethernetsoc_interface8_bank_bus_adr;
wire builder_ethernetsoc_interface8_bank_bus_we;
wire [7:0] builder_ethernetsoc_interface8_bank_bus_dat_w;
reg [7:0] builder_ethernetsoc_interface8_bank_bus_dat_r = 8'd0;
wire builder_ethernetsoc_csrbank8_tuning_word3_re;
wire [7:0] builder_ethernetsoc_csrbank8_tuning_word3_r;
wire [7:0] builder_ethernetsoc_csrbank8_tuning_word3_w;
wire builder_ethernetsoc_csrbank8_tuning_word2_re;
wire [7:0] builder_ethernetsoc_csrbank8_tuning_word2_r;
wire [7:0] builder_ethernetsoc_csrbank8_tuning_word2_w;
wire builder_ethernetsoc_csrbank8_tuning_word1_re;
wire [7:0] builder_ethernetsoc_csrbank8_tuning_word1_r;
wire [7:0] builder_ethernetsoc_csrbank8_tuning_word1_w;
wire builder_ethernetsoc_csrbank8_tuning_word0_re;
wire [7:0] builder_ethernetsoc_csrbank8_tuning_word0_r;
wire [7:0] builder_ethernetsoc_csrbank8_tuning_word0_w;
wire builder_ethernetsoc_csrbank8_sel;
wire [13:0] builder_ethernetsoc_adr;
wire builder_ethernetsoc_we;
wire [7:0] builder_ethernetsoc_dat_w;
wire [7:0] builder_ethernetsoc_dat_r;
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
reg [29:0] builder_rhs_array_muxed44 = 30'd0;
reg [31:0] builder_rhs_array_muxed45 = 32'd0;
reg [3:0] builder_rhs_array_muxed46 = 4'd0;
reg builder_rhs_array_muxed47 = 1'd0;
reg builder_rhs_array_muxed48 = 1'd0;
reg builder_rhs_array_muxed49 = 1'd0;
reg [2:0] builder_rhs_array_muxed50 = 3'd0;
reg [1:0] builder_rhs_array_muxed51 = 2'd0;
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
(* async_reg = "true", mr_ff = "true", dont_touch = "true" *) reg builder_xilinxmultiregimpl0_regs0 = 1'd0;
(* async_reg = "true", dont_touch = "true" *) reg builder_xilinxmultiregimpl0_regs1 = 1'd0;
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
wire builder_xilinxasyncresetsynchronizerimpl4;
wire builder_xilinxasyncresetsynchronizerimpl4_rst_meta;
wire builder_xilinxasyncresetsynchronizerimpl5_rst_meta;
wire builder_xilinxasyncresetsynchronizerimpl6_rst_meta;
(* async_reg = "true", mr_ff = "true", dont_touch = "true" *) reg builder_xilinxmultiregimpl1_regs0 = 1'd0;
(* async_reg = "true", dont_touch = "true" *) reg builder_xilinxmultiregimpl1_regs1 = 1'd0;
(* async_reg = "true", mr_ff = "true", dont_touch = "true" *) reg builder_xilinxmultiregimpl2_regs0 = 1'd0;
(* async_reg = "true", dont_touch = "true" *) reg builder_xilinxmultiregimpl2_regs1 = 1'd0;
(* async_reg = "true", mr_ff = "true", dont_touch = "true" *) reg builder_xilinxmultiregimpl3_regs0 = 1'd0;
(* async_reg = "true", dont_touch = "true" *) reg builder_xilinxmultiregimpl3_regs1 = 1'd0;
(* async_reg = "true", mr_ff = "true", dont_touch = "true" *) reg [6:0] builder_xilinxmultiregimpl4_regs0 = 7'd0;
(* async_reg = "true", dont_touch = "true" *) reg [6:0] builder_xilinxmultiregimpl4_regs1 = 7'd0;
(* async_reg = "true", mr_ff = "true", dont_touch = "true" *) reg [6:0] builder_xilinxmultiregimpl5_regs0 = 7'd0;
(* async_reg = "true", dont_touch = "true" *) reg [6:0] builder_xilinxmultiregimpl5_regs1 = 7'd0;
(* async_reg = "true", mr_ff = "true", dont_touch = "true" *) reg [6:0] builder_xilinxmultiregimpl6_regs0 = 7'd0;
(* async_reg = "true", dont_touch = "true" *) reg [6:0] builder_xilinxmultiregimpl6_regs1 = 7'd0;
(* async_reg = "true", mr_ff = "true", dont_touch = "true" *) reg [6:0] builder_xilinxmultiregimpl7_regs0 = 7'd0;
(* async_reg = "true", dont_touch = "true" *) reg [6:0] builder_xilinxmultiregimpl7_regs1 = 7'd0;
assign main_ethernetsoc_vexriscv_reset = main_ethernetsoc_ctrl_reset;
assign main_ethernetsoc_ctrl_bus_error = builder_ethernetsoc_error;
always @(*) begin
	main_ethernetsoc_vexriscv_interrupt0 <= 32'd0;
	main_ethernetsoc_vexriscv_interrupt0[2] <= main_ev_irq;
	main_ethernetsoc_vexriscv_interrupt0[1] <= main_ethernetsoc_timer0_irq;
	main_ethernetsoc_vexriscv_interrupt0[0] <= main_ethernetsoc_uart_irq;
end
assign main_ethernetsoc_ctrl_reset = main_ethernetsoc_ctrl_reset_reset_re;
assign main_ethernetsoc_ctrl_bus_errors_status = main_ethernetsoc_ctrl_bus_errors;
assign main_ethernetsoc_vexriscv_interrupt1 = (main_ethernetsoc_vexriscv_time >= main_ethernetsoc_vexriscv_time_cmp);
assign main_ethernetsoc_rom_adr = main_ethernetsoc_rom_bus_adr[12:0];
assign main_ethernetsoc_rom_bus_dat_r = main_ethernetsoc_rom_dat_r;
always @(*) begin
	main_ethernetsoc_sram_we <= 4'd0;
	main_ethernetsoc_sram_we[0] <= (((main_ethernetsoc_sram_bus_cyc & main_ethernetsoc_sram_bus_stb) & main_ethernetsoc_sram_bus_we) & main_ethernetsoc_sram_bus_sel[0]);
	main_ethernetsoc_sram_we[1] <= (((main_ethernetsoc_sram_bus_cyc & main_ethernetsoc_sram_bus_stb) & main_ethernetsoc_sram_bus_we) & main_ethernetsoc_sram_bus_sel[1]);
	main_ethernetsoc_sram_we[2] <= (((main_ethernetsoc_sram_bus_cyc & main_ethernetsoc_sram_bus_stb) & main_ethernetsoc_sram_bus_we) & main_ethernetsoc_sram_bus_sel[2]);
	main_ethernetsoc_sram_we[3] <= (((main_ethernetsoc_sram_bus_cyc & main_ethernetsoc_sram_bus_stb) & main_ethernetsoc_sram_bus_we) & main_ethernetsoc_sram_bus_sel[3]);
end
assign main_ethernetsoc_sram_adr = main_ethernetsoc_sram_bus_adr[12:0];
assign main_ethernetsoc_sram_bus_dat_r = main_ethernetsoc_sram_dat_r;
assign main_ethernetsoc_sram_dat_w = main_ethernetsoc_sram_bus_dat_w;
assign main_ethernetsoc_uart_tx_fifo_sink_valid = main_ethernetsoc_uart_rxtx_re;
assign main_ethernetsoc_uart_tx_fifo_sink_payload_data = main_ethernetsoc_uart_rxtx_r;
assign main_ethernetsoc_uart_txfull_status = (~main_ethernetsoc_uart_tx_fifo_sink_ready);
assign main_ethernetsoc_uart_phy_sink_valid = main_ethernetsoc_uart_tx_fifo_source_valid;
assign main_ethernetsoc_uart_tx_fifo_source_ready = main_ethernetsoc_uart_phy_sink_ready;
assign main_ethernetsoc_uart_phy_sink_first = main_ethernetsoc_uart_tx_fifo_source_first;
assign main_ethernetsoc_uart_phy_sink_last = main_ethernetsoc_uart_tx_fifo_source_last;
assign main_ethernetsoc_uart_phy_sink_payload_data = main_ethernetsoc_uart_tx_fifo_source_payload_data;
assign main_ethernetsoc_uart_tx_trigger = (~main_ethernetsoc_uart_tx_fifo_sink_ready);
assign main_ethernetsoc_uart_rx_fifo_sink_valid = main_ethernetsoc_uart_phy_source_valid;
assign main_ethernetsoc_uart_phy_source_ready = main_ethernetsoc_uart_rx_fifo_sink_ready;
assign main_ethernetsoc_uart_rx_fifo_sink_first = main_ethernetsoc_uart_phy_source_first;
assign main_ethernetsoc_uart_rx_fifo_sink_last = main_ethernetsoc_uart_phy_source_last;
assign main_ethernetsoc_uart_rx_fifo_sink_payload_data = main_ethernetsoc_uart_phy_source_payload_data;
assign main_ethernetsoc_uart_rxempty_status = (~main_ethernetsoc_uart_rx_fifo_source_valid);
assign main_ethernetsoc_uart_rxtx_w = main_ethernetsoc_uart_rx_fifo_source_payload_data;
assign main_ethernetsoc_uart_rx_fifo_source_ready = main_ethernetsoc_uart_rx_clear;
assign main_ethernetsoc_uart_rx_trigger = (~main_ethernetsoc_uart_rx_fifo_source_valid);
always @(*) begin
	main_ethernetsoc_uart_tx_clear <= 1'd0;
	if ((main_ethernetsoc_uart_eventmanager_pending_re & main_ethernetsoc_uart_eventmanager_pending_r[0])) begin
		main_ethernetsoc_uart_tx_clear <= 1'd1;
	end
end
always @(*) begin
	main_ethernetsoc_uart_eventmanager_status_w <= 2'd0;
	main_ethernetsoc_uart_eventmanager_status_w[0] <= main_ethernetsoc_uart_tx_status;
	main_ethernetsoc_uart_eventmanager_status_w[1] <= main_ethernetsoc_uart_rx_status;
end
always @(*) begin
	main_ethernetsoc_uart_rx_clear <= 1'd0;
	if ((main_ethernetsoc_uart_eventmanager_pending_re & main_ethernetsoc_uart_eventmanager_pending_r[1])) begin
		main_ethernetsoc_uart_rx_clear <= 1'd1;
	end
end
always @(*) begin
	main_ethernetsoc_uart_eventmanager_pending_w <= 2'd0;
	main_ethernetsoc_uart_eventmanager_pending_w[0] <= main_ethernetsoc_uart_tx_pending;
	main_ethernetsoc_uart_eventmanager_pending_w[1] <= main_ethernetsoc_uart_rx_pending;
end
assign main_ethernetsoc_uart_irq = ((main_ethernetsoc_uart_eventmanager_pending_w[0] & main_ethernetsoc_uart_eventmanager_storage[0]) | (main_ethernetsoc_uart_eventmanager_pending_w[1] & main_ethernetsoc_uart_eventmanager_storage[1]));
assign main_ethernetsoc_uart_tx_status = main_ethernetsoc_uart_tx_trigger;
assign main_ethernetsoc_uart_rx_status = main_ethernetsoc_uart_rx_trigger;
assign main_ethernetsoc_uart_tx_fifo_syncfifo_din = {main_ethernetsoc_uart_tx_fifo_fifo_in_last, main_ethernetsoc_uart_tx_fifo_fifo_in_first, main_ethernetsoc_uart_tx_fifo_fifo_in_payload_data};
assign {main_ethernetsoc_uart_tx_fifo_fifo_out_last, main_ethernetsoc_uart_tx_fifo_fifo_out_first, main_ethernetsoc_uart_tx_fifo_fifo_out_payload_data} = main_ethernetsoc_uart_tx_fifo_syncfifo_dout;
assign main_ethernetsoc_uart_tx_fifo_sink_ready = main_ethernetsoc_uart_tx_fifo_syncfifo_writable;
assign main_ethernetsoc_uart_tx_fifo_syncfifo_we = main_ethernetsoc_uart_tx_fifo_sink_valid;
assign main_ethernetsoc_uart_tx_fifo_fifo_in_first = main_ethernetsoc_uart_tx_fifo_sink_first;
assign main_ethernetsoc_uart_tx_fifo_fifo_in_last = main_ethernetsoc_uart_tx_fifo_sink_last;
assign main_ethernetsoc_uart_tx_fifo_fifo_in_payload_data = main_ethernetsoc_uart_tx_fifo_sink_payload_data;
assign main_ethernetsoc_uart_tx_fifo_source_valid = main_ethernetsoc_uart_tx_fifo_readable;
assign main_ethernetsoc_uart_tx_fifo_source_first = main_ethernetsoc_uart_tx_fifo_fifo_out_first;
assign main_ethernetsoc_uart_tx_fifo_source_last = main_ethernetsoc_uart_tx_fifo_fifo_out_last;
assign main_ethernetsoc_uart_tx_fifo_source_payload_data = main_ethernetsoc_uart_tx_fifo_fifo_out_payload_data;
assign main_ethernetsoc_uart_tx_fifo_re = main_ethernetsoc_uart_tx_fifo_source_ready;
assign main_ethernetsoc_uart_tx_fifo_syncfifo_re = (main_ethernetsoc_uart_tx_fifo_syncfifo_readable & ((~main_ethernetsoc_uart_tx_fifo_readable) | main_ethernetsoc_uart_tx_fifo_re));
assign main_ethernetsoc_uart_tx_fifo_level1 = (main_ethernetsoc_uart_tx_fifo_level0 + main_ethernetsoc_uart_tx_fifo_readable);
always @(*) begin
	main_ethernetsoc_uart_tx_fifo_wrport_adr <= 4'd0;
	if (main_ethernetsoc_uart_tx_fifo_replace) begin
		main_ethernetsoc_uart_tx_fifo_wrport_adr <= (main_ethernetsoc_uart_tx_fifo_produce - 1'd1);
	end else begin
		main_ethernetsoc_uart_tx_fifo_wrport_adr <= main_ethernetsoc_uart_tx_fifo_produce;
	end
end
assign main_ethernetsoc_uart_tx_fifo_wrport_dat_w = main_ethernetsoc_uart_tx_fifo_syncfifo_din;
assign main_ethernetsoc_uart_tx_fifo_wrport_we = (main_ethernetsoc_uart_tx_fifo_syncfifo_we & (main_ethernetsoc_uart_tx_fifo_syncfifo_writable | main_ethernetsoc_uart_tx_fifo_replace));
assign main_ethernetsoc_uart_tx_fifo_do_read = (main_ethernetsoc_uart_tx_fifo_syncfifo_readable & main_ethernetsoc_uart_tx_fifo_syncfifo_re);
assign main_ethernetsoc_uart_tx_fifo_rdport_adr = main_ethernetsoc_uart_tx_fifo_consume;
assign main_ethernetsoc_uart_tx_fifo_syncfifo_dout = main_ethernetsoc_uart_tx_fifo_rdport_dat_r;
assign main_ethernetsoc_uart_tx_fifo_rdport_re = main_ethernetsoc_uart_tx_fifo_do_read;
assign main_ethernetsoc_uart_tx_fifo_syncfifo_writable = (main_ethernetsoc_uart_tx_fifo_level0 != 5'd16);
assign main_ethernetsoc_uart_tx_fifo_syncfifo_readable = (main_ethernetsoc_uart_tx_fifo_level0 != 1'd0);
assign main_ethernetsoc_uart_rx_fifo_syncfifo_din = {main_ethernetsoc_uart_rx_fifo_fifo_in_last, main_ethernetsoc_uart_rx_fifo_fifo_in_first, main_ethernetsoc_uart_rx_fifo_fifo_in_payload_data};
assign {main_ethernetsoc_uart_rx_fifo_fifo_out_last, main_ethernetsoc_uart_rx_fifo_fifo_out_first, main_ethernetsoc_uart_rx_fifo_fifo_out_payload_data} = main_ethernetsoc_uart_rx_fifo_syncfifo_dout;
assign main_ethernetsoc_uart_rx_fifo_sink_ready = main_ethernetsoc_uart_rx_fifo_syncfifo_writable;
assign main_ethernetsoc_uart_rx_fifo_syncfifo_we = main_ethernetsoc_uart_rx_fifo_sink_valid;
assign main_ethernetsoc_uart_rx_fifo_fifo_in_first = main_ethernetsoc_uart_rx_fifo_sink_first;
assign main_ethernetsoc_uart_rx_fifo_fifo_in_last = main_ethernetsoc_uart_rx_fifo_sink_last;
assign main_ethernetsoc_uart_rx_fifo_fifo_in_payload_data = main_ethernetsoc_uart_rx_fifo_sink_payload_data;
assign main_ethernetsoc_uart_rx_fifo_source_valid = main_ethernetsoc_uart_rx_fifo_readable;
assign main_ethernetsoc_uart_rx_fifo_source_first = main_ethernetsoc_uart_rx_fifo_fifo_out_first;
assign main_ethernetsoc_uart_rx_fifo_source_last = main_ethernetsoc_uart_rx_fifo_fifo_out_last;
assign main_ethernetsoc_uart_rx_fifo_source_payload_data = main_ethernetsoc_uart_rx_fifo_fifo_out_payload_data;
assign main_ethernetsoc_uart_rx_fifo_re = main_ethernetsoc_uart_rx_fifo_source_ready;
assign main_ethernetsoc_uart_rx_fifo_syncfifo_re = (main_ethernetsoc_uart_rx_fifo_syncfifo_readable & ((~main_ethernetsoc_uart_rx_fifo_readable) | main_ethernetsoc_uart_rx_fifo_re));
assign main_ethernetsoc_uart_rx_fifo_level1 = (main_ethernetsoc_uart_rx_fifo_level0 + main_ethernetsoc_uart_rx_fifo_readable);
always @(*) begin
	main_ethernetsoc_uart_rx_fifo_wrport_adr <= 4'd0;
	if (main_ethernetsoc_uart_rx_fifo_replace) begin
		main_ethernetsoc_uart_rx_fifo_wrport_adr <= (main_ethernetsoc_uart_rx_fifo_produce - 1'd1);
	end else begin
		main_ethernetsoc_uart_rx_fifo_wrport_adr <= main_ethernetsoc_uart_rx_fifo_produce;
	end
end
assign main_ethernetsoc_uart_rx_fifo_wrport_dat_w = main_ethernetsoc_uart_rx_fifo_syncfifo_din;
assign main_ethernetsoc_uart_rx_fifo_wrport_we = (main_ethernetsoc_uart_rx_fifo_syncfifo_we & (main_ethernetsoc_uart_rx_fifo_syncfifo_writable | main_ethernetsoc_uart_rx_fifo_replace));
assign main_ethernetsoc_uart_rx_fifo_do_read = (main_ethernetsoc_uart_rx_fifo_syncfifo_readable & main_ethernetsoc_uart_rx_fifo_syncfifo_re);
assign main_ethernetsoc_uart_rx_fifo_rdport_adr = main_ethernetsoc_uart_rx_fifo_consume;
assign main_ethernetsoc_uart_rx_fifo_syncfifo_dout = main_ethernetsoc_uart_rx_fifo_rdport_dat_r;
assign main_ethernetsoc_uart_rx_fifo_rdport_re = main_ethernetsoc_uart_rx_fifo_do_read;
assign main_ethernetsoc_uart_rx_fifo_syncfifo_writable = (main_ethernetsoc_uart_rx_fifo_level0 != 5'd16);
assign main_ethernetsoc_uart_rx_fifo_syncfifo_readable = (main_ethernetsoc_uart_rx_fifo_level0 != 1'd0);
assign main_ethernetsoc_timer0_zero_trigger = (main_ethernetsoc_timer0_value != 1'd0);
assign main_ethernetsoc_timer0_eventmanager_status_w = main_ethernetsoc_timer0_zero_status;
always @(*) begin
	main_ethernetsoc_timer0_zero_clear <= 1'd0;
	if ((main_ethernetsoc_timer0_eventmanager_pending_re & main_ethernetsoc_timer0_eventmanager_pending_r)) begin
		main_ethernetsoc_timer0_zero_clear <= 1'd1;
	end
end
assign main_ethernetsoc_timer0_eventmanager_pending_w = main_ethernetsoc_timer0_zero_pending;
assign main_ethernetsoc_timer0_irq = (main_ethernetsoc_timer0_eventmanager_pending_w & main_ethernetsoc_timer0_eventmanager_storage);
assign main_ethernetsoc_timer0_zero_status = main_ethernetsoc_timer0_zero_trigger;
assign main_ethernetsoc_reset = (~cpu_reset);
assign eth_ref_clk = eth_clk;
assign main_ethernetsoc_clkin = clk100;
assign sys_clk = main_ethernetsoc_clkout_buf0;
assign sys4x_clk = main_ethernetsoc_clkout_buf1;
assign sys4x_dqs_clk = main_ethernetsoc_clkout_buf2;
assign clk200_clk = main_ethernetsoc_clkout_buf3;
assign eth_clk = main_ethernetsoc_clkout_buf4;
always @(*) begin
	main_ethernetsoc_a7ddrphy_dqs_serdes_pattern <= 8'd85;
	if ((main_ethernetsoc_a7ddrphy_dqs_preamble | main_ethernetsoc_a7ddrphy_dqs_postamble)) begin
		main_ethernetsoc_a7ddrphy_dqs_serdes_pattern <= 1'd0;
	end else begin
		main_ethernetsoc_a7ddrphy_dqs_serdes_pattern <= 7'd85;
	end
end
assign main_ethernetsoc_a7ddrphy_bitslip0_i = main_ethernetsoc_a7ddrphy_dq_i_data0;
assign main_ethernetsoc_a7ddrphy_bitslip1_i = main_ethernetsoc_a7ddrphy_dq_i_data1;
assign main_ethernetsoc_a7ddrphy_bitslip2_i = main_ethernetsoc_a7ddrphy_dq_i_data2;
assign main_ethernetsoc_a7ddrphy_bitslip3_i = main_ethernetsoc_a7ddrphy_dq_i_data3;
assign main_ethernetsoc_a7ddrphy_bitslip4_i = main_ethernetsoc_a7ddrphy_dq_i_data4;
assign main_ethernetsoc_a7ddrphy_bitslip5_i = main_ethernetsoc_a7ddrphy_dq_i_data5;
assign main_ethernetsoc_a7ddrphy_bitslip6_i = main_ethernetsoc_a7ddrphy_dq_i_data6;
assign main_ethernetsoc_a7ddrphy_bitslip7_i = main_ethernetsoc_a7ddrphy_dq_i_data7;
assign main_ethernetsoc_a7ddrphy_bitslip8_i = main_ethernetsoc_a7ddrphy_dq_i_data8;
assign main_ethernetsoc_a7ddrphy_bitslip9_i = main_ethernetsoc_a7ddrphy_dq_i_data9;
assign main_ethernetsoc_a7ddrphy_bitslip10_i = main_ethernetsoc_a7ddrphy_dq_i_data10;
assign main_ethernetsoc_a7ddrphy_bitslip11_i = main_ethernetsoc_a7ddrphy_dq_i_data11;
assign main_ethernetsoc_a7ddrphy_bitslip12_i = main_ethernetsoc_a7ddrphy_dq_i_data12;
assign main_ethernetsoc_a7ddrphy_bitslip13_i = main_ethernetsoc_a7ddrphy_dq_i_data13;
assign main_ethernetsoc_a7ddrphy_bitslip14_i = main_ethernetsoc_a7ddrphy_dq_i_data14;
assign main_ethernetsoc_a7ddrphy_bitslip15_i = main_ethernetsoc_a7ddrphy_dq_i_data15;
always @(*) begin
	main_ethernetsoc_a7ddrphy_dfi_p0_rddata <= 32'd0;
	main_ethernetsoc_a7ddrphy_dfi_p0_rddata[0] <= main_ethernetsoc_a7ddrphy_bitslip0_o[0];
	main_ethernetsoc_a7ddrphy_dfi_p0_rddata[16] <= main_ethernetsoc_a7ddrphy_bitslip0_o[1];
	main_ethernetsoc_a7ddrphy_dfi_p0_rddata[1] <= main_ethernetsoc_a7ddrphy_bitslip1_o[0];
	main_ethernetsoc_a7ddrphy_dfi_p0_rddata[17] <= main_ethernetsoc_a7ddrphy_bitslip1_o[1];
	main_ethernetsoc_a7ddrphy_dfi_p0_rddata[2] <= main_ethernetsoc_a7ddrphy_bitslip2_o[0];
	main_ethernetsoc_a7ddrphy_dfi_p0_rddata[18] <= main_ethernetsoc_a7ddrphy_bitslip2_o[1];
	main_ethernetsoc_a7ddrphy_dfi_p0_rddata[3] <= main_ethernetsoc_a7ddrphy_bitslip3_o[0];
	main_ethernetsoc_a7ddrphy_dfi_p0_rddata[19] <= main_ethernetsoc_a7ddrphy_bitslip3_o[1];
	main_ethernetsoc_a7ddrphy_dfi_p0_rddata[4] <= main_ethernetsoc_a7ddrphy_bitslip4_o[0];
	main_ethernetsoc_a7ddrphy_dfi_p0_rddata[20] <= main_ethernetsoc_a7ddrphy_bitslip4_o[1];
	main_ethernetsoc_a7ddrphy_dfi_p0_rddata[5] <= main_ethernetsoc_a7ddrphy_bitslip5_o[0];
	main_ethernetsoc_a7ddrphy_dfi_p0_rddata[21] <= main_ethernetsoc_a7ddrphy_bitslip5_o[1];
	main_ethernetsoc_a7ddrphy_dfi_p0_rddata[6] <= main_ethernetsoc_a7ddrphy_bitslip6_o[0];
	main_ethernetsoc_a7ddrphy_dfi_p0_rddata[22] <= main_ethernetsoc_a7ddrphy_bitslip6_o[1];
	main_ethernetsoc_a7ddrphy_dfi_p0_rddata[7] <= main_ethernetsoc_a7ddrphy_bitslip7_o[0];
	main_ethernetsoc_a7ddrphy_dfi_p0_rddata[23] <= main_ethernetsoc_a7ddrphy_bitslip7_o[1];
	main_ethernetsoc_a7ddrphy_dfi_p0_rddata[8] <= main_ethernetsoc_a7ddrphy_bitslip8_o[0];
	main_ethernetsoc_a7ddrphy_dfi_p0_rddata[24] <= main_ethernetsoc_a7ddrphy_bitslip8_o[1];
	main_ethernetsoc_a7ddrphy_dfi_p0_rddata[9] <= main_ethernetsoc_a7ddrphy_bitslip9_o[0];
	main_ethernetsoc_a7ddrphy_dfi_p0_rddata[25] <= main_ethernetsoc_a7ddrphy_bitslip9_o[1];
	main_ethernetsoc_a7ddrphy_dfi_p0_rddata[10] <= main_ethernetsoc_a7ddrphy_bitslip10_o[0];
	main_ethernetsoc_a7ddrphy_dfi_p0_rddata[26] <= main_ethernetsoc_a7ddrphy_bitslip10_o[1];
	main_ethernetsoc_a7ddrphy_dfi_p0_rddata[11] <= main_ethernetsoc_a7ddrphy_bitslip11_o[0];
	main_ethernetsoc_a7ddrphy_dfi_p0_rddata[27] <= main_ethernetsoc_a7ddrphy_bitslip11_o[1];
	main_ethernetsoc_a7ddrphy_dfi_p0_rddata[12] <= main_ethernetsoc_a7ddrphy_bitslip12_o[0];
	main_ethernetsoc_a7ddrphy_dfi_p0_rddata[28] <= main_ethernetsoc_a7ddrphy_bitslip12_o[1];
	main_ethernetsoc_a7ddrphy_dfi_p0_rddata[13] <= main_ethernetsoc_a7ddrphy_bitslip13_o[0];
	main_ethernetsoc_a7ddrphy_dfi_p0_rddata[29] <= main_ethernetsoc_a7ddrphy_bitslip13_o[1];
	main_ethernetsoc_a7ddrphy_dfi_p0_rddata[14] <= main_ethernetsoc_a7ddrphy_bitslip14_o[0];
	main_ethernetsoc_a7ddrphy_dfi_p0_rddata[30] <= main_ethernetsoc_a7ddrphy_bitslip14_o[1];
	main_ethernetsoc_a7ddrphy_dfi_p0_rddata[15] <= main_ethernetsoc_a7ddrphy_bitslip15_o[0];
	main_ethernetsoc_a7ddrphy_dfi_p0_rddata[31] <= main_ethernetsoc_a7ddrphy_bitslip15_o[1];
end
always @(*) begin
	main_ethernetsoc_a7ddrphy_dfi_p1_rddata <= 32'd0;
	main_ethernetsoc_a7ddrphy_dfi_p1_rddata[0] <= main_ethernetsoc_a7ddrphy_bitslip0_o[2];
	main_ethernetsoc_a7ddrphy_dfi_p1_rddata[16] <= main_ethernetsoc_a7ddrphy_bitslip0_o[3];
	main_ethernetsoc_a7ddrphy_dfi_p1_rddata[1] <= main_ethernetsoc_a7ddrphy_bitslip1_o[2];
	main_ethernetsoc_a7ddrphy_dfi_p1_rddata[17] <= main_ethernetsoc_a7ddrphy_bitslip1_o[3];
	main_ethernetsoc_a7ddrphy_dfi_p1_rddata[2] <= main_ethernetsoc_a7ddrphy_bitslip2_o[2];
	main_ethernetsoc_a7ddrphy_dfi_p1_rddata[18] <= main_ethernetsoc_a7ddrphy_bitslip2_o[3];
	main_ethernetsoc_a7ddrphy_dfi_p1_rddata[3] <= main_ethernetsoc_a7ddrphy_bitslip3_o[2];
	main_ethernetsoc_a7ddrphy_dfi_p1_rddata[19] <= main_ethernetsoc_a7ddrphy_bitslip3_o[3];
	main_ethernetsoc_a7ddrphy_dfi_p1_rddata[4] <= main_ethernetsoc_a7ddrphy_bitslip4_o[2];
	main_ethernetsoc_a7ddrphy_dfi_p1_rddata[20] <= main_ethernetsoc_a7ddrphy_bitslip4_o[3];
	main_ethernetsoc_a7ddrphy_dfi_p1_rddata[5] <= main_ethernetsoc_a7ddrphy_bitslip5_o[2];
	main_ethernetsoc_a7ddrphy_dfi_p1_rddata[21] <= main_ethernetsoc_a7ddrphy_bitslip5_o[3];
	main_ethernetsoc_a7ddrphy_dfi_p1_rddata[6] <= main_ethernetsoc_a7ddrphy_bitslip6_o[2];
	main_ethernetsoc_a7ddrphy_dfi_p1_rddata[22] <= main_ethernetsoc_a7ddrphy_bitslip6_o[3];
	main_ethernetsoc_a7ddrphy_dfi_p1_rddata[7] <= main_ethernetsoc_a7ddrphy_bitslip7_o[2];
	main_ethernetsoc_a7ddrphy_dfi_p1_rddata[23] <= main_ethernetsoc_a7ddrphy_bitslip7_o[3];
	main_ethernetsoc_a7ddrphy_dfi_p1_rddata[8] <= main_ethernetsoc_a7ddrphy_bitslip8_o[2];
	main_ethernetsoc_a7ddrphy_dfi_p1_rddata[24] <= main_ethernetsoc_a7ddrphy_bitslip8_o[3];
	main_ethernetsoc_a7ddrphy_dfi_p1_rddata[9] <= main_ethernetsoc_a7ddrphy_bitslip9_o[2];
	main_ethernetsoc_a7ddrphy_dfi_p1_rddata[25] <= main_ethernetsoc_a7ddrphy_bitslip9_o[3];
	main_ethernetsoc_a7ddrphy_dfi_p1_rddata[10] <= main_ethernetsoc_a7ddrphy_bitslip10_o[2];
	main_ethernetsoc_a7ddrphy_dfi_p1_rddata[26] <= main_ethernetsoc_a7ddrphy_bitslip10_o[3];
	main_ethernetsoc_a7ddrphy_dfi_p1_rddata[11] <= main_ethernetsoc_a7ddrphy_bitslip11_o[2];
	main_ethernetsoc_a7ddrphy_dfi_p1_rddata[27] <= main_ethernetsoc_a7ddrphy_bitslip11_o[3];
	main_ethernetsoc_a7ddrphy_dfi_p1_rddata[12] <= main_ethernetsoc_a7ddrphy_bitslip12_o[2];
	main_ethernetsoc_a7ddrphy_dfi_p1_rddata[28] <= main_ethernetsoc_a7ddrphy_bitslip12_o[3];
	main_ethernetsoc_a7ddrphy_dfi_p1_rddata[13] <= main_ethernetsoc_a7ddrphy_bitslip13_o[2];
	main_ethernetsoc_a7ddrphy_dfi_p1_rddata[29] <= main_ethernetsoc_a7ddrphy_bitslip13_o[3];
	main_ethernetsoc_a7ddrphy_dfi_p1_rddata[14] <= main_ethernetsoc_a7ddrphy_bitslip14_o[2];
	main_ethernetsoc_a7ddrphy_dfi_p1_rddata[30] <= main_ethernetsoc_a7ddrphy_bitslip14_o[3];
	main_ethernetsoc_a7ddrphy_dfi_p1_rddata[15] <= main_ethernetsoc_a7ddrphy_bitslip15_o[2];
	main_ethernetsoc_a7ddrphy_dfi_p1_rddata[31] <= main_ethernetsoc_a7ddrphy_bitslip15_o[3];
end
always @(*) begin
	main_ethernetsoc_a7ddrphy_dfi_p2_rddata <= 32'd0;
	main_ethernetsoc_a7ddrphy_dfi_p2_rddata[0] <= main_ethernetsoc_a7ddrphy_bitslip0_o[4];
	main_ethernetsoc_a7ddrphy_dfi_p2_rddata[16] <= main_ethernetsoc_a7ddrphy_bitslip0_o[5];
	main_ethernetsoc_a7ddrphy_dfi_p2_rddata[1] <= main_ethernetsoc_a7ddrphy_bitslip1_o[4];
	main_ethernetsoc_a7ddrphy_dfi_p2_rddata[17] <= main_ethernetsoc_a7ddrphy_bitslip1_o[5];
	main_ethernetsoc_a7ddrphy_dfi_p2_rddata[2] <= main_ethernetsoc_a7ddrphy_bitslip2_o[4];
	main_ethernetsoc_a7ddrphy_dfi_p2_rddata[18] <= main_ethernetsoc_a7ddrphy_bitslip2_o[5];
	main_ethernetsoc_a7ddrphy_dfi_p2_rddata[3] <= main_ethernetsoc_a7ddrphy_bitslip3_o[4];
	main_ethernetsoc_a7ddrphy_dfi_p2_rddata[19] <= main_ethernetsoc_a7ddrphy_bitslip3_o[5];
	main_ethernetsoc_a7ddrphy_dfi_p2_rddata[4] <= main_ethernetsoc_a7ddrphy_bitslip4_o[4];
	main_ethernetsoc_a7ddrphy_dfi_p2_rddata[20] <= main_ethernetsoc_a7ddrphy_bitslip4_o[5];
	main_ethernetsoc_a7ddrphy_dfi_p2_rddata[5] <= main_ethernetsoc_a7ddrphy_bitslip5_o[4];
	main_ethernetsoc_a7ddrphy_dfi_p2_rddata[21] <= main_ethernetsoc_a7ddrphy_bitslip5_o[5];
	main_ethernetsoc_a7ddrphy_dfi_p2_rddata[6] <= main_ethernetsoc_a7ddrphy_bitslip6_o[4];
	main_ethernetsoc_a7ddrphy_dfi_p2_rddata[22] <= main_ethernetsoc_a7ddrphy_bitslip6_o[5];
	main_ethernetsoc_a7ddrphy_dfi_p2_rddata[7] <= main_ethernetsoc_a7ddrphy_bitslip7_o[4];
	main_ethernetsoc_a7ddrphy_dfi_p2_rddata[23] <= main_ethernetsoc_a7ddrphy_bitslip7_o[5];
	main_ethernetsoc_a7ddrphy_dfi_p2_rddata[8] <= main_ethernetsoc_a7ddrphy_bitslip8_o[4];
	main_ethernetsoc_a7ddrphy_dfi_p2_rddata[24] <= main_ethernetsoc_a7ddrphy_bitslip8_o[5];
	main_ethernetsoc_a7ddrphy_dfi_p2_rddata[9] <= main_ethernetsoc_a7ddrphy_bitslip9_o[4];
	main_ethernetsoc_a7ddrphy_dfi_p2_rddata[25] <= main_ethernetsoc_a7ddrphy_bitslip9_o[5];
	main_ethernetsoc_a7ddrphy_dfi_p2_rddata[10] <= main_ethernetsoc_a7ddrphy_bitslip10_o[4];
	main_ethernetsoc_a7ddrphy_dfi_p2_rddata[26] <= main_ethernetsoc_a7ddrphy_bitslip10_o[5];
	main_ethernetsoc_a7ddrphy_dfi_p2_rddata[11] <= main_ethernetsoc_a7ddrphy_bitslip11_o[4];
	main_ethernetsoc_a7ddrphy_dfi_p2_rddata[27] <= main_ethernetsoc_a7ddrphy_bitslip11_o[5];
	main_ethernetsoc_a7ddrphy_dfi_p2_rddata[12] <= main_ethernetsoc_a7ddrphy_bitslip12_o[4];
	main_ethernetsoc_a7ddrphy_dfi_p2_rddata[28] <= main_ethernetsoc_a7ddrphy_bitslip12_o[5];
	main_ethernetsoc_a7ddrphy_dfi_p2_rddata[13] <= main_ethernetsoc_a7ddrphy_bitslip13_o[4];
	main_ethernetsoc_a7ddrphy_dfi_p2_rddata[29] <= main_ethernetsoc_a7ddrphy_bitslip13_o[5];
	main_ethernetsoc_a7ddrphy_dfi_p2_rddata[14] <= main_ethernetsoc_a7ddrphy_bitslip14_o[4];
	main_ethernetsoc_a7ddrphy_dfi_p2_rddata[30] <= main_ethernetsoc_a7ddrphy_bitslip14_o[5];
	main_ethernetsoc_a7ddrphy_dfi_p2_rddata[15] <= main_ethernetsoc_a7ddrphy_bitslip15_o[4];
	main_ethernetsoc_a7ddrphy_dfi_p2_rddata[31] <= main_ethernetsoc_a7ddrphy_bitslip15_o[5];
end
always @(*) begin
	main_ethernetsoc_a7ddrphy_dfi_p3_rddata <= 32'd0;
	main_ethernetsoc_a7ddrphy_dfi_p3_rddata[0] <= main_ethernetsoc_a7ddrphy_bitslip0_o[6];
	main_ethernetsoc_a7ddrphy_dfi_p3_rddata[16] <= main_ethernetsoc_a7ddrphy_bitslip0_o[7];
	main_ethernetsoc_a7ddrphy_dfi_p3_rddata[1] <= main_ethernetsoc_a7ddrphy_bitslip1_o[6];
	main_ethernetsoc_a7ddrphy_dfi_p3_rddata[17] <= main_ethernetsoc_a7ddrphy_bitslip1_o[7];
	main_ethernetsoc_a7ddrphy_dfi_p3_rddata[2] <= main_ethernetsoc_a7ddrphy_bitslip2_o[6];
	main_ethernetsoc_a7ddrphy_dfi_p3_rddata[18] <= main_ethernetsoc_a7ddrphy_bitslip2_o[7];
	main_ethernetsoc_a7ddrphy_dfi_p3_rddata[3] <= main_ethernetsoc_a7ddrphy_bitslip3_o[6];
	main_ethernetsoc_a7ddrphy_dfi_p3_rddata[19] <= main_ethernetsoc_a7ddrphy_bitslip3_o[7];
	main_ethernetsoc_a7ddrphy_dfi_p3_rddata[4] <= main_ethernetsoc_a7ddrphy_bitslip4_o[6];
	main_ethernetsoc_a7ddrphy_dfi_p3_rddata[20] <= main_ethernetsoc_a7ddrphy_bitslip4_o[7];
	main_ethernetsoc_a7ddrphy_dfi_p3_rddata[5] <= main_ethernetsoc_a7ddrphy_bitslip5_o[6];
	main_ethernetsoc_a7ddrphy_dfi_p3_rddata[21] <= main_ethernetsoc_a7ddrphy_bitslip5_o[7];
	main_ethernetsoc_a7ddrphy_dfi_p3_rddata[6] <= main_ethernetsoc_a7ddrphy_bitslip6_o[6];
	main_ethernetsoc_a7ddrphy_dfi_p3_rddata[22] <= main_ethernetsoc_a7ddrphy_bitslip6_o[7];
	main_ethernetsoc_a7ddrphy_dfi_p3_rddata[7] <= main_ethernetsoc_a7ddrphy_bitslip7_o[6];
	main_ethernetsoc_a7ddrphy_dfi_p3_rddata[23] <= main_ethernetsoc_a7ddrphy_bitslip7_o[7];
	main_ethernetsoc_a7ddrphy_dfi_p3_rddata[8] <= main_ethernetsoc_a7ddrphy_bitslip8_o[6];
	main_ethernetsoc_a7ddrphy_dfi_p3_rddata[24] <= main_ethernetsoc_a7ddrphy_bitslip8_o[7];
	main_ethernetsoc_a7ddrphy_dfi_p3_rddata[9] <= main_ethernetsoc_a7ddrphy_bitslip9_o[6];
	main_ethernetsoc_a7ddrphy_dfi_p3_rddata[25] <= main_ethernetsoc_a7ddrphy_bitslip9_o[7];
	main_ethernetsoc_a7ddrphy_dfi_p3_rddata[10] <= main_ethernetsoc_a7ddrphy_bitslip10_o[6];
	main_ethernetsoc_a7ddrphy_dfi_p3_rddata[26] <= main_ethernetsoc_a7ddrphy_bitslip10_o[7];
	main_ethernetsoc_a7ddrphy_dfi_p3_rddata[11] <= main_ethernetsoc_a7ddrphy_bitslip11_o[6];
	main_ethernetsoc_a7ddrphy_dfi_p3_rddata[27] <= main_ethernetsoc_a7ddrphy_bitslip11_o[7];
	main_ethernetsoc_a7ddrphy_dfi_p3_rddata[12] <= main_ethernetsoc_a7ddrphy_bitslip12_o[6];
	main_ethernetsoc_a7ddrphy_dfi_p3_rddata[28] <= main_ethernetsoc_a7ddrphy_bitslip12_o[7];
	main_ethernetsoc_a7ddrphy_dfi_p3_rddata[13] <= main_ethernetsoc_a7ddrphy_bitslip13_o[6];
	main_ethernetsoc_a7ddrphy_dfi_p3_rddata[29] <= main_ethernetsoc_a7ddrphy_bitslip13_o[7];
	main_ethernetsoc_a7ddrphy_dfi_p3_rddata[14] <= main_ethernetsoc_a7ddrphy_bitslip14_o[6];
	main_ethernetsoc_a7ddrphy_dfi_p3_rddata[30] <= main_ethernetsoc_a7ddrphy_bitslip14_o[7];
	main_ethernetsoc_a7ddrphy_dfi_p3_rddata[15] <= main_ethernetsoc_a7ddrphy_bitslip15_o[6];
	main_ethernetsoc_a7ddrphy_dfi_p3_rddata[31] <= main_ethernetsoc_a7ddrphy_bitslip15_o[7];
end
assign main_ethernetsoc_a7ddrphy_oe = ((main_ethernetsoc_a7ddrphy_last_wrdata_en[1] | main_ethernetsoc_a7ddrphy_last_wrdata_en[2]) | main_ethernetsoc_a7ddrphy_last_wrdata_en[3]);
assign main_ethernetsoc_a7ddrphy_dqs_preamble = (main_ethernetsoc_a7ddrphy_last_wrdata_en[1] & (~main_ethernetsoc_a7ddrphy_last_wrdata_en[2]));
assign main_ethernetsoc_a7ddrphy_dqs_postamble = (main_ethernetsoc_a7ddrphy_last_wrdata_en[3] & (~main_ethernetsoc_a7ddrphy_last_wrdata_en[2]));
assign main_ethernetsoc_a7ddrphy_dfi_p0_address = main_ethernetsoc_sdram_master_p0_address;
assign main_ethernetsoc_a7ddrphy_dfi_p0_bank = main_ethernetsoc_sdram_master_p0_bank;
assign main_ethernetsoc_a7ddrphy_dfi_p0_cas_n = main_ethernetsoc_sdram_master_p0_cas_n;
assign main_ethernetsoc_a7ddrphy_dfi_p0_cs_n = main_ethernetsoc_sdram_master_p0_cs_n;
assign main_ethernetsoc_a7ddrphy_dfi_p0_ras_n = main_ethernetsoc_sdram_master_p0_ras_n;
assign main_ethernetsoc_a7ddrphy_dfi_p0_we_n = main_ethernetsoc_sdram_master_p0_we_n;
assign main_ethernetsoc_a7ddrphy_dfi_p0_cke = main_ethernetsoc_sdram_master_p0_cke;
assign main_ethernetsoc_a7ddrphy_dfi_p0_odt = main_ethernetsoc_sdram_master_p0_odt;
assign main_ethernetsoc_a7ddrphy_dfi_p0_reset_n = main_ethernetsoc_sdram_master_p0_reset_n;
assign main_ethernetsoc_a7ddrphy_dfi_p0_act_n = main_ethernetsoc_sdram_master_p0_act_n;
assign main_ethernetsoc_a7ddrphy_dfi_p0_wrdata = main_ethernetsoc_sdram_master_p0_wrdata;
assign main_ethernetsoc_a7ddrphy_dfi_p0_wrdata_en = main_ethernetsoc_sdram_master_p0_wrdata_en;
assign main_ethernetsoc_a7ddrphy_dfi_p0_wrdata_mask = main_ethernetsoc_sdram_master_p0_wrdata_mask;
assign main_ethernetsoc_a7ddrphy_dfi_p0_rddata_en = main_ethernetsoc_sdram_master_p0_rddata_en;
assign main_ethernetsoc_sdram_master_p0_rddata = main_ethernetsoc_a7ddrphy_dfi_p0_rddata;
assign main_ethernetsoc_sdram_master_p0_rddata_valid = main_ethernetsoc_a7ddrphy_dfi_p0_rddata_valid;
assign main_ethernetsoc_a7ddrphy_dfi_p1_address = main_ethernetsoc_sdram_master_p1_address;
assign main_ethernetsoc_a7ddrphy_dfi_p1_bank = main_ethernetsoc_sdram_master_p1_bank;
assign main_ethernetsoc_a7ddrphy_dfi_p1_cas_n = main_ethernetsoc_sdram_master_p1_cas_n;
assign main_ethernetsoc_a7ddrphy_dfi_p1_cs_n = main_ethernetsoc_sdram_master_p1_cs_n;
assign main_ethernetsoc_a7ddrphy_dfi_p1_ras_n = main_ethernetsoc_sdram_master_p1_ras_n;
assign main_ethernetsoc_a7ddrphy_dfi_p1_we_n = main_ethernetsoc_sdram_master_p1_we_n;
assign main_ethernetsoc_a7ddrphy_dfi_p1_cke = main_ethernetsoc_sdram_master_p1_cke;
assign main_ethernetsoc_a7ddrphy_dfi_p1_odt = main_ethernetsoc_sdram_master_p1_odt;
assign main_ethernetsoc_a7ddrphy_dfi_p1_reset_n = main_ethernetsoc_sdram_master_p1_reset_n;
assign main_ethernetsoc_a7ddrphy_dfi_p1_act_n = main_ethernetsoc_sdram_master_p1_act_n;
assign main_ethernetsoc_a7ddrphy_dfi_p1_wrdata = main_ethernetsoc_sdram_master_p1_wrdata;
assign main_ethernetsoc_a7ddrphy_dfi_p1_wrdata_en = main_ethernetsoc_sdram_master_p1_wrdata_en;
assign main_ethernetsoc_a7ddrphy_dfi_p1_wrdata_mask = main_ethernetsoc_sdram_master_p1_wrdata_mask;
assign main_ethernetsoc_a7ddrphy_dfi_p1_rddata_en = main_ethernetsoc_sdram_master_p1_rddata_en;
assign main_ethernetsoc_sdram_master_p1_rddata = main_ethernetsoc_a7ddrphy_dfi_p1_rddata;
assign main_ethernetsoc_sdram_master_p1_rddata_valid = main_ethernetsoc_a7ddrphy_dfi_p1_rddata_valid;
assign main_ethernetsoc_a7ddrphy_dfi_p2_address = main_ethernetsoc_sdram_master_p2_address;
assign main_ethernetsoc_a7ddrphy_dfi_p2_bank = main_ethernetsoc_sdram_master_p2_bank;
assign main_ethernetsoc_a7ddrphy_dfi_p2_cas_n = main_ethernetsoc_sdram_master_p2_cas_n;
assign main_ethernetsoc_a7ddrphy_dfi_p2_cs_n = main_ethernetsoc_sdram_master_p2_cs_n;
assign main_ethernetsoc_a7ddrphy_dfi_p2_ras_n = main_ethernetsoc_sdram_master_p2_ras_n;
assign main_ethernetsoc_a7ddrphy_dfi_p2_we_n = main_ethernetsoc_sdram_master_p2_we_n;
assign main_ethernetsoc_a7ddrphy_dfi_p2_cke = main_ethernetsoc_sdram_master_p2_cke;
assign main_ethernetsoc_a7ddrphy_dfi_p2_odt = main_ethernetsoc_sdram_master_p2_odt;
assign main_ethernetsoc_a7ddrphy_dfi_p2_reset_n = main_ethernetsoc_sdram_master_p2_reset_n;
assign main_ethernetsoc_a7ddrphy_dfi_p2_act_n = main_ethernetsoc_sdram_master_p2_act_n;
assign main_ethernetsoc_a7ddrphy_dfi_p2_wrdata = main_ethernetsoc_sdram_master_p2_wrdata;
assign main_ethernetsoc_a7ddrphy_dfi_p2_wrdata_en = main_ethernetsoc_sdram_master_p2_wrdata_en;
assign main_ethernetsoc_a7ddrphy_dfi_p2_wrdata_mask = main_ethernetsoc_sdram_master_p2_wrdata_mask;
assign main_ethernetsoc_a7ddrphy_dfi_p2_rddata_en = main_ethernetsoc_sdram_master_p2_rddata_en;
assign main_ethernetsoc_sdram_master_p2_rddata = main_ethernetsoc_a7ddrphy_dfi_p2_rddata;
assign main_ethernetsoc_sdram_master_p2_rddata_valid = main_ethernetsoc_a7ddrphy_dfi_p2_rddata_valid;
assign main_ethernetsoc_a7ddrphy_dfi_p3_address = main_ethernetsoc_sdram_master_p3_address;
assign main_ethernetsoc_a7ddrphy_dfi_p3_bank = main_ethernetsoc_sdram_master_p3_bank;
assign main_ethernetsoc_a7ddrphy_dfi_p3_cas_n = main_ethernetsoc_sdram_master_p3_cas_n;
assign main_ethernetsoc_a7ddrphy_dfi_p3_cs_n = main_ethernetsoc_sdram_master_p3_cs_n;
assign main_ethernetsoc_a7ddrphy_dfi_p3_ras_n = main_ethernetsoc_sdram_master_p3_ras_n;
assign main_ethernetsoc_a7ddrphy_dfi_p3_we_n = main_ethernetsoc_sdram_master_p3_we_n;
assign main_ethernetsoc_a7ddrphy_dfi_p3_cke = main_ethernetsoc_sdram_master_p3_cke;
assign main_ethernetsoc_a7ddrphy_dfi_p3_odt = main_ethernetsoc_sdram_master_p3_odt;
assign main_ethernetsoc_a7ddrphy_dfi_p3_reset_n = main_ethernetsoc_sdram_master_p3_reset_n;
assign main_ethernetsoc_a7ddrphy_dfi_p3_act_n = main_ethernetsoc_sdram_master_p3_act_n;
assign main_ethernetsoc_a7ddrphy_dfi_p3_wrdata = main_ethernetsoc_sdram_master_p3_wrdata;
assign main_ethernetsoc_a7ddrphy_dfi_p3_wrdata_en = main_ethernetsoc_sdram_master_p3_wrdata_en;
assign main_ethernetsoc_a7ddrphy_dfi_p3_wrdata_mask = main_ethernetsoc_sdram_master_p3_wrdata_mask;
assign main_ethernetsoc_a7ddrphy_dfi_p3_rddata_en = main_ethernetsoc_sdram_master_p3_rddata_en;
assign main_ethernetsoc_sdram_master_p3_rddata = main_ethernetsoc_a7ddrphy_dfi_p3_rddata;
assign main_ethernetsoc_sdram_master_p3_rddata_valid = main_ethernetsoc_a7ddrphy_dfi_p3_rddata_valid;
assign main_ethernetsoc_sdram_slave_p0_address = main_ethernetsoc_sdram_dfi_p0_address;
assign main_ethernetsoc_sdram_slave_p0_bank = main_ethernetsoc_sdram_dfi_p0_bank;
assign main_ethernetsoc_sdram_slave_p0_cas_n = main_ethernetsoc_sdram_dfi_p0_cas_n;
assign main_ethernetsoc_sdram_slave_p0_cs_n = main_ethernetsoc_sdram_dfi_p0_cs_n;
assign main_ethernetsoc_sdram_slave_p0_ras_n = main_ethernetsoc_sdram_dfi_p0_ras_n;
assign main_ethernetsoc_sdram_slave_p0_we_n = main_ethernetsoc_sdram_dfi_p0_we_n;
assign main_ethernetsoc_sdram_slave_p0_cke = main_ethernetsoc_sdram_dfi_p0_cke;
assign main_ethernetsoc_sdram_slave_p0_odt = main_ethernetsoc_sdram_dfi_p0_odt;
assign main_ethernetsoc_sdram_slave_p0_reset_n = main_ethernetsoc_sdram_dfi_p0_reset_n;
assign main_ethernetsoc_sdram_slave_p0_act_n = main_ethernetsoc_sdram_dfi_p0_act_n;
assign main_ethernetsoc_sdram_slave_p0_wrdata = main_ethernetsoc_sdram_dfi_p0_wrdata;
assign main_ethernetsoc_sdram_slave_p0_wrdata_en = main_ethernetsoc_sdram_dfi_p0_wrdata_en;
assign main_ethernetsoc_sdram_slave_p0_wrdata_mask = main_ethernetsoc_sdram_dfi_p0_wrdata_mask;
assign main_ethernetsoc_sdram_slave_p0_rddata_en = main_ethernetsoc_sdram_dfi_p0_rddata_en;
assign main_ethernetsoc_sdram_dfi_p0_rddata = main_ethernetsoc_sdram_slave_p0_rddata;
assign main_ethernetsoc_sdram_dfi_p0_rddata_valid = main_ethernetsoc_sdram_slave_p0_rddata_valid;
assign main_ethernetsoc_sdram_slave_p1_address = main_ethernetsoc_sdram_dfi_p1_address;
assign main_ethernetsoc_sdram_slave_p1_bank = main_ethernetsoc_sdram_dfi_p1_bank;
assign main_ethernetsoc_sdram_slave_p1_cas_n = main_ethernetsoc_sdram_dfi_p1_cas_n;
assign main_ethernetsoc_sdram_slave_p1_cs_n = main_ethernetsoc_sdram_dfi_p1_cs_n;
assign main_ethernetsoc_sdram_slave_p1_ras_n = main_ethernetsoc_sdram_dfi_p1_ras_n;
assign main_ethernetsoc_sdram_slave_p1_we_n = main_ethernetsoc_sdram_dfi_p1_we_n;
assign main_ethernetsoc_sdram_slave_p1_cke = main_ethernetsoc_sdram_dfi_p1_cke;
assign main_ethernetsoc_sdram_slave_p1_odt = main_ethernetsoc_sdram_dfi_p1_odt;
assign main_ethernetsoc_sdram_slave_p1_reset_n = main_ethernetsoc_sdram_dfi_p1_reset_n;
assign main_ethernetsoc_sdram_slave_p1_act_n = main_ethernetsoc_sdram_dfi_p1_act_n;
assign main_ethernetsoc_sdram_slave_p1_wrdata = main_ethernetsoc_sdram_dfi_p1_wrdata;
assign main_ethernetsoc_sdram_slave_p1_wrdata_en = main_ethernetsoc_sdram_dfi_p1_wrdata_en;
assign main_ethernetsoc_sdram_slave_p1_wrdata_mask = main_ethernetsoc_sdram_dfi_p1_wrdata_mask;
assign main_ethernetsoc_sdram_slave_p1_rddata_en = main_ethernetsoc_sdram_dfi_p1_rddata_en;
assign main_ethernetsoc_sdram_dfi_p1_rddata = main_ethernetsoc_sdram_slave_p1_rddata;
assign main_ethernetsoc_sdram_dfi_p1_rddata_valid = main_ethernetsoc_sdram_slave_p1_rddata_valid;
assign main_ethernetsoc_sdram_slave_p2_address = main_ethernetsoc_sdram_dfi_p2_address;
assign main_ethernetsoc_sdram_slave_p2_bank = main_ethernetsoc_sdram_dfi_p2_bank;
assign main_ethernetsoc_sdram_slave_p2_cas_n = main_ethernetsoc_sdram_dfi_p2_cas_n;
assign main_ethernetsoc_sdram_slave_p2_cs_n = main_ethernetsoc_sdram_dfi_p2_cs_n;
assign main_ethernetsoc_sdram_slave_p2_ras_n = main_ethernetsoc_sdram_dfi_p2_ras_n;
assign main_ethernetsoc_sdram_slave_p2_we_n = main_ethernetsoc_sdram_dfi_p2_we_n;
assign main_ethernetsoc_sdram_slave_p2_cke = main_ethernetsoc_sdram_dfi_p2_cke;
assign main_ethernetsoc_sdram_slave_p2_odt = main_ethernetsoc_sdram_dfi_p2_odt;
assign main_ethernetsoc_sdram_slave_p2_reset_n = main_ethernetsoc_sdram_dfi_p2_reset_n;
assign main_ethernetsoc_sdram_slave_p2_act_n = main_ethernetsoc_sdram_dfi_p2_act_n;
assign main_ethernetsoc_sdram_slave_p2_wrdata = main_ethernetsoc_sdram_dfi_p2_wrdata;
assign main_ethernetsoc_sdram_slave_p2_wrdata_en = main_ethernetsoc_sdram_dfi_p2_wrdata_en;
assign main_ethernetsoc_sdram_slave_p2_wrdata_mask = main_ethernetsoc_sdram_dfi_p2_wrdata_mask;
assign main_ethernetsoc_sdram_slave_p2_rddata_en = main_ethernetsoc_sdram_dfi_p2_rddata_en;
assign main_ethernetsoc_sdram_dfi_p2_rddata = main_ethernetsoc_sdram_slave_p2_rddata;
assign main_ethernetsoc_sdram_dfi_p2_rddata_valid = main_ethernetsoc_sdram_slave_p2_rddata_valid;
assign main_ethernetsoc_sdram_slave_p3_address = main_ethernetsoc_sdram_dfi_p3_address;
assign main_ethernetsoc_sdram_slave_p3_bank = main_ethernetsoc_sdram_dfi_p3_bank;
assign main_ethernetsoc_sdram_slave_p3_cas_n = main_ethernetsoc_sdram_dfi_p3_cas_n;
assign main_ethernetsoc_sdram_slave_p3_cs_n = main_ethernetsoc_sdram_dfi_p3_cs_n;
assign main_ethernetsoc_sdram_slave_p3_ras_n = main_ethernetsoc_sdram_dfi_p3_ras_n;
assign main_ethernetsoc_sdram_slave_p3_we_n = main_ethernetsoc_sdram_dfi_p3_we_n;
assign main_ethernetsoc_sdram_slave_p3_cke = main_ethernetsoc_sdram_dfi_p3_cke;
assign main_ethernetsoc_sdram_slave_p3_odt = main_ethernetsoc_sdram_dfi_p3_odt;
assign main_ethernetsoc_sdram_slave_p3_reset_n = main_ethernetsoc_sdram_dfi_p3_reset_n;
assign main_ethernetsoc_sdram_slave_p3_act_n = main_ethernetsoc_sdram_dfi_p3_act_n;
assign main_ethernetsoc_sdram_slave_p3_wrdata = main_ethernetsoc_sdram_dfi_p3_wrdata;
assign main_ethernetsoc_sdram_slave_p3_wrdata_en = main_ethernetsoc_sdram_dfi_p3_wrdata_en;
assign main_ethernetsoc_sdram_slave_p3_wrdata_mask = main_ethernetsoc_sdram_dfi_p3_wrdata_mask;
assign main_ethernetsoc_sdram_slave_p3_rddata_en = main_ethernetsoc_sdram_dfi_p3_rddata_en;
assign main_ethernetsoc_sdram_dfi_p3_rddata = main_ethernetsoc_sdram_slave_p3_rddata;
assign main_ethernetsoc_sdram_dfi_p3_rddata_valid = main_ethernetsoc_sdram_slave_p3_rddata_valid;
always @(*) begin
	main_ethernetsoc_sdram_slave_p2_rddata <= 32'd0;
	main_ethernetsoc_sdram_slave_p2_rddata_valid <= 1'd0;
	main_ethernetsoc_sdram_slave_p3_rddata <= 32'd0;
	main_ethernetsoc_sdram_slave_p3_rddata_valid <= 1'd0;
	main_ethernetsoc_sdram_inti_p0_rddata <= 32'd0;
	main_ethernetsoc_sdram_inti_p0_rddata_valid <= 1'd0;
	main_ethernetsoc_sdram_master_p0_address <= 14'd0;
	main_ethernetsoc_sdram_master_p0_bank <= 3'd0;
	main_ethernetsoc_sdram_master_p0_cas_n <= 1'd1;
	main_ethernetsoc_sdram_master_p0_cs_n <= 1'd1;
	main_ethernetsoc_sdram_master_p0_ras_n <= 1'd1;
	main_ethernetsoc_sdram_master_p0_we_n <= 1'd1;
	main_ethernetsoc_sdram_master_p0_cke <= 1'd0;
	main_ethernetsoc_sdram_master_p0_odt <= 1'd0;
	main_ethernetsoc_sdram_master_p0_reset_n <= 1'd0;
	main_ethernetsoc_sdram_master_p0_act_n <= 1'd1;
	main_ethernetsoc_sdram_master_p0_wrdata <= 32'd0;
	main_ethernetsoc_sdram_inti_p1_rddata <= 32'd0;
	main_ethernetsoc_sdram_master_p0_wrdata_en <= 1'd0;
	main_ethernetsoc_sdram_inti_p1_rddata_valid <= 1'd0;
	main_ethernetsoc_sdram_master_p0_wrdata_mask <= 4'd0;
	main_ethernetsoc_sdram_master_p0_rddata_en <= 1'd0;
	main_ethernetsoc_sdram_master_p1_address <= 14'd0;
	main_ethernetsoc_sdram_master_p1_bank <= 3'd0;
	main_ethernetsoc_sdram_master_p1_cas_n <= 1'd1;
	main_ethernetsoc_sdram_master_p1_cs_n <= 1'd1;
	main_ethernetsoc_sdram_master_p1_ras_n <= 1'd1;
	main_ethernetsoc_sdram_master_p1_we_n <= 1'd1;
	main_ethernetsoc_sdram_master_p1_cke <= 1'd0;
	main_ethernetsoc_sdram_master_p1_odt <= 1'd0;
	main_ethernetsoc_sdram_master_p1_reset_n <= 1'd0;
	main_ethernetsoc_sdram_master_p1_act_n <= 1'd1;
	main_ethernetsoc_sdram_master_p1_wrdata <= 32'd0;
	main_ethernetsoc_sdram_inti_p2_rddata <= 32'd0;
	main_ethernetsoc_sdram_master_p1_wrdata_en <= 1'd0;
	main_ethernetsoc_sdram_inti_p2_rddata_valid <= 1'd0;
	main_ethernetsoc_sdram_master_p1_wrdata_mask <= 4'd0;
	main_ethernetsoc_sdram_master_p1_rddata_en <= 1'd0;
	main_ethernetsoc_sdram_master_p2_address <= 14'd0;
	main_ethernetsoc_sdram_master_p2_bank <= 3'd0;
	main_ethernetsoc_sdram_master_p2_cas_n <= 1'd1;
	main_ethernetsoc_sdram_master_p2_cs_n <= 1'd1;
	main_ethernetsoc_sdram_master_p2_ras_n <= 1'd1;
	main_ethernetsoc_sdram_master_p2_we_n <= 1'd1;
	main_ethernetsoc_sdram_master_p2_cke <= 1'd0;
	main_ethernetsoc_sdram_master_p2_odt <= 1'd0;
	main_ethernetsoc_sdram_master_p2_reset_n <= 1'd0;
	main_ethernetsoc_sdram_master_p2_act_n <= 1'd1;
	main_ethernetsoc_sdram_master_p2_wrdata <= 32'd0;
	main_ethernetsoc_sdram_inti_p3_rddata <= 32'd0;
	main_ethernetsoc_sdram_master_p2_wrdata_en <= 1'd0;
	main_ethernetsoc_sdram_inti_p3_rddata_valid <= 1'd0;
	main_ethernetsoc_sdram_master_p2_wrdata_mask <= 4'd0;
	main_ethernetsoc_sdram_master_p2_rddata_en <= 1'd0;
	main_ethernetsoc_sdram_master_p3_address <= 14'd0;
	main_ethernetsoc_sdram_master_p3_bank <= 3'd0;
	main_ethernetsoc_sdram_master_p3_cas_n <= 1'd1;
	main_ethernetsoc_sdram_master_p3_cs_n <= 1'd1;
	main_ethernetsoc_sdram_master_p3_ras_n <= 1'd1;
	main_ethernetsoc_sdram_master_p3_we_n <= 1'd1;
	main_ethernetsoc_sdram_master_p3_cke <= 1'd0;
	main_ethernetsoc_sdram_master_p3_odt <= 1'd0;
	main_ethernetsoc_sdram_master_p3_reset_n <= 1'd0;
	main_ethernetsoc_sdram_master_p3_act_n <= 1'd1;
	main_ethernetsoc_sdram_master_p3_wrdata <= 32'd0;
	main_ethernetsoc_sdram_master_p3_wrdata_en <= 1'd0;
	main_ethernetsoc_sdram_master_p3_wrdata_mask <= 4'd0;
	main_ethernetsoc_sdram_master_p3_rddata_en <= 1'd0;
	main_ethernetsoc_sdram_slave_p0_rddata <= 32'd0;
	main_ethernetsoc_sdram_slave_p0_rddata_valid <= 1'd0;
	main_ethernetsoc_sdram_slave_p1_rddata <= 32'd0;
	main_ethernetsoc_sdram_slave_p1_rddata_valid <= 1'd0;
	if (main_ethernetsoc_sdram_storage[0]) begin
		main_ethernetsoc_sdram_master_p0_address <= main_ethernetsoc_sdram_slave_p0_address;
		main_ethernetsoc_sdram_master_p0_bank <= main_ethernetsoc_sdram_slave_p0_bank;
		main_ethernetsoc_sdram_master_p0_cas_n <= main_ethernetsoc_sdram_slave_p0_cas_n;
		main_ethernetsoc_sdram_master_p0_cs_n <= main_ethernetsoc_sdram_slave_p0_cs_n;
		main_ethernetsoc_sdram_master_p0_ras_n <= main_ethernetsoc_sdram_slave_p0_ras_n;
		main_ethernetsoc_sdram_master_p0_we_n <= main_ethernetsoc_sdram_slave_p0_we_n;
		main_ethernetsoc_sdram_master_p0_cke <= main_ethernetsoc_sdram_slave_p0_cke;
		main_ethernetsoc_sdram_master_p0_odt <= main_ethernetsoc_sdram_slave_p0_odt;
		main_ethernetsoc_sdram_master_p0_reset_n <= main_ethernetsoc_sdram_slave_p0_reset_n;
		main_ethernetsoc_sdram_master_p0_act_n <= main_ethernetsoc_sdram_slave_p0_act_n;
		main_ethernetsoc_sdram_master_p0_wrdata <= main_ethernetsoc_sdram_slave_p0_wrdata;
		main_ethernetsoc_sdram_master_p0_wrdata_en <= main_ethernetsoc_sdram_slave_p0_wrdata_en;
		main_ethernetsoc_sdram_master_p0_wrdata_mask <= main_ethernetsoc_sdram_slave_p0_wrdata_mask;
		main_ethernetsoc_sdram_master_p0_rddata_en <= main_ethernetsoc_sdram_slave_p0_rddata_en;
		main_ethernetsoc_sdram_slave_p0_rddata <= main_ethernetsoc_sdram_master_p0_rddata;
		main_ethernetsoc_sdram_slave_p0_rddata_valid <= main_ethernetsoc_sdram_master_p0_rddata_valid;
		main_ethernetsoc_sdram_master_p1_address <= main_ethernetsoc_sdram_slave_p1_address;
		main_ethernetsoc_sdram_master_p1_bank <= main_ethernetsoc_sdram_slave_p1_bank;
		main_ethernetsoc_sdram_master_p1_cas_n <= main_ethernetsoc_sdram_slave_p1_cas_n;
		main_ethernetsoc_sdram_master_p1_cs_n <= main_ethernetsoc_sdram_slave_p1_cs_n;
		main_ethernetsoc_sdram_master_p1_ras_n <= main_ethernetsoc_sdram_slave_p1_ras_n;
		main_ethernetsoc_sdram_master_p1_we_n <= main_ethernetsoc_sdram_slave_p1_we_n;
		main_ethernetsoc_sdram_master_p1_cke <= main_ethernetsoc_sdram_slave_p1_cke;
		main_ethernetsoc_sdram_master_p1_odt <= main_ethernetsoc_sdram_slave_p1_odt;
		main_ethernetsoc_sdram_master_p1_reset_n <= main_ethernetsoc_sdram_slave_p1_reset_n;
		main_ethernetsoc_sdram_master_p1_act_n <= main_ethernetsoc_sdram_slave_p1_act_n;
		main_ethernetsoc_sdram_master_p1_wrdata <= main_ethernetsoc_sdram_slave_p1_wrdata;
		main_ethernetsoc_sdram_master_p1_wrdata_en <= main_ethernetsoc_sdram_slave_p1_wrdata_en;
		main_ethernetsoc_sdram_master_p1_wrdata_mask <= main_ethernetsoc_sdram_slave_p1_wrdata_mask;
		main_ethernetsoc_sdram_master_p1_rddata_en <= main_ethernetsoc_sdram_slave_p1_rddata_en;
		main_ethernetsoc_sdram_slave_p1_rddata <= main_ethernetsoc_sdram_master_p1_rddata;
		main_ethernetsoc_sdram_slave_p1_rddata_valid <= main_ethernetsoc_sdram_master_p1_rddata_valid;
		main_ethernetsoc_sdram_master_p2_address <= main_ethernetsoc_sdram_slave_p2_address;
		main_ethernetsoc_sdram_master_p2_bank <= main_ethernetsoc_sdram_slave_p2_bank;
		main_ethernetsoc_sdram_master_p2_cas_n <= main_ethernetsoc_sdram_slave_p2_cas_n;
		main_ethernetsoc_sdram_master_p2_cs_n <= main_ethernetsoc_sdram_slave_p2_cs_n;
		main_ethernetsoc_sdram_master_p2_ras_n <= main_ethernetsoc_sdram_slave_p2_ras_n;
		main_ethernetsoc_sdram_master_p2_we_n <= main_ethernetsoc_sdram_slave_p2_we_n;
		main_ethernetsoc_sdram_master_p2_cke <= main_ethernetsoc_sdram_slave_p2_cke;
		main_ethernetsoc_sdram_master_p2_odt <= main_ethernetsoc_sdram_slave_p2_odt;
		main_ethernetsoc_sdram_master_p2_reset_n <= main_ethernetsoc_sdram_slave_p2_reset_n;
		main_ethernetsoc_sdram_master_p2_act_n <= main_ethernetsoc_sdram_slave_p2_act_n;
		main_ethernetsoc_sdram_master_p2_wrdata <= main_ethernetsoc_sdram_slave_p2_wrdata;
		main_ethernetsoc_sdram_master_p2_wrdata_en <= main_ethernetsoc_sdram_slave_p2_wrdata_en;
		main_ethernetsoc_sdram_master_p2_wrdata_mask <= main_ethernetsoc_sdram_slave_p2_wrdata_mask;
		main_ethernetsoc_sdram_master_p2_rddata_en <= main_ethernetsoc_sdram_slave_p2_rddata_en;
		main_ethernetsoc_sdram_slave_p2_rddata <= main_ethernetsoc_sdram_master_p2_rddata;
		main_ethernetsoc_sdram_slave_p2_rddata_valid <= main_ethernetsoc_sdram_master_p2_rddata_valid;
		main_ethernetsoc_sdram_master_p3_address <= main_ethernetsoc_sdram_slave_p3_address;
		main_ethernetsoc_sdram_master_p3_bank <= main_ethernetsoc_sdram_slave_p3_bank;
		main_ethernetsoc_sdram_master_p3_cas_n <= main_ethernetsoc_sdram_slave_p3_cas_n;
		main_ethernetsoc_sdram_master_p3_cs_n <= main_ethernetsoc_sdram_slave_p3_cs_n;
		main_ethernetsoc_sdram_master_p3_ras_n <= main_ethernetsoc_sdram_slave_p3_ras_n;
		main_ethernetsoc_sdram_master_p3_we_n <= main_ethernetsoc_sdram_slave_p3_we_n;
		main_ethernetsoc_sdram_master_p3_cke <= main_ethernetsoc_sdram_slave_p3_cke;
		main_ethernetsoc_sdram_master_p3_odt <= main_ethernetsoc_sdram_slave_p3_odt;
		main_ethernetsoc_sdram_master_p3_reset_n <= main_ethernetsoc_sdram_slave_p3_reset_n;
		main_ethernetsoc_sdram_master_p3_act_n <= main_ethernetsoc_sdram_slave_p3_act_n;
		main_ethernetsoc_sdram_master_p3_wrdata <= main_ethernetsoc_sdram_slave_p3_wrdata;
		main_ethernetsoc_sdram_master_p3_wrdata_en <= main_ethernetsoc_sdram_slave_p3_wrdata_en;
		main_ethernetsoc_sdram_master_p3_wrdata_mask <= main_ethernetsoc_sdram_slave_p3_wrdata_mask;
		main_ethernetsoc_sdram_master_p3_rddata_en <= main_ethernetsoc_sdram_slave_p3_rddata_en;
		main_ethernetsoc_sdram_slave_p3_rddata <= main_ethernetsoc_sdram_master_p3_rddata;
		main_ethernetsoc_sdram_slave_p3_rddata_valid <= main_ethernetsoc_sdram_master_p3_rddata_valid;
	end else begin
		main_ethernetsoc_sdram_master_p0_address <= main_ethernetsoc_sdram_inti_p0_address;
		main_ethernetsoc_sdram_master_p0_bank <= main_ethernetsoc_sdram_inti_p0_bank;
		main_ethernetsoc_sdram_master_p0_cas_n <= main_ethernetsoc_sdram_inti_p0_cas_n;
		main_ethernetsoc_sdram_master_p0_cs_n <= main_ethernetsoc_sdram_inti_p0_cs_n;
		main_ethernetsoc_sdram_master_p0_ras_n <= main_ethernetsoc_sdram_inti_p0_ras_n;
		main_ethernetsoc_sdram_master_p0_we_n <= main_ethernetsoc_sdram_inti_p0_we_n;
		main_ethernetsoc_sdram_master_p0_cke <= main_ethernetsoc_sdram_inti_p0_cke;
		main_ethernetsoc_sdram_master_p0_odt <= main_ethernetsoc_sdram_inti_p0_odt;
		main_ethernetsoc_sdram_master_p0_reset_n <= main_ethernetsoc_sdram_inti_p0_reset_n;
		main_ethernetsoc_sdram_master_p0_act_n <= main_ethernetsoc_sdram_inti_p0_act_n;
		main_ethernetsoc_sdram_master_p0_wrdata <= main_ethernetsoc_sdram_inti_p0_wrdata;
		main_ethernetsoc_sdram_master_p0_wrdata_en <= main_ethernetsoc_sdram_inti_p0_wrdata_en;
		main_ethernetsoc_sdram_master_p0_wrdata_mask <= main_ethernetsoc_sdram_inti_p0_wrdata_mask;
		main_ethernetsoc_sdram_master_p0_rddata_en <= main_ethernetsoc_sdram_inti_p0_rddata_en;
		main_ethernetsoc_sdram_inti_p0_rddata <= main_ethernetsoc_sdram_master_p0_rddata;
		main_ethernetsoc_sdram_inti_p0_rddata_valid <= main_ethernetsoc_sdram_master_p0_rddata_valid;
		main_ethernetsoc_sdram_master_p1_address <= main_ethernetsoc_sdram_inti_p1_address;
		main_ethernetsoc_sdram_master_p1_bank <= main_ethernetsoc_sdram_inti_p1_bank;
		main_ethernetsoc_sdram_master_p1_cas_n <= main_ethernetsoc_sdram_inti_p1_cas_n;
		main_ethernetsoc_sdram_master_p1_cs_n <= main_ethernetsoc_sdram_inti_p1_cs_n;
		main_ethernetsoc_sdram_master_p1_ras_n <= main_ethernetsoc_sdram_inti_p1_ras_n;
		main_ethernetsoc_sdram_master_p1_we_n <= main_ethernetsoc_sdram_inti_p1_we_n;
		main_ethernetsoc_sdram_master_p1_cke <= main_ethernetsoc_sdram_inti_p1_cke;
		main_ethernetsoc_sdram_master_p1_odt <= main_ethernetsoc_sdram_inti_p1_odt;
		main_ethernetsoc_sdram_master_p1_reset_n <= main_ethernetsoc_sdram_inti_p1_reset_n;
		main_ethernetsoc_sdram_master_p1_act_n <= main_ethernetsoc_sdram_inti_p1_act_n;
		main_ethernetsoc_sdram_master_p1_wrdata <= main_ethernetsoc_sdram_inti_p1_wrdata;
		main_ethernetsoc_sdram_master_p1_wrdata_en <= main_ethernetsoc_sdram_inti_p1_wrdata_en;
		main_ethernetsoc_sdram_master_p1_wrdata_mask <= main_ethernetsoc_sdram_inti_p1_wrdata_mask;
		main_ethernetsoc_sdram_master_p1_rddata_en <= main_ethernetsoc_sdram_inti_p1_rddata_en;
		main_ethernetsoc_sdram_inti_p1_rddata <= main_ethernetsoc_sdram_master_p1_rddata;
		main_ethernetsoc_sdram_inti_p1_rddata_valid <= main_ethernetsoc_sdram_master_p1_rddata_valid;
		main_ethernetsoc_sdram_master_p2_address <= main_ethernetsoc_sdram_inti_p2_address;
		main_ethernetsoc_sdram_master_p2_bank <= main_ethernetsoc_sdram_inti_p2_bank;
		main_ethernetsoc_sdram_master_p2_cas_n <= main_ethernetsoc_sdram_inti_p2_cas_n;
		main_ethernetsoc_sdram_master_p2_cs_n <= main_ethernetsoc_sdram_inti_p2_cs_n;
		main_ethernetsoc_sdram_master_p2_ras_n <= main_ethernetsoc_sdram_inti_p2_ras_n;
		main_ethernetsoc_sdram_master_p2_we_n <= main_ethernetsoc_sdram_inti_p2_we_n;
		main_ethernetsoc_sdram_master_p2_cke <= main_ethernetsoc_sdram_inti_p2_cke;
		main_ethernetsoc_sdram_master_p2_odt <= main_ethernetsoc_sdram_inti_p2_odt;
		main_ethernetsoc_sdram_master_p2_reset_n <= main_ethernetsoc_sdram_inti_p2_reset_n;
		main_ethernetsoc_sdram_master_p2_act_n <= main_ethernetsoc_sdram_inti_p2_act_n;
		main_ethernetsoc_sdram_master_p2_wrdata <= main_ethernetsoc_sdram_inti_p2_wrdata;
		main_ethernetsoc_sdram_master_p2_wrdata_en <= main_ethernetsoc_sdram_inti_p2_wrdata_en;
		main_ethernetsoc_sdram_master_p2_wrdata_mask <= main_ethernetsoc_sdram_inti_p2_wrdata_mask;
		main_ethernetsoc_sdram_master_p2_rddata_en <= main_ethernetsoc_sdram_inti_p2_rddata_en;
		main_ethernetsoc_sdram_inti_p2_rddata <= main_ethernetsoc_sdram_master_p2_rddata;
		main_ethernetsoc_sdram_inti_p2_rddata_valid <= main_ethernetsoc_sdram_master_p2_rddata_valid;
		main_ethernetsoc_sdram_master_p3_address <= main_ethernetsoc_sdram_inti_p3_address;
		main_ethernetsoc_sdram_master_p3_bank <= main_ethernetsoc_sdram_inti_p3_bank;
		main_ethernetsoc_sdram_master_p3_cas_n <= main_ethernetsoc_sdram_inti_p3_cas_n;
		main_ethernetsoc_sdram_master_p3_cs_n <= main_ethernetsoc_sdram_inti_p3_cs_n;
		main_ethernetsoc_sdram_master_p3_ras_n <= main_ethernetsoc_sdram_inti_p3_ras_n;
		main_ethernetsoc_sdram_master_p3_we_n <= main_ethernetsoc_sdram_inti_p3_we_n;
		main_ethernetsoc_sdram_master_p3_cke <= main_ethernetsoc_sdram_inti_p3_cke;
		main_ethernetsoc_sdram_master_p3_odt <= main_ethernetsoc_sdram_inti_p3_odt;
		main_ethernetsoc_sdram_master_p3_reset_n <= main_ethernetsoc_sdram_inti_p3_reset_n;
		main_ethernetsoc_sdram_master_p3_act_n <= main_ethernetsoc_sdram_inti_p3_act_n;
		main_ethernetsoc_sdram_master_p3_wrdata <= main_ethernetsoc_sdram_inti_p3_wrdata;
		main_ethernetsoc_sdram_master_p3_wrdata_en <= main_ethernetsoc_sdram_inti_p3_wrdata_en;
		main_ethernetsoc_sdram_master_p3_wrdata_mask <= main_ethernetsoc_sdram_inti_p3_wrdata_mask;
		main_ethernetsoc_sdram_master_p3_rddata_en <= main_ethernetsoc_sdram_inti_p3_rddata_en;
		main_ethernetsoc_sdram_inti_p3_rddata <= main_ethernetsoc_sdram_master_p3_rddata;
		main_ethernetsoc_sdram_inti_p3_rddata_valid <= main_ethernetsoc_sdram_master_p3_rddata_valid;
	end
end
assign main_ethernetsoc_sdram_inti_p0_cke = main_ethernetsoc_sdram_storage[1];
assign main_ethernetsoc_sdram_inti_p1_cke = main_ethernetsoc_sdram_storage[1];
assign main_ethernetsoc_sdram_inti_p2_cke = main_ethernetsoc_sdram_storage[1];
assign main_ethernetsoc_sdram_inti_p3_cke = main_ethernetsoc_sdram_storage[1];
assign main_ethernetsoc_sdram_inti_p0_odt = main_ethernetsoc_sdram_storage[2];
assign main_ethernetsoc_sdram_inti_p1_odt = main_ethernetsoc_sdram_storage[2];
assign main_ethernetsoc_sdram_inti_p2_odt = main_ethernetsoc_sdram_storage[2];
assign main_ethernetsoc_sdram_inti_p3_odt = main_ethernetsoc_sdram_storage[2];
assign main_ethernetsoc_sdram_inti_p0_reset_n = main_ethernetsoc_sdram_storage[3];
assign main_ethernetsoc_sdram_inti_p1_reset_n = main_ethernetsoc_sdram_storage[3];
assign main_ethernetsoc_sdram_inti_p2_reset_n = main_ethernetsoc_sdram_storage[3];
assign main_ethernetsoc_sdram_inti_p3_reset_n = main_ethernetsoc_sdram_storage[3];
always @(*) begin
	main_ethernetsoc_sdram_inti_p0_we_n <= 1'd1;
	main_ethernetsoc_sdram_inti_p0_cas_n <= 1'd1;
	main_ethernetsoc_sdram_inti_p0_cs_n <= 1'd1;
	main_ethernetsoc_sdram_inti_p0_ras_n <= 1'd1;
	if (main_ethernetsoc_sdram_phaseinjector0_command_issue_re) begin
		main_ethernetsoc_sdram_inti_p0_cs_n <= {1{(~main_ethernetsoc_sdram_phaseinjector0_command_storage[0])}};
		main_ethernetsoc_sdram_inti_p0_we_n <= (~main_ethernetsoc_sdram_phaseinjector0_command_storage[1]);
		main_ethernetsoc_sdram_inti_p0_cas_n <= (~main_ethernetsoc_sdram_phaseinjector0_command_storage[2]);
		main_ethernetsoc_sdram_inti_p0_ras_n <= (~main_ethernetsoc_sdram_phaseinjector0_command_storage[3]);
	end else begin
		main_ethernetsoc_sdram_inti_p0_cs_n <= {1{1'd1}};
		main_ethernetsoc_sdram_inti_p0_we_n <= 1'd1;
		main_ethernetsoc_sdram_inti_p0_cas_n <= 1'd1;
		main_ethernetsoc_sdram_inti_p0_ras_n <= 1'd1;
	end
end
assign main_ethernetsoc_sdram_inti_p0_address = main_ethernetsoc_sdram_phaseinjector0_address_storage;
assign main_ethernetsoc_sdram_inti_p0_bank = main_ethernetsoc_sdram_phaseinjector0_baddress_storage;
assign main_ethernetsoc_sdram_inti_p0_wrdata_en = (main_ethernetsoc_sdram_phaseinjector0_command_issue_re & main_ethernetsoc_sdram_phaseinjector0_command_storage[4]);
assign main_ethernetsoc_sdram_inti_p0_rddata_en = (main_ethernetsoc_sdram_phaseinjector0_command_issue_re & main_ethernetsoc_sdram_phaseinjector0_command_storage[5]);
assign main_ethernetsoc_sdram_inti_p0_wrdata = main_ethernetsoc_sdram_phaseinjector0_wrdata_storage;
assign main_ethernetsoc_sdram_inti_p0_wrdata_mask = 1'd0;
always @(*) begin
	main_ethernetsoc_sdram_inti_p1_we_n <= 1'd1;
	main_ethernetsoc_sdram_inti_p1_cas_n <= 1'd1;
	main_ethernetsoc_sdram_inti_p1_cs_n <= 1'd1;
	main_ethernetsoc_sdram_inti_p1_ras_n <= 1'd1;
	if (main_ethernetsoc_sdram_phaseinjector1_command_issue_re) begin
		main_ethernetsoc_sdram_inti_p1_cs_n <= {1{(~main_ethernetsoc_sdram_phaseinjector1_command_storage[0])}};
		main_ethernetsoc_sdram_inti_p1_we_n <= (~main_ethernetsoc_sdram_phaseinjector1_command_storage[1]);
		main_ethernetsoc_sdram_inti_p1_cas_n <= (~main_ethernetsoc_sdram_phaseinjector1_command_storage[2]);
		main_ethernetsoc_sdram_inti_p1_ras_n <= (~main_ethernetsoc_sdram_phaseinjector1_command_storage[3]);
	end else begin
		main_ethernetsoc_sdram_inti_p1_cs_n <= {1{1'd1}};
		main_ethernetsoc_sdram_inti_p1_we_n <= 1'd1;
		main_ethernetsoc_sdram_inti_p1_cas_n <= 1'd1;
		main_ethernetsoc_sdram_inti_p1_ras_n <= 1'd1;
	end
end
assign main_ethernetsoc_sdram_inti_p1_address = main_ethernetsoc_sdram_phaseinjector1_address_storage;
assign main_ethernetsoc_sdram_inti_p1_bank = main_ethernetsoc_sdram_phaseinjector1_baddress_storage;
assign main_ethernetsoc_sdram_inti_p1_wrdata_en = (main_ethernetsoc_sdram_phaseinjector1_command_issue_re & main_ethernetsoc_sdram_phaseinjector1_command_storage[4]);
assign main_ethernetsoc_sdram_inti_p1_rddata_en = (main_ethernetsoc_sdram_phaseinjector1_command_issue_re & main_ethernetsoc_sdram_phaseinjector1_command_storage[5]);
assign main_ethernetsoc_sdram_inti_p1_wrdata = main_ethernetsoc_sdram_phaseinjector1_wrdata_storage;
assign main_ethernetsoc_sdram_inti_p1_wrdata_mask = 1'd0;
always @(*) begin
	main_ethernetsoc_sdram_inti_p2_we_n <= 1'd1;
	main_ethernetsoc_sdram_inti_p2_cas_n <= 1'd1;
	main_ethernetsoc_sdram_inti_p2_cs_n <= 1'd1;
	main_ethernetsoc_sdram_inti_p2_ras_n <= 1'd1;
	if (main_ethernetsoc_sdram_phaseinjector2_command_issue_re) begin
		main_ethernetsoc_sdram_inti_p2_cs_n <= {1{(~main_ethernetsoc_sdram_phaseinjector2_command_storage[0])}};
		main_ethernetsoc_sdram_inti_p2_we_n <= (~main_ethernetsoc_sdram_phaseinjector2_command_storage[1]);
		main_ethernetsoc_sdram_inti_p2_cas_n <= (~main_ethernetsoc_sdram_phaseinjector2_command_storage[2]);
		main_ethernetsoc_sdram_inti_p2_ras_n <= (~main_ethernetsoc_sdram_phaseinjector2_command_storage[3]);
	end else begin
		main_ethernetsoc_sdram_inti_p2_cs_n <= {1{1'd1}};
		main_ethernetsoc_sdram_inti_p2_we_n <= 1'd1;
		main_ethernetsoc_sdram_inti_p2_cas_n <= 1'd1;
		main_ethernetsoc_sdram_inti_p2_ras_n <= 1'd1;
	end
end
assign main_ethernetsoc_sdram_inti_p2_address = main_ethernetsoc_sdram_phaseinjector2_address_storage;
assign main_ethernetsoc_sdram_inti_p2_bank = main_ethernetsoc_sdram_phaseinjector2_baddress_storage;
assign main_ethernetsoc_sdram_inti_p2_wrdata_en = (main_ethernetsoc_sdram_phaseinjector2_command_issue_re & main_ethernetsoc_sdram_phaseinjector2_command_storage[4]);
assign main_ethernetsoc_sdram_inti_p2_rddata_en = (main_ethernetsoc_sdram_phaseinjector2_command_issue_re & main_ethernetsoc_sdram_phaseinjector2_command_storage[5]);
assign main_ethernetsoc_sdram_inti_p2_wrdata = main_ethernetsoc_sdram_phaseinjector2_wrdata_storage;
assign main_ethernetsoc_sdram_inti_p2_wrdata_mask = 1'd0;
always @(*) begin
	main_ethernetsoc_sdram_inti_p3_we_n <= 1'd1;
	main_ethernetsoc_sdram_inti_p3_cas_n <= 1'd1;
	main_ethernetsoc_sdram_inti_p3_cs_n <= 1'd1;
	main_ethernetsoc_sdram_inti_p3_ras_n <= 1'd1;
	if (main_ethernetsoc_sdram_phaseinjector3_command_issue_re) begin
		main_ethernetsoc_sdram_inti_p3_cs_n <= {1{(~main_ethernetsoc_sdram_phaseinjector3_command_storage[0])}};
		main_ethernetsoc_sdram_inti_p3_we_n <= (~main_ethernetsoc_sdram_phaseinjector3_command_storage[1]);
		main_ethernetsoc_sdram_inti_p3_cas_n <= (~main_ethernetsoc_sdram_phaseinjector3_command_storage[2]);
		main_ethernetsoc_sdram_inti_p3_ras_n <= (~main_ethernetsoc_sdram_phaseinjector3_command_storage[3]);
	end else begin
		main_ethernetsoc_sdram_inti_p3_cs_n <= {1{1'd1}};
		main_ethernetsoc_sdram_inti_p3_we_n <= 1'd1;
		main_ethernetsoc_sdram_inti_p3_cas_n <= 1'd1;
		main_ethernetsoc_sdram_inti_p3_ras_n <= 1'd1;
	end
end
assign main_ethernetsoc_sdram_inti_p3_address = main_ethernetsoc_sdram_phaseinjector3_address_storage;
assign main_ethernetsoc_sdram_inti_p3_bank = main_ethernetsoc_sdram_phaseinjector3_baddress_storage;
assign main_ethernetsoc_sdram_inti_p3_wrdata_en = (main_ethernetsoc_sdram_phaseinjector3_command_issue_re & main_ethernetsoc_sdram_phaseinjector3_command_storage[4]);
assign main_ethernetsoc_sdram_inti_p3_rddata_en = (main_ethernetsoc_sdram_phaseinjector3_command_issue_re & main_ethernetsoc_sdram_phaseinjector3_command_storage[5]);
assign main_ethernetsoc_sdram_inti_p3_wrdata = main_ethernetsoc_sdram_phaseinjector3_wrdata_storage;
assign main_ethernetsoc_sdram_inti_p3_wrdata_mask = 1'd0;
assign main_ethernetsoc_sdram_bankmachine0_req_valid = main_ethernetsoc_sdram_interface_bank0_valid;
assign main_ethernetsoc_sdram_interface_bank0_ready = main_ethernetsoc_sdram_bankmachine0_req_ready;
assign main_ethernetsoc_sdram_bankmachine0_req_we = main_ethernetsoc_sdram_interface_bank0_we;
assign main_ethernetsoc_sdram_bankmachine0_req_addr = main_ethernetsoc_sdram_interface_bank0_addr;
assign main_ethernetsoc_sdram_interface_bank0_lock = main_ethernetsoc_sdram_bankmachine0_req_lock;
assign main_ethernetsoc_sdram_interface_bank0_wdata_ready = main_ethernetsoc_sdram_bankmachine0_req_wdata_ready;
assign main_ethernetsoc_sdram_interface_bank0_rdata_valid = main_ethernetsoc_sdram_bankmachine0_req_rdata_valid;
assign main_ethernetsoc_sdram_bankmachine1_req_valid = main_ethernetsoc_sdram_interface_bank1_valid;
assign main_ethernetsoc_sdram_interface_bank1_ready = main_ethernetsoc_sdram_bankmachine1_req_ready;
assign main_ethernetsoc_sdram_bankmachine1_req_we = main_ethernetsoc_sdram_interface_bank1_we;
assign main_ethernetsoc_sdram_bankmachine1_req_addr = main_ethernetsoc_sdram_interface_bank1_addr;
assign main_ethernetsoc_sdram_interface_bank1_lock = main_ethernetsoc_sdram_bankmachine1_req_lock;
assign main_ethernetsoc_sdram_interface_bank1_wdata_ready = main_ethernetsoc_sdram_bankmachine1_req_wdata_ready;
assign main_ethernetsoc_sdram_interface_bank1_rdata_valid = main_ethernetsoc_sdram_bankmachine1_req_rdata_valid;
assign main_ethernetsoc_sdram_bankmachine2_req_valid = main_ethernetsoc_sdram_interface_bank2_valid;
assign main_ethernetsoc_sdram_interface_bank2_ready = main_ethernetsoc_sdram_bankmachine2_req_ready;
assign main_ethernetsoc_sdram_bankmachine2_req_we = main_ethernetsoc_sdram_interface_bank2_we;
assign main_ethernetsoc_sdram_bankmachine2_req_addr = main_ethernetsoc_sdram_interface_bank2_addr;
assign main_ethernetsoc_sdram_interface_bank2_lock = main_ethernetsoc_sdram_bankmachine2_req_lock;
assign main_ethernetsoc_sdram_interface_bank2_wdata_ready = main_ethernetsoc_sdram_bankmachine2_req_wdata_ready;
assign main_ethernetsoc_sdram_interface_bank2_rdata_valid = main_ethernetsoc_sdram_bankmachine2_req_rdata_valid;
assign main_ethernetsoc_sdram_bankmachine3_req_valid = main_ethernetsoc_sdram_interface_bank3_valid;
assign main_ethernetsoc_sdram_interface_bank3_ready = main_ethernetsoc_sdram_bankmachine3_req_ready;
assign main_ethernetsoc_sdram_bankmachine3_req_we = main_ethernetsoc_sdram_interface_bank3_we;
assign main_ethernetsoc_sdram_bankmachine3_req_addr = main_ethernetsoc_sdram_interface_bank3_addr;
assign main_ethernetsoc_sdram_interface_bank3_lock = main_ethernetsoc_sdram_bankmachine3_req_lock;
assign main_ethernetsoc_sdram_interface_bank3_wdata_ready = main_ethernetsoc_sdram_bankmachine3_req_wdata_ready;
assign main_ethernetsoc_sdram_interface_bank3_rdata_valid = main_ethernetsoc_sdram_bankmachine3_req_rdata_valid;
assign main_ethernetsoc_sdram_bankmachine4_req_valid = main_ethernetsoc_sdram_interface_bank4_valid;
assign main_ethernetsoc_sdram_interface_bank4_ready = main_ethernetsoc_sdram_bankmachine4_req_ready;
assign main_ethernetsoc_sdram_bankmachine4_req_we = main_ethernetsoc_sdram_interface_bank4_we;
assign main_ethernetsoc_sdram_bankmachine4_req_addr = main_ethernetsoc_sdram_interface_bank4_addr;
assign main_ethernetsoc_sdram_interface_bank4_lock = main_ethernetsoc_sdram_bankmachine4_req_lock;
assign main_ethernetsoc_sdram_interface_bank4_wdata_ready = main_ethernetsoc_sdram_bankmachine4_req_wdata_ready;
assign main_ethernetsoc_sdram_interface_bank4_rdata_valid = main_ethernetsoc_sdram_bankmachine4_req_rdata_valid;
assign main_ethernetsoc_sdram_bankmachine5_req_valid = main_ethernetsoc_sdram_interface_bank5_valid;
assign main_ethernetsoc_sdram_interface_bank5_ready = main_ethernetsoc_sdram_bankmachine5_req_ready;
assign main_ethernetsoc_sdram_bankmachine5_req_we = main_ethernetsoc_sdram_interface_bank5_we;
assign main_ethernetsoc_sdram_bankmachine5_req_addr = main_ethernetsoc_sdram_interface_bank5_addr;
assign main_ethernetsoc_sdram_interface_bank5_lock = main_ethernetsoc_sdram_bankmachine5_req_lock;
assign main_ethernetsoc_sdram_interface_bank5_wdata_ready = main_ethernetsoc_sdram_bankmachine5_req_wdata_ready;
assign main_ethernetsoc_sdram_interface_bank5_rdata_valid = main_ethernetsoc_sdram_bankmachine5_req_rdata_valid;
assign main_ethernetsoc_sdram_bankmachine6_req_valid = main_ethernetsoc_sdram_interface_bank6_valid;
assign main_ethernetsoc_sdram_interface_bank6_ready = main_ethernetsoc_sdram_bankmachine6_req_ready;
assign main_ethernetsoc_sdram_bankmachine6_req_we = main_ethernetsoc_sdram_interface_bank6_we;
assign main_ethernetsoc_sdram_bankmachine6_req_addr = main_ethernetsoc_sdram_interface_bank6_addr;
assign main_ethernetsoc_sdram_interface_bank6_lock = main_ethernetsoc_sdram_bankmachine6_req_lock;
assign main_ethernetsoc_sdram_interface_bank6_wdata_ready = main_ethernetsoc_sdram_bankmachine6_req_wdata_ready;
assign main_ethernetsoc_sdram_interface_bank6_rdata_valid = main_ethernetsoc_sdram_bankmachine6_req_rdata_valid;
assign main_ethernetsoc_sdram_bankmachine7_req_valid = main_ethernetsoc_sdram_interface_bank7_valid;
assign main_ethernetsoc_sdram_interface_bank7_ready = main_ethernetsoc_sdram_bankmachine7_req_ready;
assign main_ethernetsoc_sdram_bankmachine7_req_we = main_ethernetsoc_sdram_interface_bank7_we;
assign main_ethernetsoc_sdram_bankmachine7_req_addr = main_ethernetsoc_sdram_interface_bank7_addr;
assign main_ethernetsoc_sdram_interface_bank7_lock = main_ethernetsoc_sdram_bankmachine7_req_lock;
assign main_ethernetsoc_sdram_interface_bank7_wdata_ready = main_ethernetsoc_sdram_bankmachine7_req_wdata_ready;
assign main_ethernetsoc_sdram_interface_bank7_rdata_valid = main_ethernetsoc_sdram_bankmachine7_req_rdata_valid;
assign main_ethernetsoc_sdram_timer_reset = 2'sd2;
assign main_ethernetsoc_sdram_timer_wait = (~main_ethernetsoc_sdram_timer_done);
assign main_ethernetsoc_sdram_timer_done = (main_ethernetsoc_sdram_timer_count == 1'd0);
always @(*) begin
	main_ethernetsoc_sdram_cmd_last <= 1'd0;
	builder_refresher_next_state <= 2'd0;
	main_ethernetsoc_sdram_generator_start <= 1'd0;
	main_ethernetsoc_sdram_cmd_valid <= 1'd0;
	builder_refresher_next_state <= builder_refresher_state;
	case (builder_refresher_state)
		1'd1: begin
			main_ethernetsoc_sdram_cmd_valid <= 1'd1;
			if (main_ethernetsoc_sdram_cmd_ready) begin
				main_ethernetsoc_sdram_generator_start <= 1'd1;
				builder_refresher_next_state <= 2'd2;
			end
		end
		2'd2: begin
			if (main_ethernetsoc_sdram_generator_done) begin
				main_ethernetsoc_sdram_cmd_last <= 1'd1;
				builder_refresher_next_state <= 1'd0;
			end else begin
				main_ethernetsoc_sdram_cmd_valid <= 1'd1;
			end
		end
		default: begin
			if (main_ethernetsoc_sdram_timer_done) begin
				builder_refresher_next_state <= 1'd1;
			end
		end
	endcase
end
assign main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_sink_valid = main_ethernetsoc_sdram_bankmachine0_req_valid;
assign main_ethernetsoc_sdram_bankmachine0_req_ready = main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_sink_ready;
assign main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_sink_payload_we = main_ethernetsoc_sdram_bankmachine0_req_we;
assign main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_sink_payload_addr = main_ethernetsoc_sdram_bankmachine0_req_addr;
assign main_ethernetsoc_sdram_bankmachine0_cmd_buffer_sink_valid = main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_valid;
assign main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_ready = main_ethernetsoc_sdram_bankmachine0_cmd_buffer_sink_ready;
assign main_ethernetsoc_sdram_bankmachine0_cmd_buffer_sink_first = main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_first;
assign main_ethernetsoc_sdram_bankmachine0_cmd_buffer_sink_last = main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_last;
assign main_ethernetsoc_sdram_bankmachine0_cmd_buffer_sink_payload_we = main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_payload_we;
assign main_ethernetsoc_sdram_bankmachine0_cmd_buffer_sink_payload_addr = main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_payload_addr;
assign main_ethernetsoc_sdram_bankmachine0_cmd_buffer_source_ready = (main_ethernetsoc_sdram_bankmachine0_req_wdata_ready | main_ethernetsoc_sdram_bankmachine0_req_rdata_valid);
assign main_ethernetsoc_sdram_bankmachine0_req_lock = (main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_valid | main_ethernetsoc_sdram_bankmachine0_cmd_buffer_source_valid);
assign main_ethernetsoc_sdram_bankmachine0_row_hit = (main_ethernetsoc_sdram_bankmachine0_row == main_ethernetsoc_sdram_bankmachine0_cmd_buffer_source_payload_addr[20:7]);
assign main_ethernetsoc_sdram_bankmachine0_cmd_payload_ba = 1'd0;
always @(*) begin
	main_ethernetsoc_sdram_bankmachine0_cmd_payload_a <= 14'd0;
	if (main_ethernetsoc_sdram_bankmachine0_row_col_n_addr_sel) begin
		main_ethernetsoc_sdram_bankmachine0_cmd_payload_a <= main_ethernetsoc_sdram_bankmachine0_cmd_buffer_source_payload_addr[20:7];
	end else begin
		main_ethernetsoc_sdram_bankmachine0_cmd_payload_a <= ((main_ethernetsoc_sdram_bankmachine0_auto_precharge <<< 4'd10) | {main_ethernetsoc_sdram_bankmachine0_cmd_buffer_source_payload_addr[6:0], {3{1'd0}}});
	end
end
assign main_ethernetsoc_sdram_bankmachine0_twtpcon_valid = ((main_ethernetsoc_sdram_bankmachine0_cmd_valid & main_ethernetsoc_sdram_bankmachine0_cmd_ready) & main_ethernetsoc_sdram_bankmachine0_cmd_payload_is_write);
assign main_ethernetsoc_sdram_bankmachine0_trccon_valid = ((main_ethernetsoc_sdram_bankmachine0_cmd_valid & main_ethernetsoc_sdram_bankmachine0_cmd_ready) & main_ethernetsoc_sdram_bankmachine0_row_open);
assign main_ethernetsoc_sdram_bankmachine0_trascon_valid = ((main_ethernetsoc_sdram_bankmachine0_cmd_valid & main_ethernetsoc_sdram_bankmachine0_cmd_ready) & main_ethernetsoc_sdram_bankmachine0_row_open);
always @(*) begin
	main_ethernetsoc_sdram_bankmachine0_auto_precharge <= 1'd0;
	if ((main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_valid & main_ethernetsoc_sdram_bankmachine0_cmd_buffer_source_valid)) begin
		if ((main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_payload_addr[20:7] != main_ethernetsoc_sdram_bankmachine0_cmd_buffer_source_payload_addr[20:7])) begin
			main_ethernetsoc_sdram_bankmachine0_auto_precharge <= (main_ethernetsoc_sdram_bankmachine0_row_close == 1'd0);
		end
	end
end
assign main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_din = {main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_in_last, main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_in_first, main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_in_payload_addr, main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_in_payload_we};
assign {main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_out_last, main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_out_first, main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_out_payload_addr, main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_out_payload_we} = main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_dout;
assign main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_sink_ready = main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_writable;
assign main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_we = main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_sink_valid;
assign main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_in_first = main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_sink_first;
assign main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_in_last = main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_sink_last;
assign main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_in_payload_we = main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_sink_payload_we;
assign main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_in_payload_addr = main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_sink_payload_addr;
assign main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_valid = main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_readable;
assign main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_first = main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_out_first;
assign main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_last = main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_out_last;
assign main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_payload_we = main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_out_payload_we;
assign main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_payload_addr = main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_out_payload_addr;
assign main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_re = main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_ready;
always @(*) begin
	main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_wrport_adr <= 3'd0;
	if (main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_replace) begin
		main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_wrport_adr <= (main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_produce - 1'd1);
	end else begin
		main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_wrport_adr <= main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_produce;
	end
end
assign main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_wrport_dat_w = main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_din;
assign main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_wrport_we = (main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_we & (main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_writable | main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_replace));
assign main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_do_read = (main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_readable & main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_re);
assign main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_rdport_adr = main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_consume;
assign main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_dout = main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_rdport_dat_r;
assign main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_writable = (main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_level != 4'd8);
assign main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_readable = (main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_level != 1'd0);
assign main_ethernetsoc_sdram_bankmachine0_cmd_buffer_pipe_ce = (main_ethernetsoc_sdram_bankmachine0_cmd_buffer_source_ready | (~main_ethernetsoc_sdram_bankmachine0_cmd_buffer_valid_n));
assign main_ethernetsoc_sdram_bankmachine0_cmd_buffer_sink_ready = main_ethernetsoc_sdram_bankmachine0_cmd_buffer_pipe_ce;
assign main_ethernetsoc_sdram_bankmachine0_cmd_buffer_source_valid = main_ethernetsoc_sdram_bankmachine0_cmd_buffer_valid_n;
assign main_ethernetsoc_sdram_bankmachine0_cmd_buffer_busy = (1'd0 | main_ethernetsoc_sdram_bankmachine0_cmd_buffer_valid_n);
assign main_ethernetsoc_sdram_bankmachine0_cmd_buffer_source_first = main_ethernetsoc_sdram_bankmachine0_cmd_buffer_first_n;
assign main_ethernetsoc_sdram_bankmachine0_cmd_buffer_source_last = main_ethernetsoc_sdram_bankmachine0_cmd_buffer_last_n;
always @(*) begin
	main_ethernetsoc_sdram_bankmachine0_cmd_valid <= 1'd0;
	builder_bankmachine0_next_state <= 4'd0;
	main_ethernetsoc_sdram_bankmachine0_cmd_payload_cas <= 1'd0;
	main_ethernetsoc_sdram_bankmachine0_cmd_payload_ras <= 1'd0;
	main_ethernetsoc_sdram_bankmachine0_cmd_payload_we <= 1'd0;
	main_ethernetsoc_sdram_bankmachine0_cmd_payload_is_cmd <= 1'd0;
	main_ethernetsoc_sdram_bankmachine0_row_open <= 1'd0;
	main_ethernetsoc_sdram_bankmachine0_cmd_payload_is_read <= 1'd0;
	main_ethernetsoc_sdram_bankmachine0_row_close <= 1'd0;
	main_ethernetsoc_sdram_bankmachine0_cmd_payload_is_write <= 1'd0;
	main_ethernetsoc_sdram_bankmachine0_req_wdata_ready <= 1'd0;
	main_ethernetsoc_sdram_bankmachine0_req_rdata_valid <= 1'd0;
	main_ethernetsoc_sdram_bankmachine0_row_col_n_addr_sel <= 1'd0;
	main_ethernetsoc_sdram_bankmachine0_refresh_gnt <= 1'd0;
	builder_bankmachine0_next_state <= builder_bankmachine0_state;
	case (builder_bankmachine0_state)
		1'd1: begin
			if ((main_ethernetsoc_sdram_bankmachine0_twtpcon_ready & main_ethernetsoc_sdram_bankmachine0_trascon_ready)) begin
				main_ethernetsoc_sdram_bankmachine0_cmd_valid <= 1'd1;
				if (main_ethernetsoc_sdram_bankmachine0_cmd_ready) begin
					builder_bankmachine0_next_state <= 3'd5;
				end
				main_ethernetsoc_sdram_bankmachine0_cmd_payload_ras <= 1'd1;
				main_ethernetsoc_sdram_bankmachine0_cmd_payload_we <= 1'd1;
				main_ethernetsoc_sdram_bankmachine0_cmd_payload_is_cmd <= 1'd1;
			end
			main_ethernetsoc_sdram_bankmachine0_row_close <= 1'd1;
		end
		2'd2: begin
			if ((main_ethernetsoc_sdram_bankmachine0_twtpcon_ready & main_ethernetsoc_sdram_bankmachine0_trascon_ready)) begin
				builder_bankmachine0_next_state <= 3'd5;
			end
			main_ethernetsoc_sdram_bankmachine0_row_close <= 1'd1;
		end
		2'd3: begin
			if (main_ethernetsoc_sdram_bankmachine0_trccon_ready) begin
				main_ethernetsoc_sdram_bankmachine0_row_col_n_addr_sel <= 1'd1;
				main_ethernetsoc_sdram_bankmachine0_row_open <= 1'd1;
				main_ethernetsoc_sdram_bankmachine0_cmd_valid <= 1'd1;
				main_ethernetsoc_sdram_bankmachine0_cmd_payload_is_cmd <= 1'd1;
				if (main_ethernetsoc_sdram_bankmachine0_cmd_ready) begin
					builder_bankmachine0_next_state <= 3'd7;
				end
				main_ethernetsoc_sdram_bankmachine0_cmd_payload_ras <= 1'd1;
			end
		end
		3'd4: begin
			if (main_ethernetsoc_sdram_bankmachine0_twtpcon_ready) begin
				main_ethernetsoc_sdram_bankmachine0_refresh_gnt <= 1'd1;
			end
			main_ethernetsoc_sdram_bankmachine0_row_close <= 1'd1;
			main_ethernetsoc_sdram_bankmachine0_cmd_payload_is_cmd <= 1'd1;
			if ((~main_ethernetsoc_sdram_bankmachine0_refresh_req)) begin
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
			if (main_ethernetsoc_sdram_bankmachine0_refresh_req) begin
				builder_bankmachine0_next_state <= 3'd4;
			end else begin
				if (main_ethernetsoc_sdram_bankmachine0_cmd_buffer_source_valid) begin
					if (main_ethernetsoc_sdram_bankmachine0_row_opened) begin
						if (main_ethernetsoc_sdram_bankmachine0_row_hit) begin
							main_ethernetsoc_sdram_bankmachine0_cmd_valid <= 1'd1;
							if (main_ethernetsoc_sdram_bankmachine0_cmd_buffer_source_payload_we) begin
								main_ethernetsoc_sdram_bankmachine0_req_wdata_ready <= main_ethernetsoc_sdram_bankmachine0_cmd_ready;
								main_ethernetsoc_sdram_bankmachine0_cmd_payload_is_write <= 1'd1;
								main_ethernetsoc_sdram_bankmachine0_cmd_payload_we <= 1'd1;
							end else begin
								main_ethernetsoc_sdram_bankmachine0_req_rdata_valid <= main_ethernetsoc_sdram_bankmachine0_cmd_ready;
								main_ethernetsoc_sdram_bankmachine0_cmd_payload_is_read <= 1'd1;
							end
							main_ethernetsoc_sdram_bankmachine0_cmd_payload_cas <= 1'd1;
							if ((main_ethernetsoc_sdram_bankmachine0_cmd_ready & main_ethernetsoc_sdram_bankmachine0_auto_precharge)) begin
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
assign main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_sink_valid = main_ethernetsoc_sdram_bankmachine1_req_valid;
assign main_ethernetsoc_sdram_bankmachine1_req_ready = main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_sink_ready;
assign main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_sink_payload_we = main_ethernetsoc_sdram_bankmachine1_req_we;
assign main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_sink_payload_addr = main_ethernetsoc_sdram_bankmachine1_req_addr;
assign main_ethernetsoc_sdram_bankmachine1_cmd_buffer_sink_valid = main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_valid;
assign main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_ready = main_ethernetsoc_sdram_bankmachine1_cmd_buffer_sink_ready;
assign main_ethernetsoc_sdram_bankmachine1_cmd_buffer_sink_first = main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_first;
assign main_ethernetsoc_sdram_bankmachine1_cmd_buffer_sink_last = main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_last;
assign main_ethernetsoc_sdram_bankmachine1_cmd_buffer_sink_payload_we = main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_payload_we;
assign main_ethernetsoc_sdram_bankmachine1_cmd_buffer_sink_payload_addr = main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_payload_addr;
assign main_ethernetsoc_sdram_bankmachine1_cmd_buffer_source_ready = (main_ethernetsoc_sdram_bankmachine1_req_wdata_ready | main_ethernetsoc_sdram_bankmachine1_req_rdata_valid);
assign main_ethernetsoc_sdram_bankmachine1_req_lock = (main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_valid | main_ethernetsoc_sdram_bankmachine1_cmd_buffer_source_valid);
assign main_ethernetsoc_sdram_bankmachine1_row_hit = (main_ethernetsoc_sdram_bankmachine1_row == main_ethernetsoc_sdram_bankmachine1_cmd_buffer_source_payload_addr[20:7]);
assign main_ethernetsoc_sdram_bankmachine1_cmd_payload_ba = 1'd1;
always @(*) begin
	main_ethernetsoc_sdram_bankmachine1_cmd_payload_a <= 14'd0;
	if (main_ethernetsoc_sdram_bankmachine1_row_col_n_addr_sel) begin
		main_ethernetsoc_sdram_bankmachine1_cmd_payload_a <= main_ethernetsoc_sdram_bankmachine1_cmd_buffer_source_payload_addr[20:7];
	end else begin
		main_ethernetsoc_sdram_bankmachine1_cmd_payload_a <= ((main_ethernetsoc_sdram_bankmachine1_auto_precharge <<< 4'd10) | {main_ethernetsoc_sdram_bankmachine1_cmd_buffer_source_payload_addr[6:0], {3{1'd0}}});
	end
end
assign main_ethernetsoc_sdram_bankmachine1_twtpcon_valid = ((main_ethernetsoc_sdram_bankmachine1_cmd_valid & main_ethernetsoc_sdram_bankmachine1_cmd_ready) & main_ethernetsoc_sdram_bankmachine1_cmd_payload_is_write);
assign main_ethernetsoc_sdram_bankmachine1_trccon_valid = ((main_ethernetsoc_sdram_bankmachine1_cmd_valid & main_ethernetsoc_sdram_bankmachine1_cmd_ready) & main_ethernetsoc_sdram_bankmachine1_row_open);
assign main_ethernetsoc_sdram_bankmachine1_trascon_valid = ((main_ethernetsoc_sdram_bankmachine1_cmd_valid & main_ethernetsoc_sdram_bankmachine1_cmd_ready) & main_ethernetsoc_sdram_bankmachine1_row_open);
always @(*) begin
	main_ethernetsoc_sdram_bankmachine1_auto_precharge <= 1'd0;
	if ((main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_valid & main_ethernetsoc_sdram_bankmachine1_cmd_buffer_source_valid)) begin
		if ((main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_payload_addr[20:7] != main_ethernetsoc_sdram_bankmachine1_cmd_buffer_source_payload_addr[20:7])) begin
			main_ethernetsoc_sdram_bankmachine1_auto_precharge <= (main_ethernetsoc_sdram_bankmachine1_row_close == 1'd0);
		end
	end
end
assign main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_din = {main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_in_last, main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_in_first, main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_in_payload_addr, main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_in_payload_we};
assign {main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_out_last, main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_out_first, main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_out_payload_addr, main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_out_payload_we} = main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_dout;
assign main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_sink_ready = main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_writable;
assign main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_we = main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_sink_valid;
assign main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_in_first = main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_sink_first;
assign main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_in_last = main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_sink_last;
assign main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_in_payload_we = main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_sink_payload_we;
assign main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_in_payload_addr = main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_sink_payload_addr;
assign main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_valid = main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_readable;
assign main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_first = main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_out_first;
assign main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_last = main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_out_last;
assign main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_payload_we = main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_out_payload_we;
assign main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_payload_addr = main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_out_payload_addr;
assign main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_re = main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_ready;
always @(*) begin
	main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_wrport_adr <= 3'd0;
	if (main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_replace) begin
		main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_wrport_adr <= (main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_produce - 1'd1);
	end else begin
		main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_wrport_adr <= main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_produce;
	end
end
assign main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_wrport_dat_w = main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_din;
assign main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_wrport_we = (main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_we & (main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_writable | main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_replace));
assign main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_do_read = (main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_readable & main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_re);
assign main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_rdport_adr = main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_consume;
assign main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_dout = main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_rdport_dat_r;
assign main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_writable = (main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_level != 4'd8);
assign main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_readable = (main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_level != 1'd0);
assign main_ethernetsoc_sdram_bankmachine1_cmd_buffer_pipe_ce = (main_ethernetsoc_sdram_bankmachine1_cmd_buffer_source_ready | (~main_ethernetsoc_sdram_bankmachine1_cmd_buffer_valid_n));
assign main_ethernetsoc_sdram_bankmachine1_cmd_buffer_sink_ready = main_ethernetsoc_sdram_bankmachine1_cmd_buffer_pipe_ce;
assign main_ethernetsoc_sdram_bankmachine1_cmd_buffer_source_valid = main_ethernetsoc_sdram_bankmachine1_cmd_buffer_valid_n;
assign main_ethernetsoc_sdram_bankmachine1_cmd_buffer_busy = (1'd0 | main_ethernetsoc_sdram_bankmachine1_cmd_buffer_valid_n);
assign main_ethernetsoc_sdram_bankmachine1_cmd_buffer_source_first = main_ethernetsoc_sdram_bankmachine1_cmd_buffer_first_n;
assign main_ethernetsoc_sdram_bankmachine1_cmd_buffer_source_last = main_ethernetsoc_sdram_bankmachine1_cmd_buffer_last_n;
always @(*) begin
	main_ethernetsoc_sdram_bankmachine1_cmd_payload_is_read <= 1'd0;
	main_ethernetsoc_sdram_bankmachine1_row_close <= 1'd0;
	main_ethernetsoc_sdram_bankmachine1_cmd_payload_is_write <= 1'd0;
	main_ethernetsoc_sdram_bankmachine1_req_wdata_ready <= 1'd0;
	main_ethernetsoc_sdram_bankmachine1_req_rdata_valid <= 1'd0;
	builder_bankmachine1_next_state <= 4'd0;
	main_ethernetsoc_sdram_bankmachine1_row_col_n_addr_sel <= 1'd0;
	main_ethernetsoc_sdram_bankmachine1_refresh_gnt <= 1'd0;
	main_ethernetsoc_sdram_bankmachine1_cmd_valid <= 1'd0;
	main_ethernetsoc_sdram_bankmachine1_cmd_payload_cas <= 1'd0;
	main_ethernetsoc_sdram_bankmachine1_cmd_payload_ras <= 1'd0;
	main_ethernetsoc_sdram_bankmachine1_cmd_payload_we <= 1'd0;
	main_ethernetsoc_sdram_bankmachine1_cmd_payload_is_cmd <= 1'd0;
	main_ethernetsoc_sdram_bankmachine1_row_open <= 1'd0;
	builder_bankmachine1_next_state <= builder_bankmachine1_state;
	case (builder_bankmachine1_state)
		1'd1: begin
			if ((main_ethernetsoc_sdram_bankmachine1_twtpcon_ready & main_ethernetsoc_sdram_bankmachine1_trascon_ready)) begin
				main_ethernetsoc_sdram_bankmachine1_cmd_valid <= 1'd1;
				if (main_ethernetsoc_sdram_bankmachine1_cmd_ready) begin
					builder_bankmachine1_next_state <= 3'd5;
				end
				main_ethernetsoc_sdram_bankmachine1_cmd_payload_ras <= 1'd1;
				main_ethernetsoc_sdram_bankmachine1_cmd_payload_we <= 1'd1;
				main_ethernetsoc_sdram_bankmachine1_cmd_payload_is_cmd <= 1'd1;
			end
			main_ethernetsoc_sdram_bankmachine1_row_close <= 1'd1;
		end
		2'd2: begin
			if ((main_ethernetsoc_sdram_bankmachine1_twtpcon_ready & main_ethernetsoc_sdram_bankmachine1_trascon_ready)) begin
				builder_bankmachine1_next_state <= 3'd5;
			end
			main_ethernetsoc_sdram_bankmachine1_row_close <= 1'd1;
		end
		2'd3: begin
			if (main_ethernetsoc_sdram_bankmachine1_trccon_ready) begin
				main_ethernetsoc_sdram_bankmachine1_row_col_n_addr_sel <= 1'd1;
				main_ethernetsoc_sdram_bankmachine1_row_open <= 1'd1;
				main_ethernetsoc_sdram_bankmachine1_cmd_valid <= 1'd1;
				main_ethernetsoc_sdram_bankmachine1_cmd_payload_is_cmd <= 1'd1;
				if (main_ethernetsoc_sdram_bankmachine1_cmd_ready) begin
					builder_bankmachine1_next_state <= 3'd7;
				end
				main_ethernetsoc_sdram_bankmachine1_cmd_payload_ras <= 1'd1;
			end
		end
		3'd4: begin
			if (main_ethernetsoc_sdram_bankmachine1_twtpcon_ready) begin
				main_ethernetsoc_sdram_bankmachine1_refresh_gnt <= 1'd1;
			end
			main_ethernetsoc_sdram_bankmachine1_row_close <= 1'd1;
			main_ethernetsoc_sdram_bankmachine1_cmd_payload_is_cmd <= 1'd1;
			if ((~main_ethernetsoc_sdram_bankmachine1_refresh_req)) begin
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
			if (main_ethernetsoc_sdram_bankmachine1_refresh_req) begin
				builder_bankmachine1_next_state <= 3'd4;
			end else begin
				if (main_ethernetsoc_sdram_bankmachine1_cmd_buffer_source_valid) begin
					if (main_ethernetsoc_sdram_bankmachine1_row_opened) begin
						if (main_ethernetsoc_sdram_bankmachine1_row_hit) begin
							main_ethernetsoc_sdram_bankmachine1_cmd_valid <= 1'd1;
							if (main_ethernetsoc_sdram_bankmachine1_cmd_buffer_source_payload_we) begin
								main_ethernetsoc_sdram_bankmachine1_req_wdata_ready <= main_ethernetsoc_sdram_bankmachine1_cmd_ready;
								main_ethernetsoc_sdram_bankmachine1_cmd_payload_is_write <= 1'd1;
								main_ethernetsoc_sdram_bankmachine1_cmd_payload_we <= 1'd1;
							end else begin
								main_ethernetsoc_sdram_bankmachine1_req_rdata_valid <= main_ethernetsoc_sdram_bankmachine1_cmd_ready;
								main_ethernetsoc_sdram_bankmachine1_cmd_payload_is_read <= 1'd1;
							end
							main_ethernetsoc_sdram_bankmachine1_cmd_payload_cas <= 1'd1;
							if ((main_ethernetsoc_sdram_bankmachine1_cmd_ready & main_ethernetsoc_sdram_bankmachine1_auto_precharge)) begin
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
assign main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_sink_valid = main_ethernetsoc_sdram_bankmachine2_req_valid;
assign main_ethernetsoc_sdram_bankmachine2_req_ready = main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_sink_ready;
assign main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_sink_payload_we = main_ethernetsoc_sdram_bankmachine2_req_we;
assign main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_sink_payload_addr = main_ethernetsoc_sdram_bankmachine2_req_addr;
assign main_ethernetsoc_sdram_bankmachine2_cmd_buffer_sink_valid = main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_valid;
assign main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_ready = main_ethernetsoc_sdram_bankmachine2_cmd_buffer_sink_ready;
assign main_ethernetsoc_sdram_bankmachine2_cmd_buffer_sink_first = main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_first;
assign main_ethernetsoc_sdram_bankmachine2_cmd_buffer_sink_last = main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_last;
assign main_ethernetsoc_sdram_bankmachine2_cmd_buffer_sink_payload_we = main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_payload_we;
assign main_ethernetsoc_sdram_bankmachine2_cmd_buffer_sink_payload_addr = main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_payload_addr;
assign main_ethernetsoc_sdram_bankmachine2_cmd_buffer_source_ready = (main_ethernetsoc_sdram_bankmachine2_req_wdata_ready | main_ethernetsoc_sdram_bankmachine2_req_rdata_valid);
assign main_ethernetsoc_sdram_bankmachine2_req_lock = (main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_valid | main_ethernetsoc_sdram_bankmachine2_cmd_buffer_source_valid);
assign main_ethernetsoc_sdram_bankmachine2_row_hit = (main_ethernetsoc_sdram_bankmachine2_row == main_ethernetsoc_sdram_bankmachine2_cmd_buffer_source_payload_addr[20:7]);
assign main_ethernetsoc_sdram_bankmachine2_cmd_payload_ba = 2'd2;
always @(*) begin
	main_ethernetsoc_sdram_bankmachine2_cmd_payload_a <= 14'd0;
	if (main_ethernetsoc_sdram_bankmachine2_row_col_n_addr_sel) begin
		main_ethernetsoc_sdram_bankmachine2_cmd_payload_a <= main_ethernetsoc_sdram_bankmachine2_cmd_buffer_source_payload_addr[20:7];
	end else begin
		main_ethernetsoc_sdram_bankmachine2_cmd_payload_a <= ((main_ethernetsoc_sdram_bankmachine2_auto_precharge <<< 4'd10) | {main_ethernetsoc_sdram_bankmachine2_cmd_buffer_source_payload_addr[6:0], {3{1'd0}}});
	end
end
assign main_ethernetsoc_sdram_bankmachine2_twtpcon_valid = ((main_ethernetsoc_sdram_bankmachine2_cmd_valid & main_ethernetsoc_sdram_bankmachine2_cmd_ready) & main_ethernetsoc_sdram_bankmachine2_cmd_payload_is_write);
assign main_ethernetsoc_sdram_bankmachine2_trccon_valid = ((main_ethernetsoc_sdram_bankmachine2_cmd_valid & main_ethernetsoc_sdram_bankmachine2_cmd_ready) & main_ethernetsoc_sdram_bankmachine2_row_open);
assign main_ethernetsoc_sdram_bankmachine2_trascon_valid = ((main_ethernetsoc_sdram_bankmachine2_cmd_valid & main_ethernetsoc_sdram_bankmachine2_cmd_ready) & main_ethernetsoc_sdram_bankmachine2_row_open);
always @(*) begin
	main_ethernetsoc_sdram_bankmachine2_auto_precharge <= 1'd0;
	if ((main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_valid & main_ethernetsoc_sdram_bankmachine2_cmd_buffer_source_valid)) begin
		if ((main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_payload_addr[20:7] != main_ethernetsoc_sdram_bankmachine2_cmd_buffer_source_payload_addr[20:7])) begin
			main_ethernetsoc_sdram_bankmachine2_auto_precharge <= (main_ethernetsoc_sdram_bankmachine2_row_close == 1'd0);
		end
	end
end
assign main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_din = {main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_in_last, main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_in_first, main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_in_payload_addr, main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_in_payload_we};
assign {main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_out_last, main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_out_first, main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_out_payload_addr, main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_out_payload_we} = main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_dout;
assign main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_sink_ready = main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_writable;
assign main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_we = main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_sink_valid;
assign main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_in_first = main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_sink_first;
assign main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_in_last = main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_sink_last;
assign main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_in_payload_we = main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_sink_payload_we;
assign main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_in_payload_addr = main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_sink_payload_addr;
assign main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_valid = main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_readable;
assign main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_first = main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_out_first;
assign main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_last = main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_out_last;
assign main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_payload_we = main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_out_payload_we;
assign main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_payload_addr = main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_out_payload_addr;
assign main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_re = main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_ready;
always @(*) begin
	main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_wrport_adr <= 3'd0;
	if (main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_replace) begin
		main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_wrport_adr <= (main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_produce - 1'd1);
	end else begin
		main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_wrport_adr <= main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_produce;
	end
end
assign main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_wrport_dat_w = main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_din;
assign main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_wrport_we = (main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_we & (main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_writable | main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_replace));
assign main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_do_read = (main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_readable & main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_re);
assign main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_rdport_adr = main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_consume;
assign main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_dout = main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_rdport_dat_r;
assign main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_writable = (main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_level != 4'd8);
assign main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_readable = (main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_level != 1'd0);
assign main_ethernetsoc_sdram_bankmachine2_cmd_buffer_pipe_ce = (main_ethernetsoc_sdram_bankmachine2_cmd_buffer_source_ready | (~main_ethernetsoc_sdram_bankmachine2_cmd_buffer_valid_n));
assign main_ethernetsoc_sdram_bankmachine2_cmd_buffer_sink_ready = main_ethernetsoc_sdram_bankmachine2_cmd_buffer_pipe_ce;
assign main_ethernetsoc_sdram_bankmachine2_cmd_buffer_source_valid = main_ethernetsoc_sdram_bankmachine2_cmd_buffer_valid_n;
assign main_ethernetsoc_sdram_bankmachine2_cmd_buffer_busy = (1'd0 | main_ethernetsoc_sdram_bankmachine2_cmd_buffer_valid_n);
assign main_ethernetsoc_sdram_bankmachine2_cmd_buffer_source_first = main_ethernetsoc_sdram_bankmachine2_cmd_buffer_first_n;
assign main_ethernetsoc_sdram_bankmachine2_cmd_buffer_source_last = main_ethernetsoc_sdram_bankmachine2_cmd_buffer_last_n;
always @(*) begin
	main_ethernetsoc_sdram_bankmachine2_cmd_payload_cas <= 1'd0;
	main_ethernetsoc_sdram_bankmachine2_cmd_payload_ras <= 1'd0;
	builder_bankmachine2_next_state <= 4'd0;
	main_ethernetsoc_sdram_bankmachine2_cmd_payload_we <= 1'd0;
	main_ethernetsoc_sdram_bankmachine2_cmd_payload_is_cmd <= 1'd0;
	main_ethernetsoc_sdram_bankmachine2_row_open <= 1'd0;
	main_ethernetsoc_sdram_bankmachine2_cmd_payload_is_read <= 1'd0;
	main_ethernetsoc_sdram_bankmachine2_row_close <= 1'd0;
	main_ethernetsoc_sdram_bankmachine2_cmd_payload_is_write <= 1'd0;
	main_ethernetsoc_sdram_bankmachine2_req_wdata_ready <= 1'd0;
	main_ethernetsoc_sdram_bankmachine2_req_rdata_valid <= 1'd0;
	main_ethernetsoc_sdram_bankmachine2_row_col_n_addr_sel <= 1'd0;
	main_ethernetsoc_sdram_bankmachine2_refresh_gnt <= 1'd0;
	main_ethernetsoc_sdram_bankmachine2_cmd_valid <= 1'd0;
	builder_bankmachine2_next_state <= builder_bankmachine2_state;
	case (builder_bankmachine2_state)
		1'd1: begin
			if ((main_ethernetsoc_sdram_bankmachine2_twtpcon_ready & main_ethernetsoc_sdram_bankmachine2_trascon_ready)) begin
				main_ethernetsoc_sdram_bankmachine2_cmd_valid <= 1'd1;
				if (main_ethernetsoc_sdram_bankmachine2_cmd_ready) begin
					builder_bankmachine2_next_state <= 3'd5;
				end
				main_ethernetsoc_sdram_bankmachine2_cmd_payload_ras <= 1'd1;
				main_ethernetsoc_sdram_bankmachine2_cmd_payload_we <= 1'd1;
				main_ethernetsoc_sdram_bankmachine2_cmd_payload_is_cmd <= 1'd1;
			end
			main_ethernetsoc_sdram_bankmachine2_row_close <= 1'd1;
		end
		2'd2: begin
			if ((main_ethernetsoc_sdram_bankmachine2_twtpcon_ready & main_ethernetsoc_sdram_bankmachine2_trascon_ready)) begin
				builder_bankmachine2_next_state <= 3'd5;
			end
			main_ethernetsoc_sdram_bankmachine2_row_close <= 1'd1;
		end
		2'd3: begin
			if (main_ethernetsoc_sdram_bankmachine2_trccon_ready) begin
				main_ethernetsoc_sdram_bankmachine2_row_col_n_addr_sel <= 1'd1;
				main_ethernetsoc_sdram_bankmachine2_row_open <= 1'd1;
				main_ethernetsoc_sdram_bankmachine2_cmd_valid <= 1'd1;
				main_ethernetsoc_sdram_bankmachine2_cmd_payload_is_cmd <= 1'd1;
				if (main_ethernetsoc_sdram_bankmachine2_cmd_ready) begin
					builder_bankmachine2_next_state <= 3'd7;
				end
				main_ethernetsoc_sdram_bankmachine2_cmd_payload_ras <= 1'd1;
			end
		end
		3'd4: begin
			if (main_ethernetsoc_sdram_bankmachine2_twtpcon_ready) begin
				main_ethernetsoc_sdram_bankmachine2_refresh_gnt <= 1'd1;
			end
			main_ethernetsoc_sdram_bankmachine2_row_close <= 1'd1;
			main_ethernetsoc_sdram_bankmachine2_cmd_payload_is_cmd <= 1'd1;
			if ((~main_ethernetsoc_sdram_bankmachine2_refresh_req)) begin
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
			if (main_ethernetsoc_sdram_bankmachine2_refresh_req) begin
				builder_bankmachine2_next_state <= 3'd4;
			end else begin
				if (main_ethernetsoc_sdram_bankmachine2_cmd_buffer_source_valid) begin
					if (main_ethernetsoc_sdram_bankmachine2_row_opened) begin
						if (main_ethernetsoc_sdram_bankmachine2_row_hit) begin
							main_ethernetsoc_sdram_bankmachine2_cmd_valid <= 1'd1;
							if (main_ethernetsoc_sdram_bankmachine2_cmd_buffer_source_payload_we) begin
								main_ethernetsoc_sdram_bankmachine2_req_wdata_ready <= main_ethernetsoc_sdram_bankmachine2_cmd_ready;
								main_ethernetsoc_sdram_bankmachine2_cmd_payload_is_write <= 1'd1;
								main_ethernetsoc_sdram_bankmachine2_cmd_payload_we <= 1'd1;
							end else begin
								main_ethernetsoc_sdram_bankmachine2_req_rdata_valid <= main_ethernetsoc_sdram_bankmachine2_cmd_ready;
								main_ethernetsoc_sdram_bankmachine2_cmd_payload_is_read <= 1'd1;
							end
							main_ethernetsoc_sdram_bankmachine2_cmd_payload_cas <= 1'd1;
							if ((main_ethernetsoc_sdram_bankmachine2_cmd_ready & main_ethernetsoc_sdram_bankmachine2_auto_precharge)) begin
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
assign main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_sink_valid = main_ethernetsoc_sdram_bankmachine3_req_valid;
assign main_ethernetsoc_sdram_bankmachine3_req_ready = main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_sink_ready;
assign main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_sink_payload_we = main_ethernetsoc_sdram_bankmachine3_req_we;
assign main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_sink_payload_addr = main_ethernetsoc_sdram_bankmachine3_req_addr;
assign main_ethernetsoc_sdram_bankmachine3_cmd_buffer_sink_valid = main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_valid;
assign main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_ready = main_ethernetsoc_sdram_bankmachine3_cmd_buffer_sink_ready;
assign main_ethernetsoc_sdram_bankmachine3_cmd_buffer_sink_first = main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_first;
assign main_ethernetsoc_sdram_bankmachine3_cmd_buffer_sink_last = main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_last;
assign main_ethernetsoc_sdram_bankmachine3_cmd_buffer_sink_payload_we = main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_payload_we;
assign main_ethernetsoc_sdram_bankmachine3_cmd_buffer_sink_payload_addr = main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_payload_addr;
assign main_ethernetsoc_sdram_bankmachine3_cmd_buffer_source_ready = (main_ethernetsoc_sdram_bankmachine3_req_wdata_ready | main_ethernetsoc_sdram_bankmachine3_req_rdata_valid);
assign main_ethernetsoc_sdram_bankmachine3_req_lock = (main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_valid | main_ethernetsoc_sdram_bankmachine3_cmd_buffer_source_valid);
assign main_ethernetsoc_sdram_bankmachine3_row_hit = (main_ethernetsoc_sdram_bankmachine3_row == main_ethernetsoc_sdram_bankmachine3_cmd_buffer_source_payload_addr[20:7]);
assign main_ethernetsoc_sdram_bankmachine3_cmd_payload_ba = 2'd3;
always @(*) begin
	main_ethernetsoc_sdram_bankmachine3_cmd_payload_a <= 14'd0;
	if (main_ethernetsoc_sdram_bankmachine3_row_col_n_addr_sel) begin
		main_ethernetsoc_sdram_bankmachine3_cmd_payload_a <= main_ethernetsoc_sdram_bankmachine3_cmd_buffer_source_payload_addr[20:7];
	end else begin
		main_ethernetsoc_sdram_bankmachine3_cmd_payload_a <= ((main_ethernetsoc_sdram_bankmachine3_auto_precharge <<< 4'd10) | {main_ethernetsoc_sdram_bankmachine3_cmd_buffer_source_payload_addr[6:0], {3{1'd0}}});
	end
end
assign main_ethernetsoc_sdram_bankmachine3_twtpcon_valid = ((main_ethernetsoc_sdram_bankmachine3_cmd_valid & main_ethernetsoc_sdram_bankmachine3_cmd_ready) & main_ethernetsoc_sdram_bankmachine3_cmd_payload_is_write);
assign main_ethernetsoc_sdram_bankmachine3_trccon_valid = ((main_ethernetsoc_sdram_bankmachine3_cmd_valid & main_ethernetsoc_sdram_bankmachine3_cmd_ready) & main_ethernetsoc_sdram_bankmachine3_row_open);
assign main_ethernetsoc_sdram_bankmachine3_trascon_valid = ((main_ethernetsoc_sdram_bankmachine3_cmd_valid & main_ethernetsoc_sdram_bankmachine3_cmd_ready) & main_ethernetsoc_sdram_bankmachine3_row_open);
always @(*) begin
	main_ethernetsoc_sdram_bankmachine3_auto_precharge <= 1'd0;
	if ((main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_valid & main_ethernetsoc_sdram_bankmachine3_cmd_buffer_source_valid)) begin
		if ((main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_payload_addr[20:7] != main_ethernetsoc_sdram_bankmachine3_cmd_buffer_source_payload_addr[20:7])) begin
			main_ethernetsoc_sdram_bankmachine3_auto_precharge <= (main_ethernetsoc_sdram_bankmachine3_row_close == 1'd0);
		end
	end
end
assign main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_din = {main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_in_last, main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_in_first, main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_in_payload_addr, main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_in_payload_we};
assign {main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_out_last, main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_out_first, main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_out_payload_addr, main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_out_payload_we} = main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_dout;
assign main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_sink_ready = main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_writable;
assign main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_we = main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_sink_valid;
assign main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_in_first = main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_sink_first;
assign main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_in_last = main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_sink_last;
assign main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_in_payload_we = main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_sink_payload_we;
assign main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_in_payload_addr = main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_sink_payload_addr;
assign main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_valid = main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_readable;
assign main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_first = main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_out_first;
assign main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_last = main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_out_last;
assign main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_payload_we = main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_out_payload_we;
assign main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_payload_addr = main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_out_payload_addr;
assign main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_re = main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_ready;
always @(*) begin
	main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_wrport_adr <= 3'd0;
	if (main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_replace) begin
		main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_wrport_adr <= (main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_produce - 1'd1);
	end else begin
		main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_wrport_adr <= main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_produce;
	end
end
assign main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_wrport_dat_w = main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_din;
assign main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_wrport_we = (main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_we & (main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_writable | main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_replace));
assign main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_do_read = (main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_readable & main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_re);
assign main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_rdport_adr = main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_consume;
assign main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_dout = main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_rdport_dat_r;
assign main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_writable = (main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_level != 4'd8);
assign main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_readable = (main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_level != 1'd0);
assign main_ethernetsoc_sdram_bankmachine3_cmd_buffer_pipe_ce = (main_ethernetsoc_sdram_bankmachine3_cmd_buffer_source_ready | (~main_ethernetsoc_sdram_bankmachine3_cmd_buffer_valid_n));
assign main_ethernetsoc_sdram_bankmachine3_cmd_buffer_sink_ready = main_ethernetsoc_sdram_bankmachine3_cmd_buffer_pipe_ce;
assign main_ethernetsoc_sdram_bankmachine3_cmd_buffer_source_valid = main_ethernetsoc_sdram_bankmachine3_cmd_buffer_valid_n;
assign main_ethernetsoc_sdram_bankmachine3_cmd_buffer_busy = (1'd0 | main_ethernetsoc_sdram_bankmachine3_cmd_buffer_valid_n);
assign main_ethernetsoc_sdram_bankmachine3_cmd_buffer_source_first = main_ethernetsoc_sdram_bankmachine3_cmd_buffer_first_n;
assign main_ethernetsoc_sdram_bankmachine3_cmd_buffer_source_last = main_ethernetsoc_sdram_bankmachine3_cmd_buffer_last_n;
always @(*) begin
	main_ethernetsoc_sdram_bankmachine3_row_col_n_addr_sel <= 1'd0;
	main_ethernetsoc_sdram_bankmachine3_refresh_gnt <= 1'd0;
	main_ethernetsoc_sdram_bankmachine3_cmd_valid <= 1'd0;
	builder_bankmachine3_next_state <= 4'd0;
	main_ethernetsoc_sdram_bankmachine3_cmd_payload_cas <= 1'd0;
	main_ethernetsoc_sdram_bankmachine3_cmd_payload_ras <= 1'd0;
	main_ethernetsoc_sdram_bankmachine3_cmd_payload_we <= 1'd0;
	main_ethernetsoc_sdram_bankmachine3_cmd_payload_is_cmd <= 1'd0;
	main_ethernetsoc_sdram_bankmachine3_row_open <= 1'd0;
	main_ethernetsoc_sdram_bankmachine3_cmd_payload_is_read <= 1'd0;
	main_ethernetsoc_sdram_bankmachine3_row_close <= 1'd0;
	main_ethernetsoc_sdram_bankmachine3_cmd_payload_is_write <= 1'd0;
	main_ethernetsoc_sdram_bankmachine3_req_wdata_ready <= 1'd0;
	main_ethernetsoc_sdram_bankmachine3_req_rdata_valid <= 1'd0;
	builder_bankmachine3_next_state <= builder_bankmachine3_state;
	case (builder_bankmachine3_state)
		1'd1: begin
			if ((main_ethernetsoc_sdram_bankmachine3_twtpcon_ready & main_ethernetsoc_sdram_bankmachine3_trascon_ready)) begin
				main_ethernetsoc_sdram_bankmachine3_cmd_valid <= 1'd1;
				if (main_ethernetsoc_sdram_bankmachine3_cmd_ready) begin
					builder_bankmachine3_next_state <= 3'd5;
				end
				main_ethernetsoc_sdram_bankmachine3_cmd_payload_ras <= 1'd1;
				main_ethernetsoc_sdram_bankmachine3_cmd_payload_we <= 1'd1;
				main_ethernetsoc_sdram_bankmachine3_cmd_payload_is_cmd <= 1'd1;
			end
			main_ethernetsoc_sdram_bankmachine3_row_close <= 1'd1;
		end
		2'd2: begin
			if ((main_ethernetsoc_sdram_bankmachine3_twtpcon_ready & main_ethernetsoc_sdram_bankmachine3_trascon_ready)) begin
				builder_bankmachine3_next_state <= 3'd5;
			end
			main_ethernetsoc_sdram_bankmachine3_row_close <= 1'd1;
		end
		2'd3: begin
			if (main_ethernetsoc_sdram_bankmachine3_trccon_ready) begin
				main_ethernetsoc_sdram_bankmachine3_row_col_n_addr_sel <= 1'd1;
				main_ethernetsoc_sdram_bankmachine3_row_open <= 1'd1;
				main_ethernetsoc_sdram_bankmachine3_cmd_valid <= 1'd1;
				main_ethernetsoc_sdram_bankmachine3_cmd_payload_is_cmd <= 1'd1;
				if (main_ethernetsoc_sdram_bankmachine3_cmd_ready) begin
					builder_bankmachine3_next_state <= 3'd7;
				end
				main_ethernetsoc_sdram_bankmachine3_cmd_payload_ras <= 1'd1;
			end
		end
		3'd4: begin
			if (main_ethernetsoc_sdram_bankmachine3_twtpcon_ready) begin
				main_ethernetsoc_sdram_bankmachine3_refresh_gnt <= 1'd1;
			end
			main_ethernetsoc_sdram_bankmachine3_row_close <= 1'd1;
			main_ethernetsoc_sdram_bankmachine3_cmd_payload_is_cmd <= 1'd1;
			if ((~main_ethernetsoc_sdram_bankmachine3_refresh_req)) begin
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
			if (main_ethernetsoc_sdram_bankmachine3_refresh_req) begin
				builder_bankmachine3_next_state <= 3'd4;
			end else begin
				if (main_ethernetsoc_sdram_bankmachine3_cmd_buffer_source_valid) begin
					if (main_ethernetsoc_sdram_bankmachine3_row_opened) begin
						if (main_ethernetsoc_sdram_bankmachine3_row_hit) begin
							main_ethernetsoc_sdram_bankmachine3_cmd_valid <= 1'd1;
							if (main_ethernetsoc_sdram_bankmachine3_cmd_buffer_source_payload_we) begin
								main_ethernetsoc_sdram_bankmachine3_req_wdata_ready <= main_ethernetsoc_sdram_bankmachine3_cmd_ready;
								main_ethernetsoc_sdram_bankmachine3_cmd_payload_is_write <= 1'd1;
								main_ethernetsoc_sdram_bankmachine3_cmd_payload_we <= 1'd1;
							end else begin
								main_ethernetsoc_sdram_bankmachine3_req_rdata_valid <= main_ethernetsoc_sdram_bankmachine3_cmd_ready;
								main_ethernetsoc_sdram_bankmachine3_cmd_payload_is_read <= 1'd1;
							end
							main_ethernetsoc_sdram_bankmachine3_cmd_payload_cas <= 1'd1;
							if ((main_ethernetsoc_sdram_bankmachine3_cmd_ready & main_ethernetsoc_sdram_bankmachine3_auto_precharge)) begin
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
assign main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_sink_valid = main_ethernetsoc_sdram_bankmachine4_req_valid;
assign main_ethernetsoc_sdram_bankmachine4_req_ready = main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_sink_ready;
assign main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_sink_payload_we = main_ethernetsoc_sdram_bankmachine4_req_we;
assign main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_sink_payload_addr = main_ethernetsoc_sdram_bankmachine4_req_addr;
assign main_ethernetsoc_sdram_bankmachine4_cmd_buffer_sink_valid = main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_valid;
assign main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_ready = main_ethernetsoc_sdram_bankmachine4_cmd_buffer_sink_ready;
assign main_ethernetsoc_sdram_bankmachine4_cmd_buffer_sink_first = main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_first;
assign main_ethernetsoc_sdram_bankmachine4_cmd_buffer_sink_last = main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_last;
assign main_ethernetsoc_sdram_bankmachine4_cmd_buffer_sink_payload_we = main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_payload_we;
assign main_ethernetsoc_sdram_bankmachine4_cmd_buffer_sink_payload_addr = main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_payload_addr;
assign main_ethernetsoc_sdram_bankmachine4_cmd_buffer_source_ready = (main_ethernetsoc_sdram_bankmachine4_req_wdata_ready | main_ethernetsoc_sdram_bankmachine4_req_rdata_valid);
assign main_ethernetsoc_sdram_bankmachine4_req_lock = (main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_valid | main_ethernetsoc_sdram_bankmachine4_cmd_buffer_source_valid);
assign main_ethernetsoc_sdram_bankmachine4_row_hit = (main_ethernetsoc_sdram_bankmachine4_row == main_ethernetsoc_sdram_bankmachine4_cmd_buffer_source_payload_addr[20:7]);
assign main_ethernetsoc_sdram_bankmachine4_cmd_payload_ba = 3'd4;
always @(*) begin
	main_ethernetsoc_sdram_bankmachine4_cmd_payload_a <= 14'd0;
	if (main_ethernetsoc_sdram_bankmachine4_row_col_n_addr_sel) begin
		main_ethernetsoc_sdram_bankmachine4_cmd_payload_a <= main_ethernetsoc_sdram_bankmachine4_cmd_buffer_source_payload_addr[20:7];
	end else begin
		main_ethernetsoc_sdram_bankmachine4_cmd_payload_a <= ((main_ethernetsoc_sdram_bankmachine4_auto_precharge <<< 4'd10) | {main_ethernetsoc_sdram_bankmachine4_cmd_buffer_source_payload_addr[6:0], {3{1'd0}}});
	end
end
assign main_ethernetsoc_sdram_bankmachine4_twtpcon_valid = ((main_ethernetsoc_sdram_bankmachine4_cmd_valid & main_ethernetsoc_sdram_bankmachine4_cmd_ready) & main_ethernetsoc_sdram_bankmachine4_cmd_payload_is_write);
assign main_ethernetsoc_sdram_bankmachine4_trccon_valid = ((main_ethernetsoc_sdram_bankmachine4_cmd_valid & main_ethernetsoc_sdram_bankmachine4_cmd_ready) & main_ethernetsoc_sdram_bankmachine4_row_open);
assign main_ethernetsoc_sdram_bankmachine4_trascon_valid = ((main_ethernetsoc_sdram_bankmachine4_cmd_valid & main_ethernetsoc_sdram_bankmachine4_cmd_ready) & main_ethernetsoc_sdram_bankmachine4_row_open);
always @(*) begin
	main_ethernetsoc_sdram_bankmachine4_auto_precharge <= 1'd0;
	if ((main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_valid & main_ethernetsoc_sdram_bankmachine4_cmd_buffer_source_valid)) begin
		if ((main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_payload_addr[20:7] != main_ethernetsoc_sdram_bankmachine4_cmd_buffer_source_payload_addr[20:7])) begin
			main_ethernetsoc_sdram_bankmachine4_auto_precharge <= (main_ethernetsoc_sdram_bankmachine4_row_close == 1'd0);
		end
	end
end
assign main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_din = {main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_in_last, main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_in_first, main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_in_payload_addr, main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_in_payload_we};
assign {main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_out_last, main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_out_first, main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_out_payload_addr, main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_out_payload_we} = main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_dout;
assign main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_sink_ready = main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_writable;
assign main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_we = main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_sink_valid;
assign main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_in_first = main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_sink_first;
assign main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_in_last = main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_sink_last;
assign main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_in_payload_we = main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_sink_payload_we;
assign main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_in_payload_addr = main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_sink_payload_addr;
assign main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_valid = main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_readable;
assign main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_first = main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_out_first;
assign main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_last = main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_out_last;
assign main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_payload_we = main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_out_payload_we;
assign main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_payload_addr = main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_out_payload_addr;
assign main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_re = main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_ready;
always @(*) begin
	main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_wrport_adr <= 3'd0;
	if (main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_replace) begin
		main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_wrport_adr <= (main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_produce - 1'd1);
	end else begin
		main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_wrport_adr <= main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_produce;
	end
end
assign main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_wrport_dat_w = main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_din;
assign main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_wrport_we = (main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_we & (main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_writable | main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_replace));
assign main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_do_read = (main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_readable & main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_re);
assign main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_rdport_adr = main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_consume;
assign main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_dout = main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_rdport_dat_r;
assign main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_writable = (main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_level != 4'd8);
assign main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_readable = (main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_level != 1'd0);
assign main_ethernetsoc_sdram_bankmachine4_cmd_buffer_pipe_ce = (main_ethernetsoc_sdram_bankmachine4_cmd_buffer_source_ready | (~main_ethernetsoc_sdram_bankmachine4_cmd_buffer_valid_n));
assign main_ethernetsoc_sdram_bankmachine4_cmd_buffer_sink_ready = main_ethernetsoc_sdram_bankmachine4_cmd_buffer_pipe_ce;
assign main_ethernetsoc_sdram_bankmachine4_cmd_buffer_source_valid = main_ethernetsoc_sdram_bankmachine4_cmd_buffer_valid_n;
assign main_ethernetsoc_sdram_bankmachine4_cmd_buffer_busy = (1'd0 | main_ethernetsoc_sdram_bankmachine4_cmd_buffer_valid_n);
assign main_ethernetsoc_sdram_bankmachine4_cmd_buffer_source_first = main_ethernetsoc_sdram_bankmachine4_cmd_buffer_first_n;
assign main_ethernetsoc_sdram_bankmachine4_cmd_buffer_source_last = main_ethernetsoc_sdram_bankmachine4_cmd_buffer_last_n;
always @(*) begin
	main_ethernetsoc_sdram_bankmachine4_cmd_payload_we <= 1'd0;
	main_ethernetsoc_sdram_bankmachine4_cmd_payload_is_cmd <= 1'd0;
	main_ethernetsoc_sdram_bankmachine4_row_open <= 1'd0;
	main_ethernetsoc_sdram_bankmachine4_cmd_payload_is_read <= 1'd0;
	main_ethernetsoc_sdram_bankmachine4_row_close <= 1'd0;
	main_ethernetsoc_sdram_bankmachine4_cmd_payload_is_write <= 1'd0;
	builder_bankmachine4_next_state <= 4'd0;
	main_ethernetsoc_sdram_bankmachine4_req_wdata_ready <= 1'd0;
	main_ethernetsoc_sdram_bankmachine4_req_rdata_valid <= 1'd0;
	main_ethernetsoc_sdram_bankmachine4_row_col_n_addr_sel <= 1'd0;
	main_ethernetsoc_sdram_bankmachine4_refresh_gnt <= 1'd0;
	main_ethernetsoc_sdram_bankmachine4_cmd_valid <= 1'd0;
	main_ethernetsoc_sdram_bankmachine4_cmd_payload_cas <= 1'd0;
	main_ethernetsoc_sdram_bankmachine4_cmd_payload_ras <= 1'd0;
	builder_bankmachine4_next_state <= builder_bankmachine4_state;
	case (builder_bankmachine4_state)
		1'd1: begin
			if ((main_ethernetsoc_sdram_bankmachine4_twtpcon_ready & main_ethernetsoc_sdram_bankmachine4_trascon_ready)) begin
				main_ethernetsoc_sdram_bankmachine4_cmd_valid <= 1'd1;
				if (main_ethernetsoc_sdram_bankmachine4_cmd_ready) begin
					builder_bankmachine4_next_state <= 3'd5;
				end
				main_ethernetsoc_sdram_bankmachine4_cmd_payload_ras <= 1'd1;
				main_ethernetsoc_sdram_bankmachine4_cmd_payload_we <= 1'd1;
				main_ethernetsoc_sdram_bankmachine4_cmd_payload_is_cmd <= 1'd1;
			end
			main_ethernetsoc_sdram_bankmachine4_row_close <= 1'd1;
		end
		2'd2: begin
			if ((main_ethernetsoc_sdram_bankmachine4_twtpcon_ready & main_ethernetsoc_sdram_bankmachine4_trascon_ready)) begin
				builder_bankmachine4_next_state <= 3'd5;
			end
			main_ethernetsoc_sdram_bankmachine4_row_close <= 1'd1;
		end
		2'd3: begin
			if (main_ethernetsoc_sdram_bankmachine4_trccon_ready) begin
				main_ethernetsoc_sdram_bankmachine4_row_col_n_addr_sel <= 1'd1;
				main_ethernetsoc_sdram_bankmachine4_row_open <= 1'd1;
				main_ethernetsoc_sdram_bankmachine4_cmd_valid <= 1'd1;
				main_ethernetsoc_sdram_bankmachine4_cmd_payload_is_cmd <= 1'd1;
				if (main_ethernetsoc_sdram_bankmachine4_cmd_ready) begin
					builder_bankmachine4_next_state <= 3'd7;
				end
				main_ethernetsoc_sdram_bankmachine4_cmd_payload_ras <= 1'd1;
			end
		end
		3'd4: begin
			if (main_ethernetsoc_sdram_bankmachine4_twtpcon_ready) begin
				main_ethernetsoc_sdram_bankmachine4_refresh_gnt <= 1'd1;
			end
			main_ethernetsoc_sdram_bankmachine4_row_close <= 1'd1;
			main_ethernetsoc_sdram_bankmachine4_cmd_payload_is_cmd <= 1'd1;
			if ((~main_ethernetsoc_sdram_bankmachine4_refresh_req)) begin
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
			if (main_ethernetsoc_sdram_bankmachine4_refresh_req) begin
				builder_bankmachine4_next_state <= 3'd4;
			end else begin
				if (main_ethernetsoc_sdram_bankmachine4_cmd_buffer_source_valid) begin
					if (main_ethernetsoc_sdram_bankmachine4_row_opened) begin
						if (main_ethernetsoc_sdram_bankmachine4_row_hit) begin
							main_ethernetsoc_sdram_bankmachine4_cmd_valid <= 1'd1;
							if (main_ethernetsoc_sdram_bankmachine4_cmd_buffer_source_payload_we) begin
								main_ethernetsoc_sdram_bankmachine4_req_wdata_ready <= main_ethernetsoc_sdram_bankmachine4_cmd_ready;
								main_ethernetsoc_sdram_bankmachine4_cmd_payload_is_write <= 1'd1;
								main_ethernetsoc_sdram_bankmachine4_cmd_payload_we <= 1'd1;
							end else begin
								main_ethernetsoc_sdram_bankmachine4_req_rdata_valid <= main_ethernetsoc_sdram_bankmachine4_cmd_ready;
								main_ethernetsoc_sdram_bankmachine4_cmd_payload_is_read <= 1'd1;
							end
							main_ethernetsoc_sdram_bankmachine4_cmd_payload_cas <= 1'd1;
							if ((main_ethernetsoc_sdram_bankmachine4_cmd_ready & main_ethernetsoc_sdram_bankmachine4_auto_precharge)) begin
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
assign main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_sink_valid = main_ethernetsoc_sdram_bankmachine5_req_valid;
assign main_ethernetsoc_sdram_bankmachine5_req_ready = main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_sink_ready;
assign main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_sink_payload_we = main_ethernetsoc_sdram_bankmachine5_req_we;
assign main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_sink_payload_addr = main_ethernetsoc_sdram_bankmachine5_req_addr;
assign main_ethernetsoc_sdram_bankmachine5_cmd_buffer_sink_valid = main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_valid;
assign main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_ready = main_ethernetsoc_sdram_bankmachine5_cmd_buffer_sink_ready;
assign main_ethernetsoc_sdram_bankmachine5_cmd_buffer_sink_first = main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_first;
assign main_ethernetsoc_sdram_bankmachine5_cmd_buffer_sink_last = main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_last;
assign main_ethernetsoc_sdram_bankmachine5_cmd_buffer_sink_payload_we = main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_payload_we;
assign main_ethernetsoc_sdram_bankmachine5_cmd_buffer_sink_payload_addr = main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_payload_addr;
assign main_ethernetsoc_sdram_bankmachine5_cmd_buffer_source_ready = (main_ethernetsoc_sdram_bankmachine5_req_wdata_ready | main_ethernetsoc_sdram_bankmachine5_req_rdata_valid);
assign main_ethernetsoc_sdram_bankmachine5_req_lock = (main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_valid | main_ethernetsoc_sdram_bankmachine5_cmd_buffer_source_valid);
assign main_ethernetsoc_sdram_bankmachine5_row_hit = (main_ethernetsoc_sdram_bankmachine5_row == main_ethernetsoc_sdram_bankmachine5_cmd_buffer_source_payload_addr[20:7]);
assign main_ethernetsoc_sdram_bankmachine5_cmd_payload_ba = 3'd5;
always @(*) begin
	main_ethernetsoc_sdram_bankmachine5_cmd_payload_a <= 14'd0;
	if (main_ethernetsoc_sdram_bankmachine5_row_col_n_addr_sel) begin
		main_ethernetsoc_sdram_bankmachine5_cmd_payload_a <= main_ethernetsoc_sdram_bankmachine5_cmd_buffer_source_payload_addr[20:7];
	end else begin
		main_ethernetsoc_sdram_bankmachine5_cmd_payload_a <= ((main_ethernetsoc_sdram_bankmachine5_auto_precharge <<< 4'd10) | {main_ethernetsoc_sdram_bankmachine5_cmd_buffer_source_payload_addr[6:0], {3{1'd0}}});
	end
end
assign main_ethernetsoc_sdram_bankmachine5_twtpcon_valid = ((main_ethernetsoc_sdram_bankmachine5_cmd_valid & main_ethernetsoc_sdram_bankmachine5_cmd_ready) & main_ethernetsoc_sdram_bankmachine5_cmd_payload_is_write);
assign main_ethernetsoc_sdram_bankmachine5_trccon_valid = ((main_ethernetsoc_sdram_bankmachine5_cmd_valid & main_ethernetsoc_sdram_bankmachine5_cmd_ready) & main_ethernetsoc_sdram_bankmachine5_row_open);
assign main_ethernetsoc_sdram_bankmachine5_trascon_valid = ((main_ethernetsoc_sdram_bankmachine5_cmd_valid & main_ethernetsoc_sdram_bankmachine5_cmd_ready) & main_ethernetsoc_sdram_bankmachine5_row_open);
always @(*) begin
	main_ethernetsoc_sdram_bankmachine5_auto_precharge <= 1'd0;
	if ((main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_valid & main_ethernetsoc_sdram_bankmachine5_cmd_buffer_source_valid)) begin
		if ((main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_payload_addr[20:7] != main_ethernetsoc_sdram_bankmachine5_cmd_buffer_source_payload_addr[20:7])) begin
			main_ethernetsoc_sdram_bankmachine5_auto_precharge <= (main_ethernetsoc_sdram_bankmachine5_row_close == 1'd0);
		end
	end
end
assign main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_din = {main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_in_last, main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_in_first, main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_in_payload_addr, main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_in_payload_we};
assign {main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_out_last, main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_out_first, main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_out_payload_addr, main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_out_payload_we} = main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_dout;
assign main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_sink_ready = main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_writable;
assign main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_we = main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_sink_valid;
assign main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_in_first = main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_sink_first;
assign main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_in_last = main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_sink_last;
assign main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_in_payload_we = main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_sink_payload_we;
assign main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_in_payload_addr = main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_sink_payload_addr;
assign main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_valid = main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_readable;
assign main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_first = main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_out_first;
assign main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_last = main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_out_last;
assign main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_payload_we = main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_out_payload_we;
assign main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_payload_addr = main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_out_payload_addr;
assign main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_re = main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_ready;
always @(*) begin
	main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_wrport_adr <= 3'd0;
	if (main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_replace) begin
		main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_wrport_adr <= (main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_produce - 1'd1);
	end else begin
		main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_wrport_adr <= main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_produce;
	end
end
assign main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_wrport_dat_w = main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_din;
assign main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_wrport_we = (main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_we & (main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_writable | main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_replace));
assign main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_do_read = (main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_readable & main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_re);
assign main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_rdport_adr = main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_consume;
assign main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_dout = main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_rdport_dat_r;
assign main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_writable = (main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_level != 4'd8);
assign main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_readable = (main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_level != 1'd0);
assign main_ethernetsoc_sdram_bankmachine5_cmd_buffer_pipe_ce = (main_ethernetsoc_sdram_bankmachine5_cmd_buffer_source_ready | (~main_ethernetsoc_sdram_bankmachine5_cmd_buffer_valid_n));
assign main_ethernetsoc_sdram_bankmachine5_cmd_buffer_sink_ready = main_ethernetsoc_sdram_bankmachine5_cmd_buffer_pipe_ce;
assign main_ethernetsoc_sdram_bankmachine5_cmd_buffer_source_valid = main_ethernetsoc_sdram_bankmachine5_cmd_buffer_valid_n;
assign main_ethernetsoc_sdram_bankmachine5_cmd_buffer_busy = (1'd0 | main_ethernetsoc_sdram_bankmachine5_cmd_buffer_valid_n);
assign main_ethernetsoc_sdram_bankmachine5_cmd_buffer_source_first = main_ethernetsoc_sdram_bankmachine5_cmd_buffer_first_n;
assign main_ethernetsoc_sdram_bankmachine5_cmd_buffer_source_last = main_ethernetsoc_sdram_bankmachine5_cmd_buffer_last_n;
always @(*) begin
	builder_bankmachine5_next_state <= 4'd0;
	main_ethernetsoc_sdram_bankmachine5_cmd_payload_cas <= 1'd0;
	main_ethernetsoc_sdram_bankmachine5_cmd_payload_ras <= 1'd0;
	main_ethernetsoc_sdram_bankmachine5_cmd_payload_we <= 1'd0;
	main_ethernetsoc_sdram_bankmachine5_cmd_payload_is_cmd <= 1'd0;
	main_ethernetsoc_sdram_bankmachine5_row_open <= 1'd0;
	main_ethernetsoc_sdram_bankmachine5_cmd_payload_is_read <= 1'd0;
	main_ethernetsoc_sdram_bankmachine5_row_close <= 1'd0;
	main_ethernetsoc_sdram_bankmachine5_cmd_payload_is_write <= 1'd0;
	main_ethernetsoc_sdram_bankmachine5_req_wdata_ready <= 1'd0;
	main_ethernetsoc_sdram_bankmachine5_req_rdata_valid <= 1'd0;
	main_ethernetsoc_sdram_bankmachine5_row_col_n_addr_sel <= 1'd0;
	main_ethernetsoc_sdram_bankmachine5_refresh_gnt <= 1'd0;
	main_ethernetsoc_sdram_bankmachine5_cmd_valid <= 1'd0;
	builder_bankmachine5_next_state <= builder_bankmachine5_state;
	case (builder_bankmachine5_state)
		1'd1: begin
			if ((main_ethernetsoc_sdram_bankmachine5_twtpcon_ready & main_ethernetsoc_sdram_bankmachine5_trascon_ready)) begin
				main_ethernetsoc_sdram_bankmachine5_cmd_valid <= 1'd1;
				if (main_ethernetsoc_sdram_bankmachine5_cmd_ready) begin
					builder_bankmachine5_next_state <= 3'd5;
				end
				main_ethernetsoc_sdram_bankmachine5_cmd_payload_ras <= 1'd1;
				main_ethernetsoc_sdram_bankmachine5_cmd_payload_we <= 1'd1;
				main_ethernetsoc_sdram_bankmachine5_cmd_payload_is_cmd <= 1'd1;
			end
			main_ethernetsoc_sdram_bankmachine5_row_close <= 1'd1;
		end
		2'd2: begin
			if ((main_ethernetsoc_sdram_bankmachine5_twtpcon_ready & main_ethernetsoc_sdram_bankmachine5_trascon_ready)) begin
				builder_bankmachine5_next_state <= 3'd5;
			end
			main_ethernetsoc_sdram_bankmachine5_row_close <= 1'd1;
		end
		2'd3: begin
			if (main_ethernetsoc_sdram_bankmachine5_trccon_ready) begin
				main_ethernetsoc_sdram_bankmachine5_row_col_n_addr_sel <= 1'd1;
				main_ethernetsoc_sdram_bankmachine5_row_open <= 1'd1;
				main_ethernetsoc_sdram_bankmachine5_cmd_valid <= 1'd1;
				main_ethernetsoc_sdram_bankmachine5_cmd_payload_is_cmd <= 1'd1;
				if (main_ethernetsoc_sdram_bankmachine5_cmd_ready) begin
					builder_bankmachine5_next_state <= 3'd7;
				end
				main_ethernetsoc_sdram_bankmachine5_cmd_payload_ras <= 1'd1;
			end
		end
		3'd4: begin
			if (main_ethernetsoc_sdram_bankmachine5_twtpcon_ready) begin
				main_ethernetsoc_sdram_bankmachine5_refresh_gnt <= 1'd1;
			end
			main_ethernetsoc_sdram_bankmachine5_row_close <= 1'd1;
			main_ethernetsoc_sdram_bankmachine5_cmd_payload_is_cmd <= 1'd1;
			if ((~main_ethernetsoc_sdram_bankmachine5_refresh_req)) begin
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
			if (main_ethernetsoc_sdram_bankmachine5_refresh_req) begin
				builder_bankmachine5_next_state <= 3'd4;
			end else begin
				if (main_ethernetsoc_sdram_bankmachine5_cmd_buffer_source_valid) begin
					if (main_ethernetsoc_sdram_bankmachine5_row_opened) begin
						if (main_ethernetsoc_sdram_bankmachine5_row_hit) begin
							main_ethernetsoc_sdram_bankmachine5_cmd_valid <= 1'd1;
							if (main_ethernetsoc_sdram_bankmachine5_cmd_buffer_source_payload_we) begin
								main_ethernetsoc_sdram_bankmachine5_req_wdata_ready <= main_ethernetsoc_sdram_bankmachine5_cmd_ready;
								main_ethernetsoc_sdram_bankmachine5_cmd_payload_is_write <= 1'd1;
								main_ethernetsoc_sdram_bankmachine5_cmd_payload_we <= 1'd1;
							end else begin
								main_ethernetsoc_sdram_bankmachine5_req_rdata_valid <= main_ethernetsoc_sdram_bankmachine5_cmd_ready;
								main_ethernetsoc_sdram_bankmachine5_cmd_payload_is_read <= 1'd1;
							end
							main_ethernetsoc_sdram_bankmachine5_cmd_payload_cas <= 1'd1;
							if ((main_ethernetsoc_sdram_bankmachine5_cmd_ready & main_ethernetsoc_sdram_bankmachine5_auto_precharge)) begin
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
assign main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_sink_valid = main_ethernetsoc_sdram_bankmachine6_req_valid;
assign main_ethernetsoc_sdram_bankmachine6_req_ready = main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_sink_ready;
assign main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_sink_payload_we = main_ethernetsoc_sdram_bankmachine6_req_we;
assign main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_sink_payload_addr = main_ethernetsoc_sdram_bankmachine6_req_addr;
assign main_ethernetsoc_sdram_bankmachine6_cmd_buffer_sink_valid = main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_valid;
assign main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_ready = main_ethernetsoc_sdram_bankmachine6_cmd_buffer_sink_ready;
assign main_ethernetsoc_sdram_bankmachine6_cmd_buffer_sink_first = main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_first;
assign main_ethernetsoc_sdram_bankmachine6_cmd_buffer_sink_last = main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_last;
assign main_ethernetsoc_sdram_bankmachine6_cmd_buffer_sink_payload_we = main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_payload_we;
assign main_ethernetsoc_sdram_bankmachine6_cmd_buffer_sink_payload_addr = main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_payload_addr;
assign main_ethernetsoc_sdram_bankmachine6_cmd_buffer_source_ready = (main_ethernetsoc_sdram_bankmachine6_req_wdata_ready | main_ethernetsoc_sdram_bankmachine6_req_rdata_valid);
assign main_ethernetsoc_sdram_bankmachine6_req_lock = (main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_valid | main_ethernetsoc_sdram_bankmachine6_cmd_buffer_source_valid);
assign main_ethernetsoc_sdram_bankmachine6_row_hit = (main_ethernetsoc_sdram_bankmachine6_row == main_ethernetsoc_sdram_bankmachine6_cmd_buffer_source_payload_addr[20:7]);
assign main_ethernetsoc_sdram_bankmachine6_cmd_payload_ba = 3'd6;
always @(*) begin
	main_ethernetsoc_sdram_bankmachine6_cmd_payload_a <= 14'd0;
	if (main_ethernetsoc_sdram_bankmachine6_row_col_n_addr_sel) begin
		main_ethernetsoc_sdram_bankmachine6_cmd_payload_a <= main_ethernetsoc_sdram_bankmachine6_cmd_buffer_source_payload_addr[20:7];
	end else begin
		main_ethernetsoc_sdram_bankmachine6_cmd_payload_a <= ((main_ethernetsoc_sdram_bankmachine6_auto_precharge <<< 4'd10) | {main_ethernetsoc_sdram_bankmachine6_cmd_buffer_source_payload_addr[6:0], {3{1'd0}}});
	end
end
assign main_ethernetsoc_sdram_bankmachine6_twtpcon_valid = ((main_ethernetsoc_sdram_bankmachine6_cmd_valid & main_ethernetsoc_sdram_bankmachine6_cmd_ready) & main_ethernetsoc_sdram_bankmachine6_cmd_payload_is_write);
assign main_ethernetsoc_sdram_bankmachine6_trccon_valid = ((main_ethernetsoc_sdram_bankmachine6_cmd_valid & main_ethernetsoc_sdram_bankmachine6_cmd_ready) & main_ethernetsoc_sdram_bankmachine6_row_open);
assign main_ethernetsoc_sdram_bankmachine6_trascon_valid = ((main_ethernetsoc_sdram_bankmachine6_cmd_valid & main_ethernetsoc_sdram_bankmachine6_cmd_ready) & main_ethernetsoc_sdram_bankmachine6_row_open);
always @(*) begin
	main_ethernetsoc_sdram_bankmachine6_auto_precharge <= 1'd0;
	if ((main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_valid & main_ethernetsoc_sdram_bankmachine6_cmd_buffer_source_valid)) begin
		if ((main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_payload_addr[20:7] != main_ethernetsoc_sdram_bankmachine6_cmd_buffer_source_payload_addr[20:7])) begin
			main_ethernetsoc_sdram_bankmachine6_auto_precharge <= (main_ethernetsoc_sdram_bankmachine6_row_close == 1'd0);
		end
	end
end
assign main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_din = {main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_in_last, main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_in_first, main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_in_payload_addr, main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_in_payload_we};
assign {main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_out_last, main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_out_first, main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_out_payload_addr, main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_out_payload_we} = main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_dout;
assign main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_sink_ready = main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_writable;
assign main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_we = main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_sink_valid;
assign main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_in_first = main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_sink_first;
assign main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_in_last = main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_sink_last;
assign main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_in_payload_we = main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_sink_payload_we;
assign main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_in_payload_addr = main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_sink_payload_addr;
assign main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_valid = main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_readable;
assign main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_first = main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_out_first;
assign main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_last = main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_out_last;
assign main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_payload_we = main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_out_payload_we;
assign main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_payload_addr = main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_out_payload_addr;
assign main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_re = main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_ready;
always @(*) begin
	main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_wrport_adr <= 3'd0;
	if (main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_replace) begin
		main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_wrport_adr <= (main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_produce - 1'd1);
	end else begin
		main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_wrport_adr <= main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_produce;
	end
end
assign main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_wrport_dat_w = main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_din;
assign main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_wrport_we = (main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_we & (main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_writable | main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_replace));
assign main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_do_read = (main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_readable & main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_re);
assign main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_rdport_adr = main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_consume;
assign main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_dout = main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_rdport_dat_r;
assign main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_writable = (main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_level != 4'd8);
assign main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_readable = (main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_level != 1'd0);
assign main_ethernetsoc_sdram_bankmachine6_cmd_buffer_pipe_ce = (main_ethernetsoc_sdram_bankmachine6_cmd_buffer_source_ready | (~main_ethernetsoc_sdram_bankmachine6_cmd_buffer_valid_n));
assign main_ethernetsoc_sdram_bankmachine6_cmd_buffer_sink_ready = main_ethernetsoc_sdram_bankmachine6_cmd_buffer_pipe_ce;
assign main_ethernetsoc_sdram_bankmachine6_cmd_buffer_source_valid = main_ethernetsoc_sdram_bankmachine6_cmd_buffer_valid_n;
assign main_ethernetsoc_sdram_bankmachine6_cmd_buffer_busy = (1'd0 | main_ethernetsoc_sdram_bankmachine6_cmd_buffer_valid_n);
assign main_ethernetsoc_sdram_bankmachine6_cmd_buffer_source_first = main_ethernetsoc_sdram_bankmachine6_cmd_buffer_first_n;
assign main_ethernetsoc_sdram_bankmachine6_cmd_buffer_source_last = main_ethernetsoc_sdram_bankmachine6_cmd_buffer_last_n;
always @(*) begin
	main_ethernetsoc_sdram_bankmachine6_req_wdata_ready <= 1'd0;
	main_ethernetsoc_sdram_bankmachine6_req_rdata_valid <= 1'd0;
	main_ethernetsoc_sdram_bankmachine6_row_col_n_addr_sel <= 1'd0;
	main_ethernetsoc_sdram_bankmachine6_refresh_gnt <= 1'd0;
	builder_bankmachine6_next_state <= 4'd0;
	main_ethernetsoc_sdram_bankmachine6_cmd_valid <= 1'd0;
	main_ethernetsoc_sdram_bankmachine6_cmd_payload_cas <= 1'd0;
	main_ethernetsoc_sdram_bankmachine6_cmd_payload_ras <= 1'd0;
	main_ethernetsoc_sdram_bankmachine6_cmd_payload_we <= 1'd0;
	main_ethernetsoc_sdram_bankmachine6_cmd_payload_is_cmd <= 1'd0;
	main_ethernetsoc_sdram_bankmachine6_row_open <= 1'd0;
	main_ethernetsoc_sdram_bankmachine6_cmd_payload_is_read <= 1'd0;
	main_ethernetsoc_sdram_bankmachine6_row_close <= 1'd0;
	main_ethernetsoc_sdram_bankmachine6_cmd_payload_is_write <= 1'd0;
	builder_bankmachine6_next_state <= builder_bankmachine6_state;
	case (builder_bankmachine6_state)
		1'd1: begin
			if ((main_ethernetsoc_sdram_bankmachine6_twtpcon_ready & main_ethernetsoc_sdram_bankmachine6_trascon_ready)) begin
				main_ethernetsoc_sdram_bankmachine6_cmd_valid <= 1'd1;
				if (main_ethernetsoc_sdram_bankmachine6_cmd_ready) begin
					builder_bankmachine6_next_state <= 3'd5;
				end
				main_ethernetsoc_sdram_bankmachine6_cmd_payload_ras <= 1'd1;
				main_ethernetsoc_sdram_bankmachine6_cmd_payload_we <= 1'd1;
				main_ethernetsoc_sdram_bankmachine6_cmd_payload_is_cmd <= 1'd1;
			end
			main_ethernetsoc_sdram_bankmachine6_row_close <= 1'd1;
		end
		2'd2: begin
			if ((main_ethernetsoc_sdram_bankmachine6_twtpcon_ready & main_ethernetsoc_sdram_bankmachine6_trascon_ready)) begin
				builder_bankmachine6_next_state <= 3'd5;
			end
			main_ethernetsoc_sdram_bankmachine6_row_close <= 1'd1;
		end
		2'd3: begin
			if (main_ethernetsoc_sdram_bankmachine6_trccon_ready) begin
				main_ethernetsoc_sdram_bankmachine6_row_col_n_addr_sel <= 1'd1;
				main_ethernetsoc_sdram_bankmachine6_row_open <= 1'd1;
				main_ethernetsoc_sdram_bankmachine6_cmd_valid <= 1'd1;
				main_ethernetsoc_sdram_bankmachine6_cmd_payload_is_cmd <= 1'd1;
				if (main_ethernetsoc_sdram_bankmachine6_cmd_ready) begin
					builder_bankmachine6_next_state <= 3'd7;
				end
				main_ethernetsoc_sdram_bankmachine6_cmd_payload_ras <= 1'd1;
			end
		end
		3'd4: begin
			if (main_ethernetsoc_sdram_bankmachine6_twtpcon_ready) begin
				main_ethernetsoc_sdram_bankmachine6_refresh_gnt <= 1'd1;
			end
			main_ethernetsoc_sdram_bankmachine6_row_close <= 1'd1;
			main_ethernetsoc_sdram_bankmachine6_cmd_payload_is_cmd <= 1'd1;
			if ((~main_ethernetsoc_sdram_bankmachine6_refresh_req)) begin
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
			if (main_ethernetsoc_sdram_bankmachine6_refresh_req) begin
				builder_bankmachine6_next_state <= 3'd4;
			end else begin
				if (main_ethernetsoc_sdram_bankmachine6_cmd_buffer_source_valid) begin
					if (main_ethernetsoc_sdram_bankmachine6_row_opened) begin
						if (main_ethernetsoc_sdram_bankmachine6_row_hit) begin
							main_ethernetsoc_sdram_bankmachine6_cmd_valid <= 1'd1;
							if (main_ethernetsoc_sdram_bankmachine6_cmd_buffer_source_payload_we) begin
								main_ethernetsoc_sdram_bankmachine6_req_wdata_ready <= main_ethernetsoc_sdram_bankmachine6_cmd_ready;
								main_ethernetsoc_sdram_bankmachine6_cmd_payload_is_write <= 1'd1;
								main_ethernetsoc_sdram_bankmachine6_cmd_payload_we <= 1'd1;
							end else begin
								main_ethernetsoc_sdram_bankmachine6_req_rdata_valid <= main_ethernetsoc_sdram_bankmachine6_cmd_ready;
								main_ethernetsoc_sdram_bankmachine6_cmd_payload_is_read <= 1'd1;
							end
							main_ethernetsoc_sdram_bankmachine6_cmd_payload_cas <= 1'd1;
							if ((main_ethernetsoc_sdram_bankmachine6_cmd_ready & main_ethernetsoc_sdram_bankmachine6_auto_precharge)) begin
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
assign main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_sink_valid = main_ethernetsoc_sdram_bankmachine7_req_valid;
assign main_ethernetsoc_sdram_bankmachine7_req_ready = main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_sink_ready;
assign main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_sink_payload_we = main_ethernetsoc_sdram_bankmachine7_req_we;
assign main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_sink_payload_addr = main_ethernetsoc_sdram_bankmachine7_req_addr;
assign main_ethernetsoc_sdram_bankmachine7_cmd_buffer_sink_valid = main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_valid;
assign main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_ready = main_ethernetsoc_sdram_bankmachine7_cmd_buffer_sink_ready;
assign main_ethernetsoc_sdram_bankmachine7_cmd_buffer_sink_first = main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_first;
assign main_ethernetsoc_sdram_bankmachine7_cmd_buffer_sink_last = main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_last;
assign main_ethernetsoc_sdram_bankmachine7_cmd_buffer_sink_payload_we = main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_payload_we;
assign main_ethernetsoc_sdram_bankmachine7_cmd_buffer_sink_payload_addr = main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_payload_addr;
assign main_ethernetsoc_sdram_bankmachine7_cmd_buffer_source_ready = (main_ethernetsoc_sdram_bankmachine7_req_wdata_ready | main_ethernetsoc_sdram_bankmachine7_req_rdata_valid);
assign main_ethernetsoc_sdram_bankmachine7_req_lock = (main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_valid | main_ethernetsoc_sdram_bankmachine7_cmd_buffer_source_valid);
assign main_ethernetsoc_sdram_bankmachine7_row_hit = (main_ethernetsoc_sdram_bankmachine7_row == main_ethernetsoc_sdram_bankmachine7_cmd_buffer_source_payload_addr[20:7]);
assign main_ethernetsoc_sdram_bankmachine7_cmd_payload_ba = 3'd7;
always @(*) begin
	main_ethernetsoc_sdram_bankmachine7_cmd_payload_a <= 14'd0;
	if (main_ethernetsoc_sdram_bankmachine7_row_col_n_addr_sel) begin
		main_ethernetsoc_sdram_bankmachine7_cmd_payload_a <= main_ethernetsoc_sdram_bankmachine7_cmd_buffer_source_payload_addr[20:7];
	end else begin
		main_ethernetsoc_sdram_bankmachine7_cmd_payload_a <= ((main_ethernetsoc_sdram_bankmachine7_auto_precharge <<< 4'd10) | {main_ethernetsoc_sdram_bankmachine7_cmd_buffer_source_payload_addr[6:0], {3{1'd0}}});
	end
end
assign main_ethernetsoc_sdram_bankmachine7_twtpcon_valid = ((main_ethernetsoc_sdram_bankmachine7_cmd_valid & main_ethernetsoc_sdram_bankmachine7_cmd_ready) & main_ethernetsoc_sdram_bankmachine7_cmd_payload_is_write);
assign main_ethernetsoc_sdram_bankmachine7_trccon_valid = ((main_ethernetsoc_sdram_bankmachine7_cmd_valid & main_ethernetsoc_sdram_bankmachine7_cmd_ready) & main_ethernetsoc_sdram_bankmachine7_row_open);
assign main_ethernetsoc_sdram_bankmachine7_trascon_valid = ((main_ethernetsoc_sdram_bankmachine7_cmd_valid & main_ethernetsoc_sdram_bankmachine7_cmd_ready) & main_ethernetsoc_sdram_bankmachine7_row_open);
always @(*) begin
	main_ethernetsoc_sdram_bankmachine7_auto_precharge <= 1'd0;
	if ((main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_valid & main_ethernetsoc_sdram_bankmachine7_cmd_buffer_source_valid)) begin
		if ((main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_payload_addr[20:7] != main_ethernetsoc_sdram_bankmachine7_cmd_buffer_source_payload_addr[20:7])) begin
			main_ethernetsoc_sdram_bankmachine7_auto_precharge <= (main_ethernetsoc_sdram_bankmachine7_row_close == 1'd0);
		end
	end
end
assign main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_din = {main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_in_last, main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_in_first, main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_in_payload_addr, main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_in_payload_we};
assign {main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_out_last, main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_out_first, main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_out_payload_addr, main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_out_payload_we} = main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_dout;
assign main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_sink_ready = main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_writable;
assign main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_we = main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_sink_valid;
assign main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_in_first = main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_sink_first;
assign main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_in_last = main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_sink_last;
assign main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_in_payload_we = main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_sink_payload_we;
assign main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_in_payload_addr = main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_sink_payload_addr;
assign main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_valid = main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_readable;
assign main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_first = main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_out_first;
assign main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_last = main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_out_last;
assign main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_payload_we = main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_out_payload_we;
assign main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_payload_addr = main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_out_payload_addr;
assign main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_re = main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_ready;
always @(*) begin
	main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_wrport_adr <= 3'd0;
	if (main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_replace) begin
		main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_wrport_adr <= (main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_produce - 1'd1);
	end else begin
		main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_wrport_adr <= main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_produce;
	end
end
assign main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_wrport_dat_w = main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_din;
assign main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_wrport_we = (main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_we & (main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_writable | main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_replace));
assign main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_do_read = (main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_readable & main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_re);
assign main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_rdport_adr = main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_consume;
assign main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_dout = main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_rdport_dat_r;
assign main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_writable = (main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_level != 4'd8);
assign main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_readable = (main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_level != 1'd0);
assign main_ethernetsoc_sdram_bankmachine7_cmd_buffer_pipe_ce = (main_ethernetsoc_sdram_bankmachine7_cmd_buffer_source_ready | (~main_ethernetsoc_sdram_bankmachine7_cmd_buffer_valid_n));
assign main_ethernetsoc_sdram_bankmachine7_cmd_buffer_sink_ready = main_ethernetsoc_sdram_bankmachine7_cmd_buffer_pipe_ce;
assign main_ethernetsoc_sdram_bankmachine7_cmd_buffer_source_valid = main_ethernetsoc_sdram_bankmachine7_cmd_buffer_valid_n;
assign main_ethernetsoc_sdram_bankmachine7_cmd_buffer_busy = (1'd0 | main_ethernetsoc_sdram_bankmachine7_cmd_buffer_valid_n);
assign main_ethernetsoc_sdram_bankmachine7_cmd_buffer_source_first = main_ethernetsoc_sdram_bankmachine7_cmd_buffer_first_n;
assign main_ethernetsoc_sdram_bankmachine7_cmd_buffer_source_last = main_ethernetsoc_sdram_bankmachine7_cmd_buffer_last_n;
always @(*) begin
	main_ethernetsoc_sdram_bankmachine7_cmd_payload_cas <= 1'd0;
	main_ethernetsoc_sdram_bankmachine7_cmd_payload_ras <= 1'd0;
	main_ethernetsoc_sdram_bankmachine7_cmd_payload_we <= 1'd0;
	main_ethernetsoc_sdram_bankmachine7_cmd_payload_is_cmd <= 1'd0;
	builder_bankmachine7_next_state <= 4'd0;
	main_ethernetsoc_sdram_bankmachine7_cmd_payload_is_read <= 1'd0;
	main_ethernetsoc_sdram_bankmachine7_row_close <= 1'd0;
	main_ethernetsoc_sdram_bankmachine7_cmd_payload_is_write <= 1'd0;
	main_ethernetsoc_sdram_bankmachine7_row_open <= 1'd0;
	main_ethernetsoc_sdram_bankmachine7_req_wdata_ready <= 1'd0;
	main_ethernetsoc_sdram_bankmachine7_req_rdata_valid <= 1'd0;
	main_ethernetsoc_sdram_bankmachine7_row_col_n_addr_sel <= 1'd0;
	main_ethernetsoc_sdram_bankmachine7_refresh_gnt <= 1'd0;
	main_ethernetsoc_sdram_bankmachine7_cmd_valid <= 1'd0;
	builder_bankmachine7_next_state <= builder_bankmachine7_state;
	case (builder_bankmachine7_state)
		1'd1: begin
			if ((main_ethernetsoc_sdram_bankmachine7_twtpcon_ready & main_ethernetsoc_sdram_bankmachine7_trascon_ready)) begin
				main_ethernetsoc_sdram_bankmachine7_cmd_valid <= 1'd1;
				if (main_ethernetsoc_sdram_bankmachine7_cmd_ready) begin
					builder_bankmachine7_next_state <= 3'd5;
				end
				main_ethernetsoc_sdram_bankmachine7_cmd_payload_ras <= 1'd1;
				main_ethernetsoc_sdram_bankmachine7_cmd_payload_we <= 1'd1;
				main_ethernetsoc_sdram_bankmachine7_cmd_payload_is_cmd <= 1'd1;
			end
			main_ethernetsoc_sdram_bankmachine7_row_close <= 1'd1;
		end
		2'd2: begin
			if ((main_ethernetsoc_sdram_bankmachine7_twtpcon_ready & main_ethernetsoc_sdram_bankmachine7_trascon_ready)) begin
				builder_bankmachine7_next_state <= 3'd5;
			end
			main_ethernetsoc_sdram_bankmachine7_row_close <= 1'd1;
		end
		2'd3: begin
			if (main_ethernetsoc_sdram_bankmachine7_trccon_ready) begin
				main_ethernetsoc_sdram_bankmachine7_row_col_n_addr_sel <= 1'd1;
				main_ethernetsoc_sdram_bankmachine7_row_open <= 1'd1;
				main_ethernetsoc_sdram_bankmachine7_cmd_valid <= 1'd1;
				main_ethernetsoc_sdram_bankmachine7_cmd_payload_is_cmd <= 1'd1;
				if (main_ethernetsoc_sdram_bankmachine7_cmd_ready) begin
					builder_bankmachine7_next_state <= 3'd7;
				end
				main_ethernetsoc_sdram_bankmachine7_cmd_payload_ras <= 1'd1;
			end
		end
		3'd4: begin
			if (main_ethernetsoc_sdram_bankmachine7_twtpcon_ready) begin
				main_ethernetsoc_sdram_bankmachine7_refresh_gnt <= 1'd1;
			end
			main_ethernetsoc_sdram_bankmachine7_row_close <= 1'd1;
			main_ethernetsoc_sdram_bankmachine7_cmd_payload_is_cmd <= 1'd1;
			if ((~main_ethernetsoc_sdram_bankmachine7_refresh_req)) begin
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
			if (main_ethernetsoc_sdram_bankmachine7_refresh_req) begin
				builder_bankmachine7_next_state <= 3'd4;
			end else begin
				if (main_ethernetsoc_sdram_bankmachine7_cmd_buffer_source_valid) begin
					if (main_ethernetsoc_sdram_bankmachine7_row_opened) begin
						if (main_ethernetsoc_sdram_bankmachine7_row_hit) begin
							main_ethernetsoc_sdram_bankmachine7_cmd_valid <= 1'd1;
							if (main_ethernetsoc_sdram_bankmachine7_cmd_buffer_source_payload_we) begin
								main_ethernetsoc_sdram_bankmachine7_req_wdata_ready <= main_ethernetsoc_sdram_bankmachine7_cmd_ready;
								main_ethernetsoc_sdram_bankmachine7_cmd_payload_is_write <= 1'd1;
								main_ethernetsoc_sdram_bankmachine7_cmd_payload_we <= 1'd1;
							end else begin
								main_ethernetsoc_sdram_bankmachine7_req_rdata_valid <= main_ethernetsoc_sdram_bankmachine7_cmd_ready;
								main_ethernetsoc_sdram_bankmachine7_cmd_payload_is_read <= 1'd1;
							end
							main_ethernetsoc_sdram_bankmachine7_cmd_payload_cas <= 1'd1;
							if ((main_ethernetsoc_sdram_bankmachine7_cmd_ready & main_ethernetsoc_sdram_bankmachine7_auto_precharge)) begin
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
assign main_ethernetsoc_sdram_trrdcon_valid = ((main_ethernetsoc_sdram_choose_cmd_cmd_valid & main_ethernetsoc_sdram_choose_cmd_cmd_ready) & ((main_ethernetsoc_sdram_choose_cmd_cmd_payload_ras & (~main_ethernetsoc_sdram_choose_cmd_cmd_payload_cas)) & (~main_ethernetsoc_sdram_choose_cmd_cmd_payload_we)));
assign main_ethernetsoc_sdram_tfawcon_valid = ((main_ethernetsoc_sdram_choose_cmd_cmd_valid & main_ethernetsoc_sdram_choose_cmd_cmd_ready) & ((main_ethernetsoc_sdram_choose_cmd_cmd_payload_ras & (~main_ethernetsoc_sdram_choose_cmd_cmd_payload_cas)) & (~main_ethernetsoc_sdram_choose_cmd_cmd_payload_we)));
assign main_ethernetsoc_sdram_ras_allowed = (main_ethernetsoc_sdram_trrdcon_ready & main_ethernetsoc_sdram_tfawcon_ready);
assign main_ethernetsoc_sdram_tccdcon_valid = ((main_ethernetsoc_sdram_choose_req_cmd_valid & main_ethernetsoc_sdram_choose_req_cmd_ready) & (main_ethernetsoc_sdram_choose_req_cmd_payload_is_write | main_ethernetsoc_sdram_choose_req_cmd_payload_is_read));
assign main_ethernetsoc_sdram_cas_allowed = main_ethernetsoc_sdram_tccdcon_ready;
assign main_ethernetsoc_sdram_twtrcon_valid = ((main_ethernetsoc_sdram_choose_req_cmd_valid & main_ethernetsoc_sdram_choose_req_cmd_ready) & main_ethernetsoc_sdram_choose_req_cmd_payload_is_write);
assign main_ethernetsoc_sdram_read_available = ((((((((main_ethernetsoc_sdram_bankmachine0_cmd_valid & main_ethernetsoc_sdram_bankmachine0_cmd_payload_is_read) | (main_ethernetsoc_sdram_bankmachine1_cmd_valid & main_ethernetsoc_sdram_bankmachine1_cmd_payload_is_read)) | (main_ethernetsoc_sdram_bankmachine2_cmd_valid & main_ethernetsoc_sdram_bankmachine2_cmd_payload_is_read)) | (main_ethernetsoc_sdram_bankmachine3_cmd_valid & main_ethernetsoc_sdram_bankmachine3_cmd_payload_is_read)) | (main_ethernetsoc_sdram_bankmachine4_cmd_valid & main_ethernetsoc_sdram_bankmachine4_cmd_payload_is_read)) | (main_ethernetsoc_sdram_bankmachine5_cmd_valid & main_ethernetsoc_sdram_bankmachine5_cmd_payload_is_read)) | (main_ethernetsoc_sdram_bankmachine6_cmd_valid & main_ethernetsoc_sdram_bankmachine6_cmd_payload_is_read)) | (main_ethernetsoc_sdram_bankmachine7_cmd_valid & main_ethernetsoc_sdram_bankmachine7_cmd_payload_is_read));
assign main_ethernetsoc_sdram_write_available = ((((((((main_ethernetsoc_sdram_bankmachine0_cmd_valid & main_ethernetsoc_sdram_bankmachine0_cmd_payload_is_write) | (main_ethernetsoc_sdram_bankmachine1_cmd_valid & main_ethernetsoc_sdram_bankmachine1_cmd_payload_is_write)) | (main_ethernetsoc_sdram_bankmachine2_cmd_valid & main_ethernetsoc_sdram_bankmachine2_cmd_payload_is_write)) | (main_ethernetsoc_sdram_bankmachine3_cmd_valid & main_ethernetsoc_sdram_bankmachine3_cmd_payload_is_write)) | (main_ethernetsoc_sdram_bankmachine4_cmd_valid & main_ethernetsoc_sdram_bankmachine4_cmd_payload_is_write)) | (main_ethernetsoc_sdram_bankmachine5_cmd_valid & main_ethernetsoc_sdram_bankmachine5_cmd_payload_is_write)) | (main_ethernetsoc_sdram_bankmachine6_cmd_valid & main_ethernetsoc_sdram_bankmachine6_cmd_payload_is_write)) | (main_ethernetsoc_sdram_bankmachine7_cmd_valid & main_ethernetsoc_sdram_bankmachine7_cmd_payload_is_write));
assign main_ethernetsoc_sdram_max_time0 = (main_ethernetsoc_sdram_time0 == 1'd0);
assign main_ethernetsoc_sdram_max_time1 = (main_ethernetsoc_sdram_time1 == 1'd0);
assign main_ethernetsoc_sdram_bankmachine0_refresh_req = main_ethernetsoc_sdram_cmd_valid;
assign main_ethernetsoc_sdram_bankmachine1_refresh_req = main_ethernetsoc_sdram_cmd_valid;
assign main_ethernetsoc_sdram_bankmachine2_refresh_req = main_ethernetsoc_sdram_cmd_valid;
assign main_ethernetsoc_sdram_bankmachine3_refresh_req = main_ethernetsoc_sdram_cmd_valid;
assign main_ethernetsoc_sdram_bankmachine4_refresh_req = main_ethernetsoc_sdram_cmd_valid;
assign main_ethernetsoc_sdram_bankmachine5_refresh_req = main_ethernetsoc_sdram_cmd_valid;
assign main_ethernetsoc_sdram_bankmachine6_refresh_req = main_ethernetsoc_sdram_cmd_valid;
assign main_ethernetsoc_sdram_bankmachine7_refresh_req = main_ethernetsoc_sdram_cmd_valid;
assign main_ethernetsoc_sdram_go_to_refresh = (((((((main_ethernetsoc_sdram_bankmachine0_refresh_gnt & main_ethernetsoc_sdram_bankmachine1_refresh_gnt) & main_ethernetsoc_sdram_bankmachine2_refresh_gnt) & main_ethernetsoc_sdram_bankmachine3_refresh_gnt) & main_ethernetsoc_sdram_bankmachine4_refresh_gnt) & main_ethernetsoc_sdram_bankmachine5_refresh_gnt) & main_ethernetsoc_sdram_bankmachine6_refresh_gnt) & main_ethernetsoc_sdram_bankmachine7_refresh_gnt);
assign main_ethernetsoc_sdram_interface_rdata = {main_ethernetsoc_sdram_dfi_p3_rddata, main_ethernetsoc_sdram_dfi_p2_rddata, main_ethernetsoc_sdram_dfi_p1_rddata, main_ethernetsoc_sdram_dfi_p0_rddata};
assign {main_ethernetsoc_sdram_dfi_p3_wrdata, main_ethernetsoc_sdram_dfi_p2_wrdata, main_ethernetsoc_sdram_dfi_p1_wrdata, main_ethernetsoc_sdram_dfi_p0_wrdata} = main_ethernetsoc_sdram_interface_wdata;
assign {main_ethernetsoc_sdram_dfi_p3_wrdata_mask, main_ethernetsoc_sdram_dfi_p2_wrdata_mask, main_ethernetsoc_sdram_dfi_p1_wrdata_mask, main_ethernetsoc_sdram_dfi_p0_wrdata_mask} = (~main_ethernetsoc_sdram_interface_wdata_we);
always @(*) begin
	main_ethernetsoc_sdram_choose_cmd_valids <= 8'd0;
	main_ethernetsoc_sdram_choose_cmd_valids[0] <= (main_ethernetsoc_sdram_bankmachine0_cmd_valid & (((main_ethernetsoc_sdram_bankmachine0_cmd_payload_is_cmd & main_ethernetsoc_sdram_choose_cmd_want_cmds) & ((~((main_ethernetsoc_sdram_bankmachine0_cmd_payload_ras & (~main_ethernetsoc_sdram_bankmachine0_cmd_payload_cas)) & (~main_ethernetsoc_sdram_bankmachine0_cmd_payload_we))) | main_ethernetsoc_sdram_choose_cmd_want_activates)) | ((main_ethernetsoc_sdram_bankmachine0_cmd_payload_is_read == main_ethernetsoc_sdram_choose_cmd_want_reads) & (main_ethernetsoc_sdram_bankmachine0_cmd_payload_is_write == main_ethernetsoc_sdram_choose_cmd_want_writes))));
	main_ethernetsoc_sdram_choose_cmd_valids[1] <= (main_ethernetsoc_sdram_bankmachine1_cmd_valid & (((main_ethernetsoc_sdram_bankmachine1_cmd_payload_is_cmd & main_ethernetsoc_sdram_choose_cmd_want_cmds) & ((~((main_ethernetsoc_sdram_bankmachine1_cmd_payload_ras & (~main_ethernetsoc_sdram_bankmachine1_cmd_payload_cas)) & (~main_ethernetsoc_sdram_bankmachine1_cmd_payload_we))) | main_ethernetsoc_sdram_choose_cmd_want_activates)) | ((main_ethernetsoc_sdram_bankmachine1_cmd_payload_is_read == main_ethernetsoc_sdram_choose_cmd_want_reads) & (main_ethernetsoc_sdram_bankmachine1_cmd_payload_is_write == main_ethernetsoc_sdram_choose_cmd_want_writes))));
	main_ethernetsoc_sdram_choose_cmd_valids[2] <= (main_ethernetsoc_sdram_bankmachine2_cmd_valid & (((main_ethernetsoc_sdram_bankmachine2_cmd_payload_is_cmd & main_ethernetsoc_sdram_choose_cmd_want_cmds) & ((~((main_ethernetsoc_sdram_bankmachine2_cmd_payload_ras & (~main_ethernetsoc_sdram_bankmachine2_cmd_payload_cas)) & (~main_ethernetsoc_sdram_bankmachine2_cmd_payload_we))) | main_ethernetsoc_sdram_choose_cmd_want_activates)) | ((main_ethernetsoc_sdram_bankmachine2_cmd_payload_is_read == main_ethernetsoc_sdram_choose_cmd_want_reads) & (main_ethernetsoc_sdram_bankmachine2_cmd_payload_is_write == main_ethernetsoc_sdram_choose_cmd_want_writes))));
	main_ethernetsoc_sdram_choose_cmd_valids[3] <= (main_ethernetsoc_sdram_bankmachine3_cmd_valid & (((main_ethernetsoc_sdram_bankmachine3_cmd_payload_is_cmd & main_ethernetsoc_sdram_choose_cmd_want_cmds) & ((~((main_ethernetsoc_sdram_bankmachine3_cmd_payload_ras & (~main_ethernetsoc_sdram_bankmachine3_cmd_payload_cas)) & (~main_ethernetsoc_sdram_bankmachine3_cmd_payload_we))) | main_ethernetsoc_sdram_choose_cmd_want_activates)) | ((main_ethernetsoc_sdram_bankmachine3_cmd_payload_is_read == main_ethernetsoc_sdram_choose_cmd_want_reads) & (main_ethernetsoc_sdram_bankmachine3_cmd_payload_is_write == main_ethernetsoc_sdram_choose_cmd_want_writes))));
	main_ethernetsoc_sdram_choose_cmd_valids[4] <= (main_ethernetsoc_sdram_bankmachine4_cmd_valid & (((main_ethernetsoc_sdram_bankmachine4_cmd_payload_is_cmd & main_ethernetsoc_sdram_choose_cmd_want_cmds) & ((~((main_ethernetsoc_sdram_bankmachine4_cmd_payload_ras & (~main_ethernetsoc_sdram_bankmachine4_cmd_payload_cas)) & (~main_ethernetsoc_sdram_bankmachine4_cmd_payload_we))) | main_ethernetsoc_sdram_choose_cmd_want_activates)) | ((main_ethernetsoc_sdram_bankmachine4_cmd_payload_is_read == main_ethernetsoc_sdram_choose_cmd_want_reads) & (main_ethernetsoc_sdram_bankmachine4_cmd_payload_is_write == main_ethernetsoc_sdram_choose_cmd_want_writes))));
	main_ethernetsoc_sdram_choose_cmd_valids[5] <= (main_ethernetsoc_sdram_bankmachine5_cmd_valid & (((main_ethernetsoc_sdram_bankmachine5_cmd_payload_is_cmd & main_ethernetsoc_sdram_choose_cmd_want_cmds) & ((~((main_ethernetsoc_sdram_bankmachine5_cmd_payload_ras & (~main_ethernetsoc_sdram_bankmachine5_cmd_payload_cas)) & (~main_ethernetsoc_sdram_bankmachine5_cmd_payload_we))) | main_ethernetsoc_sdram_choose_cmd_want_activates)) | ((main_ethernetsoc_sdram_bankmachine5_cmd_payload_is_read == main_ethernetsoc_sdram_choose_cmd_want_reads) & (main_ethernetsoc_sdram_bankmachine5_cmd_payload_is_write == main_ethernetsoc_sdram_choose_cmd_want_writes))));
	main_ethernetsoc_sdram_choose_cmd_valids[6] <= (main_ethernetsoc_sdram_bankmachine6_cmd_valid & (((main_ethernetsoc_sdram_bankmachine6_cmd_payload_is_cmd & main_ethernetsoc_sdram_choose_cmd_want_cmds) & ((~((main_ethernetsoc_sdram_bankmachine6_cmd_payload_ras & (~main_ethernetsoc_sdram_bankmachine6_cmd_payload_cas)) & (~main_ethernetsoc_sdram_bankmachine6_cmd_payload_we))) | main_ethernetsoc_sdram_choose_cmd_want_activates)) | ((main_ethernetsoc_sdram_bankmachine6_cmd_payload_is_read == main_ethernetsoc_sdram_choose_cmd_want_reads) & (main_ethernetsoc_sdram_bankmachine6_cmd_payload_is_write == main_ethernetsoc_sdram_choose_cmd_want_writes))));
	main_ethernetsoc_sdram_choose_cmd_valids[7] <= (main_ethernetsoc_sdram_bankmachine7_cmd_valid & (((main_ethernetsoc_sdram_bankmachine7_cmd_payload_is_cmd & main_ethernetsoc_sdram_choose_cmd_want_cmds) & ((~((main_ethernetsoc_sdram_bankmachine7_cmd_payload_ras & (~main_ethernetsoc_sdram_bankmachine7_cmd_payload_cas)) & (~main_ethernetsoc_sdram_bankmachine7_cmd_payload_we))) | main_ethernetsoc_sdram_choose_cmd_want_activates)) | ((main_ethernetsoc_sdram_bankmachine7_cmd_payload_is_read == main_ethernetsoc_sdram_choose_cmd_want_reads) & (main_ethernetsoc_sdram_bankmachine7_cmd_payload_is_write == main_ethernetsoc_sdram_choose_cmd_want_writes))));
end
assign main_ethernetsoc_sdram_choose_cmd_request = main_ethernetsoc_sdram_choose_cmd_valids;
assign main_ethernetsoc_sdram_choose_cmd_cmd_valid = builder_rhs_array_muxed0;
assign main_ethernetsoc_sdram_choose_cmd_cmd_payload_a = builder_rhs_array_muxed1;
assign main_ethernetsoc_sdram_choose_cmd_cmd_payload_ba = builder_rhs_array_muxed2;
assign main_ethernetsoc_sdram_choose_cmd_cmd_payload_is_read = builder_rhs_array_muxed3;
assign main_ethernetsoc_sdram_choose_cmd_cmd_payload_is_write = builder_rhs_array_muxed4;
assign main_ethernetsoc_sdram_choose_cmd_cmd_payload_is_cmd = builder_rhs_array_muxed5;
always @(*) begin
	main_ethernetsoc_sdram_choose_cmd_cmd_payload_cas <= 1'd0;
	if (main_ethernetsoc_sdram_choose_cmd_cmd_valid) begin
		main_ethernetsoc_sdram_choose_cmd_cmd_payload_cas <= builder_t_array_muxed0;
	end
end
always @(*) begin
	main_ethernetsoc_sdram_choose_cmd_cmd_payload_ras <= 1'd0;
	if (main_ethernetsoc_sdram_choose_cmd_cmd_valid) begin
		main_ethernetsoc_sdram_choose_cmd_cmd_payload_ras <= builder_t_array_muxed1;
	end
end
always @(*) begin
	main_ethernetsoc_sdram_choose_cmd_cmd_payload_we <= 1'd0;
	if (main_ethernetsoc_sdram_choose_cmd_cmd_valid) begin
		main_ethernetsoc_sdram_choose_cmd_cmd_payload_we <= builder_t_array_muxed2;
	end
end
assign main_ethernetsoc_sdram_choose_cmd_ce = (main_ethernetsoc_sdram_choose_cmd_cmd_ready | (~main_ethernetsoc_sdram_choose_cmd_cmd_valid));
always @(*) begin
	main_ethernetsoc_sdram_choose_req_valids <= 8'd0;
	main_ethernetsoc_sdram_choose_req_valids[0] <= (main_ethernetsoc_sdram_bankmachine0_cmd_valid & (((main_ethernetsoc_sdram_bankmachine0_cmd_payload_is_cmd & main_ethernetsoc_sdram_choose_req_want_cmds) & ((~((main_ethernetsoc_sdram_bankmachine0_cmd_payload_ras & (~main_ethernetsoc_sdram_bankmachine0_cmd_payload_cas)) & (~main_ethernetsoc_sdram_bankmachine0_cmd_payload_we))) | main_ethernetsoc_sdram_choose_req_want_activates)) | ((main_ethernetsoc_sdram_bankmachine0_cmd_payload_is_read == main_ethernetsoc_sdram_choose_req_want_reads) & (main_ethernetsoc_sdram_bankmachine0_cmd_payload_is_write == main_ethernetsoc_sdram_choose_req_want_writes))));
	main_ethernetsoc_sdram_choose_req_valids[1] <= (main_ethernetsoc_sdram_bankmachine1_cmd_valid & (((main_ethernetsoc_sdram_bankmachine1_cmd_payload_is_cmd & main_ethernetsoc_sdram_choose_req_want_cmds) & ((~((main_ethernetsoc_sdram_bankmachine1_cmd_payload_ras & (~main_ethernetsoc_sdram_bankmachine1_cmd_payload_cas)) & (~main_ethernetsoc_sdram_bankmachine1_cmd_payload_we))) | main_ethernetsoc_sdram_choose_req_want_activates)) | ((main_ethernetsoc_sdram_bankmachine1_cmd_payload_is_read == main_ethernetsoc_sdram_choose_req_want_reads) & (main_ethernetsoc_sdram_bankmachine1_cmd_payload_is_write == main_ethernetsoc_sdram_choose_req_want_writes))));
	main_ethernetsoc_sdram_choose_req_valids[2] <= (main_ethernetsoc_sdram_bankmachine2_cmd_valid & (((main_ethernetsoc_sdram_bankmachine2_cmd_payload_is_cmd & main_ethernetsoc_sdram_choose_req_want_cmds) & ((~((main_ethernetsoc_sdram_bankmachine2_cmd_payload_ras & (~main_ethernetsoc_sdram_bankmachine2_cmd_payload_cas)) & (~main_ethernetsoc_sdram_bankmachine2_cmd_payload_we))) | main_ethernetsoc_sdram_choose_req_want_activates)) | ((main_ethernetsoc_sdram_bankmachine2_cmd_payload_is_read == main_ethernetsoc_sdram_choose_req_want_reads) & (main_ethernetsoc_sdram_bankmachine2_cmd_payload_is_write == main_ethernetsoc_sdram_choose_req_want_writes))));
	main_ethernetsoc_sdram_choose_req_valids[3] <= (main_ethernetsoc_sdram_bankmachine3_cmd_valid & (((main_ethernetsoc_sdram_bankmachine3_cmd_payload_is_cmd & main_ethernetsoc_sdram_choose_req_want_cmds) & ((~((main_ethernetsoc_sdram_bankmachine3_cmd_payload_ras & (~main_ethernetsoc_sdram_bankmachine3_cmd_payload_cas)) & (~main_ethernetsoc_sdram_bankmachine3_cmd_payload_we))) | main_ethernetsoc_sdram_choose_req_want_activates)) | ((main_ethernetsoc_sdram_bankmachine3_cmd_payload_is_read == main_ethernetsoc_sdram_choose_req_want_reads) & (main_ethernetsoc_sdram_bankmachine3_cmd_payload_is_write == main_ethernetsoc_sdram_choose_req_want_writes))));
	main_ethernetsoc_sdram_choose_req_valids[4] <= (main_ethernetsoc_sdram_bankmachine4_cmd_valid & (((main_ethernetsoc_sdram_bankmachine4_cmd_payload_is_cmd & main_ethernetsoc_sdram_choose_req_want_cmds) & ((~((main_ethernetsoc_sdram_bankmachine4_cmd_payload_ras & (~main_ethernetsoc_sdram_bankmachine4_cmd_payload_cas)) & (~main_ethernetsoc_sdram_bankmachine4_cmd_payload_we))) | main_ethernetsoc_sdram_choose_req_want_activates)) | ((main_ethernetsoc_sdram_bankmachine4_cmd_payload_is_read == main_ethernetsoc_sdram_choose_req_want_reads) & (main_ethernetsoc_sdram_bankmachine4_cmd_payload_is_write == main_ethernetsoc_sdram_choose_req_want_writes))));
	main_ethernetsoc_sdram_choose_req_valids[5] <= (main_ethernetsoc_sdram_bankmachine5_cmd_valid & (((main_ethernetsoc_sdram_bankmachine5_cmd_payload_is_cmd & main_ethernetsoc_sdram_choose_req_want_cmds) & ((~((main_ethernetsoc_sdram_bankmachine5_cmd_payload_ras & (~main_ethernetsoc_sdram_bankmachine5_cmd_payload_cas)) & (~main_ethernetsoc_sdram_bankmachine5_cmd_payload_we))) | main_ethernetsoc_sdram_choose_req_want_activates)) | ((main_ethernetsoc_sdram_bankmachine5_cmd_payload_is_read == main_ethernetsoc_sdram_choose_req_want_reads) & (main_ethernetsoc_sdram_bankmachine5_cmd_payload_is_write == main_ethernetsoc_sdram_choose_req_want_writes))));
	main_ethernetsoc_sdram_choose_req_valids[6] <= (main_ethernetsoc_sdram_bankmachine6_cmd_valid & (((main_ethernetsoc_sdram_bankmachine6_cmd_payload_is_cmd & main_ethernetsoc_sdram_choose_req_want_cmds) & ((~((main_ethernetsoc_sdram_bankmachine6_cmd_payload_ras & (~main_ethernetsoc_sdram_bankmachine6_cmd_payload_cas)) & (~main_ethernetsoc_sdram_bankmachine6_cmd_payload_we))) | main_ethernetsoc_sdram_choose_req_want_activates)) | ((main_ethernetsoc_sdram_bankmachine6_cmd_payload_is_read == main_ethernetsoc_sdram_choose_req_want_reads) & (main_ethernetsoc_sdram_bankmachine6_cmd_payload_is_write == main_ethernetsoc_sdram_choose_req_want_writes))));
	main_ethernetsoc_sdram_choose_req_valids[7] <= (main_ethernetsoc_sdram_bankmachine7_cmd_valid & (((main_ethernetsoc_sdram_bankmachine7_cmd_payload_is_cmd & main_ethernetsoc_sdram_choose_req_want_cmds) & ((~((main_ethernetsoc_sdram_bankmachine7_cmd_payload_ras & (~main_ethernetsoc_sdram_bankmachine7_cmd_payload_cas)) & (~main_ethernetsoc_sdram_bankmachine7_cmd_payload_we))) | main_ethernetsoc_sdram_choose_req_want_activates)) | ((main_ethernetsoc_sdram_bankmachine7_cmd_payload_is_read == main_ethernetsoc_sdram_choose_req_want_reads) & (main_ethernetsoc_sdram_bankmachine7_cmd_payload_is_write == main_ethernetsoc_sdram_choose_req_want_writes))));
end
assign main_ethernetsoc_sdram_choose_req_request = main_ethernetsoc_sdram_choose_req_valids;
assign main_ethernetsoc_sdram_choose_req_cmd_valid = builder_rhs_array_muxed6;
assign main_ethernetsoc_sdram_choose_req_cmd_payload_a = builder_rhs_array_muxed7;
assign main_ethernetsoc_sdram_choose_req_cmd_payload_ba = builder_rhs_array_muxed8;
assign main_ethernetsoc_sdram_choose_req_cmd_payload_is_read = builder_rhs_array_muxed9;
assign main_ethernetsoc_sdram_choose_req_cmd_payload_is_write = builder_rhs_array_muxed10;
assign main_ethernetsoc_sdram_choose_req_cmd_payload_is_cmd = builder_rhs_array_muxed11;
always @(*) begin
	main_ethernetsoc_sdram_choose_req_cmd_payload_cas <= 1'd0;
	if (main_ethernetsoc_sdram_choose_req_cmd_valid) begin
		main_ethernetsoc_sdram_choose_req_cmd_payload_cas <= builder_t_array_muxed3;
	end
end
always @(*) begin
	main_ethernetsoc_sdram_choose_req_cmd_payload_ras <= 1'd0;
	if (main_ethernetsoc_sdram_choose_req_cmd_valid) begin
		main_ethernetsoc_sdram_choose_req_cmd_payload_ras <= builder_t_array_muxed4;
	end
end
always @(*) begin
	main_ethernetsoc_sdram_choose_req_cmd_payload_we <= 1'd0;
	if (main_ethernetsoc_sdram_choose_req_cmd_valid) begin
		main_ethernetsoc_sdram_choose_req_cmd_payload_we <= builder_t_array_muxed5;
	end
end
always @(*) begin
	main_ethernetsoc_sdram_bankmachine0_cmd_ready <= 1'd0;
	if (((main_ethernetsoc_sdram_choose_cmd_cmd_valid & main_ethernetsoc_sdram_choose_cmd_cmd_ready) & (main_ethernetsoc_sdram_choose_cmd_grant == 1'd0))) begin
		main_ethernetsoc_sdram_bankmachine0_cmd_ready <= 1'd1;
	end
	if (((main_ethernetsoc_sdram_choose_req_cmd_valid & main_ethernetsoc_sdram_choose_req_cmd_ready) & (main_ethernetsoc_sdram_choose_req_grant == 1'd0))) begin
		main_ethernetsoc_sdram_bankmachine0_cmd_ready <= 1'd1;
	end
end
always @(*) begin
	main_ethernetsoc_sdram_bankmachine1_cmd_ready <= 1'd0;
	if (((main_ethernetsoc_sdram_choose_cmd_cmd_valid & main_ethernetsoc_sdram_choose_cmd_cmd_ready) & (main_ethernetsoc_sdram_choose_cmd_grant == 1'd1))) begin
		main_ethernetsoc_sdram_bankmachine1_cmd_ready <= 1'd1;
	end
	if (((main_ethernetsoc_sdram_choose_req_cmd_valid & main_ethernetsoc_sdram_choose_req_cmd_ready) & (main_ethernetsoc_sdram_choose_req_grant == 1'd1))) begin
		main_ethernetsoc_sdram_bankmachine1_cmd_ready <= 1'd1;
	end
end
always @(*) begin
	main_ethernetsoc_sdram_bankmachine2_cmd_ready <= 1'd0;
	if (((main_ethernetsoc_sdram_choose_cmd_cmd_valid & main_ethernetsoc_sdram_choose_cmd_cmd_ready) & (main_ethernetsoc_sdram_choose_cmd_grant == 2'd2))) begin
		main_ethernetsoc_sdram_bankmachine2_cmd_ready <= 1'd1;
	end
	if (((main_ethernetsoc_sdram_choose_req_cmd_valid & main_ethernetsoc_sdram_choose_req_cmd_ready) & (main_ethernetsoc_sdram_choose_req_grant == 2'd2))) begin
		main_ethernetsoc_sdram_bankmachine2_cmd_ready <= 1'd1;
	end
end
always @(*) begin
	main_ethernetsoc_sdram_bankmachine3_cmd_ready <= 1'd0;
	if (((main_ethernetsoc_sdram_choose_cmd_cmd_valid & main_ethernetsoc_sdram_choose_cmd_cmd_ready) & (main_ethernetsoc_sdram_choose_cmd_grant == 2'd3))) begin
		main_ethernetsoc_sdram_bankmachine3_cmd_ready <= 1'd1;
	end
	if (((main_ethernetsoc_sdram_choose_req_cmd_valid & main_ethernetsoc_sdram_choose_req_cmd_ready) & (main_ethernetsoc_sdram_choose_req_grant == 2'd3))) begin
		main_ethernetsoc_sdram_bankmachine3_cmd_ready <= 1'd1;
	end
end
always @(*) begin
	main_ethernetsoc_sdram_bankmachine4_cmd_ready <= 1'd0;
	if (((main_ethernetsoc_sdram_choose_cmd_cmd_valid & main_ethernetsoc_sdram_choose_cmd_cmd_ready) & (main_ethernetsoc_sdram_choose_cmd_grant == 3'd4))) begin
		main_ethernetsoc_sdram_bankmachine4_cmd_ready <= 1'd1;
	end
	if (((main_ethernetsoc_sdram_choose_req_cmd_valid & main_ethernetsoc_sdram_choose_req_cmd_ready) & (main_ethernetsoc_sdram_choose_req_grant == 3'd4))) begin
		main_ethernetsoc_sdram_bankmachine4_cmd_ready <= 1'd1;
	end
end
always @(*) begin
	main_ethernetsoc_sdram_bankmachine5_cmd_ready <= 1'd0;
	if (((main_ethernetsoc_sdram_choose_cmd_cmd_valid & main_ethernetsoc_sdram_choose_cmd_cmd_ready) & (main_ethernetsoc_sdram_choose_cmd_grant == 3'd5))) begin
		main_ethernetsoc_sdram_bankmachine5_cmd_ready <= 1'd1;
	end
	if (((main_ethernetsoc_sdram_choose_req_cmd_valid & main_ethernetsoc_sdram_choose_req_cmd_ready) & (main_ethernetsoc_sdram_choose_req_grant == 3'd5))) begin
		main_ethernetsoc_sdram_bankmachine5_cmd_ready <= 1'd1;
	end
end
always @(*) begin
	main_ethernetsoc_sdram_bankmachine6_cmd_ready <= 1'd0;
	if (((main_ethernetsoc_sdram_choose_cmd_cmd_valid & main_ethernetsoc_sdram_choose_cmd_cmd_ready) & (main_ethernetsoc_sdram_choose_cmd_grant == 3'd6))) begin
		main_ethernetsoc_sdram_bankmachine6_cmd_ready <= 1'd1;
	end
	if (((main_ethernetsoc_sdram_choose_req_cmd_valid & main_ethernetsoc_sdram_choose_req_cmd_ready) & (main_ethernetsoc_sdram_choose_req_grant == 3'd6))) begin
		main_ethernetsoc_sdram_bankmachine6_cmd_ready <= 1'd1;
	end
end
always @(*) begin
	main_ethernetsoc_sdram_bankmachine7_cmd_ready <= 1'd0;
	if (((main_ethernetsoc_sdram_choose_cmd_cmd_valid & main_ethernetsoc_sdram_choose_cmd_cmd_ready) & (main_ethernetsoc_sdram_choose_cmd_grant == 3'd7))) begin
		main_ethernetsoc_sdram_bankmachine7_cmd_ready <= 1'd1;
	end
	if (((main_ethernetsoc_sdram_choose_req_cmd_valid & main_ethernetsoc_sdram_choose_req_cmd_ready) & (main_ethernetsoc_sdram_choose_req_grant == 3'd7))) begin
		main_ethernetsoc_sdram_bankmachine7_cmd_ready <= 1'd1;
	end
end
assign main_ethernetsoc_sdram_choose_req_ce = (main_ethernetsoc_sdram_choose_req_cmd_ready | (~main_ethernetsoc_sdram_choose_req_cmd_valid));
assign main_ethernetsoc_sdram_dfi_p0_reset_n = 1'd1;
assign main_ethernetsoc_sdram_dfi_p0_cke = {1{main_ethernetsoc_sdram_steerer0}};
assign main_ethernetsoc_sdram_dfi_p0_odt = {1{main_ethernetsoc_sdram_steerer1}};
assign main_ethernetsoc_sdram_dfi_p1_reset_n = 1'd1;
assign main_ethernetsoc_sdram_dfi_p1_cke = {1{main_ethernetsoc_sdram_steerer2}};
assign main_ethernetsoc_sdram_dfi_p1_odt = {1{main_ethernetsoc_sdram_steerer3}};
assign main_ethernetsoc_sdram_dfi_p2_reset_n = 1'd1;
assign main_ethernetsoc_sdram_dfi_p2_cke = {1{main_ethernetsoc_sdram_steerer4}};
assign main_ethernetsoc_sdram_dfi_p2_odt = {1{main_ethernetsoc_sdram_steerer5}};
assign main_ethernetsoc_sdram_dfi_p3_reset_n = 1'd1;
assign main_ethernetsoc_sdram_dfi_p3_cke = {1{main_ethernetsoc_sdram_steerer6}};
assign main_ethernetsoc_sdram_dfi_p3_odt = {1{main_ethernetsoc_sdram_steerer7}};
assign main_ethernetsoc_sdram_tfawcon_count = ((((main_ethernetsoc_sdram_tfawcon_window[0] + main_ethernetsoc_sdram_tfawcon_window[1]) + main_ethernetsoc_sdram_tfawcon_window[2]) + main_ethernetsoc_sdram_tfawcon_window[3]) + main_ethernetsoc_sdram_tfawcon_window[4]);
always @(*) begin
	main_ethernetsoc_sdram_cmd_ready <= 1'd0;
	main_ethernetsoc_sdram_steerer_sel3 <= 2'd0;
	main_ethernetsoc_sdram_choose_req_cmd_ready <= 1'd0;
	builder_multiplexer_next_state <= 4'd0;
	main_ethernetsoc_sdram_en1 <= 1'd0;
	main_ethernetsoc_sdram_steerer_sel0 <= 2'd0;
	main_ethernetsoc_sdram_steerer_sel1 <= 2'd0;
	main_ethernetsoc_sdram_steerer_sel2 <= 2'd0;
	main_ethernetsoc_sdram_choose_cmd_want_activates <= 1'd0;
	main_ethernetsoc_sdram_en0 <= 1'd0;
	main_ethernetsoc_sdram_choose_cmd_cmd_ready <= 1'd0;
	main_ethernetsoc_sdram_choose_req_want_reads <= 1'd0;
	main_ethernetsoc_sdram_choose_req_want_writes <= 1'd0;
	builder_multiplexer_next_state <= builder_multiplexer_state;
	case (builder_multiplexer_state)
		1'd1: begin
			main_ethernetsoc_sdram_en1 <= 1'd1;
			main_ethernetsoc_sdram_choose_req_want_writes <= 1'd1;
			if (1'd0) begin
				main_ethernetsoc_sdram_choose_req_cmd_ready <= (main_ethernetsoc_sdram_cas_allowed & ((~((main_ethernetsoc_sdram_choose_req_cmd_payload_ras & (~main_ethernetsoc_sdram_choose_req_cmd_payload_cas)) & (~main_ethernetsoc_sdram_choose_req_cmd_payload_we))) | main_ethernetsoc_sdram_ras_allowed));
			end else begin
				main_ethernetsoc_sdram_choose_cmd_want_activates <= main_ethernetsoc_sdram_ras_allowed;
				main_ethernetsoc_sdram_choose_cmd_cmd_ready <= ((~((main_ethernetsoc_sdram_choose_cmd_cmd_payload_ras & (~main_ethernetsoc_sdram_choose_cmd_cmd_payload_cas)) & (~main_ethernetsoc_sdram_choose_cmd_cmd_payload_we))) | main_ethernetsoc_sdram_ras_allowed);
				main_ethernetsoc_sdram_choose_req_cmd_ready <= main_ethernetsoc_sdram_cas_allowed;
			end
			main_ethernetsoc_sdram_steerer_sel0 <= 1'd0;
			main_ethernetsoc_sdram_steerer_sel1 <= 1'd0;
			main_ethernetsoc_sdram_steerer_sel2 <= 1'd1;
			main_ethernetsoc_sdram_steerer_sel3 <= 2'd2;
			if (main_ethernetsoc_sdram_read_available) begin
				if (((~main_ethernetsoc_sdram_write_available) | main_ethernetsoc_sdram_max_time1)) begin
					builder_multiplexer_next_state <= 2'd3;
				end
			end
			if (main_ethernetsoc_sdram_go_to_refresh) begin
				builder_multiplexer_next_state <= 2'd2;
			end
		end
		2'd2: begin
			main_ethernetsoc_sdram_steerer_sel0 <= 2'd3;
			main_ethernetsoc_sdram_cmd_ready <= 1'd1;
			if (main_ethernetsoc_sdram_cmd_last) begin
				builder_multiplexer_next_state <= 1'd0;
			end
		end
		2'd3: begin
			if (main_ethernetsoc_sdram_twtrcon_ready) begin
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
			builder_multiplexer_next_state <= 4'd10;
		end
		4'd10: begin
			builder_multiplexer_next_state <= 4'd11;
		end
		4'd11: begin
			builder_multiplexer_next_state <= 1'd1;
		end
		default: begin
			main_ethernetsoc_sdram_en0 <= 1'd1;
			main_ethernetsoc_sdram_choose_req_want_reads <= 1'd1;
			if (1'd0) begin
				main_ethernetsoc_sdram_choose_req_cmd_ready <= (main_ethernetsoc_sdram_cas_allowed & ((~((main_ethernetsoc_sdram_choose_req_cmd_payload_ras & (~main_ethernetsoc_sdram_choose_req_cmd_payload_cas)) & (~main_ethernetsoc_sdram_choose_req_cmd_payload_we))) | main_ethernetsoc_sdram_ras_allowed));
			end else begin
				main_ethernetsoc_sdram_choose_cmd_want_activates <= main_ethernetsoc_sdram_ras_allowed;
				main_ethernetsoc_sdram_choose_cmd_cmd_ready <= ((~((main_ethernetsoc_sdram_choose_cmd_cmd_payload_ras & (~main_ethernetsoc_sdram_choose_cmd_cmd_payload_cas)) & (~main_ethernetsoc_sdram_choose_cmd_cmd_payload_we))) | main_ethernetsoc_sdram_ras_allowed);
				main_ethernetsoc_sdram_choose_req_cmd_ready <= main_ethernetsoc_sdram_cas_allowed;
			end
			main_ethernetsoc_sdram_steerer_sel0 <= 1'd0;
			main_ethernetsoc_sdram_steerer_sel1 <= 1'd1;
			main_ethernetsoc_sdram_steerer_sel2 <= 2'd2;
			main_ethernetsoc_sdram_steerer_sel3 <= 1'd0;
			if (main_ethernetsoc_sdram_write_available) begin
				if (((~main_ethernetsoc_sdram_read_available) | main_ethernetsoc_sdram_max_time0)) begin
					builder_multiplexer_next_state <= 3'd4;
				end
			end
			if (main_ethernetsoc_sdram_go_to_refresh) begin
				builder_multiplexer_next_state <= 2'd2;
			end
		end
	endcase
end
assign builder_roundrobin0_request = {(((main_ethernetsoc_port_cmd_payload_addr[9:7] == 1'd0) & (~(((((((builder_locked0 | (main_ethernetsoc_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0))))) & main_ethernetsoc_port_cmd_valid)};
assign builder_roundrobin0_ce = ((~main_ethernetsoc_sdram_interface_bank0_valid) & (~main_ethernetsoc_sdram_interface_bank0_lock));
assign main_ethernetsoc_sdram_interface_bank0_addr = builder_rhs_array_muxed12;
assign main_ethernetsoc_sdram_interface_bank0_we = builder_rhs_array_muxed13;
assign main_ethernetsoc_sdram_interface_bank0_valid = builder_rhs_array_muxed14;
assign builder_roundrobin1_request = {(((main_ethernetsoc_port_cmd_payload_addr[9:7] == 1'd1) & (~(((((((builder_locked1 | (main_ethernetsoc_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0))))) & main_ethernetsoc_port_cmd_valid)};
assign builder_roundrobin1_ce = ((~main_ethernetsoc_sdram_interface_bank1_valid) & (~main_ethernetsoc_sdram_interface_bank1_lock));
assign main_ethernetsoc_sdram_interface_bank1_addr = builder_rhs_array_muxed15;
assign main_ethernetsoc_sdram_interface_bank1_we = builder_rhs_array_muxed16;
assign main_ethernetsoc_sdram_interface_bank1_valid = builder_rhs_array_muxed17;
assign builder_roundrobin2_request = {(((main_ethernetsoc_port_cmd_payload_addr[9:7] == 2'd2) & (~(((((((builder_locked2 | (main_ethernetsoc_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0))))) & main_ethernetsoc_port_cmd_valid)};
assign builder_roundrobin2_ce = ((~main_ethernetsoc_sdram_interface_bank2_valid) & (~main_ethernetsoc_sdram_interface_bank2_lock));
assign main_ethernetsoc_sdram_interface_bank2_addr = builder_rhs_array_muxed18;
assign main_ethernetsoc_sdram_interface_bank2_we = builder_rhs_array_muxed19;
assign main_ethernetsoc_sdram_interface_bank2_valid = builder_rhs_array_muxed20;
assign builder_roundrobin3_request = {(((main_ethernetsoc_port_cmd_payload_addr[9:7] == 2'd3) & (~(((((((builder_locked3 | (main_ethernetsoc_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0))))) & main_ethernetsoc_port_cmd_valid)};
assign builder_roundrobin3_ce = ((~main_ethernetsoc_sdram_interface_bank3_valid) & (~main_ethernetsoc_sdram_interface_bank3_lock));
assign main_ethernetsoc_sdram_interface_bank3_addr = builder_rhs_array_muxed21;
assign main_ethernetsoc_sdram_interface_bank3_we = builder_rhs_array_muxed22;
assign main_ethernetsoc_sdram_interface_bank3_valid = builder_rhs_array_muxed23;
assign builder_roundrobin4_request = {(((main_ethernetsoc_port_cmd_payload_addr[9:7] == 3'd4) & (~(((((((builder_locked4 | (main_ethernetsoc_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0))))) & main_ethernetsoc_port_cmd_valid)};
assign builder_roundrobin4_ce = ((~main_ethernetsoc_sdram_interface_bank4_valid) & (~main_ethernetsoc_sdram_interface_bank4_lock));
assign main_ethernetsoc_sdram_interface_bank4_addr = builder_rhs_array_muxed24;
assign main_ethernetsoc_sdram_interface_bank4_we = builder_rhs_array_muxed25;
assign main_ethernetsoc_sdram_interface_bank4_valid = builder_rhs_array_muxed26;
assign builder_roundrobin5_request = {(((main_ethernetsoc_port_cmd_payload_addr[9:7] == 3'd5) & (~(((((((builder_locked5 | (main_ethernetsoc_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0))))) & main_ethernetsoc_port_cmd_valid)};
assign builder_roundrobin5_ce = ((~main_ethernetsoc_sdram_interface_bank5_valid) & (~main_ethernetsoc_sdram_interface_bank5_lock));
assign main_ethernetsoc_sdram_interface_bank5_addr = builder_rhs_array_muxed27;
assign main_ethernetsoc_sdram_interface_bank5_we = builder_rhs_array_muxed28;
assign main_ethernetsoc_sdram_interface_bank5_valid = builder_rhs_array_muxed29;
assign builder_roundrobin6_request = {(((main_ethernetsoc_port_cmd_payload_addr[9:7] == 3'd6) & (~(((((((builder_locked6 | (main_ethernetsoc_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0))))) & main_ethernetsoc_port_cmd_valid)};
assign builder_roundrobin6_ce = ((~main_ethernetsoc_sdram_interface_bank6_valid) & (~main_ethernetsoc_sdram_interface_bank6_lock));
assign main_ethernetsoc_sdram_interface_bank6_addr = builder_rhs_array_muxed30;
assign main_ethernetsoc_sdram_interface_bank6_we = builder_rhs_array_muxed31;
assign main_ethernetsoc_sdram_interface_bank6_valid = builder_rhs_array_muxed32;
assign builder_roundrobin7_request = {(((main_ethernetsoc_port_cmd_payload_addr[9:7] == 3'd7) & (~(((((((builder_locked7 | (main_ethernetsoc_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0))))) & main_ethernetsoc_port_cmd_valid)};
assign builder_roundrobin7_ce = ((~main_ethernetsoc_sdram_interface_bank7_valid) & (~main_ethernetsoc_sdram_interface_bank7_lock));
assign main_ethernetsoc_sdram_interface_bank7_addr = builder_rhs_array_muxed33;
assign main_ethernetsoc_sdram_interface_bank7_we = builder_rhs_array_muxed34;
assign main_ethernetsoc_sdram_interface_bank7_valid = builder_rhs_array_muxed35;
assign main_ethernetsoc_port_cmd_ready = ((((((((1'd0 | (((builder_roundrobin0_grant == 1'd0) & ((main_ethernetsoc_port_cmd_payload_addr[9:7] == 1'd0) & (~(((((((builder_locked0 | (main_ethernetsoc_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0)))))) & main_ethernetsoc_sdram_interface_bank0_ready)) | (((builder_roundrobin1_grant == 1'd0) & ((main_ethernetsoc_port_cmd_payload_addr[9:7] == 1'd1) & (~(((((((builder_locked1 | (main_ethernetsoc_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0)))))) & main_ethernetsoc_sdram_interface_bank1_ready)) | (((builder_roundrobin2_grant == 1'd0) & ((main_ethernetsoc_port_cmd_payload_addr[9:7] == 2'd2) & (~(((((((builder_locked2 | (main_ethernetsoc_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0)))))) & main_ethernetsoc_sdram_interface_bank2_ready)) | (((builder_roundrobin3_grant == 1'd0) & ((main_ethernetsoc_port_cmd_payload_addr[9:7] == 2'd3) & (~(((((((builder_locked3 | (main_ethernetsoc_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0)))))) & main_ethernetsoc_sdram_interface_bank3_ready)) | (((builder_roundrobin4_grant == 1'd0) & ((main_ethernetsoc_port_cmd_payload_addr[9:7] == 3'd4) & (~(((((((builder_locked4 | (main_ethernetsoc_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0)))))) & main_ethernetsoc_sdram_interface_bank4_ready)) | (((builder_roundrobin5_grant == 1'd0) & ((main_ethernetsoc_port_cmd_payload_addr[9:7] == 3'd5) & (~(((((((builder_locked5 | (main_ethernetsoc_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0)))))) & main_ethernetsoc_sdram_interface_bank5_ready)) | (((builder_roundrobin6_grant == 1'd0) & ((main_ethernetsoc_port_cmd_payload_addr[9:7] == 3'd6) & (~(((((((builder_locked6 | (main_ethernetsoc_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0)))))) & main_ethernetsoc_sdram_interface_bank6_ready)) | (((builder_roundrobin7_grant == 1'd0) & ((main_ethernetsoc_port_cmd_payload_addr[9:7] == 3'd7) & (~(((((((builder_locked7 | (main_ethernetsoc_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0)))))) & main_ethernetsoc_sdram_interface_bank7_ready));
assign main_ethernetsoc_port_wdata_ready = builder_new_master_wdata_ready2;
assign main_ethernetsoc_port_rdata_valid = builder_new_master_rdata_valid9;
always @(*) begin
	main_ethernetsoc_sdram_interface_wdata <= 128'd0;
	main_ethernetsoc_sdram_interface_wdata_we <= 16'd0;
	case ({builder_new_master_wdata_ready2})
		1'd1: begin
			main_ethernetsoc_sdram_interface_wdata <= main_ethernetsoc_port_wdata_payload_data;
			main_ethernetsoc_sdram_interface_wdata_we <= main_ethernetsoc_port_wdata_payload_we;
		end
		default: begin
			main_ethernetsoc_sdram_interface_wdata <= 1'd0;
			main_ethernetsoc_sdram_interface_wdata_we <= 1'd0;
		end
	endcase
end
assign main_ethernetsoc_port_rdata_payload_data = main_ethernetsoc_sdram_interface_rdata;
assign builder_roundrobin0_grant = 1'd0;
assign builder_roundrobin1_grant = 1'd0;
assign builder_roundrobin2_grant = 1'd0;
assign builder_roundrobin3_grant = 1'd0;
assign builder_roundrobin4_grant = 1'd0;
assign builder_roundrobin5_grant = 1'd0;
assign builder_roundrobin6_grant = 1'd0;
assign builder_roundrobin7_grant = 1'd0;
assign main_ethernetsoc_data_port_adr = main_ethernetsoc_interface0_wb_sdram_adr[10:2];
always @(*) begin
	main_ethernetsoc_data_port_we <= 16'd0;
	main_ethernetsoc_data_port_dat_w <= 128'd0;
	if (main_ethernetsoc_write_from_slave) begin
		main_ethernetsoc_data_port_dat_w <= main_ethernetsoc_dat_r;
		main_ethernetsoc_data_port_we <= {16{1'd1}};
	end else begin
		main_ethernetsoc_data_port_dat_w <= {4{main_ethernetsoc_interface0_wb_sdram_dat_w}};
		if ((((main_ethernetsoc_interface0_wb_sdram_cyc & main_ethernetsoc_interface0_wb_sdram_stb) & main_ethernetsoc_interface0_wb_sdram_we) & main_ethernetsoc_interface0_wb_sdram_ack)) begin
			main_ethernetsoc_data_port_we <= {({4{(main_ethernetsoc_interface0_wb_sdram_adr[1:0] == 1'd0)}} & main_ethernetsoc_interface0_wb_sdram_sel), ({4{(main_ethernetsoc_interface0_wb_sdram_adr[1:0] == 1'd1)}} & main_ethernetsoc_interface0_wb_sdram_sel), ({4{(main_ethernetsoc_interface0_wb_sdram_adr[1:0] == 2'd2)}} & main_ethernetsoc_interface0_wb_sdram_sel), ({4{(main_ethernetsoc_interface0_wb_sdram_adr[1:0] == 2'd3)}} & main_ethernetsoc_interface0_wb_sdram_sel)};
		end
	end
end
assign main_ethernetsoc_dat_w = main_ethernetsoc_data_port_dat_r;
assign main_ethernetsoc_sel = 16'd65535;
always @(*) begin
	main_ethernetsoc_interface0_wb_sdram_dat_r <= 32'd0;
	case (main_ethernetsoc_adr_offset_r)
		1'd0: begin
			main_ethernetsoc_interface0_wb_sdram_dat_r <= main_ethernetsoc_data_port_dat_r[127:96];
		end
		1'd1: begin
			main_ethernetsoc_interface0_wb_sdram_dat_r <= main_ethernetsoc_data_port_dat_r[95:64];
		end
		2'd2: begin
			main_ethernetsoc_interface0_wb_sdram_dat_r <= main_ethernetsoc_data_port_dat_r[63:32];
		end
		default: begin
			main_ethernetsoc_interface0_wb_sdram_dat_r <= main_ethernetsoc_data_port_dat_r[31:0];
		end
	endcase
end
assign {main_ethernetsoc_tag_do_dirty, main_ethernetsoc_tag_do_tag} = main_ethernetsoc_tag_port_dat_r;
assign main_ethernetsoc_tag_port_dat_w = {main_ethernetsoc_tag_di_dirty, main_ethernetsoc_tag_di_tag};
assign main_ethernetsoc_tag_port_adr = main_ethernetsoc_interface0_wb_sdram_adr[10:2];
assign main_ethernetsoc_tag_di_tag = main_ethernetsoc_interface0_wb_sdram_adr[29:11];
assign main_ethernetsoc_adr = {main_ethernetsoc_tag_do_tag, main_ethernetsoc_interface0_wb_sdram_adr[10:2]};
always @(*) begin
	main_ethernetsoc_tag_di_dirty <= 1'd0;
	main_ethernetsoc_word_clr <= 1'd0;
	builder_fullmemorywe_next_state <= 3'd0;
	main_ethernetsoc_interface0_wb_sdram_ack <= 1'd0;
	main_ethernetsoc_word_inc <= 1'd0;
	main_ethernetsoc_write_from_slave <= 1'd0;
	main_ethernetsoc_cyc <= 1'd0;
	main_ethernetsoc_stb <= 1'd0;
	main_ethernetsoc_tag_port_we <= 1'd0;
	main_ethernetsoc_we <= 1'd0;
	builder_fullmemorywe_next_state <= builder_fullmemorywe_state;
	case (builder_fullmemorywe_state)
		1'd1: begin
			main_ethernetsoc_word_clr <= 1'd1;
			if ((main_ethernetsoc_tag_do_tag == main_ethernetsoc_interface0_wb_sdram_adr[29:11])) begin
				main_ethernetsoc_interface0_wb_sdram_ack <= 1'd1;
				if (main_ethernetsoc_interface0_wb_sdram_we) begin
					main_ethernetsoc_tag_di_dirty <= 1'd1;
					main_ethernetsoc_tag_port_we <= 1'd1;
				end
				builder_fullmemorywe_next_state <= 1'd0;
			end else begin
				if (main_ethernetsoc_tag_do_dirty) begin
					builder_fullmemorywe_next_state <= 2'd2;
				end else begin
					builder_fullmemorywe_next_state <= 2'd3;
				end
			end
		end
		2'd2: begin
			main_ethernetsoc_stb <= 1'd1;
			main_ethernetsoc_cyc <= 1'd1;
			main_ethernetsoc_we <= 1'd1;
			if (main_ethernetsoc_ack) begin
				main_ethernetsoc_word_inc <= 1'd1;
				if (1'd1) begin
					builder_fullmemorywe_next_state <= 2'd3;
				end
			end
		end
		2'd3: begin
			main_ethernetsoc_tag_port_we <= 1'd1;
			main_ethernetsoc_word_clr <= 1'd1;
			builder_fullmemorywe_next_state <= 3'd4;
		end
		3'd4: begin
			main_ethernetsoc_stb <= 1'd1;
			main_ethernetsoc_cyc <= 1'd1;
			main_ethernetsoc_we <= 1'd0;
			if (main_ethernetsoc_ack) begin
				main_ethernetsoc_write_from_slave <= 1'd1;
				main_ethernetsoc_word_inc <= 1'd1;
				if (1'd1) begin
					builder_fullmemorywe_next_state <= 1'd1;
				end else begin
					builder_fullmemorywe_next_state <= 3'd4;
				end
			end
		end
		default: begin
			if ((main_ethernetsoc_interface0_wb_sdram_cyc & main_ethernetsoc_interface0_wb_sdram_stb)) begin
				builder_fullmemorywe_next_state <= 1'd1;
			end
		end
	endcase
end
always @(*) begin
	main_ethernetsoc_port_wdata_payload_we <= 16'd0;
	main_ethernetsoc_port_rdata_ready <= 1'd0;
	builder_litedramwishbone2native_next_state <= 2'd0;
	main_ethernetsoc_port_cmd_valid <= 1'd0;
	main_ethernetsoc_port_cmd_payload_we <= 1'd0;
	main_ethernetsoc_dat_r <= 128'd0;
	main_ethernetsoc_port_cmd_payload_addr <= 24'd0;
	main_ethernetsoc_port_wdata_valid <= 1'd0;
	main_ethernetsoc_ack <= 1'd0;
	main_ethernetsoc_port_wdata_payload_data <= 128'd0;
	builder_litedramwishbone2native_next_state <= builder_litedramwishbone2native_state;
	case (builder_litedramwishbone2native_state)
		1'd1: begin
			main_ethernetsoc_port_cmd_valid <= 1'd1;
			main_ethernetsoc_port_cmd_payload_addr <= main_ethernetsoc_adr;
			main_ethernetsoc_port_cmd_payload_we <= main_ethernetsoc_we;
			if (main_ethernetsoc_port_cmd_ready) begin
				if (main_ethernetsoc_we) begin
					builder_litedramwishbone2native_next_state <= 2'd2;
				end else begin
					builder_litedramwishbone2native_next_state <= 2'd3;
				end
			end
		end
		2'd2: begin
			main_ethernetsoc_port_wdata_valid <= 1'd1;
			main_ethernetsoc_port_wdata_payload_we <= main_ethernetsoc_sel;
			main_ethernetsoc_port_wdata_payload_data <= main_ethernetsoc_dat_w;
			if (main_ethernetsoc_port_wdata_ready) begin
				main_ethernetsoc_ack <= 1'd1;
				builder_litedramwishbone2native_next_state <= 1'd0;
			end
		end
		2'd3: begin
			main_ethernetsoc_port_rdata_ready <= 1'd1;
			if (main_ethernetsoc_port_rdata_valid) begin
				main_ethernetsoc_dat_r <= main_ethernetsoc_port_rdata_payload_data;
				main_ethernetsoc_ack <= 1'd1;
				builder_litedramwishbone2native_next_state <= 1'd0;
			end
		end
		default: begin
			if ((main_ethernetsoc_cyc & main_ethernetsoc_stb)) begin
				builder_litedramwishbone2native_next_state <= 1'd1;
			end
		end
	endcase
end
assign eth_rx_clk = eth_clocks_rx;
assign eth_tx_clk = eth_clocks_tx;
assign main_ethphy_reset0 = (main_ethphy_reset_storage | main_ethphy_reset1);
assign eth_rst_n = (~main_ethphy_reset0);
assign main_ethphy_counter_done = (main_ethphy_counter == 9'd256);
assign main_ethphy_counter_ce = (~main_ethphy_counter_done);
assign main_ethphy_reset1 = (~main_ethphy_counter_done);
assign main_ethphy_liteethphymiitx_converter_sink_valid = main_ethphy_liteethphymiitx_sink_sink_valid;
assign main_ethphy_liteethphymiitx_converter_sink_payload_data = main_ethphy_liteethphymiitx_sink_sink_payload_data;
assign main_ethphy_liteethphymiitx_sink_sink_ready = main_ethphy_liteethphymiitx_converter_sink_ready;
assign main_ethphy_liteethphymiitx_converter_source_ready = 1'd1;
assign main_ethphy_liteethphymiitx_converter_converter_sink_valid = main_ethphy_liteethphymiitx_converter_sink_valid;
assign main_ethphy_liteethphymiitx_converter_converter_sink_first = main_ethphy_liteethphymiitx_converter_sink_first;
assign main_ethphy_liteethphymiitx_converter_converter_sink_last = main_ethphy_liteethphymiitx_converter_sink_last;
assign main_ethphy_liteethphymiitx_converter_sink_ready = main_ethphy_liteethphymiitx_converter_converter_sink_ready;
always @(*) begin
	main_ethphy_liteethphymiitx_converter_converter_sink_payload_data <= 8'd0;
	main_ethphy_liteethphymiitx_converter_converter_sink_payload_data[3:0] <= main_ethphy_liteethphymiitx_converter_sink_payload_data[3:0];
	main_ethphy_liteethphymiitx_converter_converter_sink_payload_data[7:4] <= main_ethphy_liteethphymiitx_converter_sink_payload_data[7:4];
end
assign main_ethphy_liteethphymiitx_converter_source_valid = main_ethphy_liteethphymiitx_converter_source_source_valid;
assign main_ethphy_liteethphymiitx_converter_source_first = main_ethphy_liteethphymiitx_converter_source_source_first;
assign main_ethphy_liteethphymiitx_converter_source_last = main_ethphy_liteethphymiitx_converter_source_source_last;
assign main_ethphy_liteethphymiitx_converter_source_source_ready = main_ethphy_liteethphymiitx_converter_source_ready;
assign {main_ethphy_liteethphymiitx_converter_source_payload_data} = main_ethphy_liteethphymiitx_converter_source_source_payload_data;
assign main_ethphy_liteethphymiitx_converter_source_source_valid = main_ethphy_liteethphymiitx_converter_converter_source_valid;
assign main_ethphy_liteethphymiitx_converter_converter_source_ready = main_ethphy_liteethphymiitx_converter_source_source_ready;
assign main_ethphy_liteethphymiitx_converter_source_source_first = main_ethphy_liteethphymiitx_converter_converter_source_first;
assign main_ethphy_liteethphymiitx_converter_source_source_last = main_ethphy_liteethphymiitx_converter_converter_source_last;
assign main_ethphy_liteethphymiitx_converter_source_source_payload_data = main_ethphy_liteethphymiitx_converter_converter_source_payload_data;
assign main_ethphy_liteethphymiitx_converter_converter_first = (main_ethphy_liteethphymiitx_converter_converter_mux == 1'd0);
assign main_ethphy_liteethphymiitx_converter_converter_last = (main_ethphy_liteethphymiitx_converter_converter_mux == 1'd1);
assign main_ethphy_liteethphymiitx_converter_converter_source_valid = main_ethphy_liteethphymiitx_converter_converter_sink_valid;
assign main_ethphy_liteethphymiitx_converter_converter_source_first = (main_ethphy_liteethphymiitx_converter_converter_sink_first & main_ethphy_liteethphymiitx_converter_converter_first);
assign main_ethphy_liteethphymiitx_converter_converter_source_last = (main_ethphy_liteethphymiitx_converter_converter_sink_last & main_ethphy_liteethphymiitx_converter_converter_last);
assign main_ethphy_liteethphymiitx_converter_converter_sink_ready = (main_ethphy_liteethphymiitx_converter_converter_last & main_ethphy_liteethphymiitx_converter_converter_source_ready);
always @(*) begin
	main_ethphy_liteethphymiitx_converter_converter_source_payload_data <= 4'd0;
	case (main_ethphy_liteethphymiitx_converter_converter_mux)
		1'd0: begin
			main_ethphy_liteethphymiitx_converter_converter_source_payload_data <= main_ethphy_liteethphymiitx_converter_converter_sink_payload_data[3:0];
		end
		default: begin
			main_ethphy_liteethphymiitx_converter_converter_source_payload_data <= main_ethphy_liteethphymiitx_converter_converter_sink_payload_data[7:4];
		end
	endcase
end
assign main_ethphy_liteethphymiitx_converter_converter_source_payload_valid_token_count = main_ethphy_liteethphymiitx_converter_converter_last;
assign main_ethphy_liteethphymiirx_converter_sink_last = (~eth_rx_dv);
assign main_ethphy_liteethphymiirx_source_source_valid = main_ethphy_liteethphymiirx_converter_source_valid;
assign main_ethphy_liteethphymiirx_converter_source_ready = main_ethphy_liteethphymiirx_source_source_ready;
assign main_ethphy_liteethphymiirx_source_source_first = main_ethphy_liteethphymiirx_converter_source_first;
assign main_ethphy_liteethphymiirx_source_source_last = main_ethphy_liteethphymiirx_converter_source_last;
assign main_ethphy_liteethphymiirx_source_source_payload_data = main_ethphy_liteethphymiirx_converter_source_payload_data;
assign main_ethphy_liteethphymiirx_converter_converter_sink_valid = main_ethphy_liteethphymiirx_converter_sink_valid;
assign main_ethphy_liteethphymiirx_converter_converter_sink_first = main_ethphy_liteethphymiirx_converter_sink_first;
assign main_ethphy_liteethphymiirx_converter_converter_sink_last = main_ethphy_liteethphymiirx_converter_sink_last;
assign main_ethphy_liteethphymiirx_converter_sink_ready = main_ethphy_liteethphymiirx_converter_converter_sink_ready;
assign main_ethphy_liteethphymiirx_converter_converter_sink_payload_data = {main_ethphy_liteethphymiirx_converter_sink_payload_data};
assign main_ethphy_liteethphymiirx_converter_source_valid = main_ethphy_liteethphymiirx_converter_source_source_valid;
assign main_ethphy_liteethphymiirx_converter_source_first = main_ethphy_liteethphymiirx_converter_source_source_first;
assign main_ethphy_liteethphymiirx_converter_source_last = main_ethphy_liteethphymiirx_converter_source_source_last;
assign main_ethphy_liteethphymiirx_converter_source_source_ready = main_ethphy_liteethphymiirx_converter_source_ready;
always @(*) begin
	main_ethphy_liteethphymiirx_converter_source_payload_data <= 8'd0;
	main_ethphy_liteethphymiirx_converter_source_payload_data[3:0] <= main_ethphy_liteethphymiirx_converter_source_source_payload_data[3:0];
	main_ethphy_liteethphymiirx_converter_source_payload_data[7:4] <= main_ethphy_liteethphymiirx_converter_source_source_payload_data[7:4];
end
assign main_ethphy_liteethphymiirx_converter_source_source_valid = main_ethphy_liteethphymiirx_converter_converter_source_valid;
assign main_ethphy_liteethphymiirx_converter_converter_source_ready = main_ethphy_liteethphymiirx_converter_source_source_ready;
assign main_ethphy_liteethphymiirx_converter_source_source_first = main_ethphy_liteethphymiirx_converter_converter_source_first;
assign main_ethphy_liteethphymiirx_converter_source_source_last = main_ethphy_liteethphymiirx_converter_converter_source_last;
assign main_ethphy_liteethphymiirx_converter_source_source_payload_data = main_ethphy_liteethphymiirx_converter_converter_source_payload_data;
assign main_ethphy_liteethphymiirx_converter_converter_sink_ready = ((~main_ethphy_liteethphymiirx_converter_converter_strobe_all) | main_ethphy_liteethphymiirx_converter_converter_source_ready);
assign main_ethphy_liteethphymiirx_converter_converter_source_valid = main_ethphy_liteethphymiirx_converter_converter_strobe_all;
assign main_ethphy_liteethphymiirx_converter_converter_load_part = (main_ethphy_liteethphymiirx_converter_converter_sink_valid & main_ethphy_liteethphymiirx_converter_converter_sink_ready);
assign eth_mdc = main_ethphy_storage[0];
assign main_ethphy_data_oe = main_ethphy_storage[1];
assign main_ethphy_data_w = main_ethphy_storage[2];
assign main_tx_cdc_sink_valid = main_source_valid;
assign main_source_ready = main_tx_cdc_sink_ready;
assign main_tx_cdc_sink_first = main_source_first;
assign main_tx_cdc_sink_last = main_source_last;
assign main_tx_cdc_sink_payload_data = main_source_payload_data;
assign main_tx_cdc_sink_payload_last_be = main_source_payload_last_be;
assign main_tx_cdc_sink_payload_error = main_source_payload_error;
assign main_sink_valid = main_rx_cdc_source_valid;
assign main_rx_cdc_source_ready = main_sink_ready;
assign main_sink_first = main_rx_cdc_source_first;
assign main_sink_last = main_rx_cdc_source_last;
assign main_sink_payload_data = main_rx_cdc_source_payload_data;
assign main_sink_payload_last_be = main_rx_cdc_source_payload_last_be;
assign main_sink_payload_error = main_rx_cdc_source_payload_error;
assign main_ps_preamble_error_i = main_preamble_checker_error;
assign main_ps_crc_error_i = main_crc32_checker_error;
always @(*) begin
	main_tx_gap_inserter_source_payload_last_be <= 1'd0;
	main_tx_gap_inserter_source_payload_error <= 1'd0;
	main_tx_gap_inserter_counter_reset <= 1'd0;
	main_tx_gap_inserter_counter_ce <= 1'd0;
	main_tx_gap_inserter_sink_ready <= 1'd0;
	main_tx_gap_inserter_source_valid <= 1'd0;
	builder_liteethmacgap_next_state <= 1'd0;
	main_tx_gap_inserter_source_first <= 1'd0;
	main_tx_gap_inserter_source_last <= 1'd0;
	main_tx_gap_inserter_source_payload_data <= 8'd0;
	builder_liteethmacgap_next_state <= builder_liteethmacgap_state;
	case (builder_liteethmacgap_state)
		1'd1: begin
			main_tx_gap_inserter_counter_ce <= 1'd1;
			if ((main_tx_gap_inserter_counter == 4'd11)) begin
				builder_liteethmacgap_next_state <= 1'd0;
			end
		end
		default: begin
			main_tx_gap_inserter_counter_reset <= 1'd1;
			main_tx_gap_inserter_source_valid <= main_tx_gap_inserter_sink_valid;
			main_tx_gap_inserter_sink_ready <= main_tx_gap_inserter_source_ready;
			main_tx_gap_inserter_source_first <= main_tx_gap_inserter_sink_first;
			main_tx_gap_inserter_source_last <= main_tx_gap_inserter_sink_last;
			main_tx_gap_inserter_source_payload_data <= main_tx_gap_inserter_sink_payload_data;
			main_tx_gap_inserter_source_payload_last_be <= main_tx_gap_inserter_sink_payload_last_be;
			main_tx_gap_inserter_source_payload_error <= main_tx_gap_inserter_sink_payload_error;
			if (((main_tx_gap_inserter_sink_valid & main_tx_gap_inserter_sink_last) & main_tx_gap_inserter_sink_ready)) begin
				builder_liteethmacgap_next_state <= 1'd1;
			end
		end
	endcase
end
assign main_preamble_inserter_source_payload_last_be = main_preamble_inserter_sink_payload_last_be;
always @(*) begin
	main_preamble_inserter_inc_cnt <= 1'd0;
	builder_liteethmacpreambleinserter_next_state <= 2'd0;
	main_preamble_inserter_source_valid <= 1'd0;
	main_preamble_inserter_source_first <= 1'd0;
	main_preamble_inserter_source_last <= 1'd0;
	main_preamble_inserter_source_payload_data <= 8'd0;
	main_preamble_inserter_source_payload_error <= 1'd0;
	main_preamble_inserter_clr_cnt <= 1'd0;
	main_preamble_inserter_sink_ready <= 1'd0;
	main_preamble_inserter_source_payload_data <= main_preamble_inserter_sink_payload_data;
	builder_liteethmacpreambleinserter_next_state <= builder_liteethmacpreambleinserter_state;
	case (builder_liteethmacpreambleinserter_state)
		1'd1: begin
			main_preamble_inserter_source_valid <= 1'd1;
			case (main_preamble_inserter_cnt)
				1'd0: begin
					main_preamble_inserter_source_payload_data <= main_preamble_inserter_preamble[7:0];
				end
				1'd1: begin
					main_preamble_inserter_source_payload_data <= main_preamble_inserter_preamble[15:8];
				end
				2'd2: begin
					main_preamble_inserter_source_payload_data <= main_preamble_inserter_preamble[23:16];
				end
				2'd3: begin
					main_preamble_inserter_source_payload_data <= main_preamble_inserter_preamble[31:24];
				end
				3'd4: begin
					main_preamble_inserter_source_payload_data <= main_preamble_inserter_preamble[39:32];
				end
				3'd5: begin
					main_preamble_inserter_source_payload_data <= main_preamble_inserter_preamble[47:40];
				end
				3'd6: begin
					main_preamble_inserter_source_payload_data <= main_preamble_inserter_preamble[55:48];
				end
				default: begin
					main_preamble_inserter_source_payload_data <= main_preamble_inserter_preamble[63:56];
				end
			endcase
			if ((main_preamble_inserter_cnt == 3'd7)) begin
				if (main_preamble_inserter_source_ready) begin
					builder_liteethmacpreambleinserter_next_state <= 2'd2;
				end
			end else begin
				main_preamble_inserter_inc_cnt <= main_preamble_inserter_source_ready;
			end
		end
		2'd2: begin
			main_preamble_inserter_source_valid <= main_preamble_inserter_sink_valid;
			main_preamble_inserter_sink_ready <= main_preamble_inserter_source_ready;
			main_preamble_inserter_source_first <= main_preamble_inserter_sink_first;
			main_preamble_inserter_source_last <= main_preamble_inserter_sink_last;
			main_preamble_inserter_source_payload_error <= main_preamble_inserter_sink_payload_error;
			if (((main_preamble_inserter_sink_valid & main_preamble_inserter_sink_last) & main_preamble_inserter_source_ready)) begin
				builder_liteethmacpreambleinserter_next_state <= 1'd0;
			end
		end
		default: begin
			main_preamble_inserter_sink_ready <= 1'd1;
			main_preamble_inserter_clr_cnt <= 1'd1;
			if (main_preamble_inserter_sink_valid) begin
				main_preamble_inserter_sink_ready <= 1'd0;
				builder_liteethmacpreambleinserter_next_state <= 1'd1;
			end
		end
	endcase
end
assign main_preamble_checker_source_payload_data = main_preamble_checker_sink_payload_data;
assign main_preamble_checker_source_payload_last_be = main_preamble_checker_sink_payload_last_be;
always @(*) begin
	main_preamble_checker_source_payload_error <= 1'd0;
	main_preamble_checker_error <= 1'd0;
	builder_liteethmacpreamblechecker_next_state <= 1'd0;
	main_preamble_checker_source_valid <= 1'd0;
	main_preamble_checker_sink_ready <= 1'd0;
	main_preamble_checker_source_first <= 1'd0;
	main_preamble_checker_source_last <= 1'd0;
	builder_liteethmacpreamblechecker_next_state <= builder_liteethmacpreamblechecker_state;
	case (builder_liteethmacpreamblechecker_state)
		1'd1: begin
			main_preamble_checker_source_valid <= main_preamble_checker_sink_valid;
			main_preamble_checker_sink_ready <= main_preamble_checker_source_ready;
			main_preamble_checker_source_first <= main_preamble_checker_sink_first;
			main_preamble_checker_source_last <= main_preamble_checker_sink_last;
			main_preamble_checker_source_payload_error <= main_preamble_checker_sink_payload_error;
			if (((main_preamble_checker_source_valid & main_preamble_checker_source_last) & main_preamble_checker_source_ready)) begin
				builder_liteethmacpreamblechecker_next_state <= 1'd0;
			end
		end
		default: begin
			main_preamble_checker_sink_ready <= 1'd1;
			if (((main_preamble_checker_sink_valid & (~main_preamble_checker_sink_last)) & (main_preamble_checker_sink_payload_data == 8'd213))) begin
				builder_liteethmacpreamblechecker_next_state <= 1'd1;
			end
			if ((main_preamble_checker_sink_valid & main_preamble_checker_sink_last)) begin
				main_preamble_checker_error <= 1'd1;
			end
		end
	endcase
end
assign main_crc32_inserter_cnt_done = (main_crc32_inserter_cnt == 1'd0);
assign main_crc32_inserter_data1 = main_crc32_inserter_data0;
assign main_crc32_inserter_last = main_crc32_inserter_reg;
assign main_crc32_inserter_value = (~{main_crc32_inserter_reg[0], main_crc32_inserter_reg[1], main_crc32_inserter_reg[2], main_crc32_inserter_reg[3], main_crc32_inserter_reg[4], main_crc32_inserter_reg[5], main_crc32_inserter_reg[6], main_crc32_inserter_reg[7], main_crc32_inserter_reg[8], main_crc32_inserter_reg[9], main_crc32_inserter_reg[10], main_crc32_inserter_reg[11], main_crc32_inserter_reg[12], main_crc32_inserter_reg[13], main_crc32_inserter_reg[14], main_crc32_inserter_reg[15], main_crc32_inserter_reg[16], main_crc32_inserter_reg[17], main_crc32_inserter_reg[18], main_crc32_inserter_reg[19], main_crc32_inserter_reg[20], main_crc32_inserter_reg[21], main_crc32_inserter_reg[22], main_crc32_inserter_reg[23], main_crc32_inserter_reg[24], main_crc32_inserter_reg[25], main_crc32_inserter_reg[26], main_crc32_inserter_reg[27], main_crc32_inserter_reg[28], main_crc32_inserter_reg[29], main_crc32_inserter_reg[30], main_crc32_inserter_reg[31]});
assign main_crc32_inserter_error = (main_crc32_inserter_next != 32'd3338984827);
always @(*) begin
	main_crc32_inserter_next <= 32'd0;
	main_crc32_inserter_next[0] <= (((main_crc32_inserter_last[24] ^ main_crc32_inserter_last[30]) ^ main_crc32_inserter_data1[1]) ^ main_crc32_inserter_data1[7]);
	main_crc32_inserter_next[1] <= (((((((main_crc32_inserter_last[25] ^ main_crc32_inserter_last[31]) ^ main_crc32_inserter_data1[0]) ^ main_crc32_inserter_data1[6]) ^ main_crc32_inserter_last[24]) ^ main_crc32_inserter_last[30]) ^ main_crc32_inserter_data1[1]) ^ main_crc32_inserter_data1[7]);
	main_crc32_inserter_next[2] <= (((((((((main_crc32_inserter_last[26] ^ main_crc32_inserter_data1[5]) ^ main_crc32_inserter_last[25]) ^ main_crc32_inserter_last[31]) ^ main_crc32_inserter_data1[0]) ^ main_crc32_inserter_data1[6]) ^ main_crc32_inserter_last[24]) ^ main_crc32_inserter_last[30]) ^ main_crc32_inserter_data1[1]) ^ main_crc32_inserter_data1[7]);
	main_crc32_inserter_next[3] <= (((((((main_crc32_inserter_last[27] ^ main_crc32_inserter_data1[4]) ^ main_crc32_inserter_last[26]) ^ main_crc32_inserter_data1[5]) ^ main_crc32_inserter_last[25]) ^ main_crc32_inserter_last[31]) ^ main_crc32_inserter_data1[0]) ^ main_crc32_inserter_data1[6]);
	main_crc32_inserter_next[4] <= (((((((((main_crc32_inserter_last[28] ^ main_crc32_inserter_data1[3]) ^ main_crc32_inserter_last[27]) ^ main_crc32_inserter_data1[4]) ^ main_crc32_inserter_last[26]) ^ main_crc32_inserter_data1[5]) ^ main_crc32_inserter_last[24]) ^ main_crc32_inserter_last[30]) ^ main_crc32_inserter_data1[1]) ^ main_crc32_inserter_data1[7]);
	main_crc32_inserter_next[5] <= (((((((((((((main_crc32_inserter_last[29] ^ main_crc32_inserter_data1[2]) ^ main_crc32_inserter_last[28]) ^ main_crc32_inserter_data1[3]) ^ main_crc32_inserter_last[27]) ^ main_crc32_inserter_data1[4]) ^ main_crc32_inserter_last[25]) ^ main_crc32_inserter_last[31]) ^ main_crc32_inserter_data1[0]) ^ main_crc32_inserter_data1[6]) ^ main_crc32_inserter_last[24]) ^ main_crc32_inserter_last[30]) ^ main_crc32_inserter_data1[1]) ^ main_crc32_inserter_data1[7]);
	main_crc32_inserter_next[6] <= (((((((((((main_crc32_inserter_last[30] ^ main_crc32_inserter_data1[1]) ^ main_crc32_inserter_last[29]) ^ main_crc32_inserter_data1[2]) ^ main_crc32_inserter_last[28]) ^ main_crc32_inserter_data1[3]) ^ main_crc32_inserter_last[26]) ^ main_crc32_inserter_data1[5]) ^ main_crc32_inserter_last[25]) ^ main_crc32_inserter_last[31]) ^ main_crc32_inserter_data1[0]) ^ main_crc32_inserter_data1[6]);
	main_crc32_inserter_next[7] <= (((((((((main_crc32_inserter_last[31] ^ main_crc32_inserter_data1[0]) ^ main_crc32_inserter_last[29]) ^ main_crc32_inserter_data1[2]) ^ main_crc32_inserter_last[27]) ^ main_crc32_inserter_data1[4]) ^ main_crc32_inserter_last[26]) ^ main_crc32_inserter_data1[5]) ^ main_crc32_inserter_last[24]) ^ main_crc32_inserter_data1[7]);
	main_crc32_inserter_next[8] <= ((((((((main_crc32_inserter_last[0] ^ main_crc32_inserter_last[28]) ^ main_crc32_inserter_data1[3]) ^ main_crc32_inserter_last[27]) ^ main_crc32_inserter_data1[4]) ^ main_crc32_inserter_last[25]) ^ main_crc32_inserter_data1[6]) ^ main_crc32_inserter_last[24]) ^ main_crc32_inserter_data1[7]);
	main_crc32_inserter_next[9] <= ((((((((main_crc32_inserter_last[1] ^ main_crc32_inserter_last[29]) ^ main_crc32_inserter_data1[2]) ^ main_crc32_inserter_last[28]) ^ main_crc32_inserter_data1[3]) ^ main_crc32_inserter_last[26]) ^ main_crc32_inserter_data1[5]) ^ main_crc32_inserter_last[25]) ^ main_crc32_inserter_data1[6]);
	main_crc32_inserter_next[10] <= ((((((((main_crc32_inserter_last[2] ^ main_crc32_inserter_last[29]) ^ main_crc32_inserter_data1[2]) ^ main_crc32_inserter_last[27]) ^ main_crc32_inserter_data1[4]) ^ main_crc32_inserter_last[26]) ^ main_crc32_inserter_data1[5]) ^ main_crc32_inserter_last[24]) ^ main_crc32_inserter_data1[7]);
	main_crc32_inserter_next[11] <= ((((((((main_crc32_inserter_last[3] ^ main_crc32_inserter_last[28]) ^ main_crc32_inserter_data1[3]) ^ main_crc32_inserter_last[27]) ^ main_crc32_inserter_data1[4]) ^ main_crc32_inserter_last[25]) ^ main_crc32_inserter_data1[6]) ^ main_crc32_inserter_last[24]) ^ main_crc32_inserter_data1[7]);
	main_crc32_inserter_next[12] <= ((((((((((((main_crc32_inserter_last[4] ^ main_crc32_inserter_last[29]) ^ main_crc32_inserter_data1[2]) ^ main_crc32_inserter_last[28]) ^ main_crc32_inserter_data1[3]) ^ main_crc32_inserter_last[26]) ^ main_crc32_inserter_data1[5]) ^ main_crc32_inserter_last[25]) ^ main_crc32_inserter_data1[6]) ^ main_crc32_inserter_last[24]) ^ main_crc32_inserter_last[30]) ^ main_crc32_inserter_data1[1]) ^ main_crc32_inserter_data1[7]);
	main_crc32_inserter_next[13] <= ((((((((((((main_crc32_inserter_last[5] ^ main_crc32_inserter_last[30]) ^ main_crc32_inserter_data1[1]) ^ main_crc32_inserter_last[29]) ^ main_crc32_inserter_data1[2]) ^ main_crc32_inserter_last[27]) ^ main_crc32_inserter_data1[4]) ^ main_crc32_inserter_last[26]) ^ main_crc32_inserter_data1[5]) ^ main_crc32_inserter_last[25]) ^ main_crc32_inserter_last[31]) ^ main_crc32_inserter_data1[0]) ^ main_crc32_inserter_data1[6]);
	main_crc32_inserter_next[14] <= ((((((((((main_crc32_inserter_last[6] ^ main_crc32_inserter_last[31]) ^ main_crc32_inserter_data1[0]) ^ main_crc32_inserter_last[30]) ^ main_crc32_inserter_data1[1]) ^ main_crc32_inserter_last[28]) ^ main_crc32_inserter_data1[3]) ^ main_crc32_inserter_last[27]) ^ main_crc32_inserter_data1[4]) ^ main_crc32_inserter_last[26]) ^ main_crc32_inserter_data1[5]);
	main_crc32_inserter_next[15] <= ((((((((main_crc32_inserter_last[7] ^ main_crc32_inserter_last[31]) ^ main_crc32_inserter_data1[0]) ^ main_crc32_inserter_last[29]) ^ main_crc32_inserter_data1[2]) ^ main_crc32_inserter_last[28]) ^ main_crc32_inserter_data1[3]) ^ main_crc32_inserter_last[27]) ^ main_crc32_inserter_data1[4]);
	main_crc32_inserter_next[16] <= ((((((main_crc32_inserter_last[8] ^ main_crc32_inserter_last[29]) ^ main_crc32_inserter_data1[2]) ^ main_crc32_inserter_last[28]) ^ main_crc32_inserter_data1[3]) ^ main_crc32_inserter_last[24]) ^ main_crc32_inserter_data1[7]);
	main_crc32_inserter_next[17] <= ((((((main_crc32_inserter_last[9] ^ main_crc32_inserter_last[30]) ^ main_crc32_inserter_data1[1]) ^ main_crc32_inserter_last[29]) ^ main_crc32_inserter_data1[2]) ^ main_crc32_inserter_last[25]) ^ main_crc32_inserter_data1[6]);
	main_crc32_inserter_next[18] <= ((((((main_crc32_inserter_last[10] ^ main_crc32_inserter_last[31]) ^ main_crc32_inserter_data1[0]) ^ main_crc32_inserter_last[30]) ^ main_crc32_inserter_data1[1]) ^ main_crc32_inserter_last[26]) ^ main_crc32_inserter_data1[5]);
	main_crc32_inserter_next[19] <= ((((main_crc32_inserter_last[11] ^ main_crc32_inserter_last[31]) ^ main_crc32_inserter_data1[0]) ^ main_crc32_inserter_last[27]) ^ main_crc32_inserter_data1[4]);
	main_crc32_inserter_next[20] <= ((main_crc32_inserter_last[12] ^ main_crc32_inserter_last[28]) ^ main_crc32_inserter_data1[3]);
	main_crc32_inserter_next[21] <= ((main_crc32_inserter_last[13] ^ main_crc32_inserter_last[29]) ^ main_crc32_inserter_data1[2]);
	main_crc32_inserter_next[22] <= ((main_crc32_inserter_last[14] ^ main_crc32_inserter_last[24]) ^ main_crc32_inserter_data1[7]);
	main_crc32_inserter_next[23] <= ((((((main_crc32_inserter_last[15] ^ main_crc32_inserter_last[25]) ^ main_crc32_inserter_data1[6]) ^ main_crc32_inserter_last[24]) ^ main_crc32_inserter_last[30]) ^ main_crc32_inserter_data1[1]) ^ main_crc32_inserter_data1[7]);
	main_crc32_inserter_next[24] <= ((((((main_crc32_inserter_last[16] ^ main_crc32_inserter_last[26]) ^ main_crc32_inserter_data1[5]) ^ main_crc32_inserter_last[25]) ^ main_crc32_inserter_last[31]) ^ main_crc32_inserter_data1[0]) ^ main_crc32_inserter_data1[6]);
	main_crc32_inserter_next[25] <= ((((main_crc32_inserter_last[17] ^ main_crc32_inserter_last[27]) ^ main_crc32_inserter_data1[4]) ^ main_crc32_inserter_last[26]) ^ main_crc32_inserter_data1[5]);
	main_crc32_inserter_next[26] <= ((((((((main_crc32_inserter_last[18] ^ main_crc32_inserter_last[28]) ^ main_crc32_inserter_data1[3]) ^ main_crc32_inserter_last[27]) ^ main_crc32_inserter_data1[4]) ^ main_crc32_inserter_last[24]) ^ main_crc32_inserter_last[30]) ^ main_crc32_inserter_data1[1]) ^ main_crc32_inserter_data1[7]);
	main_crc32_inserter_next[27] <= ((((((((main_crc32_inserter_last[19] ^ main_crc32_inserter_last[29]) ^ main_crc32_inserter_data1[2]) ^ main_crc32_inserter_last[28]) ^ main_crc32_inserter_data1[3]) ^ main_crc32_inserter_last[25]) ^ main_crc32_inserter_last[31]) ^ main_crc32_inserter_data1[0]) ^ main_crc32_inserter_data1[6]);
	main_crc32_inserter_next[28] <= ((((((main_crc32_inserter_last[20] ^ main_crc32_inserter_last[30]) ^ main_crc32_inserter_data1[1]) ^ main_crc32_inserter_last[29]) ^ main_crc32_inserter_data1[2]) ^ main_crc32_inserter_last[26]) ^ main_crc32_inserter_data1[5]);
	main_crc32_inserter_next[29] <= ((((((main_crc32_inserter_last[21] ^ main_crc32_inserter_last[31]) ^ main_crc32_inserter_data1[0]) ^ main_crc32_inserter_last[30]) ^ main_crc32_inserter_data1[1]) ^ main_crc32_inserter_last[27]) ^ main_crc32_inserter_data1[4]);
	main_crc32_inserter_next[30] <= ((((main_crc32_inserter_last[22] ^ main_crc32_inserter_last[31]) ^ main_crc32_inserter_data1[0]) ^ main_crc32_inserter_last[28]) ^ main_crc32_inserter_data1[3]);
	main_crc32_inserter_next[31] <= ((main_crc32_inserter_last[23] ^ main_crc32_inserter_last[29]) ^ main_crc32_inserter_data1[2]);
end
always @(*) begin
	main_crc32_inserter_is_ongoing0 <= 1'd0;
	main_crc32_inserter_sink_ready <= 1'd0;
	main_crc32_inserter_is_ongoing1 <= 1'd0;
	main_crc32_inserter_ce <= 1'd0;
	main_crc32_inserter_reset <= 1'd0;
	builder_liteethmaccrc32inserter_next_state <= 2'd0;
	main_crc32_inserter_source_valid <= 1'd0;
	main_crc32_inserter_source_first <= 1'd0;
	main_crc32_inserter_source_last <= 1'd0;
	main_crc32_inserter_source_payload_data <= 8'd0;
	main_crc32_inserter_source_payload_last_be <= 1'd0;
	main_crc32_inserter_source_payload_error <= 1'd0;
	main_crc32_inserter_data0 <= 8'd0;
	builder_liteethmaccrc32inserter_next_state <= builder_liteethmaccrc32inserter_state;
	case (builder_liteethmaccrc32inserter_state)
		1'd1: begin
			main_crc32_inserter_ce <= (main_crc32_inserter_sink_valid & main_crc32_inserter_source_ready);
			main_crc32_inserter_data0 <= main_crc32_inserter_sink_payload_data;
			main_crc32_inserter_source_valid <= main_crc32_inserter_sink_valid;
			main_crc32_inserter_sink_ready <= main_crc32_inserter_source_ready;
			main_crc32_inserter_source_first <= main_crc32_inserter_sink_first;
			main_crc32_inserter_source_last <= main_crc32_inserter_sink_last;
			main_crc32_inserter_source_payload_data <= main_crc32_inserter_sink_payload_data;
			main_crc32_inserter_source_payload_last_be <= main_crc32_inserter_sink_payload_last_be;
			main_crc32_inserter_source_payload_error <= main_crc32_inserter_sink_payload_error;
			main_crc32_inserter_source_last <= 1'd0;
			if (((main_crc32_inserter_sink_valid & main_crc32_inserter_sink_last) & main_crc32_inserter_source_ready)) begin
				builder_liteethmaccrc32inserter_next_state <= 2'd2;
			end
		end
		2'd2: begin
			main_crc32_inserter_source_valid <= 1'd1;
			case (main_crc32_inserter_cnt)
				1'd0: begin
					main_crc32_inserter_source_payload_data <= main_crc32_inserter_value[31:24];
				end
				1'd1: begin
					main_crc32_inserter_source_payload_data <= main_crc32_inserter_value[23:16];
				end
				2'd2: begin
					main_crc32_inserter_source_payload_data <= main_crc32_inserter_value[15:8];
				end
				default: begin
					main_crc32_inserter_source_payload_data <= main_crc32_inserter_value[7:0];
				end
			endcase
			if (main_crc32_inserter_cnt_done) begin
				main_crc32_inserter_source_last <= 1'd1;
				if (main_crc32_inserter_source_ready) begin
					builder_liteethmaccrc32inserter_next_state <= 1'd0;
				end
			end
			main_crc32_inserter_is_ongoing1 <= 1'd1;
		end
		default: begin
			main_crc32_inserter_reset <= 1'd1;
			main_crc32_inserter_sink_ready <= 1'd1;
			if (main_crc32_inserter_sink_valid) begin
				main_crc32_inserter_sink_ready <= 1'd0;
				builder_liteethmaccrc32inserter_next_state <= 1'd1;
			end
			main_crc32_inserter_is_ongoing0 <= 1'd1;
		end
	endcase
end
assign main_crc32_checker_fifo_full = (main_crc32_checker_syncfifo_level == 3'd4);
assign main_crc32_checker_fifo_in = (main_crc32_checker_sink_sink_valid & ((~main_crc32_checker_fifo_full) | main_crc32_checker_fifo_out));
assign main_crc32_checker_fifo_out = (main_crc32_checker_source_source_valid & main_crc32_checker_source_source_ready);
assign main_crc32_checker_syncfifo_sink_first = main_crc32_checker_sink_sink_first;
assign main_crc32_checker_syncfifo_sink_last = main_crc32_checker_sink_sink_last;
assign main_crc32_checker_syncfifo_sink_payload_data = main_crc32_checker_sink_sink_payload_data;
assign main_crc32_checker_syncfifo_sink_payload_last_be = main_crc32_checker_sink_sink_payload_last_be;
assign main_crc32_checker_syncfifo_sink_payload_error = main_crc32_checker_sink_sink_payload_error;
always @(*) begin
	main_crc32_checker_syncfifo_sink_valid <= 1'd0;
	main_crc32_checker_syncfifo_sink_valid <= main_crc32_checker_sink_sink_valid;
	main_crc32_checker_syncfifo_sink_valid <= main_crc32_checker_fifo_in;
end
always @(*) begin
	main_crc32_checker_sink_sink_ready <= 1'd0;
	main_crc32_checker_sink_sink_ready <= main_crc32_checker_syncfifo_sink_ready;
	main_crc32_checker_sink_sink_ready <= main_crc32_checker_fifo_in;
end
assign main_crc32_checker_source_source_valid = (main_crc32_checker_sink_sink_valid & main_crc32_checker_fifo_full);
assign main_crc32_checker_source_source_last = main_crc32_checker_sink_sink_last;
assign main_crc32_checker_syncfifo_source_ready = main_crc32_checker_fifo_out;
assign main_crc32_checker_source_source_payload_data = main_crc32_checker_syncfifo_source_payload_data;
assign main_crc32_checker_source_source_payload_last_be = main_crc32_checker_syncfifo_source_payload_last_be;
always @(*) begin
	main_crc32_checker_source_source_payload_error <= 1'd0;
	main_crc32_checker_source_source_payload_error <= main_crc32_checker_syncfifo_source_payload_error;
	main_crc32_checker_source_source_payload_error <= (main_crc32_checker_sink_sink_payload_error | main_crc32_checker_crc_error);
end
assign main_crc32_checker_error = ((main_crc32_checker_source_source_valid & main_crc32_checker_source_source_last) & main_crc32_checker_crc_error);
assign main_crc32_checker_crc_data0 = main_crc32_checker_sink_sink_payload_data;
assign main_crc32_checker_crc_data1 = main_crc32_checker_crc_data0;
assign main_crc32_checker_crc_last = main_crc32_checker_crc_reg;
assign main_crc32_checker_crc_value = (~{main_crc32_checker_crc_reg[0], main_crc32_checker_crc_reg[1], main_crc32_checker_crc_reg[2], main_crc32_checker_crc_reg[3], main_crc32_checker_crc_reg[4], main_crc32_checker_crc_reg[5], main_crc32_checker_crc_reg[6], main_crc32_checker_crc_reg[7], main_crc32_checker_crc_reg[8], main_crc32_checker_crc_reg[9], main_crc32_checker_crc_reg[10], main_crc32_checker_crc_reg[11], main_crc32_checker_crc_reg[12], main_crc32_checker_crc_reg[13], main_crc32_checker_crc_reg[14], main_crc32_checker_crc_reg[15], main_crc32_checker_crc_reg[16], main_crc32_checker_crc_reg[17], main_crc32_checker_crc_reg[18], main_crc32_checker_crc_reg[19], main_crc32_checker_crc_reg[20], main_crc32_checker_crc_reg[21], main_crc32_checker_crc_reg[22], main_crc32_checker_crc_reg[23], main_crc32_checker_crc_reg[24], main_crc32_checker_crc_reg[25], main_crc32_checker_crc_reg[26], main_crc32_checker_crc_reg[27], main_crc32_checker_crc_reg[28], main_crc32_checker_crc_reg[29], main_crc32_checker_crc_reg[30], main_crc32_checker_crc_reg[31]});
assign main_crc32_checker_crc_error = (main_crc32_checker_crc_next != 32'd3338984827);
always @(*) begin
	main_crc32_checker_crc_next <= 32'd0;
	main_crc32_checker_crc_next[0] <= (((main_crc32_checker_crc_last[24] ^ main_crc32_checker_crc_last[30]) ^ main_crc32_checker_crc_data1[1]) ^ main_crc32_checker_crc_data1[7]);
	main_crc32_checker_crc_next[1] <= (((((((main_crc32_checker_crc_last[25] ^ main_crc32_checker_crc_last[31]) ^ main_crc32_checker_crc_data1[0]) ^ main_crc32_checker_crc_data1[6]) ^ main_crc32_checker_crc_last[24]) ^ main_crc32_checker_crc_last[30]) ^ main_crc32_checker_crc_data1[1]) ^ main_crc32_checker_crc_data1[7]);
	main_crc32_checker_crc_next[2] <= (((((((((main_crc32_checker_crc_last[26] ^ main_crc32_checker_crc_data1[5]) ^ main_crc32_checker_crc_last[25]) ^ main_crc32_checker_crc_last[31]) ^ main_crc32_checker_crc_data1[0]) ^ main_crc32_checker_crc_data1[6]) ^ main_crc32_checker_crc_last[24]) ^ main_crc32_checker_crc_last[30]) ^ main_crc32_checker_crc_data1[1]) ^ main_crc32_checker_crc_data1[7]);
	main_crc32_checker_crc_next[3] <= (((((((main_crc32_checker_crc_last[27] ^ main_crc32_checker_crc_data1[4]) ^ main_crc32_checker_crc_last[26]) ^ main_crc32_checker_crc_data1[5]) ^ main_crc32_checker_crc_last[25]) ^ main_crc32_checker_crc_last[31]) ^ main_crc32_checker_crc_data1[0]) ^ main_crc32_checker_crc_data1[6]);
	main_crc32_checker_crc_next[4] <= (((((((((main_crc32_checker_crc_last[28] ^ main_crc32_checker_crc_data1[3]) ^ main_crc32_checker_crc_last[27]) ^ main_crc32_checker_crc_data1[4]) ^ main_crc32_checker_crc_last[26]) ^ main_crc32_checker_crc_data1[5]) ^ main_crc32_checker_crc_last[24]) ^ main_crc32_checker_crc_last[30]) ^ main_crc32_checker_crc_data1[1]) ^ main_crc32_checker_crc_data1[7]);
	main_crc32_checker_crc_next[5] <= (((((((((((((main_crc32_checker_crc_last[29] ^ main_crc32_checker_crc_data1[2]) ^ main_crc32_checker_crc_last[28]) ^ main_crc32_checker_crc_data1[3]) ^ main_crc32_checker_crc_last[27]) ^ main_crc32_checker_crc_data1[4]) ^ main_crc32_checker_crc_last[25]) ^ main_crc32_checker_crc_last[31]) ^ main_crc32_checker_crc_data1[0]) ^ main_crc32_checker_crc_data1[6]) ^ main_crc32_checker_crc_last[24]) ^ main_crc32_checker_crc_last[30]) ^ main_crc32_checker_crc_data1[1]) ^ main_crc32_checker_crc_data1[7]);
	main_crc32_checker_crc_next[6] <= (((((((((((main_crc32_checker_crc_last[30] ^ main_crc32_checker_crc_data1[1]) ^ main_crc32_checker_crc_last[29]) ^ main_crc32_checker_crc_data1[2]) ^ main_crc32_checker_crc_last[28]) ^ main_crc32_checker_crc_data1[3]) ^ main_crc32_checker_crc_last[26]) ^ main_crc32_checker_crc_data1[5]) ^ main_crc32_checker_crc_last[25]) ^ main_crc32_checker_crc_last[31]) ^ main_crc32_checker_crc_data1[0]) ^ main_crc32_checker_crc_data1[6]);
	main_crc32_checker_crc_next[7] <= (((((((((main_crc32_checker_crc_last[31] ^ main_crc32_checker_crc_data1[0]) ^ main_crc32_checker_crc_last[29]) ^ main_crc32_checker_crc_data1[2]) ^ main_crc32_checker_crc_last[27]) ^ main_crc32_checker_crc_data1[4]) ^ main_crc32_checker_crc_last[26]) ^ main_crc32_checker_crc_data1[5]) ^ main_crc32_checker_crc_last[24]) ^ main_crc32_checker_crc_data1[7]);
	main_crc32_checker_crc_next[8] <= ((((((((main_crc32_checker_crc_last[0] ^ main_crc32_checker_crc_last[28]) ^ main_crc32_checker_crc_data1[3]) ^ main_crc32_checker_crc_last[27]) ^ main_crc32_checker_crc_data1[4]) ^ main_crc32_checker_crc_last[25]) ^ main_crc32_checker_crc_data1[6]) ^ main_crc32_checker_crc_last[24]) ^ main_crc32_checker_crc_data1[7]);
	main_crc32_checker_crc_next[9] <= ((((((((main_crc32_checker_crc_last[1] ^ main_crc32_checker_crc_last[29]) ^ main_crc32_checker_crc_data1[2]) ^ main_crc32_checker_crc_last[28]) ^ main_crc32_checker_crc_data1[3]) ^ main_crc32_checker_crc_last[26]) ^ main_crc32_checker_crc_data1[5]) ^ main_crc32_checker_crc_last[25]) ^ main_crc32_checker_crc_data1[6]);
	main_crc32_checker_crc_next[10] <= ((((((((main_crc32_checker_crc_last[2] ^ main_crc32_checker_crc_last[29]) ^ main_crc32_checker_crc_data1[2]) ^ main_crc32_checker_crc_last[27]) ^ main_crc32_checker_crc_data1[4]) ^ main_crc32_checker_crc_last[26]) ^ main_crc32_checker_crc_data1[5]) ^ main_crc32_checker_crc_last[24]) ^ main_crc32_checker_crc_data1[7]);
	main_crc32_checker_crc_next[11] <= ((((((((main_crc32_checker_crc_last[3] ^ main_crc32_checker_crc_last[28]) ^ main_crc32_checker_crc_data1[3]) ^ main_crc32_checker_crc_last[27]) ^ main_crc32_checker_crc_data1[4]) ^ main_crc32_checker_crc_last[25]) ^ main_crc32_checker_crc_data1[6]) ^ main_crc32_checker_crc_last[24]) ^ main_crc32_checker_crc_data1[7]);
	main_crc32_checker_crc_next[12] <= ((((((((((((main_crc32_checker_crc_last[4] ^ main_crc32_checker_crc_last[29]) ^ main_crc32_checker_crc_data1[2]) ^ main_crc32_checker_crc_last[28]) ^ main_crc32_checker_crc_data1[3]) ^ main_crc32_checker_crc_last[26]) ^ main_crc32_checker_crc_data1[5]) ^ main_crc32_checker_crc_last[25]) ^ main_crc32_checker_crc_data1[6]) ^ main_crc32_checker_crc_last[24]) ^ main_crc32_checker_crc_last[30]) ^ main_crc32_checker_crc_data1[1]) ^ main_crc32_checker_crc_data1[7]);
	main_crc32_checker_crc_next[13] <= ((((((((((((main_crc32_checker_crc_last[5] ^ main_crc32_checker_crc_last[30]) ^ main_crc32_checker_crc_data1[1]) ^ main_crc32_checker_crc_last[29]) ^ main_crc32_checker_crc_data1[2]) ^ main_crc32_checker_crc_last[27]) ^ main_crc32_checker_crc_data1[4]) ^ main_crc32_checker_crc_last[26]) ^ main_crc32_checker_crc_data1[5]) ^ main_crc32_checker_crc_last[25]) ^ main_crc32_checker_crc_last[31]) ^ main_crc32_checker_crc_data1[0]) ^ main_crc32_checker_crc_data1[6]);
	main_crc32_checker_crc_next[14] <= ((((((((((main_crc32_checker_crc_last[6] ^ main_crc32_checker_crc_last[31]) ^ main_crc32_checker_crc_data1[0]) ^ main_crc32_checker_crc_last[30]) ^ main_crc32_checker_crc_data1[1]) ^ main_crc32_checker_crc_last[28]) ^ main_crc32_checker_crc_data1[3]) ^ main_crc32_checker_crc_last[27]) ^ main_crc32_checker_crc_data1[4]) ^ main_crc32_checker_crc_last[26]) ^ main_crc32_checker_crc_data1[5]);
	main_crc32_checker_crc_next[15] <= ((((((((main_crc32_checker_crc_last[7] ^ main_crc32_checker_crc_last[31]) ^ main_crc32_checker_crc_data1[0]) ^ main_crc32_checker_crc_last[29]) ^ main_crc32_checker_crc_data1[2]) ^ main_crc32_checker_crc_last[28]) ^ main_crc32_checker_crc_data1[3]) ^ main_crc32_checker_crc_last[27]) ^ main_crc32_checker_crc_data1[4]);
	main_crc32_checker_crc_next[16] <= ((((((main_crc32_checker_crc_last[8] ^ main_crc32_checker_crc_last[29]) ^ main_crc32_checker_crc_data1[2]) ^ main_crc32_checker_crc_last[28]) ^ main_crc32_checker_crc_data1[3]) ^ main_crc32_checker_crc_last[24]) ^ main_crc32_checker_crc_data1[7]);
	main_crc32_checker_crc_next[17] <= ((((((main_crc32_checker_crc_last[9] ^ main_crc32_checker_crc_last[30]) ^ main_crc32_checker_crc_data1[1]) ^ main_crc32_checker_crc_last[29]) ^ main_crc32_checker_crc_data1[2]) ^ main_crc32_checker_crc_last[25]) ^ main_crc32_checker_crc_data1[6]);
	main_crc32_checker_crc_next[18] <= ((((((main_crc32_checker_crc_last[10] ^ main_crc32_checker_crc_last[31]) ^ main_crc32_checker_crc_data1[0]) ^ main_crc32_checker_crc_last[30]) ^ main_crc32_checker_crc_data1[1]) ^ main_crc32_checker_crc_last[26]) ^ main_crc32_checker_crc_data1[5]);
	main_crc32_checker_crc_next[19] <= ((((main_crc32_checker_crc_last[11] ^ main_crc32_checker_crc_last[31]) ^ main_crc32_checker_crc_data1[0]) ^ main_crc32_checker_crc_last[27]) ^ main_crc32_checker_crc_data1[4]);
	main_crc32_checker_crc_next[20] <= ((main_crc32_checker_crc_last[12] ^ main_crc32_checker_crc_last[28]) ^ main_crc32_checker_crc_data1[3]);
	main_crc32_checker_crc_next[21] <= ((main_crc32_checker_crc_last[13] ^ main_crc32_checker_crc_last[29]) ^ main_crc32_checker_crc_data1[2]);
	main_crc32_checker_crc_next[22] <= ((main_crc32_checker_crc_last[14] ^ main_crc32_checker_crc_last[24]) ^ main_crc32_checker_crc_data1[7]);
	main_crc32_checker_crc_next[23] <= ((((((main_crc32_checker_crc_last[15] ^ main_crc32_checker_crc_last[25]) ^ main_crc32_checker_crc_data1[6]) ^ main_crc32_checker_crc_last[24]) ^ main_crc32_checker_crc_last[30]) ^ main_crc32_checker_crc_data1[1]) ^ main_crc32_checker_crc_data1[7]);
	main_crc32_checker_crc_next[24] <= ((((((main_crc32_checker_crc_last[16] ^ main_crc32_checker_crc_last[26]) ^ main_crc32_checker_crc_data1[5]) ^ main_crc32_checker_crc_last[25]) ^ main_crc32_checker_crc_last[31]) ^ main_crc32_checker_crc_data1[0]) ^ main_crc32_checker_crc_data1[6]);
	main_crc32_checker_crc_next[25] <= ((((main_crc32_checker_crc_last[17] ^ main_crc32_checker_crc_last[27]) ^ main_crc32_checker_crc_data1[4]) ^ main_crc32_checker_crc_last[26]) ^ main_crc32_checker_crc_data1[5]);
	main_crc32_checker_crc_next[26] <= ((((((((main_crc32_checker_crc_last[18] ^ main_crc32_checker_crc_last[28]) ^ main_crc32_checker_crc_data1[3]) ^ main_crc32_checker_crc_last[27]) ^ main_crc32_checker_crc_data1[4]) ^ main_crc32_checker_crc_last[24]) ^ main_crc32_checker_crc_last[30]) ^ main_crc32_checker_crc_data1[1]) ^ main_crc32_checker_crc_data1[7]);
	main_crc32_checker_crc_next[27] <= ((((((((main_crc32_checker_crc_last[19] ^ main_crc32_checker_crc_last[29]) ^ main_crc32_checker_crc_data1[2]) ^ main_crc32_checker_crc_last[28]) ^ main_crc32_checker_crc_data1[3]) ^ main_crc32_checker_crc_last[25]) ^ main_crc32_checker_crc_last[31]) ^ main_crc32_checker_crc_data1[0]) ^ main_crc32_checker_crc_data1[6]);
	main_crc32_checker_crc_next[28] <= ((((((main_crc32_checker_crc_last[20] ^ main_crc32_checker_crc_last[30]) ^ main_crc32_checker_crc_data1[1]) ^ main_crc32_checker_crc_last[29]) ^ main_crc32_checker_crc_data1[2]) ^ main_crc32_checker_crc_last[26]) ^ main_crc32_checker_crc_data1[5]);
	main_crc32_checker_crc_next[29] <= ((((((main_crc32_checker_crc_last[21] ^ main_crc32_checker_crc_last[31]) ^ main_crc32_checker_crc_data1[0]) ^ main_crc32_checker_crc_last[30]) ^ main_crc32_checker_crc_data1[1]) ^ main_crc32_checker_crc_last[27]) ^ main_crc32_checker_crc_data1[4]);
	main_crc32_checker_crc_next[30] <= ((((main_crc32_checker_crc_last[22] ^ main_crc32_checker_crc_last[31]) ^ main_crc32_checker_crc_data1[0]) ^ main_crc32_checker_crc_last[28]) ^ main_crc32_checker_crc_data1[3]);
	main_crc32_checker_crc_next[31] <= ((main_crc32_checker_crc_last[23] ^ main_crc32_checker_crc_last[29]) ^ main_crc32_checker_crc_data1[2]);
end
assign main_crc32_checker_syncfifo_syncfifo_din = {main_crc32_checker_syncfifo_fifo_in_last, main_crc32_checker_syncfifo_fifo_in_first, main_crc32_checker_syncfifo_fifo_in_payload_error, main_crc32_checker_syncfifo_fifo_in_payload_last_be, main_crc32_checker_syncfifo_fifo_in_payload_data};
assign {main_crc32_checker_syncfifo_fifo_out_last, main_crc32_checker_syncfifo_fifo_out_first, main_crc32_checker_syncfifo_fifo_out_payload_error, main_crc32_checker_syncfifo_fifo_out_payload_last_be, main_crc32_checker_syncfifo_fifo_out_payload_data} = main_crc32_checker_syncfifo_syncfifo_dout;
assign main_crc32_checker_syncfifo_sink_ready = main_crc32_checker_syncfifo_syncfifo_writable;
assign main_crc32_checker_syncfifo_syncfifo_we = main_crc32_checker_syncfifo_sink_valid;
assign main_crc32_checker_syncfifo_fifo_in_first = main_crc32_checker_syncfifo_sink_first;
assign main_crc32_checker_syncfifo_fifo_in_last = main_crc32_checker_syncfifo_sink_last;
assign main_crc32_checker_syncfifo_fifo_in_payload_data = main_crc32_checker_syncfifo_sink_payload_data;
assign main_crc32_checker_syncfifo_fifo_in_payload_last_be = main_crc32_checker_syncfifo_sink_payload_last_be;
assign main_crc32_checker_syncfifo_fifo_in_payload_error = main_crc32_checker_syncfifo_sink_payload_error;
assign main_crc32_checker_syncfifo_source_valid = main_crc32_checker_syncfifo_syncfifo_readable;
assign main_crc32_checker_syncfifo_source_first = main_crc32_checker_syncfifo_fifo_out_first;
assign main_crc32_checker_syncfifo_source_last = main_crc32_checker_syncfifo_fifo_out_last;
assign main_crc32_checker_syncfifo_source_payload_data = main_crc32_checker_syncfifo_fifo_out_payload_data;
assign main_crc32_checker_syncfifo_source_payload_last_be = main_crc32_checker_syncfifo_fifo_out_payload_last_be;
assign main_crc32_checker_syncfifo_source_payload_error = main_crc32_checker_syncfifo_fifo_out_payload_error;
assign main_crc32_checker_syncfifo_syncfifo_re = main_crc32_checker_syncfifo_source_ready;
always @(*) begin
	main_crc32_checker_syncfifo_wrport_adr <= 3'd0;
	if (main_crc32_checker_syncfifo_replace) begin
		main_crc32_checker_syncfifo_wrport_adr <= (main_crc32_checker_syncfifo_produce - 1'd1);
	end else begin
		main_crc32_checker_syncfifo_wrport_adr <= main_crc32_checker_syncfifo_produce;
	end
end
assign main_crc32_checker_syncfifo_wrport_dat_w = main_crc32_checker_syncfifo_syncfifo_din;
assign main_crc32_checker_syncfifo_wrport_we = (main_crc32_checker_syncfifo_syncfifo_we & (main_crc32_checker_syncfifo_syncfifo_writable | main_crc32_checker_syncfifo_replace));
assign main_crc32_checker_syncfifo_do_read = (main_crc32_checker_syncfifo_syncfifo_readable & main_crc32_checker_syncfifo_syncfifo_re);
assign main_crc32_checker_syncfifo_rdport_adr = main_crc32_checker_syncfifo_consume;
assign main_crc32_checker_syncfifo_syncfifo_dout = main_crc32_checker_syncfifo_rdport_dat_r;
assign main_crc32_checker_syncfifo_syncfifo_writable = (main_crc32_checker_syncfifo_level != 3'd5);
assign main_crc32_checker_syncfifo_syncfifo_readable = (main_crc32_checker_syncfifo_level != 1'd0);
always @(*) begin
	main_crc32_checker_fifo_reset <= 1'd0;
	builder_liteethmaccrc32checker_next_state <= 2'd0;
	main_crc32_checker_crc_ce <= 1'd0;
	main_crc32_checker_crc_reset <= 1'd0;
	builder_liteethmaccrc32checker_next_state <= builder_liteethmaccrc32checker_state;
	case (builder_liteethmaccrc32checker_state)
		1'd1: begin
			if ((main_crc32_checker_sink_sink_valid & main_crc32_checker_sink_sink_ready)) begin
				main_crc32_checker_crc_ce <= 1'd1;
				builder_liteethmaccrc32checker_next_state <= 2'd2;
			end
		end
		2'd2: begin
			if ((main_crc32_checker_sink_sink_valid & main_crc32_checker_sink_sink_ready)) begin
				main_crc32_checker_crc_ce <= 1'd1;
				if (main_crc32_checker_sink_sink_last) begin
					builder_liteethmaccrc32checker_next_state <= 1'd0;
				end
			end
		end
		default: begin
			main_crc32_checker_crc_reset <= 1'd1;
			main_crc32_checker_fifo_reset <= 1'd1;
			builder_liteethmaccrc32checker_next_state <= 1'd1;
		end
	endcase
end
assign main_ps_preamble_error_o = (main_ps_preamble_error_toggle_o ^ main_ps_preamble_error_toggle_o_r);
assign main_ps_crc_error_o = (main_ps_crc_error_toggle_o ^ main_ps_crc_error_toggle_o_r);
assign main_padding_inserter_counter_done = (main_padding_inserter_counter >= 6'd59);
always @(*) begin
	main_padding_inserter_source_payload_error <= 1'd0;
	main_padding_inserter_counter_reset <= 1'd0;
	main_padding_inserter_sink_ready <= 1'd0;
	main_padding_inserter_counter_ce <= 1'd0;
	builder_liteethmacpaddinginserter_next_state <= 1'd0;
	main_padding_inserter_source_valid <= 1'd0;
	main_padding_inserter_source_first <= 1'd0;
	main_padding_inserter_source_last <= 1'd0;
	main_padding_inserter_source_payload_data <= 8'd0;
	main_padding_inserter_source_payload_last_be <= 1'd0;
	builder_liteethmacpaddinginserter_next_state <= builder_liteethmacpaddinginserter_state;
	case (builder_liteethmacpaddinginserter_state)
		1'd1: begin
			main_padding_inserter_source_valid <= 1'd1;
			main_padding_inserter_source_last <= main_padding_inserter_counter_done;
			main_padding_inserter_source_payload_data <= 1'd0;
			if ((main_padding_inserter_source_valid & main_padding_inserter_source_ready)) begin
				main_padding_inserter_counter_ce <= 1'd1;
				if (main_padding_inserter_counter_done) begin
					main_padding_inserter_counter_reset <= 1'd1;
					builder_liteethmacpaddinginserter_next_state <= 1'd0;
				end
			end
		end
		default: begin
			main_padding_inserter_source_valid <= main_padding_inserter_sink_valid;
			main_padding_inserter_sink_ready <= main_padding_inserter_source_ready;
			main_padding_inserter_source_first <= main_padding_inserter_sink_first;
			main_padding_inserter_source_last <= main_padding_inserter_sink_last;
			main_padding_inserter_source_payload_data <= main_padding_inserter_sink_payload_data;
			main_padding_inserter_source_payload_last_be <= main_padding_inserter_sink_payload_last_be;
			main_padding_inserter_source_payload_error <= main_padding_inserter_sink_payload_error;
			if ((main_padding_inserter_source_valid & main_padding_inserter_source_ready)) begin
				main_padding_inserter_counter_ce <= 1'd1;
				if (main_padding_inserter_sink_last) begin
					if ((~main_padding_inserter_counter_done)) begin
						main_padding_inserter_source_last <= 1'd0;
						builder_liteethmacpaddinginserter_next_state <= 1'd1;
					end else begin
						main_padding_inserter_counter_reset <= 1'd1;
					end
				end
			end
		end
	endcase
end
assign main_padding_checker_source_valid = main_padding_checker_sink_valid;
assign main_padding_checker_sink_ready = main_padding_checker_source_ready;
assign main_padding_checker_source_first = main_padding_checker_sink_first;
assign main_padding_checker_source_last = main_padding_checker_sink_last;
assign main_padding_checker_source_payload_data = main_padding_checker_sink_payload_data;
assign main_padding_checker_source_payload_last_be = main_padding_checker_sink_payload_last_be;
assign main_padding_checker_source_payload_error = main_padding_checker_sink_payload_error;
assign main_tx_last_be_source_valid = (main_tx_last_be_sink_valid & main_tx_last_be_ongoing);
assign main_tx_last_be_source_last = main_tx_last_be_sink_payload_last_be;
assign main_tx_last_be_source_payload_data = main_tx_last_be_sink_payload_data;
assign main_tx_last_be_sink_ready = main_tx_last_be_source_ready;
assign main_rx_last_be_source_valid = main_rx_last_be_sink_valid;
assign main_rx_last_be_sink_ready = main_rx_last_be_source_ready;
assign main_rx_last_be_source_first = main_rx_last_be_sink_first;
assign main_rx_last_be_source_last = main_rx_last_be_sink_last;
assign main_rx_last_be_source_payload_data = main_rx_last_be_sink_payload_data;
assign main_rx_last_be_source_payload_error = main_rx_last_be_sink_payload_error;
always @(*) begin
	main_rx_last_be_source_payload_last_be <= 1'd0;
	main_rx_last_be_source_payload_last_be <= main_rx_last_be_sink_payload_last_be;
	main_rx_last_be_source_payload_last_be <= main_rx_last_be_sink_last;
end
assign main_tx_converter_converter_sink_valid = main_tx_converter_sink_valid;
assign main_tx_converter_converter_sink_first = main_tx_converter_sink_first;
assign main_tx_converter_converter_sink_last = main_tx_converter_sink_last;
assign main_tx_converter_sink_ready = main_tx_converter_converter_sink_ready;
always @(*) begin
	main_tx_converter_converter_sink_payload_data <= 40'd0;
	main_tx_converter_converter_sink_payload_data[7:0] <= main_tx_converter_sink_payload_data[7:0];
	main_tx_converter_converter_sink_payload_data[8] <= main_tx_converter_sink_payload_last_be[0];
	main_tx_converter_converter_sink_payload_data[9] <= main_tx_converter_sink_payload_error[0];
	main_tx_converter_converter_sink_payload_data[17:10] <= main_tx_converter_sink_payload_data[15:8];
	main_tx_converter_converter_sink_payload_data[18] <= main_tx_converter_sink_payload_last_be[1];
	main_tx_converter_converter_sink_payload_data[19] <= main_tx_converter_sink_payload_error[1];
	main_tx_converter_converter_sink_payload_data[27:20] <= main_tx_converter_sink_payload_data[23:16];
	main_tx_converter_converter_sink_payload_data[28] <= main_tx_converter_sink_payload_last_be[2];
	main_tx_converter_converter_sink_payload_data[29] <= main_tx_converter_sink_payload_error[2];
	main_tx_converter_converter_sink_payload_data[37:30] <= main_tx_converter_sink_payload_data[31:24];
	main_tx_converter_converter_sink_payload_data[38] <= main_tx_converter_sink_payload_last_be[3];
	main_tx_converter_converter_sink_payload_data[39] <= main_tx_converter_sink_payload_error[3];
end
assign main_tx_converter_source_valid = main_tx_converter_source_source_valid;
assign main_tx_converter_source_first = main_tx_converter_source_source_first;
assign main_tx_converter_source_last = main_tx_converter_source_source_last;
assign main_tx_converter_source_source_ready = main_tx_converter_source_ready;
assign {main_tx_converter_source_payload_error, main_tx_converter_source_payload_last_be, main_tx_converter_source_payload_data} = main_tx_converter_source_source_payload_data;
assign main_tx_converter_source_source_valid = main_tx_converter_converter_source_valid;
assign main_tx_converter_converter_source_ready = main_tx_converter_source_source_ready;
assign main_tx_converter_source_source_first = main_tx_converter_converter_source_first;
assign main_tx_converter_source_source_last = main_tx_converter_converter_source_last;
assign main_tx_converter_source_source_payload_data = main_tx_converter_converter_source_payload_data;
assign main_tx_converter_converter_first = (main_tx_converter_converter_mux == 1'd0);
assign main_tx_converter_converter_last = (main_tx_converter_converter_mux == 2'd3);
assign main_tx_converter_converter_source_valid = main_tx_converter_converter_sink_valid;
assign main_tx_converter_converter_source_first = (main_tx_converter_converter_sink_first & main_tx_converter_converter_first);
assign main_tx_converter_converter_source_last = (main_tx_converter_converter_sink_last & main_tx_converter_converter_last);
assign main_tx_converter_converter_sink_ready = (main_tx_converter_converter_last & main_tx_converter_converter_source_ready);
always @(*) begin
	main_tx_converter_converter_source_payload_data <= 10'd0;
	case (main_tx_converter_converter_mux)
		1'd0: begin
			main_tx_converter_converter_source_payload_data <= main_tx_converter_converter_sink_payload_data[9:0];
		end
		1'd1: begin
			main_tx_converter_converter_source_payload_data <= main_tx_converter_converter_sink_payload_data[19:10];
		end
		2'd2: begin
			main_tx_converter_converter_source_payload_data <= main_tx_converter_converter_sink_payload_data[29:20];
		end
		default: begin
			main_tx_converter_converter_source_payload_data <= main_tx_converter_converter_sink_payload_data[39:30];
		end
	endcase
end
assign main_tx_converter_converter_source_payload_valid_token_count = main_tx_converter_converter_last;
assign main_rx_converter_converter_sink_valid = main_rx_converter_sink_valid;
assign main_rx_converter_converter_sink_first = main_rx_converter_sink_first;
assign main_rx_converter_converter_sink_last = main_rx_converter_sink_last;
assign main_rx_converter_sink_ready = main_rx_converter_converter_sink_ready;
assign main_rx_converter_converter_sink_payload_data = {main_rx_converter_sink_payload_error, main_rx_converter_sink_payload_last_be, main_rx_converter_sink_payload_data};
assign main_rx_converter_source_valid = main_rx_converter_source_source_valid;
assign main_rx_converter_source_first = main_rx_converter_source_source_first;
assign main_rx_converter_source_last = main_rx_converter_source_source_last;
assign main_rx_converter_source_source_ready = main_rx_converter_source_ready;
always @(*) begin
	main_rx_converter_source_payload_data <= 32'd0;
	main_rx_converter_source_payload_data[7:0] <= main_rx_converter_source_source_payload_data[7:0];
	main_rx_converter_source_payload_data[15:8] <= main_rx_converter_source_source_payload_data[17:10];
	main_rx_converter_source_payload_data[23:16] <= main_rx_converter_source_source_payload_data[27:20];
	main_rx_converter_source_payload_data[31:24] <= main_rx_converter_source_source_payload_data[37:30];
end
always @(*) begin
	main_rx_converter_source_payload_last_be <= 4'd0;
	main_rx_converter_source_payload_last_be[0] <= main_rx_converter_source_source_payload_data[8];
	main_rx_converter_source_payload_last_be[1] <= main_rx_converter_source_source_payload_data[18];
	main_rx_converter_source_payload_last_be[2] <= main_rx_converter_source_source_payload_data[28];
	main_rx_converter_source_payload_last_be[3] <= main_rx_converter_source_source_payload_data[38];
end
always @(*) begin
	main_rx_converter_source_payload_error <= 4'd0;
	main_rx_converter_source_payload_error[0] <= main_rx_converter_source_source_payload_data[9];
	main_rx_converter_source_payload_error[1] <= main_rx_converter_source_source_payload_data[19];
	main_rx_converter_source_payload_error[2] <= main_rx_converter_source_source_payload_data[29];
	main_rx_converter_source_payload_error[3] <= main_rx_converter_source_source_payload_data[39];
end
assign main_rx_converter_source_source_valid = main_rx_converter_converter_source_valid;
assign main_rx_converter_converter_source_ready = main_rx_converter_source_source_ready;
assign main_rx_converter_source_source_first = main_rx_converter_converter_source_first;
assign main_rx_converter_source_source_last = main_rx_converter_converter_source_last;
assign main_rx_converter_source_source_payload_data = main_rx_converter_converter_source_payload_data;
assign main_rx_converter_converter_sink_ready = ((~main_rx_converter_converter_strobe_all) | main_rx_converter_converter_source_ready);
assign main_rx_converter_converter_source_valid = main_rx_converter_converter_strobe_all;
assign main_rx_converter_converter_load_part = (main_rx_converter_converter_sink_valid & main_rx_converter_converter_sink_ready);
assign main_tx_cdc_asyncfifo_din = {main_tx_cdc_fifo_in_last, main_tx_cdc_fifo_in_first, main_tx_cdc_fifo_in_payload_error, main_tx_cdc_fifo_in_payload_last_be, main_tx_cdc_fifo_in_payload_data};
assign {main_tx_cdc_fifo_out_last, main_tx_cdc_fifo_out_first, main_tx_cdc_fifo_out_payload_error, main_tx_cdc_fifo_out_payload_last_be, main_tx_cdc_fifo_out_payload_data} = main_tx_cdc_asyncfifo_dout;
assign main_tx_cdc_sink_ready = main_tx_cdc_asyncfifo_writable;
assign main_tx_cdc_asyncfifo_we = main_tx_cdc_sink_valid;
assign main_tx_cdc_fifo_in_first = main_tx_cdc_sink_first;
assign main_tx_cdc_fifo_in_last = main_tx_cdc_sink_last;
assign main_tx_cdc_fifo_in_payload_data = main_tx_cdc_sink_payload_data;
assign main_tx_cdc_fifo_in_payload_last_be = main_tx_cdc_sink_payload_last_be;
assign main_tx_cdc_fifo_in_payload_error = main_tx_cdc_sink_payload_error;
assign main_tx_cdc_source_valid = main_tx_cdc_asyncfifo_readable;
assign main_tx_cdc_source_first = main_tx_cdc_fifo_out_first;
assign main_tx_cdc_source_last = main_tx_cdc_fifo_out_last;
assign main_tx_cdc_source_payload_data = main_tx_cdc_fifo_out_payload_data;
assign main_tx_cdc_source_payload_last_be = main_tx_cdc_fifo_out_payload_last_be;
assign main_tx_cdc_source_payload_error = main_tx_cdc_fifo_out_payload_error;
assign main_tx_cdc_asyncfifo_re = main_tx_cdc_source_ready;
assign main_tx_cdc_graycounter0_ce = (main_tx_cdc_asyncfifo_writable & main_tx_cdc_asyncfifo_we);
assign main_tx_cdc_graycounter1_ce = (main_tx_cdc_asyncfifo_readable & main_tx_cdc_asyncfifo_re);
assign main_tx_cdc_asyncfifo_writable = (((main_tx_cdc_graycounter0_q[6] == main_tx_cdc_consume_wdomain[6]) | (main_tx_cdc_graycounter0_q[5] == main_tx_cdc_consume_wdomain[5])) | (main_tx_cdc_graycounter0_q[4:0] != main_tx_cdc_consume_wdomain[4:0]));
assign main_tx_cdc_asyncfifo_readable = (main_tx_cdc_graycounter1_q != main_tx_cdc_produce_rdomain);
assign main_tx_cdc_wrport_adr = main_tx_cdc_graycounter0_q_binary[5:0];
assign main_tx_cdc_wrport_dat_w = main_tx_cdc_asyncfifo_din;
assign main_tx_cdc_wrport_we = main_tx_cdc_graycounter0_ce;
assign main_tx_cdc_rdport_adr = main_tx_cdc_graycounter1_q_next_binary[5:0];
assign main_tx_cdc_asyncfifo_dout = main_tx_cdc_rdport_dat_r;
always @(*) begin
	main_tx_cdc_graycounter0_q_next_binary <= 7'd0;
	if (main_tx_cdc_graycounter0_ce) begin
		main_tx_cdc_graycounter0_q_next_binary <= (main_tx_cdc_graycounter0_q_binary + 1'd1);
	end else begin
		main_tx_cdc_graycounter0_q_next_binary <= main_tx_cdc_graycounter0_q_binary;
	end
end
assign main_tx_cdc_graycounter0_q_next = (main_tx_cdc_graycounter0_q_next_binary ^ main_tx_cdc_graycounter0_q_next_binary[6:1]);
always @(*) begin
	main_tx_cdc_graycounter1_q_next_binary <= 7'd0;
	if (main_tx_cdc_graycounter1_ce) begin
		main_tx_cdc_graycounter1_q_next_binary <= (main_tx_cdc_graycounter1_q_binary + 1'd1);
	end else begin
		main_tx_cdc_graycounter1_q_next_binary <= main_tx_cdc_graycounter1_q_binary;
	end
end
assign main_tx_cdc_graycounter1_q_next = (main_tx_cdc_graycounter1_q_next_binary ^ main_tx_cdc_graycounter1_q_next_binary[6:1]);
assign main_rx_cdc_asyncfifo_din = {main_rx_cdc_fifo_in_last, main_rx_cdc_fifo_in_first, main_rx_cdc_fifo_in_payload_error, main_rx_cdc_fifo_in_payload_last_be, main_rx_cdc_fifo_in_payload_data};
assign {main_rx_cdc_fifo_out_last, main_rx_cdc_fifo_out_first, main_rx_cdc_fifo_out_payload_error, main_rx_cdc_fifo_out_payload_last_be, main_rx_cdc_fifo_out_payload_data} = main_rx_cdc_asyncfifo_dout;
assign main_rx_cdc_sink_ready = main_rx_cdc_asyncfifo_writable;
assign main_rx_cdc_asyncfifo_we = main_rx_cdc_sink_valid;
assign main_rx_cdc_fifo_in_first = main_rx_cdc_sink_first;
assign main_rx_cdc_fifo_in_last = main_rx_cdc_sink_last;
assign main_rx_cdc_fifo_in_payload_data = main_rx_cdc_sink_payload_data;
assign main_rx_cdc_fifo_in_payload_last_be = main_rx_cdc_sink_payload_last_be;
assign main_rx_cdc_fifo_in_payload_error = main_rx_cdc_sink_payload_error;
assign main_rx_cdc_source_valid = main_rx_cdc_asyncfifo_readable;
assign main_rx_cdc_source_first = main_rx_cdc_fifo_out_first;
assign main_rx_cdc_source_last = main_rx_cdc_fifo_out_last;
assign main_rx_cdc_source_payload_data = main_rx_cdc_fifo_out_payload_data;
assign main_rx_cdc_source_payload_last_be = main_rx_cdc_fifo_out_payload_last_be;
assign main_rx_cdc_source_payload_error = main_rx_cdc_fifo_out_payload_error;
assign main_rx_cdc_asyncfifo_re = main_rx_cdc_source_ready;
assign main_rx_cdc_graycounter0_ce = (main_rx_cdc_asyncfifo_writable & main_rx_cdc_asyncfifo_we);
assign main_rx_cdc_graycounter1_ce = (main_rx_cdc_asyncfifo_readable & main_rx_cdc_asyncfifo_re);
assign main_rx_cdc_asyncfifo_writable = (((main_rx_cdc_graycounter0_q[6] == main_rx_cdc_consume_wdomain[6]) | (main_rx_cdc_graycounter0_q[5] == main_rx_cdc_consume_wdomain[5])) | (main_rx_cdc_graycounter0_q[4:0] != main_rx_cdc_consume_wdomain[4:0]));
assign main_rx_cdc_asyncfifo_readable = (main_rx_cdc_graycounter1_q != main_rx_cdc_produce_rdomain);
assign main_rx_cdc_wrport_adr = main_rx_cdc_graycounter0_q_binary[5:0];
assign main_rx_cdc_wrport_dat_w = main_rx_cdc_asyncfifo_din;
assign main_rx_cdc_wrport_we = main_rx_cdc_graycounter0_ce;
assign main_rx_cdc_rdport_adr = main_rx_cdc_graycounter1_q_next_binary[5:0];
assign main_rx_cdc_asyncfifo_dout = main_rx_cdc_rdport_dat_r;
always @(*) begin
	main_rx_cdc_graycounter0_q_next_binary <= 7'd0;
	if (main_rx_cdc_graycounter0_ce) begin
		main_rx_cdc_graycounter0_q_next_binary <= (main_rx_cdc_graycounter0_q_binary + 1'd1);
	end else begin
		main_rx_cdc_graycounter0_q_next_binary <= main_rx_cdc_graycounter0_q_binary;
	end
end
assign main_rx_cdc_graycounter0_q_next = (main_rx_cdc_graycounter0_q_next_binary ^ main_rx_cdc_graycounter0_q_next_binary[6:1]);
always @(*) begin
	main_rx_cdc_graycounter1_q_next_binary <= 7'd0;
	if (main_rx_cdc_graycounter1_ce) begin
		main_rx_cdc_graycounter1_q_next_binary <= (main_rx_cdc_graycounter1_q_binary + 1'd1);
	end else begin
		main_rx_cdc_graycounter1_q_next_binary <= main_rx_cdc_graycounter1_q_binary;
	end
end
assign main_rx_cdc_graycounter1_q_next = (main_rx_cdc_graycounter1_q_next_binary ^ main_rx_cdc_graycounter1_q_next_binary[6:1]);
assign main_tx_converter_sink_valid = main_tx_cdc_source_valid;
assign main_tx_cdc_source_ready = main_tx_converter_sink_ready;
assign main_tx_converter_sink_first = main_tx_cdc_source_first;
assign main_tx_converter_sink_last = main_tx_cdc_source_last;
assign main_tx_converter_sink_payload_data = main_tx_cdc_source_payload_data;
assign main_tx_converter_sink_payload_last_be = main_tx_cdc_source_payload_last_be;
assign main_tx_converter_sink_payload_error = main_tx_cdc_source_payload_error;
assign main_tx_last_be_sink_valid = main_tx_converter_source_valid;
assign main_tx_converter_source_ready = main_tx_last_be_sink_ready;
assign main_tx_last_be_sink_first = main_tx_converter_source_first;
assign main_tx_last_be_sink_last = main_tx_converter_source_last;
assign main_tx_last_be_sink_payload_data = main_tx_converter_source_payload_data;
assign main_tx_last_be_sink_payload_last_be = main_tx_converter_source_payload_last_be;
assign main_tx_last_be_sink_payload_error = main_tx_converter_source_payload_error;
assign main_padding_inserter_sink_valid = main_tx_last_be_source_valid;
assign main_tx_last_be_source_ready = main_padding_inserter_sink_ready;
assign main_padding_inserter_sink_first = main_tx_last_be_source_first;
assign main_padding_inserter_sink_last = main_tx_last_be_source_last;
assign main_padding_inserter_sink_payload_data = main_tx_last_be_source_payload_data;
assign main_padding_inserter_sink_payload_last_be = main_tx_last_be_source_payload_last_be;
assign main_padding_inserter_sink_payload_error = main_tx_last_be_source_payload_error;
assign main_crc32_inserter_sink_valid = main_padding_inserter_source_valid;
assign main_padding_inserter_source_ready = main_crc32_inserter_sink_ready;
assign main_crc32_inserter_sink_first = main_padding_inserter_source_first;
assign main_crc32_inserter_sink_last = main_padding_inserter_source_last;
assign main_crc32_inserter_sink_payload_data = main_padding_inserter_source_payload_data;
assign main_crc32_inserter_sink_payload_last_be = main_padding_inserter_source_payload_last_be;
assign main_crc32_inserter_sink_payload_error = main_padding_inserter_source_payload_error;
assign main_preamble_inserter_sink_valid = main_crc32_inserter_source_valid;
assign main_crc32_inserter_source_ready = main_preamble_inserter_sink_ready;
assign main_preamble_inserter_sink_first = main_crc32_inserter_source_first;
assign main_preamble_inserter_sink_last = main_crc32_inserter_source_last;
assign main_preamble_inserter_sink_payload_data = main_crc32_inserter_source_payload_data;
assign main_preamble_inserter_sink_payload_last_be = main_crc32_inserter_source_payload_last_be;
assign main_preamble_inserter_sink_payload_error = main_crc32_inserter_source_payload_error;
assign main_tx_gap_inserter_sink_valid = main_preamble_inserter_source_valid;
assign main_preamble_inserter_source_ready = main_tx_gap_inserter_sink_ready;
assign main_tx_gap_inserter_sink_first = main_preamble_inserter_source_first;
assign main_tx_gap_inserter_sink_last = main_preamble_inserter_source_last;
assign main_tx_gap_inserter_sink_payload_data = main_preamble_inserter_source_payload_data;
assign main_tx_gap_inserter_sink_payload_last_be = main_preamble_inserter_source_payload_last_be;
assign main_tx_gap_inserter_sink_payload_error = main_preamble_inserter_source_payload_error;
assign main_ethphy_liteethphymiitx_sink_sink_valid = main_tx_gap_inserter_source_valid;
assign main_tx_gap_inserter_source_ready = main_ethphy_liteethphymiitx_sink_sink_ready;
assign main_ethphy_liteethphymiitx_sink_sink_first = main_tx_gap_inserter_source_first;
assign main_ethphy_liteethphymiitx_sink_sink_last = main_tx_gap_inserter_source_last;
assign main_ethphy_liteethphymiitx_sink_sink_payload_data = main_tx_gap_inserter_source_payload_data;
assign main_ethphy_liteethphymiitx_sink_sink_payload_last_be = main_tx_gap_inserter_source_payload_last_be;
assign main_ethphy_liteethphymiitx_sink_sink_payload_error = main_tx_gap_inserter_source_payload_error;
assign main_preamble_checker_sink_valid = main_ethphy_liteethphymiirx_source_source_valid;
assign main_ethphy_liteethphymiirx_source_source_ready = main_preamble_checker_sink_ready;
assign main_preamble_checker_sink_first = main_ethphy_liteethphymiirx_source_source_first;
assign main_preamble_checker_sink_last = main_ethphy_liteethphymiirx_source_source_last;
assign main_preamble_checker_sink_payload_data = main_ethphy_liteethphymiirx_source_source_payload_data;
assign main_preamble_checker_sink_payload_last_be = main_ethphy_liteethphymiirx_source_source_payload_last_be;
assign main_preamble_checker_sink_payload_error = main_ethphy_liteethphymiirx_source_source_payload_error;
assign main_crc32_checker_sink_sink_valid = main_preamble_checker_source_valid;
assign main_preamble_checker_source_ready = main_crc32_checker_sink_sink_ready;
assign main_crc32_checker_sink_sink_first = main_preamble_checker_source_first;
assign main_crc32_checker_sink_sink_last = main_preamble_checker_source_last;
assign main_crc32_checker_sink_sink_payload_data = main_preamble_checker_source_payload_data;
assign main_crc32_checker_sink_sink_payload_last_be = main_preamble_checker_source_payload_last_be;
assign main_crc32_checker_sink_sink_payload_error = main_preamble_checker_source_payload_error;
assign main_padding_checker_sink_valid = main_crc32_checker_source_source_valid;
assign main_crc32_checker_source_source_ready = main_padding_checker_sink_ready;
assign main_padding_checker_sink_first = main_crc32_checker_source_source_first;
assign main_padding_checker_sink_last = main_crc32_checker_source_source_last;
assign main_padding_checker_sink_payload_data = main_crc32_checker_source_source_payload_data;
assign main_padding_checker_sink_payload_last_be = main_crc32_checker_source_source_payload_last_be;
assign main_padding_checker_sink_payload_error = main_crc32_checker_source_source_payload_error;
assign main_rx_last_be_sink_valid = main_padding_checker_source_valid;
assign main_padding_checker_source_ready = main_rx_last_be_sink_ready;
assign main_rx_last_be_sink_first = main_padding_checker_source_first;
assign main_rx_last_be_sink_last = main_padding_checker_source_last;
assign main_rx_last_be_sink_payload_data = main_padding_checker_source_payload_data;
assign main_rx_last_be_sink_payload_last_be = main_padding_checker_source_payload_last_be;
assign main_rx_last_be_sink_payload_error = main_padding_checker_source_payload_error;
assign main_rx_converter_sink_valid = main_rx_last_be_source_valid;
assign main_rx_last_be_source_ready = main_rx_converter_sink_ready;
assign main_rx_converter_sink_first = main_rx_last_be_source_first;
assign main_rx_converter_sink_last = main_rx_last_be_source_last;
assign main_rx_converter_sink_payload_data = main_rx_last_be_source_payload_data;
assign main_rx_converter_sink_payload_last_be = main_rx_last_be_source_payload_last_be;
assign main_rx_converter_sink_payload_error = main_rx_last_be_source_payload_error;
assign main_rx_cdc_sink_valid = main_rx_converter_source_valid;
assign main_rx_converter_source_ready = main_rx_cdc_sink_ready;
assign main_rx_cdc_sink_first = main_rx_converter_source_first;
assign main_rx_cdc_sink_last = main_rx_converter_source_last;
assign main_rx_cdc_sink_payload_data = main_rx_converter_source_payload_data;
assign main_rx_cdc_sink_payload_last_be = main_rx_converter_source_payload_last_be;
assign main_rx_cdc_sink_payload_error = main_rx_converter_source_payload_error;
assign main_writer_sink_sink_valid = main_sink_valid;
assign main_sink_ready = main_writer_sink_sink_ready;
assign main_writer_sink_sink_first = main_sink_first;
assign main_writer_sink_sink_last = main_sink_last;
assign main_writer_sink_sink_payload_data = main_sink_payload_data;
assign main_writer_sink_sink_payload_last_be = main_sink_payload_last_be;
assign main_writer_sink_sink_payload_error = main_sink_payload_error;
assign main_source_valid = main_reader_source_source_valid;
assign main_reader_source_source_ready = main_source_ready;
assign main_source_first = main_reader_source_source_first;
assign main_source_last = main_reader_source_source_last;
assign main_source_payload_data = main_reader_source_source_payload_data;
assign main_source_payload_last_be = main_reader_source_source_payload_last_be;
assign main_source_payload_error = main_reader_source_source_payload_error;
always @(*) begin
	main_writer_inc <= 3'd0;
	case (main_writer_sink_sink_payload_last_be)
		1'd1: begin
			main_writer_inc <= 1'd1;
		end
		2'd2: begin
			main_writer_inc <= 2'd2;
		end
		3'd4: begin
			main_writer_inc <= 2'd3;
		end
		default: begin
			main_writer_inc <= 3'd4;
		end
	endcase
end
assign main_writer_fifo_sink_payload_slot = main_writer_slot;
assign main_writer_fifo_sink_payload_length = main_writer_counter;
assign main_writer_fifo_source_ready = main_writer_available_clear;
assign main_writer_available_trigger = main_writer_fifo_source_valid;
assign main_writer_slot_status = main_writer_fifo_source_payload_slot;
assign main_writer_length_status = main_writer_fifo_source_payload_length;
always @(*) begin
	main_writer_memory0_we <= 1'd0;
	main_writer_memory0_dat_w <= 32'd0;
	main_writer_memory1_adr <= 9'd0;
	main_writer_memory1_we <= 1'd0;
	main_writer_memory0_adr <= 9'd0;
	main_writer_memory1_dat_w <= 32'd0;
	case (main_writer_slot)
		1'd0: begin
			main_writer_memory0_adr <= main_writer_counter[31:2];
			main_writer_memory0_dat_w <= main_writer_sink_sink_payload_data;
			if ((main_writer_sink_sink_valid & main_writer_ongoing)) begin
				main_writer_memory0_we <= 4'd15;
			end
		end
		1'd1: begin
			main_writer_memory1_adr <= main_writer_counter[31:2];
			main_writer_memory1_dat_w <= main_writer_sink_sink_payload_data;
			if ((main_writer_sink_sink_valid & main_writer_ongoing)) begin
				main_writer_memory1_we <= 4'd15;
			end
		end
	endcase
end
assign main_writer_status_w = main_writer_available_status;
always @(*) begin
	main_writer_available_clear <= 1'd0;
	if ((main_writer_pending_re & main_writer_pending_r)) begin
		main_writer_available_clear <= 1'd1;
	end
end
assign main_writer_pending_w = main_writer_available_pending;
assign main_writer_irq = (main_writer_pending_w & main_writer_storage);
assign main_writer_available_status = main_writer_available_trigger;
assign main_writer_available_pending = main_writer_available_trigger;
assign main_writer_fifo_syncfifo_din = {main_writer_fifo_fifo_in_last, main_writer_fifo_fifo_in_first, main_writer_fifo_fifo_in_payload_length, main_writer_fifo_fifo_in_payload_slot};
assign {main_writer_fifo_fifo_out_last, main_writer_fifo_fifo_out_first, main_writer_fifo_fifo_out_payload_length, main_writer_fifo_fifo_out_payload_slot} = main_writer_fifo_syncfifo_dout;
assign main_writer_fifo_sink_ready = main_writer_fifo_syncfifo_writable;
assign main_writer_fifo_syncfifo_we = main_writer_fifo_sink_valid;
assign main_writer_fifo_fifo_in_first = main_writer_fifo_sink_first;
assign main_writer_fifo_fifo_in_last = main_writer_fifo_sink_last;
assign main_writer_fifo_fifo_in_payload_slot = main_writer_fifo_sink_payload_slot;
assign main_writer_fifo_fifo_in_payload_length = main_writer_fifo_sink_payload_length;
assign main_writer_fifo_source_valid = main_writer_fifo_syncfifo_readable;
assign main_writer_fifo_source_first = main_writer_fifo_fifo_out_first;
assign main_writer_fifo_source_last = main_writer_fifo_fifo_out_last;
assign main_writer_fifo_source_payload_slot = main_writer_fifo_fifo_out_payload_slot;
assign main_writer_fifo_source_payload_length = main_writer_fifo_fifo_out_payload_length;
assign main_writer_fifo_syncfifo_re = main_writer_fifo_source_ready;
always @(*) begin
	main_writer_fifo_wrport_adr <= 1'd0;
	if (main_writer_fifo_replace) begin
		main_writer_fifo_wrport_adr <= (main_writer_fifo_produce - 1'd1);
	end else begin
		main_writer_fifo_wrport_adr <= main_writer_fifo_produce;
	end
end
assign main_writer_fifo_wrport_dat_w = main_writer_fifo_syncfifo_din;
assign main_writer_fifo_wrport_we = (main_writer_fifo_syncfifo_we & (main_writer_fifo_syncfifo_writable | main_writer_fifo_replace));
assign main_writer_fifo_do_read = (main_writer_fifo_syncfifo_readable & main_writer_fifo_syncfifo_re);
assign main_writer_fifo_rdport_adr = main_writer_fifo_consume;
assign main_writer_fifo_syncfifo_dout = main_writer_fifo_rdport_dat_r;
assign main_writer_fifo_syncfifo_writable = (main_writer_fifo_level != 2'd2);
assign main_writer_fifo_syncfifo_readable = (main_writer_fifo_level != 1'd0);
always @(*) begin
	builder_liteethmacsramwriter_next_state <= 3'd0;
	main_writer_errors_status_next_value <= 32'd0;
	main_writer_counter_reset <= 1'd0;
	main_writer_errors_status_next_value_ce <= 1'd0;
	main_writer_counter_ce <= 1'd0;
	main_writer_slot_ce <= 1'd0;
	main_writer_ongoing <= 1'd0;
	main_writer_fifo_sink_valid <= 1'd0;
	builder_liteethmacsramwriter_next_state <= builder_liteethmacsramwriter_state;
	case (builder_liteethmacsramwriter_state)
		1'd1: begin
			if (main_writer_sink_sink_valid) begin
				if ((main_writer_counter == 11'd1530)) begin
					builder_liteethmacsramwriter_next_state <= 2'd3;
				end else begin
					main_writer_counter_ce <= 1'd1;
					main_writer_ongoing <= 1'd1;
				end
				if (main_writer_sink_sink_last) begin
					if (((main_writer_sink_sink_payload_error & main_writer_sink_sink_payload_last_be) != 1'd0)) begin
						builder_liteethmacsramwriter_next_state <= 2'd2;
					end else begin
						builder_liteethmacsramwriter_next_state <= 3'd4;
					end
				end
			end
		end
		2'd2: begin
			main_writer_counter_reset <= 1'd1;
			builder_liteethmacsramwriter_next_state <= 1'd0;
		end
		2'd3: begin
			if ((main_writer_sink_sink_valid & main_writer_sink_sink_last)) begin
				builder_liteethmacsramwriter_next_state <= 3'd4;
			end
		end
		3'd4: begin
			main_writer_counter_reset <= 1'd1;
			main_writer_slot_ce <= 1'd1;
			main_writer_fifo_sink_valid <= 1'd1;
			builder_liteethmacsramwriter_next_state <= 1'd0;
		end
		default: begin
			if (main_writer_sink_sink_valid) begin
				if (main_writer_fifo_sink_ready) begin
					main_writer_ongoing <= 1'd1;
					main_writer_counter_ce <= 1'd1;
					builder_liteethmacsramwriter_next_state <= 1'd1;
				end else begin
					main_writer_errors_status_next_value <= (main_writer_errors_status + 1'd1);
					main_writer_errors_status_next_value_ce <= 1'd1;
					builder_liteethmacsramwriter_next_state <= 2'd3;
				end
			end
		end
	endcase
end
assign main_reader_fifo_sink_valid = main_reader_start_re;
assign main_reader_fifo_sink_payload_slot = main_reader_slot_storage;
assign main_reader_fifo_sink_payload_length = main_reader_length_storage;
assign main_reader_ready_status = main_reader_fifo_sink_ready;
assign main_reader_level_status = main_reader_fifo_level;
always @(*) begin
	main_reader_source_source_payload_last_be <= 4'd0;
	if (main_reader_last) begin
		case (main_reader_fifo_source_payload_length[1:0])
			1'd0: begin
				main_reader_source_source_payload_last_be <= 4'd8;
			end
			1'd1: begin
				main_reader_source_source_payload_last_be <= 1'd1;
			end
			2'd2: begin
				main_reader_source_source_payload_last_be <= 2'd2;
			end
			2'd3: begin
				main_reader_source_source_payload_last_be <= 3'd4;
			end
		endcase
	end
end
assign main_reader_last = ((main_reader_counter + 3'd4) >= main_reader_fifo_source_payload_length);
assign main_reader_memory0_adr = main_reader_counter[10:2];
assign main_reader_memory1_adr = main_reader_counter[10:2];
always @(*) begin
	main_reader_source_source_payload_data <= 32'd0;
	case (main_reader_fifo_source_payload_slot)
		1'd0: begin
			main_reader_source_source_payload_data <= main_reader_memory0_dat_r;
		end
		1'd1: begin
			main_reader_source_source_payload_data <= main_reader_memory1_dat_r;
		end
	endcase
end
assign main_reader_eventmanager_status_w = main_reader_done_status;
always @(*) begin
	main_reader_done_clear <= 1'd0;
	if ((main_reader_eventmanager_pending_re & main_reader_eventmanager_pending_r)) begin
		main_reader_done_clear <= 1'd1;
	end
end
assign main_reader_eventmanager_pending_w = main_reader_done_pending;
assign main_reader_irq = (main_reader_eventmanager_pending_w & main_reader_eventmanager_storage);
assign main_reader_done_status = 1'd0;
assign main_reader_fifo_syncfifo_din = {main_reader_fifo_fifo_in_last, main_reader_fifo_fifo_in_first, main_reader_fifo_fifo_in_payload_length, main_reader_fifo_fifo_in_payload_slot};
assign {main_reader_fifo_fifo_out_last, main_reader_fifo_fifo_out_first, main_reader_fifo_fifo_out_payload_length, main_reader_fifo_fifo_out_payload_slot} = main_reader_fifo_syncfifo_dout;
assign main_reader_fifo_sink_ready = main_reader_fifo_syncfifo_writable;
assign main_reader_fifo_syncfifo_we = main_reader_fifo_sink_valid;
assign main_reader_fifo_fifo_in_first = main_reader_fifo_sink_first;
assign main_reader_fifo_fifo_in_last = main_reader_fifo_sink_last;
assign main_reader_fifo_fifo_in_payload_slot = main_reader_fifo_sink_payload_slot;
assign main_reader_fifo_fifo_in_payload_length = main_reader_fifo_sink_payload_length;
assign main_reader_fifo_source_valid = main_reader_fifo_syncfifo_readable;
assign main_reader_fifo_source_first = main_reader_fifo_fifo_out_first;
assign main_reader_fifo_source_last = main_reader_fifo_fifo_out_last;
assign main_reader_fifo_source_payload_slot = main_reader_fifo_fifo_out_payload_slot;
assign main_reader_fifo_source_payload_length = main_reader_fifo_fifo_out_payload_length;
assign main_reader_fifo_syncfifo_re = main_reader_fifo_source_ready;
always @(*) begin
	main_reader_fifo_wrport_adr <= 1'd0;
	if (main_reader_fifo_replace) begin
		main_reader_fifo_wrport_adr <= (main_reader_fifo_produce - 1'd1);
	end else begin
		main_reader_fifo_wrport_adr <= main_reader_fifo_produce;
	end
end
assign main_reader_fifo_wrport_dat_w = main_reader_fifo_syncfifo_din;
assign main_reader_fifo_wrport_we = (main_reader_fifo_syncfifo_we & (main_reader_fifo_syncfifo_writable | main_reader_fifo_replace));
assign main_reader_fifo_do_read = (main_reader_fifo_syncfifo_readable & main_reader_fifo_syncfifo_re);
assign main_reader_fifo_rdport_adr = main_reader_fifo_consume;
assign main_reader_fifo_syncfifo_dout = main_reader_fifo_rdport_dat_r;
assign main_reader_fifo_syncfifo_writable = (main_reader_fifo_level != 2'd2);
assign main_reader_fifo_syncfifo_readable = (main_reader_fifo_level != 1'd0);
always @(*) begin
	builder_liteethmacsramreader_next_state <= 2'd0;
	main_reader_source_source_valid <= 1'd0;
	main_reader_counter_reset <= 1'd0;
	main_reader_done_trigger <= 1'd0;
	main_reader_counter_ce <= 1'd0;
	main_reader_fifo_source_ready <= 1'd0;
	main_reader_source_source_last <= 1'd0;
	builder_liteethmacsramreader_next_state <= builder_liteethmacsramreader_state;
	case (builder_liteethmacsramreader_state)
		1'd1: begin
			if ((~main_reader_last_d)) begin
				builder_liteethmacsramreader_next_state <= 2'd2;
			end else begin
				builder_liteethmacsramreader_next_state <= 2'd3;
			end
		end
		2'd2: begin
			main_reader_source_source_valid <= 1'd1;
			main_reader_source_source_last <= main_reader_last;
			if (main_reader_source_source_ready) begin
				main_reader_counter_ce <= (~main_reader_last);
				builder_liteethmacsramreader_next_state <= 1'd1;
			end
		end
		2'd3: begin
			main_reader_fifo_source_ready <= 1'd1;
			main_reader_done_trigger <= 1'd1;
			builder_liteethmacsramreader_next_state <= 1'd0;
		end
		default: begin
			main_reader_counter_reset <= 1'd1;
			if (main_reader_fifo_source_valid) begin
				builder_liteethmacsramreader_next_state <= 1'd1;
			end
		end
	endcase
end
assign main_ev_irq = (main_writer_irq | main_reader_irq);
assign main_sram0_adr0 = main_sram0_bus_adr0[8:0];
assign main_sram0_bus_dat_r0 = main_sram0_dat_r0;
assign main_sram1_adr0 = main_sram1_bus_adr0[8:0];
assign main_sram1_bus_dat_r0 = main_sram1_dat_r0;
always @(*) begin
	main_sram0_we <= 4'd0;
	main_sram0_we[0] <= (((main_sram0_bus_cyc1 & main_sram0_bus_stb1) & main_sram0_bus_we1) & main_sram0_bus_sel1[0]);
	main_sram0_we[1] <= (((main_sram0_bus_cyc1 & main_sram0_bus_stb1) & main_sram0_bus_we1) & main_sram0_bus_sel1[1]);
	main_sram0_we[2] <= (((main_sram0_bus_cyc1 & main_sram0_bus_stb1) & main_sram0_bus_we1) & main_sram0_bus_sel1[2]);
	main_sram0_we[3] <= (((main_sram0_bus_cyc1 & main_sram0_bus_stb1) & main_sram0_bus_we1) & main_sram0_bus_sel1[3]);
end
assign main_sram0_adr1 = main_sram0_bus_adr1[8:0];
assign main_sram0_bus_dat_r1 = main_sram0_dat_r1;
assign main_sram0_dat_w = main_sram0_bus_dat_w1;
always @(*) begin
	main_sram1_we <= 4'd0;
	main_sram1_we[0] <= (((main_sram1_bus_cyc1 & main_sram1_bus_stb1) & main_sram1_bus_we1) & main_sram1_bus_sel1[0]);
	main_sram1_we[1] <= (((main_sram1_bus_cyc1 & main_sram1_bus_stb1) & main_sram1_bus_we1) & main_sram1_bus_sel1[1]);
	main_sram1_we[2] <= (((main_sram1_bus_cyc1 & main_sram1_bus_stb1) & main_sram1_bus_we1) & main_sram1_bus_sel1[2]);
	main_sram1_we[3] <= (((main_sram1_bus_cyc1 & main_sram1_bus_stb1) & main_sram1_bus_we1) & main_sram1_bus_sel1[3]);
end
assign main_sram1_adr1 = main_sram1_bus_adr1[8:0];
assign main_sram1_bus_dat_r1 = main_sram1_dat_r1;
assign main_sram1_dat_w = main_sram1_bus_dat_w1;
always @(*) begin
	main_slave_sel <= 4'd0;
	main_slave_sel[0] <= (main_bus_adr[10:9] == 1'd0);
	main_slave_sel[1] <= (main_bus_adr[10:9] == 1'd1);
	main_slave_sel[2] <= (main_bus_adr[10:9] == 2'd2);
	main_slave_sel[3] <= (main_bus_adr[10:9] == 2'd3);
end
assign main_sram0_bus_adr0 = main_bus_adr;
assign main_sram0_bus_dat_w0 = main_bus_dat_w;
assign main_sram0_bus_sel0 = main_bus_sel;
assign main_sram0_bus_stb0 = main_bus_stb;
assign main_sram0_bus_we0 = main_bus_we;
assign main_sram0_bus_cti0 = main_bus_cti;
assign main_sram0_bus_bte0 = main_bus_bte;
assign main_sram1_bus_adr0 = main_bus_adr;
assign main_sram1_bus_dat_w0 = main_bus_dat_w;
assign main_sram1_bus_sel0 = main_bus_sel;
assign main_sram1_bus_stb0 = main_bus_stb;
assign main_sram1_bus_we0 = main_bus_we;
assign main_sram1_bus_cti0 = main_bus_cti;
assign main_sram1_bus_bte0 = main_bus_bte;
assign main_sram0_bus_adr1 = main_bus_adr;
assign main_sram0_bus_dat_w1 = main_bus_dat_w;
assign main_sram0_bus_sel1 = main_bus_sel;
assign main_sram0_bus_stb1 = main_bus_stb;
assign main_sram0_bus_we1 = main_bus_we;
assign main_sram0_bus_cti1 = main_bus_cti;
assign main_sram0_bus_bte1 = main_bus_bte;
assign main_sram1_bus_adr1 = main_bus_adr;
assign main_sram1_bus_dat_w1 = main_bus_dat_w;
assign main_sram1_bus_sel1 = main_bus_sel;
assign main_sram1_bus_stb1 = main_bus_stb;
assign main_sram1_bus_we1 = main_bus_we;
assign main_sram1_bus_cti1 = main_bus_cti;
assign main_sram1_bus_bte1 = main_bus_bte;
assign main_sram0_bus_cyc0 = (main_bus_cyc & main_slave_sel[0]);
assign main_sram1_bus_cyc0 = (main_bus_cyc & main_slave_sel[1]);
assign main_sram0_bus_cyc1 = (main_bus_cyc & main_slave_sel[2]);
assign main_sram1_bus_cyc1 = (main_bus_cyc & main_slave_sel[3]);
assign main_bus_ack = (((main_sram0_bus_ack0 | main_sram1_bus_ack0) | main_sram0_bus_ack1) | main_sram1_bus_ack1);
assign main_bus_err = (((main_sram0_bus_err0 | main_sram1_bus_err0) | main_sram0_bus_err1) | main_sram1_bus_err1);
assign main_bus_dat_r = (((({32{main_slave_sel_r[0]}} & main_sram0_bus_dat_r0) | ({32{main_slave_sel_r[1]}} & main_sram1_bus_dat_r0)) | ({32{main_slave_sel_r[2]}} & main_sram0_bus_dat_r1)) | ({32{main_slave_sel_r[3]}} & main_sram1_bus_dat_r1));
assign main_ethernetsoc_interface0_wb_sdram_adr = builder_rhs_array_muxed36;
assign main_ethernetsoc_interface0_wb_sdram_dat_w = builder_rhs_array_muxed37;
assign main_ethernetsoc_interface0_wb_sdram_sel = builder_rhs_array_muxed38;
assign main_ethernetsoc_interface0_wb_sdram_cyc = builder_rhs_array_muxed39;
assign main_ethernetsoc_interface0_wb_sdram_stb = builder_rhs_array_muxed40;
assign main_ethernetsoc_interface0_wb_sdram_we = builder_rhs_array_muxed41;
assign main_ethernetsoc_interface0_wb_sdram_cti = builder_rhs_array_muxed42;
assign main_ethernetsoc_interface0_wb_sdram_bte = builder_rhs_array_muxed43;
assign main_ethernetsoc_interface1_wb_sdram_dat_r = main_ethernetsoc_interface0_wb_sdram_dat_r;
assign main_ethernetsoc_interface1_wb_sdram_ack = (main_ethernetsoc_interface0_wb_sdram_ack & (builder_wb_sdram_con_grant == 1'd0));
assign main_ethernetsoc_interface1_wb_sdram_err = (main_ethernetsoc_interface0_wb_sdram_err & (builder_wb_sdram_con_grant == 1'd0));
assign builder_wb_sdram_con_request = {main_ethernetsoc_interface1_wb_sdram_cyc};
assign builder_wb_sdram_con_grant = 1'd0;
assign builder_ethernetsoc_shared_adr = builder_rhs_array_muxed44;
assign builder_ethernetsoc_shared_dat_w = builder_rhs_array_muxed45;
assign builder_ethernetsoc_shared_sel = builder_rhs_array_muxed46;
assign builder_ethernetsoc_shared_cyc = builder_rhs_array_muxed47;
assign builder_ethernetsoc_shared_stb = builder_rhs_array_muxed48;
assign builder_ethernetsoc_shared_we = builder_rhs_array_muxed49;
assign builder_ethernetsoc_shared_cti = builder_rhs_array_muxed50;
assign builder_ethernetsoc_shared_bte = builder_rhs_array_muxed51;
assign main_ethernetsoc_vexriscv_ibus_dat_r = builder_ethernetsoc_shared_dat_r;
assign main_ethernetsoc_vexriscv_dbus_dat_r = builder_ethernetsoc_shared_dat_r;
assign main_ethernetsoc_vexriscv_ibus_ack = (builder_ethernetsoc_shared_ack & (builder_ethernetsoc_grant == 1'd0));
assign main_ethernetsoc_vexriscv_dbus_ack = (builder_ethernetsoc_shared_ack & (builder_ethernetsoc_grant == 1'd1));
assign main_ethernetsoc_vexriscv_ibus_err = (builder_ethernetsoc_shared_err & (builder_ethernetsoc_grant == 1'd0));
assign main_ethernetsoc_vexriscv_dbus_err = (builder_ethernetsoc_shared_err & (builder_ethernetsoc_grant == 1'd1));
assign builder_ethernetsoc_request = {main_ethernetsoc_vexriscv_dbus_cyc, main_ethernetsoc_vexriscv_ibus_cyc};
always @(*) begin
	builder_ethernetsoc_slave_sel <= 5'd0;
	builder_ethernetsoc_slave_sel[0] <= (builder_ethernetsoc_shared_adr[28:26] == 1'd0);
	builder_ethernetsoc_slave_sel[1] <= (builder_ethernetsoc_shared_adr[28:26] == 1'd1);
	builder_ethernetsoc_slave_sel[2] <= (builder_ethernetsoc_shared_adr[28:26] == 3'd6);
	builder_ethernetsoc_slave_sel[3] <= (builder_ethernetsoc_shared_adr[28:26] == 3'd4);
	builder_ethernetsoc_slave_sel[4] <= (builder_ethernetsoc_shared_adr[28:26] == 2'd3);
end
assign main_ethernetsoc_rom_bus_adr = builder_ethernetsoc_shared_adr;
assign main_ethernetsoc_rom_bus_dat_w = builder_ethernetsoc_shared_dat_w;
assign main_ethernetsoc_rom_bus_sel = builder_ethernetsoc_shared_sel;
assign main_ethernetsoc_rom_bus_stb = builder_ethernetsoc_shared_stb;
assign main_ethernetsoc_rom_bus_we = builder_ethernetsoc_shared_we;
assign main_ethernetsoc_rom_bus_cti = builder_ethernetsoc_shared_cti;
assign main_ethernetsoc_rom_bus_bte = builder_ethernetsoc_shared_bte;
assign main_ethernetsoc_sram_bus_adr = builder_ethernetsoc_shared_adr;
assign main_ethernetsoc_sram_bus_dat_w = builder_ethernetsoc_shared_dat_w;
assign main_ethernetsoc_sram_bus_sel = builder_ethernetsoc_shared_sel;
assign main_ethernetsoc_sram_bus_stb = builder_ethernetsoc_shared_stb;
assign main_ethernetsoc_sram_bus_we = builder_ethernetsoc_shared_we;
assign main_ethernetsoc_sram_bus_cti = builder_ethernetsoc_shared_cti;
assign main_ethernetsoc_sram_bus_bte = builder_ethernetsoc_shared_bte;
assign main_ethernetsoc_bus_wishbone_adr = builder_ethernetsoc_shared_adr;
assign main_ethernetsoc_bus_wishbone_dat_w = builder_ethernetsoc_shared_dat_w;
assign main_ethernetsoc_bus_wishbone_sel = builder_ethernetsoc_shared_sel;
assign main_ethernetsoc_bus_wishbone_stb = builder_ethernetsoc_shared_stb;
assign main_ethernetsoc_bus_wishbone_we = builder_ethernetsoc_shared_we;
assign main_ethernetsoc_bus_wishbone_cti = builder_ethernetsoc_shared_cti;
assign main_ethernetsoc_bus_wishbone_bte = builder_ethernetsoc_shared_bte;
assign main_ethernetsoc_interface1_wb_sdram_adr = builder_ethernetsoc_shared_adr;
assign main_ethernetsoc_interface1_wb_sdram_dat_w = builder_ethernetsoc_shared_dat_w;
assign main_ethernetsoc_interface1_wb_sdram_sel = builder_ethernetsoc_shared_sel;
assign main_ethernetsoc_interface1_wb_sdram_stb = builder_ethernetsoc_shared_stb;
assign main_ethernetsoc_interface1_wb_sdram_we = builder_ethernetsoc_shared_we;
assign main_ethernetsoc_interface1_wb_sdram_cti = builder_ethernetsoc_shared_cti;
assign main_ethernetsoc_interface1_wb_sdram_bte = builder_ethernetsoc_shared_bte;
assign main_bus_adr = builder_ethernetsoc_shared_adr;
assign main_bus_dat_w = builder_ethernetsoc_shared_dat_w;
assign main_bus_sel = builder_ethernetsoc_shared_sel;
assign main_bus_stb = builder_ethernetsoc_shared_stb;
assign main_bus_we = builder_ethernetsoc_shared_we;
assign main_bus_cti = builder_ethernetsoc_shared_cti;
assign main_bus_bte = builder_ethernetsoc_shared_bte;
assign main_ethernetsoc_rom_bus_cyc = (builder_ethernetsoc_shared_cyc & builder_ethernetsoc_slave_sel[0]);
assign main_ethernetsoc_sram_bus_cyc = (builder_ethernetsoc_shared_cyc & builder_ethernetsoc_slave_sel[1]);
assign main_ethernetsoc_bus_wishbone_cyc = (builder_ethernetsoc_shared_cyc & builder_ethernetsoc_slave_sel[2]);
assign main_ethernetsoc_interface1_wb_sdram_cyc = (builder_ethernetsoc_shared_cyc & builder_ethernetsoc_slave_sel[3]);
assign main_bus_cyc = (builder_ethernetsoc_shared_cyc & builder_ethernetsoc_slave_sel[4]);
assign builder_ethernetsoc_shared_err = ((((main_ethernetsoc_rom_bus_err | main_ethernetsoc_sram_bus_err) | main_ethernetsoc_bus_wishbone_err) | main_ethernetsoc_interface1_wb_sdram_err) | main_bus_err);
assign builder_ethernetsoc_wait = ((builder_ethernetsoc_shared_stb & builder_ethernetsoc_shared_cyc) & (~builder_ethernetsoc_shared_ack));
always @(*) begin
	builder_ethernetsoc_error <= 1'd0;
	builder_ethernetsoc_shared_dat_r <= 32'd0;
	builder_ethernetsoc_shared_ack <= 1'd0;
	builder_ethernetsoc_shared_ack <= ((((main_ethernetsoc_rom_bus_ack | main_ethernetsoc_sram_bus_ack) | main_ethernetsoc_bus_wishbone_ack) | main_ethernetsoc_interface1_wb_sdram_ack) | main_bus_ack);
	builder_ethernetsoc_shared_dat_r <= ((((({32{builder_ethernetsoc_slave_sel_r[0]}} & main_ethernetsoc_rom_bus_dat_r) | ({32{builder_ethernetsoc_slave_sel_r[1]}} & main_ethernetsoc_sram_bus_dat_r)) | ({32{builder_ethernetsoc_slave_sel_r[2]}} & main_ethernetsoc_bus_wishbone_dat_r)) | ({32{builder_ethernetsoc_slave_sel_r[3]}} & main_ethernetsoc_interface1_wb_sdram_dat_r)) | ({32{builder_ethernetsoc_slave_sel_r[4]}} & main_bus_dat_r));
	if (builder_ethernetsoc_done) begin
		builder_ethernetsoc_shared_dat_r <= 32'd4294967295;
		builder_ethernetsoc_shared_ack <= 1'd1;
		builder_ethernetsoc_error <= 1'd1;
	end
end
assign builder_ethernetsoc_done = (builder_ethernetsoc_count == 1'd0);
assign builder_ethernetsoc_csrbank0_sel = (builder_ethernetsoc_interface0_bank_bus_adr[13:9] == 1'd1);
assign main_ethernetsoc_vexriscv_latch_r = builder_ethernetsoc_interface0_bank_bus_dat_w[0];
assign main_ethernetsoc_vexriscv_latch_re = ((builder_ethernetsoc_csrbank0_sel & builder_ethernetsoc_interface0_bank_bus_we) & (builder_ethernetsoc_interface0_bank_bus_adr[4:0] == 1'd0));
assign builder_ethernetsoc_csrbank0_timer_time7_r = builder_ethernetsoc_interface0_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank0_timer_time7_re = ((builder_ethernetsoc_csrbank0_sel & builder_ethernetsoc_interface0_bank_bus_we) & (builder_ethernetsoc_interface0_bank_bus_adr[4:0] == 1'd1));
assign builder_ethernetsoc_csrbank0_timer_time6_r = builder_ethernetsoc_interface0_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank0_timer_time6_re = ((builder_ethernetsoc_csrbank0_sel & builder_ethernetsoc_interface0_bank_bus_we) & (builder_ethernetsoc_interface0_bank_bus_adr[4:0] == 2'd2));
assign builder_ethernetsoc_csrbank0_timer_time5_r = builder_ethernetsoc_interface0_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank0_timer_time5_re = ((builder_ethernetsoc_csrbank0_sel & builder_ethernetsoc_interface0_bank_bus_we) & (builder_ethernetsoc_interface0_bank_bus_adr[4:0] == 2'd3));
assign builder_ethernetsoc_csrbank0_timer_time4_r = builder_ethernetsoc_interface0_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank0_timer_time4_re = ((builder_ethernetsoc_csrbank0_sel & builder_ethernetsoc_interface0_bank_bus_we) & (builder_ethernetsoc_interface0_bank_bus_adr[4:0] == 3'd4));
assign builder_ethernetsoc_csrbank0_timer_time3_r = builder_ethernetsoc_interface0_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank0_timer_time3_re = ((builder_ethernetsoc_csrbank0_sel & builder_ethernetsoc_interface0_bank_bus_we) & (builder_ethernetsoc_interface0_bank_bus_adr[4:0] == 3'd5));
assign builder_ethernetsoc_csrbank0_timer_time2_r = builder_ethernetsoc_interface0_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank0_timer_time2_re = ((builder_ethernetsoc_csrbank0_sel & builder_ethernetsoc_interface0_bank_bus_we) & (builder_ethernetsoc_interface0_bank_bus_adr[4:0] == 3'd6));
assign builder_ethernetsoc_csrbank0_timer_time1_r = builder_ethernetsoc_interface0_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank0_timer_time1_re = ((builder_ethernetsoc_csrbank0_sel & builder_ethernetsoc_interface0_bank_bus_we) & (builder_ethernetsoc_interface0_bank_bus_adr[4:0] == 3'd7));
assign builder_ethernetsoc_csrbank0_timer_time0_r = builder_ethernetsoc_interface0_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank0_timer_time0_re = ((builder_ethernetsoc_csrbank0_sel & builder_ethernetsoc_interface0_bank_bus_we) & (builder_ethernetsoc_interface0_bank_bus_adr[4:0] == 4'd8));
assign builder_ethernetsoc_csrbank0_timer_time_cmp7_r = builder_ethernetsoc_interface0_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank0_timer_time_cmp7_re = ((builder_ethernetsoc_csrbank0_sel & builder_ethernetsoc_interface0_bank_bus_we) & (builder_ethernetsoc_interface0_bank_bus_adr[4:0] == 4'd9));
assign builder_ethernetsoc_csrbank0_timer_time_cmp6_r = builder_ethernetsoc_interface0_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank0_timer_time_cmp6_re = ((builder_ethernetsoc_csrbank0_sel & builder_ethernetsoc_interface0_bank_bus_we) & (builder_ethernetsoc_interface0_bank_bus_adr[4:0] == 4'd10));
assign builder_ethernetsoc_csrbank0_timer_time_cmp5_r = builder_ethernetsoc_interface0_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank0_timer_time_cmp5_re = ((builder_ethernetsoc_csrbank0_sel & builder_ethernetsoc_interface0_bank_bus_we) & (builder_ethernetsoc_interface0_bank_bus_adr[4:0] == 4'd11));
assign builder_ethernetsoc_csrbank0_timer_time_cmp4_r = builder_ethernetsoc_interface0_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank0_timer_time_cmp4_re = ((builder_ethernetsoc_csrbank0_sel & builder_ethernetsoc_interface0_bank_bus_we) & (builder_ethernetsoc_interface0_bank_bus_adr[4:0] == 4'd12));
assign builder_ethernetsoc_csrbank0_timer_time_cmp3_r = builder_ethernetsoc_interface0_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank0_timer_time_cmp3_re = ((builder_ethernetsoc_csrbank0_sel & builder_ethernetsoc_interface0_bank_bus_we) & (builder_ethernetsoc_interface0_bank_bus_adr[4:0] == 4'd13));
assign builder_ethernetsoc_csrbank0_timer_time_cmp2_r = builder_ethernetsoc_interface0_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank0_timer_time_cmp2_re = ((builder_ethernetsoc_csrbank0_sel & builder_ethernetsoc_interface0_bank_bus_we) & (builder_ethernetsoc_interface0_bank_bus_adr[4:0] == 4'd14));
assign builder_ethernetsoc_csrbank0_timer_time_cmp1_r = builder_ethernetsoc_interface0_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank0_timer_time_cmp1_re = ((builder_ethernetsoc_csrbank0_sel & builder_ethernetsoc_interface0_bank_bus_we) & (builder_ethernetsoc_interface0_bank_bus_adr[4:0] == 4'd15));
assign builder_ethernetsoc_csrbank0_timer_time_cmp0_r = builder_ethernetsoc_interface0_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank0_timer_time_cmp0_re = ((builder_ethernetsoc_csrbank0_sel & builder_ethernetsoc_interface0_bank_bus_we) & (builder_ethernetsoc_interface0_bank_bus_adr[4:0] == 5'd16));
assign builder_ethernetsoc_csrbank0_timer_time7_w = main_ethernetsoc_vexriscv_time_status[63:56];
assign builder_ethernetsoc_csrbank0_timer_time6_w = main_ethernetsoc_vexriscv_time_status[55:48];
assign builder_ethernetsoc_csrbank0_timer_time5_w = main_ethernetsoc_vexriscv_time_status[47:40];
assign builder_ethernetsoc_csrbank0_timer_time4_w = main_ethernetsoc_vexriscv_time_status[39:32];
assign builder_ethernetsoc_csrbank0_timer_time3_w = main_ethernetsoc_vexriscv_time_status[31:24];
assign builder_ethernetsoc_csrbank0_timer_time2_w = main_ethernetsoc_vexriscv_time_status[23:16];
assign builder_ethernetsoc_csrbank0_timer_time1_w = main_ethernetsoc_vexriscv_time_status[15:8];
assign builder_ethernetsoc_csrbank0_timer_time0_w = main_ethernetsoc_vexriscv_time_status[7:0];
assign main_ethernetsoc_vexriscv_time_cmp_storage = main_ethernetsoc_vexriscv_time_cmp_storage_full[63:0];
assign builder_ethernetsoc_csrbank0_timer_time_cmp7_w = main_ethernetsoc_vexriscv_time_cmp_storage_full[63:56];
assign builder_ethernetsoc_csrbank0_timer_time_cmp6_w = main_ethernetsoc_vexriscv_time_cmp_storage_full[55:48];
assign builder_ethernetsoc_csrbank0_timer_time_cmp5_w = main_ethernetsoc_vexriscv_time_cmp_storage_full[47:40];
assign builder_ethernetsoc_csrbank0_timer_time_cmp4_w = main_ethernetsoc_vexriscv_time_cmp_storage_full[39:32];
assign builder_ethernetsoc_csrbank0_timer_time_cmp3_w = main_ethernetsoc_vexriscv_time_cmp_storage_full[31:24];
assign builder_ethernetsoc_csrbank0_timer_time_cmp2_w = main_ethernetsoc_vexriscv_time_cmp_storage_full[23:16];
assign builder_ethernetsoc_csrbank0_timer_time_cmp1_w = main_ethernetsoc_vexriscv_time_cmp_storage_full[15:8];
assign builder_ethernetsoc_csrbank0_timer_time_cmp0_w = main_ethernetsoc_vexriscv_time_cmp_storage_full[7:0];
assign builder_ethernetsoc_csrbank1_sel = (builder_ethernetsoc_interface1_bank_bus_adr[13:9] == 1'd0);
assign main_ethernetsoc_ctrl_reset_reset_r = builder_ethernetsoc_interface1_bank_bus_dat_w[0];
assign main_ethernetsoc_ctrl_reset_reset_re = ((builder_ethernetsoc_csrbank1_sel & builder_ethernetsoc_interface1_bank_bus_we) & (builder_ethernetsoc_interface1_bank_bus_adr[3:0] == 1'd0));
assign builder_ethernetsoc_csrbank1_scratch3_r = builder_ethernetsoc_interface1_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank1_scratch3_re = ((builder_ethernetsoc_csrbank1_sel & builder_ethernetsoc_interface1_bank_bus_we) & (builder_ethernetsoc_interface1_bank_bus_adr[3:0] == 1'd1));
assign builder_ethernetsoc_csrbank1_scratch2_r = builder_ethernetsoc_interface1_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank1_scratch2_re = ((builder_ethernetsoc_csrbank1_sel & builder_ethernetsoc_interface1_bank_bus_we) & (builder_ethernetsoc_interface1_bank_bus_adr[3:0] == 2'd2));
assign builder_ethernetsoc_csrbank1_scratch1_r = builder_ethernetsoc_interface1_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank1_scratch1_re = ((builder_ethernetsoc_csrbank1_sel & builder_ethernetsoc_interface1_bank_bus_we) & (builder_ethernetsoc_interface1_bank_bus_adr[3:0] == 2'd3));
assign builder_ethernetsoc_csrbank1_scratch0_r = builder_ethernetsoc_interface1_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank1_scratch0_re = ((builder_ethernetsoc_csrbank1_sel & builder_ethernetsoc_interface1_bank_bus_we) & (builder_ethernetsoc_interface1_bank_bus_adr[3:0] == 3'd4));
assign builder_ethernetsoc_csrbank1_bus_errors3_r = builder_ethernetsoc_interface1_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank1_bus_errors3_re = ((builder_ethernetsoc_csrbank1_sel & builder_ethernetsoc_interface1_bank_bus_we) & (builder_ethernetsoc_interface1_bank_bus_adr[3:0] == 3'd5));
assign builder_ethernetsoc_csrbank1_bus_errors2_r = builder_ethernetsoc_interface1_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank1_bus_errors2_re = ((builder_ethernetsoc_csrbank1_sel & builder_ethernetsoc_interface1_bank_bus_we) & (builder_ethernetsoc_interface1_bank_bus_adr[3:0] == 3'd6));
assign builder_ethernetsoc_csrbank1_bus_errors1_r = builder_ethernetsoc_interface1_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank1_bus_errors1_re = ((builder_ethernetsoc_csrbank1_sel & builder_ethernetsoc_interface1_bank_bus_we) & (builder_ethernetsoc_interface1_bank_bus_adr[3:0] == 3'd7));
assign builder_ethernetsoc_csrbank1_bus_errors0_r = builder_ethernetsoc_interface1_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank1_bus_errors0_re = ((builder_ethernetsoc_csrbank1_sel & builder_ethernetsoc_interface1_bank_bus_we) & (builder_ethernetsoc_interface1_bank_bus_adr[3:0] == 4'd8));
assign main_ethernetsoc_ctrl_storage = main_ethernetsoc_ctrl_storage_full[31:0];
assign builder_ethernetsoc_csrbank1_scratch3_w = main_ethernetsoc_ctrl_storage_full[31:24];
assign builder_ethernetsoc_csrbank1_scratch2_w = main_ethernetsoc_ctrl_storage_full[23:16];
assign builder_ethernetsoc_csrbank1_scratch1_w = main_ethernetsoc_ctrl_storage_full[15:8];
assign builder_ethernetsoc_csrbank1_scratch0_w = main_ethernetsoc_ctrl_storage_full[7:0];
assign builder_ethernetsoc_csrbank1_bus_errors3_w = main_ethernetsoc_ctrl_bus_errors_status[31:24];
assign builder_ethernetsoc_csrbank1_bus_errors2_w = main_ethernetsoc_ctrl_bus_errors_status[23:16];
assign builder_ethernetsoc_csrbank1_bus_errors1_w = main_ethernetsoc_ctrl_bus_errors_status[15:8];
assign builder_ethernetsoc_csrbank1_bus_errors0_w = main_ethernetsoc_ctrl_bus_errors_status[7:0];
assign builder_ethernetsoc_csrbank2_sel = (builder_ethernetsoc_interface2_bank_bus_adr[13:9] == 3'd5);
assign builder_ethernetsoc_csrbank2_half_sys8x_taps0_r = builder_ethernetsoc_interface2_bank_bus_dat_w[3:0];
assign builder_ethernetsoc_csrbank2_half_sys8x_taps0_re = ((builder_ethernetsoc_csrbank2_sel & builder_ethernetsoc_interface2_bank_bus_we) & (builder_ethernetsoc_interface2_bank_bus_adr[2:0] == 1'd0));
assign main_ethernetsoc_a7ddrphy_cdly_rst_r = builder_ethernetsoc_interface2_bank_bus_dat_w[0];
assign main_ethernetsoc_a7ddrphy_cdly_rst_re = ((builder_ethernetsoc_csrbank2_sel & builder_ethernetsoc_interface2_bank_bus_we) & (builder_ethernetsoc_interface2_bank_bus_adr[2:0] == 1'd1));
assign main_ethernetsoc_a7ddrphy_cdly_inc_r = builder_ethernetsoc_interface2_bank_bus_dat_w[0];
assign main_ethernetsoc_a7ddrphy_cdly_inc_re = ((builder_ethernetsoc_csrbank2_sel & builder_ethernetsoc_interface2_bank_bus_we) & (builder_ethernetsoc_interface2_bank_bus_adr[2:0] == 2'd2));
assign builder_ethernetsoc_csrbank2_dly_sel0_r = builder_ethernetsoc_interface2_bank_bus_dat_w[1:0];
assign builder_ethernetsoc_csrbank2_dly_sel0_re = ((builder_ethernetsoc_csrbank2_sel & builder_ethernetsoc_interface2_bank_bus_we) & (builder_ethernetsoc_interface2_bank_bus_adr[2:0] == 2'd3));
assign main_ethernetsoc_a7ddrphy_rdly_dq_rst_r = builder_ethernetsoc_interface2_bank_bus_dat_w[0];
assign main_ethernetsoc_a7ddrphy_rdly_dq_rst_re = ((builder_ethernetsoc_csrbank2_sel & builder_ethernetsoc_interface2_bank_bus_we) & (builder_ethernetsoc_interface2_bank_bus_adr[2:0] == 3'd4));
assign main_ethernetsoc_a7ddrphy_rdly_dq_inc_r = builder_ethernetsoc_interface2_bank_bus_dat_w[0];
assign main_ethernetsoc_a7ddrphy_rdly_dq_inc_re = ((builder_ethernetsoc_csrbank2_sel & builder_ethernetsoc_interface2_bank_bus_we) & (builder_ethernetsoc_interface2_bank_bus_adr[2:0] == 3'd5));
assign main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_rst_r = builder_ethernetsoc_interface2_bank_bus_dat_w[0];
assign main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_rst_re = ((builder_ethernetsoc_csrbank2_sel & builder_ethernetsoc_interface2_bank_bus_we) & (builder_ethernetsoc_interface2_bank_bus_adr[2:0] == 3'd6));
assign main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_r = builder_ethernetsoc_interface2_bank_bus_dat_w[0];
assign main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_re = ((builder_ethernetsoc_csrbank2_sel & builder_ethernetsoc_interface2_bank_bus_we) & (builder_ethernetsoc_interface2_bank_bus_adr[2:0] == 3'd7));
assign main_ethernetsoc_a7ddrphy_half_sys8x_taps_storage = main_ethernetsoc_a7ddrphy_half_sys8x_taps_storage_full[3:0];
assign builder_ethernetsoc_csrbank2_half_sys8x_taps0_w = main_ethernetsoc_a7ddrphy_half_sys8x_taps_storage_full[3:0];
assign main_ethernetsoc_a7ddrphy_dly_sel_storage = main_ethernetsoc_a7ddrphy_dly_sel_storage_full[1:0];
assign builder_ethernetsoc_csrbank2_dly_sel0_w = main_ethernetsoc_a7ddrphy_dly_sel_storage_full[1:0];
assign builder_ethernetsoc_csrbank3_sel = (builder_ethernetsoc_interface3_bank_bus_adr[13:9] == 3'd7);
assign builder_ethernetsoc_csrbank3_sram_writer_slot_r = builder_ethernetsoc_interface3_bank_bus_dat_w[0];
assign builder_ethernetsoc_csrbank3_sram_writer_slot_re = ((builder_ethernetsoc_csrbank3_sel & builder_ethernetsoc_interface3_bank_bus_we) & (builder_ethernetsoc_interface3_bank_bus_adr[4:0] == 1'd0));
assign builder_ethernetsoc_csrbank3_sram_writer_length3_r = builder_ethernetsoc_interface3_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank3_sram_writer_length3_re = ((builder_ethernetsoc_csrbank3_sel & builder_ethernetsoc_interface3_bank_bus_we) & (builder_ethernetsoc_interface3_bank_bus_adr[4:0] == 1'd1));
assign builder_ethernetsoc_csrbank3_sram_writer_length2_r = builder_ethernetsoc_interface3_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank3_sram_writer_length2_re = ((builder_ethernetsoc_csrbank3_sel & builder_ethernetsoc_interface3_bank_bus_we) & (builder_ethernetsoc_interface3_bank_bus_adr[4:0] == 2'd2));
assign builder_ethernetsoc_csrbank3_sram_writer_length1_r = builder_ethernetsoc_interface3_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank3_sram_writer_length1_re = ((builder_ethernetsoc_csrbank3_sel & builder_ethernetsoc_interface3_bank_bus_we) & (builder_ethernetsoc_interface3_bank_bus_adr[4:0] == 2'd3));
assign builder_ethernetsoc_csrbank3_sram_writer_length0_r = builder_ethernetsoc_interface3_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank3_sram_writer_length0_re = ((builder_ethernetsoc_csrbank3_sel & builder_ethernetsoc_interface3_bank_bus_we) & (builder_ethernetsoc_interface3_bank_bus_adr[4:0] == 3'd4));
assign builder_ethernetsoc_csrbank3_sram_writer_errors3_r = builder_ethernetsoc_interface3_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank3_sram_writer_errors3_re = ((builder_ethernetsoc_csrbank3_sel & builder_ethernetsoc_interface3_bank_bus_we) & (builder_ethernetsoc_interface3_bank_bus_adr[4:0] == 3'd5));
assign builder_ethernetsoc_csrbank3_sram_writer_errors2_r = builder_ethernetsoc_interface3_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank3_sram_writer_errors2_re = ((builder_ethernetsoc_csrbank3_sel & builder_ethernetsoc_interface3_bank_bus_we) & (builder_ethernetsoc_interface3_bank_bus_adr[4:0] == 3'd6));
assign builder_ethernetsoc_csrbank3_sram_writer_errors1_r = builder_ethernetsoc_interface3_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank3_sram_writer_errors1_re = ((builder_ethernetsoc_csrbank3_sel & builder_ethernetsoc_interface3_bank_bus_we) & (builder_ethernetsoc_interface3_bank_bus_adr[4:0] == 3'd7));
assign builder_ethernetsoc_csrbank3_sram_writer_errors0_r = builder_ethernetsoc_interface3_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank3_sram_writer_errors0_re = ((builder_ethernetsoc_csrbank3_sel & builder_ethernetsoc_interface3_bank_bus_we) & (builder_ethernetsoc_interface3_bank_bus_adr[4:0] == 4'd8));
assign main_writer_status_r = builder_ethernetsoc_interface3_bank_bus_dat_w[0];
assign main_writer_status_re = ((builder_ethernetsoc_csrbank3_sel & builder_ethernetsoc_interface3_bank_bus_we) & (builder_ethernetsoc_interface3_bank_bus_adr[4:0] == 4'd9));
assign main_writer_pending_r = builder_ethernetsoc_interface3_bank_bus_dat_w[0];
assign main_writer_pending_re = ((builder_ethernetsoc_csrbank3_sel & builder_ethernetsoc_interface3_bank_bus_we) & (builder_ethernetsoc_interface3_bank_bus_adr[4:0] == 4'd10));
assign builder_ethernetsoc_csrbank3_sram_writer_ev_enable0_r = builder_ethernetsoc_interface3_bank_bus_dat_w[0];
assign builder_ethernetsoc_csrbank3_sram_writer_ev_enable0_re = ((builder_ethernetsoc_csrbank3_sel & builder_ethernetsoc_interface3_bank_bus_we) & (builder_ethernetsoc_interface3_bank_bus_adr[4:0] == 4'd11));
assign main_reader_start_r = builder_ethernetsoc_interface3_bank_bus_dat_w[0];
assign main_reader_start_re = ((builder_ethernetsoc_csrbank3_sel & builder_ethernetsoc_interface3_bank_bus_we) & (builder_ethernetsoc_interface3_bank_bus_adr[4:0] == 4'd12));
assign builder_ethernetsoc_csrbank3_sram_reader_ready_r = builder_ethernetsoc_interface3_bank_bus_dat_w[0];
assign builder_ethernetsoc_csrbank3_sram_reader_ready_re = ((builder_ethernetsoc_csrbank3_sel & builder_ethernetsoc_interface3_bank_bus_we) & (builder_ethernetsoc_interface3_bank_bus_adr[4:0] == 4'd13));
assign builder_ethernetsoc_csrbank3_sram_reader_level_r = builder_ethernetsoc_interface3_bank_bus_dat_w[1:0];
assign builder_ethernetsoc_csrbank3_sram_reader_level_re = ((builder_ethernetsoc_csrbank3_sel & builder_ethernetsoc_interface3_bank_bus_we) & (builder_ethernetsoc_interface3_bank_bus_adr[4:0] == 4'd14));
assign builder_ethernetsoc_csrbank3_sram_reader_slot0_r = builder_ethernetsoc_interface3_bank_bus_dat_w[0];
assign builder_ethernetsoc_csrbank3_sram_reader_slot0_re = ((builder_ethernetsoc_csrbank3_sel & builder_ethernetsoc_interface3_bank_bus_we) & (builder_ethernetsoc_interface3_bank_bus_adr[4:0] == 4'd15));
assign builder_ethernetsoc_csrbank3_sram_reader_length1_r = builder_ethernetsoc_interface3_bank_bus_dat_w[2:0];
assign builder_ethernetsoc_csrbank3_sram_reader_length1_re = ((builder_ethernetsoc_csrbank3_sel & builder_ethernetsoc_interface3_bank_bus_we) & (builder_ethernetsoc_interface3_bank_bus_adr[4:0] == 5'd16));
assign builder_ethernetsoc_csrbank3_sram_reader_length0_r = builder_ethernetsoc_interface3_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank3_sram_reader_length0_re = ((builder_ethernetsoc_csrbank3_sel & builder_ethernetsoc_interface3_bank_bus_we) & (builder_ethernetsoc_interface3_bank_bus_adr[4:0] == 5'd17));
assign main_reader_eventmanager_status_r = builder_ethernetsoc_interface3_bank_bus_dat_w[0];
assign main_reader_eventmanager_status_re = ((builder_ethernetsoc_csrbank3_sel & builder_ethernetsoc_interface3_bank_bus_we) & (builder_ethernetsoc_interface3_bank_bus_adr[4:0] == 5'd18));
assign main_reader_eventmanager_pending_r = builder_ethernetsoc_interface3_bank_bus_dat_w[0];
assign main_reader_eventmanager_pending_re = ((builder_ethernetsoc_csrbank3_sel & builder_ethernetsoc_interface3_bank_bus_we) & (builder_ethernetsoc_interface3_bank_bus_adr[4:0] == 5'd19));
assign builder_ethernetsoc_csrbank3_sram_reader_ev_enable0_r = builder_ethernetsoc_interface3_bank_bus_dat_w[0];
assign builder_ethernetsoc_csrbank3_sram_reader_ev_enable0_re = ((builder_ethernetsoc_csrbank3_sel & builder_ethernetsoc_interface3_bank_bus_we) & (builder_ethernetsoc_interface3_bank_bus_adr[4:0] == 5'd20));
assign builder_ethernetsoc_csrbank3_preamble_crc_r = builder_ethernetsoc_interface3_bank_bus_dat_w[0];
assign builder_ethernetsoc_csrbank3_preamble_crc_re = ((builder_ethernetsoc_csrbank3_sel & builder_ethernetsoc_interface3_bank_bus_we) & (builder_ethernetsoc_interface3_bank_bus_adr[4:0] == 5'd21));
assign builder_ethernetsoc_csrbank3_preamble_errors3_r = builder_ethernetsoc_interface3_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank3_preamble_errors3_re = ((builder_ethernetsoc_csrbank3_sel & builder_ethernetsoc_interface3_bank_bus_we) & (builder_ethernetsoc_interface3_bank_bus_adr[4:0] == 5'd22));
assign builder_ethernetsoc_csrbank3_preamble_errors2_r = builder_ethernetsoc_interface3_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank3_preamble_errors2_re = ((builder_ethernetsoc_csrbank3_sel & builder_ethernetsoc_interface3_bank_bus_we) & (builder_ethernetsoc_interface3_bank_bus_adr[4:0] == 5'd23));
assign builder_ethernetsoc_csrbank3_preamble_errors1_r = builder_ethernetsoc_interface3_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank3_preamble_errors1_re = ((builder_ethernetsoc_csrbank3_sel & builder_ethernetsoc_interface3_bank_bus_we) & (builder_ethernetsoc_interface3_bank_bus_adr[4:0] == 5'd24));
assign builder_ethernetsoc_csrbank3_preamble_errors0_r = builder_ethernetsoc_interface3_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank3_preamble_errors0_re = ((builder_ethernetsoc_csrbank3_sel & builder_ethernetsoc_interface3_bank_bus_we) & (builder_ethernetsoc_interface3_bank_bus_adr[4:0] == 5'd25));
assign builder_ethernetsoc_csrbank3_crc_errors3_r = builder_ethernetsoc_interface3_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank3_crc_errors3_re = ((builder_ethernetsoc_csrbank3_sel & builder_ethernetsoc_interface3_bank_bus_we) & (builder_ethernetsoc_interface3_bank_bus_adr[4:0] == 5'd26));
assign builder_ethernetsoc_csrbank3_crc_errors2_r = builder_ethernetsoc_interface3_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank3_crc_errors2_re = ((builder_ethernetsoc_csrbank3_sel & builder_ethernetsoc_interface3_bank_bus_we) & (builder_ethernetsoc_interface3_bank_bus_adr[4:0] == 5'd27));
assign builder_ethernetsoc_csrbank3_crc_errors1_r = builder_ethernetsoc_interface3_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank3_crc_errors1_re = ((builder_ethernetsoc_csrbank3_sel & builder_ethernetsoc_interface3_bank_bus_we) & (builder_ethernetsoc_interface3_bank_bus_adr[4:0] == 5'd28));
assign builder_ethernetsoc_csrbank3_crc_errors0_r = builder_ethernetsoc_interface3_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank3_crc_errors0_re = ((builder_ethernetsoc_csrbank3_sel & builder_ethernetsoc_interface3_bank_bus_we) & (builder_ethernetsoc_interface3_bank_bus_adr[4:0] == 5'd29));
assign builder_ethernetsoc_csrbank3_sram_writer_slot_w = main_writer_slot_status;
assign builder_ethernetsoc_csrbank3_sram_writer_length3_w = main_writer_length_status[31:24];
assign builder_ethernetsoc_csrbank3_sram_writer_length2_w = main_writer_length_status[23:16];
assign builder_ethernetsoc_csrbank3_sram_writer_length1_w = main_writer_length_status[15:8];
assign builder_ethernetsoc_csrbank3_sram_writer_length0_w = main_writer_length_status[7:0];
assign builder_ethernetsoc_csrbank3_sram_writer_errors3_w = main_writer_errors_status[31:24];
assign builder_ethernetsoc_csrbank3_sram_writer_errors2_w = main_writer_errors_status[23:16];
assign builder_ethernetsoc_csrbank3_sram_writer_errors1_w = main_writer_errors_status[15:8];
assign builder_ethernetsoc_csrbank3_sram_writer_errors0_w = main_writer_errors_status[7:0];
assign main_writer_storage = main_writer_storage_full;
assign builder_ethernetsoc_csrbank3_sram_writer_ev_enable0_w = main_writer_storage_full;
assign builder_ethernetsoc_csrbank3_sram_reader_ready_w = main_reader_ready_status;
assign builder_ethernetsoc_csrbank3_sram_reader_level_w = main_reader_level_status[1:0];
assign main_reader_slot_storage = main_reader_slot_storage_full;
assign builder_ethernetsoc_csrbank3_sram_reader_slot0_w = main_reader_slot_storage_full;
assign main_reader_length_storage = main_reader_length_storage_full[10:0];
assign builder_ethernetsoc_csrbank3_sram_reader_length1_w = main_reader_length_storage_full[10:8];
assign builder_ethernetsoc_csrbank3_sram_reader_length0_w = main_reader_length_storage_full[7:0];
assign main_reader_eventmanager_storage = main_reader_eventmanager_storage_full;
assign builder_ethernetsoc_csrbank3_sram_reader_ev_enable0_w = main_reader_eventmanager_storage_full;
assign builder_ethernetsoc_csrbank3_preamble_crc_w = main_preamble_crc_status;
assign builder_ethernetsoc_csrbank3_preamble_errors3_w = main_preamble_errors_status[31:24];
assign builder_ethernetsoc_csrbank3_preamble_errors2_w = main_preamble_errors_status[23:16];
assign builder_ethernetsoc_csrbank3_preamble_errors1_w = main_preamble_errors_status[15:8];
assign builder_ethernetsoc_csrbank3_preamble_errors0_w = main_preamble_errors_status[7:0];
assign builder_ethernetsoc_csrbank3_crc_errors3_w = main_crc_errors_status[31:24];
assign builder_ethernetsoc_csrbank3_crc_errors2_w = main_crc_errors_status[23:16];
assign builder_ethernetsoc_csrbank3_crc_errors1_w = main_crc_errors_status[15:8];
assign builder_ethernetsoc_csrbank3_crc_errors0_w = main_crc_errors_status[7:0];
assign builder_ethernetsoc_csrbank4_sel = (builder_ethernetsoc_interface4_bank_bus_adr[13:9] == 3'd6);
assign builder_ethernetsoc_csrbank4_crg_reset0_r = builder_ethernetsoc_interface4_bank_bus_dat_w[0];
assign builder_ethernetsoc_csrbank4_crg_reset0_re = ((builder_ethernetsoc_csrbank4_sel & builder_ethernetsoc_interface4_bank_bus_we) & (builder_ethernetsoc_interface4_bank_bus_adr[1:0] == 1'd0));
assign builder_ethernetsoc_csrbank4_mdio_w0_r = builder_ethernetsoc_interface4_bank_bus_dat_w[2:0];
assign builder_ethernetsoc_csrbank4_mdio_w0_re = ((builder_ethernetsoc_csrbank4_sel & builder_ethernetsoc_interface4_bank_bus_we) & (builder_ethernetsoc_interface4_bank_bus_adr[1:0] == 1'd1));
assign builder_ethernetsoc_csrbank4_mdio_r_r = builder_ethernetsoc_interface4_bank_bus_dat_w[0];
assign builder_ethernetsoc_csrbank4_mdio_r_re = ((builder_ethernetsoc_csrbank4_sel & builder_ethernetsoc_interface4_bank_bus_we) & (builder_ethernetsoc_interface4_bank_bus_adr[1:0] == 2'd2));
assign main_ethphy_reset_storage = main_ethphy_reset_storage_full;
assign builder_ethernetsoc_csrbank4_crg_reset0_w = main_ethphy_reset_storage_full;
assign main_ethphy_storage = main_ethphy_storage_full[2:0];
assign builder_ethernetsoc_csrbank4_mdio_w0_w = main_ethphy_storage_full[2:0];
assign builder_ethernetsoc_csrbank4_mdio_r_w = main_ethphy_status;
assign builder_ethernetsoc_csrbank5_sel = (builder_ethernetsoc_interface5_bank_bus_adr[13:9] == 4'd8);
assign builder_ethernetsoc_csrbank5_dfii_control0_r = builder_ethernetsoc_interface5_bank_bus_dat_w[3:0];
assign builder_ethernetsoc_csrbank5_dfii_control0_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 1'd0));
assign builder_ethernetsoc_csrbank5_dfii_pi0_command0_r = builder_ethernetsoc_interface5_bank_bus_dat_w[5:0];
assign builder_ethernetsoc_csrbank5_dfii_pi0_command0_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 1'd1));
assign main_ethernetsoc_sdram_phaseinjector0_command_issue_r = builder_ethernetsoc_interface5_bank_bus_dat_w[0];
assign main_ethernetsoc_sdram_phaseinjector0_command_issue_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 2'd2));
assign builder_ethernetsoc_csrbank5_dfii_pi0_address1_r = builder_ethernetsoc_interface5_bank_bus_dat_w[5:0];
assign builder_ethernetsoc_csrbank5_dfii_pi0_address1_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 2'd3));
assign builder_ethernetsoc_csrbank5_dfii_pi0_address0_r = builder_ethernetsoc_interface5_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank5_dfii_pi0_address0_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 3'd4));
assign builder_ethernetsoc_csrbank5_dfii_pi0_baddress0_r = builder_ethernetsoc_interface5_bank_bus_dat_w[2:0];
assign builder_ethernetsoc_csrbank5_dfii_pi0_baddress0_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 3'd5));
assign builder_ethernetsoc_csrbank5_dfii_pi0_wrdata3_r = builder_ethernetsoc_interface5_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank5_dfii_pi0_wrdata3_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 3'd6));
assign builder_ethernetsoc_csrbank5_dfii_pi0_wrdata2_r = builder_ethernetsoc_interface5_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank5_dfii_pi0_wrdata2_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 3'd7));
assign builder_ethernetsoc_csrbank5_dfii_pi0_wrdata1_r = builder_ethernetsoc_interface5_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank5_dfii_pi0_wrdata1_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 4'd8));
assign builder_ethernetsoc_csrbank5_dfii_pi0_wrdata0_r = builder_ethernetsoc_interface5_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank5_dfii_pi0_wrdata0_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 4'd9));
assign builder_ethernetsoc_csrbank5_dfii_pi0_rddata3_r = builder_ethernetsoc_interface5_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank5_dfii_pi0_rddata3_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 4'd10));
assign builder_ethernetsoc_csrbank5_dfii_pi0_rddata2_r = builder_ethernetsoc_interface5_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank5_dfii_pi0_rddata2_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 4'd11));
assign builder_ethernetsoc_csrbank5_dfii_pi0_rddata1_r = builder_ethernetsoc_interface5_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank5_dfii_pi0_rddata1_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 4'd12));
assign builder_ethernetsoc_csrbank5_dfii_pi0_rddata0_r = builder_ethernetsoc_interface5_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank5_dfii_pi0_rddata0_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 4'd13));
assign builder_ethernetsoc_csrbank5_dfii_pi1_command0_r = builder_ethernetsoc_interface5_bank_bus_dat_w[5:0];
assign builder_ethernetsoc_csrbank5_dfii_pi1_command0_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 4'd14));
assign main_ethernetsoc_sdram_phaseinjector1_command_issue_r = builder_ethernetsoc_interface5_bank_bus_dat_w[0];
assign main_ethernetsoc_sdram_phaseinjector1_command_issue_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 4'd15));
assign builder_ethernetsoc_csrbank5_dfii_pi1_address1_r = builder_ethernetsoc_interface5_bank_bus_dat_w[5:0];
assign builder_ethernetsoc_csrbank5_dfii_pi1_address1_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 5'd16));
assign builder_ethernetsoc_csrbank5_dfii_pi1_address0_r = builder_ethernetsoc_interface5_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank5_dfii_pi1_address0_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 5'd17));
assign builder_ethernetsoc_csrbank5_dfii_pi1_baddress0_r = builder_ethernetsoc_interface5_bank_bus_dat_w[2:0];
assign builder_ethernetsoc_csrbank5_dfii_pi1_baddress0_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 5'd18));
assign builder_ethernetsoc_csrbank5_dfii_pi1_wrdata3_r = builder_ethernetsoc_interface5_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank5_dfii_pi1_wrdata3_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 5'd19));
assign builder_ethernetsoc_csrbank5_dfii_pi1_wrdata2_r = builder_ethernetsoc_interface5_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank5_dfii_pi1_wrdata2_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 5'd20));
assign builder_ethernetsoc_csrbank5_dfii_pi1_wrdata1_r = builder_ethernetsoc_interface5_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank5_dfii_pi1_wrdata1_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 5'd21));
assign builder_ethernetsoc_csrbank5_dfii_pi1_wrdata0_r = builder_ethernetsoc_interface5_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank5_dfii_pi1_wrdata0_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 5'd22));
assign builder_ethernetsoc_csrbank5_dfii_pi1_rddata3_r = builder_ethernetsoc_interface5_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank5_dfii_pi1_rddata3_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 5'd23));
assign builder_ethernetsoc_csrbank5_dfii_pi1_rddata2_r = builder_ethernetsoc_interface5_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank5_dfii_pi1_rddata2_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 5'd24));
assign builder_ethernetsoc_csrbank5_dfii_pi1_rddata1_r = builder_ethernetsoc_interface5_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank5_dfii_pi1_rddata1_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 5'd25));
assign builder_ethernetsoc_csrbank5_dfii_pi1_rddata0_r = builder_ethernetsoc_interface5_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank5_dfii_pi1_rddata0_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 5'd26));
assign builder_ethernetsoc_csrbank5_dfii_pi2_command0_r = builder_ethernetsoc_interface5_bank_bus_dat_w[5:0];
assign builder_ethernetsoc_csrbank5_dfii_pi2_command0_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 5'd27));
assign main_ethernetsoc_sdram_phaseinjector2_command_issue_r = builder_ethernetsoc_interface5_bank_bus_dat_w[0];
assign main_ethernetsoc_sdram_phaseinjector2_command_issue_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 5'd28));
assign builder_ethernetsoc_csrbank5_dfii_pi2_address1_r = builder_ethernetsoc_interface5_bank_bus_dat_w[5:0];
assign builder_ethernetsoc_csrbank5_dfii_pi2_address1_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 5'd29));
assign builder_ethernetsoc_csrbank5_dfii_pi2_address0_r = builder_ethernetsoc_interface5_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank5_dfii_pi2_address0_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 5'd30));
assign builder_ethernetsoc_csrbank5_dfii_pi2_baddress0_r = builder_ethernetsoc_interface5_bank_bus_dat_w[2:0];
assign builder_ethernetsoc_csrbank5_dfii_pi2_baddress0_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 5'd31));
assign builder_ethernetsoc_csrbank5_dfii_pi2_wrdata3_r = builder_ethernetsoc_interface5_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank5_dfii_pi2_wrdata3_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 6'd32));
assign builder_ethernetsoc_csrbank5_dfii_pi2_wrdata2_r = builder_ethernetsoc_interface5_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank5_dfii_pi2_wrdata2_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 6'd33));
assign builder_ethernetsoc_csrbank5_dfii_pi2_wrdata1_r = builder_ethernetsoc_interface5_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank5_dfii_pi2_wrdata1_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 6'd34));
assign builder_ethernetsoc_csrbank5_dfii_pi2_wrdata0_r = builder_ethernetsoc_interface5_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank5_dfii_pi2_wrdata0_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 6'd35));
assign builder_ethernetsoc_csrbank5_dfii_pi2_rddata3_r = builder_ethernetsoc_interface5_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank5_dfii_pi2_rddata3_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 6'd36));
assign builder_ethernetsoc_csrbank5_dfii_pi2_rddata2_r = builder_ethernetsoc_interface5_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank5_dfii_pi2_rddata2_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 6'd37));
assign builder_ethernetsoc_csrbank5_dfii_pi2_rddata1_r = builder_ethernetsoc_interface5_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank5_dfii_pi2_rddata1_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 6'd38));
assign builder_ethernetsoc_csrbank5_dfii_pi2_rddata0_r = builder_ethernetsoc_interface5_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank5_dfii_pi2_rddata0_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 6'd39));
assign builder_ethernetsoc_csrbank5_dfii_pi3_command0_r = builder_ethernetsoc_interface5_bank_bus_dat_w[5:0];
assign builder_ethernetsoc_csrbank5_dfii_pi3_command0_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 6'd40));
assign main_ethernetsoc_sdram_phaseinjector3_command_issue_r = builder_ethernetsoc_interface5_bank_bus_dat_w[0];
assign main_ethernetsoc_sdram_phaseinjector3_command_issue_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 6'd41));
assign builder_ethernetsoc_csrbank5_dfii_pi3_address1_r = builder_ethernetsoc_interface5_bank_bus_dat_w[5:0];
assign builder_ethernetsoc_csrbank5_dfii_pi3_address1_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 6'd42));
assign builder_ethernetsoc_csrbank5_dfii_pi3_address0_r = builder_ethernetsoc_interface5_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank5_dfii_pi3_address0_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 6'd43));
assign builder_ethernetsoc_csrbank5_dfii_pi3_baddress0_r = builder_ethernetsoc_interface5_bank_bus_dat_w[2:0];
assign builder_ethernetsoc_csrbank5_dfii_pi3_baddress0_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 6'd44));
assign builder_ethernetsoc_csrbank5_dfii_pi3_wrdata3_r = builder_ethernetsoc_interface5_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank5_dfii_pi3_wrdata3_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 6'd45));
assign builder_ethernetsoc_csrbank5_dfii_pi3_wrdata2_r = builder_ethernetsoc_interface5_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank5_dfii_pi3_wrdata2_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 6'd46));
assign builder_ethernetsoc_csrbank5_dfii_pi3_wrdata1_r = builder_ethernetsoc_interface5_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank5_dfii_pi3_wrdata1_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 6'd47));
assign builder_ethernetsoc_csrbank5_dfii_pi3_wrdata0_r = builder_ethernetsoc_interface5_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank5_dfii_pi3_wrdata0_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 6'd48));
assign builder_ethernetsoc_csrbank5_dfii_pi3_rddata3_r = builder_ethernetsoc_interface5_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank5_dfii_pi3_rddata3_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 6'd49));
assign builder_ethernetsoc_csrbank5_dfii_pi3_rddata2_r = builder_ethernetsoc_interface5_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank5_dfii_pi3_rddata2_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 6'd50));
assign builder_ethernetsoc_csrbank5_dfii_pi3_rddata1_r = builder_ethernetsoc_interface5_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank5_dfii_pi3_rddata1_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 6'd51));
assign builder_ethernetsoc_csrbank5_dfii_pi3_rddata0_r = builder_ethernetsoc_interface5_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank5_dfii_pi3_rddata0_re = ((builder_ethernetsoc_csrbank5_sel & builder_ethernetsoc_interface5_bank_bus_we) & (builder_ethernetsoc_interface5_bank_bus_adr[5:0] == 6'd52));
assign main_ethernetsoc_sdram_storage = main_ethernetsoc_sdram_storage_full[3:0];
assign builder_ethernetsoc_csrbank5_dfii_control0_w = main_ethernetsoc_sdram_storage_full[3:0];
assign main_ethernetsoc_sdram_phaseinjector0_command_storage = main_ethernetsoc_sdram_phaseinjector0_command_storage_full[5:0];
assign builder_ethernetsoc_csrbank5_dfii_pi0_command0_w = main_ethernetsoc_sdram_phaseinjector0_command_storage_full[5:0];
assign main_ethernetsoc_sdram_phaseinjector0_address_storage = main_ethernetsoc_sdram_phaseinjector0_address_storage_full[13:0];
assign builder_ethernetsoc_csrbank5_dfii_pi0_address1_w = main_ethernetsoc_sdram_phaseinjector0_address_storage_full[13:8];
assign builder_ethernetsoc_csrbank5_dfii_pi0_address0_w = main_ethernetsoc_sdram_phaseinjector0_address_storage_full[7:0];
assign main_ethernetsoc_sdram_phaseinjector0_baddress_storage = main_ethernetsoc_sdram_phaseinjector0_baddress_storage_full[2:0];
assign builder_ethernetsoc_csrbank5_dfii_pi0_baddress0_w = main_ethernetsoc_sdram_phaseinjector0_baddress_storage_full[2:0];
assign main_ethernetsoc_sdram_phaseinjector0_wrdata_storage = main_ethernetsoc_sdram_phaseinjector0_wrdata_storage_full[31:0];
assign builder_ethernetsoc_csrbank5_dfii_pi0_wrdata3_w = main_ethernetsoc_sdram_phaseinjector0_wrdata_storage_full[31:24];
assign builder_ethernetsoc_csrbank5_dfii_pi0_wrdata2_w = main_ethernetsoc_sdram_phaseinjector0_wrdata_storage_full[23:16];
assign builder_ethernetsoc_csrbank5_dfii_pi0_wrdata1_w = main_ethernetsoc_sdram_phaseinjector0_wrdata_storage_full[15:8];
assign builder_ethernetsoc_csrbank5_dfii_pi0_wrdata0_w = main_ethernetsoc_sdram_phaseinjector0_wrdata_storage_full[7:0];
assign builder_ethernetsoc_csrbank5_dfii_pi0_rddata3_w = main_ethernetsoc_sdram_phaseinjector0_status[31:24];
assign builder_ethernetsoc_csrbank5_dfii_pi0_rddata2_w = main_ethernetsoc_sdram_phaseinjector0_status[23:16];
assign builder_ethernetsoc_csrbank5_dfii_pi0_rddata1_w = main_ethernetsoc_sdram_phaseinjector0_status[15:8];
assign builder_ethernetsoc_csrbank5_dfii_pi0_rddata0_w = main_ethernetsoc_sdram_phaseinjector0_status[7:0];
assign main_ethernetsoc_sdram_phaseinjector1_command_storage = main_ethernetsoc_sdram_phaseinjector1_command_storage_full[5:0];
assign builder_ethernetsoc_csrbank5_dfii_pi1_command0_w = main_ethernetsoc_sdram_phaseinjector1_command_storage_full[5:0];
assign main_ethernetsoc_sdram_phaseinjector1_address_storage = main_ethernetsoc_sdram_phaseinjector1_address_storage_full[13:0];
assign builder_ethernetsoc_csrbank5_dfii_pi1_address1_w = main_ethernetsoc_sdram_phaseinjector1_address_storage_full[13:8];
assign builder_ethernetsoc_csrbank5_dfii_pi1_address0_w = main_ethernetsoc_sdram_phaseinjector1_address_storage_full[7:0];
assign main_ethernetsoc_sdram_phaseinjector1_baddress_storage = main_ethernetsoc_sdram_phaseinjector1_baddress_storage_full[2:0];
assign builder_ethernetsoc_csrbank5_dfii_pi1_baddress0_w = main_ethernetsoc_sdram_phaseinjector1_baddress_storage_full[2:0];
assign main_ethernetsoc_sdram_phaseinjector1_wrdata_storage = main_ethernetsoc_sdram_phaseinjector1_wrdata_storage_full[31:0];
assign builder_ethernetsoc_csrbank5_dfii_pi1_wrdata3_w = main_ethernetsoc_sdram_phaseinjector1_wrdata_storage_full[31:24];
assign builder_ethernetsoc_csrbank5_dfii_pi1_wrdata2_w = main_ethernetsoc_sdram_phaseinjector1_wrdata_storage_full[23:16];
assign builder_ethernetsoc_csrbank5_dfii_pi1_wrdata1_w = main_ethernetsoc_sdram_phaseinjector1_wrdata_storage_full[15:8];
assign builder_ethernetsoc_csrbank5_dfii_pi1_wrdata0_w = main_ethernetsoc_sdram_phaseinjector1_wrdata_storage_full[7:0];
assign builder_ethernetsoc_csrbank5_dfii_pi1_rddata3_w = main_ethernetsoc_sdram_phaseinjector1_status[31:24];
assign builder_ethernetsoc_csrbank5_dfii_pi1_rddata2_w = main_ethernetsoc_sdram_phaseinjector1_status[23:16];
assign builder_ethernetsoc_csrbank5_dfii_pi1_rddata1_w = main_ethernetsoc_sdram_phaseinjector1_status[15:8];
assign builder_ethernetsoc_csrbank5_dfii_pi1_rddata0_w = main_ethernetsoc_sdram_phaseinjector1_status[7:0];
assign main_ethernetsoc_sdram_phaseinjector2_command_storage = main_ethernetsoc_sdram_phaseinjector2_command_storage_full[5:0];
assign builder_ethernetsoc_csrbank5_dfii_pi2_command0_w = main_ethernetsoc_sdram_phaseinjector2_command_storage_full[5:0];
assign main_ethernetsoc_sdram_phaseinjector2_address_storage = main_ethernetsoc_sdram_phaseinjector2_address_storage_full[13:0];
assign builder_ethernetsoc_csrbank5_dfii_pi2_address1_w = main_ethernetsoc_sdram_phaseinjector2_address_storage_full[13:8];
assign builder_ethernetsoc_csrbank5_dfii_pi2_address0_w = main_ethernetsoc_sdram_phaseinjector2_address_storage_full[7:0];
assign main_ethernetsoc_sdram_phaseinjector2_baddress_storage = main_ethernetsoc_sdram_phaseinjector2_baddress_storage_full[2:0];
assign builder_ethernetsoc_csrbank5_dfii_pi2_baddress0_w = main_ethernetsoc_sdram_phaseinjector2_baddress_storage_full[2:0];
assign main_ethernetsoc_sdram_phaseinjector2_wrdata_storage = main_ethernetsoc_sdram_phaseinjector2_wrdata_storage_full[31:0];
assign builder_ethernetsoc_csrbank5_dfii_pi2_wrdata3_w = main_ethernetsoc_sdram_phaseinjector2_wrdata_storage_full[31:24];
assign builder_ethernetsoc_csrbank5_dfii_pi2_wrdata2_w = main_ethernetsoc_sdram_phaseinjector2_wrdata_storage_full[23:16];
assign builder_ethernetsoc_csrbank5_dfii_pi2_wrdata1_w = main_ethernetsoc_sdram_phaseinjector2_wrdata_storage_full[15:8];
assign builder_ethernetsoc_csrbank5_dfii_pi2_wrdata0_w = main_ethernetsoc_sdram_phaseinjector2_wrdata_storage_full[7:0];
assign builder_ethernetsoc_csrbank5_dfii_pi2_rddata3_w = main_ethernetsoc_sdram_phaseinjector2_status[31:24];
assign builder_ethernetsoc_csrbank5_dfii_pi2_rddata2_w = main_ethernetsoc_sdram_phaseinjector2_status[23:16];
assign builder_ethernetsoc_csrbank5_dfii_pi2_rddata1_w = main_ethernetsoc_sdram_phaseinjector2_status[15:8];
assign builder_ethernetsoc_csrbank5_dfii_pi2_rddata0_w = main_ethernetsoc_sdram_phaseinjector2_status[7:0];
assign main_ethernetsoc_sdram_phaseinjector3_command_storage = main_ethernetsoc_sdram_phaseinjector3_command_storage_full[5:0];
assign builder_ethernetsoc_csrbank5_dfii_pi3_command0_w = main_ethernetsoc_sdram_phaseinjector3_command_storage_full[5:0];
assign main_ethernetsoc_sdram_phaseinjector3_address_storage = main_ethernetsoc_sdram_phaseinjector3_address_storage_full[13:0];
assign builder_ethernetsoc_csrbank5_dfii_pi3_address1_w = main_ethernetsoc_sdram_phaseinjector3_address_storage_full[13:8];
assign builder_ethernetsoc_csrbank5_dfii_pi3_address0_w = main_ethernetsoc_sdram_phaseinjector3_address_storage_full[7:0];
assign main_ethernetsoc_sdram_phaseinjector3_baddress_storage = main_ethernetsoc_sdram_phaseinjector3_baddress_storage_full[2:0];
assign builder_ethernetsoc_csrbank5_dfii_pi3_baddress0_w = main_ethernetsoc_sdram_phaseinjector3_baddress_storage_full[2:0];
assign main_ethernetsoc_sdram_phaseinjector3_wrdata_storage = main_ethernetsoc_sdram_phaseinjector3_wrdata_storage_full[31:0];
assign builder_ethernetsoc_csrbank5_dfii_pi3_wrdata3_w = main_ethernetsoc_sdram_phaseinjector3_wrdata_storage_full[31:24];
assign builder_ethernetsoc_csrbank5_dfii_pi3_wrdata2_w = main_ethernetsoc_sdram_phaseinjector3_wrdata_storage_full[23:16];
assign builder_ethernetsoc_csrbank5_dfii_pi3_wrdata1_w = main_ethernetsoc_sdram_phaseinjector3_wrdata_storage_full[15:8];
assign builder_ethernetsoc_csrbank5_dfii_pi3_wrdata0_w = main_ethernetsoc_sdram_phaseinjector3_wrdata_storage_full[7:0];
assign builder_ethernetsoc_csrbank5_dfii_pi3_rddata3_w = main_ethernetsoc_sdram_phaseinjector3_status[31:24];
assign builder_ethernetsoc_csrbank5_dfii_pi3_rddata2_w = main_ethernetsoc_sdram_phaseinjector3_status[23:16];
assign builder_ethernetsoc_csrbank5_dfii_pi3_rddata1_w = main_ethernetsoc_sdram_phaseinjector3_status[15:8];
assign builder_ethernetsoc_csrbank5_dfii_pi3_rddata0_w = main_ethernetsoc_sdram_phaseinjector3_status[7:0];
assign builder_ethernetsoc_csrbank6_sel = (builder_ethernetsoc_interface6_bank_bus_adr[13:9] == 3'd4);
assign builder_ethernetsoc_csrbank6_load3_r = builder_ethernetsoc_interface6_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank6_load3_re = ((builder_ethernetsoc_csrbank6_sel & builder_ethernetsoc_interface6_bank_bus_we) & (builder_ethernetsoc_interface6_bank_bus_adr[4:0] == 1'd0));
assign builder_ethernetsoc_csrbank6_load2_r = builder_ethernetsoc_interface6_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank6_load2_re = ((builder_ethernetsoc_csrbank6_sel & builder_ethernetsoc_interface6_bank_bus_we) & (builder_ethernetsoc_interface6_bank_bus_adr[4:0] == 1'd1));
assign builder_ethernetsoc_csrbank6_load1_r = builder_ethernetsoc_interface6_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank6_load1_re = ((builder_ethernetsoc_csrbank6_sel & builder_ethernetsoc_interface6_bank_bus_we) & (builder_ethernetsoc_interface6_bank_bus_adr[4:0] == 2'd2));
assign builder_ethernetsoc_csrbank6_load0_r = builder_ethernetsoc_interface6_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank6_load0_re = ((builder_ethernetsoc_csrbank6_sel & builder_ethernetsoc_interface6_bank_bus_we) & (builder_ethernetsoc_interface6_bank_bus_adr[4:0] == 2'd3));
assign builder_ethernetsoc_csrbank6_reload3_r = builder_ethernetsoc_interface6_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank6_reload3_re = ((builder_ethernetsoc_csrbank6_sel & builder_ethernetsoc_interface6_bank_bus_we) & (builder_ethernetsoc_interface6_bank_bus_adr[4:0] == 3'd4));
assign builder_ethernetsoc_csrbank6_reload2_r = builder_ethernetsoc_interface6_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank6_reload2_re = ((builder_ethernetsoc_csrbank6_sel & builder_ethernetsoc_interface6_bank_bus_we) & (builder_ethernetsoc_interface6_bank_bus_adr[4:0] == 3'd5));
assign builder_ethernetsoc_csrbank6_reload1_r = builder_ethernetsoc_interface6_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank6_reload1_re = ((builder_ethernetsoc_csrbank6_sel & builder_ethernetsoc_interface6_bank_bus_we) & (builder_ethernetsoc_interface6_bank_bus_adr[4:0] == 3'd6));
assign builder_ethernetsoc_csrbank6_reload0_r = builder_ethernetsoc_interface6_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank6_reload0_re = ((builder_ethernetsoc_csrbank6_sel & builder_ethernetsoc_interface6_bank_bus_we) & (builder_ethernetsoc_interface6_bank_bus_adr[4:0] == 3'd7));
assign builder_ethernetsoc_csrbank6_en0_r = builder_ethernetsoc_interface6_bank_bus_dat_w[0];
assign builder_ethernetsoc_csrbank6_en0_re = ((builder_ethernetsoc_csrbank6_sel & builder_ethernetsoc_interface6_bank_bus_we) & (builder_ethernetsoc_interface6_bank_bus_adr[4:0] == 4'd8));
assign main_ethernetsoc_timer0_update_value_r = builder_ethernetsoc_interface6_bank_bus_dat_w[0];
assign main_ethernetsoc_timer0_update_value_re = ((builder_ethernetsoc_csrbank6_sel & builder_ethernetsoc_interface6_bank_bus_we) & (builder_ethernetsoc_interface6_bank_bus_adr[4:0] == 4'd9));
assign builder_ethernetsoc_csrbank6_value3_r = builder_ethernetsoc_interface6_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank6_value3_re = ((builder_ethernetsoc_csrbank6_sel & builder_ethernetsoc_interface6_bank_bus_we) & (builder_ethernetsoc_interface6_bank_bus_adr[4:0] == 4'd10));
assign builder_ethernetsoc_csrbank6_value2_r = builder_ethernetsoc_interface6_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank6_value2_re = ((builder_ethernetsoc_csrbank6_sel & builder_ethernetsoc_interface6_bank_bus_we) & (builder_ethernetsoc_interface6_bank_bus_adr[4:0] == 4'd11));
assign builder_ethernetsoc_csrbank6_value1_r = builder_ethernetsoc_interface6_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank6_value1_re = ((builder_ethernetsoc_csrbank6_sel & builder_ethernetsoc_interface6_bank_bus_we) & (builder_ethernetsoc_interface6_bank_bus_adr[4:0] == 4'd12));
assign builder_ethernetsoc_csrbank6_value0_r = builder_ethernetsoc_interface6_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank6_value0_re = ((builder_ethernetsoc_csrbank6_sel & builder_ethernetsoc_interface6_bank_bus_we) & (builder_ethernetsoc_interface6_bank_bus_adr[4:0] == 4'd13));
assign main_ethernetsoc_timer0_eventmanager_status_r = builder_ethernetsoc_interface6_bank_bus_dat_w[0];
assign main_ethernetsoc_timer0_eventmanager_status_re = ((builder_ethernetsoc_csrbank6_sel & builder_ethernetsoc_interface6_bank_bus_we) & (builder_ethernetsoc_interface6_bank_bus_adr[4:0] == 4'd14));
assign main_ethernetsoc_timer0_eventmanager_pending_r = builder_ethernetsoc_interface6_bank_bus_dat_w[0];
assign main_ethernetsoc_timer0_eventmanager_pending_re = ((builder_ethernetsoc_csrbank6_sel & builder_ethernetsoc_interface6_bank_bus_we) & (builder_ethernetsoc_interface6_bank_bus_adr[4:0] == 4'd15));
assign builder_ethernetsoc_csrbank6_ev_enable0_r = builder_ethernetsoc_interface6_bank_bus_dat_w[0];
assign builder_ethernetsoc_csrbank6_ev_enable0_re = ((builder_ethernetsoc_csrbank6_sel & builder_ethernetsoc_interface6_bank_bus_we) & (builder_ethernetsoc_interface6_bank_bus_adr[4:0] == 5'd16));
assign main_ethernetsoc_timer0_load_storage = main_ethernetsoc_timer0_load_storage_full[31:0];
assign builder_ethernetsoc_csrbank6_load3_w = main_ethernetsoc_timer0_load_storage_full[31:24];
assign builder_ethernetsoc_csrbank6_load2_w = main_ethernetsoc_timer0_load_storage_full[23:16];
assign builder_ethernetsoc_csrbank6_load1_w = main_ethernetsoc_timer0_load_storage_full[15:8];
assign builder_ethernetsoc_csrbank6_load0_w = main_ethernetsoc_timer0_load_storage_full[7:0];
assign main_ethernetsoc_timer0_reload_storage = main_ethernetsoc_timer0_reload_storage_full[31:0];
assign builder_ethernetsoc_csrbank6_reload3_w = main_ethernetsoc_timer0_reload_storage_full[31:24];
assign builder_ethernetsoc_csrbank6_reload2_w = main_ethernetsoc_timer0_reload_storage_full[23:16];
assign builder_ethernetsoc_csrbank6_reload1_w = main_ethernetsoc_timer0_reload_storage_full[15:8];
assign builder_ethernetsoc_csrbank6_reload0_w = main_ethernetsoc_timer0_reload_storage_full[7:0];
assign main_ethernetsoc_timer0_en_storage = main_ethernetsoc_timer0_en_storage_full;
assign builder_ethernetsoc_csrbank6_en0_w = main_ethernetsoc_timer0_en_storage_full;
assign builder_ethernetsoc_csrbank6_value3_w = main_ethernetsoc_timer0_value_status[31:24];
assign builder_ethernetsoc_csrbank6_value2_w = main_ethernetsoc_timer0_value_status[23:16];
assign builder_ethernetsoc_csrbank6_value1_w = main_ethernetsoc_timer0_value_status[15:8];
assign builder_ethernetsoc_csrbank6_value0_w = main_ethernetsoc_timer0_value_status[7:0];
assign main_ethernetsoc_timer0_eventmanager_storage = main_ethernetsoc_timer0_eventmanager_storage_full;
assign builder_ethernetsoc_csrbank6_ev_enable0_w = main_ethernetsoc_timer0_eventmanager_storage_full;
assign builder_ethernetsoc_csrbank7_sel = (builder_ethernetsoc_interface7_bank_bus_adr[13:9] == 2'd3);
assign main_ethernetsoc_uart_rxtx_r = builder_ethernetsoc_interface7_bank_bus_dat_w[7:0];
assign main_ethernetsoc_uart_rxtx_re = ((builder_ethernetsoc_csrbank7_sel & builder_ethernetsoc_interface7_bank_bus_we) & (builder_ethernetsoc_interface7_bank_bus_adr[2:0] == 1'd0));
assign builder_ethernetsoc_csrbank7_txfull_r = builder_ethernetsoc_interface7_bank_bus_dat_w[0];
assign builder_ethernetsoc_csrbank7_txfull_re = ((builder_ethernetsoc_csrbank7_sel & builder_ethernetsoc_interface7_bank_bus_we) & (builder_ethernetsoc_interface7_bank_bus_adr[2:0] == 1'd1));
assign builder_ethernetsoc_csrbank7_rxempty_r = builder_ethernetsoc_interface7_bank_bus_dat_w[0];
assign builder_ethernetsoc_csrbank7_rxempty_re = ((builder_ethernetsoc_csrbank7_sel & builder_ethernetsoc_interface7_bank_bus_we) & (builder_ethernetsoc_interface7_bank_bus_adr[2:0] == 2'd2));
assign main_ethernetsoc_uart_eventmanager_status_r = builder_ethernetsoc_interface7_bank_bus_dat_w[1:0];
assign main_ethernetsoc_uart_eventmanager_status_re = ((builder_ethernetsoc_csrbank7_sel & builder_ethernetsoc_interface7_bank_bus_we) & (builder_ethernetsoc_interface7_bank_bus_adr[2:0] == 2'd3));
assign main_ethernetsoc_uart_eventmanager_pending_r = builder_ethernetsoc_interface7_bank_bus_dat_w[1:0];
assign main_ethernetsoc_uart_eventmanager_pending_re = ((builder_ethernetsoc_csrbank7_sel & builder_ethernetsoc_interface7_bank_bus_we) & (builder_ethernetsoc_interface7_bank_bus_adr[2:0] == 3'd4));
assign builder_ethernetsoc_csrbank7_ev_enable0_r = builder_ethernetsoc_interface7_bank_bus_dat_w[1:0];
assign builder_ethernetsoc_csrbank7_ev_enable0_re = ((builder_ethernetsoc_csrbank7_sel & builder_ethernetsoc_interface7_bank_bus_we) & (builder_ethernetsoc_interface7_bank_bus_adr[2:0] == 3'd5));
assign builder_ethernetsoc_csrbank7_txfull_w = main_ethernetsoc_uart_txfull_status;
assign builder_ethernetsoc_csrbank7_rxempty_w = main_ethernetsoc_uart_rxempty_status;
assign main_ethernetsoc_uart_eventmanager_storage = main_ethernetsoc_uart_eventmanager_storage_full[1:0];
assign builder_ethernetsoc_csrbank7_ev_enable0_w = main_ethernetsoc_uart_eventmanager_storage_full[1:0];
assign builder_ethernetsoc_csrbank8_sel = (builder_ethernetsoc_interface8_bank_bus_adr[13:9] == 2'd2);
assign builder_ethernetsoc_csrbank8_tuning_word3_r = builder_ethernetsoc_interface8_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank8_tuning_word3_re = ((builder_ethernetsoc_csrbank8_sel & builder_ethernetsoc_interface8_bank_bus_we) & (builder_ethernetsoc_interface8_bank_bus_adr[1:0] == 1'd0));
assign builder_ethernetsoc_csrbank8_tuning_word2_r = builder_ethernetsoc_interface8_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank8_tuning_word2_re = ((builder_ethernetsoc_csrbank8_sel & builder_ethernetsoc_interface8_bank_bus_we) & (builder_ethernetsoc_interface8_bank_bus_adr[1:0] == 1'd1));
assign builder_ethernetsoc_csrbank8_tuning_word1_r = builder_ethernetsoc_interface8_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank8_tuning_word1_re = ((builder_ethernetsoc_csrbank8_sel & builder_ethernetsoc_interface8_bank_bus_we) & (builder_ethernetsoc_interface8_bank_bus_adr[1:0] == 2'd2));
assign builder_ethernetsoc_csrbank8_tuning_word0_r = builder_ethernetsoc_interface8_bank_bus_dat_w[7:0];
assign builder_ethernetsoc_csrbank8_tuning_word0_re = ((builder_ethernetsoc_csrbank8_sel & builder_ethernetsoc_interface8_bank_bus_we) & (builder_ethernetsoc_interface8_bank_bus_adr[1:0] == 2'd3));
assign main_ethernetsoc_uart_phy_storage = main_ethernetsoc_uart_phy_storage_full[31:0];
assign builder_ethernetsoc_csrbank8_tuning_word3_w = main_ethernetsoc_uart_phy_storage_full[31:24];
assign builder_ethernetsoc_csrbank8_tuning_word2_w = main_ethernetsoc_uart_phy_storage_full[23:16];
assign builder_ethernetsoc_csrbank8_tuning_word1_w = main_ethernetsoc_uart_phy_storage_full[15:8];
assign builder_ethernetsoc_csrbank8_tuning_word0_w = main_ethernetsoc_uart_phy_storage_full[7:0];
assign builder_ethernetsoc_adr = main_ethernetsoc_interface_adr;
assign builder_ethernetsoc_we = main_ethernetsoc_interface_we;
assign builder_ethernetsoc_dat_w = main_ethernetsoc_interface_dat_w;
assign main_ethernetsoc_interface_dat_r = builder_ethernetsoc_dat_r;
assign builder_ethernetsoc_interface0_bank_bus_adr = builder_ethernetsoc_adr;
assign builder_ethernetsoc_interface1_bank_bus_adr = builder_ethernetsoc_adr;
assign builder_ethernetsoc_interface2_bank_bus_adr = builder_ethernetsoc_adr;
assign builder_ethernetsoc_interface3_bank_bus_adr = builder_ethernetsoc_adr;
assign builder_ethernetsoc_interface4_bank_bus_adr = builder_ethernetsoc_adr;
assign builder_ethernetsoc_interface5_bank_bus_adr = builder_ethernetsoc_adr;
assign builder_ethernetsoc_interface6_bank_bus_adr = builder_ethernetsoc_adr;
assign builder_ethernetsoc_interface7_bank_bus_adr = builder_ethernetsoc_adr;
assign builder_ethernetsoc_interface8_bank_bus_adr = builder_ethernetsoc_adr;
assign builder_ethernetsoc_interface0_bank_bus_we = builder_ethernetsoc_we;
assign builder_ethernetsoc_interface1_bank_bus_we = builder_ethernetsoc_we;
assign builder_ethernetsoc_interface2_bank_bus_we = builder_ethernetsoc_we;
assign builder_ethernetsoc_interface3_bank_bus_we = builder_ethernetsoc_we;
assign builder_ethernetsoc_interface4_bank_bus_we = builder_ethernetsoc_we;
assign builder_ethernetsoc_interface5_bank_bus_we = builder_ethernetsoc_we;
assign builder_ethernetsoc_interface6_bank_bus_we = builder_ethernetsoc_we;
assign builder_ethernetsoc_interface7_bank_bus_we = builder_ethernetsoc_we;
assign builder_ethernetsoc_interface8_bank_bus_we = builder_ethernetsoc_we;
assign builder_ethernetsoc_interface0_bank_bus_dat_w = builder_ethernetsoc_dat_w;
assign builder_ethernetsoc_interface1_bank_bus_dat_w = builder_ethernetsoc_dat_w;
assign builder_ethernetsoc_interface2_bank_bus_dat_w = builder_ethernetsoc_dat_w;
assign builder_ethernetsoc_interface3_bank_bus_dat_w = builder_ethernetsoc_dat_w;
assign builder_ethernetsoc_interface4_bank_bus_dat_w = builder_ethernetsoc_dat_w;
assign builder_ethernetsoc_interface5_bank_bus_dat_w = builder_ethernetsoc_dat_w;
assign builder_ethernetsoc_interface6_bank_bus_dat_w = builder_ethernetsoc_dat_w;
assign builder_ethernetsoc_interface7_bank_bus_dat_w = builder_ethernetsoc_dat_w;
assign builder_ethernetsoc_interface8_bank_bus_dat_w = builder_ethernetsoc_dat_w;
assign builder_ethernetsoc_dat_r = ((((((((builder_ethernetsoc_interface0_bank_bus_dat_r | builder_ethernetsoc_interface1_bank_bus_dat_r) | builder_ethernetsoc_interface2_bank_bus_dat_r) | builder_ethernetsoc_interface3_bank_bus_dat_r) | builder_ethernetsoc_interface4_bank_bus_dat_r) | builder_ethernetsoc_interface5_bank_bus_dat_r) | builder_ethernetsoc_interface6_bank_bus_dat_r) | builder_ethernetsoc_interface7_bank_bus_dat_r) | builder_ethernetsoc_interface8_bank_bus_dat_r);
always @(*) begin
	builder_rhs_array_muxed0 <= 1'd0;
	case (main_ethernetsoc_sdram_choose_cmd_grant)
		1'd0: begin
			builder_rhs_array_muxed0 <= main_ethernetsoc_sdram_choose_cmd_valids[0];
		end
		1'd1: begin
			builder_rhs_array_muxed0 <= main_ethernetsoc_sdram_choose_cmd_valids[1];
		end
		2'd2: begin
			builder_rhs_array_muxed0 <= main_ethernetsoc_sdram_choose_cmd_valids[2];
		end
		2'd3: begin
			builder_rhs_array_muxed0 <= main_ethernetsoc_sdram_choose_cmd_valids[3];
		end
		3'd4: begin
			builder_rhs_array_muxed0 <= main_ethernetsoc_sdram_choose_cmd_valids[4];
		end
		3'd5: begin
			builder_rhs_array_muxed0 <= main_ethernetsoc_sdram_choose_cmd_valids[5];
		end
		3'd6: begin
			builder_rhs_array_muxed0 <= main_ethernetsoc_sdram_choose_cmd_valids[6];
		end
		default: begin
			builder_rhs_array_muxed0 <= main_ethernetsoc_sdram_choose_cmd_valids[7];
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed1 <= 14'd0;
	case (main_ethernetsoc_sdram_choose_cmd_grant)
		1'd0: begin
			builder_rhs_array_muxed1 <= main_ethernetsoc_sdram_bankmachine0_cmd_payload_a;
		end
		1'd1: begin
			builder_rhs_array_muxed1 <= main_ethernetsoc_sdram_bankmachine1_cmd_payload_a;
		end
		2'd2: begin
			builder_rhs_array_muxed1 <= main_ethernetsoc_sdram_bankmachine2_cmd_payload_a;
		end
		2'd3: begin
			builder_rhs_array_muxed1 <= main_ethernetsoc_sdram_bankmachine3_cmd_payload_a;
		end
		3'd4: begin
			builder_rhs_array_muxed1 <= main_ethernetsoc_sdram_bankmachine4_cmd_payload_a;
		end
		3'd5: begin
			builder_rhs_array_muxed1 <= main_ethernetsoc_sdram_bankmachine5_cmd_payload_a;
		end
		3'd6: begin
			builder_rhs_array_muxed1 <= main_ethernetsoc_sdram_bankmachine6_cmd_payload_a;
		end
		default: begin
			builder_rhs_array_muxed1 <= main_ethernetsoc_sdram_bankmachine7_cmd_payload_a;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed2 <= 3'd0;
	case (main_ethernetsoc_sdram_choose_cmd_grant)
		1'd0: begin
			builder_rhs_array_muxed2 <= main_ethernetsoc_sdram_bankmachine0_cmd_payload_ba;
		end
		1'd1: begin
			builder_rhs_array_muxed2 <= main_ethernetsoc_sdram_bankmachine1_cmd_payload_ba;
		end
		2'd2: begin
			builder_rhs_array_muxed2 <= main_ethernetsoc_sdram_bankmachine2_cmd_payload_ba;
		end
		2'd3: begin
			builder_rhs_array_muxed2 <= main_ethernetsoc_sdram_bankmachine3_cmd_payload_ba;
		end
		3'd4: begin
			builder_rhs_array_muxed2 <= main_ethernetsoc_sdram_bankmachine4_cmd_payload_ba;
		end
		3'd5: begin
			builder_rhs_array_muxed2 <= main_ethernetsoc_sdram_bankmachine5_cmd_payload_ba;
		end
		3'd6: begin
			builder_rhs_array_muxed2 <= main_ethernetsoc_sdram_bankmachine6_cmd_payload_ba;
		end
		default: begin
			builder_rhs_array_muxed2 <= main_ethernetsoc_sdram_bankmachine7_cmd_payload_ba;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed3 <= 1'd0;
	case (main_ethernetsoc_sdram_choose_cmd_grant)
		1'd0: begin
			builder_rhs_array_muxed3 <= main_ethernetsoc_sdram_bankmachine0_cmd_payload_is_read;
		end
		1'd1: begin
			builder_rhs_array_muxed3 <= main_ethernetsoc_sdram_bankmachine1_cmd_payload_is_read;
		end
		2'd2: begin
			builder_rhs_array_muxed3 <= main_ethernetsoc_sdram_bankmachine2_cmd_payload_is_read;
		end
		2'd3: begin
			builder_rhs_array_muxed3 <= main_ethernetsoc_sdram_bankmachine3_cmd_payload_is_read;
		end
		3'd4: begin
			builder_rhs_array_muxed3 <= main_ethernetsoc_sdram_bankmachine4_cmd_payload_is_read;
		end
		3'd5: begin
			builder_rhs_array_muxed3 <= main_ethernetsoc_sdram_bankmachine5_cmd_payload_is_read;
		end
		3'd6: begin
			builder_rhs_array_muxed3 <= main_ethernetsoc_sdram_bankmachine6_cmd_payload_is_read;
		end
		default: begin
			builder_rhs_array_muxed3 <= main_ethernetsoc_sdram_bankmachine7_cmd_payload_is_read;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed4 <= 1'd0;
	case (main_ethernetsoc_sdram_choose_cmd_grant)
		1'd0: begin
			builder_rhs_array_muxed4 <= main_ethernetsoc_sdram_bankmachine0_cmd_payload_is_write;
		end
		1'd1: begin
			builder_rhs_array_muxed4 <= main_ethernetsoc_sdram_bankmachine1_cmd_payload_is_write;
		end
		2'd2: begin
			builder_rhs_array_muxed4 <= main_ethernetsoc_sdram_bankmachine2_cmd_payload_is_write;
		end
		2'd3: begin
			builder_rhs_array_muxed4 <= main_ethernetsoc_sdram_bankmachine3_cmd_payload_is_write;
		end
		3'd4: begin
			builder_rhs_array_muxed4 <= main_ethernetsoc_sdram_bankmachine4_cmd_payload_is_write;
		end
		3'd5: begin
			builder_rhs_array_muxed4 <= main_ethernetsoc_sdram_bankmachine5_cmd_payload_is_write;
		end
		3'd6: begin
			builder_rhs_array_muxed4 <= main_ethernetsoc_sdram_bankmachine6_cmd_payload_is_write;
		end
		default: begin
			builder_rhs_array_muxed4 <= main_ethernetsoc_sdram_bankmachine7_cmd_payload_is_write;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed5 <= 1'd0;
	case (main_ethernetsoc_sdram_choose_cmd_grant)
		1'd0: begin
			builder_rhs_array_muxed5 <= main_ethernetsoc_sdram_bankmachine0_cmd_payload_is_cmd;
		end
		1'd1: begin
			builder_rhs_array_muxed5 <= main_ethernetsoc_sdram_bankmachine1_cmd_payload_is_cmd;
		end
		2'd2: begin
			builder_rhs_array_muxed5 <= main_ethernetsoc_sdram_bankmachine2_cmd_payload_is_cmd;
		end
		2'd3: begin
			builder_rhs_array_muxed5 <= main_ethernetsoc_sdram_bankmachine3_cmd_payload_is_cmd;
		end
		3'd4: begin
			builder_rhs_array_muxed5 <= main_ethernetsoc_sdram_bankmachine4_cmd_payload_is_cmd;
		end
		3'd5: begin
			builder_rhs_array_muxed5 <= main_ethernetsoc_sdram_bankmachine5_cmd_payload_is_cmd;
		end
		3'd6: begin
			builder_rhs_array_muxed5 <= main_ethernetsoc_sdram_bankmachine6_cmd_payload_is_cmd;
		end
		default: begin
			builder_rhs_array_muxed5 <= main_ethernetsoc_sdram_bankmachine7_cmd_payload_is_cmd;
		end
	endcase
end
always @(*) begin
	builder_t_array_muxed0 <= 1'd0;
	case (main_ethernetsoc_sdram_choose_cmd_grant)
		1'd0: begin
			builder_t_array_muxed0 <= main_ethernetsoc_sdram_bankmachine0_cmd_payload_cas;
		end
		1'd1: begin
			builder_t_array_muxed0 <= main_ethernetsoc_sdram_bankmachine1_cmd_payload_cas;
		end
		2'd2: begin
			builder_t_array_muxed0 <= main_ethernetsoc_sdram_bankmachine2_cmd_payload_cas;
		end
		2'd3: begin
			builder_t_array_muxed0 <= main_ethernetsoc_sdram_bankmachine3_cmd_payload_cas;
		end
		3'd4: begin
			builder_t_array_muxed0 <= main_ethernetsoc_sdram_bankmachine4_cmd_payload_cas;
		end
		3'd5: begin
			builder_t_array_muxed0 <= main_ethernetsoc_sdram_bankmachine5_cmd_payload_cas;
		end
		3'd6: begin
			builder_t_array_muxed0 <= main_ethernetsoc_sdram_bankmachine6_cmd_payload_cas;
		end
		default: begin
			builder_t_array_muxed0 <= main_ethernetsoc_sdram_bankmachine7_cmd_payload_cas;
		end
	endcase
end
always @(*) begin
	builder_t_array_muxed1 <= 1'd0;
	case (main_ethernetsoc_sdram_choose_cmd_grant)
		1'd0: begin
			builder_t_array_muxed1 <= main_ethernetsoc_sdram_bankmachine0_cmd_payload_ras;
		end
		1'd1: begin
			builder_t_array_muxed1 <= main_ethernetsoc_sdram_bankmachine1_cmd_payload_ras;
		end
		2'd2: begin
			builder_t_array_muxed1 <= main_ethernetsoc_sdram_bankmachine2_cmd_payload_ras;
		end
		2'd3: begin
			builder_t_array_muxed1 <= main_ethernetsoc_sdram_bankmachine3_cmd_payload_ras;
		end
		3'd4: begin
			builder_t_array_muxed1 <= main_ethernetsoc_sdram_bankmachine4_cmd_payload_ras;
		end
		3'd5: begin
			builder_t_array_muxed1 <= main_ethernetsoc_sdram_bankmachine5_cmd_payload_ras;
		end
		3'd6: begin
			builder_t_array_muxed1 <= main_ethernetsoc_sdram_bankmachine6_cmd_payload_ras;
		end
		default: begin
			builder_t_array_muxed1 <= main_ethernetsoc_sdram_bankmachine7_cmd_payload_ras;
		end
	endcase
end
always @(*) begin
	builder_t_array_muxed2 <= 1'd0;
	case (main_ethernetsoc_sdram_choose_cmd_grant)
		1'd0: begin
			builder_t_array_muxed2 <= main_ethernetsoc_sdram_bankmachine0_cmd_payload_we;
		end
		1'd1: begin
			builder_t_array_muxed2 <= main_ethernetsoc_sdram_bankmachine1_cmd_payload_we;
		end
		2'd2: begin
			builder_t_array_muxed2 <= main_ethernetsoc_sdram_bankmachine2_cmd_payload_we;
		end
		2'd3: begin
			builder_t_array_muxed2 <= main_ethernetsoc_sdram_bankmachine3_cmd_payload_we;
		end
		3'd4: begin
			builder_t_array_muxed2 <= main_ethernetsoc_sdram_bankmachine4_cmd_payload_we;
		end
		3'd5: begin
			builder_t_array_muxed2 <= main_ethernetsoc_sdram_bankmachine5_cmd_payload_we;
		end
		3'd6: begin
			builder_t_array_muxed2 <= main_ethernetsoc_sdram_bankmachine6_cmd_payload_we;
		end
		default: begin
			builder_t_array_muxed2 <= main_ethernetsoc_sdram_bankmachine7_cmd_payload_we;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed6 <= 1'd0;
	case (main_ethernetsoc_sdram_choose_req_grant)
		1'd0: begin
			builder_rhs_array_muxed6 <= main_ethernetsoc_sdram_choose_req_valids[0];
		end
		1'd1: begin
			builder_rhs_array_muxed6 <= main_ethernetsoc_sdram_choose_req_valids[1];
		end
		2'd2: begin
			builder_rhs_array_muxed6 <= main_ethernetsoc_sdram_choose_req_valids[2];
		end
		2'd3: begin
			builder_rhs_array_muxed6 <= main_ethernetsoc_sdram_choose_req_valids[3];
		end
		3'd4: begin
			builder_rhs_array_muxed6 <= main_ethernetsoc_sdram_choose_req_valids[4];
		end
		3'd5: begin
			builder_rhs_array_muxed6 <= main_ethernetsoc_sdram_choose_req_valids[5];
		end
		3'd6: begin
			builder_rhs_array_muxed6 <= main_ethernetsoc_sdram_choose_req_valids[6];
		end
		default: begin
			builder_rhs_array_muxed6 <= main_ethernetsoc_sdram_choose_req_valids[7];
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed7 <= 14'd0;
	case (main_ethernetsoc_sdram_choose_req_grant)
		1'd0: begin
			builder_rhs_array_muxed7 <= main_ethernetsoc_sdram_bankmachine0_cmd_payload_a;
		end
		1'd1: begin
			builder_rhs_array_muxed7 <= main_ethernetsoc_sdram_bankmachine1_cmd_payload_a;
		end
		2'd2: begin
			builder_rhs_array_muxed7 <= main_ethernetsoc_sdram_bankmachine2_cmd_payload_a;
		end
		2'd3: begin
			builder_rhs_array_muxed7 <= main_ethernetsoc_sdram_bankmachine3_cmd_payload_a;
		end
		3'd4: begin
			builder_rhs_array_muxed7 <= main_ethernetsoc_sdram_bankmachine4_cmd_payload_a;
		end
		3'd5: begin
			builder_rhs_array_muxed7 <= main_ethernetsoc_sdram_bankmachine5_cmd_payload_a;
		end
		3'd6: begin
			builder_rhs_array_muxed7 <= main_ethernetsoc_sdram_bankmachine6_cmd_payload_a;
		end
		default: begin
			builder_rhs_array_muxed7 <= main_ethernetsoc_sdram_bankmachine7_cmd_payload_a;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed8 <= 3'd0;
	case (main_ethernetsoc_sdram_choose_req_grant)
		1'd0: begin
			builder_rhs_array_muxed8 <= main_ethernetsoc_sdram_bankmachine0_cmd_payload_ba;
		end
		1'd1: begin
			builder_rhs_array_muxed8 <= main_ethernetsoc_sdram_bankmachine1_cmd_payload_ba;
		end
		2'd2: begin
			builder_rhs_array_muxed8 <= main_ethernetsoc_sdram_bankmachine2_cmd_payload_ba;
		end
		2'd3: begin
			builder_rhs_array_muxed8 <= main_ethernetsoc_sdram_bankmachine3_cmd_payload_ba;
		end
		3'd4: begin
			builder_rhs_array_muxed8 <= main_ethernetsoc_sdram_bankmachine4_cmd_payload_ba;
		end
		3'd5: begin
			builder_rhs_array_muxed8 <= main_ethernetsoc_sdram_bankmachine5_cmd_payload_ba;
		end
		3'd6: begin
			builder_rhs_array_muxed8 <= main_ethernetsoc_sdram_bankmachine6_cmd_payload_ba;
		end
		default: begin
			builder_rhs_array_muxed8 <= main_ethernetsoc_sdram_bankmachine7_cmd_payload_ba;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed9 <= 1'd0;
	case (main_ethernetsoc_sdram_choose_req_grant)
		1'd0: begin
			builder_rhs_array_muxed9 <= main_ethernetsoc_sdram_bankmachine0_cmd_payload_is_read;
		end
		1'd1: begin
			builder_rhs_array_muxed9 <= main_ethernetsoc_sdram_bankmachine1_cmd_payload_is_read;
		end
		2'd2: begin
			builder_rhs_array_muxed9 <= main_ethernetsoc_sdram_bankmachine2_cmd_payload_is_read;
		end
		2'd3: begin
			builder_rhs_array_muxed9 <= main_ethernetsoc_sdram_bankmachine3_cmd_payload_is_read;
		end
		3'd4: begin
			builder_rhs_array_muxed9 <= main_ethernetsoc_sdram_bankmachine4_cmd_payload_is_read;
		end
		3'd5: begin
			builder_rhs_array_muxed9 <= main_ethernetsoc_sdram_bankmachine5_cmd_payload_is_read;
		end
		3'd6: begin
			builder_rhs_array_muxed9 <= main_ethernetsoc_sdram_bankmachine6_cmd_payload_is_read;
		end
		default: begin
			builder_rhs_array_muxed9 <= main_ethernetsoc_sdram_bankmachine7_cmd_payload_is_read;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed10 <= 1'd0;
	case (main_ethernetsoc_sdram_choose_req_grant)
		1'd0: begin
			builder_rhs_array_muxed10 <= main_ethernetsoc_sdram_bankmachine0_cmd_payload_is_write;
		end
		1'd1: begin
			builder_rhs_array_muxed10 <= main_ethernetsoc_sdram_bankmachine1_cmd_payload_is_write;
		end
		2'd2: begin
			builder_rhs_array_muxed10 <= main_ethernetsoc_sdram_bankmachine2_cmd_payload_is_write;
		end
		2'd3: begin
			builder_rhs_array_muxed10 <= main_ethernetsoc_sdram_bankmachine3_cmd_payload_is_write;
		end
		3'd4: begin
			builder_rhs_array_muxed10 <= main_ethernetsoc_sdram_bankmachine4_cmd_payload_is_write;
		end
		3'd5: begin
			builder_rhs_array_muxed10 <= main_ethernetsoc_sdram_bankmachine5_cmd_payload_is_write;
		end
		3'd6: begin
			builder_rhs_array_muxed10 <= main_ethernetsoc_sdram_bankmachine6_cmd_payload_is_write;
		end
		default: begin
			builder_rhs_array_muxed10 <= main_ethernetsoc_sdram_bankmachine7_cmd_payload_is_write;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed11 <= 1'd0;
	case (main_ethernetsoc_sdram_choose_req_grant)
		1'd0: begin
			builder_rhs_array_muxed11 <= main_ethernetsoc_sdram_bankmachine0_cmd_payload_is_cmd;
		end
		1'd1: begin
			builder_rhs_array_muxed11 <= main_ethernetsoc_sdram_bankmachine1_cmd_payload_is_cmd;
		end
		2'd2: begin
			builder_rhs_array_muxed11 <= main_ethernetsoc_sdram_bankmachine2_cmd_payload_is_cmd;
		end
		2'd3: begin
			builder_rhs_array_muxed11 <= main_ethernetsoc_sdram_bankmachine3_cmd_payload_is_cmd;
		end
		3'd4: begin
			builder_rhs_array_muxed11 <= main_ethernetsoc_sdram_bankmachine4_cmd_payload_is_cmd;
		end
		3'd5: begin
			builder_rhs_array_muxed11 <= main_ethernetsoc_sdram_bankmachine5_cmd_payload_is_cmd;
		end
		3'd6: begin
			builder_rhs_array_muxed11 <= main_ethernetsoc_sdram_bankmachine6_cmd_payload_is_cmd;
		end
		default: begin
			builder_rhs_array_muxed11 <= main_ethernetsoc_sdram_bankmachine7_cmd_payload_is_cmd;
		end
	endcase
end
always @(*) begin
	builder_t_array_muxed3 <= 1'd0;
	case (main_ethernetsoc_sdram_choose_req_grant)
		1'd0: begin
			builder_t_array_muxed3 <= main_ethernetsoc_sdram_bankmachine0_cmd_payload_cas;
		end
		1'd1: begin
			builder_t_array_muxed3 <= main_ethernetsoc_sdram_bankmachine1_cmd_payload_cas;
		end
		2'd2: begin
			builder_t_array_muxed3 <= main_ethernetsoc_sdram_bankmachine2_cmd_payload_cas;
		end
		2'd3: begin
			builder_t_array_muxed3 <= main_ethernetsoc_sdram_bankmachine3_cmd_payload_cas;
		end
		3'd4: begin
			builder_t_array_muxed3 <= main_ethernetsoc_sdram_bankmachine4_cmd_payload_cas;
		end
		3'd5: begin
			builder_t_array_muxed3 <= main_ethernetsoc_sdram_bankmachine5_cmd_payload_cas;
		end
		3'd6: begin
			builder_t_array_muxed3 <= main_ethernetsoc_sdram_bankmachine6_cmd_payload_cas;
		end
		default: begin
			builder_t_array_muxed3 <= main_ethernetsoc_sdram_bankmachine7_cmd_payload_cas;
		end
	endcase
end
always @(*) begin
	builder_t_array_muxed4 <= 1'd0;
	case (main_ethernetsoc_sdram_choose_req_grant)
		1'd0: begin
			builder_t_array_muxed4 <= main_ethernetsoc_sdram_bankmachine0_cmd_payload_ras;
		end
		1'd1: begin
			builder_t_array_muxed4 <= main_ethernetsoc_sdram_bankmachine1_cmd_payload_ras;
		end
		2'd2: begin
			builder_t_array_muxed4 <= main_ethernetsoc_sdram_bankmachine2_cmd_payload_ras;
		end
		2'd3: begin
			builder_t_array_muxed4 <= main_ethernetsoc_sdram_bankmachine3_cmd_payload_ras;
		end
		3'd4: begin
			builder_t_array_muxed4 <= main_ethernetsoc_sdram_bankmachine4_cmd_payload_ras;
		end
		3'd5: begin
			builder_t_array_muxed4 <= main_ethernetsoc_sdram_bankmachine5_cmd_payload_ras;
		end
		3'd6: begin
			builder_t_array_muxed4 <= main_ethernetsoc_sdram_bankmachine6_cmd_payload_ras;
		end
		default: begin
			builder_t_array_muxed4 <= main_ethernetsoc_sdram_bankmachine7_cmd_payload_ras;
		end
	endcase
end
always @(*) begin
	builder_t_array_muxed5 <= 1'd0;
	case (main_ethernetsoc_sdram_choose_req_grant)
		1'd0: begin
			builder_t_array_muxed5 <= main_ethernetsoc_sdram_bankmachine0_cmd_payload_we;
		end
		1'd1: begin
			builder_t_array_muxed5 <= main_ethernetsoc_sdram_bankmachine1_cmd_payload_we;
		end
		2'd2: begin
			builder_t_array_muxed5 <= main_ethernetsoc_sdram_bankmachine2_cmd_payload_we;
		end
		2'd3: begin
			builder_t_array_muxed5 <= main_ethernetsoc_sdram_bankmachine3_cmd_payload_we;
		end
		3'd4: begin
			builder_t_array_muxed5 <= main_ethernetsoc_sdram_bankmachine4_cmd_payload_we;
		end
		3'd5: begin
			builder_t_array_muxed5 <= main_ethernetsoc_sdram_bankmachine5_cmd_payload_we;
		end
		3'd6: begin
			builder_t_array_muxed5 <= main_ethernetsoc_sdram_bankmachine6_cmd_payload_we;
		end
		default: begin
			builder_t_array_muxed5 <= main_ethernetsoc_sdram_bankmachine7_cmd_payload_we;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed12 <= 21'd0;
	case (builder_roundrobin0_grant)
		default: begin
			builder_rhs_array_muxed12 <= {main_ethernetsoc_port_cmd_payload_addr[23:10], main_ethernetsoc_port_cmd_payload_addr[6:0]};
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed13 <= 1'd0;
	case (builder_roundrobin0_grant)
		default: begin
			builder_rhs_array_muxed13 <= main_ethernetsoc_port_cmd_payload_we;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed14 <= 1'd0;
	case (builder_roundrobin0_grant)
		default: begin
			builder_rhs_array_muxed14 <= (((main_ethernetsoc_port_cmd_payload_addr[9:7] == 1'd0) & (~(((((((builder_locked0 | (main_ethernetsoc_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0))))) & main_ethernetsoc_port_cmd_valid);
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed15 <= 21'd0;
	case (builder_roundrobin1_grant)
		default: begin
			builder_rhs_array_muxed15 <= {main_ethernetsoc_port_cmd_payload_addr[23:10], main_ethernetsoc_port_cmd_payload_addr[6:0]};
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed16 <= 1'd0;
	case (builder_roundrobin1_grant)
		default: begin
			builder_rhs_array_muxed16 <= main_ethernetsoc_port_cmd_payload_we;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed17 <= 1'd0;
	case (builder_roundrobin1_grant)
		default: begin
			builder_rhs_array_muxed17 <= (((main_ethernetsoc_port_cmd_payload_addr[9:7] == 1'd1) & (~(((((((builder_locked1 | (main_ethernetsoc_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0))))) & main_ethernetsoc_port_cmd_valid);
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed18 <= 21'd0;
	case (builder_roundrobin2_grant)
		default: begin
			builder_rhs_array_muxed18 <= {main_ethernetsoc_port_cmd_payload_addr[23:10], main_ethernetsoc_port_cmd_payload_addr[6:0]};
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed19 <= 1'd0;
	case (builder_roundrobin2_grant)
		default: begin
			builder_rhs_array_muxed19 <= main_ethernetsoc_port_cmd_payload_we;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed20 <= 1'd0;
	case (builder_roundrobin2_grant)
		default: begin
			builder_rhs_array_muxed20 <= (((main_ethernetsoc_port_cmd_payload_addr[9:7] == 2'd2) & (~(((((((builder_locked2 | (main_ethernetsoc_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0))))) & main_ethernetsoc_port_cmd_valid);
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed21 <= 21'd0;
	case (builder_roundrobin3_grant)
		default: begin
			builder_rhs_array_muxed21 <= {main_ethernetsoc_port_cmd_payload_addr[23:10], main_ethernetsoc_port_cmd_payload_addr[6:0]};
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed22 <= 1'd0;
	case (builder_roundrobin3_grant)
		default: begin
			builder_rhs_array_muxed22 <= main_ethernetsoc_port_cmd_payload_we;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed23 <= 1'd0;
	case (builder_roundrobin3_grant)
		default: begin
			builder_rhs_array_muxed23 <= (((main_ethernetsoc_port_cmd_payload_addr[9:7] == 2'd3) & (~(((((((builder_locked3 | (main_ethernetsoc_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0))))) & main_ethernetsoc_port_cmd_valid);
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed24 <= 21'd0;
	case (builder_roundrobin4_grant)
		default: begin
			builder_rhs_array_muxed24 <= {main_ethernetsoc_port_cmd_payload_addr[23:10], main_ethernetsoc_port_cmd_payload_addr[6:0]};
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed25 <= 1'd0;
	case (builder_roundrobin4_grant)
		default: begin
			builder_rhs_array_muxed25 <= main_ethernetsoc_port_cmd_payload_we;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed26 <= 1'd0;
	case (builder_roundrobin4_grant)
		default: begin
			builder_rhs_array_muxed26 <= (((main_ethernetsoc_port_cmd_payload_addr[9:7] == 3'd4) & (~(((((((builder_locked4 | (main_ethernetsoc_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0))))) & main_ethernetsoc_port_cmd_valid);
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed27 <= 21'd0;
	case (builder_roundrobin5_grant)
		default: begin
			builder_rhs_array_muxed27 <= {main_ethernetsoc_port_cmd_payload_addr[23:10], main_ethernetsoc_port_cmd_payload_addr[6:0]};
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed28 <= 1'd0;
	case (builder_roundrobin5_grant)
		default: begin
			builder_rhs_array_muxed28 <= main_ethernetsoc_port_cmd_payload_we;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed29 <= 1'd0;
	case (builder_roundrobin5_grant)
		default: begin
			builder_rhs_array_muxed29 <= (((main_ethernetsoc_port_cmd_payload_addr[9:7] == 3'd5) & (~(((((((builder_locked5 | (main_ethernetsoc_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0))))) & main_ethernetsoc_port_cmd_valid);
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed30 <= 21'd0;
	case (builder_roundrobin6_grant)
		default: begin
			builder_rhs_array_muxed30 <= {main_ethernetsoc_port_cmd_payload_addr[23:10], main_ethernetsoc_port_cmd_payload_addr[6:0]};
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed31 <= 1'd0;
	case (builder_roundrobin6_grant)
		default: begin
			builder_rhs_array_muxed31 <= main_ethernetsoc_port_cmd_payload_we;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed32 <= 1'd0;
	case (builder_roundrobin6_grant)
		default: begin
			builder_rhs_array_muxed32 <= (((main_ethernetsoc_port_cmd_payload_addr[9:7] == 3'd6) & (~(((((((builder_locked6 | (main_ethernetsoc_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank7_lock & (builder_roundrobin7_grant == 1'd0))))) & main_ethernetsoc_port_cmd_valid);
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed33 <= 21'd0;
	case (builder_roundrobin7_grant)
		default: begin
			builder_rhs_array_muxed33 <= {main_ethernetsoc_port_cmd_payload_addr[23:10], main_ethernetsoc_port_cmd_payload_addr[6:0]};
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed34 <= 1'd0;
	case (builder_roundrobin7_grant)
		default: begin
			builder_rhs_array_muxed34 <= main_ethernetsoc_port_cmd_payload_we;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed35 <= 1'd0;
	case (builder_roundrobin7_grant)
		default: begin
			builder_rhs_array_muxed35 <= (((main_ethernetsoc_port_cmd_payload_addr[9:7] == 3'd7) & (~(((((((builder_locked7 | (main_ethernetsoc_sdram_interface_bank0_lock & (builder_roundrobin0_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank1_lock & (builder_roundrobin1_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank2_lock & (builder_roundrobin2_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank3_lock & (builder_roundrobin3_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank4_lock & (builder_roundrobin4_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank5_lock & (builder_roundrobin5_grant == 1'd0))) | (main_ethernetsoc_sdram_interface_bank6_lock & (builder_roundrobin6_grant == 1'd0))))) & main_ethernetsoc_port_cmd_valid);
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed36 <= 30'd0;
	case (builder_wb_sdram_con_grant)
		default: begin
			builder_rhs_array_muxed36 <= main_ethernetsoc_interface1_wb_sdram_adr;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed37 <= 32'd0;
	case (builder_wb_sdram_con_grant)
		default: begin
			builder_rhs_array_muxed37 <= main_ethernetsoc_interface1_wb_sdram_dat_w;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed38 <= 4'd0;
	case (builder_wb_sdram_con_grant)
		default: begin
			builder_rhs_array_muxed38 <= main_ethernetsoc_interface1_wb_sdram_sel;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed39 <= 1'd0;
	case (builder_wb_sdram_con_grant)
		default: begin
			builder_rhs_array_muxed39 <= main_ethernetsoc_interface1_wb_sdram_cyc;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed40 <= 1'd0;
	case (builder_wb_sdram_con_grant)
		default: begin
			builder_rhs_array_muxed40 <= main_ethernetsoc_interface1_wb_sdram_stb;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed41 <= 1'd0;
	case (builder_wb_sdram_con_grant)
		default: begin
			builder_rhs_array_muxed41 <= main_ethernetsoc_interface1_wb_sdram_we;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed42 <= 3'd0;
	case (builder_wb_sdram_con_grant)
		default: begin
			builder_rhs_array_muxed42 <= main_ethernetsoc_interface1_wb_sdram_cti;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed43 <= 2'd0;
	case (builder_wb_sdram_con_grant)
		default: begin
			builder_rhs_array_muxed43 <= main_ethernetsoc_interface1_wb_sdram_bte;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed44 <= 30'd0;
	case (builder_ethernetsoc_grant)
		1'd0: begin
			builder_rhs_array_muxed44 <= main_ethernetsoc_vexriscv_ibus_adr;
		end
		default: begin
			builder_rhs_array_muxed44 <= main_ethernetsoc_vexriscv_dbus_adr;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed45 <= 32'd0;
	case (builder_ethernetsoc_grant)
		1'd0: begin
			builder_rhs_array_muxed45 <= main_ethernetsoc_vexriscv_ibus_dat_w;
		end
		default: begin
			builder_rhs_array_muxed45 <= main_ethernetsoc_vexriscv_dbus_dat_w;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed46 <= 4'd0;
	case (builder_ethernetsoc_grant)
		1'd0: begin
			builder_rhs_array_muxed46 <= main_ethernetsoc_vexriscv_ibus_sel;
		end
		default: begin
			builder_rhs_array_muxed46 <= main_ethernetsoc_vexriscv_dbus_sel;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed47 <= 1'd0;
	case (builder_ethernetsoc_grant)
		1'd0: begin
			builder_rhs_array_muxed47 <= main_ethernetsoc_vexriscv_ibus_cyc;
		end
		default: begin
			builder_rhs_array_muxed47 <= main_ethernetsoc_vexriscv_dbus_cyc;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed48 <= 1'd0;
	case (builder_ethernetsoc_grant)
		1'd0: begin
			builder_rhs_array_muxed48 <= main_ethernetsoc_vexriscv_ibus_stb;
		end
		default: begin
			builder_rhs_array_muxed48 <= main_ethernetsoc_vexriscv_dbus_stb;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed49 <= 1'd0;
	case (builder_ethernetsoc_grant)
		1'd0: begin
			builder_rhs_array_muxed49 <= main_ethernetsoc_vexriscv_ibus_we;
		end
		default: begin
			builder_rhs_array_muxed49 <= main_ethernetsoc_vexriscv_dbus_we;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed50 <= 3'd0;
	case (builder_ethernetsoc_grant)
		1'd0: begin
			builder_rhs_array_muxed50 <= main_ethernetsoc_vexriscv_ibus_cti;
		end
		default: begin
			builder_rhs_array_muxed50 <= main_ethernetsoc_vexriscv_dbus_cti;
		end
	endcase
end
always @(*) begin
	builder_rhs_array_muxed51 <= 2'd0;
	case (builder_ethernetsoc_grant)
		1'd0: begin
			builder_rhs_array_muxed51 <= main_ethernetsoc_vexriscv_ibus_bte;
		end
		default: begin
			builder_rhs_array_muxed51 <= main_ethernetsoc_vexriscv_dbus_bte;
		end
	endcase
end
always @(*) begin
	builder_array_muxed0 <= 3'd0;
	case (main_ethernetsoc_sdram_steerer_sel0)
		1'd0: begin
			builder_array_muxed0 <= main_ethernetsoc_sdram_nop_ba[2:0];
		end
		1'd1: begin
			builder_array_muxed0 <= main_ethernetsoc_sdram_choose_cmd_cmd_payload_ba[2:0];
		end
		2'd2: begin
			builder_array_muxed0 <= main_ethernetsoc_sdram_choose_req_cmd_payload_ba[2:0];
		end
		default: begin
			builder_array_muxed0 <= main_ethernetsoc_sdram_cmd_payload_ba[2:0];
		end
	endcase
end
always @(*) begin
	builder_array_muxed1 <= 14'd0;
	case (main_ethernetsoc_sdram_steerer_sel0)
		1'd0: begin
			builder_array_muxed1 <= main_ethernetsoc_sdram_nop_a;
		end
		1'd1: begin
			builder_array_muxed1 <= main_ethernetsoc_sdram_choose_cmd_cmd_payload_a;
		end
		2'd2: begin
			builder_array_muxed1 <= main_ethernetsoc_sdram_choose_req_cmd_payload_a;
		end
		default: begin
			builder_array_muxed1 <= main_ethernetsoc_sdram_cmd_payload_a;
		end
	endcase
end
always @(*) begin
	builder_array_muxed2 <= 1'd0;
	case (main_ethernetsoc_sdram_steerer_sel0)
		1'd0: begin
			builder_array_muxed2 <= 1'd0;
		end
		1'd1: begin
			builder_array_muxed2 <= ((main_ethernetsoc_sdram_choose_cmd_cmd_valid & main_ethernetsoc_sdram_choose_cmd_cmd_ready) & main_ethernetsoc_sdram_choose_cmd_cmd_payload_cas);
		end
		2'd2: begin
			builder_array_muxed2 <= ((main_ethernetsoc_sdram_choose_req_cmd_valid & main_ethernetsoc_sdram_choose_req_cmd_ready) & main_ethernetsoc_sdram_choose_req_cmd_payload_cas);
		end
		default: begin
			builder_array_muxed2 <= ((main_ethernetsoc_sdram_cmd_valid & main_ethernetsoc_sdram_cmd_ready) & main_ethernetsoc_sdram_cmd_payload_cas);
		end
	endcase
end
always @(*) begin
	builder_array_muxed3 <= 1'd0;
	case (main_ethernetsoc_sdram_steerer_sel0)
		1'd0: begin
			builder_array_muxed3 <= 1'd0;
		end
		1'd1: begin
			builder_array_muxed3 <= ((main_ethernetsoc_sdram_choose_cmd_cmd_valid & main_ethernetsoc_sdram_choose_cmd_cmd_ready) & main_ethernetsoc_sdram_choose_cmd_cmd_payload_ras);
		end
		2'd2: begin
			builder_array_muxed3 <= ((main_ethernetsoc_sdram_choose_req_cmd_valid & main_ethernetsoc_sdram_choose_req_cmd_ready) & main_ethernetsoc_sdram_choose_req_cmd_payload_ras);
		end
		default: begin
			builder_array_muxed3 <= ((main_ethernetsoc_sdram_cmd_valid & main_ethernetsoc_sdram_cmd_ready) & main_ethernetsoc_sdram_cmd_payload_ras);
		end
	endcase
end
always @(*) begin
	builder_array_muxed4 <= 1'd0;
	case (main_ethernetsoc_sdram_steerer_sel0)
		1'd0: begin
			builder_array_muxed4 <= 1'd0;
		end
		1'd1: begin
			builder_array_muxed4 <= ((main_ethernetsoc_sdram_choose_cmd_cmd_valid & main_ethernetsoc_sdram_choose_cmd_cmd_ready) & main_ethernetsoc_sdram_choose_cmd_cmd_payload_we);
		end
		2'd2: begin
			builder_array_muxed4 <= ((main_ethernetsoc_sdram_choose_req_cmd_valid & main_ethernetsoc_sdram_choose_req_cmd_ready) & main_ethernetsoc_sdram_choose_req_cmd_payload_we);
		end
		default: begin
			builder_array_muxed4 <= ((main_ethernetsoc_sdram_cmd_valid & main_ethernetsoc_sdram_cmd_ready) & main_ethernetsoc_sdram_cmd_payload_we);
		end
	endcase
end
always @(*) begin
	builder_array_muxed5 <= 1'd0;
	case (main_ethernetsoc_sdram_steerer_sel0)
		1'd0: begin
			builder_array_muxed5 <= 1'd0;
		end
		1'd1: begin
			builder_array_muxed5 <= ((main_ethernetsoc_sdram_choose_cmd_cmd_valid & main_ethernetsoc_sdram_choose_cmd_cmd_ready) & main_ethernetsoc_sdram_choose_cmd_cmd_payload_is_read);
		end
		2'd2: begin
			builder_array_muxed5 <= ((main_ethernetsoc_sdram_choose_req_cmd_valid & main_ethernetsoc_sdram_choose_req_cmd_ready) & main_ethernetsoc_sdram_choose_req_cmd_payload_is_read);
		end
		default: begin
			builder_array_muxed5 <= ((main_ethernetsoc_sdram_cmd_valid & main_ethernetsoc_sdram_cmd_ready) & main_ethernetsoc_sdram_cmd_payload_is_read);
		end
	endcase
end
always @(*) begin
	builder_array_muxed6 <= 1'd0;
	case (main_ethernetsoc_sdram_steerer_sel0)
		1'd0: begin
			builder_array_muxed6 <= 1'd0;
		end
		1'd1: begin
			builder_array_muxed6 <= ((main_ethernetsoc_sdram_choose_cmd_cmd_valid & main_ethernetsoc_sdram_choose_cmd_cmd_ready) & main_ethernetsoc_sdram_choose_cmd_cmd_payload_is_write);
		end
		2'd2: begin
			builder_array_muxed6 <= ((main_ethernetsoc_sdram_choose_req_cmd_valid & main_ethernetsoc_sdram_choose_req_cmd_ready) & main_ethernetsoc_sdram_choose_req_cmd_payload_is_write);
		end
		default: begin
			builder_array_muxed6 <= ((main_ethernetsoc_sdram_cmd_valid & main_ethernetsoc_sdram_cmd_ready) & main_ethernetsoc_sdram_cmd_payload_is_write);
		end
	endcase
end
always @(*) begin
	builder_array_muxed7 <= 3'd0;
	case (main_ethernetsoc_sdram_steerer_sel1)
		1'd0: begin
			builder_array_muxed7 <= main_ethernetsoc_sdram_nop_ba[2:0];
		end
		1'd1: begin
			builder_array_muxed7 <= main_ethernetsoc_sdram_choose_cmd_cmd_payload_ba[2:0];
		end
		2'd2: begin
			builder_array_muxed7 <= main_ethernetsoc_sdram_choose_req_cmd_payload_ba[2:0];
		end
		default: begin
			builder_array_muxed7 <= main_ethernetsoc_sdram_cmd_payload_ba[2:0];
		end
	endcase
end
always @(*) begin
	builder_array_muxed8 <= 14'd0;
	case (main_ethernetsoc_sdram_steerer_sel1)
		1'd0: begin
			builder_array_muxed8 <= main_ethernetsoc_sdram_nop_a;
		end
		1'd1: begin
			builder_array_muxed8 <= main_ethernetsoc_sdram_choose_cmd_cmd_payload_a;
		end
		2'd2: begin
			builder_array_muxed8 <= main_ethernetsoc_sdram_choose_req_cmd_payload_a;
		end
		default: begin
			builder_array_muxed8 <= main_ethernetsoc_sdram_cmd_payload_a;
		end
	endcase
end
always @(*) begin
	builder_array_muxed9 <= 1'd0;
	case (main_ethernetsoc_sdram_steerer_sel1)
		1'd0: begin
			builder_array_muxed9 <= 1'd0;
		end
		1'd1: begin
			builder_array_muxed9 <= ((main_ethernetsoc_sdram_choose_cmd_cmd_valid & main_ethernetsoc_sdram_choose_cmd_cmd_ready) & main_ethernetsoc_sdram_choose_cmd_cmd_payload_cas);
		end
		2'd2: begin
			builder_array_muxed9 <= ((main_ethernetsoc_sdram_choose_req_cmd_valid & main_ethernetsoc_sdram_choose_req_cmd_ready) & main_ethernetsoc_sdram_choose_req_cmd_payload_cas);
		end
		default: begin
			builder_array_muxed9 <= ((main_ethernetsoc_sdram_cmd_valid & main_ethernetsoc_sdram_cmd_ready) & main_ethernetsoc_sdram_cmd_payload_cas);
		end
	endcase
end
always @(*) begin
	builder_array_muxed10 <= 1'd0;
	case (main_ethernetsoc_sdram_steerer_sel1)
		1'd0: begin
			builder_array_muxed10 <= 1'd0;
		end
		1'd1: begin
			builder_array_muxed10 <= ((main_ethernetsoc_sdram_choose_cmd_cmd_valid & main_ethernetsoc_sdram_choose_cmd_cmd_ready) & main_ethernetsoc_sdram_choose_cmd_cmd_payload_ras);
		end
		2'd2: begin
			builder_array_muxed10 <= ((main_ethernetsoc_sdram_choose_req_cmd_valid & main_ethernetsoc_sdram_choose_req_cmd_ready) & main_ethernetsoc_sdram_choose_req_cmd_payload_ras);
		end
		default: begin
			builder_array_muxed10 <= ((main_ethernetsoc_sdram_cmd_valid & main_ethernetsoc_sdram_cmd_ready) & main_ethernetsoc_sdram_cmd_payload_ras);
		end
	endcase
end
always @(*) begin
	builder_array_muxed11 <= 1'd0;
	case (main_ethernetsoc_sdram_steerer_sel1)
		1'd0: begin
			builder_array_muxed11 <= 1'd0;
		end
		1'd1: begin
			builder_array_muxed11 <= ((main_ethernetsoc_sdram_choose_cmd_cmd_valid & main_ethernetsoc_sdram_choose_cmd_cmd_ready) & main_ethernetsoc_sdram_choose_cmd_cmd_payload_we);
		end
		2'd2: begin
			builder_array_muxed11 <= ((main_ethernetsoc_sdram_choose_req_cmd_valid & main_ethernetsoc_sdram_choose_req_cmd_ready) & main_ethernetsoc_sdram_choose_req_cmd_payload_we);
		end
		default: begin
			builder_array_muxed11 <= ((main_ethernetsoc_sdram_cmd_valid & main_ethernetsoc_sdram_cmd_ready) & main_ethernetsoc_sdram_cmd_payload_we);
		end
	endcase
end
always @(*) begin
	builder_array_muxed12 <= 1'd0;
	case (main_ethernetsoc_sdram_steerer_sel1)
		1'd0: begin
			builder_array_muxed12 <= 1'd0;
		end
		1'd1: begin
			builder_array_muxed12 <= ((main_ethernetsoc_sdram_choose_cmd_cmd_valid & main_ethernetsoc_sdram_choose_cmd_cmd_ready) & main_ethernetsoc_sdram_choose_cmd_cmd_payload_is_read);
		end
		2'd2: begin
			builder_array_muxed12 <= ((main_ethernetsoc_sdram_choose_req_cmd_valid & main_ethernetsoc_sdram_choose_req_cmd_ready) & main_ethernetsoc_sdram_choose_req_cmd_payload_is_read);
		end
		default: begin
			builder_array_muxed12 <= ((main_ethernetsoc_sdram_cmd_valid & main_ethernetsoc_sdram_cmd_ready) & main_ethernetsoc_sdram_cmd_payload_is_read);
		end
	endcase
end
always @(*) begin
	builder_array_muxed13 <= 1'd0;
	case (main_ethernetsoc_sdram_steerer_sel1)
		1'd0: begin
			builder_array_muxed13 <= 1'd0;
		end
		1'd1: begin
			builder_array_muxed13 <= ((main_ethernetsoc_sdram_choose_cmd_cmd_valid & main_ethernetsoc_sdram_choose_cmd_cmd_ready) & main_ethernetsoc_sdram_choose_cmd_cmd_payload_is_write);
		end
		2'd2: begin
			builder_array_muxed13 <= ((main_ethernetsoc_sdram_choose_req_cmd_valid & main_ethernetsoc_sdram_choose_req_cmd_ready) & main_ethernetsoc_sdram_choose_req_cmd_payload_is_write);
		end
		default: begin
			builder_array_muxed13 <= ((main_ethernetsoc_sdram_cmd_valid & main_ethernetsoc_sdram_cmd_ready) & main_ethernetsoc_sdram_cmd_payload_is_write);
		end
	endcase
end
always @(*) begin
	builder_array_muxed14 <= 3'd0;
	case (main_ethernetsoc_sdram_steerer_sel2)
		1'd0: begin
			builder_array_muxed14 <= main_ethernetsoc_sdram_nop_ba[2:0];
		end
		1'd1: begin
			builder_array_muxed14 <= main_ethernetsoc_sdram_choose_cmd_cmd_payload_ba[2:0];
		end
		2'd2: begin
			builder_array_muxed14 <= main_ethernetsoc_sdram_choose_req_cmd_payload_ba[2:0];
		end
		default: begin
			builder_array_muxed14 <= main_ethernetsoc_sdram_cmd_payload_ba[2:0];
		end
	endcase
end
always @(*) begin
	builder_array_muxed15 <= 14'd0;
	case (main_ethernetsoc_sdram_steerer_sel2)
		1'd0: begin
			builder_array_muxed15 <= main_ethernetsoc_sdram_nop_a;
		end
		1'd1: begin
			builder_array_muxed15 <= main_ethernetsoc_sdram_choose_cmd_cmd_payload_a;
		end
		2'd2: begin
			builder_array_muxed15 <= main_ethernetsoc_sdram_choose_req_cmd_payload_a;
		end
		default: begin
			builder_array_muxed15 <= main_ethernetsoc_sdram_cmd_payload_a;
		end
	endcase
end
always @(*) begin
	builder_array_muxed16 <= 1'd0;
	case (main_ethernetsoc_sdram_steerer_sel2)
		1'd0: begin
			builder_array_muxed16 <= 1'd0;
		end
		1'd1: begin
			builder_array_muxed16 <= ((main_ethernetsoc_sdram_choose_cmd_cmd_valid & main_ethernetsoc_sdram_choose_cmd_cmd_ready) & main_ethernetsoc_sdram_choose_cmd_cmd_payload_cas);
		end
		2'd2: begin
			builder_array_muxed16 <= ((main_ethernetsoc_sdram_choose_req_cmd_valid & main_ethernetsoc_sdram_choose_req_cmd_ready) & main_ethernetsoc_sdram_choose_req_cmd_payload_cas);
		end
		default: begin
			builder_array_muxed16 <= ((main_ethernetsoc_sdram_cmd_valid & main_ethernetsoc_sdram_cmd_ready) & main_ethernetsoc_sdram_cmd_payload_cas);
		end
	endcase
end
always @(*) begin
	builder_array_muxed17 <= 1'd0;
	case (main_ethernetsoc_sdram_steerer_sel2)
		1'd0: begin
			builder_array_muxed17 <= 1'd0;
		end
		1'd1: begin
			builder_array_muxed17 <= ((main_ethernetsoc_sdram_choose_cmd_cmd_valid & main_ethernetsoc_sdram_choose_cmd_cmd_ready) & main_ethernetsoc_sdram_choose_cmd_cmd_payload_ras);
		end
		2'd2: begin
			builder_array_muxed17 <= ((main_ethernetsoc_sdram_choose_req_cmd_valid & main_ethernetsoc_sdram_choose_req_cmd_ready) & main_ethernetsoc_sdram_choose_req_cmd_payload_ras);
		end
		default: begin
			builder_array_muxed17 <= ((main_ethernetsoc_sdram_cmd_valid & main_ethernetsoc_sdram_cmd_ready) & main_ethernetsoc_sdram_cmd_payload_ras);
		end
	endcase
end
always @(*) begin
	builder_array_muxed18 <= 1'd0;
	case (main_ethernetsoc_sdram_steerer_sel2)
		1'd0: begin
			builder_array_muxed18 <= 1'd0;
		end
		1'd1: begin
			builder_array_muxed18 <= ((main_ethernetsoc_sdram_choose_cmd_cmd_valid & main_ethernetsoc_sdram_choose_cmd_cmd_ready) & main_ethernetsoc_sdram_choose_cmd_cmd_payload_we);
		end
		2'd2: begin
			builder_array_muxed18 <= ((main_ethernetsoc_sdram_choose_req_cmd_valid & main_ethernetsoc_sdram_choose_req_cmd_ready) & main_ethernetsoc_sdram_choose_req_cmd_payload_we);
		end
		default: begin
			builder_array_muxed18 <= ((main_ethernetsoc_sdram_cmd_valid & main_ethernetsoc_sdram_cmd_ready) & main_ethernetsoc_sdram_cmd_payload_we);
		end
	endcase
end
always @(*) begin
	builder_array_muxed19 <= 1'd0;
	case (main_ethernetsoc_sdram_steerer_sel2)
		1'd0: begin
			builder_array_muxed19 <= 1'd0;
		end
		1'd1: begin
			builder_array_muxed19 <= ((main_ethernetsoc_sdram_choose_cmd_cmd_valid & main_ethernetsoc_sdram_choose_cmd_cmd_ready) & main_ethernetsoc_sdram_choose_cmd_cmd_payload_is_read);
		end
		2'd2: begin
			builder_array_muxed19 <= ((main_ethernetsoc_sdram_choose_req_cmd_valid & main_ethernetsoc_sdram_choose_req_cmd_ready) & main_ethernetsoc_sdram_choose_req_cmd_payload_is_read);
		end
		default: begin
			builder_array_muxed19 <= ((main_ethernetsoc_sdram_cmd_valid & main_ethernetsoc_sdram_cmd_ready) & main_ethernetsoc_sdram_cmd_payload_is_read);
		end
	endcase
end
always @(*) begin
	builder_array_muxed20 <= 1'd0;
	case (main_ethernetsoc_sdram_steerer_sel2)
		1'd0: begin
			builder_array_muxed20 <= 1'd0;
		end
		1'd1: begin
			builder_array_muxed20 <= ((main_ethernetsoc_sdram_choose_cmd_cmd_valid & main_ethernetsoc_sdram_choose_cmd_cmd_ready) & main_ethernetsoc_sdram_choose_cmd_cmd_payload_is_write);
		end
		2'd2: begin
			builder_array_muxed20 <= ((main_ethernetsoc_sdram_choose_req_cmd_valid & main_ethernetsoc_sdram_choose_req_cmd_ready) & main_ethernetsoc_sdram_choose_req_cmd_payload_is_write);
		end
		default: begin
			builder_array_muxed20 <= ((main_ethernetsoc_sdram_cmd_valid & main_ethernetsoc_sdram_cmd_ready) & main_ethernetsoc_sdram_cmd_payload_is_write);
		end
	endcase
end
always @(*) begin
	builder_array_muxed21 <= 3'd0;
	case (main_ethernetsoc_sdram_steerer_sel3)
		1'd0: begin
			builder_array_muxed21 <= main_ethernetsoc_sdram_nop_ba[2:0];
		end
		1'd1: begin
			builder_array_muxed21 <= main_ethernetsoc_sdram_choose_cmd_cmd_payload_ba[2:0];
		end
		2'd2: begin
			builder_array_muxed21 <= main_ethernetsoc_sdram_choose_req_cmd_payload_ba[2:0];
		end
		default: begin
			builder_array_muxed21 <= main_ethernetsoc_sdram_cmd_payload_ba[2:0];
		end
	endcase
end
always @(*) begin
	builder_array_muxed22 <= 14'd0;
	case (main_ethernetsoc_sdram_steerer_sel3)
		1'd0: begin
			builder_array_muxed22 <= main_ethernetsoc_sdram_nop_a;
		end
		1'd1: begin
			builder_array_muxed22 <= main_ethernetsoc_sdram_choose_cmd_cmd_payload_a;
		end
		2'd2: begin
			builder_array_muxed22 <= main_ethernetsoc_sdram_choose_req_cmd_payload_a;
		end
		default: begin
			builder_array_muxed22 <= main_ethernetsoc_sdram_cmd_payload_a;
		end
	endcase
end
always @(*) begin
	builder_array_muxed23 <= 1'd0;
	case (main_ethernetsoc_sdram_steerer_sel3)
		1'd0: begin
			builder_array_muxed23 <= 1'd0;
		end
		1'd1: begin
			builder_array_muxed23 <= ((main_ethernetsoc_sdram_choose_cmd_cmd_valid & main_ethernetsoc_sdram_choose_cmd_cmd_ready) & main_ethernetsoc_sdram_choose_cmd_cmd_payload_cas);
		end
		2'd2: begin
			builder_array_muxed23 <= ((main_ethernetsoc_sdram_choose_req_cmd_valid & main_ethernetsoc_sdram_choose_req_cmd_ready) & main_ethernetsoc_sdram_choose_req_cmd_payload_cas);
		end
		default: begin
			builder_array_muxed23 <= ((main_ethernetsoc_sdram_cmd_valid & main_ethernetsoc_sdram_cmd_ready) & main_ethernetsoc_sdram_cmd_payload_cas);
		end
	endcase
end
always @(*) begin
	builder_array_muxed24 <= 1'd0;
	case (main_ethernetsoc_sdram_steerer_sel3)
		1'd0: begin
			builder_array_muxed24 <= 1'd0;
		end
		1'd1: begin
			builder_array_muxed24 <= ((main_ethernetsoc_sdram_choose_cmd_cmd_valid & main_ethernetsoc_sdram_choose_cmd_cmd_ready) & main_ethernetsoc_sdram_choose_cmd_cmd_payload_ras);
		end
		2'd2: begin
			builder_array_muxed24 <= ((main_ethernetsoc_sdram_choose_req_cmd_valid & main_ethernetsoc_sdram_choose_req_cmd_ready) & main_ethernetsoc_sdram_choose_req_cmd_payload_ras);
		end
		default: begin
			builder_array_muxed24 <= ((main_ethernetsoc_sdram_cmd_valid & main_ethernetsoc_sdram_cmd_ready) & main_ethernetsoc_sdram_cmd_payload_ras);
		end
	endcase
end
always @(*) begin
	builder_array_muxed25 <= 1'd0;
	case (main_ethernetsoc_sdram_steerer_sel3)
		1'd0: begin
			builder_array_muxed25 <= 1'd0;
		end
		1'd1: begin
			builder_array_muxed25 <= ((main_ethernetsoc_sdram_choose_cmd_cmd_valid & main_ethernetsoc_sdram_choose_cmd_cmd_ready) & main_ethernetsoc_sdram_choose_cmd_cmd_payload_we);
		end
		2'd2: begin
			builder_array_muxed25 <= ((main_ethernetsoc_sdram_choose_req_cmd_valid & main_ethernetsoc_sdram_choose_req_cmd_ready) & main_ethernetsoc_sdram_choose_req_cmd_payload_we);
		end
		default: begin
			builder_array_muxed25 <= ((main_ethernetsoc_sdram_cmd_valid & main_ethernetsoc_sdram_cmd_ready) & main_ethernetsoc_sdram_cmd_payload_we);
		end
	endcase
end
always @(*) begin
	builder_array_muxed26 <= 1'd0;
	case (main_ethernetsoc_sdram_steerer_sel3)
		1'd0: begin
			builder_array_muxed26 <= 1'd0;
		end
		1'd1: begin
			builder_array_muxed26 <= ((main_ethernetsoc_sdram_choose_cmd_cmd_valid & main_ethernetsoc_sdram_choose_cmd_cmd_ready) & main_ethernetsoc_sdram_choose_cmd_cmd_payload_is_read);
		end
		2'd2: begin
			builder_array_muxed26 <= ((main_ethernetsoc_sdram_choose_req_cmd_valid & main_ethernetsoc_sdram_choose_req_cmd_ready) & main_ethernetsoc_sdram_choose_req_cmd_payload_is_read);
		end
		default: begin
			builder_array_muxed26 <= ((main_ethernetsoc_sdram_cmd_valid & main_ethernetsoc_sdram_cmd_ready) & main_ethernetsoc_sdram_cmd_payload_is_read);
		end
	endcase
end
always @(*) begin
	builder_array_muxed27 <= 1'd0;
	case (main_ethernetsoc_sdram_steerer_sel3)
		1'd0: begin
			builder_array_muxed27 <= 1'd0;
		end
		1'd1: begin
			builder_array_muxed27 <= ((main_ethernetsoc_sdram_choose_cmd_cmd_valid & main_ethernetsoc_sdram_choose_cmd_cmd_ready) & main_ethernetsoc_sdram_choose_cmd_cmd_payload_is_write);
		end
		2'd2: begin
			builder_array_muxed27 <= ((main_ethernetsoc_sdram_choose_req_cmd_valid & main_ethernetsoc_sdram_choose_req_cmd_ready) & main_ethernetsoc_sdram_choose_req_cmd_payload_is_write);
		end
		default: begin
			builder_array_muxed27 <= ((main_ethernetsoc_sdram_cmd_valid & main_ethernetsoc_sdram_cmd_ready) & main_ethernetsoc_sdram_cmd_payload_is_write);
		end
	endcase
end
assign main_ethernetsoc_uart_phy_rx = builder_xilinxmultiregimpl0_regs1;
assign builder_xilinxasyncresetsynchronizerimpl0 = ((~main_ethernetsoc_locked) | main_ethernetsoc_reset);
assign builder_xilinxasyncresetsynchronizerimpl1 = ((~main_ethernetsoc_locked) | main_ethernetsoc_reset);
assign builder_xilinxasyncresetsynchronizerimpl2 = ((~main_ethernetsoc_locked) | main_ethernetsoc_reset);
assign builder_xilinxasyncresetsynchronizerimpl3 = ((~main_ethernetsoc_locked) | main_ethernetsoc_reset);
assign builder_xilinxasyncresetsynchronizerimpl4 = ((~main_ethernetsoc_locked) | main_ethernetsoc_reset);
assign main_ethphy_status = builder_xilinxmultiregimpl1_regs1;
assign main_ps_preamble_error_toggle_o = builder_xilinxmultiregimpl2_regs1;
assign main_ps_crc_error_toggle_o = builder_xilinxmultiregimpl3_regs1;
assign main_tx_cdc_produce_rdomain = builder_xilinxmultiregimpl4_regs1;
assign main_tx_cdc_consume_wdomain = builder_xilinxmultiregimpl5_regs1;
assign main_rx_cdc_produce_rdomain = builder_xilinxmultiregimpl6_regs1;
assign main_rx_cdc_consume_wdomain = builder_xilinxmultiregimpl7_regs1;
always @(posedge clk200_clk) begin
	if ((main_ethernetsoc_reset_counter != 1'd0)) begin
		main_ethernetsoc_reset_counter <= (main_ethernetsoc_reset_counter - 1'd1);
	end else begin
		main_ethernetsoc_ic_reset <= 1'd0;
	end
	if (clk200_rst) begin
		main_ethernetsoc_reset_counter <= 4'd15;
		main_ethernetsoc_ic_reset <= 1'd1;
	end
end
always @(posedge eth_rx_clk) begin
	main_ethphy_liteethphymiirx_converter_reset <= (~eth_rx_dv);
	main_ethphy_liteethphymiirx_converter_sink_valid <= 1'd1;
	main_ethphy_liteethphymiirx_converter_sink_payload_data <= eth_rx_data;
	if (main_ethphy_liteethphymiirx_converter_converter_source_ready) begin
		main_ethphy_liteethphymiirx_converter_converter_strobe_all <= 1'd0;
	end
	if (main_ethphy_liteethphymiirx_converter_converter_load_part) begin
		if (((main_ethphy_liteethphymiirx_converter_converter_demux == 1'd1) | main_ethphy_liteethphymiirx_converter_converter_sink_last)) begin
			main_ethphy_liteethphymiirx_converter_converter_demux <= 1'd0;
			main_ethphy_liteethphymiirx_converter_converter_strobe_all <= 1'd1;
		end else begin
			main_ethphy_liteethphymiirx_converter_converter_demux <= (main_ethphy_liteethphymiirx_converter_converter_demux + 1'd1);
		end
	end
	if ((main_ethphy_liteethphymiirx_converter_converter_source_valid & main_ethphy_liteethphymiirx_converter_converter_source_ready)) begin
		if ((main_ethphy_liteethphymiirx_converter_converter_sink_valid & main_ethphy_liteethphymiirx_converter_converter_sink_ready)) begin
			main_ethphy_liteethphymiirx_converter_converter_source_first <= main_ethphy_liteethphymiirx_converter_converter_sink_first;
			main_ethphy_liteethphymiirx_converter_converter_source_last <= main_ethphy_liteethphymiirx_converter_converter_sink_last;
		end else begin
			main_ethphy_liteethphymiirx_converter_converter_source_first <= 1'd0;
			main_ethphy_liteethphymiirx_converter_converter_source_last <= 1'd0;
		end
	end else begin
		if ((main_ethphy_liteethphymiirx_converter_converter_sink_valid & main_ethphy_liteethphymiirx_converter_converter_sink_ready)) begin
			main_ethphy_liteethphymiirx_converter_converter_source_first <= (main_ethphy_liteethphymiirx_converter_converter_sink_first | main_ethphy_liteethphymiirx_converter_converter_source_first);
			main_ethphy_liteethphymiirx_converter_converter_source_last <= (main_ethphy_liteethphymiirx_converter_converter_sink_last | main_ethphy_liteethphymiirx_converter_converter_source_last);
		end
	end
	if (main_ethphy_liteethphymiirx_converter_converter_load_part) begin
		case (main_ethphy_liteethphymiirx_converter_converter_demux)
			1'd0: begin
				main_ethphy_liteethphymiirx_converter_converter_source_payload_data[3:0] <= main_ethphy_liteethphymiirx_converter_converter_sink_payload_data;
			end
			1'd1: begin
				main_ethphy_liteethphymiirx_converter_converter_source_payload_data[7:4] <= main_ethphy_liteethphymiirx_converter_converter_sink_payload_data;
			end
		endcase
	end
	if (main_ethphy_liteethphymiirx_converter_converter_load_part) begin
		main_ethphy_liteethphymiirx_converter_converter_source_payload_valid_token_count <= (main_ethphy_liteethphymiirx_converter_converter_demux + 1'd1);
	end
	if (main_ethphy_liteethphymiirx_converter_reset) begin
		main_ethphy_liteethphymiirx_converter_converter_source_first <= 1'd0;
		main_ethphy_liteethphymiirx_converter_converter_source_last <= 1'd0;
		main_ethphy_liteethphymiirx_converter_converter_source_payload_data <= 8'd0;
		main_ethphy_liteethphymiirx_converter_converter_source_payload_valid_token_count <= 2'd0;
		main_ethphy_liteethphymiirx_converter_converter_demux <= 1'd0;
		main_ethphy_liteethphymiirx_converter_converter_strobe_all <= 1'd0;
	end
	builder_liteethmacpreamblechecker_state <= builder_liteethmacpreamblechecker_next_state;
	if (main_crc32_checker_crc_ce) begin
		main_crc32_checker_crc_reg <= main_crc32_checker_crc_next;
	end
	if (main_crc32_checker_crc_reset) begin
		main_crc32_checker_crc_reg <= 32'd4294967295;
	end
	if (((main_crc32_checker_syncfifo_syncfifo_we & main_crc32_checker_syncfifo_syncfifo_writable) & (~main_crc32_checker_syncfifo_replace))) begin
		if ((main_crc32_checker_syncfifo_produce == 3'd4)) begin
			main_crc32_checker_syncfifo_produce <= 1'd0;
		end else begin
			main_crc32_checker_syncfifo_produce <= (main_crc32_checker_syncfifo_produce + 1'd1);
		end
	end
	if (main_crc32_checker_syncfifo_do_read) begin
		if ((main_crc32_checker_syncfifo_consume == 3'd4)) begin
			main_crc32_checker_syncfifo_consume <= 1'd0;
		end else begin
			main_crc32_checker_syncfifo_consume <= (main_crc32_checker_syncfifo_consume + 1'd1);
		end
	end
	if (((main_crc32_checker_syncfifo_syncfifo_we & main_crc32_checker_syncfifo_syncfifo_writable) & (~main_crc32_checker_syncfifo_replace))) begin
		if ((~main_crc32_checker_syncfifo_do_read)) begin
			main_crc32_checker_syncfifo_level <= (main_crc32_checker_syncfifo_level + 1'd1);
		end
	end else begin
		if (main_crc32_checker_syncfifo_do_read) begin
			main_crc32_checker_syncfifo_level <= (main_crc32_checker_syncfifo_level - 1'd1);
		end
	end
	if (main_crc32_checker_fifo_reset) begin
		main_crc32_checker_syncfifo_level <= 3'd0;
		main_crc32_checker_syncfifo_produce <= 3'd0;
		main_crc32_checker_syncfifo_consume <= 3'd0;
	end
	builder_liteethmaccrc32checker_state <= builder_liteethmaccrc32checker_next_state;
	if (main_ps_preamble_error_i) begin
		main_ps_preamble_error_toggle_i <= (~main_ps_preamble_error_toggle_i);
	end
	if (main_ps_crc_error_i) begin
		main_ps_crc_error_toggle_i <= (~main_ps_crc_error_toggle_i);
	end
	if (main_rx_converter_converter_source_ready) begin
		main_rx_converter_converter_strobe_all <= 1'd0;
	end
	if (main_rx_converter_converter_load_part) begin
		if (((main_rx_converter_converter_demux == 2'd3) | main_rx_converter_converter_sink_last)) begin
			main_rx_converter_converter_demux <= 1'd0;
			main_rx_converter_converter_strobe_all <= 1'd1;
		end else begin
			main_rx_converter_converter_demux <= (main_rx_converter_converter_demux + 1'd1);
		end
	end
	if ((main_rx_converter_converter_source_valid & main_rx_converter_converter_source_ready)) begin
		if ((main_rx_converter_converter_sink_valid & main_rx_converter_converter_sink_ready)) begin
			main_rx_converter_converter_source_first <= main_rx_converter_converter_sink_first;
			main_rx_converter_converter_source_last <= main_rx_converter_converter_sink_last;
		end else begin
			main_rx_converter_converter_source_first <= 1'd0;
			main_rx_converter_converter_source_last <= 1'd0;
		end
	end else begin
		if ((main_rx_converter_converter_sink_valid & main_rx_converter_converter_sink_ready)) begin
			main_rx_converter_converter_source_first <= (main_rx_converter_converter_sink_first | main_rx_converter_converter_source_first);
			main_rx_converter_converter_source_last <= (main_rx_converter_converter_sink_last | main_rx_converter_converter_source_last);
		end
	end
	if (main_rx_converter_converter_load_part) begin
		case (main_rx_converter_converter_demux)
			1'd0: begin
				main_rx_converter_converter_source_payload_data[9:0] <= main_rx_converter_converter_sink_payload_data;
			end
			1'd1: begin
				main_rx_converter_converter_source_payload_data[19:10] <= main_rx_converter_converter_sink_payload_data;
			end
			2'd2: begin
				main_rx_converter_converter_source_payload_data[29:20] <= main_rx_converter_converter_sink_payload_data;
			end
			2'd3: begin
				main_rx_converter_converter_source_payload_data[39:30] <= main_rx_converter_converter_sink_payload_data;
			end
		endcase
	end
	if (main_rx_converter_converter_load_part) begin
		main_rx_converter_converter_source_payload_valid_token_count <= (main_rx_converter_converter_demux + 1'd1);
	end
	main_rx_cdc_graycounter0_q_binary <= main_rx_cdc_graycounter0_q_next_binary;
	main_rx_cdc_graycounter0_q <= main_rx_cdc_graycounter0_q_next;
	if (eth_rx_rst) begin
		main_ethphy_liteethphymiirx_converter_sink_valid <= 1'd0;
		main_ethphy_liteethphymiirx_converter_sink_payload_data <= 4'd0;
		main_ethphy_liteethphymiirx_converter_converter_source_first <= 1'd0;
		main_ethphy_liteethphymiirx_converter_converter_source_last <= 1'd0;
		main_ethphy_liteethphymiirx_converter_converter_source_payload_data <= 8'd0;
		main_ethphy_liteethphymiirx_converter_converter_source_payload_valid_token_count <= 2'd0;
		main_ethphy_liteethphymiirx_converter_converter_demux <= 1'd0;
		main_ethphy_liteethphymiirx_converter_converter_strobe_all <= 1'd0;
		main_ethphy_liteethphymiirx_converter_reset <= 1'd0;
		main_crc32_checker_crc_reg <= 32'd4294967295;
		main_crc32_checker_syncfifo_level <= 3'd0;
		main_crc32_checker_syncfifo_produce <= 3'd0;
		main_crc32_checker_syncfifo_consume <= 3'd0;
		main_rx_converter_converter_source_first <= 1'd0;
		main_rx_converter_converter_source_last <= 1'd0;
		main_rx_converter_converter_source_payload_data <= 40'd0;
		main_rx_converter_converter_source_payload_valid_token_count <= 3'd0;
		main_rx_converter_converter_demux <= 2'd0;
		main_rx_converter_converter_strobe_all <= 1'd0;
		main_rx_cdc_graycounter0_q <= 7'd0;
		main_rx_cdc_graycounter0_q_binary <= 7'd0;
		builder_liteethmacpreamblechecker_state <= 1'd0;
		builder_liteethmaccrc32checker_state <= 2'd0;
	end
	builder_xilinxmultiregimpl7_regs0 <= main_rx_cdc_graycounter1_q;
	builder_xilinxmultiregimpl7_regs1 <= builder_xilinxmultiregimpl7_regs0;
end
always @(posedge eth_tx_clk) begin
	eth_tx_en <= main_ethphy_liteethphymiitx_converter_source_valid;
	eth_tx_data <= main_ethphy_liteethphymiitx_converter_source_payload_data;
	if ((main_ethphy_liteethphymiitx_converter_converter_source_valid & main_ethphy_liteethphymiitx_converter_converter_source_ready)) begin
		if (main_ethphy_liteethphymiitx_converter_converter_last) begin
			main_ethphy_liteethphymiitx_converter_converter_mux <= 1'd0;
		end else begin
			main_ethphy_liteethphymiitx_converter_converter_mux <= (main_ethphy_liteethphymiitx_converter_converter_mux + 1'd1);
		end
	end
	if (main_tx_gap_inserter_counter_reset) begin
		main_tx_gap_inserter_counter <= 1'd0;
	end else begin
		if (main_tx_gap_inserter_counter_ce) begin
			main_tx_gap_inserter_counter <= (main_tx_gap_inserter_counter + 1'd1);
		end
	end
	builder_liteethmacgap_state <= builder_liteethmacgap_next_state;
	if (main_preamble_inserter_clr_cnt) begin
		main_preamble_inserter_cnt <= 1'd0;
	end else begin
		if (main_preamble_inserter_inc_cnt) begin
			main_preamble_inserter_cnt <= (main_preamble_inserter_cnt + 1'd1);
		end
	end
	builder_liteethmacpreambleinserter_state <= builder_liteethmacpreambleinserter_next_state;
	if (main_crc32_inserter_is_ongoing0) begin
		main_crc32_inserter_cnt <= 2'd3;
	end else begin
		if ((main_crc32_inserter_is_ongoing1 & (~main_crc32_inserter_cnt_done))) begin
			main_crc32_inserter_cnt <= (main_crc32_inserter_cnt - main_crc32_inserter_source_ready);
		end
	end
	if (main_crc32_inserter_ce) begin
		main_crc32_inserter_reg <= main_crc32_inserter_next;
	end
	if (main_crc32_inserter_reset) begin
		main_crc32_inserter_reg <= 32'd4294967295;
	end
	builder_liteethmaccrc32inserter_state <= builder_liteethmaccrc32inserter_next_state;
	if (main_padding_inserter_counter_reset) begin
		main_padding_inserter_counter <= 1'd0;
	end else begin
		if (main_padding_inserter_counter_ce) begin
			main_padding_inserter_counter <= (main_padding_inserter_counter + 1'd1);
		end
	end
	builder_liteethmacpaddinginserter_state <= builder_liteethmacpaddinginserter_next_state;
	if ((main_tx_last_be_sink_valid & main_tx_last_be_sink_ready)) begin
		if (main_tx_last_be_sink_last) begin
			main_tx_last_be_ongoing <= 1'd1;
		end else begin
			if (main_tx_last_be_sink_payload_last_be) begin
				main_tx_last_be_ongoing <= 1'd0;
			end
		end
	end
	if ((main_tx_converter_converter_source_valid & main_tx_converter_converter_source_ready)) begin
		if (main_tx_converter_converter_last) begin
			main_tx_converter_converter_mux <= 1'd0;
		end else begin
			main_tx_converter_converter_mux <= (main_tx_converter_converter_mux + 1'd1);
		end
	end
	main_tx_cdc_graycounter1_q_binary <= main_tx_cdc_graycounter1_q_next_binary;
	main_tx_cdc_graycounter1_q <= main_tx_cdc_graycounter1_q_next;
	if (eth_tx_rst) begin
		main_ethphy_liteethphymiitx_converter_converter_mux <= 1'd0;
		main_crc32_inserter_reg <= 32'd4294967295;
		main_crc32_inserter_cnt <= 2'd3;
		main_padding_inserter_counter <= 16'd1;
		main_tx_last_be_ongoing <= 1'd1;
		main_tx_converter_converter_mux <= 2'd0;
		main_tx_cdc_graycounter1_q <= 7'd0;
		main_tx_cdc_graycounter1_q_binary <= 7'd0;
		builder_liteethmacgap_state <= 1'd0;
		builder_liteethmacpreambleinserter_state <= 2'd0;
		builder_liteethmaccrc32inserter_state <= 2'd0;
		builder_liteethmacpaddinginserter_state <= 1'd0;
	end
	builder_xilinxmultiregimpl4_regs0 <= main_tx_cdc_graycounter0_q;
	builder_xilinxmultiregimpl4_regs1 <= builder_xilinxmultiregimpl4_regs0;
end
always @(posedge sys_clk) begin
	if ((main_ethernetsoc_ctrl_bus_errors != 32'd4294967295)) begin
		if (main_ethernetsoc_ctrl_bus_error) begin
			main_ethernetsoc_ctrl_bus_errors <= (main_ethernetsoc_ctrl_bus_errors + 1'd1);
		end
	end
	main_ethernetsoc_vexriscv_time <= (main_ethernetsoc_vexriscv_time + 1'd1);
	if (main_ethernetsoc_vexriscv_latch_re) begin
		main_ethernetsoc_vexriscv_time_status <= main_ethernetsoc_vexriscv_time;
	end
	if (main_ethernetsoc_vexriscv_latch_re) begin
		main_ethernetsoc_vexriscv_time_cmp <= main_ethernetsoc_vexriscv_time_cmp_storage;
	end
	main_ethernetsoc_rom_bus_ack <= 1'd0;
	if (((main_ethernetsoc_rom_bus_cyc & main_ethernetsoc_rom_bus_stb) & (~main_ethernetsoc_rom_bus_ack))) begin
		main_ethernetsoc_rom_bus_ack <= 1'd1;
	end
	main_ethernetsoc_sram_bus_ack <= 1'd0;
	if (((main_ethernetsoc_sram_bus_cyc & main_ethernetsoc_sram_bus_stb) & (~main_ethernetsoc_sram_bus_ack))) begin
		main_ethernetsoc_sram_bus_ack <= 1'd1;
	end
	main_ethernetsoc_interface_we <= 1'd0;
	main_ethernetsoc_interface_dat_w <= main_ethernetsoc_bus_wishbone_dat_w;
	main_ethernetsoc_interface_adr <= main_ethernetsoc_bus_wishbone_adr;
	main_ethernetsoc_bus_wishbone_dat_r <= main_ethernetsoc_interface_dat_r;
	if ((main_ethernetsoc_counter == 1'd1)) begin
		main_ethernetsoc_interface_we <= main_ethernetsoc_bus_wishbone_we;
	end
	if ((main_ethernetsoc_counter == 2'd2)) begin
		main_ethernetsoc_bus_wishbone_ack <= 1'd1;
	end
	if ((main_ethernetsoc_counter == 2'd3)) begin
		main_ethernetsoc_bus_wishbone_ack <= 1'd0;
	end
	if ((main_ethernetsoc_counter != 1'd0)) begin
		main_ethernetsoc_counter <= (main_ethernetsoc_counter + 1'd1);
	end else begin
		if ((main_ethernetsoc_bus_wishbone_cyc & main_ethernetsoc_bus_wishbone_stb)) begin
			main_ethernetsoc_counter <= 1'd1;
		end
	end
	main_ethernetsoc_uart_phy_sink_ready <= 1'd0;
	if (((main_ethernetsoc_uart_phy_sink_valid & (~main_ethernetsoc_uart_phy_tx_busy)) & (~main_ethernetsoc_uart_phy_sink_ready))) begin
		main_ethernetsoc_uart_phy_tx_reg <= main_ethernetsoc_uart_phy_sink_payload_data;
		main_ethernetsoc_uart_phy_tx_bitcount <= 1'd0;
		main_ethernetsoc_uart_phy_tx_busy <= 1'd1;
		serial_tx <= 1'd0;
	end else begin
		if ((main_ethernetsoc_uart_phy_uart_clk_txen & main_ethernetsoc_uart_phy_tx_busy)) begin
			main_ethernetsoc_uart_phy_tx_bitcount <= (main_ethernetsoc_uart_phy_tx_bitcount + 1'd1);
			if ((main_ethernetsoc_uart_phy_tx_bitcount == 4'd8)) begin
				serial_tx <= 1'd1;
			end else begin
				if ((main_ethernetsoc_uart_phy_tx_bitcount == 4'd9)) begin
					serial_tx <= 1'd1;
					main_ethernetsoc_uart_phy_tx_busy <= 1'd0;
					main_ethernetsoc_uart_phy_sink_ready <= 1'd1;
				end else begin
					serial_tx <= main_ethernetsoc_uart_phy_tx_reg[0];
					main_ethernetsoc_uart_phy_tx_reg <= {1'd0, main_ethernetsoc_uart_phy_tx_reg[7:1]};
				end
			end
		end
	end
	if (main_ethernetsoc_uart_phy_tx_busy) begin
		{main_ethernetsoc_uart_phy_uart_clk_txen, main_ethernetsoc_uart_phy_phase_accumulator_tx} <= (main_ethernetsoc_uart_phy_phase_accumulator_tx + main_ethernetsoc_uart_phy_storage);
	end else begin
		{main_ethernetsoc_uart_phy_uart_clk_txen, main_ethernetsoc_uart_phy_phase_accumulator_tx} <= 1'd0;
	end
	main_ethernetsoc_uart_phy_source_valid <= 1'd0;
	main_ethernetsoc_uart_phy_rx_r <= main_ethernetsoc_uart_phy_rx;
	if ((~main_ethernetsoc_uart_phy_rx_busy)) begin
		if (((~main_ethernetsoc_uart_phy_rx) & main_ethernetsoc_uart_phy_rx_r)) begin
			main_ethernetsoc_uart_phy_rx_busy <= 1'd1;
			main_ethernetsoc_uart_phy_rx_bitcount <= 1'd0;
		end
	end else begin
		if (main_ethernetsoc_uart_phy_uart_clk_rxen) begin
			main_ethernetsoc_uart_phy_rx_bitcount <= (main_ethernetsoc_uart_phy_rx_bitcount + 1'd1);
			if ((main_ethernetsoc_uart_phy_rx_bitcount == 1'd0)) begin
				if (main_ethernetsoc_uart_phy_rx) begin
					main_ethernetsoc_uart_phy_rx_busy <= 1'd0;
				end
			end else begin
				if ((main_ethernetsoc_uart_phy_rx_bitcount == 4'd9)) begin
					main_ethernetsoc_uart_phy_rx_busy <= 1'd0;
					if (main_ethernetsoc_uart_phy_rx) begin
						main_ethernetsoc_uart_phy_source_payload_data <= main_ethernetsoc_uart_phy_rx_reg;
						main_ethernetsoc_uart_phy_source_valid <= 1'd1;
					end
				end else begin
					main_ethernetsoc_uart_phy_rx_reg <= {main_ethernetsoc_uart_phy_rx, main_ethernetsoc_uart_phy_rx_reg[7:1]};
				end
			end
		end
	end
	if (main_ethernetsoc_uart_phy_rx_busy) begin
		{main_ethernetsoc_uart_phy_uart_clk_rxen, main_ethernetsoc_uart_phy_phase_accumulator_rx} <= (main_ethernetsoc_uart_phy_phase_accumulator_rx + main_ethernetsoc_uart_phy_storage);
	end else begin
		{main_ethernetsoc_uart_phy_uart_clk_rxen, main_ethernetsoc_uart_phy_phase_accumulator_rx} <= 32'd2147483648;
	end
	if (main_ethernetsoc_uart_tx_clear) begin
		main_ethernetsoc_uart_tx_pending <= 1'd0;
	end
	main_ethernetsoc_uart_tx_old_trigger <= main_ethernetsoc_uart_tx_trigger;
	if (((~main_ethernetsoc_uart_tx_trigger) & main_ethernetsoc_uart_tx_old_trigger)) begin
		main_ethernetsoc_uart_tx_pending <= 1'd1;
	end
	if (main_ethernetsoc_uart_rx_clear) begin
		main_ethernetsoc_uart_rx_pending <= 1'd0;
	end
	main_ethernetsoc_uart_rx_old_trigger <= main_ethernetsoc_uart_rx_trigger;
	if (((~main_ethernetsoc_uart_rx_trigger) & main_ethernetsoc_uart_rx_old_trigger)) begin
		main_ethernetsoc_uart_rx_pending <= 1'd1;
	end
	if (main_ethernetsoc_uart_tx_fifo_syncfifo_re) begin
		main_ethernetsoc_uart_tx_fifo_readable <= 1'd1;
	end else begin
		if (main_ethernetsoc_uart_tx_fifo_re) begin
			main_ethernetsoc_uart_tx_fifo_readable <= 1'd0;
		end
	end
	if (((main_ethernetsoc_uart_tx_fifo_syncfifo_we & main_ethernetsoc_uart_tx_fifo_syncfifo_writable) & (~main_ethernetsoc_uart_tx_fifo_replace))) begin
		main_ethernetsoc_uart_tx_fifo_produce <= (main_ethernetsoc_uart_tx_fifo_produce + 1'd1);
	end
	if (main_ethernetsoc_uart_tx_fifo_do_read) begin
		main_ethernetsoc_uart_tx_fifo_consume <= (main_ethernetsoc_uart_tx_fifo_consume + 1'd1);
	end
	if (((main_ethernetsoc_uart_tx_fifo_syncfifo_we & main_ethernetsoc_uart_tx_fifo_syncfifo_writable) & (~main_ethernetsoc_uart_tx_fifo_replace))) begin
		if ((~main_ethernetsoc_uart_tx_fifo_do_read)) begin
			main_ethernetsoc_uart_tx_fifo_level0 <= (main_ethernetsoc_uart_tx_fifo_level0 + 1'd1);
		end
	end else begin
		if (main_ethernetsoc_uart_tx_fifo_do_read) begin
			main_ethernetsoc_uart_tx_fifo_level0 <= (main_ethernetsoc_uart_tx_fifo_level0 - 1'd1);
		end
	end
	if (main_ethernetsoc_uart_rx_fifo_syncfifo_re) begin
		main_ethernetsoc_uart_rx_fifo_readable <= 1'd1;
	end else begin
		if (main_ethernetsoc_uart_rx_fifo_re) begin
			main_ethernetsoc_uart_rx_fifo_readable <= 1'd0;
		end
	end
	if (((main_ethernetsoc_uart_rx_fifo_syncfifo_we & main_ethernetsoc_uart_rx_fifo_syncfifo_writable) & (~main_ethernetsoc_uart_rx_fifo_replace))) begin
		main_ethernetsoc_uart_rx_fifo_produce <= (main_ethernetsoc_uart_rx_fifo_produce + 1'd1);
	end
	if (main_ethernetsoc_uart_rx_fifo_do_read) begin
		main_ethernetsoc_uart_rx_fifo_consume <= (main_ethernetsoc_uart_rx_fifo_consume + 1'd1);
	end
	if (((main_ethernetsoc_uart_rx_fifo_syncfifo_we & main_ethernetsoc_uart_rx_fifo_syncfifo_writable) & (~main_ethernetsoc_uart_rx_fifo_replace))) begin
		if ((~main_ethernetsoc_uart_rx_fifo_do_read)) begin
			main_ethernetsoc_uart_rx_fifo_level0 <= (main_ethernetsoc_uart_rx_fifo_level0 + 1'd1);
		end
	end else begin
		if (main_ethernetsoc_uart_rx_fifo_do_read) begin
			main_ethernetsoc_uart_rx_fifo_level0 <= (main_ethernetsoc_uart_rx_fifo_level0 - 1'd1);
		end
	end
	if (main_ethernetsoc_uart_reset) begin
		main_ethernetsoc_uart_tx_pending <= 1'd0;
		main_ethernetsoc_uart_tx_old_trigger <= 1'd0;
		main_ethernetsoc_uart_rx_pending <= 1'd0;
		main_ethernetsoc_uart_rx_old_trigger <= 1'd0;
		main_ethernetsoc_uart_tx_fifo_readable <= 1'd0;
		main_ethernetsoc_uart_tx_fifo_level0 <= 5'd0;
		main_ethernetsoc_uart_tx_fifo_produce <= 4'd0;
		main_ethernetsoc_uart_tx_fifo_consume <= 4'd0;
		main_ethernetsoc_uart_rx_fifo_readable <= 1'd0;
		main_ethernetsoc_uart_rx_fifo_level0 <= 5'd0;
		main_ethernetsoc_uart_rx_fifo_produce <= 4'd0;
		main_ethernetsoc_uart_rx_fifo_consume <= 4'd0;
	end
	if (main_ethernetsoc_timer0_en_storage) begin
		if ((main_ethernetsoc_timer0_value == 1'd0)) begin
			main_ethernetsoc_timer0_value <= main_ethernetsoc_timer0_reload_storage;
		end else begin
			main_ethernetsoc_timer0_value <= (main_ethernetsoc_timer0_value - 1'd1);
		end
	end else begin
		main_ethernetsoc_timer0_value <= main_ethernetsoc_timer0_load_storage;
	end
	if (main_ethernetsoc_timer0_update_value_re) begin
		main_ethernetsoc_timer0_value_status <= main_ethernetsoc_timer0_value;
	end
	if (main_ethernetsoc_timer0_zero_clear) begin
		main_ethernetsoc_timer0_zero_pending <= 1'd0;
	end
	main_ethernetsoc_timer0_zero_old_trigger <= main_ethernetsoc_timer0_zero_trigger;
	if (((~main_ethernetsoc_timer0_zero_trigger) & main_ethernetsoc_timer0_zero_old_trigger)) begin
		main_ethernetsoc_timer0_zero_pending <= 1'd1;
	end
	if (main_ethernetsoc_a7ddrphy_dly_sel_storage[0]) begin
		if (main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_rst_re) begin
			main_ethernetsoc_a7ddrphy_bitslip0_value <= 1'd0;
		end else begin
			if (main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_re) begin
				main_ethernetsoc_a7ddrphy_bitslip0_value <= (main_ethernetsoc_a7ddrphy_bitslip0_value + 1'd1);
			end
		end
	end
	if (main_ethernetsoc_a7ddrphy_dly_sel_storage[0]) begin
		if (main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_rst_re) begin
			main_ethernetsoc_a7ddrphy_bitslip1_value <= 1'd0;
		end else begin
			if (main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_re) begin
				main_ethernetsoc_a7ddrphy_bitslip1_value <= (main_ethernetsoc_a7ddrphy_bitslip1_value + 1'd1);
			end
		end
	end
	if (main_ethernetsoc_a7ddrphy_dly_sel_storage[0]) begin
		if (main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_rst_re) begin
			main_ethernetsoc_a7ddrphy_bitslip2_value <= 1'd0;
		end else begin
			if (main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_re) begin
				main_ethernetsoc_a7ddrphy_bitslip2_value <= (main_ethernetsoc_a7ddrphy_bitslip2_value + 1'd1);
			end
		end
	end
	if (main_ethernetsoc_a7ddrphy_dly_sel_storage[0]) begin
		if (main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_rst_re) begin
			main_ethernetsoc_a7ddrphy_bitslip3_value <= 1'd0;
		end else begin
			if (main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_re) begin
				main_ethernetsoc_a7ddrphy_bitslip3_value <= (main_ethernetsoc_a7ddrphy_bitslip3_value + 1'd1);
			end
		end
	end
	if (main_ethernetsoc_a7ddrphy_dly_sel_storage[0]) begin
		if (main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_rst_re) begin
			main_ethernetsoc_a7ddrphy_bitslip4_value <= 1'd0;
		end else begin
			if (main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_re) begin
				main_ethernetsoc_a7ddrphy_bitslip4_value <= (main_ethernetsoc_a7ddrphy_bitslip4_value + 1'd1);
			end
		end
	end
	if (main_ethernetsoc_a7ddrphy_dly_sel_storage[0]) begin
		if (main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_rst_re) begin
			main_ethernetsoc_a7ddrphy_bitslip5_value <= 1'd0;
		end else begin
			if (main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_re) begin
				main_ethernetsoc_a7ddrphy_bitslip5_value <= (main_ethernetsoc_a7ddrphy_bitslip5_value + 1'd1);
			end
		end
	end
	if (main_ethernetsoc_a7ddrphy_dly_sel_storage[0]) begin
		if (main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_rst_re) begin
			main_ethernetsoc_a7ddrphy_bitslip6_value <= 1'd0;
		end else begin
			if (main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_re) begin
				main_ethernetsoc_a7ddrphy_bitslip6_value <= (main_ethernetsoc_a7ddrphy_bitslip6_value + 1'd1);
			end
		end
	end
	if (main_ethernetsoc_a7ddrphy_dly_sel_storage[0]) begin
		if (main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_rst_re) begin
			main_ethernetsoc_a7ddrphy_bitslip7_value <= 1'd0;
		end else begin
			if (main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_re) begin
				main_ethernetsoc_a7ddrphy_bitslip7_value <= (main_ethernetsoc_a7ddrphy_bitslip7_value + 1'd1);
			end
		end
	end
	if (main_ethernetsoc_a7ddrphy_dly_sel_storage[1]) begin
		if (main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_rst_re) begin
			main_ethernetsoc_a7ddrphy_bitslip8_value <= 1'd0;
		end else begin
			if (main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_re) begin
				main_ethernetsoc_a7ddrphy_bitslip8_value <= (main_ethernetsoc_a7ddrphy_bitslip8_value + 1'd1);
			end
		end
	end
	if (main_ethernetsoc_a7ddrphy_dly_sel_storage[1]) begin
		if (main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_rst_re) begin
			main_ethernetsoc_a7ddrphy_bitslip9_value <= 1'd0;
		end else begin
			if (main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_re) begin
				main_ethernetsoc_a7ddrphy_bitslip9_value <= (main_ethernetsoc_a7ddrphy_bitslip9_value + 1'd1);
			end
		end
	end
	if (main_ethernetsoc_a7ddrphy_dly_sel_storage[1]) begin
		if (main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_rst_re) begin
			main_ethernetsoc_a7ddrphy_bitslip10_value <= 1'd0;
		end else begin
			if (main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_re) begin
				main_ethernetsoc_a7ddrphy_bitslip10_value <= (main_ethernetsoc_a7ddrphy_bitslip10_value + 1'd1);
			end
		end
	end
	if (main_ethernetsoc_a7ddrphy_dly_sel_storage[1]) begin
		if (main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_rst_re) begin
			main_ethernetsoc_a7ddrphy_bitslip11_value <= 1'd0;
		end else begin
			if (main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_re) begin
				main_ethernetsoc_a7ddrphy_bitslip11_value <= (main_ethernetsoc_a7ddrphy_bitslip11_value + 1'd1);
			end
		end
	end
	if (main_ethernetsoc_a7ddrphy_dly_sel_storage[1]) begin
		if (main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_rst_re) begin
			main_ethernetsoc_a7ddrphy_bitslip12_value <= 1'd0;
		end else begin
			if (main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_re) begin
				main_ethernetsoc_a7ddrphy_bitslip12_value <= (main_ethernetsoc_a7ddrphy_bitslip12_value + 1'd1);
			end
		end
	end
	if (main_ethernetsoc_a7ddrphy_dly_sel_storage[1]) begin
		if (main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_rst_re) begin
			main_ethernetsoc_a7ddrphy_bitslip13_value <= 1'd0;
		end else begin
			if (main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_re) begin
				main_ethernetsoc_a7ddrphy_bitslip13_value <= (main_ethernetsoc_a7ddrphy_bitslip13_value + 1'd1);
			end
		end
	end
	if (main_ethernetsoc_a7ddrphy_dly_sel_storage[1]) begin
		if (main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_rst_re) begin
			main_ethernetsoc_a7ddrphy_bitslip14_value <= 1'd0;
		end else begin
			if (main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_re) begin
				main_ethernetsoc_a7ddrphy_bitslip14_value <= (main_ethernetsoc_a7ddrphy_bitslip14_value + 1'd1);
			end
		end
	end
	if (main_ethernetsoc_a7ddrphy_dly_sel_storage[1]) begin
		if (main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_rst_re) begin
			main_ethernetsoc_a7ddrphy_bitslip15_value <= 1'd0;
		end else begin
			if (main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_re) begin
				main_ethernetsoc_a7ddrphy_bitslip15_value <= (main_ethernetsoc_a7ddrphy_bitslip15_value + 1'd1);
			end
		end
	end
	main_ethernetsoc_a7ddrphy_n_rddata_en0 <= main_ethernetsoc_a7ddrphy_dfi_p2_rddata_en;
	main_ethernetsoc_a7ddrphy_n_rddata_en1 <= main_ethernetsoc_a7ddrphy_n_rddata_en0;
	main_ethernetsoc_a7ddrphy_n_rddata_en2 <= main_ethernetsoc_a7ddrphy_n_rddata_en1;
	main_ethernetsoc_a7ddrphy_n_rddata_en3 <= main_ethernetsoc_a7ddrphy_n_rddata_en2;
	main_ethernetsoc_a7ddrphy_n_rddata_en4 <= main_ethernetsoc_a7ddrphy_n_rddata_en3;
	main_ethernetsoc_a7ddrphy_n_rddata_en5 <= main_ethernetsoc_a7ddrphy_n_rddata_en4;
	main_ethernetsoc_a7ddrphy_n_rddata_en6 <= main_ethernetsoc_a7ddrphy_n_rddata_en5;
	main_ethernetsoc_a7ddrphy_n_rddata_en7 <= main_ethernetsoc_a7ddrphy_n_rddata_en6;
	main_ethernetsoc_a7ddrphy_dfi_p0_rddata_valid <= main_ethernetsoc_a7ddrphy_n_rddata_en7;
	main_ethernetsoc_a7ddrphy_dfi_p1_rddata_valid <= main_ethernetsoc_a7ddrphy_n_rddata_en7;
	main_ethernetsoc_a7ddrphy_dfi_p2_rddata_valid <= main_ethernetsoc_a7ddrphy_n_rddata_en7;
	main_ethernetsoc_a7ddrphy_dfi_p3_rddata_valid <= main_ethernetsoc_a7ddrphy_n_rddata_en7;
	main_ethernetsoc_a7ddrphy_last_wrdata_en <= {main_ethernetsoc_a7ddrphy_last_wrdata_en[2:0], main_ethernetsoc_a7ddrphy_dfi_p3_wrdata_en};
	main_ethernetsoc_a7ddrphy_oe_dqs <= main_ethernetsoc_a7ddrphy_oe;
	main_ethernetsoc_a7ddrphy_oe_dq <= main_ethernetsoc_a7ddrphy_oe;
	main_ethernetsoc_a7ddrphy_bitslip0_r <= {main_ethernetsoc_a7ddrphy_bitslip0_i, main_ethernetsoc_a7ddrphy_bitslip0_r[15:8]};
	case (main_ethernetsoc_a7ddrphy_bitslip0_value)
		1'd0: begin
			main_ethernetsoc_a7ddrphy_bitslip0_o <= main_ethernetsoc_a7ddrphy_bitslip0_r[7:0];
		end
		1'd1: begin
			main_ethernetsoc_a7ddrphy_bitslip0_o <= main_ethernetsoc_a7ddrphy_bitslip0_r[8:1];
		end
		2'd2: begin
			main_ethernetsoc_a7ddrphy_bitslip0_o <= main_ethernetsoc_a7ddrphy_bitslip0_r[9:2];
		end
		2'd3: begin
			main_ethernetsoc_a7ddrphy_bitslip0_o <= main_ethernetsoc_a7ddrphy_bitslip0_r[10:3];
		end
		3'd4: begin
			main_ethernetsoc_a7ddrphy_bitslip0_o <= main_ethernetsoc_a7ddrphy_bitslip0_r[11:4];
		end
		3'd5: begin
			main_ethernetsoc_a7ddrphy_bitslip0_o <= main_ethernetsoc_a7ddrphy_bitslip0_r[12:5];
		end
		3'd6: begin
			main_ethernetsoc_a7ddrphy_bitslip0_o <= main_ethernetsoc_a7ddrphy_bitslip0_r[13:6];
		end
		3'd7: begin
			main_ethernetsoc_a7ddrphy_bitslip0_o <= main_ethernetsoc_a7ddrphy_bitslip0_r[14:7];
		end
	endcase
	main_ethernetsoc_a7ddrphy_bitslip1_r <= {main_ethernetsoc_a7ddrphy_bitslip1_i, main_ethernetsoc_a7ddrphy_bitslip1_r[15:8]};
	case (main_ethernetsoc_a7ddrphy_bitslip1_value)
		1'd0: begin
			main_ethernetsoc_a7ddrphy_bitslip1_o <= main_ethernetsoc_a7ddrphy_bitslip1_r[7:0];
		end
		1'd1: begin
			main_ethernetsoc_a7ddrphy_bitslip1_o <= main_ethernetsoc_a7ddrphy_bitslip1_r[8:1];
		end
		2'd2: begin
			main_ethernetsoc_a7ddrphy_bitslip1_o <= main_ethernetsoc_a7ddrphy_bitslip1_r[9:2];
		end
		2'd3: begin
			main_ethernetsoc_a7ddrphy_bitslip1_o <= main_ethernetsoc_a7ddrphy_bitslip1_r[10:3];
		end
		3'd4: begin
			main_ethernetsoc_a7ddrphy_bitslip1_o <= main_ethernetsoc_a7ddrphy_bitslip1_r[11:4];
		end
		3'd5: begin
			main_ethernetsoc_a7ddrphy_bitslip1_o <= main_ethernetsoc_a7ddrphy_bitslip1_r[12:5];
		end
		3'd6: begin
			main_ethernetsoc_a7ddrphy_bitslip1_o <= main_ethernetsoc_a7ddrphy_bitslip1_r[13:6];
		end
		3'd7: begin
			main_ethernetsoc_a7ddrphy_bitslip1_o <= main_ethernetsoc_a7ddrphy_bitslip1_r[14:7];
		end
	endcase
	main_ethernetsoc_a7ddrphy_bitslip2_r <= {main_ethernetsoc_a7ddrphy_bitslip2_i, main_ethernetsoc_a7ddrphy_bitslip2_r[15:8]};
	case (main_ethernetsoc_a7ddrphy_bitslip2_value)
		1'd0: begin
			main_ethernetsoc_a7ddrphy_bitslip2_o <= main_ethernetsoc_a7ddrphy_bitslip2_r[7:0];
		end
		1'd1: begin
			main_ethernetsoc_a7ddrphy_bitslip2_o <= main_ethernetsoc_a7ddrphy_bitslip2_r[8:1];
		end
		2'd2: begin
			main_ethernetsoc_a7ddrphy_bitslip2_o <= main_ethernetsoc_a7ddrphy_bitslip2_r[9:2];
		end
		2'd3: begin
			main_ethernetsoc_a7ddrphy_bitslip2_o <= main_ethernetsoc_a7ddrphy_bitslip2_r[10:3];
		end
		3'd4: begin
			main_ethernetsoc_a7ddrphy_bitslip2_o <= main_ethernetsoc_a7ddrphy_bitslip2_r[11:4];
		end
		3'd5: begin
			main_ethernetsoc_a7ddrphy_bitslip2_o <= main_ethernetsoc_a7ddrphy_bitslip2_r[12:5];
		end
		3'd6: begin
			main_ethernetsoc_a7ddrphy_bitslip2_o <= main_ethernetsoc_a7ddrphy_bitslip2_r[13:6];
		end
		3'd7: begin
			main_ethernetsoc_a7ddrphy_bitslip2_o <= main_ethernetsoc_a7ddrphy_bitslip2_r[14:7];
		end
	endcase
	main_ethernetsoc_a7ddrphy_bitslip3_r <= {main_ethernetsoc_a7ddrphy_bitslip3_i, main_ethernetsoc_a7ddrphy_bitslip3_r[15:8]};
	case (main_ethernetsoc_a7ddrphy_bitslip3_value)
		1'd0: begin
			main_ethernetsoc_a7ddrphy_bitslip3_o <= main_ethernetsoc_a7ddrphy_bitslip3_r[7:0];
		end
		1'd1: begin
			main_ethernetsoc_a7ddrphy_bitslip3_o <= main_ethernetsoc_a7ddrphy_bitslip3_r[8:1];
		end
		2'd2: begin
			main_ethernetsoc_a7ddrphy_bitslip3_o <= main_ethernetsoc_a7ddrphy_bitslip3_r[9:2];
		end
		2'd3: begin
			main_ethernetsoc_a7ddrphy_bitslip3_o <= main_ethernetsoc_a7ddrphy_bitslip3_r[10:3];
		end
		3'd4: begin
			main_ethernetsoc_a7ddrphy_bitslip3_o <= main_ethernetsoc_a7ddrphy_bitslip3_r[11:4];
		end
		3'd5: begin
			main_ethernetsoc_a7ddrphy_bitslip3_o <= main_ethernetsoc_a7ddrphy_bitslip3_r[12:5];
		end
		3'd6: begin
			main_ethernetsoc_a7ddrphy_bitslip3_o <= main_ethernetsoc_a7ddrphy_bitslip3_r[13:6];
		end
		3'd7: begin
			main_ethernetsoc_a7ddrphy_bitslip3_o <= main_ethernetsoc_a7ddrphy_bitslip3_r[14:7];
		end
	endcase
	main_ethernetsoc_a7ddrphy_bitslip4_r <= {main_ethernetsoc_a7ddrphy_bitslip4_i, main_ethernetsoc_a7ddrphy_bitslip4_r[15:8]};
	case (main_ethernetsoc_a7ddrphy_bitslip4_value)
		1'd0: begin
			main_ethernetsoc_a7ddrphy_bitslip4_o <= main_ethernetsoc_a7ddrphy_bitslip4_r[7:0];
		end
		1'd1: begin
			main_ethernetsoc_a7ddrphy_bitslip4_o <= main_ethernetsoc_a7ddrphy_bitslip4_r[8:1];
		end
		2'd2: begin
			main_ethernetsoc_a7ddrphy_bitslip4_o <= main_ethernetsoc_a7ddrphy_bitslip4_r[9:2];
		end
		2'd3: begin
			main_ethernetsoc_a7ddrphy_bitslip4_o <= main_ethernetsoc_a7ddrphy_bitslip4_r[10:3];
		end
		3'd4: begin
			main_ethernetsoc_a7ddrphy_bitslip4_o <= main_ethernetsoc_a7ddrphy_bitslip4_r[11:4];
		end
		3'd5: begin
			main_ethernetsoc_a7ddrphy_bitslip4_o <= main_ethernetsoc_a7ddrphy_bitslip4_r[12:5];
		end
		3'd6: begin
			main_ethernetsoc_a7ddrphy_bitslip4_o <= main_ethernetsoc_a7ddrphy_bitslip4_r[13:6];
		end
		3'd7: begin
			main_ethernetsoc_a7ddrphy_bitslip4_o <= main_ethernetsoc_a7ddrphy_bitslip4_r[14:7];
		end
	endcase
	main_ethernetsoc_a7ddrphy_bitslip5_r <= {main_ethernetsoc_a7ddrphy_bitslip5_i, main_ethernetsoc_a7ddrphy_bitslip5_r[15:8]};
	case (main_ethernetsoc_a7ddrphy_bitslip5_value)
		1'd0: begin
			main_ethernetsoc_a7ddrphy_bitslip5_o <= main_ethernetsoc_a7ddrphy_bitslip5_r[7:0];
		end
		1'd1: begin
			main_ethernetsoc_a7ddrphy_bitslip5_o <= main_ethernetsoc_a7ddrphy_bitslip5_r[8:1];
		end
		2'd2: begin
			main_ethernetsoc_a7ddrphy_bitslip5_o <= main_ethernetsoc_a7ddrphy_bitslip5_r[9:2];
		end
		2'd3: begin
			main_ethernetsoc_a7ddrphy_bitslip5_o <= main_ethernetsoc_a7ddrphy_bitslip5_r[10:3];
		end
		3'd4: begin
			main_ethernetsoc_a7ddrphy_bitslip5_o <= main_ethernetsoc_a7ddrphy_bitslip5_r[11:4];
		end
		3'd5: begin
			main_ethernetsoc_a7ddrphy_bitslip5_o <= main_ethernetsoc_a7ddrphy_bitslip5_r[12:5];
		end
		3'd6: begin
			main_ethernetsoc_a7ddrphy_bitslip5_o <= main_ethernetsoc_a7ddrphy_bitslip5_r[13:6];
		end
		3'd7: begin
			main_ethernetsoc_a7ddrphy_bitslip5_o <= main_ethernetsoc_a7ddrphy_bitslip5_r[14:7];
		end
	endcase
	main_ethernetsoc_a7ddrphy_bitslip6_r <= {main_ethernetsoc_a7ddrphy_bitslip6_i, main_ethernetsoc_a7ddrphy_bitslip6_r[15:8]};
	case (main_ethernetsoc_a7ddrphy_bitslip6_value)
		1'd0: begin
			main_ethernetsoc_a7ddrphy_bitslip6_o <= main_ethernetsoc_a7ddrphy_bitslip6_r[7:0];
		end
		1'd1: begin
			main_ethernetsoc_a7ddrphy_bitslip6_o <= main_ethernetsoc_a7ddrphy_bitslip6_r[8:1];
		end
		2'd2: begin
			main_ethernetsoc_a7ddrphy_bitslip6_o <= main_ethernetsoc_a7ddrphy_bitslip6_r[9:2];
		end
		2'd3: begin
			main_ethernetsoc_a7ddrphy_bitslip6_o <= main_ethernetsoc_a7ddrphy_bitslip6_r[10:3];
		end
		3'd4: begin
			main_ethernetsoc_a7ddrphy_bitslip6_o <= main_ethernetsoc_a7ddrphy_bitslip6_r[11:4];
		end
		3'd5: begin
			main_ethernetsoc_a7ddrphy_bitslip6_o <= main_ethernetsoc_a7ddrphy_bitslip6_r[12:5];
		end
		3'd6: begin
			main_ethernetsoc_a7ddrphy_bitslip6_o <= main_ethernetsoc_a7ddrphy_bitslip6_r[13:6];
		end
		3'd7: begin
			main_ethernetsoc_a7ddrphy_bitslip6_o <= main_ethernetsoc_a7ddrphy_bitslip6_r[14:7];
		end
	endcase
	main_ethernetsoc_a7ddrphy_bitslip7_r <= {main_ethernetsoc_a7ddrphy_bitslip7_i, main_ethernetsoc_a7ddrphy_bitslip7_r[15:8]};
	case (main_ethernetsoc_a7ddrphy_bitslip7_value)
		1'd0: begin
			main_ethernetsoc_a7ddrphy_bitslip7_o <= main_ethernetsoc_a7ddrphy_bitslip7_r[7:0];
		end
		1'd1: begin
			main_ethernetsoc_a7ddrphy_bitslip7_o <= main_ethernetsoc_a7ddrphy_bitslip7_r[8:1];
		end
		2'd2: begin
			main_ethernetsoc_a7ddrphy_bitslip7_o <= main_ethernetsoc_a7ddrphy_bitslip7_r[9:2];
		end
		2'd3: begin
			main_ethernetsoc_a7ddrphy_bitslip7_o <= main_ethernetsoc_a7ddrphy_bitslip7_r[10:3];
		end
		3'd4: begin
			main_ethernetsoc_a7ddrphy_bitslip7_o <= main_ethernetsoc_a7ddrphy_bitslip7_r[11:4];
		end
		3'd5: begin
			main_ethernetsoc_a7ddrphy_bitslip7_o <= main_ethernetsoc_a7ddrphy_bitslip7_r[12:5];
		end
		3'd6: begin
			main_ethernetsoc_a7ddrphy_bitslip7_o <= main_ethernetsoc_a7ddrphy_bitslip7_r[13:6];
		end
		3'd7: begin
			main_ethernetsoc_a7ddrphy_bitslip7_o <= main_ethernetsoc_a7ddrphy_bitslip7_r[14:7];
		end
	endcase
	main_ethernetsoc_a7ddrphy_bitslip8_r <= {main_ethernetsoc_a7ddrphy_bitslip8_i, main_ethernetsoc_a7ddrphy_bitslip8_r[15:8]};
	case (main_ethernetsoc_a7ddrphy_bitslip8_value)
		1'd0: begin
			main_ethernetsoc_a7ddrphy_bitslip8_o <= main_ethernetsoc_a7ddrphy_bitslip8_r[7:0];
		end
		1'd1: begin
			main_ethernetsoc_a7ddrphy_bitslip8_o <= main_ethernetsoc_a7ddrphy_bitslip8_r[8:1];
		end
		2'd2: begin
			main_ethernetsoc_a7ddrphy_bitslip8_o <= main_ethernetsoc_a7ddrphy_bitslip8_r[9:2];
		end
		2'd3: begin
			main_ethernetsoc_a7ddrphy_bitslip8_o <= main_ethernetsoc_a7ddrphy_bitslip8_r[10:3];
		end
		3'd4: begin
			main_ethernetsoc_a7ddrphy_bitslip8_o <= main_ethernetsoc_a7ddrphy_bitslip8_r[11:4];
		end
		3'd5: begin
			main_ethernetsoc_a7ddrphy_bitslip8_o <= main_ethernetsoc_a7ddrphy_bitslip8_r[12:5];
		end
		3'd6: begin
			main_ethernetsoc_a7ddrphy_bitslip8_o <= main_ethernetsoc_a7ddrphy_bitslip8_r[13:6];
		end
		3'd7: begin
			main_ethernetsoc_a7ddrphy_bitslip8_o <= main_ethernetsoc_a7ddrphy_bitslip8_r[14:7];
		end
	endcase
	main_ethernetsoc_a7ddrphy_bitslip9_r <= {main_ethernetsoc_a7ddrphy_bitslip9_i, main_ethernetsoc_a7ddrphy_bitslip9_r[15:8]};
	case (main_ethernetsoc_a7ddrphy_bitslip9_value)
		1'd0: begin
			main_ethernetsoc_a7ddrphy_bitslip9_o <= main_ethernetsoc_a7ddrphy_bitslip9_r[7:0];
		end
		1'd1: begin
			main_ethernetsoc_a7ddrphy_bitslip9_o <= main_ethernetsoc_a7ddrphy_bitslip9_r[8:1];
		end
		2'd2: begin
			main_ethernetsoc_a7ddrphy_bitslip9_o <= main_ethernetsoc_a7ddrphy_bitslip9_r[9:2];
		end
		2'd3: begin
			main_ethernetsoc_a7ddrphy_bitslip9_o <= main_ethernetsoc_a7ddrphy_bitslip9_r[10:3];
		end
		3'd4: begin
			main_ethernetsoc_a7ddrphy_bitslip9_o <= main_ethernetsoc_a7ddrphy_bitslip9_r[11:4];
		end
		3'd5: begin
			main_ethernetsoc_a7ddrphy_bitslip9_o <= main_ethernetsoc_a7ddrphy_bitslip9_r[12:5];
		end
		3'd6: begin
			main_ethernetsoc_a7ddrphy_bitslip9_o <= main_ethernetsoc_a7ddrphy_bitslip9_r[13:6];
		end
		3'd7: begin
			main_ethernetsoc_a7ddrphy_bitslip9_o <= main_ethernetsoc_a7ddrphy_bitslip9_r[14:7];
		end
	endcase
	main_ethernetsoc_a7ddrphy_bitslip10_r <= {main_ethernetsoc_a7ddrphy_bitslip10_i, main_ethernetsoc_a7ddrphy_bitslip10_r[15:8]};
	case (main_ethernetsoc_a7ddrphy_bitslip10_value)
		1'd0: begin
			main_ethernetsoc_a7ddrphy_bitslip10_o <= main_ethernetsoc_a7ddrphy_bitslip10_r[7:0];
		end
		1'd1: begin
			main_ethernetsoc_a7ddrphy_bitslip10_o <= main_ethernetsoc_a7ddrphy_bitslip10_r[8:1];
		end
		2'd2: begin
			main_ethernetsoc_a7ddrphy_bitslip10_o <= main_ethernetsoc_a7ddrphy_bitslip10_r[9:2];
		end
		2'd3: begin
			main_ethernetsoc_a7ddrphy_bitslip10_o <= main_ethernetsoc_a7ddrphy_bitslip10_r[10:3];
		end
		3'd4: begin
			main_ethernetsoc_a7ddrphy_bitslip10_o <= main_ethernetsoc_a7ddrphy_bitslip10_r[11:4];
		end
		3'd5: begin
			main_ethernetsoc_a7ddrphy_bitslip10_o <= main_ethernetsoc_a7ddrphy_bitslip10_r[12:5];
		end
		3'd6: begin
			main_ethernetsoc_a7ddrphy_bitslip10_o <= main_ethernetsoc_a7ddrphy_bitslip10_r[13:6];
		end
		3'd7: begin
			main_ethernetsoc_a7ddrphy_bitslip10_o <= main_ethernetsoc_a7ddrphy_bitslip10_r[14:7];
		end
	endcase
	main_ethernetsoc_a7ddrphy_bitslip11_r <= {main_ethernetsoc_a7ddrphy_bitslip11_i, main_ethernetsoc_a7ddrphy_bitslip11_r[15:8]};
	case (main_ethernetsoc_a7ddrphy_bitslip11_value)
		1'd0: begin
			main_ethernetsoc_a7ddrphy_bitslip11_o <= main_ethernetsoc_a7ddrphy_bitslip11_r[7:0];
		end
		1'd1: begin
			main_ethernetsoc_a7ddrphy_bitslip11_o <= main_ethernetsoc_a7ddrphy_bitslip11_r[8:1];
		end
		2'd2: begin
			main_ethernetsoc_a7ddrphy_bitslip11_o <= main_ethernetsoc_a7ddrphy_bitslip11_r[9:2];
		end
		2'd3: begin
			main_ethernetsoc_a7ddrphy_bitslip11_o <= main_ethernetsoc_a7ddrphy_bitslip11_r[10:3];
		end
		3'd4: begin
			main_ethernetsoc_a7ddrphy_bitslip11_o <= main_ethernetsoc_a7ddrphy_bitslip11_r[11:4];
		end
		3'd5: begin
			main_ethernetsoc_a7ddrphy_bitslip11_o <= main_ethernetsoc_a7ddrphy_bitslip11_r[12:5];
		end
		3'd6: begin
			main_ethernetsoc_a7ddrphy_bitslip11_o <= main_ethernetsoc_a7ddrphy_bitslip11_r[13:6];
		end
		3'd7: begin
			main_ethernetsoc_a7ddrphy_bitslip11_o <= main_ethernetsoc_a7ddrphy_bitslip11_r[14:7];
		end
	endcase
	main_ethernetsoc_a7ddrphy_bitslip12_r <= {main_ethernetsoc_a7ddrphy_bitslip12_i, main_ethernetsoc_a7ddrphy_bitslip12_r[15:8]};
	case (main_ethernetsoc_a7ddrphy_bitslip12_value)
		1'd0: begin
			main_ethernetsoc_a7ddrphy_bitslip12_o <= main_ethernetsoc_a7ddrphy_bitslip12_r[7:0];
		end
		1'd1: begin
			main_ethernetsoc_a7ddrphy_bitslip12_o <= main_ethernetsoc_a7ddrphy_bitslip12_r[8:1];
		end
		2'd2: begin
			main_ethernetsoc_a7ddrphy_bitslip12_o <= main_ethernetsoc_a7ddrphy_bitslip12_r[9:2];
		end
		2'd3: begin
			main_ethernetsoc_a7ddrphy_bitslip12_o <= main_ethernetsoc_a7ddrphy_bitslip12_r[10:3];
		end
		3'd4: begin
			main_ethernetsoc_a7ddrphy_bitslip12_o <= main_ethernetsoc_a7ddrphy_bitslip12_r[11:4];
		end
		3'd5: begin
			main_ethernetsoc_a7ddrphy_bitslip12_o <= main_ethernetsoc_a7ddrphy_bitslip12_r[12:5];
		end
		3'd6: begin
			main_ethernetsoc_a7ddrphy_bitslip12_o <= main_ethernetsoc_a7ddrphy_bitslip12_r[13:6];
		end
		3'd7: begin
			main_ethernetsoc_a7ddrphy_bitslip12_o <= main_ethernetsoc_a7ddrphy_bitslip12_r[14:7];
		end
	endcase
	main_ethernetsoc_a7ddrphy_bitslip13_r <= {main_ethernetsoc_a7ddrphy_bitslip13_i, main_ethernetsoc_a7ddrphy_bitslip13_r[15:8]};
	case (main_ethernetsoc_a7ddrphy_bitslip13_value)
		1'd0: begin
			main_ethernetsoc_a7ddrphy_bitslip13_o <= main_ethernetsoc_a7ddrphy_bitslip13_r[7:0];
		end
		1'd1: begin
			main_ethernetsoc_a7ddrphy_bitslip13_o <= main_ethernetsoc_a7ddrphy_bitslip13_r[8:1];
		end
		2'd2: begin
			main_ethernetsoc_a7ddrphy_bitslip13_o <= main_ethernetsoc_a7ddrphy_bitslip13_r[9:2];
		end
		2'd3: begin
			main_ethernetsoc_a7ddrphy_bitslip13_o <= main_ethernetsoc_a7ddrphy_bitslip13_r[10:3];
		end
		3'd4: begin
			main_ethernetsoc_a7ddrphy_bitslip13_o <= main_ethernetsoc_a7ddrphy_bitslip13_r[11:4];
		end
		3'd5: begin
			main_ethernetsoc_a7ddrphy_bitslip13_o <= main_ethernetsoc_a7ddrphy_bitslip13_r[12:5];
		end
		3'd6: begin
			main_ethernetsoc_a7ddrphy_bitslip13_o <= main_ethernetsoc_a7ddrphy_bitslip13_r[13:6];
		end
		3'd7: begin
			main_ethernetsoc_a7ddrphy_bitslip13_o <= main_ethernetsoc_a7ddrphy_bitslip13_r[14:7];
		end
	endcase
	main_ethernetsoc_a7ddrphy_bitslip14_r <= {main_ethernetsoc_a7ddrphy_bitslip14_i, main_ethernetsoc_a7ddrphy_bitslip14_r[15:8]};
	case (main_ethernetsoc_a7ddrphy_bitslip14_value)
		1'd0: begin
			main_ethernetsoc_a7ddrphy_bitslip14_o <= main_ethernetsoc_a7ddrphy_bitslip14_r[7:0];
		end
		1'd1: begin
			main_ethernetsoc_a7ddrphy_bitslip14_o <= main_ethernetsoc_a7ddrphy_bitslip14_r[8:1];
		end
		2'd2: begin
			main_ethernetsoc_a7ddrphy_bitslip14_o <= main_ethernetsoc_a7ddrphy_bitslip14_r[9:2];
		end
		2'd3: begin
			main_ethernetsoc_a7ddrphy_bitslip14_o <= main_ethernetsoc_a7ddrphy_bitslip14_r[10:3];
		end
		3'd4: begin
			main_ethernetsoc_a7ddrphy_bitslip14_o <= main_ethernetsoc_a7ddrphy_bitslip14_r[11:4];
		end
		3'd5: begin
			main_ethernetsoc_a7ddrphy_bitslip14_o <= main_ethernetsoc_a7ddrphy_bitslip14_r[12:5];
		end
		3'd6: begin
			main_ethernetsoc_a7ddrphy_bitslip14_o <= main_ethernetsoc_a7ddrphy_bitslip14_r[13:6];
		end
		3'd7: begin
			main_ethernetsoc_a7ddrphy_bitslip14_o <= main_ethernetsoc_a7ddrphy_bitslip14_r[14:7];
		end
	endcase
	main_ethernetsoc_a7ddrphy_bitslip15_r <= {main_ethernetsoc_a7ddrphy_bitslip15_i, main_ethernetsoc_a7ddrphy_bitslip15_r[15:8]};
	case (main_ethernetsoc_a7ddrphy_bitslip15_value)
		1'd0: begin
			main_ethernetsoc_a7ddrphy_bitslip15_o <= main_ethernetsoc_a7ddrphy_bitslip15_r[7:0];
		end
		1'd1: begin
			main_ethernetsoc_a7ddrphy_bitslip15_o <= main_ethernetsoc_a7ddrphy_bitslip15_r[8:1];
		end
		2'd2: begin
			main_ethernetsoc_a7ddrphy_bitslip15_o <= main_ethernetsoc_a7ddrphy_bitslip15_r[9:2];
		end
		2'd3: begin
			main_ethernetsoc_a7ddrphy_bitslip15_o <= main_ethernetsoc_a7ddrphy_bitslip15_r[10:3];
		end
		3'd4: begin
			main_ethernetsoc_a7ddrphy_bitslip15_o <= main_ethernetsoc_a7ddrphy_bitslip15_r[11:4];
		end
		3'd5: begin
			main_ethernetsoc_a7ddrphy_bitslip15_o <= main_ethernetsoc_a7ddrphy_bitslip15_r[12:5];
		end
		3'd6: begin
			main_ethernetsoc_a7ddrphy_bitslip15_o <= main_ethernetsoc_a7ddrphy_bitslip15_r[13:6];
		end
		3'd7: begin
			main_ethernetsoc_a7ddrphy_bitslip15_o <= main_ethernetsoc_a7ddrphy_bitslip15_r[14:7];
		end
	endcase
	if (main_ethernetsoc_sdram_inti_p0_rddata_valid) begin
		main_ethernetsoc_sdram_phaseinjector0_status <= main_ethernetsoc_sdram_inti_p0_rddata;
	end
	if (main_ethernetsoc_sdram_inti_p1_rddata_valid) begin
		main_ethernetsoc_sdram_phaseinjector1_status <= main_ethernetsoc_sdram_inti_p1_rddata;
	end
	if (main_ethernetsoc_sdram_inti_p2_rddata_valid) begin
		main_ethernetsoc_sdram_phaseinjector2_status <= main_ethernetsoc_sdram_inti_p2_rddata;
	end
	if (main_ethernetsoc_sdram_inti_p3_rddata_valid) begin
		main_ethernetsoc_sdram_phaseinjector3_status <= main_ethernetsoc_sdram_inti_p3_rddata;
	end
	if (main_ethernetsoc_sdram_timer_wait) begin
		if ((~main_ethernetsoc_sdram_timer_done)) begin
			if ((main_ethernetsoc_sdram_timer_load & (main_ethernetsoc_sdram_timer_load_count < main_ethernetsoc_sdram_timer_count))) begin
				main_ethernetsoc_sdram_timer_count <= main_ethernetsoc_sdram_timer_load_count;
			end else begin
				main_ethernetsoc_sdram_timer_count <= (main_ethernetsoc_sdram_timer_count - 1'd1);
			end
		end
	end else begin
		main_ethernetsoc_sdram_timer_count <= 10'd782;
	end
	if (main_ethernetsoc_sdram_timer_reset) begin
		main_ethernetsoc_sdram_timer_count <= 10'd782;
	end
	main_ethernetsoc_sdram_cmd_payload_a <= 11'd1024;
	main_ethernetsoc_sdram_cmd_payload_ba <= 1'd0;
	main_ethernetsoc_sdram_cmd_payload_cas <= 1'd0;
	main_ethernetsoc_sdram_cmd_payload_ras <= 1'd0;
	main_ethernetsoc_sdram_cmd_payload_we <= 1'd0;
	main_ethernetsoc_sdram_generator_done <= 1'd0;
	if ((main_ethernetsoc_sdram_generator_counter == 1'd1)) begin
		main_ethernetsoc_sdram_cmd_payload_ras <= 1'd1;
		main_ethernetsoc_sdram_cmd_payload_we <= 1'd1;
	end
	if ((main_ethernetsoc_sdram_generator_counter == 3'd4)) begin
		main_ethernetsoc_sdram_cmd_payload_cas <= 1'd1;
		main_ethernetsoc_sdram_cmd_payload_ras <= 1'd1;
	end
	if ((main_ethernetsoc_sdram_generator_counter == 6'd36)) begin
		main_ethernetsoc_sdram_generator_done <= 1'd1;
	end
	if ((main_ethernetsoc_sdram_generator_counter == 6'd36)) begin
		main_ethernetsoc_sdram_generator_counter <= 1'd0;
	end else begin
		if ((main_ethernetsoc_sdram_generator_counter != 1'd0)) begin
			main_ethernetsoc_sdram_generator_counter <= (main_ethernetsoc_sdram_generator_counter + 1'd1);
		end else begin
			if (main_ethernetsoc_sdram_generator_start) begin
				main_ethernetsoc_sdram_generator_counter <= 1'd1;
			end
		end
	end
	builder_refresher_state <= builder_refresher_next_state;
	if (main_ethernetsoc_sdram_bankmachine0_row_close) begin
		main_ethernetsoc_sdram_bankmachine0_row_opened <= 1'd0;
	end else begin
		if (main_ethernetsoc_sdram_bankmachine0_row_open) begin
			main_ethernetsoc_sdram_bankmachine0_row_opened <= 1'd1;
			main_ethernetsoc_sdram_bankmachine0_row <= main_ethernetsoc_sdram_bankmachine0_cmd_buffer_source_payload_addr[20:7];
		end
	end
	if (((main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_we & main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_writable) & (~main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_replace))) begin
		main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_produce <= (main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_produce + 1'd1);
	end
	if (main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_do_read) begin
		main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_consume <= (main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_consume + 1'd1);
	end
	if (((main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_we & main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_writable) & (~main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_replace))) begin
		if ((~main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_do_read)) begin
			main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_level <= (main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_level + 1'd1);
		end
	end else begin
		if (main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_do_read) begin
			main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_level <= (main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_level - 1'd1);
		end
	end
	if (main_ethernetsoc_sdram_bankmachine0_cmd_buffer_pipe_ce) begin
		main_ethernetsoc_sdram_bankmachine0_cmd_buffer_valid_n <= main_ethernetsoc_sdram_bankmachine0_cmd_buffer_sink_valid;
	end
	if (main_ethernetsoc_sdram_bankmachine0_cmd_buffer_pipe_ce) begin
		main_ethernetsoc_sdram_bankmachine0_cmd_buffer_first_n <= (main_ethernetsoc_sdram_bankmachine0_cmd_buffer_sink_valid & main_ethernetsoc_sdram_bankmachine0_cmd_buffer_sink_first);
		main_ethernetsoc_sdram_bankmachine0_cmd_buffer_last_n <= (main_ethernetsoc_sdram_bankmachine0_cmd_buffer_sink_valid & main_ethernetsoc_sdram_bankmachine0_cmd_buffer_sink_last);
	end
	if (main_ethernetsoc_sdram_bankmachine0_cmd_buffer_pipe_ce) begin
		main_ethernetsoc_sdram_bankmachine0_cmd_buffer_source_payload_we <= main_ethernetsoc_sdram_bankmachine0_cmd_buffer_sink_payload_we;
		main_ethernetsoc_sdram_bankmachine0_cmd_buffer_source_payload_addr <= main_ethernetsoc_sdram_bankmachine0_cmd_buffer_sink_payload_addr;
	end
	if (main_ethernetsoc_sdram_bankmachine0_twtpcon_valid) begin
		main_ethernetsoc_sdram_bankmachine0_twtpcon_count <= 3'd5;
		if (1'd0) begin
			main_ethernetsoc_sdram_bankmachine0_twtpcon_ready <= 1'd1;
		end else begin
			main_ethernetsoc_sdram_bankmachine0_twtpcon_ready <= 1'd0;
		end
	end else begin
		if ((~main_ethernetsoc_sdram_bankmachine0_twtpcon_ready)) begin
			main_ethernetsoc_sdram_bankmachine0_twtpcon_count <= (main_ethernetsoc_sdram_bankmachine0_twtpcon_count - 1'd1);
			if ((main_ethernetsoc_sdram_bankmachine0_twtpcon_count == 1'd1)) begin
				main_ethernetsoc_sdram_bankmachine0_twtpcon_ready <= 1'd1;
			end
		end
	end
	if (main_ethernetsoc_sdram_bankmachine0_trccon_valid) begin
		main_ethernetsoc_sdram_bankmachine0_trccon_count <= 3'd5;
		if (1'd0) begin
			main_ethernetsoc_sdram_bankmachine0_trccon_ready <= 1'd1;
		end else begin
			main_ethernetsoc_sdram_bankmachine0_trccon_ready <= 1'd0;
		end
	end else begin
		if ((~main_ethernetsoc_sdram_bankmachine0_trccon_ready)) begin
			main_ethernetsoc_sdram_bankmachine0_trccon_count <= (main_ethernetsoc_sdram_bankmachine0_trccon_count - 1'd1);
			if ((main_ethernetsoc_sdram_bankmachine0_trccon_count == 1'd1)) begin
				main_ethernetsoc_sdram_bankmachine0_trccon_ready <= 1'd1;
			end
		end
	end
	if (main_ethernetsoc_sdram_bankmachine0_trascon_valid) begin
		main_ethernetsoc_sdram_bankmachine0_trascon_count <= 3'd4;
		if (1'd0) begin
			main_ethernetsoc_sdram_bankmachine0_trascon_ready <= 1'd1;
		end else begin
			main_ethernetsoc_sdram_bankmachine0_trascon_ready <= 1'd0;
		end
	end else begin
		if ((~main_ethernetsoc_sdram_bankmachine0_trascon_ready)) begin
			main_ethernetsoc_sdram_bankmachine0_trascon_count <= (main_ethernetsoc_sdram_bankmachine0_trascon_count - 1'd1);
			if ((main_ethernetsoc_sdram_bankmachine0_trascon_count == 1'd1)) begin
				main_ethernetsoc_sdram_bankmachine0_trascon_ready <= 1'd1;
			end
		end
	end
	builder_bankmachine0_state <= builder_bankmachine0_next_state;
	if (main_ethernetsoc_sdram_bankmachine1_row_close) begin
		main_ethernetsoc_sdram_bankmachine1_row_opened <= 1'd0;
	end else begin
		if (main_ethernetsoc_sdram_bankmachine1_row_open) begin
			main_ethernetsoc_sdram_bankmachine1_row_opened <= 1'd1;
			main_ethernetsoc_sdram_bankmachine1_row <= main_ethernetsoc_sdram_bankmachine1_cmd_buffer_source_payload_addr[20:7];
		end
	end
	if (((main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_we & main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_writable) & (~main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_replace))) begin
		main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_produce <= (main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_produce + 1'd1);
	end
	if (main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_do_read) begin
		main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_consume <= (main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_consume + 1'd1);
	end
	if (((main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_we & main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_writable) & (~main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_replace))) begin
		if ((~main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_do_read)) begin
			main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_level <= (main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_level + 1'd1);
		end
	end else begin
		if (main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_do_read) begin
			main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_level <= (main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_level - 1'd1);
		end
	end
	if (main_ethernetsoc_sdram_bankmachine1_cmd_buffer_pipe_ce) begin
		main_ethernetsoc_sdram_bankmachine1_cmd_buffer_valid_n <= main_ethernetsoc_sdram_bankmachine1_cmd_buffer_sink_valid;
	end
	if (main_ethernetsoc_sdram_bankmachine1_cmd_buffer_pipe_ce) begin
		main_ethernetsoc_sdram_bankmachine1_cmd_buffer_first_n <= (main_ethernetsoc_sdram_bankmachine1_cmd_buffer_sink_valid & main_ethernetsoc_sdram_bankmachine1_cmd_buffer_sink_first);
		main_ethernetsoc_sdram_bankmachine1_cmd_buffer_last_n <= (main_ethernetsoc_sdram_bankmachine1_cmd_buffer_sink_valid & main_ethernetsoc_sdram_bankmachine1_cmd_buffer_sink_last);
	end
	if (main_ethernetsoc_sdram_bankmachine1_cmd_buffer_pipe_ce) begin
		main_ethernetsoc_sdram_bankmachine1_cmd_buffer_source_payload_we <= main_ethernetsoc_sdram_bankmachine1_cmd_buffer_sink_payload_we;
		main_ethernetsoc_sdram_bankmachine1_cmd_buffer_source_payload_addr <= main_ethernetsoc_sdram_bankmachine1_cmd_buffer_sink_payload_addr;
	end
	if (main_ethernetsoc_sdram_bankmachine1_twtpcon_valid) begin
		main_ethernetsoc_sdram_bankmachine1_twtpcon_count <= 3'd5;
		if (1'd0) begin
			main_ethernetsoc_sdram_bankmachine1_twtpcon_ready <= 1'd1;
		end else begin
			main_ethernetsoc_sdram_bankmachine1_twtpcon_ready <= 1'd0;
		end
	end else begin
		if ((~main_ethernetsoc_sdram_bankmachine1_twtpcon_ready)) begin
			main_ethernetsoc_sdram_bankmachine1_twtpcon_count <= (main_ethernetsoc_sdram_bankmachine1_twtpcon_count - 1'd1);
			if ((main_ethernetsoc_sdram_bankmachine1_twtpcon_count == 1'd1)) begin
				main_ethernetsoc_sdram_bankmachine1_twtpcon_ready <= 1'd1;
			end
		end
	end
	if (main_ethernetsoc_sdram_bankmachine1_trccon_valid) begin
		main_ethernetsoc_sdram_bankmachine1_trccon_count <= 3'd5;
		if (1'd0) begin
			main_ethernetsoc_sdram_bankmachine1_trccon_ready <= 1'd1;
		end else begin
			main_ethernetsoc_sdram_bankmachine1_trccon_ready <= 1'd0;
		end
	end else begin
		if ((~main_ethernetsoc_sdram_bankmachine1_trccon_ready)) begin
			main_ethernetsoc_sdram_bankmachine1_trccon_count <= (main_ethernetsoc_sdram_bankmachine1_trccon_count - 1'd1);
			if ((main_ethernetsoc_sdram_bankmachine1_trccon_count == 1'd1)) begin
				main_ethernetsoc_sdram_bankmachine1_trccon_ready <= 1'd1;
			end
		end
	end
	if (main_ethernetsoc_sdram_bankmachine1_trascon_valid) begin
		main_ethernetsoc_sdram_bankmachine1_trascon_count <= 3'd4;
		if (1'd0) begin
			main_ethernetsoc_sdram_bankmachine1_trascon_ready <= 1'd1;
		end else begin
			main_ethernetsoc_sdram_bankmachine1_trascon_ready <= 1'd0;
		end
	end else begin
		if ((~main_ethernetsoc_sdram_bankmachine1_trascon_ready)) begin
			main_ethernetsoc_sdram_bankmachine1_trascon_count <= (main_ethernetsoc_sdram_bankmachine1_trascon_count - 1'd1);
			if ((main_ethernetsoc_sdram_bankmachine1_trascon_count == 1'd1)) begin
				main_ethernetsoc_sdram_bankmachine1_trascon_ready <= 1'd1;
			end
		end
	end
	builder_bankmachine1_state <= builder_bankmachine1_next_state;
	if (main_ethernetsoc_sdram_bankmachine2_row_close) begin
		main_ethernetsoc_sdram_bankmachine2_row_opened <= 1'd0;
	end else begin
		if (main_ethernetsoc_sdram_bankmachine2_row_open) begin
			main_ethernetsoc_sdram_bankmachine2_row_opened <= 1'd1;
			main_ethernetsoc_sdram_bankmachine2_row <= main_ethernetsoc_sdram_bankmachine2_cmd_buffer_source_payload_addr[20:7];
		end
	end
	if (((main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_we & main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_writable) & (~main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_replace))) begin
		main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_produce <= (main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_produce + 1'd1);
	end
	if (main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_do_read) begin
		main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_consume <= (main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_consume + 1'd1);
	end
	if (((main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_we & main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_writable) & (~main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_replace))) begin
		if ((~main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_do_read)) begin
			main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_level <= (main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_level + 1'd1);
		end
	end else begin
		if (main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_do_read) begin
			main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_level <= (main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_level - 1'd1);
		end
	end
	if (main_ethernetsoc_sdram_bankmachine2_cmd_buffer_pipe_ce) begin
		main_ethernetsoc_sdram_bankmachine2_cmd_buffer_valid_n <= main_ethernetsoc_sdram_bankmachine2_cmd_buffer_sink_valid;
	end
	if (main_ethernetsoc_sdram_bankmachine2_cmd_buffer_pipe_ce) begin
		main_ethernetsoc_sdram_bankmachine2_cmd_buffer_first_n <= (main_ethernetsoc_sdram_bankmachine2_cmd_buffer_sink_valid & main_ethernetsoc_sdram_bankmachine2_cmd_buffer_sink_first);
		main_ethernetsoc_sdram_bankmachine2_cmd_buffer_last_n <= (main_ethernetsoc_sdram_bankmachine2_cmd_buffer_sink_valid & main_ethernetsoc_sdram_bankmachine2_cmd_buffer_sink_last);
	end
	if (main_ethernetsoc_sdram_bankmachine2_cmd_buffer_pipe_ce) begin
		main_ethernetsoc_sdram_bankmachine2_cmd_buffer_source_payload_we <= main_ethernetsoc_sdram_bankmachine2_cmd_buffer_sink_payload_we;
		main_ethernetsoc_sdram_bankmachine2_cmd_buffer_source_payload_addr <= main_ethernetsoc_sdram_bankmachine2_cmd_buffer_sink_payload_addr;
	end
	if (main_ethernetsoc_sdram_bankmachine2_twtpcon_valid) begin
		main_ethernetsoc_sdram_bankmachine2_twtpcon_count <= 3'd5;
		if (1'd0) begin
			main_ethernetsoc_sdram_bankmachine2_twtpcon_ready <= 1'd1;
		end else begin
			main_ethernetsoc_sdram_bankmachine2_twtpcon_ready <= 1'd0;
		end
	end else begin
		if ((~main_ethernetsoc_sdram_bankmachine2_twtpcon_ready)) begin
			main_ethernetsoc_sdram_bankmachine2_twtpcon_count <= (main_ethernetsoc_sdram_bankmachine2_twtpcon_count - 1'd1);
			if ((main_ethernetsoc_sdram_bankmachine2_twtpcon_count == 1'd1)) begin
				main_ethernetsoc_sdram_bankmachine2_twtpcon_ready <= 1'd1;
			end
		end
	end
	if (main_ethernetsoc_sdram_bankmachine2_trccon_valid) begin
		main_ethernetsoc_sdram_bankmachine2_trccon_count <= 3'd5;
		if (1'd0) begin
			main_ethernetsoc_sdram_bankmachine2_trccon_ready <= 1'd1;
		end else begin
			main_ethernetsoc_sdram_bankmachine2_trccon_ready <= 1'd0;
		end
	end else begin
		if ((~main_ethernetsoc_sdram_bankmachine2_trccon_ready)) begin
			main_ethernetsoc_sdram_bankmachine2_trccon_count <= (main_ethernetsoc_sdram_bankmachine2_trccon_count - 1'd1);
			if ((main_ethernetsoc_sdram_bankmachine2_trccon_count == 1'd1)) begin
				main_ethernetsoc_sdram_bankmachine2_trccon_ready <= 1'd1;
			end
		end
	end
	if (main_ethernetsoc_sdram_bankmachine2_trascon_valid) begin
		main_ethernetsoc_sdram_bankmachine2_trascon_count <= 3'd4;
		if (1'd0) begin
			main_ethernetsoc_sdram_bankmachine2_trascon_ready <= 1'd1;
		end else begin
			main_ethernetsoc_sdram_bankmachine2_trascon_ready <= 1'd0;
		end
	end else begin
		if ((~main_ethernetsoc_sdram_bankmachine2_trascon_ready)) begin
			main_ethernetsoc_sdram_bankmachine2_trascon_count <= (main_ethernetsoc_sdram_bankmachine2_trascon_count - 1'd1);
			if ((main_ethernetsoc_sdram_bankmachine2_trascon_count == 1'd1)) begin
				main_ethernetsoc_sdram_bankmachine2_trascon_ready <= 1'd1;
			end
		end
	end
	builder_bankmachine2_state <= builder_bankmachine2_next_state;
	if (main_ethernetsoc_sdram_bankmachine3_row_close) begin
		main_ethernetsoc_sdram_bankmachine3_row_opened <= 1'd0;
	end else begin
		if (main_ethernetsoc_sdram_bankmachine3_row_open) begin
			main_ethernetsoc_sdram_bankmachine3_row_opened <= 1'd1;
			main_ethernetsoc_sdram_bankmachine3_row <= main_ethernetsoc_sdram_bankmachine3_cmd_buffer_source_payload_addr[20:7];
		end
	end
	if (((main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_we & main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_writable) & (~main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_replace))) begin
		main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_produce <= (main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_produce + 1'd1);
	end
	if (main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_do_read) begin
		main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_consume <= (main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_consume + 1'd1);
	end
	if (((main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_we & main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_writable) & (~main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_replace))) begin
		if ((~main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_do_read)) begin
			main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_level <= (main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_level + 1'd1);
		end
	end else begin
		if (main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_do_read) begin
			main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_level <= (main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_level - 1'd1);
		end
	end
	if (main_ethernetsoc_sdram_bankmachine3_cmd_buffer_pipe_ce) begin
		main_ethernetsoc_sdram_bankmachine3_cmd_buffer_valid_n <= main_ethernetsoc_sdram_bankmachine3_cmd_buffer_sink_valid;
	end
	if (main_ethernetsoc_sdram_bankmachine3_cmd_buffer_pipe_ce) begin
		main_ethernetsoc_sdram_bankmachine3_cmd_buffer_first_n <= (main_ethernetsoc_sdram_bankmachine3_cmd_buffer_sink_valid & main_ethernetsoc_sdram_bankmachine3_cmd_buffer_sink_first);
		main_ethernetsoc_sdram_bankmachine3_cmd_buffer_last_n <= (main_ethernetsoc_sdram_bankmachine3_cmd_buffer_sink_valid & main_ethernetsoc_sdram_bankmachine3_cmd_buffer_sink_last);
	end
	if (main_ethernetsoc_sdram_bankmachine3_cmd_buffer_pipe_ce) begin
		main_ethernetsoc_sdram_bankmachine3_cmd_buffer_source_payload_we <= main_ethernetsoc_sdram_bankmachine3_cmd_buffer_sink_payload_we;
		main_ethernetsoc_sdram_bankmachine3_cmd_buffer_source_payload_addr <= main_ethernetsoc_sdram_bankmachine3_cmd_buffer_sink_payload_addr;
	end
	if (main_ethernetsoc_sdram_bankmachine3_twtpcon_valid) begin
		main_ethernetsoc_sdram_bankmachine3_twtpcon_count <= 3'd5;
		if (1'd0) begin
			main_ethernetsoc_sdram_bankmachine3_twtpcon_ready <= 1'd1;
		end else begin
			main_ethernetsoc_sdram_bankmachine3_twtpcon_ready <= 1'd0;
		end
	end else begin
		if ((~main_ethernetsoc_sdram_bankmachine3_twtpcon_ready)) begin
			main_ethernetsoc_sdram_bankmachine3_twtpcon_count <= (main_ethernetsoc_sdram_bankmachine3_twtpcon_count - 1'd1);
			if ((main_ethernetsoc_sdram_bankmachine3_twtpcon_count == 1'd1)) begin
				main_ethernetsoc_sdram_bankmachine3_twtpcon_ready <= 1'd1;
			end
		end
	end
	if (main_ethernetsoc_sdram_bankmachine3_trccon_valid) begin
		main_ethernetsoc_sdram_bankmachine3_trccon_count <= 3'd5;
		if (1'd0) begin
			main_ethernetsoc_sdram_bankmachine3_trccon_ready <= 1'd1;
		end else begin
			main_ethernetsoc_sdram_bankmachine3_trccon_ready <= 1'd0;
		end
	end else begin
		if ((~main_ethernetsoc_sdram_bankmachine3_trccon_ready)) begin
			main_ethernetsoc_sdram_bankmachine3_trccon_count <= (main_ethernetsoc_sdram_bankmachine3_trccon_count - 1'd1);
			if ((main_ethernetsoc_sdram_bankmachine3_trccon_count == 1'd1)) begin
				main_ethernetsoc_sdram_bankmachine3_trccon_ready <= 1'd1;
			end
		end
	end
	if (main_ethernetsoc_sdram_bankmachine3_trascon_valid) begin
		main_ethernetsoc_sdram_bankmachine3_trascon_count <= 3'd4;
		if (1'd0) begin
			main_ethernetsoc_sdram_bankmachine3_trascon_ready <= 1'd1;
		end else begin
			main_ethernetsoc_sdram_bankmachine3_trascon_ready <= 1'd0;
		end
	end else begin
		if ((~main_ethernetsoc_sdram_bankmachine3_trascon_ready)) begin
			main_ethernetsoc_sdram_bankmachine3_trascon_count <= (main_ethernetsoc_sdram_bankmachine3_trascon_count - 1'd1);
			if ((main_ethernetsoc_sdram_bankmachine3_trascon_count == 1'd1)) begin
				main_ethernetsoc_sdram_bankmachine3_trascon_ready <= 1'd1;
			end
		end
	end
	builder_bankmachine3_state <= builder_bankmachine3_next_state;
	if (main_ethernetsoc_sdram_bankmachine4_row_close) begin
		main_ethernetsoc_sdram_bankmachine4_row_opened <= 1'd0;
	end else begin
		if (main_ethernetsoc_sdram_bankmachine4_row_open) begin
			main_ethernetsoc_sdram_bankmachine4_row_opened <= 1'd1;
			main_ethernetsoc_sdram_bankmachine4_row <= main_ethernetsoc_sdram_bankmachine4_cmd_buffer_source_payload_addr[20:7];
		end
	end
	if (((main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_we & main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_writable) & (~main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_replace))) begin
		main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_produce <= (main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_produce + 1'd1);
	end
	if (main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_do_read) begin
		main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_consume <= (main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_consume + 1'd1);
	end
	if (((main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_we & main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_writable) & (~main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_replace))) begin
		if ((~main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_do_read)) begin
			main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_level <= (main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_level + 1'd1);
		end
	end else begin
		if (main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_do_read) begin
			main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_level <= (main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_level - 1'd1);
		end
	end
	if (main_ethernetsoc_sdram_bankmachine4_cmd_buffer_pipe_ce) begin
		main_ethernetsoc_sdram_bankmachine4_cmd_buffer_valid_n <= main_ethernetsoc_sdram_bankmachine4_cmd_buffer_sink_valid;
	end
	if (main_ethernetsoc_sdram_bankmachine4_cmd_buffer_pipe_ce) begin
		main_ethernetsoc_sdram_bankmachine4_cmd_buffer_first_n <= (main_ethernetsoc_sdram_bankmachine4_cmd_buffer_sink_valid & main_ethernetsoc_sdram_bankmachine4_cmd_buffer_sink_first);
		main_ethernetsoc_sdram_bankmachine4_cmd_buffer_last_n <= (main_ethernetsoc_sdram_bankmachine4_cmd_buffer_sink_valid & main_ethernetsoc_sdram_bankmachine4_cmd_buffer_sink_last);
	end
	if (main_ethernetsoc_sdram_bankmachine4_cmd_buffer_pipe_ce) begin
		main_ethernetsoc_sdram_bankmachine4_cmd_buffer_source_payload_we <= main_ethernetsoc_sdram_bankmachine4_cmd_buffer_sink_payload_we;
		main_ethernetsoc_sdram_bankmachine4_cmd_buffer_source_payload_addr <= main_ethernetsoc_sdram_bankmachine4_cmd_buffer_sink_payload_addr;
	end
	if (main_ethernetsoc_sdram_bankmachine4_twtpcon_valid) begin
		main_ethernetsoc_sdram_bankmachine4_twtpcon_count <= 3'd5;
		if (1'd0) begin
			main_ethernetsoc_sdram_bankmachine4_twtpcon_ready <= 1'd1;
		end else begin
			main_ethernetsoc_sdram_bankmachine4_twtpcon_ready <= 1'd0;
		end
	end else begin
		if ((~main_ethernetsoc_sdram_bankmachine4_twtpcon_ready)) begin
			main_ethernetsoc_sdram_bankmachine4_twtpcon_count <= (main_ethernetsoc_sdram_bankmachine4_twtpcon_count - 1'd1);
			if ((main_ethernetsoc_sdram_bankmachine4_twtpcon_count == 1'd1)) begin
				main_ethernetsoc_sdram_bankmachine4_twtpcon_ready <= 1'd1;
			end
		end
	end
	if (main_ethernetsoc_sdram_bankmachine4_trccon_valid) begin
		main_ethernetsoc_sdram_bankmachine4_trccon_count <= 3'd5;
		if (1'd0) begin
			main_ethernetsoc_sdram_bankmachine4_trccon_ready <= 1'd1;
		end else begin
			main_ethernetsoc_sdram_bankmachine4_trccon_ready <= 1'd0;
		end
	end else begin
		if ((~main_ethernetsoc_sdram_bankmachine4_trccon_ready)) begin
			main_ethernetsoc_sdram_bankmachine4_trccon_count <= (main_ethernetsoc_sdram_bankmachine4_trccon_count - 1'd1);
			if ((main_ethernetsoc_sdram_bankmachine4_trccon_count == 1'd1)) begin
				main_ethernetsoc_sdram_bankmachine4_trccon_ready <= 1'd1;
			end
		end
	end
	if (main_ethernetsoc_sdram_bankmachine4_trascon_valid) begin
		main_ethernetsoc_sdram_bankmachine4_trascon_count <= 3'd4;
		if (1'd0) begin
			main_ethernetsoc_sdram_bankmachine4_trascon_ready <= 1'd1;
		end else begin
			main_ethernetsoc_sdram_bankmachine4_trascon_ready <= 1'd0;
		end
	end else begin
		if ((~main_ethernetsoc_sdram_bankmachine4_trascon_ready)) begin
			main_ethernetsoc_sdram_bankmachine4_trascon_count <= (main_ethernetsoc_sdram_bankmachine4_trascon_count - 1'd1);
			if ((main_ethernetsoc_sdram_bankmachine4_trascon_count == 1'd1)) begin
				main_ethernetsoc_sdram_bankmachine4_trascon_ready <= 1'd1;
			end
		end
	end
	builder_bankmachine4_state <= builder_bankmachine4_next_state;
	if (main_ethernetsoc_sdram_bankmachine5_row_close) begin
		main_ethernetsoc_sdram_bankmachine5_row_opened <= 1'd0;
	end else begin
		if (main_ethernetsoc_sdram_bankmachine5_row_open) begin
			main_ethernetsoc_sdram_bankmachine5_row_opened <= 1'd1;
			main_ethernetsoc_sdram_bankmachine5_row <= main_ethernetsoc_sdram_bankmachine5_cmd_buffer_source_payload_addr[20:7];
		end
	end
	if (((main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_we & main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_writable) & (~main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_replace))) begin
		main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_produce <= (main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_produce + 1'd1);
	end
	if (main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_do_read) begin
		main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_consume <= (main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_consume + 1'd1);
	end
	if (((main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_we & main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_writable) & (~main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_replace))) begin
		if ((~main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_do_read)) begin
			main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_level <= (main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_level + 1'd1);
		end
	end else begin
		if (main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_do_read) begin
			main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_level <= (main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_level - 1'd1);
		end
	end
	if (main_ethernetsoc_sdram_bankmachine5_cmd_buffer_pipe_ce) begin
		main_ethernetsoc_sdram_bankmachine5_cmd_buffer_valid_n <= main_ethernetsoc_sdram_bankmachine5_cmd_buffer_sink_valid;
	end
	if (main_ethernetsoc_sdram_bankmachine5_cmd_buffer_pipe_ce) begin
		main_ethernetsoc_sdram_bankmachine5_cmd_buffer_first_n <= (main_ethernetsoc_sdram_bankmachine5_cmd_buffer_sink_valid & main_ethernetsoc_sdram_bankmachine5_cmd_buffer_sink_first);
		main_ethernetsoc_sdram_bankmachine5_cmd_buffer_last_n <= (main_ethernetsoc_sdram_bankmachine5_cmd_buffer_sink_valid & main_ethernetsoc_sdram_bankmachine5_cmd_buffer_sink_last);
	end
	if (main_ethernetsoc_sdram_bankmachine5_cmd_buffer_pipe_ce) begin
		main_ethernetsoc_sdram_bankmachine5_cmd_buffer_source_payload_we <= main_ethernetsoc_sdram_bankmachine5_cmd_buffer_sink_payload_we;
		main_ethernetsoc_sdram_bankmachine5_cmd_buffer_source_payload_addr <= main_ethernetsoc_sdram_bankmachine5_cmd_buffer_sink_payload_addr;
	end
	if (main_ethernetsoc_sdram_bankmachine5_twtpcon_valid) begin
		main_ethernetsoc_sdram_bankmachine5_twtpcon_count <= 3'd5;
		if (1'd0) begin
			main_ethernetsoc_sdram_bankmachine5_twtpcon_ready <= 1'd1;
		end else begin
			main_ethernetsoc_sdram_bankmachine5_twtpcon_ready <= 1'd0;
		end
	end else begin
		if ((~main_ethernetsoc_sdram_bankmachine5_twtpcon_ready)) begin
			main_ethernetsoc_sdram_bankmachine5_twtpcon_count <= (main_ethernetsoc_sdram_bankmachine5_twtpcon_count - 1'd1);
			if ((main_ethernetsoc_sdram_bankmachine5_twtpcon_count == 1'd1)) begin
				main_ethernetsoc_sdram_bankmachine5_twtpcon_ready <= 1'd1;
			end
		end
	end
	if (main_ethernetsoc_sdram_bankmachine5_trccon_valid) begin
		main_ethernetsoc_sdram_bankmachine5_trccon_count <= 3'd5;
		if (1'd0) begin
			main_ethernetsoc_sdram_bankmachine5_trccon_ready <= 1'd1;
		end else begin
			main_ethernetsoc_sdram_bankmachine5_trccon_ready <= 1'd0;
		end
	end else begin
		if ((~main_ethernetsoc_sdram_bankmachine5_trccon_ready)) begin
			main_ethernetsoc_sdram_bankmachine5_trccon_count <= (main_ethernetsoc_sdram_bankmachine5_trccon_count - 1'd1);
			if ((main_ethernetsoc_sdram_bankmachine5_trccon_count == 1'd1)) begin
				main_ethernetsoc_sdram_bankmachine5_trccon_ready <= 1'd1;
			end
		end
	end
	if (main_ethernetsoc_sdram_bankmachine5_trascon_valid) begin
		main_ethernetsoc_sdram_bankmachine5_trascon_count <= 3'd4;
		if (1'd0) begin
			main_ethernetsoc_sdram_bankmachine5_trascon_ready <= 1'd1;
		end else begin
			main_ethernetsoc_sdram_bankmachine5_trascon_ready <= 1'd0;
		end
	end else begin
		if ((~main_ethernetsoc_sdram_bankmachine5_trascon_ready)) begin
			main_ethernetsoc_sdram_bankmachine5_trascon_count <= (main_ethernetsoc_sdram_bankmachine5_trascon_count - 1'd1);
			if ((main_ethernetsoc_sdram_bankmachine5_trascon_count == 1'd1)) begin
				main_ethernetsoc_sdram_bankmachine5_trascon_ready <= 1'd1;
			end
		end
	end
	builder_bankmachine5_state <= builder_bankmachine5_next_state;
	if (main_ethernetsoc_sdram_bankmachine6_row_close) begin
		main_ethernetsoc_sdram_bankmachine6_row_opened <= 1'd0;
	end else begin
		if (main_ethernetsoc_sdram_bankmachine6_row_open) begin
			main_ethernetsoc_sdram_bankmachine6_row_opened <= 1'd1;
			main_ethernetsoc_sdram_bankmachine6_row <= main_ethernetsoc_sdram_bankmachine6_cmd_buffer_source_payload_addr[20:7];
		end
	end
	if (((main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_we & main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_writable) & (~main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_replace))) begin
		main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_produce <= (main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_produce + 1'd1);
	end
	if (main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_do_read) begin
		main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_consume <= (main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_consume + 1'd1);
	end
	if (((main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_we & main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_writable) & (~main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_replace))) begin
		if ((~main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_do_read)) begin
			main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_level <= (main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_level + 1'd1);
		end
	end else begin
		if (main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_do_read) begin
			main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_level <= (main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_level - 1'd1);
		end
	end
	if (main_ethernetsoc_sdram_bankmachine6_cmd_buffer_pipe_ce) begin
		main_ethernetsoc_sdram_bankmachine6_cmd_buffer_valid_n <= main_ethernetsoc_sdram_bankmachine6_cmd_buffer_sink_valid;
	end
	if (main_ethernetsoc_sdram_bankmachine6_cmd_buffer_pipe_ce) begin
		main_ethernetsoc_sdram_bankmachine6_cmd_buffer_first_n <= (main_ethernetsoc_sdram_bankmachine6_cmd_buffer_sink_valid & main_ethernetsoc_sdram_bankmachine6_cmd_buffer_sink_first);
		main_ethernetsoc_sdram_bankmachine6_cmd_buffer_last_n <= (main_ethernetsoc_sdram_bankmachine6_cmd_buffer_sink_valid & main_ethernetsoc_sdram_bankmachine6_cmd_buffer_sink_last);
	end
	if (main_ethernetsoc_sdram_bankmachine6_cmd_buffer_pipe_ce) begin
		main_ethernetsoc_sdram_bankmachine6_cmd_buffer_source_payload_we <= main_ethernetsoc_sdram_bankmachine6_cmd_buffer_sink_payload_we;
		main_ethernetsoc_sdram_bankmachine6_cmd_buffer_source_payload_addr <= main_ethernetsoc_sdram_bankmachine6_cmd_buffer_sink_payload_addr;
	end
	if (main_ethernetsoc_sdram_bankmachine6_twtpcon_valid) begin
		main_ethernetsoc_sdram_bankmachine6_twtpcon_count <= 3'd5;
		if (1'd0) begin
			main_ethernetsoc_sdram_bankmachine6_twtpcon_ready <= 1'd1;
		end else begin
			main_ethernetsoc_sdram_bankmachine6_twtpcon_ready <= 1'd0;
		end
	end else begin
		if ((~main_ethernetsoc_sdram_bankmachine6_twtpcon_ready)) begin
			main_ethernetsoc_sdram_bankmachine6_twtpcon_count <= (main_ethernetsoc_sdram_bankmachine6_twtpcon_count - 1'd1);
			if ((main_ethernetsoc_sdram_bankmachine6_twtpcon_count == 1'd1)) begin
				main_ethernetsoc_sdram_bankmachine6_twtpcon_ready <= 1'd1;
			end
		end
	end
	if (main_ethernetsoc_sdram_bankmachine6_trccon_valid) begin
		main_ethernetsoc_sdram_bankmachine6_trccon_count <= 3'd5;
		if (1'd0) begin
			main_ethernetsoc_sdram_bankmachine6_trccon_ready <= 1'd1;
		end else begin
			main_ethernetsoc_sdram_bankmachine6_trccon_ready <= 1'd0;
		end
	end else begin
		if ((~main_ethernetsoc_sdram_bankmachine6_trccon_ready)) begin
			main_ethernetsoc_sdram_bankmachine6_trccon_count <= (main_ethernetsoc_sdram_bankmachine6_trccon_count - 1'd1);
			if ((main_ethernetsoc_sdram_bankmachine6_trccon_count == 1'd1)) begin
				main_ethernetsoc_sdram_bankmachine6_trccon_ready <= 1'd1;
			end
		end
	end
	if (main_ethernetsoc_sdram_bankmachine6_trascon_valid) begin
		main_ethernetsoc_sdram_bankmachine6_trascon_count <= 3'd4;
		if (1'd0) begin
			main_ethernetsoc_sdram_bankmachine6_trascon_ready <= 1'd1;
		end else begin
			main_ethernetsoc_sdram_bankmachine6_trascon_ready <= 1'd0;
		end
	end else begin
		if ((~main_ethernetsoc_sdram_bankmachine6_trascon_ready)) begin
			main_ethernetsoc_sdram_bankmachine6_trascon_count <= (main_ethernetsoc_sdram_bankmachine6_trascon_count - 1'd1);
			if ((main_ethernetsoc_sdram_bankmachine6_trascon_count == 1'd1)) begin
				main_ethernetsoc_sdram_bankmachine6_trascon_ready <= 1'd1;
			end
		end
	end
	builder_bankmachine6_state <= builder_bankmachine6_next_state;
	if (main_ethernetsoc_sdram_bankmachine7_row_close) begin
		main_ethernetsoc_sdram_bankmachine7_row_opened <= 1'd0;
	end else begin
		if (main_ethernetsoc_sdram_bankmachine7_row_open) begin
			main_ethernetsoc_sdram_bankmachine7_row_opened <= 1'd1;
			main_ethernetsoc_sdram_bankmachine7_row <= main_ethernetsoc_sdram_bankmachine7_cmd_buffer_source_payload_addr[20:7];
		end
	end
	if (((main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_we & main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_writable) & (~main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_replace))) begin
		main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_produce <= (main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_produce + 1'd1);
	end
	if (main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_do_read) begin
		main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_consume <= (main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_consume + 1'd1);
	end
	if (((main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_we & main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_writable) & (~main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_replace))) begin
		if ((~main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_do_read)) begin
			main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_level <= (main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_level + 1'd1);
		end
	end else begin
		if (main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_do_read) begin
			main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_level <= (main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_level - 1'd1);
		end
	end
	if (main_ethernetsoc_sdram_bankmachine7_cmd_buffer_pipe_ce) begin
		main_ethernetsoc_sdram_bankmachine7_cmd_buffer_valid_n <= main_ethernetsoc_sdram_bankmachine7_cmd_buffer_sink_valid;
	end
	if (main_ethernetsoc_sdram_bankmachine7_cmd_buffer_pipe_ce) begin
		main_ethernetsoc_sdram_bankmachine7_cmd_buffer_first_n <= (main_ethernetsoc_sdram_bankmachine7_cmd_buffer_sink_valid & main_ethernetsoc_sdram_bankmachine7_cmd_buffer_sink_first);
		main_ethernetsoc_sdram_bankmachine7_cmd_buffer_last_n <= (main_ethernetsoc_sdram_bankmachine7_cmd_buffer_sink_valid & main_ethernetsoc_sdram_bankmachine7_cmd_buffer_sink_last);
	end
	if (main_ethernetsoc_sdram_bankmachine7_cmd_buffer_pipe_ce) begin
		main_ethernetsoc_sdram_bankmachine7_cmd_buffer_source_payload_we <= main_ethernetsoc_sdram_bankmachine7_cmd_buffer_sink_payload_we;
		main_ethernetsoc_sdram_bankmachine7_cmd_buffer_source_payload_addr <= main_ethernetsoc_sdram_bankmachine7_cmd_buffer_sink_payload_addr;
	end
	if (main_ethernetsoc_sdram_bankmachine7_twtpcon_valid) begin
		main_ethernetsoc_sdram_bankmachine7_twtpcon_count <= 3'd5;
		if (1'd0) begin
			main_ethernetsoc_sdram_bankmachine7_twtpcon_ready <= 1'd1;
		end else begin
			main_ethernetsoc_sdram_bankmachine7_twtpcon_ready <= 1'd0;
		end
	end else begin
		if ((~main_ethernetsoc_sdram_bankmachine7_twtpcon_ready)) begin
			main_ethernetsoc_sdram_bankmachine7_twtpcon_count <= (main_ethernetsoc_sdram_bankmachine7_twtpcon_count - 1'd1);
			if ((main_ethernetsoc_sdram_bankmachine7_twtpcon_count == 1'd1)) begin
				main_ethernetsoc_sdram_bankmachine7_twtpcon_ready <= 1'd1;
			end
		end
	end
	if (main_ethernetsoc_sdram_bankmachine7_trccon_valid) begin
		main_ethernetsoc_sdram_bankmachine7_trccon_count <= 3'd5;
		if (1'd0) begin
			main_ethernetsoc_sdram_bankmachine7_trccon_ready <= 1'd1;
		end else begin
			main_ethernetsoc_sdram_bankmachine7_trccon_ready <= 1'd0;
		end
	end else begin
		if ((~main_ethernetsoc_sdram_bankmachine7_trccon_ready)) begin
			main_ethernetsoc_sdram_bankmachine7_trccon_count <= (main_ethernetsoc_sdram_bankmachine7_trccon_count - 1'd1);
			if ((main_ethernetsoc_sdram_bankmachine7_trccon_count == 1'd1)) begin
				main_ethernetsoc_sdram_bankmachine7_trccon_ready <= 1'd1;
			end
		end
	end
	if (main_ethernetsoc_sdram_bankmachine7_trascon_valid) begin
		main_ethernetsoc_sdram_bankmachine7_trascon_count <= 3'd4;
		if (1'd0) begin
			main_ethernetsoc_sdram_bankmachine7_trascon_ready <= 1'd1;
		end else begin
			main_ethernetsoc_sdram_bankmachine7_trascon_ready <= 1'd0;
		end
	end else begin
		if ((~main_ethernetsoc_sdram_bankmachine7_trascon_ready)) begin
			main_ethernetsoc_sdram_bankmachine7_trascon_count <= (main_ethernetsoc_sdram_bankmachine7_trascon_count - 1'd1);
			if ((main_ethernetsoc_sdram_bankmachine7_trascon_count == 1'd1)) begin
				main_ethernetsoc_sdram_bankmachine7_trascon_ready <= 1'd1;
			end
		end
	end
	builder_bankmachine7_state <= builder_bankmachine7_next_state;
	if ((~main_ethernetsoc_sdram_en0)) begin
		main_ethernetsoc_sdram_time0 <= 5'd31;
	end else begin
		if ((~main_ethernetsoc_sdram_max_time0)) begin
			main_ethernetsoc_sdram_time0 <= (main_ethernetsoc_sdram_time0 - 1'd1);
		end
	end
	if ((~main_ethernetsoc_sdram_en1)) begin
		main_ethernetsoc_sdram_time1 <= 4'd15;
	end else begin
		if ((~main_ethernetsoc_sdram_max_time1)) begin
			main_ethernetsoc_sdram_time1 <= (main_ethernetsoc_sdram_time1 - 1'd1);
		end
	end
	if (main_ethernetsoc_sdram_choose_cmd_ce) begin
		case (main_ethernetsoc_sdram_choose_cmd_grant)
			1'd0: begin
				if (main_ethernetsoc_sdram_choose_cmd_request[1]) begin
					main_ethernetsoc_sdram_choose_cmd_grant <= 1'd1;
				end else begin
					if (main_ethernetsoc_sdram_choose_cmd_request[2]) begin
						main_ethernetsoc_sdram_choose_cmd_grant <= 2'd2;
					end else begin
						if (main_ethernetsoc_sdram_choose_cmd_request[3]) begin
							main_ethernetsoc_sdram_choose_cmd_grant <= 2'd3;
						end else begin
							if (main_ethernetsoc_sdram_choose_cmd_request[4]) begin
								main_ethernetsoc_sdram_choose_cmd_grant <= 3'd4;
							end else begin
								if (main_ethernetsoc_sdram_choose_cmd_request[5]) begin
									main_ethernetsoc_sdram_choose_cmd_grant <= 3'd5;
								end else begin
									if (main_ethernetsoc_sdram_choose_cmd_request[6]) begin
										main_ethernetsoc_sdram_choose_cmd_grant <= 3'd6;
									end else begin
										if (main_ethernetsoc_sdram_choose_cmd_request[7]) begin
											main_ethernetsoc_sdram_choose_cmd_grant <= 3'd7;
										end
									end
								end
							end
						end
					end
				end
			end
			1'd1: begin
				if (main_ethernetsoc_sdram_choose_cmd_request[2]) begin
					main_ethernetsoc_sdram_choose_cmd_grant <= 2'd2;
				end else begin
					if (main_ethernetsoc_sdram_choose_cmd_request[3]) begin
						main_ethernetsoc_sdram_choose_cmd_grant <= 2'd3;
					end else begin
						if (main_ethernetsoc_sdram_choose_cmd_request[4]) begin
							main_ethernetsoc_sdram_choose_cmd_grant <= 3'd4;
						end else begin
							if (main_ethernetsoc_sdram_choose_cmd_request[5]) begin
								main_ethernetsoc_sdram_choose_cmd_grant <= 3'd5;
							end else begin
								if (main_ethernetsoc_sdram_choose_cmd_request[6]) begin
									main_ethernetsoc_sdram_choose_cmd_grant <= 3'd6;
								end else begin
									if (main_ethernetsoc_sdram_choose_cmd_request[7]) begin
										main_ethernetsoc_sdram_choose_cmd_grant <= 3'd7;
									end else begin
										if (main_ethernetsoc_sdram_choose_cmd_request[0]) begin
											main_ethernetsoc_sdram_choose_cmd_grant <= 1'd0;
										end
									end
								end
							end
						end
					end
				end
			end
			2'd2: begin
				if (main_ethernetsoc_sdram_choose_cmd_request[3]) begin
					main_ethernetsoc_sdram_choose_cmd_grant <= 2'd3;
				end else begin
					if (main_ethernetsoc_sdram_choose_cmd_request[4]) begin
						main_ethernetsoc_sdram_choose_cmd_grant <= 3'd4;
					end else begin
						if (main_ethernetsoc_sdram_choose_cmd_request[5]) begin
							main_ethernetsoc_sdram_choose_cmd_grant <= 3'd5;
						end else begin
							if (main_ethernetsoc_sdram_choose_cmd_request[6]) begin
								main_ethernetsoc_sdram_choose_cmd_grant <= 3'd6;
							end else begin
								if (main_ethernetsoc_sdram_choose_cmd_request[7]) begin
									main_ethernetsoc_sdram_choose_cmd_grant <= 3'd7;
								end else begin
									if (main_ethernetsoc_sdram_choose_cmd_request[0]) begin
										main_ethernetsoc_sdram_choose_cmd_grant <= 1'd0;
									end else begin
										if (main_ethernetsoc_sdram_choose_cmd_request[1]) begin
											main_ethernetsoc_sdram_choose_cmd_grant <= 1'd1;
										end
									end
								end
							end
						end
					end
				end
			end
			2'd3: begin
				if (main_ethernetsoc_sdram_choose_cmd_request[4]) begin
					main_ethernetsoc_sdram_choose_cmd_grant <= 3'd4;
				end else begin
					if (main_ethernetsoc_sdram_choose_cmd_request[5]) begin
						main_ethernetsoc_sdram_choose_cmd_grant <= 3'd5;
					end else begin
						if (main_ethernetsoc_sdram_choose_cmd_request[6]) begin
							main_ethernetsoc_sdram_choose_cmd_grant <= 3'd6;
						end else begin
							if (main_ethernetsoc_sdram_choose_cmd_request[7]) begin
								main_ethernetsoc_sdram_choose_cmd_grant <= 3'd7;
							end else begin
								if (main_ethernetsoc_sdram_choose_cmd_request[0]) begin
									main_ethernetsoc_sdram_choose_cmd_grant <= 1'd0;
								end else begin
									if (main_ethernetsoc_sdram_choose_cmd_request[1]) begin
										main_ethernetsoc_sdram_choose_cmd_grant <= 1'd1;
									end else begin
										if (main_ethernetsoc_sdram_choose_cmd_request[2]) begin
											main_ethernetsoc_sdram_choose_cmd_grant <= 2'd2;
										end
									end
								end
							end
						end
					end
				end
			end
			3'd4: begin
				if (main_ethernetsoc_sdram_choose_cmd_request[5]) begin
					main_ethernetsoc_sdram_choose_cmd_grant <= 3'd5;
				end else begin
					if (main_ethernetsoc_sdram_choose_cmd_request[6]) begin
						main_ethernetsoc_sdram_choose_cmd_grant <= 3'd6;
					end else begin
						if (main_ethernetsoc_sdram_choose_cmd_request[7]) begin
							main_ethernetsoc_sdram_choose_cmd_grant <= 3'd7;
						end else begin
							if (main_ethernetsoc_sdram_choose_cmd_request[0]) begin
								main_ethernetsoc_sdram_choose_cmd_grant <= 1'd0;
							end else begin
								if (main_ethernetsoc_sdram_choose_cmd_request[1]) begin
									main_ethernetsoc_sdram_choose_cmd_grant <= 1'd1;
								end else begin
									if (main_ethernetsoc_sdram_choose_cmd_request[2]) begin
										main_ethernetsoc_sdram_choose_cmd_grant <= 2'd2;
									end else begin
										if (main_ethernetsoc_sdram_choose_cmd_request[3]) begin
											main_ethernetsoc_sdram_choose_cmd_grant <= 2'd3;
										end
									end
								end
							end
						end
					end
				end
			end
			3'd5: begin
				if (main_ethernetsoc_sdram_choose_cmd_request[6]) begin
					main_ethernetsoc_sdram_choose_cmd_grant <= 3'd6;
				end else begin
					if (main_ethernetsoc_sdram_choose_cmd_request[7]) begin
						main_ethernetsoc_sdram_choose_cmd_grant <= 3'd7;
					end else begin
						if (main_ethernetsoc_sdram_choose_cmd_request[0]) begin
							main_ethernetsoc_sdram_choose_cmd_grant <= 1'd0;
						end else begin
							if (main_ethernetsoc_sdram_choose_cmd_request[1]) begin
								main_ethernetsoc_sdram_choose_cmd_grant <= 1'd1;
							end else begin
								if (main_ethernetsoc_sdram_choose_cmd_request[2]) begin
									main_ethernetsoc_sdram_choose_cmd_grant <= 2'd2;
								end else begin
									if (main_ethernetsoc_sdram_choose_cmd_request[3]) begin
										main_ethernetsoc_sdram_choose_cmd_grant <= 2'd3;
									end else begin
										if (main_ethernetsoc_sdram_choose_cmd_request[4]) begin
											main_ethernetsoc_sdram_choose_cmd_grant <= 3'd4;
										end
									end
								end
							end
						end
					end
				end
			end
			3'd6: begin
				if (main_ethernetsoc_sdram_choose_cmd_request[7]) begin
					main_ethernetsoc_sdram_choose_cmd_grant <= 3'd7;
				end else begin
					if (main_ethernetsoc_sdram_choose_cmd_request[0]) begin
						main_ethernetsoc_sdram_choose_cmd_grant <= 1'd0;
					end else begin
						if (main_ethernetsoc_sdram_choose_cmd_request[1]) begin
							main_ethernetsoc_sdram_choose_cmd_grant <= 1'd1;
						end else begin
							if (main_ethernetsoc_sdram_choose_cmd_request[2]) begin
								main_ethernetsoc_sdram_choose_cmd_grant <= 2'd2;
							end else begin
								if (main_ethernetsoc_sdram_choose_cmd_request[3]) begin
									main_ethernetsoc_sdram_choose_cmd_grant <= 2'd3;
								end else begin
									if (main_ethernetsoc_sdram_choose_cmd_request[4]) begin
										main_ethernetsoc_sdram_choose_cmd_grant <= 3'd4;
									end else begin
										if (main_ethernetsoc_sdram_choose_cmd_request[5]) begin
											main_ethernetsoc_sdram_choose_cmd_grant <= 3'd5;
										end
									end
								end
							end
						end
					end
				end
			end
			3'd7: begin
				if (main_ethernetsoc_sdram_choose_cmd_request[0]) begin
					main_ethernetsoc_sdram_choose_cmd_grant <= 1'd0;
				end else begin
					if (main_ethernetsoc_sdram_choose_cmd_request[1]) begin
						main_ethernetsoc_sdram_choose_cmd_grant <= 1'd1;
					end else begin
						if (main_ethernetsoc_sdram_choose_cmd_request[2]) begin
							main_ethernetsoc_sdram_choose_cmd_grant <= 2'd2;
						end else begin
							if (main_ethernetsoc_sdram_choose_cmd_request[3]) begin
								main_ethernetsoc_sdram_choose_cmd_grant <= 2'd3;
							end else begin
								if (main_ethernetsoc_sdram_choose_cmd_request[4]) begin
									main_ethernetsoc_sdram_choose_cmd_grant <= 3'd4;
								end else begin
									if (main_ethernetsoc_sdram_choose_cmd_request[5]) begin
										main_ethernetsoc_sdram_choose_cmd_grant <= 3'd5;
									end else begin
										if (main_ethernetsoc_sdram_choose_cmd_request[6]) begin
											main_ethernetsoc_sdram_choose_cmd_grant <= 3'd6;
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
	if (main_ethernetsoc_sdram_choose_req_ce) begin
		case (main_ethernetsoc_sdram_choose_req_grant)
			1'd0: begin
				if (main_ethernetsoc_sdram_choose_req_request[1]) begin
					main_ethernetsoc_sdram_choose_req_grant <= 1'd1;
				end else begin
					if (main_ethernetsoc_sdram_choose_req_request[2]) begin
						main_ethernetsoc_sdram_choose_req_grant <= 2'd2;
					end else begin
						if (main_ethernetsoc_sdram_choose_req_request[3]) begin
							main_ethernetsoc_sdram_choose_req_grant <= 2'd3;
						end else begin
							if (main_ethernetsoc_sdram_choose_req_request[4]) begin
								main_ethernetsoc_sdram_choose_req_grant <= 3'd4;
							end else begin
								if (main_ethernetsoc_sdram_choose_req_request[5]) begin
									main_ethernetsoc_sdram_choose_req_grant <= 3'd5;
								end else begin
									if (main_ethernetsoc_sdram_choose_req_request[6]) begin
										main_ethernetsoc_sdram_choose_req_grant <= 3'd6;
									end else begin
										if (main_ethernetsoc_sdram_choose_req_request[7]) begin
											main_ethernetsoc_sdram_choose_req_grant <= 3'd7;
										end
									end
								end
							end
						end
					end
				end
			end
			1'd1: begin
				if (main_ethernetsoc_sdram_choose_req_request[2]) begin
					main_ethernetsoc_sdram_choose_req_grant <= 2'd2;
				end else begin
					if (main_ethernetsoc_sdram_choose_req_request[3]) begin
						main_ethernetsoc_sdram_choose_req_grant <= 2'd3;
					end else begin
						if (main_ethernetsoc_sdram_choose_req_request[4]) begin
							main_ethernetsoc_sdram_choose_req_grant <= 3'd4;
						end else begin
							if (main_ethernetsoc_sdram_choose_req_request[5]) begin
								main_ethernetsoc_sdram_choose_req_grant <= 3'd5;
							end else begin
								if (main_ethernetsoc_sdram_choose_req_request[6]) begin
									main_ethernetsoc_sdram_choose_req_grant <= 3'd6;
								end else begin
									if (main_ethernetsoc_sdram_choose_req_request[7]) begin
										main_ethernetsoc_sdram_choose_req_grant <= 3'd7;
									end else begin
										if (main_ethernetsoc_sdram_choose_req_request[0]) begin
											main_ethernetsoc_sdram_choose_req_grant <= 1'd0;
										end
									end
								end
							end
						end
					end
				end
			end
			2'd2: begin
				if (main_ethernetsoc_sdram_choose_req_request[3]) begin
					main_ethernetsoc_sdram_choose_req_grant <= 2'd3;
				end else begin
					if (main_ethernetsoc_sdram_choose_req_request[4]) begin
						main_ethernetsoc_sdram_choose_req_grant <= 3'd4;
					end else begin
						if (main_ethernetsoc_sdram_choose_req_request[5]) begin
							main_ethernetsoc_sdram_choose_req_grant <= 3'd5;
						end else begin
							if (main_ethernetsoc_sdram_choose_req_request[6]) begin
								main_ethernetsoc_sdram_choose_req_grant <= 3'd6;
							end else begin
								if (main_ethernetsoc_sdram_choose_req_request[7]) begin
									main_ethernetsoc_sdram_choose_req_grant <= 3'd7;
								end else begin
									if (main_ethernetsoc_sdram_choose_req_request[0]) begin
										main_ethernetsoc_sdram_choose_req_grant <= 1'd0;
									end else begin
										if (main_ethernetsoc_sdram_choose_req_request[1]) begin
											main_ethernetsoc_sdram_choose_req_grant <= 1'd1;
										end
									end
								end
							end
						end
					end
				end
			end
			2'd3: begin
				if (main_ethernetsoc_sdram_choose_req_request[4]) begin
					main_ethernetsoc_sdram_choose_req_grant <= 3'd4;
				end else begin
					if (main_ethernetsoc_sdram_choose_req_request[5]) begin
						main_ethernetsoc_sdram_choose_req_grant <= 3'd5;
					end else begin
						if (main_ethernetsoc_sdram_choose_req_request[6]) begin
							main_ethernetsoc_sdram_choose_req_grant <= 3'd6;
						end else begin
							if (main_ethernetsoc_sdram_choose_req_request[7]) begin
								main_ethernetsoc_sdram_choose_req_grant <= 3'd7;
							end else begin
								if (main_ethernetsoc_sdram_choose_req_request[0]) begin
									main_ethernetsoc_sdram_choose_req_grant <= 1'd0;
								end else begin
									if (main_ethernetsoc_sdram_choose_req_request[1]) begin
										main_ethernetsoc_sdram_choose_req_grant <= 1'd1;
									end else begin
										if (main_ethernetsoc_sdram_choose_req_request[2]) begin
											main_ethernetsoc_sdram_choose_req_grant <= 2'd2;
										end
									end
								end
							end
						end
					end
				end
			end
			3'd4: begin
				if (main_ethernetsoc_sdram_choose_req_request[5]) begin
					main_ethernetsoc_sdram_choose_req_grant <= 3'd5;
				end else begin
					if (main_ethernetsoc_sdram_choose_req_request[6]) begin
						main_ethernetsoc_sdram_choose_req_grant <= 3'd6;
					end else begin
						if (main_ethernetsoc_sdram_choose_req_request[7]) begin
							main_ethernetsoc_sdram_choose_req_grant <= 3'd7;
						end else begin
							if (main_ethernetsoc_sdram_choose_req_request[0]) begin
								main_ethernetsoc_sdram_choose_req_grant <= 1'd0;
							end else begin
								if (main_ethernetsoc_sdram_choose_req_request[1]) begin
									main_ethernetsoc_sdram_choose_req_grant <= 1'd1;
								end else begin
									if (main_ethernetsoc_sdram_choose_req_request[2]) begin
										main_ethernetsoc_sdram_choose_req_grant <= 2'd2;
									end else begin
										if (main_ethernetsoc_sdram_choose_req_request[3]) begin
											main_ethernetsoc_sdram_choose_req_grant <= 2'd3;
										end
									end
								end
							end
						end
					end
				end
			end
			3'd5: begin
				if (main_ethernetsoc_sdram_choose_req_request[6]) begin
					main_ethernetsoc_sdram_choose_req_grant <= 3'd6;
				end else begin
					if (main_ethernetsoc_sdram_choose_req_request[7]) begin
						main_ethernetsoc_sdram_choose_req_grant <= 3'd7;
					end else begin
						if (main_ethernetsoc_sdram_choose_req_request[0]) begin
							main_ethernetsoc_sdram_choose_req_grant <= 1'd0;
						end else begin
							if (main_ethernetsoc_sdram_choose_req_request[1]) begin
								main_ethernetsoc_sdram_choose_req_grant <= 1'd1;
							end else begin
								if (main_ethernetsoc_sdram_choose_req_request[2]) begin
									main_ethernetsoc_sdram_choose_req_grant <= 2'd2;
								end else begin
									if (main_ethernetsoc_sdram_choose_req_request[3]) begin
										main_ethernetsoc_sdram_choose_req_grant <= 2'd3;
									end else begin
										if (main_ethernetsoc_sdram_choose_req_request[4]) begin
											main_ethernetsoc_sdram_choose_req_grant <= 3'd4;
										end
									end
								end
							end
						end
					end
				end
			end
			3'd6: begin
				if (main_ethernetsoc_sdram_choose_req_request[7]) begin
					main_ethernetsoc_sdram_choose_req_grant <= 3'd7;
				end else begin
					if (main_ethernetsoc_sdram_choose_req_request[0]) begin
						main_ethernetsoc_sdram_choose_req_grant <= 1'd0;
					end else begin
						if (main_ethernetsoc_sdram_choose_req_request[1]) begin
							main_ethernetsoc_sdram_choose_req_grant <= 1'd1;
						end else begin
							if (main_ethernetsoc_sdram_choose_req_request[2]) begin
								main_ethernetsoc_sdram_choose_req_grant <= 2'd2;
							end else begin
								if (main_ethernetsoc_sdram_choose_req_request[3]) begin
									main_ethernetsoc_sdram_choose_req_grant <= 2'd3;
								end else begin
									if (main_ethernetsoc_sdram_choose_req_request[4]) begin
										main_ethernetsoc_sdram_choose_req_grant <= 3'd4;
									end else begin
										if (main_ethernetsoc_sdram_choose_req_request[5]) begin
											main_ethernetsoc_sdram_choose_req_grant <= 3'd5;
										end
									end
								end
							end
						end
					end
				end
			end
			3'd7: begin
				if (main_ethernetsoc_sdram_choose_req_request[0]) begin
					main_ethernetsoc_sdram_choose_req_grant <= 1'd0;
				end else begin
					if (main_ethernetsoc_sdram_choose_req_request[1]) begin
						main_ethernetsoc_sdram_choose_req_grant <= 1'd1;
					end else begin
						if (main_ethernetsoc_sdram_choose_req_request[2]) begin
							main_ethernetsoc_sdram_choose_req_grant <= 2'd2;
						end else begin
							if (main_ethernetsoc_sdram_choose_req_request[3]) begin
								main_ethernetsoc_sdram_choose_req_grant <= 2'd3;
							end else begin
								if (main_ethernetsoc_sdram_choose_req_request[4]) begin
									main_ethernetsoc_sdram_choose_req_grant <= 3'd4;
								end else begin
									if (main_ethernetsoc_sdram_choose_req_request[5]) begin
										main_ethernetsoc_sdram_choose_req_grant <= 3'd5;
									end else begin
										if (main_ethernetsoc_sdram_choose_req_request[6]) begin
											main_ethernetsoc_sdram_choose_req_grant <= 3'd6;
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
	main_ethernetsoc_sdram_dfi_p0_cs_n <= 1'd0;
	main_ethernetsoc_sdram_dfi_p0_bank <= builder_array_muxed0;
	main_ethernetsoc_sdram_dfi_p0_address <= builder_array_muxed1;
	main_ethernetsoc_sdram_dfi_p0_cas_n <= (~builder_array_muxed2);
	main_ethernetsoc_sdram_dfi_p0_ras_n <= (~builder_array_muxed3);
	main_ethernetsoc_sdram_dfi_p0_we_n <= (~builder_array_muxed4);
	main_ethernetsoc_sdram_dfi_p0_rddata_en <= builder_array_muxed5;
	main_ethernetsoc_sdram_dfi_p0_wrdata_en <= builder_array_muxed6;
	main_ethernetsoc_sdram_dfi_p1_cs_n <= 1'd0;
	main_ethernetsoc_sdram_dfi_p1_bank <= builder_array_muxed7;
	main_ethernetsoc_sdram_dfi_p1_address <= builder_array_muxed8;
	main_ethernetsoc_sdram_dfi_p1_cas_n <= (~builder_array_muxed9);
	main_ethernetsoc_sdram_dfi_p1_ras_n <= (~builder_array_muxed10);
	main_ethernetsoc_sdram_dfi_p1_we_n <= (~builder_array_muxed11);
	main_ethernetsoc_sdram_dfi_p1_rddata_en <= builder_array_muxed12;
	main_ethernetsoc_sdram_dfi_p1_wrdata_en <= builder_array_muxed13;
	main_ethernetsoc_sdram_dfi_p2_cs_n <= 1'd0;
	main_ethernetsoc_sdram_dfi_p2_bank <= builder_array_muxed14;
	main_ethernetsoc_sdram_dfi_p2_address <= builder_array_muxed15;
	main_ethernetsoc_sdram_dfi_p2_cas_n <= (~builder_array_muxed16);
	main_ethernetsoc_sdram_dfi_p2_ras_n <= (~builder_array_muxed17);
	main_ethernetsoc_sdram_dfi_p2_we_n <= (~builder_array_muxed18);
	main_ethernetsoc_sdram_dfi_p2_rddata_en <= builder_array_muxed19;
	main_ethernetsoc_sdram_dfi_p2_wrdata_en <= builder_array_muxed20;
	main_ethernetsoc_sdram_dfi_p3_cs_n <= 1'd0;
	main_ethernetsoc_sdram_dfi_p3_bank <= builder_array_muxed21;
	main_ethernetsoc_sdram_dfi_p3_address <= builder_array_muxed22;
	main_ethernetsoc_sdram_dfi_p3_cas_n <= (~builder_array_muxed23);
	main_ethernetsoc_sdram_dfi_p3_ras_n <= (~builder_array_muxed24);
	main_ethernetsoc_sdram_dfi_p3_we_n <= (~builder_array_muxed25);
	main_ethernetsoc_sdram_dfi_p3_rddata_en <= builder_array_muxed26;
	main_ethernetsoc_sdram_dfi_p3_wrdata_en <= builder_array_muxed27;
	if (main_ethernetsoc_sdram_trrdcon_valid) begin
		main_ethernetsoc_sdram_trrdcon_count <= 1'd1;
		if (1'd0) begin
			main_ethernetsoc_sdram_trrdcon_ready <= 1'd1;
		end else begin
			main_ethernetsoc_sdram_trrdcon_ready <= 1'd0;
		end
	end else begin
		if ((~main_ethernetsoc_sdram_trrdcon_ready)) begin
			main_ethernetsoc_sdram_trrdcon_count <= (main_ethernetsoc_sdram_trrdcon_count - 1'd1);
			if ((main_ethernetsoc_sdram_trrdcon_count == 1'd1)) begin
				main_ethernetsoc_sdram_trrdcon_ready <= 1'd1;
			end
		end
	end
	main_ethernetsoc_sdram_tfawcon_window <= {main_ethernetsoc_sdram_tfawcon_window, main_ethernetsoc_sdram_tfawcon_valid};
	if ((main_ethernetsoc_sdram_tfawcon_count < 3'd4)) begin
		if ((main_ethernetsoc_sdram_tfawcon_count == 2'd3)) begin
			main_ethernetsoc_sdram_tfawcon_ready <= (~main_ethernetsoc_sdram_tfawcon_valid);
		end else begin
			main_ethernetsoc_sdram_tfawcon_ready <= 1'd1;
		end
	end
	if (main_ethernetsoc_sdram_tccdcon_valid) begin
		main_ethernetsoc_sdram_tccdcon_count <= 1'd0;
		if (1'd1) begin
			main_ethernetsoc_sdram_tccdcon_ready <= 1'd1;
		end else begin
			main_ethernetsoc_sdram_tccdcon_ready <= 1'd0;
		end
	end else begin
		if ((~main_ethernetsoc_sdram_tccdcon_ready)) begin
			main_ethernetsoc_sdram_tccdcon_count <= (main_ethernetsoc_sdram_tccdcon_count - 1'd1);
			if ((main_ethernetsoc_sdram_tccdcon_count == 1'd1)) begin
				main_ethernetsoc_sdram_tccdcon_ready <= 1'd1;
			end
		end
	end
	if (main_ethernetsoc_sdram_twtrcon_valid) begin
		main_ethernetsoc_sdram_twtrcon_count <= 3'd4;
		if (1'd0) begin
			main_ethernetsoc_sdram_twtrcon_ready <= 1'd1;
		end else begin
			main_ethernetsoc_sdram_twtrcon_ready <= 1'd0;
		end
	end else begin
		if ((~main_ethernetsoc_sdram_twtrcon_ready)) begin
			main_ethernetsoc_sdram_twtrcon_count <= (main_ethernetsoc_sdram_twtrcon_count - 1'd1);
			if ((main_ethernetsoc_sdram_twtrcon_count == 1'd1)) begin
				main_ethernetsoc_sdram_twtrcon_ready <= 1'd1;
			end
		end
	end
	builder_multiplexer_state <= builder_multiplexer_next_state;
	if (((builder_roundrobin0_grant == 1'd0) & main_ethernetsoc_sdram_interface_bank0_rdata_valid)) begin
		builder_rbank <= 1'd0;
	end
	if (((builder_roundrobin0_grant == 1'd0) & main_ethernetsoc_sdram_interface_bank0_wdata_ready)) begin
		builder_wbank <= 1'd0;
	end
	if (((builder_roundrobin1_grant == 1'd0) & main_ethernetsoc_sdram_interface_bank1_rdata_valid)) begin
		builder_rbank <= 1'd1;
	end
	if (((builder_roundrobin1_grant == 1'd0) & main_ethernetsoc_sdram_interface_bank1_wdata_ready)) begin
		builder_wbank <= 1'd1;
	end
	if (((builder_roundrobin2_grant == 1'd0) & main_ethernetsoc_sdram_interface_bank2_rdata_valid)) begin
		builder_rbank <= 2'd2;
	end
	if (((builder_roundrobin2_grant == 1'd0) & main_ethernetsoc_sdram_interface_bank2_wdata_ready)) begin
		builder_wbank <= 2'd2;
	end
	if (((builder_roundrobin3_grant == 1'd0) & main_ethernetsoc_sdram_interface_bank3_rdata_valid)) begin
		builder_rbank <= 2'd3;
	end
	if (((builder_roundrobin3_grant == 1'd0) & main_ethernetsoc_sdram_interface_bank3_wdata_ready)) begin
		builder_wbank <= 2'd3;
	end
	if (((builder_roundrobin4_grant == 1'd0) & main_ethernetsoc_sdram_interface_bank4_rdata_valid)) begin
		builder_rbank <= 3'd4;
	end
	if (((builder_roundrobin4_grant == 1'd0) & main_ethernetsoc_sdram_interface_bank4_wdata_ready)) begin
		builder_wbank <= 3'd4;
	end
	if (((builder_roundrobin5_grant == 1'd0) & main_ethernetsoc_sdram_interface_bank5_rdata_valid)) begin
		builder_rbank <= 3'd5;
	end
	if (((builder_roundrobin5_grant == 1'd0) & main_ethernetsoc_sdram_interface_bank5_wdata_ready)) begin
		builder_wbank <= 3'd5;
	end
	if (((builder_roundrobin6_grant == 1'd0) & main_ethernetsoc_sdram_interface_bank6_rdata_valid)) begin
		builder_rbank <= 3'd6;
	end
	if (((builder_roundrobin6_grant == 1'd0) & main_ethernetsoc_sdram_interface_bank6_wdata_ready)) begin
		builder_wbank <= 3'd6;
	end
	if (((builder_roundrobin7_grant == 1'd0) & main_ethernetsoc_sdram_interface_bank7_rdata_valid)) begin
		builder_rbank <= 3'd7;
	end
	if (((builder_roundrobin7_grant == 1'd0) & main_ethernetsoc_sdram_interface_bank7_wdata_ready)) begin
		builder_wbank <= 3'd7;
	end
	builder_new_master_wdata_ready0 <= ((((((((1'd0 | ((builder_roundrobin0_grant == 1'd0) & main_ethernetsoc_sdram_interface_bank0_wdata_ready)) | ((builder_roundrobin1_grant == 1'd0) & main_ethernetsoc_sdram_interface_bank1_wdata_ready)) | ((builder_roundrobin2_grant == 1'd0) & main_ethernetsoc_sdram_interface_bank2_wdata_ready)) | ((builder_roundrobin3_grant == 1'd0) & main_ethernetsoc_sdram_interface_bank3_wdata_ready)) | ((builder_roundrobin4_grant == 1'd0) & main_ethernetsoc_sdram_interface_bank4_wdata_ready)) | ((builder_roundrobin5_grant == 1'd0) & main_ethernetsoc_sdram_interface_bank5_wdata_ready)) | ((builder_roundrobin6_grant == 1'd0) & main_ethernetsoc_sdram_interface_bank6_wdata_ready)) | ((builder_roundrobin7_grant == 1'd0) & main_ethernetsoc_sdram_interface_bank7_wdata_ready));
	builder_new_master_wdata_ready1 <= builder_new_master_wdata_ready0;
	builder_new_master_wdata_ready2 <= builder_new_master_wdata_ready1;
	builder_new_master_rdata_valid0 <= ((((((((1'd0 | ((builder_roundrobin0_grant == 1'd0) & main_ethernetsoc_sdram_interface_bank0_rdata_valid)) | ((builder_roundrobin1_grant == 1'd0) & main_ethernetsoc_sdram_interface_bank1_rdata_valid)) | ((builder_roundrobin2_grant == 1'd0) & main_ethernetsoc_sdram_interface_bank2_rdata_valid)) | ((builder_roundrobin3_grant == 1'd0) & main_ethernetsoc_sdram_interface_bank3_rdata_valid)) | ((builder_roundrobin4_grant == 1'd0) & main_ethernetsoc_sdram_interface_bank4_rdata_valid)) | ((builder_roundrobin5_grant == 1'd0) & main_ethernetsoc_sdram_interface_bank5_rdata_valid)) | ((builder_roundrobin6_grant == 1'd0) & main_ethernetsoc_sdram_interface_bank6_rdata_valid)) | ((builder_roundrobin7_grant == 1'd0) & main_ethernetsoc_sdram_interface_bank7_rdata_valid));
	builder_new_master_rdata_valid1 <= builder_new_master_rdata_valid0;
	builder_new_master_rdata_valid2 <= builder_new_master_rdata_valid1;
	builder_new_master_rdata_valid3 <= builder_new_master_rdata_valid2;
	builder_new_master_rdata_valid4 <= builder_new_master_rdata_valid3;
	builder_new_master_rdata_valid5 <= builder_new_master_rdata_valid4;
	builder_new_master_rdata_valid6 <= builder_new_master_rdata_valid5;
	builder_new_master_rdata_valid7 <= builder_new_master_rdata_valid6;
	builder_new_master_rdata_valid8 <= builder_new_master_rdata_valid7;
	builder_new_master_rdata_valid9 <= builder_new_master_rdata_valid8;
	main_ethernetsoc_adr_offset_r <= main_ethernetsoc_interface0_wb_sdram_adr[1:0];
	builder_fullmemorywe_state <= builder_fullmemorywe_next_state;
	builder_litedramwishbone2native_state <= builder_litedramwishbone2native_next_state;
	if (main_ethphy_counter_ce) begin
		main_ethphy_counter <= (main_ethphy_counter + 1'd1);
	end
	if (main_ps_preamble_error_o) begin
		main_preamble_errors_status <= (main_preamble_errors_status + 1'd1);
	end
	if (main_ps_crc_error_o) begin
		main_crc_errors_status <= (main_crc_errors_status + 1'd1);
	end
	main_ps_preamble_error_toggle_o_r <= main_ps_preamble_error_toggle_o;
	main_ps_crc_error_toggle_o_r <= main_ps_crc_error_toggle_o;
	main_tx_cdc_graycounter0_q_binary <= main_tx_cdc_graycounter0_q_next_binary;
	main_tx_cdc_graycounter0_q <= main_tx_cdc_graycounter0_q_next;
	main_rx_cdc_graycounter1_q_binary <= main_rx_cdc_graycounter1_q_next_binary;
	main_rx_cdc_graycounter1_q <= main_rx_cdc_graycounter1_q_next;
	if (main_writer_counter_reset) begin
		main_writer_counter <= 1'd0;
	end else begin
		if (main_writer_counter_ce) begin
			main_writer_counter <= (main_writer_counter + main_writer_inc);
		end
	end
	if (main_writer_slot_ce) begin
		main_writer_slot <= (main_writer_slot + 1'd1);
	end
	if (((main_writer_fifo_syncfifo_we & main_writer_fifo_syncfifo_writable) & (~main_writer_fifo_replace))) begin
		main_writer_fifo_produce <= (main_writer_fifo_produce + 1'd1);
	end
	if (main_writer_fifo_do_read) begin
		main_writer_fifo_consume <= (main_writer_fifo_consume + 1'd1);
	end
	if (((main_writer_fifo_syncfifo_we & main_writer_fifo_syncfifo_writable) & (~main_writer_fifo_replace))) begin
		if ((~main_writer_fifo_do_read)) begin
			main_writer_fifo_level <= (main_writer_fifo_level + 1'd1);
		end
	end else begin
		if (main_writer_fifo_do_read) begin
			main_writer_fifo_level <= (main_writer_fifo_level - 1'd1);
		end
	end
	builder_liteethmacsramwriter_state <= builder_liteethmacsramwriter_next_state;
	if (main_writer_errors_status_next_value_ce) begin
		main_writer_errors_status <= main_writer_errors_status_next_value;
	end
	if (main_reader_counter_reset) begin
		main_reader_counter <= 1'd0;
	end else begin
		if (main_reader_counter_ce) begin
			main_reader_counter <= (main_reader_counter + 3'd4);
		end
	end
	main_reader_last_d <= main_reader_last;
	if (main_reader_done_clear) begin
		main_reader_done_pending <= 1'd0;
	end
	if (main_reader_done_trigger) begin
		main_reader_done_pending <= 1'd1;
	end
	if (((main_reader_fifo_syncfifo_we & main_reader_fifo_syncfifo_writable) & (~main_reader_fifo_replace))) begin
		main_reader_fifo_produce <= (main_reader_fifo_produce + 1'd1);
	end
	if (main_reader_fifo_do_read) begin
		main_reader_fifo_consume <= (main_reader_fifo_consume + 1'd1);
	end
	if (((main_reader_fifo_syncfifo_we & main_reader_fifo_syncfifo_writable) & (~main_reader_fifo_replace))) begin
		if ((~main_reader_fifo_do_read)) begin
			main_reader_fifo_level <= (main_reader_fifo_level + 1'd1);
		end
	end else begin
		if (main_reader_fifo_do_read) begin
			main_reader_fifo_level <= (main_reader_fifo_level - 1'd1);
		end
	end
	builder_liteethmacsramreader_state <= builder_liteethmacsramreader_next_state;
	main_sram0_bus_ack0 <= 1'd0;
	if (((main_sram0_bus_cyc0 & main_sram0_bus_stb0) & (~main_sram0_bus_ack0))) begin
		main_sram0_bus_ack0 <= 1'd1;
	end
	main_sram1_bus_ack0 <= 1'd0;
	if (((main_sram1_bus_cyc0 & main_sram1_bus_stb0) & (~main_sram1_bus_ack0))) begin
		main_sram1_bus_ack0 <= 1'd1;
	end
	main_sram0_bus_ack1 <= 1'd0;
	if (((main_sram0_bus_cyc1 & main_sram0_bus_stb1) & (~main_sram0_bus_ack1))) begin
		main_sram0_bus_ack1 <= 1'd1;
	end
	main_sram1_bus_ack1 <= 1'd0;
	if (((main_sram1_bus_cyc1 & main_sram1_bus_stb1) & (~main_sram1_bus_ack1))) begin
		main_sram1_bus_ack1 <= 1'd1;
	end
	main_slave_sel_r <= main_slave_sel;
	case (builder_ethernetsoc_grant)
		1'd0: begin
			if ((~builder_ethernetsoc_request[0])) begin
				if (builder_ethernetsoc_request[1]) begin
					builder_ethernetsoc_grant <= 1'd1;
				end
			end
		end
		1'd1: begin
			if ((~builder_ethernetsoc_request[1])) begin
				if (builder_ethernetsoc_request[0]) begin
					builder_ethernetsoc_grant <= 1'd0;
				end
			end
		end
	endcase
	builder_ethernetsoc_slave_sel_r <= builder_ethernetsoc_slave_sel;
	if (builder_ethernetsoc_wait) begin
		if ((~builder_ethernetsoc_done)) begin
			builder_ethernetsoc_count <= (builder_ethernetsoc_count - 1'd1);
		end
	end else begin
		builder_ethernetsoc_count <= 20'd1000000;
	end
	builder_ethernetsoc_interface0_bank_bus_dat_r <= 1'd0;
	if (builder_ethernetsoc_csrbank0_sel) begin
		case (builder_ethernetsoc_interface0_bank_bus_adr[4:0])
			1'd0: begin
				builder_ethernetsoc_interface0_bank_bus_dat_r <= main_ethernetsoc_vexriscv_latch_w;
			end
			1'd1: begin
				builder_ethernetsoc_interface0_bank_bus_dat_r <= builder_ethernetsoc_csrbank0_timer_time7_w;
			end
			2'd2: begin
				builder_ethernetsoc_interface0_bank_bus_dat_r <= builder_ethernetsoc_csrbank0_timer_time6_w;
			end
			2'd3: begin
				builder_ethernetsoc_interface0_bank_bus_dat_r <= builder_ethernetsoc_csrbank0_timer_time5_w;
			end
			3'd4: begin
				builder_ethernetsoc_interface0_bank_bus_dat_r <= builder_ethernetsoc_csrbank0_timer_time4_w;
			end
			3'd5: begin
				builder_ethernetsoc_interface0_bank_bus_dat_r <= builder_ethernetsoc_csrbank0_timer_time3_w;
			end
			3'd6: begin
				builder_ethernetsoc_interface0_bank_bus_dat_r <= builder_ethernetsoc_csrbank0_timer_time2_w;
			end
			3'd7: begin
				builder_ethernetsoc_interface0_bank_bus_dat_r <= builder_ethernetsoc_csrbank0_timer_time1_w;
			end
			4'd8: begin
				builder_ethernetsoc_interface0_bank_bus_dat_r <= builder_ethernetsoc_csrbank0_timer_time0_w;
			end
			4'd9: begin
				builder_ethernetsoc_interface0_bank_bus_dat_r <= builder_ethernetsoc_csrbank0_timer_time_cmp7_w;
			end
			4'd10: begin
				builder_ethernetsoc_interface0_bank_bus_dat_r <= builder_ethernetsoc_csrbank0_timer_time_cmp6_w;
			end
			4'd11: begin
				builder_ethernetsoc_interface0_bank_bus_dat_r <= builder_ethernetsoc_csrbank0_timer_time_cmp5_w;
			end
			4'd12: begin
				builder_ethernetsoc_interface0_bank_bus_dat_r <= builder_ethernetsoc_csrbank0_timer_time_cmp4_w;
			end
			4'd13: begin
				builder_ethernetsoc_interface0_bank_bus_dat_r <= builder_ethernetsoc_csrbank0_timer_time_cmp3_w;
			end
			4'd14: begin
				builder_ethernetsoc_interface0_bank_bus_dat_r <= builder_ethernetsoc_csrbank0_timer_time_cmp2_w;
			end
			4'd15: begin
				builder_ethernetsoc_interface0_bank_bus_dat_r <= builder_ethernetsoc_csrbank0_timer_time_cmp1_w;
			end
			5'd16: begin
				builder_ethernetsoc_interface0_bank_bus_dat_r <= builder_ethernetsoc_csrbank0_timer_time_cmp0_w;
			end
		endcase
	end
	if (builder_ethernetsoc_csrbank0_timer_time_cmp7_re) begin
		main_ethernetsoc_vexriscv_time_cmp_storage_full[63:56] <= builder_ethernetsoc_csrbank0_timer_time_cmp7_r;
	end
	if (builder_ethernetsoc_csrbank0_timer_time_cmp6_re) begin
		main_ethernetsoc_vexriscv_time_cmp_storage_full[55:48] <= builder_ethernetsoc_csrbank0_timer_time_cmp6_r;
	end
	if (builder_ethernetsoc_csrbank0_timer_time_cmp5_re) begin
		main_ethernetsoc_vexriscv_time_cmp_storage_full[47:40] <= builder_ethernetsoc_csrbank0_timer_time_cmp5_r;
	end
	if (builder_ethernetsoc_csrbank0_timer_time_cmp4_re) begin
		main_ethernetsoc_vexriscv_time_cmp_storage_full[39:32] <= builder_ethernetsoc_csrbank0_timer_time_cmp4_r;
	end
	if (builder_ethernetsoc_csrbank0_timer_time_cmp3_re) begin
		main_ethernetsoc_vexriscv_time_cmp_storage_full[31:24] <= builder_ethernetsoc_csrbank0_timer_time_cmp3_r;
	end
	if (builder_ethernetsoc_csrbank0_timer_time_cmp2_re) begin
		main_ethernetsoc_vexriscv_time_cmp_storage_full[23:16] <= builder_ethernetsoc_csrbank0_timer_time_cmp2_r;
	end
	if (builder_ethernetsoc_csrbank0_timer_time_cmp1_re) begin
		main_ethernetsoc_vexriscv_time_cmp_storage_full[15:8] <= builder_ethernetsoc_csrbank0_timer_time_cmp1_r;
	end
	if (builder_ethernetsoc_csrbank0_timer_time_cmp0_re) begin
		main_ethernetsoc_vexriscv_time_cmp_storage_full[7:0] <= builder_ethernetsoc_csrbank0_timer_time_cmp0_r;
	end
	main_ethernetsoc_vexriscv_time_cmp_re <= builder_ethernetsoc_csrbank0_timer_time_cmp0_re;
	builder_ethernetsoc_interface1_bank_bus_dat_r <= 1'd0;
	if (builder_ethernetsoc_csrbank1_sel) begin
		case (builder_ethernetsoc_interface1_bank_bus_adr[3:0])
			1'd0: begin
				builder_ethernetsoc_interface1_bank_bus_dat_r <= main_ethernetsoc_ctrl_reset_reset_w;
			end
			1'd1: begin
				builder_ethernetsoc_interface1_bank_bus_dat_r <= builder_ethernetsoc_csrbank1_scratch3_w;
			end
			2'd2: begin
				builder_ethernetsoc_interface1_bank_bus_dat_r <= builder_ethernetsoc_csrbank1_scratch2_w;
			end
			2'd3: begin
				builder_ethernetsoc_interface1_bank_bus_dat_r <= builder_ethernetsoc_csrbank1_scratch1_w;
			end
			3'd4: begin
				builder_ethernetsoc_interface1_bank_bus_dat_r <= builder_ethernetsoc_csrbank1_scratch0_w;
			end
			3'd5: begin
				builder_ethernetsoc_interface1_bank_bus_dat_r <= builder_ethernetsoc_csrbank1_bus_errors3_w;
			end
			3'd6: begin
				builder_ethernetsoc_interface1_bank_bus_dat_r <= builder_ethernetsoc_csrbank1_bus_errors2_w;
			end
			3'd7: begin
				builder_ethernetsoc_interface1_bank_bus_dat_r <= builder_ethernetsoc_csrbank1_bus_errors1_w;
			end
			4'd8: begin
				builder_ethernetsoc_interface1_bank_bus_dat_r <= builder_ethernetsoc_csrbank1_bus_errors0_w;
			end
		endcase
	end
	if (builder_ethernetsoc_csrbank1_scratch3_re) begin
		main_ethernetsoc_ctrl_storage_full[31:24] <= builder_ethernetsoc_csrbank1_scratch3_r;
	end
	if (builder_ethernetsoc_csrbank1_scratch2_re) begin
		main_ethernetsoc_ctrl_storage_full[23:16] <= builder_ethernetsoc_csrbank1_scratch2_r;
	end
	if (builder_ethernetsoc_csrbank1_scratch1_re) begin
		main_ethernetsoc_ctrl_storage_full[15:8] <= builder_ethernetsoc_csrbank1_scratch1_r;
	end
	if (builder_ethernetsoc_csrbank1_scratch0_re) begin
		main_ethernetsoc_ctrl_storage_full[7:0] <= builder_ethernetsoc_csrbank1_scratch0_r;
	end
	main_ethernetsoc_ctrl_re <= builder_ethernetsoc_csrbank1_scratch0_re;
	builder_ethernetsoc_interface2_bank_bus_dat_r <= 1'd0;
	if (builder_ethernetsoc_csrbank2_sel) begin
		case (builder_ethernetsoc_interface2_bank_bus_adr[2:0])
			1'd0: begin
				builder_ethernetsoc_interface2_bank_bus_dat_r <= builder_ethernetsoc_csrbank2_half_sys8x_taps0_w;
			end
			1'd1: begin
				builder_ethernetsoc_interface2_bank_bus_dat_r <= main_ethernetsoc_a7ddrphy_cdly_rst_w;
			end
			2'd2: begin
				builder_ethernetsoc_interface2_bank_bus_dat_r <= main_ethernetsoc_a7ddrphy_cdly_inc_w;
			end
			2'd3: begin
				builder_ethernetsoc_interface2_bank_bus_dat_r <= builder_ethernetsoc_csrbank2_dly_sel0_w;
			end
			3'd4: begin
				builder_ethernetsoc_interface2_bank_bus_dat_r <= main_ethernetsoc_a7ddrphy_rdly_dq_rst_w;
			end
			3'd5: begin
				builder_ethernetsoc_interface2_bank_bus_dat_r <= main_ethernetsoc_a7ddrphy_rdly_dq_inc_w;
			end
			3'd6: begin
				builder_ethernetsoc_interface2_bank_bus_dat_r <= main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_rst_w;
			end
			3'd7: begin
				builder_ethernetsoc_interface2_bank_bus_dat_r <= main_ethernetsoc_a7ddrphy_rdly_dq_bitslip_w;
			end
		endcase
	end
	if (builder_ethernetsoc_csrbank2_half_sys8x_taps0_re) begin
		main_ethernetsoc_a7ddrphy_half_sys8x_taps_storage_full[3:0] <= builder_ethernetsoc_csrbank2_half_sys8x_taps0_r;
	end
	main_ethernetsoc_a7ddrphy_half_sys8x_taps_re <= builder_ethernetsoc_csrbank2_half_sys8x_taps0_re;
	if (builder_ethernetsoc_csrbank2_dly_sel0_re) begin
		main_ethernetsoc_a7ddrphy_dly_sel_storage_full[1:0] <= builder_ethernetsoc_csrbank2_dly_sel0_r;
	end
	main_ethernetsoc_a7ddrphy_dly_sel_re <= builder_ethernetsoc_csrbank2_dly_sel0_re;
	builder_ethernetsoc_interface3_bank_bus_dat_r <= 1'd0;
	if (builder_ethernetsoc_csrbank3_sel) begin
		case (builder_ethernetsoc_interface3_bank_bus_adr[4:0])
			1'd0: begin
				builder_ethernetsoc_interface3_bank_bus_dat_r <= builder_ethernetsoc_csrbank3_sram_writer_slot_w;
			end
			1'd1: begin
				builder_ethernetsoc_interface3_bank_bus_dat_r <= builder_ethernetsoc_csrbank3_sram_writer_length3_w;
			end
			2'd2: begin
				builder_ethernetsoc_interface3_bank_bus_dat_r <= builder_ethernetsoc_csrbank3_sram_writer_length2_w;
			end
			2'd3: begin
				builder_ethernetsoc_interface3_bank_bus_dat_r <= builder_ethernetsoc_csrbank3_sram_writer_length1_w;
			end
			3'd4: begin
				builder_ethernetsoc_interface3_bank_bus_dat_r <= builder_ethernetsoc_csrbank3_sram_writer_length0_w;
			end
			3'd5: begin
				builder_ethernetsoc_interface3_bank_bus_dat_r <= builder_ethernetsoc_csrbank3_sram_writer_errors3_w;
			end
			3'd6: begin
				builder_ethernetsoc_interface3_bank_bus_dat_r <= builder_ethernetsoc_csrbank3_sram_writer_errors2_w;
			end
			3'd7: begin
				builder_ethernetsoc_interface3_bank_bus_dat_r <= builder_ethernetsoc_csrbank3_sram_writer_errors1_w;
			end
			4'd8: begin
				builder_ethernetsoc_interface3_bank_bus_dat_r <= builder_ethernetsoc_csrbank3_sram_writer_errors0_w;
			end
			4'd9: begin
				builder_ethernetsoc_interface3_bank_bus_dat_r <= main_writer_status_w;
			end
			4'd10: begin
				builder_ethernetsoc_interface3_bank_bus_dat_r <= main_writer_pending_w;
			end
			4'd11: begin
				builder_ethernetsoc_interface3_bank_bus_dat_r <= builder_ethernetsoc_csrbank3_sram_writer_ev_enable0_w;
			end
			4'd12: begin
				builder_ethernetsoc_interface3_bank_bus_dat_r <= main_reader_start_w;
			end
			4'd13: begin
				builder_ethernetsoc_interface3_bank_bus_dat_r <= builder_ethernetsoc_csrbank3_sram_reader_ready_w;
			end
			4'd14: begin
				builder_ethernetsoc_interface3_bank_bus_dat_r <= builder_ethernetsoc_csrbank3_sram_reader_level_w;
			end
			4'd15: begin
				builder_ethernetsoc_interface3_bank_bus_dat_r <= builder_ethernetsoc_csrbank3_sram_reader_slot0_w;
			end
			5'd16: begin
				builder_ethernetsoc_interface3_bank_bus_dat_r <= builder_ethernetsoc_csrbank3_sram_reader_length1_w;
			end
			5'd17: begin
				builder_ethernetsoc_interface3_bank_bus_dat_r <= builder_ethernetsoc_csrbank3_sram_reader_length0_w;
			end
			5'd18: begin
				builder_ethernetsoc_interface3_bank_bus_dat_r <= main_reader_eventmanager_status_w;
			end
			5'd19: begin
				builder_ethernetsoc_interface3_bank_bus_dat_r <= main_reader_eventmanager_pending_w;
			end
			5'd20: begin
				builder_ethernetsoc_interface3_bank_bus_dat_r <= builder_ethernetsoc_csrbank3_sram_reader_ev_enable0_w;
			end
			5'd21: begin
				builder_ethernetsoc_interface3_bank_bus_dat_r <= builder_ethernetsoc_csrbank3_preamble_crc_w;
			end
			5'd22: begin
				builder_ethernetsoc_interface3_bank_bus_dat_r <= builder_ethernetsoc_csrbank3_preamble_errors3_w;
			end
			5'd23: begin
				builder_ethernetsoc_interface3_bank_bus_dat_r <= builder_ethernetsoc_csrbank3_preamble_errors2_w;
			end
			5'd24: begin
				builder_ethernetsoc_interface3_bank_bus_dat_r <= builder_ethernetsoc_csrbank3_preamble_errors1_w;
			end
			5'd25: begin
				builder_ethernetsoc_interface3_bank_bus_dat_r <= builder_ethernetsoc_csrbank3_preamble_errors0_w;
			end
			5'd26: begin
				builder_ethernetsoc_interface3_bank_bus_dat_r <= builder_ethernetsoc_csrbank3_crc_errors3_w;
			end
			5'd27: begin
				builder_ethernetsoc_interface3_bank_bus_dat_r <= builder_ethernetsoc_csrbank3_crc_errors2_w;
			end
			5'd28: begin
				builder_ethernetsoc_interface3_bank_bus_dat_r <= builder_ethernetsoc_csrbank3_crc_errors1_w;
			end
			5'd29: begin
				builder_ethernetsoc_interface3_bank_bus_dat_r <= builder_ethernetsoc_csrbank3_crc_errors0_w;
			end
		endcase
	end
	if (builder_ethernetsoc_csrbank3_sram_writer_ev_enable0_re) begin
		main_writer_storage_full <= builder_ethernetsoc_csrbank3_sram_writer_ev_enable0_r;
	end
	main_writer_re <= builder_ethernetsoc_csrbank3_sram_writer_ev_enable0_re;
	if (builder_ethernetsoc_csrbank3_sram_reader_slot0_re) begin
		main_reader_slot_storage_full <= builder_ethernetsoc_csrbank3_sram_reader_slot0_r;
	end
	main_reader_slot_re <= builder_ethernetsoc_csrbank3_sram_reader_slot0_re;
	if (builder_ethernetsoc_csrbank3_sram_reader_length1_re) begin
		main_reader_length_storage_full[10:8] <= builder_ethernetsoc_csrbank3_sram_reader_length1_r;
	end
	if (builder_ethernetsoc_csrbank3_sram_reader_length0_re) begin
		main_reader_length_storage_full[7:0] <= builder_ethernetsoc_csrbank3_sram_reader_length0_r;
	end
	main_reader_length_re <= builder_ethernetsoc_csrbank3_sram_reader_length0_re;
	if (builder_ethernetsoc_csrbank3_sram_reader_ev_enable0_re) begin
		main_reader_eventmanager_storage_full <= builder_ethernetsoc_csrbank3_sram_reader_ev_enable0_r;
	end
	main_reader_eventmanager_re <= builder_ethernetsoc_csrbank3_sram_reader_ev_enable0_re;
	builder_ethernetsoc_interface4_bank_bus_dat_r <= 1'd0;
	if (builder_ethernetsoc_csrbank4_sel) begin
		case (builder_ethernetsoc_interface4_bank_bus_adr[1:0])
			1'd0: begin
				builder_ethernetsoc_interface4_bank_bus_dat_r <= builder_ethernetsoc_csrbank4_crg_reset0_w;
			end
			1'd1: begin
				builder_ethernetsoc_interface4_bank_bus_dat_r <= builder_ethernetsoc_csrbank4_mdio_w0_w;
			end
			2'd2: begin
				builder_ethernetsoc_interface4_bank_bus_dat_r <= builder_ethernetsoc_csrbank4_mdio_r_w;
			end
		endcase
	end
	if (builder_ethernetsoc_csrbank4_crg_reset0_re) begin
		main_ethphy_reset_storage_full <= builder_ethernetsoc_csrbank4_crg_reset0_r;
	end
	main_ethphy_reset_re <= builder_ethernetsoc_csrbank4_crg_reset0_re;
	if (builder_ethernetsoc_csrbank4_mdio_w0_re) begin
		main_ethphy_storage_full[2:0] <= builder_ethernetsoc_csrbank4_mdio_w0_r;
	end
	main_ethphy_re <= builder_ethernetsoc_csrbank4_mdio_w0_re;
	builder_ethernetsoc_interface5_bank_bus_dat_r <= 1'd0;
	if (builder_ethernetsoc_csrbank5_sel) begin
		case (builder_ethernetsoc_interface5_bank_bus_adr[5:0])
			1'd0: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_control0_w;
			end
			1'd1: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi0_command0_w;
			end
			2'd2: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= main_ethernetsoc_sdram_phaseinjector0_command_issue_w;
			end
			2'd3: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi0_address1_w;
			end
			3'd4: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi0_address0_w;
			end
			3'd5: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi0_baddress0_w;
			end
			3'd6: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi0_wrdata3_w;
			end
			3'd7: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi0_wrdata2_w;
			end
			4'd8: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi0_wrdata1_w;
			end
			4'd9: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi0_wrdata0_w;
			end
			4'd10: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi0_rddata3_w;
			end
			4'd11: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi0_rddata2_w;
			end
			4'd12: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi0_rddata1_w;
			end
			4'd13: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi0_rddata0_w;
			end
			4'd14: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi1_command0_w;
			end
			4'd15: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= main_ethernetsoc_sdram_phaseinjector1_command_issue_w;
			end
			5'd16: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi1_address1_w;
			end
			5'd17: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi1_address0_w;
			end
			5'd18: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi1_baddress0_w;
			end
			5'd19: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi1_wrdata3_w;
			end
			5'd20: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi1_wrdata2_w;
			end
			5'd21: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi1_wrdata1_w;
			end
			5'd22: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi1_wrdata0_w;
			end
			5'd23: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi1_rddata3_w;
			end
			5'd24: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi1_rddata2_w;
			end
			5'd25: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi1_rddata1_w;
			end
			5'd26: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi1_rddata0_w;
			end
			5'd27: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi2_command0_w;
			end
			5'd28: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= main_ethernetsoc_sdram_phaseinjector2_command_issue_w;
			end
			5'd29: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi2_address1_w;
			end
			5'd30: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi2_address0_w;
			end
			5'd31: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi2_baddress0_w;
			end
			6'd32: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi2_wrdata3_w;
			end
			6'd33: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi2_wrdata2_w;
			end
			6'd34: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi2_wrdata1_w;
			end
			6'd35: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi2_wrdata0_w;
			end
			6'd36: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi2_rddata3_w;
			end
			6'd37: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi2_rddata2_w;
			end
			6'd38: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi2_rddata1_w;
			end
			6'd39: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi2_rddata0_w;
			end
			6'd40: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi3_command0_w;
			end
			6'd41: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= main_ethernetsoc_sdram_phaseinjector3_command_issue_w;
			end
			6'd42: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi3_address1_w;
			end
			6'd43: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi3_address0_w;
			end
			6'd44: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi3_baddress0_w;
			end
			6'd45: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi3_wrdata3_w;
			end
			6'd46: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi3_wrdata2_w;
			end
			6'd47: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi3_wrdata1_w;
			end
			6'd48: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi3_wrdata0_w;
			end
			6'd49: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi3_rddata3_w;
			end
			6'd50: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi3_rddata2_w;
			end
			6'd51: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi3_rddata1_w;
			end
			6'd52: begin
				builder_ethernetsoc_interface5_bank_bus_dat_r <= builder_ethernetsoc_csrbank5_dfii_pi3_rddata0_w;
			end
		endcase
	end
	if (builder_ethernetsoc_csrbank5_dfii_control0_re) begin
		main_ethernetsoc_sdram_storage_full[3:0] <= builder_ethernetsoc_csrbank5_dfii_control0_r;
	end
	main_ethernetsoc_sdram_re <= builder_ethernetsoc_csrbank5_dfii_control0_re;
	if (builder_ethernetsoc_csrbank5_dfii_pi0_command0_re) begin
		main_ethernetsoc_sdram_phaseinjector0_command_storage_full[5:0] <= builder_ethernetsoc_csrbank5_dfii_pi0_command0_r;
	end
	main_ethernetsoc_sdram_phaseinjector0_command_re <= builder_ethernetsoc_csrbank5_dfii_pi0_command0_re;
	if (builder_ethernetsoc_csrbank5_dfii_pi0_address1_re) begin
		main_ethernetsoc_sdram_phaseinjector0_address_storage_full[13:8] <= builder_ethernetsoc_csrbank5_dfii_pi0_address1_r;
	end
	if (builder_ethernetsoc_csrbank5_dfii_pi0_address0_re) begin
		main_ethernetsoc_sdram_phaseinjector0_address_storage_full[7:0] <= builder_ethernetsoc_csrbank5_dfii_pi0_address0_r;
	end
	main_ethernetsoc_sdram_phaseinjector0_address_re <= builder_ethernetsoc_csrbank5_dfii_pi0_address0_re;
	if (builder_ethernetsoc_csrbank5_dfii_pi0_baddress0_re) begin
		main_ethernetsoc_sdram_phaseinjector0_baddress_storage_full[2:0] <= builder_ethernetsoc_csrbank5_dfii_pi0_baddress0_r;
	end
	main_ethernetsoc_sdram_phaseinjector0_baddress_re <= builder_ethernetsoc_csrbank5_dfii_pi0_baddress0_re;
	if (builder_ethernetsoc_csrbank5_dfii_pi0_wrdata3_re) begin
		main_ethernetsoc_sdram_phaseinjector0_wrdata_storage_full[31:24] <= builder_ethernetsoc_csrbank5_dfii_pi0_wrdata3_r;
	end
	if (builder_ethernetsoc_csrbank5_dfii_pi0_wrdata2_re) begin
		main_ethernetsoc_sdram_phaseinjector0_wrdata_storage_full[23:16] <= builder_ethernetsoc_csrbank5_dfii_pi0_wrdata2_r;
	end
	if (builder_ethernetsoc_csrbank5_dfii_pi0_wrdata1_re) begin
		main_ethernetsoc_sdram_phaseinjector0_wrdata_storage_full[15:8] <= builder_ethernetsoc_csrbank5_dfii_pi0_wrdata1_r;
	end
	if (builder_ethernetsoc_csrbank5_dfii_pi0_wrdata0_re) begin
		main_ethernetsoc_sdram_phaseinjector0_wrdata_storage_full[7:0] <= builder_ethernetsoc_csrbank5_dfii_pi0_wrdata0_r;
	end
	main_ethernetsoc_sdram_phaseinjector0_wrdata_re <= builder_ethernetsoc_csrbank5_dfii_pi0_wrdata0_re;
	if (builder_ethernetsoc_csrbank5_dfii_pi1_command0_re) begin
		main_ethernetsoc_sdram_phaseinjector1_command_storage_full[5:0] <= builder_ethernetsoc_csrbank5_dfii_pi1_command0_r;
	end
	main_ethernetsoc_sdram_phaseinjector1_command_re <= builder_ethernetsoc_csrbank5_dfii_pi1_command0_re;
	if (builder_ethernetsoc_csrbank5_dfii_pi1_address1_re) begin
		main_ethernetsoc_sdram_phaseinjector1_address_storage_full[13:8] <= builder_ethernetsoc_csrbank5_dfii_pi1_address1_r;
	end
	if (builder_ethernetsoc_csrbank5_dfii_pi1_address0_re) begin
		main_ethernetsoc_sdram_phaseinjector1_address_storage_full[7:0] <= builder_ethernetsoc_csrbank5_dfii_pi1_address0_r;
	end
	main_ethernetsoc_sdram_phaseinjector1_address_re <= builder_ethernetsoc_csrbank5_dfii_pi1_address0_re;
	if (builder_ethernetsoc_csrbank5_dfii_pi1_baddress0_re) begin
		main_ethernetsoc_sdram_phaseinjector1_baddress_storage_full[2:0] <= builder_ethernetsoc_csrbank5_dfii_pi1_baddress0_r;
	end
	main_ethernetsoc_sdram_phaseinjector1_baddress_re <= builder_ethernetsoc_csrbank5_dfii_pi1_baddress0_re;
	if (builder_ethernetsoc_csrbank5_dfii_pi1_wrdata3_re) begin
		main_ethernetsoc_sdram_phaseinjector1_wrdata_storage_full[31:24] <= builder_ethernetsoc_csrbank5_dfii_pi1_wrdata3_r;
	end
	if (builder_ethernetsoc_csrbank5_dfii_pi1_wrdata2_re) begin
		main_ethernetsoc_sdram_phaseinjector1_wrdata_storage_full[23:16] <= builder_ethernetsoc_csrbank5_dfii_pi1_wrdata2_r;
	end
	if (builder_ethernetsoc_csrbank5_dfii_pi1_wrdata1_re) begin
		main_ethernetsoc_sdram_phaseinjector1_wrdata_storage_full[15:8] <= builder_ethernetsoc_csrbank5_dfii_pi1_wrdata1_r;
	end
	if (builder_ethernetsoc_csrbank5_dfii_pi1_wrdata0_re) begin
		main_ethernetsoc_sdram_phaseinjector1_wrdata_storage_full[7:0] <= builder_ethernetsoc_csrbank5_dfii_pi1_wrdata0_r;
	end
	main_ethernetsoc_sdram_phaseinjector1_wrdata_re <= builder_ethernetsoc_csrbank5_dfii_pi1_wrdata0_re;
	if (builder_ethernetsoc_csrbank5_dfii_pi2_command0_re) begin
		main_ethernetsoc_sdram_phaseinjector2_command_storage_full[5:0] <= builder_ethernetsoc_csrbank5_dfii_pi2_command0_r;
	end
	main_ethernetsoc_sdram_phaseinjector2_command_re <= builder_ethernetsoc_csrbank5_dfii_pi2_command0_re;
	if (builder_ethernetsoc_csrbank5_dfii_pi2_address1_re) begin
		main_ethernetsoc_sdram_phaseinjector2_address_storage_full[13:8] <= builder_ethernetsoc_csrbank5_dfii_pi2_address1_r;
	end
	if (builder_ethernetsoc_csrbank5_dfii_pi2_address0_re) begin
		main_ethernetsoc_sdram_phaseinjector2_address_storage_full[7:0] <= builder_ethernetsoc_csrbank5_dfii_pi2_address0_r;
	end
	main_ethernetsoc_sdram_phaseinjector2_address_re <= builder_ethernetsoc_csrbank5_dfii_pi2_address0_re;
	if (builder_ethernetsoc_csrbank5_dfii_pi2_baddress0_re) begin
		main_ethernetsoc_sdram_phaseinjector2_baddress_storage_full[2:0] <= builder_ethernetsoc_csrbank5_dfii_pi2_baddress0_r;
	end
	main_ethernetsoc_sdram_phaseinjector2_baddress_re <= builder_ethernetsoc_csrbank5_dfii_pi2_baddress0_re;
	if (builder_ethernetsoc_csrbank5_dfii_pi2_wrdata3_re) begin
		main_ethernetsoc_sdram_phaseinjector2_wrdata_storage_full[31:24] <= builder_ethernetsoc_csrbank5_dfii_pi2_wrdata3_r;
	end
	if (builder_ethernetsoc_csrbank5_dfii_pi2_wrdata2_re) begin
		main_ethernetsoc_sdram_phaseinjector2_wrdata_storage_full[23:16] <= builder_ethernetsoc_csrbank5_dfii_pi2_wrdata2_r;
	end
	if (builder_ethernetsoc_csrbank5_dfii_pi2_wrdata1_re) begin
		main_ethernetsoc_sdram_phaseinjector2_wrdata_storage_full[15:8] <= builder_ethernetsoc_csrbank5_dfii_pi2_wrdata1_r;
	end
	if (builder_ethernetsoc_csrbank5_dfii_pi2_wrdata0_re) begin
		main_ethernetsoc_sdram_phaseinjector2_wrdata_storage_full[7:0] <= builder_ethernetsoc_csrbank5_dfii_pi2_wrdata0_r;
	end
	main_ethernetsoc_sdram_phaseinjector2_wrdata_re <= builder_ethernetsoc_csrbank5_dfii_pi2_wrdata0_re;
	if (builder_ethernetsoc_csrbank5_dfii_pi3_command0_re) begin
		main_ethernetsoc_sdram_phaseinjector3_command_storage_full[5:0] <= builder_ethernetsoc_csrbank5_dfii_pi3_command0_r;
	end
	main_ethernetsoc_sdram_phaseinjector3_command_re <= builder_ethernetsoc_csrbank5_dfii_pi3_command0_re;
	if (builder_ethernetsoc_csrbank5_dfii_pi3_address1_re) begin
		main_ethernetsoc_sdram_phaseinjector3_address_storage_full[13:8] <= builder_ethernetsoc_csrbank5_dfii_pi3_address1_r;
	end
	if (builder_ethernetsoc_csrbank5_dfii_pi3_address0_re) begin
		main_ethernetsoc_sdram_phaseinjector3_address_storage_full[7:0] <= builder_ethernetsoc_csrbank5_dfii_pi3_address0_r;
	end
	main_ethernetsoc_sdram_phaseinjector3_address_re <= builder_ethernetsoc_csrbank5_dfii_pi3_address0_re;
	if (builder_ethernetsoc_csrbank5_dfii_pi3_baddress0_re) begin
		main_ethernetsoc_sdram_phaseinjector3_baddress_storage_full[2:0] <= builder_ethernetsoc_csrbank5_dfii_pi3_baddress0_r;
	end
	main_ethernetsoc_sdram_phaseinjector3_baddress_re <= builder_ethernetsoc_csrbank5_dfii_pi3_baddress0_re;
	if (builder_ethernetsoc_csrbank5_dfii_pi3_wrdata3_re) begin
		main_ethernetsoc_sdram_phaseinjector3_wrdata_storage_full[31:24] <= builder_ethernetsoc_csrbank5_dfii_pi3_wrdata3_r;
	end
	if (builder_ethernetsoc_csrbank5_dfii_pi3_wrdata2_re) begin
		main_ethernetsoc_sdram_phaseinjector3_wrdata_storage_full[23:16] <= builder_ethernetsoc_csrbank5_dfii_pi3_wrdata2_r;
	end
	if (builder_ethernetsoc_csrbank5_dfii_pi3_wrdata1_re) begin
		main_ethernetsoc_sdram_phaseinjector3_wrdata_storage_full[15:8] <= builder_ethernetsoc_csrbank5_dfii_pi3_wrdata1_r;
	end
	if (builder_ethernetsoc_csrbank5_dfii_pi3_wrdata0_re) begin
		main_ethernetsoc_sdram_phaseinjector3_wrdata_storage_full[7:0] <= builder_ethernetsoc_csrbank5_dfii_pi3_wrdata0_r;
	end
	main_ethernetsoc_sdram_phaseinjector3_wrdata_re <= builder_ethernetsoc_csrbank5_dfii_pi3_wrdata0_re;
	builder_ethernetsoc_interface6_bank_bus_dat_r <= 1'd0;
	if (builder_ethernetsoc_csrbank6_sel) begin
		case (builder_ethernetsoc_interface6_bank_bus_adr[4:0])
			1'd0: begin
				builder_ethernetsoc_interface6_bank_bus_dat_r <= builder_ethernetsoc_csrbank6_load3_w;
			end
			1'd1: begin
				builder_ethernetsoc_interface6_bank_bus_dat_r <= builder_ethernetsoc_csrbank6_load2_w;
			end
			2'd2: begin
				builder_ethernetsoc_interface6_bank_bus_dat_r <= builder_ethernetsoc_csrbank6_load1_w;
			end
			2'd3: begin
				builder_ethernetsoc_interface6_bank_bus_dat_r <= builder_ethernetsoc_csrbank6_load0_w;
			end
			3'd4: begin
				builder_ethernetsoc_interface6_bank_bus_dat_r <= builder_ethernetsoc_csrbank6_reload3_w;
			end
			3'd5: begin
				builder_ethernetsoc_interface6_bank_bus_dat_r <= builder_ethernetsoc_csrbank6_reload2_w;
			end
			3'd6: begin
				builder_ethernetsoc_interface6_bank_bus_dat_r <= builder_ethernetsoc_csrbank6_reload1_w;
			end
			3'd7: begin
				builder_ethernetsoc_interface6_bank_bus_dat_r <= builder_ethernetsoc_csrbank6_reload0_w;
			end
			4'd8: begin
				builder_ethernetsoc_interface6_bank_bus_dat_r <= builder_ethernetsoc_csrbank6_en0_w;
			end
			4'd9: begin
				builder_ethernetsoc_interface6_bank_bus_dat_r <= main_ethernetsoc_timer0_update_value_w;
			end
			4'd10: begin
				builder_ethernetsoc_interface6_bank_bus_dat_r <= builder_ethernetsoc_csrbank6_value3_w;
			end
			4'd11: begin
				builder_ethernetsoc_interface6_bank_bus_dat_r <= builder_ethernetsoc_csrbank6_value2_w;
			end
			4'd12: begin
				builder_ethernetsoc_interface6_bank_bus_dat_r <= builder_ethernetsoc_csrbank6_value1_w;
			end
			4'd13: begin
				builder_ethernetsoc_interface6_bank_bus_dat_r <= builder_ethernetsoc_csrbank6_value0_w;
			end
			4'd14: begin
				builder_ethernetsoc_interface6_bank_bus_dat_r <= main_ethernetsoc_timer0_eventmanager_status_w;
			end
			4'd15: begin
				builder_ethernetsoc_interface6_bank_bus_dat_r <= main_ethernetsoc_timer0_eventmanager_pending_w;
			end
			5'd16: begin
				builder_ethernetsoc_interface6_bank_bus_dat_r <= builder_ethernetsoc_csrbank6_ev_enable0_w;
			end
		endcase
	end
	if (builder_ethernetsoc_csrbank6_load3_re) begin
		main_ethernetsoc_timer0_load_storage_full[31:24] <= builder_ethernetsoc_csrbank6_load3_r;
	end
	if (builder_ethernetsoc_csrbank6_load2_re) begin
		main_ethernetsoc_timer0_load_storage_full[23:16] <= builder_ethernetsoc_csrbank6_load2_r;
	end
	if (builder_ethernetsoc_csrbank6_load1_re) begin
		main_ethernetsoc_timer0_load_storage_full[15:8] <= builder_ethernetsoc_csrbank6_load1_r;
	end
	if (builder_ethernetsoc_csrbank6_load0_re) begin
		main_ethernetsoc_timer0_load_storage_full[7:0] <= builder_ethernetsoc_csrbank6_load0_r;
	end
	main_ethernetsoc_timer0_load_re <= builder_ethernetsoc_csrbank6_load0_re;
	if (builder_ethernetsoc_csrbank6_reload3_re) begin
		main_ethernetsoc_timer0_reload_storage_full[31:24] <= builder_ethernetsoc_csrbank6_reload3_r;
	end
	if (builder_ethernetsoc_csrbank6_reload2_re) begin
		main_ethernetsoc_timer0_reload_storage_full[23:16] <= builder_ethernetsoc_csrbank6_reload2_r;
	end
	if (builder_ethernetsoc_csrbank6_reload1_re) begin
		main_ethernetsoc_timer0_reload_storage_full[15:8] <= builder_ethernetsoc_csrbank6_reload1_r;
	end
	if (builder_ethernetsoc_csrbank6_reload0_re) begin
		main_ethernetsoc_timer0_reload_storage_full[7:0] <= builder_ethernetsoc_csrbank6_reload0_r;
	end
	main_ethernetsoc_timer0_reload_re <= builder_ethernetsoc_csrbank6_reload0_re;
	if (builder_ethernetsoc_csrbank6_en0_re) begin
		main_ethernetsoc_timer0_en_storage_full <= builder_ethernetsoc_csrbank6_en0_r;
	end
	main_ethernetsoc_timer0_en_re <= builder_ethernetsoc_csrbank6_en0_re;
	if (builder_ethernetsoc_csrbank6_ev_enable0_re) begin
		main_ethernetsoc_timer0_eventmanager_storage_full <= builder_ethernetsoc_csrbank6_ev_enable0_r;
	end
	main_ethernetsoc_timer0_eventmanager_re <= builder_ethernetsoc_csrbank6_ev_enable0_re;
	builder_ethernetsoc_interface7_bank_bus_dat_r <= 1'd0;
	if (builder_ethernetsoc_csrbank7_sel) begin
		case (builder_ethernetsoc_interface7_bank_bus_adr[2:0])
			1'd0: begin
				builder_ethernetsoc_interface7_bank_bus_dat_r <= main_ethernetsoc_uart_rxtx_w;
			end
			1'd1: begin
				builder_ethernetsoc_interface7_bank_bus_dat_r <= builder_ethernetsoc_csrbank7_txfull_w;
			end
			2'd2: begin
				builder_ethernetsoc_interface7_bank_bus_dat_r <= builder_ethernetsoc_csrbank7_rxempty_w;
			end
			2'd3: begin
				builder_ethernetsoc_interface7_bank_bus_dat_r <= main_ethernetsoc_uart_eventmanager_status_w;
			end
			3'd4: begin
				builder_ethernetsoc_interface7_bank_bus_dat_r <= main_ethernetsoc_uart_eventmanager_pending_w;
			end
			3'd5: begin
				builder_ethernetsoc_interface7_bank_bus_dat_r <= builder_ethernetsoc_csrbank7_ev_enable0_w;
			end
		endcase
	end
	if (builder_ethernetsoc_csrbank7_ev_enable0_re) begin
		main_ethernetsoc_uart_eventmanager_storage_full[1:0] <= builder_ethernetsoc_csrbank7_ev_enable0_r;
	end
	main_ethernetsoc_uart_eventmanager_re <= builder_ethernetsoc_csrbank7_ev_enable0_re;
	builder_ethernetsoc_interface8_bank_bus_dat_r <= 1'd0;
	if (builder_ethernetsoc_csrbank8_sel) begin
		case (builder_ethernetsoc_interface8_bank_bus_adr[1:0])
			1'd0: begin
				builder_ethernetsoc_interface8_bank_bus_dat_r <= builder_ethernetsoc_csrbank8_tuning_word3_w;
			end
			1'd1: begin
				builder_ethernetsoc_interface8_bank_bus_dat_r <= builder_ethernetsoc_csrbank8_tuning_word2_w;
			end
			2'd2: begin
				builder_ethernetsoc_interface8_bank_bus_dat_r <= builder_ethernetsoc_csrbank8_tuning_word1_w;
			end
			2'd3: begin
				builder_ethernetsoc_interface8_bank_bus_dat_r <= builder_ethernetsoc_csrbank8_tuning_word0_w;
			end
		endcase
	end
	if (builder_ethernetsoc_csrbank8_tuning_word3_re) begin
		main_ethernetsoc_uart_phy_storage_full[31:24] <= builder_ethernetsoc_csrbank8_tuning_word3_r;
	end
	if (builder_ethernetsoc_csrbank8_tuning_word2_re) begin
		main_ethernetsoc_uart_phy_storage_full[23:16] <= builder_ethernetsoc_csrbank8_tuning_word2_r;
	end
	if (builder_ethernetsoc_csrbank8_tuning_word1_re) begin
		main_ethernetsoc_uart_phy_storage_full[15:8] <= builder_ethernetsoc_csrbank8_tuning_word1_r;
	end
	if (builder_ethernetsoc_csrbank8_tuning_word0_re) begin
		main_ethernetsoc_uart_phy_storage_full[7:0] <= builder_ethernetsoc_csrbank8_tuning_word0_r;
	end
	main_ethernetsoc_uart_phy_re <= builder_ethernetsoc_csrbank8_tuning_word0_re;
	if (sys_rst) begin
		main_ethernetsoc_ctrl_storage_full <= 32'd305419896;
		main_ethernetsoc_ctrl_re <= 1'd0;
		main_ethernetsoc_ctrl_bus_errors <= 32'd0;
		main_ethernetsoc_vexriscv_time_status <= 64'd0;
		main_ethernetsoc_vexriscv_time_cmp_storage_full <= 64'd18446744073709551615;
		main_ethernetsoc_vexriscv_time_cmp_re <= 1'd0;
		main_ethernetsoc_vexriscv_time <= 64'd0;
		main_ethernetsoc_vexriscv_time_cmp <= 64'd18446744073709551615;
		main_ethernetsoc_rom_bus_ack <= 1'd0;
		main_ethernetsoc_sram_bus_ack <= 1'd0;
		main_ethernetsoc_interface_adr <= 14'd0;
		main_ethernetsoc_interface_we <= 1'd0;
		main_ethernetsoc_interface_dat_w <= 8'd0;
		main_ethernetsoc_bus_wishbone_dat_r <= 32'd0;
		main_ethernetsoc_bus_wishbone_ack <= 1'd0;
		main_ethernetsoc_counter <= 2'd0;
		serial_tx <= 1'd1;
		main_ethernetsoc_uart_phy_storage_full <= 32'd4947802;
		main_ethernetsoc_uart_phy_re <= 1'd0;
		main_ethernetsoc_uart_phy_sink_ready <= 1'd0;
		main_ethernetsoc_uart_phy_uart_clk_txen <= 1'd0;
		main_ethernetsoc_uart_phy_phase_accumulator_tx <= 32'd0;
		main_ethernetsoc_uart_phy_tx_reg <= 8'd0;
		main_ethernetsoc_uart_phy_tx_bitcount <= 4'd0;
		main_ethernetsoc_uart_phy_tx_busy <= 1'd0;
		main_ethernetsoc_uart_phy_source_valid <= 1'd0;
		main_ethernetsoc_uart_phy_source_payload_data <= 8'd0;
		main_ethernetsoc_uart_phy_uart_clk_rxen <= 1'd0;
		main_ethernetsoc_uart_phy_phase_accumulator_rx <= 32'd0;
		main_ethernetsoc_uart_phy_rx_r <= 1'd0;
		main_ethernetsoc_uart_phy_rx_reg <= 8'd0;
		main_ethernetsoc_uart_phy_rx_bitcount <= 4'd0;
		main_ethernetsoc_uart_phy_rx_busy <= 1'd0;
		main_ethernetsoc_uart_tx_pending <= 1'd0;
		main_ethernetsoc_uart_tx_old_trigger <= 1'd0;
		main_ethernetsoc_uart_rx_pending <= 1'd0;
		main_ethernetsoc_uart_rx_old_trigger <= 1'd0;
		main_ethernetsoc_uart_eventmanager_storage_full <= 2'd0;
		main_ethernetsoc_uart_eventmanager_re <= 1'd0;
		main_ethernetsoc_uart_tx_fifo_readable <= 1'd0;
		main_ethernetsoc_uart_tx_fifo_level0 <= 5'd0;
		main_ethernetsoc_uart_tx_fifo_produce <= 4'd0;
		main_ethernetsoc_uart_tx_fifo_consume <= 4'd0;
		main_ethernetsoc_uart_rx_fifo_readable <= 1'd0;
		main_ethernetsoc_uart_rx_fifo_level0 <= 5'd0;
		main_ethernetsoc_uart_rx_fifo_produce <= 4'd0;
		main_ethernetsoc_uart_rx_fifo_consume <= 4'd0;
		main_ethernetsoc_timer0_load_storage_full <= 32'd0;
		main_ethernetsoc_timer0_load_re <= 1'd0;
		main_ethernetsoc_timer0_reload_storage_full <= 32'd0;
		main_ethernetsoc_timer0_reload_re <= 1'd0;
		main_ethernetsoc_timer0_en_storage_full <= 1'd0;
		main_ethernetsoc_timer0_en_re <= 1'd0;
		main_ethernetsoc_timer0_value_status <= 32'd0;
		main_ethernetsoc_timer0_zero_pending <= 1'd0;
		main_ethernetsoc_timer0_zero_old_trigger <= 1'd0;
		main_ethernetsoc_timer0_eventmanager_storage_full <= 1'd0;
		main_ethernetsoc_timer0_eventmanager_re <= 1'd0;
		main_ethernetsoc_timer0_value <= 32'd0;
		main_ethernetsoc_a7ddrphy_half_sys8x_taps_storage_full <= 4'd8;
		main_ethernetsoc_a7ddrphy_half_sys8x_taps_re <= 1'd0;
		main_ethernetsoc_a7ddrphy_dly_sel_storage_full <= 2'd0;
		main_ethernetsoc_a7ddrphy_dly_sel_re <= 1'd0;
		main_ethernetsoc_a7ddrphy_dfi_p0_rddata_valid <= 1'd0;
		main_ethernetsoc_a7ddrphy_dfi_p1_rddata_valid <= 1'd0;
		main_ethernetsoc_a7ddrphy_dfi_p2_rddata_valid <= 1'd0;
		main_ethernetsoc_a7ddrphy_dfi_p3_rddata_valid <= 1'd0;
		main_ethernetsoc_a7ddrphy_oe_dqs <= 1'd0;
		main_ethernetsoc_a7ddrphy_oe_dq <= 1'd0;
		main_ethernetsoc_a7ddrphy_bitslip0_o <= 8'd0;
		main_ethernetsoc_a7ddrphy_bitslip0_value <= 3'd0;
		main_ethernetsoc_a7ddrphy_bitslip0_r <= 16'd0;
		main_ethernetsoc_a7ddrphy_bitslip1_o <= 8'd0;
		main_ethernetsoc_a7ddrphy_bitslip1_value <= 3'd0;
		main_ethernetsoc_a7ddrphy_bitslip1_r <= 16'd0;
		main_ethernetsoc_a7ddrphy_bitslip2_o <= 8'd0;
		main_ethernetsoc_a7ddrphy_bitslip2_value <= 3'd0;
		main_ethernetsoc_a7ddrphy_bitslip2_r <= 16'd0;
		main_ethernetsoc_a7ddrphy_bitslip3_o <= 8'd0;
		main_ethernetsoc_a7ddrphy_bitslip3_value <= 3'd0;
		main_ethernetsoc_a7ddrphy_bitslip3_r <= 16'd0;
		main_ethernetsoc_a7ddrphy_bitslip4_o <= 8'd0;
		main_ethernetsoc_a7ddrphy_bitslip4_value <= 3'd0;
		main_ethernetsoc_a7ddrphy_bitslip4_r <= 16'd0;
		main_ethernetsoc_a7ddrphy_bitslip5_o <= 8'd0;
		main_ethernetsoc_a7ddrphy_bitslip5_value <= 3'd0;
		main_ethernetsoc_a7ddrphy_bitslip5_r <= 16'd0;
		main_ethernetsoc_a7ddrphy_bitslip6_o <= 8'd0;
		main_ethernetsoc_a7ddrphy_bitslip6_value <= 3'd0;
		main_ethernetsoc_a7ddrphy_bitslip6_r <= 16'd0;
		main_ethernetsoc_a7ddrphy_bitslip7_o <= 8'd0;
		main_ethernetsoc_a7ddrphy_bitslip7_value <= 3'd0;
		main_ethernetsoc_a7ddrphy_bitslip7_r <= 16'd0;
		main_ethernetsoc_a7ddrphy_bitslip8_o <= 8'd0;
		main_ethernetsoc_a7ddrphy_bitslip8_value <= 3'd0;
		main_ethernetsoc_a7ddrphy_bitslip8_r <= 16'd0;
		main_ethernetsoc_a7ddrphy_bitslip9_o <= 8'd0;
		main_ethernetsoc_a7ddrphy_bitslip9_value <= 3'd0;
		main_ethernetsoc_a7ddrphy_bitslip9_r <= 16'd0;
		main_ethernetsoc_a7ddrphy_bitslip10_o <= 8'd0;
		main_ethernetsoc_a7ddrphy_bitslip10_value <= 3'd0;
		main_ethernetsoc_a7ddrphy_bitslip10_r <= 16'd0;
		main_ethernetsoc_a7ddrphy_bitslip11_o <= 8'd0;
		main_ethernetsoc_a7ddrphy_bitslip11_value <= 3'd0;
		main_ethernetsoc_a7ddrphy_bitslip11_r <= 16'd0;
		main_ethernetsoc_a7ddrphy_bitslip12_o <= 8'd0;
		main_ethernetsoc_a7ddrphy_bitslip12_value <= 3'd0;
		main_ethernetsoc_a7ddrphy_bitslip12_r <= 16'd0;
		main_ethernetsoc_a7ddrphy_bitslip13_o <= 8'd0;
		main_ethernetsoc_a7ddrphy_bitslip13_value <= 3'd0;
		main_ethernetsoc_a7ddrphy_bitslip13_r <= 16'd0;
		main_ethernetsoc_a7ddrphy_bitslip14_o <= 8'd0;
		main_ethernetsoc_a7ddrphy_bitslip14_value <= 3'd0;
		main_ethernetsoc_a7ddrphy_bitslip14_r <= 16'd0;
		main_ethernetsoc_a7ddrphy_bitslip15_o <= 8'd0;
		main_ethernetsoc_a7ddrphy_bitslip15_value <= 3'd0;
		main_ethernetsoc_a7ddrphy_bitslip15_r <= 16'd0;
		main_ethernetsoc_a7ddrphy_n_rddata_en0 <= 1'd0;
		main_ethernetsoc_a7ddrphy_n_rddata_en1 <= 1'd0;
		main_ethernetsoc_a7ddrphy_n_rddata_en2 <= 1'd0;
		main_ethernetsoc_a7ddrphy_n_rddata_en3 <= 1'd0;
		main_ethernetsoc_a7ddrphy_n_rddata_en4 <= 1'd0;
		main_ethernetsoc_a7ddrphy_n_rddata_en5 <= 1'd0;
		main_ethernetsoc_a7ddrphy_n_rddata_en6 <= 1'd0;
		main_ethernetsoc_a7ddrphy_n_rddata_en7 <= 1'd0;
		main_ethernetsoc_a7ddrphy_last_wrdata_en <= 4'd0;
		main_ethernetsoc_sdram_storage_full <= 4'd0;
		main_ethernetsoc_sdram_re <= 1'd0;
		main_ethernetsoc_sdram_phaseinjector0_command_storage_full <= 6'd0;
		main_ethernetsoc_sdram_phaseinjector0_command_re <= 1'd0;
		main_ethernetsoc_sdram_phaseinjector0_address_storage_full <= 14'd0;
		main_ethernetsoc_sdram_phaseinjector0_address_re <= 1'd0;
		main_ethernetsoc_sdram_phaseinjector0_baddress_storage_full <= 3'd0;
		main_ethernetsoc_sdram_phaseinjector0_baddress_re <= 1'd0;
		main_ethernetsoc_sdram_phaseinjector0_wrdata_storage_full <= 32'd0;
		main_ethernetsoc_sdram_phaseinjector0_wrdata_re <= 1'd0;
		main_ethernetsoc_sdram_phaseinjector0_status <= 32'd0;
		main_ethernetsoc_sdram_phaseinjector1_command_storage_full <= 6'd0;
		main_ethernetsoc_sdram_phaseinjector1_command_re <= 1'd0;
		main_ethernetsoc_sdram_phaseinjector1_address_storage_full <= 14'd0;
		main_ethernetsoc_sdram_phaseinjector1_address_re <= 1'd0;
		main_ethernetsoc_sdram_phaseinjector1_baddress_storage_full <= 3'd0;
		main_ethernetsoc_sdram_phaseinjector1_baddress_re <= 1'd0;
		main_ethernetsoc_sdram_phaseinjector1_wrdata_storage_full <= 32'd0;
		main_ethernetsoc_sdram_phaseinjector1_wrdata_re <= 1'd0;
		main_ethernetsoc_sdram_phaseinjector1_status <= 32'd0;
		main_ethernetsoc_sdram_phaseinjector2_command_storage_full <= 6'd0;
		main_ethernetsoc_sdram_phaseinjector2_command_re <= 1'd0;
		main_ethernetsoc_sdram_phaseinjector2_address_storage_full <= 14'd0;
		main_ethernetsoc_sdram_phaseinjector2_address_re <= 1'd0;
		main_ethernetsoc_sdram_phaseinjector2_baddress_storage_full <= 3'd0;
		main_ethernetsoc_sdram_phaseinjector2_baddress_re <= 1'd0;
		main_ethernetsoc_sdram_phaseinjector2_wrdata_storage_full <= 32'd0;
		main_ethernetsoc_sdram_phaseinjector2_wrdata_re <= 1'd0;
		main_ethernetsoc_sdram_phaseinjector2_status <= 32'd0;
		main_ethernetsoc_sdram_phaseinjector3_command_storage_full <= 6'd0;
		main_ethernetsoc_sdram_phaseinjector3_command_re <= 1'd0;
		main_ethernetsoc_sdram_phaseinjector3_address_storage_full <= 14'd0;
		main_ethernetsoc_sdram_phaseinjector3_address_re <= 1'd0;
		main_ethernetsoc_sdram_phaseinjector3_baddress_storage_full <= 3'd0;
		main_ethernetsoc_sdram_phaseinjector3_baddress_re <= 1'd0;
		main_ethernetsoc_sdram_phaseinjector3_wrdata_storage_full <= 32'd0;
		main_ethernetsoc_sdram_phaseinjector3_wrdata_re <= 1'd0;
		main_ethernetsoc_sdram_phaseinjector3_status <= 32'd0;
		main_ethernetsoc_sdram_dfi_p0_address <= 14'd0;
		main_ethernetsoc_sdram_dfi_p0_bank <= 3'd0;
		main_ethernetsoc_sdram_dfi_p0_cas_n <= 1'd1;
		main_ethernetsoc_sdram_dfi_p0_cs_n <= 1'd1;
		main_ethernetsoc_sdram_dfi_p0_ras_n <= 1'd1;
		main_ethernetsoc_sdram_dfi_p0_we_n <= 1'd1;
		main_ethernetsoc_sdram_dfi_p0_wrdata_en <= 1'd0;
		main_ethernetsoc_sdram_dfi_p0_rddata_en <= 1'd0;
		main_ethernetsoc_sdram_dfi_p1_address <= 14'd0;
		main_ethernetsoc_sdram_dfi_p1_bank <= 3'd0;
		main_ethernetsoc_sdram_dfi_p1_cas_n <= 1'd1;
		main_ethernetsoc_sdram_dfi_p1_cs_n <= 1'd1;
		main_ethernetsoc_sdram_dfi_p1_ras_n <= 1'd1;
		main_ethernetsoc_sdram_dfi_p1_we_n <= 1'd1;
		main_ethernetsoc_sdram_dfi_p1_wrdata_en <= 1'd0;
		main_ethernetsoc_sdram_dfi_p1_rddata_en <= 1'd0;
		main_ethernetsoc_sdram_dfi_p2_address <= 14'd0;
		main_ethernetsoc_sdram_dfi_p2_bank <= 3'd0;
		main_ethernetsoc_sdram_dfi_p2_cas_n <= 1'd1;
		main_ethernetsoc_sdram_dfi_p2_cs_n <= 1'd1;
		main_ethernetsoc_sdram_dfi_p2_ras_n <= 1'd1;
		main_ethernetsoc_sdram_dfi_p2_we_n <= 1'd1;
		main_ethernetsoc_sdram_dfi_p2_wrdata_en <= 1'd0;
		main_ethernetsoc_sdram_dfi_p2_rddata_en <= 1'd0;
		main_ethernetsoc_sdram_dfi_p3_address <= 14'd0;
		main_ethernetsoc_sdram_dfi_p3_bank <= 3'd0;
		main_ethernetsoc_sdram_dfi_p3_cas_n <= 1'd1;
		main_ethernetsoc_sdram_dfi_p3_cs_n <= 1'd1;
		main_ethernetsoc_sdram_dfi_p3_ras_n <= 1'd1;
		main_ethernetsoc_sdram_dfi_p3_we_n <= 1'd1;
		main_ethernetsoc_sdram_dfi_p3_wrdata_en <= 1'd0;
		main_ethernetsoc_sdram_dfi_p3_rddata_en <= 1'd0;
		main_ethernetsoc_sdram_cmd_payload_a <= 14'd0;
		main_ethernetsoc_sdram_cmd_payload_ba <= 3'd0;
		main_ethernetsoc_sdram_cmd_payload_cas <= 1'd0;
		main_ethernetsoc_sdram_cmd_payload_ras <= 1'd0;
		main_ethernetsoc_sdram_cmd_payload_we <= 1'd0;
		main_ethernetsoc_sdram_timer_count <= 10'd782;
		main_ethernetsoc_sdram_generator_done <= 1'd0;
		main_ethernetsoc_sdram_generator_counter <= 6'd0;
		main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_level <= 4'd0;
		main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_produce <= 3'd0;
		main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_consume <= 3'd0;
		main_ethernetsoc_sdram_bankmachine0_cmd_buffer_source_payload_we <= 1'd0;
		main_ethernetsoc_sdram_bankmachine0_cmd_buffer_source_payload_addr <= 21'd0;
		main_ethernetsoc_sdram_bankmachine0_cmd_buffer_valid_n <= 1'd0;
		main_ethernetsoc_sdram_bankmachine0_cmd_buffer_first_n <= 1'd0;
		main_ethernetsoc_sdram_bankmachine0_cmd_buffer_last_n <= 1'd0;
		main_ethernetsoc_sdram_bankmachine0_row <= 14'd0;
		main_ethernetsoc_sdram_bankmachine0_row_opened <= 1'd0;
		main_ethernetsoc_sdram_bankmachine0_twtpcon_ready <= 1'd1;
		main_ethernetsoc_sdram_bankmachine0_twtpcon_count <= 3'd0;
		main_ethernetsoc_sdram_bankmachine0_trccon_ready <= 1'd1;
		main_ethernetsoc_sdram_bankmachine0_trccon_count <= 3'd0;
		main_ethernetsoc_sdram_bankmachine0_trascon_ready <= 1'd1;
		main_ethernetsoc_sdram_bankmachine0_trascon_count <= 3'd0;
		main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_level <= 4'd0;
		main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_produce <= 3'd0;
		main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_consume <= 3'd0;
		main_ethernetsoc_sdram_bankmachine1_cmd_buffer_source_payload_we <= 1'd0;
		main_ethernetsoc_sdram_bankmachine1_cmd_buffer_source_payload_addr <= 21'd0;
		main_ethernetsoc_sdram_bankmachine1_cmd_buffer_valid_n <= 1'd0;
		main_ethernetsoc_sdram_bankmachine1_cmd_buffer_first_n <= 1'd0;
		main_ethernetsoc_sdram_bankmachine1_cmd_buffer_last_n <= 1'd0;
		main_ethernetsoc_sdram_bankmachine1_row <= 14'd0;
		main_ethernetsoc_sdram_bankmachine1_row_opened <= 1'd0;
		main_ethernetsoc_sdram_bankmachine1_twtpcon_ready <= 1'd1;
		main_ethernetsoc_sdram_bankmachine1_twtpcon_count <= 3'd0;
		main_ethernetsoc_sdram_bankmachine1_trccon_ready <= 1'd1;
		main_ethernetsoc_sdram_bankmachine1_trccon_count <= 3'd0;
		main_ethernetsoc_sdram_bankmachine1_trascon_ready <= 1'd1;
		main_ethernetsoc_sdram_bankmachine1_trascon_count <= 3'd0;
		main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_level <= 4'd0;
		main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_produce <= 3'd0;
		main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_consume <= 3'd0;
		main_ethernetsoc_sdram_bankmachine2_cmd_buffer_source_payload_we <= 1'd0;
		main_ethernetsoc_sdram_bankmachine2_cmd_buffer_source_payload_addr <= 21'd0;
		main_ethernetsoc_sdram_bankmachine2_cmd_buffer_valid_n <= 1'd0;
		main_ethernetsoc_sdram_bankmachine2_cmd_buffer_first_n <= 1'd0;
		main_ethernetsoc_sdram_bankmachine2_cmd_buffer_last_n <= 1'd0;
		main_ethernetsoc_sdram_bankmachine2_row <= 14'd0;
		main_ethernetsoc_sdram_bankmachine2_row_opened <= 1'd0;
		main_ethernetsoc_sdram_bankmachine2_twtpcon_ready <= 1'd1;
		main_ethernetsoc_sdram_bankmachine2_twtpcon_count <= 3'd0;
		main_ethernetsoc_sdram_bankmachine2_trccon_ready <= 1'd1;
		main_ethernetsoc_sdram_bankmachine2_trccon_count <= 3'd0;
		main_ethernetsoc_sdram_bankmachine2_trascon_ready <= 1'd1;
		main_ethernetsoc_sdram_bankmachine2_trascon_count <= 3'd0;
		main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_level <= 4'd0;
		main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_produce <= 3'd0;
		main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_consume <= 3'd0;
		main_ethernetsoc_sdram_bankmachine3_cmd_buffer_source_payload_we <= 1'd0;
		main_ethernetsoc_sdram_bankmachine3_cmd_buffer_source_payload_addr <= 21'd0;
		main_ethernetsoc_sdram_bankmachine3_cmd_buffer_valid_n <= 1'd0;
		main_ethernetsoc_sdram_bankmachine3_cmd_buffer_first_n <= 1'd0;
		main_ethernetsoc_sdram_bankmachine3_cmd_buffer_last_n <= 1'd0;
		main_ethernetsoc_sdram_bankmachine3_row <= 14'd0;
		main_ethernetsoc_sdram_bankmachine3_row_opened <= 1'd0;
		main_ethernetsoc_sdram_bankmachine3_twtpcon_ready <= 1'd1;
		main_ethernetsoc_sdram_bankmachine3_twtpcon_count <= 3'd0;
		main_ethernetsoc_sdram_bankmachine3_trccon_ready <= 1'd1;
		main_ethernetsoc_sdram_bankmachine3_trccon_count <= 3'd0;
		main_ethernetsoc_sdram_bankmachine3_trascon_ready <= 1'd1;
		main_ethernetsoc_sdram_bankmachine3_trascon_count <= 3'd0;
		main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_level <= 4'd0;
		main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_produce <= 3'd0;
		main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_consume <= 3'd0;
		main_ethernetsoc_sdram_bankmachine4_cmd_buffer_source_payload_we <= 1'd0;
		main_ethernetsoc_sdram_bankmachine4_cmd_buffer_source_payload_addr <= 21'd0;
		main_ethernetsoc_sdram_bankmachine4_cmd_buffer_valid_n <= 1'd0;
		main_ethernetsoc_sdram_bankmachine4_cmd_buffer_first_n <= 1'd0;
		main_ethernetsoc_sdram_bankmachine4_cmd_buffer_last_n <= 1'd0;
		main_ethernetsoc_sdram_bankmachine4_row <= 14'd0;
		main_ethernetsoc_sdram_bankmachine4_row_opened <= 1'd0;
		main_ethernetsoc_sdram_bankmachine4_twtpcon_ready <= 1'd1;
		main_ethernetsoc_sdram_bankmachine4_twtpcon_count <= 3'd0;
		main_ethernetsoc_sdram_bankmachine4_trccon_ready <= 1'd1;
		main_ethernetsoc_sdram_bankmachine4_trccon_count <= 3'd0;
		main_ethernetsoc_sdram_bankmachine4_trascon_ready <= 1'd1;
		main_ethernetsoc_sdram_bankmachine4_trascon_count <= 3'd0;
		main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_level <= 4'd0;
		main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_produce <= 3'd0;
		main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_consume <= 3'd0;
		main_ethernetsoc_sdram_bankmachine5_cmd_buffer_source_payload_we <= 1'd0;
		main_ethernetsoc_sdram_bankmachine5_cmd_buffer_source_payload_addr <= 21'd0;
		main_ethernetsoc_sdram_bankmachine5_cmd_buffer_valid_n <= 1'd0;
		main_ethernetsoc_sdram_bankmachine5_cmd_buffer_first_n <= 1'd0;
		main_ethernetsoc_sdram_bankmachine5_cmd_buffer_last_n <= 1'd0;
		main_ethernetsoc_sdram_bankmachine5_row <= 14'd0;
		main_ethernetsoc_sdram_bankmachine5_row_opened <= 1'd0;
		main_ethernetsoc_sdram_bankmachine5_twtpcon_ready <= 1'd1;
		main_ethernetsoc_sdram_bankmachine5_twtpcon_count <= 3'd0;
		main_ethernetsoc_sdram_bankmachine5_trccon_ready <= 1'd1;
		main_ethernetsoc_sdram_bankmachine5_trccon_count <= 3'd0;
		main_ethernetsoc_sdram_bankmachine5_trascon_ready <= 1'd1;
		main_ethernetsoc_sdram_bankmachine5_trascon_count <= 3'd0;
		main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_level <= 4'd0;
		main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_produce <= 3'd0;
		main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_consume <= 3'd0;
		main_ethernetsoc_sdram_bankmachine6_cmd_buffer_source_payload_we <= 1'd0;
		main_ethernetsoc_sdram_bankmachine6_cmd_buffer_source_payload_addr <= 21'd0;
		main_ethernetsoc_sdram_bankmachine6_cmd_buffer_valid_n <= 1'd0;
		main_ethernetsoc_sdram_bankmachine6_cmd_buffer_first_n <= 1'd0;
		main_ethernetsoc_sdram_bankmachine6_cmd_buffer_last_n <= 1'd0;
		main_ethernetsoc_sdram_bankmachine6_row <= 14'd0;
		main_ethernetsoc_sdram_bankmachine6_row_opened <= 1'd0;
		main_ethernetsoc_sdram_bankmachine6_twtpcon_ready <= 1'd1;
		main_ethernetsoc_sdram_bankmachine6_twtpcon_count <= 3'd0;
		main_ethernetsoc_sdram_bankmachine6_trccon_ready <= 1'd1;
		main_ethernetsoc_sdram_bankmachine6_trccon_count <= 3'd0;
		main_ethernetsoc_sdram_bankmachine6_trascon_ready <= 1'd1;
		main_ethernetsoc_sdram_bankmachine6_trascon_count <= 3'd0;
		main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_level <= 4'd0;
		main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_produce <= 3'd0;
		main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_consume <= 3'd0;
		main_ethernetsoc_sdram_bankmachine7_cmd_buffer_source_payload_we <= 1'd0;
		main_ethernetsoc_sdram_bankmachine7_cmd_buffer_source_payload_addr <= 21'd0;
		main_ethernetsoc_sdram_bankmachine7_cmd_buffer_valid_n <= 1'd0;
		main_ethernetsoc_sdram_bankmachine7_cmd_buffer_first_n <= 1'd0;
		main_ethernetsoc_sdram_bankmachine7_cmd_buffer_last_n <= 1'd0;
		main_ethernetsoc_sdram_bankmachine7_row <= 14'd0;
		main_ethernetsoc_sdram_bankmachine7_row_opened <= 1'd0;
		main_ethernetsoc_sdram_bankmachine7_twtpcon_ready <= 1'd1;
		main_ethernetsoc_sdram_bankmachine7_twtpcon_count <= 3'd0;
		main_ethernetsoc_sdram_bankmachine7_trccon_ready <= 1'd1;
		main_ethernetsoc_sdram_bankmachine7_trccon_count <= 3'd0;
		main_ethernetsoc_sdram_bankmachine7_trascon_ready <= 1'd1;
		main_ethernetsoc_sdram_bankmachine7_trascon_count <= 3'd0;
		main_ethernetsoc_sdram_choose_cmd_grant <= 3'd0;
		main_ethernetsoc_sdram_choose_req_grant <= 3'd0;
		main_ethernetsoc_sdram_trrdcon_ready <= 1'd1;
		main_ethernetsoc_sdram_trrdcon_count <= 1'd0;
		main_ethernetsoc_sdram_tfawcon_ready <= 1'd1;
		main_ethernetsoc_sdram_tfawcon_window <= 5'd0;
		main_ethernetsoc_sdram_tccdcon_ready <= 1'd1;
		main_ethernetsoc_sdram_tccdcon_count <= 1'd0;
		main_ethernetsoc_sdram_twtrcon_ready <= 1'd1;
		main_ethernetsoc_sdram_twtrcon_count <= 3'd0;
		main_ethernetsoc_sdram_time0 <= 5'd0;
		main_ethernetsoc_sdram_time1 <= 4'd0;
		main_ethernetsoc_adr_offset_r <= 2'd0;
		main_ethphy_reset_storage_full <= 1'd0;
		main_ethphy_reset_re <= 1'd0;
		main_ethphy_counter <= 9'd0;
		main_ethphy_storage_full <= 3'd0;
		main_ethphy_re <= 1'd0;
		main_preamble_errors_status <= 32'd0;
		main_crc_errors_status <= 32'd0;
		main_tx_cdc_graycounter0_q <= 7'd0;
		main_tx_cdc_graycounter0_q_binary <= 7'd0;
		main_rx_cdc_graycounter1_q <= 7'd0;
		main_rx_cdc_graycounter1_q_binary <= 7'd0;
		main_writer_errors_status <= 32'd0;
		main_writer_storage_full <= 1'd0;
		main_writer_re <= 1'd0;
		main_writer_counter <= 32'd0;
		main_writer_slot <= 1'd0;
		main_writer_fifo_level <= 2'd0;
		main_writer_fifo_produce <= 1'd0;
		main_writer_fifo_consume <= 1'd0;
		main_reader_slot_storage_full <= 1'd0;
		main_reader_slot_re <= 1'd0;
		main_reader_length_storage_full <= 11'd0;
		main_reader_length_re <= 1'd0;
		main_reader_done_pending <= 1'd0;
		main_reader_eventmanager_storage_full <= 1'd0;
		main_reader_eventmanager_re <= 1'd0;
		main_reader_fifo_level <= 2'd0;
		main_reader_fifo_produce <= 1'd0;
		main_reader_fifo_consume <= 1'd0;
		main_reader_counter <= 11'd0;
		main_reader_last_d <= 1'd0;
		main_sram0_bus_ack0 <= 1'd0;
		main_sram1_bus_ack0 <= 1'd0;
		main_sram0_bus_ack1 <= 1'd0;
		main_sram1_bus_ack1 <= 1'd0;
		main_slave_sel_r <= 4'd0;
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
		builder_rbank <= 3'd0;
		builder_wbank <= 3'd0;
		builder_new_master_wdata_ready0 <= 1'd0;
		builder_new_master_wdata_ready1 <= 1'd0;
		builder_new_master_wdata_ready2 <= 1'd0;
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
		builder_fullmemorywe_state <= 3'd0;
		builder_litedramwishbone2native_state <= 2'd0;
		builder_liteethmacsramwriter_state <= 3'd0;
		builder_liteethmacsramreader_state <= 2'd0;
		builder_ethernetsoc_grant <= 1'd0;
		builder_ethernetsoc_slave_sel_r <= 5'd0;
		builder_ethernetsoc_count <= 20'd1000000;
		builder_ethernetsoc_interface0_bank_bus_dat_r <= 8'd0;
		builder_ethernetsoc_interface1_bank_bus_dat_r <= 8'd0;
		builder_ethernetsoc_interface2_bank_bus_dat_r <= 8'd0;
		builder_ethernetsoc_interface3_bank_bus_dat_r <= 8'd0;
		builder_ethernetsoc_interface4_bank_bus_dat_r <= 8'd0;
		builder_ethernetsoc_interface5_bank_bus_dat_r <= 8'd0;
		builder_ethernetsoc_interface6_bank_bus_dat_r <= 8'd0;
		builder_ethernetsoc_interface7_bank_bus_dat_r <= 8'd0;
		builder_ethernetsoc_interface8_bank_bus_dat_r <= 8'd0;
	end
	builder_xilinxmultiregimpl0_regs0 <= serial_rx;
	builder_xilinxmultiregimpl0_regs1 <= builder_xilinxmultiregimpl0_regs0;
	builder_xilinxmultiregimpl1_regs0 <= main_ethphy_data_r;
	builder_xilinxmultiregimpl1_regs1 <= builder_xilinxmultiregimpl1_regs0;
	builder_xilinxmultiregimpl2_regs0 <= main_ps_preamble_error_toggle_i;
	builder_xilinxmultiregimpl2_regs1 <= builder_xilinxmultiregimpl2_regs0;
	builder_xilinxmultiregimpl3_regs0 <= main_ps_crc_error_toggle_i;
	builder_xilinxmultiregimpl3_regs1 <= builder_xilinxmultiregimpl3_regs0;
	builder_xilinxmultiregimpl5_regs0 <= main_tx_cdc_graycounter1_q;
	builder_xilinxmultiregimpl5_regs1 <= builder_xilinxmultiregimpl5_regs0;
	builder_xilinxmultiregimpl6_regs0 <= main_rx_cdc_graycounter0_q;
	builder_xilinxmultiregimpl6_regs1 <= builder_xilinxmultiregimpl6_regs0;
end
reg [31:0] mem[0:8191];
reg [12:0] memadr;
always @(posedge sys_clk) begin
	memadr <= main_ethernetsoc_rom_adr;
end
assign main_ethernetsoc_rom_dat_r = mem[memadr];
initial begin
	$readmemh("mem.init", mem);
end
reg [31:0] mem_1[0:8191];
reg [12:0] memadr_1;
always @(posedge sys_clk) begin
	if (main_ethernetsoc_sram_we[0])
		mem_1[main_ethernetsoc_sram_adr][7:0] <= main_ethernetsoc_sram_dat_w[7:0];
	if (main_ethernetsoc_sram_we[1])
		mem_1[main_ethernetsoc_sram_adr][15:8] <= main_ethernetsoc_sram_dat_w[15:8];
	if (main_ethernetsoc_sram_we[2])
		mem_1[main_ethernetsoc_sram_adr][23:16] <= main_ethernetsoc_sram_dat_w[23:16];
	if (main_ethernetsoc_sram_we[3])
		mem_1[main_ethernetsoc_sram_adr][31:24] <= main_ethernetsoc_sram_dat_w[31:24];
	memadr_1 <= main_ethernetsoc_sram_adr;
end
assign main_ethernetsoc_sram_dat_r = mem_1[memadr_1];
initial begin
	$readmemh("mem_1.init", mem_1);
end
reg [9:0] storage[0:15];
reg [9:0] memdat;
reg [9:0] memdat_1;
always @(posedge sys_clk) begin
	if (main_ethernetsoc_uart_tx_fifo_wrport_we)
		storage[main_ethernetsoc_uart_tx_fifo_wrport_adr] <= main_ethernetsoc_uart_tx_fifo_wrport_dat_w;
	memdat <= storage[main_ethernetsoc_uart_tx_fifo_wrport_adr];
end
always @(posedge sys_clk) begin
	if (main_ethernetsoc_uart_tx_fifo_rdport_re)
		memdat_1 <= storage[main_ethernetsoc_uart_tx_fifo_rdport_adr];
end
assign main_ethernetsoc_uart_tx_fifo_wrport_dat_r = memdat;
assign main_ethernetsoc_uart_tx_fifo_rdport_dat_r = memdat_1;
reg [9:0] storage_1[0:15];
reg [9:0] memdat_2;
reg [9:0] memdat_3;
always @(posedge sys_clk) begin
	if (main_ethernetsoc_uart_rx_fifo_wrport_we)
		storage_1[main_ethernetsoc_uart_rx_fifo_wrport_adr] <= main_ethernetsoc_uart_rx_fifo_wrport_dat_w;
	memdat_2 <= storage_1[main_ethernetsoc_uart_rx_fifo_wrport_adr];
end
always @(posedge sys_clk) begin
	if (main_ethernetsoc_uart_rx_fifo_rdport_re)
		memdat_3 <= storage_1[main_ethernetsoc_uart_rx_fifo_rdport_adr];
end
assign main_ethernetsoc_uart_rx_fifo_wrport_dat_r = memdat_2;
assign main_ethernetsoc_uart_rx_fifo_rdport_dat_r = memdat_3;
BUFG BUFG(
	.I(main_ethernetsoc_clkout0),
	.O(main_ethernetsoc_clkout_buf0)
);
BUFG BUFG_1(
	.I(main_ethernetsoc_clkout1),
	.O(main_ethernetsoc_clkout_buf1)
);
BUFG BUFG_2(
	.I(main_ethernetsoc_clkout2),
	.O(main_ethernetsoc_clkout_buf2)
);
BUFG BUFG_3(
	.I(main_ethernetsoc_clkout3),
	.O(main_ethernetsoc_clkout_buf3)
);
BUFG BUFG_4(
	.I(main_ethernetsoc_clkout4),
	.O(main_ethernetsoc_clkout_buf4)
);
IDELAYCTRL IDELAYCTRL(
	.REFCLK(clk200_clk),
	.RST(main_ethernetsoc_ic_reset)
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
	.OQ(main_ethernetsoc_a7ddrphy_sd_clk_se_nodelay)
);
OBUFDS OBUFDS(
	.I(main_ethernetsoc_a7ddrphy_sd_clk_se_nodelay),
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_address[0]),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_address[0]),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_address[0]),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_address[0]),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_address[0]),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_address[0]),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_address[0]),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_address[0]),
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_address[1]),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_address[1]),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_address[1]),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_address[1]),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_address[1]),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_address[1]),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_address[1]),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_address[1]),
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_address[2]),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_address[2]),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_address[2]),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_address[2]),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_address[2]),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_address[2]),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_address[2]),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_address[2]),
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_address[3]),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_address[3]),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_address[3]),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_address[3]),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_address[3]),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_address[3]),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_address[3]),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_address[3]),
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_address[4]),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_address[4]),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_address[4]),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_address[4]),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_address[4]),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_address[4]),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_address[4]),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_address[4]),
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_address[5]),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_address[5]),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_address[5]),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_address[5]),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_address[5]),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_address[5]),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_address[5]),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_address[5]),
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_address[6]),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_address[6]),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_address[6]),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_address[6]),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_address[6]),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_address[6]),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_address[6]),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_address[6]),
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_address[7]),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_address[7]),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_address[7]),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_address[7]),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_address[7]),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_address[7]),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_address[7]),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_address[7]),
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_address[8]),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_address[8]),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_address[8]),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_address[8]),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_address[8]),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_address[8]),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_address[8]),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_address[8]),
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_address[9]),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_address[9]),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_address[9]),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_address[9]),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_address[9]),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_address[9]),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_address[9]),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_address[9]),
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_address[10]),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_address[10]),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_address[10]),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_address[10]),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_address[10]),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_address[10]),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_address[10]),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_address[10]),
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_address[11]),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_address[11]),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_address[11]),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_address[11]),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_address[11]),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_address[11]),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_address[11]),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_address[11]),
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_address[12]),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_address[12]),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_address[12]),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_address[12]),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_address[12]),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_address[12]),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_address[12]),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_address[12]),
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_address[13]),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_address[13]),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_address[13]),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_address[13]),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_address[13]),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_address[13]),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_address[13]),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_address[13]),
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_bank[0]),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_bank[0]),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_bank[0]),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_bank[0]),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_bank[0]),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_bank[0]),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_bank[0]),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_bank[0]),
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_bank[1]),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_bank[1]),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_bank[1]),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_bank[1]),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_bank[1]),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_bank[1]),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_bank[1]),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_bank[1]),
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_bank[2]),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_bank[2]),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_bank[2]),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_bank[2]),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_bank[2]),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_bank[2]),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_bank[2]),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_bank[2]),
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_ras_n),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_ras_n),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_ras_n),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_ras_n),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_ras_n),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_ras_n),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_ras_n),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_ras_n),
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_cas_n),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_cas_n),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_cas_n),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_cas_n),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_cas_n),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_cas_n),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_cas_n),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_cas_n),
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_we_n),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_we_n),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_we_n),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_we_n),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_we_n),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_we_n),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_we_n),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_we_n),
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_cke),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_cke),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_cke),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_cke),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_cke),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_cke),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_cke),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_cke),
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_odt),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_odt),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_odt),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_odt),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_odt),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_odt),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_odt),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_odt),
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_reset_n),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_reset_n),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_reset_n),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_reset_n),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_reset_n),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_reset_n),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_reset_n),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_reset_n),
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_cs_n),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_cs_n),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_cs_n),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_cs_n),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_cs_n),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_cs_n),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_cs_n),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_cs_n),
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_wrdata_mask[0]),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_wrdata_mask[2]),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_wrdata_mask[0]),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_wrdata_mask[2]),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_wrdata_mask[0]),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_wrdata_mask[2]),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_wrdata_mask[0]),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_wrdata_mask[2]),
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
	.CLK(sys4x_dqs_clk),
	.CLKDIV(sys_clk),
	.D1(main_ethernetsoc_a7ddrphy_dqs_serdes_pattern[0]),
	.D2(main_ethernetsoc_a7ddrphy_dqs_serdes_pattern[1]),
	.D3(main_ethernetsoc_a7ddrphy_dqs_serdes_pattern[2]),
	.D4(main_ethernetsoc_a7ddrphy_dqs_serdes_pattern[3]),
	.D5(main_ethernetsoc_a7ddrphy_dqs_serdes_pattern[4]),
	.D6(main_ethernetsoc_a7ddrphy_dqs_serdes_pattern[5]),
	.D7(main_ethernetsoc_a7ddrphy_dqs_serdes_pattern[6]),
	.D8(main_ethernetsoc_a7ddrphy_dqs_serdes_pattern[7]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~main_ethernetsoc_a7ddrphy_oe_dqs)),
	.TCE(1'd1),
	.OFB(main_ethernetsoc_a7ddrphy0),
	.OQ(main_ethernetsoc_a7ddrphy_dqs_nodelay0),
	.TQ(main_ethernetsoc_a7ddrphy_dqs_t0)
);
OBUFTDS OBUFTDS(
	.I(main_ethernetsoc_a7ddrphy_dqs_nodelay0),
	.T(main_ethernetsoc_a7ddrphy_dqs_t0),
	.O(ddram_dqs_p[0]),
	.OB(ddram_dqs_n[0])
);
OSERDESE2 #(
	.DATA_RATE_OQ("DDR"),
	.DATA_RATE_TQ("BUF"),
	.DATA_WIDTH(4'd8),
	.SERDES_MODE("MASTER"),
	.TRISTATE_WIDTH(1'd1)
) OSERDESE2_27 (
	.CLK(sys4x_clk),
	.CLKDIV(sys_clk),
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_wrdata_mask[1]),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_wrdata_mask[3]),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_wrdata_mask[1]),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_wrdata_mask[3]),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_wrdata_mask[1]),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_wrdata_mask[3]),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_wrdata_mask[1]),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_wrdata_mask[3]),
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
) OSERDESE2_28 (
	.CLK(sys4x_dqs_clk),
	.CLKDIV(sys_clk),
	.D1(main_ethernetsoc_a7ddrphy_dqs_serdes_pattern[0]),
	.D2(main_ethernetsoc_a7ddrphy_dqs_serdes_pattern[1]),
	.D3(main_ethernetsoc_a7ddrphy_dqs_serdes_pattern[2]),
	.D4(main_ethernetsoc_a7ddrphy_dqs_serdes_pattern[3]),
	.D5(main_ethernetsoc_a7ddrphy_dqs_serdes_pattern[4]),
	.D6(main_ethernetsoc_a7ddrphy_dqs_serdes_pattern[5]),
	.D7(main_ethernetsoc_a7ddrphy_dqs_serdes_pattern[6]),
	.D8(main_ethernetsoc_a7ddrphy_dqs_serdes_pattern[7]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~main_ethernetsoc_a7ddrphy_oe_dqs)),
	.TCE(1'd1),
	.OFB(main_ethernetsoc_a7ddrphy1),
	.OQ(main_ethernetsoc_a7ddrphy_dqs_nodelay1),
	.TQ(main_ethernetsoc_a7ddrphy_dqs_t1)
);
OBUFTDS OBUFTDS_1(
	.I(main_ethernetsoc_a7ddrphy_dqs_nodelay1),
	.T(main_ethernetsoc_a7ddrphy_dqs_t1),
	.O(ddram_dqs_p[1]),
	.OB(ddram_dqs_n[1])
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_wrdata[0]),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_wrdata[16]),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_wrdata[0]),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_wrdata[16]),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_wrdata[0]),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_wrdata[16]),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_wrdata[0]),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_wrdata[16]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~main_ethernetsoc_a7ddrphy_oe_dq)),
	.TCE(1'd1),
	.OQ(main_ethernetsoc_a7ddrphy_dq_o_nodelay0),
	.TQ(main_ethernetsoc_a7ddrphy_dq_t0)
);
ISERDESE2 #(
	.DATA_RATE("DDR"),
	.DATA_WIDTH(4'd8),
	.INTERFACE_TYPE("NETWORKING"),
	.IOBDELAY("IFD"),
	.NUM_CE(1'd1),
	.SERDES_MODE("MASTER")
) ISERDESE2 (
	.BITSLIP(1'd0),
	.CE1(1'd1),
	.CLK(sys4x_clk),
	.CLKB((~sys4x_clk)),
	.CLKDIV(sys_clk),
	.DDLY(main_ethernetsoc_a7ddrphy_dq_i_delayed0),
	.RST(sys_rst),
	.Q1(main_ethernetsoc_a7ddrphy_dq_i_data0[7]),
	.Q2(main_ethernetsoc_a7ddrphy_dq_i_data0[6]),
	.Q3(main_ethernetsoc_a7ddrphy_dq_i_data0[5]),
	.Q4(main_ethernetsoc_a7ddrphy_dq_i_data0[4]),
	.Q5(main_ethernetsoc_a7ddrphy_dq_i_data0[3]),
	.Q6(main_ethernetsoc_a7ddrphy_dq_i_data0[2]),
	.Q7(main_ethernetsoc_a7ddrphy_dq_i_data0[1]),
	.Q8(main_ethernetsoc_a7ddrphy_dq_i_data0[0])
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
) IDELAYE2 (
	.C(sys_clk),
	.CE((main_ethernetsoc_a7ddrphy_dly_sel_storage[0] & main_ethernetsoc_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(main_ethernetsoc_a7ddrphy_dq_i_nodelay0),
	.INC(1'd1),
	.LD((main_ethernetsoc_a7ddrphy_dly_sel_storage[0] & main_ethernetsoc_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(main_ethernetsoc_a7ddrphy_dq_i_delayed0)
);
IOBUF IOBUF(
	.I(main_ethernetsoc_a7ddrphy_dq_o_nodelay0),
	.T(main_ethernetsoc_a7ddrphy_dq_t0),
	.IO(ddram_dq[0]),
	.O(main_ethernetsoc_a7ddrphy_dq_i_nodelay0)
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_wrdata[1]),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_wrdata[17]),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_wrdata[1]),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_wrdata[17]),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_wrdata[1]),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_wrdata[17]),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_wrdata[1]),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_wrdata[17]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~main_ethernetsoc_a7ddrphy_oe_dq)),
	.TCE(1'd1),
	.OQ(main_ethernetsoc_a7ddrphy_dq_o_nodelay1),
	.TQ(main_ethernetsoc_a7ddrphy_dq_t1)
);
ISERDESE2 #(
	.DATA_RATE("DDR"),
	.DATA_WIDTH(4'd8),
	.INTERFACE_TYPE("NETWORKING"),
	.IOBDELAY("IFD"),
	.NUM_CE(1'd1),
	.SERDES_MODE("MASTER")
) ISERDESE2_1 (
	.BITSLIP(1'd0),
	.CE1(1'd1),
	.CLK(sys4x_clk),
	.CLKB((~sys4x_clk)),
	.CLKDIV(sys_clk),
	.DDLY(main_ethernetsoc_a7ddrphy_dq_i_delayed1),
	.RST(sys_rst),
	.Q1(main_ethernetsoc_a7ddrphy_dq_i_data1[7]),
	.Q2(main_ethernetsoc_a7ddrphy_dq_i_data1[6]),
	.Q3(main_ethernetsoc_a7ddrphy_dq_i_data1[5]),
	.Q4(main_ethernetsoc_a7ddrphy_dq_i_data1[4]),
	.Q5(main_ethernetsoc_a7ddrphy_dq_i_data1[3]),
	.Q6(main_ethernetsoc_a7ddrphy_dq_i_data1[2]),
	.Q7(main_ethernetsoc_a7ddrphy_dq_i_data1[1]),
	.Q8(main_ethernetsoc_a7ddrphy_dq_i_data1[0])
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
) IDELAYE2_1 (
	.C(sys_clk),
	.CE((main_ethernetsoc_a7ddrphy_dly_sel_storage[0] & main_ethernetsoc_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(main_ethernetsoc_a7ddrphy_dq_i_nodelay1),
	.INC(1'd1),
	.LD((main_ethernetsoc_a7ddrphy_dly_sel_storage[0] & main_ethernetsoc_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(main_ethernetsoc_a7ddrphy_dq_i_delayed1)
);
IOBUF IOBUF_1(
	.I(main_ethernetsoc_a7ddrphy_dq_o_nodelay1),
	.T(main_ethernetsoc_a7ddrphy_dq_t1),
	.IO(ddram_dq[1]),
	.O(main_ethernetsoc_a7ddrphy_dq_i_nodelay1)
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_wrdata[2]),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_wrdata[18]),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_wrdata[2]),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_wrdata[18]),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_wrdata[2]),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_wrdata[18]),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_wrdata[2]),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_wrdata[18]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~main_ethernetsoc_a7ddrphy_oe_dq)),
	.TCE(1'd1),
	.OQ(main_ethernetsoc_a7ddrphy_dq_o_nodelay2),
	.TQ(main_ethernetsoc_a7ddrphy_dq_t2)
);
ISERDESE2 #(
	.DATA_RATE("DDR"),
	.DATA_WIDTH(4'd8),
	.INTERFACE_TYPE("NETWORKING"),
	.IOBDELAY("IFD"),
	.NUM_CE(1'd1),
	.SERDES_MODE("MASTER")
) ISERDESE2_2 (
	.BITSLIP(1'd0),
	.CE1(1'd1),
	.CLK(sys4x_clk),
	.CLKB((~sys4x_clk)),
	.CLKDIV(sys_clk),
	.DDLY(main_ethernetsoc_a7ddrphy_dq_i_delayed2),
	.RST(sys_rst),
	.Q1(main_ethernetsoc_a7ddrphy_dq_i_data2[7]),
	.Q2(main_ethernetsoc_a7ddrphy_dq_i_data2[6]),
	.Q3(main_ethernetsoc_a7ddrphy_dq_i_data2[5]),
	.Q4(main_ethernetsoc_a7ddrphy_dq_i_data2[4]),
	.Q5(main_ethernetsoc_a7ddrphy_dq_i_data2[3]),
	.Q6(main_ethernetsoc_a7ddrphy_dq_i_data2[2]),
	.Q7(main_ethernetsoc_a7ddrphy_dq_i_data2[1]),
	.Q8(main_ethernetsoc_a7ddrphy_dq_i_data2[0])
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
	.CE((main_ethernetsoc_a7ddrphy_dly_sel_storage[0] & main_ethernetsoc_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(main_ethernetsoc_a7ddrphy_dq_i_nodelay2),
	.INC(1'd1),
	.LD((main_ethernetsoc_a7ddrphy_dly_sel_storage[0] & main_ethernetsoc_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(main_ethernetsoc_a7ddrphy_dq_i_delayed2)
);
IOBUF IOBUF_2(
	.I(main_ethernetsoc_a7ddrphy_dq_o_nodelay2),
	.T(main_ethernetsoc_a7ddrphy_dq_t2),
	.IO(ddram_dq[2]),
	.O(main_ethernetsoc_a7ddrphy_dq_i_nodelay2)
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_wrdata[3]),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_wrdata[19]),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_wrdata[3]),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_wrdata[19]),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_wrdata[3]),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_wrdata[19]),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_wrdata[3]),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_wrdata[19]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~main_ethernetsoc_a7ddrphy_oe_dq)),
	.TCE(1'd1),
	.OQ(main_ethernetsoc_a7ddrphy_dq_o_nodelay3),
	.TQ(main_ethernetsoc_a7ddrphy_dq_t3)
);
ISERDESE2 #(
	.DATA_RATE("DDR"),
	.DATA_WIDTH(4'd8),
	.INTERFACE_TYPE("NETWORKING"),
	.IOBDELAY("IFD"),
	.NUM_CE(1'd1),
	.SERDES_MODE("MASTER")
) ISERDESE2_3 (
	.BITSLIP(1'd0),
	.CE1(1'd1),
	.CLK(sys4x_clk),
	.CLKB((~sys4x_clk)),
	.CLKDIV(sys_clk),
	.DDLY(main_ethernetsoc_a7ddrphy_dq_i_delayed3),
	.RST(sys_rst),
	.Q1(main_ethernetsoc_a7ddrphy_dq_i_data3[7]),
	.Q2(main_ethernetsoc_a7ddrphy_dq_i_data3[6]),
	.Q3(main_ethernetsoc_a7ddrphy_dq_i_data3[5]),
	.Q4(main_ethernetsoc_a7ddrphy_dq_i_data3[4]),
	.Q5(main_ethernetsoc_a7ddrphy_dq_i_data3[3]),
	.Q6(main_ethernetsoc_a7ddrphy_dq_i_data3[2]),
	.Q7(main_ethernetsoc_a7ddrphy_dq_i_data3[1]),
	.Q8(main_ethernetsoc_a7ddrphy_dq_i_data3[0])
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
	.CE((main_ethernetsoc_a7ddrphy_dly_sel_storage[0] & main_ethernetsoc_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(main_ethernetsoc_a7ddrphy_dq_i_nodelay3),
	.INC(1'd1),
	.LD((main_ethernetsoc_a7ddrphy_dly_sel_storage[0] & main_ethernetsoc_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(main_ethernetsoc_a7ddrphy_dq_i_delayed3)
);
IOBUF IOBUF_3(
	.I(main_ethernetsoc_a7ddrphy_dq_o_nodelay3),
	.T(main_ethernetsoc_a7ddrphy_dq_t3),
	.IO(ddram_dq[3]),
	.O(main_ethernetsoc_a7ddrphy_dq_i_nodelay3)
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_wrdata[4]),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_wrdata[20]),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_wrdata[4]),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_wrdata[20]),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_wrdata[4]),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_wrdata[20]),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_wrdata[4]),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_wrdata[20]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~main_ethernetsoc_a7ddrphy_oe_dq)),
	.TCE(1'd1),
	.OQ(main_ethernetsoc_a7ddrphy_dq_o_nodelay4),
	.TQ(main_ethernetsoc_a7ddrphy_dq_t4)
);
ISERDESE2 #(
	.DATA_RATE("DDR"),
	.DATA_WIDTH(4'd8),
	.INTERFACE_TYPE("NETWORKING"),
	.IOBDELAY("IFD"),
	.NUM_CE(1'd1),
	.SERDES_MODE("MASTER")
) ISERDESE2_4 (
	.BITSLIP(1'd0),
	.CE1(1'd1),
	.CLK(sys4x_clk),
	.CLKB((~sys4x_clk)),
	.CLKDIV(sys_clk),
	.DDLY(main_ethernetsoc_a7ddrphy_dq_i_delayed4),
	.RST(sys_rst),
	.Q1(main_ethernetsoc_a7ddrphy_dq_i_data4[7]),
	.Q2(main_ethernetsoc_a7ddrphy_dq_i_data4[6]),
	.Q3(main_ethernetsoc_a7ddrphy_dq_i_data4[5]),
	.Q4(main_ethernetsoc_a7ddrphy_dq_i_data4[4]),
	.Q5(main_ethernetsoc_a7ddrphy_dq_i_data4[3]),
	.Q6(main_ethernetsoc_a7ddrphy_dq_i_data4[2]),
	.Q7(main_ethernetsoc_a7ddrphy_dq_i_data4[1]),
	.Q8(main_ethernetsoc_a7ddrphy_dq_i_data4[0])
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
	.CE((main_ethernetsoc_a7ddrphy_dly_sel_storage[0] & main_ethernetsoc_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(main_ethernetsoc_a7ddrphy_dq_i_nodelay4),
	.INC(1'd1),
	.LD((main_ethernetsoc_a7ddrphy_dly_sel_storage[0] & main_ethernetsoc_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(main_ethernetsoc_a7ddrphy_dq_i_delayed4)
);
IOBUF IOBUF_4(
	.I(main_ethernetsoc_a7ddrphy_dq_o_nodelay4),
	.T(main_ethernetsoc_a7ddrphy_dq_t4),
	.IO(ddram_dq[4]),
	.O(main_ethernetsoc_a7ddrphy_dq_i_nodelay4)
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_wrdata[5]),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_wrdata[21]),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_wrdata[5]),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_wrdata[21]),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_wrdata[5]),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_wrdata[21]),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_wrdata[5]),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_wrdata[21]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~main_ethernetsoc_a7ddrphy_oe_dq)),
	.TCE(1'd1),
	.OQ(main_ethernetsoc_a7ddrphy_dq_o_nodelay5),
	.TQ(main_ethernetsoc_a7ddrphy_dq_t5)
);
ISERDESE2 #(
	.DATA_RATE("DDR"),
	.DATA_WIDTH(4'd8),
	.INTERFACE_TYPE("NETWORKING"),
	.IOBDELAY("IFD"),
	.NUM_CE(1'd1),
	.SERDES_MODE("MASTER")
) ISERDESE2_5 (
	.BITSLIP(1'd0),
	.CE1(1'd1),
	.CLK(sys4x_clk),
	.CLKB((~sys4x_clk)),
	.CLKDIV(sys_clk),
	.DDLY(main_ethernetsoc_a7ddrphy_dq_i_delayed5),
	.RST(sys_rst),
	.Q1(main_ethernetsoc_a7ddrphy_dq_i_data5[7]),
	.Q2(main_ethernetsoc_a7ddrphy_dq_i_data5[6]),
	.Q3(main_ethernetsoc_a7ddrphy_dq_i_data5[5]),
	.Q4(main_ethernetsoc_a7ddrphy_dq_i_data5[4]),
	.Q5(main_ethernetsoc_a7ddrphy_dq_i_data5[3]),
	.Q6(main_ethernetsoc_a7ddrphy_dq_i_data5[2]),
	.Q7(main_ethernetsoc_a7ddrphy_dq_i_data5[1]),
	.Q8(main_ethernetsoc_a7ddrphy_dq_i_data5[0])
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
	.CE((main_ethernetsoc_a7ddrphy_dly_sel_storage[0] & main_ethernetsoc_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(main_ethernetsoc_a7ddrphy_dq_i_nodelay5),
	.INC(1'd1),
	.LD((main_ethernetsoc_a7ddrphy_dly_sel_storage[0] & main_ethernetsoc_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(main_ethernetsoc_a7ddrphy_dq_i_delayed5)
);
IOBUF IOBUF_5(
	.I(main_ethernetsoc_a7ddrphy_dq_o_nodelay5),
	.T(main_ethernetsoc_a7ddrphy_dq_t5),
	.IO(ddram_dq[5]),
	.O(main_ethernetsoc_a7ddrphy_dq_i_nodelay5)
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_wrdata[6]),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_wrdata[22]),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_wrdata[6]),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_wrdata[22]),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_wrdata[6]),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_wrdata[22]),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_wrdata[6]),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_wrdata[22]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~main_ethernetsoc_a7ddrphy_oe_dq)),
	.TCE(1'd1),
	.OQ(main_ethernetsoc_a7ddrphy_dq_o_nodelay6),
	.TQ(main_ethernetsoc_a7ddrphy_dq_t6)
);
ISERDESE2 #(
	.DATA_RATE("DDR"),
	.DATA_WIDTH(4'd8),
	.INTERFACE_TYPE("NETWORKING"),
	.IOBDELAY("IFD"),
	.NUM_CE(1'd1),
	.SERDES_MODE("MASTER")
) ISERDESE2_6 (
	.BITSLIP(1'd0),
	.CE1(1'd1),
	.CLK(sys4x_clk),
	.CLKB((~sys4x_clk)),
	.CLKDIV(sys_clk),
	.DDLY(main_ethernetsoc_a7ddrphy_dq_i_delayed6),
	.RST(sys_rst),
	.Q1(main_ethernetsoc_a7ddrphy_dq_i_data6[7]),
	.Q2(main_ethernetsoc_a7ddrphy_dq_i_data6[6]),
	.Q3(main_ethernetsoc_a7ddrphy_dq_i_data6[5]),
	.Q4(main_ethernetsoc_a7ddrphy_dq_i_data6[4]),
	.Q5(main_ethernetsoc_a7ddrphy_dq_i_data6[3]),
	.Q6(main_ethernetsoc_a7ddrphy_dq_i_data6[2]),
	.Q7(main_ethernetsoc_a7ddrphy_dq_i_data6[1]),
	.Q8(main_ethernetsoc_a7ddrphy_dq_i_data6[0])
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
	.CE((main_ethernetsoc_a7ddrphy_dly_sel_storage[0] & main_ethernetsoc_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(main_ethernetsoc_a7ddrphy_dq_i_nodelay6),
	.INC(1'd1),
	.LD((main_ethernetsoc_a7ddrphy_dly_sel_storage[0] & main_ethernetsoc_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(main_ethernetsoc_a7ddrphy_dq_i_delayed6)
);
IOBUF IOBUF_6(
	.I(main_ethernetsoc_a7ddrphy_dq_o_nodelay6),
	.T(main_ethernetsoc_a7ddrphy_dq_t6),
	.IO(ddram_dq[6]),
	.O(main_ethernetsoc_a7ddrphy_dq_i_nodelay6)
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_wrdata[7]),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_wrdata[23]),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_wrdata[7]),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_wrdata[23]),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_wrdata[7]),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_wrdata[23]),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_wrdata[7]),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_wrdata[23]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~main_ethernetsoc_a7ddrphy_oe_dq)),
	.TCE(1'd1),
	.OQ(main_ethernetsoc_a7ddrphy_dq_o_nodelay7),
	.TQ(main_ethernetsoc_a7ddrphy_dq_t7)
);
ISERDESE2 #(
	.DATA_RATE("DDR"),
	.DATA_WIDTH(4'd8),
	.INTERFACE_TYPE("NETWORKING"),
	.IOBDELAY("IFD"),
	.NUM_CE(1'd1),
	.SERDES_MODE("MASTER")
) ISERDESE2_7 (
	.BITSLIP(1'd0),
	.CE1(1'd1),
	.CLK(sys4x_clk),
	.CLKB((~sys4x_clk)),
	.CLKDIV(sys_clk),
	.DDLY(main_ethernetsoc_a7ddrphy_dq_i_delayed7),
	.RST(sys_rst),
	.Q1(main_ethernetsoc_a7ddrphy_dq_i_data7[7]),
	.Q2(main_ethernetsoc_a7ddrphy_dq_i_data7[6]),
	.Q3(main_ethernetsoc_a7ddrphy_dq_i_data7[5]),
	.Q4(main_ethernetsoc_a7ddrphy_dq_i_data7[4]),
	.Q5(main_ethernetsoc_a7ddrphy_dq_i_data7[3]),
	.Q6(main_ethernetsoc_a7ddrphy_dq_i_data7[2]),
	.Q7(main_ethernetsoc_a7ddrphy_dq_i_data7[1]),
	.Q8(main_ethernetsoc_a7ddrphy_dq_i_data7[0])
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
	.CE((main_ethernetsoc_a7ddrphy_dly_sel_storage[0] & main_ethernetsoc_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(main_ethernetsoc_a7ddrphy_dq_i_nodelay7),
	.INC(1'd1),
	.LD((main_ethernetsoc_a7ddrphy_dly_sel_storage[0] & main_ethernetsoc_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(main_ethernetsoc_a7ddrphy_dq_i_delayed7)
);
IOBUF IOBUF_7(
	.I(main_ethernetsoc_a7ddrphy_dq_o_nodelay7),
	.T(main_ethernetsoc_a7ddrphy_dq_t7),
	.IO(ddram_dq[7]),
	.O(main_ethernetsoc_a7ddrphy_dq_i_nodelay7)
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_wrdata[8]),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_wrdata[24]),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_wrdata[8]),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_wrdata[24]),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_wrdata[8]),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_wrdata[24]),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_wrdata[8]),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_wrdata[24]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~main_ethernetsoc_a7ddrphy_oe_dq)),
	.TCE(1'd1),
	.OQ(main_ethernetsoc_a7ddrphy_dq_o_nodelay8),
	.TQ(main_ethernetsoc_a7ddrphy_dq_t8)
);
ISERDESE2 #(
	.DATA_RATE("DDR"),
	.DATA_WIDTH(4'd8),
	.INTERFACE_TYPE("NETWORKING"),
	.IOBDELAY("IFD"),
	.NUM_CE(1'd1),
	.SERDES_MODE("MASTER")
) ISERDESE2_8 (
	.BITSLIP(1'd0),
	.CE1(1'd1),
	.CLK(sys4x_clk),
	.CLKB((~sys4x_clk)),
	.CLKDIV(sys_clk),
	.DDLY(main_ethernetsoc_a7ddrphy_dq_i_delayed8),
	.RST(sys_rst),
	.Q1(main_ethernetsoc_a7ddrphy_dq_i_data8[7]),
	.Q2(main_ethernetsoc_a7ddrphy_dq_i_data8[6]),
	.Q3(main_ethernetsoc_a7ddrphy_dq_i_data8[5]),
	.Q4(main_ethernetsoc_a7ddrphy_dq_i_data8[4]),
	.Q5(main_ethernetsoc_a7ddrphy_dq_i_data8[3]),
	.Q6(main_ethernetsoc_a7ddrphy_dq_i_data8[2]),
	.Q7(main_ethernetsoc_a7ddrphy_dq_i_data8[1]),
	.Q8(main_ethernetsoc_a7ddrphy_dq_i_data8[0])
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
	.CE((main_ethernetsoc_a7ddrphy_dly_sel_storage[1] & main_ethernetsoc_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(main_ethernetsoc_a7ddrphy_dq_i_nodelay8),
	.INC(1'd1),
	.LD((main_ethernetsoc_a7ddrphy_dly_sel_storage[1] & main_ethernetsoc_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(main_ethernetsoc_a7ddrphy_dq_i_delayed8)
);
IOBUF IOBUF_8(
	.I(main_ethernetsoc_a7ddrphy_dq_o_nodelay8),
	.T(main_ethernetsoc_a7ddrphy_dq_t8),
	.IO(ddram_dq[8]),
	.O(main_ethernetsoc_a7ddrphy_dq_i_nodelay8)
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_wrdata[9]),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_wrdata[25]),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_wrdata[9]),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_wrdata[25]),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_wrdata[9]),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_wrdata[25]),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_wrdata[9]),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_wrdata[25]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~main_ethernetsoc_a7ddrphy_oe_dq)),
	.TCE(1'd1),
	.OQ(main_ethernetsoc_a7ddrphy_dq_o_nodelay9),
	.TQ(main_ethernetsoc_a7ddrphy_dq_t9)
);
ISERDESE2 #(
	.DATA_RATE("DDR"),
	.DATA_WIDTH(4'd8),
	.INTERFACE_TYPE("NETWORKING"),
	.IOBDELAY("IFD"),
	.NUM_CE(1'd1),
	.SERDES_MODE("MASTER")
) ISERDESE2_9 (
	.BITSLIP(1'd0),
	.CE1(1'd1),
	.CLK(sys4x_clk),
	.CLKB((~sys4x_clk)),
	.CLKDIV(sys_clk),
	.DDLY(main_ethernetsoc_a7ddrphy_dq_i_delayed9),
	.RST(sys_rst),
	.Q1(main_ethernetsoc_a7ddrphy_dq_i_data9[7]),
	.Q2(main_ethernetsoc_a7ddrphy_dq_i_data9[6]),
	.Q3(main_ethernetsoc_a7ddrphy_dq_i_data9[5]),
	.Q4(main_ethernetsoc_a7ddrphy_dq_i_data9[4]),
	.Q5(main_ethernetsoc_a7ddrphy_dq_i_data9[3]),
	.Q6(main_ethernetsoc_a7ddrphy_dq_i_data9[2]),
	.Q7(main_ethernetsoc_a7ddrphy_dq_i_data9[1]),
	.Q8(main_ethernetsoc_a7ddrphy_dq_i_data9[0])
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
	.CE((main_ethernetsoc_a7ddrphy_dly_sel_storage[1] & main_ethernetsoc_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(main_ethernetsoc_a7ddrphy_dq_i_nodelay9),
	.INC(1'd1),
	.LD((main_ethernetsoc_a7ddrphy_dly_sel_storage[1] & main_ethernetsoc_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(main_ethernetsoc_a7ddrphy_dq_i_delayed9)
);
IOBUF IOBUF_9(
	.I(main_ethernetsoc_a7ddrphy_dq_o_nodelay9),
	.T(main_ethernetsoc_a7ddrphy_dq_t9),
	.IO(ddram_dq[9]),
	.O(main_ethernetsoc_a7ddrphy_dq_i_nodelay9)
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_wrdata[10]),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_wrdata[26]),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_wrdata[10]),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_wrdata[26]),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_wrdata[10]),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_wrdata[26]),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_wrdata[10]),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_wrdata[26]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~main_ethernetsoc_a7ddrphy_oe_dq)),
	.TCE(1'd1),
	.OQ(main_ethernetsoc_a7ddrphy_dq_o_nodelay10),
	.TQ(main_ethernetsoc_a7ddrphy_dq_t10)
);
ISERDESE2 #(
	.DATA_RATE("DDR"),
	.DATA_WIDTH(4'd8),
	.INTERFACE_TYPE("NETWORKING"),
	.IOBDELAY("IFD"),
	.NUM_CE(1'd1),
	.SERDES_MODE("MASTER")
) ISERDESE2_10 (
	.BITSLIP(1'd0),
	.CE1(1'd1),
	.CLK(sys4x_clk),
	.CLKB((~sys4x_clk)),
	.CLKDIV(sys_clk),
	.DDLY(main_ethernetsoc_a7ddrphy_dq_i_delayed10),
	.RST(sys_rst),
	.Q1(main_ethernetsoc_a7ddrphy_dq_i_data10[7]),
	.Q2(main_ethernetsoc_a7ddrphy_dq_i_data10[6]),
	.Q3(main_ethernetsoc_a7ddrphy_dq_i_data10[5]),
	.Q4(main_ethernetsoc_a7ddrphy_dq_i_data10[4]),
	.Q5(main_ethernetsoc_a7ddrphy_dq_i_data10[3]),
	.Q6(main_ethernetsoc_a7ddrphy_dq_i_data10[2]),
	.Q7(main_ethernetsoc_a7ddrphy_dq_i_data10[1]),
	.Q8(main_ethernetsoc_a7ddrphy_dq_i_data10[0])
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
	.CE((main_ethernetsoc_a7ddrphy_dly_sel_storage[1] & main_ethernetsoc_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(main_ethernetsoc_a7ddrphy_dq_i_nodelay10),
	.INC(1'd1),
	.LD((main_ethernetsoc_a7ddrphy_dly_sel_storage[1] & main_ethernetsoc_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(main_ethernetsoc_a7ddrphy_dq_i_delayed10)
);
IOBUF IOBUF_10(
	.I(main_ethernetsoc_a7ddrphy_dq_o_nodelay10),
	.T(main_ethernetsoc_a7ddrphy_dq_t10),
	.IO(ddram_dq[10]),
	.O(main_ethernetsoc_a7ddrphy_dq_i_nodelay10)
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_wrdata[11]),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_wrdata[27]),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_wrdata[11]),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_wrdata[27]),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_wrdata[11]),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_wrdata[27]),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_wrdata[11]),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_wrdata[27]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~main_ethernetsoc_a7ddrphy_oe_dq)),
	.TCE(1'd1),
	.OQ(main_ethernetsoc_a7ddrphy_dq_o_nodelay11),
	.TQ(main_ethernetsoc_a7ddrphy_dq_t11)
);
ISERDESE2 #(
	.DATA_RATE("DDR"),
	.DATA_WIDTH(4'd8),
	.INTERFACE_TYPE("NETWORKING"),
	.IOBDELAY("IFD"),
	.NUM_CE(1'd1),
	.SERDES_MODE("MASTER")
) ISERDESE2_11 (
	.BITSLIP(1'd0),
	.CE1(1'd1),
	.CLK(sys4x_clk),
	.CLKB((~sys4x_clk)),
	.CLKDIV(sys_clk),
	.DDLY(main_ethernetsoc_a7ddrphy_dq_i_delayed11),
	.RST(sys_rst),
	.Q1(main_ethernetsoc_a7ddrphy_dq_i_data11[7]),
	.Q2(main_ethernetsoc_a7ddrphy_dq_i_data11[6]),
	.Q3(main_ethernetsoc_a7ddrphy_dq_i_data11[5]),
	.Q4(main_ethernetsoc_a7ddrphy_dq_i_data11[4]),
	.Q5(main_ethernetsoc_a7ddrphy_dq_i_data11[3]),
	.Q6(main_ethernetsoc_a7ddrphy_dq_i_data11[2]),
	.Q7(main_ethernetsoc_a7ddrphy_dq_i_data11[1]),
	.Q8(main_ethernetsoc_a7ddrphy_dq_i_data11[0])
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
	.CE((main_ethernetsoc_a7ddrphy_dly_sel_storage[1] & main_ethernetsoc_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(main_ethernetsoc_a7ddrphy_dq_i_nodelay11),
	.INC(1'd1),
	.LD((main_ethernetsoc_a7ddrphy_dly_sel_storage[1] & main_ethernetsoc_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(main_ethernetsoc_a7ddrphy_dq_i_delayed11)
);
IOBUF IOBUF_11(
	.I(main_ethernetsoc_a7ddrphy_dq_o_nodelay11),
	.T(main_ethernetsoc_a7ddrphy_dq_t11),
	.IO(ddram_dq[11]),
	.O(main_ethernetsoc_a7ddrphy_dq_i_nodelay11)
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_wrdata[12]),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_wrdata[28]),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_wrdata[12]),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_wrdata[28]),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_wrdata[12]),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_wrdata[28]),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_wrdata[12]),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_wrdata[28]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~main_ethernetsoc_a7ddrphy_oe_dq)),
	.TCE(1'd1),
	.OQ(main_ethernetsoc_a7ddrphy_dq_o_nodelay12),
	.TQ(main_ethernetsoc_a7ddrphy_dq_t12)
);
ISERDESE2 #(
	.DATA_RATE("DDR"),
	.DATA_WIDTH(4'd8),
	.INTERFACE_TYPE("NETWORKING"),
	.IOBDELAY("IFD"),
	.NUM_CE(1'd1),
	.SERDES_MODE("MASTER")
) ISERDESE2_12 (
	.BITSLIP(1'd0),
	.CE1(1'd1),
	.CLK(sys4x_clk),
	.CLKB((~sys4x_clk)),
	.CLKDIV(sys_clk),
	.DDLY(main_ethernetsoc_a7ddrphy_dq_i_delayed12),
	.RST(sys_rst),
	.Q1(main_ethernetsoc_a7ddrphy_dq_i_data12[7]),
	.Q2(main_ethernetsoc_a7ddrphy_dq_i_data12[6]),
	.Q3(main_ethernetsoc_a7ddrphy_dq_i_data12[5]),
	.Q4(main_ethernetsoc_a7ddrphy_dq_i_data12[4]),
	.Q5(main_ethernetsoc_a7ddrphy_dq_i_data12[3]),
	.Q6(main_ethernetsoc_a7ddrphy_dq_i_data12[2]),
	.Q7(main_ethernetsoc_a7ddrphy_dq_i_data12[1]),
	.Q8(main_ethernetsoc_a7ddrphy_dq_i_data12[0])
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
	.CE((main_ethernetsoc_a7ddrphy_dly_sel_storage[1] & main_ethernetsoc_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(main_ethernetsoc_a7ddrphy_dq_i_nodelay12),
	.INC(1'd1),
	.LD((main_ethernetsoc_a7ddrphy_dly_sel_storage[1] & main_ethernetsoc_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(main_ethernetsoc_a7ddrphy_dq_i_delayed12)
);
IOBUF IOBUF_12(
	.I(main_ethernetsoc_a7ddrphy_dq_o_nodelay12),
	.T(main_ethernetsoc_a7ddrphy_dq_t12),
	.IO(ddram_dq[12]),
	.O(main_ethernetsoc_a7ddrphy_dq_i_nodelay12)
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_wrdata[13]),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_wrdata[29]),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_wrdata[13]),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_wrdata[29]),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_wrdata[13]),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_wrdata[29]),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_wrdata[13]),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_wrdata[29]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~main_ethernetsoc_a7ddrphy_oe_dq)),
	.TCE(1'd1),
	.OQ(main_ethernetsoc_a7ddrphy_dq_o_nodelay13),
	.TQ(main_ethernetsoc_a7ddrphy_dq_t13)
);
ISERDESE2 #(
	.DATA_RATE("DDR"),
	.DATA_WIDTH(4'd8),
	.INTERFACE_TYPE("NETWORKING"),
	.IOBDELAY("IFD"),
	.NUM_CE(1'd1),
	.SERDES_MODE("MASTER")
) ISERDESE2_13 (
	.BITSLIP(1'd0),
	.CE1(1'd1),
	.CLK(sys4x_clk),
	.CLKB((~sys4x_clk)),
	.CLKDIV(sys_clk),
	.DDLY(main_ethernetsoc_a7ddrphy_dq_i_delayed13),
	.RST(sys_rst),
	.Q1(main_ethernetsoc_a7ddrphy_dq_i_data13[7]),
	.Q2(main_ethernetsoc_a7ddrphy_dq_i_data13[6]),
	.Q3(main_ethernetsoc_a7ddrphy_dq_i_data13[5]),
	.Q4(main_ethernetsoc_a7ddrphy_dq_i_data13[4]),
	.Q5(main_ethernetsoc_a7ddrphy_dq_i_data13[3]),
	.Q6(main_ethernetsoc_a7ddrphy_dq_i_data13[2]),
	.Q7(main_ethernetsoc_a7ddrphy_dq_i_data13[1]),
	.Q8(main_ethernetsoc_a7ddrphy_dq_i_data13[0])
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
	.CE((main_ethernetsoc_a7ddrphy_dly_sel_storage[1] & main_ethernetsoc_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(main_ethernetsoc_a7ddrphy_dq_i_nodelay13),
	.INC(1'd1),
	.LD((main_ethernetsoc_a7ddrphy_dly_sel_storage[1] & main_ethernetsoc_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(main_ethernetsoc_a7ddrphy_dq_i_delayed13)
);
IOBUF IOBUF_13(
	.I(main_ethernetsoc_a7ddrphy_dq_o_nodelay13),
	.T(main_ethernetsoc_a7ddrphy_dq_t13),
	.IO(ddram_dq[13]),
	.O(main_ethernetsoc_a7ddrphy_dq_i_nodelay13)
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_wrdata[14]),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_wrdata[30]),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_wrdata[14]),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_wrdata[30]),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_wrdata[14]),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_wrdata[30]),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_wrdata[14]),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_wrdata[30]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~main_ethernetsoc_a7ddrphy_oe_dq)),
	.TCE(1'd1),
	.OQ(main_ethernetsoc_a7ddrphy_dq_o_nodelay14),
	.TQ(main_ethernetsoc_a7ddrphy_dq_t14)
);
ISERDESE2 #(
	.DATA_RATE("DDR"),
	.DATA_WIDTH(4'd8),
	.INTERFACE_TYPE("NETWORKING"),
	.IOBDELAY("IFD"),
	.NUM_CE(1'd1),
	.SERDES_MODE("MASTER")
) ISERDESE2_14 (
	.BITSLIP(1'd0),
	.CE1(1'd1),
	.CLK(sys4x_clk),
	.CLKB((~sys4x_clk)),
	.CLKDIV(sys_clk),
	.DDLY(main_ethernetsoc_a7ddrphy_dq_i_delayed14),
	.RST(sys_rst),
	.Q1(main_ethernetsoc_a7ddrphy_dq_i_data14[7]),
	.Q2(main_ethernetsoc_a7ddrphy_dq_i_data14[6]),
	.Q3(main_ethernetsoc_a7ddrphy_dq_i_data14[5]),
	.Q4(main_ethernetsoc_a7ddrphy_dq_i_data14[4]),
	.Q5(main_ethernetsoc_a7ddrphy_dq_i_data14[3]),
	.Q6(main_ethernetsoc_a7ddrphy_dq_i_data14[2]),
	.Q7(main_ethernetsoc_a7ddrphy_dq_i_data14[1]),
	.Q8(main_ethernetsoc_a7ddrphy_dq_i_data14[0])
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
	.CE((main_ethernetsoc_a7ddrphy_dly_sel_storage[1] & main_ethernetsoc_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(main_ethernetsoc_a7ddrphy_dq_i_nodelay14),
	.INC(1'd1),
	.LD((main_ethernetsoc_a7ddrphy_dly_sel_storage[1] & main_ethernetsoc_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(main_ethernetsoc_a7ddrphy_dq_i_delayed14)
);
IOBUF IOBUF_14(
	.I(main_ethernetsoc_a7ddrphy_dq_o_nodelay14),
	.T(main_ethernetsoc_a7ddrphy_dq_t14),
	.IO(ddram_dq[14]),
	.O(main_ethernetsoc_a7ddrphy_dq_i_nodelay14)
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
	.D1(main_ethernetsoc_a7ddrphy_dfi_p0_wrdata[15]),
	.D2(main_ethernetsoc_a7ddrphy_dfi_p0_wrdata[31]),
	.D3(main_ethernetsoc_a7ddrphy_dfi_p1_wrdata[15]),
	.D4(main_ethernetsoc_a7ddrphy_dfi_p1_wrdata[31]),
	.D5(main_ethernetsoc_a7ddrphy_dfi_p2_wrdata[15]),
	.D6(main_ethernetsoc_a7ddrphy_dfi_p2_wrdata[31]),
	.D7(main_ethernetsoc_a7ddrphy_dfi_p3_wrdata[15]),
	.D8(main_ethernetsoc_a7ddrphy_dfi_p3_wrdata[31]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~main_ethernetsoc_a7ddrphy_oe_dq)),
	.TCE(1'd1),
	.OQ(main_ethernetsoc_a7ddrphy_dq_o_nodelay15),
	.TQ(main_ethernetsoc_a7ddrphy_dq_t15)
);
ISERDESE2 #(
	.DATA_RATE("DDR"),
	.DATA_WIDTH(4'd8),
	.INTERFACE_TYPE("NETWORKING"),
	.IOBDELAY("IFD"),
	.NUM_CE(1'd1),
	.SERDES_MODE("MASTER")
) ISERDESE2_15 (
	.BITSLIP(1'd0),
	.CE1(1'd1),
	.CLK(sys4x_clk),
	.CLKB((~sys4x_clk)),
	.CLKDIV(sys_clk),
	.DDLY(main_ethernetsoc_a7ddrphy_dq_i_delayed15),
	.RST(sys_rst),
	.Q1(main_ethernetsoc_a7ddrphy_dq_i_data15[7]),
	.Q2(main_ethernetsoc_a7ddrphy_dq_i_data15[6]),
	.Q3(main_ethernetsoc_a7ddrphy_dq_i_data15[5]),
	.Q4(main_ethernetsoc_a7ddrphy_dq_i_data15[4]),
	.Q5(main_ethernetsoc_a7ddrphy_dq_i_data15[3]),
	.Q6(main_ethernetsoc_a7ddrphy_dq_i_data15[2]),
	.Q7(main_ethernetsoc_a7ddrphy_dq_i_data15[1]),
	.Q8(main_ethernetsoc_a7ddrphy_dq_i_data15[0])
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
	.CE((main_ethernetsoc_a7ddrphy_dly_sel_storage[1] & main_ethernetsoc_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(main_ethernetsoc_a7ddrphy_dq_i_nodelay15),
	.INC(1'd1),
	.LD((main_ethernetsoc_a7ddrphy_dly_sel_storage[1] & main_ethernetsoc_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(main_ethernetsoc_a7ddrphy_dq_i_delayed15)
);
IOBUF IOBUF_15(
	.I(main_ethernetsoc_a7ddrphy_dq_o_nodelay15),
	.T(main_ethernetsoc_a7ddrphy_dq_t15),
	.IO(ddram_dq[15]),
	.O(main_ethernetsoc_a7ddrphy_dq_i_nodelay15)
);
reg [23:0] storage_2[0:7];
reg [23:0] memdat_4;
always @(posedge sys_clk) begin
	if (main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_wrport_we)
		storage_2[main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_wrport_adr] <= main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_wrport_dat_w;
	memdat_4 <= storage_2[main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_wrport_adr];
end
always @(posedge sys_clk) begin
end
assign main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_wrport_dat_r = memdat_4;
assign main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_rdport_dat_r = storage_2[main_ethernetsoc_sdram_bankmachine0_cmd_buffer_lookahead_rdport_adr];
reg [23:0] storage_3[0:7];
reg [23:0] memdat_5;
always @(posedge sys_clk) begin
	if (main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_wrport_we)
		storage_3[main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_wrport_adr] <= main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_wrport_dat_w;
	memdat_5 <= storage_3[main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_wrport_adr];
end
always @(posedge sys_clk) begin
end
assign main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_wrport_dat_r = memdat_5;
assign main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_rdport_dat_r = storage_3[main_ethernetsoc_sdram_bankmachine1_cmd_buffer_lookahead_rdport_adr];
reg [23:0] storage_4[0:7];
reg [23:0] memdat_6;
always @(posedge sys_clk) begin
	if (main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_wrport_we)
		storage_4[main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_wrport_adr] <= main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_wrport_dat_w;
	memdat_6 <= storage_4[main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_wrport_adr];
end
always @(posedge sys_clk) begin
end
assign main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_wrport_dat_r = memdat_6;
assign main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_rdport_dat_r = storage_4[main_ethernetsoc_sdram_bankmachine2_cmd_buffer_lookahead_rdport_adr];
reg [23:0] storage_5[0:7];
reg [23:0] memdat_7;
always @(posedge sys_clk) begin
	if (main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_wrport_we)
		storage_5[main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_wrport_adr] <= main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_wrport_dat_w;
	memdat_7 <= storage_5[main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_wrport_adr];
end
always @(posedge sys_clk) begin
end
assign main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_wrport_dat_r = memdat_7;
assign main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_rdport_dat_r = storage_5[main_ethernetsoc_sdram_bankmachine3_cmd_buffer_lookahead_rdport_adr];
reg [23:0] storage_6[0:7];
reg [23:0] memdat_8;
always @(posedge sys_clk) begin
	if (main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_wrport_we)
		storage_6[main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_wrport_adr] <= main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_wrport_dat_w;
	memdat_8 <= storage_6[main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_wrport_adr];
end
always @(posedge sys_clk) begin
end
assign main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_wrport_dat_r = memdat_8;
assign main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_rdport_dat_r = storage_6[main_ethernetsoc_sdram_bankmachine4_cmd_buffer_lookahead_rdport_adr];
reg [23:0] storage_7[0:7];
reg [23:0] memdat_9;
always @(posedge sys_clk) begin
	if (main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_wrport_we)
		storage_7[main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_wrport_adr] <= main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_wrport_dat_w;
	memdat_9 <= storage_7[main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_wrport_adr];
end
always @(posedge sys_clk) begin
end
assign main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_wrport_dat_r = memdat_9;
assign main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_rdport_dat_r = storage_7[main_ethernetsoc_sdram_bankmachine5_cmd_buffer_lookahead_rdport_adr];
reg [23:0] storage_8[0:7];
reg [23:0] memdat_10;
always @(posedge sys_clk) begin
	if (main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_wrport_we)
		storage_8[main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_wrport_adr] <= main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_wrport_dat_w;
	memdat_10 <= storage_8[main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_wrport_adr];
end
always @(posedge sys_clk) begin
end
assign main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_wrport_dat_r = memdat_10;
assign main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_rdport_dat_r = storage_8[main_ethernetsoc_sdram_bankmachine6_cmd_buffer_lookahead_rdport_adr];
reg [23:0] storage_9[0:7];
reg [23:0] memdat_11;
always @(posedge sys_clk) begin
	if (main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_wrport_we)
		storage_9[main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_wrport_adr] <= main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_wrport_dat_w;
	memdat_11 <= storage_9[main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_wrport_adr];
end
always @(posedge sys_clk) begin
end
assign main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_wrport_dat_r = memdat_11;
assign main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_rdport_dat_r = storage_9[main_ethernetsoc_sdram_bankmachine7_cmd_buffer_lookahead_rdport_adr];
reg [23:0] tag_mem[0:511];
reg [8:0] memadr_2;
always @(posedge sys_clk) begin
	if (main_ethernetsoc_tag_port_we)
		tag_mem[main_ethernetsoc_tag_port_adr] <= main_ethernetsoc_tag_port_dat_w;
	memadr_2 <= main_ethernetsoc_tag_port_adr;
end
assign main_ethernetsoc_tag_port_dat_r = tag_mem[memadr_2];
assign eth_mdio = main_ethphy_data_oe ? main_ethphy_data_w : 1'bz;
assign main_ethphy_data_r = eth_mdio;
reg [11:0] storage_10[0:4];
reg [11:0] memdat_12;
always @(posedge eth_rx_clk) begin
	if (main_crc32_checker_syncfifo_wrport_we)
		storage_10[main_crc32_checker_syncfifo_wrport_adr] <= main_crc32_checker_syncfifo_wrport_dat_w;
	memdat_12 <= storage_10[main_crc32_checker_syncfifo_wrport_adr];
end
always @(posedge eth_rx_clk) begin
end
assign main_crc32_checker_syncfifo_wrport_dat_r = memdat_12;
assign main_crc32_checker_syncfifo_rdport_dat_r = storage_10[main_crc32_checker_syncfifo_rdport_adr];
reg [41:0] storage_11[0:63];
reg [5:0] memadr_3;
reg [5:0] memadr_4;
always @(posedge sys_clk) begin
	if (main_tx_cdc_wrport_we)
		storage_11[main_tx_cdc_wrport_adr] <= main_tx_cdc_wrport_dat_w;
	memadr_3 <= main_tx_cdc_wrport_adr;
end
always @(posedge eth_tx_clk) begin
	memadr_4 <= main_tx_cdc_rdport_adr;
end
assign main_tx_cdc_wrport_dat_r = storage_11[memadr_3];
assign main_tx_cdc_rdport_dat_r = storage_11[memadr_4];
reg [41:0] storage_12[0:63];
reg [5:0] memadr_5;
reg [5:0] memadr_6;
always @(posedge eth_rx_clk) begin
	if (main_rx_cdc_wrport_we)
		storage_12[main_rx_cdc_wrport_adr] <= main_rx_cdc_wrport_dat_w;
	memadr_5 <= main_rx_cdc_wrport_adr;
end
always @(posedge sys_clk) begin
	memadr_6 <= main_rx_cdc_rdport_adr;
end
assign main_rx_cdc_wrport_dat_r = storage_12[memadr_5];
assign main_rx_cdc_rdport_dat_r = storage_12[memadr_6];
reg [34:0] storage_13[0:1];
reg [34:0] memdat_13;
always @(posedge sys_clk) begin
	if (main_writer_fifo_wrport_we)
		storage_13[main_writer_fifo_wrport_adr] <= main_writer_fifo_wrport_dat_w;
	memdat_13 <= storage_13[main_writer_fifo_wrport_adr];
end
always @(posedge sys_clk) begin
end
assign main_writer_fifo_wrport_dat_r = memdat_13;
assign main_writer_fifo_rdport_dat_r = storage_13[main_writer_fifo_rdport_adr];
reg [31:0] mem_2[0:381];
reg [8:0] memadr_7;
reg [8:0] memadr_8;
always @(posedge sys_clk) begin
	if (main_writer_memory0_we)
		mem_2[main_writer_memory0_adr] <= main_writer_memory0_dat_w;
	memadr_7 <= main_writer_memory0_adr;
end
always @(posedge sys_clk) begin
	memadr_8 <= main_sram0_adr0;
end
assign main_writer_memory0_dat_r = mem_2[memadr_7];
assign main_sram0_dat_r0 = mem_2[memadr_8];
reg [31:0] mem_3[0:381];
reg [8:0] memadr_9;
reg [8:0] memadr_10;
always @(posedge sys_clk) begin
	if (main_writer_memory1_we)
		mem_3[main_writer_memory1_adr] <= main_writer_memory1_dat_w;
	memadr_9 <= main_writer_memory1_adr;
end
always @(posedge sys_clk) begin
	memadr_10 <= main_sram1_adr0;
end
assign main_writer_memory1_dat_r = mem_3[memadr_9];
assign main_sram1_dat_r0 = mem_3[memadr_10];
reg [13:0] storage_14[0:1];
reg [13:0] memdat_14;
always @(posedge sys_clk) begin
	if (main_reader_fifo_wrport_we)
		storage_14[main_reader_fifo_wrport_adr] <= main_reader_fifo_wrport_dat_w;
	memdat_14 <= storage_14[main_reader_fifo_wrport_adr];
end
always @(posedge sys_clk) begin
end
assign main_reader_fifo_wrport_dat_r = memdat_14;
assign main_reader_fifo_rdport_dat_r = storage_14[main_reader_fifo_rdport_adr];
VexRiscv VexRiscv(
	.clk(sys_clk),
	.dBusWishbone_ACK(main_ethernetsoc_vexriscv_dbus_ack),
	.dBusWishbone_DAT_MISO(main_ethernetsoc_vexriscv_dbus_dat_r),
	.dBusWishbone_ERR(main_ethernetsoc_vexriscv_dbus_err),
	.externalInterruptArray(main_ethernetsoc_vexriscv_interrupt0),
	.externalResetVector(1'd0),
	.iBusWishbone_ACK(main_ethernetsoc_vexriscv_ibus_ack),
	.iBusWishbone_DAT_MISO(main_ethernetsoc_vexriscv_ibus_dat_r),
	.iBusWishbone_ERR(main_ethernetsoc_vexriscv_ibus_err),
	.reset((sys_rst | main_ethernetsoc_vexriscv_reset)),
	.softwareInterrupt(1'd0),
	.timerInterrupt(main_ethernetsoc_vexriscv_interrupt1),
	.dBusWishbone_ADR(main_ethernetsoc_vexriscv_dbus_adr),
	.dBusWishbone_BTE(main_ethernetsoc_vexriscv_dbus_bte),
	.dBusWishbone_CTI(main_ethernetsoc_vexriscv_dbus_cti),
	.dBusWishbone_CYC(main_ethernetsoc_vexriscv_dbus_cyc),
	.dBusWishbone_DAT_MOSI(main_ethernetsoc_vexriscv_dbus_dat_w),
	.dBusWishbone_SEL(main_ethernetsoc_vexriscv_dbus_sel),
	.dBusWishbone_STB(main_ethernetsoc_vexriscv_dbus_stb),
	.dBusWishbone_WE(main_ethernetsoc_vexriscv_dbus_we),
	.iBusWishbone_ADR(main_ethernetsoc_vexriscv_ibus_adr),
	.iBusWishbone_BTE(main_ethernetsoc_vexriscv_ibus_bte),
	.iBusWishbone_CTI(main_ethernetsoc_vexriscv_ibus_cti),
	.iBusWishbone_CYC(main_ethernetsoc_vexriscv_ibus_cyc),
	.iBusWishbone_DAT_MOSI(main_ethernetsoc_vexriscv_ibus_dat_w),
	.iBusWishbone_SEL(main_ethernetsoc_vexriscv_ibus_sel),
	.iBusWishbone_STB(main_ethernetsoc_vexriscv_ibus_stb),
	.iBusWishbone_WE(main_ethernetsoc_vexriscv_ibus_we)
);
PLLE2_ADV #(
	.CLKFBOUT_MULT(4'd8),
	.CLKIN1_PERIOD(10.0),
	.CLKOUT0_DIVIDE(4'd8),
	.CLKOUT0_PHASE(1'd0),
	.CLKOUT1_DIVIDE(2'd2),
	.CLKOUT1_PHASE(1'd0),
	.CLKOUT2_DIVIDE(2'd2),
	.CLKOUT2_PHASE(7'd90),
	.CLKOUT3_DIVIDE(3'd4),
	.CLKOUT3_PHASE(1'd0),
	.CLKOUT4_DIVIDE(6'd32),
	.CLKOUT4_PHASE(1'd0),
	.DIVCLK_DIVIDE(1'd1),
	.REF_JITTER1(0.01),
	.STARTUP_WAIT("FALSE")
) PLLE2_ADV (
	.CLKFBIN(builder_pll_fb),
	.CLKIN1(main_ethernetsoc_clkin),
	.CLKFBOUT(builder_pll_fb),
	.CLKOUT0(main_ethernetsoc_clkout0),
	.CLKOUT1(main_ethernetsoc_clkout1),
	.CLKOUT2(main_ethernetsoc_clkout2),
	.CLKOUT3(main_ethernetsoc_clkout3),
	.CLKOUT4(main_ethernetsoc_clkout4),
	.LOCKED(main_ethernetsoc_locked)
);
reg [7:0] data_mem_grain0[0:511];
reg [8:0] memadr_11;
always @(posedge sys_clk) begin
	if (main_ethernetsoc_data_port_we[0])
		data_mem_grain0[main_ethernetsoc_data_port_adr] <= main_ethernetsoc_data_port_dat_w[7:0];
	memadr_11 <= main_ethernetsoc_data_port_adr;
end
assign main_ethernetsoc_data_port_dat_r[7:0] = data_mem_grain0[memadr_11];
reg [7:0] data_mem_grain1[0:511];
reg [8:0] memadr_12;
always @(posedge sys_clk) begin
	if (main_ethernetsoc_data_port_we[1])
		data_mem_grain1[main_ethernetsoc_data_port_adr] <= main_ethernetsoc_data_port_dat_w[15:8];
	memadr_12 <= main_ethernetsoc_data_port_adr;
end
assign main_ethernetsoc_data_port_dat_r[15:8] = data_mem_grain1[memadr_12];
reg [7:0] data_mem_grain2[0:511];
reg [8:0] memadr_13;
always @(posedge sys_clk) begin
	if (main_ethernetsoc_data_port_we[2])
		data_mem_grain2[main_ethernetsoc_data_port_adr] <= main_ethernetsoc_data_port_dat_w[23:16];
	memadr_13 <= main_ethernetsoc_data_port_adr;
end
assign main_ethernetsoc_data_port_dat_r[23:16] = data_mem_grain2[memadr_13];
reg [7:0] data_mem_grain3[0:511];
reg [8:0] memadr_14;
always @(posedge sys_clk) begin
	if (main_ethernetsoc_data_port_we[3])
		data_mem_grain3[main_ethernetsoc_data_port_adr] <= main_ethernetsoc_data_port_dat_w[31:24];
	memadr_14 <= main_ethernetsoc_data_port_adr;
end
assign main_ethernetsoc_data_port_dat_r[31:24] = data_mem_grain3[memadr_14];
reg [7:0] data_mem_grain4[0:511];
reg [8:0] memadr_15;
always @(posedge sys_clk) begin
	if (main_ethernetsoc_data_port_we[4])
		data_mem_grain4[main_ethernetsoc_data_port_adr] <= main_ethernetsoc_data_port_dat_w[39:32];
	memadr_15 <= main_ethernetsoc_data_port_adr;
end
assign main_ethernetsoc_data_port_dat_r[39:32] = data_mem_grain4[memadr_15];
reg [7:0] data_mem_grain5[0:511];
reg [8:0] memadr_16;
always @(posedge sys_clk) begin
	if (main_ethernetsoc_data_port_we[5])
		data_mem_grain5[main_ethernetsoc_data_port_adr] <= main_ethernetsoc_data_port_dat_w[47:40];
	memadr_16 <= main_ethernetsoc_data_port_adr;
end
assign main_ethernetsoc_data_port_dat_r[47:40] = data_mem_grain5[memadr_16];
reg [7:0] data_mem_grain6[0:511];
reg [8:0] memadr_17;
always @(posedge sys_clk) begin
	if (main_ethernetsoc_data_port_we[6])
		data_mem_grain6[main_ethernetsoc_data_port_adr] <= main_ethernetsoc_data_port_dat_w[55:48];
	memadr_17 <= main_ethernetsoc_data_port_adr;
end
assign main_ethernetsoc_data_port_dat_r[55:48] = data_mem_grain6[memadr_17];
reg [7:0] data_mem_grain7[0:511];
reg [8:0] memadr_18;
always @(posedge sys_clk) begin
	if (main_ethernetsoc_data_port_we[7])
		data_mem_grain7[main_ethernetsoc_data_port_adr] <= main_ethernetsoc_data_port_dat_w[63:56];
	memadr_18 <= main_ethernetsoc_data_port_adr;
end
assign main_ethernetsoc_data_port_dat_r[63:56] = data_mem_grain7[memadr_18];
reg [7:0] data_mem_grain8[0:511];
reg [8:0] memadr_19;
always @(posedge sys_clk) begin
	if (main_ethernetsoc_data_port_we[8])
		data_mem_grain8[main_ethernetsoc_data_port_adr] <= main_ethernetsoc_data_port_dat_w[71:64];
	memadr_19 <= main_ethernetsoc_data_port_adr;
end
assign main_ethernetsoc_data_port_dat_r[71:64] = data_mem_grain8[memadr_19];
reg [7:0] data_mem_grain9[0:511];
reg [8:0] memadr_20;
always @(posedge sys_clk) begin
	if (main_ethernetsoc_data_port_we[9])
		data_mem_grain9[main_ethernetsoc_data_port_adr] <= main_ethernetsoc_data_port_dat_w[79:72];
	memadr_20 <= main_ethernetsoc_data_port_adr;
end
assign main_ethernetsoc_data_port_dat_r[79:72] = data_mem_grain9[memadr_20];
reg [7:0] data_mem_grain10[0:511];
reg [8:0] memadr_21;
always @(posedge sys_clk) begin
	if (main_ethernetsoc_data_port_we[10])
		data_mem_grain10[main_ethernetsoc_data_port_adr] <= main_ethernetsoc_data_port_dat_w[87:80];
	memadr_21 <= main_ethernetsoc_data_port_adr;
end
assign main_ethernetsoc_data_port_dat_r[87:80] = data_mem_grain10[memadr_21];
reg [7:0] data_mem_grain11[0:511];
reg [8:0] memadr_22;
always @(posedge sys_clk) begin
	if (main_ethernetsoc_data_port_we[11])
		data_mem_grain11[main_ethernetsoc_data_port_adr] <= main_ethernetsoc_data_port_dat_w[95:88];
	memadr_22 <= main_ethernetsoc_data_port_adr;
end
assign main_ethernetsoc_data_port_dat_r[95:88] = data_mem_grain11[memadr_22];
reg [7:0] data_mem_grain12[0:511];
reg [8:0] memadr_23;
always @(posedge sys_clk) begin
	if (main_ethernetsoc_data_port_we[12])
		data_mem_grain12[main_ethernetsoc_data_port_adr] <= main_ethernetsoc_data_port_dat_w[103:96];
	memadr_23 <= main_ethernetsoc_data_port_adr;
end
assign main_ethernetsoc_data_port_dat_r[103:96] = data_mem_grain12[memadr_23];
reg [7:0] data_mem_grain13[0:511];
reg [8:0] memadr_24;
always @(posedge sys_clk) begin
	if (main_ethernetsoc_data_port_we[13])
		data_mem_grain13[main_ethernetsoc_data_port_adr] <= main_ethernetsoc_data_port_dat_w[111:104];
	memadr_24 <= main_ethernetsoc_data_port_adr;
end
assign main_ethernetsoc_data_port_dat_r[111:104] = data_mem_grain13[memadr_24];
reg [7:0] data_mem_grain14[0:511];
reg [8:0] memadr_25;
always @(posedge sys_clk) begin
	if (main_ethernetsoc_data_port_we[14])
		data_mem_grain14[main_ethernetsoc_data_port_adr] <= main_ethernetsoc_data_port_dat_w[119:112];
	memadr_25 <= main_ethernetsoc_data_port_adr;
end
assign main_ethernetsoc_data_port_dat_r[119:112] = data_mem_grain14[memadr_25];
reg [7:0] data_mem_grain15[0:511];
reg [8:0] memadr_26;
always @(posedge sys_clk) begin
	if (main_ethernetsoc_data_port_we[15])
		data_mem_grain15[main_ethernetsoc_data_port_adr] <= main_ethernetsoc_data_port_dat_w[127:120];
	memadr_26 <= main_ethernetsoc_data_port_adr;
end
assign main_ethernetsoc_data_port_dat_r[127:120] = data_mem_grain15[memadr_26];
reg [7:0] mem_grain0[0:381];
reg [8:0] memadr_27;
reg [8:0] memadr_28;
always @(posedge sys_clk) begin
	memadr_27 <= main_reader_memory0_adr;
end
always @(posedge sys_clk) begin
	if (main_sram0_we[0])
		mem_grain0[main_sram0_adr1] <= main_sram0_dat_w[7:0];
	memadr_28 <= main_sram0_adr1;
end
assign main_reader_memory0_dat_r[7:0] = mem_grain0[memadr_27];
assign main_sram0_dat_r1[7:0] = mem_grain0[memadr_28];
reg [7:0] mem_grain1[0:381];
reg [8:0] memadr_29;
reg [8:0] memadr_30;
always @(posedge sys_clk) begin
	memadr_29 <= main_reader_memory0_adr;
end
always @(posedge sys_clk) begin
	if (main_sram0_we[1])
		mem_grain1[main_sram0_adr1] <= main_sram0_dat_w[15:8];
	memadr_30 <= main_sram0_adr1;
end
assign main_reader_memory0_dat_r[15:8] = mem_grain1[memadr_29];
assign main_sram0_dat_r1[15:8] = mem_grain1[memadr_30];
reg [7:0] mem_grain2[0:381];
reg [8:0] memadr_31;
reg [8:0] memadr_32;
always @(posedge sys_clk) begin
	memadr_31 <= main_reader_memory0_adr;
end
always @(posedge sys_clk) begin
	if (main_sram0_we[2])
		mem_grain2[main_sram0_adr1] <= main_sram0_dat_w[23:16];
	memadr_32 <= main_sram0_adr1;
end
assign main_reader_memory0_dat_r[23:16] = mem_grain2[memadr_31];
assign main_sram0_dat_r1[23:16] = mem_grain2[memadr_32];
reg [7:0] mem_grain3[0:381];
reg [8:0] memadr_33;
reg [8:0] memadr_34;
always @(posedge sys_clk) begin
	memadr_33 <= main_reader_memory0_adr;
end
always @(posedge sys_clk) begin
	if (main_sram0_we[3])
		mem_grain3[main_sram0_adr1] <= main_sram0_dat_w[31:24];
	memadr_34 <= main_sram0_adr1;
end
assign main_reader_memory0_dat_r[31:24] = mem_grain3[memadr_33];
assign main_sram0_dat_r1[31:24] = mem_grain3[memadr_34];
reg [7:0] mem_grain0_1[0:381];
reg [8:0] memadr_35;
reg [8:0] memadr_36;
always @(posedge sys_clk) begin
	memadr_35 <= main_reader_memory1_adr;
end
always @(posedge sys_clk) begin
	if (main_sram1_we[0])
		mem_grain0_1[main_sram1_adr1] <= main_sram1_dat_w[7:0];
	memadr_36 <= main_sram1_adr1;
end
assign main_reader_memory1_dat_r[7:0] = mem_grain0_1[memadr_35];
assign main_sram1_dat_r1[7:0] = mem_grain0_1[memadr_36];
reg [7:0] mem_grain1_1[0:381];
reg [8:0] memadr_37;
reg [8:0] memadr_38;
always @(posedge sys_clk) begin
	memadr_37 <= main_reader_memory1_adr;
end
always @(posedge sys_clk) begin
	if (main_sram1_we[1])
		mem_grain1_1[main_sram1_adr1] <= main_sram1_dat_w[15:8];
	memadr_38 <= main_sram1_adr1;
end
assign main_reader_memory1_dat_r[15:8] = mem_grain1_1[memadr_37];
assign main_sram1_dat_r1[15:8] = mem_grain1_1[memadr_38];
reg [7:0] mem_grain2_1[0:381];
reg [8:0] memadr_39;
reg [8:0] memadr_40;
always @(posedge sys_clk) begin
	memadr_39 <= main_reader_memory1_adr;
end
always @(posedge sys_clk) begin
	if (main_sram1_we[2])
		mem_grain2_1[main_sram1_adr1] <= main_sram1_dat_w[23:16];
	memadr_40 <= main_sram1_adr1;
end
assign main_reader_memory1_dat_r[23:16] = mem_grain2_1[memadr_39];
assign main_sram1_dat_r1[23:16] = mem_grain2_1[memadr_40];
reg [7:0] mem_grain3_1[0:381];
reg [8:0] memadr_41;
reg [8:0] memadr_42;
always @(posedge sys_clk) begin
	memadr_41 <= main_reader_memory1_adr;
end
always @(posedge sys_clk) begin
	if (main_sram1_we[3])
		mem_grain3_1[main_sram1_adr1] <= main_sram1_dat_w[31:24];
	memadr_42 <= main_sram1_adr1;
end
assign main_reader_memory1_dat_r[31:24] = mem_grain3_1[memadr_41];
assign main_sram1_dat_r1[31:24] = mem_grain3_1[memadr_42];
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
	.C(sys4x_clk),
	.CE(1'd1),
	.D(1'd0),
	.PRE(builder_xilinxasyncresetsynchronizerimpl1),
	.Q(builder_xilinxasyncresetsynchronizerimpl1_rst_meta)
);
(* ars_ff2 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_3 (
	.C(sys4x_clk),
	.CE(1'd1),
	.D(builder_xilinxasyncresetsynchronizerimpl1_rst_meta),
	.PRE(builder_xilinxasyncresetsynchronizerimpl1),
	.Q(builder_xilinxasyncresetsynchronizerimpl1_expr)
);
(* ars_ff1 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_4 (
	.C(sys4x_dqs_clk),
	.CE(1'd1),
	.D(1'd0),
	.PRE(builder_xilinxasyncresetsynchronizerimpl2),
	.Q(builder_xilinxasyncresetsynchronizerimpl2_rst_meta)
);
(* ars_ff2 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_5 (
	.C(sys4x_dqs_clk),
	.CE(1'd1),
	.D(builder_xilinxasyncresetsynchronizerimpl2_rst_meta),
	.PRE(builder_xilinxasyncresetsynchronizerimpl2),
	.Q(builder_xilinxasyncresetsynchronizerimpl2_expr)
);
(* ars_ff1 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_6 (
	.C(clk200_clk),
	.CE(1'd1),
	.D(1'd0),
	.PRE(builder_xilinxasyncresetsynchronizerimpl3),
	.Q(builder_xilinxasyncresetsynchronizerimpl3_rst_meta)
);
(* ars_ff2 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_7 (
	.C(clk200_clk),
	.CE(1'd1),
	.D(builder_xilinxasyncresetsynchronizerimpl3_rst_meta),
	.PRE(builder_xilinxasyncresetsynchronizerimpl3),
	.Q(clk200_rst)
);
(* ars_ff1 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_8 (
	.C(eth_clk),
	.CE(1'd1),
	.D(1'd0),
	.PRE(builder_xilinxasyncresetsynchronizerimpl4),
	.Q(builder_xilinxasyncresetsynchronizerimpl4_rst_meta)
);
(* ars_ff2 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_9 (
	.C(eth_clk),
	.CE(1'd1),
	.D(builder_xilinxasyncresetsynchronizerimpl4_rst_meta),
	.PRE(builder_xilinxasyncresetsynchronizerimpl4),
	.Q(eth_rst)
);
(* ars_ff1 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_10 (
	.C(eth_tx_clk),
	.CE(1'd1),
	.D(1'd0),
	.PRE(main_ethphy_reset0),
	.Q(builder_xilinxasyncresetsynchronizerimpl5_rst_meta)
);
(* ars_ff2 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_11 (
	.C(eth_tx_clk),
	.CE(1'd1),
	.D(builder_xilinxasyncresetsynchronizerimpl5_rst_meta),
	.PRE(main_ethphy_reset0),
	.Q(eth_tx_rst)
);
(* ars_ff1 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_12 (
	.C(eth_rx_clk),
	.CE(1'd1),
	.D(1'd0),
	.PRE(main_ethphy_reset0),
	.Q(builder_xilinxasyncresetsynchronizerimpl6_rst_meta)
);
(* ars_ff2 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_13 (
	.C(eth_rx_clk),
	.CE(1'd1),
	.D(builder_xilinxasyncresetsynchronizerimpl6_rst_meta),
	.PRE(main_ethphy_reset0),
	.Q(eth_rx_rst)
);
endmodule