module Crc
eth_crc crcrx (.Clk(MRxClk), .Reset(Reset), .Data(Data_Crc), .Enable(Enable_Crc), .Initialize(Initialize_Crc),
               .Crc(Crc), .CrcError(CrcError)
              );
// Latching CRC for use in the hash table
always @ (posedge MRxClk)
begin
  CrcHashGood <= #Tp StateData[0] & ByteCntEq6;
end
always @ (posedge MRxClk)
begin
  if(Reset | StateIdle)
    CrcHash[5:0] <= #Tp 6'h0;
  else
  if(StateData[0] & ByteCntEq6)
    CrcHash[5:0] <= #Tp Crc[31:26];
end
// Output byte stream
always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    begin
      RxData_d[7:0]      <= #Tp 8'h0;
      DelayData          <= #Tp 1'b0;
      LatchedByte[7:0]   <= #Tp 8'h0;
      RxData[7:0]        <= #Tp 8'h0;
    end
  else
    begin
      LatchedByte[7:0]   <= #Tp {MRxD[3:0], LatchedByte[7:4]};  // Latched byte
      DelayData          <= #Tp StateData[0];
      if(GenerateRxValid)
        RxData_d[7:0] <= #Tp LatchedByte[7:0] & {8{|StateData}};  // Data goes through only in data state
      else
      if(~DelayData)
        RxData_d[7:0] <= #Tp 8'h0;                                // Delaying data to be valid for two cycles. Zero when not active.
      RxData[7:0] <= #Tp RxData_d[7:0];                           // Output data byte
    end
end
always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    Broadcast <= #Tp 1'b0;
  else
    begin
      if(StateData[0] & ~(&LatchedByte[7:0]) & ByteCntSmall7)
        Broadcast <= #Tp 1'b0;
      else
      if(StateData[0] & (&LatchedByte[7:0]) & ByteCntEq1)
        Broadcast <= #Tp 1'b1;
      else
      if(RxAbort | RxEndFrm)
        Broadcast <= #Tp 1'b0;
    end
end
always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    Multicast <= #Tp 1'b0;
  else
    begin
      if(StateData[0] & ByteCntEq1 & LatchedByte[0])
        Multicast <= #Tp 1'b1;
      else if(RxAbort | RxEndFrm)
      Multicast <= #Tp 1'b0;
    end
end
assign GenerateRxValid = StateData[0] & (~ByteCntEq0 | DlyCrcCnt >= 4'h3);
always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    begin
      RxValid_d <= #Tp 1'b0;
      RxValid   <= #Tp 1'b0;
    end
  else
    begin
      RxValid_d <= #Tp GenerateRxValid;
      RxValid   <= #Tp RxValid_d;
    end
end
assign GenerateRxStartFrm = StateData[0] & (ByteCntEq1 & ~DlyCrcEn | DlyCrcCnt == 4'h3 & DlyCrcEn);
always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    begin
      RxStartFrm_d <= #Tp 1'b0;
      RxStartFrm   <= #Tp 1'b0;
    end
  else
    begin
      RxStartFrm_d <= #Tp GenerateRxStartFrm;
      RxStartFrm   <= #Tp RxStartFrm_d;
    end
end
assign GenerateRxEndFrm = StateData[0] & (~MRxDV & ByteCntGreat2 | ByteCntMaxFrame);
assign DribbleRxEndFrm  = StateData[1] &  ~MRxDV & ByteCntGreat2;
always @ (posedge MRxClk or posedge Reset)
begin
  if(Reset)
    begin
      RxEndFrm_d <= #Tp 1'b0;
      RxEndFrm   <= #Tp 1'b0;
    end
  else
    begin
      RxEndFrm_d <= #Tp GenerateRxEndFrm;
      RxEndFrm   <= #Tp RxEndFrm_d | DribbleRxEndFrm;
    end
end
endmodule