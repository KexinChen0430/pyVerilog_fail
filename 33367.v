module FSM_tb();
	//SaÃ­das (entradas da FSM)
	reg CLOCK_tb;
	reg RESET_tb;
	reg B1_tb;
	reg B2_tb;
	reg B3_tb;
	reg B4_tb;
	reg READY_tb;
	reg [1:0] RND_tb;
	reg [6:0] DISP_SU_tb;
   reg [6:0] DISP_SD_tb;
   reg [6:0] DISP_SC_tb;
   reg [6:0] DISP_SM_tb;
	//Entradas (saÃ­das da FSM)
	wire L1_tb;
	wire L2_tb;
	wire L3_tb;
	wire L4_tb;
	wire [1:0] SET_tb;
 	wire [6:0] DISP1_tb;
	wire [6:0] DISP2_tb;
	wire [6:0] DISP3_tb;
	wire [6:0] DISP4_tb;
	wire [11:0] SCORE_tb;
	wire [5:0] C_S_tb;
	FSM FSM1(
		.CLK(CLOCK_tb),
		.RST(RESET_tb),
		.SET(SET_tb),
		.READY(READY_tb),
		.B1(B1_tb),
		.B2(B2_tb),
		.B3(B3_tb),
		.B4(B4_tb),
		.L1(L1_tb),
		.L2(L2_tb),
		.L3(L3_tb),
		.L4(L4_tb),
		.DISP1(DISP1_tb),
		.DISP2(DISP2_tb),
		.DISP3(DISP3_tb),
		.DISP4(DISP4_tb),
		.RND(RND_tb),
		.SCORE(SCORE_tb),
		.DISP_SU(DISP_SU_tb),
		.DISP_SD(DISP_SD_tb),
		.DISP_SC(DISP_SC_tb),
		.DISP_SM(DISP_SM_tb),
		.C_S(C_S_tb)
	);
	//ParametrizaÃ§Ã£o de cores
	parameter	Verde=2'b00,
					Vermelho=2'b01,
					Azul=2'b10,
					Amarelo=2'b11;
	reg [1:0] cor; //Cor atual
	reg [1:0] vetor_cores [0:31];
	integer i, j; //Inteiros usados para repetiÃ§Ãµes
	always
	begin
		#0.5 CLOCK_tb = ~CLOCK_tb;
	end
	always@(posedge CLOCK_tb)
		RND_tb = RND_tb + 1;
	initial		//tasks ao final
	begin
		$display("==================================//\\\\==================================");
		$display("|                 Testbench Modulo FSM: Clock = 40ns                   |");
		$display("==================================\\\\//==================================");
		CLOCK_tb = 0;
		RND_tb = 2'b00;
		B1_tb = 1;
		B2_tb = 1;
		B3_tb = 1;
		B4_tb = 1;
		READY_tb = 0;
		RESET_tb = 0;
		DISP_SU_tb = 0;
		DISP_SD_tb = 0;
		DISP_SC_tb = 0;
		DISP_SM_tb = 0;
		#1 reseta;
		estado_atual;
		newline;
		$display("==================================//\\\\==================================");
		$display("|  Caso de teste 1: Ganha, single player, dificuldade 1, velocidade 1  |");
		$display("==================================\\\\//==================================");
		$display("--- Menu Inicial ---\n");
		#1 aperta_sel2;
		update_score;
		#5 aperta_sel2;
		#5 aperta_sel2;
		#5 aperta_sel2;
		newline;
		#1.5 $display("--- Geracao de Cores ---\n");
		for(i=0; i<8; i=i+1) begin
			$display("- Turno: %0d -\n", i+1);
			for(j=0; j<=i; j=j+1) begin
				#2 is_ready;
				checar_cor;
				if(j==i) begin
					recebe_cor(cor);
					vetor_cores[i] = cor;
				end
				#2 is_ready;
			end
			newline;
			for(j=0; j<=i; j=j+1) begin
				#(2+i) apertar_cor(vetor_cores[j]);
				#2 update_score;
			end
			#3 newline;
			$display("Score: %0d\n", SCORE_tb);
		end
		$display("--- Encerramento de Partida ---\n");
		#1 is_ready;
		$display("Score: %0d\n", SCORE_tb);
		#1 aperta_sel1;
		newline;
		newline;
		$stop;
		$display("==================================//\\\\==================================");
		$display("|   Caso de teste 2: P1 ganha, desafio, dificuldade 3, velocidade 2    |");
		$display("==================================\\\\//==================================");
		#5 reseta;
		$display("--- Menu Inicial ---\n");
		#1 aperta_sel2;
		update_score;
		$display("%0tms: DISP = Mod1", $time);
		#2 aperta_sel1;
		newline;
		$display("%0tms: DISP = Mod2", $time);
		#2 aperta_sel2;
		newline;
		$display("%0tms: DISP = DiF1", $time);
		#2 aperta_sel1;
		newline;
		$display("%0tms: DISP = DiF2", $time);
		#2 aperta_sel1;
		newline;
		$display("%0tms: DISP = DiF3", $time);
		#5 aperta_sel2;
		newline;
		$display("%0tms: DISP = VEL1", $time);
		#2 aperta_sel1;
		newline;
		$display("%0tms: DISP = VEL2", $time);
		#5 aperta_sel2;
		newline;
		$display("%0tms: DISP =   P1", $time);
		newline;
		#2 $display("--- Geracao de Cores ---\n");
		$display("%0tms: Jogador 1 escolhe:", $time);
		apertar_cor(Azul);
		newline;
		$display("%0tms: Jogador 2 joga:", $time);
		$display("%0tms: DISP =   P2", $time);
		#1 is_ready;
		#1 is_ready;
		checar_cor;
		#1 is_ready;
		#3 apertar_cor(Azul);
		#3 $display("%0tms: Score: %0d", $time, SCORE_tb);
		#2 update_score;
		#1 is_ready;
		newline;
		$display("%0tms: Jogador 2 escolhe:", $time);
		$display("%0tms: DISP = nCor", $time);
		#1 apertar_cor(Amarelo);
		newline;
		$display("%0tms: Jogador 1 joga:", $time);
		$display("%0tms: DISP =   P1", $time);
		#1 is_ready;
		#1 is_ready;
		checar_cor;
		#1 is_ready;
		#1 is_ready;
		checar_cor;
		#1 is_ready;
		#3 apertar_cor(Azul);
		#3 $display("%0tms: Score: %0d", $time, SCORE_tb);
		#2 update_score;
		#3 apertar_cor(Amarelo);
		#3 $display("%0tms: Score: %0d", $time, SCORE_tb);
		#2 update_score;
		#1 is_ready;
		newline;
		$display("%0tms: Jogador 1 escolhe:", $time);
		$display("%0tms: DISP = nCor", $time);
		#1 apertar_cor(Verde);
		newline;
		$display("%0tms: Jogador 2 joga:", $time);
		$display("%0tms: DISP =   P2", $time);
		#1 is_ready;
		#1 is_ready;
		checar_cor;
		#1 is_ready;
		#1 is_ready;
		checar_cor;
		#1 is_ready;
		#1 is_ready;
		checar_cor;
		#1 is_ready;
		#3 apertar_cor(Azul);
		#3 $display("%0tms: Score: %0d", $time, SCORE_tb);
		#2 update_score;
		#3 apertar_cor(Amarelo);
		#3 $display("%0tms: Score: %0d", $time, SCORE_tb);
		#2 update_score;
		#3 apertar_cor(Vermelho);
		#1 $display("%0tms: DISP = Erro", $time);
		newline;
		$display("--- Jogador 2 errou: Deathmatch ---\n");
		#2 is_ready;
		$display("%0tms: Jogador 1 joga:", $time);
		$display("%0tms: DISP =   P1", $time);
		#1 is_ready;
		checar_cor;
		#1 is_ready;
		#1 is_ready;
		checar_cor;
		#1 is_ready;
		#1 is_ready;
		checar_cor;
		#1 is_ready;
		#3 apertar_cor(Azul);
		#3 $display("%0tms: Score: %0d", $time, SCORE_tb);
		#2 update_score;
		#3 apertar_cor(Amarelo);
		#3 $display("%0tms: Score: %0d", $time, SCORE_tb);
		#2 update_score;
		#3 apertar_cor(Verde);
		#2 update_score;
		newline;
		$display("--- Encerramento de partida ---\n");
		#1 $display("%0tms: DISP = GAnh", $time);
		#1 is_ready;
		#1 $display("%0tms: DISP = P1gA", $time);
		#1 is_ready;
		#3 $display("%0tms: Score: %0d\n", $time, SCORE_tb);
		#2 aperta_sel1;
		newline;
		#10
		$display("==================================//\\\\==================================");
		$display("|                           Fim do Testbench                           |");
		$display("==================================\\\\//==================================");
		$stop;
	end
	//Tasks
	//Tasks para botÃµes e luzes
	task reseta;
	begin
		RESET_tb = 1;
		#6 RESET_tb = 0;
		$display("%0tms: Reset efetuado.", $time);
	end
	endtask
	task passa_segundo;
	input [1:0] tempo;
	begin
		if (tempo == 1) begin
			#1000;
			$display("%0tms: 1s se passou.", $time);
		end
		else if (tempo == 2) begin
			#2000;
			$display("%0tms: 2s se passaram.", $time);
		end
		else if (tempo == 3) begin
			#3000;
			$display("%0tms: 3s se passaram.", $time);
		end
	end
	endtask
	task aperta_sel1;
	begin
		B1_tb = 0;
		#5 B1_tb = 1;
		$display("%0tms: B1 foi pressionado.", $time);
	end
	endtask
	task aperta_sel2;
	begin
		B2_tb = 0;
		#5 B2_tb = 1;
		$display("%0tms: B2 foi pressionado.", $time);
	end
	endtask
	task apertar_cor;
	input [1:0] cor;
	begin
		case(cor)
		0:
		begin
			B1_tb = 0;
			#5 B1_tb = 1;
			$display("%0tms: B1 foi pressionado.", $time);
		end
		1:
		begin
			B2_tb = 0;
			#5 B2_tb = 1;
			$display("%0tms: B2 foi pressionado.", $time);
		end
		2:
		begin
			B3_tb = 0;
			#5 B3_tb = 1;
			$display("%0tms: B3 foi pressionado.", $time);
		end
		3:
		begin
			B4_tb = 0;
			#5 B4_tb = 1;
			$display("%0tms: B4 foi pressionado.", $time);
		end
		endcase
	end
	endtask
	task recebe_cor;
	output [1:0] cor;
	begin
		if(L1_tb == 1) begin
			cor = Verde;
		end
		else if (L2_tb == 1) begin
			cor = Vermelho;
		end
		else if (L3_tb == 1) begin
			cor = Azul;
		end
		else if (L4_tb == 1) begin
			cor = Amarelo;
		end
	end
	endtask
	//Tasks para lidar com pontuaÃ§Ãµes
	task checar_display; //Checa se o resultado esperado estÃ¡ sendo exibido no display
		begin
			$display("%0tms: Display 1: %b", $time, DISP1_tb);
			$display("%0tms: Display 2: %b", $time, DISP2_tb);
			$display("%0tms: Display 3: %b", $time, DISP3_tb);
			$display("%0tms: Display 4: %b", $time, DISP4_tb);
		end
		endtask
	task checar_cor;
		begin
			if(L1_tb == 1) begin
				$display("%0tms: Cor Verde acendeu.", $time);
			end
			if (L2_tb == 1) begin
				$display("%0tms: Cor Vermelha acendeu.", $time);
			end
			if (L3_tb == 1) begin
				$display("%0tms: Cor Azul acendeu.", $time);
			end
			if (L4_tb == 1) begin
				$display("%0tms: Cor Amarela acendeu.", $time);
			end
		end
	endtask
	task is_ready;
	begin
		case(SET_tb)
			1: begin
				READY_tb = 1;
				#1 READY_tb = 0;
			end
			2: begin
				READY_tb = 1;
				#1 READY_tb = 0;
			end
			3: begin
				READY_tb = 1;
				#1 READY_tb = 0;
			end
			0: begin
				READY_tb = 1;
				#1 READY_tb = 0;
			end
		endcase
	end
	endtask
	task estado_atual;
	begin
		$display("%0tms: Estado atual: %b", $time, C_S_tb);
	end
	endtask
	task newline;
	begin
		$display("");
	end
	endtask
	task update_score;			//reproducao do modulo score para converter valores
	reg [3:0] SCORE_U;
	reg [3:0] SCORE_D;
	reg [3:0] SCORE_C;
	reg [3:0] SCORE_M;
	begin
		SCORE_U=0;
		SCORE_D=0;
		SCORE_C=0;
		SCORE_M=0;
		SCORE_M = SCORE_tb / 1000;
		SCORE_C = (SCORE_tb - SCORE_M*1000) / 100;
		SCORE_D = ((SCORE_tb - SCORE_M*1000) - SCORE_C*100) / 10;
		SCORE_U = ((SCORE_tb - SCORE_M*1000) - SCORE_C*100) - SCORE_D*10;
		case (SCORE_M) //Milhares
			0: DISP_SM_tb = 7'b1111110;
			1: DISP_SM_tb = 7'b0110000;
			2: DISP_SM_tb = 7'b1101101;
			3: DISP_SM_tb = 7'b1111001;
			4: DISP_SM_tb = 7'b0110011;
			5: DISP_SM_tb = 7'b1011011;
			6: DISP_SM_tb = 7'b1011111;
			7: DISP_SM_tb = 7'b1110000;
			8: DISP_SM_tb = 7'b1111111;
			9: DISP_SM_tb = 7'b1111011;
			default: DISP_SM_tb = 7'b0000000;
		endcase
		case (SCORE_C) //Centenas
			0: DISP_SC_tb = 7'b1111110;
			1: DISP_SC_tb = 7'b0110000;
			2: DISP_SC_tb = 7'b1101101;
			3: DISP_SC_tb = 7'b1111001;
			4: DISP_SC_tb = 7'b0110011;
			5: DISP_SC_tb = 7'b1011011;
			6: DISP_SC_tb = 7'b1011111;
			7: DISP_SC_tb = 7'b1110000;
			8: DISP_SC_tb = 7'b1111111;
			9: DISP_SC_tb = 7'b1111011;
			default: DISP_SC_tb = 7'b0000000;
		endcase
		case (SCORE_D) //Dezenas
			0: DISP_SD_tb = 7'b1111110;
			1: DISP_SD_tb = 7'b0110000;
			2: DISP_SD_tb = 7'b1101101;
			3: DISP_SD_tb = 7'b1111001;
			4: DISP_SD_tb = 7'b0110011;
			5: DISP_SD_tb = 7'b1011011;
			6: DISP_SD_tb = 7'b1011111;
			7: DISP_SD_tb = 7'b1110000;
			8: DISP_SD_tb = 7'b1111111;
			9: DISP_SD_tb = 7'b1111011;
			default: DISP_SD_tb = 7'b0000000;
		endcase
		case (SCORE_U) //Unidades
			0: DISP_SU_tb = 7'b1111110;
			1: DISP_SU_tb = 7'b0110000;
			2: DISP_SU_tb = 7'b1101101;
			3: DISP_SU_tb = 7'b1111001;
			4: DISP_SU_tb = 7'b0110011;
			5: DISP_SU_tb = 7'b1011011;
			6: DISP_SU_tb = 7'b1011111;
			7: DISP_SU_tb = 7'b1110000;
			8: DISP_SU_tb = 7'b1111111;
			9: DISP_SU_tb = 7'b1111011;
			default: DISP_SU_tb = 7'b0000000;
		 endcase
		end
	endtask
	//Final das tasks
endmodule