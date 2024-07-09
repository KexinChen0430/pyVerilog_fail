module mmu(
    input wire clk,
    input wire rst,
    //Input
    //Control from MemControl
    input wire[2:0] memOp_i,
    input wire[31:0] storeData_i,
    input wire[31:0] memAddr_i,
    //Data from physical device control
    input wire[31:0] sram_ramData_i,
    input wire[31:0] rom_ramData_i,
    input wire[31:0] flash_ramData_i,
    input wire[31:0] serial_ramData_i,
    //From CP0
    input wire[31:0] cp0_Status_i,
    input wire[31:0] cp0_Index_i,
    input wire[31:0] cp0_EntryLo0_i,
    input wire[31:0] cp0_EntryLo1_i,
    input wire[31:0] cp0_EntryHi_i,
    //From MEM_WB
    input wire[3:0] exception_i,
    //Output
    //SramControl
    output reg[2:0] sram_ramOp_o,
    output reg[31:0] sram_storeData_o,
    output reg[21:0] sram_ramAddr_o,
    //Rom
    output reg[15:0] rom_ramAddr_o,
    //SerialControl
    output reg[2:0] serial_ramOp_o,
    output reg serial_mode_o,
    output reg[7:0] serial_storeData_o,
    //FlashControl
    output reg[2:0] flash_ramOp_o,
    output reg[22:0] flash_ramAddr_o,
    output reg[15:0] flash_storeData_o,
    //Data to memcontrol
    output reg[31:0] memData_o,
    //Exception
    output reg[3:0] exceptionMMU_o
    );
    //Check
    wire isAddrUnaligned = ((memOp_i == `MEM_LW_OP || memOp_i == `MEM_SW_OP) && memAddr_i[1:0] != 2'b00);
    wire isUnmapped = (memAddr_i[31:30] == 2'b10);
    wire isKernelAddr = (memAddr_i[31] == 1'b1);
    wire EXL = cp0_Status_i[`Status_EXL];
    wire ERL = cp0_Status_i[`Status_ERL];
    wire UM = cp0_Status_i[`Status_UM];
    wire isUserMode = (UM == 1'b1 && EXL == 1'b0 && ERL == 1'b0);
    wire isWrite = (memOp_i == `MEM_SW_OP || memOp_i == `MEM_SB_OP);
    //Address Mapping
    reg[2:0] destination;
    wire[31:0] addr_serial = `COM_ADDR;
    always @(*) begin
        if (memAddr_i[31:24] == 8'hbe) begin
            destination = `MMU_FLASH;
        end else if (memAddr_i[31:12] == 20'hbfc00) begin
            destination = `MMU_ROM;
        end else if (memAddr_i[31:3] == addr_serial[31:3]) begin
            destination = `MMU_SERIAL;
        end else begin
            destination = `MMU_SRAM;
        end
    end
    wire[7:0] curASID = cp0_EntryHi_i[7:0];
    wire[18:0] curVPN2 = memAddr_i[31:13];
    //TLB defination
    reg[18:0] VPN2[0:15]; reg G[0:15]; reg[7:0] ASID[0:15];
    reg[19:0] PFN0[0:15]; reg D0[0:15]; reg V0[0:15];
    reg[19:0] PFN1[0:15]; reg D1[0:15]; reg V1[0:15];
    //TLB lookup
    wire[15:0] hitVec; reg hit;
    reg[19:0] overPFN0; reg overD0; reg overV0;
    reg[19:0] overPFN1; reg overD1; reg overV1;
    //match
    generate
        genvar i;
        for (i = 0; i < 16; i = i + 1)
        begin: TLB_Lookup
            assign hitVec[i] = (curVPN2 == VPN2[i] && (G[i] == 1'b1 || curASID == ASID[i]) && (V0[i] == 1'b1 || V1[i] == 1'b1));
        end
    endgenerate
    //final result
    reg isHit; reg[19:0] finalPFN;
    reg[31:0] finalAddr;
    always @(*) begin
        //select
        case (hitVec)
            16'b0000_0000_0000_0001:begin
                overPFN0 = PFN0[0]; overD0 = D0[0]; overV0 = V0[0];
                overPFN1 = PFN1[0]; overD1 = D1[0]; overV1 = V1[0];
                hit = 1'b1;
            end
            16'b0000_0000_0000_0010:begin
                overPFN0 = PFN0[1]; overD0 = D0[1]; overV0 = V0[1];
                overPFN1 = PFN1[1]; overD1 = D1[1]; overV1 = V1[1];
                hit = 1'b1;
            end
            16'b0000_0000_0000_0100:begin
                overPFN0 = PFN0[2]; overD0 = D0[2]; overV0 = V0[2];
                overPFN1 = PFN1[2]; overD1 = D1[2]; overV1 = V1[2];
                hit = 1'b1;
            end
            16'b0000_0000_0000_1000:begin
                overPFN0 = PFN0[3]; overD0 = D0[3]; overV0 = V0[3];
                overPFN1 = PFN1[3]; overD1 = D1[3]; overV1 = V1[3];
                hit = 1'b1;
            end
            16'b0000_0000_0001_0000:begin
                overPFN0 = PFN0[4]; overD0 = D0[4]; overV0 = V0[4];
                overPFN1 = PFN1[4]; overD1 = D1[4]; overV1 = V1[4];
                hit = 1'b1;
            end
            16'b0000_0000_0010_0000:begin
                overPFN0 = PFN0[5]; overD0 = D0[5]; overV0 = V0[5];
                overPFN1 = PFN1[5]; overD1 = D1[5]; overV1 = V1[5];
                hit = 1'b1;
            end
            16'b0000_0000_0100_0000:begin
                overPFN0 = PFN0[6]; overD0 = D0[6]; overV0 = V0[6];
                overPFN1 = PFN1[6]; overD1 = D1[6]; overV1 = V1[6];
                hit = 1'b1;
            end
            16'b0000_0000_1000_0000:begin
                overPFN0 = PFN0[7]; overD0 = D0[7]; overV0 = V0[7];
                overPFN1 = PFN1[7]; overD1 = D1[7]; overV1 = V1[7];
                hit = 1'b1;
            end
            16'b0000_0001_0000_0000:begin
                overPFN0 = PFN0[8]; overD0 = D0[8]; overV0 = V0[8];
                overPFN1 = PFN1[8]; overD1 = D1[8]; overV1 = V1[8];
                hit = 1'b1;
            end
            16'b0000_0010_0000_0000:begin
                overPFN0 = PFN0[9]; overD0 = D0[9]; overV0 = V0[9];
                overPFN1 = PFN1[9]; overD1 = D1[9]; overV1 = V1[9];
                hit = 1'b1;
            end
            16'b0000_0100_0000_0000:begin
                overPFN0 = PFN0[10]; overD0 = D0[10]; overV0 = V0[10];
                overPFN1 = PFN1[10]; overD1 = D1[10]; overV1 = V1[10];
                hit = 1'b1;
            end
            16'b0000_1000_0000_0000:begin
                overPFN0 = PFN0[11]; overD0 = D0[11]; overV0 = V0[11];
                overPFN1 = PFN1[11]; overD1 = D1[11]; overV1 = V1[11];
                hit = 1'b1;
            end
            16'b0001_0000_0000_0000:begin
                overPFN0 = PFN0[12]; overD0 = D0[12]; overV0 = V0[12];
                overPFN1 = PFN1[12]; overD1 = D1[12]; overV1 = V1[12];
                hit = 1'b1;
            end
            16'b0010_0000_0000_0000:begin
                overPFN0 = PFN0[13]; overD0 = D0[13]; overV0 = V0[13];
                overPFN1 = PFN1[13]; overD1 = D1[13]; overV1 = V1[13];
                hit = 1'b1;
            end
            16'b0100_0000_0000_0000:begin
                overPFN0 = PFN0[14]; overD0 = D0[14]; overV0 = V0[14];
                overPFN1 = PFN1[14]; overD1 = D1[14]; overV1 = V1[14];
                hit = 1'b1;
            end
            16'b1000_0000_0000_0000:begin
                overPFN0 = PFN0[15]; overD0 = D0[15]; overV0 = V0[15];
                overPFN1 = PFN1[15]; overD1 = D1[15]; overV1 = V1[15];
                hit = 1'b1;
            end
            default: begin
                overPFN0 = 20'h0; overD0 = 1'b0; overV0 = 1'b0;
                overPFN1 = 20'h0; overD1 = 1'b0; overV1 = 1'b0;
                hit = 1'b0;
            end
        endcase
        //check
        if (hit == 1'b1) begin
            if (memAddr_i[12] == 1'b1) begin
                //PFN1
                isHit = (overV1 == 1'b1 && (isWrite == 1'b0 || overD1 == 1'b1));
                finalPFN = overPFN1;
            end else begin
                //PFN0
                isHit = (overV0 == 1'b1 && (isWrite == 1'b0 || overD0 == 1'b1));
                finalPFN = overPFN0;
            end
        end else begin
            isHit = 1'b0;
            finalPFN = 20'b0;
        end
        finalAddr = {finalPFN, memAddr_i[11:0]};
    end
    //TLB Write
    wire[3:0] index = cp0_Index_i[3:0];
    always @(posedge clk) begin
        if (rst == `Enable) begin : init
            integer i;
            for (i = 0; i < 16; i = i + 1)
            begin
                VPN2[i] <= 19'h0; G[i] <= 1'b0; ASID[i] <= 8'h0;
                PFN0[i] <= 20'h0; D0[i] <= 1'b0; V0[i] <= 1'b0;
                PFN1[i] <= 20'h0; D1[i] <= 1'b0; V1[i] <= 1'b0;
            end
        end else if (exception_i == `EXC_TLBWI) begin
            VPN2[index] <= cp0_EntryHi_i[31:13]; ASID[index] <= cp0_EntryHi_i[7:0];
            PFN0[index] <= cp0_EntryLo0_i[25:6]; D0[index] <= cp0_EntryLo0_i[2]; V0[index] <= cp0_EntryLo0_i[1];
            PFN1[index] <= cp0_EntryLo1_i[25:6]; D1[index] <= cp0_EntryLo1_i[2]; V1[index] <= cp0_EntryLo1_i[1];
            G[index] <= cp0_EntryLo0_i[0] & cp0_EntryLo1_i[0];
        end
    end
    //Exception
    always @(*) begin
        if ((isAddrUnaligned == 1'b1 && destination != `MMU_SERIAL) || (isUserMode == 1'b1 && isKernelAddr == 1'b1)) begin
            exceptionMMU_o = `EXC_ADE;
        end else if (isUnmapped == 1'b0 && isHit == 1'b0) begin
            case (memOp_i)
                `MEM_LW_OP:
                    exceptionMMU_o = `EXC_TLBL;
                `MEM_SW_OP:
                    exceptionMMU_o = `EXC_TLBS;
                default:
                    exceptionMMU_o = `EXC_NONE;
            endcase
        end else begin
            exceptionMMU_o = `EXC_NONE;
        end
    end
    //Data Fetch
    always @(*) begin
        //SRAM
        sram_ramOp_o = `MEM_NOP_OP;
        sram_storeData_o = `ZeroWord;
        sram_ramAddr_o = 22'h0;
        //ROM
        rom_ramAddr_o = `ZeroHalfWord;
        //Serial
        serial_ramOp_o = `MEM_NOP_OP;
        serial_mode_o = `Disable;
        serial_storeData_o = `ZeroByte;
        //Flash
        flash_ramAddr_o = 23'h0;
        flash_ramOp_o = `MEM_NOP_OP;
        flash_storeData_o = `ZeroHalfWord;
        //Data
        memData_o = `ZeroWord;
        if (exceptionMMU_o == `EXC_NONE) begin
            case (destination)
                `MMU_NOP: begin
                end
                `MMU_SRAM: begin
                    //SRAM
                    sram_ramOp_o = memOp_i;
                    sram_storeData_o = storeData_i;
                    if (isUnmapped == 1'b1) begin
                        sram_ramAddr_o = memAddr_i[23:2];
                    end else begin
                        sram_ramAddr_o = finalAddr[23:2];
                    end
                    //Data
                    memData_o = sram_ramData_i;
                end
                `MMU_FLASH: begin
                    //Flash
                    flash_ramOp_o = memOp_i;
                    flash_ramAddr_o = {memAddr_i[23:2], memAddr_i[0]};
                    flash_storeData_o = storeData_i[15:0];
                    //Data
                    memData_o = flash_ramData_i;
                end
                `MMU_ROM: begin
                    //ROM
                    rom_ramAddr_o = memAddr_i[15:0];
                    //Data
                    memData_o = rom_ramData_i;
                end
                `MMU_SERIAL: begin
                    //Serial
                    serial_ramOp_o = memOp_i;
                    serial_mode_o = memAddr_i[2];
                    serial_storeData_o = storeData_i[7:0];
                    //Data
                    memData_o = serial_ramData_i;
                end
                default: begin
                end
            endcase
        end
    end
endmodule