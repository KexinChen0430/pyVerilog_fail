module can react
			//and change its available state - so that we do not begin with preparation too early
			decreasePrepare <= 1;
		end else begin
			scryptResultAvailable <= 0;
			decreasePrepare <= 0;
		end
		//increment preparing counter
		if(pipelineReady & scheduleTask & (workCounter == 3) & ~decreasePrepare & ~doWork) begin
			preparing <= preparing +1;
		end
		//it is safe now to decrease count of items being prepared
		if(~(pipelineReady & scheduleTask & (workCounter == 3)) & decreasePrepare & ~doWork) begin
			preparing <= preparing - 1;
		end
	end
endmodule