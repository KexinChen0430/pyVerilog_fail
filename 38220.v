module nkmd_cpu_dcd(
    input wire clk,
    input wire rst,
    input wire [31:0] inst_i,
    output wire [`DCD_REGSEL_W-1:0] rssel_o,
    output wire [`DCD_REGSEL_W-1:0] rtsel_o,
    output wire [`DCD_REGSEL_W-1:0] rdsel_o,
    output wire [`DCD_ALUSEL_W-1:0] alusel_o,
    output wire [`DCD_IMM_W-1:0] imm_o,
    output wire [`DCD_JMPREL_W-1:0] jmprel_o,
    output wire tval_r_read_en_o,
    output wire sval_c_read_en_o,
    output wire [`DCD_MWSEL_W-1:0] mwsel_o,
    output wire imm_en_o,
    output wire jmp_en_o,
    output wire repn_o);
reg delayed_rst_ff;
always @(posedge clk)
    delayed_rst_ff <= rst;
reg [`DCD_REGSEL_W-1:0] rssel_ff;
reg [`DCD_REGSEL_W-1:0] rtsel_ff;
reg [`DCD_REGSEL_W-1:0] rdsel_ff;
reg [`DCD_ALUSEL_W-1:0] alusel_ff;
reg [`DCD_IMM_W-1:0] imm_ff;
reg [`DCD_JMPREL_W-1:0] jmprel_ff;
reg tval_r_read_en_ff;
reg sval_c_read_en_ff;
reg [`DCD_MWSEL_W-1:0] mwsel_ff;
reg imm_en_ff;
reg jmp_en_ff;
reg repn_ff;
function [`DCD_WIDTH-1:0] nkmd_cpu_dcd_func(
    input [31:0] inst_i);
reg jmpen;
reg memrw;
reg immen;
begin
    jmpen = inst_i[31];
    memrw = inst_i[30];
    immen = inst_i[16];
    nkmd_cpu_dcd_func[`DCD_RSSEL+`DCD_REGSEL_W-1:`DCD_RSSEL] = inst_i[20:17];
    nkmd_cpu_dcd_func[`DCD_RTSEL+`DCD_REGSEL_W-1:`DCD_RTSEL] = inst_i[11:8];
    nkmd_cpu_dcd_func[`DCD_RDSEL+`DCD_REGSEL_W-1:`DCD_RDSEL] = inst_i[27:24];
    nkmd_cpu_dcd_func[`DCD_ALUSEL+`DCD_ALUSEL_W-1:`DCD_ALUSEL] = inst_i[23:21];
    nkmd_cpu_dcd_func[`DCD_IMM+`DCD_IMM_W-1:`DCD_IMM] = {{17{inst_i[15]}}, inst_i[14:0]};
    nkmd_cpu_dcd_func[`DCD_JMPREL+`DCD_JMPREL_W-1:`DCD_JMPREL] = {{25{inst_i[15]}}, inst_i[7:0]};
    nkmd_cpu_dcd_func[`DCD_TVAL_R_READ_EN] = !jmpen && inst_i[28];
    nkmd_cpu_dcd_func[`DCD_SVAL_C_READ_EN] = !jmpen && !immen && inst_i[0];
    nkmd_cpu_dcd_func[`DCD_MWSEL+`DCD_MWSEL_W-1:`DCD_MWSEL] = jmpen ? 2'b00 : inst_i[30:29];
    nkmd_cpu_dcd_func[`DCD_IMMEN] = immen;
    nkmd_cpu_dcd_func[`DCD_JMPEN] = jmpen;
    nkmd_cpu_dcd_func[`DCD_REPN] = !jmpen && !immen && inst_i[12];
end
endfunction
always @(posedge clk) begin
    if (rst == 1'b1 || delayed_rst_ff == 1'b1)
        {repn_ff, jmp_en_ff, imm_en_ff, mwsel_ff, sval_c_read_en_ff, tval_r_read_en_ff, jmprel_ff, imm_ff, alusel_ff, rdsel_ff, rtsel_ff, rssel_ff} <= 0;
    else
        {repn_ff, jmp_en_ff, imm_en_ff, mwsel_ff, sval_c_read_en_ff, tval_r_read_en_ff, jmprel_ff, imm_ff, alusel_ff, rdsel_ff, rtsel_ff, rssel_ff} <= nkmd_cpu_dcd_func(inst_i);
end
assign rssel_o = rssel_ff;
assign rtsel_o = rtsel_ff;
assign rdsel_o = rdsel_ff;
assign alusel_o = alusel_ff;
assign imm_o = imm_ff;
assign jmprel_o = jmprel_ff;
assign tval_r_read_en_o = tval_r_read_en_ff;
assign sval_c_read_en_o = sval_c_read_en_ff;
assign mwsel_o = mwsel_ff;
assign imm_en_o = imm_en_ff;
assign jmp_en_o = jmp_en_ff;
assign repn_o = repn_ff;
endmodule