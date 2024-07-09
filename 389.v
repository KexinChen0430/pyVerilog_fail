module
  input  wire                                 r_push           ,
  output wire                                 r_full           ,
  // length not needed. Can be removed.
  input  wire [C_ID_WIDTH-1:0]                r_arid           ,
  input  wire                                 r_rlast
);
// Local parameters
localparam P_WIDTH = 1+C_ID_WIDTH;
localparam P_DEPTH = 32;
localparam P_AWIDTH = 5;
localparam P_D_WIDTH = C_DATA_WIDTH + 2;
// rd data FIFO depth varies based on burst length.
// For Bl8 it is two times the size of transaction FIFO.
// Only in 2:1 mode BL8 transactions will happen which results in
// two beats of read data per read transaction.
localparam P_D_DEPTH  = 32;
localparam P_D_AWIDTH = 5;
// Wire and register declarations
wire [C_ID_WIDTH+1-1:0]    trans_in;
wire [C_ID_WIDTH+1-1:0]    trans_out;
wire                       tr_empty;
wire                       rhandshake;
wire                       r_valid_i;
wire [P_D_WIDTH-1:0]       rd_data_fifo_in;
wire [P_D_WIDTH-1:0]       rd_data_fifo_out;
wire                       rd_en;
wire                       rd_full;
wire                       rd_empty;
wire                       rd_a_full;
wire                       fifo_a_full;
reg [C_ID_WIDTH-1:0]       r_arid_r;
reg                        r_rlast_r;
reg                        r_push_r;
wire                       fifo_full;
// BEGIN RTL
assign s_rresp  = rd_data_fifo_out[P_D_WIDTH-1:C_DATA_WIDTH];
assign s_rid    = trans_out[1+:C_ID_WIDTH];
assign s_rdata  = rd_data_fifo_out[C_DATA_WIDTH-1:0];
assign s_rlast  = trans_out[0];
assign s_rvalid = ~rd_empty & ~tr_empty;
// assign MCB outputs
assign rd_en      = rhandshake & (~rd_empty);
assign rhandshake =(s_rvalid & s_rready);
// register for timing
always @(posedge clk) begin
  r_arid_r <= r_arid;
  r_rlast_r <= r_rlast;
  r_push_r <= r_push;
end
assign trans_in[0]  = r_rlast_r;
assign trans_in[1+:C_ID_WIDTH]  = r_arid_r;
// rd data fifo
axi_protocol_converter_v2_1_b2s_simple_fifo #(
  .C_WIDTH                (P_D_WIDTH),
  .C_AWIDTH               (P_D_AWIDTH),
  .C_DEPTH                (P_D_DEPTH)
)
rd_data_fifo_0
(
  .clk     ( clk              ) ,
  .rst     ( reset            ) ,
  .wr_en   ( m_rvalid & m_rready ) ,
  .rd_en   ( rd_en            ) ,
  .din     ( rd_data_fifo_in  ) ,
  .dout    ( rd_data_fifo_out ) ,
  .a_full  ( rd_a_full        ) ,
  .full    ( rd_full          ) ,
  .a_empty (                  ) ,
  .empty   ( rd_empty         )
);
assign rd_data_fifo_in = {m_rresp, m_rdata};
axi_protocol_converter_v2_1_b2s_simple_fifo #(
  .C_WIDTH                  (P_WIDTH),
  .C_AWIDTH                 (P_AWIDTH),
  .C_DEPTH                  (P_DEPTH)
)
transaction_fifo_0
(
  .clk     ( clk         ) ,
  .rst     ( reset       ) ,
  .wr_en   ( r_push_r    ) ,
  .rd_en   ( rd_en       ) ,
  .din     ( trans_in    ) ,
  .dout    ( trans_out   ) ,
  .a_full  ( fifo_a_full ) ,
  .full    (             ) ,
  .a_empty (             ) ,
  .empty   ( tr_empty    )
);
assign fifo_full = fifo_a_full | rd_a_full ;
assign r_full = fifo_full ;
assign m_rready = ~rd_a_full;
endmodule