module soc_template (/*AUTOARG*/
                     // Outputs
                     uart_tx,
                     // Inputs
                     clk_sys_i, reset_sys_i, uart_rx
                     ) ;
   // System Interface
   input clk_sys_i;
   input reset_sys_i;
   // UART Interface
   input uart_rx;
   output wire uart_tx;
   /*AUTOWIRE*/
   /*AUTOREG*/
   // Bus Matrix
   wire        clk_i;
   wire        rst_i;
   wire        wb_clk_i = clk_i;
   wire        wb_rst_i = rst_i;
   assign wb_clk = wb_clk_i;
   assign wb_rst = wb_rst_i;
`include "soc_bus_matrix.vh"
   wire        VDD = 1;
   wire        VSS = 0;
   assign wb_s2m_ram_rty = 0;
   assign wb_s2m_rom_rty = 0;
   assign wb_s2m_debug_rty =0;
   assign wb_s2m_uart_rty = 0;
   assign wb_s2m_uart_err =0;
   assign wb_s2m_debug_dat = 0;
   assign wb_s2m_debug_err = 0;
   assign wb_s2m_debug_ack = 0;
   // Wishbone CPU
   wire [31:0] interrupts;
   wire        uart_interrupt;
   assign interrupts [0]  = 0;
   assign interrupts [1]  = 0;
   assign interrupts [2]  = uart_interrupt;
   assign interrupts [3]  = 0;
   assign interrupts [4]  = 0;
   assign interrupts [5]  = 0;
   assign interrupts [6]  = 0;
   assign interrupts [7]  = 0;
   assign interrupts [8]  = 0;
   assign interrupts [9]  = 0;
   assign interrupts [10] = 0;
   assign interrupts [11] = 0;
   assign interrupts [12] = 0;
   assign interrupts [13] = 0;
   assign interrupts [14] = 0;
   assign interrupts [15] = 0;
   assign interrupts [16] = 0;
   assign interrupts [17] = 0;
   assign interrupts [18] = 0;
   assign interrupts [19] = 0;
   assign interrupts [20] = 0;
   assign interrupts [21] = 0;
   assign interrupts [22] = 0;
   assign interrupts [23] = 0;
   assign interrupts [24] = 0;
   assign interrupts [25] = 0;
   assign interrupts [26] = 0;
   assign interrupts [27] = 0;
   assign interrupts [28] = 0;
   assign interrupts [29] = 0;
   assign interrupts [30] = 0;
   assign interrupts [31] = 0;
   wishbone_cpu cpu_wrapper(
                            // Outputs
                            .iwbm_adr_o(wb_m2s_iwmb_adr),
                            .iwbm_stb_o(wb_m2s_iwmb_stb),
                            .iwbm_cyc_o(wb_m2s_iwmb_cyc),
                            .iwbm_sel_o(wb_m2s_iwmb_sel),
                            .iwbm_we_o(wb_m2s_iwmb_we),
                            .iwbm_cti_o(wb_m2s_iwmb_cti),
                            .iwbm_bte_o(wb_m2s_iwmb_bte),
                            .iwbm_dat_o(wb_m2s_iwmb_dat),
                            .dwbm_adr_o(wb_m2s_dwmb_adr),
                            .dwbm_stb_o(wb_m2s_dwmb_stb),
                            .dwbm_cyc_o(wb_m2s_dwmb_cyc),
                            .dwbm_sel_o(wb_m2s_dwmb_sel),
                            .dwbm_we_o(wb_m2s_dwmb_we),
                            .dwbm_cti_o(wb_m2s_dwmb_cti),
                            .dwbm_bte_o(wb_m2s_dwmb_bte),
                            .dwbm_dat_o(wb_m2s_dwmb_dat),
                            .dbg_lss_o(),
                            .dbg_is_o(),
                            .dbg_wp_o(),
                            .dbg_bp_o(),
                            .dbg_dat_o(),
                            .dbg_ack_o(),
                            // Inputs
                            .clk_i(clk_i),
                            .rst_i(rst_i),
                            .interrupts(interrupts),
                            .iwbm_err_i(wb_s2m_iwmb_err),
                            .iwbm_ack_i(wb_s2m_iwmb_ack),
                            .iwbm_dat_i(wb_s2m_iwmb_dat),
                            .iwbm_rty_i(wb_s2m_iwmb_rty),
                            //                            .iwbm_rty_i(1'b0),
                            .dwbm_err_i(wb_s2m_dwmb_err),
                            .dwbm_ack_i(wb_s2m_dwmb_ack),
                            .dwbm_dat_i(wb_s2m_dwmb_dat),
                            .dwbm_rty_i(wb_s2m_dwmb_rty),
                            //                            .dwbm_rty_i(1'b0),
                            .dbg_stall_i(VSS),
                            .dbg_ewt_i(VSS),
                            .dbg_stb_i(VSS),
                            .dbg_we_i(VSS),
                            .dbg_sel_i(VSS),
                            .dbg_cti_i({3{VSS}}),
                            .dbg_bte_i(VSS),
                            .dbg_lock_i(VSS),
                            .dbg_cyc_i(VSS),
                            .dbg_adr_i({32{VSS}}),
                            .dbg_dat_i({32{VSS}})
                            ) ;
   system_controller sys_con(
                             // Outputs
                             .clk_i(clk_i),
                             .rst_i(rst_i),
                             .nrst_i(nrst_i),
                             // Inputs
                             .clk_sys_i(clk_sys_i),
                             .rst_sys_i(reset_sys_i)
                             );
   // System SRAM
   wb_ram #(.depth(32768))
   ram0(
        .wb_clk_i(clk_i),
        .wb_rst_i(rst_i),
        .wb_adr_i(wb_m2s_ram_adr[14:0]),
        .wb_dat_i(wb_m2s_ram_dat),
        .wb_sel_i(wb_m2s_ram_sel),
        .wb_we_i(wb_m2s_ram_we),
        .wb_bte_i(wb_m2s_ram_bte),
        .wb_cti_i(wb_m2s_ram_cti),
        .wb_cyc_i(wb_m2s_ram_cyc),
        .wb_stb_i(wb_m2s_ram_stb),
        .wb_ack_o(wb_s2m_ram_ack),
        .wb_err_o(wb_s2m_ram_err),
        .wb_dat_o(wb_s2m_ram_dat)
        );
   // System ROM
   wb_rom #(.depth(32768))
   rom0(
        .wb_clk_i(clk_i),
        .wb_rst_i(rst_i),
        .wb_adr_i(wb_m2s_rom_adr[14:0]),
        .wb_dat_i(wb_m2s_rom_dat),
        .wb_sel_i(wb_m2s_rom_sel),
        //        .wb_we_i(VSS),
        .wb_bte_i(wb_m2s_rom_bte),
        .wb_cti_i(wb_m2s_rom_cti),
        .wb_cyc_i(wb_m2s_rom_cyc),
        .wb_stb_i(wb_m2s_rom_stb),
        .wb_ack_o(wb_s2m_rom_ack),
        .wb_err_o(wb_s2m_rom_err),
        .wb_dat_o(wb_s2m_rom_dat)
        );
   // UART
   uart_top     uart0(
                      .wb_clk_i(wb_clk_i),
                      // Wishbone signals
                      .wb_rst_i(wb_rst_i),
                      .wb_adr_i(wb_m2s_uart_adr[4:0]),
                      .wb_dat_i(wb_m2s_uart_dat),
                      .wb_dat_o(wb_s2m_uart_dat),
                      .wb_we_i(wb_m2s_uart_we),
                      .wb_stb_i(wb_m2s_uart_stb),
                      .wb_cyc_i(wb_m2s_uart_cyc),
                      .wb_ack_o(wb_s2m_uart_ack),
                      .wb_sel_i(wb_m2s_uart_sel),
                      .int_o(uart_interrupt), // interrupt request
                      // UART   signals
                      // serial input/output
                      .stx_pad_o(uart_tx),
                      .srx_pad_i(uart_rx),
                      // modem signals
                      .rts_pad_o(),
                      .cts_pad_i(1'b0),
                      .dtr_pad_o(),
                      .dsr_pad_i(1'b0),
                      .ri_pad_i(1'b0),
                      .dcd_pad_i(1'b0),
                      .baud_o()
                      );
   //`ifdef SIMULATION
   wire [31:0] trigger_reg;
   fw_interface fw_if(
                      // Outputs
                      .wb_ack_o(wb_s2m_fw_interface_ack),
                      .wb_rty_o(wb_s2m_fw_interface_rty),
                      .wb_err_o(wb_s2m_fw_interface_err),
                      .wb_dat_o(wb_s2m_fw_interface_dat),
                      .trigger_reg(trigger_reg),
                      // Inputs
                      .wb_clk_i(wb_clk_i),
                      .wb_rst_i(wb_rst_i),
                      .wb_adr_i(wb_m2s_fw_interface_adr),
                      .wb_dat_i(wb_m2s_fw_interface_dat),
                      .wb_sel_i(wb_m2s_fw_interface_sel),
                      .wb_we_i(wb_m2s_fw_interface_we),
                      .wb_bte_i(wb_m2s_fw_interface_bte),
                      .wb_cti_i(wb_m2s_fw_interface_cti),
                      .wb_cyc_i(wb_m2s_fw_interface_cyc),
                      .wb_stb_i(wb_m2s_fw_interface_stb),
                      .interrupts(interrupts)
                      ) ;
   /* -----\/----- EXCLUDED -----\/-----
    `else // !`ifdef SIMULATION
    assign wb_s2m_fw_interface_ack = 0;
    assign wb_s2m_fw_interface_err = 0;
    assign wb_s2m_fw_interface_dat = 0;
    `endif
    -----/\----- EXCLUDED -----/\----- */
endmodule