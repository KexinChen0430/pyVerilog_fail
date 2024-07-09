module Thinker
  #(
    parameter M = 5,
    parameter N = 2)
   (
    input logic clk,
    input logic reset,
    input 	unique_id_t uids[0:N-1],
    the_intf.t thing_inp,
    the_intf.i thing_out
    );
   the_intf #(.M(M)) curr_things [N-1:0] ();
   the_intf #(.M(M)) prev_things [N-1:0] ();
   the_intf #(.M(M)) curr_thing ();
   the_intf #(.M(M)) prev_thing ();
   logic [N-1:0] select_oh;
   // 1st mux:
   ThingMuxOH #(
    .NTHINGS  ( N           ),
    .M        ( M           ))
   curr_thing_mux(
    .select_oh( select_oh   ),
    .things_in( curr_things ),
    .thing_out( curr_thing  ));
   // 2nd mux, comment this out and no problem:
   ThingMuxOH #(
    .NTHINGS  ( N           ),
    .M        ( M           ))
   prev_thing_mux(
    .select_oh( select_oh   ),
    .things_in( prev_things ),
    .thing_out( prev_thing  ));
endmodule