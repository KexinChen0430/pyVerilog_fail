module  stage3_execute(
    /* cpu global */
    input clk_i,
    input rst_i,
    /* to stage 2 */
    output stall_o,
    /* from stage 4 */
    input stall_i,
    /* from stage 2 */
    input [1:0] control_branch_i,
    input control_load_i,
    input control_store_i,
    input [3:0] aluop_i,
    input [31:0] alu_a_i,
    input [31:0] alu_b_i,
    input [31:0] branch_test_val_i,
    input do_wb_i,
    input [4:0] wb_reg_i,
    /* to stage1 */
    output reg take_branch_o,
    output [29:0] branch_pc_o,
    /* to stage 4 */
    output [31:0] alu_o,
    output reg control_load_o,
    output reg control_store_o,
    output reg do_wb_o,
    output reg [4:0] wb_reg_o
);
assign stall_o = stall_i;
reg [3:0] aluop;
reg [31:0] alu_a;
reg [31:0] alu_b;
reg [31:0] branch_test_val;
reg [1:0] control_branch;
/*
initial begin
    ir <= 0;
    nextpc_o <= 0;
end
*/
always @(posedge clk_i)
begin
    if (rst_i) begin
        aluop <= 0;
        alu_a <= 0;
        alu_b <= 0;
        branch_test_val <= 0;
        control_branch <= `CONTROL_BRANCH_COND_NZ;
        control_load_o <= 0;
        control_store_o <= 0;
        do_wb_o <= 0;
        wb_reg_o <= 0;
    end else if (!stall_i) begin
        aluop <= aluop_i;
        alu_a <= alu_a_i;
        alu_b <= alu_b_i;
        branch_test_val <= branch_test_val_i;
        control_branch <= control_branch_i;
        control_load_o <= control_load_i;
        control_store_o <= control_load_i;
        do_wb_o <= do_wb_i;
        wb_reg_o <= wb_reg_i;
    end
end
always @(control_branch or branch_test_val)
begin
    case (control_branch)
        default: begin
            take_branch_o = 0;
        end
        `CONTROL_BRANCH_COND_NZ: begin
            take_branch_o = (branch_test_val != 0);
        end
        `CONTROL_BRANCH_COND_Z: begin
            take_branch_o = (branch_test_val == 0);
        end
    endcase
end
assign branch_pc_o = alu_o[29:0];
alu alu0(
    .op(aluop),
    .a(alu_a),
    .b(alu_b),
    .res(alu_o)
);
endmodule