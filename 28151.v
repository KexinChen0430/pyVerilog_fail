module gtx_10x8dec(
    input   wire    rst,
    input   wire    clk,
    input   wire    [19:0]  indata,
    output  wire    [15:0]  outdata,
    output  wire    [1:0]   outisk,
    output  wire    [1:0]   notintable,
    output  wire    [1:0]   disperror
/* uncomment if necessary
    input   wire    [0:0]   inaux,
    output  wire    [0:0]   outaux, */
);
/*
uncomment if necessary
// bypass auxilary informational signals
reg [0:0] aux_r;
reg [0:0] aux_rr;
always @ (posedge clk)
begin
    aux_r   <= inaux;
    aux_rr  <= aux_r;
end
assign  outaux = aux_rr;
*/
// split incoming data in 2 bytes
wire    [9:0]   addr0;
wire    [9:0]   addr1;
assign  addr0 = indata[9:0];
assign  addr1 = indata[19:10];
// get decoded values after 2 clock cycles, all '1's = cannot be decoded
wire    [15:0]  table0_out;
wire    [15:0]  table1_out;
wire    [10:0]   table0;
wire    [10:0]   table1;
assign  table0 = table0_out[10:0];
assign  table1 = table1_out[10:0];
assign  outdata = {table1[7:0], table0[7:0]};
assign  outisk  = {table1[8], table0[8]};
assign  notintable = {&table1, &table0};
// disparity control
// last clock disparity
reg     disparity;
// disparity after 1st byte
wire    disparity_interm;
// delayed ones
reg     disp0_r;
reg     disp0_rr;
reg     disp1_r;
reg     disp1_rr;
always @ (posedge clk)
begin
    disp0_r     <= disparity;
    disp0_rr    <= disp0_r;
    disp1_r     <= disparity_interm;
    disp1_rr    <= disp1_r;
end
// overall expected disparity when the table values would apper - disp0_r.
// disp1_rr shows expected after 0st byte would be considered
reg     correct_table_disp;
wire    expected_disparity;
wire    expected_disparity_interm;
assign  expected_disparity = disp0_rr ^ correct_table_disp;
assign  expected_disparity_interm = disp1_rr ^ correct_table_disp;
// invert disparity after a byte
// if current encoded word containg an equal amount of 1s and 0s (i.e. 5 x '1'), disp shall stay the same
// if amounts are unequal, there are either 4 or 6 '1's. in either case disp shall be inverted
wire    inv_disp0;
wire    inv_disp1;
assign  inv_disp0 = ~^(indata[9:0]);
assign  inv_disp1 = ~^(indata[19:10]);
assign  disparity_interm = inv_disp0 ? ~disparity : disparity;
always @ (posedge clk)
    disparity <= rst ? 1'b0 : inv_disp1 ^ inv_disp0 ? ~disparity : disparity;
// to correct disparity if once an error occured
always @ (posedge clk)
    correct_table_disp   <= rst ? 1'b0 : disperror[1] ? ~correct_table_disp : correct_table_disp;
// calculate disparity on table values
wire    table_pos_disp0;
wire    table_neg_disp0;
wire    table_pos_disp1;
wire    table_neg_disp1;
// table_pos_disp - for current 10-bit word disparity can be positive
// _neg_ - can be negative
// neg & pos - can be either of them
assign  table_pos_disp0 = table0[10];
assign  table_neg_disp0 = table0[9];
assign  table_pos_disp1 = table1[10];
assign  table_neg_disp1 = table1[9];
assign  disperror = ~{table_pos_disp0 & expected_disparity | table_neg_disp0 & ~expected_disparity, table_pos_disp1 & expected_disparity_interm | table_neg_disp1 & ~expected_disparity_interm};
// TODO change mem to 18 instead of 36, so the highest address bit could be dropped
ramt_var_w_var_r #(
    .REGISTERS_A    (1),
    .REGISTERS_B    (1),
    .LOG2WIDTH_A    (4),
    .LOG2WIDTH_B    (4)
`include "gtx_10x8dec_init.v"
)
decoding_table(
    .clk_a       (clk),
    .addr_a      ({1'b0, addr0}),
    .en_a        (1'b1),
    .regen_a     (1'b1),
    .we_a        (1'b0),
    .data_out_a  (table0_out),
    .data_in_a   (16'h0),
    .clk_b       (clk),
    .addr_b      ({1'b0, addr1}),
    .en_b        (1'b1),
    .regen_b     (1'b1),
    .we_b        (1'b0),
    .data_out_b  (table1_out),
    .data_in_b   (16'h0)
);
endmodule