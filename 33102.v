module ctu_sync_pulse_check(/*AUTOARG*/
// Inputs
data, lclk, rclk, enable_chk
);
   input data;
   input lclk;
   input rclk;
   input enable_chk;
   parameter setup_clocks = 1 ,
             hold_clocks  = 0;
   time  last_clk;
   time  last_data;
   time  first_edge;
   time  period;
   reg     enable_chk_int;
   always @( posedge rclk)
   begin
   if(enable_chk === 1'b1)
       first_edge = $time;
   end
   always @( negedge rclk)
   begin
     if(enable_chk === 1'b1)
        period = ($time - first_edge) * 2;
   end
  always @ (posedge rclk)
  if( ~enable_chk)
      enable_chk_int <= 1'b0;
  else
      enable_chk_int <= enable_chk;
 always @ (posedge data)
 begin
         if((($time  - last_clk ) < ( setup_clocks * period)) & enable_chk_int
           )
		`ifdef MODELSIM
           $display ( "CTU_mpath_error",
                    "Expect setup time : %t. Actual setup time %t",
                     (setup_clocks * period), ($time  - last_clk ));
		`else
           $error ( "CTU_mpath_error",
                    "Expect setup time : %t. Actual setup time %t",
                     (setup_clocks * period), ($time  - last_clk ));
		`endif
         last_data = $time;
  end
  always @ ( posedge lclk)
  begin
         if( (($time  - last_data) < ( hold_clocks * period)) & enable_chk_int
           )
		`ifdef MODELSIM
           $display ( "CTU_mpath_error",
                    "Expect hold time : %t. Actual hold time %t",
                     (hold_clocks * period), ($time  - last_data ));
		`else
           $error ( "CTU_mpath_error",
                    "Expect hold time : %t. Actual hold time %t",
                     (hold_clocks * period), ($time  - last_data ));
		`endif
         last_clk = $time;
  end
   endmodule