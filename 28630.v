module  stratixii_io_latch (
                               clk,
                               datain,
                               ena,
                               sreset,
                               areset,
                               devclrn,
                               devpor,
                               regout
                              );
   parameter async_reset = 1'bx;
   parameter sync_reset = "none";
   parameter power_up = "low";
   input clk;
   input ena;
   input datain;
   input areset;
   input sreset;
   input devclrn;
   input devpor ;
   output regout;
   reg iregout;
   wire reset;
   wire is_areset_clear;
   wire is_areset_preset;
   reg datain_viol;
   reg sreset_viol;
   reg ena_viol;
   reg violation;
   wire w_violation;
   reg clk_last_value;
   wire clk_in;
   wire idatain;
   wire iareset;
   wire isreset;
   wire iena;
   buf (clk_in, clk);
   buf (idatain, datain);
   buf (iareset, areset);
   buf (isreset, sreset);
   buf (iena, ena);
   buf(w_violation, violation);
   assign reset = devpor && devclrn && !(iareset && async_reset != 1'bx) && (iena);
   assign is_areset_clear = (async_reset == 1'b0)?1'b1:1'b0;
   assign is_areset_preset = (async_reset == 1'b1)?1'b1:1'b0;
   specify
      $setuphold (posedge clk &&& reset, datain, 0, 0, datain_viol) ;
      $setuphold (posedge clk &&& reset, sreset, 0, 0, sreset_viol) ;
      $setuphold (posedge clk &&& reset, ena, 0, 0, ena_viol) ;
      (posedge clk => (regout +: iregout)) = 0 ;
      if (is_areset_clear == 1'b1)
         (posedge areset => (regout +: 1'b0)) = (0,0);
      if ( is_areset_preset == 1'b1)
         (posedge areset => (regout +: 1'b1)) = (0,0);
   endspecify
   initial
   begin
      violation = 0;
      if (power_up == "low")
         iregout = 'b0;
      else if (power_up == "high")
         iregout = 'b1;
      end
   always @ (datain_viol or sreset_viol or ena_viol)
   begin
      violation = 1;
   end
   always @ (idatain or clk_in or posedge iareset or negedge devclrn or negedge devpor or posedge w_violation)
   begin
      if (violation == 1'b1)
      begin
         violation = 0;
         iregout = 1'bx;
      end
      else if (devpor == 'b0)
      begin
         if (power_up == "low")
            iregout = 'b0;
         else if (power_up == "high")
            iregout = 'b1;
      end
      else if (devclrn == 'b0)
         iregout = 'b0;
      else if (async_reset == 1'b0 && iareset == 'b1)
         iregout = 'b0 ;
      else if (async_reset == 1'b1 && iareset == 'b1 )
         iregout = 'b1;
      else if (iena == 'b1 && clk_in == 'b1)
      begin
          if (sync_reset == "clear" && isreset == 'b1)
              iregout = 'b0 ;
          else if (sync_reset == "preset" && isreset == 'b1)
              iregout = 'b1;
         else
              iregout = idatain ;
      end
      clk_last_value = clk_in;
   end
   and (regout, iregout, 'b1) ;
endmodule