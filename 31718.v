module bsg_nonsynth_dpi_clock_gen
  #(parameter `BSG_INV_PARAM(longint cycle_time_p)
    )
   (
    output bit o
    );
   int         id;
   string      hierarchy;
   import "DPI-C" function int bsg_dpi_clock_gen_register(input longint cycle_time_p, input string hierarchy);
   localparam longint cycle_time_lp = {32'b0, cycle_time_p[31:0]};
   if(cycle_time_p % 2 != 0)
     $fatal(1, "BSG ERROR (%M): cycle_time_p must be divisible by 2");
   if(cycle_time_p <= 0)
     $fatal(1, "BSG ERROR (%M): cycle_time_p must be greater than 0");
   initial begin
      $display("BSG INFO: bsg_nonsynth_dpi_clock_gen (initial begin)");
      $display("BSG INFO:     Instantiation: %M");
      $display("BSG INFO:     cycle_time_p  = %d", cycle_time_p);
      hierarchy = $sformatf("%m");
      id = bsg_dpi_clock_gen_register(cycle_time_lp, hierarchy);
   end
   export "DPI-C" function bsg_dpi_clock_gen_set_level;
   function bit bsg_dpi_clock_gen_set_level(bit clkval);
      o = clkval;
      return o;
   endfunction;
endmodule