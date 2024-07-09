module FIFO18E1 (ALMOSTEMPTY, ALMOSTFULL, DO, DOP, EMPTY, FULL, RDCOUNT, RDERR, WRCOUNT, WRERR,
         DI, DIP, RDCLK, RDEN, REGCE, RST, RSTREG, WRCLK, WREN);
    parameter ALMOST_EMPTY_OFFSET = 13'h0080;
    parameter ALMOST_FULL_OFFSET = 13'h0080;
    parameter integer DATA_WIDTH = 4;
    parameter integer DO_REG = 1;
    parameter EN_SYN = "FALSE";
    parameter FIFO_MODE = "FIFO18";
    parameter FIRST_WORD_FALL_THROUGH = "FALSE";
    parameter INIT = 36'h0;
    parameter IS_RDCLK_INVERTED = 1'b0;
    parameter IS_RDEN_INVERTED = 1'b0;
    parameter IS_RSTREG_INVERTED = 1'b0;
    parameter IS_RST_INVERTED = 1'b0;
    parameter IS_WRCLK_INVERTED = 1'b0;
    parameter IS_WREN_INVERTED = 1'b0;
`ifdef XIL_TIMING
    parameter LOC = "UNPLACED";
`endif
    parameter SIM_DEVICE = "7SERIES";
    parameter SRVAL = 36'h0;
    output ALMOSTEMPTY;
    output ALMOSTFULL;
    output [31:0] DO;
    output [3:0] DOP;
    output EMPTY;
    output FULL;
    output [11:0] RDCOUNT;
    output RDERR;
    output [11:0] WRCOUNT;
    output WRERR;
    input [31:0] DI;
    input [3:0] DIP;
    input RDCLK;
    input RDEN;
    input REGCE;
    input RST;
    input RSTREG;
    input WRCLK;
    input WREN;
    tri0 GSR = glbl.GSR;
    wire dangle_out, dangle_out1, dangle_out1_1, dangle_out1_2;
    wire [3:0] dangle_out4;
    wire [7:0] dangle_out8;
    wire [31:0] dangle_out32;
    wire almostempty_wire, empty_wire, rderr_wire;
    wire almostfull_wire, full_wire, wrerr_wire;
    wire [11:0] wrcount_wire, rdcount_wire;
    reg notifier, notifier_wrclk, notifier_rdclk;
    wire [31:0] do_wire;
    wire [3:0] dop_wire;
    reg finish_error = 0;
`ifdef XIL_TIMING
    wire [31:0] DI_dly;
    wire [3:0] DIP_dly;
    wire RDCLK_dly;
    wire RDEN_dly;
    wire REGCE_dly;
    wire RST_dly;
    wire RSTREG_dly;
    wire WRCLK_dly;
    wire WREN_dly;
`endif
    wire [31:0] di_in;
    wire [3:0] dip_in;
    wire rdclk_in;
    wire rden_in;
    wire regce_in;
    wire rst_in;
    wire rstreg_in;
    wire wrclk_in;
    wire wren_in;
    reg IS_RDCLK_INVERTED_REG = IS_RDCLK_INVERTED;
    reg IS_RDEN_INVERTED_REG = IS_RDEN_INVERTED;
    reg IS_RSTREG_INVERTED_REG = IS_RSTREG_INVERTED;
    reg IS_RST_INVERTED_REG = IS_RST_INVERTED;
    reg IS_WRCLK_INVERTED_REG = IS_WRCLK_INVERTED;
    reg IS_WREN_INVERTED_REG = IS_WREN_INVERTED;
`ifdef XIL_TIMING
    assign di_in = DI_dly;
    assign dip_in = DIP_dly;
    assign regce_in = REGCE_dly;
    assign rdclk_in = RDCLK_dly ^ IS_RDCLK_INVERTED_REG;
    assign rden_in = RDEN_dly ^ IS_RDEN_INVERTED_REG;
    assign rst_in = RST_dly ^ IS_RST_INVERTED_REG;
    assign rstreg_in = RSTREG_dly ^ IS_RSTREG_INVERTED_REG;
    assign wrclk_in = WRCLK_dly ^ IS_WRCLK_INVERTED_REG;
    assign wren_in = WREN_dly ^ IS_WREN_INVERTED_REG;
`else
    assign di_in = DI;
    assign dip_in = DIP;
    assign regce_in = REGCE;
    assign rdclk_in = RDCLK ^ IS_RDCLK_INVERTED_REG;
    assign rden_in = RDEN ^ IS_RDEN_INVERTED_REG;
    assign rst_in = RST ^ IS_RST_INVERTED_REG;
    assign rstreg_in = RSTREG ^ IS_RSTREG_INVERTED_REG;
    assign wrclk_in = WRCLK ^ IS_WRCLK_INVERTED_REG;
    assign wren_in = WREN ^ IS_WREN_INVERTED_REG;
`endif //  `ifndef XIL_TIMING
    initial begin
  case (FIFO_MODE)
      "FIFO18" : ;
      "FIFO18_36" : if (DATA_WIDTH != 36) begin
                  $display("DRC Error : The attribute DATA_WIDTH must be set to 36 when attribute FIFO_MODE = FIFO18_36.");
                  finish_error = 1;
                    end
      default : begin
                     $display("Attribute Syntax Error : The attribute FIFO_MODE on FIFO18E1 instance %m is set to %s.  Legal values for this attribute are FIFO18 or FIFO18_36.", FIFO_MODE);
              finish_error = 1;
                end
  endcase // case(FIFO_MODE)
      case (DATA_WIDTH)
      4, 9, 18 : ;
      36 : if (FIFO_MODE != "FIFO18_36") begin
         $display("DRC Error : The attribute FIFO_MODE must be set to FIFO18_36 when attribute DATA_WIDTH = 36.");
         finish_error = 1;
           end
      default : begin
       $display("Attribute Syntax Error : The attribute DATA_WIDTH on FIFO18E1 instance %m is set to %d.  Legal values for this attribute are 4, 9, 18 or 36.", DATA_WIDTH);
             finish_error = 1;
         end
  endcase
       if (!((IS_RDCLK_INVERTED >= 1'b0) && (IS_RDCLK_INVERTED <= 1'b1))) begin
    $display("Attribute Syntax Error : The attribute IS_RDCLK_INVERTED on FIFO18E1 instance %m is set to %b.  Legal values for this attribute are 1'b0 to 1'b1.", IS_RDCLK_INVERTED);
    finish_error = 1'b1;
       end
       if (!((IS_RDEN_INVERTED >= 1'b0) && (IS_RDEN_INVERTED <= 1'b1))) begin
    $display("Attribute Syntax Error : The attribute IS_RDEN_INVERTED on FIFO18E1 instance %m is set to %b.  Legal values for this attribute are 1'b0 to 1'b1.", IS_RDEN_INVERTED);
    finish_error = 1'b1;
       end
       if (!((IS_RSTREG_INVERTED >= 1'b0) && (IS_RSTREG_INVERTED <= 1'b1))) begin
    $display("Attribute Syntax Error : The attribute IS_RSTREG_INVERTED on FIFO18E1 instance %m is set to %b.  Legal values for this attribute are 1'b0 to 1'b1.", IS_RSTREG_INVERTED);
    finish_error = 1'b1;
       end
       if (!((IS_RST_INVERTED >= 1'b0) && (IS_RST_INVERTED <= 1'b1))) begin
    $display("Attribute Syntax Error : The attribute IS_RST_INVERTED on FIFO18E1 instance %m is set to %b.  Legal values for this attribute are 1'b0 to 1'b1.", IS_RST_INVERTED);
    finish_error = 1'b1;
       end
       if (!((IS_WRCLK_INVERTED >= 1'b0) && (IS_WRCLK_INVERTED <= 1'b1))) begin
    $display("Attribute Syntax Error : The attribute IS_WRCLK_INVERTED on FIFO18E1 instance %m is set to %b.  Legal values for this attribute are 1'b0 to 1'b1.", IS_WRCLK_INVERTED);
    finish_error = 1'b1;
       end
       if (!((IS_WREN_INVERTED >= 1'b0) && (IS_WREN_INVERTED <= 1'b1))) begin
    $display("Attribute Syntax Error : The attribute IS_WREN_INVERTED on FIFO18E1 instance %m is set to %b.  Legal values for this attribute are 1'b0 to 1'b1.", IS_WREN_INVERTED);
    finish_error = 1'b1;
       end
       if (finish_error == 1)
   #1 $finish;
    end // initial begin
    // Matching HW
    localparam init_sdp = (FIFO_MODE == "FIFO18_36") ? {36'h0,INIT[35:34],INIT[17:16],INIT[33:18],INIT[15:0]} : {36'h0, INIT};
    localparam srval_sdp = (FIFO_MODE == "FIFO18_36") ? {36'h0,SRVAL[35:34],SRVAL[17:16],SRVAL[33:18],SRVAL[15:0]} : {36'h0, SRVAL};
    FF18_INTERNAL_VLOG #(.ALMOST_EMPTY_OFFSET(ALMOST_EMPTY_OFFSET),
          .ALMOST_FULL_OFFSET(ALMOST_FULL_OFFSET),
          .DATA_WIDTH(DATA_WIDTH),
          .DO_REG(DO_REG),
          .EN_SYN(EN_SYN),
          .FIFO_MODE(FIFO_MODE),
          .FIFO_SIZE(18),
          .FIRST_WORD_FALL_THROUGH(FIRST_WORD_FALL_THROUGH),
          .INIT({36'h0,init_sdp}),
          .SIM_DEVICE(SIM_DEVICE),
          .SRVAL({36'h0,srval_sdp}))
    INT_FIFO (.ALMOSTEMPTY(almostempty_wire),
        .ALMOSTFULL(almostfull_wire),
        .DBITERR(dangle_out),
        .DI({32'b0,di_in}),
        .DIP({4'b0,dip_in}),
        .DO({dangle_out32,do_wire}),
        .DOP({dangle_out4,dop_wire}),
        .ECCPARITY(dangle_out8),
        .EMPTY(empty_wire),
        .FULL(full_wire),
        .GSR(GSR),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDCLK(rdclk_in),
        .RDCOUNT({dangle_out1,rdcount_wire}),
        .RDEN(rden_in),
        .RDERR(rderr_wire),
        .REGCE(regce_in),
        .RST(rst_in),
        .RSTREG(rstreg_in),
        .SBITERR(dangle_out1_2),
        .WRCLK(wrclk_in),
        .WRCOUNT({dangle_out1_1,wrcount_wire}),
        .WREN(wren_in),
        .WRERR(wrerr_wire));
    reg ALMOSTEMPTY_out;
    reg ALMOSTFULL_out;
    reg [31:0] DO_out;
    reg [3:0] DOP_out;
    reg EMPTY_out;
    reg FULL_out;
    reg [11:0] RDCOUNT_out;
    reg RDERR_out;
    reg [11:0] WRCOUNT_out;
    reg WRERR_out;
    assign ALMOSTEMPTY = ALMOSTEMPTY_out;
    assign ALMOSTFULL = ALMOSTFULL_out;
    assign DO = DO_out;
    assign DOP = DOP_out;
    assign EMPTY = EMPTY_out;
    assign FULL = FULL_out;
    assign RDCOUNT = RDCOUNT_out;
    assign RDERR = RDERR_out;
    assign WRCOUNT = WRCOUNT_out;
    assign WRERR = WRERR_out;
//wrclk_in
    always @(almostfull_wire or rst_in or GSR) ALMOSTFULL_out = almostfull_wire;
    always @(full_wire or rst_in or GSR) FULL_out = full_wire;
    always @(wrerr_wire or rst_in or GSR) WRERR_out = wrerr_wire;
    always @(wrcount_wire or rst_in or GSR) WRCOUNT_out = wrcount_wire;
//rdclk_in
    always @(almostempty_wire or rst_in or GSR) ALMOSTEMPTY_out = almostempty_wire;
    always @(empty_wire or rst_in or GSR) EMPTY_out = empty_wire;
    always @(rderr_wire or rst_in or GSR) RDERR_out = rderr_wire;
    always @(rdcount_wire or rst_in or GSR) RDCOUNT_out = rdcount_wire;
    always @(do_wire or rst_in or GSR) DO_out = do_wire;
    always @(dop_wire or rst_in or GSR) DOP_out = dop_wire;
`ifdef XIL_TIMING
    always @(notifier) begin
  DO_out <= 32'bx;
  DOP_out <= 4'bx;
    end
    always @(notifier_wrclk) begin
  ALMOSTFULL_out <= 1'bx;
  FULL_out <= 1'bx;
  WRCOUNT_out <= 12'bx;
  WRERR_out <= 1'bx;
    end
    always @(notifier_rdclk) begin
  ALMOSTEMPTY_out <= 1'bx;
  EMPTY_out <= 1'bx;
  RDCOUNT_out <= 12'bx;
  RDERR_out <= 1'bx;
    end
   wire rdclk_en_n;
   wire rdclk_en_p;
   wire wrclk_en_n;
   wire wrclk_en_p;
   assign rdclk_en_n =  IS_RDCLK_INVERTED_REG;
   assign rdclk_en_p = ~IS_RDCLK_INVERTED_REG;
   assign wrclk_en_n =  IS_WRCLK_INVERTED_REG;
   assign wrclk_en_p = ~IS_WRCLK_INVERTED_REG;
   wire nrst;
   wire wren_enable;
   not (nrst, RST);
   and (wren_enable, WREN, nrst);
   wire rst_rdclk_n = nrst && rdclk_en_n;
   wire rst_rdclk_p = nrst && rdclk_en_p;
   wire rst_wrclk_n = nrst && wrclk_en_n;
   wire rst_wrclk_p = nrst && wrclk_en_p;
   wire wren_enable_p = wren_enable && wrclk_en_p;
   wire wren_enable_n = wren_enable && wrclk_en_n;
`endif //  `ifdef XIL_TIMING
    specify
        (RDCLK *> DO) = (100:100:100, 100:100:100);
        (RDCLK *> DOP) = (100:100:100, 100:100:100);
  (RDCLK => ALMOSTEMPTY) = (100:100:100, 100:100:100);
  (RDCLK => EMPTY) = (100:100:100, 100:100:100);
  (RDCLK *> RDCOUNT) = (100:100:100, 100:100:100);
  (RDCLK => RDERR) = (100:100:100, 100:100:100);
  (WRCLK => ALMOSTFULL) = (100:100:100, 100:100:100);
  (WRCLK => FULL) = (100:100:100, 100:100:100);
  (WRCLK *> WRCOUNT) = (100:100:100, 100:100:100);
  (WRCLK => WRERR) = (100:100:100, 100:100:100);
`ifdef XIL_TIMING
        (RST => ALMOSTEMPTY) = (0:0:0, 0:0:0);
        (RST => ALMOSTFULL) = (0:0:0, 0:0:0);
        (RST => EMPTY) = (0:0:0, 0:0:0);
        (RST => FULL) = (0:0:0, 0:0:0);
        (RST *> RDCOUNT) = (0:0:0, 0:0:0);
        (RST => RDERR) = (0:0:0, 0:0:0);
        (RST *> WRCOUNT) = (0:0:0, 0:0:0);
        (RST => WRERR) = (0:0:0, 0:0:0);
  $setuphold (posedge RDCLK, negedge RDEN, 0:0:0, 0:0:0,,rst_rdclk_p, rst_rdclk_p, RDCLK_dly, RDEN_dly);
  $setuphold (posedge RDCLK, posedge RDEN, 0:0:0, 0:0:0,,rst_rdclk_p, rst_rdclk_p, RDCLK_dly, RDEN_dly);
  $setuphold (posedge RDCLK, negedge REGCE, 0:0:0, 0:0:0,,rdclk_en_p, rdclk_en_p, RDCLK_dly, REGCE_dly);
  $setuphold (posedge RDCLK, negedge RST, 0:0:0, 0:0:0,,rdclk_en_p, rdclk_en_p, RDCLK_dly, RST_dly);
  $setuphold (posedge RDCLK, negedge RSTREG, 0:0:0, 0:0:0,,rdclk_en_p, rdclk_en_p, RDCLK_dly, RSTREG_dly);
  $setuphold (posedge RDCLK, posedge REGCE, 0:0:0, 0:0:0,,rdclk_en_p, rdclk_en_p, RDCLK_dly, REGCE_dly);
  $setuphold (posedge RDCLK, posedge RST, 0:0:0, 0:0:0,,rdclk_en_p, rdclk_en_p, RDCLK_dly, RST_dly);
  $setuphold (posedge RDCLK, posedge RSTREG, 0:0:0, 0:0:0,,rdclk_en_p, rdclk_en_p, RDCLK_dly, RSTREG_dly);
         $setuphold (negedge RDCLK, negedge RDEN, 0:0:0, 0:0:0,,rst_rdclk_n, rst_rdclk_n, RDCLK_dly, RDEN_dly);
  $setuphold (negedge RDCLK, posedge RDEN, 0:0:0, 0:0:0,,rst_rdclk_n, rst_rdclk_n, RDCLK_dly, RDEN_dly);
  $setuphold (negedge RDCLK, negedge REGCE, 0:0:0, 0:0:0,,rdclk_en_n, rdclk_en_n, RDCLK_dly, REGCE_dly);
  $setuphold (negedge RDCLK, negedge RST, 0:0:0, 0:0:0,,rdclk_en_n, rdclk_en_n, RDCLK_dly, RST_dly);
  $setuphold (negedge RDCLK, negedge RSTREG, 0:0:0, 0:0:0,,rdclk_en_n, rdclk_en_n, RDCLK_dly, RSTREG_dly);
  $setuphold (negedge RDCLK, posedge REGCE, 0:0:0, 0:0:0,,rdclk_en_n, rdclk_en_n, RDCLK_dly, REGCE_dly);
  $setuphold (negedge RDCLK, posedge RST, 0:0:0, 0:0:0,,rdclk_en_n, rdclk_en_n, RDCLK_dly, RST_dly);
  $setuphold (negedge RDCLK, posedge RSTREG, 0:0:0, 0:0:0,,rdclk_en_n, rdclk_en_n, RDCLK_dly, RSTREG_dly);
  $setuphold (posedge WRCLK, posedge RST, 0:0:0, 0:0:0,, wrclk_en_p, wrclk_en_p, WRCLK_dly, RST_dly);
  $setuphold (posedge WRCLK, negedge RST, 0:0:0, 0:0:0,, wrclk_en_p, wrclk_en_p, WRCLK_dly, RST_dly);
  $setuphold (posedge WRCLK, negedge DIP, 0:0:0, 0:0:0,, wren_enable_p, wren_enable_p, WRCLK_dly, DIP_dly);
  $setuphold (posedge WRCLK, negedge DI, 0:0:0, 0:0:0,, wren_enable_p, wren_enable_p, WRCLK_dly, DI_dly);
  $setuphold (posedge WRCLK, posedge DIP, 0:0:0, 0:0:0,, wren_enable_p, wren_enable_p, WRCLK_dly, DIP_dly);
  $setuphold (posedge WRCLK, posedge DI, 0:0:0, 0:0:0,, wren_enable_p, wren_enable_p, WRCLK_dly, DI_dly);
  $setuphold (posedge WRCLK, negedge WREN, 0:0:0, 0:0:0,, rst_wrclk_p, rst_wrclk_p, WRCLK_dly, WREN_dly);
  $setuphold (posedge WRCLK, posedge WREN, 0:0:0, 0:0:0,, rst_wrclk_p, rst_wrclk_p, WRCLK_dly, WREN_dly);
        $setuphold (negedge WRCLK, posedge RST, 0:0:0, 0:0:0,, wrclk_en_n, wrclk_en_n, WRCLK_dly, RST_dly);
  $setuphold (negedge WRCLK, negedge RST, 0:0:0, 0:0:0,, wrclk_en_n, wrclk_en_n, WRCLK_dly, RST_dly);
  $setuphold (negedge WRCLK, negedge DIP, 0:0:0, 0:0:0,, wren_enable_n, wren_enable_n, WRCLK_dly, DIP_dly);
  $setuphold (negedge WRCLK, negedge DI, 0:0:0, 0:0:0,, wren_enable_n, wren_enable_n, WRCLK_dly, DI_dly);
  $setuphold (negedge WRCLK, posedge DIP, 0:0:0, 0:0:0,, wren_enable_n, wren_enable_n, WRCLK_dly, DIP_dly);
  $setuphold (negedge WRCLK, posedge DI, 0:0:0, 0:0:0,, wren_enable_n, wren_enable_n, WRCLK_dly, DI_dly);
  $setuphold (negedge WRCLK, negedge WREN, 0:0:0, 0:0:0,, rst_wrclk_n, rst_wrclk_n, WRCLK_dly, WREN_dly);
  $setuphold (negedge WRCLK, posedge WREN, 0:0:0, 0:0:0,, rst_wrclk_n, rst_wrclk_n, WRCLK_dly, WREN_dly);
  $recrem (negedge RST, posedge RDCLK, 0:0:0, 0:0:0, notifier_rdclk, rdclk_en_p, rdclk_en_p, RST_dly, RDCLK_dly);
  $recrem (negedge RST, posedge WRCLK, 0:0:0, 0:0:0, notifier_wrclk, wrclk_en_p, wrclk_en_p, RST_dly, WRCLK_dly);
         $recrem (negedge RST, negedge RDCLK, 0:0:0, 0:0:0, notifier_rdclk, rdclk_en_n, rdclk_en_n, RST_dly, RDCLK_dly);
  $recrem (negedge RST, negedge WRCLK, 0:0:0, 0:0:0, notifier_wrclk, wrclk_en_n, wrclk_en_n, RST_dly, WRCLK_dly);
  $period (posedge RDCLK, 0:0:0, notifier);
  $period (posedge WRCLK, 0:0:0, notifier);
         $period (negedge RDCLK, 0:0:0, notifier);
  $period (negedge WRCLK, 0:0:0, notifier);
  $width (posedge RDCLK, 0:0:0, 0, notifier);
  $width (negedge RDCLK, 0:0:0, 0, notifier);
  $width (posedge WRCLK, 0:0:0, 0, notifier);
  $width (negedge WRCLK, 0:0:0, 0, notifier);
  $width (posedge RST, 0:0:0, 0, notifier);
         $width (negedge RST, 0:0:0, 0, notifier);
`endif //  `ifdef XIL_TIMING
  specparam PATHPULSE$ = 0;
    endspecify
endmodule