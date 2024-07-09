module blk_mem_axi_write_wrapper_beh_v8_0
  # (
    // AXI Interface related parameters start here
    parameter C_INTERFACE_TYPE           = 0, // 0: Native Interface; 1: AXI Interface
    parameter C_AXI_TYPE                 = 0, // 0: AXI Lite; 1: AXI Full;
    parameter C_AXI_SLAVE_TYPE           = 0, // 0: MEMORY SLAVE; 1: PERIPHERAL SLAVE;
    parameter C_MEMORY_TYPE              = 0, // 0: SP-RAM, 1: SDP-RAM; 2: TDP-RAM; 3: DP-ROM;
    parameter C_WRITE_DEPTH_A            = 0,
    parameter C_AXI_AWADDR_WIDTH         = 32,
    parameter C_ADDRA_WIDTH 	         = 12,
    parameter C_AXI_WDATA_WIDTH          = 32,
    parameter C_HAS_AXI_ID               = 0,
    parameter C_AXI_ID_WIDTH             = 4,
    // AXI OUTSTANDING WRITES
    parameter C_AXI_OS_WR                = 2
    )
    (
     // AXI Global Signals
    input S_ACLK,
    input S_ARESETN,
    // AXI Full/Lite Slave Write Channel (write side)
    input [C_AXI_ID_WIDTH-1:0] S_AXI_AWID,
    input [C_AXI_AWADDR_WIDTH-1:0] S_AXI_AWADDR,
    input [8-1:0] S_AXI_AWLEN,
    input [2:0] S_AXI_AWSIZE,
    input [1:0] S_AXI_AWBURST,
    input  S_AXI_AWVALID,
    output S_AXI_AWREADY,
    input  S_AXI_WVALID,
    output S_AXI_WREADY,
    output reg [C_AXI_ID_WIDTH-1:0] S_AXI_BID = 0,
    output S_AXI_BVALID,
    input  S_AXI_BREADY,
    // Signals for BMG interface
    output [C_ADDRA_WIDTH-1:0] S_AXI_AWADDR_OUT,
    output S_AXI_WR_EN
    );
  localparam FLOP_DELAY  = 100;  // 100 ps
   localparam C_RANGE = ((C_AXI_WDATA_WIDTH == 8)?0:
                       ((C_AXI_WDATA_WIDTH==16)?1:
                       ((C_AXI_WDATA_WIDTH==32)?2:
                       ((C_AXI_WDATA_WIDTH==64)?3:
                       ((C_AXI_WDATA_WIDTH==128)?4:
                       ((C_AXI_WDATA_WIDTH==256)?5:0))))));
  wire bvalid_c                 ;
  reg bready_timeout_c          = 0;
  wire [1:0] bvalid_rd_cnt_c;
  reg bvalid_r         	= 0;
  reg [2:0] bvalid_count_r = 0;
  reg [((C_AXI_TYPE == 1 && C_AXI_SLAVE_TYPE == 0)?
        C_AXI_AWADDR_WIDTH:C_ADDRA_WIDTH)-1:0] awaddr_reg = 0;
  reg [1:0] bvalid_wr_cnt_r = 0;
  reg [1:0] bvalid_rd_cnt_r = 0;
  wire w_last_c                 ;
  wire addr_en_c                ;
  wire incr_addr_c              ;
  wire aw_ready_r 	        ;
  wire dec_alen_c               ;
  reg bvalid_d1_c = 0;
  reg [7:0] awlen_cntr_r = 0;
  reg [7:0] awlen_int = 0;
  reg [1:0] awburst_int = 0;
  integer total_bytes              = 0;
  integer wrap_boundary            = 0;
  integer wrap_base_addr           = 0;
  integer num_of_bytes_c           = 0;
  integer num_of_bytes_r           = 0;
  // Array to store BIDs
  reg [C_AXI_ID_WIDTH-1:0] axi_bid_array[3:0] ;
  wire S_AXI_BVALID_axi_wr_fsm;
  //AXI WRITE FSM COMPONENT INSTANTIATION
 write_netlist_v8_0 #(.C_AXI_TYPE(C_AXI_TYPE)) axi_wr_fsm
      (
      .S_ACLK(S_ACLK),
      .S_ARESETN(S_ARESETN),
      .S_AXI_AWVALID(S_AXI_AWVALID),
      .aw_ready_r(aw_ready_r),
      .S_AXI_WVALID(S_AXI_WVALID),
      .S_AXI_WREADY(S_AXI_WREADY),
      .S_AXI_BREADY(S_AXI_BREADY),
      .S_AXI_WR_EN(S_AXI_WR_EN),
      .w_last_c(w_last_c),
      .bready_timeout_c(bready_timeout_c),
      .addr_en_c(addr_en_c),
      .incr_addr_c(incr_addr_c),
      .bvalid_c(bvalid_c),
      .S_AXI_BVALID (S_AXI_BVALID_axi_wr_fsm)
	  );
   //Wrap Address boundary calculation
   always@(*) begin
    num_of_bytes_c = 2**((C_AXI_TYPE == 1 && C_AXI_SLAVE_TYPE == 0)?S_AXI_AWSIZE:0);
    total_bytes    = (num_of_bytes_r)*(awlen_int+1);
    wrap_base_addr = ((awaddr_reg)/((total_bytes==0)?1:total_bytes))*(total_bytes);
    wrap_boundary  = wrap_base_addr+total_bytes;
  end
  // BMG address generation
   always @(posedge S_ACLK or S_ARESETN) begin
         if (S_ARESETN == 1'b1) begin
           awaddr_reg       <= 0;
	   num_of_bytes_r   <= 0;
	   awburst_int      <= 0;
	 end else begin
           if (addr_en_c == 1'b1) begin
              awaddr_reg       <= #FLOP_DELAY S_AXI_AWADDR  ;
	      num_of_bytes_r   <= num_of_bytes_c;
	      awburst_int      <= ((C_AXI_TYPE == 1 && C_AXI_SLAVE_TYPE == 0)?S_AXI_AWBURST:2'b01);
	   end else if (incr_addr_c == 1'b1) begin
	      if (awburst_int == 2'b10) begin
		if(awaddr_reg == (wrap_boundary-num_of_bytes_r)) begin
		  awaddr_reg  <= wrap_base_addr;
		end else begin
		  awaddr_reg <= awaddr_reg + num_of_bytes_r;
		end
	      end else if (awburst_int == 2'b01 || awburst_int == 2'b11) begin
		awaddr_reg   <= awaddr_reg + num_of_bytes_r;
	      end
           end
         end
   end
   assign S_AXI_AWADDR_OUT   =  ((C_AXI_TYPE == 1 && C_AXI_SLAVE_TYPE == 0)?
			  	       awaddr_reg[C_AXI_AWADDR_WIDTH-1:C_RANGE]:awaddr_reg);
  // AXI wlast generation
    always @(posedge S_ACLK or S_ARESETN) begin
        if (S_ARESETN == 1'b1) begin
          awlen_cntr_r      <= 0;
	  awlen_int       <= 0;
	  end else begin
          if (addr_en_c == 1'b1) begin
	    awlen_int         <= #FLOP_DELAY (C_AXI_TYPE == 0?0:S_AXI_AWLEN) ;
	    awlen_cntr_r      <= #FLOP_DELAY (C_AXI_TYPE == 0?0:S_AXI_AWLEN) ;
	    end else if (dec_alen_c == 1'b1) begin
            awlen_cntr_r      <= #FLOP_DELAY awlen_cntr_r - 1 ;
          end
        end
    end
    assign w_last_c          = (awlen_cntr_r == 0 && S_AXI_WVALID == 1'b1)?1'b1:1'b0;
    assign dec_alen_c        =  (incr_addr_c | w_last_c);
   // Generation of bvalid counter for outstanding transactions
    always @(posedge S_ACLK or S_ARESETN) begin
      if (S_ARESETN == 1'b1) begin
	bvalid_count_r             <= 0;
	end else begin
	// bvalid_count_r generation
	if (bvalid_c == 1'b1 && bvalid_r == 1'b1 && S_AXI_BREADY == 1'b1) begin
	  bvalid_count_r          <=   #FLOP_DELAY bvalid_count_r ;
	  end else if (bvalid_c == 1'b1) begin
	  bvalid_count_r          <=  #FLOP_DELAY  bvalid_count_r + 1 ;
	  end else if (bvalid_r == 1'b1 && S_AXI_BREADY == 1'b1 && bvalid_count_r != 0) begin
	  bvalid_count_r          <=  #FLOP_DELAY  bvalid_count_r - 1 ;
	end
      end
    end
    // Generation of bvalid when BID is used
    generate if (C_HAS_AXI_ID == 1) begin:gaxi_bvalid_id_r
      always @(posedge S_ACLK or S_ARESETN) begin
        if (S_ARESETN == 1'b1) begin
          bvalid_r                   <=  0;
          bvalid_d1_c                <=  0;
	end else begin
         // Delay the generation o bvalid_r for generation for BID
         bvalid_d1_c  <= bvalid_c;
         //external bvalid signal generation
         if (bvalid_d1_c == 1'b1) begin
           bvalid_r                <=   #FLOP_DELAY 1'b1 ;
	 end else if (bvalid_count_r <= 1 && S_AXI_BREADY == 1'b1) begin
           bvalid_r                <=   #FLOP_DELAY 0 ;
         end
        end
      end
    end
    endgenerate
   // Generation of bvalid when BID is not used
   generate if(C_HAS_AXI_ID == 0) begin:gaxi_bvalid_noid_r
    always @(posedge S_ACLK or S_ARESETN) begin
        if (S_ARESETN == 1'b1) begin
          bvalid_r                   <=  0;
	end else begin
         //external bvalid signal generation
         if (bvalid_c == 1'b1) begin
           bvalid_r                <=   #FLOP_DELAY 1'b1 ;
	 end else if (bvalid_count_r <= 1 && S_AXI_BREADY == 1'b1) begin
           bvalid_r                <=   #FLOP_DELAY 0 ;
         end
       end
    end
    end
   endgenerate
    // Generation of Bready timeout
    always @(bvalid_count_r) begin
    	// bready_timeout_c generation
	if(bvalid_count_r == C_AXI_OS_WR-1) begin
	  bready_timeout_c        <=   1'b1;
	end else begin
	  bready_timeout_c        <=   1'b0;
	end
    end
    // Generation of BID
    generate if(C_HAS_AXI_ID == 1) begin:gaxi_bid_gen
    always @(posedge S_ACLK or S_ARESETN) begin
        if (S_ARESETN == 1'b1) begin
            bvalid_wr_cnt_r   <= 0;
            bvalid_rd_cnt_r   <= 0;
	end else begin
          // STORE AWID IN AN ARRAY
          if(bvalid_c == 1'b1) begin
            bvalid_wr_cnt_r  <= bvalid_wr_cnt_r + 1;
          end
	  // generate BID FROM AWID ARRAY
	  bvalid_rd_cnt_r <= #FLOP_DELAY bvalid_rd_cnt_c ;
	  S_AXI_BID       <= axi_bid_array[bvalid_rd_cnt_c];
        end
    end
    assign bvalid_rd_cnt_c = (bvalid_r == 1'b1 && S_AXI_BREADY == 1'b1)?bvalid_rd_cnt_r+1:bvalid_rd_cnt_r;
    // Storing AWID for generation of BID
    always @(posedge S_ACLK or S_ARESETN) begin
      if(S_ARESETN == 1'b1) begin
	axi_bid_array[0] = 0;
	axi_bid_array[1] = 0;
	axi_bid_array[2] = 0;
	axi_bid_array[3] = 0;
	end else if(aw_ready_r == 1'b1 && S_AXI_AWVALID == 1'b1) begin
	axi_bid_array[bvalid_wr_cnt_r] <= S_AXI_AWID;
      end
    end
  end
  endgenerate
  assign S_AXI_BVALID   =  bvalid_r;
  assign S_AXI_AWREADY  =  aw_ready_r;
  endmodule