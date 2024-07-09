module upfront IR
//       register)
//       Note: The source of IR register Din depends on different
//         situations described in detailed fetching sheme
//       back since we dont know the instruction to be fetched is 32bits or
//       16bits length (until after it read-back and decoded by mini-decoder).
//       When the new fetch is crossing lane-boundry from current lane
//       to next lane, and if the current lane read-out value is holding up.
//       Then new 32bits instruction to be fetched can be concatated by
//       "current holding-up lane's upper 16bits" and "next lane's lower 16bits".
//       To make it in one cycle, we push the "current holding-up lane's
//       upper 16bits" into leftover buffer (16bits) and only issue one ifetch
//       request to memory system, and when it responded with rdata-back,
//       directly concatate the upper 16bits rdata-back with leftover buffer
//       to become the full 32bits instruction.
// The new ifetch request could encounter several cases:
//     address (current PC):
//        holding up, then
//        holding up, then
//        holding up, then
//                    only loaded when instr is 32bits-long)
//        not holding up, then
//               current holding rdata
//                    only loaded when instr is 32bits-long)
//     address (current PC):
//        holding up or not, then
//               current holding rdata
//                    only loaded when instr is 32bits-long)
// ===========================================================================
  `ifdef E203_HAS_ITCM //{
  wire ifu_req_pc2itcm = (ifu_req_pc[`E203_ITCM_BASE_REGION] == itcm_region_indic[`E203_ITCM_BASE_REGION]);
  `endif//}
  `ifdef E203_HAS_MEM_ITF //{
  wire ifu_req_pc2mem = 1'b1
            `ifdef E203_HAS_ITCM //{
              & ~(ifu_req_pc2itcm)
            `endif//}
              ;
  `endif//}
  // The current accessing PC is crossing the lane boundry
  wire ifu_req_lane_cross = 1'b0
                    `ifdef E203_HAS_ITCM //{
                         | (
                            ifu_req_pc2itcm
                         `ifdef E203_ITCM_DATA_WIDTH_IS_32 //{
                            & (ifu_req_pc[1] == 1'b1)
                         `endif//}
                         `ifdef E203_ITCM_DATA_WIDTH_IS_64 //{
                            & (ifu_req_pc[2:1] == 2'b11)
                         `endif//}
                           )
                    `endif//}
                    `ifdef E203_HAS_MEM_ITF //{
                         | (
                            ifu_req_pc2mem
                         `ifdef E203_SYSMEM_DATA_WIDTH_IS_32 //{
                            & (ifu_req_pc[1] == 1'b1)
                         `endif//}
                         `ifdef E203_SYSMEM_DATA_WIDTH_IS_64 //{
                            & (ifu_req_pc[2:1] == 2'b11)
                         `endif//}
                           )
                    `endif//}
                    ;
  // The current accessing PC is begining of the lane boundry
  wire ifu_req_lane_begin = 1'b0
                    `ifdef E203_HAS_ITCM //{
                         | (
                            ifu_req_pc2itcm
                         `ifdef E203_ITCM_DATA_WIDTH_IS_32 //{
                            & (ifu_req_pc[1] == 1'b0)
                         `endif//}
                         `ifdef E203_ITCM_DATA_WIDTH_IS_64 //{
                            & (ifu_req_pc[2:1] == 2'b00)
                         `endif//}
                           )
                    `endif//}
                    `ifdef E203_HAS_MEM_ITF //{
                         | (
                            ifu_req_pc2mem
                         `ifdef E203_SYSMEM_DATA_WIDTH_IS_32 //{
                            & (ifu_req_pc[1] == 1'b0)
                         `endif//}
                         `ifdef E203_SYSMEM_DATA_WIDTH_IS_64 //{
                            & (ifu_req_pc[2:1] == 2'b00)
                         `endif//}
                           )
                    `endif//}
                    ;
  // The scheme to check if the current accessing PC is same as last accessed ICB address
  //   is as below:
  //         reqeust, and it is crossing the boundry as unalgned (1st 16bits and 2nd 16bits
  //         is crossing the boundry)
  //            Then:
  //                        the same address as last time. Otherwise not.
  //            Then:
  //          treated as this case
  wire req_lane_cross_r;
  wire ifu_req_lane_same = ifu_req_seq & (ifu_req_lane_begin ? req_lane_cross_r : 1'b1);
  // The current accessing PC is same as last accessed ICB address
  wire ifu_req_lane_holdup = 1'b0
            `ifdef E203_HAS_ITCM //{
            | (ifu_req_pc2itcm & ifu2itcm_holdup & (~itcm_nohold))
            `endif//}
            ;
  wire ifu_req_hsked = ifu_req_valid & ifu_req_ready;
  wire i_ifu_rsp_hsked = i_ifu_rsp_valid & i_ifu_rsp_ready;
  wire ifu_icb_cmd_valid;
  wire ifu_icb_cmd_ready;
  wire ifu_icb_cmd_hsked = ifu_icb_cmd_valid & ifu_icb_cmd_ready;
  wire ifu_icb_rsp_valid;
  wire ifu_icb_rsp_ready;
  wire ifu_icb_rsp_hsked = ifu_icb_rsp_valid & ifu_icb_rsp_ready;
  // Implement the state machine for the ifetch req interface
  wire req_need_2uop_r;
  wire req_need_0uop_r;
  localparam ICB_STATE_WIDTH  = 2;
  // State 0: The idle state, means there is no any oustanding ifetch request
  localparam ICB_STATE_IDLE = 2'd0;
  // State 1: Issued first request and wait response
  localparam ICB_STATE_1ST  = 2'd1;
  // State 2: Wait to issue second request
  localparam ICB_STATE_WAIT2ND  = 2'd2;
  // State 3: Issued second request and wait response
  localparam ICB_STATE_2ND  = 2'd3;
  wire [ICB_STATE_WIDTH-1:0] icb_state_nxt;
  wire [ICB_STATE_WIDTH-1:0] icb_state_r;
  wire icb_state_ena;
  wire [ICB_STATE_WIDTH-1:0] state_idle_nxt   ;
  wire [ICB_STATE_WIDTH-1:0] state_1st_nxt    ;
  wire [ICB_STATE_WIDTH-1:0] state_wait2nd_nxt;
  wire [ICB_STATE_WIDTH-1:0] state_2nd_nxt    ;
  wire state_idle_exit_ena     ;
  wire state_1st_exit_ena      ;
  wire state_wait2nd_exit_ena  ;
  wire state_2nd_exit_ena      ;
  // Define some common signals and reused later to save gatecounts
  wire icb_sta_is_idle    = (icb_state_r == ICB_STATE_IDLE   );
  wire icb_sta_is_1st     = (icb_state_r == ICB_STATE_1ST    );
  wire icb_sta_is_wait2nd = (icb_state_r == ICB_STATE_WAIT2ND);
  wire icb_sta_is_2nd     = (icb_state_r == ICB_STATE_2ND    );
          // If a new request come, next state is ICB_STATE_1ST
  assign state_idle_exit_ena = icb_sta_is_idle & ifu_req_hsked;
  assign state_idle_nxt      = ICB_STATE_1ST;
          // If a response come, exit this state
  wire ifu_icb_rsp2leftover;
  assign state_1st_exit_ena  = icb_sta_is_1st & (
                ifu_icb_rsp2leftover ? ifu_icb_rsp_hsked : i_ifu_rsp_hsked);
  assign state_1st_nxt     =
                (
              // If it need two requests but the ifetch request is not ready to be
              //   accepted, then next state is ICB_STATE_WAIT2ND
                  (req_need_2uop_r & (~ifu_icb_cmd_ready)) ?  ICB_STATE_WAIT2ND
              // If it need two requests and the ifetch request is ready to be
              //   accepted, then next state is ICB_STATE_2ND
                  : (req_need_2uop_r & (ifu_icb_cmd_ready)) ?  ICB_STATE_2ND
              // If it need zero or one requests and new req handshaked, then
              //   next state is ICB_STATE_1ST
              // If it need zero or one requests and no new req handshaked, then
              //   next state is ICB_STATE_IDLE
                  :  ifu_req_hsked  ?  ICB_STATE_1ST
                                    : ICB_STATE_IDLE
                ) ;
              // If the ICB CMD is ready, then next state is ICB_STATE_2ND
  assign state_wait2nd_exit_ena = icb_sta_is_wait2nd &  ifu_icb_cmd_ready;
  assign state_wait2nd_nxt      = ICB_STATE_2ND;
          // If a response come, exit this state
  assign state_2nd_exit_ena     =  icb_sta_is_2nd &  i_ifu_rsp_hsked;
  assign state_2nd_nxt          =
                (
              // If meanwhile new req handshaked, then next state is ICB_STATE_1ST
                  ifu_req_hsked  ?  ICB_STATE_1ST :
                      // otherwise, back to IDLE
                      ICB_STATE_IDLE
                );
  // The state will only toggle when each state is meeting the condition to exit:
  assign icb_state_ena =
            state_idle_exit_ena | state_1st_exit_ena | state_wait2nd_exit_ena | state_2nd_exit_ena;
  // The next-state is onehot mux to select different entries
  assign icb_state_nxt =
              ({ICB_STATE_WIDTH{state_idle_exit_ena   }} & state_idle_nxt   )
            | ({ICB_STATE_WIDTH{state_1st_exit_ena    }} & state_1st_nxt    )
            | ({ICB_STATE_WIDTH{state_wait2nd_exit_ena}} & state_wait2nd_nxt)
            | ({ICB_STATE_WIDTH{state_2nd_exit_ena    }} & state_2nd_nxt    )
              ;
  sirv_gnrl_dfflr #(ICB_STATE_WIDTH) icb_state_dfflr (icb_state_ena, icb_state_nxt, icb_state_r, clk, rst_n);
  // Save the same_cross_holdup flags for this ifetch request to be used
  wire req_same_cross_holdup_r;
  wire req_same_cross_holdup = ifu_req_lane_same & ifu_req_lane_cross & ifu_req_lane_holdup;
  wire req_need_2uop         = (  ifu_req_lane_same  & ifu_req_lane_cross & (~ifu_req_lane_holdup))
                             | ((~ifu_req_lane_same) & ifu_req_lane_cross);
  wire req_need_0uop         = ifu_req_lane_same & (~ifu_req_lane_cross) & ifu_req_lane_holdup;
  sirv_gnrl_dfflr #(1) req_same_cross_holdup_dfflr (ifu_req_hsked, req_same_cross_holdup, req_same_cross_holdup_r, clk, rst_n);
  sirv_gnrl_dfflr #(1) req_need_2uop_dfflr         (ifu_req_hsked, req_need_2uop,         req_need_2uop_r,         clk, rst_n);
  sirv_gnrl_dfflr #(1) req_need_0uop_dfflr         (ifu_req_hsked, req_need_0uop,         req_need_0uop_r,         clk, rst_n);
  sirv_gnrl_dfflr #(1) req_lane_cross_dfflr        (ifu_req_hsked, ifu_req_lane_cross,    req_lane_cross_r,        clk, rst_n);
  // Save the indicate flags for this ICB transaction to be used
  wire [`E203_PC_SIZE-1:0] ifu_icb_cmd_addr;
  `ifdef E203_HAS_ITCM //{
  wire ifu_icb_cmd2itcm;
  wire icb_cmd2itcm_r;
  sirv_gnrl_dfflr #(1) icb2itcm_dfflr(ifu_icb_cmd_hsked, ifu_icb_cmd2itcm, icb_cmd2itcm_r, clk, rst_n);
  `endif//}
  `ifdef E203_HAS_MEM_ITF //{
  wire ifu_icb_cmd2biu ;
  wire icb_cmd2biu_r;
  sirv_gnrl_dfflr #(1) icb2mem_dfflr (ifu_icb_cmd_hsked, ifu_icb_cmd2biu , icb_cmd2biu_r,  clk, rst_n);
  `endif//}
  wire icb_cmd_addr_2_1_ena = ifu_icb_cmd_hsked | ifu_req_hsked;
  wire [1:0] icb_cmd_addr_2_1_r;
  sirv_gnrl_dffl #(2)icb_addr_2_1_dffl(icb_cmd_addr_2_1_ena, ifu_icb_cmd_addr[2:1], icb_cmd_addr_2_1_r, clk);
  // Implement Leftover Buffer
  wire leftover_ena;
  wire [15:0] leftover_nxt;
  wire [15:0] leftover_r;
  wire leftover_err_nxt;
  wire leftover_err_r;
  // The leftover buffer will be loaded into two cases
  // Please see "The itfctrl scheme introduction" for more details
  wire holdup2leftover_sel = req_same_cross_holdup;
  wire holdup2leftover_ena = ifu_req_hsked & holdup2leftover_sel;
  wire [15:0]  put2leftover_data = 16'b0
  //wire [15:0]  holdup2leftover_data = 16'b0
                     `ifdef E203_HAS_ITCM //{
                      | ({16{icb_cmd2itcm_r}} & ifu2itcm_icb_rsp_rdata[`E203_ITCM_DATA_WIDTH-1:`E203_ITCM_DATA_WIDTH-16])
                     `endif//}
                     `ifdef E203_HAS_MEM_ITF //{
                      | ({16{icb_cmd2biu_r}} & ifu2biu_icb_rsp_rdata [`E203_SYSMEM_DATA_WIDTH-1:`E203_SYSMEM_DATA_WIDTH-16])
                     `endif//}
                      ;
  wire uop1st2leftover_sel = ifu_icb_rsp2leftover;
  wire uop1st2leftover_ena = ifu_icb_rsp_hsked & uop1st2leftover_sel;
  //wire [15:0]  uop1st2leftover_data = 16'b0
  //                   `ifdef E203_HAS_ITCM //{
  //                    | ({16{icb_cmd2itcm_r}} & ifu2itcm_icb_rsp_rdata[`E203_ITCM_DATA_WIDTH-1:`E203_ITCM_DATA_WIDTH-16])
  //                   `endif//}
  //                   `ifdef E203_HAS_MEM_ITF //{
  //                    | ({16{icb_cmd2biu_r}} & ifu2biu_icb_rsp_rdata [`E203_SYSMEM_DATA_WIDTH-1:`E203_SYSMEM_DATA_WIDTH-16])
  //                   `endif//}
  //                    ;
  wire uop1st2leftover_err = 1'b0
                     `ifdef E203_HAS_ITCM //{
                      | (icb_cmd2itcm_r & ifu2itcm_icb_rsp_err)
                     `endif//}
                     `ifdef E203_HAS_MEM_ITF //{
                      | (icb_cmd2biu_r & ifu2biu_icb_rsp_err)
                     `endif//}
                      ;
  assign leftover_ena = holdup2leftover_ena
                      | uop1st2leftover_ena;
  assign leftover_nxt =
                      //  ({16{holdup2leftover_sel}} & holdup2leftover_data[15:0])
                      //| ({16{uop1st2leftover_sel}} & uop1st2leftover_data[15:0])
                        put2leftover_data[15:0]
                      ;
  assign leftover_err_nxt =
                        (holdup2leftover_sel & 1'b0)
                      | (uop1st2leftover_sel & uop1st2leftover_err)
                      ;
  sirv_gnrl_dffl #(16) leftover_dffl     (leftover_ena, leftover_nxt,     leftover_r,     clk);
  sirv_gnrl_dfflr #(1) leftover_err_dfflr(leftover_ena, leftover_err_nxt, leftover_err_r, clk, rst_n);
  // Generate the ifetch response channel
  // The ifetch response instr will have 2 sources
  // Please see "The itfctrl scheme introduction" for more details
  wire rsp_instr_sel_leftover = (   icb_sta_is_1st
                                  & req_same_cross_holdup_r
                                )
                              | icb_sta_is_2nd;
  wire rsp_instr_sel_icb_rsp = ~rsp_instr_sel_leftover;
  wire [16-1:0] ifu_icb_rsp_rdata_lsb16 = 16'b0
                     `ifdef E203_HAS_ITCM //{
                       | ({16{icb_cmd2itcm_r}} & ifu2itcm_icb_rsp_rdata[15:0])
                     `endif//}
                     `ifdef E203_HAS_MEM_ITF //{
                       | ({16{icb_cmd2biu_r}}  & ifu2biu_icb_rsp_rdata[15:0])
                     `endif//}
                        ;
  // The fetched instruction from ICB rdata bus need to be aligned by PC LSB bits
  `ifdef E203_HAS_ITCM //{
  wire[31:0] ifu2itcm_icb_rsp_instr =
     `ifdef E203_ITCM_DATA_WIDTH_IS_32 //{
                    ifu2itcm_icb_rsp_rdata;
     `else//}{
        `ifdef E203_ITCM_DATA_WIDTH_IS_64
                    ({32{icb_cmd_addr_2_1_r == 2'b00}} & ifu2itcm_icb_rsp_rdata[31: 0])
                  | ({32{icb_cmd_addr_2_1_r == 2'b01}} & ifu2itcm_icb_rsp_rdata[47:16])
                  | ({32{icb_cmd_addr_2_1_r == 2'b10}} & ifu2itcm_icb_rsp_rdata[63:32])
                     ;
        `else//}{
            !!! ERROR: There must be something wrong, we dont support the width
            other than 32bits and 64bits, leave this message to catch this error by
            compilation message.
        `endif//}
     `endif//}
  `endif//}
  `ifdef E203_HAS_MEM_ITF //{
  wire[31:0] ifu2biu_icb_rsp_instr =
     `ifdef E203_SYSMEM_DATA_WIDTH_IS_32 //{
                    ifu2biu_icb_rsp_rdata;
     `else//}{
        `ifdef E203_SYSMEM_DATA_WIDTH_IS_64//{
                    ({32{icb_cmd_addr_2_1_r == 2'b00}} & ifu2biu_icb_rsp_rdata[31: 0])
                    ({32{icb_cmd_addr_2_1_r == 2'b01}} & ifu2biu_icb_rsp_rdata[47:16])
                    ({32{icb_cmd_addr_2_1_r == 2'b10}} & ifu2biu_icb_rsp_rdata[63:32])
                     ;
        `else//}{
            !!! ERROR: There must be something wrong, we dont support the width
            other than 32bits and 64bits, leave this message to catch this error by
            compilation message.
        `endif//}
     `endif//}
  `endif//}
  wire [32-1:0] ifu_icb_rsp_instr = 32'b0
                     `ifdef E203_HAS_ITCM //{
                       | ({32{icb_cmd2itcm_r}} & ifu2itcm_icb_rsp_instr)
                     `endif//}
                     `ifdef E203_HAS_MEM_ITF //{
                       | ({32{icb_cmd2biu_r}}  & ifu2biu_icb_rsp_instr)
                     `endif//}
                        ;
  wire ifu_icb_rsp_err = 1'b0
                     `ifdef E203_HAS_ITCM //{
                       | (icb_cmd2itcm_r & ifu2itcm_icb_rsp_err)
                     `endif//}
                     `ifdef E203_HAS_MEM_ITF //{
                       | (icb_cmd2biu_r  & ifu2biu_icb_rsp_err)
                     `endif//}
                        ;
  assign i_ifu_rsp_instr =
              ({32{rsp_instr_sel_leftover}} & {ifu_icb_rsp_rdata_lsb16, leftover_r})
            | ({32{rsp_instr_sel_icb_rsp }} & ifu_icb_rsp_instr);
  assign i_ifu_rsp_err =
              (rsp_instr_sel_leftover & (|{ifu_icb_rsp_err, leftover_err_r}))
            | (rsp_instr_sel_icb_rsp  & ifu_icb_rsp_err);
  //wire ifu_icb_rsp_replay;
  //assign ifu_rsp_replay =
  //            (rsp_instr_sel_leftover & (|{ifu_icb_rsp_replay, 1'b0}))
  //          | (rsp_instr_sel_icb_rsp  & ifu_icb_rsp_replay);
  // The ifetch response valid will have 2 sources
  //    Source #1: Did not issue ICB CMD request, and just use last holdup values, then
  //               we generate a fake response valid
  wire holdup_gen_fake_rsp_valid = icb_sta_is_1st & req_need_0uop_r;
  //    Source #2: Did issue ICB CMD request, use ICB response valid. But not each response
  //               valid will be sent to ifetch-response. The ICB response data will put
  //               into the leftover buffer when:
  //                    It need two uops and itf-state is in 1ST stage (the leftover
  //                    buffer is always ready to accept this)
  assign ifu_icb_rsp2leftover = req_need_2uop_r & icb_sta_is_1st;
  wire ifu_icb_rsp2ir_ready;
  wire ifu_icb_rsp2ir_valid = ifu_icb_rsp2leftover ? 1'b0 : ifu_icb_rsp_valid;
  assign ifu_icb_rsp_ready  = ifu_icb_rsp2leftover ? 1'b1 : ifu_icb_rsp2ir_ready;
  assign i_ifu_rsp_valid = holdup_gen_fake_rsp_valid | ifu_icb_rsp2ir_valid;
  assign ifu_icb_rsp2ir_ready = i_ifu_rsp_ready;
  // Generate the ICB response channel
  // The ICB response valid to ifetch generated in two cases:
  assign ifu_icb_rsp_valid = 1'b0
                     `ifdef E203_HAS_ITCM //{
                       | (icb_cmd2itcm_r & ifu2itcm_icb_rsp_valid)
                     `endif//}
                     `ifdef E203_HAS_MEM_ITF //{
                       | (icb_cmd2biu_r  & ifu2biu_icb_rsp_valid)
                     `endif//}
                        ;
   //assign ifu_icb_rsp_replay = 1'b0
   //                  `ifdef E203_HAS_ITCM //{
   //                    | (icb_cmd2itcm_r & ifu2itcm_replay)
   //                  `endif//}
   //                  `ifdef E203_HAS_MEM_ITF //{
   //                    | (icb_cmd2biu_r & ifu2biu_replay)
   //                  `endif//}
   //                     ;
  // Generate the ICB command channel
  // The ICB cmd valid will be generated in two cases:
  //              uops"
  //                    to finish the 1ST state)
  wire ifu_req_valid_pos;
  assign ifu_icb_cmd_valid =
                   (ifu_req_valid_pos & (~req_need_0uop))
                 | (
                     req_need_2uop_r &
                     (
                         ((icb_sta_is_1st & ifu_icb_rsp_hsked)
                       |  icb_sta_is_wait2nd)
                     )
                   )
                     ;
  // The ICB cmd address will be generated in 3 cases:
  //                 The next-lane-aligned address can be generated by
  //                 current request-PC plus 16bits. To optimize the
  //                 timing, we try to use last-fetched-PC (flop clean)
  //                 to caculate. So we caculate it by
  //                 last-fetched-PC (flopped value pc_r) truncated
  //                 with lane-offset and plus a lane siz
  wire icb_addr_sel_1stnxtalgn = holdup2leftover_sel;
  //                 The next-lane-aligned address can be generated by
  //                 last request-PC plus 16bits.
  wire icb_addr_sel_2ndnxtalgn = req_need_2uop_r &
                     (
                          icb_sta_is_1st
                       |  icb_sta_is_wait2nd
                     );
  wire icb_addr_sel_cur = (~icb_addr_sel_1stnxtalgn) & (~icb_addr_sel_2ndnxtalgn);
  wire [`E203_PC_SIZE-1:0] nxtalgn_plus_offset =
               icb_addr_sel_2ndnxtalgn ? `E203_PC_SIZE'd2 :
               ifu_req_seq_rv32        ? `E203_PC_SIZE'd6 :
                                         `E203_PC_SIZE'd4;
  // Since we always fetch 32bits
  wire [`E203_PC_SIZE-1:0] icb_algn_nxt_lane_addr = ifu_req_last_pc + nxtalgn_plus_offset;
  assign ifu_icb_cmd_addr =
      ({`E203_PC_SIZE{icb_addr_sel_1stnxtalgn | icb_addr_sel_2ndnxtalgn}} & icb_algn_nxt_lane_addr)
    | ({`E203_PC_SIZE{icb_addr_sel_cur}} & ifu_req_pc);
  // Generate the ifetch req channel ready signal
  // Ifu req channel will be ready when the ICB CMD channel is ready and
  wire ifu_req_ready_condi =
                (
                    icb_sta_is_idle
                  | ((~req_need_2uop_r) & icb_sta_is_1st & i_ifu_rsp_hsked)
                  | (  req_need_2uop_r  & icb_sta_is_2nd & i_ifu_rsp_hsked)
                );
  assign ifu_req_ready     = ifu_icb_cmd_ready & ifu_req_ready_condi;
  assign ifu_req_valid_pos = ifu_req_valid     & ifu_req_ready_condi; // Handshake valid
  // Dispatch the ICB CMD and RSP Channel to ITCM and System Memory
  //   according to the address range
  `ifdef E203_HAS_ITCM //{
  assign ifu_icb_cmd2itcm = (ifu_icb_cmd_addr[`E203_ITCM_BASE_REGION] == itcm_region_indic[`E203_ITCM_BASE_REGION]);
  assign ifu2itcm_icb_cmd_valid = ifu_icb_cmd_valid & ifu_icb_cmd2itcm;
  assign ifu2itcm_icb_cmd_addr = ifu_icb_cmd_addr[`E203_ITCM_ADDR_WIDTH-1:0];
  assign ifu2itcm_icb_rsp_ready = ifu_icb_rsp_ready;
  `endif//}
  `ifdef E203_HAS_MEM_ITF //{
  assign ifu_icb_cmd2biu = 1'b1
            `ifdef E203_HAS_ITCM //{
              & ~(ifu_icb_cmd2itcm)
            `endif//}
              ;
  wire ifu2biu_icb_cmd_valid_pre  = ifu_icb_cmd_valid & ifu_icb_cmd2biu;
  wire [`E203_ADDR_SIZE-1:0]   ifu2biu_icb_cmd_addr_pre = ifu_icb_cmd_addr[`E203_ADDR_SIZE-1:0];
  assign ifu2biu_icb_rsp_ready = ifu_icb_rsp_ready;
  wire ifu2biu_icb_cmd_ready_pre;
  `endif//}
  assign ifu_icb_cmd_ready = 1'b0
    `ifdef E203_HAS_ITCM //{
        | (ifu_icb_cmd2itcm & ifu2itcm_icb_cmd_ready)
    `endif//}
    `ifdef E203_HAS_MEM_ITF //{
        | (ifu_icb_cmd2biu  & ifu2biu_icb_cmd_ready_pre )
    `endif//}
        ;
    `ifdef E203_HAS_MEM_ITF //{
  //sirv_gnrl_pipe_stage # (
  //      .CUT_READY (0),
  //      .DP  (1),
  //      .DW  (`E203_ADDR_SIZE)
  //    ) u_e203_ifu2biu_cmd_stage (
  //      .i_vld(ifu2biu_icb_cmd_valid_pre),
  //      .i_rdy(ifu2biu_icb_cmd_ready_pre),
  //      .i_dat(ifu2biu_icb_cmd_addr_pre),
  //      .o_vld(ifu2biu_icb_cmd_valid),
  //      .o_rdy(ifu2biu_icb_cmd_ready),
  //      .o_dat(ifu2biu_icb_cmd_addr),
  //      .clk  (clk),
  //      .rst_n(rst_n)
  //    );
     assign ifu2biu_icb_cmd_addr      = ifu2biu_icb_cmd_addr_pre;
     assign ifu2biu_icb_cmd_valid     = ifu2biu_icb_cmd_valid_pre;
     assign ifu2biu_icb_cmd_ready_pre = ifu2biu_icb_cmd_ready;
    `endif//}
endmodule