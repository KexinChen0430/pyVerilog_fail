module zap_shifter_multiply
#(
        parameter PHY_REGS  = 46,
        parameter ALU_OPS   = 32
)
(
        input wire                              i_clk,
        input wire                              i_reset,
        // Clear and stall signals.
        input wire                              i_clear_from_writeback,
        input wire                              i_data_stall,
        input wire                              i_clear_from_alu,
        // ALU operation to perform. Activate if this is multiplication.
        input wire   [$clog2(ALU_OPS)-1:0]      i_alu_operation_ff,
        // This is not used.
        input wire                              i_cc_satisfied,
        // rm.rs + {rh,rn}. For non accumulate versions, rn = 0x0 and rh = 0x0.
        input wire [31:0]                       i_rm,
        input wire [31:0]                       i_rn,
        input wire [31:0]                       i_rh,
        input wire [31:0]                       i_rs,
        // Outputs.
        output reg  [31:0]                      o_rd,    // Result.
        output reg                              o_sat,
        output reg                              o_busy,  // Unit busy.
        output reg                              o_nozero // Don't set zero flag.
);
`include "zap_defines.vh"
`include "zap_localparams.vh"
`include "zap_functions.vh"
// States
localparam IDLE             = 0;
localparam S1               = 1;
localparam S2               = 2;
localparam S3               = 3;
localparam NUMBER_OF_STATES = 4;
reg         old_nozero_nxt, old_nozero_ff;
wire higher = i_alu_operation_ff[0]          ||
              i_alu_operation_ff == SMLAL00H ||
              i_alu_operation_ff == SMLAL01H ||
              i_alu_operation_ff == SMLAL10H ||
              i_alu_operation_ff == SMLAL11H;
// 17-bit partial products.
reg signed [16:0] a;
reg signed [16:0] b;
reg signed [16:0] c;
reg signed [16:0] d;
// Signed products.
reg signed [63:0] x_ff, x_nxt, y_ff, y_nxt;
reg signed [63:0] prod_ab, prod_bc, prod_ad, prod_cd;
// Indicates to take upper product.
reg                               take_upper;
// State
reg [$clog2(NUMBER_OF_STATES)-1:0] state_ff, state_nxt;
// Precompute products using DSP 17x17 signed multipliers.
always @ (posedge i_clk)
begin
        prod_ab <= $signed(a) * $signed(b);
        prod_bc <= $signed(b) * $signed(c);
        prod_ad <= $signed(a) * $signed(d);
        prod_cd <= $signed(c) * $signed(d);
end
always @* // {ac} * {bd} = RM x RS
begin
        take_upper = 0;
        if ( i_alu_operation_ff == SMLALL || i_alu_operation_ff == SMLALH )
        begin
                // Signed RM x Signed RS
                a = $signed({i_rm[31], i_rm[31:16]});
                c = $signed({1'd0, i_rm[15:0]});
                b = $signed({i_rs[31], i_rs[31:16]});
                d = $signed({1'd0, i_rs[15:0]});
        end
        else if ( i_alu_operation_ff == OP_SMULW0 )
        begin
                // Signed RM x Lower RS
                a = $signed({i_rm[31], i_rm[31:16]});
                c = $signed({1'd0, i_rm[15:0]});
                b = $signed({17{i_rs[15]}});
                d = $signed({1'd0, i_rs[15:0]});
                take_upper = 1;
        end
        else if ( i_alu_operation_ff == OP_SMULW1 )
        begin
                // Signed RM x Upper RS
                a = $signed({i_rm[31], i_rm[31:16]});
                c = $signed({1'd0, i_rm[15:0]});
                b = $signed({17{i_rs[31]}});
                d = $signed({1'd0, i_rs[31:16]});
                take_upper = 1;
        end
        else if ( i_alu_operation_ff == OP_SMUL00   || i_alu_operation_ff == OP_SMLA00  ||
                  i_alu_operation_ff == OP_SMLAL00L || i_alu_operation_ff == OP_SMLAL00H )
        begin
                // lower RM x lower RS
                a = $signed({17{i_rm[15]}});
                c = $signed({1'd0, i_rm[15:0]});
                b = $signed({17{i_rs[15]}});
                d = $signed({1'd0, i_rs[15:0]});
                if ( i_alu_operation_ff == OP_SMUL00 || i_alu_operation_ff == OP_SMLA00 )   take_upper = 1;
        end
        else if (  i_alu_operation_ff == OP_SMUL01   || i_alu_operation_ff == OP_SMLA01 ||
                   i_alu_operation_ff == OP_SMLAL01L || i_alu_operation_ff == OP_SMLAL01H )
        begin
                // lower RM x upper RS
                a = $signed({17{i_rm[15]}});         // x = 0 for Rm
                c = $signed({1'd0, i_rm[15:0]});
                b = $signed({17{i_rs[16]}});        // y = 1 for Rs
                d = $signed({1'd0, i_rs[31:16]});
                if ( i_alu_operation_ff == OP_SMUL01 || i_alu_operation_ff == OP_SMLA01 )   take_upper = 1;
        end
        else if ( i_alu_operation_ff == OP_SMUL10   || i_alu_operation_ff == OP_SMLA10 ||
                  i_alu_operation_ff == OP_SMLAL10L || i_alu_operation_ff == OP_SMLAL10H )
        begin
                // upper RM x lower RS
                a = $signed({17{i_rm[31]}});       // x = 1 for Rm
                c = $signed({1'd0, i_rm[31:16]});
                b = $signed({17{i_rs}});           // y = 0 for Rs
                d = $signed({1'd0, i_rs[15:0]});
                if ( i_alu_operation_ff == OP_SMUL10 || i_alu_operation_ff == OP_SMLA10 )   take_upper = 1;
        end
        else if ( i_alu_operation_ff == OP_SMUL11   || i_alu_operation_ff == OP_SMLA11 ||
                  i_alu_operation_ff == OP_SMLAL11L || i_alu_operation_ff == OP_SMLAL11H)
        begin
                // upper RM x upper RS
                a = $signed({17{i_rm[31]}});
                c = $signed({1'd0, i_rm[31:16]});
                b = $signed({17{i_rs[31]}});
                d = $signed({1'd0, i_rs[31:16]});
        end
        else
        begin
               // unsigned RM x RS
               a = $signed({1'd0, i_rm[31:16]});
               c = $signed({1'd0, i_rm[15:0]});
               b = $signed({1'd0, i_rs[31:16]});
               d = $signed({1'd0, i_rs[15:0]});
        end
end
always @*
begin
        old_nozero_nxt = old_nozero_ff;
        o_nozero       = 1'd0;
        o_busy         = 1'd1;
        o_rd           = 32'd0;
        state_nxt      = state_ff;
        x_nxt          = x_ff;
        o_sat          = 1'd0;
        y_nxt          = y_ff;
        case ( state_ff )
                IDLE:
                begin
                        o_busy = 1'd0;
                        // If we have the go signal.
                        if ( i_cc_satisfied && (i_alu_operation_ff == UMLALL ||
                                                i_alu_operation_ff == UMLALH ||
                                                i_alu_operation_ff == SMLALL ||
                                                i_alu_operation_ff == SMLALH ||
                                                i_alu_operation_ff == OP_SMULW0 ||
                                                i_alu_operation_ff == OP_SMULW1 ||
                                                i_alu_operation_ff == OP_SMUL00 ||
                                                i_alu_operation_ff == OP_SMUL01 ||
                                                i_alu_operation_ff == OP_SMUL10 ||
                                                i_alu_operation_ff == OP_SMUL11 ||
                                                i_alu_operation_ff == OP_SMLA00     ||
                                                i_alu_operation_ff == OP_SMLA01     ||
                                                i_alu_operation_ff == OP_SMLA10     ||
                                                i_alu_operation_ff == OP_SMLA11     ||
                                                i_alu_operation_ff == OP_SMLAW0     ||
                                                i_alu_operation_ff == OP_SMLAW1     ||
                                                i_alu_operation_ff == OP_SMLAL00L   ||
                                                i_alu_operation_ff == OP_SMLAL01L   ||
                                                i_alu_operation_ff == OP_SMLAL10L   ||
                                                i_alu_operation_ff == OP_SMLAL11L   ||
                                                i_alu_operation_ff == OP_SMLAL00H   ||
                                                i_alu_operation_ff == OP_SMLAL01H   ||
                                                i_alu_operation_ff == OP_SMLAL10H   ||
                                                i_alu_operation_ff == OP_SMLAL11H   )
                        )
                        begin
                                o_busy    = 1'd1;
                                if ( !higher )
                                begin
                                        state_nxt = S1;
                                end
                                else
                                begin
                                        state_nxt = S3;
                                end
                        end
                end
                S1:
                begin
                        // 3 input adder.
                        x_nxt     = (prod_cd <<  0) + (prod_bc << 16) + (prod_ad << 16);
                        state_nxt = S2;
                end
                S2:
                begin
                        // 3 input adder.
                        state_nxt = S3;
                        x_nxt     = (x_ff[63:0] >>  0) + (prod_ab << 32) + {i_rh, i_rn};
                        y_nxt     = (x_ff[47:0] >> 16) + (prod_ab << 32) + {i_rh, i_rn};
                end
                S3:
                begin
                        state_nxt  = IDLE;
                        if ( take_upper )
                                x_nxt = y_ff;
                        // Is this the first or second portion of the long multiply.
                        o_rd  = higher ? x_nxt[63:32] : x_nxt[31:0];
                        // Record if older was not zero.
                        if ( !higher )
                                old_nozero_nxt = |x_nxt[31:0]; // 0x1 - Older was not zero. 0x0 - Older was zero.
                        o_busy     = 1'd0;
                        // During higher operation, override setting of zero flag IF lower value was non-zero.
                        if ( higher && old_nozero_ff )
                        begin
                                o_nozero = 1'd1;
                        end
                        // Addition Saturated. For short DSP MAC.
                        if ( x_nxt[31] != x_ff[31] && x_ff[31] == i_rn[31] )
                                o_sat = 1'd1;
                        else
                                o_sat = 1'd0;
                        // 64-bit MAC with saturation. For long DSP MAC.
                        if ( i_alu_operation_ff == OP_SMLAL00L   ||
                             i_alu_operation_ff == OP_SMLAL01L   ||
                             i_alu_operation_ff == OP_SMLAL10L   ||
                             i_alu_operation_ff == OP_SMLAL11L   ||
                             i_alu_operation_ff == OP_SMLAL00H   ||
                             i_alu_operation_ff == OP_SMLAL01H   ||
                             i_alu_operation_ff == OP_SMLAL10H   ||
                             i_alu_operation_ff == OP_SMLAL11H  )
                        begin
                                if ( x_nxt[63] != x_ff[63] && x_ff[63] != i_rh[31] )
                                        o_sat = 1'd1;
                                else
                                        o_sat = 1'd0;
                        end
                end
        endcase
end
always @ (posedge i_clk)
begin
        if ( i_reset )
        begin
                x_ff          <= 64'd0;
                y_ff          <= 64'd0;
                state_ff      <= IDLE;
                old_nozero_ff <= 32'd0;
        end
        else if ( i_clear_from_writeback )
        begin
                state_ff      <= IDLE;
                old_nozero_ff <= 32'd0;
        end
        else if ( i_data_stall )
        begin
                // Hold values
        end
        else if ( i_clear_from_alu )
        begin
                state_ff      <= IDLE;
                old_nozero_ff <= 32'd0;
        end
        else
        begin
                x_ff          <= x_nxt;
                y_ff          <= y_nxt;
                state_ff      <= state_nxt;
                old_nozero_ff <= old_nozero_nxt;
        end
end
endmodule