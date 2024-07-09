module outputs)
   wire			ce;			// From data of data.v
   wire			clk;			// From tb_data of tb_data.v, ...
   wire [63:0]		fi;			// From data of data.v
   wire			fo_full;		// From tb_data of tb_data.v, ...
   wire			m_last;			// From data of data.v
   wire			m_src_getn;		// From decode_in of decode_in.v
   wire			rst;			// From tb_data of tb_data.v, ...
   wire			src_empty;		// From data of data.v
   wire			stream_ack;		// From decode_ctl of decode_ctl.v
   wire			stream_done;		// From decode_in of decode_in.v
   wire			stream_valid;		// From tb_data of tb_data.v, ...
   // End of automatics
   /* Local variable */
   wire [NEED_STR_WIDTH-1:0] stream_width;
   wire [IN_WIDTH-1:0] 	     stream_data;
   // End definition
   integer 		     c, cnt, o;
   parameter 		     SRC_FILE = "/home/kevin/lzf-hg.git/files/texbook.pdf";
   parameter 		     LZS_FILE = "/home/kevin/lzf-hg.git/files/01";
   parameter 		     OUT_FILE = "/tmp/t.lzs";
   parameter                 LZS_SIZE = 299;
   reg [255:0] lzs_file;
   reg [31:0]  lzs_size;
   reg [255:0] src_file;
//`define ABC
`ifdef ABC
   tb_data tb_data(/*AUTOINST*/
		   // Outputs
		   .stream_valid	(stream_valid),
		   .stream_data		(stream_data[IN_WIDTH-1:0]),
		   .stream_empty	(stream_empty),
		   .fo_full		(fo_full),
		   .clk			(clk),
		   .ce_decode		(ce_decode),
		   .rst			(rst),
		   // Inputs
		   .stream_ack		(stream_ack),
		   .stream_width	(stream_width[3:0]));
`else // !`ifdef ABC
   data  data(/*AUTOINST*/
	      // Outputs
	      .clk			(clk),
	      .rst			(rst),
	      .src_empty		(src_empty),
	      .ce			(ce),
	      .fo_full			(fo_full),
	      .m_last			(m_last),
	      .fi			(fi[63:0]),
	      .fi_cnt			(fi_cnt[LZF_WIDTH-1:0]),
	      // Inputs
	      .m_src_getn		(m_src_getn),
	      .m_endn			(m_endn));
   defparam    data.LZF_FILE = "/tmp/decode.src";
   defparam    data.LZF_DEBUG = 0;
   defparam    data.LZF_DELAY = 4;
   defparam    data.LZF_FIFO_AW = 5;
   decode_in decode_in(/*AUTOINST*/
		       // Outputs
		       .m_src_getn	(m_src_getn),
		       .stream_data	(stream_data[12:0]),
		       .stream_valid	(stream_valid),
		       .stream_done	(stream_done),
		       // Inputs
		       .clk		(clk),
		       .rst		(rst),
		       .ce		(ce),
		       .m_last		(m_last),
		       .fo_full		(fo_full),
		       .src_empty	(src_empty),
		       .fi		(fi[63:0]),
		       .stream_width	(stream_width[3:0]),
		       .stream_ack	(stream_ack));
`endif
   initial
     begin : VCD_and_MEM
	$dumpfile("tb.vcd");
	$dumpvars(0,tb);
        if (0 == $value$plusargs("SRC_FILE=%s", src_file))
           src_file = SRC_FILE;
	c = $fopen(src_file, "r");
	o = $fopen(OUT_FILE, "w");
        cnt = 0;
        @(posedge out_done);
	$finish;
     end
   decode_ctl decode_ctl(/*AUTOINST*/
			 // Outputs
			 .stream_width		(stream_width[3:0]),
			 .stream_ack		(stream_ack),
			 .out_data		(out_data[7:0]),
			 .out_valid		(out_valid),
			 .out_done		(out_done),
			 // Inputs
			 .clk			(clk),
			 .rst			(rst),
			 .ce			(ce),
			 .fo_full		(fo_full),
			 .stream_data		(stream_data[12:0]),
			 .stream_valid		(stream_valid),
			 .stream_done		(stream_done));
   reg [7:0] s_data;
   always @(posedge clk)
     begin
	if (out_valid) begin
	   $fputc(o, out_data);
	   s_data = $fgetc(c);
	   if (s_data === out_data) begin
	     $write("cnt %h: right %h \n", cnt, out_data);
           end else begin
	      $write("cnt %h: right/current %h/%h\n",
		     cnt, s_data, out_data);
	      $dumpflush(".");
	      //$stop;
	   end
	   cnt = cnt + 1;
	end
     end
endmodule