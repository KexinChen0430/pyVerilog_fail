module PLOADER(CLK, RST_X, RXD, ADDR, DATA, WE, DONE1, DONE2);
   input  wire       CLK, RST_X, RXD;
   output reg [31:0] ADDR;
   output reg [31:0] DATA;
   output reg        WE;
   output reg        DONE1; // application program load is done
   output reg        DONE2; // scheduling program load is done
   reg [31:0] 	     waddr; // memory write address
   wire 	     SER_EN;
   wire [7:0] 	     SER_DATA;
   UartRx recv(CLK, RST_X, RXD, SER_DATA, SER_EN);
   always @(posedge CLK or negedge RST_X) begin
      if(~RST_X) begin
         {ADDR, DATA, WE, waddr, DONE1, DONE2} <= 0;
      end else begin
         if(DONE2==0 && SER_EN) begin
            //ADDR  <= (waddr<32'h40000) ? waddr : {8'h04, 6'd0, waddr[17:0]};
            ADDR  <= waddr;
            DATA  <= {SER_DATA, DATA[31:8]};
            WE    <= (waddr[1:0]==3);
            waddr <= waddr + 1;
            if(waddr>=`APP_SIZE) DONE1 <= 1;
         end else begin
            WE <= 0;
            if(waddr>=`APP_SIZE) DONE1 <= 1;
            if(waddr>=`IMG_SIZE) DONE2 <= 1;
         end
      end
   end
endmodule