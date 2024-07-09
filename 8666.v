module gtx_8x10enc(
    input   wire    rst,
    input   wire    clk,
    input   wire    [1:0]   inisk,
    input   wire    [15:0]  indata,
    output  wire    [19:0]  outdata
);
// addresses to reference an encoding table
wire    [8:0] addr0;
wire    [8:0] addr1;
assign  addr0 = {inisk[0], indata[7:0]};
assign  addr1 = {inisk[1], indata[15:8]};
// possible encoded data - both disparities, for both bytes
// due to registered memory output, this values will be valid after 2 clock cycles
// table[i] [9:0] in case of current disparity +, [19:10] in case of -
wire    [31:0]  table0_out;
wire    [31:0]  table1_out;
reg     [19:0]  table0_r;
reg     [19:0]  table1_r;
wire    [19:0]  table0;
wire    [19:0]  table1;
assign  table0 = table0_out[19:0];
assign  table1 = table1_out[19:0];
always @ (posedge clk)
begin
    table0_r <= table0;
    table1_r <= table1;
end
// encoded bytes
wire    [9:0]   enc0;
wire    [9:0]   enc1;
//reg     [9:0]   enc0_r;
//reg     [9:0]   enc1_r;
// running displarity, 0 = -, 1 = +
reg     disparity;
// running disparity after encoding 1st byte
wire    disparity_interm;
// invert disparity after a byte
// if current encoded word containg an equal amount of 1s and 0s (i.e. 5 x '1'), disp shall stay the same
// if amounts are unequal, there are either 4 or 6 '1's. in either case disp shall be inverted
wire    inv_disp0;
wire    inv_disp1;
assign  inv_disp0 = ~^enc0;
assign  inv_disp1 = ~^enc1;
assign  disparity_interm = inv_disp0 ? ~disparity : disparity;
always @ (posedge clk)
    disparity <= rst ? 1'b0 : inv_disp1 ^ inv_disp0 ? ~disparity : disparity;
// select encoded bytes depending on a previous disparity
assign  enc0 = {10{~disparity}} & table0_r[19:10] | {10{disparity}} & table0_r[9:0];
assign  enc1 = {10{~disparity_interm}} & table1_r[19:10] | {10{disparity_interm}} & table1_r[9:0];
// latch output data
reg [19:0]  outdata_l;
assign  outdata = outdata_l;
always @ (posedge clk)
    outdata_l <= {enc1, enc0};
ramt_var_w_var_r #(
    .REGISTERS_A    (1),
    .REGISTERS_B    (1),
    .LOG2WIDTH_A    (5),
    .LOG2WIDTH_B    (5)
`include "gtx_8x10enc_init.v"
)
encoding_table(
    .clk_a       (clk),
    .addr_a      ({1'b0, addr0}),
    .en_a        (1'b1),
    .regen_a     (1'b1),
    .we_a        (1'b0),
    .data_out_a  (table0_out),
    .data_in_a   (32'h0),
    .clk_b       (clk),
    .addr_b      ({1'b0, addr1}),
    .en_b        (1'b1),
    .regen_b     (1'b1),
    .we_b        (1'b0),
    .data_out_b  (table1_out),
    .data_in_b   (32'h0)
);
`ifdef CHECKERS_ENABLED
reg [8:0] addr0_r;
reg [8:0] addr1_r;
reg [8:0] addr0_rr;
reg [8:0] addr1_rr;
always @ (posedge clk)
begin
    addr0_r     <= addr0;
    addr1_r     <= addr1;
    addr0_rr    <= addr0_r;
    addr1_rr    <= addr1_r;
end
always @ (posedge clk)
    if (~rst)
    if (|table0 | |table1) begin
        // all good
    end
    else begin
        // got xxxx or 0000, both cases tell us addresses were bad
        $display("Error in %m: bad incoming data: 1) K = %h, Data = %h 2) K = %h, Data = %h", addr0_rr[8], addr0_rr[7:0], addr1_rr[8], addr1_rr[7:0]);
        repeat (10) @(posedge clk);
        $finish;
    end
`endif // CHECKERS_ENABLED
endmodule