module th33w2 ( y, a, b, c );
output  y;
input  a, b, c;
specify
    specparam CDS_LIBNAME  = "static";
    specparam CDS_CELLNAME = "th33w2";
    specparam CDS_VIEWNAME = "schematic";
endspecify
nfet_b  N6 ( .d(net44), .g(a), .s(cds_globals.gnd_),
     .b(cds_globals.gnd_));
nfet_b  N5 ( .d(net32), .g(y), .s(net44), .b(cds_globals.gnd_));
nfet_b  N4 ( .d(net013), .g(c), .s(cds_globals.gnd_),
     .b(cds_globals.gnd_));
nfet_b  N10 ( .d(net32), .g(y), .s(net013), .b(cds_globals.gnd_));
nfet_b  N2 ( .d(net013), .g(b), .s(cds_globals.gnd_),
     .b(cds_globals.gnd_));
nfet_b  N1 ( .d(net32), .g(a), .s(net013), .b(cds_globals.gnd_));
pfet_b  P5 ( .b(cds_globals.vdd_), .g(y), .s(cds_globals.vdd_),
     .d(net036));
pfet_b  P4 ( .b(cds_globals.vdd_), .g(y), .s(cds_globals.vdd_),
     .d(net49));
pfet_b  P3 ( .b(cds_globals.vdd_), .g(a), .s(net036), .d(net32));
pfet_b  P2 ( .b(cds_globals.vdd_), .g(c), .s(net34), .d(net32));
pfet_b  P1 ( .b(cds_globals.vdd_), .g(b), .s(net49), .d(net34));
pfet_b  P0 ( .b(cds_globals.vdd_), .g(a), .s(cds_globals.vdd_),
     .d(net49));
inv I2 ( y, net32);
endmodule