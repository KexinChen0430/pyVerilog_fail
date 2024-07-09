module cycloneiiils_termination (
    rup,
    rdn,
    terminationclock,
    terminationclear,
    devpor,
    devclrn,
    comparatorprobe,
    terminationcontrolprobe,
    calibrationdone,
    terminationcontrol);
input         rup;
input 	      rdn;
input 	      terminationclock;
input 	      terminationclear;
input         devpor;
input         devclrn;
output        comparatorprobe;
output        terminationcontrolprobe;
output        calibrationdone;
output [15:0] terminationcontrol;
parameter pullup_control_to_core = "false";
parameter power_down = "true";
parameter test_mode = "false";
parameter left_shift_termination_code = "false";
parameter pullup_adder = 0;        // -128, 127
parameter pulldown_adder = 0;      // -128, 127
parameter clock_divide_by = 32;    // 1, 4, 32
parameter runtime_control = "false";
parameter shift_vref_rup = "true";
parameter shift_vref_rdn = "true";
parameter shifted_vref_control = "true";
parameter lpm_type = "cycloneiiils_termination";
tri1 devclrn;
tri1 devpor;
wire           m_gnd;
wire           m_vcc;
// interconnecting wires
// ctrl -----------------------------------------
wire           xcbout_clken;
wire           xcbout_clkin;
wire [8:0]     xcbout_maskbit;
wire           xcbout_nclr;
wire           xcbout_noctdoneuser;
wire           xcbout_octdone;
wire           xcbout_oregclk;
wire           xcbout_oregnclr;
wire           xcbout_vref;       // to run/dn comparator
wire           xcbout_vrefh;      // to rdn - shfitedvref
wire           xcbout_vrefl;      // to rup - shiftedvref
wire           xcbin_clkusr;
wire           xcbin_intosc;       // clk source in powerup mode
wire           xcbin_nclrusr;
wire           xcbin_nfrzdrv;      // devclrn
wire           xcbin_rclkdiv;      //                       - 14
wire           xcbin_rclrusrinv;   // invert nclrusr signal - 13
wire           xcbin_rdivsel;      // 0 = /32; 1 = /4;      - 16
wire           xcbin_roctusr;      // run_time_control      - 15
wire           xcbin_rsellvrefdn;  // shift_vref_rdn        - 26
wire           xcbin_rsellvrefup;  // shift_vref_rup        - 25
wire           xcbin_rtest;        // test_mode             - 2
wire           xcbin_vccnx;        // VCC voltage src
wire           xcbin_vssn;         // GND voltage src
// rup and rdn ------------------------------------
// common
wire           rshift_in;
wire           rpwrdn_in;
wire           rup_compout;
wire [7:0]     rup_octrupn;        // out from XRUP to rupref pin
wire [7:0]     rup_octcalnout;     // to the I/O bank
wire           rupin;
reg  [7:0]     rup_radd;
wire           rdn_compout;
wire [7:0]     rdn_octrdnp;        // out from XRDN to rdnref pin
wire [7:0]     rdn_octcalpout;     // to the I/O bank
wire           rdnin;
reg  [7:0]     rdn_radd;
wire           calout;             // MSB of the calibration code
// primary input and outputs
assign rupin = rup;
assign rdnin = rdn;
// terminationclk and clear feeding into CTRL sub directly
assign calibrationdone    = xcbout_octdone;
assign terminationcontrol = {rup_octcalnout, rdn_octcalpout};
assign comparatorprobe    = (pullup_control_to_core == "true") ? rup_compout : rdn_compout;
assign calout = (pullup_control_to_core == "true") ? rup_octcalnout[7] : rdn_octcalpout[7];
assign terminationcontrolprobe = (test_mode == "true") ? calout : xcbout_noctdoneuser;
initial begin
    rup_radd = pullup_adder;
    rdn_radd = pulldown_adder;
end
// CTRL sub-block
assign xcbin_clkusr       = terminationclock;
assign xcbin_intosc       = 1'b0;              // clk source in powerup mode
assign xcbin_nclrusr      = (terminationclear === 1'b1) ? 1'b0 : 1'b1;
assign xcbin_nfrzdrv      = (devclrn === 1'b0) ? 1'b0 : 1'b1;
assign xcbin_vccnx        = 1'b1;              // VCC voltage src
assign xcbin_vssn         = 1'b0;              // GND voltage src
assign xcbin_rclkdiv      = (clock_divide_by != 1) ? 1'b1 : 1'b0;      //- 14
assign xcbin_rclrusrinv   = 1'b0;              // invert nclrusr signal  - 13
assign xcbin_rdivsel      = (clock_divide_by == 32) ? 1'b0 : 1'b1;     //- 16
assign xcbin_roctusr      = (runtime_control == "true") ? 1'b1 : 1'b0; //- 15
assign xcbin_rsellvrefdn  = (shift_vref_rdn == "true") ? 1'b1 : 1'b0;  //- 26
assign xcbin_rsellvrefup  = (shift_vref_rup == "true") ? 1'b1 : 1'b0;  //- 25
assign xcbin_rtest        = (test_mode == "true") ? 1'b1 : 1'b0;       // - 2
cycloneiiils_termination_ctrl m_ctrl (
    .clken          (xcbout_clken          ),
    .clkin          (xcbout_clkin          ),
    .maskbit        (xcbout_maskbit         ),
    .nclr           (xcbout_nclr           ),
    .noctdoneuser   (xcbout_noctdoneuser   ),
    .octdone        (xcbout_octdone        ),
    .oregclk        (xcbout_oregclk        ),
    .oregnclr       (xcbout_oregnclr       ),
    .vref           (xcbout_vref           ),
    .vrefh          (xcbout_vrefh          ),
    .vrefl          (xcbout_vrefl          ),
    .clkusr         (xcbin_clkusr          ),
    .intosc         (xcbin_intosc          ),
    .nclrusr        (xcbin_nclrusr         ),
    .nfrzdrv        (xcbin_nfrzdrv         ),
    .vccnx          (xcbin_vccnx           ),
    .vssn           (xcbin_vssn            ),
    .rclkdiv        (xcbin_rclkdiv         ),
    .rclrusrinv     (xcbin_rclrusrinv      ),
    .rdivsel        (xcbin_rdivsel         ),
    .roctusr        (xcbin_roctusr         ),
    .rsellvrefdn    (xcbin_rsellvrefdn     ),
    .rsellvrefup    (xcbin_rsellvrefup     ),
    .rtest          (xcbin_rtest           )
);
assign m_vcc = 1'b1;
assign m_gnd = 1'b0;
assign rshift_in = (left_shift_termination_code == "true") ? 1'b1 : 1'b0;
assign rpwrdn_in = (power_down == "true") ? 1'b1 : 1'b0;
cycloneiiils_termination_rupdn m_rup (
    .compout        (rup_compout    ),
    .octrpcd        (rup_octrupn    ),
    .octcal         (rup_octcalnout ),
    .octpin         (rupin          ),
    .rcompoutinv    (m_vcc          ),   // no inversion
    .radd           (rup_radd       ),
    .clken          (xcbout_clken   ),
    .clkin          (xcbout_clkin   ),
    .maskbit        (xcbout_maskbit ),
    .nclr           (xcbout_nclr    ),
    .oregclk        (xcbout_oregclk ),
    .oregnclr       (xcbout_oregnclr),
    .shiftedvref    (xcbout_vrefl   ),
    .vccnx          (xcbin_vccnx    ),
    .vref           (xcbout_vref    ),
    .roctdone       (m_gnd          ),   // [12]
    .rpwrdn         (rpwrdn_in      ),   // [1]
    .rshift         (rshift_in      ),   // [3]
    .rshiftvref     (m_vcc          ),   // [27]
    .rtest          (xcbin_rtest    )
);
defparam m_rup.is_rdn = "false";
cycloneiiils_termination_rupdn m_rdn (
    .compout        (rdn_compout    ),
    .octrpcd        (rdn_octrdnp    ),
    .octcal         (rdn_octcalpout ),
    .octpin         (rdnin          ),
    .rcompoutinv    (m_gnd          ),    // invert compout
    .radd           (rdn_radd       ),
    .clken          (xcbout_clken   ),
    .clkin          (xcbout_clkin   ),
    .maskbit        (xcbout_maskbit ),
    .nclr           (xcbout_nclr    ),
    .oregclk        (xcbout_oregclk ),
    .oregnclr       (xcbout_oregnclr),
    .shiftedvref    (xcbout_vrefh   ),
    .vccnx          (xcbin_vccnx    ),
    .vref           (xcbout_vref    ),
    .roctdone       (m_gnd          ),     // [12]
    .rpwrdn         (rpwrdn_in      ),     // [1]
    .rshift         (rshift_in      ),     // [3]
    .rshiftvref     (m_vcc          ),     // [27]
    .rtest          (xcbin_rtest    )
);
defparam m_rdn.is_rdn = "true";
endmodule