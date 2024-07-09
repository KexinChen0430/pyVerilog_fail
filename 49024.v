module swd_host
  (
   input             clock, // 125 MHz
   inout             swdio, // DDR out, SDR in
   output reg        swclk = 0,
   output reg        creset = 0,
   input             wvalid,
   input [36:0]      wdata,
   output reg [31:0] rdata = 0,
   output [3:0]      status
   );
   reg 		    tq = 0;
   reg 		    sdo = 1;
   reg [45:0] 	    sr = 0;
   reg [6:0] 	    state = 0;
   reg              read = 0;
   reg [2:0]        ack = 0;
   reg              busy = 0;
   reg              write32 = 0;
   reg              swdio_s;
   wire             ce;
   reg              ce_1 = 0;
   swd_clockdiv clockdiv(.c(clock), .r(wvalid), .w(wvalid && (wdata[36:32] == 5'h12)),
                         .wdata(wdata[7:0]), .ce(ce));
   wire             last_bit = write32 ? (state == 89) :
                    ((state == 27) && !ack[0]) || (state == 93);
   reg              parity_ok = 0;
   assign status = {ack,busy};
   always @ (posedge clock)
     begin
        if(wvalid && (wdata[36:32] == 5'h13))
          creset <= wdata[0];
        if(wvalid && (wdata[36:32] < 5'h12))
          begin
             sr <= {^wdata[31:0], // write parity
                    wdata[31:0], // write data
                    7'b0000010, // turnaround, ack, turnaround, stop, park
                    ^wdata[35:32], // command parity
                    wdata[35:32], // command
                    1'b1}; // start
             state <= wdata[36] ? 7'd26 : 2'd2;
             busy <= 1'b1;
             read <= wdata[33];
             write32 <= wdata[36];
          end
	else if((state!=0) && ce)
          begin
             if(state[0] && !last_bit)
               sr <= {1'b1, swdio_s, sr[45:1]};
             state <= last_bit ? 1'b0 : state + 1'b1;
          end
        else if(ce)
          busy <= 1'b0;
        ce_1 <= ce;
        if(ce_1)
          swdio_s <= swdio;
        if(state == 26)
          ack <= sr[45:43];
        if((state == 90) && read)
          rdata <= sr[45:14];
        if((state == 92) && read)
          parity_ok = ^{1'b1,sr[45],rdata};
	tq <= !((state < 18) || (write32) || (!read && (state > 27)));
	sdo <= write32 ? sr[13] : sr[0];
        swclk <= state[0];
     end
   assign swdio = tq ? 1'bz : sdo;
   initial
     begin
        $dumpfile("dump.vcd");
	$dumpvars(0);
     end
endmodule