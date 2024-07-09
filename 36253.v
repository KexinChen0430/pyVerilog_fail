module values to PC.
						else begin
							outputMemoryWriteData <= douta;
						end
						//If we just wrote a value to the output memory this cycle, increment the address
						//NOTE : Due to bug described above we write on bit more by using length instead of lengthMinus1
						if(outputMemoryWriteReq == 1  && outputMemoryWriteAck == 1 && outputMemoryWriteAdd != 550) begin
							outputMemoryWriteAdd <= outputMemoryWriteAdd + 1;
							raddr <= raddr + 1;
							memCount <= memCount+1;
							currState <= WRITE;
						end
						//Stop writing and go back to IDLE state if writing reached length of data
						if(outputMemoryWriteReq == 1  && outputMemoryWriteAck == 1 && outputMemoryWriteAdd == 550) begin
							outputMemoryWriteReq <= 0;
							currState <= IDLE;
							userRunClear <= 1;
						end
					end
					else begin
						slowRmemCount <= slowRmemCount + 1;
					end
				end
			endcase
		end
   end
	testPUF #(
		.N_CB(N_CB),
		.CHALLENGE_WIDTH(32),
		.PDL_CONFIG_WIDTH(128),
		.RESPONSE_WIDTH(6)		/*** Make sure these params are added in test_puf **/
		) testPUF(
		/*********** Siam's port variables ********/
	    .clk_1(clk_1), // main clock for FSM
	    .clk_2(clk_2), // its freq is half that of clk_1, for the test 1.2 and 1.3 testing block will receive one input bit for two resonse bits from PUF
	    .clk_RNG(clk_RNG), // its freq is 8 times that of clk_1, challenge bits are generated at a higher rate
		 .rst(RST),  // -TODO- replace this
		 //.start(start), // -TODO - replace this
		 .sw(sw), // -TODO - replace this
	    .mem_we(wea), // write enable for memory
	    .mem_waddr(waddr), // write address for memory
	    .mem_din(dina), // data in for memory
	    //.test_result(test_result),
	    /*********** Praveen's port variables *******/
	   .clk(clk),
		.reset(reset),
		.calb_trigger(challenge_ready),
		.pdl_config(challengeReg),
		.pc_challenge(pc_challenge[31:0]),
		.done(response_ready),
		.raw_response(responseReg[5:0]),
		.calibrate(calibrate),		// Tells if puf in calib mode or not
		.read_temp(read_temp),		// Tells the test to do a temperature test
		.test_start(test_start),
		.test_done(test_done),
		.LED(LED)
	 );
endmodule