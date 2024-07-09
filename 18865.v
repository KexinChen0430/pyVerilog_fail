module bsg_lru_pseudo_tree_backup
  #(parameter `BSG_INV_PARAM(ways_p)
    , parameter lg_ways_lp=`BSG_SAFE_CLOG2(ways_p)
  )
  (
    input [ways_p-1:0] disabled_ways_i
    , output logic [`BSG_SAFE_MINUS(ways_p, 2):0] modify_mask_o
    , output logic [`BSG_SAFE_MINUS(ways_p, 2):0] modify_data_o
  );
  // If direct-mapped there is no meaning to backup LRU
  if (ways_p == 1) begin: no_lru
    assign modify_mask_o = 1'b1;
    assign modify_data_o = 1'b0;
  end
  else begin: lru
  // backup LRU logic
  // i = rank
  for (genvar i = 0; i < lg_ways_lp; i++) begin
    logic [(2**(i+1))-1:0] and_reduce;
    // j = bucket
    for (genvar j = 0; j < (2**(i+1)); j++)
      assign and_reduce[j] = &disabled_ways_i[(ways_p/(2**(i+1)))*j+:(ways_p/(2**(i+1)))];
    // k = start index in LRU bits
    for (genvar k = 0; k < (2**(i+1))/2; k++) begin
      assign modify_data_o[(2**i)-1+k] = and_reduce[2*k];
      assign modify_mask_o[(2**i)-1+k] = |and_reduce[2*k+:2];
    end
  end
  end
endmodule