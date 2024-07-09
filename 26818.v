module tb();
reg [10:0] data_in;
reg crc_en;
wire [4:0] crc_out;
reg rst;
wire clk;
sim_clk #(125) clk_125_r(.clk(clk));
usb_crc5 dut(.*);
wire [4:0] to_wire = ~crc_out; //{ crc_out[0], crc_out[1], crc_out[2], crc_out[3], crc_out[4] };
initial begin
  $dumpfile("crc5.lxt");
  $dumpvars();
  rst <= 1'b0;
  crc_en <= 1'b0;
  wait(clk);
  wait(~clk);
  rst <= 1'b1;
  wait(clk);
  wait(~clk);
  rst <= 1'b0;
  wait(clk);
  wait(~clk);
  data_in <= 11'b10000000000;
  crc_en <= 1'b1;
  wait(clk);
  wait(~clk);
  rst <= 1'b1;
  crc_en <= 1'b0;
  wait(clk);
  wait(~clk);
  rst <= 1'b0;
  crc_en <= 1'b1;
  data_in <= 11'b01000000000;
  #1000;
  $finish();
end
endmodule