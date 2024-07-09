module stratixii_mac_rs_block(
                              operation,
                              round,
                              saturate,
                              addnsub,
                              signa,
                              signb,
                              signsize,
                              roundsize,
                              dataoutsize,
                              dataa,
                              datab,
                              datain,
                              dataout
                            );
//PARAMETERS
parameter    block_type = "mac_mult";
parameter    dataa_width = 18;
parameter    datab_width = 18;
//INPUT PORTS
input          round;
input          saturate;
input          addnsub;
input          signa;
input          signb;
input [3:0]      operation;
input [5:0]      signsize;
input [7:0]      roundsize;
input [7:0]      dataoutsize;
input [71:0]  dataa;
input [71:0]  datab;
input [71:0]  datain;
//OUTPUT PORTS
output [71:0] dataout;
//INTERNAL SIGNALS
reg [71:0]   dataout_round;
reg [71:0]   dataout_saturate;
reg [71:0]   dataout_dly;
reg                saturated;
reg [71:0]   min;
reg [71:0]   max;
wire [71:0]      rs_saturate;
wire [71:0]      rs_mac_mult;
wire [71:0]      rs_mac_out;
reg                 msb;
integer          i;
reg [6:0] dataa_local;
reg [6 :0] datab_local;
reg [6:0] width_local;
reg[72:0] dataout_saturate_tmp;
reg[73:0] max_tmp;
reg[73:0] min_tmp;
wire round_ipd;
wire saturate_ipd;
wire addnsub_ipd;
wire signa_ipd;
wire signb_ipd;
wire [71:0]dataa_ipd;
wire [71:0]datab_ipd;
wire [71:0]datain_ipd;
buf buf_round (round_ipd,round);
buf buf_saturate (saturate_ipd,saturate);
buf buf_addnsub (addnsub_ipd,addnsub);
buf buf_signa (signa_ipd,signa);
buf buf_signb (signb_ipd,signb);
buf buf_dataa [71:0](dataa_ipd,dataa);
buf buf_datab [71:0](datab_ipd,datab);
buf buf_datain [71:0](datain_ipd,datain);
wire  [71:0] dataout_opd;
buf buf_dataout  [71:0] (dataout,dataout_opd);
initial
begin
    dataa_local = 7'd0;
    datab_local = 7'd0;
    width_local = 7'd0;
end
// TIMING SPECIFICATION
specify
   (round    *> dataout) = (0, 0);
   (saturate *> dataout) = (0, 0);
   (dataa    *> dataout) = (0, 0);
   (datab    *> dataout) = (0, 0);
   (datain   *> dataout) = (0, 0);
endspecify
always @ (datain_ipd or round_ipd)
    begin
        if(round_ipd)
            dataout_round = datain_ipd +(1 << (dataoutsize - signsize - roundsize -1));
        else
            dataout_round = datain_ipd;
    end
always @ (operation or dataa_ipd or datab_ipd or datain_ipd or signa_ipd or signb_ipd or round_ipd or saturate_ipd or addnsub_ipd or dataout_round)
    begin
        if(saturate_ipd)
            begin
                if (block_type == "mac_mult")
                    begin
                        if (!dataout_round[dataa_width+datab_width-1] &&
                            dataout_round[dataa_width+datab_width-2])
                            begin
		                        dataout_saturate_tmp[72:0] = {{(74-dataa_width-datab_width){1'b0}},{(dataa_width+datab_width-1){1'b1}}};
		                        dataout_saturate[71:0] = dataout_saturate_tmp[72:1];
                                min = dataout_saturate;
                                max = dataout_saturate;
                                saturated = 1'b1;
                            end
                        else
                            begin
                                dataout_saturate = dataout_round;
                                saturated = 1'b0;
                             end
                    end
                else if  ((operation[2] == 1'b1) &&
                           ((block_type == "R") ||
                           (block_type == "T")))
                    begin
                        saturated = 1'b0;
                        if(datab_width > 1)
                            datab_local = datab_width-2;
                        for (i = datab_local; i < (datab_width + signsize - 2); i = i + 1)
                            begin
                               if(dataout_round[datab_local] != dataout_round[i])
                                           saturated = 1'b1;
                                    end
                        if(saturated)
                            begin
                                max_tmp[73:0] = {{(74 - datab_width){1'b1}},{(datab_width){1'b0}}};
                                min_tmp[73:0] = {{(74 - datab_width){1'b0}},{(datab_width){1'b1}}};
                                max[71:0] = max_tmp[73:2];
                                min[71:0] = min_tmp[73:2];
                            end
                        else
                            begin
                                dataout_saturate = dataout_round;
                            end
                        msb = dataout_round[datab_width+15];
                    end
                else
                     begin
                         if(signa_ipd || signb_ipd || ~addnsub_ipd)
                             begin
                                 min = 1 << dataa_width;
                                 max = (1 << dataa_width)-1;
                             end
                         else
                             begin
                                 min = 0;
                                 max = (1 << (dataa_width + 1))-1;
                             end
                         saturated = 1'b0;
                         if(dataa_width > 1 )
                             dataa_local = dataa_width-2;
                         for (i = dataa_local; i < (dataa_width + signsize - 1); i = i + 1)
                             begin
                                 if(dataout_round[dataa_local] != dataout_round[i])
                                             saturated = 1'b1;
                                     end
                         msb = dataout_round[i];
                     end
                     if(saturated)
                          begin
                              if(msb)
                                  dataout_saturate = max;
                              else
                                  dataout_saturate = min;
                          end
                     else
                         dataout_saturate = dataout_round;
            end
        else
            begin
                saturated = 1'b0;
                dataout_saturate = dataout_round;
            end
    end
always @ (round_ipd or dataout_saturate)
    begin
        if(round_ipd)
            begin
                dataout_dly = dataout_saturate;
                width_local = dataoutsize - signsize - roundsize;
                if(width_local > 0)
                    begin
               	        for (i = 0; i < width_local; i = i + 1)
               	            dataout_dly[i] = 1'b0;
               	    end
             end
        else
            dataout_dly = dataout_saturate;
    end
assign rs_mac_mult = (saturate_ipd && (block_type == "mac_mult") && saturated)
                     ?({dataout_dly[71:3], 2'b0, saturated})
                     : rs_mac_out;
assign rs_mac_out  =  (saturate_ipd && (block_type != "mac_mult"))
                      ? ({dataout_dly[71:3],saturated, datain_ipd[1:0]})
                      : dataout_dly;
assign rs_saturate = saturate_ipd ? rs_mac_mult : rs_mac_out;
assign dataout_opd = ((operation == 4'b0000) || (operation == 4'b0111)) ? datain_ipd : rs_saturate;
endmodule