module si570_controller (
input wire iCLK, // system   clock 50mhz
input wire iRST_n, // system reset
input wire iStart_Go, // system set
input wire [2:0] iFREQ_MODE, //clock frequency mode   000:100Mhz, 001: 125Mhz, 010:156.25Mhz, 011:250Mhz, 100:312.5Mhz , 101:322.26Mhz , 110:644.53Mhz ,111:100Mhz
output wire oController_rdy, // high for si570 controller is rdy
output wire I2C_CLK,
inout  wire I2C_DATA,
output wire [7:0] oREAD_Data,
output wire oSI570_ONE_CLK_CONFIG_DONE
);
//=============================================================================
// PARAMETER declarations
//=============================================================================
//=============================================================================
// REG/WIRE declarations
//=============================================================================
wire [6:0]	slave_addr;
wire [7:0]	byte_addr;
wire [7:0]	byte_data;
wire		 	wr_cmd;
//wire [7:0]	oREAD_Data;
//wire [2:0]	iFREQ_MODE;
wire 			i2c_control_start;
wire 			i2c_reg_control_start;
wire 			i2c_bus_controller_state;
wire			iINITIAL_ENABLE;
wire 			system_start;
wire 			i2c_clk;
wire			i2c_controller_config_done;
//wire			oController_rdy;
wire			initial_start;
//=============================================================================
// Structural coding
//=============================================================================
i2c_reg_controller u1(
.iCLK(iCLK), // system   clock 50mhz
.iRST_n(iRST_n), // system reset
.iENABLE(system_start), // i2c reg contorl enable signale , high for enable .please use pulse
.iI2C_CONTROLLER_STATE(i2c_bus_controller_state), //  i2c controller  state ,  high for  i2c controller  state not in idel
.iFREQ_MODE(iFREQ_MODE),  // clock frequency mode
.oSLAVE_ADDR(slave_addr),
.oBYTE_ADDR(byte_addr),
.oBYTE_DATA(byte_data),
.oWR_CMD(wr_cmd), // write or read commnad for  i2c controller , 1 for write command
.oStart(i2c_reg_control_start),  // i2c controller   start control signal, high for start to send signal
.iI2C_CONTROLLER_CONFIG_DONE(i2c_controller_config_done),
.oSI570_ONE_CLK_CONFIG_DONE(oSI570_ONE_CLK_CONFIG_DONE),
.oController_Ready(oController_rdy),
);
initial_config initial_config(
.iCLK(iCLK), // system   clock 50mhz
.iRST_n(iRST_n), // system reset
.oINITIAL_START(initial_start),
.iINITIAL_ENABLE(1'b1),
);
assign system_start = iStart_Go|initial_start;
clock_divider u3(
.iCLK(iCLK),
.iRST_n(iRST_n),
.oCLK_OUT(i2c_clk),
);
i2c_bus_controller u4	(
	.iCLK(i2c_clk),
	.iRST_n(iRST_n),
	.iStart(i2c_reg_control_start),
	.iSlave_addr(slave_addr),
	.iWord_addr(byte_addr),
	.iSequential_read(1'b0),
	.iRead_length(8'd1),
	.i2c_clk(I2C_CLK),
	.i2c_data(I2C_DATA),
	.i2c_read_data(oREAD_Data),
	.wr_data(byte_data),
	.wr_cmd(wr_cmd),
   .oSYSTEM_STATE(i2c_bus_controller_state),
	.oCONFIG_DONE(i2c_controller_config_done),
				);
endmodule