module mux2(
   input  wire            clk,
   input  wire   `REQ    portA_req,
   output wire   `RES    portA_res,
   input  wire   `REQ    portB_req,
   output wire   `RES    portB_res,
   output wire   `REQ    req,
   input  wire   `RES    res);
   parameter m = 32;
   parameter n = 32;
 // There are trivial for the two-port case, but to illustrate how to scale...
 wire portA_strobe = portA_req`R | portA_req`W;
 wire portB_strobe = portB_req`R | portB_req`W;
 // Prioritized arbitration
/*
 XXX Must be very careful when the target issues a hold (wait).
 If it previously was in a wait condition, then current input must be
 ignored until the hold clears.  Tricky.
 The following diagram illustrates how port B keeps the request while
 the target is in the hold condition even a request from (higher
 priority) port A comes in.  However, as soon as B's initial bus cycle
 is over, port A wins the next arbitration.  (Read requests used for
 this example).
                               Port B must keep the bus while hold is active
                               |             Request from port B accepted, port B loses the bus to A (thus B holds)
                               |             |             Data for port B from sampled, request from port B noted
                               |             |             |
                               v             v             v
 clock      _____/~~~~~~\______/~~~~~~\______/~~~~~~\______/~~~~~~\______/~~~~~~\______/~~~~~~\______/~~~~~~\______
 readA read ______________________/~~~~~~~~~~~~~~~~~~~~~~~~~~\_______________________________________
 portB read ________/~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\_______________________________________
 selected   ________<BBBBBBBBBBBBBBBBBBBBBBBBBB><AAAAAAAAAAAA><BBBBBBBBBBBB>_______________________
 addr       --------<###### Addr B1 ###########><## Addr A ##><## Addr B2##>-----------------------
 hold       _____________/~~~~~~~~~~~~\________________________________________________
 data       _______________________________________<## Data B1##><## Data A ##><## Data B2##>
 portA hold ______________________/~~~~~~~~~~~~\________________________________________________
 portB hold _____________/~~~~~~~~~~~~\_________/~~~~~~~~~~~~\_______________________________________
 */
 reg  hold_ = 0, selA_ = 0, selB_ =  0;
 wire selA = hold_ ? selA_ : portA_strobe; // INV #2
 wire selB = hold_ ? selB_ : ~selA & portB_strobe;  // INV #2
 always @(posedge clk) hold_ <= res`HOLD;
 always @(posedge clk) selA_ <= selA;
 always @(posedge clk) selB_ <= selB;
 assign req            = selA ? portA_req : portB_req;
 assign portA_res`RD   = selA_ ? res`RD : 0;           // INV #4
 assign portB_res`RD   = selB_ ? res`RD : 0;           // INV #4
 assign portA_res`HOLD = portA_strobe & (~selA | res`HOLD); // INV #3
 assign portB_res`HOLD = portB_strobe & (~selB | res`HOLD); // INV #3
endmodule