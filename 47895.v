module
   input  CLKDIVP;        // for MIG only
   input  D;              // serial input data pin
   input  DDLY;           // serial input data from IDELAYE2
   input  DYNCLKDIVSEL;   // dynamically select CLKDIV inversion
   input  DYNCLKSEL;      // dynamically select CLK and CLKB inversion.
   input  OCLK;           // clock for strobe based memory interfaces
   input  OCLKB;          // clock for strobe based memory interfaces
   input  OFB;            // data feebdack from OSERDESE2?
   input  RST;            // asynchronous reset
   input  SHIFTIN1;       // slave of multie serdes
   input  SHIFTIN2;       // slave of multie serdes
   //outputs
   output O;              // pass through from D or DDLY
   output Q1;             // parallel data out (last bit)
   output Q2;
   output Q3;
   output Q4;
   output Q5;
   output Q6;
   output Q7;
   output Q8;             // first bit of D appears here
   output SHIFTOUT1;      // master of multi serdes
   output SHIFTOUT2;      // master of multi serdes
   reg [3:0] even_samples;
   reg [3:0] odd_samples;
   always @ (posedge CLK)
     even_samples[3:0] <= {even_samples[2:0],D};
   always @ (negedge CLK)
     odd_samples[3:0] <= {odd_samples[2:0],D};
   assign Q1 = odd_samples[0];
   assign Q2 = even_samples[0];
   assign Q3 = odd_samples[1];
   assign Q4 = even_samples[1];
   assign Q5 = odd_samples[2];
   assign Q6 = even_samples[2];
   assign Q7 = odd_samples[3];
   assign Q8 = even_samples[3];
   //pass through
   assign O=D;
   //not implemented
   assign SHIFTOUT1=1'b0;
   assign SHIFTOUT2=1'b0;
endmodule