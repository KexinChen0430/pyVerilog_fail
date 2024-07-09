module must finish acking to DMA TX register write request
//    in no more than 3 clock cycles (3 * 8ns = 24ns < 30ns) to prevent the p2n fifo
//    from filling up and overflowing. The DMA TX queue full signal to CPCI chip
//    is currently indicating whether the cpu queue is full, not whether the pci2net_fifo
//    is full.
   reg [1:0] p2n_state;
   reg [1:0] p2n_state_nxt;
   reg p2n_wr_en;
   wire p2n_full;
   localparam
	    P2N_IDLE = 2'h 0,
	    READING = 2'h 1,
	    P2N_RD_DONE = 2'h 2;
   // this state machine runs in the pci-clk domain
   always @* begin
      // set default values
      p2n_wr_en = 1'b0;
      p2n_state_nxt = p2n_state;
      if (reset)
         p2n_state_nxt = P2N_IDLE;
      else begin
         case (p2n_state)
            P2N_IDLE: begin
               // Only process the request if the PCI2NET fifo has space for the
               // request
               if (p2n_req && !p2n_full) begin
                  p2n_wr_en = 1'b1;
                  if (p2n_rd_wr_L)
                     p2n_state_nxt = READING;
               end   // if
            end // P2N_IDLE
            READING: begin
               // Wait until the result is ready to return
               if (p2n_rd_rdy)
                  p2n_state_nxt = P2N_RD_DONE;
            end //READING
            P2N_RD_DONE:
               // Don't return to idle until the other side deasserts the request
               // signal
               if ( ! p2n_req )
                  p2n_state_nxt = P2N_IDLE;
         endcase
      end
   end
   always @(posedge core_clk) begin
      p2n_state <= p2n_state_nxt;
   end
 always @*
      if (reset) begin
         cpci_wr_rdy_nxt = 1'b0;
         cpci_rd_rdy_nxt = 1'b0;
      end
      else begin
         cpci_wr_rdy_nxt = !p2n_prog_full;
         //cpci_rd_rdy_nxt = !fifo_empty; xCG, original fifo was in different direction
      end
   always @(posedge core_clk) begin
      //cpci_rd_rdy <= cpci_rd_rdy_nxt; xCG
      cpci_wr_rdy <= cpci_wr_rdy_nxt;
   end
/*
-----------------------------------------------------------------
- NF2 -> CPCI responses
-----------------------------------------------------------------
*/
   // Fifo to cross from the PCI clock domain to the core domain
	/*
   pci2net_16x60 pci2net_fifo (
      .din ({p2n_rd_wr_L, p2n_addr, p2n_wr_data}),
      .rd_clk (core_clk),
      .rd_en (fifo_rd_en),
      .rst (reset),
      .wr_clk (pci_clk),
      .wr_en (p2n_wr_en),
      .almost_full (p2n_almost_full),
      .prog_full (p2n_prog_full),
      .dout ({bus_rd_wr_L, bus_addr, bus_wr_data}),
      .empty (fifo_empty),
      .full (p2n_full)
   );
*/
	pci2net_16x60	pci2net_fifo (
	.aclr ( reset ),
	.clock ( core_clk ),
	.data ( {p2n_rd_wr_L, p2n_addr, p2n_wr_data} ),
	.rdreq ( fifo_rd_en ),
	.wrreq ( p2n_wr_en ),
	.almost_empty (  ),
	.almost_full ( p2n_prog_full ),
	.empty ( fifo_empty ),
	.full ( p2n_full ),
	.q ( {bus_rd_wr_L, bus_addr, bus_wr_data} ),
	.usedw (  )
	);
// synthesis translate_on
endmodule