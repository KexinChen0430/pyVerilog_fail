module ROM
(
	input  wire[15:0]  		iAddress,
	output reg [27:0] 		oInstruction
);
always @ ( iAddress )
begin
	case (iAddress)
/*
	0: oInstruction = { `NOP ,24'd4000    };
	1: oInstruction = { `STO , `R7,16'b0001 };
	2: oInstruction = { `STO ,`R3,16'h1     };
	3: oInstruction = { `STO, `R4,16'd1000 };
	4: oInstruction = { `STO, `R5,16'd0     };  //j
//LOOP2:
	5: oInstruction = { `LED ,8'b0,`R7,8'b0 };
	6: oInstruction = { `STO ,`R1,16'h0     };
	7: oInstruction = { `STO ,`R2,16'd5000 };
//LOOP1:
	8: oInstruction = { `ADD ,`R1,`R1,`R3    };
	9: oInstruction = { `BLE ,`LOOP1,`R1,`R2 };
	10: oInstruction = { `ADD ,`R5,`R5,`R3    };
	11: oInstruction = { `BLE ,`LOOP2,`R5,`R4 };
	12: oInstruction = { `NOP ,24'd4000       };
	13: oInstruction = { `SUB ,`R7,`R7,`R3    };
	14: oInstruction = { `JMP ,  8'd2,16'b0   };
	*/
	0: oInstruction = { `NOP ,24'd4000    };
	1: oInstruction = { `STO ,`R1, 16'h0002};
	2: oInstruction = { `STO ,`R2, 16'h0005};
	3: oInstruction = { `STO ,`R3, 16'h0008};
	4: oInstruction = { `CALL, 8'd14, 16'd0};
	5: oInstruction = { `STO ,`R0, 16'h0000};
	6: oInstruction = { `CALL, 8'd9, 16'b0   };
	7: oInstruction = { `NOP , 24'd4000      };
	8: oInstruction = { `JMP , 8'd7, 16'b0   };
//Fun R2++
	9: oInstruction = { `STO ,`R1, 16'h0001};
	10: oInstruction = {`ADD ,`R2, `R2, `R1};
	11: oInstruction = {`NOP ,24'd4000 };
	12: oInstruction = {`RET ,24'd0    };
	13: oInstruction = {`NOP ,24'd4000 };
//Fun R1 = R2*R3
	14: oInstruction = {`STO ,`R1, 16'h0000};
	15: oInstruction = {`STO ,`R4, 16'h0001};
	16: oInstruction = {`ADD ,`R1, `R1, `R2};
	17: oInstruction = {`SUB ,`R3, `R3, `R4};
	18: oInstruction = {`BLE ,8'd16, `R4, `R3};
	19: oInstruction = {`RET ,24'd0	};
	default:
		oInstruction = { `LED ,  24'b10101010 };		//NOP
	endcase
end
endmodule