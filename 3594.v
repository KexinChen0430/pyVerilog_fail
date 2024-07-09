module bugas;
   initial begin
      ASSERT_CHK: assert (0) else $error("%m -- not allowed %d", 0);
   end
endmodule