module t (/*AUTOARG*/
   // Inputs
   clk
   );
   input clk;
   typedef struct packed {
      union packed {
	 logic 	  ua;
	 logic 	  ub;
      } u;
      logic b;
   } str_t;
   reg 	 toggle; initial toggle='0;
   str_t stoggle; initial stoggle='0;
   const reg aconst = '0;
   reg [1:0][1:0] ptoggle; initial ptoggle=0;
   integer cyc; initial cyc=1;
   wire [7:0] cyc_copy = cyc[7:0];
   wire       toggle_up;
   alpha a1 (/*AUTOINST*/
	     // Outputs
	     .toggle_up			(toggle_up),
	     // Inputs
	     .clk			(clk),
	     .toggle			(toggle),
	     .cyc_copy			(cyc_copy[7:0]));
   alpha a2 (/*AUTOINST*/
	     // Outputs
	     .toggle_up			(toggle_up),
	     // Inputs
	     .clk			(clk),
	     .toggle			(toggle),
	     .cyc_copy			(cyc_copy[7:0]));
   beta  b1 (/*AUTOINST*/
	     // Inputs
	     .clk			(clk),
	     .toggle_up			(toggle_up));
   off   o1 (/*AUTOINST*/
	     // Inputs
	     .clk			(clk),
	     .toggle			(toggle));
   reg [1:0]  memory[121:110];
   reg [1023:0] largeish;
   // CHECK_COVER_MISSING(-1)
   always @ (posedge clk) begin
      if (cyc!=0) begin
	 cyc <= cyc + 1;
	 memory[cyc + 'd100] <= memory[cyc + 'd100] + 2'b1;
	 toggle <= '0;
	 stoggle.u <= toggle;
	 stoggle.b <= toggle;
	 ptoggle[0][0] <= toggle;
	 if (cyc==3) begin
	    toggle <= '1;
	 end
	 if (cyc==4) begin
	    toggle <= '0;
	 end
	 else if (cyc==10) begin
	    $write("*-* All Finished *-*\n");
	    $finish;
	 end
      end
   end
endmodule