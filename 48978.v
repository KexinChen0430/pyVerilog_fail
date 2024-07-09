module hardcopyii_dll (
    clk,
    aload,
    offset,
    upndnin,
    upndninclkena,
    addnsub,
    delayctrlout,
    offsetctrlout,
    dqsupdate,
    upndnout,
    devclrn,
    devpor);
// GLOBAL PARAMETERS - total 15
parameter input_frequency    = "10000 ps";
parameter delay_chain_length = 16;
parameter delay_buffer_mode  = "low";   // consistent with dqs
parameter delayctrlout_mode  = "normal";
parameter static_delay_ctrl  = 0;        // for test
parameter offsetctrlout_mode = "static";
parameter static_offset      = "0";
parameter jitter_reduction   = "false";
parameter use_upndnin        = "false";
parameter use_upndninclkena  = "false";
parameter sim_valid_lock     = 1;
parameter sim_loop_intrinsic_delay = 1000;
parameter sim_loop_delay_increment = 100;
parameter sim_valid_lockcount      = 90;  // 10000 = 1000 + 100*dllcounter
parameter lpm_type                 = "hardcopyii_dll";
// INPUT PORTS
input        clk;
input        aload;
input [5:0]  offset;
input        upndnin;
input        upndninclkena;
input        addnsub;
input        devclrn;
input        devpor;
// OUTPUT PORTS
output [5:0] delayctrlout;
output [5:0] offsetctrlout;
output       dqsupdate;
output       upndnout;
tri1 devclrn;
tri1 devpor;
// BUFFERED BUS INPUTS
wire [5:0] offset_in;
// TMP OUTPUTS
wire [5:0] delayctrl_out;
wire [5:0] offsetctrl_out;
wire       dqsupdate_out;
wire       upndn_out;
// FUNCTIONS
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
endfunction  // str2int
// Const VARIABLES to represent string parameters
reg [1:0] para_delay_buffer_mode;
reg [1:0] para_delayctrlout_mode;
reg [1:0] para_offsetctrlout_mode;
integer   para_static_offset;
integer   para_static_delay_ctrl;
reg       para_jitter_reduction;
reg       para_use_upndnin;
reg       para_use_upndninclkena;
// INTERNAL NETS AND VARIABLES
// for functionality - by modules
// delay and offset control out resolver
wire [5:0] dr_delayctrl_out;
wire [5:0] dr_delayctrl_int;
wire [5:0] dr_offsetctrl_out;
wire [5:0] dr_offsetctrl_int;
wire [5:0] dr_offset_in;
wire [5:0] dr_dllcount_in;
wire       dr_addnsub_in;
wire       dr_clk8_in;
wire       dr_aload_in;
reg  [5:0] dr_reg_offset;
reg  [5:0] dr_reg_dllcount;
// delay chain setting counter
wire [5:0] dc_dllcount_out;
wire       dc_dqsupdate_out;
wire       dc_upndn_in;
wire       dc_aload_in;
wire       dc_upndnclkena_in;
wire       dc_clk8_in;
wire       dc_clk1_in;
wire       dc_dlltolock_in;
reg [5:0]  dc_reg_dllcount;
reg        dc_reg_dlltolock_pulse;
// jitter reduction counter
wire       jc_upndn_out;
wire       jc_upndnclkena_out;
wire       jc_clk8_in;
wire       jc_upndn_in;
wire       jc_aload_in;
integer    jc_count;
reg        jc_reg_upndn;
reg        jc_reg_upndnclkena;
// phase comparator
wire       pc_upndn_out;
wire [5:0] pc_dllcount_in;
wire       pc_clk1_in;
wire       pc_clk8_in;
wire       pc_aload_in;
reg        pc_reg_upndn;
integer    pc_delay;
// clock generator
wire       cg_clk_in;
wire       cg_aload_in;
wire       cg_clk1_out;
wire cg_clk8a_out;
wire cg_clk8b_out;
reg cg_reg_1;
reg cg_rega_2;
reg cg_rega_3;
reg cg_regb_2;
reg cg_regb_3;
// for violation checks
reg clk_in_last_value;
reg got_first_rising_edge;
reg got_first_falling_edge;
reg per_violation;
reg duty_violation;
reg sent_per_violation;
reg sent_duty_violation;
reg dll_to_lock;  // exported signal
time clk_in_last_rising_edge;
time clk_in_last_falling_edge;
integer input_period;
integer clk_per_tolerance;
integer duty_cycle;
integer half_cycles_to_lock;
integer clk_in_period;
integer clk_in_duty_cycle;
// Timing hooks
// BUFFER INPUTS
wire clk_in;
wire aload_in;
wire offset_in5;
wire offset_in4;
wire offset_in3;
wire offset_in2;
wire offset_in1;
wire offset_in0;
wire upndn_in;
wire upndninclkena_in;
wire addnsub_in;
buf (clk_in, clk);
buf (aload_in, aload);
buf (offset_in5, offset[5]);
buf (offset_in4, offset[4]);
buf (offset_in3, offset[3]);
buf (offset_in2, offset[2]);
buf (offset_in1, offset[1]);
buf (offset_in0, offset[0]);
buf (upndn_in, upndnin);
buf (upndninclkena_in, upndninclkena);
buf (addnsub_in, addnsub);
assign offset_in = {offset_in5, offset_in4,
                    offset_in3, offset_in2,
                    offset_in1, offset_in0};
// TCO DELAYS, IO PATH and SETUP-HOLD CHECKS
specify
	(posedge clk => (delayctrlout[0] +: delayctrl_out[0])) = (0, 0);
	(posedge clk => (delayctrlout[1] +: delayctrl_out[1])) = (0, 0);
	(posedge clk => (delayctrlout[2] +: delayctrl_out[2])) = (0, 0);
	(posedge clk => (delayctrlout[3] +: delayctrl_out[3])) = (0, 0);
	(posedge clk => (delayctrlout[4] +: delayctrl_out[4])) = (0, 0);
	(posedge clk => (delayctrlout[5] +: delayctrl_out[5])) = (0, 0);
    (posedge clk  => (upndnout +: upndn_out)) = (0, 0);
    (offset => delayctrlout) = (0, 0);
	$setuphold(posedge clk, offset[0], 0, 0);
	$setuphold(posedge clk, offset[1], 0, 0);
	$setuphold(posedge clk, offset[2], 0, 0);
	$setuphold(posedge clk, offset[3], 0, 0);
	$setuphold(posedge clk, offset[4], 0, 0);
	$setuphold(posedge clk, offset[5], 0, 0);
	$setuphold(posedge clk, upndnin, 0, 0);
	$setuphold(posedge clk, upndninclkena, 0, 0);
	$setuphold(posedge clk, addnsub, 0, 0);
endspecify
// DRIVERs FOR outputs
and (delayctrlout[0], delayctrl_out[0], 1'b1);
and (delayctrlout[1], delayctrl_out[1], 1'b1);
and (delayctrlout[2], delayctrl_out[2], 1'b1);
and (delayctrlout[3], delayctrl_out[3], 1'b1);
and (delayctrlout[4], delayctrl_out[4], 1'b1);
and (delayctrlout[5], delayctrl_out[5], 1'b1);
and (offsetctrlout[0], offsetctrl_out[0], 1'b1);
and (offsetctrlout[1], offsetctrl_out[1], 1'b1);
and (offsetctrlout[2], offsetctrl_out[2], 1'b1);
and (offsetctrlout[3], offsetctrl_out[3], 1'b1);
and (offsetctrlout[4], offsetctrl_out[4], 1'b1);
and (offsetctrlout[5], offsetctrl_out[5], 1'b1);
and (dqsupdate, dqsupdate_out, 1'b1);
and (upndnout, upndn_out, 1'b1);
// INITIAL BLOCK - info messsage and legaity checks
initial
begin
    input_period = str2int(input_frequency);
    $display("Note: DLL instance %m has input frequency %0d ps", input_period);
    $display("      sim_valid_lock %0d", sim_valid_lock);
    $display("      sim_valid_lockcount %0d", sim_valid_lockcount);
    $display("      sim_loop_intrinsic_delay %0d", sim_loop_intrinsic_delay);
    $display("      sim_loop_delay_increment %0d", sim_loop_delay_increment);
    clk_in_last_value = 0;
    clk_in_last_rising_edge = 0;
    clk_in_last_falling_edge = 0;
    got_first_rising_edge = 0;
    got_first_falling_edge = 0;
    per_violation = 1'b0;
    duty_violation = 1'b0;
    sent_per_violation = 1'b0;
    sent_duty_violation = 1'b0;
    duty_cycle = input_period/2;
    clk_per_tolerance = 2;
    clk_in_period = 0;
    clk_in_duty_cycle = 0;
    dll_to_lock = 0;
    half_cycles_to_lock = 0;
    // Resolve string parameters
    para_delay_buffer_mode = delay_buffer_mode == "auto" ? 2'b00 :
	                         delay_buffer_mode == "low" ? 2'b01 : 2'b10;
    para_delayctrlout_mode = delayctrlout_mode == "offset_only" ? 2'b01 :
	                         delayctrlout_mode == "normal_offset" ? 2'b10 :
                     		 delayctrlout_mode == "static" ? 2'b11 : 2'b00;
    para_offsetctrlout_mode = offsetctrlout_mode == "dynamic_addnsub" ? 2'b11 :
                              offsetctrlout_mode == "dynamic_sub" ? 2'b10 :
	                          offsetctrlout_mode == "dynamic_add" ? 2'b01 : 2'b00;
    para_static_offset = str2int(static_offset);
	para_static_delay_ctrl = static_delay_ctrl;
    para_jitter_reduction = jitter_reduction == "true" ? 1'b1 : 1'b0;
    para_use_upndnin = use_upndnin == "true" ? 1'b1 : 1'b0;
    para_use_upndninclkena = use_upndninclkena == "true" ? 1'b1 : 1'b0;
    $display("      delay_buffer_mode %0s", delay_buffer_mode);
    $display("      delayctrlout_mode %0s", delayctrlout_mode);
    $display("      static_delay_ctrl %0d", para_static_delay_ctrl);
    $display("      offsetctrlout_mode %0s", offsetctrlout_mode);
    $display("      static_offset %0d", para_static_offset);
    $display("      use_jitter_reduction %0s", jitter_reduction);
    $display("      use_upndnin %0s", use_upndnin);
    $display("      use_upndninclkena %0s", use_upndninclkena);
end
// CLOCK PERIOD and DUTY CYCLE VIOLATION CHECKS and DLL_TO_LOCK
// exported signals to outside of this block:
always @(clk_in)
begin
    if (clk_in == 1'b1 && clk_in != clk_in_last_value) // rising edge
    begin
        if (got_first_rising_edge == 1'b0)
        begin
            got_first_rising_edge <= 1;
            half_cycles_to_lock = half_cycles_to_lock + 1;
            if (half_cycles_to_lock >= sim_valid_lock)
            begin
                dll_to_lock <= 1;
                $display($time, "  Note : DLL instance %m to lock to incoming clock per sim_valid_lock half clock cycles.");
            end
        end
        else   // subsequent rising edge
	    begin
            // check for clk_period violation and duty cycle violation
            clk_in_period = $time - clk_in_last_rising_edge;
            clk_in_duty_cycle = $time - clk_in_last_falling_edge;
            if ( (clk_in_period < (input_period - clk_per_tolerance)) ||
                 (clk_in_period > (input_period + clk_per_tolerance)) )
            begin
                per_violation = 1'b1;
                if (sent_per_violation != 1'b1)
                begin
                    $display($time, "  Warning : Input frequency violation on DLL instance %m. Specified input period is %0d ps but actual is %0d ps",
				                input_period, clk_in_period);
                    sent_per_violation = 1'b1;
                end
            end
            else if ( (clk_in_duty_cycle < (duty_cycle - clk_per_tolerance/2 - 1)) ||
			          (clk_in_duty_cycle > (duty_cycle + clk_per_tolerance/2 + 1)) )
            begin
                duty_violation = 1'b1;
                if (sent_duty_violation != 1'b1)
                begin
                    $display($time, "  Warning : Duty Cycle violation DLL instance %m. Specified duty cycle is %0d ps but actual is %0d ps",
				                   duty_cycle, clk_in_duty_cycle);
                    sent_duty_violation = 1'b1;
                end
            end
            else
            begin
                if (per_violation === 1'b1)
                begin
                    $display($time, "  Note : Input frequency on DLL instance %m now matches with specified clock frequency.");
                    sent_per_violation = 1'b0;
                end
                per_violation = 1'b0;
                duty_violation = 1'b0;
	        end
            if ((duty_violation == 1'b0) && (per_violation == 1'b0) && (dll_to_lock == 1'b0))
            begin
                // increment lock counter
                half_cycles_to_lock = half_cycles_to_lock + 1;
                if (half_cycles_to_lock >= sim_valid_lock)
                begin
                    dll_to_lock <= 1;
                    $display($time, "  Note : DLL instance %m to lock to incoming clock per sim_valid_lock half clock cycles.");
                end
            end
        end
        clk_in_last_rising_edge = $time;
    end
    else if (clk_in == 1'b0 && clk_in != clk_in_last_value) // falling edge
    begin
        got_first_falling_edge = 1;
        if (got_first_rising_edge == 1'b1)
        begin
            // check for duty cycle violation
			clk_in_duty_cycle = $time - clk_in_last_rising_edge;
            if ( (clk_in_duty_cycle < (duty_cycle - clk_per_tolerance/2 - 1)) ||
			     (clk_in_duty_cycle > (duty_cycle + clk_per_tolerance/2 + 1)) )
            begin
                duty_violation = 1'b1;
                if (sent_duty_violation != 1'b1)
                begin
                    $display($time, "  Warning : Duty Cycle violation DLL instance %m. Specified duty cycle is %0d ps but actual is %0d ps",
				                   duty_cycle, clk_in_duty_cycle);
                    sent_duty_violation = 1'b1;
                end
            end
            else
                duty_violation = 1'b0;
            if (dll_to_lock == 1'b0 && duty_violation == 1'b0)
            begin
                // increment lock counter
                half_cycles_to_lock = half_cycles_to_lock + 1;
            end
        end
        else
        begin
            // first clk edge is falling edge, do nothing
        end
        clk_in_last_falling_edge = $time;
    end
    else if (got_first_rising_edge == 1'b1 || got_first_falling_edge == 1'b1)
	begin
	    // 1 or 0 to X transitions - illegal
        // reset lock and unlock counters
        half_cycles_to_lock = 0;
        got_first_rising_edge = 0;
        got_first_falling_edge = 0;
        if (dll_to_lock)
        begin
            dll_to_lock <= 0;
            $display($time, "  Warning : clock switches from 0/1 to X. DLL instance %m will lose lock.");
        end
        else
        begin
            $display($time, "  Warning : clock switches from 0/1 to X on DLL instance %m");
        end
    end
    clk_in_last_value <= clk_in;
end
// CONNCECTING the DLL outputs ------------------------------------------------
assign delayctrl_out  = dr_delayctrl_out;
assign offsetctrl_out = dr_offsetctrl_out;
assign dqsupdate_out  = cg_clk8a_out;
assign upndn_out      = pc_upndn_out;
// Delay and offset ctrl out resolver -----------------------------------------
    // inputs
    assign dr_clk8_in = ~cg_clk8b_out;       // inverted
    assign dr_offset_in = ((offsetctrlout_mode == "dynamic_addnsub" &&  dr_addnsub_in === 1'b0) || (offsetctrlout_mode == "dynamic_sub"))  ?
                           (6'b111111 - offset_in + 6'b000001) : offset_in;
    assign dr_dllcount_in = dc_dllcount_out;
    assign dr_addnsub_in = addnsub_in;
    assign dr_aload_in = aload_in;
    // outputs
    assign dr_delayctrl_out = (delayctrlout_mode == "test") ? {cg_clk1_out,aload,addnsub,dr_reg_dllcount[2:0]} :
                              (delayctrlout_mode == "offset_only")   ?  dr_offset_in  :
                              (delayctrlout_mode == "normal_offset") ?  dr_reg_offset
							  : dr_reg_dllcount;  // both static and normal
	assign dr_offsetctrl_out = dr_reg_offset;
    // model
	assign dr_delayctrl_int = (delayctrlout_mode == "static") ? para_static_delay_ctrl : dr_dllcount_in;
    assign dr_offsetctrl_int = (offsetctrlout_mode == "static") ? para_static_offset : dr_offset_in;
	// por
    initial
    begin
        dr_reg_offset = 6'b000000;
        dr_reg_dllcount = 6'b000000;
    end
    always @(posedge dr_clk8_in or posedge dr_aload_in )
    begin
        if (dr_aload_in === 1'b1)
            dr_reg_dllcount <= 6'b000000;
        else
            dr_reg_dllcount <= dr_delayctrl_int;
    end
    always @(posedge dr_clk8_in or posedge dr_aload_in)
    begin
        if (dr_aload_in === 1'b1)
        begin
            dr_reg_offset <= 6'b000000;
        end
        else if (offsetctrlout_mode == "dynamic_addnsub")      // addnsub
        begin
            if (dr_addnsub_in === 1'b1)
                if (dr_delayctrl_int < 6'b111111 - dr_offset_in)
                    dr_reg_offset <= dr_delayctrl_int + dr_offset_in;
                else
				    dr_reg_offset <= 6'b111111;
            else if (dr_addnsub_in === 1'b0)
                if (dr_delayctrl_int > dr_offset_in)
                    dr_reg_offset <= dr_delayctrl_int - dr_offset_in;
                else
                    dr_reg_offset <= 6'b000000;
        end
        else if (offsetctrlout_mode == "dynamic_sub")  // sub
        begin
            if (dr_delayctrl_int > dr_offset_in)
                dr_reg_offset <= dr_delayctrl_int - dr_offset_in;
            else
                dr_reg_offset <= 6'b000000;
        end
        else if (offsetctrlout_mode == "dynamic_add")  // add
        begin
            if (dr_delayctrl_int < 6'b111111 - dr_offset_in)
                dr_reg_offset <= dr_delayctrl_int + dr_offset_in;
            else
                dr_reg_offset <= 6'b111111;
        end
        else if (offsetctrlout_mode == "static")       // static
        begin
	        if (para_static_offset >= 0)
                if (para_static_offset < 64 && para_static_offset < 6'b111111 - dr_delayctrl_int)
                    dr_reg_offset <= dr_delayctrl_int + para_static_offset;
				else
				    dr_reg_offset <= 6'b111111;
            else
                if (para_static_offset > -63 && dr_delayctrl_int > (-1)*para_static_offset)
                    dr_reg_offset <= dr_delayctrl_int + para_static_offset;
                else
                    dr_reg_offset <= 6'b000000;
        end
        else
    	    dr_reg_offset <= 6'b001110;  // Error
    end
// Delay Setting Control Counter ----------------------------------------------
    //inputs
    assign dc_dlltolock_in = dll_to_lock;
    assign dc_aload_in = aload_in;
    assign dc_clk1_in = cg_clk1_out;
    assign dc_clk8_in = ~cg_clk8b_out;      // inverted
    assign dc_upndnclkena_in = (para_jitter_reduction === 1'b1) ? jc_upndnclkena_out :
	                           (para_use_upndninclkena === 1'b1) ? upndninclkena : 1'b1;
    assign dc_upndn_in = (para_use_upndnin === 1'b1) ? upndnin :
	                     (para_jitter_reduction === 1'b1) ? jc_upndn_out : pc_upndn_out;
    // outputs
    assign dc_dllcount_out = dc_reg_dllcount;
    // parameters used
    // sim_valid_lockcount - ideal dll count value
    // delay_buffer_mode -
    // Model
    initial
    begin
        // low=32=6'b100000 others=16
        dc_reg_dllcount = delay_buffer_mode == "low" ? 6'b100000 : 6'b010000;
		dc_reg_dlltolock_pulse = 1'b0;
    end
	// dll counter logic
    always @(posedge dc_clk8_in or posedge dc_aload_in or posedge dc_dlltolock_in)
    begin
        if (dc_aload_in === 1'b1)
            dc_reg_dllcount <= delay_buffer_mode == "low" ? 6'b100000 : 6'b010000;
		else if (dc_dlltolock_in === 1'b1 && dc_upndnclkena_in === 1'b1 &&
                 para_use_upndnin === 1'b0 && dc_reg_dlltolock_pulse != 1'b1)
        begin
		    dc_reg_dllcount <= sim_valid_lockcount;
			dc_reg_dlltolock_pulse <= 1'b1;
		end
        else if (dc_upndnclkena_in === 1'b1) // posedge clk
        begin
            if (dc_upndn_in === 1'b1)
            begin
                if ((para_delay_buffer_mode == 2'b01 && dc_reg_dllcount < 6'b111111) ||
                         (para_delay_buffer_mode != 2'b01 && dc_reg_dllcount < 6'b011111))
                    dc_reg_dllcount <= dc_reg_dllcount + 1'b1;
			end
			else if (dc_upndn_in === 1'b0)
			begin
                if (dc_reg_dllcount > 6'b000000)
                    dc_reg_dllcount <= dc_reg_dllcount - 1'b1;
			end
        end
    end
// Jitter reduction counter ---------------------------------------------------
    // inputs
    assign jc_clk8_in = ~cg_clk8b_out;         // inverted
    assign jc_upndn_in = pc_upndn_out;
    assign jc_aload_in = aload_in;
    // outputs
    assign jc_upndn_out = jc_reg_upndn;
    assign jc_upndnclkena_out = jc_reg_upndnclkena;
    // Model
    initial
    begin
        jc_count = 8;
        jc_reg_upndnclkena = 1'b0;
		jc_reg_upndn = 1'b0;
    end
    always @(posedge jc_clk8_in or posedge jc_aload_in)
    begin
        if (jc_aload_in === 1'b1)
            jc_count <= 8;
        else if (jc_count == 12)
        begin
            jc_reg_upndn <= 1'b1;
			jc_reg_upndnclkena <= 1'b1;
			jc_count <= 8;
        end
		else if (jc_count == 4)
        begin
            jc_reg_upndn <= 1'b0;
			jc_reg_upndnclkena <= 1'b1;
			jc_count <= 8;
        end
        else  // increment/decrement counter
        begin
		    jc_reg_upndnclkena <= 1'b0;
            if (jc_upndn_in === 1'b1)
                jc_count <= jc_count + 1;
			else if (jc_upndn_in === 1'b0)
                jc_count <= jc_count - 1;
        end
    end
// Phase comparator -----------------------------------------------------------
	// inputs
	assign pc_clk1_in = cg_clk1_out;
	assign pc_clk8_in = cg_clk8b_out;        // positive edge
    assign pc_dllcount_in = dc_dllcount_out; // for phase loop calculation
    assign pc_aload_in = aload_in;
	// outputs
	assign pc_upndn_out = pc_reg_upndn;
    // parameter used
	// sim_loop_intrinsic_delay, sim_loop_delay_increment
    // Model
    initial
    begin
        pc_reg_upndn = 1'b1;
        pc_delay = 0;
    end
    always @(posedge pc_clk8_in or posedge pc_aload_in)
    begin
        if (pc_aload_in === 1'b1)
            pc_reg_upndn <= 1'b1;
        else
            pc_delay = sim_loop_intrinsic_delay + sim_loop_delay_increment * pc_dllcount_in;
            if (pc_delay > input_period)
                pc_reg_upndn <= 1'b0;
            else
            pc_reg_upndn <= 1'b1;
    end
// Clock Generator -----------------------------------------------------------
	// inputs
    assign cg_clk_in = clk_in;
    assign cg_aload_in = aload_in;
	// outputs
    assign cg_clk8a_out = cg_rega_3;
    assign cg_clk8b_out = cg_regb_3;
    assign cg_clk1_out = (cg_aload_in === 1'b1) ? 1'b0 : cg_clk_in;
	// Model
	// por
    initial
    begin
        cg_reg_1 = 1'b0;
        cg_rega_2 = 1'b0;
        cg_rega_3 = 1'b0;
        cg_regb_2 = 1'b1;
        cg_regb_3 = 1'b0;
    end
    always @(posedge cg_clk1_out or posedge cg_aload_in)
    begin
        if (cg_aload_in === 1'b1)
            cg_reg_1 <= 1'b0;
        else
            cg_reg_1 <= ~cg_reg_1;
    end
    always @(posedge cg_reg_1 or posedge cg_aload_in)
    begin
        if (cg_aload_in === 1'b1)
        begin
            cg_rega_2 <= 1'b0;
            cg_regb_2 <= 1'b1;
		end
        else
        begin
            cg_rega_2 <= ~cg_rega_2;
            cg_regb_2 <= ~cg_regb_2;
        end
    end
    always @(posedge cg_rega_2 or posedge cg_aload_in)
    begin
        if (cg_aload_in === 1'b1)
            cg_rega_3 <= 1'b0;
        else
            cg_rega_3 <= ~cg_rega_3;
    end
    always @(posedge cg_regb_2 or posedge cg_aload_in)
    begin
        if (cg_aload_in === 1'b1)
            cg_regb_3 <= 1'b0;
        else if ($time != 0)
            cg_regb_3 <= ~cg_regb_3;
    end
endmodule