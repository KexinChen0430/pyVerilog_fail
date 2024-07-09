module stratix_lcell_register (
                               clk,
                               aclr,
                               aload,
                               sclr,
                               sload,
                               ena,
                               datain,
                               datac,
                               regcascin,
                               devclrn,
                               devpor,
                               regout,
                               qfbkout
                              );
    parameter synch_mode = "off";
    parameter register_cascade_mode = "off";
    parameter power_up = "low";
    parameter x_on_violation = "on";
    // INPUT PORTS
    input clk;
    input ena;
    input aclr;
    input aload;
    input sclr;
    input sload;
    input datain;
    input datac;
    input regcascin;
    input devclrn;
    input devpor ;
    // OUTPUT PORTS
    output regout;
    output qfbkout;
    // INTERNAL VARIABLES
    reg iregout;
    wire reset;
    wire nosload;
    reg regcascin_viol;
    reg datain_viol, datac_viol;
    reg sclr_viol, sload_viol;
    reg ena_viol, clk_per_viol;
    reg violation;
    reg clk_last_value;
    reg ipower_up;
    reg icascade_mode;
    reg isynch_mode;
    reg ix_on_violation;
    // INPUT BUFFERS
    wire clk_in;
    wire iaclr;
    wire iaload;
    wire isclr;
    wire isload;
    wire iena;
    wire idatac;
    wire iregcascin;
    wire idatain;
    buf (clk_in, clk);
    buf (iaclr, aclr);
    buf (iaload, aload);
    buf (isclr, sclr);
    buf (isload, sload);
    buf (iena, ena);
    buf (idatac, datac);
    buf (iregcascin, regcascin);
    buf (idatain, datain);
    assign reset = devpor && devclrn && (!iaclr) && (iena);
    assign nosload = reset && (!isload);
    specify
        $setuphold (posedge clk &&& reset, regcascin, 0, 0, regcascin_viol) ;
        $setuphold (posedge clk &&& nosload, datain, 0, 0, datain_viol) ;
        $setuphold (posedge clk &&& reset, datac, 0, 0, datac_viol) ;
        $setuphold (posedge clk &&& reset, sclr, 0, 0, sclr_viol) ;
        $setuphold (posedge clk &&& reset, sload, 0, 0, sload_viol) ;
        $setuphold (posedge clk &&& reset, ena, 0, 0, ena_viol) ;
        (posedge clk => (regout +: iregout)) = 0 ;
        (posedge aclr => (regout +: 1'b0)) = (0, 0) ;
        (posedge aload => (regout +: iregout)) = (0, 0) ;
        (datac => regout) = (0, 0) ;
        (posedge clk => (qfbkout +: iregout)) = 0 ;
        (posedge aclr => (qfbkout +: 1'b0)) = (0, 0) ;
        (posedge aload => (qfbkout +: iregout)) = (0, 0) ;
        (datac => qfbkout) = (0, 0) ;
    endspecify
    initial
    begin
        violation = 0;
        clk_last_value = 'b0;
        if (power_up == "low")
        begin
            iregout <= 'b0;
            ipower_up = 0;
        end
        else if (power_up == "high")
        begin
            iregout <= 'b1;
            ipower_up = 1;
        end
        if (register_cascade_mode == "on")
            icascade_mode = 1;
        else
            icascade_mode = 0;
        if (synch_mode == "on" )
            isynch_mode = 1;
        else
            isynch_mode = 0;
        if (x_on_violation == "on")
            ix_on_violation = 1;
        else
            ix_on_violation = 0;
    end
    always @ (regcascin_viol or datain_viol or datac_viol or sclr_viol
              or sload_viol or ena_viol or clk_per_viol)
    begin
        if (ix_on_violation == 1)
            violation = 1;
    end
    always @ (clk_in or idatac or iaclr or posedge iaload
              or devclrn or devpor or posedge violation)
    begin
        if (violation == 1'b1)
        begin
            violation = 0;
            iregout <= 'bx;
        end
        else
        begin
            if (devpor == 'b0)
            begin
                if (ipower_up == 0) // "low"
                    iregout <= 'b0;
                else if (ipower_up == 1) // "high"
                    iregout <= 'b1;
            end
            else if (devclrn == 'b0)
                iregout <= 'b0;
            else if (iaclr === 'b1)
                iregout <= 'b0 ;
            else if (iaload === 'b1)
                iregout <= idatac;
            else if (iena === 'b1 && clk_in === 'b1 &&
                     clk_last_value === 'b0)
            begin
                if (isynch_mode == 1)
                begin
                    if (isclr === 'b1)
                        iregout <= 'b0 ;
                    else if (isload === 'b1)
                        iregout <= idatac;
                    else if (icascade_mode == 1)
                        iregout <= iregcascin;
                    else
                        iregout <= idatain;
                end
                else if (icascade_mode == 1)
                    iregout <= iregcascin;
                else
                    iregout <= idatain;
            end
        end
        clk_last_value = clk_in;
    end
    and (regout, iregout, 1'b1);
    and (qfbkout, iregout, 1'b1);
endmodule