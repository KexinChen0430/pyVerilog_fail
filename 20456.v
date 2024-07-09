module PLOADER(CLK, RST_X, RXD, ADDR, DATA, WE_32, WE_128, DONE);
   input  wire       CLK, RST_X, RXD;
   output reg [31:0] ADDR;
   output reg [127:0] DATA;
   output reg        WE_32;
   output reg 	     WE_128;
   output reg        DONE;
   reg [31:0] 	     waddr; // memory write address
   wire 	     SER_EN;
   wire [7:0] 	     SER_DATA;
   UartRx recv(CLK, RST_X, RXD, SER_DATA, SER_EN);
   always @(posedge CLK or negedge RST_X) begin
      if(~RST_X) begin
         {ADDR, DATA, WE_32, WE_128, waddr, DONE} <= 0;
      end else begin
         if(DONE==0 && SER_EN) begin
            ADDR   <= waddr;
            DATA   <= {SER_DATA, DATA[127:8]};
            WE_32  <= (waddr[1:0]==3) ? 1'b1 : 1'b0;
	    WE_128 <= (waddr[3:0]==15) ? 1'b1 : 1'b0;
            waddr <= waddr + 1;
            if(waddr>=`APP_SIZE) DONE <= 1;
         end else begin
            WE_32 <= 0;
	    WE_128 <= 0;
            if(waddr>=`APP_SIZE) DONE <= 1;
         end
      end
   end
endmodule