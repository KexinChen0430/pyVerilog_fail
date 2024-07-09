module bcam_reg
 #( parameter                CAMD = 16,  // CAM depth
    parameter                CAMW = 4 ,  // CAM/pattern width
    parameter                PIPE = 0 ,  // Pipelined? (binary; 0 or 1)
    parameter                INOM = 1 )  // binary / Initial CAM with no match
  ( input                    clk      ,  // clock
    input                    rst      ,  // global registers reset
    input                    wEnb     ,  // write enable
    input  [`log2(CAMD)-1:0] wAddr    ,  // write address
    input  [      CAMW -1:0] wPatt    ,  // write pattern
    input  [      CAMW -1:0] mPatt    ,  // patern to match
    output                   match    ,  // match indicator
    output [`log2(CAMD)-1:0] mAddr    ); // matched address
  // wAddr one-hot decoder
  reg [CAMD-1:0] lineWEnb;
  always @(*) begin
    lineWEnb        = {CAMD{1'b0}};
    lineWEnb[wAddr] = wEnb        ;
  end
  // write data and valid bit (MSB)
  reg [CAMW:0] CAMReg [0:CAMD-1];
  integer i;
  always @(posedge clk, posedge rst)
    for (i=0; i<CAMD; i=i+1)
      if (rst && INOM) CAMReg[i] <= {(CAMW+1){1'b0}};
      else if (lineWEnb[i]) CAMReg[i] <= {1'b1,wPatt};
  // onehot match
  reg [CAMD-1:0] matchOnehot;
  always @(*)
    for (i=0; i<CAMD; i=i+1)
      matchOnehot[i] = (CAMReg[i] == {1'b1,mPatt});
  // binary match (priority encoded) with CAMD width
  // generated automatically by ./pe script
  pe_camd pe_reg_inst (
    .clk( clk         ), // clock for pipelined priority encoder
    .rst( rst         ), // registers reset for pipelined priority encoder
    .oht( matchOnehot ), // one-hot match input / in : [      CAMD -1:0]
    .bin( mAddr       ), // first match index   / out: [`log2(CAMD)-1:0]
    .vld( match       )  // match indicator     / out
  );
endmodule