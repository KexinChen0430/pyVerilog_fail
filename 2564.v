module Host_to_FPGA(input  wire              CLK,
                    input  wire              RST,
                    input  wire              ren,
                    output reg               chnl_rx,
                    output wire [`MERGW-1:0] dot,
                    output wire              doten,
                    output wire [31:0]       length);
  reg rst_buf;  always @(posedge CLK) rst_buf <= RST;
  wire              enq;
  wire              deq;
  wire [`MERGW-1:0] din;
  wire              emp;
  wire              ful;
  wire [4:0]        cnt;
  reg [`SORTW-1:0]  i_d,i_c,i_b,i_a;
  reg               onetime;
  reg [31:0]        enqcnt;
  reg               enqstop;
  wire [`SORTW-1:0] r15,r14,r13,r12,r11,r10,r09,r08,r07,r06,r05,r04,r03,r02,r01,r00;
  reg  [1:0]        selector;
  wire [`MERGW-1:0] din_xorshift = (selector == 0) ? {r03,r02,r01,r00} :
                                   (selector == 1) ? {r07,r06,r05,r04} :
                                   (selector == 2) ? {r11,r10,r09,r08} :
                                   (selector == 3) ? {r15,r14,r13,r12} : 0;
  SRL_FIFO #(4, `MERGW) fifo(CLK, rst_buf, enq, deq, din, dot, emp, ful, cnt);
  assign enq    = (!enqstop && !ful);
  assign deq    = (ren && !emp);
  assign din    = (`INITTYPE=="xorshift") ? din_xorshift : {i_d,i_c,i_b,i_a};
  assign doten  = deq;
  assign length = `SORT_ELM;
  always @(posedge CLK) begin
    if (rst_buf) begin
      chnl_rx <= 0;
      onetime <= 1;
    end else begin
      chnl_rx <= onetime;
      onetime <= 0;
    end
  end
  always @(posedge CLK) begin
    if      (rst_buf) enqcnt <= 0;
    else if (enq)     enqcnt <= enqcnt + 4;
  end
  always @(posedge CLK) begin
    if      (rst_buf)                        enqstop <= 0;
    else if (enq && (enqcnt == `SORT_ELM-4)) enqstop <= 1;
  end
  always @(posedge CLK) begin
    if      (rst_buf) selector <= 0;
    else if (enq)     selector <= selector + 1;
  end
  generate
    if (`INITTYPE=="sorted") begin
      always @(posedge CLK) begin
        if (rst_buf) begin
          i_a <= 1;
          i_b <= 2;
          i_c <= 3;
          i_d <= 4;
        end else begin
          if (enq) begin
            i_a <= i_a+4;
            i_b <= i_b+4;
            i_c <= i_c+4;
            i_d <= i_d+4;
          end
        end
      end
    end else if (`INITTYPE=="reverse") begin
      always @(posedge CLK) begin
        if (rst_buf) begin
          i_a <= `SORT_ELM;
          i_b <= `SORT_ELM-1;
          i_c <= `SORT_ELM-2;
          i_d <= `SORT_ELM-3;
        end else begin
          if (enq) begin
            i_a <= i_a-4;
            i_b <= i_b-4;
            i_c <= i_c-4;
            i_d <= i_d-4;
          end
        end
      end
    end else if (`INITTYPE=="xorshift") begin
      XORSHIFT #(`SORTW, 32'h00000001) xorshift00(CLK, RST, (enq && selector == 0), r00);
      XORSHIFT #(`SORTW, 32'h00000002) xorshift01(CLK, RST, (enq && selector == 0), r01);
      XORSHIFT #(`SORTW, 32'h00000004) xorshift02(CLK, RST, (enq && selector == 0), r02);
      XORSHIFT #(`SORTW, 32'h00000008) xorshift03(CLK, RST, (enq && selector == 0), r03);
      XORSHIFT #(`SORTW, 32'h00000010) xorshift04(CLK, RST, (enq && selector == 1), r04);
      XORSHIFT #(`SORTW, 32'h00000020) xorshift05(CLK, RST, (enq && selector == 1), r05);
      XORSHIFT #(`SORTW, 32'h00000040) xorshift06(CLK, RST, (enq && selector == 1), r06);
      XORSHIFT #(`SORTW, 32'h00000080) xorshift07(CLK, RST, (enq && selector == 1), r07);
      XORSHIFT #(`SORTW, 32'h00000100) xorshift08(CLK, RST, (enq && selector == 2), r08);
      XORSHIFT #(`SORTW, 32'h00000200) xorshift09(CLK, RST, (enq && selector == 2), r09);
      XORSHIFT #(`SORTW, 32'h00000400) xorshift10(CLK, RST, (enq && selector == 2), r10);
      XORSHIFT #(`SORTW, 32'h00000800) xorshift11(CLK, RST, (enq && selector == 2), r11);
      XORSHIFT #(`SORTW, 32'h00001000) xorshift12(CLK, RST, (enq && selector == 3), r12);
      XORSHIFT #(`SORTW, 32'h00002000) xorshift13(CLK, RST, (enq && selector == 3), r13);
      XORSHIFT #(`SORTW, 32'h00004000) xorshift14(CLK, RST, (enq && selector == 3), r14);
      XORSHIFT #(`SORTW, 32'h00008000) xorshift15(CLK, RST, (enq && selector == 3), r15);
    end
  endgenerate
endmodule