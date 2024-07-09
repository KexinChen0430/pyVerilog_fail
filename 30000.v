module tb;
    reg [13:0] WrAddress = 14'b0;
    reg [13:0] RdAddress = 14'b0;
    reg [7:0] Data = 8'b0;
    reg WE = 0;
    reg RdClock = 0;
    reg RdClockEn = 0;
    reg Reset = 0;
    reg WrClock = 0;
    reg WrClockEn = 0;
    wire [7:0] Q;
    integer i0 = 0, i1 = 0, i2 = 0, i3 = 0, i4 = 0, i5 = 0, i6 = 0, i7 = 0, i8 = 0, i9 = 0;
    GSR GSR_INST (.GSR(1'b1));
    PUR PUR_INST (.PUR(1'b1));
    ram u1 (.WrAddress(WrAddress), .RdAddress(RdAddress), .Data(Data), .WE(WE),
        .RdClock(RdClock), .RdClockEn(RdClockEn), .Reset(Reset), .WrClock(WrClock),
        .WrClockEn(WrClockEn), .Q(Q)
    );
    initial
    begin
       WrAddress <= 0;
      #100;
      @(Reset == 1'b0);
      for (i1 = 0; i1 < 32774; i1 = i1 + 1) begin
        @(posedge WrClock);
        #1  WrAddress <= WrAddress + 1'b1;
      end
    end
    initial
    begin
       RdAddress <= 0;
      #100;
      @(Reset == 1'b0);
      for (i2 = 0; i2 < 32774; i2 = i2 + 1) begin
        @(posedge RdClock);
        #1  RdAddress <= RdAddress + 1'b1;
      end
    end
    initial
    begin
       Data <= 0;
      #100;
      @(Reset == 1'b0);
      for (i3 = 0; i3 < 16387; i3 = i3 + 1) begin
        @(posedge WrClock);
        #1  Data <= Data + 1'b1;
      end
    end
    initial
    begin
       WE <= 1'b0;
      @(Reset == 1'b0);
      for (i4 = 0; i4 < 16387; i4 = i4 + 1) begin
        @(posedge WrClock);
        #1  WE <= 1'b1;
      end
       WE <= 1'b0;
    end
    always
    #5.00 RdClock <= ~ RdClock;
    initial
    begin
       RdClockEn <= 1'b0;
      #100;
      @(Reset == 1'b0);
       RdClockEn <= 1'b1;
    end
    initial
    begin
       Reset <= 1'b1;
      #100;
       Reset <= 1'b0;
    end
    always
    #5.00 WrClock <= ~ WrClock;
    initial
    begin
       WrClockEn <= 1'b0;
      #100;
      @(Reset == 1'b0);
       WrClockEn <= 1'b1;
    end
endmodule