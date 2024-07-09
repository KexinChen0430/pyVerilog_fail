module {name} (address, instruction, enable, rdl, clk);
parameter integer C_JTAG_LOADER_ENABLE = 0;
parameter         C_FAMILY = "7S";
parameter integer C_RAM_SIZE_KWORDS = 1;
input         clk;
input  [11:0] address;
input         enable;
output [17:0] instruction;
output        rdl;
wire [15:0] address_a;
wire        pipe_a11;
wire [35:0] data_in_a;
wire [35:0] data_out_a;
wire [35:0] data_out_a_l;
wire [35:0] data_out_a_h;
wire [35:0] data_out_a_ll;
wire [35:0] data_out_a_lh;
wire [35:0] data_out_a_hl;
wire [35:0] data_out_a_hh;
wire [15:0] address_b;
wire [35:0] data_in_b;
wire [35:0] data_in_b_l;
wire [35:0] data_in_b_ll;
wire [35:0] data_in_b_hl;
wire [35:0] data_out_b;
wire [35:0] data_out_b_l;
wire [35:0] data_out_b_ll;
wire [35:0] data_out_b_hl;
wire [35:0] data_in_b_h;
wire [35:0] data_in_b_lh;
wire [35:0] data_in_b_hh;
wire [35:0] data_out_b_h;
wire [35:0] data_out_b_lh;
wire [35:0] data_out_b_hh;
wire        enable_b;
wire        clk_b;
wire [7:0]  we_b;
wire [3:0]  we_b_l;
wire [3:0]  we_b_h;
wire [11:0] jtag_addr;
wire        jtag_we;
wire        jtag_clk;
wire [17:0] jtag_din;
wire [17:0] jtag_dout;
wire [17:0] jtag_dout_1;
wire [0:0]  jtag_en;
wire [0:0]  picoblaze_reset;
wire [0:0]  rdl_bus;
parameter integer BRAM_ADDRESS_WIDTH = addr_width_calc(C_RAM_SIZE_KWORDS);
function integer addr_width_calc;
  input integer size_in_k;
    if (size_in_k == 1) begin addr_width_calc = 10; end
      else if (size_in_k == 2) begin addr_width_calc = 11; end
      else if (size_in_k == 4) begin addr_width_calc = 12; end
      else begin
        if (C_RAM_SIZE_KWORDS != 1 && C_RAM_SIZE_KWORDS != 2 && C_RAM_SIZE_KWORDS != 4) begin
          //#0;
          $display("Invalid BlockRAM size. Please set to 1, 2 or 4 K words..\n");
          $finish;
        end
    end
endfunction
generate
  if (C_RAM_SIZE_KWORDS == 1) begin : ram_1k_generate
    if (C_FAMILY == "7S") begin: akv7
      assign address_a[13:0] = {address[9:0], 4'b1111};
      assign instruction = data_out_a[17:0];
      assign data_in_a[17:0] = {16'b0000000000000000, address[11:10]};
      assign jtag_dout = data_out_b[17:0];
      if (C_JTAG_LOADER_ENABLE == 0) begin : no_loader
        assign data_in_b[17:0] = data_out_b[17:0];
        assign address_b[13:0] = 14'b11111111111111;
        assign we_b[3:0] = 4'b0000;
        assign enable_b = 1'b0;
        assign rdl = 1'b0;
        assign clk_b = 1'b0;
      end // no_loader;
      if (C_JTAG_LOADER_ENABLE == 1) begin : loader
        assign data_in_b[17:0] = jtag_din[17:0];
        assign address_b[13:0] = {jtag_addr[9:0], 4'b1111};
        assign we_b[3:0] = {jtag_we, jtag_we, jtag_we, jtag_we};
        assign enable_b = jtag_en[0];
        assign rdl = rdl_bus[0];
        assign clk_b = jtag_clk;
      end // loader;
      RAMB18E1 #(.READ_WIDTH_A              (18),
                 .WRITE_WIDTH_A             (18),
                 .DOA_REG                   (0),
                 .INIT_A                    (18'b000000000000000000),
                 .RSTREG_PRIORITY_A         ("REGCE"),
                 .SRVAL_A                   (18'b000000000000000000),
                 .WRITE_MODE_A              ("WRITE_FIRST"),
                 .READ_WIDTH_B              (18),
                 .WRITE_WIDTH_B             (18),
                 .DOB_REG                   (0),
                 .INIT_B                    (18'b000000000000000000),
                 .RSTREG_PRIORITY_B         ("REGCE"),
                 .SRVAL_B                   (18'b000000000000000000),
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
     kcpsm6_rom( .ADDRARDADDR               (address_a[13:0]),
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
                 .ADDRBWRADDR               (address_b[13:0]),
                 .ENBWREN                   (enable_b),
                 .CLKBWRCLK                 (clk_b),
                 .DOBDO                     (data_out_b[15:0]),
                 .DOPBDOP                   (data_out_b[17:16]),
                 .DIBDI                     (data_in_b[15:0]),
                 .DIPBDIP                   (data_in_b[17:16]),
                 .WEBWE                     (we_b[3:0]),
                 .REGCEB                    (1'b0),
                 .RSTRAMB                   (1'b0),
                 .RSTREGB                   (1'b0));
    end // akv7;
  end // ram_1k_generate;
endgenerate
generate
  if (C_RAM_SIZE_KWORDS == 2) begin : ram_2k_generate
    if (C_FAMILY == "7S") begin: akv7
      assign address_a = {1'b1, address[10:0], 4'b1111};
      assign instruction = {data_out_a[33:32], data_out_a[15:0]};
      assign data_in_a = {35'b00000000000000000000000000000000000, address[11]};
      assign jtag_dout = {data_out_b[33:32], data_out_b[15:0]};
      if (C_JTAG_LOADER_ENABLE == 0) begin : no_loader
        assign data_in_b = {2'b00, data_out_b[33:32], 16'b0000000000000000, data_out_b[15:0]};
        assign address_b = 16'b1111111111111111;
        assign we_b = 8'b00000000;
        assign enable_b = 1'b0;
        assign rdl = 1'b0;
        assign clk_b = 1'b0;
      end // no_loader;
      if (C_JTAG_LOADER_ENABLE == 1) begin : loader
        assign data_in_b = {2'b00, jtag_din[17:16], 16'b0000000000000000, jtag_din[15:0]};
        assign address_b = {1'b1, jtag_addr[10:0], 4'b1111};
        assign we_b = {jtag_we, jtag_we, jtag_we, jtag_we, jtag_we, jtag_we, jtag_we, jtag_we};
        assign enable_b = jtag_en[0];
        assign rdl = rdl_bus[0];
        assign clk_b = jtag_clk;
      end // loader;
      RAMB36E1 #(.READ_WIDTH_A              (18),
                 .WRITE_WIDTH_A             (18),
                 .DOA_REG                   (0),
                 .INIT_A                    (36'h000000000),
                 .RSTREG_PRIORITY_A         ("REGCE"),
                 .SRVAL_A                   (36'h000000000),
                 .WRITE_MODE_A              ("WRITE_FIRST"),
                 .READ_WIDTH_B              (18),
                 .WRITE_WIDTH_B             (18),
                 .DOB_REG                   (0),
                 .INIT_B                    (36'h000000000),
                 .RSTREG_PRIORITY_B         ("REGCE"),
                 .SRVAL_B                   (36'h000000000),
                 .WRITE_MODE_B              ("WRITE_FIRST"),
                 .INIT_FILE                 ("NONE"),
                 .SIM_COLLISION_CHECK       ("ALL"),
                 .RAM_MODE                  ("TDP"),
                 .RDADDR_COLLISION_HWCONFIG ("DELAYED_WRITE"),
                 .EN_ECC_READ               ("FALSE"),
                 .EN_ECC_WRITE              ("FALSE"),
                 .RAM_EXTENSION_A           ("NONE"),
                 .RAM_EXTENSION_B           ("NONE"),
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
                 .INIT_40                   (256'h{INIT_40}),
                 .INIT_41                   (256'h{INIT_41}),
                 .INIT_42                   (256'h{INIT_42}),
                 .INIT_43                   (256'h{INIT_43}),
                 .INIT_44                   (256'h{INIT_44}),
                 .INIT_45                   (256'h{INIT_45}),
                 .INIT_46                   (256'h{INIT_46}),
                 .INIT_47                   (256'h{INIT_47}),
                 .INIT_48                   (256'h{INIT_48}),
                 .INIT_49                   (256'h{INIT_49}),
                 .INIT_4A                   (256'h{INIT_4A}),
                 .INIT_4B                   (256'h{INIT_4B}),
                 .INIT_4C                   (256'h{INIT_4C}),
                 .INIT_4D                   (256'h{INIT_4D}),
                 .INIT_4E                   (256'h{INIT_4E}),
                 .INIT_4F                   (256'h{INIT_4F}),
                 .INIT_50                   (256'h{INIT_50}),
                 .INIT_51                   (256'h{INIT_51}),
                 .INIT_52                   (256'h{INIT_52}),
                 .INIT_53                   (256'h{INIT_53}),
                 .INIT_54                   (256'h{INIT_54}),
                 .INIT_55                   (256'h{INIT_55}),
                 .INIT_56                   (256'h{INIT_56}),
                 .INIT_57                   (256'h{INIT_57}),
                 .INIT_58                   (256'h{INIT_58}),
                 .INIT_59                   (256'h{INIT_59}),
                 .INIT_5A                   (256'h{INIT_5A}),
                 .INIT_5B                   (256'h{INIT_5B}),
                 .INIT_5C                   (256'h{INIT_5C}),
                 .INIT_5D                   (256'h{INIT_5D}),
                 .INIT_5E                   (256'h{INIT_5E}),
                 .INIT_5F                   (256'h{INIT_5F}),
                 .INIT_60                   (256'h{INIT_60}),
                 .INIT_61                   (256'h{INIT_61}),
                 .INIT_62                   (256'h{INIT_62}),
                 .INIT_63                   (256'h{INIT_63}),
                 .INIT_64                   (256'h{INIT_64}),
                 .INIT_65                   (256'h{INIT_65}),
                 .INIT_66                   (256'h{INIT_66}),
                 .INIT_67                   (256'h{INIT_67}),
                 .INIT_68                   (256'h{INIT_68}),
                 .INIT_69                   (256'h{INIT_69}),
                 .INIT_6A                   (256'h{INIT_6A}),
                 .INIT_6B                   (256'h{INIT_6B}),
                 .INIT_6C                   (256'h{INIT_6C}),
                 .INIT_6D                   (256'h{INIT_6D}),
                 .INIT_6E                   (256'h{INIT_6E}),
                 .INIT_6F                   (256'h{INIT_6F}),
                 .INIT_70                   (256'h{INIT_70}),
                 .INIT_71                   (256'h{INIT_71}),
                 .INIT_72                   (256'h{INIT_72}),
                 .INIT_73                   (256'h{INIT_73}),
                 .INIT_74                   (256'h{INIT_74}),
                 .INIT_75                   (256'h{INIT_75}),
                 .INIT_76                   (256'h{INIT_76}),
                 .INIT_77                   (256'h{INIT_77}),
                 .INIT_78                   (256'h{INIT_78}),
                 .INIT_79                   (256'h{INIT_79}),
                 .INIT_7A                   (256'h{INIT_7A}),
                 .INIT_7B                   (256'h{INIT_7B}),
                 .INIT_7C                   (256'h{INIT_7C}),
                 .INIT_7D                   (256'h{INIT_7D}),
                 .INIT_7E                   (256'h{INIT_7E}),
                 .INIT_7F                   (256'h{INIT_7F}),
                 .INITP_00                  (256'h{INITP_00}),
                 .INITP_01                  (256'h{INITP_01}),
                 .INITP_02                  (256'h{INITP_02}),
                 .INITP_03                  (256'h{INITP_03}),
                 .INITP_04                  (256'h{INITP_04}),
                 .INITP_05                  (256'h{INITP_05}),
                 .INITP_06                  (256'h{INITP_06}),
                 .INITP_07                  (256'h{INITP_07}),
                 .INITP_08                  (256'h{INITP_08}),
                 .INITP_09                  (256'h{INITP_09}),
                 .INITP_0A                  (256'h{INITP_0A}),
                 .INITP_0B                  (256'h{INITP_0B}),
                 .INITP_0C                  (256'h{INITP_0C}),
                 .INITP_0D                  (256'h{INITP_0D}),
                 .INITP_0E                  (256'h{INITP_0E}),
                 .INITP_0F                  (256'h{INITP_0F}))
     kcpsm6_rom( .ADDRARDADDR               (address_a),
                 .ENARDEN                   (enable),
                 .CLKARDCLK                 (clk),
                 .DOADO                     (data_out_a[31:0]),
                 .DOPADOP                   (data_out_a[35:32]),
                 .DIADI                     (data_in_a[31:0]),
                 .DIPADIP                   (data_in_a[35:32]),
                 .WEA                       (4'b0000),
                 .REGCEAREGCE               (1'b0),
                 .RSTRAMARSTRAM             (1'b0),
                 .RSTREGARSTREG             (1'b0),
                 .ADDRBWRADDR               (address_b),
                 .ENBWREN                   (enable_b),
                 .CLKBWRCLK                 (clk_b),
                 .DOBDO                     (data_out_b[31:0]),
                 .DOPBDOP                   (data_out_b[35:32]),
                 .DIBDI                     (data_in_b[31:0]),
                 .DIPBDIP                   (data_in_b[35:32]),
                 .WEBWE                     (we_b),
                 .REGCEB                    (1'b0),
                 .RSTRAMB                   (1'b0),
                 .RSTREGB                   (1'b0),
                 .CASCADEINA                (1'b0),
                 .CASCADEINB                (1'b0),
                 .CASCADEOUTA               (),
                 .CASCADEOUTB               (),
                 .DBITERR                   (),
                 .ECCPARITY                 (),
                 .RDADDRECC                 (),
                 .SBITERR                   (),
                 .INJECTDBITERR             (1'b0),
                 .INJECTSBITERR             (1'b0));
    end // akv7;
  end // ram_2k_generate;
endgenerate
// JTAG Loader
generate
  if (C_JTAG_LOADER_ENABLE == 1) begin: instantiate_loader
    jtag_loader_6  #(  .C_FAMILY              (C_FAMILY),
                       .C_NUM_PICOBLAZE       (1),
                       .C_JTAG_LOADER_ENABLE  (C_JTAG_LOADER_ENABLE),
                       .C_BRAM_MAX_ADDR_WIDTH (BRAM_ADDRESS_WIDTH),
                       .C_ADDR_WIDTH_0        (BRAM_ADDRESS_WIDTH))
    jtag_loader_6_inst(.picoblaze_reset       (rdl_bus),
                       .jtag_en               (jtag_en),
                       .jtag_din              (jtag_din),
                       .jtag_addr             (jtag_addr[BRAM_ADDRESS_WIDTH-1 : 0]),
                       .jtag_clk              (jtag_clk),
                       .jtag_we               (jtag_we),
                       .jtag_dout_0           (jtag_dout),
                       .jtag_dout_1           (jtag_dout),  // ports 1-7 are not used
                       .jtag_dout_2           (jtag_dout),  // in a 1 device debug
                       .jtag_dout_3           (jtag_dout),  // session.  However, Synplify
                       .jtag_dout_4           (jtag_dout),  // etc require all ports are
                       .jtag_dout_5           (jtag_dout),  // connected
                       .jtag_dout_6           (jtag_dout),
                       .jtag_dout_7           (jtag_dout));
  end //instantiate_loader
endgenerate
endmodule