module onePortMem(readData,
		  readEnable,
		  address,
		  clk,
		  writeEnable,
		  writeData);
   //user defined
   parameter               addresses   = 32;
   parameter		   width       = 8;
   parameter 		   muxFactor   = 0;
   //Auto-calculated, user dont touch
   localparam		   addressWidth =$clog2(addresses);
   output [width-1:0] 	     readData;
   input 	   	     readEnable;
   input [addressWidth-1:0]  address;
   input 		     clk;
   input 		     writeEnable;
   input [width-1:0] 	     writeData;
   generate
      if((addresses==0)&&(width==0))
	begin
	   initial
	     begin
		$display("FAIL!! :%m:Parameters, addresses and width can not be set to 0");
		$stop;
	     end
        end
`include "scriptGeneratedListOfVendorOnePortMems.vh"
      else
	begin
	   onePortSimMem   #(.addresses  (addresses),
                             .width      (width),
                             .muxFactor (muxFactor)
			     ) mem (.readData(readData),
				    .readEnable(readEnable),
				    .address(address),
				    .clk(clk),
				    .writeEnable(writeEnable),
				    .writeData(writeData));
	end
   endgenerate
endmodule