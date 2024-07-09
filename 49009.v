module hardcopyii_lcell_hsadder (
                            dataa,
                            datab,
                            datac,
                            datad,
                            cin0,
                            cin1,
                            sumout0,
                            sumout1,
                            cout0,
                            cout1
                            );
    parameter use_cin1_for_sumout = "on";
    parameter lpm_type = "hardcopyii_lcell_hsadder";
    // INPUT PORTS
    input dataa;
    input datab;
    input datac;
    input datad;
    input cin0;
    input cin1;
    // OUTPUT PORTS
    output sumout0;
    output sumout1;
    output cout0;
    output cout1;
    // internal cout
    reg cmid0;
    reg cmid1;
    // internal variable
    wire cin_sel;
    // tmp output variables
    reg sumout0_tmp;
    reg sumout1_tmp;
    reg cout_tmp;
    // INPUT BUFFERS
    wire dataa_in;
    wire datab_in;
    wire datac_in;
    wire datad_in;
    wire cin0_in;
    wire cin1_in;
    buf(dataa_in, dataa);
    buf(datab_in, datab);
    buf(datac_in, datac);
    buf(datad_in, datad);
    buf(cin0_in, cin0);
    buf(cin1_in, cin1);
    specify
        (dataa => sumout0) = (0, 0);
        (datab => sumout0) = (0, 0);
        (cin0 => sumout0) = (0, 0);
        (cin1 => sumout0) = (0, 0);
        (dataa => sumout1) = (0, 0);
        (datab => sumout1) = (0, 0);
        (datac => sumout1) = (0, 0);
        (datad => sumout1) = (0, 0);
        (cin0 => sumout1) = (0, 0);
        (cin1 => sumout1) = (0, 0);
        (dataa => cout0) = (0, 0);
        (datab => cout0) = (0, 0);
        (datac => cout0) = (0, 0);
        (datad => cout0) = (0, 0);
        (cin0 => cout0) = (0, 0);
        (dataa => cout1) = (0, 0);
        (datab => cout1) = (0, 0);
        (datac => cout1) = (0, 0);
        (datad => cout1) = (0, 0);
        (cin0 => cout1) = (0, 0);
    endspecify
    assign cin_sel = (use_cin1_for_sumout == "on") ? cin1_in : cin0_in;
    initial
    begin
        sumout0_tmp = 1'b0;
        sumout1_tmp = 1'b0;
        cout_tmp = 1'b0;
    end
    always @(datad_in or datac_in or datab_in or dataa_in or cin_sel or cin0_in)
    begin
        cmid0 = (dataa_in & datab_in) | (dataa_in & cin0_in) |
                (datab_in & cin0_in);
        cmid1 = (dataa_in & datab_in) | (dataa_in & cin_sel) |
                (datab_in & cin_sel);
        sumout0_tmp = dataa_in ^ datab_in ^ cin_sel;
        sumout1_tmp = datac_in ^ datad_in ^ cmid1;
        cout_tmp = (datac_in & datad_in) | (datac_in & cmid0) |
                    (datad_in & cmid0);
    end
    and (sumout0, sumout0_tmp, 1'b1);
    and (sumout1, sumout1_tmp, 1'b1);
    and (cout0, cout_tmp, 1'b1);
    and (cout1, cout_tmp, 1'b1);
endmodule