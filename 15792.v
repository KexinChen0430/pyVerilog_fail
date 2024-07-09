module
         // will automatically set the data_mode_o to 0x8
         4'b1010: data =calib_data;
         // Characterization Mode
         //  2:    Address as data
         //  3:    hammer data with option to select VICTIM line which output is always high.
         //  7:    Hammer PRBS. Only valid in V6,V7 family
         //  9:    Slow 2 MHz hammer pattern.
         4'b0111: data = full_prbs_data2;//{prbs_data,prbs_data,prbs_data,prbs_data};   //  "011" = prbs
         4'b1000: data = psuedo_prbs_data;//{prbs_data,prbs_data,prbs_data,prbs_data};   //  "011" = prbs
         default : begin
                //       for (i=0; i <= 4*NUM_DQ_PINS - 1; i= i+1)  begin: neighbor_data
               //      data = begin
               //           for (
                   data = adata;
                   end
   endcase
end
// phy calibration data pattern
always @ (posedge clk_i)
if (rst_i) begin
    next_calib_data <= 1'b0;
    calib_data <=  #TCQ {{(NUM_DQ_PINS/8){8'h55}},{(NUM_DQ_PINS/8){8'haa}},{(NUM_DQ_PINS/8){8'h00}},{(NUM_DQ_PINS/8){8'hff}}};
    end
else if (cmd_startA)
begin
     calib_data <=  #TCQ {{(NUM_DQ_PINS/8){8'h55}},{(NUM_DQ_PINS/8){8'haa}},{(NUM_DQ_PINS/8){8'h00}},{(NUM_DQ_PINS/8){8'hff}}};
     next_calib_data <=#TCQ  1'b1;
//     calib_data <= 'b0;
     end
else if (fifo_rdy_i)
     begin
     next_calib_data <= #TCQ  ~next_calib_data;
     if (next_calib_data )
     calib_data <= #TCQ  {{(NUM_DQ_PINS/8){8'h66}},{(NUM_DQ_PINS/8){8'h99}},{(NUM_DQ_PINS/8){8'haa}},{(NUM_DQ_PINS/8){8'h55}}};
     else
     calib_data <= #TCQ  {{(NUM_DQ_PINS/8){8'h55}},{(NUM_DQ_PINS/8){8'haa}},{(NUM_DQ_PINS/8){8'h00}},{(NUM_DQ_PINS/8){8'hff}}};
     end
/*
always @ (posedge clk_i)
begin    calib_data <= 'b0;
end
*/
// Pattern bram generates fixed input, hammer, simple 8 repeat data pattern.
function integer logb2;
  input [31:0] in;
  integer i;
  begin
    i = in;
      for(logb2=1; i>0; logb2=logb2+1)
        i = i >> 1;
  end
endfunction
vio_init_pattern_bram #
( .MEM_BURST_LEN      (MEM_BURST_LEN),
  .START_ADDR         (START_ADDR),
  .NUM_DQ_PINS        (NUM_DQ_PINS),
  .SEL_VICTIM_LINE    (SEL_VICTIM_LINE)
)
vio_init_pattern_bram
(
 .clk_i              (clk_i ),
 .rst_i              (rst_i ),
 // BL8 : least 3 address bits are always zero.
 // BL4 " least 2 address bits are always zero.
 // for walking 1's or 0's, the least 8 address bits are always zero.
 .cmd_addr           (addr_i),
 .cmd_start          (cmd_startB),
 .mode_load_i        (mode_load_i),
 .data_mode_i        (data_mode_rr_a),
 //.w1data              (w1data),
 .data0              (simple_data0 ),
 .data1              (simple_data1 ),
 .data2              (simple_data2 ),
 .data3              (simple_data3 ),
 .data4              (simple_data4 ),
 .data5              (simple_data5 ),
 .data6              (simple_data6 ),
 .data7              (simple_data7 ),
 .data8              (fixed_data_i ),
 .bram_rd_valid_o    (bram_rd_valid_o),
 .bram_rd_rdy_i      (user_burst_cnt_larger_1_r & (data_rdy_i | cmd_startB)),
 .dout_o             (bram_data)
 );
// Functions to be used byg Walking 1 and Walking 0 circuits.
function [2*nCK_PER_CLK*NUM_DQ_PINS-1:0] NbData_Gen (input integer i );
 integer j;
  begin
    j = i/2;
    NbData_Gen = {4*NUM_DQ_PINS{1'b0}};
        if(i %2) begin
             NbData_Gen[(0*NUM_DQ_PINS+j*8)+:8] = 8'b00010000;
             NbData_Gen[(2*NUM_DQ_PINS+j*8)+:8] = 8'b00100000;
             NbData_Gen[(1*NUM_DQ_PINS+j*8)+:8] = 8'b00000000;
             NbData_Gen[(3*NUM_DQ_PINS+j*8)+:8] = 8'b00000000;
        end else begin
            NbData_Gen[(0*NUM_DQ_PINS+j*8)+:8]   = 8'b00000001;
            NbData_Gen[(2*NUM_DQ_PINS+j*8)+:8]   = 8'b00000010;
             NbData_Gen[(1*NUM_DQ_PINS+j*8)+:8]  = 8'b00000000;
             NbData_Gen[(3*NUM_DQ_PINS+j*8)+:8]  = 8'b00000000;
        end
  end
endfunction
function [2*nCK_PER_CLK*NUM_DQ_PINS-1:0] Data_Gen (input integer i );
 integer j;
  begin
    j = i/2;
    Data_Gen = {2*nCK_PER_CLK*NUM_DQ_PINS{1'b0}};
        if(i %2) begin
           if (nCK_PER_CLK == 2) begin
            Data_Gen[(0*NUM_DQ_PINS+j*8)+:8] = 8'b00010000;
            Data_Gen[(2*NUM_DQ_PINS+j*8)+:8] = 8'b01000000;
            Data_Gen[(1*NUM_DQ_PINS+j*8)+:8] = 8'b00100000;
            Data_Gen[(3*NUM_DQ_PINS+j*8)+:8] = 8'b10000000;
            end
           else begin
            Data_Gen[(0*NUM_DQ_PINS+j*8)+:8] = 8'b00010000;
            Data_Gen[(1*NUM_DQ_PINS+j*8)+:8] = 8'b00100000;
            Data_Gen[(2*NUM_DQ_PINS+j*8)+:8] = 8'b01000000;
            Data_Gen[(3*NUM_DQ_PINS+j*8)+:8] = 8'b10000000;
            Data_Gen[(4*NUM_DQ_PINS+j*8)+:8] = 8'b00000001;
            Data_Gen[(5*NUM_DQ_PINS+j*8)+:8] = 8'b00000010;
            Data_Gen[(6*NUM_DQ_PINS+j*8)+:8] = 8'b00000100;
            Data_Gen[(7*NUM_DQ_PINS+j*8)+:8] = 8'b00001000;
           end
        end else begin
           if (nCK_PER_CLK == 2) begin
            Data_Gen[(0*NUM_DQ_PINS+j*8)+:8] = 8'b00000001;
            Data_Gen[(1*NUM_DQ_PINS+j*8)+:8] = 8'b00000010;
            Data_Gen[(2*NUM_DQ_PINS+j*8)+:8] = 8'b00000100;
            Data_Gen[(3*NUM_DQ_PINS+j*8)+:8] = 8'b00001000;
           end
           else begin
            Data_Gen[(0*NUM_DQ_PINS+j*8)+:8] = 8'b00000001;
            Data_Gen[(1*NUM_DQ_PINS+j*8)+:8] = 8'b00000010;
            Data_Gen[(2*NUM_DQ_PINS+j*8)+:8] = 8'b00000100;
            Data_Gen[(3*NUM_DQ_PINS+j*8)+:8] = 8'b00001000;
            Data_Gen[(4*NUM_DQ_PINS+j*8)+:8] = 8'b00010000;
            Data_Gen[(5*NUM_DQ_PINS+j*8)+:8] = 8'b00100000;
            Data_Gen[(6*NUM_DQ_PINS+j*8)+:8] = 8'b01000000;
            Data_Gen[(7*NUM_DQ_PINS+j*8)+:8] = 8'b10000000;
           end
        end
  end
endfunction
function [2*nCK_PER_CLK*NUM_DQ_PINS-1:0] Data_GenW0 (input integer i);
 integer j;
  begin
    j = i/2;
    Data_GenW0 = {2*nCK_PER_CLK*NUM_DQ_PINS{1'b1}};
        if(i %2) begin
             if (nCK_PER_CLK == 2) begin
             Data_GenW0[(0*NUM_DQ_PINS+j*8)+:8] = 8'b11101111;
             Data_GenW0[(1*NUM_DQ_PINS+j*8)+:8] = 8'b11011111;
             Data_GenW0[(2*NUM_DQ_PINS+j*8)+:8] = 8'b10111111;
             Data_GenW0[(3*NUM_DQ_PINS+j*8)+:8] = 8'b01111111;
             end
             else begin
             Data_GenW0[(0*NUM_DQ_PINS+j*8)+:8] = 8'b11101111;
             Data_GenW0[(1*NUM_DQ_PINS+j*8)+:8] = 8'b11011111;
             Data_GenW0[(2*NUM_DQ_PINS+j*8)+:8] = 8'b10111111;
             Data_GenW0[(3*NUM_DQ_PINS+j*8)+:8] = 8'b01111111;
             Data_GenW0[(4*NUM_DQ_PINS+j*8)+:8] = 8'b11111110;
             Data_GenW0[(5*NUM_DQ_PINS+j*8)+:8] = 8'b11111101;
             Data_GenW0[(6*NUM_DQ_PINS+j*8)+:8] = 8'b11111011;
             Data_GenW0[(7*NUM_DQ_PINS+j*8)+:8] = 8'b11110111;
             end
        end else begin
            if (nCK_PER_CLK == 2) begin
            Data_GenW0[(0*NUM_DQ_PINS+j*8)+:8] = 8'b11111110;
            Data_GenW0[(1*NUM_DQ_PINS+j*8)+:8] = 8'b11111101;
            Data_GenW0[(2*NUM_DQ_PINS+j*8)+:8] = 8'b11111011;
            Data_GenW0[(3*NUM_DQ_PINS+j*8)+:8] = 8'b11110111;
            end
            else begin
            Data_GenW0[(0*NUM_DQ_PINS+j*8)+:8] = 8'b11111110;
            Data_GenW0[(1*NUM_DQ_PINS+j*8)+:8] = 8'b11111101;
            Data_GenW0[(2*NUM_DQ_PINS+j*8)+:8] = 8'b11111011;
            Data_GenW0[(3*NUM_DQ_PINS+j*8)+:8] = 8'b11110111;
            Data_GenW0[(4*NUM_DQ_PINS+j*8)+:8] = 8'b11101111;
            Data_GenW0[(5*NUM_DQ_PINS+j*8)+:8] = 8'b11011111;
            Data_GenW0[(6*NUM_DQ_PINS+j*8)+:8] = 8'b10111111;
            Data_GenW0[(7*NUM_DQ_PINS+j*8)+:8] = 8'b01111111;
            end
        end
  end
endfunction
always @ (posedge clk_i) begin
 if (data_mode_rr_c[2:0] == 3'b101  || data_mode_rr_c[2:0] == 3'b100 || data_mode_rr_c[2:0] == 3'b110)   // WALKING ONES
     sel_w1gen_logic <= #TCQ 1'b1;
 else
     sel_w1gen_logic <= #TCQ 1'b0;
end
generate
genvar m;
 for (m=0; m < (2*nCK_PER_CLK*NUM_DQ_PINS/8) - 1; m= m+1)  begin: w1_gp
       assign  w1data_group[m] = ( (w1data[(m*8+7):m*8]) != 8'h00);
 end
endgenerate
  generate
    if ((NUM_DQ_PINS == 8 ) &&(DATA_PATTERN == "DGEN_WALKING1" || DATA_PATTERN == "DGEN_WALKING0" || DATA_PATTERN == "DGEN_ALL"))  begin : WALKING_ONE_8_PATTERN
     always @ (posedge clk_i) begin
        if( (fifo_rdy_i ) || cmd_startC )
          if (cmd_startC ) begin
             if (sel_w1gen_logic) begin
                  if (data_mode_i == 4'b0101)
                       w1data <= #TCQ Data_Gen(0);
                  else
                       w1data <= #TCQ Data_GenW0(0);
             end
          end
        else if ( MEM_BURST_LEN == 8 && fifo_rdy_i )  begin
            if ( nCK_PER_CLK == 2)
                begin
                w1data[4*NUM_DQ_PINS - 1:3*NUM_DQ_PINS] <= #TCQ {w1data[4*NUM_DQ_PINS - 5:3*NUM_DQ_PINS  ],w1data[4*NUM_DQ_PINS - 1:4*NUM_DQ_PINS - 4]};
                w1data[3*NUM_DQ_PINS - 1:2*NUM_DQ_PINS] <= #TCQ {w1data[3*NUM_DQ_PINS - 5:2*NUM_DQ_PINS  ],w1data[3*NUM_DQ_PINS - 1:3*NUM_DQ_PINS - 4]};
                w1data[2*NUM_DQ_PINS - 1:1*NUM_DQ_PINS] <= #TCQ {w1data[2*NUM_DQ_PINS - 5:1*NUM_DQ_PINS  ],w1data[2*NUM_DQ_PINS - 1:2*NUM_DQ_PINS - 4]};
                w1data[1*NUM_DQ_PINS - 1:0*NUM_DQ_PINS] <= #TCQ {w1data[1*NUM_DQ_PINS - 5:0*NUM_DQ_PINS  ],w1data[1*NUM_DQ_PINS - 1:1*NUM_DQ_PINS - 4]};
                end
            else begin
                w1data[8*NUM_DQ_PINS - 1:7*NUM_DQ_PINS] <= #TCQ w1data[8*NUM_DQ_PINS - 1:7*NUM_DQ_PINS ];
                w1data[7*NUM_DQ_PINS - 1:6*NUM_DQ_PINS] <= #TCQ w1data[7*NUM_DQ_PINS - 1:6*NUM_DQ_PINS ];
                w1data[6*NUM_DQ_PINS - 1:5*NUM_DQ_PINS] <= #TCQ w1data[6*NUM_DQ_PINS - 1:5*NUM_DQ_PINS ];
                w1data[5*NUM_DQ_PINS - 1:4*NUM_DQ_PINS] <= #TCQ w1data[5*NUM_DQ_PINS - 1:4*NUM_DQ_PINS ];
                w1data[4*NUM_DQ_PINS - 1:3*NUM_DQ_PINS] <= #TCQ w1data[4*NUM_DQ_PINS - 1:3*NUM_DQ_PINS ] ;
                w1data[3*NUM_DQ_PINS - 1:2*NUM_DQ_PINS] <= #TCQ w1data[3*NUM_DQ_PINS - 1:2*NUM_DQ_PINS ];
                 w1data[2*NUM_DQ_PINS - 1:1*NUM_DQ_PINS] <= #TCQ w1data[2*NUM_DQ_PINS - 1:1*NUM_DQ_PINS ] ;
                w1data[1*NUM_DQ_PINS - 1:0*NUM_DQ_PINS] <= #TCQ w1data[1*NUM_DQ_PINS - 1:0*NUM_DQ_PINS ];
                end
         end
      end
    end
  endgenerate
  generate
    if ((NUM_DQ_PINS != 8 ) &&(DATA_PATTERN == "DGEN_WALKING1" || DATA_PATTERN == "DGEN_WALKING0" || DATA_PATTERN == "DGEN_ALL"))  begin : WALKING_ONE_64_PATTERN
   always @ (posedge clk_i) begin
   if( (fifo_rdy_i ) || cmd_startC )
          if (cmd_startC ) begin
             if (sel_w1gen_logic) begin
                  if (data_mode_i == 4'b0101)
                       w1data <= #TCQ Data_Gen(0);
                  else
                       w1data <= #TCQ Data_GenW0(0);
             end
          end
   else if ( MEM_BURST_LEN == 8 && fifo_rdy_i )  begin
         if ( nCK_PER_CLK == 2)
              begin
              w1data[4*NUM_DQ_PINS - 1:3*NUM_DQ_PINS] <= #TCQ {w1data[4*NUM_DQ_PINS - 5:3*NUM_DQ_PINS  ],w1data[4*NUM_DQ_PINS - 1:4*NUM_DQ_PINS - 4]};
              w1data[3*NUM_DQ_PINS - 1:2*NUM_DQ_PINS] <= #TCQ {w1data[3*NUM_DQ_PINS - 5:2*NUM_DQ_PINS  ],w1data[3*NUM_DQ_PINS - 1:3*NUM_DQ_PINS - 4]};
              w1data[2*NUM_DQ_PINS - 1:1*NUM_DQ_PINS] <= #TCQ {w1data[2*NUM_DQ_PINS - 5:1*NUM_DQ_PINS  ],w1data[2*NUM_DQ_PINS - 1:2*NUM_DQ_PINS - 4]};
              w1data[1*NUM_DQ_PINS - 1:0*NUM_DQ_PINS] <= #TCQ {w1data[1*NUM_DQ_PINS - 5:0*NUM_DQ_PINS  ],w1data[1*NUM_DQ_PINS - 1:1*NUM_DQ_PINS - 4]};
              end
          else begin
              w1data[8*NUM_DQ_PINS - 1:7*NUM_DQ_PINS] <= #TCQ {w1data[8*NUM_DQ_PINS - 9:7*NUM_DQ_PINS  ],w1data[8*NUM_DQ_PINS - 1:8*NUM_DQ_PINS - 8]};
              w1data[7*NUM_DQ_PINS - 1:6*NUM_DQ_PINS] <= #TCQ {w1data[7*NUM_DQ_PINS - 9:6*NUM_DQ_PINS  ],w1data[7*NUM_DQ_PINS - 1:7*NUM_DQ_PINS - 8]};
              w1data[6*NUM_DQ_PINS - 1:5*NUM_DQ_PINS] <= #TCQ {w1data[6*NUM_DQ_PINS - 9:5*NUM_DQ_PINS  ],w1data[6*NUM_DQ_PINS - 1:6*NUM_DQ_PINS - 8]};
              w1data[5*NUM_DQ_PINS - 1:4*NUM_DQ_PINS] <= #TCQ {w1data[5*NUM_DQ_PINS - 9:4*NUM_DQ_PINS  ],w1data[5*NUM_DQ_PINS - 1:5*NUM_DQ_PINS - 8]};
              w1data[4*NUM_DQ_PINS - 1:3*NUM_DQ_PINS] <= #TCQ {w1data[4*NUM_DQ_PINS - 9:3*NUM_DQ_PINS  ],w1data[4*NUM_DQ_PINS - 1:4*NUM_DQ_PINS - 8]};
              w1data[3*NUM_DQ_PINS - 1:2*NUM_DQ_PINS] <= #TCQ {w1data[3*NUM_DQ_PINS - 9:2*NUM_DQ_PINS  ],w1data[3*NUM_DQ_PINS - 1:3*NUM_DQ_PINS - 8]};
              w1data[2*NUM_DQ_PINS - 1:1*NUM_DQ_PINS] <= #TCQ {w1data[2*NUM_DQ_PINS - 9:1*NUM_DQ_PINS  ],w1data[2*NUM_DQ_PINS - 1:2*NUM_DQ_PINS - 8]};
              w1data[1*NUM_DQ_PINS - 1:0*NUM_DQ_PINS] <= #TCQ {w1data[1*NUM_DQ_PINS - 9:0*NUM_DQ_PINS  ],w1data[1*NUM_DQ_PINS - 1:1*NUM_DQ_PINS - 8]};
              end
           end
      end
    end
  endgenerate
// HAMMER_PATTERN_MINUS: generate walking HAMMER  data pattern except 1 bit for the whole burst. The incoming addr_i[5:2] determine
// the position of the pin driving oppsite polarity
//  addr_i[6:2] = 5'h0f ; 32 bit data port
//                 => the rsing data pattern will be    32'b11111111_11111111_01111111_11111111
//                 => the falling data pattern will be  32'b00000000_00000000_00000000_00000000
// Only generate NUM_DQ_PINS width of hdata and will do concatenation in above level.
always @ (posedge clk_i) begin
//for (j=0; j <= 1; j= j+1) //
//  for (i= 0; i <= 31; i= i+1) //begin: hammer_data
  for (i= 0; i <= 2*NUM_DQ_PINS - 1; i= i+1) //begin: hammer_data
      if ( i >= NUM_DQ_PINS )
        if (SEL_VICTIM_LINE == NUM_DQ_PINS)
             hdata[i] <= 1'b0;
        else if (
             ((i == SEL_VICTIM_LINE-1) ||
              (i-NUM_DQ_PINS) == SEL_VICTIM_LINE ))//||
//              (i-(NUM_DQ_PINS*2)) == SEL_VICTIM_LINE ||
//              (i-(NUM_DQ_PINS*3)) == SEL_VICTIM_LINE))
              hdata[i] <= 1'b1;
         else
              hdata[i] <= 1'b0;
      else
              hdata[i] <= 1'b1;
end
generate
if (nCK_PER_CLK == 2)  begin : HAMMER_2
    assign hammer_data = {2{hdata[2*NUM_DQ_PINS - 1:0]}};
end
endgenerate
generate
if (nCK_PER_CLK == 4)  begin : HAMMER_4
    assign hammer_data = {4{hdata[2*NUM_DQ_PINS - 1:0]}};
end
endgenerate
//nCK_PER_CLK  : 1,2,4
// ADDRESS_PATTERN: use the address as the 1st data pattern for the whole burst. For example
// Dataport 32 bit width with starting addr_i  = 32'h12345678,  burst length 8
//                 => the 1st data pattern :     32'h12345680
//                 => the 2nd data pattern :     32'h12345688
//                 => the 3rd data pattern :     32'h12345690
//                 => the 4th data pattern :     32'h12345698
generate
if (DATA_PATTERN == "DGEN_ADDR"  || DATA_PATTERN == "DGEN_ALL")  begin : ADDRESS_PATTERN
always @ (posedge clk_i)
begin
  if (cmd_startD)
         acounts[35:0]  <= #TCQ {4'b0000,addr_i} ;
  else if (user_burst_cnt_larger_1_r && data_rdy_i  ) begin
         if (nCK_PER_CLK == 2)
            if (FAMILY == "VIRTEX6")
                 acounts <= #TCQ acounts + 4;
            else  begin  // "SPARTAN6"
               if (DWIDTH == 32)
                   acounts <= #TCQ acounts + 4;
               else if (DWIDTH == 64)
                   acounts <= #TCQ acounts + 8;
               else if (DWIDTH == 64)
                   acounts <= #TCQ acounts + 16;
               end
         else
             acounts <= #TCQ acounts + 8;
         end
  else
         acounts <= #TCQ acounts;
end
assign    adata_tmp = {USER_BUS_DWIDTH/32{acounts[31:0]}};
end
endgenerate
// PRBS_PATTERN: use the address as the PRBS seed data pattern for the whole burst. For example
// Dataport 32 bit width with starting addr_i = 30'h12345678, user burst length 4
generate
// When doing eye_test, traffic gen only does write and want to
// keep the prbs random and address is fixed at a location.
if (EYE_TEST == "TRUE")  begin : d_clk_en1
assign data_clk_en = 1'b1;//fifo_rdy_i && data_rdy_i && user_burst_cnt > 6'd1;
end
endgenerate
always @ (posedge clk_i)
begin
  if (user_burst_cnt > 6'd1  || cmd_startE)
     user_burst_cnt_larger_1_r <= 1'b1;
  else
     user_burst_cnt_larger_1_r <= 1'b0;
end
generate
if (EYE_TEST == "FALSE" || EYE_TEST == "READ_EYE")  begin : d_clk_en2
assign data_clk_en = fifo_rdy_i && data_rdy_i && user_burst_cnt_larger_1_r > 6'd0;
assign data_clk_en2 = fifo_rdy_i && data_rdy_i && user_burst_cnt_larger_1_r > 6'd0;
end
endgenerate
generate
if (DATA_PATTERN == "DGEN_PRBS"  || DATA_PATTERN == "DGEN_ALL")  begin : PSUEDO_PRBS_PATTERN
//   PRBS DATA GENERATION
// xor all the tap positions before feedback to 1st stage.
always @ (posedge clk_i)
   m_addr_r <= m_addr_i;
data_prbs_gen #
  (
    .PRBS_WIDTH (32),
    .SEED_WIDTH (32),
    .EYE_TEST   (EYE_TEST)
   )
   data_prbs_gen
  (
   .clk_i            (clk_i),
   .rst_i            (rst_i),
   .clk_en           (data_clk_en),
//   .prbs_fseed_i     (prbs_fseed_i),
   .prbs_seed_init   (cmd_startE),
   .prbs_seed_i      (m_addr_i[31:0]),
   .prbs_o           (mcb_prbs_data)
  );
end
endgenerate
wire [31:0] ReSeedcounter_o;
assign prbs_seed = START_ADDR[BL_WIDTH+1:2];//addr_i[13:2];
always @ (posedge clk_i)
begin
if (rst_i)
    prbs_seeded <= 1'b0;
else if (cmd_startE)
   if  ( data_mode_i == 4'b0111)
    prbs_seeded <= 1'b1;
   else
    prbs_seeded <= 1'b0;
end
//localparam TAPS_VALUE = 12'b100000101001;//10'b1001000000;  256
//localparam TAPS_VALUE = 10'b1000000100;//10'b1001000000;  64
//localparam TAPS_VALUE = 9'b100001000;//9'b1001000000;  64
//localparam TAPS_VALUE = 8'b10001110;//10'b1001000000;  repeated in 16 cmd writes
  assign prbs_shift_value0  = prbs_shift_value[3:0];
  assign prbs_shift_value1  = prbs_shift_value[7:4];
  assign prbs_shift_value2  = prbs_shift_value[11:8];
  assign prbs_shift_value3  = prbs_shift_value[15:12];
  assign prbs_shift_value4  = prbs_shift_value[19:16];
  assign prbs_shift_value5  = prbs_shift_value[23:20];
  assign prbs_shift_value6  = prbs_shift_value[27:24];
  assign prbs_shift_value7  = prbs_shift_value[31:28];
  assign prbs_shift_value8  = prbs_shift_value[35:32];
  assign prbs_shift_value9  = prbs_shift_value[39:36];
  assign prbs_shift_value10 = prbs_shift_value[43:40];
  assign prbs_shift_value11 = prbs_shift_value[47:44];
  assign prbs_shift_value12 = prbs_shift_value[51:48];
  assign prbs_shift_value13 = prbs_shift_value[55:52];
  assign prbs_shift_value14 = prbs_shift_value[59:56];
  assign prbs_shift_value15 = prbs_shift_value[63:60];
  generate
  if (nCK_PER_CLK == 4 )  begin
  assign prbs_shift_value16 = prbs_shift_value[67:64];
  assign prbs_shift_value17 = prbs_shift_value[71:68];
  assign prbs_shift_value18 = prbs_shift_value[75:72];
  assign prbs_shift_value19 = prbs_shift_value[79:76];
  assign prbs_shift_value20 = prbs_shift_value[83:80];
  assign prbs_shift_value21 = prbs_shift_value[87:84];
  assign prbs_shift_value22 = prbs_shift_value[91:88];
  assign prbs_shift_value23 = prbs_shift_value[95:92];
  assign prbs_shift_value24 = prbs_shift_value[99:96];
  assign prbs_shift_value25 = prbs_shift_value[103:100];
  assign prbs_shift_value26 = prbs_shift_value[107:104];
  assign prbs_shift_value27 = prbs_shift_value[111:108];
  assign prbs_shift_value28 = prbs_shift_value[115:112];
  assign prbs_shift_value29 = prbs_shift_value[119:116];
  assign prbs_shift_value30 = prbs_shift_value[123:120];
  assign prbs_shift_value31 = prbs_shift_value[127:124];
  end
   endgenerate
genvar l;
generate
for (l = 0; l < nCK_PER_CLK*8; l = l + 1) begin: prbs_modules
tg_prbs_gen #
  (
    .PRBS_WIDTH    (PRBS_WIDTH),
    .START_ADDR    (START_ADDR),
    .PRBS_OFFSET   (l*4),
    .TAPS          (TAPS_VALUE)
   )
   u_data_prbs_gen
  (
   .clk_i            (clk_i),
   .rst              (rst_i),
   .clk_en           (data_clk_en),
//   .prbs_seed_init   (prbs_seed_init),
   .prbs_seed_i      (prbs_seed[PRBS_WIDTH-1:0]),//(m_addr_i[31:0]),
   .initialize_done  (),
   .prbs_shift_value (prbs_shift_value[(l+1)*4-1:(l)*4]),
   // ADDED, richc 020810: declare ports to avoid warnings
   .prbs_o          (),
   .ReSeedcounter_o (ReSeedcounter[(l+1)*32-1:(l)*32])
  );
end endgenerate
// need a mux circuit to mux out prbs_ox to full_prbs bus.
always @ (posedge clk_i)
begin
if (rst_i)
  prbs_mux_counter <= 'b0;
else if (data_clk_en )
  prbs_mux_counter <= prbs_mux_counter + 1'b1;
end
always @ (posedge clk_i)
begin
if (rst_i)
    mode_has_loaded <= 1'b0;
else if  ( mode_load_r2  )
    mode_has_loaded <= 1'b1;
end
// assert force_load whenever prbs generator has cycle through.
always @ (posedge clk_i)
begin
   data_clk_en2_r <= data_clk_en2;
   if (ReSeedcounter[31:0] == 0 && data_clk_en2_r && ~data_clk_en2)
         force_load <= 1'b1;
   else
         force_load <= 1'b0;
end
always @ (posedge clk_i)
begin
if (rst_i)
         prbs_comb_data_load <= 1'b0;
else if (prbs_mux_counter == 63 //&& DMODE == "WRITE"  ||
      )
         prbs_comb_data_load <= 1'b1;
else if (data_clk_en2)
         prbs_comb_data_load <= 1'b0;
end
// 16 PRBS generators are running in parallel. Each one is four cycles earlier to its next one.
always @ (posedge clk_i) begin
//if ((mode_load_i & ~mode_has_loaded )|| (prbs_comb_data_load && data_clk_en2))
if ((mode_load_i & ~mode_has_loaded )|| (prbs_comb_data_load && data_clk_en2 && ReSeedcounter[5:0] == 0) || force_load)
    prbs_comb_data <= {
                       prbs_shift_value31,prbs_shift_value30,prbs_shift_value29,prbs_shift_value28,
                       prbs_shift_value27,prbs_shift_value26,prbs_shift_value25,prbs_shift_value24,
                       prbs_shift_value23 ,prbs_shift_value22,prbs_shift_value21,prbs_shift_value20,
                       prbs_shift_value19 ,prbs_shift_value18,prbs_shift_value17,prbs_shift_value16,
                       prbs_shift_value15,prbs_shift_value14,prbs_shift_value13,prbs_shift_value12,
                       prbs_shift_value11,prbs_shift_value10,prbs_shift_value9,prbs_shift_value8,
                       prbs_shift_value7 ,prbs_shift_value6,prbs_shift_value5,prbs_shift_value4,
                       prbs_shift_value3 ,prbs_shift_value2,prbs_shift_value1,prbs_shift_value0
                  };
 end
always @ (posedge clk_i) begin
   mode_load_r1 <= mode_load_i;
   mode_load_r2 <= mode_load_r1;
end
always @ (posedge clk_i) begin
    if ((mode_load_r1 && ~mode_has_loaded) || (ReSeedcounter[31:0] == 0 && ~data_clk_en2 && nCK_PER_CLK == 4) ||
        (ReSeedcounter[31:0] == 0 && nCK_PER_CLK == 2 && data_clk_en2))
        // needed to preload the previous value in READ mode.
       if (nCK_PER_CLK == 4)
            prbs_mux_data <=  #TCQ {prbs_shift_value1,prbs_shift_value0};
       else
            prbs_mux_data <=  #TCQ {prbs_shift_value0};
    else if (data_clk_en2 ) begin
        case (prbs_mux_counter[3:0])
                                            //           8
        0 :  if (ReSeedcounter[31:0] == 0)
                    prbs_mux_data <=  #TCQ {prbs_shift_value0};
             else
                    prbs_mux_data <= #TCQ prbs_comb_data[nCK_PER_CLK*2*1 - 1:nCK_PER_CLK*2*0];
        1 :  prbs_mux_data <= #TCQ prbs_comb_data[nCK_PER_CLK*2*2 - 1:nCK_PER_CLK*2*1 ];
        2 :  prbs_mux_data <= #TCQ prbs_comb_data[nCK_PER_CLK*2*3 - 1:nCK_PER_CLK*2*2 ];//[23:16];
        3 :  prbs_mux_data <= #TCQ prbs_comb_data[nCK_PER_CLK*2*4 - 1:nCK_PER_CLK*2*3 ];//[31:24];
        4 :  prbs_mux_data <= #TCQ prbs_comb_data[nCK_PER_CLK*2*5 - 1:nCK_PER_CLK*2*4 ];//[39:32];
        5 :  prbs_mux_data <= #TCQ prbs_comb_data[nCK_PER_CLK*2*6 - 1:nCK_PER_CLK*2*5 ];//[47:40];
        6 :  prbs_mux_data <= #TCQ prbs_comb_data[nCK_PER_CLK*2*7 - 1:nCK_PER_CLK*2*6 ];//[55:48];
        7 :  prbs_mux_data <= #TCQ prbs_comb_data[nCK_PER_CLK*2*8 - 1:nCK_PER_CLK*2*7 ];//[63:56];
        8 :  prbs_mux_data <= #TCQ prbs_comb_data[nCK_PER_CLK*2*9 - 1:nCK_PER_CLK*2*8 ];//[71:64];
        9 :  prbs_mux_data <= #TCQ prbs_comb_data[nCK_PER_CLK*2*10 - 1:nCK_PER_CLK*2*9 ];//[79:72];
        10: prbs_mux_data <= #TCQ  prbs_comb_data[nCK_PER_CLK*2*11 - 1:nCK_PER_CLK*2*10];//[87:80];
        11: prbs_mux_data <= #TCQ  prbs_comb_data[nCK_PER_CLK*2*12 - 1:nCK_PER_CLK*2*11];//[95:88];
        12: prbs_mux_data <= #TCQ  prbs_comb_data[nCK_PER_CLK*2*13 - 1:nCK_PER_CLK*2*12];//[103:96];
        13: prbs_mux_data <= #TCQ  prbs_comb_data[nCK_PER_CLK*2*14 - 1:nCK_PER_CLK*2*13];//[111:104];
        14: prbs_mux_data <= #TCQ  prbs_comb_data[nCK_PER_CLK*2*15 - 1:nCK_PER_CLK*2*14];//[119:112];
        15: prbs_mux_data <= #TCQ  prbs_comb_data[nCK_PER_CLK*2*16 - 1:nCK_PER_CLK*2*15];//[127:120];
         default: prbs_mux_data <= #TCQ prbs_comb_data[nCK_PER_CLK*2 - 1:nCK_PER_CLK*2*0 ];//[7:0];
        endcase
    end
end
assign prbsdata_rising_0  = {NUM_DQ_PINS{prbs_mux_data[3]}};
assign prbsdata_falling_0 = {NUM_DQ_PINS{prbs_mux_data[2]}};
assign prbsdata_rising_1  = {NUM_DQ_PINS{prbs_mux_data[1]}};
assign prbsdata_falling_1 = {NUM_DQ_PINS{prbs_mux_data[0]}};
assign prbsdata_rising_2  = {NUM_DQ_PINS{prbs_mux_data[7]}};
assign prbsdata_falling_2 = {NUM_DQ_PINS{prbs_mux_data[6]}};
assign prbsdata_rising_3  = {NUM_DQ_PINS{prbs_mux_data[5]}};
assign prbsdata_falling_3 = {NUM_DQ_PINS{prbs_mux_data[4]}};
endmodule