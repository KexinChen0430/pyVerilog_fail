module    stratixv_controller    (
    nceout);
    parameter    lpm_type    =    "stratixv_controller";
    output    nceout;
    stratixv_controller_encrypted inst (
        .nceout(nceout) );
    defparam inst.lpm_type = lpm_type;
endmodule