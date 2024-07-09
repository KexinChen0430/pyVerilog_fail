module stages(
	input		wire	[`REGW-1:0]	ins,
	input		wire	[`STGW-1:0]	cs,
	input		wire					zf,
	output	reg	[`REGO-1:0]	gr_raddr1, gr_raddr2, gr_waddr,
	output	reg					gr_we, pc_we, mem_we, pc_ie
);
reg	pzf;
initial gr_we	=	1'b0;
initial pc_ie	=	1'b0;
initial mem_we	=	1'b0;
initial pzf		=	1'd0;
always @(cs) begin
	/* initialize */
	pc_we	=	1'b0;
	/* FETCH stage */
	if(cs == `FETCH) begin
		gr_we	=	1'b0;
		pc_ie	=	1'b0;
		mem_we=	1'b0;
	end
	/* DECODE stage */
	if(cs == `DEC) begin
		/* calculations */
		/* 1st operand is result, 2nd & 3rd are arguments */
		if(ins[`REGW-1:`REGW-4] < `REGO'd8) begin
			gr_raddr1	=	ins[`REGW-9:`REGW-12];
			gr_raddr2	=	ins[`REGW-13:0];
			gr_waddr	=	ins[`REGW-5:`REGW-8];
			gr_we	=	1'b1;
		end
		/* not calculations */
		else begin
			case(ins[`REGW-1:`REGW-4])
				`JMP	: gr_raddr1	=	ins[`REGW-5:`REGW-8];
				`IN	: begin
					gr_waddr	=	ins[`REGW-5:`REGW-8];		// reg_addr
					gr_raddr1=	ins[`REGW-9:`REGW-12];		// mem_addr
					gr_we		=	1'b1;
				end
				`OUT	: begin
					gr_raddr1	=	ins[`REGW-5:`REGW-8];	// mem_addr
					gr_raddr2	=	ins[`REGW-9:`REGW-12];	// reg_addr
					mem_we		=	1'b1;
				end
				`IMM	: begin
					gr_waddr	=	4'h0;
					gr_we		=	1'b1;
				end
				`JZ	: begin
					gr_raddr1	=	ins[`REGW-5:`REGW-8];	// jump address
				end
				default: pc_ie = 1'b0;	// HLT
			endcase
		end
	end
	/* MEM stage */
	else if(cs == `MEM) begin
		/* calculations */
		if(ins[`REGW-1:`REGW-4] < `REGO'd8) begin
			pc_ie	=	1'b1;
			pzf = zf;
		end
		/* not calculations */
		else begin
			case(ins[`REGW-1:`REGW-4])
				`JMP	: begin
					pc_we	=	1'b1;
					pc_ie	=	1'b1;
				end
				`JZ	: begin
					if(pzf == 1'd1) begin
						pc_we	=	1'b1;
					end
					pc_ie	=	1'b1;
				end
				`IN	: pc_ie = 1'b1;
				`OUT	: pc_ie = 1'b1;
				`IMM	: pc_ie = 1'b1;
				`NOP	: pc_ie = 1'b1;
				default: pc_ie = 1'b0;	// HLT
			endcase
		end
	end
end
endmodule