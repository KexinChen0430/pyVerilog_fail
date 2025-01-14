module
// These ports are within 'wrClk' domain
input wrClk;
input rstSyncToWrClk;
input [FIFO_WIDTH-1:0] dataIn;
input fifoWEn;
input forceEmptySyncToWrClk;
output fifoFull;
// These ports are within 'rdClk' domain
input rdClk;
input rstSyncToRdClk;
output [FIFO_WIDTH-1:0] dataOut;
input fifoREn;
input forceEmptySyncToRdClk;
output fifoEmpty;
output [15:0]numElementsInFifo; //note that this implies a max fifo depth of 65536
wire wrClk;
wire rdClk;
wire rstSyncToWrClk;
wire rstSyncToRdClk;
wire [FIFO_WIDTH-1:0] dataIn;
reg [FIFO_WIDTH-1:0] dataOut;
wire fifoWEn;
wire fifoREn;
reg fifoFull;
reg fifoEmpty;
wire forceEmpty;
reg  [15:0]numElementsInFifo;
// local registers
reg  [ADDR_WIDTH:0]bufferInIndex;
reg  [ADDR_WIDTH:0]bufferInIndexSyncToRdClk;
reg  [ADDR_WIDTH:0]bufferOutIndex;
reg  [ADDR_WIDTH:0]bufferOutIndexSyncToWrClk;
reg  [ADDR_WIDTH-1:0]bufferInIndexToMem;
reg  [ADDR_WIDTH-1:0]bufferOutIndexToMem;
reg  [ADDR_WIDTH:0]bufferCnt;
reg  fifoREnDelayed;
wire [FIFO_WIDTH-1:0] dataFromMem;
always @(posedge wrClk)
begin
  bufferOutIndexSyncToWrClk <= bufferOutIndex;
  if (rstSyncToWrClk == 1'b1 || forceEmptySyncToWrClk == 1'b1)
  begin
    fifoFull <= 1'b0;
    bufferInIndex <= 0;
  end
    else
    begin
      if (fifoWEn == 1'b1) begin
        bufferInIndex <= bufferInIndex + 1'b1;
      end
      if ((bufferOutIndexSyncToWrClk[ADDR_WIDTH-1:0] == bufferInIndex[ADDR_WIDTH-1:0]) &&
          (bufferOutIndexSyncToWrClk[ADDR_WIDTH] != bufferInIndex[ADDR_WIDTH]) )
        fifoFull <= 1'b1;
      else
        fifoFull <= 1'b0;
    end
end
always @(bufferInIndexSyncToRdClk or bufferOutIndex)
  bufferCnt <= bufferInIndexSyncToRdClk - bufferOutIndex;
always @(posedge rdClk)
begin
  numElementsInFifo <= { {16-ADDR_WIDTH+1{1'b0}}, bufferCnt }; //pad bufferCnt with leading zeroes
  bufferInIndexSyncToRdClk <= bufferInIndex;
  if (rstSyncToRdClk == 1'b1 || forceEmptySyncToRdClk == 1'b1)
  begin
    fifoEmpty <= 1'b1;
    bufferOutIndex <= 0;
    fifoREnDelayed <= 1'b0;
  end
    else
    begin
      fifoREnDelayed <= fifoREn;
      if (fifoREn == 1'b1 && fifoREnDelayed == 1'b0) begin
        dataOut <= dataFromMem;
        bufferOutIndex <= bufferOutIndex + 1'b1;
      end
      if (bufferInIndexSyncToRdClk == bufferOutIndex)
        fifoEmpty <= 1'b1;
      else
        fifoEmpty <= 1'b0;
    end
end
always @(bufferInIndex or bufferOutIndex) begin
  bufferInIndexToMem <= bufferInIndex[ADDR_WIDTH-1:0];
  bufferOutIndexToMem <= bufferOutIndex[ADDR_WIDTH-1:0];
end
dpMem_dc #(FIFO_WIDTH, FIFO_DEPTH, ADDR_WIDTH)  u_dpMem_dc (
  .addrIn(bufferInIndexToMem),
  .addrOut(bufferOutIndexToMem),
  .wrClk(wrClk),
  .rdClk(rdClk),
  .dataIn(dataIn),
  .writeEn(fifoWEn),
  .readEn(fifoREn),
  .dataOut(dataFromMem));
endmodule