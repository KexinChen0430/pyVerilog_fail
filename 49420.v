module top();
    // Inputs are registered
    reg D;
    reg VPWR;
    reg VGND;
    reg VPB;
    reg VNB;
    // Outputs are wires
    wire Q;
    wire Q_N;
    initial
    begin
        // Initial state is x for all inputs.
        D    = 1'bX;
        VGND = 1'bX;
        VNB  = 1'bX;
        VPB  = 1'bX;
        VPWR = 1'bX;
        #20   D    = 1'b0;
        #40   VGND = 1'b0;
        #60   VNB  = 1'b0;
        #80   VPB  = 1'b0;
        #100  VPWR = 1'b0;
        #120  D    = 1'b1;
        #140  VGND = 1'b1;
        #160  VNB  = 1'b1;
        #180  VPB  = 1'b1;
        #200  VPWR = 1'b1;
        #220  D    = 1'b0;
        #240  VGND = 1'b0;
        #260  VNB  = 1'b0;
        #280  VPB  = 1'b0;
        #300  VPWR = 1'b0;
        #320  VPWR = 1'b1;
        #340  VPB  = 1'b1;
        #360  VNB  = 1'b1;
        #380  VGND = 1'b1;
        #400  D    = 1'b1;
        #420  VPWR = 1'bx;
        #440  VPB  = 1'bx;
        #460  VNB  = 1'bx;
        #480  VGND = 1'bx;
        #500  D    = 1'bx;
    end
    // Create a clock
    reg GATE;
    initial
    begin
        GATE = 1'b0;
    end
    always
    begin
        #5 GATE = ~GATE;
    end
    sky130_fd_sc_lp__dlxbp dut (.D(D), .VPWR(VPWR), .VGND(VGND), .VPB(VPB), .VNB(VNB), .Q(Q), .Q_N(Q_N), .GATE(GATE));
endmodule