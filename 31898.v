module bsg_mem_1rw_sync_mask_write_bit #(
  parameter `BSG_INV_PARAM(width_p )
  , parameter `BSG_INV_PARAM(els_p )
  , parameter latch_last_read_p=0
  , parameter enable_clock_gating_p=0
  , localparam addr_width_lp = `BSG_SAFE_CLOG2(els_p)
) (
  input                                     clk_i
  , input                                   reset_i
  , input  [`BSG_SAFE_MINUS(width_p,1):0] data_i
  , input  [ addr_width_lp-1:0]             addr_i
  , input                                   v_i
  , input  [`BSG_SAFE_MINUS(width_p,1):0] w_mask_i
  , input                                   w_i
  , output [`BSG_SAFE_MINUS(width_p,1):0] data_o
);
  wire unused = reset_i;
  if (width_p == 0)
   begin: z
     wire unused0 = &{clk_i, v_i, data_i, addr_i, w_i};
     assign data_o = '0;
   end
  else
   begin: nz
  (* ram_style = "distributed" *) logic [`BSG_SAFE_MINUS(width_p,1):0] mem [els_p-1:0];
  logic [`BSG_SAFE_MINUS(width_p,1):0] data_r;
  always_ff @(posedge clk_i) begin
    if (v_i & ~w_i)
      data_r <= mem[addr_i];
  end
  initial
    begin
      $display("BSG INFO: els_p=%d width_p=%d 1RW SRAM Mask Write ram will be inferred as distributed RAM.",els_p,width_p);
    end
  assign data_o = data_r;
  for (genvar i=0; i<width_p; i=i+1) begin
    always_ff @(posedge clk_i) begin
      if (v_i)
        if (w_i & w_mask_i[i])
          mem[addr_i][i] <= data_i[i];
    end
  end
  end // non_zero_width
endmodule