module dmac_reset_manager_tb;
  parameter VCD_FILE = {`__FILE__,"cd"};
  `define TIMEOUT 1000000
  `include "tb_base.v"
  reg clk_a = 1'b0;
  reg clk_b = 1'b0;
  reg clk_c = 1'b0;
  reg [5:0] resetn_shift = 'h0;
  reg [10:0] counter = 'h00;
  reg ctrl_enable = 1'b0;
  reg ctrl_pause = 1'b0;
  always #10 clk_a <= ~clk_a;
  always #3 clk_b <= ~clk_b;
  always #7 clk_c <= ~clk_c;
  always @(posedge clk_a) begin
    counter <= counter + 1'b1;
    if (counter == 'h60 || counter == 'h150 || counter == 'h185) begin
      ctrl_enable <= 1'b1;
    end else if (counter == 'h100 || counter == 'h110 || counter == 'h180) begin
      ctrl_enable <= 1'b0;
    end
    if (counter == 'h160) begin
      ctrl_pause = 1'b1;
    end else if (counter == 'h190) begin
      ctrl_pause = 1'b0;
    end
  end
  reg [15:0] req_enabled_shift;
  wire req_enable;
  wire req_enabled = req_enabled_shift[15];
  reg [15:0] dest_enabled_shift;
  wire dest_enable;
  wire dest_enabled = dest_enabled_shift[15];
  reg [15:0] src_enabled_shift;
  wire src_enable;
  wire src_enabled = src_enabled_shift[15];
  always @(posedge clk_a) begin
    req_enabled_shift <= {req_enabled_shift[14:0],req_enable};
  end
  always @(posedge clk_b) begin
    dest_enabled_shift <= {dest_enabled_shift[14:0],dest_enable};
  end
  always @(posedge clk_c) begin
    src_enabled_shift <= {src_enabled_shift[14:0],src_enable};
  end
  axi_dmac_reset_manager i_reset_manager (
    .clk(clk_a),
    .resetn(resetn),
    .ctrl_pause(ctrl_pause),
    .ctrl_enable(ctrl_enable),
    .req_enable(req_enable),
    .req_enabled(req_enabled),
    .dest_clk(clk_b),
    .dest_ext_resetn(1'b0),
    .dest_enable(dest_enable),
    .dest_enabled(dest_enabled),
    .src_clk(clk_c),
    .src_ext_resetn(1'b0),
    .src_enable(src_enable),
    .src_enabled(src_enabled)
  );
endmodule