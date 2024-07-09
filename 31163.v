module was copied from the Ettus UHD code.
  (output reg signed [35:0] P,
   input signed [17:0] A,
   input signed [17:0] B,
   input C,    // Clock
   input CE,   // Clock Enable
   input R     // Synchronous Reset
   );
   always @(posedge C)
     if(R)
       P <= 36'sd0;
     else if(CE)
       begin
          P <= A * B;
       end
endmodule