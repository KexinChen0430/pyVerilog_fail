module " ++ netlistName nl ++ declarePorts (ports nl) ++ ";";
   "timeunit 1ns; timeprecision 1ns;"] ++
  declareLocalNets nl ++
  wireUpPorts (ports nl) ++
  instantiateComponents (instances nl) ++
  ["endmodule