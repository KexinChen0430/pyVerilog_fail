module zap_shifter_shift
#(
        parameter SHIFT_OPS = 5
)
(
        // Source value.
        input  wire [31:0]                      i_source,
        // Shift amount.
        input  wire [7:0]                       i_amount,
        // Carry in.
        input  wire                             i_carry,
        // Shift type.
        input  wire [$clog2(SHIFT_OPS)-1:0]     i_shift_type,
        // Output result and output carry.
        output reg [31:0]                       o_result,
        output reg                              o_carry,
        output reg                              o_sat
);
`include "zap_defines.vh"
`include "zap_localparams.vh"
`include "zap_functions.vh"
always @*
begin:blk1
        reg signed [32:0] res, res1;
        res  = 0;
        res1 = 0;
        // Prevent latch inference.
        o_result        = i_source;
        o_carry         = 0;
        o_sat           = 0;
        case ( i_shift_type )
                // Logical shift left, logical shift right and
                // arithmetic shift right.
                LSL:    {o_carry, o_result} = {i_carry, i_source} << i_amount;
                LSR:    {o_result, o_carry} = {i_source, i_carry} >> i_amount;
                ASR:
                begin
                        res = {i_source, i_carry};
                        res1 = $signed(res) >>> i_amount;
                        {o_result, o_carry} = res1;
                end
                ROR: // Rotate right.
                begin
                        o_result = ( i_source >> i_amount[4:0] )  |
                                   ( i_source << (32 - i_amount[4:0] ) );
                        o_carry  = ( i_amount[7:0] == 0) ?
                                     i_carry  : ( (i_amount[4:0] == 0) ?
                                     i_source[31] : o_result[31] );
                end
                RORI, ROR_1:
                begin
                        // ROR #n (ROR_1)
                        o_result = ( i_source >> i_amount[4:0] )  |
                                   (i_source << (32 - i_amount[4:0] ) );
                        o_carry  = i_amount ? o_result[31] : i_carry;
                end
                // ROR #0 becomes this.
                RRC:    {o_result, o_carry}        = {i_carry, i_source};
                // LSL_SAT. Always #1 in length.
                LSL_SAT:
                begin
                        o_result = i_source << 1;
                        if ( o_result[31] != i_source[31] )
                                o_sat = 1'd1;
                        if ( o_sat == 1'd1 )
                        begin
                                if ( i_source[31] == 1'd0 )
                                        o_result = {1'd0, {31{1'd1}}}; // Max positive.
                                else
                                        o_result = {1'd1, {31{1'd0}}}; // Max negative.
                        end
                end
                default: // For lint.
                begin
                end
        endcase
end
endmodule