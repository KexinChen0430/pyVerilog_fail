module stratix_pll (inclk,
                    fbin,
                    ena,
                    clkswitch,
                    areset,
                    pfdena,
                    clkena,
                    extclkena,
                    scanclk,
                    scanaclr,
                    scandata,
                    clk,
                    extclk,
                    clkbad,
                    activeclock,
                    locked,
                    clkloss,
                    scandataout,
                    // lvds mode specific ports
                    comparator,
                    enable0,
                    enable1);
    parameter operation_mode = "normal";
    parameter qualify_conf_done = "off";
    parameter compensate_clock = "clk0";
    parameter pll_type = "auto";
    parameter scan_chain = "long";
    parameter lpm_type = "stratix_pll";
    parameter clk0_multiply_by = 1;
    parameter clk0_divide_by = 1;
    parameter clk0_phase_shift = 0;
    parameter clk0_time_delay = 0;
    parameter clk0_duty_cycle = 50;
    parameter clk1_multiply_by = 1;
    parameter clk1_divide_by = 1;
    parameter clk1_phase_shift = 0;
    parameter clk1_time_delay = 0;
    parameter clk1_duty_cycle = 50;
    parameter clk2_multiply_by = 1;
    parameter clk2_divide_by = 1;
    parameter clk2_phase_shift = 0;
    parameter clk2_time_delay = 0;
    parameter clk2_duty_cycle = 50;
    parameter clk3_multiply_by = 1;
    parameter clk3_divide_by = 1;
    parameter clk3_phase_shift = 0;
    parameter clk3_time_delay = 0;
    parameter clk3_duty_cycle = 50;
    parameter clk4_multiply_by = 1;
    parameter clk4_divide_by = 1;
    parameter clk4_phase_shift = 0;
    parameter clk4_time_delay = 0;
    parameter clk4_duty_cycle = 50;
    parameter clk5_multiply_by = 1;
    parameter clk5_divide_by = 1;
    parameter clk5_phase_shift = 0;
    parameter clk5_time_delay = 0;
    parameter clk5_duty_cycle = 50;
    parameter extclk0_multiply_by = 1;
    parameter extclk0_divide_by = 1;
    parameter extclk0_phase_shift = 0;
    parameter extclk0_time_delay = 0;
    parameter extclk0_duty_cycle = 50;
    parameter extclk1_multiply_by = 1;
    parameter extclk1_divide_by = 1;
    parameter extclk1_phase_shift = 0;
    parameter extclk1_time_delay = 0;
    parameter extclk1_duty_cycle = 50;
    parameter extclk2_multiply_by = 1;
    parameter extclk2_divide_by = 1;
    parameter extclk2_phase_shift = 0;
    parameter extclk2_time_delay = 0;
    parameter extclk2_duty_cycle = 50;
    parameter extclk3_multiply_by = 1;
    parameter extclk3_divide_by = 1;
    parameter extclk3_phase_shift = 0;
    parameter extclk3_time_delay = 0;
    parameter extclk3_duty_cycle = 50;
    parameter primary_clock = "inclk0";
    parameter inclk0_input_frequency = 10000;
    parameter inclk1_input_frequency = 10000;
    parameter gate_lock_signal = "no";
    parameter gate_lock_counter = 1;
    parameter valid_lock_multiplier = 5;
    parameter invalid_lock_multiplier = 5;
    parameter switch_over_on_lossclk = "off";
    parameter switch_over_on_gated_lock = "off";
    parameter switch_over_counter = 1;
    parameter enable_switch_over_counter = "off";
    parameter feedback_source = "extclk0";
    parameter bandwidth = 0;
    parameter bandwidth_type = "auto";
    parameter spread_frequency = 0;
    parameter common_rx_tx = "off";
    parameter rx_outclock_resource = "auto";
    parameter use_vco_bypass = "false";
    parameter use_dc_coupling = "false";
    parameter pfd_min = 0;
    parameter pfd_max = 0;
    parameter vco_min = 0;
    parameter vco_max = 0;
    parameter vco_center = 0;
    // ADVANCED USE PARAMETERS
    parameter m_initial = 1;
    parameter m = 0;
    parameter n = 1;
    parameter m2 = 1;
    parameter n2 = 1;
    parameter ss = 0;
    parameter l0_high = 1;
    parameter l0_low = 1;
    parameter l0_initial = 1;
    parameter l0_mode = "bypass";
    parameter l0_ph = 0;
    parameter l0_time_delay = 0;
    parameter l1_high = 1;
    parameter l1_low = 1;
    parameter l1_initial = 1;
    parameter l1_mode = "bypass";
    parameter l1_ph = 0;
    parameter l1_time_delay = 0;
    parameter g0_high = 1;
    parameter g0_low = 1;
    parameter g0_initial = 1;
    parameter g0_mode = "bypass";
    parameter g0_ph = 0;
    parameter g0_time_delay = 0;
    parameter g1_high = 1;
    parameter g1_low = 1;
    parameter g1_initial = 1;
    parameter g1_mode = "bypass";
    parameter g1_ph = 0;
    parameter g1_time_delay = 0;
    parameter g2_high = 1;
    parameter g2_low = 1;
    parameter g2_initial = 1;
    parameter g2_mode = "bypass";
    parameter g2_ph = 0;
    parameter g2_time_delay = 0;
    parameter g3_high = 1;
    parameter g3_low = 1;
    parameter g3_initial = 1;
    parameter g3_mode = "bypass";
    parameter g3_ph = 0;
    parameter g3_time_delay = 0;
    parameter e0_high = 1;
    parameter e0_low = 1;
    parameter e0_initial = 1;
    parameter e0_mode = "bypass";
    parameter e0_ph = 0;
    parameter e0_time_delay = 0;
    parameter e1_high = 1;
    parameter e1_low = 1;
    parameter e1_initial = 1;
    parameter e1_mode = "bypass";
    parameter e1_ph = 0;
    parameter e1_time_delay = 0;
    parameter e2_high = 1;
    parameter e2_low = 1;
    parameter e2_initial = 1;
    parameter e2_mode = "bypass";
    parameter e2_ph = 0;
    parameter e2_time_delay = 0;
    parameter e3_high = 1;
    parameter e3_low = 1;
    parameter e3_initial = 1;
    parameter e3_mode = "bypass";
    parameter e3_ph = 0;
    parameter e3_time_delay = 0;
    parameter m_ph = 0;
    parameter m_time_delay = 0;
    parameter n_time_delay = 0;
    parameter extclk0_counter = "e0";
    parameter extclk1_counter = "e1";
    parameter extclk2_counter = "e2";
    parameter extclk3_counter = "e3";
    parameter clk0_counter = "g0";
    parameter clk1_counter = "g1";
    parameter clk2_counter = "g2";
    parameter clk3_counter = "g3";
    parameter clk4_counter = "l0";
    parameter clk5_counter = "l1";
    // LVDS mode parameters
    parameter enable0_counter = "l0";
    parameter enable1_counter = "l0";
    parameter charge_pump_current = 0;
    parameter loop_filter_r = "1.0";
    parameter loop_filter_c = 1;
    parameter pll_compensation_delay = 0;
    parameter simulation_type = "timing";
    parameter source_is_pll = "off";
// SIMULATION_ONLY_PARAMETERS_BEGIN
    parameter down_spread = "0.0";
    parameter clk0_phase_shift_num = 0;
    parameter clk1_phase_shift_num = 0;
    parameter clk2_phase_shift_num = 0;
    parameter family_name = "Stratix";
    parameter skip_vco = "off";
    parameter clk0_use_even_counter_mode = "off";
    parameter clk1_use_even_counter_mode = "off";
    parameter clk2_use_even_counter_mode = "off";
    parameter clk3_use_even_counter_mode = "off";
    parameter clk4_use_even_counter_mode = "off";
    parameter clk5_use_even_counter_mode = "off";
    parameter extclk0_use_even_counter_mode = "off";
    parameter extclk1_use_even_counter_mode = "off";
    parameter extclk2_use_even_counter_mode = "off";
    parameter extclk3_use_even_counter_mode = "off";
    parameter clk0_use_even_counter_value = "off";
    parameter clk1_use_even_counter_value = "off";
    parameter clk2_use_even_counter_value = "off";
    parameter clk3_use_even_counter_value = "off";
    parameter clk4_use_even_counter_value = "off";
    parameter clk5_use_even_counter_value = "off";
    parameter extclk0_use_even_counter_value = "off";
    parameter extclk1_use_even_counter_value = "off";
    parameter extclk2_use_even_counter_value = "off";
    parameter extclk3_use_even_counter_value = "off";
// SIMULATION_ONLY_PARAMETERS_END
    parameter scan_chain_mif_file = "";
    // INPUT PORTS
    input [1:0] inclk;
    input fbin;
    input ena;
    input clkswitch;
    input areset;
    input pfdena;
    input [5:0] clkena;
    input [3:0] extclkena;
    input scanclk;
    input scanaclr;
    input scandata;
    // lvds specific input ports
    input comparator;
    // OUTPUT PORTS
    output [5:0] clk;
    output [3:0] extclk;
    output [1:0] clkbad;
    output activeclock;
    output locked;
    output clkloss;
    output scandataout;
    // lvds specific output ports
    output enable0;
    output enable1;
    // BUFFER INPUTS
    wire inclk0_ipd;
    wire inclk1_ipd;
    wire ena_ipd;
    wire fbin_ipd;
    wire areset_ipd;
    wire pfdena_ipd;
    wire clkena0_ipd;
    wire clkena1_ipd;
    wire clkena2_ipd;
    wire clkena3_ipd;
    wire clkena4_ipd;
    wire clkena5_ipd;
    wire extclkena0_ipd;
    wire extclkena1_ipd;
    wire extclkena2_ipd;
    wire extclkena3_ipd;
    wire scanclk_ipd;
    wire scanaclr_ipd;
    wire scandata_ipd;
    wire comparator_ipd;
    wire clkswitch_ipd;
    buf (inclk0_ipd, inclk[0]);
    buf (inclk1_ipd, inclk[1]);
    buf (ena_ipd, ena);
    buf (fbin_ipd, fbin);
    buf (areset_ipd, areset);
    buf (pfdena_ipd, pfdena);
    buf (clkena0_ipd, clkena[0]);
    buf (clkena1_ipd, clkena[1]);
    buf (clkena2_ipd, clkena[2]);
    buf (clkena3_ipd, clkena[3]);
    buf (clkena4_ipd, clkena[4]);
    buf (clkena5_ipd, clkena[5]);
    buf (extclkena0_ipd, extclkena[0]);
    buf (extclkena1_ipd, extclkena[1]);
    buf (extclkena2_ipd, extclkena[2]);
    buf (extclkena3_ipd, extclkena[3]);
    buf (scanclk_ipd, scanclk);
    buf (scanaclr_ipd, scanaclr);
    buf (scandata_ipd, scandata);
    buf (comparator_ipd, comparator);
    buf (clkswitch_ipd, clkswitch);
    // INTERNAL VARIABLES AND NETS
    integer scan_chain_length;
    integer i;
    integer j;
    integer k;
    integer l_index;
    integer gate_count;
    integer egpp_offset;
    integer sched_time;
    integer delay_chain;
    integer low;
    integer high;
    integer initial_delay;
    integer fbk_phase;
    integer fbk_delay;
    integer phase_shift[0:7];
    integer last_phase_shift[0:7];
    integer m_times_vco_period;
    integer new_m_times_vco_period;
    integer refclk_period;
    integer fbclk_period;
    integer primary_clock_frequency;
    integer high_time;
    integer low_time;
    integer my_rem;
    integer tmp_rem;
    integer rem;
    integer tmp_vco_per;
    integer vco_per;
    integer offset;
    integer temp_offset;
    integer cycles_to_lock;
    integer cycles_to_unlock;
    integer l0_count;
    integer l1_count;
    integer loop_xplier;
    integer loop_initial;
    integer loop_ph;
    integer loop_time_delay;
    integer cycle_to_adjust;
    integer total_pull_back;
    integer pull_back_M;
    integer pull_back_ext_cntr;
    time    fbclk_time;
    time    first_fbclk_time;
    time    refclk_time;
    time    scanaclr_rising_time;
    time    scanaclr_falling_time;
    reg got_first_refclk;
    reg got_second_refclk;
    reg got_first_fbclk;
    reg refclk_last_value;
    reg fbclk_last_value;
    reg inclk_last_value;
    reg pll_is_locked;
    reg pll_about_to_lock;
    reg locked_tmp;
    reg l0_got_first_rising_edge;
    reg l1_got_first_rising_edge;
    reg vco_l0_last_value;
    reg vco_l1_last_value;
    reg areset_ipd_last_value;
    reg ena_ipd_last_value;
    reg pfdena_ipd_last_value;
    reg inclk_out_of_range;
    reg schedule_vco_last_value;
    reg gate_out;
    reg vco_val;
    reg [31:0] m_initial_val;
    reg [31:0] m_val;
    reg [31:0] m_val_tmp;
    reg [31:0] m2_val;
    reg [31:0] n_val;
    reg [31:0] n_val_tmp;
    reg [31:0] n2_val;
    reg [31:0] m_time_delay_val;
    reg [31:0] n_time_delay_val;
    reg [31:0] m_delay;
    reg [8*6:1] m_mode_val;
    reg [8*6:1] m2_mode_val;
    reg [8*6:1] n_mode_val;
    reg [8*6:1] n2_mode_val;
    reg [31:0] l0_high_val;
    reg [31:0] l0_low_val;
    reg [31:0] l0_initial_val;
    reg [31:0] l0_time_delay_val;
    reg [8*6:1] l0_mode_val;
    reg [31:0] l1_high_val;
    reg [31:0] l1_low_val;
    reg [31:0] l1_initial_val;
    reg [31:0] l1_time_delay_val;
    reg [8*6:1] l1_mode_val;
    reg [31:0] g0_high_val;
    reg [31:0] g0_low_val;
    reg [31:0] g0_initial_val;
    reg [31:0] g0_time_delay_val;
    reg [8*6:1] g0_mode_val;
    reg [31:0] g1_high_val;
    reg [31:0] g1_low_val;
    reg [31:0] g1_initial_val;
    reg [31:0] g1_time_delay_val;
    reg [8*6:1] g1_mode_val;
    reg [31:0] g2_high_val;
    reg [31:0] g2_low_val;
    reg [31:0] g2_initial_val;
    reg [31:0] g2_time_delay_val;
    reg [8*6:1] g2_mode_val;
    reg [31:0] g3_high_val;
    reg [31:0] g3_low_val;
    reg [31:0] g3_initial_val;
    reg [31:0] g3_time_delay_val;
    reg [8*6:1] g3_mode_val;
    reg [31:0] e0_high_val;
    reg [31:0] e0_low_val;
    reg [31:0] e0_initial_val;
    reg [31:0] e0_time_delay_val;
    reg [8*6:1] e0_mode_val;
    reg [31:0] e1_high_val;
    reg [31:0] e1_low_val;
    reg [31:0] e1_initial_val;
    reg [31:0] e1_time_delay_val;
    reg [8*6:1] e1_mode_val;
    reg [31:0] e2_high_val;
    reg [31:0] e2_low_val;
    reg [31:0] e2_initial_val;
    reg [31:0] e2_time_delay_val;
    reg [8*6:1] e2_mode_val;
    reg [31:0] e3_high_val;
    reg [31:0] e3_low_val;
    reg [31:0] e3_initial_val;
    reg [31:0] e3_time_delay_val;
    reg [8*6:1] e3_mode_val;
    reg scanclk_last_value;
    reg scanaclr_last_value;
    reg transfer;
    reg transfer_enable;
    reg [288:0] scan_data;
    reg schedule_vco;
    reg schedule_offset;
    reg stop_vco;
    reg inclk_n;
    reg [7:0] vco_out;
    wire inclk_l0;
    wire inclk_l1;
    wire inclk_m;
    wire clk0_tmp;
    wire clk1_tmp;
    wire clk2_tmp;
    wire clk3_tmp;
    wire clk4_tmp;
    wire clk5_tmp;
    wire extclk0_tmp;
    wire extclk1_tmp;
    wire extclk2_tmp;
    wire extclk3_tmp;
    wire nce_l0;
    wire nce_l1;
    wire nce_temp;
    reg vco_l0;
    reg vco_l1;
    wire clk0;
    wire clk1;
    wire clk2;
    wire clk3;
    wire clk4;
    wire clk5;
    wire extclk0;
    wire extclk1;
    wire extclk2;
    wire extclk3;
    wire ena0;
    wire ena1;
    wire ena2;
    wire ena3;
    wire ena4;
    wire ena5;
    wire extena0;
    wire extena1;
    wire extena2;
    wire extena3;
    wire refclk;
    wire fbclk;
    wire l0_clk;
    wire l1_clk;
    wire g0_clk;
    wire g1_clk;
    wire g2_clk;
    wire g3_clk;
    wire e0_clk;
    wire e1_clk;
    wire e2_clk;
    wire e3_clk;
    wire dffa_out;
    wire dffb_out;
    wire dffc_out;
    wire dffd_out;
    wire lvds_dffb_clk;
    wire lvds_dffc_clk;
    wire lvds_dffd_clk;
    reg first_schedule;
    wire enable0_tmp;
    wire enable1_tmp;
    wire enable_0;
    wire enable_1;
    reg l0_tmp;
    reg l1_tmp;
    reg vco_period_was_phase_adjusted;
    reg phase_adjust_was_scheduled;
    // for external feedback mode
    reg [31:0] ext_fbk_cntr_high;
    reg [31:0] ext_fbk_cntr_low;
    reg [31:0] ext_fbk_cntr_modulus;
    reg [31:0] ext_fbk_cntr_delay;
    reg [8*2:1] ext_fbk_cntr;
    reg [8*6:1] ext_fbk_cntr_mode;
    integer ext_fbk_cntr_ph;
    integer ext_fbk_cntr_initial;
    wire inclk_e0;
    wire inclk_e1;
    wire inclk_e2;
    wire inclk_e3;
    wire [31:0] cntr_e0_initial;
    wire [31:0] cntr_e1_initial;
    wire [31:0] cntr_e2_initial;
    wire [31:0] cntr_e3_initial;
    wire [31:0] cntr_e0_delay;
    wire [31:0] cntr_e1_delay;
    wire [31:0] cntr_e2_delay;
    wire [31:0] cntr_e3_delay;
    reg  [31:0] ext_fbk_delay;
    // variables for clk_switch
    reg clk0_is_bad;
    reg clk1_is_bad;
    reg inclk0_last_value;
    reg inclk1_last_value;
    reg other_clock_value;
    reg other_clock_last_value;
    reg primary_clk_is_bad;
    reg current_clk_is_bad;
    reg external_switch;
//    reg [8*6:1] current_clock;
    reg active_clock;
    reg clkloss_tmp;
    reg got_curr_clk_falling_edge_after_clkswitch;
    reg active_clk_was_switched;
    integer clk0_count;
    integer clk1_count;
    integer switch_over_count;
    reg scandataout_tmp;
    reg scandataout_trigger;
    integer quiet_time;
    reg pll_in_quiet_period;
    time start_quiet_time;
    reg quiet_period_violation;
    reg reconfig_err;
    reg scanclr_violation;
    reg scanclr_clk_violation;
    reg got_first_scanclk_after_scanclr_inactive_edge;
    reg error;
    reg no_warn;
// LOCAL_PARAMETERS_BEGIN
    parameter EGPP_SCAN_CHAIN = 289;
    parameter GPP_SCAN_CHAIN = 193;
    parameter TRST = 5000;
    parameter TRSTCLK = 5000;
// LOCAL_PARAMETERS_END
    // internal variables for scaling of multiply_by and divide_by values
    integer i_clk0_mult_by;
    integer i_clk0_div_by;
    integer i_clk1_mult_by;
    integer i_clk1_div_by;
    integer i_clk2_mult_by;
    integer i_clk2_div_by;
    integer i_clk3_mult_by;
    integer i_clk3_div_by;
    integer i_clk4_mult_by;
    integer i_clk4_div_by;
    integer i_clk5_mult_by;
    integer i_clk5_div_by;
    integer i_extclk0_mult_by;
    integer i_extclk0_div_by;
    integer i_extclk1_mult_by;
    integer i_extclk1_div_by;
    integer i_extclk2_mult_by;
    integer i_extclk2_div_by;
    integer i_extclk3_mult_by;
    integer i_extclk3_div_by;
    integer max_d_value;
    integer new_multiplier;
    // internal variables for storing the phase shift number.(used in lvds mode only)
    integer i_clk0_phase_shift;
    integer i_clk1_phase_shift;
    integer i_clk2_phase_shift;
    // user to advanced internal signals
    integer   i_m_initial;
    integer   i_m;
    integer   i_n;
    integer   i_m2;
    integer   i_n2;
    integer   i_ss;
    integer   i_l0_high;
    integer   i_l1_high;
    integer   i_g0_high;
    integer   i_g1_high;
    integer   i_g2_high;
    integer   i_g3_high;
    integer   i_e0_high;
    integer   i_e1_high;
    integer   i_e2_high;
    integer   i_e3_high;
    integer   i_l0_low;
    integer   i_l1_low;
    integer   i_g0_low;
    integer   i_g1_low;
    integer   i_g2_low;
    integer   i_g3_low;
    integer   i_e0_low;
    integer   i_e1_low;
    integer   i_e2_low;
    integer   i_e3_low;
    integer   i_l0_initial;
    integer   i_l1_initial;
    integer   i_g0_initial;
    integer   i_g1_initial;
    integer   i_g2_initial;
    integer   i_g3_initial;
    integer   i_e0_initial;
    integer   i_e1_initial;
    integer   i_e2_initial;
    integer   i_e3_initial;
    reg [8*6:1]   i_l0_mode;
    reg [8*6:1]   i_l1_mode;
    reg [8*6:1]   i_g0_mode;
    reg [8*6:1]   i_g1_mode;
    reg [8*6:1]   i_g2_mode;
    reg [8*6:1]   i_g3_mode;
    reg [8*6:1]   i_e0_mode;
    reg [8*6:1]   i_e1_mode;
    reg [8*6:1]   i_e2_mode;
    reg [8*6:1]   i_e3_mode;
    integer   i_vco_min;
    integer   i_vco_max;
    integer   i_vco_center;
    integer   i_pfd_min;
    integer   i_pfd_max;
    integer   i_l0_ph;
    integer   i_l1_ph;
    integer   i_g0_ph;
    integer   i_g1_ph;
    integer   i_g2_ph;
    integer   i_g3_ph;
    integer   i_e0_ph;
    integer   i_e1_ph;
    integer   i_e2_ph;
    integer   i_e3_ph;
    integer   i_m_ph;
    integer   m_ph_val;
    integer   i_l0_time_delay;
    integer   i_l1_time_delay;
    integer   i_g0_time_delay;
    integer   i_g1_time_delay;
    integer   i_g2_time_delay;
    integer   i_g3_time_delay;
    integer   i_e0_time_delay;
    integer   i_e1_time_delay;
    integer   i_e2_time_delay;
    integer   i_e3_time_delay;
    integer   i_m_time_delay;
    integer   i_n_time_delay;
    integer   i_extclk3_counter;
    integer   i_extclk2_counter;
    integer   i_extclk1_counter;
    integer   i_extclk0_counter;
    integer   i_clk5_counter;
    integer   i_clk4_counter;
    integer   i_clk3_counter;
    integer   i_clk2_counter;
    integer   i_clk1_counter;
    integer   i_clk0_counter;
    integer   i_charge_pump_current;
    integer   i_loop_filter_r;
    integer   max_neg_abs;
    integer   output_count;
    integer   new_divisor;
    reg pll_is_in_reset;
    // uppercase to lowercase parameter values
    reg [8*`WORD_LENGTH:1] l_operation_mode;
    reg [8*`WORD_LENGTH:1] l_pll_type;
    reg [8*`WORD_LENGTH:1] l_qualify_conf_done;
    reg [8*`WORD_LENGTH:1] l_compensate_clock;
    reg [8*`WORD_LENGTH:1] l_scan_chain;
    reg [8*`WORD_LENGTH:1] l_primary_clock;
    reg [8*`WORD_LENGTH:1] l_gate_lock_signal;
    reg [8*`WORD_LENGTH:1] l_switch_over_on_lossclk;
    reg [8*`WORD_LENGTH:1] l_switch_over_on_gated_lock;
    reg [8*`WORD_LENGTH:1] l_enable_switch_over_counter;
    reg [8*`WORD_LENGTH:1] l_feedback_source;
    reg [8*`WORD_LENGTH:1] l_bandwidth_type;
    reg [8*`WORD_LENGTH:1] l_simulation_type;
    reg [8*`WORD_LENGTH:1] l_enable0_counter;
    reg [8*`WORD_LENGTH:1] l_enable1_counter;
    integer current_clock;
    reg is_fast_pll;
    reg op_mode;
    reg init;
    specify
    endspecify
    // finds the closest integer fraction of a given pair of numerator and denominator.
    task find_simple_integer_fraction;
        input numerator;
        input denominator;
        input max_denom;
        output fraction_num;
        output fraction_div;
        parameter max_iter = 20;
        integer numerator;
        integer denominator;
        integer max_denom;
        integer fraction_num;
        integer fraction_div;
        integer quotient_array[max_iter-1:0];
        integer int_loop_iter;
        integer int_quot;
        integer m_value;
        integer d_value;
        integer old_m_value;
        integer swap;
        integer loop_iter;
        integer num;
        integer den;
        integer i_max_iter;
    begin
        loop_iter = 0;
        num = numerator;
        den = denominator;
        i_max_iter = max_iter;
        while (loop_iter < i_max_iter)
        begin
            int_quot = num / den;
            quotient_array[loop_iter] = int_quot;
            num = num - (den*int_quot);
            loop_iter=loop_iter+1;
            if ((num == 0) || (max_denom != -1) || (loop_iter == i_max_iter))
            begin
                // calculate the numerator and denominator if there is a restriction on the
                // max denom value or if the loop is ending
                m_value = 0;
                d_value = 1;
                // get the rounded value at this stage for the remaining fraction
                if (den != 0)
                begin
                    m_value = (2*num/den);
                end
                // calculate the fraction numerator and denominator at this stage
                for (int_loop_iter = loop_iter-1; int_loop_iter >= 0; int_loop_iter=int_loop_iter-1)
                begin
                    if (m_value == 0)
                    begin
                        m_value = quotient_array[int_loop_iter];
                        d_value = 1;
                    end
                    else
                    begin
                        old_m_value = m_value;
                        m_value = quotient_array[int_loop_iter]*m_value + d_value;
                        d_value = old_m_value;
                    end
                end
                // if the denominator is less than the maximum denom_value or if there is no restriction save it
                if ((d_value <= max_denom) || (max_denom == -1))
                begin
                    if ((m_value == 0) || (d_value == 0))
                    begin
                        fraction_num = numerator;
                        fraction_div = denominator;
                    end
                    else
                    begin
                        fraction_num = m_value;
                        fraction_div = d_value;
                    end
                end
                // end the loop if the denomitor has overflown or the numerator is zero (no remainder during this round)
                if (((d_value > max_denom) && (max_denom != -1)) || (num == 0))
                begin
                    i_max_iter = loop_iter;
                end
            end
            // swap the numerator and denominator for the next round
            swap = den;
            den = num;
            num = swap;
        end
    end
    endtask // find_simple_integer_fraction
// get the absolute value
    function integer abs;
    input value;
    integer value;
    begin
        if (value < 0)
            abs = value * -1;
        else abs = value;
    end
    endfunction
    // find twice the period of the slowest clock
    function integer slowest_clk;
    input L0, L0_mode, L1, L1_mode, G0, G0_mode, G1, G1_mode, G2, G2_mode, G3, G3_mode, E0, E0_mode, E1, E1_mode, E2, E2_mode, E3, E3_mode, scan_chain, refclk, m_mod;
    integer L0, L1, G0, G1, G2, G3, E0, E1, E2, E3;
    reg [8*6:1] L0_mode, L1_mode, G0_mode, G1_mode, G2_mode, G3_mode, E0_mode, E1_mode, E2_mode, E3_mode;
    reg [8*5:1] scan_chain;
    integer refclk;
    reg [31:0] m_mod;
    integer max_modulus;
    begin
        max_modulus = 1;
        if (L0_mode != "bypass" && L0_mode != "   off")
            max_modulus = L0;
        if (L1 > max_modulus && L1_mode != "bypass" && L1_mode != "   off")
            max_modulus = L1;
        if (G0 > max_modulus && G0_mode != "bypass" && G0_mode != "   off")
            max_modulus = G0;
        if (G1 > max_modulus && G1_mode != "bypass" && G1_mode != "   off")
            max_modulus = G1;
        if (G2 > max_modulus && G2_mode != "bypass" && G2_mode != "   off")
            max_modulus = G2;
        if (G3 > max_modulus && G3_mode != "bypass" && G3_mode != "   off")
            max_modulus = G3;
        if (scan_chain == "long")
        begin
            if (E0 > max_modulus && E0_mode != "bypass" && E0_mode != "   off")
                max_modulus = E0;
            if (E1 > max_modulus && E1_mode != "bypass" && E1_mode != "   off")
                max_modulus = E1;
            if (E2 > max_modulus && E2_mode != "bypass" && E2_mode != "   off")
                max_modulus = E2;
            if (E3 > max_modulus && E3_mode != "bypass" && E3_mode != "   off")
                max_modulus = E3;
        end
        slowest_clk = ((refclk/m_mod) * max_modulus *2);
    end
    endfunction
    // count the number of digits in the given integer
    function integer count_digit;
    input X;
    integer X;
    integer count, result;
    begin
        count = 0;
        result = X;
        while (result != 0)
        begin
            result = (result / 10);
            count = count + 1;
        end
        count_digit = count;
    end
    endfunction
    // reduce the given huge number(X) to Y significant digits
    function integer scale_num;
    input X, Y;
    integer X, Y;
    integer count;
    integer fac_ten, lc;
    begin
        fac_ten = 1;
        count = count_digit(X);
        for (lc = 0; lc < (count-Y); lc = lc + 1)
            fac_ten = fac_ten * 10;
        scale_num = (X / fac_ten);
    end
    endfunction
    // find the greatest common denominator of X and Y
    function integer gcd;
    input X,Y;
    integer X,Y;
    integer L, S, R, G;
    begin
        if (X < Y) // find which is smaller.
        begin
            S = X;
            L = Y;
        end
        else
        begin
            S = Y;
            L = X;
        end
        R = S;
        while ( R > 1)
        begin
            S = L;
            L = R;
            R = S % L;  // divide bigger number by smaller.
                        // remainder becomes smaller number.
        end
        if (R == 0)    // if evenly divisible then L is gcd else it is 1.
            G = L;
        else
            G = R;
        gcd = G;
    end
    endfunction
    // find the least common multiple of A1 to A10
    function integer lcm;
    input A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, P;
    integer A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, P;
    integer M1, M2, M3, M4, M5 , M6, M7, M8, M9, R;
    begin
        M1 = (A1 * A2)/gcd(A1, A2);
        M2 = (M1 * A3)/gcd(M1, A3);
        M3 = (M2 * A4)/gcd(M2, A4);
        M4 = (M3 * A5)/gcd(M3, A5);
        M5 = (M4 * A6)/gcd(M4, A6);
        M6 = (M5 * A7)/gcd(M5, A7);
        M7 = (M6 * A8)/gcd(M6, A8);
        M8 = (M7 * A9)/gcd(M7, A9);
        M9 = (M8 * A10)/gcd(M8, A10);
        if (M9 < 3)
            R = 10;
        else if ((M9 <= 10) && (M9 >= 3))
            R = 4 * M9;
        else if (M9 > 1000)
            R = scale_num(M9,3);
        else
            R = M9;
        lcm = R;
    end
    endfunction
    // find the factor of division of the output clock frequency
    // compared to the VCO
    function integer output_counter_value;
    input clk_divide, clk_mult, M, N;
    integer clk_divide, clk_mult, M, N;
    integer R;
    begin
        R = (clk_divide * M)/(clk_mult * N);
        output_counter_value = R;
    end
    endfunction
    // find the mode of each of the PLL counters - bypass, even or odd
    function [8*6:1] counter_mode;
    input duty_cycle;
    input output_counter_value;
    integer duty_cycle;
    integer output_counter_value;
    integer half_cycle_high;
    reg [8*6:1] R;
    begin
        half_cycle_high = (2*duty_cycle*output_counter_value)/100;
        if (output_counter_value == 1)
            R = "bypass";
        else if ((half_cycle_high % 2) == 0)
            R = "even";
        else
            R = "odd";
        counter_mode = R;
    end
    endfunction
    // find the number of VCO clock cycles to hold the output clock high
    function integer counter_high;
    input output_counter_value, duty_cycle;
    integer output_counter_value, duty_cycle;
    integer half_cycle_high;
    integer tmp_counter_high;
    integer mode;
    begin
        half_cycle_high = (2*duty_cycle*output_counter_value)/100;
        mode = ((half_cycle_high % 2) == 0);
        tmp_counter_high = half_cycle_high/2;
        counter_high = tmp_counter_high + !mode;
    end
    endfunction
    // find the number of VCO clock cycles to hold the output clock low
    function integer counter_low;
    input output_counter_value, duty_cycle;
    integer output_counter_value, duty_cycle, counter_h;
    integer half_cycle_high;
    integer mode;
    integer tmp_counter_high;
    begin
        half_cycle_high = (2*duty_cycle*output_counter_value)/100;
        mode = ((half_cycle_high % 2) == 0);
        tmp_counter_high = half_cycle_high/2;
        counter_h = tmp_counter_high + !mode;
        counter_low =  output_counter_value - counter_h;
        if (counter_low == 0)
            counter_low = 1;
    end
    endfunction
    // find the smallest time delay amongst t1 to t10
    function integer mintimedelay;
    input t1, t2, t3, t4, t5, t6, t7, t8, t9, t10;
    integer t1, t2, t3, t4, t5, t6, t7, t8, t9, t10;
    integer m1,m2,m3,m4,m5,m6,m7,m8,m9;
    begin
        if (t1 < t2)
            m1 = t1;
        else
            m1 = t2;
        if (m1 < t3)
            m2 = m1;
        else
            m2 = t3;
        if (m2 < t4)
            m3 = m2;
        else
            m3 = t4;
        if (m3 < t5)
            m4 = m3;
        else
            m4 = t5;
        if (m4 < t6)
            m5 = m4;
        else
            m5 = t6;
        if (m5 < t7)
            m6 = m5;
        else
            m6 = t7;
        if (m6 < t8)
            m7 = m6;
        else
            m7 = t8;
        if (m7 < t9)
            m8 = m7;
        else
            m8 = t9;
        if (m8 < t10)
            m9 = m8;
        else
            m9 = t10;
        if (m9 > 0)
            mintimedelay = m9;
        else
            mintimedelay = 0;
    end
    endfunction
    // find the numerically largest negative number, and return its absolute value
    function integer maxnegabs;
    input t1, t2, t3, t4, t5, t6, t7, t8, t9, t10;
    integer t1, t2, t3, t4, t5, t6, t7, t8, t9, t10;
    integer m1,m2,m3,m4,m5,m6,m7,m8,m9;
    begin
        if (t1 < t2) m1 = t1; else m1 = t2;
        if (m1 < t3) m2 = m1; else m2 = t3;
        if (m2 < t4) m3 = m2; else m3 = t4;
        if (m3 < t5) m4 = m3; else m4 = t5;
        if (m4 < t6) m5 = m4; else m5 = t6;
        if (m5 < t7) m6 = m5; else m6 = t7;
        if (m6 < t8) m7 = m6; else m7 = t8;
        if (m7 < t9) m8 = m7; else m8 = t9;
        if (m8 < t10) m9 = m8; else m9 = t10;
        maxnegabs = (m9 < 0) ? 0 - m9 : 0;
    end
    endfunction
    // adjust the given tap_phase by adding the largest negative number (ph_base)
    function integer ph_adjust;
    input tap_phase, ph_base;
    integer tap_phase, ph_base;
    begin
        ph_adjust = tap_phase + ph_base;
    end
    endfunction
    // find the actual time delay for each PLL counter
    function integer counter_time_delay;
    input clk_time_delay, m_time_delay, n_time_delay;
    integer clk_time_delay, m_time_delay, n_time_delay;
    begin
        counter_time_delay = clk_time_delay + m_time_delay - n_time_delay;
    end
    endfunction
    // find the number of VCO clock cycles to wait initially before the first
    // rising edge of the output clock
    function integer counter_initial;
    input tap_phase, m, n;
    integer tap_phase, m, n, phase;
    begin
        if (tap_phase < 0) tap_phase = 0 - tap_phase;
        // adding 0.5 for rounding correction (required in order to round
        // to the nearest integer instead of truncating)
        phase = ((tap_phase * m) / (360 * n)) + 0.5;
        counter_initial = phase;
    end
    endfunction
    // find which VCO phase tap to align the rising edge of the output clock to
    function integer counter_ph;
    input tap_phase;
    input m,n;
    integer m,n, phase;
    integer tap_phase;
    begin
    // adding 0.5 for rounding correction
        phase = (tap_phase * m / n) + 0.5;
        counter_ph = (phase % 360) / 45;
    end
    endfunction
    // convert the given string to length 6 by padding with spaces
    function [8*6:1] translate_string;
    input mode;
    reg [8*6:1] new_mode;
    begin
        if (mode == "bypass")
            new_mode = "bypass";
        else if (mode == "even")
            new_mode = "  even";
        else if (mode == "odd")
            new_mode = "   odd";
        translate_string = new_mode;
    end
    endfunction
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
    // this is for stratix lvds only
    // convert phase delay to integer
    function integer get_int_phase_shift;
    input [8*16:1] s;
    input i_phase_shift;
    integer i_phase_shift;
    begin
        if (i_phase_shift != 0)
        begin
            get_int_phase_shift = i_phase_shift;
        end
        else
        begin
            get_int_phase_shift = str2int(s);
        end
    end
    endfunction
    // calculate the given phase shift (in ps) in terms of degrees
    function integer get_phase_degree;
    input phase_shift;
    integer phase_shift, result;
    begin
        result = (phase_shift * 360) / inclk0_input_frequency;
        // this is to round up the calculation result
        if ( result > 0 )
            result = result + 1;
        else if ( result < 0 )
            result = result - 1;
        else
            result = 0;
        // assign the rounded up result
        get_phase_degree = result;
    end
    endfunction
    // convert uppercase parameter values to lowercase
    // assumes that the maximum character length of a parameter is 18
    function [8*`WORD_LENGTH:1] alpha_tolower;
    input [8*`WORD_LENGTH:1] given_string;
    reg [8*`WORD_LENGTH:1] return_string;
    reg [8*`WORD_LENGTH:1] reg_string;
    reg [8:1] tmp;
    reg [8:1] conv_char;
    integer byte_count;
    begin
        return_string = "                    "; // initialise strings to spaces
        conv_char = "        ";
        reg_string = given_string;
        for (byte_count = `WORD_LENGTH; byte_count >= 1; byte_count = byte_count - 1)
        begin
            tmp = reg_string[8*`WORD_LENGTH:(8*(`WORD_LENGTH-1)+1)];
            reg_string = reg_string << 8;
            if ((tmp >= 65) && (tmp <= 90)) // ASCII number of 'A' is 65, 'Z' is 90
            begin
                conv_char = tmp + 32; // 32 is the difference in the position of 'A' and 'a' in the ASCII char set
                return_string = {return_string, conv_char};
            end
            else
                return_string = {return_string, tmp};
        end
        alpha_tolower = return_string;
    end
    endfunction
    initial
    begin
        // convert string parameter values from uppercase to lowercase,
        // as expected in this model
        l_operation_mode             = alpha_tolower(operation_mode);
        l_pll_type                   = alpha_tolower(pll_type);
        l_qualify_conf_done          = alpha_tolower(qualify_conf_done);
        l_compensate_clock           = alpha_tolower(compensate_clock);
        l_scan_chain                 = alpha_tolower(scan_chain);
        l_primary_clock              = alpha_tolower(primary_clock);
        l_gate_lock_signal           = alpha_tolower(gate_lock_signal);
        l_switch_over_on_lossclk     = alpha_tolower(switch_over_on_lossclk);
        l_switch_over_on_gated_lock  = alpha_tolower(switch_over_on_gated_lock);
        l_enable_switch_over_counter = alpha_tolower(enable_switch_over_counter);
        l_feedback_source            = alpha_tolower(feedback_source);
        l_bandwidth_type             = alpha_tolower(bandwidth_type);
        l_simulation_type            = alpha_tolower(simulation_type);
        l_enable0_counter            = alpha_tolower(enable0_counter);
        l_enable1_counter            = alpha_tolower(enable1_counter);
        if (m == 0)
        begin
            // set the limit of the divide_by value that can be returned by
            // the following function.
            max_d_value = 500;
            // scale down the multiply_by and divide_by values provided by the design
            // before attempting to use them in the calculations below
            find_simple_integer_fraction(clk0_multiply_by, clk0_divide_by,
                            max_d_value, i_clk0_mult_by, i_clk0_div_by);
            find_simple_integer_fraction(clk1_multiply_by, clk1_divide_by,
                            max_d_value, i_clk1_mult_by, i_clk1_div_by);
            find_simple_integer_fraction(clk2_multiply_by, clk2_divide_by,
                            max_d_value, i_clk2_mult_by, i_clk2_div_by);
            find_simple_integer_fraction(clk3_multiply_by, clk3_divide_by,
                            max_d_value, i_clk3_mult_by, i_clk3_div_by);
            find_simple_integer_fraction(clk4_multiply_by, clk4_divide_by,
                            max_d_value, i_clk4_mult_by, i_clk4_div_by);
            find_simple_integer_fraction(clk5_multiply_by, clk5_divide_by,
                            max_d_value, i_clk5_mult_by, i_clk5_div_by);
            find_simple_integer_fraction(extclk0_multiply_by, extclk0_divide_by,
                            max_d_value, i_extclk0_mult_by, i_extclk0_div_by);
            find_simple_integer_fraction(extclk1_multiply_by, extclk1_divide_by,
                            max_d_value, i_extclk1_mult_by, i_extclk1_div_by);
            find_simple_integer_fraction(extclk2_multiply_by, extclk2_divide_by,
                            max_d_value, i_extclk2_mult_by, i_extclk2_div_by);
            find_simple_integer_fraction(extclk3_multiply_by, extclk3_divide_by,
                            max_d_value, i_extclk3_mult_by, i_extclk3_div_by);
            // convert user parameters to advanced
            i_n = 1;
            if (l_pll_type == "lvds")
                i_m = clk0_multiply_by;
            else
                i_m = lcm  (i_clk0_mult_by, i_clk1_mult_by,
                            i_clk2_mult_by, i_clk3_mult_by,
                            i_clk4_mult_by, i_clk5_mult_by,
                            i_extclk0_mult_by,
                            i_extclk1_mult_by, i_extclk2_mult_by,
                            i_extclk3_mult_by, inclk0_input_frequency);
            i_m_time_delay = maxnegabs (str2int(clk0_time_delay),
                                        str2int(clk1_time_delay),
                                        str2int(clk2_time_delay),
                                        str2int(clk3_time_delay),
                                        str2int(clk4_time_delay),
                                        str2int(clk5_time_delay),
                                        str2int(extclk0_time_delay),
                                        str2int(extclk1_time_delay),
                                        str2int(extclk2_time_delay),
                                        str2int(extclk3_time_delay));
            i_n_time_delay = mintimedelay(str2int(clk0_time_delay),
                                        str2int(clk1_time_delay),
                                        str2int(clk2_time_delay),
                                        str2int(clk3_time_delay),
                                        str2int(clk4_time_delay),
                                        str2int(clk5_time_delay),
                                        str2int(extclk0_time_delay),
                                        str2int(extclk1_time_delay),
                                        str2int(extclk2_time_delay),
                                        str2int(extclk3_time_delay));
            if (l_pll_type == "lvds")
                i_g0_high = counter_high(output_counter_value(i_clk2_div_by,
                            i_clk2_mult_by, i_m, i_n), clk2_duty_cycle);
            else
                i_g0_high = counter_high(output_counter_value(i_clk0_div_by,
                            i_clk0_mult_by, i_m, i_n), clk0_duty_cycle);
            i_g1_high = counter_high(output_counter_value(i_clk1_div_by,
                        i_clk1_mult_by, i_m, i_n), clk1_duty_cycle);
            i_g2_high = counter_high(output_counter_value(i_clk2_div_by,
                        i_clk2_mult_by, i_m, i_n), clk2_duty_cycle);
            i_g3_high = counter_high(output_counter_value(i_clk3_div_by,
                        i_clk3_mult_by, i_m, i_n), clk3_duty_cycle);
            if (l_pll_type == "lvds")
            begin
                i_l0_high = i_g0_high;
                i_l1_high = i_g0_high;
            end
            else
            begin
                i_l0_high = counter_high(output_counter_value(i_clk4_div_by,
                            i_clk4_mult_by,  i_m, i_n), clk4_duty_cycle);
                i_l1_high = counter_high(output_counter_value(i_clk5_div_by,
                            i_clk5_mult_by,  i_m, i_n), clk5_duty_cycle);
            end
            i_e0_high = counter_high(output_counter_value(i_extclk0_div_by,
                        i_extclk0_mult_by,  i_m, i_n), extclk0_duty_cycle);
            i_e1_high = counter_high(output_counter_value(i_extclk1_div_by,
                        i_extclk1_mult_by,  i_m, i_n), extclk1_duty_cycle);
            i_e2_high = counter_high(output_counter_value(i_extclk2_div_by,
                        i_extclk2_mult_by,  i_m, i_n), extclk2_duty_cycle);
            i_e3_high = counter_high(output_counter_value(i_extclk3_div_by,
                        i_extclk3_mult_by,  i_m, i_n), extclk3_duty_cycle);
            if (l_pll_type == "lvds")
                i_g0_low  = counter_low(output_counter_value(i_clk2_div_by,
                            i_clk2_mult_by,  i_m, i_n), clk2_duty_cycle);
            else
                i_g0_low  = counter_low(output_counter_value(i_clk0_div_by,
                            i_clk0_mult_by,  i_m, i_n), clk0_duty_cycle);
            i_g1_low  = counter_low(output_counter_value(i_clk1_div_by,
                        i_clk1_mult_by,  i_m, i_n), clk1_duty_cycle);
            i_g2_low  = counter_low(output_counter_value(i_clk2_div_by,
                        i_clk2_mult_by,  i_m, i_n), clk2_duty_cycle);
            i_g3_low  = counter_low(output_counter_value(i_clk3_div_by,
                        i_clk3_mult_by,  i_m, i_n), clk3_duty_cycle);
            if (l_pll_type == "lvds")
            begin
                i_l0_low  = i_g0_low;
                i_l1_low  = i_g0_low;
            end
            else
            begin
                i_l0_low  = counter_low(output_counter_value(i_clk4_div_by,
                            i_clk4_mult_by,  i_m, i_n), clk4_duty_cycle);
                i_l1_low  = counter_low(output_counter_value(i_clk5_div_by,
                            i_clk5_mult_by,  i_m, i_n), clk5_duty_cycle);
            end
            i_e0_low  = counter_low(output_counter_value(i_extclk0_div_by,
                        i_extclk0_mult_by,  i_m, i_n), extclk0_duty_cycle);
            i_e1_low  = counter_low(output_counter_value(i_extclk1_div_by,
                        i_extclk1_mult_by,  i_m, i_n), extclk1_duty_cycle);
            i_e2_low  = counter_low(output_counter_value(i_extclk2_div_by,
                        i_extclk2_mult_by,  i_m, i_n), extclk2_duty_cycle);
            i_e3_low  = counter_low(output_counter_value(i_extclk3_div_by,
                        i_extclk3_mult_by,  i_m, i_n), extclk3_duty_cycle);
            if (l_pll_type == "flvds")
            begin
                // Need to readjust phase shift values when the clock multiply value has been readjusted.
                new_multiplier = clk0_multiply_by / i_clk0_mult_by;
                i_clk0_phase_shift = (clk0_phase_shift_num * new_multiplier);
                i_clk1_phase_shift = (clk1_phase_shift_num * new_multiplier);
                i_clk2_phase_shift = (clk2_phase_shift_num * new_multiplier);
            end
            else
            begin
                i_clk0_phase_shift = get_int_phase_shift(clk0_phase_shift, clk0_phase_shift_num);
                i_clk1_phase_shift = get_int_phase_shift(clk1_phase_shift, clk1_phase_shift_num);
                i_clk2_phase_shift = get_int_phase_shift(clk2_phase_shift, clk2_phase_shift_num);
            end
            max_neg_abs = maxnegabs(i_clk0_phase_shift,
                                    i_clk1_phase_shift,
                                    i_clk2_phase_shift,
                                    str2int(clk3_phase_shift),
                                    str2int(clk4_phase_shift),
                                    str2int(clk5_phase_shift),
                                    str2int(extclk0_phase_shift),
                                    str2int(extclk1_phase_shift),
                                    str2int(extclk2_phase_shift),
                                    str2int(extclk3_phase_shift));
            if (l_pll_type == "lvds")
                i_g0_initial = counter_initial(get_phase_degree(ph_adjust(i_clk2_phase_shift, max_neg_abs)), i_m, i_n);
            else
                i_g0_initial = counter_initial(get_phase_degree(ph_adjust(i_clk0_phase_shift, max_neg_abs)), i_m, i_n);
            i_g1_initial = counter_initial(get_phase_degree(ph_adjust(i_clk1_phase_shift, max_neg_abs)), i_m, i_n);
            i_g2_initial = counter_initial(get_phase_degree(ph_adjust(i_clk2_phase_shift, max_neg_abs)), i_m, i_n);
            i_g3_initial = counter_initial(get_phase_degree(ph_adjust(str2int(clk3_phase_shift), max_neg_abs)), i_m, i_n);
            if (l_pll_type == "lvds")
            begin
                i_l0_initial = i_g0_initial;
                i_l1_initial = i_g0_initial;
            end
            else
            begin
                i_l0_initial = counter_initial(get_phase_degree(ph_adjust(str2int(clk4_phase_shift), max_neg_abs)), i_m, i_n);
                i_l1_initial = counter_initial(get_phase_degree(ph_adjust(str2int(clk5_phase_shift), max_neg_abs)), i_m, i_n);
            end
            i_e0_initial = counter_initial(get_phase_degree(ph_adjust(str2int(extclk0_phase_shift), max_neg_abs)), i_m, i_n);
            i_e1_initial = counter_initial(get_phase_degree(ph_adjust(str2int(extclk1_phase_shift), max_neg_abs)), i_m, i_n);
            i_e2_initial = counter_initial(get_phase_degree(ph_adjust(str2int(extclk2_phase_shift), max_neg_abs)), i_m, i_n);
            i_e3_initial = counter_initial(get_phase_degree(ph_adjust(str2int(extclk3_phase_shift), max_neg_abs)), i_m, i_n);
            if (l_pll_type == "lvds")
                i_g0_mode = counter_mode(clk2_duty_cycle, output_counter_value(i_clk2_div_by, i_clk2_mult_by,  i_m, i_n));
            else
                i_g0_mode = counter_mode(clk0_duty_cycle, output_counter_value(i_clk0_div_by, i_clk0_mult_by,  i_m, i_n));
            i_g1_mode = counter_mode(clk1_duty_cycle,output_counter_value(i_clk1_div_by, i_clk1_mult_by,  i_m, i_n));
            i_g2_mode = counter_mode(clk2_duty_cycle,output_counter_value(i_clk2_div_by, i_clk2_mult_by,  i_m, i_n));
            i_g3_mode = counter_mode(clk3_duty_cycle,output_counter_value(i_clk3_div_by, i_clk3_mult_by,  i_m, i_n));
            if (l_pll_type == "lvds")
            begin
                i_l0_mode = "bypass";
                i_l1_mode = "bypass";
            end
            else
            begin
                i_l0_mode = counter_mode(clk4_duty_cycle,output_counter_value(i_clk4_div_by, i_clk4_mult_by,  i_m, i_n));
                i_l1_mode = counter_mode(clk5_duty_cycle,output_counter_value(i_clk5_div_by, i_clk5_mult_by,  i_m, i_n));
            end
            i_e0_mode = counter_mode(extclk0_duty_cycle,output_counter_value(i_extclk0_div_by, i_extclk0_mult_by,  i_m, i_n));
            i_e1_mode = counter_mode(extclk1_duty_cycle,output_counter_value(i_extclk1_div_by, i_extclk1_mult_by,  i_m, i_n));
            i_e2_mode = counter_mode(extclk2_duty_cycle,output_counter_value(i_extclk2_div_by, i_extclk2_mult_by,  i_m, i_n));
            i_e3_mode = counter_mode(extclk3_duty_cycle,output_counter_value(i_extclk3_div_by, i_extclk3_mult_by,  i_m, i_n));
            i_m_ph    = counter_ph(get_phase_degree(max_neg_abs), i_m, i_n);
            i_m_initial = counter_initial(get_phase_degree(max_neg_abs), i_m, i_n);
            if (l_pll_type == "lvds")
                i_g0_ph = counter_ph(get_phase_degree(ph_adjust(i_clk2_phase_shift, max_neg_abs)), i_m, i_n);
            else
                i_g0_ph = counter_ph(get_phase_degree(ph_adjust(i_clk0_phase_shift, max_neg_abs)), i_m, i_n);
            i_g1_ph = counter_ph(get_phase_degree(ph_adjust(i_clk1_phase_shift, max_neg_abs)), i_m, i_n);
            i_g2_ph = counter_ph(get_phase_degree(ph_adjust(i_clk2_phase_shift, max_neg_abs)), i_m, i_n);
            i_g3_ph = counter_ph(get_phase_degree(ph_adjust(str2int(clk3_phase_shift),max_neg_abs)), i_m, i_n);
            if (l_pll_type == "lvds")
            begin
                i_l0_ph = i_g0_ph;
                i_l1_ph = i_g0_ph;
            end
            else
            begin
                i_l0_ph = counter_ph(get_phase_degree(ph_adjust(str2int(clk4_phase_shift),max_neg_abs)), i_m, i_n);
                i_l1_ph = counter_ph(get_phase_degree(ph_adjust(str2int(clk5_phase_shift),max_neg_abs)), i_m, i_n);
            end
            i_e0_ph = counter_ph(get_phase_degree(ph_adjust(str2int(extclk0_phase_shift),max_neg_abs)), i_m, i_n);
            i_e1_ph = counter_ph(get_phase_degree(ph_adjust(str2int(extclk1_phase_shift),max_neg_abs)), i_m, i_n);
            i_e2_ph = counter_ph(get_phase_degree(ph_adjust(str2int(extclk2_phase_shift),max_neg_abs)), i_m, i_n);
            i_e3_ph = counter_ph(get_phase_degree(ph_adjust(str2int(extclk3_phase_shift),max_neg_abs)), i_m, i_n);
            if (l_pll_type == "lvds")
                i_g0_time_delay = counter_time_delay  ( str2int(clk2_time_delay),
                                                        i_m_time_delay,
                                                        i_n_time_delay);
            else
                i_g0_time_delay = counter_time_delay  ( str2int(clk0_time_delay),
                                                        i_m_time_delay,
                                                        i_n_time_delay);
            i_g1_time_delay = counter_time_delay  ( str2int(clk1_time_delay),
                                                    i_m_time_delay,
                                                    i_n_time_delay);
            i_g2_time_delay = counter_time_delay  ( str2int(clk2_time_delay),
                                                    i_m_time_delay,
                                                    i_n_time_delay);
            i_g3_time_delay = counter_time_delay  ( str2int(clk3_time_delay),
                                                    i_m_time_delay,
                                                    i_n_time_delay);
            if (l_pll_type == "lvds")
            begin
                i_l0_time_delay = i_g0_time_delay;
                i_l1_time_delay = i_g0_time_delay;
            end
            else
            begin
                i_l0_time_delay = counter_time_delay  ( str2int(clk4_time_delay),
                                                        i_m_time_delay,
                                                        i_n_time_delay);
                i_l1_time_delay = counter_time_delay  ( str2int(clk5_time_delay),
                                                        i_m_time_delay,
                                                        i_n_time_delay);
            end
            i_e0_time_delay = counter_time_delay ( str2int( extclk0_time_delay),
                                                            i_m_time_delay,
                                                            i_n_time_delay);
            i_e1_time_delay = counter_time_delay ( str2int( extclk1_time_delay),
                                                            i_m_time_delay,
                                                            i_n_time_delay);
            i_e2_time_delay = counter_time_delay ( str2int( extclk2_time_delay),
                                                            i_m_time_delay,
                                                            i_n_time_delay);
            i_e3_time_delay = counter_time_delay ( str2int( extclk3_time_delay),
                                                            i_m_time_delay,
                                                            i_n_time_delay);
            i_extclk3_counter = "e3" ;
            i_extclk2_counter = "e2" ;
            i_extclk1_counter = "e1" ;
            i_extclk0_counter = "e0" ;
            i_clk5_counter    = "l1" ;
            i_clk4_counter    = "l0" ;
            i_clk3_counter    = "g3" ;
            i_clk2_counter    = "g2" ;
            i_clk1_counter    = "g1" ;
            if (l_pll_type == "lvds")
            begin
                l_enable0_counter = "l0";
                l_enable1_counter = "l1";
                i_clk0_counter    = "l0" ;
            end
            else
                i_clk0_counter    = "g0" ;
            // in external feedback mode, need to adjust M value to take
            // into consideration the external feedback counter value
            if (l_operation_mode == "external_feedback")
            begin
                // if there is a negative phase shift, m_initial can only be 1
                if (max_neg_abs > 0)
                    i_m_initial = 1;
                if (l_feedback_source == "extclk0")
                begin
                    if (i_e0_mode == "bypass")
                        output_count = 1;
                    else
                        output_count = i_e0_high + i_e0_low;
                end
                else if (l_feedback_source == "extclk1")
                begin
                    if (i_e1_mode == "bypass")
                        output_count = 1;
                    else
                        output_count = i_e1_high + i_e1_low;
                end
                else if (l_feedback_source == "extclk2")
                begin
                    if (i_e2_mode == "bypass")
                        output_count = 1;
                    else
                        output_count = i_e2_high + i_e2_low;
                end
                else if (l_feedback_source == "extclk3")
                begin
                    if (i_e3_mode == "bypass")
                        output_count = 1;
                    else
                        output_count = i_e3_high + i_e3_low;
                end
                else // default to e0
                begin
                    if (i_e0_mode == "bypass")
                        output_count = 1;
                    else
                        output_count = i_e0_high + i_e0_low;
                end
                new_divisor = gcd(i_m, output_count);
                i_m = i_m / new_divisor;
                i_n = output_count / new_divisor;
            end
        end
        else
        begin //  m != 0
            i_n = n;
            i_m = m;
            i_l0_high = l0_high;
            i_l1_high = l1_high;
            i_g0_high = g0_high;
            i_g1_high = g1_high;
            i_g2_high = g2_high;
            i_g3_high = g3_high;
            i_e0_high = e0_high;
            i_e1_high = e1_high;
            i_e2_high = e2_high;
            i_e3_high = e3_high;
            i_l0_low  = l0_low;
            i_l1_low  = l1_low;
            i_g0_low  = g0_low;
            i_g1_low  = g1_low;
            i_g2_low  = g2_low;
            i_g3_low  = g3_low;
            i_e0_low  = e0_low;
            i_e1_low  = e1_low;
            i_e2_low  = e2_low;
            i_e3_low  = e3_low;
            i_l0_initial = l0_initial;
            i_l1_initial = l1_initial;
            i_g0_initial = g0_initial;
            i_g1_initial = g1_initial;
            i_g2_initial = g2_initial;
            i_g3_initial = g3_initial;
            i_e0_initial = e0_initial;
            i_e1_initial = e1_initial;
            i_e2_initial = e2_initial;
            i_e3_initial = e3_initial;
            i_l0_mode = alpha_tolower(l0_mode);
            i_l1_mode = alpha_tolower(l1_mode);
            i_g0_mode = alpha_tolower(g0_mode);
            i_g1_mode = alpha_tolower(g1_mode);
            i_g2_mode = alpha_tolower(g2_mode);
            i_g3_mode = alpha_tolower(g3_mode);
            i_e0_mode = alpha_tolower(e0_mode);
            i_e1_mode = alpha_tolower(e1_mode);
            i_e2_mode = alpha_tolower(e2_mode);
            i_e3_mode = alpha_tolower(e3_mode);
            i_l0_ph  = l0_ph;
            i_l1_ph  = l1_ph;
            i_g0_ph  = g0_ph;
            i_g1_ph  = g1_ph;
            i_g2_ph  = g2_ph;
            i_g3_ph  = g3_ph;
            i_e0_ph  = e0_ph;
            i_e1_ph  = e1_ph;
            i_e2_ph  = e2_ph;
            i_e3_ph  = e3_ph;
            i_m_ph   = m_ph;        // default
            i_m_initial = m_initial;
            i_l0_time_delay = l0_time_delay;
            i_l1_time_delay = l1_time_delay;
            i_g0_time_delay = g0_time_delay;
            i_g1_time_delay = g1_time_delay;
            i_g2_time_delay = g2_time_delay;
            i_g3_time_delay = g3_time_delay;
            i_e0_time_delay = e0_time_delay;
            i_e1_time_delay = e1_time_delay;
            i_e2_time_delay = e2_time_delay;
            i_e3_time_delay = e3_time_delay;
            i_m_time_delay  = m_time_delay;
            i_n_time_delay  = n_time_delay;
            i_extclk3_counter = alpha_tolower(extclk3_counter);
            i_extclk2_counter = alpha_tolower(extclk2_counter);
            i_extclk1_counter = alpha_tolower(extclk1_counter);
            i_extclk0_counter = alpha_tolower(extclk0_counter);
            i_clk5_counter    = alpha_tolower(clk5_counter);
            i_clk4_counter    = alpha_tolower(clk4_counter);
            i_clk3_counter    = alpha_tolower(clk3_counter);
            i_clk2_counter    = alpha_tolower(clk2_counter);
            i_clk1_counter    = alpha_tolower(clk1_counter);
            i_clk0_counter    = alpha_tolower(clk0_counter);
        end // user to advanced conversion
        // set the scan_chain length
        if (l_scan_chain == "long")
            scan_chain_length = EGPP_SCAN_CHAIN;
        else if (l_scan_chain == "short")
            scan_chain_length = GPP_SCAN_CHAIN;
        if (l_primary_clock == "inclk0")
        begin
            refclk_period = inclk0_input_frequency * i_n;
            primary_clock_frequency = inclk0_input_frequency;
        end
        else if (l_primary_clock == "inclk1")
        begin
            refclk_period = inclk1_input_frequency * i_n;
            primary_clock_frequency = inclk1_input_frequency;
        end
        m_times_vco_period = refclk_period;
        new_m_times_vco_period = refclk_period;
        fbclk_period = 0;
        high_time = 0;
        low_time = 0;
        schedule_vco = 0;
        schedule_offset = 1;
        vco_out[7:0] = 8'b0;
        fbclk_last_value = 0;
        offset = 0;
        temp_offset = 0;
        got_first_refclk = 0;
        got_first_fbclk = 0;
        fbclk_time = 0;
        first_fbclk_time = 0;
        refclk_time = 0;
        first_schedule = 1;
        sched_time = 0;
        vco_val = 0;
        l0_got_first_rising_edge = 0;
        l1_got_first_rising_edge = 0;
        vco_l0_last_value = 0;
        l0_count = 1;
        l1_count = 1;
        l0_tmp = 0;
        l1_tmp = 0;
        gate_count = 0;
        gate_out = 0;
        initial_delay = 0;
        fbk_phase = 0;
        for (i = 0; i <= 7; i = i + 1)
        begin
            phase_shift[i] = 0;
            last_phase_shift[i] = 0;
        end
        fbk_delay = 0;
        inclk_n = 0;
        cycle_to_adjust = 0;
        m_delay = 0;
        vco_l0 = 0;
        vco_l1 = 0;
        total_pull_back = 0;
        pull_back_M = 0;
        pull_back_ext_cntr = 0;
        vco_period_was_phase_adjusted = 0;
        phase_adjust_was_scheduled = 0;
        ena_ipd_last_value = 0;
        inclk_out_of_range = 0;
        scandataout_tmp = 0;
        scandataout_trigger = 0;
        schedule_vco_last_value = 0;
        // set initial values for counter parameters
        m_initial_val = i_m_initial;
        m_val = i_m;
        m_time_delay_val = i_m_time_delay;
        n_val = i_n;
        n_time_delay_val = i_n_time_delay;
        m_ph_val = i_m_ph;
        m2_val = m2;
        n2_val = n2;
        if (m_val == 1)
            m_mode_val = "bypass";
        if (m2_val == 1)
            m2_mode_val = "bypass";
        if (n_val == 1)
            n_mode_val = "bypass";
        if (n2_val == 1)
            n2_mode_val = "bypass";
        if (skip_vco == "on")
        begin
            m_val = 1;
            m_initial_val = 1;
            m_time_delay_val = 0;
            m_ph_val = 0;
        end
        l0_high_val = i_l0_high;
        l0_low_val = i_l0_low;
        l0_initial_val = i_l0_initial;
        l0_mode_val = i_l0_mode;
        l0_time_delay_val = i_l0_time_delay;
        l1_high_val = i_l1_high;
        l1_low_val = i_l1_low;
        l1_initial_val = i_l1_initial;
        l1_mode_val = i_l1_mode;
        l1_time_delay_val = i_l1_time_delay;
        g0_high_val = i_g0_high;
        g0_low_val = i_g0_low;
        g0_initial_val = i_g0_initial;
        g0_mode_val = i_g0_mode;
        g0_time_delay_val = i_g0_time_delay;
        g1_high_val = i_g1_high;
        g1_low_val = i_g1_low;
        g1_initial_val = i_g1_initial;
        g1_mode_val = i_g1_mode;
        g1_time_delay_val = i_g1_time_delay;
        g2_high_val = i_g2_high;
        g2_low_val = i_g2_low;
        g2_initial_val = i_g2_initial;
        g2_mode_val = i_g2_mode;
        g2_time_delay_val = i_g2_time_delay;
        g3_high_val = i_g3_high;
        g3_low_val = i_g3_low;
        g3_initial_val = i_g3_initial;
        g3_mode_val = i_g3_mode;
        g3_time_delay_val = i_g3_time_delay;
        e0_high_val = i_e0_high;
        e0_low_val = i_e0_low;
        e0_initial_val = i_e0_initial;
        e0_mode_val = i_e0_mode;
        e0_time_delay_val = i_e0_time_delay;
        e1_high_val = i_e1_high;
        e1_low_val = i_e1_low;
        e1_initial_val = i_e1_initial;
        e1_mode_val = i_e1_mode;
        e1_time_delay_val = i_e1_time_delay;
        e2_high_val = i_e2_high;
        e2_low_val = i_e2_low;
        e2_initial_val = i_e2_initial;
        e2_mode_val = i_e2_mode;
        e2_time_delay_val = i_e2_time_delay;
        e3_high_val = i_e3_high;
        e3_low_val = i_e3_low;
        e3_initial_val = i_e3_initial;
        e3_mode_val = i_e3_mode;
        e3_time_delay_val = i_e3_time_delay;
        i = 0;
        j = 0;
        inclk_last_value = 0;
        ext_fbk_cntr_ph = 0;
        ext_fbk_cntr_initial = 1;
        // initialize clkswitch variables
        clk0_is_bad = 0;
        clk1_is_bad = 0;
        inclk0_last_value = 0;
        inclk1_last_value = 0;
        other_clock_value = 0;
        other_clock_last_value = 0;
        primary_clk_is_bad = 0;
        current_clk_is_bad = 0;
        external_switch = 0;
//        current_clock = l_primary_clock;
        if (l_primary_clock == "inclk0")
            current_clock = 0;
        else
            current_clock = 1;
        if (l_primary_clock == "inclk0")
            active_clock = 0;
        else
            active_clock = 1;
        clkloss_tmp = 0;
        got_curr_clk_falling_edge_after_clkswitch = 0;
        clk0_count = 0;
        clk1_count = 0;
        switch_over_count = 0;
        active_clk_was_switched = 0;
        // initialize quiet_time
        quiet_time = slowest_clk  ( l0_high_val+l0_low_val, l0_mode_val,
                                    l1_high_val+l1_low_val, l1_mode_val,
                                    g0_high_val+g0_low_val, g0_mode_val,
                                    g1_high_val+g1_low_val, g1_mode_val,
                                    g2_high_val+g2_low_val, g2_mode_val,
                                    g3_high_val+g3_low_val, g3_mode_val,
                                    e0_high_val+e0_low_val, e0_mode_val,
                                    e1_high_val+e1_low_val, e1_mode_val,
                                    e2_high_val+e2_low_val, e2_mode_val,
                                    e3_high_val+e3_low_val, e3_mode_val,
                                    l_scan_chain,
                                    refclk_period, m_val);
        pll_in_quiet_period = 0;
        start_quiet_time = 0;
        quiet_period_violation = 0;
        reconfig_err = 0;
        scanclr_violation = 0;
        scanclr_clk_violation = 0;
        got_first_scanclk_after_scanclr_inactive_edge = 0;
        error = 0;
        scanaclr_rising_time = 0;
        scanaclr_falling_time = 0;
        // VCO feedback loop settings for external feedback mode
        // first find which ext counter is used for feedback
        if (l_operation_mode == "external_feedback")
        begin
            if (l_feedback_source == "extclk0")
            begin
                if (i_extclk0_counter == "e0")
                    ext_fbk_cntr = "e0";
                else if (i_extclk0_counter == "e1")
                    ext_fbk_cntr = "e1";
                else if (i_extclk0_counter == "e2")
                    ext_fbk_cntr = "e2";
                else if (i_extclk0_counter == "e3")
                    ext_fbk_cntr = "e3";
                else ext_fbk_cntr = "e0";
            end
            else if (l_feedback_source == "extclk1")
            begin
                if (i_extclk1_counter == "e0")
                    ext_fbk_cntr = "e0";
                else if (i_extclk1_counter == "e1")
                    ext_fbk_cntr = "e1";
                else if (i_extclk1_counter == "e2")
                    ext_fbk_cntr = "e2";
                else if (i_extclk1_counter == "e3")
                    ext_fbk_cntr = "e3";
                else ext_fbk_cntr = "e0";
            end
            else if (l_feedback_source == "extclk2")
            begin
                if (i_extclk2_counter == "e0")
                    ext_fbk_cntr = "e0";
                else if (i_extclk2_counter == "e1")
                    ext_fbk_cntr = "e1";
                else if (i_extclk2_counter == "e2")
                    ext_fbk_cntr = "e2";
                else if (i_extclk2_counter == "e3")
                    ext_fbk_cntr = "e3";
                else ext_fbk_cntr = "e0";
            end
            else if (l_feedback_source == "extclk3")
            begin
                if (i_extclk3_counter == "e0")
                    ext_fbk_cntr = "e0";
                else if (i_extclk3_counter == "e1")
                    ext_fbk_cntr = "e1";
                else if (i_extclk3_counter == "e2")
                    ext_fbk_cntr = "e2";
                else if (i_extclk3_counter == "e3")
                    ext_fbk_cntr = "e3";
                else ext_fbk_cntr = "e0";
            end
            // now save this counter's parameters
            if (ext_fbk_cntr == "e0")
            begin
                ext_fbk_cntr_high = e0_high_val;
                ext_fbk_cntr_low = e0_low_val;
                ext_fbk_cntr_ph = i_e0_ph;
                ext_fbk_cntr_initial = i_e0_initial;
                ext_fbk_cntr_delay = e0_time_delay_val;
                ext_fbk_cntr_mode = e0_mode_val;
            end
            else if (ext_fbk_cntr == "e1")
            begin
                ext_fbk_cntr_high = e1_high_val;
                ext_fbk_cntr_low = e1_low_val;
                ext_fbk_cntr_ph = i_e1_ph;
                ext_fbk_cntr_initial = i_e1_initial;
                ext_fbk_cntr_delay = e1_time_delay_val;
                ext_fbk_cntr_mode = e1_mode_val;
            end
            else if (ext_fbk_cntr == "e2")
            begin
                ext_fbk_cntr_high = e2_high_val;
                ext_fbk_cntr_low = e2_low_val;
                ext_fbk_cntr_ph = i_e2_ph;
                ext_fbk_cntr_initial = i_e2_initial;
                ext_fbk_cntr_delay = e2_time_delay_val;
                ext_fbk_cntr_mode = e2_mode_val;
            end
            else if (ext_fbk_cntr == "e3")
            begin
                ext_fbk_cntr_high = e3_high_val;
                ext_fbk_cntr_low = e3_low_val;
                ext_fbk_cntr_ph = i_e3_ph;
                ext_fbk_cntr_initial = i_e3_initial;
                ext_fbk_cntr_delay = e3_time_delay_val;
                ext_fbk_cntr_mode = e3_mode_val;
            end
            if (ext_fbk_cntr_mode == "bypass")
                ext_fbk_cntr_modulus = 1;
            else
                ext_fbk_cntr_modulus = ext_fbk_cntr_high + ext_fbk_cntr_low;
        end
        l_index = 1;
        stop_vco = 0;
        cycles_to_lock = 0;
        cycles_to_unlock = 0;
        if (l_pll_type == "fast")
            locked_tmp = 1;
        else
            locked_tmp = 0;
        pll_is_locked = 0;
        pll_about_to_lock = 0;
        no_warn = 0;
        m_val_tmp = m_val;
        n_val_tmp = n_val;
        pll_is_in_reset = 0;
        if (l_pll_type == "fast" || l_pll_type == "lvds")
            is_fast_pll = 1;
        else is_fast_pll = 0;
    end
    assign inclk_m  =   l_operation_mode == "external_feedback" ? (l_feedback_source == "extclk0" ? extclk0_tmp :
                        l_feedback_source == "extclk1" ? extclk1_tmp :
                        l_feedback_source == "extclk2" ? extclk2_tmp :
                        l_feedback_source == "extclk3" ? extclk3_tmp : 1'b0) :
                        vco_out[m_ph_val];
    stratix_m_cntr m1 (.clk(inclk_m),
                .reset(areset_ipd || (!ena_ipd) || stop_vco),
                .cout(fbclk),
                .initial_value(m_initial_val),
                .modulus(m_val),
                .time_delay(m_delay));
    always @(clkswitch_ipd)
    begin
        if (clkswitch_ipd == 1'b1)
            external_switch = 1;
        clkloss_tmp <= clkswitch_ipd;
    end
    always @(inclk0_ipd or inclk1_ipd)
    begin
        // save the inclk event value
        if (inclk0_ipd !== inclk0_last_value)
        begin
            if (current_clock !== 0)
                other_clock_value = inclk0_ipd;
        end
        if (inclk1_ipd !== inclk1_last_value)
        begin
            if (current_clock !== 1)
                other_clock_value = inclk1_ipd;
        end
        // check if either input clk is bad
        if (inclk0_ipd === 1'b1 && inclk0_ipd !== inclk0_last_value)
        begin
            clk0_count = clk0_count + 1;
            clk0_is_bad = 0;
            if (current_clock == 0)
                current_clk_is_bad = 0;
            clk1_count = 0;
            if (clk0_count > 2)
            begin
                // no event on other clk for 2 cycles
                clk1_is_bad = 1;
                if (current_clock == 1)
                    current_clk_is_bad = 1;
            end
        end
        if (inclk1_ipd === 1'b1 && inclk1_ipd !== inclk1_last_value)
        begin
            clk1_count = clk1_count + 1;
            clk1_is_bad = 0;
            if (current_clock == 1)
                current_clk_is_bad = 0;
            clk0_count = 0;
            if (clk1_count > 2)
            begin
                // no event on other clk for 2 cycles
                clk0_is_bad = 1;
                if (current_clock == 0)
                    current_clk_is_bad = 1;
            end
        end
        // check if the bad clk is the primary clock
        if (((l_primary_clock == "inclk0") && (clk0_is_bad == 1'b1)) || ((l_primary_clock == "inclk1") && (clk1_is_bad == 1'b1)))
            primary_clk_is_bad = 1;
        else
            primary_clk_is_bad = 0;
        // actual switching
        if ((inclk0_ipd !== inclk0_last_value) && (current_clock == 0))
        begin
            if (external_switch == 1'b1)
            begin
                if (!got_curr_clk_falling_edge_after_clkswitch)
                begin
                    if (inclk0_ipd === 1'b0)
                        got_curr_clk_falling_edge_after_clkswitch = 1;
                    inclk_n = inclk0_ipd;
                end
            end
            else inclk_n = inclk0_ipd;
        end
        if ((inclk1_ipd !== inclk1_last_value) && (current_clock == 1))
        begin
            if (external_switch == 1'b1)
            begin
                if (!got_curr_clk_falling_edge_after_clkswitch)
                begin
                    if (inclk1_ipd === 1'b0)
                        got_curr_clk_falling_edge_after_clkswitch = 1;
                    inclk_n = inclk1_ipd;
                end
            end
            else inclk_n = inclk1_ipd;
        end
        if ((other_clock_value == 1'b1) && (other_clock_value != other_clock_last_value) && (l_switch_over_on_lossclk == "on") && (l_enable_switch_over_counter == "on") && primary_clk_is_bad)
            switch_over_count = switch_over_count + 1;
        if ((other_clock_value == 1'b0) && (other_clock_value != other_clock_last_value))
        begin
            if ((external_switch && (got_curr_clk_falling_edge_after_clkswitch || current_clk_is_bad)) || (l_switch_over_on_lossclk == "on" && primary_clk_is_bad && ((l_enable_switch_over_counter == "off" || switch_over_count == switch_over_counter))))
            begin
                got_curr_clk_falling_edge_after_clkswitch = 0;
                if (current_clock == 0)
                begin
                    current_clock = 1;
                end
                else
                begin
                    current_clock = 0;
                end
                active_clock = ~active_clock;
                active_clk_was_switched = 1;
                switch_over_count = 0;
                external_switch = 0;
                current_clk_is_bad = 0;
            end
        end
        if (l_switch_over_on_lossclk == "on" && (clkswitch_ipd != 1'b1))
        begin
            if (primary_clk_is_bad)
                clkloss_tmp = 1;
            else
                clkloss_tmp = 0;
        end
        inclk0_last_value = inclk0_ipd;
        inclk1_last_value = inclk1_ipd;
        other_clock_last_value = other_clock_value;
    end
    and (clkbad[0], clk0_is_bad, 1'b1);
    and (clkbad[1], clk1_is_bad, 1'b1);
    and (activeclock, active_clock, 1'b1);
    and (clkloss, clkloss_tmp, 1'b1);
    stratix_n_cntr n1 ( .clk(inclk_n),
                        .reset(areset_ipd),
                        .cout(refclk),
                        .modulus(n_val),
                        .time_delay(n_time_delay_val));
    stratix_scale_cntr l0 ( .clk(vco_out[i_l0_ph]),
                            .reset(areset_ipd || (!ena_ipd) || stop_vco),
                            .cout(l0_clk),
                            .high(l0_high_val),
                            .low(l0_low_val),
                            .initial_value(l0_initial_val),
                            .mode(l0_mode_val),
                            .time_delay(l0_time_delay_val),
                            .ph_tap(i_l0_ph));
    stratix_scale_cntr l1 ( .clk(vco_out[i_l1_ph]),
                            .reset(areset_ipd || (!ena_ipd) || stop_vco),
                            .cout(l1_clk),
                            .high(l1_high_val),
                            .low(l1_low_val),
                            .initial_value(l1_initial_val),
                            .mode(l1_mode_val),
                            .time_delay(l1_time_delay_val),
                            .ph_tap(i_l1_ph));
    stratix_scale_cntr g0 ( .clk(vco_out[i_g0_ph]),
                            .reset(areset_ipd || (!ena_ipd) || stop_vco),
                            .cout(g0_clk),
                            .high(g0_high_val),
                            .low(g0_low_val),
                            .initial_value(g0_initial_val),
                            .mode(g0_mode_val),
                            .time_delay(g0_time_delay_val),
                            .ph_tap(i_g0_ph));
    stratix_pll_reg lvds_dffa ( .d(comparator_ipd),
                                .clrn(1'b1),
                                .prn(1'b1),
                                .ena(1'b1),
                                .clk(g0_clk),
                                .q(dffa_out));
    stratix_pll_reg lvds_dffb ( .d(dffa_out),
                                .clrn(1'b1),
                                .prn(1'b1),
                                .ena(1'b1),
                                .clk(lvds_dffb_clk),
                                .q(dffb_out));
    assign lvds_dffb_clk = (l_enable0_counter == "l0") ? l0_clk : (l_enable0_counter == "l1") ? l1_clk : 1'b0;
    stratix_pll_reg lvds_dffc ( .d(dffb_out),
                                .clrn(1'b1),
                                .prn(1'b1),
                                .ena(1'b1),
                                .clk(lvds_dffc_clk),
                                .q(dffc_out));
    assign lvds_dffc_clk = (l_enable0_counter == "l0") ? l0_clk : (l_enable0_counter == "l1") ? l1_clk : 1'b0;
    assign nce_temp = ~dffc_out && dffb_out;
    stratix_pll_reg lvds_dffd ( .d(nce_temp),
                                .clrn(1'b1),
                                .prn(1'b1),
                                .ena(1'b1),
                                .clk(~lvds_dffd_clk),
                                .q(dffd_out));
    assign lvds_dffd_clk = (l_enable0_counter == "l0") ? l0_clk : (l_enable0_counter == "l1") ? l1_clk : 1'b0;
    assign nce_l0 = (l_enable0_counter == "l0") ? dffd_out : 1'b0;
    assign nce_l1 = (l_enable0_counter == "l1") ? dffd_out : 1'b0;
    stratix_scale_cntr g1 ( .clk(vco_out[i_g1_ph]),
                            .reset(areset_ipd || (!ena_ipd) || stop_vco),
                            .cout(g1_clk),
                            .high(g1_high_val),
                            .low(g1_low_val),
                            .initial_value(g1_initial_val),
                            .mode(g1_mode_val),
                            .time_delay(g1_time_delay_val),
                            .ph_tap(i_g1_ph));
    stratix_scale_cntr g2 ( .clk(vco_out[i_g2_ph]),
                            .reset(areset_ipd || (!ena_ipd) || stop_vco),
                            .cout(g2_clk),
                            .high(g2_high_val),
                            .low(g2_low_val),
                            .initial_value(g2_initial_val),
                            .mode(g2_mode_val),
                            .time_delay(g2_time_delay_val),
                            .ph_tap(i_g2_ph));
    stratix_scale_cntr g3 ( .clk(vco_out[i_g3_ph]),
                            .reset(areset_ipd || (!ena_ipd) || stop_vco),
                            .cout(g3_clk),
                            .high(g3_high_val),
                            .low(g3_low_val),
                            .initial_value(g3_initial_val),
                            .mode(g3_mode_val),
                            .time_delay(g3_time_delay_val),
                            .ph_tap(i_g3_ph));
    assign cntr_e0_initial = (l_operation_mode == "external_feedback" && ext_fbk_cntr == "e0") ? 1 : e0_initial_val;
    assign cntr_e0_delay = (l_operation_mode == "external_feedback" && ext_fbk_cntr == "e0") ? ext_fbk_delay : e0_time_delay_val;
    stratix_scale_cntr e0 ( .clk(vco_out[i_e0_ph]),
                            .reset(areset_ipd || (!ena_ipd) || stop_vco),
                            .cout(e0_clk),
                            .high(e0_high_val),
                            .low(e0_low_val),
                            .initial_value(cntr_e0_initial),
                            .mode(e0_mode_val),
                            .time_delay(cntr_e0_delay),
                            .ph_tap(i_e0_ph));
    assign cntr_e1_initial = (l_operation_mode == "external_feedback" && ext_fbk_cntr == "e1") ? 1 : e1_initial_val;
    assign cntr_e1_delay = (l_operation_mode == "external_feedback" && ext_fbk_cntr == "e1") ? ext_fbk_delay : e1_time_delay_val;
    stratix_scale_cntr e1 ( .clk(vco_out[i_e1_ph]),
                            .reset(areset_ipd || (!ena_ipd) || stop_vco),
                            .cout(e1_clk),
                            .high(e1_high_val),
                            .low(e1_low_val),
                            .initial_value(cntr_e1_initial),
                            .mode(e1_mode_val),
                            .time_delay(cntr_e1_delay),
                            .ph_tap(i_e1_ph));
    assign cntr_e2_initial = (l_operation_mode == "external_feedback" && ext_fbk_cntr == "e2") ? 1 : e2_initial_val;
    assign cntr_e2_delay = (l_operation_mode == "external_feedback" && ext_fbk_cntr == "e2") ? ext_fbk_delay : e2_time_delay_val;
    stratix_scale_cntr e2 ( .clk(vco_out[i_e2_ph]),
                            .reset(areset_ipd || (!ena_ipd) || stop_vco),
                            .cout(e2_clk),
                            .high(e2_high_val),
                            .low(e2_low_val),
                            .initial_value(cntr_e2_initial),
                            .mode(e2_mode_val),
                            .time_delay(cntr_e2_delay),
                            .ph_tap(i_e2_ph));
    assign cntr_e3_initial = (l_operation_mode == "external_feedback" && ext_fbk_cntr == "e3") ? 1 : e3_initial_val;
    assign cntr_e3_delay = (l_operation_mode == "external_feedback" && ext_fbk_cntr == "e3") ? ext_fbk_delay : e3_time_delay_val;
    stratix_scale_cntr e3 ( .clk(vco_out[i_e3_ph]),
                            .reset(areset_ipd || (!ena_ipd) || stop_vco),
                            .cout(e3_clk),
                            .high(e3_high_val),
                            .low(e3_low_val),
                            .initial_value(cntr_e3_initial),
                            .mode(e3_mode_val),
                            .time_delay(cntr_e3_delay),
                            .ph_tap(i_e3_ph));
    always @((vco_out[i_l0_ph] && is_fast_pll) or posedge areset_ipd or negedge ena_ipd or stop_vco)
    begin
        if ((areset_ipd == 1'b1) || (ena_ipd == 1'b0) || (stop_vco == 1'b1))
        begin
            l0_count = 1;
            l0_got_first_rising_edge = 0;
        end
        else begin
            if (nce_l0 == 1'b0)
            begin
                if (l0_got_first_rising_edge == 1'b0)
                begin
                    if (vco_out[i_l0_ph] == 1'b1 && vco_out[i_l0_ph] != vco_l0_last_value)
                        l0_got_first_rising_edge = 1;
                end
                else if (vco_out[i_l0_ph] != vco_l0_last_value)
                begin
                    l0_count = l0_count + 1;
                    if (l0_count == (l0_high_val + l0_low_val) * 2)
                        l0_count  = 1;
                end
            end
            if (vco_out[i_l0_ph] == 1'b0 && vco_out[i_l0_ph] != vco_l0_last_value)
            begin
                if (l0_count == 1)
                begin
                    l0_tmp = 1;
                    l0_got_first_rising_edge = 0;
                end
                else l0_tmp = 0;
            end
        end
        vco_l0_last_value = vco_out[i_l0_ph];
    end
    always @((vco_out[i_l1_ph] && is_fast_pll) or posedge areset_ipd or negedge ena_ipd or stop_vco)
    begin
        if (areset_ipd == 1'b1 || ena_ipd == 1'b0 || stop_vco == 1'b1)
        begin
            l1_count = 1;
            l1_got_first_rising_edge = 0;
        end
        else begin
            if (nce_l1 == 1'b0)
            begin
                if (l1_got_first_rising_edge == 1'b0)
                begin
                    if (vco_out[i_l1_ph] == 1'b1 && vco_out[i_l1_ph] != vco_l1_last_value)
                        l1_got_first_rising_edge = 1;
                end
                else if (vco_out[i_l1_ph] != vco_l1_last_value)
                begin
                    l1_count = l1_count + 1;
                    if (l1_count == (l1_high_val + l1_low_val) * 2)
                        l1_count  = 1;
                end
            end
            if (vco_out[i_l1_ph] == 1'b0 && vco_out[i_l1_ph] != vco_l1_last_value)
            begin
                if (l1_count == 1)
                begin
                    l1_tmp = 1;
                    l1_got_first_rising_edge = 0;
                end
                else l1_tmp = 0;
            end
        end
        vco_l1_last_value = vco_out[i_l1_ph];
    end
    assign enable0_tmp = (l_enable0_counter == "l0") ? l0_tmp : l1_tmp;
    assign enable1_tmp = (l_enable1_counter == "l0") ? l0_tmp : l1_tmp;
    always @ (inclk_n or ena_ipd or areset_ipd)
    begin
        if (areset_ipd == 'b1)
        begin
            gate_count = 0;
            gate_out = 0;
        end
        else if (inclk_n == 'b1 && inclk_last_value != inclk_n)
            if (ena_ipd == 'b1)
            begin
                gate_count = gate_count + 1;
                if (gate_count == gate_lock_counter)
                    gate_out = 1;
            end
        inclk_last_value = inclk_n;
    end
    assign locked = (l_gate_lock_signal == "yes") ? gate_out && locked_tmp : locked_tmp;
    always @ (scanclk_ipd or scanaclr_ipd)
    begin
        if (scanaclr_ipd === 1'b1 && scanaclr_last_value === 1'b0)
            scanaclr_rising_time = $time;
        else if (scanaclr_ipd === 1'b0 && scanaclr_last_value === 1'b1)
        begin
            scanaclr_falling_time = $time;
            // check for scanaclr active pulse width
            if ($time - scanaclr_rising_time < TRST)
            begin
                scanclr_violation = 1;
                $display ("Warning : Detected SCANACLR ACTIVE pulse width violation. Required is 5000 ps, actual is %0t. Reconfiguration may not work.", $time - scanaclr_rising_time);
                $display ("Time: %0t  Instance: %m", $time);
            end
            else begin
                scanclr_violation = 0;
                for (i = 0; i <= scan_chain_length; i = i + 1)
                    scan_data[i] = 0;
            end
            got_first_scanclk_after_scanclr_inactive_edge = 0;
        end
        else if ((scanclk_ipd === 'b1 && scanclk_last_value !== scanclk_ipd) && (got_first_scanclk_after_scanclr_inactive_edge === 1'b0) && ($time - scanaclr_falling_time < TRSTCLK))
        begin
            scanclr_clk_violation = 1;
            $display ("Warning : Detected SCANACLR INACTIVE time violation before rising edge of SCANCLK. Required is 5000 ps, actual is %0t. Reconfiguration may not work.", $time - scanaclr_falling_time);
            $display ("Time: %0t  Instance: %m", $time);
            got_first_scanclk_after_scanclr_inactive_edge = 1;
        end
        else if (scanclk_ipd == 'b1 && scanclk_last_value != scanclk_ipd && scanaclr_ipd === 1'b0)
        begin
            if (pll_in_quiet_period && ($time - start_quiet_time < quiet_time))
            begin
                $display("Time: %0t", $time, "   Warning : Detected transition on SCANCLK during quiet time. PLL may not function correctly.");
                $display ("Time: %0t  Instance: %m", $time);
                quiet_period_violation = 1;
            end
            else begin
                pll_in_quiet_period = 0;
                for (j = scan_chain_length-1; j >= 1; j = j - 1)
                begin
                    scan_data[j] = scan_data[j - 1];
                end
                scan_data[0] = scandata_ipd;
            end
            if (got_first_scanclk_after_scanclr_inactive_edge === 1'b0)
            begin
                got_first_scanclk_after_scanclr_inactive_edge = 1;
                scanclr_clk_violation = 0;
            end
        end
        else if (scanclk_ipd === 1'b0 && scanclk_last_value !== scanclk_ipd && scanaclr_ipd === 1'b0)
        begin
            if (pll_in_quiet_period && ($time - start_quiet_time < quiet_time))
            begin
                $display("Time: %0t", $time, "   Warning : Detected transition on SCANCLK during quiet time. PLL may not function correctly.");
                $display ("Time: %0t  Instance: %m", $time);
                quiet_period_violation = 1;
            end
            else if (scan_data[scan_chain_length-1] == 1'b1)
            begin
                pll_in_quiet_period = 1;
                quiet_period_violation = 0;
                reconfig_err = 0;
                start_quiet_time = $time;
                // initiate transfer
                scandataout_tmp <= 1'b1;
                quiet_time = slowest_clk  ( l0_high_val+l0_low_val, l0_mode_val,
                                            l1_high_val+l1_low_val, l1_mode_val,
                                            g0_high_val+g0_low_val, g0_mode_val,
                                            g1_high_val+g1_low_val, g1_mode_val,
                                            g2_high_val+g2_low_val, g2_mode_val,
                                            g3_high_val+g3_low_val, g3_mode_val,
                                            e0_high_val+e0_low_val, e0_mode_val,
                                            e1_high_val+e1_low_val, e1_mode_val,
                                            e2_high_val+e2_low_val, e2_mode_val,
                                            e3_high_val+e3_low_val, e3_mode_val,
                                            l_scan_chain,
                                            refclk_period, m_val);
                scandataout_trigger <= #(quiet_time) ~scandataout_trigger;
                transfer <= 1;
            end
        end
        scanclk_last_value = scanclk_ipd;
        scanaclr_last_value = scanaclr_ipd;
    end
    always @(scandataout_trigger)
    begin
        if (areset_ipd === 1'b0)
            scandataout_tmp <= 1'b0;
    end
    always @(posedge transfer)
    begin
        if (transfer == 1'b1)
        begin
            $display("NOTE : Reconfiguring PLL");
            $display ("Time: %0t  Instance: %m", $time);
            if (l_scan_chain == "long")
            begin
                // cntr e3
                error = 0;
                if (scan_data[273] == 1'b1)
                begin
                    e3_mode_val = "bypass";
                    if (scan_data[283] == 1'b1)
                    begin
                        e3_mode_val = "off";
                        $display("Warning : The specified bit settings will turn OFF the E3 counter. It cannot be turned on unless the part is re-initialized.");
                        $display ("Time: %0t  Instance: %m", $time);
                    end
                end
                else if (scan_data[283] == 1'b1)
                    e3_mode_val = "odd";
                else
                    e3_mode_val = "even";
                // before reading delay bits, clear e3_time_delay_val
                e3_time_delay_val = 32'b0;
                e3_time_delay_val = scan_data[287:284];
                e3_time_delay_val = e3_time_delay_val * 250;
                if (e3_time_delay_val > 3000)
                    e3_time_delay_val = 3000;
                e3_high_val[8:0] <= scan_data[272:264];
                e3_low_val[8:0] <= scan_data[282:274];
                if (scan_data[272:264] == 9'b000000000)
                    e3_high_val[9:0] <= 10'b1000000000;
                else
                    e3_high_val[9] <= 1'b0;
                if (scan_data[282:274] == 9'b000000000)
                    e3_low_val[9:0] <= 10'b1000000000;
                else
                    e3_low_val[9] <= 1'b0;
                if (ext_fbk_cntr == "e3")
                begin
                    ext_fbk_cntr_high = e3_high_val;
                    ext_fbk_cntr_low = e3_low_val;
                    ext_fbk_cntr_delay = e3_time_delay_val;
                    ext_fbk_cntr_mode = e3_mode_val;
                end
                // cntr e2
                if (scan_data[249] == 1'b1)
                begin
                    e2_mode_val = "bypass";
                    if (scan_data[259] == 1'b1)
                    begin
                        e2_mode_val = "off";
                        $display("Warning : The specified bit settings will turn OFF the E2 counter. It cannot be turned on unless the part is re-initialized.");
                        $display ("Time: %0t  Instance: %m", $time);
                    end
                end
                else if (scan_data[259] == 1'b1)
                    e2_mode_val = "odd";
                else
                    e2_mode_val = "even";
                e2_time_delay_val = 32'b0;
                e2_time_delay_val = scan_data[263:260];
                e2_time_delay_val = e2_time_delay_val * 250;
                if (e2_time_delay_val > 3000)
                    e2_time_delay_val = 3000;
                e2_high_val[8:0] <= scan_data[248:240];
                e2_low_val[8:0] <= scan_data[258:250];
                if (scan_data[248:240] == 9'b000000000)
                    e2_high_val[9:0] <= 10'b1000000000;
                else
                    e2_high_val[9] <= 1'b0;
                if (scan_data[258:250] == 9'b000000000)
                    e2_low_val[9:0] <= 10'b1000000000;
                else
                    e2_low_val[9] <= 1'b0;
                if (ext_fbk_cntr == "e2")
                begin
                    ext_fbk_cntr_high = e2_high_val;
                    ext_fbk_cntr_low = e2_low_val;
                    ext_fbk_cntr_delay = e2_time_delay_val;
                    ext_fbk_cntr_mode = e2_mode_val;
                end
                // cntr e1
                if (scan_data[225] == 1'b1)
                begin
                    e1_mode_val = "bypass";
                    if (scan_data[235] == 1'b1)
                    begin
                        e1_mode_val = "off";
                        $display("Warning : The specified bit settings will turn OFF the E1 counter. It cannot be turned on unless the part is re-initialized.");
                        $display ("Time: %0t  Instance: %m", $time);
                    end
                end
                else if (scan_data[235] == 1'b1)
                    e1_mode_val = "odd";
                else
                    e1_mode_val = "even";
                e1_time_delay_val = 32'b0;
                e1_time_delay_val = scan_data[239:236];
                e1_time_delay_val = e1_time_delay_val * 250;
                if (e1_time_delay_val > 3000)
                    e1_time_delay_val = 3000;
                e1_high_val[8:0] <= scan_data[224:216];
                e1_low_val[8:0] <= scan_data[234:226];
                if (scan_data[224:216] == 9'b000000000)
                    e1_high_val[9:0] <= 10'b1000000000;
                else
                    e1_high_val[9] <= 1'b0;
                if (scan_data[234:226] == 9'b000000000)
                    e1_low_val[9:0] <= 10'b1000000000;
                else
                    e1_low_val[9] <= 1'b0;
                if (ext_fbk_cntr == "e1")
                begin
                    ext_fbk_cntr_high = e1_high_val;
                    ext_fbk_cntr_low = e1_low_val;
                    ext_fbk_cntr_delay = e1_time_delay_val;
                    ext_fbk_cntr_mode = e1_mode_val;
                end
                // cntr e0
                if (scan_data[201] == 1'b1)
                begin
                    e0_mode_val = "bypass";
                    if (scan_data[211] == 1'b1)
                    begin
                        e0_mode_val = "off";
                        $display("Warning : The specified bit settings will turn OFF the E0 counter. It cannot be turned on unless the part is re-initialized.");
                        $display ("Time: %0t  Instance: %m", $time);
                    end
                end
                else if (scan_data[211] == 1'b1)
                    e0_mode_val = "odd";
                else
                    e0_mode_val = "even";
                e0_time_delay_val = 32'b0;
                e0_time_delay_val = scan_data[215:212];
                e0_time_delay_val = e0_time_delay_val * 250;
                if (e0_time_delay_val > 3000)
                    e0_time_delay_val = 3000;
                e0_high_val[8:0] <= scan_data[200:192];
                e0_low_val[8:0] <= scan_data[210:202];
                if (scan_data[200:192] == 9'b000000000)
                    e0_high_val[9:0] <= 10'b1000000000;
                else
                    e0_high_val[9] <= 1'b0;
                if (scan_data[210:202] == 9'b000000000)
                    e0_low_val[9:0] <= 10'b1000000000;
                else
                    e0_low_val[9] <= 1'b0;
                if (ext_fbk_cntr == "e0")
                begin
                    ext_fbk_cntr_high = e0_high_val;
                    ext_fbk_cntr_low = e0_low_val;
                    ext_fbk_cntr_delay = e0_time_delay_val;
                    ext_fbk_cntr_mode = e0_mode_val;
                end
            end
            // cntr l1
            if (scan_data[177] == 1'b1)
            begin
                l1_mode_val = "bypass";
                if (scan_data[187] == 1'b1)
                begin
                    l1_mode_val = "off";
                    $display("Warning : The specified bit settings will turn OFF the L1 counter. It cannot be turned on unless the part is re-initialized.");
                    $display ("Time: %0t  Instance: %m", $time);
                end
            end
            else if (scan_data[187] == 1'b1)
                l1_mode_val = "odd";
            else
                l1_mode_val = "even";
            l1_time_delay_val = 32'b0;
            l1_time_delay_val = scan_data[191:188];
            l1_time_delay_val = l1_time_delay_val * 250;
            if (l1_time_delay_val > 3000)
                l1_time_delay_val = 3000;
            l1_high_val[8:0] <= scan_data[176:168];
            l1_low_val[8:0] <= scan_data[186:178];
            if (scan_data[176:168] == 9'b000000000)
                l1_high_val[9:0] <= 10'b1000000000;
            else
                l1_high_val[9] <= 1'b0;
            if (scan_data[186:178] == 9'b000000000)
                l1_low_val[9:0] <= 10'b1000000000;
            else
                l1_low_val[9] <= 1'b0;
            // cntr l0
            if (scan_data[153] == 1'b1)
            begin
                l0_mode_val = "bypass";
                if (scan_data[163] == 1'b1)
                begin
                    l0_mode_val = "off";
                    $display("Warning : The specified bit settings will turn OFF the L0 counter. It cannot be turned on unless the part is re-initialized.");
                    $display ("Time: %0t  Instance: %m", $time);
                end
            end
            else if (scan_data[163] == 1'b1)
                l0_mode_val = "odd";
            else
                l0_mode_val = "even";
            l0_time_delay_val = 32'b0;
            l0_time_delay_val = scan_data[167:164];
            l0_time_delay_val = l0_time_delay_val * 250;
            if (l0_time_delay_val > 3000)
                l0_time_delay_val = 3000;
            l0_high_val[8:0] <= scan_data[152:144];
            l0_low_val[8:0] <= scan_data[162:154];
            if (scan_data[152:144] == 9'b000000000)
                l0_high_val[9:0] <= 10'b1000000000;
            else
                l0_high_val[9] <= 1'b0;
            if (scan_data[162:154] == 9'b000000000)
                l0_low_val[9:0] <= 10'b1000000000;
            else
                l0_low_val[9] <= 1'b0;
            // cntr g3
            if (scan_data[129] == 1'b1)
            begin
                g3_mode_val = "bypass";
                if (scan_data[139] == 1'b1)
                begin
                    g3_mode_val = "off";
                    $display("Warning : The specified bit settings will turn OFF the G3 counter. It cannot be turned on unless the part is re-initialized.");
                    $display ("Time: %0t  Instance: %m", $time);
                end
            end
            else if (scan_data[139] == 1'b1)
                g3_mode_val = "odd";
            else
                g3_mode_val = "even";
            g3_time_delay_val = 32'b0;
            g3_time_delay_val = scan_data[143:140];
            g3_time_delay_val = g3_time_delay_val * 250;
            if (g3_time_delay_val > 3000)
                g3_time_delay_val = 3000;
            g3_high_val[8:0] <= scan_data[128:120];
            g3_low_val[8:0] <= scan_data[138:130];
            if (scan_data[128:120] == 9'b000000000)
                g3_high_val[9:0] <= 10'b1000000000;
            else
                g3_high_val[9] <= 1'b0;
            if (scan_data[138:130] == 9'b000000000)
                g3_low_val[9:0] <= 10'b1000000000;
            else
                g3_low_val[9] <= 1'b0;
            // cntr g2
            if (scan_data[105] == 1'b1)
            begin
                g2_mode_val = "bypass";
                if (scan_data[115] == 1'b1)
                begin
                    g2_mode_val = "off";
                    $display("Warning : The specified bit settings will turn OFF the G2 counter. It cannot be turned on unless the part is re-initialized.");
                    $display ("Time: %0t  Instance: %m", $time);
                end
            end
            else if (scan_data[115] == 1'b1)
                g2_mode_val = "odd";
            else
                g2_mode_val = "even";
            g2_time_delay_val = 32'b0;
            g2_time_delay_val = scan_data[119:116];
            g2_time_delay_val = g2_time_delay_val * 250;
            if (g2_time_delay_val > 3000)
                g2_time_delay_val = 3000;
            g2_high_val[8:0] <= scan_data[104:96];
            g2_low_val[8:0] <= scan_data[114:106];
            if (scan_data[104:96] == 9'b000000000)
                g2_high_val[9:0] <= 10'b1000000000;
            else
                g2_high_val[9] <= 1'b0;
            if (scan_data[114:106] == 9'b000000000)
                g2_low_val[9:0] <= 10'b1000000000;
            else
                g2_low_val[9] <= 1'b0;
            // cntr g1
            if (scan_data[81] == 1'b1)
            begin
                g1_mode_val = "bypass";
                if (scan_data[91] == 1'b1)
                begin
                    g1_mode_val = "off";
                    $display("Warning : The specified bit settings will turn OFF the G1 counter. It cannot be turned on unless the part is re-initialized.");
                    $display ("Time: %0t  Instance: %m", $time);
                end
            end
            else if (scan_data[91] == 1'b1)
                g1_mode_val = "odd";
            else
                g1_mode_val = "even";
            g1_time_delay_val = 32'b0;
            g1_time_delay_val = scan_data[95:92];
            g1_time_delay_val = g1_time_delay_val * 250;
            if (g1_time_delay_val > 3000)
                g1_time_delay_val = 3000;
            g1_high_val[8:0] <= scan_data[80:72];
            g1_low_val[8:0] <= scan_data[90:82];
            if (scan_data[80:72] == 9'b000000000)
                g1_high_val[9:0] <= 10'b1000000000;
            else
                g1_high_val[9] <= 1'b0;
            if (scan_data[90:82] == 9'b000000000)
                g1_low_val[9:0] <= 10'b1000000000;
            else
                g1_low_val[9] <= 1'b0;
            // cntr g0
            if (scan_data[57] == 1'b1)
            begin
                g0_mode_val = "bypass";
                if (scan_data[67] == 1'b1)
                begin
                    g0_mode_val = "off";
                    $display("Warning : The specified bit settings will turn OFF the G0 counter. It cannot be turned on unless the part is re-initialized.");
                    $display ("Time: %0t  Instance: %m", $time);
                end
            end
            else if (scan_data[67] == 1'b1)
                g0_mode_val = "odd";
            else
                g0_mode_val = "even";
            g0_time_delay_val = 32'b0;
            g0_time_delay_val = scan_data[71:68];
            g0_time_delay_val = g0_time_delay_val * 250;
            if (g0_time_delay_val > 3000)
                g0_time_delay_val = 3000;
            g0_high_val[8:0] <= scan_data[56:48];
            g0_low_val[8:0] <= scan_data[66:58];
            if (scan_data[56:48] == 9'b000000000)
                g0_high_val[9:0] <= 10'b1000000000;
            else
                g0_high_val[9] <= 1'b0;
            if (scan_data[66:58] == 9'b000000000)
                g0_low_val[9:0] <= 10'b1000000000;
            else
                g0_low_val[9] <= 1'b0;
            // cntr M
            error = 0;
            m_val_tmp = 0;
            m_val_tmp[8:0] = scan_data[32:24];
            if (scan_data[33] !== 1'b1)
            begin
                if (m_val_tmp[8:0] == 9'b000000001)
                begin
                    reconfig_err = 1;
                    error = 1;
                    $display ("Warning : Illegal 1 value for M counter. Instead, the M counter should be BYPASSED. Reconfiguration may not work.");
                    $display ("Time: %0t  Instance: %m", $time);
                end
                else if (m_val_tmp[8:0] == 9'b000000000)
                    m_val_tmp[9:0] = 10'b1000000000;
                if (error == 1'b0)
                begin
                    if (m_mode_val === "bypass")
                        $display ("Warning : M counter switched from BYPASS mode to enabled (M modulus = %d). PLL may lose lock.", m_val_tmp[9:0]);
                    else
                        $display("PLL reconfigured with : M modulus = %d ", m_val_tmp[9:0]);
                    $display ("Time: %0t  Instance: %m", $time);
                    m_mode_val = "";
                end
            end
            else if (scan_data[33] == 1'b1)
            begin
                if (scan_data[24] !== 1'b0)
                begin
                    reconfig_err = 1;
                    error = 1;
                    $display ("Warning : Illegal value for counter M in BYPASS mode. The LSB of the counter should be set to 0 in order to operate the counter in BYPASS mode. Reconfiguration may not work.");
                    $display ("Time: %0t  Instance: %m", $time);
                end
                else begin
                    if (m_mode_val !== "bypass")
                        $display ("Warning : M counter switched from enabled to BYPASS mode. PLL may lose lock.");
                    m_val_tmp[9:0] = 10'b0000000001;
                    m_mode_val = "bypass";
                    $display("PLL reconfigured with : M modulus = %d ", m_val_tmp[9:0]);
                    $display ("Time: %0t  Instance: %m", $time);
                end
            end
            if (skip_vco == "on")
                m_val_tmp[9:0] = 10'b0000000001;
            // cntr M2
            if (ss > 0)
            begin
                error = 0;
                m2_val[8:0] = scan_data[42:34];
                if (scan_data[43] !== 1'b1)
                begin
                    if (m2_val[8:0] == 9'b000000001)
                    begin
                        reconfig_err = 1;
                        error = 1;
                        $display ("Warning : Illegal 1 value for M2 counter. Instead, the M2 counter should be BYPASSED. Reconfiguration may not work.");
                        $display ("Time: %0t  Instance: %m", $time);
                    end
                    else if (m2_val[8:0] == 9'b000000000)
                        m2_val[9:0] = 10'b1000000000;
                    if (error == 1'b0)
                    begin
                        if (m2_mode_val === "bypass")
                        begin
                            $display ("Warning : M2 counter switched from BYPASS mode to enabled (M2 modulus = %d). Pll may lose lock.", m2_val[9:0]);
                            $display ("Time: %0t  Instance: %m", $time);
                        end
                        else
                        begin
                            $display(" M2 modulus = %d ", m2_val[9:0]);
                            $display ("Time: %0t  Instance: %m", $time);
                        end
                        m2_mode_val = "";
                    end
                end
                else if (scan_data[43] == 1'b1)
                begin
                    if (scan_data[34] !== 1'b0)
                    begin
                        reconfig_err = 1;
                        error = 1;
                        $display ("Warning : Illegal value for counter M2 in BYPASS mode. The LSB of the counter should be set to 0 in order to operate the counter in BYPASS mode. Reconfiguration may not work.");
                        $display ("Time: %0t  Instance: %m", $time);
                    end
                    else begin
                        if (m2_mode_val !== "bypass")
                        begin
                            $display ("Warning : M2 counter switched from enabled to BYPASS mode. PLL may lose lock.");
                        end
                        m2_val[9:0] = 10'b0000000001;
                        m2_mode_val = "bypass";
                        $display(" M2 modulus = %d ", m2_val[9:0]);
                        $display ("Time: %0t  Instance: %m", $time);
                    end
                end
                if (m_mode_val != m2_mode_val)
                begin
                    reconfig_err = 1;
                    error = 1;
                    $display ("Warning : Incompatible modes for M1/M2 counters. Either both should be BYASSED or both NON-BYPASSED. Reconfiguration may not work.");
                    $display ("Time: %0t  Instance: %m", $time);
                end
            end
            m_time_delay_val = 32'b0;
            m_time_delay_val = scan_data[47:44];
            m_time_delay_val = m_time_delay_val * 250;
            if (m_time_delay_val > 3000)
                m_time_delay_val = 3000;
            if (skip_vco == "on")
                m_time_delay_val = 32'b0;
            $display("                                     M time delay = %0d", m_time_delay_val);
            $display ("Time: %0t  Instance: %m", $time);
            // cntr N
            error = 0;
            n_val_tmp[8:0] = scan_data[8:0];
            n_val_tmp[9] = 1'b0;
            if (scan_data[9] !== 1'b1)
            begin
                if (n_val_tmp[8:0] == 9'b000000001)
                begin
                    reconfig_err = 1;
                    error = 1;
                    $display ("Warning : Illegal 1 value for N counter. Instead, the N counter should be BYPASSED. Reconfiguration may not work.");
                    $display ("Time: %0t  Instance: %m", $time);
                end
                else if (n_val_tmp[8:0] == 9'b000000000)
                    n_val_tmp[9:0] = 10'b1000000000;
                if (error == 1'b0)
                begin
                    if (n_mode_val === "bypass")
                    begin
                        $display ("Warning : N counter switched from BYPASS mode to enabled (N modulus = %d). PLL may lose lock.", n_val_tmp[9:0]);
                        $display ("Time: %0t  Instance: %m", $time);
                    end
                    else
                    begin
                        $display("                                     N modulus = %d ", n_val_tmp[9:0]);
                        $display ("Time: %0t  Instance: %m", $time);
                    end
                    n_mode_val = "";
                end
            end
            else if (scan_data[9] == 1'b1)     // bypass
            begin
                if (scan_data[0] !== 1'b0)
                begin
                    reconfig_err = 1;
                    error = 1;
                    $display ("Warning : Illegal value for counter N in BYPASS mode. The LSB of the counter should be set to 0 in order to operate the counter in BYPASS mode. Reconfiguration may not work.");
                    $display ("Time: %0t  Instance: %m", $time);
                end
                else begin
                    if (n_mode_val !== "bypass")
                    begin
                        $display ("Warning : N counter switched from enabled to BYPASS mode. PLL may lose lock.");
                        $display ("Time: %0t  Instance: %m", $time);
                    end
                    n_val_tmp[9:0] = 10'b0000000001;
                    n_mode_val = "bypass";
                    $display("                                     N modulus = %d ", n_val_tmp[9:0]);
                    $display ("Time: %0t  Instance: %m", $time);
                end
            end
            // cntr N2
            if (ss > 0)
            begin
                error = 0;
                n2_val[8:0] = scan_data[18:10];
                if (scan_data[19] !== 1'b1)
                begin
                    if (n2_val[8:0] == 9'b000000001)
                    begin
                        reconfig_err = 1;
                        error = 1;
                        $display ("Warning : Illegal 1 value for N2 counter. Instead, the N2 counter should be BYPASSED. Reconfiguration may not work.");
                        $display ("Time: %0t  Instance: %m", $time);
                    end
                    else if (n2_val[8:0] == 9'b000000000)
                        n2_val = 10'b1000000000;
                    if (error == 1'b0)
                    begin
                        if (n2_mode_val === "bypass")
                        begin
                            $display ("Warning : N2 counter switched from BYPASS mode to enabled (N2 modulus = %d). PLL may lose lock.", n2_val[9:0]);
                            $display ("Time: %0t  Instance: %m", $time);
                        end
                        else
                        begin
                            $display(" N2 modulus = %d ", n2_val[9:0]);
                            $display ("Time: %0t  Instance: %m", $time);
                        end
                        n2_mode_val = "";
                    end
                end
                else if (scan_data[19] == 1'b1)     // bypass
                begin
                    if (scan_data[10] !== 1'b0)
                    begin
                        reconfig_err = 1;
                        error = 1;
                        $display ("Warning : Illegal value for counter N2 in BYPASS mode. The LSB of the counter should be set to 0 in order to operate the counter in BYPASS mode. Reconfiguration may not work.");
                        $display ("Time: %0t  Instance: %m", $time);
                    end
                    else begin
                        if (n2_mode_val !== "bypass")
                        begin
                            $display ("Warning : N2 counter switched from enabled to BYPASS mode. PLL may lose lock.");
                            $display ("Time: %0t  Instance: %m", $time);
                        end
                        n2_val[9:0] = 10'b0000000001;
                        n2_mode_val = "bypass";
                        $display(" N2 modulus = %d ", n2_val[9:0]);
                        $display ("Time: %0t  Instance: %m", $time);
                    end
                end
                if (n_mode_val != n2_mode_val)
                begin
                    reconfig_err = 1;
                    error = 1;
                    $display ("Warning : Incompatible modes for N1/N2 counters. Either both should be BYASSED or both NON-BYPASSED.");
                    $display ("Time: %0t  Instance: %m", $time);
                end
            end // ss > 0
            n_time_delay_val = 32'b0;
            n_time_delay_val = scan_data[23:20];
            n_time_delay_val = n_time_delay_val * 250;
            if (n_time_delay_val > 3000)
                n_time_delay_val = 3000;
            $display("                                     N time delay = %0d", n_time_delay_val);
            $display ("Time: %0t  Instance: %m", $time);
            transfer <= 0;
            // clear the scan_chain
            for (i = 0; i <= scan_chain_length; i = i + 1)
                scan_data[i] = 0;
        end
    end
    always @(negedge transfer)
    begin
        if (l_scan_chain == "long")
        begin
            $display("                                     E3 high = %d, E3 low = %d, E3 mode = %s, E3 time delay = %0d", e3_high_val[9:0], e3_low_val[9:0], e3_mode_val, e3_time_delay_val);
            $display("                                     E2 high = %d, E2 low = %d, E2 mode = %s, E2 time delay = %0d", e2_high_val[9:0], e2_low_val[9:0], e2_mode_val, e2_time_delay_val);
            $display("                                     E1 high = %d, E1 low = %d, E1 mode = %s, E1 time delay = %0d", e1_high_val[9:0], e1_low_val[9:0], e1_mode_val, e1_time_delay_val);
            $display("                                     E0 high = %d, E0 low = %d, E0 mode = %s, E0 time delay = %0d", e0_high_val[9:0], e0_low_val[9:0], e0_mode_val, e0_time_delay_val);
        end
        $display("                                     L1 high = %d, L1 low = %d, L1 mode = %s, L1 time delay = %0d", l1_high_val[9:0], l1_low_val[9:0], l1_mode_val, l1_time_delay_val);
        $display("                                     L0 high = %d, L0 low = %d, L0 mode = %s, L0 time delay = %0d", l0_high_val[9:0], l0_low_val[9:0], l0_mode_val, l0_time_delay_val);
        $display("                                     G3 high = %d, G3 low = %d, G3 mode = %s, G3 time delay = %0d", g3_high_val[9:0], g3_low_val[9:0], g3_mode_val, g3_time_delay_val);
        $display("                                     G2 high = %d, G2 low = %d, G2 mode = %s, G2 time delay = %0d", g2_high_val[9:0], g2_low_val[9:0], g2_mode_val, g2_time_delay_val);
        $display("                                     G1 high = %d, G1 low = %d, G1 mode = %s, G1 time delay = %0d", g1_high_val[9:0], g1_low_val[9:0], g1_mode_val, g1_time_delay_val);
        $display("                                     G0 high = %d, G0 low = %d, G0 mode = %s, G0 time delay = %0d", g0_high_val[9:0], g0_low_val[9:0], g0_mode_val, g0_time_delay_val);
        $display ("Time: %0t  Instance: %m", $time);
    end
always @(schedule_vco or areset_ipd or ena_ipd)
begin
    sched_time = 0;
    for (i = 0; i <= 7; i=i+1)
        last_phase_shift[i] = phase_shift[i];
    cycle_to_adjust = 0;
    l_index = 1;
    m_times_vco_period = new_m_times_vco_period;
    // give appropriate messages
    // if areset was asserted
    if (areset_ipd == 1'b1 && areset_ipd_last_value !== areset_ipd)
    begin
        $display (" Note : %s PLL was reset", family_name);
        $display ("Time: %0t  Instance: %m", $time);
    end
    // if areset is deasserted
    if (areset_ipd === 1'b0 && areset_ipd_last_value === 1'b1)
    begin
        // deassert scandataout now and allow reconfig to complete if
        // areset was high during reconfig
        if (scandataout_tmp === 1'b1)
            scandataout_tmp <= #(quiet_time) 1'b0;
    end
    // if ena was deasserted
    if (ena_ipd == 1'b0 && ena_ipd_last_value !== ena_ipd)
    begin
        $display (" Note : %s PLL was disabled", family_name);
        $display ("Time: %0t  Instance: %m", $time);
    end
    // illegal value on areset_ipd
    if (areset_ipd === 1'bx && (areset_ipd_last_value === 1'b0 || areset_ipd_last_value === 1'b1))
    begin
        $display("Warning : Illegal value 'X' detected on ARESET input");
        $display ("Time: %0t  Instance: %m", $time);
    end
    if ((schedule_vco !== schedule_vco_last_value) && (areset_ipd == 1'b1 || ena_ipd == 1'b0 || stop_vco == 1'b1))
    begin
            if (areset_ipd === 1'b1)
                pll_is_in_reset = 1;
        // drop VCO taps to 0
        for (i = 0; i <= 7; i=i+1)
        begin
            for (j = 0; j <= last_phase_shift[i] + 1; j=j+1)
                vco_out[i] <= #(j) 1'b0;
            phase_shift[i] = 0;
            last_phase_shift[i] = 0;
        end
        // reset lock parameters
        locked_tmp = 0;
        if (l_pll_type == "fast")
            locked_tmp = 1;
        pll_is_locked = 0;
        pll_about_to_lock = 0;
        cycles_to_lock = 0;
        cycles_to_unlock = 0;
        got_first_refclk = 0;
        got_second_refclk = 0;
        refclk_time = 0;
        got_first_fbclk = 0;
        fbclk_time = 0;
        first_fbclk_time = 0;
        fbclk_period = 0;
        first_schedule = 1;
        schedule_offset = 1;
        vco_val = 0;
        vco_period_was_phase_adjusted = 0;
        phase_adjust_was_scheduled = 0;
        // reset enable0 and enable1 counter parameters
//      l0_count = 1;
//      l1_count = 1;
//      l0_got_first_rising_edge = 0;
//      l1_got_first_rising_edge = 0;
    end else if (ena_ipd === 1'b1 && areset_ipd === 1'b0 && stop_vco === 1'b0)
    begin
        // else note areset deassert time
        // note it as refclk_time to prevent false triggering
        // of stop_vco after areset
        if (areset_ipd === 1'b0 && areset_ipd_last_value === 1'b1 && pll_is_in_reset === 1'b1)
        begin
            refclk_time = $time;
            pll_is_in_reset = 0;
        end
        // calculate loop_xplier : this will be different from m_val in ext. fbk mode
        loop_xplier = m_val;
        loop_initial = i_m_initial - 1;
        loop_ph = i_m_ph;
        loop_time_delay = m_time_delay_val;
        if (l_operation_mode == "external_feedback")
        begin
            if (ext_fbk_cntr_mode == "bypass")
                ext_fbk_cntr_modulus = 1;
            else
                ext_fbk_cntr_modulus = ext_fbk_cntr_high + ext_fbk_cntr_low;
            loop_xplier = m_val * (ext_fbk_cntr_modulus);
            loop_ph = ext_fbk_cntr_ph;
            loop_initial = ext_fbk_cntr_initial - 1 + ((i_m_initial - 1) * (ext_fbk_cntr_modulus));
            loop_time_delay = m_time_delay_val + ext_fbk_cntr_delay;
        end
        // convert initial value to delay
        initial_delay = (loop_initial * m_times_vco_period)/loop_xplier;
        // convert loop ph_tap to delay
        rem = m_times_vco_period % loop_xplier;
        vco_per = m_times_vco_period/loop_xplier;
        if (rem != 0)
            vco_per = vco_per + 1;
        fbk_phase = (loop_ph * vco_per)/8;
        if (l_operation_mode == "external_feedback")
        begin
            pull_back_ext_cntr = ext_fbk_cntr_delay + (ext_fbk_cntr_initial - 1) * (m_times_vco_period/loop_xplier) + fbk_phase;
            while (pull_back_ext_cntr > refclk_period)
                pull_back_ext_cntr = pull_back_ext_cntr - refclk_period;
            pull_back_M =  m_time_delay_val + (i_m_initial - 1) * (ext_fbk_cntr_modulus) * (m_times_vco_period/loop_xplier);
            while (pull_back_M > refclk_period)
                pull_back_M = pull_back_M - refclk_period;
        end
        else begin
            pull_back_ext_cntr = 0;
            pull_back_M = initial_delay + m_time_delay_val + fbk_phase;
        end
        total_pull_back = pull_back_M + pull_back_ext_cntr;
        if (l_simulation_type == "timing")
            total_pull_back = total_pull_back + pll_compensation_delay;
        while (total_pull_back > refclk_period)
            total_pull_back = total_pull_back - refclk_period;
        if (total_pull_back > 0)
            offset = refclk_period - total_pull_back;
        if (l_operation_mode == "external_feedback")
        begin
            fbk_delay = pull_back_M;
            if (l_simulation_type == "timing")
                fbk_delay = fbk_delay + pll_compensation_delay;
            ext_fbk_delay = pull_back_ext_cntr - fbk_phase;
        end
        else begin
            fbk_delay = total_pull_back - fbk_phase;
            if (fbk_delay < 0)
            begin
                offset = offset - fbk_phase;
                fbk_delay = total_pull_back;
            end
        end
        // assign m_delay
        m_delay = fbk_delay;
        for (i = 1; i <= loop_xplier; i=i+1)
        begin
            // adjust cycles
            tmp_vco_per = m_times_vco_period/loop_xplier;
            if (rem != 0 && l_index <= rem)
            begin
                tmp_rem = (loop_xplier * l_index) % rem;
                cycle_to_adjust = (loop_xplier * l_index) / rem;
                if (tmp_rem != 0)
                    cycle_to_adjust = cycle_to_adjust + 1;
            end
            if (cycle_to_adjust == i)
            begin
                tmp_vco_per = tmp_vco_per + 1;
                l_index = l_index + 1;
            end
            // calculate high and low periods
            high_time = tmp_vco_per/2;
            if (tmp_vco_per % 2 != 0)
                high_time = high_time + 1;
            low_time = tmp_vco_per - high_time;
            // schedule the rising and falling egdes
            for (j=0; j<=1; j=j+1)
            begin
                vco_val = ~vco_val;
                if (vco_val == 1'b0)
                    sched_time = sched_time + high_time;
                else
                    sched_time = sched_time + low_time;
                // add offset
                if (schedule_offset == 1'b1)
                begin
                    sched_time = sched_time + offset;
                    schedule_offset = 0;
                end
                // schedule taps with appropriate phase shifts
                for (k = 0; k <= 7; k=k+1)
                begin
                    phase_shift[k] = (k*tmp_vco_per)/8;
                    if (first_schedule)
                        vco_out[k] <= #(sched_time + phase_shift[k]) vco_val;
                    else
                        vco_out[k] <= #(sched_time + last_phase_shift[k]) vco_val;
                end
            end
        end
        if (first_schedule)
        begin
            vco_val = ~vco_val;
            if (vco_val == 1'b0)
                sched_time = sched_time + high_time;
            else
                sched_time = sched_time + low_time;
            for (k = 0; k <= 7; k=k+1)
            begin
                phase_shift[k] = (k*tmp_vco_per)/8;
                vco_out[k] <= #(sched_time+phase_shift[k]) vco_val;
            end
            first_schedule = 0;
        end
        // this may no longer be required
        if (sched_time > 0)
            schedule_vco <= #(sched_time) ~schedule_vco;
        if (vco_period_was_phase_adjusted)
        begin
            m_times_vco_period = refclk_period;
            new_m_times_vco_period = refclk_period;
            vco_period_was_phase_adjusted = 0;
            phase_adjust_was_scheduled = 1;
            tmp_vco_per = m_times_vco_period/loop_xplier;
            for (k = 0; k <= 7; k=k+1)
                phase_shift[k] = (k*tmp_vco_per)/8;
        end
    end
    areset_ipd_last_value = areset_ipd;
    ena_ipd_last_value = ena_ipd;
    schedule_vco_last_value = schedule_vco;
end
always @(pfdena_ipd)
begin
    if (pfdena_ipd === 1'b0)
    begin
        locked_tmp = 1'bx;
        pll_is_locked = 0;
        cycles_to_lock = 0;
        $display (" Note : PFDENA was deasserted");
        $display ("Time: %0t  Instance: %m", $time);
    end
    else if (pfdena_ipd === 1'b1 && pfdena_ipd_last_value === 1'b0)
    begin
        // PFD was disabled, now enabled again
        got_first_refclk = 0;
        got_second_refclk = 0;
        refclk_time = $time;
    end
    pfdena_ipd_last_value = pfdena_ipd;
end
always @(negedge refclk)
begin
    refclk_last_value = refclk;
end
always @(negedge fbclk)
begin
    fbclk_last_value = fbclk;
end
always @(posedge refclk or posedge fbclk)
begin
    if (refclk == 1'b1 && refclk_last_value !== refclk && areset_ipd === 1'b0)
    begin
        n_val <= n_val_tmp;
        if (! got_first_refclk)
        begin
            got_first_refclk = 1;
        end else
        begin
            got_second_refclk = 1;
            refclk_period = $time - refclk_time;
            // check if incoming freq. will cause VCO range to be
            // exceeded
            if ( (vco_max != 0 && vco_min != 0) && (skip_vco == "off") && (pfdena_ipd === 1'b1) &&
                ((refclk_period/loop_xplier > vco_max) ||
                (refclk_period/loop_xplier < vco_min)) )
            begin
                if (pll_is_locked == 1'b1)
                begin
                    $display ("Warning : Input clock freq. is not within VCO range. PLL may lose lock");
                    $display ("Time: %0t  Instance: %m", $time);
                    if (inclk_out_of_range === 1'b1)
                    begin
                        // unlock
                        pll_is_locked = 0;
                        locked_tmp = 0;
                        if (l_pll_type == "fast")
                            locked_tmp = 1;
                        pll_about_to_lock = 0;
                        cycles_to_lock = 0;
                        $display ("Note : %s PLL lost lock", family_name);
                        $display ("Time: %0t  Instance: %m", $time);
                        first_schedule = 1;
                        schedule_offset = 1;
                        vco_period_was_phase_adjusted = 0;
                        phase_adjust_was_scheduled = 0;
                    end
                end
                else begin
                    if (no_warn == 0)
                    begin
                        $display ("Warning : Input clock freq. is not within VCO range. PLL may not lock");
                        $display ("Time: %0t  Instance: %m", $time);
                        no_warn = 1;
                    end
                end
                inclk_out_of_range = 1;
            end
            else begin
                inclk_out_of_range = 0;
            end
        end
        if (stop_vco == 1'b1)
        begin
            stop_vco = 0;
            schedule_vco = ~schedule_vco;
        end
        refclk_time = $time;
    end
    if (fbclk == 1'b1 && fbclk_last_value !== fbclk)
    begin
        m_val <= m_val_tmp;
        if (!got_first_fbclk)
        begin
            got_first_fbclk = 1;
            first_fbclk_time = $time;
        end
        else
            fbclk_period = $time - fbclk_time;
        // need refclk_period here, so initialized to proper value above
        if ( ( ($time - refclk_time > 1.5 * refclk_period) && pfdena_ipd === 1'b1 && pll_is_locked == 1'b1) || ( ($time - refclk_time > 5 * refclk_period) && pfdena_ipd === 1'b1) )
        begin
            stop_vco = 1;
            // reset
            got_first_refclk = 0;
            got_first_fbclk = 0;
            got_second_refclk = 0;
            if (pll_is_locked == 1'b1)
            begin
                pll_is_locked = 0;
                locked_tmp = 0;
                if (l_pll_type == "fast")
                    locked_tmp = 1;
                $display ("Note : %s PLL lost lock due to loss of input clock", family_name);
                $display ("Time: %0t  Instance: %m", $time);
            end
            pll_about_to_lock = 0;
            cycles_to_lock = 0;
            cycles_to_unlock = 0;
            first_schedule = 1;
            vco_period_was_phase_adjusted = 0;
            phase_adjust_was_scheduled = 0;
        end
        fbclk_time = $time;
    end
    if (got_second_refclk && pfdena_ipd === 1'b1 && (!inclk_out_of_range))
    begin
        // now we know actual incoming period
//       if (abs(refclk_period - fbclk_period) > 2)
//       begin
//           new_m_times_vco_period = refclk_period;
//       end
//       else if (abs(fbclk_time - refclk_time) <= 2 || (refclk_period - abs(fbclk_time - refclk_time) <= 2))
        if (abs(fbclk_time - refclk_time) <= 5 || (got_first_fbclk && abs(refclk_period - abs(fbclk_time - refclk_time)) <= 5))
        begin
            // considered in phase
            if (cycles_to_lock == valid_lock_multiplier - 1)
                pll_about_to_lock <= 1;
            if (cycles_to_lock == valid_lock_multiplier)
            begin
                if (pll_is_locked === 1'b0)
                begin
                    $display (" Note : %s PLL locked to incoming clock", family_name);
                    $display ("Time: %0t  Instance: %m", $time);
                end
                pll_is_locked = 1;
                locked_tmp = 1;
                if (l_pll_type == "fast")
                    locked_tmp = 0;
            end
            // increment lock counter only if the second part of the above
            // time check is NOT true
            if (!(abs(refclk_period - abs(fbclk_time - refclk_time)) <= 5))
            begin
                cycles_to_lock = cycles_to_lock + 1;
            end
            // adjust m_times_vco_period
            new_m_times_vco_period = refclk_period;
        end else
        begin
            // if locked, begin unlock
            if (pll_is_locked)
            begin
                cycles_to_unlock = cycles_to_unlock + 1;
                if (cycles_to_unlock == invalid_lock_multiplier)
                begin
                    pll_is_locked = 0;
                    locked_tmp = 0;
                    if (l_pll_type == "fast")
                        locked_tmp = 1;
                    pll_about_to_lock = 0;
                    cycles_to_lock = 0;
                    $display ("Note : %s PLL lost lock", family_name);
                    $display ("Time: %0t  Instance: %m", $time);
                    first_schedule = 1;
                    schedule_offset = 1;
                    vco_period_was_phase_adjusted = 0;
                    phase_adjust_was_scheduled = 0;
                end
            end
            if (abs(refclk_period - fbclk_period) <= 2)
            begin
                // frequency is still good
                if ($time == fbclk_time && (!phase_adjust_was_scheduled))
                begin
                    if (abs(fbclk_time - refclk_time) > refclk_period/2)
                    begin
                        if (abs(fbclk_time - refclk_time) > 1.5 * refclk_period)
                        begin
                            // input clock may have stopped : do nothing
                        end
                        else begin
                        new_m_times_vco_period = m_times_vco_period + (refclk_period - abs(fbclk_time - refclk_time));
                        vco_period_was_phase_adjusted = 1;
                        end
                    end else
                    begin
                        new_m_times_vco_period = m_times_vco_period - abs(fbclk_time - refclk_time);
                        vco_period_was_phase_adjusted = 1;
                    end
                end
            end else
            begin
                new_m_times_vco_period = refclk_period;
                phase_adjust_was_scheduled = 0;
            end
        end
    end
    if (quiet_period_violation == 1'b1 || reconfig_err == 1'b1 || scanclr_violation == 1'b1 || scanclr_clk_violation == 1'b1)
    begin
        locked_tmp = 0;
        if (l_pll_type == "fast")
            locked_tmp = 1;
    end
    refclk_last_value = refclk;
    fbclk_last_value = fbclk;
end
    assign clk0_tmp = i_clk0_counter == "l0" ? l0_clk : i_clk0_counter == "l1" ? l1_clk : i_clk0_counter == "g0" ? g0_clk : i_clk0_counter == "g1" ? g1_clk : i_clk0_counter == "g2" ? g2_clk : i_clk0_counter == "g3" ? g3_clk : 1'b0;
    assign clk0 = (areset_ipd === 1'b1 || ena_ipd === 1'b0) || (pll_about_to_lock == 1'b1 && !quiet_period_violation && !reconfig_err && !scanclr_violation && !scanclr_clk_violation) ? clk0_tmp : 1'bx;
    stratix_dffe ena0_reg ( .D(clkena0_ipd),
                            .CLRN(1'b1),
                            .PRN(1'b1),
                            .ENA(1'b1),
                            .CLK(!clk0_tmp),
                            .Q(ena0));
    assign clk1_tmp = i_clk1_counter == "l0" ? l0_clk : i_clk1_counter == "l1" ? l1_clk : i_clk1_counter == "g0" ? g0_clk : i_clk1_counter == "g1" ? g1_clk : i_clk1_counter == "g2" ? g2_clk : i_clk1_counter == "g3" ? g3_clk : 1'b0;
    assign clk1 = (areset_ipd === 1'b1 || ena_ipd === 1'b0) || (pll_about_to_lock == 1'b1 && !quiet_period_violation && !reconfig_err && !scanclr_violation && !scanclr_clk_violation) ? clk1_tmp : 1'bx;
    stratix_dffe ena1_reg ( .D(clkena1_ipd),
                            .CLRN(1'b1),
                            .PRN(1'b1),
                            .ENA(1'b1),
                            .CLK(!clk1_tmp),
                            .Q(ena1));
    assign clk2_tmp = i_clk2_counter == "l0" ? l0_clk : i_clk2_counter == "l1" ? l1_clk : i_clk2_counter == "g0" ? g0_clk : i_clk2_counter == "g1" ? g1_clk : i_clk2_counter == "g2" ? g2_clk : i_clk2_counter == "g3" ? g3_clk : 1'b0;
    assign clk2 = (areset_ipd === 1'b1 || ena_ipd === 1'b0) || (pll_about_to_lock == 1'b1 && !quiet_period_violation && !reconfig_err && !scanclr_violation && !scanclr_clk_violation) ? clk2_tmp : 1'bx;
    stratix_dffe ena2_reg ( .D(clkena2_ipd),
                            .CLRN(1'b1),
                            .PRN(1'b1),
                            .ENA(1'b1),
                            .CLK(!clk2_tmp),
                            .Q(ena2));
    assign clk3_tmp = i_clk3_counter == "l0" ? l0_clk : i_clk3_counter == "l1" ? l1_clk : i_clk3_counter == "g0" ? g0_clk : i_clk3_counter == "g1" ? g1_clk : i_clk3_counter == "g2" ? g2_clk : i_clk3_counter == "g3" ? g3_clk : 1'b0;
    assign clk3 = (areset_ipd === 1'b1 || ena_ipd === 1'b0) || (pll_about_to_lock == 1'b1 && !quiet_period_violation && !reconfig_err && !scanclr_violation && !scanclr_clk_violation) ? clk3_tmp : 1'bx;
    stratix_dffe ena3_reg ( .D(clkena3_ipd),
                            .CLRN(1'b1),
                            .PRN(1'b1),
                            .ENA(1'b1),
                            .CLK(!clk3_tmp),
                            .Q(ena3));
    assign clk4_tmp = i_clk4_counter == "l0" ? l0_clk : i_clk4_counter == "l1" ? l1_clk : i_clk4_counter == "g0" ? g0_clk : i_clk4_counter == "g1" ? g1_clk : i_clk4_counter == "g2" ? g2_clk : i_clk4_counter == "g3" ? g3_clk : 1'b0;
    assign clk4 = (areset_ipd === 1'b1 || ena_ipd === 1'b0) || (pll_about_to_lock == 1'b1 && !quiet_period_violation && !reconfig_err && !scanclr_violation && !scanclr_clk_violation) ? clk4_tmp : 1'bx;
    stratix_dffe ena4_reg ( .D(clkena4_ipd),
                            .CLRN(1'b1),
                            .PRN(1'b1),
                            .ENA(1'b1),
                            .CLK(!clk4_tmp),
                            .Q(ena4));
    assign clk5_tmp = i_clk5_counter == "l0" ? l0_clk : i_clk5_counter == "l1" ? l1_clk : i_clk5_counter == "g0" ? g0_clk : i_clk5_counter == "g1" ? g1_clk : i_clk5_counter == "g2" ? g2_clk : i_clk5_counter == "g3" ? g3_clk : 1'b0;
    assign clk5 = (areset_ipd === 1'b1 || ena_ipd === 1'b0) || (pll_about_to_lock == 1'b1 && !quiet_period_violation && !reconfig_err && !scanclr_violation && !scanclr_clk_violation) ? clk5_tmp : 1'bx;
    stratix_dffe ena5_reg ( .D(clkena5_ipd),
                            .CLRN(1'b1),
                            .PRN(1'b1),
                            .ENA(1'b1),
                            .CLK(!clk5_tmp),
                            .Q(ena5));
    assign extclk0_tmp = i_extclk0_counter == "e0" ? e0_clk : i_extclk0_counter == "e1" ? e1_clk : i_extclk0_counter == "e2" ? e2_clk : i_extclk0_counter == "e3" ? e3_clk : i_extclk0_counter == "g0" ? g0_clk : 1'b0;
    assign extclk0 = (areset_ipd === 1'b1 || ena_ipd === 1'b0) || (pll_about_to_lock == 1'b1 && !quiet_period_violation && !reconfig_err && !scanclr_violation && !scanclr_clk_violation) ? extclk0_tmp : 1'bx;
    stratix_dffe extena0_reg  ( .D(extclkena0_ipd),
                                .CLRN(1'b1),
                                .PRN(1'b1),
                                .ENA(1'b1),
                                .CLK(!extclk0_tmp),
                                .Q(extena0));
    assign extclk1_tmp = i_extclk1_counter == "e0" ? e0_clk : i_extclk1_counter == "e1" ? e1_clk : i_extclk1_counter == "e2" ? e2_clk : i_extclk1_counter == "e3" ? e3_clk : i_extclk1_counter == "g0" ? g0_clk : 1'b0;
    assign extclk1 = (areset_ipd === 1'b1 || ena_ipd === 1'b0) || (pll_about_to_lock == 1'b1 && !quiet_period_violation && !reconfig_err && !scanclr_violation && !scanclr_clk_violation) ? extclk1_tmp : 1'bx;
    stratix_dffe extena1_reg  ( .D(extclkena1_ipd),
                                .CLRN(1'b1),
                                .PRN(1'b1),
                                .ENA(1'b1),
                                .CLK(!extclk1_tmp),
                                .Q(extena1));
    assign extclk2_tmp = i_extclk2_counter == "e0" ? e0_clk : i_extclk2_counter == "e1" ? e1_clk : i_extclk2_counter == "e2" ? e2_clk : i_extclk2_counter == "e3" ? e3_clk : i_extclk2_counter == "g0" ? g0_clk : 1'b0;
    assign extclk2 = (areset_ipd === 1'b1 || ena_ipd === 1'b0) || (pll_about_to_lock == 1'b1 && !quiet_period_violation && !reconfig_err && !scanclr_violation && !scanclr_clk_violation) ? extclk2_tmp : 1'bx;
    stratix_dffe extena2_reg  ( .D(extclkena2_ipd),
                                .CLRN(1'b1),
                                .PRN(1'b1),
                                .ENA(1'b1),
                                .CLK(!extclk2_tmp),
                                .Q(extena2));
    assign extclk3_tmp = i_extclk3_counter == "e0" ? e0_clk : i_extclk3_counter == "e1" ? e1_clk : i_extclk3_counter == "e2" ? e2_clk : i_extclk3_counter == "e3" ? e3_clk : i_extclk3_counter == "g0" ? g0_clk : 1'b0;
    assign extclk3 = (areset_ipd === 1'b1 || ena_ipd === 1'b0) || (pll_about_to_lock == 1'b1 && !quiet_period_violation && !reconfig_err && !scanclr_violation && !scanclr_clk_violation) ? extclk3_tmp : 1'bx;
    stratix_dffe extena3_reg  ( .D(extclkena3_ipd),
                                .CLRN(1'b1),
                                .PRN(1'b1),
                                .ENA(1'b1),
                                .CLK(!extclk3_tmp),
                                .Q(extena3));
    assign enable_0 = (areset_ipd === 1'b1 || ena_ipd === 1'b0) || pll_about_to_lock == 1'b1 ? enable0_tmp : 1'bx;
    assign enable_1 = (areset_ipd === 1'b1 || ena_ipd === 1'b0) || pll_about_to_lock == 1'b1 ? enable1_tmp : 1'bx;
    // ACCELERATE OUTPUTS
    and (clk[0], ena0, clk0);
    and (clk[1], ena1, clk1);
    and (clk[2], ena2, clk2);
    and (clk[3], ena3, clk3);
    and (clk[4], ena4, clk4);
    and (clk[5], ena5, clk5);
    and (extclk[0], extena0, extclk0);
    and (extclk[1], extena1, extclk1);
    and (extclk[2], extena2, extclk2);
    and (extclk[3], extena3, extclk3);
    and (enable0, 1'b1, enable_0);
    and (enable1, 1'b1, enable_1);
    and (scandataout, 1'b1, scandataout_tmp);
endmodule