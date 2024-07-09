module stratixv_mlab_cell
    (
     portadatain,
     portaaddr,
     portabyteenamasks,
     portbaddr,
     clk0, clk1,
     ena0, ena1,
   	 ena2,
   	 clr,
	 devclrn,
     devpor,
     portbdataout
     );
parameter logical_ram_name = "lutram";
parameter logical_ram_depth = 0;
parameter logical_ram_width = 0;
parameter first_address = 0;
parameter last_address = 0;
parameter first_bit_number = 0;
parameter mixed_port_feed_through_mode = "new";
parameter init_file = "NONE";
parameter data_width = 20;
parameter address_width = 6;
parameter byte_enable_mask_width = 1;
parameter byte_size = 1;
parameter port_b_data_out_clock = "none";
parameter port_b_data_out_clear = "none";
parameter lpm_type = "stratixv_mlab_cell";
parameter lpm_hint = "true";
parameter mem_init0 = "";
input [data_width - 1:0] portadatain;
input [address_width - 1:0] portaaddr;
input [byte_enable_mask_width - 1:0] portabyteenamasks;
input [address_width - 1:0] portbaddr;
input clk0;
input clk1;
input ena0;
input ena1;
input ena2;
input clr;
input devclrn;
input devpor;
output [data_width - 1:0] portbdataout;
generic_mlab_cell my_lutram0
(
	.portadatain(portadatain),
	.portaaddr(portaaddr),
	.portabyteenamasks(portabyteenamasks),
	.portbaddr(portbaddr),
	.clk0(clk0),
	.clk1(clk1),
	.ena0(ena0),
	.ena1(ena1),
	.ena2(ena2),
	.clr(clr),
	.devclrn(devclrn),
	.devpor(devpor),
	.portbdataout(portbdataout)
);
defparam my_lutram0.logical_ram_name = logical_ram_name;
defparam my_lutram0.logical_ram_depth = logical_ram_depth;
defparam my_lutram0.logical_ram_width = logical_ram_width;
defparam my_lutram0.first_address = first_address;
defparam my_lutram0.last_address = last_address;
defparam my_lutram0.first_bit_number = first_bit_number;
defparam my_lutram0.mixed_port_feed_through_mode = mixed_port_feed_through_mode;
defparam my_lutram0.init_file = init_file;
defparam my_lutram0.data_width = data_width;
defparam my_lutram0.address_width = address_width;
defparam my_lutram0.byte_enable_mask_width = byte_enable_mask_width;
defparam my_lutram0.byte_size = byte_size;
defparam my_lutram0.port_b_data_out_clock = port_b_data_out_clock;
defparam my_lutram0.port_b_data_out_clear = port_b_data_out_clear;
defparam my_lutram0.lpm_type = lpm_type;
defparam my_lutram0.lpm_hint = lpm_hint;
defparam my_lutram0.mem_init0 = mem_init0;
endmodule