module main;
reg clk;
reg cpu;
wire [3:0]  led;
reg  [7:0]  data8_in;
wire [7:0]  data8_out;
wire [19:0] address;
wire        wren;
// Ïîðòû
wire [15:0] port_addr;
wire [7:0]  port_data;  // Äàííûå â ïîðò
wire [7:0]  port_out;   // Äàííûå èç ïîðòà
wire        port_clock;
// VGA-áîðäþð
wire [2:0]  vga_border;
//óñòàíàâëèâàåì ýêçåìïëÿð òåñòèðóåìîãî ìîäóëÿ
cpu CPU(cpu, data8_in, data8_out, address, wren, led, port_addr, port_data, port_out, port_clock);
port PORT(port_clock, port_addr, port_data, port_out, vga_border);
//ìîäåëèðóåì ñèãíàë òàêòîâîé ÷àñòîòû
always #1 clk = ~clk;
always #4 cpu = ~cpu;
//îò íà÷àëà âðåìåíè...
initial begin
  clk = 0;
  cpu = 0;
  #2000 $finish; // çàêàí÷èâàåì ñèìóëÿöèþ
end
// ñîçäàåì ôàéë VCD äëÿ ïîñëåäóþùåãî àíàëèçà ñèãíàëîâ
initial
begin
  $dumpfile("output.vcd");
  $dumpvars(0, CPU);
  $dumpvars(0, PORT);
end
// Âñÿ ïàìÿòü
reg [7:0]  sdram[1048576];
reg [8:0]  b8;
reg        wren_already; // Óæå çàïèñûâàëè?
// Ñèìóëÿöèÿ çàïèñè â ïàìÿòü
always @(posedge clk) begin
    // Ëàã - 1Ò, äëÿ òåñòðîâàíèÿ äîñòàòî÷íî
    data8_in <= sdram[ address ];
    if (wren) begin
        // Ñòðîá çàïèñè - çàïèñü èäåò íà CLOCK=0
        if (!cpu && !wren_already) begin
            sdram[ address ] <= data8_out[7:0];
            wren_already     <= 1'b1;
        end
        // Ñáðîñ => 0, åñëè òàêò CPU = 1
        else if (cpu) begin
            wren_already <= 1'b0;
        end
    end
end
initial begin
    b8       = 1'b0;
    data8_in = 1'b0;
    // Ïîäêëþ÷èòü ôàéë ñ èíèöèàëèçàöèåé ïàìÿòè
    `include "icarus_memory.v"
end
endmodule