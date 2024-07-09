module processInstr (instr,cal_r,cal_i,ld,st,brs,brt,jr_o,jal_o,muldiv,mtc0_o,mfc0_o);
   input [31:0] instr;
   output       cal_r,cal_i,ld,st,brs,brt,jr_o,jal_o,muldiv;
   output       mtc0_o,mfc0_o;
   wire         `ALL_SUPPORT_INSTR;
   parse_instr parser(instr,`ALL_SUPPORT_INSTR);
   assign cal_r=`CALC_R|mult|multu|div|divu|mfhi|mflo|jalr;
   assign cal_i=`CALC_I|mthi|mtlo;
   assign ld=`LOAD;
   assign st=`STORE;
   assign brt=beq|bne;
   assign brs=`ALL_BTYPE;
   assign jr_o=jr|jalr;
   assign jal_o=jal;
   assign mtc0_o=mtc0;
   assign mfc0_o=mfc0;
   assign muldiv=mult|multu|div|divu|mfhi|mflo|mthi|mtlo;
endmodule