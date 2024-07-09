module ram16X8(clk,dataIn,dataOut,addr,wrN,oe);
    //inout[`RAM_WIDTH-1:0]data;
    input [`RAM_WIDTH-1:0]dataIn;//数据线
    input clk;
    input [`ADDR_SZ-1:0]addr;//地址线
    input wrN;//写选择线
    input oe;//允许输出线
    output [`RAM_WIDTH-1:0]dataOut;
    wire [`RAM_WIDTH-1:0]dataIn,dataOut;
    wire [`ADDR_SZ-1:0]addr;
    wire wrN,oe;
    //RAM
    reg[`RAM_WIDTH-1:0]mem[`RAM_DEPTH-1:0];
    assign#`DELdataOut=oe?`RAM_WIDTH'bz:mem[addr];
    always@(posedgeclk)begin
    if(!wrN)
    mem[addr]=dataIn;
    end
endmodule