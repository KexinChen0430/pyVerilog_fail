module tb();
	reg [17:0] ins;
	reg clk;
	cpu cpu1(ins, clk);
	task setr;
		input [3:0]ra;
		input [31:0] rv;
		begin
			cpu1.regs.regs[ra] = rv;
		end
	endtask
	task pregs;
		integer i;
		begin
			$display("regs:");
			for(i = 0; i < 32; i = i + 1) begin
				$display("\t%d:%d",i, cpu1.regs.regs[i]);
			end
		end
	endtask
	task proc;
		input [17:0]cins;
		reg [3:0] op;
		reg [4:0] rdest;
		reg [4:0] rs1;
		reg [4:0] rs2;
		begin
			op = cins[17:15];
			rdest = cins[14:10];
			rs1 = cins[9:5];
			rs2 = cins[4:0];
			ins = cins;
			#10 clk = 1;
			#10 clk = 0;
			#10;
			$display("op: %3b; rs1(%2d): %d; rs2(%2d): %d; rdest(%2d): %d",
				op, rs1, cpu1.regs.regs[rs1], rs2,
				cpu1.regs.regs[rs2], rdest,
				cpu1.regs.regs[rdest]);
		end
	endtask
	initial begin
		clk = 0;
		setr(1, 5);
		setr(2, 6);
		/*    add  %0,   %2,   %1   #  %0 = %1 + %2 */
		proc('b000_00000_00010_00001);
		/*    XOR  %3,   %2    %1   # %3 = %0 ^ %2 */
		proc('b100_00011_00010_00001);
		/*    sll  %4,   %3,   5    # %4 = %3 << 5 */
		proc('b110_00100_00011_00101);
		/*    slr  %5,   %4,   4    # %5 = %4 << 4 */
		proc('b111_00101_00100_00100);
		/*    sgt  %6,   %5,   %4   # %6 = %5 > %4 */
		proc('b101_00110_00101_00100);
		/*    sgt  %6,   %4,   %5   # %6 = %4 > %5 */
		proc('b101_00110_00100_00101);
		/*    nand  %7,   %6,   %5   # %7 = %6 ~& %5 */
		proc('b010_00111_00110_00101);
		/*    or   %8,   %6,   %5   # %8 = %6 | %5 */
		proc('b011_01000_00110_00101);
		/*    and   %25,   %8,   %5   # %25 = %8 & %5 */
		proc('b001_11001_01000_00101);
		pregs();
	end
endmodule