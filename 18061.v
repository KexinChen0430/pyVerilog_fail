module bsg_lru_pseudo_tree_encode
  #(parameter `BSG_INV_PARAM(ways_p)
    , parameter lg_ways_lp = `BSG_SAFE_CLOG2(ways_p)
  )
  (
    input [`BSG_SAFE_MINUS(ways_p, 2):0] lru_i
    , output logic [lg_ways_lp-1:0] way_id_o
  );
  if (ways_p == 1) begin: no_lru
    assign way_id_o = 1'b0;
  end
  else begin: lru
  for (genvar i = 0; i < lg_ways_lp; i++) begin: rank
    if (i == 0) begin: z
      // top way_id_o bit is just the lowest LRU bit
      assign way_id_o[lg_ways_lp-1] = lru_i[0];  // root
    end
    else begin: nz
      // each output way_id_o bit uses *all* of the way_id_o bits above it in the way_id_o vector
      // as the select to a mux which has as input an exponentially growing (2^i) collection of unique LRU bits
      bsg_mux #(
        .width_p(1)
        ,.els_p(2**i)
      ) mux (
        .data_i(lru_i[((2**i)-1)+:(2**i)])
        ,.sel_i(way_id_o[lg_ways_lp-1-:i])
        ,.data_o(way_id_o[lg_ways_lp-1-i])
      );
    end
  end
  end
endmodule