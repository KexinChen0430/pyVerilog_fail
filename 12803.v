module ResultException (Result, SNnotDB, ExpZero, notUnderflow, notOverflow, notExpException);
  input [`ExpMSB:0] Result;
  input ExpZero;
  input SNnotDB;
  output notUnderflow, notOverflow, notExpException;
  ME_TIEOFF toff (vdd, );
  ME_INV_B g30 ( Result[12], positive ) ;
  ME_INV_A g31 ( SNnotDB, DBnotSN ) ;
  // underflow condition is -ve or all zero.
  // Note that exp must be subtracting for zero to work !
  ME_NMUX2B zq1 (positive, vdd, ExpZero, notUnderflow );
  // overflow condition is positive and all ones with LSB dont care.
  // or positive with bit 11 set.
  // n.b all ones applies only over required length.
  // Force bits 10 to 8 high when single and AND them
  ME_NAND3 g10 (Result[10], Result[9], Result[8], n10 ) ;
  ME_NAND2 g11 (DBnotSN, n10, doublebits1 ) ;
  ME_AND4    zzd (Result[7], Result[6], Result[5], Result[4], All1s7to4);
  ME_AND4_B  zze (positive,  Result[3], Result[2], Result[1], PAll1s3to1);
  ME_OR3_B   zzf  ( Result[10], Result[9], Result[8], Bit10Or8);
  ME_NAND3_B g23 ( positive, SNnotDB, Bit10Or8, notSNGrossOv ) ;
  ME_NAND3_B g22 ( doublebits1, All1s7to4, PAll1s3to1, notAll1s ) ;
  ME_NAND2   g21 ( positive, Result[11], notBit11 ) ;
  ME_AND3_B  g20 ( notSNGrossOv, notAll1s, notBit11, notOverflow ) ;
  ME_AND4_B  g24 ( notUnderflow, notSNGrossOv, notAll1s, notBit11, notExpException ) ;
endmodule