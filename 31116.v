module dpth_top (
  // Top level control signals
  input  wire        clk,
  input  wire        rst_n,
  // Inputs from control
  input  wire        ld_ra,
  input  wire        ld_ir,
  input  wire        ld_pc,
  input  wire        ld_rat,
  input  wire        ld_rz,
  input  wire        ld_rn,
  input  wire        pc_at,
  input  wire [1:0]  crf,
  input  wire        erd,
  input  wire        operate,
  // Outputs to control
  output wire [1:0]  ir_ctrl,
  output wire        cond,
  // Input from memory
  input  wire [15:0] m_out,
  // Outputs to memory
  output wire [15:0] m_in,
  output wire [7:0]  m_at
);
  // Local wires
  reg  [3:0]  sl;
  wire [15:0] ir;
  wire [15:0] rx;
  wire [15:0] din;
  // Register file management
  dpth_regfile regfile (
    // Top level control signals
    .clk   ( clk        ),
    // Input data
    .rd_at ( sl         ),
    .wr_at ( ir[`IR_RD] ),
    .wr_en ( erd        ),
    .din   ( din        ),
    // Output data
    .dout  ( rx         )
  );
  dpth_alu_top alu_top (
    .clk     ( clk      ),
    .rst_n   ( rst_n    ),
  // Inputs
    .rx      ( rx       ),
    .m_data  ( m_out    ),
  // Outputs
    .ir      ( ir       ),
    .alu_out ( din      ),
    .rz      ( rz       ),
    .rn      ( rn       )
  );
  dpth_br_cnd br_cnd (
    .z       ( rz        ),
    .n       ( rn        ),
    .irc     ( ir[13:11] ),
    .cond    ( cond      )
  );
  dpth_addr addr (
  // Top level control signals
  .clk       ( clk       ),
  .rst_n     ( rst_n     ),
  // Inputs
  .ir_low    ( ir[7:0]   ),
  .rx_low    ( rx[7:0]   ),
  .ld_rat    ( ld_rat    ),
  .ld_pc     ( ld_pc     ),
  .pc_at     ( pc_at     ),
  // Output
  .m_at      ( m_at      )
  );
  always @(*)
  begin
    case (crf)
      2'b00:   sl <= ir[`IR_RD];
      2'b01:   sl <= ir[`IR_RI];
      2'b10:   sl <= ir[`IR_RF];
      default: sl <= 3'b000;
    endcase
  end
  // Output assignments
  assign m_in = rx;
endmodule