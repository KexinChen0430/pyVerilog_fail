module
	//it's being controlled in to prevent data corruption
	always @(posedge turn) begin
		//Movement
		//Progress forward until a wall is hit
		//Pushes back once collision is detected
		if(~(dragState == 1))begin
			if(BUTTON[0] && (playerPosX < 624)) begin
				if(collision)begin
					playerPosX <= playerPosX - 7;
				end
				else begin
					playerPosX <= playerPosX + 1;
				end
			end
			if (BUTTON[1] && (playerPosY < 470)) begin
				if(collision) begin
					playerPosY <= playerPosY - 7;
					end
				else begin
					playerPosY <= playerPosY + 1;
				end
			end
			if(BUTTON[2] && ~(playerPosY <= 10)) begin
				if(collision) begin
					playerPosY <= playerPosY + 7;
					end
				else begin
					playerPosY <= playerPosY - 1;
				end
			end
			if(BUTTON[3] && ~(playerPosX <= 16)) begin
				if(collision) begin
					playerPosX <= playerPosX + 7;
					end
				else begin
					playerPosX <= playerPosX - 1;
				end
			end
		end
		//Map Transition
		//mapX and mapY are stored as seperate values to create a 'grid'
		if(~(playerPosX < 624) && ~(mapX == 8)) begin
			//From SCenter -> NCenter
			if(mapX == 1 && mapY == 6) begin
				mapX <= 1;
				mapY <= 4;
			end
			//ECenter -> Center
			else if(mapX == 2 && mapY == 5) begin
				mapX <= 1;
				mapY <= 5;
			end
			//SW -> SCenter
			else if(mapX == 2 && mapY == 4) begin
				mapX <= 1;
				mapY <= 6;
			end
			//Normal Progression
			else begin
				mapX <= mapX + 1;
			end
			playerPosX <= 20;
		end
		else if(~(playerPosY < 470) && ~(mapY == 8)) begin
			playerPosY <= 14;
			mapY <= mapY + 1;
		end
		else if(playerPosY <= 10 && ~(mapY == 0)) begin
			playerPosY <= 466;
			mapY <= mapY - 1;
		end
		else if(playerPosX <= 16 && ~(mapX == 0)) begin
			//SCenter -> SW
			if(mapX == 1 && mapY == 6) begin
				mapX <= 2;
				mapY <= 4;
			end
			//Center -> ECenter
			else if(mapX == 1 && mapY == 5) begin
				mapX <= 2;
				mapY <= 5;
			end
			//NCenter -> SCenter
			else if(mapX == 1 && mapY == 4) begin
				mapX <= 1;
				mapY <= 6;
			end
			//normal transition
			else begin
				mapX <= mapX - 1;
			end
			playerPosX <= 619;
		end
		//Color for specific maps
		if(mapX == 3 && mapY <= 5) begin
			if(itemGet == 1 && dragState == 2)begin
				playerColor[3:0] <= playerPosX[3:0];
				playerColor[7:4] <= playerPosY[7:4];
			end
			else
				playerColor[7:0] <= 8'b11111100;
		end
		//black key room
		else if(mapX == 1) begin
			//Challice Room
			if(mapY == 2)
				playerColor[7:0] <= 8'b10000111;
			//Black Castle
			else if(mapY == 3)
				playerColor[7:0] <= 8'b00000000;
			//Maze
			else
				playerColor[7:0] <= 8'b00100111;
		end
		//Maze
		else if(mapX == 2	&& mapY < 6)
			playerColor[7:0] <= 8'b00100111;
		//Left hallway
		else if(mapX == 2 && mapY == 6)
			playerColor[7:0] <= 8'b01111000;
		//Middle hallway
		else if(mapX == 3 && mapY == 6)
			playerColor[7:0] <= 8'b00011100;
		//Color not found
		else
			playerColor[7:0] <= 8'b11111111;
		//Reset
		if(SWITCH[3]) begin
			playerPosX <= 320;
			playerPosY <= 380;
			mapX <= 3;
			mapY <= 5;
		end
	end
	//Dragon
	always @(posedge turn) begin
		if(mapX == grundleMapX && mapY == grundleMapY && dragState == 0) begin
			if(playerPosX > grundleX)
				grundleX <= grundleX + 1;
			if(playerPosY > grundleY)
				grundleY <= grundleY + 1;
			if(playerPosX < grundleX)
				grundleX <= grundleX - 1;
			if(playerPosY < grundleY)
				grundleY <= grundleY - 1;
			if(playerPosX == grundleX && playerPosY == grundleY)
				if(itemGet == 1)
					dragState <= 2;
				else
					dragState <= 1;
			else
				dragState <= 0;
		end
		if(SWITCH[3]) begin
			dragState <= 0;
		end
	end
	//Items
	always @(posedge turn)begin
		if(mapX == swordMapX && mapY == swordMapY) begin
			if((playerPosX > swordX -28 && playerPosX < swordX -24) &&  (playerPosY > swordY -4 && playerPosY < swordY +8))begin
				itemGet <= 1;
			end
		end
		if(itemGet == 1) begin
			swordX <= playerPosX +32;
			swordY <= playerPosY;
		end
		if(SWITCH[3]) begin
			itemGet <= 0;
			swordX <= 560;
			swordY <= 240;
		end
		/*
		if(mapX == challiceMapX && mapY == challiceMapY) begin
			if((playerPosX > challiceX -28 && playerPosX < challiceX +4) &&  (playerPosY > challiceY && playerPosY < challiceY +36))begin
				itemGet <= 2'b11;
			end
		end
		if(itemGet == 2'b11) begin
			challiceX <= playerPosX +32;
			challiceY <= playerPosY;
		end
		*/
	end
	//Render loop
	//Draws the dynamic objects within the world
	//It overwrites the mapData with current dynamic object
	always @(posedge clk_vga) begin
			//Draws Grundle advancing
			if((mapX == grundleMapX && mapY == grundleMapY && dragState == 0)
				&& (
						(((CurrentX >= grundleX -12) && (CurrentX < grundleX -8)) && (
								((CurrentY >= grundleY) && (CurrentY <= grundleY+8)) ||
								((CurrentY >= grundleY + 32) && (CurrentY <= grundleY + 52)) ||
								((CurrentY >= grundleY + 60) && (CurrentY <= grundleY + 68))
							))
						||	(((CurrentX >= grundleX -8) && (CurrentX < grundleX -4)) && (
								((CurrentY >= grundleY) && (CurrentY <= grundleY+8)) ||
								((CurrentY >= grundleY +28) && (CurrentY <= grundleY +52)) ||
								((CurrentY >= grundleY +64) && (CurrentY <= grundleY +68))
							))
						|| (((CurrentX >= grundleX -4) && (CurrentX < grundleX)) && (
								((CurrentY >= grundleY) && (CurrentY <= grundleY+8)) ||
								((CurrentY >= grundleY +24) && (CurrentY <= grundleY +36)) ||
								((CurrentY >= grundleY +48) && (CurrentY <= grundleY +56)) ||
								((CurrentY >= grundleY +64) && (CurrentY <= grundleY +72))
							))
						|| (((CurrentX >= grundleX) && (CurrentX < grundleX +4)) && (
								((CurrentY >= grundleY) && (CurrentY <= grundleY+8)) ||
								((CurrentY >= grundleY +20) && (CurrentY <= grundleY +32)) ||
								((CurrentY >= grundleY +48) && (CurrentY <= grundleY +56)) ||
								((CurrentY >= grundleY +68) && (CurrentY <= grundleY +72))
							))
						|| (((CurrentX >= grundleX +4) && (CurrentX < grundleX +8)) && (
								((CurrentY >= grundleY -4) && (CurrentY <= grundleY)) ||
								((CurrentY >= grundleY +4) && (CurrentY <= grundleY +12)) ||
								((CurrentY >= grundleY +20) && (CurrentY <= grundleY +32)) ||
								((CurrentY >= grundleY +48) && (CurrentY <= grundleY +64)) ||
								((CurrentY >= grundleY +68) && (CurrentY <= grundleY +72))
							))
						|| (((CurrentX >= grundleX +8) && (CurrentX < grundleX +12)) && (
								((CurrentY >= grundleY -8) && (CurrentY <= grundleY)) ||
								((CurrentY >= grundleY +4) && (CurrentY <= grundleY +32)) ||
								((CurrentY >= grundleY +44) && (CurrentY <= grundleY +56)) ||
								((CurrentY >= grundleY +60) && (CurrentY <= grundleY +64)) ||
								((CurrentY >= grundleY +68) && (CurrentY <= grundleY +72))
							))
						|| (((CurrentX >= grundleX +12) && (CurrentX < grundleX +16)) && (
								((CurrentY >= grundleY -8) && (CurrentY <= grundleY +12)) ||
								((CurrentY >= grundleY +20) && (CurrentY <= grundleY +52)) ||
								((CurrentY >= grundleY +60) && (CurrentY <= grundleY +72))
							))
						|| (((CurrentX >= grundleX +16) && (CurrentX < grundleX +20)) && (
								((CurrentY >= grundleY -4) && (CurrentY <= grundleY +4)) ||
								((CurrentY >= grundleY +24) && (CurrentY <= grundleY +52))
							))
						)
			) begin
						color[7:0] <= 8'b00011100;
			end
			//Draws grundle eating
			else if((mapX == grundleMapX && mapY == grundleMapY && dragState == 1)
				&& (
						(((CurrentX >= grundleX -12) && (CurrentX < grundleX -8)) && (
								((CurrentY >= grundleY -16) && (CurrentY <= grundleY -12)) ||
								((CurrentY >= grundleY +20) && (CurrentY <= grundleY +24)) ||
								((CurrentY >= grundleY +60) && (CurrentY <= grundleY +72))
							))
						||	(((CurrentX >= grundleX -8) && (CurrentX < grundleX -4)) && (
								((CurrentY >= grundleY -12) && (CurrentY <= grundleY -8)) ||
								((CurrentY >= grundleY +16) && (CurrentY <= grundleY +20)) ||
								((CurrentY >= grundleY +32) && (CurrentY <= grundleY +48)) ||
								((CurrentY >= grundleY +60) && (CurrentY <= grundleY +64)) ||
								((CurrentY >= grundleY +68) && (CurrentY <= grundleY +72))
							))
						|| (((CurrentX >= grundleX -4) && (CurrentX < grundleX)) && (
								((CurrentY >= grundleY -8) && (CurrentY <= grundleY -4)) ||
								((CurrentY >= grundleY +12) && (CurrentY <= grundleY +16)) ||
								((CurrentY >= grundleY +28) && (CurrentY <= grundleY +52)) ||
								((CurrentY >= grundleY +60) && (CurrentY <= grundleY +64)) ||
								((CurrentY >= grundleY +68) && (CurrentY <= grundleY +72))
							))
						|| (((CurrentX >= grundleX) && (CurrentX < grundleX +4)) && (
								((CurrentY >= grundleY -4) && (CurrentY <= grundleY)) ||
								((CurrentY >= grundleY +8) && (CurrentY <= grundleY +12)) ||
								((CurrentY >= grundleY +24) && (CurrentY <= grundleY +56)) ||
								((CurrentY >= grundleY +60) && (CurrentY <= grundleY +64))
							))
						|| (((CurrentX >= grundleX +4) && (CurrentX < grundleX +8)) && (
								((CurrentY >= grundleY -4) && (CurrentY <= grundleY +12)) ||
								((CurrentY >= grundleY +20) && (CurrentY <= grundleY +64))
							))
						|| (((CurrentX >= grundleX +8) && (CurrentX < grundleX +12)) && (
								((CurrentY >= grundleY -8) && (CurrentY <= grundleY)) ||
								((CurrentY >= grundleY +4) && (CurrentY <= grundleY +56))
							))
						|| (((CurrentX >= grundleX +12) && (CurrentX < grundleX +16)) && (
								((CurrentY >= grundleY -8) && (CurrentY <= grundleY +12)) ||
								((CurrentY >= grundleY +20) && (CurrentY <= grundleY +52))
							))
						|| (((CurrentX >= grundleX +16) && (CurrentX < grundleX +20)) && (
								((CurrentY >= grundleY -4) && (CurrentY <= grundleY +4)) ||
								((CurrentY >= grundleY +28) && (CurrentY <= grundleY +48))
						))
					)
			) begin
						color[7:0] <= 8'b00011100;
			end
			//Grundle Slain
			else if((mapX == grundleMapX && mapY == grundleMapY && dragState == 2)
				&& (
						(((CurrentX >= grundleX -12) && (CurrentX < grundleX -8)) && (
								((CurrentY >= grundleY +16) && (CurrentY <= grundleY +36))
							))
						||	(((CurrentX >= grundleX -8) && (CurrentX < grundleX -4)) && (
								((CurrentY >= grundleY +12) && (CurrentY <= grundleY +20)) ||
								((CurrentY >= grundleY +24) && (CurrentY <= grundleY +44)) ||
								((CurrentY >= grundleY +48) && (CurrentY <= grundleY +60))
							))
						|| (((CurrentX >= grundleX -4) && (CurrentX < grundleX)) && (
								((CurrentY >= grundleY +12) && (CurrentY <= grundleY +16)) ||
								((CurrentY >= grundleY +24) && (CurrentY <= grundleY +52)) ||
								((CurrentY >= grundleY +56) && (CurrentY <= grundleY +60))
							))
						|| (((CurrentX >= grundleX) && (CurrentX < grundleX +4)) && (
								((CurrentY >= grundleY +8) && (CurrentY <= grundleY +16)) ||
								((CurrentY >= grundleY +24) && (CurrentY <= grundleY +44)) ||
								((CurrentY >= grundleY +56) && (CurrentY <= grundleY +60))
							))
						|| (((CurrentX >= grundleX +4) && (CurrentX < grundleX +8)) && (
								((CurrentY >= grundleY -8) && (CurrentY <= grundleY +20)) ||
								((CurrentY >= grundleY +24) && (CurrentY <= grundleY +44)) ||
								((CurrentY >= grundleY +48) && (CurrentY <= grundleY +52)) ||
								((CurrentY >= grundleY +56) && (CurrentY <= grundleY +60))
							))
						|| (((CurrentX >= grundleX +8) && (CurrentX < grundleX +12)) && (
								((CurrentY >= grundleY -8) && (CurrentY <= grundleY +8)) ||
								((CurrentY >= grundleY +12) && (CurrentY <= grundleY +20)) ||
								((CurrentY >= grundleY +24) && (CurrentY <= grundleY +40)) ||
								((CurrentY >= grundleY +48) && (CurrentY <= grundleY +52)) ||
								((CurrentY >= grundleY +56) && (CurrentY <= grundleY +60))
							))
						|| (((CurrentX >= grundleX +12) && (CurrentX < grundleX +16)) && (
								((CurrentY >= grundleY +4) && (CurrentY <= grundleY +20)) ||
								((CurrentY >= grundleY +28) && (CurrentY <= grundleY +40)) ||
								((CurrentY >= grundleY +48) && (CurrentY <= grundleY +60))
							))
						|| (((CurrentX >= grundleX +16) && (CurrentX < grundleX +20)) && (
								((CurrentY >= grundleY +8) && (CurrentY <= grundleY +16))
						))
					)
			) begin
				color[7:0] <= 8'b00011100;
			end
			//Challice
			else if((dragState == 2) && (
					(((CurrentX >= swordX) && (CurrentX < swordX +4)) && (
								((CurrentY >= swordY) && (CurrentY <= swordY +12))
					))
				|| (((CurrentX >= swordX +4) && (CurrentX < swordX +8)) && (
								((CurrentY >= swordY +8) && (CurrentY <= swordY +20)) ||
								((CurrentY >= swordY +32) && (CurrentY <= swordY +36))
					))
				|| (((CurrentX >= swordX +8) && (CurrentX < swordX +12)) && (
								((CurrentY >= swordY +12) && (CurrentY <= swordY +24)) ||
								((CurrentY >= swordY +32) && (CurrentY <= swordY +36))
					))
				|| (((CurrentX >= swordX +12) && (CurrentX < swordX +16)) && (
								((CurrentY >= swordY +12) && (CurrentY <= swordY +36))
					))
				|| (((CurrentX >= swordX +16) && (CurrentX < swordX +20)) && (
								((CurrentY >= swordY +12) && (CurrentY <= swordY +36))
					))
				|| (((CurrentX >= swordX +20) && (CurrentX < swordX +24)) && (
								((CurrentY >= swordY +12) && (CurrentY <= swordY +24)) ||
								((CurrentY >= swordY +32) && (CurrentY <= swordY +36))
					))
				|| (((CurrentX >= swordX +24) && (CurrentX < swordX +28)) && (
								((CurrentY >= swordY +8) && (CurrentY <= swordY +20)) ||
								((CurrentY >= swordY +32) && (CurrentY <= swordY +36))
					))
				|| (((CurrentX >= swordX +28) && (CurrentX < swordX +32)) && (
								((CurrentY >= swordY) && (CurrentY <= swordY +12))
					))
				)
			) begin
				color[3:0] <= playerPosX[3:0];
				color[7:4] <= playerPosY[7:4];
			end
			else if((((mapX == swordMapX && mapY == swordMapY) || (itemGet == 1)) && ~(dragState == 2)) && (
					(((CurrentY >= swordY -8) && (CurrentY < swordY -4)) && (
								((CurrentX >= swordX -20) && (CurrentX <= swordX -16))
					))
				|| (((CurrentY >= swordY -4) && (CurrentY < swordY)) && (
								((CurrentX >= swordX -24) && (CurrentX <= swordX -20))
					))
				|| (((CurrentY >= swordY) && (CurrentY < swordY +4)) && (
								((CurrentX >= swordX -28) && (CurrentX <= swordX))
					))
				|| (((CurrentY >= swordY +4) && (CurrentY < swordY +8)) && (
								((CurrentX >= swordX -24) && (CurrentX <= swordX -20))
					))
				|| (((CurrentY >= swordY +8) && (CurrentY < swordY +12)) && (
								((CurrentX >= swordX -20) && (CurrentX <= swordX -16))
					))
				)
			)
				color[7:0] <= 8'b11111100;
			//Draws the player
			else if((CurrentY < playerPosY+9) && (CurrentX < playerPosX+9) && ~(CurrentY < playerPosY-9) && ~(CurrentX < playerPosX-9))begin
					color[7:0] <= playerColor[7:0];
					//Collision is determined by color rather than hitboxes for memory purposes
					if(mapData[7:0] == playerColor[7:0] && ~(mapX == 1 && mapY == 3 && CurrentX > 256 && CurrentX < 384)) begin
						collision <= 1;
					end
					else begin
						collision <= 0;
					end
			end
			//Finally draws the map
			else
				color[7:0] <= mapData;
		end
endmodule