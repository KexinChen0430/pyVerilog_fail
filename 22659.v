module hardcopyiii_round_saturate_block(
                                   datain,
                                   round,
                                   saturate,
                                   signa,
                                   signb,
                                   datain_width,
                                   dataout,
                                   saturationoverflow
                                  );
parameter dataa_width = 36;
parameter datab_width = 36;
parameter saturate_width = 15;
parameter round_width = 15;
parameter saturate_mode = " asymmetric";
parameter round_mode = "nearest_integer";
parameter operation_mode = "output_only";
input [71:0] datain;
input round;
input saturate;
input signa;
input signb;
input [7:0] datain_width;
output[71:0] dataout;
output saturationoverflow;
wire [71:0] dataout_round;
wire [7:0] datain_width;
wire [7:0] fraction_width;
wire[7:0] datasize;
specify
    (datain *> dataout)                     = (0, 0);
    (round *> dataout)                      = (0, 0);
    (saturate *> dataout)                   = (0, 0);
    (signa *> dataout)                      = (0, 0);
    (signb *> dataout)                      = (0, 0);
    (datain *> saturationoverflow)         = (0, 0);
    (round *> saturationoverflow)          = (0, 0);
    (saturate *> saturationoverflow)       = (0, 0);
    (signa *> saturationoverflow)          = (0, 0);
    (signb *> saturationoverflow)          = (0, 0);
endspecify
hardcopyiii_round_block round_unit  (
                              .datain(datain),
                              .round(round),
                              .datain_width(datain_width),
                              .dataout(dataout_round)
                              );
defparam round_unit.round_mode = round_mode;
defparam round_unit.operation_mode = operation_mode;
defparam round_unit.round_width = round_width;
hardcopyiii_saturate_block saturate_unit(
                                    .datain(dataout_round),
                                    .saturate(saturate),
                                    .round(round),
                                    .signa(signa),
                                    .signb(signb),
                                    .datain_width(datain_width),
                                    .dataout(dataout),
                                    .saturation_overflow(saturationoverflow)
                                   );
defparam saturate_unit.dataa_width = dataa_width;
defparam saturate_unit.datab_width = datab_width;
defparam saturate_unit.round_width = round_width;
defparam saturate_unit.saturate_width = saturate_width;
defparam saturate_unit.saturate_mode = saturate_mode;
defparam saturate_unit.operation_mode = operation_mode;
endmodule