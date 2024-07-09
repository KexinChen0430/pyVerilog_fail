module micro_uart(
	clk,
	nrst,
	/* OCP interface */
	i_MAddr,
	i_MCmd,
	i_MData,
	i_MByteEn,
	o_SCmdAccept,
	o_SData,
	o_SResp
);
/* Register offsets */
localparam [`ADDR_WIDTH-1:0] CHARREG = 32'h000;	/* Character register */
/* Inputs and outputs */
input wire			clk;
input wire			nrst;
input wire [`ADDR_WIDTH-1:0]	i_MAddr;
input wire [2:0]		i_MCmd;
input wire [`DATA_WIDTH-1:0]	i_MData;
input wire [`BEN_WIDTH-1:0]	i_MByteEn;
output wire			o_SCmdAccept;
output reg [`DATA_WIDTH-1:0]	o_SData;
output reg [1:0]		o_SResp;
assign o_SCmdAccept = 1'b1;	/* Always ready to accept command */
/* Bus logic */
always @(*)
begin
	case(i_MCmd)
	`OCP_CMD_WRITE: begin
		o_SData = { (`DATA_WIDTH){1'b0} };
		o_SResp = `OCP_RESP_DVA;
	end
	`OCP_CMD_READ: begin
		if(i_MAddr == CHARREG)
		begin
			/* Ignored. Always 0. */
			o_SData = { (`DATA_WIDTH){1'b0} };
		end
		else
			o_SData = 32'hDEADDEAD;
		o_SResp = `OCP_RESP_DVA;
	end
	default: begin
		o_SData = { (`DATA_WIDTH){1'b0} };
		o_SResp = `OCP_RESP_NULL;
	end
	endcase
end
/* Print character */
always @(posedge clk)
begin
	if(i_MCmd == `OCP_CMD_WRITE && i_MAddr == CHARREG)
	begin
		$write("%c", i_MData[7:0]);
`ifndef VERILATOR
		$fflush();	/* Verilator doesn't support it */
`endif
	end
end
endmodule