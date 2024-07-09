module SORTINGNETWORK(input  wire               CLK,
                      input  wire               RST_IN,
                      input  wire [`SORT_WAY:0] DATAEN_IN,
                      input  wire [511:0]       DIN_T,
                      output reg  [511:0]       DOUT,
                      output reg  [`SORT_WAY:0] DATAEN_OUT);
  reg               RST;
  reg [511:0]       DIN;
  reg [`SORT_WAY:0] DATAEN;
  always @(posedge CLK) RST  <= RST_IN;
  always @(posedge CLK) DIN    <= DIN_T;
  always @(posedge CLK) DATAEN <= (RST) ? 0 : DATAEN_IN;
  // Stage A
  wire [`WW] A15,A14,A13,A12,A11,A10,A09,A08,A07,A06,A05,A04,A03,A02,A01,A00; // output
  wire [`WW] a15,a14,a13,a12,a11,a10,a09,a08,a07,a06,a05,a04,a03,a02,a01,a00; // input
  assign {a15,a14,a13,a12,a11,a10,a09,a08,a07,a06,a05,a04,a03,a02,a01,a00} = DIN;
  COMPARATOR comp00(a00, a01, A00, A01);
  COMPARATOR comp01(a02, a03, A02, A03);
  COMPARATOR comp02(a04, a05, A04, A05);
  COMPARATOR comp03(a06, a07, A06, A07);
  COMPARATOR comp04(a08, a09, A08, A09);
  COMPARATOR comp05(a10, a11, A10, A11);
  COMPARATOR comp06(a12, a13, A12, A13);
  COMPARATOR comp07(a14, a15, A14, A15);
  reg [511:0]       pdA; // pipeline regester A for data
  reg [`SORT_WAY:0] pcA; // pipeline regester A for control
  always @(posedge CLK) pdA <= {A15,A14,A13,A12,A11,A10,A09,A08,A07,A06,A05,A04,A03,A02,A01,A00};
  always @(posedge CLK) pcA <= (RST) ? 0 : DATAEN;
  // Stage B
  wire [`WW] B15,B14,B13,B12,B11,B10,B09,B08,B07,B06,B05,B04,B03,B02,B01,B00; // output
  wire [`WW] b15,b14,b13,b12,b11,b10,b09,b08,b07,b06,b05,b04,b03,b02,b01,b00; // input
  assign {b15,b14,b13,b12,b11,b10,b09,b08,b07,b06,b05,b04,b03,b02,b01,b00} = pdA;
  COMPARATOR comp10(b00, b02, B00, B02);
  COMPARATOR comp11(b04, b06, B04, B06);
  COMPARATOR comp12(b08, b10, B08, B10);
  COMPARATOR comp13(b12, b14, B12, B14);
  COMPARATOR comp14(b01, b03, B01, B03);
  COMPARATOR comp15(b05, b07, B05, B07);
  COMPARATOR comp16(b09, b11, B09, B11);
  COMPARATOR comp17(b13, b15, B13, B15);
  reg [511:0]       pdB; // pipeline regester A for data
  reg [`SORT_WAY:0] pcB; // pipeline regester A for control
  always @(posedge CLK) pdB <= {B15,B14,B13,B12,B11,B10,B09,B08,B07,B06,B05,B04,B03,B02,B01,B00};
  always @(posedge CLK) pcB <= (RST) ? 0 : pcA;
  // Stage C
  wire [`WW] C15,C14,C13,C12,C11,C10,C09,C08,C07,C06,C05,C04,C03,C02,C01,C00; // output
  wire [`WW] c15,c14,c13,c12,c11,c10,c09,c08,c07,c06,c05,c04,c03,c02,c01,c00; // input
  assign {c15,c14,c13,c12,c11,c10,c09,c08,c07,c06,c05,c04,c03,c02,c01,c00} = pdB;
  assign {C00,C03,C04,C07,C08,C11,C12,C15} = {c00,c03,c04,c07,c08,c11,c12,c15};
  COMPARATOR comp20(c01, c02, C01, C02);
  COMPARATOR comp21(c05, c06, C05, C06);
  COMPARATOR comp22(c09, c10, C09, C10);
  COMPARATOR comp23(c13, c14, C13, C14);
  reg [511:0]       pdC; // pipeline regester A for data
  reg [`SORT_WAY:0] pcC; // pipeline regester A for control
  always @(posedge CLK) pdC <= {C15,C14,C13,C12,C11,C10,C09,C08,C07,C06,C05,C04,C03,C02,C01,C00};
  always @(posedge CLK) pcC <= (RST) ? 0 : pcB;
  // Stage D
  wire [`WW] D15,D14,D13,D12,D11,D10,D09,D08,D07,D06,D05,D04,D03,D02,D01,D00; // output
  wire [`WW] d15,d14,d13,d12,d11,d10,d09,d08,d07,d06,d05,d04,d03,d02,d01,d00; // input
  assign {d15,d14,d13,d12,d11,d10,d09,d08,d07,d06,d05,d04,d03,d02,d01,d00} = pdC;
  COMPARATOR comp30(d00, d04, D00,  D04);
  COMPARATOR comp31(d08, d12, D08,  D12);
  COMPARATOR comp32(d01, d05, D01,  D05);
  COMPARATOR comp33(d09, d13, D09,  D13);
  COMPARATOR comp34(d02, d06, D02,  D06);
  COMPARATOR comp35(d10, d14, D10,  D14);
  COMPARATOR comp36(d03, d07, D03,  D07);
  COMPARATOR comp37(d11, d15, D11,  D15);
  reg [511:0]       pdD; // pipeline regester A for data
  reg [`SORT_WAY:0] pcD; // pipeline regester A for control
  always @(posedge CLK) pdD <= {D15,D14,D13,D12,D11,D10,D09,D08,D07,D06,D05,D04,D03,D02,D01,D00};
  always @(posedge CLK) pcD <= (RST) ? 0 : pcC;
  // Stage E
  wire [`WW] E15,E14,E13,E12,E11,E10,E09,E08,E07,E06,E05,E04,E03,E02,E01,E00; // output
  wire [`WW] e15,e14,e13,e12,e11,e10,e09,e08,e07,e06,e05,e04,e03,e02,e01,e00; // input
  assign {e15,e14,e13,e12,e11,e10,e09,e08,e07,e06,e05,e04,e03,e02,e01,e00} = pdD;
  assign {E00,E01,E06,E07,E08,E09,E14,E15} = {e00,e01,e06,e07,e08,e09,e14,e15};
  COMPARATOR comp40(e02, e04, E02, E04);
  COMPARATOR comp41(e10, e12, E10, E12);
  COMPARATOR comp42(e03, e05, E03, E05);
  COMPARATOR comp43(e11, e13, E11, E13);
  reg [511:0]       pdE; // pipeline regester A for data
  reg [`SORT_WAY:0] pcE; // pipeline regester A for control
  always @(posedge CLK) pdE <= {E15,E14,E13,E12,E11,E10,E09,E08,E07,E06,E05,E04,E03,E02,E01,E00};
  always @(posedge CLK) pcE <= (RST) ? 0 : pcD;
  // Stage F
  wire [`WW] F15,F14,F13,F12,F11,F10,F09,F08,F07,F06,F05,F04,F03,F02,F01,F00; // output
  wire [`WW] f15,f14,f13,f12,f11,f10,f09,f08,f07,f06,f05,f04,f03,f02,f01,f00; // input
  assign {f15,f14,f13,f12,f11,f10,f09,f08,f07,f06,f05,f04,f03,f02,f01,f00} = pdE;
  assign {F00,F07,F08,F15} = {f00,f07,f08,f15};
  COMPARATOR comp50(f01, f02, F01, F02);
  COMPARATOR comp51(f03, f04, F03, F04);
  COMPARATOR comp52(f05, f06, F05, F06);
  COMPARATOR comp53(f09, f10, F09, F10);
  COMPARATOR comp54(f11, f12, F11, F12);
  COMPARATOR comp55(f13, f14, F13, F14);
  reg [511:0]       pdF; // pipeline regester A for data
  reg [`SORT_WAY:0] pcF; // pipeline regester A for control
  always @(posedge CLK) pdF <= {F15,F14,F13,F12,F11,F10,F09,F08,F07,F06,F05,F04,F03,F02,F01,F00};
  always @(posedge CLK) pcF <= (RST) ? 0 : pcE;
  // Stage G
  wire [`WW] G15,G14,G13,G12,G11,G10,G09,G08,G07,G06,G05,G04,G03,G02,G01,G00; // output
  wire [`WW] g15,g14,g13,g12,g11,g10,g09,g08,g07,g06,g05,g04,g03,g02,g01,g00; // input
  assign {g15,g14,g13,g12,g11,g10,g09,g08,g07,g06,g05,g04,g03,g02,g01,g00} = pdF;
  COMPARATOR comp60(g00, g08, G00, G08);
  COMPARATOR comp61(g01, g09, G01, G09);
  COMPARATOR comp62(g02, g10, G02, G10);
  COMPARATOR comp63(g03, g11, G03, G11);
  COMPARATOR comp64(g04, g12, G04, G12);
  COMPARATOR comp65(g05, g13, G05, G13);
  COMPARATOR comp66(g06, g14, G06, G14);
  COMPARATOR comp67(g07, g15, G07, G15);
  reg [511:0]       pdG; // pipeline regester A for data
  reg [`SORT_WAY:0] pcG; // pipeline regester A for control
  always @(posedge CLK) pdG <= {G15,G14,G13,G12,G11,G10,G09,G08,G07,G06,G05,G04,G03,G02,G01,G00};
  always @(posedge CLK) pcG <= (RST) ? 0 : pcF;
  // Stage H
  wire [`WW] H15,H14,H13,H12,H11,H10,H09,H08,H07,H06,H05,H04,H03,H02,H01,H00; // output
  wire [`WW] h15,h14,h13,h12,h11,h10,h09,h08,h07,h06,h05,h04,h03,h02,h01,h00; // input
  assign {h15,h14,h13,h12,h11,h10,h09,h08,h07,h06,h05,h04,h03,h02,h01,h00} = pdG;
  assign {H00,H01,H02,H03,H12,H13,H14,H15} = {h00,h01,h02,h03,h12,h13,h14,h15};
  COMPARATOR comp70(h04, h08, H04, H08);
  COMPARATOR comp71(h05, h09, H05, H09);
  COMPARATOR comp72(h06, h10, H06, H10);
  COMPARATOR comp73(h07, h11, H07, H11);
  reg [511:0]       pdH; // pipeline regester A for data
  reg [`SORT_WAY:0] pcH; // pipeline regester A for control
  always @(posedge CLK) pdH <= {H15,H14,H13,H12,H11,H10,H09,H08,H07,H06,H05,H04,H03,H02,H01,H00};
  always @(posedge CLK) pcH <= (RST) ? 0 : pcG;
  // Stage I
  wire [`WW] I15,I14,I13,I12,I11,I10,I09,I08,I07,I06,I05,I04,I03,I02,I01,I00; // output
  wire [`WW] i15,i14,i13,i12,i11,i10,i09,i08,i07,i06,i05,i04,i03,i02,i01,i00; // input
  assign {i15,i14,i13,i12,i11,i10,i09,i08,i07,i06,i05,i04,i03,i02,i01,i00} = pdH;
  assign {I00,I01,I14,I15} = {i00,i01,i14,i15};
  COMPARATOR comp80(i02, i04, I02, I04);
  COMPARATOR comp81(i06, i08, I06, I08);
  COMPARATOR comp82(i10, i12, I10, I12);
  COMPARATOR comp83(i03, i05, I03, I05);
  COMPARATOR comp84(i07, i09, I07, I09);
  COMPARATOR comp85(i11, i13, I11, I13);
  reg [511:0]       pdI; // pipeline regester A for data
  reg [`SORT_WAY:0] pcI; // pipeline regester A for control
  always @(posedge CLK) pdI <= {I15,I14,I13,I12,I11,I10,I09,I08,I07,I06,I05,I04,I03,I02,I01,I00};
  always @(posedge CLK) pcI <= (RST) ? 0 : pcH;
  // Stage J
  wire [`WW] J15,J14,J13,J12,J11,J10,J09,J08,J07,J06,J05,J04,J03,J02,J01,J00; // output
  wire [`WW] j15,j14,j13,j12,j11,j10,j09,j08,j07,j06,j05,j04,j03,j02,j01,j00; // input
  assign {j15,j14,j13,j12,j11,j10,j09,j08,j07,j06,j05,j04,j03,j02,j01,j00} = pdI;
  assign {J00,J15} = {j00,j15};
  COMPARATOR comp90(j01, j02, J01, J02);
  COMPARATOR comp91(j03, j04, J03, J04);
  COMPARATOR comp92(j05, j06, J05, J06);
  COMPARATOR comp93(j07, j08, J07, J08);
  COMPARATOR comp94(j09, j10, J09, J10);
  COMPARATOR comp95(j11, j12, J11, J12);
  COMPARATOR comp96(j13, j14, J13, J14);
  always @(posedge CLK) DOUT <= {J15,J14,J13,J12,J11,J10,J09,J08,J07,J06,J05,J04,J03,J02,J01,J00};
  always @(posedge CLK) DATAEN_OUT <= (RST) ? 0 : pcI;
endmodule