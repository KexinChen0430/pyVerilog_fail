module roi(input wire clk,
        input wire [DIN_N-1:0] din, output wire [DOUT_N-1:0] dout);
    parameter DIN_N = `DIN_N;
    parameter DOUT_N = `DOUT_N;
    wire [DIN_N-1:0] din_lut;
    wire [DOUT_N-1:0] dout_lut;
    genvar i;
    generate
        //CLK
        (* KEEP, DONT_TOUCH *)
        reg clk_reg;
        always @(posedge clk) begin
            clk_reg <= clk_reg;
        end
        //DIN
        for (i = 0; i < DIN_N; i = i+1) begin:ins
            (* KEEP, DONT_TOUCH *)
            LUT6 #(
                .INIT(64'b01)
            ) lut (
                .I0(din[i]),
                .I1(1'b0),
                .I2(1'b0),
                .I3(1'b0),
                .I4(1'b0),
                .I5(1'b0),
                .O(din_lut[i]));
        end
        //DOUT
        for (i = 0; i < DOUT_N; i = i+1) begin:outs
            (* KEEP, DONT_TOUCH *)
            LUT6 #(
                .INIT(64'b01)
            ) lut (
                .I0(dout_lut[i]),
                .I1(1'b0),
                .I2(1'b0),
                .I3(1'b0),
                .I4(1'b0),
                .I5(1'b0),
                .O(dout[i]));
        end
    endgenerate
    demoscene demoscene(.clk(clk), .din(din_lut), .dout(dout_lut));
endmodule