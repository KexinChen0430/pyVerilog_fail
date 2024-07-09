module udp_outbound_chain_rx_tb();
wire clk_100, clk_50;
sim_clk #(100) clk_100_inst(clk_100);
sim_clk #( 50) clk_50_inst (clk_50 );
reg [7:0] rxd;
reg rxdv;
reg rxlast;
wire [7:0] submsg_rxd;
wire submsg_rxdv;
wire submsg_rxlast;
udp_outbound_chain_rx dut(.*);
localparam PKT_LEN = 16;
reg [7:0] pkt [PKT_LEN-1:0];
integer i;
initial begin
  $dumpfile("udp_outbound_chain_rx.lxt");
  $dumpvars();
  pkt[0] = 8'h1; // protocol low
  pkt[1] = 8'h0; // protocol high
  pkt[2] = 8'h0; // hop count low
  pkt[3] = 8'h0; // hop count high
  pkt[4] = 8'h0; // submsg addr low
  pkt[5] = 8'h0; // submsg addr high
  pkt[6] = 8'h2; // submsg len low
  pkt[7] = 8'h0; // submsg len high
  pkt[8] = 8'h12; // payload byte 0
  pkt[9] = 8'h34; // payload byte 1
  pkt[10] = 8'h1; // submsg addr low
  pkt[11] = 8'h0; // submsg addr high
  pkt[12] = 8'h2; // submsg len low
  pkt[13] = 8'h0; // submsg len high
  pkt[14] = 8'h56; // payload byte 0
  pkt[15] = 8'h78; // payload byte 1
  rxd = 1'b0;
  rxdv = 8'h0;
  rxlast = 1'b0;
  #100;
  wait(~clk_50);
  wait(clk_50);
  rxdv <= 1'b1;
  for (i = 0; i < PKT_LEN; i = i + 1) begin
    rxd <= pkt[i];
    if (i == PKT_LEN - 1)
      rxlast = 1;
    wait(~clk_50);
    wait(clk_50);
  end
  rxdv = 1'b0;
  rxd = 8'h0;
  rxlast = 1'b0;
  #2000;
  $finish();
end
endmodule