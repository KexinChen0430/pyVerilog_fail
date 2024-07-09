module AxiSSplitCopy #(
    parameter DATA_WIDTH = 64,
    parameter DEST_WIDTH = 0,
    parameter ID_WIDTH = 0,
    parameter INTF_CLS = "<class 'hwtLib.amba.axis.AxiStream'>",
    parameter IS_BIGENDIAN = 0,
    parameter OUTPUTS = 2,
    parameter USER_WIDTH = 0,
    parameter USE_KEEP = 0,
    parameter USE_STRB = 0
) (
    input wire[63:0] dataIn_data,
    input wire dataIn_last,
    output reg dataIn_ready,
    input wire dataIn_valid,
    output wire[63:0] dataOut_0_data,
    output wire dataOut_0_last,
    input wire dataOut_0_ready,
    output reg dataOut_0_valid,
    output wire[63:0] dataOut_1_data,
    output wire dataOut_1_last,
    input wire dataOut_1_ready,
    output reg dataOut_1_valid
);
    always @(dataOut_0_ready, dataOut_1_ready) begin: assig_process_dataIn_ready
        dataIn_ready = dataOut_0_ready & dataOut_1_ready;
    end
    assign dataOut_0_data = dataIn_data;
    assign dataOut_0_last = dataIn_last;
    always @(dataIn_valid, dataOut_1_ready) begin: assig_process_dataOut_0_valid
        dataOut_0_valid = dataIn_valid & dataOut_1_ready;
    end
    assign dataOut_1_data = dataIn_data;
    assign dataOut_1_last = dataIn_last;
    always @(dataIn_valid, dataOut_0_ready) begin: assig_process_dataOut_1_valid
        dataOut_1_valid = dataIn_valid & dataOut_0_ready;
    end
    generate if (DATA_WIDTH != 64)
        $error("%m Generated only for this param value");
    endgenerate
    generate if (DEST_WIDTH != 0)
        $error("%m Generated only for this param value");
    endgenerate
    generate if (ID_WIDTH != 0)
        $error("%m Generated only for this param value");
    endgenerate
    generate if (INTF_CLS != "<class 'hwtLib.amba.axis.AxiStream'>")
        $error("%m Generated only for this param value");
    endgenerate
    generate if (IS_BIGENDIAN != 0)
        $error("%m Generated only for this param value");
    endgenerate
    generate if (OUTPUTS != 2)
        $error("%m Generated only for this param value");
    endgenerate
    generate if (USER_WIDTH != 0)
        $error("%m Generated only for this param value");
    endgenerate
    generate if (USE_KEEP != 0)
        $error("%m Generated only for this param value");
    endgenerate
    generate if (USE_STRB != 0)
        $error("%m Generated only for this param value");
    endgenerate
endmodule