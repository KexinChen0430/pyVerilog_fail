module synFIFO(dataIn,dataOut,clk,rstN,wrN,rdN,empty,full);
    input   [7:0]dataIn;
    input   clk,rstN,wrN,rdN;
    output  empty,full;
    output[7:0]dataOut;
    reg[4:0]wr_cntr,rd_cntr;
    wire[3:0]addr;
    /*调用ram16X8模块，当wrN为低平有效且full为0时才写，而rdN为低平有效且empy为0时才读*/
    ram16X8ram(.clk(clk),.dataIn(dataIn),.dataOut(dataOut),.addr(addr),.wrN(wrN||full),.oe(rdN||empty));
    always@(posedgeclkornegedgerstN)
    if(!rstN)wr_cntr<=0;
        else if(!wrN&&!full)wr_cntr<=wr_cntr+1;
            always@(posedgeclkornegedgerstN)
if(!rstN)rd_cntr<=0;
elseif(!rdN&&!empty)rd_cntr<=rd_cntr+1;
assignaddr=wrN?rd_cntr[3:0]:wr_cntr[3:0];
assignempty=(wr_cntr[3:0]==rd_cntr[3:0])&&!(wr_cntr[4]^rd_cntr[4]);
assignfull=(wr_cntr[3:0]==rd_cntr[3:0])&&(wr_cntr[4]^rd_cntr[4]);
endmodule