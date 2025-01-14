module  tb_openGFX430;
// Wire & Register definition
`define  CLK_PERIOD  50   // 20 MHz
// LT24 Interface
wire        [15:0] lt24_lcd_din;
wire               lt24_lcd_cs_n;
wire               lt24_lcd_rd_n;
wire               lt24_lcd_wr_n;
wire               lt24_lcd_rs;
wire        [15:0] lt24_lcd_dout;
wire               lt24_lcd_d_en;
wire               lt24_lcd_reset_n;
wire               lt24_lcd_on;
wire               lt24_adc_cs_n;
wire               lt24_adc_dclk;
wire               lt24_adc_busy;
wire               lt24_adc_din;
wire               lt24_adc_dout;
wire               lt24_adc_penirq_n;
// Generic screen interface
wire               screen_refresh_active;
wire               screen_refresh_data_request;
wire               screen_refresh_data_ready;
wire        [15:0] screen_refresh_data;
wire [`LPIX_MSB:0] screen_display_width;
wire [`LPIX_MSB:0] screen_display_height;
wire [`SPIX_MSB:0] screen_display_size;
// Video Memory interface
wire [`VRAM_MSB:0] vid_ram_addr;
wire               vid_ram_wen;
wire               vid_ram_cen;
wire        [15:0] vid_ram_din;
wire        [15:0] vid_ram_dout;
// LUT Memory interface
`ifdef WITH_PROGRAMMABLE_LUT
wire [`LRAM_MSB:0] lut_ram_addr;
wire               lut_ram_wen;
wire               lut_ram_cen;
wire        [15:0] lut_ram_din;
wire        [15:0] lut_ram_dout;
`endif
// Peripherals interface
reg         [15:0] per_addr;
reg         [15:0] per_din;
reg          [1:0] per_we;
reg                per_en;
wire        [15:0] per_dout_lt24;
wire        [15:0] per_dout_gfx;
wire        [15:0] per_dout;
// Clock / Reset
reg                mclk;
reg                puc_rst;
// Others
wire               dbg_freeze;
wire               irq_gfx;
wire               irq_lt24_lcd;
wire               irq_lt24_adc;
// Testbench variables
integer            tb_idx;
reg     [8*32-1:0] tb_string;
integer            error;
reg                stimulus_done;
// Include files
// Peripheral interface tasks
`include "peripheral_tasks.v"
// Registers & Fields definitions
`include "register_def_openGFX430.v"
`include "register_def_if_lt24.v"
// Verilog stimulus
`include "stimulus.v"
// Initialize Memories
initial
  begin
     for (tb_idx=0; tb_idx < (1<<`VRAM_MSB); tb_idx=tb_idx+1)
       vid_ram_0.mem[tb_idx] = 16'h0000;
     for (tb_idx=0; tb_idx < (1<<`LRAM_MSB); tb_idx=tb_idx+1)
       lut_ram_0.mem[tb_idx] = 16'h0000;
  end
// Generate Clock & Reset
initial
  begin
     mclk          = 1'b0;
     forever
       begin
          #(`CLK_PERIOD/2);
          mclk     = ~mclk;
       end
  end
initial
  begin
     puc_rst       = 1'b0;
     #93;
     puc_rst       = 1'b1;
     #593;
     puc_rst       = 1'b0;
  end
initial
  begin
     error         = 0;
     stimulus_done = 0;
     tb_string     = "";
     per_addr      = 14'h0000;
     per_din       = 16'h0000;
     per_we        =  2'h0;
     per_en        =  1'h0;
  end
// Video Memory
ram #(`VRAM_MSB, (1<<(`VRAM_AWIDTH+1))) vid_ram_0 (
// OUTPUTs
    .ram_dout                      ( vid_ram_dout                ),  // Video Memory data output
// INPUTs
    .ram_addr                      ( vid_ram_addr                ),  // Video Memory address
    .ram_cen                       ( vid_ram_cen                 ),  // Video Memory chip enable (low active)
    .ram_clk                       ( mclk                        ),  // Video Memory clock
    .ram_din                       ( vid_ram_din                 ),  // Video Memory data input
    .ram_wen                       ( {2{vid_ram_wen}}            )   // Video Memory write enable (low active)
);
// LUT Memory
`ifdef WITH_PROGRAMMABLE_LUT
ram #(`LRAM_MSB, (1<<(`LRAM_AWIDTH+1))) lut_ram_0 (
// OUTPUTs
    .ram_dout                      ( lut_ram_dout                ),  // LUT Memory data output
// INPUTs
    .ram_addr                      ( lut_ram_addr                ),  // LUT Memory address
    .ram_cen                       ( lut_ram_cen                 ),  // LUT Memory chip enable (low active)
    .ram_clk                       ( mclk                        ),  // LUT Memory clock
    .ram_din                       ( lut_ram_din                 ),  // LUT Memory data input
    .ram_wen                       ( {2{lut_ram_wen}}            )   // LUT Memory write enable (low active)
);
`endif
// LT24 Model
lt24Model lt24Model_inst (
// OUTPUTs
    .lt24_lcd_d_o                  ( lt24_lcd_din                ),  // LT24 LCD Data input
    .lt24_adc_busy_o               ( lt24_adc_busy               ),  // LT24 ADC Busy
    .lt24_adc_dout_o               ( lt24_adc_dout               ),  // LT24 ADC Data Out
    .lt24_adc_penirq_n_o           ( lt24_adc_penirq_n           ),  // LT24 ADC Pen Interrupt
// INPUTs
    .lt24_lcd_cs_n_i               ( lt24_lcd_cs_n               ),  // LT24 LDC Chip select (Active low)
    .lt24_lcd_rd_n_i               ( lt24_lcd_rd_n               ),  // LT24 LDC Read strobe (Active low)
    .lt24_lcd_wr_n_i               ( lt24_lcd_wr_n               ),  // LT24 LDC Write strobe (Active low)
    .lt24_lcd_rs_i                 ( lt24_lcd_rs                 ),  // LT24 LDC Command/Param selection (Cmd=0/Param=1)
    .lt24_lcd_d_i                  ( lt24_lcd_dout               ),  // LT24 LDC Data output
    .lt24_lcd_d_en_i               ( lt24_lcd_d_en               ),  // LT24 LDC Data output enable
    .lt24_lcd_reset_n_i            ( lt24_lcd_reset_n            ),  // LT24 LDC Reset (Active Low)
    .lt24_lcd_on_i                 ( lt24_lcd_on                 ),  // LT24 LDC on/off
    .lt24_adc_cs_n_i               ( lt24_adc_cs_n               ),  // LT24 ADC Chip Select
    .lt24_adc_dclk_i               ( lt24_adc_dclk               ),  // LT24 ADC Clock
    .lt24_adc_din_i                ( lt24_adc_din                )   // LT24 ADC Data In
);
// LT24 Interface
ogfx_if_lt24 dut_if_lt24 (
// Clock & Reset
    .mclk                          ( mclk                        ),  // Main system clock
    .puc_rst                       ( puc_rst                     ),  // Main system reset
// Peripheral Interface
    .per_addr_i                    ( per_addr[13:0]              ),  // Peripheral address
    .per_en_i                      ( per_en                      ),  // Peripheral enable (high active)
    .per_we_i                      ( per_we                      ),  // Peripheral write enable (high active)
    .per_din_i                     ( per_din                     ),  // Peripheral data input
    .per_dout_o                    ( per_dout_lt24               ),  // Peripheral data output
    .irq_lt24_lcd_o                ( irq_lt24_lcd                ),  // LT24 LCD interface interrupt
    .irq_lt24_adc_o                ( irq_lt24_adc                ),  // LT24 ADC interface interrupt
// LT24 LCD Interface
    .lt24_lcd_d_i                  ( lt24_lcd_din                ),  // LT24 Data input
    .lt24_lcd_cs_n_o               ( lt24_lcd_cs_n               ),  // LT24 Chip select (Active low)
    .lt24_lcd_rd_n_o               ( lt24_lcd_rd_n               ),  // LT24 Read strobe (Active low)
    .lt24_lcd_wr_n_o               ( lt24_lcd_wr_n               ),  // LT24 Write strobe (Active low)
    .lt24_lcd_rs_o                 ( lt24_lcd_rs                 ),  // LT24 Command/Param selection (Cmd=0/Param=1)
    .lt24_lcd_d_o                  ( lt24_lcd_dout               ),  // LT24 Data output
    .lt24_lcd_d_en_o               ( lt24_lcd_d_en               ),  // LT24 Data output enable
    .lt24_lcd_reset_n_o            ( lt24_lcd_reset_n            ),  // LT24 Reset (Active Low)
    .lt24_lcd_on_o                 ( lt24_lcd_on                 ),  // LT24 on/off
// LT24 ADC Interface
    .lt24_adc_busy_i               ( lt24_adc_busy               ),  // LT24 ADC Busy
    .lt24_adc_dout_i               ( lt24_adc_dout               ),  // LT24 ADC Data Out
    .lt24_adc_penirq_n_i           ( lt24_adc_penirq_n           ),  // LT24 ADC Pen Interrupt
    .lt24_adc_cs_n_o               ( lt24_adc_cs_n               ),  // LT24 ADC Chip Select
    .lt24_adc_dclk_o               ( lt24_adc_dclk               ),  // LT24 ADC Clock
    .lt24_adc_din_o                ( lt24_adc_din                ),  // LT24 ADC Data In
// openGFX430 Interface
    .screen_display_size_i         ( screen_display_size         ),  // Display size configuration (number of pixels)
    .screen_refresh_data_i         ( screen_refresh_data         ),  // Display refresh data
    .screen_refresh_data_ready_i   ( screen_refresh_data_ready   ),  // Display refresh new data is ready
    .screen_refresh_data_request_o ( screen_refresh_data_request ),  // Display refresh new data request
    .screen_refresh_active_o       ( screen_refresh_active       )   // Display refresh on going
);
// openGFX430 Instance
openGFX430 dut (
// Clock & Reset
    .mclk                          ( mclk                        ),  // Main system clock
    .puc_rst                       ( puc_rst                     ),  // Main system reset
// Peripheral Interface
    .per_addr_i                    ( per_addr[13:0]              ),  // Peripheral address
    .per_en_i                      ( per_en                      ),  // Peripheral enable (high active)
    .per_we_i                      ( per_we                      ),  // Peripheral write enable (high active)
    .per_din_i                     ( per_din                     ),  // Peripheral data input
    .per_dout_o                    ( per_dout_gfx                ),  // Peripheral data output
    .dbg_freeze_i                  ( dbg_freeze                  ),  // Freeze address auto-incr on read
    .irq_gfx_o                     ( irq_gfx                     ),  // Graphic Controller interrupt
// LUT SRAM Interface
`ifdef WITH_PROGRAMMABLE_LUT
    .lut_ram_dout_i                ( lut_ram_dout                ),  // LUT-RAM data output
    .lut_ram_addr_o                ( lut_ram_addr                ),  // LUT-RAM address
    .lut_ram_wen_o                 ( lut_ram_wen                 ),  // LUT-RAM write enable (active low)
    .lut_ram_cen_o                 ( lut_ram_cen                 ),  // LUT-RAM enable (active low)
    .lut_ram_din_o                 ( lut_ram_din                 ),  // LUT-RAM data input
`endif
// VIDEO SRAM Interface
    .vid_ram_dout_i                ( vid_ram_dout                ),  // Video-RAM data output
    .vid_ram_addr_o                ( vid_ram_addr                ),  // Video-RAM address
    .vid_ram_wen_o                 ( vid_ram_wen                 ),  // Video-RAM write enable (active low)
    .vid_ram_cen_o                 ( vid_ram_cen                 ),  // Video-RAM enable (active low)
    .vid_ram_din_o                 ( vid_ram_din                 ),  // Video-RAM data input
// Generic Screen Interface
    .screen_refresh_active_i       ( screen_refresh_active       ),  // Display refresh on going
    .screen_refresh_data_request_i ( screen_refresh_data_request ),  // Display refresh new data request
    .screen_refresh_data_ready_o   ( screen_refresh_data_ready   ),  // Display refresh new data is ready
    .screen_refresh_data_o         ( screen_refresh_data         ),  // Display refresh data
    .screen_display_width_o        ( screen_display_width        ),  // Display width configuration (number of pixels)
    .screen_display_height_o       ( screen_display_height       ),  // Display height configuration (number of pixels)
    .screen_display_size_o         ( screen_display_size         )   // Display size configuration (number of pixels)
);
assign  per_dout = per_dout_lt24 | per_dout_gfx;
// Generate Waveform
initial
  begin
   `ifdef NODUMP
   `else
     `ifdef VPD_FILE
        $vcdplusfile("tb_openGFX430.vpd");
        $vcdpluson();
     `else
       `ifdef TRN_FILE
          $recordfile ("tb_openGFX430.trn");
          $recordvars;
       `else
          $dumpfile("tb_openGFX430.vcd");
          $dumpvars(0, tb_openGFX430);
       `endif
     `endif
   `endif
  end
// End of simulation
initial // Timeout
  begin
   `ifdef NO_TIMEOUT
   `else
     `ifdef VERY_LONG_TIMEOUT
       #(1000ms);
     `else
     `ifdef LONG_TIMEOUT
       #(100ms);
     `else
       #(10ms);
     `endif
     `endif
       $display(" ===============================================");
       $display("|               SIMULATION FAILED               |");
       $display("|              (simulation Timeout)             |");
       $display(" ===============================================");
       $display("");
       $finish;
   `endif
  end
initial // Normal end of test
  begin
     @(posedge stimulus_done);
     $display(" ===============================================");
     if (error!=0)
       begin
          $display("|               SIMULATION FAILED               |");
          $display("|     (some verilog stimulus checks failed)     |");
       end
     else
       begin
          $display("|               SIMULATION PASSED               |");
       end
     $display(" ===============================================");
     $display("");
     $finish;
  end
// Tasks Definition
   task tb_error;
      input [65*8:0] error_string;
      begin
         $display("ERROR: %s %t", error_string, $time);
         error = error+1;
      end
   endtask
   task tb_skip_finish;
      input [65*8-1:0] skip_string;
      begin
         $display(" ===============================================");
         $display("|               SIMULATION SKIPPED              |");
         $display("%s", skip_string);
         $display(" ===============================================");
         $display("");
         $finish;
      end
   endtask
endmodule