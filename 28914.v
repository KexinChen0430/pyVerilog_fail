module lpm_bustri (
    tridata,    // Bidirectional bus signal. (Required)
    data,       // Data input to the tridata[] bus. (Required)
    enabletr,   // If high, enables tridata[] onto the result bus.
    enabledt,   // If high, enables data onto the tridata[] bus.
    result      // Output from the tridata[] bus.
);
// GLOBAL PARAMETER DECLARATION
    parameter lpm_width = 1;
    parameter lpm_type = "lpm_bustri";
    parameter lpm_hint = "UNUSED";
// INPUT PORT DECLARATION
    input  [lpm_width-1:0] data;
    input  enabletr;
    input  enabledt;
// OUTPUT PORT DECLARATION
    output [lpm_width-1:0] result;
// INPUT/OUTPUT PORT DECLARATION
    inout  [lpm_width-1:0] tridata;
// INTERNAL REGISTERS DECLARATION
    reg  [lpm_width-1:0] result;
// INTERNAL TRI DECLARATION
    tri1  enabletr;
    tri1  enabledt;
    wire i_enabledt;
    wire i_enabletr;
    buf (i_enabledt, enabledt);
    buf (i_enabletr, enabletr);
// INITIAL CONSTRUCT BLOCK
    initial
    begin
        if (lpm_width <= 0)
        begin
            $display("Value of lpm_width parameter must be greater than 0(ERROR)");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end
    end
// ALWAYS CONSTRUCT BLOCK
    always @(data or tridata or i_enabletr or i_enabledt)
    begin
        if ((i_enabledt == 1'b0) && (i_enabletr == 1'b1))
        begin
            result = tridata;
        end
        else if ((i_enabledt == 1'b1) && (i_enabletr == 1'b1))
        begin
            result = data;
        end
        else
        begin
            result = {lpm_width{1'bz}};
        end
    end
// CONTINOUS ASSIGNMENT
    assign tridata = (i_enabledt == 1) ? data : {lpm_width{1'bz}};
endmodule