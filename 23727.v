module outputs)
   wire [7:0]     dout_o;              // From uart_ of sasc_top.v
   wire           empty_o;             // From uart_ of sasc_top.v
   wire           full_o;              // From uart_ of sasc_top.v
   wire           sio_ce;              // From baud_ of sasc_brg.v
   wire           sio_ce_x4;           // From baud_ of sasc_brg.v
   // End of automatics
   wire           cmdRd;
   wire           cmdMem;
   reg            re_i;
   reg            we_i;
   sasc_top uart_ (// Outputs
                   .txd_o               (uart_tx),
                   .rts_o               (),
                   // Inputs
                   .rxd_i               (uart_rx),
                   .cts_i               (1'b0),
                   .rst_n               (arst_n),
                   /*AUTOINST*/
                   // Outputs
                   .dout_o              (dout_o[7:0]),
                   .full_o              (full_o),
                   .empty_o             (empty_o),
                   // Inputs
                   .clk                 (clk),
                   .sio_ce              (sio_ce),
                   .sio_ce_x4           (sio_ce_x4),
                   .din_i               (din_i[7:0]),
                   .re_i                (re_i),
                   .we_i                (we_i));
   sasc_brg baud_ (/*AUTOINST*/
                   // Outputs
                   .sio_ce              (sio_ce),
                   .sio_ce_x4           (sio_ce_x4),
                   // Inputs
                   .clk                 (clk),
                   .arst_n              (arst_n));
   always @ (posedge clk or negedge arst_n)
     if (~arst_n)
       state <= stIdle;
     else
       case (state)
         stIdle : if (~empty_o) state <= stCmd1;
         stCmd1 : if (~empty_o) state <= stCmd2;
         stCmd2 : if (cmdRd)    state <= stRd;    // read
         else if (~empty_o)     state <= stData1;         // write
         stData1: if (cmdRd)    state <= stData2; // read
         else if (~empty_o)     state <= stData2;         // write
         stData2: if (cmdRd)    state <= stData3; // read
         else if (~empty_o)     state <= stData3;         // write
         stData3: if (cmdRd)    state <= stIdle;  // read done
         else                   state <= stWr;            // write commit
         stWr:                  state <= stIdle;
         stRd:                  state <= stData1;
       endcase // case(state)
   always @ (posedge clk or negedge arst_n)
     if (~arst_n)            cmd <= 0;
     else
       begin
          if (state==stIdle) cmd[15:8] <= dout_o[7:0];
          if (state==stCmd1) cmd[7:0]  <= dout_o[7:0];
       end
   assign cmdRd     = ~cmd[15];
   assign cmdMem    = cmd[14];
   assign uart_addr = cmd[13:0];
   always @ (posedge clk or negedge arst_n)
     if (~arst_n)
       uart_dout <= 0;
     else
       begin
          if (state==stCmd2 & ~cmdRd) uart_dout[23:16] <= dout_o[7:0];
          if (state==stData1 & ~cmdRd) uart_dout[15:8] <= dout_o[7:0];
          if (state==stData2 & ~cmdRd) uart_dout[7:0]  <= dout_o[7:0];
       end
   always @ (/*AS*/cmdRd or empty_o or state)
     case (state)
       stIdle : re_i = ~empty_o;
       stCmd1 : re_i = ~empty_o;
       stCmd2 : re_i = ~empty_o & ~cmdRd;
       stData1: re_i = ~empty_o & ~cmdRd;
       stData2: re_i = ~empty_o & ~cmdRd;
       default: re_i = 0;
     endcase // case(state)
   assign uart_mem_we = (state==stWr) & cmdMem;
   assign reg_we      = (state==stWr) & ~cmdMem;
   always @ (/*AS*/cmdMem or state or uart_mem_i or uart_reg_i)
     case (state)
       stData2: din_i[7:0] = cmdMem ? uart_mem_i[15:8]  : uart_reg_i[15:8];
       stData3: din_i[7:0] = cmdMem ? uart_mem_i[7:0]   : uart_reg_i[7:0];
       default: din_i[7:0] = cmdMem ? uart_mem_i[23:16] : uart_reg_i[23:16];
     endcase // case(state)
   always @ (/*AS*/cmdRd or state)
     case (state)
       stData1: we_i = cmdRd;
       stData2: we_i = cmdRd;
       stData3: we_i = cmdRd;
       default: we_i = 0;
     endcase // case(state)
   assign uart_mem_re = (state==stRd);
endmodule