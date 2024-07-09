module spi_slave_rxq_tb();
wire c;
sim_clk #(100) clk_inst(c);
localparam W = 8;
reg [W-1:0] master_txd;
wire [W-1:0] master_rxd;
reg master_txdv;
wire master_rxdv;
wire master_done, master_busy;
wire sclk, mosi, miso, cs;
spi_master #(.SCLK_DIV(50), .W(8)) spi_master_inst
  (.c(c), .busy(master_busy), .done(master_done),
   .txd(master_txd), .txdv(master_txdv),
   .rxd(master_rxd), .rxdv(master_rxdv),
   .sclk(sclk), .mosi(mosi), .miso(miso), .cs(cs));
wire [7:0] qrxd;
wire qrxdv, qrxe;
spi_slave_rxq dut
(.c(c), .cs(cs), .sclk(sclk), .mosi(mosi),
 .rxd(qrxd), .rxdv(qrxdv), .rxe(qrxe));
initial begin
  $dumpfile("spi_slave_rxq.lxt");
  $dumpvars();
  master_txd = 8'ha5;
  master_txdv = 0;
  #100
  @(posedge c);
  #1 master_txdv = 1;
  @(posedge c);
  #1 master_txd = 8'h7;
  @(posedge c);
  #1 master_txd = 8'h51;
  @(posedge c);
  #1 master_txdv = 0;
  #40000
  @(posedge c);
  #1 master_txdv = 1;
  @(posedge c);
  #1 master_txdv = 0;
  #40000
  $finish;
end
endmodule