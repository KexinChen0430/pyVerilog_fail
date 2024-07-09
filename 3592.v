module hidden_checks;
   typedef int T;
   sub (.T(123));  // Different T
   task hidden;
      typedef bit T;  // Different T
   endtask
endmodule