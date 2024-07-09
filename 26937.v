module decode (
    input [7:0] opcode,
    input [7:0] modrm,
    input [15:0] off_i,
    input [15:0] imm_i,
    input       rep,
    input clk,
    input rst,
    input block,
    input exec_st,
    input div_exc,
    output need_modrm,
    output need_off,
    output need_imm,
    output off_size,
    output imm_size,
    output [`IR_SIZE-1:0] ir,
    output [15:0] off_o,
    output [15:0] imm_o,
    output end_seq,
    input  [2:0] sop_l,
    input        intr,
    input        ifl,
    output reg   inta,
    output reg   ext_int,
    input        repz_pr
  );
  // Net declarations
  wire [`SEQ_ADDR_WIDTH-1:0] base_addr, seq_addr;
  wire [`SEQ_DATA_WIDTH-2:0] micro_addr;
  wire [3:0] src, dst, base, index;
  wire [1:0] seg;
  reg  [`SEQ_ADDR_WIDTH-1:0] seq;
  reg  dive;
  // Module instantiations
  opcode_deco opcode_deco0 (opcode, modrm, rep, sop_l, base_addr, need_modrm,
                            need_off, need_imm, off_size, imm_size, src, dst,
                            base, index, seg);
  seq_rom seq_rom0 (seq_addr, {end_seq, micro_addr});
  micro_data mdata0 (micro_addr, off_i, imm_i, src, dst, base, index, seg,
                     ir, off_o, imm_o);
  // Assignments
  assign seq_addr = (dive ? `INTD
    : (ext_int ? (repz_pr ? `EINTP : `EINT) : base_addr)) + seq;
  // Behaviour
  // seq
  always @(posedge clk)
    if (rst) seq <= `SEQ_ADDR_WIDTH'd0;
    else if (!block)
      seq <= (exec_st && !end_seq && !rst) ? (seq + `SEQ_ADDR_WIDTH'd1)
                                : `SEQ_ADDR_WIDTH'd0;
  // dive
  always @(posedge clk)
    if (rst) dive <= 1'b0;
    else dive <= block ? dive
     : (div_exc ? 1'b1 : (dive ? !end_seq : 1'b0));
  // ext_int
  always @(posedge clk)
    if (rst) ext_int <= 1'b0;
    else ext_int <= block ? ext_int
      : ((intr & ifl & exec_st & end_seq) ? 1'b1
        : (ext_int ? !end_seq : 1'b0));
  // inta
  always @(posedge clk)
    if (rst) inta <= 1'b0;
    else inta <= intr & ext_int;
endmodule