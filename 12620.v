module dzcpu_ucode_lut
(
	input  wire[7:0]  iMop,
	output reg [8:0]  oUopFlowIdx
);
always @ ( iMop )
begin
	case ( iMop )
	`LDSPnn: oUopFlowIdx = 9'd1;
	`LDHLnn: oUopFlowIdx = 9'd5;
	`LDHLDA: oUopFlowIdx = 9'd9;
	`MAPcb:  oUopFlowIdx = 9'd13;
	`JRNZn:  oUopFlowIdx = 9'd17;
	`LDrn_c: oUopFlowIdx = 9'd23;
	`LDrn_a: oUopFlowIdx = 9'd26;
	`LDIOCA: oUopFlowIdx = 9'd29;
	`INCr_c: oUopFlowIdx = 9'd32;
	`LDHLmr_a: oUopFlowIdx = 9'd33;
	`LDIOnA: oUopFlowIdx = 9'd36;
	`LDDEnn: oUopFlowIdx = 9'd43;
	`LDADEm: oUopFlowIdx = 9'd94;
	`CALLnn: oUopFlowIdx = 9'd49;
	`LDrn_b: oUopFlowIdx = 9'd60;
	`PUSHBC: oUopFlowIdx = 9'd63;
	`RLA:    oUopFlowIdx = 9'd70;	//TODO: Make sure this is OK!
	`POPBC:  oUopFlowIdx = 9'd71;
	`DECr_b: oUopFlowIdx = 9'd300;
	`LDHLIA: oUopFlowIdx = 9'd78;
	`INCHL:  oUopFlowIdx = 9'd82;
	`RET:    oUopFlowIdx = 9'd252;//8'd83;
	`INCDE:  oUopFlowIdx = 9'd89;
	`CPn:    oUopFlowIdx = 9'd90;
	`LDmmA: oUopFlowIdx  = 9'd98;
	`DECr_a: oUopFlowIdx = 9'd47;
	`DECr_c: oUopFlowIdx = 9'd48;
	`JRZn:   oUopFlowIdx = 9'd106;
	`LDrn_l: oUopFlowIdx = 9'd112;
	`JRn:    oUopFlowIdx = 9'd115;
	`INCr_b: oUopFlowIdx = 9'd161;
	`LDrn_e: oUopFlowIdx = 9'd121;
	`LDAIOn: oUopFlowIdx = 9'd124;
	`INCr_h: oUopFlowIdx = 9'd312;
	`SUBr_b: oUopFlowIdx = 9'd132;
	`DECr_d: oUopFlowIdx = 9'd135;
	`LDrn_d: oUopFlowIdx = 9'd136;
	`JPnn:   oUopFlowIdx = 9'd139;
	`LDrn_h: oUopFlowIdx = 9'd146;
	`LDAHLI: oUopFlowIdx = 9'd149;
	`LDHLmn: oUopFlowIdx = 9'd154;
	`NOP:    oUopFlowIdx = 9'd162;
  `DI:     oUopFlowIdx = 9'd163;
  `INCr_d: oUopFlowIdx = 9'd164;
  `INCr_e: oUopFlowIdx = 9'd250; //8'd165;
  `DECr_e: oUopFlowIdx = 9'd166;
  `DECDE:  oUopFlowIdx = 9'd168;
	`DECBC:  oUopFlowIdx = 9'd169; //OK
  `DECr_h: oUopFlowIdx = 9'd170;
  `DECHL:  oUopFlowIdx = 9'd172;
  `INCr_a: oUopFlowIdx = 9'd302;
	`INCSP:  oUopFlowIdx = 9'd304;
	`DECSP:  oUopFlowIdx = 9'd306;
	`INCr_l: oUopFlowIdx = 9'd308;
	`DECr_l: oUopFlowIdx = 9'd310;
	`ADDr_a: oUopFlowIdx = 9'd175;
	`ADDr_b: oUopFlowIdx = 9'd178;
	`SUBr_c: oUopFlowIdx = 9'd181;
	`ADDr_c: oUopFlowIdx = 9'd184;
	`ADDr_d: oUopFlowIdx = 9'd187;
	`ADDr_e: oUopFlowIdx = 9'd190;
	`ADDr_h: oUopFlowIdx = 9'd193;
	`ADDr_l: oUopFlowIdx = 9'd196;
	`SUBr_d: oUopFlowIdx = 9'd199;
	`SUBr_e: oUopFlowIdx = 9'd202;
	`SUBr_h: oUopFlowIdx = 9'd205;
	`SUBr_l: oUopFlowIdx = 9'd208;
	`SUBr_a: oUopFlowIdx = 9'd211;
	`PUSHDE: oUopFlowIdx = 9'd214;
	`PUSHHL: oUopFlowIdx = 9'd220;
	`POPDE:  oUopFlowIdx = 9'd226;
	`POPHL:  oUopFlowIdx = 9'd232;
	`LDHLmr_b: oUopFlowIdx = 9'd238;
	`LDHLmr_c: oUopFlowIdx = 9'd241;
	`LDHLmr_d: oUopFlowIdx = 9'd244;
	`LDDEmA:   oUopFlowIdx = 9'd247;
	`PUSHAF:   oUopFlowIdx = 9'd261;
	`POPAF:    oUopFlowIdx = 9'd267;
	`LDBCnn:   oUopFlowIdx = 9'd273;
	`INCBC:    oUopFlowIdx = 9'd83;
	`LDAmm:    oUopFlowIdx = 9'd280;
	`ANDn:     oUopFlowIdx = 9'd85;
	`CALLNZnn: oUopFlowIdx = 9'd289;
	`ADDn:     oUopFlowIdx = 9'd314;
	`SUBn:     oUopFlowIdx = 9'd319;
	`CPr_c:    oUopFlowIdx = 9'd324;
	`LDrHLm_b: oUopFlowIdx = 9'd327;
	`LDrHLm_c: oUopFlowIdx = 9'd331;
	`LDrHLm_d: oUopFlowIdx = 9'd335;
	`XORHL:    oUopFlowIdx = 9'd339;
	`ADCn:     oUopFlowIdx = 9'd345;
	`ADDHLDE:  oUopFlowIdx = 9'd351;
	`JRNCn:    oUopFlowIdx = 9'd414;
	`XORn:     oUopFlowIdx = 9'd359;
	`RRA:      oUopFlowIdx = 9'd363;
	`RETNC:    oUopFlowIdx = 9'd365;
	`RETZ:     oUopFlowIdx = 9'd377;
	`ORHL:     oUopFlowIdx = 9'd387;
	`DECHLm:   oUopFlowIdx = 9'd391;
	`LDrHLm_l: oUopFlowIdx = 9'd397;
	`RETNZ:    oUopFlowIdx = 9'd401;
	`ADDHLHL:  oUopFlowIdx = 9'd411;
  `ANDHL:    oUopFlowIdx = 9'd420;
	`LDHLmr_e: oUopFlowIdx = 9'd424;
	`LDHLmr_h: oUopFlowIdx = 9'd427;
	`LDHLmr_l: oUopFlowIdx = 9'd430;
	`LDABCm:   oUopFlowIdx = 9'd433;
	`LDrHLm_a: oUopFlowIdx = 9'd437;
	`LDrHLm_e: oUopFlowIdx = 9'd441;
	`LDrHLm_h: oUopFlowIdx = 9'd445;
	`ADCr_a:   oUopFlowIdx = 9'd449;
	`ADCr_b:   oUopFlowIdx = 9'd453;
	`ADCr_c:   oUopFlowIdx = 9'd457;
	`ADCr_d:   oUopFlowIdx = 9'd461;
	`ADCr_e:   oUopFlowIdx = 9'd465;
	`ADCr_h:   oUopFlowIdx = 9'd469;
	`ADCr_l:   oUopFlowIdx = 9'd473;
	default:
			 oUopFlowIdx = 9'd278;
	endcase
end
endmodule