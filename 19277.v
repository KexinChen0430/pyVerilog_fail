module ",
					     "does not properly support class-",
					     "based dimension order traversal ",
					     "in the flit kill logic yet."});
				   $stop;
				end
			   end
			 else
			   begin
			      assign flit_kill = flit_kill_base;
			   end
		      end
		    `CONNECTIVITY_FULL:
		      begin
			 assign flit_kill
			   = ((dim_order == `DIM_ORDER_ASCENDING) &&
			      (rc_dest[0:(curr_dim+1)*dim_addr_width-1] !=
			       router_address[0:(curr_dim+1)*dim_addr_width-1])) ||
			     ((dim_order == `DIM_ORDER_DESCENDING) &&
			      (rc_dest[curr_dim*dim_addr_width:
				       router_addr_width-1] !=
			       router_address[curr_dim*dim_addr_width:
					      router_addr_width-1]));
		      end
		  endcase
	       end
	  end
      endcase
   endgenerate
   reg [0:router_addr_width-1] random_router_address;
   integer 		       d;
   generate
      if(num_nodes_per_router > 1)
	begin
	   wire [0:node_addr_width-1] node_address;
	   if(port_id >= (num_ports - num_nodes_per_router))
	     assign node_address = port_id - (num_ports - num_nodes_per_router);
	   else
	     assign node_address = {node_addr_width{1'b0}};
	   assign source_address[router_addr_width:addr_width-1] = node_address;
	   reg [0:node_addr_width-1]  random_node_address;
	   always @(posedge clk, posedge reset)
	     begin
		if(reset | packet_sent)
		  begin
		     for(d = 0; d < num_dimensions; d = d + 1)
		       random_router_address[d*dim_addr_width +: dim_addr_width]
			 = (router_address[d*dim_addr_width +: dim_addr_width] +
			    $dist_uniform(seed, 0, num_routers_per_dim-1)) %
			   num_routers_per_dim;
		     random_node_address
		       = (node_address +
			  $dist_uniform(seed,
					((port_id >=
					  (num_ports - num_nodes_per_router)) &&
					 (random_router_address ==
					  router_address)) ? 1 : 0,
					num_nodes_per_router - 1)) %
			 num_nodes_per_router;
		     dest_info[dest_info_width-addr_width:dest_info_width-1]
		       = {random_router_address, random_node_address};
		  end
	     end
	end
      else
	begin
	   always @(posedge clk, posedge reset)
	     begin
		if(reset | packet_sent)
		  begin
		     for(d = 0; d < num_dimensions - 1; d = d + 1)
		       random_router_address[d*dim_addr_width +: dim_addr_width]
			 = (router_address[d*dim_addr_width +: dim_addr_width] +
			    $dist_uniform(seed, 0, num_routers_per_dim-1)) %
			   num_routers_per_dim;
		     random_router_address[router_addr_width-dim_addr_width:
					   router_addr_width-1]
		       = router_address[router_addr_width-dim_addr_width:
					router_addr_width-1];
		     random_router_address[router_addr_width-dim_addr_width:
					   router_addr_width-1]
		       = (router_address[router_addr_width-dim_addr_width:
					 router_addr_width-1] +
			  $dist_uniform(seed,
					((port_id >=
					  (num_ports - num_nodes_per_router)) &&
					 (random_router_address ==
					  router_address)) ? 1 : 0,
					num_routers_per_dim - 1)) %
			 num_routers_per_dim;
		     dest_info[dest_info_width-addr_width:dest_info_width-1]
		       = random_router_address;
		  end
	     end
	end
      if(num_resource_classes > 1)
	begin
	   reg [0:router_addr_width-1] last_router_address;
	   reg [0:router_addr_width-1] random_intm_address;
	   always @(random_router_address)
	     begin
		last_router_address = random_router_address;
		for(i = num_resource_classes - 2; i >= 0; i = i - 1)
		  begin
		     for(d = 0; d < num_dimensions - 1; d = d + 1)
		       random_intm_address[d*dim_addr_width +: dim_addr_width]
			 = (last_router_address[d*dim_addr_width +:
						dim_addr_width] +
			    $dist_uniform(seed, 0, num_routers_per_dim-1)) %
			   num_routers_per_dim;
		     random_intm_address[router_addr_width-dim_addr_width:
					 router_addr_width-1]
		       = last_router_address[router_addr_width-dim_addr_width:
					     router_addr_width-1];
		     random_intm_address[router_addr_width-dim_addr_width:
					 router_addr_width-1]
		       = (last_router_address[router_addr_width-dim_addr_width:
					      router_addr_width-1] +
			  $dist_uniform(seed, (random_router_address ==
					       last_router_address) ? 1 : 0,
					num_routers_per_dim - 1)) %
			 num_routers_per_dim;
		     dest_info[i*router_addr_width +: router_addr_width]
		       = random_intm_address;
		     last_router_address = random_intm_address;
		  end
	     end
	end
      assign header_info[lar_info_width:
			 route_info_width-2]
	       = dest_info;
      //PRIV mode
      reg priv;
      always @(posedge clk)
        priv <= ($dist_uniform(seed, 0, 99) < 10);
      assign header_info[route_info_width-1] = priv;
      if(max_payload_length > 0)
	begin
	   reg [0:packet_length_width-1] random_length_q;
	   reg [0:packet_length_width-1] flit_count_q;
	   reg 				 tail_q;
	   always @(posedge clk, posedge reset)
	     begin
		case(packet_length_mode)
		  0:
		    random_length_q <= $dist_uniform(seed, min_payload_length,
						     max_payload_length);
		  1:
		    random_length_q <= ($dist_uniform(seed, 0, 1) < 1) ?
				       min_payload_length :
				       max_payload_length;
		endcase
		if(reset)
		  begin
		     flit_count_q <= min_payload_length;
		     tail_q <= (min_payload_length == 0);
		  end
		else if(packet_sent)
		  begin
		     flit_count_q <= random_length_q;
		     tail_q <= ~|random_length_q;
		  end
		else if(flit_sent)
		  begin
		     flit_count_q <= flit_count_q - |flit_count_q;
		     tail_q <= ~|(flit_count_q - |flit_count_q);
		  end
	     end
	   wire head_s, head_q;
	   assign head_s = (head_q & ~flit_sent) | packet_sent;
	   c_dff
	     #(.width(1),
	       .reset_value(1'b1),
	       .reset_type(reset_type))
	   headq
	     (.clk(clk),
	      .reset(reset),
	      .active(1'b1),
	      .d(head_s),
	      .q(head_q));
	   assign flit_head = head_q;
	   assign flit_tail = tail_q;
	   if((packet_format == `PACKET_FORMAT_EXPLICIT_LENGTH) &&
	      (payload_length_width > 0))
	     begin
		wire [0:payload_length_width-1] payload_length;
		assign payload_length = (flit_count_q - min_payload_length);
		assign header_info[route_info_width:
				   route_info_width+
				   payload_length_width-1]
			 = payload_length;
	     end
	end
      else
	begin
	   assign flit_head = 1'b1;
	   assign flit_tail = 1'b1;
	end
      if(num_vcs > 1)
	begin
	   reg [0:vc_idx_width-1] random_vc;
	   always @(posedge clk, posedge reset)
	     begin
		if(reset | packet_sent)
		  random_vc <= $dist_uniform(seed, 0, num_vcs-1);
	     end
	   c_decode
	     #(.num_ports(num_vcs))
	   sel_ovc_dec
	     (.data_in(random_vc),
	      .data_out(sel_ovc));
	   assign curr_dest_addr
	     = dest_info[((random_vc / num_vcs_per_class) %
			   num_resource_classes)*router_addr_width +:
			  router_addr_width];
	end
      else
	begin
	   assign sel_ovc = 1'b1;
	   assign curr_dest_addr = dest_info[0:router_addr_width-1];
	end
   endgenerate
   assign error = |fcs_errors_ovc;
endmodule