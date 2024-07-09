module arriaiigz_ram_block
    (
     portadatain,
     portaaddr,
     portawe,
     portare,
     portbdatain,
     portbaddr,
     portbwe,
     portbre,
     clk0, clk1,
     ena0, ena1,
     ena2, ena3,
     clr0, clr1,
     portabyteenamasks,
     portbbyteenamasks,
     portaaddrstall,
     portbaddrstall,
     devclrn,
     devpor,
      eccstatus,
     portadataout,
     portbdataout
      ,dftout
     );
parameter operation_mode = "single_port";
parameter mixed_port_feed_through_mode = "dont_care";
parameter ram_block_type = "auto";
parameter logical_ram_name = "ram_name";
parameter init_file = "init_file.hex";
parameter init_file_layout = "none";
 parameter enable_ecc = "false";
 parameter width_eccstatus = 3;
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
parameter port_b_address_clear = "none";
parameter port_b_data_out_clear = "none";
parameter port_b_data_in_clock = "clock1";
parameter port_b_address_clock = "clock1";
parameter port_b_write_enable_clock = "clock1";
parameter port_b_read_enable_clock  = "clock1";
parameter port_b_byte_enable_clock = "clock1";
parameter port_b_data_out_clock = "none";
parameter port_b_data_width = 1;
parameter port_b_address_width = 1;
parameter port_b_byte_enable_mask_width = 1;
parameter port_a_read_during_write_mode = "new_data_no_nbe_read";
parameter port_b_read_during_write_mode = "new_data_no_nbe_read";
parameter power_up_uninitialized = "false";
parameter lpm_type = "arriaiigz_ram_block";
parameter lpm_hint = "true";
parameter connectivity_checking = "off";
 parameter mem_init0 = 2048'b0;
 parameter mem_init1 = 2048'b0;
 parameter mem_init2 = 2048'b0;
 parameter mem_init3 = 2048'b0;
 parameter mem_init4 = 2048'b0;
 parameter mem_init5 = 2048'b0;
 parameter mem_init6 = 2048'b0;
 parameter mem_init7 = 2048'b0;
 parameter mem_init8 = 2048'b0;
 parameter mem_init9 = 2048'b0;
 parameter mem_init10 = 2048'b0;
 parameter mem_init11 = 2048'b0;
 parameter mem_init12 = 2048'b0;
 parameter mem_init13 = 2048'b0;
 parameter mem_init14 = 2048'b0;
 parameter mem_init15 = 2048'b0;
 parameter mem_init16 = 2048'b0;
 parameter mem_init17 = 2048'b0;
 parameter mem_init18 = 2048'b0;
 parameter mem_init19 = 2048'b0;
 parameter mem_init20 = 2048'b0;
 parameter mem_init21 = 2048'b0;
 parameter mem_init22 = 2048'b0;
 parameter mem_init23 = 2048'b0;
 parameter mem_init24 = 2048'b0;
 parameter mem_init25 = 2048'b0;
 parameter mem_init26 = 2048'b0;
 parameter mem_init27 = 2048'b0;
 parameter mem_init28 = 2048'b0;
 parameter mem_init29 = 2048'b0;
 parameter mem_init30 = 2048'b0;
 parameter mem_init31 = 2048'b0;
 parameter mem_init32 = 2048'b0;
 parameter mem_init33 = 2048'b0;
 parameter mem_init34 = 2048'b0;
 parameter mem_init35 = 2048'b0;
 parameter mem_init36 = 2048'b0;
 parameter mem_init37 = 2048'b0;
 parameter mem_init38 = 2048'b0;
 parameter mem_init39 = 2048'b0;
 parameter mem_init40 = 2048'b0;
 parameter mem_init41 = 2048'b0;
 parameter mem_init42 = 2048'b0;
 parameter mem_init43 = 2048'b0;
 parameter mem_init44 = 2048'b0;
 parameter mem_init45 = 2048'b0;
 parameter mem_init46 = 2048'b0;
 parameter mem_init47 = 2048'b0;
 parameter mem_init48 = 2048'b0;
 parameter mem_init49 = 2048'b0;
 parameter mem_init50 = 2048'b0;
 parameter mem_init51 = 2048'b0;
 parameter mem_init52 = 2048'b0;
 parameter mem_init53 = 2048'b0;
 parameter mem_init54 = 2048'b0;
 parameter mem_init55 = 2048'b0;
 parameter mem_init56 = 2048'b0;
 parameter mem_init57 = 2048'b0;
 parameter mem_init58 = 2048'b0;
 parameter mem_init59 = 2048'b0;
 parameter mem_init60 = 2048'b0;
 parameter mem_init61 = 2048'b0;
 parameter mem_init62 = 2048'b0;
 parameter mem_init63 = 2048'b0;
 parameter mem_init64 = 2048'b0;
 parameter mem_init65 = 2048'b0;
 parameter mem_init66 = 2048'b0;
 parameter mem_init67 = 2048'b0;
 parameter mem_init68 = 2048'b0;
 parameter mem_init69 = 2048'b0;
 parameter mem_init70 = 2048'b0;
 parameter mem_init71 = 2048'b0;
parameter port_a_byte_size = 0;
parameter port_b_byte_size = 0;
parameter clk0_input_clock_enable  = "none"; // ena0,ena2,none
parameter clk0_core_clock_enable   = "none"; // ena0,ena2,none
parameter clk0_output_clock_enable = "none"; // ena0,none
parameter clk1_input_clock_enable  = "none"; // ena1,ena3,none
parameter clk1_core_clock_enable   = "none"; // ena1,ena3,none
parameter clk1_output_clock_enable = "none"; // ena1,none
// SIMULATION_ONLY_PARAMETERS_BEGIN
parameter port_a_address_clear = "none";
parameter port_a_data_in_clock = "clock0";
parameter port_a_address_clock = "clock0";
parameter port_a_write_enable_clock = "clock0";
parameter port_a_byte_enable_clock = "clock0";
parameter port_a_read_enable_clock = "clock0";
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
// Hardware write modes
parameter dual_clock = ((operation_mode == "dual_port")  ||
                        (operation_mode == "bidir_dual_port")) &&
                        (port_b_address_clock == "clock1");
parameter both_new_data_same_port = (
                                      ((port_a_read_during_write_mode == "new_data_no_nbe_read") ||
                                       (port_a_read_during_write_mode == "dont_care")) &&
                                      ((port_b_read_during_write_mode == "new_data_no_nbe_read") ||
                                       (port_b_read_during_write_mode == "dont_care"))
                                    ) ? 1'b1 : 1'b0;
parameter hw_write_mode_a = (
                                ((port_a_read_during_write_mode == "old_data") ||
                                 (port_a_read_during_write_mode == "new_data_with_nbe_read"))
                            ) ? "R+W" : (
                                            dual_clock || (
                                               mixed_port_feed_through_mode == "dont_care" &&
                                               both_new_data_same_port
                                            ) ? "FW" : "DW"
                                        );
parameter hw_write_mode_b = (
                                ((port_b_read_during_write_mode == "old_data") ||
                                 (port_b_read_during_write_mode == "new_data_with_nbe_read"))
                            ) ? "R+W" : (
                                            dual_clock || (
                                               mixed_port_feed_through_mode == "dont_care" &&
                                               both_new_data_same_port
                                            ) ? "FW" : "DW"
                                        );
 parameter delay_write_pulse_a = (mode_is_dp && mixed_port_feed_through_mode == "dont_care") ? 1'b0 : ((hw_write_mode_a != "FW") ? 1'b1 : 1'b0);
parameter delay_write_pulse_b = (hw_write_mode_b != "FW") ? 1'b1 : 1'b0;
parameter be_mask_write_a     = (port_a_read_during_write_mode == "new_data_with_nbe_read") ? 1'b1 : 1'b0;
parameter be_mask_write_b     = (port_b_read_during_write_mode == "new_data_with_nbe_read") ? 1'b1 : 1'b0;
parameter old_data_write_a     = (port_a_read_during_write_mode == "old_data") ? 1'b1 : 1'b0;
parameter old_data_write_b     = (port_b_read_during_write_mode == "old_data") ? 1'b1 : 1'b0;
parameter read_before_write_a = (hw_write_mode_a == "R+W") ? 1'b1 : 1'b0;
parameter read_before_write_b = (hw_write_mode_b == "R+W") ? 1'b1 : 1'b0;
parameter clock_duty_cycle_dependence = "ON";
// LOCAL_PARAMETERS_END
input portawe;
input portare;
input [port_a_data_width - 1:0] portadatain;
input [port_a_address_width - 1:0] portaaddr;
input [port_a_byte_enable_mask_width - 1:0] portabyteenamasks;
input portbwe, portbre;
input [port_b_data_width - 1:0] portbdatain;
input [port_b_address_width - 1:0] portbaddr;
input [port_b_byte_enable_mask_width - 1:0] portbbyteenamasks;
input clr0,clr1;
input clk0,clk1;
input ena0,ena1;
input ena2,ena3;
input devclrn,devpor;
input portaaddrstall;
input portbaddrstall;
output [port_a_data_width - 1:0] portadataout;
output [port_b_data_width - 1:0] portbdataout;
 output [width_eccstatus - 1:0] eccstatus;
 output [8:0] dftout;
tri0 portawe_int;
assign portawe_int = portawe;
tri1 portare_int;
assign portare_int = portare;
tri0 [port_a_data_width - 1:0] portadatain_int;
assign portadatain_int = portadatain;
tri0 [port_a_address_width - 1:0] portaaddr_int;
assign portaaddr_int = portaaddr;
tri1 [port_a_byte_enable_mask_width - 1:0] portabyteenamasks_int;
assign portabyteenamasks_int = portabyteenamasks;
tri0 portbwe_int;
assign portbwe_int = portbwe;
tri1 portbre_int;
assign portbre_int = portbre;
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
tri1 ena2_int,ena3_int;
assign ena2_int = ena2;
assign ena3_int = ena3;
tri0 portaaddrstall_int;
assign portaaddrstall_int = portaaddrstall;
tri0 portbaddrstall_int;
assign portbaddrstall_int = portbaddrstall;
tri1 devclrn;
tri1 devpor;
// clock / clock enable
wire clk_a_in,clk_a_byteena,clk_a_out,clkena_a_out;
wire clk_a_rena, clk_a_wena;
wire clk_a_core;
wire clk_b_in,clk_b_byteena,clk_b_out,clkena_b_out;
wire clk_b_rena, clk_b_wena;
wire clk_b_core;
wire write_cycle_a,write_cycle_b;
// asynch clear
wire datain_a_clr,dataout_a_clr,datain_b_clr,dataout_b_clr;
wire dataout_a_clr_reg, dataout_b_clr_reg;
wire addr_a_clr,addr_b_clr;
wire byteena_a_clr,byteena_b_clr;
wire we_a_clr, re_a_clr, we_b_clr, re_b_clr;
wire datain_a_clr_in,datain_b_clr_in;
wire addr_a_clr_in,addr_b_clr_in;
wire byteena_a_clr_in,byteena_b_clr_in;
wire we_a_clr_in, re_a_clr_in, we_b_clr_in, re_b_clr_in;
reg  mem_invalidate;
wire [`PRIME:`SEC] clear_asserted_during_write;
reg  clear_asserted_during_write_a,clear_asserted_during_write_b;
// port A registers
wire we_a_reg;
wire re_a_reg;
wire [port_a_address_width - 1:0] addr_a_reg;
wire [port_a_data_width - 1:0] datain_a_reg, dataout_a_reg;
reg  [port_a_data_width - 1:0] dataout_a;
wire [port_a_byte_enable_mask_width - 1:0] byteena_a_reg;
reg  out_a_is_reg;
// port B registers
wire we_b_reg, re_b_reg;
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
wire rw_pulse_a, rw_pulse_b;
wire [address_unit_width - 1:0] addr_prime_reg; // registered address
wire [address_width - 1:0]      addr_sec_reg;
wire [data_width - 1:0]       datain_prime_reg; // registered data
wire [data_unit_width - 1:0]  datain_sec_reg;
// pulses for primary/secondary ports
wire write_pulse_prime,write_pulse_sec;
wire read_pulse_prime,read_pulse_sec;
wire read_pulse_prime_feedthru,read_pulse_sec_feedthru;
wire rw_pulse_prime, rw_pulse_sec;
reg read_pulse_prime_last_value, read_pulse_sec_last_value;
reg rw_pulse_prime_last_value, rw_pulse_sec_last_value;
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
wire  active_a_in, active_b_in;
wire active_a_core,active_a_core_in,active_b_core,active_b_core_in;
wire  active_write_a,active_write_b,active_write_clear_a,active_write_clear_b;
reg  mode_is_rom,mode_is_sp,mode_is_bdp; // ram mode
reg  ram_type;                               // ram type eg. MRAM
initial
begin
`ifdef QUARTUS_MEMORY_PLI
     $memory_connect(mem);
`endif
   ram_type = 0;
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
        mem_init = {
            mem_init71 , mem_init70 , mem_init69 , mem_init68 , mem_init67 ,
            mem_init66 , mem_init65 , mem_init64 , mem_init63 , mem_init62 ,
            mem_init61 , mem_init60 , mem_init59 , mem_init58 , mem_init57 ,
            mem_init56 , mem_init55 , mem_init54 , mem_init53 , mem_init52 ,
            mem_init51 , mem_init50 , mem_init49 , mem_init48 , mem_init47 ,
            mem_init46 , mem_init45 , mem_init44 , mem_init43 , mem_init42 ,
            mem_init41 , mem_init40 , mem_init39 , mem_init38 , mem_init37 ,
            mem_init36 , mem_init35 , mem_init34 , mem_init33 , mem_init32 ,
            mem_init31 , mem_init30 , mem_init29 , mem_init28 , mem_init27 ,
            mem_init26 , mem_init25 , mem_init24 , mem_init23 , mem_init22 ,
            mem_init21 , mem_init20 , mem_init19 , mem_init18 , mem_init17 ,
            mem_init16 , mem_init15 , mem_init14 , mem_init13 , mem_init12 ,
            mem_init11 , mem_init10 , mem_init9  , mem_init8  , mem_init7  ,
            mem_init6  , mem_init5  ,
            mem_init4  , mem_init3  , mem_init2  ,
            mem_init1  , mem_init0
        };
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
assign clk_a_wena = (port_a_write_enable_clock == "none") ? 1'b0 : clk_a_in;
assign clk_a_rena = (port_a_read_enable_clock  == "none") ? 1'b0 : clk_a_in;
assign clk_a_byteena = (port_a_byte_enable_clock == "none") ? 1'b0 : clk_a_in;
assign clk_a_out     = (port_a_data_out_clock == "none")    ? 1'b0 : (
                       (port_a_data_out_clock == "clock0")  ? clk0_int : clk1_int);
assign clk_b_in      = (port_b_address_clock == "clock0") ? clk0_int : clk1_int;
assign clk_b_byteena = (port_b_byte_enable_clock == "none")   ? 1'b0 : (
                       (port_b_byte_enable_clock == "clock0") ? clk0_int : clk1_int);
assign clk_b_wena = (port_b_write_enable_clock == "none")   ? 1'b0 : (
                    (port_b_write_enable_clock == "clock0") ? clk0_int : clk1_int);
assign clk_b_rena = (port_b_read_enable_clock  == "none")   ? 1'b0 : (
                    (port_b_read_enable_clock  == "clock0") ? clk0_int : clk1_int);
assign clk_b_out     = (port_b_data_out_clock == "none")      ? 1'b0 : (
                       (port_b_data_out_clock == "clock0")    ? clk0_int : clk1_int);
assign addr_a_clr_in = (port_a_address_clear == "none")   ? 1'b0 : clr0_int;
assign addr_b_clr_in = (port_b_address_clear == "none")   ? 1'b0 : (
                       (port_b_address_clear == "clear0") ? clr0_int : clr1_int);
assign datain_a_clr_in = 1'b0;
 assign dataout_a_clr    = (port_a_data_out_clear == "none")   ? 1'b0 : (
                           (port_a_data_out_clear == "clear0") ? clr0_int : clr1_int);
assign datain_b_clr_in = 1'b0;
 assign dataout_b_clr    = (port_b_data_out_clear == "none")   ? 1'b0 : (
                           (port_b_data_out_clear == "clear0") ? clr0_int : clr1_int);
assign byteena_a_clr_in = 1'b0;
assign byteena_b_clr_in = 1'b0;
assign we_a_clr_in = 1'b0;
assign re_a_clr_in = 1'b0;
assign we_b_clr_in = 1'b0;
assign re_b_clr_in = 1'b0;
assign active_a_in = (clk0_input_clock_enable == "none") ? 1'b1 : (
                     (clk0_input_clock_enable == "ena0") ? ena0_int : ena2_int
                     );
assign active_a_core_in = (clk0_core_clock_enable == "none") ? 1'b1 : (
                          (clk0_core_clock_enable == "ena0") ? ena0_int : ena2_int
                          );
assign active_b_in = (port_b_address_clock == "clock0")  ? (
                           (clk0_input_clock_enable == "none") ? 1'b1 : ((clk0_input_clock_enable == "ena0") ? ena0_int : ena2_int)
                     ) : (
                           (clk1_input_clock_enable == "none") ? 1'b1 : ((clk1_input_clock_enable == "ena1") ? ena1_int : ena3_int)
                     );
assign active_b_core_in = (port_b_address_clock == "clock0")  ?  (
                              (clk0_core_clock_enable == "none") ? 1'b1 : ((clk0_core_clock_enable == "ena0") ? ena0_int : ena2_int)
                              ) : (
                                  (clk1_core_clock_enable == "none") ? 1'b1 : ((clk1_core_clock_enable == "ena1") ? ena1_int : ena3_int)
                              );
assign active_write_a = (byteena_a_reg !== 'b0);
assign active_write_b = (byteena_b_reg !== 'b0);
// Store core clock enable value for delayed write
// port A core active
arriaiigz_ram_register active_core_port_a (
       .d(active_a_core_in),
       .clk(clk_a_in),
       .aclr(1'b0),
       .devclrn(1'b1),
       .devpor(1'b1),
       .stall(1'b0),
       .ena(1'b1),
       .q(active_a_core),.aclrout()
);
defparam active_core_port_a.width = 1;
// port B core active
arriaiigz_ram_register active_core_port_b (
       .d(active_b_core_in),
       .clk(clk_b_in),
       .aclr(1'b0),
       .devclrn(1'b1),
       .devpor(1'b1),
       .stall(1'b0),
       .ena(1'b1),
       .q(active_b_core),.aclrout()
);
defparam active_core_port_b.width = 1;
// write enable
arriaiigz_ram_register we_a_register (
        .d(mode_is_rom ? 1'b0 : portawe_int),
        .clk(clk_a_wena),
        .aclr(we_a_clr_in),
        .devclrn(devclrn),
        .devpor(devpor),
        .stall(1'b0),
 .ena(active_a_core_in),
        .q(we_a_reg),
        .aclrout(we_a_clr)
        );
defparam we_a_register.width = 1;
// read enable
arriaiigz_ram_register re_a_register (
        .d(portare_int),
        .clk(clk_a_rena),
        .aclr(re_a_clr_in),
        .devclrn(devclrn),
        .devpor(devpor),
        .stall(1'b0),
         .ena(active_a_core_in),
        .q(re_a_reg),
        .aclrout(re_a_clr)
        );
// address
arriaiigz_ram_register addr_a_register (
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
arriaiigz_ram_register datain_a_register (
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
arriaiigz_ram_register byteena_a_register (
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
// write enable
arriaiigz_ram_register we_b_register (
        .d(portbwe_int),
        .clk(clk_b_wena),
        .aclr(we_b_clr_in),
        .stall(1'b0),
        .devclrn(devclrn),
        .devpor(devpor),
         .ena(active_b_core_in),
        .q(we_b_reg),
        .aclrout(we_b_clr)
        );
defparam we_b_register.width = 1;
defparam we_b_register.preset = 1'b0;
// read enable
arriaiigz_ram_register re_b_register (
        .d(portbre_int),
        .clk(clk_b_rena),
        .aclr(re_b_clr_in),
        .stall(1'b0),
        .devclrn(devclrn),
        .devpor(devpor),
         .ena(active_b_core_in),
        .q(re_b_reg),
        .aclrout(re_b_clr)
        );
defparam re_b_register.width = 1;
defparam re_b_register.preset = 1'b0;
// address
arriaiigz_ram_register addr_b_register (
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
arriaiigz_ram_register datain_b_register (
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
arriaiigz_ram_register byteena_b_register (
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
// Hardware Write Modes
// ARRIAIIGZ
// Write pulse generation
arriaiigz_ram_pulse_generator wpgen_a (
       .clk(clk_a_in),
       .ena(active_a_core & active_write_a & we_a_reg),
        .pulse(write_pulse_a),
        .cycle(write_cycle_a)
        );
defparam wpgen_a.delay_pulse = delay_write_pulse_a;
arriaiigz_ram_pulse_generator wpgen_b (
       .clk(clk_b_in),
       .ena(active_b_core & active_write_b & mode_is_bdp & we_b_reg),
        .pulse(write_pulse_b),
        .cycle(write_cycle_b)
        );
defparam wpgen_b.delay_pulse = delay_write_pulse_b;
// Read pulse generation
arriaiigz_ram_pulse_generator rpgen_a (
        .clk(clk_a_in),
        .ena(active_a_core & re_a_reg & ~we_a_reg),
        .pulse(read_pulse_a),
       .cycle(clk_a_core)
        );
arriaiigz_ram_pulse_generator rpgen_b (
        .clk(clk_b_in),
        .ena((mode_is_dp | mode_is_bdp) & active_b_core & re_b_reg & ~we_b_reg),
        .pulse(read_pulse_b),
       .cycle(clk_b_core)
        );
// Read during write pulse generation
arriaiigz_ram_pulse_generator rwpgen_a (
    .clk(clk_a_in),
     .ena(active_a_core & re_a_reg & we_a_reg & read_before_write_a),
    .pulse(rw_pulse_a),.cycle()
);
arriaiigz_ram_pulse_generator rwpgen_b (
    .clk(clk_b_in),
     .ena(active_b_core & mode_is_bdp & re_b_reg & we_b_reg & read_before_write_b),
    .pulse(rw_pulse_b),.cycle()
);
assign write_pulse_prime = (primary_port_is_a) ? write_pulse_a : write_pulse_b;
assign read_pulse_prime  = (primary_port_is_a) ? read_pulse_a : read_pulse_b;
assign read_pulse_prime_feedthru = (primary_port_is_a) ? read_pulse_a_feedthru : read_pulse_b_feedthru;
assign rw_pulse_prime = (primary_port_is_a) ? rw_pulse_a : rw_pulse_b;
assign write_pulse_sec = (primary_port_is_a) ? write_pulse_b : write_pulse_a;
assign read_pulse_sec  = (primary_port_is_a) ? read_pulse_b : read_pulse_a;
assign read_pulse_sec_feedthru = (primary_port_is_a) ? read_pulse_b_feedthru : read_pulse_a_feedthru;
assign rw_pulse_sec   = (primary_port_is_a) ? rw_pulse_b : rw_pulse_a;
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
         or posedge rw_pulse_prime or posedge rw_pulse_sec
        )
begin
    // Read before Write stage 1 : read data from memory
    if (rw_pulse_prime && (rw_pulse_prime !== rw_pulse_prime_last_value))
    begin
       read_data_latch = mem[addr_prime_reg];
       rw_pulse_prime_last_value = rw_pulse_prime;
    end
    if (rw_pulse_sec && (rw_pulse_sec !== rw_pulse_sec_last_value))
    begin
       row_sec = addr_sec_reg / num_cols; col_sec = (addr_sec_reg % num_cols) * data_unit_width;
       mem_unit_data = mem[row_sec];
       for (j = col_sec; j <= col_sec + data_unit_width - 1; j = j + 1)
           read_unit_data_latch[j - col_sec] = mem_unit_data[j];
       rw_pulse_sec_last_value = rw_pulse_sec;
    end
    // Write stage 1 : write X to memory
    if (write_pulse_prime)
    begin
        old_mem_data = mem[addr_prime_reg];
        mem_data = mem[addr_prime_reg] ^ mask_vector_prime_int;
        mem[addr_prime_reg] = mem_data;
	if ((row_sec == addr_prime_reg) && (read_pulse_sec))
	begin
	    mem_unit_data = (mixed_port_feed_through_mode == "dont_care") ? {data_width{1'bx}} : old_mem_data;
	    for (j = col_sec; j <= col_sec + data_unit_width - 1; j = j + 1)
                read_unit_data_latch[j - col_sec] = mem_unit_data[j];
	end
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
    if (read_pulse_prime && read_pulse_prime !== read_pulse_prime_last_value)
    begin
       read_data_latch = mem[addr_prime_reg];
       read_pulse_prime_last_value = read_pulse_prime;
    end
    if (read_pulse_sec && read_pulse_sec !== read_pulse_sec_last_value)
    begin
        row_sec = addr_sec_reg / num_cols; col_sec = (addr_sec_reg % num_cols) * data_unit_width;
        if ((row_sec == addr_prime_reg) && (write_pulse_prime))
	    mem_unit_data = (mixed_port_feed_through_mode == "dont_care") ? {data_width{1'bx}} : old_mem_data;
        else
            mem_unit_data = mem[row_sec];
        for (j = col_sec; j <= col_sec + data_unit_width - 1; j = j + 1)
            read_unit_data_latch[j - col_sec] = mem_unit_data[j];
        read_pulse_sec_last_value = read_pulse_sec;
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
always @(negedge read_pulse_prime) read_pulse_prime_last_value = 1'b0;
always @(negedge read_pulse_sec)   read_pulse_sec_last_value = 1'b0;
always @(negedge rw_pulse_prime)   rw_pulse_prime_last_value = 1'b0;
always @(negedge rw_pulse_sec)     rw_pulse_sec_last_value = 1'b0;
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
// Read during Write stage 2 : Send data to output
always @(negedge rw_pulse_prime)
begin
   if (primary_port_is_a)
   begin
       // BE mask write
       if (be_mask_write_a)
       begin
           for (i = 0; i < data_width; i = i + 1)
               if (mask_vector_prime[i] === 1'bx) // disabled byte
                   dataout_a[i] = read_data_latch[i];
       end
       else
           dataout_a = read_data_latch;
   end
   else
   begin
       // BE mask write
       if (be_mask_write_b)
       begin
           for (i = 0; i < data_width; i = i + 1)
               if (mask_vector_prime[i] === 1'bx) // disabled byte
                   dataout_b[i] = read_data_latch[i];
       end
       else
           dataout_b = read_data_latch;
   end
end
always @(negedge rw_pulse_sec)
begin
    if (primary_port_is_b)
    begin
        // BE mask write
        if (be_mask_write_a)
        begin
            for (i = 0; i < data_unit_width; i = i + 1)
                if (mask_vector_sec[i] === 1'bx) // disabled byte
                    dataout_a[i] = read_unit_data_latch[i];
        end
        else
            dataout_a = read_unit_data_latch;
    end
    else
    begin
        // BE mask write
        if (be_mask_write_b)
        begin
            for (i = 0; i < data_unit_width; i = i + 1)
                if (mask_vector_sec[i] === 1'bx) // disabled byte
                    dataout_b[i] = read_unit_data_latch[i];
        end
        else
            dataout_b = read_unit_data_latch;
    end
end
// Same port feed through
arriaiigz_ram_pulse_generator ftpgen_a (
        .clk(clk_a_in),
           .ena(active_a_core & ~mode_is_dp & ~old_data_write_a & we_a_reg & re_a_reg),
        .pulse(read_pulse_a_feedthru),.cycle()
        );
arriaiigz_ram_pulse_generator ftpgen_b (
        .clk(clk_b_in),
           .ena(active_b_core & mode_is_bdp & ~old_data_write_b & we_b_reg & re_b_reg),
        .pulse(read_pulse_b_feedthru),.cycle()
        );
always @(negedge read_pulse_prime_feedthru)
begin
    if (primary_port_is_a)
    begin
       if (be_mask_write_a)
       begin
          for (i = 0; i < data_width; i = i + 1)
              if (mask_vector_prime[i] == 1'b0) // enabled byte
                  dataout_a[i] = datain_prime_reg[i];
       end
       else
          dataout_a = datain_prime_reg ^ mask_vector_prime;
    end
    else
    begin
       if (be_mask_write_b)
       begin
          for (i = 0; i < data_width; i = i + 1)
              if (mask_vector_prime[i] == 1'b0) // enabled byte
                  dataout_b[i] = datain_prime_reg[i];
       end
       else
          dataout_b = datain_prime_reg ^ mask_vector_prime;
    end
end
always @(negedge read_pulse_sec_feedthru)
begin
    if (primary_port_is_b)
    begin
       if (be_mask_write_a)
       begin
          for (i = 0; i < data_unit_width; i = i + 1)
              if (mask_vector_sec[i] == 1'b0) // enabled byte
                  dataout_a[i] = datain_sec_reg[i];
       end
       else
          dataout_a = datain_sec_reg ^ mask_vector_sec;
    end
    else
    begin
       if (be_mask_write_b)
       begin
          for (i = 0; i < data_unit_width; i = i + 1)
              if (mask_vector_sec[i] == 1'b0) // enabled byte
                  dataout_b[i] = datain_sec_reg[i];
       end
       else
          dataout_b = datain_sec_reg ^ mask_vector_sec;
    end
end
// Input register clears
always @(posedge addr_a_clr or posedge datain_a_clr or posedge we_a_clr)
    clear_asserted_during_write_a = write_pulse_a;
assign active_write_clear_a = active_write_a & write_cycle_a;
always @(posedge addr_a_clr)
begin
    if (active_write_clear_a & we_a_reg)
        mem_invalidate = 1'b1;
 else if (active_a_core & re_a_reg)
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
        posedge we_b_clr)
    clear_asserted_during_write_b = write_pulse_b;
always @(posedge addr_b_clr)
begin
   if (mode_is_bdp & active_write_clear_b & we_b_reg)
        mem_invalidate = 1'b1;
  else if ((mode_is_dp | mode_is_bdp) & active_b_core & re_b_reg)
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
always @(posedge datain_b_clr or posedge we_b_clr)
begin
   if (mode_is_bdp & active_write_clear_b & we_b_reg)
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
 // port A
 arriaiigz_ram_register aclr__a__mux_register (
        .d(dataout_a_clr),
        .clk(clk_a_core),
        .aclr(1'b0),
        .devclrn(devclrn),
        .devpor(devpor),
        .stall(1'b0),
        .ena(1'b1),
        .q(dataout_a_clr_reg),.aclrout()
        );
 // port B
 arriaiigz_ram_register aclr__b__mux_register (
        .d(dataout_b_clr),
        .clk(clk_b_core),
        .aclr(1'b0),
        .devclrn(devclrn),
        .devpor(devpor),
        .stall(1'b0),
        .ena(1'b1),
        .q(dataout_b_clr_reg),.aclrout()
        );
assign clkena_a_out = (port_a_data_out_clock == "clock0") ?
                       ((clk0_output_clock_enable == "none") ? 1'b1 : ena0_int) :
                       ((clk1_output_clock_enable == "none") ? 1'b1 : ena1_int) ;
arriaiigz_ram_register dataout_a_register (
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
 reg [port_a_data_width - 1:0] portadataout_clr;
 reg [port_b_data_width - 1:0] portbdataout_clr;
 initial
 begin
     portadataout_clr = 'b0;
     portbdataout_clr = 'b0;
 end
 assign portadataout =  (out_a_is_reg) ? dataout_a_reg : (
                            (dataout_a_clr || dataout_a_clr_reg) ? portadataout_clr : dataout_a
                       );
assign clkena_b_out = (port_b_data_out_clock == "clock0") ?
                       ((clk0_output_clock_enable == "none") ? 1'b1 : ena0_int) :
                       ((clk1_output_clock_enable == "none") ? 1'b1 : ena1_int) ;
arriaiigz_ram_register dataout_b_register (
        .d( dataout_b ),
        .clk(clk_b_out),
 .aclr(dataout_b_clr),
        .devclrn(devclrn),.devpor(devpor),
        .stall(1'b0),
        .ena(clkena_b_out),
        .q(dataout_b_reg),.aclrout()
        );
defparam dataout_b_register.width = port_b_data_width;
 assign portbdataout = (out_b_is_reg) ? dataout_b_reg : (
                          (dataout_b_clr || dataout_b_clr_reg) ? portbdataout_clr : dataout_b
                      );
 assign eccstatus = {width_eccstatus{1'b0}};
endmodule