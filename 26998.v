module twoPortMem (
                   writeAddress,
                   writeClk,
                   writeEnable,
                   writeData,
                   readAddress,
                   readClk,
                   readEnable,
                   readData);
   //user defined
   parameter               addresses   = 32;
   parameter               width       = 8;
   parameter               muxFactor   = 0;
   parameter               writeMask   = 1;
   //Auto-calculated, user dont touch
   localparam              addressWidth =$clog2(addresses);
   input [addressWidth-1:0] writeAddress;
   input                    writeClk;
   input [writeMask-1:0]    writeEnable;
   input [width-1:0]        writeData;
   input [addressWidth-1:0] readAddress;
   input                    readClk;
   input                    readEnable;
   output [width-1:0]       readData;
   generate
      if((addresses==0)&&(width==0))
        begin
           initial
             begin
                $display("FAIL!! :%m:Parameters, addresses and width can not be set to 0");
                $stop;
             end
        end
`include "scriptGeneratedListOfVendorTwoPortMems.vh"
      else
        begin
           twoPortMemSim   #(.addresses  (addresses),
                             .width      (width),
                             .muxFactor  (muxFactor),
                             .writeMask  (writeMask)
                             ) mem (.writeAddress(writeAddress),
                                    .writeClk(writeClk),
                                    .writeEnable(writeEnable),
                                    .writeData(writeData),
                                    .readAddress(readAddress),
                                    .readClk(readClk),
                                    .readEnable(readEnable),
                                    .readData(readData));
        end
   endgenerate
endmodule