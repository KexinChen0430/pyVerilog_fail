module mux
    #(
      parameter C_NUM_INPUTS = 4,
      parameter C_CLOG_NUM_INPUTS = 2,
      parameter C_WIDTH = 32,
      parameter C_MUX_TYPE = "SELECT"
      )
    (
     input [(C_NUM_INPUTS)*C_WIDTH-1:0] MUX_INPUTS,
     input [C_CLOG_NUM_INPUTS-1:0]      MUX_SELECT,
     output [C_WIDTH-1:0]               MUX_OUTPUT
     );
`include "functions.vh"
    generate
        if(C_MUX_TYPE == "SELECT") begin
            mux_select
                #(/*AUTOINSTPARAM*/
                  // Parameters
                  .C_NUM_INPUTS             (C_NUM_INPUTS),
                  .C_CLOG_NUM_INPUTS        (C_CLOG_NUM_INPUTS),
                  .C_WIDTH                  (C_WIDTH))
            mux_select_inst
                (/*AUTOINST*/
                 // Outputs
                 .MUX_OUTPUT            (MUX_OUTPUT[C_WIDTH-1:0]),
                 // Inputs
                 .MUX_INPUTS            (MUX_INPUTS[(C_NUM_INPUTS)*C_WIDTH-1:0]),
                 .MUX_SELECT            (MUX_SELECT[C_CLOG_NUM_INPUTS-1:0]));
        end else if (C_MUX_TYPE == "SHIFT") begin
            mux_shift
                #(/*AUTOINSTPARAM*/
                  // Parameters
                  .C_NUM_INPUTS             (C_NUM_INPUTS),
                  .C_CLOG_NUM_INPUTS        (C_CLOG_NUM_INPUTS),
                  .C_WIDTH                  (C_WIDTH))
            mux_shift_inst
                (/*AUTOINST*/
                 // Outputs
                 .MUX_OUTPUT            (MUX_OUTPUT[C_WIDTH-1:0]),
                 // Inputs
                 .MUX_INPUTS            (MUX_INPUTS[(C_NUM_INPUTS)*C_WIDTH-1:0]),
                 .MUX_SELECT            (MUX_SELECT[C_CLOG_NUM_INPUTS-1:0]));
        end
    endgenerate
endmodule