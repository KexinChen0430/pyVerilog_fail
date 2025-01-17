module pulse_sim;
  wire sys_clk;
  sim_clk sysClk(sys_clk);
  reg rstn;
  wire p[8:0];
  initial rstn = 0;
  initial #2 rstn = 1;
  initial #65 rstn = 0;
  pulse #(.dly(8), .len(0))      pulseI0(.rstn(rstn), .clk(sys_clk), .pulse(p[0]));
  pulse #(.dly(8), .len(1))      pulseI1(.rstn(rstn), .clk(sys_clk), .pulse(p[1]));
  pulse #(.dly(8), .len(1024))   pulseI2(.rstn(rstn), .clk(sys_clk), .pulse(p[2]));
  pulse #(.dly(0), .len(1))      pulseI3(.rstn(rstn), .clk(sys_clk), .pulse(p[3]));
  pulse #(.dly(1), .len(0))      pulseI4(.rstn(rstn), .clk(sys_clk), .pulse(p[4]));
  pulse #(.dly(0), .len(0))      pulseI5(.rstn(rstn), .clk(sys_clk), .pulse(p[5]));
  wire slow_clk;
  sim_clk #(.T(8)) slowClk(slow_clk);
  wire fast_clk;
  assign fast_clk = sys_clk;
  wire pi[1:0];
  reg po[1:0];
  always @(posedge fast_clk, negedge rstn) begin
    if (~rstn)
      po[0] <= 1'b0;
    else
      po[0] <= 1'b1;
  end
  always @(posedge slow_clk, negedge rstn) begin
    if (~rstn)
      po[1] <= 1'b0;
    else
      po[1] <= 1'b1;
  end
  pulse_interclk pinterI0(.rstn(rstn), .iclk(fast_clk), .oclk(slow_clk), .ipulse(po[0]), .opulse(pi[0]));
  pulse_interclk pinterI1(.rstn(rstn), .iclk(slow_clk), .oclk(fast_clk), .ipulse(po[1]), .opulse(pi[1]));
  wire op;
  reg op_flag;
  always @(posedge fast_clk, negedge rstn) begin
    if (~rstn)
      op_flag <= 1'b0;
    else if (~op_flag)
      op_flag <= 1'b1;
    else if (op)
      op_flag <= 1'b0;
  end
  pulse_interclk pinterI2(.rstn(op_flag), .iclk(fast_clk), .oclk(fast_clk), .ipulse(1), .opulse(op));
  initial begin
    $dumpfile(`VCD_PATH);
    $dumpvars();
    // $monitor("T=%t, clk=%d p[0]=%d p[1]=%d p[2]=%d p[3]=%d",
    //          $time, sys_clk,
    //          p[0],
    //          p[1],
    //          p[2],
    //          p[3])
    #70 $finish;
  end
endmodule