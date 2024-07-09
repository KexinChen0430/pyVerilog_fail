module scff_1 (D, DI, clk, preset, reset, Q); // QL_FF
    parameter  [0:0] MODE = 1; // The default
    input      [0:0] D;
    input      [0:0] DI;
    input      [0:0] clk;
    input      [0:0] preset;
    input      [0:0] reset;
    output reg [0:0] Q;
    initial Q <= 1'b0;
    // Clock inverter
    wire ck = (MODE == 1'b1) ? clk : !clk;
    // FLip-flop behavioral model
    always @(posedge ck or negedge reset or negedge preset) begin
        if      (!reset)  Q <= 1'b0;
        else if (!preset) Q <= 1'b1;
        else              Q <= D;
    end
    // Timing paths. The values are dummy and are intended to be replaced by
    // ones from a SDF file during simulation.
    specify
      (posedge clk => (Q +: D)) = 0;
      $setuphold(posedge clk, D, 0, 0);
      $recrem(posedge reset, posedge clk, 0, 0);
      $recrem(posedge preset, posedge clk, 0, 0);
    endspecify
endmodule