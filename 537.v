module.
     assign RD_CLK_P0_IN       = 0;
     assign RST_P0_IN          = 0;
     assign RD_EN_P0_IN        = 0;
     assign RD_EN_FIFO_IN      = rd_en_delayed;
     assign DOUT               = DOUT_FIFO_OUT;
     assign DATA_P0_IN         = 0;
     assign VALID              = VALID_FIFO_OUT;
     assign EMPTY              = EMPTY_FIFO_OUT;
     assign ALMOST_EMPTY       = ALMOST_EMPTY_FIFO_OUT;
     assign EMPTY_P0_IN        = 0;
     assign UNDERFLOW          = UNDERFLOW_FIFO_OUT;
     assign DATA_COUNT         = DATA_COUNT_FIFO_OUT;
     assign SBITERR            = sbiterr_fifo_out;
     assign DBITERR            = dbiterr_fifo_out;
   end endgenerate // STD_FIFO
   generate if (IS_FWFT == 1 && C_FIFO_TYPE != 1) begin : NO_PKT_FIFO
     assign empty_p0_out       = empty_fwft;
     assign SBITERR            = sbiterr_fwft;
     assign DBITERR            = dbiterr_fwft;
     assign DOUT               = dout_fwft;
     assign RD_EN_P0_IN        = (C_FIFO_TYPE != 1) ? rd_en_delayed : rd_en_to_fwft_fifo;
   end endgenerate // NO_PKT_FIFO
   // Connect user flags to internal signals
   //If we are using extra logic for the FWFT data count, then override the
   //RD_DATA_COUNT output when we are EMPTY or ALMOST_EMPTY.
   //RD_DATA_COUNT is 0 when EMPTY and 1 when ALMOST_EMPTY.
   generate
      if (C_USE_FWFT_DATA_COUNT==1 && (C_RD_DATA_COUNT_WIDTH>C_RD_PNTR_WIDTH) && (C_USE_EMBEDDED_REG < 3) ) begin : block3
      if (C_COMMON_CLOCK == 0) begin : block_ic
         assign RD_DATA_COUNT = (EMPTY_P0_OUT_Q | RST_P0_IN) ? 0 : (ALMOSTEMPTY_P0_OUT_Q ? 1 : RD_DATA_COUNT_FIFO_OUT);
      end //block_ic
      else begin
         assign RD_DATA_COUNT = RD_DATA_COUNT_FIFO_OUT;
      end
      end //block3
   endgenerate
   //If we are using extra logic for the FWFT data count, then override the
   //RD_DATA_COUNT output when we are EMPTY or ALMOST_EMPTY.
   //Due to asymmetric ports, RD_DATA_COUNT is 0 when EMPTY or ALMOST_EMPTY.
   generate
      if (C_USE_FWFT_DATA_COUNT==1 && (C_RD_DATA_COUNT_WIDTH <=C_RD_PNTR_WIDTH) && (C_USE_EMBEDDED_REG < 3) ) begin : block30
       if (C_COMMON_CLOCK == 0) begin : block_ic
         assign RD_DATA_COUNT = (EMPTY_P0_OUT_Q | RST_P0_IN) ? 0 : (ALMOSTEMPTY_P0_OUT_Q ? 0 : RD_DATA_COUNT_FIFO_OUT);
       end
       else begin
         assign RD_DATA_COUNT = RD_DATA_COUNT_FIFO_OUT;
        end
      end //block30
   endgenerate
   //If we are using extra logic for the FWFT data count, then override the
   //RD_DATA_COUNT output when we are EMPTY or ALMOST_EMPTY.
   //Due to asymmetric ports, RD_DATA_COUNT is 0 when EMPTY or ALMOST_EMPTY.
   generate
      if (C_USE_FWFT_DATA_COUNT==1 && (C_RD_DATA_COUNT_WIDTH <=C_RD_PNTR_WIDTH) && (C_USE_EMBEDDED_REG == 3) ) begin : block30_both
       if (C_COMMON_CLOCK == 0) begin : block_ic_both
         assign RD_DATA_COUNT = (EMPTY_P0_OUT_Q | RST_P0_IN) ? 0 : (ALMOSTEMPTY_P0_OUT_Q ? 0 : (RD_DATA_COUNT_FIFO_OUT));
       end
       else begin
         assign RD_DATA_COUNT = RD_DATA_COUNT_FIFO_OUT;
        end
      end //block30_both
   endgenerate
 generate
      if (C_USE_FWFT_DATA_COUNT==1 && (C_RD_DATA_COUNT_WIDTH>C_RD_PNTR_WIDTH) && (C_USE_EMBEDDED_REG == 3) ) begin : block3_both
      if (C_COMMON_CLOCK == 0) begin : block_ic_both
         assign RD_DATA_COUNT = (EMPTY_P0_OUT_Q | RST_P0_IN) ? 0 : (ALMOSTEMPTY_P0_OUT_Q ? 1 : (RD_DATA_COUNT_FIFO_OUT));
      end //block_ic_both
      else begin
         assign RD_DATA_COUNT = RD_DATA_COUNT_FIFO_OUT;
      end
      end //block3_both
   endgenerate
   //If we are not using extra logic for the FWFT data count,
   //then connect RD_DATA_COUNT to the RD_DATA_COUNT from the
   //internal FIFO instance
   generate
      if (C_USE_FWFT_DATA_COUNT==0 ) begin : block31
         assign RD_DATA_COUNT = RD_DATA_COUNT_FIFO_OUT;
      end
   endgenerate
   //Always connect WR_DATA_COUNT to the WR_DATA_COUNT from the internal
   //FIFO instance
   generate
      if (C_USE_FWFT_DATA_COUNT==1) begin : block4
         assign WR_DATA_COUNT = WR_DATA_COUNT_FIFO_OUT;
      end
      else begin : block4
         assign WR_DATA_COUNT = WR_DATA_COUNT_FIFO_OUT;
      end
   endgenerate
   //Connect other flags to the internal FIFO instance
   assign       FULL        = FULL_FIFO_OUT;
   assign       ALMOST_FULL = ALMOST_FULL_FIFO_OUT;
   assign       WR_ACK      = WR_ACK_FIFO_OUT;
   assign       OVERFLOW    = OVERFLOW_FIFO_OUT;
   assign       PROG_FULL   = PROG_FULL_FIFO_OUT;
   assign       PROG_EMPTY  = PROG_EMPTY_FIFO_OUT;
  /**************************************************************************
  function integer find_log2;
    input integer int_val;
    integer i,j;
    begin
      i = 1;
      j = 0;
      for (i = 1; i < int_val; i = i*2) begin
        j = j + 1;
      end
      find_log2 = j;
    end
  endfunction
   // if an asynchronous FIFO has been selected, display a message that the FIFO
   //   will not be cycle-accurate in simulation
   initial begin
      if (C_IMPLEMENTATION_TYPE == 2) begin
         $display("WARNING: Behavioral models for independent clock FIFO configurations do not model synchronization delays. The behavioral models are functionally correct, and will represent the behavior of the configured FIFO. See the FIFO Generator User Guide for more information.");
      end else if (C_MEMORY_TYPE == 4) begin
         $display("FAILURE : Behavioral models do not support built-in FIFO configurations. Please use post-synthesis or post-implement simulation in Vivado.");
         $finish;
      end
      if (C_WR_PNTR_WIDTH != find_log2(C_WR_DEPTH)) begin
         $display("FAILURE : C_WR_PNTR_WIDTH is not log2 of C_WR_DEPTH.");
         $finish;
      end
      if (C_RD_PNTR_WIDTH != find_log2(C_RD_DEPTH)) begin
         $display("FAILURE : C_RD_PNTR_WIDTH is not log2 of C_RD_DEPTH.");
         $finish;
      end
      if (C_USE_ECC == 1) begin
         if (C_DIN_WIDTH != C_DOUT_WIDTH) begin
            $display("FAILURE : C_DIN_WIDTH and C_DOUT_WIDTH must be equal for ECC configuration.");
            $finish;
         end
         if (C_DIN_WIDTH == 1 && C_ERROR_INJECTION_TYPE > 1) begin
            $display("FAILURE : C_DIN_WIDTH and C_DOUT_WIDTH must be > 1 for double bit error injection.");
            $finish;
         end
      end
   end //initial
  /**************************************************************************
  assign wr_rst_i         = (C_HAS_RST == 1 || C_ENABLE_RST_SYNC == 0) ? wr_rst_reg : 0;
  assign rd_rst_i         = (C_HAS_RST == 1 || C_ENABLE_RST_SYNC == 0) ? rd_rst_reg : 0;
  assign rst_i            = C_HAS_RST ? rst_reg : 0;
  wire rst_2_sync;
  wire rst_2_sync_safety = (C_ENABLE_RST_SYNC == 1) ? rst_delayed : RD_RST;
  wire clk_2_sync = (C_COMMON_CLOCK == 1) ? CLK : WR_CLK;
  wire clk_2_sync_safety = (C_COMMON_CLOCK == 1) ? CLK : RD_CLK;
  localparam RST_SYNC_STAGES = (C_EN_SAFETY_CKT == 0) ? C_SYNCHRONIZER_STAGE :
                               (C_COMMON_CLOCK == 1) ? 3 : C_SYNCHRONIZER_STAGE+2;
  reg  [RST_SYNC_STAGES-1:0] wrst_reg    = {RST_SYNC_STAGES{1'b0}};
  reg  [RST_SYNC_STAGES-1:0] rrst_reg    = {RST_SYNC_STAGES{1'b0}};
  reg  [RST_SYNC_STAGES-1:0] arst_sync_q = {RST_SYNC_STAGES{1'b0}};
  reg  [RST_SYNC_STAGES-1:0] wrst_q      = {RST_SYNC_STAGES{1'b0}};
  reg  [RST_SYNC_STAGES-1:0] rrst_q      = {RST_SYNC_STAGES{1'b0}};
  reg  [RST_SYNC_STAGES-1:0] rrst_wr     = {RST_SYNC_STAGES{1'b0}};
  reg  [RST_SYNC_STAGES-1:0] wrst_ext    = {RST_SYNC_STAGES{1'b0}};
  reg  [1:0] wrst_cc  = {2{1'b0}};
  reg  [1:0] rrst_cc  = {2{1'b0}};
  generate
      if (C_EN_SAFETY_CKT == 1 && C_INTERFACE_TYPE == 0) begin : grst_safety_ckt
         reg[1:0] rst_d1_safety                  =1;
         reg[1:0] rst_d2_safety                  =1;
         reg[1:0] rst_d3_safety                  =1;
         reg[1:0] rst_d4_safety                  =1;
         reg[1:0] rst_d5_safety                  =1;
         reg[1:0] rst_d6_safety                  =1;
         reg[1:0] rst_d7_safety                  =1;
       always@(posedge rst_2_sync_safety or posedge clk_2_sync_safety) begin : prst
             if (rst_2_sync_safety == 1'b1) begin
                 rst_d1_safety <= 1'b1;
                 rst_d2_safety <= 1'b1;
                 rst_d3_safety <= 1'b1;
                 rst_d4_safety <= 1'b1;
                 rst_d5_safety <= 1'b1;
                 rst_d6_safety <= 1'b1;
                 rst_d7_safety <= 1'b1;
              end
              else begin
                 rst_d1_safety <= #`TCQ 1'b0;
                 rst_d2_safety <= #`TCQ rst_d1_safety;
                 rst_d3_safety <= #`TCQ rst_d2_safety;
                 rst_d4_safety <= #`TCQ rst_d3_safety;
                 rst_d5_safety <= #`TCQ rst_d4_safety;
                 rst_d6_safety <= #`TCQ rst_d5_safety;
                 rst_d7_safety <= #`TCQ rst_d6_safety;
              end //if
              end //prst
        always@(posedge rst_d7_safety or posedge WR_EN) begin : assert_safety
              if(rst_d7_safety == 1 && WR_EN == 1) begin
              $display("WARNING:A write attempt has been made within the 7 clock cycles of reset de-assertion. This can lead to data discrepancy when safety circuit is enabled.");
              end //if
              end //always
        end // grst_safety_ckt
  endgenerate
// if (C_EN_SAFET_CKT == 1)
// assertion:the reset shud be atleast 3 cycles wide.
  generate
    reg  safety_ckt_wr_rst_i  = 1'b0;
      if (C_ENABLE_RST_SYNC == 0) begin : gnrst_sync
        always @* begin
          wr_rst_reg <= wr_rst_delayed;
          rd_rst_reg <= rd_rst_delayed;
          rst_reg    <= 1'b0;
          srst_reg    <= 1'b0;
        end
        assign rst_2_sync  = wr_rst_delayed;
        assign wr_rst_busy = C_EN_SAFETY_CKT ? wr_rst_delayed : 1'b0;
        assign rd_rst_busy = C_EN_SAFETY_CKT ? rd_rst_delayed : 1'b0;
        assign safety_ckt_wr_rst = C_EN_SAFETY_CKT ? wr_rst_delayed : 1'b0;
        assign safety_ckt_rd_rst = C_EN_SAFETY_CKT ? rd_rst_delayed : 1'b0;
      // end : gnrst_sync
      end else if (C_HAS_RST == 1 && C_COMMON_CLOCK == 0) begin : g7s_ic_rst
        reg  fifo_wrst_done = 1'b0;
        reg  fifo_rrst_done = 1'b0;
        reg  sckt_wrst_i    = 1'b0;
        reg  sckt_wrst_i_q  = 1'b0;
        reg  rd_rst_active   = 1'b0;
        reg  rd_rst_middle   = 1'b0;
        reg  sckt_rd_rst_d1  = 1'b0;
        reg  [1:0] rst_delayed_ic_w = 2'h0;
        wire rst_delayed_ic_w_i;
        reg  [1:0] rst_delayed_ic_r = 2'h0;
        wire rst_delayed_ic_r_i;
        wire arst_sync_rst;
        wire fifo_rst_done;
        wire fifo_rst_active;
        assign wr_rst_comb      = !wr_rst_asreg_d2 && wr_rst_asreg;
        assign rd_rst_comb      = C_EN_SAFETY_CKT ? (!rd_rst_asreg_d2 && rd_rst_asreg) || rd_rst_active : !rd_rst_asreg_d2 && rd_rst_asreg;
        assign rst_2_sync       = rst_delayed_ic_w_i;
        assign arst_sync_rst    = arst_sync_q[RST_SYNC_STAGES-1];
        assign wr_rst_busy      = C_EN_SAFETY_CKT ? |arst_sync_q[RST_SYNC_STAGES-1:1] | fifo_rst_active : 1'b0;
        assign rd_rst_busy      = C_EN_SAFETY_CKT ? safety_ckt_rd_rst : 1'b0;
        assign fifo_rst_done    = fifo_wrst_done & fifo_rrst_done;
        assign fifo_rst_active  = sckt_wrst_i | wrst_ext[RST_SYNC_STAGES-1] | rrst_wr[RST_SYNC_STAGES-1];
        always @(posedge WR_CLK or posedge rst_delayed) begin
          if (rst_delayed == 1'b1 && C_HAS_RST)
            rst_delayed_ic_w <= 2'b11;
          else
            rst_delayed_ic_w <= #`TCQ {rst_delayed_ic_w[0],1'b0};
        end
        assign rst_delayed_ic_w_i = rst_delayed_ic_w[1];
        always @(posedge RD_CLK or posedge rst_delayed) begin
          if (rst_delayed == 1'b1 && C_HAS_RST)
            rst_delayed_ic_r <= 2'b11;
          else
            rst_delayed_ic_r <= #`TCQ {rst_delayed_ic_r[0],1'b0};
        end
        assign rst_delayed_ic_r_i = rst_delayed_ic_r[1];
        always @(posedge WR_CLK) begin
          sckt_wrst_i_q       <= #`TCQ sckt_wrst_i;
          sckt_wr_rst_i_q     <= #`TCQ wr_rst_busy;
          safety_ckt_wr_rst_i <= #`TCQ sckt_wrst_i | wr_rst_busy | sckt_wr_rst_i_q;
          if (arst_sync_rst && ~fifo_rst_active)
            sckt_wrst_i <= #`TCQ 1'b1;
          else if (sckt_wrst_i && fifo_rst_done)
              sckt_wrst_i <= #`TCQ 1'b0;
          else
            sckt_wrst_i <= #`TCQ sckt_wrst_i;
          if (rrst_wr[RST_SYNC_STAGES-2] & ~rrst_wr[RST_SYNC_STAGES-1])
            fifo_rrst_done <= #`TCQ 1'b1;
          else if (fifo_rst_done)
            fifo_rrst_done <= #`TCQ 1'b0;
          else
            fifo_rrst_done <= #`TCQ fifo_rrst_done;
          if (wrst_ext[RST_SYNC_STAGES-2] & ~wrst_ext[RST_SYNC_STAGES-1])
            fifo_wrst_done <= #`TCQ 1'b1;
          else if (fifo_rst_done)
            fifo_wrst_done <= #`TCQ 1'b0;
          else
            fifo_wrst_done <= #`TCQ fifo_wrst_done;
        end
        always @(posedge WR_CLK or posedge rst_delayed_ic_w_i) begin
          if (rst_delayed_ic_w_i == 1'b1) begin
            wr_rst_asreg <= 1'b1;
          end else begin
            if (wr_rst_asreg_d1 == 1'b1) begin
              wr_rst_asreg <= #`TCQ 1'b0;
            end else begin
              wr_rst_asreg <= #`TCQ wr_rst_asreg;
            end
          end
        end
        always @(posedge WR_CLK or posedge rst_delayed) begin
          if (rst_delayed == 1'b1) begin
            wr_rst_asreg <= 1'b1;
          end else begin
            if (wr_rst_asreg_d1 == 1'b1) begin
              wr_rst_asreg <= #`TCQ 1'b0;
            end else begin
              wr_rst_asreg <= #`TCQ wr_rst_asreg;
            end
          end
        end
        always @(posedge WR_CLK) begin
          wrst_reg    <= #`TCQ {wrst_reg[RST_SYNC_STAGES-2:0],wr_rst_asreg};
          wrst_ext    <= #`TCQ {wrst_ext[RST_SYNC_STAGES-2:0],sckt_wrst_i};
          rrst_wr     <= #`TCQ {rrst_wr[RST_SYNC_STAGES-2:0],safety_ckt_rd_rst};
          arst_sync_q <= #`TCQ {arst_sync_q[RST_SYNC_STAGES-2:0],rst_delayed_ic_w_i};
        end
        assign wr_rst_asreg_d1 = wrst_reg[RST_SYNC_STAGES-2];
        assign wr_rst_asreg_d2 = C_EN_SAFETY_CKT ? wrst_reg[RST_SYNC_STAGES-1] : wrst_reg[1];
        assign safety_ckt_wr_rst = C_EN_SAFETY_CKT ? safety_ckt_wr_rst_i : 1'b0;
        always @(posedge WR_CLK or posedge wr_rst_comb) begin
          if (wr_rst_comb == 1'b1) begin
            wr_rst_reg <= 1'b1;
          end else begin
            wr_rst_reg <= #`TCQ 1'b0;
          end
        end
        always @(posedge RD_CLK or posedge rst_delayed_ic_r_i) begin
          if (rst_delayed_ic_r_i == 1'b1) begin
            rd_rst_asreg  <= 1'b1;
          end else begin
            if (rd_rst_asreg_d1 == 1'b1) begin
              rd_rst_asreg <= #`TCQ 1'b0;
            end else begin
              rd_rst_asreg <= #`TCQ rd_rst_asreg;
            end
          end
        end
        always @(posedge RD_CLK) begin
          rrst_reg        <= #`TCQ {rrst_reg[RST_SYNC_STAGES-2:0],rd_rst_asreg};
          rrst_q          <= #`TCQ {rrst_q[RST_SYNC_STAGES-2:0],sckt_wrst_i};
          rrst_cc         <= #`TCQ {rrst_cc[0],rd_rst_asreg_d2};
          sckt_rd_rst_d1  <= #`TCQ safety_ckt_rd_rst;
          if (!rd_rst_middle && rrst_reg[1] && !rrst_reg[2]) begin
            rd_rst_active <= #`TCQ 1'b1;
            rd_rst_middle <= #`TCQ 1'b1;
          end else if (safety_ckt_rd_rst)
            rd_rst_active <= #`TCQ 1'b0;
          else if (sckt_rd_rst_d1 && !safety_ckt_rd_rst)
            rd_rst_middle <= #`TCQ 1'b0;
        end
        assign rd_rst_asreg_d1 = rrst_reg[RST_SYNC_STAGES-2];
        assign rd_rst_asreg_d2 = C_EN_SAFETY_CKT ? rrst_reg[RST_SYNC_STAGES-1] : rrst_reg[1];
        assign safety_ckt_rd_rst = C_EN_SAFETY_CKT ? rrst_q[2] : 1'b0;
        always @(posedge RD_CLK or posedge rd_rst_comb) begin
          if (rd_rst_comb == 1'b1) begin
            rd_rst_reg <= 1'b1;
          end else begin
            rd_rst_reg <= #`TCQ 1'b0;
          end
        end
      // end : g7s_ic_rst
      end else if (C_HAS_RST == 1 && C_COMMON_CLOCK == 1) begin : g7s_cc_rst
        reg  [1:0] rst_delayed_cc   = 2'h0;
        wire rst_delayed_cc_i;
        assign rst_comb    = !rst_asreg_d2 && rst_asreg;
        assign rst_2_sync  = rst_delayed_cc_i;
        assign wr_rst_busy = C_EN_SAFETY_CKT ? |arst_sync_q[RST_SYNC_STAGES-1:1] | wrst_cc[1] : 1'b0;
        assign rd_rst_busy = C_EN_SAFETY_CKT ? arst_sync_q[1] | arst_sync_q[RST_SYNC_STAGES-1] | wrst_cc[1] : 1'b0;
        always @(posedge CLK or posedge rst_delayed) begin
          if (rst_delayed == 1'b1)
            rst_delayed_cc <= 2'b11;
          else
            rst_delayed_cc <= #`TCQ {rst_delayed_cc,1'b0};
        end
        assign rst_delayed_cc_i = rst_delayed_cc[1];
        always @(posedge CLK or posedge rst_delayed_cc_i) begin
          if (rst_delayed_cc_i == 1'b1) begin
            rst_asreg <= 1'b1;
          end else begin
            if (rst_asreg_d1 == 1'b1) begin
              rst_asreg <= #`TCQ 1'b0;
            end else begin
              rst_asreg <= #`TCQ rst_asreg;
            end
          end
        end
        always @(posedge CLK) begin
          wrst_reg <= #`TCQ {wrst_reg[RST_SYNC_STAGES-2:0],rst_asreg};
          wrst_cc  <= #`TCQ {wrst_cc[0],arst_sync_q[RST_SYNC_STAGES-1]};
          sckt_wr_rst_i_q     <= #`TCQ wr_rst_busy;
          safety_ckt_wr_rst_i <= #`TCQ wrst_cc[1] | wr_rst_busy | sckt_wr_rst_i_q;
          arst_sync_q <= #`TCQ {arst_sync_q[RST_SYNC_STAGES-2:0],rst_delayed_cc_i};
        end
        assign rst_asreg_d1 = wrst_reg[RST_SYNC_STAGES-2];
        assign rst_asreg_d2 = C_EN_SAFETY_CKT ? wrst_reg[RST_SYNC_STAGES-1] : wrst_reg[1];
        assign safety_ckt_wr_rst = C_EN_SAFETY_CKT ? safety_ckt_wr_rst_i : 1'b0;
        assign safety_ckt_rd_rst = C_EN_SAFETY_CKT ? safety_ckt_wr_rst_i : 1'b0;
        always @(posedge CLK or posedge rst_comb) begin
          if (rst_comb == 1'b1) begin
            rst_reg <= 1'b1;
          end else begin
            rst_reg <= #`TCQ 1'b0;
          end
        end
      // end : g7s_cc_rst
      end else if (IS_8SERIES == 1 && C_HAS_SRST == 1 && C_COMMON_CLOCK == 1) begin : g8s_cc_rst
        assign wr_rst_busy = (C_MEMORY_TYPE != 4) ? rst_reg : rst_active_i;
        assign rd_rst_busy = rst_reg;
        assign rst_2_sync = srst_delayed;
        always @* rst_full_ff_i  <= rst_reg;
        always @* rst_full_gen_i <= C_FULL_FLAGS_RST_VAL == 1 ? rst_active_i : 0;
        assign safety_ckt_wr_rst = C_EN_SAFETY_CKT ? rst_reg | wr_rst_busy | sckt_wr_rst_i_q : 1'b0;
        assign safety_ckt_rd_rst = C_EN_SAFETY_CKT ? rst_reg | wr_rst_busy | sckt_wr_rst_i_q : 1'b0;
        always @(posedge CLK) begin
          rst_delayed_d1 <= #`TCQ srst_delayed;
          rst_delayed_d2 <= #`TCQ rst_delayed_d1;
          sckt_wr_rst_i_q <= #`TCQ wr_rst_busy;
          if (rst_reg || rst_delayed_d2) begin
            rst_active_i <= #`TCQ 1'b1;
          end else begin
            rst_active_i <= #`TCQ rst_reg;
          end
        end
        always @(posedge CLK) begin
          if (~rst_reg && srst_delayed) begin
             rst_reg <= #`TCQ 1'b1;
           end else if (rst_reg) begin
             rst_reg <= #`TCQ 1'b0;
           end else begin
             rst_reg <= #`TCQ rst_reg;
           end
        end
      // end : g8s_cc_rst
      end else begin
        assign wr_rst_busy = 1'b0;
        assign rd_rst_busy = 1'b0;
        assign safety_ckt_wr_rst = 1'b0;
        assign safety_ckt_rd_rst = 1'b0;
      end
  endgenerate
  generate
    if ((C_HAS_RST == 1 || C_HAS_SRST == 1 || C_ENABLE_RST_SYNC == 0) && C_FULL_FLAGS_RST_VAL == 1) begin : grstd1
    // RST_FULL_GEN replaces the reset falling edge detection used to de-assert
    // FULL, ALMOST_FULL & PROG_FULL flags if C_FULL_FLAGS_RST_VAL = 1.
    // RST_FULL_FF goes to the reset pin of the final flop of FULL, ALMOST_FULL &
    // PROG_FULL
      reg rst_d1 = 1'b0;
      reg rst_d2 = 1'b0;
      reg rst_d3 = 1'b0;
      reg rst_d4 = 1'b0;
      reg rst_d5 = 1'b0;
      always @ (posedge rst_2_sync or posedge clk_2_sync) begin
        if (rst_2_sync) begin
          rst_d1         <= 1'b1;
          rst_d2         <= 1'b1;
          rst_d3         <= 1'b1;
          rst_d4         <= 1'b1;
        end else begin
          if (srst_delayed) begin
            rst_d1         <= #`TCQ 1'b1;
            rst_d2         <= #`TCQ 1'b1;
            rst_d3         <= #`TCQ 1'b1;
            rst_d4         <= #`TCQ 1'b1;
          end else begin
            rst_d1         <= #`TCQ wr_rst_busy;
            rst_d2         <= #`TCQ rst_d1;
            rst_d3         <= #`TCQ rst_d2 | safety_ckt_wr_rst;
            rst_d4         <= #`TCQ rst_d3;
          end
        end
      end
      always @* rst_full_ff_i  <= (C_HAS_SRST == 0) ? rst_d2 : 1'b0 ;
      always @* rst_full_gen_i <= rst_d3;
    end else if ((C_HAS_RST == 1 || C_HAS_SRST == 1 || C_ENABLE_RST_SYNC == 0) && C_FULL_FLAGS_RST_VAL == 0) begin : gnrst_full
      always @* rst_full_ff_i  <= (C_COMMON_CLOCK == 0) ? wr_rst_i : rst_i;
    end
  endgenerate // grstd1
endmodule