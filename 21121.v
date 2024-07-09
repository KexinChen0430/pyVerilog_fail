module my_RAM32M (input clk, input [7:0] din, output [7:0] dout);
    parameter LOC = "";
    (* LOC=LOC, KEEP, DONT_TOUCH *)
    RAM32M #(
        ) RAM32M (
            .DOA(dout[1:0]),
            .DOB(dout[3:2]),
            .DOC(dout[5:4]),
            .DOD(dout[7:6]),
            .ADDRA(din[4:0]),
            .ADDRB(din[4:0]),
            .ADDRC(din[4:0]),
            .ADDRD(din[4:0]),
            .DIA(din[5:4]),
            .DIB(din[6:5]),
            .DIC(din[7:6]),
            .DID(din[1:0]),
            .WCLK(din[1]),
            .WE(din[2]));
endmodule