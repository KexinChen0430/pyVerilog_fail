module BackwardSpace//( CIEL, CIEa, CIEb, R, G, B );
(
	input[ `size_int - 1 : 0 ]CIEL,
	input signed[ `size_int - 1 : 0 ]CIEa,
	input signed[ `size_int - 1 : 0 ]CIEb,
	output reg[ `size_int - 1 : 0 ]R,
	output reg[ `size_int - 1 : 0 ]G,
	output reg[ `size_int - 1 : 0 ]B
);
	reg[ `size_int - 1 : 0 ]RR;
	reg[ `size_int - 1 : 0 ]GG;
	reg[ `size_int - 1 : 0 ]BB;
	reg[ `size_int - 1 : 0 ]X;
	reg[ `size_int - 1 : 0 ]Y;
	reg[ `size_int - 1 : 0 ]Z;
	reg[ `size_int - 1 : 0 ]fX;
	reg[ `size_int - 1 : 0 ]fY;
	reg[ `size_int - 1 : 0 ]fZ;
	always@( CIEL or CIEa or CIEb )
	begin
		// proto type formulation
		// fY = ( CIEL + pow_16_256_1_3 ) / 116;
		// fX = CIEa / 500 + fY;
		// fZ = fY - CIEb / 200;
		// fY = ( ( CIEL + pow_16_256_1_3 ) / 116 ) << ( `ScaleBit + `ScaleBit );
		// fX = ( ( CIEa / 500 ) << ( `ScaleBit + `ScaleBit ) ) + fY;
		// fZ = fY - ( CIEb / 200 ) << ( `ScaleBit + `ScaleBit );
		// avoid usage of the division
		fY = ( CIEL + `pow_16_256_1_3 ) * 565;
		fX = CIEa * 131 + fY;
		fZ = fY - CIEb * 328;
		// avoid extreme case of fY
		if( fY < `Lab2RGBLimit )
			fY = `Lab2RGBLimit;
		// avoid extreme case of fX
		if( fX < `Lab2RGBLimit )
			fX = `Lab2RGBLimit;
		// avoid extreme case of fZ
		if( fZ < `Lab2RGBLimit )
			fZ = `Lab2RGBLimit;
		// in case of over-range of power 3 operation later
		// fY = fY >> `ScaleHalfBit;
		fY = fY >> ( `ScaleHalfBit + `ScaleBit + `ScaleBit );
		Y = fY * fY * fY;
		Y = ( Y * 255 ) >> `ScaleBit;
		// in case of over-range of power 3 operation later
		// fX = fX >> `ScaleHalfBit;
		fX = fX >> ( `ScaleHalfBit + `ScaleBit + `ScaleBit );
		X = fX * fX * fX;
		X = ( X * 242 ) >> `ScaleBit;
		// in case of over-range of power 3 operation later
		// fZ = fZ >> `ScaleHalfBit;
		fZ = fZ >> ( `ScaleHalfBit + `ScaleBit + `ScaleBit );
		Z = fZ * fZ * fZ;
		Z = ( Z * 278 ) >> `ScaleBit;
		RR = (  `XYZ2RGB1 * X - `XYZ2RGB2 * Y - `XYZ2RGB3 * Z )
		>> ( `ScaleBit + `ScaleHalfBit );
		GG = ( -`XYZ2RGB4 * X + `XYZ2RGB5 * Y + `XYZ2RGB6 * Z )
		>> ( `ScaleBit + `ScaleHalfBit );
		BB = (  `XYZ2RGB7 * X - `XYZ2RGB8 * Y + `XYZ2RGB9 * Z )
		>> ( `ScaleBit + `ScaleHalfBit );
		R = ( RR[ 17 : 16 ] == 2'b00 ) ? RR : ( RR[ 17 ] == 1'b1 ) ? `MinThreshold : `MaxThreshold;
		G = ( GG[ 17 : 16 ] == 2'b00 ) ? GG : ( GG[ 17 ] == 1'b1 ) ? `MinThreshold : `MaxThreshold;
		B = ( BB[ 17 : 16 ] == 2'b00 ) ? BB : ( BB[ 17 ] == 1'b1 ) ? `MinThreshold : `MaxThreshold;
	end
endmodule