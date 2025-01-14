module th22r ( y, a, b, rsb );
output  y;
input  a, b, rsb;
specify
    specparam CDS_LIBNAME  = "static";
    specparam CDS_CELLNAME = "th22r";
    specparam CDS_VIEWNAME = "schematic";
endspecify
pfet_b  P7 ( .b(cds_globals.vdd_), .g(rsb), .s(cds_globals.vdd_),
     .d(net15));
pfet_b  P4 ( .b(cds_globals.vdd_), .g(a), .s(cds_globals.vdd_),
     .d(net24));
pfet_b  P3 ( .b(cds_globals.vdd_), .g(y), .s(net24), .d(net15));
pfet_b  P2 ( .b(cds_globals.vdd_), .g(b), .s(cds_globals.vdd_),
     .d(net24));
pfet_b  P1 ( .b(cds_globals.vdd_), .g(b), .s(net35), .d(net15));
pfet_b  P0 ( .b(cds_globals.vdd_), .g(a), .s(cds_globals.vdd_),
     .d(net35));
nfet_b  N7 ( .d(net023), .g(rsb), .s(cds_globals.gnd_),
     .b(cds_globals.gnd_));
nfet_b  N4 ( .d(net22), .g(b), .s(net023), .b(cds_globals.gnd_));
nfet_b  N3 ( .d(net22), .g(a), .s(net023), .b(cds_globals.gnd_));
nfet_b  N2 ( .d(net15), .g(y), .s(net22), .b(cds_globals.gnd_));
nfet_b  N1 ( .d(net34), .g(a), .s(net023), .b(cds_globals.gnd_));
nfet_b  N0 ( .d(net15), .g(b), .s(net34), .b(cds_globals.gnd_));
inv I2 ( y, net15);
endmodule