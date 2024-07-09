module bsg_mul_green_booth_dots #(parameter `BSG_INV_PARAM(width_p)
                                  , harden_p=0
                                  , blocks_p="inv"
                                  , group_vec_p="inv"
                                 )
   ( input    [1:0][2:0]      SDN_i
     , input  [width_p-1:0]   y_i
     , output [width_p+2-1:0] dot_o
     );
   wire [width_p+2-1:0] y_pad = { y_i, 2'b00 };
   genvar               i,j;
   for (j = 0; j < blocks_p; j=j+1)
     begin: blk
        localparam group_end_lp      = (group_vec_p >> ((j+1) << 3 )) & 8'hFF;
        localparam group_start_lp    = (group_vec_p >> ((j  ) << 3 )) & 8'hFF;
        localparam [31:0] blocks_lp  = group_end_lp-group_start_lp;
        // y_i does not need to be signed extended
        // this is the last row, after all
        // which should not exist for signed version.
        if (j != 0 && harden_p)
          begin: macro
             bsg_and #(.width_p(blocks_lp)
                       ,.harden_p(harden_p)
                       ) ba
             (.a_i  ({blocks_lp { SDN_i[1][2] } }    )
              ,.b_i (y_pad[group_start_lp+:blocks_lp])
              ,.o   (dot_o[group_start_lp+:blocks_lp])
              );
          end
        else
          begin: notmacro
             for (i = 0; i < blocks_lp; i++)
               begin: b
                  if (j == 0 && i == 0)
                    begin :fi
                       assign dot_o[0] = SDN_i[0][0];
                    end
                  else
                    if (j == 0 && i == 1)
                      begin : fi
                         assign dot_o[1] = 1'b0;
                      end
                    else
                      begin: fi
                         // assign dot_o[i] = bsg_booth_dot(SDN_i[1], y_pad[i-1], y_pad[i-2]);
                         // note: we do not need a dot here; as only S value may be set; an AND is sufficient.
                         // fixme: update the diagram.
                         assign dot_o[group_start_lp+i] = SDN_i[1][2] & y_pad[group_start_lp+i];
                      end
               end // block: rof
          end // block: notmacro
     end // block: rof
endmodule