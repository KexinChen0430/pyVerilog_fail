module main();
initial
  begin
    int int_darray[];
    real real_darray[];
    bit [63:0] bit_darray[];
    string string_darray[];
    int_darray = new[4];
    int_darray = '{1, 2, 3, 4};
    $display_array(int_darray);
    $increase_array_vals(int_darray);
    real_darray = new[2];
    real_darray = '{2.2, 2.3};
    $increase_array_vals(real_darray);
    $display_array(real_darray);
    bit_darray = new[4];
    bit_darray = '{64'hdeadbeefcafebabe, 64'h0badc0dec0dec0de,
                   64'h0123456789abcdef, 64'hfedcba9876543210};
    $increase_array_vals(bit_darray);
    $display_array(bit_darray);
    string_darray = new[4];
    string_darray = '{"test string", "another one", "yet one more", "the last one"};
    $increase_array_vals(string_darray);
    $display_array(string_darray);
  end
endmodule