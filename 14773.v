module stratix_asynch_io
    (
     datain,
     oe,
     regin,
     ddioregin,
     padio,
     delayctrlin,
     combout,
     regout,
     ddioregout,
     dqsundelayedout
     );
    // INPUT PORTS
    input datain;
    input oe;
    input regin;
    input ddioregin;
    input delayctrlin;
    // OUTPUT PORTS
    output combout;
    output regout;
    output ddioregout;
    output dqsundelayedout;
    // INPUT/OUTPUT PORTS
    inout  padio;
    parameter operation_mode = "input";
    parameter bus_hold = "false";
    parameter open_drain_output = "false";
    parameter phase_shift = "0";
    parameter input_frequency = "10000 ps";
    // INTERNAL VARIABLES
    reg 	     prev_value;
    reg 	     tmp_padio, tmp_combout;
    reg 	     buf_control;
    reg 	     combout_tmp;
    reg [1:0] iop_mode;
    integer   dqs_delay;
    // INPUT BUFFERS
    wire datain_in;
    wire oe_in;
    wire  delayctrlin_ipd;
    buf(datain_in, datain);
    buf(oe_in, oe);
    buf (delayctrlin_ipd, delayctrlin);
    tri 	     padio_tmp;
    // convert string to integer with sign
    function integer str2int;
        input [8*16:1] s;
        reg [8*16:1] reg_s;
        reg [8:1] digit;
        reg [8:1] tmp;
        integer m, magnitude;
        integer sign;
        begin
            sign = 1;
            magnitude = 0;
            reg_s = s;
            for (m=1; m<=16; m=m+1)
            begin
                tmp = reg_s[128:121];
                digit = tmp & 8'b00001111;
                reg_s = reg_s << 8;
                // Accumulate ascii digits 0-9 only.
                if ((tmp>=48) && (tmp<=57))
                    magnitude = (magnitude * 10) + digit;
                if (tmp == 45)
                    sign = -1;  // Found a '-' character, i.e. number is negative.
            end
            str2int = sign*magnitude;
        end
    endfunction
    specify
        (padio => combout) = (0,0);
        (padio => dqsundelayedout) = (0,0);
        (datain => padio) = (0, 0);
        (posedge oe => (padio +: padio_tmp)) = (0, 0);
        (negedge oe => (padio +: 1'bz)) = (0, 0);
        (ddioregin => ddioregout) = (0, 0);
        (regin => regout) = (0, 0);
    endspecify
    initial
    begin
        prev_value = 'b0;
        tmp_padio = 'bz;
        dqs_delay = (str2int(phase_shift) * str2int(input_frequency))/360;
        if (operation_mode == "input")
            iop_mode = 0;
        else if (operation_mode == "output")
            iop_mode = 1;
        else if (operation_mode == "bidir")
            iop_mode = 2;
        else
        begin
            $display ("Error: Invalid operation_mode specified\n");
            $display ("Time: %0t  Instance: %m", $time);
            iop_mode = 3;
        end
    end
    always @(delayctrlin_ipd)
    begin
        if (delayctrlin_ipd == 1'b1)
            dqs_delay = (str2int(phase_shift) * str2int(input_frequency))/360;
        else if (delayctrlin_ipd == 1'b0)
            dqs_delay = 0;
        else
        begin
            $display($time, " Warning: Illegal value detected on 'delayctrlin' input.");
            $display ("Time: %0t  Instance: %m", $time);
            dqs_delay = 0;
        end
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
                if (iop_mode == 1 || iop_mode == 2) // output or bidir
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
                                if (iop_mode == 2) // bidir
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
                        if (iop_mode == 2) // bidir
                            prev_value = padio;
                        tmp_padio = 1'bz;
                    end
                    else   // oe == 'X'
                    begin
                        tmp_padio = 1'bx;
                        prev_value = 1'bx;
                    end
                end
                if (iop_mode == 1) // output
                    tmp_combout = 1'bz;
                else
                    tmp_combout = padio;
            end
        end
	else    // bus hold is false
        begin
            buf_control = 'b0;
            if (iop_mode == 0) // input
            begin
                tmp_combout = padio;
            end
            else if (iop_mode == 1 || iop_mode == 2) // output or bidir
            begin
                if (iop_mode  == 2) // bidir
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
                $display ("Error: Invalid operation_mode specified in stratix io atom!\n");
                $display ("Time: %0t  Instance: %m", $time);
            end
        end
        combout_tmp <= #(dqs_delay) tmp_combout;
    end
    bufif1 (weak1, weak0) b(padio_tmp, prev_value, buf_control);  //weak value
    pmos (padio_tmp, tmp_padio, 'b0);
    pmos (combout, combout_tmp, 'b0);
    pmos (padio, padio_tmp, 'b0);
    and (regout, regin, 1'b1);
    and (ddioregout, ddioregin, 1'b1);
    and (dqsundelayedout, tmp_combout, 1'b1);
endmodule