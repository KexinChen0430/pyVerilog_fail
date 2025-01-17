module hi_simulate(
    ck_1356meg,
    pwr_lo, pwr_hi, pwr_oe1, pwr_oe2, pwr_oe3, pwr_oe4,
    adc_d, adc_clk,
    ssp_frame, ssp_din, ssp_dout, ssp_clk,
    dbg,
    mod_type
);
    input ck_1356meg;
    output pwr_lo, pwr_hi, pwr_oe1, pwr_oe2, pwr_oe3, pwr_oe4;
    input [7:0] adc_d;
    output adc_clk;
    input ssp_dout;
    output ssp_frame, ssp_din, ssp_clk;
    output dbg;
    input [2:0] mod_type;
// The comparator with hysteresis on the output from the peak detector.
reg after_hysteresis;
assign adc_clk = ck_1356meg;
always @(negedge adc_clk)
begin
    if(& adc_d[7:5]) after_hysteresis = 1'b1;           // if (adc_d >= 224)
    else if(~(| adc_d[7:5])) after_hysteresis = 1'b0;   // if (adc_d <= 31)
end
// Divide 13.56 MHz to produce various frequencies for SSP_CLK
// and modulation.
reg [7:0] ssp_clk_divider;
always @(posedge adc_clk)
    ssp_clk_divider <= (ssp_clk_divider + 1);
reg ssp_clk;
always @(negedge adc_clk)
begin
    if(mod_type == `FPGA_HF_SIMULATOR_MODULATE_424K_8BIT)
      // Get bit every at 53KHz (every 8th carrier bit of 424kHz)
      ssp_clk <= ssp_clk_divider[7];
    else if(mod_type == `FPGA_HF_SIMULATOR_MODULATE_212K)
      // Get next bit at 212kHz
      ssp_clk <= ssp_clk_divider[5];
    else
      // Get next bit at 424Khz
      ssp_clk <= ssp_clk_divider[4];
end
// Divide SSP_CLK by 8 to produce the byte framing signal; the phase of
// this is arbitrary, because it's just a bitstream.
// One nasty issue, though: I can't make it work with both rx and tx at
// once. The phase wrt ssp_clk must be changed. TODO to find out why
// that is and make a better fix.
reg [2:0] ssp_frame_divider_to_arm;
always @(posedge ssp_clk)
    ssp_frame_divider_to_arm <= (ssp_frame_divider_to_arm + 1);
reg [2:0] ssp_frame_divider_from_arm;
always @(negedge ssp_clk)
    ssp_frame_divider_from_arm <= (ssp_frame_divider_from_arm + 1);
reg ssp_frame;
always @(ssp_frame_divider_to_arm or ssp_frame_divider_from_arm or mod_type)
    if(mod_type == `FPGA_HF_SIMULATOR_NO_MODULATION) // not modulating, so listening, to ARM
        ssp_frame = (ssp_frame_divider_to_arm == 3'b000);
    else
        ssp_frame = (ssp_frame_divider_from_arm == 3'b000);
// Synchronize up the after-hysteresis signal, to produce DIN.
reg ssp_din;
always @(posedge ssp_clk)
    ssp_din = after_hysteresis;
// Modulating carrier frequency is fc/64 (212kHz) to fc/16 (848kHz). Reuse ssp_clk divider for that.
reg modulating_carrier;
always @(*)
    if (mod_type == `FPGA_HF_SIMULATOR_NO_MODULATION)
        modulating_carrier <= 1'b0;                          // no modulation
    else if (mod_type == `FPGA_HF_SIMULATOR_MODULATE_BPSK)
        modulating_carrier <= ssp_dout ^ ssp_clk_divider[3]; // XOR means BPSK
    else if (mod_type == `FPGA_HF_SIMULATOR_MODULATE_212K)
        modulating_carrier <= ssp_dout & ssp_clk_divider[5]; // switch 212kHz subcarrier on/off
    else if (mod_type == `FPGA_HF_SIMULATOR_MODULATE_424K || mod_type == `FPGA_HF_SIMULATOR_MODULATE_424K_8BIT)
        modulating_carrier <= ssp_dout & ssp_clk_divider[4]; // switch 424kHz modulation on/off
    else
        modulating_carrier <= 1'b0;                           // yet unused
// Load modulation. Toggle only one of these, since we are already producing much deeper
// modulation than a real tag would.
assign pwr_hi = 1'b0;                   // HF antenna connected to GND
assign pwr_oe3 = 1'b0;                  // 10k Load
assign pwr_oe1 = modulating_carrier;    // 33 Ohms Load
assign pwr_oe4 = modulating_carrier;    // 33 Ohms Load
// This is all LF and doesn't matter
assign pwr_lo = 1'b0;
assign pwr_oe2 = 1'b0;
assign dbg = ssp_din;
endmodule