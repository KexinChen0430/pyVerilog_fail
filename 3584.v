module imp_test_mod3
  ( input imp_test_pkg::word_t wordin );
   localparam FROM_FUNC = imp_test_pkg::afunc(1);
endmodule