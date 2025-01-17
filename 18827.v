module core
	#(
		parameter CORE_ID = 32'h0
	)(
		/****************************************
		System
		input wire iCLOCK,
		input wire inRESET,
		/****************************************
		Core
		//oCORE_FLASH,
		output wire oFREE_TLB_FLUSH,
		/****************************************
		GCI Controll
		//Interrupt Controll
		output wire oIO_IRQ_CONFIG_TABLE_REQ,
		output wire [5:0] oIO_IRQ_CONFIG_TABLE_ENTRY,
		output wire oIO_IRQ_CONFIG_TABLE_FLAG_MASK,
		output wire oIO_IRQ_CONFIG_TABLE_FLAG_VALID,
		output wire [1:0] oIO_IRQ_CONFIG_TABLE_FLAG_LEVEL,
		/****************************************
		Instruction Memory
		//Req
		output wire oINST_REQ,
		input wire iINST_LOCK,
		output wire [1:0] oINST_MMUMOD,
		output wire [2:0] oINST_MMUPS,
		output wire [31:0] oINST_PDT,
		output wire [13:0] oINST_ASID,
		output wire [31:0] oINST_ADDR,
		//RAM -> This
		input wire iINST_VALID,
		output wire oINST_BUSY,
		input wire [63:0] iINST_DATA,
		input wire [23:0] iINST_MMU_FLAGS,
		/****************************************
		Data Memory
		//Req
		output wire oDATA_REQ,
		input wire iDATA_LOCK,
		output wire [1:0] oDATA_ORDER,
		output wire [3:0] oDATA_MASK,
		output wire oDATA_RW,		//0=Write 1=Read
		output wire [13:0] oDATA_ASID,
		output wire [1:0] oDATA_MMUMOD,
		output wire [2:0] oDATA_MMUPS,
		output wire [31:0] oDATA_PDT,
		output wire [31:0] oDATA_ADDR,
		//This -> Data RAM
		output wire [31:0] oDATA_DATA,
		//Data RAM -> This
		input wire iDATA_VALID,
		input wire [63:0] iDATA_DATA,
		input wire [23:0] iDATA_MMU_FLAGS,
		/****************************************
		IO
		//Req
		output wire oIO_REQ,
		input wire iIO_BUSY,
		output wire [1:0] oIO_ORDER,
		output wire oIO_RW,			//0=Write 1=Read
		output wire [31:0] oIO_ADDR,
		//Write
		output wire [31:0] oIO_DATA,
		//Rec
		input wire iIO_VALID,
		input wire [31:0] iIO_DATA,
		/****************************************
		Interrupt
		input wire iINTERRUPT_VALID,
		output wire oINTERRUPT_ACK,
		input wire [5:0] iINTERRUPT_NUM,
		/****************************************
		System Infomation
		input wire iSYSINFO_IOSR_VALID,
		input wire [31:0] iSYSINFO_IOSR,
		/****************************************
		Debug
		output wire [31:0] oDEBUG_PC,
		input wire iDEBUG_CMD_REQ,
		output wire oDEBUG_CMD_BUSY,
		input wire [3:0] iDEBUG_CMD_COMMAND,
		input wire [7:0] iDEBUG_CMD_TARGET,
		input wire [31:0] iDEBUG_CMD_DATA,
		output wire oDEBUG_CMD_VALID,
		output wire oDEBUG_CMD_ERROR,
		output wire [31:0] oDEBUG_CMD_DATA
	);
	/************************************************************************************
	Wire and Register
	wire [31:0] debug0;
	/************************************************************************************
	Core - Main Pipeline
	core_pipeline #(CORE_ID) CORE_PIPELINE(
		//System
		.iCLOCK(iCLOCK),
		.inRESET(inRESET),
		//Core
		.oFREE_TLB_FLUSH(oFREE_TLB_FLUSH),
		//GCI Interrupt Controll
		//Interrupt Control
		.oIO_IRQ_CONFIG_TABLE_REQ(oIO_IRQ_CONFIG_TABLE_REQ),
		.oIO_IRQ_CONFIG_TABLE_ENTRY(oIO_IRQ_CONFIG_TABLE_ENTRY),
		.oIO_IRQ_CONFIG_TABLE_FLAG_MASK(oIO_IRQ_CONFIG_TABLE_FLAG_MASK),
		.oIO_IRQ_CONFIG_TABLE_FLAG_VALID(oIO_IRQ_CONFIG_TABLE_FLAG_VALID),
		.oIO_IRQ_CONFIG_TABLE_FLAG_LEVEL(oIO_IRQ_CONFIG_TABLE_FLAG_LEVEL),
		//Instruction Memory Request
		.oINST_FETCH_REQ(oINST_REQ),
		.iINST_FETCH_BUSY(iINST_LOCK),
		.oINST_FETCH_MMUMOD(oINST_MMUMOD),
		.oINST_FETCH_MMUPS(oINST_MMUPS),
		.oINST_FETCH_PDT(oINST_PDT),
		.oINST_FETCH_ASID(oINST_ASID),
		.oINST_FETCH_ADDR(oINST_ADDR),
		.iINST_VALID(iINST_VALID),
		.oINST_BUSY(oINST_BUSY),
		.iINST_DATA(iINST_DATA),
		.iINST_MMU_FLAGS(iINST_MMU_FLAGS),
		/****************************************
		Data Memory
		//Req
		.oDATA_REQ(oDATA_REQ),
		.iDATA_LOCK(iDATA_LOCK),
		.oDATA_ORDER(oDATA_ORDER),	//00=Byte Order 01=2Byte Order 10= Word Order 11= None
		.oDATA_MASK(oDATA_MASK),
		.oDATA_RW(oDATA_RW),			//1=Write 0=Read
		.oDATA_ASID(oDATA_ASID),
		.oDATA_MMUMOD(oDATA_MMUMOD),
		.oDATA_MMUPS(oDATA_MMUPS),
		.oDATA_PDT(oDATA_PDT),
		.oDATA_ADDR(oDATA_ADDR),
		//This -> Data RAM
		.oDATA_DATA(oDATA_DATA),
		//Data RAM -> This
		.iDATA_VALID(iDATA_VALID),
		.iDATA_DATA(iDATA_DATA),
		.iDATA_MMU_FLAGS(iDATA_MMU_FLAGS),
		/****************************************
		IO
		//Req
		.oIO_REQ(oIO_REQ),
		.iIO_BUSY(iIO_BUSY),
		.oIO_ORDER(oIO_ORDER),		//00=Byte Order 01=2Byte Order 10= Word Order 11= None
		.oIO_RW(oIO_RW),			//0=Write 1=Read
		.oIO_ADDR(oIO_ADDR),
		//Write
		.oIO_DATA(oIO_DATA),
		//Rec
		.iIO_VALID(iIO_VALID),
		.iIO_DATA(iIO_DATA),
		//Interrupt
		.iINTERRUPT_VALID(iINTERRUPT_VALID),
		.oINTERRUPT_ACK(oINTERRUPT_ACK),
		.iINTERRUPT_NUM(iINTERRUPT_NUM),
		.iSYSINFO_IOSR_VALID(iSYSINFO_IOSR_VALID),
		.iSYSINFO_IOSR(iSYSINFO_IOSR),
		.oDEBUG_PC(oDEBUG_PC),
		/****************************************
		Debug
		.iDEBUG_CMD_REQ(iDEBUG_CMD_REQ),
		.oDEBUG_CMD_BUSY(oDEBUG_CMD_BUSY),
		.iDEBUG_CMD_COMMAND(iDEBUG_CMD_COMMAND),
		.iDEBUG_CMD_TARGET(iDEBUG_CMD_TARGET),
		.iDEBUG_CMD_DATA(iDEBUG_CMD_DATA),
		.oDEBUG_CMD_VALID(oDEBUG_CMD_VALID),
		.oDEBUG_CMD_ERROR(oDEBUG_CMD_ERROR),
		.oDEBUG_CMD_DATA(oDEBUG_CMD_DATA)
	);
endmodule