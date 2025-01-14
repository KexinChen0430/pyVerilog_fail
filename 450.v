module
  output wire [C_ID_WIDTH-1:0]                r_arid            ,
  output wire                                 r_push            ,
  output wire                                 r_rlast           ,
  input  wire                                 r_full
);
// Wires/Reg declarations
wire                        next      ;
wire                        next_pending ;
wire                        a_push;
wire                        incr_burst;
reg [C_ID_WIDTH-1:0]        s_arid_r;
// BEGIN RTL
// Translate the AXI transaction to the MC transaction(s)
axi_protocol_converter_v2_1_b2s_cmd_translator #
(
  .C_AXI_ADDR_WIDTH ( C_AXI_ADDR_WIDTH )
)
cmd_translator_0
(
  .clk           ( clk                   ) ,
  .reset         ( reset                 ) ,
  .s_axaddr      ( s_araddr              ) ,
  .s_axlen       ( s_arlen               ) ,
  .s_axsize      ( s_arsize              ) ,
  .s_axburst     ( s_arburst             ) ,
  .s_axhandshake ( s_arvalid & a_push    ) ,
  .incr_burst    ( incr_burst            ) ,
  .m_axaddr      ( m_araddr              ) ,
  .next          ( next                  ) ,
  .next_pending  ( next_pending          )
);
axi_protocol_converter_v2_1_b2s_rd_cmd_fsm ar_cmd_fsm_0
(
  .clk          ( clk            ) ,
  .reset        ( reset          ) ,
  .s_arready    ( s_arready      ) ,
  .s_arvalid    ( s_arvalid      ) ,
  .s_arlen      ( s_arlen        ) ,
  .m_arvalid    ( m_arvalid      ) ,
  .m_arready    ( m_arready      ) ,
  .next         ( next           ) ,
  .next_pending ( next_pending   ) ,
  .data_ready   ( ~r_full        ) ,
  .a_push       ( a_push         ) ,
  .r_push       ( r_push         )
);
// these signals can be moved out of this block to the top level.
assign r_arid  = s_arid_r;
assign r_rlast = ~next_pending;
always @(posedge clk) begin
  s_arid_r <= s_arid ;
end
endmodule