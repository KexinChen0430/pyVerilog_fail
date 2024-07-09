module Clock
  #(COUNT_HALF_CYCLE = 26'd49999999,
    COUNT_BIT_WIDTH = 26)
   (input      baseClock,
    input      reset,
    output reg derivClock);
   reg [COUNT_BIT_WIDTH - 1:0] halfCycleCount; // 周期の半分をカウントするためのカウンタ
   wire isPassedHalfCycle = (halfCycleCount == COUNT_HALF_CYCLE);  // 周期の半分経過時の信号
   // 周期の半分をカウントし、カウントアップ完了時に、clockの0と1を切り替える。
   // (周期的なクロック信号ができる)
   always @(posedge baseClock) begin
      if (reset) begin
	halfCycleCount <= 1'b0;
	derivClock <= 1'b0;
      end
      else if (isPassedHalfCycle) begin
	halfCycleCount <= 1'b0;
	derivClock <= ~derivClock;
      end
      else
	halfCycleCount <= halfCycleCount + 1'b1;
   end;
endmodule