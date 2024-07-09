module ag_test(
    input clk10
    );
	wire clk1, clkx;
	my_clk_div#10 c10(clk10, clk1);
	my_clk_div#100 c100(clk1, clkx);
	wire[13:0] AB2 = 0;
	wire[15:0] DI2;
	wire [15:0] AB;	// address bus
	wire [7:0] DI;		// data in, read bus
	wire [7:0] DO;		// data out, write bus
	wire read;
	wire rom_cs, ram_cs;
	wire phi_1, phi_2;
	wire clk_vram = 0;
//	RAM32Kx8x16 base_ram(phi_2, AB[14:0], ram_cs, read, DI, DO,
//							clk_vram, AB2, 1, DI2);
	RAM32kx8 base_ram(phi_2, AB[14:0], ram_cs, read, DI, DO);
	RAM2kx8 rom1(phi_2, AB[10:0], rom_cs, read, DI, DO);
	wire [3:0] AB_HH = AB[15:12];
	wire [3:0] AB_HL = AB[11:8];
	wire [3:0] AB_LH = AB[7:4];
	wire [3:0] AB_LL = AB[3:0];
	wire [7:0] AB_H = AB[15:8];
	wire [7:0] AB_L = AB[7:0];
	wire AB_CXXX = (AB_HH == 4'hC);
	wire AB_FXXX = (AB_HH == 4'hF);
	wire AB_C0XX = AB_CXXX && !AB_HL;
	wire AB_C00X = AB_C0XX && (AB_LH == 4'h0);
	wire AB_C01X = AB_C0XX && (AB_LH == 4'h1);
	wire AB_C02X = AB_C0XX && (AB_LH == 4'h2);
	wire AB_C03X = AB_C0XX && (AB_LH == 4'h3);
	wire AB_C04X = AB_C0XX && (AB_LH == 4'h4);
	wire AB_C05X = AB_C0XX && (AB_LH == 4'h5);
	wire AB_C7XX = AB_CXXX && (AB_HL == 4'h7);
	reg timer_ints = 1;
	assign rom_cs = AB_FXXX && AB[11]; // F800-FFFF
	assign ram_cs = !AB[15];
	assign xram_cs = (AB_HH[3:1] == 3'b100);
	reg reset_auto = 1;
	wire reset;
	wire WE = ~read;		// write enable
	supply0 IRQ;		// interrupt request
	wire NMI;		// non-maskable interrupt request
	supply1 RDY;		// Ready signal. Pauses CPU when RDY=0
	supply1 SO;			// Set Overflow, not used.
	wire SYNC;
	assign NMI = clkx;
	reg[7:0] vmode = 0;
	wire[7:0] key_reg;
	reg[7:0] b_reg;
	reg lb;
	wire key_rus = 0;
	reg key_clear = 0;
	wire key_rst = 0, key_pause = 0;
	reg beep_reg = 0, tape_out_reg = 0;
	assign reset  = 0;//btns[0];
	assign DI = (AB_C00X && !WE)?b_reg?b_reg:key_reg:8'bZ;
	always @(negedge clkx) begin
		reset_auto <= 0;
	end
	ag6502_ext_clock#(2,1) clk(clk10, clk1, phi_1, phi_2);
	ag6502 cpu(clk1, phi_1, phi_2, AB, read, DI, DO,
					RDY & ~key_pause, ~(reset | reset_auto | key_rst), ~IRQ, ~NMI, SO, SYNC);
endmodule