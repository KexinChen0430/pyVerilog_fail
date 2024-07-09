module sirv_gnrl_ltch # (
  parameter DW = 32
) (
  //input               test_mode,
  input               lden,
  input      [DW-1:0] dnxt,
  output     [DW-1:0] qout
);
reg [DW-1:0] qout_r;
always @ *
begin : LTCH_PROC
  if (lden == 1'b1)
    qout_r <= dnxt;
end
//assign qout = test_mode ? dnxt : qout_r;
assign qout = qout_r;
`ifndef FPGA_SOURCE//{
`ifndef DISABLE_SV_ASSERTION//{
//synopsys translate_off
always_comb
begin
  CHECK_THE_X_VALUE:
    assert (lden !== 1'bx)
    else $fatal ("\n Error: Oops, detected a X value!!! This should never happen. \n");
end
//synopsys translate_on
`endif//}
`endif//}
endmodule