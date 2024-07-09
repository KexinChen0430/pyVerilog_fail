module stratixiigx_termination (
    rup,
    rdn,
    terminationclock,
    terminationclear,
    terminationenable,
    terminationpullup,
    terminationpulldown,
    devpor,
    devclrn,
    incrup,
    incrdn,
    terminationcontrol,
    terminationcontrolprobe);
input         rup;
input 	      rdn;
input 	      terminationclock;
input 	      terminationclear;
input 	      terminationenable;
input [6:0]   terminationpullup;
input [6:0]   terminationpulldown;
input         devpor;
input         devclrn;
output 	      incrup;
output 	      incrdn;
output [13:0] terminationcontrol;
output [6:0]  terminationcontrolprobe;
parameter runtime_control = "false";
parameter use_core_control = "false";
parameter pullup_control_to_core = "true";
parameter use_high_voltage_compare = "true";
parameter use_both_compares = "false";
parameter pullup_adder = 0;
parameter pulldown_adder = 0;
parameter half_rate_clock = "false";
parameter power_down = "true";
parameter left_shift = "false";
parameter test_mode = "false";
parameter lpm_type = "stratixiigx_termination";
tri1 devclrn;
tri1 devpor;
// BUFFERED BUS INPUTS
wire       rup_in;
wire 	   rdn_in;
wire 	   clock_in;
wire 	   clear_in;
wire 	   enable_in;
wire [6:0] pullup_in;
wire [6:0] pulldown_in;
// TMP OUTPUTS
wire        incrup_out;
wire        incrdn_out;
wire [13:0] control_out;
wire [6:0]  controlprobe_out;
wire [6:0]  rup_control_out;
wire [6:0]  rdn_control_out;
wire        ena1;
// FUNCTIONS
// INTERNAL NETS AND VARIABLES
// TIMING HOOKS
buf (rup_in, rup);
buf (rdn_in, rdn);
buf (clock_in,terminationclock);
buf (clear_in,terminationclear);
buf (enable_in,terminationenable);
buf buf_pullup [6:0] (pullup_in, terminationpullup);
buf buf_pulldn [6:0] (pulldown_in, terminationpulldown);
specify
    (posedge terminationclock => (terminationcontrol +: control_out)) = (0,0);
    (posedge terminationclock => (terminationcontrolprobe +: controlprobe_out)) = (0,0);
endspecify
// output driver
buf buf_ctrl_out [13:0] (terminationcontrol,control_out);
buf buf_ctrlprobe_out [6:0] (terminationcontrolprobe,controlprobe_out);
// MODEL
assign incrup = incrup_out;
assign incrdn = incrdn_out;
assign incrup_out = (power_down == "true") ? (enable_in & rup_in) : rup_in;
assign incrdn_out = (power_down == "true") ? ~(enable_in & rdn_in) : ~rdn_in;
assign control_out = {rup_control_out, rdn_control_out};
assign controlprobe_out =  pullup_control_to_core == "true" ?
                           rdn_control_out : rup_control_out;
assign ena1 = (runtime_control === "true")? enable_in : 1'b0;
stratixiigx_termination_digital rup_block(
    .rin(incrup_out),
    .clk(clock_in),
    .clr(clear_in),
    .ena(ena1),
    .padder(pulldown_in),
    .devpor(devpor),
    .devclrn(devclrn),
    .ctrlout(rup_control_out)
);
defparam rup_block.runtime_control = runtime_control;
defparam rup_block.use_core_control = use_core_control;
defparam rup_block.use_both_compares = use_both_compares;
defparam rup_block.pull_adder = pulldown_adder;
defparam rup_block.power_down = power_down;
defparam rup_block.left_shift = left_shift;
defparam rup_block.test_mode = test_mode;
stratixiigx_termination_digital rdn_block(
    .rin(incrdn_out),
    .clk(clock_in),
    .clr(clear_in),
    .ena(ena1),
    .padder(pullup_in),
    .devpor(devpor),
    .devclrn(devclrn),
    .ctrlout(rdn_control_out)
);
defparam rdn_block.runtime_control = runtime_control;
defparam rdn_block.use_core_control = use_core_control;
defparam rdn_block.use_both_compares = use_both_compares;
defparam rdn_block.pull_adder = pullup_adder;
defparam rdn_block.power_down = power_down;
defparam rdn_block.left_shift = left_shift;
defparam rdn_block.test_mode = test_mode;
endmodule