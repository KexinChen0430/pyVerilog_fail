module th44w322a ( y, a, b, c, d );
output  y;
input  a, b, c, d;
specify
    specparam CDS_LIBNAME  = "static";
    specparam CDS_CELLNAME = "th44w322a";
    specparam CDS_VIEWNAME = "schematic";
endspecify
nfet_b  N13 ( .d(net037), .g(c), .s(cds_globals.gnd_),
     .b(cds_globals.gnd_));
nfet_b  N14 ( .d(net32), .g(b), .s(net037), .b(cds_globals.gnd_));
nfet_b  N6 ( .d(net45), .g(d), .s(cds_globals.gnd_),
     .b(cds_globals.gnd_));
nfet_b  N5 ( .d(net32), .g(a), .s(net44), .b(cds_globals.gnd_));
nfet_b  N4 ( .d(net45), .g(c), .s(cds_globals.gnd_),
     .b(cds_globals.gnd_));
nfet_b  N10 ( .d(net32), .g(y), .s(net45), .b(cds_globals.gnd_));
nfet_b  N3 ( .d(net44), .g(y), .s(cds_globals.gnd_),
     .b(cds_globals.gnd_));
nfet_b  N2 ( .d(net45), .g(b), .s(cds_globals.gnd_),
     .b(cds_globals.gnd_));
nfet_b  N1 ( .d(net32), .g(a), .s(net45), .b(cds_globals.gnd_));
pfet_b  P11 ( .b(cds_globals.vdd_), .g(a), .s(net036), .d(net047));
pfet_b  P7 ( .b(cds_globals.vdd_), .g(b), .s(net047), .d(net32));
pfet_b  P10 ( .b(cds_globals.vdd_), .g(c), .s(net047), .d(net32));
pfet_b  P5 ( .b(cds_globals.vdd_), .g(y), .s(cds_globals.vdd_),
     .d(net036));
pfet_b  P4 ( .b(cds_globals.vdd_), .g(y), .s(cds_globals.vdd_),
     .d(net49));
pfet_b  P3 ( .b(cds_globals.vdd_), .g(c), .s(net47), .d(net32));
pfet_b  P2 ( .b(cds_globals.vdd_), .g(d), .s(net34), .d(net47));
pfet_b  P1 ( .b(cds_globals.vdd_), .g(b), .s(net49), .d(net34));
pfet_b  P0 ( .b(cds_globals.vdd_), .g(a), .s(cds_globals.vdd_),
     .d(net49));
inv I2 ( y, net32);
endmodule