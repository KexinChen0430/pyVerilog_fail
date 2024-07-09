module hififo_fetch_descriptor
  (
   input 	   clock,
   input 	   reset,
   output [AMSB:0] request_addr,
   output 	   request_valid,
   input 	   request_ack,
   input [DMSB:0]  wdata,
   input 	   wvalid,
   output [SMSB:0] status,
   output 	   interrupt
   );
   parameter BS = 0; // bit shift, number of LSBs to ignore in address
   parameter AMSB = 63; // address MSB
   parameter DMSB = 63; // data MSB
   parameter SMSB = 31; // status MSB
   parameter CBITS = 22; // count bits
   parameter CMSB = CBITS - 1; // count MSB
   reg [CMSB-BS:0]  p_current = 0, p_interrupt = 0, p_stop = 0;
   reg 		    reset_or_abort;
   reg 		    abort = 1;
   reg [AMSB-CBITS:0] addr_high;
   wire write_interrupt = wvalid && (wdata[2:0] == 1);
   wire write_stop      = wvalid && (wdata[2:0] == 2);
   wire write_addr_high = wvalid && (wdata[2:0] == 3);
   wire write_abort     = wvalid && (wdata[2:0] == 4);
   assign request_addr = {addr_high,p_current,{BS{1'b0}}};
   assign request_valid = (p_current != p_stop) && ~request_ack;
   assign status = {p_current, {BS{1'b0}}};
   always @ (posedge clock)
     begin
	reset_or_abort <= reset | abort;
	if(write_abort)
	  abort <= wdata[8];
	if(write_addr_high)
	  addr_high <= wdata[AMSB:CBITS];
	p_stop <= reset_or_abort ? 1'b0 :
		  write_stop ? wdata[CMSB:BS] : p_stop;
	if(write_interrupt)
	  p_interrupt <= wdata[CMSB:BS];
	p_current <= reset_or_abort ? 1'b0 : p_current + request_ack;
     end
   one_shot one_shot_i0
     (.clock(clock),
      .in(p_current == p_interrupt),
      .out(interrupt));
endmodule