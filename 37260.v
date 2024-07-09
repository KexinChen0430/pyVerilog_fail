module
  audioManager management(
    .clock(clock_27mhz),
    .reset(memReset),
    // User I/O
    .startSwitch(startSwitch),
    .audioSelector(percent_kept),
    .writeSwitch(writeSwitch),
    // .hexdisp(hexdisp),
    .audioTrigger(audioTrigger),
    // AC97 I/O
    .ready(ready),
    .from_ac97_data(from_ac97_data),
    .to_ac97_data(to_ac97_data),
    // Flash I/O
    .flash_data(flash_data),
    .flash_address(flash_address),
    .flash_ce_b(flash_ce_b),
    .flash_oe_b(flash_oe_b),
    .flash_we_b(flash_we_b),
    .flash_reset_b(flash_reset_b),
    .flash_byte_b(flash_byte_b),
    .flash_sts(flash_sts),
    .busy(busy),
    // USB I/O
    .data(user1[31:24]), //the data pins from the USB fifo
    .rxf(user1[23]), //the rxf pin from the USB fifo
    .rd(user1[22]) //the rd pin TO the USB FIFO (OUTPUT)
  );
endmodule