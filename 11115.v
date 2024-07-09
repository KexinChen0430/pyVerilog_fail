module arriaiigz_io_ibuf (
                      i,
                      ibar,
                      dynamicterminationcontrol,
                      o
                     );
// SIMULATION_ONLY_PARAMETERS_BEGIN
parameter differential_mode = "false";
parameter bus_hold = "false";
parameter simulate_z_as = "Z";
parameter lpm_type = "arriaiigz_io_ibuf";
// SIMULATION_ONLY_PARAMETERS_END
//Input Ports Declaration
input i;
input ibar;
input dynamicterminationcontrol;
//Output Ports Declaration
output o;
// Internal signals
reg out_tmp;
reg o_tmp;
wire out_val ;
reg prev_value;
specify
    (i => o)    = (0, 0);
    (ibar => o) = (0, 0);
endspecify
initial
    begin
        prev_value = 1'b0;
    end
always@(i or ibar)
    begin
        if(differential_mode == "false")
            begin
                if(i == 1'b1)
                    begin
                        o_tmp = 1'b1;
                        prev_value = 1'b1;
                    end
                else if(i == 1'b0)
                    begin
                        o_tmp = 1'b0;
                        prev_value = 1'b0;
                    end
                else if( i === 1'bz)
                    o_tmp = out_val;
                else
                    o_tmp = i;
                if( bus_hold == "true")
                    out_tmp = prev_value;
                else
                    out_tmp = o_tmp;
            end
        else
            begin
                case({i,ibar})
                    2'b00: out_tmp = 1'bX;
                    2'b01: out_tmp = 1'b0;
                    2'b10: out_tmp = 1'b1;
                    2'b11: out_tmp = 1'bX;
                    default: out_tmp = 1'bX;
                endcase
        end
    end
assign out_val = (simulate_z_as == "Z") ? 1'bz :
                 (simulate_z_as == "X") ? 1'bx :
                 (simulate_z_as == "vcc")? 1'b1 :
                 (simulate_z_as == "gnd") ? 1'b0 : 1'bz;
pmos (o, out_tmp, 1'b0);
endmodule