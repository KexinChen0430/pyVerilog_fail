module {name} (
input  [11:0] address,
output [17:0] instruction,
input         enable,
input         clk);
wire [13:0] address_a;
wire [17:0] data_in_a;
wire [17:0] data_out_a;
wire [13:0] address_b;
wire [17:0] data_in_b;
wire [17:0] data_out_b;
wire        enable_b;
wire        clk_b;
wire [3:0]  we_b;
assign address_a = {address[9:0], 4'b1111};
assign instruction = data_out_a[17:0];
assign data_in_a = {16'h0000, address[11:10]};
assign address_b = 14'b11111111111111;
assign data_in_b = data_out_b[17:0];
assign enable_b = 1'b0;
assign we_b = 4'h0;
assign clk_b = 1'b0;
RAMB18E1 # ( .READ_WIDTH_A              (18),
             .WRITE_WIDTH_A             (18),
             .DOA_REG                   (0),
             .INIT_A                    (16'b000000000000000000),
             .RSTREG_PRIORITY_A         ("REGCE"),
             .SRVAL_A                   (36'h000000000000000000),
             .WRITE_MODE_A              ("WRITE_FIRST"),
             .READ_WIDTH_B              (18),
             .WRITE_WIDTH_B             (18),
             .DOB_REG                   (0),
             .INIT_B                    (36'h000000000000000000),
             .RSTREG_PRIORITY_B         ("REGCE"),
             .SRVAL_B                   (36'h000000000000000000),
             .WRITE_MODE_B              ("WRITE_FIRST"),
             .INIT_FILE                 ("NONE"),
             .SIM_COLLISION_CHECK       ("ALL"),
             .RAM_MODE                  ("TDP"),
             .RDADDR_COLLISION_HWCONFIG ("DELAYED_WRITE"),
             .SIM_DEVICE                ("7SERIES"),
             .INIT_00                   (256'h{INIT_00}),
             .INIT_01                   (256'h{INIT_01}),
             .INIT_02                   (256'h{INIT_02}),
             .INIT_03                   (256'h{INIT_03}),
             .INIT_04                   (256'h{INIT_04}),
             .INIT_05                   (256'h{INIT_05}),
             .INIT_06                   (256'h{INIT_06}),
             .INIT_07                   (256'h{INIT_07}),
             .INIT_08                   (256'h{INIT_08}),
             .INIT_09                   (256'h{INIT_09}),
             .INIT_0A                   (256'h{INIT_0A}),
             .INIT_0B                   (256'h{INIT_0B}),
             .INIT_0C                   (256'h{INIT_0C}),
             .INIT_0D                   (256'h{INIT_0D}),
             .INIT_0E                   (256'h{INIT_0E}),
             .INIT_0F                   (256'h{INIT_0F}),
             .INIT_10                   (256'h{INIT_10}),
             .INIT_11                   (256'h{INIT_11}),
             .INIT_12                   (256'h{INIT_12}),
             .INIT_13                   (256'h{INIT_13}),
             .INIT_14                   (256'h{INIT_14}),
             .INIT_15                   (256'h{INIT_15}),
             .INIT_16                   (256'h{INIT_16}),
             .INIT_17                   (256'h{INIT_17}),
             .INIT_18                   (256'h{INIT_18}),
             .INIT_19                   (256'h{INIT_19}),
             .INIT_1A                   (256'h{INIT_1A}),
             .INIT_1B                   (256'h{INIT_1B}),
             .INIT_1C                   (256'h{INIT_1C}),
             .INIT_1D                   (256'h{INIT_1D}),
             .INIT_1E                   (256'h{INIT_1E}),
             .INIT_1F                   (256'h{INIT_1F}),
             .INIT_20                   (256'h{INIT_20}),
             .INIT_21                   (256'h{INIT_21}),
             .INIT_22                   (256'h{INIT_22}),
             .INIT_23                   (256'h{INIT_23}),
             .INIT_24                   (256'h{INIT_24}),
             .INIT_25                   (256'h{INIT_25}),
             .INIT_26                   (256'h{INIT_26}),
             .INIT_27                   (256'h{INIT_27}),
             .INIT_28                   (256'h{INIT_28}),
             .INIT_29                   (256'h{INIT_29}),
             .INIT_2A                   (256'h{INIT_2A}),
             .INIT_2B                   (256'h{INIT_2B}),
             .INIT_2C                   (256'h{INIT_2C}),
             .INIT_2D                   (256'h{INIT_2D}),
             .INIT_2E                   (256'h{INIT_2E}),
             .INIT_2F                   (256'h{INIT_2F}),
             .INIT_30                   (256'h{INIT_30}),
             .INIT_31                   (256'h{INIT_31}),
             .INIT_32                   (256'h{INIT_32}),
             .INIT_33                   (256'h{INIT_33}),
             .INIT_34                   (256'h{INIT_34}),
             .INIT_35                   (256'h{INIT_35}),
             .INIT_36                   (256'h{INIT_36}),
             .INIT_37                   (256'h{INIT_37}),
             .INIT_38                   (256'h{INIT_38}),
             .INIT_39                   (256'h{INIT_39}),
             .INIT_3A                   (256'h{INIT_3A}),
             .INIT_3B                   (256'h{INIT_3B}),
             .INIT_3C                   (256'h{INIT_3C}),
             .INIT_3D                   (256'h{INIT_3D}),
             .INIT_3E                   (256'h{INIT_3E}),
             .INIT_3F                   (256'h{INIT_3F}),
             .INITP_00                  (256'h{INITP_00}),
             .INITP_01                  (256'h{INITP_01}),
             .INITP_02                  (256'h{INITP_02}),
             .INITP_03                  (256'h{INITP_03}),
             .INITP_04                  (256'h{INITP_04}),
             .INITP_05                  (256'h{INITP_05}),
             .INITP_06                  (256'h{INITP_06}),
             .INITP_07                  (256'h{INITP_07}))
 kcpsm6_rom( .ADDRARDADDR               (address_a),
             .ENARDEN                   (enable),
             .CLKARDCLK                 (clk),
             .DOADO                     (data_out_a[15:0]),
             .DOPADOP                   (data_out_a[17:16]),
             .DIADI                     (data_in_a[15:0]),
             .DIPADIP                   (data_in_a[17:16]),
             .WEA                       (2'b00),
             .REGCEAREGCE               (1'b0),
             .RSTRAMARSTRAM             (1'b0),
             .RSTREGARSTREG             (1'b0),
             .ADDRBWRADDR               (address_b),
             .ENBWREN                   (enable_b),
             .CLKBWRCLK                 (clk_b),
             .DOBDO                     (data_out_b[15:0]),
             .DOPBDOP                   (data_out_b[17:16]),
             .DIBDI                     (data_in_b[15:0]),
             .DIPBDIP                   (data_in_b[17:16]),
             .WEBWE                     (we_b),
             .REGCEB                    (1'b0),
             .RSTRAMB                   (1'b0),
             .RSTREGB                   (1'b0));
endmodule