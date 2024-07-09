module instantiations.
  genvar i;
  generate
    for(i = 0 ; i < 8 ; i = i + 1) begin: oscillators
      bp_osc #(.WIDTH(1)) osc01(.clk(clk),
                                .reset_n(reset_n),
                                .opa(opa[0]),
                                .opb(opb[0]),
                                .dout(dout01[i])
                               );
      bp_osc #(.WIDTH(2)) osc02(.clk(clk),
                                .reset_n(reset_n),
                                .opa(opa[1 : 0]),
                                .opb(opb[1 : 0]),
                                .dout(dout02[i])
                               );
      bp_osc #(.WIDTH(3)) osc03(.clk(clk),
                                .reset_n(reset_n),
                                .opa(opa[2 : 0]),
                                .opb(opb[2 : 0]),
                                .dout(dout03[i])
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
          shift_reg   <= 32'h00000000;
          rnd_reg     <= 32'h00000000;
          bit_ctr_reg <= 5'h00;
        end
      else
        begin
          if (update)
            begin
              shift_reg   <= {shift_reg[30 : 0], bit_new};
              bit_ctr_reg <= bit_ctr_reg + 1'b1;
            end
          if (bit_ctr_reg == 5'h1f)
            begin
              rnd_reg <= shift_reg;
            end
        end
    end // reg_update
  // rnd_gen
  // Logic that implements the actual random bit value generator
  // by mixing the oscillator outputs.
  always @*
    begin : rnd_gen
      reg osc1_mix;
      reg osc2_mix;
      reg osc3_mix;
      osc1_mix = ^dout01;
      osc2_mix = ^dout02;
      osc3_mix = ^dout03;
      bit_new = osc1_mix ^ osc2_mix ^ osc3_mix;
    end
endmodule