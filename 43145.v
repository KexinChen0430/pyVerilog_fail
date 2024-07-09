module instantiation
zet_decode dut (
    .clk(clk),
    .rst_i(rst),
    .flush_i(1'b0),
    .instruction_i(instruction),
    .instruction_valid_i(instruction_valid),
    .next_instruction_o(instruction_next),
    // current cs and ip of instruction
    .instruction_cs_o(instruction_cs_o),
    .instruction_ip_o(instruction_ip_o),
    // {prefix_decoded, repe_repz, repne_repnz, lock}
    .inst_pr_o(inst_pr_o),
    // {prefix_decoded, x, x, address size override}
    .adrs_pr_o(adrs_pr_o),
    // {prefix_decoded, x, x, operand size override}
    .oper_pr_o(oper_pr_o),
    // {prefix_decoded, segment override register}
    .sovr_pr_o(sovr_pr_o),
    .opcode_o(opcode_o),
    .need_modrm_o(need_modrm_o),
    .modrm_o(modrm_o),
    .need_off_o(need_off_o),
    .off_size_o(off_size_o),
    .offset_o(offset_o),
    .need_imm_o(need_imm_o),
    .imm_size_o(imm_size_o),
    .immediate_o(immediate_o),
    // to sequencer
    .seq_addr_o(seq_addr_o),
    .src_o(src_o),
    .dst_o(dst_o),
    .base_o(base_o),
    .index_o(index_o),
    .seg_o(seg_o),
    .decoded_valid_o(decoded_valid_o),
    .next_decoded_i(next_decoded_i)
);
// Behaviour
always @(*) begin
  case(count[0])
    1'd0: instruction <= do16[7:0];
    1'd1: instruction <= do16[15:8];
  endcase
end
always @(posedge clk)
  if (rst)
    begin
      instruction_valid <= 1'b0;
      count <= 20'd0;
    end
  else
  begin
    instruction_valid <= 1'b1;
    if (instruction_next)
      begin
        $display("Address: %h   data byte: %h", count, instruction);
        count <= count + 20'd1;
      end
    if (decoded_valid_o & !next_decoded_i)
      begin
        $display("Instruction_cs: %h", instruction_cs_o);
        $display("Instruction_ip: %h", instruction_ip_o);
        $display(" ");
        $display("Instruction prefix {prefix_decoded, repe_repz, repne_repnz, lock}: %b", inst_pr_o);
        $display("Address Size Override prefix {prefix_decoded, x, x, address size override}: %b", adrs_pr_o);
        $display("Operand Size Override prefix {prefix_decoded, x, x, operand size override}: %b", oper_pr_o);
        $display("Segment Override prefix {prefix_decoded, segment override register}: %b", sovr_pr_o);
        $display(" ");
        $display("Opcode: %h", opcode_o);
        $display(" ");
        $display("Need Modrm: %b", need_modrm_o);
        $display("Modrm: %h", modrm_o);
        $display(" ");
        $display("Need offset: %b",need_off_o);
        $display("Offset Size: %b", off_size_o);
        $display("Offset: %h", offset_o);
        $display(" ");
        $display("Need immediate: %b", need_imm_o);
        $display("Immediate Size: %b", imm_size_o);
        $display("Immediate: %h", immediate_o);
        $display(" ");
        $display("Sequencer Address in hex: %h, bit: %b", seq_addr_o, seq_addr_o);
        $display("Sequencer Source in hex: %h, bit: %b", src_o, src_o);
        $display("Sequencer Destination in hex: %h, bit: %b", dst_o, dst_o);
        $display("Sequencer Base in hex: %h, bit: %b", base_o, base_o);
        $display("Sequencer Index in hex: %h, bit: %b", index_o, index_o);
        $display("Sequencer Segment in hex: %h, bit: %b", seg_o, seg_o);
        $display(" ");
        $display("Instruction finished decoding");
        $display(" ");
        $display(" ");
        $display(" ");
        $display(" ");
        $display("########## Sending next byte sequence: ##########");
        $display(" ");
        next_decoded_i <= 1'b1;
      end
    else
      next_decoded_i <= 1'b0;
  end
always begin
`ifdef ENABLE_VCD
	$dumpfile("decode.vcd");
	$dumpvars(0, dut);
`endif
  clk <= 1'b1;
  rst <= 1'b0;
  #5 rst <= 1'b1;
  #2 rst <= 1'b0;
	waitclock;
	$display(" ");
	$display("########## Sending first byte sequence: ##########");
	$display(" ");
	#1000 rst <= 1'b1;
	//$stop;
end
initial
    begin
      //$readmemh("data.rtlrom", ram, 19'h78000);
      $readmemh("../data.rtlrom", ram);
    end
endmodule