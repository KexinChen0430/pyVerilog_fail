module
									next_e = e * exponentiation_result ;
								end
								next_input_enable = 0;
								if (data >= 5) begin
									next_done = 1;
								end else begin
									next_done = 0;
								end
								next_index = index + 1;
								next_has_index_changed = 1;
								next_is_exponentiation_already_reset = 1;
							end else begin
								next_input_enable = 1;
								next_done = 0;
								next_index = index;
								next_e = e;
								next_has_index_changed = 0;
								next_is_exponentiation_already_reset = 0;
							end
						end else begin
							next_input_enable = 0; // don't change the exppnent finder
							next_done = 0;
							next_index = index; // keep the prime
							next_e = e;
							next_has_index_changed = 0;
							next_is_exponentiation_already_reset = 1;
						end
					end
				end else begin
					next_is_exponentiation_already_reset = 0;
					next_reset_exponentiation = 0;
					next_input_enable = 1;
					next_done = 0;
					next_index = index;
					next_e = e;
					next_has_index_changed = 0;
				end
			end
		end else begin
			next_input_enable = 0;
			next_done = 0;
			next_index = 1;
			next_e = e;
			next_has_index_changed = 0;
			next_is_exponentiation_already_reset = 0;
			next_reset_exponentiation = 1;
		end
	end
endmodule