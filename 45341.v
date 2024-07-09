module outputs
  reg [31 : 0] read;
  wire RDY_read, RDY_write;
  // register rag
  reg [3 : 0] rag;
  wire [3 : 0] rag$D_IN;
  wire rag$EN;
  // register regs
  reg [31 : 0] regs;
  wire [31 : 0] regs$D_IN;
  wire regs$EN;
  // register regs_1
  reg [31 : 0] regs_1;
  wire [31 : 0] regs_1$D_IN;
  wire regs_1$EN;
  // register regs_2
  reg [31 : 0] regs_2;
  wire [31 : 0] regs_2$D_IN;
  wire regs_2$EN;
  // register regs_3
  reg [31 : 0] regs_3;
  wire [31 : 0] regs_3$D_IN;
  wire regs_3$EN;
  // register wag
  reg [3 : 0] wag;
  wire [3 : 0] wag$D_IN;
  wire wag$EN;
  // action method write
  assign RDY_write = 1'd1 ;
  // actionvalue method read
  always@(rag or regs_3 or regs or regs_1 or regs_2)
  begin
    case (rag)
      4'd0: read = regs;
      4'd1: read = regs_1;
      4'd2: read = regs_2;
      default: read = regs_3;
    endcase
  end
  assign RDY_read = 1'd1 ;
  // register rag
  assign rag$D_IN = rag + 4'd1 ;
  assign rag$EN = EN_read ;
  // register regs
  assign regs$D_IN = write_arg ;
  assign regs$EN = EN_write && wag == 4'd0 ;
  // register regs_1
  assign regs_1$D_IN = write_arg ;
  assign regs_1$EN = EN_write && wag == 4'd1 ;
  // register regs_2
  assign regs_2$D_IN = write_arg ;
  assign regs_2$EN = EN_write && wag == 4'd2 ;
  // register regs_3
  assign regs_3$D_IN = write_arg ;
  assign regs_3$EN = EN_write && wag == 4'd3 ;
  // register wag
  assign wag$D_IN = wag ;
  assign wag$EN = EN_write ;
  // handling of inlined registers
  always@(posedge CLK)
  begin
    if (!RST_N)
      begin
        rag <= `BSV_ASSIGNMENT_DELAY 4'd0;
	wag <= `BSV_ASSIGNMENT_DELAY 4'd0;
      end
    else
      begin
        if (rag$EN) rag <= `BSV_ASSIGNMENT_DELAY rag$D_IN;
	if (wag$EN) wag <= `BSV_ASSIGNMENT_DELAY wag$D_IN;
      end
    if (regs$EN) regs <= `BSV_ASSIGNMENT_DELAY regs$D_IN;
    if (regs_1$EN) regs_1 <= `BSV_ASSIGNMENT_DELAY regs_1$D_IN;
    if (regs_2$EN) regs_2 <= `BSV_ASSIGNMENT_DELAY regs_2$D_IN;
    if (regs_3$EN) regs_3 <= `BSV_ASSIGNMENT_DELAY regs_3$D_IN;
  end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    rag = 4'hA;
    regs = 32'hAAAAAAAA;
    regs_1 = 32'hAAAAAAAA;
    regs_2 = 32'hAAAAAAAA;
    regs_3 = 32'hAAAAAAAA;
    wag = 4'hA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule