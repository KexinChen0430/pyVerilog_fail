module is done
     input            h_hrd_hwr_n,      // 1 - read, 0 - write
     input            h_mem_io_n,       // 1 - Mem, 0 - IO.
     input            m_cpurd_state1,   // To reset svga_sel_ff (mem)
     input            g_cpult_state1,   // To reset svga_sel_ff (graph)
     input            g_lt_hwr_cmd,     // cpu_wr cycle sm is idle
     output           h_iord,  	        // The current IO cycle is read
     output           h_iowr,           // The current IO cycle is write
     output           h_t_ready_n,      // Done, Ready for next cycle
     output reg       host_cycle,
     output           io_cycle,
     output           h_svga_sel,
     output           wrbus_io_cycle
     );
  parameter 	      idle_s    = 2'b00,
                      dxfer_s0  = 2'b01,
      	              dxfer_s1  = 2'b10,
		      turn_ar_s = 2'b11;
  reg [1:0] 	      current_state_ff;
  reg [1:0] 	      next_state;
  reg 		      svga_sel_ff;
  reg 		      svga_sel_reset; // to reset svga_sel_ff
  reg 		      io_ready_n;
  reg 		      io_cycle_bus;
  wire 		      svga_sel_ff_din;
  wire 		      int_ready_n;
  wire 		      tmp_int_ready_n;
  wire 		      comb_ready_n;
  wire 		      mem_write;
  reg [4:0] 	      tmo_cnt;
  wire 		      timer_ready_n;
  wire 		      dummy_out_0;
  assign 	      tmp_int_ready_n = a_ready_n & c_ready_n & g_ready_n &
      	       	      m_ready_n;
  assign 	      int_ready_n = tmp_int_ready_n & timer_ready_n;
  always @(posedge h_hclk, negedge h_reset_n)
    if(~h_reset_n) current_state_ff <= idle_s;
    else           current_state_ff <= next_state;
  always @* begin
    host_cycle     = 1'b0;
    io_ready_n     = 1'b1;
    svga_sel_reset = 1'b0;
    io_cycle_bus   = 1'b0;
    case(current_state_ff)  // synopsys parallel_case  full_case
      idle_s: begin
     	if(h_svga_sel & g_lt_hwr_cmd & (~h_mem_io_n) )
	  next_state = dxfer_s0;
	else
	  next_state = idle_s;
      end
      dxfer_s0: begin
      	host_cycle     = 1'b1;
	io_cycle_bus   = 1'b1;
	svga_sel_reset = 1'b1;
	if(~int_ready_n) next_state = dxfer_s1;
	else             next_state = dxfer_s0;
      end
      dxfer_s1: begin
	host_cycle     = 1'b1;
	io_cycle_bus   = 1'b1;
	next_state     = turn_ar_s;
      end
      turn_ar_s: begin
        io_ready_n     = 1'b0;
	io_cycle_bus   = 1'b1;
	next_state     = idle_s;
      end
    endcase
  end
  assign io_cycle  = host_cycle & (~h_mem_io_n);
  assign wrbus_io_cycle  = io_cycle_bus  & (~h_mem_io_n);
  assign h_iord    = io_cycle &   h_hrd_hwr_n;
  assign h_iowr    = io_cycle & (~h_hrd_hwr_n);
  assign comb_ready_n    = io_ready_n & g_mem_ready_n;
  assign mem_write  	  = h_mem_io_n & (~h_hrd_hwr_n);
  // Generating timer_ready_n signal incase ready_n is not coming from any
  // of the modules. If ready_n does not get generated from any of the modules
  // for 25 h_hclk's then timer_ready_n gets generated.
  always @(posedge h_hclk, negedge h_reset_n)
    if (!h_reset_n)      tmo_cnt <= 5'b0;
    else if (t_svga_sel) tmo_cnt <= 5'b0;
    else                 tmo_cnt <= tmo_cnt + io_cycle;
  assign timer_ready_n = ~(tmo_cnt == 5'h19);
  assign h_t_ready_n = comb_ready_n;
  assign svga_sel_ff_din = ( ((~(m_cpurd_state1 | g_cpult_state1 |
				 svga_sel_reset)) &
      	       	     	      (svga_sel_ff)) ) | ( t_svga_sel );
  // Latching t_svga_sel and converting level to pulse
  always @(posedge h_hclk, negedge h_reset_n)
    if(~h_reset_n) svga_sel_ff <= 1'b0;
    else           svga_sel_ff <= #1 svga_sel_ff_din;
  assign h_svga_sel = svga_sel_ff | t_svga_sel;
endmodule