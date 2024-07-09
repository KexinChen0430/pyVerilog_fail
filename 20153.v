module RAM16X8S (
  output [7:0] O,
  input A0, A1, A2, A3,
  input [7:0] D,
  (* clkbuf_sink *)
  (* invertible_pin = "IS_WCLK_INVERTED" *)
  input WCLK,
  input WE
);
  parameter [15:0] INIT_00 = 16'h0000;
  parameter [15:0] INIT_01 = 16'h0000;
  parameter [15:0] INIT_02 = 16'h0000;
  parameter [15:0] INIT_03 = 16'h0000;
  parameter [15:0] INIT_04 = 16'h0000;
  parameter [15:0] INIT_05 = 16'h0000;
  parameter [15:0] INIT_06 = 16'h0000;
  parameter [15:0] INIT_07 = 16'h0000;
  parameter [0:0] IS_WCLK_INVERTED = 1'b0;
  wire [3:0] a = {A3, A2, A1, A0};
  wire clk = WCLK ^ IS_WCLK_INVERTED;
  reg [15:0] mem0 = INIT_00;
  reg [15:0] mem1 = INIT_01;
  reg [15:0] mem2 = INIT_02;
  reg [15:0] mem3 = INIT_03;
  reg [15:0] mem4 = INIT_04;
  reg [15:0] mem5 = INIT_05;
  reg [15:0] mem6 = INIT_06;
  reg [15:0] mem7 = INIT_07;
  assign O[0] = mem0[a];
  assign O[1] = mem1[a];
  assign O[2] = mem2[a];
  assign O[3] = mem3[a];
  assign O[4] = mem4[a];
  assign O[5] = mem5[a];
  assign O[6] = mem6[a];
  assign O[7] = mem7[a];
  always @(posedge clk)
    if (WE) begin
      mem0[a] <= D[0];
      mem1[a] <= D[1];
      mem2[a] <= D[2];
      mem3[a] <= D[3];
      mem4[a] <= D[4];
      mem5[a] <= D[5];
      mem6[a] <= D[6];
      mem7[a] <= D[7];
    end
endmodule