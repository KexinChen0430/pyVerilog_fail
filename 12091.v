module were
   // read from.
   // 1 if read from X.
   // 0 if read from Y.
   wire 					readbuf_switch_z;
   // Delayed content of readbuf_swith_z;
   reg                      readbuf_switch_z_last;
   // Delayed content of out1_addr_z_old since we need to use
   // it after it may have changed.
   reg [NLOG2-1:0]          out1_addr_z_old;
   // The address to write the currently received BF output.
   wire [NLOG2-1:0]         out_addr_z;
   assign out_addr_z = (z_nd)?out0_addr_z:out1_addr_z_old;
   // A delayed z_nd.  Tells us when to expect ZB.
   reg                      z_nd_last;
   // For delaying variables.  It takes 2 steps to write the output data
   // to the buffer at which point we decide whether to write the data
   // to bufferout.  These registers are needed for that decision.
   reg                      finished_z_old[1:0];
   reg                      last_stage_z_old[0:0];
   reg                      readbuf_switch_z_old[1:0];
   initial
     begin
        bufferout_full_A <= 1'b0;
        z_nd_last <= 1'b0;
     end
   always @ (posedge clk or negedge rst_n)
	 begin
		if (!rst_n)
		  begin
             bufferout_full_A <= 1'b0;
             z_nd_last <= 1'b0;
          end
        else
          begin
             // Put updated reset here so we drive it from same process.
             if ((fsm_state == FSM_ST_CALC) & (&(out1_addr)))
               begin
                  if (readbuf_switch)
                    updatedX <= {N{1'b0}};
                  else
                    updatedY <= {N{1'b0}};
               end
             // Set all the delays.
             readbuf_switch_z_last <= readbuf_switch_z;
             finished_z_old[0] <= finished_z;
             finished_z_old[1] <= finished_z_old[0];
             last_stage_z_old[0] <= last_stage_z;
             readbuf_switch_z_old[0] <= readbuf_switch_z;
             readbuf_switch_z_old[1] <= readbuf_switch_z_old[0];
             out1_addr_z_old <= out1_addr_z;
             z_nd_last <= z_nd;
             if (finished_z_old[1])
               // We have filled the output buffer
               bufferout_full_A <= ~bufferout_full_A;
             // Write received data to the buffers and set updated flag.
             if (z_nd | z_nd_last)
               begin
                  if ((last_stage_z & z_nd)|(last_stage_z_old[0] & ~z_nd))
                    begin
                       bufferout[out_addr_z] <= z;
                    end
		          else
                    begin
                       if ((readbuf_switch_z & z_nd)|(readbuf_switch_z_old[0] & ~z_nd))
                         begin
		                    bufferY[out_addr_z] <= z;
                            updatedY[out_addr_z] <= 1'b1;
                         end
		               else
                         begin
		                    bufferX[out_addr_z] <= z;
                            updatedX[out_addr_z] <= 1'b1;
                         end
                    end
               end
          end
     end
   /* Instantiate twiddle factor unit. */
   twiddlefactors
     twiddlefactors_0 (
                       .clk (clk),
                       .addr (tf_addr),
                       .addr_nd (tf_addr_nd),
                       .tf_out (tf)
                       );
   /* Instantiate the generic butterfly unit. */
   butterfly #(
		.M_WDTH   (3 + 2*NLOG2),
		.X_WDTH   (X_WDTH)
		)
   butterfly_0 (
				 .clk      (clk),
				 .rst_n    (rst_n),
				 .m_in     ({readbuf_switch_old, out0_addr, out1_addr, finished, last_stage}),
				 .w        (tf),
				 .xa       (in0),
				 .xb       (in1),
				 .x_nd     (x_nd),
				 .m_out    ({readbuf_switch_z, out0_addr_z, out1_addr_z, finished_z, last_stage_z}),
				 .y        (z),
				 .y_nd     (z_nd)
				 );
endmodule