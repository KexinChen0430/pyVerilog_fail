module compute(
	rst_i,
	clk_i,
//´Ómemory¶Á³öµÄ32Î»Êý¾Ý
	dat_i,
//×´Ì¬»ú¿ØÖÆÐÅºÅ
	shift_en,     //ÐÅºÅÓÐÐ§£¬Ôò¸üÐÂresult_row
	prev_row_load,    //ÐÅºÅÓÐÐ§£¬Ôò±íÊ¾dat_iÊÇµÚ1ÐÐµÄÊý¾Ý
	curr_row_load,		//ÐÅºÅÓÐÐ§£¬Ôò±íÊ¾dat_iÊÇµÚ2ÐÐµÄÊý¾Ý
	next_row_load,		//ÐÅºÅÓÐÐ§£¬Ôò±íÊ¾dat_iÊÇµÚ3ÐÐµÄÊý¾Ý
//ÔËËã½á¹û
	result_row     //°üº¬ËÄ¸öÏñËØµÄ½á¹û
    );
input clk_i;
input rst_i;
input[31:0] dat_i;
input  shift_en;
input  prev_row_load;
input  curr_row_load;
input  next_row_load;
output[31:0] result_row;
reg [31:0] prev_row=0, curr_row=0, next_row=0;
reg [7:0] O[-1:1][-1:1]; //ÓÃÀ´´æ·Å´ý¼ÆËãµÄ9£¨3*3£©¸öÏñËØÖµ
reg signed 	[10:0] Dx=0, Dy=0;
reg [7:0] abs_D = 0 ;
reg [31:0] result_row =0 ; //´¢´æ¼ÆËã½á¹û£¬°üº¬ËÄ¸öÏñËØµÄ¼ÆËã½á¹û
//µ±XXX_row_loadÓÐÐ§µÄÊ±ºò£¬½«XXXÐÐµÄËÄ¸öÏñËØÖµ¶ÁÈë32bit¼Ä´æÆ÷
//µ±shift_enÓÐÐ§Ê±£¬32bit¼Ä´æÆ÷×óÒÆ1×Ö½Ú£¬ÒÆ³öÈ¥µÄ²¿·Ö½øÈë3*3¼Ä´æÆ÷[7:0] O[-1:1][-1:1]
//Í¬Ê±3*3¼Ä´æÆ÷Êä³öÒ»¸ö¼ÆËã½á¹û
always@(posedge clk_i)
	if(prev_row_load)
	   prev_row	<= dat_i;
	else
	  if(shift_en)
	    prev_row[31:8] <= prev_row[23:0];
always@(posedge clk_i)
	if(curr_row_load)
	   curr_row<= dat_i;
	else
	  if(shift_en )
	    curr_row [31:8]<=curr_row[23:0];
always@(posedge clk_i)
	if(next_row_load)
	   next_row<=dat_i;
	else
	  if(shift_en )
	     next_row [31:8]<=next_row[23:0];
//Çó¾ø¶ÔÖµ
function [10:0]	abs ( input signed [10:0] x);
	abs = x >=0 ? x : -x ;
endfunction
always @(posedge clk_i)
   if(rst_i)
      begin
            O[-1][-1]<=0;
	          O[-1][ 0]<=0;
	          O[-1][+1]<=0;
	          O[ 0][-1]<=0;
	          O[ 0][ 0]<=0;
	          O[ 0][+1]<=0;
	          O[+1][-1]<=0;
	          O[+1][ 0]<=0;
	          O[+1][+1]<=0;
	   end
	else
	if ( shift_en )
	begin
		abs_D <= (abs(Dx) + abs(Dy))>>3;
		Dx	<= -$signed({3'b000, O[-1][-1]})	        //-1* O[-1][-1]
				  +$signed({3'b000, O[-1][+1]})	        //+1* O[-1][+1]
				  -($signed({3'b000, O[ 0][-1]})<<1)    //-2* O[ 0][-1]
				  +($signed({3'b000, O[ 0][+1]})<<1)	   //+2* O[ 0][+1]
				  -$signed({3'b000, O[+1][-1]})	        //-1* O[+1][-1]
				  +$signed({3'b000, O[+1][+1]});	       //+1* O[+1][+1]
		Dy	<= $signed({3'b000, O[-1][-1]})	         //+1* O[-1][-1]
				  +($signed({3'b000, O[-1][ 0]})<<1)    //+2* O[-1][0]
				  +$signed({3'b000, O[-1][+1]})	        //+1* O[-1][+1]
				  -$signed({3'b000, O[+1][-1]})         //-1* O[+1][-1]
				  -($signed({3'b000, O[+1][ 0]})<<1)    //-2* O[+1][ 0]
				  -$signed({3'b000, O[+1][+1]});	       //-1* O[+1][+1]
	  O[-1][-1]	<=	O[-1][0];
	  O[-1][ 0]	<=	O[-1][+1];
    O[-1][+1]	<=	prev_row[31:24];
    O[ 0][-1]	<=	O[0][0];
    O[ 0][ 0]	<=	O[0][+1];
    O[ 0][+1]	<=	curr_row[31:24];
    O[+1][-1]	<=	O[+1][0];
    O[+1][ 0]	<=	O[+1][+1];
    O[+1][+1]	<=	next_row[31:24];
  end
//¸üÐÂÊä³ö
always	@(posedge clk_i)
	if(shift_en)
	   result_row	<= { result_row[23:0], abs_D};
endmodule