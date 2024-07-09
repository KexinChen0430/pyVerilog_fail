module cycloneii_mac_mult_internal
   (
    dataa,
    datab,
    signa,
    signb,
    dataout
    );
    parameter dataa_width    = 18;
    parameter datab_width    = 18;
    parameter dataout_width  = dataa_width + datab_width;
    // INPUT
    input [dataa_width-1:0] dataa;
    input [datab_width-1:0] datab;
    input 	signa;
    input 	signb;
    // OUTPUT
    output [dataout_width-1:0] dataout;
    // Internal variables
    wire [17:0] dataa_ipd;
    wire [17:0] datab_ipd;
    wire signa_ipd;
    wire signb_ipd;
    wire [dataout_width-1:0] dataout_tmp;
    wire ia_is_positive;
    wire ib_is_positive;
    wire [17:0] iabsa;		// absolute value (i.e. positive) form of dataa input
    wire [17:0] iabsb;		// absolute value (i.e. positive) form of datab input
    wire [35:0] iabsresult;	// absolute value (i.e. positive) form of product (a * b)
    reg [17:0] i_ones;		// padding with 1's for input negation
    // Input buffers
    buf (signa_ipd, signa);
    buf (signb_ipd, signb);
    buf dataa_buf [dataa_width-1:0] (dataa_ipd[dataa_width-1:0], dataa);
    buf datab_buf [datab_width-1:0] (datab_ipd[datab_width-1:0], datab);
    specify
        (dataa *> dataout) = (0, 0);
        (datab *> dataout) = (0, 0);
        (signa *> dataout) = (0, 0);
        (signb *> dataout) = (0, 0);
    endspecify
    initial
    begin
        // 1's padding for 18-bit wide inputs
        i_ones = ~0;
    end
    // get signs of a and b, and get absolute values since Verilog '*' operator
    // is an unsigned multiplication
    assign ia_is_positive = ~signa_ipd | ~dataa_ipd[dataa_width-1];
    assign ib_is_positive = ~signb_ipd | ~datab_ipd[datab_width-1];
    assign iabsa = ia_is_positive == 1 ? dataa_ipd[dataa_width-1:0] : -(dataa_ipd | (i_ones << dataa_width));
    assign iabsb = ib_is_positive == 1 ? datab_ipd[datab_width-1:0] : -(datab_ipd | (i_ones << datab_width));
    // multiply a * b
    assign iabsresult = iabsa * iabsb;
    assign dataout_tmp = (ia_is_positive ^ ib_is_positive) == 1 ? -iabsresult : iabsresult;
    buf dataout_buf [dataout_width-1:0] (dataout, dataout_tmp);
endmodule