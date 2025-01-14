module rx_queue
    #(parameter DATA_WIDTH      = 64,
      parameter CTRL_WIDTH      = DATA_WIDTH/8,
      parameter ENABLE_HEADER   = 0,
      parameter STAGE_NUMBER    = 'hff,
      parameter PORT_NUMBER     = 0
      )
   (output reg [DATA_WIDTH-1:0]        out_data,
    output reg [CTRL_WIDTH-1:0]        out_ctrl,
    output reg                         out_wr,
    input                              out_rdy,
    input  [7:0]                       gmac_rx_data,
    input                              gmac_rx_dvld,
    input                              gmac_rx_goodframe,
    input                              gmac_rx_badframe,
    output                             rx_pkt_good,
    output                             rx_pkt_bad,
    output                             rx_pkt_dropped,
    output reg [11:0]                  rx_pkt_byte_cnt,
    output reg [9:0]                   rx_pkt_word_cnt,
    output reg                         rx_pkt_pulled,
    input                              rx_queue_en,
    input                              reset,
    input                              clk,
    input                              rxcoreclk
   );
   function integer log2;
      input integer number;
      begin
         log2=0;
         while(2**log2<number) begin
            log2=log2+1;
         end
      end
   endfunction // log2
   parameter OUT_WAIT_PKT_AVAIL = 0;
   parameter OUT_LENGTH         = 1;
   parameter OUT_WAIT_PKT_DONE  = 2;
   parameter RX_IDLE            = 1;
   parameter RX_RCV_PKT         = 2;
   parameter RX_WR_LAST_WORD    = 4;
   parameter RX_WAIT_GOOD_OR_BAD= 8;
   parameter RX_ADD_PAD         = 16;
   parameter RX_DROP_PKT        = 32;
   localparam MAX_PKT_SIZE             = 2048;
   localparam LAST_WORD_BYTE_CNT_WIDTH = log2(CTRL_WIDTH);
   localparam PKT_BYTE_CNT_WIDTH       = log2(MAX_PKT_SIZE)+1;
   localparam PKT_WORD_CNT_WIDTH       = PKT_BYTE_CNT_WIDTH - LAST_WORD_BYTE_CNT_WIDTH;
   wire [CTRL_WIDTH+DATA_WIDTH-1:0]rx_fifo_dout;
   reg                             eop;
   reg                             rx_fifo_wr_en;
   reg                             rx_fifo_rd_en;
   wire                            rx_fifo_empty;
   wire                            rx_fifo_full;
   wire                            rx_fifo_almost_full;
   reg                             pkt_chk_fifo_rd_en;
   wire                            pkt_chk_fifo_dout;
   wire                            pkt_chk_fifo_empty;
   reg [1:0]                       out_state_nxt;
   reg [1:0]                       out_state;
   reg [7:0]                       gmac_rx_data_d1;
   reg                             dvld_d1;
   reg [5:0]                       rx_state;
   reg [5:0]                       rx_state_nxt;
   reg                             rx_pkt_bad_rxclk;
   reg                             rx_pkt_good_rxclk;
   reg                             rx_pkt_dropped_rxclk;
   reg                             reset_rx_clk;
   reg [PKT_BYTE_CNT_WIDTH-1:0]    num_bytes_written;
   wire [PKT_BYTE_CNT_WIDTH-1:0]   pkt_byte_len;
   wire [PKT_WORD_CNT_WIDTH-1:0]   pkt_word_len;
   reg                             output_len;
   wire [DATA_WIDTH-1:0]           out_data_local;
   wire [CTRL_WIDTH-1:0]           out_ctrl_local;
   reg                             out_wr_local;
   reg                             rx_pkt_pulled_nxt;
   wire [`IOQ_WORD_LEN_POS - `IOQ_SRC_PORT_POS-1:0] port_number = PORT_NUMBER;
	wire [12:0] wrusedw;
	reg rx_fifo_almost_full_reg;
   /* this fifo will receive packets as they come until the
   generate
	/*
   if(DATA_WIDTH==32) begin: rx_fifo_32
      rxfifo_8kx9_to_36 gmac_rx_fifo
        (
         .din        ({eop,gmac_rx_data_d1}),
         .wr_en      (rx_fifo_wr_en),
         .wr_clk     (rxcoreclk),
         .dout       (rx_fifo_dout),
         .rd_en      (rx_fifo_rd_en),
         .rd_clk     (clk),
         .empty      (rx_fifo_empty),
         .full       (rx_fifo_full),
         .prog_full  (rx_fifo_almost_full),
         .rst        (reset)
         );
   end
	*/
	 if(DATA_WIDTH==32) begin: rx_fifo_32
	rxfifo_8kx9_to_36	gmac_rx_fifo
	(
		.aclr ( reset ),
		.data ( {eop,gmac_rx_data_d1} ),
		.rdclk ( clk ),
		.rdreq ( rx_fifo_rd_en ),
		.wrclk ( rxcoreclk ),
		.wrreq ( rx_fifo_wr_en ),
		.q ( rx_fifo_dout ),
		.rdempty ( rx_fifo_empty ),
		.wrfull ( rx_fifo_full ),
		.wrusedw ( wrusedw )  // rx_fifo_almost_full
	);
   end
	/*
   else if(DATA_WIDTH==64) begin: rx_fifo_64
      rxfifo_8kx9_to_72 gmac_rx_fifo
        (
         .din        ({eop,gmac_rx_data_d1}),
         .wr_en      (rx_fifo_wr_en),
         .wr_clk     (rxcoreclk),
         .dout       (rx_fifo_dout),
         .rd_en      (rx_fifo_rd_en),
         .rd_clk     (clk),
         .empty      (rx_fifo_empty),
         .full       (rx_fifo_full),
         .prog_full  (rx_fifo_almost_full),
         .rst        (reset)
         );
   end
	*/
	  else if(DATA_WIDTH==64) begin: rx_fifo_64
		rxfifo_8kx9_to_72	gmac_rx_fifo
		(
			.aclr ( reset ),
			.data ( {eop,gmac_rx_data_d1} ),
			.rdclk ( clk ),
			.rdreq ( rx_fifo_rd_en ),
			.wrclk ( rxcoreclk ),
			.wrreq ( rx_fifo_wr_en ),
			.q ( rx_fifo_dout ),
			.rdempty ( rx_fifo_empty ),
			.wrfull ( rx_fifo_full ),
			.wrusedw ( wrusedw )
		);
		end
   endgenerate
   generate
      if (ENABLE_HEADER) begin
         /* Whenever a packet is received, this fifo will store its status
          */
			 /*
         rxlengthfifo_128x13 pkt_chk_fifo
            (
               .din     ({rx_pkt_good_rxclk, num_bytes_written}),
               .wr_en   (rx_pkt_bad_rxclk | rx_pkt_good_rxclk),
               .wr_clk  (rxcoreclk),
               .dout    ({pkt_chk_fifo_dout, pkt_byte_len}),
               .rd_en   (pkt_chk_fifo_rd_en),
               .rd_clk  (clk),
               .empty   (pkt_chk_fifo_empty),
               .full    (),
               .rst     (reset)
            );
				*/
			rxlengthfifo_128x13	pkt_chk_fifo
			(
				.aclr ( reset ),
				.data ( {rx_pkt_good_rxclk, num_bytes_written} ),
				.rdclk ( clk ),
				.rdreq ( pkt_chk_fifo_rd_en ),
				.wrclk ( rxcoreclk ),
				.wrreq ( rx_pkt_bad_rxclk | rx_pkt_good_rxclk ),
				.q ( {pkt_chk_fifo_dout, pkt_byte_len} ),
				.rdempty ( pkt_chk_fifo_empty ),
				.wrfull (  )
				);
      end
      else begin
         /* Whenever a packet is received, this fifo will store its status
          */
         small_fifo
           #(.WIDTH(1),
             .MAX_DEPTH_BITS(7))
         pkt_chk_fifo
           ( .din            (rx_pkt_good),
             .wr_en          (rx_pkt_bad | rx_pkt_good),
             .rd_en          (pkt_chk_fifo_rd_en),
             .dout           (pkt_chk_fifo_dout),
             .full           (),
             .nearly_full    (),
             .prog_full      (),
             .empty          (pkt_chk_fifo_empty),
             .reset          (reset),
             .clk            (clk)
             );
      end // if (ENABLE_HEADER) else
   endgenerate
   // these modules move pulses from one clk domain to the other
   pulse_synchronizer rx_pkt_bad_sync
     (.pulse_in_clkA (rx_pkt_bad_rxclk),
      .clkA          (rxcoreclk),
      .pulse_out_clkB(rx_pkt_bad),
      .clkB          (clk),
      .reset_clkA    (reset_rx_clk),
      .reset_clkB    (reset));
   pulse_synchronizer rx_pkt_good_sync
     (.pulse_in_clkA (rx_pkt_good_rxclk),
      .clkA          (rxcoreclk),
      .pulse_out_clkB(rx_pkt_good),
      .clkB          (clk),
      .reset_clkA    (reset_rx_clk),
      .reset_clkB    (reset));
   pulse_synchronizer rx_pkt_dropped_sync
     (.pulse_in_clkA (rx_pkt_dropped_rxclk),
      .clkA          (rxcoreclk),
      .pulse_out_clkB(rx_pkt_dropped),
      .clkB          (clk),
      .reset_clkA    (reset_rx_clk),
      .reset_clkB    (reset));
   // extend reset over to MAC domain
   reg reset_long;
   // synthesis attribute ASYNC_REG of reset_long is TRUE ;
   always @(posedge clk) begin
      if (reset) reset_long <= 1;
      else if (reset_rx_clk) reset_long <= 0;
   end
   always @(posedge rxcoreclk) reset_rx_clk <= reset_long;
   /* we have to separate the ctrl bits from the data
    */
   generate
      genvar i;
      if (ENABLE_HEADER) begin
         wire [DATA_WIDTH-1:0] out_data_tmp;
         wire [CTRL_WIDTH-1:0] out_ctrl_tmp;
         for (i=0; i<CTRL_WIDTH; i=i+1) begin: swap_dout
            assign out_data_tmp[(CTRL_WIDTH-1-i)*8+7:(CTRL_WIDTH-1-i)*8] =
                   rx_fifo_dout[i*9+7:i*9];
            assign out_ctrl_tmp[i] = rx_fifo_dout[i*9+8];
         end // for
         assign pkt_word_len = pkt_byte_len[LAST_WORD_BYTE_CNT_WIDTH-1:0] == 0 ?
            pkt_byte_len[PKT_BYTE_CNT_WIDTH-1:LAST_WORD_BYTE_CNT_WIDTH] :
            pkt_byte_len[PKT_BYTE_CNT_WIDTH-1:LAST_WORD_BYTE_CNT_WIDTH] + 1;
         assign out_data_local = output_len ?
            {pkt_word_len,
             port_number,
             {(`IOQ_SRC_PORT_POS - PKT_BYTE_CNT_WIDTH){1'b0}}, pkt_byte_len} : out_data_tmp;
         assign out_ctrl_local = output_len ? STAGE_NUMBER : out_ctrl_tmp;
      end
      else begin
         for (i=0; i<CTRL_WIDTH; i=i+1) begin: swap_dout
            assign out_data_local[(CTRL_WIDTH-1-i)*8+7:(CTRL_WIDTH-1-i)*8] =
                   rx_fifo_dout[i*9+7:i*9];
            assign out_ctrl_local[i] = rx_fifo_dout[i*9+8];
         end // for
      end // if (ENABLE_HEADER) else
   endgenerate
   /* Wait until the pkt_chk_fifo is not empty, indicating a packet is available
    */
   always @(*) begin
      pkt_chk_fifo_rd_en   = 0;
      out_state_nxt        = out_state;
      rx_fifo_rd_en        = 0;
      out_wr_local         = 0;
      output_len           = 0;
      rx_pkt_pulled_nxt    = 0;
      case (out_state)
        OUT_WAIT_PKT_AVAIL: begin
           if(!pkt_chk_fifo_empty) begin
              pkt_chk_fifo_rd_en   = 1;
              rx_fifo_rd_en        = 1;
              if (ENABLE_HEADER)
                 out_state_nxt = OUT_LENGTH;
              else
                 out_state_nxt = OUT_WAIT_PKT_DONE;
           end
        end
        OUT_LENGTH: begin
           output_len     = 1;
           out_wr_local   = pkt_chk_fifo_dout & out_rdy;
           if (out_rdy || !pkt_chk_fifo_dout) begin
              out_state_nxt = OUT_WAIT_PKT_DONE;
           end
        end
        OUT_WAIT_PKT_DONE: begin
           /* if this is the last word */
           if(|out_ctrl_local) begin
              if(out_rdy || !pkt_chk_fifo_dout) begin
                 out_wr_local        = pkt_chk_fifo_dout;
                 out_state_nxt       = OUT_WAIT_PKT_AVAIL;
                 rx_pkt_pulled_nxt   = pkt_chk_fifo_dout;
              end
           end
           else begin
              rx_fifo_rd_en   = pkt_chk_fifo_dout ? out_rdy : 1;
              /* if good pkt then write it to the output */
              out_wr_local    = pkt_chk_fifo_dout & out_rdy;
           end
        end // case: OUT_WAIT_PKT_DONE
        default: begin end
      endcase // case(out_state)
   end // always @ (*)
   always @(posedge clk) begin
      out_wr             <= out_wr_local;
      out_data           <= out_data_local;
      out_ctrl           <= out_ctrl_local;
      rx_pkt_byte_cnt    <= pkt_byte_len;
      rx_pkt_word_cnt    <= pkt_word_len;
      rx_pkt_pulled      <= rx_pkt_pulled_nxt;
      if(reset) begin
         out_state <= OUT_WAIT_PKT_AVAIL;
      end
      else begin
         out_state <= out_state_nxt;
      end
   end
   /* If there is enough space for a packet then write
    */
   always @(*) begin
      rx_state_nxt           = rx_state;
      rx_fifo_wr_en          = 0;
      eop                    = 0;
      rx_pkt_bad_rxclk       = 0;
      rx_pkt_good_rxclk      = 0;
      rx_pkt_dropped_rxclk   = 0;
      case(rx_state)
        RX_IDLE: begin
           /* If we have data and space for a MAX_SIZE packet */
           if(dvld_d1 & !rx_fifo_almost_full & rx_queue_en) begin
              rx_fifo_wr_en   = 1;
              rx_state_nxt    = RX_RCV_PKT;
           end
           else if(dvld_d1) begin
              // synthesis translate_off
              $display("%t %m WARNING: rx_queue discarding ingress pkt because ingress FIFO full or disabled",
                       $time);
              // synthesis translate_on
              rx_state_nxt           = RX_DROP_PKT;
              rx_pkt_dropped_rxclk   = 1;
           end
        end // case: IDLE
        RX_RCV_PKT: begin
           // synthesis translate_off
           if(rx_fifo_full) begin
              $display("%t %m ERROR: rx_queue FIFO filled up! Packet is longer than MAX SIZE packet",
                       $time);
           end
           // synthesis translate_on
           rx_fifo_wr_en = 1;
           /* when the gmac_rx_dvld falls then packet is done */
           if(!gmac_rx_dvld) begin
              eop = 1;
              rx_state_nxt = RX_WAIT_GOOD_OR_BAD;
           end
           /* make sure the packet is not too large */
           else if (num_bytes_written >= MAX_PKT_SIZE-2) begin
              eop = 1;
              rx_state_nxt = RX_ADD_PAD;
              rx_pkt_bad_rxclk = 1;
           end // else: !if(num_bytes_written <= (MAX_PKT_SIZE-2))
        end // case: RCV_PKT
        /* the signal for good or bad fcs comes sometime later */
        RX_WAIT_GOOD_OR_BAD: begin
           if(gmac_rx_goodframe) begin
              rx_pkt_good_rxclk   = 1;
              rx_state_nxt        = RX_ADD_PAD;
           end
           else if(gmac_rx_badframe) begin
              rx_pkt_bad_rxclk   = 1;
              rx_state_nxt       = RX_ADD_PAD;
              // synthesis translate_off
              $display("%t %m INFO: Packet with bad fcs received.",
                       $time);
              // synthesis translate_on
           end
        end // case: WAIT_GOOD_OR_BAD
        /* pad the missing bytes from the last DATA_WIDTH word
        RX_ADD_PAD: begin
           if(num_bytes_written[LAST_WORD_BYTE_CNT_WIDTH-1:0] == 0) begin
              rx_state_nxt = RX_IDLE;
           end
           else begin
              rx_fifo_wr_en = 1;
           end
        end
        RX_DROP_PKT: begin
           if(!dvld_d1) begin
              rx_state_nxt = RX_IDLE;
           end
        end
        default: begin end
      endcase // case(rx_state)
   end // always @ (*)
   always @(posedge rxcoreclk) begin
      if(reset_rx_clk) begin
         rx_state             <= RX_IDLE;
         gmac_rx_data_d1      <= 0;
         dvld_d1              <= 0;
         num_bytes_written    <= 0;
      end
      else begin
         rx_state           <= rx_state_nxt;
         gmac_rx_data_d1    <= gmac_rx_data;
         dvld_d1            <= gmac_rx_dvld;
         if (rx_fifo_wr_en)
            num_bytes_written <= num_bytes_written + 'b1;
         else if(rx_state == RX_IDLE)
            num_bytes_written <= 0;
      end
   end // always @ (posedge rxcoreclk)
   // synthesis translate_off
   always @(posedge clk) begin
      if(rx_pkt_dropped) begin
         $display("%t %m WARNING: packet dropped at the input queue.", $time);
      end
   end
   // synthesis translate_on
	always @(posedge rxcoreclk) begin
		if ( wrusedw > 13'd6100) begin
			rx_fifo_almost_full_reg = 1'b1;
		end
		else
			rx_fifo_almost_full_reg = 1'b0;
	end
	assign rx_fifo_almost_full = rx_fifo_almost_full_reg;
endmodule