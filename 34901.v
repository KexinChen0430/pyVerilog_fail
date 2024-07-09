module tb_Booth_Multiplier_1xA;
parameter N = 3;    // Number of bits = 2**N
//  UUT Signals
reg     Rst;
reg     Clk;
reg     Ld;
reg     [(2**N - 1):0] M;
reg     [(2**N - 1):0] R;
wire    Valid, Valid_A;
wire    [(2**(N+1) - 1):0] P, P_A;
//  Simulation Variables
reg     [2**(N+1):0] i;
// Instantiate the Unit Under Test (UUT)
Booth_Multiplier        #(
                            .pN(N)
                        ) uut (
                            .Rst(Rst),
                            .Clk(Clk),
                            .Ld(Ld),
                            .M(M),
                            .R(R),
                            .Valid(Valid),
                            .P(P)
                        );
Booth_Multiplier_1xA    #(
                            .N(2**N)
                        ) RevA (
                            .Rst(Rst),
                            .Clk(Clk),
                            .Ld(Ld),
                            .M(M),
                            .R(R),
                            .Valid(Valid_A),
                            .P(P_A)
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
    for(i = 0; i < (2**(2**(N+1))); i = i + 1) begin
        Ld = 1; M = i[(2**(N+1) - 1):2**N]; R = i[(2**N - 1):0];
        @(posedge Clk) #1 Ld = 0;
        @(posedge Valid);
        if(Valid_A != 1) begin
            $display(" Fail - Module did not complete in expected # cycles\n");
            $stop;
        end
        if(P_A != P) begin
            $display(" Fail - Module output does not equal expected value\n");
            $stop;
        end
    end
    //  Exit - End of Test
    M = 0; R = 0;
    @(posedge Clk) #1;
    @(posedge Clk) #1;
    @(posedge Clk) #1;
    @(posedge Clk) #1;
    $display(" Pass - Module performed as expected\n");
    $stop;
end
always #5 Clk = ~Clk;
endmodule