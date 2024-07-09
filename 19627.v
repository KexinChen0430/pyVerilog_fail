module Mux_Array_DW
    #(parameter SWR=26, parameter EWR=5)
    (
    input wire clk,
    input wire rst,
    input wire [SWR-1:0] Data_i,
    input wire FSM_left_right_i,
    input wire [EWR-1:0] Shift_Value_i,
    input wire bit_shift_i,
    output wire [SWR-1:0] Data_o
    );
wire [SWR:0] Data_array[EWR+1:0];
assign Data_array [0] = {Data_i, bit_shift_i};
genvar k;//Level
Rotate_Mux_Array #(.SWR(SWR+1)) first_rotate(
	.Data_i(Data_array [0] ),
	.select_i(FSM_left_right_i),
	.Data_o(Data_array [1][SWR:0])
	);
  DW_rbsh_inst #(
      .SWR(SWR+1),
      .EWR(EWR)
    ) inst_DW_rbsh_inst (
      .Data_i        (Data_array [2][SWR:0]),
      .Shift_Value_i (Shift_Value_i),
      .inst_SH_TC    (FSM_left_right_i),
      .Data_o        (Data_array [3][SWR:0])
    );
Rotate_Mux_Array #(.SWR(SWR+1) last_rotate(
	.Data_i(Data_array [4][SWR:0]),
	.select_i(FSM_left_right_i),
	.Data_o(Data_o)
	);
endmodule