#include <pigpio.h>
#include <iostream>
#include <chrono>
#include <thread>
#include <vector>


#define pin_encoder 22
#define tax_amo 100

int contador = 0;

double referencia=0;
double velocidade=0;
double Sc=0;



void conte (int, int, uint32_t)
{
    contador++;
}



int mede_velocidade()
{
	static auto t_anterior = std::chrono::high_resolution_clock::now();
	auto t_atual = std::chrono::high_resolution_clock::now();
	double velocidade = contador;
	contador = 0;
	t_anterior = t_atual;
    return velocidade;
}




void controlador_velocidade()
{
    velocidade = mede_velocidade();
}


void sinal_direto()
{
    velocidade = mede_velocidade();
	Sc=PHT(referencia);
}



int PHT(double duty)
{
	double zm   =  0;
	int up   = 12;
	int down =  0;

    if(duty != 0)                            //Se o duty é diferente de 0
    {
        if      (duty >    0)   duty +=   zm; // soma a Zona Morta
        //else if (duty <    0)   duty +=  -zm;
        if      (duty >   up)   duty  =   up; // e Verifica Saturacao
        else if (duty < down)   duty  = down;
    }

    //if (duty>0)
    //{
        pwm0.change_duty_cycle(duty);
        //pwm1.change_duty_cycle(0);
    //}
    //else
    //{
    //    pwm0.change_duty_cycle(0);
    //    pwm1.change_duty_cycle(-duty);
    //}
    return duty;
}

bool recebe_dado()
{
	if (std::cin.rdbuf()->in_avail() > 4) //Se tem dado disponivel
	{
		//std::cout << std::cin.rdbuf()->in_avail() << std::endl;
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
	gpioSetPullUpDown(pin_encoder,PI_PUD_UP);
    gpioSetISRFunc(pin_encoder, EITHER_EDGE, 0, conte);
	std::cin.sync_with_stdio(false);

	auto start = std::chrono::high_resolution_clock::now();
	while (1)
	{
		auto t_inicial = std::chrono::system_clock::now();
		if(recebe_dado()) break;
		controlador_velocidade();
		std::this_thread::sleep_until(t_inicial + std::chrono::milliseconds(tax_amo));
		auto t_atual = std::chrono::duration_cast<std::chrono::milliseconds>(std::chrono::high_resolution_clock::now() - start);
		std::cout << referencia << "\t" << velocidade << "\t" << Sc << "\t" << t_atual.count() << std::endl;
	}
	gpioTerminate();
	return 0;
}


//auto start = std::chrono::high_resolution_clock::now();
//auto end = std::chrono::high_resolution_clock::now();
//auto int_s = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
//std::cout << int_s.count() << std::endl;
