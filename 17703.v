module MISTRAL_ALM(
    input A, B, C0, C1, E0, E1, F0, F1, CARRYIN, SHAREIN, // LUT path
    input CLK0, CLK1, CLK2, AC0, AC1,                     // FF path
    output COMB0, COMB1, SUM0, SUM1, CARRYOUT, SHAREOUT,
    output FF0, FF1, FF2, FF3
);
parameter LUT0 = 16'b0000;
parameter LUT1 = 16'b0000;
parameter LUT2 = 16'b0000;
parameter LUT3 = 16'b0000;
parameter INIT0 = 1'b0;
parameter INIT1 = 1'b0;
parameter INIT2 = 1'b0;
parameter INIT3 = 1'b0;
parameter C0_MUX = "C0";
parameter C1_MUX = "C1";
parameter F0_MUX = "VCC";
parameter F1_MUX = "GND";
parameter FEEDBACK0 = "FF0";
parameter FEEDBACK1 = "FF2";
parameter ADD_MUX = "LUT";
parameter DFF01_DATA_MUX = "COMB";
parameter DFF23_DATA_MUX = "COMB";
parameter DFF0_CLK = "CLK0";
parameter DFF1_CLK = "CLK0";
parameter DFF2_CLK = "CLK0";
parameter DFF3_CLK = "CLK0";
parameter DFF0_AC  = "AC0";
parameter DFF1_AC  = "AC0";
parameter DFF2_AC  = "AC0";
parameter DFF3_AC  = "AC0";
// Feedback muxes from the flip-flop outputs.
wire ff_feedback_mux0, ff_feedback_mux1;
// C-input muxes which can be set to also use the F-input.
wire c0_input_mux, c1_input_mux;
// F-input muxes which can be set to a constant to allow LUT5 use.
wire f0_input_mux, f1_input_mux;
// Adder input muxes to select between shared-arithmetic mode and arithmetic mode.
wire add0_input_mux, add1_input_mux;
// Combinational-output muxes for LUT #1 and LUT #3
wire lut1_comb_mux, lut3_comb_mux;
// Sum-output muxes for LUT #1 and LUT #3
wire lut1_sum_mux, lut3_sum_mux;
// DFF data-input muxes
wire dff01_data_mux, dff23_data_mux;
// DFF clock selectors
wire dff0_clk, dff1_clk, dff2_clk, dff3_clk;
// DFF asynchronous-clear selectors
wire dff0_ac, dff1_ac, dff2_ac, dff3_ac;
// LUT, DFF and adder output wires for routing.
wire lut0_out, lut1a_out, lut1b_out, lut2_out, lut3a_out, lut3b_out;
wire dff0_out, dff1_out, dff2_out, dff3_out;
wire add0_sum, add1_sum, add0_carry, add1_carry;
generate
    if (FEEDBACK0 === "FF0")
        assign ff_feedback_mux0 = dff0_out;
    else if (FEEDBACK0 === "FF1")
        assign ff_feedback_mux0 = dff1_out;
    else
        $error("Invalid FEEDBACK0 setting!");
    if (FEEDBACK1 == "FF2")
        assign ff_feedback_mux1 = dff2_out;
    else if (FEEDBACK1 == "FF3")
        assign ff_feedback_mux1 = dff3_out;
    else
        $error("Invalid FEEDBACK1 setting!");
    if (C0_MUX === "C0")
        assign c0_input_mux = C0;
    else if (C0_MUX === "F1")
        assign c0_input_mux = F1;
    else if (C0_MUX === "FEEDBACK1")
        assign c0_input_mux = ff_feedback_mux1;
    else
        $error("Invalid C0_MUX setting!");
    if (C1_MUX === "C1")
        assign c1_input_mux = C1;
    else if (C1_MUX === "F0")
        assign c1_input_mux = F0;
    else if (C1_MUX === "FEEDBACK0")
        assign c1_input_mux = ff_feedback_mux0;
    else
        $error("Invalid C1_MUX setting!");
    // F0 == VCC is LUT5
    // F0 == F0 is LUT6
    // F0 == FEEDBACK is unknown
    if (F0_MUX === "VCC")
        assign f0_input_mux = 1'b1;
    else if (F0_MUX === "F0")
        assign f0_input_mux = F0;
    else if (F0_MUX === "FEEDBACK0")
        assign f0_input_mux = ff_feedback_mux0;
    else
        $error("Invalid F0_MUX setting!");
    // F1 == GND is LUT5
    // F1 == F1 is LUT6
    // F1 == FEEDBACK is unknown
    if (F1_MUX === "GND")
        assign f1_input_mux = 1'b0;
    else if (F1_MUX === "F1")
        assign f1_input_mux = F1;
    else if (F1_MUX === "FEEDBACK1")
        assign f1_input_mux = ff_feedback_mux1;
    else
        $error("Invalid F1_MUX setting!");
    if (ADD_MUX === "LUT") begin
        assign add0_input_mux = ~lut1_sum_mux;
        assign add1_input_mux = ~lut3_sum_mux;
    end else if (ADD_MUX === "SHARE") begin
        assign add0_input_mux = SHAREIN;
        assign add1_input_mux = lut1_comb_mux;
    end else
        $error("Invalid ADD_MUX setting!");
    if (DFF01_DATA_MUX === "COMB")
        assign dff01_data_mux = COMB0;
    else if (DFF01_DATA_MUX === "SUM")
        assign dff01_data_mux = SUM0;
    else
        $error("Invalid DFF01_DATA_MUX setting!");
    if (DFF23_DATA_MUX === "COMB")
        assign dff23_data_mux = COMB0;
    else if (DFF23_DATA_MUX === "SUM")
        assign dff23_data_mux = SUM0;
    else
        $error("Invalid DFF23_DATA_MUX setting!");
    if (DFF0_CLK === "CLK0")
        assign dff0_clk = CLK0;
    else if (DFF0_CLK === "CLK1")
        assign dff0_clk = CLK1;
    else if (DFF0_CLK === "CLK2")
        assign dff0_clk = CLK2;
    else
        $error("Invalid DFF0_CLK setting!");
    if (DFF1_CLK === "CLK0")
        assign dff1_clk = CLK0;
    else if (DFF1_CLK === "CLK1")
        assign dff1_clk = CLK1;
    else if (DFF1_CLK === "CLK2")
        assign dff1_clk = CLK2;
    else
        $error("Invalid DFF1_CLK setting!");
    if (DFF2_CLK === "CLK0")
        assign dff2_clk = CLK0;
    else if (DFF2_CLK === "CLK1")
        assign dff2_clk = CLK1;
    else if (DFF2_CLK === "CLK2")
        assign dff2_clk = CLK2;
    else
        $error("Invalid DFF2_CLK setting!");
    if (DFF3_CLK === "CLK0")
        assign dff3_clk = CLK0;
    else if (DFF3_CLK === "CLK1")
        assign dff3_clk = CLK1;
    else if (DFF3_CLK === "CLK2")
        assign dff3_clk = CLK2;
    else
        $error("Invalid DFF3_CLK setting!");
    if (DFF0_AC === "AC0")
        assign dff0_ac = AC0;
    else if (DFF0_AC === "AC1")
        assign dff0_ac = AC1;
    else
        $error("Invalid DFF0_AC setting!");
    if (DFF1_AC === "AC0")
        assign dff1_ac = AC0;
    else if (DFF1_AC === "AC1")
        assign dff1_ac = AC1;
    else
        $error("Invalid DFF1_AC setting!");
    if (DFF2_AC === "AC0")
        assign dff2_ac = AC0;
    else if (DFF2_AC === "AC1")
        assign dff2_ac = AC1;
    else
        $error("Invalid DFF2_AC setting!");
    if (DFF3_AC === "AC0")
        assign dff3_ac = AC0;
    else if (DFF3_AC === "AC1")
        assign dff3_ac = AC1;
    else
        $error("Invalid DFF3_AC setting!");
endgenerate
// F0 on the Quartus diagram
MISTRAL_ALUT4 #(.LUT(LUT0)) lut0 (.A(A), .B(B), .C(C0), .D(c1_input_mux), .Q(lut0_out));
// F2 on the Quartus diagram
MISTRAL_ALUT4 #(.LUT(LUT1)) lut1_comb (.A(A), .B(B), .C(C0), .D(c1_input_mux), .Q(lut1_comb_mux));
MISTRAL_ALUT4 #(.LUT(LUT1)) lut1_sum  (.A(A), .B(B), .C(C0), .D(E0), .Q(lut1_sum_mux));
// F1 on the Quartus diagram
MISTRAL_ALUT4 #(.LUT(LUT2)) lut2 (.A(A), .B(B), .C(C1), .D(c0_input_mux), .Q(lut2_out));
// F3 on the Quartus diagram
MISTRAL_ALUT4 #(.LUT(LUT3)) lut3_comb (.A(A), .B(B), .C(C1), .D(c0_input_mux), .Q(lut3_comb_mux));
MISTRAL_ALUT4 #(.LUT(LUT3)) lut3_sum  (.A(A), .B(B), .C(C1), .D(E1), .Q(lut3_sum_mux));
MISTRAL_FF #(.INIT(INIT0)) dff0 (.D(dff01_data_mux), .CLK(dff0_clk), .ACn(dff0_ac), .Q(dff0_out));
MISTRAL_FF #(.INIT(INIT1)) dff1 (.D(dff01_data_mux), .CLK(dff1_clk), .ACn(dff1_ac), .Q(dff1_out));
MISTRAL_FF #(.INIT(INIT2)) dff2 (.D(dff23_data_mux), .CLK(dff2_clk), .ACn(dff2_ac), .Q(dff2_out));
MISTRAL_FF #(.INIT(INIT3)) dff3 (.D(dff23_data_mux), .CLK(dff3_clk), .ACn(dff3_ac), .Q(dff3_out));
// Adders
assign {add0_carry, add0_sum} = CARRYIN + lut0_out + lut1_sum_mux;
assign {add1_carry, add1_sum} = add0_carry + lut2_out + lut3_sum_mux;
// COMBOUT outputs on the Quartus diagram
assign COMB0 = E0 ? (f0_input_mux ? lut3_comb_mux : lut1_comb_mux)
                    : (f0_input_mux ? lut2_out : lut0_out);
assign COMB1 = E1 ? (f1_input_mux ? lut3_comb_mux : lut1_comb_mux)
                    : (f1_input_mux ? lut2_out : lut0_out);
// SUMOUT output on the Quartus diagram
assign SUM0 = add0_sum;
assign SUM1 = add1_sum;
// COUT output on the Quartus diagram
assign CARRYOUT = add1_carry;
// SHAREOUT output on the Quartus diagram
assign SHAREOUT = lut3_comb_mux;
// REGOUT outputs on the Quartus diagram
assign FF0 = dff0_out;
assign FF1 = dff1_out;
assign FF2 = dff2_out;
assign FF3 = dff3_out;
endmodule