module OSERDESE1 (OCBEXTEND, OFB, OQ, SHIFTOUT1, SHIFTOUT2, TFB, TQ,
                    CLK, CLKDIV, CLKPERF, CLKPERFDELAY, D1, D2, D3, D4, D5, D6, OCE, ODV, RST, SHIFTIN1, SHIFTIN2, T1, T2, T3, T4, TCE, WC);
    parameter DATA_RATE_OQ = "DDR";
    parameter DATA_RATE_TQ = "DDR";
    parameter integer DATA_WIDTH = 4;
    parameter integer DDR3_DATA = 1;
    parameter [0:0] INIT_OQ = 1'b0;
    parameter [0:0] INIT_TQ = 1'b0;
    parameter INTERFACE_TYPE = "DEFAULT";
    parameter integer ODELAY_USED = 0;
    parameter SERDES_MODE = "MASTER";
    parameter [0:0] SRVAL_OQ = 1'b0;
    parameter [0:0] SRVAL_TQ = 1'b0;
    parameter integer TRISTATE_WIDTH = 4;
  `ifdef XIL_TIMING
     parameter LOC = "UNPLACED";
  `endif
//   Outputs:
//      OQ: Data output
//      TQ: Output of tristate mux
//      SHIFTOUT1: Carry out data 1 for slave
//      SHIFTOUT2: Carry out data 2 for slave
//      OFB: O Feedback output
//   Inputs:
//   Inputs:
//      CLK:  High speed clock from DCM
//      CLKB: Inverted High speed clock from DCM
//      CLKDIV: Low speed divided clock from DCM
//      CLKPERF: Performance Path clock
//      CLKPERFDELAY: delayed Performance Path clock
//      D1, D2, D3, D4, D5, D6 : Data inputs
//      OCE: Clock enable for output data flops
//      ODV: ODELAY value > 140 degrees
//      RST: Reset control
//      T1, T2, T3, T4: tristate inputs
//      SHIFTIN1: Carry in data 1 for master from slave
//      SHIFTIN2: Carry in data 2 for master from slave
//      TCE: Tristate clock enable
//      WC: Write command given by memory controller
    output OCBEXTEND;
    output OFB;
    output OQ;
    output SHIFTOUT1;
    output SHIFTOUT2;
    output TFB;
    output TQ;
    input CLK;
    input CLKDIV;
    input CLKPERF;
    input CLKPERFDELAY;
    input D1;
    input D2;
    input D3;
    input D4;
    input D5;
    input D6;
    input OCE;
    input ODV;
    input RST;
    input SHIFTIN1;
    input SHIFTIN2;
    input T1;
    input T2;
    input T3;
    input T4;
    input TCE;
    input WC;
    wire SERDES, DDR_CLK_EDGE;
    wire    [5:0]   SRTYPE;
    wire            WC_DELAY;
    wire    [4:0]   SELFHEAL;
    wire            load;
    wire            qmux1, qmux2, tmux1, tmux2;
    wire            data1, data2, triin1, triin2;
    wire            d2rnk2;
    wire            CLKD;
    wire            CLKDIVD;
    wire            iodelay_state;
// attribute
    reg data_rate_int;
    reg [3:0] data_width_int;
    reg [1:0] tristate_width_int;
    reg data_rate_oq_int;
    reg [1:0] data_rate_tq_int;
    reg ddr3_data_int;
    reg interface_type_int;
    reg odelay_used_int;
    reg serdes_mode_int;
// Output signals
    wire ioclkglitch_out, ocbextend_out, ofb_out, oq_out, tq_out, shiftout1_out, shiftout2_out;
    wire tfb_out;
// Other signals
    tri0  GSR = glbl.GSR;
    reg notifier;
    wire CLK_in;
    wire CLKDIV_in;
    wire CLKPERF_in;
    wire CLKPERFDELAY_in;
    wire D1_in;
    wire D2_in;
    wire D3_in;
    wire D4_in;
    wire D5_in;
    wire D6_in;
    wire OCE_in;
    wire ODV_in;
    wire RST_in;
    wire SHIFTIN1_in;
    wire SHIFTIN2_in;
    wire T1_in;
    wire T2_in;
    wire T3_in;
    wire T4_in;
    wire TCE_in;
    wire WC_in;
`ifndef XIL_TIMING
    assign CLK_in = CLK;
    assign CLKDIV_in = CLKDIV;
    assign D1_in = D1;
    assign D2_in = D2;
    assign D3_in = D3;
    assign D4_in = D4;
    assign D5_in = D5;
    assign D6_in = D6;
    assign OCE_in = OCE;
    assign T1_in = T1;
    assign T2_in = T2;
    assign T3_in = T3;
    assign T4_in = T4;
    assign TCE_in = TCE;
    assign WC_in = WC;
`endif //  `ifndef XIL_TIMING
    assign CLKPERF_in = CLKPERF;
//  assign CLKPERFDELAY_in = CLKPERFDELAY;
// IR 495397 & IR 499954
//    assign CLKPERFDELAY_in = (CLKPERFDELAY === 1'bx)? 1'b0 : CLKPERFDELAY;
    generate
       case (ODELAY_USED)
          0: assign CLKPERFDELAY_in = CLKPERF;
          1: assign CLKPERFDELAY_in = (CLKPERFDELAY === 1'bx)? 1'b0 : CLKPERFDELAY;
       endcase
    endgenerate
    assign SHIFTIN1_in = SHIFTIN1;
    assign SHIFTIN2_in = SHIFTIN2;
    assign ODV_in = ODV;
    assign RST_in = RST;
    buf b_ocbextend (OCBEXTEND, ocbextend_out);
    buf b_ofb (OFB, ofb_out);
    buf b_oq  (OQ,  oq_out);
    buf b_shiftout1 (SHIFTOUT1, shiftout1_out);
    buf b_shiftout2 (SHIFTOUT2, shiftout2_out);
    buf b_tfb (TFB, tfb_out);
    buf b_tq  (TQ,  tq_out);
    initial begin
        case (DATA_RATE_OQ)
            "SDR" : data_rate_oq_int <= 1'b1;
            "DDR" : data_rate_oq_int <= 1'b0;
            default : begin
                          $display("Attribute Syntax Error : The attribute DATA_RATE_OQ on OSERDESE1 instance %m is set to %s.  Legal values for this attribute are SDR or DDR", DATA_RATE_OQ);
                          #1 $finish;
                      end
        endcase // case(DATA_RATE_OQ)
       case (DATA_RATE_TQ)
            "BUF" : data_rate_tq_int <= 2'b00;
            "SDR" : data_rate_tq_int <= 2'b01;
            "DDR" : data_rate_tq_int <= 2'b10;
            default : begin
                          $display("Attribute Syntax Error : The attribute DATA_RATE_TQ on OSERDESE1 instance %m is set to %s.  Legal values for this attribute are BUF, SDR or DDR", DATA_RATE_TQ);
                          #1 $finish;
                      end
        endcase // case(DATA_RATE_TQ)
        case (DATA_WIDTH)
            2, 3, 4, 5, 6, 7, 8, 10 : data_width_int = DATA_WIDTH;
            default : begin
                          $display("Attribute Syntax Error : The attribute DATA_WIDTH on OSERDESE1 instance %m is set to %d.  Legal values for this attribute are 2, 3, 4, 5, 6, 7, 8, or 10", DATA_WIDTH);
                          #1 $finish;
                      end
        endcase // case(DATA_WIDTH)
        case (DDR3_DATA)
            0 : ddr3_data_int <= 1'b0;
            1 : ddr3_data_int <= 1'b1;
            default : begin
                          $display("Attribute Syntax Error : The attribute DDR3_DATA on OSERDESE1 instance %m is set to %d.  Legal values for this attribute are 0 or 1", DDR3_DATA);
                          #1 $finish;
                      end
        endcase // case(DDR3_DATA)
        case (INTERFACE_TYPE)
               "DEFAULT" : interface_type_int <= 1'b0;
               "MEMORY_DDR3" : interface_type_int <= 1'b1;
               default : begin
                          $display("Attribute Syntax Error : The attribute INTERFACE_TYPE on OSERDESE1 instance %m is set to %s.  Legal values for this attribute are DEFAULT, or MEMORY_DDR3", INTERFACE_TYPE);
                          #1 $finish;
                         end
        endcase // INTERFACE_TYPE
        case (ODELAY_USED)
//            "FALSE" : odelay_used_int <= 1'b0;
//            "TRUE"  : odelay_used_int <= 1'b1;
            0 : odelay_used_int <= 1'b0;
            1 : odelay_used_int <= 1'b1;
            default : begin
                          $display("Attribute Syntax Error : The attribute ODELAY_USED on OSERDESE1 instance %m is set to %s.  Legal values for this attribute are FALSE or TRUE", ODELAY_USED);
                          #1 $finish;
                      end
        endcase // case(ODELAY_USED)
        case (SERDES_MODE)
            "MASTER" : serdes_mode_int <= 1'b0;
            "SLAVE"  : serdes_mode_int <= 1'b1;
            default  : begin
                          $display("Attribute Syntax Error : The attribute SERDES_MODE on OSERDESE1 instance %m is set to %s.  Legal values for this attribute are MASTER or SLAVE", SERDES_MODE);
                          #1 $finish;
                      end
        endcase // case(SERDES_MODE)
        case (TRISTATE_WIDTH)
            1 : tristate_width_int <= 2'b00;
            2 : tristate_width_int <= 2'b01;
            4 : tristate_width_int <= 2'b10;
            default : begin
                          $display("Attribute Syntax Error : The attribute TRISTATE_WIDTH on OSERDESE1 instance %m is set to %d.  Legal values for this attribute are 1, 2 or 4", TRISTATE_WIDTH);
                          #1 $finish;
                      end
        endcase // case(TRISTATE_WIDTH)
    end  // initial begin
    assign SERDES = 1'b1;
    assign SRTYPE = 6'b111111;
    assign DDR_CLK_EDGE = 1'b1;
    assign WC_DELAY = 1'b0;
    assign SELFHEAL = 5'b00000;
    assign #0 CLKD = CLK;
    assign #0 CLKDIVD = CLKDIV;
    assign #10 ofb_out = (ODELAY_USED == 1)? CLKPERF : oq_out;
    assign #10 tfb_out = iodelay_state;
//  Delay assignments
// Data output delays
defparam        dfront.FFD = 1; // clock to out delay for flip flops
//                                driven by clk
defparam        datao.FFD = 1; // clock to out delay for flip flops
//                                driven by clk
defparam        dfront.FFCD = 1; // clock to out delay for flip flops
//                                driven by clkdiv
defparam        dfront.MXD = 1; // mux delay
defparam        dfront.MXR1 = 1; // mux before 2nd rank of flops
// Programmable load generator
defparam dfront.ldgen.ffdcnt = 1;
defparam dfront.ldgen.mxdcnt = 1;
defparam dfront.ldgen.FFRST = 145; // clock to out delay for flop in PLSG
// Tristate output delays
defparam        tfront.ffd = 1; // clock to out delay for flip flops
defparam        tfront.mxd = 1; // mux delay
defparam        trio.ffd = 1; // clock to out delay for flip flops
defparam        trio.mxd = 1; // mux delay
// Instantiate output data section
rank12d_oserdese1_vlog dfront (.D1(D1_in), .D2(D2_in), .D3(D3_in), .D4(D4_in), .D5(D5_in), .D6(D6_in),
                .d2rnk2(d2rnk2),
                .SHIFTIN1(SHIFTIN1_in), .SHIFTIN2(SHIFTIN2_in),
                .C(CLK_in), .CLKDIV(CLKDIV_in), .SR(RST_in), .OCE(OCE_in),
                .data1(data1), .data2(data2), .SHIFTOUT1(shiftout1_out), .SHIFTOUT2(shiftout2_out),
                .DATA_RATE_OQ(data_rate_oq_int), .DATA_WIDTH(data_width_int),
                .SERDES_MODE(serdes_mode_int), .load(load),
                .IOCLK_GLITCH(ioclkglitch_out),
                .INIT_OQ(INIT_OQ), .SRVAL_OQ(SRVAL_OQ));
trif_oserdese1_vlog tfront (.T1(T1_in), .T2(T2_in), .T3(T3_in), .T4(T4_in), .load(load),
                .C(CLK_in), .CLKDIV(CLKDIV_in), .SR(RST_in), .TCE(TCE_in),
                .DATA_RATE_TQ(data_rate_tq_int), .TRISTATE_WIDTH(tristate_width_int),
                .INIT_TQ(INIT_TQ), .SRVAL_TQ(SRVAL_TQ),
                .data1(triin1), .data2(triin2));
txbuffer_oserdese1_vlog DDR3FIFO (.iodelay_state(iodelay_state), .qmux1(qmux1), .qmux2(qmux2), .tmux1(tmux1), .tmux2(tmux2),
                 .d1(data1), .d2(data2), .t1(triin1), .t2(triin2), .trif(tq_out),
                 .WC(WC_in), .ODV(ODV_in), .extra(ocbextend_out),
                 .clk(CLK_in), .clkdiv(CLKDIV_in), .bufo(CLKPERFDELAY_in), .bufop(CLKPERF_in), .rst(RST_in),
                 .ODELAY_USED(odelay_used_int), .DDR3_DATA(ddr3_data_int),
                 .DDR3_MODE(interface_type_int));
dout_oserdese1_vlog datao (.data1(qmux1), .data2(qmux2),
                .CLK(CLK_in), .BUFO(CLKPERFDELAY_in), .SR(RST_in), .OCE(OCE_in),
                .OQ(oq_out), .d2rnk2(d2rnk2),
                .DATA_RATE_OQ(data_rate_oq_int),
                .INIT_OQ(INIT_OQ), .SRVAL_OQ(SRVAL_OQ),
                .DDR3_MODE(interface_type_int));
tout_oserdese1_vlog trio (.data1(tmux1), .data2(tmux2),
                .CLK(CLK_in), .BUFO(CLKPERFDELAY_in), .SR(RST_in), .TCE(TCE_in),
                .DATA_RATE_TQ(data_rate_tq_int), .TRISTATE_WIDTH(tristate_width_int),
                .INIT_TQ(INIT_TQ), .SRVAL_TQ(SRVAL_TQ),
                .TQ(tq_out), .DDR3_MODE(interface_type_int));
`ifndef XIL_TIMING
    specify
        ( CLK => OFB)         = (100, 100);
        ( CLK => OQ)          = (100, 100);
        ( CLK => TQ)          = (100, 100);
        ( CLKPERF => OQ)      = (100, 100);
        ( CLKPERF => TQ)      = (100, 100);
        ( CLKPERFDELAY => OQ) = (100, 100);
        ( CLKPERFDELAY => TQ) = (100, 100);
        ( T1 => TQ) = (0, 0);
        specparam PATHPULSE$ = 0;
    endspecify
`endif //  `ifndef XIL_TIMING
`ifdef XIL_TIMING
    specify
        ( CLK => OFB) = (100:100:100, 100:100:100);
        ( CLK => OQ) = (100:100:100, 100:100:100);
        ( CLK => TQ) = (100:100:100, 100:100:100);
        ( CLKPERF => OQ) = (100:100:100, 100:100:100);
        ( CLKPERF => TQ) = (100:100:100, 100:100:100);
        ( CLKPERFDELAY => OQ) = (100:100:100, 100:100:100);
        ( CLKPERFDELAY => TQ) = (100:100:100, 100:100:100);
        ( T1 => TQ) = (0:0:0, 0:0:0);
        $setuphold (posedge CLK,    negedge OCE, 0:0:0, 0:0:0, notifier,,, CLK_in, OCE_in);
        $setuphold (posedge CLK,    negedge T1, 0:0:0, 0:0:0, notifier,,,  CLK_in, T1_in);
        $setuphold (posedge CLK,    negedge TCE, 0:0:0, 0:0:0, notifier,,, CLK_in, TCE_in);
        $setuphold (posedge CLK,    posedge OCE, 0:0:0, 0:0:0, notifier,,, CLK_in, OCE_in);
        $setuphold (posedge CLK,    posedge T1, 0:0:0, 0:0:0, notifier,,,  CLK_in, T1_in);
        $setuphold (posedge CLK,    posedge TCE, 0:0:0, 0:0:0, notifier,,, CLK_in, TCE_in);
        $setuphold (posedge CLKDIV, negedge D1, 0:0:0, 0:0:0, notifier,,, CLKDIV_in, D1_in);
        $setuphold (posedge CLKDIV, negedge D2, 0:0:0, 0:0:0, notifier,,, CLKDIV_in, D2_in);
        $setuphold (posedge CLKDIV, negedge D3, 0:0:0, 0:0:0, notifier,,, CLKDIV_in, D3_in);
        $setuphold (posedge CLKDIV, negedge D4, 0:0:0, 0:0:0, notifier,,, CLKDIV_in, D4_in);
        $setuphold (posedge CLKDIV, negedge D5, 0:0:0, 0:0:0, notifier,,, CLKDIV_in, D5_in);
        $setuphold (posedge CLKDIV, negedge D6, 0:0:0, 0:0:0, notifier,,, CLKDIV_in, D6_in);
        $setuphold (posedge CLKDIV, negedge RST, 0:0:0, 0:0:0, notifier,,, CLKDIV_in, RST_in);
        $setuphold (posedge CLKDIV, negedge T1, 0:0:0, 0:0:0, notifier,,, CLKDIV_in, T1_in);
        $setuphold (posedge CLKDIV, negedge T2, 0:0:0, 0:0:0, notifier,,, CLKDIV_in, T2_in);
        $setuphold (posedge CLKDIV, negedge T3, 0:0:0, 0:0:0, notifier,,, CLKDIV_in, T3_in);
        $setuphold (posedge CLKDIV, negedge T4, 0:0:0, 0:0:0, notifier,,, CLKDIV_in, T4_in);
        $setuphold (posedge CLKDIV, negedge WC, 0:0:0, 0:0:0, notifier,,, CLKDIV_in, WC_in);
        $setuphold (posedge CLKDIV, posedge D1, 0:0:0, 0:0:0, notifier,,, CLKDIV_in, D1_in);
        $setuphold (posedge CLKDIV, posedge D2, 0:0:0, 0:0:0, notifier,,, CLKDIV_in, D2_in);
        $setuphold (posedge CLKDIV, posedge D3, 0:0:0, 0:0:0, notifier,,, CLKDIV_in, D3_in);
        $setuphold (posedge CLKDIV, posedge D4, 0:0:0, 0:0:0, notifier,,, CLKDIV_in, D4_in);
        $setuphold (posedge CLKDIV, posedge D5, 0:0:0, 0:0:0, notifier,,, CLKDIV_in, D5_in);
        $setuphold (posedge CLKDIV, posedge D6, 0:0:0, 0:0:0, notifier,,, CLKDIV_in, D6_in);
        $setuphold (posedge CLKDIV, posedge RST, 0:0:0, 0:0:0, notifier,,, CLKDIV_in, RST_in);
        $setuphold (posedge CLKDIV, posedge T1, 0:0:0, 0:0:0, notifier,,, CLKDIV_in, T1_in);
        $setuphold (posedge CLKDIV, posedge T2, 0:0:0, 0:0:0, notifier,,, CLKDIV_in, T2_in);
        $setuphold (posedge CLKDIV, posedge T3, 0:0:0, 0:0:0, notifier,,, CLKDIV_in, T3_in);
        $setuphold (posedge CLKDIV, posedge T4, 0:0:0, 0:0:0, notifier,,, CLKDIV_in, T4_in);
        $setuphold (posedge CLKDIV, posedge WC, 0:0:0, 0:0:0, notifier,,, CLKDIV_in, WC_in);
        specparam PATHPULSE$ = 0;
    endspecify
`endif //  `ifdef XIL_TIMING
endmodule