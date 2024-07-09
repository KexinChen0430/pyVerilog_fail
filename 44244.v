module
   assign xb_irq = 1'b0; // DELETE THIS LINE IF YOU UNCOMMENT THE XLR8_PCINT
/*
   localparam NUM_INTS = 1; // EDIT to be equal to the number of interrupts
   xlr8_pcint
     #(
       .XICR_Address (OX8ICR_Address),
       .XIFR_Address (OX8IFR_Address),
       .XMSK_Address (OX8MSK_Address),
       .WIDTH        (NUM_INTS)
       )
   xb_pcint_inst
     (
      // Clock and Reset
      .rstn         (rstn),
      .clk          (clk),
      // I/O
      .adr          (adr),
      .dbus_in      (dbusin),
      .dbus_out     (dbus_out),
      .iore         (iore),
      .iowe         (iowe),
      .out_en       (io_out_en),
      // DM
      .ramadr       (ramadr),
      .ramre        (ramre),
      .ramwe        (ramwe),
      .dm_sel       (dm_sel),
      .x_int_in     (), // INSERT YOUR XB INTERRUPTS HERE
      .x_irq        (xb_irq),
      .x_irq_ack    () // Don't use acks here
      );
*/
endmodule