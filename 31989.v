module tiny(clk, reset, sel, addr, w, data, out, done);
    input clk, reset;
    input sel;
    input [5:0] addr;
    input w;
    input [`WIDTH_D0:0] data;
    output [`WIDTH_D0:0] out;
    output done;
    /* for FSM */
    wire [5:0] fsm_addr;
    /* for RAM */
    wire [5:0] ram_a_addr, ram_b_addr;
    wire [`WIDTH_D0:0] ram_b_data_in;
    wire ram_a_w, ram_b_w;
    wire [`WIDTH_D0:0] ram_a_data_out, ram_b_data_out;
    /* for const */
    wire [`WIDTH_D0:0] const0_out, const1_out;
    wire const0_effective, const1_effective;
    /* for muxer */
    wire [`WIDTH_D0:0] muxer0_out, muxer1_out;
    /* for ROM */
    wire [8:0] rom_addr;
    wire [27:0] rom_q;
    /* for PE */
    wire [10:0] pe_ctrl;
    assign out = ram_a_data_out;
    select
        select0 (sel, addr, fsm_addr, w, ram_a_addr, ram_a_w);
    rom
        rom0 (clk, rom_addr, rom_q);
    FSM
        fsm0 (clk, reset, rom_addr, rom_q, fsm_addr, ram_b_addr, ram_b_w, pe_ctrl, done);
    const_
        const0 (clk, ram_a_addr, const0_out, const0_effective),
        const1 (clk, ram_b_addr, const1_out, const1_effective);
    ram
        ram0 (clk, ram_a_w, ram_a_addr, data, ram_a_data_out, ram_b_w, ram_b_addr[5:0], ram_b_data_in, ram_b_data_out);
    muxer
        muxer0 (ram_a_data_out, const0_out, const0_effective, muxer0_out),
        muxer1 (ram_b_data_out, const1_out, const1_effective, muxer1_out);
    PE
        pe0 (clk, reset, pe_ctrl, muxer1_out, muxer0_out[`WIDTH:0], muxer0_out[`WIDTH:0], ram_b_data_in[`WIDTH:0]);
    assign ram_b_data_in[`WIDTH_D0:`WIDTH+1] = 0;
endmodule