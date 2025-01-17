module
        input wire load_a_i,//underflow
        input wire load_b_i,//overflow
        input wire load_c_i,//result
        input wire [EW:0] Data_A_i,
        input wire [EW:0] Data_B_i,
        input wire Add_Subt_i,
        output wire [EW:0] Data_Result_o,
        output wire Overflow_flag_o,
        output wire Underflow_flag_o
    );
wire [EW:0] Data_S;
wire Overflow_A;
wire Overflow_flag_A;
wire underflow_exp_reg;
wire [EW:0] U_Limit;
add_sub_carry_out #(.W(EW+1)) exp_add_subt_m(
    .op_mode (Add_Subt_i),
    .Data_A (Data_A_i),
    .Data_B (Data_B_i),
    .Data_S ({Overflow_A,Data_S})
    );
RegisterMult #(.W(EW+1)) exp_result_m(
    .clk (clk),
    .rst (rst),
    .load (load_c_i),
    .D (Data_S),
    .Q (Data_Result_o)
    );
//Overflow/////////////////////////////////
RegisterMult#(.W(1)) Oflow_A_m (
    .clk(clk),
    .rst(rst),
    .load(load_b_i),
    .D(Overflow_A),
    .Q(Overflow_flag_A)
    );
assign Overflow_flag_o = Overflow_flag_A | Data_Result_o[EW];
//Underflow//////////////////////////////
Comparator_Less #(.W(EW+1)) Exp_unflow_Comparator_m (
    .Data_A(Data_S),
    .Data_B(U_Limit),
    .less(underflow_exp_reg)
    );
RegisterMult #(.W(1)) Underflow_m (
        .clk(clk),
        .rst(rst),
        .load(load_a_i),
        .D(underflow_exp_reg),
        .Q(Underflow_flag_o)
        );
//Este valor de upper_limit es definido por la precision del formato
// 127 para simple
//1023 para doble
localparam integer Upper_limit = (2**(EW-1)-1);
assign U_Limit = Upper_limit[EW:0];
//generate
//    if (EW == 8)
//        assign U_Limit = 9'd127;
//    else
//        assign U_Limit = 12'd1023;
//endgenerate
endmodule