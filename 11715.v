module regfile(input  wire        clock,
               input  wire        enable,
               input  wire [ 4:0] rdaddress_a,
               input  wire [ 4:0] rdaddress_b,
               // Write port
               input  wire        wren,
               input  wire [ 4:0] wraddress,
               input  wire [31:0] data,
               // Read ports
               output reg  [31:0] qa, // One clock cycle delayed
               output reg  [31:0] qb  // One clock cycle delayed
               );
   reg [31:0] regs [31:0];
   always @(posedge clock)
     if (enable) begin
        if (wren)
          regs[wraddress] <= data;
        qa <= regs[rdaddress_a];
        qb <= regs[rdaddress_b];
     end
   reg [7:0] i;
   initial begin
      i = 0;
      repeat (32) begin
         regs[i] = 0 /*{4{i}}*/;
         i = i + 1;
      end
   end
endmodule