module matrix_arb (request, grant, success, clk, rst_n);
   parameter size= 4;
   parameter multistage = 0;
   parameter grant_hold = 0;
   parameter priority_support = 0;
   input [size-1:0] request;
   output [size-1:0] grant;
   input success;
   input clk, rst_n;
   genvar i,j;
   logic [size-1:0] req;
   logic [size-1:0] newgrant;
   logic [size*size-1:0] next_state, current_state;
   logic [size-1:0] pri [size-1:0];
   logic [size*size-1:0] new_state;
   logic [size*size-1:0] state;
   logic  update;
   genvar r;
   integer k;
   assign req = request;
   // ##########################################
   // Generate grants
   // ##########################################
   generate
   for (i=0; i<size; i=i+1) begin:ol1
      // generate grant i
      for (j=0; j<size; j=j+1) begin:il1
         if (j==i)
           // request i wins if requesting and....
           assign pri[i][j]=req[i];
         else
           // ....no other request with higher priority
           if (j>i)
             // j beats i
             assign pri[i][j]=!(req[j]&&state[j*size+i]);
           else
             // !(i beats j)
             assign pri[i][j]=!(req[j]&&!state[i*size+j]);
      end
      assign grant[i]=&pri[i];
   end
   endgenerate
   generate
   if (multistage==2) begin
      assign state = success ? next_state : current_state;
   end else begin
      assign state = current_state;
   end
   endgenerate
   // calculate next matrix state based on current requests and grants
   comb_matrix_arb_next_state #(size) calc_next (.*);
   always@(posedge clk) begin
     if (!rst_n) begin
        current_state<='1; //-1;
	next_state<='1; //-1;
     end else begin
	// **************************************************
	// Multistage Arbiter with Late Success Notification  (multistage==2)
	// **************************************************
	if (multistage==2) begin
	   update<=|req;
	   if (|req) begin
	      // This 'next_state' will only be used on next clock cycle if
	      // 'success' is asserted
	      next_state <= new_state;
	   end
	   if (update) begin
	      current_state <= state;
	   end
	end else begin
	   // ************************************
	   // Multistage Arbiter (multistage==1)
	   // ************************************
	   // check request was ultimately successful before updating arbiter state
	   // we know about success before the next clock cycle.
	   if ((multistage==1)&!success) begin
	      // request was not ultimately successful, don't update priorities
	   end else begin
	      // **********************************
	      // Basic Arbiter (multistage==0)
	      // **********************************
	      // Update state whenever at least one request has been made
              if (|req) begin
		 current_state<=new_state;
              end
	   end
	end
     end
   end
endmodule