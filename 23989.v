module bsg_link_iddr_phy
 #(parameter `BSG_INV_PARAM(width_p ))
  (input                  clk_i
  ,input  [width_p-1:0]   data_i
  ,output [2*width_p-1:0] data_r_o
  );
  logic [2*width_p-1:0] data_rr;
  logic [width_p-1:0] data_n_r, data_p_r;
  assign data_r_o = data_rr;
  always_ff @(posedge clk_i)
    // First buffer posedge data into data_p_r
    data_p_r <= data_i;
  always_ff @(negedge clk_i)
    // Then buffer negedge data into data_n_r
    data_n_r <= data_i;
  always_ff @(posedge clk_i)
    // Finally output to the data_rr flop
    // data_p_r occurs logically earlier in time than data_n_r
    data_rr <= {data_n_r, data_p_r};
endmodule