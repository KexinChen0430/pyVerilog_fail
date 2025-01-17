module
        input wire load_a_i,
        input wire load_b_i,
        input wire [EW-1:0] Data_A_i,
        input wire [EW-1:0] Data_B_i,
        input wire Add_Subt_i,
        output wire [EW-1:0] Data_Result_o,
        output wire Overflow_flag_o,
        output wire Underflow_flag_o
    );
wire Overflow_flag;
wire Underflow_flag;
//wire [EW-1:0] Data_B;
wire [EW:0] Data_S;
//genvar j;
//for (j=0; j<EW; j=j+1)begin
//    assign Data_B[j] = PreData_B_i[j] ^ Add_Subt_i;
//end
add_sub_carry_out #(.W(EW)) exp_add_subt(
    .op_mode (Add_Subt_i),
    .Data_A (Data_A_i),
    .Data_B (Data_B_i),
    .Data_S (Data_S)
    );
//assign Overflow_flag_o = 1'b0;
//assign Underflow_flag_o = 1'b0;
Comparators #(.W_Exp(EW+1)) array_comparators(
    .exp(Data_S),
    .overflow(Overflow_flag),
    .underflow(Underflow_flag)
    );
RegisterAdd #(.W(EW)) exp_result(
    .clk (clk),
    .rst (rst),
    .load (load_a_i),
    .D (Data_S[EW-1:0]),
    .Q (Data_Result_o)
    );
RegisterAdd #(.W(1)) Overflow (
    .clk(clk),
    .rst(rst),
    .load(load_a_i),
    .D(Overflow_flag),
    .Q(Overflow_flag_o)
    );
RegisterAdd #(.W(1)) Underflow (
        .clk(clk),
        .rst(rst),
        .load(load_b_i),
        .D(Underflow_flag),
        .Q(Underflow_flag_o)
        );
endmodule