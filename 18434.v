module ArrayUltrasound(
	input sysclk,
	output [15:0]  E_P,
	output [15:0]  E_N,
	output HV_SW_CLR,
	output HV_SW_LE,
	output HV_SW_CLK,
	output HV_SW_DOUT,
	output HV_EN,
	output [3:0] AX,
	output [2:0] AY,
	output MT_CS,
	output MT_Strobe,
	output MT_Data,
	output ADCLK,
	input DCO,
	input FCO,
	input OUTA,
	input OUTB,
	input OUTC,
	input OUTD,
	input OUTE,
	input OUTF,
	input OUTG,
	input OUTH,
	output SPI_CLK,
	inout SPI_Data,
	output SPI_CS,
	output STBY,
	output PWDN,
	output  sclk,
	output reg sync,
	output reg sdin,
	output reg HSync,         //output Enable
	output reg FSync,        //frame
	output  reg TestCLK,
	output reg LCLK_o,  //LCD CLK
	output HS,
	output VS,
	output reg [7:0] R_Data,
	output reg [7:0] G_Data,
	output reg [7:0]B_Data,
	output DE,
	output LCD_RST,
	output LCD_PWM,
	output SPENA,
	output SPDA,
	output SPCK,
	input CC3200_SPI_CLK,
	input CC3200_SPI_CS,
	output CC3200_SPI_DIN,
	input CC3200_SPI_DOUT,
	input Envelop
);
   reg RST_n;
   reg [31:0] RST_Counter;
	always @(posedge sysclk) begin  //48MHz
		if(RST_Counter <= 32'd48) begin
			RST_Counter <= RST_Counter + 1'b1;
			RST_n <= 1'b1;
		end
		else if(RST_Counter <= 32'd96000) begin
			RST_Counter <= RST_Counter + 1'b1;
			RST_n <= 1'b0;
		end
		else begin
			RST_n <= 1'b1;
		end
    end
    reg Enable;
    wire [1:0] Zoom;
    wire [5:0] Gain;
    reg  [7:0] Line_Num;
    wire [7:0] Line_Num_tmp;
    wire [8:0] Trans_Addr;
    wire [8:0] Trans_Data;
   // assign Line_Num= {Line_Num_tmp[6:1],1'b1};
    ComWithCC3200(
	.CC3200_SPI_CLK(CC3200_SPI_CLK),
	.CC3200_SPI_CS(CC3200_SPI_CS),
	.CC3200_SPI_DIN(CC3200_SPI_DIN),
	.CC3200_SPI_DOUT(CC3200_SPI_DOUT),
	.Envelop(Envelop),
	.Line_Num(Line_Num_tmp), //Current Sample Line
	.Enable(),
	.Zoom(Zoom),
	.Gain(Gain),
	.Trans_Data(Trans_Data[8:1]),
	.Trans_Addr(Trans_Addr)
);
	always @(posedge Envelop) begin
		Line_Num <= Line_Num_tmp;
	end
    reg [31:0] Idle_Counter;
    always @( posedge sysclk or posedge Envelop) begin
		if(Envelop) begin
			Idle_Counter <= 32'd0;
			Enable <= 1'b1;
		end
		else begin
			if(Idle_Counter <= 32'd25000000) begin//0.5s
				Enable <= 1'b1;
				Idle_Counter <= Idle_Counter + 1'b1;
			end
			else begin
				Enable <= 1'b0;
			end
		end
	end
	//assign Line_Num = Test_q[6:0];
	wire CLK_100M;
	wire CLK_20M;
	PLL	PLL_inst (
		.inclk0 ( sysclk ),
		.c0 ( CLK_100M ),
		.c1 (CLK_20M)
		);
	assign ADCLK=sysclk;
	wire AD_CLK;
	reg [31:0]  Pulse_Counter;
	reg Pr_Gate;
	reg RX_Gate;
	reg End_Gate;
	wire Sample_Gate; //start Sampling ,50ns width
	reg [1:0] Focus_Num ;
	reg [1:0] Focus_Num_Pre ;
	//Focus_Num   0:20mm 16CH, 1:40mm:16CH, 2:80mm 16CH(outside) 3:80mm 16CH(inner),
	always @(posedge RX_Gate or posedge Envelop) begin      //255 emit ,128line,
		if(Envelop) begin
			Focus_Num_Pre <= 2'b0;
		end
		else begin
			if(Focus_Num_Pre[1:0] == 2'b00) begin
				Focus_Num_Pre[1:0] <= 2'b01;
			end
			else if(Focus_Num_Pre[1:0] == 2'b01) begin
				Focus_Num_Pre[1:0] <= 2'b10;
			end
			else if(Focus_Num_Pre[1:0] == 2'b10) begin
				Focus_Num_Pre[1:0] <= 2'b11;
			end
			else if(Focus_Num_Pre[1:0] == 2'b11) begin
				Focus_Num_Pre[1:0] <= 2'b00;
			end
			else
			begin
				Focus_Num_Pre[1:0] <= 2'b00;
			end
		end
	end
	always @(posedge End_Gate) begin  //latch the Line_num  Line_Num must be prepared before Pr_Gate
		Focus_Num <= Focus_Num_Pre;
	end
	//assign Line_Num = Line_Num_Test[7:0];
	reg [31:0] Envelop_Counter;
	reg [31:0] Line_Period;
	always @(posedge Pr_Gate) begin
		case(Focus_Num[1:0])
			2'b00:           //
				Line_Period=32'd9000;   //60us
			2'b01:
				Line_Period=32'd12000;  //70us
			2'b10:
				Line_Period=32'd18000;  //150us
			2'b11:
				Line_Period=32'd18000;  //150us
		endcase
	end
 	always @(posedge CLK_100M or posedge Envelop) begin
		if(Envelop) begin
			Pulse_Counter <= 32'd0;
		end
		else begin
			if(Pulse_Counter < 32'd3000)  //30us
			begin
				Pulse_Counter <= Pulse_Counter + 1'b1;
				Pr_Gate <= 1'b1;
				RX_Gate <= 1'b0;
				End_Gate <= 1'b0;
			end
			else if(Pulse_Counter < 32'd3250)  //2.5us?
			begin
				Pulse_Counter <= Pulse_Counter + 1'b1;
				Pr_Gate <= 1'b0;
				RX_Gate <= 1'b1;
				End_Gate <= 1'b0;
			end
			else if(Pulse_Counter < Line_Period)  //300us
			begin
				Pulse_Counter <= Pulse_Counter + 1'b1;
				Pr_Gate <= 1'b0;
				RX_Gate <= 1'b0;
				End_Gate <= 1'b0;
			end
			else if(Pulse_Counter < (Line_Period + 8'd80))  //1us
			begin
				Pulse_Counter <= Pulse_Counter + 1'b1;
				Pr_Gate <= 1'b0;
				RX_Gate <= 1'b0;
				End_Gate <= 1'b1;
			end
			else begin
				if(Focus_Num_Pre >2'b00)
					Pulse_Counter <= 32'd0;
				else
					Pulse_Counter <= 32'd65536;
				Pr_Gate <= 1'b0;
				RX_Gate <= 1'b0;
				End_Gate <= 1'b0;
			end
		end
	end
	//assign HV_SW_LE2 = HV_SW_LE; //route wrong,should combine HV_SW_LE and HV_SW_LE2;
 Transmit	Transmit_Inst(
	.Transmit_CLK(CLK_100M),     //80MHz
	.Line_Num(Line_Num),//Line_Num_Test),         //Line Num,256 Lines totally,0~255
	.Focus_Num(Focus_Num),//Focus_Num_Test),        //Focus_num ,4 totally
	.Pr_Gate(Pr_Gate),          //prepare for everythings
	.RX_Gate(RX_Gate),          // Start Transmit
	.Sample_Gate(Sample_Gate),  //start Sampling
	.P(E_P),
	.N(E_N),
	.HV_SW_CLR(HV_SW_CLR),
	.HV_SW_LE(HV_SW_LE),
	.HV_SW_CLK(HV_SW_CLK),
	.HV_SW_DOUT(HV_SW_DOUT),
	.AX(AX),
	.AY(AY),
	.MT_CS(MT_CS),
	.MT_Strobe(MT_Strobe),
	.MT_Data(MT_Data)
);
	wire [11:0] Data_A,Data_B,Data_C,Data_D;
	wire [11:0] Data_E,Data_F,Data_G,Data_H;
	LVDS_AD	LVDS_AD_inst_A (
		.rx_in ( {OUTA,OUTB,OUTC,OUTD,OUTE,OUTF,OUTG,OUTH} ),
		.rx_inclock ( FCO ),
		.rx_out ( {Data_A,Data_B,Data_C,Data_D,Data_E,Data_F,Data_G,Data_H} ),
		.rx_outclock ( AD_CLK )
		);
  // assign TestCLK = AD_CLK;
	assign HV_EN = ~Enable;//Focus_Num_Test[0];//Envelop;//
    assign STBY = ~Enable;//Focus_Num_Test[1];
	assign PWDN = ~Enable;//Focus_Num_Test[2];
    // test for why VRef can't Boost.
    assign  SPI_CLK = CLK_20M;
  AD9273_SPI_Config AD9273_SPI_Config_Inst(
		.RST_n(RST_n),
		.SPI_CLK(SPI_CLK),
		.SPI_Data(SPI_Data),
		.SPI_CS(SPI_CS)
);
	reg [3:0] div_Sclk;
	reg [7:0] Send_Counter;
	reg [15:0] Send_Data;
	reg [8:0] Tgc_Counter;
	assign sclk = CLK_20M;
	wire [6:0] Tgc_Data;
	TGC_ROM	TGC_ROM_inst (
	.address ( Tgc_Counter[7:1] ),
	.clock ( CLK_20M ),
	.q ( Tgc_Data )
	);
	always @(posedge CLK_20M or posedge Pr_Gate) begin
		if(Pr_Gate) begin
			Tgc_Counter <= 9'd0;
			Send_Counter <= 8'b0;
		end
		else  begin
			if(Tgc_Counter < 9'd255) begin
				if( Send_Counter <8'd3) begin
					sync <= 1'b1;
					Send_Counter <= Send_Counter + 1'b1;
					//Send_Data <= {2'b0,{1'b0,TGC_Data[6:0]}+{2'b0,TGC_Data[6:1]}+{2'b0,Gain[6:1]},6'b0};
					//Send_Data <= {2'b0,1'b1,Tgc_Counter[7:1],6'b0};
					Send_Data <= {2'b0,({1'b0,Tgc_Data[6:0]}+{1'b0,Gain[5:0],1'b0}),6'b0};
					//Send_Data <= {2'b0,8'd255,6'b0};
				end
				else if(Send_Counter <8'd19) begin
					Send_Counter <= Send_Counter + 1'b1;
					sync <= 1'b0;
					sdin <= Send_Data[8'd18-Send_Counter];
				end
				else begin
					sync <= 1'b1;
					Send_Counter <= 8'd0;
					Tgc_Counter <= Tgc_Counter + 1'b1;
				end
			end
			else begin
				if( Send_Counter <8'd3) begin
					sync <= 1'b1;
					Send_Counter <= Send_Counter + 1'b1;
					//Send_Data <= {2'b0,{1'b0,TGC_Data[6:0]}+{2'b0,TGC_Data[6:1]}+{2'b0,Gain[6:1]},6'b0};
					Send_Data <= {2'b0,{1'b0,Gain[5:0],1'b0},6'b0};
					//Send_Data <= {2'b0,8'h0,6'b0};
					//Send_Data <= {2'b0,8'h80,6'b0};
				end
				else if(Send_Counter <8'd19) begin
					Send_Counter <= Send_Counter + 1'b1;
					sync <= 1'b0;
					sdin <= Send_Data[8'd18-Send_Counter];
				end
				else begin
					sync <= 1'b1;
					//Send_Counter <= 8'd255;
				end
			end
		end
	end
	reg RX_Gate_Reg;
	reg Pr_Gate_Reg;
	reg Sample_Gate_Reg;
	reg End_Gate_Reg;
	always @(posedge AD_CLK) begin
		RX_Gate_Reg <= RX_Gate;
		Pr_Gate_Reg <= Pr_Gate;
		Sample_Gate_Reg <= Sample_Gate;
		End_Gate_Reg <= End_Gate;
	end
    wire [15:0] DAS_Value;
    wire So_Gate;
    wire [7:0] Coheren_Coff;
	Receive Receive_Inst(
		.AD_CLK(AD_CLK),
		.Data_A(Data_A),
		.Data_B(Data_B),
		.Data_C(Data_C),
		.Data_D(Data_D),
		.Data_E(Data_E),
		.Data_F(Data_F),
		.Data_G(Data_G),
		.Data_H(Data_H),
		.Line_Num(Line_Num),         //Line Num,256 Lines totally,0~255
		.Focus_Num(Focus_Num),//Focus_Num[7:6]),        //Focus_num ,4 totally
		.Pr_Gate(Pr_Gate_Reg),          //prepare for everythings
		.RX_Gate(RX_Gate_Reg),          // Start Transmit
		.Sample_Gate(Sample_Gate_Reg),
		.End_Gate(End_Gate_Reg),
		.So_Gate(So_Gate),         //output Enable
		.DAS_Value(DAS_Value),
		.Coheren_Coff(Coheren_Coff),
	);
    wire [29:0] Match_Filter_Data;
    wire MF_Output_RDY;
    wire MF_Output_Valid;
    //match 2-4 8-10 filter
    //80taps,
   	matchfilter MatchFilter_Inst(
		.clk(AD_CLK),
		.reset_n(1'b1),
		.ast_sink_data(DAS_Value[14:0]),  //15bit
		.ast_sink_valid(So_Gate),
		.ast_source_ready(1'b1),
		.ast_sink_error(2'b00),
		.ast_source_data(Match_Filter_Data),   //30bit
		.ast_sink_ready(MF_Output_RDY),
		.ast_source_valid(MF_Output_Valid),
		.ast_source_error()
		);
/*
	wire [38:0]  Coherent_Result;
	reg [7:0] Coheren_Coff_REG[35:0];
    //Coff delay 29clk to Data,
    //matchfilter delay 64clk to input,
    //so Coff should delay more 64-29=35clk
	integer i;
	always @(posedge AD_CLK) begin
		Coheren_Coff_REG[0] <= Coheren_Coff;
		for(i=0;i<8'd34;i=i+1) begin
			Coheren_Coff_REG[i+1] <= Coheren_Coff_REG[i] ;
		end
	end
	mult30_9	mult30_9_inst (
		.clock ( AD_CLK ),
		.dataa ( Match_Filter_Data ),
		.datab ( {1'b0,Coheren_Coff_REG[29]} ),
		.result ( Coherent_Result )
	);
    wire [29:0] ABS_Data;
	ABS	ABS_inst (
	.data ( Coherent_Result[38:8]),//Match_Filter_Data ),//Coherent_Result[38:8]) ,need change input bit width
	.result ( ABS_Data )
	);
	*/
    wire [29:0] ABS_Data;
	ABS	ABS_inst (
	.data ( Match_Filter_Data ),
	.result ( ABS_Data )
	);
    //wire [28:0] LF_Data;
    wire LF_Valid;
    wire [30:0] LF_Data;
	lf LF_Inst(
		.clk(AD_CLK),
		.reset_n(1'b1),
		.ast_sink_data(ABS_Data[26:12]),   //15bit
		.ast_sink_valid(MF_Output_Valid),
		.ast_source_ready(1'b1),
		.ast_sink_error(2'b00),
		.ast_source_data(LF_Data),         //31bit
		.ast_sink_ready(),
		.ast_source_valid(LF_Valid),
		.ast_source_error()
		);
  wire [12:0] Log_IN;
  //assign Log_IN =(LF_Data[30])?13'd0:((LF_Data[30:14] > 18'd8091)?13'd8191:LF_Data[26:14]);
  assign Log_IN =(LF_Data[30])?13'd0:((LF_Data[30:12] > 18'd8091)?13'd8191:LF_Data[24:12]);
  //assign Log_IN =(LF_Data[30])?13'd0:((LF_Data[28:13] > 18'd8091)?13'd8191:LF_Data[25:13]);
  wire [7:0] Log_OUT;
 LOG_Table	LOG_Table_inst (
	.address ( Log_IN),
	.clock ( AD_CLK ),
	.q ( Log_OUT )
	);
	reg [8:0] WR_RAM_ADDR;
	reg [7:0] LF_Reg;
	reg [7:0] Interlace_Counter;
	reg [7:0] Log1,Log2,Log3,Log4,Log5,Log6,Log7,Log8,Log9,Log10,Log11,Log12,Log13,Log14,Log15;
	reg [11:0] Sum_Log;
	reg [15:0] Sample_Counter;
	reg Seg_Enable;
	reg [7:0] Interlace;
	always @(*) begin
		case(Zoom)
		2'b00:     //40mm
			Interlace <= 8'd4;
		2'b01:     //63mm
		    Interlace <= 8'd7;
		2'b10:     //78mm
			Interlace <= 8'd9;
		2'b11:     //102mm
			Interlace <= 8'd12;
		endcase
	end
   wire [7:0] Base_Noise1;
   wire [7:0] Base_Noise2;
	//wire [7:0] Focus_Num;
    wire [7:0] Line_Num_Test;
	Test	Test_inst (
	.address ( 1'b0 ),
	.clock ( AD_CLK ),
	.q ( {Base_Noise1,Base_Noise2} )
	);
	always @(posedge AD_CLK or negedge LF_Valid ) begin
		if(~LF_Valid) begin
			Interlace_Counter <= 8'd0;
			WR_RAM_ADDR[8:0] <= 8'd0;
			Sample_Counter <= 16'd0;
		end
		else begin
			Log15 <= Log14;
			Log14 <= Log13;
			Log13 <= Log12;
			Log12 <= Log11;
			Log11 <= Log10;
			Log10 <= Log9;
			Log9  <= Log8;
			Log8  <= Log7;
			Log7  <= Log6;
			Log6  <= Log5;
			Log5  <= Log4;
			Log4  <= Log3;
			Log3  <= Log2;
			Log2  <= Log1;
			Log1  <= Log_OUT;
			Sum_Log <= Log1+Log2+Log3+Log4+Log5+Log6+Log7+Log8+Log9+Log10+Log11+Log12+Log13+Log14+Log15;
		    if(Sample_Counter <16'd16000) begin
				Sample_Counter <= Sample_Counter + 1'b1;
			end
			if(Sample_Counter <=16'd900) begin  //<15mm
				if(Focus_Num[1:0] == 2'b00) begin
					Seg_Enable <= 1'b1;
				end
				else begin
					Seg_Enable <= 1'b0;
				end
				LF_Reg <= (Sum_Log[11:4]>Base_Noise1)? (Sum_Log[11:4]-Base_Noise1): 8'd0 ;
			end
			else if(Sample_Counter <=16'd1599) begin  //<25mm
				if(Focus_Num[1:0] == 2'b01) begin
					Seg_Enable <= 1'b1;
				end
				else begin
					Seg_Enable <= 1'b0;
				end
				LF_Reg <= Sum_Log[11:4];
			end
			else begin
				if(Focus_Num[1:0] == 2'b11) begin
					Seg_Enable <= 1'b1;
				end
				else begin
					Seg_Enable <= 1'b0;
				end
				LF_Reg <= (Sum_Log[11:4]>Base_Noise2)? (Sum_Log[11:4]-Base_Noise2): 8'd0 ;
			end
			if(Interlace_Counter < Interlace) begin
				Interlace_Counter <= Interlace_Counter + 1'b1;
			end
			else begin
				if(WR_RAM_ADDR[8:0] <9'd511) begin
					WR_RAM_ADDR[8:0] <= WR_RAM_ADDR[8:0]  + 1'b1;
				end
				Interlace_Counter <= 8'd0;
			end
		end
	end
/*
	reg Toggle;
	always @(posedge Envelop) begin
		Toggle  <= ~Toggle;
	end
IMG_BUFFER	IMG_BUFFER_inst (
	.data ( LF_Reg ),
	.rdaddress ( {Toggle,Trans_Addr} ),
	.rdclock ( CC3200_SPI_CS ),
	.wraddress (  {~Toggle,WR_RAM_ADDR} ),
	.wrclock ( AD_CLK ),
	.wren ( LF_Valid & Seg_Enable  ),
	.q ( Trans_Data )
	);
*/
	reg [1:0] Toggle;
	always @(posedge Envelop) begin
		Toggle  <= Toggle + 1'b1;
	end
	wire [7:0] Trans_Data1,Trans_Data2;
IMG_TRI_BUFFER	IMG_TRI_BUFFER_inst (
	.data ( LF_Reg ),
	.rdaddress_a ( {Toggle[1:0]-2'b01,Trans_Addr} ),
	.rdaddress_b ( {Toggle[1:0]-2'b10,Trans_Addr} ),
	.rdclock (  CC3200_SPI_CS ),
	.wraddress ( {Toggle[1:0],WR_RAM_ADDR} ),
	.wrclock ( AD_CLK ),
	.wren ( LF_Valid & Seg_Enable ),
	.qa ( Trans_Data1 ),
	.qb ( Trans_Data2 )
	);
assign Trans_Data ={1'b0,Trans_Data1} + {1'b0,Trans_Data2};
endmodule