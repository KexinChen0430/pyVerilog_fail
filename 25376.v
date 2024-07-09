module COMPRESSOR(input  wire              CLK,
                  input  wire              RST,
                  input  wire [`DRAMW-1:0] DIN,
                  input  wire              DIN_EN,
                  input  wire              P_Z,
                  input  wire              BUF_FULL,
                  output wire [`DRAMW-1:0] DOUT,
                  output wire              DOUT_VALID);
  function [`DRAMW-1:0] mux;
    input [`DRAMW-1:0] a;
    input [`DRAMW-1:0] b;
    input              sel;
    begin
      case (sel)
        1'b0: mux = a;
        1'b1: mux = b;
      endcase
    end
  endfunction
  reg din_en;
  always @(posedge CLK) din_en <= DIN_EN;
  reg [31:0] block_cnt;
  always @(posedge CLK) begin
    if (RST) begin
      block_cnt <= 0;
    end else begin
      case ({(block_cnt == ((`SORT_ELM>>4)>>(`P_LOG+`WAY_LOG))), din_en})
        2'b10: block_cnt <= 0;
        2'b01: block_cnt <= block_cnt + 1;
      endcase
    end
  end
  // Base+Delta Compressor /////////////////////////////////////////////////
  wire [`SORTW-1:0] base    = DIN[31 : 0];
  wire [`SORTW-1:0] delta_a = DIN[63 : 32] - DIN[31 : 0];
  wire [`SORTW-1:0] delta_b = DIN[95 : 64] - DIN[63 : 32];
  wire [`SORTW-1:0] delta_c = DIN[127: 96] - DIN[95 : 64];
  wire [`SORTW-1:0] delta_d = DIN[159:128] - DIN[127: 96];
  wire [`SORTW-1:0] delta_e = DIN[191:160] - DIN[159:128];
  wire [`SORTW-1:0] delta_f = DIN[223:192] - DIN[191:160];
  wire [`SORTW-1:0] delta_g = DIN[255:224] - DIN[223:192];
  wire [`SORTW-1:0] delta_h = DIN[287:256] - DIN[255:224];
  wire [`SORTW-1:0] delta_i = DIN[319:288] - DIN[287:256];
  wire [`SORTW-1:0] delta_j = DIN[351:320] - DIN[319:288];
  wire [`SORTW-1:0] delta_k = DIN[383:352] - DIN[351:320];
  wire [`SORTW-1:0] delta_l = DIN[415:384] - DIN[383:352];
  wire [`SORTW-1:0] delta_m = DIN[447:416] - DIN[415:384];
  wire [`SORTW-1:0] delta_n = DIN[479:448] - DIN[447:416];
  wire [`SORTW-1:0] delta_o = DIN[511:480] - DIN[479:448];
  reg         c_cnt;
  reg         c_cflag;
  always @(posedge CLK) c_cflag <= (delta_a<=13'h1fff) && (delta_b<=13'h1fff) && (delta_c<=13'h1fff) && (delta_d<=13'h1fff) &&
                                   (delta_e<=13'h1fff) && (delta_f<=13'h1fff) && (delta_g<=13'h1fff) && (delta_h<=13'h1fff) &&
                                   (delta_i<=13'h1fff) && (delta_j<=13'h1fff) && (delta_k<=13'h1fff) && (delta_l<=13'h1fff) &&
                                   (delta_m<=13'h1fff) && (delta_n<=13'h1fff) && (delta_o<=13'h1fff) && !P_Z;
  wire        c_enable = (din_en && c_cflag);
  wire        c_cntrst;
  reg [226:0] c_data;
  always @(posedge CLK) c_data <= {delta_o[12:0], delta_n[12:0], delta_m[12:0], delta_l[12:0], delta_k[12:0], delta_j[12:0], delta_i[12:0],
                                   delta_h[12:0], delta_g[12:0], delta_f[12:0], delta_e[12:0], delta_d[12:0], delta_c[12:0], delta_b[12:0],
                                   delta_a[12:0], base};
  always @(posedge CLK) begin
    if (RST) begin
      c_cnt <= 0;
    end else begin
      case ({c_enable, c_cntrst})
        2'b10: c_cnt <= ~c_cnt;
        2'b01: c_cnt <= 0;
      endcase
    end
  end
  // Data Packer ///////////////////////////////////////////////////////////
  reg [226:0] data_buf;
  always @(posedge CLK) if (c_enable) data_buf <= c_data;
  reg              p_valid;  // packed data is valid
  reg [`DRAMW-1:0] packed_data;
  always @(posedge CLK) p_valid     <= c_enable && c_cnt;
  always @(posedge CLK) packed_data <= {{32'b0, 1'b1}, 25'b0, c_data, data_buf};
  // temp FIFO /////////////////////////////////////////////////////////////
  reg               deq_req;
  wire              tmp_emp;
  wire              tmp_rst = RST || p_valid;
  wire              tmp_enq = DIN_EN;
  wire              tmp_deq = !BUF_FULL && deq_req && !tmp_emp;
  wire [`DRAMW-1:0] tmp_dout;
  wire              tmp_full;
  MRE2 #(1, `DRAMW) tmp(.CLK(CLK), .RST(tmp_rst), .enq(tmp_enq), .deq(tmp_deq),
                        .din(DIN), .dot(tmp_dout), .emp(tmp_emp), .full(tmp_full));
  assign c_cntrst = tmp_deq;
  always @(posedge CLK) begin
    if (RST) begin
      deq_req <= 0;
    end else begin
      if      ((din_en && !c_cflag) ||
               (din_en && (block_cnt==((`SORT_ELM>>4)>>(`P_LOG+`WAY_LOG))-1) && !c_cnt)) deq_req <= 1;
      else if (tmp_emp)                                                                  deq_req <= 0;
    end
  end
  // Output ////////////////////////////////////////////////////////////////
  assign DOUT       = mux(tmp_dout, packed_data, p_valid);
  assign DOUT_VALID = p_valid || tmp_deq;
endmodule