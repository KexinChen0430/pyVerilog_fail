module will perform one shift per input
data bit, so if the input data bus is not required tie data_in to zero and set DATA_WIDTH
to the required number of shifts per clock cycle.
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
CRC16-IBM   Galois, bit-reverse     16      16'h8005        16'hffff
CRC16-CCITT Galois                  16      16'h1021        16'h1d0f
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
reg [LFSR_WIDTH-1:0] lfsr_mask_state[LFSR_WIDTH-1:0];
reg [DATA_WIDTH-1:0] lfsr_mask_data[LFSR_WIDTH-1:0];
reg [LFSR_WIDTH-1:0] output_mask_state[DATA_WIDTH-1:0];
reg [DATA_WIDTH-1:0] output_mask_data[DATA_WIDTH-1:0];
reg [LFSR_WIDTH-1:0] state_val = 0;
reg [DATA_WIDTH-1:0] data_val = 0;
integer i, j, k;
initial begin
    // init bit masks
    for (i = 0; i < LFSR_WIDTH; i = i + 1) begin
        lfsr_mask_state[i] = {LFSR_WIDTH{1'b0}};
        lfsr_mask_state[i][i] = 1'b1;
        lfsr_mask_data[i] = {DATA_WIDTH{1'b0}};
    end
    for (i = 0; i < DATA_WIDTH; i = i + 1) begin
        output_mask_state[i] = {LFSR_WIDTH{1'b0}};
        if (i < LFSR_WIDTH) begin
            output_mask_state[i][i] = 1'b1;
        end
        output_mask_data[i] = {DATA_WIDTH{1'b0}};
    end
    // simulate shift register
    if (LFSR_CONFIG == "FIBONACCI") begin
        // Fibonacci configuration
        for (i = DATA_WIDTH-1; i >= 0; i = i - 1) begin
            // determine shift in value
            // current value in last FF, XOR with input data bit (MSB first)
            state_val = lfsr_mask_state[LFSR_WIDTH-1];
            data_val = lfsr_mask_data[LFSR_WIDTH-1];
            data_val = data_val ^ (1 << i);
            // add XOR inputs from correct indicies
            for (j = 1; j < LFSR_WIDTH; j = j + 1) begin
                if (LFSR_POLY & (1 << j)) begin
                    state_val = lfsr_mask_state[j-1] ^ state_val;
                    data_val = lfsr_mask_data[j-1] ^ data_val;
                end
            end
            // shift
            for (j = LFSR_WIDTH-1; j > 0; j = j - 1) begin
                lfsr_mask_state[j] = lfsr_mask_state[j-1];
                lfsr_mask_data[j] = lfsr_mask_data[j-1];
            end
            for (j = DATA_WIDTH-1; j > 0; j = j - 1) begin
                output_mask_state[j] = output_mask_state[j-1];
                output_mask_data[j] = output_mask_data[j-1];
            end
            output_mask_state[0] = state_val;
            output_mask_data[0] = data_val;
            if (LFSR_FEED_FORWARD) begin
                // only shift in new input data
                state_val = {LFSR_WIDTH{1'b0}};
                data_val = 1 << i;
            end
            lfsr_mask_state[0] = state_val;
            lfsr_mask_data[0] = data_val;
        end
    end else if (LFSR_CONFIG == "GALOIS") begin
        // Galois configuration
        for (i = DATA_WIDTH-1; i >= 0; i = i - 1) begin
            // determine shift in value
            // current value in last FF, XOR with input data bit (MSB first)
            state_val = lfsr_mask_state[LFSR_WIDTH-1];
            data_val = lfsr_mask_data[LFSR_WIDTH-1];
            data_val = data_val ^ (1 << i);
            // shift
            for (j = LFSR_WIDTH-1; j > 0; j = j - 1) begin
                lfsr_mask_state[j] = lfsr_mask_state[j-1];
                lfsr_mask_data[j] = lfsr_mask_data[j-1];
            end
            for (j = DATA_WIDTH-1; j > 0; j = j - 1) begin
                output_mask_state[j] = output_mask_state[j-1];
                output_mask_data[j] = output_mask_data[j-1];
            end
            output_mask_state[0] = state_val;
            output_mask_data[0] = data_val;
            if (LFSR_FEED_FORWARD) begin
                // only shift in new input data
                state_val = {LFSR_WIDTH{1'b0}};
                data_val = 1 << i;
            end
            lfsr_mask_state[0] = state_val;
            lfsr_mask_data[0] = data_val;
            // add XOR inputs at correct indicies
            for (j = 1; j < LFSR_WIDTH; j = j + 1) begin
                if (LFSR_POLY & (1 << j)) begin
                    lfsr_mask_state[j] = lfsr_mask_state[j] ^ state_val;
                    lfsr_mask_data[j] = lfsr_mask_data[j] ^ data_val;
                end
            end
        end
    end else begin
        $error("Error: unknown configuration setting!");
        $finish;
    end
    // reverse bits if selected
    if (REVERSE) begin
        // reverse order
        for (i = 0; i < LFSR_WIDTH/2; i = i + 1) begin
            state_val = lfsr_mask_state[i];
            data_val = lfsr_mask_data[i];
            lfsr_mask_state[i] = lfsr_mask_state[LFSR_WIDTH-i-1];
            lfsr_mask_data[i] = lfsr_mask_data[LFSR_WIDTH-i-1];
            lfsr_mask_state[LFSR_WIDTH-i-1] = state_val;
            lfsr_mask_data[LFSR_WIDTH-i-1] = data_val;
        end
        for (i = 0; i < DATA_WIDTH/2; i = i + 1) begin
            state_val = output_mask_state[i];
            data_val = output_mask_data[i];
            output_mask_state[i] = output_mask_state[DATA_WIDTH-i-1];
            output_mask_data[i] = output_mask_data[DATA_WIDTH-i-1];
            output_mask_state[DATA_WIDTH-i-1] = state_val;
            output_mask_data[DATA_WIDTH-i-1] = data_val;
        end
        // reverse bits
        for (i = 0; i < LFSR_WIDTH; i = i + 1) begin
            state_val = 0;
            for (j = 0; j < LFSR_WIDTH; j = j + 1) begin
                state_val[j] = lfsr_mask_state[i][LFSR_WIDTH-j-1];
            end
            lfsr_mask_state[i] = state_val;
            data_val = 0;
            for (j = 0; j < DATA_WIDTH; j = j + 1) begin
                data_val[j] = lfsr_mask_data[i][DATA_WIDTH-j-1];
            end
            lfsr_mask_data[i] = data_val;
        end
        for (i = 0; i < DATA_WIDTH; i = i + 1) begin
            state_val = 0;
            for (j = 0; j < LFSR_WIDTH; j = j + 1) begin
                state_val[j] = output_mask_state[i][LFSR_WIDTH-j-1];
            end
            output_mask_state[i] = state_val;
            data_val = 0;
            for (j = 0; j < DATA_WIDTH; j = j + 1) begin
                data_val[j] = output_mask_data[i][DATA_WIDTH-j-1];
            end
            output_mask_data[i] = data_val;
        end
    end
    // for (i = 0; i < LFSR_WIDTH; i = i + 1) begin
    //     $display("%b %b", lfsr_mask_state[i], lfsr_mask_data[i]);
    // end
end
// synthesis translate_off
`define SIMULATION
// synthesis translate_on
`ifdef SIMULATION
// "AUTO" style is "REDUCTION" for faster simulation
parameter STYLE_INT = (STYLE == "AUTO") ? "REDUCTION" : STYLE;
`else
// "AUTO" style is "LOOP" for better synthesis result
parameter STYLE_INT = (STYLE == "AUTO") ? "LOOP" : STYLE;
`endif
genvar n;
generate
if (STYLE_INT == "REDUCTION") begin
    // use Verilog reduction operator
    // fast in iverilog
    // significantly larger than generated code with ISE (inferred wide XORs may be tripping up optimizer)
    // slightly smaller than generated code with Quartus
    for (n = 0; n < LFSR_WIDTH; n = n + 1) begin : loop1
        assign state_out[n] = ^{(state_in & lfsr_mask_state[n]), (data_in & lfsr_mask_data[n])};
    end
    for (n = 0; n < DATA_WIDTH; n = n + 1) begin : loop2
        assign data_out[n] = ^{(state_in & output_mask_state[n]), (data_in & output_mask_data[n])};
    end
end else if (STYLE_INT == "LOOP") begin
    // use nested loops
    // very slow in iverilog
    // slightly smaller than generated code with ISE
    // same size as generated code with Quartus
    reg [LFSR_WIDTH-1:0] state_out_reg = 0;
    reg [DATA_WIDTH-1:0] data_out_reg = 0;
    assign state_out = state_out_reg;
    assign data_out = data_out_reg;
    always @* begin
        for (i = 0; i < LFSR_WIDTH; i = i + 1) begin
            state_out_reg[i] = 0;
            for (j = 0; j < LFSR_WIDTH; j = j + 1) begin
                if (lfsr_mask_state[i][j]) begin
                    state_out_reg[i] = state_out_reg[i] ^ state_in[j];
                end
            end
            for (j = 0; j < DATA_WIDTH; j = j + 1) begin
                if (lfsr_mask_data[i][j]) begin
                    state_out_reg[i] = state_out_reg[i] ^ data_in[j];
                end
            end
        end
        for (i = 0; i < DATA_WIDTH; i = i + 1) begin
            data_out_reg[i] = 0;
            for (j = 0; j < LFSR_WIDTH; j = j + 1) begin
                if (output_mask_state[i][j]) begin
                    data_out_reg[i] = data_out_reg[i] ^ state_in[j];
                end
            end
            for (j = 0; j < DATA_WIDTH; j = j + 1) begin
                if (output_mask_data[i][j]) begin
                    data_out_reg[i] = data_out_reg[i] ^ data_in[j];
                end
            end
        end
    end
end else begin
    initial begin
        $error("Error: unknown style setting!");
        $finish;
    end
end
endgenerate
endmodule