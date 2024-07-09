module arithshiftbidir (
        distance,
        data,
        direction,
        result);
        input   [4:0]  distance;
        input   [31:0]  data;
        input     direction;
        output  [31:0]  result;
        wire [31:0] sub_wire0;
        wire [31:0] result = sub_wire0[31:0];
        lpm_clshift     lpm_clshift_component (
                                .distance (distance),
                                .direction (direction),
                                .data (data),
                                .result (sub_wire0));
        defparam
                lpm_clshift_component.lpm_type = "LPM_CLSHIFT",
                lpm_clshift_component.lpm_shifttype = "ARITHMETIC",
                lpm_clshift_component.lpm_width = 32,
                lpm_clshift_component.lpm_widthdist = 5;
endmodule