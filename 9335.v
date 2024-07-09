module ecfg (/*AUTOARG*/
   // Outputs
   mi_data_out, mi_data_sel, ecfg_sw_reset, ecfg_reset,
   ecfg_tx_enable, ecfg_tx_mmu_mode, ecfg_tx_gpio_mode,
   ecfg_tx_ctrl_mode, ecfg_tx_clkdiv, ecfg_rx_enable,
   ecfg_rx_mmu_mode, ecfg_rx_gpio_mode, ecfg_rx_loopback_mode,
   ecfg_cclk_en, ecfg_cclk_div, ecfg_cclk_pllcfg, ecfg_coreid,
   ecfg_gpio_dataout,
   // Inputs
   param_coreid, clk, hw_reset, mi_access, mi_write, mi_addr,
   mi_data_in
   );
   //Register file parameters
/*
 #####################################################################
 COMPILE TIME PARAMETERS
 ######################################################################
 */
parameter EMAW   = 12;   //mmu table address width
parameter EDW    = 32;  //Epiphany native data width
parameter EAW    = 32;  //Epiphany native address width
parameter IDW    = 12;  //Elink ID (row,column coordinate)
parameter RFAW   = 5;   //Number of registers=2^RFAW
   /*STATIC CONFIG SIGNALS      */
   input [IDW-1:0] param_coreid;
   /*SIMPLE MEMORY INTERFACE    */
   input              clk;
   input              hw_reset;
   input              mi_access;
   input              mi_write;
   input  [19:0]      mi_addr;
   input  [31:0]      mi_data_in;
   output [31:0]      mi_data_out;
   output 	      mi_data_sel;
   /*ELINK CONTROL SIGNALS      */
   //RESET
   output 	      ecfg_sw_reset;
   output 	      ecfg_reset;
   //tx
   output 	     ecfg_tx_enable;         //enable signal for TX
   output 	     ecfg_tx_mmu_mode;       //enables MMU on transnmit path
   output 	     ecfg_tx_gpio_mode;      //forces TX output pins to constants
   output [3:0]	     ecfg_tx_ctrl_mode;      //value for emesh ctrlmode tag
   output [3:0]      ecfg_tx_clkdiv;         //transmit clock divider
   //rx
   output 	     ecfg_rx_enable;         //enable signal for rx
   output 	     ecfg_rx_mmu_mode;       //enables MMU on rx path
   output 	     ecfg_rx_gpio_mode;      //forces rx wait pins to constants
   output 	     ecfg_rx_loopback_mode;  //loops back tx to rx receiver (after serdes)
   //cclk
   output 	     ecfg_cclk_en;           //cclk enable
   output [3:0]      ecfg_cclk_div;          //cclk divider setting
   output [3:0]      ecfg_cclk_pllcfg;       //pll configuration
   //coreid
   output [11:0]     ecfg_coreid;            //core-id of fpga elink
   //gpio
   output [11:0]     ecfg_gpio_dataout;      //data for elink outputs {rd_wait,wr_wait,frame,data[7:0}
   //registers
   reg [11:0] 	ecfg_cfgtx_reg;
   reg [4:0] 	ecfg_cfgrx_reg;
   reg [7:0] 	ecfg_cfgclk_reg;
   reg [11:0] 	ecfg_coreid_reg;
   wire [31:0] 	ecfg_version_reg;
   reg 		ecfg_reset_reg;
   reg [11:0] 	ecfg_gpio_datain_reg;
   reg [11:0] 	ecfg_gpio_dataout_reg;
   reg [31:0] 	mi_data_out;
   reg 		mi_data_sel;
   //wires
   wire 	ecfg_read;
   wire 	ecfg_write;
   wire 	ecfg_reset_match;
   wire 	ecfg_cfgtx_match;
   wire 	ecfg_cfgrx_match;
   wire 	ecfg_cfgclk_match;
   wire 	ecfg_coreid_match;
   wire 	ecfg_version_match;
   wire 	ecfg_datain_match;
   wire 	ecfg_dataout_match;
   wire         ecfg_match;
   wire 	ecfg_regmux;
   wire [31:0] 	ecfg_reg_mux;
   wire 	ecfg_cfgtx_write;
   wire 	ecfg_cfgrx_write;
   wire 	ecfg_cfgclk_write;
   wire 	ecfg_coreid_write;
   wire 	ecfg_version_write;
   wire 	ecfg_datain_write;
   wire 	ecfg_dataout_write;
   wire 	ecfg_rx_monitor_mode;
   wire 	ecfg_reset_write;
   /*ADDRESS DECODE LOGIC       */
   //read/write decode
   assign ecfg_write      = mi_access & mi_write;
   assign ecfg_read       = mi_access & ~mi_write;
   //address match signals
   assign ecfg_reset_match     = mi_addr[19:0]==`E_REG_SYSRESET;
   assign ecfg_cfgtx_match     = mi_addr[19:0]==`E_REG_SYSCFGTX;
   assign ecfg_cfgrx_match     = mi_addr[19:0]==`E_REG_SYSCFGRX;
   assign ecfg_cfgclk_match    = mi_addr[19:0]==`E_REG_SYSCFGCLK;
   assign ecfg_coreid_match    = mi_addr[19:0]==`E_REG_SYSCOREID;
   assign ecfg_version_match   = mi_addr[19:0]==`E_REG_SYSVERSION;
   assign ecfg_datain_match    = mi_addr[19:0]==`E_REG_SYSDATAIN;
   assign ecfg_dataout_match   = mi_addr[19:0]==`E_REG_SYSDATAOUT;
   assign ecfg_match           = ecfg_reset_match   |
				 ecfg_cfgtx_match   |
				 ecfg_cfgrx_match   |
				 ecfg_cfgclk_match  |
				 ecfg_coreid_match  |
				 ecfg_version_match |
				 ecfg_datain_match  |
				 ecfg_dataout_match;
   //Write enables
   assign ecfg_reset_write     = ecfg_reset_match   & ecfg_write;
   assign ecfg_cfgtx_write     = ecfg_cfgtx_match   & ecfg_write;
   assign ecfg_cfgrx_write     = ecfg_cfgrx_match   & ecfg_write;
   assign ecfg_cfgclk_write    = ecfg_cfgclk_match  & ecfg_write;
   assign ecfg_coreid_write    = ecfg_coreid_match  & ecfg_write;
   assign ecfg_version_write   = ecfg_version_match & ecfg_write;
   assign ecfg_datain_write    = ecfg_datain_match  & ecfg_write;
   assign ecfg_dataout_write   = ecfg_dataout_match & ecfg_write;
   //###########################
   //# ESYSCFGTX
   //###########################
   always @ (posedge clk)
     if(hw_reset)
       ecfg_cfgtx_reg[11:0] <= 12'b0;
     else if (ecfg_cfgtx_write)
       ecfg_cfgtx_reg[11:0] <= mi_data_in[11:0];
   assign ecfg_tx_enable         = ecfg_cfgtx_reg[0];
   assign ecfg_tx_mmu_mode       = ecfg_cfgtx_reg[1];
   assign ecfg_tx_gpio_mode      = ecfg_cfgtx_reg[3:2]==2'b01;
   assign ecfg_tx_ctrl_mode[3:0] = ecfg_cfgtx_reg[7:4];
   assign ecfg_tx_clkdiv[3:0]    = ecfg_cfgtx_reg[11:8];
   //###########################
   //# ESYSCFGRX
   //###########################
   always @ (posedge clk)
     if(hw_reset)
       ecfg_cfgrx_reg[4:0] <= 5'b0;
     else if (ecfg_cfgrx_write)
       ecfg_cfgrx_reg[4:0] <= mi_data_in[4:0];
   assign ecfg_rx_enable        = ecfg_cfgrx_reg[0];
   assign ecfg_rx_mmu_mode      = ecfg_cfgrx_reg[1];
   assign ecfg_rx_gpio_mode     = ecfg_cfgrx_reg[3:2]==2'b01;
   assign ecfg_rx_loopback_mode = ecfg_cfgrx_reg[3:2]==2'b10;
   assign ecfg_rx_monitor_mode  = ecfg_cfgrx_reg[4];
   //###########################
   //# ESYSCFGCLK
   //###########################
    always @ (posedge clk)
     if(hw_reset)
       ecfg_cfgclk_reg[7:0] <= 8'b0;
     else if (ecfg_cfgclk_write)
       ecfg_cfgclk_reg[7:0] <= mi_data_in[7:0];
   assign ecfg_cclk_en             = ~(ecfg_cfgclk_reg[3:0]==4'b0000);
   assign ecfg_cclk_div[3:0]       = ecfg_cfgclk_reg[3:0];
   assign ecfg_cclk_pllcfg[3:0]    = ecfg_cfgclk_reg[7:4];
   //###########################
   //# ESYSCOREID
   //###########################
   always @ (posedge clk)
     if(hw_reset)
       ecfg_coreid_reg[IDW-1:0] <= param_coreid[IDW-1:0];
     else if (ecfg_coreid_write)
       ecfg_coreid_reg[IDW-1:0] <= mi_data_in[IDW-1:0];
   assign ecfg_coreid[IDW-1:0] = ecfg_coreid_reg[IDW-1:0];
   //###########################
   //# ESYSVERSION
   //###########################
   assign ecfg_version_reg[31:0] = `E_VERSION;
   //###########################
   //# ESYSDATAIN
   //###########################
   always @ (posedge clk)
     if(hw_reset)
       ecfg_gpio_datain_reg[11:0] <= 12'b0;
     else if (ecfg_datain_write)
       ecfg_gpio_datain_reg[11:0] <= mi_data_in[11:0];
   //###########################
   //# ESYSDATAOUT
   //###########################
   always @ (posedge clk)
     if(hw_reset)
       ecfg_gpio_dataout_reg[11:0] <= 12'b0;
     else if (ecfg_dataout_write)
       ecfg_gpio_dataout_reg[11:0] <= mi_data_in[11:0];
   assign ecfg_gpio_dataout[11:0] = ecfg_gpio_dataout_reg[11:0];
   //###########################
   //# ESYSRESET
   //###########################
    always @ (posedge clk)
      if(hw_reset)
	ecfg_reset_reg <= 1'b0;
      else if (ecfg_reset_write)
	ecfg_reset_reg <= mi_data_in[0];
   assign ecfg_sw_reset = ecfg_reset_reg;
   assign ecfg_reset    = ecfg_sw_reset | hw_reset;
   //###############################
   //# DATA READBACK MUX
   //###############################
   assign ecfg_reg_mux[31:0] =   ({(32){ecfg_reset_match}}   & {20'b0,ecfg_cfgtx_reg[11:0]})        |
				 ({(32){ecfg_cfgtx_match}}   & {20'b0,ecfg_cfgtx_reg[11:0]})        |
				 ({(32){ecfg_cfgrx_match}}   & {27'b0,ecfg_cfgrx_reg[4:0]})         |
				 ({(32){ecfg_cfgclk_match}}  & {24'b0,ecfg_cfgclk_reg[7:0]})        |
				 ({(32){ecfg_coreid_match}}  & {20'b0,ecfg_coreid_reg[11:0]})       |
				 ({(32){ecfg_version_match}} & ecfg_version_reg[31:0])              |
				 ({(32){ecfg_datain_match}}  & {20'b0,ecfg_gpio_datain_reg[11:0]})  |
				 ({(32){ecfg_dataout_match}} & {20'b0,ecfg_gpio_dataout_reg[11:0]}) ;
   //Pipelineing readback
   always @ (posedge clk)
     if(ecfg_read)
       begin
	  mi_data_out[31:0] <= ecfg_reg_mux[31:0];
	  mi_data_sel       <= ecfg_match;
       end
endmodule