module
  // Port A
  BLK_MEM_GEN_v8_0_output_stage
    #(.C_FAMILY                 (C_FAMILY),
      .C_XDEVICEFAMILY          (C_XDEVICEFAMILY),
      .C_RST_TYPE               (C_RST_TYPE),
      .C_HAS_RST                (C_HAS_RSTA),
      .C_RSTRAM                 (C_RSTRAM_A),
      .C_RST_PRIORITY           (C_RST_PRIORITY_A),
      .C_INIT_VAL               (C_INITA_VAL),
      .C_HAS_EN                 (C_HAS_ENA),
      .C_HAS_REGCE              (C_HAS_REGCEA),
      .C_DATA_WIDTH             (C_READ_WIDTH_A),
      .C_ADDRB_WIDTH            (C_ADDRB_WIDTH),
      .C_HAS_MEM_OUTPUT_REGS    (C_HAS_MEM_OUTPUT_REGS_A),
      .C_USE_SOFTECC            (C_USE_SOFTECC),
      .C_USE_ECC                (C_USE_ECC),
      .NUM_STAGES               (NUM_OUTPUT_STAGES_A),
      .FLOP_DELAY               (FLOP_DELAY))
      reg_a
        (.CLK         (CLKA),
         .RST         (RSTA),
         .EN          (ENA),
         .REGCE       (REGCEA),
         .DIN         (memory_out_a),
         .DOUT        (DOUTA),
         .SBITERR_IN  (1'b0),
         .DBITERR_IN  (1'b0),
         .SBITERR     (),
         .DBITERR     (),
         .RDADDRECC_IN ({C_ADDRB_WIDTH{1'b0}}),
         .RDADDRECC   ()
        );
  // Port B
  BLK_MEM_GEN_v8_0_output_stage
    #(.C_FAMILY                 (C_FAMILY),
      .C_XDEVICEFAMILY          (C_XDEVICEFAMILY),
      .C_RST_TYPE               (C_RST_TYPE),
      .C_HAS_RST                (C_HAS_RSTB),
      .C_RSTRAM                 (C_RSTRAM_B),
      .C_RST_PRIORITY           (C_RST_PRIORITY_B),
      .C_INIT_VAL               (C_INITB_VAL),
      .C_HAS_EN                 (C_HAS_ENB),
      .C_HAS_REGCE              (C_HAS_REGCEB),
      .C_DATA_WIDTH             (C_READ_WIDTH_B),
      .C_ADDRB_WIDTH            (C_ADDRB_WIDTH),
      .C_HAS_MEM_OUTPUT_REGS    (C_HAS_MEM_OUTPUT_REGS_B),
      .C_USE_SOFTECC            (C_USE_SOFTECC),
      .C_USE_ECC                (C_USE_ECC),
      .NUM_STAGES               (NUM_OUTPUT_STAGES_B),
      .FLOP_DELAY               (FLOP_DELAY))
      reg_b
        (.CLK         (CLKB),
         .RST         (RSTB),
         .EN          (ENB),
         .REGCE       (REGCEB),
         .DIN         (memory_out_b),
         .DOUT        (dout_i),
         .SBITERR_IN  (sbiterr_in),
         .DBITERR_IN  (dbiterr_in),
         .SBITERR     (sbiterr_i),
         .DBITERR     (dbiterr_i),
         .RDADDRECC_IN (rdaddrecc_in),
         .RDADDRECC   (rdaddrecc_i)
        );
  //  Instantiate the Input and Output register stages
BLK_MEM_GEN_v8_0_softecc_output_reg_stage
    #(.C_DATA_WIDTH                 (C_READ_WIDTH_B),
      .C_ADDRB_WIDTH                (C_ADDRB_WIDTH),
      .C_HAS_SOFTECC_OUTPUT_REGS_B  (C_HAS_SOFTECC_OUTPUT_REGS_B),
      .C_USE_SOFTECC                (C_USE_SOFTECC),
      .FLOP_DELAY                   (FLOP_DELAY))
  has_softecc_output_reg_stage
      (.CLK       (CLKB),
      .DIN        (dout_i),
      .DOUT        (DOUTB),
      .SBITERR_IN        (sbiterr_i),
      .DBITERR_IN        (dbiterr_i),
      .SBITERR        (sbiterr_sdp),
      .DBITERR        (dbiterr_sdp),
      .RDADDRECC_IN        (rdaddrecc_i),
      .RDADDRECC        (rdaddrecc_sdp)
);
  // Synchronous collision checks
  generate if (!C_DISABLE_WARN_BHV_COLL && C_COMMON_CLK) begin : sync_coll
    always @(posedge CLKA) begin
      // Possible collision if both are enabled and the addresses match
      if (ena_i && enb_i) begin
        if (wea_i || web_i) begin
          is_collision <= collision_check(ADDRA, wea_i, ADDRB, web_i);
        end else begin
          is_collision <= 0;
        end
      end else begin
          is_collision <= 0;
      end
      // If the write port is in READ_FIRST mode, there is no collision
      if (C_WRITE_MODE_A=="READ_FIRST" && wea_i && !web_i) begin
        is_collision <= 0;
      end
      if (C_WRITE_MODE_B=="READ_FIRST" && web_i && !wea_i) begin
        is_collision <= 0;
      end
      // Only flag if one of the accesses is a write
      if (is_collision && (wea_i || web_i)) begin
        $fwrite(COLLFILE, "%0s collision detected at time: %0d, ",
                C_CORENAME, $time);
        $fwrite(COLLFILE, "A %0s address: %0h, B %0s address: %0h\n",
                wea_i ? "write" : "read", ADDRA,
                web_i ? "write" : "read", ADDRB);
      end
    end
  // Asynchronous collision checks
  end else if (!C_DISABLE_WARN_BHV_COLL && !C_COMMON_CLK) begin : async_coll
    // Delay A and B addresses in order to mimic setup/hold times
    wire [C_ADDRA_WIDTH-1:0]  #COLL_DELAY addra_delay = ADDRA;
    wire [0:0]                #COLL_DELAY wea_delay   = wea_i;
    wire                      #COLL_DELAY ena_delay   = ena_i;
    wire [C_ADDRB_WIDTH-1:0]  #COLL_DELAY addrb_delay = ADDRB;
    wire [0:0]                #COLL_DELAY web_delay   = web_i;
    wire                      #COLL_DELAY enb_delay   = enb_i;
    // Do the checks w/rt A
    always @(posedge CLKA) begin
      // Possible collision if both are enabled and the addresses match
      if (ena_i && enb_i) begin
        if (wea_i || web_i) begin
          is_collision_a <= collision_check(ADDRA, wea_i, ADDRB, web_i);
        end else begin
          is_collision_a <= 0;
        end
      end else begin
        is_collision_a <= 0;
      end
      if (ena_i && enb_delay) begin
        if(wea_i || web_delay) begin
          is_collision_delay_a <= collision_check(ADDRA, wea_i, addrb_delay,
                                                                    web_delay);
        end else begin
          is_collision_delay_a <= 0;
        end
      end else begin
        is_collision_delay_a <= 0;
      end
      // Only flag if B access is a write
      if (is_collision_a && web_i) begin
        $fwrite(COLLFILE, "%0s collision detected at time: %0d, ",
                C_CORENAME, $time);
        $fwrite(COLLFILE, "A %0s address: %0h, B write address: %0h\n",
                wea_i ? "write" : "read", ADDRA, ADDRB);
      end else if (is_collision_delay_a && web_delay) begin
        $fwrite(COLLFILE, "%0s collision detected at time: %0d, ",
                C_CORENAME, $time);
        $fwrite(COLLFILE, "A %0s address: %0h, B write address: %0h\n",
                wea_i ? "write" : "read", ADDRA, addrb_delay);
      end
    end
    // Do the checks w/rt B
    always @(posedge CLKB) begin
      // Possible collision if both are enabled and the addresses match
      if (ena_i && enb_i) begin
        if (wea_i || web_i) begin
          is_collision_b <= collision_check(ADDRA, wea_i, ADDRB, web_i);
        end else begin
          is_collision_b <= 0;
        end
      end else begin
        is_collision_b <= 0;
      end
      if (ena_delay && enb_i) begin
        if (wea_delay || web_i) begin
          is_collision_delay_b <= collision_check(addra_delay, wea_delay, ADDRB,
                                                                        web_i);
        end else begin
          is_collision_delay_b <= 0;
        end
      end else begin
        is_collision_delay_b <= 0;
      end
      // Only flag if A access is a write
      if (is_collision_b && wea_i) begin
        $fwrite(COLLFILE, "%0s collision detected at time: %0d, ",
                C_CORENAME, $time);
        $fwrite(COLLFILE, "A write address: %0h, B %s address: %0h\n",
                ADDRA, web_i ? "write" : "read", ADDRB);
      end else if (is_collision_delay_b && wea_delay) begin
        $fwrite(COLLFILE, "%0s collision detected at time: %0d, ",
                C_CORENAME, $time);
        $fwrite(COLLFILE, "A write address: %0h, B %s address: %0h\n",
                addra_delay, web_i ? "write" : "read", ADDRB);
      end
    end
  end
  endgenerate
endmodule