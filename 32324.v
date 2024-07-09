module FF18_INTERNAL_VLOG (ALMOSTEMPTY, ALMOSTFULL, DBITERR, DO, DOP, ECCPARITY, EMPTY, FULL, RDCOUNT, RDERR, SBITERR, WRCOUNT, WRERR,
      DI, DIP, GSR, INJECTDBITERR, INJECTSBITERR, RDCLK, RDEN, REGCE, RST, RSTREG, WRCLK, WREN);
    output reg ALMOSTEMPTY;
    output reg ALMOSTFULL;
    output DBITERR;
    output [63:0] DO;
    output [7:0] DOP;
    output [7:0] ECCPARITY;
    output reg EMPTY;
    output reg FULL;
    output reg [12:0] RDCOUNT;
    output reg RDERR;
    output SBITERR;
    output reg [12:0] WRCOUNT;
    output reg WRERR;
    input [63:0] DI;
    input [7:0] DIP;
    input RDCLK;
    input RDEN;
    input REGCE;
    input RST;
    input RSTREG;
    input WRCLK;
    input WREN;
    input GSR;
    input INJECTDBITERR;
    input INJECTSBITERR;
    parameter integer DATA_WIDTH = 4;
    parameter integer DO_REG = 1;
    parameter EN_SYN = "FALSE";
    parameter FIFO_MODE = "FIFO36";
    parameter FIRST_WORD_FALL_THROUGH = "FALSE";
    parameter ALMOST_EMPTY_OFFSET = 13'h0080;
    parameter ALMOST_FULL_OFFSET = 13'h0080;
    parameter EN_ECC_WRITE = "FALSE";
    parameter EN_ECC_READ = "FALSE";
    parameter INIT = 72'h0;
    parameter SIM_DEVICE = "7SERIES";
    parameter SRVAL = 72'h0;
    reg [63:0] do_in = 64'b0;
    reg [63:0] do_out = 64'b0;
    reg [63:0] do_outreg = 64'b0;
    reg [63:0] do_out_mux = 64'b0;
    reg [7:0] dop_in = 8'b0, dop_out = 8'b0;
    reg [7:0] dop_outreg = 8'b0, dop_out_mux = 8'b0;
    reg dbiterr_out = 0, sbiterr_out = 0;
    reg dbiterr_out_out = 0, sbiterr_out_out = 0;
    reg [71:0] ecc_bit_position;
    reg [7:0] eccparity_out = 8'b0;
    reg [7:0] dopr_ecc, dop_buf = 8'b0, dip_ecc, dip_int;
    reg [63:0] do_buf = 64'b0, di_in_ecc_corrected;
    reg [7:0] syndrome, dip_in_ecc_corrected;
    wire full_v3;
    reg rden_reg, wren_reg;
    reg fwft;
    integer addr_limit, rd_prefetch = 0;
    integer wr1_addr = 0;
    integer viol_rst_rden = 0, viol_rst_wren = 0;
    reg [3:0] rden_rdckreg = 4'b0, wren_wrckreg = 4'b0;
    reg [12:0] rd_addr = 0;
    reg [12:0] rdcount_out_out = 13'b0, wr_addr_out = 13'b0;
    reg rd_flag = 0, rdcount_flag = 0, rdprefetch_flag = 0, wr_flag = 0;
    reg wr1_flag = 0, awr_flag = 0;
    reg [3:0] almostfull_int = 4'b0000, almostempty_int = 4'b1111;
    reg [3:0] full_int = 4'b0000;
    reg [3:0] empty_ram = 4'b1111;
    reg [8:0] i, j;
    reg rst_tmp1 = 0, rst_tmp2 = 0;
    reg [4:0] rst_rdckreg = 5'b0, rst_wrckreg = 5'b0;
    reg rst_rdclk_flag = 0, rst_wrclk_flag = 0;
    reg en_ecc_write_int, en_ecc_read_int, finish_error = 0;
    reg [63:0] di_ecc_col;
    reg first_rst_flag = 0;
    reg rm1wp1_eq = 1'b0, rm1w_eq = 1'b0;
    reg awr_flag_sync_1 = 0, awr_flag_sync_2 = 0;
    integer after_rst_rdclk = 0, after_rst_wrclk = 0;
    integer count_freq_rdclk = 0, count_freq_wrclk = 0;
    integer roundup_int_period_rdclk_wrclk=0, roundup_int_period_wrclk_rdclk=0;
    integer s7_roundup_int_period_rdclk_wrclk=0;
    time rise_rdclk=0, period_rdclk=0, rise_wrclk=0, period_wrclk=0;
    integer fwft_prefetch_flag = 1;
    real real_period_rdclk=0.0, real_period_wrclk=0.0;
    reg rst_trans_rden_1 = 1'b0, rst_trans_rden_2 = 1'b0;
    reg rst_trans_wren_1 = 1'b0, rst_trans_wren_2 = 1'b0;
    reg after_rst_rden_flag = 1'b0, after_rst_wren_flag = 1'b0, after_rst_x_flag = 1'b0;
    time time_wrclk = 0, time_rdclk = 0;
    time prev_time_wrclk = 0, prev_time_rdclk = 0;
    reg sync_clk_async_mode = 1'b0;
    reg sync_clk_async_mode_done = 1'b0;
    reg  count_freq_wrclk_reset = 0;
// xilinx_internal_parameter on
    // WARNING !!!: This model may not work properly if the following parameter is changed.
    parameter integer FIFO_SIZE = 36;
// xilinx_internal_parameter off
    localparam counter_width = (FIFO_SIZE == 36) ? ((DATA_WIDTH == 4) ? 12 :
             (DATA_WIDTH == 9) ? 11 : (DATA_WIDTH == 18) ? 10 :
             (DATA_WIDTH == 36) ? 9 : (DATA_WIDTH == 72) ? 8 : 12)
                               : ((DATA_WIDTH == 4) ? 11 : (DATA_WIDTH == 9) ? 10 :
          (DATA_WIDTH == 18) ? 9 : (DATA_WIDTH == 36) ? 8 : 11);
    reg [counter_width:0] rdcount_out = 13'b0, wr_addr = 13'b0;
    reg [counter_width:0] ae_empty, ae_full;
    reg [counter_width:0] rdcount_out_sync_3 = 13'h1fff, rdcount_out_sync_2 = 13'h1fff;
    reg [counter_width:0] rdcount_out_sync_1 = 13'h1fff, rdcount_out_m1 = 13'h1fff;
    reg [counter_width:0] wr_addr_sync_3 = 13'b0, wr_addr_sync_2 = 13'b0, wr_addr_sync_1 = 13'b0;
    // Determinte memory size
    localparam mem_size4 = (FIFO_SIZE == 18) ? 4095 : (FIFO_SIZE == 36) ? 8191 : 0;
    localparam mem_size9 = (FIFO_SIZE == 18) ? 2047 : (FIFO_SIZE == 36) ? 4095 : 0;
    localparam mem_size18 = (FIFO_SIZE == 18) ? 1023 : (FIFO_SIZE == 36) ? 2047 : 0;
    localparam mem_size36 = (FIFO_SIZE == 18) ? 511 : (FIFO_SIZE == 36) ? 1023 : 0;
    localparam mem_size72 = (FIFO_SIZE == 18) ? 0 : (FIFO_SIZE == 36) ? 511 : 0;
    localparam mem_depth = (DATA_WIDTH == 4) ? mem_size4 : (DATA_WIDTH == 9) ? mem_size9 :
         (DATA_WIDTH == 18) ? mem_size18 : (DATA_WIDTH == 36) ? mem_size36 :
         (DATA_WIDTH == 72) ? mem_size72 : 0;
    localparam mem_width = (DATA_WIDTH == 4) ? 3 : (DATA_WIDTH == 9) ? 7 :
         (DATA_WIDTH == 18) ? 15 : (DATA_WIDTH == 36) ? 31 : (DATA_WIDTH == 72) ? 63 : 0;
    localparam memp_depth = (DATA_WIDTH == 4) ? mem_size4 : (DATA_WIDTH == 9) ? mem_size9 :
          (DATA_WIDTH == 18) ? mem_size18 : (DATA_WIDTH == 36) ? mem_size36 :
          (DATA_WIDTH == 72) ? mem_size72 : 0;
    localparam memp_width = (DATA_WIDTH == 4 || DATA_WIDTH == 9) ? 1 :
          (DATA_WIDTH == 18) ? 1 : (DATA_WIDTH == 36) ? 3 : (DATA_WIDTH == 72) ? 7 : 0;
    reg [mem_width : 0] mem [mem_depth : 0];
    reg [memp_width : 0] memp [memp_depth : 0];
    reg sync;
    // Input and output ports
    assign SBITERR = sbiterr_out_out;
    assign DBITERR = dbiterr_out_out;
    assign ECCPARITY = eccparity_out;
  initial begin
    ALMOSTEMPTY = 1'b1;
    ALMOSTFULL = 1'b0;
    EMPTY = 1'b1;
    FULL = 1'b0;
    RDCOUNT = 13'h0;
    RDERR = 1'b0;
    WRCOUNT = 13'h0;
    WRERR = 1'b0;
  end
    assign full_v3 = (rm1w_eq || (rm1wp1_eq && (WREN && !FULL))) ? 1 : 0;
    initial begin
  // Determine address limit
  case (DATA_WIDTH)
      4 : begin
        if (FIFO_SIZE == 36)
      addr_limit = 8192;
        else
      addr_limit = 4096;
    end
      9 : begin
        if (FIFO_SIZE == 36)
      addr_limit = 4096;
        else
      addr_limit = 2048;
    end
     18 : begin
              if (FIFO_SIZE == 36)
      addr_limit = 2048;
        else
      addr_limit = 1024;
    end
     36 : begin
              if (FIFO_SIZE == 36)
      addr_limit = 1024;
        else
      addr_limit = 512;
    end
     72 : begin
        addr_limit = 512;
    end
     default :
    begin
        $display("Attribute Syntax Error : The attribute DATA_WIDTH on FIFO18E1 instance %m is set to %d.  Legal values for this attribute are 4, 9, 18, 36 or 72.", DATA_WIDTH);
        finish_error = 1;
    end
  endcase
  case (EN_SYN)
      "FALSE" : sync = 0;
      "TRUE"  : sync = 1;
      default : begin
              $display("Attribute Syntax Error : The attribute EN_SYN on FIFO18E1 instance %m is set to %s.  Legal values for this attribute are TRUE or FALSE.", EN_SYN);
              finish_error = 1;
                end
  endcase // case(EN_SYN)
  case (FIRST_WORD_FALL_THROUGH)
      "FALSE" : begin
              fwft = 0;
              if (EN_SYN == "FALSE") begin
            ae_empty = ALMOST_EMPTY_OFFSET - 1;
              ae_full = ALMOST_FULL_OFFSET;
        end
        else begin
            ae_empty = ALMOST_EMPTY_OFFSET;
              ae_full = ALMOST_FULL_OFFSET;
        end
          end
      "TRUE"  : begin
              fwft = 1;
              ae_empty = ALMOST_EMPTY_OFFSET - 2;
               ae_full = ALMOST_FULL_OFFSET;
                end
      default : begin
    $display("Attribute Syntax Error : The attribute FIRST_WORD_FALL_THROUGH on FIFO18E1 instance %m is set to %s.  Legal values for this attribute are TRUE or FALSE.", FIRST_WORD_FALL_THROUGH);
    finish_error = 1;
        end
  endcase
  // DRC for fwft in sync mode
  if (fwft == 1'b1 && EN_SYN == "TRUE") begin
      $display("DRC Error : First word fall through is not supported in synchronous mode on FIFO18E1 instance %m.");
      finish_error = 1;
  end
  if (EN_SYN == "FALSE" && DO_REG == 0) begin
      $display("DRC Error : DO_REG = 0 is invalid when EN_SYN is set to FALSE on FIFO18E1 instance %m.");
      finish_error = 1;
  end
  case (EN_ECC_WRITE)
      "TRUE"  : en_ecc_write_int <= 1;
      "FALSE" : en_ecc_write_int <= 0;
      default : begin
                     $display("Attribute Syntax Error : The attribute EN_ECC_WRITE on FIFO18E1 instance %m is set to %s.  Legal values for this attribute are TRUE or FALSE.", EN_ECC_WRITE);
              finish_error = 1;
          end
  endcase
  case (EN_ECC_READ)
      "TRUE"  : en_ecc_read_int <= 1;
      "FALSE" : en_ecc_read_int <= 0;
      default : begin
                     $display("Attribute Syntax Error : The attribute EN_ECC_READ on FIFO18E1 instance %m is set to %s.  Legal values for this attribute are TRUE or FALSE.", EN_ECC_READ);
              finish_error = 1;
          end
  endcase
  if ((EN_ECC_READ == "TRUE" || EN_ECC_WRITE == "TRUE") && DATA_WIDTH != 72) begin
      $display("DRC Error : The attribute DATA_WIDTH must be set to 72 when FIFO18E1 is configured in the ECC mode.");
      finish_error = 1;
  end
  if (!(SIM_DEVICE == "VIRTEX6" || SIM_DEVICE == "7SERIES")) begin
      $display("Attribute Syntax Error : The Attribute SIM_DEVICE on FIFO18E1 instance %m is set to %s.  Legal values for this attribute are VIRTEX6, or 7SERIES.", SIM_DEVICE);
      finish_error = 1;
  end
  if (finish_error == 1)
      #1 $finish;
    end // initial begin
    // GSR and RST
    always @(GSR)
  if (GSR === 1'b1) begin
      if (DO_REG == 1'b1 && sync == 1'b1) begin
    assign do_out = INIT[0 +: mem_width+1];
    assign dop_out = INIT[mem_width+1 +: memp_width+1];
    assign do_outreg = INIT[0 +: mem_width+1];
    assign dop_outreg = INIT[mem_width+1 +: memp_width+1];
    assign do_in = INIT[0 +: mem_width+1];
    assign dop_in = INIT[mem_width+1 +: memp_width+1];
    assign do_buf = INIT[0 +: mem_width+1];
    assign dop_buf = INIT[mem_width+1 +: memp_width+1];
      end
      else begin
    assign do_out = 64'b0;
    assign dop_out = 8'b0;
    assign do_outreg = 64'b0;
    assign dop_outreg = 8'b0;
    assign do_in = 64'b0;
    assign dop_in = 8'b0;
    assign do_buf = 64'b0;
    assign dop_buf = 8'b0;
      end
  end
  else if (GSR === 1'b0) begin
      deassign do_out;
      deassign dop_out;
      deassign do_outreg;
      deassign dop_outreg;
      deassign do_in;
      deassign dop_in;
      deassign do_buf;
      deassign dop_buf;
  end
    always @(RST)
  if (RST === 1'b1) begin
      assign almostempty_int = 4'b1111;
      ALMOSTEMPTY = 1'b1;
      assign almostfull_int = 4'b0000;
      ALMOSTFULL = 1'b0;
      assign empty_ram = 4'b1111;
      EMPTY = 1'b1;
      assign full_int = 4'b0000;
      FULL = 1'b0;
      assign rdcount_out = 13'b0;
      RDCOUNT = 13'b0;
      WRCOUNT = 13'b0;
      RDERR = 0;
      WRERR = 0;
      assign rd_addr = 0;
      assign rd_prefetch = 0;
      assign wr_addr = 0;
      assign wr1_addr = 0;
      assign rdcount_flag = 0;
      assign rd_flag = 0;
      assign rdprefetch_flag = 0;
      assign wr_flag = 0;
      assign wr1_flag = 0;
      assign awr_flag = 0;
      assign rdcount_out_sync_3 = 13'b1111111111111;
      assign rdcount_out_m1 = 13'b1111111111111;
      assign wr_addr_sync_3 = 13'b0;
  end
  else if (RST === 1'b0) begin
      deassign almostempty_int;
//      deassign ALMOSTEMPTY;
      deassign almostfull_int;
//      deassign ALMOSTFULL;
      deassign empty_ram;
//      deassign EMPTY;
      deassign full_int;
//      deassign FULL;
      deassign rdcount_out;
//      deassign RDCOUNT;
//            deassign WRCOUNT;
//      deassign RDERR;
//      deassign WRERR;
      deassign rd_addr;
      deassign rd_prefetch;
      deassign wr_addr;
      deassign wr1_addr;
      deassign rdcount_flag;
      deassign rd_flag;
      deassign rdprefetch_flag;
      deassign wr_flag;
      deassign wr1_flag;
      deassign awr_flag;
      deassign rdcount_out_sync_3;
      deassign rdcount_out_m1;
      deassign wr_addr_sync_3;
  end
    // DRC
    generate
        case (SIM_DEVICE)
      "VIRTEX6" : begin
    always @(posedge RDCLK) begin
        if (RST === 1'b1 && RDEN === 1'b1)
      viol_rst_rden = 1;
        if (RST === 1'b0)
      rden_rdckreg[3:0] <= {rden_rdckreg[2:0], RDEN};
        if (rden_rdckreg == 4'h0) begin
      rst_rdckreg[0] <= RST;
      rst_rdckreg[1] <= rst_rdckreg[0] & RST;
      rst_rdckreg[2] <= rst_rdckreg[1] & RST;
        end
    end // always @ (posedge RDCLK)
    always @(posedge WRCLK) begin
        if (RST === 1'b1 && WREN === 1'b1)
      viol_rst_wren = 1;
        if (RST === 1'b0)
      wren_wrckreg[3:0] <= {wren_wrckreg[2:0], WREN};
        if (wren_wrckreg == 4'h0) begin
      rst_wrckreg[0] <= RST;
      rst_wrckreg[1] <= rst_wrckreg[0] & RST;
      rst_wrckreg[2] <= rst_wrckreg[1] & RST;
        end
    end // always @ (posedge WRCLK)
                always @(RST) begin
        rst_tmp1 = RST;
        rst_rdclk_flag = 0;
        rst_wrclk_flag = 0;
        if (rst_tmp1 == 0 && rst_tmp2 == 1) begin
      if (((rst_rdckreg[2] & rst_rdckreg[1] & rst_rdckreg[0]) == 0) || viol_rst_rden == 1) begin
          $display("DRC Error : Reset is unsuccessful at time %t.  RST must be held high for at least three RDCLK clock cycles, and RDEN must be low for four clock cycles before RST becomes active high, and RDEN remains low during this reset cycle.", $stime);
          rst_rdclk_flag = 1;
         #1 $finish;
      end
      if (((rst_wrckreg[2] & rst_wrckreg[1] & rst_wrckreg[0]) == 0) || viol_rst_wren == 1) begin
          $display("DRC Error : Reset is unsuccessful at time %t.  RST must be held high for at least three WRCLK clock cycles, and WREN must be low for four clock cycles before RST becomes active high, and WREN remains low during this reset cycle.", $stime);
          rst_wrclk_flag = 1;
         #1 $finish;
      end
      if ((rst_rdclk_flag | rst_wrclk_flag) == 1) begin
          FULL = 1'bX;
          EMPTY = 1'bX;
          RDERR = 1'bX;
          WRERR = 1'bX;
          assign eccparity_out = 8'bx;
          assign rdcount_out = 13'bx;
          RDCOUNT = 13'bx;
          WRCOUNT = 13'bx;
          assign wr_addr = 13'bx;
          assign wr1_addr = 0;
          assign almostempty_int = 4'b1111;
          ALMOSTEMPTY = 1'bx;
          assign almostfull_int = 4'b0000;
          ALMOSTFULL = 1'bx;
          assign empty_ram = 4'b1111;
          assign full_int = 4'b0000;
          assign rd_addr = 0;
          assign rd_prefetch = 0;
          assign rdcount_flag = 0;
          assign rd_flag = 0;
          assign rdprefetch_flag = 0;
          assign wr_flag = 0;
          assign wr1_flag = 0;
          assign awr_flag = 0;
      end
      else if (RST == 1'b0) begin
//          deassign FULL;
//          deassign EMPTY;
//          deassign RDERR;
//          deassign WRERR;
          deassign eccparity_out;
          deassign rdcount_out;
          rdcount_out = 13'b0;
          deassign wr_addr;
          wr_addr = 13'b0;
//          deassign RDCOUNT;
//          deassign WRCOUNT;
          deassign wr1_addr;
          deassign almostempty_int;
//          deassign ALMOSTEMPTY;
          deassign almostfull_int;
//          deassign ALMOSTFULL;
          deassign empty_ram;
          deassign full_int;
          deassign rd_addr;
          deassign rd_prefetch;
          deassign rdcount_flag;
          deassign rd_flag;
          deassign rdprefetch_flag;
          deassign wr_flag;
          deassign wr1_flag;
          deassign awr_flag;
      end // if (RST == 1'b0)
      viol_rst_rden = 0;
      viol_rst_wren = 0;
      rden_rdckreg = 4'h0;
      wren_wrckreg = 4'h0;
      rst_rdckreg = 5'b0;
      rst_wrckreg = 5'b0;
      if (rst_rdclk_flag == 0 && rst_wrclk_flag == 0 && first_rst_flag == 0)
          first_rst_flag = 1;
        end // if (rst_tmp1 == 0 && rst_tmp2 == 1)
        rst_tmp2 = rst_tmp1;
    end // always @ (RST)
            end // case: "VIRTEX6"
      "7SERIES" : begin
    always @(posedge RST)
        rst_trans_rden_1 = RST;
    always @(negedge RST)
        if (rst_trans_rden_1 == 1'b1)
        rst_trans_rden_2 = ~RST;
    always @(posedge RDCLK) begin
        if (rst_trans_rden_1 == 1'b1 && rst_trans_rden_2 == 1'b1) begin
      after_rst_rdclk = after_rst_rdclk + 1;
      if (RDEN === 1'b1 && after_rst_rdclk <= 2) begin
          after_rst_rden_flag = 1'b1;
      end
      else if (after_rst_rdclk >= 3) begin
          after_rst_rdclk = 0;
          rst_trans_rden_1 = 1'b0;
          rst_trans_rden_2 = 1'b0;
          if (after_rst_rden_flag == 1'b1) begin
        $display("DRC Error : Reset is unsuccessful at time %t.  RDEN must be low for at least two RDCLK clock cycles after RST deasserted.", $stime);
        after_rst_rden_flag = 1'b0;
        after_rst_x_flag = 1'b1;
         #1 $finish;
          end
      end
        end // if (rst_trans_rden_1 == 1'b1 && rst_trans_rden_2 == 1'b1)
    end // always @ (posedge RDCLK)
    always @(posedge RST)
        rst_trans_wren_1 = RST;
    always @(negedge RST)
        if (rst_trans_wren_1 == 1'b1)
        rst_trans_wren_2 = ~RST;
    always @(posedge WRCLK) begin
        if (rst_trans_wren_1 == 1'b1 && rst_trans_wren_2 == 1'b1) begin
      after_rst_wrclk = after_rst_wrclk + 1;
      if (WREN === 1'b1 && after_rst_wrclk <= 2) begin
          after_rst_wren_flag = 1'b1;
      end
      else if (after_rst_wrclk >= 3) begin
          after_rst_wrclk = 0;
          rst_trans_wren_1 = 1'b0;
          rst_trans_wren_2 = 1'b0;
          if (after_rst_wren_flag == 1'b1) begin
        $display("DRC Error : Reset is unsuccessful at time %t.  WREN must be low for at least two WRCLK clock cycles after RST deasserted.", $stime);
        after_rst_wren_flag = 1'b0;
        after_rst_x_flag = 1'b1;
         #1 $finish;
          end
      end
        end // if (rst_trans_wren_1 == 1'b1 && rst_trans_wren_2 == 1'b1)
    end // always @ (posedge WRCLK)
    always @(posedge after_rst_x_flag or negedge RST) begin
        if (after_rst_x_flag == 1'b1) begin
      FULL = 1'bX;
      EMPTY = 1'bX;
      RDERR = 1'bX;
      WRERR = 1'bX;
      assign eccparity_out = 8'bx;
      assign rdcount_out = 13'bx;
      RDCOUNT = 13'bx;
      WRCOUNT = 13'bx;
      assign wr_addr = 13'bx;
      assign wr1_addr = 0;
      assign almostempty_int = 4'b1111;
      ALMOSTEMPTY = 1'bx;
      assign almostfull_int = 4'b0000;
      ALMOSTFULL = 1'bx;
      assign empty_ram = 4'b1111;
      assign full_int = 4'b0000;
      assign rd_addr = 0;
      assign rd_prefetch = 0;
      assign rdcount_flag = 0;
      assign rd_flag = 0;
      assign rdprefetch_flag = 0;
      assign wr_flag = 0;
      assign wr1_flag = 0;
      assign awr_flag = 0;
      assign rdcount_out_sync_3 = 13'bx;
      assign rdcount_out_m1 = 13'bx;
      assign wr_addr_sync_3 = 13'bx;
      after_rst_x_flag = 1'b0;
        end
        else if (RST == 1'b0) begin
//      deassign FULL;
//      deassign EMPTY;
//      deassign RDERR;
//      deassign WRERR;
      deassign eccparity_out;
      deassign rdcount_out;
      rdcount_out = 13'b0;
      deassign wr_addr;
      wr_addr = 13'b0;
//      deassign RDCOUNT;
//      deassign WRCOUNT;
      deassign wr1_addr;
      deassign almostempty_int;
//      deassign ALMOSTEMPTY;
      deassign almostfull_int;
      deassign ALMOSTFULL;
      deassign empty_ram;
      deassign full_int;
      deassign rd_addr;
      deassign rd_prefetch;
      deassign rdcount_flag;
      deassign rd_flag;
      deassign rdprefetch_flag;
      deassign wr_flag;
      deassign wr1_flag;
      deassign awr_flag;
      deassign rdcount_out_sync_3;
      deassign rdcount_out_m1;
      deassign wr_addr_sync_3;
        end // if (RST == 1'b0)
    end // always @ (posedge after_rst_x_flag or negedge RST)
    always @(posedge RDCLK) begin
        if (RST === 1'b1 && RDEN === 1'b1)
      viol_rst_rden = 1;
        if (RDEN === 1'b0 && RST === 1'b1) begin
      rst_rdckreg[0] <= RST;
      rst_rdckreg[1] <= rst_rdckreg[0] & RST;
      rst_rdckreg[2] <= rst_rdckreg[1] & RST;
      rst_rdckreg[3] <= rst_rdckreg[2] & RST;
      rst_rdckreg[4] <= rst_rdckreg[3] & RST;
        end
        else if (RDEN === 1'b1 && RST === 1'b1) begin
      rst_rdckreg <= 5'b0;
        end
    end // always @ (posedge RDCLK)
                always @(posedge WRCLK) begin
        if (RST === 1'b1 && WREN === 1'b1)
      viol_rst_wren = 1;
        if (WREN === 1'b0 && RST === 1'b1) begin
      rst_wrckreg[0] <= RST;
      rst_wrckreg[1] <= rst_wrckreg[0] & RST;
      rst_wrckreg[2] <= rst_wrckreg[1] & RST;
      rst_wrckreg[3] <= rst_wrckreg[2] & RST;
      rst_wrckreg[4] <= rst_wrckreg[3] & RST;
        end
        else if (WREN === 1'b1 && RST === 1'b1) begin
      rst_wrckreg <= 5'b0;
        end
    end // always @ (posedge WRCLK)
                always @(RST) begin
        rst_tmp1 = RST;
        rst_rdclk_flag = 0;
        rst_wrclk_flag = 0;
        if (rst_tmp1 == 0 && rst_tmp2 == 1) begin
      if (((rst_rdckreg[4] & rst_rdckreg[3] & rst_rdckreg[2] & rst_rdckreg[1] & rst_rdckreg[0]) == 0) || viol_rst_rden == 1) begin
          $display("DRC Error : Reset is unsuccessful at time %t.  RST must be held high for at least five RDCLK clock cycles, and RDEN must be low before RST becomes active high, and RDEN remains low during this reset cycle.", $stime);
          rst_rdclk_flag = 1;
         #1 $finish;
      end
      if (((rst_wrckreg[4] & rst_wrckreg[3] & rst_wrckreg[2] & rst_wrckreg[1] & rst_wrckreg[0]) == 0) || viol_rst_wren == 1) begin
          $display("DRC Error : Reset is unsuccessful at time %t.  RST must be held high for at least five WRCLK clock cycles, and WREN must be low before RST becomes active high, and WREN remains low during this reset cycle.", $stime);
          rst_wrclk_flag = 1;
         #1 $finish;
      end
      if ((rst_rdclk_flag | rst_wrclk_flag) == 1) begin
          FULL = 1'bX;
          EMPTY = 1'bX;
          RDERR = 1'bX;
          WRERR = 1'bX;
          assign eccparity_out = 8'bx;
          assign rdcount_out = 13'bx;
          RDCOUNT = 13'bx;
          WRCOUNT = 13'bx;
          assign wr_addr = 13'bx;
          assign wr1_addr = 0;
          assign almostempty_int = 4'b1111;
          ALMOSTEMPTY = 1'bx;
          assign almostfull_int = 4'b0000;
          ALMOSTFULL = 1'bx;
          assign empty_ram = 4'b1111;
          assign full_int = 4'b0000;
          assign rd_addr = 0;
          assign rd_prefetch = 0;
          assign rdcount_flag = 0;
          assign rd_flag = 0;
          assign rdprefetch_flag = 0;
          assign wr_flag = 0;
          assign wr1_flag = 0;
          assign awr_flag = 0;
          assign rdcount_out_sync_3 = 13'bx;
          assign rdcount_out_m1 = 13'bx;
          assign wr_addr_sync_3 = 13'bx;
      end
      else if (RST == 1'b0) begin
//          deassign FULL;
//          deassign EMPTY;
//          deassign RDERR;
//          deassign WRERR;
          deassign eccparity_out;
          deassign rdcount_out;
          rdcount_out = 13'b0;
          deassign wr_addr;
          wr_addr = 13'b0;
//          deassign RDCOUNT;
//          deassign WRCOUNT;
          deassign wr1_addr;
          deassign almostempty_int;
//          deassign ALMOSTEMPTY;
          deassign almostfull_int;
//          deassign ALMOSTFULL;
          deassign empty_ram;
          deassign full_int;
          deassign rd_addr;
          deassign rd_prefetch;
          deassign rdcount_flag;
          deassign rd_flag;
          deassign rdprefetch_flag;
          deassign wr_flag;
          deassign wr1_flag;
          deassign awr_flag;
          deassign rdcount_out_sync_3;
          deassign rdcount_out_m1;
          deassign wr_addr_sync_3;
      end // if (RST == 1'b0)
      viol_rst_rden = 0;
      viol_rst_wren = 0;
      rst_rdckreg = 5'b0;
      rst_wrckreg = 5'b0;
      if (rst_rdclk_flag == 0 && rst_wrclk_flag == 0 && first_rst_flag == 0)
          first_rst_flag = 1;
        end // if (rst_tmp1 == 0 && rst_tmp2 == 1)
        rst_tmp2 = rst_tmp1;
    end // always @ (RST)
            end // case: "7SERIES"
  endcase // case(SIM_DEVICE)
    endgenerate
    // DRC
    always @(posedge RDEN or negedge GSR)
  @(posedge RDCLK)
  if (first_rst_flag == 0 && RDEN == 1'b1 && GSR == 1'b0) begin
      $display("DRC Error : A RESET cycle must be observed before the first use of the FIFO instance %m which occurs at time %t.", $time);
     #1 $finish;
  end
        always @(posedge WREN or negedge GSR)
    @(posedge WRCLK)
  if (first_rst_flag == 0 && WREN == 1'b1 && GSR == 1'b0) begin
      $display("DRC Error : A RESET cycle must be observed before the first use of the FIFO instance %m which occurs at time %t.", $time);
     #1 $finish;
  end
    always @(posedge RDCLK) begin
      if (((period_rdclk == 0) && (count_freq_rdclk < 152)) ||
          ((count_freq_rdclk == 0) && (GSR == 1 || RST == 1)) ||
          ((count_freq_rdclk > 0) && (count_freq_rdclk < 152))) begin
       count_freq_rdclk = count_freq_rdclk + 1;
      end else if (count_freq_wrclk == 152) begin
       count_freq_rdclk = 0;
        count_freq_wrclk_reset = 1;
      end
  if (count_freq_rdclk == 150)
    rise_rdclk = $time;
  else if (count_freq_rdclk == 151)
    period_rdclk = $time - rise_rdclk;
  if (count_freq_rdclk >= 151 && count_freq_wrclk >= 151 && RST === 1'b0 && GSR === 1'b0) begin
    // Setup ranges for almostempty
    if (period_rdclk == period_wrclk) begin
        if (EN_SYN == "FALSE") begin
      if (SIM_DEVICE == "7SERIES") begin
          if (fwft == 1'b0) begin
        if ((ALMOST_EMPTY_OFFSET < 5) || (ALMOST_EMPTY_OFFSET > addr_limit - 6)) begin
            $display("Attribute Syntax Error : The attribute ALMOST_EMPTY_OFFSET on FIFO18E1 instance %m is set to %d.  Legal values for this attribute are %d to %d", ALMOST_EMPTY_OFFSET, 5, addr_limit - 6);
            finish_error = 1;
        end
        if ((ALMOST_FULL_OFFSET < 4) || (ALMOST_FULL_OFFSET > addr_limit - 7)) begin
            $display("Attribute Syntax Error : The attribute ALMOST_FULL_OFFSET on FIFO18E1 instance %m is set to %d.  Legal values for this attribute are %d to %d", ALMOST_FULL_OFFSET, 4, addr_limit - 7);
            finish_error = 1;
        end
          end // if (fwft == 1'b0)
          else begin
        if ((ALMOST_EMPTY_OFFSET < 6) || (ALMOST_EMPTY_OFFSET > addr_limit - 5)) begin
            $display("Attribute Syntax Error : The attribute ALMOST_EMPTY_OFFSET on FIFO18E1 instance %m is set to %d.  Legal values for this attribute are %d to %d", ALMOST_EMPTY_OFFSET, 6, addr_limit - 5);
            finish_error = 1;
        end
        if ((ALMOST_FULL_OFFSET < 4) || (ALMOST_FULL_OFFSET > addr_limit - 7)) begin
            $display("Attribute Syntax Error : The attribute ALMOST_FULL_OFFSET on FIFO18E1 instance %m is set to %d.  Legal values for this attribute are %d to %d", ALMOST_FULL_OFFSET, 4, addr_limit - 7);
            finish_error = 1;
        end
          end // else: !if(fwft == 1'b0)
      end // if (SIM_DEVICE == "7SERIES")
      else begin
          if (fwft == 1'b0) begin
        if ((ALMOST_EMPTY_OFFSET < 5) || (ALMOST_EMPTY_OFFSET > addr_limit - 5)) begin
            $display("Attribute Syntax Error : The attribute ALMOST_EMPTY_OFFSET on FIFO18E1 instance %m is set to %d.  Legal values for this attribute are %d to %d", ALMOST_EMPTY_OFFSET, 5, addr_limit - 5);
            finish_error = 1;
          end
          if ((ALMOST_FULL_OFFSET < 4) || (ALMOST_FULL_OFFSET > addr_limit - 5)) begin
        $display("Attribute Syntax Error : The attribute ALMOST_FULL_OFFSET on FIFO18E1 instance %m is set to %d.  Legal values for this attribute are %d to %d", ALMOST_FULL_OFFSET, 4, addr_limit - 5);
        finish_error = 1;
          end
          end // if (fwft == 1'b0)
          else begin
        if ((ALMOST_EMPTY_OFFSET < 6) || (ALMOST_EMPTY_OFFSET > addr_limit - 4)) begin
            $display("Attribute Syntax Error : The attribute ALMOST_EMPTY_OFFSET on FIFO18E1 instance %m is set to %d.  Legal values for this attribute are %d to %d", ALMOST_EMPTY_OFFSET, 6, addr_limit - 4);
            finish_error = 1;
        end
        if ((ALMOST_FULL_OFFSET < 4) || (ALMOST_FULL_OFFSET > addr_limit - 5)) begin
            $display("Attribute Syntax Error : The attribute ALMOST_FULL_OFFSET on FIFO18E1 instance %m is set to %d.  Legal values for this attribute are %d to %d", ALMOST_FULL_OFFSET, 4, addr_limit - 5);
            finish_error = 1;
        end
          end // else: !if(fwft == 1'b0)
      end // else: !if(SIM_DEVICE == "7SERIES")
        end // if (EN_SYN == "FALSE")
        else begin
      if ((fwft == 1'b0) && ((ALMOST_EMPTY_OFFSET < 1) || (ALMOST_EMPTY_OFFSET > addr_limit - 2))) begin
          $display("Attribute Syntax Error : The attribute ALMOST_EMPTY_OFFSET on FIFO18E1 instance %m is set to %d.  Legal values for this attribute are %d to %d", ALMOST_EMPTY_OFFSET, 1, addr_limit - 2);
          finish_error = 1;
      end
      if ((fwft == 1'b0) && ((ALMOST_FULL_OFFSET < 1) || (ALMOST_FULL_OFFSET > addr_limit - 2))) begin
          $display("Attribute Syntax Error : The attribute ALMOST_FULL_OFFSET on FIFO18E1 instance %m is set to %d.  Legal values for this attribute are %d to %d", ALMOST_FULL_OFFSET, 1, addr_limit - 2);
          finish_error = 1;
      end
        end // else: !if(EN_SYN == "FALSE")
    end // if (period_rdclk == period_wrclk)
    else begin
        real_period_rdclk = period_rdclk * 1.0;
        real_period_wrclk = period_wrclk * 1.0;
        roundup_int_period_rdclk_wrclk = (real_period_rdclk / real_period_wrclk) + 0.499;
        roundup_int_period_wrclk_rdclk = (real_period_wrclk / real_period_rdclk) + 0.499;
        s7_roundup_int_period_rdclk_wrclk = (4.0 * (real_period_rdclk / real_period_wrclk)) + 0.499;
        if (SIM_DEVICE == "7SERIES") begin
//             $display ("addr_limit (%h) period_rdclk (%d) period_wrclk (%d) real_period_rdclk (%f) real_period_wrclk (%f) roundup_int_period_rdclk_wrclk (%d) roundup_int_period_wrclk_rdclk (%d) s7_roundup_int_period_rdclk_wrclk (%d) instance %m\n",addr_limit,period_rdclk,period_wrclk,real_period_rdclk,real_period_wrclk,roundup_int_period_rdclk_wrclk,roundup_int_period_wrclk_rdclk,s7_roundup_int_period_rdclk_wrclk);
      if (ALMOST_FULL_OFFSET > (addr_limit - (s7_roundup_int_period_rdclk_wrclk + 6))) begin
          $display("DRC Error : The attribute ALMOST_FULL_OFFSET on FIFO18E1 instance %m is set to %d. It must be set to a value smaller than (FIFO_DEPTH - ((roundup(4 * (WRCLK frequency / RDCLK frequency))) + 6)) when FIFO18E1 has different frequencies for RDCLK and WRCLK.", ALMOST_FULL_OFFSET);
          finish_error = 1;
      end
        end
        else begin
      if (ALMOST_FULL_OFFSET > (addr_limit - ((3 * roundup_int_period_wrclk_rdclk) + 3))) begin
          $display("DRC Error : The attribute ALMOST_FULL_OFFSET on FIFO18E1 instance %m is set to %d. It must be set to a value smaller than (FIFO_DEPTH - ((3 * roundup (RDCLK frequency / WRCLK frequency)) + 3)) when FIFO18E1 has different frequencies for RDCLK and WRCLK.", ALMOST_FULL_OFFSET);
          finish_error = 1;
      end
      if (ALMOST_EMPTY_OFFSET > (addr_limit - ((3 * roundup_int_period_rdclk_wrclk) + 3))) begin
          $display("DRC Error : The attribute ALMOST_EMPTY_OFFSET on FIFO18E1 instance %m is set to %d. It must be set to a value smaller than (FIFO_DEPTH - ((3 * roundup (WRCLK frequency / RDCLK frequency)) + 3)) when FIFO18E1 has different frequencies for RDCLK and WRCLK.", ALMOST_EMPTY_OFFSET);
          finish_error = 1;
      end
        end // else: !if(SIM_DEVICE == "7SERIES")
    end // else: !if(period_rdclk == period_wrclk)
    count_freq_rdclk = 0;
          count_freq_wrclk_reset = 1;
            if (finish_error == 1)
      #100 $finish;
      end // if (count_freq_wrclk >= 151 && count_freq_rdclk >= 151 && RST === 1'b0 && GSR === 1'b0)
    end // always @ (posedge RDCLK)
    always @(posedge WRCLK or posedge count_freq_wrclk_reset) begin
       if (count_freq_wrclk_reset == 1) begin
        count_freq_wrclk = 0;
        count_freq_wrclk_reset = 0;
       end else if (((period_wrclk == 0) && (count_freq_wrclk < 152)) ||
                    ((count_freq_wrclk == 0) && (GSR == 1 || RST == 1)) ||
                    ((count_freq_wrclk > 0) && (count_freq_wrclk < 152)))
        count_freq_wrclk = count_freq_wrclk + 1;
  if (count_freq_wrclk == 150)
      rise_wrclk = $time;
  else if (count_freq_wrclk == 151) begin
      period_wrclk = $time - rise_wrclk;
  end
    end // always @ (posedge WRCLK)
  generate
    case (SIM_DEVICE)
   "VIRTEX6" : begin
    // read clock
    always @(posedge RDCLK) begin
      // SRVAL in output register mode
      if (DO_REG == 1 && sync == 1'b1 && RSTREG === 1'b1) begin
    do_outreg = SRVAL[0 +: mem_width+1];
    if (mem_width+1 >= 8)
        dop_outreg = SRVAL[mem_width+1 +: memp_width+1];
      end
  // sync mode
  if (sync == 1'b1) begin
      // output register
      if (DO_REG == 1 && REGCE === 1'b1 && RSTREG === 1'b0) begin
    do_outreg = do_out;
    dop_outreg = dop_out;
    dbiterr_out_out = dbiterr_out; // reg out in sync mode
    sbiterr_out_out = sbiterr_out;
      end
      if (RDEN == 1'b1) begin
    if (EMPTY == 1'b0) begin
        do_buf = mem[rdcount_out];
        dop_buf = memp[rdcount_out];
        // ECC decode
        if (EN_ECC_READ == "TRUE") begin
      // regenerate parity
      dopr_ecc[0] = do_buf[0]^do_buf[1]^do_buf[3]^do_buf[4]^do_buf[6]^do_buf[8]
            ^do_buf[10]^do_buf[11]^do_buf[13]^do_buf[15]^do_buf[17]^do_buf[19]
            ^do_buf[21]^do_buf[23]^do_buf[25]^do_buf[26]^do_buf[28]
                      ^do_buf[30]^do_buf[32]^do_buf[34]^do_buf[36]^do_buf[38]
                               ^do_buf[40]^do_buf[42]^do_buf[44]^do_buf[46]^do_buf[48]
                              ^do_buf[50]^do_buf[52]^do_buf[54]^do_buf[56]^do_buf[57]^do_buf[59]
                              ^do_buf[61]^do_buf[63];
      dopr_ecc[1] = do_buf[0]^do_buf[2]^do_buf[3]^do_buf[5]^do_buf[6]^do_buf[9]
                                          ^do_buf[10]^do_buf[12]^do_buf[13]^do_buf[16]^do_buf[17]
                                          ^do_buf[20]^do_buf[21]^do_buf[24]^do_buf[25]^do_buf[27]^do_buf[28]
                                          ^do_buf[31]^do_buf[32]^do_buf[35]^do_buf[36]^do_buf[39]
                                          ^do_buf[40]^do_buf[43]^do_buf[44]^do_buf[47]^do_buf[48]
                                          ^do_buf[51]^do_buf[52]^do_buf[55]^do_buf[56]^do_buf[58]^do_buf[59]
                                          ^do_buf[62]^do_buf[63];
      dopr_ecc[2] = do_buf[1]^do_buf[2]^do_buf[3]^do_buf[7]^do_buf[8]^do_buf[9]
                                          ^do_buf[10]^do_buf[14]^do_buf[15]^do_buf[16]^do_buf[17]
                                          ^do_buf[22]^do_buf[23]^do_buf[24]^do_buf[25]^do_buf[29]
                                          ^do_buf[30]^do_buf[31]^do_buf[32]^do_buf[37]^do_buf[38]^do_buf[39]
                                          ^do_buf[40]^do_buf[45]^do_buf[46]^do_buf[47]^do_buf[48]
                                          ^do_buf[53]^do_buf[54]^do_buf[55]^do_buf[56]
                                          ^do_buf[60]^do_buf[61]^do_buf[62]^do_buf[63];
      dopr_ecc[3] = do_buf[4]^do_buf[5]^do_buf[6]^do_buf[7]^do_buf[8]^do_buf[9]
                              ^do_buf[10]^do_buf[18]^do_buf[19]
                                          ^do_buf[20]^do_buf[21]^do_buf[22]^do_buf[23]^do_buf[24]^do_buf[25]
                                          ^do_buf[33]^do_buf[34]^do_buf[35]^do_buf[36]^do_buf[37]^do_buf[38]
                                          ^do_buf[39]^do_buf[40]^do_buf[49]^do_buf[50]
                                          ^do_buf[51]^do_buf[52]^do_buf[53]^do_buf[54]^do_buf[55]^do_buf[56];
      dopr_ecc[4] = do_buf[11]^do_buf[12]^do_buf[13]^do_buf[14]^do_buf[15]^do_buf[16]
                                          ^do_buf[17]^do_buf[18]^do_buf[19]^do_buf[20]^do_buf[21]^do_buf[22]
                  ^do_buf[23]^do_buf[24]^do_buf[25]^do_buf[41]^do_buf[42]^do_buf[43]
                  ^do_buf[44]^do_buf[45]^do_buf[46]^do_buf[47]^do_buf[48]^do_buf[49]
                  ^do_buf[50]^do_buf[51]^do_buf[52]^do_buf[53]^do_buf[54]^do_buf[55]^do_buf[56];
      dopr_ecc[5] = do_buf[26]^do_buf[27]^do_buf[28]^do_buf[29]
                  ^do_buf[30]^do_buf[31]^do_buf[32]^do_buf[33]^do_buf[34]^do_buf[35]
                  ^do_buf[36]^do_buf[37]^do_buf[38]^do_buf[39]^do_buf[40]
                  ^do_buf[41]^do_buf[42]^do_buf[43]^do_buf[44]^do_buf[45]
                  ^do_buf[46]^do_buf[47]^do_buf[48]^do_buf[49]^do_buf[50]
                  ^do_buf[51]^do_buf[52]^do_buf[53]^do_buf[54]^do_buf[55]^do_buf[56];
      dopr_ecc[6] = do_buf[57]^do_buf[58]^do_buf[59]
                  ^do_buf[60]^do_buf[61]^do_buf[62]^do_buf[63];
      dopr_ecc[7] = dop_buf[0]^dop_buf[1]^dop_buf[2]^dop_buf[3]^dop_buf[4]^dop_buf[5]
                  ^dop_buf[6]^do_buf[0]^do_buf[1]^do_buf[2]^do_buf[3]^do_buf[4]
                  ^do_buf[5]^do_buf[6]^do_buf[7]^do_buf[8]^do_buf[9]^do_buf[10]
                  ^do_buf[11]^do_buf[12]^do_buf[13]^do_buf[14]^do_buf[15]^do_buf[16]
                  ^do_buf[17]^do_buf[18]^do_buf[19]^do_buf[20]^do_buf[21]^do_buf[22]
                  ^do_buf[23]^do_buf[24]^do_buf[25]^do_buf[26]^do_buf[27]^do_buf[28]
                  ^do_buf[29]^do_buf[30]^do_buf[31]^do_buf[32]^do_buf[33]^do_buf[34]
                  ^do_buf[35]^do_buf[36]^do_buf[37]^do_buf[38]^do_buf[39]^do_buf[40]
                  ^do_buf[41]^do_buf[42]^do_buf[43]^do_buf[44]^do_buf[45]^do_buf[46]
                  ^do_buf[47]^do_buf[48]^do_buf[49]^do_buf[50]^do_buf[51]^do_buf[52]
                  ^do_buf[53]^do_buf[54]^do_buf[55]^do_buf[56]^do_buf[57]^do_buf[58]
                  ^do_buf[59]^do_buf[60]^do_buf[61]^do_buf[62]^do_buf[63];
      syndrome = dopr_ecc ^ dop_buf;
      // checking error
      if (syndrome !== 0) begin
          if (syndrome[7]) begin  // dectect single bit error
        ecc_bit_position = {do_buf[63:57], dop_buf[6], do_buf[56:26], dop_buf[5], do_buf[25:11], dop_buf[4], do_buf[10:4], dop_buf[3], do_buf[3:1], dop_buf[2], do_buf[0], dop_buf[1:0], dop_buf[7]};
        if (syndrome[6:0] > 71) begin
            $display ("DRC Error : Simulation halted due Corrupted DIP. To correct this problem, make sure that reliable data is fed to the DIP. The correct Parity must be generated by a Hamming code encoder or encoder in the Block RAM. The output from the model is unreliable if there are more than 2 bit errors. The model doesn't warn if there is sporadic input of more than 2 bit errors due to the limitation in Hamming code.");
            #1 $finish;
        end
        ecc_bit_position[syndrome[6:0]] = ~ecc_bit_position[syndrome[6:0]]; // correct single bit error in the output
        di_in_ecc_corrected = {ecc_bit_position[71:65], ecc_bit_position[63:33], ecc_bit_position[31:17], ecc_bit_position[15:9], ecc_bit_position[7:5], ecc_bit_position[3]}; // correct single bit error in the memory
        do_buf = di_in_ecc_corrected;
        dip_in_ecc_corrected = {ecc_bit_position[0], ecc_bit_position[64], ecc_bit_position[32], ecc_bit_position[16], ecc_bit_position[8], ecc_bit_position[4], ecc_bit_position[2:1]}; // correct single bit error in the parity memory
        dop_buf = dip_in_ecc_corrected;
        dbiterr_out = 0;  // latch out in sync mode
        sbiterr_out = 1;
          end
          else if (!syndrome[7]) begin  // double bit error
        sbiterr_out = 0;
        dbiterr_out = 1;
          end
      end // if (syndrome !== 0)
      else begin
          dbiterr_out = 0;
          sbiterr_out = 0;
      end // else: !if(syndrome !== 0)
        end // if (EN_ECC_READ == "TRUE")
        // end ecc decode
        if (DO_REG == 0) begin
      dbiterr_out_out = dbiterr_out;
      sbiterr_out_out = sbiterr_out;
        end
        do_out = do_buf;
        dop_out = dop_buf;
        rdcount_out = (rdcount_out + 1) % addr_limit;
        if (rdcount_out == 0)
      rdcount_flag = ~rdcount_flag;
    end // if (EMPTY == 1'b0)
      end // if (RDEN == 1'b1)
      RDERR = (RDEN == 1'b1) && (EMPTY == 1'b1);
      if (WREN == 1'b1) begin
    EMPTY = 1'b0;
      end
      else if (rdcount_out == wr_addr && rdcount_flag == wr_flag)
    EMPTY = 1'b1;
      if ((((rdcount_out + ae_empty) >= wr_addr) && (rdcount_flag == wr_flag)) || (((rdcount_out + ae_empty) >= (wr_addr + addr_limit) && (rdcount_flag != wr_flag)))) begin
    ALMOSTEMPTY = 1'b1;
      end
      if ((((rdcount_out + addr_limit) > (wr_addr + ae_full)) && (rdcount_flag == wr_flag)) || ((rdcount_out > (wr_addr + ae_full)) && (rdcount_flag != wr_flag))) begin
    if (wr_addr <= wr_addr + ae_full || rdcount_flag == wr_flag)
        ALMOSTFULL = 1'b0;
      end
  end // if (sync == 1'b1)
  // async mode
  else if (sync == 1'b0) begin
      rden_reg = RDEN;
      if (fwft == 1'b0) begin
    if ((rden_reg == 1'b1) && (rd_addr != rdcount_out)) begin
        do_out = do_in;
        if (DATA_WIDTH != 4)
      dop_out = dop_in;
        rd_addr = (rd_addr + 1) % addr_limit;
        if (rd_addr == 0)
      rd_flag = ~rd_flag;
        dbiterr_out_out = dbiterr_out; // reg out in async mode
        sbiterr_out_out = sbiterr_out;
    end
    if (((rd_addr == rdcount_out) && (empty_ram[3] == 1'b0)) ||
        ((rden_reg == 1'b1) && (empty_ram[1] == 1'b0))) begin
        do_buf = mem[rdcount_out];
        dop_buf = memp[rdcount_out];
        // ECC decode
        if (EN_ECC_READ == "TRUE") begin
      // regenerate parity
      dopr_ecc[0] = do_buf[0]^do_buf[1]^do_buf[3]^do_buf[4]^do_buf[6]^do_buf[8]
            ^do_buf[10]^do_buf[11]^do_buf[13]^do_buf[15]^do_buf[17]^do_buf[19]
            ^do_buf[21]^do_buf[23]^do_buf[25]^do_buf[26]^do_buf[28]
                      ^do_buf[30]^do_buf[32]^do_buf[34]^do_buf[36]^do_buf[38]
                              ^do_buf[40]^do_buf[42]^do_buf[44]^do_buf[46]^do_buf[48]
                              ^do_buf[50]^do_buf[52]^do_buf[54]^do_buf[56]^do_buf[57]^do_buf[59]
                              ^do_buf[61]^do_buf[63];
      dopr_ecc[1] = do_buf[0]^do_buf[2]^do_buf[3]^do_buf[5]^do_buf[6]^do_buf[9]
                                          ^do_buf[10]^do_buf[12]^do_buf[13]^do_buf[16]^do_buf[17]
                                          ^do_buf[20]^do_buf[21]^do_buf[24]^do_buf[25]^do_buf[27]^do_buf[28]
                                          ^do_buf[31]^do_buf[32]^do_buf[35]^do_buf[36]^do_buf[39]
                                          ^do_buf[40]^do_buf[43]^do_buf[44]^do_buf[47]^do_buf[48]
                                          ^do_buf[51]^do_buf[52]^do_buf[55]^do_buf[56]^do_buf[58]^do_buf[59]
                                          ^do_buf[62]^do_buf[63];
      dopr_ecc[2] = do_buf[1]^do_buf[2]^do_buf[3]^do_buf[7]^do_buf[8]^do_buf[9]
                                          ^do_buf[10]^do_buf[14]^do_buf[15]^do_buf[16]^do_buf[17]
                                          ^do_buf[22]^do_buf[23]^do_buf[24]^do_buf[25]^do_buf[29]
                                          ^do_buf[30]^do_buf[31]^do_buf[32]^do_buf[37]^do_buf[38]^do_buf[39]
                                          ^do_buf[40]^do_buf[45]^do_buf[46]^do_buf[47]^do_buf[48]
                                          ^do_buf[53]^do_buf[54]^do_buf[55]^do_buf[56]
                                          ^do_buf[60]^do_buf[61]^do_buf[62]^do_buf[63];
      dopr_ecc[3] = do_buf[4]^do_buf[5]^do_buf[6]^do_buf[7]^do_buf[8]^do_buf[9]
                              ^do_buf[10]^do_buf[18]^do_buf[19]
                                          ^do_buf[20]^do_buf[21]^do_buf[22]^do_buf[23]^do_buf[24]^do_buf[25]
                                          ^do_buf[33]^do_buf[34]^do_buf[35]^do_buf[36]^do_buf[37]^do_buf[38]
                                          ^do_buf[39]^do_buf[40]^do_buf[49]^do_buf[50]
                                          ^do_buf[51]^do_buf[52]^do_buf[53]^do_buf[54]^do_buf[55]^do_buf[56];
      dopr_ecc[4] = do_buf[11]^do_buf[12]^do_buf[13]^do_buf[14]^do_buf[15]^do_buf[16]
                                          ^do_buf[17]^do_buf[18]^do_buf[19]^do_buf[20]^do_buf[21]^do_buf[22]
                  ^do_buf[23]^do_buf[24]^do_buf[25]^do_buf[41]^do_buf[42]^do_buf[43]
                  ^do_buf[44]^do_buf[45]^do_buf[46]^do_buf[47]^do_buf[48]^do_buf[49]
                  ^do_buf[50]^do_buf[51]^do_buf[52]^do_buf[53]^do_buf[54]^do_buf[55]^do_buf[56];
      dopr_ecc[5] = do_buf[26]^do_buf[27]^do_buf[28]^do_buf[29]
                  ^do_buf[30]^do_buf[31]^do_buf[32]^do_buf[33]^do_buf[34]^do_buf[35]
                  ^do_buf[36]^do_buf[37]^do_buf[38]^do_buf[39]^do_buf[40]
                  ^do_buf[41]^do_buf[42]^do_buf[43]^do_buf[44]^do_buf[45]
                  ^do_buf[46]^do_buf[47]^do_buf[48]^do_buf[49]^do_buf[50]
                  ^do_buf[51]^do_buf[52]^do_buf[53]^do_buf[54]^do_buf[55]^do_buf[56];
      dopr_ecc[6] = do_buf[57]^do_buf[58]^do_buf[59]
                  ^do_buf[60]^do_buf[61]^do_buf[62]^do_buf[63];
      dopr_ecc[7] = dop_buf[0]^dop_buf[1]^dop_buf[2]^dop_buf[3]^dop_buf[4]^dop_buf[5]
                  ^dop_buf[6]^do_buf[0]^do_buf[1]^do_buf[2]^do_buf[3]^do_buf[4]
                  ^do_buf[5]^do_buf[6]^do_buf[7]^do_buf[8]^do_buf[9]^do_buf[10]
                  ^do_buf[11]^do_buf[12]^do_buf[13]^do_buf[14]^do_buf[15]^do_buf[16]
                  ^do_buf[17]^do_buf[18]^do_buf[19]^do_buf[20]^do_buf[21]^do_buf[22]
                  ^do_buf[23]^do_buf[24]^do_buf[25]^do_buf[26]^do_buf[27]^do_buf[28]
                  ^do_buf[29]^do_buf[30]^do_buf[31]^do_buf[32]^do_buf[33]^do_buf[34]
                  ^do_buf[35]^do_buf[36]^do_buf[37]^do_buf[38]^do_buf[39]^do_buf[40]
                  ^do_buf[41]^do_buf[42]^do_buf[43]^do_buf[44]^do_buf[45]^do_buf[46]
                  ^do_buf[47]^do_buf[48]^do_buf[49]^do_buf[50]^do_buf[51]^do_buf[52]
                  ^do_buf[53]^do_buf[54]^do_buf[55]^do_buf[56]^do_buf[57]^do_buf[58]
                  ^do_buf[59]^do_buf[60]^do_buf[61]^do_buf[62]^do_buf[63];
      syndrome = dopr_ecc ^ dop_buf;
      if (syndrome !== 0) begin
          if (syndrome[7]) begin  // dectect single bit error
        ecc_bit_position = {do_buf[63:57], dop_buf[6], do_buf[56:26], dop_buf[5], do_buf[25:11], dop_buf[4], do_buf[10:4], dop_buf[3], do_buf[3:1], dop_buf[2], do_buf[0], dop_buf[1:0], dop_buf[7]};
        if (syndrome[6:0] > 71) begin
            $display ("DRC Error : Simulation halted due Corrupted DIP. To correct this problem, make sure that reliable data is fed to the DIP. The correct Parity must be generated by a Hamming code encoder or encoder in the Block RAM. The output from the model is unreliable if there are more than 2 bit errors. The model doesn't warn if there is sporadic input of more than 2 bit errors due to the limitation in Hamming code.");
            #1 $finish;
        end
        ecc_bit_position[syndrome[6:0]] = ~ecc_bit_position[syndrome[6:0]]; // correct single bit error in the output
        di_in_ecc_corrected = {ecc_bit_position[71:65], ecc_bit_position[63:33], ecc_bit_position[31:17], ecc_bit_position[15:9], ecc_bit_position[7:5], ecc_bit_position[3]}; // correct single bit error in the memory
        do_buf = di_in_ecc_corrected;
        dip_in_ecc_corrected = {ecc_bit_position[0], ecc_bit_position[64], ecc_bit_position[32], ecc_bit_position[16], ecc_bit_position[8], ecc_bit_position[4], ecc_bit_position[2:1]}; // correct single bit error in the parity memory
        dop_buf = dip_in_ecc_corrected;
        dbiterr_out = 0;
        sbiterr_out = 1;
          end
          else if (!syndrome[7]) begin  // double bit error
        sbiterr_out = 0;
        dbiterr_out = 1;
          end
      end // if (syndrome !== 0)
      else begin
          dbiterr_out = 0;
          sbiterr_out = 0;
      end // else: !if(syndrome !== 0)
        end // if (EN_ECC_READ == "TRUE")
        // end ecc decode
        do_in = do_buf;
        dop_in = dop_buf;
        #1;
        rdcount_out = (rdcount_out + 1) % addr_limit;
        if (rdcount_out == 0) begin
      rdcount_flag = ~rdcount_flag;
        end
    end
      end
      // First word fall through = true
      if (fwft == 1'b1) begin
    if ((rden_reg == 1'b1) && (rd_addr != rd_prefetch)) begin
        rd_prefetch = (rd_prefetch + 1) % addr_limit;
        if (rd_prefetch == 0)
      rdprefetch_flag = ~rdprefetch_flag;
    end
    if ((rd_prefetch == rd_addr) && (rd_addr != rdcount_out)) begin
        do_out = do_in;
        if (DATA_WIDTH != 4)
      dop_out = dop_in;
        rd_addr = (rd_addr + 1) % addr_limit;
        if (rd_addr == 0)
      rd_flag = ~rd_flag;
        dbiterr_out_out = dbiterr_out; // reg out in async mode
        sbiterr_out_out = sbiterr_out;
    end
    if (((rd_addr == rdcount_out) && (empty_ram[3] == 1'b0)) ||
        ((rden_reg == 1'b1) && (empty_ram[1] == 1'b0)) ||
        ((rden_reg == 1'b0) && (empty_ram[1] == 1'b0) && (rd_addr == rdcount_out))) begin
        do_buf = mem[rdcount_out];
        dop_buf = memp[rdcount_out];
        // ECC decode
        if (EN_ECC_READ == "TRUE") begin
      // regenerate parity
      dopr_ecc[0] = do_buf[0]^do_buf[1]^do_buf[3]^do_buf[4]^do_buf[6]^do_buf[8]
            ^do_buf[10]^do_buf[11]^do_buf[13]^do_buf[15]^do_buf[17]^do_buf[19]
            ^do_buf[21]^do_buf[23]^do_buf[25]^do_buf[26]^do_buf[28]
                      ^do_buf[30]^do_buf[32]^do_buf[34]^do_buf[36]^do_buf[38]
                              ^do_buf[40]^do_buf[42]^do_buf[44]^do_buf[46]^do_buf[48]
                              ^do_buf[50]^do_buf[52]^do_buf[54]^do_buf[56]^do_buf[57]^do_buf[59]
                              ^do_buf[61]^do_buf[63];
      dopr_ecc[1] = do_buf[0]^do_buf[2]^do_buf[3]^do_buf[5]^do_buf[6]^do_buf[9]
                                          ^do_buf[10]^do_buf[12]^do_buf[13]^do_buf[16]^do_buf[17]
                                          ^do_buf[20]^do_buf[21]^do_buf[24]^do_buf[25]^do_buf[27]^do_buf[28]
                                          ^do_buf[31]^do_buf[32]^do_buf[35]^do_buf[36]^do_buf[39]
                                          ^do_buf[40]^do_buf[43]^do_buf[44]^do_buf[47]^do_buf[48]
                                          ^do_buf[51]^do_buf[52]^do_buf[55]^do_buf[56]^do_buf[58]^do_buf[59]
                                          ^do_buf[62]^do_buf[63];
      dopr_ecc[2] = do_buf[1]^do_buf[2]^do_buf[3]^do_buf[7]^do_buf[8]^do_buf[9]
                                          ^do_buf[10]^do_buf[14]^do_buf[15]^do_buf[16]^do_buf[17]
                                          ^do_buf[22]^do_buf[23]^do_buf[24]^do_buf[25]^do_buf[29]
                                          ^do_buf[30]^do_buf[31]^do_buf[32]^do_buf[37]^do_buf[38]^do_buf[39]
                                          ^do_buf[40]^do_buf[45]^do_buf[46]^do_buf[47]^do_buf[48]
                                          ^do_buf[53]^do_buf[54]^do_buf[55]^do_buf[56]
                                          ^do_buf[60]^do_buf[61]^do_buf[62]^do_buf[63];
      dopr_ecc[3] = do_buf[4]^do_buf[5]^do_buf[6]^do_buf[7]^do_buf[8]^do_buf[9]
                              ^do_buf[10]^do_buf[18]^do_buf[19]
                                          ^do_buf[20]^do_buf[21]^do_buf[22]^do_buf[23]^do_buf[24]^do_buf[25]
                                          ^do_buf[33]^do_buf[34]^do_buf[35]^do_buf[36]^do_buf[37]^do_buf[38]
                                          ^do_buf[39]^do_buf[40]^do_buf[49]^do_buf[50]
                                          ^do_buf[51]^do_buf[52]^do_buf[53]^do_buf[54]^do_buf[55]^do_buf[56];
      dopr_ecc[4] = do_buf[11]^do_buf[12]^do_buf[13]^do_buf[14]^do_buf[15]^do_buf[16]
                                          ^do_buf[17]^do_buf[18]^do_buf[19]^do_buf[20]^do_buf[21]^do_buf[22]
                  ^do_buf[23]^do_buf[24]^do_buf[25]^do_buf[41]^do_buf[42]^do_buf[43]
                  ^do_buf[44]^do_buf[45]^do_buf[46]^do_buf[47]^do_buf[48]^do_buf[49]
                  ^do_buf[50]^do_buf[51]^do_buf[52]^do_buf[53]^do_buf[54]^do_buf[55]^do_buf[56];
      dopr_ecc[5] = do_buf[26]^do_buf[27]^do_buf[28]^do_buf[29]
                  ^do_buf[30]^do_buf[31]^do_buf[32]^do_buf[33]^do_buf[34]^do_buf[35]
                  ^do_buf[36]^do_buf[37]^do_buf[38]^do_buf[39]^do_buf[40]
                  ^do_buf[41]^do_buf[42]^do_buf[43]^do_buf[44]^do_buf[45]
                  ^do_buf[46]^do_buf[47]^do_buf[48]^do_buf[49]^do_buf[50]
                  ^do_buf[51]^do_buf[52]^do_buf[53]^do_buf[54]^do_buf[55]^do_buf[56];
      dopr_ecc[6] = do_buf[57]^do_buf[58]^do_buf[59]
                  ^do_buf[60]^do_buf[61]^do_buf[62]^do_buf[63];
      dopr_ecc[7] = dop_buf[0]^dop_buf[1]^dop_buf[2]^dop_buf[3]^dop_buf[4]^dop_buf[5]
                  ^dop_buf[6]^do_buf[0]^do_buf[1]^do_buf[2]^do_buf[3]^do_buf[4]
                  ^do_buf[5]^do_buf[6]^do_buf[7]^do_buf[8]^do_buf[9]^do_buf[10]
                  ^do_buf[11]^do_buf[12]^do_buf[13]^do_buf[14]^do_buf[15]^do_buf[16]
                  ^do_buf[17]^do_buf[18]^do_buf[19]^do_buf[20]^do_buf[21]^do_buf[22]
                  ^do_buf[23]^do_buf[24]^do_buf[25]^do_buf[26]^do_buf[27]^do_buf[28]
                  ^do_buf[29]^do_buf[30]^do_buf[31]^do_buf[32]^do_buf[33]^do_buf[34]
                  ^do_buf[35]^do_buf[36]^do_buf[37]^do_buf[38]^do_buf[39]^do_buf[40]
                  ^do_buf[41]^do_buf[42]^do_buf[43]^do_buf[44]^do_buf[45]^do_buf[46]
                  ^do_buf[47]^do_buf[48]^do_buf[49]^do_buf[50]^do_buf[51]^do_buf[52]
                  ^do_buf[53]^do_buf[54]^do_buf[55]^do_buf[56]^do_buf[57]^do_buf[58]
                  ^do_buf[59]^do_buf[60]^do_buf[61]^do_buf[62]^do_buf[63];
      syndrome = dopr_ecc ^ dop_buf;
      if (syndrome !== 0) begin
          if (syndrome[7]) begin  // dectect single bit error
        ecc_bit_position = {do_buf[63:57], dop_buf[6], do_buf[56:26], dop_buf[5], do_buf[25:11], dop_buf[4], do_buf[10:4], dop_buf[3], do_buf[3:1], dop_buf[2], do_buf[0], dop_buf[1:0], dop_buf[7]};
        if (syndrome[6:0] > 71) begin
            $display ("DRC Error : Simulation halted due Corrupted DIP. To correct this problem, make sure that reliable data is fed to the DIP. The correct Parity must be generated by a Hamming code encoder or encoder in the Block RAM. The output from the model is unreliable if there are more than 2 bit errors. The model doesn't warn if there is sporadic input of more than 2 bit errors due to the limitation in Hamming code.");
            #1 $finish;
        end
        ecc_bit_position[syndrome[6:0]] = ~ecc_bit_position[syndrome[6:0]]; // correct single bit error in the output
        di_in_ecc_corrected = {ecc_bit_position[71:65], ecc_bit_position[63:33], ecc_bit_position[31:17], ecc_bit_position[15:9], ecc_bit_position[7:5], ecc_bit_position[3]}; // correct single bit error in the memory
        do_buf = di_in_ecc_corrected;
        dip_in_ecc_corrected = {ecc_bit_position[0], ecc_bit_position[64], ecc_bit_position[32], ecc_bit_position[16], ecc_bit_position[8], ecc_bit_position[4], ecc_bit_position[2:1]}; // correct single bit error in the parity memory
        dop_buf = dip_in_ecc_corrected;
        dbiterr_out = 0;
        sbiterr_out = 1;
          end
          else if (!syndrome[7]) begin  // double bit error
        sbiterr_out = 0;
        dbiterr_out = 1;
          end
      end // if (syndrome !== 0)
      else begin
          dbiterr_out = 0;
          sbiterr_out = 0;
      end // else: !if(syndrome !== 0)
        end // if (EN_ECC_READ == "TRUE")
        // end ecc decode
        do_in = do_buf;
        dop_in = dop_buf;
        #1;
        rdcount_out = (rdcount_out + 1) % addr_limit;
        if (rdcount_out == 0)
      rdcount_flag = ~rdcount_flag;
    end
      end // if (fwft == 1'b1)
      RDERR = (rden_reg == 1'b1) && (EMPTY == 1'b1);
      ALMOSTEMPTY = almostempty_int[3];
      if ((((rdcount_out + ae_empty) >= wr_addr) && (rdcount_flag == awr_flag)) || (((rdcount_out + ae_empty) >= (wr_addr + addr_limit)) && (rdcount_flag != awr_flag))) begin
    almostempty_int[3] = 1'b1;
    almostempty_int[2] = 1'b1;
    almostempty_int[1] = 1'b1;
    almostempty_int[0] = 1'b1;
      end
      else if (almostempty_int[2] == 1'b0) begin
    if (rdcount_out <= rdcount_out + ae_empty || rdcount_flag != awr_flag) begin
        almostempty_int[3] = almostempty_int[0];
        almostempty_int[0] = 1'b0;
        end
      end
      if ((((rdcount_out + addr_limit) > (wr_addr + ae_full)) && (rdcount_flag == awr_flag)) || ((rdcount_out > (wr_addr + ae_full)) && (rdcount_flag != awr_flag))) begin
    if (((rden_reg == 1'b1) && (EMPTY == 1'b0)) || ((((rd_addr + 1) % addr_limit) == rdcount_out) && (almostfull_int[1] == 1'b1))) begin
        almostfull_int[2] = almostfull_int[1];
        almostfull_int[1] = 1'b0;
    end
      end
      else begin
    almostfull_int[2] = 1'b1;
    almostfull_int[1] = 1'b1;
      end
      if (fwft == 1'b0) begin
    if ((rdcount_out == rd_addr) && (rdcount_flag == rd_flag)) begin
        EMPTY = 1'b1;
    end
    else begin
        EMPTY = 1'b0;
    end
      end // if (fwft == 1'b0)
      else if (fwft == 1'b1) begin
    if ((rd_prefetch == rd_addr) && (rdprefetch_flag == rd_flag)) begin
        EMPTY = 1'b1;
    end
    else begin
        EMPTY = 1'b0;
    end
      end
      if ((rdcount_out == wr_addr) && (rdcount_flag == awr_flag)) begin
    empty_ram[2] = 1'b1;
    empty_ram[1] = 1'b1;
    empty_ram[0] = 1'b1;
      end
      else begin
    empty_ram[2] = empty_ram[1];
    empty_ram[1] = empty_ram[0];
    empty_ram[0] = 1'b0;
      end
      if ((rdcount_out == wr1_addr) && (rdcount_flag == wr1_flag)) begin
    empty_ram[3] = 1'b1;
      end
      else begin
    empty_ram[3] = 1'b0;
      end
      wr1_addr = wr_addr;
      wr1_flag = awr_flag;
  end // if (sync == 1'b0)
    end // always @ (posedge RDCLK)
    // Write clock
    always @(posedge WRCLK) begin
  // DRC
  if ((INJECTSBITERR === 1) && !(en_ecc_write_int == 1 || en_ecc_read_int == 1))
      $display("DRC Warning : INJECTSBITERR is not supported when neither EN_ECC_WRITE nor EN_ECCREAD = TRUE on FIFO18E1 instance %m.");
  if ((INJECTDBITERR === 1) && !(en_ecc_write_int == 1 || en_ecc_read_int == 1))
      $display("DRC Warning : INJECTDBITERR is not supported when neither EN_ECC_WRITE nor EN_ECCREAD = TRUE on FIFO18E1 instance %m.");
  // sync mode
  if (sync == 1'b1) begin
      if (WREN == 1'b1) begin
    if (FULL == 1'b0) begin
        // ECC encode
        if (EN_ECC_WRITE == "TRUE") begin
      dip_ecc[0] = DI[0]^DI[1]^DI[3]^DI[4]^DI[6]^DI[8]
                   ^DI[10]^DI[11]^DI[13]^DI[15]^DI[17]^DI[19]
                   ^DI[21]^DI[23]^DI[25]^DI[26]^DI[28]
                    ^DI[30]^DI[32]^DI[34]^DI[36]^DI[38]
                   ^DI[40]^DI[42]^DI[44]^DI[46]^DI[48]
                   ^DI[50]^DI[52]^DI[54]^DI[56]^DI[57]^DI[59]
                   ^DI[61]^DI[63];
      dip_ecc[1] = DI[0]^DI[2]^DI[3]^DI[5]^DI[6]^DI[9]
                     ^DI[10]^DI[12]^DI[13]^DI[16]^DI[17]
                     ^DI[20]^DI[21]^DI[24]^DI[25]^DI[27]^DI[28]
                     ^DI[31]^DI[32]^DI[35]^DI[36]^DI[39]
                     ^DI[40]^DI[43]^DI[44]^DI[47]^DI[48]
                     ^DI[51]^DI[52]^DI[55]^DI[56]^DI[58]^DI[59]
                     ^DI[62]^DI[63];
      dip_ecc[2] = DI[1]^DI[2]^DI[3]^DI[7]^DI[8]^DI[9]
                     ^DI[10]^DI[14]^DI[15]^DI[16]^DI[17]
                     ^DI[22]^DI[23]^DI[24]^DI[25]^DI[29]
                     ^DI[30]^DI[31]^DI[32]^DI[37]^DI[38]^DI[39]
                     ^DI[40]^DI[45]^DI[46]^DI[47]^DI[48]
                     ^DI[53]^DI[54]^DI[55]^DI[56]
                     ^DI[60]^DI[61]^DI[62]^DI[63];
      dip_ecc[3] = DI[4]^DI[5]^DI[6]^DI[7]^DI[8]^DI[9]
                  ^DI[10]^DI[18]^DI[19]
                     ^DI[20]^DI[21]^DI[22]^DI[23]^DI[24]^DI[25]
                     ^DI[33]^DI[34]^DI[35]^DI[36]^DI[37]^DI[38]^DI[39]
                     ^DI[40]^DI[49]
                     ^DI[50]^DI[51]^DI[52]^DI[53]^DI[54]^DI[55]^DI[56];
      dip_ecc[4] = DI[11]^DI[12]^DI[13]^DI[14]^DI[15]^DI[16]^DI[17]^DI[18]^DI[19]
                     ^DI[20]^DI[21]^DI[22]^DI[23]^DI[24]^DI[25]
                     ^DI[41]^DI[42]^DI[43]^DI[44]^DI[45]^DI[46]^DI[47]^DI[48]^DI[49]
                     ^DI[50]^DI[51]^DI[52]^DI[53]^DI[54]^DI[55]^DI[56];
      dip_ecc[5] = DI[26]^DI[27]^DI[28]^DI[29]
                     ^DI[30]^DI[31]^DI[32]^DI[33]^DI[34]^DI[35]^DI[36]^DI[37]^DI[38]^DI[39]
                     ^DI[40]^DI[41]^DI[42]^DI[43]^DI[44]^DI[45]^DI[46]^DI[47]^DI[48]^DI[49]
                     ^DI[50]^DI[51]^DI[52]^DI[53]^DI[54]^DI[55]^DI[56];
      dip_ecc[6] = DI[57]^DI[58]^DI[59]
                  ^DI[60]^DI[61]^DI[62]^DI[63];
      dip_ecc[7] = dip_ecc[0]^dip_ecc[1]^dip_ecc[2]^dip_ecc[3]^dip_ecc[4]^dip_ecc[5]^dip_ecc[6]
                     ^DI[0]^DI[1]^DI[2]^DI[3]^DI[4]^DI[5]^DI[6]^DI[7]^DI[8]^DI[9]
                     ^DI[10]^DI[11]^DI[12]^DI[13]^DI[14]^DI[15]^DI[16]^DI[17]^DI[18]^DI[19]
                     ^DI[20]^DI[21]^DI[22]^DI[23]^DI[24]^DI[25]^DI[26]^DI[27]^DI[28]^DI[29]
                     ^DI[30]^DI[31]^DI[32]^DI[33]^DI[34]^DI[35]^DI[36]^DI[37]^DI[38]^DI[39]
                     ^DI[40]^DI[41]^DI[42]^DI[43]^DI[44]^DI[45]^DI[46]^DI[47]^DI[48]^DI[49]
                     ^DI[50]^DI[51]^DI[52]^DI[53]^DI[54]^DI[55]^DI[56]^DI[57]^DI[58]^DI[59]
                     ^DI[60]^DI[61]^DI[62]^DI[63];
      eccparity_out = dip_ecc;
      dip_int = dip_ecc;  // only 64 bits width
        end // if (EN_ECC_WRITE == "TRUE")
        else begin
      dip_int = DIP; // only 64 bits width
        end // else: !if(EN_ECC_WRITE == "TRUE")
        // end ecc encode
        if (RST === 1'b0) begin
      // injecting error
         di_ecc_col = DI;
      if (en_ecc_write_int == 1 || en_ecc_read_int == 1) begin
          if (INJECTDBITERR === 1) begin
        di_ecc_col[30] = ~di_ecc_col[30];
        di_ecc_col[62] = ~di_ecc_col[62];
          end
          else if (INJECTSBITERR === 1) begin
        di_ecc_col[30] = ~di_ecc_col[30];
          end
      end // if (en_ecc_write_int == 1 || en_ecc_read_int == 1)
      mem[wr_addr] = di_ecc_col;
      memp[wr_addr] = dip_int;
      wr_addr = (wr_addr + 1) % addr_limit;
      if (wr_addr == 0)
          wr_flag = ~wr_flag;
        end
    end // if (FULL == 1'b0)
      end // if (WREN == 1'b1)
      if (RST === 1'b0) begin
    WRERR = (WREN == 1'b1) && (FULL == 1'b1);
    if (RDEN == 1'b1) begin
        FULL = 1'b0;
    end
    else if (rdcount_out == wr_addr && rdcount_flag != wr_flag)
        FULL = 1'b1;
    if ((((rdcount_out + ae_empty) < wr_addr) && (rdcount_flag == wr_flag)) || (((rdcount_out + ae_empty) < (wr_addr + addr_limit) && (rdcount_flag != wr_flag)))) begin
        if (rdcount_out <= rdcount_out + ae_empty || rdcount_flag != wr_flag)
      ALMOSTEMPTY = 1'b0;
    end
    if ((((rdcount_out + addr_limit) <= (wr_addr + ae_full)) && (rdcount_flag == wr_flag)) || ((rdcount_out <= (wr_addr + ae_full)) && (rdcount_flag != wr_flag))) begin
        ALMOSTFULL = 1'b1;
    end
      end // if (RST === 1'b0)
  end // if (sync == 1'b1)
  // async mode
  else if (sync == 1'b0) begin
      wren_reg = WREN;
      if (wren_reg == 1'b1 && FULL == 1'b0) begin
    // ECC encode
    if (EN_ECC_WRITE == "TRUE") begin
        dip_ecc[0] = DI[0]^DI[1]^DI[3]^DI[4]^DI[6]^DI[8]
                     ^DI[10]^DI[11]^DI[13]^DI[15]^DI[17]^DI[19]
                     ^DI[21]^DI[23]^DI[25]^DI[26]^DI[28]
                               ^DI[30]^DI[32]^DI[34]^DI[36]^DI[38]
                     ^DI[40]^DI[42]^DI[44]^DI[46]^DI[48]
                     ^DI[50]^DI[52]^DI[54]^DI[56]^DI[57]^DI[59]
                     ^DI[61]^DI[63];
        dip_ecc[1] = DI[0]^DI[2]^DI[3]^DI[5]^DI[6]^DI[9]
                                 ^DI[10]^DI[12]^DI[13]^DI[16]^DI[17]
                                 ^DI[20]^DI[21]^DI[24]^DI[25]^DI[27]^DI[28]
                                 ^DI[31]^DI[32]^DI[35]^DI[36]^DI[39]
                                 ^DI[40]^DI[43]^DI[44]^DI[47]^DI[48]
                                 ^DI[51]^DI[52]^DI[55]^DI[56]^DI[58]^DI[59]
                                 ^DI[62]^DI[63];
        dip_ecc[2] = DI[1]^DI[2]^DI[3]^DI[7]^DI[8]^DI[9]
                                 ^DI[10]^DI[14]^DI[15]^DI[16]^DI[17]
                                 ^DI[22]^DI[23]^DI[24]^DI[25]^DI[29]
                                 ^DI[30]^DI[31]^DI[32]^DI[37]^DI[38]^DI[39]
                                 ^DI[40]^DI[45]^DI[46]^DI[47]^DI[48]
                                 ^DI[53]^DI[54]^DI[55]^DI[56]
                                 ^DI[60]^DI[61]^DI[62]^DI[63];
        dip_ecc[3] = DI[4]^DI[5]^DI[6]^DI[7]^DI[8]^DI[9]
               ^DI[10]^DI[18]^DI[19]
                                 ^DI[20]^DI[21]^DI[22]^DI[23]^DI[24]^DI[25]
                                 ^DI[33]^DI[34]^DI[35]^DI[36]^DI[37]^DI[38]^DI[39]
                                 ^DI[40]^DI[49]
                                 ^DI[50]^DI[51]^DI[52]^DI[53]^DI[54]^DI[55]^DI[56];
        dip_ecc[4] = DI[11]^DI[12]^DI[13]^DI[14]^DI[15]^DI[16]^DI[17]^DI[18]^DI[19]
                                 ^DI[20]^DI[21]^DI[22]^DI[23]^DI[24]^DI[25]
                                 ^DI[41]^DI[42]^DI[43]^DI[44]^DI[45]^DI[46]^DI[47]^DI[48]^DI[49]
                                 ^DI[50]^DI[51]^DI[52]^DI[53]^DI[54]^DI[55]^DI[56];
        dip_ecc[5] = DI[26]^DI[27]^DI[28]^DI[29]
                                 ^DI[30]^DI[31]^DI[32]^DI[33]^DI[34]^DI[35]^DI[36]^DI[37]^DI[38]^DI[39]
                                 ^DI[40]^DI[41]^DI[42]^DI[43]^DI[44]^DI[45]^DI[46]^DI[47]^DI[48]^DI[49]
                                 ^DI[50]^DI[51]^DI[52]^DI[53]^DI[54]^DI[55]^DI[56];
        dip_ecc[6] = DI[57]^DI[58]^DI[59]
               ^DI[60]^DI[61]^DI[62]^DI[63];
        dip_ecc[7] = dip_ecc[0]^dip_ecc[1]^dip_ecc[2]^dip_ecc[3]^dip_ecc[4]^dip_ecc[5]^dip_ecc[6]
                                 ^DI[0]^DI[1]^DI[2]^DI[3]^DI[4]^DI[5]^DI[6]^DI[7]^DI[8]^DI[9]
                                 ^DI[10]^DI[11]^DI[12]^DI[13]^DI[14]^DI[15]^DI[16]^DI[17]^DI[18]^DI[19]
                                 ^DI[20]^DI[21]^DI[22]^DI[23]^DI[24]^DI[25]^DI[26]^DI[27]^DI[28]^DI[29]
                                 ^DI[30]^DI[31]^DI[32]^DI[33]^DI[34]^DI[35]^DI[36]^DI[37]^DI[38]^DI[39]
                                 ^DI[40]^DI[41]^DI[42]^DI[43]^DI[44]^DI[45]^DI[46]^DI[47]^DI[48]^DI[49]
                                 ^DI[50]^DI[51]^DI[52]^DI[53]^DI[54]^DI[55]^DI[56]^DI[57]^DI[58]^DI[59]
                                 ^DI[60]^DI[61]^DI[62]^DI[63];
        eccparity_out = dip_ecc;
        dip_int = dip_ecc;  // only 64 bits width
    end // if (EN_ECC_WRITE == "TRUE")
    else begin
        dip_int = DIP; // only 64 bits width
    end // else: !if(EN_ECC_WRITE == "TRUE")
    // end ecc encode
       if (RST === 1'b0) begin
    // injecting error
       di_ecc_col = DI;
    if (en_ecc_write_int == 1 || en_ecc_read_int == 1) begin
        if (INJECTDBITERR === 1) begin
      di_ecc_col[30] = ~di_ecc_col[30];
      di_ecc_col[62] = ~di_ecc_col[62];
        end
        else if (INJECTSBITERR === 1) begin
      di_ecc_col[30] = ~di_ecc_col[30];
        end
    end // if (en_ecc_write_int == 1 || en_ecc_read_int == 1)
    mem[wr_addr] = di_ecc_col;
    memp[wr_addr] = dip_int;
    #1;
    wr_addr = (wr_addr + 1) % addr_limit;
    if (wr_addr == 0)
        awr_flag = ~awr_flag;
    if (wr_addr == addr_limit - 1)
        wr_flag = ~wr_flag;
       end // if (RST === 1'b0)
      end // if (wren_reg == 1'b1 && FULL == 1'b0)
    if (RST === 1'b0) begin
      WRERR = (wren_reg == 1'b1) && (FULL == 1'b1);
      ALMOSTFULL = almostfull_int[3];
      if ((((rdcount_out + addr_limit) <= (wr_addr + ae_full)) && (rdcount_flag == awr_flag)) || ((rdcount_out <= (wr_addr + ae_full)) && (rdcount_flag != awr_flag))) begin
    almostfull_int[3] = 1'b1;
    almostfull_int[2] = 1'b1;
    almostfull_int[1] = 1'b1;
    almostfull_int[0] = 1'b1;
      end
      else if (almostfull_int[2] == 1'b0) begin
    if (wr_addr <= wr_addr + ae_full || rdcount_flag == awr_flag) begin
        almostfull_int[3] = almostfull_int[0];
        almostfull_int[0] = 1'b0;
        end
      end
      if ((((rdcount_out + ae_empty) < wr_addr) && (rdcount_flag == awr_flag)) || (((rdcount_out + ae_empty) < (wr_addr + addr_limit)) && (rdcount_flag != awr_flag))) begin
    if (wren_reg == 1'b1) begin
        almostempty_int[2] = almostempty_int[1];
        almostempty_int[1] = 1'b0;
    end
      end
      else begin
    almostempty_int[2] = 1'b1;
    almostempty_int[1] = 1'b1;
      end
      if (wren_reg == 1'b1 || FULL == 1'b1)
    FULL = full_int[1];
      if (((rdcount_out == wr_addr) || (rdcount_out - 1 == wr_addr || (rdcount_out + addr_limit - 1 == wr_addr))) && ALMOSTFULL) begin
    full_int[1] = 1'b1;
    full_int[0] = 1'b1;
      end
      else begin
    full_int[1] = full_int[0];
    full_int[0] = 0;
      end
    end // if (RST === 1'b0)
  end // if (sync == 1'b0)
    end // always @ (posedge WRCLK)
end // case: "VIRTEX6"
"7SERIES" : begin
   always @(posedge RDCLK) begin
     if ((sync == 1'b0) && (sync_clk_async_mode_done == 1'b0)) begin
      prev_time_rdclk = time_rdclk;
      time_rdclk = $time;
     end
   end
   always @(posedge WRCLK) begin
     if ((sync == 1'b0) && (sync_clk_async_mode_done == 1'b0)) begin
      prev_time_wrclk = time_wrclk;
      time_wrclk = $time;
     end
   end
   always @(time_rdclk or time_wrclk) begin
     if (((time_rdclk - time_wrclk == 0 && prev_time_rdclk - prev_time_wrclk == 0) || (time_wrclk - time_rdclk == 0 && prev_time_wrclk - prev_time_rdclk == 0)) && $time != 0)
       sync_clk_async_mode = 1'b1;
     if ((((period_wrclk > 0) && (period_rdclk > 0)) || (sync_clk_async_mode == 1'b1)) && (RST == 1'b0) && (GSR == 1'b0))
       sync_clk_async_mode_done = 1'b1;
   end
   // read clock
   always @(posedge RDCLK) begin
      // SRVAL in output register mode
      if (DO_REG == 1 && sync == 1'b1 && RSTREG === 1'b1) begin
    do_outreg = SRVAL[0 +: mem_width+1];
    if (mem_width+1 >= 8)
        dop_outreg = SRVAL[mem_width+1 +: memp_width+1];
      end
      // sync mode
      if (sync == 1'b1) begin
      // output register
      if (DO_REG == 1 && REGCE === 1'b1 && RSTREG === 1'b0) begin
    do_outreg = do_out;
    dop_outreg = dop_out;
    dbiterr_out_out = dbiterr_out; // reg out in sync mode
    sbiterr_out_out = sbiterr_out;
      end
      if (RDEN == 1'b1) begin
    if (EMPTY == 1'b0) begin
        do_buf = mem[rdcount_out];
        dop_buf = memp[rdcount_out];
        // ECC decode
        if (EN_ECC_READ == "TRUE") begin
      // regenerate parity
      dopr_ecc[0] = do_buf[0]^do_buf[1]^do_buf[3]^do_buf[4]^do_buf[6]^do_buf[8]
            ^do_buf[10]^do_buf[11]^do_buf[13]^do_buf[15]^do_buf[17]^do_buf[19]
            ^do_buf[21]^do_buf[23]^do_buf[25]^do_buf[26]^do_buf[28]
                      ^do_buf[30]^do_buf[32]^do_buf[34]^do_buf[36]^do_buf[38]
                               ^do_buf[40]^do_buf[42]^do_buf[44]^do_buf[46]^do_buf[48]
                              ^do_buf[50]^do_buf[52]^do_buf[54]^do_buf[56]^do_buf[57]^do_buf[59]
                              ^do_buf[61]^do_buf[63];
      dopr_ecc[1] = do_buf[0]^do_buf[2]^do_buf[3]^do_buf[5]^do_buf[6]^do_buf[9]
                                          ^do_buf[10]^do_buf[12]^do_buf[13]^do_buf[16]^do_buf[17]
                                          ^do_buf[20]^do_buf[21]^do_buf[24]^do_buf[25]^do_buf[27]^do_buf[28]
                                          ^do_buf[31]^do_buf[32]^do_buf[35]^do_buf[36]^do_buf[39]
                                          ^do_buf[40]^do_buf[43]^do_buf[44]^do_buf[47]^do_buf[48]
                                          ^do_buf[51]^do_buf[52]^do_buf[55]^do_buf[56]^do_buf[58]^do_buf[59]
                                          ^do_buf[62]^do_buf[63];
      dopr_ecc[2] = do_buf[1]^do_buf[2]^do_buf[3]^do_buf[7]^do_buf[8]^do_buf[9]
                                          ^do_buf[10]^do_buf[14]^do_buf[15]^do_buf[16]^do_buf[17]
                                          ^do_buf[22]^do_buf[23]^do_buf[24]^do_buf[25]^do_buf[29]
                                          ^do_buf[30]^do_buf[31]^do_buf[32]^do_buf[37]^do_buf[38]^do_buf[39]
                                          ^do_buf[40]^do_buf[45]^do_buf[46]^do_buf[47]^do_buf[48]
                                          ^do_buf[53]^do_buf[54]^do_buf[55]^do_buf[56]
                                          ^do_buf[60]^do_buf[61]^do_buf[62]^do_buf[63];
      dopr_ecc[3] = do_buf[4]^do_buf[5]^do_buf[6]^do_buf[7]^do_buf[8]^do_buf[9]
                              ^do_buf[10]^do_buf[18]^do_buf[19]
                                          ^do_buf[20]^do_buf[21]^do_buf[22]^do_buf[23]^do_buf[24]^do_buf[25]
                                          ^do_buf[33]^do_buf[34]^do_buf[35]^do_buf[36]^do_buf[37]^do_buf[38]
                                          ^do_buf[39]^do_buf[40]^do_buf[49]^do_buf[50]
                                          ^do_buf[51]^do_buf[52]^do_buf[53]^do_buf[54]^do_buf[55]^do_buf[56];
      dopr_ecc[4] = do_buf[11]^do_buf[12]^do_buf[13]^do_buf[14]^do_buf[15]^do_buf[16]
                                          ^do_buf[17]^do_buf[18]^do_buf[19]^do_buf[20]^do_buf[21]^do_buf[22]
                  ^do_buf[23]^do_buf[24]^do_buf[25]^do_buf[41]^do_buf[42]^do_buf[43]
                  ^do_buf[44]^do_buf[45]^do_buf[46]^do_buf[47]^do_buf[48]^do_buf[49]
                  ^do_buf[50]^do_buf[51]^do_buf[52]^do_buf[53]^do_buf[54]^do_buf[55]^do_buf[56];
      dopr_ecc[5] = do_buf[26]^do_buf[27]^do_buf[28]^do_buf[29]
                  ^do_buf[30]^do_buf[31]^do_buf[32]^do_buf[33]^do_buf[34]^do_buf[35]
                  ^do_buf[36]^do_buf[37]^do_buf[38]^do_buf[39]^do_buf[40]
                  ^do_buf[41]^do_buf[42]^do_buf[43]^do_buf[44]^do_buf[45]
                  ^do_buf[46]^do_buf[47]^do_buf[48]^do_buf[49]^do_buf[50]
                  ^do_buf[51]^do_buf[52]^do_buf[53]^do_buf[54]^do_buf[55]^do_buf[56];
      dopr_ecc[6] = do_buf[57]^do_buf[58]^do_buf[59]
                  ^do_buf[60]^do_buf[61]^do_buf[62]^do_buf[63];
      dopr_ecc[7] = dop_buf[0]^dop_buf[1]^dop_buf[2]^dop_buf[3]^dop_buf[4]^dop_buf[5]
                  ^dop_buf[6]^do_buf[0]^do_buf[1]^do_buf[2]^do_buf[3]^do_buf[4]
                  ^do_buf[5]^do_buf[6]^do_buf[7]^do_buf[8]^do_buf[9]^do_buf[10]
                  ^do_buf[11]^do_buf[12]^do_buf[13]^do_buf[14]^do_buf[15]^do_buf[16]
                  ^do_buf[17]^do_buf[18]^do_buf[19]^do_buf[20]^do_buf[21]^do_buf[22]
                  ^do_buf[23]^do_buf[24]^do_buf[25]^do_buf[26]^do_buf[27]^do_buf[28]
                  ^do_buf[29]^do_buf[30]^do_buf[31]^do_buf[32]^do_buf[33]^do_buf[34]
                  ^do_buf[35]^do_buf[36]^do_buf[37]^do_buf[38]^do_buf[39]^do_buf[40]
                  ^do_buf[41]^do_buf[42]^do_buf[43]^do_buf[44]^do_buf[45]^do_buf[46]
                  ^do_buf[47]^do_buf[48]^do_buf[49]^do_buf[50]^do_buf[51]^do_buf[52]
                  ^do_buf[53]^do_buf[54]^do_buf[55]^do_buf[56]^do_buf[57]^do_buf[58]
                  ^do_buf[59]^do_buf[60]^do_buf[61]^do_buf[62]^do_buf[63];
      syndrome = dopr_ecc ^ dop_buf;
      // checking error
      if (syndrome !== 0) begin
          if (syndrome[7]) begin  // dectect single bit error
        ecc_bit_position = {do_buf[63:57], dop_buf[6], do_buf[56:26], dop_buf[5], do_buf[25:11], dop_buf[4], do_buf[10:4], dop_buf[3], do_buf[3:1], dop_buf[2], do_buf[0], dop_buf[1:0], dop_buf[7]};
        if (syndrome[6:0] > 71) begin
            $display ("DRC Error : Simulation halted due Corrupted DIP. To correct this problem, make sure that reliable data is fed to the DIP. The correct Parity must be generated by a Hamming code encoder or encoder in the Block RAM. The output from the model is unreliable if there are more than 2 bit errors. The model doesn't warn if there is sporadic input of more than 2 bit errors due to the limitation in Hamming code.");
            #1 $finish;
        end
        ecc_bit_position[syndrome[6:0]] = ~ecc_bit_position[syndrome[6:0]]; // correct single bit error in the output
        di_in_ecc_corrected = {ecc_bit_position[71:65], ecc_bit_position[63:33], ecc_bit_position[31:17], ecc_bit_position[15:9], ecc_bit_position[7:5], ecc_bit_position[3]}; // correct single bit error in the memory
        do_buf = di_in_ecc_corrected;
        dip_in_ecc_corrected = {ecc_bit_position[0], ecc_bit_position[64], ecc_bit_position[32], ecc_bit_position[16], ecc_bit_position[8], ecc_bit_position[4], ecc_bit_position[2:1]}; // correct single bit error in the parity memory
        dop_buf = dip_in_ecc_corrected;
        dbiterr_out = 0;  // latch out in sync mode
        sbiterr_out = 1;
          end
          else if (!syndrome[7]) begin  // double bit error
        sbiterr_out = 0;
        dbiterr_out = 1;
          end
      end // if (syndrome !== 0)
      else begin
          dbiterr_out = 0;
          sbiterr_out = 0;
      end // else: !if(syndrome !== 0)
        end // if (EN_ECC_READ == "TRUE")
        // end ecc decode
        if (DO_REG == 0) begin
      dbiterr_out_out = dbiterr_out;
      sbiterr_out_out = sbiterr_out;
        end
        do_out = do_buf;
        dop_out = dop_buf;
        rdcount_out = (rdcount_out + 1) % addr_limit;
        if (rdcount_out == 0)
      rdcount_flag = ~rdcount_flag;
    end // if (EMPTY == 1'b0)
      end // if (RDEN == 1'b1)
      RDERR = (RDEN == 1'b1) && (EMPTY == 1'b1);
      if (WREN == 1'b1) begin
    EMPTY = 1'b0;
      end
      else if (rdcount_out == wr_addr && rdcount_flag == wr_flag)
    EMPTY = 1'b1;
      if ((((rdcount_out + ae_empty) > wr_addr) && (rdcount_flag == wr_flag)) || (((rdcount_out + ae_empty) > (wr_addr + addr_limit) && (rdcount_flag != wr_flag)))) begin
    ALMOSTEMPTY = 1'b1;
      end
      if ((((rdcount_out + addr_limit) > (wr_addr + ae_full)) && (rdcount_flag == wr_flag)) || ((rdcount_out > (wr_addr + ae_full)) && (rdcount_flag != wr_flag))) begin
    if (wr_addr <= wr_addr + ae_full || rdcount_flag == wr_flag)
        ALMOSTFULL = 1'b0;
      end
  end // if (sync == 1'b1)
  // async mode
  else if (sync == 1'b0) begin
    wr_addr_sync_3 = wr_addr_sync_2;
    wr_addr_sync_2 = wr_addr_sync_1;
    wr_addr_sync_1 = wr_addr;
    awr_flag_sync_2 = awr_flag_sync_1;
    awr_flag_sync_1 = awr_flag;
    if (sync_clk_async_mode == 1'b1) begin
      rden_reg = RDEN;
      if (fwft == 1'b0) begin
    if ((rden_reg == 1'b1) && (rd_addr != rdcount_out)) begin
        do_out = do_in;
        if (DATA_WIDTH != 4)
      dop_out = dop_in;
        rd_addr = (rd_addr + 1) % addr_limit;
        if (rd_addr == 0)
      rd_flag = ~rd_flag;
        dbiterr_out_out = dbiterr_out; // reg out in async mode
        sbiterr_out_out = sbiterr_out;
    end
    if (((rd_addr == rdcount_out) && (empty_ram[3] == 1'b0)) ||
        ((rden_reg == 1'b1) && (empty_ram[1] == 1'b0))) begin
        do_buf = mem[rdcount_out];
        dop_buf = memp[rdcount_out];
        // ECC decode
        if (EN_ECC_READ == "TRUE") begin
      // regenerate parity
      dopr_ecc[0] = do_buf[0]^do_buf[1]^do_buf[3]^do_buf[4]^do_buf[6]^do_buf[8]
            ^do_buf[10]^do_buf[11]^do_buf[13]^do_buf[15]^do_buf[17]^do_buf[19]
            ^do_buf[21]^do_buf[23]^do_buf[25]^do_buf[26]^do_buf[28]
                      ^do_buf[30]^do_buf[32]^do_buf[34]^do_buf[36]^do_buf[38]
                              ^do_buf[40]^do_buf[42]^do_buf[44]^do_buf[46]^do_buf[48]
                              ^do_buf[50]^do_buf[52]^do_buf[54]^do_buf[56]^do_buf[57]^do_buf[59]
                              ^do_buf[61]^do_buf[63];
      dopr_ecc[1] = do_buf[0]^do_buf[2]^do_buf[3]^do_buf[5]^do_buf[6]^do_buf[9]
                                          ^do_buf[10]^do_buf[12]^do_buf[13]^do_buf[16]^do_buf[17]
                                          ^do_buf[20]^do_buf[21]^do_buf[24]^do_buf[25]^do_buf[27]^do_buf[28]
                                          ^do_buf[31]^do_buf[32]^do_buf[35]^do_buf[36]^do_buf[39]
                                          ^do_buf[40]^do_buf[43]^do_buf[44]^do_buf[47]^do_buf[48]
                                          ^do_buf[51]^do_buf[52]^do_buf[55]^do_buf[56]^do_buf[58]^do_buf[59]
                                          ^do_buf[62]^do_buf[63];
      dopr_ecc[2] = do_buf[1]^do_buf[2]^do_buf[3]^do_buf[7]^do_buf[8]^do_buf[9]
                                          ^do_buf[10]^do_buf[14]^do_buf[15]^do_buf[16]^do_buf[17]
                                          ^do_buf[22]^do_buf[23]^do_buf[24]^do_buf[25]^do_buf[29]
                                          ^do_buf[30]^do_buf[31]^do_buf[32]^do_buf[37]^do_buf[38]^do_buf[39]
                                          ^do_buf[40]^do_buf[45]^do_buf[46]^do_buf[47]^do_buf[48]
                                          ^do_buf[53]^do_buf[54]^do_buf[55]^do_buf[56]
                                          ^do_buf[60]^do_buf[61]^do_buf[62]^do_buf[63];
      dopr_ecc[3] = do_buf[4]^do_buf[5]^do_buf[6]^do_buf[7]^do_buf[8]^do_buf[9]
                              ^do_buf[10]^do_buf[18]^do_buf[19]
                                          ^do_buf[20]^do_buf[21]^do_buf[22]^do_buf[23]^do_buf[24]^do_buf[25]
                                          ^do_buf[33]^do_buf[34]^do_buf[35]^do_buf[36]^do_buf[37]^do_buf[38]
                                          ^do_buf[39]^do_buf[40]^do_buf[49]^do_buf[50]
                                          ^do_buf[51]^do_buf[52]^do_buf[53]^do_buf[54]^do_buf[55]^do_buf[56];
      dopr_ecc[4] = do_buf[11]^do_buf[12]^do_buf[13]^do_buf[14]^do_buf[15]^do_buf[16]
                                          ^do_buf[17]^do_buf[18]^do_buf[19]^do_buf[20]^do_buf[21]^do_buf[22]
                  ^do_buf[23]^do_buf[24]^do_buf[25]^do_buf[41]^do_buf[42]^do_buf[43]
                  ^do_buf[44]^do_buf[45]^do_buf[46]^do_buf[47]^do_buf[48]^do_buf[49]
                  ^do_buf[50]^do_buf[51]^do_buf[52]^do_buf[53]^do_buf[54]^do_buf[55]^do_buf[56];
      dopr_ecc[5] = do_buf[26]^do_buf[27]^do_buf[28]^do_buf[29]
                  ^do_buf[30]^do_buf[31]^do_buf[32]^do_buf[33]^do_buf[34]^do_buf[35]
                  ^do_buf[36]^do_buf[37]^do_buf[38]^do_buf[39]^do_buf[40]
                  ^do_buf[41]^do_buf[42]^do_buf[43]^do_buf[44]^do_buf[45]
                  ^do_buf[46]^do_buf[47]^do_buf[48]^do_buf[49]^do_buf[50]
                  ^do_buf[51]^do_buf[52]^do_buf[53]^do_buf[54]^do_buf[55]^do_buf[56];
      dopr_ecc[6] = do_buf[57]^do_buf[58]^do_buf[59]
                  ^do_buf[60]^do_buf[61]^do_buf[62]^do_buf[63];
      dopr_ecc[7] = dop_buf[0]^dop_buf[1]^dop_buf[2]^dop_buf[3]^dop_buf[4]^dop_buf[5]
                  ^dop_buf[6]^do_buf[0]^do_buf[1]^do_buf[2]^do_buf[3]^do_buf[4]
                  ^do_buf[5]^do_buf[6]^do_buf[7]^do_buf[8]^do_buf[9]^do_buf[10]
                  ^do_buf[11]^do_buf[12]^do_buf[13]^do_buf[14]^do_buf[15]^do_buf[16]
                  ^do_buf[17]^do_buf[18]^do_buf[19]^do_buf[20]^do_buf[21]^do_buf[22]
                  ^do_buf[23]^do_buf[24]^do_buf[25]^do_buf[26]^do_buf[27]^do_buf[28]
                  ^do_buf[29]^do_buf[30]^do_buf[31]^do_buf[32]^do_buf[33]^do_buf[34]
                  ^do_buf[35]^do_buf[36]^do_buf[37]^do_buf[38]^do_buf[39]^do_buf[40]
                  ^do_buf[41]^do_buf[42]^do_buf[43]^do_buf[44]^do_buf[45]^do_buf[46]
                  ^do_buf[47]^do_buf[48]^do_buf[49]^do_buf[50]^do_buf[51]^do_buf[52]
                  ^do_buf[53]^do_buf[54]^do_buf[55]^do_buf[56]^do_buf[57]^do_buf[58]
                  ^do_buf[59]^do_buf[60]^do_buf[61]^do_buf[62]^do_buf[63];
      syndrome = dopr_ecc ^ dop_buf;
      if (syndrome !== 0) begin
          if (syndrome[7]) begin  // dectect single bit error
        ecc_bit_position = {do_buf[63:57], dop_buf[6], do_buf[56:26], dop_buf[5], do_buf[25:11], dop_buf[4], do_buf[10:4], dop_buf[3], do_buf[3:1], dop_buf[2], do_buf[0], dop_buf[1:0], dop_buf[7]};
        if (syndrome[6:0] > 71) begin
            $display ("DRC Error : Simulation halted due Corrupted DIP. To correct this problem, make sure that reliable data is fed to the DIP. The correct Parity must be generated by a Hamming code encoder or encoder in the Block RAM. The output from the model is unreliable if there are more than 2 bit errors. The model doesn't warn if there is sporadic input of more than 2 bit errors due to the limitation in Hamming code.");
            #1 $finish;
        end
        ecc_bit_position[syndrome[6:0]] = ~ecc_bit_position[syndrome[6:0]]; // correct single bit error in the output
        di_in_ecc_corrected = {ecc_bit_position[71:65], ecc_bit_position[63:33], ecc_bit_position[31:17], ecc_bit_position[15:9], ecc_bit_position[7:5], ecc_bit_position[3]}; // correct single bit error in the memory
        do_buf = di_in_ecc_corrected;
        dip_in_ecc_corrected = {ecc_bit_position[0], ecc_bit_position[64], ecc_bit_position[32], ecc_bit_position[16], ecc_bit_position[8], ecc_bit_position[4], ecc_bit_position[2:1]}; // correct single bit error in the parity memory
        dop_buf = dip_in_ecc_corrected;
        dbiterr_out = 0;
        sbiterr_out = 1;
          end
          else if (!syndrome[7]) begin  // double bit error
        sbiterr_out = 0;
        dbiterr_out = 1;
          end
      end // if (syndrome !== 0)
      else begin
          dbiterr_out = 0;
          sbiterr_out = 0;
      end // else: !if(syndrome !== 0)
        end // if (EN_ECC_READ == "TRUE")
        // end ecc decode
        do_in = do_buf;
        dop_in = dop_buf;
        #1;
        rdcount_out = (rdcount_out + 1) % addr_limit;
        if (rdcount_out == 0) begin
      rdcount_flag = ~rdcount_flag;
        end
    end
      end
      // First word fall through = true
      if (fwft == 1'b1) begin
    if ((rden_reg == 1'b1) && (rd_addr != rd_prefetch)) begin
        rd_prefetch = (rd_prefetch + 1) % addr_limit;
        if (rd_prefetch == 0)
      rdprefetch_flag = ~rdprefetch_flag;
    end
    if ((rd_prefetch == rd_addr) && (rd_addr != rdcount_out)) begin
        do_out = do_in;
        if (DATA_WIDTH != 4)
      dop_out = dop_in;
        rd_addr = (rd_addr + 1) % addr_limit;
        if (rd_addr == 0)
      rd_flag = ~rd_flag;
        dbiterr_out_out = dbiterr_out; // reg out in async mode
        sbiterr_out_out = sbiterr_out;
    end
    if (((rd_addr == rdcount_out) && (empty_ram[3] == 1'b0)) ||
        ((rden_reg == 1'b1) && (empty_ram[1] == 1'b0)) ||
        ((rden_reg == 1'b0) && (empty_ram[1] == 1'b0) && (rd_addr == rdcount_out))) begin
        do_buf = mem[rdcount_out];
        dop_buf = memp[rdcount_out];
        // ECC decode
        if (EN_ECC_READ == "TRUE") begin
      // regenerate parity
      dopr_ecc[0] = do_buf[0]^do_buf[1]^do_buf[3]^do_buf[4]^do_buf[6]^do_buf[8]
            ^do_buf[10]^do_buf[11]^do_buf[13]^do_buf[15]^do_buf[17]^do_buf[19]
            ^do_buf[21]^do_buf[23]^do_buf[25]^do_buf[26]^do_buf[28]
                      ^do_buf[30]^do_buf[32]^do_buf[34]^do_buf[36]^do_buf[38]
                              ^do_buf[40]^do_buf[42]^do_buf[44]^do_buf[46]^do_buf[48]
                              ^do_buf[50]^do_buf[52]^do_buf[54]^do_buf[56]^do_buf[57]^do_buf[59]
                              ^do_buf[61]^do_buf[63];
      dopr_ecc[1] = do_buf[0]^do_buf[2]^do_buf[3]^do_buf[5]^do_buf[6]^do_buf[9]
                                          ^do_buf[10]^do_buf[12]^do_buf[13]^do_buf[16]^do_buf[17]
                                          ^do_buf[20]^do_buf[21]^do_buf[24]^do_buf[25]^do_buf[27]^do_buf[28]
                                          ^do_buf[31]^do_buf[32]^do_buf[35]^do_buf[36]^do_buf[39]
                                          ^do_buf[40]^do_buf[43]^do_buf[44]^do_buf[47]^do_buf[48]
                                          ^do_buf[51]^do_buf[52]^do_buf[55]^do_buf[56]^do_buf[58]^do_buf[59]
                                          ^do_buf[62]^do_buf[63];
      dopr_ecc[2] = do_buf[1]^do_buf[2]^do_buf[3]^do_buf[7]^do_buf[8]^do_buf[9]
                                          ^do_buf[10]^do_buf[14]^do_buf[15]^do_buf[16]^do_buf[17]
                                          ^do_buf[22]^do_buf[23]^do_buf[24]^do_buf[25]^do_buf[29]
                                          ^do_buf[30]^do_buf[31]^do_buf[32]^do_buf[37]^do_buf[38]^do_buf[39]
                                          ^do_buf[40]^do_buf[45]^do_buf[46]^do_buf[47]^do_buf[48]
                                          ^do_buf[53]^do_buf[54]^do_buf[55]^do_buf[56]
                                          ^do_buf[60]^do_buf[61]^do_buf[62]^do_buf[63];
      dopr_ecc[3] = do_buf[4]^do_buf[5]^do_buf[6]^do_buf[7]^do_buf[8]^do_buf[9]
                              ^do_buf[10]^do_buf[18]^do_buf[19]
                                          ^do_buf[20]^do_buf[21]^do_buf[22]^do_buf[23]^do_buf[24]^do_buf[25]
                                          ^do_buf[33]^do_buf[34]^do_buf[35]^do_buf[36]^do_buf[37]^do_buf[38]
                                          ^do_buf[39]^do_buf[40]^do_buf[49]^do_buf[50]
                                          ^do_buf[51]^do_buf[52]^do_buf[53]^do_buf[54]^do_buf[55]^do_buf[56];
      dopr_ecc[4] = do_buf[11]^do_buf[12]^do_buf[13]^do_buf[14]^do_buf[15]^do_buf[16]
                                          ^do_buf[17]^do_buf[18]^do_buf[19]^do_buf[20]^do_buf[21]^do_buf[22]
                  ^do_buf[23]^do_buf[24]^do_buf[25]^do_buf[41]^do_buf[42]^do_buf[43]
                  ^do_buf[44]^do_buf[45]^do_buf[46]^do_buf[47]^do_buf[48]^do_buf[49]
                  ^do_buf[50]^do_buf[51]^do_buf[52]^do_buf[53]^do_buf[54]^do_buf[55]^do_buf[56];
      dopr_ecc[5] = do_buf[26]^do_buf[27]^do_buf[28]^do_buf[29]
                  ^do_buf[30]^do_buf[31]^do_buf[32]^do_buf[33]^do_buf[34]^do_buf[35]
                  ^do_buf[36]^do_buf[37]^do_buf[38]^do_buf[39]^do_buf[40]
                  ^do_buf[41]^do_buf[42]^do_buf[43]^do_buf[44]^do_buf[45]
                  ^do_buf[46]^do_buf[47]^do_buf[48]^do_buf[49]^do_buf[50]
                  ^do_buf[51]^do_buf[52]^do_buf[53]^do_buf[54]^do_buf[55]^do_buf[56];
      dopr_ecc[6] = do_buf[57]^do_buf[58]^do_buf[59]
                  ^do_buf[60]^do_buf[61]^do_buf[62]^do_buf[63];
      dopr_ecc[7] = dop_buf[0]^dop_buf[1]^dop_buf[2]^dop_buf[3]^dop_buf[4]^dop_buf[5]
                  ^dop_buf[6]^do_buf[0]^do_buf[1]^do_buf[2]^do_buf[3]^do_buf[4]
                  ^do_buf[5]^do_buf[6]^do_buf[7]^do_buf[8]^do_buf[9]^do_buf[10]
                  ^do_buf[11]^do_buf[12]^do_buf[13]^do_buf[14]^do_buf[15]^do_buf[16]
                  ^do_buf[17]^do_buf[18]^do_buf[19]^do_buf[20]^do_buf[21]^do_buf[22]
                  ^do_buf[23]^do_buf[24]^do_buf[25]^do_buf[26]^do_buf[27]^do_buf[28]
                  ^do_buf[29]^do_buf[30]^do_buf[31]^do_buf[32]^do_buf[33]^do_buf[34]
                  ^do_buf[35]^do_buf[36]^do_buf[37]^do_buf[38]^do_buf[39]^do_buf[40]
                  ^do_buf[41]^do_buf[42]^do_buf[43]^do_buf[44]^do_buf[45]^do_buf[46]
                  ^do_buf[47]^do_buf[48]^do_buf[49]^do_buf[50]^do_buf[51]^do_buf[52]
                  ^do_buf[53]^do_buf[54]^do_buf[55]^do_buf[56]^do_buf[57]^do_buf[58]
                  ^do_buf[59]^do_buf[60]^do_buf[61]^do_buf[62]^do_buf[63];
      syndrome = dopr_ecc ^ dop_buf;
      if (syndrome !== 0) begin
          if (syndrome[7]) begin  // dectect single bit error
        ecc_bit_position = {do_buf[63:57], dop_buf[6], do_buf[56:26], dop_buf[5], do_buf[25:11], dop_buf[4], do_buf[10:4], dop_buf[3], do_buf[3:1], dop_buf[2], do_buf[0], dop_buf[1:0], dop_buf[7]};
        if (syndrome[6:0] > 71) begin
            $display ("DRC Error : Simulation halted due Corrupted DIP. To correct this problem, make sure that reliable data is fed to the DIP. The correct Parity must be generated by a Hamming code encoder or encoder in the Block RAM. The output from the model is unreliable if there are more than 2 bit errors. The model doesn't warn if there is sporadic input of more than 2 bit errors due to the limitation in Hamming code.");
            #1 $finish;
        end
        ecc_bit_position[syndrome[6:0]] = ~ecc_bit_position[syndrome[6:0]]; // correct single bit error in the output
        di_in_ecc_corrected = {ecc_bit_position[71:65], ecc_bit_position[63:33], ecc_bit_position[31:17], ecc_bit_position[15:9], ecc_bit_position[7:5], ecc_bit_position[3]}; // correct single bit error in the memory
        do_buf = di_in_ecc_corrected;
        dip_in_ecc_corrected = {ecc_bit_position[0], ecc_bit_position[64], ecc_bit_position[32], ecc_bit_position[16], ecc_bit_position[8], ecc_bit_position[4], ecc_bit_position[2:1]}; // correct single bit error in the parity memory
        dop_buf = dip_in_ecc_corrected;
        dbiterr_out = 0;
        sbiterr_out = 1;
          end
          else if (!syndrome[7]) begin  // double bit error
        sbiterr_out = 0;
        dbiterr_out = 1;
          end
      end // if (syndrome !== 0)
      else begin
          dbiterr_out = 0;
          sbiterr_out = 0;
      end // else: !if(syndrome !== 0)
        end // if (EN_ECC_READ == "TRUE")
        // end ecc decode
        do_in = do_buf;
        dop_in = dop_buf;
        #1;
        rdcount_out = (rdcount_out + 1) % addr_limit;
        if (rdcount_out == 0)
      rdcount_flag = ~rdcount_flag;
    end
      end // if (fwft == 1'b1)
      RDERR = (rden_reg == 1'b1) && (EMPTY == 1'b1);
      ALMOSTEMPTY = almostempty_int[3];
      if ((((rdcount_out + ae_empty) > wr_addr) && (rdcount_flag == awr_flag)) || (((rdcount_out + ae_empty) > (wr_addr + addr_limit)) && (rdcount_flag != awr_flag))) begin
    almostempty_int[3] = 1'b1;
    almostempty_int[2] = 1'b1;
    almostempty_int[1] = 1'b1;
    almostempty_int[0] = 1'b1;
      end
      else if (almostempty_int[1] == 1'b0) begin
    if (rdcount_out <= rdcount_out + ae_empty || rdcount_flag != awr_flag) begin
        almostempty_int[3] = almostempty_int[0];
        almostempty_int[0] = 1'b0;
        end
      end
      if ((((rdcount_out + addr_limit) > (wr_addr + ae_full)) && (rdcount_flag == awr_flag)) || ((rdcount_out > (wr_addr + ae_full)) && (rdcount_flag != awr_flag))) begin
    if (((rden_reg == 1'b1) && (EMPTY == 1'b0)) || ((((rd_addr + 1) % addr_limit) == rdcount_out) && (almostfull_int[1] == 1'b1))) begin
        almostfull_int[2] = almostfull_int[1];
        almostfull_int[1] = 1'b0;
    end
      end
      else begin
    almostfull_int[2] = 1'b1;
    almostfull_int[1] = 1'b1;
      end
      if (fwft == 1'b0) begin
    if ((rdcount_out == rd_addr) && (rdcount_flag == rd_flag)) begin
        EMPTY = 1'b1;
    end
    else begin
        EMPTY = 1'b0;
    end
      end // if (fwft == 1'b0)
      else if (fwft == 1'b1) begin
    if ((rd_prefetch == rd_addr) && (rdprefetch_flag == rd_flag)) begin
        EMPTY = 1'b1;
    end
    else begin
        EMPTY = 1'b0;
    end
      end
      if ((rdcount_out == wr_addr) && (rdcount_flag == awr_flag)) begin
    empty_ram[2] = 1'b1;
    empty_ram[1] = 1'b1;
    empty_ram[0] = 1'b1;
      end
      else begin
    empty_ram[2] = empty_ram[1];
    empty_ram[1] = empty_ram[0];
    empty_ram[0] = 1'b0;
      end
      if ((rdcount_out == wr1_addr) && (rdcount_flag == wr1_flag)) begin
    empty_ram[3] = 1'b1;
      end
      else begin
    empty_ram[3] = 1'b0;
      end
      wr1_addr = wr_addr;
      wr1_flag = awr_flag;
    end // if (sync_clk_async_mode == 1'b1)
    else begin
      if (fwft == 1'b0) begin
    if (RDEN == 1'b1 && (rd_addr != rdcount_out)) begin
        do_out = do_in;
        if (DATA_WIDTH != 4)
      dop_out = dop_in;
        rd_addr = (rd_addr + 1) % addr_limit;
        if (rd_addr == 0)
      rd_flag = ~rd_flag;
        dbiterr_out_out = dbiterr_out; // reg out in async mode
        sbiterr_out_out = sbiterr_out;
    end
    if (empty_ram[0] == 1'b0 && (RDEN == 1'b1 || rd_addr == rdcount_out)) begin
        do_buf = mem[rdcount_out];
        dop_buf = memp[rdcount_out];
        // ECC decode
        if (EN_ECC_READ == "TRUE") begin
      // regenerate parity
      dopr_ecc[0] = do_buf[0]^do_buf[1]^do_buf[3]^do_buf[4]^do_buf[6]^do_buf[8]
            ^do_buf[10]^do_buf[11]^do_buf[13]^do_buf[15]^do_buf[17]^do_buf[19]
            ^do_buf[21]^do_buf[23]^do_buf[25]^do_buf[26]^do_buf[28]
                      ^do_buf[30]^do_buf[32]^do_buf[34]^do_buf[36]^do_buf[38]
                              ^do_buf[40]^do_buf[42]^do_buf[44]^do_buf[46]^do_buf[48]
                              ^do_buf[50]^do_buf[52]^do_buf[54]^do_buf[56]^do_buf[57]^do_buf[59]
                              ^do_buf[61]^do_buf[63];
      dopr_ecc[1] = do_buf[0]^do_buf[2]^do_buf[3]^do_buf[5]^do_buf[6]^do_buf[9]
                                          ^do_buf[10]^do_buf[12]^do_buf[13]^do_buf[16]^do_buf[17]
                                          ^do_buf[20]^do_buf[21]^do_buf[24]^do_buf[25]^do_buf[27]^do_buf[28]
                                          ^do_buf[31]^do_buf[32]^do_buf[35]^do_buf[36]^do_buf[39]
                                          ^do_buf[40]^do_buf[43]^do_buf[44]^do_buf[47]^do_buf[48]
                                          ^do_buf[51]^do_buf[52]^do_buf[55]^do_buf[56]^do_buf[58]^do_buf[59]
                                          ^do_buf[62]^do_buf[63];
      dopr_ecc[2] = do_buf[1]^do_buf[2]^do_buf[3]^do_buf[7]^do_buf[8]^do_buf[9]
                                          ^do_buf[10]^do_buf[14]^do_buf[15]^do_buf[16]^do_buf[17]
                                          ^do_buf[22]^do_buf[23]^do_buf[24]^do_buf[25]^do_buf[29]
                                          ^do_buf[30]^do_buf[31]^do_buf[32]^do_buf[37]^do_buf[38]^do_buf[39]
                                          ^do_buf[40]^do_buf[45]^do_buf[46]^do_buf[47]^do_buf[48]
                                          ^do_buf[53]^do_buf[54]^do_buf[55]^do_buf[56]
                                          ^do_buf[60]^do_buf[61]^do_buf[62]^do_buf[63];
      dopr_ecc[3] = do_buf[4]^do_buf[5]^do_buf[6]^do_buf[7]^do_buf[8]^do_buf[9]
                              ^do_buf[10]^do_buf[18]^do_buf[19]
                                          ^do_buf[20]^do_buf[21]^do_buf[22]^do_buf[23]^do_buf[24]^do_buf[25]
                                          ^do_buf[33]^do_buf[34]^do_buf[35]^do_buf[36]^do_buf[37]^do_buf[38]
                                          ^do_buf[39]^do_buf[40]^do_buf[49]^do_buf[50]
                                          ^do_buf[51]^do_buf[52]^do_buf[53]^do_buf[54]^do_buf[55]^do_buf[56];
      dopr_ecc[4] = do_buf[11]^do_buf[12]^do_buf[13]^do_buf[14]^do_buf[15]^do_buf[16]
                                          ^do_buf[17]^do_buf[18]^do_buf[19]^do_buf[20]^do_buf[21]^do_buf[22]
                  ^do_buf[23]^do_buf[24]^do_buf[25]^do_buf[41]^do_buf[42]^do_buf[43]
                  ^do_buf[44]^do_buf[45]^do_buf[46]^do_buf[47]^do_buf[48]^do_buf[49]
                  ^do_buf[50]^do_buf[51]^do_buf[52]^do_buf[53]^do_buf[54]^do_buf[55]^do_buf[56];
      dopr_ecc[5] = do_buf[26]^do_buf[27]^do_buf[28]^do_buf[29]
                  ^do_buf[30]^do_buf[31]^do_buf[32]^do_buf[33]^do_buf[34]^do_buf[35]
                  ^do_buf[36]^do_buf[37]^do_buf[38]^do_buf[39]^do_buf[40]
                  ^do_buf[41]^do_buf[42]^do_buf[43]^do_buf[44]^do_buf[45]
                  ^do_buf[46]^do_buf[47]^do_buf[48]^do_buf[49]^do_buf[50]
                  ^do_buf[51]^do_buf[52]^do_buf[53]^do_buf[54]^do_buf[55]^do_buf[56];
      dopr_ecc[6] = do_buf[57]^do_buf[58]^do_buf[59]
                  ^do_buf[60]^do_buf[61]^do_buf[62]^do_buf[63];
      dopr_ecc[7] = dop_buf[0]^dop_buf[1]^dop_buf[2]^dop_buf[3]^dop_buf[4]^dop_buf[5]
                  ^dop_buf[6]^do_buf[0]^do_buf[1]^do_buf[2]^do_buf[3]^do_buf[4]
                  ^do_buf[5]^do_buf[6]^do_buf[7]^do_buf[8]^do_buf[9]^do_buf[10]
                  ^do_buf[11]^do_buf[12]^do_buf[13]^do_buf[14]^do_buf[15]^do_buf[16]
                  ^do_buf[17]^do_buf[18]^do_buf[19]^do_buf[20]^do_buf[21]^do_buf[22]
                  ^do_buf[23]^do_buf[24]^do_buf[25]^do_buf[26]^do_buf[27]^do_buf[28]
                  ^do_buf[29]^do_buf[30]^do_buf[31]^do_buf[32]^do_buf[33]^do_buf[34]
                  ^do_buf[35]^do_buf[36]^do_buf[37]^do_buf[38]^do_buf[39]^do_buf[40]
                  ^do_buf[41]^do_buf[42]^do_buf[43]^do_buf[44]^do_buf[45]^do_buf[46]
                  ^do_buf[47]^do_buf[48]^do_buf[49]^do_buf[50]^do_buf[51]^do_buf[52]
                  ^do_buf[53]^do_buf[54]^do_buf[55]^do_buf[56]^do_buf[57]^do_buf[58]
                  ^do_buf[59]^do_buf[60]^do_buf[61]^do_buf[62]^do_buf[63];
      syndrome = dopr_ecc ^ dop_buf;
      if (syndrome !== 0) begin
          if (syndrome[7]) begin  // dectect single bit error
        ecc_bit_position = {do_buf[63:57], dop_buf[6], do_buf[56:26], dop_buf[5], do_buf[25:11], dop_buf[4], do_buf[10:4], dop_buf[3], do_buf[3:1], dop_buf[2], do_buf[0], dop_buf[1:0], dop_buf[7]};
        if (syndrome[6:0] > 71) begin
            $display ("DRC Error : Simulation halted due Corrupted DIP. To correct this problem, make sure that reliable data is fed to the DIP. The correct Parity must be generated by a Hamming code encoder or encoder in the Block RAM. The output from the model is unreliable if there are more than 2 bit errors. The model doesn't warn if there is sporadic input of more than 2 bit errors due to the limitation in Hamming code.");
            #1 $finish;
        end
        ecc_bit_position[syndrome[6:0]] = ~ecc_bit_position[syndrome[6:0]]; // correct single bit error in the output
        di_in_ecc_corrected = {ecc_bit_position[71:65], ecc_bit_position[63:33], ecc_bit_position[31:17], ecc_bit_position[15:9], ecc_bit_position[7:5], ecc_bit_position[3]}; // correct single bit error in the memory
        do_buf = di_in_ecc_corrected;
        dip_in_ecc_corrected = {ecc_bit_position[0], ecc_bit_position[64], ecc_bit_position[32], ecc_bit_position[16], ecc_bit_position[8], ecc_bit_position[4], ecc_bit_position[2:1]}; // correct single bit error in the parity memory
        dop_buf = dip_in_ecc_corrected;
        dbiterr_out = 0;
        sbiterr_out = 1;
          end
          else if (!syndrome[7]) begin  // double bit error
        sbiterr_out = 0;
        dbiterr_out = 1;
          end
      end // if (syndrome !== 0)
      else begin
          dbiterr_out = 0;
          sbiterr_out = 0;
      end // else: !if(syndrome !== 0)
        end // if (EN_ECC_READ == "TRUE")
        // end ecc decode
        do_in = do_buf;
        dop_in = dop_buf;
        #0;
        rdcount_out_m1 = rdcount_out;
        rdcount_out = (rdcount_out + 1) % addr_limit;
        if (rdcount_out == 0) begin
      rdcount_flag = ~rdcount_flag;
        end
    end
      end
      // First word fall through = true
      if (fwft == 1'b1) begin
    if ((RDEN == 1'b1) && (rd_addr != rd_prefetch)) begin
        rd_prefetch = (rd_prefetch + 1) % addr_limit;
        if (rd_prefetch == 0)
      rdprefetch_flag = ~rdprefetch_flag;
    end
    if ((rd_prefetch == rd_addr && rd_addr != rdcount_out) || (RST === 1'b1 && fwft_prefetch_flag == 1)) begin
        fwft_prefetch_flag = 0;
        do_out = do_in;
        if (DATA_WIDTH != 4)
      dop_out = dop_in;
        rd_addr = (rd_addr + 1) % addr_limit;
        if (rd_addr == 0)
      rd_flag = ~rd_flag;
        dbiterr_out_out = dbiterr_out; // reg out in async mode
        sbiterr_out_out = sbiterr_out;
    end
    if (empty_ram[0] == 1'b0 && (RDEN == 1'b1 || rd_addr == rdcount_out)) begin
        do_buf = mem[rdcount_out];
        dop_buf = memp[rdcount_out];
        // ECC decode
        if (EN_ECC_READ == "TRUE") begin
      // regenerate parity
      dopr_ecc[0] = do_buf[0]^do_buf[1]^do_buf[3]^do_buf[4]^do_buf[6]^do_buf[8]
            ^do_buf[10]^do_buf[11]^do_buf[13]^do_buf[15]^do_buf[17]^do_buf[19]
            ^do_buf[21]^do_buf[23]^do_buf[25]^do_buf[26]^do_buf[28]
                      ^do_buf[30]^do_buf[32]^do_buf[34]^do_buf[36]^do_buf[38]
                              ^do_buf[40]^do_buf[42]^do_buf[44]^do_buf[46]^do_buf[48]
                              ^do_buf[50]^do_buf[52]^do_buf[54]^do_buf[56]^do_buf[57]^do_buf[59]
                              ^do_buf[61]^do_buf[63];
      dopr_ecc[1] = do_buf[0]^do_buf[2]^do_buf[3]^do_buf[5]^do_buf[6]^do_buf[9]
                                          ^do_buf[10]^do_buf[12]^do_buf[13]^do_buf[16]^do_buf[17]
                                          ^do_buf[20]^do_buf[21]^do_buf[24]^do_buf[25]^do_buf[27]^do_buf[28]
                                          ^do_buf[31]^do_buf[32]^do_buf[35]^do_buf[36]^do_buf[39]
                                          ^do_buf[40]^do_buf[43]^do_buf[44]^do_buf[47]^do_buf[48]
                                          ^do_buf[51]^do_buf[52]^do_buf[55]^do_buf[56]^do_buf[58]^do_buf[59]
                                          ^do_buf[62]^do_buf[63];
      dopr_ecc[2] = do_buf[1]^do_buf[2]^do_buf[3]^do_buf[7]^do_buf[8]^do_buf[9]
                                          ^do_buf[10]^do_buf[14]^do_buf[15]^do_buf[16]^do_buf[17]
                                          ^do_buf[22]^do_buf[23]^do_buf[24]^do_buf[25]^do_buf[29]
                                          ^do_buf[30]^do_buf[31]^do_buf[32]^do_buf[37]^do_buf[38]^do_buf[39]
                                          ^do_buf[40]^do_buf[45]^do_buf[46]^do_buf[47]^do_buf[48]
                                          ^do_buf[53]^do_buf[54]^do_buf[55]^do_buf[56]
                                          ^do_buf[60]^do_buf[61]^do_buf[62]^do_buf[63];
      dopr_ecc[3] = do_buf[4]^do_buf[5]^do_buf[6]^do_buf[7]^do_buf[8]^do_buf[9]
                              ^do_buf[10]^do_buf[18]^do_buf[19]
                                          ^do_buf[20]^do_buf[21]^do_buf[22]^do_buf[23]^do_buf[24]^do_buf[25]
                                          ^do_buf[33]^do_buf[34]^do_buf[35]^do_buf[36]^do_buf[37]^do_buf[38]
                                          ^do_buf[39]^do_buf[40]^do_buf[49]^do_buf[50]
                                          ^do_buf[51]^do_buf[52]^do_buf[53]^do_buf[54]^do_buf[55]^do_buf[56];
      dopr_ecc[4] = do_buf[11]^do_buf[12]^do_buf[13]^do_buf[14]^do_buf[15]^do_buf[16]
                                          ^do_buf[17]^do_buf[18]^do_buf[19]^do_buf[20]^do_buf[21]^do_buf[22]
                  ^do_buf[23]^do_buf[24]^do_buf[25]^do_buf[41]^do_buf[42]^do_buf[43]
                  ^do_buf[44]^do_buf[45]^do_buf[46]^do_buf[47]^do_buf[48]^do_buf[49]
                  ^do_buf[50]^do_buf[51]^do_buf[52]^do_buf[53]^do_buf[54]^do_buf[55]^do_buf[56];
      dopr_ecc[5] = do_buf[26]^do_buf[27]^do_buf[28]^do_buf[29]
                  ^do_buf[30]^do_buf[31]^do_buf[32]^do_buf[33]^do_buf[34]^do_buf[35]
                  ^do_buf[36]^do_buf[37]^do_buf[38]^do_buf[39]^do_buf[40]
                  ^do_buf[41]^do_buf[42]^do_buf[43]^do_buf[44]^do_buf[45]
                  ^do_buf[46]^do_buf[47]^do_buf[48]^do_buf[49]^do_buf[50]
                  ^do_buf[51]^do_buf[52]^do_buf[53]^do_buf[54]^do_buf[55]^do_buf[56];
      dopr_ecc[6] = do_buf[57]^do_buf[58]^do_buf[59]
                  ^do_buf[60]^do_buf[61]^do_buf[62]^do_buf[63];
      dopr_ecc[7] = dop_buf[0]^dop_buf[1]^dop_buf[2]^dop_buf[3]^dop_buf[4]^dop_buf[5]
                  ^dop_buf[6]^do_buf[0]^do_buf[1]^do_buf[2]^do_buf[3]^do_buf[4]
                  ^do_buf[5]^do_buf[6]^do_buf[7]^do_buf[8]^do_buf[9]^do_buf[10]
                  ^do_buf[11]^do_buf[12]^do_buf[13]^do_buf[14]^do_buf[15]^do_buf[16]
                  ^do_buf[17]^do_buf[18]^do_buf[19]^do_buf[20]^do_buf[21]^do_buf[22]
                  ^do_buf[23]^do_buf[24]^do_buf[25]^do_buf[26]^do_buf[27]^do_buf[28]
                  ^do_buf[29]^do_buf[30]^do_buf[31]^do_buf[32]^do_buf[33]^do_buf[34]
                  ^do_buf[35]^do_buf[36]^do_buf[37]^do_buf[38]^do_buf[39]^do_buf[40]
                  ^do_buf[41]^do_buf[42]^do_buf[43]^do_buf[44]^do_buf[45]^do_buf[46]
                  ^do_buf[47]^do_buf[48]^do_buf[49]^do_buf[50]^do_buf[51]^do_buf[52]
                  ^do_buf[53]^do_buf[54]^do_buf[55]^do_buf[56]^do_buf[57]^do_buf[58]
                  ^do_buf[59]^do_buf[60]^do_buf[61]^do_buf[62]^do_buf[63];
      syndrome = dopr_ecc ^ dop_buf;
      if (syndrome !== 0) begin
          if (syndrome[7]) begin  // dectect single bit error
        ecc_bit_position = {do_buf[63:57], dop_buf[6], do_buf[56:26], dop_buf[5], do_buf[25:11], dop_buf[4], do_buf[10:4], dop_buf[3], do_buf[3:1], dop_buf[2], do_buf[0], dop_buf[1:0], dop_buf[7]};
        if (syndrome[6:0] > 71) begin
            $display ("DRC Error : Simulation halted due Corrupted DIP. To correct this problem, make sure that reliable data is fed to the DIP. The correct Parity must be generated by a Hamming code encoder or encoder in the Block RAM. The output from the model is unreliable if there are more than 2 bit errors. The model doesn't warn if there is sporadic input of more than 2 bit errors due to the limitation in Hamming code.");
            #1 $finish;
        end
        ecc_bit_position[syndrome[6:0]] = ~ecc_bit_position[syndrome[6:0]]; // correct single bit error in the output
        di_in_ecc_corrected = {ecc_bit_position[71:65], ecc_bit_position[63:33], ecc_bit_position[31:17], ecc_bit_position[15:9], ecc_bit_position[7:5], ecc_bit_position[3]}; // correct single bit error in the memory
        do_buf = di_in_ecc_corrected;
        dip_in_ecc_corrected = {ecc_bit_position[0], ecc_bit_position[64], ecc_bit_position[32], ecc_bit_position[16], ecc_bit_position[8], ecc_bit_position[4], ecc_bit_position[2:1]}; // correct single bit error in the parity memory
        dop_buf = dip_in_ecc_corrected;
        dbiterr_out = 0;
        sbiterr_out = 1;
          end
          else if (!syndrome[7]) begin  // double bit error
        sbiterr_out = 0;
        dbiterr_out = 1;
          end
      end // if (syndrome !== 0)
      else begin
          dbiterr_out = 0;
          sbiterr_out = 0;
      end // else: !if(syndrome !== 0)
        end // if (EN_ECC_READ == "TRUE")
        // end ecc decode
        do_in = do_buf;
        dop_in = dop_buf;
        #0;
        rdcount_out_m1 = rdcount_out;
        rdcount_out = (rdcount_out + 1) % addr_limit;
        if (rdcount_out == 0)
      rdcount_flag = ~rdcount_flag;
    end
      end // if (fwft == 1'b1)
      RDERR = (RDEN == 1'b1) && (EMPTY == 1'b1);
      ALMOSTEMPTY = almostempty_int[0];
      if (wr_addr_sync_3 - rdcount_out <= ae_empty)
    almostempty_int[0] = 1'b1;
      else
    almostempty_int[0] = 1'b0;
      if (fwft == 1'b0) begin
    if ((rdcount_out == rd_addr) && (rdcount_flag == rd_flag)) begin
        EMPTY = 1'b1;
    end
    else begin
        EMPTY = 1'b0;
    end
      end // if (fwft == 1'b0)
      else if (fwft == 1'b1) begin
    if ((rd_prefetch == rd_addr) && (rdprefetch_flag == rd_flag)) begin
        EMPTY = 1'b1;
    end
    else begin
        EMPTY = 1'b0;
    end
      end
      if ((rdcount_out == wr_addr_sync_2) && (rdcount_flag == awr_flag_sync_2)) begin
    empty_ram[0] = 1'b1;
      end
      else begin
    empty_ram[0] = 1'b0;
      end
    end // else: !if(sync_clk_async_mode == 1'b1)
  end // if (sync == 1'b0)
   end // always @ (posedge RDCLK)
   // Write clock
   always @(posedge WRCLK) begin
  // DRC
  if ((INJECTSBITERR === 1) && !(en_ecc_write_int == 1 || en_ecc_read_int == 1))
      $display("DRC Warning : INJECTSBITERR is not supported when neither EN_ECC_WRITE nor EN_ECCREAD = TRUE on FIFO18E1 instance %m.");
  if ((INJECTDBITERR === 1) && !(en_ecc_write_int == 1 || en_ecc_read_int == 1))
      $display("DRC Warning : INJECTDBITERR is not supported when neither EN_ECC_WRITE nor EN_ECCREAD = TRUE on FIFO18E1 instance %m.");
  // sync mode
  if (sync == 1'b1) begin
      if (WREN == 1'b1) begin
    if (FULL == 1'b0) begin
        // ECC encode
        if (EN_ECC_WRITE == "TRUE") begin
      dip_ecc[0] = DI[0]^DI[1]^DI[3]^DI[4]^DI[6]^DI[8]
                     ^DI[10]^DI[11]^DI[13]^DI[15]^DI[17]^DI[19]
                     ^DI[21]^DI[23]^DI[25]^DI[26]^DI[28]
                               ^DI[30]^DI[32]^DI[34]^DI[36]^DI[38]
                     ^DI[40]^DI[42]^DI[44]^DI[46]^DI[48]
                     ^DI[50]^DI[52]^DI[54]^DI[56]^DI[57]^DI[59]
                     ^DI[61]^DI[63];
      dip_ecc[1] = DI[0]^DI[2]^DI[3]^DI[5]^DI[6]^DI[9]
                                 ^DI[10]^DI[12]^DI[13]^DI[16]^DI[17]
                                 ^DI[20]^DI[21]^DI[24]^DI[25]^DI[27]^DI[28]
                                 ^DI[31]^DI[32]^DI[35]^DI[36]^DI[39]
                                 ^DI[40]^DI[43]^DI[44]^DI[47]^DI[48]
                                 ^DI[51]^DI[52]^DI[55]^DI[56]^DI[58]^DI[59]
                                 ^DI[62]^DI[63];
      dip_ecc[2] = DI[1]^DI[2]^DI[3]^DI[7]^DI[8]^DI[9]
                                 ^DI[10]^DI[14]^DI[15]^DI[16]^DI[17]
                                 ^DI[22]^DI[23]^DI[24]^DI[25]^DI[29]
                                 ^DI[30]^DI[31]^DI[32]^DI[37]^DI[38]^DI[39]
                                 ^DI[40]^DI[45]^DI[46]^DI[47]^DI[48]
                                 ^DI[53]^DI[54]^DI[55]^DI[56]
                                 ^DI[60]^DI[61]^DI[62]^DI[63];
      dip_ecc[3] = DI[4]^DI[5]^DI[6]^DI[7]^DI[8]^DI[9]
               ^DI[10]^DI[18]^DI[19]
                                 ^DI[20]^DI[21]^DI[22]^DI[23]^DI[24]^DI[25]
                                 ^DI[33]^DI[34]^DI[35]^DI[36]^DI[37]^DI[38]^DI[39]
                                 ^DI[40]^DI[49]
                                 ^DI[50]^DI[51]^DI[52]^DI[53]^DI[54]^DI[55]^DI[56];
      dip_ecc[4] = DI[11]^DI[12]^DI[13]^DI[14]^DI[15]^DI[16]^DI[17]^DI[18]^DI[19]
                                 ^DI[20]^DI[21]^DI[22]^DI[23]^DI[24]^DI[25]
                                 ^DI[41]^DI[42]^DI[43]^DI[44]^DI[45]^DI[46]^DI[47]^DI[48]^DI[49]
                                 ^DI[50]^DI[51]^DI[52]^DI[53]^DI[54]^DI[55]^DI[56];
      dip_ecc[5] = DI[26]^DI[27]^DI[28]^DI[29]
                                 ^DI[30]^DI[31]^DI[32]^DI[33]^DI[34]^DI[35]^DI[36]^DI[37]^DI[38]^DI[39]
                                 ^DI[40]^DI[41]^DI[42]^DI[43]^DI[44]^DI[45]^DI[46]^DI[47]^DI[48]^DI[49]
                                 ^DI[50]^DI[51]^DI[52]^DI[53]^DI[54]^DI[55]^DI[56];
      dip_ecc[6] = DI[57]^DI[58]^DI[59]
               ^DI[60]^DI[61]^DI[62]^DI[63];
      dip_ecc[7] = dip_ecc[0]^dip_ecc[1]^dip_ecc[2]^dip_ecc[3]^dip_ecc[4]^dip_ecc[5]^dip_ecc[6]
                                 ^DI[0]^DI[1]^DI[2]^DI[3]^DI[4]^DI[5]^DI[6]^DI[7]^DI[8]^DI[9]
                                 ^DI[10]^DI[11]^DI[12]^DI[13]^DI[14]^DI[15]^DI[16]^DI[17]^DI[18]^DI[19]
                                 ^DI[20]^DI[21]^DI[22]^DI[23]^DI[24]^DI[25]^DI[26]^DI[27]^DI[28]^DI[29]
                                 ^DI[30]^DI[31]^DI[32]^DI[33]^DI[34]^DI[35]^DI[36]^DI[37]^DI[38]^DI[39]
                                 ^DI[40]^DI[41]^DI[42]^DI[43]^DI[44]^DI[45]^DI[46]^DI[47]^DI[48]^DI[49]
                                 ^DI[50]^DI[51]^DI[52]^DI[53]^DI[54]^DI[55]^DI[56]^DI[57]^DI[58]^DI[59]
                                 ^DI[60]^DI[61]^DI[62]^DI[63];
      eccparity_out = dip_ecc;
      dip_int = dip_ecc;  // only 64 bits width
        end // if (EN_ECC_WRITE == "TRUE")
        else begin
      dip_int = DIP; // only 64 bits width
        end // else: !if(EN_ECC_WRITE == "TRUE")
        // end ecc encode
        if (RST === 1'b0) begin
      // injecting error
         di_ecc_col = DI;
      if (en_ecc_write_int == 1 || en_ecc_read_int == 1) begin
          if (INJECTDBITERR === 1) begin
        di_ecc_col[30] = ~di_ecc_col[30];
        di_ecc_col[62] = ~di_ecc_col[62];
          end
          else if (INJECTSBITERR === 1) begin
        di_ecc_col[30] = ~di_ecc_col[30];
          end
      end // if (en_ecc_write_int == 1 || en_ecc_read_int == 1)
      mem[wr_addr] = di_ecc_col;
      memp[wr_addr] = dip_int;
      wr_addr = (wr_addr + 1) % addr_limit;
      if (wr_addr == 0)
          wr_flag = ~wr_flag;
        end
    end // if (FULL == 1'b0)
      end // if (WREN == 1'b1)
      if (RST === 1'b0) begin
    WRERR = (WREN == 1'b1) && (FULL == 1'b1);
    if (RDEN == 1'b1) begin
        FULL = 1'b0;
    end
    else if (rdcount_out == wr_addr && rdcount_flag != wr_flag)
        FULL = 1'b1;
    if ((((rdcount_out + ae_empty) <= wr_addr) && (rdcount_flag == wr_flag)) || (((rdcount_out + ae_empty) <= (wr_addr + addr_limit) && (rdcount_flag != wr_flag)))) begin
        if (rdcount_out <= rdcount_out + ae_empty || rdcount_flag != wr_flag)
      ALMOSTEMPTY = 1'b0;
    end
    if ((((rdcount_out + addr_limit) <= (wr_addr + ae_full)) && (rdcount_flag == wr_flag)) || ((rdcount_out <= (wr_addr + ae_full)) && (rdcount_flag != wr_flag))) begin
        ALMOSTFULL = 1'b1;
    end
      end // if (RST === 1'b0)
  end // if (sync == 1'b1)
  // async mode
  else if (sync == 1'b0) begin
      rdcount_out_sync_3 = rdcount_out_sync_2;
      rdcount_out_sync_2 = rdcount_out_sync_1;
      rdcount_out_sync_1 = rdcount_out_m1;
     if (sync_clk_async_mode == 1'b1) begin
      wren_reg = WREN;
      if (wren_reg == 1'b1 && FULL == 1'b0) begin
    // ECC encode
    if (EN_ECC_WRITE == "TRUE") begin
        dip_ecc[0] = DI[0]^DI[1]^DI[3]^DI[4]^DI[6]^DI[8]
                     ^DI[10]^DI[11]^DI[13]^DI[15]^DI[17]^DI[19]
                     ^DI[21]^DI[23]^DI[25]^DI[26]^DI[28]
                               ^DI[30]^DI[32]^DI[34]^DI[36]^DI[38]
                     ^DI[40]^DI[42]^DI[44]^DI[46]^DI[48]
                     ^DI[50]^DI[52]^DI[54]^DI[56]^DI[57]^DI[59]
                     ^DI[61]^DI[63];
        dip_ecc[1] = DI[0]^DI[2]^DI[3]^DI[5]^DI[6]^DI[9]
                                 ^DI[10]^DI[12]^DI[13]^DI[16]^DI[17]
                                 ^DI[20]^DI[21]^DI[24]^DI[25]^DI[27]^DI[28]
                                 ^DI[31]^DI[32]^DI[35]^DI[36]^DI[39]
                                 ^DI[40]^DI[43]^DI[44]^DI[47]^DI[48]
                                 ^DI[51]^DI[52]^DI[55]^DI[56]^DI[58]^DI[59]
                                 ^DI[62]^DI[63];
        dip_ecc[2] = DI[1]^DI[2]^DI[3]^DI[7]^DI[8]^DI[9]
                                 ^DI[10]^DI[14]^DI[15]^DI[16]^DI[17]
                                 ^DI[22]^DI[23]^DI[24]^DI[25]^DI[29]
                                 ^DI[30]^DI[31]^DI[32]^DI[37]^DI[38]^DI[39]
                                 ^DI[40]^DI[45]^DI[46]^DI[47]^DI[48]
                                 ^DI[53]^DI[54]^DI[55]^DI[56]
                                 ^DI[60]^DI[61]^DI[62]^DI[63];
        dip_ecc[3] = DI[4]^DI[5]^DI[6]^DI[7]^DI[8]^DI[9]
               ^DI[10]^DI[18]^DI[19]
                                 ^DI[20]^DI[21]^DI[22]^DI[23]^DI[24]^DI[25]
                                 ^DI[33]^DI[34]^DI[35]^DI[36]^DI[37]^DI[38]^DI[39]
                                 ^DI[40]^DI[49]
                                 ^DI[50]^DI[51]^DI[52]^DI[53]^DI[54]^DI[55]^DI[56];
        dip_ecc[4] = DI[11]^DI[12]^DI[13]^DI[14]^DI[15]^DI[16]^DI[17]^DI[18]^DI[19]
                                 ^DI[20]^DI[21]^DI[22]^DI[23]^DI[24]^DI[25]
                                 ^DI[41]^DI[42]^DI[43]^DI[44]^DI[45]^DI[46]^DI[47]^DI[48]^DI[49]
                                 ^DI[50]^DI[51]^DI[52]^DI[53]^DI[54]^DI[55]^DI[56];
        dip_ecc[5] = DI[26]^DI[27]^DI[28]^DI[29]
                                 ^DI[30]^DI[31]^DI[32]^DI[33]^DI[34]^DI[35]^DI[36]^DI[37]^DI[38]^DI[39]
                                 ^DI[40]^DI[41]^DI[42]^DI[43]^DI[44]^DI[45]^DI[46]^DI[47]^DI[48]^DI[49]
                                 ^DI[50]^DI[51]^DI[52]^DI[53]^DI[54]^DI[55]^DI[56];
        dip_ecc[6] = DI[57]^DI[58]^DI[59]
               ^DI[60]^DI[61]^DI[62]^DI[63];
        dip_ecc[7] = dip_ecc[0]^dip_ecc[1]^dip_ecc[2]^dip_ecc[3]^dip_ecc[4]^dip_ecc[5]^dip_ecc[6]
                                 ^DI[0]^DI[1]^DI[2]^DI[3]^DI[4]^DI[5]^DI[6]^DI[7]^DI[8]^DI[9]
                                 ^DI[10]^DI[11]^DI[12]^DI[13]^DI[14]^DI[15]^DI[16]^DI[17]^DI[18]^DI[19]
                                 ^DI[20]^DI[21]^DI[22]^DI[23]^DI[24]^DI[25]^DI[26]^DI[27]^DI[28]^DI[29]
                                 ^DI[30]^DI[31]^DI[32]^DI[33]^DI[34]^DI[35]^DI[36]^DI[37]^DI[38]^DI[39]
                                 ^DI[40]^DI[41]^DI[42]^DI[43]^DI[44]^DI[45]^DI[46]^DI[47]^DI[48]^DI[49]
                                 ^DI[50]^DI[51]^DI[52]^DI[53]^DI[54]^DI[55]^DI[56]^DI[57]^DI[58]^DI[59]
                                 ^DI[60]^DI[61]^DI[62]^DI[63];
        eccparity_out = dip_ecc;
        dip_int = dip_ecc;  // only 64 bits width
    end // if (EN_ECC_WRITE == "TRUE")
    else begin
        dip_int = DIP; // only 64 bits width
    end // else: !if(EN_ECC_WRITE == "TRUE")
    // end ecc encode
       if (RST === 1'b0) begin
    // injecting error
       di_ecc_col = DI;
    if (en_ecc_write_int == 1 || en_ecc_read_int == 1) begin
        if (INJECTDBITERR === 1) begin
      di_ecc_col[30] = ~di_ecc_col[30];
      di_ecc_col[62] = ~di_ecc_col[62];
        end
        else if (INJECTSBITERR === 1) begin
      di_ecc_col[30] = ~di_ecc_col[30];
        end
    end // if (en_ecc_write_int == 1 || en_ecc_read_int == 1)
    mem[wr_addr] = di_ecc_col;
    memp[wr_addr] = dip_int;
    #1;
    wr_addr = (wr_addr + 1) % addr_limit;
    if (wr_addr == 0)
        awr_flag = ~awr_flag;
    if (wr_addr == addr_limit - 1)
        wr_flag = ~wr_flag;
       end // if (RST === 1'b0)
      end // if (wren_reg == 1'b1 && FULL == 1'b0)
    if (RST === 1'b0) begin
      WRERR = (wren_reg == 1'b1) && (FULL == 1'b1);
      ALMOSTFULL = almostfull_int[3];
      if ((((rdcount_out + addr_limit) <= (wr_addr + ae_full + 1)) && (rdcount_flag == awr_flag)) || ((rdcount_out <= (wr_addr + ae_full + 1)) && (rdcount_flag != awr_flag))) begin
    almostfull_int[3] = 1'b1;
    almostfull_int[2] = 1'b1;
    almostfull_int[1] = 1'b1;
    almostfull_int[0] = 1'b1;
      end
      else if (almostfull_int[2] == 1'b0) begin
    if (wr_addr <= wr_addr + ae_full || rdcount_flag == awr_flag) begin
        almostfull_int[3] = almostfull_int[0];
        almostfull_int[0] = 1'b0;
        end
      end
      if ((((rdcount_out + ae_empty) <= wr_addr) && (rdcount_flag == awr_flag)) || (((rdcount_out + ae_empty) <= (wr_addr + addr_limit)) && (rdcount_flag != awr_flag))) begin
    if (wren_reg == 1'b1) begin
        almostempty_int[2] = almostempty_int[1];
        almostempty_int[1] = 1'b0;
    end
      end
      else begin
    almostempty_int[2] = 1'b1;
    almostempty_int[1] = 1'b1;
      end
      if (wren_reg == 1'b1 || FULL == 1'b1)
    FULL = full_int[1];
      if (((rdcount_out == wr_addr) || (rdcount_out - 1 == wr_addr || (rdcount_out + addr_limit - 1 == wr_addr))) && ALMOSTFULL) begin
    full_int[1] = 1'b1;
    full_int[0] = 1'b1;
      end
      else begin
    full_int[1] = full_int[0];
    full_int[0] = 0;
      end
      // fix for 724006
            if (rdcount_out - 1 == wr_addr && (wren_reg == 1'b1 || FULL == 1'b1))
              FULL = full_int[1];
    end // if (RST === 1'b0)
     end // if (sync_clk_async_mode == 1'b1)
     else begin
      if (WREN == 1'b1 && FULL == 1'b0) begin
    // ECC encode
    if (EN_ECC_WRITE == "TRUE") begin
        dip_ecc[0] = DI[0]^DI[1]^DI[3]^DI[4]^DI[6]^DI[8]
                     ^DI[10]^DI[11]^DI[13]^DI[15]^DI[17]^DI[19]
                     ^DI[21]^DI[23]^DI[25]^DI[26]^DI[28]
                               ^DI[30]^DI[32]^DI[34]^DI[36]^DI[38]
                     ^DI[40]^DI[42]^DI[44]^DI[46]^DI[48]
                     ^DI[50]^DI[52]^DI[54]^DI[56]^DI[57]^DI[59]
                     ^DI[61]^DI[63];
        dip_ecc[1] = DI[0]^DI[2]^DI[3]^DI[5]^DI[6]^DI[9]
                                 ^DI[10]^DI[12]^DI[13]^DI[16]^DI[17]
                                 ^DI[20]^DI[21]^DI[24]^DI[25]^DI[27]^DI[28]
                                 ^DI[31]^DI[32]^DI[35]^DI[36]^DI[39]
                                 ^DI[40]^DI[43]^DI[44]^DI[47]^DI[48]
                                 ^DI[51]^DI[52]^DI[55]^DI[56]^DI[58]^DI[59]
                                 ^DI[62]^DI[63];
        dip_ecc[2] = DI[1]^DI[2]^DI[3]^DI[7]^DI[8]^DI[9]
                                 ^DI[10]^DI[14]^DI[15]^DI[16]^DI[17]
                                 ^DI[22]^DI[23]^DI[24]^DI[25]^DI[29]
                                 ^DI[30]^DI[31]^DI[32]^DI[37]^DI[38]^DI[39]
                                 ^DI[40]^DI[45]^DI[46]^DI[47]^DI[48]
                                 ^DI[53]^DI[54]^DI[55]^DI[56]
                                 ^DI[60]^DI[61]^DI[62]^DI[63];
        dip_ecc[3] = DI[4]^DI[5]^DI[6]^DI[7]^DI[8]^DI[9]
               ^DI[10]^DI[18]^DI[19]
                                 ^DI[20]^DI[21]^DI[22]^DI[23]^DI[24]^DI[25]
                                 ^DI[33]^DI[34]^DI[35]^DI[36]^DI[37]^DI[38]^DI[39]
                                 ^DI[40]^DI[49]
                                 ^DI[50]^DI[51]^DI[52]^DI[53]^DI[54]^DI[55]^DI[56];
        dip_ecc[4] = DI[11]^DI[12]^DI[13]^DI[14]^DI[15]^DI[16]^DI[17]^DI[18]^DI[19]
                                 ^DI[20]^DI[21]^DI[22]^DI[23]^DI[24]^DI[25]
                                 ^DI[41]^DI[42]^DI[43]^DI[44]^DI[45]^DI[46]^DI[47]^DI[48]^DI[49]
                                 ^DI[50]^DI[51]^DI[52]^DI[53]^DI[54]^DI[55]^DI[56];
        dip_ecc[5] = DI[26]^DI[27]^DI[28]^DI[29]
                                 ^DI[30]^DI[31]^DI[32]^DI[33]^DI[34]^DI[35]^DI[36]^DI[37]^DI[38]^DI[39]
                                 ^DI[40]^DI[41]^DI[42]^DI[43]^DI[44]^DI[45]^DI[46]^DI[47]^DI[48]^DI[49]
                                 ^DI[50]^DI[51]^DI[52]^DI[53]^DI[54]^DI[55]^DI[56];
        dip_ecc[6] = DI[57]^DI[58]^DI[59]
               ^DI[60]^DI[61]^DI[62]^DI[63];
        dip_ecc[7] = dip_ecc[0]^dip_ecc[1]^dip_ecc[2]^dip_ecc[3]^dip_ecc[4]^dip_ecc[5]^dip_ecc[6]
                                 ^DI[0]^DI[1]^DI[2]^DI[3]^DI[4]^DI[5]^DI[6]^DI[7]^DI[8]^DI[9]
                                 ^DI[10]^DI[11]^DI[12]^DI[13]^DI[14]^DI[15]^DI[16]^DI[17]^DI[18]^DI[19]
                                 ^DI[20]^DI[21]^DI[22]^DI[23]^DI[24]^DI[25]^DI[26]^DI[27]^DI[28]^DI[29]
                                 ^DI[30]^DI[31]^DI[32]^DI[33]^DI[34]^DI[35]^DI[36]^DI[37]^DI[38]^DI[39]
                                 ^DI[40]^DI[41]^DI[42]^DI[43]^DI[44]^DI[45]^DI[46]^DI[47]^DI[48]^DI[49]
                                 ^DI[50]^DI[51]^DI[52]^DI[53]^DI[54]^DI[55]^DI[56]^DI[57]^DI[58]^DI[59]
                                 ^DI[60]^DI[61]^DI[62]^DI[63];
        eccparity_out = dip_ecc;
        dip_int = dip_ecc;  // only 64 bits width
    end // if (EN_ECC_WRITE == "TRUE")
    else begin
        dip_int = DIP; // only 64 bits width
    end // else: !if(EN_ECC_WRITE == "TRUE")
    // end ecc encode
       if (RST === 1'b0) begin
    // injecting error
       di_ecc_col = DI;
    if (en_ecc_write_int == 1 || en_ecc_read_int == 1) begin
        if (INJECTDBITERR === 1) begin
      di_ecc_col[30] = ~di_ecc_col[30];
      di_ecc_col[62] = ~di_ecc_col[62];
        end
        else if (INJECTSBITERR === 1) begin
      di_ecc_col[30] = ~di_ecc_col[30];
        end
    end // if (en_ecc_write_int == 1 || en_ecc_read_int == 1)
    mem[wr_addr] = di_ecc_col;
    memp[wr_addr] = dip_int;
    #0;
    wr_addr = (wr_addr + 1) % addr_limit;
    if (wr_addr == 0)
        awr_flag = ~awr_flag;
    if (wr_addr == addr_limit - 1)
        wr_flag = ~wr_flag;
       end // if (RST === 1'b0)
      end // if (WREN == 1'b1 && FULL == 1'b0)
      rm1w_eq = (rdcount_out_sync_2 == wr_addr) ? 1 : 0;
      if (wr_addr + 1 == addr_limit) // wr_addr(FF) + 1 != 0
    rm1wp1_eq = (rdcount_out_sync_2 == 0) ? 1 : 0;
      else
    rm1wp1_eq = (rdcount_out_sync_2 == wr_addr + 1) ? 1 : 0;
      if (RST === 1'b0) begin
    WRERR = (WREN == 1'b1) && (FULL == 1'b1);
    ALMOSTFULL = almostfull_int[0];
    if (rdcount_out_sync_3 - wr_addr <= ae_full)
        almostfull_int[0] = 1'b1;
    else
        almostfull_int[0] = 1'b0;
          FULL = full_v3;
    //fwft prefetch
    if (EMPTY == 1'b1 && WREN === 1'b1 && fwft_prefetch_flag == 0)
        fwft_prefetch_flag = 1;
      end // if (RST === 1'b0)
     end // else: !if(sync_clk_async_mode == 1'b1)
  end // if (sync == 1'b0)
   end // always @ (posedge WRCLK)
end // case: "7SERIES"
endcase // case(SIM_DEVICE)
endgenerate
    // output register
    always @(do_out or dop_out or do_outreg or dop_outreg) begin
  if (sync == 1)
      case (DO_REG)
    0 : begin
                  do_out_mux = do_out;
            dop_out_mux = dop_out;
              end
    1 : begin
            do_out_mux = do_outreg;
            dop_out_mux = dop_outreg;
              end
    default : begin
                        $display("Attribute Syntax Error : The attribute DO_REG on FIFO18E1 instance %m is set to %2d.  Legal values for this attribute are 0 or 1.", DO_REG);
                        #1 $finish;
                    end
      endcase
  else begin
      do_out_mux = do_out;
      dop_out_mux = dop_out;
  end // else: !if(sync == 1)
    end // always @ (do_out or dop_out or do_outreg or dop_outreg)
    // matching HW behavior to X the unused output bits
    assign DO = (DATA_WIDTH == 4) ? {60'bx, do_out_mux[3:0]}
                      : (DATA_WIDTH == 9) ? {56'bx, do_out_mux[7:0]}
                      : (DATA_WIDTH == 18) ? {48'bx, do_out_mux[15:0]}
                      : (DATA_WIDTH == 36) ? {32'bx, do_out_mux[31:0]}
                : (DATA_WIDTH == 72) ? do_out_mux
                      : do_out_mux;
    // matching HW behavior to X the unused output bits
    assign DOP = (DATA_WIDTH ==  9) ? {7'bx, dop_out_mux[0:0]}
                       : (DATA_WIDTH == 18) ? {6'bx, dop_out_mux[1:0]}
           : (DATA_WIDTH == 36) ? {4'bx, dop_out_mux[3:0]}
                 : (DATA_WIDTH == 72) ? dop_out_mux
                       : 8'bx;
    // matching HW behavior to pull up the unused output bits
    always @(wr_addr) begin
  if (FIFO_SIZE == 18)
      case (DATA_WIDTH)
    4 : WRCOUNT = {1'b1, wr_addr[counter_width:0]};
    9 : WRCOUNT = {2'b11, wr_addr[counter_width:0]};
    18 : WRCOUNT = {3'b111, wr_addr[counter_width:0]};
    36 : WRCOUNT = {4'hf, wr_addr[counter_width:0]};
    default : WRCOUNT = wr_addr;
      endcase // case(DATA_WIDTH)
  else
      case (DATA_WIDTH)
    4 : WRCOUNT = wr_addr;
    9 : WRCOUNT = {1'b1, wr_addr[counter_width:0]};
    18 : WRCOUNT = {2'b11, wr_addr[counter_width:0]};
    36 : WRCOUNT = {3'b111, wr_addr[counter_width:0]};
    72 : WRCOUNT = {4'hf, wr_addr[counter_width:0]};
    default : WRCOUNT = wr_addr;
      endcase // case(DATA_WIDTH)
    end // always @ (wr_addr)
    // matching HW behavior to pull up the unused output bits
    always @(rdcount_out) begin
  if (FIFO_SIZE == 18)
      case (DATA_WIDTH)
    4 : RDCOUNT = {1'b1, rdcount_out[counter_width:0]};
    9 : RDCOUNT = {2'b11, rdcount_out[counter_width:0]};
    18 : RDCOUNT = {3'b111, rdcount_out[counter_width:0]};
    36 : RDCOUNT = {4'hf, rdcount_out[counter_width:0]};
    default : RDCOUNT = rdcount_out;
      endcase // case(DATA_WIDTH)
  else
      case (DATA_WIDTH)
    4 : RDCOUNT = rdcount_out;
    9 : RDCOUNT = {1'b1, rdcount_out[counter_width:0]};
    18 : RDCOUNT = {2'b11, rdcount_out[counter_width:0]};
    36 : RDCOUNT = {3'b111, rdcount_out[counter_width:0]};
    72 : RDCOUNT = {4'hf, rdcount_out[counter_width:0]};
    default : RDCOUNT = rdcount_out;
      endcase // case(DATA_WIDTH)
    end // always @ (rdcount_out)
endmodule