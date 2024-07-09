module two_phase_event_gen (/*AUTOARG*/
   // Outputs
   req,
   // Inputs
   run, ack
   );
   input run;
   output req;
   input ack;
   parameter spread=200;
   /*AUTOINPUT*/
   /*AUTOOUTPUT*/
   /*AUTOREG*/
   /*AUTOWIRE*/
   reg   req;
   task handshake_2ph_rise;
      begin
         wait(ack === 1'b0);
         req <= 1'b1;
         wait(ack === 1'b1);
      end
   endtask
   task handshake_2ph_fall;
      begin
         wait(ack === 1'b1);
         req = 1'b0;
         wait(ack === 1'b0);
      end
   endtask
   initial begin
      req <= 0;
      #1;
      while(1) begin
         wait(run===1'b1);
         #($unsigned($random) % spread);
         handshake_2ph_rise();
         #($unsigned($random) % spread);
         handshake_2ph_fall();
      end
   end
endmodule