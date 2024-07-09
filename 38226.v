module nkmd_cpu(
    input wire clk,
    input wire rst,
    // BUS R: RAM + MMAPIO
    input wire [31:0] r_data_i,
    output wire [31:0] r_data_o,
    output wire [31:0] r_addr_o,
    output wire r_we_o,
    // BUS P: PROGRAM
    input wire [31:0] p_data_i,
    output wire [31:0] p_addr_o,
    // BUS C: RAM2
    input wire [31:0] c_data_i,
    output wire [31:0] c_data_o,
    output wire [31:0] c_addr_o,
    output wire c_we_o);
// IF -> DCD: Instruction Fetch -> DeCoDe
wire [31:0] if_dcd_inst;
// DCD -> MEM
wire [`DCD_REGSEL_W-1:0] dcd_mem_rssel;
wire [`DCD_REGSEL_W-1:0] dcd_mem_rtsel;
wire [`DCD_REGSEL_W-1:0] dcd_mem_rdsel;
wire [`DCD_ALUSEL_W-1:0] dcd_mem_alusel;
wire [`DCD_IMM_W-1:0] dcd_mem_imm;
wire [`DCD_JMPREL_W-1:0] dcd_mem_jmprel;
wire dcd_mem_imm_en;
wire dcd_mem_jmp_en;
wire [`DCD_MWSEL_W-1:0] dcd_mem_mwsel;
wire dcd_mem_tval_r_read_en;
wire dcd_mem_sval_c_read_en;
// MEM -> EX
wire [31:0] mem_ex_sval;
wire [31:0] mem_ex_tval;
wire [`DCD_ALUSEL_W-1:0] mem_ex_alusel;
wire [`DCD_REGSEL_W-1:0] mem_ex_rdsel;
wire [31:0] mem_ex_rdval;
wire [`DCD_MWSEL_W-1:0] mem_ex_mwsel;
wire [`DCD_JMPREL_W-1:0] mem_ex_jmprel;
wire mem_ex_jmp_en;
// EX -> WB
wire [`DCD_REGSEL_W-1:0] ex_wb_rdsel;
wire [31:0] ex_wb_val;
wire [31:0] ex_wb_rdval;
wire [`DCD_MWSEL_W-1:0] ex_wb_mwsel;
// EX -> IF
wire ex_if_jmp_en;
wire [31:0] ex_if_jmp_pc;
// DCD -> RF
wire [`DCD_REGSEL_W-1:0] dcd_rf_rssel = dcd_mem_rssel;
wire [`DCD_REGSEL_W-1:0] dcd_rf_rtsel = dcd_mem_rtsel;
wire [`DCD_REGSEL_W-1:0] dcd_rf_rdsel = dcd_mem_rdsel;
wire dcd_rf_decn;
// RF -> MEM
wire [31:0] rf_mem_rsval;
wire [31:0] rf_mem_rtval;
wire [31:0] rf_mem_rdval;
// WB -> RF
wire [`DCD_REGSEL_W-1:0] wb_rf_regsel;
wire [31:0] wb_rf_val;
// WB -> MEM
wire [31:0] wb_mem_data;
wire [31:0] wb_mem_addr;
wire wb_mem_r_we;
wire wb_mem_c_we;
// RF -> SEQ
wire rf_seq_regn_is_zero;
// DCD -> SEQ
wire dcd_seq_repn;
// SEQ -> IF
wire seq_if_stop_inc_pc;
// SEQ -> DCD
wire seq_dcd_latch_curr_output;
// IF: Instruction Fetch
nkmd_cpu_if nkmd_cpu_if(
    .clk(clk), .rst(rst),
    .p_data_i(p_data_i),
    .p_addr_o(p_addr_o),
    .seq_stop_inc_pc_i(seq_if_stop_inc_pc),
    .jmp_pc_i(ex_if_jmp_pc),
    .jmp_pc_en_i(ex_if_jmp_en),
    .inst_o(if_dcd_inst));
// DCD: instruction DeCoDe
wire dcd_repn_o;
nkmd_cpu_dcd nkmd_cpu_dcd(
    .clk(clk), .rst(rst),
    .inst_i(if_dcd_inst),
    .rssel_o(dcd_mem_rssel),
    .rtsel_o(dcd_mem_rtsel),
    .rdsel_o(dcd_mem_rdsel),
    .alusel_o(dcd_mem_alusel),
    .imm_o(dcd_mem_imm),
    .jmprel_o(dcd_mem_jmprel),
    .tval_r_read_en_o(dcd_mem_tval_r_read_en),
    .sval_c_read_en_o(dcd_mem_sval_c_read_en),
    .mwsel_o(dcd_mem_mwsel),
    .imm_en_o(dcd_mem_imm_en),
    .jmp_en_o(dcd_mem_jmp_en),
    .repn_o(dcd_repn_o));
assign dcd_rf_decn = dcd_repn_o;
assign dcd_seq_repn = dcd_repn_o;
// MEM: Memory fetch
wire [31:0] mem_r_addr_i = dcd_mem_imm_en ? dcd_mem_imm : rf_mem_rtval;
wire mem_r_rw_conflict;
nkmd_cpu_mem nkmd_cpu_mem(
    .clk(clk), .rst(rst),
    .r_data_i(r_data_i),
    .r_data_o(r_data_o),
    .r_addr_o(r_addr_o),
    .r_we_o(r_we_o),
    .c_data_i(c_data_i),
    .c_data_o(c_data_o),
    .c_addr_o(c_addr_o),
    .c_we_o(c_we_o),
    .mem_r_addr_i(mem_r_addr_i),
    .mem_r_read_en(dcd_mem_tval_r_read_en),
    .mem_r_data_o(mem_ex_tval),
    .mem_c_addr_i(rf_mem_rsval),
    .mem_c_read_en(dcd_mem_sval_c_read_en),
    .mem_c_data_o(mem_ex_sval),
    .wb_addr_i(wb_mem_addr),
    .wb_data_i(wb_mem_data),
    .wb_r_we_i(wb_mem_r_we),
    .wb_c_we_i(wb_mem_c_we),
    .r_rw_conflict_o(mem_r_rw_conflict));
reg [`DCD_ALUSEL_W-1:0] mem_alusel_ff;
reg [`DCD_REGSEL_W-1:0] mem_rdsel_ff;
reg [`DCD_JMPREL_W-1:0] mem_jmprel_ff;
reg [31:0] mem_rdval_ff;
reg [`DCD_MWSEL_W-1:0] mem_mwsel_ff;
reg mem_jmp_en_ff;
always @(posedge clk) begin
    if (rst) begin
        mem_alusel_ff <= 0;
        mem_rdsel_ff <= 0;
        mem_jmprel_ff <= 0;
        mem_rdval_ff <= 0;
        mem_mwsel_ff <= `MWSEL_NO;
        mem_jmp_en_ff <= 0;
    end else begin
        mem_alusel_ff <= dcd_mem_alusel;
        mem_rdsel_ff <= dcd_mem_rdsel;
        mem_jmprel_ff <= dcd_mem_jmprel;
        mem_rdval_ff <= rf_mem_rdval;
        mem_mwsel_ff <= dcd_mem_mwsel;
        mem_jmp_en_ff <= dcd_mem_jmp_en;
    end
end
assign mem_ex_alusel = mem_alusel_ff;
assign mem_ex_rdsel = mem_rdsel_ff;
assign mem_ex_jmprel = mem_jmprel_ff;
assign mem_ex_rdval = mem_rdval_ff;
assign mem_ex_mwsel = mem_mwsel_ff;
assign mem_ex_jmp_en = mem_jmp_en_ff;
// EX: EXecute alu
nkmd_cpu_ex nkmd_cpu_ex(
    .clk(clk), .rst(rst),
    .rsval_i(mem_ex_sval),
    .rtval_i(mem_ex_tval),
    .alusel_i(mem_ex_alusel),
    .rdsel_i(mem_ex_rdsel),
    .jmp_en_i(mem_ex_jmp_en),
    .rdval_i(mem_ex_rdval),
    .mwsel_i(mem_ex_mwsel),
    .jmprel_i(mem_ex_jmprel),
    .rdsel_o(ex_wb_rdsel),
    .val_o(ex_wb_val),
    .rdval_o(ex_wb_rdval),
    .mwsel_o(ex_wb_mwsel),
    .jmp_en_o(ex_if_jmp_en),
    .jmp_pc_o(ex_if_jmp_pc));
// WB: WriteBack to mem or regfile
nkmd_cpu_wb nkmd_cpu_wb(
    .clk(clk), .rst(rst),
    .regsel_i(ex_wb_rdsel),
    .val_i(ex_wb_val),
    .rdval_i(ex_wb_rdval),
    .mwsel_i(ex_wb_mwsel),
    .rf_rdsel_o(wb_rf_regsel),
    .rf_val_o(wb_rf_val),
    .mem_data_o(wb_mem_data),
    .mem_addr_o(wb_mem_addr),
    .mem_r_we_o(wb_mem_r_we),
    .mem_c_we_o(wb_mem_c_we));
// SEQ: SEQuencer
nkmd_cpu_seq nkmd_cpu_seq(
    /* .clk(clk), .rst(rst), */
    .rf_regn_is_zero_i(rf_seq_regn_is_zero),
    .dcd_repn_i(dcd_seq_repn),
    .if_stop_inc_pc_o(seq_if_stop_inc_pc),
    .dcd_latch_curr_output_o(seq_dcd_latch_curr_output));
// RF: Register File
nkmd_cpu_regfile nkmd_cpu_regfile(
    .clk(clk), .rst(rst),
    .dcd_decn_i(dcd_rf_decn),
    .dcd_rssel_i(dcd_rf_rssel),
    .dcd_rtsel_i(dcd_rf_rtsel),
    .dcd_rdsel_i(dcd_rf_rdsel),
    .mem_rsval_o(rf_mem_rsval),
    .mem_rtval_o(rf_mem_rtval),
    .mem_rdval_o(rf_mem_rdval),
    .wb_sel_i(wb_rf_regsel),
    .wb_val_i(wb_rf_val),
    .seq_regn_is_zero_o(rf_seq_regn_is_zero));
// MEMAA: MEMory Access Arbitrator
`ifdef SIMULATION
task print_regsel;
    input [`DCD_REGSEL_W-1:0] regsel;
begin
    case (regsel)
    4'h0: $write("c0");
    4'h1: $write("a");
    4'h2: $write("b");
    4'h3: $write("c");
    4'h4: $write("d");
    4'h5: $write("e");
    4'h6: $write("f");
    4'h7: $write("g");
    4'h8: $write("h");
    4'h9: $write("i");
    4'ha: $write("j");
    4'hb: $write("ra");
    4'hc: $write("sl");
    4'hd: $write("sh");
    4'he: $write("n");
    4'hf: $write("pc");
    default: $write("?%h", regsel);
    endcase
end
endtask
task print_alusel;
    input [`DCD_ALUSEL_W-1:0] alusel;
begin
    case (alusel)
    3'h0: $write("add");
    3'h1: $write("sub");
    3'h2: $write("or");
    3'h3: $write("and");
    3'h4: $write("xor");
    3'h5: $write("resv");
    3'h6: $write("clamp");
    3'h7: $write("mul");
    default: $write("?%h", alusel);
    endcase
end
endtask
task print_mwsel;
    input [`DCD_MWSEL_W-1:0] mwsel;
begin
    case (mwsel)
    `MWSEL_NO: $write("-");
    `MWSEL_R: $write("R");
    `MWSEL_T: $write("T");
    `MWSEL_C: $write("C");
    default: $write("?%h", mwsel);
    endcase
end
endtask
always @(posedge clk) begin
if (!rst) begin
    $display("<statedump>");
    $display("IF/DCD  inst %h", if_dcd_inst);
    $write("DCD/MEM rs ");
    print_regsel(dcd_mem_rssel);
    $write(" rt ");
    print_regsel(dcd_mem_rtsel);
    $write(" rd ");
    print_regsel(dcd_mem_rdsel);
    $write(" alu ");
    print_alusel(dcd_mem_alusel);
    if (dcd_mem_imm_en)
        $write(" imm %h", dcd_mem_imm);
    else
        $write(" imm disabled");
    if (dcd_mem_jmp_en)
        $write(" jmprel %h", dcd_mem_jmprel);
    else
        $write(" jmprel disabled");
    $write(" [r->t,c->s]rden %h%h", dcd_mem_tval_r_read_en, dcd_mem_sval_c_read_en);
    $write(" mw ");
    print_mwsel(dcd_mem_mwsel);
    $write("\n");
    $display("MEM r_addr_i %h from imm? %d", mem_r_addr_i, dcd_mem_imm_en);
    $write("MEM/EX  ");
    $write("sval %h tval %h", mem_ex_sval, mem_ex_tval);
    $write(" alusel ");
    print_alusel(mem_ex_alusel);
    $write(" mw ");
    print_mwsel(mem_ex_mwsel);
    $write("\n");
    $write("EX/WB   ");
    $write("rdsel ");
    print_regsel(ex_wb_rdsel);
    $write(" val %h", ex_wb_val);
    $write(" rdval %h", ex_wb_rdval);
    $write(" mw ");
    print_mwsel(ex_wb_mwsel);
    $write("\n");
    $write("EX/IF   ");
    if (ex_if_jmp_en)
        $write("jmp_pc %h", ex_if_jmp_pc);
    else
        $write("jmp_pc disabled");
    $write("\n");
    $display("------------------------------------------------------------------------------");
    $display("IF fetchaddr %h", p_addr_o);
    $write("DCD/RF ");
    $write(" rssel ");
    print_regsel(dcd_rf_rssel);
    $write(" rtsel ");
    print_regsel(dcd_rf_rtsel);
    $write("\n");
    $write("RF/MEM ");
    $write(" sval %h", rf_mem_rsval);
    $write(" tval %h", rf_mem_rtval);
    $write("\n");
    $write("WB/RF  ");
    $write(" regsel ");
    print_regsel(wb_rf_regsel);
    $write(" val %h", wb_rf_val);
    $write("\n");
    $write("WB/MEM ");
    $write(" data %h addr %h", wb_mem_data, wb_mem_addr);
    $write(" rc_we %b%b\n", wb_mem_r_we, wb_mem_c_we);
    $display("RF/SEQ  repn %h", dcd_seq_repn);
    $display("SEQ/IF  stop_inc_pc %h", seq_if_stop_inc_pc);
    $display("SEQ/DCD latch_curr_output %h", seq_dcd_latch_curr_output);
    nkmd_cpu_regfile.dump();
    $display("------------------------------------------------------------------------------");
    $display("Rbus data_i %h data_o %h addr_o %h we_o %h conflict %d", r_data_i, r_data_o, r_addr_o, r_we_o, mem_r_rw_conflict);
    $display("Pbus data_i %h addr_o %h", p_data_i, p_addr_o);
    $display("</statedump>");
end
end
`endif
endmodule