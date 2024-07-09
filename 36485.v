module
denise_collision col0
(
  .clk(clk),
  .clk7_en(clk7_en),
  .reset(reset),
  .aga(aga),
  .reg_address_in(reg_address_in),
  .data_in(data_in),
  .data_out(col_out),
  .dblpf(dpf),
  .bpldata(bpldata),
  .nsprite(nsprite)
);
always @(*) begin
  if (brdsprt && sprsel) // select border sprites
    clut_data = sprdata;
  else if (!window_ena) // we are outside of the visible window region, display border colour
    clut_data = 8'b000000;
  else if (sprsel) // select sprites
    clut_data = sprdata;
  else // select playfield
    clut_data = plfdata ^ bplxor;
end
reg window_del;
reg sprsel_del;
always @(posedge clk) begin
  window_del <= window_ena;
  sprsel_del <= sprsel;
end
// ham_rgb / clut_rgb multiplexer
wire  [24-1:0] out_rgb  = ham_sel && window_del && !sprsel_del ? ham_rgb : clut_rgb; //if no HAM mode, always select normal (table selected) rgb data
wire t_blank;
assign t_blank = blank | ecs & ecsena & brdrblnk & (~window_del | ~display_ena);
// RGB video output
assign {red[7:0],green[7:0],blue[7:0]} = t_blank ? 24'h000000 : out_rgb;
endmodule