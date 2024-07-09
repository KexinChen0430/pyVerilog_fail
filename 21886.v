module cyclone_asynch_io
    (
    datain,
    oe,
    regin,
    padio,
    combout,
    regout
    );
    // INPUT/OUTPUT PORTS
    inout padio;
    // INPUT PORTS
    input datain;
    input oe;
    input regin;
    // OUTPUT PORTS
    output combout;
    output regout;
    parameter operation_mode = "input";
    parameter bus_hold = "false";
    parameter open_drain_output = "false";
    // INTERNAL VARIABLES
    reg prev_value;
    reg tmp_padio;
    reg tmp_combout;
    reg buf_control;
    // INPUT BUFFERS
    wire datain_in;
    wire oe_in;
    buf(datain_in, datain);
    buf(oe_in, oe);
    tri padio_tmp;
    specify
        (padio => combout) = (0,0);
        (datain => padio) = (0, 0);
        (posedge oe => (padio +: padio_tmp)) = (0, 0);
        (negedge oe => (padio +: 1'bz)) = (0, 0);
        (regin => regout) = (0, 0);
    endspecify
    initial
    begin
        prev_value = 'b0;
        tmp_padio = 'bz;
    end
    always @(datain_in or oe_in or padio)
    begin
        if (bus_hold == "true" )
        begin
            buf_control = 'b1;
            if ( operation_mode == "input")
            begin
                if (padio == 1'bz)
                    tmp_combout = prev_value;
                else
                begin
                    prev_value = padio;
                    tmp_combout = padio;
                end
                tmp_padio = 1'bz;
            end
            else
            begin
                if ( operation_mode == "output" || operation_mode == "bidir")
                begin
                    if ( oe_in == 1)
                    begin
                        if ( open_drain_output == "true" )
                        begin
                            if (datain_in == 0)
                            begin
                                tmp_padio =  1'b0;
                                prev_value = 1'b0;
                            end
                            else if (datain_in == 1'bx)
                            begin
                                tmp_padio = 1'bx;
                                prev_value = 1'bx;
                            end
                            else   // output of tri is 'Z'
                            begin
                                if ( operation_mode == "bidir")
                                    prev_value = padio;
                                tmp_padio = 1'bz;
                            end
                        end
                        else  // open drain_output = false;
                        begin
                            tmp_padio = datain_in;
                            prev_value = datain_in;
                        end
                    end
                    else if ( oe_in == 0 )
                    begin
                        if (operation_mode == "bidir")
                            prev_value = padio;
                            tmp_padio = 1'bz;
                    end
                    else   // oe == 'X'
                    begin
                        tmp_padio = 1'bx;
                        prev_value = 1'bx;
                    end
                end
                if ( operation_mode == "output")
                    tmp_combout = 1'bz;
                else
                    tmp_combout = padio;
            end
        end
        else    // bus hold is false
        begin
            buf_control = 'b0;
            if ( operation_mode == "input")
            begin
                tmp_combout = padio;
            end
            else if (operation_mode == "output" || operation_mode == "bidir")
            begin
                if ( operation_mode  == "bidir")
                    tmp_combout = padio;
                if ( oe_in == 1 )
                begin
                    if ( open_drain_output == "true" )
                    begin
                        if (datain_in == 0)
                            tmp_padio = 1'b0;
                        else if ( datain_in == 1'bx)
                            tmp_padio = 1'bx;
                        else
                            tmp_padio = 1'bz;
                    end
                    else
                        tmp_padio = datain_in;
                end
                else if ( oe_in == 0 )
                    tmp_padio = 1'bz;
                else
                    tmp_padio = 1'bx;
                end
            else
            begin
                $display ("Error: Invalid operation_mode specified in cyclone io atom!\n");
                $display ("Time: %0t  Instance: %m", $time);
            end
            end
        end
    bufif1 (weak1, weak0) b(padio_tmp, prev_value, buf_control);  //weak value
    pmos (padio_tmp, tmp_padio, 'b0);
    pmos (combout, tmp_combout, 'b0);
    pmos (padio, padio_tmp, 'b0);
    and (regout, regin, 1'b1);
endmodule