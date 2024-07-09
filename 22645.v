module hardcopyiii_hram
    (
     portadatain,
     portaaddr,
     portabyteenamasks,
     portbaddr,
     clk0, clk1,
     ena0, ena1,
   	 ena2, ena3,
   	 clr0, clr1,
	 devclrn,
     devpor,
     portbdataout
     );
parameter logical_ram_name = "hram";
parameter logical_ram_depth = 0;
parameter logical_ram_width = 0;
parameter first_address = 0;
parameter last_address = 0;
parameter first_bit_number = 0;
parameter init_file = "NONE";
parameter data_width = 20;
parameter address_width = 6;
parameter byte_enable_mask_width = 1;
parameter byte_size = 1;
parameter port_b_address_clock = "none";
parameter port_b_address_clear = "none";
parameter port_b_data_out_clock = "none";
parameter port_b_data_out_clear = "none";
parameter lpm_type = "hardcopyiii_hram";
parameter lpm_hint = "true";
parameter mem_init0 = 640'b0; // 64x10 OR 32x20
parameter mixed_port_feed_through_mode = "dont_care";
input [data_width - 1:0] portadatain;
input [address_width - 1:0] portaaddr;
input [byte_enable_mask_width - 1:0] portabyteenamasks;
input [address_width - 1:0] portbaddr;
input clk0;
input clk1;
input ena0;
input ena1;
input ena2;
input ena3;
input clr0;
input clr1;
input devclrn;
input devpor;
output [data_width - 1:0] portbdataout;
tri1 devclrn;
tri1 devpor;
tri0 [data_width - 1:0] portadatain;
tri0 [address_width - 1:0] portaaddr;
tri1 [byte_enable_mask_width - 1:0] portabyteenamasks;
tri0 clr0,clr1;
tri0 clk0,clk1;
tri1 ena0,ena1;
tri1 ena2,ena3;
// LOCAL_PARAMETERS_BEGIN
parameter port_byte_size = (data_width / byte_enable_mask_width) + (data_width % byte_enable_mask_width);
parameter num_rows = 1 << address_width;
parameter num_cols = 1;
// LOCAL_PARAMETERS_END
reg ena0_reg;
reg ena1_reg;
reg ena2_reg;
reg ena3_reg;
specify
      (portbaddr *> portbdataout) = (0,0);
endspecify
// clock / clock enable
wire clk_a_in, clk_b_in;
wire clk_b_out;
// asynch clear
wire addr_b_clr_in;
wire dataout_b_clr_in;
wire dataout_b_clr;
wire addr_b_clr;
wire addr_a_clr;
wire datain_a_clr;
wire byteena_a_clr;
// port A registers
wire [address_width - 1:0] addr_a_reg;
wire [data_width - 1:0] datain_a_reg;
wire [byte_enable_mask_width - 1:0] byteena_a_reg;
// port B registers
wire [address_width - 1:0] addr_b_reg;
wire  [data_width - 1:0] dataout_b;
wire [data_width - 1:0] dataout_b_reg;
wire [data_width - 1:0] portbdataout_tmp;
// placeholders for read/written data
reg  [data_width - 1:0] read_data_latch;
reg  [data_width - 1:0] mem_data;
// pulses for A/B ports (no read pulse)
wire write_pulse;
wire write_cycle;
// memory core
reg  [data_width - 1:0] mem [num_rows - 1:0];
// byte enable
reg  [data_width - 1:0] mask_vector, mask_vector_int;
// memory initialization
integer i,j,k;
integer addr_range_init;
reg [data_width - 1:0] init_mem_word;
reg [(last_address - first_address + 1)*data_width - 1:0] mem_init;
// port active for read/write
wire  active_a,active_a_in;
wire  active_write_a;
initial
begin
    ena0_reg = 1'b0;
	ena1_reg = 1'b0;
	ena2_reg = 1'b0;
	ena3_reg = 1'b0;
    // powerup output to 0
    for (i = 0; i < num_rows; i = i + 1)
		mem[i] = {data_width{1'b0}};
    mem_init = mem_init0;
    addr_range_init  = last_address - first_address + 1;
    for (j = 0; j < addr_range_init; j = j + 1)
    begin
        for (k = 0; k < data_width; k = k + 1)
            init_mem_word[k] = mem_init[j*data_width + k];
        mem[j] = init_mem_word;
    end
end
assign clk_a_in = clk0;
assign clk_b_in = (port_b_address_clock == "clock0") ? clk0 : port_b_address_clock == "clock1" ? clk1 : 1'b0;
assign clk_b_out = (port_b_data_out_clock == "clock1") ? clk1 : 1'b0;
always @(posedge clk_a_in) ena0_reg <= ena0;
always @(posedge clk_b_out) ena1_reg <= ena1;
always @(posedge clk_a_in) ena2_reg <= ena2;
always @(posedge clk_b_in) ena3_reg <= ena3;
assign addr_b_clr_in = (port_b_address_clear == "clear0") ? clr0 : 1'b0;
assign dataout_b_clr_in = (port_b_data_out_clear == "clear1") ? clr1 : 1'b0;
// Port A registers
// address register
hardcopyiii_ram_register addr_a_register(
        .d(portaaddr),
        .clk(clk_a_in),
		.aclr(1'b0),
        .devclrn(devclrn),
        .devpor(devpor),
        .ena(ena2),
		.stall(1'b0),
        .q(addr_a_reg),
		.aclrout(addr_a_clr)
        );
defparam addr_a_register.width = address_width;
// data register
hardcopyiii_ram_register datain_a_register(
        .d(portadatain),
        .clk(clk_a_in),
		.aclr(1'b0),
        .devclrn(devclrn),
        .devpor(devpor),
        .ena(ena2),
		.stall(1'b0),
        .q(datain_a_reg),
		.aclrout(datain_a_clr)
        );
defparam datain_a_register.width = data_width;
// byte enable register
hardcopyiii_ram_register byteena_a_register(
        .d(portabyteenamasks),
        .clk(clk_a_in),
		.aclr(1'b0),
        .devclrn(devclrn),
        .devpor(devpor),
        .ena(ena2),
		.stall(1'b0),
        .q(byteena_a_reg),
		.aclrout(byteena_a_clr)
        );
defparam byteena_a_register.width = byte_enable_mask_width;
// Port B registers
// address register
hardcopyiii_ram_register addr_b_register(
        .d(portbaddr),
        .clk(clk_b_in),
		.aclr(addr_b_clr_in),
        .devclrn(devclrn),
        .devpor(devpor),
        .ena(ena3),
		.stall(1'b0),
        .q(addr_b_reg),
		.aclrout(addr_b_clr)
        );
defparam addr_b_register.width = address_width;
// data register
hardcopyiii_ram_register data_b_register(
        .d(dataout_b),
        .clk(clk_b_out),
		.aclr(dataout_b_clr_in),
        .devclrn(devclrn),
        .devpor(devpor),
        .ena(ena1),
		.stall(1'b0),
        .q(dataout_b_reg),
		.aclrout(dataout_b_clr)
        );
defparam data_b_register.width = data_width;
// Write pulse generation
hardcopyiii_hram_pulse_generator wpgen_a (
        .clk(~clk_a_in),
        .ena(ena0_reg),
        .pulse(write_pulse),
	    .cycle(write_cycle)
        );
// Read pulse generation
// Create internal masks for byte enable processing
always @(byteena_a_reg)
begin
	for (i = 0; i < data_width; i = i + 1)
	begin
		if (byteena_a_reg[i/port_byte_size] === 1'b1)
			mask_vector[i] = 1'b0;
		else
			mask_vector[i] = 1'bx;
		if (byteena_a_reg[i/port_byte_size] === 1'b0)
			mask_vector_int[i] = 1'b0;
		else
			mask_vector_int[i] = 1'bx;
	end
end
always @(posedge write_pulse)
begin
    // Write stage 1 : write X to memory
    if (write_pulse)
    begin
        mem_data = mem[addr_a_reg] ^ mask_vector_int;
        mem[addr_a_reg] = mem_data;
    end
end
// Write stage 2 : Write actual data to memory
always @(negedge write_pulse)
begin
    for (i = 0; i < data_width; i = i + 1)
        if (mask_vector[i] == 1'b0)
            mem_data[i] = datain_a_reg[i];
    mem[addr_a_reg] = mem_data;
end
// Read stage : asynchronous continuous read
assign dataout_b = (port_b_address_clock == "none") ? mem[portbaddr] : mem[addr_b_reg];
assign portbdataout_tmp = (port_b_data_out_clock == "clock1") ? dataout_b_reg : dataout_b;
assign portbdataout = portbdataout_tmp;
endmodule