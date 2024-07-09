module cycloneii_mac_mult
   (
    dataa,
    datab,
    signa,
    signb,
    clk,
    aclr,
    ena,
    dataout,
    devclrn,
    devpor
    );
    parameter dataa_width    = 18;
    parameter datab_width    = 18;
    parameter dataa_clock	= "none";
    parameter datab_clock	= "none";
    parameter signa_clock	= "none";
    parameter signb_clock	= "none";
    parameter lpm_hint       = "true";
    parameter lpm_type       = "cycloneii_mac_mult";
// SIMULATION_ONLY_PARAMETERS_BEGIN
    parameter dataout_width  = dataa_width + datab_width;
// SIMULATION_ONLY_PARAMETERS_END
    input [dataa_width-1:0] dataa;
    input [datab_width-1:0] datab;
    input 	signa;
    input 	signb;
    input clk;
    input aclr;
    input ena;
    input 	devclrn;
    input 	devpor;
    output [dataout_width-1:0] dataout;
    tri1 devclrn;
    tri1 devpor;
    wire [dataout_width-1:0] dataout_tmp;
    wire [17:0] idataa_reg;	// optional register for dataa input
    wire [17:0] idatab_reg;	// optional register for datab input
    wire [17:0] dataa_pad;	// padded dataa input
    wire [17:0] datab_pad;	// padded datab input
    wire isigna_reg;			// optional register for signa input
    wire isignb_reg;			// optional register for signb input
    wire [17:0] idataa_int;	// dataa as seen by the multiplier input
    wire [17:0] idatab_int;	// datab as seen by the multiplier input
    wire isigna_int;			// signa as seen by the multiplier input
    wire isignb_int;			// signb as seen by the multiplier input
    wire ia_is_positive;
    wire ib_is_positive;
    wire [17:0] iabsa;		// absolute value (i.e. positive) form of dataa input
    wire [17:0] iabsb;		// absolute value (i.e. positive) form of datab input
    wire [35:0] iabsresult;	// absolute value (i.e. positive) form of product (a * b)
    wire dataa_use_reg;		// equivalent to dataa_clock parameter
    wire datab_use_reg;		// equivalent to datab_clock parameter
    wire signa_use_reg;		// equivalent to signa_clock parameter
    wire signb_use_reg;		// equivalent to signb_clock parameter
    reg [17:0] i_ones;		// padding with 1's for input negation
    wire reg_aclr;
    assign reg_aclr = (!devpor) || (!devclrn) || (aclr);
    // optional registering parameters
    assign dataa_use_reg = (dataa_clock != "none") ? 1'b1 : 1'b0;
    assign datab_use_reg = (datab_clock != "none") ? 1'b1 : 1'b0;
    assign signa_use_reg = (signa_clock != "none") ? 1'b1 : 1'b0;
    assign signb_use_reg = (signb_clock != "none") ? 1'b1 : 1'b0;
    assign dataa_pad = ((18-dataa_width) == 0) ? dataa : {{(18-dataa_width){1'b0}},dataa};
    assign datab_pad = ((18-datab_width) == 0) ? datab : {{(18-datab_width){1'b0}},datab};
    initial
    begin
        // 1's padding for 18-bit wide inputs
        i_ones = ~0;
    end
    // Optional input registers for dataa,b and signa,b
    cycloneii_mac_data_reg dataa_reg (
                                      .clk(clk),
                                      .data(dataa_pad),
                                      .ena(ena),
                                      .aclr(reg_aclr),
                                      .dataout(idataa_reg)
                                     );
        defparam dataa_reg.data_width = dataa_width;
    cycloneii_mac_data_reg datab_reg (
                                      .clk(clk),
                                      .data(datab_pad),
                                      .ena(ena),
                                      .aclr(reg_aclr),
                                      .dataout(idatab_reg)
                                     );
        defparam datab_reg.data_width = datab_width;
    cycloneii_mac_sign_reg signa_reg (
                                      .clk(clk),
                                      .d(signa),
                                      .ena(ena),
                                      .aclr(reg_aclr),
                                      .q(isigna_reg)
                                     );
    cycloneii_mac_sign_reg signb_reg (
                                      .clk(clk),
                                      .d(signb),
                                      .ena(ena),
                                      .aclr(reg_aclr),
                                      .q(isignb_reg)
                                     );
    // mux input sources from direct inputs or optional registers
    assign idataa_int = dataa_use_reg == 1'b1 ? idataa_reg : dataa;
    assign idatab_int = datab_use_reg == 1'b1 ? idatab_reg : datab;
    assign isigna_int = signa_use_reg == 1'b1 ? isigna_reg : signa;
    assign isignb_int = signb_use_reg == 1'b1 ? isignb_reg : signb;
    cycloneii_mac_mult_internal mac_multiply (
                                              .dataa(idataa_int[dataa_width-1:0]),
                                              .datab(idatab_int[datab_width-1:0]),
                                              .signa(isigna_int),
                                              .signb(isignb_int),
                                              .dataout(dataout)
                                             );
        defparam mac_multiply.dataa_width = dataa_width;
        defparam mac_multiply.datab_width = datab_width;
        defparam mac_multiply.dataout_width = dataout_width;
endmodule