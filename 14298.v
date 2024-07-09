module uparc_writeback(
	clk,
	nrst,
	/* CU signals */
	i_exec_stall,
	i_mem_stall,
	i_fetch_stall,
	i_wait_stall,
	i_nullify,
	/* Data for writeback */
	i_rd_no,
	i_rd_val,
	o_rd_no,
	o_rd_val
);
/* Inputs */
input wire				clk;
input wire				nrst;
/* CU signals */
input wire				i_exec_stall;
input wire				i_mem_stall;
input wire				i_fetch_stall;
input wire				i_wait_stall;
input wire				i_nullify;
/* Input from memory access stage */
input wire [`UPARC_REGNO_WIDTH-1:0]	i_rd_no;
input wire [`UPARC_REG_WIDTH-1:0]	i_rd_val;
/* Output for write to register file */
output reg [`UPARC_REGNO_WIDTH-1:0]	o_rd_no;
output reg [`UPARC_REG_WIDTH-1:0]	o_rd_val;
wire core_stall = i_exec_stall || i_mem_stall || i_fetch_stall || i_wait_stall;
always @(posedge clk or negedge nrst)
begin
	if(!nrst)
	begin
		o_rd_no <= {(`UPARC_REGNO_WIDTH){1'b0}};
		o_rd_val <= {(`UPARC_REG_WIDTH){1'b0}};
	end
	else if(!core_stall)
	begin
		o_rd_no <= !i_nullify ? i_rd_no : {(`UPARC_REGNO_WIDTH){1'b0}};
		o_rd_val <= i_rd_val;
	end
end
endmodule