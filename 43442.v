module sub (input int inst);
   export "DPI-C" function dpix_sub_inst;
   function int dpix_sub_inst (int i);  dpix_sub_inst  = inst + i;   endfunction
endmodule