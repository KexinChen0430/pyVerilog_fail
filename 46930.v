module Event_Queue #(parameter data_wd=32,q_add_wd=5,q_max_len=32,hi = 15,lo = 0)
				(
				input [data_wd-1:0] EV_in,			// input entry
				input op,							// desired opereatoin, could be read or write
				input cs,							// chip select
				input rst,							// reset signal
				input clk,							// clock
				output wire [data_wd-1:0] EV_out,	// output entry
				output wire dv,						// data valid of output entry EV_out
				output wire full,					// full signal indication
				output wire empty,					// empty signal indication
				output wire busy_for_rd,			// when raised read operation can't be performed
				output wire busy_for_wr,			// when raised write operation can't be performed
				output wire [q_add_wd-1:0] length	// current number of elements in EQ
				);
`define Q0_IDX 1'b0
`define Q1_IDX 1'b1
`define Q_num		2 // number of Qs connected to "compare window"
`define Q_num_wd	1 //set to be log2(Q_num)
// declarations //
reg [`Q_num-1:0]		cs_bus;
//Qs status indication signals
wire [`Q_num-1:0]	full_bus;
wire [`Q_num-1:0]	empty_bus;
wire [`Q_num-1:0]	busy_bus;
wire [`Q_num-1:0]	dv_bus;
wire [`Q_num_wd-1:0]insert_Q_idx, 	//chosen insert Q index
					extract_Q_idx; 	//chosen extract Q idx
wire [data_wd-1: 0]	EV_out_bus [`Q_num-1:0];
wire [q_add_wd-1:0]	len_bus [`Q_num-1:0];
wire [q_add_wd-1:0]	insert_Q_len;
wire 				extract_Q_dv,					//chosen extract Q dv
					dv_in_all_Qs,
					at_least_one_Q_busy;
reg extract_Q_busy;
// inner logic implementation //
assign length		= len_bus[0] + len_bus[1];
assign full			= (q_max_len == len_bus[0] + len_bus[1]);
assign empty		= empty_bus[0]	&& empty_bus[1];
assign busy_for_wr	= busy_bus[0]		&& busy_bus[1];
assign busy_for_rd	= dv_in_all_Qs ? extract_Q_busy : at_least_one_Q_busy;
assign dv			= extract_Q_dv;
// Q select DECODER
always @(*) begin
	if(cs && op == `INSERT_CMD) begin
		case (insert_Q_idx)
			`Q_num_wd'd0:	cs_bus = `Q_num'b01;
			`Q_num_wd'd1:	cs_bus = `Q_num'b10;
			default:		cs_bus = `Q_num'b00;
		endcase
	end
	else if (cs && op == `EXTRACT_CMD) begin
		case (extract_Q_idx)
			`Q_num_wd'd0:	cs_bus = `Q_num'b01;
			`Q_num_wd'd1:	cs_bus = `Q_num'b10;
			default:		cs_bus = `Q_num'b00;
		endcase
	end
	else begin
		cs_bus = `Q_num'b00;
	end
end
// busy for read control mechanism
always @ (*) begin
	case(extract_Q_idx)
	`Q0_IDX: extract_Q_busy = busy_bus[0];
	`Q1_IDX: extract_Q_busy = busy_bus[1];
	default: extract_Q_busy = `FALSE;
	endcase
end
assign dv_in_all_Qs = dv_bus[0] && dv_bus[1];
assign at_least_one_Q_busy = busy_bus[0] || busy_bus[1];
// 						modules instantiation 						 //
// insertion mechanizm //
// current event would be inserted into Q with minimal number of elements (minimal length)
comperator_2 #(.data_wd(q_add_wd),.idx_wd(`Q_num_wd),.hi(q_add_wd-1),.lo(0))
insert_cmp0(
	.c_dat	(insert_Q_len),
	.c_idx	(insert_Q_idx),
	.c_dv	(insert_Q_dv),
	.d0		(len_bus[0]),
	.d0_idx	(`Q0_IDX),
	.d0_dv	(!full_bus[0] && !busy_bus[0]),
	.d1		(len_bus[1]),
	.d1_idx	(`Q1_IDX),
	.d1_dv	(!full_bus[1] && !busy_bus[1]),
	.great_n_small(`FALSE)
	);
// extraction mechanism //
//next event will be extracted from Q with lowest EV_out
comperator_2 #(.data_wd(data_wd),.idx_wd(`Q_num_wd),.hi(hi),.lo(lo))
extract_cmp0(
	.c_dat	(EV_out),
	.c_idx	(extract_Q_idx),
	.c_dv	(extract_Q_dv),
	.d0		(EV_out_bus[0]),
	.d0_idx	(`Q0_IDX),
	.d0_dv	(dv_bus[0]),
	.d1		(EV_out_bus[1]),
	.d1_idx	(`Q1_IDX),
	.d1_dv	(dv_bus[1]),
	.great_n_small(`FALSE)
	);
// Qs instantiation //
Queue #(.data_wd(data_wd),
		.q_add_wd(q_add_wd-1),
		.q_max_len((q_max_len+`Q_num-1)/`Q_num),
		.hi(hi),
		.lo(lo)
		)
q0(
	.EV_in(EV_in),
	.op(op),
	.cs(cs_bus[0]),
	.rst(rst),
	.clk(clk),
	.EV_out(EV_out_bus[0]),
	.dv(dv_bus[0]),
	.full(full_bus[0]),
	.empty(empty_bus[0]),
	.busy(busy_bus[0]),
	.length(len_bus[0])
	);
Queue #(.data_wd(data_wd),
		.q_add_wd(q_add_wd-1),
		.q_max_len((q_max_len+`Q_num-1)/`Q_num),
		.hi(hi),
		.lo(lo)
		)
q1(
	.EV_in(EV_in),
	.op(op),
	.cs(cs_bus[1]),
	.rst(rst),
	.clk(clk),
	.EV_out(EV_out_bus[1]),
	.dv(dv_bus[1]),
	.full(full_bus[1]),
	.empty(empty_bus[1]),
	.busy(busy_bus[1]),
	.length(len_bus[1])
	);
endmodule