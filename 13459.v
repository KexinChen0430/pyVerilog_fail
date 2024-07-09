module body
	// whenever the slave is not ready it can delay the cycle by pulling SCL low
	// delay scl_oen
	always @(posedge clk)
	  dscl_oen <= #1 scl_oen;
	assign slave_wait = dscl_oen && !sSCL;
	// generate clk enable signal
	always @(posedge clk or negedge nReset)
	  if(~nReset)
	    begin
	        cnt    <= #1 16'h0;
	        clk_en <= #1 1'b1;
	    end
	  else if (rst)
	    begin
	        cnt    <= #1 16'h0;
	        clk_en <= #1 1'b1;
	    end
	  else if ( ~|cnt || ~ena)
	    if (~slave_wait)
	      begin
	          cnt    <= #1 clk_cnt;
	          clk_en <= #1 1'b1;
	      end
	    else
	      begin
	          cnt    <= #1 cnt;
	          clk_en <= #1 1'b0;
	      end
	  else
	    begin
                cnt    <= #1 cnt - 16'h1;
	        clk_en <= #1 1'b0;
	    end
	// generate bus status controller
	reg dSCL, dSDA;
	reg sta_condition;
	reg sto_condition;
	// synchronize SCL and SDA inputs
	// reduce metastability risc
	always @(posedge clk or negedge nReset)
	  if (~nReset)
	    begin
	        sSCL <= #1 1'b1;
	        sSDA <= #1 1'b1;
	        dSCL <= #1 1'b1;
	        dSDA <= #1 1'b1;
	    end
	  else if (rst)
	    begin
	        sSCL <= #1 1'b1;
	        sSDA <= #1 1'b1;
	        dSCL <= #1 1'b1;
	        dSDA <= #1 1'b1;
	    end
	  else
	    begin
	        sSCL <= #1 scl_i;
	        sSDA <= #1 spi_rden ? spi_miso : sda_i;
	        dSCL <= #1 sSCL;
	        dSDA <= #1 sSDA;
	    end
	// detect start condition => detect falling edge on SDA while SCL is high
	// detect stop condition => detect rising edge on SDA while SCL is high
	always @(posedge clk or negedge nReset)
	  if (~nReset)
	    begin
	        sta_condition <= #1 1'b0;
	        sto_condition <= #1 1'b0;
	    end
	  else if (rst)
	    begin
	        sta_condition <= #1 1'b0;
	        sto_condition <= #1 1'b0;
	    end
	  else
	    begin
	        sta_condition <= #1 ~sSDA &  dSDA & sSCL;
	        sto_condition <= #1  sSDA & ~dSDA & sSCL;
	    end
	// generate i2c bus busy signal
	always @(posedge clk or negedge nReset)
	  if(!nReset)
	    busy <= #1 1'b0;
	  else if (rst)
	    busy <= #1 1'b0;
	  else
	    busy <= #1 (sta_condition | busy) & ~sto_condition;
	// generate arbitration lost signal
	// aribitration lost when:
	// 1) master drives SDA high, but the i2c bus is low
	// 2) stop detected while not requested
	reg cmd_stop;
	always @(posedge clk or negedge nReset)
	  if (~nReset)
	    cmd_stop <= #1 1'b0;
	  else if (rst)
	    cmd_stop <= #1 1'b0;
	  else if (clk_en)
	    cmd_stop <= #1 (cmd & (`I2C_CMD_STOP|`SPI_CMD_WRITE|`SPI_CMD_READ)) != 6'b000000;
	always @(posedge clk or negedge nReset)
	  if (~nReset)
	    al <= #1 1'b0;
	  else if (rst)
	    al <= #1 1'b0;
	  else
	    al <= #1 (sda_chk & ~sSDA & sda_oen) | (|c_state & sto_condition & ~cmd_stop);
	// generate dout signal (store SDA on rising edge of SCL)
	always @(posedge clk)
	  if(sSCL & ~dSCL)
	    dout <= #1 sSDA;
	// generate statemachine
	// nxt_state decoder
	parameter [24:0] idle      = 25'b0_0000_0000_0000_0000_0000_0000;
	parameter [24:0] start_a   = 25'b0_0000_0000_0000_0000_0000_0001;
	parameter [24:0] start_b   = 25'b0_0000_0000_0000_0000_0000_0010;
	parameter [24:0] start_c   = 25'b0_0000_0000_0000_0000_0000_0100;
	parameter [24:0] start_d   = 25'b0_0000_0000_0000_0000_0000_1000;
	parameter [24:0] start_e   = 25'b0_0000_0000_0000_0000_0001_0000;
	parameter [24:0] stop_a    = 25'b0_0000_0000_0000_0000_0010_0000;
	parameter [24:0] stop_b    = 25'b0_0000_0000_0000_0000_0100_0000;
	parameter [24:0] stop_c    = 25'b0_0000_0000_0000_0000_1000_0000;
	parameter [24:0] stop_d    = 25'b0_0000_0000_0000_0001_0000_0000;
	parameter [24:0] rd_a      = 25'b0_0000_0000_0000_0010_0000_0000;
	parameter [24:0] rd_b      = 25'b0_0000_0000_0000_0100_0000_0000;
	parameter [24:0] rd_c      = 25'b0_0000_0000_0000_1000_0000_0000;
	parameter [24:0] rd_d      = 25'b0_0000_0000_0001_0000_0000_0000;
	parameter [24:0] wr_a      = 25'b0_0000_0000_0010_0000_0000_0000;
	parameter [24:0] wr_b      = 25'b0_0000_0000_0100_0000_0000_0000;
	parameter [24:0] wr_c      = 25'b0_0000_0000_1000_0000_0000_0000;
	parameter [24:0] wr_d      = 25'b0_0000_0001_0000_0000_0000_0000;
    parameter [24:0] spi_rd_a  = 25'b0_0000_0010_0000_0000_0000_0000;
	parameter [24:0] spi_rd_b  = 25'b0_0000_0100_0000_0000_0000_0000;
	parameter [24:0] spi_rd_c  = 25'b0_0000_1000_0000_0000_0000_0000;
	parameter [24:0] spi_rd_d  = 25'b0_0001_0000_0000_0000_0000_0000;
	parameter [24:0] spi_wr_a  = 25'b0_0010_0000_0000_0000_0000_0000;
	parameter [24:0] spi_wr_b  = 25'b0_0100_0000_0000_0000_0000_0000;
	parameter [24:0] spi_wr_c  = 25'b0_1000_0000_0000_0000_0000_0000;
	parameter [24:0] spi_wr_d  = 25'b1_0000_0000_0000_0000_0000_0000;
	always @(posedge clk or negedge nReset)
	  if (!nReset)
	    begin
	        c_state <= #1 idle;
	        cmd_ack <= #1 1'b0;
	        scl_oen <= #1 1'b1;
	        sda_oen <= #1 1'b1;
	        sda_chk <= #1 1'b0;
            spi_rden <= #1 1'b0;
	    end
	  else if (rst | al)
	    begin
	        c_state <= #1 idle;
	        cmd_ack <= #1 1'b0;
	        scl_oen <= #1 1'b1;
	        sda_oen <= #1 1'b1;
	        sda_chk <= #1 1'b0;
            spi_rden <= #1 1'b0;
	    end
	  else
	    begin
	        cmd_ack   <= #1 1'b0; // default no command acknowledge + assert cmd_ack only 1clk cycle
	        if (clk_en)
	          case (c_state)
	            // idle state
	            idle:
	            begin
	                case (cmd)
	                  `I2C_CMD_START:
	                     c_state <= #1 start_a;
	                  `I2C_CMD_STOP:
	                     c_state <= #1 stop_a;
	                  `I2C_CMD_WRITE:
	                     c_state <= #1 wr_a;
	                  `I2C_CMD_READ:
	                     c_state <= #1 rd_a;
	                  `SPI_CMD_WRITE:
	                     c_state <= #1 spi_wr_a;
	                  `SPI_CMD_READ:
	                     c_state <= #1 spi_rd_a;
	                  default:
	                    c_state <= #1 idle;
	                endcase
	                scl_oen <= #1 scl_oen; // keep SCL in same state
	                sda_oen <= #1 sda_oen; // keep SDA in same state
	                sda_chk <= #1 1'b0;    // don't check SDA output
	            end
	            // start
	            start_a:
	            begin
	                c_state <= #1 start_b;
	                scl_oen <= #1 scl_oen; // keep SCL in same state
	                sda_oen <= #1 1'b1;    // set SDA high
	                sda_chk <= #1 1'b0;    // don't check SDA output
	            end
	            start_b:
	            begin
	                c_state <= #1 start_c;
	                scl_oen <= #1 1'b1; // set SCL high
	                sda_oen <= #1 1'b1; // keep SDA high
	                sda_chk <= #1 1'b0; // don't check SDA output
	            end
	            start_c:
	            begin
	                c_state <= #1 start_d;
	                scl_oen <= #1 1'b1; // keep SCL high
	                sda_oen <= #1 1'b0; // set SDA low
	                sda_chk <= #1 1'b0; // don't check SDA output
	            end
	            start_d:
	            begin
	                c_state <= #1 start_e;
	                scl_oen <= #1 1'b1; // keep SCL high
	                sda_oen <= #1 1'b0; // keep SDA low
	                sda_chk <= #1 1'b0; // don't check SDA output
	            end
	            start_e:
	            begin
	                c_state <= #1 idle;
	                cmd_ack <= #1 1'b1;
	                scl_oen <= #1 1'b0; // set SCL low
	                sda_oen <= #1 1'b0; // keep SDA low
	                sda_chk <= #1 1'b0; // don't check SDA output
	            end
	            // stop
	            stop_a:
	            begin
	                c_state <= #1 stop_b;
	                scl_oen <= #1 1'b0; // keep SCL low
	                sda_oen <= #1 1'b0; // set SDA low
	                sda_chk <= #1 1'b0; // don't check SDA output
	            end
	            stop_b:
	            begin
	                c_state <= #1 stop_c;
	                scl_oen <= #1 1'b1; // set SCL high
	                sda_oen <= #1 1'b0; // keep SDA low
	                sda_chk <= #1 1'b0; // don't check SDA output
	            end
	            stop_c:
	            begin
	                c_state <= #1 stop_d;
	                scl_oen <= #1 1'b1; // keep SCL high
	                sda_oen <= #1 1'b0; // keep SDA low
	                sda_chk <= #1 1'b0; // don't check SDA output
	            end
	            stop_d:
	            begin
	                c_state <= #1 idle;
	                cmd_ack <= #1 1'b1;
	                scl_oen <= #1 1'b1; // keep SCL high
	                sda_oen <= #1 1'b1; // set SDA high
	                sda_chk <= #1 1'b0; // don't check SDA output
	            end
	            // read
	            rd_a:
	            begin
	                c_state <= #1 rd_b;
	                scl_oen <= #1 1'b0; // keep SCL low
	                sda_oen <= #1 1'b1; // tri-state SDA
	                sda_chk <= #1 1'b0; // don't check SDA output
	            end
	            rd_b:
	            begin
	                c_state <= #1 rd_c;
	                scl_oen <= #1 1'b1; // set SCL high
	                sda_oen <= #1 1'b1; // keep SDA tri-stated
	                sda_chk <= #1 1'b0; // don't check SDA output
	            end
	            rd_c:
	            begin
	                c_state <= #1 rd_d;
	                scl_oen <= #1 1'b1; // keep SCL high
	                sda_oen <= #1 1'b1; // keep SDA tri-stated
	                sda_chk <= #1 1'b0; // don't check SDA output
	            end
	            rd_d:
	            begin
	                c_state <= #1 idle;
	                cmd_ack <= #1 1'b1;
	                scl_oen <= #1 1'b0; // set SCL low
	                sda_oen <= #1 1'b1; // keep SDA tri-stated
	                sda_chk <= #1 1'b0; // don't check SDA output
	            end
	            // write
	            wr_a:
	            begin
	                c_state <= #1 wr_b;
	                scl_oen <= #1 1'b0; // keep SCL low
	                sda_oen <= #1 din;  // set SDA
	                sda_chk <= #1 1'b0; // don't check SDA output (SCL low)
	            end
	            wr_b:
	            begin
	                c_state <= #1 wr_c;
	                scl_oen <= #1 1'b1; // set SCL high
	                sda_oen <= #1 din;  // keep SDA
	                sda_chk <= #1 1'b1; // check SDA output
	            end
	            wr_c:
	            begin
	                c_state <= #1 wr_d;
	                scl_oen <= #1 1'b1; // keep SCL high
	                sda_oen <= #1 din;
	                sda_chk <= #1 1'b1; // check SDA output
	            end
	            wr_d:
	            begin
	                c_state <= #1 idle;
	                cmd_ack <= #1 1'b1;
	                scl_oen <= #1 1'b0; // set SCL low
	                sda_oen <= #1 din;
	                sda_chk <= #1 1'b0; // don't check SDA output (SCL low)
	            end
	            // read (last SPI bit)
	            spi_rd_a:
	            begin
	                c_state <= #1 spi_rd_b;
	                scl_oen <= #1 1'b0; // set SCL low
	                sda_oen <= #1 1'b1; // tri-state SDA
	                sda_chk <= #1 1'b0; // don't check SDA output
                    spi_rden <= #1 1'b0;    //clear SPI read enable
	            end
	            spi_rd_b:
	            begin
	                c_state <= #1 spi_rd_c;
	                scl_oen <= #1 1'b0; // keep SCL low
	                sda_oen <= #1 1'b1; // keep SDA tri-stated
	                sda_chk <= #1 1'b0; // don't check SDA output
                    spi_rden <= #1 1'b1;    //set SPI read enable
	            end
	            spi_rd_c:
	            begin
	                c_state <= #1 spi_rd_d;
	                scl_oen <= #1 1'b1; // set SCL high
	                sda_oen <= #1 1'b1; // keep SDA tri-stated
	                sda_chk <= #1 1'b0; // don't check SDA output
                    spi_rden <= #1 1'b1;    //set SPI read enable
	            end
	            spi_rd_d:
	            begin
	                c_state <= #1 idle;
	                cmd_ack <= #1 1'b1;
	                scl_oen <= #1 1'b1; // tri-state SCL
	                sda_oen <= #1 1'b1; // keep SDA tri-stated
	                sda_chk <= #1 1'b0; // don't check SDA output
                    spi_rden <= #1 1'b0;    //clear SPI read enable
	            end
	            // write (last SPI bit)
	            spi_wr_a:
	            begin
	                c_state <= #1 spi_wr_b;
	                scl_oen <= #1 1'b0; // set SCL low
	                sda_oen <= #1 dedicated_spi ? din : 1'b1;  // keep SDA tri-stated by default to avoid generating I2C start condition
	                sda_chk <= #1 1'b0; // don't check SDA output
	            end
	            spi_wr_b:
	            begin
	                c_state <= #1 spi_wr_c;
	                scl_oen <= #1 1'b0; // keep SCL low
	                sda_oen <= #1 din;  // set/keep SDA
	                sda_chk <= #1 1'b0; // don't check SDA output
	            end
	            spi_wr_c:
	            begin
	                c_state <= #1 spi_wr_d;
	                scl_oen <= #1 1'b1; // keep SCL high
	                sda_oen <= #1 din;  // keep SDA
	                sda_chk <= #1 1'b0; // don't check SDA output
	            end
	            spi_wr_d:
	            begin
	                c_state <= #1 idle;
	                cmd_ack <= #1 1'b1;
	                scl_oen <= #1 1'b1; // tri-state SCL
	                sda_oen <= #1 dedicated_spi ? din : 1'b1;  // tri-state SDA by default to release bus for I2C mode
	                sda_chk <= #1 1'b0; // don't check SDA output
	            end
	            default:
	                c_state <= #1 idle;
	          endcase
	    end
	// assign scl and sda output (always gnd)
	assign scl_o = 1'b0;
	assign sda_o = 1'b0;
endmodule