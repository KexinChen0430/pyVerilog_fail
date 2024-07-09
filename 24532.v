module which handles the
    // actual clock crossing
    altera_avalon_st_clock_crosser
    #(
        .SYMBOLS_PER_BEAT    (1),
        .BITS_PER_SYMBOL     (PAYLOAD_WIDTH),
        .FORWARD_SYNC_DEPTH  (VALID_SYNC_DEPTH),
        .BACKWARD_SYNC_DEPTH (READY_SYNC_DEPTH),
        .USE_OUTPUT_PIPELINE (USE_OUTPUT_PIPELINE)
    ) clock_xer (
        .in_clk    (in_clk      ),
        .in_reset  (in_reset    ),
        .in_ready  (in_ready    ),
        .in_valid  (in_valid    ),
        .in_data   (in_payload  ),
        .out_clk   (out_clk     ),
        .out_reset (out_reset   ),
        .out_ready (out_ready   ),
        .out_valid (out_valid   ),
        .out_data  (out_payload )
    );
    // Split out_payload into the output signals.
    assign out_data = out_payload[DATA_WIDTH - 1 : 0];
    generate
        // optional packet outputs
        if (USE_PACKETS) begin
            assign {out_startofpacket, out_endofpacket} =
                out_payload[DATA_WIDTH + PACKET_WIDTH - 1 : DATA_WIDTH];
        end else begin
            // avoid a "has no driver" warning.
            assign {out_startofpacket, out_endofpacket} = 2'b0;
        end
        // optional channel output
        if (USE_CHANNEL) begin
            assign out_channel = out_payload[
              DATA_WIDTH + PACKET_WIDTH + PCHANNEL_W - 1 :
              DATA_WIDTH + PACKET_WIDTH
            ];
        end else begin
            // avoid a "has no driver" warning.
            assign out_channel = 1'b0;
        end
        // optional empty output
        if (EMPTY_WIDTH) begin
            assign out_empty = out_payload[
              DATA_WIDTH + PACKET_WIDTH + PCHANNEL_W + EMPTY_WIDTH - 1 :
              DATA_WIDTH + PACKET_WIDTH + PCHANNEL_W
            ];
        end else begin
            // avoid a "has no driver" warning.
            assign out_empty = 1'b0;
        end
        // optional error output
        if (USE_ERROR) begin
            assign out_error = out_payload[
              DATA_WIDTH + PACKET_WIDTH + PCHANNEL_W + EMPTY_WIDTH + PERROR_W - 1 :
              DATA_WIDTH + PACKET_WIDTH + PCHANNEL_W + EMPTY_WIDTH
            ];
        end else begin
            // avoid a "has no driver" warning.
            assign out_error = 1'b0;
        end
    endgenerate
    // Calculates the log2ceil of the input value.
    function integer log2ceil;
        input integer val;
        integer i;
        begin
            i = 1;
            log2ceil = 0;
            while (i < val) begin
                log2ceil = log2ceil + 1;
                i = i << 1;
            end
        end
    endfunction
endmodule