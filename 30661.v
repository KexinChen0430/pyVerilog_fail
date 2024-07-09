module CTC_testbench;
	// Signal declaration
	reg Clock;
	reg Reset;
	reg[ `size_char - 1 : 0 ]R;
	reg[ `size_char - 1 : 0 ]G;
	reg[ `size_char - 1 : 0 ]B;
	wire[ `size_char - 1 : 0 ]R_out;
	wire[ `size_char - 1 : 0 ]G_out;
	wire[ `size_char - 1 : 0 ]B_out;
	reg[ `size_char - 1 : 0 ]RBlock[ 0 : `SumPixel - 1 ];
	reg[ `size_char - 1 : 0 ]GBlock[ 0 : `SumPixel - 1 ];
	reg[ `size_char - 1 : 0 ]BBlock[ 0 : `SumPixel - 1 ];
	integer i;
	integer RFile;
	integer GFile;
	integer BFile;
	CTC CTC_test
	(
		Clock,
		Reset,
		R,
		G,
		B,
		R_out,
		G_out,
		B_out
	);
	initial
	begin
		#2
		begin
			// open test data file
			$readmemh( "data/IM000565_RAW_20x15R.dat", RBlock );
			$readmemh( "data/IM000565_RAW_20x15G.dat", GBlock );
			$readmemh( "data/IM000565_RAW_20x15B.dat", BBlock );
			RFile = $fopen( "data/R.dat" );
			GFile = $fopen( "data/G.dat" );
			BFile = $fopen( "data/B.dat" );
		//	$readmemh( "data/IM000565_RAW_320x240R.dat", RBlock );
		//	$readmemh( "data/IM000565_RAW_320x240G.dat", GBlock );
		//	$readmemh( "data/IM000565_RAW_320x240B.dat", BBlock );
			Reset = 1;
		end
		//#2	Reset = 0;
		// Apply Stimulus in order to
		for( i = 0; i < `SumPixel; i = i + 1 )
		begin
			#2
			begin
				Reset = 0;
				R = RBlock[ i ];
				G = GBlock[ i ];
				B = BBlock[ i ];
			end
		end
		$fclose( RFile );
		$fclose( GFile );
		$fclose( BFile );
		#100000	$stop;
		#100000	$finish;
	end
	initial	Clock = 0;
	always	#1 Clock = ~Clock;	//Toggle Clock
endmodule