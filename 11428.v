module HaarFilter #(
    parameter STAGES         = 4,  ///< Number of stages
    parameter INTERNAL_WIDTH = 18, ///< Internal bit width used for calculations
    parameter IN_WIDTH       = 16, ///< Width of input signal
    parameter OUT_WIDTH      = 16  ///< Width of output signals from filter bank
)
(
    input clk,                                    ///< System clock
    input rst,                                    ///< Reset, synchronous and active high
    input en,                                     ///< Enable (once per new sample)
    input signed [IN_WIDTH-1:0] dataIn,           ///< Input samples
    output reg [STAGES:0] outStrobes,             ///< Strobes for each output
    output reg [OUT_WIDTH*(STAGES+1)-1:0] dataOut ///< Outputs from analysis filter
);
// Parameter Declarations
// Verify Parameters are correct
initial begin
    if (STAGES < 2 || STAGES > 8) begin
        $display("Attribute STAGES on HaarFilter instance %m is set to %d. Valid range is 2 to 8", STAGES);
        #1 $finish;
    end
    if (INTERNAL_WIDTH < 2) begin
        $display("Attribute INTERNAL_WIDTH on HaarFilter instance %m is set to %d. Must be at least 2.", INTERNAL_WIDTH);
        #1 $finish;
    end
    if (IN_WIDTH < 2) begin
        $display("Attribute IN_WIDTH on HaarFilter instance %m is set to %d. Must be at least 2.", IN_WIDTH);
        #1 $finish;
    end
    if (OUT_WIDTH < 2) begin
        $display("Attribute OUT_WIDTH on HaarFilter instance %m is set to %d. Must be at least 2.", OUT_WIDTH);
        #1 $finish;
    end
end
// Signal Declarations
reg signed [INTERNAL_WIDTH-1:0] lowPass   [STAGES-1:0];
reg signed [INTERNAL_WIDTH-1:0] prevArray [STAGES-1:0];
reg signed [INTERNAL_WIDTH-1:0] highPass  [STAGES-1:0];
reg [7:0] counter;
integer outArray;
integer i;
// Calculation Engine
wire signed [INTERNAL_WIDTH:0] calcOut;
wire signed [INTERNAL_WIDTH-1:0] in0;
wire signed [INTERNAL_WIDTH-1:0] in1;
reg signed [IN_WIDTH-1:0] dataInD1;
reg [3:0] index;
reg [3:0] index2;
reg enD1;
wire step0;
wire step1;
always @(counter) begin
    if      (counter[0]    == 1'b0)        index = 'd0;
    else if (counter[1:0]  == 2'b01)       index = 'd1;
    else if (counter[2:0]  == 3'b011)      index = 'd2;
    else if (counter[3:0]  == 4'b0111)     index = 'd3;
    else if (counter[4:0]  == 5'b01111)    index = 'd4;
    else if (counter[5:0]  == 6'b011111)   index = 'd5;
    else if (counter[6:0]  == 7'b0111111)  index = 'd6;
    else if (counter[7:0]  == 8'b01111111) index = 'd7;
    else                                   index = 'd8; // Used to avoid updating values
    if      (counter[0]    == 1'b0)        index2 = 'd8;
    else if (counter[1:0]  == 2'b01)       index2 = 'd0;
    else if (counter[2:0]  == 3'b011)      index2 = 'd1;
    else if (counter[3:0]  == 4'b0111)     index2 = 'd2;
    else if (counter[4:0]  == 5'b01111)    index2 = 'd3;
    else if (counter[5:0]  == 6'b011111)   index2 = 'd4;
    else if (counter[6:0]  == 7'b0111111)  index2 = 'd5;
    else if (counter[7:0]  == 8'b01111111) index2 = 'd6;
    else                                   index2 = 'd7; // Used to avoid updating values
end
if (IN_WIDTH > INTERNAL_WIDTH) begin
    assign in0 = counter[0] ? prevArray[index2] : (dataInD1 >>> (IN_WIDTH-INTERNAL_WIDTH));
    assign in1 = counter[0] ? lowPass[index2]   : (dataIn >>> (IN_WIDTH-INTERNAL_WIDTH));
end
else begin
    assign in0 = counter[0] ? prevArray[index2] : (dataInD1 <<< (INTERNAL_WIDTH-IN_WIDTH));
    assign in1 = counter[0] ? lowPass[index2]   : (dataIn <<< (INTERNAL_WIDTH-IN_WIDTH));
end
assign step0 =  en && !enD1;
assign step1 = !en &&  enD1;
assign calcOut = (step1) ? (in1 - in0) : (in1 + in0);
always @(posedge clk) begin
    if (rst) begin
        counter <= 'd0;
        enD1 <= 'd0;
        outStrobes <= 'd0;
        dataInD1 <= 'd0;
        for (i=0; i<STAGES; i=i+1) begin
            lowPass[i] <= 'd0;
            highPass[i] <= 'd0;
            prevArray[i] <= 'd0;
        end
    end
    else begin
        enD1 <= en;
        if (step1) begin
            counter <= counter + 2'd1;
        end
        if (step1) dataInD1 <= dataIn;
        for (i=0; i<STAGES; i=i+1) begin
            // High-pass outputs
            if (index == i && step1) begin
                highPass[i] <= calcOut[INTERNAL_WIDTH:1];
                outStrobes[STAGES-i] <= 1'b1;
            end
            else begin
                outStrobes[STAGES-i] <= 1'b0;
            end
            // Low-pass outputs
            if (index == i && step0) begin
                lowPass[i] <= calcOut[INTERNAL_WIDTH:1];
                prevArray[i] <= lowPass[i];
            end
        end
        // Final low-pass output strobe
        if (index == STAGES-1 && step0) begin
            outStrobes[0] <= 1'b1;
        end
        else begin
            outStrobes[0] <= 1'b0;
        end
    end
end
// Output Mapping
// Map filter outputs onto output array
if (INTERNAL_WIDTH > OUT_WIDTH) begin
    always @(*) begin
        dataOut[0+:OUT_WIDTH] = lowPass[STAGES-1] >>> (INTERNAL_WIDTH-OUT_WIDTH);
        for (outArray=0; outArray<STAGES; outArray = outArray+1) begin
            dataOut[(OUT_WIDTH*(outArray+1))+:OUT_WIDTH] = highPass[STAGES-1-outArray] >>> (INTERNAL_WIDTH-OUT_WIDTH);
        end
    end
end
else begin
    always @(*) begin
        dataOut[0+:OUT_WIDTH] = lowPass[STAGES-1] <<< (OUT_WIDTH-INTERNAL_WIDTH);
        for (outArray=0; outArray<STAGES; outArray = outArray+1) begin
            dataOut[(OUT_WIDTH*(outArray+1))+:OUT_WIDTH] = highPass[STAGES-1-outArray] <<< (OUT_WIDTH-INTERNAL_WIDTH);
        end
    end
end
endmodule