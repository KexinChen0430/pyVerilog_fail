module will perform one shift per input data bit.
STYLE
Specify implementation style.  Can be "AUTO", "LOOP", or "REDUCTION".  When "AUTO"
is selected, implemenation will be "LOOP" or "REDUCTION" based on synthesis translate
directives.  "REDUCTION" and "LOOP" are functionally identical, however they simulate
and synthesize differently.  "REDUCTION" is implemented with a loop over a Verilog
reduction operator.  "LOOP" is implemented as a doubly-nested loop with no reduction
operator.  "REDUCTION" is very fast for simulation in iverilog and synthesizes well in
Quartus but synthesizes poorly in ISE, likely due to large inferred XOR gates causing
problems with the optimizer.  "LOOP" synthesizes will in both ISE and Quartus.  "AUTO"
will default to "REDUCTION" when simulating and "LOOP" for synthesizers that obey
synthesis translate directives.
Settings for common LFSR/CRC implementations:
Name        Configuration           Length  Polynomial      Initial value   Notes
CRC32       Galois, bit-reverse     32      32'h04c11db7    32'hffffffff    Ethernet FCS; invert final output
PRBS6       Fibonacci               6       6'h21           any
PRBS7       Fibonacci               7       7'h41           any
PRBS9       Fibonacci               9       9'h021          any             ITU V.52
PRBS10      Fibonacci               10      10'h081         any             ITU
PRBS11      Fibonacci               11      11'h201         any             ITU O.152
PRBS15      Fibonacci, inverted     15      15'h4001        any             ITU O.152
PRBS17      Fibonacci               17      17'h04001       any
PRBS20      Fibonacci               20      20'h00009       any             ITU V.57
PRBS23      Fibonacci, inverted     23      23'h040001      any             ITU O.151
PRBS29      Fibonacci, inverted     29      29'h08000001    any
PRBS31      Fibonacci, inverted     31      31'h10000001    any
64b66b      Fibonacci, bit-reverse  58      58'h8000000001  any             10G Ethernet
128b130b    Galois, bit-reverse     23      23'h210125      any             PCIe gen 3
*/
reg [LFSR_WIDTH-1:0] state_reg = LFSR_INIT;
reg [DATA_WIDTH-1:0] output_reg = 0;
wire [DATA_WIDTH-1:0] lfsr_data;
wire [LFSR_WIDTH-1:0] lfsr_state;
assign data_out = output_reg;
lfsr #(
    .LFSR_WIDTH(LFSR_WIDTH),
    .LFSR_POLY(LFSR_POLY),
    .LFSR_CONFIG(LFSR_CONFIG),
    .LFSR_FEED_FORWARD(0),
    .REVERSE(REVERSE),
    .DATA_WIDTH(DATA_WIDTH),
    .STYLE(STYLE)
)
lfsr_inst (
    .data_in(data_in),
    .state_in(state_reg),
    .data_out(lfsr_data),
    .state_out(lfsr_state)
);
always @(posedge clk) begin
    if (rst) begin
        state_reg <= LFSR_INIT;
        output_reg <= 0;
    end else begin
        if (data_in_valid) begin
            state_reg <= lfsr_state;
            output_reg <= lfsr_data;
        end
    end
end
endmodule