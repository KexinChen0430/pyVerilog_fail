module's pkt waiting for transmit
    .exe2disp_data_wr(exe2disp_data_wr),
    .exe2disp_data(exe2disp_data),
    .exe2disp_valid_wr(exe2disp_valid_wr),
    .exe2disp_valid(exe2disp_valid),
    .disp2exe_alf(disp2exe_alf),
    //execute's tranmit direction request
    .exe2disp_direction_req(exe2disp_direction_req),
    .exe2disp_direction(exe2disp_direction),//0:up cpu  1: down port
    //transmit to up cpu
    .disp2up_data_wr(um2npe_data_wr),
    .disp2up_data(um2npe_data),
    .disp2up_valid_wr(um2npe_valid_wr),
    .disp2up_valid(um2npe_valid),
    .up2disp_alf(npe2um_alf),
    //transmit to down port
    .disp2down_data_wr(disp2usermux_data_wr),
    .disp2down_data(disp2usermux_data),
    .disp2down_valid_wr(disp2usermux_valid_wr),
    .disp2down_valid(disp2usermux_valid),
    .down2disp_alf(usermux2disp_alf)
);
user_mux user_mux(
    .clk(clk),
    .rst_n(rst_n),
    //lookup pkt waiting for transmit
    .disp2usermux_data_wr(disp2usermux_data_wr),
    .disp2usermux_data(disp2usermux_data),
    .disp2usermux_valid_wr(disp2usermux_valid_wr),
    .disp2usermux_valid(disp2usermux_valid),
    .usermux2disp_alf(usermux2disp_alf),
    //up cpu pkt waiting for transmit
    .up2usermux_data_wr(npe2um_data_wr),
    .up2usermux_data(npe2um_data),
    .up2usermux_valid_wr(npe2um_valid_wr),
    .up2usermux_valid(npe2um_valid),
    .usermux2up_alf(um2npe_alf),
    //transmit to down port
    .usermux2down_data_wr(um2cdp_data_wr),
    .usermux2down_data(um2cdp_data),
    .usermux2down_valid_wr(um2cdp_valid_wr),
    .usermux2down_valid(um2cdp_valid),
    .down2usermux_alf(cdp2um_alf)
);
endmodule