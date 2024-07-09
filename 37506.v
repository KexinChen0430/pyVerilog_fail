module testbed_hi_simulate;
    reg  pck0;
    reg  [7:0] adc_d;
    reg  mod_type;
    wire pwr_lo;
    wire adc_clk;
    reg ck_1356meg;
    reg  ck_1356megb;
    wire ssp_frame;
    wire ssp_din;
    wire ssp_clk;
    reg  ssp_dout;
    wire pwr_hi;
    wire pwr_oe1;
    wire pwr_oe2;
    wire pwr_oe3;
    wire pwr_oe4;
    wire cross_lo;
    wire cross_hi;
    wire dbg;
    hi_simulate #(5,200) dut(
    .pck0(pck0),
    .ck_1356meg(ck_1356meg),
    .ck_1356megb(ck_1356megb),
    .pwr_lo(pwr_lo),
    .pwr_hi(pwr_hi),
    .pwr_oe1(pwr_oe1),
    .pwr_oe2(pwr_oe2),
    .pwr_oe3(pwr_oe3),
    .pwr_oe4(pwr_oe4),
    .adc_d(adc_d),
    .adc_clk(adc_clk),
    .ssp_frame(ssp_frame),
    .ssp_din(ssp_din),
    .ssp_dout(ssp_dout),
    .ssp_clk(ssp_clk),
    .cross_hi(cross_hi),
    .cross_lo(cross_lo),
    .dbg(dbg),
    .mod_type(mod_type)
    );
    integer idx, i;
    // main clock
    always #5 begin
        ck_1356megb = !ck_1356megb;
        ck_1356meg = ck_1356megb;
    end
    always begin
        @(negedge adc_clk) ;
        adc_d = $random;
    end
    //crank DUT
    task crank_dut;
        begin
            @(negedge ssp_clk) ;
            ssp_dout = $random;
        end
    endtask
    initial begin
        // init inputs
        ck_1356megb = 0;
        // random values
        adc_d = 0;
        ssp_dout=1;
        // shallow modulation off
        mod_type=0;
        for (i = 0 ;  i < 16 ;  i = i + 1) begin
            crank_dut;
        end
        // shallow modulation on
        mod_type=1;
        for (i = 0 ;  i < 16 ;  i = i + 1) begin
            crank_dut;
        end
        $finish;
    end
endmodule