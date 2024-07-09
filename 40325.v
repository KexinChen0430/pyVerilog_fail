module GammaCorrection_testbench;
	reg[ `size_int - 1 : 0 ]source;
	wire[ `size_int - 1 : 0 ]target;
	GammaCorrection GammaCorrection_test( source, target );
	initial
	begin
		#10	source = 2 << `ScaleBit;
		#10     $display( "old value = %d\tnew value = %d", source, target );
		#10	source = 10 << `ScaleBit;
		#10	$display( "old value = %d\tnew value = %d", source, target );
		#10     $stop;
		#10     $finish;
	end
endmodule