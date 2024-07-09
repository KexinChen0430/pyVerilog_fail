module do?
					//133 times, read in word from FIFO
						//16 times inside that, process each bit in the word
							//16 times inside that, shift out the current bit with whatever compensation it requires
					//writeGate <= 1; //TODO Testing to ensure no writes occure
					if(curSPIBit == 15) begin
						FIFOReadEnable <= 1;//We are going to be reading from the FIFO next clock
					end
					compensatedWriteDataToDriveCount <= compensatedWriteDataToDriveCount + 1;
					writeData <= compensatedWriteDataToDrive[15];
					if(compensatedWriteDataToDriveCount == 0) begin
						SPIWriteWordCounter <= SPIWriteWordCounter + 1;
						writeDataPipeline <= {writeDataPipeline[2:0], SPICommandWord[curSPIBit]};
						curSPIBit <= curSPIBit + 1;
						casez (writeDataPipeline)//Bits [3] and [2] were previously written, bit [1] is the current bit to write and bit [0] is the next bit
							//The [1] bit is expanded to the full 65MHz clock time via compensatedWriteDataToDrive to simplify writing and accomplish peak shifting (see RL02 Theory Of Operation)
							4'b0000:
								if(SPICommandWord[curSPIBit]) begin //If our next bit is a one
									compensatedWriteDataToDrive <= 16'b0000111111111110;//0111 (becomes 10) with Write Early
								end else begin
									compensatedWriteDataToDrive <= 16'b0000111111111111;//0111 (becomes 10)
								end
							4'b0001:
								compensatedWriteDataToDrive <= 16'b0000111111111111;//0111 (becomes 10) (NOTE: This is a data pattern requiring shifting, but we accomplish it via the 0000 and 1000 conditionals because you can't go back in time (not even you DEC)
							4'bz010:
								compensatedWriteDataToDrive <= 16'b1111111100001111;//1101 (becomes 01)
							4'bz011:
								compensatedWriteDataToDrive <= 16'b1111111110000111;//1101 (becomes 01) with Write Late
							4'bz10z:
								compensatedWriteDataToDrive <= 16'b1111111111111111;//1111 (becomes 00)
							4'bz110:
								compensatedWriteDataToDrive <= 16'b1111111000011111;//1101 (becomes 01) with Write Early
							4'bz111:
								compensatedWriteDataToDrive <= 16'b1111111100001111;//1101 (becomes 01)
							4'b1000:
								if(SPICommandWord[curSPIBit]) begin //If our next bit is a one
									compensatedWriteDataToDrive <= 16'b1000011111111110;//0111 (becomes 10) with Write Late and Write Early
								end else begin
									compensatedWriteDataToDrive <= 16'b1000011111111111;//0111 (becomes 10) with Write Late
								end
							4'b1001:
								compensatedWriteDataToDrive <= 16'b0000111111111111;//0111 (becomes 10)
						endcase
					end else begin
						compensatedWriteDataToDrive <= compensatedWriteDataToDrive<<1;
					end
					if(SPIWriteWordCounter > 133) begin
						SPIWriteWordCounter <= 8'b0;
						FIFOReadEnable <= 0;
						curSPIBit <= 4'b0;
						writeGate <= 0;
						compensatedWriteDataToDrive <= 16'b1111111111111111;
						inhibit_read <= 0;
						cnc_state <= CNC_IDLE;
					end
				end
				default:
					cnc_state <= CNC_IDLE;
			endcase
		end
	end
endmodule