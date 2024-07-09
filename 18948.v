module gci_std_display(
		//System
		input wire iCLOCK,
		input wire inRESET,
		//BUS(DATA)-Input
		input wire iDEV_REQ,
		output wire oDEV_BUSY,
		input wire iDEV_RW,
		input wire [31:0] iDEV_ADDR,	//Byte Address
		input wire [31:0] iDEV_DATA,
		//BUS(DATA)-Output
		output wire oDEV_REQ,
		input wire iDEV_BUSY,
		output wire [31:0] oDEV_DATA,
		//IRQ
		output wire oDEV_IRQ_REQ,
		input wire iDEV_IRQ_BUSY,
		output wire [23:0] oDEV_IRQ_DATA,
		input wire iDEV_IRQ_ACK,
		//Display Clock
		input wire iVGA_CLOCK,
		`ifdef GCI_STD_DISPLAY_SRAM
			//SRAM
			output wire onSRAM_CE,
			output wire onSRAM_WE,
			output wire onSRAM_OE,
			output wire onSRAM_UB,
			output wire onSRAM_LB,
			output wire [19:0] oSRAM_ADDR,
			inout wire [15:0] ioSRAM_DATA,
		`elsif GCI_STD_DISPLAY_SSRAM
			//SSRAM
			output wire oSSRAM_CLOCK,
			output wire onSSRAM_ADSC,
			output wire onSSRAM_ADSP,
			output wire onSSRAM_ADV,
			output wire onSSRAM_GW,
			output wire onSSRAM_OE,
			output wire onSSRAM_WE,
			output wire [3:0] onSSRAM_BE,
			output wire onSSRAM_CE1,
			output wire oSSRAM_CE2,
			output wire onSSRAM_CE3,
			output wire [18:0] oSSRAM_ADDR,
			inout wire [31:0] ioSSRAM_DATA,
			inout wire [3:0] ioSSRAM_PARITY,
		`endif
		//Display
		output wire oDISP_CLOCK,
		output wire onDISP_RESET,
		output wire oDISP_ENA,
		output wire oDISP_BLANK,
		output wire onDISP_HSYNC,
		output wire onDISP_VSYNC,
		output wire [9:0] oDISP_DATA_R,
		output wire [9:0] oDISP_DATA_G,
		output wire [9:0] oDISP_DATA_B
	);
	/************************************************************
	Wire
	//Display Controllor
	wire displaycontroller_wait;
	//Condition
	wire special_addr_use_condition;
	wire display_addr_wr_condition;
	//Special Memory
	wire [31:0] special_memory_rd_data;
	//Data Output Buffer
	reg b_req;
	reg [31:0] b_data;
	/************************************************************
	Condition
	assign special_addr_use_condition = iDEV_REQ && (iDEV_ADDR < 32'h00000400) && !displaycontroller_wait;
	assign display_addr_wr_condition = iDEV_REQ && (iDEV_ADDR >= 32'h00000400) && !displaycontroller_wait;
	/************************************************************
	Special Memory
	gci_std_display_device_special_memory #(32'h001383FC + 32'h4, 32'h00000000, 32'h00000002) VGA640X480_60HZ_SPECIAL_MEM(
		.iCLOCK(iCLOCK),
		.inRESET(inRESET),
		.iSPECIAL_REQ(special_addr_use_condition),
		.iSPECIAL_RW(iDEV_RW),
		.iSPECIAL_ADDR(iDEV_ADDR[9:2]),
		.iSPECIAL_DATA(iDEV_DATA),
		.oSPECIAL_DATA(special_memory_rd_data)
	);
	/************************************************************
	Display Controller
	gci_std_display_display_controller DISPLAY_MODULE(
		//System
		.iCLOCK(iCLOCK),
		.inRESET(inRESET),
		//Display Clock
		.iDISP_CLOCK(iVGA_CLOCK),
		//Write Reqest
		.iIF_WR_REQ(display_addr_wr_condition),
		.oIF_WR_BUSY(displaycontroller_wait),
		.iIF_WR_ADDR({2'h0, iDEV_ADDR[31:2]}),
		.iIF_WR_DATA(iDEV_DATA),
		//SRAM
		`ifdef GCI_STD_DISPLAY_SRAM
			.onSRAM_CE(onSRAM_CE),
			.onSRAM_WE(onSRAM_WE),
			.onSRAM_OE(onSRAM_OE),
			.onSRAM_UB(onSRAM_UB),
			.onSRAM_LB(onSRAM_LB),
			.oSRAM_ADDR(oSRAM_ADDR),
			.ioSRAM_DATA(ioSRAM_DATA),
		//SSRAM
		`elsif GCI_STD_DISPLAY_SSRAM
			.oSSRAM_CLOCK(oSSRAM_CLOCK),
			.onSSRAM_ADSC(onSSRAM_ADSC),
			.onSSRAM_ADSP(onSSRAM_ADSP),
			.onSSRAM_ADV(onSSRAM_ADV),
			.onSSRAM_GW(onSSRAM_GW),
			.onSSRAM_OE(onSSRAM_OE),
			.onSSRAM_WE(onSSRAM_WE),
			.onSSRAM_BE(onSSRAM_BE),
			.onSSRAM_CE1(onSSRAM_CE1),
			.oSSRAM_CE2(oSSRAM_CE2),
			.onSSRAM_CE3(onSSRAM_CE3),
			.oSSRAM_ADDR(oSSRAM_ADDR),
			.ioSSRAM_DATA(ioSSRAM_DATA),
			.ioSSRAM_PARITY(ioSSRAM_PARITY),
		`endif
		//Display
		.oDISP_CLOCK(oDISP_CLOCK),
		.onDISP_RESET(onDISP_RESET),
		.oDISP_ENA(oDISP_ENA),
		.oDISP_BLANK(oDISP_BLANK),
		.onDISP_HSYNC(onDISP_HSYNC),
		.onDISP_VSYNC(onDISP_VSYNC),
		.oDISP_DATA_R(oDISP_DATA_R),
		.oDISP_DATA_G(oDISP_DATA_G),
		.oDISP_DATA_B(oDISP_DATA_B)
	);
	/************************************************************
	Output Buffer
	always@(posedge iCLOCK or negedge inRESET)begin
		if(!inRESET)begin
			b_req <= 1'b0;
			b_data <= {32{1'b0}};
		end
		else begin
			b_req <= (special_addr_use_condition || display_addr_wr_condition);
			b_data <= (special_addr_use_condition)? special_memory_rd_data : {32{1'b0}};
		end
	end
	/************************************************************
	Assign
	assign oDEV_BUSY = displaycontroller_wait;
	assign oDEV_REQ = b_req;
	assign oDEV_DATA = b_data;
	assign oDEV_IRQ_REQ = 1'b0;
	assign oDEV_IRQ_DATA = {24{1'b0}};
endmodule