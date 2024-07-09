module
     // If the received data beat is less than 8bytes then the pipe1 data & control
     // is passed on to the  m_axi_rx_tdata  bus
     assign pipe2_rx_pe_data_r = raw_data_r2[73:2+STRB_WIDTH];
     assign pipe2_rx_keep      = raw_data_r2[2+STRB_WIDTH-1:2];
     assign pipe2_rx_sep_r     = raw_data_r2[1];
     assign pipe2_rx_sep7_r    = raw_data_r2[0];
     // rx_pdu_ok_c is set when received block is data block
     always @ (posedge USER_CLK)
     begin
         rx_pdu_ok <= `DLY ((rx_pe_data_v_r  | (rx_pe_data_v_r & ((pipe1_rx_sep_r  & !pipe1_rx_keep[STRB_WIDTH-1]) | pipe1_rx_sep7_r)))  );
     end
     // Special condition to handle gearbox push coincide with data/sep/sep7
     assign sep_conic_dv = (hold_valid & (rx_pe_data_v_r2 & !(pipe2_rx_sep_r | pipe2_rx_sep7_r)));
     assign dv_conic_sep = hold_valid & rx_ll_dv_r1 & !rx_cc_r1  & rx_pe_data_v_r  & !(pipe2_rx_sep_r | pipe2_rx_sep7_r);
     always @(*)
     begin
       if (rx_pdu_ok & (rx_cc_r1 | !rx_ll_dv_r1  | (!rx_pe_data_v_r & !sep0_detect)))
         hold_valid = 1'b1;
       else if (hold_valid_r & (rx_cc_r2 | !rx_ll_dv_r2  | !rx_pe_data_v_r2))
         hold_valid = 1'b1;
       else
         hold_valid = 1'b0;
     end
     always @ (posedge USER_CLK)
     begin
       if(!CHANNEL_UP)
         hold_valid_r <= `DLY 1'b0;
       else
         hold_valid_r <= `DLY hold_valid;
     end
     assign rx_tvalid_c  = (rx_pdu_ok | dv_conic_sep | sep0_detect);
     assign pipe1_rx_pdu_in_progress_c = ((rx_pe_data_v_c  | ( rx_sep_c | rx_sep7_c)  ) & (!rx_cc_c)) ;
     always @(posedge USER_CLK)
     begin
         if (rx_tvalid_c)
           m_axi_rx_tdata  <=  `DLY pipe2_rx_pe_data_r;
     end
     //Register the m_axi_rx_tvalid signal
     always @(posedge USER_CLK)
     begin
         if(!CHANNEL_UP)
            m_axi_rx_tvalid   <=  `DLY 1'b0;
         else if (sep_conic_dv)
            m_axi_rx_tvalid   <=  `DLY 1'b0;
         else
            m_axi_rx_tvalid   <=  `DLY rx_tvalid_c;
     end
     assign sep_detect  = ((pipe2_rx_sep_r & !pipe2_rx_keep[STRB_WIDTH-1]) | pipe2_rx_sep7_r );
     assign sep0_detect = (rx_sep_r & pipe1_rx_keep[STRB_WIDTH-1]);
     always @(posedge USER_CLK)
     begin
       if(!CHANNEL_UP)
         m_axi_rx_tlast  <=  `DLY 1'b0;
       else if (rx_tvalid_c)
         m_axi_rx_tlast  <=  `DLY sep_detect | sep0_detect;
       else
         m_axi_rx_tlast  <=  `DLY 1'b0;
     end
    assign rx_txkeep_c    = pipe1_rx_keep;
    assign rx_txkeep_c_1  = pipe2_rx_keep;
     //SEP_NB is assigned to m_axi_rx_tkeep
     always @(posedge USER_CLK)
     begin
         if (sep_detect)
            m_axi_rx_tkeep  <=  `DLY    rx_txkeep_c_1;
         else if (sep0_detect)
            m_axi_rx_tkeep  <=  `DLY    rx_txkeep_c;
         else
            m_axi_rx_tkeep  <=  `DLY    {8{1'b1}};
     end
 endmodule