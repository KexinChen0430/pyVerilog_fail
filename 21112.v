module my_RAM64M (input clk, input [7:0] din, output [7:0] dout);
    parameter LOC = "";
    parameter BEL="A6LUT";
    (* LOC=LOC, BEL=BEL, KEEP, DONT_TOUCH *)
    RAM64M #(
        ) RAM64M (
            .DOA(dout[0]),
            .DOB(dout[1]),
            .DOC(dout[2]),
            .DOD(dout[3]),
            .ADDRA(din[0]),
            .ADDRB(din[1]),
            .ADDRC(din[2]),
            .ADDRD(din[3]),
            .DIA(din[4]),
            .DIB(din[5]),
            .DIC(din[6]),
            .DID(din[7]),
            .WCLK(clk),
            .WE(din[1]));
endmodule