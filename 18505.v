module Bmul (
p, a
)/* synthesis syn_black_box syn_noprune=1 */;
  output [7 : 0] p;
  input [7 : 0] a;
  // synthesis translate_off
  wire [7 : 1] NlwRenamedSignal_a;
  assign
    p[6] = NlwRenamedSignal_a[7],
    p[5] = NlwRenamedSignal_a[6],
    p[4] = NlwRenamedSignal_a[5],
    p[3] = NlwRenamedSignal_a[4],
    p[2] = NlwRenamedSignal_a[3],
    p[1] = NlwRenamedSignal_a[2],
    p[0] = NlwRenamedSignal_a[1],
    NlwRenamedSignal_a[7] = a[7],
    NlwRenamedSignal_a[6] = a[6],
    NlwRenamedSignal_a[5] = a[5],
    NlwRenamedSignal_a[4] = a[4],
    NlwRenamedSignal_a[3] = a[3],
    NlwRenamedSignal_a[2] = a[2],
    NlwRenamedSignal_a[1] = a[1];
  GND   \blk00000001/blk00000002  (
    .G(p[7])
  );
// synthesis translate_on
endmodule