module bus_if (
	/********** ¥¯¥í¥Ã¥¯ & ¥ê¥»¥Ã¥È **********/
	input  wire				   clk,			   // ¥¯¥í¥Ã¥¯
	input  wire				   reset,		   // ·ÇÍ¬ÆÚ¥ê¥»¥Ã¥È
	/********** ¥Ñ¥¤¥×¥é¥¤¥óÖÆÓùÐÅºÅ **********/
	input  wire				   stall,		   // ¥¹¥È©`¥ë
	input  wire				   flush,		   // ¥Õ¥é¥Ã¥·¥åÐÅºÅ
	output reg				   busy,		   // ¥Ó¥¸©`ÐÅºÅ
	/********** CPU¥¤¥ó¥¿¥Õ¥§©`¥¹ **********/
	input  wire [`WordAddrBus] addr,		   // ¥¢¥É¥ì¥¹
	input  wire				   as_,			   // ¥¢¥É¥ì¥¹ÓÐ¿
	input  wire				   rw,			   // Õi¤ß£¯ø¤­
	input  wire [`WordDataBus] wr_data,		   // ø¤­Þz¤ß¥Ç©`¥¿
	output reg	[`WordDataBus] rd_data,		   // Õi¤ß³ö¤·¥Ç©`¥¿
	/********** SPM¥¤¥ó¥¿¥Õ¥§©`¥¹ **********/
	input  wire [`WordDataBus] spm_rd_data,	   // Õi¤ß³ö¤·¥Ç©`¥¿
	output wire [`WordAddrBus] spm_addr,	   // ¥¢¥É¥ì¥¹
	output reg				   spm_as_,		   // ¥¢¥É¥ì¥¹¥¹¥È¥í©`¥Ö
	output wire				   spm_rw,		   // Õi¤ß£¯ø¤­
	output wire [`WordDataBus] spm_wr_data,	   // ø¤­Þz¤ß¥Ç©`¥¿
	/********** ¥Ð¥¹¥¤¥ó¥¿¥Õ¥§©`¥¹ **********/
	input  wire [`WordDataBus] bus_rd_data,	   // Õi¤ß³ö¤·¥Ç©`¥¿
	input  wire				   bus_rdy_,	   // ¥ì¥Ç¥£
	input  wire				   bus_grnt_,	   // ¥Ð¥¹¥°¥é¥ó¥È
	output reg				   bus_req_,	   // ¥Ð¥¹¥ê¥¯¥¨¥¹¥È
	output reg	[`WordAddrBus] bus_addr,	   // ¥¢¥É¥ì¥¹
	output reg				   bus_as_,		   // ¥¢¥É¥ì¥¹¥¹¥È¥í©`¥Ö
	output reg				   bus_rw,		   // Õi¤ß£¯ø¤­
	output reg	[`WordDataBus] bus_wr_data	   // ø¤­Þz¤ß¥Ç©`¥¿
);
	/********** ÄÚ²¿ÐÅºÅ **********/
	reg	 [`BusIfStateBus]	   state;		   // ¥Ð¥¹¥¤¥ó¥¿¥Õ¥§©`¥¹¤Î×´B
	reg	 [`WordDataBus]		   rd_buf;		   // Õi¤ß³ö¤·¥Ð¥Ã¥Õ¥¡
	wire [`BusSlaveIndexBus]   s_index;		   // ¥Ð¥¹¥¹¥ì©`¥Ö¥¤¥ó¥Ç¥Ã¥¯¥¹
	/********** ¥Ð¥¹¥¹¥ì©`¥Ö¤Î¥¤¥ó¥Ç¥Ã¥¯¥¹ **********/
	assign s_index	   = addr[`BusSlaveIndexLoc];
	/********** ³öÁ¦¤Î¥¢¥µ¥¤¥ó **********/
	assign spm_addr	   = addr;
	assign spm_rw	   = rw;
	assign spm_wr_data = wr_data;
	/********** ¥á¥â¥ê¥¢¥¯¥»¥¹¤ÎÖÆÓù **********/
	always @(*) begin
		/* ¥Ç¥Õ¥©¥ë¥È */
		rd_data	 = `WORD_DATA_W'h0;
		spm_as_	 = `DISABLE_;
		busy	 = `DISABLE;
		/* ¥Ð¥¹¥¤¥ó¥¿¥Õ¥§©`¥¹¤Î×´B */
		case (state)
			`BUS_IF_STATE_IDLE	 : begin // ¥¢¥¤¥É¥ë
				/* ¥á¥â¥ê¥¢¥¯¥»¥¹ */
				if ((flush == `DISABLE) && (as_ == `ENABLE_)) begin
					/* ¥¢¥¯¥»¥¹ÏÈ¤Îßxk */
					if (s_index == `BUS_SLAVE_1) begin // SPM¤Ø¥¢¥¯¥»¥¹
						if (stall == `DISABLE) begin // ¥¹¥È©`¥ë°kÉú¤Î¥Á¥§¥Ã¥¯
							spm_as_	 = `ENABLE_;
							if (rw == `READ) begin // Õi¤ß³ö¤·¥¢¥¯¥»¥¹
								rd_data	 = spm_rd_data;
							end
						end
					end else begin					   // ¥Ð¥¹¤Ø¥¢¥¯¥»¥¹
						busy	 = `ENABLE;
					end
				end
			end
			`BUS_IF_STATE_REQ	 : begin // ¥Ð¥¹¥ê¥¯¥¨¥¹¥È
				busy	 = `ENABLE;
			end
			`BUS_IF_STATE_ACCESS : begin // ¥Ð¥¹¥¢¥¯¥»¥¹
				/* ¥ì¥Ç¥£´ý¤Á */
				if (bus_rdy_ == `ENABLE_) begin // ¥ì¥Ç¥£µ½×Å
					if (rw == `READ) begin // Õi¤ß³ö¤·¥¢¥¯¥»¥¹
						rd_data	 = bus_rd_data;
					end
				end else begin					// ¥ì¥Ç¥£Î´µ½×Å
					busy	 = `ENABLE;
				end
			end
			`BUS_IF_STATE_STALL	 : begin // ¥¹¥È©`¥ë
				if (rw == `READ) begin // Õi¤ß³ö¤·¥¢¥¯¥»¥¹
					rd_data	 = rd_buf;
				end
			end
		endcase
	end
   /********** ¥Ð¥¹¥¤¥ó¥¿¥Õ¥§©`¥¹¤Î×´BÖÆÓù **********/
   always @(posedge clk or `RESET_EDGE reset) begin
		if (reset == `RESET_ENABLE) begin
			/* ·ÇÍ¬ÆÚ¥ê¥»¥Ã¥È */
			state		<= #1 `BUS_IF_STATE_IDLE;
			bus_req_	<= #1 `DISABLE_;
			bus_addr	<= #1 `WORD_ADDR_W'h0;
			bus_as_		<= #1 `DISABLE_;
			bus_rw		<= #1 `READ;
			bus_wr_data <= #1 `WORD_DATA_W'h0;
			rd_buf		<= #1 `WORD_DATA_W'h0;
		end else begin
			/* ¥Ð¥¹¥¤¥ó¥¿¥Õ¥§©`¥¹¤Î×´B */
			case (state)
				`BUS_IF_STATE_IDLE	 : begin // ¥¢¥¤¥É¥ë
					/* ¥á¥â¥ê¥¢¥¯¥»¥¹ */
					if ((flush == `DISABLE) && (as_ == `ENABLE_)) begin
						/* ¥¢¥¯¥»¥¹ÏÈ¤Îßxk */
						if (s_index != `BUS_SLAVE_1) begin // ¥Ð¥¹¤Ø¥¢¥¯¥»¥¹
							state		<= #1 `BUS_IF_STATE_REQ;
							bus_req_	<= #1 `ENABLE_;
							bus_addr	<= #1 addr;
							bus_rw		<= #1 rw;
							bus_wr_data <= #1 wr_data;
						end
					end
				end
				`BUS_IF_STATE_REQ	 : begin // ¥Ð¥¹¥ê¥¯¥¨¥¹¥È
					/* ¥Ð¥¹¥°¥é¥ó¥È´ý¤Á */
					if (bus_grnt_ == `ENABLE_) begin // ¥Ð¥¹Ø«@µÃ
						state		<= #1 `BUS_IF_STATE_ACCESS;
						bus_as_		<= #1 `ENABLE_;
					end
				end
				`BUS_IF_STATE_ACCESS : begin // ¥Ð¥¹¥¢¥¯¥»¥¹
					/* ¥¢¥É¥ì¥¹¥¹¥È¥í©`¥Ö¤Î¥Í¥²©`¥È */
					bus_as_		<= #1 `DISABLE_;
					/* ¥ì¥Ç¥£´ý¤Á */
					if (bus_rdy_ == `ENABLE_) begin // ¥ì¥Ç¥£µ½×Å
						bus_req_	<= #1 `DISABLE_;
						bus_addr	<= #1 `WORD_ADDR_W'h0;
						bus_rw		<= #1 `READ;
						bus_wr_data <= #1 `WORD_DATA_W'h0;
						/* Õi¤ß³ö¤·¥Ç©`¥¿¤Î±£´æ */
						if (bus_rw == `READ) begin // Õi¤ß³ö¤·¥¢¥¯¥»¥¹
							rd_buf		<= #1 bus_rd_data;
						end
						/* ¥¹¥È©`¥ë°kÉú¤Î¥Á¥§¥Ã¥¯ */
						if (stall == `ENABLE) begin // ¥¹¥È©`¥ë°kÉú
							state		<= #1 `BUS_IF_STATE_STALL;
						end else begin				// ¥¹¥È©`¥ëÎ´°kÉú
							state		<= #1 `BUS_IF_STATE_IDLE;
						end
					end
				end
				`BUS_IF_STATE_STALL	 : begin // ¥¹¥È©`¥ë
					/* ¥¹¥È©`¥ë°kÉú¤Î¥Á¥§¥Ã¥¯ */
					if (stall == `DISABLE) begin // ¥¹¥È©`¥ë½â³ý
						state		<= #1 `BUS_IF_STATE_IDLE;
					end
				end
			endcase
		end
	end
endmodule