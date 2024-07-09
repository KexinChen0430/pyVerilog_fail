module Crc
fb_crc framecrc (.Clk(MTxClk), .Reset(Reset), .Data(Data_FrmCrc), .Enable(Enable_FrmCrc), .Initialize(Initialize_FrmCrc),
               .Crc(FrmCrc), .CrcError(FrmCrcError)
              );
endmodule