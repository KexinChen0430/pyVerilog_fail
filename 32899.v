module alu (reg_A,reg_B,ctrl_ww,alu_op,result);
	// Output signals...
	// Result from copmputing an arithmetic or logical operation
	output [0:127] result;
	/**
	 */
	// ===============================================================
	// Input signals
	// Input register A
	input [0:127] reg_A;
	// Input register B
	input [0:127] reg_B;
	// Control signal bits - ww
	input [0:1] ctrl_ww;
	/**
	 */
	input [0:4] alu_op;
	/**
	 */
	// Defining constants: parameter [name_of_constant] = value;
	// ===============================================================
	// Declare "wire" signals:
	//wire FSM_OUTPUT;
	// ===============================================================
	// Declare "reg" signals:
	reg [0:127] result;		// Output signals
	// ===============================================================
	always @(reg_A or reg_B or ctrl_ww or alu_op)
	begin
		/**
		 */
		case(alu_op)
			// ======================================================
			// Unsigned Multiplication - even subfields
			`aluwmuleu:
			begin
				case(ctrl_ww)
					`w8:	// aluwsrl AND `aa AND `w8
					begin
						result[0:15]=reg_A[0:7]*reg_B[0:7];
						result[16:31]=reg_A[16:23]*reg_B[16:23];
						result[32:47]=reg_A[32:39]*reg_B[32:39];
						result[48:63]=reg_A[48:55]*reg_B[48:55];
						result[64:79]=reg_A[64:71]*reg_B[64:71];
						result[80:95]=reg_A[80:87]*reg_B[80:87];
						result[96:111]=reg_A[96:103]*reg_B[96:103];
						result[112:127]=reg_A[112:119]*reg_B[112:119];
					end
					`w16:	// aluwsrl AND `aa AND `w16
					begin
						result[0:31]=reg_A[0:15]*reg_B[0:15];
						result[32:63]=reg_A[32:47]*reg_B[32:47];
						result[64:95]=reg_A[64:79]*reg_B[64:79];
						result[96:127]=reg_A[96:111]*reg_B[96:111];
					end
					default:	// aluwsrl AND `aa AND Default
						begin
						result=128'd0;
						end
					endcase
			end
			// Unsigned Multiplication - odd subfields
			`aluwmulou:
			begin
				case(ctrl_ww)
					`w8:	// aluwsrl AND `aa AND `w8
					begin
						result[0:15]=reg_A[8:15]*reg_B[8:15];
						result[16:31]=reg_A[24:31]*reg_B[24:31];
						result[32:47]=reg_A[40:47]*reg_B[40:47];
						result[48:63]=reg_A[56:63]*reg_B[56:63];
						result[64:79]=reg_A[72:79]*reg_B[72:79];
						result[80:95]=reg_A[88:95]*reg_B[88:95];
						result[96:111]=reg_A[104:111]*reg_B[104:111];
						result[112:127]=reg_A[120:127]*reg_B[120:127];
					end
					`w16:	// aluwsrl AND `aa AND `w16
					begin
						result[0:31]=reg_A[16:31]*reg_B[16:31];
						result[32:63]=reg_A[48:63]*reg_B[48:63];
						result[64:95]=reg_A[80:95]*reg_B[80:95];
						result[96:127]=reg_A[112:127]*reg_B[112:127];
					end
					default:	// aluwsrl AND `aa AND Default
						begin
						result=128'd0;
						end
					endcase
			end
			default:
			begin
				// Default arithmetic/logic operation
				result=128'd0;
			end
		endcase
	end
endmodule