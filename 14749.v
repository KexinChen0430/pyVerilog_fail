module ddr3_s4_amphy_phy_alt_mem_phy_postamble ( // inputs
                               phy_clk_1x,
                               resync_clk_1x,
                               reset_phy_clk_1x_n,
                               reset_resync_clk_1x_n,
                               seq_poa_lat_inc_1x,
                               seq_poa_lat_dec_1x,
                               seq_poa_protection_override_1x,
                               // for 2T / 2N addr/CMD drive both of these with the same value.
                               // (DWIDTH_RATIO/2 - 1 downto 0)   (LSB represents first when changes ionto full-rate!
                               ctl_doing_rd_beat,
                               // outputs (DWIDTH_RATIO/2 - 1 downto 0)
                               poa_postamble_en_preset
                              );
parameter FAMILY                       = "STRATIXIII";
parameter POSTAMBLE_INITIAL_LAT        = 13; //13 for SIII, 16 for SII/CIII
parameter POSTAMBLE_RESYNC_LAT_CTL_EN  = 0;  // 0 means false, 1 means true
parameter POSTAMBLE_AWIDTH             = 6;
parameter POSTAMBLE_HALFT_EN           = 0;  // 0 means false, 1 means true
parameter MEM_IF_POSTAMBLE_EN_WIDTH    = 8;
parameter DWIDTH_RATIO                 = 4;
// clocks
input  wire                           phy_clk_1x;
input  wire                           resync_clk_1x;
// resets
input  wire                           reset_phy_clk_1x_n;
input  wire                           reset_resync_clk_1x_n;
// control signals from sequencer
input  wire                           seq_poa_lat_inc_1x;
input  wire                           seq_poa_lat_dec_1x;
input  wire                           seq_poa_protection_override_1x;
input  wire [DWIDTH_RATIO/2 - 1 : 0]  ctl_doing_rd_beat ;
// output to IOE for SIII :
output wire [DWIDTH_RATIO/2 - 1 : 0]  poa_postamble_en_preset;
// internal wires/regs
reg  [POSTAMBLE_AWIDTH - 1 : 0]       rd_addr;
reg  [POSTAMBLE_AWIDTH - 1 : 0]       wr_addr;
reg  [POSTAMBLE_AWIDTH - 1 : 0]       next_wr_addr;
reg  [DWIDTH_RATIO/2 - 1 : 0]         wr_data;
wire                                  wr_en;
reg                                   sync_seq_poa_lat_inc_1x;
reg                                   sync_seq_poa_lat_dec_1x;
reg                                   seq_poa_lat_inc_1x_1t;
reg                                   seq_poa_lat_dec_1x_1t;
// only for halfrate.  --- also for Quarter_rate......
reg                                   ctl_doing_rd_beat2_1x_r1;
wire [DWIDTH_RATIO/2 - 1 : 0]         postamble_en;
reg                                   bit_order_1x;
reg                                   ams_inc;
reg                                   ams_dec;
// loop variables
genvar i;
//       Generate Statements to synchronise controls if necessary
generate
//begin
    if (POSTAMBLE_RESYNC_LAT_CTL_EN == 0)
    begin : sync_lat_controls
        always @* // combinational logic sensitivity
        begin
            sync_seq_poa_lat_inc_1x = seq_poa_lat_inc_1x;
            sync_seq_poa_lat_dec_1x = seq_poa_lat_dec_1x;
        end
    end
    else
    begin : resynch_lat_controls
        always @(posedge phy_clk_1x or negedge reset_phy_clk_1x_n)
        begin
            if (reset_phy_clk_1x_n == 1'b0)
            begin
                sync_seq_poa_lat_inc_1x <= 1'b0;
                sync_seq_poa_lat_dec_1x <= 1'b0;
                ams_inc                 <= 1'b0;
                ams_dec                 <= 1'b0;
            end
            else
            begin
                sync_seq_poa_lat_inc_1x <= ams_inc;
                sync_seq_poa_lat_dec_1x <= ams_dec;
                ams_inc                 <= seq_poa_lat_inc_1x;
                ams_dec                 <= seq_poa_lat_dec_1x;
            end
        end
    end
//end
endgenerate
//          write address controller
// override_postamble_protection is overide onto write data.
//  otherwise use bit_order_1x to choose how word is written into RAM.
generate // based on DWIDTH RATIO...
//begin
  if (DWIDTH_RATIO == 4) // Half Rate
  begin : halfrate_wdata_gen
      always @* // combinational logic sensitivity
      begin
        if (seq_poa_protection_override_1x == 1'b1)
        begin
            wr_data  = `POA_OVERRIDE_VAL;
        end
        else if (bit_order_1x == 1'b0)
        begin
            wr_data  = {ctl_doing_rd_beat[1], ctl_doing_rd_beat[0]};
        end
        else
        begin
            wr_data  = {ctl_doing_rd_beat[0], ctl_doing_rd_beat2_1x_r1};
        end
      end
  end
else // Full-rate
 begin : fullrate_wdata_gen
  always @* // combinational logic sensitivity
    begin
      if (seq_poa_protection_override_1x == 1'b1)
        begin
          wr_data  = `POA_OVERRIDE_VAL_FULL_RATE;
        end
    else
      begin
            wr_data = ctl_doing_rd_beat;
      end
    end
  end
//end
endgenerate
always @*
begin
    next_wr_addr = wr_addr + 1'b1;
    if (sync_seq_poa_lat_dec_1x == 1'b1 && seq_poa_lat_dec_1x_1t == 1'b0)
    begin
        if ((bit_order_1x == 1'b0) || (DWIDTH_RATIO == 2))
        begin
            next_wr_addr = wr_addr;
        end
    end
    else if (sync_seq_poa_lat_inc_1x == 1'b1 && seq_poa_lat_inc_1x_1t == 1'b0)
    begin
        if ((bit_order_1x == 1'b1) || (DWIDTH_RATIO ==2))
        begin
            next_wr_addr = wr_addr + 2'h2;
        end
    end
end
always @(posedge phy_clk_1x or negedge reset_phy_clk_1x_n)
begin
    if (reset_phy_clk_1x_n == 1'b0)
    begin
        wr_addr <= POSTAMBLE_INITIAL_LAT[POSTAMBLE_AWIDTH - 1 : 0];
    end
    else
    begin
        wr_addr <= next_wr_addr;
    end
end
always @(posedge phy_clk_1x or negedge reset_phy_clk_1x_n)
begin
    if (reset_phy_clk_1x_n == 1'b0)
    begin
        ctl_doing_rd_beat2_1x_r1 <= 1'b0;
        seq_poa_lat_inc_1x_1t    <= 1'b0;
        seq_poa_lat_dec_1x_1t    <= 1'b0;
        bit_order_1x             <= 1'b1; // 1'b0
    end
    else
    begin
        ctl_doing_rd_beat2_1x_r1 <= ctl_doing_rd_beat[DWIDTH_RATIO/2 - 1];
        seq_poa_lat_inc_1x_1t    <= sync_seq_poa_lat_inc_1x;
        seq_poa_lat_dec_1x_1t    <= sync_seq_poa_lat_dec_1x;
        if (DWIDTH_RATIO == 2)
            bit_order_1x <= 1'b0;
        else if (sync_seq_poa_lat_dec_1x == 1'b1 && seq_poa_lat_dec_1x_1t == 1'b0)
        begin
            bit_order_1x <=  ~bit_order_1x;
        end
        else if (sync_seq_poa_lat_inc_1x == 1'b1 && seq_poa_lat_inc_1x_1t == 1'b0)
        begin
            bit_order_1x <= ~bit_order_1x;
        end
    end
end
//         Instantiate the postamble dpram
assign wr_en = 1'b1;                       // tied high
// For StratixIII, the read and write sides are the same width :
altsyncram #(
    .address_reg_b             ("CLOCK1"),
    .clock_enable_input_a      ("BYPASS"),
    .clock_enable_input_b      ("BYPASS"),
    .clock_enable_output_b     ("BYPASS"),
    .intended_device_family    (FAMILY),
    .lpm_type                  ("altsyncram"),
    .numwords_a                (2**POSTAMBLE_AWIDTH),
    .numwords_b                (2**POSTAMBLE_AWIDTH),
    .operation_mode            ("DUAL_PORT"),
    .outdata_aclr_b            ("NONE"),
    .outdata_reg_b             ("CLOCK1"),
    .power_up_uninitialized    ("FALSE"),
    .ram_block_type            ("MLAB"),
    .widthad_a                 (POSTAMBLE_AWIDTH),
    .widthad_b                 (POSTAMBLE_AWIDTH),
    .width_a                   (DWIDTH_RATIO/2),
    .width_b                   (DWIDTH_RATIO/2),
    .width_byteena_a           (1)
) altsyncram_component (
    .wren_a                    (wr_en),
    .clock0                    (phy_clk_1x),
    .clock1                    (resync_clk_1x),
    .address_a                 (wr_addr),
    .address_b                 (rd_addr),
    .data_a                    (wr_data),
    .q_b                       (postamble_en),
    .aclr0                     (1'b0),
    .aclr1                     (1'b0),
    .addressstall_a            (1'b0),
    .addressstall_b            (1'b0),
    .byteena_a                 (1'b1),
    .byteena_b                 (1'b1),
    .clocken0                  (1'b1),
    .clocken1                  (1'b1),
    .data_b                    ({DWIDTH_RATIO/2{1'b1}}),
    .q_a                       (),
    .rden_b                    (1'b1),
    .wren_b                    (1'b0),
    .eccstatus                 (),
    .clocken3                  (),
    .clocken2                  (),
    .rden_a                    ()
);
//     read address generator : just a free running counter.
always @(posedge resync_clk_1x or negedge reset_resync_clk_1x_n)
begin
    if (reset_resync_clk_1x_n == 1'b0)
    begin
        rd_addr <= {POSTAMBLE_AWIDTH{1'b0}};
    end
    else
    begin
        rd_addr <= rd_addr + 1'b1;     //inc address, can wrap
    end
end
assign poa_postamble_en_preset = postamble_en;
endmodule