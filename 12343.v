module
	//The map generator acts as a datapath for the static objects in the game
	always @(posedge clk_vga) begin
			//Starting castle
			if(mapX == 3 && mapY == 5)
				mColor[7:0] <= startCastle[7:0];
			//Central hallway
			else if(mapX == 3 && mapY == 6)
				mColor[7:0] <= hallwayTop[7:0];
			//Right hallway
			else if(mapX == 4 && mapY == 6)
				mColor[7:0] <= hallwayRight[7:0];
			//Black key room
			else if(mapX == 4 && mapY == 7)
				mColor[7:0] <= blackKeyRoom[7:0];
			//Left hallway
			else if(mapX == 2 && mapY == 6)
				mColor[7:0] <= hallwayLeft;
			//South Center Maze
			else if(mapX == 1 && mapY == 6)
				mColor[7:0] <= sCenterMaze;
			//South West Maze
			else if(mapX == 2 && mapY == 4)
				mColor[7:0] <= swMaze;
			//East Center Maze
			else if(mapX == 2 && mapY == 5)
				mColor[7:0] <= eCenterMaze;
			//Center Maze
			else if(mapX == 1 && mapY == 5)
				mColor[7:0] <= centerMaze;
			//North Center Maze
			else if(mapX == 1 && mapY == 4)
				mColor[7:0] <= nCenterMaze;
			//Black Castle
			else if(mapX == 1 && mapY == 3)
				mColor[7:0] <= castle;
			//Challice Room
			else if(mapX == 1 && mapY == 2)
				mColor[7:0] <= startCastle;
			//No map found
			else begin
				mColor[7:0] <= 8'b00000000;
			end
		end
	assign mapData[7:0] = mColor[7:0];
endmodule