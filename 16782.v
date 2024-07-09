module should set to high when computation should begin
    angle_in, // Input angle
    cos_out,  // Output value for cosine of angle
    sin_out   // Output value for sine of angle
);
input clock;
input reset;
input start;
input [31:0] angle_in;
output [31:0] cos_out;
output [31:0] sin_out;
wire [31:0] cos_out = cos;
wire [31:0] sin_out = sin;
reg [31:0] cos;
reg [31:0] sin;
reg [31:0] angle;
reg [4:0] count;
reg state;
reg [31:0] cos_next;
reg [31:0] sin_next;
reg [31:0] angle_next;
reg [4:0] count_next;
reg state_next;
always @(posedge clock or posedge reset) begin
    if (reset) begin
        cos <= 0;
        sin <= 0;
        angle <= 0;
        count <= 0;
        state <= 0;
    end else begin
        cos <= cos_next;
        sin <= sin_next;
        angle <= angle_next;
        count <= count_next;
        state <= state_next;
    end
end
always @* begin
    // Set all logic regs to a value to prevent any of them holding the value
    // from last tick and hence being misinterpreted as hardware registers.
    cos_next = cos;
    sin_next = sin;
    angle_next = angle;
    count_next = count;
    state_next = state;
    if (state) begin
        // Compute mode.
        cos_next = cos + (direction_negative ? sin_shr : -sin_shr);
        sin_next = sin + (direction_negative ? -cos_shr : cos_shr);
        angle_next = angle + (direction_negative ? beta : -beta);
        count_next = count + 1;
        if (count == 31) begin
            // If this is the last iteration, go back to the idle state.
            state_next = 0;
        end
    end
    else begin
        // Idle mode.
        if (start) begin
            cos_next = `K;         // Set up initial value for cos.
            sin_next = 0;          // Set up initial value for sin.
            angle_next = angle_in; // Latch input angle into the angle register.
            count_next = 0;        // Set up counter.
            state_next = 1;        // Go to compute mode.
        end
    end
end
wire [31:0] cos_signbits = {32{cos[31]}};
wire [31:0] sin_signbits = {32{sin[31]}};
wire [31:0] cos_shr = {cos_signbits, cos} >> count;
wire [31:0] sin_shr = {sin_signbits, sin} >> count;
wire direction_negative = angle[31];
wire [31:0] beta_lut [0:31];
assign beta_lut[0] = `BETA_0;
assign beta_lut[1] = `BETA_1;
assign beta_lut[2] = `BETA_2;
assign beta_lut[3] = `BETA_3;
assign beta_lut[4] = `BETA_4;
assign beta_lut[5] = `BETA_5;
assign beta_lut[6] = `BETA_6;
assign beta_lut[7] = `BETA_7;
assign beta_lut[8] = `BETA_8;
assign beta_lut[9] = `BETA_9;
assign beta_lut[10] = `BETA_10;
assign beta_lut[11] = `BETA_11;
assign beta_lut[12] = `BETA_12;
assign beta_lut[13] = `BETA_13;
assign beta_lut[14] = `BETA_14;
assign beta_lut[15] = `BETA_15;
assign beta_lut[16] = `BETA_16;
assign beta_lut[17] = `BETA_17;
assign beta_lut[18] = `BETA_18;
assign beta_lut[19] = `BETA_19;
assign beta_lut[20] = `BETA_20;
assign beta_lut[21] = `BETA_21;
assign beta_lut[22] = `BETA_22;
assign beta_lut[23] = `BETA_23;
assign beta_lut[24] = `BETA_24;
assign beta_lut[25] = `BETA_25;
assign beta_lut[26] = `BETA_26;
assign beta_lut[27] = `BETA_27;
assign beta_lut[28] = `BETA_28;
assign beta_lut[29] = `BETA_29;
assign beta_lut[30] = `BETA_30;
assign beta_lut[31] = `BETA_31;
wire [31:0] beta = beta_lut[count];
endmodule