module instantiations.
  // 32 oscillators each ADDER_WIDTH wide. We want them to run
  // as fast as possible to maximize differences over time.
  // We also only sample the oscillators SAMPLE_CLK_CYCLES number
  // of cycles.
  genvar i;
  generate
    for(i = 0 ; i < 32 ; i = i + 1)
      begin: oscillators
        rosc #(.WIDTH(ADDER_WIDTH)) rosc_array(.clk(clk),
                                     .we(rosc_we[i]),
                                     .reset_n(reset_n),
                                     .opa(opa[(ADDER_WIDTH - 1) : 0]),
                                     .opb(opb[(ADDER_WIDTH - 1) : 0]),
                                     .dout(rosc_dout[i])
                                    );
      end
  endgenerate
  // reg_update
  // Update functionality for all registers in the core.
  // All registers are positive edge triggered with asynchronous
  // active low reset.
  always @ (posedge clk or negedge reset_n)
    begin
      if (!reset_n)
        begin
          ent_shift_reg       <= 32'h00000000;
          entropy_reg         <= 32'h00000000;
          entropy_valid_reg   <= 0;
          bit_ctr_reg         <= 8'h00;
          sample_ctr_reg      <= 8'h00;
          debug_delay_ctr_reg <= 32'h00000000;
          debug_reg           <= 8'h00;
          debug_update_reg    <= 0;
        end
      else
        begin
          sample_ctr_reg   <= sample_ctr_new;
          debug_update_reg <= debug_update;
          if (ent_shift_we)
            begin
              ent_shift_reg <= ent_shift_new;
            end
          if (bit_ctr_we)
            begin
              bit_ctr_reg <= bit_ctr_new;
            end
          if (entropy_we)
            begin
              entropy_reg <= ent_shift_reg;
            end
          if (entropy_valid_we)
            begin
              entropy_valid_reg <= entropy_valid_new;
            end
          if (debug_delay_ctr_we)
            begin
              debug_delay_ctr_reg <= debug_delay_ctr_new;
            end
          if (debug_we)
            begin
              debug_reg <= ent_shift_reg[7 : 0];
            end
         end
    end // reg_update
  // debug_out
  // Logic that updates the debug port.
  always @*
    begin : debug_out
      debug_delay_ctr_new = 32'h00000000;
      debug_delay_ctr_we  = 0;
      debug_we            = 0;
      if (debug_update_reg)
        begin
          debug_delay_ctr_new = debug_delay_ctr_reg + 1'b1;
          debug_delay_ctr_we  = 1;
        end
      if (debug_delay_ctr_reg == DEBUG_DELAY)
        begin
          debug_delay_ctr_new = 32'h00000000;
          debug_delay_ctr_we  = 1;
          debug_we            = 1;
        end
    end
  // entropy_out
  // Logic that implements the random output control. If we have
  // added more than NUM_SHIFT_BITS we raise the entropy_valid flag.
  // When we detect and ACK, the valid flag is dropped.
  always @*
    begin : entropy_out
      bit_ctr_new       = 8'h00;
      bit_ctr_we        = 0;
      entropy_we        = 0;
      entropy_valid_new = 0;
      entropy_valid_we  = 0;
      if (bit_ctr_inc)
        begin
          if (bit_ctr_reg < NUM_SHIFT_BITS)
            begin
              bit_ctr_new = bit_ctr_reg + 1'b1;
              bit_ctr_we  = 1;
            end
          else
            begin
              entropy_we        = 1;
              entropy_valid_new = 1;
              entropy_valid_we  = 1;
            end
        end
      if (entropy_ack)
        begin
          bit_ctr_new       = 8'h00;
          bit_ctr_we        = 1;
          entropy_valid_new = 0;
          entropy_valid_we  = 1;
        end
    end
  // entropy_gen
  // Logic that implements the actual entropy bit value generator
  // by XOR mixing the oscillator outputs. These outputs are
  // sampled once every SAMPLE_CLK_CYCLES.
  always @*
    begin : entropy_gen
      reg ent_bit;
      bit_ctr_inc  = 0;
      rosc_we      = 32'h00000000;
      ent_shift_we = 0;
      ent_bit        = ^rosc_dout;
      ent_shift_new  = {ent_shift_reg[30 : 0], ent_bit};
      sample_ctr_new = sample_ctr_reg + 1'b1;
      if (sample_ctr_reg == SAMPLE_CLK_CYCLES)
        begin
          sample_ctr_new   = 8'h00;
          bit_ctr_inc      = 1;
          rosc_we          = rosc_en;
          ent_shift_we     = 1;
        end
    end
endmodule