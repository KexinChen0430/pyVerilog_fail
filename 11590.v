module AUDIO_IF(
	avs_s1_clk,
	avs_s1_reset,
	avs_s1_address,
	avs_s1_read,
	avs_s1_readdata,
	avs_s1_write,
	avs_s1_writedata,
	avs_s1_export_BCLK,
	avs_s1_export_DACLRC,
	avs_s1_export_DACDAT,
	avs_s1_export_ADCLRC,
	avs_s1_export_ADCDAT
);
/*****************************************************************************
`define DAC_LFIFO_ADDR	0
`define DAC_RFIFO_ADDR	1
`define ADC_LFIFO_ADDR	2
`define ADC_RFIFO_ADDR	3
`define CMD_ADDR		4
`define STATUS_ADDR		5
/*****************************************************************************
input							avs_s1_clk;
input							avs_s1_reset;
input		[2:0]				avs_s1_address;
input							avs_s1_read;
output		[15:0]				avs_s1_readdata;
input							avs_s1_write;
input		[15:0]				avs_s1_writedata;
input							avs_s1_export_BCLK;
input							avs_s1_export_DACLRC;
output							avs_s1_export_DACDAT;
input							avs_s1_export_ADCLRC;
input							avs_s1_export_ADCDAT;
/*****************************************************************************
// host
reg		[15:0]					reg_readdata;
reg								fifo_clear;
// dac
wire							dacfifo_full;
reg 							dacfifo_write;
reg 	[31:0]					dacfifo_writedata;
// adc
wire							adcfifo_empty;
reg 							adcfifo_read;
wire	[31:0]					adcfifo_readdata;
reg		[31:0]					data32_from_adcfifo;
reg		[31:0]					data32_from_adcfifo_2;
/*****************************************************************************
always @ (posedge avs_s1_clk)
begin
	if (avs_s1_reset)
		fifo_clear <= 1'b0;
	else if (avs_s1_write && (avs_s1_address == `CMD_ADDR))
		fifo_clear <= avs_s1_writedata[0];
	else if (fifo_clear)
		fifo_clear <= 1'b0;
end
always @ (posedge avs_s1_clk)
begin
	if (avs_s1_reset || fifo_clear)
	begin
		dacfifo_write <= 1'b0;
	end
	else if (avs_s1_write && (avs_s1_address == `DAC_LFIFO_ADDR))
	begin
		dacfifo_writedata[31:16] <= avs_s1_writedata;
		dacfifo_write <= 1'b0;
	end
	else if (avs_s1_write && (avs_s1_address == `DAC_RFIFO_ADDR))
	begin
		dacfifo_writedata[15:0] <= avs_s1_writedata;
		dacfifo_write <= 1'b1;
	end
	else
		dacfifo_write <= 1'b0;
end
always @ (negedge avs_s1_clk)
begin
	if (avs_s1_reset || fifo_clear)
		data32_from_adcfifo = 0;
	else if (avs_s1_read && (avs_s1_address == `STATUS_ADDR))
		reg_readdata <= {adcfifo_empty, dacfifo_full};
	else if (avs_s1_read && (avs_s1_address == `ADC_LFIFO_ADDR))
		reg_readdata <= data32_from_adcfifo[31:16];
	else if (avs_s1_read && (avs_s1_address == `ADC_RFIFO_ADDR))
	begin
		reg_readdata <= data32_from_adcfifo[15:0];
		data32_from_adcfifo <= data32_from_adcfifo_2;
	end
end
always @ (negedge avs_s1_clk)
begin
	if (avs_s1_reset)
	begin
		adcfifo_read <= 1'b0;
		data32_from_adcfifo_2 <= 0;
	end
	else if ((avs_s1_address == `ADC_LFIFO_ADDR) & avs_s1_read & ~adcfifo_empty)
	begin
		adcfifo_read <= 1'b1;
	end
	else if (adcfifo_read)
	begin
		data32_from_adcfifo_2 = adcfifo_readdata;
		adcfifo_read <= 1'b0;
	end
end
/*****************************************************************************
assign	avs_s1_readdata = reg_readdata;
/*****************************************************************************
AUDIO_DAC DAC_Instance(
	// host
	.clk(avs_s1_clk),
	.reset(avs_s1_reset),
	.write(dacfifo_write),
	.writedata(dacfifo_writedata),
	.full(dacfifo_full),
	.clear(fifo_clear),
	// dac
	.bclk(avs_s1_export_BCLK),
	.daclrc(avs_s1_export_DACLRC),
	.dacdat(avs_s1_export_DACDAT)
);
AUDIO_ADC ADC_Instance(
	// host
	.clk(avs_s1_clk),
	.reset(avs_s1_reset),
	.read(adcfifo_read),
	.readdata(adcfifo_readdata),
	.empty(adcfifo_empty),
	.clear(fifo_clear),
	// adc
	.bclk(avs_s1_export_BCLK),
	.adclrc(avs_s1_export_ADCLRC),
	.adcdat(avs_s1_export_ADCDAT)
);
defparam
	DAC_Instance.DATA_WIDTH = 32;
defparam
	ADC_Instance.DATA_WIDTH = 32;
endmodule