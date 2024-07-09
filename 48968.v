module hardcopyii_ram_block
    (
     portadatain,
     portaaddr,
     portawe,
     portbdatain,
     portbaddr,
     portbrewe,
     clk0, clk1,
     ena0, ena1,
     clr0, clr1,
     portabyteenamasks,
     portbbyteenamasks,
     portaaddrstall,
     portbaddrstall,
     devclrn,
     devpor,
     portadataout,
     portbdataout
     );
parameter operation_mode = "single_port";
parameter mixed_port_feed_through_mode = "dont_care";
parameter ram_block_type = "auto";
parameter logical_ram_name = "ram_name";
parameter init_file = "init_file.hex";
parameter init_file_layout = "none";
parameter data_interleave_width_in_bits = 1;
parameter data_interleave_offset_in_bits = 1;
parameter port_a_logical_ram_depth = 0;
parameter port_a_logical_ram_width = 0;
parameter port_a_first_address = 0;
parameter port_a_last_address = 0;
parameter port_a_first_bit_number = 0;
parameter port_a_data_out_clear = "none";
parameter port_a_data_out_clock = "none";
parameter port_a_data_width = 1;
parameter port_a_address_width = 1;
parameter port_a_byte_enable_mask_width = 1;
parameter port_b_logical_ram_depth = 0;
parameter port_b_logical_ram_width = 0;
parameter port_b_first_address = 0;
parameter port_b_last_address = 0;
parameter port_b_first_bit_number = 0;
parameter port_b_data_in_clear = "none";
parameter port_b_address_clear = "none";
parameter port_b_read_enable_write_enable_clear = "none";
parameter port_b_byte_enable_clear = "none";
parameter port_b_data_out_clear = "none";
parameter port_b_data_in_clock = "clock1";
parameter port_b_address_clock = "clock1";
parameter port_b_read_enable_write_enable_clock = "clock1";
parameter port_b_byte_enable_clock = "clock1";
parameter port_b_data_out_clock = "none";
parameter port_b_data_width = 1;
parameter port_b_address_width = 1;
parameter port_b_byte_enable_mask_width = 1;
parameter power_up_uninitialized = "false";
parameter lpm_type = "hardcopyii_ram_block";
parameter lpm_hint = "true";
parameter connectivity_checking = "off";
 parameter mem_init0 = 2048'b0;
 parameter mem_init1 = 2560'b0;
parameter port_a_byte_size = 0;
parameter port_a_disable_ce_on_input_registers = "off";
parameter port_a_disable_ce_on_output_registers = "off";
parameter port_b_byte_size = 0;
parameter port_b_disable_ce_on_input_registers = "off";
parameter port_b_disable_ce_on_output_registers = "off";
// SIMULATION_ONLY_PARAMETERS_BEGIN
parameter port_a_data_in_clear = "none";
parameter port_a_address_clear = "none";
parameter port_a_write_enable_clear = "none";
parameter port_a_byte_enable_clear = "none";
parameter port_a_data_in_clock = "clock0";
parameter port_a_address_clock = "clock0";
parameter port_a_write_enable_clock = "clock0";
parameter port_a_byte_enable_clock = "clock0";
// SIMULATION_ONLY_PARAMETERS_END
// LOCAL_PARAMETERS_BEGIN
parameter primary_port_is_a  = (port_b_data_width <= port_a_data_width) ? 1'b1 : 1'b0;
parameter primary_port_is_b  = ~primary_port_is_a;
parameter mode_is_rom_or_sp  = ((operation_mode == "rom") || (operation_mode == "single_port")) ? 1'b1 : 1'b0;
parameter data_width         = (primary_port_is_a) ? port_a_data_width : port_b_data_width;
parameter data_unit_width    = (mode_is_rom_or_sp | primary_port_is_b) ? port_a_data_width : port_b_data_width;
parameter address_width      = (mode_is_rom_or_sp | primary_port_is_b) ? port_a_address_width : port_b_address_width;
parameter address_unit_width = (mode_is_rom_or_sp | primary_port_is_a) ? port_a_address_width : port_b_address_width;
parameter wired_mode         = ((port_a_address_width == 1) && (port_a_address_width == port_b_address_width)
                                                            && (port_a_data_width != port_b_data_width));
parameter num_rows = 1 << address_unit_width;
parameter num_cols = (mode_is_rom_or_sp) ? 1 : ( wired_mode ? 2 :
                      ( (primary_port_is_a) ?
                      1 << (port_b_address_width - port_a_address_width) :
                      1 << (port_a_address_width - port_b_address_width) ) ) ;
parameter mask_width_prime = (primary_port_is_a) ?
                              port_a_byte_enable_mask_width : port_b_byte_enable_mask_width;
parameter mask_width_sec   = (primary_port_is_a) ?
                              port_b_byte_enable_mask_width : port_a_byte_enable_mask_width;
parameter byte_size_a = port_a_data_width/port_a_byte_enable_mask_width;
parameter byte_size_b = port_b_data_width/port_b_byte_enable_mask_width;
parameter mode_is_dp  = (operation_mode == "dual_port") ? 1'b1 : 1'b0;
// LOCAL_PARAMETERS_END
input portawe;
input [port_a_data_width - 1:0] portadatain;
input [port_a_address_width - 1:0] portaaddr;
input [port_a_byte_enable_mask_width - 1:0] portabyteenamasks;
input portbrewe;
input [port_b_data_width - 1:0] portbdatain;
input [port_b_address_width - 1:0] portbaddr;
input [port_b_byte_enable_mask_width - 1:0] portbbyteenamasks;
input clr0,clr1;
input clk0,clk1;
input ena0,ena1;
input devclrn,devpor;
input portaaddrstall;
input portbaddrstall;
output [port_a_data_width - 1:0] portadataout;
output [port_b_data_width - 1:0] portbdataout;
tri0 portawe_int;
assign portawe_int = portawe;
tri0 [port_a_data_width - 1:0] portadatain_int;
assign portadatain_int = portadatain;
tri0 [port_a_address_width - 1:0] portaaddr_int;
assign portaaddr_int = portaaddr;
tri1 [port_a_byte_enable_mask_width - 1:0] portabyteenamasks_int;
assign portabyteenamasks_int = portabyteenamasks;
tri0 portbrewe_int;
assign portbrewe_int = portbrewe;
tri0 [port_b_data_width - 1:0] portbdatain_int;
assign portbdatain_int = portbdatain;
tri0 [port_b_address_width - 1:0] portbaddr_int;
assign portbaddr_int = portbaddr;
tri1 [port_b_byte_enable_mask_width - 1:0] portbbyteenamasks_int;
assign portbbyteenamasks_int = portbbyteenamasks;
tri0 clr0_int,clr1_int;
assign clr0_int = clr0;
assign clr1_int = clr1;
tri0 clk0_int,clk1_int;
assign clk0_int = clk0;
assign clk1_int = clk1;
tri1 ena0_int,ena1_int;
assign ena0_int = ena0;
assign ena1_int = ena1;
tri0 portaaddrstall_int;
assign portaaddrstall_int = portaaddrstall;
tri0 portbaddrstall_int;
assign portbaddrstall_int = portbaddrstall;
tri1 devclrn;
tri1 devpor;
// clock / clock enable
wire clk_a_in,clk_a_byteena,clk_a_out,clkena_a_out;
wire clk_b_in,clk_b_byteena,clk_b_out,clkena_b_out;
wire write_cycle_a,write_cycle_b;
// asynch clear
wire datain_a_clr,dataout_a_clr,datain_b_clr,dataout_b_clr;
wire addr_a_clr,addr_b_clr;
wire byteena_a_clr,byteena_b_clr;
wire we_a_clr,rewe_b_clr;
wire datain_a_clr_in,datain_b_clr_in;
wire addr_a_clr_in,addr_b_clr_in;
wire byteena_a_clr_in,byteena_b_clr_in;
wire we_a_clr_in,rewe_b_clr_in;
reg  mem_invalidate;
wire [`PRIME:`SEC] clear_asserted_during_write;
reg  clear_asserted_during_write_a,clear_asserted_during_write_b;
// port A registers
wire we_a_reg;
wire [port_a_address_width - 1:0] addr_a_reg;
wire [port_a_data_width - 1:0] datain_a_reg, dataout_a_reg;
reg  [port_a_data_width - 1:0] dataout_a;
wire [port_a_byte_enable_mask_width - 1:0] byteena_a_reg;
reg  out_a_is_reg;
// port B registers
wire rewe_b_reg;
wire [port_b_address_width - 1:0] addr_b_reg;
wire [port_b_data_width - 1:0] datain_b_reg, dataout_b_reg;
reg  [port_b_data_width - 1:0] dataout_b;
wire [port_b_byte_enable_mask_width - 1:0] byteena_b_reg;
reg  out_b_is_reg;
// placeholders for read/written data
reg  [data_width - 1:0] read_data_latch;
reg  [data_width - 1:0] mem_data;
reg  [data_width - 1:0] old_mem_data;
reg  [data_unit_width - 1:0] read_unit_data_latch;
reg  [data_width - 1:0]      mem_unit_data;
// pulses for A/B ports
wire write_pulse_a,write_pulse_b;
wire read_pulse_a,read_pulse_b;
wire read_pulse_a_feedthru,read_pulse_b_feedthru;
wire [address_unit_width - 1:0] addr_prime_reg; // registered address
wire [address_width - 1:0]      addr_sec_reg;
wire [data_width - 1:0]       datain_prime_reg; // registered data
wire [data_unit_width - 1:0]  datain_sec_reg;
// pulses for primary/secondary ports
wire write_pulse_prime,write_pulse_sec;
wire read_pulse_prime,read_pulse_sec;
wire read_pulse_prime_feedthru,read_pulse_sec_feedthru;
reg  [`PRIME:`SEC] dual_write;  // simultaneous write to same location
// (row,column) coordinates
reg  [address_unit_width - 1:0] row_sec;
reg  [address_width + data_unit_width - address_unit_width - 1:0] col_sec;
// memory core
reg  [data_width - 1:0] mem [num_rows - 1:0];
// byte enable
wire [data_width - 1:0]      mask_vector_prime, mask_vector_prime_int;
wire [data_unit_width - 1:0] mask_vector_sec,   mask_vector_sec_int;
reg  [data_unit_width - 1:0] mask_vector_common_int;
reg  [port_a_data_width - 1:0] mask_vector_a, mask_vector_a_int;
reg  [port_b_data_width - 1:0] mask_vector_b, mask_vector_b_int;
// memory initialization
integer i,j,k,l;
integer addr_range_init;
reg [data_width - 1:0] init_mem_word;
reg [(port_a_last_address - port_a_first_address + 1)*port_a_data_width - 1:0] mem_init;
// port active for read/write
wire  active_a, active_b;
wire  active_a_in, active_b_in;
wire  active_write_a,active_write_b,active_write_clear_a,active_write_clear_b;
reg  mode_is_rom,mode_is_sp,mode_is_bdp; // ram mode
reg  ram_type;                               // ram type eg. MRAM
  reg m4k_write_error_port_a, m4k_write_error_port_b;
  always @(negedge clk_a_in)
  begin
      if (m4k_write_error_port_a == 1'b1) m4k_write_error_port_a = 1'b0;
  end
  always @(negedge clk_b_in)
  begin
      if (m4k_write_error_port_b == 1'b1) m4k_write_error_port_b = 1'b0;
  end
initial
begin
`ifdef QUARTUS_MEMORY_PLI
     $memory_connect(mem);
`endif
   ram_type = (ram_block_type == "M-RAM" || ram_block_type == "m-ram" || ram_block_type == "MegaRAM" ||
              (ram_block_type == "auto"  && mixed_port_feed_through_mode == "dont_care" && port_b_read_enable_write_enable_clock == "clock0"));
     if ((port_b_read_enable_write_enable_clock == "clock1") && (ram_type == 0))
     begin
         m4k_write_error_port_a = 1'b1;
         m4k_write_error_port_b = 1'b1;
     end
     else
     begin
         m4k_write_error_port_a = 1'b0;
         m4k_write_error_port_b = 1'b0;
     end
    mode_is_rom = (operation_mode == "rom");
    mode_is_sp  = (operation_mode == "single_port");
    mode_is_bdp = (operation_mode == "bidir_dual_port");
    out_a_is_reg = (port_a_data_out_clock == "none") ? 1'b0 : 1'b1;
    out_b_is_reg = (port_b_data_out_clock == "none") ? 1'b0 : 1'b1;
    // powerup output latches to 0
        dataout_a = 'b0;
        if (mode_is_dp || mode_is_bdp) dataout_b = 'b0;
     if ((power_up_uninitialized == "false") && ~ram_type)
         for (i = 0; i < num_rows; i = i + 1) mem[i] = 'b0;
    if ((init_file_layout == "port_a") || (init_file_layout == "port_b"))
    begin
       mem_init = {mem_init1,mem_init0};
        addr_range_init  = (primary_port_is_a) ?
                        port_a_last_address - port_a_first_address + 1 :
                        port_b_last_address - port_b_first_address + 1 ;
        for (j = 0; j < addr_range_init; j = j + 1)
        begin
            for (k = 0; k < data_width; k = k + 1)
                init_mem_word[k] = mem_init[j*data_width + k];
            mem[j] = init_mem_word;
        end
    end
    dual_write = 'b0;
end
assign clk_a_in      = clk0_int;
assign clk_a_byteena = (port_a_byte_enable_clock == "none") ? 1'b0 : clk_a_in;
assign clk_a_out     = (port_a_data_out_clock == "none")    ? 1'b0 : (
                       (port_a_data_out_clock == "clock0")  ? clk0_int : clk1_int);
assign clk_b_in      = (port_b_read_enable_write_enable_clock == "clock0") ? clk0_int : clk1_int;
assign clk_b_byteena = (port_b_byte_enable_clock == "none")   ? 1'b0 : (
                       (port_b_byte_enable_clock == "clock0") ? clk0_int : clk1_int);
assign clk_b_out     = (port_b_data_out_clock == "none")      ? 1'b0 : (
                       (port_b_data_out_clock == "clock0")    ? clk0_int : clk1_int);
assign addr_a_clr_in = (port_a_address_clear == "none")   ? 1'b0 : clr0_int;
assign addr_b_clr_in = (port_b_address_clear == "none")   ? 1'b0 : (
                       (port_b_address_clear == "clear0") ? clr0_int : clr1_int);
assign datain_a_clr_in  = (port_a_data_in_clear == "none")    ? 1'b0 : clr0_int;
assign dataout_a_clr    = (port_a_data_out_clear == "none")   ? 1'b0 : (
                          (port_a_data_out_clear == "clear0") ? clr0_int : clr1_int);
assign datain_b_clr_in  = (port_b_data_in_clear == "none")    ? 1'b0 : (
                         (port_b_data_in_clear == "clear0")  ? clr0_int : clr1_int);
assign dataout_b_clr    = (port_b_data_out_clear == "none")   ? 1'b0 : (
                          (port_b_data_out_clear == "clear0") ? clr0_int : clr1_int);
assign byteena_a_clr_in = (port_a_byte_enable_clear == "none")   ? 1'b0 : clr0_int;
assign byteena_b_clr_in = (port_b_byte_enable_clear == "none")   ? 1'b0 : (
                         (port_b_byte_enable_clear == "clear0") ? clr0_int : clr1_int);
assign we_a_clr_in      = (port_a_write_enable_clear == "none") ? 1'b0 : clr0_int;
assign rewe_b_clr_in    = (port_b_read_enable_write_enable_clear == "none")   ? 1'b0 : (
                          (port_b_read_enable_write_enable_clear == "clear0") ? clr0_int : clr1_int);
     assign active_a_in = ena0_int || (port_a_disable_ce_on_input_registers == "on");
     assign active_b_in = ((port_b_read_enable_write_enable_clock == "clock0") ? ena0_int : ena1_int) ||
                           (port_b_disable_ce_on_input_registers == "on");
// Store clock enable value for SEAB/MEAB
// port A active
hardcopyii_ram_register active_port_a (
        .d(active_a_in),
        .clk(clk_a_in),
        .aclr(1'b0),
        .devclrn(1'b1),
        .devpor(1'b1),
.stall(1'b0),
        .ena(1'b1),
        .q(active_a),.aclrout()
);
defparam active_port_a.width = 1;
assign active_write_a = active_a && (byteena_a_reg !== 'b0);
// port B active
hardcopyii_ram_register active_port_b (
        .d(active_b_in),
        .clk(clk_b_in),
        .aclr(1'b0),
        .devclrn(1'b1),
        .devpor(1'b1),
.stall(1'b0),
        .ena(1'b1),
        .q(active_b),.aclrout()
);
defparam active_port_b.width = 1;
assign active_write_b = active_b && (byteena_b_reg !== 'b0);
// write enable
hardcopyii_ram_register we_a_register (
        .d(mode_is_rom ? 1'b0 : portawe_int),
       .clk(clk_a_in),
        .aclr(we_a_clr_in),
        .devclrn(devclrn),
        .devpor(devpor),
        .stall(1'b0),
       .ena(active_a_in),
        .q(we_a_reg),
        .aclrout(we_a_clr)
        );
defparam we_a_register.width = 1;
// address
hardcopyii_ram_register addr_a_register (
        .d(portaaddr_int),
        .clk(clk_a_in),
        .aclr(addr_a_clr_in),
        .devclrn(devclrn),.devpor(devpor),
        .stall(portaaddrstall_int),
        .ena(active_a_in),
        .q(addr_a_reg),
        .aclrout(addr_a_clr)
        );
defparam addr_a_register.width = port_a_address_width;
// data
hardcopyii_ram_register datain_a_register (
        .d(portadatain_int),
        .clk(clk_a_in),
        .aclr(datain_a_clr_in),
        .devclrn(devclrn),
        .devpor(devpor),
        .stall(1'b0),
        .ena(active_a_in),
        .q(datain_a_reg),
        .aclrout(datain_a_clr)
        );
defparam datain_a_register.width = port_a_data_width;
// byte enable
hardcopyii_ram_register byteena_a_register (
        .d(portabyteenamasks_int),
        .clk(clk_a_byteena),
        .aclr(byteena_a_clr_in),
        .stall(1'b0),
        .devclrn(devclrn),
        .devpor(devpor),
        .ena(active_a_in),
        .q(byteena_a_reg),
        .aclrout(byteena_a_clr)
        );
defparam byteena_a_register.width = port_a_byte_enable_mask_width;
defparam byteena_a_register.preset = 1'b1;
// read/write enable
hardcopyii_ram_register rewe_b_register (
        .d(portbrewe_int),
        .clk(clk_b_in),
        .aclr(rewe_b_clr_in),
 .stall(1'b0),
        .devclrn(devclrn),
        .devpor(devpor),
        .ena(active_b_in),
        .q(rewe_b_reg),
        .aclrout(rewe_b_clr)
        );
defparam rewe_b_register.width = 1;
defparam rewe_b_register.preset = mode_is_dp;
// address
hardcopyii_ram_register addr_b_register (
        .d(portbaddr_int),
        .clk(clk_b_in),
        .aclr(addr_b_clr_in),
        .devclrn(devclrn),
        .devpor(devpor),
        .stall(portbaddrstall_int),
        .ena(active_b_in),
        .q(addr_b_reg),
        .aclrout(addr_b_clr)
        );
defparam addr_b_register.width = port_b_address_width;
// data
hardcopyii_ram_register datain_b_register (
        .d(portbdatain_int),
        .clk(clk_b_in),
        .aclr(datain_b_clr_in),
        .devclrn(devclrn),
        .devpor(devpor),
        .stall(1'b0),
        .ena(active_b_in),
        .q(datain_b_reg),
        .aclrout(datain_b_clr)
        );
defparam datain_b_register.width = port_b_data_width;
// byte enable
hardcopyii_ram_register byteena_b_register (
        .d(portbbyteenamasks_int),
        .clk(clk_b_byteena),
        .aclr(byteena_b_clr_in),
        .stall(1'b0),
        .devclrn(devclrn),
        .devpor(devpor),
        .ena(active_b_in),
        .q(byteena_b_reg),
        .aclrout(byteena_b_clr)
        );
defparam byteena_b_register.width  = port_b_byte_enable_mask_width;
defparam byteena_b_register.preset = 1'b1;
assign datain_prime_reg = (primary_port_is_a) ? datain_a_reg : datain_b_reg;
assign addr_prime_reg   = (primary_port_is_a) ? addr_a_reg   : addr_b_reg;
assign datain_sec_reg   = (primary_port_is_a) ? datain_b_reg : datain_a_reg;
assign addr_sec_reg     = (primary_port_is_a) ? addr_b_reg   : addr_a_reg;
assign mask_vector_prime     = (primary_port_is_a) ? mask_vector_a     : mask_vector_b;
assign mask_vector_prime_int = (primary_port_is_a) ? mask_vector_a_int :  mask_vector_b_int;
assign mask_vector_sec       = (primary_port_is_a) ? mask_vector_b     : mask_vector_a;
assign mask_vector_sec_int   = (primary_port_is_a) ? mask_vector_b_int : mask_vector_a_int;
// Write pulse generation
hardcopyii_ram_pulse_generator wpgen_a (
       .clk(ram_type ? clk_a_in : ~clk_a_in),
  .ena(active_write_a & we_a_reg & ~m4k_write_error_port_b),
        .pulse(write_pulse_a),
        .cycle(write_cycle_a)
        );
hardcopyii_ram_pulse_generator wpgen_b (
       .clk(ram_type ? clk_b_in : ~clk_b_in),
 .ena(active_write_b & mode_is_bdp & rewe_b_reg & ~m4k_write_error_port_a),
        .pulse(write_pulse_b),
        .cycle(write_cycle_b)
        );
// Read pulse generation
hardcopyii_ram_pulse_generator rpgen_a (
        .clk(clk_a_in),
       .ena(active_a & ~we_a_reg),
        .pulse(read_pulse_a),
       .cycle()
        );
hardcopyii_ram_pulse_generator rpgen_b (
        .clk(clk_b_in),
       .ena(active_b & (mode_is_dp ? rewe_b_reg : ~rewe_b_reg)),
        .pulse(read_pulse_b),
       .cycle()
        );
assign write_pulse_prime = (primary_port_is_a) ? write_pulse_a : write_pulse_b;
assign read_pulse_prime  = (primary_port_is_a) ? read_pulse_a : read_pulse_b;
assign read_pulse_prime_feedthru = (primary_port_is_a) ? read_pulse_a_feedthru : read_pulse_b_feedthru;
assign write_pulse_sec = (primary_port_is_a) ? write_pulse_b : write_pulse_a;
assign read_pulse_sec  = (primary_port_is_a) ? read_pulse_b : read_pulse_a;
assign read_pulse_sec_feedthru = (primary_port_is_a) ? read_pulse_b_feedthru : read_pulse_a_feedthru;
// Create internal masks for byte enable processing
always @(byteena_a_reg)
begin
    for (i = 0; i < port_a_data_width; i = i + 1)
    begin
        mask_vector_a[i]     = (byteena_a_reg[i/byte_size_a] === 1'b1) ? 1'b0 : 1'bx;
        mask_vector_a_int[i] = (byteena_a_reg[i/byte_size_a] === 1'b0) ? 1'b0 : 1'bx;
    end
end
always @(byteena_b_reg)
begin
    for (l = 0; l < port_b_data_width; l = l + 1)
    begin
        mask_vector_b[l]     = (byteena_b_reg[l/byte_size_b] === 1'b1) ? 1'b0 : 1'bx;
        mask_vector_b_int[l] = (byteena_b_reg[l/byte_size_b] === 1'b0) ? 1'b0 : 1'bx;
    end
end
always @(posedge write_pulse_prime or posedge write_pulse_sec or
         posedge read_pulse_prime or posedge read_pulse_sec
        )
begin
    // Write stage 1 : write X to memory
    if (write_pulse_prime)
    begin
        old_mem_data = mem[addr_prime_reg];
        mem_data = mem[addr_prime_reg] ^ mask_vector_prime_int;
        mem[addr_prime_reg] = mem_data;
    end
    if (write_pulse_sec)
    begin
        row_sec = addr_sec_reg / num_cols; col_sec = (addr_sec_reg % num_cols) * data_unit_width;
        mem_unit_data = mem[row_sec];
        for (j = col_sec; j <= col_sec + data_unit_width - 1; j = j + 1)
            mem_unit_data[j] = mem_unit_data[j] ^ mask_vector_sec_int[j - col_sec];
        mem[row_sec] = mem_unit_data;
    end
    if ((addr_prime_reg == row_sec) && write_pulse_prime && write_pulse_sec) dual_write = 2'b11;
    // Read stage 1 : read data from memory
    if (read_pulse_prime)
       read_data_latch = mem[addr_prime_reg];
    if (read_pulse_sec)
    begin
        row_sec = addr_sec_reg / num_cols; col_sec = (addr_sec_reg % num_cols) * data_unit_width;
        if ((row_sec == addr_prime_reg) && (write_pulse_prime))
            mem_unit_data = old_mem_data;
        else
            mem_unit_data = mem[row_sec];
        for (j = col_sec; j <= col_sec + data_unit_width - 1; j = j + 1)
            read_unit_data_latch[j - col_sec] = mem_unit_data[j];
    end
end
// Simultaneous write to same/overlapping location by both ports
always @(dual_write)
begin
    if (dual_write == 2'b11)
    begin
           for (i = 0; i < data_unit_width; i = i + 1)
               mask_vector_common_int[i] = mask_vector_prime_int[col_sec + i] &
                                           mask_vector_sec_int[i];
    end
    else if (dual_write == 2'b01) mem_unit_data = mem[row_sec];
    else if (dual_write == 'b0)
    begin
       mem_data = mem[addr_prime_reg];
       for (i = 0; i < data_unit_width; i = i + 1)
               mem_data[col_sec + i] = mem_data[col_sec + i] ^ mask_vector_common_int[i];
       mem[addr_prime_reg] = mem_data;
    end
end
// Write stage 2 : Write actual data to memory
always @(negedge write_pulse_prime)
begin
    if (clear_asserted_during_write[`PRIME] !== 1'b1)
    begin
        for (i = 0; i < data_width; i = i + 1)
            if (mask_vector_prime[i] == 1'b0)
                mem_data[i] = datain_prime_reg[i];
        mem[addr_prime_reg] = mem_data;
    end
    dual_write[`PRIME] = 1'b0;
end
always @(negedge write_pulse_sec)
begin
    if (clear_asserted_during_write[`SEC] !== 1'b1)
    begin
        for (i = 0; i < data_unit_width; i = i + 1)
            if (mask_vector_sec[i] == 1'b0)
                mem_unit_data[col_sec + i] = datain_sec_reg[i];
        mem[row_sec] = mem_unit_data;
    end
    dual_write[`SEC] = 1'b0;
end
// Read stage 2 : Send data to output
always @(negedge read_pulse_prime)
begin
    if (primary_port_is_a)
        dataout_a = read_data_latch;
    else
        dataout_b = read_data_latch;
end
always @(negedge read_pulse_sec)
begin
    if (primary_port_is_b)
        dataout_a = read_unit_data_latch;
    else
        dataout_b = read_unit_data_latch;
end
// Same port feed through
hardcopyii_ram_pulse_generator ftpgen_a (
        .clk(clk_a_in),
       .ena(active_a & ~mode_is_dp & we_a_reg),
        .pulse(read_pulse_a_feedthru),.cycle()
        );
hardcopyii_ram_pulse_generator ftpgen_b (
        .clk(clk_b_in),
       .ena(active_b & mode_is_bdp & rewe_b_reg),
        .pulse(read_pulse_b_feedthru),.cycle()
        );
always @(negedge read_pulse_prime_feedthru)
begin
    if (primary_port_is_a)
       dataout_a = datain_prime_reg ^ mask_vector_prime;
    else
       dataout_b = datain_prime_reg ^ mask_vector_prime;
end
always @(negedge read_pulse_sec_feedthru)
begin
    if (primary_port_is_b)
      dataout_a = datain_sec_reg ^ mask_vector_sec;
    else
       dataout_b = datain_sec_reg ^ mask_vector_sec;
end
// Input register clears
always @(posedge addr_a_clr or posedge datain_a_clr or posedge we_a_clr)
    clear_asserted_during_write_a = write_pulse_a;
assign active_write_clear_a = active_write_a & write_cycle_a;
always @(posedge addr_a_clr)
begin
    if (active_write_clear_a & we_a_reg)
        mem_invalidate = 1'b1;
   else if (active_a & ~we_a_reg)
    begin
        if (primary_port_is_a)
        begin
            read_data_latch = 'bx;
        end
        else
        begin
            read_unit_data_latch = 'bx;
        end
        dataout_a = 'bx;
    end
end
always @(posedge datain_a_clr or posedge we_a_clr)
begin
    if (active_write_clear_a & we_a_reg)
    begin
        if (primary_port_is_a)
            mem[addr_prime_reg] = 'bx;
        else
        begin
            mem_unit_data = mem[row_sec];
            for (j = col_sec; j <= col_sec + data_unit_width - 1; j = j + 1)
                mem_unit_data[j] = 1'bx;
            mem[row_sec] = mem_unit_data;
        end
        if (primary_port_is_a)
        begin
            read_data_latch = 'bx;
        end
        else
        begin
            read_unit_data_latch = 'bx;
        end
    end
end
assign active_write_clear_b = active_write_b & write_cycle_b;
always @(posedge addr_b_clr or posedge datain_b_clr or
        posedge rewe_b_clr)
    clear_asserted_during_write_b = write_pulse_b;
always @(posedge addr_b_clr)
begin
   if (mode_is_bdp & active_write_clear_b & rewe_b_reg)
        mem_invalidate = 1'b1;
   else if (active_b & (mode_is_dp & rewe_b_reg || mode_is_bdp & ~rewe_b_reg))
    begin
        if (primary_port_is_b)
        begin
            read_data_latch = 'bx;
        end
        else
        begin
            read_unit_data_latch = 'bx;
        end
        dataout_b = 'bx;
    end
end
always @(posedge datain_b_clr or posedge rewe_b_clr)
begin
   if (mode_is_bdp & active_write_clear_b & rewe_b_reg)
    begin
        if (primary_port_is_b)
            mem[addr_prime_reg] = 'bx;
        else
        begin
            mem_unit_data = mem[row_sec];
            for (j = col_sec; j <= col_sec + data_unit_width - 1; j = j + 1)
                 mem_unit_data[j] = 'bx;
            mem[row_sec] = mem_unit_data;
        end
        if (primary_port_is_b)
        begin
            read_data_latch = 'bx;
        end
        else
        begin
            read_unit_data_latch = 'bx;
        end
    end
end
assign clear_asserted_during_write[primary_port_is_a] = clear_asserted_during_write_a;
assign clear_asserted_during_write[primary_port_is_b] = clear_asserted_during_write_b;
always @(posedge mem_invalidate)
begin
    for (i = 0; i < num_rows; i = i + 1) mem[i] = 'bx;
    mem_invalidate = 1'b0;
end
   assign clkena_a_out = (port_a_data_out_clock == "clock0") ?
                          ena0_int || (port_a_disable_ce_on_output_registers == "on") :
                          ena1_int || (port_a_disable_ce_on_output_registers == "on") ;
hardcopyii_ram_register dataout_a_register (
        .d(dataout_a),
        .clk(clk_a_out),
        .aclr(dataout_a_clr),
        .devclrn(devclrn),
        .devpor(devpor),
        .stall(1'b0),
        .ena(clkena_a_out),
        .q(dataout_a_reg),.aclrout()
        );
defparam dataout_a_register.width = port_a_data_width;
assign portadataout = (out_a_is_reg) ? dataout_a_reg : dataout_a;
   assign clkena_b_out = (port_b_data_out_clock == "clock0") ?
                          ena0_int || (port_b_disable_ce_on_output_registers == "on") :
                          ena1_int || (port_b_disable_ce_on_output_registers == "on") ;
hardcopyii_ram_register dataout_b_register (
        .d( dataout_b ),
        .clk(clk_b_out),
        .aclr(dataout_b_clr),
        .devclrn(devclrn),.devpor(devpor),
        .stall(1'b0),
        .ena(clkena_b_out),
        .q(dataout_b_reg),.aclrout()
        );
defparam dataout_b_register.width = port_b_data_width;
assign portbdataout = (out_b_is_reg) ? dataout_b_reg : dataout_b;
endmodule