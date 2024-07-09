module spi_master_tb();
wire c;
sim_clk #(100) clk_inst(c);
localparam W = 8;
reg [W-1:0] txd;
wire [W-1:0] rxd;
reg txdv;
wire rxdv;
wire done, busy;
wire sclk, mosi, miso, cs;
spi_master #(.SCLK_DIV(50), .W(8)) spi_master_inst
  (.c(c), .busy(busy), .done(done),
   .txd(txd), .txdv(txdv),
   .rxd(rxd), .rxdv(rxdv),
   .sclk(sclk), .mosi(mosi), .miso(miso), .cs(cs));
wire [W-1:0] slave_rxd;
wire slave_rxdv, slave_rxe;
spi_slave_rx spi_slave_rx_inst
(.clk(c),
 .rxd(slave_rxd), .rxdv(slave_rxdv), .rxe(slave_rxe),
 .cs(cs), .mosi(mosi), .miso(miso), .sclk(sclk));
initial begin
  $dumpfile("spi_master_test.lxt");
  $dumpvars();
  txd = 8'ha5;
  txdv = 0;
  #100
  @(posedge c);
  #1 txdv = 1;
  @(posedge c);
  #1 txd = 8'h7;
  @(posedge c);
  #1 txd = 8'h51;
  @(posedge c);
  #1 txdv = 0;
  #10000
  @(posedge c);
  #1 txdv = 1;
  @(posedge c);
  #1 txdv = 0;
  #20000
  $finish;
end
endmodule