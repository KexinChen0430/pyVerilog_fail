module blk_mem_axi_read_wrapper_beh_v8_2
# (
    parameter  C_INTERFACE_TYPE           = 0,
    parameter  C_AXI_TYPE                 = 0,
    parameter  C_AXI_SLAVE_TYPE           = 0,
    parameter  C_MEMORY_TYPE              = 0,
    parameter  C_WRITE_WIDTH_A            = 4,
    parameter  C_WRITE_DEPTH_A            = 32,
    parameter  C_ADDRA_WIDTH              = 12,
    parameter  C_AXI_PIPELINE_STAGES      = 0,
    parameter  C_AXI_ARADDR_WIDTH         = 12,
    parameter  C_HAS_AXI_ID               = 0,
    parameter  C_AXI_ID_WIDTH             = 4,
    parameter  C_ADDRB_WIDTH              = 12
    )
   (
    input S_ACLK,
    input S_ARESETN,
    input [C_AXI_ARADDR_WIDTH-1:0] S_AXI_ARADDR,
    input [7:0] S_AXI_ARLEN,
    input [2:0] S_AXI_ARSIZE,
    input [1:0] S_AXI_ARBURST,
    input S_AXI_ARVALID,
    output S_AXI_ARREADY,
    output S_AXI_RLAST,
    output S_AXI_RVALID,
    input S_AXI_RREADY,
    input [C_AXI_ID_WIDTH-1:0] S_AXI_ARID,
    output reg [C_AXI_ID_WIDTH-1:0] S_AXI_RID = 0,
    output [C_ADDRB_WIDTH-1:0] S_AXI_ARADDR_OUT,
    output S_AXI_RD_EN
    );
  localparam FLOP_DELAY  = 100;  // 100 ps
  localparam C_RANGE = ((C_WRITE_WIDTH_A == 8)?0:
                       ((C_WRITE_WIDTH_A==16)?1:
                       ((C_WRITE_WIDTH_A==32)?2:
                       ((C_WRITE_WIDTH_A==64)?3:
                       ((C_WRITE_WIDTH_A==128)?4:
                       ((C_WRITE_WIDTH_A==256)?5:0))))));
  reg [C_AXI_ID_WIDTH-1:0] ar_id_r=0;
  wire addr_en_c;
  wire rd_en_c;
  wire incr_addr_c;
  wire single_trans_c;
  wire dec_alen_c;
  wire mux_sel_c;
  wire r_last_c;
  wire r_last_int_c;
  wire [C_ADDRB_WIDTH-1 : 0] araddr_out;
  reg [7:0] arlen_int_r=0;
  reg [7:0] arlen_cntr=8'h01;
  reg [1:0] arburst_int_c=0;
  reg [1:0] arburst_int_r=0;
  reg [((C_AXI_TYPE == 1 && C_AXI_SLAVE_TYPE == 0)?
        C_AXI_ARADDR_WIDTH:C_ADDRA_WIDTH)-1:0] araddr_reg =0;
  integer num_of_bytes_c           = 0;
  integer total_bytes              = 0;
  integer num_of_bytes_r           = 0;
  integer wrap_base_addr_r         = 0;
  integer wrap_boundary_r          = 0;
  reg [7:0] arlen_int_c=0;
  integer total_bytes_c            = 0;
  integer wrap_base_addr_c         = 0;
  integer wrap_boundary_c          = 0;
  assign dec_alen_c        = incr_addr_c | r_last_int_c;
  read_netlist_v8_2
  #(.C_AXI_TYPE      (1),
    .C_ADDRB_WIDTH   (C_ADDRB_WIDTH))
    axi_read_fsm (
    .S_AXI_INCR_ADDR(incr_addr_c),
    .S_AXI_ADDR_EN(addr_en_c),
    .S_AXI_SINGLE_TRANS(single_trans_c),
    .S_AXI_MUX_SEL(mux_sel_c),
    .S_AXI_R_LAST(r_last_c),
    .S_AXI_R_LAST_INT(r_last_int_c),
    .S_ACLK(S_ACLK),
    .S_ARESETN(S_ARESETN),
    .S_AXI_ARLEN(S_AXI_ARLEN),
    .S_AXI_ARVALID(S_AXI_ARVALID),
    .S_AXI_ARREADY(S_AXI_ARREADY),
    .S_AXI_RLAST(S_AXI_RLAST),
    .S_AXI_RVALID(S_AXI_RVALID),
    .S_AXI_RREADY(S_AXI_RREADY),
    .S_AXI_RD_EN(rd_en_c)
      );
   always@(*) begin
     num_of_bytes_c   = 2**((C_AXI_TYPE == 1 && C_AXI_SLAVE_TYPE == 0)?S_AXI_ARSIZE:0);
     total_bytes      = (num_of_bytes_r)*(arlen_int_r+1);
     wrap_base_addr_r = ((araddr_reg)/(total_bytes==0?1:total_bytes))*(total_bytes);
     wrap_boundary_r  = wrap_base_addr_r+total_bytes;
     arlen_int_c      = (C_AXI_TYPE == 0?0:S_AXI_ARLEN);
     total_bytes_c    = (num_of_bytes_c)*(arlen_int_c+1);
     wrap_base_addr_c = ((S_AXI_ARADDR)/(total_bytes_c==0?1:total_bytes_c))*(total_bytes_c);
     wrap_boundary_c  = wrap_base_addr_c+total_bytes_c;
     arburst_int_c    = ((C_AXI_TYPE == 1 && C_AXI_SLAVE_TYPE == 0)?S_AXI_ARBURST:1);
   end
   always @(posedge S_ACLK or S_ARESETN) begin
     if (S_ARESETN == 1'b1) begin
        araddr_reg 	<= 0;
   	arburst_int_r   <= 0;
	num_of_bytes_r  <= 0;
     end else begin
        if (incr_addr_c == 1'b1 && addr_en_c == 1'b1 && single_trans_c == 1'b0) begin
	      arburst_int_r    <= arburst_int_c;
	      num_of_bytes_r   <= num_of_bytes_c;
	      if (arburst_int_c == 2'b10) begin
		    if(S_AXI_ARADDR == (wrap_boundary_c-num_of_bytes_c)) begin
		      araddr_reg <= wrap_base_addr_c;
		    end else begin
		      araddr_reg <= S_AXI_ARADDR + num_of_bytes_c;
		    end
	      end else if (arburst_int_c == 2'b01 || arburst_int_c == 2'b11) begin
		    araddr_reg <= S_AXI_ARADDR + num_of_bytes_c;
	      end
        end else if (addr_en_c == 1'b1) begin
              araddr_reg       <= S_AXI_ARADDR;
	      num_of_bytes_r   <= num_of_bytes_c;
	      arburst_int_r    <= arburst_int_c;
	    end else if (incr_addr_c == 1'b1) begin
	      if (arburst_int_r == 2'b10) begin
	     	if(araddr_reg == (wrap_boundary_r-num_of_bytes_r)) begin
	     	  araddr_reg <= wrap_base_addr_r;
	     	end else begin
	     	  araddr_reg <= araddr_reg + num_of_bytes_r;
	     	end
	      end else if (arburst_int_r == 2'b01 || arburst_int_r == 2'b11) begin
		      araddr_reg   <= araddr_reg + num_of_bytes_r;
	      end
         end
         end
   end
assign araddr_out   =  ((C_AXI_TYPE == 1 && C_AXI_SLAVE_TYPE == 0)?araddr_reg[C_AXI_ARADDR_WIDTH-1:C_RANGE]:araddr_reg);
    always @(posedge S_ACLK or S_ARESETN) begin
        if (S_ARESETN == 1'b1) begin
          arlen_cntr        <= 8'h01;
	    arlen_int_r     <= 0;
	end else begin
          if (addr_en_c == 1'b1 && dec_alen_c == 1'b1 && single_trans_c == 1'b0) begin
	    arlen_int_r     <= (C_AXI_TYPE == 0?0:S_AXI_ARLEN) ;
            arlen_cntr      <= S_AXI_ARLEN - 1'b1;
	  end else if (addr_en_c == 1'b1) begin
	    arlen_int_r     <= (C_AXI_TYPE == 0?0:S_AXI_ARLEN) ;
	    arlen_cntr      <= (C_AXI_TYPE == 0?0:S_AXI_ARLEN) ;
	  end else if (dec_alen_c == 1'b1) begin
            arlen_cntr      <= arlen_cntr - 1'b1 ;
          end
	  else begin
	        arlen_cntr      <= arlen_cntr;
	  end
     end
   end
    assign r_last_int_c          = (arlen_cntr == 0 && S_AXI_RREADY == 1'b1)?1'b1:1'b0;
	assign S_AXI_ARADDR_OUT = (mux_sel_c == 1'b0)?((C_AXI_TYPE == 1 && C_AXI_SLAVE_TYPE == 0)?S_AXI_ARADDR[C_AXI_ARADDR_WIDTH-1:C_RANGE]:S_AXI_ARADDR):araddr_out;
    assign S_AXI_RD_EN = rd_en_c;
    generate if (C_HAS_AXI_ID == 1) begin:gaxi_bvalid_id_r
      always @(posedge S_ACLK or S_ARESETN) begin
        if (S_ARESETN == 1'b1) begin
          S_AXI_RID <= 0;
          ar_id_r   <= 0;
	end else begin
          if (addr_en_c == 1'b1 && rd_en_c == 1'b1) begin
             S_AXI_RID <= S_AXI_ARID;
             ar_id_r <= S_AXI_ARID;
          end else if (addr_en_c == 1'b1 && rd_en_c == 1'b0) begin
	     ar_id_r <= S_AXI_ARID;
          end else if (rd_en_c == 1'b1) begin
             S_AXI_RID <= ar_id_r;
          end
        end
     end
     end
   endgenerate
endmodule