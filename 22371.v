module definition
	altsyncram	altsyncram_component
    (
				.wren_a (write_valid),
				.clock0 (ctl_clk),
				.address_a (write_address),
				.address_b (read_address),
				.data_a (write_data),
				.q_b (read_data),
				.aclr0 (1'b0),
				.aclr1 (1'b0),
				.addressstall_a (1'b0),
				.addressstall_b (1'b0),
				.byteena_a (1'b1),
				.byteena_b (1'b1),
				.clock1 (1'b1),
				.clocken0 (1'b1),
				.clocken1 (1'b1),
				.clocken2 (1'b1),
				.clocken3 (1'b1),
				.data_b ({DATA_WIDTH{1'b1}}),
				.eccstatus (),
				.q_a (),
				.rden_a (1'b1),
				.rden_b (1'b1),
				.wren_b (1'b0)
    );
	defparam
		altsyncram_component.address_aclr_a = "NONE",
		altsyncram_component.address_aclr_b = "NONE",
		altsyncram_component.address_reg_b = "CLOCK0",
		altsyncram_component.indata_aclr_a = "NONE",
		altsyncram_component.intended_device_family = "Stratix",
		altsyncram_component.lpm_type = "altsyncram",
		altsyncram_component.numwords_a = BUFFER_DEPTH,
		altsyncram_component.numwords_b = BUFFER_DEPTH,
		altsyncram_component.operation_mode = "DUAL_PORT",
		altsyncram_component.outdata_aclr_b = "NONE",
		altsyncram_component.outdata_reg_b = BUFFER_REGISTER_OUTPUT,
		altsyncram_component.power_up_uninitialized = "FALSE",
		altsyncram_component.read_during_write_mode_mixed_ports = "DONT_CARE",
		altsyncram_component.widthad_a = ADDR_WIDTH,
		altsyncram_component.widthad_b = ADDR_WIDTH,
		altsyncram_component.width_a = DATA_WIDTH,
		altsyncram_component.width_b = DATA_WIDTH,
		altsyncram_component.width_byteena_a = 1,
		altsyncram_component.wrcontrol_aclr_a = "NONE";
    // alt_ddrx_ram_2port
    // ram_inst
    // (
    //     .clock      (ctl_clk),
    //     .wren       (write_valid),
    //     .wraddress  (write_address),
    //     .data       (write_data),
    //     .rdaddress  (read_address),
    //     .q          (read_data)
    // );
    function integer two_pow_N;
        input integer value;
    begin
        two_pow_N = 2 << (value-1);
    end
    endfunction
endmodule