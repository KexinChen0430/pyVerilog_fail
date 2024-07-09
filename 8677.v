module sha256(input clk, input [7:0] in[0:79], input [31:0] job, input doWork, output reg[7:0] resultOut[0:31], output reg[31:0] resultJobOut, output reg[31:0] resultNonceOut, output reg resultAvailable);
	//unroll parameter
	parameter unroll = 4;
	//sha initial digest constant
	wire [31:0] H [0:7];
	//initial digest (sha state)
	assign H = '{32'h6a09e667, 32'hbb67ae85, 32'h3c6ef372, 32'ha54ff53a, 32'h510e527f, 32'h9b05688c, 32'h1f83d9ab, 32'h5be0cd19};
	//actual work registers
	reg[7:0] workBuffer[0:79];
	reg[31:0] currentJob;
	reg midstateReady;
	reg[31:0] midstate[0:7];
	//signals that there is task to be scheduled
	reg scheduleTask;
	//interconnection wires and regs for first pipeline follow
	//task state wire and reg
	reg[31:0] stateOut;
	wire[31:0] stateIn;
	//digest wires and registers
	reg[31:0] digestOut[0:7];
	reg[31:0] digestOutOriginal[0:7];
	wire [31:0] digestIn [0:7];
	wire [31:0] digestInOriginal [0:7];
	//wires for first phase midstate computation
	//second part with 12 header bytes + nonce and padding
	wire[7:0] firstStageSecondPart[0:63];
	wire[7:0] dataIn[0:63];
	//used for words
	reg[31:0] wordsOut[0:15];
	wire[31:0] wordsIn[0:15];
	//nonce vars
	reg[31:0] nonceOut;
	wire[31:0] nonceIn;
	//job vars
	reg[31:0] jobOut;
	wire[31:0] jobIn;
	//pipeline for first part of computation
	sha_pipeline #(unroll) shap(clk,  stateOut, digestOut, digestOutOriginal, wordsOut, jobOut, nonceOut, digestIn, digestInOriginal, wordsIn, stateIn, jobIn, nonceIn);
	//wires and regs for internal connection with second pipeline
	reg[31:0] stateOutb;
	wire[31:0] stateInb;
	reg[31:0] nonceOutb;
	wire[31:0] nonceInb;
	reg[31:0] digestOutb[0:7];
	wire [31:0] digestInb [0:7];
	reg[31:0] digestOutOriginalb[0:7];
	wire [31:0] digestInOriginalb [0:7];
	reg[31:0] wordsOutb[0:15];
	wire[31:0] wordsInb[0:15];
	reg[31:0] jobOutb;
	wire[31:0] jobInb;
	//pipeline for second part of computation
	sha_pipeline #(unroll) shapb(clk,  stateOutb, digestOutb, digestOutOriginalb, wordsOutb, jobOutb, nonceOutb, digestInb, digestInOriginalb, wordsInb, stateInb, jobInb, nonceInb);
	//put second part of input data to queue, used only at several initial cycles after job submition (midstate is not known)
	shaqueue #(.elementWidth(8), .elementCount(64), .depth(1 + unroll)) fsspq(clk, (firstPipelineReady & scheduleTask & ~midstateReady), midstateStageReady, firstStageSecondPart, dataIn);
	//inputs for each stage
	wire[7:0] stageTwoPadding[0:31];
	//combinationals needed to assemble new data to hash (paddings, nonces...)
	reg[31:0] newNonce;
	wire [31:0] newDigest[0:7];
	always @(*) begin
		for(int i =0; i < 8; i++) begin
			newDigest[i] = (digestIn[i] + digestInOriginal[i]);
		end
		//this is maybe not the best way to set this up, but i find it readable and easy to understand
		firstStageSecondPart[0:11] = workBuffer[64:75];
		//assembly nonce for new sha hashing
		firstStageSecondPart[15] = newNonce;
		firstStageSecondPart[14] = (newNonce >> 8);
		firstStageSecondPart[13] = (newNonce >> 16);
		firstStageSecondPart[12] = (newNonce >> 24);
		//padding to 128 bytes of 80B input (first stage second sha part)
		firstStageSecondPart[16] = 128;
		for(int i =1; i < 46; i++) begin
			firstStageSecondPart[16+i] = 0;
		end
		firstStageSecondPart[62] = 2;
		firstStageSecondPart[63] = 128;
		//padding for second stage input
		stageTwoPadding[0] = 128;
		for(int i =1; i < 30; i++) begin
			stageTwoPadding[i] = 0;
		end
		stageTwoPadding[30] = 1;
		stageTwoPadding[31] = 0;
	end
	//some states to be easilly readable
	wire firstPipelineWorkIn = stateIn[31];
	wire firstStageReady = (stateIn[7:0] == 128);
	wire firstPipelineReady = ~firstPipelineWorkIn | firstStageReady;
	wire firstPipelineResultReady = firstPipelineWorkIn & firstStageReady;
	wire secondPipelineWorkIn = stateInb[31];
	wire secondPipelineResultReady = secondPipelineWorkIn & (stateInb[7:0] == 64);
	wire secondPipelineReady = (~secondPipelineWorkIn | secondPipelineResultReady);
	wire midstateStageReady = (stateIn[7:0] == 64);
	always@(posedge clk) begin
		if(doWork) begin
			//set new data
			workBuffer <= in;
			//set new job
			currentJob <= job;
			//reset nonce
			//concatenation of input bytes in header
			newNonce <= {in[76],in[77],in[78],in[79]};
			//TODO reset queue... seems like it is not needed - jobstate guarantees drops (must test)
			midstateReady <= 0;
			scheduleTask <= 1;
		end
		if(firstPipelineReady) begin
			if(scheduleTask) begin
				//now we can schedule task, there is something to do! :) as always in life!
				if(~midstateReady) begin
					//begining of new work - there is no midstate known
					//midstate is the same result of first 64 bytes part sha transform (because of nonce, which changes, lies at bytes 76-79 [zero index])
					//--> concatenation
					for(int i =0; i<16; i++) begin
						wordsOut[i] <= (workBuffer[4*i] <<< 24) | (workBuffer[4*i + 1] <<< 16) | (workBuffer[4*i + 2] <<< 8) | (workBuffer[4*i + 3]);
					end
					//set state variables
					stateOut[31] <= 1;
					stateOut[7:0] <= 0;
					//set up other job infos
					jobOut <= currentJob;
					nonceOut <= newNonce;
					//increment nonce
					newNonce <= newNonce + 1;
					//we hit end of nonce interval - stop scheduling
					if(newNonce == (32'hffffffff)) begin
						scheduleTask <= 0;
					end
					//set initial digest
					digestOut <= H;
					digestOutOriginal <= H;
				end else begin
					//new work scheduling is in stage, where midstate is known (first sha done)
					stateOut[31] <= 1;
					//set digest from midstate
					digestOut <= midstate;
					digestOutOriginal <= midstate;
					//set job info
					jobOut <= currentJob;
					nonceOut <= newNonce;
					//use data out assembly, that generates new second part of first sha (few bytes from header with changing nonce + padding)
					//this is in fact some kind of concatenation
					for(int i =0; i<16; i++) begin
						wordsOut[i] <= (firstStageSecondPart[4*i] <<< 24) | (firstStageSecondPart[4*i + 1] <<< 16) | (firstStageSecondPart[4*i + 2] <<< 8) | (firstStageSecondPart[4*i + 3]);
					end
					//increment nonce
					newNonce <= newNonce + 1;
					//if we hit end of nonce interval - stop scheduling
					if(newNonce == (32'hffffffff)) begin
						scheduleTask <= 0;
					end
					//we continue from state 64 (midstate known)
					stateOut[7:0] <= 64;
				end
			end else begin
				//otherwise fill pipeline with zeros
				stateOut <= 0;
				jobOut <= 0;
				nonceOut <= 0;
				for(int i = 0; i < 16; i++) begin
					wordsOut[i] <= 0;
				end
				for(int i = 0; i < 8; i++) begin
					digestOut[i] <= 0;
					digestOutOriginal[i] <= 0;
				end
			end
		end
		if(firstPipelineWorkIn) begin
			//this state is possible only at the beginning, when there is no midstate...
			if(midstateStageReady) begin
				//second part of data mix stored in queue
				//concatenate/assemble words variable
				for(int i =0; i<16; i++) begin
					wordsOut[i] <= (dataIn[4*i] <<< 24) | (dataIn[4*i + 1] <<< 16) | (dataIn[4*i + 2] <<< 8) | (dataIn[4*i + 3]);
				end
				//complete digest - add original state/digest (H) to new one and set midstate.
				digestOut <= newDigest;
				midstate <= newDigest;
				digestOutOriginal <= newDigest;
				//continue with second part (from midstate), set job etc.
				stateOut <= stateIn;
				jobOut <= jobIn;
				nonceOut <= nonceIn;
				//mark midstate ready for this job
				midstateReady <= 1;
			end else if(firstStageReady) begin
				//first sha is complete, use its final digest and info as input for second sha pipeline
				digestOutb <= H;
				digestOutOriginalb <= H;
				jobOutb <= jobIn;
				nonceOutb <= nonceIn;
				//set up initial words.
				//concatenate some stages
				for(int i =0; i < 8; i++) begin
					wordsOutb[i] <= newDigest[i];
					wordsOutb[8+i] <= (stageTwoPadding[4*i] <<< 24) | (stageTwoPadding[4*i + 1] <<< 16) | (stageTwoPadding[4*i + 2] <<< 8) | (stageTwoPadding[4*i + 3]);
				end
				//set state variables
				stateOutb[7:0] <= 0;
				stateOutb[31] <= 1;
			end else begin
				//some middle phase, continue mixing
				wordsOut <= wordsIn;
				digestOut <= digestIn;
				digestOutOriginal <= digestInOriginal;
				stateOut <= stateIn;
				jobOut <= jobIn;
				nonceOut <= nonceIn;
			end
		end
		//controls when to clean/discard data in second pipeline
		//second pipe is ready and first one has nothing to schedule...
		if(secondPipelineReady & ~firstPipelineResultReady) begin
			stateOutb <= 0;
			nonceOutb <= 0;
			for(int i = 0; i < 16; i++) begin
				wordsOutb[i] <= 0;
			end
			for(int i = 0; i < 8; i++) begin
				digestOutb[i] <= 0;
				digestOutOriginalb[i] <= 0;
			end
			jobOutb <= 0;
		end
		//if there is some result from second pipeline, process it
		if(secondPipelineResultReady) begin
			//end part of computation - we can signal completed work
			//deconcatenate digest to bytes
			for(int i =0; i < 8; i++) begin
				resultOut[i*4 + 3] <= (digestInb[i] + digestInOriginalb[i]);
				resultOut[i*4 + 2] <= (digestInb[i] + digestInOriginalb[i]) >>> 8;
				resultOut[i*4 + 1] <= (digestInb[i] + digestInOriginalb[i]) >>> 16;
				resultOut[i*4] <= (digestInb[i] + digestInOriginalb[i]) >>> 24;
			end
			resultJobOut <= jobInb;
			resultNonceOut <= nonceInb;
			resultAvailable <= 1;
		end else if(secondPipelineWorkIn) begin
			//otherwise continue in computation
			wordsOutb <= wordsInb;
			nonceOutb <= nonceInb;
			jobOutb <= jobInb;
			digestOutb <= digestInb;
			digestOutOriginalb <= digestInOriginalb;
			stateOutb <= stateInb;
			resultAvailable <= 0;
		end else begin
			//realy, there is no result yet :)
			resultAvailable <= 0;
		end
	end
endmodule