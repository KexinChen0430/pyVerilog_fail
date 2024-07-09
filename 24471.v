module temp_blockram (input         clk,
                      input         reset,
                      input [31:0]  cmd_address,
                      input         cmd_wr,
                      input         cmd_enable,
                      output reg    cmd_ready,
                      input [31:0]  cmd_data_in,
                      output [31:0] data_out,
                      output reg    data_out_ready);
   wire [31:0]                      none;
   toyblockram #(.RAM_DEPTH(`SIM_RAM_SIZE))
     inner
       (.clk(clk),
        .addr_a({2'b0,cmd_address[31:2]}),
        .datain_a(cmd_data_in),
        .wr_a(cmd_wr),
        .data_a(data_out),
        .data_b(none),
        .addr_b({2'b0,cmd_address[31:2]}));
   always @(posedge clk)
     if (!reset) begin
        cmd_ready <= 1;
        data_out_ready <= 0;
     end else
       begin
        if(cmd_ready) begin
           if (cmd_wr && cmd_enable) begin
              data_out_ready <= 0; cmd_ready <= 0;
           end else if(cmd_enable) begin
              data_out_ready <= 1; cmd_ready <= 0;
           end else if (!cmd_enable) begin data_out_ready <= 0; end
        end else cmd_ready <= 1;
       end
endmodule