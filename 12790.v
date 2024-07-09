module PreventSwapCtl (FracAgtB, notExpAgtB, ExpZero,
                       RomPrevIfBgtA, FpLd,
                       PreventSwap,
                       PreventSwapExp);
input FracAgtB, notExpAgtB, ExpZero,
      FpLd, RomPrevIfBgtA;
output PreventSwap;
output PreventSwapExp;
// Preventing swap on add
// Use seperate line for Exp
ME_INV_A   psg0 (FpLd, notFpLd); // On FpLd remove prevent swap
ME_INV_A   psg3 (ExpZero, notExpZero);
ME_NAND3_B psg4 (notFpLd, RomPrevIfBgtA, notExpAgtB, notPrevSwap_F0);
ME_NAND4  psg5 (notFpLd, RomPrevIfBgtA, notExpAgtB, notExpZero, notPrevSwap_F1);
ME_NMUX2B_B psg6 (FracAgtB, notPrevSwap_F0, notPrevSwap_F1, PreventSwap);
// Add seperate PreventSwap for Exp
ME_INV_B  psg7 (notPrevSwap_F0, PreventSwapExp);
//ME_XOR    psg8 (PreventSwapExp, PreventSwap, WrongSwap);
//ME_FD1    psg8 (Phi, WrongSwap, L_WrongSwap, ); // So swap back !!
/* **************************************************** /
 / We know that we've done the wrong swap. Since the
 / swap is only done at the begining of add we can be sure
 / that FracAreg is going to be loaded from the shifter on
 / the subsequent cycle. So we can force it to be loaded from
 / Breg and also force Breg to be loaded from Areg. So that
 / if a swap was prevented it can be redone
endmodule