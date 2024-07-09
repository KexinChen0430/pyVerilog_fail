module t (/*AUTOARG*/
   // Inputs
   clk
   );
   input clk;
   typedef enum {
		 E01 = 'h1,
		 ELARGE = 'hf00d
		 } my_t;
   integer 	cyc=0;
   my_t e;
   string all;
   // Check runtime
   always @ (posedge clk) begin
      cyc <= cyc + 1;
      if (cyc==0) begin
	 // Setup
	 e <= E01;
      end
      else if (cyc==1) begin
	 `checks(e.name, "E01");
	 `checkh(e.next, ELARGE);
	 e <= ELARGE;
      end
      else if (cyc==3) begin
	 `checks(e.name, "ELARGE");
	 `checkh(e.next, E01);
	 `checkh(e.prev, E01);
	 e <= E01;
      end
      else if (cyc==20) begin
	 e <= 'h11; // Unknown
      end
      else if (cyc==20) begin
	 `checks(e.name, ""); // Unknown
      end
      else if (cyc==99) begin
	 $write("*-* All Finished *-*\n");
	 $finish;
      end
   end
endmodule