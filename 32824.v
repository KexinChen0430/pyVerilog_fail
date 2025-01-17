module select
  input  wire         req,      // H:request
  input  wire [3:0]   command,  // SPI command
                                // 0000 : write command
                                // 0001 : write data
                                // 0100 : read  8bit command
                                // 0101 : read 16bit command
                                // 0110 : read 24bit command
                                // 0111 : read 32bit command
                                // 1000 : start write pixel data (only down cs)
                                // 1001 : write pixel data (scl, sda)
                                // 1010 : end write pixel data (only up cs)
  input  wire [17:0]  wdata,    //
  // MCSÖÌoÍ
  output wire [31:0]  rdata,    //
  output wire         ack,      // H:ack
  // FPGAOÖÌüoÍ
  output wire         oSCL,     //
  output wire         oDCX,     //
  output wire         oCSX,     //
  inout  wire         oSDA      //
);
  // W[ZNgÆreqðand
  wire mod_req = mod_sel & req;
  reg r_rw;
  reg r_dcx;
  reg [17:0] r_wdata;
  reg [1:0] r_readsize;
  reg [7:0] r_state;
  // SPI R}h
  parameter C_WRITE_COMMAND   = 4'b0000;
  parameter C_WRITE_DATA      = 4'b0001;
  parameter C_READ8_COMMAND   = 4'b0100;
  parameter C_READ16_COMMAND  = 4'b0101;
  parameter C_READ24_COMMAND  = 4'b0110;
  parameter C_READ32_COMMAND  = 4'b0111;
  parameter C_START_PIXEL     = 4'b1000;
  parameter C_WRITE_PIXEL     = 4'b1001;
  parameter C_END_PIXEL       = 4'b1010;
  // R/WXe[g
  parameter S_IDLE  = 0;
  parameter S_WRITE = 1;
  parameter S_READ  = 2;
  parameter S_READ_DMY = 3;
  parameter S_END = 4;
  // SPINbN¶¬
  // NbNÍ1Xe[gÔÅ§¿ãªèA§¿ºªè
  // E«ÝÍ1SCL = 8cyc
  // =X=======X=======
  // ___|~~~|___|~~~|___
  // EÇÝoµÍ1SCL = 16cyc
  // =X===============X===============
  // _____|~~~~~~~|_______|~~~~~~~|___
  // SCLKJE^ÌTCN(read:8cyc / write:4cyc)
  // SCLK§¿º°JE^  (read:3cyc / write 1cyc)
  // IDLEAENDÍíÉâ~
  wire [4:0]  w_scl_cyc     = (r_rw) ? 5'd31 : 5'd15; //
  wire [4:0]  w_scl_downcyc = (r_rw) ? 5'd24 : 5'd12; //
  wire [4:0]  w_scl_upcyc   = (r_rw) ? 5'd8  : 5'd4; //
  reg [4:0] r_sclcnt;
  always @(posedge clk) begin
         if(rsth)                   r_sclcnt <= 5'd0;
    else if(r_sclcnt == w_scl_cyc)  r_sclcnt <= 5'd0;
    else                            r_sclcnt <= r_sclcnt + 5'd1;
  end
  reg r_scl;
  wire w_scl_stop = (r_state == S_IDLE) | (r_state == S_END);
  always @(posedge clk) begin
    if(rsth | w_scl_stop) r_scl <= 1'b0;
    else if(r_sclcnt == w_scl_downcyc)  r_scl <= 1'b0;
    else if(r_sclcnt == w_scl_upcyc)    r_scl <= 1'b1;
  end
  wire  w_en_state = (r_rw) ? (r_sclcnt == 5'd4) : (r_sclcnt == 5'd0);
  // req§¿ãªèmÅp[^¶¬
  reg r_req;
  always @(posedge clk) begin
    if(rsth) r_req <= 1'b0;
    else     r_req <= mod_req;
  end
  wire  w_req_pe = ~r_req & mod_req;
  // reqÅeíf[^ðb`
  reg [3:0] r_command;
  reg [1:0] w_readsize;
  reg w_rw;
  always @(*) begin
    case (command)
      C_READ16_COMMAND  : w_readsize = 2'b01;
      C_READ24_COMMAND  : w_readsize = 2'b10;
      C_READ32_COMMAND  : w_readsize = 2'b11;
      default           : w_readsize = 2'b00;
    endcase
  end
  always @(*) begin
    case (command)
      C_READ8_COMMAND   : w_rw = 1'b1;
      C_READ16_COMMAND  : w_rw = 1'b1;
      C_READ24_COMMAND  : w_rw = 1'b1;
      C_READ32_COMMAND  : w_rw = 1'b1;
      default           : w_rw = 1'b0;
    endcase
  end
  always @(posedge clk) begin
    if(rsth) begin
      r_rw        <= 1'b0;
      r_dcx       <= 1'b0;
      r_wdata     <= 18'd0;
      r_readsize  <= 2'b00;
      r_command   <= 4'd0;
    end
    else if(w_req_pe) begin
      r_rw        <= w_rw;
      r_dcx       <= ~(  (command == C_WRITE_COMMAND)
                       | (command == C_READ8_COMMAND)
                       | (command == C_READ16_COMMAND)
                       | (command == C_READ24_COMMAND)
                       | (command == C_READ32_COMMAND));
      r_wdata     <= wdata;
      r_readsize  <= w_readsize;
      r_command   <= command;
    end
  end
  wire is_pixel_command = (r_command == C_START_PIXEL) | (r_command == C_WRITE_PIXEL) | (r_command == C_END_PIXEL);
  // req§¿ãªèmÌÛ
  reg r_req_detected;
  always @(posedge clk) begin
    if(rsth) r_req_detected <= 1'b0;
    else if(w_req_pe & ~((command == C_START_PIXEL) | (command == C_END_PIXEL))) r_req_detected <= 1'b1;
    else if(r_state == S_END) r_req_detected <= 1'b0;
  end
  // Xe[g}V
  // Xe[gÌJÚÍAread:1cycÅAwrite:0cycÅs¤
  // pÓ·éXe[gÍ
  //  IDLE:
  //  WRITE:
  //  READ:
  reg [4:0] r_remain_transdata;
  reg [4:0] r_remain_read;
  always @(posedge clk) begin
    if(rsth) r_state <= S_IDLE;
    else if(w_en_state) begin
      case(r_state)
        S_IDLE: begin
          // reqªüÍ³ê½çàêÈ­WRITEXe[gÉJÚ
          if(r_req_detected) begin
            r_state <= S_WRITE;
          end
        end
        S_WRITE: begin
          // f[^oÍXe[g
          // cèÌoÍf[^ª0ÉÈÁ½ç
          //  r_rw = 1ÌêAREAD_DMYXe[gÉJÚ
          //  r_rw = 0ÌêAENDXe[gÉJÚ
          if(r_remain_transdata == 5'd0) begin
            r_state <= (r_rw) ? ((r_readsize == 0) ? S_READ : S_READ_DMY) : S_END;
          end
        end
        S_READ_DMY: r_state <= S_READ;  // ½àµÈ¢ÅREADÉJÚ
        S_READ: begin
          // f[^ÇÝoµXe[g
          // cèÌÇÝoµf[^ª0ÉÈÁ½çENDÉJÚ
          if(r_remain_read == 5'd0) r_state <= S_END;
        end
        S_END: begin
          r_state <= S_IDLE;
        end
        default: r_state <= S_IDLE;
      endcase
    end
  end
  // f[^ÇÝoµ
  reg [31:0] r_rdata;
  always @(posedge clk) begin
    if(rsth) r_remain_read <= 5'd0;
    else if(w_en_state) begin
      if(r_state == S_IDLE)      r_remain_read <= (r_readsize * 8 + 5'd7);
      else if(r_state == S_READ) r_remain_read <= r_remain_read - 5'd1;
    end
  end
  always @(posedge clk) begin
    if(rsth) r_rdata <= 32'd0;
    else if((r_state == S_IDLE) && r_req_detected)  r_rdata <= 32'd0;
    else if(w_scl_upcyc) begin
      if(r_state == S_READ)                   r_rdata[r_remain_read] <= oSDA;
    end
  end
  // f[^]
  // SDA
  reg [4:0] w_remain_transdata;
  always @(*) begin
    case(command)
      C_WRITE_PIXEL   : w_remain_transdata = 5'd23;
      default         : w_remain_transdata = 5'd7;
    endcase
  end
  always @(posedge clk) begin
    if(rsth)  r_remain_transdata <= 5'd0;
    else if(w_en_state) begin
      if((r_state == S_IDLE) && r_req_detected)    r_remain_transdata <= w_remain_transdata;
      else if(r_remain_transdata == 5'd0) r_remain_transdata <= 5'd0;
      else                                r_remain_transdata <= r_remain_transdata - 5'd1;
    end
  end
  reg r_sda;
  reg [22:0] r_wdata_sda;
  always @(posedge clk) begin
    if(rsth) r_wdata_sda <= 23'd0;
    else if(w_en_state) begin
      if((r_state == S_IDLE) && r_req_detected) begin
        if(r_command == C_WRITE_PIXEL) begin
          r_wdata_sda[22:0] <= {
            2'b00,
            r_wdata[0],
            r_wdata[1],
            r_wdata[2],
            r_wdata[3],
            r_wdata[4],
            r_wdata[5],
            2'b00,
            r_wdata[6],
            r_wdata[7],
            r_wdata[8],
            r_wdata[9],
            r_wdata[10],
            r_wdata[11],
            2'b00,
            r_wdata[12],
            r_wdata[13],
            r_wdata[14],
            r_wdata[15],
            r_wdata[16]
            };
        end
        else begin
          r_wdata_sda[22:0] <= {
            16'd0,
            r_wdata[0], r_wdata[1], r_wdata[2], r_wdata[3], r_wdata[4], r_wdata[5], r_wdata[6]};
        end
      end
      else if(r_state == S_WRITE)       r_wdata_sda[22:0] <= {1'b0, r_wdata_sda[22:1]};
    end
  end
  always @(posedge clk) begin
    if(rsth) r_sda <= 1'bz;
    else if(w_en_state) begin
      if((r_state == S_IDLE) && r_req_detected)  r_sda <= (r_command == C_WRITE_PIXEL) ? r_wdata[17]
                                                                                       : r_wdata[7];      // «ÝÍMSB©ç
      else if(r_state == S_WRITE) begin
        if(r_remain_transdata == 5'd0)
          r_sda <= 1'bz;
        else
          r_sda <= r_wdata_sda[0];  // r_wdata_sdaÍCgf[^ðMSB/LSB½]µ½àÌ
      end
    end
  end
  // CS
  // «ÝÉAT[g
  // I¹ÉlQ[g
  reg r_cs;
  always @(posedge clk) begin
    if(rsth) begin
      r_cs <= 1'b1;
    end
    else if(w_req_pe & (command == C_START_PIXEL)) begin
      r_cs <= 1'b0;
    end
    else if(w_req_pe & (command == C_END_PIXEL)) begin
      r_cs <= 1'b1;
    end
    else if(w_en_state & ~is_pixel_command) begin
      if((r_state == S_IDLE) && r_req_detected) begin
        r_cs <= 1'b0;
      end
      else if(~r_rw) begin // «ÝÍ«Ý®¹ÅlQ[g
        if((r_state == S_WRITE) && (r_remain_transdata == 3'd0)) begin
          r_cs <= 1'b1;
        end
      end
      else begin  // ÇÝoµÍÇÝoµ®¹ÅlQ[g
        if((r_state == S_READ) && (r_remain_read == 5'd0)) begin
//    else begin  // ÇÝoµÍENDÉJÚµÄ©çlQ[g
//      if(r_state == S_END) begin
          r_cs <= 1'b1;
        end
      end
    end
  end
  // D/CX
  // «ÝÉb`µ½dcxðAT[g
  // I¹ÉlQ[g
  reg r_dcx_out;
  always @(posedge clk) begin
    if(rsth) begin
      r_dcx_out <= 1'b1;
    end
    else if(w_en_state) begin
      if((r_state == S_IDLE) && r_req_detected) begin
        r_dcx_out <= r_dcx;
      end
      else if((r_state == S_WRITE) && (r_remain_transdata == 3'd0)) begin
        r_dcx_out <= 1'b1;
      end
    end
  end
  // ACK
  //  ACKÍREQÅNAAXe[gªI¹ÜÅJÚµ½çAT[g
  reg r_ack;
  always @(posedge clk) begin
    if(rsth)                    r_ack <= 1'b1;
    else if(w_req_pe & ~((command == C_START_PIXEL) | (command == C_END_PIXEL))) r_ack <= 1'b0;
    else if(w_en_state) begin
      if(r_state == S_END)      r_ack <= 1'b1;
    end
  end
  // oÍ
  assign rdata = r_rdata;
  assign ack   = r_ack;
  assign oSCL  = r_scl;
  assign oDCX  = r_dcx_out;
  assign oCSX  = r_cs;
  assign oSDA  = r_sda;
endmodule