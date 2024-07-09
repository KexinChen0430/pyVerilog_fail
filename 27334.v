module drain #(
   // random generator parameters
   parameter int unsigned RW=1,   // LFSR width
   parameter bit [RW-1:0] RP='0,  // LFSR polinom
   parameter bit [RW-1:0] RR='1   // LFSR reset state
)(
   input logic    clk,
   input logic    rst,
   handshake.drn  inf,
   output integer cnt
);
   // LFSR
   logic [RW-1:0] rnd;
   // LFSR in Galois form
   always @ (posedge clk, posedge rst)
   if (rst) rnd <= RR;
   else     rnd <= {rnd[0], rnd[RW-1:1]} ^ ({RW{rnd[0]}} & RP);
   // counter
   always @ (posedge clk, posedge rst)
   if (rst) cnt <= 32'd0;
   else     cnt <= cnt + (inf.req & inf.grt);
   // grant signal
   assign inf.grt = rnd[0];
endmodule