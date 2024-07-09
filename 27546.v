module tsk (/*AUTOARG*/
   // Inputs
   clk, toggle
   );
   input clk;
   input toggle;
   /* verilator public_module */
   always @ (posedge clk) begin
      center_task(1'b0);
   end
   task center_task;
      input external;
      begin
	 if (toggle) begin
	    // CHECK_COVER(-1,"top.t.t1",1)
	 end
	 if (external) begin
	    // CHECK_COVER(-1,"top.t.t1",1)
	    $write("[%0t] Got external pulse\n", $time);
	 end
      end
   endtask
endmodule