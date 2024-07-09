module stratix_lcell (
                      clk,
                      dataa,
                      datab,
                      datac,
                      datad,
                      aclr,
                      aload,
                      sclr,
                      sload,
                      ena,
                      cin,
                      cin0,
                      cin1,
                      inverta,
                      regcascin,
                      devclrn,
                      devpor,
                      combout,
                      regout,
                      cout,
                      cout0,
                      cout1
                     );
    parameter operation_mode = "normal" ;
    parameter synch_mode = "off";
    parameter register_cascade_mode = "off";
    parameter sum_lutc_input = "datac";
    parameter lut_mask = "ffff" ;
    parameter power_up = "low";
    parameter cin_used = "false";
    parameter cin0_used = "false";
    parameter cin1_used = "false";
    parameter output_mode = "reg_and_comb";
    parameter lpm_type = "stratix_lcell";
    parameter x_on_violation = "on";
    // INPUT PORTS
    input dataa;
    input datab;
    input datac;
    input datad;
    input clk;
    input aclr;
    input aload;
    input sclr;
    input sload;
    input ena;
    input cin;
    input cin0;
    input cin1;
    input inverta;
    input regcascin;
    input devclrn;
    input devpor ;
    // OUTPUT PORTS
    output combout;
    output regout;
    output cout;
    output cout0;
    output cout1;
    tri1 devclrn;
    tri1 devpor;
    // INTERNAL VARIABLES
    wire dffin, qfbkin;
    stratix_asynch_lcell lecomb (
                                 .dataa(dataa),
                                 .datab(datab),
                                 .datac(datac),
                                 .datad(datad),
                                 .cin(cin),
                                 .cin0(cin0),
                                 .cin1(cin1),
                                 .inverta(inverta),
                                 .qfbkin(qfbkin),
                                 .regin(dffin),
                                 .combout(combout),
                                 .cout(cout),
                                 .cout0(cout0),
                                 .cout1(cout1)
                                );
        defparam lecomb.operation_mode = operation_mode;
        defparam lecomb.sum_lutc_input = sum_lutc_input;
        defparam lecomb.cin_used = cin_used;
        defparam lecomb.cin0_used = cin0_used;
        defparam lecomb.cin1_used = cin1_used;
        defparam lecomb.lut_mask = lut_mask;
    stratix_lcell_register lereg (
                                  .clk(clk),
                                  .aclr(aclr),
                                  .aload(aload),
                                  .sclr(sclr),
                                  .sload(sload),
                                  .ena(ena),
                                  .datain(dffin),
                                  .datac(datac),
                                  .regcascin(regcascin),
                                  .devclrn(devclrn),
                                  .devpor(devpor),
                                  .regout(regout),
                                  .qfbkout(qfbkin)
                                 );
        defparam lereg.synch_mode = synch_mode;
        defparam lereg.register_cascade_mode = register_cascade_mode;
        defparam lereg.power_up = power_up;
        defparam lereg.x_on_violation = x_on_violation;
endmodule