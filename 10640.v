module AddrDecoder(reqType, ofs, base, count, lbType, addr, invalid);
	input [5:0] reqType;
	input [15:0] ofs;
	input [15:0] base;
	input [15:0] count;
	input [5:0] lbType;
	output [15:0] addr;
	output invalid;
	assign addr = base + ofs;
	assign invalid = !(
		isValidLabelType(reqType) &&
		reqType == lbType &&
		ofs < count
	);
	function isValidLabelType(input [5:0] type);
		case(reqType)
			//`LBTYPE_UNDEFINED:;
			`LBTYPE_VPTR:	isValidLabelType = 1'd1;
			`LBTYPE_SINT8:	isValidLabelType = 1'd1;
			`LBTYPE_UINT8:	isValidLabelType = 1'd1;
			`LBTYPE_SINT16:	isValidLabelType = 1'd1;
			`LBTYPE_UINT16:	isValidLabelType = 1'd1;
			`LBTYPE_SINT32:	isValidLabelType = 1'd1;
			`LBTYPE_UINT32:	isValidLabelType = 1'd1;
			`LBTYPE_SINT4:	isValidLabelType = 1'd1;
			`LBTYPE_UINT4:	isValidLabelType = 1'd1;
			`LBTYPE_SINT2:	isValidLabelType = 1'd1;
			`LBTYPE_UINT2:	isValidLabelType = 1'd1;
			`LBTYPE_SINT1:	isValidLabelType = 1'd1;
			`LBTYPE_UINT1:	isValidLabelType = 1'd1;
			`LBTYPE_CODE:	isValidLabelType = 1'd1;
			default:	isValidLabelType = 1'd0;
		endcase
	endfunction
endmodule