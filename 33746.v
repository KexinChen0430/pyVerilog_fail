module pippo_div64x32 (
//    clk(),
//    ena(),
//    z(),
//    d(),
//    q(),
//    s(),
//    ovf(),
//    div0()
//);
//`endif
// ALU
reg     [width-1:0]     result;
wire    [width-1:0]     cmp_a, cmp_b;
assign cmp_a = {bus_a[width-1] ^ alu_uops[`ALUOP_SCMP_BIT], bus_a[width-2:0]};
assign cmp_b = {bus_b[width-1] ^ alu_uops[`ALUOP_SCMP_BIT], bus_b[width-2:0]};
always @(alu_op or bus_a or bus_b or cmp_a or cmp_b or shrot_result ) begin
    result = 64'd0;
	casex (alu_op)		// synopsys parallel_case
// arithmetic
		`ALUOP_ADD : begin
            result = bus_a + bus_b;
		end
		`ALUOP_SUB : begin
			result = bus_b - bus_a;
		end
// logic
        `ALUOP_AND : begin
            result = bus_a & bus_b;
        end
		`ALUOP_OR : begin
			result = bus_a | bus_b;
		end
		`ALUOP_XOR : begin
			result = bus_a ^ bus_b;
		end
		`ALUOP_SLT, `ALUOP_SLTU: begin
			result = (cmp_a < cmp_b);
		end
// barrel shifter
        `ALUOP_SLL,  `ALUOP_SRL,  `ALUOP_SRA,
        `ALUOP_SLLW, `ALUOP_SRLW, `ALUOP_SRAW: begin
            result = shrot_result;
        end
// multiplier
//      `ifdef pippo_MULT_IMPLEMENTED
//      `ALUOP_MULHWU, `ALUOP_MULHW, `ALUOP_MULLI, `ALUOP_MULLW: begin
//          result = mul_result;
//      end
//      `endif
	endcase
end
// Simulation check for bad ALU behavior
`ifdef pippo_WARNINGS
// synopsys translate_off
always @(result) begin
	if (result === 32'bx)
		$display("%t: WARNING: 32'bx detected on ALU result bus. Please check !", $time);
end
// synopsys translate_on
`endif
endmodule