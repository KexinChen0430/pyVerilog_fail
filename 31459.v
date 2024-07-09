module outputs
  wire [31 : 0] debug;
  wire [7 : 0] led;
  wire CLK_GATE_p200clk, RDY_debug, RDY_led, RDY_usr_sw, p200clk, p200rst;
  // register freeCnt
  reg [31 : 0] freeCnt;
  wire [31 : 0] freeCnt$D_IN;
  wire freeCnt$EN;
  // register swReg
  reg [7 : 0] swReg;
  wire [7 : 0] swReg$D_IN;
  wire swReg$EN;
  // oscillator and gates for output clock p200clk
  assign p200clk = sys0_clk ;
  assign CLK_GATE_p200clk = 1'd1 ;
  // output resets
  assign p200rst = sys0_rstn ;
  // action method usr_sw
  assign RDY_usr_sw = 1'd1 ;
  // value method led
  assign led = swReg ;
  assign RDY_led = 1'd1 ;
  // value method debug
  assign debug = freeCnt ;
  assign RDY_debug = 1'd1 ;
  // register freeCnt
  assign freeCnt$D_IN = freeCnt + 32'd1 ;
  assign freeCnt$EN = 1'd1 ;
  // register swReg
  assign swReg$D_IN = usr_sw_i ;
  assign swReg$EN = EN_usr_sw ;
  // handling of inlined registers
  always@(posedge sys0_clk)
  begin
    if (!sys0_rstn)
      begin
        freeCnt <= `BSV_ASSIGNMENT_DELAY 32'd0;
	swReg <= `BSV_ASSIGNMENT_DELAY 8'd0;
      end
    else
      begin
        if (freeCnt$EN) freeCnt <= `BSV_ASSIGNMENT_DELAY freeCnt$D_IN;
	if (swReg$EN) swReg <= `BSV_ASSIGNMENT_DELAY swReg$D_IN;
      end
  end
  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    freeCnt = 32'hAAAAAAAA;
    swReg = 8'hAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule