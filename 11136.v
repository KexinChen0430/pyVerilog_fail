module arriaiigz_dll_offset_ctrl (
	    clk,
	    aload,
	    offsetdelayctrlin,
	    offset,
	    addnsub,
	    devclrn,
	    devpor,
	    offsettestout,
	    offsetctrlout
);
parameter use_offset         = "false";
parameter static_offset      = "0";
parameter delay_buffer_mode  = "low";   // consistent with dqs
parameter lpm_type           = "arriaiigz_dll_offset_ctrl";
// INPUT PORTS
input        clk;
input        aload;
input [5:0]  offsetdelayctrlin;
input [5:0]  offset;
input        addnsub;
input        devclrn;
input        devpor;
// OUTPUT PORTS
output [5:0] offsetctrlout;
output [5:0] offsettestout;
tri1 devclrn;
tri1 devpor;
// TMP OUTPUTS
wire [5:0] offsetctrl_out;
// FUNCTIONS
// convert string to integer with sign
function integer str2int;
    input [8*16:1] s;
    reg [8*16:1] reg_s;
    reg [8:1] digit;
    reg [8:1] tmp;
    integer m, magnitude;
    integer sign;
    begin
        sign = 1;
        magnitude = 0;
        reg_s = s;
        for (m=1; m<=16; m=m+1)
        begin
            tmp = reg_s[128:121];
            digit = tmp & 8'b00001111;
            reg_s = reg_s << 8;
            // Accumulate ascii digits 0-9 only.
            if ((tmp>=48) && (tmp<=57))
                magnitude = (magnitude * 10) + digit;
            if (tmp == 45)
                sign = -1;  // Found a '-' character, i.e. number is negative.
        end
        str2int = sign*magnitude;
    end
endfunction  // str2int
// Const VARIABLES to represent string parameters
reg [1:0] para_delay_buffer_mode;
reg [1:0] para_use_offset;
integer   para_static_offset;
// INTERNAL NETS AND VARIABLES
// for functionality - by modules
// two reg on the de-assertion of dll
reg  aload_reg1;
reg  aload_reg2;
// delay and offset control out resolver
wire [5:0] dr_offsettest_out;
wire [5:0] dr_offsetctrl_out;
wire [5:0] dr_offsetctrl_out_gray;
wire       dr_clk8_in;
wire       dr_aload_in;
wire       dr_addnsub_in;
wire [5:0] dr_offset_in_gray;
wire [5:0] dr_delayctrl_in_gray;
wire [5:0] para_static_offset_gray;
//decoder
wire [5:0] dr_delayctrl_in_bin;
wire [5:0] dr_offset_in_bin;
wire [5:0] dr_offset_in_bin_pos;
wire [5:0] para_static_offset_bin;
wire [5:0] para_static_offset_bin_pos;
reg  [5:0] dr_reg_offset;
// Timing hooks
// BUFFER INPUTS
wire clk_in;
wire aload_in;
wire offset_in5;
wire offset_in4;
wire offset_in3;
wire offset_in2;
wire offset_in1;
wire offset_in0;
wire addnsub_in;
wire [5:0] offsetdelayctrlin_in;
wire [5:0] offset_in;
assign clk_in =  clk;
assign aload_in =  (aload === 1'b1) ? 1'b1 : 1'b0;
assign offset_in5 =  (offset[5] === 1'b1) ? 1'b1 : 1'b0;
assign offset_in4 =  (offset[4] === 1'b1) ? 1'b1 : 1'b0;
assign offset_in3 =  (offset[3] === 1'b1) ? 1'b1 : 1'b0;
assign offset_in2 =  (offset[2] === 1'b1) ? 1'b1 : 1'b0;
assign offset_in1 =  (offset[1] === 1'b1) ? 1'b1 : 1'b0;
assign offset_in0 =  (offset[0] === 1'b1) ? 1'b1 : 1'b0;
assign addnsub_in =  (addnsub === 1'b1) ? 1'b1 : 1'b0;
assign offsetdelayctrlin_in[5] = (offsetdelayctrlin[5] === 1'b1) ? 1'b1 : 1'b0;
assign offsetdelayctrlin_in[4] = (offsetdelayctrlin[4] === 1'b1) ? 1'b1 : 1'b0;
assign offsetdelayctrlin_in[3] = (offsetdelayctrlin[3] === 1'b1) ? 1'b1 : 1'b0;
assign offsetdelayctrlin_in[2] = (offsetdelayctrlin[2] === 1'b1) ? 1'b1 : 1'b0;
assign offsetdelayctrlin_in[1] = (offsetdelayctrlin[1] === 1'b1) ? 1'b1 : 1'b0;
assign offsetdelayctrlin_in[0] = (offsetdelayctrlin[0] === 1'b1) ? 1'b1 : 1'b0;
assign offset_in = {offset_in5, offset_in4,
                    offset_in3, offset_in2,
                    offset_in1, offset_in0};
// TCO DELAYS, IO PATH and SETUP-HOLD CHECKS
// These timing paths existed from ARRIAIIGZ, currently not modeled in arriaiigz
specify
	(posedge clk => (offsetctrlout[0] +: offsetctrl_out[0])) = (0, 0);
	(posedge clk => (offsetctrlout[1] +: offsetctrl_out[1])) = (0, 0);
	(posedge clk => (offsetctrlout[2] +: offsetctrl_out[2])) = (0, 0);
	(posedge clk => (offsetctrlout[3] +: offsetctrl_out[3])) = (0, 0);
	(posedge clk => (offsetctrlout[4] +: offsetctrl_out[4])) = (0, 0);
	(posedge clk => (offsetctrlout[5] +: offsetctrl_out[5])) = (0, 0);
    (offset => offsetctrlout) = (0, 0);
	$setuphold(posedge clk, offset[0], 0, 0);
	$setuphold(posedge clk, offset[1], 0, 0);
	$setuphold(posedge clk, offset[2], 0, 0);
	$setuphold(posedge clk, offset[3], 0, 0);
	$setuphold(posedge clk, offset[4], 0, 0);
	$setuphold(posedge clk, offset[5], 0, 0);
	$setuphold(posedge clk, addnsub, 0, 0);
endspecify
// DRIVERs FOR outputs
and (offsetctrlout[0], offsetctrl_out[0], 1'b1);
and (offsetctrlout[1], offsetctrl_out[1], 1'b1);
and (offsetctrlout[2], offsetctrl_out[2], 1'b1);
and (offsetctrlout[3], offsetctrl_out[3], 1'b1);
and (offsetctrlout[4], offsetctrl_out[4], 1'b1);
and (offsetctrlout[5], offsetctrl_out[5], 1'b1);
// INITIAL BLOCK - info messsage and legaity checks
initial
begin
    // Resolve string parameters
    para_delay_buffer_mode = delay_buffer_mode == "low" ? 2'b01 : 2'b00;
    para_use_offset = use_offset == "true" ? 2'b01 : 2'b00;
    para_static_offset = str2int(static_offset);
    $display("Note: DLL_offset_ctrl instance %m has delay_buffer_mode %0s", delay_buffer_mode);
    $display("      use_offset %0s", use_offset);
    $display("      static_offset %0d", para_static_offset);
end
// CONNCECTING primary outputs ------------------------------------------------
assign offsetctrl_out = dr_offsetctrl_out_gray;
assign offsettestout = dr_offsettest_out;
// offset ctrl out resolver:
//      adding offset_in into offsetdelayin according to offsetctrlout_mode
// two reg on the de-assertion of dll -----------------------------------------
// it is the clk feeding into DLL, not /8 clock.
initial begin
    aload_reg1 = 1'b1;
    aload_reg2 = 1'b1;
end
always @(negedge clk_in)
begin
    aload_reg1 <= aload_in;
    aload_reg2 <= aload_reg1;
end
    // inputs
    assign dr_clk8_in = clk_in;
    assign dr_aload_in = aload_in;  // aload_in | aload_reg2;
    assign dr_addnsub_in = addnsub_in;
    assign dr_delayctrl_in_gray = offsetdelayctrlin_in;
    // substraction flow:
    //Addtion flow:
    assign dr_offset_in_gray = offset_in;
    assign para_static_offset_gray = para_static_offset[5:0];
    // for counter overflow check - getting the binary abs() of the binary para_static
    assign para_static_offset_bin_pos = (para_static_offset > 0) ? para_static_offset_bin :
                                        (6'b111111 - para_static_offset_bin + 6'b000001);
    assign dr_offset_in_bin_pos       = ((use_offset == "true") && (dr_addnsub_in === 1'b0)) ?
                                        (6'b111111 - dr_offset_in_bin + 6'b000001) : dr_offset_in_bin;
   // outputs
   assign dr_offsetctrl_out = dr_reg_offset;
   assign dr_offsetctrl_out_gray = dr_reg_offset ^ (dr_reg_offset >> 1);
   assign dr_offsettest_out = (use_offset == "false") ? para_static_offset[5:0] : offset_in;
    // model
    // gray decoder
    arriaiigz_ddr_gray_decoder mdr_delayctrl_in_dec(dr_delayctrl_in_gray, dr_delayctrl_in_bin);
    arriaiigz_ddr_gray_decoder mdr_offset_in_dec(dr_offset_in_gray, dr_offset_in_bin);
    arriaiigz_ddr_gray_decoder mpara_static_offset_dec(para_static_offset_gray, para_static_offset_bin);
   // por
    initial
    begin
        dr_reg_offset = 6'b000000;
    end
    // based on dr_delayctrl_in and dr_offset_in_bin (for dynamic) and para_static_offset_bin
    always @(posedge dr_clk8_in or posedge dr_aload_in)
    begin
        if (dr_aload_in === 1'b1)
        begin
            dr_reg_offset <= 6'b000000;
        end
        else if (use_offset == "true")      // addnsub
        begin
            if (dr_addnsub_in === 1'b1)
                if (dr_delayctrl_in_bin < 6'b111111 - dr_offset_in_bin)
                    dr_reg_offset <= dr_delayctrl_in_bin + dr_offset_in_bin;
                else
                    dr_reg_offset <= 6'b111111;
            else if (dr_addnsub_in === 1'b0)
                if (dr_delayctrl_in_bin > dr_offset_in_bin_pos)
                    dr_reg_offset <= dr_delayctrl_in_bin + dr_offset_in_bin;  // same as - _pos
                else
                    dr_reg_offset <= 6'b000000;
        end
        else                               // static
        begin
            if (para_static_offset >= 0)
                if (para_static_offset_bin < 64 && para_static_offset_bin < 6'b111111 - dr_delayctrl_in_bin)
                    dr_reg_offset <= dr_delayctrl_in_bin + para_static_offset_bin;
                else
                    dr_reg_offset <= 6'b111111;
            else                                       // donot use a_vec - b_vec >=0 as it is always true
                if (para_static_offset_bin_pos < 63 && dr_delayctrl_in_bin > para_static_offset_bin_pos)
                    dr_reg_offset <= dr_delayctrl_in_bin + para_static_offset_bin;  // same as - *_pos
                else
                    dr_reg_offset <= 6'b000000;
        end
    end
endmodule