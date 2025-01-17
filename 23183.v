module nios_system_clocks (
	// Inputs
	CLOCK_50,
	CLOCK_27,
	reset,
	// Bidirectional
	// Outputs
	SDRAM_CLK,
	VGA_CLK,
	AUD_CLK,
	sys_clk,
	sys_reset_n
);
/*****************************************************************************
/*****************************************************************************
// Inputs
input						CLOCK_50;
input						CLOCK_27;
input						reset;
// Bidirectionals
// Outputs
output					SDRAM_CLK;
output					VGA_CLK;
output					AUD_CLK;
output					sys_clk;
output					sys_reset_n;
/*****************************************************************************
localparam SYS_CLK_MULT	= 1;
localparam SYS_CLK_DIV	= 1;
localparam AUD_CLK_MULT	= 14;
localparam AUD_CLK_DIV	= 31;
/*****************************************************************************
// Internal Wires
wire			[ 2: 0]	sys_mem_clks;
wire			[ 2: 0]	audio_clks;
wire						clk_locked;
wire						audio_clk_locked;
wire						video_in_clk;
// Internal Registers
// State Machine Registers
/*****************************************************************************
/*****************************************************************************
// Output Registers
// Internal Registers
/*****************************************************************************
assign sys_reset_n	= clk_locked;
assign sys_clk			= sys_mem_clks[0];
assign SDRAM_CLK		= sys_mem_clks[1];
assign VGA_CLK			= sys_mem_clks[2];
assign video_in_clk	= audio_clks[0];
assign AUD_CLK			= audio_clks[1];
/*****************************************************************************
altpll DE_Clock_Generator_System (
	// Inputs
	.inclk			({1'b0, CLOCK_50}),
	// Outputs
	.clk				(sys_mem_clks),
	.locked			(clk_locked),
	// Unused
	.activeclock	(),
	.areset			(1'b0),
	.clkbad			(),
	.clkena			({6{1'b1}}),
	.clkloss			(),
	.clkswitch		(1'b0),
	.enable0			(),
	.enable1			(),
	.extclk			(),
	.extclkena		({4{1'b1}}),
	.fbin				(1'b1),
	.pfdena			(1'b1),
	.pllena			(1'b1),
	.scanaclr		(1'b0),
	.scanclk			(1'b0),
	.scandata		(1'b0),
	.scandataout	(),
	.scandone		(),
	.scanread		(1'b0),
	.scanwrite		(1'b0),
	.sclkout0		(),
	.sclkout1		()
);
defparam
	DE_Clock_Generator_System.clk0_divide_by				= SYS_CLK_DIV,
	DE_Clock_Generator_System.clk0_duty_cycle				= 50,
	DE_Clock_Generator_System.clk0_multiply_by			= SYS_CLK_MULT,
	DE_Clock_Generator_System.clk0_phase_shift			= "0",
	DE_Clock_Generator_System.clk1_divide_by				= SYS_CLK_DIV,
	DE_Clock_Generator_System.clk1_duty_cycle				= 50,
	DE_Clock_Generator_System.clk1_multiply_by			= SYS_CLK_MULT,
	DE_Clock_Generator_System.clk1_phase_shift			= "-3000",
	DE_Clock_Generator_System.clk2_divide_by				= 2,
	DE_Clock_Generator_System.clk2_duty_cycle				= 50,
	DE_Clock_Generator_System.clk2_multiply_by			= 1,
	DE_Clock_Generator_System.clk2_phase_shift			= "20000",
	DE_Clock_Generator_System.compensate_clock			= "CLK0",
	DE_Clock_Generator_System.gate_lock_signal			= "NO",
	DE_Clock_Generator_System.inclk0_input_frequency	= 20000,
	DE_Clock_Generator_System.intended_device_family	= "Cyclone II",
	DE_Clock_Generator_System.invalid_lock_multiplier	= 5,
	DE_Clock_Generator_System.lpm_type						= "altpll",
	DE_Clock_Generator_System.operation_mode				= "NORMAL",
	DE_Clock_Generator_System.pll_type						= "FAST",
	DE_Clock_Generator_System.port_activeclock			= "PORT_UNUSED",
	DE_Clock_Generator_System.port_areset					= "PORT_UNUSED",
	DE_Clock_Generator_System.port_clkbad0					= "PORT_UNUSED",
	DE_Clock_Generator_System.port_clkbad1					= "PORT_UNUSED",
	DE_Clock_Generator_System.port_clkloss					= "PORT_UNUSED",
	DE_Clock_Generator_System.port_clkswitch				= "PORT_UNUSED",
	DE_Clock_Generator_System.port_fbin						= "PORT_UNUSED",
	DE_Clock_Generator_System.port_inclk0					= "PORT_USED",
	DE_Clock_Generator_System.port_inclk1					= "PORT_UNUSED",
	DE_Clock_Generator_System.port_locked					= "PORT_USED",
	DE_Clock_Generator_System.port_pfdena					= "PORT_UNUSED",
	DE_Clock_Generator_System.port_pllena					= "PORT_UNUSED",
	DE_Clock_Generator_System.port_scanaclr				= "PORT_UNUSED",
	DE_Clock_Generator_System.port_scanclk					= "PORT_UNUSED",
	DE_Clock_Generator_System.port_scandata				= "PORT_UNUSED",
	DE_Clock_Generator_System.port_scandataout			= "PORT_UNUSED",
	DE_Clock_Generator_System.port_scandone				= "PORT_UNUSED",
	DE_Clock_Generator_System.port_scanread				= "PORT_UNUSED",
	DE_Clock_Generator_System.port_scanwrite				= "PORT_UNUSED",
	DE_Clock_Generator_System.port_clk0						= "PORT_USED",
	DE_Clock_Generator_System.port_clk1						= "PORT_USED",
	DE_Clock_Generator_System.port_clk2						= "PORT_USED",
	DE_Clock_Generator_System.port_clk3						= "PORT_UNUSED",
	DE_Clock_Generator_System.port_clk4						= "PORT_UNUSED",
	DE_Clock_Generator_System.port_clk5						= "PORT_UNUSED",
	DE_Clock_Generator_System.port_clkena0					= "PORT_UNUSED",
	DE_Clock_Generator_System.port_clkena1					= "PORT_UNUSED",
	DE_Clock_Generator_System.port_clkena2					= "PORT_UNUSED",
	DE_Clock_Generator_System.port_clkena3					= "PORT_UNUSED",
	DE_Clock_Generator_System.port_clkena4					= "PORT_UNUSED",
	DE_Clock_Generator_System.port_clkena5					= "PORT_UNUSED",
	DE_Clock_Generator_System.port_enable0					= "PORT_UNUSED",
	DE_Clock_Generator_System.port_enable1					= "PORT_UNUSED",
	DE_Clock_Generator_System.port_extclk0					= "PORT_UNUSED",
	DE_Clock_Generator_System.port_extclk1					= "PORT_UNUSED",
	DE_Clock_Generator_System.port_extclk2					= "PORT_UNUSED",
	DE_Clock_Generator_System.port_extclk3					= "PORT_UNUSED",
	DE_Clock_Generator_System.port_extclkena0				= "PORT_UNUSED",
	DE_Clock_Generator_System.port_extclkena1				= "PORT_UNUSED",
	DE_Clock_Generator_System.port_extclkena2				= "PORT_UNUSED",
	DE_Clock_Generator_System.port_extclkena3				= "PORT_UNUSED",
	DE_Clock_Generator_System.port_sclkout0				= "PORT_UNUSED",
	DE_Clock_Generator_System.port_sclkout1				= "PORT_UNUSED",
	DE_Clock_Generator_System.valid_lock_multiplier		= 1;
altpll DE_Clock_Generator_Audio (
	// Inputs
	.inclk			({1'b0, CLOCK_27}),
	// Outputs
	.clk				(audio_clks),
	.locked			(audio_clk_locked),
	// Unused
	.activeclock	(),
	.areset			(1'b0),
	.clkbad			(),
	.clkena			({6{1'b1}}),
	.clkloss			(),
	.clkswitch		(1'b0),
	.enable0			(),
	.enable1			(),
	.extclk			(),
	.extclkena		({4{1'b1}}),
	.fbin				(1'b1),
	.pfdena			(1'b1),
	.pllena			(1'b1),
	.scanaclr		(1'b0),
	.scanclk			(1'b0),
	.scandata		(1'b0),
	.scandataout	(),
	.scandone		(),
	.scanread		(1'b0),
	.scanwrite		(1'b0),
	.sclkout0		(),
	.sclkout1		()
);
defparam
	DE_Clock_Generator_Audio.clk0_divide_by				= 1,
	DE_Clock_Generator_Audio.clk0_duty_cycle				= 50,
	DE_Clock_Generator_Audio.clk0_multiply_by				= 1,
	DE_Clock_Generator_Audio.clk0_phase_shift				= "0",
	DE_Clock_Generator_Audio.clk1_divide_by				= AUD_CLK_DIV,
	DE_Clock_Generator_Audio.clk1_duty_cycle				= 50,
	DE_Clock_Generator_Audio.clk1_multiply_by				= AUD_CLK_MULT,
	DE_Clock_Generator_Audio.clk1_phase_shift				= "0",
	DE_Clock_Generator_Audio.clk2_divide_by				= 1,
	DE_Clock_Generator_Audio.clk2_duty_cycle				= 50,
	DE_Clock_Generator_Audio.clk2_multiply_by				= 1,
	DE_Clock_Generator_Audio.clk2_phase_shift				= "0",
	DE_Clock_Generator_Audio.compensate_clock				= "CLK0",
	DE_Clock_Generator_Audio.gate_lock_signal				= "NO",
	DE_Clock_Generator_Audio.inclk0_input_frequency		= 37037,
	DE_Clock_Generator_Audio.intended_device_family		= "Cyclone II",
	DE_Clock_Generator_Audio.invalid_lock_multiplier	= 5,
	DE_Clock_Generator_Audio.lpm_type						= "altpll",
	DE_Clock_Generator_Audio.operation_mode				= "NORMAL",
	DE_Clock_Generator_Audio.pll_type						= "FAST",
	DE_Clock_Generator_Audio.port_activeclock				= "PORT_UNUSED",
	DE_Clock_Generator_Audio.port_areset					= "PORT_UNUSED",
	DE_Clock_Generator_Audio.port_clkbad0					= "PORT_UNUSED",
	DE_Clock_Generator_Audio.port_clkbad1					= "PORT_UNUSED",
	DE_Clock_Generator_Audio.port_clkloss					= "PORT_UNUSED",
	DE_Clock_Generator_Audio.port_clkswitch				= "PORT_UNUSED",
	DE_Clock_Generator_Audio.port_fbin						= "PORT_UNUSED",
	DE_Clock_Generator_Audio.port_inclk0					= "PORT_USED",
	DE_Clock_Generator_Audio.port_inclk1					= "PORT_UNUSED",
	DE_Clock_Generator_Audio.port_locked					= "PORT_USED",
	DE_Clock_Generator_Audio.port_pfdena					= "PORT_UNUSED",
	DE_Clock_Generator_Audio.port_pllena					= "PORT_UNUSED",
	DE_Clock_Generator_Audio.port_scanaclr					= "PORT_UNUSED",
	DE_Clock_Generator_Audio.port_scanclk					= "PORT_UNUSED",
	DE_Clock_Generator_Audio.port_scandata					= "PORT_UNUSED",
	DE_Clock_Generator_Audio.port_scandataout				= "PORT_UNUSED",
	DE_Clock_Generator_Audio.port_scandone					= "PORT_UNUSED",
	DE_Clock_Generator_Audio.port_scanread					= "PORT_UNUSED",
	DE_Clock_Generator_Audio.port_scanwrite				= "PORT_UNUSED",
	DE_Clock_Generator_Audio.port_clk0						= "PORT_USED",
	DE_Clock_Generator_Audio.port_clk1						= "PORT_USED",
	DE_Clock_Generator_Audio.port_clk2						= "PORT_UNUSED",
	DE_Clock_Generator_Audio.port_clk3						= "PORT_UNUSED",
	DE_Clock_Generator_Audio.port_clk4						= "PORT_UNUSED",
	DE_Clock_Generator_Audio.port_clk5						= "PORT_UNUSED",
	DE_Clock_Generator_Audio.port_clkena0					= "PORT_UNUSED",
	DE_Clock_Generator_Audio.port_clkena1					= "PORT_UNUSED",
	DE_Clock_Generator_Audio.port_clkena2					= "PORT_UNUSED",
	DE_Clock_Generator_Audio.port_clkena3					= "PORT_UNUSED",
	DE_Clock_Generator_Audio.port_clkena4					= "PORT_UNUSED",
	DE_Clock_Generator_Audio.port_clkena5					= "PORT_UNUSED",
	DE_Clock_Generator_Audio.port_enable0					= "PORT_UNUSED",
	DE_Clock_Generator_Audio.port_enable1					= "PORT_UNUSED",
	DE_Clock_Generator_Audio.port_extclk0					= "PORT_UNUSED",
	DE_Clock_Generator_Audio.port_extclk1					= "PORT_UNUSED",
	DE_Clock_Generator_Audio.port_extclk2					= "PORT_UNUSED",
	DE_Clock_Generator_Audio.port_extclk3					= "PORT_UNUSED",
	DE_Clock_Generator_Audio.port_extclkena0				= "PORT_UNUSED",
	DE_Clock_Generator_Audio.port_extclkena1				= "PORT_UNUSED",
	DE_Clock_Generator_Audio.port_extclkena2				= "PORT_UNUSED",
	DE_Clock_Generator_Audio.port_extclkena3				= "PORT_UNUSED",
	DE_Clock_Generator_Audio.port_sclkout0					= "PORT_UNUSED",
	DE_Clock_Generator_Audio.port_sclkout1					= "PORT_UNUSED",
	DE_Clock_Generator_Audio.valid_lock_multiplier		= 1;
endmodule