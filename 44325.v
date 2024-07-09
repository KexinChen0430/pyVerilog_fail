module clklock (
    inclk,     // input reference clock
    outclk     // output clock
);
// GLOBAL PARAMETER DECLARATION
parameter input_frequency = 10000;  // units in ps
parameter clockboost = 1;
// INTERNAL PARAMETER DECLARATION
parameter valid_lock_cycles = 1;
parameter invalid_lock_cycles = 2;
// INPUT PORT DECLARATION
input inclk;
// OUTPUT PORT DECLARATION
output outclk;
// INTERNAL VARIABLE/REGISTER DECLARATION
reg outclk;
reg start_outclk;
reg outclk_tmp;
reg pll_lock;
reg clk_last_value;
reg violation;
reg clk_check;
reg [1:0] next_clk_check;
reg init;
real pll_last_rising_edge;
real pll_last_falling_edge;
real actual_clk_cycle;
real expected_clk_cycle;
real pll_duty_cycle;
real inclk_period;
real expected_next_clk_edge;
integer pll_rising_edge_count;
integer stop_lock_count;
integer start_lock_count;
integer clk_per_tolerance;
// variables for clock synchronizing
time last_synchronizing_rising_edge_for_outclk;
time outclk_synchronizing_period;
integer input_cycles_per_outclk;
integer outclk_cycles_per_sync_period;
integer input_cycle_count_to_sync0;
// variables for shedule_outclk
reg schedule_outclk;
reg output_value0;
time sched_time0;
integer rem0;
integer tmp_rem0;
integer clk_cnt0;
integer cyc0;
integer inc0;
integer cycle_to_adjust0;
time tmp_per0;
time ori_per0;
time high_time0;
time low_time0;
// INITIAL BLOCK
initial
begin
    // check for invalid parameters
    if (input_frequency <= 0)
    begin
        $display("ERROR: The period of the input clock (input_frequency) must be greater than 0");
        $stop;
    end
    if ((clockboost != 1) && (clockboost != 2))
    begin
        $display("ERROR: The clock multiplication factor (clockboost) must be a value of 1 or 2.");
        $stop;
    end
    stop_lock_count = 0;
    violation = 0;
    // clock synchronizing variables
    last_synchronizing_rising_edge_for_outclk = 0;
    outclk_synchronizing_period = 0;
    input_cycles_per_outclk = 1;
    outclk_cycles_per_sync_period = clockboost;
    input_cycle_count_to_sync0 = 0;
    inc0 = 1;
    cycle_to_adjust0 = 0;
    outclk_cycles_per_sync_period = clockboost;
    input_cycles_per_outclk = 1;
    clk_per_tolerance = 0.1 * input_frequency;
end
always @(next_clk_check)
begin
    if (next_clk_check == 1)
    begin
        if ((clk_check === 1'b1) || (clk_check === 1'b0))
            #((inclk_period+clk_per_tolerance)/2) clk_check = ~clk_check;
        else
            #((inclk_period+clk_per_tolerance)/2) clk_check = 1'b1;
    end
    else if (next_clk_check == 2)
    begin
        if ((clk_check === 1'b1) || (clk_check === 1'b0))
            #(expected_next_clk_edge - $realtime) clk_check = ~clk_check;
        else
            #(expected_next_clk_edge - $realtime) clk_check = 1'b1;
    end
    next_clk_check = 0;
end
always @(inclk or clk_check)
begin
    if(init !== 1'b1)
    begin
        start_lock_count = 0;
        pll_rising_edge_count = 0;
        pll_last_rising_edge = 0;
        pll_last_falling_edge = 0;
        pll_lock = 0;
        init = 1'b1;
    end
    if ((inclk == 1'b1) && (clk_last_value !== inclk))
    begin
        if (pll_lock === 1)
            next_clk_check = 1;
        if (pll_rising_edge_count == 0)   // this is first rising edge
        begin
            inclk_period = input_frequency;
            pll_duty_cycle = inclk_period/2;
            start_outclk = 0;
        end
        else if (pll_rising_edge_count == 1) // this is second rising edge
        begin
            expected_clk_cycle = inclk_period;
            actual_clk_cycle = $realtime - pll_last_rising_edge;
            if (actual_clk_cycle < (expected_clk_cycle - clk_per_tolerance) ||
                actual_clk_cycle > (expected_clk_cycle + clk_per_tolerance))
            begin
                $display($realtime, "ps Warning: Inclock_Period Violation");
                $display ("Instance: %m");
                violation = 1;
                if (pll_lock == 1'b1)
                begin
                    stop_lock_count = stop_lock_count + 1;
                    if ((pll_lock == 1'b1) && (stop_lock_count == invalid_lock_cycles))
                    begin
                        pll_lock = 0;
                        $display ($realtime, "ps Warning: altclklock out of lock.");
                        $display ("Instance: %m");
                        start_lock_count = 1;
                        stop_lock_count = 0;
                        outclk_tmp = 1'bx;
                    end
                end
                else begin
                    start_lock_count = 1;
                end
            end
            else
            begin
                if (($realtime - pll_last_falling_edge) < (pll_duty_cycle - clk_per_tolerance/2) ||
                    ($realtime - pll_last_falling_edge) > (pll_duty_cycle + clk_per_tolerance/2))
                begin
                    $display($realtime, "ps Warning: Duty Cycle Violation");
                    $display ("Instance: %m");
                    violation = 1;
                end
                else
                    violation = 0;
            end
        end
        else if (($realtime - pll_last_rising_edge) < (expected_clk_cycle - clk_per_tolerance) ||
                ($realtime - pll_last_rising_edge) > (expected_clk_cycle + clk_per_tolerance))
        begin
            $display($realtime, "ps Warning: Cycle Violation");
            $display ("Instance: %m");
            violation = 1;
            if (pll_lock == 1'b1)
            begin
                stop_lock_count = stop_lock_count + 1;
                if (stop_lock_count == invalid_lock_cycles)
                begin
                    pll_lock = 0;
                    $display ($realtime, "ps Warning: altclklock out of lock.");
                    $display ("Instance: %m");
                    start_lock_count = 1;
                    stop_lock_count = 0;
                    outclk_tmp = 1'bx;
                end
            end
            else
            begin
                start_lock_count = 1;
            end
        end
        else
        begin
            violation = 0;
            actual_clk_cycle = $realtime - pll_last_rising_edge;
        end
        pll_last_rising_edge = $realtime;
        pll_rising_edge_count = pll_rising_edge_count + 1;
        if (!violation)
        begin
            if (pll_lock == 1'b1)
            begin
                input_cycle_count_to_sync0 = input_cycle_count_to_sync0 + 1;
                if (input_cycle_count_to_sync0 == input_cycles_per_outclk)
                begin
                    outclk_synchronizing_period = $realtime - last_synchronizing_rising_edge_for_outclk;
                    last_synchronizing_rising_edge_for_outclk = $realtime;
                    schedule_outclk = 1;
                    input_cycle_count_to_sync0 = 0;
                end
            end
            else
            begin
                start_lock_count = start_lock_count + 1;
                if (start_lock_count >= valid_lock_cycles)
                begin
                    pll_lock = 1;
                    input_cycle_count_to_sync0 = 0;
                    outclk_synchronizing_period = actual_clk_cycle * input_cycles_per_outclk;
                    last_synchronizing_rising_edge_for_outclk = $realtime;
                    schedule_outclk = 1;
                end
            end
        end
        else
            start_lock_count = 1;
    end
    else if ((inclk == 1'b0) && (clk_last_value !== inclk))
    begin
        if (pll_lock == 1)
        begin
            next_clk_check = 1;
            if (($realtime - pll_last_rising_edge) < (pll_duty_cycle - clk_per_tolerance/2) ||
                ($realtime - pll_last_rising_edge) > (pll_duty_cycle + clk_per_tolerance/2))
            begin
                $display($realtime, "ps Warning: Duty Cycle Violation");
                $display ("Instance: %m");
                violation = 1;
                if (pll_lock == 1'b1)
                begin
                    stop_lock_count = stop_lock_count + 1;
                    if (stop_lock_count == invalid_lock_cycles)
                    begin
                        pll_lock = 0;
                        $display ($realtime, "ps Warning: clklock out of lock.");
                        $display ("Instance: %m");
                        start_lock_count = 0;
                        stop_lock_count = 0;
                        outclk_tmp = 1'bx;
                    end
                end
            end
            else
                violation = 0;
        end
        pll_last_falling_edge = $realtime;
    end
    else if (pll_lock == 1)
    begin
    if (inclk == 1'b1)
        expected_next_clk_edge = pll_last_rising_edge + (inclk_period+clk_per_tolerance)/2;
    else if (inclk == 'b0)
        expected_next_clk_edge = pll_last_falling_edge + (inclk_period+clk_per_tolerance)/2;
    else
        expected_next_clk_edge = 0;
        violation = 0;
        if ($realtime < expected_next_clk_edge)
            next_clk_check = 2;
        else if ($realtime == expected_next_clk_edge)
            next_clk_check = 1;
        else
        begin
            $display($realtime, "ps Warning: Inclock_Period Violation");
            $display ("Instance: %m");
            violation = 1;
            if (pll_lock == 1'b1)
            begin
                stop_lock_count = stop_lock_count + 1;
                expected_next_clk_edge = $realtime + (inclk_period/2);
                if (stop_lock_count == invalid_lock_cycles)
                begin
                    pll_lock = 0;
                    $display ($realtime, "ps Warning: altclklock out of lock.");
                    $display ("Instance: %m");
                    start_lock_count = 1;
                    stop_lock_count = 0;
                    outclk_tmp = 1'bx;
                end
                else
                    next_clk_check = 2;
            end
        end
    end
    clk_last_value = inclk;
end
// outclk output
always @(posedge schedule_outclk)
begin
    // initialise variables
    inc0 = 1;
    cycle_to_adjust0 = 0;
    output_value0 = 1'b1;
    sched_time0 = 0;
    rem0 = outclk_synchronizing_period % outclk_cycles_per_sync_period;
    ori_per0 = outclk_synchronizing_period / outclk_cycles_per_sync_period;
    // schedule <outclk_cycles_per_sync_period> number of outclk cycles in this
    // loop - in order to synchronize the output clock always to the input clock
    // to get rid of clock drift for cases where the input clock period is
    // not evenly divisible
    for (clk_cnt0 = 1; clk_cnt0 <= outclk_cycles_per_sync_period;
        clk_cnt0 = clk_cnt0 + 1)
    begin
        tmp_per0 = ori_per0;
        if ((rem0 != 0) && (inc0 <= rem0))
        begin
            tmp_rem0 = (outclk_cycles_per_sync_period * inc0) % rem0;
            cycle_to_adjust0 = (outclk_cycles_per_sync_period * inc0) / rem0;
            if (tmp_rem0 != 0)
                cycle_to_adjust0 = cycle_to_adjust0 + 1;
        end
        // if this cycle is the one to adjust the output clock period, then
        // increment the period by 1 unit
        if (cycle_to_adjust0 == clk_cnt0)
        begin
            tmp_per0 = tmp_per0 + 1;
            inc0 = inc0 + 1;
        end
        // adjust the high and low cycle period
        high_time0 = tmp_per0 / 2;
        if ((tmp_per0 % 2) != 0)
            high_time0 = high_time0 + 1;
        low_time0 = tmp_per0 - high_time0;
        // schedule the high and low cycle of 1 output clock period
        for (cyc0 = 0; cyc0 <= 1; cyc0 = cyc0 + 1)
        begin
            // Avoid glitch in vcs when high_time0 and low_time0 is 0
            // (due to outclk_synchronizing_period is 0)
            if (outclk_synchronizing_period != 0)
                outclk_tmp = #(sched_time0) output_value0;
            else
                outclk_tmp = #(sched_time0) 1'b0;
            output_value0 = ~output_value0;
            if (output_value0 == 1'b0)
            begin
                sched_time0 = high_time0;
            end
            else if (output_value0 == 1'b1)
            begin
                sched_time0 = low_time0;
            end
        end
    end
    // drop the schedule_outclk to 0 so that the "always@(inclk)" block can
    // trigger this block again when the correct time comes
    schedule_outclk = #1 1'b0;
end
always @(outclk_tmp)
begin
        outclk <= outclk_tmp;
end
endmodule