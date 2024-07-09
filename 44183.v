module BackwardSpace_testbench;
	reg[ `size_int - 1 : 0 ]CIEL;
	reg signed[ `size_int - 1 : 0 ]CIEa;
	reg signed[ `size_int - 1 : 0 ]CIEb;
	wire[ `size_int - 1 : 0 ]R;
	wire[ `size_int - 1 : 0 ]G;
	wire[ `size_int - 1 : 0 ]B;
	BackwardSpace BackwardSpace_test( CIEL, CIEa, CIEb, R, G, B );
	initial
	begin
		$monitor( "CIEL = %d, CIEa = %d, CIEb = %d, R = %d, G = %d, B = %d",
				CIEL, CIEa, CIEb, R, G, B );
		#100
		begin
		// proto formulation
		// CIEL = ( 80 << `ScaleBit ) * 6.3496042078727978990068225569719;	// 130040
		// CIEa = ( 20 << `ScaleBit ) * 6.3496042078727978990068225569719;	// 32509
		// CIEb = ( 30 << `ScaleBit ) * 6.3496042078727978990068225569719;	// 48765
		CIEL = 130040;
		CIEa = 32509;
		CIEb = 48765;
		end
		#100
		begin
		// proto formulation
		// CIEL = ( 50 << `ScaleBit ) * 6.3496042078727978990068225569719;	// 81275
		// CIEa = ( 10 << `ScaleBit ) * 6.3496042078727978990068225569719;	// 16255
		// CIEb = ( 20 << `ScaleBit ) * 6.3496042078727978990068225569719;	// 32510
		CIEL = 81275;
		CIEa = 16255;
		CIEb = 32510;
		end
		#100    $stop;
		#100    $finish;
	end
endmodule