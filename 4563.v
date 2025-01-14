module top(
	output reg serial_tx,
	input serial_rx,
	input cpu_reset,
	input clk100
);
wire ctrl_reset_reset_re;
wire ctrl_reset_reset_r;
wire ctrl_reset_reset_we;
reg ctrl_reset_reset_w = 1'd0;
reg [31:0] ctrl_storage = 32'd305419896;
reg ctrl_re = 1'd0;
wire [31:0] ctrl_bus_errors_status;
wire ctrl_bus_errors_we;
wire ctrl_reset;
wire ctrl_bus_error;
reg [31:0] ctrl_bus_errors = 32'd0;
wire vexriscv_reset;
wire [29:0] vexriscv_ibus_adr;
wire [31:0] vexriscv_ibus_dat_w;
wire [31:0] vexriscv_ibus_dat_r;
wire [3:0] vexriscv_ibus_sel;
wire vexriscv_ibus_cyc;
wire vexriscv_ibus_stb;
wire vexriscv_ibus_ack;
wire vexriscv_ibus_we;
wire [2:0] vexriscv_ibus_cti;
wire [1:0] vexriscv_ibus_bte;
wire vexriscv_ibus_err;
wire [29:0] vexriscv_dbus_adr;
wire [31:0] vexriscv_dbus_dat_w;
wire [31:0] vexriscv_dbus_dat_r;
wire [3:0] vexriscv_dbus_sel;
wire vexriscv_dbus_cyc;
wire vexriscv_dbus_stb;
wire vexriscv_dbus_ack;
wire vexriscv_dbus_we;
wire [2:0] vexriscv_dbus_cti;
wire [1:0] vexriscv_dbus_bte;
wire vexriscv_dbus_err;
reg [31:0] vexriscv_interrupt = 32'd0;
wire [29:0] interface0_soc_bus_adr;
wire [31:0] interface0_soc_bus_dat_w;
wire [31:0] interface0_soc_bus_dat_r;
wire [3:0] interface0_soc_bus_sel;
wire interface0_soc_bus_cyc;
wire interface0_soc_bus_stb;
wire interface0_soc_bus_ack;
wire interface0_soc_bus_we;
wire [2:0] interface0_soc_bus_cti;
wire [1:0] interface0_soc_bus_bte;
wire interface0_soc_bus_err;
wire [29:0] interface1_soc_bus_adr;
wire [31:0] interface1_soc_bus_dat_w;
wire [31:0] interface1_soc_bus_dat_r;
wire [3:0] interface1_soc_bus_sel;
wire interface1_soc_bus_cyc;
wire interface1_soc_bus_stb;
wire interface1_soc_bus_ack;
wire interface1_soc_bus_we;
wire [2:0] interface1_soc_bus_cti;
wire [1:0] interface1_soc_bus_bte;
wire interface1_soc_bus_err;
wire [29:0] rom_bus_adr;
wire [31:0] rom_bus_dat_w;
wire [31:0] rom_bus_dat_r;
wire [3:0] rom_bus_sel;
wire rom_bus_cyc;
wire rom_bus_stb;
reg rom_bus_ack = 1'd0;
wire rom_bus_we;
wire [2:0] rom_bus_cti;
wire [1:0] rom_bus_bte;
reg rom_bus_err = 1'd0;
wire [12:0] rom_adr;
wire [31:0] rom_dat_r;
wire [29:0] sram_bus_adr;
wire [31:0] sram_bus_dat_w;
wire [31:0] sram_bus_dat_r;
wire [3:0] sram_bus_sel;
wire sram_bus_cyc;
wire sram_bus_stb;
reg sram_bus_ack = 1'd0;
wire sram_bus_we;
wire [2:0] sram_bus_cti;
wire [1:0] sram_bus_bte;
reg sram_bus_err = 1'd0;
wire [12:0] sram_adr;
wire [31:0] sram_dat_r;
reg [3:0] sram_we = 4'd0;
wire [31:0] sram_dat_w;
reg [31:0] uart_phy_storage = 32'd4947802;
reg uart_phy_re = 1'd0;
wire uart_phy_sink_valid;
reg uart_phy_sink_ready = 1'd0;
wire uart_phy_sink_first;
wire uart_phy_sink_last;
wire [7:0] uart_phy_sink_payload_data;
reg uart_phy_uart_clk_txen = 1'd0;
reg [31:0] uart_phy_phase_accumulator_tx = 32'd0;
reg [7:0] uart_phy_tx_reg = 8'd0;
reg [3:0] uart_phy_tx_bitcount = 4'd0;
reg uart_phy_tx_busy = 1'd0;
reg uart_phy_source_valid = 1'd0;
wire uart_phy_source_ready;
reg uart_phy_source_first = 1'd0;
reg uart_phy_source_last = 1'd0;
reg [7:0] uart_phy_source_payload_data = 8'd0;
reg uart_phy_uart_clk_rxen = 1'd0;
reg [31:0] uart_phy_phase_accumulator_rx = 32'd0;
wire uart_phy_rx;
reg uart_phy_rx_r = 1'd0;
reg [7:0] uart_phy_rx_reg = 8'd0;
reg [3:0] uart_phy_rx_bitcount = 4'd0;
reg uart_phy_rx_busy = 1'd0;
wire uart_rxtx_re;
wire [7:0] uart_rxtx_r;
wire uart_rxtx_we;
wire [7:0] uart_rxtx_w;
wire uart_txfull_status;
wire uart_txfull_we;
wire uart_rxempty_status;
wire uart_rxempty_we;
wire uart_irq;
wire uart_tx_status;
reg uart_tx_pending = 1'd0;
wire uart_tx_trigger;
reg uart_tx_clear = 1'd0;
reg uart_tx_old_trigger = 1'd0;
wire uart_rx_status;
reg uart_rx_pending = 1'd0;
wire uart_rx_trigger;
reg uart_rx_clear = 1'd0;
reg uart_rx_old_trigger = 1'd0;
wire uart_eventmanager_status_re;
wire [1:0] uart_eventmanager_status_r;
wire uart_eventmanager_status_we;
reg [1:0] uart_eventmanager_status_w = 2'd0;
wire uart_eventmanager_pending_re;
wire [1:0] uart_eventmanager_pending_r;
wire uart_eventmanager_pending_we;
reg [1:0] uart_eventmanager_pending_w = 2'd0;
reg [1:0] uart_eventmanager_storage = 2'd0;
reg uart_eventmanager_re = 1'd0;
wire uart_tx_fifo_sink_valid;
wire uart_tx_fifo_sink_ready;
reg uart_tx_fifo_sink_first = 1'd0;
reg uart_tx_fifo_sink_last = 1'd0;
wire [7:0] uart_tx_fifo_sink_payload_data;
wire uart_tx_fifo_source_valid;
wire uart_tx_fifo_source_ready;
wire uart_tx_fifo_source_first;
wire uart_tx_fifo_source_last;
wire [7:0] uart_tx_fifo_source_payload_data;
wire uart_tx_fifo_re;
reg uart_tx_fifo_readable = 1'd0;
wire uart_tx_fifo_syncfifo_we;
wire uart_tx_fifo_syncfifo_writable;
wire uart_tx_fifo_syncfifo_re;
wire uart_tx_fifo_syncfifo_readable;
wire [9:0] uart_tx_fifo_syncfifo_din;
wire [9:0] uart_tx_fifo_syncfifo_dout;
reg [4:0] uart_tx_fifo_level0 = 5'd0;
reg uart_tx_fifo_replace = 1'd0;
reg [3:0] uart_tx_fifo_produce = 4'd0;
reg [3:0] uart_tx_fifo_consume = 4'd0;
reg [3:0] uart_tx_fifo_wrport_adr = 4'd0;
wire [9:0] uart_tx_fifo_wrport_dat_r;
wire uart_tx_fifo_wrport_we;
wire [9:0] uart_tx_fifo_wrport_dat_w;
wire uart_tx_fifo_do_read;
wire [3:0] uart_tx_fifo_rdport_adr;
wire [9:0] uart_tx_fifo_rdport_dat_r;
wire uart_tx_fifo_rdport_re;
wire [4:0] uart_tx_fifo_level1;
wire [7:0] uart_tx_fifo_fifo_in_payload_data;
wire uart_tx_fifo_fifo_in_first;
wire uart_tx_fifo_fifo_in_last;
wire [7:0] uart_tx_fifo_fifo_out_payload_data;
wire uart_tx_fifo_fifo_out_first;
wire uart_tx_fifo_fifo_out_last;
wire uart_rx_fifo_sink_valid;
wire uart_rx_fifo_sink_ready;
wire uart_rx_fifo_sink_first;
wire uart_rx_fifo_sink_last;
wire [7:0] uart_rx_fifo_sink_payload_data;
wire uart_rx_fifo_source_valid;
wire uart_rx_fifo_source_ready;
wire uart_rx_fifo_source_first;
wire uart_rx_fifo_source_last;
wire [7:0] uart_rx_fifo_source_payload_data;
wire uart_rx_fifo_re;
reg uart_rx_fifo_readable = 1'd0;
wire uart_rx_fifo_syncfifo_we;
wire uart_rx_fifo_syncfifo_writable;
wire uart_rx_fifo_syncfifo_re;
wire uart_rx_fifo_syncfifo_readable;
wire [9:0] uart_rx_fifo_syncfifo_din;
wire [9:0] uart_rx_fifo_syncfifo_dout;
reg [4:0] uart_rx_fifo_level0 = 5'd0;
reg uart_rx_fifo_replace = 1'd0;
reg [3:0] uart_rx_fifo_produce = 4'd0;
reg [3:0] uart_rx_fifo_consume = 4'd0;
reg [3:0] uart_rx_fifo_wrport_adr = 4'd0;
wire [9:0] uart_rx_fifo_wrport_dat_r;
wire uart_rx_fifo_wrport_we;
wire [9:0] uart_rx_fifo_wrport_dat_w;
wire uart_rx_fifo_do_read;
wire [3:0] uart_rx_fifo_rdport_adr;
wire [9:0] uart_rx_fifo_rdport_dat_r;
wire uart_rx_fifo_rdport_re;
wire [4:0] uart_rx_fifo_level1;
wire [7:0] uart_rx_fifo_fifo_in_payload_data;
wire uart_rx_fifo_fifo_in_first;
wire uart_rx_fifo_fifo_in_last;
wire [7:0] uart_rx_fifo_fifo_out_payload_data;
wire uart_rx_fifo_fifo_out_first;
wire uart_rx_fifo_fifo_out_last;
reg uart_reset = 1'd0;
reg [31:0] timer0_load_storage = 32'd0;
reg timer0_load_re = 1'd0;
reg [31:0] timer0_reload_storage = 32'd0;
reg timer0_reload_re = 1'd0;
reg timer0_en_storage = 1'd0;
reg timer0_en_re = 1'd0;
reg timer0_update_value_storage = 1'd0;
reg timer0_update_value_re = 1'd0;
reg [31:0] timer0_value_status = 32'd0;
wire timer0_value_we;
wire timer0_irq;
wire timer0_zero_status;
reg timer0_zero_pending = 1'd0;
wire timer0_zero_trigger;
reg timer0_zero_clear = 1'd0;
reg timer0_zero_old_trigger = 1'd0;
wire timer0_eventmanager_status_re;
wire timer0_eventmanager_status_r;
wire timer0_eventmanager_status_we;
wire timer0_eventmanager_status_w;
wire timer0_eventmanager_pending_re;
wire timer0_eventmanager_pending_r;
wire timer0_eventmanager_pending_we;
wire timer0_eventmanager_pending_w;
reg timer0_eventmanager_storage = 1'd0;
reg timer0_eventmanager_re = 1'd0;
reg [31:0] timer0_value = 32'd0;
reg [13:0] interface_adr = 14'd0;
reg interface_we = 1'd0;
wire [7:0] interface_dat_w;
wire [7:0] interface_dat_r;
wire [29:0] bus_wishbone_adr;
wire [31:0] bus_wishbone_dat_w;
wire [31:0] bus_wishbone_dat_r;
wire [3:0] bus_wishbone_sel;
wire bus_wishbone_cyc;
wire bus_wishbone_stb;
reg bus_wishbone_ack = 1'd0;
wire bus_wishbone_we;
wire [2:0] bus_wishbone_cti;
wire [1:0] bus_wishbone_bte;
reg bus_wishbone_err = 1'd0;
(* dont_touch = "true" *) wire sys_clk;
wire sys_rst;
wire reset;
wire locked;
wire clkin;
wire clkout;
wire clkout_buf;
reg state = 1'd0;
reg next_state = 1'd0;
wire pll_fb;
wire [29:0] shared_adr;
wire [31:0] shared_dat_w;
reg [31:0] shared_dat_r = 32'd0;
wire [3:0] shared_sel;
wire shared_cyc;
wire shared_stb;
reg shared_ack = 1'd0;
wire shared_we;
wire [2:0] shared_cti;
wire [1:0] shared_bte;
wire shared_err;
wire [1:0] request;
reg grant = 1'd0;
reg [2:0] slave_sel = 3'd0;
reg [2:0] slave_sel_r = 3'd0;
reg error = 1'd0;
wire wait_1;
wire done;
reg [19:0] count = 20'd1000000;
wire [13:0] csrbankarray_interface0_bank_bus_adr;
wire csrbankarray_interface0_bank_bus_we;
wire [7:0] csrbankarray_interface0_bank_bus_dat_w;
reg [7:0] csrbankarray_interface0_bank_bus_dat_r = 8'd0;
wire csrbankarray_csrbank0_scratch3_re;
wire [7:0] csrbankarray_csrbank0_scratch3_r;
wire csrbankarray_csrbank0_scratch3_we;
wire [7:0] csrbankarray_csrbank0_scratch3_w;
wire csrbankarray_csrbank0_scratch2_re;
wire [7:0] csrbankarray_csrbank0_scratch2_r;
wire csrbankarray_csrbank0_scratch2_we;
wire [7:0] csrbankarray_csrbank0_scratch2_w;
wire csrbankarray_csrbank0_scratch1_re;
wire [7:0] csrbankarray_csrbank0_scratch1_r;
wire csrbankarray_csrbank0_scratch1_we;
wire [7:0] csrbankarray_csrbank0_scratch1_w;
wire csrbankarray_csrbank0_scratch0_re;
wire [7:0] csrbankarray_csrbank0_scratch0_r;
wire csrbankarray_csrbank0_scratch0_we;
wire [7:0] csrbankarray_csrbank0_scratch0_w;
wire csrbankarray_csrbank0_bus_errors3_re;
wire [7:0] csrbankarray_csrbank0_bus_errors3_r;
wire csrbankarray_csrbank0_bus_errors3_we;
wire [7:0] csrbankarray_csrbank0_bus_errors3_w;
wire csrbankarray_csrbank0_bus_errors2_re;
wire [7:0] csrbankarray_csrbank0_bus_errors2_r;
wire csrbankarray_csrbank0_bus_errors2_we;
wire [7:0] csrbankarray_csrbank0_bus_errors2_w;
wire csrbankarray_csrbank0_bus_errors1_re;
wire [7:0] csrbankarray_csrbank0_bus_errors1_r;
wire csrbankarray_csrbank0_bus_errors1_we;
wire [7:0] csrbankarray_csrbank0_bus_errors1_w;
wire csrbankarray_csrbank0_bus_errors0_re;
wire [7:0] csrbankarray_csrbank0_bus_errors0_r;
wire csrbankarray_csrbank0_bus_errors0_we;
wire [7:0] csrbankarray_csrbank0_bus_errors0_w;
wire csrbankarray_csrbank0_sel;
wire [13:0] csrbankarray_sram_bus_adr;
wire csrbankarray_sram_bus_we;
wire [7:0] csrbankarray_sram_bus_dat_w;
reg [7:0] csrbankarray_sram_bus_dat_r = 8'd0;
wire [3:0] csrbankarray_adr;
wire [7:0] csrbankarray_dat_r;
wire csrbankarray_sel;
reg csrbankarray_sel_r = 1'd0;
wire [13:0] csrbankarray_interface1_bank_bus_adr;
wire csrbankarray_interface1_bank_bus_we;
wire [7:0] csrbankarray_interface1_bank_bus_dat_w;
reg [7:0] csrbankarray_interface1_bank_bus_dat_r = 8'd0;
wire csrbankarray_csrbank1_load3_re;
wire [7:0] csrbankarray_csrbank1_load3_r;
wire csrbankarray_csrbank1_load3_we;
wire [7:0] csrbankarray_csrbank1_load3_w;
wire csrbankarray_csrbank1_load2_re;
wire [7:0] csrbankarray_csrbank1_load2_r;
wire csrbankarray_csrbank1_load2_we;
wire [7:0] csrbankarray_csrbank1_load2_w;
wire csrbankarray_csrbank1_load1_re;
wire [7:0] csrbankarray_csrbank1_load1_r;
wire csrbankarray_csrbank1_load1_we;
wire [7:0] csrbankarray_csrbank1_load1_w;
wire csrbankarray_csrbank1_load0_re;
wire [7:0] csrbankarray_csrbank1_load0_r;
wire csrbankarray_csrbank1_load0_we;
wire [7:0] csrbankarray_csrbank1_load0_w;
wire csrbankarray_csrbank1_reload3_re;
wire [7:0] csrbankarray_csrbank1_reload3_r;
wire csrbankarray_csrbank1_reload3_we;
wire [7:0] csrbankarray_csrbank1_reload3_w;
wire csrbankarray_csrbank1_reload2_re;
wire [7:0] csrbankarray_csrbank1_reload2_r;
wire csrbankarray_csrbank1_reload2_we;
wire [7:0] csrbankarray_csrbank1_reload2_w;
wire csrbankarray_csrbank1_reload1_re;
wire [7:0] csrbankarray_csrbank1_reload1_r;
wire csrbankarray_csrbank1_reload1_we;
wire [7:0] csrbankarray_csrbank1_reload1_w;
wire csrbankarray_csrbank1_reload0_re;
wire [7:0] csrbankarray_csrbank1_reload0_r;
wire csrbankarray_csrbank1_reload0_we;
wire [7:0] csrbankarray_csrbank1_reload0_w;
wire csrbankarray_csrbank1_en0_re;
wire csrbankarray_csrbank1_en0_r;
wire csrbankarray_csrbank1_en0_we;
wire csrbankarray_csrbank1_en0_w;
wire csrbankarray_csrbank1_update_value0_re;
wire csrbankarray_csrbank1_update_value0_r;
wire csrbankarray_csrbank1_update_value0_we;
wire csrbankarray_csrbank1_update_value0_w;
wire csrbankarray_csrbank1_value3_re;
wire [7:0] csrbankarray_csrbank1_value3_r;
wire csrbankarray_csrbank1_value3_we;
wire [7:0] csrbankarray_csrbank1_value3_w;
wire csrbankarray_csrbank1_value2_re;
wire [7:0] csrbankarray_csrbank1_value2_r;
wire csrbankarray_csrbank1_value2_we;
wire [7:0] csrbankarray_csrbank1_value2_w;
wire csrbankarray_csrbank1_value1_re;
wire [7:0] csrbankarray_csrbank1_value1_r;
wire csrbankarray_csrbank1_value1_we;
wire [7:0] csrbankarray_csrbank1_value1_w;
wire csrbankarray_csrbank1_value0_re;
wire [7:0] csrbankarray_csrbank1_value0_r;
wire csrbankarray_csrbank1_value0_we;
wire [7:0] csrbankarray_csrbank1_value0_w;
wire csrbankarray_csrbank1_ev_enable0_re;
wire csrbankarray_csrbank1_ev_enable0_r;
wire csrbankarray_csrbank1_ev_enable0_we;
wire csrbankarray_csrbank1_ev_enable0_w;
wire csrbankarray_csrbank1_sel;
wire [13:0] csrbankarray_interface2_bank_bus_adr;
wire csrbankarray_interface2_bank_bus_we;
wire [7:0] csrbankarray_interface2_bank_bus_dat_w;
reg [7:0] csrbankarray_interface2_bank_bus_dat_r = 8'd0;
wire csrbankarray_csrbank2_txfull_re;
wire csrbankarray_csrbank2_txfull_r;
wire csrbankarray_csrbank2_txfull_we;
wire csrbankarray_csrbank2_txfull_w;
wire csrbankarray_csrbank2_rxempty_re;
wire csrbankarray_csrbank2_rxempty_r;
wire csrbankarray_csrbank2_rxempty_we;
wire csrbankarray_csrbank2_rxempty_w;
wire csrbankarray_csrbank2_ev_enable0_re;
wire [1:0] csrbankarray_csrbank2_ev_enable0_r;
wire csrbankarray_csrbank2_ev_enable0_we;
wire [1:0] csrbankarray_csrbank2_ev_enable0_w;
wire csrbankarray_csrbank2_sel;
wire [13:0] csrbankarray_interface3_bank_bus_adr;
wire csrbankarray_interface3_bank_bus_we;
wire [7:0] csrbankarray_interface3_bank_bus_dat_w;
reg [7:0] csrbankarray_interface3_bank_bus_dat_r = 8'd0;
wire csrbankarray_csrbank3_tuning_word3_re;
wire [7:0] csrbankarray_csrbank3_tuning_word3_r;
wire csrbankarray_csrbank3_tuning_word3_we;
wire [7:0] csrbankarray_csrbank3_tuning_word3_w;
wire csrbankarray_csrbank3_tuning_word2_re;
wire [7:0] csrbankarray_csrbank3_tuning_word2_r;
wire csrbankarray_csrbank3_tuning_word2_we;
wire [7:0] csrbankarray_csrbank3_tuning_word2_w;
wire csrbankarray_csrbank3_tuning_word1_re;
wire [7:0] csrbankarray_csrbank3_tuning_word1_r;
wire csrbankarray_csrbank3_tuning_word1_we;
wire [7:0] csrbankarray_csrbank3_tuning_word1_w;
wire csrbankarray_csrbank3_tuning_word0_re;
wire [7:0] csrbankarray_csrbank3_tuning_word0_r;
wire csrbankarray_csrbank3_tuning_word0_we;
wire [7:0] csrbankarray_csrbank3_tuning_word0_w;
wire csrbankarray_csrbank3_sel;
wire [13:0] csrcon_adr;
wire csrcon_we;
wire [7:0] csrcon_dat_w;
wire [7:0] csrcon_dat_r;
reg [29:0] array_muxed0 = 30'd0;
reg [31:0] array_muxed1 = 32'd0;
reg [3:0] array_muxed2 = 4'd0;
reg array_muxed3 = 1'd0;
reg array_muxed4 = 1'd0;
reg array_muxed5 = 1'd0;
reg [2:0] array_muxed6 = 3'd0;
reg [1:0] array_muxed7 = 2'd0;
(* async_reg = "true", mr_ff = "true", dont_touch = "true" *) reg regs0 = 1'd0;
(* async_reg = "true", dont_touch = "true" *) reg regs1 = 1'd0;
wire xilinxasyncresetsynchronizerimpl;
wire xilinxasyncresetsynchronizerimpl_rst_meta;
assign vexriscv_reset = ctrl_reset;
assign ctrl_bus_error = error;
always @(*) begin
	vexriscv_interrupt <= 32'd0;
	vexriscv_interrupt[1] <= timer0_irq;
	vexriscv_interrupt[0] <= uart_irq;
end
assign ctrl_reset = ctrl_reset_reset_re;
assign ctrl_bus_errors_status = ctrl_bus_errors;
assign interface0_soc_bus_adr = vexriscv_ibus_adr;
assign interface0_soc_bus_dat_w = vexriscv_ibus_dat_w;
assign vexriscv_ibus_dat_r = interface0_soc_bus_dat_r;
assign interface0_soc_bus_sel = vexriscv_ibus_sel;
assign interface0_soc_bus_cyc = vexriscv_ibus_cyc;
assign interface0_soc_bus_stb = vexriscv_ibus_stb;
assign vexriscv_ibus_ack = interface0_soc_bus_ack;
assign interface0_soc_bus_we = vexriscv_ibus_we;
assign interface0_soc_bus_cti = vexriscv_ibus_cti;
assign interface0_soc_bus_bte = vexriscv_ibus_bte;
assign vexriscv_ibus_err = interface0_soc_bus_err;
assign interface1_soc_bus_adr = vexriscv_dbus_adr;
assign interface1_soc_bus_dat_w = vexriscv_dbus_dat_w;
assign vexriscv_dbus_dat_r = interface1_soc_bus_dat_r;
assign interface1_soc_bus_sel = vexriscv_dbus_sel;
assign interface1_soc_bus_cyc = vexriscv_dbus_cyc;
assign interface1_soc_bus_stb = vexriscv_dbus_stb;
assign vexriscv_dbus_ack = interface1_soc_bus_ack;
assign interface1_soc_bus_we = vexriscv_dbus_we;
assign interface1_soc_bus_cti = vexriscv_dbus_cti;
assign interface1_soc_bus_bte = vexriscv_dbus_bte;
assign vexriscv_dbus_err = interface1_soc_bus_err;
assign rom_adr = rom_bus_adr[12:0];
assign rom_bus_dat_r = rom_dat_r;
always @(*) begin
	sram_we <= 4'd0;
	sram_we[0] <= (((sram_bus_cyc & sram_bus_stb) & sram_bus_we) & sram_bus_sel[0]);
	sram_we[1] <= (((sram_bus_cyc & sram_bus_stb) & sram_bus_we) & sram_bus_sel[1]);
	sram_we[2] <= (((sram_bus_cyc & sram_bus_stb) & sram_bus_we) & sram_bus_sel[2]);
	sram_we[3] <= (((sram_bus_cyc & sram_bus_stb) & sram_bus_we) & sram_bus_sel[3]);
end
assign sram_adr = sram_bus_adr[12:0];
assign sram_bus_dat_r = sram_dat_r;
assign sram_dat_w = sram_bus_dat_w;
assign uart_tx_fifo_sink_valid = uart_rxtx_re;
assign uart_tx_fifo_sink_payload_data = uart_rxtx_r;
assign uart_txfull_status = (~uart_tx_fifo_sink_ready);
assign uart_phy_sink_valid = uart_tx_fifo_source_valid;
assign uart_tx_fifo_source_ready = uart_phy_sink_ready;
assign uart_phy_sink_first = uart_tx_fifo_source_first;
assign uart_phy_sink_last = uart_tx_fifo_source_last;
assign uart_phy_sink_payload_data = uart_tx_fifo_source_payload_data;
assign uart_tx_trigger = (~uart_tx_fifo_sink_ready);
assign uart_rx_fifo_sink_valid = uart_phy_source_valid;
assign uart_phy_source_ready = uart_rx_fifo_sink_ready;
assign uart_rx_fifo_sink_first = uart_phy_source_first;
assign uart_rx_fifo_sink_last = uart_phy_source_last;
assign uart_rx_fifo_sink_payload_data = uart_phy_source_payload_data;
assign uart_rxempty_status = (~uart_rx_fifo_source_valid);
assign uart_rxtx_w = uart_rx_fifo_source_payload_data;
assign uart_rx_fifo_source_ready = uart_rx_clear;
assign uart_rx_trigger = (~uart_rx_fifo_source_valid);
always @(*) begin
	uart_tx_clear <= 1'd0;
	if ((uart_eventmanager_pending_re & uart_eventmanager_pending_r[0])) begin
		uart_tx_clear <= 1'd1;
	end
end
always @(*) begin
	uart_eventmanager_status_w <= 2'd0;
	uart_eventmanager_status_w[0] <= uart_tx_status;
	uart_eventmanager_status_w[1] <= uart_rx_status;
end
always @(*) begin
	uart_rx_clear <= 1'd0;
	if ((uart_eventmanager_pending_re & uart_eventmanager_pending_r[1])) begin
		uart_rx_clear <= 1'd1;
	end
end
always @(*) begin
	uart_eventmanager_pending_w <= 2'd0;
	uart_eventmanager_pending_w[0] <= uart_tx_pending;
	uart_eventmanager_pending_w[1] <= uart_rx_pending;
end
assign uart_irq = ((uart_eventmanager_pending_w[0] & uart_eventmanager_storage[0]) | (uart_eventmanager_pending_w[1] & uart_eventmanager_storage[1]));
assign uart_tx_status = uart_tx_trigger;
assign uart_rx_status = uart_rx_trigger;
assign uart_tx_fifo_syncfifo_din = {uart_tx_fifo_fifo_in_last, uart_tx_fifo_fifo_in_first, uart_tx_fifo_fifo_in_payload_data};
assign {uart_tx_fifo_fifo_out_last, uart_tx_fifo_fifo_out_first, uart_tx_fifo_fifo_out_payload_data} = uart_tx_fifo_syncfifo_dout;
assign uart_tx_fifo_sink_ready = uart_tx_fifo_syncfifo_writable;
assign uart_tx_fifo_syncfifo_we = uart_tx_fifo_sink_valid;
assign uart_tx_fifo_fifo_in_first = uart_tx_fifo_sink_first;
assign uart_tx_fifo_fifo_in_last = uart_tx_fifo_sink_last;
assign uart_tx_fifo_fifo_in_payload_data = uart_tx_fifo_sink_payload_data;
assign uart_tx_fifo_source_valid = uart_tx_fifo_readable;
assign uart_tx_fifo_source_first = uart_tx_fifo_fifo_out_first;
assign uart_tx_fifo_source_last = uart_tx_fifo_fifo_out_last;
assign uart_tx_fifo_source_payload_data = uart_tx_fifo_fifo_out_payload_data;
assign uart_tx_fifo_re = uart_tx_fifo_source_ready;
assign uart_tx_fifo_syncfifo_re = (uart_tx_fifo_syncfifo_readable & ((~uart_tx_fifo_readable) | uart_tx_fifo_re));
assign uart_tx_fifo_level1 = (uart_tx_fifo_level0 + uart_tx_fifo_readable);
always @(*) begin
	uart_tx_fifo_wrport_adr <= 4'd0;
	if (uart_tx_fifo_replace) begin
		uart_tx_fifo_wrport_adr <= (uart_tx_fifo_produce - 1'd1);
	end else begin
		uart_tx_fifo_wrport_adr <= uart_tx_fifo_produce;
	end
end
assign uart_tx_fifo_wrport_dat_w = uart_tx_fifo_syncfifo_din;
assign uart_tx_fifo_wrport_we = (uart_tx_fifo_syncfifo_we & (uart_tx_fifo_syncfifo_writable | uart_tx_fifo_replace));
assign uart_tx_fifo_do_read = (uart_tx_fifo_syncfifo_readable & uart_tx_fifo_syncfifo_re);
assign uart_tx_fifo_rdport_adr = uart_tx_fifo_consume;
assign uart_tx_fifo_syncfifo_dout = uart_tx_fifo_rdport_dat_r;
assign uart_tx_fifo_rdport_re = uart_tx_fifo_do_read;
assign uart_tx_fifo_syncfifo_writable = (uart_tx_fifo_level0 != 5'd16);
assign uart_tx_fifo_syncfifo_readable = (uart_tx_fifo_level0 != 1'd0);
assign uart_rx_fifo_syncfifo_din = {uart_rx_fifo_fifo_in_last, uart_rx_fifo_fifo_in_first, uart_rx_fifo_fifo_in_payload_data};
assign {uart_rx_fifo_fifo_out_last, uart_rx_fifo_fifo_out_first, uart_rx_fifo_fifo_out_payload_data} = uart_rx_fifo_syncfifo_dout;
assign uart_rx_fifo_sink_ready = uart_rx_fifo_syncfifo_writable;
assign uart_rx_fifo_syncfifo_we = uart_rx_fifo_sink_valid;
assign uart_rx_fifo_fifo_in_first = uart_rx_fifo_sink_first;
assign uart_rx_fifo_fifo_in_last = uart_rx_fifo_sink_last;
assign uart_rx_fifo_fifo_in_payload_data = uart_rx_fifo_sink_payload_data;
assign uart_rx_fifo_source_valid = uart_rx_fifo_readable;
assign uart_rx_fifo_source_first = uart_rx_fifo_fifo_out_first;
assign uart_rx_fifo_source_last = uart_rx_fifo_fifo_out_last;
assign uart_rx_fifo_source_payload_data = uart_rx_fifo_fifo_out_payload_data;
assign uart_rx_fifo_re = uart_rx_fifo_source_ready;
assign uart_rx_fifo_syncfifo_re = (uart_rx_fifo_syncfifo_readable & ((~uart_rx_fifo_readable) | uart_rx_fifo_re));
assign uart_rx_fifo_level1 = (uart_rx_fifo_level0 + uart_rx_fifo_readable);
always @(*) begin
	uart_rx_fifo_wrport_adr <= 4'd0;
	if (uart_rx_fifo_replace) begin
		uart_rx_fifo_wrport_adr <= (uart_rx_fifo_produce - 1'd1);
	end else begin
		uart_rx_fifo_wrport_adr <= uart_rx_fifo_produce;
	end
end
assign uart_rx_fifo_wrport_dat_w = uart_rx_fifo_syncfifo_din;
assign uart_rx_fifo_wrport_we = (uart_rx_fifo_syncfifo_we & (uart_rx_fifo_syncfifo_writable | uart_rx_fifo_replace));
assign uart_rx_fifo_do_read = (uart_rx_fifo_syncfifo_readable & uart_rx_fifo_syncfifo_re);
assign uart_rx_fifo_rdport_adr = uart_rx_fifo_consume;
assign uart_rx_fifo_syncfifo_dout = uart_rx_fifo_rdport_dat_r;
assign uart_rx_fifo_rdport_re = uart_rx_fifo_do_read;
assign uart_rx_fifo_syncfifo_writable = (uart_rx_fifo_level0 != 5'd16);
assign uart_rx_fifo_syncfifo_readable = (uart_rx_fifo_level0 != 1'd0);
assign timer0_zero_trigger = (timer0_value != 1'd0);
assign timer0_eventmanager_status_w = timer0_zero_status;
always @(*) begin
	timer0_zero_clear <= 1'd0;
	if ((timer0_eventmanager_pending_re & timer0_eventmanager_pending_r)) begin
		timer0_zero_clear <= 1'd1;
	end
end
assign timer0_eventmanager_pending_w = timer0_zero_pending;
assign timer0_irq = (timer0_eventmanager_pending_w & timer0_eventmanager_storage);
assign timer0_zero_status = timer0_zero_trigger;
assign interface_dat_w = bus_wishbone_dat_w;
assign bus_wishbone_dat_r = interface_dat_r;
always @(*) begin
	next_state <= 1'd0;
	interface_adr <= 14'd0;
	interface_we <= 1'd0;
	bus_wishbone_ack <= 1'd0;
	next_state <= state;
	case (state)
		1'd1: begin
			bus_wishbone_ack <= 1'd1;
			next_state <= 1'd0;
		end
		default: begin
			if ((bus_wishbone_cyc & bus_wishbone_stb)) begin
				interface_adr <= bus_wishbone_adr;
				interface_we <= bus_wishbone_we;
				next_state <= 1'd1;
			end
		end
	endcase
end
assign reset = (~cpu_reset);
assign sys_clk = clkout_buf;
assign shared_adr = array_muxed0;
assign shared_dat_w = array_muxed1;
assign shared_sel = array_muxed2;
assign shared_cyc = array_muxed3;
assign shared_stb = array_muxed4;
assign shared_we = array_muxed5;
assign shared_cti = array_muxed6;
assign shared_bte = array_muxed7;
assign interface0_soc_bus_dat_r = shared_dat_r;
assign interface1_soc_bus_dat_r = shared_dat_r;
assign interface0_soc_bus_ack = (shared_ack & (grant == 1'd0));
assign interface1_soc_bus_ack = (shared_ack & (grant == 1'd1));
assign interface0_soc_bus_err = (shared_err & (grant == 1'd0));
assign interface1_soc_bus_err = (shared_err & (grant == 1'd1));
assign request = {interface1_soc_bus_cyc, interface0_soc_bus_cyc};
always @(*) begin
	slave_sel <= 3'd0;
	slave_sel[0] <= (shared_adr[28:13] == 1'd0);
	slave_sel[1] <= (shared_adr[28:13] == 10'd512);
	slave_sel[2] <= (shared_adr[28:22] == 2'd2);
end
assign rom_bus_adr = shared_adr;
assign rom_bus_dat_w = shared_dat_w;
assign rom_bus_sel = shared_sel;
assign rom_bus_stb = shared_stb;
assign rom_bus_we = shared_we;
assign rom_bus_cti = shared_cti;
assign rom_bus_bte = shared_bte;
assign sram_bus_adr = shared_adr;
assign sram_bus_dat_w = shared_dat_w;
assign sram_bus_sel = shared_sel;
assign sram_bus_stb = shared_stb;
assign sram_bus_we = shared_we;
assign sram_bus_cti = shared_cti;
assign sram_bus_bte = shared_bte;
assign bus_wishbone_adr = shared_adr;
assign bus_wishbone_dat_w = shared_dat_w;
assign bus_wishbone_sel = shared_sel;
assign bus_wishbone_stb = shared_stb;
assign bus_wishbone_we = shared_we;
assign bus_wishbone_cti = shared_cti;
assign bus_wishbone_bte = shared_bte;
assign rom_bus_cyc = (shared_cyc & slave_sel[0]);
assign sram_bus_cyc = (shared_cyc & slave_sel[1]);
assign bus_wishbone_cyc = (shared_cyc & slave_sel[2]);
assign shared_err = ((rom_bus_err | sram_bus_err) | bus_wishbone_err);
assign wait_1 = ((shared_stb & shared_cyc) & (~shared_ack));
always @(*) begin
	shared_ack <= 1'd0;
	error <= 1'd0;
	shared_dat_r <= 32'd0;
	shared_ack <= ((rom_bus_ack | sram_bus_ack) | bus_wishbone_ack);
	shared_dat_r <= ((({32{slave_sel_r[0]}} & rom_bus_dat_r) | ({32{slave_sel_r[1]}} & sram_bus_dat_r)) | ({32{slave_sel_r[2]}} & bus_wishbone_dat_r));
	if (done) begin
		shared_dat_r <= 32'd4294967295;
		shared_ack <= 1'd1;
		error <= 1'd1;
	end
end
assign done = (count == 1'd0);
assign csrbankarray_csrbank0_sel = (csrbankarray_interface0_bank_bus_adr[13:9] == 1'd0);
assign ctrl_reset_reset_r = csrbankarray_interface0_bank_bus_dat_w[0];
assign ctrl_reset_reset_re = ((csrbankarray_csrbank0_sel & csrbankarray_interface0_bank_bus_we) & (csrbankarray_interface0_bank_bus_adr[3:0] == 1'd0));
assign ctrl_reset_reset_we = ((csrbankarray_csrbank0_sel & (~csrbankarray_interface0_bank_bus_we)) & (csrbankarray_interface0_bank_bus_adr[3:0] == 1'd0));
assign csrbankarray_csrbank0_scratch3_r = csrbankarray_interface0_bank_bus_dat_w[7:0];
assign csrbankarray_csrbank0_scratch3_re = ((csrbankarray_csrbank0_sel & csrbankarray_interface0_bank_bus_we) & (csrbankarray_interface0_bank_bus_adr[3:0] == 1'd1));
assign csrbankarray_csrbank0_scratch3_we = ((csrbankarray_csrbank0_sel & (~csrbankarray_interface0_bank_bus_we)) & (csrbankarray_interface0_bank_bus_adr[3:0] == 1'd1));
assign csrbankarray_csrbank0_scratch2_r = csrbankarray_interface0_bank_bus_dat_w[7:0];
assign csrbankarray_csrbank0_scratch2_re = ((csrbankarray_csrbank0_sel & csrbankarray_interface0_bank_bus_we) & (csrbankarray_interface0_bank_bus_adr[3:0] == 2'd2));
assign csrbankarray_csrbank0_scratch2_we = ((csrbankarray_csrbank0_sel & (~csrbankarray_interface0_bank_bus_we)) & (csrbankarray_interface0_bank_bus_adr[3:0] == 2'd2));
assign csrbankarray_csrbank0_scratch1_r = csrbankarray_interface0_bank_bus_dat_w[7:0];
assign csrbankarray_csrbank0_scratch1_re = ((csrbankarray_csrbank0_sel & csrbankarray_interface0_bank_bus_we) & (csrbankarray_interface0_bank_bus_adr[3:0] == 2'd3));
assign csrbankarray_csrbank0_scratch1_we = ((csrbankarray_csrbank0_sel & (~csrbankarray_interface0_bank_bus_we)) & (csrbankarray_interface0_bank_bus_adr[3:0] == 2'd3));
assign csrbankarray_csrbank0_scratch0_r = csrbankarray_interface0_bank_bus_dat_w[7:0];
assign csrbankarray_csrbank0_scratch0_re = ((csrbankarray_csrbank0_sel & csrbankarray_interface0_bank_bus_we) & (csrbankarray_interface0_bank_bus_adr[3:0] == 3'd4));
assign csrbankarray_csrbank0_scratch0_we = ((csrbankarray_csrbank0_sel & (~csrbankarray_interface0_bank_bus_we)) & (csrbankarray_interface0_bank_bus_adr[3:0] == 3'd4));
assign csrbankarray_csrbank0_bus_errors3_r = csrbankarray_interface0_bank_bus_dat_w[7:0];
assign csrbankarray_csrbank0_bus_errors3_re = ((csrbankarray_csrbank0_sel & csrbankarray_interface0_bank_bus_we) & (csrbankarray_interface0_bank_bus_adr[3:0] == 3'd5));
assign csrbankarray_csrbank0_bus_errors3_we = ((csrbankarray_csrbank0_sel & (~csrbankarray_interface0_bank_bus_we)) & (csrbankarray_interface0_bank_bus_adr[3:0] == 3'd5));
assign csrbankarray_csrbank0_bus_errors2_r = csrbankarray_interface0_bank_bus_dat_w[7:0];
assign csrbankarray_csrbank0_bus_errors2_re = ((csrbankarray_csrbank0_sel & csrbankarray_interface0_bank_bus_we) & (csrbankarray_interface0_bank_bus_adr[3:0] == 3'd6));
assign csrbankarray_csrbank0_bus_errors2_we = ((csrbankarray_csrbank0_sel & (~csrbankarray_interface0_bank_bus_we)) & (csrbankarray_interface0_bank_bus_adr[3:0] == 3'd6));
assign csrbankarray_csrbank0_bus_errors1_r = csrbankarray_interface0_bank_bus_dat_w[7:0];
assign csrbankarray_csrbank0_bus_errors1_re = ((csrbankarray_csrbank0_sel & csrbankarray_interface0_bank_bus_we) & (csrbankarray_interface0_bank_bus_adr[3:0] == 3'd7));
assign csrbankarray_csrbank0_bus_errors1_we = ((csrbankarray_csrbank0_sel & (~csrbankarray_interface0_bank_bus_we)) & (csrbankarray_interface0_bank_bus_adr[3:0] == 3'd7));
assign csrbankarray_csrbank0_bus_errors0_r = csrbankarray_interface0_bank_bus_dat_w[7:0];
assign csrbankarray_csrbank0_bus_errors0_re = ((csrbankarray_csrbank0_sel & csrbankarray_interface0_bank_bus_we) & (csrbankarray_interface0_bank_bus_adr[3:0] == 4'd8));
assign csrbankarray_csrbank0_bus_errors0_we = ((csrbankarray_csrbank0_sel & (~csrbankarray_interface0_bank_bus_we)) & (csrbankarray_interface0_bank_bus_adr[3:0] == 4'd8));
assign csrbankarray_csrbank0_scratch3_w = ctrl_storage[31:24];
assign csrbankarray_csrbank0_scratch2_w = ctrl_storage[23:16];
assign csrbankarray_csrbank0_scratch1_w = ctrl_storage[15:8];
assign csrbankarray_csrbank0_scratch0_w = ctrl_storage[7:0];
assign csrbankarray_csrbank0_bus_errors3_w = ctrl_bus_errors_status[31:24];
assign csrbankarray_csrbank0_bus_errors2_w = ctrl_bus_errors_status[23:16];
assign csrbankarray_csrbank0_bus_errors1_w = ctrl_bus_errors_status[15:8];
assign csrbankarray_csrbank0_bus_errors0_w = ctrl_bus_errors_status[7:0];
assign ctrl_bus_errors_we = csrbankarray_csrbank0_bus_errors0_we;
assign csrbankarray_sel = (csrbankarray_sram_bus_adr[13:9] == 3'd4);
always @(*) begin
	csrbankarray_sram_bus_dat_r <= 8'd0;
	if (csrbankarray_sel_r) begin
		csrbankarray_sram_bus_dat_r <= csrbankarray_dat_r;
	end
end
assign csrbankarray_adr = csrbankarray_sram_bus_adr[3:0];
assign csrbankarray_csrbank1_sel = (csrbankarray_interface1_bank_bus_adr[13:9] == 3'd5);
assign csrbankarray_csrbank1_load3_r = csrbankarray_interface1_bank_bus_dat_w[7:0];
assign csrbankarray_csrbank1_load3_re = ((csrbankarray_csrbank1_sel & csrbankarray_interface1_bank_bus_we) & (csrbankarray_interface1_bank_bus_adr[4:0] == 1'd0));
assign csrbankarray_csrbank1_load3_we = ((csrbankarray_csrbank1_sel & (~csrbankarray_interface1_bank_bus_we)) & (csrbankarray_interface1_bank_bus_adr[4:0] == 1'd0));
assign csrbankarray_csrbank1_load2_r = csrbankarray_interface1_bank_bus_dat_w[7:0];
assign csrbankarray_csrbank1_load2_re = ((csrbankarray_csrbank1_sel & csrbankarray_interface1_bank_bus_we) & (csrbankarray_interface1_bank_bus_adr[4:0] == 1'd1));
assign csrbankarray_csrbank1_load2_we = ((csrbankarray_csrbank1_sel & (~csrbankarray_interface1_bank_bus_we)) & (csrbankarray_interface1_bank_bus_adr[4:0] == 1'd1));
assign csrbankarray_csrbank1_load1_r = csrbankarray_interface1_bank_bus_dat_w[7:0];
assign csrbankarray_csrbank1_load1_re = ((csrbankarray_csrbank1_sel & csrbankarray_interface1_bank_bus_we) & (csrbankarray_interface1_bank_bus_adr[4:0] == 2'd2));
assign csrbankarray_csrbank1_load1_we = ((csrbankarray_csrbank1_sel & (~csrbankarray_interface1_bank_bus_we)) & (csrbankarray_interface1_bank_bus_adr[4:0] == 2'd2));
assign csrbankarray_csrbank1_load0_r = csrbankarray_interface1_bank_bus_dat_w[7:0];
assign csrbankarray_csrbank1_load0_re = ((csrbankarray_csrbank1_sel & csrbankarray_interface1_bank_bus_we) & (csrbankarray_interface1_bank_bus_adr[4:0] == 2'd3));
assign csrbankarray_csrbank1_load0_we = ((csrbankarray_csrbank1_sel & (~csrbankarray_interface1_bank_bus_we)) & (csrbankarray_interface1_bank_bus_adr[4:0] == 2'd3));
assign csrbankarray_csrbank1_reload3_r = csrbankarray_interface1_bank_bus_dat_w[7:0];
assign csrbankarray_csrbank1_reload3_re = ((csrbankarray_csrbank1_sel & csrbankarray_interface1_bank_bus_we) & (csrbankarray_interface1_bank_bus_adr[4:0] == 3'd4));
assign csrbankarray_csrbank1_reload3_we = ((csrbankarray_csrbank1_sel & (~csrbankarray_interface1_bank_bus_we)) & (csrbankarray_interface1_bank_bus_adr[4:0] == 3'd4));
assign csrbankarray_csrbank1_reload2_r = csrbankarray_interface1_bank_bus_dat_w[7:0];
assign csrbankarray_csrbank1_reload2_re = ((csrbankarray_csrbank1_sel & csrbankarray_interface1_bank_bus_we) & (csrbankarray_interface1_bank_bus_adr[4:0] == 3'd5));
assign csrbankarray_csrbank1_reload2_we = ((csrbankarray_csrbank1_sel & (~csrbankarray_interface1_bank_bus_we)) & (csrbankarray_interface1_bank_bus_adr[4:0] == 3'd5));
assign csrbankarray_csrbank1_reload1_r = csrbankarray_interface1_bank_bus_dat_w[7:0];
assign csrbankarray_csrbank1_reload1_re = ((csrbankarray_csrbank1_sel & csrbankarray_interface1_bank_bus_we) & (csrbankarray_interface1_bank_bus_adr[4:0] == 3'd6));
assign csrbankarray_csrbank1_reload1_we = ((csrbankarray_csrbank1_sel & (~csrbankarray_interface1_bank_bus_we)) & (csrbankarray_interface1_bank_bus_adr[4:0] == 3'd6));
assign csrbankarray_csrbank1_reload0_r = csrbankarray_interface1_bank_bus_dat_w[7:0];
assign csrbankarray_csrbank1_reload0_re = ((csrbankarray_csrbank1_sel & csrbankarray_interface1_bank_bus_we) & (csrbankarray_interface1_bank_bus_adr[4:0] == 3'd7));
assign csrbankarray_csrbank1_reload0_we = ((csrbankarray_csrbank1_sel & (~csrbankarray_interface1_bank_bus_we)) & (csrbankarray_interface1_bank_bus_adr[4:0] == 3'd7));
assign csrbankarray_csrbank1_en0_r = csrbankarray_interface1_bank_bus_dat_w[0];
assign csrbankarray_csrbank1_en0_re = ((csrbankarray_csrbank1_sel & csrbankarray_interface1_bank_bus_we) & (csrbankarray_interface1_bank_bus_adr[4:0] == 4'd8));
assign csrbankarray_csrbank1_en0_we = ((csrbankarray_csrbank1_sel & (~csrbankarray_interface1_bank_bus_we)) & (csrbankarray_interface1_bank_bus_adr[4:0] == 4'd8));
assign csrbankarray_csrbank1_update_value0_r = csrbankarray_interface1_bank_bus_dat_w[0];
assign csrbankarray_csrbank1_update_value0_re = ((csrbankarray_csrbank1_sel & csrbankarray_interface1_bank_bus_we) & (csrbankarray_interface1_bank_bus_adr[4:0] == 4'd9));
assign csrbankarray_csrbank1_update_value0_we = ((csrbankarray_csrbank1_sel & (~csrbankarray_interface1_bank_bus_we)) & (csrbankarray_interface1_bank_bus_adr[4:0] == 4'd9));
assign csrbankarray_csrbank1_value3_r = csrbankarray_interface1_bank_bus_dat_w[7:0];
assign csrbankarray_csrbank1_value3_re = ((csrbankarray_csrbank1_sel & csrbankarray_interface1_bank_bus_we) & (csrbankarray_interface1_bank_bus_adr[4:0] == 4'd10));
assign csrbankarray_csrbank1_value3_we = ((csrbankarray_csrbank1_sel & (~csrbankarray_interface1_bank_bus_we)) & (csrbankarray_interface1_bank_bus_adr[4:0] == 4'd10));
assign csrbankarray_csrbank1_value2_r = csrbankarray_interface1_bank_bus_dat_w[7:0];
assign csrbankarray_csrbank1_value2_re = ((csrbankarray_csrbank1_sel & csrbankarray_interface1_bank_bus_we) & (csrbankarray_interface1_bank_bus_adr[4:0] == 4'd11));
assign csrbankarray_csrbank1_value2_we = ((csrbankarray_csrbank1_sel & (~csrbankarray_interface1_bank_bus_we)) & (csrbankarray_interface1_bank_bus_adr[4:0] == 4'd11));
assign csrbankarray_csrbank1_value1_r = csrbankarray_interface1_bank_bus_dat_w[7:0];
assign csrbankarray_csrbank1_value1_re = ((csrbankarray_csrbank1_sel & csrbankarray_interface1_bank_bus_we) & (csrbankarray_interface1_bank_bus_adr[4:0] == 4'd12));
assign csrbankarray_csrbank1_value1_we = ((csrbankarray_csrbank1_sel & (~csrbankarray_interface1_bank_bus_we)) & (csrbankarray_interface1_bank_bus_adr[4:0] == 4'd12));
assign csrbankarray_csrbank1_value0_r = csrbankarray_interface1_bank_bus_dat_w[7:0];
assign csrbankarray_csrbank1_value0_re = ((csrbankarray_csrbank1_sel & csrbankarray_interface1_bank_bus_we) & (csrbankarray_interface1_bank_bus_adr[4:0] == 4'd13));
assign csrbankarray_csrbank1_value0_we = ((csrbankarray_csrbank1_sel & (~csrbankarray_interface1_bank_bus_we)) & (csrbankarray_interface1_bank_bus_adr[4:0] == 4'd13));
assign timer0_eventmanager_status_r = csrbankarray_interface1_bank_bus_dat_w[0];
assign timer0_eventmanager_status_re = ((csrbankarray_csrbank1_sel & csrbankarray_interface1_bank_bus_we) & (csrbankarray_interface1_bank_bus_adr[4:0] == 4'd14));
assign timer0_eventmanager_status_we = ((csrbankarray_csrbank1_sel & (~csrbankarray_interface1_bank_bus_we)) & (csrbankarray_interface1_bank_bus_adr[4:0] == 4'd14));
assign timer0_eventmanager_pending_r = csrbankarray_interface1_bank_bus_dat_w[0];
assign timer0_eventmanager_pending_re = ((csrbankarray_csrbank1_sel & csrbankarray_interface1_bank_bus_we) & (csrbankarray_interface1_bank_bus_adr[4:0] == 4'd15));
assign timer0_eventmanager_pending_we = ((csrbankarray_csrbank1_sel & (~csrbankarray_interface1_bank_bus_we)) & (csrbankarray_interface1_bank_bus_adr[4:0] == 4'd15));
assign csrbankarray_csrbank1_ev_enable0_r = csrbankarray_interface1_bank_bus_dat_w[0];
assign csrbankarray_csrbank1_ev_enable0_re = ((csrbankarray_csrbank1_sel & csrbankarray_interface1_bank_bus_we) & (csrbankarray_interface1_bank_bus_adr[4:0] == 5'd16));
assign csrbankarray_csrbank1_ev_enable0_we = ((csrbankarray_csrbank1_sel & (~csrbankarray_interface1_bank_bus_we)) & (csrbankarray_interface1_bank_bus_adr[4:0] == 5'd16));
assign csrbankarray_csrbank1_load3_w = timer0_load_storage[31:24];
assign csrbankarray_csrbank1_load2_w = timer0_load_storage[23:16];
assign csrbankarray_csrbank1_load1_w = timer0_load_storage[15:8];
assign csrbankarray_csrbank1_load0_w = timer0_load_storage[7:0];
assign csrbankarray_csrbank1_reload3_w = timer0_reload_storage[31:24];
assign csrbankarray_csrbank1_reload2_w = timer0_reload_storage[23:16];
assign csrbankarray_csrbank1_reload1_w = timer0_reload_storage[15:8];
assign csrbankarray_csrbank1_reload0_w = timer0_reload_storage[7:0];
assign csrbankarray_csrbank1_en0_w = timer0_en_storage;
assign csrbankarray_csrbank1_update_value0_w = timer0_update_value_storage;
assign csrbankarray_csrbank1_value3_w = timer0_value_status[31:24];
assign csrbankarray_csrbank1_value2_w = timer0_value_status[23:16];
assign csrbankarray_csrbank1_value1_w = timer0_value_status[15:8];
assign csrbankarray_csrbank1_value0_w = timer0_value_status[7:0];
assign timer0_value_we = csrbankarray_csrbank1_value0_we;
assign csrbankarray_csrbank1_ev_enable0_w = timer0_eventmanager_storage;
assign csrbankarray_csrbank2_sel = (csrbankarray_interface2_bank_bus_adr[13:9] == 2'd3);
assign uart_rxtx_r = csrbankarray_interface2_bank_bus_dat_w[7:0];
assign uart_rxtx_re = ((csrbankarray_csrbank2_sel & csrbankarray_interface2_bank_bus_we) & (csrbankarray_interface2_bank_bus_adr[2:0] == 1'd0));
assign uart_rxtx_we = ((csrbankarray_csrbank2_sel & (~csrbankarray_interface2_bank_bus_we)) & (csrbankarray_interface2_bank_bus_adr[2:0] == 1'd0));
assign csrbankarray_csrbank2_txfull_r = csrbankarray_interface2_bank_bus_dat_w[0];
assign csrbankarray_csrbank2_txfull_re = ((csrbankarray_csrbank2_sel & csrbankarray_interface2_bank_bus_we) & (csrbankarray_interface2_bank_bus_adr[2:0] == 1'd1));
assign csrbankarray_csrbank2_txfull_we = ((csrbankarray_csrbank2_sel & (~csrbankarray_interface2_bank_bus_we)) & (csrbankarray_interface2_bank_bus_adr[2:0] == 1'd1));
assign csrbankarray_csrbank2_rxempty_r = csrbankarray_interface2_bank_bus_dat_w[0];
assign csrbankarray_csrbank2_rxempty_re = ((csrbankarray_csrbank2_sel & csrbankarray_interface2_bank_bus_we) & (csrbankarray_interface2_bank_bus_adr[2:0] == 2'd2));
assign csrbankarray_csrbank2_rxempty_we = ((csrbankarray_csrbank2_sel & (~csrbankarray_interface2_bank_bus_we)) & (csrbankarray_interface2_bank_bus_adr[2:0] == 2'd2));
assign uart_eventmanager_status_r = csrbankarray_interface2_bank_bus_dat_w[1:0];
assign uart_eventmanager_status_re = ((csrbankarray_csrbank2_sel & csrbankarray_interface2_bank_bus_we) & (csrbankarray_interface2_bank_bus_adr[2:0] == 2'd3));
assign uart_eventmanager_status_we = ((csrbankarray_csrbank2_sel & (~csrbankarray_interface2_bank_bus_we)) & (csrbankarray_interface2_bank_bus_adr[2:0] == 2'd3));
assign uart_eventmanager_pending_r = csrbankarray_interface2_bank_bus_dat_w[1:0];
assign uart_eventmanager_pending_re = ((csrbankarray_csrbank2_sel & csrbankarray_interface2_bank_bus_we) & (csrbankarray_interface2_bank_bus_adr[2:0] == 3'd4));
assign uart_eventmanager_pending_we = ((csrbankarray_csrbank2_sel & (~csrbankarray_interface2_bank_bus_we)) & (csrbankarray_interface2_bank_bus_adr[2:0] == 3'd4));
assign csrbankarray_csrbank2_ev_enable0_r = csrbankarray_interface2_bank_bus_dat_w[1:0];
assign csrbankarray_csrbank2_ev_enable0_re = ((csrbankarray_csrbank2_sel & csrbankarray_interface2_bank_bus_we) & (csrbankarray_interface2_bank_bus_adr[2:0] == 3'd5));
assign csrbankarray_csrbank2_ev_enable0_we = ((csrbankarray_csrbank2_sel & (~csrbankarray_interface2_bank_bus_we)) & (csrbankarray_interface2_bank_bus_adr[2:0] == 3'd5));
assign csrbankarray_csrbank2_txfull_w = uart_txfull_status;
assign uart_txfull_we = csrbankarray_csrbank2_txfull_we;
assign csrbankarray_csrbank2_rxempty_w = uart_rxempty_status;
assign uart_rxempty_we = csrbankarray_csrbank2_rxempty_we;
assign csrbankarray_csrbank2_ev_enable0_w = uart_eventmanager_storage[1:0];
assign csrbankarray_csrbank3_sel = (csrbankarray_interface3_bank_bus_adr[13:9] == 2'd2);
assign csrbankarray_csrbank3_tuning_word3_r = csrbankarray_interface3_bank_bus_dat_w[7:0];
assign csrbankarray_csrbank3_tuning_word3_re = ((csrbankarray_csrbank3_sel & csrbankarray_interface3_bank_bus_we) & (csrbankarray_interface3_bank_bus_adr[1:0] == 1'd0));
assign csrbankarray_csrbank3_tuning_word3_we = ((csrbankarray_csrbank3_sel & (~csrbankarray_interface3_bank_bus_we)) & (csrbankarray_interface3_bank_bus_adr[1:0] == 1'd0));
assign csrbankarray_csrbank3_tuning_word2_r = csrbankarray_interface3_bank_bus_dat_w[7:0];
assign csrbankarray_csrbank3_tuning_word2_re = ((csrbankarray_csrbank3_sel & csrbankarray_interface3_bank_bus_we) & (csrbankarray_interface3_bank_bus_adr[1:0] == 1'd1));
assign csrbankarray_csrbank3_tuning_word2_we = ((csrbankarray_csrbank3_sel & (~csrbankarray_interface3_bank_bus_we)) & (csrbankarray_interface3_bank_bus_adr[1:0] == 1'd1));
assign csrbankarray_csrbank3_tuning_word1_r = csrbankarray_interface3_bank_bus_dat_w[7:0];
assign csrbankarray_csrbank3_tuning_word1_re = ((csrbankarray_csrbank3_sel & csrbankarray_interface3_bank_bus_we) & (csrbankarray_interface3_bank_bus_adr[1:0] == 2'd2));
assign csrbankarray_csrbank3_tuning_word1_we = ((csrbankarray_csrbank3_sel & (~csrbankarray_interface3_bank_bus_we)) & (csrbankarray_interface3_bank_bus_adr[1:0] == 2'd2));
assign csrbankarray_csrbank3_tuning_word0_r = csrbankarray_interface3_bank_bus_dat_w[7:0];
assign csrbankarray_csrbank3_tuning_word0_re = ((csrbankarray_csrbank3_sel & csrbankarray_interface3_bank_bus_we) & (csrbankarray_interface3_bank_bus_adr[1:0] == 2'd3));
assign csrbankarray_csrbank3_tuning_word0_we = ((csrbankarray_csrbank3_sel & (~csrbankarray_interface3_bank_bus_we)) & (csrbankarray_interface3_bank_bus_adr[1:0] == 2'd3));
assign csrbankarray_csrbank3_tuning_word3_w = uart_phy_storage[31:24];
assign csrbankarray_csrbank3_tuning_word2_w = uart_phy_storage[23:16];
assign csrbankarray_csrbank3_tuning_word1_w = uart_phy_storage[15:8];
assign csrbankarray_csrbank3_tuning_word0_w = uart_phy_storage[7:0];
assign csrcon_adr = interface_adr;
assign csrcon_we = interface_we;
assign csrcon_dat_w = interface_dat_w;
assign interface_dat_r = csrcon_dat_r;
assign csrbankarray_interface0_bank_bus_adr = csrcon_adr;
assign csrbankarray_interface1_bank_bus_adr = csrcon_adr;
assign csrbankarray_interface2_bank_bus_adr = csrcon_adr;
assign csrbankarray_interface3_bank_bus_adr = csrcon_adr;
assign csrbankarray_sram_bus_adr = csrcon_adr;
assign csrbankarray_interface0_bank_bus_we = csrcon_we;
assign csrbankarray_interface1_bank_bus_we = csrcon_we;
assign csrbankarray_interface2_bank_bus_we = csrcon_we;
assign csrbankarray_interface3_bank_bus_we = csrcon_we;
assign csrbankarray_sram_bus_we = csrcon_we;
assign csrbankarray_interface0_bank_bus_dat_w = csrcon_dat_w;
assign csrbankarray_interface1_bank_bus_dat_w = csrcon_dat_w;
assign csrbankarray_interface2_bank_bus_dat_w = csrcon_dat_w;
assign csrbankarray_interface3_bank_bus_dat_w = csrcon_dat_w;
assign csrbankarray_sram_bus_dat_w = csrcon_dat_w;
assign csrcon_dat_r = ((((csrbankarray_interface0_bank_bus_dat_r | csrbankarray_interface1_bank_bus_dat_r) | csrbankarray_interface2_bank_bus_dat_r) | csrbankarray_interface3_bank_bus_dat_r) | csrbankarray_sram_bus_dat_r);
always @(*) begin
	array_muxed0 <= 30'd0;
	case (grant)
		1'd0: begin
			array_muxed0 <= interface0_soc_bus_adr;
		end
		default: begin
			array_muxed0 <= interface1_soc_bus_adr;
		end
	endcase
end
always @(*) begin
	array_muxed1 <= 32'd0;
	case (grant)
		1'd0: begin
			array_muxed1 <= interface0_soc_bus_dat_w;
		end
		default: begin
			array_muxed1 <= interface1_soc_bus_dat_w;
		end
	endcase
end
always @(*) begin
	array_muxed2 <= 4'd0;
	case (grant)
		1'd0: begin
			array_muxed2 <= interface0_soc_bus_sel;
		end
		default: begin
			array_muxed2 <= interface1_soc_bus_sel;
		end
	endcase
end
always @(*) begin
	array_muxed3 <= 1'd0;
	case (grant)
		1'd0: begin
			array_muxed3 <= interface0_soc_bus_cyc;
		end
		default: begin
			array_muxed3 <= interface1_soc_bus_cyc;
		end
	endcase
end
always @(*) begin
	array_muxed4 <= 1'd0;
	case (grant)
		1'd0: begin
			array_muxed4 <= interface0_soc_bus_stb;
		end
		default: begin
			array_muxed4 <= interface1_soc_bus_stb;
		end
	endcase
end
always @(*) begin
	array_muxed5 <= 1'd0;
	case (grant)
		1'd0: begin
			array_muxed5 <= interface0_soc_bus_we;
		end
		default: begin
			array_muxed5 <= interface1_soc_bus_we;
		end
	endcase
end
always @(*) begin
	array_muxed6 <= 3'd0;
	case (grant)
		1'd0: begin
			array_muxed6 <= interface0_soc_bus_cti;
		end
		default: begin
			array_muxed6 <= interface1_soc_bus_cti;
		end
	endcase
end
always @(*) begin
	array_muxed7 <= 2'd0;
	case (grant)
		1'd0: begin
			array_muxed7 <= interface0_soc_bus_bte;
		end
		default: begin
			array_muxed7 <= interface1_soc_bus_bte;
		end
	endcase
end
assign uart_phy_rx = regs1;
assign xilinxasyncresetsynchronizerimpl = ((~locked) | reset);
always @(posedge sys_clk) begin
	if ((ctrl_bus_errors != 32'd4294967295)) begin
		if (ctrl_bus_error) begin
			ctrl_bus_errors <= (ctrl_bus_errors + 1'd1);
		end
	end
	rom_bus_ack <= 1'd0;
	if (((rom_bus_cyc & rom_bus_stb) & (~rom_bus_ack))) begin
		rom_bus_ack <= 1'd1;
	end
	sram_bus_ack <= 1'd0;
	if (((sram_bus_cyc & sram_bus_stb) & (~sram_bus_ack))) begin
		sram_bus_ack <= 1'd1;
	end
	uart_phy_sink_ready <= 1'd0;
	if (((uart_phy_sink_valid & (~uart_phy_tx_busy)) & (~uart_phy_sink_ready))) begin
		uart_phy_tx_reg <= uart_phy_sink_payload_data;
		uart_phy_tx_bitcount <= 1'd0;
		uart_phy_tx_busy <= 1'd1;
		serial_tx <= 1'd0;
	end else begin
		if ((uart_phy_uart_clk_txen & uart_phy_tx_busy)) begin
			uart_phy_tx_bitcount <= (uart_phy_tx_bitcount + 1'd1);
			if ((uart_phy_tx_bitcount == 4'd8)) begin
				serial_tx <= 1'd1;
			end else begin
				if ((uart_phy_tx_bitcount == 4'd9)) begin
					serial_tx <= 1'd1;
					uart_phy_tx_busy <= 1'd0;
					uart_phy_sink_ready <= 1'd1;
				end else begin
					serial_tx <= uart_phy_tx_reg[0];
					uart_phy_tx_reg <= {1'd0, uart_phy_tx_reg[7:1]};
				end
			end
		end
	end
	if (uart_phy_tx_busy) begin
		{uart_phy_uart_clk_txen, uart_phy_phase_accumulator_tx} <= (uart_phy_phase_accumulator_tx + uart_phy_storage);
	end else begin
		{uart_phy_uart_clk_txen, uart_phy_phase_accumulator_tx} <= 1'd0;
	end
	uart_phy_source_valid <= 1'd0;
	uart_phy_rx_r <= uart_phy_rx;
	if ((~uart_phy_rx_busy)) begin
		if (((~uart_phy_rx) & uart_phy_rx_r)) begin
			uart_phy_rx_busy <= 1'd1;
			uart_phy_rx_bitcount <= 1'd0;
		end
	end else begin
		if (uart_phy_uart_clk_rxen) begin
			uart_phy_rx_bitcount <= (uart_phy_rx_bitcount + 1'd1);
			if ((uart_phy_rx_bitcount == 1'd0)) begin
				if (uart_phy_rx) begin
					uart_phy_rx_busy <= 1'd0;
				end
			end else begin
				if ((uart_phy_rx_bitcount == 4'd9)) begin
					uart_phy_rx_busy <= 1'd0;
					if (uart_phy_rx) begin
						uart_phy_source_payload_data <= uart_phy_rx_reg;
						uart_phy_source_valid <= 1'd1;
					end
				end else begin
					uart_phy_rx_reg <= {uart_phy_rx, uart_phy_rx_reg[7:1]};
				end
			end
		end
	end
	if (uart_phy_rx_busy) begin
		{uart_phy_uart_clk_rxen, uart_phy_phase_accumulator_rx} <= (uart_phy_phase_accumulator_rx + uart_phy_storage);
	end else begin
		{uart_phy_uart_clk_rxen, uart_phy_phase_accumulator_rx} <= 32'd2147483648;
	end
	if (uart_tx_clear) begin
		uart_tx_pending <= 1'd0;
	end
	uart_tx_old_trigger <= uart_tx_trigger;
	if (((~uart_tx_trigger) & uart_tx_old_trigger)) begin
		uart_tx_pending <= 1'd1;
	end
	if (uart_rx_clear) begin
		uart_rx_pending <= 1'd0;
	end
	uart_rx_old_trigger <= uart_rx_trigger;
	if (((~uart_rx_trigger) & uart_rx_old_trigger)) begin
		uart_rx_pending <= 1'd1;
	end
	if (uart_tx_fifo_syncfifo_re) begin
		uart_tx_fifo_readable <= 1'd1;
	end else begin
		if (uart_tx_fifo_re) begin
			uart_tx_fifo_readable <= 1'd0;
		end
	end
	if (((uart_tx_fifo_syncfifo_we & uart_tx_fifo_syncfifo_writable) & (~uart_tx_fifo_replace))) begin
		uart_tx_fifo_produce <= (uart_tx_fifo_produce + 1'd1);
	end
	if (uart_tx_fifo_do_read) begin
		uart_tx_fifo_consume <= (uart_tx_fifo_consume + 1'd1);
	end
	if (((uart_tx_fifo_syncfifo_we & uart_tx_fifo_syncfifo_writable) & (~uart_tx_fifo_replace))) begin
		if ((~uart_tx_fifo_do_read)) begin
			uart_tx_fifo_level0 <= (uart_tx_fifo_level0 + 1'd1);
		end
	end else begin
		if (uart_tx_fifo_do_read) begin
			uart_tx_fifo_level0 <= (uart_tx_fifo_level0 - 1'd1);
		end
	end
	if (uart_rx_fifo_syncfifo_re) begin
		uart_rx_fifo_readable <= 1'd1;
	end else begin
		if (uart_rx_fifo_re) begin
			uart_rx_fifo_readable <= 1'd0;
		end
	end
	if (((uart_rx_fifo_syncfifo_we & uart_rx_fifo_syncfifo_writable) & (~uart_rx_fifo_replace))) begin
		uart_rx_fifo_produce <= (uart_rx_fifo_produce + 1'd1);
	end
	if (uart_rx_fifo_do_read) begin
		uart_rx_fifo_consume <= (uart_rx_fifo_consume + 1'd1);
	end
	if (((uart_rx_fifo_syncfifo_we & uart_rx_fifo_syncfifo_writable) & (~uart_rx_fifo_replace))) begin
		if ((~uart_rx_fifo_do_read)) begin
			uart_rx_fifo_level0 <= (uart_rx_fifo_level0 + 1'd1);
		end
	end else begin
		if (uart_rx_fifo_do_read) begin
			uart_rx_fifo_level0 <= (uart_rx_fifo_level0 - 1'd1);
		end
	end
	if (uart_reset) begin
		uart_tx_pending <= 1'd0;
		uart_tx_old_trigger <= 1'd0;
		uart_rx_pending <= 1'd0;
		uart_rx_old_trigger <= 1'd0;
		uart_tx_fifo_readable <= 1'd0;
		uart_tx_fifo_level0 <= 5'd0;
		uart_tx_fifo_produce <= 4'd0;
		uart_tx_fifo_consume <= 4'd0;
		uart_rx_fifo_readable <= 1'd0;
		uart_rx_fifo_level0 <= 5'd0;
		uart_rx_fifo_produce <= 4'd0;
		uart_rx_fifo_consume <= 4'd0;
	end
	if (timer0_en_storage) begin
		if ((timer0_value == 1'd0)) begin
			timer0_value <= timer0_reload_storage;
		end else begin
			timer0_value <= (timer0_value - 1'd1);
		end
	end else begin
		timer0_value <= timer0_load_storage;
	end
	if (timer0_update_value_re) begin
		timer0_value_status <= timer0_value;
	end
	if (timer0_zero_clear) begin
		timer0_zero_pending <= 1'd0;
	end
	timer0_zero_old_trigger <= timer0_zero_trigger;
	if (((~timer0_zero_trigger) & timer0_zero_old_trigger)) begin
		timer0_zero_pending <= 1'd1;
	end
	state <= next_state;
	case (grant)
		1'd0: begin
			if ((~request[0])) begin
				if (request[1]) begin
					grant <= 1'd1;
				end
			end
		end
		1'd1: begin
			if ((~request[1])) begin
				if (request[0]) begin
					grant <= 1'd0;
				end
			end
		end
	endcase
	slave_sel_r <= slave_sel;
	if (wait_1) begin
		if ((~done)) begin
			count <= (count - 1'd1);
		end
	end else begin
		count <= 20'd1000000;
	end
	csrbankarray_interface0_bank_bus_dat_r <= 1'd0;
	if (csrbankarray_csrbank0_sel) begin
		case (csrbankarray_interface0_bank_bus_adr[3:0])
			1'd0: begin
				csrbankarray_interface0_bank_bus_dat_r <= ctrl_reset_reset_w;
			end
			1'd1: begin
				csrbankarray_interface0_bank_bus_dat_r <= csrbankarray_csrbank0_scratch3_w;
			end
			2'd2: begin
				csrbankarray_interface0_bank_bus_dat_r <= csrbankarray_csrbank0_scratch2_w;
			end
			2'd3: begin
				csrbankarray_interface0_bank_bus_dat_r <= csrbankarray_csrbank0_scratch1_w;
			end
			3'd4: begin
				csrbankarray_interface0_bank_bus_dat_r <= csrbankarray_csrbank0_scratch0_w;
			end
			3'd5: begin
				csrbankarray_interface0_bank_bus_dat_r <= csrbankarray_csrbank0_bus_errors3_w;
			end
			3'd6: begin
				csrbankarray_interface0_bank_bus_dat_r <= csrbankarray_csrbank0_bus_errors2_w;
			end
			3'd7: begin
				csrbankarray_interface0_bank_bus_dat_r <= csrbankarray_csrbank0_bus_errors1_w;
			end
			4'd8: begin
				csrbankarray_interface0_bank_bus_dat_r <= csrbankarray_csrbank0_bus_errors0_w;
			end
		endcase
	end
	if (csrbankarray_csrbank0_scratch3_re) begin
		ctrl_storage[31:24] <= csrbankarray_csrbank0_scratch3_r;
	end
	if (csrbankarray_csrbank0_scratch2_re) begin
		ctrl_storage[23:16] <= csrbankarray_csrbank0_scratch2_r;
	end
	if (csrbankarray_csrbank0_scratch1_re) begin
		ctrl_storage[15:8] <= csrbankarray_csrbank0_scratch1_r;
	end
	if (csrbankarray_csrbank0_scratch0_re) begin
		ctrl_storage[7:0] <= csrbankarray_csrbank0_scratch0_r;
	end
	ctrl_re <= csrbankarray_csrbank0_scratch0_re;
	csrbankarray_sel_r <= csrbankarray_sel;
	csrbankarray_interface1_bank_bus_dat_r <= 1'd0;
	if (csrbankarray_csrbank1_sel) begin
		case (csrbankarray_interface1_bank_bus_adr[4:0])
			1'd0: begin
				csrbankarray_interface1_bank_bus_dat_r <= csrbankarray_csrbank1_load3_w;
			end
			1'd1: begin
				csrbankarray_interface1_bank_bus_dat_r <= csrbankarray_csrbank1_load2_w;
			end
			2'd2: begin
				csrbankarray_interface1_bank_bus_dat_r <= csrbankarray_csrbank1_load1_w;
			end
			2'd3: begin
				csrbankarray_interface1_bank_bus_dat_r <= csrbankarray_csrbank1_load0_w;
			end
			3'd4: begin
				csrbankarray_interface1_bank_bus_dat_r <= csrbankarray_csrbank1_reload3_w;
			end
			3'd5: begin
				csrbankarray_interface1_bank_bus_dat_r <= csrbankarray_csrbank1_reload2_w;
			end
			3'd6: begin
				csrbankarray_interface1_bank_bus_dat_r <= csrbankarray_csrbank1_reload1_w;
			end
			3'd7: begin
				csrbankarray_interface1_bank_bus_dat_r <= csrbankarray_csrbank1_reload0_w;
			end
			4'd8: begin
				csrbankarray_interface1_bank_bus_dat_r <= csrbankarray_csrbank1_en0_w;
			end
			4'd9: begin
				csrbankarray_interface1_bank_bus_dat_r <= csrbankarray_csrbank1_update_value0_w;
			end
			4'd10: begin
				csrbankarray_interface1_bank_bus_dat_r <= csrbankarray_csrbank1_value3_w;
			end
			4'd11: begin
				csrbankarray_interface1_bank_bus_dat_r <= csrbankarray_csrbank1_value2_w;
			end
			4'd12: begin
				csrbankarray_interface1_bank_bus_dat_r <= csrbankarray_csrbank1_value1_w;
			end
			4'd13: begin
				csrbankarray_interface1_bank_bus_dat_r <= csrbankarray_csrbank1_value0_w;
			end
			4'd14: begin
				csrbankarray_interface1_bank_bus_dat_r <= timer0_eventmanager_status_w;
			end
			4'd15: begin
				csrbankarray_interface1_bank_bus_dat_r <= timer0_eventmanager_pending_w;
			end
			5'd16: begin
				csrbankarray_interface1_bank_bus_dat_r <= csrbankarray_csrbank1_ev_enable0_w;
			end
		endcase
	end
	if (csrbankarray_csrbank1_load3_re) begin
		timer0_load_storage[31:24] <= csrbankarray_csrbank1_load3_r;
	end
	if (csrbankarray_csrbank1_load2_re) begin
		timer0_load_storage[23:16] <= csrbankarray_csrbank1_load2_r;
	end
	if (csrbankarray_csrbank1_load1_re) begin
		timer0_load_storage[15:8] <= csrbankarray_csrbank1_load1_r;
	end
	if (csrbankarray_csrbank1_load0_re) begin
		timer0_load_storage[7:0] <= csrbankarray_csrbank1_load0_r;
	end
	timer0_load_re <= csrbankarray_csrbank1_load0_re;
	if (csrbankarray_csrbank1_reload3_re) begin
		timer0_reload_storage[31:24] <= csrbankarray_csrbank1_reload3_r;
	end
	if (csrbankarray_csrbank1_reload2_re) begin
		timer0_reload_storage[23:16] <= csrbankarray_csrbank1_reload2_r;
	end
	if (csrbankarray_csrbank1_reload1_re) begin
		timer0_reload_storage[15:8] <= csrbankarray_csrbank1_reload1_r;
	end
	if (csrbankarray_csrbank1_reload0_re) begin
		timer0_reload_storage[7:0] <= csrbankarray_csrbank1_reload0_r;
	end
	timer0_reload_re <= csrbankarray_csrbank1_reload0_re;
	if (csrbankarray_csrbank1_en0_re) begin
		timer0_en_storage <= csrbankarray_csrbank1_en0_r;
	end
	timer0_en_re <= csrbankarray_csrbank1_en0_re;
	if (csrbankarray_csrbank1_update_value0_re) begin
		timer0_update_value_storage <= csrbankarray_csrbank1_update_value0_r;
	end
	timer0_update_value_re <= csrbankarray_csrbank1_update_value0_re;
	if (csrbankarray_csrbank1_ev_enable0_re) begin
		timer0_eventmanager_storage <= csrbankarray_csrbank1_ev_enable0_r;
	end
	timer0_eventmanager_re <= csrbankarray_csrbank1_ev_enable0_re;
	csrbankarray_interface2_bank_bus_dat_r <= 1'd0;
	if (csrbankarray_csrbank2_sel) begin
		case (csrbankarray_interface2_bank_bus_adr[2:0])
			1'd0: begin
				csrbankarray_interface2_bank_bus_dat_r <= uart_rxtx_w;
			end
			1'd1: begin
				csrbankarray_interface2_bank_bus_dat_r <= csrbankarray_csrbank2_txfull_w;
			end
			2'd2: begin
				csrbankarray_interface2_bank_bus_dat_r <= csrbankarray_csrbank2_rxempty_w;
			end
			2'd3: begin
				csrbankarray_interface2_bank_bus_dat_r <= uart_eventmanager_status_w;
			end
			3'd4: begin
				csrbankarray_interface2_bank_bus_dat_r <= uart_eventmanager_pending_w;
			end
			3'd5: begin
				csrbankarray_interface2_bank_bus_dat_r <= csrbankarray_csrbank2_ev_enable0_w;
			end
		endcase
	end
	if (csrbankarray_csrbank2_ev_enable0_re) begin
		uart_eventmanager_storage[1:0] <= csrbankarray_csrbank2_ev_enable0_r;
	end
	uart_eventmanager_re <= csrbankarray_csrbank2_ev_enable0_re;
	csrbankarray_interface3_bank_bus_dat_r <= 1'd0;
	if (csrbankarray_csrbank3_sel) begin
		case (csrbankarray_interface3_bank_bus_adr[1:0])
			1'd0: begin
				csrbankarray_interface3_bank_bus_dat_r <= csrbankarray_csrbank3_tuning_word3_w;
			end
			1'd1: begin
				csrbankarray_interface3_bank_bus_dat_r <= csrbankarray_csrbank3_tuning_word2_w;
			end
			2'd2: begin
				csrbankarray_interface3_bank_bus_dat_r <= csrbankarray_csrbank3_tuning_word1_w;
			end
			2'd3: begin
				csrbankarray_interface3_bank_bus_dat_r <= csrbankarray_csrbank3_tuning_word0_w;
			end
		endcase
	end
	if (csrbankarray_csrbank3_tuning_word3_re) begin
		uart_phy_storage[31:24] <= csrbankarray_csrbank3_tuning_word3_r;
	end
	if (csrbankarray_csrbank3_tuning_word2_re) begin
		uart_phy_storage[23:16] <= csrbankarray_csrbank3_tuning_word2_r;
	end
	if (csrbankarray_csrbank3_tuning_word1_re) begin
		uart_phy_storage[15:8] <= csrbankarray_csrbank3_tuning_word1_r;
	end
	if (csrbankarray_csrbank3_tuning_word0_re) begin
		uart_phy_storage[7:0] <= csrbankarray_csrbank3_tuning_word0_r;
	end
	uart_phy_re <= csrbankarray_csrbank3_tuning_word0_re;
	if (sys_rst) begin
		ctrl_storage <= 32'd305419896;
		ctrl_re <= 1'd0;
		ctrl_bus_errors <= 32'd0;
		rom_bus_ack <= 1'd0;
		sram_bus_ack <= 1'd0;
		serial_tx <= 1'd1;
		uart_phy_storage <= 32'd4947802;
		uart_phy_re <= 1'd0;
		uart_phy_sink_ready <= 1'd0;
		uart_phy_uart_clk_txen <= 1'd0;
		uart_phy_phase_accumulator_tx <= 32'd0;
		uart_phy_tx_reg <= 8'd0;
		uart_phy_tx_bitcount <= 4'd0;
		uart_phy_tx_busy <= 1'd0;
		uart_phy_source_valid <= 1'd0;
		uart_phy_source_payload_data <= 8'd0;
		uart_phy_uart_clk_rxen <= 1'd0;
		uart_phy_phase_accumulator_rx <= 32'd0;
		uart_phy_rx_r <= 1'd0;
		uart_phy_rx_reg <= 8'd0;
		uart_phy_rx_bitcount <= 4'd0;
		uart_phy_rx_busy <= 1'd0;
		uart_tx_pending <= 1'd0;
		uart_tx_old_trigger <= 1'd0;
		uart_rx_pending <= 1'd0;
		uart_rx_old_trigger <= 1'd0;
		uart_eventmanager_storage <= 2'd0;
		uart_eventmanager_re <= 1'd0;
		uart_tx_fifo_readable <= 1'd0;
		uart_tx_fifo_level0 <= 5'd0;
		uart_tx_fifo_produce <= 4'd0;
		uart_tx_fifo_consume <= 4'd0;
		uart_rx_fifo_readable <= 1'd0;
		uart_rx_fifo_level0 <= 5'd0;
		uart_rx_fifo_produce <= 4'd0;
		uart_rx_fifo_consume <= 4'd0;
		timer0_load_storage <= 32'd0;
		timer0_load_re <= 1'd0;
		timer0_reload_storage <= 32'd0;
		timer0_reload_re <= 1'd0;
		timer0_en_storage <= 1'd0;
		timer0_en_re <= 1'd0;
		timer0_update_value_storage <= 1'd0;
		timer0_update_value_re <= 1'd0;
		timer0_value_status <= 32'd0;
		timer0_zero_pending <= 1'd0;
		timer0_zero_old_trigger <= 1'd0;
		timer0_eventmanager_storage <= 1'd0;
		timer0_eventmanager_re <= 1'd0;
		timer0_value <= 32'd0;
		state <= 1'd0;
		grant <= 1'd0;
		slave_sel_r <= 3'd0;
		count <= 20'd1000000;
		csrbankarray_interface0_bank_bus_dat_r <= 8'd0;
		csrbankarray_sel_r <= 1'd0;
		csrbankarray_interface1_bank_bus_dat_r <= 8'd0;
		csrbankarray_interface2_bank_bus_dat_r <= 8'd0;
		csrbankarray_interface3_bank_bus_dat_r <= 8'd0;
	end
	regs0 <= serial_rx;
	regs1 <= regs0;
end
reg [31:0] mem[0:8191];
reg [31:0] memdat;
always @(posedge sys_clk) begin
	memdat <= mem[rom_adr];
end
assign rom_dat_r = memdat;
initial begin
	$readmemh("mem.init", mem);
end
reg [31:0] mem_1[0:8191];
reg [12:0] memadr;
always @(posedge sys_clk) begin
	if (sram_we[0])
		mem_1[sram_adr][7:0] <= sram_dat_w[7:0];
	if (sram_we[1])
		mem_1[sram_adr][15:8] <= sram_dat_w[15:8];
	if (sram_we[2])
		mem_1[sram_adr][23:16] <= sram_dat_w[23:16];
	if (sram_we[3])
		mem_1[sram_adr][31:24] <= sram_dat_w[31:24];
	memadr <= sram_adr;
end
assign sram_dat_r = mem_1[memadr];
initial begin
	$readmemh("mem_1.init", mem_1);
end
reg [9:0] storage[0:15];
reg [9:0] memdat_1;
reg [9:0] memdat_2;
always @(posedge sys_clk) begin
	if (uart_tx_fifo_wrport_we)
		storage[uart_tx_fifo_wrport_adr] <= uart_tx_fifo_wrport_dat_w;
	memdat_1 <= storage[uart_tx_fifo_wrport_adr];
end
always @(posedge sys_clk) begin
	if (uart_tx_fifo_rdport_re)
		memdat_2 <= storage[uart_tx_fifo_rdport_adr];
end
assign uart_tx_fifo_wrport_dat_r = memdat_1;
assign uart_tx_fifo_rdport_dat_r = memdat_2;
reg [9:0] storage_1[0:15];
reg [9:0] memdat_3;
reg [9:0] memdat_4;
always @(posedge sys_clk) begin
	if (uart_rx_fifo_wrport_we)
		storage_1[uart_rx_fifo_wrport_adr] <= uart_rx_fifo_wrport_dat_w;
	memdat_3 <= storage_1[uart_rx_fifo_wrport_adr];
end
always @(posedge sys_clk) begin
	if (uart_rx_fifo_rdport_re)
		memdat_4 <= storage_1[uart_rx_fifo_rdport_adr];
end
assign uart_rx_fifo_wrport_dat_r = memdat_3;
assign uart_rx_fifo_rdport_dat_r = memdat_4;
reg [7:0] mem_2[0:9];
reg [3:0] memadr_1;
always @(posedge sys_clk) begin
	memadr_1 <= csrbankarray_adr;
end
assign csrbankarray_dat_r = mem_2[memadr_1];
initial begin
	$readmemh("mem_2.init", mem_2);
end
BUFG BUFG_OUT(
	.I(clkout),
	.O(clkout_buf)
);
VexRiscv VexRiscv(
	.clk(sys_clk),
	.dBusWishbone_ACK(vexriscv_dbus_ack),
	.dBusWishbone_DAT_MISO(vexriscv_dbus_dat_r),
	.dBusWishbone_ERR(vexriscv_dbus_err),
	.externalInterruptArray(vexriscv_interrupt),
	.externalResetVector(1'd0),
	.iBusWishbone_ACK(vexriscv_ibus_ack),
	.iBusWishbone_DAT_MISO(vexriscv_ibus_dat_r),
	.iBusWishbone_ERR(vexriscv_ibus_err),
	.reset((sys_rst | vexriscv_reset)),
	.softwareInterrupt(1'd0),
	.timerInterrupt(1'd0),
	.dBusWishbone_ADR(vexriscv_dbus_adr),
	.dBusWishbone_BTE(vexriscv_dbus_bte),
	.dBusWishbone_CTI(vexriscv_dbus_cti),
	.dBusWishbone_CYC(vexriscv_dbus_cyc),
	.dBusWishbone_DAT_MOSI(vexriscv_dbus_dat_w),
	.dBusWishbone_SEL(vexriscv_dbus_sel),
	.dBusWishbone_STB(vexriscv_dbus_stb),
	.dBusWishbone_WE(vexriscv_dbus_we),
	.iBusWishbone_ADR(vexriscv_ibus_adr),
	.iBusWishbone_BTE(vexriscv_ibus_bte),
	.iBusWishbone_CTI(vexriscv_ibus_cti),
	.iBusWishbone_CYC(vexriscv_ibus_cyc),
	.iBusWishbone_DAT_MOSI(vexriscv_ibus_dat_w),
	.iBusWishbone_SEL(vexriscv_ibus_sel),
	.iBusWishbone_STB(vexriscv_ibus_stb),
	.iBusWishbone_WE(vexriscv_ibus_we)
);
BUFG BUFG_IN(
	.I(clk100),
	.O(clkin)
);
PLLE2_ADV #(
	.CLKFBOUT_MULT(5'd16),
	.CLKIN1_PERIOD(10.0),
	.CLKOUT0_DIVIDE(5'd16),
	.CLKOUT0_PHASE(1'd0),
	.DIVCLK_DIVIDE(1'd1),
	.REF_JITTER1(0.01),
	.STARTUP_WAIT("FALSE")
) PLLE2_ADV (
	.CLKFBIN(pll_fb),
	.CLKIN1(clkin),
	.CLKFBOUT(pll_fb),
	.CLKOUT0(clkout),
	.LOCKED(locked)
);
(* ars_ff1 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE (
	.C(sys_clk),
	.CE(1'd1),
	.D(1'd0),
	.PRE(xilinxasyncresetsynchronizerimpl),
	.Q(xilinxasyncresetsynchronizerimpl_rst_meta)
);
(* ars_ff2 = "true", async_reg = "true" *) FDPE #(
	.INIT(1'd1)
) FDPE_1 (
	.C(sys_clk),
	.CE(1'd1),
	.D(xilinxasyncresetsynchronizerimpl_rst_meta),
	.PRE(xilinxasyncresetsynchronizerimpl),
	.Q(sys_rst)
);
endmodule