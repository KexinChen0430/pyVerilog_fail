module contains the actual blocks that we want to test.
   wire [WDTH-1:0]         out_samples;
   wire                    out_samples_nd;
   wire [`MSG_WIDTH-1:0]   out_msg;
   wire                    out_msg_nd;
   wire                    contents_error;
   wire [WDTH-1:0]         in_samples_shifted;
   assign in_samples_shifted = {in_samples[WDTH-3:WDTH/2-1], 1'b0, in_samples[WDTH/2-2: 0], 1'b0};
   // FIXME We should be able to turn off the meta info flow.
   reg                          in_m;
   wire                         out_m;
   qa_contents #(WDTH, 1) qa_contents_0
     (.clk(clk),
      .rst_n(rst_n),
      .in_data(in_samples_shifted),
      .in_nd(in_samples_nd),
      .in_m(in_m),
      .in_msg(in_msg),
      .in_msg_nd(in_msg_nd),
      .out_data(out_samples),
      .out_nd(out_samples_nd),
      .out_m(out_m),
      .out_msg(out_msg),
      .out_msg_nd(out_msg_nd),
      .error(contents_error)
      );
   // The samples and messages are merged into common stream.
   wire                    combiner_error;
   wire [WDTH-1:0]         out_samples_shifted;
   assign out_samples_shifted = {2'b0, out_samples[WDTH-1 :WDTH/2+1], out_samples[WDTH/2-1 :1]};
   wire [WDTH-1:0]         almostout_data;
   wire                    almostout_nd;
   message_stream_combiner #(2, 1, WDTH, `COMBINER_BUFFER_LENGTH, `LOG_COMBINER_BUFFER_LENGTH, `MAX_PACKET_LENGTH, `MSG_LENGTH_WIDTH) message_stream_combiner_0
     (.clk(clk),
      .rst_n(rst_n),
      .in_data({out_samples_shifted, out_msg}),
      .in_nd({out_samples_nd, out_msg_nd}),
      .out_data(almostout_data),
      .out_nd(almostout_nd),
      .error(combiner_error)
      );
   wire                    error;
   assign error = splitter_error | contents_error | combiner_error;
   assign out_nd = (error)?1'b1:almostout_nd;
   assign out_data = (error)?`ERRORCODE:almostout_data;
endmodule