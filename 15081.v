module spi (clock, reset, sclk, sdi, sdo,
             inbuffer0, inbuffer1, inbuffer2, inbuffer3,
             inbuffer4, inbuffer5, inbuffer6, inbuffer7,
             inbuffer8, inbuffer9, inbufferA, inbufferB,
             inbufferC, inbufferD, inbufferE, inbufferF,
             outbuffer0, outbuffer1, outbuffer2, outbuffer3,
             outbuffer4, outbuffer5, outbuffer6, outbuffer7,
             outbuffer8, outbuffer9, outbufferA, outbufferB,
             outbufferC, outbufferD, outbufferE, outbufferF,
             toread,  towrite, enable, irq, picintr, rts,
             status, statusirq, statusread, picready, state);
    output picready;
    output [1:0] state;
    input clock;
    input reset;
    output sclk;
    input  sdi, statusread;
    output sdo, statusirq;
    input  rts, picintr;
    output [7:0] inbuffer0, inbuffer1, inbuffer2, inbuffer3,
                 inbuffer4, inbuffer5, inbuffer6, inbuffer7,
                 inbuffer8, inbuffer9, inbufferA, inbufferB,
                 inbufferC, inbufferD, inbufferE, inbufferF,
                 status;
    input [7:0]  outbuffer0, outbuffer1, outbuffer2, outbuffer3,
                 outbuffer4, outbuffer5, outbuffer6, outbuffer7,
                 outbuffer8, outbuffer9, outbufferA, outbufferB,
                 outbufferC, outbufferD, outbufferE, outbufferF,
                 toread,  towrite;
    input        enable;
    output       irq;
    wire         clock, reset, sclk, sdi, sdo, enable, picintr,
                 statusread;
    reg [7:0]    inbuffer0, inbuffer1, inbuffer2, inbuffer3,
                 inbuffer4, inbuffer5, inbuffer6, inbuffer7,
                 inbuffer8, inbuffer9, inbufferA, inbufferB,
                 inbufferC, inbufferD, inbufferE, inbufferF,
                 status;
    wire [7:0]   outbuffer0, outbuffer1, outbuffer2, outbuffer3,
                 outbuffer4, outbuffer5, outbuffer6, outbuffer7,
                 outbuffer8, outbuffer9, outbufferA, outbufferB,
                 outbufferC, outbufferD, outbufferE, outbufferF,
                 toread,  towrite;
    reg [7:0]    engine_toread, engine_towrite;
    wire [127:0] engine_inbuffer;
    reg [127:0]  engine_outbuffer;
    wire         engine_irq, engine_enable;
    wire         spiclockp, spiclockn;
    reg          irq, statusirq, oldpicintr, statuschanged;
    spi_clock_divisor #(.clkdiv(`SPICLOCKDIV)) divisor
      (.reset(reset), .clkin(clock), .clkoutp(spiclockp), .clkoutn(spiclockn));
    spi_engine engine (.clock(clock), .reset(reset),
                       .sclk(sclk), .sdi(sdi), .sdo(sdo),
                       .indata(engine_inbuffer), .outdata(engine_outbuffer),
                       .toread(engine_toread), .towrite(engine_towrite),
                       .enable(engine_enable), .irq(engine_irq),
                       .rts(rts),
                       .spiclockp(spiclockp), .spiclockn(spiclockn),
                       .picready(picready));
    reg [1:0]    state;
    reg          prevstatusread;
`define STATE_IDLE                0
`define STATE_TRANSMITTING_USER   1
`define STATE_TRANSMITTING_STATUS 2
`define STATE_SIGNALLING          3
    always @(posedge clock or negedge reset)
      if (~reset)
        begin
           state            <= `STATE_IDLE;
           status           <= 0;
           prevstatusread   <= 0;
           irq              <= 0;
           statusirq        <= 0;
           oldpicintr       <= 0;
           statuschanged    <= 0;
        end
      else
        begin
           if (picintr != oldpicintr) statuschanged <= 1;
           if (statusread != prevstatusread)
             begin
                prevstatusread <= statusread;
                statusirq <= 0;
             end
           casex ({state, enable, engine_irq, irq, statusirq, statuschanged})
             {2'd`STATE_IDLE, 1'b1, 1'b?, 1'b0, 1'b?, 1'b?}:
               // Start user request if no user IRQ is pending
               begin
                  status[7] <= 0;        // Invalidate status
                  statuschanged <= 1;
                  engine_outbuffer <=
                              {outbuffer0, outbuffer1, outbuffer2, outbuffer3,
                               outbuffer4, outbuffer5, outbuffer6, outbuffer7,
                               outbuffer8, outbuffer9, outbufferA, outbufferB,
                               outbufferC, outbufferD, outbufferE, outbufferF};
                  engine_toread  <= toread;
                  engine_towrite <= towrite;
                  state          <= `STATE_TRANSMITTING_USER;
               end
             {2'd`STATE_IDLE, 1'b?, 1'b?, 1'b?, 1'b?, 1'b1}:
               // Start status request if status has changed
               begin
                  irq              <= 0;
                  engine_outbuffer <= {`STATUS_READ, 120'd0};
                  engine_toread    <= 1;
                  engine_towrite   <= 1;
                  state            <= `STATE_TRANSMITTING_STATUS;
                  status[7]        <= 0; // Invalidate status
                  oldpicintr       <= picintr;
                  statuschanged    <= 0;
               end // case: {2'd`STATE_IDLE, 1'b?, 1'b?, 1'b?, 1'b?, 1'b1}
             /*
             {2'd`STATE_TRANSMITTING_USER, 1'b0, 1'b?, 1'b?, 1'b?, 1'b?}:
               // Request has been aborted by user
               begin
                  state <= `STATE_SIGNALLING;
                  irq   <= 0;
               end
              */
             {2'd`STATE_TRANSMITTING_USER, 1'b?, 1'b1, 1'b?, 1'b?, 1'b?}:
               // Receive answer for user
               begin
                  {inbuffer0, inbuffer1, inbuffer2, inbuffer3,
                   inbuffer4, inbuffer5, inbuffer6, inbuffer7,
                   inbuffer8, inbuffer9, inbufferA, inbufferB,
                   inbufferC, inbufferD, inbufferE, inbufferF}
                    <= engine_inbuffer;
                  irq          <= 1;
                  state        <= `STATE_SIGNALLING;
               end
             {2'd`STATE_TRANSMITTING_STATUS, 1'b?, 1'b1, 1'b?, 1'b?, 1'b?}:
               // Receive status information
               begin
                  status <= {1'b1, engine_inbuffer[126:120]};
                  if ({1'b1, engine_inbuffer[126:120]} != status)
                    statusirq <= 1;
                  state <= `STATE_SIGNALLING;
               end
             {2'd`STATE_SIGNALLING, 1'b0, 1'b?, 1'b?, 1'b?, 1'b?}:
               state <= `STATE_IDLE;
           endcase
        end
    assign engine_enable = state == `STATE_TRANSMITTING_USER |
                           state == `STATE_TRANSMITTING_STATUS;
endmodule