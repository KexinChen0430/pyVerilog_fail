module cycloneiii_latch(D, ENA, PRE, CLR, Q);
   input D;
   input ENA, PRE, CLR;
   output Q;
   reg 	  q_out;
   specify
      $setup (D, negedge ENA, 0) ;
      $hold (negedge ENA, D, 0) ;
      (D => Q) = (0, 0);
      (negedge ENA => (Q +: q_out)) = (0, 0);
      (negedge PRE => (Q +: q_out)) = (0, 0);
      (negedge CLR => (Q +: q_out)) = (0, 0);
   endspecify
   wire D_in;
   wire ENA_in;
   wire PRE_in;
   wire CLR_in;
   buf (D_in, D);
   buf (ENA_in, ENA);
   buf (PRE_in, PRE);
   buf (CLR_in, CLR);
   initial
      begin
	 q_out <= 1'b0;
      end
   always @(D_in or ENA_in or PRE_in or CLR_in)
      begin
	 if (PRE_in == 1'b0)
	    begin
	       // latch being preset, preset is active low
	       q_out <= 1'b1;
	    end
	 else if (CLR_in == 1'b0)
	    begin
	       // latch being cleared, clear is active low
	       q_out <= 1'b0;
	    end
	      else if (ENA_in == 1'b1)
		 begin
		    // latch is transparent
		    q_out <= D_in;
		 end
      end
   and (Q, q_out, 1'b1);
endmodule