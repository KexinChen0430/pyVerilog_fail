module ColorCorrection_testbench;
	reg[ `size_int - 1 : 0 ]R;
	reg[ `size_int - 1 : 0 ]G;
	reg[ `size_int - 1 : 0 ]B;
	wire[ `size_int - 1 : 0 ]R_out;
	wire[ `size_int - 1 : 0 ]G_out;
	wire[ `size_int - 1 : 0 ]B_out;
	ColorCorrection ColorCorrection_test( R, G, B, R_out, G_out, B_out );
	initial
	begin
		#100
		begin
			R = 200 << `ScaleBit;
			G = 0 << `ScaleBit;
			B = 0 << `ScaleBit;
		end
	//X=(200*( 860.0/512)+0*(-253.0/512)+0*( -95.0/512))*256=86000
	//Y=(200*(-109.0/512)+0*( 928.0/512)+0*(-307.0/512))*256=-10900
	//Z=(200*(  20.0/512)+0*(-290.0/512)+0*( 782.0/512))*256=2000
		#100	$display( "R_out = %d", R_out );
		#100	$display( "G_out = %d", G_out );
		#100	$display( "B_out = %d", B_out );
		#100
		begin
			R = 200 << `ScaleBit;
			G = 180 << `ScaleBit;
			B = 160 << `ScaleBit;
		end
	//X=(200*( 860.0/512)+180*(-253.0/512)+160*( -95.0/512))*256=55630
	//Y=(200*(-109.0/512)+180*( 928.0/512)+160*(-307.0/512))*256=48060
	//Z=(200*(  20.0/512)+180*(-290.0/512)+160*( 782.0/512))*256=38460
		#100	$display( "R_out = %d", R_out );
		#100	$display( "G_out = %d", G_out );
		#100	$display( "B_out = %d", B_out );
		#100    $stop;
		#100    $finish;
	end
endmodule