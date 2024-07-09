module address_decode (
                     sys_clk,
                     nreset,
                     wb_adr,
                     wb_ack_uart,
                     wb_ack_timer,
                     wb_ack_ctrl,
                     wb_stb,
                     wb_dat_uart_o,
                     wb_dat_timer_o,
                     wb_dat_ctrl_i,
                     sram_stb,
                     uart0_stb,
                     timer_stb,
                     local_stb,
                     wb_ack,
                     wb_dat_i
);
`include "regs.vh"
input         sys_clk;
input         nreset;
input  [31:0] wb_adr;
input         wb_ack_uart;
input         wb_ack_timer;
input         wb_ack_ctrl;
input         wb_stb;
input   [7:0] wb_dat_uart_o;
input  [31:0] wb_dat_timer_o;
input  [31:0] wb_dat_ctrl_i;
output        sram_stb;
output        uart0_stb;
output        timer_stb;
output        local_stb;
output        wb_ack;
output [31:0] wb_dat_i;
wire [31:0]   uart0_addr   = `LM32_UART0_BASE_ADDR;
wire [31:0]   timer_addr   = `LM32_TIMER_BASE_ADDR;
// Decode address for peripheral targets
wire          sram_sel     = ~wb_adr[31];
// Decode addresses on top 8 bits, and on 4K pages (first 16)
// This assumption is specific to this project's address mapping,
// and may need to change if ported to a different project, with
// different mappings to get correct resolution.
wire          uart0_sel    = (wb_adr[31:24] == uart0_addr[31:24] && wb_adr[15:12] == uart0_addr[15:12]) ? 1'b1 : 1'b0;
wire          timer_sel    = (wb_adr[31:24] == timer_addr[31:24] && wb_adr[15:12] == timer_addr[15:12]) ? 1'b1 : 1'b0;
// Local register decode for any address not in the above selects.
// The controller will always acknowledge, so this mops up all unused
// addresses
wire          local_sel    = ~uart0_sel & ~timer_sel & ~sram_sel;
// Generate strobes (i.e. 'chip selects') for relevant peripheral
assign        sram_stb     = wb_stb & sram_sel;
assign        uart0_stb    = wb_stb & uart0_sel;
assign        timer_stb    = wb_stb & timer_sel;
assign        local_stb    = wb_stb & local_sel;
// Combine all acks (including dummy ACK) to send back to CPU.
assign        wb_ack        = wb_ack_ctrl | wb_ack_uart | wb_ack_timer;
// Multiplex read data from peripherals to return to CPU. If no peripheral
// selected, data is a dummy pattern to aid diagnostics. Controller
// handles both SRAM and local accesses.
assign        wb_dat_i      = (sram_sel | local_sel) ? wb_dat_ctrl_i                 :
                                          uart0_sel  ? {{24'h000000, wb_dat_uart_o}} :
                                          timer_sel  ? wb_dat_timer_o                :
                                                       32'hcccccccc;
endmodule