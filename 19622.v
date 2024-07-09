module outputs)
   wire [31:0]          timer_count;            // From regs of timer_regs.v
   wire                 timer_enable;           // From regs of timer_regs.v
   wire                 timer_interrupt;        // From timer0 of timer.v
   wire                 timer_interrupt_clear;  // From regs of timer_regs.v
   // End of automatics
   // Registers
   timer_regs regs (/*AUTOINST*/
                    // Outputs
                    .data_out           (data_out[7:0]),
                    .interrupt          (interrupt),
                    .timer_enable       (timer_enable),
                    .timer_count        (timer_count[31:0]),
                    .timer_interrupt_clear(timer_interrupt_clear),
                    // Inputs
                    .clk                (clk),
                    .reset              (reset),
                    .port_id            (port_id[7:0]),
                    .data_in            (data_in[7:0]),
                    .read_strobe        (read_strobe),
                    .write_strobe       (write_strobe),
                    .timer_interrupt    (timer_interrupt));
   // Timer
   timer timer0(/*AUTOINST*/
                // Outputs
                .timer_interrupt        (timer_interrupt),
                // Inputs
                .clk                    (clk),
                .timer_count            (timer_count[31:0]),
                .timer_enable           (timer_enable),
                .timer_interrupt_clear  (timer_interrupt_clear));
endmodule