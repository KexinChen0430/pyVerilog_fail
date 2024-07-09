module outputs)
   wire			stream_ack;		// From jhash_core of jhash_core.v
   wire [31:0]		stream_data0;		// From jhash_in of jhash_in.v
   wire [31:0]		stream_data1;		// From jhash_in of jhash_in.v
   wire [31:0]		stream_data2;		// From jhash_in of jhash_in.v
   wire			stream_done;		// From jhash_in of jhash_in.v
   wire [1:0]		stream_left;		// From jhash_in of jhash_in.v
   wire			stream_valid;		// From jhash_in of jhash_in.v
   // End of automatics
   jhash_in   jhash_in  (/*AUTOINST*/
			 // Outputs
			 .m_src_getn		(m_src_getn),
			 .stream_data0		(stream_data0[31:0]),
			 .stream_data1		(stream_data1[31:0]),
			 .stream_data2		(stream_data2[31:0]),
			 .stream_valid		(stream_valid),
			 .stream_done		(stream_done),
			 .stream_left		(stream_left[1:0]),
			 // Inputs
			 .ce			(ce),
			 .clk			(clk),
			 .fi			(fi[63:0]),
			 .fo_full		(fo_full),
			 .m_last		(m_last),
			 .rst			(rst),
			 .src_empty		(src_empty),
			 .stream_ack		(stream_ack));
   jhash_core jhash_core(/*AUTOINST*/
			 // Outputs
			 .stream_ack		(stream_ack),
			 .hash_out		(hash_out[31:0]),
			 .hash_done		(hash_done),
			 .m_endn		(m_endn),
			 // Inputs
			 .clk			(clk),
			 .rst			(rst),
			 .ce			(ce),
			 .stream_data0		(stream_data0[31:0]),
			 .stream_data1		(stream_data1[31:0]),
			 .stream_data2		(stream_data2[31:0]),
			 .stream_valid		(stream_valid),
			 .stream_done		(stream_done),
			 .stream_left		(stream_left[1:0]));
endmodule