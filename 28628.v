module stratixii_asynch_io (
                            datain,
                            oe,
                            regin,
                            ddioregin,
                            padio,
                            delayctrlin,
                            offsetctrlin,
                            dqsupdateen,
                            dqsbusout,
                            combout,
                            regout,
                            ddioregout
                           );
   input datain;
   input oe;
   input regin;
   input ddioregin;
   input [5:0] delayctrlin;
   input [5:0] offsetctrlin;
   input       dqsupdateen;
   output      dqsbusout;
   output combout;
   output regout;
   output ddioregout;
   inout  padio;
   parameter operation_mode = "input";
   parameter bus_hold = "false";
   parameter open_drain_output = "false";
   parameter dqs_input_frequency = "10000 ps";
   parameter dqs_out_mode = "none";
   parameter dqs_delay_buffer_mode = "low";
   parameter dqs_phase_shift = 0;
   parameter dqs_offsetctrl_enable = "false";
   parameter dqs_ctrl_latches_enable = "false";
   parameter dqs_edge_detect_enable = "false";
   parameter sim_dqs_intrinsic_delay = 0;
   parameter sim_dqs_delay_increment = 0;
   parameter sim_dqs_offset_increment = 0;
   parameter gated_dqs = "false";
   reg buf_control;
   reg prev_value;
   reg tmp_padio;
   tri padio_tmp;
   reg tmp_combout;
   reg combout_tmp;
   reg tmp_dqsbusout;
   wire dqsbusout_tmp;
   reg [1:0] iop_mode;
   integer dqs_delay;
   integer tmp_delayctrl;
   integer tmp_offsetctrl;
   wire    dqs_ctrl_latches_ena;
   reg     para_dqs_ctrl_latches_enable;
   reg     para_dqs_offsetctrl_enable;
   reg     para_dqs_edge_detect_enable;
   wire [5:0] delayctrlin_in;
   wire [5:0] offsetctrlin_in;
   wire datain_in;
   wire oe_in;
   wire dqsupdateen_in;
   wire delayctrlin_in0;
   wire delayctrlin_in1;
   wire delayctrlin_in2;
   wire delayctrlin_in3;
   wire delayctrlin_in4;
   wire delayctrlin_in5;
   wire offsetctrlin_in0;
   wire offsetctrlin_in1;
   wire offsetctrlin_in2;
   wire offsetctrlin_in3;
   wire offsetctrlin_in4;
   wire offsetctrlin_in5;
   buf(datain_in, datain);
   buf(oe_in, oe);
   buf(dqsupdateen_in, dqsupdateen);
   buf(delayctrlin_in0, delayctrlin[0]);
   buf(delayctrlin_in1, delayctrlin[1]);
   buf(delayctrlin_in2, delayctrlin[2]);
   buf(delayctrlin_in3, delayctrlin[3]);
   buf(delayctrlin_in4, delayctrlin[4]);
   buf(delayctrlin_in5, delayctrlin[5]);
   buf(offsetctrlin_in0, offsetctrlin[0]);
   buf(offsetctrlin_in1, offsetctrlin[1]);
   buf(offsetctrlin_in2, offsetctrlin[2]);
   buf(offsetctrlin_in3, offsetctrlin[3]);
   buf(offsetctrlin_in4, offsetctrlin[4]);
   buf(offsetctrlin_in5, offsetctrlin[5]);
   assign delayctrlin_in = {delayctrlin_in5, delayctrlin_in4,
                            delayctrlin_in3, delayctrlin_in2,
							delayctrlin_in1, delayctrlin_in0};
   assign offsetctrlin_in = {offsetctrlin_in5, offsetctrlin_in4,
                             offsetctrlin_in3, offsetctrlin_in2,
							 offsetctrlin_in1, offsetctrlin_in0};
   // convert string to integer with sign
   function integer str2int;
      input [8*16:1] s;
      reg [8*16:1] reg_s;
      reg [8:1] digit;
      reg [8:1] tmp;
      integer m, magnitude;
      integer sign;
      begin
         sign = 1;
         magnitude = 0;
         reg_s = s;
         for (m=1; m<=16; m=m+1)
           begin
              tmp = reg_s[128:121];
              digit = tmp & 8'b00001111;
              reg_s = reg_s << 8;
              // Accumulate ascii digits 0-9 only.
              if ((tmp>=48) && (tmp<=57))
                magnitude = (magnitude * 10) + digit;
              if (tmp == 45)
                sign = -1;  // Found a '-' character, i.e. number is negative.
           end
         str2int = sign*magnitude;
      end
   endfunction
   specify
      (padio => combout) = (0,0);
      (datain => padio) = (0, 0);
      (posedge oe => (padio +: padio_tmp)) = (0, 0);
      (negedge oe => (padio +: 1'bz)) = (0, 0);
      (ddioregin => ddioregout) = (0, 0);
      (regin => regout) = (0, 0);
	  (padio => dqsbusout) = (0, 0);
	  (regin => dqsbusout) = (0, 0);
   endspecify
   initial
   begin
      prev_value = 'b0;
      tmp_padio = 'bz;
      if (operation_mode == "input")
         iop_mode = 0;
      else if (operation_mode == "output")
         iop_mode = 1;
      else if (operation_mode == "bidir")
         iop_mode = 2;
      else
      begin
         $display ("Error: Invalid operation_mode specified\n");
         $display ("Time: %0t  Instance: %m", $time);
         iop_mode = 3;
      end
      dqs_delay = 0;
      tmp_delayctrl = 0;
      tmp_offsetctrl = 0;
      para_dqs_ctrl_latches_enable = dqs_ctrl_latches_enable == "true" ? 1'b1 : 1'b0;
      para_dqs_offsetctrl_enable = dqs_offsetctrl_enable == "true" ? 1'b1 : 1'b0;
      para_dqs_edge_detect_enable = dqs_edge_detect_enable == "true" ? 1'b1 : 1'b0;
   end
   assign dqs_ctrl_latches_ena = dqs_ctrl_latches_enable == "false" ? 1'b1 :
                                 dqs_edge_detect_enable == "false" ? dqsupdateen_in :
                                 (~(combout_tmp ^ tmp_dqsbusout) & dqsupdateen_in);
   always @(delayctrlin_in or offsetctrlin_in or dqs_ctrl_latches_ena)
   begin
      tmp_delayctrl  = (dqs_delay_buffer_mode == "high" && delayctrlin_in[5] == 1'b1) ? 31 : delayctrlin_in;
      tmp_offsetctrl = (para_dqs_offsetctrl_enable == 1'b0) ? 0 :
                       (dqs_delay_buffer_mode == "high" && offsetctrlin_in[5] == 1'b1) ? 31 : offsetctrlin_in;
      if (dqs_ctrl_latches_ena === 1'b1)
	     dqs_delay = sim_dqs_intrinsic_delay + sim_dqs_delay_increment*tmp_delayctrl + sim_dqs_offset_increment*tmp_offsetctrl;
      if (dqs_delay_buffer_mode == "high" && delayctrlin_in[5] == 1'b1)
      begin
         $display($time, " Warning: delayctrlin of DQS I/O instannce %m exceeds a 5-bit range in high-frequency mode.");
      end
      if (dqs_delay_buffer_mode == "high" && offsetctrlin_in[5] == 1'b1)
      begin
         $display($time, " Warning: offsetctrlin of DQS I/O instannce %m exceeds a 5-bit range in high-frequency mode.");
      end
   end
    always @(datain_in or oe_in or padio)
    begin
        if (bus_hold == "true" )
        begin
            buf_control = 'b1;
            if (iop_mode == 0)
            begin
                if (padio == 1'bz)
                    tmp_combout = prev_value;
                else
                begin
                    prev_value = padio;
                    tmp_combout = padio;
                end
                tmp_padio = 1'bz;
            end
            else
            begin
                if (iop_mode == 1 || iop_mode == 2) // output or bidir
                begin
                    if ( oe_in == 1)
                    begin
                        if ( open_drain_output == "true" )
                        begin
                            if (datain_in == 0)
                            begin
                                tmp_padio =  1'b0;
                                prev_value = 1'b0;
                            end
                            else if (datain_in == 1'bx)
                            begin
                                tmp_padio = 1'bx;
                                prev_value = 1'bx;
                            end
                            else   // output of tri is 'Z'
                            begin
                                if (iop_mode == 2) // bidir
                                    prev_value = padio;
                                tmp_padio = 1'bz;
                            end
                        end
                        else  // open drain_output = false;
                        begin
                            tmp_padio = datain_in;
                            prev_value = datain_in;
                        end
                    end
                    else if ( oe_in == 0 )
                    begin
                        if (iop_mode == 2) // bidir
                            prev_value = padio;
                        tmp_padio = 1'bz;
                    end
                    else   // oe == 'X'
                    begin
                       tmp_padio = 1'bx;
                       prev_value = 1'bx;
                    end
                end
                if (iop_mode == 1) // output
                    tmp_combout = 1'bz;
                else
                    tmp_combout = padio;
            end
        end
        else    // bus hold is false
        begin
            buf_control = 'b0;
            if (iop_mode == 0) // input
            begin
                tmp_combout = padio;
            end
            else if (iop_mode == 1 || iop_mode == 2) // output or bidir
            begin
                if (iop_mode  == 2) // bidir
                    tmp_combout = padio;
                if ( oe_in == 1 )
                begin
                    if ( open_drain_output == "true" )
                    begin
                        if (datain_in == 0)
                            tmp_padio = 1'b0;
                        else if ( datain_in == 1'bx)
                            tmp_padio = 1'bx;
                        else
                            tmp_padio = 1'bz;
                    end
                    else
                        tmp_padio = datain_in;
                end
                else if ( oe_in == 0 )
                    tmp_padio = 1'bz;
                else
                    tmp_padio = 1'bx;
            end
            else
            begin
                $display ("Error: Invalid operation_mode specified in stratixii io atom!\n");
                $display ("Time: %0t  Instance: %m", $time);
            end
        end
        combout_tmp <= tmp_combout;
        tmp_dqsbusout <= #(dqs_delay) tmp_combout;
   end
   assign dqsbusout_tmp = gated_dqs == "true" ? (tmp_dqsbusout & regin) : tmp_dqsbusout;
   bufif1 (weak1, weak0) b(padio_tmp, prev_value, buf_control);  //weak value
   pmos (padio_tmp, tmp_padio, 'b0);
   pmos (combout, combout_tmp, 'b0);
   pmos (dqsbusout, dqsbusout_tmp, 'b0);
   pmos (padio, padio_tmp, 'b0);
   and (regout, regin, 1'b1);
   and (ddioregout, ddioregin, 1'b1);
endmodule