module interval_timer(
	clk,
	nrst,
	/* Interrupt output */
	o_intr,
	/* OCP interface */
	i_MAddr,
	i_MCmd,
	i_MData,
	i_MByteEn,
	o_SCmdAccept,
	o_SData,
	o_SResp
);
/* Timer counter states */
localparam [2:0] STOP   = 3'b001;
localparam [2:0] RELOAD = 3'b010;
localparam [2:0] COUNT  = 3'b100;
/* Register offsets */
localparam [`ADDR_WIDTH-1:0] CTRLREG = 32'h000;	/* Control register */
localparam [`ADDR_WIDTH-1:0] CNTRREG = 32'h004;	/* Counter register */
localparam [`ADDR_WIDTH-1:0] CURRREG = 32'h008;	/* Current counter */
/* Inputs and outputs */
input wire			clk;
input wire			nrst;
output reg			o_intr;
input wire [`ADDR_WIDTH-1:0]	i_MAddr;
input wire [2:0]		i_MCmd;
input wire [`DATA_WIDTH-1:0]	i_MData;
input wire [`BEN_WIDTH-1:0]	i_MByteEn;
output wire			o_SCmdAccept;
output reg [`DATA_WIDTH-1:0]	o_SData;
output reg [1:0]		o_SResp;
/* Internal registers */
reg [`DATA_WIDTH-1:0] initval;	/* Initial value */
reg [`DATA_WIDTH-1:0] currval;	/* Current value */
reg enable;			/* Timer enabled */
reg imask;			/* Interrupt mask */
reg reload;			/* Reload counter automatically */
/* Counter FSM state */
reg [2:0] ctr_state;
reg reload_en;		/* Force counter reload */
assign o_SCmdAccept = 1'b1;	/* Always ready to accept command */
/* Bus logic */
always @(*)
begin
	case(i_MCmd)
	`OCP_CMD_WRITE: begin
		o_SData = {(`DATA_WIDTH){1'b0}};
		o_SResp = `OCP_RESP_DVA;
	end
	`OCP_CMD_READ: begin
		if(i_MAddr == CTRLREG)
		begin
			o_SData = { {(`DATA_WIDTH-3){1'b0}},
				reload, imask, enable };
		end
		else if(i_MAddr == CNTRREG)
		begin
			o_SData = { {(`DATA_WIDTH-32){1'b0}}, initval };
		end
		else if(i_MAddr == CURRREG)
		begin
			o_SData = { {(`DATA_WIDTH-32){1'b0}}, currval };
		end
		else
			o_SData = 32'hDEADDEAD;
		o_SResp = `OCP_RESP_DVA;
	end
	default: begin
		o_SData = {(`DATA_WIDTH){1'b0}};
		o_SResp = `OCP_RESP_NULL;
	end
	endcase
end
/* Configuration update */
always @(posedge clk or negedge nrst)
begin
	if(!nrst)
	begin
		enable <= 1'b0;
		imask <= 1'b0;
		initval <= {(`DATA_WIDTH){1'b0}};
		reload <= 1'b0;
		reload_en <= 1'b0;
	end
	else if(i_MCmd == `OCP_CMD_WRITE)
	begin
		/* Force reload if updating initial count value */
		reload_en <= i_MAddr == CNTRREG ? 1'b1 : 1'b0;
		if(i_MAddr == CTRLREG)
		begin
			enable <= i_MData[0];
			imask <= i_MData[1];
			reload <= i_MData[2];
		end
		else if(i_MAddr == CNTRREG)
		begin
			initval <= i_MData[31:0];
		end
	end
	else
		reload_en <= 1'b0;
end
/* Counter FSM */
always @(posedge clk or negedge nrst)
begin
	if(!nrst)
	begin
		currval <= 0;
		o_intr <= 1'b0;
		ctr_state <= STOP;
	end
	else if(reload_en)
	begin
		/* Update current value and restart timer */
		currval <= initval;
		ctr_state <= STOP;
	end
	else
	begin
		case(ctr_state)
		STOP: begin
			o_intr <= 1'b0;
			if(enable)
				ctr_state <= COUNT;
		end
		COUNT: begin
			if(currval == 0)
				o_intr <= 1'b1 & imask; /* Set interrupt */
			else
				currval <= currval - 1;
			/* After zero reached next state depends on reload flag */
			ctr_state <= enable ?
				(currval == 0 ?
				(reload ? RELOAD : STOP) : COUNT) : STOP;
		end
		RELOAD: begin
			o_intr <= 1'b0;
			currval <= initval - 1;
			ctr_state <= enable ? COUNT : STOP;
		end
		default: ctr_state <= STOP;
		endcase
	end
end
endmodule