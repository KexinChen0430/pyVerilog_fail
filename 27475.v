module t (/*AUTOARG*/
   // Outputs
   state,
   // Inputs
   clk
   );
   input clk;
   int   cyc;
   reg   rstn;
   output [4:0] state;
   parameter real  fst_gparam_real = 1.23;
   localparam real fst_lparam_real = 4.56;
   real            fst_real = 1.23;
   integer         fst_integer;
   bit             fst_bit;
   logic           fst_logic;
   int             fst_int;
   shortint        fst_shortint;
   longint         fst_longint;
   byte            fst_byte;
   parameter       fst_parameter = 123;
   localparam      fst_lparam = 456;
   supply0         fst_supply0;
   supply1         fst_supply1;
   tri0            fst_tri0;
   tri1            fst_tri1;
   tri             fst_tri;
   wire            fst_wire;
   Test test (/*AUTOINST*/
              // Outputs
              .state                    (state[4:0]),
              // Inputs
              .clk                      (clk),
              .rstn                     (rstn));
   // Test loop
   always @ (posedge clk) begin
      cyc <= cyc + 1;
      if (cyc==0) begin
         // Setup
         rstn <= ~'1;
      end
      else if (cyc<10) begin
         rstn <= ~'1;
      end
      else if (cyc<90) begin
         rstn <= ~'0;
      end
      else if (cyc==99) begin
         $write("*-* All Finished *-*\n");
         $finish;
      end
   end
endmodule