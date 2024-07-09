module top_wrapper;
  reg clk = 0;
  reg rx = 1;
  wire clear_to_send;
  wire tx;
  integer i;
  localparam ClocksPerBaud = 8;
  localparam TicksPerClock = 2;
  top #(
    .ClocksPerBaud      (ClocksPerBaud)
  ) t(
    .clk                (clk),
    .rx_in              (rx),
    .tx_out             (tx),
    .clear_to_send_out_n(clear_to_send)
  );
  initial begin
    clk = 0;
    #1;
    forever #1 clk = !clk;
  end
  initial begin
    //$dumpfile("/tmp/ident_8b_main_wrapper.vcd");
    //$dumpvars(0, clk, rx, tx, t.state, t.state_next, t.rx.state,
    //  t.rx.sample_count, t.rx.samples, t.rx.rx_countdown, t.rx_byte_done);
    #8;
    rx = 0;
    #(ClocksPerBaud*TicksPerClock);
    for (i = 0; i < 8; i = i + 1) begin
      rx = ((i % 2) == 0);
      #(ClocksPerBaud*TicksPerClock);
    end
    rx = 1;
    #1024 $finish;
  end
endmodule