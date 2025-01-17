module s2mm #
(
	// Users to add parameters here
	parameter integer C_PIXEL_WIDTH	= 8,
	parameter integer C_IMG_WBITS = 12,
	parameter integer C_IMG_HBITS = 12,
	parameter integer C_DATACOUNT_BITS = 12,
	parameter integer C_PIXEL_STORE_WIDTH = 8,
	// User parameters ends
	// Parameters of Axi Master Bus Interface M_AXI
	parameter integer C_M_AXI_BURST_LEN	= 16,
	parameter integer C_M_AXI_ADDR_WIDTH	= 32,
	parameter integer C_M_AXI_DATA_WIDTH	= 32
)
(
	input wire [C_IMG_WBITS-1:0] img_width,
	input wire [C_IMG_HBITS-1:0] img_height,
	input wire  clk,
	input wire  resetn,
	/// @NOTE: resetting will keep until current transaction done.
	///        if under idle state when negedge of soft_resetn,
	///        don't need resetting, i.e. resetting will keep zero.
	input wire soft_resetn,
	output wire resetting,
	/// sream to fifo
	input wire s_axis_tvalid,
	input wire [C_PIXEL_WIDTH-1:0] s_axis_tdata,
	input wire s_axis_tuser,
	input wire s_axis_tlast,
	output wire s_axis_tready,
	input  wire                       s2mm_full,
	input  wire                       s2mm_almost_full,
	output wire [C_PIXEL_WIDTH+1 : 0] s2mm_wr_data,
	output wire                       s2mm_wr_en,
	/// fifo to memory
	output wire s2mm_sof,
	input wire [C_M_AXI_ADDR_WIDTH-1:0] s2mm_addr,
	input wire [C_M_AXI_DATA_WIDTH/C_PIXEL_STORE_WIDTH*(C_PIXEL_WIDTH+2)-1 : 0] s2mm_rd_data,
	input wire s2mm_empty,
	output wire s2mm_rd_en,
	input wire [C_DATACOUNT_BITS-1:0] s2mm_rd_data_count,
	// Ports of Axi Master Bus Interface M_AXI
	output wire [C_M_AXI_ADDR_WIDTH-1 : 0] m_axi_awaddr,
	output wire [7 : 0] m_axi_awlen,
	output wire [2 : 0] m_axi_awsize,
	output wire [1 : 0] m_axi_awburst,
	output wire  m_axi_awlock,
	output wire [3 : 0] m_axi_awcache,
	output wire [2 : 0] m_axi_awprot,
	output wire [3 : 0] m_axi_awqos,
	output wire  m_axi_awvalid,
	input wire  m_axi_awready,
	output wire [C_M_AXI_DATA_WIDTH-1 : 0] m_axi_wdata,
	output wire [C_M_AXI_DATA_WIDTH/8-1 : 0] m_axi_wstrb,
	output wire  m_axi_wlast,
	output wire  m_axi_wvalid,
	input wire  m_axi_wready,
	input wire [1 : 0] m_axi_bresp,
	input wire  m_axi_bvalid,
	output wire  m_axi_bready
);
	localparam C_PM1 = C_PIXEL_WIDTH - 1;
	localparam C_PP1 = C_PIXEL_WIDTH + 1;
	localparam C_PP2 = C_PIXEL_WIDTH + 2;
	localparam C_ADATA_PIXELS = C_M_AXI_DATA_WIDTH/C_PIXEL_STORE_WIDTH;
	function integer reverseI(input integer i);
	begin
		reverseI = C_ADATA_PIXELS-1-i;
	end
	endfunction
	function integer sofIdx(input integer i);
	begin
		sofIdx = i * C_PP2 + C_PIXEL_WIDTH;
	end
	endfunction
	function integer eolIdx(input integer i);
	begin
		eolIdx = i * C_PP2 + C_PP1;
	end
	endfunction
// stream to fifo
	wire working;
	assign working = (resetn && soft_resetn);
	assign resetting = ~working;
	/// use s2f_aclk
	assign s2mm_wr_data = {s_axis_tlast, s_axis_tuser, s_axis_tdata};
	assign s2mm_wr_en = s_axis_tvalid && s_axis_tready;
	reg sready;
	assign s_axis_tready = sready;
	always @ (posedge clk) begin
		if (resetting)
			sready <= 0;
		else if (s2mm_wr_en && s2mm_almost_full)
			sready <= 0;
		else
			sready <= 1;
	end
// fifo to mm
	/// use f2m_aclk
	wire [C_M_AXI_DATA_WIDTH-1 : 0] s2mm_pixel_data;
	generate
		genvar i;
		for (i = 0; i < C_M_AXI_DATA_WIDTH/C_PIXEL_WIDTH; i = i+1) begin: single_pixel
			assign s2mm_pixel_data[i*C_PIXEL_STORE_WIDTH + C_PM1 : i*C_PIXEL_STORE_WIDTH]
				= s2mm_rd_data[reverseI(i)*C_PP2 + C_PM1 : reverseI(i)*C_PP2];
		end
	endgenerate
	FIFO2MM # (
		.C_DATACOUNT_BITS(C_DATACOUNT_BITS),
		.C_M_AXI_BURST_LEN(C_M_AXI_BURST_LEN),
		.C_M_AXI_ADDR_WIDTH(C_M_AXI_ADDR_WIDTH),
		.C_M_AXI_DATA_WIDTH(C_M_AXI_DATA_WIDTH),
		.C_IMG_WBITS(C_IMG_WBITS),
		.C_IMG_HBITS(C_IMG_HBITS),
		.C_ADATA_PIXELS(C_ADATA_PIXELS)
	) FIFO2MM_inst (
		.img_width(img_width),
		.img_height(img_height),
		.soft_resetn(soft_resetn),
		//.resetting(resetting),
		//.sof(s2mm_rd_data[sofIdx(reverseI(0))]),
		.din(s2mm_pixel_data),
		//.empty(s2mm_empty),
		.rd_en(s2mm_rd_en),
		.rd_data_count(s2mm_rd_data_count),
		.frame_pulse(s2mm_sof),
		.base_addr(s2mm_addr),
		.M_AXI_ACLK(clk),
		.M_AXI_ARESETN(resetn),
		.M_AXI_AWADDR(m_axi_awaddr),
		.M_AXI_AWLEN(m_axi_awlen),
		.M_AXI_AWSIZE(m_axi_awsize),
		.M_AXI_AWBURST(m_axi_awburst),
		.M_AXI_AWLOCK(m_axi_awlock),
		.M_AXI_AWCACHE(m_axi_awcache),
		.M_AXI_AWPROT(m_axi_awprot),
		.M_AXI_AWQOS(m_axi_awqos),
		.M_AXI_AWVALID(m_axi_awvalid),
		.M_AXI_AWREADY(m_axi_awready),
		.M_AXI_WDATA(m_axi_wdata),
		.M_AXI_WSTRB(m_axi_wstrb),
		.M_AXI_WLAST(m_axi_wlast),
		.M_AXI_WVALID(m_axi_wvalid),
		.M_AXI_WREADY(m_axi_wready),
		.M_AXI_BRESP(m_axi_bresp),
		.M_AXI_BVALID(m_axi_bvalid),
		.M_AXI_BREADY(m_axi_bready)
	);
endmodule