module SaturationEnhancement_testbench;
	reg signed[ `size_int - 1 : 0 ]CIEa;
	reg signed[ `size_int - 1 : 0 ]CIEb;
	wire signed[ `size_int - 1 : 0 ]CIEa_out;
	wire signed[ `size_int - 1 : 0 ]CIEb_out;
	SaturationEnhancement SaturationEnhancement_test( CIEa, CIEb, CIEa_out, CIEb_out );
	initial
	begin
		// CIEa = 32 * 256 * 6.3496042078727978990068225570775 = 52016
		#10	CIEa = 52016;
		#10     $display( "old CIEa = %d\tnew CIEa = %d", CIEa, CIEa_out );
		// CIEb = 17 * 256 * 6.3496042078727978990068225570775 = 27634
		#10	CIEb = 27634;
		#10	$display( "old CIEb = %d\tnew CIEb = %d", CIEb, CIEb_out );
		#10     $stop;
		#10     $finish;
	end
endmodule