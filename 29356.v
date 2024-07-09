module!
   adxl362_spi spi(/*AUTOINST*/
                   // Outputs
                   .MISO                (MISO),
                   .address             (address[5:0]),
                   .data_write          (data_write[7:0]),
                   .data_fifo_write     (data_fifo_write),
                   .write               (write),
                   .read_data_fifo      (read_data_fifo),
                   // Inputs
                   .SCLK                (SCLK),
                   .MOSI                (MOSI),
                   .nCS                 (nCS),
                   .clk_sys           (clk_sys),
                   .data_read           (data_read[7:0]),
                   .data_fifo_read      (data_fifo_read[15:0]),
                   .rst                 (rst));
   // Registers
   // These are the firmware accessible registers
   adxl362_regs registers(/*AUTOINST*/
                          // Outputs
                          .data_read            (data_read[7:0]),
                          .threshold_active     (threshold_active[10:0]),
                          .time_active          (time_active[7:0]),
                          .threshold_inactive   (threshold_inactive[10:0]),
                          .time_inactive        (time_inactive[15:0]),
                          .act_inact_ctrl       (act_inact_ctrl[7:0]),
                          .fifo_ctrl            (fifo_ctrl[3:0]),
                          .fifo_samples         (fifo_samples[7:0]),
                          .intmap1              (intmap1[7:0]),
                          .intmap2              (intmap2[7:0]),
                          .filter_ctrl          (filter_ctrl[7:0]),
                          .power_ctrl           (power_ctrl[7:0]),
                          .self_test            (self_test),
                          // Inputs
                          .clk_sys            (clk_sys),
                          .write                (write),
                          .address              (address[5:0]),
                          .data_write           (data_write[7:0]),
                          .xdata                (xdata[11:0]),
                          .ydata                (ydata[11:0]),
                          .zdata                (zdata[11:0]),
                          .temperature          (temperature[11:0]),
                          .status               (status[7:0]));
   // Data FIFO
   adxl362_fifo fifo(
                     // Outputs
                     .data_read         (data_fifo_read[15:0]),
                     .full              (full),
                     .empty             (empty),
                     // Inputs
                     .data_write        (fifo_write_data),
                     .clk               (clk_sys),
                     .rst               (rst),
                     .flush             (1'b0),
                     .read              (read_data_fifo),
                     .write             (fifo_write));
   // Accelerometer
   adxl362_accelerometer accelerometer (/*AUTOINST*/
                                        // Outputs
                                        .rising_clk_odr (rising_clk_odr),
                                        .fifo_write     (fifo_write),
                                        .fifo_write_data(fifo_write_data[15:0]),
                                        .xdata          (xdata[11:0]),
                                        .ydata          (ydata[11:0]),
                                        .zdata          (zdata[11:0]),
                                        .temperature    (temperature[11:0]),
                                        // Inputs
                                        .clk_sys      (clk_sys),
                                        .clk_odr        (clk_odr),
                                        .fifo_mode      (fifo_mode[1:0]),
                                        .fifo_temp      (fifo_temp));
endmodule