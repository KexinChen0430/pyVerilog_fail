module altera_up_av_config_auto_init_ob_de2_35 (
	// Inputs
	rom_address,
	// Bidirectionals
	// Outputs
	rom_data
);
/*****************************************************************************
parameter AUD_LINE_IN_LC		= 9'h01A;
parameter AUD_LINE_IN_RC		= 9'h01A;
parameter AUD_LINE_OUT_LC		= 9'h07B;
parameter AUD_LINE_OUT_RC		= 9'h07B;
parameter AUD_ADC_PATH			= 9'h0F8;
parameter AUD_DAC_PATH			= 9'h006;
parameter AUD_POWER				= 9'h000;
parameter AUD_DATA_FORMAT		= 9'h001;
parameter AUD_SAMPLE_CTRL		= 9'h002;
parameter AUD_SET_ACTIVE		= 9'h001;
parameter VID_INPUT_CONTROL	= 16'h0040;
parameter VID_CHROMA_GAIN_1	= 16'h2df4;
parameter VID_CHROMA_GAIN_2	= 16'h2e00;
/*****************************************************************************
// Inputs
input			[ 5: 0]	rom_address;
// Bidirectionals
// Outputs
output		[26: 0]	rom_data;
/*****************************************************************************
// States
/*****************************************************************************
// Internal Wires
wire		[26: 0]	audio_rom_data;
wire		[26: 0]	video_rom_data;
// Internal Registers
// State Machine Registers
/*****************************************************************************
/*****************************************************************************
// Output Registers
// Internal Registers
/*****************************************************************************
// Output Assignments
assign rom_data = audio_rom_data | video_rom_data;
// Internal Assignments
/*****************************************************************************
altera_up_av_config_auto_init_ob_audio Auto_Init_Audio_ROM (
	// Inputs
	.rom_address			(rom_address),
	// Bidirectionals
	// Outputs
	.rom_data				(audio_rom_data)
);
defparam
	Auto_Init_Audio_ROM.AUD_LINE_IN_LC	= AUD_LINE_IN_LC,
	Auto_Init_Audio_ROM.AUD_LINE_IN_RC	= AUD_LINE_IN_RC,
	Auto_Init_Audio_ROM.AUD_LINE_OUT_LC	= AUD_LINE_OUT_LC,
	Auto_Init_Audio_ROM.AUD_LINE_OUT_RC	= AUD_LINE_OUT_RC,
	Auto_Init_Audio_ROM.AUD_ADC_PATH		= AUD_ADC_PATH,
	Auto_Init_Audio_ROM.AUD_DAC_PATH		= AUD_DAC_PATH,
	Auto_Init_Audio_ROM.AUD_POWER			= AUD_POWER,
	Auto_Init_Audio_ROM.AUD_DATA_FORMAT	= AUD_DATA_FORMAT,
	Auto_Init_Audio_ROM.AUD_SAMPLE_CTRL	= AUD_SAMPLE_CTRL,
	Auto_Init_Audio_ROM.AUD_SET_ACTIVE	= AUD_SET_ACTIVE;
altera_up_av_config_auto_init_ob_adv7181 Auto_Init_Video_ROM (
	// Inputs
	.rom_address			(rom_address),
	// Bidirectionals
	// Outputs
	.rom_data				(video_rom_data)
);
defparam
	Auto_Init_Video_ROM.INPUT_CONTROL	= VID_INPUT_CONTROL,
	Auto_Init_Video_ROM.CHROMA_GAIN_1	= VID_CHROMA_GAIN_1,
	Auto_Init_Video_ROM.CHROMA_GAIN_2	= VID_CHROMA_GAIN_2;
endmodule