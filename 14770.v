module stratix_asynch_lcell (
                             dataa,
                             datab,
                             datac,
                             datad,
                             cin,
                             cin0,
                             cin1,
                             inverta,
                             qfbkin,
                             regin,
                             combout,
                             cout,
                             cout0,
                             cout1
                            );
    parameter operation_mode = "normal" ;
    parameter sum_lutc_input = "datac";
    parameter lut_mask = "ffff" ;
    parameter cin_used = "false";
    parameter cin0_used = "false";
    parameter cin1_used = "false";
    // INPUT PORTS
    input dataa;
    input datab;
    input datac;
    input datad ;
    input cin;
    input cin0;
    input cin1;
    input inverta;
    input qfbkin;
    // OUTPUT PORTS
    output combout;
    output cout;
    output cout0;
    output cout1;
    output regin;
    // INTERNAL VARIABLES
    reg icout;
    reg icout0;
    reg icout1;
    reg data;
    reg lut_data;
    reg inverta_dataa;
    reg [15:0] bin_mask;
    integer iop_mode;
    reg [1:0] isum_lutc_input;
    reg icin_used;
    reg icin0_used;
    reg icin1_used;
    wire qfbk_mode;
    // INPUT BUFFERS
    wire idataa;
    wire idatab;
    wire idatac;
    wire idatad;
    wire icin;
    wire icin0;
    wire icin1;
    wire iinverta;
    buf (idataa, dataa);
    buf (idatab, datab);
    buf (idatac, datac);
    buf (idatad, datad);
    buf (icin, cin);
    buf (icin0, cin0);
    buf (icin1, cin1);
    buf (iinverta, inverta);
    assign qfbk_mode = (sum_lutc_input == "qfbk") ? 1'b1 : 1'b0;
    specify
        (dataa => combout) = (0, 0) ;
        (datab => combout) = (0, 0) ;
        (datac => combout) = (0, 0) ;
        (datad => combout) = (0, 0) ;
        (cin => combout) = (0, 0) ;
        (cin0 => combout) = (0, 0) ;
        (cin1 => combout) = (0, 0) ;
        (inverta => combout) = (0, 0) ;
        if (qfbk_mode == 1'b1)
            (qfbkin => combout) = (0, 0) ;
        (dataa => cout) = (0, 0);
        (datab => cout) = (0, 0);
        (cin => cout) = (0, 0) ;
        (cin0 => cout) = (0, 0) ;
        (cin1 => cout) = (0, 0) ;
        (inverta => cout) = (0, 0);
        (dataa => cout0) = (0, 0);
        (datab => cout0) = (0, 0);
        (cin0 => cout0) = (0, 0) ;
        (inverta => cout0) = (0, 0);
        (dataa => cout1) = (0, 0);
        (datab => cout1) = (0, 0);
        (cin1 => cout1) = (0, 0) ;
        (inverta => cout1) = (0, 0);
        (dataa => regin) = (0, 0) ;
        (datab => regin) = (0, 0) ;
        (datac => regin) = (0, 0) ;
        (datad => regin) = (0, 0) ;
        (cin => regin) = (0, 0) ;
        (cin0 => regin) = (0, 0) ;
        (cin1 => regin) = (0, 0) ;
        (inverta => regin) = (0, 0) ;
        if (qfbk_mode == 1'b1)
            (qfbkin => regin) = (0, 0) ;
    endspecify
    function [16:1] str_to_bin ;
        input [8*4:1] s;
        reg [8*4:1] reg_s;
        reg [4:1] digit [8:1];
        reg [8:1] tmp;
        integer m;
        integer ivalue ;
        begin
            ivalue = 0;
            reg_s = s;
            for (m=1; m<=4; m= m+1 )
            begin
                tmp = reg_s[32:25];
                digit[m] = tmp & 8'b00001111;
                reg_s = reg_s << 8;
                if (tmp[7] == 'b1)
                    digit[m] = digit[m] + 9;
            end
            str_to_bin = {digit[1], digit[2], digit[3], digit[4]};
        end
    endfunction
    // 4-input LUT function
    function lut4;
        input [15:0] mask;
        input dataa;
        input datab;
        input datac;
        input datad;
        begin
        lut4 = datad ? ( datac ? ( datab ? ( dataa ? mask[15] : mask[14])
                                         : ( dataa ? mask[13] : mask[12]))
                               : ( datab ? ( dataa ? mask[11] : mask[10])
                                         : ( dataa ? mask[ 9] : mask[ 8])))
                     : ( datac ? ( datab ? ( dataa ? mask[ 7] : mask[ 6])
                                         : ( dataa ? mask[ 5] : mask[ 4]))
                               : ( datab ? ( dataa ? mask[ 3] : mask[ 2])
                                         : ( dataa ? mask[ 1] : mask[ 0])));
        end
    endfunction
    initial
    begin
        bin_mask = str_to_bin(lut_mask);
        if (operation_mode == "normal")
            iop_mode = 0;	// normal mode
        else if (operation_mode == "arithmetic")
            iop_mode = 1;	// arithmetic mode
        else
        begin
            $display ("Error: Invalid operation_mode specified\n");
            $display ("Time: %0t  Instance: %m", $time);
            iop_mode = 2;
        end
        if (sum_lutc_input == "datac")
            isum_lutc_input = 0;
        else if (sum_lutc_input == "cin")
            isum_lutc_input = 1;
        else if (sum_lutc_input == "qfbk")
            isum_lutc_input = 2;
        else
        begin
            $display ("Error: Invalid sum_lutc_input specified\n");
            $display ("Time: %0t  Instance: %m", $time);
            isum_lutc_input = 3;
        end
        if (cin_used == "true")
            icin_used = 1;
        else if (cin_used == "false")
            icin_used = 0;
        if (cin0_used == "true")
            icin0_used = 1;
        else if (cin0_used == "false")
            icin0_used = 0;
        if (cin1_used == "true")
            icin1_used = 1;
        else if (cin1_used == "false")
            icin1_used = 0;
    end
    always @(idatad or idatac or idatab or idataa or icin or
             icin0 or icin1 or iinverta or qfbkin)
    begin
        if (iinverta === 'b1) //invert dataa
            inverta_dataa = !idataa;
        else
            inverta_dataa = idataa;
        if (iop_mode == 0) // normal mode
        begin
            if (isum_lutc_input == 0) // datac
            begin
                data = lut4(bin_mask, inverta_dataa, idatab,
                            idatac, idatad);
            end
            else if (isum_lutc_input == 1) // cin
            begin
                if (icin0_used == 1 || icin1_used == 1)
                begin
                    if (icin_used == 1)
                        data = (icin === 'b0) ?
                                lut4(bin_mask,
                                inverta_dataa,
                                idatab,
                                icin0,
                                idatad) :
                                lut4(bin_mask,
                                inverta_dataa,
                                idatab,
                                icin1,
                                idatad);
                    else   // if cin is not used then inverta
                           // should be used in place of cin
                        data = (iinverta === 'b0) ?
                                lut4(bin_mask,
                                inverta_dataa,
                                idatab,
                                icin0,
                                idatad) :
                                lut4(bin_mask,
                                inverta_dataa,
                                idatab,
                                icin1,
                                idatad);
                    end
                else
                    data = lut4(bin_mask, inverta_dataa, idatab,
                                icin, idatad);
            end
            else if(isum_lutc_input == 2) // qfbk
            begin
                data = lut4(bin_mask, inverta_dataa, idatab,
                            qfbkin, idatad);
            end
        end
        else if (iop_mode == 1) // arithmetic mode
        begin
            // sum LUT
            if (isum_lutc_input == 0) // datac
            begin
                data = lut4(bin_mask, inverta_dataa, idatab,
                            idatac, 'b1);
            end
            else if (isum_lutc_input == 1) // cin
            begin
                if (icin0_used == 1 || icin1_used == 1)
                begin
                    if (icin_used == 1)
                        data = (icin === 'b0) ?
                                lut4(bin_mask,
                                inverta_dataa,
                                idatab,
                                icin0,
                                'b1) :
                                lut4(bin_mask,
                                inverta_dataa,
                                idatab,
                                icin1,
                                'b1);
                    else   // if cin is not used then inverta
                           // should be used in place of cin
                        data = (iinverta === 'b0) ?
                                lut4(bin_mask,
                                inverta_dataa,
                                idatab,
                                icin0,
                                'b1) :
                                lut4(bin_mask,
                                inverta_dataa,
                                idatab,
                                icin1,
                                'b1);
                end
                else if (icin_used == 1)
                    data = lut4(bin_mask, inverta_dataa, idatab,
                                icin, 'b1);
                else  // cin is not used, inverta is used as cin
                    data = lut4(bin_mask, inverta_dataa, idatab,
                                iinverta, 'b1);
            end
            else if(isum_lutc_input == 2) // qfbk
            begin
                data = lut4(bin_mask, inverta_dataa, idatab,
                            qfbkin, 'b1);
            end
            // carry LUT
            icout0 = lut4(bin_mask, inverta_dataa, idatab, icin0, 'b0);
            icout1 = lut4(bin_mask, inverta_dataa, idatab, icin1, 'b0);
            if (icin_used == 1)
            begin
                if (icin0_used == 1 || icin1_used == 1)
                    icout = (icin === 'b0) ? icout0 : icout1;
                else
                    icout = lut4(bin_mask, inverta_dataa, idatab,
                                 icin, 'b0);
            end
            else  // inverta is used in place of cin
            begin
                if (icin0_used == 1 || icin1_used == 1)
                    icout = (iinverta === 'b0) ? icout0 : icout1;
                else
                    icout = lut4(bin_mask, inverta_dataa, idatab,
                                 iinverta, 'b0);
            end
        end
    end
    and (combout, data, 1'b1) ;
    and (cout, icout, 1'b1) ;
    and (cout0, icout0, 1'b1) ;
    and (cout1, icout1, 1'b1) ;
    and (regin, data, 1'b1) ;
endmodule