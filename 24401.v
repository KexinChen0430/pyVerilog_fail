module tb_Booth_Multiplier_4x;
parameter N = 8;
//  UUT Signals
reg     Rst;
reg     Clk;
reg     Ld;
reg     [(N - 1):0] M;
reg     [(N - 1):0] R;
wire    Valid;
wire    [((2*N) - 1):0] P;
//  Simulation Variables
reg     [(2*N):0] i;
// Instantiate the Unit Under Test (UUT)
Booth_Multiplier_4x #(
                        .N(N)
                    ) uut (
                        .Rst(Rst),
                        .Clk(Clk),
                        .Ld(Ld),
                        .M(M),
                        .R(R),
                        .Valid(Valid),
                        .P(P)
                    );
initial begin
    // Initialize Inputs
    Rst = 1;
    Clk = 1;
    Ld  = 0;
    M   = 0;
    R   = 0;
    i   = 0;
    // Wait 100 ns for global reset to finish
    #101 Rst = 0;
    // Add stimulus here
    @(posedge Clk) #1;
    for(i = (2**N); i < (2**(2*N)) + 1; i = i + 1) begin
        Ld = 1; M = i[((2*N) - 1):N]; R = i[(N - 1):0];
        @(posedge Clk) #1 Ld = 0;
        @(posedge Valid);
    end
//    @(posedge Clk) #1 M = 4'h8; R = 4'h2; Ld = 1;
//    @(posedge Clk) #1 Ld = 0;
//    @(posedge Valid); M = 4'h2; R = 4'h8; Ld = 1;
//    @(posedge Clk) #1 Ld = 0;
//    @(posedge Valid); M = 4'h8; R = 4'h6; Ld = 1;
//    @(posedge Clk) #1 Ld = 0;
//    @(posedge Valid); M = 4'h6; R = 4'h8; Ld = 1;
//    @(posedge Clk) #1 Ld = 0;
//    @(posedge Valid); M = 4'h0; R = 4'h0; Ld = 1;
//    @(posedge Clk) #1 Ld = 0;
end
always #5 Clk = ~Clk;
endmodule