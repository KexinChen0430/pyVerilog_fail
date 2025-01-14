module rf(clk,p0_addr,p1_addr,p0,p1,re0,re1,dst_addr,dst,we,hlt);
// Triple ported register file.  Two read ports (p0 & p1), and //
// one write port (dst).  Data is written on clock high, and  //
// read on clock low //////////////////////////////////////////
input clk;
input [3:0] p0_addr, p1_addr;			// two read port addresses
input re0,re1;							// read enables (power not functionality)
input [3:0] dst_addr;					// write address
input [15:0] dst;						// dst bus
input we;								// write enable
input hlt;								// not a functional input.  Used to dump register contents when
										// test is halted.
output reg [15:0] p0,p1;  				//output read ports
integer indx;
reg [15:0]mem[0:15];
reg [3:0] dst_addr_lat;					// have to capture dst_addr from previous cycle
reg [15:0] dst_lat;					// have to capture write data from previous cycle
reg we_lat;								// have to capture we from previous cycle
// Register file will come up uninitialized except for //
// register zero which is hardwired to be zero.       //
initial begin
   mem[0] = 16'h0000;					// reg0 is always 0,
end
// dst_addr, dst, & we all need to be latched  //
// on clock low of previous cycle to maintain //
// in clock high write of next cycle.        //
always @(clk,dst_addr,dst,we)
  if (~clk)
    begin
	  dst_addr_lat <= dst_addr;
	  dst_lat      <= dst;
	  we_lat       <= we;
	end
// RF is written on clock high //
always @(clk,we_lat,dst_addr_lat,dst_lat)
  if (clk && we_lat && |dst_addr_lat)
    mem[dst_addr_lat] <= dst_lat;
// RF is read on clock low //
always @(clk,re0,p0_addr)
  if (~clk && re0)
    p0 <= mem[p0_addr];
// RF is read on clock low //
always @(clk,re1,p1_addr)
  if (~clk && re1)
    p1 <= mem[p1_addr];
// Dump register contents at program //
// halt for debug purposes          //
always @(posedge hlt)
  for(indx=1; indx<16; indx = indx+1)
    $display("R%1h = %h",indx,mem[indx]);
endmodule