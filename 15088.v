module bsg_lru_pseudo_tree_decode
  #(parameter `BSG_INV_PARAM(ways_p)
    ,localparam lg_ways_lp = `BSG_SAFE_CLOG2(ways_p)
  )
  (input [lg_ways_lp-1:0]      way_id_i
   , output logic [`BSG_SAFE_MINUS(ways_p, 2):0] data_o
   , output logic [`BSG_SAFE_MINUS(ways_p, 2):0] mask_o
  );
  genvar i;
  generate
    if (ways_p == 1) begin: no_lru
      assign mask_o[0] = 1'b1;
      assign data_o[0] = 1'b0;
    end
    else begin: lru
    for(i=0; i<ways_p-1; i++) begin: rof
      // Mask generation
	  if(i == 0) begin: fi
	    assign mask_o[i] = 1'b1;
	  end
	  else if(i%2 == 1) begin: fi
	    assign mask_o[i] = mask_o[(i-1)/2] & ~way_id_i[lg_ways_lp-`BSG_SAFE_CLOG2(i+2)+1];
	  end
	  else begin: fi
	    assign mask_o[i] = mask_o[(i-2)/2] & way_id_i[lg_ways_lp-`BSG_SAFE_CLOG2(i+2)+1];
	  end
	  // Data generation
	  assign data_o[i] = mask_o[i] & ~way_id_i[lg_ways_lp-`BSG_SAFE_CLOG2(i+2)];
    end
    end
  endgenerate
endmodule