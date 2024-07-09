module sub ();
   function integer get_element;
      input integer index;
      input integer array_arg[7:0];
      get_element = array_arg[index];
   endfunction
   parameter integer IDX = 5;
   parameter integer CHK = 5;
   localparam integer array[0:7] = '{10, 11, 12, 13, 14, 15, 16, 17};
   localparam element1 = array[IDX];
   localparam elementf = get_element(IDX, array);
   initial begin
      `checkh (element1, CHK);
      `checkh (elementf, CHK);
   end
endmodule