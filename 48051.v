module sends
// the number of burst length to rd_data_gen, wr_data_gen  and mcb_flow_control_v6.
// The mcb_flow_control takes the base address of the first burst and the bl value,
// it automatically increment the next consecutive address of the back-to-back commands
// until the burst counts decrement to 0.
always @ (posedge clk_i) begin
   if (mode_load_pulse || rst_i[3])
        bl_out <= #TCQ    fixed_bl_i ;
   else if (cmd_clk_en) begin
     case({bl_mode_reg})
         0: bl_out <= #TCQ  bram_bl_i  ;
         1: if (data_mode_i == 4)
                bl_out <= #TCQ  10'd8 ;
            else
                bl_out <= #TCQ  fixed_bl_i ;
         2: bl_out <= #TCQ  prbs_brlen;
         default : bl_out <= #TCQ    6'h1;
     endcase
   end
end
  //synthesis translate_off
//always @ (bl_out)
//  if(bl_out >2 && FAMILY == "VIRTEX6") begin
//   $display("Error ! Not valid burst length");
//   $stop;
//   end
  //synthesis translate_on
generate
if (CMD_PATTERN == "CGEN_PRBS" || CMD_PATTERN == "CGEN_ALL" ) begin: gen_prbs_bl
cmd_prbs_gen #
      (
    .TCQ               (TCQ),
    .FAMILY      (FAMILY),
    .PRBS_CMD    ("BLEN"),
    .ADDR_WIDTH  (32),
    .SEED_WIDTH  (15),
    .PRBS_WIDTH  (20)
   )
   bl_prbs_gen
  (
   .clk_i             (clk_i),
   .clk_en            (cmd_clk_en),
   .prbs_seed_init    (load_seed_i),
   .prbs_seed_i       (cmd_seed_i[16:2]),
   .prbs_o            (prbs_bl)
  );
end
always @ (prbs_bl)
if (FAMILY == "SPARTAN6" || FAMILY == "MCB")  // supports 1 throug 64
    prbs_brlen[5:0]  =  (prbs_bl[5:1] == 5'b00000) ? 6'b000010: {prbs_bl[5:1],1'b0};
else // VIRTEX6 only supports 1 or 2 burst on user ports
     prbs_brlen =  (prbs_bl[BL_WIDTH-1:1] == 5'b00000) ? {{BL_WIDTH-2{1'b0}},2'b10}: {prbs_bl[BL_WIDTH-1:1],1'b0};
endgenerate
endmodule