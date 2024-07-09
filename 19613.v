module top(
	output reg serial_tx,
	input serial_rx,
	input clk100,
	input cpu_reset,
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
	input eth_crs,
	output [3:0] led
);
wire [3:0] led;
assign led[0] = idelayctl_rdy;
assign led[1] = soc_pll_locked;
assign led[2] = 0;
assign led[3] = 0;
// Manually inserted OBUFs
wire [13:0] ddram_a_iob;
wire [ 2:0] ddram_ba_iob;
wire        ddram_ras_n_iob;
wire        ddram_cas_n_iob;
wire        ddram_we_n_iob;
wire        ddram_cs_n_iob;
wire [ 1:0] ddram_dm_iob;
wire        ddram_cke_iob;
wire        ddram_odt_iob;
wire        ddram_reset_n_iob;
OBUF #(.IOSTANDARD("SSTL135"), .SLEW("FAST")) obuf_a0  (.I(ddram_a_iob[ 0]), .O(ddram_a[ 0]));
OBUF #(.IOSTANDARD("SSTL135"), .SLEW("FAST")) obuf_a1  (.I(ddram_a_iob[ 1]), .O(ddram_a[ 1]));
OBUF #(.IOSTANDARD("SSTL135"), .SLEW("FAST")) obuf_a2  (.I(ddram_a_iob[ 2]), .O(ddram_a[ 2]));
OBUF #(.IOSTANDARD("SSTL135"), .SLEW("FAST")) obuf_a3  (.I(ddram_a_iob[ 3]), .O(ddram_a[ 3]));
OBUF #(.IOSTANDARD("SSTL135"), .SLEW("FAST")) obuf_a4  (.I(ddram_a_iob[ 4]), .O(ddram_a[ 4]));
OBUF #(.IOSTANDARD("SSTL135"), .SLEW("FAST")) obuf_a5  (.I(ddram_a_iob[ 5]), .O(ddram_a[ 5]));
OBUF #(.IOSTANDARD("SSTL135"), .SLEW("FAST")) obuf_a6  (.I(ddram_a_iob[ 6]), .O(ddram_a[ 6]));
OBUF #(.IOSTANDARD("SSTL135"), .SLEW("FAST")) obuf_a7  (.I(ddram_a_iob[ 7]), .O(ddram_a[ 7]));
OBUF #(.IOSTANDARD("SSTL135"), .SLEW("FAST")) obuf_a8  (.I(ddram_a_iob[ 8]), .O(ddram_a[ 8]));
OBUF #(.IOSTANDARD("SSTL135"), .SLEW("FAST")) obuf_a9  (.I(ddram_a_iob[ 9]), .O(ddram_a[ 9]));
OBUF #(.IOSTANDARD("SSTL135"), .SLEW("FAST")) obuf_a10 (.I(ddram_a_iob[10]), .O(ddram_a[10]));
OBUF #(.IOSTANDARD("SSTL135"), .SLEW("FAST")) obuf_a11 (.I(ddram_a_iob[11]), .O(ddram_a[11]));
OBUF #(.IOSTANDARD("SSTL135"), .SLEW("FAST")) obuf_a12 (.I(ddram_a_iob[12]), .O(ddram_a[12]));
OBUF #(.IOSTANDARD("SSTL135"), .SLEW("FAST")) obuf_a13 (.I(ddram_a_iob[13]), .O(ddram_a[13]));
OBUF #(.IOSTANDARD("SSTL135"), .SLEW("FAST")) obuf_ba0 (.I(ddram_ba_iob[0]), .O(ddram_ba[0]));
OBUF #(.IOSTANDARD("SSTL135"), .SLEW("FAST")) obuf_ba1 (.I(ddram_ba_iob[1]), .O(ddram_ba[1]));
OBUF #(.IOSTANDARD("SSTL135"), .SLEW("FAST")) obuf_ba2 (.I(ddram_ba_iob[2]), .O(ddram_ba[2]));
OBUF #(.IOSTANDARD("SSTL135"), .SLEW("FAST")) obuf_dm0 (.I(ddram_dm_iob[0]), .O(ddram_dm[0]));
OBUF #(.IOSTANDARD("SSTL135"), .SLEW("FAST")) obuf_dm1 (.I(ddram_dm_iob[1]), .O(ddram_dm[1]));
OBUF #(.IOSTANDARD("SSTL135"), .SLEW("FAST")) obuf_ras (.I(ddram_ras_n_iob), .O(ddram_ras_n));
OBUF #(.IOSTANDARD("SSTL135"), .SLEW("FAST")) obuf_cas (.I(ddram_cas_n_iob), .O(ddram_cas_n));
OBUF #(.IOSTANDARD("SSTL135"), .SLEW("FAST")) obuf_we  (.I(ddram_we_n_iob),  .O(ddram_we_n));
OBUF #(.IOSTANDARD("SSTL135"), .SLEW("FAST")) obuf_cs  (.I(ddram_cs_n_iob),  .O(ddram_cs_n));
OBUF #(.IOSTANDARD("SSTL135"), .SLEW("FAST")) obuf_cke (.I(ddram_cke_iob),  .O(ddram_cke));
OBUF #(.IOSTANDARD("SSTL135"), .SLEW("FAST")) obuf_odt (.I(ddram_odt_iob),  .O(ddram_odt));
OBUF #(.IOSTANDARD("SSTL135"), .SLEW("FAST")) obuf_rst (.I(ddram_reset_n_iob),.O(ddram_reset_n));
// End manually inserted OBUFs
wire idelayctl_rdy;
wire soc_netsoc_ctrl_reset_reset_re;
wire soc_netsoc_ctrl_reset_reset_r;
wire soc_netsoc_ctrl_reset_reset_we;
reg soc_netsoc_ctrl_reset_reset_w = 1'd0;
reg [31:0] soc_netsoc_ctrl_storage = 32'd305419896;
reg soc_netsoc_ctrl_re = 1'd0;
wire [31:0] soc_netsoc_ctrl_bus_errors_status;
wire soc_netsoc_ctrl_bus_errors_we;
wire soc_netsoc_ctrl_reset;
wire soc_netsoc_ctrl_bus_error;
reg [31:0] soc_netsoc_ctrl_bus_errors = 32'd0;
wire soc_netsoc_cpu_reset;
wire [29:0] soc_netsoc_cpu_ibus_adr;
wire [31:0] soc_netsoc_cpu_ibus_dat_w;
wire [31:0] soc_netsoc_cpu_ibus_dat_r;
wire [3:0] soc_netsoc_cpu_ibus_sel;
wire soc_netsoc_cpu_ibus_cyc;
wire soc_netsoc_cpu_ibus_stb;
wire soc_netsoc_cpu_ibus_ack;
wire soc_netsoc_cpu_ibus_we;
wire [2:0] soc_netsoc_cpu_ibus_cti;
wire [1:0] soc_netsoc_cpu_ibus_bte;
wire soc_netsoc_cpu_ibus_err;
wire [29:0] soc_netsoc_cpu_dbus_adr;
wire [31:0] soc_netsoc_cpu_dbus_dat_w;
wire [31:0] soc_netsoc_cpu_dbus_dat_r;
wire [3:0] soc_netsoc_cpu_dbus_sel;
wire soc_netsoc_cpu_dbus_cyc;
wire soc_netsoc_cpu_dbus_stb;
wire soc_netsoc_cpu_dbus_ack;
wire soc_netsoc_cpu_dbus_we;
wire [2:0] soc_netsoc_cpu_dbus_cti;
wire [1:0] soc_netsoc_cpu_dbus_bte;
wire soc_netsoc_cpu_dbus_err;
reg [31:0] soc_netsoc_cpu_interrupt0 = 32'd0;
wire soc_netsoc_cpu_latch_re;
wire soc_netsoc_cpu_latch_r;
wire soc_netsoc_cpu_latch_we;
reg soc_netsoc_cpu_latch_w = 1'd0;
reg [63:0] soc_netsoc_cpu_time_status = 64'd0;
wire soc_netsoc_cpu_time_we;
reg [63:0] soc_netsoc_cpu_time_cmp_storage = 64'd18446744073709551615;
reg soc_netsoc_cpu_time_cmp_re = 1'd0;
wire soc_netsoc_cpu_interrupt1;
reg [63:0] soc_netsoc_cpu_time = 64'd0;
reg [63:0] soc_netsoc_cpu_time_cmp = 64'd18446744073709551615;
wire [29:0] soc_netsoc_interface0_soc_bus_adr;
wire [31:0] soc_netsoc_interface0_soc_bus_dat_w;
wire [31:0] soc_netsoc_interface0_soc_bus_dat_r;
wire [3:0] soc_netsoc_interface0_soc_bus_sel;
wire soc_netsoc_interface0_soc_bus_cyc;
wire soc_netsoc_interface0_soc_bus_stb;
wire soc_netsoc_interface0_soc_bus_ack;
wire soc_netsoc_interface0_soc_bus_we;
wire [2:0] soc_netsoc_interface0_soc_bus_cti;
wire [1:0] soc_netsoc_interface0_soc_bus_bte;
wire soc_netsoc_interface0_soc_bus_err;
wire [29:0] soc_netsoc_interface1_soc_bus_adr;
wire [31:0] soc_netsoc_interface1_soc_bus_dat_w;
wire [31:0] soc_netsoc_interface1_soc_bus_dat_r;
wire [3:0] soc_netsoc_interface1_soc_bus_sel;
wire soc_netsoc_interface1_soc_bus_cyc;
wire soc_netsoc_interface1_soc_bus_stb;
wire soc_netsoc_interface1_soc_bus_ack;
wire soc_netsoc_interface1_soc_bus_we;
wire [2:0] soc_netsoc_interface1_soc_bus_cti;
wire [1:0] soc_netsoc_interface1_soc_bus_bte;
wire soc_netsoc_interface1_soc_bus_err;
wire [29:0] soc_netsoc_rom_bus_adr;
wire [31:0] soc_netsoc_rom_bus_dat_w;
wire [31:0] soc_netsoc_rom_bus_dat_r;
wire [3:0] soc_netsoc_rom_bus_sel;
wire soc_netsoc_rom_bus_cyc;
wire soc_netsoc_rom_bus_stb;
reg soc_netsoc_rom_bus_ack = 1'd0;
wire soc_netsoc_rom_bus_we;
wire [2:0] soc_netsoc_rom_bus_cti;
wire [1:0] soc_netsoc_rom_bus_bte;
reg soc_netsoc_rom_bus_err = 1'd0;
wire [13:0] soc_netsoc_rom_adr;
wire [31:0] soc_netsoc_rom_dat_r;
wire [29:0] soc_netsoc_sram_bus_adr;
wire [31:0] soc_netsoc_sram_bus_dat_w;
wire [31:0] soc_netsoc_sram_bus_dat_r;
wire [3:0] soc_netsoc_sram_bus_sel;
wire soc_netsoc_sram_bus_cyc;
wire soc_netsoc_sram_bus_stb;
reg soc_netsoc_sram_bus_ack = 1'd0;
wire soc_netsoc_sram_bus_we;
wire [2:0] soc_netsoc_sram_bus_cti;
wire [1:0] soc_netsoc_sram_bus_bte;
reg soc_netsoc_sram_bus_err = 1'd0;
wire [12:0] soc_netsoc_sram_adr;
wire [31:0] soc_netsoc_sram_dat_r;
reg [3:0] soc_netsoc_sram_we = 4'd0;
wire [31:0] soc_netsoc_sram_dat_w;
reg [31:0] soc_netsoc_uart_phy_storage = 32'd8246337;
reg soc_netsoc_uart_phy_re = 1'd0;
wire soc_netsoc_uart_phy_sink_valid;
reg soc_netsoc_uart_phy_sink_ready = 1'd0;
wire soc_netsoc_uart_phy_sink_first;
wire soc_netsoc_uart_phy_sink_last;
wire [7:0] soc_netsoc_uart_phy_sink_payload_data;
reg soc_netsoc_uart_phy_uart_clk_txen = 1'd0;
reg [31:0] soc_netsoc_uart_phy_phase_accumulator_tx = 32'd0;
reg [7:0] soc_netsoc_uart_phy_tx_reg = 8'd0;
reg [3:0] soc_netsoc_uart_phy_tx_bitcount = 4'd0;
reg soc_netsoc_uart_phy_tx_busy = 1'd0;
reg soc_netsoc_uart_phy_source_valid = 1'd0;
wire soc_netsoc_uart_phy_source_ready;
reg soc_netsoc_uart_phy_source_first = 1'd0;
reg soc_netsoc_uart_phy_source_last = 1'd0;
reg [7:0] soc_netsoc_uart_phy_source_payload_data = 8'd0;
reg soc_netsoc_uart_phy_uart_clk_rxen = 1'd0;
reg [31:0] soc_netsoc_uart_phy_phase_accumulator_rx = 32'd0;
wire soc_netsoc_uart_phy_rx;
reg soc_netsoc_uart_phy_rx_r = 1'd0;
reg [7:0] soc_netsoc_uart_phy_rx_reg = 8'd0;
reg [3:0] soc_netsoc_uart_phy_rx_bitcount = 4'd0;
reg soc_netsoc_uart_phy_rx_busy = 1'd0;
wire soc_netsoc_uart_rxtx_re;
wire [7:0] soc_netsoc_uart_rxtx_r;
wire soc_netsoc_uart_rxtx_we;
wire [7:0] soc_netsoc_uart_rxtx_w;
wire soc_netsoc_uart_txfull_status;
wire soc_netsoc_uart_txfull_we;
wire soc_netsoc_uart_rxempty_status;
wire soc_netsoc_uart_rxempty_we;
wire soc_netsoc_uart_irq;
wire soc_netsoc_uart_tx_status;
reg soc_netsoc_uart_tx_pending = 1'd0;
wire soc_netsoc_uart_tx_trigger;
reg soc_netsoc_uart_tx_clear = 1'd0;
reg soc_netsoc_uart_tx_old_trigger = 1'd0;
wire soc_netsoc_uart_rx_status;
reg soc_netsoc_uart_rx_pending = 1'd0;
wire soc_netsoc_uart_rx_trigger;
reg soc_netsoc_uart_rx_clear = 1'd0;
reg soc_netsoc_uart_rx_old_trigger = 1'd0;
wire soc_netsoc_uart_eventmanager_status_re;
wire [1:0] soc_netsoc_uart_eventmanager_status_r;
wire soc_netsoc_uart_eventmanager_status_we;
reg [1:0] soc_netsoc_uart_eventmanager_status_w = 2'd0;
wire soc_netsoc_uart_eventmanager_pending_re;
wire [1:0] soc_netsoc_uart_eventmanager_pending_r;
wire soc_netsoc_uart_eventmanager_pending_we;
reg [1:0] soc_netsoc_uart_eventmanager_pending_w = 2'd0;
reg [1:0] soc_netsoc_uart_eventmanager_storage = 2'd0;
reg soc_netsoc_uart_eventmanager_re = 1'd0;
wire soc_netsoc_uart_tx_fifo_sink_valid;
wire soc_netsoc_uart_tx_fifo_sink_ready;
reg soc_netsoc_uart_tx_fifo_sink_first = 1'd0;
reg soc_netsoc_uart_tx_fifo_sink_last = 1'd0;
wire [7:0] soc_netsoc_uart_tx_fifo_sink_payload_data;
wire soc_netsoc_uart_tx_fifo_source_valid;
wire soc_netsoc_uart_tx_fifo_source_ready;
wire soc_netsoc_uart_tx_fifo_source_first;
wire soc_netsoc_uart_tx_fifo_source_last;
wire [7:0] soc_netsoc_uart_tx_fifo_source_payload_data;
wire soc_netsoc_uart_tx_fifo_re;
reg soc_netsoc_uart_tx_fifo_readable = 1'd0;
wire soc_netsoc_uart_tx_fifo_syncfifo_we;
wire soc_netsoc_uart_tx_fifo_syncfifo_writable;
wire soc_netsoc_uart_tx_fifo_syncfifo_re;
wire soc_netsoc_uart_tx_fifo_syncfifo_readable;
wire [9:0] soc_netsoc_uart_tx_fifo_syncfifo_din;
wire [9:0] soc_netsoc_uart_tx_fifo_syncfifo_dout;
reg [4:0] soc_netsoc_uart_tx_fifo_level0 = 5'd0;
reg soc_netsoc_uart_tx_fifo_replace = 1'd0;
reg [3:0] soc_netsoc_uart_tx_fifo_produce = 4'd0;
reg [3:0] soc_netsoc_uart_tx_fifo_consume = 4'd0;
reg [3:0] soc_netsoc_uart_tx_fifo_wrport_adr = 4'd0;
wire [9:0] soc_netsoc_uart_tx_fifo_wrport_dat_r;
wire soc_netsoc_uart_tx_fifo_wrport_we;
wire [9:0] soc_netsoc_uart_tx_fifo_wrport_dat_w;
wire soc_netsoc_uart_tx_fifo_do_read;
wire [3:0] soc_netsoc_uart_tx_fifo_rdport_adr;
wire [9:0] soc_netsoc_uart_tx_fifo_rdport_dat_r;
wire soc_netsoc_uart_tx_fifo_rdport_re;
wire [4:0] soc_netsoc_uart_tx_fifo_level1;
wire [7:0] soc_netsoc_uart_tx_fifo_fifo_in_payload_data;
wire soc_netsoc_uart_tx_fifo_fifo_in_first;
wire soc_netsoc_uart_tx_fifo_fifo_in_last;
wire [7:0] soc_netsoc_uart_tx_fifo_fifo_out_payload_data;
wire soc_netsoc_uart_tx_fifo_fifo_out_first;
wire soc_netsoc_uart_tx_fifo_fifo_out_last;
wire soc_netsoc_uart_rx_fifo_sink_valid;
wire soc_netsoc_uart_rx_fifo_sink_ready;
wire soc_netsoc_uart_rx_fifo_sink_first;
wire soc_netsoc_uart_rx_fifo_sink_last;
wire [7:0] soc_netsoc_uart_rx_fifo_sink_payload_data;
wire soc_netsoc_uart_rx_fifo_source_valid;
wire soc_netsoc_uart_rx_fifo_source_ready;
wire soc_netsoc_uart_rx_fifo_source_first;
wire soc_netsoc_uart_rx_fifo_source_last;
wire [7:0] soc_netsoc_uart_rx_fifo_source_payload_data;
wire soc_netsoc_uart_rx_fifo_re;
reg soc_netsoc_uart_rx_fifo_readable = 1'd0;
wire soc_netsoc_uart_rx_fifo_syncfifo_we;
wire soc_netsoc_uart_rx_fifo_syncfifo_writable;
wire soc_netsoc_uart_rx_fifo_syncfifo_re;
wire soc_netsoc_uart_rx_fifo_syncfifo_readable;
wire [9:0] soc_netsoc_uart_rx_fifo_syncfifo_din;
wire [9:0] soc_netsoc_uart_rx_fifo_syncfifo_dout;
reg [4:0] soc_netsoc_uart_rx_fifo_level0 = 5'd0;
reg soc_netsoc_uart_rx_fifo_replace = 1'd0;
reg [3:0] soc_netsoc_uart_rx_fifo_produce = 4'd0;
reg [3:0] soc_netsoc_uart_rx_fifo_consume = 4'd0;
reg [3:0] soc_netsoc_uart_rx_fifo_wrport_adr = 4'd0;
wire [9:0] soc_netsoc_uart_rx_fifo_wrport_dat_r;
wire soc_netsoc_uart_rx_fifo_wrport_we;
wire [9:0] soc_netsoc_uart_rx_fifo_wrport_dat_w;
wire soc_netsoc_uart_rx_fifo_do_read;
wire [3:0] soc_netsoc_uart_rx_fifo_rdport_adr;
wire [9:0] soc_netsoc_uart_rx_fifo_rdport_dat_r;
wire soc_netsoc_uart_rx_fifo_rdport_re;
wire [4:0] soc_netsoc_uart_rx_fifo_level1;
wire [7:0] soc_netsoc_uart_rx_fifo_fifo_in_payload_data;
wire soc_netsoc_uart_rx_fifo_fifo_in_first;
wire soc_netsoc_uart_rx_fifo_fifo_in_last;
wire [7:0] soc_netsoc_uart_rx_fifo_fifo_out_payload_data;
wire soc_netsoc_uart_rx_fifo_fifo_out_first;
wire soc_netsoc_uart_rx_fifo_fifo_out_last;
reg soc_netsoc_uart_reset = 1'd0;
reg [31:0] soc_netsoc_timer0_load_storage = 32'd0;
reg soc_netsoc_timer0_load_re = 1'd0;
reg [31:0] soc_netsoc_timer0_reload_storage = 32'd0;
reg soc_netsoc_timer0_reload_re = 1'd0;
reg soc_netsoc_timer0_en_storage = 1'd0;
reg soc_netsoc_timer0_en_re = 1'd0;
reg soc_netsoc_timer0_update_value_storage = 1'd0;
reg soc_netsoc_timer0_update_value_re = 1'd0;
reg [31:0] soc_netsoc_timer0_value_status = 32'd0;
wire soc_netsoc_timer0_value_we;
wire soc_netsoc_timer0_irq;
wire soc_netsoc_timer0_zero_status;
reg soc_netsoc_timer0_zero_pending = 1'd0;
wire soc_netsoc_timer0_zero_trigger;
reg soc_netsoc_timer0_zero_clear = 1'd0;
reg soc_netsoc_timer0_zero_old_trigger = 1'd0;
wire soc_netsoc_timer0_eventmanager_status_re;
wire soc_netsoc_timer0_eventmanager_status_r;
wire soc_netsoc_timer0_eventmanager_status_we;
wire soc_netsoc_timer0_eventmanager_status_w;
wire soc_netsoc_timer0_eventmanager_pending_re;
wire soc_netsoc_timer0_eventmanager_pending_r;
wire soc_netsoc_timer0_eventmanager_pending_we;
wire soc_netsoc_timer0_eventmanager_pending_w;
reg soc_netsoc_timer0_eventmanager_storage = 1'd0;
reg soc_netsoc_timer0_eventmanager_re = 1'd0;
reg [31:0] soc_netsoc_timer0_value = 32'd0;
reg [13:0] soc_netsoc_interface_adr = 14'd0;
reg soc_netsoc_interface_we = 1'd0;
wire [7:0] soc_netsoc_interface_dat_w;
wire [7:0] soc_netsoc_interface_dat_r;
wire [29:0] soc_netsoc_bus_wishbone_adr;
wire [31:0] soc_netsoc_bus_wishbone_dat_w;
wire [31:0] soc_netsoc_bus_wishbone_dat_r;
wire [3:0] soc_netsoc_bus_wishbone_sel;
wire soc_netsoc_bus_wishbone_cyc;
wire soc_netsoc_bus_wishbone_stb;
reg soc_netsoc_bus_wishbone_ack = 1'd0;
wire soc_netsoc_bus_wishbone_we;
wire [2:0] soc_netsoc_bus_wishbone_cti;
wire [1:0] soc_netsoc_bus_wishbone_bte;
reg soc_netsoc_bus_wishbone_err = 1'd0;
wire [29:0] soc_netsoc_interface0_wb_sdram_adr;
wire [31:0] soc_netsoc_interface0_wb_sdram_dat_w;
reg [31:0] soc_netsoc_interface0_wb_sdram_dat_r = 32'd0;
wire [3:0] soc_netsoc_interface0_wb_sdram_sel;
wire soc_netsoc_interface0_wb_sdram_cyc;
wire soc_netsoc_interface0_wb_sdram_stb;
reg soc_netsoc_interface0_wb_sdram_ack = 1'd0;
wire soc_netsoc_interface0_wb_sdram_we;
wire [2:0] soc_netsoc_interface0_wb_sdram_cti;
wire [1:0] soc_netsoc_interface0_wb_sdram_bte;
reg soc_netsoc_interface0_wb_sdram_err = 1'd0;
(* dont_touch = "true" *) wire sys_clk;
wire sys_rst;
wire sys4x_clk;
wire sys4x_dqs_clk;
wire clk200_clk;
wire clk200_rst;
wire soc_clk100bg;
wire soc_pll_locked;
wire soc_pll_fb;
wire soc_pll_sys;
wire soc_pll_sys4x;
wire soc_pll_sys4x_dqs;
wire soc_pll_clk200;
wire soc_pll_clk100;
reg [3:0] soc_reset_counter = 4'd15;
reg soc_ic_reset = 1'd1;
wire [29:0] soc_emulator_ram_bus_adr;
wire [31:0] soc_emulator_ram_bus_dat_w;
wire [31:0] soc_emulator_ram_bus_dat_r;
wire [3:0] soc_emulator_ram_bus_sel;
wire soc_emulator_ram_bus_cyc;
wire soc_emulator_ram_bus_stb;
reg soc_emulator_ram_bus_ack = 1'd0;
wire soc_emulator_ram_bus_we;
wire [2:0] soc_emulator_ram_bus_cti;
wire [1:0] soc_emulator_ram_bus_bte;
reg soc_emulator_ram_bus_err = 1'd0;
wire [11:0] soc_emulator_ram_adr;
wire [31:0] soc_emulator_ram_dat_r;
reg [3:0] soc_emulator_ram_we = 4'd0;
wire [31:0] soc_emulator_ram_dat_w;
reg [4:0] soc_a7ddrphy_half_sys8x_taps_storage = 5'd8;
reg soc_a7ddrphy_half_sys8x_taps_re = 1'd0;
wire soc_a7ddrphy_cdly_rst_re;
wire soc_a7ddrphy_cdly_rst_r;
wire soc_a7ddrphy_cdly_rst_we;
reg soc_a7ddrphy_cdly_rst_w = 1'd0;
wire soc_a7ddrphy_cdly_inc_re;
wire soc_a7ddrphy_cdly_inc_r;
wire soc_a7ddrphy_cdly_inc_we;
reg soc_a7ddrphy_cdly_inc_w = 1'd0;
reg [1:0] soc_a7ddrphy_dly_sel_storage = 2'd0;
reg soc_a7ddrphy_dly_sel_re = 1'd0;
wire soc_a7ddrphy_rdly_dq_rst_re;
wire soc_a7ddrphy_rdly_dq_rst_r;
wire soc_a7ddrphy_rdly_dq_rst_we;
reg soc_a7ddrphy_rdly_dq_rst_w = 1'd0;
wire soc_a7ddrphy_rdly_dq_inc_re;
wire soc_a7ddrphy_rdly_dq_inc_r;
wire soc_a7ddrphy_rdly_dq_inc_we;
reg soc_a7ddrphy_rdly_dq_inc_w = 1'd0;
wire soc_a7ddrphy_rdly_dq_bitslip_rst_re;
wire soc_a7ddrphy_rdly_dq_bitslip_rst_r;
wire soc_a7ddrphy_rdly_dq_bitslip_rst_we;
reg soc_a7ddrphy_rdly_dq_bitslip_rst_w = 1'd0;
wire soc_a7ddrphy_rdly_dq_bitslip_re;
wire soc_a7ddrphy_rdly_dq_bitslip_r;
wire soc_a7ddrphy_rdly_dq_bitslip_we;
reg soc_a7ddrphy_rdly_dq_bitslip_w = 1'd0;
wire [13:0] soc_a7ddrphy_dfi_p0_address;
wire [2:0] soc_a7ddrphy_dfi_p0_bank;
wire soc_a7ddrphy_dfi_p0_cas_n;
wire soc_a7ddrphy_dfi_p0_cs_n;
wire soc_a7ddrphy_dfi_p0_ras_n;
wire soc_a7ddrphy_dfi_p0_we_n;
wire soc_a7ddrphy_dfi_p0_cke;
wire soc_a7ddrphy_dfi_p0_odt;
wire soc_a7ddrphy_dfi_p0_reset_n;
wire soc_a7ddrphy_dfi_p0_act_n;
wire [31:0] soc_a7ddrphy_dfi_p0_wrdata;
wire soc_a7ddrphy_dfi_p0_wrdata_en;
wire [3:0] soc_a7ddrphy_dfi_p0_wrdata_mask;
wire soc_a7ddrphy_dfi_p0_rddata_en;
reg [31:0] soc_a7ddrphy_dfi_p0_rddata = 32'd0;
reg soc_a7ddrphy_dfi_p0_rddata_valid = 1'd0;
wire [13:0] soc_a7ddrphy_dfi_p1_address;
wire [2:0] soc_a7ddrphy_dfi_p1_bank;
wire soc_a7ddrphy_dfi_p1_cas_n;
wire soc_a7ddrphy_dfi_p1_cs_n;
wire soc_a7ddrphy_dfi_p1_ras_n;
wire soc_a7ddrphy_dfi_p1_we_n;
wire soc_a7ddrphy_dfi_p1_cke;
wire soc_a7ddrphy_dfi_p1_odt;
wire soc_a7ddrphy_dfi_p1_reset_n;
wire soc_a7ddrphy_dfi_p1_act_n;
wire [31:0] soc_a7ddrphy_dfi_p1_wrdata;
wire soc_a7ddrphy_dfi_p1_wrdata_en;
wire [3:0] soc_a7ddrphy_dfi_p1_wrdata_mask;
wire soc_a7ddrphy_dfi_p1_rddata_en;
reg [31:0] soc_a7ddrphy_dfi_p1_rddata = 32'd0;
reg soc_a7ddrphy_dfi_p1_rddata_valid = 1'd0;
wire [13:0] soc_a7ddrphy_dfi_p2_address;
wire [2:0] soc_a7ddrphy_dfi_p2_bank;
wire soc_a7ddrphy_dfi_p2_cas_n;
wire soc_a7ddrphy_dfi_p2_cs_n;
wire soc_a7ddrphy_dfi_p2_ras_n;
wire soc_a7ddrphy_dfi_p2_we_n;
wire soc_a7ddrphy_dfi_p2_cke;
wire soc_a7ddrphy_dfi_p2_odt;
wire soc_a7ddrphy_dfi_p2_reset_n;
wire soc_a7ddrphy_dfi_p2_act_n;
wire [31:0] soc_a7ddrphy_dfi_p2_wrdata;
wire soc_a7ddrphy_dfi_p2_wrdata_en;
wire [3:0] soc_a7ddrphy_dfi_p2_wrdata_mask;
wire soc_a7ddrphy_dfi_p2_rddata_en;
reg [31:0] soc_a7ddrphy_dfi_p2_rddata = 32'd0;
reg soc_a7ddrphy_dfi_p2_rddata_valid = 1'd0;
wire [13:0] soc_a7ddrphy_dfi_p3_address;
wire [2:0] soc_a7ddrphy_dfi_p3_bank;
wire soc_a7ddrphy_dfi_p3_cas_n;
wire soc_a7ddrphy_dfi_p3_cs_n;
wire soc_a7ddrphy_dfi_p3_ras_n;
wire soc_a7ddrphy_dfi_p3_we_n;
wire soc_a7ddrphy_dfi_p3_cke;
wire soc_a7ddrphy_dfi_p3_odt;
wire soc_a7ddrphy_dfi_p3_reset_n;
wire soc_a7ddrphy_dfi_p3_act_n;
wire [31:0] soc_a7ddrphy_dfi_p3_wrdata;
wire soc_a7ddrphy_dfi_p3_wrdata_en;
wire [3:0] soc_a7ddrphy_dfi_p3_wrdata_mask;
wire soc_a7ddrphy_dfi_p3_rddata_en;
reg [31:0] soc_a7ddrphy_dfi_p3_rddata = 32'd0;
reg soc_a7ddrphy_dfi_p3_rddata_valid = 1'd0;
wire soc_a7ddrphy_sd_clk_se_nodelay;
reg soc_a7ddrphy_oe_dqs = 1'd0;
wire soc_a7ddrphy_dqs_preamble;
wire soc_a7ddrphy_dqs_postamble;
reg [7:0] soc_a7ddrphy_dqs_serdes_pattern = 8'd85;
wire soc_a7ddrphy_dqs_nodelay0;
wire soc_a7ddrphy_dqs_t0;
wire soc_a7ddrphy0;
wire soc_a7ddrphy_dqs_nodelay1;
wire soc_a7ddrphy_dqs_t1;
wire soc_a7ddrphy1;
reg soc_a7ddrphy_oe_dq = 1'd0;
wire soc_a7ddrphy_dq_o_nodelay0;
wire soc_a7ddrphy_dq_i_nodelay0;
wire soc_a7ddrphy_dq_i_delayed0;
wire soc_a7ddrphy_dq_t0;
wire [7:0] soc_a7ddrphy_dq_i_data0;
wire [7:0] soc_a7ddrphy_bitslip0_i;
reg [7:0] soc_a7ddrphy_bitslip0_o = 8'd0;
reg [2:0] soc_a7ddrphy_bitslip0_value = 3'd0;
reg [15:0] soc_a7ddrphy_bitslip0_r = 16'd0;
wire soc_a7ddrphy_dq_o_nodelay1;
wire soc_a7ddrphy_dq_i_nodelay1;
wire soc_a7ddrphy_dq_i_delayed1;
wire soc_a7ddrphy_dq_t1;
wire [7:0] soc_a7ddrphy_dq_i_data1;
wire [7:0] soc_a7ddrphy_bitslip1_i;
reg [7:0] soc_a7ddrphy_bitslip1_o = 8'd0;
reg [2:0] soc_a7ddrphy_bitslip1_value = 3'd0;
reg [15:0] soc_a7ddrphy_bitslip1_r = 16'd0;
wire soc_a7ddrphy_dq_o_nodelay2;
wire soc_a7ddrphy_dq_i_nodelay2;
wire soc_a7ddrphy_dq_i_delayed2;
wire soc_a7ddrphy_dq_t2;
wire [7:0] soc_a7ddrphy_dq_i_data2;
wire [7:0] soc_a7ddrphy_bitslip2_i;
reg [7:0] soc_a7ddrphy_bitslip2_o = 8'd0;
reg [2:0] soc_a7ddrphy_bitslip2_value = 3'd0;
reg [15:0] soc_a7ddrphy_bitslip2_r = 16'd0;
wire soc_a7ddrphy_dq_o_nodelay3;
wire soc_a7ddrphy_dq_i_nodelay3;
wire soc_a7ddrphy_dq_i_delayed3;
wire soc_a7ddrphy_dq_t3;
wire [7:0] soc_a7ddrphy_dq_i_data3;
wire [7:0] soc_a7ddrphy_bitslip3_i;
reg [7:0] soc_a7ddrphy_bitslip3_o = 8'd0;
reg [2:0] soc_a7ddrphy_bitslip3_value = 3'd0;
reg [15:0] soc_a7ddrphy_bitslip3_r = 16'd0;
wire soc_a7ddrphy_dq_o_nodelay4;
wire soc_a7ddrphy_dq_i_nodelay4;
wire soc_a7ddrphy_dq_i_delayed4;
wire soc_a7ddrphy_dq_t4;
wire [7:0] soc_a7ddrphy_dq_i_data4;
wire [7:0] soc_a7ddrphy_bitslip4_i;
reg [7:0] soc_a7ddrphy_bitslip4_o = 8'd0;
reg [2:0] soc_a7ddrphy_bitslip4_value = 3'd0;
reg [15:0] soc_a7ddrphy_bitslip4_r = 16'd0;
wire soc_a7ddrphy_dq_o_nodelay5;
wire soc_a7ddrphy_dq_i_nodelay5;
wire soc_a7ddrphy_dq_i_delayed5;
wire soc_a7ddrphy_dq_t5;
wire [7:0] soc_a7ddrphy_dq_i_data5;
wire [7:0] soc_a7ddrphy_bitslip5_i;
reg [7:0] soc_a7ddrphy_bitslip5_o = 8'd0;
reg [2:0] soc_a7ddrphy_bitslip5_value = 3'd0;
reg [15:0] soc_a7ddrphy_bitslip5_r = 16'd0;
wire soc_a7ddrphy_dq_o_nodelay6;
wire soc_a7ddrphy_dq_i_nodelay6;
wire soc_a7ddrphy_dq_i_delayed6;
wire soc_a7ddrphy_dq_t6;
wire [7:0] soc_a7ddrphy_dq_i_data6;
wire [7:0] soc_a7ddrphy_bitslip6_i;
reg [7:0] soc_a7ddrphy_bitslip6_o = 8'd0;
reg [2:0] soc_a7ddrphy_bitslip6_value = 3'd0;
reg [15:0] soc_a7ddrphy_bitslip6_r = 16'd0;
wire soc_a7ddrphy_dq_o_nodelay7;
wire soc_a7ddrphy_dq_i_nodelay7;
wire soc_a7ddrphy_dq_i_delayed7;
wire soc_a7ddrphy_dq_t7;
wire [7:0] soc_a7ddrphy_dq_i_data7;
wire [7:0] soc_a7ddrphy_bitslip7_i;
reg [7:0] soc_a7ddrphy_bitslip7_o = 8'd0;
reg [2:0] soc_a7ddrphy_bitslip7_value = 3'd0;
reg [15:0] soc_a7ddrphy_bitslip7_r = 16'd0;
wire soc_a7ddrphy_dq_o_nodelay8;
wire soc_a7ddrphy_dq_i_nodelay8;
wire soc_a7ddrphy_dq_i_delayed8;
wire soc_a7ddrphy_dq_t8;
wire [7:0] soc_a7ddrphy_dq_i_data8;
wire [7:0] soc_a7ddrphy_bitslip8_i;
reg [7:0] soc_a7ddrphy_bitslip8_o = 8'd0;
reg [2:0] soc_a7ddrphy_bitslip8_value = 3'd0;
reg [15:0] soc_a7ddrphy_bitslip8_r = 16'd0;
wire soc_a7ddrphy_dq_o_nodelay9;
wire soc_a7ddrphy_dq_i_nodelay9;
wire soc_a7ddrphy_dq_i_delayed9;
wire soc_a7ddrphy_dq_t9;
wire [7:0] soc_a7ddrphy_dq_i_data9;
wire [7:0] soc_a7ddrphy_bitslip9_i;
reg [7:0] soc_a7ddrphy_bitslip9_o = 8'd0;
reg [2:0] soc_a7ddrphy_bitslip9_value = 3'd0;
reg [15:0] soc_a7ddrphy_bitslip9_r = 16'd0;
wire soc_a7ddrphy_dq_o_nodelay10;
wire soc_a7ddrphy_dq_i_nodelay10;
wire soc_a7ddrphy_dq_i_delayed10;
wire soc_a7ddrphy_dq_t10;
wire [7:0] soc_a7ddrphy_dq_i_data10;
wire [7:0] soc_a7ddrphy_bitslip10_i;
reg [7:0] soc_a7ddrphy_bitslip10_o = 8'd0;
reg [2:0] soc_a7ddrphy_bitslip10_value = 3'd0;
reg [15:0] soc_a7ddrphy_bitslip10_r = 16'd0;
wire soc_a7ddrphy_dq_o_nodelay11;
wire soc_a7ddrphy_dq_i_nodelay11;
wire soc_a7ddrphy_dq_i_delayed11;
wire soc_a7ddrphy_dq_t11;
wire [7:0] soc_a7ddrphy_dq_i_data11;
wire [7:0] soc_a7ddrphy_bitslip11_i;
reg [7:0] soc_a7ddrphy_bitslip11_o = 8'd0;
reg [2:0] soc_a7ddrphy_bitslip11_value = 3'd0;
reg [15:0] soc_a7ddrphy_bitslip11_r = 16'd0;
wire soc_a7ddrphy_dq_o_nodelay12;
wire soc_a7ddrphy_dq_i_nodelay12;
wire soc_a7ddrphy_dq_i_delayed12;
wire soc_a7ddrphy_dq_t12;
wire [7:0] soc_a7ddrphy_dq_i_data12;
wire [7:0] soc_a7ddrphy_bitslip12_i;
reg [7:0] soc_a7ddrphy_bitslip12_o = 8'd0;
reg [2:0] soc_a7ddrphy_bitslip12_value = 3'd0;
reg [15:0] soc_a7ddrphy_bitslip12_r = 16'd0;
wire soc_a7ddrphy_dq_o_nodelay13;
wire soc_a7ddrphy_dq_i_nodelay13;
wire soc_a7ddrphy_dq_i_delayed13;
wire soc_a7ddrphy_dq_t13;
wire [7:0] soc_a7ddrphy_dq_i_data13;
wire [7:0] soc_a7ddrphy_bitslip13_i;
reg [7:0] soc_a7ddrphy_bitslip13_o = 8'd0;
reg [2:0] soc_a7ddrphy_bitslip13_value = 3'd0;
reg [15:0] soc_a7ddrphy_bitslip13_r = 16'd0;
wire soc_a7ddrphy_dq_o_nodelay14;
wire soc_a7ddrphy_dq_i_nodelay14;
wire soc_a7ddrphy_dq_i_delayed14;
wire soc_a7ddrphy_dq_t14;
wire [7:0] soc_a7ddrphy_dq_i_data14;
wire [7:0] soc_a7ddrphy_bitslip14_i;
reg [7:0] soc_a7ddrphy_bitslip14_o = 8'd0;
reg [2:0] soc_a7ddrphy_bitslip14_value = 3'd0;
reg [15:0] soc_a7ddrphy_bitslip14_r = 16'd0;
wire soc_a7ddrphy_dq_o_nodelay15;
wire soc_a7ddrphy_dq_i_nodelay15;
wire soc_a7ddrphy_dq_i_delayed15;
wire soc_a7ddrphy_dq_t15;
wire [7:0] soc_a7ddrphy_dq_i_data15;
wire [7:0] soc_a7ddrphy_bitslip15_i;
reg [7:0] soc_a7ddrphy_bitslip15_o = 8'd0;
reg [2:0] soc_a7ddrphy_bitslip15_value = 3'd0;
reg [15:0] soc_a7ddrphy_bitslip15_r = 16'd0;
reg soc_a7ddrphy_n_rddata_en0 = 1'd0;
reg soc_a7ddrphy_n_rddata_en1 = 1'd0;
reg soc_a7ddrphy_n_rddata_en2 = 1'd0;
reg soc_a7ddrphy_n_rddata_en3 = 1'd0;
reg soc_a7ddrphy_n_rddata_en4 = 1'd0;
reg soc_a7ddrphy_n_rddata_en5 = 1'd0;
reg soc_a7ddrphy_n_rddata_en6 = 1'd0;
reg soc_a7ddrphy_n_rddata_en7 = 1'd0;
wire soc_a7ddrphy_oe;
reg [3:0] soc_a7ddrphy_last_wrdata_en = 4'd0;
wire [13:0] soc_netsoc_sdram_inti_p0_address;
wire [2:0] soc_netsoc_sdram_inti_p0_bank;
reg soc_netsoc_sdram_inti_p0_cas_n = 1'd1;
reg soc_netsoc_sdram_inti_p0_cs_n = 1'd1;
reg soc_netsoc_sdram_inti_p0_ras_n = 1'd1;
reg soc_netsoc_sdram_inti_p0_we_n = 1'd1;
wire soc_netsoc_sdram_inti_p0_cke;
wire soc_netsoc_sdram_inti_p0_odt;
wire soc_netsoc_sdram_inti_p0_reset_n;
reg soc_netsoc_sdram_inti_p0_act_n = 1'd1;
wire [31:0] soc_netsoc_sdram_inti_p0_wrdata;
wire soc_netsoc_sdram_inti_p0_wrdata_en;
wire [3:0] soc_netsoc_sdram_inti_p0_wrdata_mask;
wire soc_netsoc_sdram_inti_p0_rddata_en;
reg [31:0] soc_netsoc_sdram_inti_p0_rddata = 32'd0;
reg soc_netsoc_sdram_inti_p0_rddata_valid = 1'd0;
wire [13:0] soc_netsoc_sdram_inti_p1_address;
wire [2:0] soc_netsoc_sdram_inti_p1_bank;
reg soc_netsoc_sdram_inti_p1_cas_n = 1'd1;
reg soc_netsoc_sdram_inti_p1_cs_n = 1'd1;
reg soc_netsoc_sdram_inti_p1_ras_n = 1'd1;
reg soc_netsoc_sdram_inti_p1_we_n = 1'd1;
wire soc_netsoc_sdram_inti_p1_cke;
wire soc_netsoc_sdram_inti_p1_odt;
wire soc_netsoc_sdram_inti_p1_reset_n;
reg soc_netsoc_sdram_inti_p1_act_n = 1'd1;
wire [31:0] soc_netsoc_sdram_inti_p1_wrdata;
wire soc_netsoc_sdram_inti_p1_wrdata_en;
wire [3:0] soc_netsoc_sdram_inti_p1_wrdata_mask;
wire soc_netsoc_sdram_inti_p1_rddata_en;
reg [31:0] soc_netsoc_sdram_inti_p1_rddata = 32'd0;
reg soc_netsoc_sdram_inti_p1_rddata_valid = 1'd0;
wire [13:0] soc_netsoc_sdram_inti_p2_address;
wire [2:0] soc_netsoc_sdram_inti_p2_bank;
reg soc_netsoc_sdram_inti_p2_cas_n = 1'd1;
reg soc_netsoc_sdram_inti_p2_cs_n = 1'd1;
reg soc_netsoc_sdram_inti_p2_ras_n = 1'd1;
reg soc_netsoc_sdram_inti_p2_we_n = 1'd1;
wire soc_netsoc_sdram_inti_p2_cke;
wire soc_netsoc_sdram_inti_p2_odt;
wire soc_netsoc_sdram_inti_p2_reset_n;
reg soc_netsoc_sdram_inti_p2_act_n = 1'd1;
wire [31:0] soc_netsoc_sdram_inti_p2_wrdata;
wire soc_netsoc_sdram_inti_p2_wrdata_en;
wire [3:0] soc_netsoc_sdram_inti_p2_wrdata_mask;
wire soc_netsoc_sdram_inti_p2_rddata_en;
reg [31:0] soc_netsoc_sdram_inti_p2_rddata = 32'd0;
reg soc_netsoc_sdram_inti_p2_rddata_valid = 1'd0;
wire [13:0] soc_netsoc_sdram_inti_p3_address;
wire [2:0] soc_netsoc_sdram_inti_p3_bank;
reg soc_netsoc_sdram_inti_p3_cas_n = 1'd1;
reg soc_netsoc_sdram_inti_p3_cs_n = 1'd1;
reg soc_netsoc_sdram_inti_p3_ras_n = 1'd1;
reg soc_netsoc_sdram_inti_p3_we_n = 1'd1;
wire soc_netsoc_sdram_inti_p3_cke;
wire soc_netsoc_sdram_inti_p3_odt;
wire soc_netsoc_sdram_inti_p3_reset_n;
reg soc_netsoc_sdram_inti_p3_act_n = 1'd1;
wire [31:0] soc_netsoc_sdram_inti_p3_wrdata;
wire soc_netsoc_sdram_inti_p3_wrdata_en;
wire [3:0] soc_netsoc_sdram_inti_p3_wrdata_mask;
wire soc_netsoc_sdram_inti_p3_rddata_en;
reg [31:0] soc_netsoc_sdram_inti_p3_rddata = 32'd0;
reg soc_netsoc_sdram_inti_p3_rddata_valid = 1'd0;
wire [13:0] soc_netsoc_sdram_slave_p0_address;
wire [2:0] soc_netsoc_sdram_slave_p0_bank;
wire soc_netsoc_sdram_slave_p0_cas_n;
wire soc_netsoc_sdram_slave_p0_cs_n;
wire soc_netsoc_sdram_slave_p0_ras_n;
wire soc_netsoc_sdram_slave_p0_we_n;
wire soc_netsoc_sdram_slave_p0_cke;
wire soc_netsoc_sdram_slave_p0_odt;
wire soc_netsoc_sdram_slave_p0_reset_n;
wire soc_netsoc_sdram_slave_p0_act_n;
wire [31:0] soc_netsoc_sdram_slave_p0_wrdata;
wire soc_netsoc_sdram_slave_p0_wrdata_en;
wire [3:0] soc_netsoc_sdram_slave_p0_wrdata_mask;
wire soc_netsoc_sdram_slave_p0_rddata_en;
reg [31:0] soc_netsoc_sdram_slave_p0_rddata = 32'd0;
reg soc_netsoc_sdram_slave_p0_rddata_valid = 1'd0;
wire [13:0] soc_netsoc_sdram_slave_p1_address;
wire [2:0] soc_netsoc_sdram_slave_p1_bank;
wire soc_netsoc_sdram_slave_p1_cas_n;
wire soc_netsoc_sdram_slave_p1_cs_n;
wire soc_netsoc_sdram_slave_p1_ras_n;
wire soc_netsoc_sdram_slave_p1_we_n;
wire soc_netsoc_sdram_slave_p1_cke;
wire soc_netsoc_sdram_slave_p1_odt;
wire soc_netsoc_sdram_slave_p1_reset_n;
wire soc_netsoc_sdram_slave_p1_act_n;
wire [31:0] soc_netsoc_sdram_slave_p1_wrdata;
wire soc_netsoc_sdram_slave_p1_wrdata_en;
wire [3:0] soc_netsoc_sdram_slave_p1_wrdata_mask;
wire soc_netsoc_sdram_slave_p1_rddata_en;
reg [31:0] soc_netsoc_sdram_slave_p1_rddata = 32'd0;
reg soc_netsoc_sdram_slave_p1_rddata_valid = 1'd0;
wire [13:0] soc_netsoc_sdram_slave_p2_address;
wire [2:0] soc_netsoc_sdram_slave_p2_bank;
wire soc_netsoc_sdram_slave_p2_cas_n;
wire soc_netsoc_sdram_slave_p2_cs_n;
wire soc_netsoc_sdram_slave_p2_ras_n;
wire soc_netsoc_sdram_slave_p2_we_n;
wire soc_netsoc_sdram_slave_p2_cke;
wire soc_netsoc_sdram_slave_p2_odt;
wire soc_netsoc_sdram_slave_p2_reset_n;
wire soc_netsoc_sdram_slave_p2_act_n;
wire [31:0] soc_netsoc_sdram_slave_p2_wrdata;
wire soc_netsoc_sdram_slave_p2_wrdata_en;
wire [3:0] soc_netsoc_sdram_slave_p2_wrdata_mask;
wire soc_netsoc_sdram_slave_p2_rddata_en;
reg [31:0] soc_netsoc_sdram_slave_p2_rddata = 32'd0;
reg soc_netsoc_sdram_slave_p2_rddata_valid = 1'd0;
wire [13:0] soc_netsoc_sdram_slave_p3_address;
wire [2:0] soc_netsoc_sdram_slave_p3_bank;
wire soc_netsoc_sdram_slave_p3_cas_n;
wire soc_netsoc_sdram_slave_p3_cs_n;
wire soc_netsoc_sdram_slave_p3_ras_n;
wire soc_netsoc_sdram_slave_p3_we_n;
wire soc_netsoc_sdram_slave_p3_cke;
wire soc_netsoc_sdram_slave_p3_odt;
wire soc_netsoc_sdram_slave_p3_reset_n;
wire soc_netsoc_sdram_slave_p3_act_n;
wire [31:0] soc_netsoc_sdram_slave_p3_wrdata;
wire soc_netsoc_sdram_slave_p3_wrdata_en;
wire [3:0] soc_netsoc_sdram_slave_p3_wrdata_mask;
wire soc_netsoc_sdram_slave_p3_rddata_en;
reg [31:0] soc_netsoc_sdram_slave_p3_rddata = 32'd0;
reg soc_netsoc_sdram_slave_p3_rddata_valid = 1'd0;
reg [13:0] soc_netsoc_sdram_master_p0_address = 14'd0;
reg [2:0] soc_netsoc_sdram_master_p0_bank = 3'd0;
reg soc_netsoc_sdram_master_p0_cas_n = 1'd1;
reg soc_netsoc_sdram_master_p0_cs_n = 1'd1;
reg soc_netsoc_sdram_master_p0_ras_n = 1'd1;
reg soc_netsoc_sdram_master_p0_we_n = 1'd1;
reg soc_netsoc_sdram_master_p0_cke = 1'd0;
reg soc_netsoc_sdram_master_p0_odt = 1'd0;
reg soc_netsoc_sdram_master_p0_reset_n = 1'd0;
reg soc_netsoc_sdram_master_p0_act_n = 1'd1;
reg [31:0] soc_netsoc_sdram_master_p0_wrdata = 32'd0;
reg soc_netsoc_sdram_master_p0_wrdata_en = 1'd0;
reg [3:0] soc_netsoc_sdram_master_p0_wrdata_mask = 4'd0;
reg soc_netsoc_sdram_master_p0_rddata_en = 1'd0;
wire [31:0] soc_netsoc_sdram_master_p0_rddata;
wire soc_netsoc_sdram_master_p0_rddata_valid;
reg [13:0] soc_netsoc_sdram_master_p1_address = 14'd0;
reg [2:0] soc_netsoc_sdram_master_p1_bank = 3'd0;
reg soc_netsoc_sdram_master_p1_cas_n = 1'd1;
reg soc_netsoc_sdram_master_p1_cs_n = 1'd1;
reg soc_netsoc_sdram_master_p1_ras_n = 1'd1;
reg soc_netsoc_sdram_master_p1_we_n = 1'd1;
reg soc_netsoc_sdram_master_p1_cke = 1'd0;
reg soc_netsoc_sdram_master_p1_odt = 1'd0;
reg soc_netsoc_sdram_master_p1_reset_n = 1'd0;
reg soc_netsoc_sdram_master_p1_act_n = 1'd1;
reg [31:0] soc_netsoc_sdram_master_p1_wrdata = 32'd0;
reg soc_netsoc_sdram_master_p1_wrdata_en = 1'd0;
reg [3:0] soc_netsoc_sdram_master_p1_wrdata_mask = 4'd0;
reg soc_netsoc_sdram_master_p1_rddata_en = 1'd0;
wire [31:0] soc_netsoc_sdram_master_p1_rddata;
wire soc_netsoc_sdram_master_p1_rddata_valid;
reg [13:0] soc_netsoc_sdram_master_p2_address = 14'd0;
reg [2:0] soc_netsoc_sdram_master_p2_bank = 3'd0;
reg soc_netsoc_sdram_master_p2_cas_n = 1'd1;
reg soc_netsoc_sdram_master_p2_cs_n = 1'd1;
reg soc_netsoc_sdram_master_p2_ras_n = 1'd1;
reg soc_netsoc_sdram_master_p2_we_n = 1'd1;
reg soc_netsoc_sdram_master_p2_cke = 1'd0;
reg soc_netsoc_sdram_master_p2_odt = 1'd0;
reg soc_netsoc_sdram_master_p2_reset_n = 1'd0;
reg soc_netsoc_sdram_master_p2_act_n = 1'd1;
reg [31:0] soc_netsoc_sdram_master_p2_wrdata = 32'd0;
reg soc_netsoc_sdram_master_p2_wrdata_en = 1'd0;
reg [3:0] soc_netsoc_sdram_master_p2_wrdata_mask = 4'd0;
reg soc_netsoc_sdram_master_p2_rddata_en = 1'd0;
wire [31:0] soc_netsoc_sdram_master_p2_rddata;
wire soc_netsoc_sdram_master_p2_rddata_valid;
reg [13:0] soc_netsoc_sdram_master_p3_address = 14'd0;
reg [2:0] soc_netsoc_sdram_master_p3_bank = 3'd0;
reg soc_netsoc_sdram_master_p3_cas_n = 1'd1;
reg soc_netsoc_sdram_master_p3_cs_n = 1'd1;
reg soc_netsoc_sdram_master_p3_ras_n = 1'd1;
reg soc_netsoc_sdram_master_p3_we_n = 1'd1;
reg soc_netsoc_sdram_master_p3_cke = 1'd0;
reg soc_netsoc_sdram_master_p3_odt = 1'd0;
reg soc_netsoc_sdram_master_p3_reset_n = 1'd0;
reg soc_netsoc_sdram_master_p3_act_n = 1'd1;
reg [31:0] soc_netsoc_sdram_master_p3_wrdata = 32'd0;
reg soc_netsoc_sdram_master_p3_wrdata_en = 1'd0;
reg [3:0] soc_netsoc_sdram_master_p3_wrdata_mask = 4'd0;
reg soc_netsoc_sdram_master_p3_rddata_en = 1'd0;
wire [31:0] soc_netsoc_sdram_master_p3_rddata;
wire soc_netsoc_sdram_master_p3_rddata_valid;
reg [3:0] soc_netsoc_sdram_storage = 4'd0;
reg soc_netsoc_sdram_re = 1'd0;
reg [5:0] soc_netsoc_sdram_phaseinjector0_command_storage = 6'd0;
reg soc_netsoc_sdram_phaseinjector0_command_re = 1'd0;
wire soc_netsoc_sdram_phaseinjector0_command_issue_re;
wire soc_netsoc_sdram_phaseinjector0_command_issue_r;
wire soc_netsoc_sdram_phaseinjector0_command_issue_we;
reg soc_netsoc_sdram_phaseinjector0_command_issue_w = 1'd0;
reg [13:0] soc_netsoc_sdram_phaseinjector0_address_storage = 14'd0;
reg soc_netsoc_sdram_phaseinjector0_address_re = 1'd0;
reg [2:0] soc_netsoc_sdram_phaseinjector0_baddress_storage = 3'd0;
reg soc_netsoc_sdram_phaseinjector0_baddress_re = 1'd0;
reg [31:0] soc_netsoc_sdram_phaseinjector0_wrdata_storage = 32'd0;
reg soc_netsoc_sdram_phaseinjector0_wrdata_re = 1'd0;
reg [31:0] soc_netsoc_sdram_phaseinjector0_status = 32'd0;
wire soc_netsoc_sdram_phaseinjector0_we;
reg [5:0] soc_netsoc_sdram_phaseinjector1_command_storage = 6'd0;
reg soc_netsoc_sdram_phaseinjector1_command_re = 1'd0;
wire soc_netsoc_sdram_phaseinjector1_command_issue_re;
wire soc_netsoc_sdram_phaseinjector1_command_issue_r;
wire soc_netsoc_sdram_phaseinjector1_command_issue_we;
reg soc_netsoc_sdram_phaseinjector1_command_issue_w = 1'd0;
reg [13:0] soc_netsoc_sdram_phaseinjector1_address_storage = 14'd0;
reg soc_netsoc_sdram_phaseinjector1_address_re = 1'd0;
reg [2:0] soc_netsoc_sdram_phaseinjector1_baddress_storage = 3'd0;
reg soc_netsoc_sdram_phaseinjector1_baddress_re = 1'd0;
reg [31:0] soc_netsoc_sdram_phaseinjector1_wrdata_storage = 32'd0;
reg soc_netsoc_sdram_phaseinjector1_wrdata_re = 1'd0;
reg [31:0] soc_netsoc_sdram_phaseinjector1_status = 32'd0;
wire soc_netsoc_sdram_phaseinjector1_we;
reg [5:0] soc_netsoc_sdram_phaseinjector2_command_storage = 6'd0;
reg soc_netsoc_sdram_phaseinjector2_command_re = 1'd0;
wire soc_netsoc_sdram_phaseinjector2_command_issue_re;
wire soc_netsoc_sdram_phaseinjector2_command_issue_r;
wire soc_netsoc_sdram_phaseinjector2_command_issue_we;
reg soc_netsoc_sdram_phaseinjector2_command_issue_w = 1'd0;
reg [13:0] soc_netsoc_sdram_phaseinjector2_address_storage = 14'd0;
reg soc_netsoc_sdram_phaseinjector2_address_re = 1'd0;
reg [2:0] soc_netsoc_sdram_phaseinjector2_baddress_storage = 3'd0;
reg soc_netsoc_sdram_phaseinjector2_baddress_re = 1'd0;
reg [31:0] soc_netsoc_sdram_phaseinjector2_wrdata_storage = 32'd0;
reg soc_netsoc_sdram_phaseinjector2_wrdata_re = 1'd0;
reg [31:0] soc_netsoc_sdram_phaseinjector2_status = 32'd0;
wire soc_netsoc_sdram_phaseinjector2_we;
reg [5:0] soc_netsoc_sdram_phaseinjector3_command_storage = 6'd0;
reg soc_netsoc_sdram_phaseinjector3_command_re = 1'd0;
wire soc_netsoc_sdram_phaseinjector3_command_issue_re;
wire soc_netsoc_sdram_phaseinjector3_command_issue_r;
wire soc_netsoc_sdram_phaseinjector3_command_issue_we;
reg soc_netsoc_sdram_phaseinjector3_command_issue_w = 1'd0;
reg [13:0] soc_netsoc_sdram_phaseinjector3_address_storage = 14'd0;
reg soc_netsoc_sdram_phaseinjector3_address_re = 1'd0;
reg [2:0] soc_netsoc_sdram_phaseinjector3_baddress_storage = 3'd0;
reg soc_netsoc_sdram_phaseinjector3_baddress_re = 1'd0;
reg [31:0] soc_netsoc_sdram_phaseinjector3_wrdata_storage = 32'd0;
reg soc_netsoc_sdram_phaseinjector3_wrdata_re = 1'd0;
reg [31:0] soc_netsoc_sdram_phaseinjector3_status = 32'd0;
wire soc_netsoc_sdram_phaseinjector3_we;
wire soc_netsoc_sdram_interface_bank0_valid;
wire soc_netsoc_sdram_interface_bank0_ready;
wire soc_netsoc_sdram_interface_bank0_we;
wire [20:0] soc_netsoc_sdram_interface_bank0_addr;
wire soc_netsoc_sdram_interface_bank0_lock;
wire soc_netsoc_sdram_interface_bank0_wdata_ready;
wire soc_netsoc_sdram_interface_bank0_rdata_valid;
wire soc_netsoc_sdram_interface_bank1_valid;
wire soc_netsoc_sdram_interface_bank1_ready;
wire soc_netsoc_sdram_interface_bank1_we;
wire [20:0] soc_netsoc_sdram_interface_bank1_addr;
wire soc_netsoc_sdram_interface_bank1_lock;
wire soc_netsoc_sdram_interface_bank1_wdata_ready;
wire soc_netsoc_sdram_interface_bank1_rdata_valid;
wire soc_netsoc_sdram_interface_bank2_valid;
wire soc_netsoc_sdram_interface_bank2_ready;
wire soc_netsoc_sdram_interface_bank2_we;
wire [20:0] soc_netsoc_sdram_interface_bank2_addr;
wire soc_netsoc_sdram_interface_bank2_lock;
wire soc_netsoc_sdram_interface_bank2_wdata_ready;
wire soc_netsoc_sdram_interface_bank2_rdata_valid;
wire soc_netsoc_sdram_interface_bank3_valid;
wire soc_netsoc_sdram_interface_bank3_ready;
wire soc_netsoc_sdram_interface_bank3_we;
wire [20:0] soc_netsoc_sdram_interface_bank3_addr;
wire soc_netsoc_sdram_interface_bank3_lock;
wire soc_netsoc_sdram_interface_bank3_wdata_ready;
wire soc_netsoc_sdram_interface_bank3_rdata_valid;
wire soc_netsoc_sdram_interface_bank4_valid;
wire soc_netsoc_sdram_interface_bank4_ready;
wire soc_netsoc_sdram_interface_bank4_we;
wire [20:0] soc_netsoc_sdram_interface_bank4_addr;
wire soc_netsoc_sdram_interface_bank4_lock;
wire soc_netsoc_sdram_interface_bank4_wdata_ready;
wire soc_netsoc_sdram_interface_bank4_rdata_valid;
wire soc_netsoc_sdram_interface_bank5_valid;
wire soc_netsoc_sdram_interface_bank5_ready;
wire soc_netsoc_sdram_interface_bank5_we;
wire [20:0] soc_netsoc_sdram_interface_bank5_addr;
wire soc_netsoc_sdram_interface_bank5_lock;
wire soc_netsoc_sdram_interface_bank5_wdata_ready;
wire soc_netsoc_sdram_interface_bank5_rdata_valid;
wire soc_netsoc_sdram_interface_bank6_valid;
wire soc_netsoc_sdram_interface_bank6_ready;
wire soc_netsoc_sdram_interface_bank6_we;
wire [20:0] soc_netsoc_sdram_interface_bank6_addr;
wire soc_netsoc_sdram_interface_bank6_lock;
wire soc_netsoc_sdram_interface_bank6_wdata_ready;
wire soc_netsoc_sdram_interface_bank6_rdata_valid;
wire soc_netsoc_sdram_interface_bank7_valid;
wire soc_netsoc_sdram_interface_bank7_ready;
wire soc_netsoc_sdram_interface_bank7_we;
wire [20:0] soc_netsoc_sdram_interface_bank7_addr;
wire soc_netsoc_sdram_interface_bank7_lock;
wire soc_netsoc_sdram_interface_bank7_wdata_ready;
wire soc_netsoc_sdram_interface_bank7_rdata_valid;
reg [127:0] soc_netsoc_sdram_interface_wdata = 128'd0;
reg [15:0] soc_netsoc_sdram_interface_wdata_we = 16'd0;
wire [127:0] soc_netsoc_sdram_interface_rdata;
reg [13:0] soc_netsoc_sdram_dfi_p0_address = 14'd0;
reg [2:0] soc_netsoc_sdram_dfi_p0_bank = 3'd0;
reg soc_netsoc_sdram_dfi_p0_cas_n = 1'd1;
reg soc_netsoc_sdram_dfi_p0_cs_n = 1'd1;
reg soc_netsoc_sdram_dfi_p0_ras_n = 1'd1;
reg soc_netsoc_sdram_dfi_p0_we_n = 1'd1;
wire soc_netsoc_sdram_dfi_p0_cke;
wire soc_netsoc_sdram_dfi_p0_odt;
wire soc_netsoc_sdram_dfi_p0_reset_n;
reg soc_netsoc_sdram_dfi_p0_act_n = 1'd1;
wire [31:0] soc_netsoc_sdram_dfi_p0_wrdata;
reg soc_netsoc_sdram_dfi_p0_wrdata_en = 1'd0;
wire [3:0] soc_netsoc_sdram_dfi_p0_wrdata_mask;
reg soc_netsoc_sdram_dfi_p0_rddata_en = 1'd0;
wire [31:0] soc_netsoc_sdram_dfi_p0_rddata;
wire soc_netsoc_sdram_dfi_p0_rddata_valid;
reg [13:0] soc_netsoc_sdram_dfi_p1_address = 14'd0;
reg [2:0] soc_netsoc_sdram_dfi_p1_bank = 3'd0;
reg soc_netsoc_sdram_dfi_p1_cas_n = 1'd1;
reg soc_netsoc_sdram_dfi_p1_cs_n = 1'd1;
reg soc_netsoc_sdram_dfi_p1_ras_n = 1'd1;
reg soc_netsoc_sdram_dfi_p1_we_n = 1'd1;
wire soc_netsoc_sdram_dfi_p1_cke;
wire soc_netsoc_sdram_dfi_p1_odt;
wire soc_netsoc_sdram_dfi_p1_reset_n;
reg soc_netsoc_sdram_dfi_p1_act_n = 1'd1;
wire [31:0] soc_netsoc_sdram_dfi_p1_wrdata;
reg soc_netsoc_sdram_dfi_p1_wrdata_en = 1'd0;
wire [3:0] soc_netsoc_sdram_dfi_p1_wrdata_mask;
reg soc_netsoc_sdram_dfi_p1_rddata_en = 1'd0;
wire [31:0] soc_netsoc_sdram_dfi_p1_rddata;
wire soc_netsoc_sdram_dfi_p1_rddata_valid;
reg [13:0] soc_netsoc_sdram_dfi_p2_address = 14'd0;
reg [2:0] soc_netsoc_sdram_dfi_p2_bank = 3'd0;
reg soc_netsoc_sdram_dfi_p2_cas_n = 1'd1;
reg soc_netsoc_sdram_dfi_p2_cs_n = 1'd1;
reg soc_netsoc_sdram_dfi_p2_ras_n = 1'd1;
reg soc_netsoc_sdram_dfi_p2_we_n = 1'd1;
wire soc_netsoc_sdram_dfi_p2_cke;
wire soc_netsoc_sdram_dfi_p2_odt;
wire soc_netsoc_sdram_dfi_p2_reset_n;
reg soc_netsoc_sdram_dfi_p2_act_n = 1'd1;
wire [31:0] soc_netsoc_sdram_dfi_p2_wrdata;
reg soc_netsoc_sdram_dfi_p2_wrdata_en = 1'd0;
wire [3:0] soc_netsoc_sdram_dfi_p2_wrdata_mask;
reg soc_netsoc_sdram_dfi_p2_rddata_en = 1'd0;
wire [31:0] soc_netsoc_sdram_dfi_p2_rddata;
wire soc_netsoc_sdram_dfi_p2_rddata_valid;
reg [13:0] soc_netsoc_sdram_dfi_p3_address = 14'd0;
reg [2:0] soc_netsoc_sdram_dfi_p3_bank = 3'd0;
reg soc_netsoc_sdram_dfi_p3_cas_n = 1'd1;
reg soc_netsoc_sdram_dfi_p3_cs_n = 1'd1;
reg soc_netsoc_sdram_dfi_p3_ras_n = 1'd1;
reg soc_netsoc_sdram_dfi_p3_we_n = 1'd1;
wire soc_netsoc_sdram_dfi_p3_cke;
wire soc_netsoc_sdram_dfi_p3_odt;
wire soc_netsoc_sdram_dfi_p3_reset_n;
reg soc_netsoc_sdram_dfi_p3_act_n = 1'd1;
wire [31:0] soc_netsoc_sdram_dfi_p3_wrdata;
reg soc_netsoc_sdram_dfi_p3_wrdata_en = 1'd0;
wire [3:0] soc_netsoc_sdram_dfi_p3_wrdata_mask;
reg soc_netsoc_sdram_dfi_p3_rddata_en = 1'd0;
wire [31:0] soc_netsoc_sdram_dfi_p3_rddata;
wire soc_netsoc_sdram_dfi_p3_rddata_valid;
reg soc_netsoc_sdram_cmd_valid = 1'd0;
reg soc_netsoc_sdram_cmd_ready = 1'd0;
reg soc_netsoc_sdram_cmd_last = 1'd0;
reg [13:0] soc_netsoc_sdram_cmd_payload_a = 14'd0;
reg [2:0] soc_netsoc_sdram_cmd_payload_ba = 3'd0;
reg soc_netsoc_sdram_cmd_payload_cas = 1'd0;
reg soc_netsoc_sdram_cmd_payload_ras = 1'd0;
reg soc_netsoc_sdram_cmd_payload_we = 1'd0;
reg soc_netsoc_sdram_cmd_payload_is_read = 1'd0;
reg soc_netsoc_sdram_cmd_payload_is_write = 1'd0;
wire soc_netsoc_sdram_wants_refresh;
wire soc_netsoc_sdram_wants_zqcs;
wire soc_netsoc_sdram_timer_wait;
wire soc_netsoc_sdram_timer_done0;
wire [8:0] soc_netsoc_sdram_timer_count0;
wire soc_netsoc_sdram_timer_done1;
reg [8:0] soc_netsoc_sdram_timer_count1 = 9'd468;
wire soc_netsoc_sdram_postponer_req_i;
reg soc_netsoc_sdram_postponer_req_o = 1'd0;
reg soc_netsoc_sdram_postponer_count = 1'd0;
reg soc_netsoc_sdram_sequencer_start0 = 1'd0;
wire soc_netsoc_sdram_sequencer_done0;
wire soc_netsoc_sdram_sequencer_start1;
reg soc_netsoc_sdram_sequencer_done1 = 1'd0;
reg [5:0] soc_netsoc_sdram_sequencer_counter = 6'd0;
reg soc_netsoc_sdram_sequencer_count = 1'd0;
wire soc_netsoc_sdram_zqcs_timer_wait;
wire soc_netsoc_sdram_zqcs_timer_done0;
wire [25:0] soc_netsoc_sdram_zqcs_timer_count0;
wire soc_netsoc_sdram_zqcs_timer_done1;
reg [25:0] soc_netsoc_sdram_zqcs_timer_count1 = 26'd59999999;
reg soc_netsoc_sdram_zqcs_executer_start = 1'd0;
reg soc_netsoc_sdram_zqcs_executer_done = 1'd0;
reg [4:0] soc_netsoc_sdram_zqcs_executer_counter = 5'd0;
wire soc_netsoc_sdram_bankmachine0_req_valid;
wire soc_netsoc_sdram_bankmachine0_req_ready;
wire soc_netsoc_sdram_bankmachine0_req_we;
wire [20:0] soc_netsoc_sdram_bankmachine0_req_addr;
wire soc_netsoc_sdram_bankmachine0_req_lock;
reg soc_netsoc_sdram_bankmachine0_req_wdata_ready = 1'd0;
reg soc_netsoc_sdram_bankmachine0_req_rdata_valid = 1'd0;
wire soc_netsoc_sdram_bankmachine0_refresh_req;
reg soc_netsoc_sdram_bankmachine0_refresh_gnt = 1'd0;
reg soc_netsoc_sdram_bankmachine0_cmd_valid = 1'd0;
reg soc_netsoc_sdram_bankmachine0_cmd_ready = 1'd0;
reg [13:0] soc_netsoc_sdram_bankmachine0_cmd_payload_a = 14'd0;
wire [2:0] soc_netsoc_sdram_bankmachine0_cmd_payload_ba;
reg soc_netsoc_sdram_bankmachine0_cmd_payload_cas = 1'd0;
reg soc_netsoc_sdram_bankmachine0_cmd_payload_ras = 1'd0;
reg soc_netsoc_sdram_bankmachine0_cmd_payload_we = 1'd0;
reg soc_netsoc_sdram_bankmachine0_cmd_payload_is_cmd = 1'd0;
reg soc_netsoc_sdram_bankmachine0_cmd_payload_is_read = 1'd0;
reg soc_netsoc_sdram_bankmachine0_cmd_payload_is_write = 1'd0;
reg soc_netsoc_sdram_bankmachine0_auto_precharge = 1'd0;
wire soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_sink_valid;
wire soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_sink_ready;
reg soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_sink_first = 1'd0;
reg soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_sink_last = 1'd0;
wire soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_sink_payload_we;
wire [20:0] soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_sink_payload_addr;
wire soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_valid;
wire soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_ready;
wire soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_first;
wire soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_last;
wire soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_payload_we;
wire [20:0] soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_payload_addr;
wire soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_we;
wire soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_writable;
wire soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_re;
wire soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_readable;
wire [23:0] soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_din;
wire [23:0] soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_dout;
reg [3:0] soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_level = 4'd0;
reg soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_replace = 1'd0;
reg [2:0] soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_produce = 3'd0;
reg [2:0] soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_consume = 3'd0;
reg [2:0] soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_wrport_adr = 3'd0;
wire [23:0] soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_wrport_dat_r;
wire soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_wrport_we;
wire [23:0] soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_wrport_dat_w;
wire soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_do_read;
wire [2:0] soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_rdport_adr;
wire [23:0] soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_rdport_dat_r;
wire soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_in_payload_we;
wire [20:0] soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_in_payload_addr;
wire soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_in_first;
wire soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_in_last;
wire soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_out_payload_we;
wire [20:0] soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_out_payload_addr;
wire soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_out_first;
wire soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_out_last;
wire soc_netsoc_sdram_bankmachine0_cmd_buffer_sink_valid;
wire soc_netsoc_sdram_bankmachine0_cmd_buffer_sink_ready;
wire soc_netsoc_sdram_bankmachine0_cmd_buffer_sink_first;
wire soc_netsoc_sdram_bankmachine0_cmd_buffer_sink_last;
wire soc_netsoc_sdram_bankmachine0_cmd_buffer_sink_payload_we;
wire [20:0] soc_netsoc_sdram_bankmachine0_cmd_buffer_sink_payload_addr;
wire soc_netsoc_sdram_bankmachine0_cmd_buffer_source_valid;
wire soc_netsoc_sdram_bankmachine0_cmd_buffer_source_ready;
wire soc_netsoc_sdram_bankmachine0_cmd_buffer_source_first;
wire soc_netsoc_sdram_bankmachine0_cmd_buffer_source_last;
reg soc_netsoc_sdram_bankmachine0_cmd_buffer_source_payload_we = 1'd0;
reg [20:0] soc_netsoc_sdram_bankmachine0_cmd_buffer_source_payload_addr = 21'd0;
wire soc_netsoc_sdram_bankmachine0_cmd_buffer_pipe_ce;
wire soc_netsoc_sdram_bankmachine0_cmd_buffer_busy;
reg soc_netsoc_sdram_bankmachine0_cmd_buffer_valid_n = 1'd0;
reg soc_netsoc_sdram_bankmachine0_cmd_buffer_first_n = 1'd0;
reg soc_netsoc_sdram_bankmachine0_cmd_buffer_last_n = 1'd0;
reg [13:0] soc_netsoc_sdram_bankmachine0_row = 14'd0;
reg soc_netsoc_sdram_bankmachine0_row_opened = 1'd0;
wire soc_netsoc_sdram_bankmachine0_row_hit;
reg soc_netsoc_sdram_bankmachine0_row_open = 1'd0;
reg soc_netsoc_sdram_bankmachine0_row_close = 1'd0;
reg soc_netsoc_sdram_bankmachine0_row_col_n_addr_sel = 1'd0;
wire soc_netsoc_sdram_bankmachine0_twtpcon_valid;
(* dont_touch = "true" *) reg soc_netsoc_sdram_bankmachine0_twtpcon_ready = 1'd1;
reg [2:0] soc_netsoc_sdram_bankmachine0_twtpcon_count = 3'd0;
wire soc_netsoc_sdram_bankmachine0_trccon_valid;
(* dont_touch = "true" *) reg soc_netsoc_sdram_bankmachine0_trccon_ready = 1'd1;
reg [1:0] soc_netsoc_sdram_bankmachine0_trccon_count = 2'd0;
wire soc_netsoc_sdram_bankmachine0_trascon_valid;
(* dont_touch = "true" *) reg soc_netsoc_sdram_bankmachine0_trascon_ready = 1'd1;
reg [1:0] soc_netsoc_sdram_bankmachine0_trascon_count = 2'd0;
wire soc_netsoc_sdram_bankmachine1_req_valid;
wire soc_netsoc_sdram_bankmachine1_req_ready;
wire soc_netsoc_sdram_bankmachine1_req_we;
wire [20:0] soc_netsoc_sdram_bankmachine1_req_addr;
wire soc_netsoc_sdram_bankmachine1_req_lock;
reg soc_netsoc_sdram_bankmachine1_req_wdata_ready = 1'd0;
reg soc_netsoc_sdram_bankmachine1_req_rdata_valid = 1'd0;
wire soc_netsoc_sdram_bankmachine1_refresh_req;
reg soc_netsoc_sdram_bankmachine1_refresh_gnt = 1'd0;
reg soc_netsoc_sdram_bankmachine1_cmd_valid = 1'd0;
reg soc_netsoc_sdram_bankmachine1_cmd_ready = 1'd0;
reg [13:0] soc_netsoc_sdram_bankmachine1_cmd_payload_a = 14'd0;
wire [2:0] soc_netsoc_sdram_bankmachine1_cmd_payload_ba;
reg soc_netsoc_sdram_bankmachine1_cmd_payload_cas = 1'd0;
reg soc_netsoc_sdram_bankmachine1_cmd_payload_ras = 1'd0;
reg soc_netsoc_sdram_bankmachine1_cmd_payload_we = 1'd0;
reg soc_netsoc_sdram_bankmachine1_cmd_payload_is_cmd = 1'd0;
reg soc_netsoc_sdram_bankmachine1_cmd_payload_is_read = 1'd0;
reg soc_netsoc_sdram_bankmachine1_cmd_payload_is_write = 1'd0;
reg soc_netsoc_sdram_bankmachine1_auto_precharge = 1'd0;
wire soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_sink_valid;
wire soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_sink_ready;
reg soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_sink_first = 1'd0;
reg soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_sink_last = 1'd0;
wire soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_sink_payload_we;
wire [20:0] soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_sink_payload_addr;
wire soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_valid;
wire soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_ready;
wire soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_first;
wire soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_last;
wire soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_payload_we;
wire [20:0] soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_payload_addr;
wire soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_we;
wire soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_writable;
wire soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_re;
wire soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_readable;
wire [23:0] soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_din;
wire [23:0] soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_dout;
reg [3:0] soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_level = 4'd0;
reg soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_replace = 1'd0;
reg [2:0] soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_produce = 3'd0;
reg [2:0] soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_consume = 3'd0;
reg [2:0] soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_wrport_adr = 3'd0;
wire [23:0] soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_wrport_dat_r;
wire soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_wrport_we;
wire [23:0] soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_wrport_dat_w;
wire soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_do_read;
wire [2:0] soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_rdport_adr;
wire [23:0] soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_rdport_dat_r;
wire soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_in_payload_we;
wire [20:0] soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_in_payload_addr;
wire soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_in_first;
wire soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_in_last;
wire soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_out_payload_we;
wire [20:0] soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_out_payload_addr;
wire soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_out_first;
wire soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_out_last;
wire soc_netsoc_sdram_bankmachine1_cmd_buffer_sink_valid;
wire soc_netsoc_sdram_bankmachine1_cmd_buffer_sink_ready;
wire soc_netsoc_sdram_bankmachine1_cmd_buffer_sink_first;
wire soc_netsoc_sdram_bankmachine1_cmd_buffer_sink_last;
wire soc_netsoc_sdram_bankmachine1_cmd_buffer_sink_payload_we;
wire [20:0] soc_netsoc_sdram_bankmachine1_cmd_buffer_sink_payload_addr;
wire soc_netsoc_sdram_bankmachine1_cmd_buffer_source_valid;
wire soc_netsoc_sdram_bankmachine1_cmd_buffer_source_ready;
wire soc_netsoc_sdram_bankmachine1_cmd_buffer_source_first;
wire soc_netsoc_sdram_bankmachine1_cmd_buffer_source_last;
reg soc_netsoc_sdram_bankmachine1_cmd_buffer_source_payload_we = 1'd0;
reg [20:0] soc_netsoc_sdram_bankmachine1_cmd_buffer_source_payload_addr = 21'd0;
wire soc_netsoc_sdram_bankmachine1_cmd_buffer_pipe_ce;
wire soc_netsoc_sdram_bankmachine1_cmd_buffer_busy;
reg soc_netsoc_sdram_bankmachine1_cmd_buffer_valid_n = 1'd0;
reg soc_netsoc_sdram_bankmachine1_cmd_buffer_first_n = 1'd0;
reg soc_netsoc_sdram_bankmachine1_cmd_buffer_last_n = 1'd0;
reg [13:0] soc_netsoc_sdram_bankmachine1_row = 14'd0;
reg soc_netsoc_sdram_bankmachine1_row_opened = 1'd0;
wire soc_netsoc_sdram_bankmachine1_row_hit;
reg soc_netsoc_sdram_bankmachine1_row_open = 1'd0;
reg soc_netsoc_sdram_bankmachine1_row_close = 1'd0;
reg soc_netsoc_sdram_bankmachine1_row_col_n_addr_sel = 1'd0;
wire soc_netsoc_sdram_bankmachine1_twtpcon_valid;
(* dont_touch = "true" *) reg soc_netsoc_sdram_bankmachine1_twtpcon_ready = 1'd1;
reg [2:0] soc_netsoc_sdram_bankmachine1_twtpcon_count = 3'd0;
wire soc_netsoc_sdram_bankmachine1_trccon_valid;
(* dont_touch = "true" *) reg soc_netsoc_sdram_bankmachine1_trccon_ready = 1'd1;
reg [1:0] soc_netsoc_sdram_bankmachine1_trccon_count = 2'd0;
wire soc_netsoc_sdram_bankmachine1_trascon_valid;
(* dont_touch = "true" *) reg soc_netsoc_sdram_bankmachine1_trascon_ready = 1'd1;
reg [1:0] soc_netsoc_sdram_bankmachine1_trascon_count = 2'd0;
wire soc_netsoc_sdram_bankmachine2_req_valid;
wire soc_netsoc_sdram_bankmachine2_req_ready;
wire soc_netsoc_sdram_bankmachine2_req_we;
wire [20:0] soc_netsoc_sdram_bankmachine2_req_addr;
wire soc_netsoc_sdram_bankmachine2_req_lock;
reg soc_netsoc_sdram_bankmachine2_req_wdata_ready = 1'd0;
reg soc_netsoc_sdram_bankmachine2_req_rdata_valid = 1'd0;
wire soc_netsoc_sdram_bankmachine2_refresh_req;
reg soc_netsoc_sdram_bankmachine2_refresh_gnt = 1'd0;
reg soc_netsoc_sdram_bankmachine2_cmd_valid = 1'd0;
reg soc_netsoc_sdram_bankmachine2_cmd_ready = 1'd0;
reg [13:0] soc_netsoc_sdram_bankmachine2_cmd_payload_a = 14'd0;
wire [2:0] soc_netsoc_sdram_bankmachine2_cmd_payload_ba;
reg soc_netsoc_sdram_bankmachine2_cmd_payload_cas = 1'd0;
reg soc_netsoc_sdram_bankmachine2_cmd_payload_ras = 1'd0;
reg soc_netsoc_sdram_bankmachine2_cmd_payload_we = 1'd0;
reg soc_netsoc_sdram_bankmachine2_cmd_payload_is_cmd = 1'd0;
reg soc_netsoc_sdram_bankmachine2_cmd_payload_is_read = 1'd0;
reg soc_netsoc_sdram_bankmachine2_cmd_payload_is_write = 1'd0;
reg soc_netsoc_sdram_bankmachine2_auto_precharge = 1'd0;
wire soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_sink_valid;
wire soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_sink_ready;
reg soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_sink_first = 1'd0;
reg soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_sink_last = 1'd0;
wire soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_sink_payload_we;
wire [20:0] soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_sink_payload_addr;
wire soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_valid;
wire soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_ready;
wire soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_first;
wire soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_last;
wire soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_payload_we;
wire [20:0] soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_payload_addr;
wire soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_we;
wire soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_writable;
wire soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_re;
wire soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_readable;
wire [23:0] soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_din;
wire [23:0] soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_dout;
reg [3:0] soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_level = 4'd0;
reg soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_replace = 1'd0;
reg [2:0] soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_produce = 3'd0;
reg [2:0] soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_consume = 3'd0;
reg [2:0] soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_wrport_adr = 3'd0;
wire [23:0] soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_wrport_dat_r;
wire soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_wrport_we;
wire [23:0] soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_wrport_dat_w;
wire soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_do_read;
wire [2:0] soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_rdport_adr;
wire [23:0] soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_rdport_dat_r;
wire soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_in_payload_we;
wire [20:0] soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_in_payload_addr;
wire soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_in_first;
wire soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_in_last;
wire soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_out_payload_we;
wire [20:0] soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_out_payload_addr;
wire soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_out_first;
wire soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_out_last;
wire soc_netsoc_sdram_bankmachine2_cmd_buffer_sink_valid;
wire soc_netsoc_sdram_bankmachine2_cmd_buffer_sink_ready;
wire soc_netsoc_sdram_bankmachine2_cmd_buffer_sink_first;
wire soc_netsoc_sdram_bankmachine2_cmd_buffer_sink_last;
wire soc_netsoc_sdram_bankmachine2_cmd_buffer_sink_payload_we;
wire [20:0] soc_netsoc_sdram_bankmachine2_cmd_buffer_sink_payload_addr;
wire soc_netsoc_sdram_bankmachine2_cmd_buffer_source_valid;
wire soc_netsoc_sdram_bankmachine2_cmd_buffer_source_ready;
wire soc_netsoc_sdram_bankmachine2_cmd_buffer_source_first;
wire soc_netsoc_sdram_bankmachine2_cmd_buffer_source_last;
reg soc_netsoc_sdram_bankmachine2_cmd_buffer_source_payload_we = 1'd0;
reg [20:0] soc_netsoc_sdram_bankmachine2_cmd_buffer_source_payload_addr = 21'd0;
wire soc_netsoc_sdram_bankmachine2_cmd_buffer_pipe_ce;
wire soc_netsoc_sdram_bankmachine2_cmd_buffer_busy;
reg soc_netsoc_sdram_bankmachine2_cmd_buffer_valid_n = 1'd0;
reg soc_netsoc_sdram_bankmachine2_cmd_buffer_first_n = 1'd0;
reg soc_netsoc_sdram_bankmachine2_cmd_buffer_last_n = 1'd0;
reg [13:0] soc_netsoc_sdram_bankmachine2_row = 14'd0;
reg soc_netsoc_sdram_bankmachine2_row_opened = 1'd0;
wire soc_netsoc_sdram_bankmachine2_row_hit;
reg soc_netsoc_sdram_bankmachine2_row_open = 1'd0;
reg soc_netsoc_sdram_bankmachine2_row_close = 1'd0;
reg soc_netsoc_sdram_bankmachine2_row_col_n_addr_sel = 1'd0;
wire soc_netsoc_sdram_bankmachine2_twtpcon_valid;
(* dont_touch = "true" *) reg soc_netsoc_sdram_bankmachine2_twtpcon_ready = 1'd1;
reg [2:0] soc_netsoc_sdram_bankmachine2_twtpcon_count = 3'd0;
wire soc_netsoc_sdram_bankmachine2_trccon_valid;
(* dont_touch = "true" *) reg soc_netsoc_sdram_bankmachine2_trccon_ready = 1'd1;
reg [1:0] soc_netsoc_sdram_bankmachine2_trccon_count = 2'd0;
wire soc_netsoc_sdram_bankmachine2_trascon_valid;
(* dont_touch = "true" *) reg soc_netsoc_sdram_bankmachine2_trascon_ready = 1'd1;
reg [1:0] soc_netsoc_sdram_bankmachine2_trascon_count = 2'd0;
wire soc_netsoc_sdram_bankmachine3_req_valid;
wire soc_netsoc_sdram_bankmachine3_req_ready;
wire soc_netsoc_sdram_bankmachine3_req_we;
wire [20:0] soc_netsoc_sdram_bankmachine3_req_addr;
wire soc_netsoc_sdram_bankmachine3_req_lock;
reg soc_netsoc_sdram_bankmachine3_req_wdata_ready = 1'd0;
reg soc_netsoc_sdram_bankmachine3_req_rdata_valid = 1'd0;
wire soc_netsoc_sdram_bankmachine3_refresh_req;
reg soc_netsoc_sdram_bankmachine3_refresh_gnt = 1'd0;
reg soc_netsoc_sdram_bankmachine3_cmd_valid = 1'd0;
reg soc_netsoc_sdram_bankmachine3_cmd_ready = 1'd0;
reg [13:0] soc_netsoc_sdram_bankmachine3_cmd_payload_a = 14'd0;
wire [2:0] soc_netsoc_sdram_bankmachine3_cmd_payload_ba;
reg soc_netsoc_sdram_bankmachine3_cmd_payload_cas = 1'd0;
reg soc_netsoc_sdram_bankmachine3_cmd_payload_ras = 1'd0;
reg soc_netsoc_sdram_bankmachine3_cmd_payload_we = 1'd0;
reg soc_netsoc_sdram_bankmachine3_cmd_payload_is_cmd = 1'd0;
reg soc_netsoc_sdram_bankmachine3_cmd_payload_is_read = 1'd0;
reg soc_netsoc_sdram_bankmachine3_cmd_payload_is_write = 1'd0;
reg soc_netsoc_sdram_bankmachine3_auto_precharge = 1'd0;
wire soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_sink_valid;
wire soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_sink_ready;
reg soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_sink_first = 1'd0;
reg soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_sink_last = 1'd0;
wire soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_sink_payload_we;
wire [20:0] soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_sink_payload_addr;
wire soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_valid;
wire soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_ready;
wire soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_first;
wire soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_last;
wire soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_payload_we;
wire [20:0] soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_payload_addr;
wire soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_we;
wire soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_writable;
wire soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_re;
wire soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_readable;
wire [23:0] soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_din;
wire [23:0] soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_dout;
reg [3:0] soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_level = 4'd0;
reg soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_replace = 1'd0;
reg [2:0] soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_produce = 3'd0;
reg [2:0] soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_consume = 3'd0;
reg [2:0] soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_wrport_adr = 3'd0;
wire [23:0] soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_wrport_dat_r;
wire soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_wrport_we;
wire [23:0] soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_wrport_dat_w;
wire soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_do_read;
wire [2:0] soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_rdport_adr;
wire [23:0] soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_rdport_dat_r;
wire soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_in_payload_we;
wire [20:0] soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_in_payload_addr;
wire soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_in_first;
wire soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_in_last;
wire soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_out_payload_we;
wire [20:0] soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_out_payload_addr;
wire soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_out_first;
wire soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_out_last;
wire soc_netsoc_sdram_bankmachine3_cmd_buffer_sink_valid;
wire soc_netsoc_sdram_bankmachine3_cmd_buffer_sink_ready;
wire soc_netsoc_sdram_bankmachine3_cmd_buffer_sink_first;
wire soc_netsoc_sdram_bankmachine3_cmd_buffer_sink_last;
wire soc_netsoc_sdram_bankmachine3_cmd_buffer_sink_payload_we;
wire [20:0] soc_netsoc_sdram_bankmachine3_cmd_buffer_sink_payload_addr;
wire soc_netsoc_sdram_bankmachine3_cmd_buffer_source_valid;
wire soc_netsoc_sdram_bankmachine3_cmd_buffer_source_ready;
wire soc_netsoc_sdram_bankmachine3_cmd_buffer_source_first;
wire soc_netsoc_sdram_bankmachine3_cmd_buffer_source_last;
reg soc_netsoc_sdram_bankmachine3_cmd_buffer_source_payload_we = 1'd0;
reg [20:0] soc_netsoc_sdram_bankmachine3_cmd_buffer_source_payload_addr = 21'd0;
wire soc_netsoc_sdram_bankmachine3_cmd_buffer_pipe_ce;
wire soc_netsoc_sdram_bankmachine3_cmd_buffer_busy;
reg soc_netsoc_sdram_bankmachine3_cmd_buffer_valid_n = 1'd0;
reg soc_netsoc_sdram_bankmachine3_cmd_buffer_first_n = 1'd0;
reg soc_netsoc_sdram_bankmachine3_cmd_buffer_last_n = 1'd0;
reg [13:0] soc_netsoc_sdram_bankmachine3_row = 14'd0;
reg soc_netsoc_sdram_bankmachine3_row_opened = 1'd0;
wire soc_netsoc_sdram_bankmachine3_row_hit;
reg soc_netsoc_sdram_bankmachine3_row_open = 1'd0;
reg soc_netsoc_sdram_bankmachine3_row_close = 1'd0;
reg soc_netsoc_sdram_bankmachine3_row_col_n_addr_sel = 1'd0;
wire soc_netsoc_sdram_bankmachine3_twtpcon_valid;
(* dont_touch = "true" *) reg soc_netsoc_sdram_bankmachine3_twtpcon_ready = 1'd1;
reg [2:0] soc_netsoc_sdram_bankmachine3_twtpcon_count = 3'd0;
wire soc_netsoc_sdram_bankmachine3_trccon_valid;
(* dont_touch = "true" *) reg soc_netsoc_sdram_bankmachine3_trccon_ready = 1'd1;
reg [1:0] soc_netsoc_sdram_bankmachine3_trccon_count = 2'd0;
wire soc_netsoc_sdram_bankmachine3_trascon_valid;
(* dont_touch = "true" *) reg soc_netsoc_sdram_bankmachine3_trascon_ready = 1'd1;
reg [1:0] soc_netsoc_sdram_bankmachine3_trascon_count = 2'd0;
wire soc_netsoc_sdram_bankmachine4_req_valid;
wire soc_netsoc_sdram_bankmachine4_req_ready;
wire soc_netsoc_sdram_bankmachine4_req_we;
wire [20:0] soc_netsoc_sdram_bankmachine4_req_addr;
wire soc_netsoc_sdram_bankmachine4_req_lock;
reg soc_netsoc_sdram_bankmachine4_req_wdata_ready = 1'd0;
reg soc_netsoc_sdram_bankmachine4_req_rdata_valid = 1'd0;
wire soc_netsoc_sdram_bankmachine4_refresh_req;
reg soc_netsoc_sdram_bankmachine4_refresh_gnt = 1'd0;
reg soc_netsoc_sdram_bankmachine4_cmd_valid = 1'd0;
reg soc_netsoc_sdram_bankmachine4_cmd_ready = 1'd0;
reg [13:0] soc_netsoc_sdram_bankmachine4_cmd_payload_a = 14'd0;
wire [2:0] soc_netsoc_sdram_bankmachine4_cmd_payload_ba;
reg soc_netsoc_sdram_bankmachine4_cmd_payload_cas = 1'd0;
reg soc_netsoc_sdram_bankmachine4_cmd_payload_ras = 1'd0;
reg soc_netsoc_sdram_bankmachine4_cmd_payload_we = 1'd0;
reg soc_netsoc_sdram_bankmachine4_cmd_payload_is_cmd = 1'd0;
reg soc_netsoc_sdram_bankmachine4_cmd_payload_is_read = 1'd0;
reg soc_netsoc_sdram_bankmachine4_cmd_payload_is_write = 1'd0;
reg soc_netsoc_sdram_bankmachine4_auto_precharge = 1'd0;
wire soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_sink_valid;
wire soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_sink_ready;
reg soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_sink_first = 1'd0;
reg soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_sink_last = 1'd0;
wire soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_sink_payload_we;
wire [20:0] soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_sink_payload_addr;
wire soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_valid;
wire soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_ready;
wire soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_first;
wire soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_last;
wire soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_payload_we;
wire [20:0] soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_payload_addr;
wire soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_we;
wire soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_writable;
wire soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_re;
wire soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_readable;
wire [23:0] soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_din;
wire [23:0] soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_dout;
reg [3:0] soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_level = 4'd0;
reg soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_replace = 1'd0;
reg [2:0] soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_produce = 3'd0;
reg [2:0] soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_consume = 3'd0;
reg [2:0] soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_wrport_adr = 3'd0;
wire [23:0] soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_wrport_dat_r;
wire soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_wrport_we;
wire [23:0] soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_wrport_dat_w;
wire soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_do_read;
wire [2:0] soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_rdport_adr;
wire [23:0] soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_rdport_dat_r;
wire soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_in_payload_we;
wire [20:0] soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_in_payload_addr;
wire soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_in_first;
wire soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_in_last;
wire soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_out_payload_we;
wire [20:0] soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_out_payload_addr;
wire soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_out_first;
wire soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_out_last;
wire soc_netsoc_sdram_bankmachine4_cmd_buffer_sink_valid;
wire soc_netsoc_sdram_bankmachine4_cmd_buffer_sink_ready;
wire soc_netsoc_sdram_bankmachine4_cmd_buffer_sink_first;
wire soc_netsoc_sdram_bankmachine4_cmd_buffer_sink_last;
wire soc_netsoc_sdram_bankmachine4_cmd_buffer_sink_payload_we;
wire [20:0] soc_netsoc_sdram_bankmachine4_cmd_buffer_sink_payload_addr;
wire soc_netsoc_sdram_bankmachine4_cmd_buffer_source_valid;
wire soc_netsoc_sdram_bankmachine4_cmd_buffer_source_ready;
wire soc_netsoc_sdram_bankmachine4_cmd_buffer_source_first;
wire soc_netsoc_sdram_bankmachine4_cmd_buffer_source_last;
reg soc_netsoc_sdram_bankmachine4_cmd_buffer_source_payload_we = 1'd0;
reg [20:0] soc_netsoc_sdram_bankmachine4_cmd_buffer_source_payload_addr = 21'd0;
wire soc_netsoc_sdram_bankmachine4_cmd_buffer_pipe_ce;
wire soc_netsoc_sdram_bankmachine4_cmd_buffer_busy;
reg soc_netsoc_sdram_bankmachine4_cmd_buffer_valid_n = 1'd0;
reg soc_netsoc_sdram_bankmachine4_cmd_buffer_first_n = 1'd0;
reg soc_netsoc_sdram_bankmachine4_cmd_buffer_last_n = 1'd0;
reg [13:0] soc_netsoc_sdram_bankmachine4_row = 14'd0;
reg soc_netsoc_sdram_bankmachine4_row_opened = 1'd0;
wire soc_netsoc_sdram_bankmachine4_row_hit;
reg soc_netsoc_sdram_bankmachine4_row_open = 1'd0;
reg soc_netsoc_sdram_bankmachine4_row_close = 1'd0;
reg soc_netsoc_sdram_bankmachine4_row_col_n_addr_sel = 1'd0;
wire soc_netsoc_sdram_bankmachine4_twtpcon_valid;
(* dont_touch = "true" *) reg soc_netsoc_sdram_bankmachine4_twtpcon_ready = 1'd1;
reg [2:0] soc_netsoc_sdram_bankmachine4_twtpcon_count = 3'd0;
wire soc_netsoc_sdram_bankmachine4_trccon_valid;
(* dont_touch = "true" *) reg soc_netsoc_sdram_bankmachine4_trccon_ready = 1'd1;
reg [1:0] soc_netsoc_sdram_bankmachine4_trccon_count = 2'd0;
wire soc_netsoc_sdram_bankmachine4_trascon_valid;
(* dont_touch = "true" *) reg soc_netsoc_sdram_bankmachine4_trascon_ready = 1'd1;
reg [1:0] soc_netsoc_sdram_bankmachine4_trascon_count = 2'd0;
wire soc_netsoc_sdram_bankmachine5_req_valid;
wire soc_netsoc_sdram_bankmachine5_req_ready;
wire soc_netsoc_sdram_bankmachine5_req_we;
wire [20:0] soc_netsoc_sdram_bankmachine5_req_addr;
wire soc_netsoc_sdram_bankmachine5_req_lock;
reg soc_netsoc_sdram_bankmachine5_req_wdata_ready = 1'd0;
reg soc_netsoc_sdram_bankmachine5_req_rdata_valid = 1'd0;
wire soc_netsoc_sdram_bankmachine5_refresh_req;
reg soc_netsoc_sdram_bankmachine5_refresh_gnt = 1'd0;
reg soc_netsoc_sdram_bankmachine5_cmd_valid = 1'd0;
reg soc_netsoc_sdram_bankmachine5_cmd_ready = 1'd0;
reg [13:0] soc_netsoc_sdram_bankmachine5_cmd_payload_a = 14'd0;
wire [2:0] soc_netsoc_sdram_bankmachine5_cmd_payload_ba;
reg soc_netsoc_sdram_bankmachine5_cmd_payload_cas = 1'd0;
reg soc_netsoc_sdram_bankmachine5_cmd_payload_ras = 1'd0;
reg soc_netsoc_sdram_bankmachine5_cmd_payload_we = 1'd0;
reg soc_netsoc_sdram_bankmachine5_cmd_payload_is_cmd = 1'd0;
reg soc_netsoc_sdram_bankmachine5_cmd_payload_is_read = 1'd0;
reg soc_netsoc_sdram_bankmachine5_cmd_payload_is_write = 1'd0;
reg soc_netsoc_sdram_bankmachine5_auto_precharge = 1'd0;
wire soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_sink_valid;
wire soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_sink_ready;
reg soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_sink_first = 1'd0;
reg soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_sink_last = 1'd0;
wire soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_sink_payload_we;
wire [20:0] soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_sink_payload_addr;
wire soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_valid;
wire soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_ready;
wire soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_first;
wire soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_last;
wire soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_payload_we;
wire [20:0] soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_payload_addr;
wire soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_we;
wire soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_writable;
wire soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_re;
wire soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_readable;
wire [23:0] soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_din;
wire [23:0] soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_dout;
reg [3:0] soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_level = 4'd0;
reg soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_replace = 1'd0;
reg [2:0] soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_produce = 3'd0;
reg [2:0] soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_consume = 3'd0;
reg [2:0] soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_wrport_adr = 3'd0;
wire [23:0] soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_wrport_dat_r;
wire soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_wrport_we;
wire [23:0] soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_wrport_dat_w;
wire soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_do_read;
wire [2:0] soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_rdport_adr;
wire [23:0] soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_rdport_dat_r;
wire soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_in_payload_we;
wire [20:0] soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_in_payload_addr;
wire soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_in_first;
wire soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_in_last;
wire soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_out_payload_we;
wire [20:0] soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_out_payload_addr;
wire soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_out_first;
wire soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_out_last;
wire soc_netsoc_sdram_bankmachine5_cmd_buffer_sink_valid;
wire soc_netsoc_sdram_bankmachine5_cmd_buffer_sink_ready;
wire soc_netsoc_sdram_bankmachine5_cmd_buffer_sink_first;
wire soc_netsoc_sdram_bankmachine5_cmd_buffer_sink_last;
wire soc_netsoc_sdram_bankmachine5_cmd_buffer_sink_payload_we;
wire [20:0] soc_netsoc_sdram_bankmachine5_cmd_buffer_sink_payload_addr;
wire soc_netsoc_sdram_bankmachine5_cmd_buffer_source_valid;
wire soc_netsoc_sdram_bankmachine5_cmd_buffer_source_ready;
wire soc_netsoc_sdram_bankmachine5_cmd_buffer_source_first;
wire soc_netsoc_sdram_bankmachine5_cmd_buffer_source_last;
reg soc_netsoc_sdram_bankmachine5_cmd_buffer_source_payload_we = 1'd0;
reg [20:0] soc_netsoc_sdram_bankmachine5_cmd_buffer_source_payload_addr = 21'd0;
wire soc_netsoc_sdram_bankmachine5_cmd_buffer_pipe_ce;
wire soc_netsoc_sdram_bankmachine5_cmd_buffer_busy;
reg soc_netsoc_sdram_bankmachine5_cmd_buffer_valid_n = 1'd0;
reg soc_netsoc_sdram_bankmachine5_cmd_buffer_first_n = 1'd0;
reg soc_netsoc_sdram_bankmachine5_cmd_buffer_last_n = 1'd0;
reg [13:0] soc_netsoc_sdram_bankmachine5_row = 14'd0;
reg soc_netsoc_sdram_bankmachine5_row_opened = 1'd0;
wire soc_netsoc_sdram_bankmachine5_row_hit;
reg soc_netsoc_sdram_bankmachine5_row_open = 1'd0;
reg soc_netsoc_sdram_bankmachine5_row_close = 1'd0;
reg soc_netsoc_sdram_bankmachine5_row_col_n_addr_sel = 1'd0;
wire soc_netsoc_sdram_bankmachine5_twtpcon_valid;
(* dont_touch = "true" *) reg soc_netsoc_sdram_bankmachine5_twtpcon_ready = 1'd1;
reg [2:0] soc_netsoc_sdram_bankmachine5_twtpcon_count = 3'd0;
wire soc_netsoc_sdram_bankmachine5_trccon_valid;
(* dont_touch = "true" *) reg soc_netsoc_sdram_bankmachine5_trccon_ready = 1'd1;
reg [1:0] soc_netsoc_sdram_bankmachine5_trccon_count = 2'd0;
wire soc_netsoc_sdram_bankmachine5_trascon_valid;
(* dont_touch = "true" *) reg soc_netsoc_sdram_bankmachine5_trascon_ready = 1'd1;
reg [1:0] soc_netsoc_sdram_bankmachine5_trascon_count = 2'd0;
wire soc_netsoc_sdram_bankmachine6_req_valid;
wire soc_netsoc_sdram_bankmachine6_req_ready;
wire soc_netsoc_sdram_bankmachine6_req_we;
wire [20:0] soc_netsoc_sdram_bankmachine6_req_addr;
wire soc_netsoc_sdram_bankmachine6_req_lock;
reg soc_netsoc_sdram_bankmachine6_req_wdata_ready = 1'd0;
reg soc_netsoc_sdram_bankmachine6_req_rdata_valid = 1'd0;
wire soc_netsoc_sdram_bankmachine6_refresh_req;
reg soc_netsoc_sdram_bankmachine6_refresh_gnt = 1'd0;
reg soc_netsoc_sdram_bankmachine6_cmd_valid = 1'd0;
reg soc_netsoc_sdram_bankmachine6_cmd_ready = 1'd0;
reg [13:0] soc_netsoc_sdram_bankmachine6_cmd_payload_a = 14'd0;
wire [2:0] soc_netsoc_sdram_bankmachine6_cmd_payload_ba;
reg soc_netsoc_sdram_bankmachine6_cmd_payload_cas = 1'd0;
reg soc_netsoc_sdram_bankmachine6_cmd_payload_ras = 1'd0;
reg soc_netsoc_sdram_bankmachine6_cmd_payload_we = 1'd0;
reg soc_netsoc_sdram_bankmachine6_cmd_payload_is_cmd = 1'd0;
reg soc_netsoc_sdram_bankmachine6_cmd_payload_is_read = 1'd0;
reg soc_netsoc_sdram_bankmachine6_cmd_payload_is_write = 1'd0;
reg soc_netsoc_sdram_bankmachine6_auto_precharge = 1'd0;
wire soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_sink_valid;
wire soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_sink_ready;
reg soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_sink_first = 1'd0;
reg soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_sink_last = 1'd0;
wire soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_sink_payload_we;
wire [20:0] soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_sink_payload_addr;
wire soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_valid;
wire soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_ready;
wire soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_first;
wire soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_last;
wire soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_payload_we;
wire [20:0] soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_payload_addr;
wire soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_we;
wire soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_writable;
wire soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_re;
wire soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_readable;
wire [23:0] soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_din;
wire [23:0] soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_dout;
reg [3:0] soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_level = 4'd0;
reg soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_replace = 1'd0;
reg [2:0] soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_produce = 3'd0;
reg [2:0] soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_consume = 3'd0;
reg [2:0] soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_wrport_adr = 3'd0;
wire [23:0] soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_wrport_dat_r;
wire soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_wrport_we;
wire [23:0] soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_wrport_dat_w;
wire soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_do_read;
wire [2:0] soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_rdport_adr;
wire [23:0] soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_rdport_dat_r;
wire soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_in_payload_we;
wire [20:0] soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_in_payload_addr;
wire soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_in_first;
wire soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_in_last;
wire soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_out_payload_we;
wire [20:0] soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_out_payload_addr;
wire soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_out_first;
wire soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_out_last;
wire soc_netsoc_sdram_bankmachine6_cmd_buffer_sink_valid;
wire soc_netsoc_sdram_bankmachine6_cmd_buffer_sink_ready;
wire soc_netsoc_sdram_bankmachine6_cmd_buffer_sink_first;
wire soc_netsoc_sdram_bankmachine6_cmd_buffer_sink_last;
wire soc_netsoc_sdram_bankmachine6_cmd_buffer_sink_payload_we;
wire [20:0] soc_netsoc_sdram_bankmachine6_cmd_buffer_sink_payload_addr;
wire soc_netsoc_sdram_bankmachine6_cmd_buffer_source_valid;
wire soc_netsoc_sdram_bankmachine6_cmd_buffer_source_ready;
wire soc_netsoc_sdram_bankmachine6_cmd_buffer_source_first;
wire soc_netsoc_sdram_bankmachine6_cmd_buffer_source_last;
reg soc_netsoc_sdram_bankmachine6_cmd_buffer_source_payload_we = 1'd0;
reg [20:0] soc_netsoc_sdram_bankmachine6_cmd_buffer_source_payload_addr = 21'd0;
wire soc_netsoc_sdram_bankmachine6_cmd_buffer_pipe_ce;
wire soc_netsoc_sdram_bankmachine6_cmd_buffer_busy;
reg soc_netsoc_sdram_bankmachine6_cmd_buffer_valid_n = 1'd0;
reg soc_netsoc_sdram_bankmachine6_cmd_buffer_first_n = 1'd0;
reg soc_netsoc_sdram_bankmachine6_cmd_buffer_last_n = 1'd0;
reg [13:0] soc_netsoc_sdram_bankmachine6_row = 14'd0;
reg soc_netsoc_sdram_bankmachine6_row_opened = 1'd0;
wire soc_netsoc_sdram_bankmachine6_row_hit;
reg soc_netsoc_sdram_bankmachine6_row_open = 1'd0;
reg soc_netsoc_sdram_bankmachine6_row_close = 1'd0;
reg soc_netsoc_sdram_bankmachine6_row_col_n_addr_sel = 1'd0;
wire soc_netsoc_sdram_bankmachine6_twtpcon_valid;
(* dont_touch = "true" *) reg soc_netsoc_sdram_bankmachine6_twtpcon_ready = 1'd1;
reg [2:0] soc_netsoc_sdram_bankmachine6_twtpcon_count = 3'd0;
wire soc_netsoc_sdram_bankmachine6_trccon_valid;
(* dont_touch = "true" *) reg soc_netsoc_sdram_bankmachine6_trccon_ready = 1'd1;
reg [1:0] soc_netsoc_sdram_bankmachine6_trccon_count = 2'd0;
wire soc_netsoc_sdram_bankmachine6_trascon_valid;
(* dont_touch = "true" *) reg soc_netsoc_sdram_bankmachine6_trascon_ready = 1'd1;
reg [1:0] soc_netsoc_sdram_bankmachine6_trascon_count = 2'd0;
wire soc_netsoc_sdram_bankmachine7_req_valid;
wire soc_netsoc_sdram_bankmachine7_req_ready;
wire soc_netsoc_sdram_bankmachine7_req_we;
wire [20:0] soc_netsoc_sdram_bankmachine7_req_addr;
wire soc_netsoc_sdram_bankmachine7_req_lock;
reg soc_netsoc_sdram_bankmachine7_req_wdata_ready = 1'd0;
reg soc_netsoc_sdram_bankmachine7_req_rdata_valid = 1'd0;
wire soc_netsoc_sdram_bankmachine7_refresh_req;
reg soc_netsoc_sdram_bankmachine7_refresh_gnt = 1'd0;
reg soc_netsoc_sdram_bankmachine7_cmd_valid = 1'd0;
reg soc_netsoc_sdram_bankmachine7_cmd_ready = 1'd0;
reg [13:0] soc_netsoc_sdram_bankmachine7_cmd_payload_a = 14'd0;
wire [2:0] soc_netsoc_sdram_bankmachine7_cmd_payload_ba;
reg soc_netsoc_sdram_bankmachine7_cmd_payload_cas = 1'd0;
reg soc_netsoc_sdram_bankmachine7_cmd_payload_ras = 1'd0;
reg soc_netsoc_sdram_bankmachine7_cmd_payload_we = 1'd0;
reg soc_netsoc_sdram_bankmachine7_cmd_payload_is_cmd = 1'd0;
reg soc_netsoc_sdram_bankmachine7_cmd_payload_is_read = 1'd0;
reg soc_netsoc_sdram_bankmachine7_cmd_payload_is_write = 1'd0;
reg soc_netsoc_sdram_bankmachine7_auto_precharge = 1'd0;
wire soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_sink_valid;
wire soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_sink_ready;
reg soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_sink_first = 1'd0;
reg soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_sink_last = 1'd0;
wire soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_sink_payload_we;
wire [20:0] soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_sink_payload_addr;
wire soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_valid;
wire soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_ready;
wire soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_first;
wire soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_last;
wire soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_payload_we;
wire [20:0] soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_payload_addr;
wire soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_we;
wire soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_writable;
wire soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_re;
wire soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_readable;
wire [23:0] soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_din;
wire [23:0] soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_dout;
reg [3:0] soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_level = 4'd0;
reg soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_replace = 1'd0;
reg [2:0] soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_produce = 3'd0;
reg [2:0] soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_consume = 3'd0;
reg [2:0] soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_wrport_adr = 3'd0;
wire [23:0] soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_wrport_dat_r;
wire soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_wrport_we;
wire [23:0] soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_wrport_dat_w;
wire soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_do_read;
wire [2:0] soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_rdport_adr;
wire [23:0] soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_rdport_dat_r;
wire soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_in_payload_we;
wire [20:0] soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_in_payload_addr;
wire soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_in_first;
wire soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_in_last;
wire soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_out_payload_we;
wire [20:0] soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_out_payload_addr;
wire soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_out_first;
wire soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_out_last;
wire soc_netsoc_sdram_bankmachine7_cmd_buffer_sink_valid;
wire soc_netsoc_sdram_bankmachine7_cmd_buffer_sink_ready;
wire soc_netsoc_sdram_bankmachine7_cmd_buffer_sink_first;
wire soc_netsoc_sdram_bankmachine7_cmd_buffer_sink_last;
wire soc_netsoc_sdram_bankmachine7_cmd_buffer_sink_payload_we;
wire [20:0] soc_netsoc_sdram_bankmachine7_cmd_buffer_sink_payload_addr;
wire soc_netsoc_sdram_bankmachine7_cmd_buffer_source_valid;
wire soc_netsoc_sdram_bankmachine7_cmd_buffer_source_ready;
wire soc_netsoc_sdram_bankmachine7_cmd_buffer_source_first;
wire soc_netsoc_sdram_bankmachine7_cmd_buffer_source_last;
reg soc_netsoc_sdram_bankmachine7_cmd_buffer_source_payload_we = 1'd0;
reg [20:0] soc_netsoc_sdram_bankmachine7_cmd_buffer_source_payload_addr = 21'd0;
wire soc_netsoc_sdram_bankmachine7_cmd_buffer_pipe_ce;
wire soc_netsoc_sdram_bankmachine7_cmd_buffer_busy;
reg soc_netsoc_sdram_bankmachine7_cmd_buffer_valid_n = 1'd0;
reg soc_netsoc_sdram_bankmachine7_cmd_buffer_first_n = 1'd0;
reg soc_netsoc_sdram_bankmachine7_cmd_buffer_last_n = 1'd0;
reg [13:0] soc_netsoc_sdram_bankmachine7_row = 14'd0;
reg soc_netsoc_sdram_bankmachine7_row_opened = 1'd0;
wire soc_netsoc_sdram_bankmachine7_row_hit;
reg soc_netsoc_sdram_bankmachine7_row_open = 1'd0;
reg soc_netsoc_sdram_bankmachine7_row_close = 1'd0;
reg soc_netsoc_sdram_bankmachine7_row_col_n_addr_sel = 1'd0;
wire soc_netsoc_sdram_bankmachine7_twtpcon_valid;
(* dont_touch = "true" *) reg soc_netsoc_sdram_bankmachine7_twtpcon_ready = 1'd1;
reg [2:0] soc_netsoc_sdram_bankmachine7_twtpcon_count = 3'd0;
wire soc_netsoc_sdram_bankmachine7_trccon_valid;
(* dont_touch = "true" *) reg soc_netsoc_sdram_bankmachine7_trccon_ready = 1'd1;
reg [1:0] soc_netsoc_sdram_bankmachine7_trccon_count = 2'd0;
wire soc_netsoc_sdram_bankmachine7_trascon_valid;
(* dont_touch = "true" *) reg soc_netsoc_sdram_bankmachine7_trascon_ready = 1'd1;
reg [1:0] soc_netsoc_sdram_bankmachine7_trascon_count = 2'd0;
wire soc_netsoc_sdram_ras_allowed;
wire soc_netsoc_sdram_cas_allowed;
reg soc_netsoc_sdram_choose_cmd_want_reads = 1'd0;
reg soc_netsoc_sdram_choose_cmd_want_writes = 1'd0;
reg soc_netsoc_sdram_choose_cmd_want_cmds = 1'd0;
reg soc_netsoc_sdram_choose_cmd_want_activates = 1'd0;
wire soc_netsoc_sdram_choose_cmd_cmd_valid;
reg soc_netsoc_sdram_choose_cmd_cmd_ready = 1'd0;
wire [13:0] soc_netsoc_sdram_choose_cmd_cmd_payload_a;
wire [2:0] soc_netsoc_sdram_choose_cmd_cmd_payload_ba;
reg soc_netsoc_sdram_choose_cmd_cmd_payload_cas = 1'd0;
reg soc_netsoc_sdram_choose_cmd_cmd_payload_ras = 1'd0;
reg soc_netsoc_sdram_choose_cmd_cmd_payload_we = 1'd0;
wire soc_netsoc_sdram_choose_cmd_cmd_payload_is_cmd;
wire soc_netsoc_sdram_choose_cmd_cmd_payload_is_read;
wire soc_netsoc_sdram_choose_cmd_cmd_payload_is_write;
reg [7:0] soc_netsoc_sdram_choose_cmd_valids = 8'd0;
wire [7:0] soc_netsoc_sdram_choose_cmd_request;
reg [2:0] soc_netsoc_sdram_choose_cmd_grant = 3'd0;
wire soc_netsoc_sdram_choose_cmd_ce;
reg soc_netsoc_sdram_choose_req_want_reads = 1'd0;
reg soc_netsoc_sdram_choose_req_want_writes = 1'd0;
reg soc_netsoc_sdram_choose_req_want_cmds = 1'd0;
reg soc_netsoc_sdram_choose_req_want_activates = 1'd0;
wire soc_netsoc_sdram_choose_req_cmd_valid;
reg soc_netsoc_sdram_choose_req_cmd_ready = 1'd0;
wire [13:0] soc_netsoc_sdram_choose_req_cmd_payload_a;
wire [2:0] soc_netsoc_sdram_choose_req_cmd_payload_ba;
reg soc_netsoc_sdram_choose_req_cmd_payload_cas = 1'd0;
reg soc_netsoc_sdram_choose_req_cmd_payload_ras = 1'd0;
reg soc_netsoc_sdram_choose_req_cmd_payload_we = 1'd0;
wire soc_netsoc_sdram_choose_req_cmd_payload_is_cmd;
wire soc_netsoc_sdram_choose_req_cmd_payload_is_read;
wire soc_netsoc_sdram_choose_req_cmd_payload_is_write;
reg [7:0] soc_netsoc_sdram_choose_req_valids = 8'd0;
wire [7:0] soc_netsoc_sdram_choose_req_request;
reg [2:0] soc_netsoc_sdram_choose_req_grant = 3'd0;
wire soc_netsoc_sdram_choose_req_ce;
reg [13:0] soc_netsoc_sdram_nop_a = 14'd0;
reg [2:0] soc_netsoc_sdram_nop_ba = 3'd0;
reg [1:0] soc_netsoc_sdram_steerer_sel0 = 2'd0;
reg [1:0] soc_netsoc_sdram_steerer_sel1 = 2'd0;
reg [1:0] soc_netsoc_sdram_steerer_sel2 = 2'd0;
reg [1:0] soc_netsoc_sdram_steerer_sel3 = 2'd0;
reg soc_netsoc_sdram_steerer0 = 1'd1;
reg soc_netsoc_sdram_steerer1 = 1'd1;
reg soc_netsoc_sdram_steerer2 = 1'd1;
reg soc_netsoc_sdram_steerer3 = 1'd1;
reg soc_netsoc_sdram_steerer4 = 1'd1;
reg soc_netsoc_sdram_steerer5 = 1'd1;
reg soc_netsoc_sdram_steerer6 = 1'd1;
reg soc_netsoc_sdram_steerer7 = 1'd1;
wire soc_netsoc_sdram_trrdcon_valid;
(* dont_touch = "true" *) reg soc_netsoc_sdram_trrdcon_ready = 1'd1;
reg soc_netsoc_sdram_trrdcon_count = 1'd0;
wire soc_netsoc_sdram_tfawcon_valid;
(* dont_touch = "true" *) reg soc_netsoc_sdram_tfawcon_ready = 1'd1;
wire [1:0] soc_netsoc_sdram_tfawcon_count;
reg [3:0] soc_netsoc_sdram_tfawcon_window = 4'd0;
wire soc_netsoc_sdram_tccdcon_valid;
(* dont_touch = "true" *) reg soc_netsoc_sdram_tccdcon_ready = 1'd1;
reg soc_netsoc_sdram_tccdcon_count = 1'd0;
wire soc_netsoc_sdram_twtrcon_valid;
(* dont_touch = "true" *) reg soc_netsoc_sdram_twtrcon_ready = 1'd1;
reg [2:0] soc_netsoc_sdram_twtrcon_count = 3'd0;
wire soc_netsoc_sdram_read_available;
wire soc_netsoc_sdram_write_available;
reg soc_netsoc_sdram_en0 = 1'd0;
wire soc_netsoc_sdram_max_time0;
reg [4:0] soc_netsoc_sdram_time0 = 5'd0;
reg soc_netsoc_sdram_en1 = 1'd0;
wire soc_netsoc_sdram_max_time1;
reg [3:0] soc_netsoc_sdram_time1 = 4'd0;
wire soc_netsoc_sdram_go_to_refresh;
wire soc_netsoc_sdram_bandwidth_update_re;
wire soc_netsoc_sdram_bandwidth_update_r;
wire soc_netsoc_sdram_bandwidth_update_we;
reg soc_netsoc_sdram_bandwidth_update_w = 1'd0;
reg [23:0] soc_netsoc_sdram_bandwidth_nreads_status = 24'd0;
wire soc_netsoc_sdram_bandwidth_nreads_we;
reg [23:0] soc_netsoc_sdram_bandwidth_nwrites_status = 24'd0;
wire soc_netsoc_sdram_bandwidth_nwrites_we;
reg [7:0] soc_netsoc_sdram_bandwidth_data_width_status = 8'd128;
wire soc_netsoc_sdram_bandwidth_data_width_we;
reg soc_netsoc_sdram_bandwidth_cmd_valid = 1'd0;
reg soc_netsoc_sdram_bandwidth_cmd_ready = 1'd0;
reg soc_netsoc_sdram_bandwidth_cmd_is_read = 1'd0;
reg soc_netsoc_sdram_bandwidth_cmd_is_write = 1'd0;
reg [23:0] soc_netsoc_sdram_bandwidth_counter = 24'd0;
reg soc_netsoc_sdram_bandwidth_period = 1'd0;
reg [23:0] soc_netsoc_sdram_bandwidth_nreads = 24'd0;
reg [23:0] soc_netsoc_sdram_bandwidth_nwrites = 24'd0;
reg [23:0] soc_netsoc_sdram_bandwidth_nreads_r = 24'd0;
reg [23:0] soc_netsoc_sdram_bandwidth_nwrites_r = 24'd0;
reg soc_netsoc_port_cmd_valid = 1'd0;
wire soc_netsoc_port_cmd_ready;
reg soc_netsoc_port_cmd_payload_we = 1'd0;
reg [23:0] soc_netsoc_port_cmd_payload_addr = 24'd0;
wire soc_netsoc_port_wdata_valid;
wire soc_netsoc_port_wdata_ready;
wire soc_netsoc_port_wdata_first;
wire soc_netsoc_port_wdata_last;
wire [127:0] soc_netsoc_port_wdata_payload_data;
wire [15:0] soc_netsoc_port_wdata_payload_we;
wire soc_netsoc_port_rdata_valid;
wire soc_netsoc_port_rdata_ready;
reg soc_netsoc_port_rdata_first = 1'd0;
reg soc_netsoc_port_rdata_last = 1'd0;
wire [127:0] soc_netsoc_port_rdata_payload_data;
wire [29:0] soc_netsoc_interface1_wb_sdram_adr;
wire [31:0] soc_netsoc_interface1_wb_sdram_dat_w;
wire [31:0] soc_netsoc_interface1_wb_sdram_dat_r;
wire [3:0] soc_netsoc_interface1_wb_sdram_sel;
wire soc_netsoc_interface1_wb_sdram_cyc;
wire soc_netsoc_interface1_wb_sdram_stb;
wire soc_netsoc_interface1_wb_sdram_ack;
wire soc_netsoc_interface1_wb_sdram_we;
wire [2:0] soc_netsoc_interface1_wb_sdram_cti;
wire [1:0] soc_netsoc_interface1_wb_sdram_bte;
wire soc_netsoc_interface1_wb_sdram_err;
wire [29:0] soc_netsoc_adr;
wire [127:0] soc_netsoc_dat_w;
wire [127:0] soc_netsoc_dat_r;
wire [15:0] soc_netsoc_sel;
reg soc_netsoc_cyc = 1'd0;
reg soc_netsoc_stb = 1'd0;
reg soc_netsoc_ack = 1'd0;
reg soc_netsoc_we = 1'd0;
wire [8:0] soc_netsoc_data_port_adr;
wire [127:0] soc_netsoc_data_port_dat_r;
reg [15:0] soc_netsoc_data_port_we = 16'd0;
reg [127:0] soc_netsoc_data_port_dat_w = 128'd0;
reg soc_netsoc_write_from_slave = 1'd0;
reg [1:0] soc_netsoc_adr_offset_r = 2'd0;
wire [8:0] soc_netsoc_tag_port_adr;
wire [23:0] soc_netsoc_tag_port_dat_r;
reg soc_netsoc_tag_port_we = 1'd0;
wire [23:0] soc_netsoc_tag_port_dat_w;
wire [22:0] soc_netsoc_tag_do_tag;
wire soc_netsoc_tag_do_dirty;
wire [22:0] soc_netsoc_tag_di_tag;
reg soc_netsoc_tag_di_dirty = 1'd0;
reg soc_netsoc_word_clr = 1'd0;
reg soc_netsoc_word_inc = 1'd0;
wire soc_netsoc_wdata_converter_sink_valid;
wire soc_netsoc_wdata_converter_sink_ready;
reg soc_netsoc_wdata_converter_sink_first = 1'd0;
reg soc_netsoc_wdata_converter_sink_last = 1'd0;
wire [127:0] soc_netsoc_wdata_converter_sink_payload_data;
wire [15:0] soc_netsoc_wdata_converter_sink_payload_we;
wire soc_netsoc_wdata_converter_source_valid;
wire soc_netsoc_wdata_converter_source_ready;
wire soc_netsoc_wdata_converter_source_first;
wire soc_netsoc_wdata_converter_source_last;
wire [127:0] soc_netsoc_wdata_converter_source_payload_data;
wire [15:0] soc_netsoc_wdata_converter_source_payload_we;
wire soc_netsoc_wdata_converter_converter_sink_valid;
wire soc_netsoc_wdata_converter_converter_sink_ready;
wire soc_netsoc_wdata_converter_converter_sink_first;
wire soc_netsoc_wdata_converter_converter_sink_last;
wire [143:0] soc_netsoc_wdata_converter_converter_sink_payload_data;
wire soc_netsoc_wdata_converter_converter_source_valid;
wire soc_netsoc_wdata_converter_converter_source_ready;
wire soc_netsoc_wdata_converter_converter_source_first;
wire soc_netsoc_wdata_converter_converter_source_last;
wire [143:0] soc_netsoc_wdata_converter_converter_source_payload_data;
wire soc_netsoc_wdata_converter_converter_source_payload_valid_token_count;
wire soc_netsoc_wdata_converter_source_source_valid;
wire soc_netsoc_wdata_converter_source_source_ready;
wire soc_netsoc_wdata_converter_source_source_first;
wire soc_netsoc_wdata_converter_source_source_last;
wire [143:0] soc_netsoc_wdata_converter_source_source_payload_data;
wire soc_netsoc_rdata_converter_sink_valid;
wire soc_netsoc_rdata_converter_sink_ready;
wire soc_netsoc_rdata_converter_sink_first;
wire soc_netsoc_rdata_converter_sink_last;
wire [127:0] soc_netsoc_rdata_converter_sink_payload_data;
wire soc_netsoc_rdata_converter_source_valid;
wire soc_netsoc_rdata_converter_source_ready;
wire soc_netsoc_rdata_converter_source_first;
wire soc_netsoc_rdata_converter_source_last;
wire [127:0] soc_netsoc_rdata_converter_source_payload_data;
wire soc_netsoc_rdata_converter_converter_sink_valid;
wire soc_netsoc_rdata_converter_converter_sink_ready;
wire soc_netsoc_rdata_converter_converter_sink_first;
wire soc_netsoc_rdata_converter_converter_sink_last;
wire [127:0] soc_netsoc_rdata_converter_converter_sink_payload_data;
wire soc_netsoc_rdata_converter_converter_source_valid;
wire soc_netsoc_rdata_converter_converter_source_ready;
wire soc_netsoc_rdata_converter_converter_source_first;
wire soc_netsoc_rdata_converter_converter_source_last;
wire [127:0] soc_netsoc_rdata_converter_converter_source_payload_data;
wire soc_netsoc_rdata_converter_converter_source_payload_valid_token_count;
wire soc_netsoc_rdata_converter_source_source_valid;
wire soc_netsoc_rdata_converter_source_source_ready;
wire soc_netsoc_rdata_converter_source_source_first;
wire soc_netsoc_rdata_converter_source_source_last;
wire [127:0] soc_netsoc_rdata_converter_source_source_payload_data;
reg soc_netsoc_count = 1'd0;
reg soc_reset_storage = 1'd0;
reg soc_reset_re = 1'd0;
(* dont_touch = "true" *) wire eth_rx_clk;
wire eth_rx_rst;
(* dont_touch = "true" *) wire eth_tx_clk;
wire eth_tx_rst;
wire soc_reset0;
wire soc_reset1;
reg [8:0] soc_counter = 9'd0;
wire soc_counter_done;
wire soc_counter_ce;
wire soc_liteethphymiitx_sink_sink_valid;
wire soc_liteethphymiitx_sink_sink_ready;
wire soc_liteethphymiitx_sink_sink_first;
wire soc_liteethphymiitx_sink_sink_last;
wire [7:0] soc_liteethphymiitx_sink_sink_payload_data;
wire soc_liteethphymiitx_sink_sink_payload_last_be;
wire soc_liteethphymiitx_sink_sink_payload_error;
wire soc_liteethphymiitx_converter_sink_valid;
wire soc_liteethphymiitx_converter_sink_ready;
reg soc_liteethphymiitx_converter_sink_first = 1'd0;
reg soc_liteethphymiitx_converter_sink_last = 1'd0;
wire [7:0] soc_liteethphymiitx_converter_sink_payload_data;
wire soc_liteethphymiitx_converter_source_valid;
wire soc_liteethphymiitx_converter_source_ready;
wire soc_liteethphymiitx_converter_source_first;
wire soc_liteethphymiitx_converter_source_last;
wire [3:0] soc_liteethphymiitx_converter_source_payload_data;
wire soc_liteethphymiitx_converter_converter_sink_valid;
wire soc_liteethphymiitx_converter_converter_sink_ready;
wire soc_liteethphymiitx_converter_converter_sink_first;
wire soc_liteethphymiitx_converter_converter_sink_last;
reg [7:0] soc_liteethphymiitx_converter_converter_sink_payload_data = 8'd0;
wire soc_liteethphymiitx_converter_converter_source_valid;
wire soc_liteethphymiitx_converter_converter_source_ready;
wire soc_liteethphymiitx_converter_converter_source_first;
wire soc_liteethphymiitx_converter_converter_source_last;
reg [3:0] soc_liteethphymiitx_converter_converter_source_payload_data = 4'd0;
wire soc_liteethphymiitx_converter_converter_source_payload_valid_token_count;
reg soc_liteethphymiitx_converter_converter_mux = 1'd0;
wire soc_liteethphymiitx_converter_converter_first;
wire soc_liteethphymiitx_converter_converter_last;
wire soc_liteethphymiitx_converter_source_source_valid;
wire soc_liteethphymiitx_converter_source_source_ready;
wire soc_liteethphymiitx_converter_source_source_first;
wire soc_liteethphymiitx_converter_source_source_last;
wire [3:0] soc_liteethphymiitx_converter_source_source_payload_data;
wire soc_liteethphymiirx_source_source_valid;
wire soc_liteethphymiirx_source_source_ready;
wire soc_liteethphymiirx_source_source_first;
wire soc_liteethphymiirx_source_source_last;
wire [7:0] soc_liteethphymiirx_source_source_payload_data;
reg soc_liteethphymiirx_source_source_payload_last_be = 1'd0;
reg soc_liteethphymiirx_source_source_payload_error = 1'd0;
reg soc_liteethphymiirx_converter_sink_valid = 1'd0;
wire soc_liteethphymiirx_converter_sink_ready;
reg soc_liteethphymiirx_converter_sink_first = 1'd0;
wire soc_liteethphymiirx_converter_sink_last;
reg [3:0] soc_liteethphymiirx_converter_sink_payload_data = 4'd0;
wire soc_liteethphymiirx_converter_source_valid;
wire soc_liteethphymiirx_converter_source_ready;
wire soc_liteethphymiirx_converter_source_first;
wire soc_liteethphymiirx_converter_source_last;
reg [7:0] soc_liteethphymiirx_converter_source_payload_data = 8'd0;
wire soc_liteethphymiirx_converter_converter_sink_valid;
wire soc_liteethphymiirx_converter_converter_sink_ready;
wire soc_liteethphymiirx_converter_converter_sink_first;
wire soc_liteethphymiirx_converter_converter_sink_last;
wire [3:0] soc_liteethphymiirx_converter_converter_sink_payload_data;
wire soc_liteethphymiirx_converter_converter_source_valid;
wire soc_liteethphymiirx_converter_converter_source_ready;
reg soc_liteethphymiirx_converter_converter_source_first = 1'd0;
reg soc_liteethphymiirx_converter_converter_source_last = 1'd0;
reg [7:0] soc_liteethphymiirx_converter_converter_source_payload_data = 8'd0;
reg [1:0] soc_liteethphymiirx_converter_converter_source_payload_valid_token_count = 2'd0;
reg soc_liteethphymiirx_converter_converter_demux = 1'd0;
wire soc_liteethphymiirx_converter_converter_load_part;
reg soc_liteethphymiirx_converter_converter_strobe_all = 1'd0;
wire soc_liteethphymiirx_converter_source_source_valid;
wire soc_liteethphymiirx_converter_source_source_ready;
wire soc_liteethphymiirx_converter_source_source_first;
wire soc_liteethphymiirx_converter_source_source_last;
wire [7:0] soc_liteethphymiirx_converter_source_source_payload_data;
reg soc_liteethphymiirx_converter_reset = 1'd0;
wire soc_mdc;
wire soc_oe;
wire soc_w;
reg [2:0] soc_storage = 3'd0;
reg soc_re = 1'd0;
reg soc_r = 1'd0;
reg soc_status = 1'd0;
wire soc_we;
wire soc_data_w;
wire soc_data_oe;
wire soc_data_r;
wire soc_tx_gap_inserter_sink_valid;
reg soc_tx_gap_inserter_sink_ready = 1'd0;
wire soc_tx_gap_inserter_sink_first;
wire soc_tx_gap_inserter_sink_last;
wire [7:0] soc_tx_gap_inserter_sink_payload_data;
wire soc_tx_gap_inserter_sink_payload_last_be;
wire soc_tx_gap_inserter_sink_payload_error;
reg soc_tx_gap_inserter_source_valid = 1'd0;
wire soc_tx_gap_inserter_source_ready;
reg soc_tx_gap_inserter_source_first = 1'd0;
reg soc_tx_gap_inserter_source_last = 1'd0;
reg [7:0] soc_tx_gap_inserter_source_payload_data = 8'd0;
reg soc_tx_gap_inserter_source_payload_last_be = 1'd0;
reg soc_tx_gap_inserter_source_payload_error = 1'd0;
reg [3:0] soc_tx_gap_inserter_counter = 4'd0;
reg soc_tx_gap_inserter_counter_reset = 1'd0;
reg soc_tx_gap_inserter_counter_ce = 1'd0;
reg soc_preamble_crc_status = 1'd1;
wire soc_preamble_crc_we;
reg [31:0] soc_preamble_errors_status = 32'd0;
wire soc_preamble_errors_we;
reg [31:0] soc_crc_errors_status = 32'd0;
wire soc_crc_errors_we;
wire soc_preamble_inserter_sink_valid;
reg soc_preamble_inserter_sink_ready = 1'd0;
wire soc_preamble_inserter_sink_first;
wire soc_preamble_inserter_sink_last;
wire [7:0] soc_preamble_inserter_sink_payload_data;
wire soc_preamble_inserter_sink_payload_last_be;
wire soc_preamble_inserter_sink_payload_error;
reg soc_preamble_inserter_source_valid = 1'd0;
wire soc_preamble_inserter_source_ready;
reg soc_preamble_inserter_source_first = 1'd0;
reg soc_preamble_inserter_source_last = 1'd0;
reg [7:0] soc_preamble_inserter_source_payload_data = 8'd0;
wire soc_preamble_inserter_source_payload_last_be;
reg soc_preamble_inserter_source_payload_error = 1'd0;
reg [63:0] soc_preamble_inserter_preamble = 64'd15372286728091293013;
reg [2:0] soc_preamble_inserter_cnt = 3'd0;
reg soc_preamble_inserter_clr_cnt = 1'd0;
reg soc_preamble_inserter_inc_cnt = 1'd0;
wire soc_preamble_checker_sink_valid;
reg soc_preamble_checker_sink_ready = 1'd0;
wire soc_preamble_checker_sink_first;
wire soc_preamble_checker_sink_last;
wire [7:0] soc_preamble_checker_sink_payload_data;
wire soc_preamble_checker_sink_payload_last_be;
wire soc_preamble_checker_sink_payload_error;
reg soc_preamble_checker_source_valid = 1'd0;
wire soc_preamble_checker_source_ready;
reg soc_preamble_checker_source_first = 1'd0;
reg soc_preamble_checker_source_last = 1'd0;
wire [7:0] soc_preamble_checker_source_payload_data;
wire soc_preamble_checker_source_payload_last_be;
reg soc_preamble_checker_source_payload_error = 1'd0;
reg soc_preamble_checker_error = 1'd0;
wire soc_crc32_inserter_sink_valid;
reg soc_crc32_inserter_sink_ready = 1'd0;
wire soc_crc32_inserter_sink_first;
wire soc_crc32_inserter_sink_last;
wire [7:0] soc_crc32_inserter_sink_payload_data;
wire soc_crc32_inserter_sink_payload_last_be;
wire soc_crc32_inserter_sink_payload_error;
reg soc_crc32_inserter_source_valid = 1'd0;
wire soc_crc32_inserter_source_ready;
reg soc_crc32_inserter_source_first = 1'd0;
reg soc_crc32_inserter_source_last = 1'd0;
reg [7:0] soc_crc32_inserter_source_payload_data = 8'd0;
reg soc_crc32_inserter_source_payload_last_be = 1'd0;
reg soc_crc32_inserter_source_payload_error = 1'd0;
reg [7:0] soc_crc32_inserter_data0 = 8'd0;
wire [31:0] soc_crc32_inserter_value;
wire soc_crc32_inserter_error;
wire [7:0] soc_crc32_inserter_data1;
wire [31:0] soc_crc32_inserter_last;
reg [31:0] soc_crc32_inserter_next = 32'd0;
reg [31:0] soc_crc32_inserter_reg = 32'd4294967295;
reg soc_crc32_inserter_ce = 1'd0;
reg soc_crc32_inserter_reset = 1'd0;
reg [1:0] soc_crc32_inserter_cnt = 2'd3;
wire soc_crc32_inserter_cnt_done;
reg soc_crc32_inserter_is_ongoing0 = 1'd0;
reg soc_crc32_inserter_is_ongoing1 = 1'd0;
wire soc_crc32_checker_sink_sink_valid;
reg soc_crc32_checker_sink_sink_ready = 1'd0;
wire soc_crc32_checker_sink_sink_first;
wire soc_crc32_checker_sink_sink_last;
wire [7:0] soc_crc32_checker_sink_sink_payload_data;
wire soc_crc32_checker_sink_sink_payload_last_be;
wire soc_crc32_checker_sink_sink_payload_error;
wire soc_crc32_checker_source_source_valid;
wire soc_crc32_checker_source_source_ready;
reg soc_crc32_checker_source_source_first = 1'd0;
wire soc_crc32_checker_source_source_last;
wire [7:0] soc_crc32_checker_source_source_payload_data;
wire soc_crc32_checker_source_source_payload_last_be;
reg soc_crc32_checker_source_source_payload_error = 1'd0;
wire soc_crc32_checker_error;
wire [7:0] soc_crc32_checker_crc_data0;
wire [31:0] soc_crc32_checker_crc_value;
wire soc_crc32_checker_crc_error;
wire [7:0] soc_crc32_checker_crc_data1;
wire [31:0] soc_crc32_checker_crc_last;
reg [31:0] soc_crc32_checker_crc_next = 32'd0;
reg [31:0] soc_crc32_checker_crc_reg = 32'd4294967295;
reg soc_crc32_checker_crc_ce = 1'd0;
reg soc_crc32_checker_crc_reset = 1'd0;
reg soc_crc32_checker_syncfifo_sink_valid = 1'd0;
wire soc_crc32_checker_syncfifo_sink_ready;
wire soc_crc32_checker_syncfifo_sink_first;
wire soc_crc32_checker_syncfifo_sink_last;
wire [7:0] soc_crc32_checker_syncfifo_sink_payload_data;
wire soc_crc32_checker_syncfifo_sink_payload_last_be;
wire soc_crc32_checker_syncfifo_sink_payload_error;
wire soc_crc32_checker_syncfifo_source_valid;
wire soc_crc32_checker_syncfifo_source_ready;
wire soc_crc32_checker_syncfifo_source_first;
wire soc_crc32_checker_syncfifo_source_last;
wire [7:0] soc_crc32_checker_syncfifo_source_payload_data;
wire soc_crc32_checker_syncfifo_source_payload_last_be;
wire soc_crc32_checker_syncfifo_source_payload_error;
wire soc_crc32_checker_syncfifo_syncfifo_we;
wire soc_crc32_checker_syncfifo_syncfifo_writable;
wire soc_crc32_checker_syncfifo_syncfifo_re;
wire soc_crc32_checker_syncfifo_syncfifo_readable;
wire [11:0] soc_crc32_checker_syncfifo_syncfifo_din;
wire [11:0] soc_crc32_checker_syncfifo_syncfifo_dout;
reg [2:0] soc_crc32_checker_syncfifo_level = 3'd0;
reg soc_crc32_checker_syncfifo_replace = 1'd0;
reg [2:0] soc_crc32_checker_syncfifo_produce = 3'd0;
reg [2:0] soc_crc32_checker_syncfifo_consume = 3'd0;
reg [2:0] soc_crc32_checker_syncfifo_wrport_adr = 3'd0;
wire [11:0] soc_crc32_checker_syncfifo_wrport_dat_r;
wire soc_crc32_checker_syncfifo_wrport_we;
wire [11:0] soc_crc32_checker_syncfifo_wrport_dat_w;
wire soc_crc32_checker_syncfifo_do_read;
wire [2:0] soc_crc32_checker_syncfifo_rdport_adr;
wire [11:0] soc_crc32_checker_syncfifo_rdport_dat_r;
wire [7:0] soc_crc32_checker_syncfifo_fifo_in_payload_data;
wire soc_crc32_checker_syncfifo_fifo_in_payload_last_be;
wire soc_crc32_checker_syncfifo_fifo_in_payload_error;
wire soc_crc32_checker_syncfifo_fifo_in_first;
wire soc_crc32_checker_syncfifo_fifo_in_last;
wire [7:0] soc_crc32_checker_syncfifo_fifo_out_payload_data;
wire soc_crc32_checker_syncfifo_fifo_out_payload_last_be;
wire soc_crc32_checker_syncfifo_fifo_out_payload_error;
wire soc_crc32_checker_syncfifo_fifo_out_first;
wire soc_crc32_checker_syncfifo_fifo_out_last;
reg soc_crc32_checker_fifo_reset = 1'd0;
wire soc_crc32_checker_fifo_in;
wire soc_crc32_checker_fifo_out;
wire soc_crc32_checker_fifo_full;
wire soc_ps_preamble_error_i;
wire soc_ps_preamble_error_o;
reg soc_ps_preamble_error_toggle_i = 1'd0;
wire soc_ps_preamble_error_toggle_o;
reg soc_ps_preamble_error_toggle_o_r = 1'd0;
wire soc_ps_crc_error_i;
wire soc_ps_crc_error_o;
reg soc_ps_crc_error_toggle_i = 1'd0;
wire soc_ps_crc_error_toggle_o;
reg soc_ps_crc_error_toggle_o_r = 1'd0;
wire soc_padding_inserter_sink_valid;
reg soc_padding_inserter_sink_ready = 1'd0;
wire soc_padding_inserter_sink_first;
wire soc_padding_inserter_sink_last;
wire [7:0] soc_padding_inserter_sink_payload_data;
wire soc_padding_inserter_sink_payload_last_be;
wire soc_padding_inserter_sink_payload_error;
reg soc_padding_inserter_source_valid = 1'd0;
wire soc_padding_inserter_source_ready;
reg soc_padding_inserter_source_first = 1'd0;
reg soc_padding_inserter_source_last = 1'd0;
reg [7:0] soc_padding_inserter_source_payload_data = 8'd0;
reg soc_padding_inserter_source_payload_last_be = 1'd0;
reg soc_padding_inserter_source_payload_error = 1'd0;
reg [15:0] soc_padding_inserter_counter = 16'd1;
wire soc_padding_inserter_counter_done;
reg soc_padding_inserter_counter_reset = 1'd0;
reg soc_padding_inserter_counter_ce = 1'd0;
wire soc_padding_checker_sink_valid;
wire soc_padding_checker_sink_ready;
wire soc_padding_checker_sink_first;
wire soc_padding_checker_sink_last;
wire [7:0] soc_padding_checker_sink_payload_data;
wire soc_padding_checker_sink_payload_last_be;
wire soc_padding_checker_sink_payload_error;
wire soc_padding_checker_source_valid;
wire soc_padding_checker_source_ready;
wire soc_padding_checker_source_first;
wire soc_padding_checker_source_last;
wire [7:0] soc_padding_checker_source_payload_data;
wire soc_padding_checker_source_payload_last_be;
wire soc_padding_checker_source_payload_error;
wire soc_tx_last_be_sink_valid;
wire soc_tx_last_be_sink_ready;
wire soc_tx_last_be_sink_first;
wire soc_tx_last_be_sink_last;
wire [7:0] soc_tx_last_be_sink_payload_data;
wire soc_tx_last_be_sink_payload_last_be;
wire soc_tx_last_be_sink_payload_error;
wire soc_tx_last_be_source_valid;
wire soc_tx_last_be_source_ready;
reg soc_tx_last_be_source_first = 1'd0;
wire soc_tx_last_be_source_last;
wire [7:0] soc_tx_last_be_source_payload_data;
reg soc_tx_last_be_source_payload_last_be = 1'd0;
reg soc_tx_last_be_source_payload_error = 1'd0;
reg soc_tx_last_be_ongoing = 1'd1;
wire soc_rx_last_be_sink_valid;
wire soc_rx_last_be_sink_ready;
wire soc_rx_last_be_sink_first;
wire soc_rx_last_be_sink_last;
wire [7:0] soc_rx_last_be_sink_payload_data;
wire soc_rx_last_be_sink_payload_last_be;
wire soc_rx_last_be_sink_payload_error;
wire soc_rx_last_be_source_valid;
wire soc_rx_last_be_source_ready;
wire soc_rx_last_be_source_first;
wire soc_rx_last_be_source_last;
wire [7:0] soc_rx_last_be_source_payload_data;
reg soc_rx_last_be_source_payload_last_be = 1'd0;
wire soc_rx_last_be_source_payload_error;
wire soc_tx_converter_sink_valid;
wire soc_tx_converter_sink_ready;
wire soc_tx_converter_sink_first;
wire soc_tx_converter_sink_last;
wire [31:0] soc_tx_converter_sink_payload_data;
wire [3:0] soc_tx_converter_sink_payload_last_be;
wire [3:0] soc_tx_converter_sink_payload_error;
wire soc_tx_converter_source_valid;
wire soc_tx_converter_source_ready;
wire soc_tx_converter_source_first;
wire soc_tx_converter_source_last;
wire [7:0] soc_tx_converter_source_payload_data;
wire soc_tx_converter_source_payload_last_be;
wire soc_tx_converter_source_payload_error;
wire soc_tx_converter_converter_sink_valid;
wire soc_tx_converter_converter_sink_ready;
wire soc_tx_converter_converter_sink_first;
wire soc_tx_converter_converter_sink_last;
reg [39:0] soc_tx_converter_converter_sink_payload_data = 40'd0;
wire soc_tx_converter_converter_source_valid;
wire soc_tx_converter_converter_source_ready;
wire soc_tx_converter_converter_source_first;
wire soc_tx_converter_converter_source_last;
reg [9:0] soc_tx_converter_converter_source_payload_data = 10'd0;
wire soc_tx_converter_converter_source_payload_valid_token_count;
reg [1:0] soc_tx_converter_converter_mux = 2'd0;
wire soc_tx_converter_converter_first;
wire soc_tx_converter_converter_last;
wire soc_tx_converter_source_source_valid;
wire soc_tx_converter_source_source_ready;
wire soc_tx_converter_source_source_first;
wire soc_tx_converter_source_source_last;
wire [9:0] soc_tx_converter_source_source_payload_data;
wire soc_rx_converter_sink_valid;
wire soc_rx_converter_sink_ready;
wire soc_rx_converter_sink_first;
wire soc_rx_converter_sink_last;
wire [7:0] soc_rx_converter_sink_payload_data;
wire soc_rx_converter_sink_payload_last_be;
wire soc_rx_converter_sink_payload_error;
wire soc_rx_converter_source_valid;
wire soc_rx_converter_source_ready;
wire soc_rx_converter_source_first;
wire soc_rx_converter_source_last;
reg [31:0] soc_rx_converter_source_payload_data = 32'd0;
reg [3:0] soc_rx_converter_source_payload_last_be = 4'd0;
reg [3:0] soc_rx_converter_source_payload_error = 4'd0;
wire soc_rx_converter_converter_sink_valid;
wire soc_rx_converter_converter_sink_ready;
wire soc_rx_converter_converter_sink_first;
wire soc_rx_converter_converter_sink_last;
wire [9:0] soc_rx_converter_converter_sink_payload_data;
wire soc_rx_converter_converter_source_valid;
wire soc_rx_converter_converter_source_ready;
reg soc_rx_converter_converter_source_first = 1'd0;
reg soc_rx_converter_converter_source_last = 1'd0;
reg [39:0] soc_rx_converter_converter_source_payload_data = 40'd0;
reg [2:0] soc_rx_converter_converter_source_payload_valid_token_count = 3'd0;
reg [1:0] soc_rx_converter_converter_demux = 2'd0;
wire soc_rx_converter_converter_load_part;
reg soc_rx_converter_converter_strobe_all = 1'd0;
wire soc_rx_converter_source_source_valid;
wire soc_rx_converter_source_source_ready;
wire soc_rx_converter_source_source_first;
wire soc_rx_converter_source_source_last;
wire [39:0] soc_rx_converter_source_source_payload_data;
wire soc_tx_cdc_sink_valid;
wire soc_tx_cdc_sink_ready;
wire soc_tx_cdc_sink_first;
wire soc_tx_cdc_sink_last;
wire [31:0] soc_tx_cdc_sink_payload_data;
wire [3:0] soc_tx_cdc_sink_payload_last_be;
wire [3:0] soc_tx_cdc_sink_payload_error;
wire soc_tx_cdc_source_valid;
wire soc_tx_cdc_source_ready;
wire soc_tx_cdc_source_first;
wire soc_tx_cdc_source_last;
wire [31:0] soc_tx_cdc_source_payload_data;
wire [3:0] soc_tx_cdc_source_payload_last_be;
wire [3:0] soc_tx_cdc_source_payload_error;
wire soc_tx_cdc_asyncfifo_we;
wire soc_tx_cdc_asyncfifo_writable;
wire soc_tx_cdc_asyncfifo_re;
wire soc_tx_cdc_asyncfifo_readable;
wire [41:0] soc_tx_cdc_asyncfifo_din;
wire [41:0] soc_tx_cdc_asyncfifo_dout;
wire soc_tx_cdc_graycounter0_ce;
(* dont_touch = "true" *) reg [6:0] soc_tx_cdc_graycounter0_q = 7'd0;
wire [6:0] soc_tx_cdc_graycounter0_q_next;
reg [6:0] soc_tx_cdc_graycounter0_q_binary = 7'd0;
reg [6:0] soc_tx_cdc_graycounter0_q_next_binary = 7'd0;
wire soc_tx_cdc_graycounter1_ce;
(* dont_touch = "true" *) reg [6:0] soc_tx_cdc_graycounter1_q = 7'd0;
wire [6:0] soc_tx_cdc_graycounter1_q_next;
reg [6:0] soc_tx_cdc_graycounter1_q_binary = 7'd0;
reg [6:0] soc_tx_cdc_graycounter1_q_next_binary = 7'd0;
wire [6:0] soc_tx_cdc_produce_rdomain;
wire [6:0] soc_tx_cdc_consume_wdomain;
wire [5:0] soc_tx_cdc_wrport_adr;
wire [41:0] soc_tx_cdc_wrport_dat_r;
wire soc_tx_cdc_wrport_we;
wire [41:0] soc_tx_cdc_wrport_dat_w;
wire [5:0] soc_tx_cdc_rdport_adr;
wire [41:0] soc_tx_cdc_rdport_dat_r;
wire [31:0] soc_tx_cdc_fifo_in_payload_data;
wire [3:0] soc_tx_cdc_fifo_in_payload_last_be;
wire [3:0] soc_tx_cdc_fifo_in_payload_error;
wire soc_tx_cdc_fifo_in_first;
wire soc_tx_cdc_fifo_in_last;
wire [31:0] soc_tx_cdc_fifo_out_payload_data;
wire [3:0] soc_tx_cdc_fifo_out_payload_last_be;
wire [3:0] soc_tx_cdc_fifo_out_payload_error;
wire soc_tx_cdc_fifo_out_first;
wire soc_tx_cdc_fifo_out_last;
wire soc_rx_cdc_sink_valid;
wire soc_rx_cdc_sink_ready;
wire soc_rx_cdc_sink_first;
wire soc_rx_cdc_sink_last;
wire [31:0] soc_rx_cdc_sink_payload_data;
wire [3:0] soc_rx_cdc_sink_payload_last_be;
wire [3:0] soc_rx_cdc_sink_payload_error;
wire soc_rx_cdc_source_valid;
wire soc_rx_cdc_source_ready;
wire soc_rx_cdc_source_first;
wire soc_rx_cdc_source_last;
wire [31:0] soc_rx_cdc_source_payload_data;
wire [3:0] soc_rx_cdc_source_payload_last_be;
wire [3:0] soc_rx_cdc_source_payload_error;
wire soc_rx_cdc_asyncfifo_we;
wire soc_rx_cdc_asyncfifo_writable;
wire soc_rx_cdc_asyncfifo_re;
wire soc_rx_cdc_asyncfifo_readable;
wire [41:0] soc_rx_cdc_asyncfifo_din;
wire [41:0] soc_rx_cdc_asyncfifo_dout;
wire soc_rx_cdc_graycounter0_ce;
(* dont_touch = "true" *) reg [6:0] soc_rx_cdc_graycounter0_q = 7'd0;
wire [6:0] soc_rx_cdc_graycounter0_q_next;
reg [6:0] soc_rx_cdc_graycounter0_q_binary = 7'd0;
reg [6:0] soc_rx_cdc_graycounter0_q_next_binary = 7'd0;
wire soc_rx_cdc_graycounter1_ce;
(* dont_touch = "true" *) reg [6:0] soc_rx_cdc_graycounter1_q = 7'd0;
wire [6:0] soc_rx_cdc_graycounter1_q_next;
reg [6:0] soc_rx_cdc_graycounter1_q_binary = 7'd0;
reg [6:0] soc_rx_cdc_graycounter1_q_next_binary = 7'd0;
wire [6:0] soc_rx_cdc_produce_rdomain;
wire [6:0] soc_rx_cdc_consume_wdomain;
wire [5:0] soc_rx_cdc_wrport_adr;
wire [41:0] soc_rx_cdc_wrport_dat_r;
wire soc_rx_cdc_wrport_we;
wire [41:0] soc_rx_cdc_wrport_dat_w;
wire [5:0] soc_rx_cdc_rdport_adr;
wire [41:0] soc_rx_cdc_rdport_dat_r;
wire [31:0] soc_rx_cdc_fifo_in_payload_data;
wire [3:0] soc_rx_cdc_fifo_in_payload_last_be;
wire [3:0] soc_rx_cdc_fifo_in_payload_error;
wire soc_rx_cdc_fifo_in_first;
wire soc_rx_cdc_fifo_in_last;
wire [31:0] soc_rx_cdc_fifo_out_payload_data;
wire [3:0] soc_rx_cdc_fifo_out_payload_last_be;
wire [3:0] soc_rx_cdc_fifo_out_payload_error;
wire soc_rx_cdc_fifo_out_first;
wire soc_rx_cdc_fifo_out_last;
wire soc_sink_valid;
wire soc_sink_ready;
wire soc_sink_first;
wire soc_sink_last;
wire [31:0] soc_sink_payload_data;
wire [3:0] soc_sink_payload_last_be;
wire [3:0] soc_sink_payload_error;
wire soc_source_valid;
wire soc_source_ready;
wire soc_source_first;
wire soc_source_last;
wire [31:0] soc_source_payload_data;
wire [3:0] soc_source_payload_last_be;
wire [3:0] soc_source_payload_error;
wire [29:0] soc_bus_adr;
wire [31:0] soc_bus_dat_w;
wire [31:0] soc_bus_dat_r;
wire [3:0] soc_bus_sel;
wire soc_bus_cyc;
wire soc_bus_stb;
wire soc_bus_ack;
wire soc_bus_we;
wire [2:0] soc_bus_cti;
wire [1:0] soc_bus_bte;
wire soc_bus_err;
wire soc_writer_sink_sink_valid;
reg soc_writer_sink_sink_ready = 1'd1;
wire soc_writer_sink_sink_first;
wire soc_writer_sink_sink_last;
wire [31:0] soc_writer_sink_sink_payload_data;
wire [3:0] soc_writer_sink_sink_payload_last_be;
wire [3:0] soc_writer_sink_sink_payload_error;
wire soc_writer_slot_status;
wire soc_writer_slot_we;
wire [31:0] soc_writer_length_status;
wire soc_writer_length_we;
reg [31:0] soc_writer_errors_status = 32'd0;
wire soc_writer_errors_we;
wire soc_writer_irq;
wire soc_writer_available_status;
wire soc_writer_available_pending;
wire soc_writer_available_trigger;
reg soc_writer_available_clear = 1'd0;
wire soc_writer_status_re;
wire soc_writer_status_r;
wire soc_writer_status_we;
wire soc_writer_status_w;
wire soc_writer_pending_re;
wire soc_writer_pending_r;
wire soc_writer_pending_we;
wire soc_writer_pending_w;
reg soc_writer_storage = 1'd0;
reg soc_writer_re = 1'd0;
reg [2:0] soc_writer_inc = 3'd0;
reg [31:0] soc_writer_counter = 32'd0;
reg soc_writer_counter_reset = 1'd0;
reg soc_writer_counter_ce = 1'd0;
reg soc_writer_slot = 1'd0;
reg soc_writer_slot_ce = 1'd0;
reg soc_writer_ongoing = 1'd0;
reg soc_writer_fifo_sink_valid = 1'd0;
wire soc_writer_fifo_sink_ready;
reg soc_writer_fifo_sink_first = 1'd0;
reg soc_writer_fifo_sink_last = 1'd0;
wire soc_writer_fifo_sink_payload_slot;
wire [31:0] soc_writer_fifo_sink_payload_length;
wire soc_writer_fifo_source_valid;
wire soc_writer_fifo_source_ready;
wire soc_writer_fifo_source_first;
wire soc_writer_fifo_source_last;
wire soc_writer_fifo_source_payload_slot;
wire [31:0] soc_writer_fifo_source_payload_length;
wire soc_writer_fifo_syncfifo_we;
wire soc_writer_fifo_syncfifo_writable;
wire soc_writer_fifo_syncfifo_re;
wire soc_writer_fifo_syncfifo_readable;
wire [34:0] soc_writer_fifo_syncfifo_din;
wire [34:0] soc_writer_fifo_syncfifo_dout;
reg [1:0] soc_writer_fifo_level = 2'd0;
reg soc_writer_fifo_replace = 1'd0;
reg soc_writer_fifo_produce = 1'd0;
reg soc_writer_fifo_consume = 1'd0;
reg soc_writer_fifo_wrport_adr = 1'd0;
wire [34:0] soc_writer_fifo_wrport_dat_r;
wire soc_writer_fifo_wrport_we;
wire [34:0] soc_writer_fifo_wrport_dat_w;
wire soc_writer_fifo_do_read;
wire soc_writer_fifo_rdport_adr;
wire [34:0] soc_writer_fifo_rdport_dat_r;
wire soc_writer_fifo_fifo_in_payload_slot;
wire [31:0] soc_writer_fifo_fifo_in_payload_length;
wire soc_writer_fifo_fifo_in_first;
wire soc_writer_fifo_fifo_in_last;
wire soc_writer_fifo_fifo_out_payload_slot;
wire [31:0] soc_writer_fifo_fifo_out_payload_length;
wire soc_writer_fifo_fifo_out_first;
wire soc_writer_fifo_fifo_out_last;
reg [8:0] soc_writer_memory0_adr = 9'd0;
wire [31:0] soc_writer_memory0_dat_r;
reg soc_writer_memory0_we = 1'd0;
reg [31:0] soc_writer_memory0_dat_w = 32'd0;
reg [8:0] soc_writer_memory1_adr = 9'd0;
wire [31:0] soc_writer_memory1_dat_r;
reg soc_writer_memory1_we = 1'd0;
reg [31:0] soc_writer_memory1_dat_w = 32'd0;
reg soc_reader_source_source_valid = 1'd0;
wire soc_reader_source_source_ready;
reg soc_reader_source_source_first = 1'd0;
reg soc_reader_source_source_last = 1'd0;
reg [31:0] soc_reader_source_source_payload_data = 32'd0;
reg [3:0] soc_reader_source_source_payload_last_be = 4'd0;
reg [3:0] soc_reader_source_source_payload_error = 4'd0;
wire soc_reader_start_re;
wire soc_reader_start_r;
wire soc_reader_start_we;
reg soc_reader_start_w = 1'd0;
wire soc_reader_ready_status;
wire soc_reader_ready_we;
wire [1:0] soc_reader_level_status;
wire soc_reader_level_we;
reg soc_reader_slot_storage = 1'd0;
reg soc_reader_slot_re = 1'd0;
reg [10:0] soc_reader_length_storage = 11'd0;
reg soc_reader_length_re = 1'd0;
wire soc_reader_irq;
wire soc_reader_done_status;
reg soc_reader_done_pending = 1'd0;
reg soc_reader_done_trigger = 1'd0;
reg soc_reader_done_clear = 1'd0;
wire soc_reader_eventmanager_status_re;
wire soc_reader_eventmanager_status_r;
wire soc_reader_eventmanager_status_we;
wire soc_reader_eventmanager_status_w;
wire soc_reader_eventmanager_pending_re;
wire soc_reader_eventmanager_pending_r;
wire soc_reader_eventmanager_pending_we;
wire soc_reader_eventmanager_pending_w;
reg soc_reader_eventmanager_storage = 1'd0;
reg soc_reader_eventmanager_re = 1'd0;
wire soc_reader_fifo_sink_valid;
wire soc_reader_fifo_sink_ready;
reg soc_reader_fifo_sink_first = 1'd0;
reg soc_reader_fifo_sink_last = 1'd0;
wire soc_reader_fifo_sink_payload_slot;
wire [10:0] soc_reader_fifo_sink_payload_length;
wire soc_reader_fifo_source_valid;
reg soc_reader_fifo_source_ready = 1'd0;
wire soc_reader_fifo_source_first;
wire soc_reader_fifo_source_last;
wire soc_reader_fifo_source_payload_slot;
wire [10:0] soc_reader_fifo_source_payload_length;
wire soc_reader_fifo_syncfifo_we;
wire soc_reader_fifo_syncfifo_writable;
wire soc_reader_fifo_syncfifo_re;
wire soc_reader_fifo_syncfifo_readable;
wire [13:0] soc_reader_fifo_syncfifo_din;
wire [13:0] soc_reader_fifo_syncfifo_dout;
reg [1:0] soc_reader_fifo_level = 2'd0;
reg soc_reader_fifo_replace = 1'd0;
reg soc_reader_fifo_produce = 1'd0;
reg soc_reader_fifo_consume = 1'd0;
reg soc_reader_fifo_wrport_adr = 1'd0;
wire [13:0] soc_reader_fifo_wrport_dat_r;
wire soc_reader_fifo_wrport_we;
wire [13:0] soc_reader_fifo_wrport_dat_w;
wire soc_reader_fifo_do_read;
wire soc_reader_fifo_rdport_adr;
wire [13:0] soc_reader_fifo_rdport_dat_r;
wire soc_reader_fifo_fifo_in_payload_slot;
wire [10:0] soc_reader_fifo_fifo_in_payload_length;
wire soc_reader_fifo_fifo_in_first;
wire soc_reader_fifo_fifo_in_last;
wire soc_reader_fifo_fifo_out_payload_slot;
wire [10:0] soc_reader_fifo_fifo_out_payload_length;
wire soc_reader_fifo_fifo_out_first;
wire soc_reader_fifo_fifo_out_last;
reg [10:0] soc_reader_counter = 11'd0;
reg soc_reader_counter_reset = 1'd0;
reg soc_reader_counter_ce = 1'd0;
wire soc_reader_last;
reg soc_reader_last_d = 1'd0;
wire [8:0] soc_reader_memory0_adr;
wire [31:0] soc_reader_memory0_dat_r;
wire [8:0] soc_reader_memory1_adr;
wire [31:0] soc_reader_memory1_dat_r;
wire soc_ev_irq;
wire [29:0] soc_sram0_bus_adr0;
wire [31:0] soc_sram0_bus_dat_w0;
wire [31:0] soc_sram0_bus_dat_r0;
wire [3:0] soc_sram0_bus_sel0;
wire soc_sram0_bus_cyc0;
wire soc_sram0_bus_stb0;
reg soc_sram0_bus_ack0 = 1'd0;
wire soc_sram0_bus_we0;
wire [2:0] soc_sram0_bus_cti0;
wire [1:0] soc_sram0_bus_bte0;
reg soc_sram0_bus_err0 = 1'd0;
wire [8:0] soc_sram0_adr0;
wire [31:0] soc_sram0_dat_r0;
wire [29:0] soc_sram1_bus_adr0;
wire [31:0] soc_sram1_bus_dat_w0;
wire [31:0] soc_sram1_bus_dat_r0;
wire [3:0] soc_sram1_bus_sel0;
wire soc_sram1_bus_cyc0;
wire soc_sram1_bus_stb0;
reg soc_sram1_bus_ack0 = 1'd0;
wire soc_sram1_bus_we0;
wire [2:0] soc_sram1_bus_cti0;
wire [1:0] soc_sram1_bus_bte0;
reg soc_sram1_bus_err0 = 1'd0;
wire [8:0] soc_sram1_adr0;
wire [31:0] soc_sram1_dat_r0;
wire [29:0] soc_sram0_bus_adr1;
wire [31:0] soc_sram0_bus_dat_w1;
wire [31:0] soc_sram0_bus_dat_r1;
wire [3:0] soc_sram0_bus_sel1;
wire soc_sram0_bus_cyc1;
wire soc_sram0_bus_stb1;
reg soc_sram0_bus_ack1 = 1'd0;
wire soc_sram0_bus_we1;
wire [2:0] soc_sram0_bus_cti1;
wire [1:0] soc_sram0_bus_bte1;
reg soc_sram0_bus_err1 = 1'd0;
wire [8:0] soc_sram0_adr1;
wire [31:0] soc_sram0_dat_r1;
reg [3:0] soc_sram0_we = 4'd0;
wire [31:0] soc_sram0_dat_w;
wire [29:0] soc_sram1_bus_adr1;
wire [31:0] soc_sram1_bus_dat_w1;
wire [31:0] soc_sram1_bus_dat_r1;
wire [3:0] soc_sram1_bus_sel1;
wire soc_sram1_bus_cyc1;
wire soc_sram1_bus_stb1;
reg soc_sram1_bus_ack1 = 1'd0;
wire soc_sram1_bus_we1;
wire [2:0] soc_sram1_bus_cti1;
wire [1:0] soc_sram1_bus_bte1;
reg soc_sram1_bus_err1 = 1'd0;
wire [8:0] soc_sram1_adr1;
wire [31:0] soc_sram1_dat_r1;
reg [3:0] soc_sram1_we = 4'd0;
wire [31:0] soc_sram1_dat_w;
reg [3:0] soc_slave_sel = 4'd0;
reg [3:0] soc_slave_sel_r = 4'd0;
reg vns_wb2csr_state = 1'd0;
reg vns_wb2csr_next_state = 1'd0;
reg [1:0] vns_refresher_state = 2'd0;
reg [1:0] vns_refresher_next_state = 2'd0;
reg [2:0] vns_bankmachine0_state = 3'd0;
reg [2:0] vns_bankmachine0_next_state = 3'd0;
reg [2:0] vns_bankmachine1_state = 3'd0;
reg [2:0] vns_bankmachine1_next_state = 3'd0;
reg [2:0] vns_bankmachine2_state = 3'd0;
reg [2:0] vns_bankmachine2_next_state = 3'd0;
reg [2:0] vns_bankmachine3_state = 3'd0;
reg [2:0] vns_bankmachine3_next_state = 3'd0;
reg [2:0] vns_bankmachine4_state = 3'd0;
reg [2:0] vns_bankmachine4_next_state = 3'd0;
reg [2:0] vns_bankmachine5_state = 3'd0;
reg [2:0] vns_bankmachine5_next_state = 3'd0;
reg [2:0] vns_bankmachine6_state = 3'd0;
reg [2:0] vns_bankmachine6_next_state = 3'd0;
reg [2:0] vns_bankmachine7_state = 3'd0;
reg [2:0] vns_bankmachine7_next_state = 3'd0;
reg [3:0] vns_multiplexer_state = 4'd0;
reg [3:0] vns_multiplexer_next_state = 4'd0;
wire vns_roundrobin0_request;
wire vns_roundrobin0_grant;
wire vns_roundrobin0_ce;
wire vns_roundrobin1_request;
wire vns_roundrobin1_grant;
wire vns_roundrobin1_ce;
wire vns_roundrobin2_request;
wire vns_roundrobin2_grant;
wire vns_roundrobin2_ce;
wire vns_roundrobin3_request;
wire vns_roundrobin3_grant;
wire vns_roundrobin3_ce;
wire vns_roundrobin4_request;
wire vns_roundrobin4_grant;
wire vns_roundrobin4_ce;
wire vns_roundrobin5_request;
wire vns_roundrobin5_grant;
wire vns_roundrobin5_ce;
wire vns_roundrobin6_request;
wire vns_roundrobin6_grant;
wire vns_roundrobin6_ce;
wire vns_roundrobin7_request;
wire vns_roundrobin7_grant;
wire vns_roundrobin7_ce;
reg [2:0] vns_rbank = 3'd0;
reg [2:0] vns_wbank = 3'd0;
reg vns_locked0 = 1'd0;
reg vns_locked1 = 1'd0;
reg vns_locked2 = 1'd0;
reg vns_locked3 = 1'd0;
reg vns_locked4 = 1'd0;
reg vns_locked5 = 1'd0;
reg vns_locked6 = 1'd0;
reg vns_locked7 = 1'd0;
reg vns_new_master_wdata_ready0 = 1'd0;
reg vns_new_master_wdata_ready1 = 1'd0;
reg vns_new_master_wdata_ready2 = 1'd0;
reg vns_new_master_rdata_valid0 = 1'd0;
reg vns_new_master_rdata_valid1 = 1'd0;
reg vns_new_master_rdata_valid2 = 1'd0;
reg vns_new_master_rdata_valid3 = 1'd0;
reg vns_new_master_rdata_valid4 = 1'd0;
reg vns_new_master_rdata_valid5 = 1'd0;
reg vns_new_master_rdata_valid6 = 1'd0;
reg vns_new_master_rdata_valid7 = 1'd0;
reg vns_new_master_rdata_valid8 = 1'd0;
reg vns_new_master_rdata_valid9 = 1'd0;
reg [2:0] vns_fullmemorywe_state = 3'd0;
reg [2:0] vns_fullmemorywe_next_state = 3'd0;
reg [1:0] vns_litedramwishbone2native_state = 2'd0;
reg [1:0] vns_litedramwishbone2native_next_state = 2'd0;
reg soc_netsoc_count_litedramwishbone2native_next_value = 1'd0;
reg soc_netsoc_count_litedramwishbone2native_next_value_ce = 1'd0;
reg vns_liteethmacgap_state = 1'd0;
reg vns_liteethmacgap_next_state = 1'd0;
reg [1:0] vns_liteethmacpreambleinserter_state = 2'd0;
reg [1:0] vns_liteethmacpreambleinserter_next_state = 2'd0;
reg vns_liteethmacpreamblechecker_state = 1'd0;
reg vns_liteethmacpreamblechecker_next_state = 1'd0;
reg [1:0] vns_liteethmaccrc32inserter_state = 2'd0;
reg [1:0] vns_liteethmaccrc32inserter_next_state = 2'd0;
reg [1:0] vns_liteethmaccrc32checker_state = 2'd0;
reg [1:0] vns_liteethmaccrc32checker_next_state = 2'd0;
reg vns_liteethmacpaddinginserter_state = 1'd0;
reg vns_liteethmacpaddinginserter_next_state = 1'd0;
reg [2:0] vns_liteethmacsramwriter_state = 3'd0;
reg [2:0] vns_liteethmacsramwriter_next_state = 3'd0;
reg [31:0] soc_writer_errors_status_liteethmac_next_value = 32'd0;
reg soc_writer_errors_status_liteethmac_next_value_ce = 1'd0;
reg [1:0] vns_liteethmacsramreader_state = 2'd0;
reg [1:0] vns_liteethmacsramreader_next_state = 2'd0;
wire vns_wb_sdram_con_request;
wire vns_wb_sdram_con_grant;
wire [29:0] vns_netsoc_shared_adr;
wire [31:0] vns_netsoc_shared_dat_w;
reg [31:0] vns_netsoc_shared_dat_r = 32'd0;
wire [3:0] vns_netsoc_shared_sel;
wire vns_netsoc_shared_cyc;
wire vns_netsoc_shared_stb;
reg vns_netsoc_shared_ack = 1'd0;
wire vns_netsoc_shared_we;
wire [2:0] vns_netsoc_shared_cti;
wire [1:0] vns_netsoc_shared_bte;
wire vns_netsoc_shared_err;
wire [1:0] vns_netsoc_request;
reg vns_netsoc_grant = 1'd0;
reg [5:0] vns_netsoc_slave_sel = 6'd0;
reg [5:0] vns_netsoc_slave_sel_r = 6'd0;
reg vns_netsoc_error = 1'd0;
wire vns_netsoc_wait;
wire vns_netsoc_done;
reg [19:0] vns_netsoc_count = 20'd1000000;
wire [13:0] vns_netsoc_csrbankarray_interface0_bank_bus_adr;
wire vns_netsoc_csrbankarray_interface0_bank_bus_we;
wire [7:0] vns_netsoc_csrbankarray_interface0_bank_bus_dat_w;
reg [7:0] vns_netsoc_csrbankarray_interface0_bank_bus_dat_r = 8'd0;
wire vns_netsoc_csrbankarray_csrbank0_timer_time7_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank0_timer_time7_r;
wire vns_netsoc_csrbankarray_csrbank0_timer_time7_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank0_timer_time7_w;
wire vns_netsoc_csrbankarray_csrbank0_timer_time6_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank0_timer_time6_r;
wire vns_netsoc_csrbankarray_csrbank0_timer_time6_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank0_timer_time6_w;
wire vns_netsoc_csrbankarray_csrbank0_timer_time5_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank0_timer_time5_r;
wire vns_netsoc_csrbankarray_csrbank0_timer_time5_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank0_timer_time5_w;
wire vns_netsoc_csrbankarray_csrbank0_timer_time4_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank0_timer_time4_r;
wire vns_netsoc_csrbankarray_csrbank0_timer_time4_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank0_timer_time4_w;
wire vns_netsoc_csrbankarray_csrbank0_timer_time3_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank0_timer_time3_r;
wire vns_netsoc_csrbankarray_csrbank0_timer_time3_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank0_timer_time3_w;
wire vns_netsoc_csrbankarray_csrbank0_timer_time2_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank0_timer_time2_r;
wire vns_netsoc_csrbankarray_csrbank0_timer_time2_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank0_timer_time2_w;
wire vns_netsoc_csrbankarray_csrbank0_timer_time1_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank0_timer_time1_r;
wire vns_netsoc_csrbankarray_csrbank0_timer_time1_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank0_timer_time1_w;
wire vns_netsoc_csrbankarray_csrbank0_timer_time0_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank0_timer_time0_r;
wire vns_netsoc_csrbankarray_csrbank0_timer_time0_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank0_timer_time0_w;
wire vns_netsoc_csrbankarray_csrbank0_timer_time_cmp7_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank0_timer_time_cmp7_r;
wire vns_netsoc_csrbankarray_csrbank0_timer_time_cmp7_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank0_timer_time_cmp7_w;
wire vns_netsoc_csrbankarray_csrbank0_timer_time_cmp6_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank0_timer_time_cmp6_r;
wire vns_netsoc_csrbankarray_csrbank0_timer_time_cmp6_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank0_timer_time_cmp6_w;
wire vns_netsoc_csrbankarray_csrbank0_timer_time_cmp5_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank0_timer_time_cmp5_r;
wire vns_netsoc_csrbankarray_csrbank0_timer_time_cmp5_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank0_timer_time_cmp5_w;
wire vns_netsoc_csrbankarray_csrbank0_timer_time_cmp4_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank0_timer_time_cmp4_r;
wire vns_netsoc_csrbankarray_csrbank0_timer_time_cmp4_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank0_timer_time_cmp4_w;
wire vns_netsoc_csrbankarray_csrbank0_timer_time_cmp3_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank0_timer_time_cmp3_r;
wire vns_netsoc_csrbankarray_csrbank0_timer_time_cmp3_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank0_timer_time_cmp3_w;
wire vns_netsoc_csrbankarray_csrbank0_timer_time_cmp2_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank0_timer_time_cmp2_r;
wire vns_netsoc_csrbankarray_csrbank0_timer_time_cmp2_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank0_timer_time_cmp2_w;
wire vns_netsoc_csrbankarray_csrbank0_timer_time_cmp1_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank0_timer_time_cmp1_r;
wire vns_netsoc_csrbankarray_csrbank0_timer_time_cmp1_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank0_timer_time_cmp1_w;
wire vns_netsoc_csrbankarray_csrbank0_timer_time_cmp0_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank0_timer_time_cmp0_r;
wire vns_netsoc_csrbankarray_csrbank0_timer_time_cmp0_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank0_timer_time_cmp0_w;
wire vns_netsoc_csrbankarray_csrbank0_sel;
wire [13:0] vns_netsoc_csrbankarray_interface1_bank_bus_adr;
wire vns_netsoc_csrbankarray_interface1_bank_bus_we;
wire [7:0] vns_netsoc_csrbankarray_interface1_bank_bus_dat_w;
reg [7:0] vns_netsoc_csrbankarray_interface1_bank_bus_dat_r = 8'd0;
wire vns_netsoc_csrbankarray_csrbank1_scratch3_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank1_scratch3_r;
wire vns_netsoc_csrbankarray_csrbank1_scratch3_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank1_scratch3_w;
wire vns_netsoc_csrbankarray_csrbank1_scratch2_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank1_scratch2_r;
wire vns_netsoc_csrbankarray_csrbank1_scratch2_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank1_scratch2_w;
wire vns_netsoc_csrbankarray_csrbank1_scratch1_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank1_scratch1_r;
wire vns_netsoc_csrbankarray_csrbank1_scratch1_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank1_scratch1_w;
wire vns_netsoc_csrbankarray_csrbank1_scratch0_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank1_scratch0_r;
wire vns_netsoc_csrbankarray_csrbank1_scratch0_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank1_scratch0_w;
wire vns_netsoc_csrbankarray_csrbank1_bus_errors3_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank1_bus_errors3_r;
wire vns_netsoc_csrbankarray_csrbank1_bus_errors3_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank1_bus_errors3_w;
wire vns_netsoc_csrbankarray_csrbank1_bus_errors2_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank1_bus_errors2_r;
wire vns_netsoc_csrbankarray_csrbank1_bus_errors2_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank1_bus_errors2_w;
wire vns_netsoc_csrbankarray_csrbank1_bus_errors1_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank1_bus_errors1_r;
wire vns_netsoc_csrbankarray_csrbank1_bus_errors1_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank1_bus_errors1_w;
wire vns_netsoc_csrbankarray_csrbank1_bus_errors0_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank1_bus_errors0_r;
wire vns_netsoc_csrbankarray_csrbank1_bus_errors0_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank1_bus_errors0_w;
wire vns_netsoc_csrbankarray_csrbank1_sel;
wire [13:0] vns_netsoc_csrbankarray_interface2_bank_bus_adr;
wire vns_netsoc_csrbankarray_interface2_bank_bus_we;
wire [7:0] vns_netsoc_csrbankarray_interface2_bank_bus_dat_w;
reg [7:0] vns_netsoc_csrbankarray_interface2_bank_bus_dat_r = 8'd0;
wire vns_netsoc_csrbankarray_csrbank2_half_sys8x_taps0_re;
wire [4:0] vns_netsoc_csrbankarray_csrbank2_half_sys8x_taps0_r;
wire vns_netsoc_csrbankarray_csrbank2_half_sys8x_taps0_we;
wire [4:0] vns_netsoc_csrbankarray_csrbank2_half_sys8x_taps0_w;
wire vns_netsoc_csrbankarray_csrbank2_dly_sel0_re;
wire [1:0] vns_netsoc_csrbankarray_csrbank2_dly_sel0_r;
wire vns_netsoc_csrbankarray_csrbank2_dly_sel0_we;
wire [1:0] vns_netsoc_csrbankarray_csrbank2_dly_sel0_w;
wire vns_netsoc_csrbankarray_csrbank2_sel;
wire [13:0] vns_netsoc_csrbankarray_interface3_bank_bus_adr;
wire vns_netsoc_csrbankarray_interface3_bank_bus_we;
wire [7:0] vns_netsoc_csrbankarray_interface3_bank_bus_dat_w;
reg [7:0] vns_netsoc_csrbankarray_interface3_bank_bus_dat_r = 8'd0;
wire vns_netsoc_csrbankarray_csrbank3_sram_writer_slot_re;
wire vns_netsoc_csrbankarray_csrbank3_sram_writer_slot_r;
wire vns_netsoc_csrbankarray_csrbank3_sram_writer_slot_we;
wire vns_netsoc_csrbankarray_csrbank3_sram_writer_slot_w;
wire vns_netsoc_csrbankarray_csrbank3_sram_writer_length3_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank3_sram_writer_length3_r;
wire vns_netsoc_csrbankarray_csrbank3_sram_writer_length3_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank3_sram_writer_length3_w;
wire vns_netsoc_csrbankarray_csrbank3_sram_writer_length2_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank3_sram_writer_length2_r;
wire vns_netsoc_csrbankarray_csrbank3_sram_writer_length2_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank3_sram_writer_length2_w;
wire vns_netsoc_csrbankarray_csrbank3_sram_writer_length1_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank3_sram_writer_length1_r;
wire vns_netsoc_csrbankarray_csrbank3_sram_writer_length1_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank3_sram_writer_length1_w;
wire vns_netsoc_csrbankarray_csrbank3_sram_writer_length0_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank3_sram_writer_length0_r;
wire vns_netsoc_csrbankarray_csrbank3_sram_writer_length0_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank3_sram_writer_length0_w;
wire vns_netsoc_csrbankarray_csrbank3_sram_writer_errors3_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank3_sram_writer_errors3_r;
wire vns_netsoc_csrbankarray_csrbank3_sram_writer_errors3_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank3_sram_writer_errors3_w;
wire vns_netsoc_csrbankarray_csrbank3_sram_writer_errors2_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank3_sram_writer_errors2_r;
wire vns_netsoc_csrbankarray_csrbank3_sram_writer_errors2_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank3_sram_writer_errors2_w;
wire vns_netsoc_csrbankarray_csrbank3_sram_writer_errors1_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank3_sram_writer_errors1_r;
wire vns_netsoc_csrbankarray_csrbank3_sram_writer_errors1_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank3_sram_writer_errors1_w;
wire vns_netsoc_csrbankarray_csrbank3_sram_writer_errors0_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank3_sram_writer_errors0_r;
wire vns_netsoc_csrbankarray_csrbank3_sram_writer_errors0_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank3_sram_writer_errors0_w;
wire vns_netsoc_csrbankarray_csrbank3_sram_writer_ev_enable0_re;
wire vns_netsoc_csrbankarray_csrbank3_sram_writer_ev_enable0_r;
wire vns_netsoc_csrbankarray_csrbank3_sram_writer_ev_enable0_we;
wire vns_netsoc_csrbankarray_csrbank3_sram_writer_ev_enable0_w;
wire vns_netsoc_csrbankarray_csrbank3_sram_reader_ready_re;
wire vns_netsoc_csrbankarray_csrbank3_sram_reader_ready_r;
wire vns_netsoc_csrbankarray_csrbank3_sram_reader_ready_we;
wire vns_netsoc_csrbankarray_csrbank3_sram_reader_ready_w;
wire vns_netsoc_csrbankarray_csrbank3_sram_reader_level_re;
wire [1:0] vns_netsoc_csrbankarray_csrbank3_sram_reader_level_r;
wire vns_netsoc_csrbankarray_csrbank3_sram_reader_level_we;
wire [1:0] vns_netsoc_csrbankarray_csrbank3_sram_reader_level_w;
wire vns_netsoc_csrbankarray_csrbank3_sram_reader_slot0_re;
wire vns_netsoc_csrbankarray_csrbank3_sram_reader_slot0_r;
wire vns_netsoc_csrbankarray_csrbank3_sram_reader_slot0_we;
wire vns_netsoc_csrbankarray_csrbank3_sram_reader_slot0_w;
wire vns_netsoc_csrbankarray_csrbank3_sram_reader_length1_re;
wire [2:0] vns_netsoc_csrbankarray_csrbank3_sram_reader_length1_r;
wire vns_netsoc_csrbankarray_csrbank3_sram_reader_length1_we;
wire [2:0] vns_netsoc_csrbankarray_csrbank3_sram_reader_length1_w;
wire vns_netsoc_csrbankarray_csrbank3_sram_reader_length0_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank3_sram_reader_length0_r;
wire vns_netsoc_csrbankarray_csrbank3_sram_reader_length0_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank3_sram_reader_length0_w;
wire vns_netsoc_csrbankarray_csrbank3_sram_reader_ev_enable0_re;
wire vns_netsoc_csrbankarray_csrbank3_sram_reader_ev_enable0_r;
wire vns_netsoc_csrbankarray_csrbank3_sram_reader_ev_enable0_we;
wire vns_netsoc_csrbankarray_csrbank3_sram_reader_ev_enable0_w;
wire vns_netsoc_csrbankarray_csrbank3_preamble_crc_re;
wire vns_netsoc_csrbankarray_csrbank3_preamble_crc_r;
wire vns_netsoc_csrbankarray_csrbank3_preamble_crc_we;
wire vns_netsoc_csrbankarray_csrbank3_preamble_crc_w;
wire vns_netsoc_csrbankarray_csrbank3_preamble_errors3_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank3_preamble_errors3_r;
wire vns_netsoc_csrbankarray_csrbank3_preamble_errors3_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank3_preamble_errors3_w;
wire vns_netsoc_csrbankarray_csrbank3_preamble_errors2_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank3_preamble_errors2_r;
wire vns_netsoc_csrbankarray_csrbank3_preamble_errors2_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank3_preamble_errors2_w;
wire vns_netsoc_csrbankarray_csrbank3_preamble_errors1_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank3_preamble_errors1_r;
wire vns_netsoc_csrbankarray_csrbank3_preamble_errors1_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank3_preamble_errors1_w;
wire vns_netsoc_csrbankarray_csrbank3_preamble_errors0_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank3_preamble_errors0_r;
wire vns_netsoc_csrbankarray_csrbank3_preamble_errors0_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank3_preamble_errors0_w;
wire vns_netsoc_csrbankarray_csrbank3_crc_errors3_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank3_crc_errors3_r;
wire vns_netsoc_csrbankarray_csrbank3_crc_errors3_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank3_crc_errors3_w;
wire vns_netsoc_csrbankarray_csrbank3_crc_errors2_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank3_crc_errors2_r;
wire vns_netsoc_csrbankarray_csrbank3_crc_errors2_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank3_crc_errors2_w;
wire vns_netsoc_csrbankarray_csrbank3_crc_errors1_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank3_crc_errors1_r;
wire vns_netsoc_csrbankarray_csrbank3_crc_errors1_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank3_crc_errors1_w;
wire vns_netsoc_csrbankarray_csrbank3_crc_errors0_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank3_crc_errors0_r;
wire vns_netsoc_csrbankarray_csrbank3_crc_errors0_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank3_crc_errors0_w;
wire vns_netsoc_csrbankarray_csrbank3_sel;
wire [13:0] vns_netsoc_csrbankarray_interface4_bank_bus_adr;
wire vns_netsoc_csrbankarray_interface4_bank_bus_we;
wire [7:0] vns_netsoc_csrbankarray_interface4_bank_bus_dat_w;
reg [7:0] vns_netsoc_csrbankarray_interface4_bank_bus_dat_r = 8'd0;
wire vns_netsoc_csrbankarray_csrbank4_crg_reset0_re;
wire vns_netsoc_csrbankarray_csrbank4_crg_reset0_r;
wire vns_netsoc_csrbankarray_csrbank4_crg_reset0_we;
wire vns_netsoc_csrbankarray_csrbank4_crg_reset0_w;
wire vns_netsoc_csrbankarray_csrbank4_mdio_w0_re;
wire [2:0] vns_netsoc_csrbankarray_csrbank4_mdio_w0_r;
wire vns_netsoc_csrbankarray_csrbank4_mdio_w0_we;
wire [2:0] vns_netsoc_csrbankarray_csrbank4_mdio_w0_w;
wire vns_netsoc_csrbankarray_csrbank4_mdio_r_re;
wire vns_netsoc_csrbankarray_csrbank4_mdio_r_r;
wire vns_netsoc_csrbankarray_csrbank4_mdio_r_we;
wire vns_netsoc_csrbankarray_csrbank4_mdio_r_w;
wire vns_netsoc_csrbankarray_csrbank4_sel;
wire [13:0] vns_netsoc_csrbankarray_sram_bus_adr;
wire vns_netsoc_csrbankarray_sram_bus_we;
wire [7:0] vns_netsoc_csrbankarray_sram_bus_dat_w;
reg [7:0] vns_netsoc_csrbankarray_sram_bus_dat_r = 8'd0;
wire [2:0] vns_netsoc_csrbankarray_adr;
wire [7:0] vns_netsoc_csrbankarray_dat_r;
wire vns_netsoc_csrbankarray_sel;
reg vns_netsoc_csrbankarray_sel_r = 1'd0;
wire [13:0] vns_netsoc_csrbankarray_interface5_bank_bus_adr;
wire vns_netsoc_csrbankarray_interface5_bank_bus_we;
wire [7:0] vns_netsoc_csrbankarray_interface5_bank_bus_dat_w;
reg [7:0] vns_netsoc_csrbankarray_interface5_bank_bus_dat_r = 8'd0;
wire vns_netsoc_csrbankarray_csrbank5_dfii_control0_re;
wire [3:0] vns_netsoc_csrbankarray_csrbank5_dfii_control0_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_control0_we;
wire [3:0] vns_netsoc_csrbankarray_csrbank5_dfii_control0_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi0_command0_re;
wire [5:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi0_command0_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi0_command0_we;
wire [5:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi0_command0_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi0_address1_re;
wire [5:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi0_address1_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi0_address1_we;
wire [5:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi0_address1_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi0_address0_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi0_address0_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi0_address0_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi0_address0_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi0_baddress0_re;
wire [2:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi0_baddress0_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi0_baddress0_we;
wire [2:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi0_baddress0_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata3_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata3_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata3_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata3_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata2_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata2_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata2_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata2_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata1_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata1_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata1_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata1_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata0_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata0_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata0_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata0_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi0_rddata3_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi0_rddata3_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi0_rddata3_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi0_rddata3_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi0_rddata2_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi0_rddata2_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi0_rddata2_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi0_rddata2_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi0_rddata1_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi0_rddata1_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi0_rddata1_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi0_rddata1_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi0_rddata0_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi0_rddata0_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi0_rddata0_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi0_rddata0_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi1_command0_re;
wire [5:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi1_command0_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi1_command0_we;
wire [5:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi1_command0_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi1_address1_re;
wire [5:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi1_address1_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi1_address1_we;
wire [5:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi1_address1_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi1_address0_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi1_address0_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi1_address0_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi1_address0_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi1_baddress0_re;
wire [2:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi1_baddress0_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi1_baddress0_we;
wire [2:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi1_baddress0_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata3_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata3_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata3_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata3_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata2_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata2_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata2_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata2_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata1_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata1_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata1_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata1_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata0_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata0_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata0_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata0_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi1_rddata3_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi1_rddata3_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi1_rddata3_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi1_rddata3_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi1_rddata2_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi1_rddata2_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi1_rddata2_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi1_rddata2_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi1_rddata1_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi1_rddata1_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi1_rddata1_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi1_rddata1_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi1_rddata0_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi1_rddata0_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi1_rddata0_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi1_rddata0_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi2_command0_re;
wire [5:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi2_command0_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi2_command0_we;
wire [5:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi2_command0_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi2_address1_re;
wire [5:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi2_address1_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi2_address1_we;
wire [5:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi2_address1_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi2_address0_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi2_address0_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi2_address0_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi2_address0_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi2_baddress0_re;
wire [2:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi2_baddress0_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi2_baddress0_we;
wire [2:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi2_baddress0_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata3_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata3_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata3_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata3_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata2_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata2_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata2_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata2_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata1_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata1_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata1_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata1_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata0_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata0_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata0_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata0_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi2_rddata3_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi2_rddata3_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi2_rddata3_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi2_rddata3_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi2_rddata2_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi2_rddata2_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi2_rddata2_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi2_rddata2_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi2_rddata1_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi2_rddata1_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi2_rddata1_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi2_rddata1_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi2_rddata0_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi2_rddata0_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi2_rddata0_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi2_rddata0_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi3_command0_re;
wire [5:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi3_command0_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi3_command0_we;
wire [5:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi3_command0_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi3_address1_re;
wire [5:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi3_address1_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi3_address1_we;
wire [5:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi3_address1_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi3_address0_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi3_address0_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi3_address0_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi3_address0_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi3_baddress0_re;
wire [2:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi3_baddress0_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi3_baddress0_we;
wire [2:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi3_baddress0_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata3_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata3_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata3_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata3_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata2_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata2_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata2_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata2_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata1_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata1_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata1_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata1_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata0_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata0_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata0_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata0_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi3_rddata3_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi3_rddata3_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi3_rddata3_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi3_rddata3_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi3_rddata2_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi3_rddata2_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi3_rddata2_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi3_rddata2_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi3_rddata1_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi3_rddata1_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi3_rddata1_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi3_rddata1_w;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi3_rddata0_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi3_rddata0_r;
wire vns_netsoc_csrbankarray_csrbank5_dfii_pi3_rddata0_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_dfii_pi3_rddata0_w;
wire vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nreads2_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nreads2_r;
wire vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nreads2_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nreads2_w;
wire vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nreads1_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nreads1_r;
wire vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nreads1_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nreads1_w;
wire vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nreads0_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nreads0_r;
wire vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nreads0_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nreads0_w;
wire vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nwrites2_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nwrites2_r;
wire vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nwrites2_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nwrites2_w;
wire vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nwrites1_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nwrites1_r;
wire vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nwrites1_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nwrites1_w;
wire vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nwrites0_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nwrites0_r;
wire vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nwrites0_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nwrites0_w;
wire vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_data_width_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_data_width_r;
wire vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_data_width_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_data_width_w;
wire vns_netsoc_csrbankarray_csrbank5_sel;
wire [13:0] vns_netsoc_csrbankarray_interface6_bank_bus_adr;
wire vns_netsoc_csrbankarray_interface6_bank_bus_we;
wire [7:0] vns_netsoc_csrbankarray_interface6_bank_bus_dat_w;
reg [7:0] vns_netsoc_csrbankarray_interface6_bank_bus_dat_r = 8'd0;
wire vns_netsoc_csrbankarray_csrbank6_load3_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank6_load3_r;
wire vns_netsoc_csrbankarray_csrbank6_load3_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank6_load3_w;
wire vns_netsoc_csrbankarray_csrbank6_load2_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank6_load2_r;
wire vns_netsoc_csrbankarray_csrbank6_load2_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank6_load2_w;
wire vns_netsoc_csrbankarray_csrbank6_load1_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank6_load1_r;
wire vns_netsoc_csrbankarray_csrbank6_load1_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank6_load1_w;
wire vns_netsoc_csrbankarray_csrbank6_load0_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank6_load0_r;
wire vns_netsoc_csrbankarray_csrbank6_load0_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank6_load0_w;
wire vns_netsoc_csrbankarray_csrbank6_reload3_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank6_reload3_r;
wire vns_netsoc_csrbankarray_csrbank6_reload3_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank6_reload3_w;
wire vns_netsoc_csrbankarray_csrbank6_reload2_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank6_reload2_r;
wire vns_netsoc_csrbankarray_csrbank6_reload2_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank6_reload2_w;
wire vns_netsoc_csrbankarray_csrbank6_reload1_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank6_reload1_r;
wire vns_netsoc_csrbankarray_csrbank6_reload1_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank6_reload1_w;
wire vns_netsoc_csrbankarray_csrbank6_reload0_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank6_reload0_r;
wire vns_netsoc_csrbankarray_csrbank6_reload0_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank6_reload0_w;
wire vns_netsoc_csrbankarray_csrbank6_en0_re;
wire vns_netsoc_csrbankarray_csrbank6_en0_r;
wire vns_netsoc_csrbankarray_csrbank6_en0_we;
wire vns_netsoc_csrbankarray_csrbank6_en0_w;
wire vns_netsoc_csrbankarray_csrbank6_update_value0_re;
wire vns_netsoc_csrbankarray_csrbank6_update_value0_r;
wire vns_netsoc_csrbankarray_csrbank6_update_value0_we;
wire vns_netsoc_csrbankarray_csrbank6_update_value0_w;
wire vns_netsoc_csrbankarray_csrbank6_value3_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank6_value3_r;
wire vns_netsoc_csrbankarray_csrbank6_value3_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank6_value3_w;
wire vns_netsoc_csrbankarray_csrbank6_value2_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank6_value2_r;
wire vns_netsoc_csrbankarray_csrbank6_value2_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank6_value2_w;
wire vns_netsoc_csrbankarray_csrbank6_value1_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank6_value1_r;
wire vns_netsoc_csrbankarray_csrbank6_value1_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank6_value1_w;
wire vns_netsoc_csrbankarray_csrbank6_value0_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank6_value0_r;
wire vns_netsoc_csrbankarray_csrbank6_value0_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank6_value0_w;
wire vns_netsoc_csrbankarray_csrbank6_ev_enable0_re;
wire vns_netsoc_csrbankarray_csrbank6_ev_enable0_r;
wire vns_netsoc_csrbankarray_csrbank6_ev_enable0_we;
wire vns_netsoc_csrbankarray_csrbank6_ev_enable0_w;
wire vns_netsoc_csrbankarray_csrbank6_sel;
wire [13:0] vns_netsoc_csrbankarray_interface7_bank_bus_adr;
wire vns_netsoc_csrbankarray_interface7_bank_bus_we;
wire [7:0] vns_netsoc_csrbankarray_interface7_bank_bus_dat_w;
reg [7:0] vns_netsoc_csrbankarray_interface7_bank_bus_dat_r = 8'd0;
wire vns_netsoc_csrbankarray_csrbank7_txfull_re;
wire vns_netsoc_csrbankarray_csrbank7_txfull_r;
wire vns_netsoc_csrbankarray_csrbank7_txfull_we;
wire vns_netsoc_csrbankarray_csrbank7_txfull_w;
wire vns_netsoc_csrbankarray_csrbank7_rxempty_re;
wire vns_netsoc_csrbankarray_csrbank7_rxempty_r;
wire vns_netsoc_csrbankarray_csrbank7_rxempty_we;
wire vns_netsoc_csrbankarray_csrbank7_rxempty_w;
wire vns_netsoc_csrbankarray_csrbank7_ev_enable0_re;
wire [1:0] vns_netsoc_csrbankarray_csrbank7_ev_enable0_r;
wire vns_netsoc_csrbankarray_csrbank7_ev_enable0_we;
wire [1:0] vns_netsoc_csrbankarray_csrbank7_ev_enable0_w;
wire vns_netsoc_csrbankarray_csrbank7_sel;
wire [13:0] vns_netsoc_csrbankarray_interface8_bank_bus_adr;
wire vns_netsoc_csrbankarray_interface8_bank_bus_we;
wire [7:0] vns_netsoc_csrbankarray_interface8_bank_bus_dat_w;
reg [7:0] vns_netsoc_csrbankarray_interface8_bank_bus_dat_r = 8'd0;
wire vns_netsoc_csrbankarray_csrbank8_tuning_word3_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank8_tuning_word3_r;
wire vns_netsoc_csrbankarray_csrbank8_tuning_word3_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank8_tuning_word3_w;
wire vns_netsoc_csrbankarray_csrbank8_tuning_word2_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank8_tuning_word2_r;
wire vns_netsoc_csrbankarray_csrbank8_tuning_word2_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank8_tuning_word2_w;
wire vns_netsoc_csrbankarray_csrbank8_tuning_word1_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank8_tuning_word1_r;
wire vns_netsoc_csrbankarray_csrbank8_tuning_word1_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank8_tuning_word1_w;
wire vns_netsoc_csrbankarray_csrbank8_tuning_word0_re;
wire [7:0] vns_netsoc_csrbankarray_csrbank8_tuning_word0_r;
wire vns_netsoc_csrbankarray_csrbank8_tuning_word0_we;
wire [7:0] vns_netsoc_csrbankarray_csrbank8_tuning_word0_w;
wire vns_netsoc_csrbankarray_csrbank8_sel;
wire [13:0] vns_netsoc_csrcon_adr;
wire vns_netsoc_csrcon_we;
wire [7:0] vns_netsoc_csrcon_dat_w;
wire [7:0] vns_netsoc_csrcon_dat_r;
reg vns_rhs_array_muxed0 = 1'd0;
reg [13:0] vns_rhs_array_muxed1 = 14'd0;
reg [2:0] vns_rhs_array_muxed2 = 3'd0;
reg vns_rhs_array_muxed3 = 1'd0;
reg vns_rhs_array_muxed4 = 1'd0;
reg vns_rhs_array_muxed5 = 1'd0;
reg vns_t_array_muxed0 = 1'd0;
reg vns_t_array_muxed1 = 1'd0;
reg vns_t_array_muxed2 = 1'd0;
reg vns_rhs_array_muxed6 = 1'd0;
reg [13:0] vns_rhs_array_muxed7 = 14'd0;
reg [2:0] vns_rhs_array_muxed8 = 3'd0;
reg vns_rhs_array_muxed9 = 1'd0;
reg vns_rhs_array_muxed10 = 1'd0;
reg vns_rhs_array_muxed11 = 1'd0;
reg vns_t_array_muxed3 = 1'd0;
reg vns_t_array_muxed4 = 1'd0;
reg vns_t_array_muxed5 = 1'd0;
reg [20:0] vns_rhs_array_muxed12 = 21'd0;
reg vns_rhs_array_muxed13 = 1'd0;
reg vns_rhs_array_muxed14 = 1'd0;
reg [20:0] vns_rhs_array_muxed15 = 21'd0;
reg vns_rhs_array_muxed16 = 1'd0;
reg vns_rhs_array_muxed17 = 1'd0;
reg [20:0] vns_rhs_array_muxed18 = 21'd0;
reg vns_rhs_array_muxed19 = 1'd0;
reg vns_rhs_array_muxed20 = 1'd0;
reg [20:0] vns_rhs_array_muxed21 = 21'd0;
reg vns_rhs_array_muxed22 = 1'd0;
reg vns_rhs_array_muxed23 = 1'd0;
reg [20:0] vns_rhs_array_muxed24 = 21'd0;
reg vns_rhs_array_muxed25 = 1'd0;
reg vns_rhs_array_muxed26 = 1'd0;
reg [20:0] vns_rhs_array_muxed27 = 21'd0;
reg vns_rhs_array_muxed28 = 1'd0;
reg vns_rhs_array_muxed29 = 1'd0;
reg [20:0] vns_rhs_array_muxed30 = 21'd0;
reg vns_rhs_array_muxed31 = 1'd0;
reg vns_rhs_array_muxed32 = 1'd0;
reg [20:0] vns_rhs_array_muxed33 = 21'd0;
reg vns_rhs_array_muxed34 = 1'd0;
reg vns_rhs_array_muxed35 = 1'd0;
reg [29:0] vns_rhs_array_muxed36 = 30'd0;
reg [31:0] vns_rhs_array_muxed37 = 32'd0;
reg [3:0] vns_rhs_array_muxed38 = 4'd0;
reg vns_rhs_array_muxed39 = 1'd0;
reg vns_rhs_array_muxed40 = 1'd0;
reg vns_rhs_array_muxed41 = 1'd0;
reg [2:0] vns_rhs_array_muxed42 = 3'd0;
reg [1:0] vns_rhs_array_muxed43 = 2'd0;
reg [29:0] vns_rhs_array_muxed44 = 30'd0;
reg [31:0] vns_rhs_array_muxed45 = 32'd0;
reg [3:0] vns_rhs_array_muxed46 = 4'd0;
reg vns_rhs_array_muxed47 = 1'd0;
reg vns_rhs_array_muxed48 = 1'd0;
reg vns_rhs_array_muxed49 = 1'd0;
reg [2:0] vns_rhs_array_muxed50 = 3'd0;
reg [1:0] vns_rhs_array_muxed51 = 2'd0;
reg [2:0] vns_array_muxed0 = 3'd0;
reg [13:0] vns_array_muxed1 = 14'd0;
reg vns_array_muxed2 = 1'd0;
reg vns_array_muxed3 = 1'd0;
reg vns_array_muxed4 = 1'd0;
reg vns_array_muxed5 = 1'd0;
reg vns_array_muxed6 = 1'd0;
reg [2:0] vns_array_muxed7 = 3'd0;
reg [13:0] vns_array_muxed8 = 14'd0;
reg vns_array_muxed9 = 1'd0;
reg vns_array_muxed10 = 1'd0;
reg vns_array_muxed11 = 1'd0;
reg vns_array_muxed12 = 1'd0;
reg vns_array_muxed13 = 1'd0;
reg [2:0] vns_array_muxed14 = 3'd0;
reg [13:0] vns_array_muxed15 = 14'd0;
reg vns_array_muxed16 = 1'd0;
reg vns_array_muxed17 = 1'd0;
reg vns_array_muxed18 = 1'd0;
reg vns_array_muxed19 = 1'd0;
reg vns_array_muxed20 = 1'd0;
reg [2:0] vns_array_muxed21 = 3'd0;
reg [13:0] vns_array_muxed22 = 14'd0;
reg vns_array_muxed23 = 1'd0;
reg vns_array_muxed24 = 1'd0;
reg vns_array_muxed25 = 1'd0;
reg vns_array_muxed26 = 1'd0;
reg vns_array_muxed27 = 1'd0;
(* async_reg = "true", mr_ff = "true", dont_touch = "true" *) reg vns_xilinxmultiregimpl0_regs0 = 1'd0;
(* async_reg = "true", dont_touch = "true" *) reg vns_xilinxmultiregimpl0_regs1 = 1'd0;
wire vns_xilinxasyncresetsynchronizerimpl0;
wire vns_xilinxasyncresetsynchronizerimpl0_rst_meta;
wire vns_xilinxasyncresetsynchronizerimpl1;
wire vns_xilinxasyncresetsynchronizerimpl1_rst_meta;
wire vns_xilinxasyncresetsynchronizerimpl2_rst_meta;
wire vns_xilinxasyncresetsynchronizerimpl3_rst_meta;
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
assign soc_netsoc_cpu_reset = soc_netsoc_ctrl_reset;
assign soc_netsoc_ctrl_bus_error = vns_netsoc_error;
always @(*) begin
	soc_netsoc_cpu_interrupt0 <= 32'd0;
	soc_netsoc_cpu_interrupt0[2] <= soc_ev_irq;
	soc_netsoc_cpu_interrupt0[1] <= soc_netsoc_timer0_irq;
	soc_netsoc_cpu_interrupt0[0] <= soc_netsoc_uart_irq;
end
assign soc_netsoc_ctrl_reset = soc_netsoc_ctrl_reset_reset_re;
assign soc_netsoc_ctrl_bus_errors_status = soc_netsoc_ctrl_bus_errors;
assign soc_netsoc_cpu_interrupt1 = (soc_netsoc_cpu_time >= soc_netsoc_cpu_time_cmp);
assign soc_netsoc_interface0_soc_bus_adr = soc_netsoc_cpu_ibus_adr;
assign soc_netsoc_interface0_soc_bus_dat_w = soc_netsoc_cpu_ibus_dat_w;
assign soc_netsoc_cpu_ibus_dat_r = soc_netsoc_interface0_soc_bus_dat_r;
assign soc_netsoc_interface0_soc_bus_sel = soc_netsoc_cpu_ibus_sel;
assign soc_netsoc_interface0_soc_bus_cyc = soc_netsoc_cpu_ibus_cyc;
assign soc_netsoc_interface0_soc_bus_stb = soc_netsoc_cpu_ibus_stb;
assign soc_netsoc_cpu_ibus_ack = soc_netsoc_interface0_soc_bus_ack;
assign soc_netsoc_interface0_soc_bus_we = soc_netsoc_cpu_ibus_we;
assign soc_netsoc_interface0_soc_bus_cti = soc_netsoc_cpu_ibus_cti;
assign soc_netsoc_interface0_soc_bus_bte = soc_netsoc_cpu_ibus_bte;
assign soc_netsoc_cpu_ibus_err = soc_netsoc_interface0_soc_bus_err;
assign soc_netsoc_interface1_soc_bus_adr = soc_netsoc_cpu_dbus_adr;
assign soc_netsoc_interface1_soc_bus_dat_w = soc_netsoc_cpu_dbus_dat_w;
assign soc_netsoc_cpu_dbus_dat_r = soc_netsoc_interface1_soc_bus_dat_r;
assign soc_netsoc_interface1_soc_bus_sel = soc_netsoc_cpu_dbus_sel;
assign soc_netsoc_interface1_soc_bus_cyc = soc_netsoc_cpu_dbus_cyc;
assign soc_netsoc_interface1_soc_bus_stb = soc_netsoc_cpu_dbus_stb;
assign soc_netsoc_cpu_dbus_ack = soc_netsoc_interface1_soc_bus_ack;
assign soc_netsoc_interface1_soc_bus_we = soc_netsoc_cpu_dbus_we;
assign soc_netsoc_interface1_soc_bus_cti = soc_netsoc_cpu_dbus_cti;
assign soc_netsoc_interface1_soc_bus_bte = soc_netsoc_cpu_dbus_bte;
assign soc_netsoc_cpu_dbus_err = soc_netsoc_interface1_soc_bus_err;
assign soc_netsoc_rom_adr = soc_netsoc_rom_bus_adr[13:0];
assign soc_netsoc_rom_bus_dat_r = soc_netsoc_rom_dat_r;
always @(*) begin
	soc_netsoc_sram_we <= 4'd0;
	soc_netsoc_sram_we[0] <= (((soc_netsoc_sram_bus_cyc & soc_netsoc_sram_bus_stb) & soc_netsoc_sram_bus_we) & soc_netsoc_sram_bus_sel[0]);
	soc_netsoc_sram_we[1] <= (((soc_netsoc_sram_bus_cyc & soc_netsoc_sram_bus_stb) & soc_netsoc_sram_bus_we) & soc_netsoc_sram_bus_sel[1]);
	soc_netsoc_sram_we[2] <= (((soc_netsoc_sram_bus_cyc & soc_netsoc_sram_bus_stb) & soc_netsoc_sram_bus_we) & soc_netsoc_sram_bus_sel[2]);
	soc_netsoc_sram_we[3] <= (((soc_netsoc_sram_bus_cyc & soc_netsoc_sram_bus_stb) & soc_netsoc_sram_bus_we) & soc_netsoc_sram_bus_sel[3]);
end
assign soc_netsoc_sram_adr = soc_netsoc_sram_bus_adr[12:0];
assign soc_netsoc_sram_bus_dat_r = soc_netsoc_sram_dat_r;
assign soc_netsoc_sram_dat_w = soc_netsoc_sram_bus_dat_w;
assign soc_netsoc_uart_tx_fifo_sink_valid = soc_netsoc_uart_rxtx_re;
assign soc_netsoc_uart_tx_fifo_sink_payload_data = soc_netsoc_uart_rxtx_r;
assign soc_netsoc_uart_txfull_status = (~soc_netsoc_uart_tx_fifo_sink_ready);
assign soc_netsoc_uart_phy_sink_valid = soc_netsoc_uart_tx_fifo_source_valid;
assign soc_netsoc_uart_tx_fifo_source_ready = soc_netsoc_uart_phy_sink_ready;
assign soc_netsoc_uart_phy_sink_first = soc_netsoc_uart_tx_fifo_source_first;
assign soc_netsoc_uart_phy_sink_last = soc_netsoc_uart_tx_fifo_source_last;
assign soc_netsoc_uart_phy_sink_payload_data = soc_netsoc_uart_tx_fifo_source_payload_data;
assign soc_netsoc_uart_tx_trigger = (~soc_netsoc_uart_tx_fifo_sink_ready);
assign soc_netsoc_uart_rx_fifo_sink_valid = soc_netsoc_uart_phy_source_valid;
assign soc_netsoc_uart_phy_source_ready = soc_netsoc_uart_rx_fifo_sink_ready;
assign soc_netsoc_uart_rx_fifo_sink_first = soc_netsoc_uart_phy_source_first;
assign soc_netsoc_uart_rx_fifo_sink_last = soc_netsoc_uart_phy_source_last;
assign soc_netsoc_uart_rx_fifo_sink_payload_data = soc_netsoc_uart_phy_source_payload_data;
assign soc_netsoc_uart_rxempty_status = (~soc_netsoc_uart_rx_fifo_source_valid);
assign soc_netsoc_uart_rxtx_w = soc_netsoc_uart_rx_fifo_source_payload_data;
assign soc_netsoc_uart_rx_fifo_source_ready = soc_netsoc_uart_rx_clear;
assign soc_netsoc_uart_rx_trigger = (~soc_netsoc_uart_rx_fifo_source_valid);
always @(*) begin
	soc_netsoc_uart_tx_clear <= 1'd0;
	if ((soc_netsoc_uart_eventmanager_pending_re & soc_netsoc_uart_eventmanager_pending_r[0])) begin
		soc_netsoc_uart_tx_clear <= 1'd1;
	end
end
always @(*) begin
	soc_netsoc_uart_eventmanager_status_w <= 2'd0;
	soc_netsoc_uart_eventmanager_status_w[0] <= soc_netsoc_uart_tx_status;
	soc_netsoc_uart_eventmanager_status_w[1] <= soc_netsoc_uart_rx_status;
end
always @(*) begin
	soc_netsoc_uart_rx_clear <= 1'd0;
	if ((soc_netsoc_uart_eventmanager_pending_re & soc_netsoc_uart_eventmanager_pending_r[1])) begin
		soc_netsoc_uart_rx_clear <= 1'd1;
	end
end
always @(*) begin
	soc_netsoc_uart_eventmanager_pending_w <= 2'd0;
	soc_netsoc_uart_eventmanager_pending_w[0] <= soc_netsoc_uart_tx_pending;
	soc_netsoc_uart_eventmanager_pending_w[1] <= soc_netsoc_uart_rx_pending;
end
assign soc_netsoc_uart_irq = ((soc_netsoc_uart_eventmanager_pending_w[0] & soc_netsoc_uart_eventmanager_storage[0]) | (soc_netsoc_uart_eventmanager_pending_w[1] & soc_netsoc_uart_eventmanager_storage[1]));
assign soc_netsoc_uart_tx_status = soc_netsoc_uart_tx_trigger;
assign soc_netsoc_uart_rx_status = soc_netsoc_uart_rx_trigger;
assign soc_netsoc_uart_tx_fifo_syncfifo_din = {soc_netsoc_uart_tx_fifo_fifo_in_last, soc_netsoc_uart_tx_fifo_fifo_in_first, soc_netsoc_uart_tx_fifo_fifo_in_payload_data};
assign {soc_netsoc_uart_tx_fifo_fifo_out_last, soc_netsoc_uart_tx_fifo_fifo_out_first, soc_netsoc_uart_tx_fifo_fifo_out_payload_data} = soc_netsoc_uart_tx_fifo_syncfifo_dout;
assign soc_netsoc_uart_tx_fifo_sink_ready = soc_netsoc_uart_tx_fifo_syncfifo_writable;
assign soc_netsoc_uart_tx_fifo_syncfifo_we = soc_netsoc_uart_tx_fifo_sink_valid;
assign soc_netsoc_uart_tx_fifo_fifo_in_first = soc_netsoc_uart_tx_fifo_sink_first;
assign soc_netsoc_uart_tx_fifo_fifo_in_last = soc_netsoc_uart_tx_fifo_sink_last;
assign soc_netsoc_uart_tx_fifo_fifo_in_payload_data = soc_netsoc_uart_tx_fifo_sink_payload_data;
assign soc_netsoc_uart_tx_fifo_source_valid = soc_netsoc_uart_tx_fifo_readable;
assign soc_netsoc_uart_tx_fifo_source_first = soc_netsoc_uart_tx_fifo_fifo_out_first;
assign soc_netsoc_uart_tx_fifo_source_last = soc_netsoc_uart_tx_fifo_fifo_out_last;
assign soc_netsoc_uart_tx_fifo_source_payload_data = soc_netsoc_uart_tx_fifo_fifo_out_payload_data;
assign soc_netsoc_uart_tx_fifo_re = soc_netsoc_uart_tx_fifo_source_ready;
assign soc_netsoc_uart_tx_fifo_syncfifo_re = (soc_netsoc_uart_tx_fifo_syncfifo_readable & ((~soc_netsoc_uart_tx_fifo_readable) | soc_netsoc_uart_tx_fifo_re));
assign soc_netsoc_uart_tx_fifo_level1 = (soc_netsoc_uart_tx_fifo_level0 + soc_netsoc_uart_tx_fifo_readable);
always @(*) begin
	soc_netsoc_uart_tx_fifo_wrport_adr <= 4'd0;
	if (soc_netsoc_uart_tx_fifo_replace) begin
		soc_netsoc_uart_tx_fifo_wrport_adr <= (soc_netsoc_uart_tx_fifo_produce - 1'd1);
	end else begin
		soc_netsoc_uart_tx_fifo_wrport_adr <= soc_netsoc_uart_tx_fifo_produce;
	end
end
assign soc_netsoc_uart_tx_fifo_wrport_dat_w = soc_netsoc_uart_tx_fifo_syncfifo_din;
assign soc_netsoc_uart_tx_fifo_wrport_we = (soc_netsoc_uart_tx_fifo_syncfifo_we & (soc_netsoc_uart_tx_fifo_syncfifo_writable | soc_netsoc_uart_tx_fifo_replace));
assign soc_netsoc_uart_tx_fifo_do_read = (soc_netsoc_uart_tx_fifo_syncfifo_readable & soc_netsoc_uart_tx_fifo_syncfifo_re);
assign soc_netsoc_uart_tx_fifo_rdport_adr = soc_netsoc_uart_tx_fifo_consume;
assign soc_netsoc_uart_tx_fifo_syncfifo_dout = soc_netsoc_uart_tx_fifo_rdport_dat_r;
assign soc_netsoc_uart_tx_fifo_rdport_re = soc_netsoc_uart_tx_fifo_do_read;
assign soc_netsoc_uart_tx_fifo_syncfifo_writable = (soc_netsoc_uart_tx_fifo_level0 != 5'd16);
assign soc_netsoc_uart_tx_fifo_syncfifo_readable = (soc_netsoc_uart_tx_fifo_level0 != 1'd0);
assign soc_netsoc_uart_rx_fifo_syncfifo_din = {soc_netsoc_uart_rx_fifo_fifo_in_last, soc_netsoc_uart_rx_fifo_fifo_in_first, soc_netsoc_uart_rx_fifo_fifo_in_payload_data};
assign {soc_netsoc_uart_rx_fifo_fifo_out_last, soc_netsoc_uart_rx_fifo_fifo_out_first, soc_netsoc_uart_rx_fifo_fifo_out_payload_data} = soc_netsoc_uart_rx_fifo_syncfifo_dout;
assign soc_netsoc_uart_rx_fifo_sink_ready = soc_netsoc_uart_rx_fifo_syncfifo_writable;
assign soc_netsoc_uart_rx_fifo_syncfifo_we = soc_netsoc_uart_rx_fifo_sink_valid;
assign soc_netsoc_uart_rx_fifo_fifo_in_first = soc_netsoc_uart_rx_fifo_sink_first;
assign soc_netsoc_uart_rx_fifo_fifo_in_last = soc_netsoc_uart_rx_fifo_sink_last;
assign soc_netsoc_uart_rx_fifo_fifo_in_payload_data = soc_netsoc_uart_rx_fifo_sink_payload_data;
assign soc_netsoc_uart_rx_fifo_source_valid = soc_netsoc_uart_rx_fifo_readable;
assign soc_netsoc_uart_rx_fifo_source_first = soc_netsoc_uart_rx_fifo_fifo_out_first;
assign soc_netsoc_uart_rx_fifo_source_last = soc_netsoc_uart_rx_fifo_fifo_out_last;
assign soc_netsoc_uart_rx_fifo_source_payload_data = soc_netsoc_uart_rx_fifo_fifo_out_payload_data;
assign soc_netsoc_uart_rx_fifo_re = soc_netsoc_uart_rx_fifo_source_ready;
assign soc_netsoc_uart_rx_fifo_syncfifo_re = (soc_netsoc_uart_rx_fifo_syncfifo_readable & ((~soc_netsoc_uart_rx_fifo_readable) | soc_netsoc_uart_rx_fifo_re));
assign soc_netsoc_uart_rx_fifo_level1 = (soc_netsoc_uart_rx_fifo_level0 + soc_netsoc_uart_rx_fifo_readable);
always @(*) begin
	soc_netsoc_uart_rx_fifo_wrport_adr <= 4'd0;
	if (soc_netsoc_uart_rx_fifo_replace) begin
		soc_netsoc_uart_rx_fifo_wrport_adr <= (soc_netsoc_uart_rx_fifo_produce - 1'd1);
	end else begin
		soc_netsoc_uart_rx_fifo_wrport_adr <= soc_netsoc_uart_rx_fifo_produce;
	end
end
assign soc_netsoc_uart_rx_fifo_wrport_dat_w = soc_netsoc_uart_rx_fifo_syncfifo_din;
assign soc_netsoc_uart_rx_fifo_wrport_we = (soc_netsoc_uart_rx_fifo_syncfifo_we & (soc_netsoc_uart_rx_fifo_syncfifo_writable | soc_netsoc_uart_rx_fifo_replace));
assign soc_netsoc_uart_rx_fifo_do_read = (soc_netsoc_uart_rx_fifo_syncfifo_readable & soc_netsoc_uart_rx_fifo_syncfifo_re);
assign soc_netsoc_uart_rx_fifo_rdport_adr = soc_netsoc_uart_rx_fifo_consume;
assign soc_netsoc_uart_rx_fifo_syncfifo_dout = soc_netsoc_uart_rx_fifo_rdport_dat_r;
assign soc_netsoc_uart_rx_fifo_rdport_re = soc_netsoc_uart_rx_fifo_do_read;
assign soc_netsoc_uart_rx_fifo_syncfifo_writable = (soc_netsoc_uart_rx_fifo_level0 != 5'd16);
assign soc_netsoc_uart_rx_fifo_syncfifo_readable = (soc_netsoc_uart_rx_fifo_level0 != 1'd0);
assign soc_netsoc_timer0_zero_trigger = (soc_netsoc_timer0_value != 1'd0);
assign soc_netsoc_timer0_eventmanager_status_w = soc_netsoc_timer0_zero_status;
always @(*) begin
	soc_netsoc_timer0_zero_clear <= 1'd0;
	if ((soc_netsoc_timer0_eventmanager_pending_re & soc_netsoc_timer0_eventmanager_pending_r)) begin
		soc_netsoc_timer0_zero_clear <= 1'd1;
	end
end
assign soc_netsoc_timer0_eventmanager_pending_w = soc_netsoc_timer0_zero_pending;
assign soc_netsoc_timer0_irq = (soc_netsoc_timer0_eventmanager_pending_w & soc_netsoc_timer0_eventmanager_storage);
assign soc_netsoc_timer0_zero_status = soc_netsoc_timer0_zero_trigger;
assign soc_netsoc_interface_dat_w = soc_netsoc_bus_wishbone_dat_w;
assign soc_netsoc_bus_wishbone_dat_r = soc_netsoc_interface_dat_r;
always @(*) begin
	soc_netsoc_interface_adr <= 14'd0;
	vns_wb2csr_next_state <= 1'd0;
	soc_netsoc_interface_we <= 1'd0;
	soc_netsoc_bus_wishbone_ack <= 1'd0;
	vns_wb2csr_next_state <= vns_wb2csr_state;
	case (vns_wb2csr_state)
		1'd1: begin
			soc_netsoc_bus_wishbone_ack <= 1'd1;
			vns_wb2csr_next_state <= 1'd0;
		end
		default: begin
			if ((soc_netsoc_bus_wishbone_cyc & soc_netsoc_bus_wishbone_stb)) begin
				soc_netsoc_interface_adr <= soc_netsoc_bus_wishbone_adr;
				soc_netsoc_interface_we <= soc_netsoc_bus_wishbone_we;
				vns_wb2csr_next_state <= 1'd1;
			end
		end
	endcase
end
always @(*) begin
	soc_emulator_ram_we <= 4'd0;
	soc_emulator_ram_we[0] <= (((soc_emulator_ram_bus_cyc & soc_emulator_ram_bus_stb) & soc_emulator_ram_bus_we) & soc_emulator_ram_bus_sel[0]);
	soc_emulator_ram_we[1] <= (((soc_emulator_ram_bus_cyc & soc_emulator_ram_bus_stb) & soc_emulator_ram_bus_we) & soc_emulator_ram_bus_sel[1]);
	soc_emulator_ram_we[2] <= (((soc_emulator_ram_bus_cyc & soc_emulator_ram_bus_stb) & soc_emulator_ram_bus_we) & soc_emulator_ram_bus_sel[2]);
	soc_emulator_ram_we[3] <= (((soc_emulator_ram_bus_cyc & soc_emulator_ram_bus_stb) & soc_emulator_ram_bus_we) & soc_emulator_ram_bus_sel[3]);
end
assign soc_emulator_ram_adr = soc_emulator_ram_bus_adr[11:0];
assign soc_emulator_ram_bus_dat_r = soc_emulator_ram_dat_r;
assign soc_emulator_ram_dat_w = soc_emulator_ram_bus_dat_w;
always @(*) begin
	soc_a7ddrphy_dqs_serdes_pattern <= 8'd85;
	soc_a7ddrphy_dqs_serdes_pattern <= 7'd85;
	if ((soc_a7ddrphy_dqs_preamble | soc_a7ddrphy_dqs_postamble)) begin
		soc_a7ddrphy_dqs_serdes_pattern <= 1'd0;
	end
end
assign soc_a7ddrphy_bitslip0_i = soc_a7ddrphy_dq_i_data0;
assign soc_a7ddrphy_bitslip1_i = soc_a7ddrphy_dq_i_data1;
assign soc_a7ddrphy_bitslip2_i = soc_a7ddrphy_dq_i_data2;
assign soc_a7ddrphy_bitslip3_i = soc_a7ddrphy_dq_i_data3;
assign soc_a7ddrphy_bitslip4_i = soc_a7ddrphy_dq_i_data4;
assign soc_a7ddrphy_bitslip5_i = soc_a7ddrphy_dq_i_data5;
assign soc_a7ddrphy_bitslip6_i = soc_a7ddrphy_dq_i_data6;
assign soc_a7ddrphy_bitslip7_i = soc_a7ddrphy_dq_i_data7;
assign soc_a7ddrphy_bitslip8_i = soc_a7ddrphy_dq_i_data8;
assign soc_a7ddrphy_bitslip9_i = soc_a7ddrphy_dq_i_data9;
assign soc_a7ddrphy_bitslip10_i = soc_a7ddrphy_dq_i_data10;
assign soc_a7ddrphy_bitslip11_i = soc_a7ddrphy_dq_i_data11;
assign soc_a7ddrphy_bitslip12_i = soc_a7ddrphy_dq_i_data12;
assign soc_a7ddrphy_bitslip13_i = soc_a7ddrphy_dq_i_data13;
assign soc_a7ddrphy_bitslip14_i = soc_a7ddrphy_dq_i_data14;
assign soc_a7ddrphy_bitslip15_i = soc_a7ddrphy_dq_i_data15;
always @(*) begin
	soc_a7ddrphy_dfi_p0_rddata <= 32'd0;
	soc_a7ddrphy_dfi_p0_rddata[0] <= soc_a7ddrphy_bitslip0_o[0];
	soc_a7ddrphy_dfi_p0_rddata[16] <= soc_a7ddrphy_bitslip0_o[1];
	soc_a7ddrphy_dfi_p0_rddata[1] <= soc_a7ddrphy_bitslip1_o[0];
	soc_a7ddrphy_dfi_p0_rddata[17] <= soc_a7ddrphy_bitslip1_o[1];
	soc_a7ddrphy_dfi_p0_rddata[2] <= soc_a7ddrphy_bitslip2_o[0];
	soc_a7ddrphy_dfi_p0_rddata[18] <= soc_a7ddrphy_bitslip2_o[1];
	soc_a7ddrphy_dfi_p0_rddata[3] <= soc_a7ddrphy_bitslip3_o[0];
	soc_a7ddrphy_dfi_p0_rddata[19] <= soc_a7ddrphy_bitslip3_o[1];
	soc_a7ddrphy_dfi_p0_rddata[4] <= soc_a7ddrphy_bitslip4_o[0];
	soc_a7ddrphy_dfi_p0_rddata[20] <= soc_a7ddrphy_bitslip4_o[1];
	soc_a7ddrphy_dfi_p0_rddata[5] <= soc_a7ddrphy_bitslip5_o[0];
	soc_a7ddrphy_dfi_p0_rddata[21] <= soc_a7ddrphy_bitslip5_o[1];
	soc_a7ddrphy_dfi_p0_rddata[6] <= soc_a7ddrphy_bitslip6_o[0];
	soc_a7ddrphy_dfi_p0_rddata[22] <= soc_a7ddrphy_bitslip6_o[1];
	soc_a7ddrphy_dfi_p0_rddata[7] <= soc_a7ddrphy_bitslip7_o[0];
	soc_a7ddrphy_dfi_p0_rddata[23] <= soc_a7ddrphy_bitslip7_o[1];
	soc_a7ddrphy_dfi_p0_rddata[8] <= soc_a7ddrphy_bitslip8_o[0];
	soc_a7ddrphy_dfi_p0_rddata[24] <= soc_a7ddrphy_bitslip8_o[1];
	soc_a7ddrphy_dfi_p0_rddata[9] <= soc_a7ddrphy_bitslip9_o[0];
	soc_a7ddrphy_dfi_p0_rddata[25] <= soc_a7ddrphy_bitslip9_o[1];
	soc_a7ddrphy_dfi_p0_rddata[10] <= soc_a7ddrphy_bitslip10_o[0];
	soc_a7ddrphy_dfi_p0_rddata[26] <= soc_a7ddrphy_bitslip10_o[1];
	soc_a7ddrphy_dfi_p0_rddata[11] <= soc_a7ddrphy_bitslip11_o[0];
	soc_a7ddrphy_dfi_p0_rddata[27] <= soc_a7ddrphy_bitslip11_o[1];
	soc_a7ddrphy_dfi_p0_rddata[12] <= soc_a7ddrphy_bitslip12_o[0];
	soc_a7ddrphy_dfi_p0_rddata[28] <= soc_a7ddrphy_bitslip12_o[1];
	soc_a7ddrphy_dfi_p0_rddata[13] <= soc_a7ddrphy_bitslip13_o[0];
	soc_a7ddrphy_dfi_p0_rddata[29] <= soc_a7ddrphy_bitslip13_o[1];
	soc_a7ddrphy_dfi_p0_rddata[14] <= soc_a7ddrphy_bitslip14_o[0];
	soc_a7ddrphy_dfi_p0_rddata[30] <= soc_a7ddrphy_bitslip14_o[1];
	soc_a7ddrphy_dfi_p0_rddata[15] <= soc_a7ddrphy_bitslip15_o[0];
	soc_a7ddrphy_dfi_p0_rddata[31] <= soc_a7ddrphy_bitslip15_o[1];
end
always @(*) begin
	soc_a7ddrphy_dfi_p1_rddata <= 32'd0;
	soc_a7ddrphy_dfi_p1_rddata[0] <= soc_a7ddrphy_bitslip0_o[2];
	soc_a7ddrphy_dfi_p1_rddata[16] <= soc_a7ddrphy_bitslip0_o[3];
	soc_a7ddrphy_dfi_p1_rddata[1] <= soc_a7ddrphy_bitslip1_o[2];
	soc_a7ddrphy_dfi_p1_rddata[17] <= soc_a7ddrphy_bitslip1_o[3];
	soc_a7ddrphy_dfi_p1_rddata[2] <= soc_a7ddrphy_bitslip2_o[2];
	soc_a7ddrphy_dfi_p1_rddata[18] <= soc_a7ddrphy_bitslip2_o[3];
	soc_a7ddrphy_dfi_p1_rddata[3] <= soc_a7ddrphy_bitslip3_o[2];
	soc_a7ddrphy_dfi_p1_rddata[19] <= soc_a7ddrphy_bitslip3_o[3];
	soc_a7ddrphy_dfi_p1_rddata[4] <= soc_a7ddrphy_bitslip4_o[2];
	soc_a7ddrphy_dfi_p1_rddata[20] <= soc_a7ddrphy_bitslip4_o[3];
	soc_a7ddrphy_dfi_p1_rddata[5] <= soc_a7ddrphy_bitslip5_o[2];
	soc_a7ddrphy_dfi_p1_rddata[21] <= soc_a7ddrphy_bitslip5_o[3];
	soc_a7ddrphy_dfi_p1_rddata[6] <= soc_a7ddrphy_bitslip6_o[2];
	soc_a7ddrphy_dfi_p1_rddata[22] <= soc_a7ddrphy_bitslip6_o[3];
	soc_a7ddrphy_dfi_p1_rddata[7] <= soc_a7ddrphy_bitslip7_o[2];
	soc_a7ddrphy_dfi_p1_rddata[23] <= soc_a7ddrphy_bitslip7_o[3];
	soc_a7ddrphy_dfi_p1_rddata[8] <= soc_a7ddrphy_bitslip8_o[2];
	soc_a7ddrphy_dfi_p1_rddata[24] <= soc_a7ddrphy_bitslip8_o[3];
	soc_a7ddrphy_dfi_p1_rddata[9] <= soc_a7ddrphy_bitslip9_o[2];
	soc_a7ddrphy_dfi_p1_rddata[25] <= soc_a7ddrphy_bitslip9_o[3];
	soc_a7ddrphy_dfi_p1_rddata[10] <= soc_a7ddrphy_bitslip10_o[2];
	soc_a7ddrphy_dfi_p1_rddata[26] <= soc_a7ddrphy_bitslip10_o[3];
	soc_a7ddrphy_dfi_p1_rddata[11] <= soc_a7ddrphy_bitslip11_o[2];
	soc_a7ddrphy_dfi_p1_rddata[27] <= soc_a7ddrphy_bitslip11_o[3];
	soc_a7ddrphy_dfi_p1_rddata[12] <= soc_a7ddrphy_bitslip12_o[2];
	soc_a7ddrphy_dfi_p1_rddata[28] <= soc_a7ddrphy_bitslip12_o[3];
	soc_a7ddrphy_dfi_p1_rddata[13] <= soc_a7ddrphy_bitslip13_o[2];
	soc_a7ddrphy_dfi_p1_rddata[29] <= soc_a7ddrphy_bitslip13_o[3];
	soc_a7ddrphy_dfi_p1_rddata[14] <= soc_a7ddrphy_bitslip14_o[2];
	soc_a7ddrphy_dfi_p1_rddata[30] <= soc_a7ddrphy_bitslip14_o[3];
	soc_a7ddrphy_dfi_p1_rddata[15] <= soc_a7ddrphy_bitslip15_o[2];
	soc_a7ddrphy_dfi_p1_rddata[31] <= soc_a7ddrphy_bitslip15_o[3];
end
always @(*) begin
	soc_a7ddrphy_dfi_p2_rddata <= 32'd0;
	soc_a7ddrphy_dfi_p2_rddata[0] <= soc_a7ddrphy_bitslip0_o[4];
	soc_a7ddrphy_dfi_p2_rddata[16] <= soc_a7ddrphy_bitslip0_o[5];
	soc_a7ddrphy_dfi_p2_rddata[1] <= soc_a7ddrphy_bitslip1_o[4];
	soc_a7ddrphy_dfi_p2_rddata[17] <= soc_a7ddrphy_bitslip1_o[5];
	soc_a7ddrphy_dfi_p2_rddata[2] <= soc_a7ddrphy_bitslip2_o[4];
	soc_a7ddrphy_dfi_p2_rddata[18] <= soc_a7ddrphy_bitslip2_o[5];
	soc_a7ddrphy_dfi_p2_rddata[3] <= soc_a7ddrphy_bitslip3_o[4];
	soc_a7ddrphy_dfi_p2_rddata[19] <= soc_a7ddrphy_bitslip3_o[5];
	soc_a7ddrphy_dfi_p2_rddata[4] <= soc_a7ddrphy_bitslip4_o[4];
	soc_a7ddrphy_dfi_p2_rddata[20] <= soc_a7ddrphy_bitslip4_o[5];
	soc_a7ddrphy_dfi_p2_rddata[5] <= soc_a7ddrphy_bitslip5_o[4];
	soc_a7ddrphy_dfi_p2_rddata[21] <= soc_a7ddrphy_bitslip5_o[5];
	soc_a7ddrphy_dfi_p2_rddata[6] <= soc_a7ddrphy_bitslip6_o[4];
	soc_a7ddrphy_dfi_p2_rddata[22] <= soc_a7ddrphy_bitslip6_o[5];
	soc_a7ddrphy_dfi_p2_rddata[7] <= soc_a7ddrphy_bitslip7_o[4];
	soc_a7ddrphy_dfi_p2_rddata[23] <= soc_a7ddrphy_bitslip7_o[5];
	soc_a7ddrphy_dfi_p2_rddata[8] <= soc_a7ddrphy_bitslip8_o[4];
	soc_a7ddrphy_dfi_p2_rddata[24] <= soc_a7ddrphy_bitslip8_o[5];
	soc_a7ddrphy_dfi_p2_rddata[9] <= soc_a7ddrphy_bitslip9_o[4];
	soc_a7ddrphy_dfi_p2_rddata[25] <= soc_a7ddrphy_bitslip9_o[5];
	soc_a7ddrphy_dfi_p2_rddata[10] <= soc_a7ddrphy_bitslip10_o[4];
	soc_a7ddrphy_dfi_p2_rddata[26] <= soc_a7ddrphy_bitslip10_o[5];
	soc_a7ddrphy_dfi_p2_rddata[11] <= soc_a7ddrphy_bitslip11_o[4];
	soc_a7ddrphy_dfi_p2_rddata[27] <= soc_a7ddrphy_bitslip11_o[5];
	soc_a7ddrphy_dfi_p2_rddata[12] <= soc_a7ddrphy_bitslip12_o[4];
	soc_a7ddrphy_dfi_p2_rddata[28] <= soc_a7ddrphy_bitslip12_o[5];
	soc_a7ddrphy_dfi_p2_rddata[13] <= soc_a7ddrphy_bitslip13_o[4];
	soc_a7ddrphy_dfi_p2_rddata[29] <= soc_a7ddrphy_bitslip13_o[5];
	soc_a7ddrphy_dfi_p2_rddata[14] <= soc_a7ddrphy_bitslip14_o[4];
	soc_a7ddrphy_dfi_p2_rddata[30] <= soc_a7ddrphy_bitslip14_o[5];
	soc_a7ddrphy_dfi_p2_rddata[15] <= soc_a7ddrphy_bitslip15_o[4];
	soc_a7ddrphy_dfi_p2_rddata[31] <= soc_a7ddrphy_bitslip15_o[5];
end
always @(*) begin
	soc_a7ddrphy_dfi_p3_rddata <= 32'd0;
	soc_a7ddrphy_dfi_p3_rddata[0] <= soc_a7ddrphy_bitslip0_o[6];
	soc_a7ddrphy_dfi_p3_rddata[16] <= soc_a7ddrphy_bitslip0_o[7];
	soc_a7ddrphy_dfi_p3_rddata[1] <= soc_a7ddrphy_bitslip1_o[6];
	soc_a7ddrphy_dfi_p3_rddata[17] <= soc_a7ddrphy_bitslip1_o[7];
	soc_a7ddrphy_dfi_p3_rddata[2] <= soc_a7ddrphy_bitslip2_o[6];
	soc_a7ddrphy_dfi_p3_rddata[18] <= soc_a7ddrphy_bitslip2_o[7];
	soc_a7ddrphy_dfi_p3_rddata[3] <= soc_a7ddrphy_bitslip3_o[6];
	soc_a7ddrphy_dfi_p3_rddata[19] <= soc_a7ddrphy_bitslip3_o[7];
	soc_a7ddrphy_dfi_p3_rddata[4] <= soc_a7ddrphy_bitslip4_o[6];
	soc_a7ddrphy_dfi_p3_rddata[20] <= soc_a7ddrphy_bitslip4_o[7];
	soc_a7ddrphy_dfi_p3_rddata[5] <= soc_a7ddrphy_bitslip5_o[6];
	soc_a7ddrphy_dfi_p3_rddata[21] <= soc_a7ddrphy_bitslip5_o[7];
	soc_a7ddrphy_dfi_p3_rddata[6] <= soc_a7ddrphy_bitslip6_o[6];
	soc_a7ddrphy_dfi_p3_rddata[22] <= soc_a7ddrphy_bitslip6_o[7];
	soc_a7ddrphy_dfi_p3_rddata[7] <= soc_a7ddrphy_bitslip7_o[6];
	soc_a7ddrphy_dfi_p3_rddata[23] <= soc_a7ddrphy_bitslip7_o[7];
	soc_a7ddrphy_dfi_p3_rddata[8] <= soc_a7ddrphy_bitslip8_o[6];
	soc_a7ddrphy_dfi_p3_rddata[24] <= soc_a7ddrphy_bitslip8_o[7];
	soc_a7ddrphy_dfi_p3_rddata[9] <= soc_a7ddrphy_bitslip9_o[6];
	soc_a7ddrphy_dfi_p3_rddata[25] <= soc_a7ddrphy_bitslip9_o[7];
	soc_a7ddrphy_dfi_p3_rddata[10] <= soc_a7ddrphy_bitslip10_o[6];
	soc_a7ddrphy_dfi_p3_rddata[26] <= soc_a7ddrphy_bitslip10_o[7];
	soc_a7ddrphy_dfi_p3_rddata[11] <= soc_a7ddrphy_bitslip11_o[6];
	soc_a7ddrphy_dfi_p3_rddata[27] <= soc_a7ddrphy_bitslip11_o[7];
	soc_a7ddrphy_dfi_p3_rddata[12] <= soc_a7ddrphy_bitslip12_o[6];
	soc_a7ddrphy_dfi_p3_rddata[28] <= soc_a7ddrphy_bitslip12_o[7];
	soc_a7ddrphy_dfi_p3_rddata[13] <= soc_a7ddrphy_bitslip13_o[6];
	soc_a7ddrphy_dfi_p3_rddata[29] <= soc_a7ddrphy_bitslip13_o[7];
	soc_a7ddrphy_dfi_p3_rddata[14] <= soc_a7ddrphy_bitslip14_o[6];
	soc_a7ddrphy_dfi_p3_rddata[30] <= soc_a7ddrphy_bitslip14_o[7];
	soc_a7ddrphy_dfi_p3_rddata[15] <= soc_a7ddrphy_bitslip15_o[6];
	soc_a7ddrphy_dfi_p3_rddata[31] <= soc_a7ddrphy_bitslip15_o[7];
end
assign soc_a7ddrphy_oe = ((soc_a7ddrphy_last_wrdata_en[1] | soc_a7ddrphy_last_wrdata_en[2]) | soc_a7ddrphy_last_wrdata_en[3]);
assign soc_a7ddrphy_dqs_preamble = (soc_a7ddrphy_last_wrdata_en[1] & (~soc_a7ddrphy_last_wrdata_en[2]));
assign soc_a7ddrphy_dqs_postamble = (soc_a7ddrphy_last_wrdata_en[3] & (~soc_a7ddrphy_last_wrdata_en[2]));
assign soc_a7ddrphy_dfi_p0_address = soc_netsoc_sdram_master_p0_address;
assign soc_a7ddrphy_dfi_p0_bank = soc_netsoc_sdram_master_p0_bank;
assign soc_a7ddrphy_dfi_p0_cas_n = soc_netsoc_sdram_master_p0_cas_n;
assign soc_a7ddrphy_dfi_p0_cs_n = soc_netsoc_sdram_master_p0_cs_n;
assign soc_a7ddrphy_dfi_p0_ras_n = soc_netsoc_sdram_master_p0_ras_n;
assign soc_a7ddrphy_dfi_p0_we_n = soc_netsoc_sdram_master_p0_we_n;
assign soc_a7ddrphy_dfi_p0_cke = soc_netsoc_sdram_master_p0_cke;
assign soc_a7ddrphy_dfi_p0_odt = soc_netsoc_sdram_master_p0_odt;
assign soc_a7ddrphy_dfi_p0_reset_n = soc_netsoc_sdram_master_p0_reset_n;
assign soc_a7ddrphy_dfi_p0_act_n = soc_netsoc_sdram_master_p0_act_n;
assign soc_a7ddrphy_dfi_p0_wrdata = soc_netsoc_sdram_master_p0_wrdata;
assign soc_a7ddrphy_dfi_p0_wrdata_en = soc_netsoc_sdram_master_p0_wrdata_en;
assign soc_a7ddrphy_dfi_p0_wrdata_mask = soc_netsoc_sdram_master_p0_wrdata_mask;
assign soc_a7ddrphy_dfi_p0_rddata_en = soc_netsoc_sdram_master_p0_rddata_en;
assign soc_netsoc_sdram_master_p0_rddata = soc_a7ddrphy_dfi_p0_rddata;
assign soc_netsoc_sdram_master_p0_rddata_valid = soc_a7ddrphy_dfi_p0_rddata_valid;
assign soc_a7ddrphy_dfi_p1_address = soc_netsoc_sdram_master_p1_address;
assign soc_a7ddrphy_dfi_p1_bank = soc_netsoc_sdram_master_p1_bank;
assign soc_a7ddrphy_dfi_p1_cas_n = soc_netsoc_sdram_master_p1_cas_n;
assign soc_a7ddrphy_dfi_p1_cs_n = soc_netsoc_sdram_master_p1_cs_n;
assign soc_a7ddrphy_dfi_p1_ras_n = soc_netsoc_sdram_master_p1_ras_n;
assign soc_a7ddrphy_dfi_p1_we_n = soc_netsoc_sdram_master_p1_we_n;
assign soc_a7ddrphy_dfi_p1_cke = soc_netsoc_sdram_master_p1_cke;
assign soc_a7ddrphy_dfi_p1_odt = soc_netsoc_sdram_master_p1_odt;
assign soc_a7ddrphy_dfi_p1_reset_n = soc_netsoc_sdram_master_p1_reset_n;
assign soc_a7ddrphy_dfi_p1_act_n = soc_netsoc_sdram_master_p1_act_n;
assign soc_a7ddrphy_dfi_p1_wrdata = soc_netsoc_sdram_master_p1_wrdata;
assign soc_a7ddrphy_dfi_p1_wrdata_en = soc_netsoc_sdram_master_p1_wrdata_en;
assign soc_a7ddrphy_dfi_p1_wrdata_mask = soc_netsoc_sdram_master_p1_wrdata_mask;
assign soc_a7ddrphy_dfi_p1_rddata_en = soc_netsoc_sdram_master_p1_rddata_en;
assign soc_netsoc_sdram_master_p1_rddata = soc_a7ddrphy_dfi_p1_rddata;
assign soc_netsoc_sdram_master_p1_rddata_valid = soc_a7ddrphy_dfi_p1_rddata_valid;
assign soc_a7ddrphy_dfi_p2_address = soc_netsoc_sdram_master_p2_address;
assign soc_a7ddrphy_dfi_p2_bank = soc_netsoc_sdram_master_p2_bank;
assign soc_a7ddrphy_dfi_p2_cas_n = soc_netsoc_sdram_master_p2_cas_n;
assign soc_a7ddrphy_dfi_p2_cs_n = soc_netsoc_sdram_master_p2_cs_n;
assign soc_a7ddrphy_dfi_p2_ras_n = soc_netsoc_sdram_master_p2_ras_n;
assign soc_a7ddrphy_dfi_p2_we_n = soc_netsoc_sdram_master_p2_we_n;
assign soc_a7ddrphy_dfi_p2_cke = soc_netsoc_sdram_master_p2_cke;
assign soc_a7ddrphy_dfi_p2_odt = soc_netsoc_sdram_master_p2_odt;
assign soc_a7ddrphy_dfi_p2_reset_n = soc_netsoc_sdram_master_p2_reset_n;
assign soc_a7ddrphy_dfi_p2_act_n = soc_netsoc_sdram_master_p2_act_n;
assign soc_a7ddrphy_dfi_p2_wrdata = soc_netsoc_sdram_master_p2_wrdata;
assign soc_a7ddrphy_dfi_p2_wrdata_en = soc_netsoc_sdram_master_p2_wrdata_en;
assign soc_a7ddrphy_dfi_p2_wrdata_mask = soc_netsoc_sdram_master_p2_wrdata_mask;
assign soc_a7ddrphy_dfi_p2_rddata_en = soc_netsoc_sdram_master_p2_rddata_en;
assign soc_netsoc_sdram_master_p2_rddata = soc_a7ddrphy_dfi_p2_rddata;
assign soc_netsoc_sdram_master_p2_rddata_valid = soc_a7ddrphy_dfi_p2_rddata_valid;
assign soc_a7ddrphy_dfi_p3_address = soc_netsoc_sdram_master_p3_address;
assign soc_a7ddrphy_dfi_p3_bank = soc_netsoc_sdram_master_p3_bank;
assign soc_a7ddrphy_dfi_p3_cas_n = soc_netsoc_sdram_master_p3_cas_n;
assign soc_a7ddrphy_dfi_p3_cs_n = soc_netsoc_sdram_master_p3_cs_n;
assign soc_a7ddrphy_dfi_p3_ras_n = soc_netsoc_sdram_master_p3_ras_n;
assign soc_a7ddrphy_dfi_p3_we_n = soc_netsoc_sdram_master_p3_we_n;
assign soc_a7ddrphy_dfi_p3_cke = soc_netsoc_sdram_master_p3_cke;
assign soc_a7ddrphy_dfi_p3_odt = soc_netsoc_sdram_master_p3_odt;
assign soc_a7ddrphy_dfi_p3_reset_n = soc_netsoc_sdram_master_p3_reset_n;
assign soc_a7ddrphy_dfi_p3_act_n = soc_netsoc_sdram_master_p3_act_n;
assign soc_a7ddrphy_dfi_p3_wrdata = soc_netsoc_sdram_master_p3_wrdata;
assign soc_a7ddrphy_dfi_p3_wrdata_en = soc_netsoc_sdram_master_p3_wrdata_en;
assign soc_a7ddrphy_dfi_p3_wrdata_mask = soc_netsoc_sdram_master_p3_wrdata_mask;
assign soc_a7ddrphy_dfi_p3_rddata_en = soc_netsoc_sdram_master_p3_rddata_en;
assign soc_netsoc_sdram_master_p3_rddata = soc_a7ddrphy_dfi_p3_rddata;
assign soc_netsoc_sdram_master_p3_rddata_valid = soc_a7ddrphy_dfi_p3_rddata_valid;
assign soc_netsoc_sdram_slave_p0_address = soc_netsoc_sdram_dfi_p0_address;
assign soc_netsoc_sdram_slave_p0_bank = soc_netsoc_sdram_dfi_p0_bank;
assign soc_netsoc_sdram_slave_p0_cas_n = soc_netsoc_sdram_dfi_p0_cas_n;
assign soc_netsoc_sdram_slave_p0_cs_n = soc_netsoc_sdram_dfi_p0_cs_n;
assign soc_netsoc_sdram_slave_p0_ras_n = soc_netsoc_sdram_dfi_p0_ras_n;
assign soc_netsoc_sdram_slave_p0_we_n = soc_netsoc_sdram_dfi_p0_we_n;
assign soc_netsoc_sdram_slave_p0_cke = soc_netsoc_sdram_dfi_p0_cke;
assign soc_netsoc_sdram_slave_p0_odt = soc_netsoc_sdram_dfi_p0_odt;
assign soc_netsoc_sdram_slave_p0_reset_n = soc_netsoc_sdram_dfi_p0_reset_n;
assign soc_netsoc_sdram_slave_p0_act_n = soc_netsoc_sdram_dfi_p0_act_n;
assign soc_netsoc_sdram_slave_p0_wrdata = soc_netsoc_sdram_dfi_p0_wrdata;
assign soc_netsoc_sdram_slave_p0_wrdata_en = soc_netsoc_sdram_dfi_p0_wrdata_en;
assign soc_netsoc_sdram_slave_p0_wrdata_mask = soc_netsoc_sdram_dfi_p0_wrdata_mask;
assign soc_netsoc_sdram_slave_p0_rddata_en = soc_netsoc_sdram_dfi_p0_rddata_en;
assign soc_netsoc_sdram_dfi_p0_rddata = soc_netsoc_sdram_slave_p0_rddata;
assign soc_netsoc_sdram_dfi_p0_rddata_valid = soc_netsoc_sdram_slave_p0_rddata_valid;
assign soc_netsoc_sdram_slave_p1_address = soc_netsoc_sdram_dfi_p1_address;
assign soc_netsoc_sdram_slave_p1_bank = soc_netsoc_sdram_dfi_p1_bank;
assign soc_netsoc_sdram_slave_p1_cas_n = soc_netsoc_sdram_dfi_p1_cas_n;
assign soc_netsoc_sdram_slave_p1_cs_n = soc_netsoc_sdram_dfi_p1_cs_n;
assign soc_netsoc_sdram_slave_p1_ras_n = soc_netsoc_sdram_dfi_p1_ras_n;
assign soc_netsoc_sdram_slave_p1_we_n = soc_netsoc_sdram_dfi_p1_we_n;
assign soc_netsoc_sdram_slave_p1_cke = soc_netsoc_sdram_dfi_p1_cke;
assign soc_netsoc_sdram_slave_p1_odt = soc_netsoc_sdram_dfi_p1_odt;
assign soc_netsoc_sdram_slave_p1_reset_n = soc_netsoc_sdram_dfi_p1_reset_n;
assign soc_netsoc_sdram_slave_p1_act_n = soc_netsoc_sdram_dfi_p1_act_n;
assign soc_netsoc_sdram_slave_p1_wrdata = soc_netsoc_sdram_dfi_p1_wrdata;
assign soc_netsoc_sdram_slave_p1_wrdata_en = soc_netsoc_sdram_dfi_p1_wrdata_en;
assign soc_netsoc_sdram_slave_p1_wrdata_mask = soc_netsoc_sdram_dfi_p1_wrdata_mask;
assign soc_netsoc_sdram_slave_p1_rddata_en = soc_netsoc_sdram_dfi_p1_rddata_en;
assign soc_netsoc_sdram_dfi_p1_rddata = soc_netsoc_sdram_slave_p1_rddata;
assign soc_netsoc_sdram_dfi_p1_rddata_valid = soc_netsoc_sdram_slave_p1_rddata_valid;
assign soc_netsoc_sdram_slave_p2_address = soc_netsoc_sdram_dfi_p2_address;
assign soc_netsoc_sdram_slave_p2_bank = soc_netsoc_sdram_dfi_p2_bank;
assign soc_netsoc_sdram_slave_p2_cas_n = soc_netsoc_sdram_dfi_p2_cas_n;
assign soc_netsoc_sdram_slave_p2_cs_n = soc_netsoc_sdram_dfi_p2_cs_n;
assign soc_netsoc_sdram_slave_p2_ras_n = soc_netsoc_sdram_dfi_p2_ras_n;
assign soc_netsoc_sdram_slave_p2_we_n = soc_netsoc_sdram_dfi_p2_we_n;
assign soc_netsoc_sdram_slave_p2_cke = soc_netsoc_sdram_dfi_p2_cke;
assign soc_netsoc_sdram_slave_p2_odt = soc_netsoc_sdram_dfi_p2_odt;
assign soc_netsoc_sdram_slave_p2_reset_n = soc_netsoc_sdram_dfi_p2_reset_n;
assign soc_netsoc_sdram_slave_p2_act_n = soc_netsoc_sdram_dfi_p2_act_n;
assign soc_netsoc_sdram_slave_p2_wrdata = soc_netsoc_sdram_dfi_p2_wrdata;
assign soc_netsoc_sdram_slave_p2_wrdata_en = soc_netsoc_sdram_dfi_p2_wrdata_en;
assign soc_netsoc_sdram_slave_p2_wrdata_mask = soc_netsoc_sdram_dfi_p2_wrdata_mask;
assign soc_netsoc_sdram_slave_p2_rddata_en = soc_netsoc_sdram_dfi_p2_rddata_en;
assign soc_netsoc_sdram_dfi_p2_rddata = soc_netsoc_sdram_slave_p2_rddata;
assign soc_netsoc_sdram_dfi_p2_rddata_valid = soc_netsoc_sdram_slave_p2_rddata_valid;
assign soc_netsoc_sdram_slave_p3_address = soc_netsoc_sdram_dfi_p3_address;
assign soc_netsoc_sdram_slave_p3_bank = soc_netsoc_sdram_dfi_p3_bank;
assign soc_netsoc_sdram_slave_p3_cas_n = soc_netsoc_sdram_dfi_p3_cas_n;
assign soc_netsoc_sdram_slave_p3_cs_n = soc_netsoc_sdram_dfi_p3_cs_n;
assign soc_netsoc_sdram_slave_p3_ras_n = soc_netsoc_sdram_dfi_p3_ras_n;
assign soc_netsoc_sdram_slave_p3_we_n = soc_netsoc_sdram_dfi_p3_we_n;
assign soc_netsoc_sdram_slave_p3_cke = soc_netsoc_sdram_dfi_p3_cke;
assign soc_netsoc_sdram_slave_p3_odt = soc_netsoc_sdram_dfi_p3_odt;
assign soc_netsoc_sdram_slave_p3_reset_n = soc_netsoc_sdram_dfi_p3_reset_n;
assign soc_netsoc_sdram_slave_p3_act_n = soc_netsoc_sdram_dfi_p3_act_n;
assign soc_netsoc_sdram_slave_p3_wrdata = soc_netsoc_sdram_dfi_p3_wrdata;
assign soc_netsoc_sdram_slave_p3_wrdata_en = soc_netsoc_sdram_dfi_p3_wrdata_en;
assign soc_netsoc_sdram_slave_p3_wrdata_mask = soc_netsoc_sdram_dfi_p3_wrdata_mask;
assign soc_netsoc_sdram_slave_p3_rddata_en = soc_netsoc_sdram_dfi_p3_rddata_en;
assign soc_netsoc_sdram_dfi_p3_rddata = soc_netsoc_sdram_slave_p3_rddata;
assign soc_netsoc_sdram_dfi_p3_rddata_valid = soc_netsoc_sdram_slave_p3_rddata_valid;
always @(*) begin
	soc_netsoc_sdram_master_p2_we_n <= 1'd1;
	soc_netsoc_sdram_master_p2_cke <= 1'd0;
	soc_netsoc_sdram_master_p2_odt <= 1'd0;
	soc_netsoc_sdram_master_p2_reset_n <= 1'd0;
	soc_netsoc_sdram_master_p2_act_n <= 1'd1;
	soc_netsoc_sdram_master_p2_wrdata <= 32'd0;
	soc_netsoc_sdram_inti_p3_rddata <= 32'd0;
	soc_netsoc_sdram_master_p2_wrdata_en <= 1'd0;
	soc_netsoc_sdram_inti_p3_rddata_valid <= 1'd0;
	soc_netsoc_sdram_master_p2_wrdata_mask <= 4'd0;
	soc_netsoc_sdram_master_p2_rddata_en <= 1'd0;
	soc_netsoc_sdram_master_p3_address <= 14'd0;
	soc_netsoc_sdram_master_p3_bank <= 3'd0;
	soc_netsoc_sdram_master_p3_cas_n <= 1'd1;
	soc_netsoc_sdram_master_p3_cs_n <= 1'd1;
	soc_netsoc_sdram_master_p3_ras_n <= 1'd1;
	soc_netsoc_sdram_master_p3_we_n <= 1'd1;
	soc_netsoc_sdram_master_p3_cke <= 1'd0;
	soc_netsoc_sdram_master_p3_odt <= 1'd0;
	soc_netsoc_sdram_master_p3_reset_n <= 1'd0;
	soc_netsoc_sdram_master_p3_act_n <= 1'd1;
	soc_netsoc_sdram_master_p3_wrdata <= 32'd0;
	soc_netsoc_sdram_master_p3_wrdata_en <= 1'd0;
	soc_netsoc_sdram_master_p3_wrdata_mask <= 4'd0;
	soc_netsoc_sdram_master_p3_rddata_en <= 1'd0;
	soc_netsoc_sdram_slave_p0_rddata <= 32'd0;
	soc_netsoc_sdram_slave_p0_rddata_valid <= 1'd0;
	soc_netsoc_sdram_slave_p1_rddata <= 32'd0;
	soc_netsoc_sdram_slave_p1_rddata_valid <= 1'd0;
	soc_netsoc_sdram_slave_p2_rddata <= 32'd0;
	soc_netsoc_sdram_slave_p2_rddata_valid <= 1'd0;
	soc_netsoc_sdram_slave_p3_rddata <= 32'd0;
	soc_netsoc_sdram_slave_p3_rddata_valid <= 1'd0;
	soc_netsoc_sdram_inti_p0_rddata <= 32'd0;
	soc_netsoc_sdram_inti_p0_rddata_valid <= 1'd0;
	soc_netsoc_sdram_master_p0_address <= 14'd0;
	soc_netsoc_sdram_master_p0_bank <= 3'd0;
	soc_netsoc_sdram_master_p0_cas_n <= 1'd1;
	soc_netsoc_sdram_master_p0_cs_n <= 1'd1;
	soc_netsoc_sdram_master_p0_ras_n <= 1'd1;
	soc_netsoc_sdram_master_p0_we_n <= 1'd1;
	soc_netsoc_sdram_master_p0_cke <= 1'd0;
	soc_netsoc_sdram_master_p0_odt <= 1'd0;
	soc_netsoc_sdram_master_p0_reset_n <= 1'd0;
	soc_netsoc_sdram_master_p0_act_n <= 1'd1;
	soc_netsoc_sdram_master_p0_wrdata <= 32'd0;
	soc_netsoc_sdram_inti_p1_rddata <= 32'd0;
	soc_netsoc_sdram_master_p0_wrdata_en <= 1'd0;
	soc_netsoc_sdram_inti_p1_rddata_valid <= 1'd0;
	soc_netsoc_sdram_master_p0_wrdata_mask <= 4'd0;
	soc_netsoc_sdram_master_p0_rddata_en <= 1'd0;
	soc_netsoc_sdram_master_p1_address <= 14'd0;
	soc_netsoc_sdram_master_p1_bank <= 3'd0;
	soc_netsoc_sdram_master_p1_cas_n <= 1'd1;
	soc_netsoc_sdram_master_p1_cs_n <= 1'd1;
	soc_netsoc_sdram_master_p1_ras_n <= 1'd1;
	soc_netsoc_sdram_master_p1_we_n <= 1'd1;
	soc_netsoc_sdram_master_p1_cke <= 1'd0;
	soc_netsoc_sdram_master_p1_odt <= 1'd0;
	soc_netsoc_sdram_master_p1_reset_n <= 1'd0;
	soc_netsoc_sdram_master_p1_act_n <= 1'd1;
	soc_netsoc_sdram_master_p1_wrdata <= 32'd0;
	soc_netsoc_sdram_inti_p2_rddata <= 32'd0;
	soc_netsoc_sdram_master_p1_wrdata_en <= 1'd0;
	soc_netsoc_sdram_inti_p2_rddata_valid <= 1'd0;
	soc_netsoc_sdram_master_p1_wrdata_mask <= 4'd0;
	soc_netsoc_sdram_master_p1_rddata_en <= 1'd0;
	soc_netsoc_sdram_master_p2_address <= 14'd0;
	soc_netsoc_sdram_master_p2_bank <= 3'd0;
	soc_netsoc_sdram_master_p2_cas_n <= 1'd1;
	soc_netsoc_sdram_master_p2_cs_n <= 1'd1;
	soc_netsoc_sdram_master_p2_ras_n <= 1'd1;
	if (soc_netsoc_sdram_storage[0]) begin
		soc_netsoc_sdram_master_p0_address <= soc_netsoc_sdram_slave_p0_address;
		soc_netsoc_sdram_master_p0_bank <= soc_netsoc_sdram_slave_p0_bank;
		soc_netsoc_sdram_master_p0_cas_n <= soc_netsoc_sdram_slave_p0_cas_n;
		soc_netsoc_sdram_master_p0_cs_n <= soc_netsoc_sdram_slave_p0_cs_n;
		soc_netsoc_sdram_master_p0_ras_n <= soc_netsoc_sdram_slave_p0_ras_n;
		soc_netsoc_sdram_master_p0_we_n <= soc_netsoc_sdram_slave_p0_we_n;
		soc_netsoc_sdram_master_p0_cke <= soc_netsoc_sdram_slave_p0_cke;
		soc_netsoc_sdram_master_p0_odt <= soc_netsoc_sdram_slave_p0_odt;
		soc_netsoc_sdram_master_p0_reset_n <= soc_netsoc_sdram_slave_p0_reset_n;
		soc_netsoc_sdram_master_p0_act_n <= soc_netsoc_sdram_slave_p0_act_n;
		soc_netsoc_sdram_master_p0_wrdata <= soc_netsoc_sdram_slave_p0_wrdata;
		soc_netsoc_sdram_master_p0_wrdata_en <= soc_netsoc_sdram_slave_p0_wrdata_en;
		soc_netsoc_sdram_master_p0_wrdata_mask <= soc_netsoc_sdram_slave_p0_wrdata_mask;
		soc_netsoc_sdram_master_p0_rddata_en <= soc_netsoc_sdram_slave_p0_rddata_en;
		soc_netsoc_sdram_slave_p0_rddata <= soc_netsoc_sdram_master_p0_rddata;
		soc_netsoc_sdram_slave_p0_rddata_valid <= soc_netsoc_sdram_master_p0_rddata_valid;
		soc_netsoc_sdram_master_p1_address <= soc_netsoc_sdram_slave_p1_address;
		soc_netsoc_sdram_master_p1_bank <= soc_netsoc_sdram_slave_p1_bank;
		soc_netsoc_sdram_master_p1_cas_n <= soc_netsoc_sdram_slave_p1_cas_n;
		soc_netsoc_sdram_master_p1_cs_n <= soc_netsoc_sdram_slave_p1_cs_n;
		soc_netsoc_sdram_master_p1_ras_n <= soc_netsoc_sdram_slave_p1_ras_n;
		soc_netsoc_sdram_master_p1_we_n <= soc_netsoc_sdram_slave_p1_we_n;
		soc_netsoc_sdram_master_p1_cke <= soc_netsoc_sdram_slave_p1_cke;
		soc_netsoc_sdram_master_p1_odt <= soc_netsoc_sdram_slave_p1_odt;
		soc_netsoc_sdram_master_p1_reset_n <= soc_netsoc_sdram_slave_p1_reset_n;
		soc_netsoc_sdram_master_p1_act_n <= soc_netsoc_sdram_slave_p1_act_n;
		soc_netsoc_sdram_master_p1_wrdata <= soc_netsoc_sdram_slave_p1_wrdata;
		soc_netsoc_sdram_master_p1_wrdata_en <= soc_netsoc_sdram_slave_p1_wrdata_en;
		soc_netsoc_sdram_master_p1_wrdata_mask <= soc_netsoc_sdram_slave_p1_wrdata_mask;
		soc_netsoc_sdram_master_p1_rddata_en <= soc_netsoc_sdram_slave_p1_rddata_en;
		soc_netsoc_sdram_slave_p1_rddata <= soc_netsoc_sdram_master_p1_rddata;
		soc_netsoc_sdram_slave_p1_rddata_valid <= soc_netsoc_sdram_master_p1_rddata_valid;
		soc_netsoc_sdram_master_p2_address <= soc_netsoc_sdram_slave_p2_address;
		soc_netsoc_sdram_master_p2_bank <= soc_netsoc_sdram_slave_p2_bank;
		soc_netsoc_sdram_master_p2_cas_n <= soc_netsoc_sdram_slave_p2_cas_n;
		soc_netsoc_sdram_master_p2_cs_n <= soc_netsoc_sdram_slave_p2_cs_n;
		soc_netsoc_sdram_master_p2_ras_n <= soc_netsoc_sdram_slave_p2_ras_n;
		soc_netsoc_sdram_master_p2_we_n <= soc_netsoc_sdram_slave_p2_we_n;
		soc_netsoc_sdram_master_p2_cke <= soc_netsoc_sdram_slave_p2_cke;
		soc_netsoc_sdram_master_p2_odt <= soc_netsoc_sdram_slave_p2_odt;
		soc_netsoc_sdram_master_p2_reset_n <= soc_netsoc_sdram_slave_p2_reset_n;
		soc_netsoc_sdram_master_p2_act_n <= soc_netsoc_sdram_slave_p2_act_n;
		soc_netsoc_sdram_master_p2_wrdata <= soc_netsoc_sdram_slave_p2_wrdata;
		soc_netsoc_sdram_master_p2_wrdata_en <= soc_netsoc_sdram_slave_p2_wrdata_en;
		soc_netsoc_sdram_master_p2_wrdata_mask <= soc_netsoc_sdram_slave_p2_wrdata_mask;
		soc_netsoc_sdram_master_p2_rddata_en <= soc_netsoc_sdram_slave_p2_rddata_en;
		soc_netsoc_sdram_slave_p2_rddata <= soc_netsoc_sdram_master_p2_rddata;
		soc_netsoc_sdram_slave_p2_rddata_valid <= soc_netsoc_sdram_master_p2_rddata_valid;
		soc_netsoc_sdram_master_p3_address <= soc_netsoc_sdram_slave_p3_address;
		soc_netsoc_sdram_master_p3_bank <= soc_netsoc_sdram_slave_p3_bank;
		soc_netsoc_sdram_master_p3_cas_n <= soc_netsoc_sdram_slave_p3_cas_n;
		soc_netsoc_sdram_master_p3_cs_n <= soc_netsoc_sdram_slave_p3_cs_n;
		soc_netsoc_sdram_master_p3_ras_n <= soc_netsoc_sdram_slave_p3_ras_n;
		soc_netsoc_sdram_master_p3_we_n <= soc_netsoc_sdram_slave_p3_we_n;
		soc_netsoc_sdram_master_p3_cke <= soc_netsoc_sdram_slave_p3_cke;
		soc_netsoc_sdram_master_p3_odt <= soc_netsoc_sdram_slave_p3_odt;
		soc_netsoc_sdram_master_p3_reset_n <= soc_netsoc_sdram_slave_p3_reset_n;
		soc_netsoc_sdram_master_p3_act_n <= soc_netsoc_sdram_slave_p3_act_n;
		soc_netsoc_sdram_master_p3_wrdata <= soc_netsoc_sdram_slave_p3_wrdata;
		soc_netsoc_sdram_master_p3_wrdata_en <= soc_netsoc_sdram_slave_p3_wrdata_en;
		soc_netsoc_sdram_master_p3_wrdata_mask <= soc_netsoc_sdram_slave_p3_wrdata_mask;
		soc_netsoc_sdram_master_p3_rddata_en <= soc_netsoc_sdram_slave_p3_rddata_en;
		soc_netsoc_sdram_slave_p3_rddata <= soc_netsoc_sdram_master_p3_rddata;
		soc_netsoc_sdram_slave_p3_rddata_valid <= soc_netsoc_sdram_master_p3_rddata_valid;
	end else begin
		soc_netsoc_sdram_master_p0_address <= soc_netsoc_sdram_inti_p0_address;
		soc_netsoc_sdram_master_p0_bank <= soc_netsoc_sdram_inti_p0_bank;
		soc_netsoc_sdram_master_p0_cas_n <= soc_netsoc_sdram_inti_p0_cas_n;
		soc_netsoc_sdram_master_p0_cs_n <= soc_netsoc_sdram_inti_p0_cs_n;
		soc_netsoc_sdram_master_p0_ras_n <= soc_netsoc_sdram_inti_p0_ras_n;
		soc_netsoc_sdram_master_p0_we_n <= soc_netsoc_sdram_inti_p0_we_n;
		soc_netsoc_sdram_master_p0_cke <= soc_netsoc_sdram_inti_p0_cke;
		soc_netsoc_sdram_master_p0_odt <= soc_netsoc_sdram_inti_p0_odt;
		soc_netsoc_sdram_master_p0_reset_n <= soc_netsoc_sdram_inti_p0_reset_n;
		soc_netsoc_sdram_master_p0_act_n <= soc_netsoc_sdram_inti_p0_act_n;
		soc_netsoc_sdram_master_p0_wrdata <= soc_netsoc_sdram_inti_p0_wrdata;
		soc_netsoc_sdram_master_p0_wrdata_en <= soc_netsoc_sdram_inti_p0_wrdata_en;
		soc_netsoc_sdram_master_p0_wrdata_mask <= soc_netsoc_sdram_inti_p0_wrdata_mask;
		soc_netsoc_sdram_master_p0_rddata_en <= soc_netsoc_sdram_inti_p0_rddata_en;
		soc_netsoc_sdram_inti_p0_rddata <= soc_netsoc_sdram_master_p0_rddata;
		soc_netsoc_sdram_inti_p0_rddata_valid <= soc_netsoc_sdram_master_p0_rddata_valid;
		soc_netsoc_sdram_master_p1_address <= soc_netsoc_sdram_inti_p1_address;
		soc_netsoc_sdram_master_p1_bank <= soc_netsoc_sdram_inti_p1_bank;
		soc_netsoc_sdram_master_p1_cas_n <= soc_netsoc_sdram_inti_p1_cas_n;
		soc_netsoc_sdram_master_p1_cs_n <= soc_netsoc_sdram_inti_p1_cs_n;
		soc_netsoc_sdram_master_p1_ras_n <= soc_netsoc_sdram_inti_p1_ras_n;
		soc_netsoc_sdram_master_p1_we_n <= soc_netsoc_sdram_inti_p1_we_n;
		soc_netsoc_sdram_master_p1_cke <= soc_netsoc_sdram_inti_p1_cke;
		soc_netsoc_sdram_master_p1_odt <= soc_netsoc_sdram_inti_p1_odt;
		soc_netsoc_sdram_master_p1_reset_n <= soc_netsoc_sdram_inti_p1_reset_n;
		soc_netsoc_sdram_master_p1_act_n <= soc_netsoc_sdram_inti_p1_act_n;
		soc_netsoc_sdram_master_p1_wrdata <= soc_netsoc_sdram_inti_p1_wrdata;
		soc_netsoc_sdram_master_p1_wrdata_en <= soc_netsoc_sdram_inti_p1_wrdata_en;
		soc_netsoc_sdram_master_p1_wrdata_mask <= soc_netsoc_sdram_inti_p1_wrdata_mask;
		soc_netsoc_sdram_master_p1_rddata_en <= soc_netsoc_sdram_inti_p1_rddata_en;
		soc_netsoc_sdram_inti_p1_rddata <= soc_netsoc_sdram_master_p1_rddata;
		soc_netsoc_sdram_inti_p1_rddata_valid <= soc_netsoc_sdram_master_p1_rddata_valid;
		soc_netsoc_sdram_master_p2_address <= soc_netsoc_sdram_inti_p2_address;
		soc_netsoc_sdram_master_p2_bank <= soc_netsoc_sdram_inti_p2_bank;
		soc_netsoc_sdram_master_p2_cas_n <= soc_netsoc_sdram_inti_p2_cas_n;
		soc_netsoc_sdram_master_p2_cs_n <= soc_netsoc_sdram_inti_p2_cs_n;
		soc_netsoc_sdram_master_p2_ras_n <= soc_netsoc_sdram_inti_p2_ras_n;
		soc_netsoc_sdram_master_p2_we_n <= soc_netsoc_sdram_inti_p2_we_n;
		soc_netsoc_sdram_master_p2_cke <= soc_netsoc_sdram_inti_p2_cke;
		soc_netsoc_sdram_master_p2_odt <= soc_netsoc_sdram_inti_p2_odt;
		soc_netsoc_sdram_master_p2_reset_n <= soc_netsoc_sdram_inti_p2_reset_n;
		soc_netsoc_sdram_master_p2_act_n <= soc_netsoc_sdram_inti_p2_act_n;
		soc_netsoc_sdram_master_p2_wrdata <= soc_netsoc_sdram_inti_p2_wrdata;
		soc_netsoc_sdram_master_p2_wrdata_en <= soc_netsoc_sdram_inti_p2_wrdata_en;
		soc_netsoc_sdram_master_p2_wrdata_mask <= soc_netsoc_sdram_inti_p2_wrdata_mask;
		soc_netsoc_sdram_master_p2_rddata_en <= soc_netsoc_sdram_inti_p2_rddata_en;
		soc_netsoc_sdram_inti_p2_rddata <= soc_netsoc_sdram_master_p2_rddata;
		soc_netsoc_sdram_inti_p2_rddata_valid <= soc_netsoc_sdram_master_p2_rddata_valid;
		soc_netsoc_sdram_master_p3_address <= soc_netsoc_sdram_inti_p3_address;
		soc_netsoc_sdram_master_p3_bank <= soc_netsoc_sdram_inti_p3_bank;
		soc_netsoc_sdram_master_p3_cas_n <= soc_netsoc_sdram_inti_p3_cas_n;
		soc_netsoc_sdram_master_p3_cs_n <= soc_netsoc_sdram_inti_p3_cs_n;
		soc_netsoc_sdram_master_p3_ras_n <= soc_netsoc_sdram_inti_p3_ras_n;
		soc_netsoc_sdram_master_p3_we_n <= soc_netsoc_sdram_inti_p3_we_n;
		soc_netsoc_sdram_master_p3_cke <= soc_netsoc_sdram_inti_p3_cke;
		soc_netsoc_sdram_master_p3_odt <= soc_netsoc_sdram_inti_p3_odt;
		soc_netsoc_sdram_master_p3_reset_n <= soc_netsoc_sdram_inti_p3_reset_n;
		soc_netsoc_sdram_master_p3_act_n <= soc_netsoc_sdram_inti_p3_act_n;
		soc_netsoc_sdram_master_p3_wrdata <= soc_netsoc_sdram_inti_p3_wrdata;
		soc_netsoc_sdram_master_p3_wrdata_en <= soc_netsoc_sdram_inti_p3_wrdata_en;
		soc_netsoc_sdram_master_p3_wrdata_mask <= soc_netsoc_sdram_inti_p3_wrdata_mask;
		soc_netsoc_sdram_master_p3_rddata_en <= soc_netsoc_sdram_inti_p3_rddata_en;
		soc_netsoc_sdram_inti_p3_rddata <= soc_netsoc_sdram_master_p3_rddata;
		soc_netsoc_sdram_inti_p3_rddata_valid <= soc_netsoc_sdram_master_p3_rddata_valid;
	end
end
assign soc_netsoc_sdram_inti_p0_cke = soc_netsoc_sdram_storage[1];
assign soc_netsoc_sdram_inti_p1_cke = soc_netsoc_sdram_storage[1];
assign soc_netsoc_sdram_inti_p2_cke = soc_netsoc_sdram_storage[1];
assign soc_netsoc_sdram_inti_p3_cke = soc_netsoc_sdram_storage[1];
assign soc_netsoc_sdram_inti_p0_odt = soc_netsoc_sdram_storage[2];
assign soc_netsoc_sdram_inti_p1_odt = soc_netsoc_sdram_storage[2];
assign soc_netsoc_sdram_inti_p2_odt = soc_netsoc_sdram_storage[2];
assign soc_netsoc_sdram_inti_p3_odt = soc_netsoc_sdram_storage[2];
assign soc_netsoc_sdram_inti_p0_reset_n = soc_netsoc_sdram_storage[3];
assign soc_netsoc_sdram_inti_p1_reset_n = soc_netsoc_sdram_storage[3];
assign soc_netsoc_sdram_inti_p2_reset_n = soc_netsoc_sdram_storage[3];
assign soc_netsoc_sdram_inti_p3_reset_n = soc_netsoc_sdram_storage[3];
always @(*) begin
	soc_netsoc_sdram_inti_p0_we_n <= 1'd1;
	soc_netsoc_sdram_inti_p0_cas_n <= 1'd1;
	soc_netsoc_sdram_inti_p0_cs_n <= 1'd1;
	soc_netsoc_sdram_inti_p0_ras_n <= 1'd1;
	if (soc_netsoc_sdram_phaseinjector0_command_issue_re) begin
		soc_netsoc_sdram_inti_p0_cs_n <= {1{(~soc_netsoc_sdram_phaseinjector0_command_storage[0])}};
		soc_netsoc_sdram_inti_p0_we_n <= (~soc_netsoc_sdram_phaseinjector0_command_storage[1]);
		soc_netsoc_sdram_inti_p0_cas_n <= (~soc_netsoc_sdram_phaseinjector0_command_storage[2]);
		soc_netsoc_sdram_inti_p0_ras_n <= (~soc_netsoc_sdram_phaseinjector0_command_storage[3]);
	end else begin
		soc_netsoc_sdram_inti_p0_cs_n <= {1{1'd1}};
		soc_netsoc_sdram_inti_p0_we_n <= 1'd1;
		soc_netsoc_sdram_inti_p0_cas_n <= 1'd1;
		soc_netsoc_sdram_inti_p0_ras_n <= 1'd1;
	end
end
assign soc_netsoc_sdram_inti_p0_address = soc_netsoc_sdram_phaseinjector0_address_storage;
assign soc_netsoc_sdram_inti_p0_bank = soc_netsoc_sdram_phaseinjector0_baddress_storage;
assign soc_netsoc_sdram_inti_p0_wrdata_en = (soc_netsoc_sdram_phaseinjector0_command_issue_re & soc_netsoc_sdram_phaseinjector0_command_storage[4]);
assign soc_netsoc_sdram_inti_p0_rddata_en = (soc_netsoc_sdram_phaseinjector0_command_issue_re & soc_netsoc_sdram_phaseinjector0_command_storage[5]);
assign soc_netsoc_sdram_inti_p0_wrdata = soc_netsoc_sdram_phaseinjector0_wrdata_storage;
assign soc_netsoc_sdram_inti_p0_wrdata_mask = 1'd0;
always @(*) begin
	soc_netsoc_sdram_inti_p1_we_n <= 1'd1;
	soc_netsoc_sdram_inti_p1_cas_n <= 1'd1;
	soc_netsoc_sdram_inti_p1_cs_n <= 1'd1;
	soc_netsoc_sdram_inti_p1_ras_n <= 1'd1;
	if (soc_netsoc_sdram_phaseinjector1_command_issue_re) begin
		soc_netsoc_sdram_inti_p1_cs_n <= {1{(~soc_netsoc_sdram_phaseinjector1_command_storage[0])}};
		soc_netsoc_sdram_inti_p1_we_n <= (~soc_netsoc_sdram_phaseinjector1_command_storage[1]);
		soc_netsoc_sdram_inti_p1_cas_n <= (~soc_netsoc_sdram_phaseinjector1_command_storage[2]);
		soc_netsoc_sdram_inti_p1_ras_n <= (~soc_netsoc_sdram_phaseinjector1_command_storage[3]);
	end else begin
		soc_netsoc_sdram_inti_p1_cs_n <= {1{1'd1}};
		soc_netsoc_sdram_inti_p1_we_n <= 1'd1;
		soc_netsoc_sdram_inti_p1_cas_n <= 1'd1;
		soc_netsoc_sdram_inti_p1_ras_n <= 1'd1;
	end
end
assign soc_netsoc_sdram_inti_p1_address = soc_netsoc_sdram_phaseinjector1_address_storage;
assign soc_netsoc_sdram_inti_p1_bank = soc_netsoc_sdram_phaseinjector1_baddress_storage;
assign soc_netsoc_sdram_inti_p1_wrdata_en = (soc_netsoc_sdram_phaseinjector1_command_issue_re & soc_netsoc_sdram_phaseinjector1_command_storage[4]);
assign soc_netsoc_sdram_inti_p1_rddata_en = (soc_netsoc_sdram_phaseinjector1_command_issue_re & soc_netsoc_sdram_phaseinjector1_command_storage[5]);
assign soc_netsoc_sdram_inti_p1_wrdata = soc_netsoc_sdram_phaseinjector1_wrdata_storage;
assign soc_netsoc_sdram_inti_p1_wrdata_mask = 1'd0;
always @(*) begin
	soc_netsoc_sdram_inti_p2_we_n <= 1'd1;
	soc_netsoc_sdram_inti_p2_cas_n <= 1'd1;
	soc_netsoc_sdram_inti_p2_cs_n <= 1'd1;
	soc_netsoc_sdram_inti_p2_ras_n <= 1'd1;
	if (soc_netsoc_sdram_phaseinjector2_command_issue_re) begin
		soc_netsoc_sdram_inti_p2_cs_n <= {1{(~soc_netsoc_sdram_phaseinjector2_command_storage[0])}};
		soc_netsoc_sdram_inti_p2_we_n <= (~soc_netsoc_sdram_phaseinjector2_command_storage[1]);
		soc_netsoc_sdram_inti_p2_cas_n <= (~soc_netsoc_sdram_phaseinjector2_command_storage[2]);
		soc_netsoc_sdram_inti_p2_ras_n <= (~soc_netsoc_sdram_phaseinjector2_command_storage[3]);
	end else begin
		soc_netsoc_sdram_inti_p2_cs_n <= {1{1'd1}};
		soc_netsoc_sdram_inti_p2_we_n <= 1'd1;
		soc_netsoc_sdram_inti_p2_cas_n <= 1'd1;
		soc_netsoc_sdram_inti_p2_ras_n <= 1'd1;
	end
end
assign soc_netsoc_sdram_inti_p2_address = soc_netsoc_sdram_phaseinjector2_address_storage;
assign soc_netsoc_sdram_inti_p2_bank = soc_netsoc_sdram_phaseinjector2_baddress_storage;
assign soc_netsoc_sdram_inti_p2_wrdata_en = (soc_netsoc_sdram_phaseinjector2_command_issue_re & soc_netsoc_sdram_phaseinjector2_command_storage[4]);
assign soc_netsoc_sdram_inti_p2_rddata_en = (soc_netsoc_sdram_phaseinjector2_command_issue_re & soc_netsoc_sdram_phaseinjector2_command_storage[5]);
assign soc_netsoc_sdram_inti_p2_wrdata = soc_netsoc_sdram_phaseinjector2_wrdata_storage;
assign soc_netsoc_sdram_inti_p2_wrdata_mask = 1'd0;
always @(*) begin
	soc_netsoc_sdram_inti_p3_we_n <= 1'd1;
	soc_netsoc_sdram_inti_p3_cas_n <= 1'd1;
	soc_netsoc_sdram_inti_p3_cs_n <= 1'd1;
	soc_netsoc_sdram_inti_p3_ras_n <= 1'd1;
	if (soc_netsoc_sdram_phaseinjector3_command_issue_re) begin
		soc_netsoc_sdram_inti_p3_cs_n <= {1{(~soc_netsoc_sdram_phaseinjector3_command_storage[0])}};
		soc_netsoc_sdram_inti_p3_we_n <= (~soc_netsoc_sdram_phaseinjector3_command_storage[1]);
		soc_netsoc_sdram_inti_p3_cas_n <= (~soc_netsoc_sdram_phaseinjector3_command_storage[2]);
		soc_netsoc_sdram_inti_p3_ras_n <= (~soc_netsoc_sdram_phaseinjector3_command_storage[3]);
	end else begin
		soc_netsoc_sdram_inti_p3_cs_n <= {1{1'd1}};
		soc_netsoc_sdram_inti_p3_we_n <= 1'd1;
		soc_netsoc_sdram_inti_p3_cas_n <= 1'd1;
		soc_netsoc_sdram_inti_p3_ras_n <= 1'd1;
	end
end
assign soc_netsoc_sdram_inti_p3_address = soc_netsoc_sdram_phaseinjector3_address_storage;
assign soc_netsoc_sdram_inti_p3_bank = soc_netsoc_sdram_phaseinjector3_baddress_storage;
assign soc_netsoc_sdram_inti_p3_wrdata_en = (soc_netsoc_sdram_phaseinjector3_command_issue_re & soc_netsoc_sdram_phaseinjector3_command_storage[4]);
assign soc_netsoc_sdram_inti_p3_rddata_en = (soc_netsoc_sdram_phaseinjector3_command_issue_re & soc_netsoc_sdram_phaseinjector3_command_storage[5]);
assign soc_netsoc_sdram_inti_p3_wrdata = soc_netsoc_sdram_phaseinjector3_wrdata_storage;
assign soc_netsoc_sdram_inti_p3_wrdata_mask = 1'd0;
assign soc_netsoc_sdram_bankmachine0_req_valid = soc_netsoc_sdram_interface_bank0_valid;
assign soc_netsoc_sdram_interface_bank0_ready = soc_netsoc_sdram_bankmachine0_req_ready;
assign soc_netsoc_sdram_bankmachine0_req_we = soc_netsoc_sdram_interface_bank0_we;
assign soc_netsoc_sdram_bankmachine0_req_addr = soc_netsoc_sdram_interface_bank0_addr;
assign soc_netsoc_sdram_interface_bank0_lock = soc_netsoc_sdram_bankmachine0_req_lock;
assign soc_netsoc_sdram_interface_bank0_wdata_ready = soc_netsoc_sdram_bankmachine0_req_wdata_ready;
assign soc_netsoc_sdram_interface_bank0_rdata_valid = soc_netsoc_sdram_bankmachine0_req_rdata_valid;
assign soc_netsoc_sdram_bankmachine1_req_valid = soc_netsoc_sdram_interface_bank1_valid;
assign soc_netsoc_sdram_interface_bank1_ready = soc_netsoc_sdram_bankmachine1_req_ready;
assign soc_netsoc_sdram_bankmachine1_req_we = soc_netsoc_sdram_interface_bank1_we;
assign soc_netsoc_sdram_bankmachine1_req_addr = soc_netsoc_sdram_interface_bank1_addr;
assign soc_netsoc_sdram_interface_bank1_lock = soc_netsoc_sdram_bankmachine1_req_lock;
assign soc_netsoc_sdram_interface_bank1_wdata_ready = soc_netsoc_sdram_bankmachine1_req_wdata_ready;
assign soc_netsoc_sdram_interface_bank1_rdata_valid = soc_netsoc_sdram_bankmachine1_req_rdata_valid;
assign soc_netsoc_sdram_bankmachine2_req_valid = soc_netsoc_sdram_interface_bank2_valid;
assign soc_netsoc_sdram_interface_bank2_ready = soc_netsoc_sdram_bankmachine2_req_ready;
assign soc_netsoc_sdram_bankmachine2_req_we = soc_netsoc_sdram_interface_bank2_we;
assign soc_netsoc_sdram_bankmachine2_req_addr = soc_netsoc_sdram_interface_bank2_addr;
assign soc_netsoc_sdram_interface_bank2_lock = soc_netsoc_sdram_bankmachine2_req_lock;
assign soc_netsoc_sdram_interface_bank2_wdata_ready = soc_netsoc_sdram_bankmachine2_req_wdata_ready;
assign soc_netsoc_sdram_interface_bank2_rdata_valid = soc_netsoc_sdram_bankmachine2_req_rdata_valid;
assign soc_netsoc_sdram_bankmachine3_req_valid = soc_netsoc_sdram_interface_bank3_valid;
assign soc_netsoc_sdram_interface_bank3_ready = soc_netsoc_sdram_bankmachine3_req_ready;
assign soc_netsoc_sdram_bankmachine3_req_we = soc_netsoc_sdram_interface_bank3_we;
assign soc_netsoc_sdram_bankmachine3_req_addr = soc_netsoc_sdram_interface_bank3_addr;
assign soc_netsoc_sdram_interface_bank3_lock = soc_netsoc_sdram_bankmachine3_req_lock;
assign soc_netsoc_sdram_interface_bank3_wdata_ready = soc_netsoc_sdram_bankmachine3_req_wdata_ready;
assign soc_netsoc_sdram_interface_bank3_rdata_valid = soc_netsoc_sdram_bankmachine3_req_rdata_valid;
assign soc_netsoc_sdram_bankmachine4_req_valid = soc_netsoc_sdram_interface_bank4_valid;
assign soc_netsoc_sdram_interface_bank4_ready = soc_netsoc_sdram_bankmachine4_req_ready;
assign soc_netsoc_sdram_bankmachine4_req_we = soc_netsoc_sdram_interface_bank4_we;
assign soc_netsoc_sdram_bankmachine4_req_addr = soc_netsoc_sdram_interface_bank4_addr;
assign soc_netsoc_sdram_interface_bank4_lock = soc_netsoc_sdram_bankmachine4_req_lock;
assign soc_netsoc_sdram_interface_bank4_wdata_ready = soc_netsoc_sdram_bankmachine4_req_wdata_ready;
assign soc_netsoc_sdram_interface_bank4_rdata_valid = soc_netsoc_sdram_bankmachine4_req_rdata_valid;
assign soc_netsoc_sdram_bankmachine5_req_valid = soc_netsoc_sdram_interface_bank5_valid;
assign soc_netsoc_sdram_interface_bank5_ready = soc_netsoc_sdram_bankmachine5_req_ready;
assign soc_netsoc_sdram_bankmachine5_req_we = soc_netsoc_sdram_interface_bank5_we;
assign soc_netsoc_sdram_bankmachine5_req_addr = soc_netsoc_sdram_interface_bank5_addr;
assign soc_netsoc_sdram_interface_bank5_lock = soc_netsoc_sdram_bankmachine5_req_lock;
assign soc_netsoc_sdram_interface_bank5_wdata_ready = soc_netsoc_sdram_bankmachine5_req_wdata_ready;
assign soc_netsoc_sdram_interface_bank5_rdata_valid = soc_netsoc_sdram_bankmachine5_req_rdata_valid;
assign soc_netsoc_sdram_bankmachine6_req_valid = soc_netsoc_sdram_interface_bank6_valid;
assign soc_netsoc_sdram_interface_bank6_ready = soc_netsoc_sdram_bankmachine6_req_ready;
assign soc_netsoc_sdram_bankmachine6_req_we = soc_netsoc_sdram_interface_bank6_we;
assign soc_netsoc_sdram_bankmachine6_req_addr = soc_netsoc_sdram_interface_bank6_addr;
assign soc_netsoc_sdram_interface_bank6_lock = soc_netsoc_sdram_bankmachine6_req_lock;
assign soc_netsoc_sdram_interface_bank6_wdata_ready = soc_netsoc_sdram_bankmachine6_req_wdata_ready;
assign soc_netsoc_sdram_interface_bank6_rdata_valid = soc_netsoc_sdram_bankmachine6_req_rdata_valid;
assign soc_netsoc_sdram_bankmachine7_req_valid = soc_netsoc_sdram_interface_bank7_valid;
assign soc_netsoc_sdram_interface_bank7_ready = soc_netsoc_sdram_bankmachine7_req_ready;
assign soc_netsoc_sdram_bankmachine7_req_we = soc_netsoc_sdram_interface_bank7_we;
assign soc_netsoc_sdram_bankmachine7_req_addr = soc_netsoc_sdram_interface_bank7_addr;
assign soc_netsoc_sdram_interface_bank7_lock = soc_netsoc_sdram_bankmachine7_req_lock;
assign soc_netsoc_sdram_interface_bank7_wdata_ready = soc_netsoc_sdram_bankmachine7_req_wdata_ready;
assign soc_netsoc_sdram_interface_bank7_rdata_valid = soc_netsoc_sdram_bankmachine7_req_rdata_valid;
assign soc_netsoc_sdram_timer_wait = (~soc_netsoc_sdram_timer_done0);
assign soc_netsoc_sdram_postponer_req_i = soc_netsoc_sdram_timer_done0;
assign soc_netsoc_sdram_wants_refresh = soc_netsoc_sdram_postponer_req_o;
assign soc_netsoc_sdram_wants_zqcs = soc_netsoc_sdram_zqcs_timer_done0;
assign soc_netsoc_sdram_zqcs_timer_wait = (~soc_netsoc_sdram_zqcs_executer_done);
assign soc_netsoc_sdram_timer_done1 = (soc_netsoc_sdram_timer_count1 == 1'd0);
assign soc_netsoc_sdram_timer_done0 = soc_netsoc_sdram_timer_done1;
assign soc_netsoc_sdram_timer_count0 = soc_netsoc_sdram_timer_count1;
assign soc_netsoc_sdram_sequencer_start1 = (soc_netsoc_sdram_sequencer_start0 | (soc_netsoc_sdram_sequencer_count != 1'd0));
assign soc_netsoc_sdram_sequencer_done0 = (soc_netsoc_sdram_sequencer_done1 & (soc_netsoc_sdram_sequencer_count == 1'd0));
assign soc_netsoc_sdram_zqcs_timer_done1 = (soc_netsoc_sdram_zqcs_timer_count1 == 1'd0);
assign soc_netsoc_sdram_zqcs_timer_done0 = soc_netsoc_sdram_zqcs_timer_done1;
assign soc_netsoc_sdram_zqcs_timer_count0 = soc_netsoc_sdram_zqcs_timer_count1;
always @(*) begin
	soc_netsoc_sdram_cmd_valid <= 1'd0;
	soc_netsoc_sdram_zqcs_executer_start <= 1'd0;
	soc_netsoc_sdram_cmd_last <= 1'd0;
	soc_netsoc_sdram_sequencer_start0 <= 1'd0;
	vns_refresher_next_state <= 2'd0;
	vns_refresher_next_state <= vns_refresher_state;
	case (vns_refresher_state)
		1'd1: begin
			soc_netsoc_sdram_cmd_valid <= 1'd1;
			if (soc_netsoc_sdram_cmd_ready) begin
				soc_netsoc_sdram_sequencer_start0 <= 1'd1;
				vns_refresher_next_state <= 2'd2;
			end
		end
		2'd2: begin
			soc_netsoc_sdram_cmd_valid <= 1'd1;
			if (soc_netsoc_sdram_sequencer_done0) begin
				if (soc_netsoc_sdram_wants_zqcs) begin
					soc_netsoc_sdram_zqcs_executer_start <= 1'd1;
					vns_refresher_next_state <= 2'd3;
				end else begin
					soc_netsoc_sdram_cmd_valid <= 1'd0;
					soc_netsoc_sdram_cmd_last <= 1'd1;
					vns_refresher_next_state <= 1'd0;
				end
			end
		end
		2'd3: begin
			soc_netsoc_sdram_cmd_valid <= 1'd1;
			if (soc_netsoc_sdram_zqcs_executer_done) begin
				soc_netsoc_sdram_cmd_valid <= 1'd0;
				soc_netsoc_sdram_cmd_last <= 1'd1;
				vns_refresher_next_state <= 1'd0;
			end
		end
		default: begin
			if (1'd1) begin
				if (soc_netsoc_sdram_wants_refresh) begin
					vns_refresher_next_state <= 1'd1;
				end
			end
		end
	endcase
end
assign soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_sink_valid = soc_netsoc_sdram_bankmachine0_req_valid;
assign soc_netsoc_sdram_bankmachine0_req_ready = soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_sink_ready;
assign soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_sink_payload_we = soc_netsoc_sdram_bankmachine0_req_we;
assign soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_sink_payload_addr = soc_netsoc_sdram_bankmachine0_req_addr;
assign soc_netsoc_sdram_bankmachine0_cmd_buffer_sink_valid = soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_valid;
assign soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_ready = soc_netsoc_sdram_bankmachine0_cmd_buffer_sink_ready;
assign soc_netsoc_sdram_bankmachine0_cmd_buffer_sink_first = soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_first;
assign soc_netsoc_sdram_bankmachine0_cmd_buffer_sink_last = soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_last;
assign soc_netsoc_sdram_bankmachine0_cmd_buffer_sink_payload_we = soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_payload_we;
assign soc_netsoc_sdram_bankmachine0_cmd_buffer_sink_payload_addr = soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_payload_addr;
assign soc_netsoc_sdram_bankmachine0_cmd_buffer_source_ready = (soc_netsoc_sdram_bankmachine0_req_wdata_ready | soc_netsoc_sdram_bankmachine0_req_rdata_valid);
assign soc_netsoc_sdram_bankmachine0_req_lock = (soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_valid | soc_netsoc_sdram_bankmachine0_cmd_buffer_source_valid);
assign soc_netsoc_sdram_bankmachine0_row_hit = (soc_netsoc_sdram_bankmachine0_row == soc_netsoc_sdram_bankmachine0_cmd_buffer_source_payload_addr[20:7]);
assign soc_netsoc_sdram_bankmachine0_cmd_payload_ba = 1'd0;
always @(*) begin
	soc_netsoc_sdram_bankmachine0_cmd_payload_a <= 14'd0;
	if (soc_netsoc_sdram_bankmachine0_row_col_n_addr_sel) begin
		soc_netsoc_sdram_bankmachine0_cmd_payload_a <= soc_netsoc_sdram_bankmachine0_cmd_buffer_source_payload_addr[20:7];
	end else begin
		soc_netsoc_sdram_bankmachine0_cmd_payload_a <= ((soc_netsoc_sdram_bankmachine0_auto_precharge <<< 4'd10) | {soc_netsoc_sdram_bankmachine0_cmd_buffer_source_payload_addr[6:0], {3{1'd0}}});
	end
end
assign soc_netsoc_sdram_bankmachine0_twtpcon_valid = ((soc_netsoc_sdram_bankmachine0_cmd_valid & soc_netsoc_sdram_bankmachine0_cmd_ready) & soc_netsoc_sdram_bankmachine0_cmd_payload_is_write);
assign soc_netsoc_sdram_bankmachine0_trccon_valid = ((soc_netsoc_sdram_bankmachine0_cmd_valid & soc_netsoc_sdram_bankmachine0_cmd_ready) & soc_netsoc_sdram_bankmachine0_row_open);
assign soc_netsoc_sdram_bankmachine0_trascon_valid = ((soc_netsoc_sdram_bankmachine0_cmd_valid & soc_netsoc_sdram_bankmachine0_cmd_ready) & soc_netsoc_sdram_bankmachine0_row_open);
always @(*) begin
	soc_netsoc_sdram_bankmachine0_auto_precharge <= 1'd0;
	if ((soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_valid & soc_netsoc_sdram_bankmachine0_cmd_buffer_source_valid)) begin
		if ((soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_payload_addr[20:7] != soc_netsoc_sdram_bankmachine0_cmd_buffer_source_payload_addr[20:7])) begin
			soc_netsoc_sdram_bankmachine0_auto_precharge <= (soc_netsoc_sdram_bankmachine0_row_close == 1'd0);
		end
	end
end
assign soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_din = {soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_in_last, soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_in_first, soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_in_payload_addr, soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_in_payload_we};
assign {soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_out_last, soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_out_first, soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_out_payload_addr, soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_out_payload_we} = soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_dout;
assign soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_sink_ready = soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_writable;
assign soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_we = soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_sink_valid;
assign soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_in_first = soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_sink_first;
assign soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_in_last = soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_sink_last;
assign soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_in_payload_we = soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_sink_payload_we;
assign soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_in_payload_addr = soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_sink_payload_addr;
assign soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_valid = soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_readable;
assign soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_first = soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_out_first;
assign soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_last = soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_out_last;
assign soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_payload_we = soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_out_payload_we;
assign soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_payload_addr = soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_fifo_out_payload_addr;
assign soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_re = soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_source_ready;
always @(*) begin
	soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_wrport_adr <= 3'd0;
	if (soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_replace) begin
		soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_wrport_adr <= (soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_produce - 1'd1);
	end else begin
		soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_wrport_adr <= soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_produce;
	end
end
assign soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_wrport_dat_w = soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_din;
assign soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_wrport_we = (soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_we & (soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_writable | soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_replace));
assign soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_do_read = (soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_readable & soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_re);
assign soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_rdport_adr = soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_consume;
assign soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_dout = soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_rdport_dat_r;
assign soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_writable = (soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_level != 4'd8);
assign soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_readable = (soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_level != 1'd0);
assign soc_netsoc_sdram_bankmachine0_cmd_buffer_pipe_ce = (soc_netsoc_sdram_bankmachine0_cmd_buffer_source_ready | (~soc_netsoc_sdram_bankmachine0_cmd_buffer_valid_n));
assign soc_netsoc_sdram_bankmachine0_cmd_buffer_sink_ready = soc_netsoc_sdram_bankmachine0_cmd_buffer_pipe_ce;
assign soc_netsoc_sdram_bankmachine0_cmd_buffer_source_valid = soc_netsoc_sdram_bankmachine0_cmd_buffer_valid_n;
assign soc_netsoc_sdram_bankmachine0_cmd_buffer_busy = (1'd0 | soc_netsoc_sdram_bankmachine0_cmd_buffer_valid_n);
assign soc_netsoc_sdram_bankmachine0_cmd_buffer_source_first = soc_netsoc_sdram_bankmachine0_cmd_buffer_first_n;
assign soc_netsoc_sdram_bankmachine0_cmd_buffer_source_last = soc_netsoc_sdram_bankmachine0_cmd_buffer_last_n;
always @(*) begin
	soc_netsoc_sdram_bankmachine0_req_wdata_ready <= 1'd0;
	soc_netsoc_sdram_bankmachine0_row_open <= 1'd0;
	soc_netsoc_sdram_bankmachine0_req_rdata_valid <= 1'd0;
	soc_netsoc_sdram_bankmachine0_row_col_n_addr_sel <= 1'd0;
	soc_netsoc_sdram_bankmachine0_refresh_gnt <= 1'd0;
	soc_netsoc_sdram_bankmachine0_cmd_valid <= 1'd0;
	soc_netsoc_sdram_bankmachine0_cmd_payload_cas <= 1'd0;
	soc_netsoc_sdram_bankmachine0_cmd_payload_ras <= 1'd0;
	soc_netsoc_sdram_bankmachine0_cmd_payload_we <= 1'd0;
	soc_netsoc_sdram_bankmachine0_cmd_payload_is_cmd <= 1'd0;
	vns_bankmachine0_next_state <= 3'd0;
	soc_netsoc_sdram_bankmachine0_cmd_payload_is_read <= 1'd0;
	soc_netsoc_sdram_bankmachine0_row_close <= 1'd0;
	soc_netsoc_sdram_bankmachine0_cmd_payload_is_write <= 1'd0;
	vns_bankmachine0_next_state <= vns_bankmachine0_state;
	case (vns_bankmachine0_state)
		1'd1: begin
			if ((soc_netsoc_sdram_bankmachine0_twtpcon_ready & soc_netsoc_sdram_bankmachine0_trascon_ready)) begin
				soc_netsoc_sdram_bankmachine0_cmd_valid <= 1'd1;
				if (soc_netsoc_sdram_bankmachine0_cmd_ready) begin
					vns_bankmachine0_next_state <= 3'd5;
				end
				soc_netsoc_sdram_bankmachine0_cmd_payload_ras <= 1'd1;
				soc_netsoc_sdram_bankmachine0_cmd_payload_we <= 1'd1;
				soc_netsoc_sdram_bankmachine0_cmd_payload_is_cmd <= 1'd1;
			end
			soc_netsoc_sdram_bankmachine0_row_close <= 1'd1;
		end
		2'd2: begin
			if ((soc_netsoc_sdram_bankmachine0_twtpcon_ready & soc_netsoc_sdram_bankmachine0_trascon_ready)) begin
				vns_bankmachine0_next_state <= 3'd5;
			end
			soc_netsoc_sdram_bankmachine0_row_close <= 1'd1;
		end
		2'd3: begin
			if (soc_netsoc_sdram_bankmachine0_trccon_ready) begin
				soc_netsoc_sdram_bankmachine0_row_col_n_addr_sel <= 1'd1;
				soc_netsoc_sdram_bankmachine0_row_open <= 1'd1;
				soc_netsoc_sdram_bankmachine0_cmd_valid <= 1'd1;
				soc_netsoc_sdram_bankmachine0_cmd_payload_is_cmd <= 1'd1;
				if (soc_netsoc_sdram_bankmachine0_cmd_ready) begin
					vns_bankmachine0_next_state <= 3'd6;
				end
				soc_netsoc_sdram_bankmachine0_cmd_payload_ras <= 1'd1;
			end
		end
		3'd4: begin
			if (soc_netsoc_sdram_bankmachine0_twtpcon_ready) begin
				soc_netsoc_sdram_bankmachine0_refresh_gnt <= 1'd1;
			end
			soc_netsoc_sdram_bankmachine0_row_close <= 1'd1;
			soc_netsoc_sdram_bankmachine0_cmd_payload_is_cmd <= 1'd1;
			if ((~soc_netsoc_sdram_bankmachine0_refresh_req)) begin
				vns_bankmachine0_next_state <= 1'd0;
			end
		end
		3'd5: begin
			vns_bankmachine0_next_state <= 2'd3;
		end
		3'd6: begin
			vns_bankmachine0_next_state <= 1'd0;
		end
		default: begin
			if (soc_netsoc_sdram_bankmachine0_refresh_req) begin
				vns_bankmachine0_next_state <= 3'd4;
			end else begin
				if (soc_netsoc_sdram_bankmachine0_cmd_buffer_source_valid) begin
					if (soc_netsoc_sdram_bankmachine0_row_opened) begin
						if (soc_netsoc_sdram_bankmachine0_row_hit) begin
							soc_netsoc_sdram_bankmachine0_cmd_valid <= 1'd1;
							if (soc_netsoc_sdram_bankmachine0_cmd_buffer_source_payload_we) begin
								soc_netsoc_sdram_bankmachine0_req_wdata_ready <= soc_netsoc_sdram_bankmachine0_cmd_ready;
								soc_netsoc_sdram_bankmachine0_cmd_payload_is_write <= 1'd1;
								soc_netsoc_sdram_bankmachine0_cmd_payload_we <= 1'd1;
							end else begin
								soc_netsoc_sdram_bankmachine0_req_rdata_valid <= soc_netsoc_sdram_bankmachine0_cmd_ready;
								soc_netsoc_sdram_bankmachine0_cmd_payload_is_read <= 1'd1;
							end
							soc_netsoc_sdram_bankmachine0_cmd_payload_cas <= 1'd1;
							if ((soc_netsoc_sdram_bankmachine0_cmd_ready & soc_netsoc_sdram_bankmachine0_auto_precharge)) begin
								vns_bankmachine0_next_state <= 2'd2;
							end
						end else begin
							vns_bankmachine0_next_state <= 1'd1;
						end
					end else begin
						vns_bankmachine0_next_state <= 2'd3;
					end
				end
			end
		end
	endcase
end
assign soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_sink_valid = soc_netsoc_sdram_bankmachine1_req_valid;
assign soc_netsoc_sdram_bankmachine1_req_ready = soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_sink_ready;
assign soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_sink_payload_we = soc_netsoc_sdram_bankmachine1_req_we;
assign soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_sink_payload_addr = soc_netsoc_sdram_bankmachine1_req_addr;
assign soc_netsoc_sdram_bankmachine1_cmd_buffer_sink_valid = soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_valid;
assign soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_ready = soc_netsoc_sdram_bankmachine1_cmd_buffer_sink_ready;
assign soc_netsoc_sdram_bankmachine1_cmd_buffer_sink_first = soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_first;
assign soc_netsoc_sdram_bankmachine1_cmd_buffer_sink_last = soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_last;
assign soc_netsoc_sdram_bankmachine1_cmd_buffer_sink_payload_we = soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_payload_we;
assign soc_netsoc_sdram_bankmachine1_cmd_buffer_sink_payload_addr = soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_payload_addr;
assign soc_netsoc_sdram_bankmachine1_cmd_buffer_source_ready = (soc_netsoc_sdram_bankmachine1_req_wdata_ready | soc_netsoc_sdram_bankmachine1_req_rdata_valid);
assign soc_netsoc_sdram_bankmachine1_req_lock = (soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_valid | soc_netsoc_sdram_bankmachine1_cmd_buffer_source_valid);
assign soc_netsoc_sdram_bankmachine1_row_hit = (soc_netsoc_sdram_bankmachine1_row == soc_netsoc_sdram_bankmachine1_cmd_buffer_source_payload_addr[20:7]);
assign soc_netsoc_sdram_bankmachine1_cmd_payload_ba = 1'd1;
always @(*) begin
	soc_netsoc_sdram_bankmachine1_cmd_payload_a <= 14'd0;
	if (soc_netsoc_sdram_bankmachine1_row_col_n_addr_sel) begin
		soc_netsoc_sdram_bankmachine1_cmd_payload_a <= soc_netsoc_sdram_bankmachine1_cmd_buffer_source_payload_addr[20:7];
	end else begin
		soc_netsoc_sdram_bankmachine1_cmd_payload_a <= ((soc_netsoc_sdram_bankmachine1_auto_precharge <<< 4'd10) | {soc_netsoc_sdram_bankmachine1_cmd_buffer_source_payload_addr[6:0], {3{1'd0}}});
	end
end
assign soc_netsoc_sdram_bankmachine1_twtpcon_valid = ((soc_netsoc_sdram_bankmachine1_cmd_valid & soc_netsoc_sdram_bankmachine1_cmd_ready) & soc_netsoc_sdram_bankmachine1_cmd_payload_is_write);
assign soc_netsoc_sdram_bankmachine1_trccon_valid = ((soc_netsoc_sdram_bankmachine1_cmd_valid & soc_netsoc_sdram_bankmachine1_cmd_ready) & soc_netsoc_sdram_bankmachine1_row_open);
assign soc_netsoc_sdram_bankmachine1_trascon_valid = ((soc_netsoc_sdram_bankmachine1_cmd_valid & soc_netsoc_sdram_bankmachine1_cmd_ready) & soc_netsoc_sdram_bankmachine1_row_open);
always @(*) begin
	soc_netsoc_sdram_bankmachine1_auto_precharge <= 1'd0;
	if ((soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_valid & soc_netsoc_sdram_bankmachine1_cmd_buffer_source_valid)) begin
		if ((soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_payload_addr[20:7] != soc_netsoc_sdram_bankmachine1_cmd_buffer_source_payload_addr[20:7])) begin
			soc_netsoc_sdram_bankmachine1_auto_precharge <= (soc_netsoc_sdram_bankmachine1_row_close == 1'd0);
		end
	end
end
assign soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_din = {soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_in_last, soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_in_first, soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_in_payload_addr, soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_in_payload_we};
assign {soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_out_last, soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_out_first, soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_out_payload_addr, soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_out_payload_we} = soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_dout;
assign soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_sink_ready = soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_writable;
assign soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_we = soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_sink_valid;
assign soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_in_first = soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_sink_first;
assign soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_in_last = soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_sink_last;
assign soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_in_payload_we = soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_sink_payload_we;
assign soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_in_payload_addr = soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_sink_payload_addr;
assign soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_valid = soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_readable;
assign soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_first = soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_out_first;
assign soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_last = soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_out_last;
assign soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_payload_we = soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_out_payload_we;
assign soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_payload_addr = soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_fifo_out_payload_addr;
assign soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_re = soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_source_ready;
always @(*) begin
	soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_wrport_adr <= 3'd0;
	if (soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_replace) begin
		soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_wrport_adr <= (soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_produce - 1'd1);
	end else begin
		soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_wrport_adr <= soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_produce;
	end
end
assign soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_wrport_dat_w = soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_din;
assign soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_wrport_we = (soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_we & (soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_writable | soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_replace));
assign soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_do_read = (soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_readable & soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_re);
assign soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_rdport_adr = soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_consume;
assign soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_dout = soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_rdport_dat_r;
assign soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_writable = (soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_level != 4'd8);
assign soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_readable = (soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_level != 1'd0);
assign soc_netsoc_sdram_bankmachine1_cmd_buffer_pipe_ce = (soc_netsoc_sdram_bankmachine1_cmd_buffer_source_ready | (~soc_netsoc_sdram_bankmachine1_cmd_buffer_valid_n));
assign soc_netsoc_sdram_bankmachine1_cmd_buffer_sink_ready = soc_netsoc_sdram_bankmachine1_cmd_buffer_pipe_ce;
assign soc_netsoc_sdram_bankmachine1_cmd_buffer_source_valid = soc_netsoc_sdram_bankmachine1_cmd_buffer_valid_n;
assign soc_netsoc_sdram_bankmachine1_cmd_buffer_busy = (1'd0 | soc_netsoc_sdram_bankmachine1_cmd_buffer_valid_n);
assign soc_netsoc_sdram_bankmachine1_cmd_buffer_source_first = soc_netsoc_sdram_bankmachine1_cmd_buffer_first_n;
assign soc_netsoc_sdram_bankmachine1_cmd_buffer_source_last = soc_netsoc_sdram_bankmachine1_cmd_buffer_last_n;
always @(*) begin
	soc_netsoc_sdram_bankmachine1_cmd_payload_cas <= 1'd0;
	soc_netsoc_sdram_bankmachine1_cmd_payload_ras <= 1'd0;
	soc_netsoc_sdram_bankmachine1_cmd_payload_we <= 1'd0;
	soc_netsoc_sdram_bankmachine1_cmd_payload_is_cmd <= 1'd0;
	soc_netsoc_sdram_bankmachine1_row_open <= 1'd0;
	soc_netsoc_sdram_bankmachine1_cmd_payload_is_read <= 1'd0;
	soc_netsoc_sdram_bankmachine1_row_close <= 1'd0;
	soc_netsoc_sdram_bankmachine1_cmd_payload_is_write <= 1'd0;
	soc_netsoc_sdram_bankmachine1_req_wdata_ready <= 1'd0;
	soc_netsoc_sdram_bankmachine1_req_rdata_valid <= 1'd0;
	soc_netsoc_sdram_bankmachine1_row_col_n_addr_sel <= 1'd0;
	soc_netsoc_sdram_bankmachine1_refresh_gnt <= 1'd0;
	soc_netsoc_sdram_bankmachine1_cmd_valid <= 1'd0;
	vns_bankmachine1_next_state <= 3'd0;
	vns_bankmachine1_next_state <= vns_bankmachine1_state;
	case (vns_bankmachine1_state)
		1'd1: begin
			if ((soc_netsoc_sdram_bankmachine1_twtpcon_ready & soc_netsoc_sdram_bankmachine1_trascon_ready)) begin
				soc_netsoc_sdram_bankmachine1_cmd_valid <= 1'd1;
				if (soc_netsoc_sdram_bankmachine1_cmd_ready) begin
					vns_bankmachine1_next_state <= 3'd5;
				end
				soc_netsoc_sdram_bankmachine1_cmd_payload_ras <= 1'd1;
				soc_netsoc_sdram_bankmachine1_cmd_payload_we <= 1'd1;
				soc_netsoc_sdram_bankmachine1_cmd_payload_is_cmd <= 1'd1;
			end
			soc_netsoc_sdram_bankmachine1_row_close <= 1'd1;
		end
		2'd2: begin
			if ((soc_netsoc_sdram_bankmachine1_twtpcon_ready & soc_netsoc_sdram_bankmachine1_trascon_ready)) begin
				vns_bankmachine1_next_state <= 3'd5;
			end
			soc_netsoc_sdram_bankmachine1_row_close <= 1'd1;
		end
		2'd3: begin
			if (soc_netsoc_sdram_bankmachine1_trccon_ready) begin
				soc_netsoc_sdram_bankmachine1_row_col_n_addr_sel <= 1'd1;
				soc_netsoc_sdram_bankmachine1_row_open <= 1'd1;
				soc_netsoc_sdram_bankmachine1_cmd_valid <= 1'd1;
				soc_netsoc_sdram_bankmachine1_cmd_payload_is_cmd <= 1'd1;
				if (soc_netsoc_sdram_bankmachine1_cmd_ready) begin
					vns_bankmachine1_next_state <= 3'd6;
				end
				soc_netsoc_sdram_bankmachine1_cmd_payload_ras <= 1'd1;
			end
		end
		3'd4: begin
			if (soc_netsoc_sdram_bankmachine1_twtpcon_ready) begin
				soc_netsoc_sdram_bankmachine1_refresh_gnt <= 1'd1;
			end
			soc_netsoc_sdram_bankmachine1_row_close <= 1'd1;
			soc_netsoc_sdram_bankmachine1_cmd_payload_is_cmd <= 1'd1;
			if ((~soc_netsoc_sdram_bankmachine1_refresh_req)) begin
				vns_bankmachine1_next_state <= 1'd0;
			end
		end
		3'd5: begin
			vns_bankmachine1_next_state <= 2'd3;
		end
		3'd6: begin
			vns_bankmachine1_next_state <= 1'd0;
		end
		default: begin
			if (soc_netsoc_sdram_bankmachine1_refresh_req) begin
				vns_bankmachine1_next_state <= 3'd4;
			end else begin
				if (soc_netsoc_sdram_bankmachine1_cmd_buffer_source_valid) begin
					if (soc_netsoc_sdram_bankmachine1_row_opened) begin
						if (soc_netsoc_sdram_bankmachine1_row_hit) begin
							soc_netsoc_sdram_bankmachine1_cmd_valid <= 1'd1;
							if (soc_netsoc_sdram_bankmachine1_cmd_buffer_source_payload_we) begin
								soc_netsoc_sdram_bankmachine1_req_wdata_ready <= soc_netsoc_sdram_bankmachine1_cmd_ready;
								soc_netsoc_sdram_bankmachine1_cmd_payload_is_write <= 1'd1;
								soc_netsoc_sdram_bankmachine1_cmd_payload_we <= 1'd1;
							end else begin
								soc_netsoc_sdram_bankmachine1_req_rdata_valid <= soc_netsoc_sdram_bankmachine1_cmd_ready;
								soc_netsoc_sdram_bankmachine1_cmd_payload_is_read <= 1'd1;
							end
							soc_netsoc_sdram_bankmachine1_cmd_payload_cas <= 1'd1;
							if ((soc_netsoc_sdram_bankmachine1_cmd_ready & soc_netsoc_sdram_bankmachine1_auto_precharge)) begin
								vns_bankmachine1_next_state <= 2'd2;
							end
						end else begin
							vns_bankmachine1_next_state <= 1'd1;
						end
					end else begin
						vns_bankmachine1_next_state <= 2'd3;
					end
				end
			end
		end
	endcase
end
assign soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_sink_valid = soc_netsoc_sdram_bankmachine2_req_valid;
assign soc_netsoc_sdram_bankmachine2_req_ready = soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_sink_ready;
assign soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_sink_payload_we = soc_netsoc_sdram_bankmachine2_req_we;
assign soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_sink_payload_addr = soc_netsoc_sdram_bankmachine2_req_addr;
assign soc_netsoc_sdram_bankmachine2_cmd_buffer_sink_valid = soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_valid;
assign soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_ready = soc_netsoc_sdram_bankmachine2_cmd_buffer_sink_ready;
assign soc_netsoc_sdram_bankmachine2_cmd_buffer_sink_first = soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_first;
assign soc_netsoc_sdram_bankmachine2_cmd_buffer_sink_last = soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_last;
assign soc_netsoc_sdram_bankmachine2_cmd_buffer_sink_payload_we = soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_payload_we;
assign soc_netsoc_sdram_bankmachine2_cmd_buffer_sink_payload_addr = soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_payload_addr;
assign soc_netsoc_sdram_bankmachine2_cmd_buffer_source_ready = (soc_netsoc_sdram_bankmachine2_req_wdata_ready | soc_netsoc_sdram_bankmachine2_req_rdata_valid);
assign soc_netsoc_sdram_bankmachine2_req_lock = (soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_valid | soc_netsoc_sdram_bankmachine2_cmd_buffer_source_valid);
assign soc_netsoc_sdram_bankmachine2_row_hit = (soc_netsoc_sdram_bankmachine2_row == soc_netsoc_sdram_bankmachine2_cmd_buffer_source_payload_addr[20:7]);
assign soc_netsoc_sdram_bankmachine2_cmd_payload_ba = 2'd2;
always @(*) begin
	soc_netsoc_sdram_bankmachine2_cmd_payload_a <= 14'd0;
	if (soc_netsoc_sdram_bankmachine2_row_col_n_addr_sel) begin
		soc_netsoc_sdram_bankmachine2_cmd_payload_a <= soc_netsoc_sdram_bankmachine2_cmd_buffer_source_payload_addr[20:7];
	end else begin
		soc_netsoc_sdram_bankmachine2_cmd_payload_a <= ((soc_netsoc_sdram_bankmachine2_auto_precharge <<< 4'd10) | {soc_netsoc_sdram_bankmachine2_cmd_buffer_source_payload_addr[6:0], {3{1'd0}}});
	end
end
assign soc_netsoc_sdram_bankmachine2_twtpcon_valid = ((soc_netsoc_sdram_bankmachine2_cmd_valid & soc_netsoc_sdram_bankmachine2_cmd_ready) & soc_netsoc_sdram_bankmachine2_cmd_payload_is_write);
assign soc_netsoc_sdram_bankmachine2_trccon_valid = ((soc_netsoc_sdram_bankmachine2_cmd_valid & soc_netsoc_sdram_bankmachine2_cmd_ready) & soc_netsoc_sdram_bankmachine2_row_open);
assign soc_netsoc_sdram_bankmachine2_trascon_valid = ((soc_netsoc_sdram_bankmachine2_cmd_valid & soc_netsoc_sdram_bankmachine2_cmd_ready) & soc_netsoc_sdram_bankmachine2_row_open);
always @(*) begin
	soc_netsoc_sdram_bankmachine2_auto_precharge <= 1'd0;
	if ((soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_valid & soc_netsoc_sdram_bankmachine2_cmd_buffer_source_valid)) begin
		if ((soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_payload_addr[20:7] != soc_netsoc_sdram_bankmachine2_cmd_buffer_source_payload_addr[20:7])) begin
			soc_netsoc_sdram_bankmachine2_auto_precharge <= (soc_netsoc_sdram_bankmachine2_row_close == 1'd0);
		end
	end
end
assign soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_din = {soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_in_last, soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_in_first, soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_in_payload_addr, soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_in_payload_we};
assign {soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_out_last, soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_out_first, soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_out_payload_addr, soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_out_payload_we} = soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_dout;
assign soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_sink_ready = soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_writable;
assign soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_we = soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_sink_valid;
assign soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_in_first = soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_sink_first;
assign soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_in_last = soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_sink_last;
assign soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_in_payload_we = soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_sink_payload_we;
assign soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_in_payload_addr = soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_sink_payload_addr;
assign soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_valid = soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_readable;
assign soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_first = soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_out_first;
assign soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_last = soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_out_last;
assign soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_payload_we = soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_out_payload_we;
assign soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_payload_addr = soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_fifo_out_payload_addr;
assign soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_re = soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_source_ready;
always @(*) begin
	soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_wrport_adr <= 3'd0;
	if (soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_replace) begin
		soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_wrport_adr <= (soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_produce - 1'd1);
	end else begin
		soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_wrport_adr <= soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_produce;
	end
end
assign soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_wrport_dat_w = soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_din;
assign soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_wrport_we = (soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_we & (soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_writable | soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_replace));
assign soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_do_read = (soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_readable & soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_re);
assign soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_rdport_adr = soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_consume;
assign soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_dout = soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_rdport_dat_r;
assign soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_writable = (soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_level != 4'd8);
assign soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_readable = (soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_level != 1'd0);
assign soc_netsoc_sdram_bankmachine2_cmd_buffer_pipe_ce = (soc_netsoc_sdram_bankmachine2_cmd_buffer_source_ready | (~soc_netsoc_sdram_bankmachine2_cmd_buffer_valid_n));
assign soc_netsoc_sdram_bankmachine2_cmd_buffer_sink_ready = soc_netsoc_sdram_bankmachine2_cmd_buffer_pipe_ce;
assign soc_netsoc_sdram_bankmachine2_cmd_buffer_source_valid = soc_netsoc_sdram_bankmachine2_cmd_buffer_valid_n;
assign soc_netsoc_sdram_bankmachine2_cmd_buffer_busy = (1'd0 | soc_netsoc_sdram_bankmachine2_cmd_buffer_valid_n);
assign soc_netsoc_sdram_bankmachine2_cmd_buffer_source_first = soc_netsoc_sdram_bankmachine2_cmd_buffer_first_n;
assign soc_netsoc_sdram_bankmachine2_cmd_buffer_source_last = soc_netsoc_sdram_bankmachine2_cmd_buffer_last_n;
always @(*) begin
	soc_netsoc_sdram_bankmachine2_cmd_valid <= 1'd0;
	soc_netsoc_sdram_bankmachine2_cmd_payload_cas <= 1'd0;
	soc_netsoc_sdram_bankmachine2_cmd_payload_ras <= 1'd0;
	soc_netsoc_sdram_bankmachine2_cmd_payload_we <= 1'd0;
	soc_netsoc_sdram_bankmachine2_cmd_payload_is_cmd <= 1'd0;
	vns_bankmachine2_next_state <= 3'd0;
	soc_netsoc_sdram_bankmachine2_cmd_payload_is_read <= 1'd0;
	soc_netsoc_sdram_bankmachine2_row_close <= 1'd0;
	soc_netsoc_sdram_bankmachine2_cmd_payload_is_write <= 1'd0;
	soc_netsoc_sdram_bankmachine2_row_open <= 1'd0;
	soc_netsoc_sdram_bankmachine2_req_wdata_ready <= 1'd0;
	soc_netsoc_sdram_bankmachine2_req_rdata_valid <= 1'd0;
	soc_netsoc_sdram_bankmachine2_row_col_n_addr_sel <= 1'd0;
	soc_netsoc_sdram_bankmachine2_refresh_gnt <= 1'd0;
	vns_bankmachine2_next_state <= vns_bankmachine2_state;
	case (vns_bankmachine2_state)
		1'd1: begin
			if ((soc_netsoc_sdram_bankmachine2_twtpcon_ready & soc_netsoc_sdram_bankmachine2_trascon_ready)) begin
				soc_netsoc_sdram_bankmachine2_cmd_valid <= 1'd1;
				if (soc_netsoc_sdram_bankmachine2_cmd_ready) begin
					vns_bankmachine2_next_state <= 3'd5;
				end
				soc_netsoc_sdram_bankmachine2_cmd_payload_ras <= 1'd1;
				soc_netsoc_sdram_bankmachine2_cmd_payload_we <= 1'd1;
				soc_netsoc_sdram_bankmachine2_cmd_payload_is_cmd <= 1'd1;
			end
			soc_netsoc_sdram_bankmachine2_row_close <= 1'd1;
		end
		2'd2: begin
			if ((soc_netsoc_sdram_bankmachine2_twtpcon_ready & soc_netsoc_sdram_bankmachine2_trascon_ready)) begin
				vns_bankmachine2_next_state <= 3'd5;
			end
			soc_netsoc_sdram_bankmachine2_row_close <= 1'd1;
		end
		2'd3: begin
			if (soc_netsoc_sdram_bankmachine2_trccon_ready) begin
				soc_netsoc_sdram_bankmachine2_row_col_n_addr_sel <= 1'd1;
				soc_netsoc_sdram_bankmachine2_row_open <= 1'd1;
				soc_netsoc_sdram_bankmachine2_cmd_valid <= 1'd1;
				soc_netsoc_sdram_bankmachine2_cmd_payload_is_cmd <= 1'd1;
				if (soc_netsoc_sdram_bankmachine2_cmd_ready) begin
					vns_bankmachine2_next_state <= 3'd6;
				end
				soc_netsoc_sdram_bankmachine2_cmd_payload_ras <= 1'd1;
			end
		end
		3'd4: begin
			if (soc_netsoc_sdram_bankmachine2_twtpcon_ready) begin
				soc_netsoc_sdram_bankmachine2_refresh_gnt <= 1'd1;
			end
			soc_netsoc_sdram_bankmachine2_row_close <= 1'd1;
			soc_netsoc_sdram_bankmachine2_cmd_payload_is_cmd <= 1'd1;
			if ((~soc_netsoc_sdram_bankmachine2_refresh_req)) begin
				vns_bankmachine2_next_state <= 1'd0;
			end
		end
		3'd5: begin
			vns_bankmachine2_next_state <= 2'd3;
		end
		3'd6: begin
			vns_bankmachine2_next_state <= 1'd0;
		end
		default: begin
			if (soc_netsoc_sdram_bankmachine2_refresh_req) begin
				vns_bankmachine2_next_state <= 3'd4;
			end else begin
				if (soc_netsoc_sdram_bankmachine2_cmd_buffer_source_valid) begin
					if (soc_netsoc_sdram_bankmachine2_row_opened) begin
						if (soc_netsoc_sdram_bankmachine2_row_hit) begin
							soc_netsoc_sdram_bankmachine2_cmd_valid <= 1'd1;
							if (soc_netsoc_sdram_bankmachine2_cmd_buffer_source_payload_we) begin
								soc_netsoc_sdram_bankmachine2_req_wdata_ready <= soc_netsoc_sdram_bankmachine2_cmd_ready;
								soc_netsoc_sdram_bankmachine2_cmd_payload_is_write <= 1'd1;
								soc_netsoc_sdram_bankmachine2_cmd_payload_we <= 1'd1;
							end else begin
								soc_netsoc_sdram_bankmachine2_req_rdata_valid <= soc_netsoc_sdram_bankmachine2_cmd_ready;
								soc_netsoc_sdram_bankmachine2_cmd_payload_is_read <= 1'd1;
							end
							soc_netsoc_sdram_bankmachine2_cmd_payload_cas <= 1'd1;
							if ((soc_netsoc_sdram_bankmachine2_cmd_ready & soc_netsoc_sdram_bankmachine2_auto_precharge)) begin
								vns_bankmachine2_next_state <= 2'd2;
							end
						end else begin
							vns_bankmachine2_next_state <= 1'd1;
						end
					end else begin
						vns_bankmachine2_next_state <= 2'd3;
					end
				end
			end
		end
	endcase
end
assign soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_sink_valid = soc_netsoc_sdram_bankmachine3_req_valid;
assign soc_netsoc_sdram_bankmachine3_req_ready = soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_sink_ready;
assign soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_sink_payload_we = soc_netsoc_sdram_bankmachine3_req_we;
assign soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_sink_payload_addr = soc_netsoc_sdram_bankmachine3_req_addr;
assign soc_netsoc_sdram_bankmachine3_cmd_buffer_sink_valid = soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_valid;
assign soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_ready = soc_netsoc_sdram_bankmachine3_cmd_buffer_sink_ready;
assign soc_netsoc_sdram_bankmachine3_cmd_buffer_sink_first = soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_first;
assign soc_netsoc_sdram_bankmachine3_cmd_buffer_sink_last = soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_last;
assign soc_netsoc_sdram_bankmachine3_cmd_buffer_sink_payload_we = soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_payload_we;
assign soc_netsoc_sdram_bankmachine3_cmd_buffer_sink_payload_addr = soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_payload_addr;
assign soc_netsoc_sdram_bankmachine3_cmd_buffer_source_ready = (soc_netsoc_sdram_bankmachine3_req_wdata_ready | soc_netsoc_sdram_bankmachine3_req_rdata_valid);
assign soc_netsoc_sdram_bankmachine3_req_lock = (soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_valid | soc_netsoc_sdram_bankmachine3_cmd_buffer_source_valid);
assign soc_netsoc_sdram_bankmachine3_row_hit = (soc_netsoc_sdram_bankmachine3_row == soc_netsoc_sdram_bankmachine3_cmd_buffer_source_payload_addr[20:7]);
assign soc_netsoc_sdram_bankmachine3_cmd_payload_ba = 2'd3;
always @(*) begin
	soc_netsoc_sdram_bankmachine3_cmd_payload_a <= 14'd0;
	if (soc_netsoc_sdram_bankmachine3_row_col_n_addr_sel) begin
		soc_netsoc_sdram_bankmachine3_cmd_payload_a <= soc_netsoc_sdram_bankmachine3_cmd_buffer_source_payload_addr[20:7];
	end else begin
		soc_netsoc_sdram_bankmachine3_cmd_payload_a <= ((soc_netsoc_sdram_bankmachine3_auto_precharge <<< 4'd10) | {soc_netsoc_sdram_bankmachine3_cmd_buffer_source_payload_addr[6:0], {3{1'd0}}});
	end
end
assign soc_netsoc_sdram_bankmachine3_twtpcon_valid = ((soc_netsoc_sdram_bankmachine3_cmd_valid & soc_netsoc_sdram_bankmachine3_cmd_ready) & soc_netsoc_sdram_bankmachine3_cmd_payload_is_write);
assign soc_netsoc_sdram_bankmachine3_trccon_valid = ((soc_netsoc_sdram_bankmachine3_cmd_valid & soc_netsoc_sdram_bankmachine3_cmd_ready) & soc_netsoc_sdram_bankmachine3_row_open);
assign soc_netsoc_sdram_bankmachine3_trascon_valid = ((soc_netsoc_sdram_bankmachine3_cmd_valid & soc_netsoc_sdram_bankmachine3_cmd_ready) & soc_netsoc_sdram_bankmachine3_row_open);
always @(*) begin
	soc_netsoc_sdram_bankmachine3_auto_precharge <= 1'd0;
	if ((soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_valid & soc_netsoc_sdram_bankmachine3_cmd_buffer_source_valid)) begin
		if ((soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_payload_addr[20:7] != soc_netsoc_sdram_bankmachine3_cmd_buffer_source_payload_addr[20:7])) begin
			soc_netsoc_sdram_bankmachine3_auto_precharge <= (soc_netsoc_sdram_bankmachine3_row_close == 1'd0);
		end
	end
end
assign soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_din = {soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_in_last, soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_in_first, soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_in_payload_addr, soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_in_payload_we};
assign {soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_out_last, soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_out_first, soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_out_payload_addr, soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_out_payload_we} = soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_dout;
assign soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_sink_ready = soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_writable;
assign soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_we = soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_sink_valid;
assign soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_in_first = soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_sink_first;
assign soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_in_last = soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_sink_last;
assign soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_in_payload_we = soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_sink_payload_we;
assign soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_in_payload_addr = soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_sink_payload_addr;
assign soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_valid = soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_readable;
assign soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_first = soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_out_first;
assign soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_last = soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_out_last;
assign soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_payload_we = soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_out_payload_we;
assign soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_payload_addr = soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_fifo_out_payload_addr;
assign soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_re = soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_source_ready;
always @(*) begin
	soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_wrport_adr <= 3'd0;
	if (soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_replace) begin
		soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_wrport_adr <= (soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_produce - 1'd1);
	end else begin
		soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_wrport_adr <= soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_produce;
	end
end
assign soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_wrport_dat_w = soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_din;
assign soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_wrport_we = (soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_we & (soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_writable | soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_replace));
assign soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_do_read = (soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_readable & soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_re);
assign soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_rdport_adr = soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_consume;
assign soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_dout = soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_rdport_dat_r;
assign soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_writable = (soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_level != 4'd8);
assign soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_readable = (soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_level != 1'd0);
assign soc_netsoc_sdram_bankmachine3_cmd_buffer_pipe_ce = (soc_netsoc_sdram_bankmachine3_cmd_buffer_source_ready | (~soc_netsoc_sdram_bankmachine3_cmd_buffer_valid_n));
assign soc_netsoc_sdram_bankmachine3_cmd_buffer_sink_ready = soc_netsoc_sdram_bankmachine3_cmd_buffer_pipe_ce;
assign soc_netsoc_sdram_bankmachine3_cmd_buffer_source_valid = soc_netsoc_sdram_bankmachine3_cmd_buffer_valid_n;
assign soc_netsoc_sdram_bankmachine3_cmd_buffer_busy = (1'd0 | soc_netsoc_sdram_bankmachine3_cmd_buffer_valid_n);
assign soc_netsoc_sdram_bankmachine3_cmd_buffer_source_first = soc_netsoc_sdram_bankmachine3_cmd_buffer_first_n;
assign soc_netsoc_sdram_bankmachine3_cmd_buffer_source_last = soc_netsoc_sdram_bankmachine3_cmd_buffer_last_n;
always @(*) begin
	soc_netsoc_sdram_bankmachine3_row_open <= 1'd0;
	soc_netsoc_sdram_bankmachine3_cmd_payload_is_read <= 1'd0;
	soc_netsoc_sdram_bankmachine3_row_close <= 1'd0;
	soc_netsoc_sdram_bankmachine3_cmd_payload_is_write <= 1'd0;
	soc_netsoc_sdram_bankmachine3_req_wdata_ready <= 1'd0;
	soc_netsoc_sdram_bankmachine3_req_rdata_valid <= 1'd0;
	soc_netsoc_sdram_bankmachine3_row_col_n_addr_sel <= 1'd0;
	soc_netsoc_sdram_bankmachine3_refresh_gnt <= 1'd0;
	soc_netsoc_sdram_bankmachine3_cmd_valid <= 1'd0;
	vns_bankmachine3_next_state <= 3'd0;
	soc_netsoc_sdram_bankmachine3_cmd_payload_cas <= 1'd0;
	soc_netsoc_sdram_bankmachine3_cmd_payload_ras <= 1'd0;
	soc_netsoc_sdram_bankmachine3_cmd_payload_we <= 1'd0;
	soc_netsoc_sdram_bankmachine3_cmd_payload_is_cmd <= 1'd0;
	vns_bankmachine3_next_state <= vns_bankmachine3_state;
	case (vns_bankmachine3_state)
		1'd1: begin
			if ((soc_netsoc_sdram_bankmachine3_twtpcon_ready & soc_netsoc_sdram_bankmachine3_trascon_ready)) begin
				soc_netsoc_sdram_bankmachine3_cmd_valid <= 1'd1;
				if (soc_netsoc_sdram_bankmachine3_cmd_ready) begin
					vns_bankmachine3_next_state <= 3'd5;
				end
				soc_netsoc_sdram_bankmachine3_cmd_payload_ras <= 1'd1;
				soc_netsoc_sdram_bankmachine3_cmd_payload_we <= 1'd1;
				soc_netsoc_sdram_bankmachine3_cmd_payload_is_cmd <= 1'd1;
			end
			soc_netsoc_sdram_bankmachine3_row_close <= 1'd1;
		end
		2'd2: begin
			if ((soc_netsoc_sdram_bankmachine3_twtpcon_ready & soc_netsoc_sdram_bankmachine3_trascon_ready)) begin
				vns_bankmachine3_next_state <= 3'd5;
			end
			soc_netsoc_sdram_bankmachine3_row_close <= 1'd1;
		end
		2'd3: begin
			if (soc_netsoc_sdram_bankmachine3_trccon_ready) begin
				soc_netsoc_sdram_bankmachine3_row_col_n_addr_sel <= 1'd1;
				soc_netsoc_sdram_bankmachine3_row_open <= 1'd1;
				soc_netsoc_sdram_bankmachine3_cmd_valid <= 1'd1;
				soc_netsoc_sdram_bankmachine3_cmd_payload_is_cmd <= 1'd1;
				if (soc_netsoc_sdram_bankmachine3_cmd_ready) begin
					vns_bankmachine3_next_state <= 3'd6;
				end
				soc_netsoc_sdram_bankmachine3_cmd_payload_ras <= 1'd1;
			end
		end
		3'd4: begin
			if (soc_netsoc_sdram_bankmachine3_twtpcon_ready) begin
				soc_netsoc_sdram_bankmachine3_refresh_gnt <= 1'd1;
			end
			soc_netsoc_sdram_bankmachine3_row_close <= 1'd1;
			soc_netsoc_sdram_bankmachine3_cmd_payload_is_cmd <= 1'd1;
			if ((~soc_netsoc_sdram_bankmachine3_refresh_req)) begin
				vns_bankmachine3_next_state <= 1'd0;
			end
		end
		3'd5: begin
			vns_bankmachine3_next_state <= 2'd3;
		end
		3'd6: begin
			vns_bankmachine3_next_state <= 1'd0;
		end
		default: begin
			if (soc_netsoc_sdram_bankmachine3_refresh_req) begin
				vns_bankmachine3_next_state <= 3'd4;
			end else begin
				if (soc_netsoc_sdram_bankmachine3_cmd_buffer_source_valid) begin
					if (soc_netsoc_sdram_bankmachine3_row_opened) begin
						if (soc_netsoc_sdram_bankmachine3_row_hit) begin
							soc_netsoc_sdram_bankmachine3_cmd_valid <= 1'd1;
							if (soc_netsoc_sdram_bankmachine3_cmd_buffer_source_payload_we) begin
								soc_netsoc_sdram_bankmachine3_req_wdata_ready <= soc_netsoc_sdram_bankmachine3_cmd_ready;
								soc_netsoc_sdram_bankmachine3_cmd_payload_is_write <= 1'd1;
								soc_netsoc_sdram_bankmachine3_cmd_payload_we <= 1'd1;
							end else begin
								soc_netsoc_sdram_bankmachine3_req_rdata_valid <= soc_netsoc_sdram_bankmachine3_cmd_ready;
								soc_netsoc_sdram_bankmachine3_cmd_payload_is_read <= 1'd1;
							end
							soc_netsoc_sdram_bankmachine3_cmd_payload_cas <= 1'd1;
							if ((soc_netsoc_sdram_bankmachine3_cmd_ready & soc_netsoc_sdram_bankmachine3_auto_precharge)) begin
								vns_bankmachine3_next_state <= 2'd2;
							end
						end else begin
							vns_bankmachine3_next_state <= 1'd1;
						end
					end else begin
						vns_bankmachine3_next_state <= 2'd3;
					end
				end
			end
		end
	endcase
end
assign soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_sink_valid = soc_netsoc_sdram_bankmachine4_req_valid;
assign soc_netsoc_sdram_bankmachine4_req_ready = soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_sink_ready;
assign soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_sink_payload_we = soc_netsoc_sdram_bankmachine4_req_we;
assign soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_sink_payload_addr = soc_netsoc_sdram_bankmachine4_req_addr;
assign soc_netsoc_sdram_bankmachine4_cmd_buffer_sink_valid = soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_valid;
assign soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_ready = soc_netsoc_sdram_bankmachine4_cmd_buffer_sink_ready;
assign soc_netsoc_sdram_bankmachine4_cmd_buffer_sink_first = soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_first;
assign soc_netsoc_sdram_bankmachine4_cmd_buffer_sink_last = soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_last;
assign soc_netsoc_sdram_bankmachine4_cmd_buffer_sink_payload_we = soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_payload_we;
assign soc_netsoc_sdram_bankmachine4_cmd_buffer_sink_payload_addr = soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_payload_addr;
assign soc_netsoc_sdram_bankmachine4_cmd_buffer_source_ready = (soc_netsoc_sdram_bankmachine4_req_wdata_ready | soc_netsoc_sdram_bankmachine4_req_rdata_valid);
assign soc_netsoc_sdram_bankmachine4_req_lock = (soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_valid | soc_netsoc_sdram_bankmachine4_cmd_buffer_source_valid);
assign soc_netsoc_sdram_bankmachine4_row_hit = (soc_netsoc_sdram_bankmachine4_row == soc_netsoc_sdram_bankmachine4_cmd_buffer_source_payload_addr[20:7]);
assign soc_netsoc_sdram_bankmachine4_cmd_payload_ba = 3'd4;
always @(*) begin
	soc_netsoc_sdram_bankmachine4_cmd_payload_a <= 14'd0;
	if (soc_netsoc_sdram_bankmachine4_row_col_n_addr_sel) begin
		soc_netsoc_sdram_bankmachine4_cmd_payload_a <= soc_netsoc_sdram_bankmachine4_cmd_buffer_source_payload_addr[20:7];
	end else begin
		soc_netsoc_sdram_bankmachine4_cmd_payload_a <= ((soc_netsoc_sdram_bankmachine4_auto_precharge <<< 4'd10) | {soc_netsoc_sdram_bankmachine4_cmd_buffer_source_payload_addr[6:0], {3{1'd0}}});
	end
end
assign soc_netsoc_sdram_bankmachine4_twtpcon_valid = ((soc_netsoc_sdram_bankmachine4_cmd_valid & soc_netsoc_sdram_bankmachine4_cmd_ready) & soc_netsoc_sdram_bankmachine4_cmd_payload_is_write);
assign soc_netsoc_sdram_bankmachine4_trccon_valid = ((soc_netsoc_sdram_bankmachine4_cmd_valid & soc_netsoc_sdram_bankmachine4_cmd_ready) & soc_netsoc_sdram_bankmachine4_row_open);
assign soc_netsoc_sdram_bankmachine4_trascon_valid = ((soc_netsoc_sdram_bankmachine4_cmd_valid & soc_netsoc_sdram_bankmachine4_cmd_ready) & soc_netsoc_sdram_bankmachine4_row_open);
always @(*) begin
	soc_netsoc_sdram_bankmachine4_auto_precharge <= 1'd0;
	if ((soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_valid & soc_netsoc_sdram_bankmachine4_cmd_buffer_source_valid)) begin
		if ((soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_payload_addr[20:7] != soc_netsoc_sdram_bankmachine4_cmd_buffer_source_payload_addr[20:7])) begin
			soc_netsoc_sdram_bankmachine4_auto_precharge <= (soc_netsoc_sdram_bankmachine4_row_close == 1'd0);
		end
	end
end
assign soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_din = {soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_in_last, soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_in_first, soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_in_payload_addr, soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_in_payload_we};
assign {soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_out_last, soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_out_first, soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_out_payload_addr, soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_out_payload_we} = soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_dout;
assign soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_sink_ready = soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_writable;
assign soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_we = soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_sink_valid;
assign soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_in_first = soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_sink_first;
assign soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_in_last = soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_sink_last;
assign soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_in_payload_we = soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_sink_payload_we;
assign soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_in_payload_addr = soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_sink_payload_addr;
assign soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_valid = soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_readable;
assign soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_first = soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_out_first;
assign soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_last = soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_out_last;
assign soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_payload_we = soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_out_payload_we;
assign soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_payload_addr = soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_fifo_out_payload_addr;
assign soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_re = soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_source_ready;
always @(*) begin
	soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_wrport_adr <= 3'd0;
	if (soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_replace) begin
		soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_wrport_adr <= (soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_produce - 1'd1);
	end else begin
		soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_wrport_adr <= soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_produce;
	end
end
assign soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_wrport_dat_w = soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_din;
assign soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_wrport_we = (soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_we & (soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_writable | soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_replace));
assign soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_do_read = (soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_readable & soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_re);
assign soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_rdport_adr = soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_consume;
assign soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_dout = soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_rdport_dat_r;
assign soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_writable = (soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_level != 4'd8);
assign soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_readable = (soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_level != 1'd0);
assign soc_netsoc_sdram_bankmachine4_cmd_buffer_pipe_ce = (soc_netsoc_sdram_bankmachine4_cmd_buffer_source_ready | (~soc_netsoc_sdram_bankmachine4_cmd_buffer_valid_n));
assign soc_netsoc_sdram_bankmachine4_cmd_buffer_sink_ready = soc_netsoc_sdram_bankmachine4_cmd_buffer_pipe_ce;
assign soc_netsoc_sdram_bankmachine4_cmd_buffer_source_valid = soc_netsoc_sdram_bankmachine4_cmd_buffer_valid_n;
assign soc_netsoc_sdram_bankmachine4_cmd_buffer_busy = (1'd0 | soc_netsoc_sdram_bankmachine4_cmd_buffer_valid_n);
assign soc_netsoc_sdram_bankmachine4_cmd_buffer_source_first = soc_netsoc_sdram_bankmachine4_cmd_buffer_first_n;
assign soc_netsoc_sdram_bankmachine4_cmd_buffer_source_last = soc_netsoc_sdram_bankmachine4_cmd_buffer_last_n;
always @(*) begin
	soc_netsoc_sdram_bankmachine4_cmd_payload_cas <= 1'd0;
	soc_netsoc_sdram_bankmachine4_cmd_payload_ras <= 1'd0;
	soc_netsoc_sdram_bankmachine4_cmd_payload_we <= 1'd0;
	soc_netsoc_sdram_bankmachine4_cmd_payload_is_cmd <= 1'd0;
	vns_bankmachine4_next_state <= 3'd0;
	soc_netsoc_sdram_bankmachine4_cmd_payload_is_read <= 1'd0;
	soc_netsoc_sdram_bankmachine4_row_close <= 1'd0;
	soc_netsoc_sdram_bankmachine4_cmd_payload_is_write <= 1'd0;
	soc_netsoc_sdram_bankmachine4_row_open <= 1'd0;
	soc_netsoc_sdram_bankmachine4_req_wdata_ready <= 1'd0;
	soc_netsoc_sdram_bankmachine4_req_rdata_valid <= 1'd0;
	soc_netsoc_sdram_bankmachine4_row_col_n_addr_sel <= 1'd0;
	soc_netsoc_sdram_bankmachine4_refresh_gnt <= 1'd0;
	soc_netsoc_sdram_bankmachine4_cmd_valid <= 1'd0;
	vns_bankmachine4_next_state <= vns_bankmachine4_state;
	case (vns_bankmachine4_state)
		1'd1: begin
			if ((soc_netsoc_sdram_bankmachine4_twtpcon_ready & soc_netsoc_sdram_bankmachine4_trascon_ready)) begin
				soc_netsoc_sdram_bankmachine4_cmd_valid <= 1'd1;
				if (soc_netsoc_sdram_bankmachine4_cmd_ready) begin
					vns_bankmachine4_next_state <= 3'd5;
				end
				soc_netsoc_sdram_bankmachine4_cmd_payload_ras <= 1'd1;
				soc_netsoc_sdram_bankmachine4_cmd_payload_we <= 1'd1;
				soc_netsoc_sdram_bankmachine4_cmd_payload_is_cmd <= 1'd1;
			end
			soc_netsoc_sdram_bankmachine4_row_close <= 1'd1;
		end
		2'd2: begin
			if ((soc_netsoc_sdram_bankmachine4_twtpcon_ready & soc_netsoc_sdram_bankmachine4_trascon_ready)) begin
				vns_bankmachine4_next_state <= 3'd5;
			end
			soc_netsoc_sdram_bankmachine4_row_close <= 1'd1;
		end
		2'd3: begin
			if (soc_netsoc_sdram_bankmachine4_trccon_ready) begin
				soc_netsoc_sdram_bankmachine4_row_col_n_addr_sel <= 1'd1;
				soc_netsoc_sdram_bankmachine4_row_open <= 1'd1;
				soc_netsoc_sdram_bankmachine4_cmd_valid <= 1'd1;
				soc_netsoc_sdram_bankmachine4_cmd_payload_is_cmd <= 1'd1;
				if (soc_netsoc_sdram_bankmachine4_cmd_ready) begin
					vns_bankmachine4_next_state <= 3'd6;
				end
				soc_netsoc_sdram_bankmachine4_cmd_payload_ras <= 1'd1;
			end
		end
		3'd4: begin
			if (soc_netsoc_sdram_bankmachine4_twtpcon_ready) begin
				soc_netsoc_sdram_bankmachine4_refresh_gnt <= 1'd1;
			end
			soc_netsoc_sdram_bankmachine4_row_close <= 1'd1;
			soc_netsoc_sdram_bankmachine4_cmd_payload_is_cmd <= 1'd1;
			if ((~soc_netsoc_sdram_bankmachine4_refresh_req)) begin
				vns_bankmachine4_next_state <= 1'd0;
			end
		end
		3'd5: begin
			vns_bankmachine4_next_state <= 2'd3;
		end
		3'd6: begin
			vns_bankmachine4_next_state <= 1'd0;
		end
		default: begin
			if (soc_netsoc_sdram_bankmachine4_refresh_req) begin
				vns_bankmachine4_next_state <= 3'd4;
			end else begin
				if (soc_netsoc_sdram_bankmachine4_cmd_buffer_source_valid) begin
					if (soc_netsoc_sdram_bankmachine4_row_opened) begin
						if (soc_netsoc_sdram_bankmachine4_row_hit) begin
							soc_netsoc_sdram_bankmachine4_cmd_valid <= 1'd1;
							if (soc_netsoc_sdram_bankmachine4_cmd_buffer_source_payload_we) begin
								soc_netsoc_sdram_bankmachine4_req_wdata_ready <= soc_netsoc_sdram_bankmachine4_cmd_ready;
								soc_netsoc_sdram_bankmachine4_cmd_payload_is_write <= 1'd1;
								soc_netsoc_sdram_bankmachine4_cmd_payload_we <= 1'd1;
							end else begin
								soc_netsoc_sdram_bankmachine4_req_rdata_valid <= soc_netsoc_sdram_bankmachine4_cmd_ready;
								soc_netsoc_sdram_bankmachine4_cmd_payload_is_read <= 1'd1;
							end
							soc_netsoc_sdram_bankmachine4_cmd_payload_cas <= 1'd1;
							if ((soc_netsoc_sdram_bankmachine4_cmd_ready & soc_netsoc_sdram_bankmachine4_auto_precharge)) begin
								vns_bankmachine4_next_state <= 2'd2;
							end
						end else begin
							vns_bankmachine4_next_state <= 1'd1;
						end
					end else begin
						vns_bankmachine4_next_state <= 2'd3;
					end
				end
			end
		end
	endcase
end
assign soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_sink_valid = soc_netsoc_sdram_bankmachine5_req_valid;
assign soc_netsoc_sdram_bankmachine5_req_ready = soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_sink_ready;
assign soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_sink_payload_we = soc_netsoc_sdram_bankmachine5_req_we;
assign soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_sink_payload_addr = soc_netsoc_sdram_bankmachine5_req_addr;
assign soc_netsoc_sdram_bankmachine5_cmd_buffer_sink_valid = soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_valid;
assign soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_ready = soc_netsoc_sdram_bankmachine5_cmd_buffer_sink_ready;
assign soc_netsoc_sdram_bankmachine5_cmd_buffer_sink_first = soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_first;
assign soc_netsoc_sdram_bankmachine5_cmd_buffer_sink_last = soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_last;
assign soc_netsoc_sdram_bankmachine5_cmd_buffer_sink_payload_we = soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_payload_we;
assign soc_netsoc_sdram_bankmachine5_cmd_buffer_sink_payload_addr = soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_payload_addr;
assign soc_netsoc_sdram_bankmachine5_cmd_buffer_source_ready = (soc_netsoc_sdram_bankmachine5_req_wdata_ready | soc_netsoc_sdram_bankmachine5_req_rdata_valid);
assign soc_netsoc_sdram_bankmachine5_req_lock = (soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_valid | soc_netsoc_sdram_bankmachine5_cmd_buffer_source_valid);
assign soc_netsoc_sdram_bankmachine5_row_hit = (soc_netsoc_sdram_bankmachine5_row == soc_netsoc_sdram_bankmachine5_cmd_buffer_source_payload_addr[20:7]);
assign soc_netsoc_sdram_bankmachine5_cmd_payload_ba = 3'd5;
always @(*) begin
	soc_netsoc_sdram_bankmachine5_cmd_payload_a <= 14'd0;
	if (soc_netsoc_sdram_bankmachine5_row_col_n_addr_sel) begin
		soc_netsoc_sdram_bankmachine5_cmd_payload_a <= soc_netsoc_sdram_bankmachine5_cmd_buffer_source_payload_addr[20:7];
	end else begin
		soc_netsoc_sdram_bankmachine5_cmd_payload_a <= ((soc_netsoc_sdram_bankmachine5_auto_precharge <<< 4'd10) | {soc_netsoc_sdram_bankmachine5_cmd_buffer_source_payload_addr[6:0], {3{1'd0}}});
	end
end
assign soc_netsoc_sdram_bankmachine5_twtpcon_valid = ((soc_netsoc_sdram_bankmachine5_cmd_valid & soc_netsoc_sdram_bankmachine5_cmd_ready) & soc_netsoc_sdram_bankmachine5_cmd_payload_is_write);
assign soc_netsoc_sdram_bankmachine5_trccon_valid = ((soc_netsoc_sdram_bankmachine5_cmd_valid & soc_netsoc_sdram_bankmachine5_cmd_ready) & soc_netsoc_sdram_bankmachine5_row_open);
assign soc_netsoc_sdram_bankmachine5_trascon_valid = ((soc_netsoc_sdram_bankmachine5_cmd_valid & soc_netsoc_sdram_bankmachine5_cmd_ready) & soc_netsoc_sdram_bankmachine5_row_open);
always @(*) begin
	soc_netsoc_sdram_bankmachine5_auto_precharge <= 1'd0;
	if ((soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_valid & soc_netsoc_sdram_bankmachine5_cmd_buffer_source_valid)) begin
		if ((soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_payload_addr[20:7] != soc_netsoc_sdram_bankmachine5_cmd_buffer_source_payload_addr[20:7])) begin
			soc_netsoc_sdram_bankmachine5_auto_precharge <= (soc_netsoc_sdram_bankmachine5_row_close == 1'd0);
		end
	end
end
assign soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_din = {soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_in_last, soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_in_first, soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_in_payload_addr, soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_in_payload_we};
assign {soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_out_last, soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_out_first, soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_out_payload_addr, soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_out_payload_we} = soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_dout;
assign soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_sink_ready = soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_writable;
assign soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_we = soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_sink_valid;
assign soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_in_first = soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_sink_first;
assign soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_in_last = soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_sink_last;
assign soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_in_payload_we = soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_sink_payload_we;
assign soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_in_payload_addr = soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_sink_payload_addr;
assign soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_valid = soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_readable;
assign soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_first = soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_out_first;
assign soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_last = soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_out_last;
assign soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_payload_we = soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_out_payload_we;
assign soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_payload_addr = soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_fifo_out_payload_addr;
assign soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_re = soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_source_ready;
always @(*) begin
	soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_wrport_adr <= 3'd0;
	if (soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_replace) begin
		soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_wrport_adr <= (soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_produce - 1'd1);
	end else begin
		soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_wrport_adr <= soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_produce;
	end
end
assign soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_wrport_dat_w = soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_din;
assign soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_wrport_we = (soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_we & (soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_writable | soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_replace));
assign soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_do_read = (soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_readable & soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_re);
assign soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_rdport_adr = soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_consume;
assign soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_dout = soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_rdport_dat_r;
assign soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_writable = (soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_level != 4'd8);
assign soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_readable = (soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_level != 1'd0);
assign soc_netsoc_sdram_bankmachine5_cmd_buffer_pipe_ce = (soc_netsoc_sdram_bankmachine5_cmd_buffer_source_ready | (~soc_netsoc_sdram_bankmachine5_cmd_buffer_valid_n));
assign soc_netsoc_sdram_bankmachine5_cmd_buffer_sink_ready = soc_netsoc_sdram_bankmachine5_cmd_buffer_pipe_ce;
assign soc_netsoc_sdram_bankmachine5_cmd_buffer_source_valid = soc_netsoc_sdram_bankmachine5_cmd_buffer_valid_n;
assign soc_netsoc_sdram_bankmachine5_cmd_buffer_busy = (1'd0 | soc_netsoc_sdram_bankmachine5_cmd_buffer_valid_n);
assign soc_netsoc_sdram_bankmachine5_cmd_buffer_source_first = soc_netsoc_sdram_bankmachine5_cmd_buffer_first_n;
assign soc_netsoc_sdram_bankmachine5_cmd_buffer_source_last = soc_netsoc_sdram_bankmachine5_cmd_buffer_last_n;
always @(*) begin
	soc_netsoc_sdram_bankmachine5_row_col_n_addr_sel <= 1'd0;
	soc_netsoc_sdram_bankmachine5_refresh_gnt <= 1'd0;
	soc_netsoc_sdram_bankmachine5_cmd_valid <= 1'd0;
	vns_bankmachine5_next_state <= 3'd0;
	soc_netsoc_sdram_bankmachine5_cmd_payload_cas <= 1'd0;
	soc_netsoc_sdram_bankmachine5_cmd_payload_ras <= 1'd0;
	soc_netsoc_sdram_bankmachine5_cmd_payload_we <= 1'd0;
	soc_netsoc_sdram_bankmachine5_cmd_payload_is_cmd <= 1'd0;
	soc_netsoc_sdram_bankmachine5_row_open <= 1'd0;
	soc_netsoc_sdram_bankmachine5_cmd_payload_is_read <= 1'd0;
	soc_netsoc_sdram_bankmachine5_row_close <= 1'd0;
	soc_netsoc_sdram_bankmachine5_cmd_payload_is_write <= 1'd0;
	soc_netsoc_sdram_bankmachine5_req_wdata_ready <= 1'd0;
	soc_netsoc_sdram_bankmachine5_req_rdata_valid <= 1'd0;
	vns_bankmachine5_next_state <= vns_bankmachine5_state;
	case (vns_bankmachine5_state)
		1'd1: begin
			if ((soc_netsoc_sdram_bankmachine5_twtpcon_ready & soc_netsoc_sdram_bankmachine5_trascon_ready)) begin
				soc_netsoc_sdram_bankmachine5_cmd_valid <= 1'd1;
				if (soc_netsoc_sdram_bankmachine5_cmd_ready) begin
					vns_bankmachine5_next_state <= 3'd5;
				end
				soc_netsoc_sdram_bankmachine5_cmd_payload_ras <= 1'd1;
				soc_netsoc_sdram_bankmachine5_cmd_payload_we <= 1'd1;
				soc_netsoc_sdram_bankmachine5_cmd_payload_is_cmd <= 1'd1;
			end
			soc_netsoc_sdram_bankmachine5_row_close <= 1'd1;
		end
		2'd2: begin
			if ((soc_netsoc_sdram_bankmachine5_twtpcon_ready & soc_netsoc_sdram_bankmachine5_trascon_ready)) begin
				vns_bankmachine5_next_state <= 3'd5;
			end
			soc_netsoc_sdram_bankmachine5_row_close <= 1'd1;
		end
		2'd3: begin
			if (soc_netsoc_sdram_bankmachine5_trccon_ready) begin
				soc_netsoc_sdram_bankmachine5_row_col_n_addr_sel <= 1'd1;
				soc_netsoc_sdram_bankmachine5_row_open <= 1'd1;
				soc_netsoc_sdram_bankmachine5_cmd_valid <= 1'd1;
				soc_netsoc_sdram_bankmachine5_cmd_payload_is_cmd <= 1'd1;
				if (soc_netsoc_sdram_bankmachine5_cmd_ready) begin
					vns_bankmachine5_next_state <= 3'd6;
				end
				soc_netsoc_sdram_bankmachine5_cmd_payload_ras <= 1'd1;
			end
		end
		3'd4: begin
			if (soc_netsoc_sdram_bankmachine5_twtpcon_ready) begin
				soc_netsoc_sdram_bankmachine5_refresh_gnt <= 1'd1;
			end
			soc_netsoc_sdram_bankmachine5_row_close <= 1'd1;
			soc_netsoc_sdram_bankmachine5_cmd_payload_is_cmd <= 1'd1;
			if ((~soc_netsoc_sdram_bankmachine5_refresh_req)) begin
				vns_bankmachine5_next_state <= 1'd0;
			end
		end
		3'd5: begin
			vns_bankmachine5_next_state <= 2'd3;
		end
		3'd6: begin
			vns_bankmachine5_next_state <= 1'd0;
		end
		default: begin
			if (soc_netsoc_sdram_bankmachine5_refresh_req) begin
				vns_bankmachine5_next_state <= 3'd4;
			end else begin
				if (soc_netsoc_sdram_bankmachine5_cmd_buffer_source_valid) begin
					if (soc_netsoc_sdram_bankmachine5_row_opened) begin
						if (soc_netsoc_sdram_bankmachine5_row_hit) begin
							soc_netsoc_sdram_bankmachine5_cmd_valid <= 1'd1;
							if (soc_netsoc_sdram_bankmachine5_cmd_buffer_source_payload_we) begin
								soc_netsoc_sdram_bankmachine5_req_wdata_ready <= soc_netsoc_sdram_bankmachine5_cmd_ready;
								soc_netsoc_sdram_bankmachine5_cmd_payload_is_write <= 1'd1;
								soc_netsoc_sdram_bankmachine5_cmd_payload_we <= 1'd1;
							end else begin
								soc_netsoc_sdram_bankmachine5_req_rdata_valid <= soc_netsoc_sdram_bankmachine5_cmd_ready;
								soc_netsoc_sdram_bankmachine5_cmd_payload_is_read <= 1'd1;
							end
							soc_netsoc_sdram_bankmachine5_cmd_payload_cas <= 1'd1;
							if ((soc_netsoc_sdram_bankmachine5_cmd_ready & soc_netsoc_sdram_bankmachine5_auto_precharge)) begin
								vns_bankmachine5_next_state <= 2'd2;
							end
						end else begin
							vns_bankmachine5_next_state <= 1'd1;
						end
					end else begin
						vns_bankmachine5_next_state <= 2'd3;
					end
				end
			end
		end
	endcase
end
assign soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_sink_valid = soc_netsoc_sdram_bankmachine6_req_valid;
assign soc_netsoc_sdram_bankmachine6_req_ready = soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_sink_ready;
assign soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_sink_payload_we = soc_netsoc_sdram_bankmachine6_req_we;
assign soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_sink_payload_addr = soc_netsoc_sdram_bankmachine6_req_addr;
assign soc_netsoc_sdram_bankmachine6_cmd_buffer_sink_valid = soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_valid;
assign soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_ready = soc_netsoc_sdram_bankmachine6_cmd_buffer_sink_ready;
assign soc_netsoc_sdram_bankmachine6_cmd_buffer_sink_first = soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_first;
assign soc_netsoc_sdram_bankmachine6_cmd_buffer_sink_last = soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_last;
assign soc_netsoc_sdram_bankmachine6_cmd_buffer_sink_payload_we = soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_payload_we;
assign soc_netsoc_sdram_bankmachine6_cmd_buffer_sink_payload_addr = soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_payload_addr;
assign soc_netsoc_sdram_bankmachine6_cmd_buffer_source_ready = (soc_netsoc_sdram_bankmachine6_req_wdata_ready | soc_netsoc_sdram_bankmachine6_req_rdata_valid);
assign soc_netsoc_sdram_bankmachine6_req_lock = (soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_valid | soc_netsoc_sdram_bankmachine6_cmd_buffer_source_valid);
assign soc_netsoc_sdram_bankmachine6_row_hit = (soc_netsoc_sdram_bankmachine6_row == soc_netsoc_sdram_bankmachine6_cmd_buffer_source_payload_addr[20:7]);
assign soc_netsoc_sdram_bankmachine6_cmd_payload_ba = 3'd6;
always @(*) begin
	soc_netsoc_sdram_bankmachine6_cmd_payload_a <= 14'd0;
	if (soc_netsoc_sdram_bankmachine6_row_col_n_addr_sel) begin
		soc_netsoc_sdram_bankmachine6_cmd_payload_a <= soc_netsoc_sdram_bankmachine6_cmd_buffer_source_payload_addr[20:7];
	end else begin
		soc_netsoc_sdram_bankmachine6_cmd_payload_a <= ((soc_netsoc_sdram_bankmachine6_auto_precharge <<< 4'd10) | {soc_netsoc_sdram_bankmachine6_cmd_buffer_source_payload_addr[6:0], {3{1'd0}}});
	end
end
assign soc_netsoc_sdram_bankmachine6_twtpcon_valid = ((soc_netsoc_sdram_bankmachine6_cmd_valid & soc_netsoc_sdram_bankmachine6_cmd_ready) & soc_netsoc_sdram_bankmachine6_cmd_payload_is_write);
assign soc_netsoc_sdram_bankmachine6_trccon_valid = ((soc_netsoc_sdram_bankmachine6_cmd_valid & soc_netsoc_sdram_bankmachine6_cmd_ready) & soc_netsoc_sdram_bankmachine6_row_open);
assign soc_netsoc_sdram_bankmachine6_trascon_valid = ((soc_netsoc_sdram_bankmachine6_cmd_valid & soc_netsoc_sdram_bankmachine6_cmd_ready) & soc_netsoc_sdram_bankmachine6_row_open);
always @(*) begin
	soc_netsoc_sdram_bankmachine6_auto_precharge <= 1'd0;
	if ((soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_valid & soc_netsoc_sdram_bankmachine6_cmd_buffer_source_valid)) begin
		if ((soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_payload_addr[20:7] != soc_netsoc_sdram_bankmachine6_cmd_buffer_source_payload_addr[20:7])) begin
			soc_netsoc_sdram_bankmachine6_auto_precharge <= (soc_netsoc_sdram_bankmachine6_row_close == 1'd0);
		end
	end
end
assign soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_din = {soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_in_last, soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_in_first, soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_in_payload_addr, soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_in_payload_we};
assign {soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_out_last, soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_out_first, soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_out_payload_addr, soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_out_payload_we} = soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_dout;
assign soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_sink_ready = soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_writable;
assign soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_we = soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_sink_valid;
assign soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_in_first = soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_sink_first;
assign soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_in_last = soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_sink_last;
assign soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_in_payload_we = soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_sink_payload_we;
assign soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_in_payload_addr = soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_sink_payload_addr;
assign soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_valid = soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_readable;
assign soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_first = soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_out_first;
assign soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_last = soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_out_last;
assign soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_payload_we = soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_out_payload_we;
assign soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_payload_addr = soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_fifo_out_payload_addr;
assign soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_re = soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_source_ready;
always @(*) begin
	soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_wrport_adr <= 3'd0;
	if (soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_replace) begin
		soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_wrport_adr <= (soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_produce - 1'd1);
	end else begin
		soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_wrport_adr <= soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_produce;
	end
end
assign soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_wrport_dat_w = soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_din;
assign soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_wrport_we = (soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_we & (soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_writable | soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_replace));
assign soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_do_read = (soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_readable & soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_re);
assign soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_rdport_adr = soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_consume;
assign soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_dout = soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_rdport_dat_r;
assign soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_writable = (soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_level != 4'd8);
assign soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_readable = (soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_level != 1'd0);
assign soc_netsoc_sdram_bankmachine6_cmd_buffer_pipe_ce = (soc_netsoc_sdram_bankmachine6_cmd_buffer_source_ready | (~soc_netsoc_sdram_bankmachine6_cmd_buffer_valid_n));
assign soc_netsoc_sdram_bankmachine6_cmd_buffer_sink_ready = soc_netsoc_sdram_bankmachine6_cmd_buffer_pipe_ce;
assign soc_netsoc_sdram_bankmachine6_cmd_buffer_source_valid = soc_netsoc_sdram_bankmachine6_cmd_buffer_valid_n;
assign soc_netsoc_sdram_bankmachine6_cmd_buffer_busy = (1'd0 | soc_netsoc_sdram_bankmachine6_cmd_buffer_valid_n);
assign soc_netsoc_sdram_bankmachine6_cmd_buffer_source_first = soc_netsoc_sdram_bankmachine6_cmd_buffer_first_n;
assign soc_netsoc_sdram_bankmachine6_cmd_buffer_source_last = soc_netsoc_sdram_bankmachine6_cmd_buffer_last_n;
always @(*) begin
	soc_netsoc_sdram_bankmachine6_cmd_payload_we <= 1'd0;
	soc_netsoc_sdram_bankmachine6_cmd_payload_is_cmd <= 1'd0;
	vns_bankmachine6_next_state <= 3'd0;
	soc_netsoc_sdram_bankmachine6_cmd_payload_is_read <= 1'd0;
	soc_netsoc_sdram_bankmachine6_row_close <= 1'd0;
	soc_netsoc_sdram_bankmachine6_cmd_payload_is_write <= 1'd0;
	soc_netsoc_sdram_bankmachine6_row_open <= 1'd0;
	soc_netsoc_sdram_bankmachine6_req_wdata_ready <= 1'd0;
	soc_netsoc_sdram_bankmachine6_req_rdata_valid <= 1'd0;
	soc_netsoc_sdram_bankmachine6_row_col_n_addr_sel <= 1'd0;
	soc_netsoc_sdram_bankmachine6_refresh_gnt <= 1'd0;
	soc_netsoc_sdram_bankmachine6_cmd_valid <= 1'd0;
	soc_netsoc_sdram_bankmachine6_cmd_payload_cas <= 1'd0;
	soc_netsoc_sdram_bankmachine6_cmd_payload_ras <= 1'd0;
	vns_bankmachine6_next_state <= vns_bankmachine6_state;
	case (vns_bankmachine6_state)
		1'd1: begin
			if ((soc_netsoc_sdram_bankmachine6_twtpcon_ready & soc_netsoc_sdram_bankmachine6_trascon_ready)) begin
				soc_netsoc_sdram_bankmachine6_cmd_valid <= 1'd1;
				if (soc_netsoc_sdram_bankmachine6_cmd_ready) begin
					vns_bankmachine6_next_state <= 3'd5;
				end
				soc_netsoc_sdram_bankmachine6_cmd_payload_ras <= 1'd1;
				soc_netsoc_sdram_bankmachine6_cmd_payload_we <= 1'd1;
				soc_netsoc_sdram_bankmachine6_cmd_payload_is_cmd <= 1'd1;
			end
			soc_netsoc_sdram_bankmachine6_row_close <= 1'd1;
		end
		2'd2: begin
			if ((soc_netsoc_sdram_bankmachine6_twtpcon_ready & soc_netsoc_sdram_bankmachine6_trascon_ready)) begin
				vns_bankmachine6_next_state <= 3'd5;
			end
			soc_netsoc_sdram_bankmachine6_row_close <= 1'd1;
		end
		2'd3: begin
			if (soc_netsoc_sdram_bankmachine6_trccon_ready) begin
				soc_netsoc_sdram_bankmachine6_row_col_n_addr_sel <= 1'd1;
				soc_netsoc_sdram_bankmachine6_row_open <= 1'd1;
				soc_netsoc_sdram_bankmachine6_cmd_valid <= 1'd1;
				soc_netsoc_sdram_bankmachine6_cmd_payload_is_cmd <= 1'd1;
				if (soc_netsoc_sdram_bankmachine6_cmd_ready) begin
					vns_bankmachine6_next_state <= 3'd6;
				end
				soc_netsoc_sdram_bankmachine6_cmd_payload_ras <= 1'd1;
			end
		end
		3'd4: begin
			if (soc_netsoc_sdram_bankmachine6_twtpcon_ready) begin
				soc_netsoc_sdram_bankmachine6_refresh_gnt <= 1'd1;
			end
			soc_netsoc_sdram_bankmachine6_row_close <= 1'd1;
			soc_netsoc_sdram_bankmachine6_cmd_payload_is_cmd <= 1'd1;
			if ((~soc_netsoc_sdram_bankmachine6_refresh_req)) begin
				vns_bankmachine6_next_state <= 1'd0;
			end
		end
		3'd5: begin
			vns_bankmachine6_next_state <= 2'd3;
		end
		3'd6: begin
			vns_bankmachine6_next_state <= 1'd0;
		end
		default: begin
			if (soc_netsoc_sdram_bankmachine6_refresh_req) begin
				vns_bankmachine6_next_state <= 3'd4;
			end else begin
				if (soc_netsoc_sdram_bankmachine6_cmd_buffer_source_valid) begin
					if (soc_netsoc_sdram_bankmachine6_row_opened) begin
						if (soc_netsoc_sdram_bankmachine6_row_hit) begin
							soc_netsoc_sdram_bankmachine6_cmd_valid <= 1'd1;
							if (soc_netsoc_sdram_bankmachine6_cmd_buffer_source_payload_we) begin
								soc_netsoc_sdram_bankmachine6_req_wdata_ready <= soc_netsoc_sdram_bankmachine6_cmd_ready;
								soc_netsoc_sdram_bankmachine6_cmd_payload_is_write <= 1'd1;
								soc_netsoc_sdram_bankmachine6_cmd_payload_we <= 1'd1;
							end else begin
								soc_netsoc_sdram_bankmachine6_req_rdata_valid <= soc_netsoc_sdram_bankmachine6_cmd_ready;
								soc_netsoc_sdram_bankmachine6_cmd_payload_is_read <= 1'd1;
							end
							soc_netsoc_sdram_bankmachine6_cmd_payload_cas <= 1'd1;
							if ((soc_netsoc_sdram_bankmachine6_cmd_ready & soc_netsoc_sdram_bankmachine6_auto_precharge)) begin
								vns_bankmachine6_next_state <= 2'd2;
							end
						end else begin
							vns_bankmachine6_next_state <= 1'd1;
						end
					end else begin
						vns_bankmachine6_next_state <= 2'd3;
					end
				end
			end
		end
	endcase
end
assign soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_sink_valid = soc_netsoc_sdram_bankmachine7_req_valid;
assign soc_netsoc_sdram_bankmachine7_req_ready = soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_sink_ready;
assign soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_sink_payload_we = soc_netsoc_sdram_bankmachine7_req_we;
assign soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_sink_payload_addr = soc_netsoc_sdram_bankmachine7_req_addr;
assign soc_netsoc_sdram_bankmachine7_cmd_buffer_sink_valid = soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_valid;
assign soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_ready = soc_netsoc_sdram_bankmachine7_cmd_buffer_sink_ready;
assign soc_netsoc_sdram_bankmachine7_cmd_buffer_sink_first = soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_first;
assign soc_netsoc_sdram_bankmachine7_cmd_buffer_sink_last = soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_last;
assign soc_netsoc_sdram_bankmachine7_cmd_buffer_sink_payload_we = soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_payload_we;
assign soc_netsoc_sdram_bankmachine7_cmd_buffer_sink_payload_addr = soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_payload_addr;
assign soc_netsoc_sdram_bankmachine7_cmd_buffer_source_ready = (soc_netsoc_sdram_bankmachine7_req_wdata_ready | soc_netsoc_sdram_bankmachine7_req_rdata_valid);
assign soc_netsoc_sdram_bankmachine7_req_lock = (soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_valid | soc_netsoc_sdram_bankmachine7_cmd_buffer_source_valid);
assign soc_netsoc_sdram_bankmachine7_row_hit = (soc_netsoc_sdram_bankmachine7_row == soc_netsoc_sdram_bankmachine7_cmd_buffer_source_payload_addr[20:7]);
assign soc_netsoc_sdram_bankmachine7_cmd_payload_ba = 3'd7;
always @(*) begin
	soc_netsoc_sdram_bankmachine7_cmd_payload_a <= 14'd0;
	if (soc_netsoc_sdram_bankmachine7_row_col_n_addr_sel) begin
		soc_netsoc_sdram_bankmachine7_cmd_payload_a <= soc_netsoc_sdram_bankmachine7_cmd_buffer_source_payload_addr[20:7];
	end else begin
		soc_netsoc_sdram_bankmachine7_cmd_payload_a <= ((soc_netsoc_sdram_bankmachine7_auto_precharge <<< 4'd10) | {soc_netsoc_sdram_bankmachine7_cmd_buffer_source_payload_addr[6:0], {3{1'd0}}});
	end
end
assign soc_netsoc_sdram_bankmachine7_twtpcon_valid = ((soc_netsoc_sdram_bankmachine7_cmd_valid & soc_netsoc_sdram_bankmachine7_cmd_ready) & soc_netsoc_sdram_bankmachine7_cmd_payload_is_write);
assign soc_netsoc_sdram_bankmachine7_trccon_valid = ((soc_netsoc_sdram_bankmachine7_cmd_valid & soc_netsoc_sdram_bankmachine7_cmd_ready) & soc_netsoc_sdram_bankmachine7_row_open);
assign soc_netsoc_sdram_bankmachine7_trascon_valid = ((soc_netsoc_sdram_bankmachine7_cmd_valid & soc_netsoc_sdram_bankmachine7_cmd_ready) & soc_netsoc_sdram_bankmachine7_row_open);
always @(*) begin
	soc_netsoc_sdram_bankmachine7_auto_precharge <= 1'd0;
	if ((soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_valid & soc_netsoc_sdram_bankmachine7_cmd_buffer_source_valid)) begin
		if ((soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_payload_addr[20:7] != soc_netsoc_sdram_bankmachine7_cmd_buffer_source_payload_addr[20:7])) begin
			soc_netsoc_sdram_bankmachine7_auto_precharge <= (soc_netsoc_sdram_bankmachine7_row_close == 1'd0);
		end
	end
end
assign soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_din = {soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_in_last, soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_in_first, soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_in_payload_addr, soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_in_payload_we};
assign {soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_out_last, soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_out_first, soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_out_payload_addr, soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_out_payload_we} = soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_dout;
assign soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_sink_ready = soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_writable;
assign soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_we = soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_sink_valid;
assign soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_in_first = soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_sink_first;
assign soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_in_last = soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_sink_last;
assign soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_in_payload_we = soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_sink_payload_we;
assign soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_in_payload_addr = soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_sink_payload_addr;
assign soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_valid = soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_readable;
assign soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_first = soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_out_first;
assign soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_last = soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_out_last;
assign soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_payload_we = soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_out_payload_we;
assign soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_payload_addr = soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_fifo_out_payload_addr;
assign soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_re = soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_source_ready;
always @(*) begin
	soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_wrport_adr <= 3'd0;
	if (soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_replace) begin
		soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_wrport_adr <= (soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_produce - 1'd1);
	end else begin
		soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_wrport_adr <= soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_produce;
	end
end
assign soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_wrport_dat_w = soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_din;
assign soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_wrport_we = (soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_we & (soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_writable | soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_replace));
assign soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_do_read = (soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_readable & soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_re);
assign soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_rdport_adr = soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_consume;
assign soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_dout = soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_rdport_dat_r;
assign soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_writable = (soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_level != 4'd8);
assign soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_readable = (soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_level != 1'd0);
assign soc_netsoc_sdram_bankmachine7_cmd_buffer_pipe_ce = (soc_netsoc_sdram_bankmachine7_cmd_buffer_source_ready | (~soc_netsoc_sdram_bankmachine7_cmd_buffer_valid_n));
assign soc_netsoc_sdram_bankmachine7_cmd_buffer_sink_ready = soc_netsoc_sdram_bankmachine7_cmd_buffer_pipe_ce;
assign soc_netsoc_sdram_bankmachine7_cmd_buffer_source_valid = soc_netsoc_sdram_bankmachine7_cmd_buffer_valid_n;
assign soc_netsoc_sdram_bankmachine7_cmd_buffer_busy = (1'd0 | soc_netsoc_sdram_bankmachine7_cmd_buffer_valid_n);
assign soc_netsoc_sdram_bankmachine7_cmd_buffer_source_first = soc_netsoc_sdram_bankmachine7_cmd_buffer_first_n;
assign soc_netsoc_sdram_bankmachine7_cmd_buffer_source_last = soc_netsoc_sdram_bankmachine7_cmd_buffer_last_n;
always @(*) begin
	vns_bankmachine7_next_state <= 3'd0;
	soc_netsoc_sdram_bankmachine7_cmd_payload_cas <= 1'd0;
	soc_netsoc_sdram_bankmachine7_cmd_payload_ras <= 1'd0;
	soc_netsoc_sdram_bankmachine7_cmd_payload_we <= 1'd0;
	soc_netsoc_sdram_bankmachine7_cmd_payload_is_cmd <= 1'd0;
	soc_netsoc_sdram_bankmachine7_row_open <= 1'd0;
	soc_netsoc_sdram_bankmachine7_cmd_payload_is_read <= 1'd0;
	soc_netsoc_sdram_bankmachine7_row_close <= 1'd0;
	soc_netsoc_sdram_bankmachine7_cmd_payload_is_write <= 1'd0;
	soc_netsoc_sdram_bankmachine7_req_wdata_ready <= 1'd0;
	soc_netsoc_sdram_bankmachine7_req_rdata_valid <= 1'd0;
	soc_netsoc_sdram_bankmachine7_row_col_n_addr_sel <= 1'd0;
	soc_netsoc_sdram_bankmachine7_refresh_gnt <= 1'd0;
	soc_netsoc_sdram_bankmachine7_cmd_valid <= 1'd0;
	vns_bankmachine7_next_state <= vns_bankmachine7_state;
	case (vns_bankmachine7_state)
		1'd1: begin
			if ((soc_netsoc_sdram_bankmachine7_twtpcon_ready & soc_netsoc_sdram_bankmachine7_trascon_ready)) begin
				soc_netsoc_sdram_bankmachine7_cmd_valid <= 1'd1;
				if (soc_netsoc_sdram_bankmachine7_cmd_ready) begin
					vns_bankmachine7_next_state <= 3'd5;
				end
				soc_netsoc_sdram_bankmachine7_cmd_payload_ras <= 1'd1;
				soc_netsoc_sdram_bankmachine7_cmd_payload_we <= 1'd1;
				soc_netsoc_sdram_bankmachine7_cmd_payload_is_cmd <= 1'd1;
			end
			soc_netsoc_sdram_bankmachine7_row_close <= 1'd1;
		end
		2'd2: begin
			if ((soc_netsoc_sdram_bankmachine7_twtpcon_ready & soc_netsoc_sdram_bankmachine7_trascon_ready)) begin
				vns_bankmachine7_next_state <= 3'd5;
			end
			soc_netsoc_sdram_bankmachine7_row_close <= 1'd1;
		end
		2'd3: begin
			if (soc_netsoc_sdram_bankmachine7_trccon_ready) begin
				soc_netsoc_sdram_bankmachine7_row_col_n_addr_sel <= 1'd1;
				soc_netsoc_sdram_bankmachine7_row_open <= 1'd1;
				soc_netsoc_sdram_bankmachine7_cmd_valid <= 1'd1;
				soc_netsoc_sdram_bankmachine7_cmd_payload_is_cmd <= 1'd1;
				if (soc_netsoc_sdram_bankmachine7_cmd_ready) begin
					vns_bankmachine7_next_state <= 3'd6;
				end
				soc_netsoc_sdram_bankmachine7_cmd_payload_ras <= 1'd1;
			end
		end
		3'd4: begin
			if (soc_netsoc_sdram_bankmachine7_twtpcon_ready) begin
				soc_netsoc_sdram_bankmachine7_refresh_gnt <= 1'd1;
			end
			soc_netsoc_sdram_bankmachine7_row_close <= 1'd1;
			soc_netsoc_sdram_bankmachine7_cmd_payload_is_cmd <= 1'd1;
			if ((~soc_netsoc_sdram_bankmachine7_refresh_req)) begin
				vns_bankmachine7_next_state <= 1'd0;
			end
		end
		3'd5: begin
			vns_bankmachine7_next_state <= 2'd3;
		end
		3'd6: begin
			vns_bankmachine7_next_state <= 1'd0;
		end
		default: begin
			if (soc_netsoc_sdram_bankmachine7_refresh_req) begin
				vns_bankmachine7_next_state <= 3'd4;
			end else begin
				if (soc_netsoc_sdram_bankmachine7_cmd_buffer_source_valid) begin
					if (soc_netsoc_sdram_bankmachine7_row_opened) begin
						if (soc_netsoc_sdram_bankmachine7_row_hit) begin
							soc_netsoc_sdram_bankmachine7_cmd_valid <= 1'd1;
							if (soc_netsoc_sdram_bankmachine7_cmd_buffer_source_payload_we) begin
								soc_netsoc_sdram_bankmachine7_req_wdata_ready <= soc_netsoc_sdram_bankmachine7_cmd_ready;
								soc_netsoc_sdram_bankmachine7_cmd_payload_is_write <= 1'd1;
								soc_netsoc_sdram_bankmachine7_cmd_payload_we <= 1'd1;
							end else begin
								soc_netsoc_sdram_bankmachine7_req_rdata_valid <= soc_netsoc_sdram_bankmachine7_cmd_ready;
								soc_netsoc_sdram_bankmachine7_cmd_payload_is_read <= 1'd1;
							end
							soc_netsoc_sdram_bankmachine7_cmd_payload_cas <= 1'd1;
							if ((soc_netsoc_sdram_bankmachine7_cmd_ready & soc_netsoc_sdram_bankmachine7_auto_precharge)) begin
								vns_bankmachine7_next_state <= 2'd2;
							end
						end else begin
							vns_bankmachine7_next_state <= 1'd1;
						end
					end else begin
						vns_bankmachine7_next_state <= 2'd3;
					end
				end
			end
		end
	endcase
end
assign soc_netsoc_sdram_trrdcon_valid = ((soc_netsoc_sdram_choose_cmd_cmd_valid & soc_netsoc_sdram_choose_cmd_cmd_ready) & ((soc_netsoc_sdram_choose_cmd_cmd_payload_ras & (~soc_netsoc_sdram_choose_cmd_cmd_payload_cas)) & (~soc_netsoc_sdram_choose_cmd_cmd_payload_we)));
assign soc_netsoc_sdram_tfawcon_valid = ((soc_netsoc_sdram_choose_cmd_cmd_valid & soc_netsoc_sdram_choose_cmd_cmd_ready) & ((soc_netsoc_sdram_choose_cmd_cmd_payload_ras & (~soc_netsoc_sdram_choose_cmd_cmd_payload_cas)) & (~soc_netsoc_sdram_choose_cmd_cmd_payload_we)));
assign soc_netsoc_sdram_ras_allowed = (soc_netsoc_sdram_trrdcon_ready & soc_netsoc_sdram_tfawcon_ready);
assign soc_netsoc_sdram_tccdcon_valid = ((soc_netsoc_sdram_choose_req_cmd_valid & soc_netsoc_sdram_choose_req_cmd_ready) & (soc_netsoc_sdram_choose_req_cmd_payload_is_write | soc_netsoc_sdram_choose_req_cmd_payload_is_read));
assign soc_netsoc_sdram_cas_allowed = soc_netsoc_sdram_tccdcon_ready;
assign soc_netsoc_sdram_twtrcon_valid = ((soc_netsoc_sdram_choose_req_cmd_valid & soc_netsoc_sdram_choose_req_cmd_ready) & soc_netsoc_sdram_choose_req_cmd_payload_is_write);
assign soc_netsoc_sdram_read_available = ((((((((soc_netsoc_sdram_bankmachine0_cmd_valid & soc_netsoc_sdram_bankmachine0_cmd_payload_is_read) | (soc_netsoc_sdram_bankmachine1_cmd_valid & soc_netsoc_sdram_bankmachine1_cmd_payload_is_read)) | (soc_netsoc_sdram_bankmachine2_cmd_valid & soc_netsoc_sdram_bankmachine2_cmd_payload_is_read)) | (soc_netsoc_sdram_bankmachine3_cmd_valid & soc_netsoc_sdram_bankmachine3_cmd_payload_is_read)) | (soc_netsoc_sdram_bankmachine4_cmd_valid & soc_netsoc_sdram_bankmachine4_cmd_payload_is_read)) | (soc_netsoc_sdram_bankmachine5_cmd_valid & soc_netsoc_sdram_bankmachine5_cmd_payload_is_read)) | (soc_netsoc_sdram_bankmachine6_cmd_valid & soc_netsoc_sdram_bankmachine6_cmd_payload_is_read)) | (soc_netsoc_sdram_bankmachine7_cmd_valid & soc_netsoc_sdram_bankmachine7_cmd_payload_is_read));
assign soc_netsoc_sdram_write_available = ((((((((soc_netsoc_sdram_bankmachine0_cmd_valid & soc_netsoc_sdram_bankmachine0_cmd_payload_is_write) | (soc_netsoc_sdram_bankmachine1_cmd_valid & soc_netsoc_sdram_bankmachine1_cmd_payload_is_write)) | (soc_netsoc_sdram_bankmachine2_cmd_valid & soc_netsoc_sdram_bankmachine2_cmd_payload_is_write)) | (soc_netsoc_sdram_bankmachine3_cmd_valid & soc_netsoc_sdram_bankmachine3_cmd_payload_is_write)) | (soc_netsoc_sdram_bankmachine4_cmd_valid & soc_netsoc_sdram_bankmachine4_cmd_payload_is_write)) | (soc_netsoc_sdram_bankmachine5_cmd_valid & soc_netsoc_sdram_bankmachine5_cmd_payload_is_write)) | (soc_netsoc_sdram_bankmachine6_cmd_valid & soc_netsoc_sdram_bankmachine6_cmd_payload_is_write)) | (soc_netsoc_sdram_bankmachine7_cmd_valid & soc_netsoc_sdram_bankmachine7_cmd_payload_is_write));
assign soc_netsoc_sdram_max_time0 = (soc_netsoc_sdram_time0 == 1'd0);
assign soc_netsoc_sdram_max_time1 = (soc_netsoc_sdram_time1 == 1'd0);
assign soc_netsoc_sdram_bankmachine0_refresh_req = soc_netsoc_sdram_cmd_valid;
assign soc_netsoc_sdram_bankmachine1_refresh_req = soc_netsoc_sdram_cmd_valid;
assign soc_netsoc_sdram_bankmachine2_refresh_req = soc_netsoc_sdram_cmd_valid;
assign soc_netsoc_sdram_bankmachine3_refresh_req = soc_netsoc_sdram_cmd_valid;
assign soc_netsoc_sdram_bankmachine4_refresh_req = soc_netsoc_sdram_cmd_valid;
assign soc_netsoc_sdram_bankmachine5_refresh_req = soc_netsoc_sdram_cmd_valid;
assign soc_netsoc_sdram_bankmachine6_refresh_req = soc_netsoc_sdram_cmd_valid;
assign soc_netsoc_sdram_bankmachine7_refresh_req = soc_netsoc_sdram_cmd_valid;
assign soc_netsoc_sdram_go_to_refresh = (((((((soc_netsoc_sdram_bankmachine0_refresh_gnt & soc_netsoc_sdram_bankmachine1_refresh_gnt) & soc_netsoc_sdram_bankmachine2_refresh_gnt) & soc_netsoc_sdram_bankmachine3_refresh_gnt) & soc_netsoc_sdram_bankmachine4_refresh_gnt) & soc_netsoc_sdram_bankmachine5_refresh_gnt) & soc_netsoc_sdram_bankmachine6_refresh_gnt) & soc_netsoc_sdram_bankmachine7_refresh_gnt);
assign soc_netsoc_sdram_interface_rdata = {soc_netsoc_sdram_dfi_p3_rddata, soc_netsoc_sdram_dfi_p2_rddata, soc_netsoc_sdram_dfi_p1_rddata, soc_netsoc_sdram_dfi_p0_rddata};
assign {soc_netsoc_sdram_dfi_p3_wrdata, soc_netsoc_sdram_dfi_p2_wrdata, soc_netsoc_sdram_dfi_p1_wrdata, soc_netsoc_sdram_dfi_p0_wrdata} = soc_netsoc_sdram_interface_wdata;
assign {soc_netsoc_sdram_dfi_p3_wrdata_mask, soc_netsoc_sdram_dfi_p2_wrdata_mask, soc_netsoc_sdram_dfi_p1_wrdata_mask, soc_netsoc_sdram_dfi_p0_wrdata_mask} = (~soc_netsoc_sdram_interface_wdata_we);
always @(*) begin
	soc_netsoc_sdram_choose_cmd_valids <= 8'd0;
	soc_netsoc_sdram_choose_cmd_valids[0] <= (soc_netsoc_sdram_bankmachine0_cmd_valid & (((soc_netsoc_sdram_bankmachine0_cmd_payload_is_cmd & soc_netsoc_sdram_choose_cmd_want_cmds) & ((~((soc_netsoc_sdram_bankmachine0_cmd_payload_ras & (~soc_netsoc_sdram_bankmachine0_cmd_payload_cas)) & (~soc_netsoc_sdram_bankmachine0_cmd_payload_we))) | soc_netsoc_sdram_choose_cmd_want_activates)) | ((soc_netsoc_sdram_bankmachine0_cmd_payload_is_read == soc_netsoc_sdram_choose_cmd_want_reads) & (soc_netsoc_sdram_bankmachine0_cmd_payload_is_write == soc_netsoc_sdram_choose_cmd_want_writes))));
	soc_netsoc_sdram_choose_cmd_valids[1] <= (soc_netsoc_sdram_bankmachine1_cmd_valid & (((soc_netsoc_sdram_bankmachine1_cmd_payload_is_cmd & soc_netsoc_sdram_choose_cmd_want_cmds) & ((~((soc_netsoc_sdram_bankmachine1_cmd_payload_ras & (~soc_netsoc_sdram_bankmachine1_cmd_payload_cas)) & (~soc_netsoc_sdram_bankmachine1_cmd_payload_we))) | soc_netsoc_sdram_choose_cmd_want_activates)) | ((soc_netsoc_sdram_bankmachine1_cmd_payload_is_read == soc_netsoc_sdram_choose_cmd_want_reads) & (soc_netsoc_sdram_bankmachine1_cmd_payload_is_write == soc_netsoc_sdram_choose_cmd_want_writes))));
	soc_netsoc_sdram_choose_cmd_valids[2] <= (soc_netsoc_sdram_bankmachine2_cmd_valid & (((soc_netsoc_sdram_bankmachine2_cmd_payload_is_cmd & soc_netsoc_sdram_choose_cmd_want_cmds) & ((~((soc_netsoc_sdram_bankmachine2_cmd_payload_ras & (~soc_netsoc_sdram_bankmachine2_cmd_payload_cas)) & (~soc_netsoc_sdram_bankmachine2_cmd_payload_we))) | soc_netsoc_sdram_choose_cmd_want_activates)) | ((soc_netsoc_sdram_bankmachine2_cmd_payload_is_read == soc_netsoc_sdram_choose_cmd_want_reads) & (soc_netsoc_sdram_bankmachine2_cmd_payload_is_write == soc_netsoc_sdram_choose_cmd_want_writes))));
	soc_netsoc_sdram_choose_cmd_valids[3] <= (soc_netsoc_sdram_bankmachine3_cmd_valid & (((soc_netsoc_sdram_bankmachine3_cmd_payload_is_cmd & soc_netsoc_sdram_choose_cmd_want_cmds) & ((~((soc_netsoc_sdram_bankmachine3_cmd_payload_ras & (~soc_netsoc_sdram_bankmachine3_cmd_payload_cas)) & (~soc_netsoc_sdram_bankmachine3_cmd_payload_we))) | soc_netsoc_sdram_choose_cmd_want_activates)) | ((soc_netsoc_sdram_bankmachine3_cmd_payload_is_read == soc_netsoc_sdram_choose_cmd_want_reads) & (soc_netsoc_sdram_bankmachine3_cmd_payload_is_write == soc_netsoc_sdram_choose_cmd_want_writes))));
	soc_netsoc_sdram_choose_cmd_valids[4] <= (soc_netsoc_sdram_bankmachine4_cmd_valid & (((soc_netsoc_sdram_bankmachine4_cmd_payload_is_cmd & soc_netsoc_sdram_choose_cmd_want_cmds) & ((~((soc_netsoc_sdram_bankmachine4_cmd_payload_ras & (~soc_netsoc_sdram_bankmachine4_cmd_payload_cas)) & (~soc_netsoc_sdram_bankmachine4_cmd_payload_we))) | soc_netsoc_sdram_choose_cmd_want_activates)) | ((soc_netsoc_sdram_bankmachine4_cmd_payload_is_read == soc_netsoc_sdram_choose_cmd_want_reads) & (soc_netsoc_sdram_bankmachine4_cmd_payload_is_write == soc_netsoc_sdram_choose_cmd_want_writes))));
	soc_netsoc_sdram_choose_cmd_valids[5] <= (soc_netsoc_sdram_bankmachine5_cmd_valid & (((soc_netsoc_sdram_bankmachine5_cmd_payload_is_cmd & soc_netsoc_sdram_choose_cmd_want_cmds) & ((~((soc_netsoc_sdram_bankmachine5_cmd_payload_ras & (~soc_netsoc_sdram_bankmachine5_cmd_payload_cas)) & (~soc_netsoc_sdram_bankmachine5_cmd_payload_we))) | soc_netsoc_sdram_choose_cmd_want_activates)) | ((soc_netsoc_sdram_bankmachine5_cmd_payload_is_read == soc_netsoc_sdram_choose_cmd_want_reads) & (soc_netsoc_sdram_bankmachine5_cmd_payload_is_write == soc_netsoc_sdram_choose_cmd_want_writes))));
	soc_netsoc_sdram_choose_cmd_valids[6] <= (soc_netsoc_sdram_bankmachine6_cmd_valid & (((soc_netsoc_sdram_bankmachine6_cmd_payload_is_cmd & soc_netsoc_sdram_choose_cmd_want_cmds) & ((~((soc_netsoc_sdram_bankmachine6_cmd_payload_ras & (~soc_netsoc_sdram_bankmachine6_cmd_payload_cas)) & (~soc_netsoc_sdram_bankmachine6_cmd_payload_we))) | soc_netsoc_sdram_choose_cmd_want_activates)) | ((soc_netsoc_sdram_bankmachine6_cmd_payload_is_read == soc_netsoc_sdram_choose_cmd_want_reads) & (soc_netsoc_sdram_bankmachine6_cmd_payload_is_write == soc_netsoc_sdram_choose_cmd_want_writes))));
	soc_netsoc_sdram_choose_cmd_valids[7] <= (soc_netsoc_sdram_bankmachine7_cmd_valid & (((soc_netsoc_sdram_bankmachine7_cmd_payload_is_cmd & soc_netsoc_sdram_choose_cmd_want_cmds) & ((~((soc_netsoc_sdram_bankmachine7_cmd_payload_ras & (~soc_netsoc_sdram_bankmachine7_cmd_payload_cas)) & (~soc_netsoc_sdram_bankmachine7_cmd_payload_we))) | soc_netsoc_sdram_choose_cmd_want_activates)) | ((soc_netsoc_sdram_bankmachine7_cmd_payload_is_read == soc_netsoc_sdram_choose_cmd_want_reads) & (soc_netsoc_sdram_bankmachine7_cmd_payload_is_write == soc_netsoc_sdram_choose_cmd_want_writes))));
end
assign soc_netsoc_sdram_choose_cmd_request = soc_netsoc_sdram_choose_cmd_valids;
assign soc_netsoc_sdram_choose_cmd_cmd_valid = vns_rhs_array_muxed0;
assign soc_netsoc_sdram_choose_cmd_cmd_payload_a = vns_rhs_array_muxed1;
assign soc_netsoc_sdram_choose_cmd_cmd_payload_ba = vns_rhs_array_muxed2;
assign soc_netsoc_sdram_choose_cmd_cmd_payload_is_read = vns_rhs_array_muxed3;
assign soc_netsoc_sdram_choose_cmd_cmd_payload_is_write = vns_rhs_array_muxed4;
assign soc_netsoc_sdram_choose_cmd_cmd_payload_is_cmd = vns_rhs_array_muxed5;
always @(*) begin
	soc_netsoc_sdram_choose_cmd_cmd_payload_cas <= 1'd0;
	if (soc_netsoc_sdram_choose_cmd_cmd_valid) begin
		soc_netsoc_sdram_choose_cmd_cmd_payload_cas <= vns_t_array_muxed0;
	end
end
always @(*) begin
	soc_netsoc_sdram_choose_cmd_cmd_payload_ras <= 1'd0;
	if (soc_netsoc_sdram_choose_cmd_cmd_valid) begin
		soc_netsoc_sdram_choose_cmd_cmd_payload_ras <= vns_t_array_muxed1;
	end
end
always @(*) begin
	soc_netsoc_sdram_choose_cmd_cmd_payload_we <= 1'd0;
	if (soc_netsoc_sdram_choose_cmd_cmd_valid) begin
		soc_netsoc_sdram_choose_cmd_cmd_payload_we <= vns_t_array_muxed2;
	end
end
assign soc_netsoc_sdram_choose_cmd_ce = (soc_netsoc_sdram_choose_cmd_cmd_ready | (~soc_netsoc_sdram_choose_cmd_cmd_valid));
always @(*) begin
	soc_netsoc_sdram_choose_req_valids <= 8'd0;
	soc_netsoc_sdram_choose_req_valids[0] <= (soc_netsoc_sdram_bankmachine0_cmd_valid & (((soc_netsoc_sdram_bankmachine0_cmd_payload_is_cmd & soc_netsoc_sdram_choose_req_want_cmds) & ((~((soc_netsoc_sdram_bankmachine0_cmd_payload_ras & (~soc_netsoc_sdram_bankmachine0_cmd_payload_cas)) & (~soc_netsoc_sdram_bankmachine0_cmd_payload_we))) | soc_netsoc_sdram_choose_req_want_activates)) | ((soc_netsoc_sdram_bankmachine0_cmd_payload_is_read == soc_netsoc_sdram_choose_req_want_reads) & (soc_netsoc_sdram_bankmachine0_cmd_payload_is_write == soc_netsoc_sdram_choose_req_want_writes))));
	soc_netsoc_sdram_choose_req_valids[1] <= (soc_netsoc_sdram_bankmachine1_cmd_valid & (((soc_netsoc_sdram_bankmachine1_cmd_payload_is_cmd & soc_netsoc_sdram_choose_req_want_cmds) & ((~((soc_netsoc_sdram_bankmachine1_cmd_payload_ras & (~soc_netsoc_sdram_bankmachine1_cmd_payload_cas)) & (~soc_netsoc_sdram_bankmachine1_cmd_payload_we))) | soc_netsoc_sdram_choose_req_want_activates)) | ((soc_netsoc_sdram_bankmachine1_cmd_payload_is_read == soc_netsoc_sdram_choose_req_want_reads) & (soc_netsoc_sdram_bankmachine1_cmd_payload_is_write == soc_netsoc_sdram_choose_req_want_writes))));
	soc_netsoc_sdram_choose_req_valids[2] <= (soc_netsoc_sdram_bankmachine2_cmd_valid & (((soc_netsoc_sdram_bankmachine2_cmd_payload_is_cmd & soc_netsoc_sdram_choose_req_want_cmds) & ((~((soc_netsoc_sdram_bankmachine2_cmd_payload_ras & (~soc_netsoc_sdram_bankmachine2_cmd_payload_cas)) & (~soc_netsoc_sdram_bankmachine2_cmd_payload_we))) | soc_netsoc_sdram_choose_req_want_activates)) | ((soc_netsoc_sdram_bankmachine2_cmd_payload_is_read == soc_netsoc_sdram_choose_req_want_reads) & (soc_netsoc_sdram_bankmachine2_cmd_payload_is_write == soc_netsoc_sdram_choose_req_want_writes))));
	soc_netsoc_sdram_choose_req_valids[3] <= (soc_netsoc_sdram_bankmachine3_cmd_valid & (((soc_netsoc_sdram_bankmachine3_cmd_payload_is_cmd & soc_netsoc_sdram_choose_req_want_cmds) & ((~((soc_netsoc_sdram_bankmachine3_cmd_payload_ras & (~soc_netsoc_sdram_bankmachine3_cmd_payload_cas)) & (~soc_netsoc_sdram_bankmachine3_cmd_payload_we))) | soc_netsoc_sdram_choose_req_want_activates)) | ((soc_netsoc_sdram_bankmachine3_cmd_payload_is_read == soc_netsoc_sdram_choose_req_want_reads) & (soc_netsoc_sdram_bankmachine3_cmd_payload_is_write == soc_netsoc_sdram_choose_req_want_writes))));
	soc_netsoc_sdram_choose_req_valids[4] <= (soc_netsoc_sdram_bankmachine4_cmd_valid & (((soc_netsoc_sdram_bankmachine4_cmd_payload_is_cmd & soc_netsoc_sdram_choose_req_want_cmds) & ((~((soc_netsoc_sdram_bankmachine4_cmd_payload_ras & (~soc_netsoc_sdram_bankmachine4_cmd_payload_cas)) & (~soc_netsoc_sdram_bankmachine4_cmd_payload_we))) | soc_netsoc_sdram_choose_req_want_activates)) | ((soc_netsoc_sdram_bankmachine4_cmd_payload_is_read == soc_netsoc_sdram_choose_req_want_reads) & (soc_netsoc_sdram_bankmachine4_cmd_payload_is_write == soc_netsoc_sdram_choose_req_want_writes))));
	soc_netsoc_sdram_choose_req_valids[5] <= (soc_netsoc_sdram_bankmachine5_cmd_valid & (((soc_netsoc_sdram_bankmachine5_cmd_payload_is_cmd & soc_netsoc_sdram_choose_req_want_cmds) & ((~((soc_netsoc_sdram_bankmachine5_cmd_payload_ras & (~soc_netsoc_sdram_bankmachine5_cmd_payload_cas)) & (~soc_netsoc_sdram_bankmachine5_cmd_payload_we))) | soc_netsoc_sdram_choose_req_want_activates)) | ((soc_netsoc_sdram_bankmachine5_cmd_payload_is_read == soc_netsoc_sdram_choose_req_want_reads) & (soc_netsoc_sdram_bankmachine5_cmd_payload_is_write == soc_netsoc_sdram_choose_req_want_writes))));
	soc_netsoc_sdram_choose_req_valids[6] <= (soc_netsoc_sdram_bankmachine6_cmd_valid & (((soc_netsoc_sdram_bankmachine6_cmd_payload_is_cmd & soc_netsoc_sdram_choose_req_want_cmds) & ((~((soc_netsoc_sdram_bankmachine6_cmd_payload_ras & (~soc_netsoc_sdram_bankmachine6_cmd_payload_cas)) & (~soc_netsoc_sdram_bankmachine6_cmd_payload_we))) | soc_netsoc_sdram_choose_req_want_activates)) | ((soc_netsoc_sdram_bankmachine6_cmd_payload_is_read == soc_netsoc_sdram_choose_req_want_reads) & (soc_netsoc_sdram_bankmachine6_cmd_payload_is_write == soc_netsoc_sdram_choose_req_want_writes))));
	soc_netsoc_sdram_choose_req_valids[7] <= (soc_netsoc_sdram_bankmachine7_cmd_valid & (((soc_netsoc_sdram_bankmachine7_cmd_payload_is_cmd & soc_netsoc_sdram_choose_req_want_cmds) & ((~((soc_netsoc_sdram_bankmachine7_cmd_payload_ras & (~soc_netsoc_sdram_bankmachine7_cmd_payload_cas)) & (~soc_netsoc_sdram_bankmachine7_cmd_payload_we))) | soc_netsoc_sdram_choose_req_want_activates)) | ((soc_netsoc_sdram_bankmachine7_cmd_payload_is_read == soc_netsoc_sdram_choose_req_want_reads) & (soc_netsoc_sdram_bankmachine7_cmd_payload_is_write == soc_netsoc_sdram_choose_req_want_writes))));
end
assign soc_netsoc_sdram_choose_req_request = soc_netsoc_sdram_choose_req_valids;
assign soc_netsoc_sdram_choose_req_cmd_valid = vns_rhs_array_muxed6;
assign soc_netsoc_sdram_choose_req_cmd_payload_a = vns_rhs_array_muxed7;
assign soc_netsoc_sdram_choose_req_cmd_payload_ba = vns_rhs_array_muxed8;
assign soc_netsoc_sdram_choose_req_cmd_payload_is_read = vns_rhs_array_muxed9;
assign soc_netsoc_sdram_choose_req_cmd_payload_is_write = vns_rhs_array_muxed10;
assign soc_netsoc_sdram_choose_req_cmd_payload_is_cmd = vns_rhs_array_muxed11;
always @(*) begin
	soc_netsoc_sdram_choose_req_cmd_payload_cas <= 1'd0;
	if (soc_netsoc_sdram_choose_req_cmd_valid) begin
		soc_netsoc_sdram_choose_req_cmd_payload_cas <= vns_t_array_muxed3;
	end
end
always @(*) begin
	soc_netsoc_sdram_choose_req_cmd_payload_ras <= 1'd0;
	if (soc_netsoc_sdram_choose_req_cmd_valid) begin
		soc_netsoc_sdram_choose_req_cmd_payload_ras <= vns_t_array_muxed4;
	end
end
always @(*) begin
	soc_netsoc_sdram_choose_req_cmd_payload_we <= 1'd0;
	if (soc_netsoc_sdram_choose_req_cmd_valid) begin
		soc_netsoc_sdram_choose_req_cmd_payload_we <= vns_t_array_muxed5;
	end
end
always @(*) begin
	soc_netsoc_sdram_bankmachine0_cmd_ready <= 1'd0;
	if (((soc_netsoc_sdram_choose_cmd_cmd_valid & soc_netsoc_sdram_choose_cmd_cmd_ready) & (soc_netsoc_sdram_choose_cmd_grant == 1'd0))) begin
		soc_netsoc_sdram_bankmachine0_cmd_ready <= 1'd1;
	end
	if (((soc_netsoc_sdram_choose_req_cmd_valid & soc_netsoc_sdram_choose_req_cmd_ready) & (soc_netsoc_sdram_choose_req_grant == 1'd0))) begin
		soc_netsoc_sdram_bankmachine0_cmd_ready <= 1'd1;
	end
end
always @(*) begin
	soc_netsoc_sdram_bankmachine1_cmd_ready <= 1'd0;
	if (((soc_netsoc_sdram_choose_cmd_cmd_valid & soc_netsoc_sdram_choose_cmd_cmd_ready) & (soc_netsoc_sdram_choose_cmd_grant == 1'd1))) begin
		soc_netsoc_sdram_bankmachine1_cmd_ready <= 1'd1;
	end
	if (((soc_netsoc_sdram_choose_req_cmd_valid & soc_netsoc_sdram_choose_req_cmd_ready) & (soc_netsoc_sdram_choose_req_grant == 1'd1))) begin
		soc_netsoc_sdram_bankmachine1_cmd_ready <= 1'd1;
	end
end
always @(*) begin
	soc_netsoc_sdram_bankmachine2_cmd_ready <= 1'd0;
	if (((soc_netsoc_sdram_choose_cmd_cmd_valid & soc_netsoc_sdram_choose_cmd_cmd_ready) & (soc_netsoc_sdram_choose_cmd_grant == 2'd2))) begin
		soc_netsoc_sdram_bankmachine2_cmd_ready <= 1'd1;
	end
	if (((soc_netsoc_sdram_choose_req_cmd_valid & soc_netsoc_sdram_choose_req_cmd_ready) & (soc_netsoc_sdram_choose_req_grant == 2'd2))) begin
		soc_netsoc_sdram_bankmachine2_cmd_ready <= 1'd1;
	end
end
always @(*) begin
	soc_netsoc_sdram_bankmachine3_cmd_ready <= 1'd0;
	if (((soc_netsoc_sdram_choose_cmd_cmd_valid & soc_netsoc_sdram_choose_cmd_cmd_ready) & (soc_netsoc_sdram_choose_cmd_grant == 2'd3))) begin
		soc_netsoc_sdram_bankmachine3_cmd_ready <= 1'd1;
	end
	if (((soc_netsoc_sdram_choose_req_cmd_valid & soc_netsoc_sdram_choose_req_cmd_ready) & (soc_netsoc_sdram_choose_req_grant == 2'd3))) begin
		soc_netsoc_sdram_bankmachine3_cmd_ready <= 1'd1;
	end
end
always @(*) begin
	soc_netsoc_sdram_bankmachine4_cmd_ready <= 1'd0;
	if (((soc_netsoc_sdram_choose_cmd_cmd_valid & soc_netsoc_sdram_choose_cmd_cmd_ready) & (soc_netsoc_sdram_choose_cmd_grant == 3'd4))) begin
		soc_netsoc_sdram_bankmachine4_cmd_ready <= 1'd1;
	end
	if (((soc_netsoc_sdram_choose_req_cmd_valid & soc_netsoc_sdram_choose_req_cmd_ready) & (soc_netsoc_sdram_choose_req_grant == 3'd4))) begin
		soc_netsoc_sdram_bankmachine4_cmd_ready <= 1'd1;
	end
end
always @(*) begin
	soc_netsoc_sdram_bankmachine5_cmd_ready <= 1'd0;
	if (((soc_netsoc_sdram_choose_cmd_cmd_valid & soc_netsoc_sdram_choose_cmd_cmd_ready) & (soc_netsoc_sdram_choose_cmd_grant == 3'd5))) begin
		soc_netsoc_sdram_bankmachine5_cmd_ready <= 1'd1;
	end
	if (((soc_netsoc_sdram_choose_req_cmd_valid & soc_netsoc_sdram_choose_req_cmd_ready) & (soc_netsoc_sdram_choose_req_grant == 3'd5))) begin
		soc_netsoc_sdram_bankmachine5_cmd_ready <= 1'd1;
	end
end
always @(*) begin
	soc_netsoc_sdram_bankmachine6_cmd_ready <= 1'd0;
	if (((soc_netsoc_sdram_choose_cmd_cmd_valid & soc_netsoc_sdram_choose_cmd_cmd_ready) & (soc_netsoc_sdram_choose_cmd_grant == 3'd6))) begin
		soc_netsoc_sdram_bankmachine6_cmd_ready <= 1'd1;
	end
	if (((soc_netsoc_sdram_choose_req_cmd_valid & soc_netsoc_sdram_choose_req_cmd_ready) & (soc_netsoc_sdram_choose_req_grant == 3'd6))) begin
		soc_netsoc_sdram_bankmachine6_cmd_ready <= 1'd1;
	end
end
always @(*) begin
	soc_netsoc_sdram_bankmachine7_cmd_ready <= 1'd0;
	if (((soc_netsoc_sdram_choose_cmd_cmd_valid & soc_netsoc_sdram_choose_cmd_cmd_ready) & (soc_netsoc_sdram_choose_cmd_grant == 3'd7))) begin
		soc_netsoc_sdram_bankmachine7_cmd_ready <= 1'd1;
	end
	if (((soc_netsoc_sdram_choose_req_cmd_valid & soc_netsoc_sdram_choose_req_cmd_ready) & (soc_netsoc_sdram_choose_req_grant == 3'd7))) begin
		soc_netsoc_sdram_bankmachine7_cmd_ready <= 1'd1;
	end
end
assign soc_netsoc_sdram_choose_req_ce = (soc_netsoc_sdram_choose_req_cmd_ready | (~soc_netsoc_sdram_choose_req_cmd_valid));
assign soc_netsoc_sdram_dfi_p0_reset_n = 1'd1;
assign soc_netsoc_sdram_dfi_p0_cke = {1{soc_netsoc_sdram_steerer0}};
assign soc_netsoc_sdram_dfi_p0_odt = {1{soc_netsoc_sdram_steerer1}};
assign soc_netsoc_sdram_dfi_p1_reset_n = 1'd1;
assign soc_netsoc_sdram_dfi_p1_cke = {1{soc_netsoc_sdram_steerer2}};
assign soc_netsoc_sdram_dfi_p1_odt = {1{soc_netsoc_sdram_steerer3}};
assign soc_netsoc_sdram_dfi_p2_reset_n = 1'd1;
assign soc_netsoc_sdram_dfi_p2_cke = {1{soc_netsoc_sdram_steerer4}};
assign soc_netsoc_sdram_dfi_p2_odt = {1{soc_netsoc_sdram_steerer5}};
assign soc_netsoc_sdram_dfi_p3_reset_n = 1'd1;
assign soc_netsoc_sdram_dfi_p3_cke = {1{soc_netsoc_sdram_steerer6}};
assign soc_netsoc_sdram_dfi_p3_odt = {1{soc_netsoc_sdram_steerer7}};
assign soc_netsoc_sdram_tfawcon_count = (((soc_netsoc_sdram_tfawcon_window[0] + soc_netsoc_sdram_tfawcon_window[1]) + soc_netsoc_sdram_tfawcon_window[2]) + soc_netsoc_sdram_tfawcon_window[3]);
always @(*) begin
	soc_netsoc_sdram_en0 <= 1'd0;
	soc_netsoc_sdram_choose_cmd_want_activates <= 1'd0;
	soc_netsoc_sdram_steerer_sel3 <= 2'd0;
	soc_netsoc_sdram_cmd_ready <= 1'd0;
	soc_netsoc_sdram_choose_cmd_cmd_ready <= 1'd0;
	soc_netsoc_sdram_choose_req_want_reads <= 1'd0;
	soc_netsoc_sdram_choose_req_want_writes <= 1'd0;
	soc_netsoc_sdram_en1 <= 1'd0;
	soc_netsoc_sdram_choose_req_cmd_ready <= 1'd0;
	soc_netsoc_sdram_steerer_sel0 <= 2'd0;
	vns_multiplexer_next_state <= 4'd0;
	soc_netsoc_sdram_steerer_sel1 <= 2'd0;
	soc_netsoc_sdram_steerer_sel2 <= 2'd0;
	vns_multiplexer_next_state <= vns_multiplexer_state;
	case (vns_multiplexer_state)
		1'd1: begin
			soc_netsoc_sdram_en1 <= 1'd1;
			soc_netsoc_sdram_choose_req_want_writes <= 1'd1;
			if (1'd0) begin
				soc_netsoc_sdram_choose_req_cmd_ready <= (soc_netsoc_sdram_cas_allowed & ((~((soc_netsoc_sdram_choose_req_cmd_payload_ras & (~soc_netsoc_sdram_choose_req_cmd_payload_cas)) & (~soc_netsoc_sdram_choose_req_cmd_payload_we))) | soc_netsoc_sdram_ras_allowed));
			end else begin
				soc_netsoc_sdram_choose_cmd_want_activates <= soc_netsoc_sdram_ras_allowed;
				soc_netsoc_sdram_choose_cmd_cmd_ready <= ((~((soc_netsoc_sdram_choose_cmd_cmd_payload_ras & (~soc_netsoc_sdram_choose_cmd_cmd_payload_cas)) & (~soc_netsoc_sdram_choose_cmd_cmd_payload_we))) | soc_netsoc_sdram_ras_allowed);
				soc_netsoc_sdram_choose_req_cmd_ready <= soc_netsoc_sdram_cas_allowed;
			end
			soc_netsoc_sdram_steerer_sel0 <= 1'd0;
			soc_netsoc_sdram_steerer_sel1 <= 1'd0;
			soc_netsoc_sdram_steerer_sel2 <= 1'd1;
			soc_netsoc_sdram_steerer_sel3 <= 2'd2;
			if (soc_netsoc_sdram_read_available) begin
				if (((~soc_netsoc_sdram_write_available) | soc_netsoc_sdram_max_time1)) begin
					vns_multiplexer_next_state <= 2'd3;
				end
			end
			if (soc_netsoc_sdram_go_to_refresh) begin
				vns_multiplexer_next_state <= 2'd2;
			end
		end
		2'd2: begin
			soc_netsoc_sdram_steerer_sel0 <= 2'd3;
			soc_netsoc_sdram_cmd_ready <= 1'd1;
			if (soc_netsoc_sdram_cmd_last) begin
				vns_multiplexer_next_state <= 1'd0;
			end
		end
		2'd3: begin
			if (soc_netsoc_sdram_twtrcon_ready) begin
				vns_multiplexer_next_state <= 1'd0;
			end
		end
		3'd4: begin
			vns_multiplexer_next_state <= 3'd5;
		end
		3'd5: begin
			vns_multiplexer_next_state <= 3'd6;
		end
		3'd6: begin
			vns_multiplexer_next_state <= 3'd7;
		end
		3'd7: begin
			vns_multiplexer_next_state <= 4'd8;
		end
		4'd8: begin
			vns_multiplexer_next_state <= 4'd9;
		end
		4'd9: begin
			vns_multiplexer_next_state <= 4'd10;
		end
		4'd10: begin
			vns_multiplexer_next_state <= 4'd11;
		end
		4'd11: begin
			vns_multiplexer_next_state <= 1'd1;
		end
		default: begin
			soc_netsoc_sdram_en0 <= 1'd1;
			soc_netsoc_sdram_choose_req_want_reads <= 1'd1;
			if (1'd0) begin
				soc_netsoc_sdram_choose_req_cmd_ready <= (soc_netsoc_sdram_cas_allowed & ((~((soc_netsoc_sdram_choose_req_cmd_payload_ras & (~soc_netsoc_sdram_choose_req_cmd_payload_cas)) & (~soc_netsoc_sdram_choose_req_cmd_payload_we))) | soc_netsoc_sdram_ras_allowed));
			end else begin
				soc_netsoc_sdram_choose_cmd_want_activates <= soc_netsoc_sdram_ras_allowed;
				soc_netsoc_sdram_choose_cmd_cmd_ready <= ((~((soc_netsoc_sdram_choose_cmd_cmd_payload_ras & (~soc_netsoc_sdram_choose_cmd_cmd_payload_cas)) & (~soc_netsoc_sdram_choose_cmd_cmd_payload_we))) | soc_netsoc_sdram_ras_allowed);
				soc_netsoc_sdram_choose_req_cmd_ready <= soc_netsoc_sdram_cas_allowed;
			end
			soc_netsoc_sdram_steerer_sel0 <= 1'd0;
			soc_netsoc_sdram_steerer_sel1 <= 1'd1;
			soc_netsoc_sdram_steerer_sel2 <= 2'd2;
			soc_netsoc_sdram_steerer_sel3 <= 1'd0;
			if (soc_netsoc_sdram_write_available) begin
				if (((~soc_netsoc_sdram_read_available) | soc_netsoc_sdram_max_time0)) begin
					vns_multiplexer_next_state <= 3'd4;
				end
			end
			if (soc_netsoc_sdram_go_to_refresh) begin
				vns_multiplexer_next_state <= 2'd2;
			end
		end
	endcase
end
assign vns_roundrobin0_request = {(((soc_netsoc_port_cmd_payload_addr[9:7] == 1'd0) & (~(((((((vns_locked0 | (soc_netsoc_sdram_interface_bank1_lock & (vns_roundrobin1_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank2_lock & (vns_roundrobin2_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank3_lock & (vns_roundrobin3_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank4_lock & (vns_roundrobin4_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank5_lock & (vns_roundrobin5_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank6_lock & (vns_roundrobin6_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank7_lock & (vns_roundrobin7_grant == 1'd0))))) & soc_netsoc_port_cmd_valid)};
assign vns_roundrobin0_ce = ((~soc_netsoc_sdram_interface_bank0_valid) & (~soc_netsoc_sdram_interface_bank0_lock));
assign soc_netsoc_sdram_interface_bank0_addr = vns_rhs_array_muxed12;
assign soc_netsoc_sdram_interface_bank0_we = vns_rhs_array_muxed13;
assign soc_netsoc_sdram_interface_bank0_valid = vns_rhs_array_muxed14;
assign vns_roundrobin1_request = {(((soc_netsoc_port_cmd_payload_addr[9:7] == 1'd1) & (~(((((((vns_locked1 | (soc_netsoc_sdram_interface_bank0_lock & (vns_roundrobin0_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank2_lock & (vns_roundrobin2_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank3_lock & (vns_roundrobin3_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank4_lock & (vns_roundrobin4_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank5_lock & (vns_roundrobin5_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank6_lock & (vns_roundrobin6_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank7_lock & (vns_roundrobin7_grant == 1'd0))))) & soc_netsoc_port_cmd_valid)};
assign vns_roundrobin1_ce = ((~soc_netsoc_sdram_interface_bank1_valid) & (~soc_netsoc_sdram_interface_bank1_lock));
assign soc_netsoc_sdram_interface_bank1_addr = vns_rhs_array_muxed15;
assign soc_netsoc_sdram_interface_bank1_we = vns_rhs_array_muxed16;
assign soc_netsoc_sdram_interface_bank1_valid = vns_rhs_array_muxed17;
assign vns_roundrobin2_request = {(((soc_netsoc_port_cmd_payload_addr[9:7] == 2'd2) & (~(((((((vns_locked2 | (soc_netsoc_sdram_interface_bank0_lock & (vns_roundrobin0_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank1_lock & (vns_roundrobin1_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank3_lock & (vns_roundrobin3_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank4_lock & (vns_roundrobin4_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank5_lock & (vns_roundrobin5_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank6_lock & (vns_roundrobin6_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank7_lock & (vns_roundrobin7_grant == 1'd0))))) & soc_netsoc_port_cmd_valid)};
assign vns_roundrobin2_ce = ((~soc_netsoc_sdram_interface_bank2_valid) & (~soc_netsoc_sdram_interface_bank2_lock));
assign soc_netsoc_sdram_interface_bank2_addr = vns_rhs_array_muxed18;
assign soc_netsoc_sdram_interface_bank2_we = vns_rhs_array_muxed19;
assign soc_netsoc_sdram_interface_bank2_valid = vns_rhs_array_muxed20;
assign vns_roundrobin3_request = {(((soc_netsoc_port_cmd_payload_addr[9:7] == 2'd3) & (~(((((((vns_locked3 | (soc_netsoc_sdram_interface_bank0_lock & (vns_roundrobin0_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank1_lock & (vns_roundrobin1_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank2_lock & (vns_roundrobin2_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank4_lock & (vns_roundrobin4_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank5_lock & (vns_roundrobin5_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank6_lock & (vns_roundrobin6_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank7_lock & (vns_roundrobin7_grant == 1'd0))))) & soc_netsoc_port_cmd_valid)};
assign vns_roundrobin3_ce = ((~soc_netsoc_sdram_interface_bank3_valid) & (~soc_netsoc_sdram_interface_bank3_lock));
assign soc_netsoc_sdram_interface_bank3_addr = vns_rhs_array_muxed21;
assign soc_netsoc_sdram_interface_bank3_we = vns_rhs_array_muxed22;
assign soc_netsoc_sdram_interface_bank3_valid = vns_rhs_array_muxed23;
assign vns_roundrobin4_request = {(((soc_netsoc_port_cmd_payload_addr[9:7] == 3'd4) & (~(((((((vns_locked4 | (soc_netsoc_sdram_interface_bank0_lock & (vns_roundrobin0_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank1_lock & (vns_roundrobin1_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank2_lock & (vns_roundrobin2_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank3_lock & (vns_roundrobin3_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank5_lock & (vns_roundrobin5_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank6_lock & (vns_roundrobin6_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank7_lock & (vns_roundrobin7_grant == 1'd0))))) & soc_netsoc_port_cmd_valid)};
assign vns_roundrobin4_ce = ((~soc_netsoc_sdram_interface_bank4_valid) & (~soc_netsoc_sdram_interface_bank4_lock));
assign soc_netsoc_sdram_interface_bank4_addr = vns_rhs_array_muxed24;
assign soc_netsoc_sdram_interface_bank4_we = vns_rhs_array_muxed25;
assign soc_netsoc_sdram_interface_bank4_valid = vns_rhs_array_muxed26;
assign vns_roundrobin5_request = {(((soc_netsoc_port_cmd_payload_addr[9:7] == 3'd5) & (~(((((((vns_locked5 | (soc_netsoc_sdram_interface_bank0_lock & (vns_roundrobin0_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank1_lock & (vns_roundrobin1_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank2_lock & (vns_roundrobin2_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank3_lock & (vns_roundrobin3_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank4_lock & (vns_roundrobin4_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank6_lock & (vns_roundrobin6_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank7_lock & (vns_roundrobin7_grant == 1'd0))))) & soc_netsoc_port_cmd_valid)};
assign vns_roundrobin5_ce = ((~soc_netsoc_sdram_interface_bank5_valid) & (~soc_netsoc_sdram_interface_bank5_lock));
assign soc_netsoc_sdram_interface_bank5_addr = vns_rhs_array_muxed27;
assign soc_netsoc_sdram_interface_bank5_we = vns_rhs_array_muxed28;
assign soc_netsoc_sdram_interface_bank5_valid = vns_rhs_array_muxed29;
assign vns_roundrobin6_request = {(((soc_netsoc_port_cmd_payload_addr[9:7] == 3'd6) & (~(((((((vns_locked6 | (soc_netsoc_sdram_interface_bank0_lock & (vns_roundrobin0_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank1_lock & (vns_roundrobin1_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank2_lock & (vns_roundrobin2_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank3_lock & (vns_roundrobin3_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank4_lock & (vns_roundrobin4_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank5_lock & (vns_roundrobin5_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank7_lock & (vns_roundrobin7_grant == 1'd0))))) & soc_netsoc_port_cmd_valid)};
assign vns_roundrobin6_ce = ((~soc_netsoc_sdram_interface_bank6_valid) & (~soc_netsoc_sdram_interface_bank6_lock));
assign soc_netsoc_sdram_interface_bank6_addr = vns_rhs_array_muxed30;
assign soc_netsoc_sdram_interface_bank6_we = vns_rhs_array_muxed31;
assign soc_netsoc_sdram_interface_bank6_valid = vns_rhs_array_muxed32;
assign vns_roundrobin7_request = {(((soc_netsoc_port_cmd_payload_addr[9:7] == 3'd7) & (~(((((((vns_locked7 | (soc_netsoc_sdram_interface_bank0_lock & (vns_roundrobin0_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank1_lock & (vns_roundrobin1_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank2_lock & (vns_roundrobin2_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank3_lock & (vns_roundrobin3_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank4_lock & (vns_roundrobin4_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank5_lock & (vns_roundrobin5_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank6_lock & (vns_roundrobin6_grant == 1'd0))))) & soc_netsoc_port_cmd_valid)};
assign vns_roundrobin7_ce = ((~soc_netsoc_sdram_interface_bank7_valid) & (~soc_netsoc_sdram_interface_bank7_lock));
assign soc_netsoc_sdram_interface_bank7_addr = vns_rhs_array_muxed33;
assign soc_netsoc_sdram_interface_bank7_we = vns_rhs_array_muxed34;
assign soc_netsoc_sdram_interface_bank7_valid = vns_rhs_array_muxed35;
assign soc_netsoc_port_cmd_ready = ((((((((1'd0 | (((vns_roundrobin0_grant == 1'd0) & ((soc_netsoc_port_cmd_payload_addr[9:7] == 1'd0) & (~(((((((vns_locked0 | (soc_netsoc_sdram_interface_bank1_lock & (vns_roundrobin1_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank2_lock & (vns_roundrobin2_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank3_lock & (vns_roundrobin3_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank4_lock & (vns_roundrobin4_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank5_lock & (vns_roundrobin5_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank6_lock & (vns_roundrobin6_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank7_lock & (vns_roundrobin7_grant == 1'd0)))))) & soc_netsoc_sdram_interface_bank0_ready)) | (((vns_roundrobin1_grant == 1'd0) & ((soc_netsoc_port_cmd_payload_addr[9:7] == 1'd1) & (~(((((((vns_locked1 | (soc_netsoc_sdram_interface_bank0_lock & (vns_roundrobin0_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank2_lock & (vns_roundrobin2_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank3_lock & (vns_roundrobin3_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank4_lock & (vns_roundrobin4_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank5_lock & (vns_roundrobin5_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank6_lock & (vns_roundrobin6_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank7_lock & (vns_roundrobin7_grant == 1'd0)))))) & soc_netsoc_sdram_interface_bank1_ready)) | (((vns_roundrobin2_grant == 1'd0) & ((soc_netsoc_port_cmd_payload_addr[9:7] == 2'd2) & (~(((((((vns_locked2 | (soc_netsoc_sdram_interface_bank0_lock & (vns_roundrobin0_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank1_lock & (vns_roundrobin1_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank3_lock & (vns_roundrobin3_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank4_lock & (vns_roundrobin4_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank5_lock & (vns_roundrobin5_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank6_lock & (vns_roundrobin6_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank7_lock & (vns_roundrobin7_grant == 1'd0)))))) & soc_netsoc_sdram_interface_bank2_ready)) | (((vns_roundrobin3_grant == 1'd0) & ((soc_netsoc_port_cmd_payload_addr[9:7] == 2'd3) & (~(((((((vns_locked3 | (soc_netsoc_sdram_interface_bank0_lock & (vns_roundrobin0_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank1_lock & (vns_roundrobin1_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank2_lock & (vns_roundrobin2_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank4_lock & (vns_roundrobin4_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank5_lock & (vns_roundrobin5_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank6_lock & (vns_roundrobin6_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank7_lock & (vns_roundrobin7_grant == 1'd0)))))) & soc_netsoc_sdram_interface_bank3_ready)) | (((vns_roundrobin4_grant == 1'd0) & ((soc_netsoc_port_cmd_payload_addr[9:7] == 3'd4) & (~(((((((vns_locked4 | (soc_netsoc_sdram_interface_bank0_lock & (vns_roundrobin0_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank1_lock & (vns_roundrobin1_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank2_lock & (vns_roundrobin2_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank3_lock & (vns_roundrobin3_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank5_lock & (vns_roundrobin5_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank6_lock & (vns_roundrobin6_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank7_lock & (vns_roundrobin7_grant == 1'd0)))))) & soc_netsoc_sdram_interface_bank4_ready)) | (((vns_roundrobin5_grant == 1'd0) & ((soc_netsoc_port_cmd_payload_addr[9:7] == 3'd5) & (~(((((((vns_locked5 | (soc_netsoc_sdram_interface_bank0_lock & (vns_roundrobin0_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank1_lock & (vns_roundrobin1_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank2_lock & (vns_roundrobin2_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank3_lock & (vns_roundrobin3_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank4_lock & (vns_roundrobin4_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank6_lock & (vns_roundrobin6_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank7_lock & (vns_roundrobin7_grant == 1'd0)))))) & soc_netsoc_sdram_interface_bank5_ready)) | (((vns_roundrobin6_grant == 1'd0) & ((soc_netsoc_port_cmd_payload_addr[9:7] == 3'd6) & (~(((((((vns_locked6 | (soc_netsoc_sdram_interface_bank0_lock & (vns_roundrobin0_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank1_lock & (vns_roundrobin1_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank2_lock & (vns_roundrobin2_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank3_lock & (vns_roundrobin3_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank4_lock & (vns_roundrobin4_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank5_lock & (vns_roundrobin5_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank7_lock & (vns_roundrobin7_grant == 1'd0)))))) & soc_netsoc_sdram_interface_bank6_ready)) | (((vns_roundrobin7_grant == 1'd0) & ((soc_netsoc_port_cmd_payload_addr[9:7] == 3'd7) & (~(((((((vns_locked7 | (soc_netsoc_sdram_interface_bank0_lock & (vns_roundrobin0_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank1_lock & (vns_roundrobin1_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank2_lock & (vns_roundrobin2_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank3_lock & (vns_roundrobin3_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank4_lock & (vns_roundrobin4_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank5_lock & (vns_roundrobin5_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank6_lock & (vns_roundrobin6_grant == 1'd0)))))) & soc_netsoc_sdram_interface_bank7_ready));
assign soc_netsoc_port_wdata_ready = vns_new_master_wdata_ready2;
assign soc_netsoc_port_rdata_valid = vns_new_master_rdata_valid9;
always @(*) begin
	soc_netsoc_sdram_interface_wdata <= 128'd0;
	soc_netsoc_sdram_interface_wdata_we <= 16'd0;
	case ({vns_new_master_wdata_ready2})
		1'd1: begin
			soc_netsoc_sdram_interface_wdata <= soc_netsoc_port_wdata_payload_data;
			soc_netsoc_sdram_interface_wdata_we <= soc_netsoc_port_wdata_payload_we;
		end
		default: begin
			soc_netsoc_sdram_interface_wdata <= 1'd0;
			soc_netsoc_sdram_interface_wdata_we <= 1'd0;
		end
	endcase
end
assign soc_netsoc_port_rdata_payload_data = soc_netsoc_sdram_interface_rdata;
assign vns_roundrobin0_grant = 1'd0;
assign vns_roundrobin1_grant = 1'd0;
assign vns_roundrobin2_grant = 1'd0;
assign vns_roundrobin3_grant = 1'd0;
assign vns_roundrobin4_grant = 1'd0;
assign vns_roundrobin5_grant = 1'd0;
assign vns_roundrobin6_grant = 1'd0;
assign vns_roundrobin7_grant = 1'd0;
assign soc_netsoc_data_port_adr = soc_netsoc_interface0_wb_sdram_adr[10:2];
always @(*) begin
	soc_netsoc_data_port_we <= 16'd0;
	soc_netsoc_data_port_dat_w <= 128'd0;
	if (soc_netsoc_write_from_slave) begin
		soc_netsoc_data_port_dat_w <= soc_netsoc_dat_r;
		soc_netsoc_data_port_we <= {16{1'd1}};
	end else begin
		soc_netsoc_data_port_dat_w <= {4{soc_netsoc_interface0_wb_sdram_dat_w}};
		if ((((soc_netsoc_interface0_wb_sdram_cyc & soc_netsoc_interface0_wb_sdram_stb) & soc_netsoc_interface0_wb_sdram_we) & soc_netsoc_interface0_wb_sdram_ack)) begin
			soc_netsoc_data_port_we <= {({4{(soc_netsoc_interface0_wb_sdram_adr[1:0] == 1'd0)}} & soc_netsoc_interface0_wb_sdram_sel), ({4{(soc_netsoc_interface0_wb_sdram_adr[1:0] == 1'd1)}} & soc_netsoc_interface0_wb_sdram_sel), ({4{(soc_netsoc_interface0_wb_sdram_adr[1:0] == 2'd2)}} & soc_netsoc_interface0_wb_sdram_sel), ({4{(soc_netsoc_interface0_wb_sdram_adr[1:0] == 2'd3)}} & soc_netsoc_interface0_wb_sdram_sel)};
		end
	end
end
assign soc_netsoc_dat_w = soc_netsoc_data_port_dat_r;
assign soc_netsoc_sel = 16'd65535;
always @(*) begin
	soc_netsoc_interface0_wb_sdram_dat_r <= 32'd0;
	case (soc_netsoc_adr_offset_r)
		1'd0: begin
			soc_netsoc_interface0_wb_sdram_dat_r <= soc_netsoc_data_port_dat_r[127:96];
		end
		1'd1: begin
			soc_netsoc_interface0_wb_sdram_dat_r <= soc_netsoc_data_port_dat_r[95:64];
		end
		2'd2: begin
			soc_netsoc_interface0_wb_sdram_dat_r <= soc_netsoc_data_port_dat_r[63:32];
		end
		default: begin
			soc_netsoc_interface0_wb_sdram_dat_r <= soc_netsoc_data_port_dat_r[31:0];
		end
	endcase
end
assign {soc_netsoc_tag_do_dirty, soc_netsoc_tag_do_tag} = soc_netsoc_tag_port_dat_r;
assign soc_netsoc_tag_port_dat_w = {soc_netsoc_tag_di_dirty, soc_netsoc_tag_di_tag};
assign soc_netsoc_tag_port_adr = soc_netsoc_interface0_wb_sdram_adr[10:2];
assign soc_netsoc_tag_di_tag = soc_netsoc_interface0_wb_sdram_adr[29:11];
assign soc_netsoc_adr = {soc_netsoc_tag_do_tag, soc_netsoc_interface0_wb_sdram_adr[10:2]};
always @(*) begin
	vns_fullmemorywe_next_state <= 3'd0;
	soc_netsoc_tag_di_dirty <= 1'd0;
	soc_netsoc_word_clr <= 1'd0;
	soc_netsoc_interface0_wb_sdram_ack <= 1'd0;
	soc_netsoc_word_inc <= 1'd0;
	soc_netsoc_write_from_slave <= 1'd0;
	soc_netsoc_cyc <= 1'd0;
	soc_netsoc_stb <= 1'd0;
	soc_netsoc_tag_port_we <= 1'd0;
	soc_netsoc_we <= 1'd0;
	vns_fullmemorywe_next_state <= vns_fullmemorywe_state;
	case (vns_fullmemorywe_state)
		1'd1: begin
			soc_netsoc_word_clr <= 1'd1;
			if ((soc_netsoc_tag_do_tag == soc_netsoc_interface0_wb_sdram_adr[29:11])) begin
				soc_netsoc_interface0_wb_sdram_ack <= 1'd1;
				if (soc_netsoc_interface0_wb_sdram_we) begin
					soc_netsoc_tag_di_dirty <= 1'd1;
					soc_netsoc_tag_port_we <= 1'd1;
				end
				vns_fullmemorywe_next_state <= 1'd0;
			end else begin
				if (soc_netsoc_tag_do_dirty) begin
					vns_fullmemorywe_next_state <= 2'd2;
				end else begin
					vns_fullmemorywe_next_state <= 2'd3;
				end
			end
		end
		2'd2: begin
			soc_netsoc_stb <= 1'd1;
			soc_netsoc_cyc <= 1'd1;
			soc_netsoc_we <= 1'd1;
			if (soc_netsoc_ack) begin
				soc_netsoc_word_inc <= 1'd1;
				if (1'd1) begin
					vns_fullmemorywe_next_state <= 2'd3;
				end
			end
		end
		2'd3: begin
			soc_netsoc_tag_port_we <= 1'd1;
			soc_netsoc_word_clr <= 1'd1;
			vns_fullmemorywe_next_state <= 3'd4;
		end
		3'd4: begin
			soc_netsoc_stb <= 1'd1;
			soc_netsoc_cyc <= 1'd1;
			soc_netsoc_we <= 1'd0;
			if (soc_netsoc_ack) begin
				soc_netsoc_write_from_slave <= 1'd1;
				soc_netsoc_word_inc <= 1'd1;
				if (1'd1) begin
					vns_fullmemorywe_next_state <= 1'd1;
				end else begin
					vns_fullmemorywe_next_state <= 3'd4;
				end
			end
		end
		default: begin
			if ((soc_netsoc_interface0_wb_sdram_cyc & soc_netsoc_interface0_wb_sdram_stb)) begin
				vns_fullmemorywe_next_state <= 1'd1;
			end
		end
	endcase
end
assign soc_netsoc_wdata_converter_sink_valid = ((soc_netsoc_cyc & soc_netsoc_stb) & soc_netsoc_we);
assign soc_netsoc_wdata_converter_sink_payload_data = soc_netsoc_dat_w;
assign soc_netsoc_wdata_converter_sink_payload_we = soc_netsoc_sel;
assign soc_netsoc_port_wdata_valid = soc_netsoc_wdata_converter_source_valid;
assign soc_netsoc_wdata_converter_source_ready = soc_netsoc_port_wdata_ready;
assign soc_netsoc_port_wdata_first = soc_netsoc_wdata_converter_source_first;
assign soc_netsoc_port_wdata_last = soc_netsoc_wdata_converter_source_last;
assign soc_netsoc_port_wdata_payload_data = soc_netsoc_wdata_converter_source_payload_data;
assign soc_netsoc_port_wdata_payload_we = soc_netsoc_wdata_converter_source_payload_we;
assign soc_netsoc_rdata_converter_sink_valid = soc_netsoc_port_rdata_valid;
assign soc_netsoc_port_rdata_ready = soc_netsoc_rdata_converter_sink_ready;
assign soc_netsoc_rdata_converter_sink_first = soc_netsoc_port_rdata_first;
assign soc_netsoc_rdata_converter_sink_last = soc_netsoc_port_rdata_last;
assign soc_netsoc_rdata_converter_sink_payload_data = soc_netsoc_port_rdata_payload_data;
assign soc_netsoc_rdata_converter_source_ready = 1'd1;
assign soc_netsoc_dat_r = soc_netsoc_rdata_converter_source_payload_data;
assign soc_netsoc_wdata_converter_converter_sink_valid = soc_netsoc_wdata_converter_sink_valid;
assign soc_netsoc_wdata_converter_converter_sink_first = soc_netsoc_wdata_converter_sink_first;
assign soc_netsoc_wdata_converter_converter_sink_last = soc_netsoc_wdata_converter_sink_last;
assign soc_netsoc_wdata_converter_sink_ready = soc_netsoc_wdata_converter_converter_sink_ready;
assign soc_netsoc_wdata_converter_converter_sink_payload_data = {soc_netsoc_wdata_converter_sink_payload_we, soc_netsoc_wdata_converter_sink_payload_data};
assign soc_netsoc_wdata_converter_source_valid = soc_netsoc_wdata_converter_source_source_valid;
assign soc_netsoc_wdata_converter_source_first = soc_netsoc_wdata_converter_source_source_first;
assign soc_netsoc_wdata_converter_source_last = soc_netsoc_wdata_converter_source_source_last;
assign soc_netsoc_wdata_converter_source_source_ready = soc_netsoc_wdata_converter_source_ready;
assign {soc_netsoc_wdata_converter_source_payload_we, soc_netsoc_wdata_converter_source_payload_data} = soc_netsoc_wdata_converter_source_source_payload_data;
assign soc_netsoc_wdata_converter_source_source_valid = soc_netsoc_wdata_converter_converter_source_valid;
assign soc_netsoc_wdata_converter_converter_source_ready = soc_netsoc_wdata_converter_source_source_ready;
assign soc_netsoc_wdata_converter_source_source_first = soc_netsoc_wdata_converter_converter_source_first;
assign soc_netsoc_wdata_converter_source_source_last = soc_netsoc_wdata_converter_converter_source_last;
assign soc_netsoc_wdata_converter_source_source_payload_data = soc_netsoc_wdata_converter_converter_source_payload_data;
assign soc_netsoc_wdata_converter_converter_source_valid = soc_netsoc_wdata_converter_converter_sink_valid;
assign soc_netsoc_wdata_converter_converter_sink_ready = soc_netsoc_wdata_converter_converter_source_ready;
assign soc_netsoc_wdata_converter_converter_source_first = soc_netsoc_wdata_converter_converter_sink_first;
assign soc_netsoc_wdata_converter_converter_source_last = soc_netsoc_wdata_converter_converter_sink_last;
assign soc_netsoc_wdata_converter_converter_source_payload_data = soc_netsoc_wdata_converter_converter_sink_payload_data;
assign soc_netsoc_wdata_converter_converter_source_payload_valid_token_count = 1'd1;
assign soc_netsoc_rdata_converter_converter_sink_valid = soc_netsoc_rdata_converter_sink_valid;
assign soc_netsoc_rdata_converter_converter_sink_first = soc_netsoc_rdata_converter_sink_first;
assign soc_netsoc_rdata_converter_converter_sink_last = soc_netsoc_rdata_converter_sink_last;
assign soc_netsoc_rdata_converter_sink_ready = soc_netsoc_rdata_converter_converter_sink_ready;
assign soc_netsoc_rdata_converter_converter_sink_payload_data = {soc_netsoc_rdata_converter_sink_payload_data};
assign soc_netsoc_rdata_converter_source_valid = soc_netsoc_rdata_converter_source_source_valid;
assign soc_netsoc_rdata_converter_source_first = soc_netsoc_rdata_converter_source_source_first;
assign soc_netsoc_rdata_converter_source_last = soc_netsoc_rdata_converter_source_source_last;
assign soc_netsoc_rdata_converter_source_source_ready = soc_netsoc_rdata_converter_source_ready;
assign {soc_netsoc_rdata_converter_source_payload_data} = soc_netsoc_rdata_converter_source_source_payload_data;
assign soc_netsoc_rdata_converter_source_source_valid = soc_netsoc_rdata_converter_converter_source_valid;
assign soc_netsoc_rdata_converter_converter_source_ready = soc_netsoc_rdata_converter_source_source_ready;
assign soc_netsoc_rdata_converter_source_source_first = soc_netsoc_rdata_converter_converter_source_first;
assign soc_netsoc_rdata_converter_source_source_last = soc_netsoc_rdata_converter_converter_source_last;
assign soc_netsoc_rdata_converter_source_source_payload_data = soc_netsoc_rdata_converter_converter_source_payload_data;
assign soc_netsoc_rdata_converter_converter_source_valid = soc_netsoc_rdata_converter_converter_sink_valid;
assign soc_netsoc_rdata_converter_converter_sink_ready = soc_netsoc_rdata_converter_converter_source_ready;
assign soc_netsoc_rdata_converter_converter_source_first = soc_netsoc_rdata_converter_converter_sink_first;
assign soc_netsoc_rdata_converter_converter_source_last = soc_netsoc_rdata_converter_converter_sink_last;
assign soc_netsoc_rdata_converter_converter_source_payload_data = soc_netsoc_rdata_converter_converter_sink_payload_data;
assign soc_netsoc_rdata_converter_converter_source_payload_valid_token_count = 1'd1;
always @(*) begin
	soc_netsoc_count_litedramwishbone2native_next_value <= 1'd0;
	soc_netsoc_port_cmd_valid <= 1'd0;
	soc_netsoc_count_litedramwishbone2native_next_value_ce <= 1'd0;
	soc_netsoc_ack <= 1'd0;
	soc_netsoc_port_cmd_payload_we <= 1'd0;
	vns_litedramwishbone2native_next_state <= 2'd0;
	soc_netsoc_port_cmd_payload_addr <= 24'd0;
	vns_litedramwishbone2native_next_state <= vns_litedramwishbone2native_state;
	case (vns_litedramwishbone2native_state)
		1'd1: begin
			if (soc_netsoc_wdata_converter_sink_ready) begin
				soc_netsoc_ack <= 1'd1;
				vns_litedramwishbone2native_next_state <= 1'd0;
			end
		end
		2'd2: begin
			if (soc_netsoc_rdata_converter_source_valid) begin
				soc_netsoc_ack <= 1'd1;
				vns_litedramwishbone2native_next_state <= 1'd0;
			end
		end
		default: begin
			soc_netsoc_port_cmd_valid <= (soc_netsoc_cyc & soc_netsoc_stb);
			soc_netsoc_port_cmd_payload_we <= soc_netsoc_we;
			soc_netsoc_port_cmd_payload_addr <= (((soc_netsoc_adr * 1'd1) + soc_netsoc_count) - 1'd0);
			if ((soc_netsoc_port_cmd_valid & soc_netsoc_port_cmd_ready)) begin
				soc_netsoc_count_litedramwishbone2native_next_value <= (soc_netsoc_count + 1'd1);
				soc_netsoc_count_litedramwishbone2native_next_value_ce <= 1'd1;
				if ((soc_netsoc_count == 1'd0)) begin
					soc_netsoc_count_litedramwishbone2native_next_value <= 1'd0;
					soc_netsoc_count_litedramwishbone2native_next_value_ce <= 1'd1;
					if (soc_netsoc_we) begin
						vns_litedramwishbone2native_next_state <= 1'd1;
					end else begin
						vns_litedramwishbone2native_next_state <= 2'd2;
					end
				end
			end
		end
	endcase
end
assign eth_rx_clk = eth_clocks_rx;
assign eth_tx_clk = eth_clocks_tx;
assign soc_reset0 = (soc_reset_storage | soc_reset1);
assign eth_rst_n = (~soc_reset0);
assign soc_counter_done = (soc_counter == 9'd256);
assign soc_counter_ce = (~soc_counter_done);
assign soc_reset1 = (~soc_counter_done);
assign soc_liteethphymiitx_converter_sink_valid = soc_liteethphymiitx_sink_sink_valid;
assign soc_liteethphymiitx_converter_sink_payload_data = soc_liteethphymiitx_sink_sink_payload_data;
assign soc_liteethphymiitx_sink_sink_ready = soc_liteethphymiitx_converter_sink_ready;
assign soc_liteethphymiitx_converter_source_ready = 1'd1;
assign soc_liteethphymiitx_converter_converter_sink_valid = soc_liteethphymiitx_converter_sink_valid;
assign soc_liteethphymiitx_converter_converter_sink_first = soc_liteethphymiitx_converter_sink_first;
assign soc_liteethphymiitx_converter_converter_sink_last = soc_liteethphymiitx_converter_sink_last;
assign soc_liteethphymiitx_converter_sink_ready = soc_liteethphymiitx_converter_converter_sink_ready;
always @(*) begin
	soc_liteethphymiitx_converter_converter_sink_payload_data <= 8'd0;
	soc_liteethphymiitx_converter_converter_sink_payload_data[3:0] <= soc_liteethphymiitx_converter_sink_payload_data[3:0];
	soc_liteethphymiitx_converter_converter_sink_payload_data[7:4] <= soc_liteethphymiitx_converter_sink_payload_data[7:4];
end
assign soc_liteethphymiitx_converter_source_valid = soc_liteethphymiitx_converter_source_source_valid;
assign soc_liteethphymiitx_converter_source_first = soc_liteethphymiitx_converter_source_source_first;
assign soc_liteethphymiitx_converter_source_last = soc_liteethphymiitx_converter_source_source_last;
assign soc_liteethphymiitx_converter_source_source_ready = soc_liteethphymiitx_converter_source_ready;
assign {soc_liteethphymiitx_converter_source_payload_data} = soc_liteethphymiitx_converter_source_source_payload_data;
assign soc_liteethphymiitx_converter_source_source_valid = soc_liteethphymiitx_converter_converter_source_valid;
assign soc_liteethphymiitx_converter_converter_source_ready = soc_liteethphymiitx_converter_source_source_ready;
assign soc_liteethphymiitx_converter_source_source_first = soc_liteethphymiitx_converter_converter_source_first;
assign soc_liteethphymiitx_converter_source_source_last = soc_liteethphymiitx_converter_converter_source_last;
assign soc_liteethphymiitx_converter_source_source_payload_data = soc_liteethphymiitx_converter_converter_source_payload_data;
assign soc_liteethphymiitx_converter_converter_first = (soc_liteethphymiitx_converter_converter_mux == 1'd0);
assign soc_liteethphymiitx_converter_converter_last = (soc_liteethphymiitx_converter_converter_mux == 1'd1);
assign soc_liteethphymiitx_converter_converter_source_valid = soc_liteethphymiitx_converter_converter_sink_valid;
assign soc_liteethphymiitx_converter_converter_source_first = (soc_liteethphymiitx_converter_converter_sink_first & soc_liteethphymiitx_converter_converter_first);
assign soc_liteethphymiitx_converter_converter_source_last = (soc_liteethphymiitx_converter_converter_sink_last & soc_liteethphymiitx_converter_converter_last);
assign soc_liteethphymiitx_converter_converter_sink_ready = (soc_liteethphymiitx_converter_converter_last & soc_liteethphymiitx_converter_converter_source_ready);
always @(*) begin
	soc_liteethphymiitx_converter_converter_source_payload_data <= 4'd0;
	case (soc_liteethphymiitx_converter_converter_mux)
		1'd0: begin
			soc_liteethphymiitx_converter_converter_source_payload_data <= soc_liteethphymiitx_converter_converter_sink_payload_data[3:0];
		end
		default: begin
			soc_liteethphymiitx_converter_converter_source_payload_data <= soc_liteethphymiitx_converter_converter_sink_payload_data[7:4];
		end
	endcase
end
assign soc_liteethphymiitx_converter_converter_source_payload_valid_token_count = soc_liteethphymiitx_converter_converter_last;
assign soc_liteethphymiirx_converter_sink_last = (~eth_rx_dv);
assign soc_liteethphymiirx_source_source_valid = soc_liteethphymiirx_converter_source_valid;
assign soc_liteethphymiirx_converter_source_ready = soc_liteethphymiirx_source_source_ready;
assign soc_liteethphymiirx_source_source_first = soc_liteethphymiirx_converter_source_first;
assign soc_liteethphymiirx_source_source_last = soc_liteethphymiirx_converter_source_last;
assign soc_liteethphymiirx_source_source_payload_data = soc_liteethphymiirx_converter_source_payload_data;
assign soc_liteethphymiirx_converter_converter_sink_valid = soc_liteethphymiirx_converter_sink_valid;
assign soc_liteethphymiirx_converter_converter_sink_first = soc_liteethphymiirx_converter_sink_first;
assign soc_liteethphymiirx_converter_converter_sink_last = soc_liteethphymiirx_converter_sink_last;
assign soc_liteethphymiirx_converter_sink_ready = soc_liteethphymiirx_converter_converter_sink_ready;
assign soc_liteethphymiirx_converter_converter_sink_payload_data = {soc_liteethphymiirx_converter_sink_payload_data};
assign soc_liteethphymiirx_converter_source_valid = soc_liteethphymiirx_converter_source_source_valid;
assign soc_liteethphymiirx_converter_source_first = soc_liteethphymiirx_converter_source_source_first;
assign soc_liteethphymiirx_converter_source_last = soc_liteethphymiirx_converter_source_source_last;
assign soc_liteethphymiirx_converter_source_source_ready = soc_liteethphymiirx_converter_source_ready;
always @(*) begin
	soc_liteethphymiirx_converter_source_payload_data <= 8'd0;
	soc_liteethphymiirx_converter_source_payload_data[3:0] <= soc_liteethphymiirx_converter_source_source_payload_data[3:0];
	soc_liteethphymiirx_converter_source_payload_data[7:4] <= soc_liteethphymiirx_converter_source_source_payload_data[7:4];
end
assign soc_liteethphymiirx_converter_source_source_valid = soc_liteethphymiirx_converter_converter_source_valid;
assign soc_liteethphymiirx_converter_converter_source_ready = soc_liteethphymiirx_converter_source_source_ready;
assign soc_liteethphymiirx_converter_source_source_first = soc_liteethphymiirx_converter_converter_source_first;
assign soc_liteethphymiirx_converter_source_source_last = soc_liteethphymiirx_converter_converter_source_last;
assign soc_liteethphymiirx_converter_source_source_payload_data = soc_liteethphymiirx_converter_converter_source_payload_data;
assign soc_liteethphymiirx_converter_converter_sink_ready = ((~soc_liteethphymiirx_converter_converter_strobe_all) | soc_liteethphymiirx_converter_converter_source_ready);
assign soc_liteethphymiirx_converter_converter_source_valid = soc_liteethphymiirx_converter_converter_strobe_all;
assign soc_liteethphymiirx_converter_converter_load_part = (soc_liteethphymiirx_converter_converter_sink_valid & soc_liteethphymiirx_converter_converter_sink_ready);
assign eth_mdc = soc_storage[0];
assign soc_data_oe = soc_storage[1];
assign soc_data_w = soc_storage[2];
assign soc_tx_cdc_sink_valid = soc_source_valid;
assign soc_source_ready = soc_tx_cdc_sink_ready;
assign soc_tx_cdc_sink_first = soc_source_first;
assign soc_tx_cdc_sink_last = soc_source_last;
assign soc_tx_cdc_sink_payload_data = soc_source_payload_data;
assign soc_tx_cdc_sink_payload_last_be = soc_source_payload_last_be;
assign soc_tx_cdc_sink_payload_error = soc_source_payload_error;
assign soc_sink_valid = soc_rx_cdc_source_valid;
assign soc_rx_cdc_source_ready = soc_sink_ready;
assign soc_sink_first = soc_rx_cdc_source_first;
assign soc_sink_last = soc_rx_cdc_source_last;
assign soc_sink_payload_data = soc_rx_cdc_source_payload_data;
assign soc_sink_payload_last_be = soc_rx_cdc_source_payload_last_be;
assign soc_sink_payload_error = soc_rx_cdc_source_payload_error;
assign soc_ps_preamble_error_i = soc_preamble_checker_error;
assign soc_ps_crc_error_i = soc_crc32_checker_error;
always @(*) begin
	soc_tx_gap_inserter_source_first <= 1'd0;
	soc_tx_gap_inserter_source_last <= 1'd0;
	soc_tx_gap_inserter_source_payload_data <= 8'd0;
	soc_tx_gap_inserter_source_payload_last_be <= 1'd0;
	soc_tx_gap_inserter_source_payload_error <= 1'd0;
	soc_tx_gap_inserter_counter_reset <= 1'd0;
	soc_tx_gap_inserter_counter_ce <= 1'd0;
	soc_tx_gap_inserter_sink_ready <= 1'd0;
	vns_liteethmacgap_next_state <= 1'd0;
	soc_tx_gap_inserter_source_valid <= 1'd0;
	vns_liteethmacgap_next_state <= vns_liteethmacgap_state;
	case (vns_liteethmacgap_state)
		1'd1: begin
			soc_tx_gap_inserter_counter_ce <= 1'd1;
			if ((soc_tx_gap_inserter_counter == 4'd11)) begin
				vns_liteethmacgap_next_state <= 1'd0;
			end
		end
		default: begin
			soc_tx_gap_inserter_counter_reset <= 1'd1;
			soc_tx_gap_inserter_source_valid <= soc_tx_gap_inserter_sink_valid;
			soc_tx_gap_inserter_sink_ready <= soc_tx_gap_inserter_source_ready;
			soc_tx_gap_inserter_source_first <= soc_tx_gap_inserter_sink_first;
			soc_tx_gap_inserter_source_last <= soc_tx_gap_inserter_sink_last;
			soc_tx_gap_inserter_source_payload_data <= soc_tx_gap_inserter_sink_payload_data;
			soc_tx_gap_inserter_source_payload_last_be <= soc_tx_gap_inserter_sink_payload_last_be;
			soc_tx_gap_inserter_source_payload_error <= soc_tx_gap_inserter_sink_payload_error;
			if (((soc_tx_gap_inserter_sink_valid & soc_tx_gap_inserter_sink_last) & soc_tx_gap_inserter_sink_ready)) begin
				vns_liteethmacgap_next_state <= 1'd1;
			end
		end
	endcase
end
assign soc_preamble_inserter_source_payload_last_be = soc_preamble_inserter_sink_payload_last_be;
always @(*) begin
	soc_preamble_inserter_source_payload_error <= 1'd0;
	vns_liteethmacpreambleinserter_next_state <= 2'd0;
	soc_preamble_inserter_clr_cnt <= 1'd0;
	soc_preamble_inserter_sink_ready <= 1'd0;
	soc_preamble_inserter_inc_cnt <= 1'd0;
	soc_preamble_inserter_source_valid <= 1'd0;
	soc_preamble_inserter_source_first <= 1'd0;
	soc_preamble_inserter_source_last <= 1'd0;
	soc_preamble_inserter_source_payload_data <= 8'd0;
	soc_preamble_inserter_source_payload_data <= soc_preamble_inserter_sink_payload_data;
	vns_liteethmacpreambleinserter_next_state <= vns_liteethmacpreambleinserter_state;
	case (vns_liteethmacpreambleinserter_state)
		1'd1: begin
			soc_preamble_inserter_source_valid <= 1'd1;
			case (soc_preamble_inserter_cnt)
				1'd0: begin
					soc_preamble_inserter_source_payload_data <= soc_preamble_inserter_preamble[7:0];
				end
				1'd1: begin
					soc_preamble_inserter_source_payload_data <= soc_preamble_inserter_preamble[15:8];
				end
				2'd2: begin
					soc_preamble_inserter_source_payload_data <= soc_preamble_inserter_preamble[23:16];
				end
				2'd3: begin
					soc_preamble_inserter_source_payload_data <= soc_preamble_inserter_preamble[31:24];
				end
				3'd4: begin
					soc_preamble_inserter_source_payload_data <= soc_preamble_inserter_preamble[39:32];
				end
				3'd5: begin
					soc_preamble_inserter_source_payload_data <= soc_preamble_inserter_preamble[47:40];
				end
				3'd6: begin
					soc_preamble_inserter_source_payload_data <= soc_preamble_inserter_preamble[55:48];
				end
				default: begin
					soc_preamble_inserter_source_payload_data <= soc_preamble_inserter_preamble[63:56];
				end
			endcase
			if ((soc_preamble_inserter_cnt == 3'd7)) begin
				if (soc_preamble_inserter_source_ready) begin
					vns_liteethmacpreambleinserter_next_state <= 2'd2;
				end
			end else begin
				soc_preamble_inserter_inc_cnt <= soc_preamble_inserter_source_ready;
			end
		end
		2'd2: begin
			soc_preamble_inserter_source_valid <= soc_preamble_inserter_sink_valid;
			soc_preamble_inserter_sink_ready <= soc_preamble_inserter_source_ready;
			soc_preamble_inserter_source_first <= soc_preamble_inserter_sink_first;
			soc_preamble_inserter_source_last <= soc_preamble_inserter_sink_last;
			soc_preamble_inserter_source_payload_error <= soc_preamble_inserter_sink_payload_error;
			if (((soc_preamble_inserter_sink_valid & soc_preamble_inserter_sink_last) & soc_preamble_inserter_source_ready)) begin
				vns_liteethmacpreambleinserter_next_state <= 1'd0;
			end
		end
		default: begin
			soc_preamble_inserter_sink_ready <= 1'd1;
			soc_preamble_inserter_clr_cnt <= 1'd1;
			if (soc_preamble_inserter_sink_valid) begin
				soc_preamble_inserter_sink_ready <= 1'd0;
				vns_liteethmacpreambleinserter_next_state <= 1'd1;
			end
		end
	endcase
end
assign soc_preamble_checker_source_payload_data = soc_preamble_checker_sink_payload_data;
assign soc_preamble_checker_source_payload_last_be = soc_preamble_checker_sink_payload_last_be;
always @(*) begin
	soc_preamble_checker_source_payload_error <= 1'd0;
	soc_preamble_checker_error <= 1'd0;
	soc_preamble_checker_source_valid <= 1'd0;
	soc_preamble_checker_source_first <= 1'd0;
	soc_preamble_checker_sink_ready <= 1'd0;
	soc_preamble_checker_source_last <= 1'd0;
	vns_liteethmacpreamblechecker_next_state <= 1'd0;
	vns_liteethmacpreamblechecker_next_state <= vns_liteethmacpreamblechecker_state;
	case (vns_liteethmacpreamblechecker_state)
		1'd1: begin
			soc_preamble_checker_source_valid <= soc_preamble_checker_sink_valid;
			soc_preamble_checker_sink_ready <= soc_preamble_checker_source_ready;
			soc_preamble_checker_source_first <= soc_preamble_checker_sink_first;
			soc_preamble_checker_source_last <= soc_preamble_checker_sink_last;
			soc_preamble_checker_source_payload_error <= soc_preamble_checker_sink_payload_error;
			if (((soc_preamble_checker_source_valid & soc_preamble_checker_source_last) & soc_preamble_checker_source_ready)) begin
				vns_liteethmacpreamblechecker_next_state <= 1'd0;
			end
		end
		default: begin
			soc_preamble_checker_sink_ready <= 1'd1;
			if (((soc_preamble_checker_sink_valid & (~soc_preamble_checker_sink_last)) & (soc_preamble_checker_sink_payload_data == 8'd213))) begin
				vns_liteethmacpreamblechecker_next_state <= 1'd1;
			end
			if ((soc_preamble_checker_sink_valid & soc_preamble_checker_sink_last)) begin
				soc_preamble_checker_error <= 1'd1;
			end
		end
	endcase
end
assign soc_crc32_inserter_cnt_done = (soc_crc32_inserter_cnt == 1'd0);
assign soc_crc32_inserter_data1 = soc_crc32_inserter_data0;
assign soc_crc32_inserter_last = soc_crc32_inserter_reg;
assign soc_crc32_inserter_value = (~{soc_crc32_inserter_reg[0], soc_crc32_inserter_reg[1], soc_crc32_inserter_reg[2], soc_crc32_inserter_reg[3], soc_crc32_inserter_reg[4], soc_crc32_inserter_reg[5], soc_crc32_inserter_reg[6], soc_crc32_inserter_reg[7], soc_crc32_inserter_reg[8], soc_crc32_inserter_reg[9], soc_crc32_inserter_reg[10], soc_crc32_inserter_reg[11], soc_crc32_inserter_reg[12], soc_crc32_inserter_reg[13], soc_crc32_inserter_reg[14], soc_crc32_inserter_reg[15], soc_crc32_inserter_reg[16], soc_crc32_inserter_reg[17], soc_crc32_inserter_reg[18], soc_crc32_inserter_reg[19], soc_crc32_inserter_reg[20], soc_crc32_inserter_reg[21], soc_crc32_inserter_reg[22], soc_crc32_inserter_reg[23], soc_crc32_inserter_reg[24], soc_crc32_inserter_reg[25], soc_crc32_inserter_reg[26], soc_crc32_inserter_reg[27], soc_crc32_inserter_reg[28], soc_crc32_inserter_reg[29], soc_crc32_inserter_reg[30], soc_crc32_inserter_reg[31]});
assign soc_crc32_inserter_error = (soc_crc32_inserter_next != 32'd3338984827);
always @(*) begin
	soc_crc32_inserter_next <= 32'd0;
	soc_crc32_inserter_next[0] <= (((soc_crc32_inserter_last[24] ^ soc_crc32_inserter_last[30]) ^ soc_crc32_inserter_data1[1]) ^ soc_crc32_inserter_data1[7]);
	soc_crc32_inserter_next[1] <= (((((((soc_crc32_inserter_last[25] ^ soc_crc32_inserter_last[31]) ^ soc_crc32_inserter_data1[0]) ^ soc_crc32_inserter_data1[6]) ^ soc_crc32_inserter_last[24]) ^ soc_crc32_inserter_last[30]) ^ soc_crc32_inserter_data1[1]) ^ soc_crc32_inserter_data1[7]);
	soc_crc32_inserter_next[2] <= (((((((((soc_crc32_inserter_last[26] ^ soc_crc32_inserter_data1[5]) ^ soc_crc32_inserter_last[25]) ^ soc_crc32_inserter_last[31]) ^ soc_crc32_inserter_data1[0]) ^ soc_crc32_inserter_data1[6]) ^ soc_crc32_inserter_last[24]) ^ soc_crc32_inserter_last[30]) ^ soc_crc32_inserter_data1[1]) ^ soc_crc32_inserter_data1[7]);
	soc_crc32_inserter_next[3] <= (((((((soc_crc32_inserter_last[27] ^ soc_crc32_inserter_data1[4]) ^ soc_crc32_inserter_last[26]) ^ soc_crc32_inserter_data1[5]) ^ soc_crc32_inserter_last[25]) ^ soc_crc32_inserter_last[31]) ^ soc_crc32_inserter_data1[0]) ^ soc_crc32_inserter_data1[6]);
	soc_crc32_inserter_next[4] <= (((((((((soc_crc32_inserter_last[28] ^ soc_crc32_inserter_data1[3]) ^ soc_crc32_inserter_last[27]) ^ soc_crc32_inserter_data1[4]) ^ soc_crc32_inserter_last[26]) ^ soc_crc32_inserter_data1[5]) ^ soc_crc32_inserter_last[24]) ^ soc_crc32_inserter_last[30]) ^ soc_crc32_inserter_data1[1]) ^ soc_crc32_inserter_data1[7]);
	soc_crc32_inserter_next[5] <= (((((((((((((soc_crc32_inserter_last[29] ^ soc_crc32_inserter_data1[2]) ^ soc_crc32_inserter_last[28]) ^ soc_crc32_inserter_data1[3]) ^ soc_crc32_inserter_last[27]) ^ soc_crc32_inserter_data1[4]) ^ soc_crc32_inserter_last[25]) ^ soc_crc32_inserter_last[31]) ^ soc_crc32_inserter_data1[0]) ^ soc_crc32_inserter_data1[6]) ^ soc_crc32_inserter_last[24]) ^ soc_crc32_inserter_last[30]) ^ soc_crc32_inserter_data1[1]) ^ soc_crc32_inserter_data1[7]);
	soc_crc32_inserter_next[6] <= (((((((((((soc_crc32_inserter_last[30] ^ soc_crc32_inserter_data1[1]) ^ soc_crc32_inserter_last[29]) ^ soc_crc32_inserter_data1[2]) ^ soc_crc32_inserter_last[28]) ^ soc_crc32_inserter_data1[3]) ^ soc_crc32_inserter_last[26]) ^ soc_crc32_inserter_data1[5]) ^ soc_crc32_inserter_last[25]) ^ soc_crc32_inserter_last[31]) ^ soc_crc32_inserter_data1[0]) ^ soc_crc32_inserter_data1[6]);
	soc_crc32_inserter_next[7] <= (((((((((soc_crc32_inserter_last[31] ^ soc_crc32_inserter_data1[0]) ^ soc_crc32_inserter_last[29]) ^ soc_crc32_inserter_data1[2]) ^ soc_crc32_inserter_last[27]) ^ soc_crc32_inserter_data1[4]) ^ soc_crc32_inserter_last[26]) ^ soc_crc32_inserter_data1[5]) ^ soc_crc32_inserter_last[24]) ^ soc_crc32_inserter_data1[7]);
	soc_crc32_inserter_next[8] <= ((((((((soc_crc32_inserter_last[0] ^ soc_crc32_inserter_last[28]) ^ soc_crc32_inserter_data1[3]) ^ soc_crc32_inserter_last[27]) ^ soc_crc32_inserter_data1[4]) ^ soc_crc32_inserter_last[25]) ^ soc_crc32_inserter_data1[6]) ^ soc_crc32_inserter_last[24]) ^ soc_crc32_inserter_data1[7]);
	soc_crc32_inserter_next[9] <= ((((((((soc_crc32_inserter_last[1] ^ soc_crc32_inserter_last[29]) ^ soc_crc32_inserter_data1[2]) ^ soc_crc32_inserter_last[28]) ^ soc_crc32_inserter_data1[3]) ^ soc_crc32_inserter_last[26]) ^ soc_crc32_inserter_data1[5]) ^ soc_crc32_inserter_last[25]) ^ soc_crc32_inserter_data1[6]);
	soc_crc32_inserter_next[10] <= ((((((((soc_crc32_inserter_last[2] ^ soc_crc32_inserter_last[29]) ^ soc_crc32_inserter_data1[2]) ^ soc_crc32_inserter_last[27]) ^ soc_crc32_inserter_data1[4]) ^ soc_crc32_inserter_last[26]) ^ soc_crc32_inserter_data1[5]) ^ soc_crc32_inserter_last[24]) ^ soc_crc32_inserter_data1[7]);
	soc_crc32_inserter_next[11] <= ((((((((soc_crc32_inserter_last[3] ^ soc_crc32_inserter_last[28]) ^ soc_crc32_inserter_data1[3]) ^ soc_crc32_inserter_last[27]) ^ soc_crc32_inserter_data1[4]) ^ soc_crc32_inserter_last[25]) ^ soc_crc32_inserter_data1[6]) ^ soc_crc32_inserter_last[24]) ^ soc_crc32_inserter_data1[7]);
	soc_crc32_inserter_next[12] <= ((((((((((((soc_crc32_inserter_last[4] ^ soc_crc32_inserter_last[29]) ^ soc_crc32_inserter_data1[2]) ^ soc_crc32_inserter_last[28]) ^ soc_crc32_inserter_data1[3]) ^ soc_crc32_inserter_last[26]) ^ soc_crc32_inserter_data1[5]) ^ soc_crc32_inserter_last[25]) ^ soc_crc32_inserter_data1[6]) ^ soc_crc32_inserter_last[24]) ^ soc_crc32_inserter_last[30]) ^ soc_crc32_inserter_data1[1]) ^ soc_crc32_inserter_data1[7]);
	soc_crc32_inserter_next[13] <= ((((((((((((soc_crc32_inserter_last[5] ^ soc_crc32_inserter_last[30]) ^ soc_crc32_inserter_data1[1]) ^ soc_crc32_inserter_last[29]) ^ soc_crc32_inserter_data1[2]) ^ soc_crc32_inserter_last[27]) ^ soc_crc32_inserter_data1[4]) ^ soc_crc32_inserter_last[26]) ^ soc_crc32_inserter_data1[5]) ^ soc_crc32_inserter_last[25]) ^ soc_crc32_inserter_last[31]) ^ soc_crc32_inserter_data1[0]) ^ soc_crc32_inserter_data1[6]);
	soc_crc32_inserter_next[14] <= ((((((((((soc_crc32_inserter_last[6] ^ soc_crc32_inserter_last[31]) ^ soc_crc32_inserter_data1[0]) ^ soc_crc32_inserter_last[30]) ^ soc_crc32_inserter_data1[1]) ^ soc_crc32_inserter_last[28]) ^ soc_crc32_inserter_data1[3]) ^ soc_crc32_inserter_last[27]) ^ soc_crc32_inserter_data1[4]) ^ soc_crc32_inserter_last[26]) ^ soc_crc32_inserter_data1[5]);
	soc_crc32_inserter_next[15] <= ((((((((soc_crc32_inserter_last[7] ^ soc_crc32_inserter_last[31]) ^ soc_crc32_inserter_data1[0]) ^ soc_crc32_inserter_last[29]) ^ soc_crc32_inserter_data1[2]) ^ soc_crc32_inserter_last[28]) ^ soc_crc32_inserter_data1[3]) ^ soc_crc32_inserter_last[27]) ^ soc_crc32_inserter_data1[4]);
	soc_crc32_inserter_next[16] <= ((((((soc_crc32_inserter_last[8] ^ soc_crc32_inserter_last[29]) ^ soc_crc32_inserter_data1[2]) ^ soc_crc32_inserter_last[28]) ^ soc_crc32_inserter_data1[3]) ^ soc_crc32_inserter_last[24]) ^ soc_crc32_inserter_data1[7]);
	soc_crc32_inserter_next[17] <= ((((((soc_crc32_inserter_last[9] ^ soc_crc32_inserter_last[30]) ^ soc_crc32_inserter_data1[1]) ^ soc_crc32_inserter_last[29]) ^ soc_crc32_inserter_data1[2]) ^ soc_crc32_inserter_last[25]) ^ soc_crc32_inserter_data1[6]);
	soc_crc32_inserter_next[18] <= ((((((soc_crc32_inserter_last[10] ^ soc_crc32_inserter_last[31]) ^ soc_crc32_inserter_data1[0]) ^ soc_crc32_inserter_last[30]) ^ soc_crc32_inserter_data1[1]) ^ soc_crc32_inserter_last[26]) ^ soc_crc32_inserter_data1[5]);
	soc_crc32_inserter_next[19] <= ((((soc_crc32_inserter_last[11] ^ soc_crc32_inserter_last[31]) ^ soc_crc32_inserter_data1[0]) ^ soc_crc32_inserter_last[27]) ^ soc_crc32_inserter_data1[4]);
	soc_crc32_inserter_next[20] <= ((soc_crc32_inserter_last[12] ^ soc_crc32_inserter_last[28]) ^ soc_crc32_inserter_data1[3]);
	soc_crc32_inserter_next[21] <= ((soc_crc32_inserter_last[13] ^ soc_crc32_inserter_last[29]) ^ soc_crc32_inserter_data1[2]);
	soc_crc32_inserter_next[22] <= ((soc_crc32_inserter_last[14] ^ soc_crc32_inserter_last[24]) ^ soc_crc32_inserter_data1[7]);
	soc_crc32_inserter_next[23] <= ((((((soc_crc32_inserter_last[15] ^ soc_crc32_inserter_last[25]) ^ soc_crc32_inserter_data1[6]) ^ soc_crc32_inserter_last[24]) ^ soc_crc32_inserter_last[30]) ^ soc_crc32_inserter_data1[1]) ^ soc_crc32_inserter_data1[7]);
	soc_crc32_inserter_next[24] <= ((((((soc_crc32_inserter_last[16] ^ soc_crc32_inserter_last[26]) ^ soc_crc32_inserter_data1[5]) ^ soc_crc32_inserter_last[25]) ^ soc_crc32_inserter_last[31]) ^ soc_crc32_inserter_data1[0]) ^ soc_crc32_inserter_data1[6]);
	soc_crc32_inserter_next[25] <= ((((soc_crc32_inserter_last[17] ^ soc_crc32_inserter_last[27]) ^ soc_crc32_inserter_data1[4]) ^ soc_crc32_inserter_last[26]) ^ soc_crc32_inserter_data1[5]);
	soc_crc32_inserter_next[26] <= ((((((((soc_crc32_inserter_last[18] ^ soc_crc32_inserter_last[28]) ^ soc_crc32_inserter_data1[3]) ^ soc_crc32_inserter_last[27]) ^ soc_crc32_inserter_data1[4]) ^ soc_crc32_inserter_last[24]) ^ soc_crc32_inserter_last[30]) ^ soc_crc32_inserter_data1[1]) ^ soc_crc32_inserter_data1[7]);
	soc_crc32_inserter_next[27] <= ((((((((soc_crc32_inserter_last[19] ^ soc_crc32_inserter_last[29]) ^ soc_crc32_inserter_data1[2]) ^ soc_crc32_inserter_last[28]) ^ soc_crc32_inserter_data1[3]) ^ soc_crc32_inserter_last[25]) ^ soc_crc32_inserter_last[31]) ^ soc_crc32_inserter_data1[0]) ^ soc_crc32_inserter_data1[6]);
	soc_crc32_inserter_next[28] <= ((((((soc_crc32_inserter_last[20] ^ soc_crc32_inserter_last[30]) ^ soc_crc32_inserter_data1[1]) ^ soc_crc32_inserter_last[29]) ^ soc_crc32_inserter_data1[2]) ^ soc_crc32_inserter_last[26]) ^ soc_crc32_inserter_data1[5]);
	soc_crc32_inserter_next[29] <= ((((((soc_crc32_inserter_last[21] ^ soc_crc32_inserter_last[31]) ^ soc_crc32_inserter_data1[0]) ^ soc_crc32_inserter_last[30]) ^ soc_crc32_inserter_data1[1]) ^ soc_crc32_inserter_last[27]) ^ soc_crc32_inserter_data1[4]);
	soc_crc32_inserter_next[30] <= ((((soc_crc32_inserter_last[22] ^ soc_crc32_inserter_last[31]) ^ soc_crc32_inserter_data1[0]) ^ soc_crc32_inserter_last[28]) ^ soc_crc32_inserter_data1[3]);
	soc_crc32_inserter_next[31] <= ((soc_crc32_inserter_last[23] ^ soc_crc32_inserter_last[29]) ^ soc_crc32_inserter_data1[2]);
end
always @(*) begin
	soc_crc32_inserter_source_first <= 1'd0;
	soc_crc32_inserter_source_last <= 1'd0;
	soc_crc32_inserter_source_payload_data <= 8'd0;
	soc_crc32_inserter_source_payload_last_be <= 1'd0;
	soc_crc32_inserter_source_payload_error <= 1'd0;
	soc_crc32_inserter_data0 <= 8'd0;
	vns_liteethmaccrc32inserter_next_state <= 2'd0;
	soc_crc32_inserter_is_ongoing0 <= 1'd0;
	soc_crc32_inserter_sink_ready <= 1'd0;
	soc_crc32_inserter_is_ongoing1 <= 1'd0;
	soc_crc32_inserter_ce <= 1'd0;
	soc_crc32_inserter_reset <= 1'd0;
	soc_crc32_inserter_source_valid <= 1'd0;
	vns_liteethmaccrc32inserter_next_state <= vns_liteethmaccrc32inserter_state;
	case (vns_liteethmaccrc32inserter_state)
		1'd1: begin
			soc_crc32_inserter_ce <= (soc_crc32_inserter_sink_valid & soc_crc32_inserter_source_ready);
			soc_crc32_inserter_data0 <= soc_crc32_inserter_sink_payload_data;
			soc_crc32_inserter_source_valid <= soc_crc32_inserter_sink_valid;
			soc_crc32_inserter_sink_ready <= soc_crc32_inserter_source_ready;
			soc_crc32_inserter_source_first <= soc_crc32_inserter_sink_first;
			soc_crc32_inserter_source_last <= soc_crc32_inserter_sink_last;
			soc_crc32_inserter_source_payload_data <= soc_crc32_inserter_sink_payload_data;
			soc_crc32_inserter_source_payload_last_be <= soc_crc32_inserter_sink_payload_last_be;
			soc_crc32_inserter_source_payload_error <= soc_crc32_inserter_sink_payload_error;
			soc_crc32_inserter_source_last <= 1'd0;
			if (((soc_crc32_inserter_sink_valid & soc_crc32_inserter_sink_last) & soc_crc32_inserter_source_ready)) begin
				vns_liteethmaccrc32inserter_next_state <= 2'd2;
			end
		end
		2'd2: begin
			soc_crc32_inserter_source_valid <= 1'd1;
			case (soc_crc32_inserter_cnt)
				1'd0: begin
					soc_crc32_inserter_source_payload_data <= soc_crc32_inserter_value[31:24];
				end
				1'd1: begin
					soc_crc32_inserter_source_payload_data <= soc_crc32_inserter_value[23:16];
				end
				2'd2: begin
					soc_crc32_inserter_source_payload_data <= soc_crc32_inserter_value[15:8];
				end
				default: begin
					soc_crc32_inserter_source_payload_data <= soc_crc32_inserter_value[7:0];
				end
			endcase
			if (soc_crc32_inserter_cnt_done) begin
				soc_crc32_inserter_source_last <= 1'd1;
				if (soc_crc32_inserter_source_ready) begin
					vns_liteethmaccrc32inserter_next_state <= 1'd0;
				end
			end
			soc_crc32_inserter_is_ongoing1 <= 1'd1;
		end
		default: begin
			soc_crc32_inserter_reset <= 1'd1;
			soc_crc32_inserter_sink_ready <= 1'd1;
			if (soc_crc32_inserter_sink_valid) begin
				soc_crc32_inserter_sink_ready <= 1'd0;
				vns_liteethmaccrc32inserter_next_state <= 1'd1;
			end
			soc_crc32_inserter_is_ongoing0 <= 1'd1;
		end
	endcase
end
assign soc_crc32_checker_fifo_full = (soc_crc32_checker_syncfifo_level == 3'd4);
assign soc_crc32_checker_fifo_in = (soc_crc32_checker_sink_sink_valid & ((~soc_crc32_checker_fifo_full) | soc_crc32_checker_fifo_out));
assign soc_crc32_checker_fifo_out = (soc_crc32_checker_source_source_valid & soc_crc32_checker_source_source_ready);
assign soc_crc32_checker_syncfifo_sink_first = soc_crc32_checker_sink_sink_first;
assign soc_crc32_checker_syncfifo_sink_last = soc_crc32_checker_sink_sink_last;
assign soc_crc32_checker_syncfifo_sink_payload_data = soc_crc32_checker_sink_sink_payload_data;
assign soc_crc32_checker_syncfifo_sink_payload_last_be = soc_crc32_checker_sink_sink_payload_last_be;
assign soc_crc32_checker_syncfifo_sink_payload_error = soc_crc32_checker_sink_sink_payload_error;
always @(*) begin
	soc_crc32_checker_syncfifo_sink_valid <= 1'd0;
	soc_crc32_checker_syncfifo_sink_valid <= soc_crc32_checker_sink_sink_valid;
	soc_crc32_checker_syncfifo_sink_valid <= soc_crc32_checker_fifo_in;
end
always @(*) begin
	soc_crc32_checker_sink_sink_ready <= 1'd0;
	soc_crc32_checker_sink_sink_ready <= soc_crc32_checker_syncfifo_sink_ready;
	soc_crc32_checker_sink_sink_ready <= soc_crc32_checker_fifo_in;
end
assign soc_crc32_checker_source_source_valid = (soc_crc32_checker_sink_sink_valid & soc_crc32_checker_fifo_full);
assign soc_crc32_checker_source_source_last = soc_crc32_checker_sink_sink_last;
assign soc_crc32_checker_syncfifo_source_ready = soc_crc32_checker_fifo_out;
assign soc_crc32_checker_source_source_payload_data = soc_crc32_checker_syncfifo_source_payload_data;
assign soc_crc32_checker_source_source_payload_last_be = soc_crc32_checker_syncfifo_source_payload_last_be;
always @(*) begin
	soc_crc32_checker_source_source_payload_error <= 1'd0;
	soc_crc32_checker_source_source_payload_error <= soc_crc32_checker_syncfifo_source_payload_error;
	soc_crc32_checker_source_source_payload_error <= (soc_crc32_checker_sink_sink_payload_error | soc_crc32_checker_crc_error);
end
assign soc_crc32_checker_error = ((soc_crc32_checker_source_source_valid & soc_crc32_checker_source_source_last) & soc_crc32_checker_crc_error);
assign soc_crc32_checker_crc_data0 = soc_crc32_checker_sink_sink_payload_data;
assign soc_crc32_checker_crc_data1 = soc_crc32_checker_crc_data0;
assign soc_crc32_checker_crc_last = soc_crc32_checker_crc_reg;
assign soc_crc32_checker_crc_value = (~{soc_crc32_checker_crc_reg[0], soc_crc32_checker_crc_reg[1], soc_crc32_checker_crc_reg[2], soc_crc32_checker_crc_reg[3], soc_crc32_checker_crc_reg[4], soc_crc32_checker_crc_reg[5], soc_crc32_checker_crc_reg[6], soc_crc32_checker_crc_reg[7], soc_crc32_checker_crc_reg[8], soc_crc32_checker_crc_reg[9], soc_crc32_checker_crc_reg[10], soc_crc32_checker_crc_reg[11], soc_crc32_checker_crc_reg[12], soc_crc32_checker_crc_reg[13], soc_crc32_checker_crc_reg[14], soc_crc32_checker_crc_reg[15], soc_crc32_checker_crc_reg[16], soc_crc32_checker_crc_reg[17], soc_crc32_checker_crc_reg[18], soc_crc32_checker_crc_reg[19], soc_crc32_checker_crc_reg[20], soc_crc32_checker_crc_reg[21], soc_crc32_checker_crc_reg[22], soc_crc32_checker_crc_reg[23], soc_crc32_checker_crc_reg[24], soc_crc32_checker_crc_reg[25], soc_crc32_checker_crc_reg[26], soc_crc32_checker_crc_reg[27], soc_crc32_checker_crc_reg[28], soc_crc32_checker_crc_reg[29], soc_crc32_checker_crc_reg[30], soc_crc32_checker_crc_reg[31]});
assign soc_crc32_checker_crc_error = (soc_crc32_checker_crc_next != 32'd3338984827);
always @(*) begin
	soc_crc32_checker_crc_next <= 32'd0;
	soc_crc32_checker_crc_next[0] <= (((soc_crc32_checker_crc_last[24] ^ soc_crc32_checker_crc_last[30]) ^ soc_crc32_checker_crc_data1[1]) ^ soc_crc32_checker_crc_data1[7]);
	soc_crc32_checker_crc_next[1] <= (((((((soc_crc32_checker_crc_last[25] ^ soc_crc32_checker_crc_last[31]) ^ soc_crc32_checker_crc_data1[0]) ^ soc_crc32_checker_crc_data1[6]) ^ soc_crc32_checker_crc_last[24]) ^ soc_crc32_checker_crc_last[30]) ^ soc_crc32_checker_crc_data1[1]) ^ soc_crc32_checker_crc_data1[7]);
	soc_crc32_checker_crc_next[2] <= (((((((((soc_crc32_checker_crc_last[26] ^ soc_crc32_checker_crc_data1[5]) ^ soc_crc32_checker_crc_last[25]) ^ soc_crc32_checker_crc_last[31]) ^ soc_crc32_checker_crc_data1[0]) ^ soc_crc32_checker_crc_data1[6]) ^ soc_crc32_checker_crc_last[24]) ^ soc_crc32_checker_crc_last[30]) ^ soc_crc32_checker_crc_data1[1]) ^ soc_crc32_checker_crc_data1[7]);
	soc_crc32_checker_crc_next[3] <= (((((((soc_crc32_checker_crc_last[27] ^ soc_crc32_checker_crc_data1[4]) ^ soc_crc32_checker_crc_last[26]) ^ soc_crc32_checker_crc_data1[5]) ^ soc_crc32_checker_crc_last[25]) ^ soc_crc32_checker_crc_last[31]) ^ soc_crc32_checker_crc_data1[0]) ^ soc_crc32_checker_crc_data1[6]);
	soc_crc32_checker_crc_next[4] <= (((((((((soc_crc32_checker_crc_last[28] ^ soc_crc32_checker_crc_data1[3]) ^ soc_crc32_checker_crc_last[27]) ^ soc_crc32_checker_crc_data1[4]) ^ soc_crc32_checker_crc_last[26]) ^ soc_crc32_checker_crc_data1[5]) ^ soc_crc32_checker_crc_last[24]) ^ soc_crc32_checker_crc_last[30]) ^ soc_crc32_checker_crc_data1[1]) ^ soc_crc32_checker_crc_data1[7]);
	soc_crc32_checker_crc_next[5] <= (((((((((((((soc_crc32_checker_crc_last[29] ^ soc_crc32_checker_crc_data1[2]) ^ soc_crc32_checker_crc_last[28]) ^ soc_crc32_checker_crc_data1[3]) ^ soc_crc32_checker_crc_last[27]) ^ soc_crc32_checker_crc_data1[4]) ^ soc_crc32_checker_crc_last[25]) ^ soc_crc32_checker_crc_last[31]) ^ soc_crc32_checker_crc_data1[0]) ^ soc_crc32_checker_crc_data1[6]) ^ soc_crc32_checker_crc_last[24]) ^ soc_crc32_checker_crc_last[30]) ^ soc_crc32_checker_crc_data1[1]) ^ soc_crc32_checker_crc_data1[7]);
	soc_crc32_checker_crc_next[6] <= (((((((((((soc_crc32_checker_crc_last[30] ^ soc_crc32_checker_crc_data1[1]) ^ soc_crc32_checker_crc_last[29]) ^ soc_crc32_checker_crc_data1[2]) ^ soc_crc32_checker_crc_last[28]) ^ soc_crc32_checker_crc_data1[3]) ^ soc_crc32_checker_crc_last[26]) ^ soc_crc32_checker_crc_data1[5]) ^ soc_crc32_checker_crc_last[25]) ^ soc_crc32_checker_crc_last[31]) ^ soc_crc32_checker_crc_data1[0]) ^ soc_crc32_checker_crc_data1[6]);
	soc_crc32_checker_crc_next[7] <= (((((((((soc_crc32_checker_crc_last[31] ^ soc_crc32_checker_crc_data1[0]) ^ soc_crc32_checker_crc_last[29]) ^ soc_crc32_checker_crc_data1[2]) ^ soc_crc32_checker_crc_last[27]) ^ soc_crc32_checker_crc_data1[4]) ^ soc_crc32_checker_crc_last[26]) ^ soc_crc32_checker_crc_data1[5]) ^ soc_crc32_checker_crc_last[24]) ^ soc_crc32_checker_crc_data1[7]);
	soc_crc32_checker_crc_next[8] <= ((((((((soc_crc32_checker_crc_last[0] ^ soc_crc32_checker_crc_last[28]) ^ soc_crc32_checker_crc_data1[3]) ^ soc_crc32_checker_crc_last[27]) ^ soc_crc32_checker_crc_data1[4]) ^ soc_crc32_checker_crc_last[25]) ^ soc_crc32_checker_crc_data1[6]) ^ soc_crc32_checker_crc_last[24]) ^ soc_crc32_checker_crc_data1[7]);
	soc_crc32_checker_crc_next[9] <= ((((((((soc_crc32_checker_crc_last[1] ^ soc_crc32_checker_crc_last[29]) ^ soc_crc32_checker_crc_data1[2]) ^ soc_crc32_checker_crc_last[28]) ^ soc_crc32_checker_crc_data1[3]) ^ soc_crc32_checker_crc_last[26]) ^ soc_crc32_checker_crc_data1[5]) ^ soc_crc32_checker_crc_last[25]) ^ soc_crc32_checker_crc_data1[6]);
	soc_crc32_checker_crc_next[10] <= ((((((((soc_crc32_checker_crc_last[2] ^ soc_crc32_checker_crc_last[29]) ^ soc_crc32_checker_crc_data1[2]) ^ soc_crc32_checker_crc_last[27]) ^ soc_crc32_checker_crc_data1[4]) ^ soc_crc32_checker_crc_last[26]) ^ soc_crc32_checker_crc_data1[5]) ^ soc_crc32_checker_crc_last[24]) ^ soc_crc32_checker_crc_data1[7]);
	soc_crc32_checker_crc_next[11] <= ((((((((soc_crc32_checker_crc_last[3] ^ soc_crc32_checker_crc_last[28]) ^ soc_crc32_checker_crc_data1[3]) ^ soc_crc32_checker_crc_last[27]) ^ soc_crc32_checker_crc_data1[4]) ^ soc_crc32_checker_crc_last[25]) ^ soc_crc32_checker_crc_data1[6]) ^ soc_crc32_checker_crc_last[24]) ^ soc_crc32_checker_crc_data1[7]);
	soc_crc32_checker_crc_next[12] <= ((((((((((((soc_crc32_checker_crc_last[4] ^ soc_crc32_checker_crc_last[29]) ^ soc_crc32_checker_crc_data1[2]) ^ soc_crc32_checker_crc_last[28]) ^ soc_crc32_checker_crc_data1[3]) ^ soc_crc32_checker_crc_last[26]) ^ soc_crc32_checker_crc_data1[5]) ^ soc_crc32_checker_crc_last[25]) ^ soc_crc32_checker_crc_data1[6]) ^ soc_crc32_checker_crc_last[24]) ^ soc_crc32_checker_crc_last[30]) ^ soc_crc32_checker_crc_data1[1]) ^ soc_crc32_checker_crc_data1[7]);
	soc_crc32_checker_crc_next[13] <= ((((((((((((soc_crc32_checker_crc_last[5] ^ soc_crc32_checker_crc_last[30]) ^ soc_crc32_checker_crc_data1[1]) ^ soc_crc32_checker_crc_last[29]) ^ soc_crc32_checker_crc_data1[2]) ^ soc_crc32_checker_crc_last[27]) ^ soc_crc32_checker_crc_data1[4]) ^ soc_crc32_checker_crc_last[26]) ^ soc_crc32_checker_crc_data1[5]) ^ soc_crc32_checker_crc_last[25]) ^ soc_crc32_checker_crc_last[31]) ^ soc_crc32_checker_crc_data1[0]) ^ soc_crc32_checker_crc_data1[6]);
	soc_crc32_checker_crc_next[14] <= ((((((((((soc_crc32_checker_crc_last[6] ^ soc_crc32_checker_crc_last[31]) ^ soc_crc32_checker_crc_data1[0]) ^ soc_crc32_checker_crc_last[30]) ^ soc_crc32_checker_crc_data1[1]) ^ soc_crc32_checker_crc_last[28]) ^ soc_crc32_checker_crc_data1[3]) ^ soc_crc32_checker_crc_last[27]) ^ soc_crc32_checker_crc_data1[4]) ^ soc_crc32_checker_crc_last[26]) ^ soc_crc32_checker_crc_data1[5]);
	soc_crc32_checker_crc_next[15] <= ((((((((soc_crc32_checker_crc_last[7] ^ soc_crc32_checker_crc_last[31]) ^ soc_crc32_checker_crc_data1[0]) ^ soc_crc32_checker_crc_last[29]) ^ soc_crc32_checker_crc_data1[2]) ^ soc_crc32_checker_crc_last[28]) ^ soc_crc32_checker_crc_data1[3]) ^ soc_crc32_checker_crc_last[27]) ^ soc_crc32_checker_crc_data1[4]);
	soc_crc32_checker_crc_next[16] <= ((((((soc_crc32_checker_crc_last[8] ^ soc_crc32_checker_crc_last[29]) ^ soc_crc32_checker_crc_data1[2]) ^ soc_crc32_checker_crc_last[28]) ^ soc_crc32_checker_crc_data1[3]) ^ soc_crc32_checker_crc_last[24]) ^ soc_crc32_checker_crc_data1[7]);
	soc_crc32_checker_crc_next[17] <= ((((((soc_crc32_checker_crc_last[9] ^ soc_crc32_checker_crc_last[30]) ^ soc_crc32_checker_crc_data1[1]) ^ soc_crc32_checker_crc_last[29]) ^ soc_crc32_checker_crc_data1[2]) ^ soc_crc32_checker_crc_last[25]) ^ soc_crc32_checker_crc_data1[6]);
	soc_crc32_checker_crc_next[18] <= ((((((soc_crc32_checker_crc_last[10] ^ soc_crc32_checker_crc_last[31]) ^ soc_crc32_checker_crc_data1[0]) ^ soc_crc32_checker_crc_last[30]) ^ soc_crc32_checker_crc_data1[1]) ^ soc_crc32_checker_crc_last[26]) ^ soc_crc32_checker_crc_data1[5]);
	soc_crc32_checker_crc_next[19] <= ((((soc_crc32_checker_crc_last[11] ^ soc_crc32_checker_crc_last[31]) ^ soc_crc32_checker_crc_data1[0]) ^ soc_crc32_checker_crc_last[27]) ^ soc_crc32_checker_crc_data1[4]);
	soc_crc32_checker_crc_next[20] <= ((soc_crc32_checker_crc_last[12] ^ soc_crc32_checker_crc_last[28]) ^ soc_crc32_checker_crc_data1[3]);
	soc_crc32_checker_crc_next[21] <= ((soc_crc32_checker_crc_last[13] ^ soc_crc32_checker_crc_last[29]) ^ soc_crc32_checker_crc_data1[2]);
	soc_crc32_checker_crc_next[22] <= ((soc_crc32_checker_crc_last[14] ^ soc_crc32_checker_crc_last[24]) ^ soc_crc32_checker_crc_data1[7]);
	soc_crc32_checker_crc_next[23] <= ((((((soc_crc32_checker_crc_last[15] ^ soc_crc32_checker_crc_last[25]) ^ soc_crc32_checker_crc_data1[6]) ^ soc_crc32_checker_crc_last[24]) ^ soc_crc32_checker_crc_last[30]) ^ soc_crc32_checker_crc_data1[1]) ^ soc_crc32_checker_crc_data1[7]);
	soc_crc32_checker_crc_next[24] <= ((((((soc_crc32_checker_crc_last[16] ^ soc_crc32_checker_crc_last[26]) ^ soc_crc32_checker_crc_data1[5]) ^ soc_crc32_checker_crc_last[25]) ^ soc_crc32_checker_crc_last[31]) ^ soc_crc32_checker_crc_data1[0]) ^ soc_crc32_checker_crc_data1[6]);
	soc_crc32_checker_crc_next[25] <= ((((soc_crc32_checker_crc_last[17] ^ soc_crc32_checker_crc_last[27]) ^ soc_crc32_checker_crc_data1[4]) ^ soc_crc32_checker_crc_last[26]) ^ soc_crc32_checker_crc_data1[5]);
	soc_crc32_checker_crc_next[26] <= ((((((((soc_crc32_checker_crc_last[18] ^ soc_crc32_checker_crc_last[28]) ^ soc_crc32_checker_crc_data1[3]) ^ soc_crc32_checker_crc_last[27]) ^ soc_crc32_checker_crc_data1[4]) ^ soc_crc32_checker_crc_last[24]) ^ soc_crc32_checker_crc_last[30]) ^ soc_crc32_checker_crc_data1[1]) ^ soc_crc32_checker_crc_data1[7]);
	soc_crc32_checker_crc_next[27] <= ((((((((soc_crc32_checker_crc_last[19] ^ soc_crc32_checker_crc_last[29]) ^ soc_crc32_checker_crc_data1[2]) ^ soc_crc32_checker_crc_last[28]) ^ soc_crc32_checker_crc_data1[3]) ^ soc_crc32_checker_crc_last[25]) ^ soc_crc32_checker_crc_last[31]) ^ soc_crc32_checker_crc_data1[0]) ^ soc_crc32_checker_crc_data1[6]);
	soc_crc32_checker_crc_next[28] <= ((((((soc_crc32_checker_crc_last[20] ^ soc_crc32_checker_crc_last[30]) ^ soc_crc32_checker_crc_data1[1]) ^ soc_crc32_checker_crc_last[29]) ^ soc_crc32_checker_crc_data1[2]) ^ soc_crc32_checker_crc_last[26]) ^ soc_crc32_checker_crc_data1[5]);
	soc_crc32_checker_crc_next[29] <= ((((((soc_crc32_checker_crc_last[21] ^ soc_crc32_checker_crc_last[31]) ^ soc_crc32_checker_crc_data1[0]) ^ soc_crc32_checker_crc_last[30]) ^ soc_crc32_checker_crc_data1[1]) ^ soc_crc32_checker_crc_last[27]) ^ soc_crc32_checker_crc_data1[4]);
	soc_crc32_checker_crc_next[30] <= ((((soc_crc32_checker_crc_last[22] ^ soc_crc32_checker_crc_last[31]) ^ soc_crc32_checker_crc_data1[0]) ^ soc_crc32_checker_crc_last[28]) ^ soc_crc32_checker_crc_data1[3]);
	soc_crc32_checker_crc_next[31] <= ((soc_crc32_checker_crc_last[23] ^ soc_crc32_checker_crc_last[29]) ^ soc_crc32_checker_crc_data1[2]);
end
assign soc_crc32_checker_syncfifo_syncfifo_din = {soc_crc32_checker_syncfifo_fifo_in_last, soc_crc32_checker_syncfifo_fifo_in_first, soc_crc32_checker_syncfifo_fifo_in_payload_error, soc_crc32_checker_syncfifo_fifo_in_payload_last_be, soc_crc32_checker_syncfifo_fifo_in_payload_data};
assign {soc_crc32_checker_syncfifo_fifo_out_last, soc_crc32_checker_syncfifo_fifo_out_first, soc_crc32_checker_syncfifo_fifo_out_payload_error, soc_crc32_checker_syncfifo_fifo_out_payload_last_be, soc_crc32_checker_syncfifo_fifo_out_payload_data} = soc_crc32_checker_syncfifo_syncfifo_dout;
assign soc_crc32_checker_syncfifo_sink_ready = soc_crc32_checker_syncfifo_syncfifo_writable;
assign soc_crc32_checker_syncfifo_syncfifo_we = soc_crc32_checker_syncfifo_sink_valid;
assign soc_crc32_checker_syncfifo_fifo_in_first = soc_crc32_checker_syncfifo_sink_first;
assign soc_crc32_checker_syncfifo_fifo_in_last = soc_crc32_checker_syncfifo_sink_last;
assign soc_crc32_checker_syncfifo_fifo_in_payload_data = soc_crc32_checker_syncfifo_sink_payload_data;
assign soc_crc32_checker_syncfifo_fifo_in_payload_last_be = soc_crc32_checker_syncfifo_sink_payload_last_be;
assign soc_crc32_checker_syncfifo_fifo_in_payload_error = soc_crc32_checker_syncfifo_sink_payload_error;
assign soc_crc32_checker_syncfifo_source_valid = soc_crc32_checker_syncfifo_syncfifo_readable;
assign soc_crc32_checker_syncfifo_source_first = soc_crc32_checker_syncfifo_fifo_out_first;
assign soc_crc32_checker_syncfifo_source_last = soc_crc32_checker_syncfifo_fifo_out_last;
assign soc_crc32_checker_syncfifo_source_payload_data = soc_crc32_checker_syncfifo_fifo_out_payload_data;
assign soc_crc32_checker_syncfifo_source_payload_last_be = soc_crc32_checker_syncfifo_fifo_out_payload_last_be;
assign soc_crc32_checker_syncfifo_source_payload_error = soc_crc32_checker_syncfifo_fifo_out_payload_error;
assign soc_crc32_checker_syncfifo_syncfifo_re = soc_crc32_checker_syncfifo_source_ready;
always @(*) begin
	soc_crc32_checker_syncfifo_wrport_adr <= 3'd0;
	if (soc_crc32_checker_syncfifo_replace) begin
		soc_crc32_checker_syncfifo_wrport_adr <= (soc_crc32_checker_syncfifo_produce - 1'd1);
	end else begin
		soc_crc32_checker_syncfifo_wrport_adr <= soc_crc32_checker_syncfifo_produce;
	end
end
assign soc_crc32_checker_syncfifo_wrport_dat_w = soc_crc32_checker_syncfifo_syncfifo_din;
assign soc_crc32_checker_syncfifo_wrport_we = (soc_crc32_checker_syncfifo_syncfifo_we & (soc_crc32_checker_syncfifo_syncfifo_writable | soc_crc32_checker_syncfifo_replace));
assign soc_crc32_checker_syncfifo_do_read = (soc_crc32_checker_syncfifo_syncfifo_readable & soc_crc32_checker_syncfifo_syncfifo_re);
assign soc_crc32_checker_syncfifo_rdport_adr = soc_crc32_checker_syncfifo_consume;
assign soc_crc32_checker_syncfifo_syncfifo_dout = soc_crc32_checker_syncfifo_rdport_dat_r;
assign soc_crc32_checker_syncfifo_syncfifo_writable = (soc_crc32_checker_syncfifo_level != 3'd5);
assign soc_crc32_checker_syncfifo_syncfifo_readable = (soc_crc32_checker_syncfifo_level != 1'd0);
always @(*) begin
	soc_crc32_checker_crc_ce <= 1'd0;
	vns_liteethmaccrc32checker_next_state <= 2'd0;
	soc_crc32_checker_crc_reset <= 1'd0;
	soc_crc32_checker_fifo_reset <= 1'd0;
	vns_liteethmaccrc32checker_next_state <= vns_liteethmaccrc32checker_state;
	case (vns_liteethmaccrc32checker_state)
		1'd1: begin
			if ((soc_crc32_checker_sink_sink_valid & soc_crc32_checker_sink_sink_ready)) begin
				soc_crc32_checker_crc_ce <= 1'd1;
				vns_liteethmaccrc32checker_next_state <= 2'd2;
			end
		end
		2'd2: begin
			if ((soc_crc32_checker_sink_sink_valid & soc_crc32_checker_sink_sink_ready)) begin
				soc_crc32_checker_crc_ce <= 1'd1;
				if (soc_crc32_checker_sink_sink_last) begin
					vns_liteethmaccrc32checker_next_state <= 1'd0;
				end
			end
		end
		default: begin
			soc_crc32_checker_crc_reset <= 1'd1;
			soc_crc32_checker_fifo_reset <= 1'd1;
			vns_liteethmaccrc32checker_next_state <= 1'd1;
		end
	endcase
end
assign soc_ps_preamble_error_o = (soc_ps_preamble_error_toggle_o ^ soc_ps_preamble_error_toggle_o_r);
assign soc_ps_crc_error_o = (soc_ps_crc_error_toggle_o ^ soc_ps_crc_error_toggle_o_r);
assign soc_padding_inserter_counter_done = (soc_padding_inserter_counter >= 6'd59);
always @(*) begin
	soc_padding_inserter_source_valid <= 1'd0;
	soc_padding_inserter_source_first <= 1'd0;
	soc_padding_inserter_source_last <= 1'd0;
	soc_padding_inserter_source_payload_data <= 8'd0;
	soc_padding_inserter_source_payload_last_be <= 1'd0;
	soc_padding_inserter_source_payload_error <= 1'd0;
	vns_liteethmacpaddinginserter_next_state <= 1'd0;
	soc_padding_inserter_counter_reset <= 1'd0;
	soc_padding_inserter_sink_ready <= 1'd0;
	soc_padding_inserter_counter_ce <= 1'd0;
	vns_liteethmacpaddinginserter_next_state <= vns_liteethmacpaddinginserter_state;
	case (vns_liteethmacpaddinginserter_state)
		1'd1: begin
			soc_padding_inserter_source_valid <= 1'd1;
			soc_padding_inserter_source_last <= soc_padding_inserter_counter_done;
			soc_padding_inserter_source_payload_data <= 1'd0;
			if ((soc_padding_inserter_source_valid & soc_padding_inserter_source_ready)) begin
				soc_padding_inserter_counter_ce <= 1'd1;
				if (soc_padding_inserter_counter_done) begin
					soc_padding_inserter_counter_reset <= 1'd1;
					vns_liteethmacpaddinginserter_next_state <= 1'd0;
				end
			end
		end
		default: begin
			soc_padding_inserter_source_valid <= soc_padding_inserter_sink_valid;
			soc_padding_inserter_sink_ready <= soc_padding_inserter_source_ready;
			soc_padding_inserter_source_first <= soc_padding_inserter_sink_first;
			soc_padding_inserter_source_last <= soc_padding_inserter_sink_last;
			soc_padding_inserter_source_payload_data <= soc_padding_inserter_sink_payload_data;
			soc_padding_inserter_source_payload_last_be <= soc_padding_inserter_sink_payload_last_be;
			soc_padding_inserter_source_payload_error <= soc_padding_inserter_sink_payload_error;
			if ((soc_padding_inserter_source_valid & soc_padding_inserter_source_ready)) begin
				soc_padding_inserter_counter_ce <= 1'd1;
				if (soc_padding_inserter_sink_last) begin
					if ((~soc_padding_inserter_counter_done)) begin
						soc_padding_inserter_source_last <= 1'd0;
						vns_liteethmacpaddinginserter_next_state <= 1'd1;
					end else begin
						soc_padding_inserter_counter_reset <= 1'd1;
					end
				end
			end
		end
	endcase
end
assign soc_padding_checker_source_valid = soc_padding_checker_sink_valid;
assign soc_padding_checker_sink_ready = soc_padding_checker_source_ready;
assign soc_padding_checker_source_first = soc_padding_checker_sink_first;
assign soc_padding_checker_source_last = soc_padding_checker_sink_last;
assign soc_padding_checker_source_payload_data = soc_padding_checker_sink_payload_data;
assign soc_padding_checker_source_payload_last_be = soc_padding_checker_sink_payload_last_be;
assign soc_padding_checker_source_payload_error = soc_padding_checker_sink_payload_error;
assign soc_tx_last_be_source_valid = (soc_tx_last_be_sink_valid & soc_tx_last_be_ongoing);
assign soc_tx_last_be_source_last = soc_tx_last_be_sink_payload_last_be;
assign soc_tx_last_be_source_payload_data = soc_tx_last_be_sink_payload_data;
assign soc_tx_last_be_sink_ready = soc_tx_last_be_source_ready;
assign soc_rx_last_be_source_valid = soc_rx_last_be_sink_valid;
assign soc_rx_last_be_sink_ready = soc_rx_last_be_source_ready;
assign soc_rx_last_be_source_first = soc_rx_last_be_sink_first;
assign soc_rx_last_be_source_last = soc_rx_last_be_sink_last;
assign soc_rx_last_be_source_payload_data = soc_rx_last_be_sink_payload_data;
assign soc_rx_last_be_source_payload_error = soc_rx_last_be_sink_payload_error;
always @(*) begin
	soc_rx_last_be_source_payload_last_be <= 1'd0;
	soc_rx_last_be_source_payload_last_be <= soc_rx_last_be_sink_payload_last_be;
	soc_rx_last_be_source_payload_last_be <= soc_rx_last_be_sink_last;
end
assign soc_tx_converter_converter_sink_valid = soc_tx_converter_sink_valid;
assign soc_tx_converter_converter_sink_first = soc_tx_converter_sink_first;
assign soc_tx_converter_converter_sink_last = soc_tx_converter_sink_last;
assign soc_tx_converter_sink_ready = soc_tx_converter_converter_sink_ready;
always @(*) begin
	soc_tx_converter_converter_sink_payload_data <= 40'd0;
	soc_tx_converter_converter_sink_payload_data[7:0] <= soc_tx_converter_sink_payload_data[7:0];
	soc_tx_converter_converter_sink_payload_data[8] <= soc_tx_converter_sink_payload_last_be[0];
	soc_tx_converter_converter_sink_payload_data[9] <= soc_tx_converter_sink_payload_error[0];
	soc_tx_converter_converter_sink_payload_data[17:10] <= soc_tx_converter_sink_payload_data[15:8];
	soc_tx_converter_converter_sink_payload_data[18] <= soc_tx_converter_sink_payload_last_be[1];
	soc_tx_converter_converter_sink_payload_data[19] <= soc_tx_converter_sink_payload_error[1];
	soc_tx_converter_converter_sink_payload_data[27:20] <= soc_tx_converter_sink_payload_data[23:16];
	soc_tx_converter_converter_sink_payload_data[28] <= soc_tx_converter_sink_payload_last_be[2];
	soc_tx_converter_converter_sink_payload_data[29] <= soc_tx_converter_sink_payload_error[2];
	soc_tx_converter_converter_sink_payload_data[37:30] <= soc_tx_converter_sink_payload_data[31:24];
	soc_tx_converter_converter_sink_payload_data[38] <= soc_tx_converter_sink_payload_last_be[3];
	soc_tx_converter_converter_sink_payload_data[39] <= soc_tx_converter_sink_payload_error[3];
end
assign soc_tx_converter_source_valid = soc_tx_converter_source_source_valid;
assign soc_tx_converter_source_first = soc_tx_converter_source_source_first;
assign soc_tx_converter_source_last = soc_tx_converter_source_source_last;
assign soc_tx_converter_source_source_ready = soc_tx_converter_source_ready;
assign {soc_tx_converter_source_payload_error, soc_tx_converter_source_payload_last_be, soc_tx_converter_source_payload_data} = soc_tx_converter_source_source_payload_data;
assign soc_tx_converter_source_source_valid = soc_tx_converter_converter_source_valid;
assign soc_tx_converter_converter_source_ready = soc_tx_converter_source_source_ready;
assign soc_tx_converter_source_source_first = soc_tx_converter_converter_source_first;
assign soc_tx_converter_source_source_last = soc_tx_converter_converter_source_last;
assign soc_tx_converter_source_source_payload_data = soc_tx_converter_converter_source_payload_data;
assign soc_tx_converter_converter_first = (soc_tx_converter_converter_mux == 1'd0);
assign soc_tx_converter_converter_last = (soc_tx_converter_converter_mux == 2'd3);
assign soc_tx_converter_converter_source_valid = soc_tx_converter_converter_sink_valid;
assign soc_tx_converter_converter_source_first = (soc_tx_converter_converter_sink_first & soc_tx_converter_converter_first);
assign soc_tx_converter_converter_source_last = (soc_tx_converter_converter_sink_last & soc_tx_converter_converter_last);
assign soc_tx_converter_converter_sink_ready = (soc_tx_converter_converter_last & soc_tx_converter_converter_source_ready);
always @(*) begin
	soc_tx_converter_converter_source_payload_data <= 10'd0;
	case (soc_tx_converter_converter_mux)
		1'd0: begin
			soc_tx_converter_converter_source_payload_data <= soc_tx_converter_converter_sink_payload_data[9:0];
		end
		1'd1: begin
			soc_tx_converter_converter_source_payload_data <= soc_tx_converter_converter_sink_payload_data[19:10];
		end
		2'd2: begin
			soc_tx_converter_converter_source_payload_data <= soc_tx_converter_converter_sink_payload_data[29:20];
		end
		default: begin
			soc_tx_converter_converter_source_payload_data <= soc_tx_converter_converter_sink_payload_data[39:30];
		end
	endcase
end
assign soc_tx_converter_converter_source_payload_valid_token_count = soc_tx_converter_converter_last;
assign soc_rx_converter_converter_sink_valid = soc_rx_converter_sink_valid;
assign soc_rx_converter_converter_sink_first = soc_rx_converter_sink_first;
assign soc_rx_converter_converter_sink_last = soc_rx_converter_sink_last;
assign soc_rx_converter_sink_ready = soc_rx_converter_converter_sink_ready;
assign soc_rx_converter_converter_sink_payload_data = {soc_rx_converter_sink_payload_error, soc_rx_converter_sink_payload_last_be, soc_rx_converter_sink_payload_data};
assign soc_rx_converter_source_valid = soc_rx_converter_source_source_valid;
assign soc_rx_converter_source_first = soc_rx_converter_source_source_first;
assign soc_rx_converter_source_last = soc_rx_converter_source_source_last;
assign soc_rx_converter_source_source_ready = soc_rx_converter_source_ready;
always @(*) begin
	soc_rx_converter_source_payload_data <= 32'd0;
	soc_rx_converter_source_payload_data[7:0] <= soc_rx_converter_source_source_payload_data[7:0];
	soc_rx_converter_source_payload_data[15:8] <= soc_rx_converter_source_source_payload_data[17:10];
	soc_rx_converter_source_payload_data[23:16] <= soc_rx_converter_source_source_payload_data[27:20];
	soc_rx_converter_source_payload_data[31:24] <= soc_rx_converter_source_source_payload_data[37:30];
end
always @(*) begin
	soc_rx_converter_source_payload_last_be <= 4'd0;
	soc_rx_converter_source_payload_last_be[0] <= soc_rx_converter_source_source_payload_data[8];
	soc_rx_converter_source_payload_last_be[1] <= soc_rx_converter_source_source_payload_data[18];
	soc_rx_converter_source_payload_last_be[2] <= soc_rx_converter_source_source_payload_data[28];
	soc_rx_converter_source_payload_last_be[3] <= soc_rx_converter_source_source_payload_data[38];
end
always @(*) begin
	soc_rx_converter_source_payload_error <= 4'd0;
	soc_rx_converter_source_payload_error[0] <= soc_rx_converter_source_source_payload_data[9];
	soc_rx_converter_source_payload_error[1] <= soc_rx_converter_source_source_payload_data[19];
	soc_rx_converter_source_payload_error[2] <= soc_rx_converter_source_source_payload_data[29];
	soc_rx_converter_source_payload_error[3] <= soc_rx_converter_source_source_payload_data[39];
end
assign soc_rx_converter_source_source_valid = soc_rx_converter_converter_source_valid;
assign soc_rx_converter_converter_source_ready = soc_rx_converter_source_source_ready;
assign soc_rx_converter_source_source_first = soc_rx_converter_converter_source_first;
assign soc_rx_converter_source_source_last = soc_rx_converter_converter_source_last;
assign soc_rx_converter_source_source_payload_data = soc_rx_converter_converter_source_payload_data;
assign soc_rx_converter_converter_sink_ready = ((~soc_rx_converter_converter_strobe_all) | soc_rx_converter_converter_source_ready);
assign soc_rx_converter_converter_source_valid = soc_rx_converter_converter_strobe_all;
assign soc_rx_converter_converter_load_part = (soc_rx_converter_converter_sink_valid & soc_rx_converter_converter_sink_ready);
assign soc_tx_cdc_asyncfifo_din = {soc_tx_cdc_fifo_in_last, soc_tx_cdc_fifo_in_first, soc_tx_cdc_fifo_in_payload_error, soc_tx_cdc_fifo_in_payload_last_be, soc_tx_cdc_fifo_in_payload_data};
assign {soc_tx_cdc_fifo_out_last, soc_tx_cdc_fifo_out_first, soc_tx_cdc_fifo_out_payload_error, soc_tx_cdc_fifo_out_payload_last_be, soc_tx_cdc_fifo_out_payload_data} = soc_tx_cdc_asyncfifo_dout;
assign soc_tx_cdc_sink_ready = soc_tx_cdc_asyncfifo_writable;
assign soc_tx_cdc_asyncfifo_we = soc_tx_cdc_sink_valid;
assign soc_tx_cdc_fifo_in_first = soc_tx_cdc_sink_first;
assign soc_tx_cdc_fifo_in_last = soc_tx_cdc_sink_last;
assign soc_tx_cdc_fifo_in_payload_data = soc_tx_cdc_sink_payload_data;
assign soc_tx_cdc_fifo_in_payload_last_be = soc_tx_cdc_sink_payload_last_be;
assign soc_tx_cdc_fifo_in_payload_error = soc_tx_cdc_sink_payload_error;
assign soc_tx_cdc_source_valid = soc_tx_cdc_asyncfifo_readable;
assign soc_tx_cdc_source_first = soc_tx_cdc_fifo_out_first;
assign soc_tx_cdc_source_last = soc_tx_cdc_fifo_out_last;
assign soc_tx_cdc_source_payload_data = soc_tx_cdc_fifo_out_payload_data;
assign soc_tx_cdc_source_payload_last_be = soc_tx_cdc_fifo_out_payload_last_be;
assign soc_tx_cdc_source_payload_error = soc_tx_cdc_fifo_out_payload_error;
assign soc_tx_cdc_asyncfifo_re = soc_tx_cdc_source_ready;
assign soc_tx_cdc_graycounter0_ce = (soc_tx_cdc_asyncfifo_writable & soc_tx_cdc_asyncfifo_we);
assign soc_tx_cdc_graycounter1_ce = (soc_tx_cdc_asyncfifo_readable & soc_tx_cdc_asyncfifo_re);
assign soc_tx_cdc_asyncfifo_writable = (((soc_tx_cdc_graycounter0_q[6] == soc_tx_cdc_consume_wdomain[6]) | (soc_tx_cdc_graycounter0_q[5] == soc_tx_cdc_consume_wdomain[5])) | (soc_tx_cdc_graycounter0_q[4:0] != soc_tx_cdc_consume_wdomain[4:0]));
assign soc_tx_cdc_asyncfifo_readable = (soc_tx_cdc_graycounter1_q != soc_tx_cdc_produce_rdomain);
assign soc_tx_cdc_wrport_adr = soc_tx_cdc_graycounter0_q_binary[5:0];
assign soc_tx_cdc_wrport_dat_w = soc_tx_cdc_asyncfifo_din;
assign soc_tx_cdc_wrport_we = soc_tx_cdc_graycounter0_ce;
assign soc_tx_cdc_rdport_adr = soc_tx_cdc_graycounter1_q_next_binary[5:0];
assign soc_tx_cdc_asyncfifo_dout = soc_tx_cdc_rdport_dat_r;
always @(*) begin
	soc_tx_cdc_graycounter0_q_next_binary <= 7'd0;
	if (soc_tx_cdc_graycounter0_ce) begin
		soc_tx_cdc_graycounter0_q_next_binary <= (soc_tx_cdc_graycounter0_q_binary + 1'd1);
	end else begin
		soc_tx_cdc_graycounter0_q_next_binary <= soc_tx_cdc_graycounter0_q_binary;
	end
end
assign soc_tx_cdc_graycounter0_q_next = (soc_tx_cdc_graycounter0_q_next_binary ^ soc_tx_cdc_graycounter0_q_next_binary[6:1]);
always @(*) begin
	soc_tx_cdc_graycounter1_q_next_binary <= 7'd0;
	if (soc_tx_cdc_graycounter1_ce) begin
		soc_tx_cdc_graycounter1_q_next_binary <= (soc_tx_cdc_graycounter1_q_binary + 1'd1);
	end else begin
		soc_tx_cdc_graycounter1_q_next_binary <= soc_tx_cdc_graycounter1_q_binary;
	end
end
assign soc_tx_cdc_graycounter1_q_next = (soc_tx_cdc_graycounter1_q_next_binary ^ soc_tx_cdc_graycounter1_q_next_binary[6:1]);
assign soc_rx_cdc_asyncfifo_din = {soc_rx_cdc_fifo_in_last, soc_rx_cdc_fifo_in_first, soc_rx_cdc_fifo_in_payload_error, soc_rx_cdc_fifo_in_payload_last_be, soc_rx_cdc_fifo_in_payload_data};
assign {soc_rx_cdc_fifo_out_last, soc_rx_cdc_fifo_out_first, soc_rx_cdc_fifo_out_payload_error, soc_rx_cdc_fifo_out_payload_last_be, soc_rx_cdc_fifo_out_payload_data} = soc_rx_cdc_asyncfifo_dout;
assign soc_rx_cdc_sink_ready = soc_rx_cdc_asyncfifo_writable;
assign soc_rx_cdc_asyncfifo_we = soc_rx_cdc_sink_valid;
assign soc_rx_cdc_fifo_in_first = soc_rx_cdc_sink_first;
assign soc_rx_cdc_fifo_in_last = soc_rx_cdc_sink_last;
assign soc_rx_cdc_fifo_in_payload_data = soc_rx_cdc_sink_payload_data;
assign soc_rx_cdc_fifo_in_payload_last_be = soc_rx_cdc_sink_payload_last_be;
assign soc_rx_cdc_fifo_in_payload_error = soc_rx_cdc_sink_payload_error;
assign soc_rx_cdc_source_valid = soc_rx_cdc_asyncfifo_readable;
assign soc_rx_cdc_source_first = soc_rx_cdc_fifo_out_first;
assign soc_rx_cdc_source_last = soc_rx_cdc_fifo_out_last;
assign soc_rx_cdc_source_payload_data = soc_rx_cdc_fifo_out_payload_data;
assign soc_rx_cdc_source_payload_last_be = soc_rx_cdc_fifo_out_payload_last_be;
assign soc_rx_cdc_source_payload_error = soc_rx_cdc_fifo_out_payload_error;
assign soc_rx_cdc_asyncfifo_re = soc_rx_cdc_source_ready;
assign soc_rx_cdc_graycounter0_ce = (soc_rx_cdc_asyncfifo_writable & soc_rx_cdc_asyncfifo_we);
assign soc_rx_cdc_graycounter1_ce = (soc_rx_cdc_asyncfifo_readable & soc_rx_cdc_asyncfifo_re);
assign soc_rx_cdc_asyncfifo_writable = (((soc_rx_cdc_graycounter0_q[6] == soc_rx_cdc_consume_wdomain[6]) | (soc_rx_cdc_graycounter0_q[5] == soc_rx_cdc_consume_wdomain[5])) | (soc_rx_cdc_graycounter0_q[4:0] != soc_rx_cdc_consume_wdomain[4:0]));
assign soc_rx_cdc_asyncfifo_readable = (soc_rx_cdc_graycounter1_q != soc_rx_cdc_produce_rdomain);
assign soc_rx_cdc_wrport_adr = soc_rx_cdc_graycounter0_q_binary[5:0];
assign soc_rx_cdc_wrport_dat_w = soc_rx_cdc_asyncfifo_din;
assign soc_rx_cdc_wrport_we = soc_rx_cdc_graycounter0_ce;
assign soc_rx_cdc_rdport_adr = soc_rx_cdc_graycounter1_q_next_binary[5:0];
assign soc_rx_cdc_asyncfifo_dout = soc_rx_cdc_rdport_dat_r;
always @(*) begin
	soc_rx_cdc_graycounter0_q_next_binary <= 7'd0;
	if (soc_rx_cdc_graycounter0_ce) begin
		soc_rx_cdc_graycounter0_q_next_binary <= (soc_rx_cdc_graycounter0_q_binary + 1'd1);
	end else begin
		soc_rx_cdc_graycounter0_q_next_binary <= soc_rx_cdc_graycounter0_q_binary;
	end
end
assign soc_rx_cdc_graycounter0_q_next = (soc_rx_cdc_graycounter0_q_next_binary ^ soc_rx_cdc_graycounter0_q_next_binary[6:1]);
always @(*) begin
	soc_rx_cdc_graycounter1_q_next_binary <= 7'd0;
	if (soc_rx_cdc_graycounter1_ce) begin
		soc_rx_cdc_graycounter1_q_next_binary <= (soc_rx_cdc_graycounter1_q_binary + 1'd1);
	end else begin
		soc_rx_cdc_graycounter1_q_next_binary <= soc_rx_cdc_graycounter1_q_binary;
	end
end
assign soc_rx_cdc_graycounter1_q_next = (soc_rx_cdc_graycounter1_q_next_binary ^ soc_rx_cdc_graycounter1_q_next_binary[6:1]);
assign soc_tx_converter_sink_valid = soc_tx_cdc_source_valid;
assign soc_tx_cdc_source_ready = soc_tx_converter_sink_ready;
assign soc_tx_converter_sink_first = soc_tx_cdc_source_first;
assign soc_tx_converter_sink_last = soc_tx_cdc_source_last;
assign soc_tx_converter_sink_payload_data = soc_tx_cdc_source_payload_data;
assign soc_tx_converter_sink_payload_last_be = soc_tx_cdc_source_payload_last_be;
assign soc_tx_converter_sink_payload_error = soc_tx_cdc_source_payload_error;
assign soc_tx_last_be_sink_valid = soc_tx_converter_source_valid;
assign soc_tx_converter_source_ready = soc_tx_last_be_sink_ready;
assign soc_tx_last_be_sink_first = soc_tx_converter_source_first;
assign soc_tx_last_be_sink_last = soc_tx_converter_source_last;
assign soc_tx_last_be_sink_payload_data = soc_tx_converter_source_payload_data;
assign soc_tx_last_be_sink_payload_last_be = soc_tx_converter_source_payload_last_be;
assign soc_tx_last_be_sink_payload_error = soc_tx_converter_source_payload_error;
assign soc_padding_inserter_sink_valid = soc_tx_last_be_source_valid;
assign soc_tx_last_be_source_ready = soc_padding_inserter_sink_ready;
assign soc_padding_inserter_sink_first = soc_tx_last_be_source_first;
assign soc_padding_inserter_sink_last = soc_tx_last_be_source_last;
assign soc_padding_inserter_sink_payload_data = soc_tx_last_be_source_payload_data;
assign soc_padding_inserter_sink_payload_last_be = soc_tx_last_be_source_payload_last_be;
assign soc_padding_inserter_sink_payload_error = soc_tx_last_be_source_payload_error;
assign soc_crc32_inserter_sink_valid = soc_padding_inserter_source_valid;
assign soc_padding_inserter_source_ready = soc_crc32_inserter_sink_ready;
assign soc_crc32_inserter_sink_first = soc_padding_inserter_source_first;
assign soc_crc32_inserter_sink_last = soc_padding_inserter_source_last;
assign soc_crc32_inserter_sink_payload_data = soc_padding_inserter_source_payload_data;
assign soc_crc32_inserter_sink_payload_last_be = soc_padding_inserter_source_payload_last_be;
assign soc_crc32_inserter_sink_payload_error = soc_padding_inserter_source_payload_error;
assign soc_preamble_inserter_sink_valid = soc_crc32_inserter_source_valid;
assign soc_crc32_inserter_source_ready = soc_preamble_inserter_sink_ready;
assign soc_preamble_inserter_sink_first = soc_crc32_inserter_source_first;
assign soc_preamble_inserter_sink_last = soc_crc32_inserter_source_last;
assign soc_preamble_inserter_sink_payload_data = soc_crc32_inserter_source_payload_data;
assign soc_preamble_inserter_sink_payload_last_be = soc_crc32_inserter_source_payload_last_be;
assign soc_preamble_inserter_sink_payload_error = soc_crc32_inserter_source_payload_error;
assign soc_tx_gap_inserter_sink_valid = soc_preamble_inserter_source_valid;
assign soc_preamble_inserter_source_ready = soc_tx_gap_inserter_sink_ready;
assign soc_tx_gap_inserter_sink_first = soc_preamble_inserter_source_first;
assign soc_tx_gap_inserter_sink_last = soc_preamble_inserter_source_last;
assign soc_tx_gap_inserter_sink_payload_data = soc_preamble_inserter_source_payload_data;
assign soc_tx_gap_inserter_sink_payload_last_be = soc_preamble_inserter_source_payload_last_be;
assign soc_tx_gap_inserter_sink_payload_error = soc_preamble_inserter_source_payload_error;
assign soc_liteethphymiitx_sink_sink_valid = soc_tx_gap_inserter_source_valid;
assign soc_tx_gap_inserter_source_ready = soc_liteethphymiitx_sink_sink_ready;
assign soc_liteethphymiitx_sink_sink_first = soc_tx_gap_inserter_source_first;
assign soc_liteethphymiitx_sink_sink_last = soc_tx_gap_inserter_source_last;
assign soc_liteethphymiitx_sink_sink_payload_data = soc_tx_gap_inserter_source_payload_data;
assign soc_liteethphymiitx_sink_sink_payload_last_be = soc_tx_gap_inserter_source_payload_last_be;
assign soc_liteethphymiitx_sink_sink_payload_error = soc_tx_gap_inserter_source_payload_error;
assign soc_preamble_checker_sink_valid = soc_liteethphymiirx_source_source_valid;
assign soc_liteethphymiirx_source_source_ready = soc_preamble_checker_sink_ready;
assign soc_preamble_checker_sink_first = soc_liteethphymiirx_source_source_first;
assign soc_preamble_checker_sink_last = soc_liteethphymiirx_source_source_last;
assign soc_preamble_checker_sink_payload_data = soc_liteethphymiirx_source_source_payload_data;
assign soc_preamble_checker_sink_payload_last_be = soc_liteethphymiirx_source_source_payload_last_be;
assign soc_preamble_checker_sink_payload_error = soc_liteethphymiirx_source_source_payload_error;
assign soc_crc32_checker_sink_sink_valid = soc_preamble_checker_source_valid;
assign soc_preamble_checker_source_ready = soc_crc32_checker_sink_sink_ready;
assign soc_crc32_checker_sink_sink_first = soc_preamble_checker_source_first;
assign soc_crc32_checker_sink_sink_last = soc_preamble_checker_source_last;
assign soc_crc32_checker_sink_sink_payload_data = soc_preamble_checker_source_payload_data;
assign soc_crc32_checker_sink_sink_payload_last_be = soc_preamble_checker_source_payload_last_be;
assign soc_crc32_checker_sink_sink_payload_error = soc_preamble_checker_source_payload_error;
assign soc_padding_checker_sink_valid = soc_crc32_checker_source_source_valid;
assign soc_crc32_checker_source_source_ready = soc_padding_checker_sink_ready;
assign soc_padding_checker_sink_first = soc_crc32_checker_source_source_first;
assign soc_padding_checker_sink_last = soc_crc32_checker_source_source_last;
assign soc_padding_checker_sink_payload_data = soc_crc32_checker_source_source_payload_data;
assign soc_padding_checker_sink_payload_last_be = soc_crc32_checker_source_source_payload_last_be;
assign soc_padding_checker_sink_payload_error = soc_crc32_checker_source_source_payload_error;
assign soc_rx_last_be_sink_valid = soc_padding_checker_source_valid;
assign soc_padding_checker_source_ready = soc_rx_last_be_sink_ready;
assign soc_rx_last_be_sink_first = soc_padding_checker_source_first;
assign soc_rx_last_be_sink_last = soc_padding_checker_source_last;
assign soc_rx_last_be_sink_payload_data = soc_padding_checker_source_payload_data;
assign soc_rx_last_be_sink_payload_last_be = soc_padding_checker_source_payload_last_be;
assign soc_rx_last_be_sink_payload_error = soc_padding_checker_source_payload_error;
assign soc_rx_converter_sink_valid = soc_rx_last_be_source_valid;
assign soc_rx_last_be_source_ready = soc_rx_converter_sink_ready;
assign soc_rx_converter_sink_first = soc_rx_last_be_source_first;
assign soc_rx_converter_sink_last = soc_rx_last_be_source_last;
assign soc_rx_converter_sink_payload_data = soc_rx_last_be_source_payload_data;
assign soc_rx_converter_sink_payload_last_be = soc_rx_last_be_source_payload_last_be;
assign soc_rx_converter_sink_payload_error = soc_rx_last_be_source_payload_error;
assign soc_rx_cdc_sink_valid = soc_rx_converter_source_valid;
assign soc_rx_converter_source_ready = soc_rx_cdc_sink_ready;
assign soc_rx_cdc_sink_first = soc_rx_converter_source_first;
assign soc_rx_cdc_sink_last = soc_rx_converter_source_last;
assign soc_rx_cdc_sink_payload_data = soc_rx_converter_source_payload_data;
assign soc_rx_cdc_sink_payload_last_be = soc_rx_converter_source_payload_last_be;
assign soc_rx_cdc_sink_payload_error = soc_rx_converter_source_payload_error;
assign soc_writer_sink_sink_valid = soc_sink_valid;
assign soc_sink_ready = soc_writer_sink_sink_ready;
assign soc_writer_sink_sink_first = soc_sink_first;
assign soc_writer_sink_sink_last = soc_sink_last;
assign soc_writer_sink_sink_payload_data = soc_sink_payload_data;
assign soc_writer_sink_sink_payload_last_be = soc_sink_payload_last_be;
assign soc_writer_sink_sink_payload_error = soc_sink_payload_error;
assign soc_source_valid = soc_reader_source_source_valid;
assign soc_reader_source_source_ready = soc_source_ready;
assign soc_source_first = soc_reader_source_source_first;
assign soc_source_last = soc_reader_source_source_last;
assign soc_source_payload_data = soc_reader_source_source_payload_data;
assign soc_source_payload_last_be = soc_reader_source_source_payload_last_be;
assign soc_source_payload_error = soc_reader_source_source_payload_error;
always @(*) begin
	soc_writer_inc <= 3'd0;
	case (soc_writer_sink_sink_payload_last_be)
		1'd1: begin
			soc_writer_inc <= 1'd1;
		end
		2'd2: begin
			soc_writer_inc <= 2'd2;
		end
		3'd4: begin
			soc_writer_inc <= 2'd3;
		end
		default: begin
			soc_writer_inc <= 3'd4;
		end
	endcase
end
assign soc_writer_fifo_sink_payload_slot = soc_writer_slot;
assign soc_writer_fifo_sink_payload_length = soc_writer_counter;
assign soc_writer_fifo_source_ready = soc_writer_available_clear;
assign soc_writer_available_trigger = soc_writer_fifo_source_valid;
assign soc_writer_slot_status = soc_writer_fifo_source_payload_slot;
assign soc_writer_length_status = soc_writer_fifo_source_payload_length;
always @(*) begin
	soc_writer_memory0_adr <= 9'd0;
	soc_writer_memory1_dat_w <= 32'd0;
	soc_writer_memory0_we <= 1'd0;
	soc_writer_memory0_dat_w <= 32'd0;
	soc_writer_memory1_adr <= 9'd0;
	soc_writer_memory1_we <= 1'd0;
	case (soc_writer_slot)
		1'd0: begin
			soc_writer_memory0_adr <= soc_writer_counter[31:2];
			soc_writer_memory0_dat_w <= soc_writer_sink_sink_payload_data;
			if ((soc_writer_sink_sink_valid & soc_writer_ongoing)) begin
				soc_writer_memory0_we <= 4'd15;
			end
		end
		1'd1: begin
			soc_writer_memory1_adr <= soc_writer_counter[31:2];
			soc_writer_memory1_dat_w <= soc_writer_sink_sink_payload_data;
			if ((soc_writer_sink_sink_valid & soc_writer_ongoing)) begin
				soc_writer_memory1_we <= 4'd15;
			end
		end
	endcase
end
assign soc_writer_status_w = soc_writer_available_status;
always @(*) begin
	soc_writer_available_clear <= 1'd0;
	if ((soc_writer_pending_re & soc_writer_pending_r)) begin
		soc_writer_available_clear <= 1'd1;
	end
end
assign soc_writer_pending_w = soc_writer_available_pending;
assign soc_writer_irq = (soc_writer_pending_w & soc_writer_storage);
assign soc_writer_available_status = soc_writer_available_trigger;
assign soc_writer_available_pending = soc_writer_available_trigger;
assign soc_writer_fifo_syncfifo_din = {soc_writer_fifo_fifo_in_last, soc_writer_fifo_fifo_in_first, soc_writer_fifo_fifo_in_payload_length, soc_writer_fifo_fifo_in_payload_slot};
assign {soc_writer_fifo_fifo_out_last, soc_writer_fifo_fifo_out_first, soc_writer_fifo_fifo_out_payload_length, soc_writer_fifo_fifo_out_payload_slot} = soc_writer_fifo_syncfifo_dout;
assign soc_writer_fifo_sink_ready = soc_writer_fifo_syncfifo_writable;
assign soc_writer_fifo_syncfifo_we = soc_writer_fifo_sink_valid;
assign soc_writer_fifo_fifo_in_first = soc_writer_fifo_sink_first;
assign soc_writer_fifo_fifo_in_last = soc_writer_fifo_sink_last;
assign soc_writer_fifo_fifo_in_payload_slot = soc_writer_fifo_sink_payload_slot;
assign soc_writer_fifo_fifo_in_payload_length = soc_writer_fifo_sink_payload_length;
assign soc_writer_fifo_source_valid = soc_writer_fifo_syncfifo_readable;
assign soc_writer_fifo_source_first = soc_writer_fifo_fifo_out_first;
assign soc_writer_fifo_source_last = soc_writer_fifo_fifo_out_last;
assign soc_writer_fifo_source_payload_slot = soc_writer_fifo_fifo_out_payload_slot;
assign soc_writer_fifo_source_payload_length = soc_writer_fifo_fifo_out_payload_length;
assign soc_writer_fifo_syncfifo_re = soc_writer_fifo_source_ready;
always @(*) begin
	soc_writer_fifo_wrport_adr <= 1'd0;
	if (soc_writer_fifo_replace) begin
		soc_writer_fifo_wrport_adr <= (soc_writer_fifo_produce - 1'd1);
	end else begin
		soc_writer_fifo_wrport_adr <= soc_writer_fifo_produce;
	end
end
assign soc_writer_fifo_wrport_dat_w = soc_writer_fifo_syncfifo_din;
assign soc_writer_fifo_wrport_we = (soc_writer_fifo_syncfifo_we & (soc_writer_fifo_syncfifo_writable | soc_writer_fifo_replace));
assign soc_writer_fifo_do_read = (soc_writer_fifo_syncfifo_readable & soc_writer_fifo_syncfifo_re);
assign soc_writer_fifo_rdport_adr = soc_writer_fifo_consume;
assign soc_writer_fifo_syncfifo_dout = soc_writer_fifo_rdport_dat_r;
assign soc_writer_fifo_syncfifo_writable = (soc_writer_fifo_level != 2'd2);
assign soc_writer_fifo_syncfifo_readable = (soc_writer_fifo_level != 1'd0);
always @(*) begin
	soc_writer_slot_ce <= 1'd0;
	soc_writer_errors_status_liteethmac_next_value <= 32'd0;
	soc_writer_errors_status_liteethmac_next_value_ce <= 1'd0;
	soc_writer_ongoing <= 1'd0;
	soc_writer_fifo_sink_valid <= 1'd0;
	soc_writer_counter_reset <= 1'd0;
	soc_writer_counter_ce <= 1'd0;
	vns_liteethmacsramwriter_next_state <= 3'd0;
	vns_liteethmacsramwriter_next_state <= vns_liteethmacsramwriter_state;
	case (vns_liteethmacsramwriter_state)
		1'd1: begin
			if (soc_writer_sink_sink_valid) begin
				if ((soc_writer_counter == 11'd1530)) begin
					vns_liteethmacsramwriter_next_state <= 2'd3;
				end else begin
					soc_writer_counter_ce <= 1'd1;
					soc_writer_ongoing <= 1'd1;
				end
				if (soc_writer_sink_sink_last) begin
					if (((soc_writer_sink_sink_payload_error & soc_writer_sink_sink_payload_last_be) != 1'd0)) begin
						vns_liteethmacsramwriter_next_state <= 2'd2;
					end else begin
						vns_liteethmacsramwriter_next_state <= 3'd4;
					end
				end
			end
		end
		2'd2: begin
			soc_writer_counter_reset <= 1'd1;
			vns_liteethmacsramwriter_next_state <= 1'd0;
		end
		2'd3: begin
			if ((soc_writer_sink_sink_valid & soc_writer_sink_sink_last)) begin
				vns_liteethmacsramwriter_next_state <= 3'd4;
			end
		end
		3'd4: begin
			soc_writer_counter_reset <= 1'd1;
			soc_writer_slot_ce <= 1'd1;
			soc_writer_fifo_sink_valid <= 1'd1;
			vns_liteethmacsramwriter_next_state <= 1'd0;
		end
		default: begin
			if (soc_writer_sink_sink_valid) begin
				if (soc_writer_fifo_sink_ready) begin
					soc_writer_ongoing <= 1'd1;
					soc_writer_counter_ce <= 1'd1;
					vns_liteethmacsramwriter_next_state <= 1'd1;
				end else begin
					soc_writer_errors_status_liteethmac_next_value <= (soc_writer_errors_status + 1'd1);
					soc_writer_errors_status_liteethmac_next_value_ce <= 1'd1;
					vns_liteethmacsramwriter_next_state <= 2'd3;
				end
			end
		end
	endcase
end
assign soc_reader_fifo_sink_valid = soc_reader_start_re;
assign soc_reader_fifo_sink_payload_slot = soc_reader_slot_storage;
assign soc_reader_fifo_sink_payload_length = soc_reader_length_storage;
assign soc_reader_ready_status = soc_reader_fifo_sink_ready;
assign soc_reader_level_status = soc_reader_fifo_level;
always @(*) begin
	soc_reader_source_source_payload_last_be <= 4'd0;
	if (soc_reader_last) begin
		case (soc_reader_fifo_source_payload_length[1:0])
			1'd0: begin
				soc_reader_source_source_payload_last_be <= 4'd8;
			end
			1'd1: begin
				soc_reader_source_source_payload_last_be <= 1'd1;
			end
			2'd2: begin
				soc_reader_source_source_payload_last_be <= 2'd2;
			end
			2'd3: begin
				soc_reader_source_source_payload_last_be <= 3'd4;
			end
		endcase
	end
end
assign soc_reader_last = ((soc_reader_counter + 3'd4) >= soc_reader_fifo_source_payload_length);
assign soc_reader_memory0_adr = soc_reader_counter[10:2];
assign soc_reader_memory1_adr = soc_reader_counter[10:2];
always @(*) begin
	soc_reader_source_source_payload_data <= 32'd0;
	case (soc_reader_fifo_source_payload_slot)
		1'd0: begin
			soc_reader_source_source_payload_data <= soc_reader_memory0_dat_r;
		end
		1'd1: begin
			soc_reader_source_source_payload_data <= soc_reader_memory1_dat_r;
		end
	endcase
end
assign soc_reader_eventmanager_status_w = soc_reader_done_status;
always @(*) begin
	soc_reader_done_clear <= 1'd0;
	if ((soc_reader_eventmanager_pending_re & soc_reader_eventmanager_pending_r)) begin
		soc_reader_done_clear <= 1'd1;
	end
end
assign soc_reader_eventmanager_pending_w = soc_reader_done_pending;
assign soc_reader_irq = (soc_reader_eventmanager_pending_w & soc_reader_eventmanager_storage);
assign soc_reader_done_status = 1'd0;
assign soc_reader_fifo_syncfifo_din = {soc_reader_fifo_fifo_in_last, soc_reader_fifo_fifo_in_first, soc_reader_fifo_fifo_in_payload_length, soc_reader_fifo_fifo_in_payload_slot};
assign {soc_reader_fifo_fifo_out_last, soc_reader_fifo_fifo_out_first, soc_reader_fifo_fifo_out_payload_length, soc_reader_fifo_fifo_out_payload_slot} = soc_reader_fifo_syncfifo_dout;
assign soc_reader_fifo_sink_ready = soc_reader_fifo_syncfifo_writable;
assign soc_reader_fifo_syncfifo_we = soc_reader_fifo_sink_valid;
assign soc_reader_fifo_fifo_in_first = soc_reader_fifo_sink_first;
assign soc_reader_fifo_fifo_in_last = soc_reader_fifo_sink_last;
assign soc_reader_fifo_fifo_in_payload_slot = soc_reader_fifo_sink_payload_slot;
assign soc_reader_fifo_fifo_in_payload_length = soc_reader_fifo_sink_payload_length;
assign soc_reader_fifo_source_valid = soc_reader_fifo_syncfifo_readable;
assign soc_reader_fifo_source_first = soc_reader_fifo_fifo_out_first;
assign soc_reader_fifo_source_last = soc_reader_fifo_fifo_out_last;
assign soc_reader_fifo_source_payload_slot = soc_reader_fifo_fifo_out_payload_slot;
assign soc_reader_fifo_source_payload_length = soc_reader_fifo_fifo_out_payload_length;
assign soc_reader_fifo_syncfifo_re = soc_reader_fifo_source_ready;
always @(*) begin
	soc_reader_fifo_wrport_adr <= 1'd0;
	if (soc_reader_fifo_replace) begin
		soc_reader_fifo_wrport_adr <= (soc_reader_fifo_produce - 1'd1);
	end else begin
		soc_reader_fifo_wrport_adr <= soc_reader_fifo_produce;
	end
end
assign soc_reader_fifo_wrport_dat_w = soc_reader_fifo_syncfifo_din;
assign soc_reader_fifo_wrport_we = (soc_reader_fifo_syncfifo_we & (soc_reader_fifo_syncfifo_writable | soc_reader_fifo_replace));
assign soc_reader_fifo_do_read = (soc_reader_fifo_syncfifo_readable & soc_reader_fifo_syncfifo_re);
assign soc_reader_fifo_rdport_adr = soc_reader_fifo_consume;
assign soc_reader_fifo_syncfifo_dout = soc_reader_fifo_rdport_dat_r;
assign soc_reader_fifo_syncfifo_writable = (soc_reader_fifo_level != 2'd2);
assign soc_reader_fifo_syncfifo_readable = (soc_reader_fifo_level != 1'd0);
always @(*) begin
	soc_reader_counter_reset <= 1'd0;
	soc_reader_counter_ce <= 1'd0;
	soc_reader_source_source_last <= 1'd0;
	soc_reader_fifo_source_ready <= 1'd0;
	vns_liteethmacsramreader_next_state <= 2'd0;
	soc_reader_source_source_valid <= 1'd0;
	soc_reader_done_trigger <= 1'd0;
	vns_liteethmacsramreader_next_state <= vns_liteethmacsramreader_state;
	case (vns_liteethmacsramreader_state)
		1'd1: begin
			if ((~soc_reader_last_d)) begin
				vns_liteethmacsramreader_next_state <= 2'd2;
			end else begin
				vns_liteethmacsramreader_next_state <= 2'd3;
			end
		end
		2'd2: begin
			soc_reader_source_source_valid <= 1'd1;
			soc_reader_source_source_last <= soc_reader_last;
			if (soc_reader_source_source_ready) begin
				soc_reader_counter_ce <= (~soc_reader_last);
				vns_liteethmacsramreader_next_state <= 1'd1;
			end
		end
		2'd3: begin
			soc_reader_fifo_source_ready <= 1'd1;
			soc_reader_done_trigger <= 1'd1;
			vns_liteethmacsramreader_next_state <= 1'd0;
		end
		default: begin
			soc_reader_counter_reset <= 1'd1;
			if (soc_reader_fifo_source_valid) begin
				vns_liteethmacsramreader_next_state <= 1'd1;
			end
		end
	endcase
end
assign soc_ev_irq = (soc_writer_irq | soc_reader_irq);
assign soc_sram0_adr0 = soc_sram0_bus_adr0[8:0];
assign soc_sram0_bus_dat_r0 = soc_sram0_dat_r0;
assign soc_sram1_adr0 = soc_sram1_bus_adr0[8:0];
assign soc_sram1_bus_dat_r0 = soc_sram1_dat_r0;
always @(*) begin
	soc_sram0_we <= 4'd0;
	soc_sram0_we[0] <= (((soc_sram0_bus_cyc1 & soc_sram0_bus_stb1) & soc_sram0_bus_we1) & soc_sram0_bus_sel1[0]);
	soc_sram0_we[1] <= (((soc_sram0_bus_cyc1 & soc_sram0_bus_stb1) & soc_sram0_bus_we1) & soc_sram0_bus_sel1[1]);
	soc_sram0_we[2] <= (((soc_sram0_bus_cyc1 & soc_sram0_bus_stb1) & soc_sram0_bus_we1) & soc_sram0_bus_sel1[2]);
	soc_sram0_we[3] <= (((soc_sram0_bus_cyc1 & soc_sram0_bus_stb1) & soc_sram0_bus_we1) & soc_sram0_bus_sel1[3]);
end
assign soc_sram0_adr1 = soc_sram0_bus_adr1[8:0];
assign soc_sram0_bus_dat_r1 = soc_sram0_dat_r1;
assign soc_sram0_dat_w = soc_sram0_bus_dat_w1;
always @(*) begin
	soc_sram1_we <= 4'd0;
	soc_sram1_we[0] <= (((soc_sram1_bus_cyc1 & soc_sram1_bus_stb1) & soc_sram1_bus_we1) & soc_sram1_bus_sel1[0]);
	soc_sram1_we[1] <= (((soc_sram1_bus_cyc1 & soc_sram1_bus_stb1) & soc_sram1_bus_we1) & soc_sram1_bus_sel1[1]);
	soc_sram1_we[2] <= (((soc_sram1_bus_cyc1 & soc_sram1_bus_stb1) & soc_sram1_bus_we1) & soc_sram1_bus_sel1[2]);
	soc_sram1_we[3] <= (((soc_sram1_bus_cyc1 & soc_sram1_bus_stb1) & soc_sram1_bus_we1) & soc_sram1_bus_sel1[3]);
end
assign soc_sram1_adr1 = soc_sram1_bus_adr1[8:0];
assign soc_sram1_bus_dat_r1 = soc_sram1_dat_r1;
assign soc_sram1_dat_w = soc_sram1_bus_dat_w1;
always @(*) begin
	soc_slave_sel <= 4'd0;
	soc_slave_sel[0] <= (soc_bus_adr[10:9] == 1'd0);
	soc_slave_sel[1] <= (soc_bus_adr[10:9] == 1'd1);
	soc_slave_sel[2] <= (soc_bus_adr[10:9] == 2'd2);
	soc_slave_sel[3] <= (soc_bus_adr[10:9] == 2'd3);
end
assign soc_sram0_bus_adr0 = soc_bus_adr;
assign soc_sram0_bus_dat_w0 = soc_bus_dat_w;
assign soc_sram0_bus_sel0 = soc_bus_sel;
assign soc_sram0_bus_stb0 = soc_bus_stb;
assign soc_sram0_bus_we0 = soc_bus_we;
assign soc_sram0_bus_cti0 = soc_bus_cti;
assign soc_sram0_bus_bte0 = soc_bus_bte;
assign soc_sram1_bus_adr0 = soc_bus_adr;
assign soc_sram1_bus_dat_w0 = soc_bus_dat_w;
assign soc_sram1_bus_sel0 = soc_bus_sel;
assign soc_sram1_bus_stb0 = soc_bus_stb;
assign soc_sram1_bus_we0 = soc_bus_we;
assign soc_sram1_bus_cti0 = soc_bus_cti;
assign soc_sram1_bus_bte0 = soc_bus_bte;
assign soc_sram0_bus_adr1 = soc_bus_adr;
assign soc_sram0_bus_dat_w1 = soc_bus_dat_w;
assign soc_sram0_bus_sel1 = soc_bus_sel;
assign soc_sram0_bus_stb1 = soc_bus_stb;
assign soc_sram0_bus_we1 = soc_bus_we;
assign soc_sram0_bus_cti1 = soc_bus_cti;
assign soc_sram0_bus_bte1 = soc_bus_bte;
assign soc_sram1_bus_adr1 = soc_bus_adr;
assign soc_sram1_bus_dat_w1 = soc_bus_dat_w;
assign soc_sram1_bus_sel1 = soc_bus_sel;
assign soc_sram1_bus_stb1 = soc_bus_stb;
assign soc_sram1_bus_we1 = soc_bus_we;
assign soc_sram1_bus_cti1 = soc_bus_cti;
assign soc_sram1_bus_bte1 = soc_bus_bte;
assign soc_sram0_bus_cyc0 = (soc_bus_cyc & soc_slave_sel[0]);
assign soc_sram1_bus_cyc0 = (soc_bus_cyc & soc_slave_sel[1]);
assign soc_sram0_bus_cyc1 = (soc_bus_cyc & soc_slave_sel[2]);
assign soc_sram1_bus_cyc1 = (soc_bus_cyc & soc_slave_sel[3]);
assign soc_bus_ack = (((soc_sram0_bus_ack0 | soc_sram1_bus_ack0) | soc_sram0_bus_ack1) | soc_sram1_bus_ack1);
assign soc_bus_err = (((soc_sram0_bus_err0 | soc_sram1_bus_err0) | soc_sram0_bus_err1) | soc_sram1_bus_err1);
assign soc_bus_dat_r = (((({32{soc_slave_sel_r[0]}} & soc_sram0_bus_dat_r0) | ({32{soc_slave_sel_r[1]}} & soc_sram1_bus_dat_r0)) | ({32{soc_slave_sel_r[2]}} & soc_sram0_bus_dat_r1)) | ({32{soc_slave_sel_r[3]}} & soc_sram1_bus_dat_r1));
assign soc_netsoc_interface0_wb_sdram_adr = vns_rhs_array_muxed36;
assign soc_netsoc_interface0_wb_sdram_dat_w = vns_rhs_array_muxed37;
assign soc_netsoc_interface0_wb_sdram_sel = vns_rhs_array_muxed38;
assign soc_netsoc_interface0_wb_sdram_cyc = vns_rhs_array_muxed39;
assign soc_netsoc_interface0_wb_sdram_stb = vns_rhs_array_muxed40;
assign soc_netsoc_interface0_wb_sdram_we = vns_rhs_array_muxed41;
assign soc_netsoc_interface0_wb_sdram_cti = vns_rhs_array_muxed42;
assign soc_netsoc_interface0_wb_sdram_bte = vns_rhs_array_muxed43;
assign soc_netsoc_interface1_wb_sdram_dat_r = soc_netsoc_interface0_wb_sdram_dat_r;
assign soc_netsoc_interface1_wb_sdram_ack = (soc_netsoc_interface0_wb_sdram_ack & (vns_wb_sdram_con_grant == 1'd0));
assign soc_netsoc_interface1_wb_sdram_err = (soc_netsoc_interface0_wb_sdram_err & (vns_wb_sdram_con_grant == 1'd0));
assign vns_wb_sdram_con_request = {soc_netsoc_interface1_wb_sdram_cyc};
assign vns_wb_sdram_con_grant = 1'd0;
assign vns_netsoc_shared_adr = vns_rhs_array_muxed44;
assign vns_netsoc_shared_dat_w = vns_rhs_array_muxed45;
assign vns_netsoc_shared_sel = vns_rhs_array_muxed46;
assign vns_netsoc_shared_cyc = vns_rhs_array_muxed47;
assign vns_netsoc_shared_stb = vns_rhs_array_muxed48;
assign vns_netsoc_shared_we = vns_rhs_array_muxed49;
assign vns_netsoc_shared_cti = vns_rhs_array_muxed50;
assign vns_netsoc_shared_bte = vns_rhs_array_muxed51;
assign soc_netsoc_interface0_soc_bus_dat_r = vns_netsoc_shared_dat_r;
assign soc_netsoc_interface1_soc_bus_dat_r = vns_netsoc_shared_dat_r;
assign soc_netsoc_interface0_soc_bus_ack = (vns_netsoc_shared_ack & (vns_netsoc_grant == 1'd0));
assign soc_netsoc_interface1_soc_bus_ack = (vns_netsoc_shared_ack & (vns_netsoc_grant == 1'd1));
assign soc_netsoc_interface0_soc_bus_err = (vns_netsoc_shared_err & (vns_netsoc_grant == 1'd0));
assign soc_netsoc_interface1_soc_bus_err = (vns_netsoc_shared_err & (vns_netsoc_grant == 1'd1));
assign vns_netsoc_request = {soc_netsoc_interface1_soc_bus_cyc, soc_netsoc_interface0_soc_bus_cyc};
always @(*) begin
	vns_netsoc_slave_sel <= 6'd0;
	vns_netsoc_slave_sel[0] <= (vns_netsoc_shared_adr[28:14] == 1'd0);
	vns_netsoc_slave_sel[1] <= (vns_netsoc_shared_adr[28:13] == 14'd8192);
	vns_netsoc_slave_sel[2] <= (vns_netsoc_shared_adr[28:22] == 7'd112);
	vns_netsoc_slave_sel[3] <= (vns_netsoc_shared_adr[28:12] == 17'd81920);
	vns_netsoc_slave_sel[4] <= (vns_netsoc_shared_adr[28:26] == 3'd4);
	vns_netsoc_slave_sel[5] <= (vns_netsoc_shared_adr[28:26] == 2'd3);
end
assign soc_netsoc_rom_bus_adr = vns_netsoc_shared_adr;
assign soc_netsoc_rom_bus_dat_w = vns_netsoc_shared_dat_w;
assign soc_netsoc_rom_bus_sel = vns_netsoc_shared_sel;
assign soc_netsoc_rom_bus_stb = vns_netsoc_shared_stb;
assign soc_netsoc_rom_bus_we = vns_netsoc_shared_we;
assign soc_netsoc_rom_bus_cti = vns_netsoc_shared_cti;
assign soc_netsoc_rom_bus_bte = vns_netsoc_shared_bte;
assign soc_netsoc_sram_bus_adr = vns_netsoc_shared_adr;
assign soc_netsoc_sram_bus_dat_w = vns_netsoc_shared_dat_w;
assign soc_netsoc_sram_bus_sel = vns_netsoc_shared_sel;
assign soc_netsoc_sram_bus_stb = vns_netsoc_shared_stb;
assign soc_netsoc_sram_bus_we = vns_netsoc_shared_we;
assign soc_netsoc_sram_bus_cti = vns_netsoc_shared_cti;
assign soc_netsoc_sram_bus_bte = vns_netsoc_shared_bte;
assign soc_netsoc_bus_wishbone_adr = vns_netsoc_shared_adr;
assign soc_netsoc_bus_wishbone_dat_w = vns_netsoc_shared_dat_w;
assign soc_netsoc_bus_wishbone_sel = vns_netsoc_shared_sel;
assign soc_netsoc_bus_wishbone_stb = vns_netsoc_shared_stb;
assign soc_netsoc_bus_wishbone_we = vns_netsoc_shared_we;
assign soc_netsoc_bus_wishbone_cti = vns_netsoc_shared_cti;
assign soc_netsoc_bus_wishbone_bte = vns_netsoc_shared_bte;
assign soc_emulator_ram_bus_adr = vns_netsoc_shared_adr;
assign soc_emulator_ram_bus_dat_w = vns_netsoc_shared_dat_w;
assign soc_emulator_ram_bus_sel = vns_netsoc_shared_sel;
assign soc_emulator_ram_bus_stb = vns_netsoc_shared_stb;
assign soc_emulator_ram_bus_we = vns_netsoc_shared_we;
assign soc_emulator_ram_bus_cti = vns_netsoc_shared_cti;
assign soc_emulator_ram_bus_bte = vns_netsoc_shared_bte;
assign soc_netsoc_interface1_wb_sdram_adr = vns_netsoc_shared_adr;
assign soc_netsoc_interface1_wb_sdram_dat_w = vns_netsoc_shared_dat_w;
assign soc_netsoc_interface1_wb_sdram_sel = vns_netsoc_shared_sel;
assign soc_netsoc_interface1_wb_sdram_stb = vns_netsoc_shared_stb;
assign soc_netsoc_interface1_wb_sdram_we = vns_netsoc_shared_we;
assign soc_netsoc_interface1_wb_sdram_cti = vns_netsoc_shared_cti;
assign soc_netsoc_interface1_wb_sdram_bte = vns_netsoc_shared_bte;
assign soc_bus_adr = vns_netsoc_shared_adr;
assign soc_bus_dat_w = vns_netsoc_shared_dat_w;
assign soc_bus_sel = vns_netsoc_shared_sel;
assign soc_bus_stb = vns_netsoc_shared_stb;
assign soc_bus_we = vns_netsoc_shared_we;
assign soc_bus_cti = vns_netsoc_shared_cti;
assign soc_bus_bte = vns_netsoc_shared_bte;
assign soc_netsoc_rom_bus_cyc = (vns_netsoc_shared_cyc & vns_netsoc_slave_sel[0]);
assign soc_netsoc_sram_bus_cyc = (vns_netsoc_shared_cyc & vns_netsoc_slave_sel[1]);
assign soc_netsoc_bus_wishbone_cyc = (vns_netsoc_shared_cyc & vns_netsoc_slave_sel[2]);
assign soc_emulator_ram_bus_cyc = (vns_netsoc_shared_cyc & vns_netsoc_slave_sel[3]);
assign soc_netsoc_interface1_wb_sdram_cyc = (vns_netsoc_shared_cyc & vns_netsoc_slave_sel[4]);
assign soc_bus_cyc = (vns_netsoc_shared_cyc & vns_netsoc_slave_sel[5]);
assign vns_netsoc_shared_err = (((((soc_netsoc_rom_bus_err | soc_netsoc_sram_bus_err) | soc_netsoc_bus_wishbone_err) | soc_emulator_ram_bus_err) | soc_netsoc_interface1_wb_sdram_err) | soc_bus_err);
assign vns_netsoc_wait = ((vns_netsoc_shared_stb & vns_netsoc_shared_cyc) & (~vns_netsoc_shared_ack));
always @(*) begin
	vns_netsoc_error <= 1'd0;
	vns_netsoc_shared_ack <= 1'd0;
	vns_netsoc_shared_dat_r <= 32'd0;
	vns_netsoc_shared_ack <= (((((soc_netsoc_rom_bus_ack | soc_netsoc_sram_bus_ack) | soc_netsoc_bus_wishbone_ack) | soc_emulator_ram_bus_ack) | soc_netsoc_interface1_wb_sdram_ack) | soc_bus_ack);
	vns_netsoc_shared_dat_r <= (((((({32{vns_netsoc_slave_sel_r[0]}} & soc_netsoc_rom_bus_dat_r) | ({32{vns_netsoc_slave_sel_r[1]}} & soc_netsoc_sram_bus_dat_r)) | ({32{vns_netsoc_slave_sel_r[2]}} & soc_netsoc_bus_wishbone_dat_r)) | ({32{vns_netsoc_slave_sel_r[3]}} & soc_emulator_ram_bus_dat_r)) | ({32{vns_netsoc_slave_sel_r[4]}} & soc_netsoc_interface1_wb_sdram_dat_r)) | ({32{vns_netsoc_slave_sel_r[5]}} & soc_bus_dat_r));
	if (vns_netsoc_done) begin
		vns_netsoc_shared_dat_r <= 32'd4294967295;
		vns_netsoc_shared_ack <= 1'd1;
		vns_netsoc_error <= 1'd1;
	end
end
assign vns_netsoc_done = (vns_netsoc_count == 1'd0);
assign vns_netsoc_csrbankarray_csrbank0_sel = (vns_netsoc_csrbankarray_interface0_bank_bus_adr[13:9] == 1'd1);
assign soc_netsoc_cpu_latch_r = vns_netsoc_csrbankarray_interface0_bank_bus_dat_w[0];
assign soc_netsoc_cpu_latch_re = ((vns_netsoc_csrbankarray_csrbank0_sel & vns_netsoc_csrbankarray_interface0_bank_bus_we) & (vns_netsoc_csrbankarray_interface0_bank_bus_adr[4:0] == 1'd0));
assign soc_netsoc_cpu_latch_we = ((vns_netsoc_csrbankarray_csrbank0_sel & (~vns_netsoc_csrbankarray_interface0_bank_bus_we)) & (vns_netsoc_csrbankarray_interface0_bank_bus_adr[4:0] == 1'd0));
assign vns_netsoc_csrbankarray_csrbank0_timer_time7_r = vns_netsoc_csrbankarray_interface0_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank0_timer_time7_re = ((vns_netsoc_csrbankarray_csrbank0_sel & vns_netsoc_csrbankarray_interface0_bank_bus_we) & (vns_netsoc_csrbankarray_interface0_bank_bus_adr[4:0] == 1'd1));
assign vns_netsoc_csrbankarray_csrbank0_timer_time7_we = ((vns_netsoc_csrbankarray_csrbank0_sel & (~vns_netsoc_csrbankarray_interface0_bank_bus_we)) & (vns_netsoc_csrbankarray_interface0_bank_bus_adr[4:0] == 1'd1));
assign vns_netsoc_csrbankarray_csrbank0_timer_time6_r = vns_netsoc_csrbankarray_interface0_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank0_timer_time6_re = ((vns_netsoc_csrbankarray_csrbank0_sel & vns_netsoc_csrbankarray_interface0_bank_bus_we) & (vns_netsoc_csrbankarray_interface0_bank_bus_adr[4:0] == 2'd2));
assign vns_netsoc_csrbankarray_csrbank0_timer_time6_we = ((vns_netsoc_csrbankarray_csrbank0_sel & (~vns_netsoc_csrbankarray_interface0_bank_bus_we)) & (vns_netsoc_csrbankarray_interface0_bank_bus_adr[4:0] == 2'd2));
assign vns_netsoc_csrbankarray_csrbank0_timer_time5_r = vns_netsoc_csrbankarray_interface0_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank0_timer_time5_re = ((vns_netsoc_csrbankarray_csrbank0_sel & vns_netsoc_csrbankarray_interface0_bank_bus_we) & (vns_netsoc_csrbankarray_interface0_bank_bus_adr[4:0] == 2'd3));
assign vns_netsoc_csrbankarray_csrbank0_timer_time5_we = ((vns_netsoc_csrbankarray_csrbank0_sel & (~vns_netsoc_csrbankarray_interface0_bank_bus_we)) & (vns_netsoc_csrbankarray_interface0_bank_bus_adr[4:0] == 2'd3));
assign vns_netsoc_csrbankarray_csrbank0_timer_time4_r = vns_netsoc_csrbankarray_interface0_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank0_timer_time4_re = ((vns_netsoc_csrbankarray_csrbank0_sel & vns_netsoc_csrbankarray_interface0_bank_bus_we) & (vns_netsoc_csrbankarray_interface0_bank_bus_adr[4:0] == 3'd4));
assign vns_netsoc_csrbankarray_csrbank0_timer_time4_we = ((vns_netsoc_csrbankarray_csrbank0_sel & (~vns_netsoc_csrbankarray_interface0_bank_bus_we)) & (vns_netsoc_csrbankarray_interface0_bank_bus_adr[4:0] == 3'd4));
assign vns_netsoc_csrbankarray_csrbank0_timer_time3_r = vns_netsoc_csrbankarray_interface0_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank0_timer_time3_re = ((vns_netsoc_csrbankarray_csrbank0_sel & vns_netsoc_csrbankarray_interface0_bank_bus_we) & (vns_netsoc_csrbankarray_interface0_bank_bus_adr[4:0] == 3'd5));
assign vns_netsoc_csrbankarray_csrbank0_timer_time3_we = ((vns_netsoc_csrbankarray_csrbank0_sel & (~vns_netsoc_csrbankarray_interface0_bank_bus_we)) & (vns_netsoc_csrbankarray_interface0_bank_bus_adr[4:0] == 3'd5));
assign vns_netsoc_csrbankarray_csrbank0_timer_time2_r = vns_netsoc_csrbankarray_interface0_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank0_timer_time2_re = ((vns_netsoc_csrbankarray_csrbank0_sel & vns_netsoc_csrbankarray_interface0_bank_bus_we) & (vns_netsoc_csrbankarray_interface0_bank_bus_adr[4:0] == 3'd6));
assign vns_netsoc_csrbankarray_csrbank0_timer_time2_we = ((vns_netsoc_csrbankarray_csrbank0_sel & (~vns_netsoc_csrbankarray_interface0_bank_bus_we)) & (vns_netsoc_csrbankarray_interface0_bank_bus_adr[4:0] == 3'd6));
assign vns_netsoc_csrbankarray_csrbank0_timer_time1_r = vns_netsoc_csrbankarray_interface0_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank0_timer_time1_re = ((vns_netsoc_csrbankarray_csrbank0_sel & vns_netsoc_csrbankarray_interface0_bank_bus_we) & (vns_netsoc_csrbankarray_interface0_bank_bus_adr[4:0] == 3'd7));
assign vns_netsoc_csrbankarray_csrbank0_timer_time1_we = ((vns_netsoc_csrbankarray_csrbank0_sel & (~vns_netsoc_csrbankarray_interface0_bank_bus_we)) & (vns_netsoc_csrbankarray_interface0_bank_bus_adr[4:0] == 3'd7));
assign vns_netsoc_csrbankarray_csrbank0_timer_time0_r = vns_netsoc_csrbankarray_interface0_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank0_timer_time0_re = ((vns_netsoc_csrbankarray_csrbank0_sel & vns_netsoc_csrbankarray_interface0_bank_bus_we) & (vns_netsoc_csrbankarray_interface0_bank_bus_adr[4:0] == 4'd8));
assign vns_netsoc_csrbankarray_csrbank0_timer_time0_we = ((vns_netsoc_csrbankarray_csrbank0_sel & (~vns_netsoc_csrbankarray_interface0_bank_bus_we)) & (vns_netsoc_csrbankarray_interface0_bank_bus_adr[4:0] == 4'd8));
assign vns_netsoc_csrbankarray_csrbank0_timer_time_cmp7_r = vns_netsoc_csrbankarray_interface0_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank0_timer_time_cmp7_re = ((vns_netsoc_csrbankarray_csrbank0_sel & vns_netsoc_csrbankarray_interface0_bank_bus_we) & (vns_netsoc_csrbankarray_interface0_bank_bus_adr[4:0] == 4'd9));
assign vns_netsoc_csrbankarray_csrbank0_timer_time_cmp7_we = ((vns_netsoc_csrbankarray_csrbank0_sel & (~vns_netsoc_csrbankarray_interface0_bank_bus_we)) & (vns_netsoc_csrbankarray_interface0_bank_bus_adr[4:0] == 4'd9));
assign vns_netsoc_csrbankarray_csrbank0_timer_time_cmp6_r = vns_netsoc_csrbankarray_interface0_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank0_timer_time_cmp6_re = ((vns_netsoc_csrbankarray_csrbank0_sel & vns_netsoc_csrbankarray_interface0_bank_bus_we) & (vns_netsoc_csrbankarray_interface0_bank_bus_adr[4:0] == 4'd10));
assign vns_netsoc_csrbankarray_csrbank0_timer_time_cmp6_we = ((vns_netsoc_csrbankarray_csrbank0_sel & (~vns_netsoc_csrbankarray_interface0_bank_bus_we)) & (vns_netsoc_csrbankarray_interface0_bank_bus_adr[4:0] == 4'd10));
assign vns_netsoc_csrbankarray_csrbank0_timer_time_cmp5_r = vns_netsoc_csrbankarray_interface0_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank0_timer_time_cmp5_re = ((vns_netsoc_csrbankarray_csrbank0_sel & vns_netsoc_csrbankarray_interface0_bank_bus_we) & (vns_netsoc_csrbankarray_interface0_bank_bus_adr[4:0] == 4'd11));
assign vns_netsoc_csrbankarray_csrbank0_timer_time_cmp5_we = ((vns_netsoc_csrbankarray_csrbank0_sel & (~vns_netsoc_csrbankarray_interface0_bank_bus_we)) & (vns_netsoc_csrbankarray_interface0_bank_bus_adr[4:0] == 4'd11));
assign vns_netsoc_csrbankarray_csrbank0_timer_time_cmp4_r = vns_netsoc_csrbankarray_interface0_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank0_timer_time_cmp4_re = ((vns_netsoc_csrbankarray_csrbank0_sel & vns_netsoc_csrbankarray_interface0_bank_bus_we) & (vns_netsoc_csrbankarray_interface0_bank_bus_adr[4:0] == 4'd12));
assign vns_netsoc_csrbankarray_csrbank0_timer_time_cmp4_we = ((vns_netsoc_csrbankarray_csrbank0_sel & (~vns_netsoc_csrbankarray_interface0_bank_bus_we)) & (vns_netsoc_csrbankarray_interface0_bank_bus_adr[4:0] == 4'd12));
assign vns_netsoc_csrbankarray_csrbank0_timer_time_cmp3_r = vns_netsoc_csrbankarray_interface0_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank0_timer_time_cmp3_re = ((vns_netsoc_csrbankarray_csrbank0_sel & vns_netsoc_csrbankarray_interface0_bank_bus_we) & (vns_netsoc_csrbankarray_interface0_bank_bus_adr[4:0] == 4'd13));
assign vns_netsoc_csrbankarray_csrbank0_timer_time_cmp3_we = ((vns_netsoc_csrbankarray_csrbank0_sel & (~vns_netsoc_csrbankarray_interface0_bank_bus_we)) & (vns_netsoc_csrbankarray_interface0_bank_bus_adr[4:0] == 4'd13));
assign vns_netsoc_csrbankarray_csrbank0_timer_time_cmp2_r = vns_netsoc_csrbankarray_interface0_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank0_timer_time_cmp2_re = ((vns_netsoc_csrbankarray_csrbank0_sel & vns_netsoc_csrbankarray_interface0_bank_bus_we) & (vns_netsoc_csrbankarray_interface0_bank_bus_adr[4:0] == 4'd14));
assign vns_netsoc_csrbankarray_csrbank0_timer_time_cmp2_we = ((vns_netsoc_csrbankarray_csrbank0_sel & (~vns_netsoc_csrbankarray_interface0_bank_bus_we)) & (vns_netsoc_csrbankarray_interface0_bank_bus_adr[4:0] == 4'd14));
assign vns_netsoc_csrbankarray_csrbank0_timer_time_cmp1_r = vns_netsoc_csrbankarray_interface0_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank0_timer_time_cmp1_re = ((vns_netsoc_csrbankarray_csrbank0_sel & vns_netsoc_csrbankarray_interface0_bank_bus_we) & (vns_netsoc_csrbankarray_interface0_bank_bus_adr[4:0] == 4'd15));
assign vns_netsoc_csrbankarray_csrbank0_timer_time_cmp1_we = ((vns_netsoc_csrbankarray_csrbank0_sel & (~vns_netsoc_csrbankarray_interface0_bank_bus_we)) & (vns_netsoc_csrbankarray_interface0_bank_bus_adr[4:0] == 4'd15));
assign vns_netsoc_csrbankarray_csrbank0_timer_time_cmp0_r = vns_netsoc_csrbankarray_interface0_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank0_timer_time_cmp0_re = ((vns_netsoc_csrbankarray_csrbank0_sel & vns_netsoc_csrbankarray_interface0_bank_bus_we) & (vns_netsoc_csrbankarray_interface0_bank_bus_adr[4:0] == 5'd16));
assign vns_netsoc_csrbankarray_csrbank0_timer_time_cmp0_we = ((vns_netsoc_csrbankarray_csrbank0_sel & (~vns_netsoc_csrbankarray_interface0_bank_bus_we)) & (vns_netsoc_csrbankarray_interface0_bank_bus_adr[4:0] == 5'd16));
assign vns_netsoc_csrbankarray_csrbank0_timer_time7_w = soc_netsoc_cpu_time_status[63:56];
assign vns_netsoc_csrbankarray_csrbank0_timer_time6_w = soc_netsoc_cpu_time_status[55:48];
assign vns_netsoc_csrbankarray_csrbank0_timer_time5_w = soc_netsoc_cpu_time_status[47:40];
assign vns_netsoc_csrbankarray_csrbank0_timer_time4_w = soc_netsoc_cpu_time_status[39:32];
assign vns_netsoc_csrbankarray_csrbank0_timer_time3_w = soc_netsoc_cpu_time_status[31:24];
assign vns_netsoc_csrbankarray_csrbank0_timer_time2_w = soc_netsoc_cpu_time_status[23:16];
assign vns_netsoc_csrbankarray_csrbank0_timer_time1_w = soc_netsoc_cpu_time_status[15:8];
assign vns_netsoc_csrbankarray_csrbank0_timer_time0_w = soc_netsoc_cpu_time_status[7:0];
assign soc_netsoc_cpu_time_we = vns_netsoc_csrbankarray_csrbank0_timer_time0_we;
assign vns_netsoc_csrbankarray_csrbank0_timer_time_cmp7_w = soc_netsoc_cpu_time_cmp_storage[63:56];
assign vns_netsoc_csrbankarray_csrbank0_timer_time_cmp6_w = soc_netsoc_cpu_time_cmp_storage[55:48];
assign vns_netsoc_csrbankarray_csrbank0_timer_time_cmp5_w = soc_netsoc_cpu_time_cmp_storage[47:40];
assign vns_netsoc_csrbankarray_csrbank0_timer_time_cmp4_w = soc_netsoc_cpu_time_cmp_storage[39:32];
assign vns_netsoc_csrbankarray_csrbank0_timer_time_cmp3_w = soc_netsoc_cpu_time_cmp_storage[31:24];
assign vns_netsoc_csrbankarray_csrbank0_timer_time_cmp2_w = soc_netsoc_cpu_time_cmp_storage[23:16];
assign vns_netsoc_csrbankarray_csrbank0_timer_time_cmp1_w = soc_netsoc_cpu_time_cmp_storage[15:8];
assign vns_netsoc_csrbankarray_csrbank0_timer_time_cmp0_w = soc_netsoc_cpu_time_cmp_storage[7:0];
assign vns_netsoc_csrbankarray_csrbank1_sel = (vns_netsoc_csrbankarray_interface1_bank_bus_adr[13:9] == 1'd0);
assign soc_netsoc_ctrl_reset_reset_r = vns_netsoc_csrbankarray_interface1_bank_bus_dat_w[0];
assign soc_netsoc_ctrl_reset_reset_re = ((vns_netsoc_csrbankarray_csrbank1_sel & vns_netsoc_csrbankarray_interface1_bank_bus_we) & (vns_netsoc_csrbankarray_interface1_bank_bus_adr[3:0] == 1'd0));
assign soc_netsoc_ctrl_reset_reset_we = ((vns_netsoc_csrbankarray_csrbank1_sel & (~vns_netsoc_csrbankarray_interface1_bank_bus_we)) & (vns_netsoc_csrbankarray_interface1_bank_bus_adr[3:0] == 1'd0));
assign vns_netsoc_csrbankarray_csrbank1_scratch3_r = vns_netsoc_csrbankarray_interface1_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank1_scratch3_re = ((vns_netsoc_csrbankarray_csrbank1_sel & vns_netsoc_csrbankarray_interface1_bank_bus_we) & (vns_netsoc_csrbankarray_interface1_bank_bus_adr[3:0] == 1'd1));
assign vns_netsoc_csrbankarray_csrbank1_scratch3_we = ((vns_netsoc_csrbankarray_csrbank1_sel & (~vns_netsoc_csrbankarray_interface1_bank_bus_we)) & (vns_netsoc_csrbankarray_interface1_bank_bus_adr[3:0] == 1'd1));
assign vns_netsoc_csrbankarray_csrbank1_scratch2_r = vns_netsoc_csrbankarray_interface1_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank1_scratch2_re = ((vns_netsoc_csrbankarray_csrbank1_sel & vns_netsoc_csrbankarray_interface1_bank_bus_we) & (vns_netsoc_csrbankarray_interface1_bank_bus_adr[3:0] == 2'd2));
assign vns_netsoc_csrbankarray_csrbank1_scratch2_we = ((vns_netsoc_csrbankarray_csrbank1_sel & (~vns_netsoc_csrbankarray_interface1_bank_bus_we)) & (vns_netsoc_csrbankarray_interface1_bank_bus_adr[3:0] == 2'd2));
assign vns_netsoc_csrbankarray_csrbank1_scratch1_r = vns_netsoc_csrbankarray_interface1_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank1_scratch1_re = ((vns_netsoc_csrbankarray_csrbank1_sel & vns_netsoc_csrbankarray_interface1_bank_bus_we) & (vns_netsoc_csrbankarray_interface1_bank_bus_adr[3:0] == 2'd3));
assign vns_netsoc_csrbankarray_csrbank1_scratch1_we = ((vns_netsoc_csrbankarray_csrbank1_sel & (~vns_netsoc_csrbankarray_interface1_bank_bus_we)) & (vns_netsoc_csrbankarray_interface1_bank_bus_adr[3:0] == 2'd3));
assign vns_netsoc_csrbankarray_csrbank1_scratch0_r = vns_netsoc_csrbankarray_interface1_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank1_scratch0_re = ((vns_netsoc_csrbankarray_csrbank1_sel & vns_netsoc_csrbankarray_interface1_bank_bus_we) & (vns_netsoc_csrbankarray_interface1_bank_bus_adr[3:0] == 3'd4));
assign vns_netsoc_csrbankarray_csrbank1_scratch0_we = ((vns_netsoc_csrbankarray_csrbank1_sel & (~vns_netsoc_csrbankarray_interface1_bank_bus_we)) & (vns_netsoc_csrbankarray_interface1_bank_bus_adr[3:0] == 3'd4));
assign vns_netsoc_csrbankarray_csrbank1_bus_errors3_r = vns_netsoc_csrbankarray_interface1_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank1_bus_errors3_re = ((vns_netsoc_csrbankarray_csrbank1_sel & vns_netsoc_csrbankarray_interface1_bank_bus_we) & (vns_netsoc_csrbankarray_interface1_bank_bus_adr[3:0] == 3'd5));
assign vns_netsoc_csrbankarray_csrbank1_bus_errors3_we = ((vns_netsoc_csrbankarray_csrbank1_sel & (~vns_netsoc_csrbankarray_interface1_bank_bus_we)) & (vns_netsoc_csrbankarray_interface1_bank_bus_adr[3:0] == 3'd5));
assign vns_netsoc_csrbankarray_csrbank1_bus_errors2_r = vns_netsoc_csrbankarray_interface1_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank1_bus_errors2_re = ((vns_netsoc_csrbankarray_csrbank1_sel & vns_netsoc_csrbankarray_interface1_bank_bus_we) & (vns_netsoc_csrbankarray_interface1_bank_bus_adr[3:0] == 3'd6));
assign vns_netsoc_csrbankarray_csrbank1_bus_errors2_we = ((vns_netsoc_csrbankarray_csrbank1_sel & (~vns_netsoc_csrbankarray_interface1_bank_bus_we)) & (vns_netsoc_csrbankarray_interface1_bank_bus_adr[3:0] == 3'd6));
assign vns_netsoc_csrbankarray_csrbank1_bus_errors1_r = vns_netsoc_csrbankarray_interface1_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank1_bus_errors1_re = ((vns_netsoc_csrbankarray_csrbank1_sel & vns_netsoc_csrbankarray_interface1_bank_bus_we) & (vns_netsoc_csrbankarray_interface1_bank_bus_adr[3:0] == 3'd7));
assign vns_netsoc_csrbankarray_csrbank1_bus_errors1_we = ((vns_netsoc_csrbankarray_csrbank1_sel & (~vns_netsoc_csrbankarray_interface1_bank_bus_we)) & (vns_netsoc_csrbankarray_interface1_bank_bus_adr[3:0] == 3'd7));
assign vns_netsoc_csrbankarray_csrbank1_bus_errors0_r = vns_netsoc_csrbankarray_interface1_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank1_bus_errors0_re = ((vns_netsoc_csrbankarray_csrbank1_sel & vns_netsoc_csrbankarray_interface1_bank_bus_we) & (vns_netsoc_csrbankarray_interface1_bank_bus_adr[3:0] == 4'd8));
assign vns_netsoc_csrbankarray_csrbank1_bus_errors0_we = ((vns_netsoc_csrbankarray_csrbank1_sel & (~vns_netsoc_csrbankarray_interface1_bank_bus_we)) & (vns_netsoc_csrbankarray_interface1_bank_bus_adr[3:0] == 4'd8));
assign vns_netsoc_csrbankarray_csrbank1_scratch3_w = soc_netsoc_ctrl_storage[31:24];
assign vns_netsoc_csrbankarray_csrbank1_scratch2_w = soc_netsoc_ctrl_storage[23:16];
assign vns_netsoc_csrbankarray_csrbank1_scratch1_w = soc_netsoc_ctrl_storage[15:8];
assign vns_netsoc_csrbankarray_csrbank1_scratch0_w = soc_netsoc_ctrl_storage[7:0];
assign vns_netsoc_csrbankarray_csrbank1_bus_errors3_w = soc_netsoc_ctrl_bus_errors_status[31:24];
assign vns_netsoc_csrbankarray_csrbank1_bus_errors2_w = soc_netsoc_ctrl_bus_errors_status[23:16];
assign vns_netsoc_csrbankarray_csrbank1_bus_errors1_w = soc_netsoc_ctrl_bus_errors_status[15:8];
assign vns_netsoc_csrbankarray_csrbank1_bus_errors0_w = soc_netsoc_ctrl_bus_errors_status[7:0];
assign soc_netsoc_ctrl_bus_errors_we = vns_netsoc_csrbankarray_csrbank1_bus_errors0_we;
assign vns_netsoc_csrbankarray_csrbank2_sel = (vns_netsoc_csrbankarray_interface2_bank_bus_adr[13:9] == 4'd11);
assign vns_netsoc_csrbankarray_csrbank2_half_sys8x_taps0_r = vns_netsoc_csrbankarray_interface2_bank_bus_dat_w[4:0];
assign vns_netsoc_csrbankarray_csrbank2_half_sys8x_taps0_re = ((vns_netsoc_csrbankarray_csrbank2_sel & vns_netsoc_csrbankarray_interface2_bank_bus_we) & (vns_netsoc_csrbankarray_interface2_bank_bus_adr[2:0] == 1'd0));
assign vns_netsoc_csrbankarray_csrbank2_half_sys8x_taps0_we = ((vns_netsoc_csrbankarray_csrbank2_sel & (~vns_netsoc_csrbankarray_interface2_bank_bus_we)) & (vns_netsoc_csrbankarray_interface2_bank_bus_adr[2:0] == 1'd0));
assign soc_a7ddrphy_cdly_rst_r = vns_netsoc_csrbankarray_interface2_bank_bus_dat_w[0];
assign soc_a7ddrphy_cdly_rst_re = ((vns_netsoc_csrbankarray_csrbank2_sel & vns_netsoc_csrbankarray_interface2_bank_bus_we) & (vns_netsoc_csrbankarray_interface2_bank_bus_adr[2:0] == 1'd1));
assign soc_a7ddrphy_cdly_rst_we = ((vns_netsoc_csrbankarray_csrbank2_sel & (~vns_netsoc_csrbankarray_interface2_bank_bus_we)) & (vns_netsoc_csrbankarray_interface2_bank_bus_adr[2:0] == 1'd1));
assign soc_a7ddrphy_cdly_inc_r = vns_netsoc_csrbankarray_interface2_bank_bus_dat_w[0];
assign soc_a7ddrphy_cdly_inc_re = ((vns_netsoc_csrbankarray_csrbank2_sel & vns_netsoc_csrbankarray_interface2_bank_bus_we) & (vns_netsoc_csrbankarray_interface2_bank_bus_adr[2:0] == 2'd2));
assign soc_a7ddrphy_cdly_inc_we = ((vns_netsoc_csrbankarray_csrbank2_sel & (~vns_netsoc_csrbankarray_interface2_bank_bus_we)) & (vns_netsoc_csrbankarray_interface2_bank_bus_adr[2:0] == 2'd2));
assign vns_netsoc_csrbankarray_csrbank2_dly_sel0_r = vns_netsoc_csrbankarray_interface2_bank_bus_dat_w[1:0];
assign vns_netsoc_csrbankarray_csrbank2_dly_sel0_re = ((vns_netsoc_csrbankarray_csrbank2_sel & vns_netsoc_csrbankarray_interface2_bank_bus_we) & (vns_netsoc_csrbankarray_interface2_bank_bus_adr[2:0] == 2'd3));
assign vns_netsoc_csrbankarray_csrbank2_dly_sel0_we = ((vns_netsoc_csrbankarray_csrbank2_sel & (~vns_netsoc_csrbankarray_interface2_bank_bus_we)) & (vns_netsoc_csrbankarray_interface2_bank_bus_adr[2:0] == 2'd3));
assign soc_a7ddrphy_rdly_dq_rst_r = vns_netsoc_csrbankarray_interface2_bank_bus_dat_w[0];
assign soc_a7ddrphy_rdly_dq_rst_re = ((vns_netsoc_csrbankarray_csrbank2_sel & vns_netsoc_csrbankarray_interface2_bank_bus_we) & (vns_netsoc_csrbankarray_interface2_bank_bus_adr[2:0] == 3'd4));
assign soc_a7ddrphy_rdly_dq_rst_we = ((vns_netsoc_csrbankarray_csrbank2_sel & (~vns_netsoc_csrbankarray_interface2_bank_bus_we)) & (vns_netsoc_csrbankarray_interface2_bank_bus_adr[2:0] == 3'd4));
assign soc_a7ddrphy_rdly_dq_inc_r = vns_netsoc_csrbankarray_interface2_bank_bus_dat_w[0];
assign soc_a7ddrphy_rdly_dq_inc_re = ((vns_netsoc_csrbankarray_csrbank2_sel & vns_netsoc_csrbankarray_interface2_bank_bus_we) & (vns_netsoc_csrbankarray_interface2_bank_bus_adr[2:0] == 3'd5));
assign soc_a7ddrphy_rdly_dq_inc_we = ((vns_netsoc_csrbankarray_csrbank2_sel & (~vns_netsoc_csrbankarray_interface2_bank_bus_we)) & (vns_netsoc_csrbankarray_interface2_bank_bus_adr[2:0] == 3'd5));
assign soc_a7ddrphy_rdly_dq_bitslip_rst_r = vns_netsoc_csrbankarray_interface2_bank_bus_dat_w[0];
assign soc_a7ddrphy_rdly_dq_bitslip_rst_re = ((vns_netsoc_csrbankarray_csrbank2_sel & vns_netsoc_csrbankarray_interface2_bank_bus_we) & (vns_netsoc_csrbankarray_interface2_bank_bus_adr[2:0] == 3'd6));
assign soc_a7ddrphy_rdly_dq_bitslip_rst_we = ((vns_netsoc_csrbankarray_csrbank2_sel & (~vns_netsoc_csrbankarray_interface2_bank_bus_we)) & (vns_netsoc_csrbankarray_interface2_bank_bus_adr[2:0] == 3'd6));
assign soc_a7ddrphy_rdly_dq_bitslip_r = vns_netsoc_csrbankarray_interface2_bank_bus_dat_w[0];
assign soc_a7ddrphy_rdly_dq_bitslip_re = ((vns_netsoc_csrbankarray_csrbank2_sel & vns_netsoc_csrbankarray_interface2_bank_bus_we) & (vns_netsoc_csrbankarray_interface2_bank_bus_adr[2:0] == 3'd7));
assign soc_a7ddrphy_rdly_dq_bitslip_we = ((vns_netsoc_csrbankarray_csrbank2_sel & (~vns_netsoc_csrbankarray_interface2_bank_bus_we)) & (vns_netsoc_csrbankarray_interface2_bank_bus_adr[2:0] == 3'd7));
assign vns_netsoc_csrbankarray_csrbank2_half_sys8x_taps0_w = soc_a7ddrphy_half_sys8x_taps_storage[4:0];
assign vns_netsoc_csrbankarray_csrbank2_dly_sel0_w = soc_a7ddrphy_dly_sel_storage[1:0];
assign vns_netsoc_csrbankarray_csrbank3_sel = (vns_netsoc_csrbankarray_interface3_bank_bus_adr[13:9] == 4'd15);
assign vns_netsoc_csrbankarray_csrbank3_sram_writer_slot_r = vns_netsoc_csrbankarray_interface3_bank_bus_dat_w[0];
assign vns_netsoc_csrbankarray_csrbank3_sram_writer_slot_re = ((vns_netsoc_csrbankarray_csrbank3_sel & vns_netsoc_csrbankarray_interface3_bank_bus_we) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 1'd0));
assign vns_netsoc_csrbankarray_csrbank3_sram_writer_slot_we = ((vns_netsoc_csrbankarray_csrbank3_sel & (~vns_netsoc_csrbankarray_interface3_bank_bus_we)) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 1'd0));
assign vns_netsoc_csrbankarray_csrbank3_sram_writer_length3_r = vns_netsoc_csrbankarray_interface3_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank3_sram_writer_length3_re = ((vns_netsoc_csrbankarray_csrbank3_sel & vns_netsoc_csrbankarray_interface3_bank_bus_we) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 1'd1));
assign vns_netsoc_csrbankarray_csrbank3_sram_writer_length3_we = ((vns_netsoc_csrbankarray_csrbank3_sel & (~vns_netsoc_csrbankarray_interface3_bank_bus_we)) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 1'd1));
assign vns_netsoc_csrbankarray_csrbank3_sram_writer_length2_r = vns_netsoc_csrbankarray_interface3_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank3_sram_writer_length2_re = ((vns_netsoc_csrbankarray_csrbank3_sel & vns_netsoc_csrbankarray_interface3_bank_bus_we) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 2'd2));
assign vns_netsoc_csrbankarray_csrbank3_sram_writer_length2_we = ((vns_netsoc_csrbankarray_csrbank3_sel & (~vns_netsoc_csrbankarray_interface3_bank_bus_we)) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 2'd2));
assign vns_netsoc_csrbankarray_csrbank3_sram_writer_length1_r = vns_netsoc_csrbankarray_interface3_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank3_sram_writer_length1_re = ((vns_netsoc_csrbankarray_csrbank3_sel & vns_netsoc_csrbankarray_interface3_bank_bus_we) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 2'd3));
assign vns_netsoc_csrbankarray_csrbank3_sram_writer_length1_we = ((vns_netsoc_csrbankarray_csrbank3_sel & (~vns_netsoc_csrbankarray_interface3_bank_bus_we)) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 2'd3));
assign vns_netsoc_csrbankarray_csrbank3_sram_writer_length0_r = vns_netsoc_csrbankarray_interface3_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank3_sram_writer_length0_re = ((vns_netsoc_csrbankarray_csrbank3_sel & vns_netsoc_csrbankarray_interface3_bank_bus_we) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 3'd4));
assign vns_netsoc_csrbankarray_csrbank3_sram_writer_length0_we = ((vns_netsoc_csrbankarray_csrbank3_sel & (~vns_netsoc_csrbankarray_interface3_bank_bus_we)) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 3'd4));
assign vns_netsoc_csrbankarray_csrbank3_sram_writer_errors3_r = vns_netsoc_csrbankarray_interface3_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank3_sram_writer_errors3_re = ((vns_netsoc_csrbankarray_csrbank3_sel & vns_netsoc_csrbankarray_interface3_bank_bus_we) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 3'd5));
assign vns_netsoc_csrbankarray_csrbank3_sram_writer_errors3_we = ((vns_netsoc_csrbankarray_csrbank3_sel & (~vns_netsoc_csrbankarray_interface3_bank_bus_we)) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 3'd5));
assign vns_netsoc_csrbankarray_csrbank3_sram_writer_errors2_r = vns_netsoc_csrbankarray_interface3_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank3_sram_writer_errors2_re = ((vns_netsoc_csrbankarray_csrbank3_sel & vns_netsoc_csrbankarray_interface3_bank_bus_we) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 3'd6));
assign vns_netsoc_csrbankarray_csrbank3_sram_writer_errors2_we = ((vns_netsoc_csrbankarray_csrbank3_sel & (~vns_netsoc_csrbankarray_interface3_bank_bus_we)) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 3'd6));
assign vns_netsoc_csrbankarray_csrbank3_sram_writer_errors1_r = vns_netsoc_csrbankarray_interface3_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank3_sram_writer_errors1_re = ((vns_netsoc_csrbankarray_csrbank3_sel & vns_netsoc_csrbankarray_interface3_bank_bus_we) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 3'd7));
assign vns_netsoc_csrbankarray_csrbank3_sram_writer_errors1_we = ((vns_netsoc_csrbankarray_csrbank3_sel & (~vns_netsoc_csrbankarray_interface3_bank_bus_we)) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 3'd7));
assign vns_netsoc_csrbankarray_csrbank3_sram_writer_errors0_r = vns_netsoc_csrbankarray_interface3_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank3_sram_writer_errors0_re = ((vns_netsoc_csrbankarray_csrbank3_sel & vns_netsoc_csrbankarray_interface3_bank_bus_we) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 4'd8));
assign vns_netsoc_csrbankarray_csrbank3_sram_writer_errors0_we = ((vns_netsoc_csrbankarray_csrbank3_sel & (~vns_netsoc_csrbankarray_interface3_bank_bus_we)) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 4'd8));
assign soc_writer_status_r = vns_netsoc_csrbankarray_interface3_bank_bus_dat_w[0];
assign soc_writer_status_re = ((vns_netsoc_csrbankarray_csrbank3_sel & vns_netsoc_csrbankarray_interface3_bank_bus_we) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 4'd9));
assign soc_writer_status_we = ((vns_netsoc_csrbankarray_csrbank3_sel & (~vns_netsoc_csrbankarray_interface3_bank_bus_we)) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 4'd9));
assign soc_writer_pending_r = vns_netsoc_csrbankarray_interface3_bank_bus_dat_w[0];
assign soc_writer_pending_re = ((vns_netsoc_csrbankarray_csrbank3_sel & vns_netsoc_csrbankarray_interface3_bank_bus_we) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 4'd10));
assign soc_writer_pending_we = ((vns_netsoc_csrbankarray_csrbank3_sel & (~vns_netsoc_csrbankarray_interface3_bank_bus_we)) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 4'd10));
assign vns_netsoc_csrbankarray_csrbank3_sram_writer_ev_enable0_r = vns_netsoc_csrbankarray_interface3_bank_bus_dat_w[0];
assign vns_netsoc_csrbankarray_csrbank3_sram_writer_ev_enable0_re = ((vns_netsoc_csrbankarray_csrbank3_sel & vns_netsoc_csrbankarray_interface3_bank_bus_we) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 4'd11));
assign vns_netsoc_csrbankarray_csrbank3_sram_writer_ev_enable0_we = ((vns_netsoc_csrbankarray_csrbank3_sel & (~vns_netsoc_csrbankarray_interface3_bank_bus_we)) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 4'd11));
assign soc_reader_start_r = vns_netsoc_csrbankarray_interface3_bank_bus_dat_w[0];
assign soc_reader_start_re = ((vns_netsoc_csrbankarray_csrbank3_sel & vns_netsoc_csrbankarray_interface3_bank_bus_we) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 4'd12));
assign soc_reader_start_we = ((vns_netsoc_csrbankarray_csrbank3_sel & (~vns_netsoc_csrbankarray_interface3_bank_bus_we)) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 4'd12));
assign vns_netsoc_csrbankarray_csrbank3_sram_reader_ready_r = vns_netsoc_csrbankarray_interface3_bank_bus_dat_w[0];
assign vns_netsoc_csrbankarray_csrbank3_sram_reader_ready_re = ((vns_netsoc_csrbankarray_csrbank3_sel & vns_netsoc_csrbankarray_interface3_bank_bus_we) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 4'd13));
assign vns_netsoc_csrbankarray_csrbank3_sram_reader_ready_we = ((vns_netsoc_csrbankarray_csrbank3_sel & (~vns_netsoc_csrbankarray_interface3_bank_bus_we)) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 4'd13));
assign vns_netsoc_csrbankarray_csrbank3_sram_reader_level_r = vns_netsoc_csrbankarray_interface3_bank_bus_dat_w[1:0];
assign vns_netsoc_csrbankarray_csrbank3_sram_reader_level_re = ((vns_netsoc_csrbankarray_csrbank3_sel & vns_netsoc_csrbankarray_interface3_bank_bus_we) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 4'd14));
assign vns_netsoc_csrbankarray_csrbank3_sram_reader_level_we = ((vns_netsoc_csrbankarray_csrbank3_sel & (~vns_netsoc_csrbankarray_interface3_bank_bus_we)) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 4'd14));
assign vns_netsoc_csrbankarray_csrbank3_sram_reader_slot0_r = vns_netsoc_csrbankarray_interface3_bank_bus_dat_w[0];
assign vns_netsoc_csrbankarray_csrbank3_sram_reader_slot0_re = ((vns_netsoc_csrbankarray_csrbank3_sel & vns_netsoc_csrbankarray_interface3_bank_bus_we) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 4'd15));
assign vns_netsoc_csrbankarray_csrbank3_sram_reader_slot0_we = ((vns_netsoc_csrbankarray_csrbank3_sel & (~vns_netsoc_csrbankarray_interface3_bank_bus_we)) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 4'd15));
assign vns_netsoc_csrbankarray_csrbank3_sram_reader_length1_r = vns_netsoc_csrbankarray_interface3_bank_bus_dat_w[2:0];
assign vns_netsoc_csrbankarray_csrbank3_sram_reader_length1_re = ((vns_netsoc_csrbankarray_csrbank3_sel & vns_netsoc_csrbankarray_interface3_bank_bus_we) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 5'd16));
assign vns_netsoc_csrbankarray_csrbank3_sram_reader_length1_we = ((vns_netsoc_csrbankarray_csrbank3_sel & (~vns_netsoc_csrbankarray_interface3_bank_bus_we)) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 5'd16));
assign vns_netsoc_csrbankarray_csrbank3_sram_reader_length0_r = vns_netsoc_csrbankarray_interface3_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank3_sram_reader_length0_re = ((vns_netsoc_csrbankarray_csrbank3_sel & vns_netsoc_csrbankarray_interface3_bank_bus_we) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 5'd17));
assign vns_netsoc_csrbankarray_csrbank3_sram_reader_length0_we = ((vns_netsoc_csrbankarray_csrbank3_sel & (~vns_netsoc_csrbankarray_interface3_bank_bus_we)) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 5'd17));
assign soc_reader_eventmanager_status_r = vns_netsoc_csrbankarray_interface3_bank_bus_dat_w[0];
assign soc_reader_eventmanager_status_re = ((vns_netsoc_csrbankarray_csrbank3_sel & vns_netsoc_csrbankarray_interface3_bank_bus_we) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 5'd18));
assign soc_reader_eventmanager_status_we = ((vns_netsoc_csrbankarray_csrbank3_sel & (~vns_netsoc_csrbankarray_interface3_bank_bus_we)) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 5'd18));
assign soc_reader_eventmanager_pending_r = vns_netsoc_csrbankarray_interface3_bank_bus_dat_w[0];
assign soc_reader_eventmanager_pending_re = ((vns_netsoc_csrbankarray_csrbank3_sel & vns_netsoc_csrbankarray_interface3_bank_bus_we) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 5'd19));
assign soc_reader_eventmanager_pending_we = ((vns_netsoc_csrbankarray_csrbank3_sel & (~vns_netsoc_csrbankarray_interface3_bank_bus_we)) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 5'd19));
assign vns_netsoc_csrbankarray_csrbank3_sram_reader_ev_enable0_r = vns_netsoc_csrbankarray_interface3_bank_bus_dat_w[0];
assign vns_netsoc_csrbankarray_csrbank3_sram_reader_ev_enable0_re = ((vns_netsoc_csrbankarray_csrbank3_sel & vns_netsoc_csrbankarray_interface3_bank_bus_we) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 5'd20));
assign vns_netsoc_csrbankarray_csrbank3_sram_reader_ev_enable0_we = ((vns_netsoc_csrbankarray_csrbank3_sel & (~vns_netsoc_csrbankarray_interface3_bank_bus_we)) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 5'd20));
assign vns_netsoc_csrbankarray_csrbank3_preamble_crc_r = vns_netsoc_csrbankarray_interface3_bank_bus_dat_w[0];
assign vns_netsoc_csrbankarray_csrbank3_preamble_crc_re = ((vns_netsoc_csrbankarray_csrbank3_sel & vns_netsoc_csrbankarray_interface3_bank_bus_we) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 5'd21));
assign vns_netsoc_csrbankarray_csrbank3_preamble_crc_we = ((vns_netsoc_csrbankarray_csrbank3_sel & (~vns_netsoc_csrbankarray_interface3_bank_bus_we)) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 5'd21));
assign vns_netsoc_csrbankarray_csrbank3_preamble_errors3_r = vns_netsoc_csrbankarray_interface3_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank3_preamble_errors3_re = ((vns_netsoc_csrbankarray_csrbank3_sel & vns_netsoc_csrbankarray_interface3_bank_bus_we) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 5'd22));
assign vns_netsoc_csrbankarray_csrbank3_preamble_errors3_we = ((vns_netsoc_csrbankarray_csrbank3_sel & (~vns_netsoc_csrbankarray_interface3_bank_bus_we)) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 5'd22));
assign vns_netsoc_csrbankarray_csrbank3_preamble_errors2_r = vns_netsoc_csrbankarray_interface3_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank3_preamble_errors2_re = ((vns_netsoc_csrbankarray_csrbank3_sel & vns_netsoc_csrbankarray_interface3_bank_bus_we) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 5'd23));
assign vns_netsoc_csrbankarray_csrbank3_preamble_errors2_we = ((vns_netsoc_csrbankarray_csrbank3_sel & (~vns_netsoc_csrbankarray_interface3_bank_bus_we)) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 5'd23));
assign vns_netsoc_csrbankarray_csrbank3_preamble_errors1_r = vns_netsoc_csrbankarray_interface3_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank3_preamble_errors1_re = ((vns_netsoc_csrbankarray_csrbank3_sel & vns_netsoc_csrbankarray_interface3_bank_bus_we) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 5'd24));
assign vns_netsoc_csrbankarray_csrbank3_preamble_errors1_we = ((vns_netsoc_csrbankarray_csrbank3_sel & (~vns_netsoc_csrbankarray_interface3_bank_bus_we)) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 5'd24));
assign vns_netsoc_csrbankarray_csrbank3_preamble_errors0_r = vns_netsoc_csrbankarray_interface3_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank3_preamble_errors0_re = ((vns_netsoc_csrbankarray_csrbank3_sel & vns_netsoc_csrbankarray_interface3_bank_bus_we) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 5'd25));
assign vns_netsoc_csrbankarray_csrbank3_preamble_errors0_we = ((vns_netsoc_csrbankarray_csrbank3_sel & (~vns_netsoc_csrbankarray_interface3_bank_bus_we)) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 5'd25));
assign vns_netsoc_csrbankarray_csrbank3_crc_errors3_r = vns_netsoc_csrbankarray_interface3_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank3_crc_errors3_re = ((vns_netsoc_csrbankarray_csrbank3_sel & vns_netsoc_csrbankarray_interface3_bank_bus_we) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 5'd26));
assign vns_netsoc_csrbankarray_csrbank3_crc_errors3_we = ((vns_netsoc_csrbankarray_csrbank3_sel & (~vns_netsoc_csrbankarray_interface3_bank_bus_we)) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 5'd26));
assign vns_netsoc_csrbankarray_csrbank3_crc_errors2_r = vns_netsoc_csrbankarray_interface3_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank3_crc_errors2_re = ((vns_netsoc_csrbankarray_csrbank3_sel & vns_netsoc_csrbankarray_interface3_bank_bus_we) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 5'd27));
assign vns_netsoc_csrbankarray_csrbank3_crc_errors2_we = ((vns_netsoc_csrbankarray_csrbank3_sel & (~vns_netsoc_csrbankarray_interface3_bank_bus_we)) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 5'd27));
assign vns_netsoc_csrbankarray_csrbank3_crc_errors1_r = vns_netsoc_csrbankarray_interface3_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank3_crc_errors1_re = ((vns_netsoc_csrbankarray_csrbank3_sel & vns_netsoc_csrbankarray_interface3_bank_bus_we) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 5'd28));
assign vns_netsoc_csrbankarray_csrbank3_crc_errors1_we = ((vns_netsoc_csrbankarray_csrbank3_sel & (~vns_netsoc_csrbankarray_interface3_bank_bus_we)) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 5'd28));
assign vns_netsoc_csrbankarray_csrbank3_crc_errors0_r = vns_netsoc_csrbankarray_interface3_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank3_crc_errors0_re = ((vns_netsoc_csrbankarray_csrbank3_sel & vns_netsoc_csrbankarray_interface3_bank_bus_we) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 5'd29));
assign vns_netsoc_csrbankarray_csrbank3_crc_errors0_we = ((vns_netsoc_csrbankarray_csrbank3_sel & (~vns_netsoc_csrbankarray_interface3_bank_bus_we)) & (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0] == 5'd29));
assign vns_netsoc_csrbankarray_csrbank3_sram_writer_slot_w = soc_writer_slot_status;
assign soc_writer_slot_we = vns_netsoc_csrbankarray_csrbank3_sram_writer_slot_we;
assign vns_netsoc_csrbankarray_csrbank3_sram_writer_length3_w = soc_writer_length_status[31:24];
assign vns_netsoc_csrbankarray_csrbank3_sram_writer_length2_w = soc_writer_length_status[23:16];
assign vns_netsoc_csrbankarray_csrbank3_sram_writer_length1_w = soc_writer_length_status[15:8];
assign vns_netsoc_csrbankarray_csrbank3_sram_writer_length0_w = soc_writer_length_status[7:0];
assign soc_writer_length_we = vns_netsoc_csrbankarray_csrbank3_sram_writer_length0_we;
assign vns_netsoc_csrbankarray_csrbank3_sram_writer_errors3_w = soc_writer_errors_status[31:24];
assign vns_netsoc_csrbankarray_csrbank3_sram_writer_errors2_w = soc_writer_errors_status[23:16];
assign vns_netsoc_csrbankarray_csrbank3_sram_writer_errors1_w = soc_writer_errors_status[15:8];
assign vns_netsoc_csrbankarray_csrbank3_sram_writer_errors0_w = soc_writer_errors_status[7:0];
assign soc_writer_errors_we = vns_netsoc_csrbankarray_csrbank3_sram_writer_errors0_we;
assign vns_netsoc_csrbankarray_csrbank3_sram_writer_ev_enable0_w = soc_writer_storage;
assign vns_netsoc_csrbankarray_csrbank3_sram_reader_ready_w = soc_reader_ready_status;
assign soc_reader_ready_we = vns_netsoc_csrbankarray_csrbank3_sram_reader_ready_we;
assign vns_netsoc_csrbankarray_csrbank3_sram_reader_level_w = soc_reader_level_status[1:0];
assign soc_reader_level_we = vns_netsoc_csrbankarray_csrbank3_sram_reader_level_we;
assign vns_netsoc_csrbankarray_csrbank3_sram_reader_slot0_w = soc_reader_slot_storage;
assign vns_netsoc_csrbankarray_csrbank3_sram_reader_length1_w = soc_reader_length_storage[10:8];
assign vns_netsoc_csrbankarray_csrbank3_sram_reader_length0_w = soc_reader_length_storage[7:0];
assign vns_netsoc_csrbankarray_csrbank3_sram_reader_ev_enable0_w = soc_reader_eventmanager_storage;
assign vns_netsoc_csrbankarray_csrbank3_preamble_crc_w = soc_preamble_crc_status;
assign soc_preamble_crc_we = vns_netsoc_csrbankarray_csrbank3_preamble_crc_we;
assign vns_netsoc_csrbankarray_csrbank3_preamble_errors3_w = soc_preamble_errors_status[31:24];
assign vns_netsoc_csrbankarray_csrbank3_preamble_errors2_w = soc_preamble_errors_status[23:16];
assign vns_netsoc_csrbankarray_csrbank3_preamble_errors1_w = soc_preamble_errors_status[15:8];
assign vns_netsoc_csrbankarray_csrbank3_preamble_errors0_w = soc_preamble_errors_status[7:0];
assign soc_preamble_errors_we = vns_netsoc_csrbankarray_csrbank3_preamble_errors0_we;
assign vns_netsoc_csrbankarray_csrbank3_crc_errors3_w = soc_crc_errors_status[31:24];
assign vns_netsoc_csrbankarray_csrbank3_crc_errors2_w = soc_crc_errors_status[23:16];
assign vns_netsoc_csrbankarray_csrbank3_crc_errors1_w = soc_crc_errors_status[15:8];
assign vns_netsoc_csrbankarray_csrbank3_crc_errors0_w = soc_crc_errors_status[7:0];
assign soc_crc_errors_we = vns_netsoc_csrbankarray_csrbank3_crc_errors0_we;
assign vns_netsoc_csrbankarray_csrbank4_sel = (vns_netsoc_csrbankarray_interface4_bank_bus_adr[13:9] == 4'd14);
assign vns_netsoc_csrbankarray_csrbank4_crg_reset0_r = vns_netsoc_csrbankarray_interface4_bank_bus_dat_w[0];
assign vns_netsoc_csrbankarray_csrbank4_crg_reset0_re = ((vns_netsoc_csrbankarray_csrbank4_sel & vns_netsoc_csrbankarray_interface4_bank_bus_we) & (vns_netsoc_csrbankarray_interface4_bank_bus_adr[1:0] == 1'd0));
assign vns_netsoc_csrbankarray_csrbank4_crg_reset0_we = ((vns_netsoc_csrbankarray_csrbank4_sel & (~vns_netsoc_csrbankarray_interface4_bank_bus_we)) & (vns_netsoc_csrbankarray_interface4_bank_bus_adr[1:0] == 1'd0));
assign vns_netsoc_csrbankarray_csrbank4_mdio_w0_r = vns_netsoc_csrbankarray_interface4_bank_bus_dat_w[2:0];
assign vns_netsoc_csrbankarray_csrbank4_mdio_w0_re = ((vns_netsoc_csrbankarray_csrbank4_sel & vns_netsoc_csrbankarray_interface4_bank_bus_we) & (vns_netsoc_csrbankarray_interface4_bank_bus_adr[1:0] == 1'd1));
assign vns_netsoc_csrbankarray_csrbank4_mdio_w0_we = ((vns_netsoc_csrbankarray_csrbank4_sel & (~vns_netsoc_csrbankarray_interface4_bank_bus_we)) & (vns_netsoc_csrbankarray_interface4_bank_bus_adr[1:0] == 1'd1));
assign vns_netsoc_csrbankarray_csrbank4_mdio_r_r = vns_netsoc_csrbankarray_interface4_bank_bus_dat_w[0];
assign vns_netsoc_csrbankarray_csrbank4_mdio_r_re = ((vns_netsoc_csrbankarray_csrbank4_sel & vns_netsoc_csrbankarray_interface4_bank_bus_we) & (vns_netsoc_csrbankarray_interface4_bank_bus_adr[1:0] == 2'd2));
assign vns_netsoc_csrbankarray_csrbank4_mdio_r_we = ((vns_netsoc_csrbankarray_csrbank4_sel & (~vns_netsoc_csrbankarray_interface4_bank_bus_we)) & (vns_netsoc_csrbankarray_interface4_bank_bus_adr[1:0] == 2'd2));
assign vns_netsoc_csrbankarray_csrbank4_crg_reset0_w = soc_reset_storage;
assign soc_mdc = soc_storage[0];
assign soc_oe = soc_storage[1];
assign soc_w = soc_storage[2];
assign vns_netsoc_csrbankarray_csrbank4_mdio_w0_w = soc_storage[2:0];
assign vns_netsoc_csrbankarray_csrbank4_mdio_r_w = soc_status;
assign soc_we = vns_netsoc_csrbankarray_csrbank4_mdio_r_we;
assign vns_netsoc_csrbankarray_sel = (vns_netsoc_csrbankarray_sram_bus_adr[13:9] == 3'd4);
always @(*) begin
	vns_netsoc_csrbankarray_sram_bus_dat_r <= 8'd0;
	if (vns_netsoc_csrbankarray_sel_r) begin
		vns_netsoc_csrbankarray_sram_bus_dat_r <= vns_netsoc_csrbankarray_dat_r;
	end
end
assign vns_netsoc_csrbankarray_adr = vns_netsoc_csrbankarray_sram_bus_adr[2:0];
assign vns_netsoc_csrbankarray_csrbank5_sel = (vns_netsoc_csrbankarray_interface5_bank_bus_adr[13:9] == 4'd8);
assign vns_netsoc_csrbankarray_csrbank5_dfii_control0_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[3:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_control0_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 1'd0));
assign vns_netsoc_csrbankarray_csrbank5_dfii_control0_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 1'd0));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_command0_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[5:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_command0_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 1'd1));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_command0_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 1'd1));
assign soc_netsoc_sdram_phaseinjector0_command_issue_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[0];
assign soc_netsoc_sdram_phaseinjector0_command_issue_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 2'd2));
assign soc_netsoc_sdram_phaseinjector0_command_issue_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 2'd2));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_address1_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[5:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_address1_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 2'd3));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_address1_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 2'd3));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_address0_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_address0_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 3'd4));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_address0_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 3'd4));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_baddress0_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[2:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_baddress0_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 3'd5));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_baddress0_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 3'd5));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata3_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata3_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 3'd6));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata3_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 3'd6));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata2_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata2_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 3'd7));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata2_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 3'd7));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata1_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata1_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 4'd8));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata1_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 4'd8));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata0_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata0_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 4'd9));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata0_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 4'd9));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_rddata3_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_rddata3_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 4'd10));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_rddata3_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 4'd10));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_rddata2_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_rddata2_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 4'd11));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_rddata2_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 4'd11));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_rddata1_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_rddata1_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 4'd12));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_rddata1_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 4'd12));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_rddata0_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_rddata0_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 4'd13));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_rddata0_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 4'd13));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_command0_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[5:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_command0_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 4'd14));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_command0_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 4'd14));
assign soc_netsoc_sdram_phaseinjector1_command_issue_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[0];
assign soc_netsoc_sdram_phaseinjector1_command_issue_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 4'd15));
assign soc_netsoc_sdram_phaseinjector1_command_issue_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 4'd15));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_address1_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[5:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_address1_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 5'd16));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_address1_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 5'd16));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_address0_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_address0_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 5'd17));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_address0_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 5'd17));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_baddress0_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[2:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_baddress0_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 5'd18));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_baddress0_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 5'd18));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata3_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata3_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 5'd19));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata3_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 5'd19));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata2_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata2_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 5'd20));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata2_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 5'd20));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata1_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata1_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 5'd21));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata1_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 5'd21));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata0_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata0_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 5'd22));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata0_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 5'd22));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_rddata3_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_rddata3_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 5'd23));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_rddata3_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 5'd23));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_rddata2_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_rddata2_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 5'd24));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_rddata2_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 5'd24));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_rddata1_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_rddata1_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 5'd25));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_rddata1_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 5'd25));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_rddata0_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_rddata0_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 5'd26));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_rddata0_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 5'd26));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_command0_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[5:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_command0_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 5'd27));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_command0_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 5'd27));
assign soc_netsoc_sdram_phaseinjector2_command_issue_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[0];
assign soc_netsoc_sdram_phaseinjector2_command_issue_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 5'd28));
assign soc_netsoc_sdram_phaseinjector2_command_issue_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 5'd28));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_address1_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[5:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_address1_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 5'd29));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_address1_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 5'd29));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_address0_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_address0_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 5'd30));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_address0_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 5'd30));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_baddress0_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[2:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_baddress0_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 5'd31));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_baddress0_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 5'd31));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata3_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata3_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd32));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata3_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd32));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata2_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata2_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd33));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata2_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd33));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata1_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata1_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd34));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata1_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd34));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata0_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata0_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd35));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata0_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd35));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_rddata3_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_rddata3_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd36));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_rddata3_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd36));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_rddata2_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_rddata2_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd37));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_rddata2_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd37));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_rddata1_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_rddata1_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd38));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_rddata1_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd38));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_rddata0_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_rddata0_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd39));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_rddata0_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd39));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_command0_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[5:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_command0_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd40));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_command0_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd40));
assign soc_netsoc_sdram_phaseinjector3_command_issue_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[0];
assign soc_netsoc_sdram_phaseinjector3_command_issue_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd41));
assign soc_netsoc_sdram_phaseinjector3_command_issue_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd41));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_address1_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[5:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_address1_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd42));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_address1_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd42));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_address0_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_address0_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd43));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_address0_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd43));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_baddress0_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[2:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_baddress0_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd44));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_baddress0_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd44));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata3_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata3_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd45));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata3_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd45));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata2_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata2_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd46));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata2_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd46));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata1_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata1_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd47));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata1_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd47));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata0_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata0_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd48));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata0_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd48));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_rddata3_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_rddata3_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd49));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_rddata3_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd49));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_rddata2_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_rddata2_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd50));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_rddata2_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd50));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_rddata1_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_rddata1_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd51));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_rddata1_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd51));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_rddata0_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_rddata0_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd52));
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_rddata0_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd52));
assign soc_netsoc_sdram_bandwidth_update_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[0];
assign soc_netsoc_sdram_bandwidth_update_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd53));
assign soc_netsoc_sdram_bandwidth_update_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd53));
assign vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nreads2_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nreads2_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd54));
assign vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nreads2_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd54));
assign vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nreads1_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nreads1_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd55));
assign vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nreads1_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd55));
assign vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nreads0_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nreads0_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd56));
assign vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nreads0_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd56));
assign vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nwrites2_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nwrites2_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd57));
assign vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nwrites2_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd57));
assign vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nwrites1_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nwrites1_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd58));
assign vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nwrites1_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd58));
assign vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nwrites0_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nwrites0_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd59));
assign vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nwrites0_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd59));
assign vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_data_width_r = vns_netsoc_csrbankarray_interface5_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_data_width_re = ((vns_netsoc_csrbankarray_csrbank5_sel & vns_netsoc_csrbankarray_interface5_bank_bus_we) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd60));
assign vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_data_width_we = ((vns_netsoc_csrbankarray_csrbank5_sel & (~vns_netsoc_csrbankarray_interface5_bank_bus_we)) & (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0] == 6'd60));
assign vns_netsoc_csrbankarray_csrbank5_dfii_control0_w = soc_netsoc_sdram_storage[3:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_command0_w = soc_netsoc_sdram_phaseinjector0_command_storage[5:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_address1_w = soc_netsoc_sdram_phaseinjector0_address_storage[13:8];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_address0_w = soc_netsoc_sdram_phaseinjector0_address_storage[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_baddress0_w = soc_netsoc_sdram_phaseinjector0_baddress_storage[2:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata3_w = soc_netsoc_sdram_phaseinjector0_wrdata_storage[31:24];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata2_w = soc_netsoc_sdram_phaseinjector0_wrdata_storage[23:16];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata1_w = soc_netsoc_sdram_phaseinjector0_wrdata_storage[15:8];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata0_w = soc_netsoc_sdram_phaseinjector0_wrdata_storage[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_rddata3_w = soc_netsoc_sdram_phaseinjector0_status[31:24];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_rddata2_w = soc_netsoc_sdram_phaseinjector0_status[23:16];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_rddata1_w = soc_netsoc_sdram_phaseinjector0_status[15:8];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi0_rddata0_w = soc_netsoc_sdram_phaseinjector0_status[7:0];
assign soc_netsoc_sdram_phaseinjector0_we = vns_netsoc_csrbankarray_csrbank5_dfii_pi0_rddata0_we;
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_command0_w = soc_netsoc_sdram_phaseinjector1_command_storage[5:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_address1_w = soc_netsoc_sdram_phaseinjector1_address_storage[13:8];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_address0_w = soc_netsoc_sdram_phaseinjector1_address_storage[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_baddress0_w = soc_netsoc_sdram_phaseinjector1_baddress_storage[2:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata3_w = soc_netsoc_sdram_phaseinjector1_wrdata_storage[31:24];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata2_w = soc_netsoc_sdram_phaseinjector1_wrdata_storage[23:16];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata1_w = soc_netsoc_sdram_phaseinjector1_wrdata_storage[15:8];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata0_w = soc_netsoc_sdram_phaseinjector1_wrdata_storage[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_rddata3_w = soc_netsoc_sdram_phaseinjector1_status[31:24];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_rddata2_w = soc_netsoc_sdram_phaseinjector1_status[23:16];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_rddata1_w = soc_netsoc_sdram_phaseinjector1_status[15:8];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi1_rddata0_w = soc_netsoc_sdram_phaseinjector1_status[7:0];
assign soc_netsoc_sdram_phaseinjector1_we = vns_netsoc_csrbankarray_csrbank5_dfii_pi1_rddata0_we;
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_command0_w = soc_netsoc_sdram_phaseinjector2_command_storage[5:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_address1_w = soc_netsoc_sdram_phaseinjector2_address_storage[13:8];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_address0_w = soc_netsoc_sdram_phaseinjector2_address_storage[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_baddress0_w = soc_netsoc_sdram_phaseinjector2_baddress_storage[2:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata3_w = soc_netsoc_sdram_phaseinjector2_wrdata_storage[31:24];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata2_w = soc_netsoc_sdram_phaseinjector2_wrdata_storage[23:16];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata1_w = soc_netsoc_sdram_phaseinjector2_wrdata_storage[15:8];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata0_w = soc_netsoc_sdram_phaseinjector2_wrdata_storage[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_rddata3_w = soc_netsoc_sdram_phaseinjector2_status[31:24];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_rddata2_w = soc_netsoc_sdram_phaseinjector2_status[23:16];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_rddata1_w = soc_netsoc_sdram_phaseinjector2_status[15:8];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi2_rddata0_w = soc_netsoc_sdram_phaseinjector2_status[7:0];
assign soc_netsoc_sdram_phaseinjector2_we = vns_netsoc_csrbankarray_csrbank5_dfii_pi2_rddata0_we;
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_command0_w = soc_netsoc_sdram_phaseinjector3_command_storage[5:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_address1_w = soc_netsoc_sdram_phaseinjector3_address_storage[13:8];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_address0_w = soc_netsoc_sdram_phaseinjector3_address_storage[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_baddress0_w = soc_netsoc_sdram_phaseinjector3_baddress_storage[2:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata3_w = soc_netsoc_sdram_phaseinjector3_wrdata_storage[31:24];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata2_w = soc_netsoc_sdram_phaseinjector3_wrdata_storage[23:16];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata1_w = soc_netsoc_sdram_phaseinjector3_wrdata_storage[15:8];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata0_w = soc_netsoc_sdram_phaseinjector3_wrdata_storage[7:0];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_rddata3_w = soc_netsoc_sdram_phaseinjector3_status[31:24];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_rddata2_w = soc_netsoc_sdram_phaseinjector3_status[23:16];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_rddata1_w = soc_netsoc_sdram_phaseinjector3_status[15:8];
assign vns_netsoc_csrbankarray_csrbank5_dfii_pi3_rddata0_w = soc_netsoc_sdram_phaseinjector3_status[7:0];
assign soc_netsoc_sdram_phaseinjector3_we = vns_netsoc_csrbankarray_csrbank5_dfii_pi3_rddata0_we;
assign vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nreads2_w = soc_netsoc_sdram_bandwidth_nreads_status[23:16];
assign vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nreads1_w = soc_netsoc_sdram_bandwidth_nreads_status[15:8];
assign vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nreads0_w = soc_netsoc_sdram_bandwidth_nreads_status[7:0];
assign soc_netsoc_sdram_bandwidth_nreads_we = vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nreads0_we;
assign vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nwrites2_w = soc_netsoc_sdram_bandwidth_nwrites_status[23:16];
assign vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nwrites1_w = soc_netsoc_sdram_bandwidth_nwrites_status[15:8];
assign vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nwrites0_w = soc_netsoc_sdram_bandwidth_nwrites_status[7:0];
assign soc_netsoc_sdram_bandwidth_nwrites_we = vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nwrites0_we;
assign vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_data_width_w = soc_netsoc_sdram_bandwidth_data_width_status[7:0];
assign soc_netsoc_sdram_bandwidth_data_width_we = vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_data_width_we;
assign vns_netsoc_csrbankarray_csrbank6_sel = (vns_netsoc_csrbankarray_interface6_bank_bus_adr[13:9] == 3'd5);
assign vns_netsoc_csrbankarray_csrbank6_load3_r = vns_netsoc_csrbankarray_interface6_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank6_load3_re = ((vns_netsoc_csrbankarray_csrbank6_sel & vns_netsoc_csrbankarray_interface6_bank_bus_we) & (vns_netsoc_csrbankarray_interface6_bank_bus_adr[4:0] == 1'd0));
assign vns_netsoc_csrbankarray_csrbank6_load3_we = ((vns_netsoc_csrbankarray_csrbank6_sel & (~vns_netsoc_csrbankarray_interface6_bank_bus_we)) & (vns_netsoc_csrbankarray_interface6_bank_bus_adr[4:0] == 1'd0));
assign vns_netsoc_csrbankarray_csrbank6_load2_r = vns_netsoc_csrbankarray_interface6_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank6_load2_re = ((vns_netsoc_csrbankarray_csrbank6_sel & vns_netsoc_csrbankarray_interface6_bank_bus_we) & (vns_netsoc_csrbankarray_interface6_bank_bus_adr[4:0] == 1'd1));
assign vns_netsoc_csrbankarray_csrbank6_load2_we = ((vns_netsoc_csrbankarray_csrbank6_sel & (~vns_netsoc_csrbankarray_interface6_bank_bus_we)) & (vns_netsoc_csrbankarray_interface6_bank_bus_adr[4:0] == 1'd1));
assign vns_netsoc_csrbankarray_csrbank6_load1_r = vns_netsoc_csrbankarray_interface6_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank6_load1_re = ((vns_netsoc_csrbankarray_csrbank6_sel & vns_netsoc_csrbankarray_interface6_bank_bus_we) & (vns_netsoc_csrbankarray_interface6_bank_bus_adr[4:0] == 2'd2));
assign vns_netsoc_csrbankarray_csrbank6_load1_we = ((vns_netsoc_csrbankarray_csrbank6_sel & (~vns_netsoc_csrbankarray_interface6_bank_bus_we)) & (vns_netsoc_csrbankarray_interface6_bank_bus_adr[4:0] == 2'd2));
assign vns_netsoc_csrbankarray_csrbank6_load0_r = vns_netsoc_csrbankarray_interface6_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank6_load0_re = ((vns_netsoc_csrbankarray_csrbank6_sel & vns_netsoc_csrbankarray_interface6_bank_bus_we) & (vns_netsoc_csrbankarray_interface6_bank_bus_adr[4:0] == 2'd3));
assign vns_netsoc_csrbankarray_csrbank6_load0_we = ((vns_netsoc_csrbankarray_csrbank6_sel & (~vns_netsoc_csrbankarray_interface6_bank_bus_we)) & (vns_netsoc_csrbankarray_interface6_bank_bus_adr[4:0] == 2'd3));
assign vns_netsoc_csrbankarray_csrbank6_reload3_r = vns_netsoc_csrbankarray_interface6_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank6_reload3_re = ((vns_netsoc_csrbankarray_csrbank6_sel & vns_netsoc_csrbankarray_interface6_bank_bus_we) & (vns_netsoc_csrbankarray_interface6_bank_bus_adr[4:0] == 3'd4));
assign vns_netsoc_csrbankarray_csrbank6_reload3_we = ((vns_netsoc_csrbankarray_csrbank6_sel & (~vns_netsoc_csrbankarray_interface6_bank_bus_we)) & (vns_netsoc_csrbankarray_interface6_bank_bus_adr[4:0] == 3'd4));
assign vns_netsoc_csrbankarray_csrbank6_reload2_r = vns_netsoc_csrbankarray_interface6_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank6_reload2_re = ((vns_netsoc_csrbankarray_csrbank6_sel & vns_netsoc_csrbankarray_interface6_bank_bus_we) & (vns_netsoc_csrbankarray_interface6_bank_bus_adr[4:0] == 3'd5));
assign vns_netsoc_csrbankarray_csrbank6_reload2_we = ((vns_netsoc_csrbankarray_csrbank6_sel & (~vns_netsoc_csrbankarray_interface6_bank_bus_we)) & (vns_netsoc_csrbankarray_interface6_bank_bus_adr[4:0] == 3'd5));
assign vns_netsoc_csrbankarray_csrbank6_reload1_r = vns_netsoc_csrbankarray_interface6_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank6_reload1_re = ((vns_netsoc_csrbankarray_csrbank6_sel & vns_netsoc_csrbankarray_interface6_bank_bus_we) & (vns_netsoc_csrbankarray_interface6_bank_bus_adr[4:0] == 3'd6));
assign vns_netsoc_csrbankarray_csrbank6_reload1_we = ((vns_netsoc_csrbankarray_csrbank6_sel & (~vns_netsoc_csrbankarray_interface6_bank_bus_we)) & (vns_netsoc_csrbankarray_interface6_bank_bus_adr[4:0] == 3'd6));
assign vns_netsoc_csrbankarray_csrbank6_reload0_r = vns_netsoc_csrbankarray_interface6_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank6_reload0_re = ((vns_netsoc_csrbankarray_csrbank6_sel & vns_netsoc_csrbankarray_interface6_bank_bus_we) & (vns_netsoc_csrbankarray_interface6_bank_bus_adr[4:0] == 3'd7));
assign vns_netsoc_csrbankarray_csrbank6_reload0_we = ((vns_netsoc_csrbankarray_csrbank6_sel & (~vns_netsoc_csrbankarray_interface6_bank_bus_we)) & (vns_netsoc_csrbankarray_interface6_bank_bus_adr[4:0] == 3'd7));
assign vns_netsoc_csrbankarray_csrbank6_en0_r = vns_netsoc_csrbankarray_interface6_bank_bus_dat_w[0];
assign vns_netsoc_csrbankarray_csrbank6_en0_re = ((vns_netsoc_csrbankarray_csrbank6_sel & vns_netsoc_csrbankarray_interface6_bank_bus_we) & (vns_netsoc_csrbankarray_interface6_bank_bus_adr[4:0] == 4'd8));
assign vns_netsoc_csrbankarray_csrbank6_en0_we = ((vns_netsoc_csrbankarray_csrbank6_sel & (~vns_netsoc_csrbankarray_interface6_bank_bus_we)) & (vns_netsoc_csrbankarray_interface6_bank_bus_adr[4:0] == 4'd8));
assign vns_netsoc_csrbankarray_csrbank6_update_value0_r = vns_netsoc_csrbankarray_interface6_bank_bus_dat_w[0];
assign vns_netsoc_csrbankarray_csrbank6_update_value0_re = ((vns_netsoc_csrbankarray_csrbank6_sel & vns_netsoc_csrbankarray_interface6_bank_bus_we) & (vns_netsoc_csrbankarray_interface6_bank_bus_adr[4:0] == 4'd9));
assign vns_netsoc_csrbankarray_csrbank6_update_value0_we = ((vns_netsoc_csrbankarray_csrbank6_sel & (~vns_netsoc_csrbankarray_interface6_bank_bus_we)) & (vns_netsoc_csrbankarray_interface6_bank_bus_adr[4:0] == 4'd9));
assign vns_netsoc_csrbankarray_csrbank6_value3_r = vns_netsoc_csrbankarray_interface6_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank6_value3_re = ((vns_netsoc_csrbankarray_csrbank6_sel & vns_netsoc_csrbankarray_interface6_bank_bus_we) & (vns_netsoc_csrbankarray_interface6_bank_bus_adr[4:0] == 4'd10));
assign vns_netsoc_csrbankarray_csrbank6_value3_we = ((vns_netsoc_csrbankarray_csrbank6_sel & (~vns_netsoc_csrbankarray_interface6_bank_bus_we)) & (vns_netsoc_csrbankarray_interface6_bank_bus_adr[4:0] == 4'd10));
assign vns_netsoc_csrbankarray_csrbank6_value2_r = vns_netsoc_csrbankarray_interface6_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank6_value2_re = ((vns_netsoc_csrbankarray_csrbank6_sel & vns_netsoc_csrbankarray_interface6_bank_bus_we) & (vns_netsoc_csrbankarray_interface6_bank_bus_adr[4:0] == 4'd11));
assign vns_netsoc_csrbankarray_csrbank6_value2_we = ((vns_netsoc_csrbankarray_csrbank6_sel & (~vns_netsoc_csrbankarray_interface6_bank_bus_we)) & (vns_netsoc_csrbankarray_interface6_bank_bus_adr[4:0] == 4'd11));
assign vns_netsoc_csrbankarray_csrbank6_value1_r = vns_netsoc_csrbankarray_interface6_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank6_value1_re = ((vns_netsoc_csrbankarray_csrbank6_sel & vns_netsoc_csrbankarray_interface6_bank_bus_we) & (vns_netsoc_csrbankarray_interface6_bank_bus_adr[4:0] == 4'd12));
assign vns_netsoc_csrbankarray_csrbank6_value1_we = ((vns_netsoc_csrbankarray_csrbank6_sel & (~vns_netsoc_csrbankarray_interface6_bank_bus_we)) & (vns_netsoc_csrbankarray_interface6_bank_bus_adr[4:0] == 4'd12));
assign vns_netsoc_csrbankarray_csrbank6_value0_r = vns_netsoc_csrbankarray_interface6_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank6_value0_re = ((vns_netsoc_csrbankarray_csrbank6_sel & vns_netsoc_csrbankarray_interface6_bank_bus_we) & (vns_netsoc_csrbankarray_interface6_bank_bus_adr[4:0] == 4'd13));
assign vns_netsoc_csrbankarray_csrbank6_value0_we = ((vns_netsoc_csrbankarray_csrbank6_sel & (~vns_netsoc_csrbankarray_interface6_bank_bus_we)) & (vns_netsoc_csrbankarray_interface6_bank_bus_adr[4:0] == 4'd13));
assign soc_netsoc_timer0_eventmanager_status_r = vns_netsoc_csrbankarray_interface6_bank_bus_dat_w[0];
assign soc_netsoc_timer0_eventmanager_status_re = ((vns_netsoc_csrbankarray_csrbank6_sel & vns_netsoc_csrbankarray_interface6_bank_bus_we) & (vns_netsoc_csrbankarray_interface6_bank_bus_adr[4:0] == 4'd14));
assign soc_netsoc_timer0_eventmanager_status_we = ((vns_netsoc_csrbankarray_csrbank6_sel & (~vns_netsoc_csrbankarray_interface6_bank_bus_we)) & (vns_netsoc_csrbankarray_interface6_bank_bus_adr[4:0] == 4'd14));
assign soc_netsoc_timer0_eventmanager_pending_r = vns_netsoc_csrbankarray_interface6_bank_bus_dat_w[0];
assign soc_netsoc_timer0_eventmanager_pending_re = ((vns_netsoc_csrbankarray_csrbank6_sel & vns_netsoc_csrbankarray_interface6_bank_bus_we) & (vns_netsoc_csrbankarray_interface6_bank_bus_adr[4:0] == 4'd15));
assign soc_netsoc_timer0_eventmanager_pending_we = ((vns_netsoc_csrbankarray_csrbank6_sel & (~vns_netsoc_csrbankarray_interface6_bank_bus_we)) & (vns_netsoc_csrbankarray_interface6_bank_bus_adr[4:0] == 4'd15));
assign vns_netsoc_csrbankarray_csrbank6_ev_enable0_r = vns_netsoc_csrbankarray_interface6_bank_bus_dat_w[0];
assign vns_netsoc_csrbankarray_csrbank6_ev_enable0_re = ((vns_netsoc_csrbankarray_csrbank6_sel & vns_netsoc_csrbankarray_interface6_bank_bus_we) & (vns_netsoc_csrbankarray_interface6_bank_bus_adr[4:0] == 5'd16));
assign vns_netsoc_csrbankarray_csrbank6_ev_enable0_we = ((vns_netsoc_csrbankarray_csrbank6_sel & (~vns_netsoc_csrbankarray_interface6_bank_bus_we)) & (vns_netsoc_csrbankarray_interface6_bank_bus_adr[4:0] == 5'd16));
assign vns_netsoc_csrbankarray_csrbank6_load3_w = soc_netsoc_timer0_load_storage[31:24];
assign vns_netsoc_csrbankarray_csrbank6_load2_w = soc_netsoc_timer0_load_storage[23:16];
assign vns_netsoc_csrbankarray_csrbank6_load1_w = soc_netsoc_timer0_load_storage[15:8];
assign vns_netsoc_csrbankarray_csrbank6_load0_w = soc_netsoc_timer0_load_storage[7:0];
assign vns_netsoc_csrbankarray_csrbank6_reload3_w = soc_netsoc_timer0_reload_storage[31:24];
assign vns_netsoc_csrbankarray_csrbank6_reload2_w = soc_netsoc_timer0_reload_storage[23:16];
assign vns_netsoc_csrbankarray_csrbank6_reload1_w = soc_netsoc_timer0_reload_storage[15:8];
assign vns_netsoc_csrbankarray_csrbank6_reload0_w = soc_netsoc_timer0_reload_storage[7:0];
assign vns_netsoc_csrbankarray_csrbank6_en0_w = soc_netsoc_timer0_en_storage;
assign vns_netsoc_csrbankarray_csrbank6_update_value0_w = soc_netsoc_timer0_update_value_storage;
assign vns_netsoc_csrbankarray_csrbank6_value3_w = soc_netsoc_timer0_value_status[31:24];
assign vns_netsoc_csrbankarray_csrbank6_value2_w = soc_netsoc_timer0_value_status[23:16];
assign vns_netsoc_csrbankarray_csrbank6_value1_w = soc_netsoc_timer0_value_status[15:8];
assign vns_netsoc_csrbankarray_csrbank6_value0_w = soc_netsoc_timer0_value_status[7:0];
assign soc_netsoc_timer0_value_we = vns_netsoc_csrbankarray_csrbank6_value0_we;
assign vns_netsoc_csrbankarray_csrbank6_ev_enable0_w = soc_netsoc_timer0_eventmanager_storage;
assign vns_netsoc_csrbankarray_csrbank7_sel = (vns_netsoc_csrbankarray_interface7_bank_bus_adr[13:9] == 2'd3);
assign soc_netsoc_uart_rxtx_r = vns_netsoc_csrbankarray_interface7_bank_bus_dat_w[7:0];
assign soc_netsoc_uart_rxtx_re = ((vns_netsoc_csrbankarray_csrbank7_sel & vns_netsoc_csrbankarray_interface7_bank_bus_we) & (vns_netsoc_csrbankarray_interface7_bank_bus_adr[2:0] == 1'd0));
assign soc_netsoc_uart_rxtx_we = ((vns_netsoc_csrbankarray_csrbank7_sel & (~vns_netsoc_csrbankarray_interface7_bank_bus_we)) & (vns_netsoc_csrbankarray_interface7_bank_bus_adr[2:0] == 1'd0));
assign vns_netsoc_csrbankarray_csrbank7_txfull_r = vns_netsoc_csrbankarray_interface7_bank_bus_dat_w[0];
assign vns_netsoc_csrbankarray_csrbank7_txfull_re = ((vns_netsoc_csrbankarray_csrbank7_sel & vns_netsoc_csrbankarray_interface7_bank_bus_we) & (vns_netsoc_csrbankarray_interface7_bank_bus_adr[2:0] == 1'd1));
assign vns_netsoc_csrbankarray_csrbank7_txfull_we = ((vns_netsoc_csrbankarray_csrbank7_sel & (~vns_netsoc_csrbankarray_interface7_bank_bus_we)) & (vns_netsoc_csrbankarray_interface7_bank_bus_adr[2:0] == 1'd1));
assign vns_netsoc_csrbankarray_csrbank7_rxempty_r = vns_netsoc_csrbankarray_interface7_bank_bus_dat_w[0];
assign vns_netsoc_csrbankarray_csrbank7_rxempty_re = ((vns_netsoc_csrbankarray_csrbank7_sel & vns_netsoc_csrbankarray_interface7_bank_bus_we) & (vns_netsoc_csrbankarray_interface7_bank_bus_adr[2:0] == 2'd2));
assign vns_netsoc_csrbankarray_csrbank7_rxempty_we = ((vns_netsoc_csrbankarray_csrbank7_sel & (~vns_netsoc_csrbankarray_interface7_bank_bus_we)) & (vns_netsoc_csrbankarray_interface7_bank_bus_adr[2:0] == 2'd2));
assign soc_netsoc_uart_eventmanager_status_r = vns_netsoc_csrbankarray_interface7_bank_bus_dat_w[1:0];
assign soc_netsoc_uart_eventmanager_status_re = ((vns_netsoc_csrbankarray_csrbank7_sel & vns_netsoc_csrbankarray_interface7_bank_bus_we) & (vns_netsoc_csrbankarray_interface7_bank_bus_adr[2:0] == 2'd3));
assign soc_netsoc_uart_eventmanager_status_we = ((vns_netsoc_csrbankarray_csrbank7_sel & (~vns_netsoc_csrbankarray_interface7_bank_bus_we)) & (vns_netsoc_csrbankarray_interface7_bank_bus_adr[2:0] == 2'd3));
assign soc_netsoc_uart_eventmanager_pending_r = vns_netsoc_csrbankarray_interface7_bank_bus_dat_w[1:0];
assign soc_netsoc_uart_eventmanager_pending_re = ((vns_netsoc_csrbankarray_csrbank7_sel & vns_netsoc_csrbankarray_interface7_bank_bus_we) & (vns_netsoc_csrbankarray_interface7_bank_bus_adr[2:0] == 3'd4));
assign soc_netsoc_uart_eventmanager_pending_we = ((vns_netsoc_csrbankarray_csrbank7_sel & (~vns_netsoc_csrbankarray_interface7_bank_bus_we)) & (vns_netsoc_csrbankarray_interface7_bank_bus_adr[2:0] == 3'd4));
assign vns_netsoc_csrbankarray_csrbank7_ev_enable0_r = vns_netsoc_csrbankarray_interface7_bank_bus_dat_w[1:0];
assign vns_netsoc_csrbankarray_csrbank7_ev_enable0_re = ((vns_netsoc_csrbankarray_csrbank7_sel & vns_netsoc_csrbankarray_interface7_bank_bus_we) & (vns_netsoc_csrbankarray_interface7_bank_bus_adr[2:0] == 3'd5));
assign vns_netsoc_csrbankarray_csrbank7_ev_enable0_we = ((vns_netsoc_csrbankarray_csrbank7_sel & (~vns_netsoc_csrbankarray_interface7_bank_bus_we)) & (vns_netsoc_csrbankarray_interface7_bank_bus_adr[2:0] == 3'd5));
assign vns_netsoc_csrbankarray_csrbank7_txfull_w = soc_netsoc_uart_txfull_status;
assign soc_netsoc_uart_txfull_we = vns_netsoc_csrbankarray_csrbank7_txfull_we;
assign vns_netsoc_csrbankarray_csrbank7_rxempty_w = soc_netsoc_uart_rxempty_status;
assign soc_netsoc_uart_rxempty_we = vns_netsoc_csrbankarray_csrbank7_rxempty_we;
assign vns_netsoc_csrbankarray_csrbank7_ev_enable0_w = soc_netsoc_uart_eventmanager_storage[1:0];
assign vns_netsoc_csrbankarray_csrbank8_sel = (vns_netsoc_csrbankarray_interface8_bank_bus_adr[13:9] == 2'd2);
assign vns_netsoc_csrbankarray_csrbank8_tuning_word3_r = vns_netsoc_csrbankarray_interface8_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank8_tuning_word3_re = ((vns_netsoc_csrbankarray_csrbank8_sel & vns_netsoc_csrbankarray_interface8_bank_bus_we) & (vns_netsoc_csrbankarray_interface8_bank_bus_adr[1:0] == 1'd0));
assign vns_netsoc_csrbankarray_csrbank8_tuning_word3_we = ((vns_netsoc_csrbankarray_csrbank8_sel & (~vns_netsoc_csrbankarray_interface8_bank_bus_we)) & (vns_netsoc_csrbankarray_interface8_bank_bus_adr[1:0] == 1'd0));
assign vns_netsoc_csrbankarray_csrbank8_tuning_word2_r = vns_netsoc_csrbankarray_interface8_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank8_tuning_word2_re = ((vns_netsoc_csrbankarray_csrbank8_sel & vns_netsoc_csrbankarray_interface8_bank_bus_we) & (vns_netsoc_csrbankarray_interface8_bank_bus_adr[1:0] == 1'd1));
assign vns_netsoc_csrbankarray_csrbank8_tuning_word2_we = ((vns_netsoc_csrbankarray_csrbank8_sel & (~vns_netsoc_csrbankarray_interface8_bank_bus_we)) & (vns_netsoc_csrbankarray_interface8_bank_bus_adr[1:0] == 1'd1));
assign vns_netsoc_csrbankarray_csrbank8_tuning_word1_r = vns_netsoc_csrbankarray_interface8_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank8_tuning_word1_re = ((vns_netsoc_csrbankarray_csrbank8_sel & vns_netsoc_csrbankarray_interface8_bank_bus_we) & (vns_netsoc_csrbankarray_interface8_bank_bus_adr[1:0] == 2'd2));
assign vns_netsoc_csrbankarray_csrbank8_tuning_word1_we = ((vns_netsoc_csrbankarray_csrbank8_sel & (~vns_netsoc_csrbankarray_interface8_bank_bus_we)) & (vns_netsoc_csrbankarray_interface8_bank_bus_adr[1:0] == 2'd2));
assign vns_netsoc_csrbankarray_csrbank8_tuning_word0_r = vns_netsoc_csrbankarray_interface8_bank_bus_dat_w[7:0];
assign vns_netsoc_csrbankarray_csrbank8_tuning_word0_re = ((vns_netsoc_csrbankarray_csrbank8_sel & vns_netsoc_csrbankarray_interface8_bank_bus_we) & (vns_netsoc_csrbankarray_interface8_bank_bus_adr[1:0] == 2'd3));
assign vns_netsoc_csrbankarray_csrbank8_tuning_word0_we = ((vns_netsoc_csrbankarray_csrbank8_sel & (~vns_netsoc_csrbankarray_interface8_bank_bus_we)) & (vns_netsoc_csrbankarray_interface8_bank_bus_adr[1:0] == 2'd3));
assign vns_netsoc_csrbankarray_csrbank8_tuning_word3_w = soc_netsoc_uart_phy_storage[31:24];
assign vns_netsoc_csrbankarray_csrbank8_tuning_word2_w = soc_netsoc_uart_phy_storage[23:16];
assign vns_netsoc_csrbankarray_csrbank8_tuning_word1_w = soc_netsoc_uart_phy_storage[15:8];
assign vns_netsoc_csrbankarray_csrbank8_tuning_word0_w = soc_netsoc_uart_phy_storage[7:0];
assign vns_netsoc_csrcon_adr = soc_netsoc_interface_adr;
assign vns_netsoc_csrcon_we = soc_netsoc_interface_we;
assign vns_netsoc_csrcon_dat_w = soc_netsoc_interface_dat_w;
assign soc_netsoc_interface_dat_r = vns_netsoc_csrcon_dat_r;
assign vns_netsoc_csrbankarray_interface0_bank_bus_adr = vns_netsoc_csrcon_adr;
assign vns_netsoc_csrbankarray_interface1_bank_bus_adr = vns_netsoc_csrcon_adr;
assign vns_netsoc_csrbankarray_interface2_bank_bus_adr = vns_netsoc_csrcon_adr;
assign vns_netsoc_csrbankarray_interface3_bank_bus_adr = vns_netsoc_csrcon_adr;
assign vns_netsoc_csrbankarray_interface4_bank_bus_adr = vns_netsoc_csrcon_adr;
assign vns_netsoc_csrbankarray_interface5_bank_bus_adr = vns_netsoc_csrcon_adr;
assign vns_netsoc_csrbankarray_interface6_bank_bus_adr = vns_netsoc_csrcon_adr;
assign vns_netsoc_csrbankarray_interface7_bank_bus_adr = vns_netsoc_csrcon_adr;
assign vns_netsoc_csrbankarray_interface8_bank_bus_adr = vns_netsoc_csrcon_adr;
assign vns_netsoc_csrbankarray_sram_bus_adr = vns_netsoc_csrcon_adr;
assign vns_netsoc_csrbankarray_interface0_bank_bus_we = vns_netsoc_csrcon_we;
assign vns_netsoc_csrbankarray_interface1_bank_bus_we = vns_netsoc_csrcon_we;
assign vns_netsoc_csrbankarray_interface2_bank_bus_we = vns_netsoc_csrcon_we;
assign vns_netsoc_csrbankarray_interface3_bank_bus_we = vns_netsoc_csrcon_we;
assign vns_netsoc_csrbankarray_interface4_bank_bus_we = vns_netsoc_csrcon_we;
assign vns_netsoc_csrbankarray_interface5_bank_bus_we = vns_netsoc_csrcon_we;
assign vns_netsoc_csrbankarray_interface6_bank_bus_we = vns_netsoc_csrcon_we;
assign vns_netsoc_csrbankarray_interface7_bank_bus_we = vns_netsoc_csrcon_we;
assign vns_netsoc_csrbankarray_interface8_bank_bus_we = vns_netsoc_csrcon_we;
assign vns_netsoc_csrbankarray_sram_bus_we = vns_netsoc_csrcon_we;
assign vns_netsoc_csrbankarray_interface0_bank_bus_dat_w = vns_netsoc_csrcon_dat_w;
assign vns_netsoc_csrbankarray_interface1_bank_bus_dat_w = vns_netsoc_csrcon_dat_w;
assign vns_netsoc_csrbankarray_interface2_bank_bus_dat_w = vns_netsoc_csrcon_dat_w;
assign vns_netsoc_csrbankarray_interface3_bank_bus_dat_w = vns_netsoc_csrcon_dat_w;
assign vns_netsoc_csrbankarray_interface4_bank_bus_dat_w = vns_netsoc_csrcon_dat_w;
assign vns_netsoc_csrbankarray_interface5_bank_bus_dat_w = vns_netsoc_csrcon_dat_w;
assign vns_netsoc_csrbankarray_interface6_bank_bus_dat_w = vns_netsoc_csrcon_dat_w;
assign vns_netsoc_csrbankarray_interface7_bank_bus_dat_w = vns_netsoc_csrcon_dat_w;
assign vns_netsoc_csrbankarray_interface8_bank_bus_dat_w = vns_netsoc_csrcon_dat_w;
assign vns_netsoc_csrbankarray_sram_bus_dat_w = vns_netsoc_csrcon_dat_w;
assign vns_netsoc_csrcon_dat_r = (((((((((vns_netsoc_csrbankarray_interface0_bank_bus_dat_r | vns_netsoc_csrbankarray_interface1_bank_bus_dat_r) | vns_netsoc_csrbankarray_interface2_bank_bus_dat_r) | vns_netsoc_csrbankarray_interface3_bank_bus_dat_r) | vns_netsoc_csrbankarray_interface4_bank_bus_dat_r) | vns_netsoc_csrbankarray_interface5_bank_bus_dat_r) | vns_netsoc_csrbankarray_interface6_bank_bus_dat_r) | vns_netsoc_csrbankarray_interface7_bank_bus_dat_r) | vns_netsoc_csrbankarray_interface8_bank_bus_dat_r) | vns_netsoc_csrbankarray_sram_bus_dat_r);
always @(*) begin
	vns_rhs_array_muxed0 <= 1'd0;
	case (soc_netsoc_sdram_choose_cmd_grant)
		1'd0: begin
			vns_rhs_array_muxed0 <= soc_netsoc_sdram_choose_cmd_valids[0];
		end
		1'd1: begin
			vns_rhs_array_muxed0 <= soc_netsoc_sdram_choose_cmd_valids[1];
		end
		2'd2: begin
			vns_rhs_array_muxed0 <= soc_netsoc_sdram_choose_cmd_valids[2];
		end
		2'd3: begin
			vns_rhs_array_muxed0 <= soc_netsoc_sdram_choose_cmd_valids[3];
		end
		3'd4: begin
			vns_rhs_array_muxed0 <= soc_netsoc_sdram_choose_cmd_valids[4];
		end
		3'd5: begin
			vns_rhs_array_muxed0 <= soc_netsoc_sdram_choose_cmd_valids[5];
		end
		3'd6: begin
			vns_rhs_array_muxed0 <= soc_netsoc_sdram_choose_cmd_valids[6];
		end
		default: begin
			vns_rhs_array_muxed0 <= soc_netsoc_sdram_choose_cmd_valids[7];
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed1 <= 14'd0;
	case (soc_netsoc_sdram_choose_cmd_grant)
		1'd0: begin
			vns_rhs_array_muxed1 <= soc_netsoc_sdram_bankmachine0_cmd_payload_a;
		end
		1'd1: begin
			vns_rhs_array_muxed1 <= soc_netsoc_sdram_bankmachine1_cmd_payload_a;
		end
		2'd2: begin
			vns_rhs_array_muxed1 <= soc_netsoc_sdram_bankmachine2_cmd_payload_a;
		end
		2'd3: begin
			vns_rhs_array_muxed1 <= soc_netsoc_sdram_bankmachine3_cmd_payload_a;
		end
		3'd4: begin
			vns_rhs_array_muxed1 <= soc_netsoc_sdram_bankmachine4_cmd_payload_a;
		end
		3'd5: begin
			vns_rhs_array_muxed1 <= soc_netsoc_sdram_bankmachine5_cmd_payload_a;
		end
		3'd6: begin
			vns_rhs_array_muxed1 <= soc_netsoc_sdram_bankmachine6_cmd_payload_a;
		end
		default: begin
			vns_rhs_array_muxed1 <= soc_netsoc_sdram_bankmachine7_cmd_payload_a;
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed2 <= 3'd0;
	case (soc_netsoc_sdram_choose_cmd_grant)
		1'd0: begin
			vns_rhs_array_muxed2 <= soc_netsoc_sdram_bankmachine0_cmd_payload_ba;
		end
		1'd1: begin
			vns_rhs_array_muxed2 <= soc_netsoc_sdram_bankmachine1_cmd_payload_ba;
		end
		2'd2: begin
			vns_rhs_array_muxed2 <= soc_netsoc_sdram_bankmachine2_cmd_payload_ba;
		end
		2'd3: begin
			vns_rhs_array_muxed2 <= soc_netsoc_sdram_bankmachine3_cmd_payload_ba;
		end
		3'd4: begin
			vns_rhs_array_muxed2 <= soc_netsoc_sdram_bankmachine4_cmd_payload_ba;
		end
		3'd5: begin
			vns_rhs_array_muxed2 <= soc_netsoc_sdram_bankmachine5_cmd_payload_ba;
		end
		3'd6: begin
			vns_rhs_array_muxed2 <= soc_netsoc_sdram_bankmachine6_cmd_payload_ba;
		end
		default: begin
			vns_rhs_array_muxed2 <= soc_netsoc_sdram_bankmachine7_cmd_payload_ba;
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed3 <= 1'd0;
	case (soc_netsoc_sdram_choose_cmd_grant)
		1'd0: begin
			vns_rhs_array_muxed3 <= soc_netsoc_sdram_bankmachine0_cmd_payload_is_read;
		end
		1'd1: begin
			vns_rhs_array_muxed3 <= soc_netsoc_sdram_bankmachine1_cmd_payload_is_read;
		end
		2'd2: begin
			vns_rhs_array_muxed3 <= soc_netsoc_sdram_bankmachine2_cmd_payload_is_read;
		end
		2'd3: begin
			vns_rhs_array_muxed3 <= soc_netsoc_sdram_bankmachine3_cmd_payload_is_read;
		end
		3'd4: begin
			vns_rhs_array_muxed3 <= soc_netsoc_sdram_bankmachine4_cmd_payload_is_read;
		end
		3'd5: begin
			vns_rhs_array_muxed3 <= soc_netsoc_sdram_bankmachine5_cmd_payload_is_read;
		end
		3'd6: begin
			vns_rhs_array_muxed3 <= soc_netsoc_sdram_bankmachine6_cmd_payload_is_read;
		end
		default: begin
			vns_rhs_array_muxed3 <= soc_netsoc_sdram_bankmachine7_cmd_payload_is_read;
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed4 <= 1'd0;
	case (soc_netsoc_sdram_choose_cmd_grant)
		1'd0: begin
			vns_rhs_array_muxed4 <= soc_netsoc_sdram_bankmachine0_cmd_payload_is_write;
		end
		1'd1: begin
			vns_rhs_array_muxed4 <= soc_netsoc_sdram_bankmachine1_cmd_payload_is_write;
		end
		2'd2: begin
			vns_rhs_array_muxed4 <= soc_netsoc_sdram_bankmachine2_cmd_payload_is_write;
		end
		2'd3: begin
			vns_rhs_array_muxed4 <= soc_netsoc_sdram_bankmachine3_cmd_payload_is_write;
		end
		3'd4: begin
			vns_rhs_array_muxed4 <= soc_netsoc_sdram_bankmachine4_cmd_payload_is_write;
		end
		3'd5: begin
			vns_rhs_array_muxed4 <= soc_netsoc_sdram_bankmachine5_cmd_payload_is_write;
		end
		3'd6: begin
			vns_rhs_array_muxed4 <= soc_netsoc_sdram_bankmachine6_cmd_payload_is_write;
		end
		default: begin
			vns_rhs_array_muxed4 <= soc_netsoc_sdram_bankmachine7_cmd_payload_is_write;
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed5 <= 1'd0;
	case (soc_netsoc_sdram_choose_cmd_grant)
		1'd0: begin
			vns_rhs_array_muxed5 <= soc_netsoc_sdram_bankmachine0_cmd_payload_is_cmd;
		end
		1'd1: begin
			vns_rhs_array_muxed5 <= soc_netsoc_sdram_bankmachine1_cmd_payload_is_cmd;
		end
		2'd2: begin
			vns_rhs_array_muxed5 <= soc_netsoc_sdram_bankmachine2_cmd_payload_is_cmd;
		end
		2'd3: begin
			vns_rhs_array_muxed5 <= soc_netsoc_sdram_bankmachine3_cmd_payload_is_cmd;
		end
		3'd4: begin
			vns_rhs_array_muxed5 <= soc_netsoc_sdram_bankmachine4_cmd_payload_is_cmd;
		end
		3'd5: begin
			vns_rhs_array_muxed5 <= soc_netsoc_sdram_bankmachine5_cmd_payload_is_cmd;
		end
		3'd6: begin
			vns_rhs_array_muxed5 <= soc_netsoc_sdram_bankmachine6_cmd_payload_is_cmd;
		end
		default: begin
			vns_rhs_array_muxed5 <= soc_netsoc_sdram_bankmachine7_cmd_payload_is_cmd;
		end
	endcase
end
always @(*) begin
	vns_t_array_muxed0 <= 1'd0;
	case (soc_netsoc_sdram_choose_cmd_grant)
		1'd0: begin
			vns_t_array_muxed0 <= soc_netsoc_sdram_bankmachine0_cmd_payload_cas;
		end
		1'd1: begin
			vns_t_array_muxed0 <= soc_netsoc_sdram_bankmachine1_cmd_payload_cas;
		end
		2'd2: begin
			vns_t_array_muxed0 <= soc_netsoc_sdram_bankmachine2_cmd_payload_cas;
		end
		2'd3: begin
			vns_t_array_muxed0 <= soc_netsoc_sdram_bankmachine3_cmd_payload_cas;
		end
		3'd4: begin
			vns_t_array_muxed0 <= soc_netsoc_sdram_bankmachine4_cmd_payload_cas;
		end
		3'd5: begin
			vns_t_array_muxed0 <= soc_netsoc_sdram_bankmachine5_cmd_payload_cas;
		end
		3'd6: begin
			vns_t_array_muxed0 <= soc_netsoc_sdram_bankmachine6_cmd_payload_cas;
		end
		default: begin
			vns_t_array_muxed0 <= soc_netsoc_sdram_bankmachine7_cmd_payload_cas;
		end
	endcase
end
always @(*) begin
	vns_t_array_muxed1 <= 1'd0;
	case (soc_netsoc_sdram_choose_cmd_grant)
		1'd0: begin
			vns_t_array_muxed1 <= soc_netsoc_sdram_bankmachine0_cmd_payload_ras;
		end
		1'd1: begin
			vns_t_array_muxed1 <= soc_netsoc_sdram_bankmachine1_cmd_payload_ras;
		end
		2'd2: begin
			vns_t_array_muxed1 <= soc_netsoc_sdram_bankmachine2_cmd_payload_ras;
		end
		2'd3: begin
			vns_t_array_muxed1 <= soc_netsoc_sdram_bankmachine3_cmd_payload_ras;
		end
		3'd4: begin
			vns_t_array_muxed1 <= soc_netsoc_sdram_bankmachine4_cmd_payload_ras;
		end
		3'd5: begin
			vns_t_array_muxed1 <= soc_netsoc_sdram_bankmachine5_cmd_payload_ras;
		end
		3'd6: begin
			vns_t_array_muxed1 <= soc_netsoc_sdram_bankmachine6_cmd_payload_ras;
		end
		default: begin
			vns_t_array_muxed1 <= soc_netsoc_sdram_bankmachine7_cmd_payload_ras;
		end
	endcase
end
always @(*) begin
	vns_t_array_muxed2 <= 1'd0;
	case (soc_netsoc_sdram_choose_cmd_grant)
		1'd0: begin
			vns_t_array_muxed2 <= soc_netsoc_sdram_bankmachine0_cmd_payload_we;
		end
		1'd1: begin
			vns_t_array_muxed2 <= soc_netsoc_sdram_bankmachine1_cmd_payload_we;
		end
		2'd2: begin
			vns_t_array_muxed2 <= soc_netsoc_sdram_bankmachine2_cmd_payload_we;
		end
		2'd3: begin
			vns_t_array_muxed2 <= soc_netsoc_sdram_bankmachine3_cmd_payload_we;
		end
		3'd4: begin
			vns_t_array_muxed2 <= soc_netsoc_sdram_bankmachine4_cmd_payload_we;
		end
		3'd5: begin
			vns_t_array_muxed2 <= soc_netsoc_sdram_bankmachine5_cmd_payload_we;
		end
		3'd6: begin
			vns_t_array_muxed2 <= soc_netsoc_sdram_bankmachine6_cmd_payload_we;
		end
		default: begin
			vns_t_array_muxed2 <= soc_netsoc_sdram_bankmachine7_cmd_payload_we;
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed6 <= 1'd0;
	case (soc_netsoc_sdram_choose_req_grant)
		1'd0: begin
			vns_rhs_array_muxed6 <= soc_netsoc_sdram_choose_req_valids[0];
		end
		1'd1: begin
			vns_rhs_array_muxed6 <= soc_netsoc_sdram_choose_req_valids[1];
		end
		2'd2: begin
			vns_rhs_array_muxed6 <= soc_netsoc_sdram_choose_req_valids[2];
		end
		2'd3: begin
			vns_rhs_array_muxed6 <= soc_netsoc_sdram_choose_req_valids[3];
		end
		3'd4: begin
			vns_rhs_array_muxed6 <= soc_netsoc_sdram_choose_req_valids[4];
		end
		3'd5: begin
			vns_rhs_array_muxed6 <= soc_netsoc_sdram_choose_req_valids[5];
		end
		3'd6: begin
			vns_rhs_array_muxed6 <= soc_netsoc_sdram_choose_req_valids[6];
		end
		default: begin
			vns_rhs_array_muxed6 <= soc_netsoc_sdram_choose_req_valids[7];
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed7 <= 14'd0;
	case (soc_netsoc_sdram_choose_req_grant)
		1'd0: begin
			vns_rhs_array_muxed7 <= soc_netsoc_sdram_bankmachine0_cmd_payload_a;
		end
		1'd1: begin
			vns_rhs_array_muxed7 <= soc_netsoc_sdram_bankmachine1_cmd_payload_a;
		end
		2'd2: begin
			vns_rhs_array_muxed7 <= soc_netsoc_sdram_bankmachine2_cmd_payload_a;
		end
		2'd3: begin
			vns_rhs_array_muxed7 <= soc_netsoc_sdram_bankmachine3_cmd_payload_a;
		end
		3'd4: begin
			vns_rhs_array_muxed7 <= soc_netsoc_sdram_bankmachine4_cmd_payload_a;
		end
		3'd5: begin
			vns_rhs_array_muxed7 <= soc_netsoc_sdram_bankmachine5_cmd_payload_a;
		end
		3'd6: begin
			vns_rhs_array_muxed7 <= soc_netsoc_sdram_bankmachine6_cmd_payload_a;
		end
		default: begin
			vns_rhs_array_muxed7 <= soc_netsoc_sdram_bankmachine7_cmd_payload_a;
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed8 <= 3'd0;
	case (soc_netsoc_sdram_choose_req_grant)
		1'd0: begin
			vns_rhs_array_muxed8 <= soc_netsoc_sdram_bankmachine0_cmd_payload_ba;
		end
		1'd1: begin
			vns_rhs_array_muxed8 <= soc_netsoc_sdram_bankmachine1_cmd_payload_ba;
		end
		2'd2: begin
			vns_rhs_array_muxed8 <= soc_netsoc_sdram_bankmachine2_cmd_payload_ba;
		end
		2'd3: begin
			vns_rhs_array_muxed8 <= soc_netsoc_sdram_bankmachine3_cmd_payload_ba;
		end
		3'd4: begin
			vns_rhs_array_muxed8 <= soc_netsoc_sdram_bankmachine4_cmd_payload_ba;
		end
		3'd5: begin
			vns_rhs_array_muxed8 <= soc_netsoc_sdram_bankmachine5_cmd_payload_ba;
		end
		3'd6: begin
			vns_rhs_array_muxed8 <= soc_netsoc_sdram_bankmachine6_cmd_payload_ba;
		end
		default: begin
			vns_rhs_array_muxed8 <= soc_netsoc_sdram_bankmachine7_cmd_payload_ba;
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed9 <= 1'd0;
	case (soc_netsoc_sdram_choose_req_grant)
		1'd0: begin
			vns_rhs_array_muxed9 <= soc_netsoc_sdram_bankmachine0_cmd_payload_is_read;
		end
		1'd1: begin
			vns_rhs_array_muxed9 <= soc_netsoc_sdram_bankmachine1_cmd_payload_is_read;
		end
		2'd2: begin
			vns_rhs_array_muxed9 <= soc_netsoc_sdram_bankmachine2_cmd_payload_is_read;
		end
		2'd3: begin
			vns_rhs_array_muxed9 <= soc_netsoc_sdram_bankmachine3_cmd_payload_is_read;
		end
		3'd4: begin
			vns_rhs_array_muxed9 <= soc_netsoc_sdram_bankmachine4_cmd_payload_is_read;
		end
		3'd5: begin
			vns_rhs_array_muxed9 <= soc_netsoc_sdram_bankmachine5_cmd_payload_is_read;
		end
		3'd6: begin
			vns_rhs_array_muxed9 <= soc_netsoc_sdram_bankmachine6_cmd_payload_is_read;
		end
		default: begin
			vns_rhs_array_muxed9 <= soc_netsoc_sdram_bankmachine7_cmd_payload_is_read;
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed10 <= 1'd0;
	case (soc_netsoc_sdram_choose_req_grant)
		1'd0: begin
			vns_rhs_array_muxed10 <= soc_netsoc_sdram_bankmachine0_cmd_payload_is_write;
		end
		1'd1: begin
			vns_rhs_array_muxed10 <= soc_netsoc_sdram_bankmachine1_cmd_payload_is_write;
		end
		2'd2: begin
			vns_rhs_array_muxed10 <= soc_netsoc_sdram_bankmachine2_cmd_payload_is_write;
		end
		2'd3: begin
			vns_rhs_array_muxed10 <= soc_netsoc_sdram_bankmachine3_cmd_payload_is_write;
		end
		3'd4: begin
			vns_rhs_array_muxed10 <= soc_netsoc_sdram_bankmachine4_cmd_payload_is_write;
		end
		3'd5: begin
			vns_rhs_array_muxed10 <= soc_netsoc_sdram_bankmachine5_cmd_payload_is_write;
		end
		3'd6: begin
			vns_rhs_array_muxed10 <= soc_netsoc_sdram_bankmachine6_cmd_payload_is_write;
		end
		default: begin
			vns_rhs_array_muxed10 <= soc_netsoc_sdram_bankmachine7_cmd_payload_is_write;
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed11 <= 1'd0;
	case (soc_netsoc_sdram_choose_req_grant)
		1'd0: begin
			vns_rhs_array_muxed11 <= soc_netsoc_sdram_bankmachine0_cmd_payload_is_cmd;
		end
		1'd1: begin
			vns_rhs_array_muxed11 <= soc_netsoc_sdram_bankmachine1_cmd_payload_is_cmd;
		end
		2'd2: begin
			vns_rhs_array_muxed11 <= soc_netsoc_sdram_bankmachine2_cmd_payload_is_cmd;
		end
		2'd3: begin
			vns_rhs_array_muxed11 <= soc_netsoc_sdram_bankmachine3_cmd_payload_is_cmd;
		end
		3'd4: begin
			vns_rhs_array_muxed11 <= soc_netsoc_sdram_bankmachine4_cmd_payload_is_cmd;
		end
		3'd5: begin
			vns_rhs_array_muxed11 <= soc_netsoc_sdram_bankmachine5_cmd_payload_is_cmd;
		end
		3'd6: begin
			vns_rhs_array_muxed11 <= soc_netsoc_sdram_bankmachine6_cmd_payload_is_cmd;
		end
		default: begin
			vns_rhs_array_muxed11 <= soc_netsoc_sdram_bankmachine7_cmd_payload_is_cmd;
		end
	endcase
end
always @(*) begin
	vns_t_array_muxed3 <= 1'd0;
	case (soc_netsoc_sdram_choose_req_grant)
		1'd0: begin
			vns_t_array_muxed3 <= soc_netsoc_sdram_bankmachine0_cmd_payload_cas;
		end
		1'd1: begin
			vns_t_array_muxed3 <= soc_netsoc_sdram_bankmachine1_cmd_payload_cas;
		end
		2'd2: begin
			vns_t_array_muxed3 <= soc_netsoc_sdram_bankmachine2_cmd_payload_cas;
		end
		2'd3: begin
			vns_t_array_muxed3 <= soc_netsoc_sdram_bankmachine3_cmd_payload_cas;
		end
		3'd4: begin
			vns_t_array_muxed3 <= soc_netsoc_sdram_bankmachine4_cmd_payload_cas;
		end
		3'd5: begin
			vns_t_array_muxed3 <= soc_netsoc_sdram_bankmachine5_cmd_payload_cas;
		end
		3'd6: begin
			vns_t_array_muxed3 <= soc_netsoc_sdram_bankmachine6_cmd_payload_cas;
		end
		default: begin
			vns_t_array_muxed3 <= soc_netsoc_sdram_bankmachine7_cmd_payload_cas;
		end
	endcase
end
always @(*) begin
	vns_t_array_muxed4 <= 1'd0;
	case (soc_netsoc_sdram_choose_req_grant)
		1'd0: begin
			vns_t_array_muxed4 <= soc_netsoc_sdram_bankmachine0_cmd_payload_ras;
		end
		1'd1: begin
			vns_t_array_muxed4 <= soc_netsoc_sdram_bankmachine1_cmd_payload_ras;
		end
		2'd2: begin
			vns_t_array_muxed4 <= soc_netsoc_sdram_bankmachine2_cmd_payload_ras;
		end
		2'd3: begin
			vns_t_array_muxed4 <= soc_netsoc_sdram_bankmachine3_cmd_payload_ras;
		end
		3'd4: begin
			vns_t_array_muxed4 <= soc_netsoc_sdram_bankmachine4_cmd_payload_ras;
		end
		3'd5: begin
			vns_t_array_muxed4 <= soc_netsoc_sdram_bankmachine5_cmd_payload_ras;
		end
		3'd6: begin
			vns_t_array_muxed4 <= soc_netsoc_sdram_bankmachine6_cmd_payload_ras;
		end
		default: begin
			vns_t_array_muxed4 <= soc_netsoc_sdram_bankmachine7_cmd_payload_ras;
		end
	endcase
end
always @(*) begin
	vns_t_array_muxed5 <= 1'd0;
	case (soc_netsoc_sdram_choose_req_grant)
		1'd0: begin
			vns_t_array_muxed5 <= soc_netsoc_sdram_bankmachine0_cmd_payload_we;
		end
		1'd1: begin
			vns_t_array_muxed5 <= soc_netsoc_sdram_bankmachine1_cmd_payload_we;
		end
		2'd2: begin
			vns_t_array_muxed5 <= soc_netsoc_sdram_bankmachine2_cmd_payload_we;
		end
		2'd3: begin
			vns_t_array_muxed5 <= soc_netsoc_sdram_bankmachine3_cmd_payload_we;
		end
		3'd4: begin
			vns_t_array_muxed5 <= soc_netsoc_sdram_bankmachine4_cmd_payload_we;
		end
		3'd5: begin
			vns_t_array_muxed5 <= soc_netsoc_sdram_bankmachine5_cmd_payload_we;
		end
		3'd6: begin
			vns_t_array_muxed5 <= soc_netsoc_sdram_bankmachine6_cmd_payload_we;
		end
		default: begin
			vns_t_array_muxed5 <= soc_netsoc_sdram_bankmachine7_cmd_payload_we;
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed12 <= 21'd0;
	case (vns_roundrobin0_grant)
		default: begin
			vns_rhs_array_muxed12 <= {soc_netsoc_port_cmd_payload_addr[23:10], soc_netsoc_port_cmd_payload_addr[6:0]};
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed13 <= 1'd0;
	case (vns_roundrobin0_grant)
		default: begin
			vns_rhs_array_muxed13 <= soc_netsoc_port_cmd_payload_we;
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed14 <= 1'd0;
	case (vns_roundrobin0_grant)
		default: begin
			vns_rhs_array_muxed14 <= (((soc_netsoc_port_cmd_payload_addr[9:7] == 1'd0) & (~(((((((vns_locked0 | (soc_netsoc_sdram_interface_bank1_lock & (vns_roundrobin1_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank2_lock & (vns_roundrobin2_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank3_lock & (vns_roundrobin3_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank4_lock & (vns_roundrobin4_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank5_lock & (vns_roundrobin5_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank6_lock & (vns_roundrobin6_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank7_lock & (vns_roundrobin7_grant == 1'd0))))) & soc_netsoc_port_cmd_valid);
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed15 <= 21'd0;
	case (vns_roundrobin1_grant)
		default: begin
			vns_rhs_array_muxed15 <= {soc_netsoc_port_cmd_payload_addr[23:10], soc_netsoc_port_cmd_payload_addr[6:0]};
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed16 <= 1'd0;
	case (vns_roundrobin1_grant)
		default: begin
			vns_rhs_array_muxed16 <= soc_netsoc_port_cmd_payload_we;
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed17 <= 1'd0;
	case (vns_roundrobin1_grant)
		default: begin
			vns_rhs_array_muxed17 <= (((soc_netsoc_port_cmd_payload_addr[9:7] == 1'd1) & (~(((((((vns_locked1 | (soc_netsoc_sdram_interface_bank0_lock & (vns_roundrobin0_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank2_lock & (vns_roundrobin2_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank3_lock & (vns_roundrobin3_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank4_lock & (vns_roundrobin4_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank5_lock & (vns_roundrobin5_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank6_lock & (vns_roundrobin6_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank7_lock & (vns_roundrobin7_grant == 1'd0))))) & soc_netsoc_port_cmd_valid);
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed18 <= 21'd0;
	case (vns_roundrobin2_grant)
		default: begin
			vns_rhs_array_muxed18 <= {soc_netsoc_port_cmd_payload_addr[23:10], soc_netsoc_port_cmd_payload_addr[6:0]};
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed19 <= 1'd0;
	case (vns_roundrobin2_grant)
		default: begin
			vns_rhs_array_muxed19 <= soc_netsoc_port_cmd_payload_we;
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed20 <= 1'd0;
	case (vns_roundrobin2_grant)
		default: begin
			vns_rhs_array_muxed20 <= (((soc_netsoc_port_cmd_payload_addr[9:7] == 2'd2) & (~(((((((vns_locked2 | (soc_netsoc_sdram_interface_bank0_lock & (vns_roundrobin0_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank1_lock & (vns_roundrobin1_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank3_lock & (vns_roundrobin3_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank4_lock & (vns_roundrobin4_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank5_lock & (vns_roundrobin5_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank6_lock & (vns_roundrobin6_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank7_lock & (vns_roundrobin7_grant == 1'd0))))) & soc_netsoc_port_cmd_valid);
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed21 <= 21'd0;
	case (vns_roundrobin3_grant)
		default: begin
			vns_rhs_array_muxed21 <= {soc_netsoc_port_cmd_payload_addr[23:10], soc_netsoc_port_cmd_payload_addr[6:0]};
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed22 <= 1'd0;
	case (vns_roundrobin3_grant)
		default: begin
			vns_rhs_array_muxed22 <= soc_netsoc_port_cmd_payload_we;
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed23 <= 1'd0;
	case (vns_roundrobin3_grant)
		default: begin
			vns_rhs_array_muxed23 <= (((soc_netsoc_port_cmd_payload_addr[9:7] == 2'd3) & (~(((((((vns_locked3 | (soc_netsoc_sdram_interface_bank0_lock & (vns_roundrobin0_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank1_lock & (vns_roundrobin1_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank2_lock & (vns_roundrobin2_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank4_lock & (vns_roundrobin4_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank5_lock & (vns_roundrobin5_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank6_lock & (vns_roundrobin6_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank7_lock & (vns_roundrobin7_grant == 1'd0))))) & soc_netsoc_port_cmd_valid);
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed24 <= 21'd0;
	case (vns_roundrobin4_grant)
		default: begin
			vns_rhs_array_muxed24 <= {soc_netsoc_port_cmd_payload_addr[23:10], soc_netsoc_port_cmd_payload_addr[6:0]};
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed25 <= 1'd0;
	case (vns_roundrobin4_grant)
		default: begin
			vns_rhs_array_muxed25 <= soc_netsoc_port_cmd_payload_we;
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed26 <= 1'd0;
	case (vns_roundrobin4_grant)
		default: begin
			vns_rhs_array_muxed26 <= (((soc_netsoc_port_cmd_payload_addr[9:7] == 3'd4) & (~(((((((vns_locked4 | (soc_netsoc_sdram_interface_bank0_lock & (vns_roundrobin0_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank1_lock & (vns_roundrobin1_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank2_lock & (vns_roundrobin2_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank3_lock & (vns_roundrobin3_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank5_lock & (vns_roundrobin5_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank6_lock & (vns_roundrobin6_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank7_lock & (vns_roundrobin7_grant == 1'd0))))) & soc_netsoc_port_cmd_valid);
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed27 <= 21'd0;
	case (vns_roundrobin5_grant)
		default: begin
			vns_rhs_array_muxed27 <= {soc_netsoc_port_cmd_payload_addr[23:10], soc_netsoc_port_cmd_payload_addr[6:0]};
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed28 <= 1'd0;
	case (vns_roundrobin5_grant)
		default: begin
			vns_rhs_array_muxed28 <= soc_netsoc_port_cmd_payload_we;
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed29 <= 1'd0;
	case (vns_roundrobin5_grant)
		default: begin
			vns_rhs_array_muxed29 <= (((soc_netsoc_port_cmd_payload_addr[9:7] == 3'd5) & (~(((((((vns_locked5 | (soc_netsoc_sdram_interface_bank0_lock & (vns_roundrobin0_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank1_lock & (vns_roundrobin1_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank2_lock & (vns_roundrobin2_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank3_lock & (vns_roundrobin3_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank4_lock & (vns_roundrobin4_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank6_lock & (vns_roundrobin6_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank7_lock & (vns_roundrobin7_grant == 1'd0))))) & soc_netsoc_port_cmd_valid);
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed30 <= 21'd0;
	case (vns_roundrobin6_grant)
		default: begin
			vns_rhs_array_muxed30 <= {soc_netsoc_port_cmd_payload_addr[23:10], soc_netsoc_port_cmd_payload_addr[6:0]};
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed31 <= 1'd0;
	case (vns_roundrobin6_grant)
		default: begin
			vns_rhs_array_muxed31 <= soc_netsoc_port_cmd_payload_we;
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed32 <= 1'd0;
	case (vns_roundrobin6_grant)
		default: begin
			vns_rhs_array_muxed32 <= (((soc_netsoc_port_cmd_payload_addr[9:7] == 3'd6) & (~(((((((vns_locked6 | (soc_netsoc_sdram_interface_bank0_lock & (vns_roundrobin0_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank1_lock & (vns_roundrobin1_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank2_lock & (vns_roundrobin2_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank3_lock & (vns_roundrobin3_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank4_lock & (vns_roundrobin4_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank5_lock & (vns_roundrobin5_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank7_lock & (vns_roundrobin7_grant == 1'd0))))) & soc_netsoc_port_cmd_valid);
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed33 <= 21'd0;
	case (vns_roundrobin7_grant)
		default: begin
			vns_rhs_array_muxed33 <= {soc_netsoc_port_cmd_payload_addr[23:10], soc_netsoc_port_cmd_payload_addr[6:0]};
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed34 <= 1'd0;
	case (vns_roundrobin7_grant)
		default: begin
			vns_rhs_array_muxed34 <= soc_netsoc_port_cmd_payload_we;
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed35 <= 1'd0;
	case (vns_roundrobin7_grant)
		default: begin
			vns_rhs_array_muxed35 <= (((soc_netsoc_port_cmd_payload_addr[9:7] == 3'd7) & (~(((((((vns_locked7 | (soc_netsoc_sdram_interface_bank0_lock & (vns_roundrobin0_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank1_lock & (vns_roundrobin1_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank2_lock & (vns_roundrobin2_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank3_lock & (vns_roundrobin3_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank4_lock & (vns_roundrobin4_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank5_lock & (vns_roundrobin5_grant == 1'd0))) | (soc_netsoc_sdram_interface_bank6_lock & (vns_roundrobin6_grant == 1'd0))))) & soc_netsoc_port_cmd_valid);
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed36 <= 30'd0;
	case (vns_wb_sdram_con_grant)
		default: begin
			vns_rhs_array_muxed36 <= soc_netsoc_interface1_wb_sdram_adr;
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed37 <= 32'd0;
	case (vns_wb_sdram_con_grant)
		default: begin
			vns_rhs_array_muxed37 <= soc_netsoc_interface1_wb_sdram_dat_w;
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed38 <= 4'd0;
	case (vns_wb_sdram_con_grant)
		default: begin
			vns_rhs_array_muxed38 <= soc_netsoc_interface1_wb_sdram_sel;
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed39 <= 1'd0;
	case (vns_wb_sdram_con_grant)
		default: begin
			vns_rhs_array_muxed39 <= soc_netsoc_interface1_wb_sdram_cyc;
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed40 <= 1'd0;
	case (vns_wb_sdram_con_grant)
		default: begin
			vns_rhs_array_muxed40 <= soc_netsoc_interface1_wb_sdram_stb;
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed41 <= 1'd0;
	case (vns_wb_sdram_con_grant)
		default: begin
			vns_rhs_array_muxed41 <= soc_netsoc_interface1_wb_sdram_we;
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed42 <= 3'd0;
	case (vns_wb_sdram_con_grant)
		default: begin
			vns_rhs_array_muxed42 <= soc_netsoc_interface1_wb_sdram_cti;
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed43 <= 2'd0;
	case (vns_wb_sdram_con_grant)
		default: begin
			vns_rhs_array_muxed43 <= soc_netsoc_interface1_wb_sdram_bte;
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed44 <= 30'd0;
	case (vns_netsoc_grant)
		1'd0: begin
			vns_rhs_array_muxed44 <= soc_netsoc_interface0_soc_bus_adr;
		end
		default: begin
			vns_rhs_array_muxed44 <= soc_netsoc_interface1_soc_bus_adr;
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed45 <= 32'd0;
	case (vns_netsoc_grant)
		1'd0: begin
			vns_rhs_array_muxed45 <= soc_netsoc_interface0_soc_bus_dat_w;
		end
		default: begin
			vns_rhs_array_muxed45 <= soc_netsoc_interface1_soc_bus_dat_w;
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed46 <= 4'd0;
	case (vns_netsoc_grant)
		1'd0: begin
			vns_rhs_array_muxed46 <= soc_netsoc_interface0_soc_bus_sel;
		end
		default: begin
			vns_rhs_array_muxed46 <= soc_netsoc_interface1_soc_bus_sel;
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed47 <= 1'd0;
	case (vns_netsoc_grant)
		1'd0: begin
			vns_rhs_array_muxed47 <= soc_netsoc_interface0_soc_bus_cyc;
		end
		default: begin
			vns_rhs_array_muxed47 <= soc_netsoc_interface1_soc_bus_cyc;
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed48 <= 1'd0;
	case (vns_netsoc_grant)
		1'd0: begin
			vns_rhs_array_muxed48 <= soc_netsoc_interface0_soc_bus_stb;
		end
		default: begin
			vns_rhs_array_muxed48 <= soc_netsoc_interface1_soc_bus_stb;
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed49 <= 1'd0;
	case (vns_netsoc_grant)
		1'd0: begin
			vns_rhs_array_muxed49 <= soc_netsoc_interface0_soc_bus_we;
		end
		default: begin
			vns_rhs_array_muxed49 <= soc_netsoc_interface1_soc_bus_we;
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed50 <= 3'd0;
	case (vns_netsoc_grant)
		1'd0: begin
			vns_rhs_array_muxed50 <= soc_netsoc_interface0_soc_bus_cti;
		end
		default: begin
			vns_rhs_array_muxed50 <= soc_netsoc_interface1_soc_bus_cti;
		end
	endcase
end
always @(*) begin
	vns_rhs_array_muxed51 <= 2'd0;
	case (vns_netsoc_grant)
		1'd0: begin
			vns_rhs_array_muxed51 <= soc_netsoc_interface0_soc_bus_bte;
		end
		default: begin
			vns_rhs_array_muxed51 <= soc_netsoc_interface1_soc_bus_bte;
		end
	endcase
end
always @(*) begin
	vns_array_muxed0 <= 3'd0;
	case (soc_netsoc_sdram_steerer_sel0)
		1'd0: begin
			vns_array_muxed0 <= soc_netsoc_sdram_nop_ba[2:0];
		end
		1'd1: begin
			vns_array_muxed0 <= soc_netsoc_sdram_choose_cmd_cmd_payload_ba[2:0];
		end
		2'd2: begin
			vns_array_muxed0 <= soc_netsoc_sdram_choose_req_cmd_payload_ba[2:0];
		end
		default: begin
			vns_array_muxed0 <= soc_netsoc_sdram_cmd_payload_ba[2:0];
		end
	endcase
end
always @(*) begin
	vns_array_muxed1 <= 14'd0;
	case (soc_netsoc_sdram_steerer_sel0)
		1'd0: begin
			vns_array_muxed1 <= soc_netsoc_sdram_nop_a;
		end
		1'd1: begin
			vns_array_muxed1 <= soc_netsoc_sdram_choose_cmd_cmd_payload_a;
		end
		2'd2: begin
			vns_array_muxed1 <= soc_netsoc_sdram_choose_req_cmd_payload_a;
		end
		default: begin
			vns_array_muxed1 <= soc_netsoc_sdram_cmd_payload_a;
		end
	endcase
end
always @(*) begin
	vns_array_muxed2 <= 1'd0;
	case (soc_netsoc_sdram_steerer_sel0)
		1'd0: begin
			vns_array_muxed2 <= 1'd0;
		end
		1'd1: begin
			vns_array_muxed2 <= ((soc_netsoc_sdram_choose_cmd_cmd_valid & soc_netsoc_sdram_choose_cmd_cmd_ready) & soc_netsoc_sdram_choose_cmd_cmd_payload_cas);
		end
		2'd2: begin
			vns_array_muxed2 <= ((soc_netsoc_sdram_choose_req_cmd_valid & soc_netsoc_sdram_choose_req_cmd_ready) & soc_netsoc_sdram_choose_req_cmd_payload_cas);
		end
		default: begin
			vns_array_muxed2 <= ((soc_netsoc_sdram_cmd_valid & soc_netsoc_sdram_cmd_ready) & soc_netsoc_sdram_cmd_payload_cas);
		end
	endcase
end
always @(*) begin
	vns_array_muxed3 <= 1'd0;
	case (soc_netsoc_sdram_steerer_sel0)
		1'd0: begin
			vns_array_muxed3 <= 1'd0;
		end
		1'd1: begin
			vns_array_muxed3 <= ((soc_netsoc_sdram_choose_cmd_cmd_valid & soc_netsoc_sdram_choose_cmd_cmd_ready) & soc_netsoc_sdram_choose_cmd_cmd_payload_ras);
		end
		2'd2: begin
			vns_array_muxed3 <= ((soc_netsoc_sdram_choose_req_cmd_valid & soc_netsoc_sdram_choose_req_cmd_ready) & soc_netsoc_sdram_choose_req_cmd_payload_ras);
		end
		default: begin
			vns_array_muxed3 <= ((soc_netsoc_sdram_cmd_valid & soc_netsoc_sdram_cmd_ready) & soc_netsoc_sdram_cmd_payload_ras);
		end
	endcase
end
always @(*) begin
	vns_array_muxed4 <= 1'd0;
	case (soc_netsoc_sdram_steerer_sel0)
		1'd0: begin
			vns_array_muxed4 <= 1'd0;
		end
		1'd1: begin
			vns_array_muxed4 <= ((soc_netsoc_sdram_choose_cmd_cmd_valid & soc_netsoc_sdram_choose_cmd_cmd_ready) & soc_netsoc_sdram_choose_cmd_cmd_payload_we);
		end
		2'd2: begin
			vns_array_muxed4 <= ((soc_netsoc_sdram_choose_req_cmd_valid & soc_netsoc_sdram_choose_req_cmd_ready) & soc_netsoc_sdram_choose_req_cmd_payload_we);
		end
		default: begin
			vns_array_muxed4 <= ((soc_netsoc_sdram_cmd_valid & soc_netsoc_sdram_cmd_ready) & soc_netsoc_sdram_cmd_payload_we);
		end
	endcase
end
always @(*) begin
	vns_array_muxed5 <= 1'd0;
	case (soc_netsoc_sdram_steerer_sel0)
		1'd0: begin
			vns_array_muxed5 <= 1'd0;
		end
		1'd1: begin
			vns_array_muxed5 <= ((soc_netsoc_sdram_choose_cmd_cmd_valid & soc_netsoc_sdram_choose_cmd_cmd_ready) & soc_netsoc_sdram_choose_cmd_cmd_payload_is_read);
		end
		2'd2: begin
			vns_array_muxed5 <= ((soc_netsoc_sdram_choose_req_cmd_valid & soc_netsoc_sdram_choose_req_cmd_ready) & soc_netsoc_sdram_choose_req_cmd_payload_is_read);
		end
		default: begin
			vns_array_muxed5 <= ((soc_netsoc_sdram_cmd_valid & soc_netsoc_sdram_cmd_ready) & soc_netsoc_sdram_cmd_payload_is_read);
		end
	endcase
end
always @(*) begin
	vns_array_muxed6 <= 1'd0;
	case (soc_netsoc_sdram_steerer_sel0)
		1'd0: begin
			vns_array_muxed6 <= 1'd0;
		end
		1'd1: begin
			vns_array_muxed6 <= ((soc_netsoc_sdram_choose_cmd_cmd_valid & soc_netsoc_sdram_choose_cmd_cmd_ready) & soc_netsoc_sdram_choose_cmd_cmd_payload_is_write);
		end
		2'd2: begin
			vns_array_muxed6 <= ((soc_netsoc_sdram_choose_req_cmd_valid & soc_netsoc_sdram_choose_req_cmd_ready) & soc_netsoc_sdram_choose_req_cmd_payload_is_write);
		end
		default: begin
			vns_array_muxed6 <= ((soc_netsoc_sdram_cmd_valid & soc_netsoc_sdram_cmd_ready) & soc_netsoc_sdram_cmd_payload_is_write);
		end
	endcase
end
always @(*) begin
	vns_array_muxed7 <= 3'd0;
	case (soc_netsoc_sdram_steerer_sel1)
		1'd0: begin
			vns_array_muxed7 <= soc_netsoc_sdram_nop_ba[2:0];
		end
		1'd1: begin
			vns_array_muxed7 <= soc_netsoc_sdram_choose_cmd_cmd_payload_ba[2:0];
		end
		2'd2: begin
			vns_array_muxed7 <= soc_netsoc_sdram_choose_req_cmd_payload_ba[2:0];
		end
		default: begin
			vns_array_muxed7 <= soc_netsoc_sdram_cmd_payload_ba[2:0];
		end
	endcase
end
always @(*) begin
	vns_array_muxed8 <= 14'd0;
	case (soc_netsoc_sdram_steerer_sel1)
		1'd0: begin
			vns_array_muxed8 <= soc_netsoc_sdram_nop_a;
		end
		1'd1: begin
			vns_array_muxed8 <= soc_netsoc_sdram_choose_cmd_cmd_payload_a;
		end
		2'd2: begin
			vns_array_muxed8 <= soc_netsoc_sdram_choose_req_cmd_payload_a;
		end
		default: begin
			vns_array_muxed8 <= soc_netsoc_sdram_cmd_payload_a;
		end
	endcase
end
always @(*) begin
	vns_array_muxed9 <= 1'd0;
	case (soc_netsoc_sdram_steerer_sel1)
		1'd0: begin
			vns_array_muxed9 <= 1'd0;
		end
		1'd1: begin
			vns_array_muxed9 <= ((soc_netsoc_sdram_choose_cmd_cmd_valid & soc_netsoc_sdram_choose_cmd_cmd_ready) & soc_netsoc_sdram_choose_cmd_cmd_payload_cas);
		end
		2'd2: begin
			vns_array_muxed9 <= ((soc_netsoc_sdram_choose_req_cmd_valid & soc_netsoc_sdram_choose_req_cmd_ready) & soc_netsoc_sdram_choose_req_cmd_payload_cas);
		end
		default: begin
			vns_array_muxed9 <= ((soc_netsoc_sdram_cmd_valid & soc_netsoc_sdram_cmd_ready) & soc_netsoc_sdram_cmd_payload_cas);
		end
	endcase
end
always @(*) begin
	vns_array_muxed10 <= 1'd0;
	case (soc_netsoc_sdram_steerer_sel1)
		1'd0: begin
			vns_array_muxed10 <= 1'd0;
		end
		1'd1: begin
			vns_array_muxed10 <= ((soc_netsoc_sdram_choose_cmd_cmd_valid & soc_netsoc_sdram_choose_cmd_cmd_ready) & soc_netsoc_sdram_choose_cmd_cmd_payload_ras);
		end
		2'd2: begin
			vns_array_muxed10 <= ((soc_netsoc_sdram_choose_req_cmd_valid & soc_netsoc_sdram_choose_req_cmd_ready) & soc_netsoc_sdram_choose_req_cmd_payload_ras);
		end
		default: begin
			vns_array_muxed10 <= ((soc_netsoc_sdram_cmd_valid & soc_netsoc_sdram_cmd_ready) & soc_netsoc_sdram_cmd_payload_ras);
		end
	endcase
end
always @(*) begin
	vns_array_muxed11 <= 1'd0;
	case (soc_netsoc_sdram_steerer_sel1)
		1'd0: begin
			vns_array_muxed11 <= 1'd0;
		end
		1'd1: begin
			vns_array_muxed11 <= ((soc_netsoc_sdram_choose_cmd_cmd_valid & soc_netsoc_sdram_choose_cmd_cmd_ready) & soc_netsoc_sdram_choose_cmd_cmd_payload_we);
		end
		2'd2: begin
			vns_array_muxed11 <= ((soc_netsoc_sdram_choose_req_cmd_valid & soc_netsoc_sdram_choose_req_cmd_ready) & soc_netsoc_sdram_choose_req_cmd_payload_we);
		end
		default: begin
			vns_array_muxed11 <= ((soc_netsoc_sdram_cmd_valid & soc_netsoc_sdram_cmd_ready) & soc_netsoc_sdram_cmd_payload_we);
		end
	endcase
end
always @(*) begin
	vns_array_muxed12 <= 1'd0;
	case (soc_netsoc_sdram_steerer_sel1)
		1'd0: begin
			vns_array_muxed12 <= 1'd0;
		end
		1'd1: begin
			vns_array_muxed12 <= ((soc_netsoc_sdram_choose_cmd_cmd_valid & soc_netsoc_sdram_choose_cmd_cmd_ready) & soc_netsoc_sdram_choose_cmd_cmd_payload_is_read);
		end
		2'd2: begin
			vns_array_muxed12 <= ((soc_netsoc_sdram_choose_req_cmd_valid & soc_netsoc_sdram_choose_req_cmd_ready) & soc_netsoc_sdram_choose_req_cmd_payload_is_read);
		end
		default: begin
			vns_array_muxed12 <= ((soc_netsoc_sdram_cmd_valid & soc_netsoc_sdram_cmd_ready) & soc_netsoc_sdram_cmd_payload_is_read);
		end
	endcase
end
always @(*) begin
	vns_array_muxed13 <= 1'd0;
	case (soc_netsoc_sdram_steerer_sel1)
		1'd0: begin
			vns_array_muxed13 <= 1'd0;
		end
		1'd1: begin
			vns_array_muxed13 <= ((soc_netsoc_sdram_choose_cmd_cmd_valid & soc_netsoc_sdram_choose_cmd_cmd_ready) & soc_netsoc_sdram_choose_cmd_cmd_payload_is_write);
		end
		2'd2: begin
			vns_array_muxed13 <= ((soc_netsoc_sdram_choose_req_cmd_valid & soc_netsoc_sdram_choose_req_cmd_ready) & soc_netsoc_sdram_choose_req_cmd_payload_is_write);
		end
		default: begin
			vns_array_muxed13 <= ((soc_netsoc_sdram_cmd_valid & soc_netsoc_sdram_cmd_ready) & soc_netsoc_sdram_cmd_payload_is_write);
		end
	endcase
end
always @(*) begin
	vns_array_muxed14 <= 3'd0;
	case (soc_netsoc_sdram_steerer_sel2)
		1'd0: begin
			vns_array_muxed14 <= soc_netsoc_sdram_nop_ba[2:0];
		end
		1'd1: begin
			vns_array_muxed14 <= soc_netsoc_sdram_choose_cmd_cmd_payload_ba[2:0];
		end
		2'd2: begin
			vns_array_muxed14 <= soc_netsoc_sdram_choose_req_cmd_payload_ba[2:0];
		end
		default: begin
			vns_array_muxed14 <= soc_netsoc_sdram_cmd_payload_ba[2:0];
		end
	endcase
end
always @(*) begin
	vns_array_muxed15 <= 14'd0;
	case (soc_netsoc_sdram_steerer_sel2)
		1'd0: begin
			vns_array_muxed15 <= soc_netsoc_sdram_nop_a;
		end
		1'd1: begin
			vns_array_muxed15 <= soc_netsoc_sdram_choose_cmd_cmd_payload_a;
		end
		2'd2: begin
			vns_array_muxed15 <= soc_netsoc_sdram_choose_req_cmd_payload_a;
		end
		default: begin
			vns_array_muxed15 <= soc_netsoc_sdram_cmd_payload_a;
		end
	endcase
end
always @(*) begin
	vns_array_muxed16 <= 1'd0;
	case (soc_netsoc_sdram_steerer_sel2)
		1'd0: begin
			vns_array_muxed16 <= 1'd0;
		end
		1'd1: begin
			vns_array_muxed16 <= ((soc_netsoc_sdram_choose_cmd_cmd_valid & soc_netsoc_sdram_choose_cmd_cmd_ready) & soc_netsoc_sdram_choose_cmd_cmd_payload_cas);
		end
		2'd2: begin
			vns_array_muxed16 <= ((soc_netsoc_sdram_choose_req_cmd_valid & soc_netsoc_sdram_choose_req_cmd_ready) & soc_netsoc_sdram_choose_req_cmd_payload_cas);
		end
		default: begin
			vns_array_muxed16 <= ((soc_netsoc_sdram_cmd_valid & soc_netsoc_sdram_cmd_ready) & soc_netsoc_sdram_cmd_payload_cas);
		end
	endcase
end
always @(*) begin
	vns_array_muxed17 <= 1'd0;
	case (soc_netsoc_sdram_steerer_sel2)
		1'd0: begin
			vns_array_muxed17 <= 1'd0;
		end
		1'd1: begin
			vns_array_muxed17 <= ((soc_netsoc_sdram_choose_cmd_cmd_valid & soc_netsoc_sdram_choose_cmd_cmd_ready) & soc_netsoc_sdram_choose_cmd_cmd_payload_ras);
		end
		2'd2: begin
			vns_array_muxed17 <= ((soc_netsoc_sdram_choose_req_cmd_valid & soc_netsoc_sdram_choose_req_cmd_ready) & soc_netsoc_sdram_choose_req_cmd_payload_ras);
		end
		default: begin
			vns_array_muxed17 <= ((soc_netsoc_sdram_cmd_valid & soc_netsoc_sdram_cmd_ready) & soc_netsoc_sdram_cmd_payload_ras);
		end
	endcase
end
always @(*) begin
	vns_array_muxed18 <= 1'd0;
	case (soc_netsoc_sdram_steerer_sel2)
		1'd0: begin
			vns_array_muxed18 <= 1'd0;
		end
		1'd1: begin
			vns_array_muxed18 <= ((soc_netsoc_sdram_choose_cmd_cmd_valid & soc_netsoc_sdram_choose_cmd_cmd_ready) & soc_netsoc_sdram_choose_cmd_cmd_payload_we);
		end
		2'd2: begin
			vns_array_muxed18 <= ((soc_netsoc_sdram_choose_req_cmd_valid & soc_netsoc_sdram_choose_req_cmd_ready) & soc_netsoc_sdram_choose_req_cmd_payload_we);
		end
		default: begin
			vns_array_muxed18 <= ((soc_netsoc_sdram_cmd_valid & soc_netsoc_sdram_cmd_ready) & soc_netsoc_sdram_cmd_payload_we);
		end
	endcase
end
always @(*) begin
	vns_array_muxed19 <= 1'd0;
	case (soc_netsoc_sdram_steerer_sel2)
		1'd0: begin
			vns_array_muxed19 <= 1'd0;
		end
		1'd1: begin
			vns_array_muxed19 <= ((soc_netsoc_sdram_choose_cmd_cmd_valid & soc_netsoc_sdram_choose_cmd_cmd_ready) & soc_netsoc_sdram_choose_cmd_cmd_payload_is_read);
		end
		2'd2: begin
			vns_array_muxed19 <= ((soc_netsoc_sdram_choose_req_cmd_valid & soc_netsoc_sdram_choose_req_cmd_ready) & soc_netsoc_sdram_choose_req_cmd_payload_is_read);
		end
		default: begin
			vns_array_muxed19 <= ((soc_netsoc_sdram_cmd_valid & soc_netsoc_sdram_cmd_ready) & soc_netsoc_sdram_cmd_payload_is_read);
		end
	endcase
end
always @(*) begin
	vns_array_muxed20 <= 1'd0;
	case (soc_netsoc_sdram_steerer_sel2)
		1'd0: begin
			vns_array_muxed20 <= 1'd0;
		end
		1'd1: begin
			vns_array_muxed20 <= ((soc_netsoc_sdram_choose_cmd_cmd_valid & soc_netsoc_sdram_choose_cmd_cmd_ready) & soc_netsoc_sdram_choose_cmd_cmd_payload_is_write);
		end
		2'd2: begin
			vns_array_muxed20 <= ((soc_netsoc_sdram_choose_req_cmd_valid & soc_netsoc_sdram_choose_req_cmd_ready) & soc_netsoc_sdram_choose_req_cmd_payload_is_write);
		end
		default: begin
			vns_array_muxed20 <= ((soc_netsoc_sdram_cmd_valid & soc_netsoc_sdram_cmd_ready) & soc_netsoc_sdram_cmd_payload_is_write);
		end
	endcase
end
always @(*) begin
	vns_array_muxed21 <= 3'd0;
	case (soc_netsoc_sdram_steerer_sel3)
		1'd0: begin
			vns_array_muxed21 <= soc_netsoc_sdram_nop_ba[2:0];
		end
		1'd1: begin
			vns_array_muxed21 <= soc_netsoc_sdram_choose_cmd_cmd_payload_ba[2:0];
		end
		2'd2: begin
			vns_array_muxed21 <= soc_netsoc_sdram_choose_req_cmd_payload_ba[2:0];
		end
		default: begin
			vns_array_muxed21 <= soc_netsoc_sdram_cmd_payload_ba[2:0];
		end
	endcase
end
always @(*) begin
	vns_array_muxed22 <= 14'd0;
	case (soc_netsoc_sdram_steerer_sel3)
		1'd0: begin
			vns_array_muxed22 <= soc_netsoc_sdram_nop_a;
		end
		1'd1: begin
			vns_array_muxed22 <= soc_netsoc_sdram_choose_cmd_cmd_payload_a;
		end
		2'd2: begin
			vns_array_muxed22 <= soc_netsoc_sdram_choose_req_cmd_payload_a;
		end
		default: begin
			vns_array_muxed22 <= soc_netsoc_sdram_cmd_payload_a;
		end
	endcase
end
always @(*) begin
	vns_array_muxed23 <= 1'd0;
	case (soc_netsoc_sdram_steerer_sel3)
		1'd0: begin
			vns_array_muxed23 <= 1'd0;
		end
		1'd1: begin
			vns_array_muxed23 <= ((soc_netsoc_sdram_choose_cmd_cmd_valid & soc_netsoc_sdram_choose_cmd_cmd_ready) & soc_netsoc_sdram_choose_cmd_cmd_payload_cas);
		end
		2'd2: begin
			vns_array_muxed23 <= ((soc_netsoc_sdram_choose_req_cmd_valid & soc_netsoc_sdram_choose_req_cmd_ready) & soc_netsoc_sdram_choose_req_cmd_payload_cas);
		end
		default: begin
			vns_array_muxed23 <= ((soc_netsoc_sdram_cmd_valid & soc_netsoc_sdram_cmd_ready) & soc_netsoc_sdram_cmd_payload_cas);
		end
	endcase
end
always @(*) begin
	vns_array_muxed24 <= 1'd0;
	case (soc_netsoc_sdram_steerer_sel3)
		1'd0: begin
			vns_array_muxed24 <= 1'd0;
		end
		1'd1: begin
			vns_array_muxed24 <= ((soc_netsoc_sdram_choose_cmd_cmd_valid & soc_netsoc_sdram_choose_cmd_cmd_ready) & soc_netsoc_sdram_choose_cmd_cmd_payload_ras);
		end
		2'd2: begin
			vns_array_muxed24 <= ((soc_netsoc_sdram_choose_req_cmd_valid & soc_netsoc_sdram_choose_req_cmd_ready) & soc_netsoc_sdram_choose_req_cmd_payload_ras);
		end
		default: begin
			vns_array_muxed24 <= ((soc_netsoc_sdram_cmd_valid & soc_netsoc_sdram_cmd_ready) & soc_netsoc_sdram_cmd_payload_ras);
		end
	endcase
end
always @(*) begin
	vns_array_muxed25 <= 1'd0;
	case (soc_netsoc_sdram_steerer_sel3)
		1'd0: begin
			vns_array_muxed25 <= 1'd0;
		end
		1'd1: begin
			vns_array_muxed25 <= ((soc_netsoc_sdram_choose_cmd_cmd_valid & soc_netsoc_sdram_choose_cmd_cmd_ready) & soc_netsoc_sdram_choose_cmd_cmd_payload_we);
		end
		2'd2: begin
			vns_array_muxed25 <= ((soc_netsoc_sdram_choose_req_cmd_valid & soc_netsoc_sdram_choose_req_cmd_ready) & soc_netsoc_sdram_choose_req_cmd_payload_we);
		end
		default: begin
			vns_array_muxed25 <= ((soc_netsoc_sdram_cmd_valid & soc_netsoc_sdram_cmd_ready) & soc_netsoc_sdram_cmd_payload_we);
		end
	endcase
end
always @(*) begin
	vns_array_muxed26 <= 1'd0;
	case (soc_netsoc_sdram_steerer_sel3)
		1'd0: begin
			vns_array_muxed26 <= 1'd0;
		end
		1'd1: begin
			vns_array_muxed26 <= ((soc_netsoc_sdram_choose_cmd_cmd_valid & soc_netsoc_sdram_choose_cmd_cmd_ready) & soc_netsoc_sdram_choose_cmd_cmd_payload_is_read);
		end
		2'd2: begin
			vns_array_muxed26 <= ((soc_netsoc_sdram_choose_req_cmd_valid & soc_netsoc_sdram_choose_req_cmd_ready) & soc_netsoc_sdram_choose_req_cmd_payload_is_read);
		end
		default: begin
			vns_array_muxed26 <= ((soc_netsoc_sdram_cmd_valid & soc_netsoc_sdram_cmd_ready) & soc_netsoc_sdram_cmd_payload_is_read);
		end
	endcase
end
always @(*) begin
	vns_array_muxed27 <= 1'd0;
	case (soc_netsoc_sdram_steerer_sel3)
		1'd0: begin
			vns_array_muxed27 <= 1'd0;
		end
		1'd1: begin
			vns_array_muxed27 <= ((soc_netsoc_sdram_choose_cmd_cmd_valid & soc_netsoc_sdram_choose_cmd_cmd_ready) & soc_netsoc_sdram_choose_cmd_cmd_payload_is_write);
		end
		2'd2: begin
			vns_array_muxed27 <= ((soc_netsoc_sdram_choose_req_cmd_valid & soc_netsoc_sdram_choose_req_cmd_ready) & soc_netsoc_sdram_choose_req_cmd_payload_is_write);
		end
		default: begin
			vns_array_muxed27 <= ((soc_netsoc_sdram_cmd_valid & soc_netsoc_sdram_cmd_ready) & soc_netsoc_sdram_cmd_payload_is_write);
		end
	endcase
end
assign soc_netsoc_uart_phy_rx = vns_xilinxmultiregimpl0_regs1;
assign vns_xilinxasyncresetsynchronizerimpl0 = ((~soc_pll_locked) | (~cpu_reset));
assign vns_xilinxasyncresetsynchronizerimpl1 = ((~soc_pll_locked) | (~cpu_reset));
always @(*) begin
	soc_status <= 1'd0;
	soc_status <= soc_r;
	soc_status <= vns_xilinxmultiregimpl1_regs1;
end
assign soc_ps_preamble_error_toggle_o = vns_xilinxmultiregimpl2_regs1;
assign soc_ps_crc_error_toggle_o = vns_xilinxmultiregimpl3_regs1;
assign soc_tx_cdc_produce_rdomain = vns_xilinxmultiregimpl4_regs1;
assign soc_tx_cdc_consume_wdomain = vns_xilinxmultiregimpl5_regs1;
assign soc_rx_cdc_produce_rdomain = vns_xilinxmultiregimpl6_regs1;
assign soc_rx_cdc_consume_wdomain = vns_xilinxmultiregimpl7_regs1;
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
	soc_liteethphymiirx_converter_reset <= (~eth_rx_dv);
	soc_liteethphymiirx_converter_sink_valid <= 1'd1;
	soc_liteethphymiirx_converter_sink_payload_data <= eth_rx_data;
	if (soc_liteethphymiirx_converter_converter_source_ready) begin
		soc_liteethphymiirx_converter_converter_strobe_all <= 1'd0;
	end
	if (soc_liteethphymiirx_converter_converter_load_part) begin
		if (((soc_liteethphymiirx_converter_converter_demux == 1'd1) | soc_liteethphymiirx_converter_converter_sink_last)) begin
			soc_liteethphymiirx_converter_converter_demux <= 1'd0;
			soc_liteethphymiirx_converter_converter_strobe_all <= 1'd1;
		end else begin
			soc_liteethphymiirx_converter_converter_demux <= (soc_liteethphymiirx_converter_converter_demux + 1'd1);
		end
	end
	if ((soc_liteethphymiirx_converter_converter_source_valid & soc_liteethphymiirx_converter_converter_source_ready)) begin
		if ((soc_liteethphymiirx_converter_converter_sink_valid & soc_liteethphymiirx_converter_converter_sink_ready)) begin
			soc_liteethphymiirx_converter_converter_source_first <= soc_liteethphymiirx_converter_converter_sink_first;
			soc_liteethphymiirx_converter_converter_source_last <= soc_liteethphymiirx_converter_converter_sink_last;
		end else begin
			soc_liteethphymiirx_converter_converter_source_first <= 1'd0;
			soc_liteethphymiirx_converter_converter_source_last <= 1'd0;
		end
	end else begin
		if ((soc_liteethphymiirx_converter_converter_sink_valid & soc_liteethphymiirx_converter_converter_sink_ready)) begin
			soc_liteethphymiirx_converter_converter_source_first <= (soc_liteethphymiirx_converter_converter_sink_first | soc_liteethphymiirx_converter_converter_source_first);
			soc_liteethphymiirx_converter_converter_source_last <= (soc_liteethphymiirx_converter_converter_sink_last | soc_liteethphymiirx_converter_converter_source_last);
		end
	end
	if (soc_liteethphymiirx_converter_converter_load_part) begin
		case (soc_liteethphymiirx_converter_converter_demux)
			1'd0: begin
				soc_liteethphymiirx_converter_converter_source_payload_data[3:0] <= soc_liteethphymiirx_converter_converter_sink_payload_data;
			end
			1'd1: begin
				soc_liteethphymiirx_converter_converter_source_payload_data[7:4] <= soc_liteethphymiirx_converter_converter_sink_payload_data;
			end
		endcase
	end
	if (soc_liteethphymiirx_converter_converter_load_part) begin
		soc_liteethphymiirx_converter_converter_source_payload_valid_token_count <= (soc_liteethphymiirx_converter_converter_demux + 1'd1);
	end
	if (soc_liteethphymiirx_converter_reset) begin
		soc_liteethphymiirx_converter_converter_source_first <= 1'd0;
		soc_liteethphymiirx_converter_converter_source_last <= 1'd0;
		soc_liteethphymiirx_converter_converter_source_payload_data <= 8'd0;
		soc_liteethphymiirx_converter_converter_source_payload_valid_token_count <= 2'd0;
		soc_liteethphymiirx_converter_converter_demux <= 1'd0;
		soc_liteethphymiirx_converter_converter_strobe_all <= 1'd0;
	end
	vns_liteethmacpreamblechecker_state <= vns_liteethmacpreamblechecker_next_state;
	if (soc_crc32_checker_crc_ce) begin
		soc_crc32_checker_crc_reg <= soc_crc32_checker_crc_next;
	end
	if (soc_crc32_checker_crc_reset) begin
		soc_crc32_checker_crc_reg <= 32'd4294967295;
	end
	if (((soc_crc32_checker_syncfifo_syncfifo_we & soc_crc32_checker_syncfifo_syncfifo_writable) & (~soc_crc32_checker_syncfifo_replace))) begin
		if ((soc_crc32_checker_syncfifo_produce == 3'd4)) begin
			soc_crc32_checker_syncfifo_produce <= 1'd0;
		end else begin
			soc_crc32_checker_syncfifo_produce <= (soc_crc32_checker_syncfifo_produce + 1'd1);
		end
	end
	if (soc_crc32_checker_syncfifo_do_read) begin
		if ((soc_crc32_checker_syncfifo_consume == 3'd4)) begin
			soc_crc32_checker_syncfifo_consume <= 1'd0;
		end else begin
			soc_crc32_checker_syncfifo_consume <= (soc_crc32_checker_syncfifo_consume + 1'd1);
		end
	end
	if (((soc_crc32_checker_syncfifo_syncfifo_we & soc_crc32_checker_syncfifo_syncfifo_writable) & (~soc_crc32_checker_syncfifo_replace))) begin
		if ((~soc_crc32_checker_syncfifo_do_read)) begin
			soc_crc32_checker_syncfifo_level <= (soc_crc32_checker_syncfifo_level + 1'd1);
		end
	end else begin
		if (soc_crc32_checker_syncfifo_do_read) begin
			soc_crc32_checker_syncfifo_level <= (soc_crc32_checker_syncfifo_level - 1'd1);
		end
	end
	if (soc_crc32_checker_fifo_reset) begin
		soc_crc32_checker_syncfifo_level <= 3'd0;
		soc_crc32_checker_syncfifo_produce <= 3'd0;
		soc_crc32_checker_syncfifo_consume <= 3'd0;
	end
	vns_liteethmaccrc32checker_state <= vns_liteethmaccrc32checker_next_state;
	if (soc_ps_preamble_error_i) begin
		soc_ps_preamble_error_toggle_i <= (~soc_ps_preamble_error_toggle_i);
	end
	if (soc_ps_crc_error_i) begin
		soc_ps_crc_error_toggle_i <= (~soc_ps_crc_error_toggle_i);
	end
	if (soc_rx_converter_converter_source_ready) begin
		soc_rx_converter_converter_strobe_all <= 1'd0;
	end
	if (soc_rx_converter_converter_load_part) begin
		if (((soc_rx_converter_converter_demux == 2'd3) | soc_rx_converter_converter_sink_last)) begin
			soc_rx_converter_converter_demux <= 1'd0;
			soc_rx_converter_converter_strobe_all <= 1'd1;
		end else begin
			soc_rx_converter_converter_demux <= (soc_rx_converter_converter_demux + 1'd1);
		end
	end
	if ((soc_rx_converter_converter_source_valid & soc_rx_converter_converter_source_ready)) begin
		if ((soc_rx_converter_converter_sink_valid & soc_rx_converter_converter_sink_ready)) begin
			soc_rx_converter_converter_source_first <= soc_rx_converter_converter_sink_first;
			soc_rx_converter_converter_source_last <= soc_rx_converter_converter_sink_last;
		end else begin
			soc_rx_converter_converter_source_first <= 1'd0;
			soc_rx_converter_converter_source_last <= 1'd0;
		end
	end else begin
		if ((soc_rx_converter_converter_sink_valid & soc_rx_converter_converter_sink_ready)) begin
			soc_rx_converter_converter_source_first <= (soc_rx_converter_converter_sink_first | soc_rx_converter_converter_source_first);
			soc_rx_converter_converter_source_last <= (soc_rx_converter_converter_sink_last | soc_rx_converter_converter_source_last);
		end
	end
	if (soc_rx_converter_converter_load_part) begin
		case (soc_rx_converter_converter_demux)
			1'd0: begin
				soc_rx_converter_converter_source_payload_data[9:0] <= soc_rx_converter_converter_sink_payload_data;
			end
			1'd1: begin
				soc_rx_converter_converter_source_payload_data[19:10] <= soc_rx_converter_converter_sink_payload_data;
			end
			2'd2: begin
				soc_rx_converter_converter_source_payload_data[29:20] <= soc_rx_converter_converter_sink_payload_data;
			end
			2'd3: begin
				soc_rx_converter_converter_source_payload_data[39:30] <= soc_rx_converter_converter_sink_payload_data;
			end
		endcase
	end
	if (soc_rx_converter_converter_load_part) begin
		soc_rx_converter_converter_source_payload_valid_token_count <= (soc_rx_converter_converter_demux + 1'd1);
	end
	soc_rx_cdc_graycounter0_q_binary <= soc_rx_cdc_graycounter0_q_next_binary;
	soc_rx_cdc_graycounter0_q <= soc_rx_cdc_graycounter0_q_next;
	if (eth_rx_rst) begin
		soc_liteethphymiirx_converter_sink_valid <= 1'd0;
		soc_liteethphymiirx_converter_sink_payload_data <= 4'd0;
		soc_liteethphymiirx_converter_converter_source_first <= 1'd0;
		soc_liteethphymiirx_converter_converter_source_last <= 1'd0;
		soc_liteethphymiirx_converter_converter_source_payload_data <= 8'd0;
		soc_liteethphymiirx_converter_converter_source_payload_valid_token_count <= 2'd0;
		soc_liteethphymiirx_converter_converter_demux <= 1'd0;
		soc_liteethphymiirx_converter_converter_strobe_all <= 1'd0;
		soc_liteethphymiirx_converter_reset <= 1'd0;
		soc_crc32_checker_crc_reg <= 32'd4294967295;
		soc_crc32_checker_syncfifo_level <= 3'd0;
		soc_crc32_checker_syncfifo_produce <= 3'd0;
		soc_crc32_checker_syncfifo_consume <= 3'd0;
		soc_rx_converter_converter_source_first <= 1'd0;
		soc_rx_converter_converter_source_last <= 1'd0;
		soc_rx_converter_converter_source_payload_data <= 40'd0;
		soc_rx_converter_converter_source_payload_valid_token_count <= 3'd0;
		soc_rx_converter_converter_demux <= 2'd0;
		soc_rx_converter_converter_strobe_all <= 1'd0;
		soc_rx_cdc_graycounter0_q <= 7'd0;
		soc_rx_cdc_graycounter0_q_binary <= 7'd0;
		vns_liteethmacpreamblechecker_state <= 1'd0;
		vns_liteethmaccrc32checker_state <= 2'd0;
	end
	vns_xilinxmultiregimpl7_regs0 <= soc_rx_cdc_graycounter1_q;
	vns_xilinxmultiregimpl7_regs1 <= vns_xilinxmultiregimpl7_regs0;
end
always @(posedge eth_tx_clk) begin
	eth_tx_en <= soc_liteethphymiitx_converter_source_valid;
	eth_tx_data <= soc_liteethphymiitx_converter_source_payload_data;
	if ((soc_liteethphymiitx_converter_converter_source_valid & soc_liteethphymiitx_converter_converter_source_ready)) begin
		if (soc_liteethphymiitx_converter_converter_last) begin
			soc_liteethphymiitx_converter_converter_mux <= 1'd0;
		end else begin
			soc_liteethphymiitx_converter_converter_mux <= (soc_liteethphymiitx_converter_converter_mux + 1'd1);
		end
	end
	if (soc_tx_gap_inserter_counter_reset) begin
		soc_tx_gap_inserter_counter <= 1'd0;
	end else begin
		if (soc_tx_gap_inserter_counter_ce) begin
			soc_tx_gap_inserter_counter <= (soc_tx_gap_inserter_counter + 1'd1);
		end
	end
	vns_liteethmacgap_state <= vns_liteethmacgap_next_state;
	if (soc_preamble_inserter_clr_cnt) begin
		soc_preamble_inserter_cnt <= 1'd0;
	end else begin
		if (soc_preamble_inserter_inc_cnt) begin
			soc_preamble_inserter_cnt <= (soc_preamble_inserter_cnt + 1'd1);
		end
	end
	vns_liteethmacpreambleinserter_state <= vns_liteethmacpreambleinserter_next_state;
	if (soc_crc32_inserter_is_ongoing0) begin
		soc_crc32_inserter_cnt <= 2'd3;
	end else begin
		if ((soc_crc32_inserter_is_ongoing1 & (~soc_crc32_inserter_cnt_done))) begin
			soc_crc32_inserter_cnt <= (soc_crc32_inserter_cnt - soc_crc32_inserter_source_ready);
		end
	end
	if (soc_crc32_inserter_ce) begin
		soc_crc32_inserter_reg <= soc_crc32_inserter_next;
	end
	if (soc_crc32_inserter_reset) begin
		soc_crc32_inserter_reg <= 32'd4294967295;
	end
	vns_liteethmaccrc32inserter_state <= vns_liteethmaccrc32inserter_next_state;
	if (soc_padding_inserter_counter_reset) begin
		soc_padding_inserter_counter <= 1'd0;
	end else begin
		if (soc_padding_inserter_counter_ce) begin
			soc_padding_inserter_counter <= (soc_padding_inserter_counter + 1'd1);
		end
	end
	vns_liteethmacpaddinginserter_state <= vns_liteethmacpaddinginserter_next_state;
	if ((soc_tx_last_be_sink_valid & soc_tx_last_be_sink_ready)) begin
		if (soc_tx_last_be_sink_last) begin
			soc_tx_last_be_ongoing <= 1'd1;
		end else begin
			if (soc_tx_last_be_sink_payload_last_be) begin
				soc_tx_last_be_ongoing <= 1'd0;
			end
		end
	end
	if ((soc_tx_converter_converter_source_valid & soc_tx_converter_converter_source_ready)) begin
		if (soc_tx_converter_converter_last) begin
			soc_tx_converter_converter_mux <= 1'd0;
		end else begin
			soc_tx_converter_converter_mux <= (soc_tx_converter_converter_mux + 1'd1);
		end
	end
	soc_tx_cdc_graycounter1_q_binary <= soc_tx_cdc_graycounter1_q_next_binary;
	soc_tx_cdc_graycounter1_q <= soc_tx_cdc_graycounter1_q_next;
	if (eth_tx_rst) begin
		soc_liteethphymiitx_converter_converter_mux <= 1'd0;
		soc_crc32_inserter_reg <= 32'd4294967295;
		soc_crc32_inserter_cnt <= 2'd3;
		soc_padding_inserter_counter <= 16'd1;
		soc_tx_last_be_ongoing <= 1'd1;
		soc_tx_converter_converter_mux <= 2'd0;
		soc_tx_cdc_graycounter1_q <= 7'd0;
		soc_tx_cdc_graycounter1_q_binary <= 7'd0;
		vns_liteethmacgap_state <= 1'd0;
		vns_liteethmacpreambleinserter_state <= 2'd0;
		vns_liteethmaccrc32inserter_state <= 2'd0;
		vns_liteethmacpaddinginserter_state <= 1'd0;
	end
	vns_xilinxmultiregimpl4_regs0 <= soc_tx_cdc_graycounter0_q;
	vns_xilinxmultiregimpl4_regs1 <= vns_xilinxmultiregimpl4_regs0;
end
always @(posedge sys_clk) begin
	if ((soc_netsoc_ctrl_bus_errors != 32'd4294967295)) begin
		if (soc_netsoc_ctrl_bus_error) begin
			soc_netsoc_ctrl_bus_errors <= (soc_netsoc_ctrl_bus_errors + 1'd1);
		end
	end
	soc_netsoc_cpu_time <= (soc_netsoc_cpu_time + 1'd1);
	if (soc_netsoc_cpu_latch_re) begin
		soc_netsoc_cpu_time_status <= soc_netsoc_cpu_time;
	end
	if (soc_netsoc_cpu_latch_re) begin
		soc_netsoc_cpu_time_cmp <= soc_netsoc_cpu_time_cmp_storage;
	end
	soc_netsoc_rom_bus_ack <= 1'd0;
	if (((soc_netsoc_rom_bus_cyc & soc_netsoc_rom_bus_stb) & (~soc_netsoc_rom_bus_ack))) begin
		soc_netsoc_rom_bus_ack <= 1'd1;
	end
	soc_netsoc_sram_bus_ack <= 1'd0;
	if (((soc_netsoc_sram_bus_cyc & soc_netsoc_sram_bus_stb) & (~soc_netsoc_sram_bus_ack))) begin
		soc_netsoc_sram_bus_ack <= 1'd1;
	end
	soc_netsoc_uart_phy_sink_ready <= 1'd0;
	if (((soc_netsoc_uart_phy_sink_valid & (~soc_netsoc_uart_phy_tx_busy)) & (~soc_netsoc_uart_phy_sink_ready))) begin
		soc_netsoc_uart_phy_tx_reg <= soc_netsoc_uart_phy_sink_payload_data;
		soc_netsoc_uart_phy_tx_bitcount <= 1'd0;
		soc_netsoc_uart_phy_tx_busy <= 1'd1;
		serial_tx <= 1'd0;
	end else begin
		if ((soc_netsoc_uart_phy_uart_clk_txen & soc_netsoc_uart_phy_tx_busy)) begin
			soc_netsoc_uart_phy_tx_bitcount <= (soc_netsoc_uart_phy_tx_bitcount + 1'd1);
			if ((soc_netsoc_uart_phy_tx_bitcount == 4'd8)) begin
				serial_tx <= 1'd1;
			end else begin
				if ((soc_netsoc_uart_phy_tx_bitcount == 4'd9)) begin
					serial_tx <= 1'd1;
					soc_netsoc_uart_phy_tx_busy <= 1'd0;
					soc_netsoc_uart_phy_sink_ready <= 1'd1;
				end else begin
					serial_tx <= soc_netsoc_uart_phy_tx_reg[0];
					soc_netsoc_uart_phy_tx_reg <= {1'd0, soc_netsoc_uart_phy_tx_reg[7:1]};
				end
			end
		end
	end
	if (soc_netsoc_uart_phy_tx_busy) begin
		{soc_netsoc_uart_phy_uart_clk_txen, soc_netsoc_uart_phy_phase_accumulator_tx} <= (soc_netsoc_uart_phy_phase_accumulator_tx + soc_netsoc_uart_phy_storage);
	end else begin
		{soc_netsoc_uart_phy_uart_clk_txen, soc_netsoc_uart_phy_phase_accumulator_tx} <= 1'd0;
	end
	soc_netsoc_uart_phy_source_valid <= 1'd0;
	soc_netsoc_uart_phy_rx_r <= soc_netsoc_uart_phy_rx;
	if ((~soc_netsoc_uart_phy_rx_busy)) begin
		if (((~soc_netsoc_uart_phy_rx) & soc_netsoc_uart_phy_rx_r)) begin
			soc_netsoc_uart_phy_rx_busy <= 1'd1;
			soc_netsoc_uart_phy_rx_bitcount <= 1'd0;
		end
	end else begin
		if (soc_netsoc_uart_phy_uart_clk_rxen) begin
			soc_netsoc_uart_phy_rx_bitcount <= (soc_netsoc_uart_phy_rx_bitcount + 1'd1);
			if ((soc_netsoc_uart_phy_rx_bitcount == 1'd0)) begin
				if (soc_netsoc_uart_phy_rx) begin
					soc_netsoc_uart_phy_rx_busy <= 1'd0;
				end
			end else begin
				if ((soc_netsoc_uart_phy_rx_bitcount == 4'd9)) begin
					soc_netsoc_uart_phy_rx_busy <= 1'd0;
					if (soc_netsoc_uart_phy_rx) begin
						soc_netsoc_uart_phy_source_payload_data <= soc_netsoc_uart_phy_rx_reg;
						soc_netsoc_uart_phy_source_valid <= 1'd1;
					end
				end else begin
					soc_netsoc_uart_phy_rx_reg <= {soc_netsoc_uart_phy_rx, soc_netsoc_uart_phy_rx_reg[7:1]};
				end
			end
		end
	end
	if (soc_netsoc_uart_phy_rx_busy) begin
		{soc_netsoc_uart_phy_uart_clk_rxen, soc_netsoc_uart_phy_phase_accumulator_rx} <= (soc_netsoc_uart_phy_phase_accumulator_rx + soc_netsoc_uart_phy_storage);
	end else begin
		{soc_netsoc_uart_phy_uart_clk_rxen, soc_netsoc_uart_phy_phase_accumulator_rx} <= 32'd2147483648;
	end
	if (soc_netsoc_uart_tx_clear) begin
		soc_netsoc_uart_tx_pending <= 1'd0;
	end
	soc_netsoc_uart_tx_old_trigger <= soc_netsoc_uart_tx_trigger;
	if (((~soc_netsoc_uart_tx_trigger) & soc_netsoc_uart_tx_old_trigger)) begin
		soc_netsoc_uart_tx_pending <= 1'd1;
	end
	if (soc_netsoc_uart_rx_clear) begin
		soc_netsoc_uart_rx_pending <= 1'd0;
	end
	soc_netsoc_uart_rx_old_trigger <= soc_netsoc_uart_rx_trigger;
	if (((~soc_netsoc_uart_rx_trigger) & soc_netsoc_uart_rx_old_trigger)) begin
		soc_netsoc_uart_rx_pending <= 1'd1;
	end
	if (soc_netsoc_uart_tx_fifo_syncfifo_re) begin
		soc_netsoc_uart_tx_fifo_readable <= 1'd1;
	end else begin
		if (soc_netsoc_uart_tx_fifo_re) begin
			soc_netsoc_uart_tx_fifo_readable <= 1'd0;
		end
	end
	if (((soc_netsoc_uart_tx_fifo_syncfifo_we & soc_netsoc_uart_tx_fifo_syncfifo_writable) & (~soc_netsoc_uart_tx_fifo_replace))) begin
		soc_netsoc_uart_tx_fifo_produce <= (soc_netsoc_uart_tx_fifo_produce + 1'd1);
	end
	if (soc_netsoc_uart_tx_fifo_do_read) begin
		soc_netsoc_uart_tx_fifo_consume <= (soc_netsoc_uart_tx_fifo_consume + 1'd1);
	end
	if (((soc_netsoc_uart_tx_fifo_syncfifo_we & soc_netsoc_uart_tx_fifo_syncfifo_writable) & (~soc_netsoc_uart_tx_fifo_replace))) begin
		if ((~soc_netsoc_uart_tx_fifo_do_read)) begin
			soc_netsoc_uart_tx_fifo_level0 <= (soc_netsoc_uart_tx_fifo_level0 + 1'd1);
		end
	end else begin
		if (soc_netsoc_uart_tx_fifo_do_read) begin
			soc_netsoc_uart_tx_fifo_level0 <= (soc_netsoc_uart_tx_fifo_level0 - 1'd1);
		end
	end
	if (soc_netsoc_uart_rx_fifo_syncfifo_re) begin
		soc_netsoc_uart_rx_fifo_readable <= 1'd1;
	end else begin
		if (soc_netsoc_uart_rx_fifo_re) begin
			soc_netsoc_uart_rx_fifo_readable <= 1'd0;
		end
	end
	if (((soc_netsoc_uart_rx_fifo_syncfifo_we & soc_netsoc_uart_rx_fifo_syncfifo_writable) & (~soc_netsoc_uart_rx_fifo_replace))) begin
		soc_netsoc_uart_rx_fifo_produce <= (soc_netsoc_uart_rx_fifo_produce + 1'd1);
	end
	if (soc_netsoc_uart_rx_fifo_do_read) begin
		soc_netsoc_uart_rx_fifo_consume <= (soc_netsoc_uart_rx_fifo_consume + 1'd1);
	end
	if (((soc_netsoc_uart_rx_fifo_syncfifo_we & soc_netsoc_uart_rx_fifo_syncfifo_writable) & (~soc_netsoc_uart_rx_fifo_replace))) begin
		if ((~soc_netsoc_uart_rx_fifo_do_read)) begin
			soc_netsoc_uart_rx_fifo_level0 <= (soc_netsoc_uart_rx_fifo_level0 + 1'd1);
		end
	end else begin
		if (soc_netsoc_uart_rx_fifo_do_read) begin
			soc_netsoc_uart_rx_fifo_level0 <= (soc_netsoc_uart_rx_fifo_level0 - 1'd1);
		end
	end
	if (soc_netsoc_uart_reset) begin
		soc_netsoc_uart_tx_pending <= 1'd0;
		soc_netsoc_uart_tx_old_trigger <= 1'd0;
		soc_netsoc_uart_rx_pending <= 1'd0;
		soc_netsoc_uart_rx_old_trigger <= 1'd0;
		soc_netsoc_uart_tx_fifo_readable <= 1'd0;
		soc_netsoc_uart_tx_fifo_level0 <= 5'd0;
		soc_netsoc_uart_tx_fifo_produce <= 4'd0;
		soc_netsoc_uart_tx_fifo_consume <= 4'd0;
		soc_netsoc_uart_rx_fifo_readable <= 1'd0;
		soc_netsoc_uart_rx_fifo_level0 <= 5'd0;
		soc_netsoc_uart_rx_fifo_produce <= 4'd0;
		soc_netsoc_uart_rx_fifo_consume <= 4'd0;
	end
	if (soc_netsoc_timer0_en_storage) begin
		if ((soc_netsoc_timer0_value == 1'd0)) begin
			soc_netsoc_timer0_value <= soc_netsoc_timer0_reload_storage;
		end else begin
			soc_netsoc_timer0_value <= (soc_netsoc_timer0_value - 1'd1);
		end
	end else begin
		soc_netsoc_timer0_value <= soc_netsoc_timer0_load_storage;
	end
	if (soc_netsoc_timer0_update_value_re) begin
		soc_netsoc_timer0_value_status <= soc_netsoc_timer0_value;
	end
	if (soc_netsoc_timer0_zero_clear) begin
		soc_netsoc_timer0_zero_pending <= 1'd0;
	end
	soc_netsoc_timer0_zero_old_trigger <= soc_netsoc_timer0_zero_trigger;
	if (((~soc_netsoc_timer0_zero_trigger) & soc_netsoc_timer0_zero_old_trigger)) begin
		soc_netsoc_timer0_zero_pending <= 1'd1;
	end
	vns_wb2csr_state <= vns_wb2csr_next_state;
	soc_emulator_ram_bus_ack <= 1'd0;
	if (((soc_emulator_ram_bus_cyc & soc_emulator_ram_bus_stb) & (~soc_emulator_ram_bus_ack))) begin
		soc_emulator_ram_bus_ack <= 1'd1;
	end
	if (soc_a7ddrphy_dly_sel_storage[0]) begin
		if (soc_a7ddrphy_rdly_dq_bitslip_rst_re) begin
			soc_a7ddrphy_bitslip0_value <= 1'd0;
		end else begin
			if (soc_a7ddrphy_rdly_dq_bitslip_re) begin
				soc_a7ddrphy_bitslip0_value <= (soc_a7ddrphy_bitslip0_value + 1'd1);
			end
		end
	end
	if (soc_a7ddrphy_dly_sel_storage[0]) begin
		if (soc_a7ddrphy_rdly_dq_bitslip_rst_re) begin
			soc_a7ddrphy_bitslip1_value <= 1'd0;
		end else begin
			if (soc_a7ddrphy_rdly_dq_bitslip_re) begin
				soc_a7ddrphy_bitslip1_value <= (soc_a7ddrphy_bitslip1_value + 1'd1);
			end
		end
	end
	if (soc_a7ddrphy_dly_sel_storage[0]) begin
		if (soc_a7ddrphy_rdly_dq_bitslip_rst_re) begin
			soc_a7ddrphy_bitslip2_value <= 1'd0;
		end else begin
			if (soc_a7ddrphy_rdly_dq_bitslip_re) begin
				soc_a7ddrphy_bitslip2_value <= (soc_a7ddrphy_bitslip2_value + 1'd1);
			end
		end
	end
	if (soc_a7ddrphy_dly_sel_storage[0]) begin
		if (soc_a7ddrphy_rdly_dq_bitslip_rst_re) begin
			soc_a7ddrphy_bitslip3_value <= 1'd0;
		end else begin
			if (soc_a7ddrphy_rdly_dq_bitslip_re) begin
				soc_a7ddrphy_bitslip3_value <= (soc_a7ddrphy_bitslip3_value + 1'd1);
			end
		end
	end
	if (soc_a7ddrphy_dly_sel_storage[0]) begin
		if (soc_a7ddrphy_rdly_dq_bitslip_rst_re) begin
			soc_a7ddrphy_bitslip4_value <= 1'd0;
		end else begin
			if (soc_a7ddrphy_rdly_dq_bitslip_re) begin
				soc_a7ddrphy_bitslip4_value <= (soc_a7ddrphy_bitslip4_value + 1'd1);
			end
		end
	end
	if (soc_a7ddrphy_dly_sel_storage[0]) begin
		if (soc_a7ddrphy_rdly_dq_bitslip_rst_re) begin
			soc_a7ddrphy_bitslip5_value <= 1'd0;
		end else begin
			if (soc_a7ddrphy_rdly_dq_bitslip_re) begin
				soc_a7ddrphy_bitslip5_value <= (soc_a7ddrphy_bitslip5_value + 1'd1);
			end
		end
	end
	if (soc_a7ddrphy_dly_sel_storage[0]) begin
		if (soc_a7ddrphy_rdly_dq_bitslip_rst_re) begin
			soc_a7ddrphy_bitslip6_value <= 1'd0;
		end else begin
			if (soc_a7ddrphy_rdly_dq_bitslip_re) begin
				soc_a7ddrphy_bitslip6_value <= (soc_a7ddrphy_bitslip6_value + 1'd1);
			end
		end
	end
	if (soc_a7ddrphy_dly_sel_storage[0]) begin
		if (soc_a7ddrphy_rdly_dq_bitslip_rst_re) begin
			soc_a7ddrphy_bitslip7_value <= 1'd0;
		end else begin
			if (soc_a7ddrphy_rdly_dq_bitslip_re) begin
				soc_a7ddrphy_bitslip7_value <= (soc_a7ddrphy_bitslip7_value + 1'd1);
			end
		end
	end
	if (soc_a7ddrphy_dly_sel_storage[1]) begin
		if (soc_a7ddrphy_rdly_dq_bitslip_rst_re) begin
			soc_a7ddrphy_bitslip8_value <= 1'd0;
		end else begin
			if (soc_a7ddrphy_rdly_dq_bitslip_re) begin
				soc_a7ddrphy_bitslip8_value <= (soc_a7ddrphy_bitslip8_value + 1'd1);
			end
		end
	end
	if (soc_a7ddrphy_dly_sel_storage[1]) begin
		if (soc_a7ddrphy_rdly_dq_bitslip_rst_re) begin
			soc_a7ddrphy_bitslip9_value <= 1'd0;
		end else begin
			if (soc_a7ddrphy_rdly_dq_bitslip_re) begin
				soc_a7ddrphy_bitslip9_value <= (soc_a7ddrphy_bitslip9_value + 1'd1);
			end
		end
	end
	if (soc_a7ddrphy_dly_sel_storage[1]) begin
		if (soc_a7ddrphy_rdly_dq_bitslip_rst_re) begin
			soc_a7ddrphy_bitslip10_value <= 1'd0;
		end else begin
			if (soc_a7ddrphy_rdly_dq_bitslip_re) begin
				soc_a7ddrphy_bitslip10_value <= (soc_a7ddrphy_bitslip10_value + 1'd1);
			end
		end
	end
	if (soc_a7ddrphy_dly_sel_storage[1]) begin
		if (soc_a7ddrphy_rdly_dq_bitslip_rst_re) begin
			soc_a7ddrphy_bitslip11_value <= 1'd0;
		end else begin
			if (soc_a7ddrphy_rdly_dq_bitslip_re) begin
				soc_a7ddrphy_bitslip11_value <= (soc_a7ddrphy_bitslip11_value + 1'd1);
			end
		end
	end
	if (soc_a7ddrphy_dly_sel_storage[1]) begin
		if (soc_a7ddrphy_rdly_dq_bitslip_rst_re) begin
			soc_a7ddrphy_bitslip12_value <= 1'd0;
		end else begin
			if (soc_a7ddrphy_rdly_dq_bitslip_re) begin
				soc_a7ddrphy_bitslip12_value <= (soc_a7ddrphy_bitslip12_value + 1'd1);
			end
		end
	end
	if (soc_a7ddrphy_dly_sel_storage[1]) begin
		if (soc_a7ddrphy_rdly_dq_bitslip_rst_re) begin
			soc_a7ddrphy_bitslip13_value <= 1'd0;
		end else begin
			if (soc_a7ddrphy_rdly_dq_bitslip_re) begin
				soc_a7ddrphy_bitslip13_value <= (soc_a7ddrphy_bitslip13_value + 1'd1);
			end
		end
	end
	if (soc_a7ddrphy_dly_sel_storage[1]) begin
		if (soc_a7ddrphy_rdly_dq_bitslip_rst_re) begin
			soc_a7ddrphy_bitslip14_value <= 1'd0;
		end else begin
			if (soc_a7ddrphy_rdly_dq_bitslip_re) begin
				soc_a7ddrphy_bitslip14_value <= (soc_a7ddrphy_bitslip14_value + 1'd1);
			end
		end
	end
	if (soc_a7ddrphy_dly_sel_storage[1]) begin
		if (soc_a7ddrphy_rdly_dq_bitslip_rst_re) begin
			soc_a7ddrphy_bitslip15_value <= 1'd0;
		end else begin
			if (soc_a7ddrphy_rdly_dq_bitslip_re) begin
				soc_a7ddrphy_bitslip15_value <= (soc_a7ddrphy_bitslip15_value + 1'd1);
			end
		end
	end
	soc_a7ddrphy_n_rddata_en0 <= soc_a7ddrphy_dfi_p2_rddata_en;
	soc_a7ddrphy_n_rddata_en1 <= soc_a7ddrphy_n_rddata_en0;
	soc_a7ddrphy_n_rddata_en2 <= soc_a7ddrphy_n_rddata_en1;
	soc_a7ddrphy_n_rddata_en3 <= soc_a7ddrphy_n_rddata_en2;
	soc_a7ddrphy_n_rddata_en4 <= soc_a7ddrphy_n_rddata_en3;
	soc_a7ddrphy_n_rddata_en5 <= soc_a7ddrphy_n_rddata_en4;
	soc_a7ddrphy_n_rddata_en6 <= soc_a7ddrphy_n_rddata_en5;
	soc_a7ddrphy_n_rddata_en7 <= soc_a7ddrphy_n_rddata_en6;
	soc_a7ddrphy_dfi_p0_rddata_valid <= soc_a7ddrphy_n_rddata_en7;
	soc_a7ddrphy_dfi_p1_rddata_valid <= soc_a7ddrphy_n_rddata_en7;
	soc_a7ddrphy_dfi_p2_rddata_valid <= soc_a7ddrphy_n_rddata_en7;
	soc_a7ddrphy_dfi_p3_rddata_valid <= soc_a7ddrphy_n_rddata_en7;
	soc_a7ddrphy_last_wrdata_en <= {soc_a7ddrphy_last_wrdata_en[2:0], soc_a7ddrphy_dfi_p3_wrdata_en};
	soc_a7ddrphy_oe_dqs <= soc_a7ddrphy_oe;
	soc_a7ddrphy_oe_dq <= soc_a7ddrphy_oe;
	soc_a7ddrphy_bitslip0_r <= {soc_a7ddrphy_bitslip0_i, soc_a7ddrphy_bitslip0_r[15:8]};
	case (soc_a7ddrphy_bitslip0_value)
		1'd0: begin
			soc_a7ddrphy_bitslip0_o <= soc_a7ddrphy_bitslip0_r[7:0];
		end
		1'd1: begin
			soc_a7ddrphy_bitslip0_o <= soc_a7ddrphy_bitslip0_r[8:1];
		end
		2'd2: begin
			soc_a7ddrphy_bitslip0_o <= soc_a7ddrphy_bitslip0_r[9:2];
		end
		2'd3: begin
			soc_a7ddrphy_bitslip0_o <= soc_a7ddrphy_bitslip0_r[10:3];
		end
		3'd4: begin
			soc_a7ddrphy_bitslip0_o <= soc_a7ddrphy_bitslip0_r[11:4];
		end
		3'd5: begin
			soc_a7ddrphy_bitslip0_o <= soc_a7ddrphy_bitslip0_r[12:5];
		end
		3'd6: begin
			soc_a7ddrphy_bitslip0_o <= soc_a7ddrphy_bitslip0_r[13:6];
		end
		3'd7: begin
			soc_a7ddrphy_bitslip0_o <= soc_a7ddrphy_bitslip0_r[14:7];
		end
	endcase
	soc_a7ddrphy_bitslip1_r <= {soc_a7ddrphy_bitslip1_i, soc_a7ddrphy_bitslip1_r[15:8]};
	case (soc_a7ddrphy_bitslip1_value)
		1'd0: begin
			soc_a7ddrphy_bitslip1_o <= soc_a7ddrphy_bitslip1_r[7:0];
		end
		1'd1: begin
			soc_a7ddrphy_bitslip1_o <= soc_a7ddrphy_bitslip1_r[8:1];
		end
		2'd2: begin
			soc_a7ddrphy_bitslip1_o <= soc_a7ddrphy_bitslip1_r[9:2];
		end
		2'd3: begin
			soc_a7ddrphy_bitslip1_o <= soc_a7ddrphy_bitslip1_r[10:3];
		end
		3'd4: begin
			soc_a7ddrphy_bitslip1_o <= soc_a7ddrphy_bitslip1_r[11:4];
		end
		3'd5: begin
			soc_a7ddrphy_bitslip1_o <= soc_a7ddrphy_bitslip1_r[12:5];
		end
		3'd6: begin
			soc_a7ddrphy_bitslip1_o <= soc_a7ddrphy_bitslip1_r[13:6];
		end
		3'd7: begin
			soc_a7ddrphy_bitslip1_o <= soc_a7ddrphy_bitslip1_r[14:7];
		end
	endcase
	soc_a7ddrphy_bitslip2_r <= {soc_a7ddrphy_bitslip2_i, soc_a7ddrphy_bitslip2_r[15:8]};
	case (soc_a7ddrphy_bitslip2_value)
		1'd0: begin
			soc_a7ddrphy_bitslip2_o <= soc_a7ddrphy_bitslip2_r[7:0];
		end
		1'd1: begin
			soc_a7ddrphy_bitslip2_o <= soc_a7ddrphy_bitslip2_r[8:1];
		end
		2'd2: begin
			soc_a7ddrphy_bitslip2_o <= soc_a7ddrphy_bitslip2_r[9:2];
		end
		2'd3: begin
			soc_a7ddrphy_bitslip2_o <= soc_a7ddrphy_bitslip2_r[10:3];
		end
		3'd4: begin
			soc_a7ddrphy_bitslip2_o <= soc_a7ddrphy_bitslip2_r[11:4];
		end
		3'd5: begin
			soc_a7ddrphy_bitslip2_o <= soc_a7ddrphy_bitslip2_r[12:5];
		end
		3'd6: begin
			soc_a7ddrphy_bitslip2_o <= soc_a7ddrphy_bitslip2_r[13:6];
		end
		3'd7: begin
			soc_a7ddrphy_bitslip2_o <= soc_a7ddrphy_bitslip2_r[14:7];
		end
	endcase
	soc_a7ddrphy_bitslip3_r <= {soc_a7ddrphy_bitslip3_i, soc_a7ddrphy_bitslip3_r[15:8]};
	case (soc_a7ddrphy_bitslip3_value)
		1'd0: begin
			soc_a7ddrphy_bitslip3_o <= soc_a7ddrphy_bitslip3_r[7:0];
		end
		1'd1: begin
			soc_a7ddrphy_bitslip3_o <= soc_a7ddrphy_bitslip3_r[8:1];
		end
		2'd2: begin
			soc_a7ddrphy_bitslip3_o <= soc_a7ddrphy_bitslip3_r[9:2];
		end
		2'd3: begin
			soc_a7ddrphy_bitslip3_o <= soc_a7ddrphy_bitslip3_r[10:3];
		end
		3'd4: begin
			soc_a7ddrphy_bitslip3_o <= soc_a7ddrphy_bitslip3_r[11:4];
		end
		3'd5: begin
			soc_a7ddrphy_bitslip3_o <= soc_a7ddrphy_bitslip3_r[12:5];
		end
		3'd6: begin
			soc_a7ddrphy_bitslip3_o <= soc_a7ddrphy_bitslip3_r[13:6];
		end
		3'd7: begin
			soc_a7ddrphy_bitslip3_o <= soc_a7ddrphy_bitslip3_r[14:7];
		end
	endcase
	soc_a7ddrphy_bitslip4_r <= {soc_a7ddrphy_bitslip4_i, soc_a7ddrphy_bitslip4_r[15:8]};
	case (soc_a7ddrphy_bitslip4_value)
		1'd0: begin
			soc_a7ddrphy_bitslip4_o <= soc_a7ddrphy_bitslip4_r[7:0];
		end
		1'd1: begin
			soc_a7ddrphy_bitslip4_o <= soc_a7ddrphy_bitslip4_r[8:1];
		end
		2'd2: begin
			soc_a7ddrphy_bitslip4_o <= soc_a7ddrphy_bitslip4_r[9:2];
		end
		2'd3: begin
			soc_a7ddrphy_bitslip4_o <= soc_a7ddrphy_bitslip4_r[10:3];
		end
		3'd4: begin
			soc_a7ddrphy_bitslip4_o <= soc_a7ddrphy_bitslip4_r[11:4];
		end
		3'd5: begin
			soc_a7ddrphy_bitslip4_o <= soc_a7ddrphy_bitslip4_r[12:5];
		end
		3'd6: begin
			soc_a7ddrphy_bitslip4_o <= soc_a7ddrphy_bitslip4_r[13:6];
		end
		3'd7: begin
			soc_a7ddrphy_bitslip4_o <= soc_a7ddrphy_bitslip4_r[14:7];
		end
	endcase
	soc_a7ddrphy_bitslip5_r <= {soc_a7ddrphy_bitslip5_i, soc_a7ddrphy_bitslip5_r[15:8]};
	case (soc_a7ddrphy_bitslip5_value)
		1'd0: begin
			soc_a7ddrphy_bitslip5_o <= soc_a7ddrphy_bitslip5_r[7:0];
		end
		1'd1: begin
			soc_a7ddrphy_bitslip5_o <= soc_a7ddrphy_bitslip5_r[8:1];
		end
		2'd2: begin
			soc_a7ddrphy_bitslip5_o <= soc_a7ddrphy_bitslip5_r[9:2];
		end
		2'd3: begin
			soc_a7ddrphy_bitslip5_o <= soc_a7ddrphy_bitslip5_r[10:3];
		end
		3'd4: begin
			soc_a7ddrphy_bitslip5_o <= soc_a7ddrphy_bitslip5_r[11:4];
		end
		3'd5: begin
			soc_a7ddrphy_bitslip5_o <= soc_a7ddrphy_bitslip5_r[12:5];
		end
		3'd6: begin
			soc_a7ddrphy_bitslip5_o <= soc_a7ddrphy_bitslip5_r[13:6];
		end
		3'd7: begin
			soc_a7ddrphy_bitslip5_o <= soc_a7ddrphy_bitslip5_r[14:7];
		end
	endcase
	soc_a7ddrphy_bitslip6_r <= {soc_a7ddrphy_bitslip6_i, soc_a7ddrphy_bitslip6_r[15:8]};
	case (soc_a7ddrphy_bitslip6_value)
		1'd0: begin
			soc_a7ddrphy_bitslip6_o <= soc_a7ddrphy_bitslip6_r[7:0];
		end
		1'd1: begin
			soc_a7ddrphy_bitslip6_o <= soc_a7ddrphy_bitslip6_r[8:1];
		end
		2'd2: begin
			soc_a7ddrphy_bitslip6_o <= soc_a7ddrphy_bitslip6_r[9:2];
		end
		2'd3: begin
			soc_a7ddrphy_bitslip6_o <= soc_a7ddrphy_bitslip6_r[10:3];
		end
		3'd4: begin
			soc_a7ddrphy_bitslip6_o <= soc_a7ddrphy_bitslip6_r[11:4];
		end
		3'd5: begin
			soc_a7ddrphy_bitslip6_o <= soc_a7ddrphy_bitslip6_r[12:5];
		end
		3'd6: begin
			soc_a7ddrphy_bitslip6_o <= soc_a7ddrphy_bitslip6_r[13:6];
		end
		3'd7: begin
			soc_a7ddrphy_bitslip6_o <= soc_a7ddrphy_bitslip6_r[14:7];
		end
	endcase
	soc_a7ddrphy_bitslip7_r <= {soc_a7ddrphy_bitslip7_i, soc_a7ddrphy_bitslip7_r[15:8]};
	case (soc_a7ddrphy_bitslip7_value)
		1'd0: begin
			soc_a7ddrphy_bitslip7_o <= soc_a7ddrphy_bitslip7_r[7:0];
		end
		1'd1: begin
			soc_a7ddrphy_bitslip7_o <= soc_a7ddrphy_bitslip7_r[8:1];
		end
		2'd2: begin
			soc_a7ddrphy_bitslip7_o <= soc_a7ddrphy_bitslip7_r[9:2];
		end
		2'd3: begin
			soc_a7ddrphy_bitslip7_o <= soc_a7ddrphy_bitslip7_r[10:3];
		end
		3'd4: begin
			soc_a7ddrphy_bitslip7_o <= soc_a7ddrphy_bitslip7_r[11:4];
		end
		3'd5: begin
			soc_a7ddrphy_bitslip7_o <= soc_a7ddrphy_bitslip7_r[12:5];
		end
		3'd6: begin
			soc_a7ddrphy_bitslip7_o <= soc_a7ddrphy_bitslip7_r[13:6];
		end
		3'd7: begin
			soc_a7ddrphy_bitslip7_o <= soc_a7ddrphy_bitslip7_r[14:7];
		end
	endcase
	soc_a7ddrphy_bitslip8_r <= {soc_a7ddrphy_bitslip8_i, soc_a7ddrphy_bitslip8_r[15:8]};
	case (soc_a7ddrphy_bitslip8_value)
		1'd0: begin
			soc_a7ddrphy_bitslip8_o <= soc_a7ddrphy_bitslip8_r[7:0];
		end
		1'd1: begin
			soc_a7ddrphy_bitslip8_o <= soc_a7ddrphy_bitslip8_r[8:1];
		end
		2'd2: begin
			soc_a7ddrphy_bitslip8_o <= soc_a7ddrphy_bitslip8_r[9:2];
		end
		2'd3: begin
			soc_a7ddrphy_bitslip8_o <= soc_a7ddrphy_bitslip8_r[10:3];
		end
		3'd4: begin
			soc_a7ddrphy_bitslip8_o <= soc_a7ddrphy_bitslip8_r[11:4];
		end
		3'd5: begin
			soc_a7ddrphy_bitslip8_o <= soc_a7ddrphy_bitslip8_r[12:5];
		end
		3'd6: begin
			soc_a7ddrphy_bitslip8_o <= soc_a7ddrphy_bitslip8_r[13:6];
		end
		3'd7: begin
			soc_a7ddrphy_bitslip8_o <= soc_a7ddrphy_bitslip8_r[14:7];
		end
	endcase
	soc_a7ddrphy_bitslip9_r <= {soc_a7ddrphy_bitslip9_i, soc_a7ddrphy_bitslip9_r[15:8]};
	case (soc_a7ddrphy_bitslip9_value)
		1'd0: begin
			soc_a7ddrphy_bitslip9_o <= soc_a7ddrphy_bitslip9_r[7:0];
		end
		1'd1: begin
			soc_a7ddrphy_bitslip9_o <= soc_a7ddrphy_bitslip9_r[8:1];
		end
		2'd2: begin
			soc_a7ddrphy_bitslip9_o <= soc_a7ddrphy_bitslip9_r[9:2];
		end
		2'd3: begin
			soc_a7ddrphy_bitslip9_o <= soc_a7ddrphy_bitslip9_r[10:3];
		end
		3'd4: begin
			soc_a7ddrphy_bitslip9_o <= soc_a7ddrphy_bitslip9_r[11:4];
		end
		3'd5: begin
			soc_a7ddrphy_bitslip9_o <= soc_a7ddrphy_bitslip9_r[12:5];
		end
		3'd6: begin
			soc_a7ddrphy_bitslip9_o <= soc_a7ddrphy_bitslip9_r[13:6];
		end
		3'd7: begin
			soc_a7ddrphy_bitslip9_o <= soc_a7ddrphy_bitslip9_r[14:7];
		end
	endcase
	soc_a7ddrphy_bitslip10_r <= {soc_a7ddrphy_bitslip10_i, soc_a7ddrphy_bitslip10_r[15:8]};
	case (soc_a7ddrphy_bitslip10_value)
		1'd0: begin
			soc_a7ddrphy_bitslip10_o <= soc_a7ddrphy_bitslip10_r[7:0];
		end
		1'd1: begin
			soc_a7ddrphy_bitslip10_o <= soc_a7ddrphy_bitslip10_r[8:1];
		end
		2'd2: begin
			soc_a7ddrphy_bitslip10_o <= soc_a7ddrphy_bitslip10_r[9:2];
		end
		2'd3: begin
			soc_a7ddrphy_bitslip10_o <= soc_a7ddrphy_bitslip10_r[10:3];
		end
		3'd4: begin
			soc_a7ddrphy_bitslip10_o <= soc_a7ddrphy_bitslip10_r[11:4];
		end
		3'd5: begin
			soc_a7ddrphy_bitslip10_o <= soc_a7ddrphy_bitslip10_r[12:5];
		end
		3'd6: begin
			soc_a7ddrphy_bitslip10_o <= soc_a7ddrphy_bitslip10_r[13:6];
		end
		3'd7: begin
			soc_a7ddrphy_bitslip10_o <= soc_a7ddrphy_bitslip10_r[14:7];
		end
	endcase
	soc_a7ddrphy_bitslip11_r <= {soc_a7ddrphy_bitslip11_i, soc_a7ddrphy_bitslip11_r[15:8]};
	case (soc_a7ddrphy_bitslip11_value)
		1'd0: begin
			soc_a7ddrphy_bitslip11_o <= soc_a7ddrphy_bitslip11_r[7:0];
		end
		1'd1: begin
			soc_a7ddrphy_bitslip11_o <= soc_a7ddrphy_bitslip11_r[8:1];
		end
		2'd2: begin
			soc_a7ddrphy_bitslip11_o <= soc_a7ddrphy_bitslip11_r[9:2];
		end
		2'd3: begin
			soc_a7ddrphy_bitslip11_o <= soc_a7ddrphy_bitslip11_r[10:3];
		end
		3'd4: begin
			soc_a7ddrphy_bitslip11_o <= soc_a7ddrphy_bitslip11_r[11:4];
		end
		3'd5: begin
			soc_a7ddrphy_bitslip11_o <= soc_a7ddrphy_bitslip11_r[12:5];
		end
		3'd6: begin
			soc_a7ddrphy_bitslip11_o <= soc_a7ddrphy_bitslip11_r[13:6];
		end
		3'd7: begin
			soc_a7ddrphy_bitslip11_o <= soc_a7ddrphy_bitslip11_r[14:7];
		end
	endcase
	soc_a7ddrphy_bitslip12_r <= {soc_a7ddrphy_bitslip12_i, soc_a7ddrphy_bitslip12_r[15:8]};
	case (soc_a7ddrphy_bitslip12_value)
		1'd0: begin
			soc_a7ddrphy_bitslip12_o <= soc_a7ddrphy_bitslip12_r[7:0];
		end
		1'd1: begin
			soc_a7ddrphy_bitslip12_o <= soc_a7ddrphy_bitslip12_r[8:1];
		end
		2'd2: begin
			soc_a7ddrphy_bitslip12_o <= soc_a7ddrphy_bitslip12_r[9:2];
		end
		2'd3: begin
			soc_a7ddrphy_bitslip12_o <= soc_a7ddrphy_bitslip12_r[10:3];
		end
		3'd4: begin
			soc_a7ddrphy_bitslip12_o <= soc_a7ddrphy_bitslip12_r[11:4];
		end
		3'd5: begin
			soc_a7ddrphy_bitslip12_o <= soc_a7ddrphy_bitslip12_r[12:5];
		end
		3'd6: begin
			soc_a7ddrphy_bitslip12_o <= soc_a7ddrphy_bitslip12_r[13:6];
		end
		3'd7: begin
			soc_a7ddrphy_bitslip12_o <= soc_a7ddrphy_bitslip12_r[14:7];
		end
	endcase
	soc_a7ddrphy_bitslip13_r <= {soc_a7ddrphy_bitslip13_i, soc_a7ddrphy_bitslip13_r[15:8]};
	case (soc_a7ddrphy_bitslip13_value)
		1'd0: begin
			soc_a7ddrphy_bitslip13_o <= soc_a7ddrphy_bitslip13_r[7:0];
		end
		1'd1: begin
			soc_a7ddrphy_bitslip13_o <= soc_a7ddrphy_bitslip13_r[8:1];
		end
		2'd2: begin
			soc_a7ddrphy_bitslip13_o <= soc_a7ddrphy_bitslip13_r[9:2];
		end
		2'd3: begin
			soc_a7ddrphy_bitslip13_o <= soc_a7ddrphy_bitslip13_r[10:3];
		end
		3'd4: begin
			soc_a7ddrphy_bitslip13_o <= soc_a7ddrphy_bitslip13_r[11:4];
		end
		3'd5: begin
			soc_a7ddrphy_bitslip13_o <= soc_a7ddrphy_bitslip13_r[12:5];
		end
		3'd6: begin
			soc_a7ddrphy_bitslip13_o <= soc_a7ddrphy_bitslip13_r[13:6];
		end
		3'd7: begin
			soc_a7ddrphy_bitslip13_o <= soc_a7ddrphy_bitslip13_r[14:7];
		end
	endcase
	soc_a7ddrphy_bitslip14_r <= {soc_a7ddrphy_bitslip14_i, soc_a7ddrphy_bitslip14_r[15:8]};
	case (soc_a7ddrphy_bitslip14_value)
		1'd0: begin
			soc_a7ddrphy_bitslip14_o <= soc_a7ddrphy_bitslip14_r[7:0];
		end
		1'd1: begin
			soc_a7ddrphy_bitslip14_o <= soc_a7ddrphy_bitslip14_r[8:1];
		end
		2'd2: begin
			soc_a7ddrphy_bitslip14_o <= soc_a7ddrphy_bitslip14_r[9:2];
		end
		2'd3: begin
			soc_a7ddrphy_bitslip14_o <= soc_a7ddrphy_bitslip14_r[10:3];
		end
		3'd4: begin
			soc_a7ddrphy_bitslip14_o <= soc_a7ddrphy_bitslip14_r[11:4];
		end
		3'd5: begin
			soc_a7ddrphy_bitslip14_o <= soc_a7ddrphy_bitslip14_r[12:5];
		end
		3'd6: begin
			soc_a7ddrphy_bitslip14_o <= soc_a7ddrphy_bitslip14_r[13:6];
		end
		3'd7: begin
			soc_a7ddrphy_bitslip14_o <= soc_a7ddrphy_bitslip14_r[14:7];
		end
	endcase
	soc_a7ddrphy_bitslip15_r <= {soc_a7ddrphy_bitslip15_i, soc_a7ddrphy_bitslip15_r[15:8]};
	case (soc_a7ddrphy_bitslip15_value)
		1'd0: begin
			soc_a7ddrphy_bitslip15_o <= soc_a7ddrphy_bitslip15_r[7:0];
		end
		1'd1: begin
			soc_a7ddrphy_bitslip15_o <= soc_a7ddrphy_bitslip15_r[8:1];
		end
		2'd2: begin
			soc_a7ddrphy_bitslip15_o <= soc_a7ddrphy_bitslip15_r[9:2];
		end
		2'd3: begin
			soc_a7ddrphy_bitslip15_o <= soc_a7ddrphy_bitslip15_r[10:3];
		end
		3'd4: begin
			soc_a7ddrphy_bitslip15_o <= soc_a7ddrphy_bitslip15_r[11:4];
		end
		3'd5: begin
			soc_a7ddrphy_bitslip15_o <= soc_a7ddrphy_bitslip15_r[12:5];
		end
		3'd6: begin
			soc_a7ddrphy_bitslip15_o <= soc_a7ddrphy_bitslip15_r[13:6];
		end
		3'd7: begin
			soc_a7ddrphy_bitslip15_o <= soc_a7ddrphy_bitslip15_r[14:7];
		end
	endcase
	if (soc_netsoc_sdram_inti_p0_rddata_valid) begin
		soc_netsoc_sdram_phaseinjector0_status <= soc_netsoc_sdram_inti_p0_rddata;
	end
	if (soc_netsoc_sdram_inti_p1_rddata_valid) begin
		soc_netsoc_sdram_phaseinjector1_status <= soc_netsoc_sdram_inti_p1_rddata;
	end
	if (soc_netsoc_sdram_inti_p2_rddata_valid) begin
		soc_netsoc_sdram_phaseinjector2_status <= soc_netsoc_sdram_inti_p2_rddata;
	end
	if (soc_netsoc_sdram_inti_p3_rddata_valid) begin
		soc_netsoc_sdram_phaseinjector3_status <= soc_netsoc_sdram_inti_p3_rddata;
	end
	if ((soc_netsoc_sdram_timer_wait & (~soc_netsoc_sdram_timer_done0))) begin
		soc_netsoc_sdram_timer_count1 <= (soc_netsoc_sdram_timer_count1 - 1'd1);
	end else begin
		soc_netsoc_sdram_timer_count1 <= 9'd468;
	end
	soc_netsoc_sdram_postponer_req_o <= 1'd0;
	if (soc_netsoc_sdram_postponer_req_i) begin
		soc_netsoc_sdram_postponer_count <= (soc_netsoc_sdram_postponer_count - 1'd1);
		if ((soc_netsoc_sdram_postponer_count == 1'd0)) begin
			soc_netsoc_sdram_postponer_count <= 1'd0;
			soc_netsoc_sdram_postponer_req_o <= 1'd1;
		end
	end
	if (soc_netsoc_sdram_sequencer_start0) begin
		soc_netsoc_sdram_sequencer_count <= 1'd0;
	end else begin
		if (soc_netsoc_sdram_sequencer_done1) begin
			if ((soc_netsoc_sdram_sequencer_count != 1'd0)) begin
				soc_netsoc_sdram_sequencer_count <= (soc_netsoc_sdram_sequencer_count - 1'd1);
			end
		end
	end
	soc_netsoc_sdram_cmd_payload_a <= 1'd0;
	soc_netsoc_sdram_cmd_payload_ba <= 1'd0;
	soc_netsoc_sdram_cmd_payload_cas <= 1'd0;
	soc_netsoc_sdram_cmd_payload_ras <= 1'd0;
	soc_netsoc_sdram_cmd_payload_we <= 1'd0;
	soc_netsoc_sdram_sequencer_done1 <= 1'd0;
	if ((soc_netsoc_sdram_sequencer_start1 & (soc_netsoc_sdram_sequencer_counter == 1'd0))) begin
		soc_netsoc_sdram_cmd_payload_a <= 11'd1024;
		soc_netsoc_sdram_cmd_payload_ba <= 1'd0;
		soc_netsoc_sdram_cmd_payload_cas <= 1'd0;
		soc_netsoc_sdram_cmd_payload_ras <= 1'd1;
		soc_netsoc_sdram_cmd_payload_we <= 1'd1;
	end
	if ((soc_netsoc_sdram_sequencer_counter == 2'd2)) begin
		soc_netsoc_sdram_cmd_payload_a <= 1'd0;
		soc_netsoc_sdram_cmd_payload_ba <= 1'd0;
		soc_netsoc_sdram_cmd_payload_cas <= 1'd1;
		soc_netsoc_sdram_cmd_payload_ras <= 1'd1;
		soc_netsoc_sdram_cmd_payload_we <= 1'd0;
	end
	if ((soc_netsoc_sdram_sequencer_counter == 6'd34)) begin
		soc_netsoc_sdram_cmd_payload_a <= 1'd0;
		soc_netsoc_sdram_cmd_payload_ba <= 1'd0;
		soc_netsoc_sdram_cmd_payload_cas <= 1'd0;
		soc_netsoc_sdram_cmd_payload_ras <= 1'd0;
		soc_netsoc_sdram_cmd_payload_we <= 1'd0;
		soc_netsoc_sdram_sequencer_done1 <= 1'd1;
	end
	if ((soc_netsoc_sdram_sequencer_counter == 6'd34)) begin
		soc_netsoc_sdram_sequencer_counter <= 1'd0;
	end else begin
		if ((soc_netsoc_sdram_sequencer_counter != 1'd0)) begin
			soc_netsoc_sdram_sequencer_counter <= (soc_netsoc_sdram_sequencer_counter + 1'd1);
		end else begin
			if (soc_netsoc_sdram_sequencer_start1) begin
				soc_netsoc_sdram_sequencer_counter <= 1'd1;
			end
		end
	end
	if ((soc_netsoc_sdram_zqcs_timer_wait & (~soc_netsoc_sdram_zqcs_timer_done0))) begin
		soc_netsoc_sdram_zqcs_timer_count1 <= (soc_netsoc_sdram_zqcs_timer_count1 - 1'd1);
	end else begin
		soc_netsoc_sdram_zqcs_timer_count1 <= 26'd59999999;
	end
	soc_netsoc_sdram_zqcs_executer_done <= 1'd0;
	if ((soc_netsoc_sdram_zqcs_executer_start & (soc_netsoc_sdram_zqcs_executer_counter == 1'd0))) begin
		soc_netsoc_sdram_cmd_payload_a <= 11'd1024;
		soc_netsoc_sdram_cmd_payload_ba <= 1'd0;
		soc_netsoc_sdram_cmd_payload_cas <= 1'd0;
		soc_netsoc_sdram_cmd_payload_ras <= 1'd1;
		soc_netsoc_sdram_cmd_payload_we <= 1'd1;
	end
	if ((soc_netsoc_sdram_zqcs_executer_counter == 2'd2)) begin
		soc_netsoc_sdram_cmd_payload_a <= 1'd0;
		soc_netsoc_sdram_cmd_payload_ba <= 1'd0;
		soc_netsoc_sdram_cmd_payload_cas <= 1'd0;
		soc_netsoc_sdram_cmd_payload_ras <= 1'd0;
		soc_netsoc_sdram_cmd_payload_we <= 1'd1;
	end
	if ((soc_netsoc_sdram_zqcs_executer_counter == 5'd18)) begin
		soc_netsoc_sdram_cmd_payload_a <= 1'd0;
		soc_netsoc_sdram_cmd_payload_ba <= 1'd0;
		soc_netsoc_sdram_cmd_payload_cas <= 1'd0;
		soc_netsoc_sdram_cmd_payload_ras <= 1'd0;
		soc_netsoc_sdram_cmd_payload_we <= 1'd0;
		soc_netsoc_sdram_zqcs_executer_done <= 1'd1;
	end
	if ((soc_netsoc_sdram_zqcs_executer_counter == 5'd18)) begin
		soc_netsoc_sdram_zqcs_executer_counter <= 1'd0;
	end else begin
		if ((soc_netsoc_sdram_zqcs_executer_counter != 1'd0)) begin
			soc_netsoc_sdram_zqcs_executer_counter <= (soc_netsoc_sdram_zqcs_executer_counter + 1'd1);
		end else begin
			if (soc_netsoc_sdram_zqcs_executer_start) begin
				soc_netsoc_sdram_zqcs_executer_counter <= 1'd1;
			end
		end
	end
	vns_refresher_state <= vns_refresher_next_state;
	if (soc_netsoc_sdram_bankmachine0_row_close) begin
		soc_netsoc_sdram_bankmachine0_row_opened <= 1'd0;
	end else begin
		if (soc_netsoc_sdram_bankmachine0_row_open) begin
			soc_netsoc_sdram_bankmachine0_row_opened <= 1'd1;
			soc_netsoc_sdram_bankmachine0_row <= soc_netsoc_sdram_bankmachine0_cmd_buffer_source_payload_addr[20:7];
		end
	end
	if (((soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_we & soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_writable) & (~soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_replace))) begin
		soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_produce <= (soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_produce + 1'd1);
	end
	if (soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_do_read) begin
		soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_consume <= (soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_consume + 1'd1);
	end
	if (((soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_we & soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_syncfifo0_writable) & (~soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_replace))) begin
		if ((~soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_do_read)) begin
			soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_level <= (soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_level + 1'd1);
		end
	end else begin
		if (soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_do_read) begin
			soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_level <= (soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_level - 1'd1);
		end
	end
	if (soc_netsoc_sdram_bankmachine0_cmd_buffer_pipe_ce) begin
		soc_netsoc_sdram_bankmachine0_cmd_buffer_valid_n <= soc_netsoc_sdram_bankmachine0_cmd_buffer_sink_valid;
	end
	if (soc_netsoc_sdram_bankmachine0_cmd_buffer_pipe_ce) begin
		soc_netsoc_sdram_bankmachine0_cmd_buffer_first_n <= (soc_netsoc_sdram_bankmachine0_cmd_buffer_sink_valid & soc_netsoc_sdram_bankmachine0_cmd_buffer_sink_first);
		soc_netsoc_sdram_bankmachine0_cmd_buffer_last_n <= (soc_netsoc_sdram_bankmachine0_cmd_buffer_sink_valid & soc_netsoc_sdram_bankmachine0_cmd_buffer_sink_last);
	end
	if (soc_netsoc_sdram_bankmachine0_cmd_buffer_pipe_ce) begin
		soc_netsoc_sdram_bankmachine0_cmd_buffer_source_payload_we <= soc_netsoc_sdram_bankmachine0_cmd_buffer_sink_payload_we;
		soc_netsoc_sdram_bankmachine0_cmd_buffer_source_payload_addr <= soc_netsoc_sdram_bankmachine0_cmd_buffer_sink_payload_addr;
	end
	if (soc_netsoc_sdram_bankmachine0_twtpcon_valid) begin
		soc_netsoc_sdram_bankmachine0_twtpcon_count <= 3'd4;
		if (1'd0) begin
			soc_netsoc_sdram_bankmachine0_twtpcon_ready <= 1'd1;
		end else begin
			soc_netsoc_sdram_bankmachine0_twtpcon_ready <= 1'd0;
		end
	end else begin
		if ((~soc_netsoc_sdram_bankmachine0_twtpcon_ready)) begin
			soc_netsoc_sdram_bankmachine0_twtpcon_count <= (soc_netsoc_sdram_bankmachine0_twtpcon_count - 1'd1);
			if ((soc_netsoc_sdram_bankmachine0_twtpcon_count == 1'd1)) begin
				soc_netsoc_sdram_bankmachine0_twtpcon_ready <= 1'd1;
			end
		end
	end
	if (soc_netsoc_sdram_bankmachine0_trccon_valid) begin
		soc_netsoc_sdram_bankmachine0_trccon_count <= 2'd3;
		if (1'd0) begin
			soc_netsoc_sdram_bankmachine0_trccon_ready <= 1'd1;
		end else begin
			soc_netsoc_sdram_bankmachine0_trccon_ready <= 1'd0;
		end
	end else begin
		if ((~soc_netsoc_sdram_bankmachine0_trccon_ready)) begin
			soc_netsoc_sdram_bankmachine0_trccon_count <= (soc_netsoc_sdram_bankmachine0_trccon_count - 1'd1);
			if ((soc_netsoc_sdram_bankmachine0_trccon_count == 1'd1)) begin
				soc_netsoc_sdram_bankmachine0_trccon_ready <= 1'd1;
			end
		end
	end
	if (soc_netsoc_sdram_bankmachine0_trascon_valid) begin
		soc_netsoc_sdram_bankmachine0_trascon_count <= 2'd2;
		if (1'd0) begin
			soc_netsoc_sdram_bankmachine0_trascon_ready <= 1'd1;
		end else begin
			soc_netsoc_sdram_bankmachine0_trascon_ready <= 1'd0;
		end
	end else begin
		if ((~soc_netsoc_sdram_bankmachine0_trascon_ready)) begin
			soc_netsoc_sdram_bankmachine0_trascon_count <= (soc_netsoc_sdram_bankmachine0_trascon_count - 1'd1);
			if ((soc_netsoc_sdram_bankmachine0_trascon_count == 1'd1)) begin
				soc_netsoc_sdram_bankmachine0_trascon_ready <= 1'd1;
			end
		end
	end
	vns_bankmachine0_state <= vns_bankmachine0_next_state;
	if (soc_netsoc_sdram_bankmachine1_row_close) begin
		soc_netsoc_sdram_bankmachine1_row_opened <= 1'd0;
	end else begin
		if (soc_netsoc_sdram_bankmachine1_row_open) begin
			soc_netsoc_sdram_bankmachine1_row_opened <= 1'd1;
			soc_netsoc_sdram_bankmachine1_row <= soc_netsoc_sdram_bankmachine1_cmd_buffer_source_payload_addr[20:7];
		end
	end
	if (((soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_we & soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_writable) & (~soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_replace))) begin
		soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_produce <= (soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_produce + 1'd1);
	end
	if (soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_do_read) begin
		soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_consume <= (soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_consume + 1'd1);
	end
	if (((soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_we & soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_syncfifo1_writable) & (~soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_replace))) begin
		if ((~soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_do_read)) begin
			soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_level <= (soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_level + 1'd1);
		end
	end else begin
		if (soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_do_read) begin
			soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_level <= (soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_level - 1'd1);
		end
	end
	if (soc_netsoc_sdram_bankmachine1_cmd_buffer_pipe_ce) begin
		soc_netsoc_sdram_bankmachine1_cmd_buffer_valid_n <= soc_netsoc_sdram_bankmachine1_cmd_buffer_sink_valid;
	end
	if (soc_netsoc_sdram_bankmachine1_cmd_buffer_pipe_ce) begin
		soc_netsoc_sdram_bankmachine1_cmd_buffer_first_n <= (soc_netsoc_sdram_bankmachine1_cmd_buffer_sink_valid & soc_netsoc_sdram_bankmachine1_cmd_buffer_sink_first);
		soc_netsoc_sdram_bankmachine1_cmd_buffer_last_n <= (soc_netsoc_sdram_bankmachine1_cmd_buffer_sink_valid & soc_netsoc_sdram_bankmachine1_cmd_buffer_sink_last);
	end
	if (soc_netsoc_sdram_bankmachine1_cmd_buffer_pipe_ce) begin
		soc_netsoc_sdram_bankmachine1_cmd_buffer_source_payload_we <= soc_netsoc_sdram_bankmachine1_cmd_buffer_sink_payload_we;
		soc_netsoc_sdram_bankmachine1_cmd_buffer_source_payload_addr <= soc_netsoc_sdram_bankmachine1_cmd_buffer_sink_payload_addr;
	end
	if (soc_netsoc_sdram_bankmachine1_twtpcon_valid) begin
		soc_netsoc_sdram_bankmachine1_twtpcon_count <= 3'd4;
		if (1'd0) begin
			soc_netsoc_sdram_bankmachine1_twtpcon_ready <= 1'd1;
		end else begin
			soc_netsoc_sdram_bankmachine1_twtpcon_ready <= 1'd0;
		end
	end else begin
		if ((~soc_netsoc_sdram_bankmachine1_twtpcon_ready)) begin
			soc_netsoc_sdram_bankmachine1_twtpcon_count <= (soc_netsoc_sdram_bankmachine1_twtpcon_count - 1'd1);
			if ((soc_netsoc_sdram_bankmachine1_twtpcon_count == 1'd1)) begin
				soc_netsoc_sdram_bankmachine1_twtpcon_ready <= 1'd1;
			end
		end
	end
	if (soc_netsoc_sdram_bankmachine1_trccon_valid) begin
		soc_netsoc_sdram_bankmachine1_trccon_count <= 2'd3;
		if (1'd0) begin
			soc_netsoc_sdram_bankmachine1_trccon_ready <= 1'd1;
		end else begin
			soc_netsoc_sdram_bankmachine1_trccon_ready <= 1'd0;
		end
	end else begin
		if ((~soc_netsoc_sdram_bankmachine1_trccon_ready)) begin
			soc_netsoc_sdram_bankmachine1_trccon_count <= (soc_netsoc_sdram_bankmachine1_trccon_count - 1'd1);
			if ((soc_netsoc_sdram_bankmachine1_trccon_count == 1'd1)) begin
				soc_netsoc_sdram_bankmachine1_trccon_ready <= 1'd1;
			end
		end
	end
	if (soc_netsoc_sdram_bankmachine1_trascon_valid) begin
		soc_netsoc_sdram_bankmachine1_trascon_count <= 2'd2;
		if (1'd0) begin
			soc_netsoc_sdram_bankmachine1_trascon_ready <= 1'd1;
		end else begin
			soc_netsoc_sdram_bankmachine1_trascon_ready <= 1'd0;
		end
	end else begin
		if ((~soc_netsoc_sdram_bankmachine1_trascon_ready)) begin
			soc_netsoc_sdram_bankmachine1_trascon_count <= (soc_netsoc_sdram_bankmachine1_trascon_count - 1'd1);
			if ((soc_netsoc_sdram_bankmachine1_trascon_count == 1'd1)) begin
				soc_netsoc_sdram_bankmachine1_trascon_ready <= 1'd1;
			end
		end
	end
	vns_bankmachine1_state <= vns_bankmachine1_next_state;
	if (soc_netsoc_sdram_bankmachine2_row_close) begin
		soc_netsoc_sdram_bankmachine2_row_opened <= 1'd0;
	end else begin
		if (soc_netsoc_sdram_bankmachine2_row_open) begin
			soc_netsoc_sdram_bankmachine2_row_opened <= 1'd1;
			soc_netsoc_sdram_bankmachine2_row <= soc_netsoc_sdram_bankmachine2_cmd_buffer_source_payload_addr[20:7];
		end
	end
	if (((soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_we & soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_writable) & (~soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_replace))) begin
		soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_produce <= (soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_produce + 1'd1);
	end
	if (soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_do_read) begin
		soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_consume <= (soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_consume + 1'd1);
	end
	if (((soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_we & soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_syncfifo2_writable) & (~soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_replace))) begin
		if ((~soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_do_read)) begin
			soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_level <= (soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_level + 1'd1);
		end
	end else begin
		if (soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_do_read) begin
			soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_level <= (soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_level - 1'd1);
		end
	end
	if (soc_netsoc_sdram_bankmachine2_cmd_buffer_pipe_ce) begin
		soc_netsoc_sdram_bankmachine2_cmd_buffer_valid_n <= soc_netsoc_sdram_bankmachine2_cmd_buffer_sink_valid;
	end
	if (soc_netsoc_sdram_bankmachine2_cmd_buffer_pipe_ce) begin
		soc_netsoc_sdram_bankmachine2_cmd_buffer_first_n <= (soc_netsoc_sdram_bankmachine2_cmd_buffer_sink_valid & soc_netsoc_sdram_bankmachine2_cmd_buffer_sink_first);
		soc_netsoc_sdram_bankmachine2_cmd_buffer_last_n <= (soc_netsoc_sdram_bankmachine2_cmd_buffer_sink_valid & soc_netsoc_sdram_bankmachine2_cmd_buffer_sink_last);
	end
	if (soc_netsoc_sdram_bankmachine2_cmd_buffer_pipe_ce) begin
		soc_netsoc_sdram_bankmachine2_cmd_buffer_source_payload_we <= soc_netsoc_sdram_bankmachine2_cmd_buffer_sink_payload_we;
		soc_netsoc_sdram_bankmachine2_cmd_buffer_source_payload_addr <= soc_netsoc_sdram_bankmachine2_cmd_buffer_sink_payload_addr;
	end
	if (soc_netsoc_sdram_bankmachine2_twtpcon_valid) begin
		soc_netsoc_sdram_bankmachine2_twtpcon_count <= 3'd4;
		if (1'd0) begin
			soc_netsoc_sdram_bankmachine2_twtpcon_ready <= 1'd1;
		end else begin
			soc_netsoc_sdram_bankmachine2_twtpcon_ready <= 1'd0;
		end
	end else begin
		if ((~soc_netsoc_sdram_bankmachine2_twtpcon_ready)) begin
			soc_netsoc_sdram_bankmachine2_twtpcon_count <= (soc_netsoc_sdram_bankmachine2_twtpcon_count - 1'd1);
			if ((soc_netsoc_sdram_bankmachine2_twtpcon_count == 1'd1)) begin
				soc_netsoc_sdram_bankmachine2_twtpcon_ready <= 1'd1;
			end
		end
	end
	if (soc_netsoc_sdram_bankmachine2_trccon_valid) begin
		soc_netsoc_sdram_bankmachine2_trccon_count <= 2'd3;
		if (1'd0) begin
			soc_netsoc_sdram_bankmachine2_trccon_ready <= 1'd1;
		end else begin
			soc_netsoc_sdram_bankmachine2_trccon_ready <= 1'd0;
		end
	end else begin
		if ((~soc_netsoc_sdram_bankmachine2_trccon_ready)) begin
			soc_netsoc_sdram_bankmachine2_trccon_count <= (soc_netsoc_sdram_bankmachine2_trccon_count - 1'd1);
			if ((soc_netsoc_sdram_bankmachine2_trccon_count == 1'd1)) begin
				soc_netsoc_sdram_bankmachine2_trccon_ready <= 1'd1;
			end
		end
	end
	if (soc_netsoc_sdram_bankmachine2_trascon_valid) begin
		soc_netsoc_sdram_bankmachine2_trascon_count <= 2'd2;
		if (1'd0) begin
			soc_netsoc_sdram_bankmachine2_trascon_ready <= 1'd1;
		end else begin
			soc_netsoc_sdram_bankmachine2_trascon_ready <= 1'd0;
		end
	end else begin
		if ((~soc_netsoc_sdram_bankmachine2_trascon_ready)) begin
			soc_netsoc_sdram_bankmachine2_trascon_count <= (soc_netsoc_sdram_bankmachine2_trascon_count - 1'd1);
			if ((soc_netsoc_sdram_bankmachine2_trascon_count == 1'd1)) begin
				soc_netsoc_sdram_bankmachine2_trascon_ready <= 1'd1;
			end
		end
	end
	vns_bankmachine2_state <= vns_bankmachine2_next_state;
	if (soc_netsoc_sdram_bankmachine3_row_close) begin
		soc_netsoc_sdram_bankmachine3_row_opened <= 1'd0;
	end else begin
		if (soc_netsoc_sdram_bankmachine3_row_open) begin
			soc_netsoc_sdram_bankmachine3_row_opened <= 1'd1;
			soc_netsoc_sdram_bankmachine3_row <= soc_netsoc_sdram_bankmachine3_cmd_buffer_source_payload_addr[20:7];
		end
	end
	if (((soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_we & soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_writable) & (~soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_replace))) begin
		soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_produce <= (soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_produce + 1'd1);
	end
	if (soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_do_read) begin
		soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_consume <= (soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_consume + 1'd1);
	end
	if (((soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_we & soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_syncfifo3_writable) & (~soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_replace))) begin
		if ((~soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_do_read)) begin
			soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_level <= (soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_level + 1'd1);
		end
	end else begin
		if (soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_do_read) begin
			soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_level <= (soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_level - 1'd1);
		end
	end
	if (soc_netsoc_sdram_bankmachine3_cmd_buffer_pipe_ce) begin
		soc_netsoc_sdram_bankmachine3_cmd_buffer_valid_n <= soc_netsoc_sdram_bankmachine3_cmd_buffer_sink_valid;
	end
	if (soc_netsoc_sdram_bankmachine3_cmd_buffer_pipe_ce) begin
		soc_netsoc_sdram_bankmachine3_cmd_buffer_first_n <= (soc_netsoc_sdram_bankmachine3_cmd_buffer_sink_valid & soc_netsoc_sdram_bankmachine3_cmd_buffer_sink_first);
		soc_netsoc_sdram_bankmachine3_cmd_buffer_last_n <= (soc_netsoc_sdram_bankmachine3_cmd_buffer_sink_valid & soc_netsoc_sdram_bankmachine3_cmd_buffer_sink_last);
	end
	if (soc_netsoc_sdram_bankmachine3_cmd_buffer_pipe_ce) begin
		soc_netsoc_sdram_bankmachine3_cmd_buffer_source_payload_we <= soc_netsoc_sdram_bankmachine3_cmd_buffer_sink_payload_we;
		soc_netsoc_sdram_bankmachine3_cmd_buffer_source_payload_addr <= soc_netsoc_sdram_bankmachine3_cmd_buffer_sink_payload_addr;
	end
	if (soc_netsoc_sdram_bankmachine3_twtpcon_valid) begin
		soc_netsoc_sdram_bankmachine3_twtpcon_count <= 3'd4;
		if (1'd0) begin
			soc_netsoc_sdram_bankmachine3_twtpcon_ready <= 1'd1;
		end else begin
			soc_netsoc_sdram_bankmachine3_twtpcon_ready <= 1'd0;
		end
	end else begin
		if ((~soc_netsoc_sdram_bankmachine3_twtpcon_ready)) begin
			soc_netsoc_sdram_bankmachine3_twtpcon_count <= (soc_netsoc_sdram_bankmachine3_twtpcon_count - 1'd1);
			if ((soc_netsoc_sdram_bankmachine3_twtpcon_count == 1'd1)) begin
				soc_netsoc_sdram_bankmachine3_twtpcon_ready <= 1'd1;
			end
		end
	end
	if (soc_netsoc_sdram_bankmachine3_trccon_valid) begin
		soc_netsoc_sdram_bankmachine3_trccon_count <= 2'd3;
		if (1'd0) begin
			soc_netsoc_sdram_bankmachine3_trccon_ready <= 1'd1;
		end else begin
			soc_netsoc_sdram_bankmachine3_trccon_ready <= 1'd0;
		end
	end else begin
		if ((~soc_netsoc_sdram_bankmachine3_trccon_ready)) begin
			soc_netsoc_sdram_bankmachine3_trccon_count <= (soc_netsoc_sdram_bankmachine3_trccon_count - 1'd1);
			if ((soc_netsoc_sdram_bankmachine3_trccon_count == 1'd1)) begin
				soc_netsoc_sdram_bankmachine3_trccon_ready <= 1'd1;
			end
		end
	end
	if (soc_netsoc_sdram_bankmachine3_trascon_valid) begin
		soc_netsoc_sdram_bankmachine3_trascon_count <= 2'd2;
		if (1'd0) begin
			soc_netsoc_sdram_bankmachine3_trascon_ready <= 1'd1;
		end else begin
			soc_netsoc_sdram_bankmachine3_trascon_ready <= 1'd0;
		end
	end else begin
		if ((~soc_netsoc_sdram_bankmachine3_trascon_ready)) begin
			soc_netsoc_sdram_bankmachine3_trascon_count <= (soc_netsoc_sdram_bankmachine3_trascon_count - 1'd1);
			if ((soc_netsoc_sdram_bankmachine3_trascon_count == 1'd1)) begin
				soc_netsoc_sdram_bankmachine3_trascon_ready <= 1'd1;
			end
		end
	end
	vns_bankmachine3_state <= vns_bankmachine3_next_state;
	if (soc_netsoc_sdram_bankmachine4_row_close) begin
		soc_netsoc_sdram_bankmachine4_row_opened <= 1'd0;
	end else begin
		if (soc_netsoc_sdram_bankmachine4_row_open) begin
			soc_netsoc_sdram_bankmachine4_row_opened <= 1'd1;
			soc_netsoc_sdram_bankmachine4_row <= soc_netsoc_sdram_bankmachine4_cmd_buffer_source_payload_addr[20:7];
		end
	end
	if (((soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_we & soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_writable) & (~soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_replace))) begin
		soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_produce <= (soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_produce + 1'd1);
	end
	if (soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_do_read) begin
		soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_consume <= (soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_consume + 1'd1);
	end
	if (((soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_we & soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_syncfifo4_writable) & (~soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_replace))) begin
		if ((~soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_do_read)) begin
			soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_level <= (soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_level + 1'd1);
		end
	end else begin
		if (soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_do_read) begin
			soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_level <= (soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_level - 1'd1);
		end
	end
	if (soc_netsoc_sdram_bankmachine4_cmd_buffer_pipe_ce) begin
		soc_netsoc_sdram_bankmachine4_cmd_buffer_valid_n <= soc_netsoc_sdram_bankmachine4_cmd_buffer_sink_valid;
	end
	if (soc_netsoc_sdram_bankmachine4_cmd_buffer_pipe_ce) begin
		soc_netsoc_sdram_bankmachine4_cmd_buffer_first_n <= (soc_netsoc_sdram_bankmachine4_cmd_buffer_sink_valid & soc_netsoc_sdram_bankmachine4_cmd_buffer_sink_first);
		soc_netsoc_sdram_bankmachine4_cmd_buffer_last_n <= (soc_netsoc_sdram_bankmachine4_cmd_buffer_sink_valid & soc_netsoc_sdram_bankmachine4_cmd_buffer_sink_last);
	end
	if (soc_netsoc_sdram_bankmachine4_cmd_buffer_pipe_ce) begin
		soc_netsoc_sdram_bankmachine4_cmd_buffer_source_payload_we <= soc_netsoc_sdram_bankmachine4_cmd_buffer_sink_payload_we;
		soc_netsoc_sdram_bankmachine4_cmd_buffer_source_payload_addr <= soc_netsoc_sdram_bankmachine4_cmd_buffer_sink_payload_addr;
	end
	if (soc_netsoc_sdram_bankmachine4_twtpcon_valid) begin
		soc_netsoc_sdram_bankmachine4_twtpcon_count <= 3'd4;
		if (1'd0) begin
			soc_netsoc_sdram_bankmachine4_twtpcon_ready <= 1'd1;
		end else begin
			soc_netsoc_sdram_bankmachine4_twtpcon_ready <= 1'd0;
		end
	end else begin
		if ((~soc_netsoc_sdram_bankmachine4_twtpcon_ready)) begin
			soc_netsoc_sdram_bankmachine4_twtpcon_count <= (soc_netsoc_sdram_bankmachine4_twtpcon_count - 1'd1);
			if ((soc_netsoc_sdram_bankmachine4_twtpcon_count == 1'd1)) begin
				soc_netsoc_sdram_bankmachine4_twtpcon_ready <= 1'd1;
			end
		end
	end
	if (soc_netsoc_sdram_bankmachine4_trccon_valid) begin
		soc_netsoc_sdram_bankmachine4_trccon_count <= 2'd3;
		if (1'd0) begin
			soc_netsoc_sdram_bankmachine4_trccon_ready <= 1'd1;
		end else begin
			soc_netsoc_sdram_bankmachine4_trccon_ready <= 1'd0;
		end
	end else begin
		if ((~soc_netsoc_sdram_bankmachine4_trccon_ready)) begin
			soc_netsoc_sdram_bankmachine4_trccon_count <= (soc_netsoc_sdram_bankmachine4_trccon_count - 1'd1);
			if ((soc_netsoc_sdram_bankmachine4_trccon_count == 1'd1)) begin
				soc_netsoc_sdram_bankmachine4_trccon_ready <= 1'd1;
			end
		end
	end
	if (soc_netsoc_sdram_bankmachine4_trascon_valid) begin
		soc_netsoc_sdram_bankmachine4_trascon_count <= 2'd2;
		if (1'd0) begin
			soc_netsoc_sdram_bankmachine4_trascon_ready <= 1'd1;
		end else begin
			soc_netsoc_sdram_bankmachine4_trascon_ready <= 1'd0;
		end
	end else begin
		if ((~soc_netsoc_sdram_bankmachine4_trascon_ready)) begin
			soc_netsoc_sdram_bankmachine4_trascon_count <= (soc_netsoc_sdram_bankmachine4_trascon_count - 1'd1);
			if ((soc_netsoc_sdram_bankmachine4_trascon_count == 1'd1)) begin
				soc_netsoc_sdram_bankmachine4_trascon_ready <= 1'd1;
			end
		end
	end
	vns_bankmachine4_state <= vns_bankmachine4_next_state;
	if (soc_netsoc_sdram_bankmachine5_row_close) begin
		soc_netsoc_sdram_bankmachine5_row_opened <= 1'd0;
	end else begin
		if (soc_netsoc_sdram_bankmachine5_row_open) begin
			soc_netsoc_sdram_bankmachine5_row_opened <= 1'd1;
			soc_netsoc_sdram_bankmachine5_row <= soc_netsoc_sdram_bankmachine5_cmd_buffer_source_payload_addr[20:7];
		end
	end
	if (((soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_we & soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_writable) & (~soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_replace))) begin
		soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_produce <= (soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_produce + 1'd1);
	end
	if (soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_do_read) begin
		soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_consume <= (soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_consume + 1'd1);
	end
	if (((soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_we & soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_syncfifo5_writable) & (~soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_replace))) begin
		if ((~soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_do_read)) begin
			soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_level <= (soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_level + 1'd1);
		end
	end else begin
		if (soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_do_read) begin
			soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_level <= (soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_level - 1'd1);
		end
	end
	if (soc_netsoc_sdram_bankmachine5_cmd_buffer_pipe_ce) begin
		soc_netsoc_sdram_bankmachine5_cmd_buffer_valid_n <= soc_netsoc_sdram_bankmachine5_cmd_buffer_sink_valid;
	end
	if (soc_netsoc_sdram_bankmachine5_cmd_buffer_pipe_ce) begin
		soc_netsoc_sdram_bankmachine5_cmd_buffer_first_n <= (soc_netsoc_sdram_bankmachine5_cmd_buffer_sink_valid & soc_netsoc_sdram_bankmachine5_cmd_buffer_sink_first);
		soc_netsoc_sdram_bankmachine5_cmd_buffer_last_n <= (soc_netsoc_sdram_bankmachine5_cmd_buffer_sink_valid & soc_netsoc_sdram_bankmachine5_cmd_buffer_sink_last);
	end
	if (soc_netsoc_sdram_bankmachine5_cmd_buffer_pipe_ce) begin
		soc_netsoc_sdram_bankmachine5_cmd_buffer_source_payload_we <= soc_netsoc_sdram_bankmachine5_cmd_buffer_sink_payload_we;
		soc_netsoc_sdram_bankmachine5_cmd_buffer_source_payload_addr <= soc_netsoc_sdram_bankmachine5_cmd_buffer_sink_payload_addr;
	end
	if (soc_netsoc_sdram_bankmachine5_twtpcon_valid) begin
		soc_netsoc_sdram_bankmachine5_twtpcon_count <= 3'd4;
		if (1'd0) begin
			soc_netsoc_sdram_bankmachine5_twtpcon_ready <= 1'd1;
		end else begin
			soc_netsoc_sdram_bankmachine5_twtpcon_ready <= 1'd0;
		end
	end else begin
		if ((~soc_netsoc_sdram_bankmachine5_twtpcon_ready)) begin
			soc_netsoc_sdram_bankmachine5_twtpcon_count <= (soc_netsoc_sdram_bankmachine5_twtpcon_count - 1'd1);
			if ((soc_netsoc_sdram_bankmachine5_twtpcon_count == 1'd1)) begin
				soc_netsoc_sdram_bankmachine5_twtpcon_ready <= 1'd1;
			end
		end
	end
	if (soc_netsoc_sdram_bankmachine5_trccon_valid) begin
		soc_netsoc_sdram_bankmachine5_trccon_count <= 2'd3;
		if (1'd0) begin
			soc_netsoc_sdram_bankmachine5_trccon_ready <= 1'd1;
		end else begin
			soc_netsoc_sdram_bankmachine5_trccon_ready <= 1'd0;
		end
	end else begin
		if ((~soc_netsoc_sdram_bankmachine5_trccon_ready)) begin
			soc_netsoc_sdram_bankmachine5_trccon_count <= (soc_netsoc_sdram_bankmachine5_trccon_count - 1'd1);
			if ((soc_netsoc_sdram_bankmachine5_trccon_count == 1'd1)) begin
				soc_netsoc_sdram_bankmachine5_trccon_ready <= 1'd1;
			end
		end
	end
	if (soc_netsoc_sdram_bankmachine5_trascon_valid) begin
		soc_netsoc_sdram_bankmachine5_trascon_count <= 2'd2;
		if (1'd0) begin
			soc_netsoc_sdram_bankmachine5_trascon_ready <= 1'd1;
		end else begin
			soc_netsoc_sdram_bankmachine5_trascon_ready <= 1'd0;
		end
	end else begin
		if ((~soc_netsoc_sdram_bankmachine5_trascon_ready)) begin
			soc_netsoc_sdram_bankmachine5_trascon_count <= (soc_netsoc_sdram_bankmachine5_trascon_count - 1'd1);
			if ((soc_netsoc_sdram_bankmachine5_trascon_count == 1'd1)) begin
				soc_netsoc_sdram_bankmachine5_trascon_ready <= 1'd1;
			end
		end
	end
	vns_bankmachine5_state <= vns_bankmachine5_next_state;
	if (soc_netsoc_sdram_bankmachine6_row_close) begin
		soc_netsoc_sdram_bankmachine6_row_opened <= 1'd0;
	end else begin
		if (soc_netsoc_sdram_bankmachine6_row_open) begin
			soc_netsoc_sdram_bankmachine6_row_opened <= 1'd1;
			soc_netsoc_sdram_bankmachine6_row <= soc_netsoc_sdram_bankmachine6_cmd_buffer_source_payload_addr[20:7];
		end
	end
	if (((soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_we & soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_writable) & (~soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_replace))) begin
		soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_produce <= (soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_produce + 1'd1);
	end
	if (soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_do_read) begin
		soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_consume <= (soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_consume + 1'd1);
	end
	if (((soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_we & soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_syncfifo6_writable) & (~soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_replace))) begin
		if ((~soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_do_read)) begin
			soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_level <= (soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_level + 1'd1);
		end
	end else begin
		if (soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_do_read) begin
			soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_level <= (soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_level - 1'd1);
		end
	end
	if (soc_netsoc_sdram_bankmachine6_cmd_buffer_pipe_ce) begin
		soc_netsoc_sdram_bankmachine6_cmd_buffer_valid_n <= soc_netsoc_sdram_bankmachine6_cmd_buffer_sink_valid;
	end
	if (soc_netsoc_sdram_bankmachine6_cmd_buffer_pipe_ce) begin
		soc_netsoc_sdram_bankmachine6_cmd_buffer_first_n <= (soc_netsoc_sdram_bankmachine6_cmd_buffer_sink_valid & soc_netsoc_sdram_bankmachine6_cmd_buffer_sink_first);
		soc_netsoc_sdram_bankmachine6_cmd_buffer_last_n <= (soc_netsoc_sdram_bankmachine6_cmd_buffer_sink_valid & soc_netsoc_sdram_bankmachine6_cmd_buffer_sink_last);
	end
	if (soc_netsoc_sdram_bankmachine6_cmd_buffer_pipe_ce) begin
		soc_netsoc_sdram_bankmachine6_cmd_buffer_source_payload_we <= soc_netsoc_sdram_bankmachine6_cmd_buffer_sink_payload_we;
		soc_netsoc_sdram_bankmachine6_cmd_buffer_source_payload_addr <= soc_netsoc_sdram_bankmachine6_cmd_buffer_sink_payload_addr;
	end
	if (soc_netsoc_sdram_bankmachine6_twtpcon_valid) begin
		soc_netsoc_sdram_bankmachine6_twtpcon_count <= 3'd4;
		if (1'd0) begin
			soc_netsoc_sdram_bankmachine6_twtpcon_ready <= 1'd1;
		end else begin
			soc_netsoc_sdram_bankmachine6_twtpcon_ready <= 1'd0;
		end
	end else begin
		if ((~soc_netsoc_sdram_bankmachine6_twtpcon_ready)) begin
			soc_netsoc_sdram_bankmachine6_twtpcon_count <= (soc_netsoc_sdram_bankmachine6_twtpcon_count - 1'd1);
			if ((soc_netsoc_sdram_bankmachine6_twtpcon_count == 1'd1)) begin
				soc_netsoc_sdram_bankmachine6_twtpcon_ready <= 1'd1;
			end
		end
	end
	if (soc_netsoc_sdram_bankmachine6_trccon_valid) begin
		soc_netsoc_sdram_bankmachine6_trccon_count <= 2'd3;
		if (1'd0) begin
			soc_netsoc_sdram_bankmachine6_trccon_ready <= 1'd1;
		end else begin
			soc_netsoc_sdram_bankmachine6_trccon_ready <= 1'd0;
		end
	end else begin
		if ((~soc_netsoc_sdram_bankmachine6_trccon_ready)) begin
			soc_netsoc_sdram_bankmachine6_trccon_count <= (soc_netsoc_sdram_bankmachine6_trccon_count - 1'd1);
			if ((soc_netsoc_sdram_bankmachine6_trccon_count == 1'd1)) begin
				soc_netsoc_sdram_bankmachine6_trccon_ready <= 1'd1;
			end
		end
	end
	if (soc_netsoc_sdram_bankmachine6_trascon_valid) begin
		soc_netsoc_sdram_bankmachine6_trascon_count <= 2'd2;
		if (1'd0) begin
			soc_netsoc_sdram_bankmachine6_trascon_ready <= 1'd1;
		end else begin
			soc_netsoc_sdram_bankmachine6_trascon_ready <= 1'd0;
		end
	end else begin
		if ((~soc_netsoc_sdram_bankmachine6_trascon_ready)) begin
			soc_netsoc_sdram_bankmachine6_trascon_count <= (soc_netsoc_sdram_bankmachine6_trascon_count - 1'd1);
			if ((soc_netsoc_sdram_bankmachine6_trascon_count == 1'd1)) begin
				soc_netsoc_sdram_bankmachine6_trascon_ready <= 1'd1;
			end
		end
	end
	vns_bankmachine6_state <= vns_bankmachine6_next_state;
	if (soc_netsoc_sdram_bankmachine7_row_close) begin
		soc_netsoc_sdram_bankmachine7_row_opened <= 1'd0;
	end else begin
		if (soc_netsoc_sdram_bankmachine7_row_open) begin
			soc_netsoc_sdram_bankmachine7_row_opened <= 1'd1;
			soc_netsoc_sdram_bankmachine7_row <= soc_netsoc_sdram_bankmachine7_cmd_buffer_source_payload_addr[20:7];
		end
	end
	if (((soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_we & soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_writable) & (~soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_replace))) begin
		soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_produce <= (soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_produce + 1'd1);
	end
	if (soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_do_read) begin
		soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_consume <= (soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_consume + 1'd1);
	end
	if (((soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_we & soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_syncfifo7_writable) & (~soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_replace))) begin
		if ((~soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_do_read)) begin
			soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_level <= (soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_level + 1'd1);
		end
	end else begin
		if (soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_do_read) begin
			soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_level <= (soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_level - 1'd1);
		end
	end
	if (soc_netsoc_sdram_bankmachine7_cmd_buffer_pipe_ce) begin
		soc_netsoc_sdram_bankmachine7_cmd_buffer_valid_n <= soc_netsoc_sdram_bankmachine7_cmd_buffer_sink_valid;
	end
	if (soc_netsoc_sdram_bankmachine7_cmd_buffer_pipe_ce) begin
		soc_netsoc_sdram_bankmachine7_cmd_buffer_first_n <= (soc_netsoc_sdram_bankmachine7_cmd_buffer_sink_valid & soc_netsoc_sdram_bankmachine7_cmd_buffer_sink_first);
		soc_netsoc_sdram_bankmachine7_cmd_buffer_last_n <= (soc_netsoc_sdram_bankmachine7_cmd_buffer_sink_valid & soc_netsoc_sdram_bankmachine7_cmd_buffer_sink_last);
	end
	if (soc_netsoc_sdram_bankmachine7_cmd_buffer_pipe_ce) begin
		soc_netsoc_sdram_bankmachine7_cmd_buffer_source_payload_we <= soc_netsoc_sdram_bankmachine7_cmd_buffer_sink_payload_we;
		soc_netsoc_sdram_bankmachine7_cmd_buffer_source_payload_addr <= soc_netsoc_sdram_bankmachine7_cmd_buffer_sink_payload_addr;
	end
	if (soc_netsoc_sdram_bankmachine7_twtpcon_valid) begin
		soc_netsoc_sdram_bankmachine7_twtpcon_count <= 3'd4;
		if (1'd0) begin
			soc_netsoc_sdram_bankmachine7_twtpcon_ready <= 1'd1;
		end else begin
			soc_netsoc_sdram_bankmachine7_twtpcon_ready <= 1'd0;
		end
	end else begin
		if ((~soc_netsoc_sdram_bankmachine7_twtpcon_ready)) begin
			soc_netsoc_sdram_bankmachine7_twtpcon_count <= (soc_netsoc_sdram_bankmachine7_twtpcon_count - 1'd1);
			if ((soc_netsoc_sdram_bankmachine7_twtpcon_count == 1'd1)) begin
				soc_netsoc_sdram_bankmachine7_twtpcon_ready <= 1'd1;
			end
		end
	end
	if (soc_netsoc_sdram_bankmachine7_trccon_valid) begin
		soc_netsoc_sdram_bankmachine7_trccon_count <= 2'd3;
		if (1'd0) begin
			soc_netsoc_sdram_bankmachine7_trccon_ready <= 1'd1;
		end else begin
			soc_netsoc_sdram_bankmachine7_trccon_ready <= 1'd0;
		end
	end else begin
		if ((~soc_netsoc_sdram_bankmachine7_trccon_ready)) begin
			soc_netsoc_sdram_bankmachine7_trccon_count <= (soc_netsoc_sdram_bankmachine7_trccon_count - 1'd1);
			if ((soc_netsoc_sdram_bankmachine7_trccon_count == 1'd1)) begin
				soc_netsoc_sdram_bankmachine7_trccon_ready <= 1'd1;
			end
		end
	end
	if (soc_netsoc_sdram_bankmachine7_trascon_valid) begin
		soc_netsoc_sdram_bankmachine7_trascon_count <= 2'd2;
		if (1'd0) begin
			soc_netsoc_sdram_bankmachine7_trascon_ready <= 1'd1;
		end else begin
			soc_netsoc_sdram_bankmachine7_trascon_ready <= 1'd0;
		end
	end else begin
		if ((~soc_netsoc_sdram_bankmachine7_trascon_ready)) begin
			soc_netsoc_sdram_bankmachine7_trascon_count <= (soc_netsoc_sdram_bankmachine7_trascon_count - 1'd1);
			if ((soc_netsoc_sdram_bankmachine7_trascon_count == 1'd1)) begin
				soc_netsoc_sdram_bankmachine7_trascon_ready <= 1'd1;
			end
		end
	end
	vns_bankmachine7_state <= vns_bankmachine7_next_state;
	if ((~soc_netsoc_sdram_en0)) begin
		soc_netsoc_sdram_time0 <= 5'd31;
	end else begin
		if ((~soc_netsoc_sdram_max_time0)) begin
			soc_netsoc_sdram_time0 <= (soc_netsoc_sdram_time0 - 1'd1);
		end
	end
	if ((~soc_netsoc_sdram_en1)) begin
		soc_netsoc_sdram_time1 <= 4'd15;
	end else begin
		if ((~soc_netsoc_sdram_max_time1)) begin
			soc_netsoc_sdram_time1 <= (soc_netsoc_sdram_time1 - 1'd1);
		end
	end
	if (soc_netsoc_sdram_choose_cmd_ce) begin
		case (soc_netsoc_sdram_choose_cmd_grant)
			1'd0: begin
				if (soc_netsoc_sdram_choose_cmd_request[1]) begin
					soc_netsoc_sdram_choose_cmd_grant <= 1'd1;
				end else begin
					if (soc_netsoc_sdram_choose_cmd_request[2]) begin
						soc_netsoc_sdram_choose_cmd_grant <= 2'd2;
					end else begin
						if (soc_netsoc_sdram_choose_cmd_request[3]) begin
							soc_netsoc_sdram_choose_cmd_grant <= 2'd3;
						end else begin
							if (soc_netsoc_sdram_choose_cmd_request[4]) begin
								soc_netsoc_sdram_choose_cmd_grant <= 3'd4;
							end else begin
								if (soc_netsoc_sdram_choose_cmd_request[5]) begin
									soc_netsoc_sdram_choose_cmd_grant <= 3'd5;
								end else begin
									if (soc_netsoc_sdram_choose_cmd_request[6]) begin
										soc_netsoc_sdram_choose_cmd_grant <= 3'd6;
									end else begin
										if (soc_netsoc_sdram_choose_cmd_request[7]) begin
											soc_netsoc_sdram_choose_cmd_grant <= 3'd7;
										end
									end
								end
							end
						end
					end
				end
			end
			1'd1: begin
				if (soc_netsoc_sdram_choose_cmd_request[2]) begin
					soc_netsoc_sdram_choose_cmd_grant <= 2'd2;
				end else begin
					if (soc_netsoc_sdram_choose_cmd_request[3]) begin
						soc_netsoc_sdram_choose_cmd_grant <= 2'd3;
					end else begin
						if (soc_netsoc_sdram_choose_cmd_request[4]) begin
							soc_netsoc_sdram_choose_cmd_grant <= 3'd4;
						end else begin
							if (soc_netsoc_sdram_choose_cmd_request[5]) begin
								soc_netsoc_sdram_choose_cmd_grant <= 3'd5;
							end else begin
								if (soc_netsoc_sdram_choose_cmd_request[6]) begin
									soc_netsoc_sdram_choose_cmd_grant <= 3'd6;
								end else begin
									if (soc_netsoc_sdram_choose_cmd_request[7]) begin
										soc_netsoc_sdram_choose_cmd_grant <= 3'd7;
									end else begin
										if (soc_netsoc_sdram_choose_cmd_request[0]) begin
											soc_netsoc_sdram_choose_cmd_grant <= 1'd0;
										end
									end
								end
							end
						end
					end
				end
			end
			2'd2: begin
				if (soc_netsoc_sdram_choose_cmd_request[3]) begin
					soc_netsoc_sdram_choose_cmd_grant <= 2'd3;
				end else begin
					if (soc_netsoc_sdram_choose_cmd_request[4]) begin
						soc_netsoc_sdram_choose_cmd_grant <= 3'd4;
					end else begin
						if (soc_netsoc_sdram_choose_cmd_request[5]) begin
							soc_netsoc_sdram_choose_cmd_grant <= 3'd5;
						end else begin
							if (soc_netsoc_sdram_choose_cmd_request[6]) begin
								soc_netsoc_sdram_choose_cmd_grant <= 3'd6;
							end else begin
								if (soc_netsoc_sdram_choose_cmd_request[7]) begin
									soc_netsoc_sdram_choose_cmd_grant <= 3'd7;
								end else begin
									if (soc_netsoc_sdram_choose_cmd_request[0]) begin
										soc_netsoc_sdram_choose_cmd_grant <= 1'd0;
									end else begin
										if (soc_netsoc_sdram_choose_cmd_request[1]) begin
											soc_netsoc_sdram_choose_cmd_grant <= 1'd1;
										end
									end
								end
							end
						end
					end
				end
			end
			2'd3: begin
				if (soc_netsoc_sdram_choose_cmd_request[4]) begin
					soc_netsoc_sdram_choose_cmd_grant <= 3'd4;
				end else begin
					if (soc_netsoc_sdram_choose_cmd_request[5]) begin
						soc_netsoc_sdram_choose_cmd_grant <= 3'd5;
					end else begin
						if (soc_netsoc_sdram_choose_cmd_request[6]) begin
							soc_netsoc_sdram_choose_cmd_grant <= 3'd6;
						end else begin
							if (soc_netsoc_sdram_choose_cmd_request[7]) begin
								soc_netsoc_sdram_choose_cmd_grant <= 3'd7;
							end else begin
								if (soc_netsoc_sdram_choose_cmd_request[0]) begin
									soc_netsoc_sdram_choose_cmd_grant <= 1'd0;
								end else begin
									if (soc_netsoc_sdram_choose_cmd_request[1]) begin
										soc_netsoc_sdram_choose_cmd_grant <= 1'd1;
									end else begin
										if (soc_netsoc_sdram_choose_cmd_request[2]) begin
											soc_netsoc_sdram_choose_cmd_grant <= 2'd2;
										end
									end
								end
							end
						end
					end
				end
			end
			3'd4: begin
				if (soc_netsoc_sdram_choose_cmd_request[5]) begin
					soc_netsoc_sdram_choose_cmd_grant <= 3'd5;
				end else begin
					if (soc_netsoc_sdram_choose_cmd_request[6]) begin
						soc_netsoc_sdram_choose_cmd_grant <= 3'd6;
					end else begin
						if (soc_netsoc_sdram_choose_cmd_request[7]) begin
							soc_netsoc_sdram_choose_cmd_grant <= 3'd7;
						end else begin
							if (soc_netsoc_sdram_choose_cmd_request[0]) begin
								soc_netsoc_sdram_choose_cmd_grant <= 1'd0;
							end else begin
								if (soc_netsoc_sdram_choose_cmd_request[1]) begin
									soc_netsoc_sdram_choose_cmd_grant <= 1'd1;
								end else begin
									if (soc_netsoc_sdram_choose_cmd_request[2]) begin
										soc_netsoc_sdram_choose_cmd_grant <= 2'd2;
									end else begin
										if (soc_netsoc_sdram_choose_cmd_request[3]) begin
											soc_netsoc_sdram_choose_cmd_grant <= 2'd3;
										end
									end
								end
							end
						end
					end
				end
			end
			3'd5: begin
				if (soc_netsoc_sdram_choose_cmd_request[6]) begin
					soc_netsoc_sdram_choose_cmd_grant <= 3'd6;
				end else begin
					if (soc_netsoc_sdram_choose_cmd_request[7]) begin
						soc_netsoc_sdram_choose_cmd_grant <= 3'd7;
					end else begin
						if (soc_netsoc_sdram_choose_cmd_request[0]) begin
							soc_netsoc_sdram_choose_cmd_grant <= 1'd0;
						end else begin
							if (soc_netsoc_sdram_choose_cmd_request[1]) begin
								soc_netsoc_sdram_choose_cmd_grant <= 1'd1;
							end else begin
								if (soc_netsoc_sdram_choose_cmd_request[2]) begin
									soc_netsoc_sdram_choose_cmd_grant <= 2'd2;
								end else begin
									if (soc_netsoc_sdram_choose_cmd_request[3]) begin
										soc_netsoc_sdram_choose_cmd_grant <= 2'd3;
									end else begin
										if (soc_netsoc_sdram_choose_cmd_request[4]) begin
											soc_netsoc_sdram_choose_cmd_grant <= 3'd4;
										end
									end
								end
							end
						end
					end
				end
			end
			3'd6: begin
				if (soc_netsoc_sdram_choose_cmd_request[7]) begin
					soc_netsoc_sdram_choose_cmd_grant <= 3'd7;
				end else begin
					if (soc_netsoc_sdram_choose_cmd_request[0]) begin
						soc_netsoc_sdram_choose_cmd_grant <= 1'd0;
					end else begin
						if (soc_netsoc_sdram_choose_cmd_request[1]) begin
							soc_netsoc_sdram_choose_cmd_grant <= 1'd1;
						end else begin
							if (soc_netsoc_sdram_choose_cmd_request[2]) begin
								soc_netsoc_sdram_choose_cmd_grant <= 2'd2;
							end else begin
								if (soc_netsoc_sdram_choose_cmd_request[3]) begin
									soc_netsoc_sdram_choose_cmd_grant <= 2'd3;
								end else begin
									if (soc_netsoc_sdram_choose_cmd_request[4]) begin
										soc_netsoc_sdram_choose_cmd_grant <= 3'd4;
									end else begin
										if (soc_netsoc_sdram_choose_cmd_request[5]) begin
											soc_netsoc_sdram_choose_cmd_grant <= 3'd5;
										end
									end
								end
							end
						end
					end
				end
			end
			3'd7: begin
				if (soc_netsoc_sdram_choose_cmd_request[0]) begin
					soc_netsoc_sdram_choose_cmd_grant <= 1'd0;
				end else begin
					if (soc_netsoc_sdram_choose_cmd_request[1]) begin
						soc_netsoc_sdram_choose_cmd_grant <= 1'd1;
					end else begin
						if (soc_netsoc_sdram_choose_cmd_request[2]) begin
							soc_netsoc_sdram_choose_cmd_grant <= 2'd2;
						end else begin
							if (soc_netsoc_sdram_choose_cmd_request[3]) begin
								soc_netsoc_sdram_choose_cmd_grant <= 2'd3;
							end else begin
								if (soc_netsoc_sdram_choose_cmd_request[4]) begin
									soc_netsoc_sdram_choose_cmd_grant <= 3'd4;
								end else begin
									if (soc_netsoc_sdram_choose_cmd_request[5]) begin
										soc_netsoc_sdram_choose_cmd_grant <= 3'd5;
									end else begin
										if (soc_netsoc_sdram_choose_cmd_request[6]) begin
											soc_netsoc_sdram_choose_cmd_grant <= 3'd6;
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
	if (soc_netsoc_sdram_choose_req_ce) begin
		case (soc_netsoc_sdram_choose_req_grant)
			1'd0: begin
				if (soc_netsoc_sdram_choose_req_request[1]) begin
					soc_netsoc_sdram_choose_req_grant <= 1'd1;
				end else begin
					if (soc_netsoc_sdram_choose_req_request[2]) begin
						soc_netsoc_sdram_choose_req_grant <= 2'd2;
					end else begin
						if (soc_netsoc_sdram_choose_req_request[3]) begin
							soc_netsoc_sdram_choose_req_grant <= 2'd3;
						end else begin
							if (soc_netsoc_sdram_choose_req_request[4]) begin
								soc_netsoc_sdram_choose_req_grant <= 3'd4;
							end else begin
								if (soc_netsoc_sdram_choose_req_request[5]) begin
									soc_netsoc_sdram_choose_req_grant <= 3'd5;
								end else begin
									if (soc_netsoc_sdram_choose_req_request[6]) begin
										soc_netsoc_sdram_choose_req_grant <= 3'd6;
									end else begin
										if (soc_netsoc_sdram_choose_req_request[7]) begin
											soc_netsoc_sdram_choose_req_grant <= 3'd7;
										end
									end
								end
							end
						end
					end
				end
			end
			1'd1: begin
				if (soc_netsoc_sdram_choose_req_request[2]) begin
					soc_netsoc_sdram_choose_req_grant <= 2'd2;
				end else begin
					if (soc_netsoc_sdram_choose_req_request[3]) begin
						soc_netsoc_sdram_choose_req_grant <= 2'd3;
					end else begin
						if (soc_netsoc_sdram_choose_req_request[4]) begin
							soc_netsoc_sdram_choose_req_grant <= 3'd4;
						end else begin
							if (soc_netsoc_sdram_choose_req_request[5]) begin
								soc_netsoc_sdram_choose_req_grant <= 3'd5;
							end else begin
								if (soc_netsoc_sdram_choose_req_request[6]) begin
									soc_netsoc_sdram_choose_req_grant <= 3'd6;
								end else begin
									if (soc_netsoc_sdram_choose_req_request[7]) begin
										soc_netsoc_sdram_choose_req_grant <= 3'd7;
									end else begin
										if (soc_netsoc_sdram_choose_req_request[0]) begin
											soc_netsoc_sdram_choose_req_grant <= 1'd0;
										end
									end
								end
							end
						end
					end
				end
			end
			2'd2: begin
				if (soc_netsoc_sdram_choose_req_request[3]) begin
					soc_netsoc_sdram_choose_req_grant <= 2'd3;
				end else begin
					if (soc_netsoc_sdram_choose_req_request[4]) begin
						soc_netsoc_sdram_choose_req_grant <= 3'd4;
					end else begin
						if (soc_netsoc_sdram_choose_req_request[5]) begin
							soc_netsoc_sdram_choose_req_grant <= 3'd5;
						end else begin
							if (soc_netsoc_sdram_choose_req_request[6]) begin
								soc_netsoc_sdram_choose_req_grant <= 3'd6;
							end else begin
								if (soc_netsoc_sdram_choose_req_request[7]) begin
									soc_netsoc_sdram_choose_req_grant <= 3'd7;
								end else begin
									if (soc_netsoc_sdram_choose_req_request[0]) begin
										soc_netsoc_sdram_choose_req_grant <= 1'd0;
									end else begin
										if (soc_netsoc_sdram_choose_req_request[1]) begin
											soc_netsoc_sdram_choose_req_grant <= 1'd1;
										end
									end
								end
							end
						end
					end
				end
			end
			2'd3: begin
				if (soc_netsoc_sdram_choose_req_request[4]) begin
					soc_netsoc_sdram_choose_req_grant <= 3'd4;
				end else begin
					if (soc_netsoc_sdram_choose_req_request[5]) begin
						soc_netsoc_sdram_choose_req_grant <= 3'd5;
					end else begin
						if (soc_netsoc_sdram_choose_req_request[6]) begin
							soc_netsoc_sdram_choose_req_grant <= 3'd6;
						end else begin
							if (soc_netsoc_sdram_choose_req_request[7]) begin
								soc_netsoc_sdram_choose_req_grant <= 3'd7;
							end else begin
								if (soc_netsoc_sdram_choose_req_request[0]) begin
									soc_netsoc_sdram_choose_req_grant <= 1'd0;
								end else begin
									if (soc_netsoc_sdram_choose_req_request[1]) begin
										soc_netsoc_sdram_choose_req_grant <= 1'd1;
									end else begin
										if (soc_netsoc_sdram_choose_req_request[2]) begin
											soc_netsoc_sdram_choose_req_grant <= 2'd2;
										end
									end
								end
							end
						end
					end
				end
			end
			3'd4: begin
				if (soc_netsoc_sdram_choose_req_request[5]) begin
					soc_netsoc_sdram_choose_req_grant <= 3'd5;
				end else begin
					if (soc_netsoc_sdram_choose_req_request[6]) begin
						soc_netsoc_sdram_choose_req_grant <= 3'd6;
					end else begin
						if (soc_netsoc_sdram_choose_req_request[7]) begin
							soc_netsoc_sdram_choose_req_grant <= 3'd7;
						end else begin
							if (soc_netsoc_sdram_choose_req_request[0]) begin
								soc_netsoc_sdram_choose_req_grant <= 1'd0;
							end else begin
								if (soc_netsoc_sdram_choose_req_request[1]) begin
									soc_netsoc_sdram_choose_req_grant <= 1'd1;
								end else begin
									if (soc_netsoc_sdram_choose_req_request[2]) begin
										soc_netsoc_sdram_choose_req_grant <= 2'd2;
									end else begin
										if (soc_netsoc_sdram_choose_req_request[3]) begin
											soc_netsoc_sdram_choose_req_grant <= 2'd3;
										end
									end
								end
							end
						end
					end
				end
			end
			3'd5: begin
				if (soc_netsoc_sdram_choose_req_request[6]) begin
					soc_netsoc_sdram_choose_req_grant <= 3'd6;
				end else begin
					if (soc_netsoc_sdram_choose_req_request[7]) begin
						soc_netsoc_sdram_choose_req_grant <= 3'd7;
					end else begin
						if (soc_netsoc_sdram_choose_req_request[0]) begin
							soc_netsoc_sdram_choose_req_grant <= 1'd0;
						end else begin
							if (soc_netsoc_sdram_choose_req_request[1]) begin
								soc_netsoc_sdram_choose_req_grant <= 1'd1;
							end else begin
								if (soc_netsoc_sdram_choose_req_request[2]) begin
									soc_netsoc_sdram_choose_req_grant <= 2'd2;
								end else begin
									if (soc_netsoc_sdram_choose_req_request[3]) begin
										soc_netsoc_sdram_choose_req_grant <= 2'd3;
									end else begin
										if (soc_netsoc_sdram_choose_req_request[4]) begin
											soc_netsoc_sdram_choose_req_grant <= 3'd4;
										end
									end
								end
							end
						end
					end
				end
			end
			3'd6: begin
				if (soc_netsoc_sdram_choose_req_request[7]) begin
					soc_netsoc_sdram_choose_req_grant <= 3'd7;
				end else begin
					if (soc_netsoc_sdram_choose_req_request[0]) begin
						soc_netsoc_sdram_choose_req_grant <= 1'd0;
					end else begin
						if (soc_netsoc_sdram_choose_req_request[1]) begin
							soc_netsoc_sdram_choose_req_grant <= 1'd1;
						end else begin
							if (soc_netsoc_sdram_choose_req_request[2]) begin
								soc_netsoc_sdram_choose_req_grant <= 2'd2;
							end else begin
								if (soc_netsoc_sdram_choose_req_request[3]) begin
									soc_netsoc_sdram_choose_req_grant <= 2'd3;
								end else begin
									if (soc_netsoc_sdram_choose_req_request[4]) begin
										soc_netsoc_sdram_choose_req_grant <= 3'd4;
									end else begin
										if (soc_netsoc_sdram_choose_req_request[5]) begin
											soc_netsoc_sdram_choose_req_grant <= 3'd5;
										end
									end
								end
							end
						end
					end
				end
			end
			3'd7: begin
				if (soc_netsoc_sdram_choose_req_request[0]) begin
					soc_netsoc_sdram_choose_req_grant <= 1'd0;
				end else begin
					if (soc_netsoc_sdram_choose_req_request[1]) begin
						soc_netsoc_sdram_choose_req_grant <= 1'd1;
					end else begin
						if (soc_netsoc_sdram_choose_req_request[2]) begin
							soc_netsoc_sdram_choose_req_grant <= 2'd2;
						end else begin
							if (soc_netsoc_sdram_choose_req_request[3]) begin
								soc_netsoc_sdram_choose_req_grant <= 2'd3;
							end else begin
								if (soc_netsoc_sdram_choose_req_request[4]) begin
									soc_netsoc_sdram_choose_req_grant <= 3'd4;
								end else begin
									if (soc_netsoc_sdram_choose_req_request[5]) begin
										soc_netsoc_sdram_choose_req_grant <= 3'd5;
									end else begin
										if (soc_netsoc_sdram_choose_req_request[6]) begin
											soc_netsoc_sdram_choose_req_grant <= 3'd6;
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
	soc_netsoc_sdram_dfi_p0_cs_n <= 1'd0;
	soc_netsoc_sdram_dfi_p0_bank <= vns_array_muxed0;
	soc_netsoc_sdram_dfi_p0_address <= vns_array_muxed1;
	soc_netsoc_sdram_dfi_p0_cas_n <= (~vns_array_muxed2);
	soc_netsoc_sdram_dfi_p0_ras_n <= (~vns_array_muxed3);
	soc_netsoc_sdram_dfi_p0_we_n <= (~vns_array_muxed4);
	soc_netsoc_sdram_dfi_p0_rddata_en <= vns_array_muxed5;
	soc_netsoc_sdram_dfi_p0_wrdata_en <= vns_array_muxed6;
	soc_netsoc_sdram_dfi_p1_cs_n <= 1'd0;
	soc_netsoc_sdram_dfi_p1_bank <= vns_array_muxed7;
	soc_netsoc_sdram_dfi_p1_address <= vns_array_muxed8;
	soc_netsoc_sdram_dfi_p1_cas_n <= (~vns_array_muxed9);
	soc_netsoc_sdram_dfi_p1_ras_n <= (~vns_array_muxed10);
	soc_netsoc_sdram_dfi_p1_we_n <= (~vns_array_muxed11);
	soc_netsoc_sdram_dfi_p1_rddata_en <= vns_array_muxed12;
	soc_netsoc_sdram_dfi_p1_wrdata_en <= vns_array_muxed13;
	soc_netsoc_sdram_dfi_p2_cs_n <= 1'd0;
	soc_netsoc_sdram_dfi_p2_bank <= vns_array_muxed14;
	soc_netsoc_sdram_dfi_p2_address <= vns_array_muxed15;
	soc_netsoc_sdram_dfi_p2_cas_n <= (~vns_array_muxed16);
	soc_netsoc_sdram_dfi_p2_ras_n <= (~vns_array_muxed17);
	soc_netsoc_sdram_dfi_p2_we_n <= (~vns_array_muxed18);
	soc_netsoc_sdram_dfi_p2_rddata_en <= vns_array_muxed19;
	soc_netsoc_sdram_dfi_p2_wrdata_en <= vns_array_muxed20;
	soc_netsoc_sdram_dfi_p3_cs_n <= 1'd0;
	soc_netsoc_sdram_dfi_p3_bank <= vns_array_muxed21;
	soc_netsoc_sdram_dfi_p3_address <= vns_array_muxed22;
	soc_netsoc_sdram_dfi_p3_cas_n <= (~vns_array_muxed23);
	soc_netsoc_sdram_dfi_p3_ras_n <= (~vns_array_muxed24);
	soc_netsoc_sdram_dfi_p3_we_n <= (~vns_array_muxed25);
	soc_netsoc_sdram_dfi_p3_rddata_en <= vns_array_muxed26;
	soc_netsoc_sdram_dfi_p3_wrdata_en <= vns_array_muxed27;
	if (soc_netsoc_sdram_trrdcon_valid) begin
		soc_netsoc_sdram_trrdcon_count <= 1'd1;
		if (1'd0) begin
			soc_netsoc_sdram_trrdcon_ready <= 1'd1;
		end else begin
			soc_netsoc_sdram_trrdcon_ready <= 1'd0;
		end
	end else begin
		if ((~soc_netsoc_sdram_trrdcon_ready)) begin
			soc_netsoc_sdram_trrdcon_count <= (soc_netsoc_sdram_trrdcon_count - 1'd1);
			if ((soc_netsoc_sdram_trrdcon_count == 1'd1)) begin
				soc_netsoc_sdram_trrdcon_ready <= 1'd1;
			end
		end
	end
	soc_netsoc_sdram_tfawcon_window <= {soc_netsoc_sdram_tfawcon_window, soc_netsoc_sdram_tfawcon_valid};
	if ((soc_netsoc_sdram_tfawcon_count < 3'd4)) begin
		if ((soc_netsoc_sdram_tfawcon_count == 2'd3)) begin
			soc_netsoc_sdram_tfawcon_ready <= (~soc_netsoc_sdram_tfawcon_valid);
		end else begin
			soc_netsoc_sdram_tfawcon_ready <= 1'd1;
		end
	end
	if (soc_netsoc_sdram_tccdcon_valid) begin
		soc_netsoc_sdram_tccdcon_count <= 1'd0;
		if (1'd1) begin
			soc_netsoc_sdram_tccdcon_ready <= 1'd1;
		end else begin
			soc_netsoc_sdram_tccdcon_ready <= 1'd0;
		end
	end else begin
		if ((~soc_netsoc_sdram_tccdcon_ready)) begin
			soc_netsoc_sdram_tccdcon_count <= (soc_netsoc_sdram_tccdcon_count - 1'd1);
			if ((soc_netsoc_sdram_tccdcon_count == 1'd1)) begin
				soc_netsoc_sdram_tccdcon_ready <= 1'd1;
			end
		end
	end
	if (soc_netsoc_sdram_twtrcon_valid) begin
		soc_netsoc_sdram_twtrcon_count <= 3'd4;
		if (1'd0) begin
			soc_netsoc_sdram_twtrcon_ready <= 1'd1;
		end else begin
			soc_netsoc_sdram_twtrcon_ready <= 1'd0;
		end
	end else begin
		if ((~soc_netsoc_sdram_twtrcon_ready)) begin
			soc_netsoc_sdram_twtrcon_count <= (soc_netsoc_sdram_twtrcon_count - 1'd1);
			if ((soc_netsoc_sdram_twtrcon_count == 1'd1)) begin
				soc_netsoc_sdram_twtrcon_ready <= 1'd1;
			end
		end
	end
	vns_multiplexer_state <= vns_multiplexer_next_state;
	soc_netsoc_sdram_bandwidth_cmd_valid <= soc_netsoc_sdram_choose_req_cmd_valid;
	soc_netsoc_sdram_bandwidth_cmd_ready <= soc_netsoc_sdram_choose_req_cmd_ready;
	soc_netsoc_sdram_bandwidth_cmd_is_read <= soc_netsoc_sdram_choose_req_cmd_payload_is_read;
	soc_netsoc_sdram_bandwidth_cmd_is_write <= soc_netsoc_sdram_choose_req_cmd_payload_is_write;
	{soc_netsoc_sdram_bandwidth_period, soc_netsoc_sdram_bandwidth_counter} <= (soc_netsoc_sdram_bandwidth_counter + 1'd1);
	if (soc_netsoc_sdram_bandwidth_period) begin
		soc_netsoc_sdram_bandwidth_nreads_r <= soc_netsoc_sdram_bandwidth_nreads;
		soc_netsoc_sdram_bandwidth_nwrites_r <= soc_netsoc_sdram_bandwidth_nwrites;
		soc_netsoc_sdram_bandwidth_nreads <= 1'd0;
		soc_netsoc_sdram_bandwidth_nwrites <= 1'd0;
	end else begin
		if ((soc_netsoc_sdram_bandwidth_cmd_valid & soc_netsoc_sdram_bandwidth_cmd_ready)) begin
			if (soc_netsoc_sdram_bandwidth_cmd_is_read) begin
				soc_netsoc_sdram_bandwidth_nreads <= (soc_netsoc_sdram_bandwidth_nreads + 1'd1);
			end
			if (soc_netsoc_sdram_bandwidth_cmd_is_write) begin
				soc_netsoc_sdram_bandwidth_nwrites <= (soc_netsoc_sdram_bandwidth_nwrites + 1'd1);
			end
		end
	end
	if (soc_netsoc_sdram_bandwidth_update_re) begin
		soc_netsoc_sdram_bandwidth_nreads_status <= soc_netsoc_sdram_bandwidth_nreads_r;
		soc_netsoc_sdram_bandwidth_nwrites_status <= soc_netsoc_sdram_bandwidth_nwrites_r;
	end
	if (((vns_roundrobin0_grant == 1'd0) & soc_netsoc_sdram_interface_bank0_rdata_valid)) begin
		vns_rbank <= 1'd0;
	end
	if (((vns_roundrobin0_grant == 1'd0) & soc_netsoc_sdram_interface_bank0_wdata_ready)) begin
		vns_wbank <= 1'd0;
	end
	if (((vns_roundrobin1_grant == 1'd0) & soc_netsoc_sdram_interface_bank1_rdata_valid)) begin
		vns_rbank <= 1'd1;
	end
	if (((vns_roundrobin1_grant == 1'd0) & soc_netsoc_sdram_interface_bank1_wdata_ready)) begin
		vns_wbank <= 1'd1;
	end
	if (((vns_roundrobin2_grant == 1'd0) & soc_netsoc_sdram_interface_bank2_rdata_valid)) begin
		vns_rbank <= 2'd2;
	end
	if (((vns_roundrobin2_grant == 1'd0) & soc_netsoc_sdram_interface_bank2_wdata_ready)) begin
		vns_wbank <= 2'd2;
	end
	if (((vns_roundrobin3_grant == 1'd0) & soc_netsoc_sdram_interface_bank3_rdata_valid)) begin
		vns_rbank <= 2'd3;
	end
	if (((vns_roundrobin3_grant == 1'd0) & soc_netsoc_sdram_interface_bank3_wdata_ready)) begin
		vns_wbank <= 2'd3;
	end
	if (((vns_roundrobin4_grant == 1'd0) & soc_netsoc_sdram_interface_bank4_rdata_valid)) begin
		vns_rbank <= 3'd4;
	end
	if (((vns_roundrobin4_grant == 1'd0) & soc_netsoc_sdram_interface_bank4_wdata_ready)) begin
		vns_wbank <= 3'd4;
	end
	if (((vns_roundrobin5_grant == 1'd0) & soc_netsoc_sdram_interface_bank5_rdata_valid)) begin
		vns_rbank <= 3'd5;
	end
	if (((vns_roundrobin5_grant == 1'd0) & soc_netsoc_sdram_interface_bank5_wdata_ready)) begin
		vns_wbank <= 3'd5;
	end
	if (((vns_roundrobin6_grant == 1'd0) & soc_netsoc_sdram_interface_bank6_rdata_valid)) begin
		vns_rbank <= 3'd6;
	end
	if (((vns_roundrobin6_grant == 1'd0) & soc_netsoc_sdram_interface_bank6_wdata_ready)) begin
		vns_wbank <= 3'd6;
	end
	if (((vns_roundrobin7_grant == 1'd0) & soc_netsoc_sdram_interface_bank7_rdata_valid)) begin
		vns_rbank <= 3'd7;
	end
	if (((vns_roundrobin7_grant == 1'd0) & soc_netsoc_sdram_interface_bank7_wdata_ready)) begin
		vns_wbank <= 3'd7;
	end
	vns_new_master_wdata_ready0 <= ((((((((1'd0 | ((vns_roundrobin0_grant == 1'd0) & soc_netsoc_sdram_interface_bank0_wdata_ready)) | ((vns_roundrobin1_grant == 1'd0) & soc_netsoc_sdram_interface_bank1_wdata_ready)) | ((vns_roundrobin2_grant == 1'd0) & soc_netsoc_sdram_interface_bank2_wdata_ready)) | ((vns_roundrobin3_grant == 1'd0) & soc_netsoc_sdram_interface_bank3_wdata_ready)) | ((vns_roundrobin4_grant == 1'd0) & soc_netsoc_sdram_interface_bank4_wdata_ready)) | ((vns_roundrobin5_grant == 1'd0) & soc_netsoc_sdram_interface_bank5_wdata_ready)) | ((vns_roundrobin6_grant == 1'd0) & soc_netsoc_sdram_interface_bank6_wdata_ready)) | ((vns_roundrobin7_grant == 1'd0) & soc_netsoc_sdram_interface_bank7_wdata_ready));
	vns_new_master_wdata_ready1 <= vns_new_master_wdata_ready0;
	vns_new_master_wdata_ready2 <= vns_new_master_wdata_ready1;
	vns_new_master_rdata_valid0 <= ((((((((1'd0 | ((vns_roundrobin0_grant == 1'd0) & soc_netsoc_sdram_interface_bank0_rdata_valid)) | ((vns_roundrobin1_grant == 1'd0) & soc_netsoc_sdram_interface_bank1_rdata_valid)) | ((vns_roundrobin2_grant == 1'd0) & soc_netsoc_sdram_interface_bank2_rdata_valid)) | ((vns_roundrobin3_grant == 1'd0) & soc_netsoc_sdram_interface_bank3_rdata_valid)) | ((vns_roundrobin4_grant == 1'd0) & soc_netsoc_sdram_interface_bank4_rdata_valid)) | ((vns_roundrobin5_grant == 1'd0) & soc_netsoc_sdram_interface_bank5_rdata_valid)) | ((vns_roundrobin6_grant == 1'd0) & soc_netsoc_sdram_interface_bank6_rdata_valid)) | ((vns_roundrobin7_grant == 1'd0) & soc_netsoc_sdram_interface_bank7_rdata_valid));
	vns_new_master_rdata_valid1 <= vns_new_master_rdata_valid0;
	vns_new_master_rdata_valid2 <= vns_new_master_rdata_valid1;
	vns_new_master_rdata_valid3 <= vns_new_master_rdata_valid2;
	vns_new_master_rdata_valid4 <= vns_new_master_rdata_valid3;
	vns_new_master_rdata_valid5 <= vns_new_master_rdata_valid4;
	vns_new_master_rdata_valid6 <= vns_new_master_rdata_valid5;
	vns_new_master_rdata_valid7 <= vns_new_master_rdata_valid6;
	vns_new_master_rdata_valid8 <= vns_new_master_rdata_valid7;
	vns_new_master_rdata_valid9 <= vns_new_master_rdata_valid8;
	soc_netsoc_adr_offset_r <= soc_netsoc_interface0_wb_sdram_adr[1:0];
	vns_fullmemorywe_state <= vns_fullmemorywe_next_state;
	vns_litedramwishbone2native_state <= vns_litedramwishbone2native_next_state;
	if (soc_netsoc_count_litedramwishbone2native_next_value_ce) begin
		soc_netsoc_count <= soc_netsoc_count_litedramwishbone2native_next_value;
	end
	if (soc_counter_ce) begin
		soc_counter <= (soc_counter + 1'd1);
	end
	if (soc_ps_preamble_error_o) begin
		soc_preamble_errors_status <= (soc_preamble_errors_status + 1'd1);
	end
	if (soc_ps_crc_error_o) begin
		soc_crc_errors_status <= (soc_crc_errors_status + 1'd1);
	end
	soc_ps_preamble_error_toggle_o_r <= soc_ps_preamble_error_toggle_o;
	soc_ps_crc_error_toggle_o_r <= soc_ps_crc_error_toggle_o;
	soc_tx_cdc_graycounter0_q_binary <= soc_tx_cdc_graycounter0_q_next_binary;
	soc_tx_cdc_graycounter0_q <= soc_tx_cdc_graycounter0_q_next;
	soc_rx_cdc_graycounter1_q_binary <= soc_rx_cdc_graycounter1_q_next_binary;
	soc_rx_cdc_graycounter1_q <= soc_rx_cdc_graycounter1_q_next;
	if (soc_writer_counter_reset) begin
		soc_writer_counter <= 1'd0;
	end else begin
		if (soc_writer_counter_ce) begin
			soc_writer_counter <= (soc_writer_counter + soc_writer_inc);
		end
	end
	if (soc_writer_slot_ce) begin
		soc_writer_slot <= (soc_writer_slot + 1'd1);
	end
	if (((soc_writer_fifo_syncfifo_we & soc_writer_fifo_syncfifo_writable) & (~soc_writer_fifo_replace))) begin
		soc_writer_fifo_produce <= (soc_writer_fifo_produce + 1'd1);
	end
	if (soc_writer_fifo_do_read) begin
		soc_writer_fifo_consume <= (soc_writer_fifo_consume + 1'd1);
	end
	if (((soc_writer_fifo_syncfifo_we & soc_writer_fifo_syncfifo_writable) & (~soc_writer_fifo_replace))) begin
		if ((~soc_writer_fifo_do_read)) begin
			soc_writer_fifo_level <= (soc_writer_fifo_level + 1'd1);
		end
	end else begin
		if (soc_writer_fifo_do_read) begin
			soc_writer_fifo_level <= (soc_writer_fifo_level - 1'd1);
		end
	end
	vns_liteethmacsramwriter_state <= vns_liteethmacsramwriter_next_state;
	if (soc_writer_errors_status_liteethmac_next_value_ce) begin
		soc_writer_errors_status <= soc_writer_errors_status_liteethmac_next_value;
	end
	if (soc_reader_counter_reset) begin
		soc_reader_counter <= 1'd0;
	end else begin
		if (soc_reader_counter_ce) begin
			soc_reader_counter <= (soc_reader_counter + 3'd4);
		end
	end
	soc_reader_last_d <= soc_reader_last;
	if (soc_reader_done_clear) begin
		soc_reader_done_pending <= 1'd0;
	end
	if (soc_reader_done_trigger) begin
		soc_reader_done_pending <= 1'd1;
	end
	if (((soc_reader_fifo_syncfifo_we & soc_reader_fifo_syncfifo_writable) & (~soc_reader_fifo_replace))) begin
		soc_reader_fifo_produce <= (soc_reader_fifo_produce + 1'd1);
	end
	if (soc_reader_fifo_do_read) begin
		soc_reader_fifo_consume <= (soc_reader_fifo_consume + 1'd1);
	end
	if (((soc_reader_fifo_syncfifo_we & soc_reader_fifo_syncfifo_writable) & (~soc_reader_fifo_replace))) begin
		if ((~soc_reader_fifo_do_read)) begin
			soc_reader_fifo_level <= (soc_reader_fifo_level + 1'd1);
		end
	end else begin
		if (soc_reader_fifo_do_read) begin
			soc_reader_fifo_level <= (soc_reader_fifo_level - 1'd1);
		end
	end
	vns_liteethmacsramreader_state <= vns_liteethmacsramreader_next_state;
	soc_sram0_bus_ack0 <= 1'd0;
	if (((soc_sram0_bus_cyc0 & soc_sram0_bus_stb0) & (~soc_sram0_bus_ack0))) begin
		soc_sram0_bus_ack0 <= 1'd1;
	end
	soc_sram1_bus_ack0 <= 1'd0;
	if (((soc_sram1_bus_cyc0 & soc_sram1_bus_stb0) & (~soc_sram1_bus_ack0))) begin
		soc_sram1_bus_ack0 <= 1'd1;
	end
	soc_sram0_bus_ack1 <= 1'd0;
	if (((soc_sram0_bus_cyc1 & soc_sram0_bus_stb1) & (~soc_sram0_bus_ack1))) begin
		soc_sram0_bus_ack1 <= 1'd1;
	end
	soc_sram1_bus_ack1 <= 1'd0;
	if (((soc_sram1_bus_cyc1 & soc_sram1_bus_stb1) & (~soc_sram1_bus_ack1))) begin
		soc_sram1_bus_ack1 <= 1'd1;
	end
	soc_slave_sel_r <= soc_slave_sel;
	case (vns_netsoc_grant)
		1'd0: begin
			if ((~vns_netsoc_request[0])) begin
				if (vns_netsoc_request[1]) begin
					vns_netsoc_grant <= 1'd1;
				end
			end
		end
		1'd1: begin
			if ((~vns_netsoc_request[1])) begin
				if (vns_netsoc_request[0]) begin
					vns_netsoc_grant <= 1'd0;
				end
			end
		end
	endcase
	vns_netsoc_slave_sel_r <= vns_netsoc_slave_sel;
	if (vns_netsoc_wait) begin
		if ((~vns_netsoc_done)) begin
			vns_netsoc_count <= (vns_netsoc_count - 1'd1);
		end
	end else begin
		vns_netsoc_count <= 20'd1000000;
	end
	vns_netsoc_csrbankarray_interface0_bank_bus_dat_r <= 1'd0;
	if (vns_netsoc_csrbankarray_csrbank0_sel) begin
		case (vns_netsoc_csrbankarray_interface0_bank_bus_adr[4:0])
			1'd0: begin
				vns_netsoc_csrbankarray_interface0_bank_bus_dat_r <= soc_netsoc_cpu_latch_w;
			end
			1'd1: begin
				vns_netsoc_csrbankarray_interface0_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank0_timer_time7_w;
			end
			2'd2: begin
				vns_netsoc_csrbankarray_interface0_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank0_timer_time6_w;
			end
			2'd3: begin
				vns_netsoc_csrbankarray_interface0_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank0_timer_time5_w;
			end
			3'd4: begin
				vns_netsoc_csrbankarray_interface0_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank0_timer_time4_w;
			end
			3'd5: begin
				vns_netsoc_csrbankarray_interface0_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank0_timer_time3_w;
			end
			3'd6: begin
				vns_netsoc_csrbankarray_interface0_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank0_timer_time2_w;
			end
			3'd7: begin
				vns_netsoc_csrbankarray_interface0_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank0_timer_time1_w;
			end
			4'd8: begin
				vns_netsoc_csrbankarray_interface0_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank0_timer_time0_w;
			end
			4'd9: begin
				vns_netsoc_csrbankarray_interface0_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank0_timer_time_cmp7_w;
			end
			4'd10: begin
				vns_netsoc_csrbankarray_interface0_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank0_timer_time_cmp6_w;
			end
			4'd11: begin
				vns_netsoc_csrbankarray_interface0_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank0_timer_time_cmp5_w;
			end
			4'd12: begin
				vns_netsoc_csrbankarray_interface0_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank0_timer_time_cmp4_w;
			end
			4'd13: begin
				vns_netsoc_csrbankarray_interface0_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank0_timer_time_cmp3_w;
			end
			4'd14: begin
				vns_netsoc_csrbankarray_interface0_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank0_timer_time_cmp2_w;
			end
			4'd15: begin
				vns_netsoc_csrbankarray_interface0_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank0_timer_time_cmp1_w;
			end
			5'd16: begin
				vns_netsoc_csrbankarray_interface0_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank0_timer_time_cmp0_w;
			end
		endcase
	end
	if (vns_netsoc_csrbankarray_csrbank0_timer_time_cmp7_re) begin
		soc_netsoc_cpu_time_cmp_storage[63:56] <= vns_netsoc_csrbankarray_csrbank0_timer_time_cmp7_r;
	end
	if (vns_netsoc_csrbankarray_csrbank0_timer_time_cmp6_re) begin
		soc_netsoc_cpu_time_cmp_storage[55:48] <= vns_netsoc_csrbankarray_csrbank0_timer_time_cmp6_r;
	end
	if (vns_netsoc_csrbankarray_csrbank0_timer_time_cmp5_re) begin
		soc_netsoc_cpu_time_cmp_storage[47:40] <= vns_netsoc_csrbankarray_csrbank0_timer_time_cmp5_r;
	end
	if (vns_netsoc_csrbankarray_csrbank0_timer_time_cmp4_re) begin
		soc_netsoc_cpu_time_cmp_storage[39:32] <= vns_netsoc_csrbankarray_csrbank0_timer_time_cmp4_r;
	end
	if (vns_netsoc_csrbankarray_csrbank0_timer_time_cmp3_re) begin
		soc_netsoc_cpu_time_cmp_storage[31:24] <= vns_netsoc_csrbankarray_csrbank0_timer_time_cmp3_r;
	end
	if (vns_netsoc_csrbankarray_csrbank0_timer_time_cmp2_re) begin
		soc_netsoc_cpu_time_cmp_storage[23:16] <= vns_netsoc_csrbankarray_csrbank0_timer_time_cmp2_r;
	end
	if (vns_netsoc_csrbankarray_csrbank0_timer_time_cmp1_re) begin
		soc_netsoc_cpu_time_cmp_storage[15:8] <= vns_netsoc_csrbankarray_csrbank0_timer_time_cmp1_r;
	end
	if (vns_netsoc_csrbankarray_csrbank0_timer_time_cmp0_re) begin
		soc_netsoc_cpu_time_cmp_storage[7:0] <= vns_netsoc_csrbankarray_csrbank0_timer_time_cmp0_r;
	end
	soc_netsoc_cpu_time_cmp_re <= vns_netsoc_csrbankarray_csrbank0_timer_time_cmp0_re;
	vns_netsoc_csrbankarray_interface1_bank_bus_dat_r <= 1'd0;
	if (vns_netsoc_csrbankarray_csrbank1_sel) begin
		case (vns_netsoc_csrbankarray_interface1_bank_bus_adr[3:0])
			1'd0: begin
				vns_netsoc_csrbankarray_interface1_bank_bus_dat_r <= soc_netsoc_ctrl_reset_reset_w;
			end
			1'd1: begin
				vns_netsoc_csrbankarray_interface1_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank1_scratch3_w;
			end
			2'd2: begin
				vns_netsoc_csrbankarray_interface1_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank1_scratch2_w;
			end
			2'd3: begin
				vns_netsoc_csrbankarray_interface1_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank1_scratch1_w;
			end
			3'd4: begin
				vns_netsoc_csrbankarray_interface1_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank1_scratch0_w;
			end
			3'd5: begin
				vns_netsoc_csrbankarray_interface1_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank1_bus_errors3_w;
			end
			3'd6: begin
				vns_netsoc_csrbankarray_interface1_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank1_bus_errors2_w;
			end
			3'd7: begin
				vns_netsoc_csrbankarray_interface1_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank1_bus_errors1_w;
			end
			4'd8: begin
				vns_netsoc_csrbankarray_interface1_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank1_bus_errors0_w;
			end
		endcase
	end
	if (vns_netsoc_csrbankarray_csrbank1_scratch3_re) begin
		soc_netsoc_ctrl_storage[31:24] <= vns_netsoc_csrbankarray_csrbank1_scratch3_r;
	end
	if (vns_netsoc_csrbankarray_csrbank1_scratch2_re) begin
		soc_netsoc_ctrl_storage[23:16] <= vns_netsoc_csrbankarray_csrbank1_scratch2_r;
	end
	if (vns_netsoc_csrbankarray_csrbank1_scratch1_re) begin
		soc_netsoc_ctrl_storage[15:8] <= vns_netsoc_csrbankarray_csrbank1_scratch1_r;
	end
	if (vns_netsoc_csrbankarray_csrbank1_scratch0_re) begin
		soc_netsoc_ctrl_storage[7:0] <= vns_netsoc_csrbankarray_csrbank1_scratch0_r;
	end
	soc_netsoc_ctrl_re <= vns_netsoc_csrbankarray_csrbank1_scratch0_re;
	vns_netsoc_csrbankarray_interface2_bank_bus_dat_r <= 1'd0;
	if (vns_netsoc_csrbankarray_csrbank2_sel) begin
		case (vns_netsoc_csrbankarray_interface2_bank_bus_adr[2:0])
			1'd0: begin
				vns_netsoc_csrbankarray_interface2_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank2_half_sys8x_taps0_w;
			end
			1'd1: begin
				vns_netsoc_csrbankarray_interface2_bank_bus_dat_r <= soc_a7ddrphy_cdly_rst_w;
			end
			2'd2: begin
				vns_netsoc_csrbankarray_interface2_bank_bus_dat_r <= soc_a7ddrphy_cdly_inc_w;
			end
			2'd3: begin
				vns_netsoc_csrbankarray_interface2_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank2_dly_sel0_w;
			end
			3'd4: begin
				vns_netsoc_csrbankarray_interface2_bank_bus_dat_r <= soc_a7ddrphy_rdly_dq_rst_w;
			end
			3'd5: begin
				vns_netsoc_csrbankarray_interface2_bank_bus_dat_r <= soc_a7ddrphy_rdly_dq_inc_w;
			end
			3'd6: begin
				vns_netsoc_csrbankarray_interface2_bank_bus_dat_r <= soc_a7ddrphy_rdly_dq_bitslip_rst_w;
			end
			3'd7: begin
				vns_netsoc_csrbankarray_interface2_bank_bus_dat_r <= soc_a7ddrphy_rdly_dq_bitslip_w;
			end
		endcase
	end
	if (vns_netsoc_csrbankarray_csrbank2_half_sys8x_taps0_re) begin
		soc_a7ddrphy_half_sys8x_taps_storage[4:0] <= vns_netsoc_csrbankarray_csrbank2_half_sys8x_taps0_r;
	end
	soc_a7ddrphy_half_sys8x_taps_re <= vns_netsoc_csrbankarray_csrbank2_half_sys8x_taps0_re;
	if (vns_netsoc_csrbankarray_csrbank2_dly_sel0_re) begin
		soc_a7ddrphy_dly_sel_storage[1:0] <= vns_netsoc_csrbankarray_csrbank2_dly_sel0_r;
	end
	soc_a7ddrphy_dly_sel_re <= vns_netsoc_csrbankarray_csrbank2_dly_sel0_re;
	vns_netsoc_csrbankarray_interface3_bank_bus_dat_r <= 1'd0;
	if (vns_netsoc_csrbankarray_csrbank3_sel) begin
		case (vns_netsoc_csrbankarray_interface3_bank_bus_adr[4:0])
			1'd0: begin
				vns_netsoc_csrbankarray_interface3_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank3_sram_writer_slot_w;
			end
			1'd1: begin
				vns_netsoc_csrbankarray_interface3_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank3_sram_writer_length3_w;
			end
			2'd2: begin
				vns_netsoc_csrbankarray_interface3_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank3_sram_writer_length2_w;
			end
			2'd3: begin
				vns_netsoc_csrbankarray_interface3_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank3_sram_writer_length1_w;
			end
			3'd4: begin
				vns_netsoc_csrbankarray_interface3_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank3_sram_writer_length0_w;
			end
			3'd5: begin
				vns_netsoc_csrbankarray_interface3_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank3_sram_writer_errors3_w;
			end
			3'd6: begin
				vns_netsoc_csrbankarray_interface3_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank3_sram_writer_errors2_w;
			end
			3'd7: begin
				vns_netsoc_csrbankarray_interface3_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank3_sram_writer_errors1_w;
			end
			4'd8: begin
				vns_netsoc_csrbankarray_interface3_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank3_sram_writer_errors0_w;
			end
			4'd9: begin
				vns_netsoc_csrbankarray_interface3_bank_bus_dat_r <= soc_writer_status_w;
			end
			4'd10: begin
				vns_netsoc_csrbankarray_interface3_bank_bus_dat_r <= soc_writer_pending_w;
			end
			4'd11: begin
				vns_netsoc_csrbankarray_interface3_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank3_sram_writer_ev_enable0_w;
			end
			4'd12: begin
				vns_netsoc_csrbankarray_interface3_bank_bus_dat_r <= soc_reader_start_w;
			end
			4'd13: begin
				vns_netsoc_csrbankarray_interface3_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank3_sram_reader_ready_w;
			end
			4'd14: begin
				vns_netsoc_csrbankarray_interface3_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank3_sram_reader_level_w;
			end
			4'd15: begin
				vns_netsoc_csrbankarray_interface3_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank3_sram_reader_slot0_w;
			end
			5'd16: begin
				vns_netsoc_csrbankarray_interface3_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank3_sram_reader_length1_w;
			end
			5'd17: begin
				vns_netsoc_csrbankarray_interface3_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank3_sram_reader_length0_w;
			end
			5'd18: begin
				vns_netsoc_csrbankarray_interface3_bank_bus_dat_r <= soc_reader_eventmanager_status_w;
			end
			5'd19: begin
				vns_netsoc_csrbankarray_interface3_bank_bus_dat_r <= soc_reader_eventmanager_pending_w;
			end
			5'd20: begin
				vns_netsoc_csrbankarray_interface3_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank3_sram_reader_ev_enable0_w;
			end
			5'd21: begin
				vns_netsoc_csrbankarray_interface3_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank3_preamble_crc_w;
			end
			5'd22: begin
				vns_netsoc_csrbankarray_interface3_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank3_preamble_errors3_w;
			end
			5'd23: begin
				vns_netsoc_csrbankarray_interface3_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank3_preamble_errors2_w;
			end
			5'd24: begin
				vns_netsoc_csrbankarray_interface3_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank3_preamble_errors1_w;
			end
			5'd25: begin
				vns_netsoc_csrbankarray_interface3_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank3_preamble_errors0_w;
			end
			5'd26: begin
				vns_netsoc_csrbankarray_interface3_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank3_crc_errors3_w;
			end
			5'd27: begin
				vns_netsoc_csrbankarray_interface3_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank3_crc_errors2_w;
			end
			5'd28: begin
				vns_netsoc_csrbankarray_interface3_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank3_crc_errors1_w;
			end
			5'd29: begin
				vns_netsoc_csrbankarray_interface3_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank3_crc_errors0_w;
			end
		endcase
	end
	if (vns_netsoc_csrbankarray_csrbank3_sram_writer_ev_enable0_re) begin
		soc_writer_storage <= vns_netsoc_csrbankarray_csrbank3_sram_writer_ev_enable0_r;
	end
	soc_writer_re <= vns_netsoc_csrbankarray_csrbank3_sram_writer_ev_enable0_re;
	if (vns_netsoc_csrbankarray_csrbank3_sram_reader_slot0_re) begin
		soc_reader_slot_storage <= vns_netsoc_csrbankarray_csrbank3_sram_reader_slot0_r;
	end
	soc_reader_slot_re <= vns_netsoc_csrbankarray_csrbank3_sram_reader_slot0_re;
	if (vns_netsoc_csrbankarray_csrbank3_sram_reader_length1_re) begin
		soc_reader_length_storage[10:8] <= vns_netsoc_csrbankarray_csrbank3_sram_reader_length1_r;
	end
	if (vns_netsoc_csrbankarray_csrbank3_sram_reader_length0_re) begin
		soc_reader_length_storage[7:0] <= vns_netsoc_csrbankarray_csrbank3_sram_reader_length0_r;
	end
	soc_reader_length_re <= vns_netsoc_csrbankarray_csrbank3_sram_reader_length0_re;
	if (vns_netsoc_csrbankarray_csrbank3_sram_reader_ev_enable0_re) begin
		soc_reader_eventmanager_storage <= vns_netsoc_csrbankarray_csrbank3_sram_reader_ev_enable0_r;
	end
	soc_reader_eventmanager_re <= vns_netsoc_csrbankarray_csrbank3_sram_reader_ev_enable0_re;
	vns_netsoc_csrbankarray_interface4_bank_bus_dat_r <= 1'd0;
	if (vns_netsoc_csrbankarray_csrbank4_sel) begin
		case (vns_netsoc_csrbankarray_interface4_bank_bus_adr[1:0])
			1'd0: begin
				vns_netsoc_csrbankarray_interface4_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank4_crg_reset0_w;
			end
			1'd1: begin
				vns_netsoc_csrbankarray_interface4_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank4_mdio_w0_w;
			end
			2'd2: begin
				vns_netsoc_csrbankarray_interface4_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank4_mdio_r_w;
			end
		endcase
	end
	if (vns_netsoc_csrbankarray_csrbank4_crg_reset0_re) begin
		soc_reset_storage <= vns_netsoc_csrbankarray_csrbank4_crg_reset0_r;
	end
	soc_reset_re <= vns_netsoc_csrbankarray_csrbank4_crg_reset0_re;
	if (vns_netsoc_csrbankarray_csrbank4_mdio_w0_re) begin
		soc_storage[2:0] <= vns_netsoc_csrbankarray_csrbank4_mdio_w0_r;
	end
	soc_re <= vns_netsoc_csrbankarray_csrbank4_mdio_w0_re;
	vns_netsoc_csrbankarray_sel_r <= vns_netsoc_csrbankarray_sel;
	vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= 1'd0;
	if (vns_netsoc_csrbankarray_csrbank5_sel) begin
		case (vns_netsoc_csrbankarray_interface5_bank_bus_adr[5:0])
			1'd0: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_control0_w;
			end
			1'd1: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi0_command0_w;
			end
			2'd2: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= soc_netsoc_sdram_phaseinjector0_command_issue_w;
			end
			2'd3: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi0_address1_w;
			end
			3'd4: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi0_address0_w;
			end
			3'd5: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi0_baddress0_w;
			end
			3'd6: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata3_w;
			end
			3'd7: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata2_w;
			end
			4'd8: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata1_w;
			end
			4'd9: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata0_w;
			end
			4'd10: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi0_rddata3_w;
			end
			4'd11: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi0_rddata2_w;
			end
			4'd12: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi0_rddata1_w;
			end
			4'd13: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi0_rddata0_w;
			end
			4'd14: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi1_command0_w;
			end
			4'd15: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= soc_netsoc_sdram_phaseinjector1_command_issue_w;
			end
			5'd16: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi1_address1_w;
			end
			5'd17: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi1_address0_w;
			end
			5'd18: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi1_baddress0_w;
			end
			5'd19: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata3_w;
			end
			5'd20: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata2_w;
			end
			5'd21: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata1_w;
			end
			5'd22: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata0_w;
			end
			5'd23: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi1_rddata3_w;
			end
			5'd24: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi1_rddata2_w;
			end
			5'd25: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi1_rddata1_w;
			end
			5'd26: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi1_rddata0_w;
			end
			5'd27: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi2_command0_w;
			end
			5'd28: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= soc_netsoc_sdram_phaseinjector2_command_issue_w;
			end
			5'd29: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi2_address1_w;
			end
			5'd30: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi2_address0_w;
			end
			5'd31: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi2_baddress0_w;
			end
			6'd32: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata3_w;
			end
			6'd33: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata2_w;
			end
			6'd34: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata1_w;
			end
			6'd35: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata0_w;
			end
			6'd36: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi2_rddata3_w;
			end
			6'd37: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi2_rddata2_w;
			end
			6'd38: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi2_rddata1_w;
			end
			6'd39: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi2_rddata0_w;
			end
			6'd40: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi3_command0_w;
			end
			6'd41: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= soc_netsoc_sdram_phaseinjector3_command_issue_w;
			end
			6'd42: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi3_address1_w;
			end
			6'd43: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi3_address0_w;
			end
			6'd44: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi3_baddress0_w;
			end
			6'd45: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata3_w;
			end
			6'd46: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata2_w;
			end
			6'd47: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata1_w;
			end
			6'd48: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata0_w;
			end
			6'd49: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi3_rddata3_w;
			end
			6'd50: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi3_rddata2_w;
			end
			6'd51: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi3_rddata1_w;
			end
			6'd52: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_dfii_pi3_rddata0_w;
			end
			6'd53: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= soc_netsoc_sdram_bandwidth_update_w;
			end
			6'd54: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nreads2_w;
			end
			6'd55: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nreads1_w;
			end
			6'd56: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nreads0_w;
			end
			6'd57: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nwrites2_w;
			end
			6'd58: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nwrites1_w;
			end
			6'd59: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_nwrites0_w;
			end
			6'd60: begin
				vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank5_controller_bandwidth_data_width_w;
			end
		endcase
	end
	if (vns_netsoc_csrbankarray_csrbank5_dfii_control0_re) begin
		soc_netsoc_sdram_storage[3:0] <= vns_netsoc_csrbankarray_csrbank5_dfii_control0_r;
	end
	soc_netsoc_sdram_re <= vns_netsoc_csrbankarray_csrbank5_dfii_control0_re;
	if (vns_netsoc_csrbankarray_csrbank5_dfii_pi0_command0_re) begin
		soc_netsoc_sdram_phaseinjector0_command_storage[5:0] <= vns_netsoc_csrbankarray_csrbank5_dfii_pi0_command0_r;
	end
	soc_netsoc_sdram_phaseinjector0_command_re <= vns_netsoc_csrbankarray_csrbank5_dfii_pi0_command0_re;
	if (vns_netsoc_csrbankarray_csrbank5_dfii_pi0_address1_re) begin
		soc_netsoc_sdram_phaseinjector0_address_storage[13:8] <= vns_netsoc_csrbankarray_csrbank5_dfii_pi0_address1_r;
	end
	if (vns_netsoc_csrbankarray_csrbank5_dfii_pi0_address0_re) begin
		soc_netsoc_sdram_phaseinjector0_address_storage[7:0] <= vns_netsoc_csrbankarray_csrbank5_dfii_pi0_address0_r;
	end
	soc_netsoc_sdram_phaseinjector0_address_re <= vns_netsoc_csrbankarray_csrbank5_dfii_pi0_address0_re;
	if (vns_netsoc_csrbankarray_csrbank5_dfii_pi0_baddress0_re) begin
		soc_netsoc_sdram_phaseinjector0_baddress_storage[2:0] <= vns_netsoc_csrbankarray_csrbank5_dfii_pi0_baddress0_r;
	end
	soc_netsoc_sdram_phaseinjector0_baddress_re <= vns_netsoc_csrbankarray_csrbank5_dfii_pi0_baddress0_re;
	if (vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata3_re) begin
		soc_netsoc_sdram_phaseinjector0_wrdata_storage[31:24] <= vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata3_r;
	end
	if (vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata2_re) begin
		soc_netsoc_sdram_phaseinjector0_wrdata_storage[23:16] <= vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata2_r;
	end
	if (vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata1_re) begin
		soc_netsoc_sdram_phaseinjector0_wrdata_storage[15:8] <= vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata1_r;
	end
	if (vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata0_re) begin
		soc_netsoc_sdram_phaseinjector0_wrdata_storage[7:0] <= vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata0_r;
	end
	soc_netsoc_sdram_phaseinjector0_wrdata_re <= vns_netsoc_csrbankarray_csrbank5_dfii_pi0_wrdata0_re;
	if (vns_netsoc_csrbankarray_csrbank5_dfii_pi1_command0_re) begin
		soc_netsoc_sdram_phaseinjector1_command_storage[5:0] <= vns_netsoc_csrbankarray_csrbank5_dfii_pi1_command0_r;
	end
	soc_netsoc_sdram_phaseinjector1_command_re <= vns_netsoc_csrbankarray_csrbank5_dfii_pi1_command0_re;
	if (vns_netsoc_csrbankarray_csrbank5_dfii_pi1_address1_re) begin
		soc_netsoc_sdram_phaseinjector1_address_storage[13:8] <= vns_netsoc_csrbankarray_csrbank5_dfii_pi1_address1_r;
	end
	if (vns_netsoc_csrbankarray_csrbank5_dfii_pi1_address0_re) begin
		soc_netsoc_sdram_phaseinjector1_address_storage[7:0] <= vns_netsoc_csrbankarray_csrbank5_dfii_pi1_address0_r;
	end
	soc_netsoc_sdram_phaseinjector1_address_re <= vns_netsoc_csrbankarray_csrbank5_dfii_pi1_address0_re;
	if (vns_netsoc_csrbankarray_csrbank5_dfii_pi1_baddress0_re) begin
		soc_netsoc_sdram_phaseinjector1_baddress_storage[2:0] <= vns_netsoc_csrbankarray_csrbank5_dfii_pi1_baddress0_r;
	end
	soc_netsoc_sdram_phaseinjector1_baddress_re <= vns_netsoc_csrbankarray_csrbank5_dfii_pi1_baddress0_re;
	if (vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata3_re) begin
		soc_netsoc_sdram_phaseinjector1_wrdata_storage[31:24] <= vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata3_r;
	end
	if (vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata2_re) begin
		soc_netsoc_sdram_phaseinjector1_wrdata_storage[23:16] <= vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata2_r;
	end
	if (vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata1_re) begin
		soc_netsoc_sdram_phaseinjector1_wrdata_storage[15:8] <= vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata1_r;
	end
	if (vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata0_re) begin
		soc_netsoc_sdram_phaseinjector1_wrdata_storage[7:0] <= vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata0_r;
	end
	soc_netsoc_sdram_phaseinjector1_wrdata_re <= vns_netsoc_csrbankarray_csrbank5_dfii_pi1_wrdata0_re;
	if (vns_netsoc_csrbankarray_csrbank5_dfii_pi2_command0_re) begin
		soc_netsoc_sdram_phaseinjector2_command_storage[5:0] <= vns_netsoc_csrbankarray_csrbank5_dfii_pi2_command0_r;
	end
	soc_netsoc_sdram_phaseinjector2_command_re <= vns_netsoc_csrbankarray_csrbank5_dfii_pi2_command0_re;
	if (vns_netsoc_csrbankarray_csrbank5_dfii_pi2_address1_re) begin
		soc_netsoc_sdram_phaseinjector2_address_storage[13:8] <= vns_netsoc_csrbankarray_csrbank5_dfii_pi2_address1_r;
	end
	if (vns_netsoc_csrbankarray_csrbank5_dfii_pi2_address0_re) begin
		soc_netsoc_sdram_phaseinjector2_address_storage[7:0] <= vns_netsoc_csrbankarray_csrbank5_dfii_pi2_address0_r;
	end
	soc_netsoc_sdram_phaseinjector2_address_re <= vns_netsoc_csrbankarray_csrbank5_dfii_pi2_address0_re;
	if (vns_netsoc_csrbankarray_csrbank5_dfii_pi2_baddress0_re) begin
		soc_netsoc_sdram_phaseinjector2_baddress_storage[2:0] <= vns_netsoc_csrbankarray_csrbank5_dfii_pi2_baddress0_r;
	end
	soc_netsoc_sdram_phaseinjector2_baddress_re <= vns_netsoc_csrbankarray_csrbank5_dfii_pi2_baddress0_re;
	if (vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata3_re) begin
		soc_netsoc_sdram_phaseinjector2_wrdata_storage[31:24] <= vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata3_r;
	end
	if (vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata2_re) begin
		soc_netsoc_sdram_phaseinjector2_wrdata_storage[23:16] <= vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata2_r;
	end
	if (vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata1_re) begin
		soc_netsoc_sdram_phaseinjector2_wrdata_storage[15:8] <= vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata1_r;
	end
	if (vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata0_re) begin
		soc_netsoc_sdram_phaseinjector2_wrdata_storage[7:0] <= vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata0_r;
	end
	soc_netsoc_sdram_phaseinjector2_wrdata_re <= vns_netsoc_csrbankarray_csrbank5_dfii_pi2_wrdata0_re;
	if (vns_netsoc_csrbankarray_csrbank5_dfii_pi3_command0_re) begin
		soc_netsoc_sdram_phaseinjector3_command_storage[5:0] <= vns_netsoc_csrbankarray_csrbank5_dfii_pi3_command0_r;
	end
	soc_netsoc_sdram_phaseinjector3_command_re <= vns_netsoc_csrbankarray_csrbank5_dfii_pi3_command0_re;
	if (vns_netsoc_csrbankarray_csrbank5_dfii_pi3_address1_re) begin
		soc_netsoc_sdram_phaseinjector3_address_storage[13:8] <= vns_netsoc_csrbankarray_csrbank5_dfii_pi3_address1_r;
	end
	if (vns_netsoc_csrbankarray_csrbank5_dfii_pi3_address0_re) begin
		soc_netsoc_sdram_phaseinjector3_address_storage[7:0] <= vns_netsoc_csrbankarray_csrbank5_dfii_pi3_address0_r;
	end
	soc_netsoc_sdram_phaseinjector3_address_re <= vns_netsoc_csrbankarray_csrbank5_dfii_pi3_address0_re;
	if (vns_netsoc_csrbankarray_csrbank5_dfii_pi3_baddress0_re) begin
		soc_netsoc_sdram_phaseinjector3_baddress_storage[2:0] <= vns_netsoc_csrbankarray_csrbank5_dfii_pi3_baddress0_r;
	end
	soc_netsoc_sdram_phaseinjector3_baddress_re <= vns_netsoc_csrbankarray_csrbank5_dfii_pi3_baddress0_re;
	if (vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata3_re) begin
		soc_netsoc_sdram_phaseinjector3_wrdata_storage[31:24] <= vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata3_r;
	end
	if (vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata2_re) begin
		soc_netsoc_sdram_phaseinjector3_wrdata_storage[23:16] <= vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata2_r;
	end
	if (vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata1_re) begin
		soc_netsoc_sdram_phaseinjector3_wrdata_storage[15:8] <= vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata1_r;
	end
	if (vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata0_re) begin
		soc_netsoc_sdram_phaseinjector3_wrdata_storage[7:0] <= vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata0_r;
	end
	soc_netsoc_sdram_phaseinjector3_wrdata_re <= vns_netsoc_csrbankarray_csrbank5_dfii_pi3_wrdata0_re;
	vns_netsoc_csrbankarray_interface6_bank_bus_dat_r <= 1'd0;
	if (vns_netsoc_csrbankarray_csrbank6_sel) begin
		case (vns_netsoc_csrbankarray_interface6_bank_bus_adr[4:0])
			1'd0: begin
				vns_netsoc_csrbankarray_interface6_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank6_load3_w;
			end
			1'd1: begin
				vns_netsoc_csrbankarray_interface6_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank6_load2_w;
			end
			2'd2: begin
				vns_netsoc_csrbankarray_interface6_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank6_load1_w;
			end
			2'd3: begin
				vns_netsoc_csrbankarray_interface6_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank6_load0_w;
			end
			3'd4: begin
				vns_netsoc_csrbankarray_interface6_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank6_reload3_w;
			end
			3'd5: begin
				vns_netsoc_csrbankarray_interface6_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank6_reload2_w;
			end
			3'd6: begin
				vns_netsoc_csrbankarray_interface6_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank6_reload1_w;
			end
			3'd7: begin
				vns_netsoc_csrbankarray_interface6_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank6_reload0_w;
			end
			4'd8: begin
				vns_netsoc_csrbankarray_interface6_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank6_en0_w;
			end
			4'd9: begin
				vns_netsoc_csrbankarray_interface6_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank6_update_value0_w;
			end
			4'd10: begin
				vns_netsoc_csrbankarray_interface6_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank6_value3_w;
			end
			4'd11: begin
				vns_netsoc_csrbankarray_interface6_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank6_value2_w;
			end
			4'd12: begin
				vns_netsoc_csrbankarray_interface6_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank6_value1_w;
			end
			4'd13: begin
				vns_netsoc_csrbankarray_interface6_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank6_value0_w;
			end
			4'd14: begin
				vns_netsoc_csrbankarray_interface6_bank_bus_dat_r <= soc_netsoc_timer0_eventmanager_status_w;
			end
			4'd15: begin
				vns_netsoc_csrbankarray_interface6_bank_bus_dat_r <= soc_netsoc_timer0_eventmanager_pending_w;
			end
			5'd16: begin
				vns_netsoc_csrbankarray_interface6_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank6_ev_enable0_w;
			end
		endcase
	end
	if (vns_netsoc_csrbankarray_csrbank6_load3_re) begin
		soc_netsoc_timer0_load_storage[31:24] <= vns_netsoc_csrbankarray_csrbank6_load3_r;
	end
	if (vns_netsoc_csrbankarray_csrbank6_load2_re) begin
		soc_netsoc_timer0_load_storage[23:16] <= vns_netsoc_csrbankarray_csrbank6_load2_r;
	end
	if (vns_netsoc_csrbankarray_csrbank6_load1_re) begin
		soc_netsoc_timer0_load_storage[15:8] <= vns_netsoc_csrbankarray_csrbank6_load1_r;
	end
	if (vns_netsoc_csrbankarray_csrbank6_load0_re) begin
		soc_netsoc_timer0_load_storage[7:0] <= vns_netsoc_csrbankarray_csrbank6_load0_r;
	end
	soc_netsoc_timer0_load_re <= vns_netsoc_csrbankarray_csrbank6_load0_re;
	if (vns_netsoc_csrbankarray_csrbank6_reload3_re) begin
		soc_netsoc_timer0_reload_storage[31:24] <= vns_netsoc_csrbankarray_csrbank6_reload3_r;
	end
	if (vns_netsoc_csrbankarray_csrbank6_reload2_re) begin
		soc_netsoc_timer0_reload_storage[23:16] <= vns_netsoc_csrbankarray_csrbank6_reload2_r;
	end
	if (vns_netsoc_csrbankarray_csrbank6_reload1_re) begin
		soc_netsoc_timer0_reload_storage[15:8] <= vns_netsoc_csrbankarray_csrbank6_reload1_r;
	end
	if (vns_netsoc_csrbankarray_csrbank6_reload0_re) begin
		soc_netsoc_timer0_reload_storage[7:0] <= vns_netsoc_csrbankarray_csrbank6_reload0_r;
	end
	soc_netsoc_timer0_reload_re <= vns_netsoc_csrbankarray_csrbank6_reload0_re;
	if (vns_netsoc_csrbankarray_csrbank6_en0_re) begin
		soc_netsoc_timer0_en_storage <= vns_netsoc_csrbankarray_csrbank6_en0_r;
	end
	soc_netsoc_timer0_en_re <= vns_netsoc_csrbankarray_csrbank6_en0_re;
	if (vns_netsoc_csrbankarray_csrbank6_update_value0_re) begin
		soc_netsoc_timer0_update_value_storage <= vns_netsoc_csrbankarray_csrbank6_update_value0_r;
	end
	soc_netsoc_timer0_update_value_re <= vns_netsoc_csrbankarray_csrbank6_update_value0_re;
	if (vns_netsoc_csrbankarray_csrbank6_ev_enable0_re) begin
		soc_netsoc_timer0_eventmanager_storage <= vns_netsoc_csrbankarray_csrbank6_ev_enable0_r;
	end
	soc_netsoc_timer0_eventmanager_re <= vns_netsoc_csrbankarray_csrbank6_ev_enable0_re;
	vns_netsoc_csrbankarray_interface7_bank_bus_dat_r <= 1'd0;
	if (vns_netsoc_csrbankarray_csrbank7_sel) begin
		case (vns_netsoc_csrbankarray_interface7_bank_bus_adr[2:0])
			1'd0: begin
				vns_netsoc_csrbankarray_interface7_bank_bus_dat_r <= soc_netsoc_uart_rxtx_w;
			end
			1'd1: begin
				vns_netsoc_csrbankarray_interface7_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank7_txfull_w;
			end
			2'd2: begin
				vns_netsoc_csrbankarray_interface7_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank7_rxempty_w;
			end
			2'd3: begin
				vns_netsoc_csrbankarray_interface7_bank_bus_dat_r <= soc_netsoc_uart_eventmanager_status_w;
			end
			3'd4: begin
				vns_netsoc_csrbankarray_interface7_bank_bus_dat_r <= soc_netsoc_uart_eventmanager_pending_w;
			end
			3'd5: begin
				vns_netsoc_csrbankarray_interface7_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank7_ev_enable0_w;
			end
		endcase
	end
	if (vns_netsoc_csrbankarray_csrbank7_ev_enable0_re) begin
		soc_netsoc_uart_eventmanager_storage[1:0] <= vns_netsoc_csrbankarray_csrbank7_ev_enable0_r;
	end
	soc_netsoc_uart_eventmanager_re <= vns_netsoc_csrbankarray_csrbank7_ev_enable0_re;
	vns_netsoc_csrbankarray_interface8_bank_bus_dat_r <= 1'd0;
	if (vns_netsoc_csrbankarray_csrbank8_sel) begin
		case (vns_netsoc_csrbankarray_interface8_bank_bus_adr[1:0])
			1'd0: begin
				vns_netsoc_csrbankarray_interface8_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank8_tuning_word3_w;
			end
			1'd1: begin
				vns_netsoc_csrbankarray_interface8_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank8_tuning_word2_w;
			end
			2'd2: begin
				vns_netsoc_csrbankarray_interface8_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank8_tuning_word1_w;
			end
			2'd3: begin
				vns_netsoc_csrbankarray_interface8_bank_bus_dat_r <= vns_netsoc_csrbankarray_csrbank8_tuning_word0_w;
			end
		endcase
	end
	if (vns_netsoc_csrbankarray_csrbank8_tuning_word3_re) begin
		soc_netsoc_uart_phy_storage[31:24] <= vns_netsoc_csrbankarray_csrbank8_tuning_word3_r;
	end
	if (vns_netsoc_csrbankarray_csrbank8_tuning_word2_re) begin
		soc_netsoc_uart_phy_storage[23:16] <= vns_netsoc_csrbankarray_csrbank8_tuning_word2_r;
	end
	if (vns_netsoc_csrbankarray_csrbank8_tuning_word1_re) begin
		soc_netsoc_uart_phy_storage[15:8] <= vns_netsoc_csrbankarray_csrbank8_tuning_word1_r;
	end
	if (vns_netsoc_csrbankarray_csrbank8_tuning_word0_re) begin
		soc_netsoc_uart_phy_storage[7:0] <= vns_netsoc_csrbankarray_csrbank8_tuning_word0_r;
	end
	soc_netsoc_uart_phy_re <= vns_netsoc_csrbankarray_csrbank8_tuning_word0_re;
	if (sys_rst) begin
		soc_netsoc_ctrl_storage <= 32'd305419896;
		soc_netsoc_ctrl_re <= 1'd0;
		soc_netsoc_ctrl_bus_errors <= 32'd0;
		soc_netsoc_cpu_time_status <= 64'd0;
		soc_netsoc_cpu_time_cmp_storage <= 64'd18446744073709551615;
		soc_netsoc_cpu_time_cmp_re <= 1'd0;
		soc_netsoc_cpu_time <= 64'd0;
		soc_netsoc_cpu_time_cmp <= 64'd18446744073709551615;
		soc_netsoc_rom_bus_ack <= 1'd0;
		soc_netsoc_sram_bus_ack <= 1'd0;
		serial_tx <= 1'd1;
		soc_netsoc_uart_phy_storage <= 32'd8246337;
		soc_netsoc_uart_phy_re <= 1'd0;
		soc_netsoc_uart_phy_sink_ready <= 1'd0;
		soc_netsoc_uart_phy_uart_clk_txen <= 1'd0;
		soc_netsoc_uart_phy_phase_accumulator_tx <= 32'd0;
		soc_netsoc_uart_phy_tx_reg <= 8'd0;
		soc_netsoc_uart_phy_tx_bitcount <= 4'd0;
		soc_netsoc_uart_phy_tx_busy <= 1'd0;
		soc_netsoc_uart_phy_source_valid <= 1'd0;
		soc_netsoc_uart_phy_source_payload_data <= 8'd0;
		soc_netsoc_uart_phy_uart_clk_rxen <= 1'd0;
		soc_netsoc_uart_phy_phase_accumulator_rx <= 32'd0;
		soc_netsoc_uart_phy_rx_r <= 1'd0;
		soc_netsoc_uart_phy_rx_reg <= 8'd0;
		soc_netsoc_uart_phy_rx_bitcount <= 4'd0;
		soc_netsoc_uart_phy_rx_busy <= 1'd0;
		soc_netsoc_uart_tx_pending <= 1'd0;
		soc_netsoc_uart_tx_old_trigger <= 1'd0;
		soc_netsoc_uart_rx_pending <= 1'd0;
		soc_netsoc_uart_rx_old_trigger <= 1'd0;
		soc_netsoc_uart_eventmanager_storage <= 2'd0;
		soc_netsoc_uart_eventmanager_re <= 1'd0;
		soc_netsoc_uart_tx_fifo_readable <= 1'd0;
		soc_netsoc_uart_tx_fifo_level0 <= 5'd0;
		soc_netsoc_uart_tx_fifo_produce <= 4'd0;
		soc_netsoc_uart_tx_fifo_consume <= 4'd0;
		soc_netsoc_uart_rx_fifo_readable <= 1'd0;
		soc_netsoc_uart_rx_fifo_level0 <= 5'd0;
		soc_netsoc_uart_rx_fifo_produce <= 4'd0;
		soc_netsoc_uart_rx_fifo_consume <= 4'd0;
		soc_netsoc_timer0_load_storage <= 32'd0;
		soc_netsoc_timer0_load_re <= 1'd0;
		soc_netsoc_timer0_reload_storage <= 32'd0;
		soc_netsoc_timer0_reload_re <= 1'd0;
		soc_netsoc_timer0_en_storage <= 1'd0;
		soc_netsoc_timer0_en_re <= 1'd0;
		soc_netsoc_timer0_update_value_storage <= 1'd0;
		soc_netsoc_timer0_update_value_re <= 1'd0;
		soc_netsoc_timer0_value_status <= 32'd0;
		soc_netsoc_timer0_zero_pending <= 1'd0;
		soc_netsoc_timer0_zero_old_trigger <= 1'd0;
		soc_netsoc_timer0_eventmanager_storage <= 1'd0;
		soc_netsoc_timer0_eventmanager_re <= 1'd0;
		soc_netsoc_timer0_value <= 32'd0;
		soc_emulator_ram_bus_ack <= 1'd0;
		soc_a7ddrphy_half_sys8x_taps_storage <= 5'd8;
		soc_a7ddrphy_half_sys8x_taps_re <= 1'd0;
		soc_a7ddrphy_dly_sel_storage <= 2'd0;
		soc_a7ddrphy_dly_sel_re <= 1'd0;
		soc_a7ddrphy_dfi_p0_rddata_valid <= 1'd0;
		soc_a7ddrphy_dfi_p1_rddata_valid <= 1'd0;
		soc_a7ddrphy_dfi_p2_rddata_valid <= 1'd0;
		soc_a7ddrphy_dfi_p3_rddata_valid <= 1'd0;
		soc_a7ddrphy_oe_dqs <= 1'd0;
		soc_a7ddrphy_oe_dq <= 1'd0;
		soc_a7ddrphy_bitslip0_o <= 8'd0;
		soc_a7ddrphy_bitslip0_value <= 3'd0;
		soc_a7ddrphy_bitslip0_r <= 16'd0;
		soc_a7ddrphy_bitslip1_o <= 8'd0;
		soc_a7ddrphy_bitslip1_value <= 3'd0;
		soc_a7ddrphy_bitslip1_r <= 16'd0;
		soc_a7ddrphy_bitslip2_o <= 8'd0;
		soc_a7ddrphy_bitslip2_value <= 3'd0;
		soc_a7ddrphy_bitslip2_r <= 16'd0;
		soc_a7ddrphy_bitslip3_o <= 8'd0;
		soc_a7ddrphy_bitslip3_value <= 3'd0;
		soc_a7ddrphy_bitslip3_r <= 16'd0;
		soc_a7ddrphy_bitslip4_o <= 8'd0;
		soc_a7ddrphy_bitslip4_value <= 3'd0;
		soc_a7ddrphy_bitslip4_r <= 16'd0;
		soc_a7ddrphy_bitslip5_o <= 8'd0;
		soc_a7ddrphy_bitslip5_value <= 3'd0;
		soc_a7ddrphy_bitslip5_r <= 16'd0;
		soc_a7ddrphy_bitslip6_o <= 8'd0;
		soc_a7ddrphy_bitslip6_value <= 3'd0;
		soc_a7ddrphy_bitslip6_r <= 16'd0;
		soc_a7ddrphy_bitslip7_o <= 8'd0;
		soc_a7ddrphy_bitslip7_value <= 3'd0;
		soc_a7ddrphy_bitslip7_r <= 16'd0;
		soc_a7ddrphy_bitslip8_o <= 8'd0;
		soc_a7ddrphy_bitslip8_value <= 3'd0;
		soc_a7ddrphy_bitslip8_r <= 16'd0;
		soc_a7ddrphy_bitslip9_o <= 8'd0;
		soc_a7ddrphy_bitslip9_value <= 3'd0;
		soc_a7ddrphy_bitslip9_r <= 16'd0;
		soc_a7ddrphy_bitslip10_o <= 8'd0;
		soc_a7ddrphy_bitslip10_value <= 3'd0;
		soc_a7ddrphy_bitslip10_r <= 16'd0;
		soc_a7ddrphy_bitslip11_o <= 8'd0;
		soc_a7ddrphy_bitslip11_value <= 3'd0;
		soc_a7ddrphy_bitslip11_r <= 16'd0;
		soc_a7ddrphy_bitslip12_o <= 8'd0;
		soc_a7ddrphy_bitslip12_value <= 3'd0;
		soc_a7ddrphy_bitslip12_r <= 16'd0;
		soc_a7ddrphy_bitslip13_o <= 8'd0;
		soc_a7ddrphy_bitslip13_value <= 3'd0;
		soc_a7ddrphy_bitslip13_r <= 16'd0;
		soc_a7ddrphy_bitslip14_o <= 8'd0;
		soc_a7ddrphy_bitslip14_value <= 3'd0;
		soc_a7ddrphy_bitslip14_r <= 16'd0;
		soc_a7ddrphy_bitslip15_o <= 8'd0;
		soc_a7ddrphy_bitslip15_value <= 3'd0;
		soc_a7ddrphy_bitslip15_r <= 16'd0;
		soc_a7ddrphy_n_rddata_en0 <= 1'd0;
		soc_a7ddrphy_n_rddata_en1 <= 1'd0;
		soc_a7ddrphy_n_rddata_en2 <= 1'd0;
		soc_a7ddrphy_n_rddata_en3 <= 1'd0;
		soc_a7ddrphy_n_rddata_en4 <= 1'd0;
		soc_a7ddrphy_n_rddata_en5 <= 1'd0;
		soc_a7ddrphy_n_rddata_en6 <= 1'd0;
		soc_a7ddrphy_n_rddata_en7 <= 1'd0;
		soc_a7ddrphy_last_wrdata_en <= 4'd0;
		soc_netsoc_sdram_storage <= 4'd0;
		soc_netsoc_sdram_re <= 1'd0;
		soc_netsoc_sdram_phaseinjector0_command_storage <= 6'd0;
		soc_netsoc_sdram_phaseinjector0_command_re <= 1'd0;
		soc_netsoc_sdram_phaseinjector0_address_storage <= 14'd0;
		soc_netsoc_sdram_phaseinjector0_address_re <= 1'd0;
		soc_netsoc_sdram_phaseinjector0_baddress_storage <= 3'd0;
		soc_netsoc_sdram_phaseinjector0_baddress_re <= 1'd0;
		soc_netsoc_sdram_phaseinjector0_wrdata_storage <= 32'd0;
		soc_netsoc_sdram_phaseinjector0_wrdata_re <= 1'd0;
		soc_netsoc_sdram_phaseinjector0_status <= 32'd0;
		soc_netsoc_sdram_phaseinjector1_command_storage <= 6'd0;
		soc_netsoc_sdram_phaseinjector1_command_re <= 1'd0;
		soc_netsoc_sdram_phaseinjector1_address_storage <= 14'd0;
		soc_netsoc_sdram_phaseinjector1_address_re <= 1'd0;
		soc_netsoc_sdram_phaseinjector1_baddress_storage <= 3'd0;
		soc_netsoc_sdram_phaseinjector1_baddress_re <= 1'd0;
		soc_netsoc_sdram_phaseinjector1_wrdata_storage <= 32'd0;
		soc_netsoc_sdram_phaseinjector1_wrdata_re <= 1'd0;
		soc_netsoc_sdram_phaseinjector1_status <= 32'd0;
		soc_netsoc_sdram_phaseinjector2_command_storage <= 6'd0;
		soc_netsoc_sdram_phaseinjector2_command_re <= 1'd0;
		soc_netsoc_sdram_phaseinjector2_address_storage <= 14'd0;
		soc_netsoc_sdram_phaseinjector2_address_re <= 1'd0;
		soc_netsoc_sdram_phaseinjector2_baddress_storage <= 3'd0;
		soc_netsoc_sdram_phaseinjector2_baddress_re <= 1'd0;
		soc_netsoc_sdram_phaseinjector2_wrdata_storage <= 32'd0;
		soc_netsoc_sdram_phaseinjector2_wrdata_re <= 1'd0;
		soc_netsoc_sdram_phaseinjector2_status <= 32'd0;
		soc_netsoc_sdram_phaseinjector3_command_storage <= 6'd0;
		soc_netsoc_sdram_phaseinjector3_command_re <= 1'd0;
		soc_netsoc_sdram_phaseinjector3_address_storage <= 14'd0;
		soc_netsoc_sdram_phaseinjector3_address_re <= 1'd0;
		soc_netsoc_sdram_phaseinjector3_baddress_storage <= 3'd0;
		soc_netsoc_sdram_phaseinjector3_baddress_re <= 1'd0;
		soc_netsoc_sdram_phaseinjector3_wrdata_storage <= 32'd0;
		soc_netsoc_sdram_phaseinjector3_wrdata_re <= 1'd0;
		soc_netsoc_sdram_phaseinjector3_status <= 32'd0;
		soc_netsoc_sdram_dfi_p0_address <= 14'd0;
		soc_netsoc_sdram_dfi_p0_bank <= 3'd0;
		soc_netsoc_sdram_dfi_p0_cas_n <= 1'd1;
		soc_netsoc_sdram_dfi_p0_cs_n <= 1'd1;
		soc_netsoc_sdram_dfi_p0_ras_n <= 1'd1;
		soc_netsoc_sdram_dfi_p0_we_n <= 1'd1;
		soc_netsoc_sdram_dfi_p0_wrdata_en <= 1'd0;
		soc_netsoc_sdram_dfi_p0_rddata_en <= 1'd0;
		soc_netsoc_sdram_dfi_p1_address <= 14'd0;
		soc_netsoc_sdram_dfi_p1_bank <= 3'd0;
		soc_netsoc_sdram_dfi_p1_cas_n <= 1'd1;
		soc_netsoc_sdram_dfi_p1_cs_n <= 1'd1;
		soc_netsoc_sdram_dfi_p1_ras_n <= 1'd1;
		soc_netsoc_sdram_dfi_p1_we_n <= 1'd1;
		soc_netsoc_sdram_dfi_p1_wrdata_en <= 1'd0;
		soc_netsoc_sdram_dfi_p1_rddata_en <= 1'd0;
		soc_netsoc_sdram_dfi_p2_address <= 14'd0;
		soc_netsoc_sdram_dfi_p2_bank <= 3'd0;
		soc_netsoc_sdram_dfi_p2_cas_n <= 1'd1;
		soc_netsoc_sdram_dfi_p2_cs_n <= 1'd1;
		soc_netsoc_sdram_dfi_p2_ras_n <= 1'd1;
		soc_netsoc_sdram_dfi_p2_we_n <= 1'd1;
		soc_netsoc_sdram_dfi_p2_wrdata_en <= 1'd0;
		soc_netsoc_sdram_dfi_p2_rddata_en <= 1'd0;
		soc_netsoc_sdram_dfi_p3_address <= 14'd0;
		soc_netsoc_sdram_dfi_p3_bank <= 3'd0;
		soc_netsoc_sdram_dfi_p3_cas_n <= 1'd1;
		soc_netsoc_sdram_dfi_p3_cs_n <= 1'd1;
		soc_netsoc_sdram_dfi_p3_ras_n <= 1'd1;
		soc_netsoc_sdram_dfi_p3_we_n <= 1'd1;
		soc_netsoc_sdram_dfi_p3_wrdata_en <= 1'd0;
		soc_netsoc_sdram_dfi_p3_rddata_en <= 1'd0;
		soc_netsoc_sdram_cmd_payload_a <= 14'd0;
		soc_netsoc_sdram_cmd_payload_ba <= 3'd0;
		soc_netsoc_sdram_cmd_payload_cas <= 1'd0;
		soc_netsoc_sdram_cmd_payload_ras <= 1'd0;
		soc_netsoc_sdram_cmd_payload_we <= 1'd0;
		soc_netsoc_sdram_timer_count1 <= 9'd468;
		soc_netsoc_sdram_postponer_req_o <= 1'd0;
		soc_netsoc_sdram_postponer_count <= 1'd0;
		soc_netsoc_sdram_sequencer_done1 <= 1'd0;
		soc_netsoc_sdram_sequencer_counter <= 6'd0;
		soc_netsoc_sdram_sequencer_count <= 1'd0;
		soc_netsoc_sdram_zqcs_timer_count1 <= 26'd59999999;
		soc_netsoc_sdram_zqcs_executer_done <= 1'd0;
		soc_netsoc_sdram_zqcs_executer_counter <= 5'd0;
		soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_level <= 4'd0;
		soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_produce <= 3'd0;
		soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_consume <= 3'd0;
		soc_netsoc_sdram_bankmachine0_cmd_buffer_source_payload_we <= 1'd0;
		soc_netsoc_sdram_bankmachine0_cmd_buffer_source_payload_addr <= 21'd0;
		soc_netsoc_sdram_bankmachine0_cmd_buffer_valid_n <= 1'd0;
		soc_netsoc_sdram_bankmachine0_cmd_buffer_first_n <= 1'd0;
		soc_netsoc_sdram_bankmachine0_cmd_buffer_last_n <= 1'd0;
		soc_netsoc_sdram_bankmachine0_row <= 14'd0;
		soc_netsoc_sdram_bankmachine0_row_opened <= 1'd0;
		soc_netsoc_sdram_bankmachine0_twtpcon_ready <= 1'd1;
		soc_netsoc_sdram_bankmachine0_twtpcon_count <= 3'd0;
		soc_netsoc_sdram_bankmachine0_trccon_ready <= 1'd1;
		soc_netsoc_sdram_bankmachine0_trccon_count <= 2'd0;
		soc_netsoc_sdram_bankmachine0_trascon_ready <= 1'd1;
		soc_netsoc_sdram_bankmachine0_trascon_count <= 2'd0;
		soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_level <= 4'd0;
		soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_produce <= 3'd0;
		soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_consume <= 3'd0;
		soc_netsoc_sdram_bankmachine1_cmd_buffer_source_payload_we <= 1'd0;
		soc_netsoc_sdram_bankmachine1_cmd_buffer_source_payload_addr <= 21'd0;
		soc_netsoc_sdram_bankmachine1_cmd_buffer_valid_n <= 1'd0;
		soc_netsoc_sdram_bankmachine1_cmd_buffer_first_n <= 1'd0;
		soc_netsoc_sdram_bankmachine1_cmd_buffer_last_n <= 1'd0;
		soc_netsoc_sdram_bankmachine1_row <= 14'd0;
		soc_netsoc_sdram_bankmachine1_row_opened <= 1'd0;
		soc_netsoc_sdram_bankmachine1_twtpcon_ready <= 1'd1;
		soc_netsoc_sdram_bankmachine1_twtpcon_count <= 3'd0;
		soc_netsoc_sdram_bankmachine1_trccon_ready <= 1'd1;
		soc_netsoc_sdram_bankmachine1_trccon_count <= 2'd0;
		soc_netsoc_sdram_bankmachine1_trascon_ready <= 1'd1;
		soc_netsoc_sdram_bankmachine1_trascon_count <= 2'd0;
		soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_level <= 4'd0;
		soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_produce <= 3'd0;
		soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_consume <= 3'd0;
		soc_netsoc_sdram_bankmachine2_cmd_buffer_source_payload_we <= 1'd0;
		soc_netsoc_sdram_bankmachine2_cmd_buffer_source_payload_addr <= 21'd0;
		soc_netsoc_sdram_bankmachine2_cmd_buffer_valid_n <= 1'd0;
		soc_netsoc_sdram_bankmachine2_cmd_buffer_first_n <= 1'd0;
		soc_netsoc_sdram_bankmachine2_cmd_buffer_last_n <= 1'd0;
		soc_netsoc_sdram_bankmachine2_row <= 14'd0;
		soc_netsoc_sdram_bankmachine2_row_opened <= 1'd0;
		soc_netsoc_sdram_bankmachine2_twtpcon_ready <= 1'd1;
		soc_netsoc_sdram_bankmachine2_twtpcon_count <= 3'd0;
		soc_netsoc_sdram_bankmachine2_trccon_ready <= 1'd1;
		soc_netsoc_sdram_bankmachine2_trccon_count <= 2'd0;
		soc_netsoc_sdram_bankmachine2_trascon_ready <= 1'd1;
		soc_netsoc_sdram_bankmachine2_trascon_count <= 2'd0;
		soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_level <= 4'd0;
		soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_produce <= 3'd0;
		soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_consume <= 3'd0;
		soc_netsoc_sdram_bankmachine3_cmd_buffer_source_payload_we <= 1'd0;
		soc_netsoc_sdram_bankmachine3_cmd_buffer_source_payload_addr <= 21'd0;
		soc_netsoc_sdram_bankmachine3_cmd_buffer_valid_n <= 1'd0;
		soc_netsoc_sdram_bankmachine3_cmd_buffer_first_n <= 1'd0;
		soc_netsoc_sdram_bankmachine3_cmd_buffer_last_n <= 1'd0;
		soc_netsoc_sdram_bankmachine3_row <= 14'd0;
		soc_netsoc_sdram_bankmachine3_row_opened <= 1'd0;
		soc_netsoc_sdram_bankmachine3_twtpcon_ready <= 1'd1;
		soc_netsoc_sdram_bankmachine3_twtpcon_count <= 3'd0;
		soc_netsoc_sdram_bankmachine3_trccon_ready <= 1'd1;
		soc_netsoc_sdram_bankmachine3_trccon_count <= 2'd0;
		soc_netsoc_sdram_bankmachine3_trascon_ready <= 1'd1;
		soc_netsoc_sdram_bankmachine3_trascon_count <= 2'd0;
		soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_level <= 4'd0;
		soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_produce <= 3'd0;
		soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_consume <= 3'd0;
		soc_netsoc_sdram_bankmachine4_cmd_buffer_source_payload_we <= 1'd0;
		soc_netsoc_sdram_bankmachine4_cmd_buffer_source_payload_addr <= 21'd0;
		soc_netsoc_sdram_bankmachine4_cmd_buffer_valid_n <= 1'd0;
		soc_netsoc_sdram_bankmachine4_cmd_buffer_first_n <= 1'd0;
		soc_netsoc_sdram_bankmachine4_cmd_buffer_last_n <= 1'd0;
		soc_netsoc_sdram_bankmachine4_row <= 14'd0;
		soc_netsoc_sdram_bankmachine4_row_opened <= 1'd0;
		soc_netsoc_sdram_bankmachine4_twtpcon_ready <= 1'd1;
		soc_netsoc_sdram_bankmachine4_twtpcon_count <= 3'd0;
		soc_netsoc_sdram_bankmachine4_trccon_ready <= 1'd1;
		soc_netsoc_sdram_bankmachine4_trccon_count <= 2'd0;
		soc_netsoc_sdram_bankmachine4_trascon_ready <= 1'd1;
		soc_netsoc_sdram_bankmachine4_trascon_count <= 2'd0;
		soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_level <= 4'd0;
		soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_produce <= 3'd0;
		soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_consume <= 3'd0;
		soc_netsoc_sdram_bankmachine5_cmd_buffer_source_payload_we <= 1'd0;
		soc_netsoc_sdram_bankmachine5_cmd_buffer_source_payload_addr <= 21'd0;
		soc_netsoc_sdram_bankmachine5_cmd_buffer_valid_n <= 1'd0;
		soc_netsoc_sdram_bankmachine5_cmd_buffer_first_n <= 1'd0;
		soc_netsoc_sdram_bankmachine5_cmd_buffer_last_n <= 1'd0;
		soc_netsoc_sdram_bankmachine5_row <= 14'd0;
		soc_netsoc_sdram_bankmachine5_row_opened <= 1'd0;
		soc_netsoc_sdram_bankmachine5_twtpcon_ready <= 1'd1;
		soc_netsoc_sdram_bankmachine5_twtpcon_count <= 3'd0;
		soc_netsoc_sdram_bankmachine5_trccon_ready <= 1'd1;
		soc_netsoc_sdram_bankmachine5_trccon_count <= 2'd0;
		soc_netsoc_sdram_bankmachine5_trascon_ready <= 1'd1;
		soc_netsoc_sdram_bankmachine5_trascon_count <= 2'd0;
		soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_level <= 4'd0;
		soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_produce <= 3'd0;
		soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_consume <= 3'd0;
		soc_netsoc_sdram_bankmachine6_cmd_buffer_source_payload_we <= 1'd0;
		soc_netsoc_sdram_bankmachine6_cmd_buffer_source_payload_addr <= 21'd0;
		soc_netsoc_sdram_bankmachine6_cmd_buffer_valid_n <= 1'd0;
		soc_netsoc_sdram_bankmachine6_cmd_buffer_first_n <= 1'd0;
		soc_netsoc_sdram_bankmachine6_cmd_buffer_last_n <= 1'd0;
		soc_netsoc_sdram_bankmachine6_row <= 14'd0;
		soc_netsoc_sdram_bankmachine6_row_opened <= 1'd0;
		soc_netsoc_sdram_bankmachine6_twtpcon_ready <= 1'd1;
		soc_netsoc_sdram_bankmachine6_twtpcon_count <= 3'd0;
		soc_netsoc_sdram_bankmachine6_trccon_ready <= 1'd1;
		soc_netsoc_sdram_bankmachine6_trccon_count <= 2'd0;
		soc_netsoc_sdram_bankmachine6_trascon_ready <= 1'd1;
		soc_netsoc_sdram_bankmachine6_trascon_count <= 2'd0;
		soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_level <= 4'd0;
		soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_produce <= 3'd0;
		soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_consume <= 3'd0;
		soc_netsoc_sdram_bankmachine7_cmd_buffer_source_payload_we <= 1'd0;
		soc_netsoc_sdram_bankmachine7_cmd_buffer_source_payload_addr <= 21'd0;
		soc_netsoc_sdram_bankmachine7_cmd_buffer_valid_n <= 1'd0;
		soc_netsoc_sdram_bankmachine7_cmd_buffer_first_n <= 1'd0;
		soc_netsoc_sdram_bankmachine7_cmd_buffer_last_n <= 1'd0;
		soc_netsoc_sdram_bankmachine7_row <= 14'd0;
		soc_netsoc_sdram_bankmachine7_row_opened <= 1'd0;
		soc_netsoc_sdram_bankmachine7_twtpcon_ready <= 1'd1;
		soc_netsoc_sdram_bankmachine7_twtpcon_count <= 3'd0;
		soc_netsoc_sdram_bankmachine7_trccon_ready <= 1'd1;
		soc_netsoc_sdram_bankmachine7_trccon_count <= 2'd0;
		soc_netsoc_sdram_bankmachine7_trascon_ready <= 1'd1;
		soc_netsoc_sdram_bankmachine7_trascon_count <= 2'd0;
		soc_netsoc_sdram_choose_cmd_grant <= 3'd0;
		soc_netsoc_sdram_choose_req_grant <= 3'd0;
		soc_netsoc_sdram_trrdcon_ready <= 1'd1;
		soc_netsoc_sdram_trrdcon_count <= 1'd0;
		soc_netsoc_sdram_tfawcon_ready <= 1'd1;
		soc_netsoc_sdram_tfawcon_window <= 4'd0;
		soc_netsoc_sdram_tccdcon_ready <= 1'd1;
		soc_netsoc_sdram_tccdcon_count <= 1'd0;
		soc_netsoc_sdram_twtrcon_ready <= 1'd1;
		soc_netsoc_sdram_twtrcon_count <= 3'd0;
		soc_netsoc_sdram_time0 <= 5'd0;
		soc_netsoc_sdram_time1 <= 4'd0;
		soc_netsoc_sdram_bandwidth_nreads_status <= 24'd0;
		soc_netsoc_sdram_bandwidth_nwrites_status <= 24'd0;
		soc_netsoc_sdram_bandwidth_cmd_valid <= 1'd0;
		soc_netsoc_sdram_bandwidth_cmd_ready <= 1'd0;
		soc_netsoc_sdram_bandwidth_cmd_is_read <= 1'd0;
		soc_netsoc_sdram_bandwidth_cmd_is_write <= 1'd0;
		soc_netsoc_sdram_bandwidth_counter <= 24'd0;
		soc_netsoc_sdram_bandwidth_period <= 1'd0;
		soc_netsoc_sdram_bandwidth_nreads <= 24'd0;
		soc_netsoc_sdram_bandwidth_nwrites <= 24'd0;
		soc_netsoc_sdram_bandwidth_nreads_r <= 24'd0;
		soc_netsoc_sdram_bandwidth_nwrites_r <= 24'd0;
		soc_netsoc_adr_offset_r <= 2'd0;
		soc_netsoc_count <= 1'd0;
		soc_reset_storage <= 1'd0;
		soc_reset_re <= 1'd0;
		soc_counter <= 9'd0;
		soc_storage <= 3'd0;
		soc_re <= 1'd0;
		soc_preamble_errors_status <= 32'd0;
		soc_crc_errors_status <= 32'd0;
		soc_tx_cdc_graycounter0_q <= 7'd0;
		soc_tx_cdc_graycounter0_q_binary <= 7'd0;
		soc_rx_cdc_graycounter1_q <= 7'd0;
		soc_rx_cdc_graycounter1_q_binary <= 7'd0;
		soc_writer_errors_status <= 32'd0;
		soc_writer_storage <= 1'd0;
		soc_writer_re <= 1'd0;
		soc_writer_counter <= 32'd0;
		soc_writer_slot <= 1'd0;
		soc_writer_fifo_level <= 2'd0;
		soc_writer_fifo_produce <= 1'd0;
		soc_writer_fifo_consume <= 1'd0;
		soc_reader_slot_storage <= 1'd0;
		soc_reader_slot_re <= 1'd0;
		soc_reader_length_storage <= 11'd0;
		soc_reader_length_re <= 1'd0;
		soc_reader_done_pending <= 1'd0;
		soc_reader_eventmanager_storage <= 1'd0;
		soc_reader_eventmanager_re <= 1'd0;
		soc_reader_fifo_level <= 2'd0;
		soc_reader_fifo_produce <= 1'd0;
		soc_reader_fifo_consume <= 1'd0;
		soc_reader_counter <= 11'd0;
		soc_reader_last_d <= 1'd0;
		soc_sram0_bus_ack0 <= 1'd0;
		soc_sram1_bus_ack0 <= 1'd0;
		soc_sram0_bus_ack1 <= 1'd0;
		soc_sram1_bus_ack1 <= 1'd0;
		soc_slave_sel_r <= 4'd0;
		vns_wb2csr_state <= 1'd0;
		vns_refresher_state <= 2'd0;
		vns_bankmachine0_state <= 3'd0;
		vns_bankmachine1_state <= 3'd0;
		vns_bankmachine2_state <= 3'd0;
		vns_bankmachine3_state <= 3'd0;
		vns_bankmachine4_state <= 3'd0;
		vns_bankmachine5_state <= 3'd0;
		vns_bankmachine6_state <= 3'd0;
		vns_bankmachine7_state <= 3'd0;
		vns_multiplexer_state <= 4'd0;
		vns_rbank <= 3'd0;
		vns_wbank <= 3'd0;
		vns_new_master_wdata_ready0 <= 1'd0;
		vns_new_master_wdata_ready1 <= 1'd0;
		vns_new_master_wdata_ready2 <= 1'd0;
		vns_new_master_rdata_valid0 <= 1'd0;
		vns_new_master_rdata_valid1 <= 1'd0;
		vns_new_master_rdata_valid2 <= 1'd0;
		vns_new_master_rdata_valid3 <= 1'd0;
		vns_new_master_rdata_valid4 <= 1'd0;
		vns_new_master_rdata_valid5 <= 1'd0;
		vns_new_master_rdata_valid6 <= 1'd0;
		vns_new_master_rdata_valid7 <= 1'd0;
		vns_new_master_rdata_valid8 <= 1'd0;
		vns_new_master_rdata_valid9 <= 1'd0;
		vns_fullmemorywe_state <= 3'd0;
		vns_litedramwishbone2native_state <= 2'd0;
		vns_liteethmacsramwriter_state <= 3'd0;
		vns_liteethmacsramreader_state <= 2'd0;
		vns_netsoc_grant <= 1'd0;
		vns_netsoc_slave_sel_r <= 6'd0;
		vns_netsoc_count <= 20'd1000000;
		vns_netsoc_csrbankarray_interface0_bank_bus_dat_r <= 8'd0;
		vns_netsoc_csrbankarray_interface1_bank_bus_dat_r <= 8'd0;
		vns_netsoc_csrbankarray_interface2_bank_bus_dat_r <= 8'd0;
		vns_netsoc_csrbankarray_interface3_bank_bus_dat_r <= 8'd0;
		vns_netsoc_csrbankarray_interface4_bank_bus_dat_r <= 8'd0;
		vns_netsoc_csrbankarray_sel_r <= 1'd0;
		vns_netsoc_csrbankarray_interface5_bank_bus_dat_r <= 8'd0;
		vns_netsoc_csrbankarray_interface6_bank_bus_dat_r <= 8'd0;
		vns_netsoc_csrbankarray_interface7_bank_bus_dat_r <= 8'd0;
		vns_netsoc_csrbankarray_interface8_bank_bus_dat_r <= 8'd0;
	end
	vns_xilinxmultiregimpl0_regs0 <= serial_rx;
	vns_xilinxmultiregimpl0_regs1 <= vns_xilinxmultiregimpl0_regs0;
	vns_xilinxmultiregimpl1_regs0 <= soc_data_r;
	vns_xilinxmultiregimpl1_regs1 <= vns_xilinxmultiregimpl1_regs0;
	vns_xilinxmultiregimpl2_regs0 <= soc_ps_preamble_error_toggle_i;
	vns_xilinxmultiregimpl2_regs1 <= vns_xilinxmultiregimpl2_regs0;
	vns_xilinxmultiregimpl3_regs0 <= soc_ps_crc_error_toggle_i;
	vns_xilinxmultiregimpl3_regs1 <= vns_xilinxmultiregimpl3_regs0;
	vns_xilinxmultiregimpl5_regs0 <= soc_tx_cdc_graycounter1_q;
	vns_xilinxmultiregimpl5_regs1 <= vns_xilinxmultiregimpl5_regs0;
	vns_xilinxmultiregimpl6_regs0 <= soc_rx_cdc_graycounter0_q;
	vns_xilinxmultiregimpl6_regs1 <= vns_xilinxmultiregimpl6_regs0;
end
reg [31:0] mem[0:16383];
reg [31:0] memdat;
always @(posedge sys_clk) begin
	memdat <= mem[soc_netsoc_rom_adr];
end
assign soc_netsoc_rom_dat_r = memdat;
initial begin
	$readmemh("mem.init", mem);
end
reg [31:0] mem_1[0:8191];
reg [12:0] memadr;
always @(posedge sys_clk) begin
	if (soc_netsoc_sram_we[0])
		mem_1[soc_netsoc_sram_adr][7:0] <= soc_netsoc_sram_dat_w[7:0];
	if (soc_netsoc_sram_we[1])
		mem_1[soc_netsoc_sram_adr][15:8] <= soc_netsoc_sram_dat_w[15:8];
	if (soc_netsoc_sram_we[2])
		mem_1[soc_netsoc_sram_adr][23:16] <= soc_netsoc_sram_dat_w[23:16];
	if (soc_netsoc_sram_we[3])
		mem_1[soc_netsoc_sram_adr][31:24] <= soc_netsoc_sram_dat_w[31:24];
	memadr <= soc_netsoc_sram_adr;
end
assign soc_netsoc_sram_dat_r = mem_1[memadr];
initial begin
	$readmemh("mem_1.init", mem_1);
end
reg [9:0] storage[0:15];
reg [9:0] memdat_1;
reg [9:0] memdat_2;
always @(posedge sys_clk) begin
	if (soc_netsoc_uart_tx_fifo_wrport_we)
		storage[soc_netsoc_uart_tx_fifo_wrport_adr] <= soc_netsoc_uart_tx_fifo_wrport_dat_w;
	memdat_1 <= storage[soc_netsoc_uart_tx_fifo_wrport_adr];
end
always @(posedge sys_clk) begin
	if (soc_netsoc_uart_tx_fifo_rdport_re)
		memdat_2 <= storage[soc_netsoc_uart_tx_fifo_rdport_adr];
end
assign soc_netsoc_uart_tx_fifo_wrport_dat_r = memdat_1;
assign soc_netsoc_uart_tx_fifo_rdport_dat_r = memdat_2;
reg [9:0] storage_1[0:15];
reg [9:0] memdat_3;
reg [9:0] memdat_4;
always @(posedge sys_clk) begin
	if (soc_netsoc_uart_rx_fifo_wrport_we)
		storage_1[soc_netsoc_uart_rx_fifo_wrport_adr] <= soc_netsoc_uart_rx_fifo_wrport_dat_w;
	memdat_3 <= storage_1[soc_netsoc_uart_rx_fifo_wrport_adr];
end
always @(posedge sys_clk) begin
	if (soc_netsoc_uart_rx_fifo_rdport_re)
		memdat_4 <= storage_1[soc_netsoc_uart_rx_fifo_rdport_adr];
end
assign soc_netsoc_uart_rx_fifo_wrport_dat_r = memdat_3;
assign soc_netsoc_uart_rx_fifo_rdport_dat_r = memdat_4;
reg [7:0] mem_2[0:6];
reg [2:0] memadr_1;
always @(posedge sys_clk) begin
	memadr_1 <= vns_netsoc_csrbankarray_adr;
end
assign vns_netsoc_csrbankarray_dat_r = mem_2[memadr_1];
initial begin
	$readmemh("mem_2.init", mem_2);
end
PLLE2_ADV #(
	.CLKFBOUT_MULT(4'd12),
	.CLKIN1_PERIOD(10.0),
	.CLKOUT0_DIVIDE(5'd20),
	.CLKOUT0_PHASE(1'd0),
	.CLKOUT1_DIVIDE(3'd5),
	.CLKOUT1_PHASE(1'd0),
	.CLKOUT2_DIVIDE(3'd5),
	.CLKOUT2_PHASE(7'd90),
	.CLKOUT3_DIVIDE(3'd6),
	.CLKOUT3_PHASE(1'd0),
	.CLKOUT4_DIVIDE(6'd48),
	.CLKOUT5_PHASE(1'd0),
	.DIVCLK_DIVIDE(1'd1),
	.REF_JITTER1(0.01),
	.STARTUP_WAIT("FALSE")
) PLLE2_ADV (
	.CLKFBIN(soc_pll_fb),
	.CLKIN1(soc_clk100bg),
	.CLKFBOUT(soc_pll_fb),
	.CLKOUT0(soc_pll_sys),
	.CLKOUT1(soc_pll_sys4x),
	.CLKOUT2(soc_pll_sys4x_dqs),
	.CLKOUT3(soc_pll_clk200),
	.CLKOUT4(soc_pll_clk100),
	.LOCKED(soc_pll_locked)
);
wire clk100_ibuf;
IBUF clkbuf(.I(clk100), .O(clk100_ibuf));
BUFG BUFG(
	.I(clk100_ibuf),
	.O(soc_clk100bg)
);
BUFG BUFG_1(
	.I(soc_pll_sys),
	.O(sys_clk)
);
BUFG BUFG_2(
	.I(soc_pll_sys4x),
	.O(sys4x_clk)
);
BUFG BUFG_3(
	.I(soc_pll_sys4x_dqs),
	.O(sys4x_dqs_clk)
);
BUFG BUFG_4(
	.I(soc_pll_clk200),
	.O(clk200_clk)
);
BUFG BUFG_5(
	.I(soc_pll_clk100),
	.O(eth_ref_clk_obuf)
);
wire eth_ref_clk_obuf;
OBUF clk_eth_buf(.I(eth_ref_clk_obuf), .O(eth_ref_clk));
IDELAYCTRL IDELAYCTRL(
	.REFCLK(clk200_clk),
	.RST(soc_ic_reset),
	.RDY(idelayctl_rdy)
);
reg [31:0] mem_3[0:4095];
reg [11:0] memadr_2;
always @(posedge sys_clk) begin
	if (soc_emulator_ram_we[0])
		mem_3[soc_emulator_ram_adr][7:0] <= soc_emulator_ram_dat_w[7:0];
	if (soc_emulator_ram_we[1])
		mem_3[soc_emulator_ram_adr][15:8] <= soc_emulator_ram_dat_w[15:8];
	if (soc_emulator_ram_we[2])
		mem_3[soc_emulator_ram_adr][23:16] <= soc_emulator_ram_dat_w[23:16];
	if (soc_emulator_ram_we[3])
		mem_3[soc_emulator_ram_adr][31:24] <= soc_emulator_ram_dat_w[31:24];
	memadr_2 <= soc_emulator_ram_adr;
end
assign soc_emulator_ram_dat_r = mem_3[memadr_2];
wire tq;
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
	.OQ(soc_a7ddrphy_sd_clk_se_nodelay),
	.TQ(tq),
	.TCE(1'd1),
	.T1(1'b0)
);
OBUFTDS OBUFTDS_0(
	.I(soc_a7ddrphy_sd_clk_se_nodelay),
	.O(ddram_clk_p),
	.OB(ddram_clk_n),
	.T(tq)
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
	.D1(soc_a7ddrphy_dfi_p0_address[0]),
	.D2(soc_a7ddrphy_dfi_p0_address[0]),
	.D3(soc_a7ddrphy_dfi_p1_address[0]),
	.D4(soc_a7ddrphy_dfi_p1_address[0]),
	.D5(soc_a7ddrphy_dfi_p2_address[0]),
	.D6(soc_a7ddrphy_dfi_p2_address[0]),
	.D7(soc_a7ddrphy_dfi_p3_address[0]),
	.D8(soc_a7ddrphy_dfi_p3_address[0]),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_a_iob[0])
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
	.D1(soc_a7ddrphy_dfi_p0_address[1]),
	.D2(soc_a7ddrphy_dfi_p0_address[1]),
	.D3(soc_a7ddrphy_dfi_p1_address[1]),
	.D4(soc_a7ddrphy_dfi_p1_address[1]),
	.D5(soc_a7ddrphy_dfi_p2_address[1]),
	.D6(soc_a7ddrphy_dfi_p2_address[1]),
	.D7(soc_a7ddrphy_dfi_p3_address[1]),
	.D8(soc_a7ddrphy_dfi_p3_address[1]),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_a_iob[1])
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
	.D1(soc_a7ddrphy_dfi_p0_address[2]),
	.D2(soc_a7ddrphy_dfi_p0_address[2]),
	.D3(soc_a7ddrphy_dfi_p1_address[2]),
	.D4(soc_a7ddrphy_dfi_p1_address[2]),
	.D5(soc_a7ddrphy_dfi_p2_address[2]),
	.D6(soc_a7ddrphy_dfi_p2_address[2]),
	.D7(soc_a7ddrphy_dfi_p3_address[2]),
	.D8(soc_a7ddrphy_dfi_p3_address[2]),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_a_iob[2])
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
	.D1(soc_a7ddrphy_dfi_p0_address[3]),
	.D2(soc_a7ddrphy_dfi_p0_address[3]),
	.D3(soc_a7ddrphy_dfi_p1_address[3]),
	.D4(soc_a7ddrphy_dfi_p1_address[3]),
	.D5(soc_a7ddrphy_dfi_p2_address[3]),
	.D6(soc_a7ddrphy_dfi_p2_address[3]),
	.D7(soc_a7ddrphy_dfi_p3_address[3]),
	.D8(soc_a7ddrphy_dfi_p3_address[3]),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_a_iob[3])
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
	.D1(soc_a7ddrphy_dfi_p0_address[4]),
	.D2(soc_a7ddrphy_dfi_p0_address[4]),
	.D3(soc_a7ddrphy_dfi_p1_address[4]),
	.D4(soc_a7ddrphy_dfi_p1_address[4]),
	.D5(soc_a7ddrphy_dfi_p2_address[4]),
	.D6(soc_a7ddrphy_dfi_p2_address[4]),
	.D7(soc_a7ddrphy_dfi_p3_address[4]),
	.D8(soc_a7ddrphy_dfi_p3_address[4]),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_a_iob[4])
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
	.D1(soc_a7ddrphy_dfi_p0_address[5]),
	.D2(soc_a7ddrphy_dfi_p0_address[5]),
	.D3(soc_a7ddrphy_dfi_p1_address[5]),
	.D4(soc_a7ddrphy_dfi_p1_address[5]),
	.D5(soc_a7ddrphy_dfi_p2_address[5]),
	.D6(soc_a7ddrphy_dfi_p2_address[5]),
	.D7(soc_a7ddrphy_dfi_p3_address[5]),
	.D8(soc_a7ddrphy_dfi_p3_address[5]),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_a_iob[5])
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
	.D1(soc_a7ddrphy_dfi_p0_address[6]),
	.D2(soc_a7ddrphy_dfi_p0_address[6]),
	.D3(soc_a7ddrphy_dfi_p1_address[6]),
	.D4(soc_a7ddrphy_dfi_p1_address[6]),
	.D5(soc_a7ddrphy_dfi_p2_address[6]),
	.D6(soc_a7ddrphy_dfi_p2_address[6]),
	.D7(soc_a7ddrphy_dfi_p3_address[6]),
	.D8(soc_a7ddrphy_dfi_p3_address[6]),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_a_iob[6])
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
	.D1(soc_a7ddrphy_dfi_p0_address[7]),
	.D2(soc_a7ddrphy_dfi_p0_address[7]),
	.D3(soc_a7ddrphy_dfi_p1_address[7]),
	.D4(soc_a7ddrphy_dfi_p1_address[7]),
	.D5(soc_a7ddrphy_dfi_p2_address[7]),
	.D6(soc_a7ddrphy_dfi_p2_address[7]),
	.D7(soc_a7ddrphy_dfi_p3_address[7]),
	.D8(soc_a7ddrphy_dfi_p3_address[7]),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_a_iob[7])
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
	.D1(soc_a7ddrphy_dfi_p0_address[8]),
	.D2(soc_a7ddrphy_dfi_p0_address[8]),
	.D3(soc_a7ddrphy_dfi_p1_address[8]),
	.D4(soc_a7ddrphy_dfi_p1_address[8]),
	.D5(soc_a7ddrphy_dfi_p2_address[8]),
	.D6(soc_a7ddrphy_dfi_p2_address[8]),
	.D7(soc_a7ddrphy_dfi_p3_address[8]),
	.D8(soc_a7ddrphy_dfi_p3_address[8]),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_a_iob[8])
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
	.D1(soc_a7ddrphy_dfi_p0_address[9]),
	.D2(soc_a7ddrphy_dfi_p0_address[9]),
	.D3(soc_a7ddrphy_dfi_p1_address[9]),
	.D4(soc_a7ddrphy_dfi_p1_address[9]),
	.D5(soc_a7ddrphy_dfi_p2_address[9]),
	.D6(soc_a7ddrphy_dfi_p2_address[9]),
	.D7(soc_a7ddrphy_dfi_p3_address[9]),
	.D8(soc_a7ddrphy_dfi_p3_address[9]),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_a_iob[9])
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
	.D1(soc_a7ddrphy_dfi_p0_address[10]),
	.D2(soc_a7ddrphy_dfi_p0_address[10]),
	.D3(soc_a7ddrphy_dfi_p1_address[10]),
	.D4(soc_a7ddrphy_dfi_p1_address[10]),
	.D5(soc_a7ddrphy_dfi_p2_address[10]),
	.D6(soc_a7ddrphy_dfi_p2_address[10]),
	.D7(soc_a7ddrphy_dfi_p3_address[10]),
	.D8(soc_a7ddrphy_dfi_p3_address[10]),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_a_iob[10])
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
	.D1(soc_a7ddrphy_dfi_p0_address[11]),
	.D2(soc_a7ddrphy_dfi_p0_address[11]),
	.D3(soc_a7ddrphy_dfi_p1_address[11]),
	.D4(soc_a7ddrphy_dfi_p1_address[11]),
	.D5(soc_a7ddrphy_dfi_p2_address[11]),
	.D6(soc_a7ddrphy_dfi_p2_address[11]),
	.D7(soc_a7ddrphy_dfi_p3_address[11]),
	.D8(soc_a7ddrphy_dfi_p3_address[11]),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_a_iob[11])
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
	.D1(soc_a7ddrphy_dfi_p0_address[12]),
	.D2(soc_a7ddrphy_dfi_p0_address[12]),
	.D3(soc_a7ddrphy_dfi_p1_address[12]),
	.D4(soc_a7ddrphy_dfi_p1_address[12]),
	.D5(soc_a7ddrphy_dfi_p2_address[12]),
	.D6(soc_a7ddrphy_dfi_p2_address[12]),
	.D7(soc_a7ddrphy_dfi_p3_address[12]),
	.D8(soc_a7ddrphy_dfi_p3_address[12]),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_a_iob[12])
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
	.D1(soc_a7ddrphy_dfi_p0_address[13]),
	.D2(soc_a7ddrphy_dfi_p0_address[13]),
	.D3(soc_a7ddrphy_dfi_p1_address[13]),
	.D4(soc_a7ddrphy_dfi_p1_address[13]),
	.D5(soc_a7ddrphy_dfi_p2_address[13]),
	.D6(soc_a7ddrphy_dfi_p2_address[13]),
	.D7(soc_a7ddrphy_dfi_p3_address[13]),
	.D8(soc_a7ddrphy_dfi_p3_address[13]),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_a_iob[13])
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
	.D1(soc_a7ddrphy_dfi_p0_bank[0]),
	.D2(soc_a7ddrphy_dfi_p0_bank[0]),
	.D3(soc_a7ddrphy_dfi_p1_bank[0]),
	.D4(soc_a7ddrphy_dfi_p1_bank[0]),
	.D5(soc_a7ddrphy_dfi_p2_bank[0]),
	.D6(soc_a7ddrphy_dfi_p2_bank[0]),
	.D7(soc_a7ddrphy_dfi_p3_bank[0]),
	.D8(soc_a7ddrphy_dfi_p3_bank[0]),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_ba_iob[0])
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
	.D1(soc_a7ddrphy_dfi_p0_bank[1]),
	.D2(soc_a7ddrphy_dfi_p0_bank[1]),
	.D3(soc_a7ddrphy_dfi_p1_bank[1]),
	.D4(soc_a7ddrphy_dfi_p1_bank[1]),
	.D5(soc_a7ddrphy_dfi_p2_bank[1]),
	.D6(soc_a7ddrphy_dfi_p2_bank[1]),
	.D7(soc_a7ddrphy_dfi_p3_bank[1]),
	.D8(soc_a7ddrphy_dfi_p3_bank[1]),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_ba_iob[1])
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
	.D1(soc_a7ddrphy_dfi_p0_bank[2]),
	.D2(soc_a7ddrphy_dfi_p0_bank[2]),
	.D3(soc_a7ddrphy_dfi_p1_bank[2]),
	.D4(soc_a7ddrphy_dfi_p1_bank[2]),
	.D5(soc_a7ddrphy_dfi_p2_bank[2]),
	.D6(soc_a7ddrphy_dfi_p2_bank[2]),
	.D7(soc_a7ddrphy_dfi_p3_bank[2]),
	.D8(soc_a7ddrphy_dfi_p3_bank[2]),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_ba_iob[2])
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
	.D1(soc_a7ddrphy_dfi_p0_ras_n),
	.D2(soc_a7ddrphy_dfi_p0_ras_n),
	.D3(soc_a7ddrphy_dfi_p1_ras_n),
	.D4(soc_a7ddrphy_dfi_p1_ras_n),
	.D5(soc_a7ddrphy_dfi_p2_ras_n),
	.D6(soc_a7ddrphy_dfi_p2_ras_n),
	.D7(soc_a7ddrphy_dfi_p3_ras_n),
	.D8(soc_a7ddrphy_dfi_p3_ras_n),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_ras_n_iob)
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
	.D1(soc_a7ddrphy_dfi_p0_cas_n),
	.D2(soc_a7ddrphy_dfi_p0_cas_n),
	.D3(soc_a7ddrphy_dfi_p1_cas_n),
	.D4(soc_a7ddrphy_dfi_p1_cas_n),
	.D5(soc_a7ddrphy_dfi_p2_cas_n),
	.D6(soc_a7ddrphy_dfi_p2_cas_n),
	.D7(soc_a7ddrphy_dfi_p3_cas_n),
	.D8(soc_a7ddrphy_dfi_p3_cas_n),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_cas_n_iob)
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
	.D1(soc_a7ddrphy_dfi_p0_we_n),
	.D2(soc_a7ddrphy_dfi_p0_we_n),
	.D3(soc_a7ddrphy_dfi_p1_we_n),
	.D4(soc_a7ddrphy_dfi_p1_we_n),
	.D5(soc_a7ddrphy_dfi_p2_we_n),
	.D6(soc_a7ddrphy_dfi_p2_we_n),
	.D7(soc_a7ddrphy_dfi_p3_we_n),
	.D8(soc_a7ddrphy_dfi_p3_we_n),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_we_n_iob)
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
	.D1(soc_a7ddrphy_dfi_p0_cke),
	.D2(soc_a7ddrphy_dfi_p0_cke),
	.D3(soc_a7ddrphy_dfi_p1_cke),
	.D4(soc_a7ddrphy_dfi_p1_cke),
	.D5(soc_a7ddrphy_dfi_p2_cke),
	.D6(soc_a7ddrphy_dfi_p2_cke),
	.D7(soc_a7ddrphy_dfi_p3_cke),
	.D8(soc_a7ddrphy_dfi_p3_cke),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_cke_iob)
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
	.D1(soc_a7ddrphy_dfi_p0_odt),
	.D2(soc_a7ddrphy_dfi_p0_odt),
	.D3(soc_a7ddrphy_dfi_p1_odt),
	.D4(soc_a7ddrphy_dfi_p1_odt),
	.D5(soc_a7ddrphy_dfi_p2_odt),
	.D6(soc_a7ddrphy_dfi_p2_odt),
	.D7(soc_a7ddrphy_dfi_p3_odt),
	.D8(soc_a7ddrphy_dfi_p3_odt),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_odt_iob)
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
	.D1(soc_a7ddrphy_dfi_p0_reset_n),
	.D2(soc_a7ddrphy_dfi_p0_reset_n),
	.D3(soc_a7ddrphy_dfi_p1_reset_n),
	.D4(soc_a7ddrphy_dfi_p1_reset_n),
	.D5(soc_a7ddrphy_dfi_p2_reset_n),
	.D6(soc_a7ddrphy_dfi_p2_reset_n),
	.D7(soc_a7ddrphy_dfi_p3_reset_n),
	.D8(soc_a7ddrphy_dfi_p3_reset_n),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_reset_n_iob)
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
	.D1(soc_a7ddrphy_dfi_p0_cs_n),
	.D2(soc_a7ddrphy_dfi_p0_cs_n),
	.D3(soc_a7ddrphy_dfi_p1_cs_n),
	.D4(soc_a7ddrphy_dfi_p1_cs_n),
	.D5(soc_a7ddrphy_dfi_p2_cs_n),
	.D6(soc_a7ddrphy_dfi_p2_cs_n),
	.D7(soc_a7ddrphy_dfi_p3_cs_n),
	.D8(soc_a7ddrphy_dfi_p3_cs_n),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_cs_n_iob)
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
	.D1(soc_a7ddrphy_dfi_p0_wrdata_mask[0]),
	.D2(soc_a7ddrphy_dfi_p0_wrdata_mask[2]),
	.D3(soc_a7ddrphy_dfi_p1_wrdata_mask[0]),
	.D4(soc_a7ddrphy_dfi_p1_wrdata_mask[2]),
	.D5(soc_a7ddrphy_dfi_p2_wrdata_mask[0]),
	.D6(soc_a7ddrphy_dfi_p2_wrdata_mask[2]),
	.D7(soc_a7ddrphy_dfi_p3_wrdata_mask[0]),
	.D8(soc_a7ddrphy_dfi_p3_wrdata_mask[2]),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_dm_iob[0])
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
	.D1(soc_a7ddrphy_dqs_serdes_pattern[0]),
	.D2(soc_a7ddrphy_dqs_serdes_pattern[1]),
	.D3(soc_a7ddrphy_dqs_serdes_pattern[2]),
	.D4(soc_a7ddrphy_dqs_serdes_pattern[3]),
	.D5(soc_a7ddrphy_dqs_serdes_pattern[4]),
	.D6(soc_a7ddrphy_dqs_serdes_pattern[5]),
	.D7(soc_a7ddrphy_dqs_serdes_pattern[6]),
	.D8(soc_a7ddrphy_dqs_serdes_pattern[7]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~soc_a7ddrphy_oe_dqs)),
	.TCE(1'd1),
	.OFB(soc_a7ddrphy0),
	.OQ(soc_a7ddrphy_dqs_nodelay0),
	.TQ(soc_a7ddrphy_dqs_t0)
);
OBUFTDS OBUFTDS(
	.I(soc_a7ddrphy_dqs_nodelay0),
	.T(soc_a7ddrphy_dqs_t0),
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
	.D1(soc_a7ddrphy_dfi_p0_wrdata_mask[1]),
	.D2(soc_a7ddrphy_dfi_p0_wrdata_mask[3]),
	.D3(soc_a7ddrphy_dfi_p1_wrdata_mask[1]),
	.D4(soc_a7ddrphy_dfi_p1_wrdata_mask[3]),
	.D5(soc_a7ddrphy_dfi_p2_wrdata_mask[1]),
	.D6(soc_a7ddrphy_dfi_p2_wrdata_mask[3]),
	.D7(soc_a7ddrphy_dfi_p3_wrdata_mask[1]),
	.D8(soc_a7ddrphy_dfi_p3_wrdata_mask[3]),
	.OCE(1'd1),
	.RST(sys_rst),
	.OQ(ddram_dm_iob[1])
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
	.D1(soc_a7ddrphy_dqs_serdes_pattern[0]),
	.D2(soc_a7ddrphy_dqs_serdes_pattern[1]),
	.D3(soc_a7ddrphy_dqs_serdes_pattern[2]),
	.D4(soc_a7ddrphy_dqs_serdes_pattern[3]),
	.D5(soc_a7ddrphy_dqs_serdes_pattern[4]),
	.D6(soc_a7ddrphy_dqs_serdes_pattern[5]),
	.D7(soc_a7ddrphy_dqs_serdes_pattern[6]),
	.D8(soc_a7ddrphy_dqs_serdes_pattern[7]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~soc_a7ddrphy_oe_dqs)),
	.TCE(1'd1),
	.OFB(soc_a7ddrphy1),
	.OQ(soc_a7ddrphy_dqs_nodelay1),
	.TQ(soc_a7ddrphy_dqs_t1)
);
OBUFTDS OBUFTDS_1(
	.I(soc_a7ddrphy_dqs_nodelay1),
	.T(soc_a7ddrphy_dqs_t1),
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
	.D1(soc_a7ddrphy_dfi_p0_wrdata[0]),
	.D2(soc_a7ddrphy_dfi_p0_wrdata[16]),
	.D3(soc_a7ddrphy_dfi_p1_wrdata[0]),
	.D4(soc_a7ddrphy_dfi_p1_wrdata[16]),
	.D5(soc_a7ddrphy_dfi_p2_wrdata[0]),
	.D6(soc_a7ddrphy_dfi_p2_wrdata[16]),
	.D7(soc_a7ddrphy_dfi_p3_wrdata[0]),
	.D8(soc_a7ddrphy_dfi_p3_wrdata[16]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~soc_a7ddrphy_oe_dq)),
	.TCE(1'd1),
	.OQ(soc_a7ddrphy_dq_o_nodelay0),
	.TQ(soc_a7ddrphy_dq_t0)
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
`ifdef VIVADO
	.CLKB((~sys4x_clk)),
`else
	.CLKB(sys4x_clk),
`endif
	.CLKDIV(sys_clk),
	.DDLY(soc_a7ddrphy_dq_i_delayed0),
	.RST(sys_rst),
	.Q1(soc_a7ddrphy_dq_i_data0[7]),
	.Q2(soc_a7ddrphy_dq_i_data0[6]),
	.Q3(soc_a7ddrphy_dq_i_data0[5]),
	.Q4(soc_a7ddrphy_dq_i_data0[4]),
	.Q5(soc_a7ddrphy_dq_i_data0[3]),
	.Q6(soc_a7ddrphy_dq_i_data0[2]),
	.Q7(soc_a7ddrphy_dq_i_data0[1]),
	.Q8(soc_a7ddrphy_dq_i_data0[0])
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
	.CE((soc_a7ddrphy_dly_sel_storage[0] & soc_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(soc_a7ddrphy_dq_i_nodelay0),
	.INC(1'd1),
	.LD((soc_a7ddrphy_dly_sel_storage[0] & soc_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(soc_a7ddrphy_dq_i_delayed0)
);
IOBUF IOBUF(
	.I(soc_a7ddrphy_dq_o_nodelay0),
	.T(soc_a7ddrphy_dq_t0),
	.IO(ddram_dq[0]),
	.O(soc_a7ddrphy_dq_i_nodelay0)
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
	.D1(soc_a7ddrphy_dfi_p0_wrdata[1]),
	.D2(soc_a7ddrphy_dfi_p0_wrdata[17]),
	.D3(soc_a7ddrphy_dfi_p1_wrdata[1]),
	.D4(soc_a7ddrphy_dfi_p1_wrdata[17]),
	.D5(soc_a7ddrphy_dfi_p2_wrdata[1]),
	.D6(soc_a7ddrphy_dfi_p2_wrdata[17]),
	.D7(soc_a7ddrphy_dfi_p3_wrdata[1]),
	.D8(soc_a7ddrphy_dfi_p3_wrdata[17]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~soc_a7ddrphy_oe_dq)),
	.TCE(1'd1),
	.OQ(soc_a7ddrphy_dq_o_nodelay1),
	.TQ(soc_a7ddrphy_dq_t1)
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
`ifdef VIVADO
	.CLKB((~sys4x_clk)),
`else
	.CLKB(sys4x_clk),
`endif
	.CLKDIV(sys_clk),
	.DDLY(soc_a7ddrphy_dq_i_delayed1),
	.RST(sys_rst),
	.Q1(soc_a7ddrphy_dq_i_data1[7]),
	.Q2(soc_a7ddrphy_dq_i_data1[6]),
	.Q3(soc_a7ddrphy_dq_i_data1[5]),
	.Q4(soc_a7ddrphy_dq_i_data1[4]),
	.Q5(soc_a7ddrphy_dq_i_data1[3]),
	.Q6(soc_a7ddrphy_dq_i_data1[2]),
	.Q7(soc_a7ddrphy_dq_i_data1[1]),
	.Q8(soc_a7ddrphy_dq_i_data1[0])
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
	.CE((soc_a7ddrphy_dly_sel_storage[0] & soc_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(soc_a7ddrphy_dq_i_nodelay1),
	.INC(1'd1),
	.LD((soc_a7ddrphy_dly_sel_storage[0] & soc_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(soc_a7ddrphy_dq_i_delayed1)
);
IOBUF IOBUF_1(
	.I(soc_a7ddrphy_dq_o_nodelay1),
	.T(soc_a7ddrphy_dq_t1),
	.IO(ddram_dq[1]),
	.O(soc_a7ddrphy_dq_i_nodelay1)
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
	.D1(soc_a7ddrphy_dfi_p0_wrdata[2]),
	.D2(soc_a7ddrphy_dfi_p0_wrdata[18]),
	.D3(soc_a7ddrphy_dfi_p1_wrdata[2]),
	.D4(soc_a7ddrphy_dfi_p1_wrdata[18]),
	.D5(soc_a7ddrphy_dfi_p2_wrdata[2]),
	.D6(soc_a7ddrphy_dfi_p2_wrdata[18]),
	.D7(soc_a7ddrphy_dfi_p3_wrdata[2]),
	.D8(soc_a7ddrphy_dfi_p3_wrdata[18]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~soc_a7ddrphy_oe_dq)),
	.TCE(1'd1),
	.OQ(soc_a7ddrphy_dq_o_nodelay2),
	.TQ(soc_a7ddrphy_dq_t2)
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
`ifdef VIVADO
	.CLKB((~sys4x_clk)),
`else
	.CLKB(sys4x_clk),
`endif
	.CLKDIV(sys_clk),
	.DDLY(soc_a7ddrphy_dq_i_delayed2),
	.RST(sys_rst),
	.Q1(soc_a7ddrphy_dq_i_data2[7]),
	.Q2(soc_a7ddrphy_dq_i_data2[6]),
	.Q3(soc_a7ddrphy_dq_i_data2[5]),
	.Q4(soc_a7ddrphy_dq_i_data2[4]),
	.Q5(soc_a7ddrphy_dq_i_data2[3]),
	.Q6(soc_a7ddrphy_dq_i_data2[2]),
	.Q7(soc_a7ddrphy_dq_i_data2[1]),
	.Q8(soc_a7ddrphy_dq_i_data2[0])
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
	.CE((soc_a7ddrphy_dly_sel_storage[0] & soc_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(soc_a7ddrphy_dq_i_nodelay2),
	.INC(1'd1),
	.LD((soc_a7ddrphy_dly_sel_storage[0] & soc_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(soc_a7ddrphy_dq_i_delayed2)
);
IOBUF IOBUF_2(
	.I(soc_a7ddrphy_dq_o_nodelay2),
	.T(soc_a7ddrphy_dq_t2),
	.IO(ddram_dq[2]),
	.O(soc_a7ddrphy_dq_i_nodelay2)
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
	.D1(soc_a7ddrphy_dfi_p0_wrdata[3]),
	.D2(soc_a7ddrphy_dfi_p0_wrdata[19]),
	.D3(soc_a7ddrphy_dfi_p1_wrdata[3]),
	.D4(soc_a7ddrphy_dfi_p1_wrdata[19]),
	.D5(soc_a7ddrphy_dfi_p2_wrdata[3]),
	.D6(soc_a7ddrphy_dfi_p2_wrdata[19]),
	.D7(soc_a7ddrphy_dfi_p3_wrdata[3]),
	.D8(soc_a7ddrphy_dfi_p3_wrdata[19]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~soc_a7ddrphy_oe_dq)),
	.TCE(1'd1),
	.OQ(soc_a7ddrphy_dq_o_nodelay3),
	.TQ(soc_a7ddrphy_dq_t3)
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
`ifdef VIVADO
	.CLKB((~sys4x_clk)),
`else
	.CLKB(sys4x_clk),
`endif
	.CLKDIV(sys_clk),
	.DDLY(soc_a7ddrphy_dq_i_delayed3),
	.RST(sys_rst),
	.Q1(soc_a7ddrphy_dq_i_data3[7]),
	.Q2(soc_a7ddrphy_dq_i_data3[6]),
	.Q3(soc_a7ddrphy_dq_i_data3[5]),
	.Q4(soc_a7ddrphy_dq_i_data3[4]),
	.Q5(soc_a7ddrphy_dq_i_data3[3]),
	.Q6(soc_a7ddrphy_dq_i_data3[2]),
	.Q7(soc_a7ddrphy_dq_i_data3[1]),
	.Q8(soc_a7ddrphy_dq_i_data3[0])
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
	.CE((soc_a7ddrphy_dly_sel_storage[0] & soc_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(soc_a7ddrphy_dq_i_nodelay3),
	.INC(1'd1),
	.LD((soc_a7ddrphy_dly_sel_storage[0] & soc_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(soc_a7ddrphy_dq_i_delayed3)
);
IOBUF IOBUF_3(
	.I(soc_a7ddrphy_dq_o_nodelay3),
	.T(soc_a7ddrphy_dq_t3),
	.IO(ddram_dq[3]),
	.O(soc_a7ddrphy_dq_i_nodelay3)
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
	.D1(soc_a7ddrphy_dfi_p0_wrdata[4]),
	.D2(soc_a7ddrphy_dfi_p0_wrdata[20]),
	.D3(soc_a7ddrphy_dfi_p1_wrdata[4]),
	.D4(soc_a7ddrphy_dfi_p1_wrdata[20]),
	.D5(soc_a7ddrphy_dfi_p2_wrdata[4]),
	.D6(soc_a7ddrphy_dfi_p2_wrdata[20]),
	.D7(soc_a7ddrphy_dfi_p3_wrdata[4]),
	.D8(soc_a7ddrphy_dfi_p3_wrdata[20]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~soc_a7ddrphy_oe_dq)),
	.TCE(1'd1),
	.OQ(soc_a7ddrphy_dq_o_nodelay4),
	.TQ(soc_a7ddrphy_dq_t4)
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
`ifdef VIVADO
	.CLKB((~sys4x_clk)),
`else
	.CLKB(sys4x_clk),
`endif
	.CLKDIV(sys_clk),
	.DDLY(soc_a7ddrphy_dq_i_delayed4),
	.RST(sys_rst),
	.Q1(soc_a7ddrphy_dq_i_data4[7]),
	.Q2(soc_a7ddrphy_dq_i_data4[6]),
	.Q3(soc_a7ddrphy_dq_i_data4[5]),
	.Q4(soc_a7ddrphy_dq_i_data4[4]),
	.Q5(soc_a7ddrphy_dq_i_data4[3]),
	.Q6(soc_a7ddrphy_dq_i_data4[2]),
	.Q7(soc_a7ddrphy_dq_i_data4[1]),
	.Q8(soc_a7ddrphy_dq_i_data4[0])
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
	.CE((soc_a7ddrphy_dly_sel_storage[0] & soc_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(soc_a7ddrphy_dq_i_nodelay4),
	.INC(1'd1),
	.LD((soc_a7ddrphy_dly_sel_storage[0] & soc_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(soc_a7ddrphy_dq_i_delayed4)
);
IOBUF IOBUF_4(
	.I(soc_a7ddrphy_dq_o_nodelay4),
	.T(soc_a7ddrphy_dq_t4),
	.IO(ddram_dq[4]),
	.O(soc_a7ddrphy_dq_i_nodelay4)
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
	.D1(soc_a7ddrphy_dfi_p0_wrdata[5]),
	.D2(soc_a7ddrphy_dfi_p0_wrdata[21]),
	.D3(soc_a7ddrphy_dfi_p1_wrdata[5]),
	.D4(soc_a7ddrphy_dfi_p1_wrdata[21]),
	.D5(soc_a7ddrphy_dfi_p2_wrdata[5]),
	.D6(soc_a7ddrphy_dfi_p2_wrdata[21]),
	.D7(soc_a7ddrphy_dfi_p3_wrdata[5]),
	.D8(soc_a7ddrphy_dfi_p3_wrdata[21]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~soc_a7ddrphy_oe_dq)),
	.TCE(1'd1),
	.OQ(soc_a7ddrphy_dq_o_nodelay5),
	.TQ(soc_a7ddrphy_dq_t5)
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
`ifdef VIVADO
	.CLKB((~sys4x_clk)),
`else
	.CLKB(sys4x_clk),
`endif
	.CLKDIV(sys_clk),
	.DDLY(soc_a7ddrphy_dq_i_delayed5),
	.RST(sys_rst),
	.Q1(soc_a7ddrphy_dq_i_data5[7]),
	.Q2(soc_a7ddrphy_dq_i_data5[6]),
	.Q3(soc_a7ddrphy_dq_i_data5[5]),
	.Q4(soc_a7ddrphy_dq_i_data5[4]),
	.Q5(soc_a7ddrphy_dq_i_data5[3]),
	.Q6(soc_a7ddrphy_dq_i_data5[2]),
	.Q7(soc_a7ddrphy_dq_i_data5[1]),
	.Q8(soc_a7ddrphy_dq_i_data5[0])
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
	.CE((soc_a7ddrphy_dly_sel_storage[0] & soc_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(soc_a7ddrphy_dq_i_nodelay5),
	.INC(1'd1),
	.LD((soc_a7ddrphy_dly_sel_storage[0] & soc_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(soc_a7ddrphy_dq_i_delayed5)
);
IOBUF IOBUF_5(
	.I(soc_a7ddrphy_dq_o_nodelay5),
	.T(soc_a7ddrphy_dq_t5),
	.IO(ddram_dq[5]),
	.O(soc_a7ddrphy_dq_i_nodelay5)
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
	.D1(soc_a7ddrphy_dfi_p0_wrdata[6]),
	.D2(soc_a7ddrphy_dfi_p0_wrdata[22]),
	.D3(soc_a7ddrphy_dfi_p1_wrdata[6]),
	.D4(soc_a7ddrphy_dfi_p1_wrdata[22]),
	.D5(soc_a7ddrphy_dfi_p2_wrdata[6]),
	.D6(soc_a7ddrphy_dfi_p2_wrdata[22]),
	.D7(soc_a7ddrphy_dfi_p3_wrdata[6]),
	.D8(soc_a7ddrphy_dfi_p3_wrdata[22]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~soc_a7ddrphy_oe_dq)),
	.TCE(1'd1),
	.OQ(soc_a7ddrphy_dq_o_nodelay6),
	.TQ(soc_a7ddrphy_dq_t6)
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
`ifdef VIVADO
	.CLKB((~sys4x_clk)),
`else
	.CLKB(sys4x_clk),
`endif
	.CLKDIV(sys_clk),
	.DDLY(soc_a7ddrphy_dq_i_delayed6),
	.RST(sys_rst),
	.Q1(soc_a7ddrphy_dq_i_data6[7]),
	.Q2(soc_a7ddrphy_dq_i_data6[6]),
	.Q3(soc_a7ddrphy_dq_i_data6[5]),
	.Q4(soc_a7ddrphy_dq_i_data6[4]),
	.Q5(soc_a7ddrphy_dq_i_data6[3]),
	.Q6(soc_a7ddrphy_dq_i_data6[2]),
	.Q7(soc_a7ddrphy_dq_i_data6[1]),
	.Q8(soc_a7ddrphy_dq_i_data6[0])
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
	.CE((soc_a7ddrphy_dly_sel_storage[0] & soc_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(soc_a7ddrphy_dq_i_nodelay6),
	.INC(1'd1),
	.LD((soc_a7ddrphy_dly_sel_storage[0] & soc_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(soc_a7ddrphy_dq_i_delayed6)
);
IOBUF IOBUF_6(
	.I(soc_a7ddrphy_dq_o_nodelay6),
	.T(soc_a7ddrphy_dq_t6),
	.IO(ddram_dq[6]),
	.O(soc_a7ddrphy_dq_i_nodelay6)
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
	.D1(soc_a7ddrphy_dfi_p0_wrdata[7]),
	.D2(soc_a7ddrphy_dfi_p0_wrdata[23]),
	.D3(soc_a7ddrphy_dfi_p1_wrdata[7]),
	.D4(soc_a7ddrphy_dfi_p1_wrdata[23]),
	.D5(soc_a7ddrphy_dfi_p2_wrdata[7]),
	.D6(soc_a7ddrphy_dfi_p2_wrdata[23]),
	.D7(soc_a7ddrphy_dfi_p3_wrdata[7]),
	.D8(soc_a7ddrphy_dfi_p3_wrdata[23]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~soc_a7ddrphy_oe_dq)),
	.TCE(1'd1),
	.OQ(soc_a7ddrphy_dq_o_nodelay7),
	.TQ(soc_a7ddrphy_dq_t7)
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
`ifdef VIVADO
	.CLKB((~sys4x_clk)),
`else
	.CLKB(sys4x_clk),
`endif
	.CLKDIV(sys_clk),
	.DDLY(soc_a7ddrphy_dq_i_delayed7),
	.RST(sys_rst),
	.Q1(soc_a7ddrphy_dq_i_data7[7]),
	.Q2(soc_a7ddrphy_dq_i_data7[6]),
	.Q3(soc_a7ddrphy_dq_i_data7[5]),
	.Q4(soc_a7ddrphy_dq_i_data7[4]),
	.Q5(soc_a7ddrphy_dq_i_data7[3]),
	.Q6(soc_a7ddrphy_dq_i_data7[2]),
	.Q7(soc_a7ddrphy_dq_i_data7[1]),
	.Q8(soc_a7ddrphy_dq_i_data7[0])
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
	.CE((soc_a7ddrphy_dly_sel_storage[0] & soc_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(soc_a7ddrphy_dq_i_nodelay7),
	.INC(1'd1),
	.LD((soc_a7ddrphy_dly_sel_storage[0] & soc_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(soc_a7ddrphy_dq_i_delayed7)
);
IOBUF IOBUF_7(
	.I(soc_a7ddrphy_dq_o_nodelay7),
	.T(soc_a7ddrphy_dq_t7),
	.IO(ddram_dq[7]),
	.O(soc_a7ddrphy_dq_i_nodelay7)
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
	.D1(soc_a7ddrphy_dfi_p0_wrdata[8]),
	.D2(soc_a7ddrphy_dfi_p0_wrdata[24]),
	.D3(soc_a7ddrphy_dfi_p1_wrdata[8]),
	.D4(soc_a7ddrphy_dfi_p1_wrdata[24]),
	.D5(soc_a7ddrphy_dfi_p2_wrdata[8]),
	.D6(soc_a7ddrphy_dfi_p2_wrdata[24]),
	.D7(soc_a7ddrphy_dfi_p3_wrdata[8]),
	.D8(soc_a7ddrphy_dfi_p3_wrdata[24]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~soc_a7ddrphy_oe_dq)),
	.TCE(1'd1),
	.OQ(soc_a7ddrphy_dq_o_nodelay8),
	.TQ(soc_a7ddrphy_dq_t8)
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
`ifdef VIVADO
	.CLKB((~sys4x_clk)),
`else
	.CLKB(sys4x_clk),
`endif
	.CLKDIV(sys_clk),
	.DDLY(soc_a7ddrphy_dq_i_delayed8),
	.RST(sys_rst),
	.Q1(soc_a7ddrphy_dq_i_data8[7]),
	.Q2(soc_a7ddrphy_dq_i_data8[6]),
	.Q3(soc_a7ddrphy_dq_i_data8[5]),
	.Q4(soc_a7ddrphy_dq_i_data8[4]),
	.Q5(soc_a7ddrphy_dq_i_data8[3]),
	.Q6(soc_a7ddrphy_dq_i_data8[2]),
	.Q7(soc_a7ddrphy_dq_i_data8[1]),
	.Q8(soc_a7ddrphy_dq_i_data8[0])
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
	.CE((soc_a7ddrphy_dly_sel_storage[1] & soc_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(soc_a7ddrphy_dq_i_nodelay8),
	.INC(1'd1),
	.LD((soc_a7ddrphy_dly_sel_storage[1] & soc_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(soc_a7ddrphy_dq_i_delayed8)
);
IOBUF IOBUF_8(
	.I(soc_a7ddrphy_dq_o_nodelay8),
	.T(soc_a7ddrphy_dq_t8),
	.IO(ddram_dq[8]),
	.O(soc_a7ddrphy_dq_i_nodelay8)
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
	.D1(soc_a7ddrphy_dfi_p0_wrdata[9]),
	.D2(soc_a7ddrphy_dfi_p0_wrdata[25]),
	.D3(soc_a7ddrphy_dfi_p1_wrdata[9]),
	.D4(soc_a7ddrphy_dfi_p1_wrdata[25]),
	.D5(soc_a7ddrphy_dfi_p2_wrdata[9]),
	.D6(soc_a7ddrphy_dfi_p2_wrdata[25]),
	.D7(soc_a7ddrphy_dfi_p3_wrdata[9]),
	.D8(soc_a7ddrphy_dfi_p3_wrdata[25]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~soc_a7ddrphy_oe_dq)),
	.TCE(1'd1),
	.OQ(soc_a7ddrphy_dq_o_nodelay9),
	.TQ(soc_a7ddrphy_dq_t9)
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
`ifdef VIVADO
	.CLKB((~sys4x_clk)),
`else
	.CLKB(sys4x_clk),
`endif
	.CLKDIV(sys_clk),
	.DDLY(soc_a7ddrphy_dq_i_delayed9),
	.RST(sys_rst),
	.Q1(soc_a7ddrphy_dq_i_data9[7]),
	.Q2(soc_a7ddrphy_dq_i_data9[6]),
	.Q3(soc_a7ddrphy_dq_i_data9[5]),
	.Q4(soc_a7ddrphy_dq_i_data9[4]),
	.Q5(soc_a7ddrphy_dq_i_data9[3]),
	.Q6(soc_a7ddrphy_dq_i_data9[2]),
	.Q7(soc_a7ddrphy_dq_i_data9[1]),
	.Q8(soc_a7ddrphy_dq_i_data9[0])
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
	.CE((soc_a7ddrphy_dly_sel_storage[1] & soc_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(soc_a7ddrphy_dq_i_nodelay9),
	.INC(1'd1),
	.LD((soc_a7ddrphy_dly_sel_storage[1] & soc_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(soc_a7ddrphy_dq_i_delayed9)
);
IOBUF IOBUF_9(
	.I(soc_a7ddrphy_dq_o_nodelay9),
	.T(soc_a7ddrphy_dq_t9),
	.IO(ddram_dq[9]),
	.O(soc_a7ddrphy_dq_i_nodelay9)
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
	.D1(soc_a7ddrphy_dfi_p0_wrdata[10]),
	.D2(soc_a7ddrphy_dfi_p0_wrdata[26]),
	.D3(soc_a7ddrphy_dfi_p1_wrdata[10]),
	.D4(soc_a7ddrphy_dfi_p1_wrdata[26]),
	.D5(soc_a7ddrphy_dfi_p2_wrdata[10]),
	.D6(soc_a7ddrphy_dfi_p2_wrdata[26]),
	.D7(soc_a7ddrphy_dfi_p3_wrdata[10]),
	.D8(soc_a7ddrphy_dfi_p3_wrdata[26]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~soc_a7ddrphy_oe_dq)),
	.TCE(1'd1),
	.OQ(soc_a7ddrphy_dq_o_nodelay10),
	.TQ(soc_a7ddrphy_dq_t10)
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
`ifdef VIVADO
	.CLKB((~sys4x_clk)),
`else
	.CLKB(sys4x_clk),
`endif
	.CLKDIV(sys_clk),
	.DDLY(soc_a7ddrphy_dq_i_delayed10),
	.RST(sys_rst),
	.Q1(soc_a7ddrphy_dq_i_data10[7]),
	.Q2(soc_a7ddrphy_dq_i_data10[6]),
	.Q3(soc_a7ddrphy_dq_i_data10[5]),
	.Q4(soc_a7ddrphy_dq_i_data10[4]),
	.Q5(soc_a7ddrphy_dq_i_data10[3]),
	.Q6(soc_a7ddrphy_dq_i_data10[2]),
	.Q7(soc_a7ddrphy_dq_i_data10[1]),
	.Q8(soc_a7ddrphy_dq_i_data10[0])
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
	.CE((soc_a7ddrphy_dly_sel_storage[1] & soc_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(soc_a7ddrphy_dq_i_nodelay10),
	.INC(1'd1),
	.LD((soc_a7ddrphy_dly_sel_storage[1] & soc_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(soc_a7ddrphy_dq_i_delayed10)
);
IOBUF IOBUF_10(
	.I(soc_a7ddrphy_dq_o_nodelay10),
	.T(soc_a7ddrphy_dq_t10),
	.IO(ddram_dq[10]),
	.O(soc_a7ddrphy_dq_i_nodelay10)
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
	.D1(soc_a7ddrphy_dfi_p0_wrdata[11]),
	.D2(soc_a7ddrphy_dfi_p0_wrdata[27]),
	.D3(soc_a7ddrphy_dfi_p1_wrdata[11]),
	.D4(soc_a7ddrphy_dfi_p1_wrdata[27]),
	.D5(soc_a7ddrphy_dfi_p2_wrdata[11]),
	.D6(soc_a7ddrphy_dfi_p2_wrdata[27]),
	.D7(soc_a7ddrphy_dfi_p3_wrdata[11]),
	.D8(soc_a7ddrphy_dfi_p3_wrdata[27]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~soc_a7ddrphy_oe_dq)),
	.TCE(1'd1),
	.OQ(soc_a7ddrphy_dq_o_nodelay11),
	.TQ(soc_a7ddrphy_dq_t11)
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
`ifdef VIVADO
	.CLKB((~sys4x_clk)),
`else
	.CLKB(sys4x_clk),
`endif
	.CLKDIV(sys_clk),
	.DDLY(soc_a7ddrphy_dq_i_delayed11),
	.RST(sys_rst),
	.Q1(soc_a7ddrphy_dq_i_data11[7]),
	.Q2(soc_a7ddrphy_dq_i_data11[6]),
	.Q3(soc_a7ddrphy_dq_i_data11[5]),
	.Q4(soc_a7ddrphy_dq_i_data11[4]),
	.Q5(soc_a7ddrphy_dq_i_data11[3]),
	.Q6(soc_a7ddrphy_dq_i_data11[2]),
	.Q7(soc_a7ddrphy_dq_i_data11[1]),
	.Q8(soc_a7ddrphy_dq_i_data11[0])
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
	.CE((soc_a7ddrphy_dly_sel_storage[1] & soc_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(soc_a7ddrphy_dq_i_nodelay11),
	.INC(1'd1),
	.LD((soc_a7ddrphy_dly_sel_storage[1] & soc_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(soc_a7ddrphy_dq_i_delayed11)
);
IOBUF IOBUF_11(
	.I(soc_a7ddrphy_dq_o_nodelay11),
	.T(soc_a7ddrphy_dq_t11),
	.IO(ddram_dq[11]),
	.O(soc_a7ddrphy_dq_i_nodelay11)
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
	.D1(soc_a7ddrphy_dfi_p0_wrdata[12]),
	.D2(soc_a7ddrphy_dfi_p0_wrdata[28]),
	.D3(soc_a7ddrphy_dfi_p1_wrdata[12]),
	.D4(soc_a7ddrphy_dfi_p1_wrdata[28]),
	.D5(soc_a7ddrphy_dfi_p2_wrdata[12]),
	.D6(soc_a7ddrphy_dfi_p2_wrdata[28]),
	.D7(soc_a7ddrphy_dfi_p3_wrdata[12]),
	.D8(soc_a7ddrphy_dfi_p3_wrdata[28]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~soc_a7ddrphy_oe_dq)),
	.TCE(1'd1),
	.OQ(soc_a7ddrphy_dq_o_nodelay12),
	.TQ(soc_a7ddrphy_dq_t12)
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
`ifdef VIVADO
	.CLKB((~sys4x_clk)),
`else
	.CLKB(sys4x_clk),
`endif
	.CLKDIV(sys_clk),
	.DDLY(soc_a7ddrphy_dq_i_delayed12),
	.RST(sys_rst),
	.Q1(soc_a7ddrphy_dq_i_data12[7]),
	.Q2(soc_a7ddrphy_dq_i_data12[6]),
	.Q3(soc_a7ddrphy_dq_i_data12[5]),
	.Q4(soc_a7ddrphy_dq_i_data12[4]),
	.Q5(soc_a7ddrphy_dq_i_data12[3]),
	.Q6(soc_a7ddrphy_dq_i_data12[2]),
	.Q7(soc_a7ddrphy_dq_i_data12[1]),
	.Q8(soc_a7ddrphy_dq_i_data12[0])
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
	.CE((soc_a7ddrphy_dly_sel_storage[1] & soc_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(soc_a7ddrphy_dq_i_nodelay12),
	.INC(1'd1),
	.LD((soc_a7ddrphy_dly_sel_storage[1] & soc_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(soc_a7ddrphy_dq_i_delayed12)
);
IOBUF IOBUF_12(
	.I(soc_a7ddrphy_dq_o_nodelay12),
	.T(soc_a7ddrphy_dq_t12),
	.IO(ddram_dq[12]),
	.O(soc_a7ddrphy_dq_i_nodelay12)
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
	.D1(soc_a7ddrphy_dfi_p0_wrdata[13]),
	.D2(soc_a7ddrphy_dfi_p0_wrdata[29]),
	.D3(soc_a7ddrphy_dfi_p1_wrdata[13]),
	.D4(soc_a7ddrphy_dfi_p1_wrdata[29]),
	.D5(soc_a7ddrphy_dfi_p2_wrdata[13]),
	.D6(soc_a7ddrphy_dfi_p2_wrdata[29]),
	.D7(soc_a7ddrphy_dfi_p3_wrdata[13]),
	.D8(soc_a7ddrphy_dfi_p3_wrdata[29]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~soc_a7ddrphy_oe_dq)),
	.TCE(1'd1),
	.OQ(soc_a7ddrphy_dq_o_nodelay13),
	.TQ(soc_a7ddrphy_dq_t13)
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
`ifdef VIVADO
	.CLKB((~sys4x_clk)),
`else
	.CLKB(sys4x_clk),
`endif
	.CLKDIV(sys_clk),
	.DDLY(soc_a7ddrphy_dq_i_delayed13),
	.RST(sys_rst),
	.Q1(soc_a7ddrphy_dq_i_data13[7]),
	.Q2(soc_a7ddrphy_dq_i_data13[6]),
	.Q3(soc_a7ddrphy_dq_i_data13[5]),
	.Q4(soc_a7ddrphy_dq_i_data13[4]),
	.Q5(soc_a7ddrphy_dq_i_data13[3]),
	.Q6(soc_a7ddrphy_dq_i_data13[2]),
	.Q7(soc_a7ddrphy_dq_i_data13[1]),
	.Q8(soc_a7ddrphy_dq_i_data13[0])
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
	.CE((soc_a7ddrphy_dly_sel_storage[1] & soc_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(soc_a7ddrphy_dq_i_nodelay13),
	.INC(1'd1),
	.LD((soc_a7ddrphy_dly_sel_storage[1] & soc_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(soc_a7ddrphy_dq_i_delayed13)
);
IOBUF IOBUF_13(
	.I(soc_a7ddrphy_dq_o_nodelay13),
	.T(soc_a7ddrphy_dq_t13),
	.IO(ddram_dq[13]),
	.O(soc_a7ddrphy_dq_i_nodelay13)
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
	.D1(soc_a7ddrphy_dfi_p0_wrdata[14]),
	.D2(soc_a7ddrphy_dfi_p0_wrdata[30]),
	.D3(soc_a7ddrphy_dfi_p1_wrdata[14]),
	.D4(soc_a7ddrphy_dfi_p1_wrdata[30]),
	.D5(soc_a7ddrphy_dfi_p2_wrdata[14]),
	.D6(soc_a7ddrphy_dfi_p2_wrdata[30]),
	.D7(soc_a7ddrphy_dfi_p3_wrdata[14]),
	.D8(soc_a7ddrphy_dfi_p3_wrdata[30]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~soc_a7ddrphy_oe_dq)),
	.TCE(1'd1),
	.OQ(soc_a7ddrphy_dq_o_nodelay14),
	.TQ(soc_a7ddrphy_dq_t14)
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
`ifdef VIVADO
	.CLKB((~sys4x_clk)),
`else
	.CLKB(sys4x_clk),
`endif
	.CLKDIV(sys_clk),
	.DDLY(soc_a7ddrphy_dq_i_delayed14),
	.RST(sys_rst),
	.Q1(soc_a7ddrphy_dq_i_data14[7]),
	.Q2(soc_a7ddrphy_dq_i_data14[6]),
	.Q3(soc_a7ddrphy_dq_i_data14[5]),
	.Q4(soc_a7ddrphy_dq_i_data14[4]),
	.Q5(soc_a7ddrphy_dq_i_data14[3]),
	.Q6(soc_a7ddrphy_dq_i_data14[2]),
	.Q7(soc_a7ddrphy_dq_i_data14[1]),
	.Q8(soc_a7ddrphy_dq_i_data14[0])
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
	.CE((soc_a7ddrphy_dly_sel_storage[1] & soc_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(soc_a7ddrphy_dq_i_nodelay14),
	.INC(1'd1),
	.LD((soc_a7ddrphy_dly_sel_storage[1] & soc_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(soc_a7ddrphy_dq_i_delayed14)
);
IOBUF IOBUF_14(
	.I(soc_a7ddrphy_dq_o_nodelay14),
	.T(soc_a7ddrphy_dq_t14),
	.IO(ddram_dq[14]),
	.O(soc_a7ddrphy_dq_i_nodelay14)
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
	.D1(soc_a7ddrphy_dfi_p0_wrdata[15]),
	.D2(soc_a7ddrphy_dfi_p0_wrdata[31]),
	.D3(soc_a7ddrphy_dfi_p1_wrdata[15]),
	.D4(soc_a7ddrphy_dfi_p1_wrdata[31]),
	.D5(soc_a7ddrphy_dfi_p2_wrdata[15]),
	.D6(soc_a7ddrphy_dfi_p2_wrdata[31]),
	.D7(soc_a7ddrphy_dfi_p3_wrdata[15]),
	.D8(soc_a7ddrphy_dfi_p3_wrdata[31]),
	.OCE(1'd1),
	.RST(sys_rst),
	.T1((~soc_a7ddrphy_oe_dq)),
	.TCE(1'd1),
	.OQ(soc_a7ddrphy_dq_o_nodelay15),
	.TQ(soc_a7ddrphy_dq_t15)
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
`ifdef VIVADO
	.CLKB((~sys4x_clk)),
`else
	.CLKB(sys4x_clk),
`endif
	.CLKDIV(sys_clk),
	.DDLY(soc_a7ddrphy_dq_i_delayed15),
	.RST(sys_rst),
	.Q1(soc_a7ddrphy_dq_i_data15[7]),
	.Q2(soc_a7ddrphy_dq_i_data15[6]),
	.Q3(soc_a7ddrphy_dq_i_data15[5]),
	.Q4(soc_a7ddrphy_dq_i_data15[4]),
	.Q5(soc_a7ddrphy_dq_i_data15[3]),
	.Q6(soc_a7ddrphy_dq_i_data15[2]),
	.Q7(soc_a7ddrphy_dq_i_data15[1]),
	.Q8(soc_a7ddrphy_dq_i_data15[0])
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
	.CE((soc_a7ddrphy_dly_sel_storage[1] & soc_a7ddrphy_rdly_dq_inc_re)),
	.IDATAIN(soc_a7ddrphy_dq_i_nodelay15),
	.INC(1'd1),
	.LD((soc_a7ddrphy_dly_sel_storage[1] & soc_a7ddrphy_rdly_dq_rst_re)),
	.LDPIPEEN(1'd0),
	.DATAOUT(soc_a7ddrphy_dq_i_delayed15)
);
IOBUF IOBUF_15(
	.I(soc_a7ddrphy_dq_o_nodelay15),
	.T(soc_a7ddrphy_dq_t15),
	.IO(ddram_dq[15]),
	.O(soc_a7ddrphy_dq_i_nodelay15)
);
reg [23:0] storage_2[0:7];
reg [23:0] memdat_5;
always @(posedge sys_clk) begin
	if (soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_wrport_we)
		storage_2[soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_wrport_adr] <= soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_wrport_dat_w;
	memdat_5 <= storage_2[soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_wrport_adr];
end
always @(posedge sys_clk) begin
end
assign soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_wrport_dat_r = memdat_5;
assign soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_rdport_dat_r = storage_2[soc_netsoc_sdram_bankmachine0_cmd_buffer_lookahead_rdport_adr];
reg [23:0] storage_3[0:7];
reg [23:0] memdat_6;
always @(posedge sys_clk) begin
	if (soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_wrport_we)
		storage_3[soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_wrport_adr] <= soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_wrport_dat_w;
	memdat_6 <= storage_3[soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_wrport_adr];
end
always @(posedge sys_clk) begin
end
assign soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_wrport_dat_r = memdat_6;
assign soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_rdport_dat_r = storage_3[soc_netsoc_sdram_bankmachine1_cmd_buffer_lookahead_rdport_adr];
reg [23:0] storage_4[0:7];
reg [23:0] memdat_7;
always @(posedge sys_clk) begin
	if (soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_wrport_we)
		storage_4[soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_wrport_adr] <= soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_wrport_dat_w;
	memdat_7 <= storage_4[soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_wrport_adr];
end
always @(posedge sys_clk) begin
end
assign soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_wrport_dat_r = memdat_7;
assign soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_rdport_dat_r = storage_4[soc_netsoc_sdram_bankmachine2_cmd_buffer_lookahead_rdport_adr];
reg [23:0] storage_5[0:7];
reg [23:0] memdat_8;
always @(posedge sys_clk) begin
	if (soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_wrport_we)
		storage_5[soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_wrport_adr] <= soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_wrport_dat_w;
	memdat_8 <= storage_5[soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_wrport_adr];
end
always @(posedge sys_clk) begin
end
assign soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_wrport_dat_r = memdat_8;
assign soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_rdport_dat_r = storage_5[soc_netsoc_sdram_bankmachine3_cmd_buffer_lookahead_rdport_adr];
reg [23:0] storage_6[0:7];
reg [23:0] memdat_9;
always @(posedge sys_clk) begin
	if (soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_wrport_we)
		storage_6[soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_wrport_adr] <= soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_wrport_dat_w;
	memdat_9 <= storage_6[soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_wrport_adr];
end
always @(posedge sys_clk) begin
end
assign soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_wrport_dat_r = memdat_9;
assign soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_rdport_dat_r = storage_6[soc_netsoc_sdram_bankmachine4_cmd_buffer_lookahead_rdport_adr];
reg [23:0] storage_7[0:7];
reg [23:0] memdat_10;
always @(posedge sys_clk) begin
	if (soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_wrport_we)
		storage_7[soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_wrport_adr] <= soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_wrport_dat_w;
	memdat_10 <= storage_7[soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_wrport_adr];
end
always @(posedge sys_clk) begin
end
assign soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_wrport_dat_r = memdat_10;
assign soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_rdport_dat_r = storage_7[soc_netsoc_sdram_bankmachine5_cmd_buffer_lookahead_rdport_adr];
reg [23:0] storage_8[0:7];
reg [23:0] memdat_11;
always @(posedge sys_clk) begin
	if (soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_wrport_we)
		storage_8[soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_wrport_adr] <= soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_wrport_dat_w;
	memdat_11 <= storage_8[soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_wrport_adr];
end
always @(posedge sys_clk) begin
end
assign soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_wrport_dat_r = memdat_11;
assign soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_rdport_dat_r = storage_8[soc_netsoc_sdram_bankmachine6_cmd_buffer_lookahead_rdport_adr];
reg [23:0] storage_9[0:7];
reg [23:0] memdat_12;
always @(posedge sys_clk) begin
	if (soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_wrport_we)
		storage_9[soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_wrport_adr] <= soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_wrport_dat_w;
	memdat_12 <= storage_9[soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_wrport_adr];
end
always @(posedge sys_clk) begin
end
assign soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_wrport_dat_r = memdat_12;
assign soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_rdport_dat_r = storage_9[soc_netsoc_sdram_bankmachine7_cmd_buffer_lookahead_rdport_adr];
reg [23:0] tag_mem[0:511];
reg [8:0] memadr_3;
always @(posedge sys_clk) begin
	if (soc_netsoc_tag_port_we)
		tag_mem[soc_netsoc_tag_port_adr] <= soc_netsoc_tag_port_dat_w;
	memadr_3 <= soc_netsoc_tag_port_adr;
end
assign soc_netsoc_tag_port_dat_r = tag_mem[memadr_3];
assign eth_mdio = soc_data_oe ? soc_data_w : 1'bz;
assign soc_data_r = eth_mdio;
reg [11:0] storage_10[0:4];
reg [11:0] memdat_13;
always @(posedge eth_rx_clk) begin
	if (soc_crc32_checker_syncfifo_wrport_we)
		storage_10[soc_crc32_checker_syncfifo_wrport_adr] <= soc_crc32_checker_syncfifo_wrport_dat_w;
	memdat_13 <= storage_10[soc_crc32_checker_syncfifo_wrport_adr];
end
always @(posedge eth_rx_clk) begin
end
assign soc_crc32_checker_syncfifo_wrport_dat_r = memdat_13;
assign soc_crc32_checker_syncfifo_rdport_dat_r = storage_10[soc_crc32_checker_syncfifo_rdport_adr];
reg [41:0] storage_11[0:63];
reg [5:0] memadr_4;
reg [5:0] memadr_5;
always @(posedge sys_clk) begin
	if (soc_tx_cdc_wrport_we)
		storage_11[soc_tx_cdc_wrport_adr] <= soc_tx_cdc_wrport_dat_w;
	memadr_4 <= soc_tx_cdc_wrport_adr;
end
always @(posedge eth_tx_clk) begin
	memadr_5 <= soc_tx_cdc_rdport_adr;
end
assign soc_tx_cdc_wrport_dat_r = storage_11[memadr_4];
assign soc_tx_cdc_rdport_dat_r = storage_11[memadr_5];
reg [41:0] storage_12[0:63];
reg [5:0] memadr_6;
reg [5:0] memadr_7;
always @(posedge eth_rx_clk) begin
	if (soc_rx_cdc_wrport_we)
		storage_12[soc_rx_cdc_wrport_adr] <= soc_rx_cdc_wrport_dat_w;
	memadr_6 <= soc_rx_cdc_wrport_adr;
end
always @(posedge sys_clk) begin
	memadr_7 <= soc_rx_cdc_rdport_adr;
end
assign soc_rx_cdc_wrport_dat_r = storage_12[memadr_6];
assign soc_rx_cdc_rdport_dat_r = storage_12[memadr_7];
reg [34:0] storage_13[0:1];
reg [34:0] memdat_14;
always @(posedge sys_clk) begin
	if (soc_writer_fifo_wrport_we)
		storage_13[soc_writer_fifo_wrport_adr] <= soc_writer_fifo_wrport_dat_w;
	memdat_14 <= storage_13[soc_writer_fifo_wrport_adr];
end
always @(posedge sys_clk) begin
end
assign soc_writer_fifo_wrport_dat_r = memdat_14;
assign soc_writer_fifo_rdport_dat_r = storage_13[soc_writer_fifo_rdport_adr];
reg [31:0] mem_4[0:381];
reg [8:0] memadr_8;
reg [31:0] memdat_15;
always @(posedge sys_clk) begin
	if (soc_writer_memory0_we)
		mem_4[soc_writer_memory0_adr] <= soc_writer_memory0_dat_w;
	memadr_8 <= soc_writer_memory0_adr;
end
always @(posedge sys_clk) begin
	memdat_15 <= mem_4[soc_sram0_adr0];
end
assign soc_writer_memory0_dat_r = mem_4[memadr_8];
assign soc_sram0_dat_r0 = memdat_15;
reg [31:0] mem_5[0:381];
reg [8:0] memadr_9;
reg [31:0] memdat_16;
always @(posedge sys_clk) begin
	if (soc_writer_memory1_we)
		mem_5[soc_writer_memory1_adr] <= soc_writer_memory1_dat_w;
	memadr_9 <= soc_writer_memory1_adr;
end
always @(posedge sys_clk) begin
	memdat_16 <= mem_5[soc_sram1_adr0];
end
assign soc_writer_memory1_dat_r = mem_5[memadr_9];
assign soc_sram1_dat_r0 = memdat_16;
reg [13:0] storage_14[0:1];
reg [13:0] memdat_17;
always @(posedge sys_clk) begin
	if (soc_reader_fifo_wrport_we)
		storage_14[soc_reader_fifo_wrport_adr] <= soc_reader_fifo_wrport_dat_w;
	memdat_17 <= storage_14[soc_reader_fifo_wrport_adr];
end
always @(posedge sys_clk) begin
end
assign soc_reader_fifo_wrport_dat_r = memdat_17;
assign soc_reader_fifo_rdport_dat_r = storage_14[soc_reader_fifo_rdport_adr];
reg [31:0] mem_6[0:381];
reg [8:0] memadr_10;
reg [8:0] memadr_11;
always @(posedge sys_clk) begin
	memadr_10 <= soc_reader_memory0_adr;
end
always @(posedge sys_clk) begin
	if (soc_sram0_we[0])
		mem_6[soc_sram0_adr1][7:0] <= soc_sram0_dat_w[7:0];
	if (soc_sram0_we[1])
		mem_6[soc_sram0_adr1][15:8] <= soc_sram0_dat_w[15:8];
	if (soc_sram0_we[2])
		mem_6[soc_sram0_adr1][23:16] <= soc_sram0_dat_w[23:16];
	if (soc_sram0_we[3])
		mem_6[soc_sram0_adr1][31:24] <= soc_sram0_dat_w[31:24];
	memadr_11 <= soc_sram0_adr1;
end
assign soc_reader_memory0_dat_r = mem_6[memadr_10];
assign soc_sram0_dat_r1 = mem_6[memadr_11];
reg [31:0] mem_7[0:381];
reg [8:0] memadr_12;
reg [8:0] memadr_13;
always @(posedge sys_clk) begin
	memadr_12 <= soc_reader_memory1_adr;
end
always @(posedge sys_clk) begin
	if (soc_sram1_we[0])
		mem_7[soc_sram1_adr1][7:0] <= soc_sram1_dat_w[7:0];
	if (soc_sram1_we[1])
		mem_7[soc_sram1_adr1][15:8] <= soc_sram1_dat_w[15:8];
	if (soc_sram1_we[2])
		mem_7[soc_sram1_adr1][23:16] <= soc_sram1_dat_w[23:16];
	if (soc_sram1_we[3])
		mem_7[soc_sram1_adr1][31:24] <= soc_sram1_dat_w[31:24];
	memadr_13 <= soc_sram1_adr1;
end
assign soc_reader_memory1_dat_r = mem_7[memadr_12];
assign soc_sram1_dat_r1 = mem_7[memadr_13];
VexRiscv VexRiscv(
	.clk(sys_clk),
	.dBusWishbone_ACK(soc_netsoc_cpu_dbus_ack),
	.dBusWishbone_DAT_MISO(soc_netsoc_cpu_dbus_dat_r),
	.dBusWishbone_ERR(soc_netsoc_cpu_dbus_err),
	.externalInterruptArray(soc_netsoc_cpu_interrupt0),
	.externalResetVector(1'd0),
	.iBusWishbone_ACK(soc_netsoc_cpu_ibus_ack),
	.iBusWishbone_DAT_MISO(soc_netsoc_cpu_ibus_dat_r),
	.iBusWishbone_ERR(soc_netsoc_cpu_ibus_err),
	.reset((sys_rst | soc_netsoc_cpu_reset)),
	.softwareInterrupt(1'd0),
	.timerInterrupt(soc_netsoc_cpu_interrupt1),
	.dBusWishbone_ADR(soc_netsoc_cpu_dbus_adr),
	.dBusWishbone_BTE(soc_netsoc_cpu_dbus_bte),
	.dBusWishbone_CTI(soc_netsoc_cpu_dbus_cti),
	.dBusWishbone_CYC(soc_netsoc_cpu_dbus_cyc),
	.dBusWishbone_DAT_MOSI(soc_netsoc_cpu_dbus_dat_w),
	.dBusWishbone_SEL(soc_netsoc_cpu_dbus_sel),
	.dBusWishbone_STB(soc_netsoc_cpu_dbus_stb),
	.dBusWishbone_WE(soc_netsoc_cpu_dbus_we),
	.iBusWishbone_ADR(soc_netsoc_cpu_ibus_adr),
	.iBusWishbone_BTE(soc_netsoc_cpu_ibus_bte),
	.iBusWishbone_CTI(soc_netsoc_cpu_ibus_cti),
	.iBusWishbone_CYC(soc_netsoc_cpu_ibus_cyc),
	.iBusWishbone_DAT_MOSI(soc_netsoc_cpu_ibus_dat_w),
	.iBusWishbone_SEL(soc_netsoc_cpu_ibus_sel),
	.iBusWishbone_STB(soc_netsoc_cpu_ibus_stb),
	.iBusWishbone_WE(soc_netsoc_cpu_ibus_we)
);
reg [7:0] data_mem_grain0[0:511];
reg [8:0] memadr_14;
always @(posedge sys_clk) begin
	if (soc_netsoc_data_port_we[0])
		data_mem_grain0[soc_netsoc_data_port_adr] <= soc_netsoc_data_port_dat_w[7:0];
	memadr_14 <= soc_netsoc_data_port_adr;
end
assign soc_netsoc_data_port_dat_r[7:0] = data_mem_grain0[memadr_14];
reg [7:0] data_mem_grain1[0:511];
reg [8:0] memadr_15;
always @(posedge sys_clk) begin
	if (soc_netsoc_data_port_we[1])
		data_mem_grain1[soc_netsoc_data_port_adr] <= soc_netsoc_data_port_dat_w[15:8];
	memadr_15 <= soc_netsoc_data_port_adr;
end
assign soc_netsoc_data_port_dat_r[15:8] = data_mem_grain1[memadr_15];
reg [7:0] data_mem_grain2[0:511];
reg [8:0] memadr_16;
always @(posedge sys_clk) begin
	if (soc_netsoc_data_port_we[2])
		data_mem_grain2[soc_netsoc_data_port_adr] <= soc_netsoc_data_port_dat_w[23:16];
	memadr_16 <= soc_netsoc_data_port_adr;
end
assign soc_netsoc_data_port_dat_r[23:16] = data_mem_grain2[memadr_16];
reg [7:0] data_mem_grain3[0:511];
reg [8:0] memadr_17;
always @(posedge sys_clk) begin
	if (soc_netsoc_data_port_we[3])
		data_mem_grain3[soc_netsoc_data_port_adr] <= soc_netsoc_data_port_dat_w[31:24];
	memadr_17 <= soc_netsoc_data_port_adr;
end
assign soc_netsoc_data_port_dat_r[31:24] = data_mem_grain3[memadr_17];
reg [7:0] data_mem_grain4[0:511];
reg [8:0] memadr_18;
always @(posedge sys_clk) begin
	if (soc_netsoc_data_port_we[4])
		data_mem_grain4[soc_netsoc_data_port_adr] <= soc_netsoc_data_port_dat_w[39:32];
	memadr_18 <= soc_netsoc_data_port_adr;
end
assign soc_netsoc_data_port_dat_r[39:32] = data_mem_grain4[memadr_18];
reg [7:0] data_mem_grain5[0:511];
reg [8:0] memadr_19;
always @(posedge sys_clk) begin
	if (soc_netsoc_data_port_we[5])
		data_mem_grain5[soc_netsoc_data_port_adr] <= soc_netsoc_data_port_dat_w[47:40];
	memadr_19 <= soc_netsoc_data_port_adr;
end
assign soc_netsoc_data_port_dat_r[47:40] = data_mem_grain5[memadr_19];
reg [7:0] data_mem_grain6[0:511];
reg [8:0] memadr_20;
always @(posedge sys_clk) begin
	if (soc_netsoc_data_port_we[6])
		data_mem_grain6[soc_netsoc_data_port_adr] <= soc_netsoc_data_port_dat_w[55:48];
	memadr_20 <= soc_netsoc_data_port_adr;
end
assign soc_netsoc_data_port_dat_r[55:48] = data_mem_grain6[memadr_20];
reg [7:0] data_mem_grain7[0:511];
reg [8:0] memadr_21;
always @(posedge sys_clk) begin
	if (soc_netsoc_data_port_we[7])
		data_mem_grain7[soc_netsoc_data_port_adr] <= soc_netsoc_data_port_dat_w[63:56];
	memadr_21 <= soc_netsoc_data_port_adr;
end
assign soc_netsoc_data_port_dat_r[63:56] = data_mem_grain7[memadr_21];
reg [7:0] data_mem_grain8[0:511];
reg [8:0] memadr_22;
always @(posedge sys_clk) begin
	if (soc_netsoc_data_port_we[8])
		data_mem_grain8[soc_netsoc_data_port_adr] <= soc_netsoc_data_port_dat_w[71:64];
	memadr_22 <= soc_netsoc_data_port_adr;
end
assign soc_netsoc_data_port_dat_r[71:64] = data_mem_grain8[memadr_22];
reg [7:0] data_mem_grain9[0:511];
reg [8:0] memadr_23;
always @(posedge sys_clk) begin
	if (soc_netsoc_data_port_we[9])
		data_mem_grain9[soc_netsoc_data_port_adr] <= soc_netsoc_data_port_dat_w[79:72];
	memadr_23 <= soc_netsoc_data_port_adr;
end
assign soc_netsoc_data_port_dat_r[79:72] = data_mem_grain9[memadr_23];
reg [7:0] data_mem_grain10[0:511];
reg [8:0] memadr_24;
always @(posedge sys_clk) begin
	if (soc_netsoc_data_port_we[10])
		data_mem_grain10[soc_netsoc_data_port_adr] <= soc_netsoc_data_port_dat_w[87:80];
	memadr_24 <= soc_netsoc_data_port_adr;
end
assign soc_netsoc_data_port_dat_r[87:80] = data_mem_grain10[memadr_24];
reg [7:0] data_mem_grain11[0:511];
reg [8:0] memadr_25;
always @(posedge sys_clk) begin
	if (soc_netsoc_data_port_we[11])
		data_mem_grain11[soc_netsoc_data_port_adr] <= soc_netsoc_data_port_dat_w[95:88];
	memadr_25 <= soc_netsoc_data_port_adr;
end
assign soc_netsoc_data_port_dat_r[95:88] = data_mem_grain11[memadr_25];
reg [7:0] data_mem_grain12[0:511];
reg [8:0] memadr_26;
always @(posedge sys_clk) begin
	if (soc_netsoc_data_port_we[12])
		data_mem_grain12[soc_netsoc_data_port_adr] <= soc_netsoc_data_port_dat_w[103:96];
	memadr_26 <= soc_netsoc_data_port_adr;
end
assign soc_netsoc_data_port_dat_r[103:96] = data_mem_grain12[memadr_26];
reg [7:0] data_mem_grain13[0:511];
reg [8:0] memadr_27;
always @(posedge sys_clk) begin
	if (soc_netsoc_data_port_we[13])
		data_mem_grain13[soc_netsoc_data_port_adr] <= soc_netsoc_data_port_dat_w[111:104];
	memadr_27 <= soc_netsoc_data_port_adr;
end
assign soc_netsoc_data_port_dat_r[111:104] = data_mem_grain13[memadr_27];
reg [7:0] data_mem_grain14[0:511];
reg [8:0] memadr_28;
always @(posedge sys_clk) begin
	if (soc_netsoc_data_port_we[14])
		data_mem_grain14[soc_netsoc_data_port_adr] <= soc_netsoc_data_port_dat_w[119:112];
	memadr_28 <= soc_netsoc_data_port_adr;
end
assign soc_netsoc_data_port_dat_r[119:112] = data_mem_grain14[memadr_28];
reg [7:0] data_mem_grain15[0:511];
reg [8:0] memadr_29;
always @(posedge sys_clk) begin
	if (soc_netsoc_data_port_we[15])
		data_mem_grain15[soc_netsoc_data_port_adr] <= soc_netsoc_data_port_dat_w[127:120];
	memadr_29 <= soc_netsoc_data_port_adr;
end
assign soc_netsoc_data_port_dat_r[127:120] = data_mem_grain15[memadr_29];
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
	.C(eth_tx_clk),
	.CE(1'd1),
	.D(1'd0),
	.PRE(soc_reset0),
	.Q(vns_xilinxasyncresetsynchronizerimpl2_rst_meta)
);
(* ars_ff2 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_5 (
	.C(eth_tx_clk),
	.CE(1'd1),
	.D(vns_xilinxasyncresetsynchronizerimpl2_rst_meta),
	.PRE(soc_reset0),
	.Q(eth_tx_rst)
);
(* ars_ff1 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_6 (
	.C(eth_rx_clk),
	.CE(1'd1),
	.D(1'd0),
	.PRE(soc_reset0),
	.Q(vns_xilinxasyncresetsynchronizerimpl3_rst_meta)
);
(* ars_ff2 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_7 (
	.C(eth_rx_clk),
	.CE(1'd1),
	.D(vns_xilinxasyncresetsynchronizerimpl3_rst_meta),
	.PRE(soc_reset0),
	.Q(eth_rx_rst)
);
endmodule