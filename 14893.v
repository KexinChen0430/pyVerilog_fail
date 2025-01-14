module scancode_to_sam (
    input wire clk,  // el mismo clk de ps/2
    input wire rst,
    input wire scan_received,
    input wire [7:0] scan,
    input wire extended,
    input wire released,
    input wire kbclean,
    input wire [8:0] sam_row,
    output wire [7:0] sam_col,
    output wire user_reset,
    output wire master_reset,
    output wire user_nmi,
    output wire [1:0] user_toggles,
    input wire [7:0] din,
    output reg [7:0] dout,
    input wire cpuwrite,
    input wire cpuread,
    input wire rewind
    );
    // las teclas del SAM. Se inicializan a "no pulsadas".
    reg [7:0] row[0:8];
    initial begin
        row[0] = 8'hFF;
        row[1] = 8'hFF;
        row[2] = 8'hFF;
        row[3] = 8'hFF;
        row[4] = 8'hFF;
        row[5] = 8'hFF;
        row[6] = 8'hFF;
        row[7] = 8'hFF;
        row[8] = 8'hFF;
    end
    // El gran mapa de teclado y sus registros de acceso
    reg [7:0] keymap[0:16383];  // 16K x 8 bits
    reg [13:0] addr = 14'h0000;
    reg [13:0] cpuaddr = 14'h0000;  // Dirección E/S desde la CPU. Se autoincrementa en cada acceso
    initial begin
        $readmemh ("keyb_es_hex.txt", keymap);
    end
    reg [3:0] keyrow1 = 4'h0;
    reg [7:0] keycol1 = 8'h00;
    reg [3:0] keyrow2 = 4'h0;
    reg [7:0] keycol2 = 8'h00;
    reg [2:0] keymodifiers = 3'b000;
    reg [2:0] signalstate = 3'b000;
    reg [1:0] togglestate = 2'b00;
    reg rmaster_reset = 1'b0, ruser_reset = 1'b0, ruser_nmi = 1'b0;
    reg [1:0] ruser_toggles = 2'b00;
    assign master_reset = rmaster_reset;
    assign user_reset = ruser_reset;
    assign user_nmi = ruser_nmi;
    assign user_toggles = ruser_toggles;
    // Asi funciona la matriz de teclado cuando se piden semifilas
    // desde la CPU.
    // Un always @* hubiera quedado más claro en la descripción
    // pero por algun motivo, el XST no lo ha admitido en este caso
    assign sam_col = ((sam_row[0] == 1'b0)? row[0] : 8'hFF) &
                     ((sam_row[1] == 1'b0)? row[1] : 8'hFF) &
                     ((sam_row[2] == 1'b0)? row[2] : 8'hFF) &
                     ((sam_row[3] == 1'b0)? row[3] : 8'hFF) &
                     ((sam_row[4] == 1'b0)? row[4] : 8'hFF) &
                     ((sam_row[5] == 1'b0)? row[5] : 8'hFF) &
                     ((sam_row[6] == 1'b0)? row[6] : 8'hFF) &
                     ((sam_row[7] == 1'b0)? row[7] : 8'hFF) &
                     ((sam_row[8] == 1'b0)? row[8] : 8'hFF);
    reg [2:0] modifiers = 3'b000;
    reg [3:0] keycount = 4'b0000;
    parameter
        CLEANMATRIX = 4'd0,
        IDLE        = 4'd1,
        ADDR0PUT    = 4'd2,
        ADDR1PUT    = 4'd3,
        ADDR2PUT    = 4'd4,
        ADDR3PUT    = 4'd5,
        TRANSLATE1  = 4'd6,
        TRANSLATE2  = 4'd7,
        TRANSLATE3  = 4'd8,
        CPUTIME     = 4'd9,
        CPUREAD     = 4'd10,
        CPUWRITE    = 4'd11,
        CPUINCADD   = 4'd12,
        UPDCOUNTERS1= 4'd13,
        UPDCOUNTERS2= 4'd14;
    reg [3:0] state = CLEANMATRIX;
    reg key_is_pending = 1'b0;
    always @(posedge clk) begin
        if (scan_received == 1'b1)
            key_is_pending <= 1'b1;
        if (rst == 1'b1 || (kbclean == 1'b1 && state == IDLE && scan_received == 1'b0))
            state <= CLEANMATRIX;
        else begin
            case (state)
                CLEANMATRIX: begin
                    modifiers <= 3'b000;
                    keycount <= 4'b0000;
                    row[0] <= 8'hFF;
                    row[1] <= 8'hFF;
                    row[2] <= 8'hFF;
                    row[3] <= 8'hFF;
                    row[4] <= 8'hFF;
                    row[5] <= 8'hFF;
                    row[6] <= 8'hFF;
                    row[7] <= 8'hFF;
                    row[8] <= 8'hFF;
                    state <= IDLE;
                end
                IDLE: begin
                    if (key_is_pending == 1'b1) begin
                        addr <= {modifiers, extended, scan, 2'b00};  // 1 scan tiene 8 bits + 1 bit para indicar scan extendido + 3 bits para el modificador usado
                        state <= ADDR0PUT;
                        key_is_pending <= 1'b0;
                    end
                    else if (cpuread == 1'b1 || cpuwrite == 1'b1 || rewind == 1'b1)
                        state <= CPUTIME;
                end
                ADDR0PUT: begin
                    {keyrow1,keycol1[7:4]} <= keymap[addr];
                    addr <= {modifiers, extended, scan, 2'b01};
                    state <= ADDR1PUT;
                end
                ADDR1PUT: begin
                    {keycol1[3:0],keyrow2} <= keymap[addr];
                    addr <= {modifiers, extended, scan, 2'b10};
                    state <= ADDR2PUT;
                end
                ADDR2PUT: begin
                    {keycol2} <= keymap[addr];
                    addr <= {modifiers, extended, scan, 2'b11};
                    state <= ADDR3PUT;
                end
                ADDR3PUT: begin
                    {signalstate,keymodifiers,togglestate} <= keymap[addr];
                    state <= TRANSLATE1;
                end
                TRANSLATE1: begin
                    // Actualiza las 8 semifilas del teclado con la primera tecla
                    if (~released) begin
                      if (keyrow1[3] == 1'b1)
                        row[8] <= row[8] & ~keycol1;
                      else
                        row[keyrow1[2:0]] <= row[keyrow1[2:0]] & ~keycol1;
                    end
                    else begin
                      if (keyrow1[3] == 1'b1)
                        row[8] <= row[8] | keycol1;
                      else
                        row[keyrow1[2:0]] <= row[keyrow1[2:0]] | keycol1;
                    end
                    state <= TRANSLATE2;
                end
                TRANSLATE2: begin
                    // Actualiza las 8 semifilas del teclado con la segunda tecla
                    if (~released) begin
                      if (keyrow2[3] == 1'b1)
                        row[8] <= row[8] & ~keycol2;
                      else
                        row[keyrow2[2:0]] <= row[keyrow2[2:0]] & ~keycol2;
                    end
                    else begin
                      if (keyrow2[3] == 1'b1)
                        row[8] <= row[8] | keycol2;
                      else
                        row[keyrow2[2:0]] <= row[keyrow2[2:0]] | keycol2;
                    end
                    state <= TRANSLATE3;
                end
                TRANSLATE3: begin
                    // Actualiza modificadores
                    if (~released)
                        modifiers <= modifiers | keymodifiers;
                    else
                        modifiers <= modifiers & ~keymodifiers;
                    // Y de la misma forma tendria que actualizar resets y los user_toogles
                    if (~released)
                        {rmaster_reset,ruser_reset,ruser_nmi} <= {rmaster_reset,ruser_reset,ruser_nmi} | signalstate;
                    else
                        {rmaster_reset,ruser_reset,ruser_nmi} <= {rmaster_reset,ruser_reset,ruser_nmi} & ~signalstate;
                    if (~released)
                        ruser_toggles <= ruser_toggles | togglestate;
                    else
                        ruser_toggles <= ruser_toggles & ~togglestate;
                    //state <= UPDCOUNTERS1;
                    state <= IDLE;
                end
                CPUTIME: begin
                    if (rewind == 1'b1) begin
                        cpuaddr <= 14'h0000;
                        state <= IDLE;
                    end
                    else if (cpuread == 1'b1) begin
                        addr <= cpuaddr;
                        state <= CPUREAD;
                    end
                    else if (cpuwrite == 1'b1) begin
                        addr <= cpuaddr;
                        state <= CPUWRITE;
                    end
                    else
                        state <= IDLE;
                end
                CPUREAD: begin   // CPU wants to read from keymap
                    dout <= keymap[addr];
                    state <= CPUINCADD;
                end
                CPUWRITE: begin
                    keymap[addr] <= din;
                    state <= CPUINCADD;
                end
                CPUINCADD: begin
                    if (cpuread == 1'b0 && cpuwrite == 1'b0) begin
                        cpuaddr <= cpuaddr + 1;
                        state <= IDLE;
                    end
                end
                default: begin
                    state <= IDLE;
                end
            endcase
        end
    end
endmodule