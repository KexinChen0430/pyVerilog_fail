module
  mode_cfg = create_cfg (LA_STOP,1'b0,STOP);
  loopback_en = 1;
  fifo_en = 1;
  `send_link_config
  // activating transmission
  mode_cfg = create_cfg (NORMAL,1'b0,NORM);
  `send_link_config
  // based on valid-credit protocol, sending 16 data values
  valid_to_meso = 1'b1;
  #(400+16*send_division_lp*2*`half_period)
  valid_to_meso = 1'b0;
  // some time for the internal loopback simulation to finish
  #10000
  $display("\n*****************************");
  $display("Normal I/O mode");
  $display("*****************************\n\n");
  $display({"cycle\t to_chip\t  from_chip crdt_counter elem_in_fifo",
            "to_core,v,r from_core,v,r"});
  $monitor("@%t %b\t  %b\t %d\t %d\t\t %b,%b,%b  %b,%b,%b",$time,to_meso
      ,from_meso_fixed, DUT.mesosync_core.output_credit_counter.credit_cnt,
      DUT.mesosync_core.input_fifo.fifo.wptr_r-DUT.mesosync_core.input_fifo.fifo.rptr_r,
      data_to_core,valid_to_core,ready_from_core,
      data_from_core,valid_from_core,ready_to_core);
   // Outer loop simulation same as internal one, with loopback disabled
  mode_cfg = create_cfg (LA_STOP,1'b0,STOP);
  loopback_en = 0;
  `send_link_config
  // activating transmission
  mode_cfg = create_cfg (NORMAL,1'b0,NORM);
  `send_link_config
  valid_to_meso = 1'b1;
  #(400+16*send_division_lp*2*`half_period)
  valid_to_meso = 1'b0;
  // some time for the internal loopback simulation to finish
  #10000
  $finish;
end
always begin
  #`half_period clk = 1'b0;
  #`half_period clk = 1'b1;
end
always begin
  #(3*`half_period) cfg_clk = 1'b0;
  #(3*`half_period) cfg_clk = 1'b1;
end
always begin
  #(send_division_lp*`half_period) send_clk = 1'b0;
  #(send_division_lp*`half_period) send_clk = 1'b1;
end
always begin
  #(receive_division_lp*`half_period) receive_clk = 1'b0;
  #(receive_division_lp*`half_period) receive_clk = 1'b1;
end
// registering the reset signal
always_ff @(posedge clk)
  reset_r <= reset;
// Generating delays on input and output lines and the fixed delay
// line from the channel
genvar ii;
generate
  for (ii=0; ii< bit_num_p; ii = ii + 1) begin: delay_block
    assign #(ii*1+2) to_meso_delayed[ii]   = to_meso[ii];
    assign #(8-ii)     from_meso_delayed[ii] = from_meso[ii];
    assign #(24+ii)    from_meso_fixed[ii]   = from_meso_delayed[ii];
  end
endgenerate
assign pat_out       = (pattern[0] << la_output_bit_selector);
assign loopback_data = {count, credit_to_meso, valid_to_meso};
assign to_meso = (out_selector == 2) ? loopback_data :
                ((out_selector == 1) ? pat_out : 0);
always_ff @ (posedge send_clk or posedge reset) begin
  if (reset) begin
    pattern  <= 8'b10100101;
    count    <= 0;
  end else begin
    pattern  <= {pattern[6:0],pattern[7]};
    count    <= count + 4'd1;
  end
end
always_ff @ (posedge receive_clk or posedge reset) begin
  if (reset) begin
    in_reg_1 <= 0;
    in_reg_2 <= 0;
  end else begin
    in_reg_1 <= {in_reg_1[254:0],from_meso_fixed[la_output_bit_selector]};
    in_reg_2 <= {in_reg_2[254:0],from_meso_fixed[v_output_bit_selector]};
  end
end
//credit count is based on output clock, but token send is based on input clock
// so we need a flag to do it
// Credit counter, it would set a flag for sending a token
always_ff @ (posedge receive_clk or posedge reset) begin
  if (reset) begin
    credit_count <= 0;
    token_flag  <= 0;
  end else begin
    //if valid data received and we are in normal mode
    // (during sending command to change from normal to stop mode, we would still receive
    // data which is valid, so if there was valid data and stop mode it counts)
    if (from_meso_fixed[0] & ((mode_cfg.output_mode==NORM)|(mode_cfg.output_mode==STOP)))
      if (credit_count == 3) begin
        credit_count <= 0;
        token_flag  <= 1;
      end else begin
        credit_count <= credit_count + 1;
        token_flag  <= 0;
      end
    else
      token_flag  <= 0;
  end
end
// sending the token after the flag is set, only for a cycle
always_ff @ (posedge send_clk or posedge reset) begin
  if (reset) begin
    credit_to_meso <= 0;
    token_sent_flag <= 0;
  end else begin
    if (token_flag & ~token_sent_flag)
      credit_to_meso <= 1;
    else
      credit_to_meso <= 0;
    if (token_flag & ~token_sent_flag)
      token_sent_flag <= 1;
    else if (~token_flag)
      token_sent_flag <= 0;
  end
end
function mode_cfg_s create_cfg(input input_mode_e in_mode,
                               input LA_enque, output_mode_e out_mode);
    create_cfg =
           '{input_mode:  in_mode
            ,LA_enque:    LA_enque
            ,output_mode: out_mode
            };
endfunction
endmodule