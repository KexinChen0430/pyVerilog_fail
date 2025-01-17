module uparc_ifu(
	clk,
	nrst,
	/* Internal signals */
	addr,
	instr_dat,
	rd_cmd,
	busy,
	err_align,
	err_bus,
	/* I-Bus */
	o_IAddr,
	o_IRdC,
	i_IData,
	i_IRdy,
	i_IErr
);
/* I-Bus FSM states */
localparam IDLE = 1'b0;		/* Ready to accept response */
localparam WAIT = 1'b1;		/* Wait for response */
/* Inputs */
input wire				clk;
input wire				nrst;
/* Internal CPU interface */
input wire [`UPARC_ADDR_WIDTH-1:0]	addr;
output wire [`UPARC_INSTR_WIDTH-1:0]	instr_dat;
input wire				rd_cmd;
output wire				busy;
output wire				err_align;
output wire				err_bus;
/* I-Bus interface */
output reg [`UPARC_ADDR_WIDTH-1:0]	o_IAddr;
output reg				o_IRdC;
input wire [`UPARC_INSTR_WIDTH-1:0]	i_IData;
input wire				i_IRdy;
input wire				i_IErr;
/* Address alignment error */
assign err_align = (rd_cmd == 1'b1 && addr[1:0] != 2'b0);
/* Active IFU transfer */
wire active = (!err_align && !i_IErr && rd_cmd == 1'b1);
/* Busy IFU state */
assign busy = ((active || (state == WAIT)) && !i_IRdy);
assign err_bus = i_IErr;	/* Bus error occurred */
/* Transfer start logic */
always @(*)
begin
	o_IAddr = 32'b0;
	o_IRdC = 1'b0;
	/* Issue command to I-Bus if no error */
	if(active)
	begin
		o_IAddr = addr;
		o_IRdC = 1'b1;
	end
end
reg [`UPARC_INSTR_WIDTH-1:0]	lch_idata;	/* Latched instruction data */
reg				state;		/* Instruction fetch FSM state */
/* I-Bus response wait FSM */
always @(posedge clk or negedge nrst)
begin
	if(!nrst)
	begin
		state <= IDLE;
		lch_idata <= {(`UPARC_INSTR_WIDTH){1'b0}};
	end
	else
	begin
		if(state == IDLE && (active && i_IRdy))
		begin
			lch_idata <= i_IData;
		end
		else if(state == IDLE && (active && !i_IRdy))
		begin
			state <= !i_IErr ? WAIT : IDLE;
		end
		else if(state == WAIT && i_IRdy)
		begin
			state <= IDLE;
			lch_idata <= i_IData;
		end
	end
end
/* Output logic */
assign instr_dat = (active || state == WAIT) ? i_IData : lch_idata;
endmodule