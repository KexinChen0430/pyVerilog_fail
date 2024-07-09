module counter (clk, nrst, e);
input wire clk;            /* clock used for the counter */
input wire nrst;           /* active low reset */
output wire e;             /* set to 0 if count = 0 */
reg [7:0] count;           /* ...and the register which actually decrements */
/* activate e when count reaches 0 */
assign e = |count;
always @(posedge clk or negedge nrst) begin
	if(nrst == 1'b0)
		count <= 8'd`KEYMSB;
	else
		count <= count - 1'b1;
end
endmodule