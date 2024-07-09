module axi_infrastructure_v1_1_axic_srl_fifo #(
// Parameter Definitions
  parameter         C_FAMILY     = "virtex7",
  parameter integer C_PAYLOAD_WIDTH = 1,
  parameter integer C_FIFO_DEPTH = 16 // Range: 4-16.
)
(
// Port Declarations
  input  wire                        aclk,    // Clock
  input  wire                        aresetn,  // Reset
  input  wire [C_PAYLOAD_WIDTH-1:0]  s_payload,  // Input data
  input  wire                        s_valid, // Input data valid
  output reg                         s_ready, // Input data ready
  output wire [C_PAYLOAD_WIDTH-1:0]  m_payload,  // Output data
  output reg                         m_valid, // Output data valid
  input  wire                        m_ready  // Output data ready
);
// Functions
// ceiling logb2
function integer f_clogb2 (input integer size);
  integer s;
  begin
    s = size;
    s = s - 1;
    for (f_clogb2=1; s>1; f_clogb2=f_clogb2+1)
          s = s >> 1;
  end
endfunction // clogb2
// Local parameters
localparam integer LP_LOG_FIFO_DEPTH = f_clogb2(C_FIFO_DEPTH);
// Wires/Reg declarations
reg  [LP_LOG_FIFO_DEPTH-1:0]        fifo_index;
wire [4-1:0]                        fifo_addr;
wire                                push;
wire                                pop ;
reg                                 areset_r1;
// BEGIN RTL
always @(posedge aclk) begin
  areset_r1 <= ~aresetn;
end
always @(posedge aclk) begin
  if (~aresetn) begin
    fifo_index <= {LP_LOG_FIFO_DEPTH{1'b1}};
  end
  else begin
    fifo_index <= push & ~pop ? fifo_index + 1'b1 :
                  ~push & pop ? fifo_index - 1'b1 :
                  fifo_index;
  end
end
assign push = s_valid & s_ready;
always @(posedge aclk) begin
  if (~aresetn) begin
    s_ready <= 1'b0;
  end
  else begin
    s_ready <= areset_r1 ? 1'b1 :
               push & ~pop && (fifo_index == (C_FIFO_DEPTH - 2'd2)) ? 1'b0 :
               ~push & pop ? 1'b1 :
               s_ready;
  end
end
assign pop = m_valid & m_ready;
always @(posedge aclk) begin
  if (~aresetn) begin
    m_valid <= 1'b0;
  end
  else begin
    m_valid <= ~push & pop && (fifo_index == {LP_LOG_FIFO_DEPTH{1'b0}}) ? 1'b0 :
               push & ~pop ? 1'b1 :
               m_valid;
  end
end
generate
  if (LP_LOG_FIFO_DEPTH < 4) begin : gen_pad_fifo_addr
    assign fifo_addr[0+:LP_LOG_FIFO_DEPTH] = fifo_index[LP_LOG_FIFO_DEPTH-1:0];
    assign fifo_addr[LP_LOG_FIFO_DEPTH+:(4-LP_LOG_FIFO_DEPTH)] = {4-LP_LOG_FIFO_DEPTH{1'b0}};
  end
  else begin : gen_fifo_addr
    assign fifo_addr[LP_LOG_FIFO_DEPTH-1:0] = fifo_index[LP_LOG_FIFO_DEPTH-1:0];
  end
endgenerate
generate
  genvar i;
  for (i = 0; i < C_PAYLOAD_WIDTH; i = i + 1) begin : gen_data_bit
    SRL16E
    u_srl_fifo(
      .Q   ( m_payload[i] ) ,
      .A0  ( fifo_addr[0]     ) ,
      .A1  ( fifo_addr[1]     ) ,
      .A2  ( fifo_addr[2]     ) ,
      .A3  ( fifo_addr[3]     ) ,
      .CE  ( push              ) ,
      .CLK ( aclk              ) ,
      .D   ( s_payload[i] )
    );
  end
endgenerate
endmodule