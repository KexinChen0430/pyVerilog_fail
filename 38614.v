module
      Hdr_Array[0] <= `HEADER0_MWR3_ | Rx_TLP_Length[9:0];
      Hdr_Array[1] <= {`C_HOST_WRREQ_ID, Rx_MWr_Tag, 4'Hf, 4'Hf};
      Hdr_Array[2] <= `C_ADDR_TX_CTRL;
      Private_Array[0] <= 'H0000000A;
    # `T_DELTA
      TLP_Feed_Rx(`USE_PRIVATE, 'H0, `C_BAR0_HIT);
      Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
      Gap_Insert_Rx;
    # `T_DELTA     // Test MRd with 4-DW header  BAR[0]
      Hdr_Array[0] <= `HEADER0_MRD4_ | Rx_TLP_Length[9:0];
      Hdr_Array[1] <= {`C_HOST_RDREQ_ID, 8'HA1, 4'Hf, 4'Hf};
      Hdr_Array[2] <= -1;
      Hdr_Array[3] <= `C_ADDR_VERSION;
    # `T_DELTA
      TLP_Feed_Rx(`USE_PRIVATE, 'H0, `C_BAR0_HIT);
      Gap_Insert_Rx;
    # 100
      Rx_TLP_Length    <= 'H01;
    # `T_DELTA    // reset upstream DMA channel
      Hdr_Array[0] <= `HEADER0_MWR3_ | Rx_TLP_Length[9:0];
      Hdr_Array[1] <= {`C_HOST_WRREQ_ID, Rx_MWr_Tag, 4'Hf, 4'Hf};
      Hdr_Array[2] <= `C_ADDR_DMA_US_CTRL;
      Private_Array[0] <= `C_DMA_RST_CMD;
    # `T_DELTA
      TLP_Feed_Rx(`USE_PRIVATE, 'H0, `C_BAR0_HIT);
      Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
      Gap_Insert_Rx;
    # `T_DELTA    // reset downstream DMA channel
      Hdr_Array[0] <= `HEADER0_MWR4_ | Rx_TLP_Length[9:0];
      Hdr_Array[1] <= {`C_HOST_WRREQ_ID, Rx_MWr_Tag, 4'Hf, 4'Hf};
      Hdr_Array[2] <= -1;
      Hdr_Array[3] <= `C_ADDR_DMA_DS_CTRL;
      Private_Array[0] <= `C_DMA_RST_CMD;
    # `T_DELTA
      TLP_Feed_Rx(`USE_PRIVATE, 'H0, `C_BAR0_HIT);
      Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
      Gap_Insert_Rx;
    # `T_DELTA    // reset Event Buffer FIFO
      Hdr_Array[0] <= `HEADER0_MWR3_ | Rx_TLP_Length[9:0];
      Hdr_Array[1] <= {`C_HOST_WRREQ_ID, Rx_MWr_Tag, 4'Hf, 4'Hf};
      Hdr_Array[2] <= `C_ADDR_EB_STACON;
      Private_Array[0] <= 'H0000000A;
    # `T_DELTA
      TLP_Feed_Rx(`USE_PRIVATE, 'H0, `C_BAR0_HIT);
      Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
      Gap_Insert_Rx;
    # `T_DELTA    // Enable INTerrupts
      Hdr_Array[0] <= `HEADER0_MWR3_ | Rx_TLP_Length[9:0];
      Hdr_Array[1] <= {`C_HOST_WRREQ_ID, Rx_MWr_Tag, 4'Hf, 4'Hf};
      Hdr_Array[2] <= `C_ADDR_IRQ_EN;
      Private_Array[0] <= 'H0000_0003;
    # `T_DELTA
      TLP_Feed_Rx(`USE_PRIVATE, 'H0, `C_BAR0_HIT);
      Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
      Gap_Insert_Rx;
    //                       PIO simulation                            //
     # `T_PIO_INTERVAL
       ;
       FSM_Trn          <= 'H04;
    //  PIO write & read BAR[0]
       PIO_Addr         <= `C_ADDR_DMA_US_PAH + 'H8;
       PIO_bar          <= `C_BAR0_HIT;
       PIO_1st_BE       <= 4'Hf;
       Gap_Insert_Rx;
       Hdr_Array[0]     <= `HEADER0_MWR3_ | Rx_TLP_Length[9:0];
       Hdr_Array[1]     <= {`C_HOST_WRREQ_ID, Rx_MWr_Tag, 4'Hf, PIO_1st_BE};
       Hdr_Array[2]     <= {PIO_Addr[31:2], 2'b00};
       Private_Array[0] <= 'HF000_8888;
       Rx_TLP_Length    <= 'H01;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H0, PIO_bar);
       Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
       Gap_Insert_Rx;
     # `T_PIO_INTERVAL
       ;
     # `T_DELTA
       Hdr_Array[0]     <= `HEADER0_MRD3_ | Rx_TLP_Length[9:0];
       Hdr_Array[1]     <= {`C_HOST_RDREQ_ID, 3'H3, Rx_MRd_Tag, 4'Hf, PIO_1st_BE};
       Hdr_Array[2]     <= {PIO_Addr[31:2], 2'b00};
     # `T_DELTA
       TLP_Feed_Rx(`USE_PUBLIC, `PIO_START_INDEX, PIO_bar);
       Rx_MRd_Tag       <= Rx_MRd_Tag + 1;
       Gap_Insert_Rx;
       FSM_Trn          <= 'H08;
    //  PIO write & read BAR[1]
       PIO_Addr         <= 'H8000;
       PIO_bar          <= `C_BAR1_HIT;
       PIO_1st_BE       <= 4'Hf;
       Gap_Insert_Rx;
       Hdr_Array[0]     <= `HEADER0_MWR3_ | Rx_TLP_Length[9:0];
       Hdr_Array[1]     <= {`C_HOST_WRREQ_ID, Rx_MWr_Tag, 4'Hf, PIO_1st_BE};
       Hdr_Array[2]     <= {PIO_Addr[31:2], 2'b00};
       Private_Array[0] <= 'HA1111111;
       Rx_TLP_Length    <= 'H01;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H0, PIO_bar);
       Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
       Gap_Insert_Rx;
     # `T_PIO_INTERVAL
       ;
     # `T_DELTA
       Hdr_Array[0]     <= `HEADER0_MRD3_ | Rx_TLP_Length[9:0];
       Hdr_Array[1]     <= {`C_HOST_RDREQ_ID, 3'H3, Rx_MRd_Tag, 4'Hf, PIO_1st_BE};
       Hdr_Array[2]     <= {PIO_Addr[31:2], 2'b00};
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, `PIO_START_INDEX, PIO_bar);
       Rx_MRd_Tag       <= Rx_MRd_Tag + 1;
       Gap_Insert_Rx;
       FSM_Trn          <= 'H10;
    //  PIO write & read BAR[2]
    //  NOTE:  FIFO address is 64-bit aligned, only the lower 32-bit is
    //         accessible by BAR[2] PIO write and is returned in BAR[2]
    //         PIO read.
       PIO_Addr         <= 'H0;
       PIO_bar          <= `C_BAR2_HIT;
       PIO_1st_BE       <= 4'Hf;
       Gap_Insert_Rx;
       Hdr_Array[0]     <= `HEADER0_MWR3_ | Rx_TLP_Length[9:0];
       Hdr_Array[1]     <= {`C_HOST_WRREQ_ID, Rx_MWr_Tag, 4'Hf, PIO_1st_BE};
       Hdr_Array[2]     <= {PIO_Addr[31:2], 2'b00};
       Private_Array[0] <= 'HB222_2222;
       Rx_TLP_Length    <= 'H01;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H0, PIO_bar);
       Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
       Gap_Insert_Rx;
     # `T_PIO_INTERVAL
       ;
     # `T_DELTA
       Hdr_Array[0]     <= `HEADER0_MRD3_ | Rx_TLP_Length[9:0];
       Hdr_Array[1]     <= {`C_HOST_RDREQ_ID, 3'H3, Rx_MRd_Tag, 4'Hf, PIO_1st_BE};
       Hdr_Array[2]     <= {PIO_Addr[31:2], 2'b00};
     # `T_DELTA
       TLP_Feed_Rx(`USE_PUBLIC, `PIO_START_INDEX, PIO_bar);
       Rx_MRd_Tag       <= Rx_MRd_Tag + 1;
       Gap_Insert_Rx;
       FSM_Trn          <= 'H14;
     # `T_DMA_INTERVAL
       ;
    //  DMA write & read BAR[1]
    //  Single-descriptor case
       DMA_PA   <= 'H1234;
       DMA_HA   <= 'H5000;
       DMA_BDA  <= 'Hffff;
		 DMA_Leng <= 'H0100;
       DMA_bar  <= 'H1;
       DMA_ds_is_Last  <= 'B1;
     # `T_DELTA
       // Initial DMA descriptor
       Private_Array[0] <= -1;
       Private_Array[1] <= DMA_PA[31:00];       //'H0300;
       Private_Array[2] <= DMA_HA[63:32];       // 0;
       Private_Array[3] <= DMA_HA[31:00];       // 'H4000;
       Private_Array[4] <= DMA_BDA[63:32];      // 0;
       Private_Array[5] <= DMA_BDA[31:00];      //'H0BDA0090;
       Private_Array[6] <= DMA_Leng;            //'H100;
       Private_Array[7] <=  {4'H0
                            ,3'H1, DMA_ds_is_Last
                            ,3'H0, 1'B1
                            ,1'B0, DMA_bar
                            ,1'B1
                            ,15'H0
                            };
       //  DMA write
       Rx_TLP_Length    <= 'H01;
     # `T_DELTA
       Hdr_Array[0] <= `HEADER0_MWR3_ | Rx_TLP_Length[9:0];
       Hdr_Array[1] <= {`C_HOST_WRREQ_ID, Rx_MWr_Tag, 4'Hf, 4'Hf};
       Hdr_Array[2] <= `C_ADDR_DMA_DS_PAH;
       //  Write PA_H
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H0, `C_BAR0_HIT);
       Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
       Gap_Insert_Rx;
       Gap_Insert_Rx;
       //  Write PA_L
       Hdr_Array[2] <= Hdr_Array[2] + 'H4;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H1, `C_BAR0_HIT);
       Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
       Gap_Insert_Rx;
       Gap_Insert_Rx;
       //  Write HA_H
       Hdr_Array[2] <= Hdr_Array[2] + 'H4;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H2, `C_BAR0_HIT);
       Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
       Gap_Insert_Rx;
       Gap_Insert_Rx;
       //  Write HA_L
       Hdr_Array[2] <= Hdr_Array[2] + 'H4;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H3, `C_BAR0_HIT);
       Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
       Gap_Insert_Rx;
       Gap_Insert_Rx;
       //  Write BDA_H
       Hdr_Array[2] <= Hdr_Array[2] + 'H4;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H4, `C_BAR0_HIT);
       Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
       Gap_Insert_Rx;
       Gap_Insert_Rx;
       //  Write BDA_L
       Hdr_Array[2] <= Hdr_Array[2] + 'H4;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H5, `C_BAR0_HIT);
       Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
       Gap_Insert_Rx;
       Gap_Insert_Rx;
       //  Write LENG
       Hdr_Array[2] <= Hdr_Array[2] + 'H4;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H6, `C_BAR0_HIT);
       Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
       Gap_Insert_Rx;
       Gap_Insert_Rx;
       //  Write CTRL and start the DMA
       Hdr_Array[2] <= Hdr_Array[2] + 'H4;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H7, `C_BAR0_HIT);
       Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
       Gap_Insert_Rx;
       Gap_Insert_Rx;
     # `T_DELTA     // Polling the DMA status
       Hdr_Array[0] <= `HEADER0_MRD3_ | Rx_TLP_Length[9:0];
       Hdr_Array[1] <= {`C_HOST_RDREQ_ID, 3'H3, Rx_MRd_Tag, 4'Hf, 4'Hf};
       Hdr_Array[2] <= `C_ADDR_DMA_DS_STA;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H0, `C_BAR0_HIT);
       Rx_MRd_Tag       <= Rx_MRd_Tag + 1;
       Gap_Insert_Rx;
       FSM_Trn          <= 'H18;
       // feeding the payload CplD
       wait (tx_MRd_come);
       Gap_Insert_Rx;
       tx_MRd_come  <= 'B0;
       Tx_MRd_Leng  <= DMA_Leng>>2;
       Tx_MRd_Addr  <= DMA_HA[31:0];
       tx_MRd_Tag_k <= tx_MRd_Tag;
       CplD_Index   <= 'H0;
       Gap_Insert_Rx;
       Rx_TLP_Length    <= 'H10;
     # `T_DELTA
       Hdr_Array[0] <= `HEADER0_CPLD | Rx_TLP_Length[9:0];
       Hdr_Array[1] <= {`C_HOST_CPLD_ID, 4'H0, Tx_MRd_Leng[9:0], 2'b00};
       Hdr_Array[2] <= {localID, tx_MRd_Tag_k, 1'b0, Tx_MRd_Addr[6:0]};
       Tx_MRd_Leng  <= Tx_MRd_Leng - Rx_TLP_Length;
       Tx_MRd_Addr  <= Tx_MRd_Addr + Rx_TLP_Length;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PUBLIC, CplD_Index, `C_NO_BAR_HIT);
       CplD_Index   <= CplD_Index + Rx_TLP_Length;
       Gap_Insert_Rx;
       Hdr_Array[0] <= `HEADER0_CPLD | Rx_TLP_Length[9:0];
       Hdr_Array[1] <= {`C_HOST_CPLD_ID, 4'H0, Tx_MRd_Leng[9:0], 2'b00};
       Hdr_Array[2] <= {localID, tx_MRd_Tag_k, 1'b0, Tx_MRd_Addr[6:0]};
       Tx_MRd_Leng  <= Tx_MRd_Leng - Rx_TLP_Length;
       Tx_MRd_Addr  <= Tx_MRd_Addr + Rx_TLP_Length;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PUBLIC, CplD_Index, `C_NO_BAR_HIT);
       CplD_Index   <= CplD_Index + Rx_TLP_Length;
//       Gap_Insert_Rx;
       Hdr_Array[0] <= `HEADER0_CPLD | Rx_TLP_Length[9:0];
       Hdr_Array[1] <= {`C_HOST_CPLD_ID, 4'H0, Tx_MRd_Leng[9:0], 2'b00};
       Hdr_Array[2] <= {localID, tx_MRd_Tag_k, 1'b0, Tx_MRd_Addr[6:0]};
       Tx_MRd_Leng  <= Tx_MRd_Leng - Rx_TLP_Length;
       Tx_MRd_Addr  <= Tx_MRd_Addr + Rx_TLP_Length;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PUBLIC, CplD_Index, `C_NO_BAR_HIT);
       CplD_Index   <= CplD_Index + Rx_TLP_Length;
       Gap_Insert_Rx;
       Hdr_Array[0] <= `HEADER0_CPLD | Rx_TLP_Length[9:0];
       Hdr_Array[1] <= {`C_HOST_CPLD_ID, 4'H0, Tx_MRd_Leng[9:0], 2'b00};
       Hdr_Array[2] <= {localID, tx_MRd_Tag_k, 1'b0, Tx_MRd_Addr[6:0]};
       Tx_MRd_Leng  <= Tx_MRd_Leng - Rx_TLP_Length;
       Tx_MRd_Addr  <= Tx_MRd_Addr + Rx_TLP_Length;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PUBLIC, CplD_Index, `C_NO_BAR_HIT);
       CplD_Index   <= CplD_Index + Rx_TLP_Length;
       Gap_Insert_Rx;
       Rx_TLP_Length    <= 'H01;
     # `T_DELTA     // Polling the DMA status
       Hdr_Array[0] <= `HEADER0_MRD3_ | Rx_TLP_Length[9:0];
       Hdr_Array[1] <= {`C_HOST_RDREQ_ID, 3'H3, Rx_MRd_Tag, 4'Hf, 4'Hf};
       Hdr_Array[2] <= `C_ADDR_DMA_DS_STA;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H0, `C_BAR0_HIT);
       Rx_MRd_Tag       <= Rx_MRd_Tag + 1;
       Gap_Insert_Rx;
       FSM_Trn          <= 'H1C;
     # `T_DMA_INTERVAL
       ;
       //  DMA read
       Rx_TLP_Length    <= 'H01;
     # `T_DELTA
       Hdr_Array[0] <= `HEADER0_MWR3_ | Rx_TLP_Length[9:0];
       Hdr_Array[1] <= {`C_HOST_WRREQ_ID, Rx_MWr_Tag, 4'Hf, 4'Hf};
       Hdr_Array[2] <= `C_ADDR_DMA_US_PAH;
       //  Write PA_H
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H0, `C_BAR0_HIT);
       Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
       Gap_Insert_Rx;
       Gap_Insert_Rx;
       //  Write PA_L
       Hdr_Array[2] <= Hdr_Array[2] + 'H4;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H1, `C_BAR0_HIT);
       Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
       Gap_Insert_Rx;
       Gap_Insert_Rx;
       //  Write HA_H
       Hdr_Array[2] <= Hdr_Array[2] + 'H4;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H2, `C_BAR0_HIT);
       Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
       Gap_Insert_Rx;
       Gap_Insert_Rx;
       //  Write HA_L
       Hdr_Array[2] <= Hdr_Array[2] + 'H4;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H3, `C_BAR0_HIT);
       Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
       Gap_Insert_Rx;
       Gap_Insert_Rx;
       //  Write BDA_H
       Hdr_Array[2] <= Hdr_Array[2] + 'H4;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H4, `C_BAR0_HIT);
       Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
       Gap_Insert_Rx;
       Gap_Insert_Rx;
       //  Write BDA_L
       Hdr_Array[2] <= Hdr_Array[2] + 'H4;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H5, `C_BAR0_HIT);
       Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
       Gap_Insert_Rx;
       Gap_Insert_Rx;
       //  Write LENG
       Hdr_Array[2] <= Hdr_Array[2] + 'H4;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H6, `C_BAR0_HIT);
       Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
       Gap_Insert_Rx;
       Gap_Insert_Rx;
       //  Write CTRL and start the DMA
       Hdr_Array[2] <= Hdr_Array[2] + 'H4;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H7, `C_BAR0_HIT);
       Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
       Gap_Insert_Rx;
       Gap_Insert_Rx;
       Rx_TLP_Length    <= 'H01;
     # `T_DELTA     // Polling the DMA status
       Hdr_Array[0] <= `HEADER0_MRD3_ | Rx_TLP_Length[9:0];
       Hdr_Array[1] <= {`C_HOST_RDREQ_ID, 3'H3, Rx_MRd_Tag, 4'Hf, 4'Hf};
       Hdr_Array[2] <= `C_ADDR_DMA_US_STA;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H0, `C_BAR0_HIT);
       Rx_MRd_Tag       <= Rx_MRd_Tag + 1;
       Gap_Insert_Rx;
       FSM_Trn          <= 'H20;
     # (`T_DMA_INTERVAL*4)
       ;
       Rx_TLP_Length    <= 'H01;
     # `T_DELTA    // reset downstream DMA channel
       Hdr_Array[0] <= `HEADER0_MWR3_ | Rx_TLP_Length[9:0];
       Hdr_Array[1] <= {`C_HOST_WRREQ_ID, Rx_MWr_Tag, 4'Hf, 4'Hf};
       Hdr_Array[2] <= `C_ADDR_DMA_DS_CTRL;
       Private_Array[0] <= `C_DMA_RST_CMD;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H0, `C_BAR0_HIT);
       Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
       Gap_Insert_Rx;
       Rx_TLP_Length    <= 'H01;
     # `T_DELTA    // reset upstream DMA channel
       Hdr_Array[0] <= `HEADER0_MWR3_ | Rx_TLP_Length[9:0];
       Hdr_Array[1] <= {`C_HOST_WRREQ_ID, Rx_MWr_Tag, 4'Hf, 4'Hf};
       Hdr_Array[2] <= `C_ADDR_DMA_US_CTRL;
       Private_Array[0] <= `C_DMA_RST_CMD;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H0, `C_BAR0_HIT);
       Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
       Gap_Insert_Rx;
       FSM_Trn          <= 'H24;
     # `T_PIO_INTERVAL
       ;
    //  DMA write & read BAR[2]
    //  Multiple-descriptor case
       DMA_PA   <= 'H789ABC;
       DMA_HA   <= 'HDF0000;
       DMA_BDA  <= 'H0BDABDA0;
		 DMA_Leng <= 'H0208;
     # `T_DELTA
		 DMA_L1   <= 'H0100;
     # `T_DELTA
		 DMA_L2   <= DMA_Leng - DMA_L1;
       DMA_bar  <= 'H2;
       DMA_ds_is_Last  <= 'B0;
     # `T_DELTA
       // Initial DMA descriptor
       Private_Array[0] <= -1;
       Private_Array[1] <= DMA_PA[31:00];
       Private_Array[2] <= DMA_HA[63:32];       // 0;
       Private_Array[3] <= DMA_HA[31:00];
       Private_Array[4] <= DMA_BDA[63:32];      // 0;
       Private_Array[5] <= DMA_BDA[31:00];
       Private_Array[6] <= DMA_L1;
       Private_Array[7] <=  {4'H0
                            ,3'H1, DMA_ds_is_Last
                            ,3'H0, 1'B1
                            ,1'B0, DMA_bar
                            ,1'B1
                            ,15'H0
                            };
       Rx_TLP_Length    <= 'H01;
     # `T_DELTA
       Hdr_Array[0] <= `HEADER0_MWR3_ | Rx_TLP_Length[9:0];
       Hdr_Array[1] <= {`C_HOST_WRREQ_ID, Rx_MWr_Tag, 4'Hf, 4'Hf};
       Hdr_Array[2] <= `C_ADDR_DMA_DS_PAH;
       //  Write PA_H
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H0, `C_BAR0_HIT);
       Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
       Gap_Insert_Rx;
       Gap_Insert_Rx;
       //  Write PA_L
       Hdr_Array[2] <= Hdr_Array[2] + 'H4;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H1, `C_BAR0_HIT);
       Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
       Gap_Insert_Rx;
       Gap_Insert_Rx;
       //  Write HA_H
       Hdr_Array[2] <= Hdr_Array[2] + 'H4;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H2, `C_BAR0_HIT);
       Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
       Gap_Insert_Rx;
       Gap_Insert_Rx;
       //  Write HA_L
       Hdr_Array[2] <= Hdr_Array[2] + 'H4;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H3, `C_BAR0_HIT);
       Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
       Gap_Insert_Rx;
       Gap_Insert_Rx;
       //  Write BDA_H
       Hdr_Array[2] <= Hdr_Array[2] + 'H4;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H4, `C_BAR0_HIT);
       Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
       Gap_Insert_Rx;
       Gap_Insert_Rx;
       //  Write BDA_L
       Hdr_Array[2] <= Hdr_Array[2] + 'H4;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H5, `C_BAR0_HIT);
       Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
       Gap_Insert_Rx;
       Gap_Insert_Rx;
       //  Write LENG
       Hdr_Array[2] <= Hdr_Array[2] + 'H4;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H6, `C_BAR0_HIT);
       Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
       Gap_Insert_Rx;
       Gap_Insert_Rx;
       //  Write CTRL and start the DMA
       Hdr_Array[2] <= Hdr_Array[2] + 'H4;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H7, `C_BAR0_HIT);
       Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
       Gap_Insert_Rx;
       Gap_Insert_Rx;
       FSM_Trn          <= 'H28;
       // feeding the descriptor CplD
       wait (Desc_tx_MRd_Valid);
       Gap_Insert_Rx;
       Desc_tx_MRd_Valid <= 'B0;
       DMA_ds_is_Last    <= 'B1;
       Gap_Insert_Rx;
       // Initial DMA descriptor
       Private_Array[0] <= 0;
       Private_Array[1] <= DMA_PA[31:00] + 'H500;
       Private_Array[2] <= DMA_HA[63:32];          // 0;
       Private_Array[3] <= DMA_HA[31:00] + 'H500;
       Private_Array[4] <= -1;                     // dont-care
       Private_Array[5] <= -1;                     // dont-care
       Private_Array[6] <= DMA_L2;
       Private_Array[7] <=  {4'H0
                            ,3'H1, DMA_ds_is_Last
                            ,3'H0, 1'B1
                            ,1'B0, DMA_bar
                            ,1'B1
                            ,15'H0
                            };
       Rx_TLP_Length    <= 'H08;
       Gap_Insert_Rx;
       Hdr_Array[0] <= `HEADER0_CPLD | Rx_TLP_Length[9:0];
       Hdr_Array[1] <= {`C_HOST_CPLD_ID, 4'H0, Rx_TLP_Length[9:0], 2'b00};
       Hdr_Array[2] <= {localID, Desc_tx_MRd_TAG, 1'b0, DMA_BDA[6:0]};
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 0, `C_NO_BAR_HIT);
       Gap_Insert_Rx;
       // feeding the payload CplD
       wait (tx_MRd_come);
       Gap_Insert_Rx;
       tx_MRd_come  <= 'B0;
       Tx_MRd_Leng  <= DMA_L1>>2;
       Tx_MRd_Addr  <= DMA_HA[31:0];
       tx_MRd_Tag_k <= tx_MRd_Tag;
       CplD_Index   <= 'H0;
       Gap_Insert_Rx;
       Rx_TLP_Length    <= 'H10;
     # `T_DELTA
       Hdr_Array[0] <= `HEADER0_CPLD | Rx_TLP_Length[9:0];
       Hdr_Array[1] <= {`C_HOST_CPLD_ID, 4'H0, Tx_MRd_Leng[9:0], 2'b00};
       Hdr_Array[2] <= {localID, tx_MRd_Tag_k, 1'b0, Tx_MRd_Addr[6:0]};
       Tx_MRd_Leng  <= Tx_MRd_Leng - Rx_TLP_Length;
       Tx_MRd_Addr  <= Tx_MRd_Addr + Rx_TLP_Length;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PUBLIC, CplD_Index, `C_NO_BAR_HIT);
       CplD_Index   <= CplD_Index + Rx_TLP_Length;
       Gap_Insert_Rx;
       Hdr_Array[0] <= `HEADER0_CPLD | Rx_TLP_Length[9:0];
       Hdr_Array[1] <= {`C_HOST_CPLD_ID, 4'H0, Tx_MRd_Leng[9:0], 2'b00};
       Hdr_Array[2] <= {localID, tx_MRd_Tag_k, 1'b0, Tx_MRd_Addr[6:0]};
       Tx_MRd_Leng  <= Tx_MRd_Leng - Rx_TLP_Length;
       Tx_MRd_Addr  <= Tx_MRd_Addr + Rx_TLP_Length;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PUBLIC, CplD_Index, `C_NO_BAR_HIT);
       CplD_Index   <= CplD_Index + Rx_TLP_Length;
//       Gap_Insert_Rx;
       Hdr_Array[0] <= `HEADER0_CPLD | Rx_TLP_Length[9:0];
       Hdr_Array[1] <= {`C_HOST_CPLD_ID, 4'H0, Tx_MRd_Leng[9:0], 2'b00};
       Hdr_Array[2] <= {localID, tx_MRd_Tag_k, 1'b0, Tx_MRd_Addr[6:0]};
       Tx_MRd_Leng  <= Tx_MRd_Leng - Rx_TLP_Length;
       Tx_MRd_Addr  <= Tx_MRd_Addr + Rx_TLP_Length;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PUBLIC, CplD_Index, `C_NO_BAR_HIT);
       CplD_Index   <= CplD_Index + Rx_TLP_Length;
//       Gap_Insert_Rx;
       Hdr_Array[0] <= `HEADER0_CPLD | Rx_TLP_Length[9:0];
       Hdr_Array[1] <= {`C_HOST_CPLD_ID, 4'H0, Tx_MRd_Leng[9:0], 2'b00};
       Hdr_Array[2] <= {localID, tx_MRd_Tag_k, 1'b0, Tx_MRd_Addr[6:0]};
       Tx_MRd_Leng  <= Tx_MRd_Leng - Rx_TLP_Length;
       Tx_MRd_Addr  <= Tx_MRd_Addr + Rx_TLP_Length;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PUBLIC, CplD_Index, `C_NO_BAR_HIT);
       CplD_Index   <= CplD_Index + Rx_TLP_Length;
       Gap_Insert_Rx;
       Rx_TLP_Length    <= 'H01;
     # `T_DELTA     // Polling the DMA status
       Hdr_Array[0] <= `HEADER0_MRD3_ | Rx_TLP_Length[9:0];
       Hdr_Array[1] <= {`C_HOST_RDREQ_ID, 3'H3, Rx_MRd_Tag, 4'Hf, 4'Hf};
       Hdr_Array[2] <= `C_ADDR_DMA_DS_STA;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H0, `C_BAR0_HIT);
       Rx_MRd_Tag       <= Rx_MRd_Tag + 1;
       Gap_Insert_Rx;
       FSM_Trn          <= 'H2C;
       // feeding the payload CplD (2nd descriptor)
       wait (tx_MRd_come);
       Gap_Insert_Rx;
       tx_MRd_come  <= 'B0;
       Tx_MRd_Leng  <= (DMA_L2>>2) - 'H2;
       Tx_MRd_Addr  <= DMA_HA[31:0] + 'H500;
       tx_MRd_Tag_k <= tx_MRd_Tag_k + 'H1;
       CplD_Index   <= 'H40;
       Gap_Insert_Rx;
       Rx_TLP_Length    <= 'H10;
     # `T_DELTA
       Hdr_Array[0] <= `HEADER0_CPLD | Rx_TLP_Length[9:0];
       Hdr_Array[1] <= {`C_HOST_CPLD_ID, 4'H0, Tx_MRd_Leng[9:0], 2'b00};
       Hdr_Array[2] <= {localID, tx_MRd_Tag_k, 1'b0, Tx_MRd_Addr[6:0]};
       Tx_MRd_Leng  <= Tx_MRd_Leng - Rx_TLP_Length;
       Tx_MRd_Addr  <= Tx_MRd_Addr + Rx_TLP_Length;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PUBLIC, CplD_Index, `C_NO_BAR_HIT);
       CplD_Index   <= CplD_Index + Rx_TLP_Length;
       Gap_Insert_Rx;
       Hdr_Array[0] <= `HEADER0_CPLD | Rx_TLP_Length[9:0];
       Hdr_Array[1] <= {`C_HOST_CPLD_ID, 4'H0, Tx_MRd_Leng[9:0], 2'b00};
       Hdr_Array[2] <= {localID, tx_MRd_Tag_k, 1'b0, Tx_MRd_Addr[6:0]};
       Tx_MRd_Leng  <= Tx_MRd_Leng - Rx_TLP_Length;
       Tx_MRd_Addr  <= Tx_MRd_Addr + Rx_TLP_Length;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PUBLIC, CplD_Index, `C_NO_BAR_HIT);
       CplD_Index   <= CplD_Index + Rx_TLP_Length;
//       Gap_Insert_Rx;
       Hdr_Array[0] <= `HEADER0_CPLD | Rx_TLP_Length[9:0];
       Hdr_Array[1] <= {`C_HOST_CPLD_ID, 4'H0, Tx_MRd_Leng[9:0], 2'b00};
       Hdr_Array[2] <= {localID, tx_MRd_Tag_k, 1'b0, Tx_MRd_Addr[6:0]};
       Tx_MRd_Leng  <= Tx_MRd_Leng - Rx_TLP_Length;
       Tx_MRd_Addr  <= Tx_MRd_Addr + Rx_TLP_Length;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PUBLIC, CplD_Index, `C_NO_BAR_HIT);
       CplD_Index   <= CplD_Index + Rx_TLP_Length;
       Gap_Insert_Rx;
       Hdr_Array[0] <= `HEADER0_CPLD | Rx_TLP_Length[9:0];
       Hdr_Array[1] <= {`C_HOST_CPLD_ID, 4'H0, Tx_MRd_Leng[9:0], 2'b00};
       Hdr_Array[2] <= {localID, tx_MRd_Tag_k, 1'b0, Tx_MRd_Addr[6:0]};
       Tx_MRd_Leng  <= Tx_MRd_Leng - Rx_TLP_Length;
       Tx_MRd_Addr  <= Tx_MRd_Addr + Rx_TLP_Length;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PUBLIC, CplD_Index, `C_NO_BAR_HIT);
       CplD_Index   <= CplD_Index + Rx_TLP_Length;
       Gap_Insert_Rx;
       Rx_TLP_Length    <= 'H02;
       Tx_MRd_Leng      <= 'H2;
       tx_MRd_Tag_k     <= tx_MRd_Tag_k + 'H1;
     # `T_DELTA
       Hdr_Array[0] <= `HEADER0_CPLD | Rx_TLP_Length[9:0];
       Hdr_Array[1] <= {`C_HOST_CPLD_ID, 4'H0, Tx_MRd_Leng[9:0], 2'b00};
       Hdr_Array[2] <= {localID, tx_MRd_Tag_k, 1'b0, Tx_MRd_Addr[6:0]};
       Tx_MRd_Leng  <= Tx_MRd_Leng - Rx_TLP_Length;
       Tx_MRd_Addr  <= Tx_MRd_Addr + Rx_TLP_Length;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PUBLIC, CplD_Index, `C_NO_BAR_HIT);
       CplD_Index   <= CplD_Index + Rx_TLP_Length;
       Gap_Insert_Rx;
       FSM_Trn          <= 'H30;
     # (`T_DMA_INTERVAL*2)
       ;
       DMA_us_is_Last   <= 'B0;
     # `T_DELTA
       //  DMA read
       Private_Array[0] <= 0;
       Private_Array[1] <= DMA_PA[31:00];
       Private_Array[2] <= DMA_HA[63:32];          // 0;
       Private_Array[3] <= DMA_HA[31:00];
       Private_Array[4] <= DMA_BDA[63:32];         // 0;
       Private_Array[5] <= DMA_BDA[31:00] + 'H10000;
       Private_Array[6] <= DMA_L1;
       Private_Array[7] <=  {4'H0
                            ,3'H1, DMA_us_is_Last
                            ,3'H0, 1'B1
                            ,1'B0, DMA_bar
                            ,1'B1
                            ,15'H0
                            };
       Rx_TLP_Length    <= 'H01;
     # `T_DELTA
       Hdr_Array[0] <= `HEADER0_MWR3_ | Rx_TLP_Length[9:0];
       Hdr_Array[1] <= {`C_HOST_WRREQ_ID, Rx_MWr_Tag, 4'Hf, 4'Hf};
       Hdr_Array[2] <= `C_ADDR_DMA_US_PAH;
       //  Write PA_H
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H0, `C_BAR0_HIT);
       Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
       Gap_Insert_Rx;
       Gap_Insert_Rx;
       //  Write PA_L
       Hdr_Array[2] <= Hdr_Array[2] + 'H4;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H1, `C_BAR0_HIT);
       Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
       Gap_Insert_Rx;
       Gap_Insert_Rx;
       //  Write HA_H
       Hdr_Array[2] <= Hdr_Array[2] + 'H4;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H2, `C_BAR0_HIT);
       Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
       Gap_Insert_Rx;
       Gap_Insert_Rx;
       //  Write HA_L
       Hdr_Array[2] <= Hdr_Array[2] + 'H4;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H3, `C_BAR0_HIT);
       Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
       Gap_Insert_Rx;
       Gap_Insert_Rx;
       //  Write BDA_H
       Hdr_Array[2] <= Hdr_Array[2] + 'H4;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H4, `C_BAR0_HIT);
       Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
       Gap_Insert_Rx;
       Gap_Insert_Rx;
       //  Write BDA_L
       Hdr_Array[2] <= Hdr_Array[2] + 'H4;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H5, `C_BAR0_HIT);
       Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
       Gap_Insert_Rx;
       Gap_Insert_Rx;
       //  Write LENG
       Hdr_Array[2] <= Hdr_Array[2] + 'H4;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H6, `C_BAR0_HIT);
       Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
       Gap_Insert_Rx;
       Gap_Insert_Rx;
       //  Write CTRL and start the DMA
       Hdr_Array[2] <= Hdr_Array[2] + 'H4;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H7, `C_BAR0_HIT);
       Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
       Gap_Insert_Rx;
       Gap_Insert_Rx;
       Rx_TLP_Length    <= 'H01;
     # `T_DELTA     // Polling the DMA status
       Hdr_Array[0] <= `HEADER0_MRD3_ | Rx_TLP_Length[9:0];
       Hdr_Array[1] <= {`C_HOST_RDREQ_ID, 3'H3, Rx_MRd_Tag, 4'Hf, 4'Hf};
       Hdr_Array[2] <= `C_ADDR_DMA_US_STA;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H0, `C_BAR0_HIT);
       Rx_MRd_Tag       <= Rx_MRd_Tag + 1;
       Gap_Insert_Rx;
       FSM_Trn          <= 'H34;
       // feeding the descriptor CplD
       wait (Desc_tx_MRd_Valid);
       Gap_Insert_Rx;
       Desc_tx_MRd_Valid <= 'B0;
       DMA_us_is_Last    <= 'B1;
       Gap_Insert_Rx;
       // Initial DMA descriptor
       Private_Array[0] <= 0;
       Private_Array[1] <= DMA_PA[31:00] + 'H500;
       Private_Array[2] <= DMA_HA[63:32];          // 0;
       Private_Array[3] <= DMA_HA[31:00] + 'H500;
       Private_Array[4] <= -1;                     // dont-care
       Private_Array[5] <= -1;                     // dont-care
       Private_Array[6] <= DMA_L2;
       Private_Array[7] <=  {4'H0
                            ,3'H1, DMA_us_is_Last
                            ,3'H0, 1'B1
                            ,1'B0, DMA_bar
                            ,1'B1
                            ,15'H0
                            };
       Rx_TLP_Length    <= 'H08;
       Gap_Insert_Rx;
       Hdr_Array[0] <= `HEADER0_CPLD | Rx_TLP_Length[9:0];
       Hdr_Array[1] <= {`C_HOST_CPLD_ID, 4'H0, Rx_TLP_Length[9:0], 2'b00};
       Hdr_Array[2] <= {localID, Desc_tx_MRd_TAG, 1'b0, DMA_BDA[6:0]};
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 0, `C_NO_BAR_HIT);
       Gap_Insert_Rx;
       Rx_TLP_Length    <= 'H01;
     # `T_DELTA     // Polling the DMA status
       Hdr_Array[0] <= `HEADER0_MRD3_ | Rx_TLP_Length[9:0];
       Hdr_Array[1] <= {`C_HOST_RDREQ_ID, 3'H3, Rx_MRd_Tag, 4'Hf, 4'Hf};
       Hdr_Array[2] <= `C_ADDR_DMA_US_STA;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H0, `C_BAR0_HIT);
       Rx_MRd_Tag       <= Rx_MRd_Tag + 1;
       Gap_Insert_Rx;
     # (`T_DMA_INTERVAL*4)
       ;
       Rx_TLP_Length    <= 'H01;
     # `T_DELTA     // Polling the DMA status
       Hdr_Array[0] <= `HEADER0_MRD3_ | Rx_TLP_Length[9:0];
       Hdr_Array[1] <= {`C_HOST_RDREQ_ID, 3'H3, Rx_MRd_Tag, 4'Hf, 4'Hf};
       Hdr_Array[2] <= `C_ADDR_DMA_US_STA;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H0, `C_BAR0_HIT);
       Rx_MRd_Tag       <= Rx_MRd_Tag + 1;
       Gap_Insert_Rx;
       FSM_Trn          <= 'H38;
     # (`T_DMA_INTERVAL*4)
       ;
       Rx_TLP_Length    <= 'H01;
     # `T_DELTA    // reset downstream DMA channel
       Hdr_Array[0] <= `HEADER0_MWR3_ | Rx_TLP_Length[9:0];
       Hdr_Array[1] <= {`C_HOST_WRREQ_ID, Rx_MWr_Tag, 4'Hf, 4'Hf};
       Hdr_Array[2] <= `C_ADDR_DMA_DS_CTRL;
       Private_Array[0] <= `C_DMA_RST_CMD;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H0, `C_BAR0_HIT);
       Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
       Gap_Insert_Rx;
       Rx_TLP_Length    <= 'H01;
     # `T_DELTA    // reset upstream DMA channel
       Hdr_Array[0] <= `HEADER0_MWR3_ | Rx_TLP_Length[9:0];
       Hdr_Array[1] <= {`C_HOST_WRREQ_ID, Rx_MWr_Tag, 4'Hf, 4'Hf};
       Hdr_Array[2] <= `C_ADDR_DMA_US_CTRL;
       Private_Array[0] <= `C_DMA_RST_CMD;
     # `T_DELTA
       TLP_Feed_Rx(`USE_PRIVATE, 'H0, `C_BAR0_HIT);
       Rx_MWr_Tag   <= Rx_MWr_Tag + 1;
       Gap_Insert_Rx;
       FSM_Trn          <= 'H40;
  end
// ========================================== //
//         Checking and verification          //
   reg           Err_signal;
// ========================================== //
   // TLP format check out Rx
   //  in case stimuli incorrect: verification over verification
   reg [ 7: 0]   FSM_Rx_Fmt;
   reg [10: 0]   rxchk_TLP_Length;
   reg           rxchk_TLP_Has_Data;
   reg           rxchk_TLP_4DW_Hdr;
   reg           rxchk_Mem_TLP;
   always @(negedge trn_clk )
   if (!trn_reset_n) begin
      FSM_Rx_Fmt      <= 0;
   end
   else begin
      case (FSM_Rx_Fmt)
        'H00: begin
            FSM_Rx_Fmt    <= 'H010;
         end
        'H10: begin
            if ( trn_rsrc_rdy_n | trn_rdst_rdy_n) begin
              FSM_Rx_Fmt        <= 'H10;
            end
            else if (~trn_reof_n) begin
                  $display ("\n %t:\n !! Unexpected trn_reof_n !!", $time);
                  Err_signal <= 1;
            end
            else if (~trn_rsof_n&trn_reof_n) begin
                rxchk_TLP_Has_Data    <= trn_rd[30+32];
                rxchk_TLP_4DW_Hdr     <= trn_rd[29+32];
                rxchk_TLP_Length[10]  <= (trn_rd[9+32:0+32]=='H0);
                rxchk_TLP_Length[9:0] <= trn_rd[9+32:0+32];
                if (trn_rd[28+32:25+32]) rxchk_Mem_TLP    <= 0;    // Msg or MsgD
                else                     rxchk_Mem_TLP    <= 1;    // MWr, MRd or Cpl/D
                FSM_Rx_Fmt        <= 'H12;
            end
            else begin
                $display ("\n %t:\n !! trn_rsof_n error!", $time);
                Err_signal <= 1;
            end
         end
        'H12: begin
            if ( trn_rsrc_rdy_n | trn_rdst_rdy_n) begin
              FSM_Rx_Fmt        <= 'H12;
            end
            else if (!trn_rsof_n) begin
              $display ("\n %t:\n !! trn_rsof_n error! should be 1.", $time);
              Err_signal <= 1;
            end
            else begin
              if (rxchk_TLP_4DW_Hdr & rxchk_TLP_Has_Data) begin
                if (trn_reof_n) begin
                  Err_signal <= 0;
                  FSM_Rx_Fmt        <= 'H20;
                end
                else begin
                  Err_signal <= 1;
                  $display ("\n %t:\n !! trn_reof_n error (4-Header, with Payload)! should be 1.", $time);
                end
              end
              else if (rxchk_TLP_4DW_Hdr & !rxchk_TLP_Has_Data) begin
                if (trn_reof_n) begin
                  Err_signal <= 1;
                  $display ("\n %t:\n !! trn_reof_n error (4-Header, no Payload)! should be 0.", $time);
                end
                else if (trn_rrem_n=='H00) begin
                    Err_signal <= 0;
                    FSM_Rx_Fmt        <= 'H10;
                end
                else begin
                    Err_signal <= 1;
                    $display ("\n %t:\n !! trn_rrem_n error (4-Header, no Payload)!", $time);
                end
              end
              else if (!rxchk_TLP_4DW_Hdr & !rxchk_TLP_Has_Data) begin
                if (trn_reof_n) begin
                  Err_signal <= 1;
                  $display ("\n %t:\n !! trn_reof_n error (3-Header, with Payload)! should be 0.", $time);
                end
                else if (trn_rrem_n=='H0f) begin
                  Err_signal <= 0;
                  FSM_Rx_Fmt        <= 'H10;
                end
                else begin
                  Err_signal <= 1;
                  $display ("\n %t:\n !! trn_rrem_n error (3-Header, no Payload)!", $time);
                end
              end
              else if (rxchk_TLP_Length=='H1) begin  // (!rxchk_TLP_4DW_Hdr & rxchk_TLP_Has_Data)
                if (trn_reof_n) begin
                  Err_signal <= 1;
                  $display ("\n %t:\n !! trn_reof_n error (3-Header, with Payload)! should be 0.", $time);
                end
                else if (trn_rrem_n=='H00) begin
                  Err_signal <= 0;
                  FSM_Rx_Fmt        <= 'H10;
                end
                else begin
                  Err_signal <= 1;
                  $display ("\n %t:\n !! trn_rrem_n error (3-Header, no Payload)!", $time);
                end
              end
              else begin  // (!rxchk_TLP_4DW_Hdr & rxchk_TLP_Has_Data) & (rxchk_TLP_Length>'H1)
                if (trn_reof_n) begin
                  Err_signal <= 0;
                  rxchk_TLP_Length      <= rxchk_TLP_Length - 1;
                  FSM_Rx_Fmt        <= 'H20;
                end
                else begin
                  Err_signal <= 1;
                  $display ("\n %t:\n !! trn_reof_n error (3-Header, no Payload)! should be 1.", $time);
                end
              end
              // Address-Length combination check
              if (rxchk_TLP_4DW_Hdr) begin
                if (({1'b0, trn_rd[11:2]} + rxchk_TLP_Length[9:0])>11'H400) begin
                  $display ("\n\n %t:\n !! Rx 4KB straddled !!", $time);
                  $display ("\n Address=%08X  Length=%04X (%04X bytes)\n\n", trn_rd[31:0], rxchk_TLP_Length, rxchk_TLP_Length<<2);
//                  Err_signal <= 1;
                end
                if (trn_rd[63:32]=='H0 && rxchk_Mem_TLP==1) begin
                  $display ("\n %t:\n !! Rx TLP should not be 4-DW headher !!", $time);
                  Err_signal <= 1;
                end
              end
              else begin
                if (({1'b0, trn_rd[11+32:2+32]} + rxchk_TLP_Length[9:0])>11'H400) begin
                  $display ("\n\n %t:\n !! Rx 4KB straddled !!", $time);
                  $display ("\n Address=%08X  Length=%04X (%04X bytes)\n\n", trn_rd[63:32], rxchk_TLP_Length, rxchk_TLP_Length<<2);
//                  Err_signal <= 1;
                end
              end
            end
          end
        'H20: begin
            if ( trn_rsrc_rdy_n | trn_rdst_rdy_n) begin
              FSM_Rx_Fmt        <= 'H20;
            end
            else if (rxchk_TLP_Length==2) begin
              if (trn_rrem_n=='H00 && trn_reof_n==0) begin
                FSM_Rx_Fmt        <= 'H10;
              end
              else begin
                $display ("\n %t:\n !! trn_reof_n/trn_rrem_n error !!", $time);
                Err_signal <= 1;
              end
            end
            else if (rxchk_TLP_Length==1) begin
              if (trn_rrem_n=='H0f && trn_reof_n==0) begin
                FSM_Rx_Fmt        <= 'H10;
              end
              else begin
                $display ("\n %t:\n !! trn_reof_n/trn_rrem_n error !!", $time);
                Err_signal <= 1;
              end
            end
            else if (rxchk_TLP_Length==0) begin
              $display ("\n %t:\n !! Rx TLP Length error !!", $time);
              Err_signal <= 1;
            end
            else if (!trn_reof_n) begin
              $display ("\n %t:\n !! trn_reof_n too early !!", $time);
              Err_signal <= 1;
            end
            else begin
              rxchk_TLP_Length      <= rxchk_TLP_Length - 2;
              FSM_Rx_Fmt        <= 'H20;
            end
         end
        default: begin
           FSM_Rx_Fmt     <= 'H00;
         end
      endcase
   end
   // TLP format check by Tx
   reg [ 7: 0]   FSM_TLP_Fmt;
   reg [10: 0]   tx_TLP_Length;
   reg [12: 0]   tx_TLP_Address;
   reg           tx_TLP_Has_Data;
   reg           tx_TLP_is_CplD;
   reg           tx_TLP_4DW_Hdr;
   reg           tx_Mem_TLP;
   always @(negedge trn_clk )
   if (!trn_reset_n) begin
      FSM_TLP_Fmt      <= 0;
   end
   else begin
      case (FSM_TLP_Fmt)
        'H00: begin
            FSM_TLP_Fmt    <= 'H010;
         end
        'H10: begin
            if ( trn_tsrc_rdy_n | trn_tdst_rdy_n) begin
              FSM_TLP_Fmt        <= 'H10;
            end
            else if (~trn_teof_n) begin
                  $display ("\n %t:\n !! Unexpected trn_teof_n !!", $time);
                  Err_signal <= 1;
            end
            else if (~trn_tsof_n&trn_teof_n) begin
                tx_TLP_Has_Data    <= trn_td[30+32];
                tx_TLP_4DW_Hdr     <= trn_td[29+32];
                tx_TLP_Length[10]  <= (trn_td[9+32:0+32]=='H0);
                tx_TLP_Length[9:0] <= trn_td[9+32:0+32];
                tx_TLP_is_CplD     <= trn_td[27+32];
                if (trn_td[28+32:25+32]) tx_Mem_TLP    <= 0;    // Msg or MsgD
                else                     tx_Mem_TLP    <= 1;    // MWr, MRd or Cpl/D
                FSM_TLP_Fmt        <= 'H12;
                if (trn_td[31:16] == localID) begin
                   Err_signal <= 0;
                end
                else begin
                   $display ("\n %t:\n !! Tx Bad TLP ReqID for TLP !!", $time);
                   Err_signal <= 1;
                end
            end
            else begin
                $display ("\n %t:\n !! trn_tsof_n error!", $time);
                Err_signal <= 1;
            end
         end
        'H12: begin
            if ( trn_tsrc_rdy_n | trn_tdst_rdy_n) begin
              FSM_TLP_Fmt        <= 'H12;
            end
            else if (!trn_tsof_n) begin
              $display ("\n %t:\n !! trn_tsof_n error! should be 1.", $time);
              Err_signal <= 1;
            end
            else begin
              if (tx_TLP_4DW_Hdr & tx_TLP_Has_Data) begin
                if (trn_teof_n) begin
                  Err_signal   <= 0;
                  FSM_TLP_Fmt        <= 'H20;
                end
                else begin
                  Err_signal   <= 1;
                  $display ("\n %t:\n !! trn_teof_n error (4-Header, with Payload)! should be 1.", $time);
                end
              end
              else if (tx_TLP_4DW_Hdr & !tx_TLP_Has_Data) begin
                if (trn_teof_n) begin
                  Err_signal <= 1;
                  $display ("\n %t:\n !! trn_teof_n error (4-Header, no Payload)! should be 0.", $time);
                end
                else if (trn_trem_n=='H00) begin
                    Err_signal <= 0;
                    FSM_TLP_Fmt        <= 'H10;
                end
                else begin
                    Err_signal <= 1;
                    $display ("\n %t:\n !! trn_trem_n error (4-Header, no Payload)!", $time);
                end
              end
              else if (!tx_TLP_4DW_Hdr & !tx_TLP_Has_Data) begin
                if (trn_teof_n) begin
                  Err_signal <= 1;
                  $display ("\n %t:\n !! trn_teof_n error (3-Header, with Payload)! should be 0.", $time);
                end
                else if (trn_trem_n=='H0f) begin
                  Err_signal <= 0;
                  FSM_TLP_Fmt        <= 'H10;
                end
                else begin
                  Err_signal <= 1;
                  $display ("\n %t:\n !! trn_trem_n error (3-Header, no Payload)!", $time);
                end
              end
              else if (tx_TLP_Length=='H1) begin  // (!tx_TLP_4DW_Hdr & tx_TLP_Has_Data)
                if (trn_teof_n) begin
                  Err_signal <= 1;
                  $display ("\n %t:\n !! trn_teof_n error (3-Header, with Payload)! should be 0.", $time);
                end
                else if (trn_trem_n=='H00) begin
                  if (tx_TLP_is_CplD && (trn_td[31+32:16+32]==`C_HOST_RDREQ_ID)) begin
                    Err_signal    <= 0;
                    FSM_TLP_Fmt      <= 'H10;
                  end
                  else if (tx_TLP_is_CplD) begin
                    Err_signal   <= 1;
                    $display ("\n %t:\n !! Tx CplD Requester ID Wrong (TLP Length ==1 )!! ", $time);
                    FSM_TLP_Fmt      <= 'H10;
                  end
                  else begin
                    Err_signal    <= 0;
                    FSM_TLP_Fmt      <= 'H10;
                  end
                end
                else begin
                  Err_signal <= 1;
                  $display ("\n %t:\n !! trn_trem_n error (3-Header, no Payload)!", $time);
                end
              end
              else begin  // (!tx_TLP_4DW_Hdr & tx_TLP_Has_Data) & (tx_TLP_Length>'H1)
                if (trn_teof_n) begin
                  if (tx_TLP_is_CplD && (trn_td[31+32:16+32]==`C_HOST_RDREQ_ID)) begin
                    tx_TLP_Length      <= tx_TLP_Length - 1;
                    FSM_TLP_Fmt        <= 'H20;
                  end
                  else if (tx_TLP_is_CplD) begin
                    Err_signal   <= 1;
                    $display ("\n %t:\n !! Tx CplD Requester ID Wrong (TLP Length !=1 )!! ", $time);
                    FSM_TLP_Fmt        <= 'H20;
                  end
                  else begin
                    tx_TLP_Length      <= tx_TLP_Length - 1;
                    FSM_TLP_Fmt        <= 'H20;
                  end
                end
                else begin
                  Err_signal <= 1;
                  $display ("\n %t:\n !! trn_teof_n error (3-Header, no Payload)! should be 1.", $time);
                end
              end
              // Address-Length combination check
              if (tx_TLP_4DW_Hdr) begin
                if (({1'b0, trn_td[11:2]} + tx_TLP_Length[9:0])>11'H400) begin
                  $display ("\n %t:\n !! Tx 4KB straddled !!", $time);
                  $display ("\n Address=%08X  Length=%04X (%04X bytes)\n", trn_td[31:0], tx_TLP_Length, tx_TLP_Length<<2);
                  Err_signal <= 1;
                end
                if (trn_td[63:32]=='H0 && tx_Mem_TLP==1) begin
                  $display ("\n %t:\n !! Tx TLP should not be 4-DW headher !!", $time);
                  Err_signal <= 1;
                end
              end
              else begin
                if (({1'b0, trn_td[11+32:2+32]} + tx_TLP_Length[9:0])>11'H400) begin
                  $display ("\n %t:\n !! Tx 4KB straddled !!", $time);
                  $display ("\n Address=%08X  Length=%04X (%04X bytes)\n", trn_td[63:32], tx_TLP_Length, tx_TLP_Length<<2);
                  Err_signal <= 1;
                end
              end
            end
          end
        'H20: begin
            if ( trn_tsrc_rdy_n | trn_tdst_rdy_n) begin
              FSM_TLP_Fmt        <= 'H20;
            end
            else if (tx_TLP_Length==2) begin
              if (trn_trem_n=='H00 && trn_teof_n==0) begin
                FSM_TLP_Fmt        <= 'H10;
              end
              else begin
                $display ("\n %t:\n !! trn_teof_n/trn_trem_n error !!\n", $time);
                Err_signal <= 1;
              end
            end
            else if (tx_TLP_Length==1) begin
              if (trn_trem_n=='H0f && trn_teof_n==0) begin
                FSM_TLP_Fmt        <= 'H10;
              end
              else begin
                $display ("\n %t:\n !! trn_teof_n/trn_trem_n error !!\n", $time);
                Err_signal <= 1;
              end
            end
            else if (tx_TLP_Length==0) begin
              $display ("\n %t:\n !! Tx TLP Length error !!", $time);
              Err_signal <= 1;
            end
            else if (!trn_teof_n) begin
              $display ("\n %t:\n !! trn_teof_n too early !!", $time);
              Err_signal <= 1;
            end
            else begin
              tx_TLP_Length      <= tx_TLP_Length - 2;
              FSM_TLP_Fmt        <= 'H20;
            end
         end
        default: begin
           FSM_TLP_Fmt     <= 'H00;
         end
      endcase
   end
   reg  [ 7:00] FSM_Tx_Desc_MRd;
  // Descriptors MRd
   always @(negedge trn_clk )
   if (!trn_reset_n) begin
      FSM_Tx_Desc_MRd        <= 0;
      Desc_tx_MRd_Valid      <= 0;
   end
   else begin
      case (FSM_Tx_Desc_MRd)
        'H00: begin
            FSM_Tx_Desc_MRd       <= 'H10;
         end
        'H10: begin
           case ({ trn_tsrc_rdy_n
                 , trn_tdst_rdy_n
                 , trn_tsof_n
                 , trn_td[15]
                 })
             'B0001:
                 if ( (trn_td[31+32:24+32]=='H00 || trn_td[31+32:24+32]=='H20)
                    &&(trn_td[9+32:32]=='H8)) begin
                      Desc_tx_MRd_Leng[10]  <= (trn_td[9+32:32]==0);
                      Desc_tx_MRd_Leng[9:0] <= trn_td[9+32:32];
                      Desc_tx_MRd_TAG       <= trn_td[15:8];
                      FSM_Tx_Desc_MRd <= 'H31;
                 end
                 else begin
                      FSM_Tx_Desc_MRd <= 'H10;
                 end
              default: begin
                 FSM_Tx_Desc_MRd <= 'H10;
              end
           endcase
         end
        'H31: begin   // Low 32 bits Address
           if (trn_tsrc_rdy_n|trn_tdst_rdy_n) begin
             FSM_Tx_Desc_MRd   <= 'H31;
           end
           else begin
               Desc_tx_MRd_Addr      <= trn_td[31:00];
               Desc_tx_MRd_Valid     <= 1;
               FSM_Tx_Desc_MRd       <= 'H10;
           end
         end
        default: begin
           FSM_Tx_Desc_MRd <= 'H00;
         end
      endcase
   end
   // DMA MRd out of Tx
   reg [ 7: 0]   FSM_Tx_MRd;
   reg           tx_DMA_MRd_A64b;
   always @(negedge trn_clk )
   if (!trn_reset_n) begin
      FSM_Tx_MRd      <= 0;
      tx_MRd_come     <= 0;
   end
   else begin
      case (FSM_Tx_MRd)
        'H00: begin
            FSM_Tx_MRd       <= 'H10;
         end
        'H10: begin
           case ({ trn_tsrc_rdy_n
                 , trn_tdst_rdy_n
                 , trn_tsof_n
                 , trn_td[15]
                 })
             'B0000:
                 case (trn_td[31+32:24+32])
                   'H00: begin   // 3-dw header
                      tx_MRd_Length[9:0] <= trn_td[9+32:32];
                      tx_MRd_Length[10]  <= (trn_td[9+32:32]=='H0)?1:0;
                      tx_MRd_Tag         <= trn_td[15:8];
                      FSM_Tx_MRd         <= 'H30;
                      tx_DMA_MRd_A64b    <= 0;
                    end
                   'H20: begin   // 4-dw header
                      tx_MRd_Length[9:0] <= trn_td[9+32:32];
                      tx_MRd_Length[10]  <= (trn_td[9+32:32]=='H0)?1:0;
                      tx_MRd_Tag         <= trn_td[15:8];
                      FSM_Tx_MRd         <= 'H30;
                      tx_DMA_MRd_A64b    <= 1;
                    end
                   default: begin
                      FSM_Tx_MRd <= 'H10;   // Idle
                    end
                 endcase
              default: begin
                 FSM_Tx_MRd <= 'H10;
              end
           endcase
         end
        'H30: begin
           if (trn_tsrc_rdy_n|trn_tdst_rdy_n) begin
             FSM_Tx_MRd <= 'H30;
           end
           else if( trn_td[1:0]==0) begin
             FSM_Tx_MRd <= 'H10;
             tx_MRd_come <= 'B1;
           end
           else begin
             $display ("\n %t:\n !! Bad TLP Address for Tx MRd !!", $time);
             Err_signal <= 1;
           end
        end
        default: begin
           FSM_Tx_MRd <= 'H00;
         end
      endcase
   end
   // Msg checking ...
   reg [7: 0] fsm_Tx_Msg;
   reg [3: 0] tx_Msg_Tag_Lo;
   always @(negedge trn_clk )
   if (!trn_reset_n) begin
      fsm_Tx_Msg      <= 0;
      tx_Msg_Tag_Lo   <= 1;
   end
   else begin
      case (fsm_Tx_Msg)
        'H00: begin
            fsm_Tx_Msg    <= 'H10;
         end
        'H10: begin
           case ({ trn_tsrc_rdy_n
                 , trn_tdst_rdy_n
                 , trn_tsof_n
                 })
             'B000:
                 if (trn_td[31+32:28+32]=='H3) begin
                    fsm_Tx_Msg    <= 'H30;
                    if ( trn_td[11:8] != tx_Msg_Tag_Lo ) begin
                      $display ("\n %t:\n !! Msg Tag bad !!", $time, trn_td[11:8]);
                      Err_signal <= 1;
                    end
                    else if ( trn_td[7:0] == `C_MSG_CODE_INTA ) begin
//                      fsm_Tx_Msg   <= 'H30;
                      Accum_Msg_INTA <= Accum_Msg_INTA + 1;
                    end
                    else if ( trn_td[7:0] == `C_MSG_CODE_INTA_N ) begin
//                      fsm_Tx_Msg   <= 'H30;
                      Accum_Msg_INTA_n <= Accum_Msg_INTA_n + 1;
                    end
                    else begin
                      $display ("\n %t:\n !! Bad Msg code (0x%2x) !!", $time, trn_td[7:0]);
                      Err_signal <= 1;
                    end
                 end
                 else begin
                      fsm_Tx_Msg    <= 'H10;
                 end
              default: begin
                 fsm_Tx_Msg    <= 'H10;
              end
           endcase
         end
        'H30: begin
           if (trn_tsrc_rdy_n|trn_tdst_rdy_n) begin
             fsm_Tx_Msg <= 'H30;
           end
           else if (trn_td) begin
             $display ("\n %t:\n !! Msg data bad!!", $time);
             Err_signal <= 1;
           end
           else begin
             fsm_Tx_Msg <= 'H10;
             tx_Msg_Tag_Lo  <= tx_Msg_Tag_Lo + 1;
           end
         end
        default: begin
           fsm_Tx_Msg  <= 'H00;
         end
      endcase
   end
   // ================================================= //
   // =======     Interrupt uneven checking     ======= //
   // ================================================= //
   always @ Accum_Msg_INTA
     if (Accum_Msg_INTA>Accum_Msg_INTA_n+1) begin
        $display("\n\n  INTA overrun at %t\n\n", $time);
        Err_signal <= 1;
     end
   always @ Accum_Msg_INTA_n
     if (Accum_Msg_INTA_n>Accum_Msg_INTA) begin
        $display("\n\n  #INTA overrun at %t\n\n", $time);
        Err_signal <= 1;
     end
  //                   Tasks                   //
  //   Wait for the next positive clock event  //
  task To_the_next_Event;
  begin
    wait (!trn_clk);
    wait (trn_clk);
    # `T_DELAY_AFTER ;
  end
  endtask
  //   Wait for the next negative clock event  //
  task To_the_next_Tx_Data;
  begin
    wait (trn_clk);
    wait (!trn_clk);
    # `T_DELAY_AFTER ;
  end
  endtask
  //   Insert GAP                              //
  task Gap_Insert_Rx;
  begin
    To_the_next_Event;
    trn_rsof_n <= 1;
    trn_reof_n <= 1;
    trn_rsrc_rdy_n <= 1;
    trn_rbar_hit_n <= `C_NO_BAR_HIT;
    trn_rd <= -1;
    trn_rrem_n <= -1;
  end
  endtask
  //   Feed TLP to Rx: MRd, MWr, Cpl/D, Msg    //
  task TLP_Feed_Rx;
    input         Use_Private_Array;   // Public or private
    input [11:0]  IndexA;              // Start point in the Array
    input [ 6:0]  BAR_Hit_N;           // Which BAR is hit
//    integer       hdr_Leng;
    reg           TLP_has_Payload;
    reg           TLP_hdr_4DW;
    reg   [10:0]  jr;
    reg   [10:0]  payload_Leng;
  begin
    // TLP format extraction
    TLP_has_Payload     <= Hdr_Array[0][30] ;
//    hdr_Leng            <= Hdr_Array[0][29] + 3;
    TLP_hdr_4DW         <= Hdr_Array[0][29];
    // Header #0
    To_the_next_Event;
    trn_rsof_n          <= 0;
    trn_reof_n          <= 1;
    trn_rsrc_rdy_n      <= 0;
    trn_rbar_hit_n      <= BAR_Hit_N;
    trn_rd              <= {Hdr_Array[0], Hdr_Array[1]};
    trn_rrem_n          <= 0;
    payload_Leng        <= {Hdr_Array[0][9:0]?1'b0:1'b1, Hdr_Array[0][9:0]};
    // Header words # 1
    for (jr=1; jr<2; jr=jr+1) begin
      To_the_next_Event;
      trn_rsrc_rdy_n  <= trn_rsrc_rdy_n_seed;
      if (trn_rsrc_rdy_n_seed) begin
          trn_rsof_n    <= trn_rsof_n;
          trn_rd        <= trn_rd;
          trn_rrem_n    <= trn_rrem_n;
          trn_reof_n    <= trn_reof_n;
//          #0.1    jr    <= jr-1;
          jr             = jr-1;      // !! not <= !!
        end
      else begin
          trn_rsof_n    <= 1;
          if (TLP_hdr_4DW) begin
            trn_rrem_n    <= 'H00;
            trn_rd        <= {Hdr_Array[2], Hdr_Array[3]};
          end
          else if (TLP_has_Payload) begin
            trn_rrem_n    <= 'H00;
            if (Use_Private_Array)
              trn_rd        <= {Hdr_Array[2],Inv_Endian (Private_Array[IndexA])};
            else
              trn_rd        <= {Hdr_Array[2],Inv_Endian (D_Array[IndexA])};
          end
          else begin
            trn_rrem_n    <= 'H0f;
            trn_rd        <= {Hdr_Array[2], 32'H0};
          end
          if (payload_Leng<='H1 && TLP_hdr_4DW==0) begin
            trn_reof_n    <= 0;
          end
          else if (!TLP_has_Payload) begin
            trn_reof_n    <= 0;
          end
          else begin
            trn_reof_n    <= 1;
          end
        end
    end    // Header done.
    // Payload data ...
    if ((TLP_has_Payload && TLP_hdr_4DW) || (TLP_has_Payload && (payload_Leng>'H1) && !TLP_hdr_4DW))
       for (jr=(!TLP_hdr_4DW); jr<payload_Leng; jr=jr+2) begin
         To_the_next_Event;
         trn_rsrc_rdy_n <= trn_rsrc_rdy_n_seed;
         if (trn_rsrc_rdy_n_seed) begin
           trn_rd       <= trn_rd;
           trn_rrem_n   <= trn_rrem_n;
           trn_reof_n   <= trn_reof_n;
//           #0.1    jr   <= jr-1;
           jr            = jr-2;      // !! not <= !!
         end
         else begin
           if (jr==payload_Leng-1 || jr==payload_Leng-2) begin
             trn_reof_n   <= 0;
           end
           else begin
             trn_reof_n   <= 1;
           end
           if (jr==payload_Leng-1) begin
             trn_rrem_n   <= 'H0f;
             if (Use_Private_Array)
               trn_rd     <= {Inv_Endian(Private_Array[IndexA+jr]), 32'Hffff_ffff};
             else
               trn_rd     <= {Inv_Endian(D_Array[IndexA+jr]), 32'Hffff_ffff};
           end
           else begin
             trn_rrem_n   <= 'H00;
             if (Use_Private_Array)
               trn_rd     <= {Inv_Endian(Private_Array[IndexA+jr]), Inv_Endian(Private_Array[IndexA+jr+1])};
             else
               trn_rd     <= {Inv_Endian(D_Array[IndexA+jr]), Inv_Endian(D_Array[IndexA+jr+1])};
           end
         end
       end
    // Payload done.
  end
  endtask
  //   Function -  Endian Inversion 64-bit   //
   function [31:00] Inv_Endian;
   input [31:00] Data;
   begin
      Inv_Endian = {Data[ 7: 0], Data[15: 8], Data[23:16], Data[31:24]};
   end
   endfunction
endmodule