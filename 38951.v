module
	dcm clk0 (
		 .CLKIN_IN(c_in),
		 .RST_IN(clk_rst),
		 .CLKFX_OUT(clk),
		 .CLKIN_IBUFG_OUT(),
		 .CLK0_OUT(),
		 .LOCKED_OUT(locked_out)
		 );
  always @(pc2abus or ir2abus or pcout or irout)
    if(pc2abus) abus <= pcout;
    else if(ir2abus) abus <= irout[11:0];
    else abus <= 12'hzzz;
  assign dbus = ir2dbus ? {{4{irout[11]}},irout[11:0]} : 16'hzzzz;
  assign dbus = qtop2dbus ? qtop : 16'hzzzz;
  assign dbus = alu2dbus ? aluout : 16'hzzzz;
  assign dbus = ram2dbus ? ramout : 16'hzzzz;
  assign dbus = in2dbus ? in : 16'hzzzz;
  always @(cs or irout or qtop)
    begin
      halt = 0; pcinc = 0; push = 0; pop = 0; cont = 0; abus2pc = 0; dbus2ir = 0; dbus2qtop = 0; dbus2ram = 0; dbus2obuf = 0; pc2abus = 0; ir2abus = 0; ir2dbus = 0; qtop2dbus = 0; alu2dbus = 0; ram2dbus = 0; in2dbus = 0;
      if(cs == `FETCHA)
        begin
          pcinc = 1; pc2abus = 1;
        end
      else if(cs == `FETCHB)
        begin
          ram2dbus = 1; dbus2ir = 1;
        end
      else if(cs == `EXECA)
        case(irout[15:12])
        `PUSHI:
           begin
             ir2dbus = 1; dbus2qtop = 1; push = 1;
           end
        `PUSH:
           begin
             ir2abus = 1; cont = 1;
           end
        `POP:
           begin
             ir2abus = 1; qtop2dbus = 1; dbus2ram = 1; pop = 1;
           end
        `JMP:
           begin
             ir2abus = 1; abus2pc = 1;
           end
        `JZ:
           begin
             if(qtop == 0)
               begin
                 ir2abus = 1; abus2pc = 1;
               end
             pop = 1;
           end
        `JNZ:
           begin
             if(qtop != 0)
               begin
                 ir2abus = 1; abus2pc = 1;
               end
             pop = 1;
           end
        `IN:
           begin
             in2dbus = 1; dbus2qtop = 1; push = 1;
           end
        `OUT:
           begin
             qtop2dbus = 1; dbus2obuf = 1; pop = 1;
           end
        `OP:
           begin
             alu2dbus = 1; dbus2qtop = 1;
             if(irout[4] == 0) pop = 1;
           end
        default:
           halt = 1;
        endcase
      else if(cs == `EXECB)
        if(irout[15:12]==`PUSH)
          begin
          ram2dbus = 1; dbus2qtop = 1; push = 1;
        end
    end
endmodule