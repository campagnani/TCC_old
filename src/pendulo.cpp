#include <pigpio.h>
#include <iostream>
#include <chrono>
#include <thread>
#include <vector>


#define pin_encoder 22

int contador = 0;
double referencia=0;



void conte (int, int, uint32_t)
{
    contador++;
}



int mede_velocidade()
{
    return 0;
}

void controlador_velocidade()
{
    int velocidade = mede_velocidade();
    std::cout<<contador<<std::endl;
}

int PHD(int duty)
{
    if(duty != 0)                            //Se o duty é diferente de 0
    {
        int zm = 10;
        if      (duty > 0)      duty +=  zm; // soma a Zona Morta
        else if (duty < 0)      duty += -zm;
        if      (duty >  100)   duty =  100; // e Verifica Saturacao
        else if (duty < -100)   duty = -100;
    }
    if (duty>0)
    {
        //pwm0.change_duty_cycle(duty);
        //pwm1.change_duty_cycle(0);
    }
    else
    {
        //pwm0.change_duty_cycle(0);
        //pwm1.change_duty_cycle(-duty);
    }
    return duty;
}

bool recebe_dado()
{
	if (std::cin.rdbuf()->in_avail() > 4) //Se tem dado disponivel
	{
		std::cout << "Avaliable:\t"<<std::cin.rdbuf()->in_avail() << std::endl;
		std::vector<uint8_t> bytes = {'=', '0', '0', '0', '0'}; //Crie o vetor
		char *buffer = reinterpret_cast<char*>(bytes.data());	//
		std::cin.readsome(buffer, 5);							//

		switch (bytes[0])
		{
			case '0': //Referencia
				referencia = ( (double)
				(bytes[0] - '0') * 10000 +
				(bytes[1] - '0') * 1000  +
				(bytes[2] - '0') * 100   +
				(bytes[3] - '0') * 10    +
				(bytes[4] - '0')
				)*0.001;
			break;

			case 'x'://Fechar programa
				return 1;
		}
	}
	return 0;
}











int main()
{
	gpioInitialise();
    gpioSetISRFunc(pin_encoder, EITHER_EDGE, 0, conte);
	std::cin.sync_with_stdio(false);
	while (1)
	{
		auto start = std::chrono::high_resolution_clock::now();

		auto t_inicial = std::chrono::system_clock::now();
		if(recebe_dado()) break;
		std::cout << referencia  << std::endl; //<< "\t" << contador << std::endl;
		std::this_thread::sleep_until(t_inicial + std::chrono::microseconds(2000));

		auto end = std::chrono::high_resolution_clock::now();
		auto int_s = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
		//std::cout << "Pendulo:\t" << int_s.count() << std::endl;
	}
	gpioTerminate();
	return 0;
}


//auto start = std::chrono::high_resolution_clock::now();
//auto end = std::chrono::high_resolution_clock::now();
//auto int_s = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
//std::cout << int_s.count() << std::endl;