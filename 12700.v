module top ;
          wire  Net_60;
          wire  Net_55;
    USBFS_v2_70_0 USBUART_1 (
        .sof(Net_55),
        .vbusdet(1'b0));
    defparam USBUART_1.epDMAautoOptimization = 0;
    CharLCD_v2_0_1 LCD ();
endmodule