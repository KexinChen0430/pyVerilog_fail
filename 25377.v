module DECOMPRESSOR #(parameter                          SIZE   = 7,
                      parameter                          BLOCKS = 8)
                     (input  wire                        CLK,
                      input  wire                        RST,
                      input  wire [`SRTP_WAY+`DRAMW-1:0] DIN,
                      input  wire                        DIN_EN,
                      output reg  [`DRAMW-1:0]           DOUT,
                      output reg  [`SRTP_WAY:0]          COUT,
                      output reg                         DATA_REQ);
  function [227-1:0] mux227;
    input [227-1:0] a;
    input [227-1:0] b;
    input           sel;
    begin
      case (sel)
        1'b0: mux227 = a;
        1'b1: mux227 = b;
      endcase
    end
  endfunction
  function [512-1:0] mux512;
    input [512-1:0] a;
    input [512-1:0] b;
    input           sel;
    begin
      case (sel)
        1'b0: mux512 = a;
        1'b1: mux512 = b;
      endcase
    end
  endfunction
  // FIFO (Block RAM) //////////////////////////////////////////////////////
  wire                        dmft_full;
  wire                        dmf_emp;
  wire                        dmf_enq = DIN_EN;
  wire                        dmf_deq = !dmf_emp && !dmft_full;
  wire [`SRTP_WAY+`DRAMW-1:0] dmf_din = DIN;
  wire                        dmf_full;
  wire [`SRTP_WAY+`DRAMW-1:0] dmf_dout;
  wire [SIZE:0]               dmf_cnt;
  BFIFO #(SIZE, `SRTP_WAY+`DRAMW) dmf(CLK, RST, dmf_enq, dmf_deq, dmf_din, dmf_dout, dmf_emp, dmf_full, dmf_cnt);
  reg dmf_dataen;
  always @(posedge CLK) dmf_dataen <= dmf_deq;
  always @(posedge CLK) DATA_REQ <= (dmf_cnt <= (1<<SIZE)-BLOCKS);
  // FIFO (two entries) ///////////////////////////////////////////////////
  wire                        dmft_enq = dmf_dataen;
  wire [`SRTP_WAY+`DRAMW-1:0] dmft_din = dmf_dout;
  wire [`SRTP_WAY+`DRAMW-1:0] dmft_dout;
  wire                        dmft_emp;
  wire                        c_valid = (dmft_dout[`DRAMW-1:`DRAMW-33]=={32'b0,1'b1});  // check whether the data is compressed or not
  reg                         c_sel;
  wire                        dmft_deq = c_sel || (!c_valid && !dmft_emp);
  MRE2 #(1, `SRTP_WAY+`DRAMW) dmft(.CLK(CLK), .RST(RST), .enq(dmft_enq), .deq(dmft_deq),
                                   .din(dmft_din), .dot(dmft_dout), .emp(dmft_emp), .full(dmft_full));
  // Base+Delta Decompressor ///////////////////////////////////////////////
  always @(posedge CLK) begin
    if (RST) begin
      c_sel <= 0;
    end else begin
      if  (c_valid && !dmft_emp) c_sel <= ~c_sel;
    end
  end
  wire [226:0] c_data = mux227(dmft_dout[226:0], dmft_dout[453:227], c_sel);
  // Stage A
  wire [`SORTW-1:0] a00 = c_data[31 : 0];
  wire [`SORTW-1:0] a01 = {19'b0, c_data[44 : 32]};
  wire [`SORTW-1:0] a02 = {19'b0, c_data[57 : 45]};
  wire [`SORTW-1:0] a03 = {19'b0, c_data[70 : 58]};
  wire [`SORTW-1:0] a04 = {19'b0, c_data[83 : 71]};
  wire [`SORTW-1:0] a05 = {19'b0, c_data[96 : 84]};
  wire [`SORTW-1:0] a06 = {19'b0, c_data[109: 97]};
  wire [`SORTW-1:0] a07 = {19'b0, c_data[122:110]};
  wire [`SORTW-1:0] a08 = {19'b0, c_data[135:123]};
  wire [`SORTW-1:0] a09 = {19'b0, c_data[148:136]};
  wire [`SORTW-1:0] a10 = {19'b0, c_data[161:149]};
  wire [`SORTW-1:0] a11 = {19'b0, c_data[174:162]};
  wire [`SORTW-1:0] a12 = {19'b0, c_data[187:175]};
  wire [`SORTW-1:0] a13 = {19'b0, c_data[200:188]};
  wire [`SORTW-1:0] a14 = {19'b0, c_data[213:201]};
  wire [`SORTW-1:0] a15 = {19'b0, c_data[226:214]};
  reg [511:0] pdA; // pipeline regester A for data
  always @(posedge CLK) pdA <= {a15,a14,a13,a12,a11,a10,a09,a08,a07,a06,a05,a04,(a03+a02+a01+a00),(a02+a01+a00),(a01+a00),a00};
  reg [`DRAMW-1:0] dmft_dout_A;
  always @(posedge CLK) dmft_dout_A <= dmft_dout[`DRAMW-1:0];
  reg [(`SRTP_WAY+1+1)-1:0] pcA;  // pipeline regester A for control
  always @(posedge CLK) pcA <= {dmft_dout[`SRTP_WAY+`DRAMW-1:`DRAMW], (!dmft_emp), c_valid};
  // Stage B
  wire [`SORTW-1:0] b15,b14,b13,b12,b11,b10,b09,b08,b07,b06,b05,b04,b03,b02,b01,b00; // input
  assign {b15,b14,b13,b12,b11,b10,b09,b08,b07,b06,b05,b04,b03,b02,b01,b00} = pdA;
  reg [511:0] pdB; // pipeline regester B for data
  always @(posedge CLK) pdB <= {b15,b14,b13,b12,b11,b10,b09,b08,b07,(b06+b05+b04+b03),(b05+b04+b03),(b04+b03),b03,b02,b01,b00};
  reg [`DRAMW-1:0] dmft_dout_B;
  always @(posedge CLK) dmft_dout_B <= dmft_dout_A;
  reg [(`SRTP_WAY+1+1)-1:0] pcB;  // pipeline regester B for control
  always @(posedge CLK) pcB <= pcA;
  // Stage C
  wire [`SORTW-1:0] c15,c14,c13,c12,c11,c10,c09,c08,c07,c06,c05,c04,c03,c02,c01,c00; // input
  assign {c15,c14,c13,c12,c11,c10,c09,c08,c07,c06,c05,c04,c03,c02,c01,c00} = pdB;
  reg [511:0] pdC; // pipeline regester C for data
  always @(posedge CLK) pdC <= {c15,c14,c13,c12,c11,c10,(c09+c08+c07+c06),(c08+c07+c06),(c07+c06),c06,c05,c04,c03,c02,c01,c00};
  reg [`DRAMW-1:0] dmft_dout_C;
  always @(posedge CLK) dmft_dout_C <= dmft_dout_B;
  reg [(`SRTP_WAY+1+1)-1:0] pcC;  // pipeline regester C for control
  always @(posedge CLK) pcC <= pcB;
  // Stage D
  wire [`SORTW-1:0] d15,d14,d13,d12,d11,d10,d09,d08,d07,d06,d05,d04,d03,d02,d01,d00; // input
  assign {d15,d14,d13,d12,d11,d10,d09,d08,d07,d06,d05,d04,d03,d02,d01,d00} = pdC;
  reg [511:0] pdD; // pipeline regester D for data
  always @(posedge CLK) pdD <= {d15,d14,d13,(d12+d11+d10+d09),(d11+d10+d09),(d10+d09),d09,d08,d07,d06,d05,d04,d03,d02,d01,d00};
  reg [`DRAMW-1:0] dmft_dout_D;
  always @(posedge CLK) dmft_dout_D <= dmft_dout_C;
  reg [(`SRTP_WAY+1+1)-1:0] pcD;  // pipeline regester D for control
  always @(posedge CLK) pcD <= pcC;
  // Stage E
  wire [`SORTW-1:0] e15,e14,e13,e12,e11,e10,e09,e08,e07,e06,e05,e04,e03,e02,e01,e00; // input
  assign {e15,e14,e13,e12,e11,e10,e09,e08,e07,e06,e05,e04,e03,e02,e01,e00} = pdD;
  reg [511:0] pdE; // pipeline regester E for data
  always @(posedge CLK) pdE <= {(e15+e14+e13+e12),(e14+e13+e12),(e13+e12),e12,e11,e10,e09,e08,e07,e06,e05,e04,e03,e02,e01,e00};
  reg [`DRAMW-1:0] dmft_dout_E;
  always @(posedge CLK) dmft_dout_E <= dmft_dout_D;
  reg [(`SRTP_WAY+1+1)-1:0] pcE;  // pipeline regester E for control
  always @(posedge CLK) pcE <= pcD;
  // Decompression Result
  wire [`DRAMW-1:0] dc_data  = pdE;
  wire [`DRAMW-1:0] dmft_dot = dmft_dout_E;
  wire              c_vld    = pcE[0];
  wire              dataen   = pcE[1];
  // Output ////////////////////////////////////////////////////////////////
  always @(posedge CLK) if (dataen) DOUT <= mux512(dmft_dot, dc_data, c_vld);
  always @(posedge CLK) COUT <= pcE[(`SRTP_WAY+1+1)-1:1];
endmodule