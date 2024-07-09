module OTMOD(input  wire              CLK,
             input  wire              RST,
             input  wire              F01_deq,
             input  wire [`SORTW-1:0] F01_dot,
             input  wire              OB_deq,
             output wire [`DRAMW-1:0] OB_dot,
             output wire              OB_full,
             output reg               OB_req);
  reg [3:0]        ob_buf_t_cnt; // counter for temporary register
  reg              ob_enque;
  reg [`DRAMW-1:0] ob_buf_t;
  wire [`DRAMW-1:0] OB_din = ob_buf_t;
  wire              OB_enq = ob_enque;
  wire [`OB_SIZE:0] OB_cnt;
  always @(posedge CLK) OB_req <= (OB_cnt>=`DRAM_WBLOCKS);
  always @(posedge CLK) begin
    if (F01_deq) ob_buf_t <= {F01_dot, ob_buf_t[`DRAMW-1:32]};
  end
  always @(posedge CLK) begin
    if (RST) begin
      ob_buf_t_cnt <= 0;
    end else begin
      if (F01_deq) ob_buf_t_cnt <= ob_buf_t_cnt + 1;
    end
  end
  always @(posedge CLK) ob_enque <= (F01_deq && ob_buf_t_cnt == 15);
  BFIFO #(`OB_SIZE, `DRAMW) OB(.CLK(CLK), .RST(RST), .enq(OB_enq), .deq(OB_deq),
                               .din(OB_din), .dot(OB_dot), .full(OB_full), .cnt(OB_cnt));
endmodule