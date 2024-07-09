module
                .writenum(writenum),
                .write(write),
                .mdata(mdata),
		.sximm5(sximm5),
		.sximm8(sximm8),
                // outputs
                .status(LEDR[9:7]),
		.B(B),
		.C(C)
                );
        decoder decoderInstantiate(
                .instruction(instruction),
                .nsel(nsel),
                .opcode(opcode),
                .readnum(readnum),
                .writenum(writenum),
                .ALUop(ALUop),
                .op(op),
                .shift(shift),
                .sximm5(sximm5),
                .sximm8(sximm8)
                );
        instructionReg instrRegInstantiate(
                .clk(~KEY[0]),
                .mdata(mdata),
                .loadir(loadir),
                .instruction(instruction)
                );
        RAM #(16,8,"data.txt") RAMInstantiate(
                .clk(~KEY[0]),
                .readAddress(address),
                .writeAddress(address),
                .mwrite(mwrite),
                .in(B),                 //B is what is being written in
                .out(mdata)             //output is both instructions as well as values in the addresses
                );
        counter counterInstantiate(
                .clk(~KEY[0]),
                .reset(~KEY[1]),
                .loadpc(loadpc),
                .msel(msel),
                .C(C),
                .address(address) //output of counter is the read address
                );
        controller controllerInstantiate(
        .clk(~KEY[0]),
        .ALUop(ALUop),
        .op(op),
        .shift(shift),
        .opcode(opcode),
        .readnum(readnum),
        .writenum(writenum),
        .loada(loada),
        .loadb(loadb),
        .write(write),
        .asel(asel),
        .bsel(bsel),
        .loadc(loadc),
        .loads(loads),
        .reset(~KEY[1]),
        .loadpc(loadpc),
        .msel(msel),
        .mwrite(mwrite),
        .loadir(loadir),
        .nsel(nsel),
        .vsel(vsel)
        );
        // assigned HEX display to datapath_out values
     //   HEXDisplay HEX0Instantiate(datapath_out[3:0], HEX0);
     //   HEXDisplay HEX1Instantiate(datapath_out[7:4], HEX1);
     //   HEXDisplay HEX2Instantiate(datapath_out[11:8], HEX2);
     //   HEXDisplay HEX3Instantiate(datapath_out[15:12], HEX3);
     //   assign HEX4 = 7'b1111111;  // disabled
      //  assign HEX5 = 7'b1111111;  // disabled
endmodule