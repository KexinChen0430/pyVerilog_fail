module  alt_mem_ddrx_ecc_decoder_32_decode
	(
	data,
	eq) /* synthesis synthesis_clearbox=1 */;
	input   [5:0]  data;
	output   [63:0]  eq;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   [5:0]  data;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif
	wire  [5:0]  data_wire;
	wire  [63:0]  eq_node;
	wire  [63:0]  eq_wire;
	wire  [3:0]  w_anode1000w;
	wire  [3:0]  w_anode1010w;
	wire  [3:0]  w_anode1020w;
	wire  [3:0]  w_anode1030w;
	wire  [3:0]  w_anode1041w;
	wire  [3:0]  w_anode1053w;
	wire  [3:0]  w_anode1064w;
	wire  [3:0]  w_anode1074w;
	wire  [3:0]  w_anode1084w;
	wire  [3:0]  w_anode1094w;
	wire  [3:0]  w_anode1104w;
	wire  [3:0]  w_anode1114w;
	wire  [3:0]  w_anode1124w;
	wire  [3:0]  w_anode1135w;
	wire  [3:0]  w_anode1147w;
	wire  [3:0]  w_anode1158w;
	wire  [3:0]  w_anode1168w;
	wire  [3:0]  w_anode1178w;
	wire  [3:0]  w_anode1188w;
	wire  [3:0]  w_anode1198w;
	wire  [3:0]  w_anode1208w;
	wire  [3:0]  w_anode1218w;
	wire  [3:0]  w_anode464w;
	wire  [3:0]  w_anode482w;
	wire  [3:0]  w_anode499w;
	wire  [3:0]  w_anode509w;
	wire  [3:0]  w_anode519w;
	wire  [3:0]  w_anode529w;
	wire  [3:0]  w_anode539w;
	wire  [3:0]  w_anode549w;
	wire  [3:0]  w_anode559w;
	wire  [3:0]  w_anode571w;
	wire  [3:0]  w_anode583w;
	wire  [3:0]  w_anode594w;
	wire  [3:0]  w_anode604w;
	wire  [3:0]  w_anode614w;
	wire  [3:0]  w_anode624w;
	wire  [3:0]  w_anode634w;
	wire  [3:0]  w_anode644w;
	wire  [3:0]  w_anode654w;
	wire  [3:0]  w_anode665w;
	wire  [3:0]  w_anode677w;
	wire  [3:0]  w_anode688w;
	wire  [3:0]  w_anode698w;
	wire  [3:0]  w_anode708w;
	wire  [3:0]  w_anode718w;
	wire  [3:0]  w_anode728w;
	wire  [3:0]  w_anode738w;
	wire  [3:0]  w_anode748w;
	wire  [3:0]  w_anode759w;
	wire  [3:0]  w_anode771w;
	wire  [3:0]  w_anode782w;
	wire  [3:0]  w_anode792w;
	wire  [3:0]  w_anode802w;
	wire  [3:0]  w_anode812w;
	wire  [3:0]  w_anode822w;
	wire  [3:0]  w_anode832w;
	wire  [3:0]  w_anode842w;
	wire  [3:0]  w_anode853w;
	wire  [3:0]  w_anode865w;
	wire  [3:0]  w_anode876w;
	wire  [3:0]  w_anode886w;
	wire  [3:0]  w_anode896w;
	wire  [3:0]  w_anode906w;
	wire  [3:0]  w_anode916w;
	wire  [3:0]  w_anode926w;
	wire  [3:0]  w_anode936w;
	wire  [3:0]  w_anode947w;
	wire  [3:0]  w_anode959w;
	wire  [3:0]  w_anode970w;
	wire  [3:0]  w_anode980w;
	wire  [3:0]  w_anode990w;
	wire  [2:0]  w_data462w;
	assign
		data_wire = data,
		eq = eq_node,
		eq_node = eq_wire[63:0],
		eq_wire = {{w_anode1218w[3], w_anode1208w[3], w_anode1198w[3], w_anode1188w[3], w_anode1178w[3], w_anode1168w[3], w_anode1158w[3], w_anode1147w[3]}, {w_anode1124w[3], w_anode1114w[3], w_anode1104w[3], w_anode1094w[3], w_anode1084w[3], w_anode1074w[3], w_anode1064w[3], w_anode1053w[3]}, {w_anode1030w[3], w_anode1020w[3], w_anode1010w[3], w_anode1000w[3], w_anode990w[3], w_anode980w[3], w_anode970w[3], w_anode959w[3]}, {w_anode936w[3], w_anode926w[3], w_anode916w[3], w_anode906w[3], w_anode896w[3], w_anode886w[3], w_anode876w[3], w_anode865w[3]}, {w_anode842w[3], w_anode832w[3], w_anode822w[3], w_anode812w[3], w_anode802w[3], w_anode792w[3], w_anode782w[3], w_anode771w[3]}, {w_anode748w[3], w_anode738w[3], w_anode728w[3], w_anode718w[3], w_anode708w[3], w_anode698w[3], w_anode688w[3], w_anode677w[3]}, {w_anode654w[3], w_anode644w[3], w_anode634w[3], w_anode624w[3], w_anode614w[3], w_anode604w[3], w_anode594w[3], w_anode583w[3]}, {w_anode559w[3], w_anode549w[3], w_anode539w[3], w_anode529w[3], w_anode519w[3], w_anode509w[3], w_anode499w[3], w_anode482w[3]}},
		w_anode1000w = {(w_anode1000w[2] & w_data462w[2]), (w_anode1000w[1] & (~ w_data462w[1])), (w_anode1000w[0] & (~ w_data462w[0])), w_anode947w[3]},
		w_anode1010w = {(w_anode1010w[2] & w_data462w[2]), (w_anode1010w[1] & (~ w_data462w[1])), (w_anode1010w[0] & w_data462w[0]), w_anode947w[3]},
		w_anode1020w = {(w_anode1020w[2] & w_data462w[2]), (w_anode1020w[1] & w_data462w[1]), (w_anode1020w[0] & (~ w_data462w[0])), w_anode947w[3]},
		w_anode1030w = {(w_anode1030w[2] & w_data462w[2]), (w_anode1030w[1] & w_data462w[1]), (w_anode1030w[0] & w_data462w[0]), w_anode947w[3]},
		w_anode1041w = {(w_anode1041w[2] & data_wire[5]), (w_anode1041w[1] & data_wire[4]), (w_anode1041w[0] & (~ data_wire[3])), 1'b1},
		w_anode1053w = {(w_anode1053w[2] & (~ w_data462w[2])), (w_anode1053w[1] & (~ w_data462w[1])), (w_anode1053w[0] & (~ w_data462w[0])), w_anode1041w[3]},
		w_anode1064w = {(w_anode1064w[2] & (~ w_data462w[2])), (w_anode1064w[1] & (~ w_data462w[1])), (w_anode1064w[0] & w_data462w[0]), w_anode1041w[3]},
		w_anode1074w = {(w_anode1074w[2] & (~ w_data462w[2])), (w_anode1074w[1] & w_data462w[1]), (w_anode1074w[0] & (~ w_data462w[0])), w_anode1041w[3]},
		w_anode1084w = {(w_anode1084w[2] & (~ w_data462w[2])), (w_anode1084w[1] & w_data462w[1]), (w_anode1084w[0] & w_data462w[0]), w_anode1041w[3]},
		w_anode1094w = {(w_anode1094w[2] & w_data462w[2]), (w_anode1094w[1] & (~ w_data462w[1])), (w_anode1094w[0] & (~ w_data462w[0])), w_anode1041w[3]},
		w_anode1104w = {(w_anode1104w[2] & w_data462w[2]), (w_anode1104w[1] & (~ w_data462w[1])), (w_anode1104w[0] & w_data462w[0]), w_anode1041w[3]},
		w_anode1114w = {(w_anode1114w[2] & w_data462w[2]), (w_anode1114w[1] & w_data462w[1]), (w_anode1114w[0] & (~ w_data462w[0])), w_anode1041w[3]},
		w_anode1124w = {(w_anode1124w[2] & w_data462w[2]), (w_anode1124w[1] & w_data462w[1]), (w_anode1124w[0] & w_data462w[0]), w_anode1041w[3]},
		w_anode1135w = {(w_anode1135w[2] & data_wire[5]), (w_anode1135w[1] & data_wire[4]), (w_anode1135w[0] & data_wire[3]), 1'b1},
		w_anode1147w = {(w_anode1147w[2] & (~ w_data462w[2])), (w_anode1147w[1] & (~ w_data462w[1])), (w_anode1147w[0] & (~ w_data462w[0])), w_anode1135w[3]},
		w_anode1158w = {(w_anode1158w[2] & (~ w_data462w[2])), (w_anode1158w[1] & (~ w_data462w[1])), (w_anode1158w[0] & w_data462w[0]), w_anode1135w[3]},
		w_anode1168w = {(w_anode1168w[2] & (~ w_data462w[2])), (w_anode1168w[1] & w_data462w[1]), (w_anode1168w[0] & (~ w_data462w[0])), w_anode1135w[3]},
		w_anode1178w = {(w_anode1178w[2] & (~ w_data462w[2])), (w_anode1178w[1] & w_data462w[1]), (w_anode1178w[0] & w_data462w[0]), w_anode1135w[3]},
		w_anode1188w = {(w_anode1188w[2] & w_data462w[2]), (w_anode1188w[1] & (~ w_data462w[1])), (w_anode1188w[0] & (~ w_data462w[0])), w_anode1135w[3]},
		w_anode1198w = {(w_anode1198w[2] & w_data462w[2]), (w_anode1198w[1] & (~ w_data462w[1])), (w_anode1198w[0] & w_data462w[0]), w_anode1135w[3]},
		w_anode1208w = {(w_anode1208w[2] & w_data462w[2]), (w_anode1208w[1] & w_data462w[1]), (w_anode1208w[0] & (~ w_data462w[0])), w_anode1135w[3]},
		w_anode1218w = {(w_anode1218w[2] & w_data462w[2]), (w_anode1218w[1] & w_data462w[1]), (w_anode1218w[0] & w_data462w[0]), w_anode1135w[3]},
		w_anode464w = {(w_anode464w[2] & (~ data_wire[5])), (w_anode464w[1] & (~ data_wire[4])), (w_anode464w[0] & (~ data_wire[3])), 1'b1},
		w_anode482w = {(w_anode482w[2] & (~ w_data462w[2])), (w_anode482w[1] & (~ w_data462w[1])), (w_anode482w[0] & (~ w_data462w[0])), w_anode464w[3]},
		w_anode499w = {(w_anode499w[2] & (~ w_data462w[2])), (w_anode499w[1] & (~ w_data462w[1])), (w_anode499w[0] & w_data462w[0]), w_anode464w[3]},
		w_anode509w = {(w_anode509w[2] & (~ w_data462w[2])), (w_anode509w[1] & w_data462w[1]), (w_anode509w[0] & (~ w_data462w[0])), w_anode464w[3]},
		w_anode519w = {(w_anode519w[2] & (~ w_data462w[2])), (w_anode519w[1] & w_data462w[1]), (w_anode519w[0] & w_data462w[0]), w_anode464w[3]},
		w_anode529w = {(w_anode529w[2] & w_data462w[2]), (w_anode529w[1] & (~ w_data462w[1])), (w_anode529w[0] & (~ w_data462w[0])), w_anode464w[3]},
		w_anode539w = {(w_anode539w[2] & w_data462w[2]), (w_anode539w[1] & (~ w_data462w[1])), (w_anode539w[0] & w_data462w[0]), w_anode464w[3]},
		w_anode549w = {(w_anode549w[2] & w_data462w[2]), (w_anode549w[1] & w_data462w[1]), (w_anode549w[0] & (~ w_data462w[0])), w_anode464w[3]},
		w_anode559w = {(w_anode559w[2] & w_data462w[2]), (w_anode559w[1] & w_data462w[1]), (w_anode559w[0] & w_data462w[0]), w_anode464w[3]},
		w_anode571w = {(w_anode571w[2] & (~ data_wire[5])), (w_anode571w[1] & (~ data_wire[4])), (w_anode571w[0] & data_wire[3]), 1'b1},
		w_anode583w = {(w_anode583w[2] & (~ w_data462w[2])), (w_anode583w[1] & (~ w_data462w[1])), (w_anode583w[0] & (~ w_data462w[0])), w_anode571w[3]},
		w_anode594w = {(w_anode594w[2] & (~ w_data462w[2])), (w_anode594w[1] & (~ w_data462w[1])), (w_anode594w[0] & w_data462w[0]), w_anode571w[3]},
		w_anode604w = {(w_anode604w[2] & (~ w_data462w[2])), (w_anode604w[1] & w_data462w[1]), (w_anode604w[0] & (~ w_data462w[0])), w_anode571w[3]},
		w_anode614w = {(w_anode614w[2] & (~ w_data462w[2])), (w_anode614w[1] & w_data462w[1]), (w_anode614w[0] & w_data462w[0]), w_anode571w[3]},
		w_anode624w = {(w_anode624w[2] & w_data462w[2]), (w_anode624w[1] & (~ w_data462w[1])), (w_anode624w[0] & (~ w_data462w[0])), w_anode571w[3]},
		w_anode634w = {(w_anode634w[2] & w_data462w[2]), (w_anode634w[1] & (~ w_data462w[1])), (w_anode634w[0] & w_data462w[0]), w_anode571w[3]},
		w_anode644w = {(w_anode644w[2] & w_data462w[2]), (w_anode644w[1] & w_data462w[1]), (w_anode644w[0] & (~ w_data462w[0])), w_anode571w[3]},
		w_anode654w = {(w_anode654w[2] & w_data462w[2]), (w_anode654w[1] & w_data462w[1]), (w_anode654w[0] & w_data462w[0]), w_anode571w[3]},
		w_anode665w = {(w_anode665w[2] & (~ data_wire[5])), (w_anode665w[1] & data_wire[4]), (w_anode665w[0] & (~ data_wire[3])), 1'b1},
		w_anode677w = {(w_anode677w[2] & (~ w_data462w[2])), (w_anode677w[1] & (~ w_data462w[1])), (w_anode677w[0] & (~ w_data462w[0])), w_anode665w[3]},
		w_anode688w = {(w_anode688w[2] & (~ w_data462w[2])), (w_anode688w[1] & (~ w_data462w[1])), (w_anode688w[0] & w_data462w[0]), w_anode665w[3]},
		w_anode698w = {(w_anode698w[2] & (~ w_data462w[2])), (w_anode698w[1] & w_data462w[1]), (w_anode698w[0] & (~ w_data462w[0])), w_anode665w[3]},
		w_anode708w = {(w_anode708w[2] & (~ w_data462w[2])), (w_anode708w[1] & w_data462w[1]), (w_anode708w[0] & w_data462w[0]), w_anode665w[3]},
		w_anode718w = {(w_anode718w[2] & w_data462w[2]), (w_anode718w[1] & (~ w_data462w[1])), (w_anode718w[0] & (~ w_data462w[0])), w_anode665w[3]},
		w_anode728w = {(w_anode728w[2] & w_data462w[2]), (w_anode728w[1] & (~ w_data462w[1])), (w_anode728w[0] & w_data462w[0]), w_anode665w[3]},
		w_anode738w = {(w_anode738w[2] & w_data462w[2]), (w_anode738w[1] & w_data462w[1]), (w_anode738w[0] & (~ w_data462w[0])), w_anode665w[3]},
		w_anode748w = {(w_anode748w[2] & w_data462w[2]), (w_anode748w[1] & w_data462w[1]), (w_anode748w[0] & w_data462w[0]), w_anode665w[3]},
		w_anode759w = {(w_anode759w[2] & (~ data_wire[5])), (w_anode759w[1] & data_wire[4]), (w_anode759w[0] & data_wire[3]), 1'b1},
		w_anode771w = {(w_anode771w[2] & (~ w_data462w[2])), (w_anode771w[1] & (~ w_data462w[1])), (w_anode771w[0] & (~ w_data462w[0])), w_anode759w[3]},
		w_anode782w = {(w_anode782w[2] & (~ w_data462w[2])), (w_anode782w[1] & (~ w_data462w[1])), (w_anode782w[0] & w_data462w[0]), w_anode759w[3]},
		w_anode792w = {(w_anode792w[2] & (~ w_data462w[2])), (w_anode792w[1] & w_data462w[1]), (w_anode792w[0] & (~ w_data462w[0])), w_anode759w[3]},
		w_anode802w = {(w_anode802w[2] & (~ w_data462w[2])), (w_anode802w[1] & w_data462w[1]), (w_anode802w[0] & w_data462w[0]), w_anode759w[3]},
		w_anode812w = {(w_anode812w[2] & w_data462w[2]), (w_anode812w[1] & (~ w_data462w[1])), (w_anode812w[0] & (~ w_data462w[0])), w_anode759w[3]},
		w_anode822w = {(w_anode822w[2] & w_data462w[2]), (w_anode822w[1] & (~ w_data462w[1])), (w_anode822w[0] & w_data462w[0]), w_anode759w[3]},
		w_anode832w = {(w_anode832w[2] & w_data462w[2]), (w_anode832w[1] & w_data462w[1]), (w_anode832w[0] & (~ w_data462w[0])), w_anode759w[3]},
		w_anode842w = {(w_anode842w[2] & w_data462w[2]), (w_anode842w[1] & w_data462w[1]), (w_anode842w[0] & w_data462w[0]), w_anode759w[3]},
		w_anode853w = {(w_anode853w[2] & data_wire[5]), (w_anode853w[1] & (~ data_wire[4])), (w_anode853w[0] & (~ data_wire[3])), 1'b1},
		w_anode865w = {(w_anode865w[2] & (~ w_data462w[2])), (w_anode865w[1] & (~ w_data462w[1])), (w_anode865w[0] & (~ w_data462w[0])), w_anode853w[3]},
		w_anode876w = {(w_anode876w[2] & (~ w_data462w[2])), (w_anode876w[1] & (~ w_data462w[1])), (w_anode876w[0] & w_data462w[0]), w_anode853w[3]},
		w_anode886w = {(w_anode886w[2] & (~ w_data462w[2])), (w_anode886w[1] & w_data462w[1]), (w_anode886w[0] & (~ w_data462w[0])), w_anode853w[3]},
		w_anode896w = {(w_anode896w[2] & (~ w_data462w[2])), (w_anode896w[1] & w_data462w[1]), (w_anode896w[0] & w_data462w[0]), w_anode853w[3]},
		w_anode906w = {(w_anode906w[2] & w_data462w[2]), (w_anode906w[1] & (~ w_data462w[1])), (w_anode906w[0] & (~ w_data462w[0])), w_anode853w[3]},
		w_anode916w = {(w_anode916w[2] & w_data462w[2]), (w_anode916w[1] & (~ w_data462w[1])), (w_anode916w[0] & w_data462w[0]), w_anode853w[3]},
		w_anode926w = {(w_anode926w[2] & w_data462w[2]), (w_anode926w[1] & w_data462w[1]), (w_anode926w[0] & (~ w_data462w[0])), w_anode853w[3]},
		w_anode936w = {(w_anode936w[2] & w_data462w[2]), (w_anode936w[1] & w_data462w[1]), (w_anode936w[0] & w_data462w[0]), w_anode853w[3]},
		w_anode947w = {(w_anode947w[2] & data_wire[5]), (w_anode947w[1] & (~ data_wire[4])), (w_anode947w[0] & data_wire[3]), 1'b1},
		w_anode959w = {(w_anode959w[2] & (~ w_data462w[2])), (w_anode959w[1] & (~ w_data462w[1])), (w_anode959w[0] & (~ w_data462w[0])), w_anode947w[3]},
		w_anode970w = {(w_anode970w[2] & (~ w_data462w[2])), (w_anode970w[1] & (~ w_data462w[1])), (w_anode970w[0] & w_data462w[0]), w_anode947w[3]},
		w_anode980w = {(w_anode980w[2] & (~ w_data462w[2])), (w_anode980w[1] & w_data462w[1]), (w_anode980w[0] & (~ w_data462w[0])), w_anode947w[3]},
		w_anode990w = {(w_anode990w[2] & (~ w_data462w[2])), (w_anode990w[1] & w_data462w[1]), (w_anode990w[0] & w_data462w[0]), w_anode947w[3]},
		w_data462w = data_wire[2:0];
endmodule