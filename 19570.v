module MISTRAL_MLAB(input [4:0] A1ADDR, input A1DATA, A1EN, CLK1, input [4:0] B1ADDR, output B1DATA);
parameter _TECHMAP_CELLNAME_ = "";
// Here we get to an unfortunate situation. The cell has a mem_init0 parameter,
// which takes in a hexadecimal string that could be used to initialise RAM.
// In the vendor simulation models, this appears to work fine, but Quartus,
// either intentionally or not, forgets about this parameter and initialises the
// RAM to zero.
// Because of this, RAM initialisation is presently disabled, but the source
// used to generate mem_init0 is kept (commented out) in case this gets fixed
// or an undocumented way to get Quartus to initialise from mem_init0 is found.
`MLAB #(
    .logical_ram_name(_TECHMAP_CELLNAME_),
    .logical_ram_depth(32),
    .logical_ram_width(1),
    .mixed_port_feed_through_mode("Dont Care"),
    .first_bit_number(0),
    .first_address(0),
    .last_address(31),
    .address_width(5),
    .data_width(1),
    .byte_enable_mask_width(1),
    .port_b_data_out_clock("NONE"),
    // .mem_init0($sformatf("%08x", INIT))
) _TECHMAP_REPLACE_ (
    .portaaddr(A1ADDR),
    .portadatain(A1DATA),
    .portbaddr(B1ADDR),
    .portbdataout(B1DATA),
    .ena0(A1EN),
    .clk0(CLK1)
);
endmodule