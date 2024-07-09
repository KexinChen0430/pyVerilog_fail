module
// This file ONLY is placed into the Public Domain, for any use,
// without warranty, 2000-2011 by Wilson Snyder.
//===========================================================================
// Includes
`include "t_preproc_inc2.vh"
//===========================================================================
// Comments
/* verilator pass_thru comment */
// verilator pass_thru_comment2
//===========================================================================
// Defines
`define DEF_A3
`define DEF_A1
// DEF_A0 set by command line
   wire [3:0] q = {
		   `ifdef DEF_A3 1'b1 `else 1'b0 `endif ,
		   `ifdef DEF_A2 1'b1 `else 1'b0 `endif ,
		   `ifdef DEF_A1 1'b1 `else 1'b0 `endif ,
		   `ifdef DEF_A0 1'b1 `else 1'b0 `endif
		   };
text.
`define FOOBAR  foo /*this */ bar   /* this too */
`define FOOBAR2  foobar2 // but not
`FOOBAR
`FOOBAR2
`define MULTILINE first part \
  		second part \
  		third part
`define MOREMULTILINE {\
		       a,\
		       b,\
		       c}
/*******COMMENT*****/
`MULTILINE
`MOREMULTILINE
Line_Preproc_Check `__LINE__
//===========================================================================
`define syn_negedge_reset_l or negedge reset_l
`define DEEP deep
`define DEEPER `DEEP `DEEP
`DEEPER
`define nosubst NOT_SUBSTITUTED
`define WITHTICK "`nosubst"
"Inside: `nosubst"
`WITHTICK
`define withparam(a, b) a b LLZZ a b
`withparam(x,y)
`withparam(`withparam(p,q),`withparam ( r , s ))
`withparam(firstline
	,
	comma","line)
`define withquote(a, bar) a bar LLZZ "a" bar
`withquote( x , y)  // Simulators disagree here; some substitute "a" others do not
`define noparam (a,b)
`noparam(a,b)
`define msg(x,y) `"x: `\`"y`\`"`"
$display(`msg(left side, right side))
`define foo(f) f``_suffix
`foo(bar)  more
`define zap(which)   \
	$c("Zap(\"",which,"\");");
`zap(bug1);
`zap("bug2");
/* Define inside comment: `DEEPER and `WITHTICK */
// More commentary: `zap(bug1); `zap("bug2");
//======================================================================
// display passthru
`define ls left_side
`define rs right_side
`define noarg  na
`define thru(x) x
`define thruthru `ls `rs	// Doesn't expand
`define msg(x,y) `"x: `\`"y`\`"`"
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
      $display(`msg(`thru(),));  // Empty
      $display(`msg(`thru(left side),`thru(right side)));
      $display(`msg( `thru( left side ) , `thru( right side ) ));
      $display(`"standalone`");
      // Unspecified when the stringification has multiple lines
`define twoline first \
      second
      $display(`msg(twoline, `twoline));
      //$display(`msg(left side, \ right side \ ));  // Not sure \{space} is legal.
      $write("*-* All Finished *-*\n");
      $finish;
   end
endmodule