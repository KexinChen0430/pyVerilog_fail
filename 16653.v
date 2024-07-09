module bcam_bhv
 #( parameter                    CDEP = 512,  // CAM depth
    parameter                    PWID = 32 ,  // CAM/pattern width
    parameter                    INOM = 1  )  // binary / Initial CAM with no match (has priority over IFILE)
  ( input                        clk       ,  // clock
    input                        rst       ,  // global registers reset
    input                        wEnb      ,  // write enable
    input      [`log2(CDEP)-1:0] wAddr     ,  // write address
    input      [      PWID -1:0] wPatt     ,  // write pattern
    input      [      PWID -1:0] mPatt     ,  // patern to match
    output reg                   match     ,  // match indicator
    output reg [`log2(CDEP)-1:0] mAddr     ); // matched address
  // assign memory array
  reg [PWID-1:0] mem [0:CDEP-1];
  // valid bit
  reg [CDEP-1:0] vld;
  // initialize memory, with zeros if INOM or file if IFILE.
  integer i;
  initial
    if (INOM)
      for (i=0; i<CDEP; i=i+1)
        {vld[i],mem[i]} = {1'b0,{PWID{1'b0}}};
  always @(posedge clk) begin
    // write to memory
    if (wEnb)
      {vld[wAddr],mem[wAddr]} = {1'b1,wPatt};
    // search memory
    match = 0;
    mAddr = 0;
    match = (mem[mAddr]==mPatt) && vld[mAddr];
    while ((!match) && (mAddr<(CDEP-1))) begin
      mAddr=mAddr+1;
      match = (mem[mAddr]==mPatt) && vld[mAddr];
    end
  end
endmodule