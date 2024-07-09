module OTMOD(input  wire              CLK,
             input  wire              RST,
             input  wire              d_busy,
             input  wire [31:0]       w_block,
             input  wire              p_z,  // phase zero
             input  wire              F01_deq,
             input  wire [`MERGW-1:0] F01_dot,
             input  wire              OB_deq,
             output wire [`DRAMW-1:0] OB_dot,
             output wire              buf_t_ful,
             output reg               OB_req);
  reg [1:0]         buf_t_cnt; // counter for temporary register
  reg               buf_t_en;
  reg [`DRAMW-1:0]  buf_t;
  wire              buf_t_emp;
  wire [`DRAMW-1:0] c_din;
  wire              c_dinen;
  wire [`DRAMW-1:0] c_dout;
  wire              c_douten;
  wire [`DRAMW-1:0] OB_din = c_dout;
  wire              OB_enq = c_douten;
  wire              OB_full;
  wire [`OB_SIZE:0] OB_cnt;
  // 512-bit shift register ////////////////////////////////////////////////
  always @(posedge CLK) begin
    if (F01_deq) buf_t <= {F01_dot, buf_t[`DRAMW-1:`MERGW]};
  end
  always @(posedge CLK) begin
    if (RST) begin
      buf_t_cnt <= 0;
    end else begin
      if (F01_deq) buf_t_cnt <= buf_t_cnt + 1;
    end
  end
  always @(posedge CLK) buf_t_en <= (F01_deq && buf_t_cnt == 3);
  MRE2 #(1, `DRAMW) tmp(.CLK(CLK), .RST(RST), .enq(buf_t_en), .deq(c_dinen),
                        .din(buf_t), .dot(c_din), .emp(buf_t_emp), .full(buf_t_ful));
  // Compressor ////////////////////////////////////////////////////////////
  assign c_dinen = (~|{buf_t_emp,OB_full});
  COMPRESSOR compressor(CLK, RST, c_din, c_dinen, p_z, OB_full, c_dout, c_douten);
  // Output Buffer /////////////////////////////////////////////////////////
  BFIFO #(`OB_SIZE, `DRAMW) OB(.CLK(CLK), .RST(RST), .enq(OB_enq), .deq(OB_deq),
                               .din(OB_din), .dot(OB_dot), .full(OB_full), .cnt(OB_cnt));
  always @(posedge CLK) OB_req <= ((OB_cnt>=w_block) && !d_busy);
endmodule