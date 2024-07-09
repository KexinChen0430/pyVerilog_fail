module.
Depending on the status of the 8th switch (SW[8]), it will display the
exposure value (if SW[8] = 1) or the frame rate (if SW[8] = 0).
For getting the frame rate, a 1 second temporizer is created, and the
number of frames between pulses is displayed. Moreover, a seconds pulse
is wired to the first led of the board (LEDR[0])
*/
SEG7_LUT_8 u5(
  .oSEG0        (HEX0),
  .oSEG1        (HEX1),
  .oSEG2        (HEX2),
  .oSEG3        (HEX3),
  .oSEG4        (HEX4),
  .oSEG5        (HEX5),
  .oSEG6        (),
  .oSEG7        (),
  .iDIG         (display)
  );
  wire  [31:0] display;
  reg   [31:0] count;
  reg   [31:0] rate;
  reg   [31:0] _Frame_Cont;
  reg          seconds_pulse;
  reg          pulse;
  assign LEDR[0] = pulse;
  assign display = (SW[8]) ? {16'h0, in_exposure} : rate;
  // Calculate the frame rate.
  // Seconds counter. The output will be 1 during one pulse after 1 second.
  always @(posedge CLOCK_50) begin
    if (count < 50000000) begin
      count = count + 1;
      // seconds_pulse = 0;
    end
    else begin
      count = 0;
      // seconds_pulse = 1;
      pulse = ~pulse;
      rate = Frame_Cont - _Frame_Cont;
      _Frame_Cont = Frame_Cont;
    end
  end
// Component for writing configuration to the camera peripheral.
camera_config #(
  .CLK_FREQ(25000000),  // 25 MHz
  .I2C_FREQ(20000)      // 20 kHz
  ) camera_conf(
  // Host Side
  .clock(ccd_pixel_clk),
  .reset_n(hps2fpga_reset_n & video_stream_reset_n),
  // Configuration registers
  .exposure(in_exposure),
  .start_row(in_start_row),
  .start_column(in_start_column),
  .row_size(in_row_size),
  .column_size(in_column_size),
  .row_mode(in_row_mode),
  .column_mode(in_column_mode),
  // Ready signal
  .out_ready(ready),
  // I2C Side
  .I2C_SCLK(GPIO_1[24]),
  .I2C_SDAT(GPIO_1[23])
  );
  // Camera config (I2C)
  wire          ready;
  wire  [15:0]  in_exposure;
  wire  [15:0]  start_row;
  wire  [15:0]  start_column;
  wire  [15:0]  in_row_size;
  wire  [15:0]  in_column_size;
  wire  [15:0]  in_row_mode;
  wire  [15:0]  in_column_mode;
  // assign in_exposure = 16'h07C0;
  // assign start_row = 16'h0000;
  // assign start_column = 16'h0000;
  // assign in_row_size = 16'h077F;
  // assign in_column_size = 16'h09FF;
  // assign in_row_mode = 16'h0011;
  // assign in_column_mode = 16'h0011;
// Reset logic
assign video_stream_reset_n = (camera_soft_reset_n & KEY[0]);
endmodule