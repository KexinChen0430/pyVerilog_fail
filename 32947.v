module RKOA
    //#(parameter SW = 24, parameter precision = 0)
    #(parameter SW = 54)
    (
    input wire [SW-1:0] Data_A_i,
    input wire [SW-1:0] Data_B_i,
    output wire [2*SW-1:0] sgf_result_o
    );
    wire [SW/2+1:0] result_A_adder;
    wire [SW/2+1:0] result_B_adder;
    wire [2*(SW/2)-1:0] Q_left;
    wire [2*(SW/2+1)-1:0] Q_right;
    wire [2*(SW/2+2)-1:0] Q_middle;
    wire [2*(SW/2+2)-1:0] S_A;
    wire [2*(SW/2+2)-1:0] S_B;
    wire [4*(SW/2)+2:0] Result;
    wire [1:0] zero1;
    wire [3:0] zero2;
    assign zero1 =2'b00;
    assign zero2 =4'b0000;
    wire [SW/2-1:0] rightside1;
    wire [SW/2:0] rightside2;
    //Modificacion: Leftside signals are added. They are created as zero fillings as preparation for the final adder.
    wire [SW/2-3:0] leftside1;
    wire [SW/2-4:0] leftside2;
    wire [4*(SW/2)-1:0] sgf_r;
    assign rightside1 = (SW/2) *1'b0;
    assign rightside2 = (SW/2+1)*1'b0;
    assign leftside1 = (SW/2-2) *1'b0; //Se le quitan dos bits con respecto al right side, esto porque al sumar, se agregan bits, esos hacen que sea diferente
    assign leftside2 = (SW/2-1)*1'b0;
    localparam half = SW/2;
    //localparam level1=4;
    //localparam level2=5;
    // localparam i;
    // i = Stop_I;
        `define STOP_SW1 3
        `define STOP_SW2 4
generate
    //assign i = Stop_I;
    if (SW <=`STOP_SW1 || SW <=`STOP_SW2) begin
        assign sgf_result_o = Data_A_i * Data_B_i;
    end else begin
    case (SW%2)
        0:begin
       //Multiplier for left side and right side
            RKOA #(.SW(SW/2) /*,.level(level1)*/) left(
                .Data_A_i(Data_A_i[SW-1:SW-SW/2]),
                .Data_B_i(Data_B_i[SW-1:SW-SW/2]),
                .sgf_result_o(/*result_left_mult*/Q_left)
            );
            RKOA #(.SW(SW/2)/*,.level(level1)*/) right(
                .Data_A_i(Data_A_i[SW-SW/2-1:0]),
                .Data_B_i(Data_B_i[SW-SW/2-1:0]),
                .sgf_result_o(/*result_right_mult[2*(SW/2)-1:0]*/Q_right[2*(SW/2)-1:0])
            );
           //Adders for middle
`ifndef STRAT1
            adder #(.W(SW/2)) A_operation (
                .Data_A_i(Data_A_i[SW-1:SW-SW/2]),
                .Data_B_i(Data_A_i[SW-SW/2-1:0]),
                .Data_S_o(result_A_adder[SW/2:0])
            );
            adder #(.W(SW/2)) B_operation (
                .Data_A_i(Data_B_i[SW-1:SW-SW/2]),
                .Data_B_i(Data_B_i[SW-SW/2-1:0]),
                .Data_S_o(result_B_adder[SW/2:0])
            );
`endif
`ifdef STRAT2
            assign result_A_adder = (Data_A_i[SW-SW/2-1:0] + Data_A_i[SW-1:SW-SW/2]);
            assign result_B_adder = (Data_B_i[SW-SW/2-1:0] + Data_B_i[SW-1:SW-SW/2]);
`endif
             RKOA #(.SW(SW/2+1) ) middle (
                .Data_A_i(/*Q_result_A_adder[SW/2:0]*/result_A_adder[SW/2:0]),
                .Data_B_i(/*Q_result_B_adder[SW/2:0]*/result_B_adder[SW/2:0]),
                .sgf_result_o(/*result_middle_mult[2*(SW/2)+1:0]*/Q_middle[2*(SW/2)+1:0])
            );
`ifndef STRAT1
            substractor #(.W(SW+2)) Subtr_1 (
                .Data_A_i(/*result_middle_mult/Q_middle[2*(SW/2)+1:0]),
                .Data_B_i({zero1, /*result_left_mult/Q_left}),
                .Data_S_o(S_A[2*(SW/2)+1:0])
            );
            substractor #(.W(SW+2)) Subtr_2 (
                .Data_A_i(S_A[2*(SW/2)+1:0]),
                .Data_B_i({zero1, /*result_right_mult/Q_right[2*(SW/2)-1:0]}),
                .Data_S_o(S_B[2*(SW/2)+1:0])
            );
`endif
`ifdef STRAT2
            assign S_B = ((Q_middle[2*(SW/2)+1:0] - Q_left) - {zero1,Q_right[2*(SW/2)-1:0]});
`endif
           //Final adder
            adder #(.W(4*(SW/2))) Final(
                .Data_A_i({/*result_left_mult,result_right_mult*/Q_left,Q_right[2*(SW/2)-1:0]}),
                .Data_B_i({leftside1,S_B[2*(SW/2)+1:0],rightside1}),
                .Data_S_o(Result[4*(SW/2):0])
            );
          assign sgf_result_o = Result[2*SW-1:0];
         // assign sgf_result_o = {Q_left,Q_right[2*(SW/2)-1:0]} + {S_B[2*(SW/2)+1:0],rightside1};
        end
    1:begin
        //Multiplier for left side and right side
            RKOA #(.SW(SW/2) ) left_high(
                        .Data_A_i(Data_A_i[SW-1:SW/2+1]),
                        .Data_B_i(Data_B_i[SW-1:SW/2+1]),
                        .sgf_result_o(/*result_left_mult*/Q_left)
            );
            RKOA #(.SW((SW/2)+1) ) right_lower(
                .Data_A_i(Data_A_i[SW/2:0]),
                .Data_B_i(Data_B_i[SW/2:0]),
                .sgf_result_o(/*result_right_mult*/Q_right)
            );
           //Adders for middle
`ifndef STRAT3
            adder #(.W(SW/2+1)) A_operation (
                .Data_A_i({1'b0,Data_A_i[SW-1:SW-SW/2]}),
                .Data_B_i(Data_A_i[SW-SW/2-1:0]),
                .Data_S_o(result_A_adder)
            );
            adder #(.W(SW/2+1)) B_operation (
                .Data_A_i({1'b0,Data_B_i[SW-1:SW-SW/2]}),
                .Data_B_i(Data_B_i[SW-SW/2-1:0]),
                .Data_S_o(result_B_adder)
            );
`endif
`ifdef STRAT4
            assign result_A_adder = (Data_A_i[SW-SW/2-1:0] + Data_A_i[SW-1:SW-SW/2]);
            assign result_B_adder = Data_B_i[SW-SW/2-1:0] + Data_B_i[SW-1:SW-SW/2];
`endif
           //multiplication for middle
            RKOA #(.SW(SW/2+2) ) middle (
                .Data_A_i(/*Q_result_A_adder*/result_A_adder),
                .Data_B_i(/*Q_result_B_adder*/result_B_adder),
                .sgf_result_o(/*result_middle_mult*/Q_middle)
            );
           //segmentation registers array
`ifndef STRAT3
            substractor #(.W(2*(SW/2+2))) Subtr_1 (
                .Data_A_i(/*result_middle_mult/Q_middle),
                .Data_B_i({zero2, /*result_left_mult/Q_left}),
                .Data_S_o(S_A)
            );
            substractor #(.W(2*(SW/2+2))) Subtr_2 (
                .Data_A_i(S_A),
                .Data_B_i({zero1, /*result_right_mult/Q_right}),
                .Data_S_o(S_B)
            );
`endif
`ifdef STRAT4
            assign S_B = ((Q_middle - Q_left) - Q_right);
`endif
           //Final adder
`ifndef STRAT3
            adder #(.W(4*(SW/2)+2)) Final(
                .Data_A_i({/*result_left_mult,result_right_mult*/Q_left,Q_right}),
                .Data_B_i({S_B,rightside2}),
                .Data_S_o(Result[4*(SW/2)+2:0])
            );
`endif
`ifdef STRAT4
                assign Result[4*(SW/2)+2:0] = {S_B,rightside2} + {Q_left,Q_right};
`endif
          assign sgf_result_o = Result[2*SW-1:0];
            //assign sgf_result_o = ({Q_left,Q_right} + {S_B,rightside2});
        end
    endcase
end
endgenerate
endmodule