module arriaiigz_io_obuf (
                      i,
                      oe,
                      dynamicterminationcontrol,
                      seriesterminationcontrol,
                      parallelterminationcontrol,
                      devoe,
                      o,
                      obar
                    );
//Parameter Declaration
parameter open_drain_output = "false";
parameter bus_hold = "false";
parameter shift_series_termination_control = "false";
parameter sim_dynamic_termination_control_is_connected = "false";
parameter lpm_type = "arriaiigz_io_obuf";
//Input Ports Declaration
input i;
input oe;
input devoe;
input dynamicterminationcontrol;
input [13:0] seriesterminationcontrol;
input [13:0] parallelterminationcontrol;
//Outout Ports Declaration
output o;
output obar;
//INTERNAL Signals
reg out_tmp;
reg out_tmp_bar;
reg prev_value;
wire tmp;
wire tmp_bar;
wire tmp1;
wire tmp1_bar;
tri1 devoe;
specify
    (i => o)    = (0, 0);
    (i => obar) = (0, 0);
    (oe => o)   = (0, 0);
    (oe => obar)   = (0, 0);
endspecify
initial
    begin
        prev_value = 'b0;
        out_tmp = 'bz;
    end
always@(i or oe)
    begin
        if(oe == 1'b1)
            begin
                if(open_drain_output == "true")
                    begin
                        if(i == 'b0)
                             begin
                                 out_tmp = 'b0;
                                 out_tmp_bar = 'b1;
                                 prev_value = 'b0;
                             end
                        else
                             begin
                                 out_tmp = 'bz;
                                 out_tmp_bar = 'bz;
                             end
                    end
                else
                    begin
                        if( i == 'b0)
                            begin
                                out_tmp = 'b0;
                                out_tmp_bar = 'b1;
                                prev_value = 'b0;
                            end
                        else if( i == 'b1)
                            begin
                                out_tmp = 'b1;
                                out_tmp_bar = 'b0;
                                prev_value = 'b1;
                            end
                        else
                            begin
                                out_tmp = i;
                                out_tmp_bar = i;
                            end
                    end
            end
        else if(oe == 1'b0)
            begin
                out_tmp = 'bz;
                out_tmp_bar = 'bz;
            end
        else
            begin
                out_tmp = 'bx;
                out_tmp_bar = 'bx;
            end
    end
assign tmp = (bus_hold == "true") ? prev_value : out_tmp;
assign tmp_bar = (bus_hold == "true") ? !prev_value : out_tmp_bar;
assign tmp1 = ((oe == 1'b1) && (dynamicterminationcontrol == 1'b1) && (sim_dynamic_termination_control_is_connected == "true")) ? 1'bx :(devoe == 1'b1) ? tmp : 1'bz;
assign tmp1_bar =((oe == 1'b1) && (dynamicterminationcontrol == 1'b1)&& (sim_dynamic_termination_control_is_connected == "true")) ? 1'bx : (devoe == 1'b1) ? tmp_bar : 1'bz;
pmos (o, tmp1, 1'b0);
pmos (obar, tmp1_bar, 1'b0);
endmodule