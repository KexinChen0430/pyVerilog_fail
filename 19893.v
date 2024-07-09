module's enqueue signal
              output reg [1:0]         im_req); // DRAM data request
  wire req;
  reg  deq;
  wire [`DRAMW-1:0] im_dot;
  wire [`IB_SIZE:0] im_cnt;
  wire im_full, im_emp;
  wire im_enq = den; // (!im_full && den);
  wire im_deq = (req && !im_emp);
  always @(posedge CLK) im_req <= (im_cnt==0) ? 3 : (im_cnt<`REQ_THRE);
  always @(posedge CLK) deq <= im_deq;
  BFIFO #(`IB_SIZE, `DRAMW) // note, using BRAM
  imf(.CLK(CLK), .RST(RST), .enq(im_enq), .deq(im_deq), .din(din),
      .dot(im_dot), .emp(im_emp), .full(im_full), .cnt(im_cnt));
  INMOD inmod(.CLK(CLK), .RST(RST), .d_dout(im_dot), .d_douten(deq),
              .IB_full(IB_full), .im_dot(dot), .IB_enq(IB_enq), .im_req(req));
endmodule