module fifo_async_sel (
   reset,
   wr_clk,
   wr_en,
   wr_din,
   wr_full,
   wr_almostfull,
   wr_full_count,
   rd_clk,
   rd_en,
   rd_dout,
   rd_empty,
   rd_empty_count
   );
   // removed CNTR_W, because counters will be 1 bit more than addresses
   parameter ADDR_W = 5; // number of  bits wide for address, depth of the fifo is pow(2,ADDR_W)
   parameter DATA_W = 32; // number of bits wide for data
   parameter ALMOSTFULL_LIMIT = 4; // number of entries left before almost full goes active
   parameter ONECLOCK = 0; // set to 1 to get rid of resync logic.
   parameter GEN_RDCOUNT = 1;
   parameter GEN_WRCOUNT = 1;
   parameter GEN_WRALMOSTFULL = 1;
   parameter SIM_EMPTY_X = 0; // simulate with 'bx for read data path when empty
   parameter SIM_NOTRD_X = 0; // simulate with 'bx for read data path when not reading
   parameter IGNORE_FULL_WR = 0; // set to 1 to allow WR to go through when FULL is asserted (breaks the FIFO, but allows much higher clock rates). WARNING: setting this parameter can make the FIFO misbehave
   parameter IGNORE_EMPTY_RD = 0; // set to 1 to allow RD to go through when EMPTY is asserted (breaks the FIFO, but allows much higher clock rates). WARNING: setting this parameter can make the FIFO misbehave
   parameter FAST_WR_TO_RD = 0; // set to 1 to allow RD the following clk after WR
   input reset;
   input wr_clk;
   input wr_en;
   input [DATA_W-1:0] wr_din;
   output wr_full;
   output wr_almostfull;
   output [ADDR_W:0] wr_full_count;
   input rd_clk;
   input rd_en;
   output [DATA_W-1:0] rd_dout;
   output rd_empty;
   output [ADDR_W:0] rd_empty_count;
   wire wr_en_ram;
   /**********************************************************************\
    \**********************************************************************/
   wire [ADDR_W-1:0] rd_addr, wr_addr;
   /**********************************************************************\
    \**********************************************************************/
    fifo_addr i_fifo_addr
     (
      .wr_clk ( wr_clk ),
      .wr_en ( wr_en ),
      .wr_addr ( wr_addr ),
      .wr_en_ram ( wr_en_ram ),
      .wr_full ( wr_full ),
      .wr_almost_full ( wr_almostfull ),
      .wr_full_count ( wr_full_count ),
      .rd_clk ( rd_clk ),
      .rd_en ( rd_en ),
      .rd_addr ( rd_addr ),
      .rd_en_ram ( ), // selectram always outputs
      .rd_empty ( rd_empty ),
      .rd_empty_count(rd_empty_count),
      .fifo_reset ( reset )
      );
   defparam i_fifo_addr.ADDR_W = ADDR_W;
   defparam i_fifo_addr.ALMOSTFULL_LIMIT = ALMOSTFULL_LIMIT;
   defparam i_fifo_addr.DELAY_READ = 0;
   defparam i_fifo_addr.ONECLOCK = ONECLOCK;
   defparam i_fifo_addr.GEN_RDCOUNT = GEN_RDCOUNT;
   defparam i_fifo_addr.GEN_WRCOUNT = GEN_WRCOUNT;
   defparam i_fifo_addr.GEN_WRALMOSTFULL = GEN_WRALMOSTFULL;
   defparam i_fifo_addr.IGNORE_FULL_WR = IGNORE_FULL_WR;
   defparam i_fifo_addr.IGNORE_EMPTY_RD = IGNORE_EMPTY_RD;
   defparam i_fifo_addr.FAST_WR_TO_RD = FAST_WR_TO_RD;
/**********************************************************************\
\**********************************************************************/
// These two generate blocks are meant to use the same code but name the path differently
// so that the async FIFOs can be constrained easily
generate
  if(ONECLOCK) begin : gen_sync
   infer_selectram i_fifo_selram
     (
       .clk(wr_clk),
       .we(wr_en_ram),
       .d(wr_din[DATA_W-1:0]),
       .waddr(wr_addr[ADDR_W-1:0]),
       .o(rd_dout[DATA_W-1:0]),
       .raddr(rd_addr[ADDR_W-1:0])
       );
   defparam i_fifo_selram.d_width = DATA_W;
   defparam i_fifo_selram.addr_width = ADDR_W;
 end else begin : gen_async
   infer_selectram i_fifo_selram
     (
       .clk(wr_clk),
       .we(wr_en_ram),
       .d(wr_din[DATA_W-1:0]),
       .waddr(wr_addr[ADDR_W-1:0]),
       .o(rd_dout[DATA_W-1:0]),
       .raddr(rd_addr[ADDR_W-1:0])
       );
   defparam i_fifo_selram.d_width = DATA_W;
   defparam i_fifo_selram.addr_width = ADDR_W;
 end
endgenerate
// synthesis translate_off
 assign rd_dout = (SIM_EMPTY_X & rd_empty ? {DATA_W{1'bx}} : {DATA_W{1'bz}} ); // Drive 'x' on read data bus when empty in simulation.
 assign rd_dout = (SIM_NOTRD_X & (~rd_en) ? {DATA_W{1'bx}} : {DATA_W{1'bz}} ); // Drive 'x' on read data bus when empty in simulation.
// synthesis translate_on
endmodule