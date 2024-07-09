module operation, if 0 - reset
                       trig,  // leading edge - sample time, trailing set rdy
                       ts,    // timestamop request
                       rdy,    // data ready
                       rd_stb, // data read strobe (increment address)
                       rdata); // data out (16 bits)
  input         sclk;   // system clock, negedge
  input         xclk;  // half frequency (80 MHz nominal)
  input         we;    // write enable for registers to log (@negedge sclk)
  input  [3:0]  wa;    // write address for register (4 bits, @negedge sclk)
  input  [15:0] di;    // 16-bit data in (32 multiplexed)
  input         en;    // enable
  input         trig;  // leading edge - sample time, trailing set rdy
  output        ts;    // timestamp request
  output        rdy;    // encoded nmea data ready
  input         rd_stb; // encoded nmea data read strobe (increment address)
  output [15:0] rdata;  // encoded data (16 bits)
  reg  [ 4:0]   raddr;
  reg           rdy=1'b0;
  reg           we_d;
  reg  [ 4:1]   waddr;
  reg  [ 2:0]   trig_d;
  reg  [ 7:0]   denoise_count;
  reg  [ 1:0]   trig_denoise;
  reg           ts;
  reg    [15:0] di_d;
  always @ (negedge sclk) begin
    di_d[15:0] <= di[15:0];
    waddr[4:1] <= wa[3:0];
    we_d <=we;
  end
  always @ (posedge xclk) begin
    if  (!en) trig_d[2:0] <= 3'h0;
    else      trig_d[2:0] <= {trig_d[1:0], trig};
    if      (!en)                      trig_denoise[0] <= 1'b0;
    else if (denoise_count[7:0]==8'h0) trig_denoise[0] <= trig_d[2];
    if (trig_d[2]==trig_denoise[0]) denoise_count[7:0] <= 8'hff;
    else                            denoise_count[7:0] <= denoise_count[7:0] - 1;
    trig_denoise[1] <= trig_denoise[0];
    ts <= !trig_denoise[1] && trig_denoise[0];
    if (!en || ts)   raddr[4:0] <= 5'h0;
    else if (rd_stb)    raddr[4:0] <= raddr[4:0] + 1;
    if  (ts || (rd_stb && (raddr[4:0]==5'h1b)) || !en) rdy <= 1'b0;
    else if (trig_denoise[1] && !trig_denoise[0])     rdy <= 1'b1;
  end
  myRAM_WxD_D #( .DATA_WIDTH(16),.DATA_DEPTH(5))
            i_odbuf (.D(di_d[15:0]),
                     .WE(we | we_d),
                     .clk(~sclk),
                     .AW({waddr[4:1],we_d}),
                     .AR(raddr[4:0]),
                     .QW(),
                     .QR(rdata[15:0]));
endmodule