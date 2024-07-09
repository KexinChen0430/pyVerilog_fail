module t (/*AUTOARG*/
   // Inputs
   input clk                            `PUBLIC_FLAT_RD,
   // test ports
   input  [15:0]        testin          `PUBLIC_FLAT_RD,
   output [23:0]        testout     `PUBLIC_FLAT_RW
   );
`ifdef VERILATOR
`systemc_header
extern "C" int mon_check();
`verilog
`endif
   reg          onebit          `PUBLIC_FLAT_RW;
   reg [2:1]    twoone          `PUBLIC_FLAT_RW;
   reg          onetwo [1:2]    `PUBLIC_FLAT_RW;
   reg [2:1]    fourthreetwoone[4:3] `PUBLIC_FLAT_RW;
   integer      status;
`ifdef iverilog
   // stop icarus optimizing signals away
   wire 	redundant = onebit | onetwo[1] | twoone | fourthreetwoone[3];
`endif
   wire         subin  `PUBLIC_FLAT_RD;
   wire         subout `PUBLIC_FLAT_RD;
   sub sub(.*);
   // Test loop
   initial begin
`ifdef VERILATOR
      status = $c32("mon_check()");
`endif
`ifdef iverilog
     status = $mon_check();
`endif
`ifndef USE_VPI_NOT_DPI
     status = mon_check();
`endif
      if (status!=0) begin
	 $write("%%Error: t_vpi_var.cpp:%0d: C Test failed\n", status);
	 $stop;
      end
      $write("*-* All Finished *-*\n");
      $finish;
   end
endmodule