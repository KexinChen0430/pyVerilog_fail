module lab4_1_2
   (CP,
    M,
    Qd,
    Qc,
    Qb,
    Qa,
    Z);
  input CP;
  input M;
  output Qd;
  output Qc;
  output Qb;
  output Qa;
  output Z;
  wire CP;
  wire CP_IBUF;
  wire CP_IBUF_BUFG;
  wire LD_reg_inv_n_0;
  wire M;
  wire M_IBUF;
  wire Qa;
  wire Qa_OBUF;
  wire Qb;
  wire Qb_OBUF;
  wire Qc;
  wire Qc_OBUF;
  wire Qd;
  wire Qd_OBUF;
  wire Z;
  wire Z_OBUF;
  wire cou1_n_4;
  wire cou1_n_5;
initial begin
 $sdf_annotate("lab4_1_2_tb_time_synth.sdf",,,,"tool_control");
end
  BUFG CP_IBUF_BUFG_inst
       (.I(CP_IBUF),
        .O(CP_IBUF_BUFG));
  IBUF CP_IBUF_inst
       (.I(CP),
        .O(CP_IBUF));
  FDRE #(
    .INIT(1'b0))
    LD_reg_inv
       (.C(CP_IBUF_BUFG),
        .CE(1'b1),
        .D(cou1_n_4),
        .Q(LD_reg_inv_n_0),
        .R(1'b0));
  IBUF M_IBUF_inst
       (.I(M),
        .O(M_IBUF));
  OBUF Qa_OBUF_inst
       (.I(Qa_OBUF),
        .O(Qa));
  OBUF Qb_OBUF_inst
       (.I(Qb_OBUF),
        .O(Qb));
  OBUF Qc_OBUF_inst
       (.I(Qc_OBUF),
        .O(Qc));
  OBUF Qd_OBUF_inst
       (.I(Qd_OBUF),
        .O(Qd));
  OBUF Z_OBUF_inst
       (.I(Z_OBUF),
        .O(Z));
  FDRE #(
    .INIT(1'b0))
    Z_reg
       (.C(CP_IBUF_BUFG),
        .CE(1'b1),
        .D(cou1_n_5),
        .Q(Z_OBUF),
        .R(1'b0));
  fb_count cou1
       (.CP_IBUF_BUFG(CP_IBUF_BUFG),
        .LD_reg_inv(cou1_n_4),
        .LD_reg_inv_0(LD_reg_inv_n_0),
        .M_IBUF(M_IBUF),
        .Qa_OBUF(Qa_OBUF),
        .Qb_OBUF(Qb_OBUF),
        .Qc_OBUF(Qc_OBUF),
        .Qd_OBUF(Qd_OBUF),
        .Z_reg(cou1_n_5));
endmodule