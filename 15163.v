module arf
  (
   input wire 			 clk,
   input wire 			 reset,
   input wire [`REG_SEL-1:0] 	 rs1_1, //DP from here
   input wire [`REG_SEL-1:0] 	 rs2_1,
   input wire [`REG_SEL-1:0] 	 rs1_2,
   input wire [`REG_SEL-1:0] 	 rs2_2,
   output wire [`DATA_LEN-1:0] 	 rs1_1data,
   output wire [`DATA_LEN-1:0] 	 rs2_1data,
   output wire [`DATA_LEN-1:0] 	 rs1_2data,
   output wire [`DATA_LEN-1:0] 	 rs2_2data, //DP end
   input wire [`REG_SEL-1:0] 	 wreg1, //com_dst1
   input wire [`REG_SEL-1:0] 	 wreg2, //com_dst2
   input wire [`DATA_LEN-1:0] 	 wdata1, //com_data1
   input wire [`DATA_LEN-1:0] 	 wdata2, //com_data2
   input wire 			 we1, //com_en1
   input wire 			 we2, //com_en2
   input wire [`RRF_SEL-1:0] 	 wrrfent1, //comtag1
   input wire [`RRF_SEL-1:0] 	 wrrfent2, //comtag2
   output wire [`RRF_SEL-1:0] 	 rs1_1tag, // DP from here
   output wire [`RRF_SEL-1:0] 	 rs2_1tag,
   output wire [`RRF_SEL-1:0] 	 rs1_2tag,
   output wire [`RRF_SEL-1:0] 	 rs2_2tag,
   input wire [`REG_SEL-1:0] 	 tagbusy1_addr,
   input wire [`REG_SEL-1:0] 	 tagbusy2_addr,
   input wire 			 tagbusy1_we,
   input wire 			 tagbusy2_we,
   input wire [`RRF_SEL-1:0] 	 settag1,
   input wire [`RRF_SEL-1:0] 	 settag2,
   input wire [`SPECTAG_LEN-1:0] tagbusy1_spectag,
   input wire [`SPECTAG_LEN-1:0] tagbusy2_spectag,
   output wire 			 rs1_1busy,
   output wire 			 rs2_1busy,
   output wire 			 rs1_2busy,
   output wire 			 rs2_2busy,
   input wire 			 prmiss,
   input wire 			 prsuccess,
   input wire [`SPECTAG_LEN-1:0] prtag,
   input wire [`SPECTAG_LEN-1:0] mpft_valid1,
   input wire [`SPECTAG_LEN-1:0] mpft_valid2
   );
   // Set priority on instruction2 WriteBack
   // wrrfent = comtag
   wire [`RRF_SEL-1:0] 		 comreg1_tag;
   wire [`RRF_SEL-1:0] 		 comreg2_tag;
   wire 			 clearbusy1 = we1;
   wire 			 clearbusy2 = we2;
   wire 			 we1_0reg = we1 &&
				 (wreg1 != `REG_SEL'b0);
   wire 			 we2_0reg = we2 &&
				 (wreg2 != `REG_SEL'b0);
   wire 			 we1_prior2 = ((wreg1 == wreg2) &&
					       we1_0reg && we2_0reg) ?
				 1'b0 : we1_0reg;
   // Set priority on instruction2 WriteBack
   // we when wrrfent1 == comreg1_tag
   ram_sync_nolatch_4r2w
     #(`REG_SEL, `DATA_LEN, `REG_NUM)
   regfile(
	   .clk(clk),
	   .raddr1(rs1_1),
	   .raddr2(rs2_1),
	   .raddr3(rs1_2),
	   .raddr4(rs2_2),
	   .rdata1(rs1_1data),
	   .rdata2(rs2_1data),
	   .rdata3(rs1_2data),
	   .rdata4(rs2_2data),
	   .waddr1(wreg1),
	   .waddr2(wreg2),
	   .wdata1(wdata1),
	   .wdata2(wdata2),
	   //	   .we1(we1_prior2),
	   .we1(we1_0reg),
	   .we2(we2_0reg)
	   );
   renaming_table rt(
		     .clk(clk),
		     .reset(reset),
		     .rs1_1(rs1_1),
		     .rs2_1(rs2_1),
		     .rs1_2(rs1_2),
		     .rs2_2(rs2_2),
		     .comreg1(wreg1),
		     .comreg2(wreg2),
		     .rs1_1tag(rs1_1tag),
		     .rs2_1tag(rs2_1tag),
		     .rs1_2tag(rs1_2tag),
		     .rs2_2tag(rs2_2tag),
		     .rs1_1busy(rs1_1busy),
		     .rs2_1busy(rs2_1busy),
		     .rs1_2busy(rs1_2busy),
		     .rs2_2busy(rs2_2busy),
		     .settagbusy1_addr(tagbusy1_addr),
		     .settagbusy2_addr(tagbusy2_addr),
		     .settagbusy1(tagbusy1_we),
		     .settagbusy2(tagbusy2_we),
		     .settag1(settag1),
		     .settag2(settag2),
		     .setbusy1_spectag(tagbusy1_spectag),
		     .setbusy2_spectag(tagbusy2_spectag),
		     .clearbusy1(clearbusy1),
		     .clearbusy2(clearbusy2),
		     .wrrfent1(wrrfent1),
		     .wrrfent2(wrrfent2),
		     .prmiss(prmiss),
		     .prsuccess(prsuccess),
		     .prtag(prtag),
		     .mpft_valid1(mpft_valid1),
		     .mpft_valid2(mpft_valid2)
		     );
endmodule