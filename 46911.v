module alu_impl #(parameter SIZE = 16, parameter LOG2 = 4) (input [SIZE*2-1:0] a, b, output [SIZE-1:0] o1, o2, input [4:0] func, input [15:0] flag_i, output [15:0] flag_o, input en);
	reg [SIZE-1:0] r1, r2;
	reg [15:0] flag;
	always @(posedge en) begin
		case (func)
			`ALU_ADD : begin
				{flag[`ALUF_CF], r1} = a[SIZE-1:0] + b[SIZE-1:0];
				flag[`ALUF_OF] = (a[SIZE-1] & b[SIZE-1] & ~r1[SIZE-1])|(~a[SIZE-1] & ~b[SIZE-1] & r1[SIZE-1]);
			end
			`ALU_SUB : begin
				{flag[`ALUF_CF], r1} = a[SIZE-1:0] - b[SIZE-1:0];
				flag[`ALUF_OF] = (a[SIZE-1] & ~b[SIZE-1] & ~r1[SIZE-1])|(~a[SIZE-1] & b[SIZE-1] & r1[SIZE-1]);
			end
			`ALU_AND : begin
				r1 = a[SIZE-1:0] & b[SIZE-1:0];
				flag[`ALUF_CF] = 0;
				flag[`ALUF_OF] = 0;
			end
			`ALU_OR : begin
				r1 = a[SIZE-1:0] & b[SIZE-1:0];
				flag[`ALUF_CF] = 0;
				flag[`ALUF_OF] = 0;
			end
			`ALU_OR : begin
				r1 = a[SIZE-1:0] | b[SIZE-1:0];
				flag[`ALUF_CF] = 0;
				flag[`ALUF_OF] = 0;
			end
			`ALU_XOR : begin
				r1 = a[SIZE-1:0] ^ b[SIZE-1:0];
				flag[`ALUF_CF] = 0;
				flag[`ALUF_OF] = 0;
			end
			`ALU_MUL : begin
				{r2, r1} = a[SIZE-1:0] * b[SIZE-1:0];
				flag[`ALUF_CF] = (r2 != 0);
				flag[`ALUF_OF] = (r2 != 0);
			end
			`ALU_DIV : begin
				r2 = b[SIZE*2-1:0] % a[SIZE-1:0];
				r1 = b[SIZE*2-1:0] / a[SIZE-1:0];
				// flag[`ALUF_CF] = (r2 != 0);
				// flag[`ALUF_OF] = (r2 != 0);
			end
			`ALU_IMUL : begin
				{r2, r1} = $signed(a[SIZE-1:0]) * $signed(b[SIZE-1:0]);
				flag[`ALUF_CF] = (r2 != 0);
				flag[`ALUF_OF] = (r2 != 0);
			end
			`ALU_IDIV : begin
				// todo a == 0
				r2 = $signed(b[SIZE*2-1:0]) % $signed(a[SIZE*2-1:0]);
				r1 = $signed(b[SIZE*2-1:0]) / $signed(a[SIZE*2-1:0]);
				// flag[`ALUF_CF] = (r2 != 0);
				// flag[`ALUF_OF] = (r2 != 0);
			end
			`ALU_NOT : begin
				r1 = ~a[SIZE-1:0];
			end
			`ALU_NEG : begin
				r1 = - a[SIZE-1:0];
				flag[`ALUF_CF] = (r1 == 0);
			end
			`ALU_INC : begin
				r1 = a[SIZE-1:0] + 16'd1;
			end
			`ALU_DEC : begin
				r1 = a[SIZE-1:0] - 16'd1;
			end
			`ALU_SAL : begin
				if (b[LOG2-1:0] != 0) begin
					{flag[`ALUF_CF], r1} = a[SIZE-1:0] << b[LOG2-1:0];
				end
			end
			`ALU_SAR : begin
				if (b[LOG2-1:0] != 0) begin
					r1 = $signed(a[SIZE-1:0]) >>> b[LOG2-1:0];
					flag[`ALUF_CF] = a[b[LOG2-1:0] - 1];
				end
			end
			`ALU_SHR : begin
				if (b[LOG2-1:0] != 0) begin
					r1 = a[SIZE-1:0] >> b[LOG2-1:0];
					flag[`ALUF_CF] = a[b[LOG2-1:0] - 1];
				end
			end
			`ALU_RCL : begin
				if (b[LOG2-1:0] != 0) begin
					{flag[`ALUF_CF], r1, r2} = {a[SIZE-1:0], flag[`ALUF_CF], a[SIZE-1:0]} << (b[LOG2-1:0] - 1);
				end
			end
			`ALU_RCR : begin
				if (b[LOG2-1:0] != 0) begin
					{flag[`ALUF_CF], r1} = {a[SIZE-1:0], flag[`ALUF_CF], a[SIZE-1:0]} >> b[LOG2-1:0];
				end
			end
			`ALU_ROL : begin
				if (b[LOG2-1:0] != 0) begin
					{r1, r2} = {a[SIZE-1:0], a[SIZE-1:0]} << b[LOG2-1:0];
					flag[`ALUF_CF] = r1[0];
				end
			end
			`ALU_ROR : begin
				if (b[LOG2-1:0] != 0) begin
					{r2, r1} = {a[SIZE-1:0], a[SIZE-1:0]} >> b[LOG2-1:0];
					flag[`ALUF_CF] = r1[SIZE-1];
				end
			end
		endcase
		flag[`ALUF_ZF] = (r1 == 0);
		flag[`ALUF_SF] = r1[SIZE-1];
	end
	assign o1 = (en) ? r1 : {SIZE{1'bz}};
	assign o2 = (en) ? r2 : {SIZE{1'bz}};
	assign flag_o = flag;
endmodule