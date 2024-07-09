module two_phase_slave (/*AUTOARG*/
   // Outputs
   ack,
   // Inputs
   req
   );
   input req;
   output ack;
   parameter spread=200;
   /*AUTOINPUT*/
   /*AUTOOUTPUT*/
   /*AUTOREG*/
   /*AUTOWIRE*/
   reg    ack;
   event  evt_dbg_1;
   event  evt_dbg_2;
   always @(posedge req) begin
      if(ack == 1'b1) begin
         $display("-E- Protocol violation (posedge req while ack == 1)");
         $finish(1);
      end
      else begin
         #($unsigned($random) % 200);
         ack <= 1'b1;
      end
   end
   always @(negedge req) begin
      if(ack == 1'b0) begin
         $display("-E- Protocol violation (negedge req while ack == 0)");
         $finish(1);
      end
      else begin
         #($unsigned($random) % 200);
         ack <= 1'b0;
      end
   end
endmodule