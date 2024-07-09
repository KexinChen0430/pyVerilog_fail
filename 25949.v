module outputs)
   wire [7:0]		out_data;		// From decode_ctl of decode_ctl.v
   wire			out_done;		// From decode_ctl of decode_ctl.v
   wire			out_valid;		// From decode_ctl of decode_ctl.v
   wire			stream_ack;		// From decode_ctl of decode_ctl.v
   wire [12:0]		stream_data;		// From decode_in of decode_in.v
   wire			stream_done;		// From decode_in of decode_in.v
   wire			stream_valid;		// From decode_in of decode_in.v
   wire [3:0]		stream_width;		// From decode_ctl of decode_ctl.v
   // End of automatics
   /* Local variable */
   // End definition
   decode_in  decode_in (/*AUTOINST*/
			 // Outputs
			 .m_src_getn		(m_src_getn),
			 .stream_data		(stream_data[12:0]),
			 .stream_valid		(stream_valid),
			 .stream_done		(stream_done),
			 // Inputs
			 .clk			(clk),
			 .rst			(rst),
			 .ce			(ce),
			 .m_last		(m_last),
			 .fo_full		(fo_full),
			 .src_empty		(src_empty),
			 .fi			(fi[63:0]),
			 .stream_width		(stream_width[3:0]),
			 .stream_ack		(stream_ack));
   decode_ctl decode_ctl (/*AUTOINST*/
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
   decode_out decode_out (/*AUTOINST*/
			  // Outputs
			  .data_o		(data_o[15:0]),
			  .valid_o		(valid_o),
			  .done_o		(done_o),
			  // Inputs
			  .clk			(clk),
			  .rst			(rst),
			  .out_valid		(out_valid),
			  .out_done		(out_done),
			  .out_data		(out_data[7:0]));
endmodule