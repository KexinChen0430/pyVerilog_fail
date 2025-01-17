module to external system
);
	//// BEGIN Wire declarations made by MVP
	//wire [`M14K_UDI_EXT_FROMUDI_WIDTH-1:0] /*[0:0]*/ UDI_fromudi	;
	//// END Wire declarations made by MVP
	wire	[31:0]	udi_res				;
	wire	[1:0]	udi_ctl_sum_mode_d	;	//0- none 1- +	2- +>> 3- bypass
	wire			udi_ctl_res_sel_d	;	//1- comparing
	wire			udi_ctl_thr_wr		;	//1-	wr_thr
	wire	[1:0]	udi_ctl_sum_mode	;	//0- none 1- +	2- +>> 3- bypass
	wire			udi_ctl_res_sel		;	//1- comparing
	wire			udi_stall			;
	wire			udi_stall_1			;
	wire			udi_stall_1_d		;
	wire			udi_stall_2_d		;
	wire			udi_stall_dd		;
	localparam	UDI_MAJ_OP				=	6'd28	;	//RD = RS[31:16]^2 + RT[31:16]^2
	localparam	UDI_0					=	6'd16	;	//RD = RS[31:16]^2 + RT[31:16]^2
	localparam	UDI_1					=	6'd17	;	//RD = (RS[31:16]^2 + RT[31:16]^2) >> 1
	localparam	UDI_2					=	6'd18	;	//RD = RS[31:16]^2
	localparam	UDI_3					=	6'd19	;	//stored_threshold = RS
	localparam	UDI_4					=	6'd20	;	//RD = ( (RS[31:16]^2 + RT[31:16]^2) > stored_threshold ) ? 1 : 0
	localparam	UDI_5					=	6'd21	;	//RD = ( ((RS[31:16]^2 + RT[31:16]^2) >> 1) > stored_threshold ) ? 1 : 0
	localparam	UDI_6					=	6'd22	;	//RD = (RS[31:16]^2 > stored_threshold ) ? 1 : 0
	localparam	CTL_THR_WR_OFF			=	1'b0	;
	localparam	CTL_THR_WR_ON			=	1'b1	;
	localparam	CTL_SUM_MODE_NONE		=	2'b00	;
	localparam	CTL_SUM_MODE_SUM		=	2'b01	;
	localparam	CTL_SUM_MODE_SUMSHIFT	=	2'b10	;
	localparam	CTL_SUM_MODE_BYPASS		=	2'b11	;
	localparam	CTL_RES_CALC			=	1'b0	;
	localparam	CTL_RES_COMP			=	1'b1	;
	assign UDI_fromudi[`M14K_UDI_EXT_FROMUDI_WIDTH-1:0] = {`M14K_UDI_EXT_FROMUDI_WIDTH{1'b0}}	;
	assign UDI_ri_e	=	(UDI_irvalid_e &&		UDI_ir_e[31:26]	==	UDI_MAJ_OP	&&	UDI_ir_e[5:4]	==	2'b01	&&
							(	UDI_ir_e[5:0]	!=	UDI_0	&&
								UDI_ir_e[5:0]	!=	UDI_1	&&
								UDI_ir_e[5:0]	!=	UDI_2	&&
								UDI_ir_e[5:0]	!=	UDI_3	&&
								UDI_ir_e[5:0]	!=	UDI_4	&&
								UDI_ir_e[5:0]	!=	UDI_5	&&
								UDI_ir_e[5:0]	!=	UDI_6
							)
						)	?	1'b1	:	1'b0	;	// Illegal Spec2 Instn.
	assign UDI_present		= 1'b1		;
	assign UDI_honor_cee	= 1'b0		;
	assign UDI_rd_m			= udi_res	;
	assign UDI_wrreg_e		= (UDI_ir_e[5:0]	==	UDI_3)	?	5'd0	:	UDI_ir_e[15:11]	;
	assign	udi_ctl_thr_wr		=	(UDI_irvalid_e	&&	UDI_ir_e[31:26]	==	UDI_MAJ_OP	&&	UDI_ir_e[5:0]	==	UDI_3)	?	CTL_THR_WR_ON	:	CTL_THR_WR_OFF	;
	assign	udi_ctl_sum_mode	=	(UDI_irvalid_e	&&	UDI_ir_e[31:26]	==	UDI_MAJ_OP	&&	(UDI_ir_e[5:0]	==	UDI_0	||	UDI_ir_e[5:0]	==	UDI_4))
			?	CTL_SUM_MODE_SUM		:	(UDI_irvalid_e	&&	UDI_ir_e[31:26]	==	UDI_MAJ_OP	&&	(UDI_ir_e[5:0]	==	UDI_1	||	UDI_ir_e[5:0]	==	UDI_5))
			?	CTL_SUM_MODE_SUMSHIFT	:	(UDI_irvalid_e	&&	UDI_ir_e[31:26]	==	UDI_MAJ_OP	&&	(UDI_ir_e[5:0]	==	UDI_2	||	UDI_ir_e[5:0]	==	UDI_6))
			?	CTL_SUM_MODE_BYPASS		:	CTL_SUM_MODE_NONE	;
	assign	udi_ctl_res_sel		=	(UDI_irvalid_e	&&	UDI_ir_e[31:26]	==	UDI_MAJ_OP	&&
			(UDI_ir_e[5:0]	==	UDI_0	||	UDI_ir_e[5:0]	==	UDI_1	||	UDI_ir_e[5:0]	==	UDI_2	||	UDI_ir_e[5:0]	==	UDI_3))
			?	CTL_RES_CALC	:	CTL_RES_COMP	;
	assign UDI_stall_m	=	~UDI_kill_m	&	(udi_stall_1_d	|	udi_stall_dd)	;
	assign udi_stall_1	=	(UDI_ir_e[5:0]	==	UDI_2	||	UDI_ir_e[5:0]	==	UDI_6)	?	1'b0	:	1'b1	;
	assign udi_stall	= (UDI_irvalid_e &&		UDI_ir_e[31:26]	==	UDI_MAJ_OP	&&	UDI_ir_e[5:4]	==	2'b01	&&
							(	UDI_ir_e[5:0]	==	UDI_0	||
								UDI_ir_e[5:0]	==	UDI_1	||
								UDI_ir_e[5:0]	==	UDI_2	||
								UDI_ir_e[5:0]	==	UDI_4	||
								UDI_ir_e[5:0]	==	UDI_5	||
								UDI_ir_e[5:0]	==	UDI_6
							)
						)	?	1'b1	:	1'b0	;
	udi_inst_pow	udi_inst_pow_u(
		.gclk				(	UDI_gclk			),	//input
		.gscanenable		(	UDI_gscanenable		),	//input
		.in_rs				(	UDI_rs_e			),	//input	[31:0]
		.in_rt				(	UDI_rt_e[31:16]		),	//input	[15:0]
		.out_rd				(	udi_res				),	//output	[31:0]
		.udi_ctl_thr_wr		(	udi_ctl_thr_wr		),	//input
		.udi_ctl_sum_mode	(	udi_ctl_sum_mode_d	),	//input		[1:0]
		.udi_ctl_res_sel	(	udi_ctl_res_sel_d	)	//input
	);
	mvp_cregister_wide #(2) _udi_ctl_sum_mode_1_0_(udi_ctl_sum_mode_d,UDI_gscanenable,  (UDI_irvalid_e	&&	UDI_ir_e[31:26]	==	UDI_MAJ_OP), UDI_gclk, udi_ctl_sum_mode);
	mvp_cregister_wide #(1) _udi_ctl_res_sel_(udi_ctl_res_sel_d,UDI_gscanenable,  (UDI_irvalid_e	&&	UDI_ir_e[31:26]	==	UDI_MAJ_OP), UDI_gclk, udi_ctl_res_sel);
	mvp_register #(1) _udi_stall_0_(udi_stall_1_d, UDI_gclk, udi_stall);
	mvp_register #(1) _udi_stall_1_(udi_stall_2_d, UDI_gclk, udi_stall_1);
	mvp_register #(1) _udi_stall_2_(udi_stall_dd, UDI_gclk, udi_stall_1_d	&	udi_stall_2_d);
endmodule