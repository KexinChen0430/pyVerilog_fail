module max_asynch_io (datain, oe, padio, dataout);
    parameter operation_mode = "input";
    parameter bus_hold = "false";
    parameter open_drain_output = "false";
    parameter weak_pull_up = "false";
    input datain, oe;
    output dataout;
    inout padio;
    reg  prev_value;
    reg tmp_padio, tmp_dataout;
    reg buf_control;
    wire datain_in;
    wire oe_in;
    buf(datain_in, datain);
    buf(oe_in, oe);
    tri padio_tmp;
specify
    (padio => dataout) = (0,0);
    (datain => padio) = (0, 0);
    (posedge oe => (padio +: padio_tmp)) = (0, 0);
    (negedge oe => (padio +: 1'bz)) = (0, 0);
endspecify
initial
begin
    prev_value = 'b1;
    tmp_padio = 'bz;
end
always @(datain_in or oe_in or padio)
begin
		if (bus_hold == "true" )
        begin
                buf_control = 'b1;
				if (operation_mode == "input")
				begin
					prev_value = padio;
					tmp_dataout = padio;
				end
                else if ( operation_mode == "output" || operation_mode == "bidir")
                begin
                        if ( oe_in == 1)
                        begin
                                if ( open_drain_output == "true" )
                                begin
                                        if (datain_in == 0)
                                        begin
                                                tmp_padio =     1'b0;
                                                prev_value = 1'b0;
                                        end
                                        else if (datain_in == 1'bx)
                                        begin
                                                tmp_padio = 1'bx;
                                                prev_value = 1'bx;
                                        end
                                        else   // 'Z'
                                        begin
                                                if ( padio != 1'bz)
                                                begin
                                                        prev_value = padio;
                                                end
                                        end
                                end  // end open_drain_output , true
                                else
                                begin
                                        tmp_padio = datain_in;
                                        prev_value = datain_in;
                                end  // end open_drain_output false
                        end             // end oe_in == 1
                        else if ( oe_in == 0 )
                        begin
							if ( padio !== 1'bz)
							begin
								prev_value = padio;
								if ((padio === 1'bx) && (operation_mode == "output") && (padio_tmp === 1'bx) && (prev_value === 1'bx))
								begin
									prev_value = 'b0;
								end
							end
							tmp_padio = 'bz;
                        end
                        else
                        begin
							begin
                                tmp_padio = 1'bx;
                                prev_value = 1'bx;
                        end
                        end
                        if ( operation_mode == "bidir")
                                tmp_dataout = padio;
                        else
                                tmp_dataout = 1'bz;
                        if ( $realtime <= 1 )
                                prev_value = 0;
                end
        end
        else    // bus hold is false
		if (bus_hold == "false")
        begin
                buf_control = 'b0;
                if ( operation_mode == "input")
                begin
                        tmp_dataout = padio;
						if (weak_pull_up == "true")
						begin
							if (tmp_dataout === 1'bz)
								tmp_dataout = 1'b1;
						end
                end
                else if (operation_mode == "output" || operation_mode == "bidir")
                begin
                        if ( operation_mode  == "bidir")
						begin
                                tmp_dataout = padio;
								if (weak_pull_up == "true")
								begin
									if (tmp_dataout === 1'bz)
										tmp_dataout = 1'b1;
								end
						end
                        if ( oe_in == 1 )
                        begin
                                if ( open_drain_output == "true" )
                                begin
                                        if (datain_in == 0)
                                                tmp_padio = 1'b0;
                                        else if ( datain_in == 1'bx)
                                                tmp_padio = 1'bx;
                                        else
										begin
                                                tmp_padio = 1'bz;
												if (weak_pull_up == "true")
												begin
													if (tmp_padio === 1'bz)
														buf_control = 1;
												end
										end
                                end
                                else
								begin
										if ((datain_in !== 1'b1)&&(datain_in !== 1'b0)&&(datain_in !== 'bx))
											tmp_padio = 'bz;
										else
                                        tmp_padio = datain_in;
										if (weak_pull_up == "true")
										begin
											if (tmp_padio === 1'bz)
												buf_control = 1;
										end
                        end
                        end
                        else if ( oe_in == 0 )
						begin
                                tmp_padio = 1'bz;
								if (weak_pull_up == "true")
								begin
									if (tmp_padio === 1'bz)
									begin
										buf_control = 1;
									end
								end
						end
                        else
                                tmp_padio = 1'bx;
                end
                else
                        $display ("Error: Invalid operation_mode specified in max io atom!\n");
        end
end
bufif1 (weak1, weak0) b(padio_tmp, prev_value, buf_control);  //weak value
pmos (padio_tmp, tmp_padio, 'b0);
pmos (dataout, tmp_dataout, 'b0);
pmos (padio, padio_tmp, 'b0);
endmodule