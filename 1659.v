module t
  (
   input logic clk,
   input logic reset
   );
   localparam M = 5;
   localparam N = 2;
   unique_id_t uids[0:N-1];
   the_intf #(.M(M)) thing_inp();
   the_intf #(.M(M)) thing_out();
   Thinker #(
    .M        ( M         ),
    .N        ( N         ))
   thinker(
    .clk      ( clk       ),
    .reset    ( reset     ),
    .uids     ( uids      ),
    .thing_inp( thing_inp ),
    .thing_out( thing_out ));
   // Previously there was a problem in V3Inst if non-default parameters was used
   localparam K = 2;
   the_intf #(.M(K)) thing_inp2();
   the_intf #(.M(K)) thing_out2();
   Thinker #(
    .M        ( K         ),
    .N        ( N         ))
   thinker2(
    .clk      ( clk       ),
    .reset    ( reset     ),
    .uids     ( uids      ),
    .thing_inp( thing_inp2 ),
    .thing_out( thing_out2 ));
endmodule