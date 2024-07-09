module rmii_ethernet
   (TXEN_OBUF,
    TXD_OBUF,
    ETH_CLK_OBUF,
    RXDV_IBUF,
    RXER_IBUF,
    INTERNAL_RST_reg,
    D);
  output TXEN_OBUF;
  output [1:0]TXD_OBUF;
  input ETH_CLK_OBUF;
  input RXDV_IBUF;
  input RXER_IBUF;
  input INTERNAL_RST_reg;
  input [1:0]D;
  wire DONE;
  wire DONE_DEL;
  wire DONE_SYNC;
  wire DONE_i_1_n_0;
  wire ETH_CLK_OBUF;
  wire GO;
  wire GO_DEL;
  wire GO_SYNC;
  wire GO_i_1_n_0;
  wire INTERNAL_RST_reg;
  wire NEXTCRC32_D80108_out;
  wire NEXTCRC32_D80177_out;
  wire NEXTCRC32_D80181_out;
  wire NEXTCRC32_D80189_out;
  wire NEXTCRC32_D80195_out;
  wire NEXTCRC32_D80203_out;
  wire NEXTCRC32_D80217_out;
  wire NEXTCRC32_D8070_out;
  wire NEXTCRC32_D8074_out;
  wire \PREAMBLE_COUNT[0]_i_1_n_0 ;
  wire \PREAMBLE_COUNT[1]_i_1_n_0 ;
  wire \PREAMBLE_COUNT[2]_i_1_n_0 ;
  wire \PREAMBLE_COUNT[3]_i_1_n_0 ;
  wire \PREAMBLE_COUNT[4]_i_1_n_0 ;
  wire \PREAMBLE_COUNT[4]_i_2_n_0 ;
  wire \PREAMBLE_COUNT[4]_i_3_n_0 ;
  wire \PREAMBLE_COUNT[4]_i_4_n_0 ;
  wire \PREAMBLE_COUNT_reg_n_0_[0] ;
  wire \PREAMBLE_COUNT_reg_n_0_[1] ;
  wire \PREAMBLE_COUNT_reg_n_0_[2] ;
  wire \PREAMBLE_COUNT_reg_n_0_[3] ;
  wire \PREAMBLE_COUNT_reg_n_0_[4] ;
  wire S_TX_ACK_i_1_n_0;
  wire S_TX_ACK_reg_n_0;
  wire \TXD[0]_i_10_n_0 ;
  wire \TXD[0]_i_11_n_0 ;
  wire \TXD[0]_i_1_n_0 ;
  wire \TXD[0]_i_2_n_0 ;
  wire \TXD[0]_i_3_n_0 ;
  wire \TXD[0]_i_6_n_0 ;
  wire \TXD[0]_i_7_n_0 ;
  wire \TXD[0]_i_8_n_0 ;
  wire \TXD[0]_i_9_n_0 ;
  wire \TXD[1]_i_10_n_0 ;
  wire \TXD[1]_i_11_n_0 ;
  wire \TXD[1]_i_12_n_0 ;
  wire \TXD[1]_i_1_n_0 ;
  wire \TXD[1]_i_2_n_0 ;
  wire \TXD[1]_i_3_n_0 ;
  wire \TXD[1]_i_4_n_0 ;
  wire \TXD[1]_i_7_n_0 ;
  wire \TXD[1]_i_8_n_0 ;
  wire \TXD[1]_i_9_n_0 ;
  wire [1:0]TXD_OBUF;
  wire \TXD_reg[0]_i_4_n_0 ;
  wire \TXD_reg[0]_i_5_n_0 ;
  wire \TXD_reg[1]_i_5_n_0 ;
  wire \TXD_reg[1]_i_6_n_0 ;
  wire TXEN_OBUF;
  wire TXEN_i_1_n_0;
  wire \TX_CRC[0]_i_1_n_0 ;
  wire \TX_CRC[10]_i_3_n_0 ;
  wire \TX_CRC[10]_i_4_n_0 ;
  wire \TX_CRC[10]_i_5_n_0 ;
  wire \TX_CRC[11]_i_1_n_0 ;
  wire \TX_CRC[11]_i_2_n_0 ;
  wire \TX_CRC[11]_i_3_n_0 ;
  wire \TX_CRC[11]_i_4_n_0 ;
  wire \TX_CRC[12]_i_1_n_0 ;
  wire \TX_CRC[12]_i_2_n_0 ;
  wire \TX_CRC[12]_i_3_n_0 ;
  wire \TX_CRC[12]_i_4_n_0 ;
  wire \TX_CRC[12]_i_5_n_0 ;
  wire \TX_CRC[12]_i_6_n_0 ;
  wire \TX_CRC[12]_i_7_n_0 ;
  wire \TX_CRC[13]_i_3_n_0 ;
  wire \TX_CRC[13]_i_4_n_0 ;
  wire \TX_CRC[13]_i_5_n_0 ;
  wire \TX_CRC[14]_i_2_n_0 ;
  wire \TX_CRC[14]_i_3_n_0 ;
  wire \TX_CRC[14]_i_4_n_0 ;
  wire \TX_CRC[14]_i_5_n_0 ;
  wire \TX_CRC[15]_i_1_n_0 ;
  wire \TX_CRC[15]_i_2_n_0 ;
  wire \TX_CRC[15]_i_3_n_0 ;
  wire \TX_CRC[15]_i_4_n_0 ;
  wire \TX_CRC[15]_i_5_n_0 ;
  wire \TX_CRC[16]_i_1_n_0 ;
  wire \TX_CRC[16]_i_2_n_0 ;
  wire \TX_CRC[16]_i_3_n_0 ;
  wire \TX_CRC[17]_i_3_n_0 ;
  wire \TX_CRC[17]_i_5_n_0 ;
  wire \TX_CRC[18]_i_2_n_0 ;
  wire \TX_CRC[18]_i_3_n_0 ;
  wire \TX_CRC[19]_i_1_n_0 ;
  wire \TX_CRC[19]_i_2_n_0 ;
  wire \TX_CRC[1]_i_2_n_0 ;
  wire \TX_CRC[1]_i_5_n_0 ;
  wire \TX_CRC[20]_i_1_n_0 ;
  wire \TX_CRC[21]_i_1_n_0 ;
  wire \TX_CRC[22]_i_1_n_0 ;
  wire \TX_CRC[23]_i_2_n_0 ;
  wire \TX_CRC[24]_i_3_n_0 ;
  wire \TX_CRC[24]_i_4_n_0 ;
  wire \TX_CRC[24]_i_5_n_0 ;
  wire \TX_CRC[25]_i_2_n_0 ;
  wire \TX_CRC[25]_i_3_n_0 ;
  wire \TX_CRC[26]_i_1_n_0 ;
  wire \TX_CRC[26]_i_2_n_0 ;
  wire \TX_CRC[26]_i_3_n_0 ;
  wire \TX_CRC[26]_i_4_n_0 ;
  wire \TX_CRC[27]_i_2_n_0 ;
  wire \TX_CRC[27]_i_3_n_0 ;
  wire \TX_CRC[27]_i_4_n_0 ;
  wire \TX_CRC[28]_i_2_n_0 ;
  wire \TX_CRC[28]_i_3_n_0 ;
  wire \TX_CRC[29]_i_2_n_0 ;
  wire \TX_CRC[29]_i_3_n_0 ;
  wire \TX_CRC[29]_i_4_n_0 ;
  wire \TX_CRC[29]_i_5_n_0 ;
  wire \TX_CRC[2]_i_1_n_0 ;
  wire \TX_CRC[2]_i_2_n_0 ;
  wire \TX_CRC[2]_i_3_n_0 ;
  wire \TX_CRC[2]_i_4_n_0 ;
  wire \TX_CRC[2]_i_5_n_0 ;
  wire \TX_CRC[30]_i_2_n_0 ;
  wire \TX_CRC[30]_i_3_n_0 ;
  wire \TX_CRC[31]_i_1_n_0 ;
  wire \TX_CRC[31]_i_2_n_0 ;
  wire \TX_CRC[31]_i_3_n_0 ;
  wire \TX_CRC[3]_i_3_n_0 ;
  wire \TX_CRC[3]_i_4_n_0 ;
  wire \TX_CRC[4]_i_2_n_0 ;
  wire \TX_CRC[4]_i_3_n_0 ;
  wire \TX_CRC[4]_i_4_n_0 ;
  wire \TX_CRC[4]_i_5_n_0 ;
  wire \TX_CRC[5]_i_4_n_0 ;
  wire \TX_CRC[5]_i_5_n_0 ;
  wire \TX_CRC[5]_i_6_n_0 ;
  wire \TX_CRC[6]_i_2_n_0 ;
  wire \TX_CRC[6]_i_3_n_0 ;
  wire \TX_CRC[6]_i_4_n_0 ;
  wire \TX_CRC[6]_i_5_n_0 ;
  wire \TX_CRC[7]_i_1_n_0 ;
  wire \TX_CRC[7]_i_2_n_0 ;
  wire \TX_CRC[7]_i_3_n_0 ;
  wire \TX_CRC[7]_i_4_n_0 ;
  wire \TX_CRC[8]_i_1_n_0 ;
  wire \TX_CRC[9]_i_1_n_0 ;
  wire \TX_CRC[9]_i_2_n_0 ;
  wire \TX_CRC[9]_i_3_n_0 ;
  wire \TX_CRC[9]_i_4_n_0 ;
  wire \TX_CRC_reg[10]_i_1_n_0 ;
  wire \TX_CRC_reg[13]_i_1_n_0 ;
  wire \TX_CRC_reg[14]_i_1_n_0 ;
  wire \TX_CRC_reg[17]_i_1_n_0 ;
  wire \TX_CRC_reg[18]_i_1_n_0 ;
  wire \TX_CRC_reg[1]_i_1_n_0 ;
  wire \TX_CRC_reg[23]_i_1_n_0 ;
  wire \TX_CRC_reg[24]_i_1_n_0 ;
  wire \TX_CRC_reg[25]_i_1_n_0 ;
  wire \TX_CRC_reg[27]_i_1_n_0 ;
  wire \TX_CRC_reg[28]_i_1_n_0 ;
  wire \TX_CRC_reg[29]_i_1_n_0 ;
  wire \TX_CRC_reg[30]_i_1_n_0 ;
  wire \TX_CRC_reg[3]_i_1_n_0 ;
  wire \TX_CRC_reg[4]_i_1_n_0 ;
  wire \TX_CRC_reg[5]_i_1_n_0 ;
  wire \TX_CRC_reg[6]_i_1_n_0 ;
  wire \TX_CRC_reg_n_0_[0] ;
  wire \TX_CRC_reg_n_0_[10] ;
  wire \TX_CRC_reg_n_0_[11] ;
  wire \TX_CRC_reg_n_0_[12] ;
  wire \TX_CRC_reg_n_0_[13] ;
  wire \TX_CRC_reg_n_0_[14] ;
  wire \TX_CRC_reg_n_0_[15] ;
  wire \TX_CRC_reg_n_0_[16] ;
  wire \TX_CRC_reg_n_0_[17] ;
  wire \TX_CRC_reg_n_0_[18] ;
  wire \TX_CRC_reg_n_0_[19] ;
  wire \TX_CRC_reg_n_0_[20] ;
  wire \TX_CRC_reg_n_0_[21] ;
  wire \TX_CRC_reg_n_0_[22] ;
  wire \TX_CRC_reg_n_0_[23] ;
  wire \TX_CRC_reg_n_0_[8] ;
  wire \TX_CRC_reg_n_0_[9] ;
  wire [10:1]TX_IN_COUNT;
  wire \TX_IN_COUNT[10]_i_1_n_0 ;
  wire \TX_IN_COUNT[10]_i_2_n_0 ;
  wire \TX_IN_COUNT[10]_i_3_n_0 ;
  wire \TX_IN_COUNT[10]_i_4_n_0 ;
  wire \TX_IN_COUNT[1]_i_1_n_0 ;
  wire \TX_IN_COUNT[2]_i_1_n_0 ;
  wire \TX_IN_COUNT[3]_i_1_n_0 ;
  wire \TX_IN_COUNT[4]_i_1_n_0 ;
  wire \TX_IN_COUNT[5]_i_1_n_0 ;
  wire \TX_IN_COUNT[6]_i_1_n_0 ;
  wire \TX_IN_COUNT[7]_i_1_n_0 ;
  wire \TX_IN_COUNT[8]_i_1_n_0 ;
  wire \TX_IN_COUNT[9]_i_1_n_0 ;
  wire TX_MEMORY_reg_ENBWREN_cooolgate_en_sig_9;
  wire TX_MEMORY_reg_n_59;
  wire TX_MEMORY_reg_n_67;
  wire [0:0]TX_OUT_COUNT0_in;
  wire \TX_OUT_COUNT[10]_i_1_n_0 ;
  wire \TX_OUT_COUNT[10]_i_2_n_0 ;
  wire \TX_OUT_COUNT[10]_i_3_n_0 ;
  wire \TX_OUT_COUNT[10]_i_4_n_0 ;
  wire \TX_OUT_COUNT[10]_i_5_n_0 ;
  wire \TX_OUT_COUNT[10]_i_6_n_0 ;
  wire \TX_OUT_COUNT[10]_i_7_n_0 ;
  wire \TX_OUT_COUNT[10]_i_8_n_0 ;
  wire \TX_OUT_COUNT[1]_i_1_n_0 ;
  wire \TX_OUT_COUNT[2]_i_1_n_0 ;
  wire \TX_OUT_COUNT[3]_i_1_n_0 ;
  wire \TX_OUT_COUNT[4]_i_1_n_0 ;
  wire \TX_OUT_COUNT[5]_i_1_n_0 ;
  wire \TX_OUT_COUNT[6]_i_1_n_0 ;
  wire \TX_OUT_COUNT[7]_i_1_n_0 ;
  wire \TX_OUT_COUNT[8]_i_1_n_0 ;
  wire \TX_OUT_COUNT[8]_i_2_n_0 ;
  wire \TX_OUT_COUNT[9]_i_1_n_0 ;
  wire \TX_OUT_COUNT_reg_n_0_[0] ;
  wire \TX_OUT_COUNT_reg_n_0_[10] ;
  wire \TX_OUT_COUNT_reg_n_0_[1] ;
  wire \TX_OUT_COUNT_reg_n_0_[2] ;
  wire \TX_OUT_COUNT_reg_n_0_[3] ;
  wire \TX_OUT_COUNT_reg_n_0_[4] ;
  wire \TX_OUT_COUNT_reg_n_0_[5] ;
  wire \TX_OUT_COUNT_reg_n_0_[6] ;
  wire \TX_OUT_COUNT_reg_n_0_[7] ;
  wire \TX_OUT_COUNT_reg_n_0_[8] ;
  wire \TX_OUT_COUNT_reg_n_0_[9] ;
  wire \TX_PACKET_STATE[0]_i_1_n_0 ;
  wire \TX_PACKET_STATE[1]_i_10_n_0 ;
  wire \TX_PACKET_STATE[1]_i_11_n_0 ;
  wire \TX_PACKET_STATE[1]_i_12_n_0 ;
  wire \TX_PACKET_STATE[1]_i_13_n_0 ;
  wire \TX_PACKET_STATE[1]_i_1_n_0 ;
  wire \TX_PACKET_STATE[1]_i_4_n_0 ;
  wire \TX_PACKET_STATE[1]_i_5_n_0 ;
  wire \TX_PACKET_STATE[1]_i_6_n_0 ;
  wire \TX_PACKET_STATE[1]_i_7_n_0 ;
  wire \TX_PACKET_STATE[1]_i_8_n_0 ;
  wire \TX_PACKET_STATE[1]_i_9_n_0 ;
  wire \TX_PACKET_STATE_reg[1]_i_2_n_2 ;
  wire \TX_PACKET_STATE_reg[1]_i_3_n_0 ;
  wire \TX_PACKET_STATE_reg_n_0_[0] ;
  wire \TX_PACKET_STATE_reg_n_0_[1] ;
  wire \TX_PHY_STATE[0]_i_1_n_0 ;
  wire \TX_PHY_STATE[1]_i_1_n_0 ;
  wire \TX_PHY_STATE[2]_i_1_n_0 ;
  wire \TX_PHY_STATE[2]_i_2_n_0 ;
  wire \TX_PHY_STATE[2]_i_3_n_0 ;
  wire \TX_PHY_STATE[2]_i_4_n_0 ;
  wire \TX_PHY_STATE[3]_i_1_n_0 ;
  wire \TX_PHY_STATE[3]_i_2_n_0 ;
  wire \TX_PHY_STATE[3]_i_3_n_0 ;
  wire \TX_PHY_STATE[3]_i_4_n_0 ;
  wire \TX_PHY_STATE[3]_i_5_n_0 ;
  wire \TX_PHY_STATE[4]_i_1_n_0 ;
  wire \TX_PHY_STATE[4]_i_2_n_0 ;
  wire \TX_PHY_STATE[4]_i_3_n_0 ;
  wire \TX_PHY_STATE[4]_i_4_n_0 ;
  wire \TX_PHY_STATE_reg_n_0_[0] ;
  wire \TX_PHY_STATE_reg_n_0_[1] ;
  wire \TX_PHY_STATE_reg_n_0_[2] ;
  wire \TX_PHY_STATE_reg_n_0_[3] ;
  wire \TX_PHY_STATE_reg_n_0_[4] ;
  wire [10:0]TX_READ_ADDRESS;
  wire [10:1]TX_READ_ADDRESS0;
  wire \TX_READ_ADDRESS_rep[0]_i_1_n_0 ;
  wire \TX_READ_ADDRESS_rep[9]_i_1_n_0 ;
  wire \TX_READ_ADDRESS_rep[9]_i_2_n_0 ;
  wire \TX_READ_ADDRESS_rep[9]_i_4_n_0 ;
  wire TX_WRITE;
  wire [10:0]TX_WRITE_ADDRESS;
  wire \TX_WRITE_ADDRESS[0]_i_1_n_0 ;
  wire \TX_WRITE_ADDRESS[10]_i_1_n_0 ;
  wire \TX_WRITE_ADDRESS[10]_i_2_n_0 ;
  wire \TX_WRITE_ADDRESS[10]_i_3_n_0 ;
  wire \TX_WRITE_ADDRESS[1]_i_1_n_0 ;
  wire \TX_WRITE_ADDRESS[2]_i_1_n_0 ;
  wire \TX_WRITE_ADDRESS[3]_i_1_n_0 ;
  wire \TX_WRITE_ADDRESS[4]_i_1_n_0 ;
  wire \TX_WRITE_ADDRESS[5]_i_1_n_0 ;
  wire \TX_WRITE_ADDRESS[5]_i_2_n_0 ;
  wire \TX_WRITE_ADDRESS[6]_i_1_n_0 ;
  wire \TX_WRITE_ADDRESS[7]_i_1_n_0 ;
  wire \TX_WRITE_ADDRESS[8]_i_1_n_0 ;
  wire \TX_WRITE_ADDRESS[9]_i_1_n_0 ;
  wire \TX_WRITE_ADDRESS[9]_i_2_n_0 ;
  wire [10:0]TX_WRITE_ADDRESS_DEL;
  wire TX_WRITE_i_1_n_0;
  wire p_0_in167_in;
  wire p_0_in66_in;
  wire p_168_in;
  wire [1:0]p_16_in;
  wire [1:0]p_17_in;
  wire [1:0]p_18_in;
  wire p_1_in126_in;
  wire p_1_in128_in;
  wire p_1_in130_in;
  wire p_1_in132_in;
  wire p_1_in133_in;
  wire p_1_in135_in;
  wire p_1_in136_in;
  wire p_202_in;
  wire p_206_in;
  wire [1:0]p_20_in;
  wire p_214_in;
  wire [1:0]p_21_in;
  wire p_222_in;
  wire p_224_in;
  wire [1:0]p_22_in;
  wire [7:0]slv1_out;
  wire NLW_TX_MEMORY_reg_CASCADEOUTA_UNCONNECTED;
  wire NLW_TX_MEMORY_reg_CASCADEOUTB_UNCONNECTED;
  wire NLW_TX_MEMORY_reg_DBITERR_UNCONNECTED;
  wire NLW_TX_MEMORY_reg_INJECTDBITERR_UNCONNECTED;
  wire NLW_TX_MEMORY_reg_INJECTSBITERR_UNCONNECTED;
  wire NLW_TX_MEMORY_reg_REGCEAREGCE_UNCONNECTED;
  wire NLW_TX_MEMORY_reg_REGCEB_UNCONNECTED;
  wire NLW_TX_MEMORY_reg_SBITERR_UNCONNECTED;
  wire [31:0]NLW_TX_MEMORY_reg_DOADO_UNCONNECTED;
  wire [31:16]NLW_TX_MEMORY_reg_DOBDO_UNCONNECTED;
  wire [3:0]NLW_TX_MEMORY_reg_DOPADOP_UNCONNECTED;
  wire [3:0]NLW_TX_MEMORY_reg_DOPBDOP_UNCONNECTED;
  wire [7:0]NLW_TX_MEMORY_reg_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_TX_MEMORY_reg_RDADDRECC_UNCONNECTED;
  wire [3:0]\NLW_TX_PACKET_STATE_reg[1]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_TX_PACKET_STATE_reg[1]_i_2_O_UNCONNECTED ;
  wire [2:0]\NLW_TX_PACKET_STATE_reg[1]_i_3_CO_UNCONNECTED ;
  wire [3:0]\NLW_TX_PACKET_STATE_reg[1]_i_3_O_UNCONNECTED ;
  FDRE DONE_DEL_reg
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(DONE),
        .Q(DONE_DEL),
        .R(1'b0));
  FDRE DONE_SYNC_reg
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(DONE_DEL),
        .Q(DONE_SYNC),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hBFFFFFFF80000000))
    DONE_i_1
       (.I0(GO_SYNC),
        .I1(\TX_PHY_STATE_reg_n_0_[4] ),
        .I2(\TX_PHY_STATE_reg_n_0_[3] ),
        .I3(\TX_PHY_STATE_reg_n_0_[1] ),
        .I4(\TX_PHY_STATE_reg_n_0_[2] ),
        .I5(DONE),
        .O(DONE_i_1_n_0));
  FDRE DONE_reg
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(DONE_i_1_n_0),
        .Q(DONE),
        .R(INTERNAL_RST_reg));
  FDRE GO_DEL_reg
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(GO),
        .Q(GO_DEL),
        .R(1'b0));
  FDRE GO_SYNC_reg
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(GO_DEL),
        .Q(GO_SYNC),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hF704))
    GO_i_1
       (.I0(DONE_SYNC),
        .I1(\TX_PACKET_STATE_reg_n_0_[1] ),
        .I2(\TX_PACKET_STATE_reg_n_0_[0] ),
        .I3(GO),
        .O(GO_i_1_n_0));
  FDRE GO_reg
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(GO_i_1_n_0),
        .Q(GO),
        .R(INTERNAL_RST_reg));
  LUT1 #(
    .INIT(2'h1))
    \PREAMBLE_COUNT[0]_i_1
       (.I0(\PREAMBLE_COUNT_reg_n_0_[0] ),
        .O(\PREAMBLE_COUNT[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair214" *)
  LUT2 #(
    .INIT(4'h9))
    \PREAMBLE_COUNT[1]_i_1
       (.I0(\PREAMBLE_COUNT_reg_n_0_[0] ),
        .I1(\PREAMBLE_COUNT_reg_n_0_[1] ),
        .O(\PREAMBLE_COUNT[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFDFDFDDD00000020))
    \PREAMBLE_COUNT[2]_i_1
       (.I0(\PREAMBLE_COUNT[4]_i_4_n_0 ),
        .I1(\TX_PHY_STATE_reg_n_0_[4] ),
        .I2(\TX_PHY_STATE_reg_n_0_[0] ),
        .I3(\PREAMBLE_COUNT_reg_n_0_[0] ),
        .I4(\PREAMBLE_COUNT_reg_n_0_[1] ),
        .I5(\PREAMBLE_COUNT_reg_n_0_[2] ),
        .O(\PREAMBLE_COUNT[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair214" *)
  LUT4 #(
    .INIT(16'hFE01))
    \PREAMBLE_COUNT[3]_i_1
       (.I0(\PREAMBLE_COUNT_reg_n_0_[2] ),
        .I1(\PREAMBLE_COUNT_reg_n_0_[0] ),
        .I2(\PREAMBLE_COUNT_reg_n_0_[1] ),
        .I3(\PREAMBLE_COUNT_reg_n_0_[3] ),
        .O(\PREAMBLE_COUNT[3]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h02))
    \PREAMBLE_COUNT[4]_i_1
       (.I0(\PREAMBLE_COUNT[4]_i_4_n_0 ),
        .I1(\TX_PHY_STATE_reg_n_0_[4] ),
        .I2(\TX_PHY_STATE_reg_n_0_[0] ),
        .O(\PREAMBLE_COUNT[4]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2))
    \PREAMBLE_COUNT[4]_i_2
       (.I0(\PREAMBLE_COUNT[4]_i_4_n_0 ),
        .I1(\TX_PHY_STATE_reg_n_0_[4] ),
        .O(\PREAMBLE_COUNT[4]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFE0001))
    \PREAMBLE_COUNT[4]_i_3
       (.I0(\PREAMBLE_COUNT_reg_n_0_[3] ),
        .I1(\PREAMBLE_COUNT_reg_n_0_[1] ),
        .I2(\PREAMBLE_COUNT_reg_n_0_[0] ),
        .I3(\PREAMBLE_COUNT_reg_n_0_[2] ),
        .I4(\PREAMBLE_COUNT_reg_n_0_[4] ),
        .O(\PREAMBLE_COUNT[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000001110100))
    \PREAMBLE_COUNT[4]_i_4
       (.I0(\TX_PHY_STATE_reg_n_0_[1] ),
        .I1(\TX_PHY_STATE_reg_n_0_[2] ),
        .I2(\TX_PHY_STATE[4]_i_4_n_0 ),
        .I3(\TX_PHY_STATE_reg_n_0_[0] ),
        .I4(GO_SYNC),
        .I5(\TX_PHY_STATE_reg_n_0_[3] ),
        .O(\PREAMBLE_COUNT[4]_i_4_n_0 ));
  FDSE \PREAMBLE_COUNT_reg[0]
       (.C(ETH_CLK_OBUF),
        .CE(\PREAMBLE_COUNT[4]_i_2_n_0 ),
        .D(\PREAMBLE_COUNT[0]_i_1_n_0 ),
        .Q(\PREAMBLE_COUNT_reg_n_0_[0] ),
        .S(\PREAMBLE_COUNT[4]_i_1_n_0 ));
  FDSE \PREAMBLE_COUNT_reg[1]
       (.C(ETH_CLK_OBUF),
        .CE(\PREAMBLE_COUNT[4]_i_2_n_0 ),
        .D(\PREAMBLE_COUNT[1]_i_1_n_0 ),
        .Q(\PREAMBLE_COUNT_reg_n_0_[1] ),
        .S(\PREAMBLE_COUNT[4]_i_1_n_0 ));
  FDRE \PREAMBLE_COUNT_reg[2]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(\PREAMBLE_COUNT[2]_i_1_n_0 ),
        .Q(\PREAMBLE_COUNT_reg_n_0_[2] ),
        .R(1'b0));
  FDSE \PREAMBLE_COUNT_reg[3]
       (.C(ETH_CLK_OBUF),
        .CE(\PREAMBLE_COUNT[4]_i_2_n_0 ),
        .D(\PREAMBLE_COUNT[3]_i_1_n_0 ),
        .Q(\PREAMBLE_COUNT_reg_n_0_[3] ),
        .S(\PREAMBLE_COUNT[4]_i_1_n_0 ));
  FDSE \PREAMBLE_COUNT_reg[4]
       (.C(ETH_CLK_OBUF),
        .CE(\PREAMBLE_COUNT[4]_i_2_n_0 ),
        .D(\PREAMBLE_COUNT[4]_i_3_n_0 ),
        .Q(\PREAMBLE_COUNT_reg_n_0_[4] ),
        .S(\PREAMBLE_COUNT[4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hAE55))
    S_TX_ACK_i_1
       (.I0(\TX_PACKET_STATE_reg_n_0_[1] ),
        .I1(\TX_PACKET_STATE_reg_n_0_[0] ),
        .I2(\TX_PACKET_STATE_reg[1]_i_2_n_2 ),
        .I3(S_TX_ACK_reg_n_0),
        .O(S_TX_ACK_i_1_n_0));
  FDRE S_TX_ACK_reg
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(S_TX_ACK_i_1_n_0),
        .Q(S_TX_ACK_reg_n_0),
        .R(INTERNAL_RST_reg));
  (* SOFT_HLUTNM = "soft_lutpair228" *)
  LUT3 #(
    .INIT(8'hB8))
    \TXD[0]_i_1
       (.I0(\TXD[0]_i_2_n_0 ),
        .I1(\TXD[1]_i_3_n_0 ),
        .I2(TXD_OBUF[0]),
        .O(\TXD[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0))
    \TXD[0]_i_10
       (.I0(p_18_in[0]),
        .I1(TX_MEMORY_reg_n_67),
        .I2(\TX_PHY_STATE_reg_n_0_[1] ),
        .I3(p_20_in[0]),
        .I4(\TX_PHY_STATE_reg_n_0_[0] ),
        .I5(p_21_in[0]),
        .O(\TXD[0]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h5F503F3F5F503030))
    \TXD[0]_i_11
       (.I0(slv1_out[5]),
        .I1(slv1_out[7]),
        .I2(\TX_PHY_STATE_reg_n_0_[1] ),
        .I3(p_16_in[0]),
        .I4(\TX_PHY_STATE_reg_n_0_[0] ),
        .I5(p_17_in[0]),
        .O(\TXD[0]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0))
    \TXD[0]_i_2
       (.I0(\TXD[0]_i_3_n_0 ),
        .I1(\TXD_reg[0]_i_4_n_0 ),
        .I2(\TX_PHY_STATE_reg_n_0_[4] ),
        .I3(\TXD_reg[0]_i_5_n_0 ),
        .I4(\TX_PHY_STATE_reg_n_0_[3] ),
        .I5(\TXD[0]_i_6_n_0 ),
        .O(\TXD[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h47FF4700))
    \TXD[0]_i_3
       (.I0(p_1_in126_in),
        .I1(\TX_PHY_STATE_reg_n_0_[0] ),
        .I2(p_1_in130_in),
        .I3(\TX_PHY_STATE_reg_n_0_[2] ),
        .I4(\TXD[0]_i_7_n_0 ),
        .O(\TXD[0]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hE2FFFFFF))
    \TXD[0]_i_6
       (.I0(TX_MEMORY_reg_n_59),
        .I1(\TX_PHY_STATE_reg_n_0_[0] ),
        .I2(p_22_in[0]),
        .I3(\TX_PHY_STATE_reg_n_0_[2] ),
        .I4(\TX_PHY_STATE_reg_n_0_[1] ),
        .O(\TXD[0]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h505F3030505F3F3F))
    \TXD[0]_i_7
       (.I0(p_1_in133_in),
        .I1(p_1_in136_in),
        .I2(\TX_PHY_STATE_reg_n_0_[1] ),
        .I3(\TX_CRC_reg_n_0_[9] ),
        .I4(\TX_PHY_STATE_reg_n_0_[0] ),
        .I5(\TX_CRC_reg_n_0_[11] ),
        .O(\TXD[0]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h505F3030505F3F3F))
    \TXD[0]_i_8
       (.I0(\TX_CRC_reg_n_0_[21] ),
        .I1(\TX_CRC_reg_n_0_[23] ),
        .I2(\TX_PHY_STATE_reg_n_0_[1] ),
        .I3(slv1_out[1]),
        .I4(\TX_PHY_STATE_reg_n_0_[0] ),
        .I5(slv1_out[3]),
        .O(\TXD[0]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h505F3030505F3F3F))
    \TXD[0]_i_9
       (.I0(\TX_CRC_reg_n_0_[13] ),
        .I1(\TX_CRC_reg_n_0_[15] ),
        .I2(\TX_PHY_STATE_reg_n_0_[1] ),
        .I3(\TX_CRC_reg_n_0_[17] ),
        .I4(\TX_PHY_STATE_reg_n_0_[0] ),
        .I5(\TX_CRC_reg_n_0_[19] ),
        .O(\TXD[0]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair228" *)
  LUT3 #(
    .INIT(8'hB8))
    \TXD[1]_i_1
       (.I0(\TXD[1]_i_2_n_0 ),
        .I1(\TXD[1]_i_3_n_0 ),
        .I2(TXD_OBUF[1]),
        .O(\TXD[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h505F3030505F3F3F))
    \TXD[1]_i_10
       (.I0(\TX_CRC_reg_n_0_[12] ),
        .I1(\TX_CRC_reg_n_0_[14] ),
        .I2(\TX_PHY_STATE_reg_n_0_[1] ),
        .I3(\TX_CRC_reg_n_0_[16] ),
        .I4(\TX_PHY_STATE_reg_n_0_[0] ),
        .I5(\TX_CRC_reg_n_0_[18] ),
        .O(\TXD[1]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0))
    \TXD[1]_i_11
       (.I0(p_18_in[1]),
        .I1(p_0_in66_in),
        .I2(\TX_PHY_STATE_reg_n_0_[1] ),
        .I3(p_20_in[1]),
        .I4(\TX_PHY_STATE_reg_n_0_[0] ),
        .I5(p_21_in[1]),
        .O(\TXD[1]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h5F503F3F5F503030))
    \TXD[1]_i_12
       (.I0(slv1_out[4]),
        .I1(slv1_out[6]),
        .I2(\TX_PHY_STATE_reg_n_0_[1] ),
        .I3(p_16_in[1]),
        .I4(\TX_PHY_STATE_reg_n_0_[0] ),
        .I5(p_17_in[1]),
        .O(\TXD[1]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0))
    \TXD[1]_i_2
       (.I0(\TXD[1]_i_4_n_0 ),
        .I1(\TXD_reg[1]_i_5_n_0 ),
        .I2(\TX_PHY_STATE_reg_n_0_[4] ),
        .I3(\TXD_reg[1]_i_6_n_0 ),
        .I4(\TX_PHY_STATE_reg_n_0_[3] ),
        .I5(\TXD[1]_i_7_n_0 ),
        .O(\TXD[1]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hBFFFFFFE))
    \TXD[1]_i_3
       (.I0(\TX_PHY_STATE_reg_n_0_[0] ),
        .I1(\TX_PHY_STATE_reg_n_0_[3] ),
        .I2(\TX_PHY_STATE_reg_n_0_[4] ),
        .I3(\TX_PHY_STATE_reg_n_0_[1] ),
        .I4(\TX_PHY_STATE_reg_n_0_[2] ),
        .O(\TXD[1]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h47FF4700))
    \TXD[1]_i_4
       (.I0(\TX_CRC_reg_n_0_[0] ),
        .I1(\TX_PHY_STATE_reg_n_0_[0] ),
        .I2(p_1_in128_in),
        .I3(\TX_PHY_STATE_reg_n_0_[2] ),
        .I4(\TXD[1]_i_8_n_0 ),
        .O(\TXD[1]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hA8882808))
    \TXD[1]_i_7
       (.I0(\TX_PHY_STATE_reg_n_0_[2] ),
        .I1(\TX_PHY_STATE_reg_n_0_[0] ),
        .I2(\TX_PHY_STATE_reg_n_0_[1] ),
        .I3(p_0_in167_in),
        .I4(p_22_in[1]),
        .O(\TXD[1]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h505F3030505F3F3F))
    \TXD[1]_i_8
       (.I0(p_1_in132_in),
        .I1(p_1_in135_in),
        .I2(\TX_PHY_STATE_reg_n_0_[1] ),
        .I3(\TX_CRC_reg_n_0_[8] ),
        .I4(\TX_PHY_STATE_reg_n_0_[0] ),
        .I5(\TX_CRC_reg_n_0_[10] ),
        .O(\TXD[1]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h505F3030505F3F3F))
    \TXD[1]_i_9
       (.I0(\TX_CRC_reg_n_0_[20] ),
        .I1(\TX_CRC_reg_n_0_[22] ),
        .I2(\TX_PHY_STATE_reg_n_0_[1] ),
        .I3(slv1_out[0]),
        .I4(\TX_PHY_STATE_reg_n_0_[0] ),
        .I5(slv1_out[2]),
        .O(\TXD[1]_i_9_n_0 ));
  FDRE \TXD_reg[0]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(\TXD[0]_i_1_n_0 ),
        .Q(TXD_OBUF[0]),
        .R(INTERNAL_RST_reg));
  MUXF7 \TXD_reg[0]_i_4
       (.I0(\TXD[0]_i_8_n_0 ),
        .I1(\TXD[0]_i_9_n_0 ),
        .O(\TXD_reg[0]_i_4_n_0 ),
        .S(\TX_PHY_STATE_reg_n_0_[2] ));
  MUXF7 \TXD_reg[0]_i_5
       (.I0(\TXD[0]_i_10_n_0 ),
        .I1(\TXD[0]_i_11_n_0 ),
        .O(\TXD_reg[0]_i_5_n_0 ),
        .S(\TX_PHY_STATE_reg_n_0_[2] ));
  FDRE \TXD_reg[1]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(\TXD[1]_i_1_n_0 ),
        .Q(TXD_OBUF[1]),
        .R(INTERNAL_RST_reg));
  MUXF7 \TXD_reg[1]_i_5
       (.I0(\TXD[1]_i_9_n_0 ),
        .I1(\TXD[1]_i_10_n_0 ),
        .O(\TXD_reg[1]_i_5_n_0 ),
        .S(\TX_PHY_STATE_reg_n_0_[2] ));
  MUXF7 \TXD_reg[1]_i_6
       (.I0(\TXD[1]_i_11_n_0 ),
        .I1(\TXD[1]_i_12_n_0 ),
        .O(\TXD_reg[1]_i_6_n_0 ),
        .S(\TX_PHY_STATE_reg_n_0_[2] ));
  LUT6 #(
    .INIT(64'h7F7FFFFF00000100))
    TXEN_i_1
       (.I0(\TX_PHY_STATE_reg_n_0_[4] ),
        .I1(\TX_PHY_STATE_reg_n_0_[3] ),
        .I2(\TX_PHY_STATE_reg_n_0_[2] ),
        .I3(\TX_PHY_STATE_reg_n_0_[0] ),
        .I4(\TX_PHY_STATE_reg_n_0_[1] ),
        .I5(TXEN_OBUF),
        .O(TXEN_i_1_n_0));
  FDRE TXEN_reg
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(TXEN_i_1_n_0),
        .Q(TXEN_OBUF),
        .R(INTERNAL_RST_reg));
  LUT6 #(
    .INIT(64'h8BB8744774478BB8))
    \TX_CRC[0]_i_1
       (.I0(\TX_CRC[12]_i_3_n_0 ),
        .I1(\TX_PHY_STATE_reg_n_0_[2] ),
        .I2(p_0_in167_in),
        .I3(p_20_in[1]),
        .I4(slv1_out[6]),
        .I5(slv1_out[0]),
        .O(\TX_CRC[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h96696996))
    \TX_CRC[10]_i_2
       (.I0(p_21_in[1]),
        .I1(p_20_in[1]),
        .I2(\TX_CRC[10]_i_4_n_0 ),
        .I3(p_21_in[0]),
        .I4(p_22_in[0]),
        .O(NEXTCRC32_D80189_out));
  LUT5 #(
    .INIT(32'h96696996))
    \TX_CRC[10]_i_3
       (.I0(slv1_out[2]),
        .I1(slv1_out[3]),
        .I2(p_18_in[0]),
        .I3(slv1_out[0]),
        .I4(\TX_CRC[10]_i_5_n_0 ),
        .O(\TX_CRC[10]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h96696996))
    \TX_CRC[10]_i_4
       (.I0(p_1_in128_in),
        .I1(slv1_out[5]),
        .I2(slv1_out[0]),
        .I3(slv1_out[3]),
        .I4(slv1_out[2]),
        .O(\TX_CRC[10]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h96696996))
    \TX_CRC[10]_i_5
       (.I0(slv1_out[5]),
        .I1(p_1_in128_in),
        .I2(p_16_in[1]),
        .I3(p_17_in[1]),
        .I4(p_17_in[0]),
        .O(\TX_CRC[10]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hF0660F990F99F066))
    \TX_CRC[11]_i_1
       (.I0(p_21_in[0]),
        .I1(\TX_CRC[11]_i_2_n_0 ),
        .I2(\TX_CRC[11]_i_3_n_0 ),
        .I3(\TX_PHY_STATE_reg_n_0_[2] ),
        .I4(p_1_in130_in),
        .I5(slv1_out[4]),
        .O(\TX_CRC[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[11]_i_2
       (.I0(p_22_in[1]),
        .I1(p_20_in[1]),
        .I2(slv1_out[0]),
        .I3(slv1_out[1]),
        .I4(slv1_out[3]),
        .I5(p_20_in[0]),
        .O(\TX_CRC[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[11]_i_3
       (.I0(p_16_in[1]),
        .I1(p_17_in[0]),
        .I2(slv1_out[0]),
        .I3(p_16_in[0]),
        .I4(slv1_out[1]),
        .I5(\TX_CRC[11]_i_4_n_0 ),
        .O(\TX_CRC[11]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6))
    \TX_CRC[11]_i_4
       (.I0(slv1_out[3]),
        .I1(p_18_in[1]),
        .O(\TX_CRC[11]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h960096FF96FF9600))
    \TX_CRC[12]_i_1
       (.I0(\TX_CRC[12]_i_2_n_0 ),
        .I1(\TX_CRC[12]_i_3_n_0 ),
        .I2(\TX_CRC[12]_i_4_n_0 ),
        .I3(\TX_PHY_STATE_reg_n_0_[2] ),
        .I4(\TX_CRC[12]_i_5_n_0 ),
        .I5(\TX_CRC[12]_i_6_n_0 ),
        .O(\TX_CRC[12]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6))
    \TX_CRC[12]_i_2
       (.I0(p_18_in[0]),
        .I1(p_16_in[0]),
        .O(\TX_CRC[12]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6))
    \TX_CRC[12]_i_3
       (.I0(p_16_in[1]),
        .I1(p_0_in66_in),
        .O(\TX_CRC[12]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h96696996))
    \TX_CRC[12]_i_4
       (.I0(p_17_in[1]),
        .I1(p_1_in132_in),
        .I2(slv1_out[5]),
        .I3(p_18_in[1]),
        .I4(\TX_CRC[12]_i_7_n_0 ),
        .O(\TX_CRC[12]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6))
    \TX_CRC[12]_i_5
       (.I0(p_22_in[0]),
        .I1(p_20_in[0]),
        .O(\TX_CRC[12]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[12]_i_6
       (.I0(\TX_CRC[2]_i_4_n_0 ),
        .I1(p_20_in[1]),
        .I2(\TX_CRC[12]_i_7_n_0 ),
        .I3(slv1_out[5]),
        .I4(p_1_in132_in),
        .I5(p_22_in[1]),
        .O(\TX_CRC[12]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h96696996))
    \TX_CRC[12]_i_7
       (.I0(slv1_out[6]),
        .I1(slv1_out[2]),
        .I2(slv1_out[0]),
        .I3(slv1_out[1]),
        .I4(slv1_out[4]),
        .O(\TX_CRC[12]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[13]_i_2
       (.I0(\TX_CRC[2]_i_4_n_0 ),
        .I1(p_20_in[0]),
        .I2(p_22_in[0]),
        .I3(\TX_CRC[13]_i_4_n_0 ),
        .I4(p_21_in[0]),
        .I5(TX_MEMORY_reg_n_59),
        .O(NEXTCRC32_D80195_out));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[13]_i_3
       (.I0(\TX_CRC[13]_i_5_n_0 ),
        .I1(TX_MEMORY_reg_n_67),
        .I2(p_18_in[0]),
        .I3(\TX_CRC[13]_i_4_n_0 ),
        .I4(p_0_in66_in),
        .I5(p_16_in[0]),
        .O(\TX_CRC[13]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h96696996))
    \TX_CRC[13]_i_4
       (.I0(\TX_CRC[3]_i_4_n_0 ),
        .I1(slv1_out[1]),
        .I2(slv1_out[5]),
        .I3(slv1_out[6]),
        .I4(p_1_in133_in),
        .O(\TX_CRC[13]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6))
    \TX_CRC[13]_i_5
       (.I0(p_17_in[0]),
        .I1(p_17_in[1]),
        .O(\TX_CRC[13]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[14]_i_2
       (.I0(p_21_in[1]),
        .I1(p_0_in167_in),
        .I2(p_21_in[0]),
        .I3(\TX_CRC[14]_i_4_n_0 ),
        .I4(TX_MEMORY_reg_n_59),
        .I5(p_22_in[1]),
        .O(\TX_CRC[14]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[14]_i_3
       (.I0(p_18_in[1]),
        .I1(slv1_out[3]),
        .I2(p_17_in[1]),
        .I3(\TX_CRC[14]_i_5_n_0 ),
        .I4(TX_MEMORY_reg_n_67),
        .I5(p_0_in66_in),
        .O(\TX_CRC[14]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[14]_i_4
       (.I0(p_1_in135_in),
        .I1(slv1_out[7]),
        .I2(slv1_out[4]),
        .I3(slv1_out[3]),
        .I4(slv1_out[6]),
        .I5(slv1_out[2]),
        .O(\TX_CRC[14]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[14]_i_5
       (.I0(p_17_in[0]),
        .I1(slv1_out[2]),
        .I2(slv1_out[6]),
        .I3(slv1_out[4]),
        .I4(slv1_out[7]),
        .I5(p_1_in135_in),
        .O(\TX_CRC[14]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h9F90606F909F6F60))
    \TX_CRC[15]_i_1
       (.I0(\TX_CRC[15]_i_2_n_0 ),
        .I1(\TX_CRC[15]_i_3_n_0 ),
        .I2(\TX_PHY_STATE_reg_n_0_[2] ),
        .I3(\TX_CRC[15]_i_4_n_0 ),
        .I4(slv1_out[3]),
        .I5(\TX_CRC[15]_i_5_n_0 ),
        .O(\TX_CRC[15]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6))
    \TX_CRC[15]_i_2
       (.I0(p_18_in[1]),
        .I1(slv1_out[4]),
        .O(\TX_CRC[15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[15]_i_3
       (.I0(TX_MEMORY_reg_n_67),
        .I1(p_17_in[0]),
        .I2(slv1_out[5]),
        .I3(p_18_in[0]),
        .I4(slv1_out[7]),
        .I5(p_1_in136_in),
        .O(\TX_CRC[15]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6))
    \TX_CRC[15]_i_4
       (.I0(slv1_out[4]),
        .I1(p_22_in[1]),
        .O(\TX_CRC[15]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[15]_i_5
       (.I0(p_21_in[0]),
        .I1(p_22_in[0]),
        .I2(slv1_out[5]),
        .I3(TX_MEMORY_reg_n_59),
        .I4(slv1_out[7]),
        .I5(p_1_in136_in),
        .O(\TX_CRC[15]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h9F90606F909F6F60))
    \TX_CRC[16]_i_1
       (.I0(p_18_in[1]),
        .I1(\TX_CRC[16]_i_2_n_0 ),
        .I2(\TX_PHY_STATE_reg_n_0_[2] ),
        .I3(slv1_out[4]),
        .I4(slv1_out[0]),
        .I5(\TX_CRC[16]_i_3_n_0 ),
        .O(\TX_CRC[16]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h96696996))
    \TX_CRC[16]_i_2
       (.I0(p_18_in[0]),
        .I1(slv1_out[4]),
        .I2(slv1_out[5]),
        .I3(\TX_CRC_reg_n_0_[8] ),
        .I4(p_16_in[1]),
        .O(\TX_CRC[16]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h96696996))
    \TX_CRC[16]_i_3
       (.I0(p_20_in[1]),
        .I1(p_22_in[1]),
        .I2(p_22_in[0]),
        .I3(slv1_out[5]),
        .I4(\TX_CRC_reg_n_0_[8] ),
        .O(\TX_CRC[16]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[17]_i_2
       (.I0(slv1_out[1]),
        .I1(p_0_in167_in),
        .I2(p_22_in[0]),
        .I3(slv1_out[5]),
        .I4(p_202_in),
        .I5(p_20_in[0]),
        .O(NEXTCRC32_D80203_out));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[17]_i_3
       (.I0(\TX_CRC[17]_i_5_n_0 ),
        .I1(slv1_out[6]),
        .I2(\TX_CRC_reg_n_0_[9] ),
        .I3(slv1_out[5]),
        .I4(slv1_out[1]),
        .I5(p_18_in[0]),
        .O(\TX_CRC[17]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6))
    \TX_CRC[17]_i_4
       (.I0(slv1_out[6]),
        .I1(\TX_CRC_reg_n_0_[9] ),
        .O(p_202_in));
  LUT2 #(
    .INIT(4'h6))
    \TX_CRC[17]_i_5
       (.I0(p_0_in66_in),
        .I1(p_16_in[0]),
        .O(\TX_CRC[17]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[18]_i_2
       (.I0(slv1_out[2]),
        .I1(\TX_CRC[2]_i_4_n_0 ),
        .I2(slv1_out[6]),
        .I3(TX_MEMORY_reg_n_59),
        .I4(\TX_CRC_reg_n_0_[10] ),
        .I5(slv1_out[7]),
        .O(\TX_CRC[18]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[18]_i_3
       (.I0(\TX_CRC[29]_i_5_n_0 ),
        .I1(slv1_out[7]),
        .I2(\TX_CRC_reg_n_0_[10] ),
        .I3(slv1_out[6]),
        .I4(slv1_out[2]),
        .I5(p_17_in[1]),
        .O(\TX_CRC[18]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h8778B44BB44B8778))
    \TX_CRC[19]_i_1
       (.I0(\TX_CRC[19]_i_2_n_0 ),
        .I1(\TX_PHY_STATE_reg_n_0_[2] ),
        .I2(slv1_out[3]),
        .I3(p_206_in),
        .I4(TX_MEMORY_reg_n_59),
        .I5(p_21_in[0]),
        .O(\TX_CRC[19]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6))
    \TX_CRC[19]_i_2
       (.I0(TX_MEMORY_reg_n_67),
        .I1(p_17_in[0]),
        .O(\TX_CRC[19]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6))
    \TX_CRC[19]_i_3
       (.I0(slv1_out[7]),
        .I1(\TX_CRC_reg_n_0_[11] ),
        .O(p_206_in));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[1]_i_2
       (.I0(p_0_in167_in),
        .I1(p_20_in[0]),
        .I2(p_20_in[1]),
        .I3(\TX_CRC[24]_i_4_n_0 ),
        .I4(TX_MEMORY_reg_n_59),
        .I5(p_168_in),
        .O(\TX_CRC[1]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h96696996))
    \TX_CRC[1]_i_3
       (.I0(\TX_CRC[1]_i_5_n_0 ),
        .I1(slv1_out[1]),
        .I2(slv1_out[7]),
        .I3(TX_MEMORY_reg_n_67),
        .I4(slv1_out[0]),
        .O(NEXTCRC32_D8070_out));
  LUT2 #(
    .INIT(4'h6))
    \TX_CRC[1]_i_4
       (.I0(slv1_out[0]),
        .I1(slv1_out[6]),
        .O(p_168_in));
  LUT4 #(
    .INIT(16'h6996))
    \TX_CRC[1]_i_5
       (.I0(p_16_in[0]),
        .I1(slv1_out[6]),
        .I2(p_0_in66_in),
        .I3(p_16_in[1]),
        .O(\TX_CRC[1]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hB84747B8))
    \TX_CRC[20]_i_1
       (.I0(p_18_in[1]),
        .I1(\TX_PHY_STATE_reg_n_0_[2] ),
        .I2(p_22_in[1]),
        .I3(slv1_out[4]),
        .I4(\TX_CRC_reg_n_0_[12] ),
        .O(\TX_CRC[20]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB84747B8))
    \TX_CRC[21]_i_1
       (.I0(p_18_in[0]),
        .I1(\TX_PHY_STATE_reg_n_0_[2] ),
        .I2(p_22_in[0]),
        .I3(\TX_CRC_reg_n_0_[13] ),
        .I4(slv1_out[5]),
        .O(\TX_CRC[21]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB84747B8))
    \TX_CRC[22]_i_1
       (.I0(p_16_in[1]),
        .I1(\TX_PHY_STATE_reg_n_0_[2] ),
        .I2(p_20_in[1]),
        .I3(\TX_CRC_reg_n_0_[14] ),
        .I4(slv1_out[0]),
        .O(\TX_CRC[22]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[23]_i_2
       (.I0(p_20_in[1]),
        .I1(slv1_out[0]),
        .I2(p_20_in[0]),
        .I3(p_0_in167_in),
        .I4(p_214_in),
        .I5(slv1_out[6]),
        .O(\TX_CRC[23]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[23]_i_3
       (.I0(\TX_CRC[12]_i_3_n_0 ),
        .I1(slv1_out[6]),
        .I2(p_16_in[0]),
        .I3(slv1_out[0]),
        .I4(slv1_out[1]),
        .I5(\TX_CRC_reg_n_0_[15] ),
        .O(NEXTCRC32_D80108_out));
  LUT2 #(
    .INIT(4'h6))
    \TX_CRC[23]_i_4
       (.I0(slv1_out[1]),
        .I1(\TX_CRC_reg_n_0_[15] ),
        .O(p_214_in));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[24]_i_2
       (.I0(\TX_CRC[24]_i_4_n_0 ),
        .I1(TX_MEMORY_reg_n_59),
        .I2(slv1_out[2]),
        .I3(\TX_CRC_reg_n_0_[16] ),
        .I4(p_20_in[0]),
        .I5(p_21_in[1]),
        .O(NEXTCRC32_D80217_out));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[24]_i_3
       (.I0(TX_MEMORY_reg_n_67),
        .I1(p_16_in[0]),
        .I2(\TX_CRC_reg_n_0_[16] ),
        .I3(slv1_out[2]),
        .I4(slv1_out[7]),
        .I5(\TX_CRC[24]_i_5_n_0 ),
        .O(\TX_CRC[24]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6))
    \TX_CRC[24]_i_4
       (.I0(slv1_out[7]),
        .I1(slv1_out[1]),
        .O(\TX_CRC[24]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6))
    \TX_CRC[24]_i_5
       (.I0(slv1_out[1]),
        .I1(p_17_in[1]),
        .O(\TX_CRC[24]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h96696996))
    \TX_CRC[25]_i_2
       (.I0(slv1_out[3]),
        .I1(\TX_CRC_reg_n_0_[17] ),
        .I2(slv1_out[2]),
        .I3(p_21_in[1]),
        .I4(p_21_in[0]),
        .O(\TX_CRC[25]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h96696996))
    \TX_CRC[25]_i_3
       (.I0(slv1_out[2]),
        .I1(p_17_in[1]),
        .I2(slv1_out[3]),
        .I3(\TX_CRC_reg_n_0_[17] ),
        .I4(p_17_in[0]),
        .O(\TX_CRC[25]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h6996FFFF69960000))
    \TX_CRC[26]_i_1
       (.I0(p_16_in[1]),
        .I1(\TX_CRC[26]_i_2_n_0 ),
        .I2(p_0_in66_in),
        .I3(p_17_in[0]),
        .I4(\TX_PHY_STATE_reg_n_0_[2] ),
        .I5(\TX_CRC[26]_i_3_n_0 ),
        .O(\TX_CRC[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[26]_i_2
       (.I0(p_18_in[1]),
        .I1(slv1_out[6]),
        .I2(slv1_out[3]),
        .I3(slv1_out[0]),
        .I4(\TX_CRC_reg_n_0_[18] ),
        .I5(slv1_out[4]),
        .O(\TX_CRC[26]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h6996))
    \TX_CRC[26]_i_3
       (.I0(p_0_in167_in),
        .I1(p_20_in[1]),
        .I2(\TX_CRC[26]_i_4_n_0 ),
        .I3(p_22_in[1]),
        .O(\TX_CRC[26]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[26]_i_4
       (.I0(p_21_in[0]),
        .I1(slv1_out[6]),
        .I2(slv1_out[3]),
        .I3(slv1_out[0]),
        .I4(\TX_CRC_reg_n_0_[18] ),
        .I5(slv1_out[4]),
        .O(\TX_CRC[26]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[27]_i_2
       (.I0(p_22_in[1]),
        .I1(slv1_out[1]),
        .I2(\TX_CRC[12]_i_5_n_0 ),
        .I3(\TX_CRC[27]_i_4_n_0 ),
        .I4(p_222_in),
        .I5(TX_MEMORY_reg_n_59),
        .O(\TX_CRC[27]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[27]_i_3
       (.I0(slv1_out[1]),
        .I1(\TX_CRC[12]_i_2_n_0 ),
        .I2(p_18_in[1]),
        .I3(\TX_CRC[27]_i_4_n_0 ),
        .I4(TX_MEMORY_reg_n_67),
        .I5(p_222_in),
        .O(\TX_CRC[27]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6))
    \TX_CRC[27]_i_4
       (.I0(slv1_out[7]),
        .I1(slv1_out[4]),
        .O(\TX_CRC[27]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6))
    \TX_CRC[27]_i_5
       (.I0(slv1_out[5]),
        .I1(\TX_CRC_reg_n_0_[19] ),
        .O(p_222_in));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[28]_i_2
       (.I0(slv1_out[2]),
        .I1(p_0_in167_in),
        .I2(p_22_in[0]),
        .I3(slv1_out[5]),
        .I4(p_224_in),
        .I5(p_21_in[1]),
        .O(\TX_CRC[28]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[28]_i_3
       (.I0(slv1_out[2]),
        .I1(slv1_out[5]),
        .I2(p_18_in[0]),
        .I3(p_17_in[1]),
        .I4(p_0_in66_in),
        .I5(p_224_in),
        .O(\TX_CRC[28]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6))
    \TX_CRC[28]_i_4
       (.I0(slv1_out[6]),
        .I1(\TX_CRC_reg_n_0_[20] ),
        .O(p_224_in));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[29]_i_2
       (.I0(\TX_CRC[29]_i_4_n_0 ),
        .I1(p_0_in167_in),
        .I2(p_21_in[0]),
        .I3(\TX_CRC_reg_n_0_[21] ),
        .I4(slv1_out[7]),
        .I5(TX_MEMORY_reg_n_59),
        .O(\TX_CRC[29]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[29]_i_3
       (.I0(slv1_out[6]),
        .I1(\TX_CRC[29]_i_5_n_0 ),
        .I2(slv1_out[3]),
        .I3(p_17_in[0]),
        .I4(\TX_CRC_reg_n_0_[21] ),
        .I5(slv1_out[7]),
        .O(\TX_CRC[29]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6))
    \TX_CRC[29]_i_4
       (.I0(slv1_out[3]),
        .I1(slv1_out[6]),
        .O(\TX_CRC[29]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6))
    \TX_CRC[29]_i_5
       (.I0(TX_MEMORY_reg_n_67),
        .I1(p_0_in66_in),
        .O(\TX_CRC[29]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h4B78784B784B4B78))
    \TX_CRC[2]_i_1
       (.I0(\TX_CRC[2]_i_2_n_0 ),
        .I1(\TX_PHY_STATE_reg_n_0_[2] ),
        .I2(slv1_out[0]),
        .I3(\TX_CRC[2]_i_3_n_0 ),
        .I4(p_20_in[0]),
        .I5(\TX_CRC[2]_i_4_n_0 ),
        .O(\TX_CRC[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[2]_i_2
       (.I0(p_0_in66_in),
        .I1(p_16_in[0]),
        .I2(TX_MEMORY_reg_n_67),
        .I3(\TX_CRC[2]_i_5_n_0 ),
        .I4(p_16_in[1]),
        .I5(p_17_in[1]),
        .O(\TX_CRC[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[2]_i_3
       (.I0(p_20_in[1]),
        .I1(TX_MEMORY_reg_n_59),
        .I2(slv1_out[2]),
        .I3(slv1_out[1]),
        .I4(slv1_out[7]),
        .I5(slv1_out[6]),
        .O(\TX_CRC[2]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6))
    \TX_CRC[2]_i_4
       (.I0(p_0_in167_in),
        .I1(p_21_in[1]),
        .O(\TX_CRC[2]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h6996))
    \TX_CRC[2]_i_5
       (.I0(slv1_out[6]),
        .I1(slv1_out[7]),
        .I2(slv1_out[1]),
        .I3(slv1_out[2]),
        .O(\TX_CRC[2]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h96696996))
    \TX_CRC[30]_i_2
       (.I0(p_22_in[1]),
        .I1(slv1_out[4]),
        .I2(TX_MEMORY_reg_n_59),
        .I3(slv1_out[7]),
        .I4(\TX_CRC_reg_n_0_[22] ),
        .O(\TX_CRC[30]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h96696996))
    \TX_CRC[30]_i_3
       (.I0(slv1_out[4]),
        .I1(p_18_in[1]),
        .I2(slv1_out[7]),
        .I3(\TX_CRC_reg_n_0_[22] ),
        .I4(TX_MEMORY_reg_n_67),
        .O(\TX_CRC[30]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h00000008))
    \TX_CRC[31]_i_1
       (.I0(\TX_PHY_STATE_reg_n_0_[2] ),
        .I1(\TX_PHY_STATE_reg_n_0_[0] ),
        .I2(\TX_PHY_STATE_reg_n_0_[1] ),
        .I3(\TX_PHY_STATE_reg_n_0_[4] ),
        .I4(\TX_PHY_STATE_reg_n_0_[3] ),
        .O(\TX_CRC[31]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h10101000))
    \TX_CRC[31]_i_2
       (.I0(\TX_PHY_STATE_reg_n_0_[4] ),
        .I1(\TX_PHY_STATE_reg_n_0_[1] ),
        .I2(\TX_PHY_STATE_reg_n_0_[0] ),
        .I3(\TX_PHY_STATE_reg_n_0_[2] ),
        .I4(\TX_PHY_STATE_reg_n_0_[3] ),
        .O(\TX_CRC[31]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB84747B8))
    \TX_CRC[31]_i_3
       (.I0(p_18_in[0]),
        .I1(\TX_PHY_STATE_reg_n_0_[2] ),
        .I2(p_22_in[0]),
        .I3(\TX_CRC_reg_n_0_[23] ),
        .I4(slv1_out[5]),
        .O(\TX_CRC[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[3]_i_2
       (.I0(p_21_in[1]),
        .I1(TX_MEMORY_reg_n_59),
        .I2(p_21_in[0]),
        .I3(\TX_CRC[3]_i_4_n_0 ),
        .I4(slv1_out[1]),
        .I5(p_20_in[0]),
        .O(NEXTCRC32_D80177_out));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[3]_i_3
       (.I0(TX_MEMORY_reg_n_67),
        .I1(p_16_in[0]),
        .I2(p_17_in[0]),
        .I3(\TX_CRC[3]_i_4_n_0 ),
        .I4(slv1_out[1]),
        .I5(p_17_in[1]),
        .O(\TX_CRC[3]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h96))
    \TX_CRC[3]_i_4
       (.I0(slv1_out[7]),
        .I1(slv1_out[2]),
        .I2(slv1_out[3]),
        .O(\TX_CRC[3]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h96696996))
    \TX_CRC[4]_i_2
       (.I0(p_21_in[1]),
        .I1(p_0_in167_in),
        .I2(\TX_CRC[4]_i_4_n_0 ),
        .I3(p_22_in[1]),
        .I4(p_21_in[0]),
        .O(\TX_CRC[4]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h96696996))
    \TX_CRC[4]_i_3
       (.I0(slv1_out[4]),
        .I1(slv1_out[3]),
        .I2(slv1_out[0]),
        .I3(p_18_in[1]),
        .I4(\TX_CRC[4]_i_5_n_0 ),
        .O(\TX_CRC[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[4]_i_4
       (.I0(p_20_in[1]),
        .I1(slv1_out[2]),
        .I2(slv1_out[6]),
        .I3(slv1_out[3]),
        .I4(slv1_out[0]),
        .I5(slv1_out[4]),
        .O(\TX_CRC[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[4]_i_5
       (.I0(p_17_in[1]),
        .I1(slv1_out[6]),
        .I2(slv1_out[2]),
        .I3(p_17_in[0]),
        .I4(p_16_in[1]),
        .I5(p_0_in66_in),
        .O(\TX_CRC[4]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h96696996))
    \TX_CRC[5]_i_2
       (.I0(p_0_in167_in),
        .I1(p_20_in[1]),
        .I2(\TX_CRC[5]_i_4_n_0 ),
        .I3(p_21_in[0]),
        .I4(p_22_in[0]),
        .O(NEXTCRC32_D80181_out));
  LUT5 #(
    .INIT(32'h96696996))
    \TX_CRC[5]_i_3
       (.I0(TX_MEMORY_reg_n_67),
        .I1(p_17_in[0]),
        .I2(p_16_in[1]),
        .I3(p_0_in66_in),
        .I4(\TX_CRC[5]_i_5_n_0 ),
        .O(NEXTCRC32_D8074_out));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[5]_i_4
       (.I0(p_20_in[0]),
        .I1(TX_MEMORY_reg_n_59),
        .I2(\TX_CRC[5]_i_6_n_0 ),
        .I3(slv1_out[1]),
        .I4(\TX_CRC[27]_i_4_n_0 ),
        .I5(p_22_in[1]),
        .O(\TX_CRC[5]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[5]_i_5
       (.I0(\TX_CRC[12]_i_2_n_0 ),
        .I1(slv1_out[1]),
        .I2(slv1_out[4]),
        .I3(slv1_out[7]),
        .I4(\TX_CRC[5]_i_6_n_0 ),
        .I5(p_18_in[1]),
        .O(\TX_CRC[5]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h6996))
    \TX_CRC[5]_i_6
       (.I0(slv1_out[0]),
        .I1(slv1_out[5]),
        .I2(slv1_out[6]),
        .I3(slv1_out[3]),
        .O(\TX_CRC[5]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[6]_i_2
       (.I0(p_20_in[0]),
        .I1(p_22_in[0]),
        .I2(p_22_in[1]),
        .I3(\TX_CRC[6]_i_4_n_0 ),
        .I4(TX_MEMORY_reg_n_59),
        .I5(\TX_CRC[2]_i_4_n_0 ),
        .O(\TX_CRC[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[6]_i_3
       (.I0(p_18_in[0]),
        .I1(p_16_in[0]),
        .I2(slv1_out[2]),
        .I3(slv1_out[6]),
        .I4(p_17_in[1]),
        .I5(\TX_CRC[6]_i_5_n_0 ),
        .O(\TX_CRC[6]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[6]_i_4
       (.I0(slv1_out[4]),
        .I1(slv1_out[7]),
        .I2(slv1_out[1]),
        .I3(slv1_out[5]),
        .I4(slv1_out[6]),
        .I5(slv1_out[2]),
        .O(\TX_CRC[6]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[6]_i_5
       (.I0(p_0_in66_in),
        .I1(TX_MEMORY_reg_n_67),
        .I2(\TX_CRC[27]_i_4_n_0 ),
        .I3(slv1_out[5]),
        .I4(slv1_out[1]),
        .I5(p_18_in[1]),
        .O(\TX_CRC[6]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h690096FF69FF9600))
    \TX_CRC[7]_i_1
       (.I0(slv1_out[5]),
        .I1(p_18_in[0]),
        .I2(\TX_CRC[7]_i_2_n_0 ),
        .I3(\TX_PHY_STATE_reg_n_0_[2] ),
        .I4(\TX_CRC[7]_i_3_n_0 ),
        .I5(\TX_CRC[7]_i_4_n_0 ),
        .O(\TX_CRC[7]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h6996))
    \TX_CRC[7]_i_2
       (.I0(TX_MEMORY_reg_n_67),
        .I1(p_16_in[1]),
        .I2(p_17_in[1]),
        .I3(p_17_in[0]),
        .O(\TX_CRC[7]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h6996))
    \TX_CRC[7]_i_3
       (.I0(slv1_out[3]),
        .I1(slv1_out[2]),
        .I2(slv1_out[7]),
        .I3(slv1_out[0]),
        .O(\TX_CRC[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[7]_i_4
       (.I0(p_20_in[1]),
        .I1(p_21_in[1]),
        .I2(slv1_out[5]),
        .I3(TX_MEMORY_reg_n_59),
        .I4(p_21_in[0]),
        .I5(p_22_in[0]),
        .O(\TX_CRC[7]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hF0660F990F99F066))
    \TX_CRC[8]_i_1
       (.I0(p_21_in[0]),
        .I1(\TX_CRC[11]_i_2_n_0 ),
        .I2(\TX_CRC[11]_i_3_n_0 ),
        .I3(\TX_PHY_STATE_reg_n_0_[2] ),
        .I4(\TX_CRC_reg_n_0_[0] ),
        .I5(slv1_out[4]),
        .O(\TX_CRC[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8BB8B88BB88B8BB8))
    \TX_CRC[9]_i_1
       (.I0(\TX_CRC[9]_i_2_n_0 ),
        .I1(\TX_PHY_STATE_reg_n_0_[2] ),
        .I2(p_22_in[1]),
        .I3(slv1_out[1]),
        .I4(slv1_out[4]),
        .I5(\TX_CRC[9]_i_3_n_0 ),
        .O(\TX_CRC[9]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h96696996))
    \TX_CRC[9]_i_2
       (.I0(p_18_in[0]),
        .I1(p_16_in[0]),
        .I2(slv1_out[5]),
        .I3(p_1_in126_in),
        .I4(\TX_CRC[9]_i_4_n_0 ),
        .O(\TX_CRC[9]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6996966996696996))
    \TX_CRC[9]_i_3
       (.I0(p_22_in[0]),
        .I1(p_20_in[0]),
        .I2(slv1_out[2]),
        .I3(p_21_in[1]),
        .I4(slv1_out[5]),
        .I5(p_1_in126_in),
        .O(\TX_CRC[9]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h96696996))
    \TX_CRC[9]_i_4
       (.I0(slv1_out[2]),
        .I1(p_17_in[1]),
        .I2(slv1_out[4]),
        .I3(slv1_out[1]),
        .I4(p_18_in[1]),
        .O(\TX_CRC[9]_i_4_n_0 ));
  FDSE \TX_CRC_reg[0]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_CRC[31]_i_2_n_0 ),
        .D(\TX_CRC[0]_i_1_n_0 ),
        .Q(\TX_CRC_reg_n_0_[0] ),
        .S(\TX_CRC[31]_i_1_n_0 ));
  FDSE \TX_CRC_reg[10]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_CRC[31]_i_2_n_0 ),
        .D(\TX_CRC_reg[10]_i_1_n_0 ),
        .Q(\TX_CRC_reg_n_0_[10] ),
        .S(\TX_CRC[31]_i_1_n_0 ));
  MUXF7 \TX_CRC_reg[10]_i_1
       (.I0(NEXTCRC32_D80189_out),
        .I1(\TX_CRC[10]_i_3_n_0 ),
        .O(\TX_CRC_reg[10]_i_1_n_0 ),
        .S(\TX_PHY_STATE_reg_n_0_[2] ));
  FDSE \TX_CRC_reg[11]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_CRC[31]_i_2_n_0 ),
        .D(\TX_CRC[11]_i_1_n_0 ),
        .Q(\TX_CRC_reg_n_0_[11] ),
        .S(\TX_CRC[31]_i_1_n_0 ));
  FDSE \TX_CRC_reg[12]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_CRC[31]_i_2_n_0 ),
        .D(\TX_CRC[12]_i_1_n_0 ),
        .Q(\TX_CRC_reg_n_0_[12] ),
        .S(\TX_CRC[31]_i_1_n_0 ));
  FDSE \TX_CRC_reg[13]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_CRC[31]_i_2_n_0 ),
        .D(\TX_CRC_reg[13]_i_1_n_0 ),
        .Q(\TX_CRC_reg_n_0_[13] ),
        .S(\TX_CRC[31]_i_1_n_0 ));
  MUXF7 \TX_CRC_reg[13]_i_1
       (.I0(NEXTCRC32_D80195_out),
        .I1(\TX_CRC[13]_i_3_n_0 ),
        .O(\TX_CRC_reg[13]_i_1_n_0 ),
        .S(\TX_PHY_STATE_reg_n_0_[2] ));
  FDSE \TX_CRC_reg[14]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_CRC[31]_i_2_n_0 ),
        .D(\TX_CRC_reg[14]_i_1_n_0 ),
        .Q(\TX_CRC_reg_n_0_[14] ),
        .S(\TX_CRC[31]_i_1_n_0 ));
  MUXF7 \TX_CRC_reg[14]_i_1
       (.I0(\TX_CRC[14]_i_2_n_0 ),
        .I1(\TX_CRC[14]_i_3_n_0 ),
        .O(\TX_CRC_reg[14]_i_1_n_0 ),
        .S(\TX_PHY_STATE_reg_n_0_[2] ));
  FDSE \TX_CRC_reg[15]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_CRC[31]_i_2_n_0 ),
        .D(\TX_CRC[15]_i_1_n_0 ),
        .Q(\TX_CRC_reg_n_0_[15] ),
        .S(\TX_CRC[31]_i_1_n_0 ));
  FDSE \TX_CRC_reg[16]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_CRC[31]_i_2_n_0 ),
        .D(\TX_CRC[16]_i_1_n_0 ),
        .Q(\TX_CRC_reg_n_0_[16] ),
        .S(\TX_CRC[31]_i_1_n_0 ));
  FDSE \TX_CRC_reg[17]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_CRC[31]_i_2_n_0 ),
        .D(\TX_CRC_reg[17]_i_1_n_0 ),
        .Q(\TX_CRC_reg_n_0_[17] ),
        .S(\TX_CRC[31]_i_1_n_0 ));
  MUXF7 \TX_CRC_reg[17]_i_1
       (.I0(NEXTCRC32_D80203_out),
        .I1(\TX_CRC[17]_i_3_n_0 ),
        .O(\TX_CRC_reg[17]_i_1_n_0 ),
        .S(\TX_PHY_STATE_reg_n_0_[2] ));
  FDSE \TX_CRC_reg[18]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_CRC[31]_i_2_n_0 ),
        .D(\TX_CRC_reg[18]_i_1_n_0 ),
        .Q(\TX_CRC_reg_n_0_[18] ),
        .S(\TX_CRC[31]_i_1_n_0 ));
  MUXF7 \TX_CRC_reg[18]_i_1
       (.I0(\TX_CRC[18]_i_2_n_0 ),
        .I1(\TX_CRC[18]_i_3_n_0 ),
        .O(\TX_CRC_reg[18]_i_1_n_0 ),
        .S(\TX_PHY_STATE_reg_n_0_[2] ));
  FDSE \TX_CRC_reg[19]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_CRC[31]_i_2_n_0 ),
        .D(\TX_CRC[19]_i_1_n_0 ),
        .Q(\TX_CRC_reg_n_0_[19] ),
        .S(\TX_CRC[31]_i_1_n_0 ));
  FDSE \TX_CRC_reg[1]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_CRC[31]_i_2_n_0 ),
        .D(\TX_CRC_reg[1]_i_1_n_0 ),
        .Q(p_1_in126_in),
        .S(\TX_CRC[31]_i_1_n_0 ));
  MUXF7 \TX_CRC_reg[1]_i_1
       (.I0(\TX_CRC[1]_i_2_n_0 ),
        .I1(NEXTCRC32_D8070_out),
        .O(\TX_CRC_reg[1]_i_1_n_0 ),
        .S(\TX_PHY_STATE_reg_n_0_[2] ));
  FDSE \TX_CRC_reg[20]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_CRC[31]_i_2_n_0 ),
        .D(\TX_CRC[20]_i_1_n_0 ),
        .Q(\TX_CRC_reg_n_0_[20] ),
        .S(\TX_CRC[31]_i_1_n_0 ));
  FDSE \TX_CRC_reg[21]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_CRC[31]_i_2_n_0 ),
        .D(\TX_CRC[21]_i_1_n_0 ),
        .Q(\TX_CRC_reg_n_0_[21] ),
        .S(\TX_CRC[31]_i_1_n_0 ));
  FDSE \TX_CRC_reg[22]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_CRC[31]_i_2_n_0 ),
        .D(\TX_CRC[22]_i_1_n_0 ),
        .Q(\TX_CRC_reg_n_0_[22] ),
        .S(\TX_CRC[31]_i_1_n_0 ));
  FDSE \TX_CRC_reg[23]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_CRC[31]_i_2_n_0 ),
        .D(\TX_CRC_reg[23]_i_1_n_0 ),
        .Q(\TX_CRC_reg_n_0_[23] ),
        .S(\TX_CRC[31]_i_1_n_0 ));
  MUXF7 \TX_CRC_reg[23]_i_1
       (.I0(\TX_CRC[23]_i_2_n_0 ),
        .I1(NEXTCRC32_D80108_out),
        .O(\TX_CRC_reg[23]_i_1_n_0 ),
        .S(\TX_PHY_STATE_reg_n_0_[2] ));
  FDSE \TX_CRC_reg[24]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_CRC[31]_i_2_n_0 ),
        .D(\TX_CRC_reg[24]_i_1_n_0 ),
        .Q(slv1_out[0]),
        .S(\TX_CRC[31]_i_1_n_0 ));
  MUXF7 \TX_CRC_reg[24]_i_1
       (.I0(NEXTCRC32_D80217_out),
        .I1(\TX_CRC[24]_i_3_n_0 ),
        .O(\TX_CRC_reg[24]_i_1_n_0 ),
        .S(\TX_PHY_STATE_reg_n_0_[2] ));
  FDSE \TX_CRC_reg[25]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_CRC[31]_i_2_n_0 ),
        .D(\TX_CRC_reg[25]_i_1_n_0 ),
        .Q(slv1_out[1]),
        .S(\TX_CRC[31]_i_1_n_0 ));
  MUXF7 \TX_CRC_reg[25]_i_1
       (.I0(\TX_CRC[25]_i_2_n_0 ),
        .I1(\TX_CRC[25]_i_3_n_0 ),
        .O(\TX_CRC_reg[25]_i_1_n_0 ),
        .S(\TX_PHY_STATE_reg_n_0_[2] ));
  FDSE \TX_CRC_reg[26]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_CRC[31]_i_2_n_0 ),
        .D(\TX_CRC[26]_i_1_n_0 ),
        .Q(slv1_out[2]),
        .S(\TX_CRC[31]_i_1_n_0 ));
  FDSE \TX_CRC_reg[27]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_CRC[31]_i_2_n_0 ),
        .D(\TX_CRC_reg[27]_i_1_n_0 ),
        .Q(slv1_out[3]),
        .S(\TX_CRC[31]_i_1_n_0 ));
  MUXF7 \TX_CRC_reg[27]_i_1
       (.I0(\TX_CRC[27]_i_2_n_0 ),
        .I1(\TX_CRC[27]_i_3_n_0 ),
        .O(\TX_CRC_reg[27]_i_1_n_0 ),
        .S(\TX_PHY_STATE_reg_n_0_[2] ));
  FDSE \TX_CRC_reg[28]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_CRC[31]_i_2_n_0 ),
        .D(\TX_CRC_reg[28]_i_1_n_0 ),
        .Q(slv1_out[4]),
        .S(\TX_CRC[31]_i_1_n_0 ));
  MUXF7 \TX_CRC_reg[28]_i_1
       (.I0(\TX_CRC[28]_i_2_n_0 ),
        .I1(\TX_CRC[28]_i_3_n_0 ),
        .O(\TX_CRC_reg[28]_i_1_n_0 ),
        .S(\TX_PHY_STATE_reg_n_0_[2] ));
  FDSE \TX_CRC_reg[29]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_CRC[31]_i_2_n_0 ),
        .D(\TX_CRC_reg[29]_i_1_n_0 ),
        .Q(slv1_out[5]),
        .S(\TX_CRC[31]_i_1_n_0 ));
  MUXF7 \TX_CRC_reg[29]_i_1
       (.I0(\TX_CRC[29]_i_2_n_0 ),
        .I1(\TX_CRC[29]_i_3_n_0 ),
        .O(\TX_CRC_reg[29]_i_1_n_0 ),
        .S(\TX_PHY_STATE_reg_n_0_[2] ));
  FDSE \TX_CRC_reg[2]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_CRC[31]_i_2_n_0 ),
        .D(\TX_CRC[2]_i_1_n_0 ),
        .Q(p_1_in128_in),
        .S(\TX_CRC[31]_i_1_n_0 ));
  FDSE \TX_CRC_reg[30]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_CRC[31]_i_2_n_0 ),
        .D(\TX_CRC_reg[30]_i_1_n_0 ),
        .Q(slv1_out[6]),
        .S(\TX_CRC[31]_i_1_n_0 ));
  MUXF7 \TX_CRC_reg[30]_i_1
       (.I0(\TX_CRC[30]_i_2_n_0 ),
        .I1(\TX_CRC[30]_i_3_n_0 ),
        .O(\TX_CRC_reg[30]_i_1_n_0 ),
        .S(\TX_PHY_STATE_reg_n_0_[2] ));
  FDSE \TX_CRC_reg[31]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_CRC[31]_i_2_n_0 ),
        .D(\TX_CRC[31]_i_3_n_0 ),
        .Q(slv1_out[7]),
        .S(\TX_CRC[31]_i_1_n_0 ));
  FDSE \TX_CRC_reg[3]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_CRC[31]_i_2_n_0 ),
        .D(\TX_CRC_reg[3]_i_1_n_0 ),
        .Q(p_1_in130_in),
        .S(\TX_CRC[31]_i_1_n_0 ));
  MUXF7 \TX_CRC_reg[3]_i_1
       (.I0(NEXTCRC32_D80177_out),
        .I1(\TX_CRC[3]_i_3_n_0 ),
        .O(\TX_CRC_reg[3]_i_1_n_0 ),
        .S(\TX_PHY_STATE_reg_n_0_[2] ));
  FDSE \TX_CRC_reg[4]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_CRC[31]_i_2_n_0 ),
        .D(\TX_CRC_reg[4]_i_1_n_0 ),
        .Q(p_1_in132_in),
        .S(\TX_CRC[31]_i_1_n_0 ));
  MUXF7 \TX_CRC_reg[4]_i_1
       (.I0(\TX_CRC[4]_i_2_n_0 ),
        .I1(\TX_CRC[4]_i_3_n_0 ),
        .O(\TX_CRC_reg[4]_i_1_n_0 ),
        .S(\TX_PHY_STATE_reg_n_0_[2] ));
  FDSE \TX_CRC_reg[5]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_CRC[31]_i_2_n_0 ),
        .D(\TX_CRC_reg[5]_i_1_n_0 ),
        .Q(p_1_in133_in),
        .S(\TX_CRC[31]_i_1_n_0 ));
  MUXF7 \TX_CRC_reg[5]_i_1
       (.I0(NEXTCRC32_D80181_out),
        .I1(NEXTCRC32_D8074_out),
        .O(\TX_CRC_reg[5]_i_1_n_0 ),
        .S(\TX_PHY_STATE_reg_n_0_[2] ));
  FDSE \TX_CRC_reg[6]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_CRC[31]_i_2_n_0 ),
        .D(\TX_CRC_reg[6]_i_1_n_0 ),
        .Q(p_1_in135_in),
        .S(\TX_CRC[31]_i_1_n_0 ));
  MUXF7 \TX_CRC_reg[6]_i_1
       (.I0(\TX_CRC[6]_i_2_n_0 ),
        .I1(\TX_CRC[6]_i_3_n_0 ),
        .O(\TX_CRC_reg[6]_i_1_n_0 ),
        .S(\TX_PHY_STATE_reg_n_0_[2] ));
  FDSE \TX_CRC_reg[7]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_CRC[31]_i_2_n_0 ),
        .D(\TX_CRC[7]_i_1_n_0 ),
        .Q(p_1_in136_in),
        .S(\TX_CRC[31]_i_1_n_0 ));
  FDSE \TX_CRC_reg[8]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_CRC[31]_i_2_n_0 ),
        .D(\TX_CRC[8]_i_1_n_0 ),
        .Q(\TX_CRC_reg_n_0_[8] ),
        .S(\TX_CRC[31]_i_1_n_0 ));
  FDSE \TX_CRC_reg[9]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_CRC[31]_i_2_n_0 ),
        .D(\TX_CRC[9]_i_1_n_0 ),
        .Q(\TX_CRC_reg_n_0_[9] ),
        .S(\TX_CRC[31]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h02))
    \TX_IN_COUNT[10]_i_1
       (.I0(S_TX_ACK_reg_n_0),
        .I1(\TX_PACKET_STATE_reg_n_0_[1] ),
        .I2(\TX_PACKET_STATE_reg_n_0_[0] ),
        .O(\TX_IN_COUNT[10]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0444))
    \TX_IN_COUNT[10]_i_2
       (.I0(\TX_PACKET_STATE_reg_n_0_[1] ),
        .I1(S_TX_ACK_reg_n_0),
        .I2(\TX_PACKET_STATE_reg_n_0_[0] ),
        .I3(\TX_PACKET_STATE_reg[1]_i_2_n_2 ),
        .O(\TX_IN_COUNT[10]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair161" *)
  LUT5 #(
    .INIT(32'hAAAA6AAA))
    \TX_IN_COUNT[10]_i_3
       (.I0(TX_IN_COUNT[10]),
        .I1(TX_IN_COUNT[9]),
        .I2(TX_IN_COUNT[8]),
        .I3(TX_IN_COUNT[7]),
        .I4(\TX_IN_COUNT[10]_i_4_n_0 ),
        .O(\TX_IN_COUNT[10]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF))
    \TX_IN_COUNT[10]_i_4
       (.I0(TX_IN_COUNT[5]),
        .I1(TX_IN_COUNT[3]),
        .I2(TX_IN_COUNT[1]),
        .I3(TX_IN_COUNT[2]),
        .I4(TX_IN_COUNT[4]),
        .I5(TX_IN_COUNT[6]),
        .O(\TX_IN_COUNT[10]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair166" *)
  LUT5 #(
    .INIT(32'hFFBF0444))
    \TX_IN_COUNT[1]_i_1
       (.I0(\TX_PACKET_STATE_reg_n_0_[1] ),
        .I1(S_TX_ACK_reg_n_0),
        .I2(\TX_PACKET_STATE_reg_n_0_[0] ),
        .I3(\TX_PACKET_STATE_reg[1]_i_2_n_2 ),
        .I4(TX_IN_COUNT[1]),
        .O(\TX_IN_COUNT[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFCFDFCF00002000))
    \TX_IN_COUNT[2]_i_1
       (.I0(TX_IN_COUNT[1]),
        .I1(\TX_PACKET_STATE_reg_n_0_[1] ),
        .I2(S_TX_ACK_reg_n_0),
        .I3(\TX_PACKET_STATE_reg_n_0_[0] ),
        .I4(\TX_PACKET_STATE_reg[1]_i_2_n_2 ),
        .I5(TX_IN_COUNT[2]),
        .O(\TX_IN_COUNT[2]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h6A))
    \TX_IN_COUNT[3]_i_1
       (.I0(TX_IN_COUNT[3]),
        .I1(TX_IN_COUNT[2]),
        .I2(TX_IN_COUNT[1]),
        .O(\TX_IN_COUNT[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair152" *)
  LUT4 #(
    .INIT(16'h6AAA))
    \TX_IN_COUNT[4]_i_1
       (.I0(TX_IN_COUNT[4]),
        .I1(TX_IN_COUNT[3]),
        .I2(TX_IN_COUNT[1]),
        .I3(TX_IN_COUNT[2]),
        .O(\TX_IN_COUNT[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair152" *)
  LUT5 #(
    .INIT(32'h6AAAAAAA))
    \TX_IN_COUNT[5]_i_1
       (.I0(TX_IN_COUNT[5]),
        .I1(TX_IN_COUNT[4]),
        .I2(TX_IN_COUNT[2]),
        .I3(TX_IN_COUNT[1]),
        .I4(TX_IN_COUNT[3]),
        .O(\TX_IN_COUNT[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA))
    \TX_IN_COUNT[6]_i_1
       (.I0(TX_IN_COUNT[6]),
        .I1(TX_IN_COUNT[5]),
        .I2(TX_IN_COUNT[3]),
        .I3(TX_IN_COUNT[1]),
        .I4(TX_IN_COUNT[2]),
        .I5(TX_IN_COUNT[4]),
        .O(\TX_IN_COUNT[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair225" *)
  LUT2 #(
    .INIT(4'h9))
    \TX_IN_COUNT[7]_i_1
       (.I0(TX_IN_COUNT[7]),
        .I1(\TX_IN_COUNT[10]_i_4_n_0 ),
        .O(\TX_IN_COUNT[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair225" *)
  LUT3 #(
    .INIT(8'hA6))
    \TX_IN_COUNT[8]_i_1
       (.I0(TX_IN_COUNT[8]),
        .I1(TX_IN_COUNT[7]),
        .I2(\TX_IN_COUNT[10]_i_4_n_0 ),
        .O(\TX_IN_COUNT[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair161" *)
  LUT4 #(
    .INIT(16'h9AAA))
    \TX_IN_COUNT[9]_i_1
       (.I0(TX_IN_COUNT[9]),
        .I1(\TX_IN_COUNT[10]_i_4_n_0 ),
        .I2(TX_IN_COUNT[7]),
        .I3(TX_IN_COUNT[8]),
        .O(\TX_IN_COUNT[9]_i_1_n_0 ));
  FDRE \TX_IN_COUNT_reg[10]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_IN_COUNT[10]_i_2_n_0 ),
        .D(\TX_IN_COUNT[10]_i_3_n_0 ),
        .Q(TX_IN_COUNT[10]),
        .R(\TX_IN_COUNT[10]_i_1_n_0 ));
  FDRE \TX_IN_COUNT_reg[1]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(\TX_IN_COUNT[1]_i_1_n_0 ),
        .Q(TX_IN_COUNT[1]),
        .R(1'b0));
  FDRE \TX_IN_COUNT_reg[2]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(\TX_IN_COUNT[2]_i_1_n_0 ),
        .Q(TX_IN_COUNT[2]),
        .R(1'b0));
  FDRE \TX_IN_COUNT_reg[3]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_IN_COUNT[10]_i_2_n_0 ),
        .D(\TX_IN_COUNT[3]_i_1_n_0 ),
        .Q(TX_IN_COUNT[3]),
        .R(\TX_IN_COUNT[10]_i_1_n_0 ));
  FDRE \TX_IN_COUNT_reg[4]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_IN_COUNT[10]_i_2_n_0 ),
        .D(\TX_IN_COUNT[4]_i_1_n_0 ),
        .Q(TX_IN_COUNT[4]),
        .R(\TX_IN_COUNT[10]_i_1_n_0 ));
  FDRE \TX_IN_COUNT_reg[5]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_IN_COUNT[10]_i_2_n_0 ),
        .D(\TX_IN_COUNT[5]_i_1_n_0 ),
        .Q(TX_IN_COUNT[5]),
        .R(\TX_IN_COUNT[10]_i_1_n_0 ));
  FDRE \TX_IN_COUNT_reg[6]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_IN_COUNT[10]_i_2_n_0 ),
        .D(\TX_IN_COUNT[6]_i_1_n_0 ),
        .Q(TX_IN_COUNT[6]),
        .R(\TX_IN_COUNT[10]_i_1_n_0 ));
  FDRE \TX_IN_COUNT_reg[7]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_IN_COUNT[10]_i_2_n_0 ),
        .D(\TX_IN_COUNT[7]_i_1_n_0 ),
        .Q(TX_IN_COUNT[7]),
        .R(\TX_IN_COUNT[10]_i_1_n_0 ));
  FDRE \TX_IN_COUNT_reg[8]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_IN_COUNT[10]_i_2_n_0 ),
        .D(\TX_IN_COUNT[8]_i_1_n_0 ),
        .Q(TX_IN_COUNT[8]),
        .R(\TX_IN_COUNT[10]_i_1_n_0 ));
  FDRE \TX_IN_COUNT_reg[9]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_IN_COUNT[10]_i_2_n_0 ),
        .D(\TX_IN_COUNT[9]_i_1_n_0 ),
        .Q(TX_IN_COUNT[9]),
        .R(\TX_IN_COUNT[10]_i_1_n_0 ));
  (* IS_CLOCK_GATED *)
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *)
  (* POWER_OPTED_CE = "ENBWREN=NEW" *)
  (* RTL_RAM_BITS = "16400" *)
  (* RTL_RAM_NAME = "TX_MEMORY" *)
  (* bram_addr_begin = "0" *)
  (* bram_addr_end = "2047" *)
  (* bram_slice_begin = "0" *)
  (* bram_slice_end = "17" *)
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("NO_CHANGE"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18))
    TX_MEMORY_reg
       (.ADDRARDADDR({1'b1,TX_WRITE_ADDRESS_DEL,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,TX_READ_ADDRESS,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b1),
        .CASCADEINB(1'b1),
        .CASCADEOUTA(NLW_TX_MEMORY_reg_CASCADEOUTA_UNCONNECTED),
        .CASCADEOUTB(NLW_TX_MEMORY_reg_CASCADEOUTB_UNCONNECTED),
        .CLKARDCLK(ETH_CLK_OBUF),
        .CLKBWRCLK(ETH_CLK_OBUF),
        .DBITERR(NLW_TX_MEMORY_reg_DBITERR_UNCONNECTED),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(NLW_TX_MEMORY_reg_DOADO_UNCONNECTED[31:0]),
        .DOBDO({NLW_TX_MEMORY_reg_DOBDO_UNCONNECTED[31:16],p_20_in,p_21_in,p_22_in,p_0_in167_in,TX_MEMORY_reg_n_59,p_16_in,p_17_in,p_18_in,p_0_in66_in,TX_MEMORY_reg_n_67}),
        .DOPADOP(NLW_TX_MEMORY_reg_DOPADOP_UNCONNECTED[3:0]),
        .DOPBDOP(NLW_TX_MEMORY_reg_DOPBDOP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_TX_MEMORY_reg_ECCPARITY_UNCONNECTED[7:0]),
        .ENARDEN(TX_WRITE),
        .ENBWREN(TX_MEMORY_reg_ENBWREN_cooolgate_en_sig_9),
        .INJECTDBITERR(NLW_TX_MEMORY_reg_INJECTDBITERR_UNCONNECTED),
        .INJECTSBITERR(NLW_TX_MEMORY_reg_INJECTSBITERR_UNCONNECTED),
        .RDADDRECC(NLW_TX_MEMORY_reg_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(NLW_TX_MEMORY_reg_REGCEAREGCE_UNCONNECTED),
        .REGCEB(NLW_TX_MEMORY_reg_REGCEB_UNCONNECTED),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_TX_MEMORY_reg_SBITERR_UNCONNECTED),
        .WEA({1'b0,1'b0,1'b1,1'b1}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  LUT4 #(
    .INIT(16'hff35))
    TX_MEMORY_reg_ENBWREN_cooolgate_en_gate_17
       (.I0(\TX_PHY_STATE_reg_n_0_[4] ),
        .I1(\TX_PHY_STATE[4]_i_2_n_0 ),
        .I2(\TX_PHY_STATE[4]_i_1_n_0 ),
        .I3(INTERNAL_RST_reg),
        .O(TX_MEMORY_reg_ENBWREN_cooolgate_en_sig_9));
  (* SOFT_HLUTNM = "soft_lutpair220" *)
  LUT2 #(
    .INIT(4'h7))
    \TX_OUT_COUNT[0]_i_1
       (.I0(\TX_OUT_COUNT_reg_n_0_[0] ),
        .I1(\TX_PHY_STATE_reg_n_0_[3] ),
        .O(TX_OUT_COUNT0_in));
  LUT6 #(
    .INIT(64'h00000000AA100010))
    \TX_OUT_COUNT[10]_i_1
       (.I0(\TX_PHY_STATE_reg_n_0_[3] ),
        .I1(\TX_PHY_STATE_reg_n_0_[2] ),
        .I2(GO_SYNC),
        .I3(\TX_PHY_STATE_reg_n_0_[0] ),
        .I4(\TX_OUT_COUNT[10]_i_3_n_0 ),
        .I5(\TX_OUT_COUNT[10]_i_4_n_0 ),
        .O(\TX_OUT_COUNT[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair216" *)
  LUT4 #(
    .INIT(16'hE133))
    \TX_OUT_COUNT[10]_i_2
       (.I0(\TX_OUT_COUNT_reg_n_0_[9] ),
        .I1(\TX_OUT_COUNT[10]_i_5_n_0 ),
        .I2(\TX_OUT_COUNT_reg_n_0_[10] ),
        .I3(\TX_PHY_STATE_reg_n_0_[3] ),
        .O(\TX_OUT_COUNT[10]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFF7F))
    \TX_OUT_COUNT[10]_i_3
       (.I0(\TX_OUT_COUNT[10]_i_6_n_0 ),
        .I1(\TX_OUT_COUNT[10]_i_7_n_0 ),
        .I2(\TX_OUT_COUNT[10]_i_8_n_0 ),
        .I3(\TX_OUT_COUNT_reg_n_0_[0] ),
        .I4(\TX_OUT_COUNT_reg_n_0_[1] ),
        .I5(\TX_OUT_COUNT_reg_n_0_[2] ),
        .O(\TX_OUT_COUNT[10]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'hE))
    \TX_OUT_COUNT[10]_i_4
       (.I0(\TX_PHY_STATE_reg_n_0_[1] ),
        .I1(\TX_PHY_STATE_reg_n_0_[4] ),
        .O(\TX_OUT_COUNT[10]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFEF0F0F0F0))
    \TX_OUT_COUNT[10]_i_5
       (.I0(\TX_OUT_COUNT_reg_n_0_[7] ),
        .I1(\TX_OUT_COUNT_reg_n_0_[5] ),
        .I2(\TX_OUT_COUNT[8]_i_2_n_0 ),
        .I3(\TX_OUT_COUNT_reg_n_0_[6] ),
        .I4(\TX_OUT_COUNT_reg_n_0_[8] ),
        .I5(\TX_PHY_STATE_reg_n_0_[3] ),
        .O(\TX_OUT_COUNT[10]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h01))
    \TX_OUT_COUNT[10]_i_6
       (.I0(\TX_OUT_COUNT_reg_n_0_[3] ),
        .I1(\TX_OUT_COUNT_reg_n_0_[4] ),
        .I2(\TX_OUT_COUNT_reg_n_0_[5] ),
        .O(\TX_OUT_COUNT[10]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h1))
    \TX_OUT_COUNT[10]_i_7
       (.I0(\TX_OUT_COUNT_reg_n_0_[10] ),
        .I1(\TX_OUT_COUNT_reg_n_0_[9] ),
        .O(\TX_OUT_COUNT[10]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h01))
    \TX_OUT_COUNT[10]_i_8
       (.I0(\TX_OUT_COUNT_reg_n_0_[6] ),
        .I1(\TX_OUT_COUNT_reg_n_0_[8] ),
        .I2(\TX_OUT_COUNT_reg_n_0_[7] ),
        .O(\TX_OUT_COUNT[10]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair220" *)
  LUT3 #(
    .INIT(8'h9F))
    \TX_OUT_COUNT[1]_i_1
       (.I0(\TX_OUT_COUNT_reg_n_0_[0] ),
        .I1(\TX_OUT_COUNT_reg_n_0_[1] ),
        .I2(\TX_PHY_STATE_reg_n_0_[3] ),
        .O(\TX_OUT_COUNT[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair156" *)
  LUT4 #(
    .INIT(16'hE1FF))
    \TX_OUT_COUNT[2]_i_1
       (.I0(\TX_OUT_COUNT_reg_n_0_[1] ),
        .I1(\TX_OUT_COUNT_reg_n_0_[0] ),
        .I2(\TX_OUT_COUNT_reg_n_0_[2] ),
        .I3(\TX_PHY_STATE_reg_n_0_[3] ),
        .O(\TX_OUT_COUNT[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair156" *)
  LUT5 #(
    .INIT(32'hFE01FFFF))
    \TX_OUT_COUNT[3]_i_1
       (.I0(\TX_OUT_COUNT_reg_n_0_[2] ),
        .I1(\TX_OUT_COUNT_reg_n_0_[0] ),
        .I2(\TX_OUT_COUNT_reg_n_0_[1] ),
        .I3(\TX_OUT_COUNT_reg_n_0_[3] ),
        .I4(\TX_PHY_STATE_reg_n_0_[3] ),
        .O(\TX_OUT_COUNT[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFE0001FFFFFFFF))
    \TX_OUT_COUNT[4]_i_1
       (.I0(\TX_OUT_COUNT_reg_n_0_[3] ),
        .I1(\TX_OUT_COUNT_reg_n_0_[1] ),
        .I2(\TX_OUT_COUNT_reg_n_0_[0] ),
        .I3(\TX_OUT_COUNT_reg_n_0_[2] ),
        .I4(\TX_OUT_COUNT_reg_n_0_[4] ),
        .I5(\TX_PHY_STATE_reg_n_0_[3] ),
        .O(\TX_OUT_COUNT[4]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h95))
    \TX_OUT_COUNT[5]_i_1
       (.I0(\TX_OUT_COUNT[8]_i_2_n_0 ),
        .I1(\TX_OUT_COUNT_reg_n_0_[5] ),
        .I2(\TX_PHY_STATE_reg_n_0_[3] ),
        .O(\TX_OUT_COUNT[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair162" *)
  LUT4 #(
    .INIT(16'hE133))
    \TX_OUT_COUNT[6]_i_1
       (.I0(\TX_OUT_COUNT_reg_n_0_[5] ),
        .I1(\TX_OUT_COUNT[8]_i_2_n_0 ),
        .I2(\TX_OUT_COUNT_reg_n_0_[6] ),
        .I3(\TX_PHY_STATE_reg_n_0_[3] ),
        .O(\TX_OUT_COUNT[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair162" *)
  LUT5 #(
    .INIT(32'hFE013333))
    \TX_OUT_COUNT[7]_i_1
       (.I0(\TX_OUT_COUNT_reg_n_0_[6] ),
        .I1(\TX_OUT_COUNT[8]_i_2_n_0 ),
        .I2(\TX_OUT_COUNT_reg_n_0_[5] ),
        .I3(\TX_OUT_COUNT_reg_n_0_[7] ),
        .I4(\TX_PHY_STATE_reg_n_0_[3] ),
        .O(\TX_OUT_COUNT[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFE00010F0F0F0F))
    \TX_OUT_COUNT[8]_i_1
       (.I0(\TX_OUT_COUNT_reg_n_0_[7] ),
        .I1(\TX_OUT_COUNT_reg_n_0_[5] ),
        .I2(\TX_OUT_COUNT[8]_i_2_n_0 ),
        .I3(\TX_OUT_COUNT_reg_n_0_[6] ),
        .I4(\TX_OUT_COUNT_reg_n_0_[8] ),
        .I5(\TX_PHY_STATE_reg_n_0_[3] ),
        .O(\TX_OUT_COUNT[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000000))
    \TX_OUT_COUNT[8]_i_2
       (.I0(\TX_OUT_COUNT_reg_n_0_[3] ),
        .I1(\TX_OUT_COUNT_reg_n_0_[1] ),
        .I2(\TX_OUT_COUNT_reg_n_0_[0] ),
        .I3(\TX_OUT_COUNT_reg_n_0_[2] ),
        .I4(\TX_OUT_COUNT_reg_n_0_[4] ),
        .I5(\TX_PHY_STATE_reg_n_0_[3] ),
        .O(\TX_OUT_COUNT[8]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair216" *)
  LUT3 #(
    .INIT(8'h95))
    \TX_OUT_COUNT[9]_i_1
       (.I0(\TX_OUT_COUNT[10]_i_5_n_0 ),
        .I1(\TX_OUT_COUNT_reg_n_0_[9] ),
        .I2(\TX_PHY_STATE_reg_n_0_[3] ),
        .O(\TX_OUT_COUNT[9]_i_1_n_0 ));
  FDRE \TX_OUT_COUNT_reg[0]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_OUT_COUNT[10]_i_1_n_0 ),
        .D(TX_OUT_COUNT0_in),
        .Q(\TX_OUT_COUNT_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \TX_OUT_COUNT_reg[10]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_OUT_COUNT[10]_i_1_n_0 ),
        .D(\TX_OUT_COUNT[10]_i_2_n_0 ),
        .Q(\TX_OUT_COUNT_reg_n_0_[10] ),
        .R(1'b0));
  FDRE \TX_OUT_COUNT_reg[1]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_OUT_COUNT[10]_i_1_n_0 ),
        .D(\TX_OUT_COUNT[1]_i_1_n_0 ),
        .Q(\TX_OUT_COUNT_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \TX_OUT_COUNT_reg[2]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_OUT_COUNT[10]_i_1_n_0 ),
        .D(\TX_OUT_COUNT[2]_i_1_n_0 ),
        .Q(\TX_OUT_COUNT_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \TX_OUT_COUNT_reg[3]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_OUT_COUNT[10]_i_1_n_0 ),
        .D(\TX_OUT_COUNT[3]_i_1_n_0 ),
        .Q(\TX_OUT_COUNT_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \TX_OUT_COUNT_reg[4]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_OUT_COUNT[10]_i_1_n_0 ),
        .D(\TX_OUT_COUNT[4]_i_1_n_0 ),
        .Q(\TX_OUT_COUNT_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \TX_OUT_COUNT_reg[5]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_OUT_COUNT[10]_i_1_n_0 ),
        .D(\TX_OUT_COUNT[5]_i_1_n_0 ),
        .Q(\TX_OUT_COUNT_reg_n_0_[5] ),
        .R(1'b0));
  FDRE \TX_OUT_COUNT_reg[6]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_OUT_COUNT[10]_i_1_n_0 ),
        .D(\TX_OUT_COUNT[6]_i_1_n_0 ),
        .Q(\TX_OUT_COUNT_reg_n_0_[6] ),
        .R(1'b0));
  FDRE \TX_OUT_COUNT_reg[7]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_OUT_COUNT[10]_i_1_n_0 ),
        .D(\TX_OUT_COUNT[7]_i_1_n_0 ),
        .Q(\TX_OUT_COUNT_reg_n_0_[7] ),
        .R(1'b0));
  FDRE \TX_OUT_COUNT_reg[8]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_OUT_COUNT[10]_i_1_n_0 ),
        .D(\TX_OUT_COUNT[8]_i_1_n_0 ),
        .Q(\TX_OUT_COUNT_reg_n_0_[8] ),
        .R(1'b0));
  FDRE \TX_OUT_COUNT_reg[9]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_OUT_COUNT[10]_i_1_n_0 ),
        .D(\TX_OUT_COUNT[9]_i_1_n_0 ),
        .Q(\TX_OUT_COUNT_reg_n_0_[9] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair159" *)
  LUT5 #(
    .INIT(32'hFF007C7C))
    \TX_PACKET_STATE[0]_i_1
       (.I0(\TX_PACKET_STATE_reg[1]_i_2_n_2 ),
        .I1(\TX_PACKET_STATE_reg_n_0_[0] ),
        .I2(S_TX_ACK_reg_n_0),
        .I3(DONE_SYNC),
        .I4(\TX_PACKET_STATE_reg_n_0_[1] ),
        .O(\TX_PACKET_STATE[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair159" *)
  LUT5 #(
    .INIT(32'hFF338080))
    \TX_PACKET_STATE[1]_i_1
       (.I0(\TX_PACKET_STATE_reg[1]_i_2_n_2 ),
        .I1(\TX_PACKET_STATE_reg_n_0_[0] ),
        .I2(S_TX_ACK_reg_n_0),
        .I3(DONE_SYNC),
        .I4(\TX_PACKET_STATE_reg_n_0_[1] ),
        .O(\TX_PACKET_STATE[1]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h1))
    \TX_PACKET_STATE[1]_i_10
       (.I0(TX_IN_COUNT[6]),
        .I1(TX_IN_COUNT[7]),
        .O(\TX_PACKET_STATE[1]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h1))
    \TX_PACKET_STATE[1]_i_11
       (.I0(TX_IN_COUNT[4]),
        .I1(TX_IN_COUNT[5]),
        .O(\TX_PACKET_STATE[1]_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h1))
    \TX_PACKET_STATE[1]_i_12
       (.I0(TX_IN_COUNT[2]),
        .I1(TX_IN_COUNT[3]),
        .O(\TX_PACKET_STATE[1]_i_12_n_0 ));
  LUT1 #(
    .INIT(2'h1))
    \TX_PACKET_STATE[1]_i_13
       (.I0(TX_IN_COUNT[1]),
        .O(\TX_PACKET_STATE[1]_i_13_n_0 ));
  LUT2 #(
    .INIT(4'hE))
    \TX_PACKET_STATE[1]_i_4
       (.I0(TX_IN_COUNT[9]),
        .I1(TX_IN_COUNT[8]),
        .O(\TX_PACKET_STATE[1]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1))
    \TX_PACKET_STATE[1]_i_5
       (.I0(TX_IN_COUNT[10]),
        .O(\TX_PACKET_STATE[1]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h1))
    \TX_PACKET_STATE[1]_i_6
       (.I0(TX_IN_COUNT[8]),
        .I1(TX_IN_COUNT[9]),
        .O(\TX_PACKET_STATE[1]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'hE))
    \TX_PACKET_STATE[1]_i_7
       (.I0(TX_IN_COUNT[7]),
        .I1(TX_IN_COUNT[6]),
        .O(\TX_PACKET_STATE[1]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'hE))
    \TX_PACKET_STATE[1]_i_8
       (.I0(TX_IN_COUNT[5]),
        .I1(TX_IN_COUNT[4]),
        .O(\TX_PACKET_STATE[1]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'hE))
    \TX_PACKET_STATE[1]_i_9
       (.I0(TX_IN_COUNT[3]),
        .I1(TX_IN_COUNT[2]),
        .O(\TX_PACKET_STATE[1]_i_9_n_0 ));
  FDRE \TX_PACKET_STATE_reg[0]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(\TX_PACKET_STATE[0]_i_1_n_0 ),
        .Q(\TX_PACKET_STATE_reg_n_0_[0] ),
        .R(INTERNAL_RST_reg));
  FDRE \TX_PACKET_STATE_reg[1]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(\TX_PACKET_STATE[1]_i_1_n_0 ),
        .Q(\TX_PACKET_STATE_reg_n_0_[1] ),
        .R(INTERNAL_RST_reg));
  CARRY4 \TX_PACKET_STATE_reg[1]_i_2
       (.CI(\TX_PACKET_STATE_reg[1]_i_3_n_0 ),
        .CO({\NLW_TX_PACKET_STATE_reg[1]_i_2_CO_UNCONNECTED [3:2],\TX_PACKET_STATE_reg[1]_i_2_n_2 ,\NLW_TX_PACKET_STATE_reg[1]_i_2_CO_UNCONNECTED [0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,TX_IN_COUNT[10],\TX_PACKET_STATE[1]_i_4_n_0 }),
        .O(\NLW_TX_PACKET_STATE_reg[1]_i_2_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,\TX_PACKET_STATE[1]_i_5_n_0 ,\TX_PACKET_STATE[1]_i_6_n_0 }));
  CARRY4 \TX_PACKET_STATE_reg[1]_i_3
       (.CI(1'b0),
        .CO({\TX_PACKET_STATE_reg[1]_i_3_n_0 ,\NLW_TX_PACKET_STATE_reg[1]_i_3_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b1),
        .DI({\TX_PACKET_STATE[1]_i_7_n_0 ,\TX_PACKET_STATE[1]_i_8_n_0 ,\TX_PACKET_STATE[1]_i_9_n_0 ,TX_IN_COUNT[1]}),
        .O(\NLW_TX_PACKET_STATE_reg[1]_i_3_O_UNCONNECTED [3:0]),
        .S({\TX_PACKET_STATE[1]_i_10_n_0 ,\TX_PACKET_STATE[1]_i_11_n_0 ,\TX_PACKET_STATE[1]_i_12_n_0 ,\TX_PACKET_STATE[1]_i_13_n_0 }));
  LUT6 #(
    .INIT(64'h80000000DFFFFFFF))
    \TX_PHY_STATE[0]_i_1
       (.I0(\TX_PHY_STATE_reg_n_0_[2] ),
        .I1(GO_SYNC),
        .I2(\TX_PHY_STATE_reg_n_0_[1] ),
        .I3(\TX_PHY_STATE_reg_n_0_[3] ),
        .I4(\TX_PHY_STATE_reg_n_0_[4] ),
        .I5(\TX_PHY_STATE_reg_n_0_[0] ),
        .O(\TX_PHY_STATE[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8000FFFFDFFF0000))
    \TX_PHY_STATE[1]_i_1
       (.I0(\TX_PHY_STATE_reg_n_0_[2] ),
        .I1(GO_SYNC),
        .I2(\TX_PHY_STATE_reg_n_0_[3] ),
        .I3(\TX_PHY_STATE_reg_n_0_[4] ),
        .I4(\TX_PHY_STATE_reg_n_0_[1] ),
        .I5(\TX_PHY_STATE_reg_n_0_[0] ),
        .O(\TX_PHY_STATE[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8ABABA8ABA8ABA8A))
    \TX_PHY_STATE[2]_i_1
       (.I0(\TX_PHY_STATE[2]_i_2_n_0 ),
        .I1(\TX_PHY_STATE_reg_n_0_[3] ),
        .I2(\TX_PHY_STATE_reg_n_0_[4] ),
        .I3(\TX_PHY_STATE_reg_n_0_[2] ),
        .I4(\TX_PHY_STATE_reg_n_0_[0] ),
        .I5(\TX_PHY_STATE_reg_n_0_[1] ),
        .O(\TX_PHY_STATE[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8BB88BBBB8888))
    \TX_PHY_STATE[2]_i_2
       (.I0(\TX_PHY_STATE[2]_i_3_n_0 ),
        .I1(\TX_PHY_STATE[2]_i_4_n_0 ),
        .I2(GO_SYNC),
        .I3(\TX_PHY_STATE_reg_n_0_[0] ),
        .I4(\TX_PHY_STATE_reg_n_0_[2] ),
        .I5(\TX_PHY_STATE_reg_n_0_[1] ),
        .O(\TX_PHY_STATE[2]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h0FF0F8F0))
    \TX_PHY_STATE[2]_i_3
       (.I0(\TX_PHY_STATE[3]_i_5_n_0 ),
        .I1(\TX_PHY_STATE_reg_n_0_[3] ),
        .I2(\TX_PHY_STATE_reg_n_0_[2] ),
        .I3(\TX_PHY_STATE_reg_n_0_[0] ),
        .I4(\TX_PHY_STATE_reg_n_0_[1] ),
        .O(\TX_PHY_STATE[2]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h5D))
    \TX_PHY_STATE[2]_i_4
       (.I0(\TX_PHY_STATE_reg_n_0_[4] ),
        .I1(\TX_PHY_STATE_reg_n_0_[2] ),
        .I2(\TX_PHY_STATE_reg_n_0_[3] ),
        .O(\TX_PHY_STATE[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hCFAAC0AAC0AAC0AA))
    \TX_PHY_STATE[3]_i_1
       (.I0(\TX_PHY_STATE[3]_i_2_n_0 ),
        .I1(\TX_PHY_STATE[3]_i_3_n_0 ),
        .I2(\TX_PHY_STATE_reg_n_0_[3] ),
        .I3(\TX_PHY_STATE_reg_n_0_[4] ),
        .I4(\TX_PHY_STATE_reg_n_0_[2] ),
        .I5(\TX_PHY_STATE[3]_i_4_n_0 ),
        .O(\TX_PHY_STATE[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h3CCC8CCC))
    \TX_PHY_STATE[3]_i_2
       (.I0(\TX_PHY_STATE[3]_i_5_n_0 ),
        .I1(\TX_PHY_STATE_reg_n_0_[3] ),
        .I2(\TX_PHY_STATE_reg_n_0_[2] ),
        .I3(\TX_PHY_STATE_reg_n_0_[0] ),
        .I4(\TX_PHY_STATE_reg_n_0_[1] ),
        .O(\TX_PHY_STATE[3]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hBF))
    \TX_PHY_STATE[3]_i_3
       (.I0(GO_SYNC),
        .I1(\TX_PHY_STATE_reg_n_0_[2] ),
        .I2(\TX_PHY_STATE_reg_n_0_[1] ),
        .O(\TX_PHY_STATE[3]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8))
    \TX_PHY_STATE[3]_i_4
       (.I0(\TX_PHY_STATE_reg_n_0_[1] ),
        .I1(\TX_PHY_STATE_reg_n_0_[0] ),
        .O(\TX_PHY_STATE[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000080))
    \TX_PHY_STATE[3]_i_5
       (.I0(\TX_OUT_COUNT[10]_i_6_n_0 ),
        .I1(\TX_OUT_COUNT[10]_i_7_n_0 ),
        .I2(\TX_OUT_COUNT[10]_i_8_n_0 ),
        .I3(\TX_OUT_COUNT_reg_n_0_[0] ),
        .I4(\TX_OUT_COUNT_reg_n_0_[1] ),
        .I5(\TX_OUT_COUNT_reg_n_0_[2] ),
        .O(\TX_PHY_STATE[3]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hAFBEAABE))
    \TX_PHY_STATE[4]_i_1
       (.I0(\TX_PHY_STATE[4]_i_3_n_0 ),
        .I1(GO_SYNC),
        .I2(\TX_PHY_STATE_reg_n_0_[1] ),
        .I3(\TX_PHY_STATE_reg_n_0_[0] ),
        .I4(\TX_PHY_STATE[4]_i_4_n_0 ),
        .O(\TX_PHY_STATE[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF5FF8800FFFF0000))
    \TX_PHY_STATE[4]_i_2
       (.I0(\TX_PHY_STATE_reg_n_0_[1] ),
        .I1(\TX_PHY_STATE_reg_n_0_[0] ),
        .I2(GO_SYNC),
        .I3(\TX_PHY_STATE_reg_n_0_[2] ),
        .I4(\TX_PHY_STATE_reg_n_0_[4] ),
        .I5(\TX_PHY_STATE_reg_n_0_[3] ),
        .O(\TX_PHY_STATE[4]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h7FFE))
    \TX_PHY_STATE[4]_i_3
       (.I0(\TX_PHY_STATE_reg_n_0_[1] ),
        .I1(\TX_PHY_STATE_reg_n_0_[2] ),
        .I2(\TX_PHY_STATE_reg_n_0_[3] ),
        .I3(\TX_PHY_STATE_reg_n_0_[4] ),
        .O(\TX_PHY_STATE[4]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h00000001))
    \TX_PHY_STATE[4]_i_4
       (.I0(\PREAMBLE_COUNT_reg_n_0_[3] ),
        .I1(\PREAMBLE_COUNT_reg_n_0_[1] ),
        .I2(\PREAMBLE_COUNT_reg_n_0_[0] ),
        .I3(\PREAMBLE_COUNT_reg_n_0_[4] ),
        .I4(\PREAMBLE_COUNT_reg_n_0_[2] ),
        .O(\TX_PHY_STATE[4]_i_4_n_0 ));
  FDRE \TX_PHY_STATE_reg[0]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_PHY_STATE[4]_i_1_n_0 ),
        .D(\TX_PHY_STATE[0]_i_1_n_0 ),
        .Q(\TX_PHY_STATE_reg_n_0_[0] ),
        .R(INTERNAL_RST_reg));
  FDRE \TX_PHY_STATE_reg[1]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_PHY_STATE[4]_i_1_n_0 ),
        .D(\TX_PHY_STATE[1]_i_1_n_0 ),
        .Q(\TX_PHY_STATE_reg_n_0_[1] ),
        .R(INTERNAL_RST_reg));
  FDRE \TX_PHY_STATE_reg[2]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_PHY_STATE[4]_i_1_n_0 ),
        .D(\TX_PHY_STATE[2]_i_1_n_0 ),
        .Q(\TX_PHY_STATE_reg_n_0_[2] ),
        .R(INTERNAL_RST_reg));
  FDRE \TX_PHY_STATE_reg[3]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_PHY_STATE[4]_i_1_n_0 ),
        .D(\TX_PHY_STATE[3]_i_1_n_0 ),
        .Q(\TX_PHY_STATE_reg_n_0_[3] ),
        .R(INTERNAL_RST_reg));
  FDRE \TX_PHY_STATE_reg[4]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_PHY_STATE[4]_i_1_n_0 ),
        .D(\TX_PHY_STATE[4]_i_2_n_0 ),
        .Q(\TX_PHY_STATE_reg_n_0_[4] ),
        .R(INTERNAL_RST_reg));
  FDRE \TX_READ_ADDRESS_reg_rep[0]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_READ_ADDRESS_rep[9]_i_2_n_0 ),
        .D(\TX_READ_ADDRESS_rep[0]_i_1_n_0 ),
        .Q(TX_READ_ADDRESS[0]),
        .R(\TX_READ_ADDRESS_rep[9]_i_1_n_0 ));
  FDRE \TX_READ_ADDRESS_reg_rep[10]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_READ_ADDRESS_rep[9]_i_2_n_0 ),
        .D(TX_READ_ADDRESS0[10]),
        .Q(TX_READ_ADDRESS[10]),
        .R(\TX_READ_ADDRESS_rep[9]_i_1_n_0 ));
  FDRE \TX_READ_ADDRESS_reg_rep[1]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_READ_ADDRESS_rep[9]_i_2_n_0 ),
        .D(TX_READ_ADDRESS0[1]),
        .Q(TX_READ_ADDRESS[1]),
        .R(\TX_READ_ADDRESS_rep[9]_i_1_n_0 ));
  FDRE \TX_READ_ADDRESS_reg_rep[2]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_READ_ADDRESS_rep[9]_i_2_n_0 ),
        .D(TX_READ_ADDRESS0[2]),
        .Q(TX_READ_ADDRESS[2]),
        .R(\TX_READ_ADDRESS_rep[9]_i_1_n_0 ));
  FDRE \TX_READ_ADDRESS_reg_rep[3]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_READ_ADDRESS_rep[9]_i_2_n_0 ),
        .D(TX_READ_ADDRESS0[3]),
        .Q(TX_READ_ADDRESS[3]),
        .R(\TX_READ_ADDRESS_rep[9]_i_1_n_0 ));
  FDRE \TX_READ_ADDRESS_reg_rep[4]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_READ_ADDRESS_rep[9]_i_2_n_0 ),
        .D(TX_READ_ADDRESS0[4]),
        .Q(TX_READ_ADDRESS[4]),
        .R(\TX_READ_ADDRESS_rep[9]_i_1_n_0 ));
  FDRE \TX_READ_ADDRESS_reg_rep[5]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_READ_ADDRESS_rep[9]_i_2_n_0 ),
        .D(TX_READ_ADDRESS0[5]),
        .Q(TX_READ_ADDRESS[5]),
        .R(\TX_READ_ADDRESS_rep[9]_i_1_n_0 ));
  FDRE \TX_READ_ADDRESS_reg_rep[6]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_READ_ADDRESS_rep[9]_i_2_n_0 ),
        .D(TX_READ_ADDRESS0[6]),
        .Q(TX_READ_ADDRESS[6]),
        .R(\TX_READ_ADDRESS_rep[9]_i_1_n_0 ));
  FDRE \TX_READ_ADDRESS_reg_rep[7]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_READ_ADDRESS_rep[9]_i_2_n_0 ),
        .D(TX_READ_ADDRESS0[7]),
        .Q(TX_READ_ADDRESS[7]),
        .R(\TX_READ_ADDRESS_rep[9]_i_1_n_0 ));
  FDRE \TX_READ_ADDRESS_reg_rep[8]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_READ_ADDRESS_rep[9]_i_2_n_0 ),
        .D(TX_READ_ADDRESS0[8]),
        .Q(TX_READ_ADDRESS[8]),
        .R(\TX_READ_ADDRESS_rep[9]_i_1_n_0 ));
  FDRE \TX_READ_ADDRESS_reg_rep[9]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_READ_ADDRESS_rep[9]_i_2_n_0 ),
        .D(TX_READ_ADDRESS0[9]),
        .Q(TX_READ_ADDRESS[9]),
        .R(\TX_READ_ADDRESS_rep[9]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1))
    \TX_READ_ADDRESS_rep[0]_i_1
       (.I0(TX_READ_ADDRESS[0]),
        .O(\TX_READ_ADDRESS_rep[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000))
    \TX_READ_ADDRESS_rep[10]_i_1
       (.I0(TX_READ_ADDRESS[8]),
        .I1(TX_READ_ADDRESS[6]),
        .I2(\TX_READ_ADDRESS_rep[9]_i_4_n_0 ),
        .I3(TX_READ_ADDRESS[7]),
        .I4(TX_READ_ADDRESS[9]),
        .I5(TX_READ_ADDRESS[10]),
        .O(TX_READ_ADDRESS0[10]));
  (* SOFT_HLUTNM = "soft_lutpair227" *)
  LUT2 #(
    .INIT(4'h6))
    \TX_READ_ADDRESS_rep[1]_i_1
       (.I0(TX_READ_ADDRESS[0]),
        .I1(TX_READ_ADDRESS[1]),
        .O(TX_READ_ADDRESS0[1]));
  (* SOFT_HLUTNM = "soft_lutpair227" *)
  LUT3 #(
    .INIT(8'h78))
    \TX_READ_ADDRESS_rep[2]_i_1
       (.I0(TX_READ_ADDRESS[0]),
        .I1(TX_READ_ADDRESS[1]),
        .I2(TX_READ_ADDRESS[2]),
        .O(TX_READ_ADDRESS0[2]));
  (* SOFT_HLUTNM = "soft_lutpair195" *)
  LUT4 #(
    .INIT(16'h7F80))
    \TX_READ_ADDRESS_rep[3]_i_1
       (.I0(TX_READ_ADDRESS[1]),
        .I1(TX_READ_ADDRESS[0]),
        .I2(TX_READ_ADDRESS[2]),
        .I3(TX_READ_ADDRESS[3]),
        .O(TX_READ_ADDRESS0[3]));
  (* SOFT_HLUTNM = "soft_lutpair195" *)
  LUT5 #(
    .INIT(32'h7FFF8000))
    \TX_READ_ADDRESS_rep[4]_i_1
       (.I0(TX_READ_ADDRESS[2]),
        .I1(TX_READ_ADDRESS[0]),
        .I2(TX_READ_ADDRESS[1]),
        .I3(TX_READ_ADDRESS[3]),
        .I4(TX_READ_ADDRESS[4]),
        .O(TX_READ_ADDRESS0[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000))
    \TX_READ_ADDRESS_rep[5]_i_1
       (.I0(TX_READ_ADDRESS[3]),
        .I1(TX_READ_ADDRESS[1]),
        .I2(TX_READ_ADDRESS[0]),
        .I3(TX_READ_ADDRESS[2]),
        .I4(TX_READ_ADDRESS[4]),
        .I5(TX_READ_ADDRESS[5]),
        .O(TX_READ_ADDRESS0[5]));
  (* SOFT_HLUTNM = "soft_lutpair219" *)
  LUT2 #(
    .INIT(4'h6))
    \TX_READ_ADDRESS_rep[6]_i_1
       (.I0(\TX_READ_ADDRESS_rep[9]_i_4_n_0 ),
        .I1(TX_READ_ADDRESS[6]),
        .O(TX_READ_ADDRESS0[6]));
  (* SOFT_HLUTNM = "soft_lutpair219" *)
  LUT3 #(
    .INIT(8'h78))
    \TX_READ_ADDRESS_rep[7]_i_1
       (.I0(\TX_READ_ADDRESS_rep[9]_i_4_n_0 ),
        .I1(TX_READ_ADDRESS[6]),
        .I2(TX_READ_ADDRESS[7]),
        .O(TX_READ_ADDRESS0[7]));
  (* SOFT_HLUTNM = "soft_lutpair192" *)
  LUT4 #(
    .INIT(16'h7F80))
    \TX_READ_ADDRESS_rep[8]_i_1
       (.I0(TX_READ_ADDRESS[6]),
        .I1(\TX_READ_ADDRESS_rep[9]_i_4_n_0 ),
        .I2(TX_READ_ADDRESS[7]),
        .I3(TX_READ_ADDRESS[8]),
        .O(TX_READ_ADDRESS0[8]));
  LUT6 #(
    .INIT(64'h0000000000000004))
    \TX_READ_ADDRESS_rep[9]_i_1
       (.I0(\TX_PHY_STATE_reg_n_0_[2] ),
        .I1(GO_SYNC),
        .I2(\TX_PHY_STATE_reg_n_0_[4] ),
        .I3(\TX_PHY_STATE_reg_n_0_[0] ),
        .I4(\TX_PHY_STATE_reg_n_0_[1] ),
        .I5(\TX_PHY_STATE_reg_n_0_[3] ),
        .O(\TX_READ_ADDRESS_rep[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0100010000010000))
    \TX_READ_ADDRESS_rep[9]_i_2
       (.I0(\TX_PHY_STATE_reg_n_0_[1] ),
        .I1(\TX_PHY_STATE_reg_n_0_[0] ),
        .I2(\TX_PHY_STATE_reg_n_0_[4] ),
        .I3(\TX_PHY_STATE_reg_n_0_[3] ),
        .I4(GO_SYNC),
        .I5(\TX_PHY_STATE_reg_n_0_[2] ),
        .O(\TX_READ_ADDRESS_rep[9]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair192" *)
  LUT5 #(
    .INIT(32'h7FFF8000))
    \TX_READ_ADDRESS_rep[9]_i_3
       (.I0(TX_READ_ADDRESS[7]),
        .I1(\TX_READ_ADDRESS_rep[9]_i_4_n_0 ),
        .I2(TX_READ_ADDRESS[6]),
        .I3(TX_READ_ADDRESS[8]),
        .I4(TX_READ_ADDRESS[9]),
        .O(TX_READ_ADDRESS0[9]));
  LUT6 #(
    .INIT(64'h8000000000000000))
    \TX_READ_ADDRESS_rep[9]_i_4
       (.I0(TX_READ_ADDRESS[5]),
        .I1(TX_READ_ADDRESS[3]),
        .I2(TX_READ_ADDRESS[1]),
        .I3(TX_READ_ADDRESS[0]),
        .I4(TX_READ_ADDRESS[2]),
        .I5(TX_READ_ADDRESS[4]),
        .O(\TX_READ_ADDRESS_rep[9]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair203" *)
  LUT2 #(
    .INIT(4'h1))
    \TX_WRITE_ADDRESS[0]_i_1
       (.I0(\TX_PACKET_STATE_reg_n_0_[1] ),
        .I1(TX_WRITE_ADDRESS[0]),
        .O(\TX_WRITE_ADDRESS[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h04F0))
    \TX_WRITE_ADDRESS[10]_i_1
       (.I0(\TX_PACKET_STATE_reg[1]_i_2_n_2 ),
        .I1(S_TX_ACK_reg_n_0),
        .I2(\TX_PACKET_STATE_reg_n_0_[1] ),
        .I3(\TX_PACKET_STATE_reg_n_0_[0] ),
        .O(\TX_WRITE_ADDRESS[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair203" *)
  LUT4 #(
    .INIT(16'h0078))
    \TX_WRITE_ADDRESS[10]_i_2
       (.I0(\TX_WRITE_ADDRESS[10]_i_3_n_0 ),
        .I1(TX_WRITE_ADDRESS[9]),
        .I2(TX_WRITE_ADDRESS[10]),
        .I3(\TX_PACKET_STATE_reg_n_0_[1] ),
        .O(\TX_WRITE_ADDRESS[10]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h0800))
    \TX_WRITE_ADDRESS[10]_i_3
       (.I0(TX_WRITE_ADDRESS[8]),
        .I1(TX_WRITE_ADDRESS[7]),
        .I2(\TX_WRITE_ADDRESS[9]_i_2_n_0 ),
        .I3(TX_WRITE_ADDRESS[6]),
        .O(\TX_WRITE_ADDRESS[10]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair226" *)
  LUT3 #(
    .INIT(8'h06))
    \TX_WRITE_ADDRESS[1]_i_1
       (.I0(TX_WRITE_ADDRESS[1]),
        .I1(TX_WRITE_ADDRESS[0]),
        .I2(\TX_PACKET_STATE_reg_n_0_[1] ),
        .O(\TX_WRITE_ADDRESS[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair155" *)
  LUT4 #(
    .INIT(16'h1540))
    \TX_WRITE_ADDRESS[2]_i_1
       (.I0(\TX_PACKET_STATE_reg_n_0_[1] ),
        .I1(TX_WRITE_ADDRESS[0]),
        .I2(TX_WRITE_ADDRESS[1]),
        .I3(TX_WRITE_ADDRESS[2]),
        .O(\TX_WRITE_ADDRESS[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair155" *)
  LUT5 #(
    .INIT(32'h15554000))
    \TX_WRITE_ADDRESS[3]_i_1
       (.I0(\TX_PACKET_STATE_reg_n_0_[1] ),
        .I1(TX_WRITE_ADDRESS[1]),
        .I2(TX_WRITE_ADDRESS[0]),
        .I3(TX_WRITE_ADDRESS[2]),
        .I4(TX_WRITE_ADDRESS[3]),
        .O(\TX_WRITE_ADDRESS[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h1555555540000000))
    \TX_WRITE_ADDRESS[4]_i_1
       (.I0(\TX_PACKET_STATE_reg_n_0_[1] ),
        .I1(TX_WRITE_ADDRESS[2]),
        .I2(TX_WRITE_ADDRESS[0]),
        .I3(TX_WRITE_ADDRESS[1]),
        .I4(TX_WRITE_ADDRESS[3]),
        .I5(TX_WRITE_ADDRESS[4]),
        .O(\TX_WRITE_ADDRESS[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair226" *)
  LUT3 #(
    .INIT(8'h41))
    \TX_WRITE_ADDRESS[5]_i_1
       (.I0(\TX_PACKET_STATE_reg_n_0_[1] ),
        .I1(\TX_WRITE_ADDRESS[5]_i_2_n_0 ),
        .I2(TX_WRITE_ADDRESS[5]),
        .O(\TX_WRITE_ADDRESS[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h7FFFFFFF))
    \TX_WRITE_ADDRESS[5]_i_2
       (.I0(TX_WRITE_ADDRESS[3]),
        .I1(TX_WRITE_ADDRESS[1]),
        .I2(TX_WRITE_ADDRESS[0]),
        .I3(TX_WRITE_ADDRESS[2]),
        .I4(TX_WRITE_ADDRESS[4]),
        .O(\TX_WRITE_ADDRESS[5]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h41))
    \TX_WRITE_ADDRESS[6]_i_1
       (.I0(\TX_PACKET_STATE_reg_n_0_[1] ),
        .I1(\TX_WRITE_ADDRESS[9]_i_2_n_0 ),
        .I2(TX_WRITE_ADDRESS[6]),
        .O(\TX_WRITE_ADDRESS[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair160" *)
  LUT4 #(
    .INIT(16'h4510))
    \TX_WRITE_ADDRESS[7]_i_1
       (.I0(\TX_PACKET_STATE_reg_n_0_[1] ),
        .I1(\TX_WRITE_ADDRESS[9]_i_2_n_0 ),
        .I2(TX_WRITE_ADDRESS[6]),
        .I3(TX_WRITE_ADDRESS[7]),
        .O(\TX_WRITE_ADDRESS[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair160" *)
  LUT5 #(
    .INIT(32'h51550400))
    \TX_WRITE_ADDRESS[8]_i_1
       (.I0(\TX_PACKET_STATE_reg_n_0_[1] ),
        .I1(TX_WRITE_ADDRESS[6]),
        .I2(\TX_WRITE_ADDRESS[9]_i_2_n_0 ),
        .I3(TX_WRITE_ADDRESS[7]),
        .I4(TX_WRITE_ADDRESS[8]),
        .O(\TX_WRITE_ADDRESS[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h5515555500400000))
    \TX_WRITE_ADDRESS[9]_i_1
       (.I0(\TX_PACKET_STATE_reg_n_0_[1] ),
        .I1(TX_WRITE_ADDRESS[8]),
        .I2(TX_WRITE_ADDRESS[7]),
        .I3(\TX_WRITE_ADDRESS[9]_i_2_n_0 ),
        .I4(TX_WRITE_ADDRESS[6]),
        .I5(TX_WRITE_ADDRESS[9]),
        .O(\TX_WRITE_ADDRESS[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF))
    \TX_WRITE_ADDRESS[9]_i_2
       (.I0(TX_WRITE_ADDRESS[4]),
        .I1(TX_WRITE_ADDRESS[2]),
        .I2(TX_WRITE_ADDRESS[0]),
        .I3(TX_WRITE_ADDRESS[1]),
        .I4(TX_WRITE_ADDRESS[3]),
        .I5(TX_WRITE_ADDRESS[5]),
        .O(\TX_WRITE_ADDRESS[9]_i_2_n_0 ));
  FDRE \TX_WRITE_ADDRESS_DEL_reg[0]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(TX_WRITE_ADDRESS[0]),
        .Q(TX_WRITE_ADDRESS_DEL[0]),
        .R(1'b0));
  FDRE \TX_WRITE_ADDRESS_DEL_reg[10]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(TX_WRITE_ADDRESS[10]),
        .Q(TX_WRITE_ADDRESS_DEL[10]),
        .R(1'b0));
  FDRE \TX_WRITE_ADDRESS_DEL_reg[1]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(TX_WRITE_ADDRESS[1]),
        .Q(TX_WRITE_ADDRESS_DEL[1]),
        .R(1'b0));
  FDRE \TX_WRITE_ADDRESS_DEL_reg[2]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(TX_WRITE_ADDRESS[2]),
        .Q(TX_WRITE_ADDRESS_DEL[2]),
        .R(1'b0));
  FDRE \TX_WRITE_ADDRESS_DEL_reg[3]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(TX_WRITE_ADDRESS[3]),
        .Q(TX_WRITE_ADDRESS_DEL[3]),
        .R(1'b0));
  FDRE \TX_WRITE_ADDRESS_DEL_reg[4]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(TX_WRITE_ADDRESS[4]),
        .Q(TX_WRITE_ADDRESS_DEL[4]),
        .R(1'b0));
  FDRE \TX_WRITE_ADDRESS_DEL_reg[5]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(TX_WRITE_ADDRESS[5]),
        .Q(TX_WRITE_ADDRESS_DEL[5]),
        .R(1'b0));
  FDRE \TX_WRITE_ADDRESS_DEL_reg[6]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(TX_WRITE_ADDRESS[6]),
        .Q(TX_WRITE_ADDRESS_DEL[6]),
        .R(1'b0));
  FDRE \TX_WRITE_ADDRESS_DEL_reg[7]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(TX_WRITE_ADDRESS[7]),
        .Q(TX_WRITE_ADDRESS_DEL[7]),
        .R(1'b0));
  FDRE \TX_WRITE_ADDRESS_DEL_reg[8]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(TX_WRITE_ADDRESS[8]),
        .Q(TX_WRITE_ADDRESS_DEL[8]),
        .R(1'b0));
  FDRE \TX_WRITE_ADDRESS_DEL_reg[9]
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(TX_WRITE_ADDRESS[9]),
        .Q(TX_WRITE_ADDRESS_DEL[9]),
        .R(1'b0));
  FDRE \TX_WRITE_ADDRESS_reg[0]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_WRITE_ADDRESS[10]_i_1_n_0 ),
        .D(\TX_WRITE_ADDRESS[0]_i_1_n_0 ),
        .Q(TX_WRITE_ADDRESS[0]),
        .R(INTERNAL_RST_reg));
  FDRE \TX_WRITE_ADDRESS_reg[10]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_WRITE_ADDRESS[10]_i_1_n_0 ),
        .D(\TX_WRITE_ADDRESS[10]_i_2_n_0 ),
        .Q(TX_WRITE_ADDRESS[10]),
        .R(INTERNAL_RST_reg));
  FDRE \TX_WRITE_ADDRESS_reg[1]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_WRITE_ADDRESS[10]_i_1_n_0 ),
        .D(\TX_WRITE_ADDRESS[1]_i_1_n_0 ),
        .Q(TX_WRITE_ADDRESS[1]),
        .R(INTERNAL_RST_reg));
  FDRE \TX_WRITE_ADDRESS_reg[2]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_WRITE_ADDRESS[10]_i_1_n_0 ),
        .D(\TX_WRITE_ADDRESS[2]_i_1_n_0 ),
        .Q(TX_WRITE_ADDRESS[2]),
        .R(INTERNAL_RST_reg));
  FDRE \TX_WRITE_ADDRESS_reg[3]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_WRITE_ADDRESS[10]_i_1_n_0 ),
        .D(\TX_WRITE_ADDRESS[3]_i_1_n_0 ),
        .Q(TX_WRITE_ADDRESS[3]),
        .R(INTERNAL_RST_reg));
  FDRE \TX_WRITE_ADDRESS_reg[4]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_WRITE_ADDRESS[10]_i_1_n_0 ),
        .D(\TX_WRITE_ADDRESS[4]_i_1_n_0 ),
        .Q(TX_WRITE_ADDRESS[4]),
        .R(INTERNAL_RST_reg));
  FDRE \TX_WRITE_ADDRESS_reg[5]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_WRITE_ADDRESS[10]_i_1_n_0 ),
        .D(\TX_WRITE_ADDRESS[5]_i_1_n_0 ),
        .Q(TX_WRITE_ADDRESS[5]),
        .R(INTERNAL_RST_reg));
  FDRE \TX_WRITE_ADDRESS_reg[6]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_WRITE_ADDRESS[10]_i_1_n_0 ),
        .D(\TX_WRITE_ADDRESS[6]_i_1_n_0 ),
        .Q(TX_WRITE_ADDRESS[6]),
        .R(INTERNAL_RST_reg));
  FDRE \TX_WRITE_ADDRESS_reg[7]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_WRITE_ADDRESS[10]_i_1_n_0 ),
        .D(\TX_WRITE_ADDRESS[7]_i_1_n_0 ),
        .Q(TX_WRITE_ADDRESS[7]),
        .R(INTERNAL_RST_reg));
  FDRE \TX_WRITE_ADDRESS_reg[8]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_WRITE_ADDRESS[10]_i_1_n_0 ),
        .D(\TX_WRITE_ADDRESS[8]_i_1_n_0 ),
        .Q(TX_WRITE_ADDRESS[8]),
        .R(INTERNAL_RST_reg));
  FDRE \TX_WRITE_ADDRESS_reg[9]
       (.C(ETH_CLK_OBUF),
        .CE(\TX_WRITE_ADDRESS[10]_i_1_n_0 ),
        .D(\TX_WRITE_ADDRESS[9]_i_1_n_0 ),
        .Q(TX_WRITE_ADDRESS[9]),
        .R(INTERNAL_RST_reg));
  (* SOFT_HLUTNM = "soft_lutpair166" *)
  LUT3 #(
    .INIT(8'h20))
    TX_WRITE_i_1
       (.I0(S_TX_ACK_reg_n_0),
        .I1(\TX_PACKET_STATE_reg_n_0_[1] ),
        .I2(\TX_PACKET_STATE_reg_n_0_[0] ),
        .O(TX_WRITE_i_1_n_0));
  FDRE TX_WRITE_reg
       (.C(ETH_CLK_OBUF),
        .CE(1'b1),
        .D(TX_WRITE_i_1_n_0),
        .Q(TX_WRITE),
        .R(1'b0));
endmodule