module	bw_r_l2t_subbank(/*AUTOARG*/
   // Outputs
   sout, wayselect0, wayselect1, tag_way0, tag_way1,
   red_reg_q_array2, red_reg_enq_array2,
   // Inputs
   index, bist_index, wr_en, bist_wr_en, rd_en, bist_rd_en, way,
   bist_way, wd_b_l, lkuptag, rclk, sehold, se, sin, rst_tri_en,
   arst_l, gbl_red_rid, gbl_red_reg_en, gbl_red_reg_d, fclk1,
   gbl_red_bank_id_top, gbl_red_bank_id_bottom, gbl_red_wr_en
   );
// !!! Changed gbl_red_wren to gbl_red_wr_en as it is in schematic !!!
// INPUTS
input	[9:0]	index;
input	[9:0]	bist_index;
input		wr_en;
input		bist_wr_en;
input		rd_en;
input		bist_rd_en;
input	[1:0]	way;
input	[1:0]	bist_way;
input	[27:0]	wd_b_l ; //inverted data. not flopped here
input	[27:1]	lkuptag; //not flopped here
input		rclk;
input		sehold;
input		se;
input		sin;
input		rst_tri_en;
// not coded in the spec
// arst function
input		arst_l;  // redundancy registers.
input	[1:0]	gbl_red_rid;
input	[1:0]	gbl_red_reg_en;
input	[6:0]	gbl_red_reg_d;
input		fclk1;
input		gbl_red_bank_id_top;
input		gbl_red_bank_id_bottom;
input		gbl_red_wr_en ;
// !!! Changed gbl_red_wren to gbl_red_wr_en as it is in schematic !!!
// OUTPUTS
output 		sout;
output		wayselect0;
output		wayselect1;
output	[27:0]	tag_way0 ;
output	[27:0]	tag_way1 ;
output	[6:0]	red_reg_q_array2;
output	[1:0]	red_reg_enq_array2;
// !!! Taken out ssclk !!!
// !!! Registering all tag outputs including wayselect as it is how implemented in design !!!
wire		temp_wayselect0; //Registering wayselect signal
wire		temp_wayselect1; //Registering wayselect signal
reg		wayselect0; // Registering wayselect signal
reg		wayselect1; // Registering wayselect signal
reg	[27:0]	temp_tag_way0 ; // Registering tag read out data
reg	[27:0]	temp_tag_way1 ; // Registering tag read out data
// !!! Registering all tag outputs including wayselect as it is how implemented in design !!!
reg	[9:0]	index_d1;
reg	[1:0]	way_d1;
reg		wren_d1, rden_d1 ;
reg             [27:0]  way0[1023:0] ;
reg             [27:0]  way1[1023:0] ;
reg	[27:0]	tag_way0, tag_way1 ;
// JC modified begin
// the size of row redundant register is 1 bit smaller than
// the size of column one.
reg    [7:0]   rid_subbank0_reg0 ;
reg    [7:0]   rid_subbank0_reg1 ;
// JC modified end
reg    [8:0]   rid_subbank0_reg2 ;
reg    [8:0]   rid_subbank0_reg3 ;
// JC modified begin
reg    [7:0]   rid_subbank1_reg0 ;
reg    [7:0]   rid_subbank1_reg1 ;
// JC modified end
reg    [8:0]   rid_subbank1_reg2 ;
reg    [8:0]   rid_subbank1_reg3 ;
reg [1:0]	red_reg_enq_array2;
reg [6:0]	red_reg_q_array2;
wire	[3:0]	red_reg;
// REDUNDANCY LOGIC
assign	red_reg = { gbl_red_bank_id_top, gbl_red_bank_id_bottom, gbl_red_rid[1:0] };
// JC modified begin
// The following modification include
// 1. the size of row redundant register changes.
// 2. the redundant output does not gate with clock
always	@(posedge fclk1 or arst_l ) begin
	if(!arst_l) begin
		rid_subbank0_reg0 = 8'b0 ;
		rid_subbank0_reg1 = 8'b0 ;
		rid_subbank0_reg2 = 9'b0 ;
		rid_subbank0_reg3 = 9'b0 ;
		rid_subbank1_reg0 = 8'b0 ;
		rid_subbank1_reg1 = 8'b0 ;
		rid_subbank1_reg2 = 9'b0 ;
		rid_subbank1_reg3 = 9'b0 ;
	end
	 else if(gbl_red_wr_en) begin
                case(red_reg)
                4'b1000:        rid_subbank0_reg0 = {gbl_red_reg_d[5:0], gbl_red_reg_en[1:0]};
                4'b1001:        rid_subbank0_reg1 = {gbl_red_reg_d[5:0], gbl_red_reg_en[1:0]};
                4'b1010:        rid_subbank0_reg2 = {gbl_red_reg_d[6:0], gbl_red_reg_en[1:0]};
                4'b1011:        rid_subbank0_reg3 = {gbl_red_reg_d[6:0], gbl_red_reg_en[1:0]};
                4'b0100:        rid_subbank1_reg0 = {gbl_red_reg_d[5:0], gbl_red_reg_en[1:0]};
                4'b0101:        rid_subbank1_reg1 = {gbl_red_reg_d[5:0], gbl_red_reg_en[1:0]};
                4'b0110:        rid_subbank1_reg2 = {gbl_red_reg_d[6:0], gbl_red_reg_en[1:0]};
                4'b0111:        rid_subbank1_reg3 = {gbl_red_reg_d[6:0], gbl_red_reg_en[1:0]};
                default: ; // Do nothing
                endcase
        end // of else if
end // of always
always  @( red_reg or rid_subbank0_reg0 or rid_subbank0_reg1 or rid_subbank0_reg2 or rid_subbank0_reg3 or
           rid_subbank1_reg0 or rid_subbank1_reg1 or rid_subbank1_reg2 or rid_subbank1_reg3) begin
                case(red_reg)
                4'b1000:
                { red_reg_q_array2, red_reg_enq_array2 }  = {1'b0,rid_subbank0_reg0};
                4'b1001:
                { red_reg_q_array2, red_reg_enq_array2 }  = {1'b0,rid_subbank0_reg1};
                4'b1010:
                { red_reg_q_array2, red_reg_enq_array2 }  = rid_subbank0_reg2;
                4'b1011:
                { red_reg_q_array2, red_reg_enq_array2 }  = rid_subbank0_reg3;
                4'b0100:
                { red_reg_q_array2, red_reg_enq_array2 }  = {1'b0,rid_subbank1_reg0};
                4'b0101:
                { red_reg_q_array2, red_reg_enq_array2 }  = {1'b0,rid_subbank1_reg1};
                4'b0110:
                { red_reg_q_array2, red_reg_enq_array2 }  = rid_subbank1_reg2;
                4'b0111:
                { red_reg_q_array2, red_reg_enq_array2 }  = rid_subbank1_reg3;
                default:
                { red_reg_q_array2, red_reg_enq_array2 }  = 9'b0;
                endcase
end
always	@(posedge rclk) begin
	index_d1 <= 	( sehold) ? index_d1 :
		( bist_wr_en | bist_rd_en ) ? bist_index : index ;
	way_d1	<= 	(sehold)? way_d1 :
		( bist_wr_en | bist_rd_en ) ? bist_way : way ;
	wren_d1 <= 	( sehold)? wren_d1 :
		( bist_wr_en | wr_en ) ;
	rden_d1 <= 	( sehold)? rden_d1 :
		( bist_rd_en | rd_en );
end
// !!! Flopping output signals !!!
always	@(posedge rclk) begin
        wayselect0 <= temp_wayselect0;
        wayselect1 <= temp_wayselect1;
	tag_way0 <= temp_tag_way0;
	tag_way1 <= temp_tag_way1;
end
// !!! Flopping output signals !!!
// COMPARE OPERATION
// !!! Also, we are gating wayselect with rd_en so, in other cycles (write or no op)
// all wayselect signals are miss. !!!
assign	temp_wayselect0 = (rden_d1) ? ( lkuptag == temp_tag_way0[27:1] ) : 0 ;
assign	temp_wayselect1 = (rden_d1) ? ( lkuptag == temp_tag_way1[27:1] ) : 0 ;
// READ OPERATION
always	@( /*AUTOSENSE*/ /*memory or*/ index_d1 or rden_d1
          or rst_tri_en or wren_d1) begin
`ifdef	INNO_MUXEX
`else
	if(wren_d1==1'bx) begin
		`ifdef MODELSIM
		       $display("L2_TAG_ERR"," wr en error %b ", wren_d1);
		`else
               $error("L2_TAG_ERR"," wr en error %b ", wren_d1);
		`endif
        end
`endif
        if( rden_d1)  begin
`ifdef  INNO_MUXEX
`else
         if(index_d1==10'bx) begin
		`ifdef MODELSIM
                $display("L2_TAG_ERR"," index error %h ", index_d1[9:0]);
		`else
                $error("L2_TAG_ERR"," index error %h ", index_d1[9:0]);
		`endif
         end
`endif
	 if( wren_d1 ) 	begin
                temp_tag_way0 = 28'bx ;
                temp_tag_way1 = 28'bx ;
	 end
	 else	begin
                temp_tag_way0 = way0[index_d1] ;
                temp_tag_way1 = way1[index_d1] ;
         end
        end // of if rden_d1
	else  begin
// !!! When Tag is in write or no-op cycles, all output will be "0" since SAs are precharged !!!
                temp_tag_way0 = 0;
                temp_tag_way1 = 0;
        end
end
// WRITE OPERATION
always	@(negedge rclk ) begin
        if( wren_d1 & ~rst_tri_en) begin
`ifdef	INNO_MUXEX
`else
          if(index_d1==10'bx) begin
		`ifdef MODELSIM
                $display("L2_TAG_ERR"," index error %h ", index_d1[9:0]);
		`else
                $error("L2_TAG_ERR"," index error %h ", index_d1[9:0]);
		`endif
          end
`endif
// !!! When Tag is in write or no-op cycles, all output will be "0" since SAs are precharged !!!
                temp_tag_way0 = 0;
                temp_tag_way1 = 0;
                case(way_d1)
                2'b01 : begin
                                way0[index_d1] = ~wd_b_l;
                          end
                2'b10 : begin
                                way1[index_d1] = ~wd_b_l;
			  end
		default: ;
                endcase
   	 end
end
endmodule