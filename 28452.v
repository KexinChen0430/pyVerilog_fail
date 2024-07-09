module LAG_route (flit_in, flit_out, clk, rst_n);
   input flit_t flit_in;
   output flit_t flit_out;
   input  clk, rst_n;
   function flit_t next_route;
	  input flit_t flit_in;
      logic [4:0] route;
      flit_t new_flit;
      x_displ_t x_disp;
      y_displ_t y_disp;
      begin
	 new_flit = flit_in;
	 x_disp = x_displ_t ' (flit_in.data[router_radix + `X_ADDR_BITS : router_radix]);
   y_disp = y_displ_t ' (flit_in.data[router_radix + `X_ADDR_BITS + `Y_ADDR_BITS + 1 : router_radix + `X_ADDR_BITS + 1]);
	 // Simple XY Routing
	 if (x_disp!=0) begin
	    if (x_disp>0) begin
	       route = `port5id_east;
	       x_disp--;
	    end else begin
	       route = `port5id_west;
	       x_disp++;
	    end
	 end else begin
	    if (y_disp==0) begin
	       route=`port5id_tile;
	    end else if (y_disp>0) begin
	       route=`port5id_south;
	       y_disp--;
	    end else begin
	       route=`port5id_north;
	       y_disp++;
	    end
	 end
	 new_flit.data[router_radix - 1 : 0] = route;
	 new_flit.data[router_radix + `X_ADDR_BITS : router_radix] = x_displ_t ' (x_disp);
	 new_flit.data[router_radix + `X_ADDR_BITS + `Y_ADDR_BITS + 1 : router_radix + `X_ADDR_BITS + 1] = y_displ_t ' (y_disp);
	 next_route = new_flit;
      end
   endfunction // flit_t
   assign  flit_out=next_route(flit_in);
endmodule