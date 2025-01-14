module t;
   wire d1 = 1'b1;
   wire d2 = 1'b1;
   wire d3 = 1'b1;
   wire o1,o2,o3;
   add1 add1 (d1,o1);
   add2 add2 (d2,o2);
`define ls left_side
`define rs right_side
`define noarg  na//note extra space
`define thru(x) x
`define thruthru `ls `rs  // Doesn't expand
`define msg(x,y) `"x: `\`"y`\`"`"
`define left(m,left) m // The 'left' as the variable name shouldn't match the "left" in the `" string
   initial begin
      //$display(`msg( \`, \`));  // Illegal
      $display(`msg(pre `thru(thrupre `thru(thrumid) thrupost) post,right side));
      $display(`msg(left side,right side));
      $display(`msg( left side , right side ));
      $display(`msg( `ls , `rs ));
      $display(`msg( `noarg , `rs ));
      $display(`msg( prep ( midp1 `ls midp2 ( outp ) ) , `rs ));
      $display(`msg(`noarg,`noarg`noarg));
      $display(`msg( `thruthru , `thruthru ));   // Results vary between simulators
      $display(`left(`msg( left side , right side ), left_replaced));
      //$display(`msg( `"tickquoted_left`", `"tickquoted_right`" ));  // Syntax error
`ifndef VCS  // Sim bug - wrong number of arguments, but we're right
      $display(`msg(`thru(),));  // Empty
`endif
      $display(`msg(`thru(left side),`thru(right side)));
      $display(`msg( `thru( left side ) , `thru( right side ) ));
`ifndef NC
      $display(`"standalone`");
`endif
`ifdef VERILATOR
      // Illegal on some simulators, as the "..." crosses two lines
`define twoline first \
 second
      $display(`msg(twoline, `twoline));
`endif
      $display("Line %0d File \"%s\"",`__LINE__,`__FILE__);
      //$display(`msg(left side, \ right side \ ));  // Not sure \{space} is legal.
      $write("*-* All Finished *-*\n");
      $finish;
   end
endmodule