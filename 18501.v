module t (/*AUTOARG*/
	  // Inputs
	  clk
	  );
   input clk;
   integer cyc = 0;
   ifc intf_1(.*);
   ifc intf_2(.*);
   always @(*) begin
      intf_1.value = cyc + 1;
      intf_2.value = cyc + 2;
   end
   sub_struct s1 (.intf_for_struct(intf_1));
   sub_struct s2 (.intf_for_struct(intf_2));
   sub_check c1 (.intf_for_check(intf_1));
   sub_check c2 (.intf_for_check(intf_2));
   sub_all a (.intf_one(intf_1),
              .intf_two(intf_2));
   // Intentionally longer scope name
   sub_all abcdefghijklmnopqrstuvwxyz (.intf_one(intf_2),
              .intf_two(intf_1));
   always @ (posedge clk) begin
      cyc <= cyc + 1;
      if (cyc==20) begin
	 if (intf_1.value != 21) $stop;
	 if (intf_2.value != 22) $stop;
	 $write("*-* All Finished *-*\n");
	 $finish;
      end
   end
endmodule