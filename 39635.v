module if_id(
	     input wire          clk_i,
	     input               hold_i,
	     input               rst_i,
	     input               int_enable_i,
	     input               io_int_i,
             input               inv_op_int_i,
	     input               st_ovr_int_i,
	     input wire [`N-1:0] ir_i,
	     output reg [`N-1:0] ir_o,
	     input               debug_i,
	     output              debug_o);
	initial begin
		ir_o <= (`NOP_OP << 26);
	end
	always @(posedge clk_i) begin
		if (rst_i)
			ir_o <= #1 (`NOP_OP << 26);
		else if (io_int_i && int_enable_i)
			ir_o <= #1 (`INT_OP << 26) | (`IO_INT_VADDR >> 2);
                else if (inv_op_int_i)
                        ir_o <= #1 (`INT_OP << 26) | (`INVALID_OP_INT_VADDR >> 2);
		else if (st_ovr_int_i)
			ir_o <= #1 (`INT_OP << 26) | (`STORE_INT_VADDR >> 2);
		else if (hold_i)
			ir_o <= #1 ir_o;
		     else
			     ir_o <= #1 ir_i;
	end
	nr_ff reg_wr(.clk_i(clk_i),
		     .in(debug_i),
		     .out(debug_o),
		     .hold_i(hold_i),
		     .rst_i(rst_i));
endmodule