module
  assign mrd_s = (mwaddr == mraddr) ? 1'b0 : win_ready;
  assign maddrdiff_s = {1'b1, mwaddr} - mraddr;
  assign mxfer_s = win_ready | ~win_valid;
  always @(posedge clk) begin
    maddrdiff <= maddrdiff_s[5:0];
    if (maddrdiff >= 32) begin
      adc_ready <= 1'b0;
    end else if (maddrdiff <= 20) begin
      adc_ready <= 1'b1;
    end
  end
  // read and address update
  always @(posedge clk) begin
    if (mrd_s == 1'b1) begin
      mraddr <= mraddr + 1'b1;
    end
    mrd <= mrd_s;
    mrvalid <= mrd;
    mrdata <= mrdata_s;
  end
  // hold data during sudden death (ready de-asserted!)
  always @(posedge clk) begin
    if (mrvalid == 1'b1) begin
      mwcnt <= mwcnt + 1'b1;
    end
    if ((mwcnt == 2'd0) && (mrvalid == 1'b1)) begin
      mvalid_0 <= 1'b1;
      mdata_0 <= mrdata;
    end else if ((mrcnt == 2'd0) && (mxfer_s == 1'b1)) begin
      mvalid_0 <= 1'b0;
      mdata_0 <= 17'd0;
    end
    if ((mwcnt == 2'd1) && (mrvalid == 1'b1)) begin
      mvalid_1 <= 1'b1;
      mdata_1 <= mrdata;
    end else if ((mrcnt == 2'd1) && (mxfer_s == 1'b1)) begin
      mvalid_1 <= 1'b0;
      mdata_1 <= 17'd0;
    end
    if ((mwcnt == 2'd2) && (mrvalid == 1'b1)) begin
      mvalid_2 <= 1'b1;
      mdata_2 <= mrdata;
    end else if ((mrcnt == 2'd2) && (mxfer_s == 1'b1)) begin
      mvalid_2 <= 1'b0;
      mdata_2 <= 17'd0;
    end
    if ((mwcnt == 2'd3) && (mrvalid == 1'b1)) begin
      mvalid_3 <= 1'b1;
      mdata_3 <= mrdata;
    end else if ((mrcnt == 2'd3) && (mxfer_s == 1'b1)) begin
      mvalid_3 <= 1'b0;
      mdata_3 <= 17'd0;
    end
    if ((mrcnt != mwcnt) && (win_ready == 1'b1)) begin
      mrcnt <= mrcnt + 1'b1;
    end
    if ((win_valid == 1'b0) || (win_ready == 1'b1)) begin
      case (mrcnt)
        2'd3: begin
          win_valid <= mvalid_3;
          win_data <= mdata_3[15:0];
          win_last <= mdata_3[16] & mvalid_3;
        end
        2'd2: begin
          win_valid <= mvalid_2;
          win_data <= mdata_2[15:0];
          win_last <= mdata_2[16] & mvalid_2;
        end
        2'd1: begin
          win_valid <= mvalid_1;
          win_data <= mdata_1[15:0];
          win_last <= mdata_1[16] & mvalid_1;
        end
        default: begin
          win_valid <= mvalid_0;
          win_data <= mdata_0[15:0];
          win_last <= mdata_0[16] & mvalid_0;
        end
      endcase
    end
  end
endmodule