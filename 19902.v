module
  always @(posedge CLK) RST_INI <= RST;
  reg [`SORTW-1:0] i_p,i_o,i_n,i_m,i_l,i_k,i_j,i_i,i_h,i_g,i_f,i_e,i_d,i_c,i_b,i_a;
  generate
    if (`INITTYPE == "xorshift") begin
      wire [`SORTW-1:0] r15,r14,r13,r12,r11,r10,r09,r08,r07,r06,r05,r04,r03,r02,r01,r00;
      XORSHIFT #(`SORTW, 32'h00000001) xorshift00(CLK, RST_INI, d_w, r00);
      XORSHIFT #(`SORTW, 32'h00000002) xorshift01(CLK, RST_INI, d_w, r01);
      XORSHIFT #(`SORTW, 32'h00000004) xorshift02(CLK, RST_INI, d_w, r02);
      XORSHIFT #(`SORTW, 32'h00000008) xorshift03(CLK, RST_INI, d_w, r03);
      XORSHIFT #(`SORTW, 32'h00000010) xorshift04(CLK, RST_INI, d_w, r04);
      XORSHIFT #(`SORTW, 32'h00000020) xorshift05(CLK, RST_INI, d_w, r05);
      XORSHIFT #(`SORTW, 32'h00000040) xorshift06(CLK, RST_INI, d_w, r06);
      XORSHIFT #(`SORTW, 32'h00000080) xorshift07(CLK, RST_INI, d_w, r07);
      XORSHIFT #(`SORTW, 32'h00000100) xorshift08(CLK, RST_INI, d_w, r08);
      XORSHIFT #(`SORTW, 32'h00000200) xorshift09(CLK, RST_INI, d_w, r09);
      XORSHIFT #(`SORTW, 32'h00000400) xorshift10(CLK, RST_INI, d_w, r10);
      XORSHIFT #(`SORTW, 32'h00000800) xorshift11(CLK, RST_INI, d_w, r11);
      XORSHIFT #(`SORTW, 32'h00001000) xorshift12(CLK, RST_INI, d_w, r12);
      XORSHIFT #(`SORTW, 32'h00002000) xorshift13(CLK, RST_INI, d_w, r13);
      XORSHIFT #(`SORTW, 32'h00004000) xorshift14(CLK, RST_INI, d_w, r14);
      XORSHIFT #(`SORTW, 32'h00008000) xorshift15(CLK, RST_INI, d_w, r15);
      always @(posedge CLK) begin
        i_a <= r00;
        i_b <= r01;
        i_c <= r02;
        i_d <= r03;
        i_e <= r04;
        i_f <= r05;
        i_g <= r06;
        i_h <= r07;
        i_i <= r08;
        i_j <= r09;
        i_k <= r10;
        i_l <= r11;
        i_m <= r12;
        i_n <= r13;
        i_o <= r14;
        i_p <= r15;
      end
    end else if (`INITTYPE == "reverse") begin
      always @(posedge CLK) begin
        if (RST_INI) begin
          i_a <= `SORT_ELM+16;
          i_b <= `SORT_ELM+16-1;
          i_c <= `SORT_ELM+16-2;
          i_d <= `SORT_ELM+16-3;
          i_e <= `SORT_ELM+16-4;
          i_f <= `SORT_ELM+16-5;
          i_g <= `SORT_ELM+16-6;
          i_h <= `SORT_ELM+16-7;
          i_i <= `SORT_ELM+16-8;
          i_j <= `SORT_ELM+16-9;
          i_k <= `SORT_ELM+16-10;
          i_l <= `SORT_ELM+16-11;
          i_m <= `SORT_ELM+16-12;
          i_n <= `SORT_ELM+16-13;
          i_o <= `SORT_ELM+16-14;
          i_p <= `SORT_ELM+16-15;
        end else begin
          if (d_w) begin
            i_a <= i_a-16;
            i_b <= i_b-16;
            i_c <= i_c-16;
            i_d <= i_d-16;
            i_e <= i_e-16;
            i_f <= i_f-16;
            i_g <= i_g-16;
            i_h <= i_h-16;
            i_i <= i_i-16;
            i_j <= i_j-16;
            i_k <= i_k-16;
            i_l <= i_l-16;
            i_m <= i_m-16;
            i_n <= i_n-16;
            i_o <= i_o-16;
            i_p <= i_p-16;
          end
        end
      end
    end else if (`INITTYPE == "sorted") begin
      reg ocen;
      always @(posedge CLK) begin
        if (RST_INI) begin
          ocen <= 0;
          i_a  <= 1;
          i_b  <= 2;
          i_c  <= 3;
          i_d  <= 4;
          i_e  <= 5;
          i_f  <= 6;
          i_g  <= 7;
          i_h  <= 8;
          i_i  <= 9;
          i_j  <= 10;
          i_k  <= 11;
          i_l  <= 12;
          i_m  <= 13;
          i_n  <= 14;
          i_o  <= 15;
          i_p  <= 16;
        end else begin
          if (d_w) begin
            ocen <= 1;
            i_a  <= mux32(i_a, i_a+16, ocen);
            i_b  <= mux32(i_b, i_b+16, ocen);
            i_c  <= mux32(i_c, i_c+16, ocen);
            i_d  <= mux32(i_d, i_d+16, ocen);
            i_e  <= mux32(i_e, i_e+16, ocen);
            i_f  <= mux32(i_f, i_f+16, ocen);
            i_g  <= mux32(i_g, i_g+16, ocen);
            i_h  <= mux32(i_h, i_h+16, ocen);
            i_i  <= mux32(i_i, i_i+16, ocen);
            i_j  <= mux32(i_j, i_j+16, ocen);
            i_k  <= mux32(i_k, i_k+16, ocen);
            i_l  <= mux32(i_l, i_l+16, ocen);
            i_m  <= mux32(i_m, i_m+16, ocen);
            i_n  <= mux32(i_n, i_n+16, ocen);
            i_o  <= mux32(i_o, i_o+16, ocen);
            i_p  <= mux32(i_p, i_p+16, ocen);
          end
        end
      end
    end
  endgenerate
  always @(posedge CLK) idone_a <= initdone;
  always @(posedge CLK) idone_b <= initdone;
  assign d_din[255:  0] = mux256({i_h,i_g,i_f,i_e,i_d,i_c,i_b,i_a}, OB_dot[255:  0], idone_a);
  assign d_din[511:256] = mux256({i_p,i_o,i_n,i_m,i_l,i_k,i_j,i_i}, OB_dot[511:256], idone_b);
  always @(posedge CLK) begin
    dout_t <= d_dout;
    doen_t <= d_douten;
    // Stage 0
    dout_ta <= stnet_dout;
    dout_tb <= stnet_dout;
    dout_tc <= stnet_dout;
    dout_td <= stnet_dout;
    doen_ta <= stnet_douten[0];
    doen_tb <= stnet_douten[0];
    doen_tc <= stnet_douten[0];
    doen_td <= stnet_douten[0];
    req_tt  <= stnet_douten[`SORT_WAY:1];
  end
  // for phase
  // ###########################################################################
  always @(posedge CLK) begin
    if (RST) begin
      phase <= 0;
    end else begin
      if (elem==`SORT_ELM) phase <= phase+1;
    end
  end
  // for elem
  // ###########################################################################
  always @(posedge CLK) begin
    if (RST) begin
      elem <= 0;
    end else begin
      case ({OB_deq, (elem==`SORT_ELM)})
        2'b01: elem <= 0;
        2'b10: elem <= elem + 16;
      endcase
    end
  end
  // for iter_done
  // ###########################################################################
  always @(posedge CLK) iter_done <= (ecnt==2);
  // for pchange
  // ###########################################################################
  always @(posedge CLK) pchange <= (elem==`SORT_ELM);
  // for irst
  // ###########################################################################
  always @(posedge CLK) irst <= (ecnt==2) || pchange;
  // for frst
  // ###########################################################################
  always @(posedge CLK) frst <= RST || (ecnt==2) || (elem==`SORT_ELM);
  // for ecnt
  // ###########################################################################
  always @(posedge CLK) begin
    if (RST || iter_done || pchange) begin
      ecnt <= ((`ELEMS_PER_UNIT<<`WAY_LOG) << (phase * `WAY_LOG));
    end else begin
      if (ecnt!=0 && F01_deq) ecnt <= ecnt - 1;
    end
  end
  // for sortdone
  // ###########################################################################
  always @(posedge CLK) begin
    if (RST) begin
      sortdone <= 0;
    end else begin
      if (phase==(`LAST_PHASE+1)) sortdone <= 1;
    end
  end
endmodule