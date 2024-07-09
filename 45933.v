module CAPTUREE2 (
  CAP,
  CLK
);
  parameter ONESHOT = "TRUE";
  `ifdef XIL_TIMING
    parameter LOC = "UNPLACED";
  `endif
  input CAP;
  input CLK;
  reg [0:0] ONESHOT_BINARY;
  reg notifier;
  wire CAP_IN;
  wire CLK_IN;
  wire CAP_INDELAY;
  wire CLK_INDELAY;
  initial begin
    case (ONESHOT)
      "TRUE" : ONESHOT_BINARY = 1'b1;
      "FALSE" : ONESHOT_BINARY = 1'b0;
      default : begin
        $display("Attribute Syntax Error : The Attribute ONESHOT on CAPTUREE2 instance %m is set to %s.  Legal values for this attribute are TRUE, or FALSE.", ONESHOT);
        #1 $finish;
      end
    endcase
  end
  buf B_CAP (CAP_IN, CAP);
  buf B_CLK (CLK_IN, CLK);
  specify
  `ifdef XIL_TIMING
    $period (posedge CLK, 0:0:0, notifier);
    $setuphold (posedge CLK, negedge CAP, 0:0:0, 0:0:0, notifier,,, delay_CLK, delay_CAP);
    $setuphold (posedge CLK, posedge CAP, 0:0:0, 0:0:0, notifier,,, delay_CLK, delay_CAP);
  `endif //  `ifdef XIL_TIMING
    specparam PATHPULSE$ = 0;
  endspecify
endmodule