module stratix_routing_wire (
                               datain,
                               dataout
                               );
    // INPUT PORTS
    input datain;
    // OUTPUT PORTS
    output dataout;
    // INTERNAL VARIABLES
    wire dataout_tmp;
    specify
        (datain => dataout) = (0, 0) ;
    endspecify
    assign dataout_tmp = datain;
    and (dataout, dataout_tmp, 1'b1);
endmodule