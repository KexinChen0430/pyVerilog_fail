module BUFR (O, CE, CLR, I);
    output O;
    input CE;
    input CLR;
    input I;
    parameter BUFR_DIVIDE = "BYPASS";
    parameter SIM_DEVICE = "7SERIES";
`ifdef XIL_TIMING
    parameter LOC = "UNPLACED";
`endif
    integer count, period_toggle, half_period_toggle;
    reg first_rise, half_period_done;
    reg notifier;
    reg  o_out_divide = 0;
    wire o_out;
    reg ce_enable1, ce_enable2, ce_enable3, ce_enable4;
    tri0 GSR = glbl.GSR;
    wire i_in, ce_in, clr_in, gsr_in, ce_en, i_ce;
    buf buf_i (i_in, I);
    buf buf_ce (ce_in, CE);
    buf buf_clr (clr_in, CLR);
    buf buf_gsr (gsr_in, GSR);
    buf buf_o (O, o_out);
    initial begin
  case (BUFR_DIVIDE)
      "BYPASS" : period_toggle = 0;
      "1" : begin
        period_toggle = 1;
        half_period_toggle = 1;
            end
      "2" : begin
        period_toggle = 2;
        half_period_toggle = 2;
            end
      "3" : begin
        period_toggle = 4;
        half_period_toggle = 2;
            end
      "4" : begin
        period_toggle = 4;
        half_period_toggle = 4;
      end
      "5" : begin
        period_toggle = 6;
        half_period_toggle = 4;
      end
      "6" : begin
        period_toggle = 6;
        half_period_toggle = 6;
      end
      "7" : begin
        period_toggle = 8;
        half_period_toggle = 6;
      end
      "8" : begin
        period_toggle = 8;
        half_period_toggle = 8;
            end
      default : begin
              $display("Attribute Syntax Error : The attribute BUFR_DIVIDE on BUFR instance %m is set to %s.  Legal values for this attribute are BYPASS, 1, 2, 3, 4, 5, 6, 7 or 8.", BUFR_DIVIDE);
                    #1 $finish;
      end
  endcase // case(BUFR_DIVIDE)
        case (SIM_DEVICE)
           "VIRTEX4" : ;
           "VIRTEX5" : ;
           "VIRTEX6" : ;
           "7SERIES" : ;
      default : begin
              $display("Attribute Syntax Error : The attribute SIM_DEVICE on BUFR instance %m is set to %s.  Legal values for this attribute are VIRTEX4 or VIRTEX5 or VIRTEX6 or 7SERIES.", SIM_DEVICE);
                    #1 $finish;
      end
        endcase
    end // initial begin
    always @(gsr_in or clr_in)
  if (gsr_in == 1'b1 || clr_in == 1'b1) begin
      assign o_out_divide = 1'b0;
      assign count = 0;
      assign first_rise = 1'b1;
      assign half_period_done = 1'b0;
      if (gsr_in == 1'b1) begin
    assign ce_enable1 = 1'b0;
    assign ce_enable2 = 1'b0;
    assign ce_enable3 = 1'b0;
    assign ce_enable4 = 1'b0;
      end
  end
  else if (gsr_in == 1'b0 || clr_in == 1'b0) begin
      deassign o_out_divide;
      deassign count;
      deassign first_rise;
      deassign half_period_done;
      if (gsr_in == 1'b0) begin
    deassign ce_enable1;
    deassign ce_enable2;
    deassign ce_enable3;
    deassign ce_enable4;
      end
  end
    always @(negedge i_in)
    begin
  ce_enable1 <= ce_in;
  ce_enable2 <= ce_enable1;
  ce_enable3 <= ce_enable2;
  ce_enable4 <= ce_enable3;
    end
    assign ce_en = ((SIM_DEVICE == "VIRTEX5") || (SIM_DEVICE == "VIRTEX6") || (SIM_DEVICE == "7SERIES")) ? ce_in :  ce_enable4;
    assign i_ce = i_in & ce_en;
  generate
    case (SIM_DEVICE)
      "VIRTEX4" : begin
      always @(i_in or ce_en)
        if (ce_en == 1'b1) begin
      if (i_in == 1'b1 && first_rise == 1'b1) begin
    o_out_divide = 1'b1;
    first_rise = 1'b0;
      end
      else if (count == half_period_toggle && half_period_done == 1'b0) begin
    o_out_divide = ~o_out_divide;
    half_period_done = 1'b1;
          count = 0;
      end
      else if (count == period_toggle && half_period_done == 1'b1) begin
    o_out_divide = ~o_out_divide;
    half_period_done = 1'b0;
          count = 0;
      end
            if (first_rise == 1'b0)
    count = count + 1;
  end // if (ce_in == 1'b1)
        else begin
           count = 0;
           first_rise = 1;
        end
      end
      "VIRTEX5","VIRTEX6","7SERIES" : begin
       always @(i_ce)
       begin
           if (i_ce == 1'b1 && first_rise == 1'b1) begin
       o_out_divide = 1'b1;
       first_rise = 1'b0;
     end
     else if (count == half_period_toggle && half_period_done == 1'b0) begin
              o_out_divide = ~o_out_divide;
        half_period_done = 1'b1;
       count = 0;
     end
     else if (count == period_toggle && half_period_done == 1'b1) begin
       o_out_divide = ~o_out_divide;
       half_period_done = 1'b0;
       count = 0;
           end
          if (first_rise == 1'b0) begin
      count = count + 1;
    end // if (ce_in == 1'b1)
        end
       end
    endcase
  endgenerate
    assign o_out = (period_toggle == 0) ? i_in : o_out_divide;
    always @(notifier) begin
  o_out_divide <= 1'bx;
    end
`ifdef XIL_TIMING
  specify
    (CLR => O) = (0:0:0, 0:0:0);
    (I => O) = (0:0:0, 0:0:0);
    $period (negedge I, 0:0:0, notifier);
    $period (posedge I, 0:0:0, notifier);
    $setuphold (posedge I, posedge CE, 0:0:0, 0:0:0, notifier);
    $setuphold (posedge I, negedge CE, 0:0:0, 0:0:0, notifier);
    $setuphold (negedge I, posedge CE, 0:0:0, 0:0:0, notifier);
    $setuphold (negedge I, negedge CE, 0:0:0, 0:0:0, notifier);
    $width (posedge CLR, 0:0:0, 0, notifier);
    $width (posedge I, 0:0:0, 0, notifier);
    $width (negedge I, 0:0:0, 0, notifier);
    specparam PATHPULSE$ = 0;
  endspecify
`endif
endmodule