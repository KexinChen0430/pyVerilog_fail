module t ();
   sub a (.inst(1));
   sub b (.inst(2));
   initial begin
      a.test1;
      b.test1;
      a.test2;
      b.test2;
      $write("*-* All Finished *-*\n");
      $finish;
   end
endmodule