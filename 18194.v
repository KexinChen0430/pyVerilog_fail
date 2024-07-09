module should turn off its bus and only use LFPS to resume
		if(lfps_recv_poll_u1) begin
			lfps_send_u1_local <= 1;
		end else
		//if(lfps_recv_u2lb ) begin
		//	lfps_send_u2lb_local <= 1;
		//end else
		if(lfps_send_ack) begin
			state <= LT_RECOVERY;
		end else
		if(go_u == 3'b110) begin
			// link layer requests U2
			port_power_down <= POWERDOWN_2;
			port_power_go <= 1;
			if(port_power_ack) state <= LT_U2;
		end else
		if(dc == LFPS_BURST_PING_NOM) begin
			// send Ping.LFPS every 200ms
			dc <= 0;
			lfps_send_ping_local <= 1;
		end
	end
	LT_U2: begin
		// U2 power saving state
		if(lfps_recv_u2lb) begin
			lfps_send_u2lb_local <= 1;
		end
		if(lfps_send_ack) begin
			state <= LT_RECOVERY;
		end
	end
	LT_U3: begin
		// U3 power saving state
		if(lfps_recv_u3) begin
			lfps_send_u3_local <= 1;
		end
		if(lfps_send_ack) begin
			state <= LT_RECOVERY;
		end
	end
	LT_RECOVERY: begin
		dc <= -10;
		state <= LT_RECOVERY_WAIT;
	end
	LT_RECOVERY_WAIT: begin
		if(dc == 0) begin
			dc <= 0;
			tc <= 0;
			tsc <= 0;
			port_power_down <= POWERDOWN_0;
			port_power_go <= 1;
			if(port_power_ack) state <= LT_RECOVERY_ACTIVE;
		end
	end
	LT_RECOVERY_ACTIVE: begin
		// send TS1 until 8 consecutive TS are received
		training <= 1;
		train_active <= 1;
		if(train_ts1 | train_ts2) `INC(tc);
		if(tc == 8) begin
			// received 8 consecutive(TODO?) TS1/TS2
			// reset timeout count and proceed
			dc <= 0;
			tc <= 0;
			tsc <= 0;
			state <= LT_RECOVERY_CONFIG;
		end
		if(dc == T_RECOV_ACTIVE) state <= LT_SS_INACTIVE;
	end
	LT_RECOVERY_CONFIG: begin
		training <= 1;
		train_config <= 1;
		// increment TS2 receive count up to 8
		if(train_ts2) begin
			if(tc < 8) `INC(tc);
		end
		// increment TS2 send count, sequence is 2 cycles long
		// (remember we are in 62.5mhz domain, not 125mhz link)
		if(tc > 0) if(tsc < 16*2) `INC(tsc);
		// exit criteria
		// received 8 and sent 16
		if(tc == 8 && tsc == 16*2) begin
			// reset timeout count and proceed
			dc <= 0;
			tc <= 0;
			tsc <= 0;
			state <= LT_RECOVERY_IDLE;
		end
		if(dc == T_RECOV_CONFIG) state <= LT_SS_INACTIVE;
	end
	LT_RECOVERY_IDLE: begin
		training <= 1;
		train_idle <= 1;
		if(train_idle_pass) begin
			// exit conditions:
			// 16 IDLE symbol sent after receiving
			// first of at least 8 symbols.
			dc <= 0;
			if(hot_reset)
				state <= LT_HOTRESET;
			else
				state <= LT_U0;
		end
		if(dc == T_RECOV_IDLE) state <= LT_SS_INACTIVE;
	end
	LT_COMPLIANCE: begin
	end
	LT_LOOPBACK: begin
	end
	LT_HOTRESET: begin
		// reset Link Error Count is done by Link Layer
		if(dc == 3)	state <= LT_HOTRESET_ACTIVE;
	end
	LT_HOTRESET_ACTIVE: begin
		state <= LT_HOTRESET_EXIT;
	end
	LT_HOTRESET_EXIT: begin
		state <= LT_U0;
	end
	LT_RESET: begin
		port_rx_term <= 0;
		port_power_down <= POWERDOWN_2;
		has_trained <= 0;
		state <= LT_RX_DETECT_RESET;
	end
	default: state <= LT_RESET;
	endcase
	///////////////////////////////////////
	// LFPS SEND FSM
	///////////////////////////////////////
	case(lfps_send_state)
	LFPS_RESET: begin
		lfps_send_state <= LFPS_IDLE;
	end
	LFPS_IDLE: begin
		if(!training) begin // port_rx_elecidle_2 &&
			// clear to go
			if(lfps_send_poll_local) begin
				// Polling.LFPS
				sc <= LFPS_POLLING_NOM;
				sic <= LFPS_BURST_POLL_NOM;
				lfps_send_state <= LFPS_SEND_1;
			end else if(lfps_send_ping_local) begin
				// Ping.LFPS
				sc <= LFPS_PING_NOM;
				sic <= LFPS_BURST_PING_NOM;
				lfps_send_state <= LFPS_SEND_1;
			end else if(lfps_send_u1_local) begin
				// U1 Exit
				sc <= LFPS_U1EXIT_NOM;
				sic <= LFPS_U1EXIT_NOM;
				lfps_send_state <= LFPS_SEND_1;
			end else if(lfps_send_u2lb_local) begin
				// U2 Exit
				sc <= LFPS_U2LBEXIT_NOM;
				sic <= LFPS_U2LBEXIT_NOM;
				lfps_send_state <= LFPS_SEND_1;
			end else if(lfps_send_u3_local) begin
				// U3 Exit
				sc <= LFPS_U3WAKEUP_NOM;
				sic <= LFPS_U3WAKEUP_NOM;
				lfps_send_state <= LFPS_SEND_1;
			end
		end
		if(lfps_send_reset_local) begin
			// WarmReset
			lfps_send_state <= LFPS_SEND_1;
		end
	end
	LFPS_SEND_1: begin
		// decide how to send LFPS based on power state
		if(port_power_state == POWERDOWN_0) begin
			port_tx_elecidle <= 1;
			port_tx_detrx_lpbk <= 1;
		end else begin
			port_tx_elecidle <= 0;
		end
		// decrement pulse width and repeat interval
		`DEC(sc);
		`DEC(sic);
		if(sc == 1) lfps_send_state <= LFPS_SEND_2;
		if(lfps_send_reset_local) begin
			// special case here -- WarmReset must be ack'd
			// and in response send LFPS until it's deasserted by host
			lfps_send_state <= lfps_send_state;
			// catch the rising edge
			if(port_rx_elecidle_2) begin
				lfps_send_state <= LFPS_IDLE;
			end
		end
	end
	LFPS_SEND_2: begin
		// decrement repeat interval
		`DEC(sic);
		if(sic == 0) begin
			lfps_send_ack <= 1;
			lfps_send_state <= LFPS_IDLE;
		end
	end
	LFPS_SEND_3: begin
		// keep
	end
	default: lfps_send_state <= LFPS_RESET;
	endcase
	///////////////////////////////////////
	// LFPS RECEIVE FSM
	///////////////////////////////////////
	case(lfps_recv_state)
	LFPS_RESET: begin
		lfps_recv_state <= LFPS_IDLE;
		lfps_recv_poll_u1_prev <= 0;
		lfps_recv_ping_prev <= 0;
	end
	LFPS_IDLE: begin
		// lfps burst begin
		if(~port_rx_elecidle_2 & ~port_rx_valid_2) begin
			rc <= 0;
			lfps_recv_state <= LFPS_RECV_1;
		end
	end
	LFPS_RECV_1: begin
		// lfps burst end
		// detect WarmReset by seeing if LFPS continues past tResetDelay
		if(rc > LFPS_RESET_DELAY) begin
			// want to send LFPS to signal we acknowledge the WarmReset
			// N.B. per spec this is not acceptable during SS.Disabled
			if(~port_rx_elecidle_2) lfps_send_reset_local <= 1;
		end
		if(rc == LFPS_U1EXIT_MIN) begin
			// link partner is sending U1Exit handshake, reciprocate
			lfps_recv_active <= 1;
			lfps_recv_poll_u1 <= 1;
		end
		if(rc == LFPS_U2LBEXIT_MIN) begin
			// link partner is sending U2/LBExit handshake, reciprocate
			lfps_recv_active <= 1;
			lfps_recv_u2lb <= 1;
		end
		if(rc == LFPS_U3WAKEUP_MIN) begin
			// link partner is sending U3 wakeup, reciprocate
			lfps_recv_active <= 1;
			lfps_recv_u3 <= 1;
		end
		// wait for rising edge
		if(port_rx_elecidle_2) begin
			lfps_recv_state <= LFPS_IDLE;
			lfps_recv_active <= 1;
			// reset these by default
			lfps_recv_poll_u1_prev <= 0;
			lfps_recv_ping_prev <= 0;
			ric <= 0;
			if(rc >= LFPS_POLLING_MIN && rc < LFPS_POLLING_MAX) begin
				// Polling.LFPS (or U1.Exit)
				if(lfps_recv_poll_u1_prev) begin
					// we've received this once already
					// now check burst length parameters
					if(ric >= LFPS_BURST_POLL_MIN && ric < LFPS_BURST_POLL_MAX)
						lfps_recv_poll_u1 <= 1;
				end else
					lfps_recv_active <= 0;
				lfps_recv_poll_u1_prev <= 1;
				ric <= 0;
			end else if(rc >= LFPS_PING_MIN && rc < LFPS_PING_MAX) begin
				// Ping.LFPS
				if(lfps_recv_ping_prev) begin
					// we've received this once already
					// now check burst length parameters
					if(ric >= LFPS_BURST_PING_MIN && ric < LFPS_BURST_PING_MAX)
						lfps_recv_ping <= 1;
				end else
					lfps_recv_active <= 0;
				lfps_recv_ping_prev <= 1;
				ric <= 0;
			end else if(rc >= LFPS_RESET_MIN && rc < LFPS_RESET_MAX) begin
				// WarmReset
				lfps_recv_reset <= 1;
			//end else if(rc >= LFPS_U1EXIT_MIN && rc < LFPS_U1EXIT_MAX) begin
				// U1.Exit
			//	lfps_recv_poll_u1 <= 1;
			//end else if(rc >= LFPS_U2LBEXIT_MIN && rc < LFPS_U2LBEXIT_MAX) begin
				// U2/Loopback.Exit
			//	lfps_recv_u2lb <= 1;
			//end else if(rc >= LFPS_U3WAKEUP_MIN && rc < LFPS_U3WAKEUP_MAX) begin
				// U3.Wakeup
			//	lfps_recv_u3 <= 1;
			end else begin
				// invalid burst
				//lfps_recv_state <= LFPS_IDLE;
				lfps_recv_active <= 0;
			end
		end
	end
	LFPS_RECV_2: begin
		// just wait for end of host LFPS to squelch generation of erroneous transfers
		if(port_rx_elecidle_2) begin
			ric <= 0;
			lfps_recv_state <= LFPS_IDLE;
		end
	end
	LFPS_RECV_3: begin
	end
	default: lfps_recv_state <= LFPS_RESET;
	endcase
	if(go_disabled) begin
		// SS.Disabled
		state <= LT_SS_DISABLED;
	end
	//if(hot_reset && state != LT_SS_DISABLED) begin
		// Hot Reset (TS2 Reset bit)
	//	dc <= 0;
	//	state <= LT_HOTRESET;
	//end
	if(lfps_recv_reset && state != LT_SS_DISABLED) begin
		// Warm Reset (LFPS)
		warm_reset <= 1;
		state <= LT_RX_DETECT_RESET;
	end
	if(~reset_n | ~vbus_present_2) begin
		// reset
		state <= LT_RESET;
		lfps_send_state <= LFPS_RESET;
		lfps_recv_state <= LFPS_RESET;
	end
end
endmodule