module OBUFT_DCIEN (O, DCITERMDISABLE, I, T);
    parameter integer DRIVE = 12;
    parameter IOSTANDARD = "DEFAULT";
`ifdef XIL_TIMING
    parameter LOC = "UNPLACED";
`endif // `ifdef XIL_TIMING
    parameter SLEW = "SLOW";
    output O;
    input  DCITERMDISABLE;
    input  I;
    input  T;
    wire ts;
    tri0 GTS = glbl.GTS;
    or O1 (ts, GTS, T);
    bufif0 T1 (O, I, ts);
`ifdef XIL_TIMING
    specify
        (DCITERMDISABLE => O)   = (0:0:0,  0:0:0);
        (I => O)                = (0:0:0,  0:0:0);
        (T => O)                = (0:0:0,  0:0:0);
        specparam PATHPULSE$ = 0;
    endspecify
`endif // `ifdef XIL_TIMING
endmodule