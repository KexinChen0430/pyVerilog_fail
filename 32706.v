module BSCANE2 (
  CAPTURE,
  DRCK,
  RESET,
  RUNTEST,
  SEL,
  SHIFT,
  TCK,
  TDI,
  TMS,
  UPDATE,
  TDO
);
  parameter DISABLE_JTAG = "FALSE";
  parameter integer JTAG_CHAIN = 1;
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED";
`endif
  output CAPTURE;
  output DRCK;
  output RESET;
  output RUNTEST;
  output SEL;
  output SHIFT;
  output TCK;
  output TDI;
  output TMS;
  output UPDATE;
  input TDO;
  reg SEL_reg;
  reg SEL_zd;
  pulldown (DRCK);
  pulldown (RESET);
  pulldown (SEL);
  pulldown (SHIFT);
  pulldown (TDI);
  pulldown (UPDATE);
    initial begin
        if ((JTAG_CHAIN != 1) && (JTAG_CHAIN != 2) && (JTAG_CHAIN != 3) && (JTAG_CHAIN != 4)) begin
            $display("Attribute Syntax Error : The attribute JTAG_CHAIN on BSCANE2 instance %m is set to %d.  Legal values for this attribute are 1, 2, 3 or 4.", JTAG_CHAIN);
            #1 $finish;
        end
    end
   always@(glbl.JTAG_SEL1_GLBL or glbl.JTAG_SEL2_GLBL or glbl.JTAG_SEL3_GLBL or glbl.JTAG_SEL4_GLBL) begin
      if (JTAG_CHAIN == 1)      SEL_zd = glbl.JTAG_SEL1_GLBL;
      else if (JTAG_CHAIN == 2) SEL_zd = glbl.JTAG_SEL2_GLBL;
      else if (JTAG_CHAIN == 3) SEL_zd = glbl.JTAG_SEL3_GLBL;
      else if (JTAG_CHAIN == 4) SEL_zd = glbl.JTAG_SEL4_GLBL;
   end
   always@(TDO) begin
      if (JTAG_CHAIN == 1)      glbl.JTAG_USER_TDO1_GLBL = TDO;
      else if (JTAG_CHAIN == 2) glbl.JTAG_USER_TDO2_GLBL = TDO;
      else if (JTAG_CHAIN == 3) glbl.JTAG_USER_TDO3_GLBL = TDO;
      else if (JTAG_CHAIN == 4) glbl.JTAG_USER_TDO4_GLBL = TDO;
   end
   always @(negedge glbl.JTAG_TCK_GLBL or posedge SEL_zd) begin
      SEL_reg     = SEL_zd;
   end
   assign SEL     = SEL_reg;
   assign CAPTURE = glbl.JTAG_CAPTURE_GLBL;
   assign #5 DRCK    = ((SEL_zd & !glbl.JTAG_SHIFT_GLBL & !glbl.JTAG_CAPTURE_GLBL)
                                           ||
                     (SEL_zd & glbl.JTAG_SHIFT_GLBL   & glbl.JTAG_TCK_GLBL)
                                           ||
                     (SEL_zd & glbl.JTAG_CAPTURE_GLBL &  glbl.JTAG_TCK_GLBL));
   assign RESET   = glbl.JTAG_RESET_GLBL;
   assign RUNTEST = glbl.JTAG_RUNTEST_GLBL;
   assign SHIFT   = glbl.JTAG_SHIFT_GLBL;
   assign TDI     = glbl.JTAG_TDI_GLBL;
   assign TCK     = glbl.JTAG_TCK_GLBL;
   assign TMS     = glbl.JTAG_TMS_GLBL;
   assign UPDATE  = glbl.JTAG_UPDATE_GLBL;
   specify
     specparam PATHPULSE$ = 0;
   endspecify
endmodule