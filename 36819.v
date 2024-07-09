module embox (/*AUTOARG*/
   // Outputs
   mi_dout, embox_full, embox_not_empty,
   // Inputs
   reset, clk, mi_en, mi_we, mi_addr, mi_din
   );
   parameter DW    = 32;    //data width of fifo
   parameter RFAW  = 5;     //address bus width
   parameter FAW   = 4;     //fifo entries==2^FAW
   parameter GROUP = 4'h0;  //address map group
   /*CLOCK AND RESET            */
   input           reset;       //synchronous  reset
   input 	   clk;
   /*SIMPLE MEMORY INTERFACE    */
   input 	   mi_en;
   input  	   mi_we;
   input [19:0]    mi_addr;
   input [DW-1:0]  mi_din;
   output [DW-1:0] mi_dout;
   /*MAILBOX OUTPUTS            */
   output 	   embox_full;
   output 	   embox_not_empty;
   /*REGISTERS                  */
   reg [DW-1:0]    mi_dout;
   reg [DW-1:0]    embox_data_reg;
   reg 		   mi_data_sel;
   /*WIRES                      */
   wire 	   embox_read;
   wire 	   embox_write;
   wire 	   embox_lo_write;
   wire 	   embox_push_fifo;
   wire 	   embox_pop_fifo;
   wire [2*DW-1:0] embox_fifo_data;
   wire 	   embox_empty;
   /*DECODE LOGIC               */
   //fifo read/write logic
   assign embox_write       = mi_en & mi_we;
   assign embox_read        = mi_en & ~mi_we;
   //Register write enables
   assign  embox_lo_write    = embox_write & (mi_addr[RFAW+1:2]==`EMBOXLO); //write to shadow
   assign  embox_push_fifo   = embox_write & (mi_addr[RFAW+1:2]==`EMBOXHI); //initiates FIFO write
   //read logic
   assign embox_pop_fifo     = embox_read & (mi_addr[RFAW+1:2]==`EMBOXHI); //fifo read
   /*WRITE ACTION               */
   //shadow register for writing lower word (32 bit bus)
   always @ (posedge clk)
     if(embox_lo_write)
       embox_data_reg[DW-1:0] <=mi_din[DW-1:0];
   /*READ BACK DATA             */
   always @ (posedge clk)
     if(embox_read)
       case(mi_addr[RFAW+1:2])
	 `EMBOXLO:   mi_dout[DW-1:0] <= embox_fifo_data[DW-1:0];
	 `EMBOXHI:   mi_dout[DW-1:0] <= embox_fifo_data[2*DW-1:DW];
	 default:    mi_dout[DW-1:0] <= 32'd0;
       endcase // case (mi_addr[RFAW-1:2])
   /*FIFO (64-BIT)              */
   assign embox_not_empty         = ~embox_empty;
   //BUG! This fifo is currently hard coded to 32 entries
   //Should be parametrized to up to 4096 entries
   fifo_sync #(.DW(64)) mbox(// Outputs
			     .rd_data  (embox_fifo_data[2*DW-1:0]),
			     .rd_empty (embox_empty),
			     .wr_full  (embox_full),
			     // Inputs
			     .rd_en    (embox_pop_fifo),
			     .wr_data  ({mi_din[DW-1:0],embox_data_reg[DW-1:0]}),
			     .wr_en    (embox_push_fifo),
			     .clk      (clk),
			     .reset    (reset)
			     );
endmodule