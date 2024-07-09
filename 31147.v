module bug777 (clk, ifport);
   input clk;
   if_bug777 ifport ();
   if_bug777.mp ifportmp;
   //if_bug777.mp ifportmp ();  // Not legal
   // Currently unsupported, parens required so VP knows is instance
   //if_bug777 ifport;
endmodule