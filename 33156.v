module hmac_postscrypt(input clk, input doWork,  input [7:0] in[0:127], input [31:0] job, input [31:0] nonce, input[31:0] pad[0:7] , output reg[7:0] resultOut[0:31], output reg[31:0] resultJobOut, output reg[31:0] resultNonceOut, output reg resultAvailable);
	//unroll parameter
	parameter unroll = 4;
	//sha initial digest constant
	wire [31:0] H [0:7];
	//initial digest (sha state)
	assign H = '{32'h6a09e667, 32'hbb67ae85, 32'h3c6ef372, 32'ha54ff53a, 32'h510e527f, 32'h9b05688c, 32'h1f83d9ab, 32'h5be0cd19};
	//actual work registers
	reg[7:0] workBuffer[0:127];
	reg[7:0] workFirstPart[0:63];
	reg[7:0] workSecondPart[0:63];
	reg[31:0] midstate[0:7];
	//signals that there is task to be scheduled
	reg scheduleTask;
	//interconnection wires and regs for first pipeline follow
	//task state wire and reg
	reg[31:0] stateOut;
	wire[31:0] stateIn;
	//digest wires and registers
	reg[31:0] digestOut[0:7];
	reg[31:0] padOut[0:7];
	reg[31:0] digestOutOriginal[0:7];
	wire [31:0] digestIn [0:7];
	wire [31:0] padIn [0:7];
	wire [31:0] digestInOriginal [0:7];
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
	hmac_pipeline #(unroll) hmacp(clk,  stateOut, digestOut, digestOutOriginal, wordsOut, jobOut, nonceOut, padOut, digestIn, digestInOriginal, wordsIn, stateIn, jobIn, nonceIn, padIn);
	//work was scheduled to pipeline, so drop it
	wire dropWork = pipelineReady & workAvailable;
	wire[7:0] queuedWork[0:127];
	wire [31:0] queuedPad [0:7];
	wire [31:0] queuedJob;
	wire [31:0] queuedNonce;
	wire workAvailable;
	//in the middle of process, we need to store digest for some time -> queue it
	wire[31:0] midDigestOut[0:7];
	hmacqueue #(.elementWidth(32), .elementCount(8), .depth(8)) dq(clk, blockPaddingReady, opadPartReady, newDigest, midDigestOut);
	//we need to know block data later in computation process, so store it to queue
	hmacqueue #(.elementWidth(8), .elementCount(64), .depth(8)) ws1(clk, doWork, ipadPartReady, in[0:63], workFirstPart);
	hmacqueue #(.elementWidth(8), .elementCount(64), .depth(8)) ws2(clk, doWork, firstBlockPartReady, in[64:127], workSecondPart);
	//queues/buffers work from scrypt mix (just in case there will be more inputs)
	hmacqueue_packed #(.elementWidth(32), .depth(8)) jq(clk, doWork, dropWork, job, queuedJob);
	hmacqueue_packed #(.elementWidth(32), .depth(8)) nq(clk, doWork, dropWork, nonce, queuedNonce);
	hmacqueue #(.elementWidth(32), .elementCount(8), .depth(8)) pq(clk, doWork, dropWork, pad, queuedPad, workAvailable);
	//combinationals needed to assemble new data to hash (paddings, nonces...)
	wire[7:0] blockPadding[0:63];
	wire[7:0] midDigestPadding[0:63];
	wire [31:0] newDigest[0:7];
	always @(*) begin
		//new digest, needed usually in each stage of computation
		for(int i =0; i < 8; i++) begin
			newDigest[i] = (digestIn[i] + digestInOriginal[i]);
		end
		//ipad and block padding
		blockPadding[0] = 0;
		blockPadding[1] = 0;
		blockPadding[2] = 0;
		blockPadding[3] = 1;
		blockPadding[4] = 128;
		for(int i =5; i < 60; i++) begin
			blockPadding[i] = 0;
		end
		blockPadding[60] = 0;
		blockPadding[61] = 0;
		blockPadding[62] = 6;
		blockPadding[63] = 32;
		//opad and first part digest padding
		for(int i =0; i < 8; i++) begin
			midDigestPadding[i*4 + 3] = midDigestOut[i];
			midDigestPadding[i*4 + 2] = (midDigestOut[i] >>> 8);
			midDigestPadding[i*4 + 1] = (midDigestOut[i] >>> 16);
			midDigestPadding[i*4] = (midDigestOut[i] >>> 24);
		end
		midDigestPadding[32] = 128;
		for(int i =33; i < 60; i++) begin
			midDigestPadding[i] = 0;
		end
		midDigestPadding[60] = 0;
		midDigestPadding[61] = 0;
		midDigestPadding[62] = 3;
		midDigestPadding[63] = 0;
	end
	//some state vars, just to be easily readable
	wire pipelineWorkIn = stateIn[31];
	wire pipelineReady = ~pipelineWorkIn | resultReady;
	//translate states to something more readable
	wire ipadPartReady = (stateIn[15:0] == 64);
	wire firstBlockPartReady = (stateIn[15:0] == 128);
	wire secondBlockPartReady = (stateIn[15:0] == 192);
	wire blockPaddingReady = (stateIn[15:0] == 256);
	wire opadPartReady = (stateIn[15:0] == 320);
	wire resultReady = (stateIn[15:0] == 384);
	always@(posedge clk) begin
		if(pipelineReady) begin
			if(workAvailable) begin
				//now we can schedule new task, there is something to do! :) as always in life!
				//--> concatenation
				for(int i =0; i<8; i++) begin
					wordsOut[i] <= queuedPad[i] ^ 32'h36363636;
					wordsOut[8+i] <= 32'h36363636;
				end
				//set state variables
				stateOut[31] <= 1;
				stateOut[15:0] <= 0;
				//set up other job infos
				jobOut <= queuedJob;
				nonceOut <= queuedNonce;
				padOut <= queuedPad;
				//set initial digest
				digestOut <= H;
				digestOutOriginal <= H;
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
				for(int i =0; i<8; i++) begin
					padOut[i] <= 0;
				end
			end
		end
		if(pipelineWorkIn) begin
			if(ipadPartReady) begin
				//first sha is complete (sha from ipad from first prescrypt hmac part),
				//use its digest and scrypt output block data as next input
				digestOut <= newDigest;
				digestOutOriginal <= newDigest;
				//continue shifting other states
				padOut <= padIn;
				jobOut <= jobIn;
				nonceOut <= nonceIn;
				stateOut <= stateIn;
				//set up words.
				//concatenate some bytes, could be written also like {x,x,x,x}, but copiler result is the same anyway
				//work is from first shift
				for(int i =0; i<16; i++) begin
					wordsOut[i] <= (workFirstPart[4*i] <<< 24) | (workFirstPart[4*i + 1] <<< 16) | (workFirstPart[4*i + 2] <<< 8) | (workFirstPart[4*i + 3]);
				end
			end  else if(firstBlockPartReady) begin
				//first sha is complete, use its final digest and info as input for second sha pipeline
				digestOut <= newDigest;
				digestOutOriginal <= newDigest;
				//set states
				padOut <= padIn;
				jobOut <= jobIn;
				nonceOut <= nonceIn;
				stateOut <= stateIn;
				//set up words
				//concatenate next work part, work from second longer shift
				for(int i =0; i<16; i++) begin
					wordsOut[i] <= (workSecondPart[4*i] <<< 24) | (workSecondPart[4*i + 1] <<< 16) | (workSecondPart[4*i + 2] <<< 8) | (workSecondPart[4*i + 3]);
				end
			end else if(secondBlockPartReady) begin
				//second block digest ready, finish padding
				digestOut <= newDigest;
				digestOutOriginal <= newDigest;
				//continue shifting other states
				padOut <= padIn;
				jobOut <= jobIn;
				nonceOut <= nonceIn;
				stateOut <= stateIn;
				//set up words.
				//concatenate some stages
				for(int i =0; i<16; i++) begin
					wordsOut[i] <= (blockPadding[4*i] <<< 24) | (blockPadding[4*i + 1] <<< 16) | (blockPadding[4*i + 2] <<< 8) | (blockPadding[4*i + 3]);
				end
			end else if(blockPaddingReady) begin
				//second part of hmac, reset digest, process opad
				digestOut <= H;
				digestOutOriginal <= H;
				//continue shifting other states
				padOut <= padIn;
				jobOut <= jobIn;
				nonceOut <= nonceIn;
				stateOut <= stateIn;
				//set up opad words.
				//create opad and set up words from it
				for(int i =0; i < 8; i++) begin
					wordsOut[i] <= padIn[i] ^ 32'h5C5C5C5C;
					wordsOut[8+i] <= 32'h5C5C5C5C;
				end
			end else if(opadPartReady) begin
				//opad hashed, and now finally process padded digest from middle stage
				digestOut <= newDigest;
				digestOutOriginal <= newDigest;
				//set state variables
				padOut <= padIn;
				jobOut <= jobIn;
				nonceOut <= nonceIn;
				stateOut <= stateIn;
				//set up final words.
				//concatenate mid digest to form new words
				for(int i =0; i<16; i++) begin
					wordsOut[i] <= (midDigestPadding[4*i] <<< 24) | (midDigestPadding[4*i + 1] <<< 16) | (midDigestPadding[4*i + 2] <<< 8) | (midDigestPadding[4*i + 3]);
				end
			end else if(resultReady) begin
				//result is ready, whole cycle finished
				for(int i =0; i < 8; i++) begin
					resultOut[i*4 + 3] <= newDigest[i];
					resultOut[i*4 + 2] <= (newDigest[i] >>> 8);
					resultOut[i*4 + 1] <= (newDigest[i] >>> 16);
					resultOut[i*4] <= (newDigest[i] >>> 24);
				end
				resultJobOut <= jobIn;
				resultNonceOut <= nonceIn;
			end else begin
				//some middle phase, continue mixing
				wordsOut <= wordsIn;
				digestOut <= digestIn;
				digestOutOriginal <= digestInOriginal;
				stateOut <= stateIn;
				jobOut <= jobIn;
				nonceOut <= nonceIn;
				padOut <= padIn;
			end
		end
		//signal result available
		resultAvailable <= resultReady;
	end
endmodule