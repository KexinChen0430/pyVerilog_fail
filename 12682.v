module bsg_link_osdr_phy
 #(parameter `BSG_INV_PARAM(width_p )
  ,parameter strength_p = 0)
  (input                clk_i
  ,input                reset_i
  ,input  [width_p-1:0] data_i
  ,output               clk_o
  ,output [width_p-1:0] data_o
  );
  bsg_link_osdr_phy_phase_align clk_pa
  (.clk_i  (clk_i)
  ,.reset_i(reset_i)
  ,.clk_o  (clk_o)
  );
  bsg_dff #(.width_p(width_p)) data_ff
  (.clk_i(clk_i),.data_i(data_i),.data_o(data_o));
endmodule