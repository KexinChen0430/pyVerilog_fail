module cpu(
    input wire clk50,
    input wire rst,
    output wire[15:0] led_o,
    output wire flash_flashByte_o,
    output wire flash_flashVpen_o,
    output wire flash_flashRP_o,
    output wire flash_flashSTS_o,
    output wire flash_flashEnable_o,
    output wire flash_flashCE1_o,
    output wire flash_flashCE2_o,
    output wire flash_readEnable_o,
    output wire flash_writeEnable_o,
    output wire[22:0] flash_addr_o,
    output wire[7:0] pc_output,
    inout wire[15:0] flash_data_io,
    output wire sram_sramEnable_o,
    output wire sram_writeEnable_o,
    output wire sram_readEnable_o,
    output wire[21:0] sram_addr_o,
    inout wire[31:0] sram_data_io,
    input wire RxD,
    output wire TxD
    );
    //reg
    wire[31:0] reg_data1;
    wire[31:0] reg_data2;
    //hilo
    wire[31:0] reg_dataHi;
    wire[31:0] reg_dataLo;
    //CP0
    wire[31:0] cp0_data;
    wire[31:0] cp0_Status;
    wire[31:0] cp0_Index;
    wire[31:0] cp0_EntryLo0;
    wire[31:0] cp0_EntryLo1;
    wire[31:0] cp0_EntryHi;
    wire[31:0] cp0_Ebase;
    wire[31:0] cp0_EPC;
    wire cp0_timeInt;
    //control
    wire memcontrol_pauseRequest;
    wire con_pauseControl = memcontrol_pauseRequest;
    //sramcontrol
    wire[21:0] sramcontrol_ramAddr;
    wire sramcontrol_sramEnable;
    wire sramcontrol_writeEnable;
    wire sramcontrol_readEnable;
    wire sramcontrol_busEnable;
    wire[31:0] sramcontrol_writeData;
    wire[31:0] sramcontrol_ramData;
    //flashcontrol
    wire flashcontrol_flashEnable;
    wire flashcontrol_readEnable;
    wire flashcontrol_writeEnable;
    wire flashcontrol_busEnable;
    wire[22:0] flashcontrol_ramAddr;
    wire[15:0] flashcontrol_writeData;
    wire flashcontrol_pauseRequest;
    wire[31:0] flashcontrol_ramData;
    //serialcontrol
    wire[31:0] serialcontrol_ramData;
    wire serialcontrol_serialInt;
    //rom
    wire[31:0] rom_ins;
    //pc
    wire[31:0] pc_insAddr;
    //if_id
    wire[31:0] if_id_insAddr;
    wire[31:0] if_id_ins;
    wire[3:0] if_id_exception;
    wire[31:0] if_id_badVAddr;
    wire if_id_insValid;
    //id
    wire[4:0] id_regReadAddr1;
    wire[4:0] id_regReadAddr2;
    wire id_regEnable1;
    wire id_regEnable2;
    wire id_CP0ReadEnable;
    wire[4:0] id_CP0ReadAddr;
    wire[31:0] id_operand1;
    wire[31:0] id_operand2;
    wire id_writeReg;
    wire[4:0] id_writeRegAddr;
	wire[4:0] id_aluOp;
    wire id_writeRegHiLo;
    wire id_branchEnable;
    wire id_writeCP0;
    wire[4:0] id_writeCP0Addr;
    wire[31:0] id_branchAddr;
    wire id_inDelaySlot;
    wire id_nextInDelaySlot;
    wire id_bubbleRequest;
    wire[31:0] id_storeData;
    wire[2:0] id_memOp;
    wire[3:0] id_exception;
    wire[31:0] id_insAddr;
    wire[31:0] id_badVAddr;
    //id_ex
    wire[31:0] id_ex_operand1;
    wire[31:0] id_ex_operand2;
    wire id_ex_writeReg;
    wire[4:0] id_ex_writeRegAddr;
	wire[4:0] id_ex_aluOp;
    wire id_ex_writeRegHiLo;
    wire id_ex_writeCP0;
    wire[4:0] id_ex_writeCP0Addr;
    wire id_ex_inDelaySlot;
    wire id_ex_nextInDelaySlot;
    wire[31:0] id_ex_storeData;
    wire[2:0] id_ex_memOp;
    wire[31:0] id_ex_insAddr;
    wire[3:0] id_ex_exception;
    wire[31:0] id_ex_badVAddr;
    wire id_ex_insValid;
    //ex
    wire[31:0] ex_writeData;
    wire ex_writeReg;
    wire[4:0] ex_writeRegAddr;
    wire ex_writeRegHiLo;
    wire ex_writeCP0;
    wire[4:0] ex_writeCP0Addr;
    wire[31:0] ex_writeDataHi;
    wire[31:0] ex_writeDataLo;
    wire[31:0] ex_storeData;
    wire[2:0] ex_memOp;
    wire ex_inDelaySlot;
    wire[31:0] ex_insAddr;
    wire[3:0] ex_exception;
    wire[31:0] ex_badVAddr;
    //ex_mem
    wire[31:0] ex_mem_writeData;
    wire ex_mem_writeReg;
    wire[4:0] ex_mem_writeRegAddr;
    wire ex_mem_writeRegHiLo;
    wire[31:0] ex_mem_writeDataHi;
    wire[31:0] ex_mem_writeDataLo;
    wire ex_mem_writeCP0;
    wire[4:0] ex_mem_writeCP0Addr;
    wire[31:0] ex_mem_storeData;
    wire[2:0] ex_mem_memOp;
    wire ex_mem_inDelaySlot;
    wire[31:0] ex_mem_insAddr;
    wire[3:0] ex_mem_exception;
    wire[31:0] ex_mem_badVAddr;
    wire ex_mem_insValid;
    assign led_o = ex_mem_insAddr[15:0];
    assign pc_output = pc_insAddr[7:0];
    //mem
    wire[31:0] mem_writeData;
    wire mem_writeReg;
    wire[4:0] mem_writeRegAddr;
    wire mem_writeRegHiLo;
    wire[31:0] mem_writeDataHi;
    wire[31:0] mem_writeDataLo;
    wire mem_writeCP0;
    wire[4:0] mem_writeCP0Addr;
    wire[2:0] mem_memOp;
    wire[31:0] mem_storeData;
    wire[31:0] mem_memAddr;
    wire mem_flush;
    wire[31:0] mem_excAddr;
    wire[3:0] mem_exception;
    wire[31:0] mem_badVAddr;
    wire[31:0] mem_insAddr;
    wire mem_inDelaySlot;
    //memcontrol
    wire[2:0] memcontrol_ramOp;
    wire[31:0] memcontrol_storeData;
    wire[31:0] memcontrol_ramAddr;
    wire[31:0] memcontrol_ramData;
    wire[31:0] memcontrol_ins;
    wire[3:0] memcontrol_exceptionMEM;
    wire[3:0] memcontrol_exceptionIF;
    wire[31:0] memcontrol_badVAddrIF;
    //mmu
    wire[2:0] mmu_sram_ramOp;
    wire[31:0] mmu_sram_storeData;
    wire[21:0] mmu_sram_ramAddr;
    wire[15:0] mmu_rom_ramAddr;
    wire[31:0] mmu_memData;
    wire[3:0] mmu_exceptionMMU;
    wire[2:0] mmu_serial_ramOp;
    wire mmu_serial_mode;
    wire[7:0] mmu_serial_storeData;
    wire[2:0] mmu_flash_ramOp;
    wire[22:0] mmu_flash_ramAddr;
    wire[15:0] mmu_flash_storeData;
    //mem_wb
    wire[31:0] mem_wb_writeData;
    wire mem_wb_writeReg;
    wire[4:0] mem_wb_writeRegAddr;
    wire mem_wb_writeRegHiLo;
    wire[31:0] mem_wb_writeDataHi;
    wire[31:0] mem_wb_writeDataLo;
    wire mem_wb_writeCP0;
    wire[4:0] mem_wb_writeCP0Addr;
    wire[3:0] mem_wb_exception;
    wire[31:0] mem_wb_insAddr;
    wire[31:0] mem_wb_badVAddr;
    wire mem_wb_inDelaySlot;
    //Global 25MHz clock
    reg clk25 = 0;
    always @(posedge clk50) begin
        clk25 <= ~clk25;
    end
//    reg clk12 = 0;
//    always @(posedge clk25) begin
//        clk12 <= ~clk12;
//    end
    reg clk = 0;
    always @(posedge clk25) begin
        clk <= ~clk;
    end
//    always @(*) begin
//        clk <= clk50;
//    end
    //Global reset
    wire nrst = ~rst;
    //SRAM Bus
    //Control
    assign sram_sramEnable_o = ~sramcontrol_sramEnable;
    assign sram_writeEnable_o = ~sramcontrol_writeEnable;
    assign sram_readEnable_o = ~sramcontrol_readEnable;
    assign sram_addr_o = sramcontrol_ramAddr;
    //Write
    assign sram_data_io = sramcontrol_busEnable ? sramcontrol_writeData : 32'bz;
    //Read
    reg[31:0] sram_readData;
    always @(*) begin
        sram_readData = sramcontrol_readEnable ? sram_data_io : `ZeroWord;
    end
    //Flash Bus
    //Control
    assign flash_flashByte_o = `Enable;
    assign flash_flashVpen_o = `Enable;
    assign flash_flashRP_o = `Enable;
    assign flash_flashSTS_o = `Enable;
    assign flash_flashCE1_o = `Disable;
    assign flash_flashCE2_o = `Disable;
    assign flash_flashEnable_o = ~flashcontrol_flashEnable;
    assign flash_readEnable_o = ~flashcontrol_readEnable;
    assign flash_writeEnable_o = ~flashcontrol_writeEnable;
    assign flash_addr_o = flashcontrol_ramAddr;
    //Write
    assign flash_data_io = flashcontrol_busEnable ? flashcontrol_writeData : 16'bz;
    //Read
    reg[15:0] flash_readData;
    always @(*) begin
        flash_readData = flashcontrol_readEnable ? flash_data_io : `ZeroHalfWord;
    end
    registers Registers(
        .clk(clk),
        .rst(nrst),
        .readAddr1_i(id_regReadAddr1),
        .readEnable1_i(id_regEnable1),
        .data1_o(reg_data1),
        .readAddr2_i(id_regReadAddr2),
        .readEnable2_i(id_regEnable2),
        .data2_o(reg_data2),
        .writeAddr_i(mem_wb_writeRegAddr),
        .writeData_i(mem_wb_writeData),
        .writeEnable_i(mem_wb_writeReg)
        );
    hilo HILO(
        .clk(clk),
        .rst(nrst),
        .dataHi_o(reg_dataHi),
        .dataLo_o(reg_dataLo),
        .writeEnable_i(mem_wb_writeRegHiLo),
        .writeDataHi_i(mem_wb_writeDataHi),
        .writeDataLo_i(mem_wb_writeDataLo)
        );
    cp0 CP0(
        .clk(clk),
        .rst(nrst),
        .pauseControl_i(con_pauseControl),
        .exception_i(mem_wb_exception),
        .readAddr_i(id_CP0ReadAddr),
        .readEnable_i(id_CP0ReadEnable),
        .data_o(cp0_data),
        .writeAddr_i(mem_wb_writeCP0Addr),
        .writeData_i(mem_wb_writeData),
        .writeEnable_i(mem_wb_writeCP0),
        .insAddr_i(mem_wb_insAddr),
        .inDelaySlot_i(mem_wb_inDelaySlot),
        .badVAddr_i(mem_wb_badVAddr),
        .cp0_Status_o(cp0_Status),
        .cp0_Index_o(cp0_Index),
        .cp0_EntryLo0_o(cp0_EntryLo0),
        .cp0_EntryLo1_o(cp0_EntryLo1),
        .cp0_EntryHi_o(cp0_EntryHi),
        .cp0_Ebase_o(cp0_Ebase),
        .cp0_EPC_o(cp0_EPC),
        .timeInt_o(cp0_timeInt)
        );
    memcontrol MemControl(
        .clk(clk),
        .rst(nrst),
        .ramOp_i(mem_memOp),
        .storeData_i(mem_storeData),
        .ramAddr_i(mem_memAddr),
        .insAddr_i(pc_insAddr),
        .ramData_i(mmu_memData),
        .exception_i(mmu_exceptionMMU),
        .pauseRequest_i(flashcontrol_pauseRequest),
        .pauseRequest_o(memcontrol_pauseRequest),
        .ramOp_o(memcontrol_ramOp),
        .storeData_o(memcontrol_storeData),
        .ramAddr_o(memcontrol_ramAddr),
        .ramData_o(memcontrol_ramData),
        .ins_o(memcontrol_ins),
        .exceptionMEM_o(memcontrol_exceptionMEM),
        .exceptionIF_o(memcontrol_exceptionIF),
        .badVAddrIF_o(memcontrol_badVAddrIF)
        );
    mmu MMU(
        .clk(clk),
        .rst(nrst),
        .memOp_i(memcontrol_ramOp),
        .storeData_i(memcontrol_storeData),
        .memAddr_i(memcontrol_ramAddr),
        .sram_ramData_i(sramcontrol_ramData),
        .rom_ramData_i(rom_ins),
        .flash_ramData_i(flashcontrol_ramData),
        .serial_ramData_i(serialcontrol_ramData),
        .cp0_Status_i(cp0_Status),
        .cp0_Index_i(cp0_Index),
        .cp0_EntryLo0_i(cp0_EntryLo0),
        .cp0_EntryLo1_i(cp0_EntryLo1),
        .cp0_EntryHi_i(cp0_EntryHi),
        .exception_i(mem_wb_exception),
        .sram_ramOp_o(mmu_sram_ramOp),
        .sram_storeData_o(mmu_sram_storeData),
        .sram_ramAddr_o(mmu_sram_ramAddr),
        .rom_ramAddr_o(mmu_rom_ramAddr),
        .flash_ramOp_o(mmu_flash_ramOp),
        .flash_ramAddr_o(mmu_flash_ramAddr),
        .flash_storeData_o(mmu_flash_storeData),
        .serial_ramOp_o(mmu_serial_ramOp),
        .serial_mode_o(mmu_serial_mode),
        .serial_storeData_o(mmu_serial_storeData),
        .memData_o(mmu_memData),
        .exceptionMMU_o(mmu_exceptionMMU)
        );
    rom ROM(
        .insAddr_i(mmu_rom_ramAddr),
        .ins_o(rom_ins)
        );
    sramcontrol SRAMControl(
        .clk50(clk25),
        .rst(nrst),
        .ramOp_i(mmu_sram_ramOp),
        .storeData_i(mmu_sram_storeData),
        .ramAddr_i(mmu_sram_ramAddr),
        .ramData_i(sram_readData),
        .ramAddr_o(sramcontrol_ramAddr),
        .sramEnable_o(sramcontrol_sramEnable),
        .writeEnable_o(sramcontrol_writeEnable),
        .readEnable_o(sramcontrol_readEnable),
        .busEnable_o(sramcontrol_busEnable),
        .ramData_o(sramcontrol_ramData),
        .writeData_o(sramcontrol_writeData)
        );
    flashcontrol FlashControl(
        .clk25(clk),
        .rst(nrst),
        .ramOp_i(mmu_flash_ramOp),
        .ramAddr_i(mmu_flash_ramAddr),
        .storeData_i(mmu_flash_storeData),
        .ramData_i(flash_readData),
        .flashEnable_o(flashcontrol_flashEnable),
        .readEnable_o(flashcontrol_readEnable),
        .writeEnable_o(flashcontrol_writeEnable),
        .busEnable_o(flashcontrol_busEnable),
        .ramAddr_o(flashcontrol_ramAddr),
        .writeData_o(flashcontrol_writeData),
        .pauseRequest_o(flashcontrol_pauseRequest),
        .ramData_o(flashcontrol_ramData)
        );
    serialcontrol SerialControl(
        .clk25(clk),
        .rst(nrst),
        .ramOp_i(mmu_serial_ramOp),
        .mode_i(mmu_serial_mode),
        .storeData_i(mmu_serial_storeData),
        .ramData_o(serialcontrol_ramData),
        .serialInt_o(serialcontrol_serialInt),
        .RxD(RxD),
        .TxD(TxD)
        );
    pc PC(
        .clk(clk),
        .rst(nrst),
        .bubble_i(id_bubbleRequest),
        .pauseControl_i(con_pauseControl),
        .flush_i(mem_flush),
        .excAddr_i(mem_excAddr),
        .branchEnable_i(id_branchEnable),
        .branchAddr_i(id_branchAddr),
        .insAddr_o(pc_insAddr)
        );
    if_id IF_ID(
        .clk(clk),
        .rst(nrst),
        .bubble_i(id_bubbleRequest),
        .pauseControl_i(con_pauseControl),
        .flush_i(mem_flush),
		.exception_i(memcontrol_exceptionIF),
		.badVAddr_i(memcontrol_badVAddrIF),
        .insAddr_i(pc_insAddr),
        .ins_i(memcontrol_ins),
        .insValid_o(if_id_insValid),
        .insAddr_o(if_id_insAddr),
        .ins_o(if_id_ins),
        .exception_o(if_id_exception),
        .badVAddr_o(if_id_badVAddr)
        );
    id ID(
        .insAddr_i(if_id_insAddr),
        .ins_i(if_id_ins),
        .regData1_i(reg_data1),
        .regData2_i(reg_data2),
        .regDataHi_i(reg_dataHi),
        .regDataLo_i(reg_dataLo),
        .CP0Data_i(cp0_data),
        .badVAddr_i(if_id_badVAddr),
        .ex_writeReg_i(ex_writeReg),
        .ex_writeRegAddr_i(ex_writeRegAddr),
        .ex_writeData_i(ex_writeData),
        .mem_writeReg_i(mem_writeReg),
        .mem_writeRegAddr_i(mem_writeRegAddr),
        .mem_writeData_i(mem_writeData),
        .ex_writeRegHiLo_i(ex_writeRegHiLo),
        .ex_writeDataHi_i(ex_writeDataHi),
        .ex_writeDataLo_i(ex_writeDataLo),
        .ex_memOp_i(id_ex_memOp),
        .mem_writeRegHiLo_i(mem_writeRegHiLo),
        .mem_writeDataHi_i(mem_writeDataHi),
        .mem_writeDataLo_i(mem_writeDataLo),
        .ex_writeCP0_i(ex_writeCP0),
        .inDelaySlot_i(id_ex_nextInDelaySlot),
        .exception_i(if_id_exception),
        .ex_writeCP0Addr_i(ex_writeCP0Addr),
        .mem_writeCP0_i(mem_writeCP0),
        .mem_writeCP0Addr_i(mem_writeCP0Addr),
        .regReadAddr1_o(id_regReadAddr1),
        .regReadAddr2_o(id_regReadAddr2),
        .regEnable1_o(id_regEnable1),
        .regEnable2_o(id_regEnable2),
        .CP0ReadEnable_o(id_CP0ReadEnable),
        .CP0ReadAddr_o(id_CP0ReadAddr),
        .bubbleRequest_o(id_bubbleRequest),
        .exception_o(id_exception),
        .operand1_o(id_operand1),
        .operand2_o(id_operand2),
        .aluOp_o(id_aluOp),
        .storeData_o(id_storeData),
        .memOp_o(id_memOp),
        .writeReg_o(id_writeReg),
        .writeRegAddr_o(id_writeRegAddr),
        .writeRegHiLo_o(id_writeRegHiLo),
        .writeCP0_o(id_writeCP0),
        .writeCP0Addr_o(id_writeCP0Addr),
        .branchEnable_o(id_branchEnable),
        .branchAddr_o(id_branchAddr),
        .insAddr_o(id_insAddr),
        .inDelaySlot_o(id_inDelaySlot),
        .nextInDelaySlot_o(id_nextInDelaySlot),
        .badVAddr_o(id_badVAddr)
        );
    id_ex ID_EX(
        .clk(clk),
        .rst(nrst),
        .operand1_i(id_operand1),
        .operand2_i(id_operand2),
		.aluOp_i(id_aluOp),
        .storeData_i(id_storeData),
        .memOp_i(id_memOp),
        .writeReg_i(id_writeReg),
        .writeRegAddr_i(id_writeRegAddr),
        .writeRegHiLo_i(id_writeRegHiLo),
        .writeCP0_i(id_writeCP0),
        .writeCP0Addr_i(id_writeCP0Addr),
        .insValid_i(if_id_insValid),
        .insAddr_i(id_insAddr),
        .inDelaySlot_i(id_inDelaySlot),
        .nextInDelaySlot_i(id_nextInDelaySlot),
        .exception_i(id_exception),
        .badVAddr_i(id_badVAddr),
        .pauseControl_i(con_pauseControl),
        .flush_i(mem_flush),
        .bubble_i(id_bubbleRequest),
        .insValid_o(id_ex_insValid),
        .insAddr_o(id_ex_insAddr),
        .operand1_o(id_ex_operand1),
        .operand2_o(id_ex_operand2),
        .aluOp_o(id_ex_aluOp),
        .storeData_o(id_ex_storeData),
        .memOp_o(id_ex_memOp),
        .writeReg_o(id_ex_writeReg),
        .writeRegAddr_o(id_ex_writeRegAddr),
        .writeRegHiLo_o(id_ex_writeRegHiLo),
        .writeCP0_o(id_ex_writeCP0),
        .writeCP0Addr_o(id_ex_writeCP0Addr),
        .inDelaySlot_o(id_ex_inDelaySlot),
        .nextInDelaySlot_o(id_ex_nextInDelaySlot),
        .exception_o(id_ex_exception),
        .badVAddr_o(id_ex_badVAddr)
        );
	ex EX(
        .insAddr_i(id_ex_insAddr),
		.operand1_i(id_ex_operand1),
		.operand2_i(id_ex_operand2),
		.aluOp_i(id_ex_aluOp),
        .storeData_i(id_ex_storeData),
        .memOp_i(id_ex_memOp),
		.writeRegAddr_i(id_ex_writeRegAddr),
		.writeReg_i(id_ex_writeReg),
        .writeRegHiLo_i(id_ex_writeRegHiLo),
        .writeCP0_i(id_ex_writeCP0),
        .writeCP0Addr_i(id_ex_writeCP0Addr),
        .inDelaySlot_i(id_ex_inDelaySlot),
        .exception_i(id_ex_exception),
        .badVAddr_i(id_ex_badVAddr),
        .insAddr_o(ex_insAddr),
		.writeRegAddr_o(ex_writeRegAddr),
		.writeReg_o(ex_writeReg),
		.writeData_o(ex_writeData),
        .storeData_o(ex_storeData),
        .memOp_o(ex_memOp),
        .writeRegHiLo_o(ex_writeRegHiLo),
        .writeDataHi_o(ex_writeDataHi),
        .writeDataLo_o(ex_writeDataLo),
        .writeCP0_o(ex_writeCP0),
        .writeCP0Addr_o(ex_writeCP0Addr),
        .inDelaySlot_o(ex_inDelaySlot),
        .exception_o(ex_exception),
        .badVAddr_o(ex_badVAddr)
		);
    ex_mem EX_MEM(
        .clk(clk),
        .rst(nrst),
        .insAddr_i(ex_insAddr),
        .storeData_i(ex_storeData),
        .memOp_i(ex_memOp),
        .writeData_i(ex_writeData),
        .writeReg_i(ex_writeReg),
        .writeRegAddr_i(ex_writeRegAddr),
        .writeRegHiLo_i(ex_writeRegHiLo),
        .writeDataHi_i(ex_writeDataHi),
        .writeDataLo_i(ex_writeDataLo),
        .writeCP0_i(ex_writeCP0),
        .writeCP0Addr_i(ex_writeCP0Addr),
        .insValid_i(id_ex_insValid),
        .inDelaySlot_i(ex_inDelaySlot),
        .exception_i(ex_exception),
        .badVAddr_i(ex_badVAddr),
        .pauseControl_i(con_pauseControl),
        .flush_i(mem_flush),
        .insAddr_o(ex_mem_insAddr),
        .storeData_o(ex_mem_storeData),
        .memOp_o(ex_mem_memOp),
        .writeData_o(ex_mem_writeData),
        .writeReg_o(ex_mem_writeReg),
        .writeRegAddr_o(ex_mem_writeRegAddr),
        .writeRegHiLo_o(ex_mem_writeRegHiLo),
        .writeDataHi_o(ex_mem_writeDataHi),
        .writeDataLo_o(ex_mem_writeDataLo),
        .writeCP0_o(ex_mem_writeCP0),
        .writeCP0Addr_o(ex_mem_writeCP0Addr),
        .insValid_o(ex_mem_insValid),
        .inDelaySlot_o(ex_mem_inDelaySlot),
        .exception_o(ex_mem_exception),
        .badVAddr_o(ex_mem_badVAddr)
    );
    mem MEM(
        .memData_i(memcontrol_ramData),
        .insValid_i(ex_mem_insValid),
        .insAddr_i(ex_mem_insAddr),
        .storeData_i(ex_mem_storeData),
        .memOp_i(ex_mem_memOp),
        .writeData_i(ex_mem_writeData),
        .writeReg_i(ex_mem_writeReg),
        .writeRegAddr_i(ex_mem_writeRegAddr),
        .writeRegHiLo_i(ex_mem_writeRegHiLo),
        .writeDataHi_i(ex_mem_writeDataHi),
        .writeDataLo_i(ex_mem_writeDataLo),
        .writeCP0_i(ex_mem_writeCP0),
        .writeCP0Addr_i(ex_mem_writeCP0Addr),
        .inDelaySlot_i(ex_mem_inDelaySlot),
        .exception_i(ex_mem_exception),
        .exceptionMC_i(memcontrol_exceptionMEM),
        .badVAddr_i(ex_mem_badVAddr),
        .cp0_Status_i(cp0_Status),
        .cp0_EntryHi_i(cp0_EntryHi),
        .cp0_Ebase_i(cp0_Ebase),
        .cp0_EPC_i(cp0_EPC),
        .timeInt_i(cp0_timeInt),
        .serialInt_i(serialcontrol_serialInt),
        .memOp_o(mem_memOp),
        .storeData_o(mem_storeData),
        .memAddr_o(mem_memAddr),
        .writeReg_o(mem_writeReg),
        .writeRegAddr_o(mem_writeRegAddr),
        .writeData_o(mem_writeData),
        .writeRegHiLo_o(mem_writeRegHiLo),
        .writeDataHi_o(mem_writeDataHi),
        .writeDataLo_o(mem_writeDataLo),
        .writeCP0_o(mem_writeCP0),
        .writeCP0Addr_o(mem_writeCP0Addr),
        .flush_o(mem_flush),
        .excAddr_o(mem_excAddr),
        .inDelaySlot_o(mem_inDelaySlot),
        .insAddr_o(mem_insAddr),
        .exception_o(mem_exception),
        .badVAddr_o(mem_badVAddr)
        );
    mem_wb MEM_WB(
        .clk(clk),
        .rst(nrst),
        .writeReg_i(mem_writeReg),
        .writeRegAddr_i(mem_writeRegAddr),
        .writeData_i(mem_writeData),
        .writeRegHiLo_i(mem_writeRegHiLo),
        .writeDataHi_i(mem_writeDataHi),
        .writeDataLo_i(mem_writeDataLo),
        .writeCP0_i(mem_writeCP0),
        .writeCP0Addr_i(mem_writeCP0Addr),
        .pauseControl_i(con_pauseControl),
        .exception_i(mem_exception),
        .inDelaySlot_i(mem_inDelaySlot),
        .insAddr_i(mem_insAddr),
        .badVAddr_i(mem_badVAddr),
        .writeReg_o(mem_wb_writeReg),
        .writeRegAddr_o(mem_wb_writeRegAddr),
        .writeData_o(mem_wb_writeData),
        .writeRegHiLo_o(mem_wb_writeRegHiLo),
        .writeDataHi_o(mem_wb_writeDataHi),
        .writeDataLo_o(mem_wb_writeDataLo),
        .writeCP0_o(mem_wb_writeCP0),
        .writeCP0Addr_o(mem_wb_writeCP0Addr),
        .exception_o(mem_wb_exception),
        .insAddr_o(mem_wb_insAddr),
        .badVAddr_o(mem_wb_badVAddr),
        .inDelaySlot_o(mem_wb_inDelaySlot)
        );
endmodule