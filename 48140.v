module.
//         1 111 110 000 000 000
// Signal  5 432 109 876 543 210        Octal
// RB14    0 010 000 000 000 000  16'o 020000
// R1      0 000 000 000 000 001  16'o 000001
// R1C     1 111 111 111 111 110  16'o 177776
// R2      0 000 000 000 000 010  16'o 000002
// RSB     1 000 000 000 000 000  16'o 100000
// R22     0 000 000 000 010 010  16'o 000022
// R24     0 000 000 000 010 100  16'o 000024
// R2000   0 000 010 000 000 000  16'o 002000
assign WRITE_OUT_BUS[15] = READ_OUT_BUS[15] | !R1C | !RSB        ;
assign WRITE_OUT_BUS[14] = READ_OUT_BUS[14] | !R1C               ;
assign WRITE_OUT_BUS[13] = READ_OUT_BUS[13] | !R1C | !RB14       ;
assign WRITE_OUT_BUS[12] = READ_OUT_BUS[12] | !R1C               ;
assign WRITE_OUT_BUS[11] = READ_OUT_BUS[11] | !R1C               ;
assign WRITE_OUT_BUS[10] = READ_OUT_BUS[10] | !R1C | !R2000      ;
assign WRITE_OUT_BUS[ 9] = READ_OUT_BUS[ 9] | !R1C               ;
assign WRITE_OUT_BUS[ 8] = READ_OUT_BUS[ 8] | !R1C               ;
assign WRITE_OUT_BUS[ 7] = READ_OUT_BUS[ 7] | !R1C               ;
assign WRITE_OUT_BUS[ 6] = READ_OUT_BUS[ 6] | !R1C               ;
assign WRITE_OUT_BUS[ 5] = READ_OUT_BUS[ 5] | !R1C               ;
assign WRITE_OUT_BUS[ 4] = READ_OUT_BUS[ 4] | !R1C | !R22 | !R24 ;
assign WRITE_OUT_BUS[ 3] = READ_OUT_BUS[ 3] | !R1C               ;
assign WRITE_OUT_BUS[ 2] = READ_OUT_BUS[ 2] | !R1C |        !R24 ;
assign WRITE_OUT_BUS[ 1] = READ_OUT_BUS[ 1] | !R1C | !R2  | !R22 ;
assign WRITE_OUT_BUS[ 0] = READ_OUT_BUS[ 0] | !R1                ;
endmodule