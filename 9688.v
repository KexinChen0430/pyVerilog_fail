module ISERDESE2 (
  input  BITSLIP,
  input  CE1,
  input  CE2,
  input  CLK,
  input  CLKB,
  input  CLKDIV,
  input  RST,
  input  D,
  input  DDLY,
  output Q1,
  output Q2,
  output Q3,
  output Q4,
  output Q5,
  output Q6,
  output Q7,
  output Q8
  );
  parameter DATA_RATE = "DDR";
  parameter DATA_WIDTH = 4;
  parameter NUM_CE = 2;
  parameter DYN_CLKDIV_INV_EN = "FALSE";
  parameter DYN_CLK_INV_EN = "FALSE";
  parameter INTERFACE_TYPE = "MEMORY";
  parameter IOBDELAY = "NONE";
  parameter SERDES_MODE = "MASTER";
  parameter [0:0] INIT_Q1 = 1'b0;
  parameter [0:0] INIT_Q2 = 1'b0;
  parameter [0:0] INIT_Q3 = 1'b0;
  parameter [0:0] INIT_Q4 = 1'b0;
  parameter [0:0] SRVAL_Q1 = 1'b0;
  parameter [0:0] SRVAL_Q2 = 1'b0;
  parameter [0:0] SRVAL_Q3 = 1'b0;
  parameter [0:0] SRVAL_Q4 = 1'b0;
  parameter [0:0] IS_D_INVERTED = 1'b0;
  parameter [0:0] IS_CLK_INVERTED = 1'b0;
  if (INTERFACE_TYPE == "NETWORKING") begin
    if (DATA_RATE == "DDR" &&
          (DATA_WIDTH != 4 &&
           DATA_WIDTH != 6 &&
           DATA_WIDTH != 8)) begin
      wire _TECHMAP_FAIL_;
    end
    if (DATA_RATE == "SDR" &&
        (DATA_WIDTH < 2 ||
         DATA_WIDTH > 8)) begin
      wire _TECHMAP_FAIL_;
    end
  end
  if (INTERFACE_TYPE == "MEMORY"      ||
      INTERFACE_TYPE == "MEMORY_DDR3" ||
      INTERFACE_TYPE == "MEMORY_QDR") begin
    if (DATA_RATE == "SDR") begin
      wire _TECHMAP_FAIL_;
    end
    if (DATA_RATE == "DDR" &&
        (DATA_WIDTH != 4 &&
         DATA_WIDTH != 6 &&
         DATA_WIDTH != 8)) begin
      wire _TECHMAP_FAIL_;
    end
  end
  if (NUM_CE != 1 && NUM_CE != 2) begin
    wire _TECHMAP_FAIL_ = 1'b1;
  end
  parameter _TECHMAP_CONSTMSK_D_ = 1'b1;
  parameter _TECHMAP_CONSTVAL_D_ = 1'bx;
  parameter _TECHMAP_CONSTMSK_DDLY_ = 1'b1;
  parameter _TECHMAP_CONSTVAL_DDLY_ = 1'bx;
  localparam [0:0] MEMORY_DDR3_4     = (INTERFACE_TYPE == "MEMORY_DDR3" && DATA_RATE == "DDR" && DATA_WIDTH == 4);
  localparam [0:0] MEMORY_DDR_4      = (INTERFACE_TYPE == "MEMORY"      && DATA_RATE == "DDR" && DATA_WIDTH == 4);
  localparam [0:0] MEMORY_QDR_4      = (INTERFACE_TYPE == "MEMORY_QDR"  && DATA_RATE == "DDR" && DATA_WIDTH == 4);
  localparam [0:0] NETWORKING_SDR_2  = (INTERFACE_TYPE == "NETWORKING"  && DATA_RATE == "SDR" && DATA_WIDTH == 2);
  localparam [0:0] NETWORKING_SDR_3  = (INTERFACE_TYPE == "NETWORKING"  && DATA_RATE == "SDR" && DATA_WIDTH == 3);
  localparam [0:0] NETWORKING_SDR_4  = (INTERFACE_TYPE == "NETWORKING"  && DATA_RATE == "SDR" && DATA_WIDTH == 4);
  localparam [0:0] NETWORKING_SDR_5  = (INTERFACE_TYPE == "NETWORKING"  && DATA_RATE == "SDR" && DATA_WIDTH == 5);
  localparam [0:0] NETWORKING_SDR_6  = (INTERFACE_TYPE == "NETWORKING"  && DATA_RATE == "SDR" && DATA_WIDTH == 6);
  localparam [0:0] NETWORKING_SDR_7  = (INTERFACE_TYPE == "NETWORKING"  && DATA_RATE == "SDR" && DATA_WIDTH == 7);
  localparam [0:0] NETWORKING_SDR_8  = (INTERFACE_TYPE == "NETWORKING"  && DATA_RATE == "SDR" && DATA_WIDTH == 8);
  localparam [0:0] NETWORKING_DDR_4  = (INTERFACE_TYPE == "NETWORKING"  && DATA_RATE == "DDR" && DATA_WIDTH == 4);
  localparam [0:0] NETWORKING_DDR_6  = (INTERFACE_TYPE == "NETWORKING"  && DATA_RATE == "DDR" && DATA_WIDTH == 6);
  localparam [0:0] NETWORKING_DDR_8  = (INTERFACE_TYPE == "NETWORKING"  && DATA_RATE == "DDR" && DATA_WIDTH == 8);
  localparam [0:0] NETWORKING_DDR_10 = (INTERFACE_TYPE == "NETWORKING"  && DATA_RATE == "DDR" && DATA_WIDTH == 10);
  localparam [0:0] NETWORKING_DDR_14 = (INTERFACE_TYPE == "NETWORKING"  && DATA_RATE == "DDR" && DATA_WIDTH == 14);
  localparam [0:0] OVERSAMPLE_DDR_4  = (INTERFACE_TYPE == "OVERSAMPLE"  && DATA_RATE == "DDR" && DATA_WIDTH == 4);
  if (_TECHMAP_CONSTMSK_D_ == 1'b1) begin
      ISERDESE2_IDELAY_VPR #(
          .MEMORY_DDR3_4                (MEMORY_DDR3_4),
          .MEMORY_DDR_4                 (MEMORY_DDR_4),
          .MEMORY_QDR_4                 (MEMORY_QDR_4),
          .NETWORKING_SDR_2             (NETWORKING_SDR_2),
          .NETWORKING_SDR_3             (NETWORKING_SDR_3),
          .NETWORKING_SDR_4             (NETWORKING_SDR_4),
          .NETWORKING_SDR_5             (NETWORKING_SDR_5),
          .NETWORKING_SDR_6             (NETWORKING_SDR_6),
          .NETWORKING_SDR_7             (NETWORKING_SDR_7),
          .NETWORKING_SDR_8             (NETWORKING_SDR_8),
          .NETWORKING_DDR_4             (NETWORKING_DDR_4),
          .NETWORKING_DDR_6             (NETWORKING_DDR_6),
          .NETWORKING_DDR_8             (NETWORKING_DDR_8),
          .NETWORKING_DDR_10            (NETWORKING_DDR_10),
          .NETWORKING_DDR_14            (NETWORKING_DDR_14),
          .OVERSAMPLE_DDR_4             (OVERSAMPLE_DDR_4),
          .NUM_CE_N1                    (NUM_CE == 1),
          .NUM_CE_N2                    (NUM_CE == 2),
          .IOBDELAY_IFD                 (IOBDELAY == "IFD" || IOBDELAY == "BOTH"),
          .IOBDELAY_IBUF                (IOBDELAY == "IBUF" || IOBDELAY == "BOTH"),
          // Inverters
          .ZINIT_Q1                     (!INIT_Q1),
          .ZINIT_Q2                     (!INIT_Q2),
          .ZINIT_Q3                     (!INIT_Q3),
          .ZINIT_Q4                     (!INIT_Q4),
          .ZSRVAL_Q1                    (!SRVAL_Q1),
          .ZSRVAL_Q2                    (!SRVAL_Q2),
          .ZSRVAL_Q3                    (!SRVAL_Q3),
          .ZSRVAL_Q4                    (!SRVAL_Q4),
          .ZINV_C                       (!IS_CLK_INVERTED)
      ) _TECHMAP_REPLACE_ (
       .BITSLIP     (BITSLIP),
       .CE1         (CE1),
       .CE2         (CE2),
       .CLK         (CLK),
       .CLKB        (CLKB),
       .CLKDIV      (CLKDIV),
       .RST         (RST),
       .DDLY        (DDLY),
       .Q1          (Q1),
       .Q2          (Q2),
       .Q3          (Q3),
       .Q4          (Q4),
       .Q5          (Q5),
       .Q6          (Q6),
       .Q7          (Q7),
       .Q8          (Q8)
      );
    end else if (_TECHMAP_CONSTMSK_DDLY_ == 1'b1) begin
      ISERDESE2_NO_IDELAY_VPR #(
          .MEMORY_DDR3_4                (MEMORY_DDR3_4),
          .MEMORY_DDR_4                 (MEMORY_DDR_4),
          .MEMORY_QDR_4                 (MEMORY_QDR_4),
          .NETWORKING_SDR_2             (NETWORKING_SDR_2),
          .NETWORKING_SDR_3             (NETWORKING_SDR_3),
          .NETWORKING_SDR_4             (NETWORKING_SDR_4),
          .NETWORKING_SDR_5             (NETWORKING_SDR_5),
          .NETWORKING_SDR_6             (NETWORKING_SDR_6),
          .NETWORKING_SDR_7             (NETWORKING_SDR_7),
          .NETWORKING_SDR_8             (NETWORKING_SDR_8),
          .NETWORKING_DDR_4             (NETWORKING_DDR_4),
          .NETWORKING_DDR_6             (NETWORKING_DDR_6),
          .NETWORKING_DDR_8             (NETWORKING_DDR_8),
          .NETWORKING_DDR_10            (NETWORKING_DDR_10),
          .NETWORKING_DDR_14            (NETWORKING_DDR_14),
          .OVERSAMPLE_DDR_4             (OVERSAMPLE_DDR_4),
          .NUM_CE_N1                    (NUM_CE == 1),
          .NUM_CE_N2                    (NUM_CE == 2),
          .IOBDELAY_IFD                 (IOBDELAY == "IFD" || IOBDELAY == "BOTH"),
          .IOBDELAY_IBUF                (IOBDELAY == "IBUF" || IOBDELAY == "BOTH"),
          // Inverters
          .ZINIT_Q1                     (!INIT_Q1),
          .ZINIT_Q2                     (!INIT_Q2),
          .ZINIT_Q3                     (!INIT_Q3),
          .ZINIT_Q4                     (!INIT_Q4),
          .ZSRVAL_Q1                    (!SRVAL_Q1),
          .ZSRVAL_Q2                    (!SRVAL_Q2),
          .ZSRVAL_Q3                    (!SRVAL_Q3),
          .ZSRVAL_Q4                    (!SRVAL_Q4),
          .ZINV_D                       (!IS_D_INVERTED),
          .ZINV_C                       (!IS_CLK_INVERTED)
      ) _TECHMAP_REPLACE_ (
       .BITSLIP     (BITSLIP),
       .CE1         (CE1),
       .CE2         (CE2),
       .CLK         (CLK),
       .CLKB        (CLKB),
       .CLKDIV      (CLKDIV),
       .RST         (RST),
       .D           (D),
       .Q1          (Q1),
       .Q2          (Q2),
       .Q3          (Q3),
       .Q4          (Q4),
       .Q5          (Q5),
       .Q6          (Q6),
       .Q7          (Q7),
       .Q8          (Q8)
      );
    end else begin
        wire _TECHMAP_FAIL_;
    end
endmodule