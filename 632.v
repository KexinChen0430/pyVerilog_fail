module PeakCurrentHB(clk, cmp, DT, MaxCount, High, Low);
//Inputs and outputs
input clk, cmp;
input [7:0] DT, MaxCount;
output reg High, Low;
//Internal variables
reg [7:0] Counter = 0;
reg [7:0] DTCount = 0;
reg [7:0] MaxDuty = 0;
reg Flag;
//Wires
wire [7:0] Counter_Next, DTCount_Next, MaxDuty_Next;
wire High_Next, Low_Next, Flag_Next;
//For simulation purposes only
initial begin
  High = 0;
  Low = 1;
end
//Sequential Code
always @ (posedge(clk))
begin
	Counter <= Counter_Next;
	High <= High_Next;
	Low <= Low_Next;
	Flag <= Flag_Next;
	MaxDuty <= MaxDuty_Next;
end
//Clock the dead time counter on the flag edge
always @ (negedge(High))
begin
	DTCount <= DTCount_Next;
end
//Combinatorial Code
assign Flag_Next = (Counter == 8'b00000000)?0:(cmp || Flag);
assign Counter_Next = (Counter < MaxCount)?(Counter+1):0;
assign High_Next = (Counter >= DT) && (!Flag) && (Counter < MaxDuty);
assign Low_Next = ((Flag) && (Counter > DTCount)) || ((!High) && (Counter > MaxDuty) && (Counter >= DTCount));
assign DTCount_Next = Counter + DT;
assign MaxDuty_Next = (MaxCount >> 1) - 1;
endmodule