module mfp_ahb_lite_eic
(
    //ABB-Lite side
    input                              HCLK,
    input                              HRESETn,
    input      [ 31 : 0 ]              HADDR,
    input      [  2 : 0 ]              HBURST,
    input                              HMASTLOCK,  // ignored
    input      [  3 : 0 ]              HPROT,      // ignored
    input                              HSEL,
    input      [  2 : 0 ]              HSIZE,
    input      [  1 : 0 ]              HTRANS,
    input      [ 31 : 0 ]              HWDATA,
    input                              HWRITE,
    output reg [ 31 : 0 ]              HRDATA,
    output                             HREADY,
    output                             HRESP,
    input                              SI_Endian,  // ignored
    //Interrupt side
    input      [ `EIC_CHANNELS-1 : 0 ] signal,
    //CPU side
    output     [ 17 : 1 ]              EIC_Offset,
    output     [  3 : 0 ]              EIC_ShadowSet,
    output     [  7 : 0 ]              EIC_Interrupt,
    output     [  5 : 0 ]              EIC_Vector,
    output                             EIC_Present
);
    */
    parameter Tclk = 20;
    always #(Tclk/2) HCLK = ~HCLK;
    initial begin
        begin
            signal  = 16'b0;
            HRESETn = 0;
            @(posedge HCLK);
            @(posedge HCLK);
            HRESETn = 1;
            @(posedge HCLK);
            @(posedge HCLK);
            ahbPhaseFst(`EIC_REG_EICR       << 2,  WRITE,  HSIZE_X32, St_x);    //enable eic
            ahbPhase   (`EIC_REG_EISMSK_0   << 2,  WRITE,  HSIZE_X32, 32'h01);  //any logical change for irq 1, 2 (pins 0, 1)
            ahbPhase   (`EIC_REG_EIMSK_0    << 2,  WRITE,  HSIZE_X32, 32'h05);  //enable irq 1, 2 (pins 0, 1)
            ahbPhase   (`EIC_REG_EIMSK_1    << 2,  WRITE,  HSIZE_X32, 32'h03);  //enable irq 33 (pin 32)
            ahbPhase   (`EIC_REG_EICR       << 2,  READ,   HSIZE_X32, 32'h01);  //enable irq 33 (pin 32)
            ahbPhase   (`EIC_REG_EISMSK_0   << 2,  READ,   HSIZE_X32, St_x);
            ahbPhase   (`EIC_REG_EIMSK_0    << 2,  READ,   HSIZE_X32, St_x);
            ahbPhase   (`EIC_REG_EIMSK_1    << 2,  READ,   HSIZE_X32, St_x);
            @(posedge HCLK);    signal[0]   = 1'b1;
            @(posedge HCLK);    signal[1]   = 1'b1;
            delay();
            @(posedge HCLK);    signal[32]  = 1'b1;
            @(posedge HCLK);    signal[32]  = 1'b0;
            delay();
            ahbPhase   (`EIC_REG_EIFR_1     << 2,  READ,   HSIZE_X32, St_x);
            ahbPhase   (`EIC_REG_EIFRC_1    << 2,  WRITE,  HSIZE_X32, St_x);    //clear irq 33 (pin 32)
            ahbPhase   (`EIC_REG_EIFR_0     << 2,  READ,   HSIZE_X32, 32'h01);
            delay();
            ahbPhase   (`EIC_REG_EIFR_0     << 2,  WRITE,  HSIZE_X32, St_x);
            ahbPhase   (`EIC_REG_EIFR_0     << 2,  READ,   HSIZE_X32, 32'h01);  //set EIFR word0
            delay();
            ahbPhase   (`EIC_REG_EIFRS_0    << 2,  WRITE,  HSIZE_X32, St_x);
            ahbPhase   (`EIC_REG_EIFR_0     << 2,  READ,   HSIZE_X32, 32'h04);  //set EIFR bit3
            ahbPhase   (`EIC_REG_EIFR_0     << 2,  READ,   HSIZE_X32, St_x);
            ahbPhaseLst(`EIC_REG_EIFR_0     << 2,  READ,   HSIZE_X32, St_x);
            delay();
        end
        $stop;
        $finish;
    end
endmodule