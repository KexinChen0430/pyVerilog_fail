module make a signal with a half-second period of time.
		input wire clk,
		input wire reset,
		output wire time_out
		);
	reg [24:0] clk_number; //Счетчик тактов, на Waveshare CoreEP4CE10 установлен источник 50МГц сигнала.
								  //Clock counter, Waveshare CoreEP4CE10 have 50MHz global clk. Need just half.
	reg [0:0] sec_kp;		  //Для хранения значения выходного сигнала между отсчетами.
								  //A signal keeper.
	assign time_out = sec_kp; //Соединение выходного провода time_out модуля с регистром sec_kp.
									  //Операция assign не может быть выполнена в поведенческом always блоке.
	//Поведенческий always блок. Только в нем возможно использованием ветвлений и циклов.
	always @(posedge clk) //Источник тактового сигнала установлен на плате, частота 50МГц.
	begin
		if (!reset) //Кнопка сброса также уже смонтирована на CoreEP4CE10, инверсная логика.
			begin					//A zero level is active.
				clk_number <= 25'd0;
				sec_kp <= 1'd0; //Сброс регистров в начальное (нулевое) состояние.
									 //Неблокирующее присваивание "<=". Присвоение регистров произойдет одновременно, параллельно.
									 //Формат 1'd0: число до апострофа указывает на то сколько бит необходимо для хранения константы,
									 //буква после апострофа говорит о записи идущего следом числа (b - двоичная, d - десятичная и т.д.)
			end
		else			//Если нога сброса подтянута к Vcc (не нажата кнопка), находится в z состоянии
						//или даже в неопределенном (x). В общем там не ноль, то...
			begin
				if (clk_number <= 25'd25000000) 		//Проверка значения счетчика тактов, если не отсчитано 25 миллионов,
					clk_number <= clk_number + 25'd1; //то продолжить отсчет
				else				//A half-second is gone.
					clk_number <= 25'd0; //иначе счетчик заполнен, сбросить его в ноль.
				if (clk_number > 25'd12500000) //Период сигнала здесь пол-секунды.
					sec_kp <= 1'd1; //Четверть секунды удерживается единица.
									//A quarter-second to do high output.
				else
					sec_kp <= 1'd0; //Вторую четверть - ноль.
									//Next quarter to do low output.
			end
	end
endmodule