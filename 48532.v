module NW_route (flit_in, flit_out, clk, rst_n);
   input flit_t flit_in;
   output flit_t flit_out;
   input  clk, rst_n;
   function flit_t next_route;
	  input flit_t flit_in;
      logic [4:0] route;
      flit_t new_flit;
      begin
	 new_flit=flit_in;
	 // Simple XY Routing
	 if (flit_in.control.x_disp!=0) begin
	    if (flit_in.control.x_disp>0) begin
	       route = `port5id_east;
	       new_flit.control.x_disp--;
	    end else begin
	       route = `port5id_west;
	       new_flit.control.x_disp++;
	    end
	 end else begin
	    if (flit_in.control.y_disp==0) begin
	       route=`port5id_tile;
	    end else if (flit_in.control.y_disp>0) begin
	       route=`port5id_south;
	       new_flit.control.y_disp--;
	    end else begin
	       route=`port5id_north;
	       new_flit.control.y_disp++;
	    end
	 end
	 new_flit.control.output_port = route;
	 next_route = new_flit;
      end
   endfunction // flit_t
   assign  flit_out=next_route(flit_in);
endmodule