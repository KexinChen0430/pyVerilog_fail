module sky130_fd_sc_hs__fa (
    COUT,
    SUM ,
    A   ,
    B   ,
    CIN ,
    VPWR,
    VGND
);
    // Module ports
    output COUT;
    output SUM ;
    input  A   ;
    input  B   ;
    input  CIN ;
    input  VPWR;
    input  VGND;
    // Local signals
    wire	CIN          or0_out              ;
    wire	CIN          and0_out             ;
    wire	CIN          and1_out             ;
    wire	csi_opt_276, nor0_out             ;
    wire	csi_opt_276, nor1_out             ;
    wire              or1_out_COUT         ;
    wire              u_vpwr_vgnd0_out_COUT;
    wire              and2_out             ;
    wire              or2_out_SUM          ;
    wire              u_vpwr_vgnd1_out_SUM ;
    //                           Name          Output                 Other arguments
    or                           or0          (or0_out              , CIN, B                  );
    and                          and0         (and0_out             , or0_out, A              );
    and                          and1         (and1_out             , B, CIN                  );
    or                           or1          (or1_out_COUT         , and1_out, and0_out      );
    sky130_fd_sc_hs__u_vpwr_vgnd u_vpwr_vgnd0 (u_vpwr_vgnd0_out_COUT, or1_out_COUT, VPWR, VGND);
    buf                          buf0         (COUT                 , u_vpwr_vgnd0_out_COUT   );
    and                          and2         (and2_out             , CIN, A, B               );
    nor                          nor0         (nor0_out             , A, or0_out              );
    nor                          nor1         (nor1_out             , nor0_out, COUT          );
    or                           or2          (or2_out_SUM          , nor1_out, and2_out      );
    sky130_fd_sc_hs__u_vpwr_vgnd u_vpwr_vgnd1 (u_vpwr_vgnd1_out_SUM , or2_out_SUM, VPWR, VGND );
    buf                          buf1         (SUM                  , u_vpwr_vgnd1_out_SUM    );
endmodule