module pipe_stall_ctrl(
		       input wire [5:0] op_1_i,
		       input wire 	alu_rrr_op_1_i,
		       input wire 	alu_rri_op_1_i,
		       input wire 	load_op_2_i,
		       input wire [4:0] rd_n_1_i,
		       input wire [4:0] rs1_n_1_i,
		       input wire [4:0] rs2_n_1_i,
		       input wire [4:0] rd_n_2_i,
		       output reg 	stall_o);
	reg 				stall_t_1, stall_t_2;
	// Type 1 stall management
	always @(*) begin
		stall_t_1  = 1'b0;
		if (load_op_2_i) begin
			// Load instruction in EX
			if (alu_rrr_op_1_i && // RRR ALU inst
			    (rd_n_2_i == rs1_n_1_i || rd_n_2_i == rs2_n_1_i))
				stall_t_1 = 1'b1; // insert stall
			else if (alu_rri_op_1_i && // RRI ALU inst
				 rd_n_2_i == rs1_n_1_i)
				stall_t_1 = 1'b1; // insert stall
		end
	end
	// Type 2 stall management
	always @(*) begin
		stall_t_2  = 1'h0;
		if (load_op_2_i) begin
			case (op_1_i)
				`LDW_OP, `LDH_OP, `LDHU_OP, `LDB_OP,
				`LDBU_OP, `MOV_OP: begin // LD MOV
					if (rd_n_2_i == rs1_n_1_i)
						stall_t_2 = 1'b1; //  stall
				end
				`STW_OP, `STH_OP, `STHU_OP, `STB_OP,
				`STBU_OP: begin // ST
					if (rd_n_2_i == rd_n_1_i ||
					    rd_n_2_i == rs1_n_1_i)
						stall_t_2 = 1'b1; //  stall
					end
				`STAW_OP: begin // STAW
					if (rd_n_2_i == rd_n_1_i)
						stall_t_2 = 1'b1; //  stall
				end
			endcase
		end
	end
	always @(*)
		stall_o  = stall_t_1 || stall_t_2;
endmodule