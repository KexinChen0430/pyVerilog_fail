module is done
    output 	        c_t_clk_sel, // crt clock frequency select to pix_pll
    output  	        c_ahde,  // early horizontal display enable
    output  	        c_t_cblank_n, // composite blank to RAMDAC
    output  	        c_crt_line_end, // end of current scan line
    output  	        c_dclk_en, // Dot clock enable
    output  	        c_crt_ff_read, /* read data from CRT fifo into
    output  	        c_shift_ld, // Load signal to Attribute serializer
    output  	        c_shift_ld_pulse, // Load signal to Attr serializer
    output  	        c_t_hsync, // Horizontal sync. to CRT monitor
    output  	        c_shift_clk, // Attribute serializer shift clock
    output  	        c_pre_vde, /* Indicates vertical display will start
    output  	        c_split_screen_pulse, /* Indicates screen B will start
    output              c_vde, // Vertical display timing strobe
    output              c_vdisp_end, // end of vertical display period.
    output  	        c_t_vsync, // Vertical sync. to CRT monitor
    output              c_attr_de, /* This signal indicates the actual display
    output              c_uln_on, // under line on
    output              c_cursory,
    output [4:0]        c_slc_op, // scan line counter output
    output              c_row_end, // end of row
    output              c_cr0c_f13_22_hit,
    output              c_misc_b1,
    output              crt_mod_rd_en_hb,
    output              crt_mod_rd_en_lb,
    output              pre_load,
    output [10:0]       vcount
    );
  wire  	c_t_crt_int;
  wire 		c_raw_vsync;
  wire 		int_h_io_wr;
  wire [15:0]   crt_io_dbus;
  wire          cclk_en;
  wire          dclk_en;
  wire          pclk_en;
  wire          misc_b6;
  wire          cr11_b7;
  wire          line_cmp;
  wire          byte_pan_en;
  wire          misc_b7;
  wire          vsync_sel_ctl;
  wire          cr11_b4;
  wire          cr11_b5;
  wire          hblank;
  wire          hde;
  wire          vsync_vde;
  wire          clk_sel_strb;
  wire          final_crt_rd;
  wire          final_sh_ld;
  wire          sr_00_06_wr;
  wire          sr07_wr;
  wire          c_ahde_1;
  wire          c_ahde_1_u;
  wire          ade;
  wire          screen_off;
  wire          cr09_b5;       // Vertical Blanking start bit 9
  wire          cr09_b6;       //  Line compare bit 9
  wire          cr08_b5;
  wire          cr08_b6;
  wire          cr14_b5;
  wire          cr03_b7;      // Compatible read
  wire          misc_b0;
  wire          sel_sh_ld;
  wire          int_crt_line_end;
  wire          lncmp_zero;
  wire          txt_crt_line_end;
  wire          txt_crt_line_end_pulse;
  wire          cr17_b2;
  wire          cr17_b7;
  wire          lclk_or_by_2;
  wire          pel_pan_en;
  wire          int_split_screen_pulse;
  wire          cr17_b3;
  wire          dis_en_sta;
  assign        c_crt_ff_read   = final_crt_rd;
  assign        c_dclk_en       = dclk_en;
  assign        c_shift_clk     = pclk_en;
  assign        c_shift_ld      = sel_sh_ld;
  assign        c_misc_b0       = misc_b0;
  hcrt   HC
    (
     .m_sr01_b3                (m_sr01_b3),
     .h_reset_n                (h_reset_n),
     .cclk_en                  (cclk_en),
     .dclk_en                  (dclk_en),
     .h_hclk                   (h_hclk),
     .color_mode               (misc_b0),
     .h_io_16                  (h_io_16),
     .h_io_wr                  (int_h_io_wr),
     .h_addr                   (h_io_addr),
     .c_crtc_index             (c_crtc_index[5:0]),
     .c_ext_index              (c_ext_index),
     .misc_b6                  (misc_b6),
     .a_ar10_b0                (a_ar10_b0),
     .cr11_b7                  (cr11_b7),
     .line_cmp                 (line_cmp),
     .a_ar10_b5                (a_ar10_b5),
     .cr17_b2                  (cr17_b2),
     .byte_pan_en              (byte_pan_en),
     .cr08_b5                  (cr08_b5),
     .cr08_b6                  (cr08_b6),
     .cr17_b7                  (cr17_b7),
     .sr_00_06_wr              (sr_00_06_wr),
     .sr07_wr                  (sr07_wr),
     .t_crt_clk                (t_crt_clk),
     .h_io_dbus                (h_io_dbus[15:8]),
     .reg_ht                   (c_reg_ht),
     .reg_hde                  (c_reg_hde),
     .reg_hbs                  (c_reg_hbs),
     .reg_hbe                  (c_reg_hbe),
     .reg_hss                  (c_reg_hss),
     .reg_hse                  (c_reg_hse),
     .cr03_b7                  (cr03_b7),
     .c_t_hsync                (c_t_hsync),
     .c_ahde                   (c_ahde),
     .c_ahde_1                 (c_ahde_1),
     .c_ahde_1_u               (c_ahde_1_u),
     .hblank                   (hblank),
     .hde                      (hde),
     .lclk_or_by_2             (lclk_or_by_2),
     .int_crt_line_end         (int_crt_line_end)
     );
  vcrt VC
    (
     .m_soft_rst_n             (m_soft_rst_n),
     .h_reset_n                (h_reset_n),
     .h_hclk                   (h_hclk),
     .color_mode               (misc_b0),
     .h_io_16                  (h_io_16),
     .h_io_wr                  (int_h_io_wr),
     .h_addr                   (h_io_addr),
     .c_crtc_index             (c_crtc_index[5:0]),
     .c_ext_index              (c_ext_index),
     .cclk_en                  (cclk_en),
     .lclk_or_by_2             (lclk_or_by_2),
     .cr03_b7                  (cr03_b7),
     .cr17_b7                  (cr17_b7),
     .cr09_b6                  (cr09_b6),
     .cr09_b5                  (cr09_b5),
     .misc_b7                  (misc_b7),
     .vsync_sel_ctl            (vsync_sel_ctl),
     .int_crt_line_end         (int_crt_line_end),
     .t_crt_clk                (t_crt_clk),
     .h_io_dbus                (h_io_dbus[15:8]),
     .vga_en                   (vga_en),
     .reg_cr06                 (c_reg_cr06),
     .reg_cr07                 (c_reg_cr07),
     .reg_cr10                 (c_reg_cr10),
     .reg_cr11                 (c_reg_cr11),
     .reg_cr12                 (c_reg_cr12),
     .reg_cr15                 (c_reg_cr15),
     .reg_cr16                 (c_reg_cr16),
     .reg_cr18                 (c_reg_cr18),
     .vsync_vde                (vsync_vde),
     .cr11_b4                  (cr11_b4),
     .cr11_b5                  (cr11_b5),
     .cr11_b7                  (cr11_b7),
     .c_vde                    (c_vde),
     .c_pre_vde                (c_pre_vde),
     .c_vert_blank             (c_vert_blank),
     .c_t_vsync                (c_t_vsync),
     .line_cmp                 (line_cmp),
     .byte_pan_en              (byte_pan_en),
     .pel_pan_en               (pel_pan_en),
     .c_vdisp_end              (c_vdisp_end),
     .c_split_screen_pulse     (c_split_screen_pulse),
     .int_split_screen_pulse   (int_split_screen_pulse),
     .c_crt_line_end           (c_crt_line_end),
     .txt_crt_line_end         (txt_crt_line_end),
     .txt_crt_line_end_pulse   (txt_crt_line_end_pulse),
     .c_raw_vsync              (c_raw_vsync),
     .lncmp_zero               (lncmp_zero),
     .vcrt_cntr_op             (vcount)
     );
  clk_sel CS
    (
     .h_reset_n                (h_reset_n),
     .t_crt_clk                (t_crt_clk),
     .m_sr01_b3                (m_sr01_b3),
     .a_ar10_b6                (a_ar10_b6),
     .final_sh_ld              (final_sh_ld),
     .pre_load                 (pre_load),
     .cclk_en                  (cclk_en),
     .sel_sh_ld                (sel_sh_ld),
     .sel_sh_ld_pulse          (c_shift_ld_pulse),
     .dclk_en                  (dclk_en),
     .pclk_en                  (pclk_en)
     );
  crt_clk_gen CG
    (
     .t_crt_clk                (t_crt_clk),
     .line_cmp                 (line_cmp),
     .pix_pan                  (a_ar10_b5),
     .h_reset_n                (h_reset_n),
     .h_io_16                  (h_io_16),
     .h_io_wr                  (int_h_io_wr),
     .h_addr                   (h_io_addr),
     .c_ext_index              (c_ext_index),
     .m_sr01_b4                (m_sr01_b4),
     .m_sr01_b2                (m_sr01_b2),
     .m_sr01_b0                (m_sr01_b0),
     .a_ar10_b0                (a_ar10_b0),
     .a_ar10_b6                (a_ar10_b6),
     .a_ar13_b3                (a_ar13_b3),
     .a_ar13_b2                (a_ar13_b2),
     .a_ar13_b1                (a_ar13_b1),
     .a_ar13_b0                (a_ar13_b0),
     .cr14_b5                  (cr14_b5),
     .cr17_b3                  (cr17_b3),
     .c_ahde_1                 (c_ahde_1),
     .h_hclk                   (h_hclk),
     .ade                      (ade),
     .screen_off               (screen_off),
     .pel_pan_en               (pel_pan_en),
     .dclk_en                  (dclk_en),
     .h_io_dbus                (h_io_dbus),
     .reg_misc                 (c_reg_misc),
     .c_9dot                   (c_9dot),
     .misc_b0                  (misc_b0),
     .misc_b6                  (misc_b6),
     .misc_b7                  (misc_b7),
     .c_mis_3c2_b5             (c_mis_3c2_b5),
     .clk_sel_ctl              (c_t_clk_sel),
     .cclk_en                  (cclk_en),
     .final_sh_ld              (final_sh_ld),
     .final_crt_rd             (final_crt_rd),
     .c_misc_b1                (c_misc_b1),
     .pre_load                 (pre_load)
     );
  crt_reg_dec CD
    (
     .h_reset_n                (h_reset_n),
     .h_iord                   (h_iord),
     .h_iowr                   (h_iowr),
     .h_hclk                   (h_hclk),
     .h_io_16                  (h_io_16),
     .h_io_8                   (h_io_8),
     .misc_b0                  (misc_b0),
     .h_dec_3bx                (h_dec_3bx),
     .h_dec_3cx                (h_dec_3cx),
     .h_dec_3dx                (h_dec_3dx),
     .m_dec_sr07               (m_dec_sr07),
     .m_dec_sr00_sr06          (m_dec_sr00_sr06),
     .h_io_addr                (h_io_addr),
     .h_io_dbus                (h_io_dbus),
     .crtc_index               (c_crtc_index),
     .ext_index                (c_ext_index),
     .trim_wr                  (int_h_io_wr),
     .c_gr_ext_en              (c_gr_ext_en),
     .c_ext_index_b            (c_ext_index_b),
     .crt_mod_rd_en_hb         (crt_mod_rd_en_hb),
     .crt_mod_rd_en_lb         (crt_mod_rd_en_lb),
     .c_ready_n                (c_ready_n),
     .sr_00_06_wr              (sr_00_06_wr),
     .sr07_wr                  (sr07_wr),
     .cr24_rd                  (c_cr24_rd),
     .cr26_rd                  (c_cr26_rd),
     .c_dec_3ba_or_3da         (c_dec_3ba_or_3da),
     .c_cr0c_f13_22_hit        (c_cr0c_f13_22_hit)
     );
  crt_op_stage CO
    (
     .h_reset_n                (h_reset_n),
     .c_vde                    (c_vde),
     .cr11_b4                  (cr11_b4),
     .cr11_b5                  (cr11_b5),
     .a_arx_b5                 (a_arx_b5),
     .m_sr01_b5                (m_sr01_b5),
     .vblank                   (c_vert_blank),
     .hblank                   (hblank),
     .cclk_en                  (cclk_en),
     .dclk_en                  (dclk_en),
     .hde                      (hde),
     .c_ahde                   (c_ahde),
     .int_crt_line_end         (int_crt_line_end),
     .t_crt_clk                (t_crt_clk),
     .a_ar10_b0                (a_ar10_b0),
     .vga_en                   (vga_en),
     .c_t_crt_int              (c_t_crt_int),
     .c_attr_de                (c_attr_de),
     .c_t_cblank_n             (c_t_cblank_n),
     .ade                      (ade),
     .screen_off               (screen_off),
     .dis_en_sta               (dis_en_sta)
     );
  crt_misc CM
    (
     .dis_en_sta               (dis_en_sta),
     .c_raw_vsync              (c_raw_vsync),
     .h_reset_n                (h_reset_n),
     .h_hclk                   (h_hclk),
     .color_mode               (misc_b0),
     .h_io_16                  (h_io_16),
     .h_io_wr                  (int_h_io_wr),
     .h_addr                   (h_io_addr),
     .c_crtc_index             (c_crtc_index[5:0]),
     .c_ext_index              (c_ext_index),
     .t_sense_n                (t_sense_n),
     .c_t_crt_int              (c_t_crt_int),
     .a_is01_b5                (a_is01_b5),
     .a_is01_b4                (a_is01_b4),
     .vsync_vde                (vsync_vde),
     .h_io_dbus                (h_io_dbus),
     .reg_ins0                 (c_reg_ins0),
     .reg_ins1                 (c_reg_ins1),
     .reg_fcr                  (c_reg_fcr),
     .reg_cr17                 (c_reg_cr17),
     .c_cr17_b0                (c_cr17_b0),
     .c_cr17_b1                (c_cr17_b1),
     .cr17_b2                  (cr17_b2),
     .cr17_b3                  (cr17_b3),
     .c_cr17_b5                (c_cr17_b5),
     .c_cr17_b6                (c_cr17_b6),
     .cr17_b7                  (cr17_b7),
     .vsync_sel_ctl            (vsync_sel_ctl)
     );
  txt_time   CT
    (
     .h_reset_n                (h_reset_n),
     .h_hclk                   (h_hclk),
     .color_mode               (misc_b0),
     .h_io_16                  (h_io_16),
     .h_io_wr                  (int_h_io_wr),
     .h_addr                   (h_io_addr),
     .c_crtc_index             (c_crtc_index[5:0]),
     .t_crt_clk                (t_crt_clk),
     .cclk_en                  (cclk_en),       // character clock
     .dclk_en                  (dclk_en),
     .int_pre_vde              (c_pre_vde), /* Indicates Vertical Display will
     .int_split_screen_pulse   (int_split_screen_pulse),
     .txt_crt_line_end         (txt_crt_line_end),
     .txt_crt_line_end_pulse   (txt_crt_line_end_pulse),
     .c_vdisp_end              (c_vdisp_end),
     .lncmp_zero               (lncmp_zero),
     .h_io_dbus                (h_io_dbus[15:8]),       // data bus
     .reg_cr08                 (c_reg_cr08),
     .reg_cr09                 (c_reg_cr09),
     .reg_cr0a                 (c_reg_cr0a),
     .reg_cr0b                 (c_reg_cr0b),
     .reg_cr14                 (c_reg_cr14),
     .cr08_b5                  (cr08_b5),
     .cr08_b6                  (cr08_b6),
     .cr09_b5                  (cr09_b5),    // Vertical Blanking start bit 9
     .cr09_b6                  (cr09_b6),    // Line compare bit 9
     .c_cr0b_b5                (c_cr0b_b5),  // Text cursor skew control bit 0
     .c_cr0b_b6                (c_cr0b_b6),  // Text cursor skew control bit 1
     .c_cr0a_b5                (c_cr0a_b5),  // Disable Text cursor
     .cr14_b5                  (cr14_b5),    // Count by four
     .c_cr14_b6                (c_cr14_b6),  // Double word mode
     .c_uln_on                 (c_uln_on),   // under line on
     .c_cursor_on_line         (c_cursory),
     .c_slc_op                 (c_slc_op),   // scan line counter output
     .c_row_end                (c_row_end)   // end of row
     );
endmodule