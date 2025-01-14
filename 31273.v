module instantiations
	assign nsel= inputData[14:13];
	assign vsel= inputData[12:11];
	assign loada= inputData[10];
	assign loadb= inputData[9];
	assign write= inputData[8];
	assign asel= inputData[7];
	assign bsel= inputData[6];
	assign loads= inputData[5];
	assign loadc= inputData[4];
	assign loadpc= inputData[3];
	assign msel= inputData[2];
	assign mwrite= inputData[1];
	assign loadir= inputData[0];
	//Specifications for what to do in each state
	//Each state is separated by a rising clock update
	//At start of each instruction, only loadir= 1, everything else is set to 0 from the instruction states
	always @(*) begin
		casex({currentState, opcode, op})
			//Set everything to zero for initial or reset state
			{`initiatePC, `opCodeNone, `operationNone}: inputData= 15'b000000000000000;
			//----------
			//INSTRUCTION COUNTER + RAM //Loading Instruction and Counter
			//Load counter value
			//loadPC= 1, else= 0 -> Clk //put all load values back into 0 when finished executing a command
			{`loadPC, `opCodeNone, `operationNone}:	inputData= 15'b000000000001000;
			//load value into RAM
			//loadPC= 0, else= before -> Clk
			{`loadRAM, `opCodeNone, `operationNone}: inputData= {inputData[14:4], 1'b0, inputData[2:0]};
			//load instruction
			//loadir= 1, else= before -> Clk
			{`loadIR, `opCodeNone, `operationNone}: inputData= {inputData[14:1], 1'b1};
			//----------
			//INSTRUCTION 1 //Write value of sximm8 into Rn register
			//nsel= Rn Vsel= SXIMM8 write= 1 loadir= 0  -> Clk
			{`instrFirst, `MOV, `AND}: inputData= {`RN, `SXIMM8, inputData[10:9], 1'b1, inputData[7:1], 1'b0};
			//----------
			//INSTRUCTION 2 //Write shifted value of Rm register into Rd register
			//read value from RM register
			//nsel= RM loadir= 0 (write already 0), else= before -> Clk
			{`instrFirst, `MOV, `ADD}: inputData= {`RM, inputData[12:1], 1'b0};
			//put specified reading value in B
			//loadb= 1, else= before -> Clk
			{`putInB, `MOV, `ADD}: inputData= {inputData[14:10], 1'b1, inputData[8:0]};
			//Add A and Shifted B values and put into register C -> Clk
			//bsel= 0 asel= 1 loadc= 1 loadb= 0, else= before -> Clk
			{`aluMovOpAndPutInC, `MOV, `ADD}: inputData= {inputData[14:10], 1'b0, inputData[8], 2'b10, inputData[5], 1'b1, inputData[3:0]};
			//Put value of C into Rd register
			//nsel= `RD vsel= `C write= 1 loadc= 0, else= before -> Clk
			{`instrLast, `MOV, `ADD}: inputData= {`RD, `C, inputData[10:9], 1'b1, inputData[7:5], 1'b0, inputData[3:0]};
			//----------
			//INSTRUCTION 3 //Add values of Rn and shifted Rm and put it in Rd
			//read value from RM register
			//nsel= RM loadir= 0 (write already 0), else= before -> Clk
			{`instrFirst, `ALU, `ADD}: inputData= {`RM, inputData[12:1], 1'b0};
			//put specified reading value in B
			//loadb= 1, else= before -> Clk
			{`putInB, `ALU, `ADD}: inputData= {inputData[14:10], 1'b1, inputData[8:0]};
			//read value from RN register
			//nsel= `Rn (write already 0) loadb= 0, else= begore -> Clk
			{`readRn, `ALU, `ADD}: inputData= {`RN, inputData[12:10], 1'b0, inputData[8:0]};
			//put specified reading value in A
			//loadb= 0, loada= 1, else= before -> Clk
			{`putInA, `ALU, `ADD}: inputData= {inputData[14:11], 2'b10, inputData[8:0]};
			//do addition computations and load in register C
			//asel= 0 bsel= 0 loadc= 1 loada= 0, else - before -> Clk
			{`aluAddOpAndPutInC, `ALU, `ADD}: inputData= {inputData[14:11], 1'b0, inputData[9:8], 2'b00, inputData[5], 1'b1, inputData[3:0]};
			//Put Value of C into Rd
			//nsel= `RD vsel= `C write= 1 loadc= 0, else= before -> Clk
			{`instrLast, `ALU, `ADD}: inputData= {`RD, `C, inputData[10:9], 1'b1, inputData[7:5], 1'b0, inputData[3:0]};
			//----------
			//INSTRUCTION 4 //Find the status output of Rn - Shifted Rm
			//read the value of Rm
			//nsel= RM loadir= 0 (write already 0), else= before -> Clk
			{`instrFirst, `ALU, `CMP}: inputData= {`RM, inputData[12:1], 1'b0};
			//put specified reading value in register B
			//loadb= 1 loada= 0, else= before -> Clk
			{`putInB, `ALU, `CMP}: inputData= {inputData[14:11], 2'b01, inputData[8:0]};
			//read value from RN register
			//nsel= `Rn (write already 0) loadb= 0, else= begore -> Clk
			{`readRn, `ALU, `CMP}: inputData= {`RN, inputData[12:10], 1'b0, inputData[8:0]};
			//put specified reading value in A
			//loadb= 0, loada= 1, else= before -> Clk
			{`putInA, `ALU, `CMP}: inputData= {inputData[14:11], 2'b10, inputData[8:0]};
			//do subtraction computations and load in status
			//asel= 0 bsel= 0 loada= 0 loads= 1, else - before -> Clk
			{`instrLast, `ALU, `CMP}: inputData= {inputData[14:11], 1'b0, inputData[9:8], 3'b001, inputData[5:0]};
			//----------
			//INSTRUCTION 5 //Compute Rn ANDed with Shifted Rm and put it in Rd
			//read value from RM register
			//nsel= RM loadir= 0 (write already 0), else= before -> Clk
			{`instrFirst, `ALU, `AND}: inputData= {`RM, inputData[12:1], 1'b0};
			//put specified reading value in register B
			//loadb= 1 loada= 0, else= before -> Clk
			{`putInB, `ALU, `AND}: inputData= {inputData[14:11], 2'b01, inputData[8:0]};
			//read value from RN register
			//nsel= `Rn (write already 0) loadb= 0, else= begore -> Clk
			{`readRn, `ALU, `AND}: inputData= {`RN, inputData[12:10], 1'b0, inputData[8:0]};
			//put specified reading value in A
			//loadb= 0, loada= 1, else= before -> Clk
			{`putInA, `ALU, `AND}: inputData= {inputData[14:11], 2'b10, inputData[8:0]};
			//AND values inside reg A and B and then load it into C
			//bsel= 0 asel= 0 loada= 0 loadc= 1, else= before -> Clk
			{`aluAndOpAndPutInC, `ALU, `AND}: inputData= {inputData[14:11], 1'b0, inputData[9:8], 2'b00, inputData[5], 1'b1, inputData[3:0]};
			//Put Value of C into Rd
			//nsel= `RD vsel= `C loadc= 0 write= 1, else= before -> Clk
			{`instrLast, `ALU, `AND}: inputData= {`RD, `C, inputData[10:9], 1'b1, inputData[7:5], 1'b0, inputData[3:0]};
			//----------
			//INSTRUCTION 6 //Write NOTed shifted value of Rm register into Rd register
			//read value from RM register
			//nsel= RM loadir= 0 (write already 0), else= before -> Clk
			{`instrFirst, `ALU, `MVN}: inputData= {`RM, inputData[12:1], 1'b0};
			//put specified reading value in B
			//loada= 0 loadb= 1, else= before -> Clk
			{`putInB, `ALU, `MVN}: inputData= {inputData[14:11], 2'b01, inputData[8:0]};
			//Add A and Shifted B values and put into register C -> Clk
			//bsel= 0 asel= 1 loadb= 0 loadc= 1, else= before -> Clk
			{`aluNotMovOpAndPutInC, `ALU, `MVN}: inputData= {inputData[14:10], 1'b0, inputData[8], 2'b10, inputData[5], 1'b1, inputData[3:0]};
			//Put value of C into Rd register
			//nsel= `RD vsel= `C loadc= 0 write= 1, else= before -> Clk
			{`instrLast, `ALU, `MVN}: inputData= {`RD, `C, inputData[10:9], 1'b1, inputData[7:5], 1'b0, inputData[3:0]};
			//----------
			//INSTRUCTION 7 //load memory from address specified by Rn + imm5 nad put it into RD
			//read value from RN register
			//nsel= `Rn (write already 0) loadir= 0, else= begore -> Clk
			{`instrFirst, `LDR, `ADD}: inputData= {`RN, inputData[12:1], 1'b0};
			//put specified reading value in A
			//loadb= 0, loada= 1, else= before -> Clk
			{`putInA, `LDR, `ADD}: inputData= {inputData[14:11], 2'b10, inputData[8:0]};
			//load computed effective address into C
			//bsel= 1 asel= 0 loada= 0 loadc= 1, else= before -> Clk
			{`aluMemLoadOpAndPutInC, `LDR, `ADD}: inputData= {inputData[14:11], 1'b0, inputData[9:8], 2'b01, inputData[5], 1'b1, inputData[3:0]};
			//load address into Ram and put mdata from RAM output into register RD
			//msel= 1 mwrite= 0 loadc = 0, else= before -> Clk
			{`loadReadAddress, `LDR, `ADD}: inputData= {inputData[14:5], 1'b0, inputData[3], 2'b10, inputData[0]};
			//Put mdata into register Rd
			//nsel= `RD, vsel= `MDATA, write=1, else = before -> Clk
			{`instrLast, `LDR, `ADD}: inputData= {`RD, `MDATA, inputData[10:9], 1'b1, inputData[7:0]};
			//----------
			//INSTRUCTION 8 //store value of register Rd into memory at address= sximm5+Rn
			//read value from RN register
			//nsel= `Rn (write already 0) loadir= 0, else= before -> Clk
			{`instrFirst, `STR, `ADD}: inputData= {`RN, inputData[12:1], 1'b0};
			//put specified reading value in A
			//loadb= 0, loada= 1, else= before -> Clk
			{`putInA, `STR, `ADD}: inputData= {inputData[14:11], 2'b10, inputData[8:0]};
			//load computed effective address into C
			//bsel= 1 asel= 0 loada=0 loadc= 1, else= before -> Clk
			{`aluMemStoreOpAndPutInC, `STR, `ADD}: inputData= {inputData[14:11], 1'b0, inputData[9:8], 2'b01, inputData[5], 1'b1, inputData[3:0]};
			//read value from RD register
			//nsel= `RD loadc=0, else= before -> Clk
			{`readRd, `STR, `ADD}: inputData= {`RD, inputData[12:5], 1'b0, inputData[3:0]};
			//put specified reading value in B
			//loada= 0 loadb= 1, else= before -> Clk
			{`putInB, `STR, `ADD}: inputData= {inputData[14:11], 2'b01, inputData[8:0]};
			//update value in B with address from C into RAM
			//mwrite= 1 msel= 1 loadb = 0, else= before -> Clk
			{`instrLast, `STR, `ADD}: inputData= {inputData[14:10], 1'b0, inputData[8:3], 2'b11, inputData[0]};
		endcase
	end
	always @(*) begin
		casex({currentState, opcode, op})
			//Counters and first and last parts of instructions
			//Set counter to zero for initial or reset state
			{`initiatePC, `opCodeNone, `operationNone}: nextStateToBeUpdated= `loadRAM;
			//Loading Instruction and Counter
			{`loadPC, `opCodeNone, `operationNone}:	nextStateToBeUpdated= `loadRAM;
			{`loadRAM, `opCodeNone, `operationNone}: nextStateToBeUpdated= `loadIR;
			//When instruction loaded, move into first part of instruction
			{`loadIR, `opCodeNone, `operationNone}: nextStateToBeUpdated= `instrFirst;
			//When last part of instruction executed, counter+1 to load next instruction
			{`instrLast, `opCodeNone, `operationNone}: nextStateToBeUpdated= `loadPC;
			//----------
			//INSTRUCTION 1
			{`instrFirst, `MOV, `AND}: nextStateToBeUpdated= `loadPC;
			//----------
			//INSTRUCTION 2
			{`instrFirst, `MOV, `ADD}: nextStateToBeUpdated= `putInB;
			{`putInB, `MOV, `ADD}: nextStateToBeUpdated= `aluMovOpAndPutInC;
			{`aluMovOpAndPutInC, `MOV, `ADD}: nextStateToBeUpdated= `instrLast;
			//----------
			//INSTRUCTION 3
			{`instrFirst, `ALU, `ADD}:  nextStateToBeUpdated= `putInB;
			{`putInB, `ALU, `ADD}: nextStateToBeUpdated= `readRn;
			{`readRn, `ALU, `ADD}: nextStateToBeUpdated= `putInA;
			{`putInA, `ALU, `ADD}: nextStateToBeUpdated= `aluAddOpAndPutInC;
			{`aluAddOpAndPutInC, `ALU, `ADD}: nextStateToBeUpdated= `instrLast;
			//----------
			//INSTRUCTION 4 //Find the status output of Rn - Shifted Rm
			{`instrFirst, `ALU, `CMP}: nextStateToBeUpdated= `putInB;
			{`putInB, `ALU, `CMP}: nextStateToBeUpdated= `readRn;
			{`readRn, `ALU, `CMP}: nextStateToBeUpdated= `putInA;
			{`putInA, `ALU, `CMP}: nextStateToBeUpdated= `instrLast;
			//----------
			//INSTRUCTION 5 //Compute Rn ANDed with Shifted Rm and put it in Rd
			{`instrFirst, `ALU, `AND}: nextStateToBeUpdated= `putInB;
			{`putInB, `ALU, `AND}: nextStateToBeUpdated= `readRn;
			{`readRn, `ALU, `AND}: nextStateToBeUpdated= `putInA;
			{`putInA, `ALU, `AND}: nextStateToBeUpdated= `aluAndOpAndPutInC;
			{`aluAndOpAndPutInC, `ALU, `AND}: nextStateToBeUpdated= `instrLast;
			//----------
			//INSTRUCTION 6 //Write NOTed shifted value of Rm register into Rd register
			{`instrFirst, `ALU, `MVN}: nextStateToBeUpdated= `putInB;
			{`putInB, `ALU, `MVN}: nextStateToBeUpdated= `aluNotMovOpAndPutInC;
			{`aluNotMovOpAndPutInC, `ALU, `MVN}: nextStateToBeUpdated= `instrLast;
			//----------
			//INSTRUCTION 7 //load memory from address specified by Rn + imm5 nad put it into RD
			{`instrFirst, `LDR, `ADD}: nextStateToBeUpdated= `putInA;
			{`putInA, `LDR, `ADD}: nextStateToBeUpdated= `aluMemLoadOpAndPutInC;
			{`aluMemLoadOpAndPutInC, `LDR, `ADD}: nextStateToBeUpdated= `loadReadAddress;
			{`loadReadAddress, `LDR, `ADD}: nextStateToBeUpdated= `instrLast;
			//----------
			//INSTRUCTION 8 //store value of register Rd into memory at address= sximm5+Rn
			{`instrFirst, `STR, `ADD}: nextStateToBeUpdated= `putInA;
			{`putInA, `STR, `ADD}: nextStateToBeUpdated= `aluMemStoreOpAndPutInC;
			{`aluMemStoreOpAndPutInC, `STR, `ADD}: nextStateToBeUpdated= `readRd;
			{`readRd, `STR, `ADD}: nextStateToBeUpdated= `putInB;
			{`putInB, `STR, `ADD}: nextStateToBeUpdated= `instrLast;
		endcase
	end
endmodule