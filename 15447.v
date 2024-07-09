module FRAME_ECCE3
  `ifdef XIL_TIMING //Simprim
  #(
  parameter LOC = "UNPLACED"
)
  `endif
(
  output CRCERROR,
  output ECCERRORNOTSINGLE,
  output ECCERRORSINGLE,
  output ENDOFFRAME,
  output ENDOFSCAN,
  output [25:0] FAR,
  input [1:0] FARSEL,
  input ICAPBOTCLK,
  input ICAPTOPCLK
);
   pulldown (CRCERROR);
   pulldown (ECCERRORNOTSINGLE);
   pulldown (ECCERRORSINGLE);
   pulldown (ENDOFFRAME);
   pulldown (ENDOFSCAN);
   pulldown far_net[25:0] (FAR);
   tri0 glblGSR = glbl.GSR;
   specify
    (ICAPBOTCLK *> FAR) = (0:0:0, 0:0:0);
    (ICAPBOTCLK => ECCERRORNOTSINGLE) = (0:0:0, 0:0:0);
    (ICAPBOTCLK => ECCERRORSINGLE) = (0:0:0, 0:0:0);
    (ICAPBOTCLK => ENDOFFRAME) = (0:0:0, 0:0:0);
    (ICAPBOTCLK => ENDOFSCAN) = (0:0:0, 0:0:0);
    (ICAPTOPCLK *> FAR) = (0:0:0, 0:0:0);
    (ICAPTOPCLK => ECCERRORNOTSINGLE) = (0:0:0, 0:0:0);
    (ICAPTOPCLK => ECCERRORSINGLE) = (0:0:0, 0:0:0);
    (ICAPTOPCLK => ENDOFFRAME) = (0:0:0, 0:0:0);
    (ICAPTOPCLK => ENDOFSCAN) = (0:0:0, 0:0:0);
      specparam PATHPULSE$ = 0;
   endspecify
endmodule