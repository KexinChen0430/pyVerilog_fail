module bsg_barrier
  #(`BSG_INV_PARAM(dirs_p),lg_dirs_lp=`BSG_SAFE_CLOG2(dirs_p+1))
  (
    input clk_i
    ,input reset_i
    // to remote nodes
    ,input  [dirs_p-1:0] data_i // late
    ,output [dirs_p-1:0] data_o // early-ish
    // control of the barrier:
    // which inputs we will gather from
    // and which outputs we send the gather output to
    // and for the broadcast phase, the opposite.
    // usually comes from a CSR (or bsg_tag)
    ,input  [dirs_p-1:0]     src_r_i
    ,input  [lg_dirs_lp-1:0] dest_r_i
  );
  wire [dirs_p:0]        data_r;
  wire activate_n;
  wire data_broadcast_in  = data_r[dest_r_i];
  wire sense_n, sense_r;
  wire gather_and = & (~src_r_i | data_r[dirs_p-1:0]); // true if all selected bits are set to 1
  wire gather_or  = | (src_r_i & data_r[dirs_p-1:0]);  // false if all selected bits are set to 0
  // the barrier should go forward, based on the sense bit, if we are either all 0 or all 1.
  wire gather_out = sense_r ? gather_or : gather_and;
  // flip sense bit if we are receiving the incoming broadcast
  // we are relying on the P bit still being high at the leaves
  // sense_r  broadcast_in sense_n
  // 0        0            0
  // 0        1            1
  // 1        1            1
  // 1        0            0
  // if we see a transition on data_broadcast_in, then we have completed the barrier
  assign sense_n = data_broadcast_in;
  bsg_dff_reset #(.width_p(dirs_p+2)) dff
  (.clk_i(clk_i)
   ,.reset_i(reset_i)
   ,.data_i({activate_n,     data_i[dirs_p-1:0], sense_n})
   ,.data_o({data_r[dirs_p], data_r[dirs_p-1:0], sense_r})
  );
  // this is simply a matter of propagating the value in question
  wire [dirs_p-1:0] data_broadcast_out = { dirs_p { data_broadcast_in } } & src_r_i;
  // here we propagate the gather_out value, either to network outputs, or to the local activate reg (at the root of the broadcast)
  wire [dirs_p:0] dest_decode     = 1 << (dest_r_i);
  wire [dirs_p:0] data_gather_out = dest_decode & { (dirs_p+1) { gather_out } };
  assign data_o = data_broadcast_out | data_gather_out[dirs_p-1:0];
  assign activate_n = data_gather_out[dirs_p];
  localparam debug_p = 0;
  if (debug_p)
  always @(negedge clk_i)
    $display("%d: %m %b %b %b %b %b %b", $time, gather_and, gather_or, gather_out, sense_n, data_i, data_o);
endmodule