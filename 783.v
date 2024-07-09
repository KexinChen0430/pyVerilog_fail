module bar
#(
    parameter WIDTH = 32
)
(
    input CLK
);
    foo #(.WIDTH (WIDTH)) foo (.*);
endmodule