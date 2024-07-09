module db_qp_ram(
		        clk    ,
		        cen_i  ,
		        oen_i  ,
		        wen_i  ,
		        addr_i ,
		        data_i ,
		        data_o
);
//    Parameter DECLARATION
parameter                 Word_Width = 20		   ;
parameter                 Addr_Width = `PIC_X_WIDTH;
//    Input/Output DECLARATION
input                     clk;      // clock input
input   		          cen_i;    // chip enable, low active
input   		          oen_i;    // data output enable, low active
input   		          wen_i;    // write enable, low active
input   [Addr_Width-1:0]  addr_i;   // address input
input   [Word_Width-1:0]  data_i;   // data input
output	[Word_Width-1:0]  data_o;   // data output
//    Register DECLARATION
reg    [Word_Width-1:0]   mem_array[(1<<Addr_Width)-1:0];
//    Wire DECLARATION
reg	   [Word_Width-1:0]  data_r;
//    Logic DECLARATION
// mem write
always @(posedge clk) begin
	if(!cen_i && !wen_i)
		mem_array[addr_i] <= data_i;
end
// mem read
always @(posedge clk) begin
	if (!cen_i && wen_i)
		data_r <= mem_array[addr_i];
	else
		data_r <= 'bx;
end
assign data_o = oen_i ? 'bz : data_r;
endmodule