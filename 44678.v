module will print DEBUG ENABLED / DEBUG
   // DISABLED. No messages are printed if a state change does not
   // occur.
   function void bsg_dpi_debug(input bit switch_i);
      if(!debug_b & switch_i)
        $display("BSG DBGINFO (%M@%t): DEBUG ENABLED", $time);
      else if (debug_b & !switch_i)
        $display("BSG DBGINFO (%M@%t): DEBUG DISABLED", $time);
      debug_b = switch_i;
   endfunction
   // Get the value of an input pin at the given index.
   // Fails if an invalid index is accessed
   function bit bsg_dpi_gpio_get(input int index);
      bit retval;
      if(~init_b)
         $fatal(1, "BSG ERROR (%M): get() called before init()");
      if(~use_input_p)
         $fatal(1, "BSG ERROR (%M): get() called but use_input_p is 0");
      if(index >= width_p)
         $fatal(1, "BSG ERROR (%M): Invalid index %d", index);
      retval = gpio_i[index];
      if(debug_b)
        $display("BSG INFO (%M): Read Index %d, got %b", index, retval);
      return retval;
   endfunction
   // Set the value of an output pin at the given index.
   // Fails if an invalid index is accessed
   function bit bsg_dpi_gpio_set(input int index, input bit value);
      if(~init_b)
         $fatal(1, "BSG ERROR (%M): get() called before init()");
      if(~use_output_p)
         $fatal(1, "BSG ERROR (%M): get() called but use_output_p is 0");
      if(index >= width_p)
         $fatal(1, "BSG ERROR (%M): Invalid index %d", index);
      gpio_o[index] = value;
      if(debug_b)
        $display("BSG INFO (%M): Wrote Index %d, set to %b", index, value);
      return gpio_o[index];
   endfunction
endmodule