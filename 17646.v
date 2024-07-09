module mu80(
    input wire clock_100,
    /* 4 x LED */
    output wire [3:0] led,
    /* VGA PINOUTS */
    output wire [4:0] r,
    output wire [5:0] g,
    output wire [4:0] b,
    output wire       hs,
    output wire       vs
);
assign led = {cpu_led, locked, clock_cpu};
// Îáúÿâëåíèå êîíñòàíò
    wire [3:0]  cpu_led;
    wire [15:0] address;     // Àäðåñóåìàÿ ÂÑß ïàìÿòü
    wire        locked;
    wire        clock_25;    // Äåëåííàÿ íà 4 ñêîðîñòü ïðîöåññîðà (25 ìãö)
    wire        clock_12;
    wire        clock_6;
    wire        clock_cpu = clock_25; // CPU clock
    // Çàïèñü äàííûõ â ïàìÿòè
    reg  wren_100mhz = 1'b0;
// ÃÅÍÅÐÀÒÎÐ PLL. Ãåíåðèðóåò èìïóëüñû èç 100 ìãö â 25 ìãö (îñíîâíàÿ ÷àñòîòà).
    pll PLL(.inclk0(clock_100), .c0(clock_25), .c1(clock_12), .c2(clock_6), .locked(locked));
// ÏÀÌßÒÜ ROM  (16 êèëîáàéò) $0000-$3FFF
// ÏÀÌßÒÜ RAM  (16 êèëîáàéò) $4000-$7FFF
    // Óêàçàòåëü íà âèäåîïàìÿòü
    wire [13:0] address_vm;
    // Data Memory IO
    wire [7:0] data8_rom;
    wire [7:0] data8_ram;
    wire [7:0] data8_vid;
    wire [7:0] data8_w;
    reg  [7:0] data8;
    // Write Enabled
    reg  wren_ram;
    reg  wren_distr;
    wire wren;
    // Ïîðòû
    wire        port_clock;
    wire [15:0] port_addr;
    wire [7:0]  port_data;
    wire [7:0]  port_in;
    wire [2:0]  vga_border;
    // Çàïèñü â ïàìÿòü íà CLOCK = 0
    always @(posedge clock_100) begin
        // Ïðè âûñîêîì ñèãíàëå CLK25 îñòàíàâëèâàòü çàïèñü
        if (clock_cpu) begin
            wren_100mhz <= 1'b0;
            wren_distr  <= 1'b0;
        end
        // Ïðè ïåðâîì íèçêîì ñèãíàëå çàïèñàòü òîëüêî 1 ðàç
        else if (!clock_cpu && !wren_100mhz) begin
            wren_100mhz <= 1'b1;
            wren_distr  <= wren;
        end
    end
    // $0000-$3FFF 16 êá ROM
    rom  ROM(
        .clock   (clock_100),
        .addr_rd (address[13:0]),
        .q       (data8_rom)
    );
    // $4000-$7FFF 16 êá RAM
    ram  RAM(
        .clock   (clock_100),
        // Read/Write
        .addr_rw (address[13:0]),
        .data    (data8_w),
        .wren    (wren_ram & wren_distr),
        .q_rw    (data8_ram),
        // Video Adapter
        .addr_rd (address_vm[13:0]),
        .q       (data8_vid)
    );
// Ìàïïåð äàííûõ èç ðàçíûõ èñòî÷íèêîâ
    // Ðàñïðåäåëåíèå, îòêóäà áðàòü äàííûå (ROM, RAM, SDRAM)
    always @* begin
        // ROM 16K
        if (address < 16'h4000)       begin data8[7:0] = data8_rom[7:0]; wren_ram = 1'b0; end
        // RAM 16K
        else if (address < 16'h8000)  begin data8[7:0] = data8_ram[7:0]; wren_ram = 1'b1; end
    end
// Öåíòðàëüíûé ïðîöåññîð. ßäðî âñåé ñèñòåìû.
    cpu CPU(
        .clock   (clock_cpu & locked),
        .din     (data8),
        .dout    (data8_w),
        .address (address),
        .wren    (wren),
        .led     (cpu_led),
        // Ïîðòû, ñâÿçü ñ ìèðîì
        .port_clock (port_clock), // Ñòðîá äëÿ çàïèñè â ïîðò
        .port_addr  (port_addr),
        .port_in    (port_in),    // PORT <-- CPU
        .port_data  (port_data),  // CPU  --> PORT
    );
// Êîíòðîëëåð ïîðòîâ ââîäà-âûâîäà
    port PORT(
        .clock      (port_clock),
        .addr       (port_addr),
        .data_in    (port_data),
        .data_out   (port_in),
        .vga_border (vga_border),
    );
// Âèäåîàäàïòåð [ïîêà ÷òî disabled]
    video VID(
        .clock   (clock_25),
        // Äàííûå
        .d8_chr  (data8_vid),
        .addr    (address_vm),
        // Âèäåîâûõîä
        .r(r),
        .g(g),
        .b(b),
        .hs(hs),
        .vs(vs)
    );
endmodule