module counterA
  (output logic [3:0]          cntA_reg, // Registered version of cntA
   input logic decrementA,               // 0=Up-counting, 1=down-counting
   input logic dual_countA,              // Advance counter by 2 steps at a time
   input logic cntA_en,                  // Enable Counter A
   input logic clk,                      // Clock
   input logic rst);                     // Synchronous reset
   logic [3:0] cntA;                     // combinational count variable.
   // Counter A
   // Sequential part of counter CntA
   always_ff @(posedge clk)
     begin
	cntA_reg <= cntA;
     end
   // Combinational part of counter
   // Had to be split up to test C-style update, as there are no
   // non-blocking version like -<=
   always_comb
     if (rst)
       cntA = 0;
     else  begin
        cntA = cntA_reg;              // Necessary to avoid latch
        if (cntA_en) begin
           if (decrementA)
             if (dual_countA)
               //cntA = cntA - 2;
               cntA -= 2;
             else
               //cntA = cntA - 1;
               cntA--;
           else
             if (dual_countA)
               //cntA = cntA + 2;
               cntA += 2;
             else
               //cntA = cntA + 1;
               cntA++;
        end // if (cntA_en)
     end
endmodule