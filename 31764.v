module outputs)
   wire			ce;			// From data of data.v
   wire			clk;			// From data of data.v
   wire [63:0]		fi;			// From data of data.v
   wire			fo_full;		// From data of data.v
   wire			m_last;			// From data of data.v
   wire			m_src_getn;		// From encode of encode.v
   wire			rst;			// From data of data.v
   wire			src_empty;		// From data of data.v
   // End of automatics
   data data(/*AUTOINST*/
	     // Outputs
	     .clk			(clk),
	     .rst			(rst),
	     .src_empty			(src_empty),
	     .ce			(ce),
	     .fo_full			(fo_full),
	     .m_last			(m_last),
	     .fi			(fi[63:0]),
	     .fi_cnt			(fi_cnt[LZF_WIDTH-1:0]),
	     // Inputs
	     .m_src_getn		(m_src_getn),
	     .m_endn			(m_endn));
   defparam
	   data.LZF_FILE = "/tmp/encode.src";
   /*defparam
 	   data.LZF_SIZE = 512;*/
   defparam
	   data.LZF_DEBUG = 0;
   defparam
	   data.LZF_DELAY = 20;
   defparam
	   data.LZF_FIFO_AW = 15;
   encode encode(/*AUTOINST*/
		 // Outputs
		 .data_o		(data_o[15:0]),
		 .done_o		(done_o),
		 .m_src_getn		(m_src_getn),
		 .valid_o		(valid_o),
		 // Inputs
		 .ce			(ce),
		 .clk			(clk),
		 .fi			(fi[63:0]),
		 .fo_full		(fo_full),
		 .m_last		(m_last),
		 .rst			(rst),
		 .src_empty		(src_empty));
   parameter 		OUT_FILE = "/tmp/t.lzs";
   integer 		f;
   //parameter 		CHECK_FILE = "/tmp/c.lzs";
   parameter 		CHECK_FILE = "/tmp/encode.chk";
   integer 		c, cnt;
   initial begin
      $dumpfile("tb.vcd");
      $dumpvars(0, top);
      $write("using %s as source file size is %d\n",
	     data.LZF_FILE, data.fi_cnt);
      $write("using %s as check file\n",
	     CHECK_FILE);
      $write("output file is %s\n",
	     OUT_FILE);
   end
   reg [7:0] data;
   always @(posedge clk or posedge rst)
     begin
	if (rst) begin
	   f = $fopen(OUT_FILE, "w");
	   c = $fopen(CHECK_FILE, "r");
	   cnt = 0;
	end else if (encode.out.valid_o) begin
	   data = $fgetc(c);
	   /*if (data == encode.out.do[15:08])
	     $write("cnt %h: high right %h\n", cnt, encode.out.do[15:08]);*/
	   if (data != encode.out.data_o[15:08]) begin
	      $write("cnt %h: right/current %h/%h\n",
		     cnt, data, encode.out.data_o[15:08]);
	      $dumpflush(".");
	      $stop;
	   end
	   $fputc(f, encode.out.data_o[15:08]);
	   cnt = cnt + 1;
	   data = $fgetc(c);
	   /*if (data == encode.out.do[07:00])
	     $write("cnt %h: low  right %h\n", cnt, encode.out.do[07:00]);*/
	   if (data != encode.out.data_o[07:00]) begin
	      $write("cnt %h: right/current %h/%h\n",
		     cnt, data, encode.out.data_o[07:00]);
	      $dumpflush(".");
	      $stop;
	   end
	   $fputc(f, encode.out.data_o[07:00]);
	   cnt = cnt + 1;
	end
     end // always @ (posedge clk)
endmodule