module
wire [W-1:0] intDX; //Output of register DATA_X
wire [W-1:0] intDY; //Output of register DATA_Y
wire intAS; //Output of register add_subt
wire gtXY; //Output for magntiude_comparator (X>Y)
wire eqXY; //Output for magntiude_comparator (X=Y)
wire [W-2:0] intM; //Output of MuxXY for bigger value
wire [W-2:0] intm;  //Output of MuxXY for small value
RegisterAdd #(.W(W)) XRegister ( //Data X input register
    .clk(clk),
    .rst(rst),
    .load(load_a_i),
    .D(Data_X_i),
    .Q(intDX)
    );
RegisterAdd #(.W(W)) YRegister ( //Data Y input register
    .clk(clk),
    .rst(rst),
    .load(load_a_i),
    .D(Data_Y_i),
    .Q(intDY)
    );
RegisterAdd #(.W(1)) ASRegister ( //Data Add_Subtract input register
    .clk(clk),
    .rst(rst),
    .load(load_a_i),
    .D(add_subt_i),
    .Q(intAS)
    );
Comparator #(.W(W-1)) Magnitude_Comparator ( //Compare between magnitude for DATA_X and DATA_Y and select whos bigger and if there's a equality
    .Data_X_i(intDX[W-2:0]),
    .Data_Y_i(intDY[W-2:0]),
    .gtXY_o(gtXY),
    .eqXY_o(eqXY)
    );
xor_tri #(.W(W)) Op_verification ( //Operation between the DATA_X & Y's sign bit and the operation bit to find the real operation for ADDER/SUBTRACT
    .A_i(intDX[W-1]),
    .B_i(intDY[W-1]),
    .C_i(intAS),
    .Z_o(real_op_o)
    );
sgn_result result_sign_bit (//Calculate the sign bit for the final result
    .Add_Subt_i(intAS),
    .sgn_X_i(intDX[W-1]),
    .sgn_Y_i(intDY[W-1]),
    .gtXY_i(gtXY),
    .eqXY_i(eqXY),
    .sgn_result_o(sign_result)
    );
MultiplexTxT #(.W(W-1)) MuxXY (//Classify in the registers the bigger value (M) and the smaller value (m)
    .select(gtXY),
    .D0_i(intDX[W-2:0]),
    .D1_i(intDY[W-2:0]),
    .S0_o(intM),
    .S1_o(intm)
    );
RegisterAdd #(.W(W-1)) MRegister ( //Data_M register
    .clk(clk),
    .rst(rst),
    .load(load_b_i),
    .D(intM),
    .Q(DMP_o)
    );
RegisterAdd #(.W(W-1)) mRegister ( //Data_m register
    .clk(clk),
    .rst(rst),
    .load(load_b_i),
    .D(intm),
    .Q(DmP_o)
    );
RegisterAdd #(.W(1)) SignRegister (
    .clk(clk),
    .rst(rst),
    .load(load_b_i),
    .D(sign_result),
    .Q(sign_final_result_o)
    );
assign zero_flag_o = real_op_o & eqXY;
endmodule