module IBUFDS_DIFF_OUT (O, OB, I, IB);
    parameter DIFF_TERM = "FALSE";
    parameter DQS_BIAS = "FALSE";
    parameter IBUF_LOW_PWR = "TRUE";
    parameter IOSTANDARD = "DEFAULT";
`ifdef XIL_TIMING
    parameter LOC = " UNPLACED";
`endif
    output O, OB;
    input  I, IB;
    reg  o_out;
    reg DQS_BIAS_BINARY = 1'b0;
    buf B0 (O, o_out);
    not B1 (OB, o_out);
    initial begin
        case (DIFF_TERM)
            "TRUE", "FALSE" : ;
            default : begin
                          $display("Attribute Syntax Error : The attribute DIFF_TERM on IBUFDS_DIFF_OUT instance %m is set to %s.  Legal values for this attribute are TRUE or FALSE.", DIFF_TERM);
                          #1 $finish;
                      end
        endcase // case(DIFF_TERM)
        case (IBUF_LOW_PWR)
            "FALSE", "TRUE" : ;
            default : begin
                          $display("Attribute Syntax Error : The attribute IBUF_LOW_PWR on IBUFDS_DIFF_OUT instance %m is set to %s.  Legal values for this attribute are TRUE or FALSE.", IBUF_LOW_PWR);
                          #1 $finish;
                      end
        endcase
        case (DQS_BIAS)
            "TRUE"  : DQS_BIAS_BINARY <= #1 1'b1;
            "FALSE" : DQS_BIAS_BINARY <= #1 1'b0;
            default : begin
                          $display("Attribute Syntax Error : The attribute DQS_BIAS on IBUFDS_DIFF_OUT instance %m is set to %s.  Legal values for this attribute are TRUE or FALSE.", DQS_BIAS);
                          #1 $finish;
                      end
        endcase
    end
    always @(I or IB or DQS_BIAS_BINARY) begin
	if (I == 1'b1 && IB == 1'b0)
	    o_out <= I;
	else if (I == 1'b0 && IB == 1'b1)
	    o_out <= I;
 	else if ((I === 1'bz || I == 1'b0) && (IB === 1'bz || IB == 1'b1))
          if (DQS_BIAS_BINARY == 1'b1)
            o_out <= 1'b0;
          else
            o_out <= 1'bx;
        else if (I == 1'bx || IB == 1'bx)
            o_out <= 1'bx;
    end
    `ifdef XIL_TIMING
        specify
            (I => O) = (0:0:0, 0:0:0);
            (I => OB) = (0:0:0, 0:0:0);
            (IB => O) = (0:0:0, 0:0:0);
            (IB => OB) = (0:0:0, 0:0:0);
            specparam PATHPULSE$ = 0;
        endspecify
    `endif
endmodule