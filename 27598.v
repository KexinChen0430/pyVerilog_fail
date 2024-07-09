module bsg_fpu_sticky
  #(parameter `BSG_INV_PARAM(width_p))
  (
    input [width_p-1:0] i // input
    , input [`BSG_WIDTH(width_p)-1:0] shamt_i // shift amount
    , output logic sticky_o
  );
  logic [width_p-1:0] scan_out;
  bsg_scan #(
    .width_p(width_p)
    ,.or_p(1)
    ,.lo_to_hi_p(1)
  ) scan0 (
    .i(i)
    ,.o(scan_out)
  );
  // answer
  logic [width_p:0] answer;
  assign answer = {scan_out, 1'b0};
  // final output
  assign sticky_o = shamt_i > width_p
    ? answer[width_p]
    : answer[shamt_i];
endmodule