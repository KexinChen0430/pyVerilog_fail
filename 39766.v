module cmd_prbs_gen #
  (
   parameter TCQ           = 100,
   parameter FAMILY     = "SPARTAN6",
   parameter MEM_BURST_LEN = 8,
   parameter ADDR_WIDTH = 29,
   parameter DWIDTH     = 32,
   parameter PRBS_CMD   = "ADDRESS", // "INSTR", "BLEN","ADDRESS"
   parameter PRBS_WIDTH = 64,          //   64,15,20
   parameter SEED_WIDTH = 32,           //   32,15,4
   parameter PRBS_EADDR_MASK_POS = 32'hFFFFD000,
   parameter PRBS_SADDR_MASK_POS =  32'h00002000,
   parameter PRBS_EADDR  = 32'h00002000,
   parameter PRBS_SADDR  = 32'h00002000
   )
  (
   input         clk_i,
   input         prbs_seed_init,  // when high the prbs_x_seed will be loaded
   input         clk_en,
   input [SEED_WIDTH-1:0]  prbs_seed_i,
   output[SEED_WIDTH-1:0]  prbs_o     // generated address
  );
wire[ADDR_WIDTH - 1:0] ZEROS;
reg [SEED_WIDTH - 1:0] prbs;
reg [PRBS_WIDTH :1] lfsr_q;
assign ZEROS = 'b0;
function integer logb2;
  input integer number;
  integer i;
  begin
    i = number;
      for(logb2=1; i>0; logb2=logb2+1)
        i = i >> 1;
  end
endfunction
//####################################################################################################################
//                                                                                                                   #
//                                                                                                                   #
// 64 taps: [64,63,61,60]: {{8'b01011000}, {56'b0}}                                                                  #
//  upper 32 bits are loadable                                                                                       #
//                                                                                                                   #
//     ........................................................................................
//         ^                  ^                      ^             ^                          |
//         |   ____           |  ___     ___         | ___         |  ___     ___     ___     |
//         |   |   |   |---|<-  |   |   |   | |---|<- |   |  |---|<- |   |...|   |   |   |    |  The first 32 bits are parallel loadable.
//             |___|    ---     |___|   |___|  ---    |___|   ---    |___|...|___|   |___|
//                                           <<-- shifting  --
//#####################################################################################################################
// use SRLC32E for lower 32 stages and 32 registers for upper 32 stages.
// we need to provide 30 bits addres. SRLC32 has only one bit output.
// address seed will be loaded to upper 32 bits.
//  parallel load and serial shift out to  LFSR  during INIT time
generate
  if(PRBS_CMD == "ADDRESS" && PRBS_WIDTH == 64)
  begin :gen64_taps
    always @ (posedge clk_i) begin
      if(prbs_seed_init) begin//reset it to a known good state to prevent it locks up
        lfsr_q <= #TCQ {31'b0,prbs_seed_i};
      end else if(clk_en) begin
        lfsr_q[64] <= #TCQ lfsr_q[64] ^ lfsr_q[63];
        lfsr_q[63] <= #TCQ lfsr_q[62];
        lfsr_q[62] <= #TCQ lfsr_q[64] ^ lfsr_q[61];
        lfsr_q[61] <= #TCQ lfsr_q[64] ^ lfsr_q[60];
        lfsr_q[60:2] <= #TCQ lfsr_q[59:1];
        lfsr_q[1] <= #TCQ lfsr_q[64];
      end
    end
    always @(lfsr_q[32:1]) begin
      prbs = lfsr_q[32:1];
    end
  end
//endgenerate
//generate
else  if(PRBS_CMD == "ADDRESS" && PRBS_WIDTH == 32)
  begin :gen32_taps
    always @ (posedge clk_i) begin
      if(prbs_seed_init) begin //reset it to a known good state to prevent it locks up
        lfsr_q <= #TCQ {prbs_seed_i};
      end else if(clk_en) begin
        lfsr_q[32:9] <= #TCQ lfsr_q[31:8];
        lfsr_q[8]    <= #TCQ lfsr_q[32] ^ lfsr_q[7];
        lfsr_q[7]    <= #TCQ lfsr_q[32] ^ lfsr_q[6];
        lfsr_q[6:4]  <= #TCQ lfsr_q[5:3];
        lfsr_q[3]    <= #TCQ lfsr_q[32] ^ lfsr_q[2];
        lfsr_q[2]    <= #TCQ lfsr_q[1] ;
        lfsr_q[1]    <= #TCQ lfsr_q[32];
      end
    end
    integer i;
    always @(lfsr_q[32:1]) begin
     if (FAMILY == "SPARTAN6" ) begin  // for 32 bits
      for(i = logb2(DWIDTH) + 1; i <= SEED_WIDTH - 1; i = i + 1)
       if(PRBS_SADDR_MASK_POS[i] == 1)
          prbs[i] = PRBS_SADDR[i] | lfsr_q[i+1];
       else if(PRBS_EADDR_MASK_POS[i] == 1)
          prbs[i] = PRBS_EADDR[i] & lfsr_q[i+1];
       else
          prbs[i] =  lfsr_q[i+1];
       prbs[logb2(DWIDTH )  :0] = {logb2(DWIDTH ) + 1{1'b0}};
      end
    else begin
     for(i = logb2(MEM_BURST_LEN) - 2; i <= SEED_WIDTH - 1; i = i + 1)
 //     for(i = 3; i <= SEED_WIDTH - 1; i = i + 1)
// BL8: 0,8
//BL4: incremnt by 4
//     for(i = 3; i <= SEED_WIDTH - 1; i = i + 1)
       if(PRBS_SADDR_MASK_POS[i] == 1)
          prbs[i] = PRBS_SADDR[i] | lfsr_q[i+1];
       else if(PRBS_EADDR_MASK_POS[i] == 0)
          prbs[i] = PRBS_EADDR[i] & lfsr_q[i+1];
       else
          prbs[i] = 1'b0;// lfsr_q[i+1];
          //   3 1
     prbs[logb2(MEM_BURST_LEN)-3:0] = 'b0;//{logb2(MEM_BURST_LEN) -3{1'b0}};
 //     prbs[2:0] = {3{1'b0}};
    end
  end
end
//endgenerate
//####################################################################################################################
//                                                                                                                   #
//                                                                                                                   #
// 15 taps: [15,14]:                                                                                                 #
//                                                                                         #
//                                                                                                                   #
//         .............................................................
//         ^                  ^              .                           ^
//         |   ____           |  ___     ___     ___     ___     ___     |
//         |   |   |   |---|<-  |   |   |   |   |   |...|   |   |   |    |
//             |___|    ---     |___|   |___|   |___|...|___|   |___|
//                                           <<-- shifting  --
//#####################################################################################################################
//generate
//  if(PRBS_CMD == "INSTR" | PRBS_CMD == "BLEN")
else
  begin :gen20_taps
    always @(posedge clk_i) begin
      if(prbs_seed_init) begin//reset it to a known good state to prevent it locks up
        lfsr_q <= #TCQ {5'b0,prbs_seed_i[14:0]};
      end else if(clk_en) begin
        lfsr_q[20]   <= #TCQ lfsr_q[19];
        lfsr_q[19]   <= #TCQ lfsr_q[18];
        lfsr_q[18]   <= #TCQ lfsr_q[20] ^lfsr_q[17];
        lfsr_q[17:2] <= #TCQ lfsr_q[16:1];
        lfsr_q[1]    <= #TCQ lfsr_q[20];
      end
    end
    always @ (lfsr_q[SEED_WIDTH - 1:1], ZEROS) begin
        prbs = {ZEROS[SEED_WIDTH - 1:6],lfsr_q[6:1]};
    end
  end
endgenerate
assign prbs_o = prbs;
endmodule