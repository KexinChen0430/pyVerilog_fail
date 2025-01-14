module fgen_block that creates 2 phase-shited sin/cos pairs
wire signed [LUTBITS-1:0] sin;
wire signed [LUTBITS-1:0] cos;
wire signed [LUTBITS-1:0] sin_shifted;
wire signed [LUTBITS-1:0] cos_shifted;
red_pitaya_iq_fgen_block #(
  .LUTSZ        (  LUTSZ      ),
  .LUTBITS      (  LUTBITS    ),
  .PHASEBITS    (  PHASEBITS  )
)
iq_fgen
(
   // data
  .clk_i               (  clk_i          ),  // clock
  .rstn_i              (  rstn_i         ),
  .on                  (  on             ),
  .sin_at_2f           (  sin_at_2f      ),
  .cos_at_2f           (  cos_at_2f      ),
  .sin_shifted_at_2f   (  sin_shifted_at_2f ),
  .cos_shifted_at_2f   (  cos_shifted_at_2f ),
  .start_phase         (  start_phase    ),
  .shift_phase         (  shift_phase    ),
  .sin_o               (  sin            ),
  .cos_o               (  cos            ),
  .sin_shifted_o       (  sin_shifted    ),
  .cos_shifted_o       (  cos_shifted    )
  );
//demodulation
wire signed [LPFBITS-1:0] quadrature1_hf;
wire signed [LPFBITS-1:0] quadrature2_hf;
red_pitaya_iq_demodulator_block #(
        .INBITS   (SIGNALBITS),
        .OUTBITS  (LPFBITS),
        .SINBITS  (LUTBITS),
        .SHIFTBITS (1) //never change unless you know what you are doing!!!
        //This setting of 1 just prevents saturation! especially do not set to SHIFTBITS
        )
    demodulator
    (
        .clk_i (clk_i),
        .sin   (sin_shifted),
        .cos   (cos_shifted),
        .signal_i (dat_i_filtered),
        .signal1_o (quadrature1_hf),
        .signal2_o (quadrature2_hf)
    );
//low-passing
wire signed [LPFBITS-1:0] quadrature1;
wire signed [LPFBITS-1:0] quadrature2;
wire signed [SIGNALBITS-1:0] quadrature1_o;
wire signed [SIGNALBITS-1:0] quadrature2_o;
//option 1: Several low-pass filters without multipliers (bw is power of 2)
red_pitaya_filter_block #(
     .STAGES(QUADRATUREFILTERSTAGES),
     .SHIFTBITS(QUADRATUREFILTERSHIFTBITS),
     .SIGNALBITS(LPFBITS),
     .MINBW(QUADRATUREFILTERMINBW)
  )
  iqfilter [1:0]
  (
   .clk_i     (  {clk_i,clk_i}    ),
   .rstn_i    (  {rstn_i,rstn_i}  ),
   .set_filter(  {quadrature_filter, quadrature_filter}  ),
   .dat_i  ( {quadrature1_hf,quadrature2_hf}  ),
   .dat_o  ( {quadrature1,quadrature2}  )
  );
//modulation, summing and direct output
red_pitaya_iq_modulator_block #(
        .INBITS   (LPFBITS),
        .OUTBITS  (SIGNALBITS),
        .SINBITS  (LUTBITS),
        .GAINBITS (GAINBITS),
        .SHIFTBITS (SHIFTBITS)
    )
    modulator
    (
        .clk_i (clk_i),
        .sin   (sin),
        .cos   (cos),
        .g1      (g1) ,
        .g2      (g2) ,
        .g3      (g3) ,
        .g4      (g4) ,
        .signal1_i (quadrature1),
        .signal2_i (quadrature2),
        .dat_o     (dat_o),
        .signal_q1_o  (quadrature1_o),
        .signal_q2_o  (quadrature2_o)
    );
//NA functionality
reg    do_averaging;
reg signed [62-1:0] iq_i_sum;
reg signed [62-1:0] iq_q_sum;
reg    [32-1:0] na_averages;  //cycles to average over
reg    [32-1:0] na_sleepcycles;  //cycles to wait before averaging starts
reg    [32-1:0] na_averages_remaining;
reg    [32-1:0] na_sleep_remaining;
//last one means iq_channel_1 frequency was changed = trigger event
always @(posedge clk_i) begin
    if (rstn_i == 1'b0) begin //reset
        iq_i_sum <= {62{1'b0}};
        iq_q_sum <= {62{1'b0}};
        na_averages_remaining <= {32{1'b0}};
        na_sleep_remaining <= {32{1'b0}};
        do_averaging <= 1'b0;
    end
    else if (wen && addr[16-1:0]==16'h0108) begin //start new averaging series when iq1 frequency is changed
        iq_i_sum <= {63{1'b0}};
        iq_q_sum <= {63{1'b0}};
        na_averages_remaining <= na_averages;
        na_sleep_remaining <= na_sleepcycles;
        do_averaging <= 1'b1;
    end
    else if (na_averages_remaining == {32{1'b0}} ) begin //stall when averaging has finished
        do_averaging <= 1'b0;
    end
    else if (na_sleep_remaining == {32{1'b0}} ) begin //averaging in progress
        na_averages_remaining <= na_averages_remaining - 32'b1;
        do_averaging <= 1'b1;
        iq_i_sum <= iq_i_sum + quadrature1;
        iq_q_sum <= iq_q_sum + quadrature2;
    end
    else begin  //sleep has not finished yet, count down sleep cycle register
        na_sleep_remaining <= na_sleep_remaining - 32'b1;
        do_averaging <= 1'b1;
    end
end
// pfd functionality (optional)
wire [SIGNALBITS-1:0] pfd_integral;
reg pfd_on;
red_pitaya_pfd_block pfd_block (
	.rstn_i(pfd_on),
	.clk_i (clk_i),
	.s1 (dat_i_filtered[SIGNALBITS-1]), //sign bit of input signal as clock source
	.s2 (sin[LUTBITS-1]), //sign bit of sine reference signal as clock source
	.integral_o(pfd_integral)
);
// output_signal multiplexer
assign signal_o = (output_select==QUADRATURE) ? quadrature1_o
				//: (output_select==QUADRATURE_HF) ? quadrature1_hf[LPFBITS-1:LPFBITS-SIGNALBITS] // maybe for the future
				: (output_select==OUTPUT_DIRECT) ? dat_o
				: (output_select==PFD) ? pfd_integral
				: {SIGNALBITS{1'b0}};
assign signal2_o = quadrature2_o;
endmodule