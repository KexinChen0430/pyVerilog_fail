module arriaiigz_mlab_cell
    (
     portadatain,
     portaaddr,
     portabyteenamasks,
     portbaddr,
     clk0,
     ena0,
     portbdataout
     );
parameter logical_ram_name = "lutram";
parameter logical_ram_depth = 0;
parameter logical_ram_width = 0;
parameter first_address = 0;
parameter last_address = 0;
parameter first_bit_number = 0;
parameter init_file = "init_file.hex";
parameter data_width = 1;
parameter address_width = 1;
parameter byte_enable_mask_width = 1;
parameter lpm_type = "arriaiigz_mlab_cell";
parameter lpm_hint = "true";
parameter mem_init0 = 640'b0; // 64x10 OR 32x20
parameter mixed_port_feed_through_mode = "dont_care";
// SIMULATION_ONLY_PARAMETERS_BEGIN
parameter byte_size = 1;
// SIMULATION_ONLY_PARAMETERS_END
// LOCAL_PARAMETERS_BEGIN
parameter num_rows = 1 << address_width;
parameter num_cols = 1;
parameter port_byte_size = data_width/byte_enable_mask_width;
// LOCAL_PARAMETERS_END
input [data_width - 1:0] portadatain;
input [address_width - 1:0] portaaddr;
input [byte_enable_mask_width - 1:0] portabyteenamasks;
input [address_width - 1:0] portbaddr;
input clk0;
input ena0;
output [data_width - 1:0] portbdataout;
reg ena0_reg;
reg viol_notifier;
wire reset;
assign reset = ena0_reg;
specify
      $setup  (portaaddr,    negedge clk0 &&& reset, 0, viol_notifier);
      $setup  (portabyteenamasks,    negedge clk0 &&& reset, 0, viol_notifier);
      $setup  (ena0, posedge clk0, 0, viol_notifier);
      $hold   (negedge clk0 &&& reset, portaaddr, 0, viol_notifier);
      $hold   (negedge clk0 &&& reset, portabyteenamasks, 0, viol_notifier);
      $hold   (posedge clk0, ena0, 0, viol_notifier);
      (portbaddr *> portbdataout) = (0,0);
endspecify
// clock / clock enable
wire clk_a_in;
// Input/Output registers (come from outside MLAB)
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
// data output
reg [data_width - 1:0] dataout_b;
initial
begin
    ena0_reg = 1'b0;
    // powerup output to 0
    dataout_b = 'b0;
    for (i = 0; i < num_rows; i = i + 1) mem[i] = 'b0;
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
always @(posedge clk_a_in) ena0_reg <= ena0;
// Write pulse generation
arriaiigz_mlab_cell_pulse_generator wpgen_a (
        .clk(~clk_a_in),
        .ena(ena0_reg),
        .pulse(write_pulse),
	.cycle(write_cycle)
        );
// Read pulse generation
// Create internal masks for byte enable processing
always @(portabyteenamasks)
begin
    for (i = 0; i < data_width; i = i + 1)
    begin
        mask_vector[i]     = (portabyteenamasks[i/port_byte_size] === 1'b1) ? 1'b0 : 1'bx;
        mask_vector_int[i] = (portabyteenamasks[i/port_byte_size] === 1'b0) ? 1'b0 : 1'bx;
    end
end
always @(posedge write_pulse)
begin
    // Write stage 1 : write X to memory
    if (write_pulse)
    begin
        mem_data = mem[portaaddr] ^ mask_vector_int;
        mem[portaaddr] = mem_data;
    end
end
// Write stage 2 : Write actual data to memory
always @(negedge write_pulse)
begin
    for (i = 0; i < data_width; i = i + 1)
        if (mask_vector[i] == 1'b0)
            mem_data[i] = portadatain[i];
    mem[portaaddr] = mem_data;
end
// Read stage : asynchronous continuous read
assign portbdataout = mem[portbaddr];
endmodule