module sub_all
  (
   ifc intf_one,
   ifc intf_two
   );
`ifdef NO_INLINE_B
   //verilator no_inline_module
`endif
   ifc intf_in_sub_all (
			.clk(intf_one.clk),
			.cyc(intf_one.cyc)
			);
   assign intf_in_sub_all.value = intf_one.value + 1000;
   sub_check ac1 (.intf_for_check(intf_one));
   sub_check ac2 (.intf_for_check(intf_two));
   sub_struct as3 (.intf_for_struct(intf_in_sub_all));
   sub_check ac3 (.intf_for_check(intf_in_sub_all));
endmodule