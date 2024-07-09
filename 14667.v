module.
reg ssp_frame;
always @(negedge adc_clk)
begin
    if (mod_type == `FPGA_HF_SIMULATOR_MODULATE_212K)
    begin
        if (ssp_clk_divider[8:5] == 4'd1)
            ssp_frame <= 1'b1;
        if (ssp_clk_divider[8:5] == 4'd5)
            ssp_frame <= 1'b0;
    end
    else
    begin
        if (ssp_clk_divider[7:4] == 4'd1)
            ssp_frame <= 1'b1;
        if (ssp_clk_divider[7:4] == 4'd5)
            ssp_frame <= 1'b0;
    end
end
// Synchronize up the after-hysteresis signal, to produce DIN.
reg ssp_din;
always @(posedge ssp_clk)
    ssp_din = after_hysteresis;
// Modulating carrier frequency is fc/64 (212kHz) to fc/16 (848kHz). Reuse ssp_clk divider for that.
reg modulating_carrier;
always @(*)
    if(mod_type == `FPGA_HF_SIMULATOR_NO_MODULATION)
        modulating_carrier <= 1'b0;                          // no modulation
    else if(mod_type == `FPGA_HF_SIMULATOR_MODULATE_BPSK)
        modulating_carrier <= ssp_dout ^ ssp_clk_divider[3]; // XOR means BPSK
    else if(mod_type == `FPGA_HF_SIMULATOR_MODULATE_212K)
        modulating_carrier <= ssp_dout & ssp_clk_divider[5]; // switch 212kHz subcarrier on/off
    else if(mod_type == `FPGA_HF_SIMULATOR_MODULATE_424K || mod_type == `FPGA_HF_SIMULATOR_MODULATE_424K_8BIT)
        modulating_carrier <= ssp_dout & ssp_clk_divider[4]; // switch 424kHz modulation on/off
    else
        modulating_carrier <= 1'b0;                           // yet unused
// Load modulation. Toggle only one of these, since we are already producing much deeper
// modulation than a real tag would.
assign pwr_oe1 = 1'b0;                  // 33 Ohms Load
assign pwr_oe4 = modulating_carrier;    // 33 Ohms Load
// This one is always on, so that we can watch the carrier.
assign pwr_oe3 = 1'b0;                  // 10k Load
endmodule