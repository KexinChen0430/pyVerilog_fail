module t;
   // case provided
   // note this does NOT escape as suggested in the mail
`define LEX_CAT(lexem1, lexem2) lexem1``lexem2
`define LEX_ESC(name) \name  \
   initial begin : `LEX_ESC( `LEX_CAT(a[0],_assignment) )   $write("GOT%%m='%m' EXP='%s'\n", "t.\\`LEX_CAT(a[0],_assignment) ");   end
   // SHOULD(simulator-dependant): Backslash doesn't prevent arguments from
   // substituting and the \ staying in the expansion
   // Note space after name is important so when substitute it has ending whitespace
`define ESC_CAT(name,name2) \name``_assignment_``name2 \
   initial begin : `ESC_CAT( a[0],a[1] )   $write("GOT%%m='%m' EXP='%s'\n", "t.\\a[0]_assignment_a[1] ");   end
`undef ESC_CAT
`define CAT(a,b) a``b
`define ESC(name) \`CAT(name,suffix)
   // RULE: Ignoring backslash does NOT allow an additional expansion level
   // (Because ESC gets expanded then the \ has it's normal escape meaning)
   initial begin : `ESC(pp)   $write("GOT%%m='%m' EXP='%s'\n", "t.\\`CAT(pp,suffix) ");   end
`undef CAT `undef ESC
`define CAT(a,b) a``b
`define ESC(name) \name \
   // Similar to above; \ does not allow expansion after substitution
   initial begin : `ESC( `CAT(ff,bb) )   $write("GOT%%m='%m' EXP='%s'\n", "t.\\`CAT(ff,bb) ");   end
`undef CAT `undef ESC
`define ESC(name) \name \
   // MUST: Unknown macro with backslash escape stays as escaped symbol name
   initial begin : `ESC( `zzz )   $write("GOT%%m='%m' EXP='%s'\n", "t.\\`zzz ");   end
`undef ESC
`define FOO bar
`define ESC(name) \name \
   // SHOULD(simulator-dependant): Known macro with backslash escape expands
   initial begin : `ESC( `FOO )    $write("GOT%%m='%m' OTHER_EXP='%s'\n OUR_EXP='%s'", "t.bar ","t.\\`FOO ");  end
   // SHOULD(simulator-dependant): Prefix breaks the above
   initial begin : `ESC( xx`FOO )   $write("GOT%%m='%m' EXP='%s'\n", "t.\\xx`FOO ");  end
`undef FOO `undef ESC
   // MUST: Unknown macro not under call with backslash escape doesn't expand
`undef UNKNOWN
   initial begin : \`UNKNOWN   $write("GOT%%m='%m' EXP='%s'\n", "t.\\`UNKNOWN ");   end
   // MUST: Unknown macro not under call doesn't expand
`define DEF_NO_EXPAND  error_dont_expand
   initial begin : \`DEF_NO_EXPAND   $write("GOT%%m='%m' EXP='%s'\n", "t.\\`DEF_NO_EXPAND ");   end
`undef DEF_NO_EXPAND
   // bug441 derivative
   // SHOULD(simulator-dependant): Quotes doesn't prevent arguments from expanding (like backslashes above)
`define STR(name) "foo name baz"
   initial $write("GOT='%s' EXP='%s'\n", `STR(bar), "foo bar baz");
`undef STR
   // RULE: Because there are quotes after substituting STR, the `A does NOT expand
`define STR(name) "foo name baz"
`define A(name) boo name hiss
   initial $write("GOT='%s' EXP='%s'\n", `STR(`A(bar)), "foo `A(bar) baz");
`undef A  `undef STR
   // bug845
`define SLASHED "1//2.3"
   initial $write("Slashed=`%s'\n", `SLASHED);
   // bug915
`define BUG915(a,b,c) \
       $display("%s%s",a,`"b``c``\n`")
   initial `BUG915("a1",b2,c3);
endmodule