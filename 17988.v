module";
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
      $write("%%Info: Checking results\n");
      if (onebit != 1'b1) $stop;
      if (quads[2] != 62'h12819213_abd31a1c) $stop;
      if (quads[3] != 62'h1c77bb9b_3784ea09) $stop;
      if (text_byte != "A") $stop;
      if (text_half != "T2") $stop;
      if (text_word != "Tree") $stop;
      if (text_long != "44Four44") $stop;
      if (text != "lorem ipsum") $stop;
   end
   always @(posedge clk) begin
      count <= count + 2;
      if (count[1])
	half_count <= half_count + 2;
      if (count == 1000) begin
	 $write("*-* All Finished *-*\n");
	 $finish;
      end
   end
   genvar i;
   generate
   for (i=1; i<=128; i=i+1) begin : arr
     arr #(.LENGTH(i)) arr();
   end endgenerate
endmodule