module will not receive NaN and inf at input stage.
	//if c is NaN or z is NaN return NaN
   if ((c_exponent == 128 && c_mantissa != 0) || (z_exponent == 128 && z_mantissa != 0)) begin
      sout_Special[31] <= 1;
      sout_Special[30:23] <= 255;
      sout_Special[22] <= 1;
      sout_Special[21:0] <= 0;
		zout_Special <= zin_Special;
		cout_Special <= cin_Special;
		idle_Special <= put_idle;
    //if c is inf return inf
    end else if (c_exponent == 128) begin
      sout_Special[31] <= c_sign;
      sout_Special[30:23] <= 255;
      sout_Special[22:0] <= 0;
		zout_Special <= zin_Special;
		cout_Special <= cin_Special;
		idle_Special <= put_idle;
    //if z is inf return inf
    end else if (z_exponent == 128) begin
      sout_Special[31] <= z_sign;
      sout_Special[30:23] <= 255;
      sout_Special[22:0] <= 0;
		zout_Special <= zin_Special;
		cout_Special <= cin_Special;
		idle_Special <= put_idle;
    //if c is zero return z
    end else if ((($signed(c_exponent) == -127) && (c_mantissa == 0)) && (($signed(z_exponent) == -127) && (z_mantissa == 0))) begin
      sout_Special[31] <= c_sign & z_sign;
      sout_Special[30:23] <= z_exponent[7:0] + 127;
      sout_Special[22:0] <= z_mantissa[26:3];
		zout_Special <= zin_Special;
		cout_Special <= cin_Special;
      idle_Special <= put_idle;
    //if c is zero return z
    end else if (($signed(c_exponent) == -127) && (c_mantissa == 0)) begin
      sout_Special[31] <= z_sign;
      sout_Special[30:23] <= z_exponent[7:0] + 127;
      sout_Special[22:0] <= z_mantissa[26:3];
		zout_Special <= zin_Special;
		cout_Special <= cin_Special;
      idle_Special <= put_idle;
    //if z is zero return c
    end else if (($signed(z_exponent) == -127) && (z_mantissa == 0)) begin
      sout_Special[31] <= c_sign;
      sout_Special[30:23] <= c_exponent[7:0] + 127;
      sout_Special[22:0] <= c_mantissa[26:3];
		zout_Special <= zin_Special;
		cout_Special <= cin_Special;
      idle_Special <= put_idle;
    end else begin
		sout_Special <= 0;
      //Denormalised Number
      if ($signed(c_exponent) == -127) begin
         cout_Special[34:27] <= -126;
			cout_Special[35] <= c_sign;
			cout_Special[26:0] <= c_mantissa;
      end else begin
			cout_Special[34:27] <= c_exponent + 127;
			cout_Special[35] <= c_sign;
         cout_Special[26] <= 1;
			cout_Special[25:0] <= c_mantissa[25:0];
			idle_Special <= no_idle;
      end
      //Denormalised Number
      if ($signed(z_exponent) == -127) begin
			zout_Special[35] <= z_sign;
         zout_Special[34:27] <= -126;
			zout_Special[26:0] <= z_mantissa;
      end else begin
			zout_Special[35] <= z_sign;
         zout_Special[34:27] <= z_exponent + 127;
			zout_Special[25:0] <= z_mantissa[25:0];
         zout_Special[26] <= 1;
			idle_Special <= no_idle;
      end
	end
   end
   else begin
      sout_Special[31] <= z_sign;
      sout_Special[30:23] <= z_exponent[7:0] + 127;
      sout_Special[22:0] <= z_mantissa[26:3];
		zout_Special <= zin_Special;
		cout_Special <= cin_Special;
      idle_Special <= put_idle;
	end
end
endmodule