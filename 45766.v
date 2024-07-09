module sv_log2;
reg	[31:0]	data;
reg	[31:0]	out_data;
initial begin
	data = 2;
	$log(data);
	#100 $stop;
end
endmodule