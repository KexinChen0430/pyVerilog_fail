module bsg_link_isdr_phy
 #(parameter `BSG_INV_PARAM(width_p ))
  (input                clk_i
  ,output               clk_o
  ,input  [width_p-1:0] data_i
  ,output [width_p-1:0] data_o
  );
  assign clk_o = clk_i;
  bsg_dff #(.width_p(width_p)) data_ff
  (.clk_i(clk_i),.data_i(data_i),.data_o(data_o));
endmodule